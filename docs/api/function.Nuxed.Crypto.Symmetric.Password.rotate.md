# Nuxed\\Crypto\\Symmetric\\Password\\rotate()




Rotate the password encryption key




``` Hack
namespace Nuxed\Crypto\Symmetric\Password;

function rotate(
  string $stored,
  \Nuxed\Crypto\Symmetric\Encryption\Key $oldKey,
  \Nuxed\Crypto\Symmetric\Encryption\Key $newKey,
): string;
```




## Parameters




+ ` string $stored `
+ [` \Nuxed\Crypto\Symmetric\Encryption\Key `](<class.Nuxed.Crypto.Symmetric.Encryption.Key.md>)`` $oldKey ``
+ [` \Nuxed\Crypto\Symmetric\Encryption\Key `](<class.Nuxed.Crypto.Symmetric.Encryption.Key.md>)`` $newKey ``




## Returns




* ` string `