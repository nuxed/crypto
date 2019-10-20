# Nuxed\\Crypto\\Asymmetric\\Encryption\\unseal()




Decrypt a sealed message with our private key




``` Hack
namespace Nuxed\Crypto\Asymmetric\Encryption;

function unseal(
  string $ciphertext,
  Key\PrivateKey $key,
): \Nuxed\Crypto\HiddenString;
```




## Parameters




+ ` string $ciphertext `
+ ` Key\PrivateKey $key `




## Returns




* [` \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)