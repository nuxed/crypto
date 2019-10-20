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
    $aliceEncryptionPrivateKey = await $this->import<
      Asymmetric\Encryption\Key\PrivateKey,
    >('asymmetric.encryption.private');
    $aliceEncryptionPublicKey = await $this->import<
      Asymmetric\Encryption\Key\PublicKey,
    >('asymmetric.encryption.public');
    $bobEncryptionPrivateKey = await $this->import<
      Asymmetric\Encryption\Key\PrivateKey,
    >('bob.asymmetric.encryption.private');
    $bobEncryptionPublicKey = await $this->import<
      Asymmetric\Encryption\Key\PublicKey,
    >('bob.asymmetric.encryption.public');


    // Actor : alice
    $message = new Crypto\HiddenString('Hello Bob');
    $toBob = Asymmetric\Encryption\encrypt(
      $message,
      $aliceEncryptionPrivateKey,
      $bobEncryptionPublicKey,
    );

    // Actor : bob
    $fromAlice = Asymmetric\Encryption\decrypt(
      $toBob,
      $bobEncryptionPrivateKey,
      $aliceEncryptionPublicKey,
    );

    expect($fromAlice->toString())->toBeSame('Hello Bob');

    $message = new Crypto\HiddenString('Hey Alice');
    $toAlice = Asymmetric\Encryption\encrypt(
      $message,
      $bobEncryptionPrivateKey,
      $aliceEncryptionPublicKey,
    );

    // Actor : alice
    $fromBob = Asymmetric\Encryption\decrypt(
      $toAlice,
      $aliceEncryptionPrivateKey,
      $bobEncryptionPublicKey,
    );

    expect($fromBob->toString())->toBeSame('Hey Alice');
  }

  // Anonymous Encryption
  public async function testSealAndUnseal(): Awaitable<void> {
    $aliceEncryptionPrivateKey = await $this->import<
      Asymmetric\Encryption\Key\PrivateKey,
    >('asymmetric.encryption.private');
    $aliceEncryptionPublicKey = await $this->import<
      Asymmetric\Encryption\Key\PublicKey,
    >('asymmetric.encryption.public');

    // Actor : anonymous
    $message = new Crypto\HiddenString('Hello Alice');
    $encrypted = Asymmetric\Encryption\seal(
      $message,
      $aliceEncryptionPublicKey,
    );

    // Actor : alice
    $recieved = Asymmetric\Encryption\unseal(
      $encrypted,
      $aliceEncryptionPrivateKey,
    );

    expect($recieved->toString())->toBeSame('Hello Alice');
  }

  <<HackTest\DataProvider('provideRandomStrings')>>
  public async function testEncryptAndDecryptRandom(
    string $data,
  ): Awaitable<void> {
    list($aliceEncryptionPrivateKey, $aliceEncryptionPublicKey) =
      Asymmetric\Encryption\Key::generate();
    list($bobEncryptionPrivateKey, $bobEncryptionPublicKey) =
      Asymmetric\Encryption\Key::generate();

    // Actor : alice
    $message = new Crypto\HiddenString($data);
    $toBob = Asymmetric\Encryption\encrypt(
      $message,
      $aliceEncryptionPrivateKey,
      $bobEncryptionPublicKey,
    );

    // Actor : bob
    $fromAlice = Asymmetric\Encryption\decrypt(
      $toBob,
      $bobEncryptionPrivateKey,
      $aliceEncryptionPublicKey,
    );

    expect($fromAlice->toString())->toBeSame($data);

    $message = new Crypto\HiddenString(Str\reverse($data));
    $toAlice = Asymmetric\Encryption\encrypt(
      $message,
      $bobEncryptionPrivateKey,
      $aliceEncryptionPublicKey,
    );

    // Actor : alice
    $fromBob = Asymmetric\Encryption\decrypt(
      $toAlice,
      $aliceEncryptionPrivateKey,
      $bobEncryptionPublicKey,
    );

    expect($fromBob->toString())->toBeSame(Str\reverse($data));
  }

  <<HackTest\DataProvider('provideRandomStrings')>>
  public async function testSealAndUnsealRandom(string $data): Awaitable<void> {
    list($aliceEncryptionPrivateKey, $aliceEncryptionPublicKey) =
      Asymmetric\Encryption\Key::generate();

    // Actor : anonymous
    $message = new Crypto\HiddenString($data);
    $encrypted = Asymmetric\Encryption\seal(
      $message,
      $aliceEncryptionPublicKey,
    );

    // Actor : alice
    $recieved = Asymmetric\Encryption\unseal(
      $encrypted,
      $aliceEncryptionPrivateKey,
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

  private async function import<reify T as Asymmetric\Key>(
    string $name,
  ): Awaitable<T> {
    await using (
      $file = File\open_read_only(__DIR__.'/../../../keys/'.$name.'.key')
    ) {
      return T::import(new Crypto\HiddenString(await $file->readAsync()));
    }
  }
}
