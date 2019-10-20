namespace Nuxed\Crypto\Exception;

<<__Sealed(
  InvalidSecretException::class,
  InvalidSignatureException::class,
  InvalidMessageException::class,
)>>
class InvalidArgumentException
  extends \InvalidArgumentException
  implements IException {}
