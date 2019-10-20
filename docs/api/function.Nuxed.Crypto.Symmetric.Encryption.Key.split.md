# Nuxed\\Crypto\\Symmetric\\Encryption\\Key\\split()




Split a key (using HKDF-BLAKE2b instead of HKDF-HMAC-*)




``` Hack
namespace Nuxed\Crypto\Symmetric\Encryption\Key;

function split(
  \Nuxed\Crypto\Symmetric\Encryption\Key $master,
  string $salt,
): (string, string);
```




## Parameters




+ [` \Nuxed\Crypto\Symmetric\Encryption\Key `](<class.Nuxed.Crypto.Symmetric.Encryption.Key.md>)`` $master ``
+ ` string $salt `




## Returns




* ` (string, string) `