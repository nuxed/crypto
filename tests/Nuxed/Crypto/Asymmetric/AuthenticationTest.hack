namespace Nuxed\Test\Crypto\Asymmetric;

use namespace HH\Lib\Str;
use namespace HH\Lib\Experimental\File;
use namespace Facebook\HackTest;
use namespace Nuxed\Crypto;
use namespace Nuxed\Crypto\Asymmetric;
use namespace HH\Lib\SecureRandom;
use function Facebook\FBExpect\expect;

class AuthenticationTest extends HackTest\HackTest {
  public async function testSignAndVerify(): Awaitable<void> {
    $secret = await $this->import<
      Asymmetric\Authentication\Secret\SignaturePrivateSecret,
    >('asymmetric.authentication.private');
    $publicSecret = await $this->import<
      Asymmetric\Authentication\Secret\SignaturePublicSecret,
    >('asymmetric.authentication.public');
    $signature = Asymmetric\Authentication\sign('Hello, World!', $secret);

    expect(Crypto\Binary\length($signature))->toBeSame(\SODIUM_CRYPTO_SIGN_BYTES);
    expect(Crypto\Hex\encode($signature))
      ->toBeSame(
        'ded3736f32e6cbd625fc6ec12521194dfad0192556baba67bc151f78707d00369cda8c910531bcfc49ac24ade1797ecb9f88eb53e31738fd174d7b4ee7ac8e07',
      );
    expect(Asymmetric\Authentication\verify(
      'Hello, World!',
      $publicSecret,
      $signature,
    ))
      ->toBeTrue();
    expect(Asymmetric\Authentication\verify(
      'Hello, World',
      $publicSecret,
      $signature,
    ))
      ->toBeFalse();
  }

  public async function testLockAndUnlock(): Awaitable<void> {
    $aliceSignaturePrivateSecret = await $this->import<
      Asymmetric\Authentication\Secret\SignaturePrivateSecret,
    >('asymmetric.authentication.private');
    $aliceSignaturePublicSecret = await $this->import<
      Asymmetric\Authentication\Secret\SignaturePublicSecret,
    >('asymmetric.authentication.public');
    $aliceEncryptionPrivateSecret = await $this->import<
      Asymmetric\Encryption\Secret\PrivateSecret,
    >('asymmetric.encryption.private');
    $aliceEncryptionPublicSecret = await $this->import<
      Asymmetric\Encryption\Secret\PublicSecret,
    >('asymmetric.encryption.public');

    $bobSignaturePrivateSecret = await $this->import<
      Asymmetric\Authentication\Secret\SignaturePrivateSecret,
    >('bob.asymmetric.authentication.private');
    $bobSignaturePublicSecret = await $this->import<
      Asymmetric\Authentication\Secret\SignaturePublicSecret,
    >('bob.asymmetric.authentication.public');
    $bobEncryptionPrivateSecret = await $this->import<
      Asymmetric\Encryption\Secret\PrivateSecret,
    >('bob.asymmetric.encryption.private');
    $bobEncryptionPublicSecret = await $this->import<
      Asymmetric\Encryption\Secret\PublicSecret,
    >('bob.asymmetric.encryption.public');

    // Actor : alice
    $toBob = Asymmetric\Authentication\lock(
      new Crypto\HiddenString('Hello Bob, This is Alice!'),
      $aliceSignaturePrivateSecret,
      $bobEncryptionPublicSecret,
    );

    // Actor : bob
    $recievedFromAlice = Asymmetric\Authentication\unlock(
      $toBob,
      $aliceSignaturePublicSecret,
      $bobEncryptionPrivateSecret,
    );

    expect($recievedFromAlice->toString())->toBeSame(
      'Hello Bob, This is Alice!',
    );

    $toAlice = Asymmetric\Authentication\lock(
      new Crypto\HiddenString('Hey Alice, long time no see!'),
      $bobSignaturePrivateSecret,
      $aliceEncryptionPublicSecret,
    );

    // Actor : alice
    $recievedFromBob = Asymmetric\Authentication\unlock(
      $toAlice,
      $bobSignaturePublicSecret,
      $aliceEncryptionPrivateSecret,
    );

    expect($recievedFromBob->toString())->toBeSame(
      'Hey Alice, long time no see!',
    );
  }

  <<HackTest\DataProvider('provideRandomStrings')>>
  public async function testSignAndVerifyRandom(string $data): Awaitable<void> {
    list($secret, $publicSecret) =
      Asymmetric\Authentication\SignatureSecret::generate();

    $signature = Asymmetric\Authentication\sign($data, $secret);
    expect(Crypto\Binary\length($signature))->toBeSame(
      \SODIUM_CRYPTO_SIGN_BYTES,
    );
    expect(Asymmetric\Authentication\verify($data, $publicSecret, $signature))
      ->toBeTrue();
  }

  <<HackTest\DataProvider('provideRandomStrings')>>
  public async function testLockAndUnlockRandom(string $data): Awaitable<void> {
    list($aliceSignatureSecret, $aliceSignaturePublicSecret) =
      Asymmetric\Authentication\SignatureSecret::generate();

    list($aliceEncSecret, $aliceEncPublicSecret) =
      Asymmetric\Encryption\Secret::generate();

    list($bobSignatureSecret, $bobSignaturePublicSecret) =
      Asymmetric\Authentication\SignatureSecret::generate();

    list($bobEncSecret, $bobEncPublicSecret) =
      Asymmetric\Encryption\Secret::generate();

    // Actor : alice
    $toBob = Asymmetric\Authentication\lock(
      new Crypto\HiddenString($data),
      $aliceSignatureSecret,
      $bobEncPublicSecret,
    );

    // Actor : bob
    $recievedFromAlice = Asymmetric\Authentication\unlock(
      $toBob,
      $aliceSignaturePublicSecret,
      $bobEncSecret,
    );

    expect($recievedFromAlice->toString())->toBeSame($data);

    $toAlice = Asymmetric\Authentication\lock(
      new Crypto\HiddenString(Str\reverse($recievedFromAlice->toString())),
      $bobSignatureSecret,
      $aliceEncPublicSecret,
    );

    // Actor : alice
    $recievedFromBob = Asymmetric\Authentication\unlock(
      $toAlice,
      $bobSignaturePublicSecret,
      $aliceEncSecret,
    );

    expect($recievedFromBob->toString())->toBeSame(
      Str\reverse($recievedFromAlice->toString()),
    );
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
