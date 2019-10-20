# Nuxed\\Crypto\\Secret




Base class for all cryptography secrets




## Interface Synopsis




``` Hack
namespace Nuxed\Crypto;

abstract class Secret {...}
```




### Public Methods




+ [` ::import(HiddenString $data): this `](<class.Nuxed.Crypto.Secret.import.md>)\
  Load a secret from a string
+ [` ->__clone(): void `](<class.Nuxed.Crypto.Secret.__clone.md>)\
  Don't allow this object to ever be cloned
+ [` ->__construct(HiddenString $material) `](<class.Nuxed.Crypto.Secret.__construct.md>)
+ [` ->__debugInfo(): dict<string, string> `](<class.Nuxed.Crypto.Secret.__debugInfo.md>)\
  Hide this from var_dump(), etc
+ [` ->__sleep(): void `](<class.Nuxed.Crypto.Secret.__sleep.md>)\
  Don't allow this object to ever be serialized
+ [` ->__wakeup(): void `](<class.Nuxed.Crypto.Secret.__wakeup.md>)\
  Don't allow this object to ever be unserialized
+ [` ->export(): HiddenString `](<class.Nuxed.Crypto.Secret.export.md>)\
  Export a cryptography secret to a string (with a checksum)
+ [` ->toString(): string `](<class.Nuxed.Crypto.Secret.toString.md>)\
  Get the actual secret material







### Protected Methods




* [` ::getKeyDataFromString(string $data): string `](<class.Nuxed.Crypto.Secret.getKeyDataFromString.md>)\
  Take a stored key string, get the derived key (after verifying the
  checksum)