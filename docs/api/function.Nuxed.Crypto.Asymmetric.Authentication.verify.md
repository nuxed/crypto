# Nuxed\\Crypto\\Asymmetric\\Authentication\\verify()




Verify a signed message with the correct public key




``` Hack
namespace Nuxed\Crypto\Asymmetric\Authentication;

function verify(
  string $message,
  Secret\SignaturePublicSecret $secret,
  string $signature,
): bool;
```




## Parameters




+ ` string $message `
+ ` Secret\SignaturePublicSecret $secret `
+ ` string $signature `




## Returns




* ` bool `