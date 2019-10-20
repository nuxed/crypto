# Nuxed\\Crypto\\Asymmetric\\Encryption\\encrypt()




Encrypt a string using asymmetric cryptography
Wraps Symmetric\\Encryption\\encrypt()




``` Hack
namespace Nuxed\Crypto\Asymmetric\Encryption;

function encrypt(
  \Nuxed\Crypto\HiddenString $plaintext,
  Key\PrivateKey $privateKey,
  Key\PublicKey $publicKey,
  string $additionalData = '',
): string;
```




## Parameters




+ [` \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)`` $plaintext ``
+ ` Key\PrivateKey $privateKey `
+ ` Key\PublicKey $publicKey `
+ ` string $additionalData = '' `




## Returns




* ` string `