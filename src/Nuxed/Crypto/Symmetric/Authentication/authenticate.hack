namespace Nuxed\Crypto\Symmetric\Authentication;

function authenticate(string $message, SignatureSecret $secret): string {
  return \sodium_crypto_generichash(
    $message,
    $secret->toString(),
    \SODIUM_CRYPTO_GENERICHASH_BYTES_MAX,
  );
}
