# Nuxed\\Crypto\\HiddenString




## Interface Synopsis




``` Hack
namespace Nuxed\Crypto;

final class HiddenString {...}
```




### Public Methods




+ [` ->__construct(string $internalStringValue, bool $disallowInline = false, bool $disallowSerialization = false) `](<class.Nuxed.Crypto.HiddenString.__construct.md>)
+ [` ->__debugInfo(): KeyedContainer<string, string> `](<class.Nuxed.Crypto.HiddenString.__debugInfo.md>)\
  Hide its internal state from var_dump()
+ [` ->__sleep(): Container<string> `](<class.Nuxed.Crypto.HiddenString.__sleep.md>)
+ [` ->__toString(): string `](<class.Nuxed.Crypto.HiddenString.__toString.md>)
+ [` ->equals(HiddenString $other): bool `](<class.Nuxed.Crypto.HiddenString.equals.md>)
+ [` ->toString(): string `](<class.Nuxed.Crypto.HiddenString.toString.md>)