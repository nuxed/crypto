<p align="center"><img src="https://avatars3.githubusercontent.com/u/45311177?s=200&v=4"></p>

![Coding standards status](https://github.com/nuxed/crypto/workflows/coding%20standards/badge.svg?branch=develop)
![Static analysis status](https://github.com/nuxed/crypto/workflows/static%20analysis/badge.svg?branch=develop)
![Unit tests status](https://github.com/nuxed/crypto/workflows/unit%20tests/badge.svg?branch=develop)
[![Total Downloads](https://poser.pugx.org/nuxed/crypto/d/total.svg)](https://packagist.org/packages/nuxed/crypto)
[![Latest Stable Version](https://poser.pugx.org/nuxed/crypto/v/stable.svg)](https://packagist.org/packages/nuxed/crypto)
[![License](https://poser.pugx.org/nuxed/crypto/license.svg)](https://packagist.org/packages/nuxed/crypto)

# Nuxed Crypto

The Nuxed Crypto component provides a high-level cryptography interface that relies on libsodium for all of its underlying cryptography operations.

inspired by [`Halite`](https://github.com/paragonie/halite).

### Important

Although this library has developed with care, it has not been examined by security experts, there will always be a chance that we overlooked something. Please ask your favourite trusted hackers to hammer it for implementation errors and bugs before even thinking about deploying it in production.

### Installation

This package can be installed with [Composer](https://getcomposer.org).

```console
$ composer require nuxed/crypto
```

### Example

```hack
use namespace Nuxed\{Crypto, Filesystem};
use namespace Nuxed\Crypto\Symmetric;

<<__EntryPoint>>
async function main(): Awaitable<void> {
  // generate a key :
  $key = Symmetric\Encryption\Key::generate();
  
  // or load a stored encryption key :
  $file = new Filesystem\File('/path/to/encryption.key');
  $key = $key = Symmetric\Encryption\Key::import(
    new Crypto\HiddenString(await $file->read())
  );

  $message = new Crypto\HiddenString('Hello, World!');
  $ciphertext = Symmetric\Encryption\encrypt($message, $key);
  $plaintext = Symmetric\Encryption\decrypt($ciphertext, $key);

  print $plaintext->toString(); // Hello, World!
}
```

---

### Security

For information on reporting security vulnerabilities in Nuxed, see [SECURITY.md](SECURITY.md).

---

### License

Nuxed is open-sourced software licensed under the MIT-licensed.
