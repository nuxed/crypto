# Nuxed\\Crypto\\Asymmetric\\Encryption\\encrypt()




Encrypt a string using asymmetric cryptography
Wraps Symmetric\\Encryption\\encrypt()




``` Hack
namespace Nuxed\Crypto\Asymmetric\Encryption;

function encrypt(
  \Nuxed\Crypto\HiddenString $plaintext,
  Secret\PrivateSecret $privateSecret,
  Secret\PublicSecret $publicSecret,
  string $additionalData = '',
): string;
```




## Parameters




+ [` \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)`` $plaintext ``
+ ` Secret\PrivateSecret $privateSecret `
+ ` Secret\PublicSecret $publicSecret `
+ ` string $additionalData = '' `




## Returns




* ` string `