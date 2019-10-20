# Nuxed\\Crypto\\Symmetric\\Encryption\\decrypt()




Decrypt a message using the Halite encryption protocol




``` Hack
namespace Nuxed\Crypto\Symmetric\Encryption;

function decrypt(
  string $ciphertext,
  Secret $secretKey,
  string $additionalData = '',
): \Nuxed\Crypto\HiddenString;
```




## Parameters




+ ` string $ciphertext `
+ ` Secret $secretKey `
+ ` string $additionalData = '' `




## Returns




* [` \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)