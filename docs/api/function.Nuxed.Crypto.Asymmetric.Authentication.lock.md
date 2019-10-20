# Nuxed\\Crypto\\Asymmetric\\Authentication\\lock()




``` Hack
namespace Nuxed\Crypto\Asymmetric\Authentication;

function lock(
  \Nuxed\Crypto\HiddenString $message,
  Key\SignaturePrivateKey $key,
  \Nuxed\Crypto\Asymmetric\Encryption\Key\PublicKey $recipientPublicKey,
): string;
```




## Parameters




+ [` \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)`` $message ``
+ ` Key\SignaturePrivateKey $key `
+ [` \Nuxed\Crypto\Asymmetric\Encryption\Key\PublicKey `](<class.Nuxed.Crypto.Asymmetric.Encryption.Key.PublicKey.md>)`` $recipientPublicKey ``




## Returns




* ` string `