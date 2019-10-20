# Nuxed\\Crypto\\Symmetric\\Authentication\\verify()




Verify the authenticity of a message, given a shared MAC key




``` Hack
namespace Nuxed\Crypto\Symmetric\Authentication;

function verify(
  string $message,
  Secret $secret,
  string $mac,
): bool;
```




## Parameters




+ ` string $message `
+ ` Secret $secret `
+ ` string $mac `




## Returns




* ` bool `