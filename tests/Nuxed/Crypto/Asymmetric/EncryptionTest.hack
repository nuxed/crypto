namespace Nuxed\Test\Crypto\Asymmetric;

use namespace HH\Lib\Str;
use namespace HH\Lib\Experimental\File;
use namespace Facebook\HackTest;
use namespace Nuxed\Crypto;
use namespace Nuxed\Crypto\Asymmetric;
use namespace HH\Lib\SecureRandom;
use function Facebook\FBExpect\expect;

class EncryptionTest extends HackTest\HackTest {
  public async function testEncryptAndDecrypt(): Awaitable<void> {
    $aliceEncryptionPrivateSecret = await $this->import<
      Asymmetric\Encryption\Secret\PrivateSecret,
    >('asymmetric.encryption.private');
    $aliceEncryptionPublicSecret = await $this->import<
      Asymmetric\Encryption\Secret\PublicSecret,
    >('asymmetric.encryption.public');
    $bobEncryptionPrivateSecret = await $this->import<
      Asymmetric\Encryption\Secret\PrivateSecret,
    >('bob.asymmetric.encryption.private');
    $bobEncryptionPublicSecret = await $this->import<
      Asymmetric\Encryption\Secret\PublicSecret,
    >('bob.asymmetric.encryption.public');


    // Actor : alice
    $message = new Crypto\HiddenString('Hello Bob');
    $toBob = Asymmetric\Encryption\encrypt(
      $message,
      $aliceEncryptionPrivateSecret,
      $bobEncryptionPublicSecret,
    );

    // Actor : bob
    $fromAlice = Asymmetric\Encryption\decrypt(
      $toBob,
      $bobEncryptionPrivateSecret,
      $aliceEncryptionPublicSecret,
    );

    expect($fromAlice->toString())->toBeSame('Hello Bob');

    $message = new Crypto\HiddenString('Hey Alice');
    $toAlice = Asymmetric\Encryption\encrypt(
      $message,
      $bobEncryptionPrivateSecret,
      $aliceEncryptionPublicSecret,
    );

    // Actor : alice
    $fromBob = Asymmetric\Encryption\decrypt(
      $toAlice,
      $aliceEncryptionPrivateSecret,
      $bobEncryptionPublicSecret,
    );

    expect($fromBob->toString())->toBeSame('Hey Alice');
  }

  // Anonymous Encryption
  public async function testSealAndUnseal(): Awaitable<void> {
    $aliceEncryptionPrivateSecret = await $this->import<
      Asymmetric\Encryption\Secret\PrivateSecret,
    >('asymmetric.encryption.private');
    $aliceEncryptionPublicSecret = await $this->import<
      Asymmetric\Encryption\Secret\PublicSecret,
    >('asymmetric.encryption.public');

    // Actor : anonymous
    $message = new Crypto\HiddenString('Hello Alice');
    $encrypted = Asymmetric\Encryption\seal(
      $message,
      $aliceEncryptionPublicSecret,
    );

    // Actor : alice
    $recieved = Asymmetric\Encryption\unseal(
      $encrypted,
      $aliceEncryptionPrivateSecret,
    );

    expect($recieved->toString())->toBeSame('Hello Alice');
  }

  <<HackTest\DataProvider('provideRandomStrings')>>
  public async function testEncryptAndDecryptRandom(
    string $data,
  ): Awaitable<void> {
    list($aliceEncryptionPrivateSecret, $aliceEncryptionPublicSecret) =
      Asymmetric\Encryption\Secret::generate();
    list($bobEncryptionPrivateSecret, $bobEncryptionPublicSecret) =
      Asymmetric\Encryption\Secret::generate();

    // Actor : alice
    $message = new Crypto\HiddenString($data);
    $toBob = Asymmetric\Encryption\encrypt(
      $message,
      $aliceEncryptionPrivateSecret,
      $bobEncryptionPublicSecret,
    );

    // Actor : bob
    $fromAlice = Asymmetric\Encryption\decrypt(
      $toBob,
      $bobEncryptionPrivateSecret,
      $aliceEncryptionPublicSecret,
    );

    expect($fromAlice->toString())->toBeSame($data);

    $message = new Crypto\HiddenString(Str\reverse($data));
    $toAlice = Asymmetric\Encryption\encrypt(
      $message,
      $bobEncryptionPrivateSecret,
      $aliceEncryptionPublicSecret,
    );

    // Actor : alice
    $fromBob = Asymmetric\Encryption\decrypt(
      $toAlice,
      $aliceEncryptionPrivateSecret,
      $bobEncryptionPublicSecret,
    );

    expect($fromBob->toString())->toBeSame(Str\reverse($data));
  }

  <<HackTest\DataProvider('provideRandomStrings')>>
  public async function testSealAndUnsealRandom(string $data): Awaitable<void> {
    list($aliceEncryptionPrivateSecret, $aliceEncryptionPublicSecret) =
      Asymmetric\Encryption\Secret::generate();

    // Actor : anonymous
    $message = new Crypto\HiddenString($data);
    $encrypted = Asymmetric\Encryption\seal(
      $message,
      $aliceEncryptionPublicSecret,
    );

    // Actor : alice
    $recieved = Asymmetric\Encryption\unseal(
      $encrypted,
      $aliceEncryptionPrivateSecret,
    );

    expect($recieved->toString())->toBeSame($data);
  }

  public function provideRandomStrings(): Container<(string)> {
    $ret = vec[];
    for ($i = 0; $i < 100; $i++) {
      $ret[] = tuple(Crypto\Hex\encode(SecureRandom\string(($i + 5) * 8)));
    }

    return $ret;
  }

  private async function import<reify T as Asymmetric\Secret>(
    string $name,
  ): Awaitable<T> {
    await using (
      $file = File\open_read_only(__DIR__.'/../../../secrets/'.$name.'.key')
    ) {
      return T::import(new Crypto\HiddenString(await $file->readAsync()));
    }
  }
}
