namespace Nuxed\Test\Crypto\Symmetric;

use namespace HH\Lib\Str;
use namespace HH\Lib\Experimental\File;
use namespace Facebook\HackTest;
use namespace Nuxed\Crypto;
use namespace Nuxed\Crypto\Symmetric;
use namespace HH\Lib\SecureRandom;
use function Facebook\FBExpect\expect;

class PasswordTest extends HackTest\HackTest {
  public async function testKeyRotation(): Awaitable<void> {
    $secret = await $this->import<Symmetric\Encryption\Secret>(
      'symmetric.encryption',
    );
    $otherSecret = Symmetric\Encryption\Secret::generate();

    $password = new Crypto\HiddenString('MYR3!!Y$tr0NGP4$sW0Rd');

    $interactive = Symmetric\Password\hash(
      $password,
      $secret,
      Crypto\SecurityLevel::INTERACTIVE,
    );
    $moderate = Symmetric\Password\hash(
      $password,
      $secret,
      Crypto\SecurityLevel::MODERATE,
    );
    $sensitive = Symmetric\Password\hash(
      $password,
      $secret,
      Crypto\SecurityLevel::SENSITIVE,
    );

    expect(Symmetric\Password\verify($password, $interactive, $secret))
      ->toBeTrue();
    expect(Symmetric\Password\verify($password, $moderate, $secret))
      ->toBeTrue();
    expect(Symmetric\Password\verify($password, $sensitive, $secret))
      ->toBeTrue();
    expect(Symmetric\Password\verify($password, $interactive, $otherSecret))
      ->toBeFalse();
    expect(Symmetric\Password\verify($password, $moderate, $otherSecret))
      ->toBeFalse();
    expect(Symmetric\Password\verify($password, $sensitive, $otherSecret))
      ->toBeFalse();

    $newInteractive = Symmetric\Password\rotate(
      $interactive,
      $secret,
      $otherSecret,
    );
    $newModerate = Symmetric\Password\rotate($moderate, $secret, $otherSecret);
    $newSensitive = Symmetric\Password\rotate(
      $sensitive,
      $secret,
      $otherSecret,
    );

    expect(Symmetric\Password\verify($password, $newInteractive, $secret))
      ->toBeFalse();
    expect(Symmetric\Password\verify($password, $newModerate, $secret))
      ->toBeFalse();
    expect(Symmetric\Password\verify($password, $newSensitive, $secret))
      ->toBeFalse();
    expect(Symmetric\Password\verify($password, $newInteractive, $otherSecret))
      ->toBeTrue();
    expect(Symmetric\Password\verify($password, $newModerate, $otherSecret))
      ->toBeTrue();
    expect(Symmetric\Password\verify($password, $newSensitive, $otherSecret))
      ->toBeTrue();
  }

  <<HackTest\DataProvider('provideRandomPasswords')>>
  public function testRandom(Crypto\HiddenString $password): void {
    $secret = Symmetric\Encryption\Secret::generate();
    $otherSecret = Symmetric\Encryption\Secret::generate();

    $interactive = Symmetric\Password\hash(
      $password,
      $secret,
      Crypto\SecurityLevel::INTERACTIVE,
    );
    $moderate = Symmetric\Password\hash(
      $password,
      $secret,
      Crypto\SecurityLevel::MODERATE,
    );
    $sensitive = Symmetric\Password\hash(
      $password,
      $secret,
      Crypto\SecurityLevel::SENSITIVE,
    );

    expect(Symmetric\Password\verify($password, $interactive, $secret))
      ->toBeTrue();
    expect(Symmetric\Password\verify($password, $moderate, $secret))
      ->toBeTrue();
    expect(Symmetric\Password\verify($password, $sensitive, $secret))
      ->toBeTrue();
    expect(Symmetric\Password\verify($password, $interactive, $otherSecret))
      ->toBeFalse();
    expect(Symmetric\Password\verify($password, $moderate, $otherSecret))
      ->toBeFalse();
    expect(Symmetric\Password\verify($password, $sensitive, $otherSecret))
      ->toBeFalse();

    expect(
      Symmetric\Password\stale(
        $interactive,
        $secret,
        Crypto\SecurityLevel::INTERACTIVE,
      ),
    )->toBeFalse();
    expect(Symmetric\Password\stale(
      $interactive,
      $secret,
      Crypto\SecurityLevel::MODERATE,
    ))
      ->toBeTrue();
    expect(Symmetric\Password\stale(
      $interactive,
      $secret,
      Crypto\SecurityLevel::SENSITIVE,
    ))
      ->toBeTrue();
    expect(Symmetric\Password\stale(
      $interactive,
      $otherSecret,
      Crypto\SecurityLevel::MODERATE,
    ))
      ->toBeFalse();
    expect(Symmetric\Password\stale(
      $interactive,
      $otherSecret,
      Crypto\SecurityLevel::SENSITIVE,
    ))
      ->toBeFalse();
    expect(Symmetric\Password\stale(
      $moderate,
      $secret,
      Crypto\SecurityLevel::INTERACTIVE,
    ))
      ->toBeTrue();
    expect(Symmetric\Password\stale(
      $moderate,
      $otherSecret,
      Crypto\SecurityLevel::INTERACTIVE,
    ))
      ->toBeFalse();
    expect(Symmetric\Password\stale(
      $moderate,
      $secret,
      Crypto\SecurityLevel::MODERATE,
    ))
      ->toBeFalse();
    expect(Symmetric\Password\stale(
      $moderate,
      $secret,
      Crypto\SecurityLevel::SENSITIVE,
    ))
      ->toBeTrue();
    expect(Symmetric\Password\stale(
      $moderate,
      $otherSecret,
      Crypto\SecurityLevel::SENSITIVE,
    ))
      ->toBeFalse();
    expect(Symmetric\Password\stale(
      $sensitive,
      $secret,
      Crypto\SecurityLevel::INTERACTIVE,
    ))
      ->toBeTrue();
    expect(Symmetric\Password\stale(
      $sensitive,
      $secret,
      Crypto\SecurityLevel::MODERATE,
    ))
      ->toBeTrue();
    expect(Symmetric\Password\stale(
      $sensitive,
      $otherSecret,
      Crypto\SecurityLevel::INTERACTIVE,
    ))
      ->toBeFalse();
    expect(Symmetric\Password\stale(
      $sensitive,
      $otherSecret,
      Crypto\SecurityLevel::MODERATE,
    ))
      ->toBeFalse();
    expect(Symmetric\Password\stale(
      $sensitive,
      $secret,
      Crypto\SecurityLevel::SENSITIVE,
    ))
      ->toBeFalse();
  }

  public function provideRandomPasswords(): Container<(Crypto\HiddenString)> {
    $passwords = vec[];
    for ($i = 1; $i < 7; $i++) {
      $passwords[] = tuple(
        new Crypto\HiddenString(SecureRandom\string($i * 6)),
      );
    }
    return $passwords;
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
