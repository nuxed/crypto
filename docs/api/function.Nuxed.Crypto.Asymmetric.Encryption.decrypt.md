# Nuxed\\Crypto\\Asymmetric\\Encryption\\decrypt()




Decrypt a ciphertext using asymmetric cryptography
Wraps Symmetric\\Encryption\\decrypt()




``` Hack
namespace Nuxed\Crypto\Asymmetric\Encryption;

function decrypt(
  string $ciphertext,
  Key\PrivateKey $privateKey,
  Key\PublicKey $publicKey,
  string $additionalData = '',
): \Nuxed\Crypto\HiddenString;
```




## Parameters




+ ` string $ciphertext `
+ ` Key\PrivateKey $privateKey `
+ ` Key\PublicKey $publicKey `
+ ` string $additionalData = '' `




## Returns




* [` \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)