# Nuxed\\Crypto\\Symmetric\\Encryption\\decrypt()




Decrypt a message




``` Hack
namespace Nuxed\Crypto\Symmetric\Encryption;

function decrypt(
  string $ciphertext,
  Key $key,
  string $additionalData = '',
): \Nuxed\Crypto\HiddenString;
```




## Parameters




+ ` string $ciphertext `
+ ` Key $key `
+ ` string $additionalData = '' `




## Returns




* [` \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)