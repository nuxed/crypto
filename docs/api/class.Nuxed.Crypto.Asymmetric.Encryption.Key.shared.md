# Nuxed\\Crypto\\Asymmetric\\Encryption\\Key::shared()




Diffie-Hellman, ECDHE, etc




``` Hack
final public static function shared(
  Nuxed\Crypto\Asymmetric\Encryption\Key\PrivateKey $private,
  Nuxed\Crypto\Asymmetric\Encryption\Key\PublicKey $public,
): Nuxed\Crypto\HiddenString;
```




Get a shared key from a private key you possess and a public key for
the intended message recipient




## Parameters




+ [` Nuxed\Crypto\Asymmetric\Encryption\Key\PrivateKey `](<class.Nuxed.Crypto.Asymmetric.Encryption.Key.PrivateKey.md>)`` $private ``
+ [` Nuxed\Crypto\Asymmetric\Encryption\Key\PublicKey `](<class.Nuxed.Crypto.Asymmetric.Encryption.Key.PublicKey.md>)`` $public ``




## Returns




* [` Nuxed\Crypto\HiddenString `](<class.Nuxed.Crypto.HiddenString.md>)