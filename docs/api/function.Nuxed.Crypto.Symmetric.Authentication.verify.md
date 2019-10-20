# Nuxed\\Crypto\\Symmetric\\Authentication\\verify()




Verify the authenticity of a message, given a shared MAC key




``` Hack
namespace Nuxed\Crypto\Symmetric\Authentication;

function verify(
  string $message,
  SignatureKey $key,
  string $mac,
): bool;
```




## Parameters




+ ` string $message `
+ ` SignatureKey $key `
+ ` string $mac `




## Returns




* ` bool `