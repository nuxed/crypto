# Nuxed\\Crypto\\Asymmetric\\Authentication\\verify()




Verify a signed message with the correct public key




``` Hack
namespace Nuxed\Crypto\Asymmetric\Authentication;

function verify(
  string $message,
  Key\SignaturePublicKey $key,
  string $signature,
): bool;
```




## Parameters




+ ` string $message `
+ ` Key\SignaturePublicKey $key `
+ ` string $signature `




## Returns




* ` bool `