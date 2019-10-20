# Nuxed\\Crypto\\Asymmetric\\Encryption\\unseal()




Decrypt a sealed message with our private key




``` Hack
namespace Nuxed\Crypto\Asymmetric\Encryption;

function unseal(
  string $ciphertext,
  Secret\PrivateSecret $secret,
): \Nuxed\Crypto\HiddenString;
```




## Parameters




+ ` string $ciphertext `
+ ` Secret\PrivateSecret $secret `




## Returns




* [` \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)