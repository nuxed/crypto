namespace Nuxed\Test\Crypto\Symmetric;

use namespace HH\Lib\Str;
use namespace HH\Lib\Experimental\File;
use namespace Facebook\HackTest;
use namespace Nuxed\Crypto;
use namespace Nuxed\Crypto\Symmetric;
use namespace HH\Lib\SecureRandom;
use function Facebook\FBExpect\expect;

class EncryptionTest extends HackTest\HackTest {
  public async function testEncryptAndDecrypt(): Awaitable<void> {
    $secret = await $this->import<Symmetric\Encryption\Secret>(
      'symmetric.encryption',
    );

    $message = new Crypto\HiddenString('Hello, World!');
    $ciphertext = Symmetric\Encryption\encrypt($message, $secret);

    expect(Crypto\Binary\length($ciphertext))->toBeGreaterThan(
      \SODIUM_CRYPTO_GENERICHASH_BYTES,
    );

    $plaintext = Symmetric\Encryption\decrypt($ciphertext, $secret);

    expect($plaintext->toString())->toBeSame($message->toString());
  }

  <<HackTest\DataProvider('provideRandomStrings')>>
  public async function testEncryptAndDecryptRandom(
    string $data
  ): Awaitable<void> {
    $secret = Symmetric\Encryption\Secret::generate();

    $message = new Crypto\HiddenString($data);
    $ciphertext = Symmetric\Encryption\encrypt($message, $secret);

    expect(Crypto\Binary\length($ciphertext))->toBeGreaterThan(
      \SODIUM_CRYPTO_GENERICHASH_BYTES,
    );

    $plaintext = Symmetric\Encryption\decrypt($ciphertext, $secret);

    expect($plaintext->toString())->toBeSame($message->toString());
  }

  public function provideRandomStrings(): Container<(string)> {
    $ret = vec[];
    for ($i = 0; $i < 100; $i++) {
      $ret[] = tuple(Crypto\Hex\encode(SecureRandom\string(($i + 5) * 8)));
    }

    return $ret;
  }

  private async function import<reify T as Symmetric\Secret>(
    string $name,
  ): Awaitable<T> {
    await using (
      $file = File\open_read_only(__DIR__.'/../../../secrets/'.$name.'.key')
    ) {
      return T::import(new Crypto\HiddenString(await $file->readAsync()));
    }
  }
}
