# Nuxed\\Crypto\\Asymmetric\\Authentication\\unlock()




Decrypt a message, then verify its signature




``` Hack
namespace Nuxed\Crypto\Asymmetric\Authentication;

function unlock(
  string $ciphertext,
  Key\SignaturePublicKey $senderPublicKey,
  \Nuxed\Crypto\Asymmetric\Encryption\Key\PrivateKey $encKey,
): \Nuxed\Crypto\HiddenString;
```




## Parameters




+ ` string $ciphertext `
+ ` Key\SignaturePublicKey $senderPublicKey `
+ [` \Nuxed\Crypto\Asymmetric\Encryption\Key\PrivateKey `](<class.Nuxed.Crypto.Asymmetric.Encryption.Key.PrivateKey.md>)`` $encKey ``




## Returns




* [` \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)