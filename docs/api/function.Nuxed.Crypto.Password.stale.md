# Nuxed\\Crypto\\Password\\stale()




Returns whether the given hash is stale ( i




``` Hack
namespace Nuxed\Crypto\Password;

function stale(
  string $stored,
  \Nuxed\Crypto\SecurityLevel $level = Crypto\SecurityLevel::INTERACTIVE,
): bool;
```




e needs to be rehashed )




## Parameters




+ ` string $stored `
+ ` \Nuxed\Crypto\SecurityLevel $level = Crypto\SecurityLevel::INTERACTIVE `




## Returns




* ` bool `