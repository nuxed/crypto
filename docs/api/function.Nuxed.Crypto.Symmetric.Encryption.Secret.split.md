# Nuxed\\Crypto\\Symmetric\\Encryption\\Secret\\split()




Split a key (using HKDF-BLAKE2b instead of HKDF-HMAC-*)




``` Hack
namespace Nuxed\Crypto\Symmetric\Encryption\Secret;

function split(
  \Nuxed\Crypto\Symmetric\Encryption\Secret $master,
  string $salt,
): (string, string);
```




## Parameters




+ [` \Nuxed\Crypto\Symmetric\Encryption\Secret `](<class.Nuxed.Crypto.Symmetric.Encryption.Secret.md>)`` $master ``
+ ` string $salt `




## Returns




* ` (string, string) `