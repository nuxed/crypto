# Nuxed\\Crypto\\Asymmetric\\Authentication\\unlock()




Decrypt a message, then verify its signature




``` Hack
namespace Nuxed\Crypto\Asymmetric\Authentication;

function unlock(
  string $ciphertext,
  Secret\SignaturePrivateSecret $secret,
  \Nuxed\Crypto\Asymmetric\Encryption\Secret\PrivateSecret $encSecret,
): \Nuxed\Crypto\HiddenString;
```




## Parameters




+ ` string $ciphertext `
+ ` Secret\SignaturePrivateSecret $secret `
+ [` \Nuxed\Crypto\Asymmetric\Encryption\Secret\PrivateSecret `](<class.Nuxed.Crypto.Asymmetric.Encryption.Secret.PrivateSecret.md>)`` $encSecret ``




## Returns




* [` \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)