# Nuxed\\Crypto\\Asymmetric\\Authentication\\lock()




``` Hack
namespace Nuxed\Crypto\Asymmetric\Authentication;

function lock(
  \Nuxed\Crypto\HiddenString $message,
  Secret\SignaturePrivateSecret $secret,
  \Nuxed\Crypto\Asymmetric\Encryption\Secret\PublicSecret $recipientPublicKey,
): string;
```




## Parameters




+ [` \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)`` $message ``
+ ` Secret\SignaturePrivateSecret $secret `
+ [` \Nuxed\Crypto\Asymmetric\Encryption\Secret\PublicSecret `](<class.Nuxed.Crypto.Asymmetric.Encryption.Secret.PublicSecret.md>)`` $recipientPublicKey ``




## Returns




* ` string `