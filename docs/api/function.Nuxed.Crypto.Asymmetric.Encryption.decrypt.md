# Nuxed\\Crypto\\Asymmetric\\Encryption\\decrypt()




Decrypt a ciphertext using asymmetric cryptography
Wraps Symmetric\\Encryption\\decrypt()




``` Hack
namespace Nuxed\Crypto\Asymmetric\Encryption;

function decrypt(
  string $ciphertext,
  Secret\PrivateSecret $privateSecret,
  Secret\PublicSecret $publicSecret,
  string $additionalData = '',
): \Nuxed\Crypto\HiddenString;
```




## Parameters




+ ` string $ciphertext `
+ ` Secret\PrivateSecret $privateSecret `
+ ` Secret\PublicSecret $publicSecret `
+ ` string $additionalData = '' `




## Returns




* [` \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)