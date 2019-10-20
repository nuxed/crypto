namespace Nuxed\Crypto\Symmetric\Password;

use namespace Nuxed\Crypto\Symmetric\Encryption;

/**
 * Rotate the password encryption key
 */
function rotate(
  string $stored,
  Encryption\Secret $oldSecret,
  Encryption\Secret $newSecret,
): string {
  return Encryption\encrypt(
    Encryption\decrypt($stored, $oldSecret),
    $newSecret,
  );
}
