# Additional Features

## Constant-Time Character Encoding

Nuxed Crypto offer character encoding functions that do not leak information about what you are encoding/decoding via processor cache misses. Further reading on [cache-timing attacks](http://blog.ircmaxell.com/2014/11/its-all-about-time.html).

Functions:

  - `Crypto\Hex\encode(string $binary): string;`

    Convert a binary string into a hexadecimal string.

    character set: `0x30`-`0x39`, `0x61`-`0x66`

  - `Crypto\Hex\encode_upper(string $binary): string;`

    Convert a binary string into a hexadecimal string, returning uppercase letters (as per RFC 4648).

    character set: `0x30`-`0x39`, `0x41`-`0x46`

  - `Crypto\Hex\decode(string $hex, bool $strictPadding = false): string;`

    Convert a hexadecimal string into a binary string.
    
    character set: `0x30`-`0x39`, `0x61`-`0x66`, `0x41`-`0x46`

  - `Crypto\Hex\decode_upper(string $hex, bool $strictPadding = false): string;`

    Convert a hexadecimal string into a binary string.
    
    character set: `0x30`-`0x39`, `0x61`-`0x66`, `0x41`-`0x46`

    > Note: `Crypto\Hex\decode` is capable of decoding uppercase hexadecimal strings, this function exists only for consistency.

  - `Crypto\Base32\encode(string $src, bool $strictPadding = false): string;`

    Convert a binary string into a base32-encoded string (as per RFC 4648).

    character set: `0x61`-`0x7a`, `0x32`-`0x37`

  - `Crypto\Base32\encode_upper(string $src, bool $strictPadding = false): string;`

    Convert a binary string into a base32-encoded string, returning uppercase letters (as per RFC 4648).

    character set: `0x41`-`0x5a`, `0x32`-`0x37`

  - `Crypto\Base32\decode(string $src, bool $strictPadding = false): string;`

    Decode a base32-encoded string into raw binary.

    character set: `0x61`-`0x7a`, `0x32`-`0x37`

  - `Crypto\Base32\decode_upper(string $src, bool $strictPadding = false): string;`

    Decode a base32-encoded uppercase string into raw binary.

    character set: `0x41`-`0x5a`, `0x32`-`0x37`

  - `Crypto\Base32\Hex\encode(string $src, bool $strictPadding = false): string;`

    Convert a binary string into a base32-encoded string (as per RFC 4648).

    character set: `0x30`-`0x39`, `0x61`-`0x76`

  - `Crypto\Base32\Hex\encode_upper(string $src, bool $strictPadding = false): string;`

    Convert a binary string into a base32-encoded string, returning uppercase letters (as per RFC 4648).

    character set: `0x30`-`0x39`, `0x41`-`0x56`

  - `Crypto\Base32\Hex\decode(string $src, bool $strictPadding = false): string;`

    Decode a base32-encoded string into raw binary.

    character set: `0x30`-`0x39`, `0x61`-`0x76`

  - `Crypto\Base32\Hex\decode_upper(string $src, bool $strictPadding = false): string;`
  
    Decode a base32-encoded uppercase string into raw binary.

    character set: `0x30`-`0x39`, `0x41`-`0x56`

  - `Crypto\Base64\encode(string $src, bool $strictPadding = false): string;`

    Convert a binary string into a base64-encoded string.

    character set: `0x41`-`0x5a`, `0x61`-`0x7a`, `0x30`-`0x39`, `0x2b`, `0x2f`

  - `Crypto\Base64\decode(string $src, bool $strictPadding = false): string;`

    Decode a base32-encoded string into raw binary.

    character set: `0x41`-`0x5a`, `0x61`-`0x7a`, `0x30`-`0x39`, `0x2b`, `0x2f`
 
  - `Crypto\Base64\UrlSafe\encode(string $src, bool $strictPadding = false): string;`

    Convert a binary string into a base64-encoded string.

    character set: `0x41`-`0x5a`, `0x61`-`0x7a`, `0x30`-`0x39`, `0x2d`, `0x5f`

  - `Crypto\Base64\UrlSafe\decode(string $src, bool $strictPadding = false): string;`

    Decode a base32-encoded string into raw binary.

    character set: `0x41`-`0x5a`, `0x61`-`0x7a`, `0x30`-`0x39`, `0x2d`, `0x5f` 

  - `Crypto\Base64\DotSlash\encode(string $src, bool $strictPadding = false): string;`

    Convert a binary string into a base64-encoded string.

    character set: `0x2e`-`0x2f`, `0x41`-`0x5a`, `0x61`-`0x7a`, `0x30`-`0x39`

  - `Crypto\Base64\DotSlash\decode(string $src, bool $strictPadding = false): string;`

    Decode a base32-encoded string into raw binary.

    character set: `0x2e`-`0x2f`, `0x41`-`0x5a`, `0x61`-`0x7a`, `0x30`-`0x39`

  - `Crypto\Base64\DotSlash\Ordered\encode(string $src, bool $strictPadding = false): string;`

    Convert a binary string into a base64-encoded string.

    character set: `0x2e`-`0x39`, `0x41`-`0x5a`, `0x61`-`0x7a`

  - `Crypto\Base64\DotSlash\Ordered\decode(string $src, bool $strictPadding = false): string;`

    Decode a base32-encoded string into raw binary.

    character set: `0x2e`-`0x39`, `0x41`-`0x5a`, `0x61`-`0x7a`

---

*Encoding* a message into a hexadecimal string:

```hack
use namespace Nuxed\Crypto\Hex;

<<__EntryPoint>>
async function main(): Awaitable<void> {
  $message = 'Hello, World!';
  $encoded = Hex\encode($message);

  print $encoded; // 48656c6c6f2c20576f726c6421
}
```

*Decoding* a message:

```hack
use namespace Nuxed\Crypto\Hex;

async function main(): Awaitable<void> {
  $encoded = '48656c6c6f2c20576f726c6421';
  $decoded = Hex\decode($encoded);
  print $decoded; // Hello, World!
}
```

## Password Hashing

Nuxed Crypto provides a simple, easy-to-use password hashing API built in top of [libsodium's Argon2 implementation](https://paragonie.com/book/pecl-libsodium/read/07-password-hashing.md#crypto-pwhash-str).

Functions:
  
  - `Crypto\Password\hash(Crypto\HiddenString $password, Crypto\SecurityLevel $level = Crypto\SecurityLevel::INTERACTIVE): string;`
    Hash the given password, and return hash string.

  - `function stale(string $stored, Crypto\SecurityLevel $level = Crypto\SecurityLevel::INTERACTIVE): bool;`

    Returns whether the given hash is stale ( i.e needs to be rehashed ).

  - `function verify(Crypto\HiddenString $password, string $stored): bool;`

    Verify a password.

---

*Hashing* a password:

```hack
use namespace Nuxed\Crypto;
use namespace Nuxed\Crypto\Password;

<<__EntryPoint>>
async function main(): Awaitable<void> {
  $password = new Crypto\HiddenString('r3@llyS3crEtP4$$vv0rd');

  $hash = Password\hash($password);
}

```

*Verifing* a password:

```hack
use namespace Nuxed\Crypto;
use namespace Nuxed\Crypto\Password;

<<__EntryPoint>>
async function main(): Awaitable<void> {
  $password = new Crypto\HiddenString('r3@llyS3crEtP4$$vv0rd');

  $hash = Password\hash($password);

  $valid = Password\verify($password, $hash);
  if ($valid) {
    // Success!
  }
}

```

## String Utilities

Nuxed Crypto provides some string utility functions that will help you avoid cache-timing attacks.

Functions:

  - `Crypto\Str\chr(int $chr): string;`
    Convert an integer to a string (without cache-timing side-channels)
    
  - `Crypto\Str\ord(string $chr): int;`
    Convert a character to an integer (without cache-timing side-channels)

  - `Crypto\Str\xor(string $right, string $left): string;`
    Calculate A xor B, given two binary strings of the same length.

  - `Crypto\Str\copy(string $string): string;`
    Creates a copy of the given binary string.

  - `Crypto\Str\equals(string $known, string $user): bool;`
    Compares two strings using the same time whether they're equal or not. 

  - `Crypto\Str\assemble(Container<int> $chars): string;`
    Convert a container of integers to a string

  - `Crypto\Str\disassemble(string $str): Container<int>;`
    Turn a string into a container of integers

  - `Crypto\Binary\length(string $str): int;`:
    Returns the length of the given binary string.

  - `Crypto\Binary\slice(string $str, int $offset = 0, ?int $length = null): string;`:
    Returns a substring of length `$length` of the given binary string starting at the
    `$offset`.
