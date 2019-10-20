# Nuxed\\Crypto\\Key




Base class for all cryptography keys




## Interface Synopsis




``` Hack
namespace Nuxed\Crypto;

abstract class Key {...}
```




### Public Methods




+ [` ::import(HiddenString $data): this `](<class.Nuxed.Crypto.Key.import.md>)\
  Load a key from a string
+ [` ->__clone(): void `](<class.Nuxed.Crypto.Key.__clone.md>)\
  Don't allow this object to ever be cloned
+ [` ->__construct(HiddenString $material) `](<class.Nuxed.Crypto.Key.__construct.md>)
+ [` ->__debugInfo(): dict<string, string> `](<class.Nuxed.Crypto.Key.__debugInfo.md>)\
  Hide this from var_dump(), etc
+ [` ->__sleep(): void `](<class.Nuxed.Crypto.Key.__sleep.md>)\
  Don't allow this object to ever be serialized
+ [` ->__wakeup(): void `](<class.Nuxed.Crypto.Key.__wakeup.md>)\
  Don't allow this object to ever be unserialized
+ [` ->export(): HiddenString `](<class.Nuxed.Crypto.Key.export.md>)\
  Export a cryptography key to a string (with a checksum)
+ [` ->toString(): string `](<class.Nuxed.Crypto.Key.toString.md>)\
  Get the actual key material







### Protected Methods




* [` ::getKeyDataFromString(string $data): string `](<class.Nuxed.Crypto.Key.getKeyDataFromString.md>)\
  Take a stored key string, get the derived key (after verifying the
  checksum)