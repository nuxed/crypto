namespace Nuxed\Crypto\Symmetric\Encryption;

use namespace Nuxed\Crypto;
use namespace HH\Lib\SecureRandom;
use namespace Nuxed\Crypto\{Binary, Exception, Symmetric};

final class Secret extends Symmetric\Secret {
  const int LENGTH = \SODIUM_CRYPTO_STREAM_KEYBYTES;

  public function __construct(Crypto\HiddenString $material) {
    if (Binary\length($material->toString()) !== static::LENGTH) {
      throw new Exception\InvalidSecretException(
        'Encryption secret must be const(Secret::LENGTH) bytes long',
      );
    }

    parent::__construct($material);
  }

  public static function generate(): this {
    return new self(
      new Crypto\HiddenString(SecureRandom\string(static::LENGTH)),
    );
  }
}