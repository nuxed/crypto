# Nuxed\\Crypto\\Asymmetric\\Encryption\\seal()




Encrypt a message with a target users' public key




``` Hack
namespace Nuxed\Crypto\Asymmetric\Encryption;

function seal(
  \Nuxed\Crypto\HiddenString $plaintext,
  Secret\PublicSecret $secret,
): string;
```




## Parameters




+ [` \Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)`` $plaintext ``
+ ` Secret\PublicSecret $secret `




## Returns




* ` string `