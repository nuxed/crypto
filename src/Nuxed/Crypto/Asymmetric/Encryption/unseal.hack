namespace Nuxed\Crypto\Asymmetric\Encryption;

use namespace Nuxed\Crypto;

/**
 * Decrypt a sealed message with our private key
 */
function unseal(
  string $ciphertext,
  Secret\PrivateSecret $secret,
): Crypto\HiddenString {
  // Get a box keypair (needed by crypto_box_seal_open)
  $secret_key = $secret->toString();
  $public_key = \sodium_crypto_box_publickey_from_secretkey($secret_key);
  $key_pair = \sodium_crypto_box_keypair_from_secretkey_and_publickey(
    $secret_key,
    $public_key,
  );

  // Wipe these immediately:
  \sodium_memzero(inout $secret_key);
  \sodium_memzero(inout $public_key);

  // Now let's open that sealed box
  $message = \sodium_crypto_box_seal_open($ciphertext, $key_pair);
  // Always memzero after retrieving a value
  \sodium_memzero(inout $key_pair);
  if (!$message is string) {
    throw new Crypto\Exception\InvalidSecretException(
      'Incorrect secret key for this sealed message',
    );
  }

  // We have our encrypted message here
  return new Crypto\HiddenString($message);
}
