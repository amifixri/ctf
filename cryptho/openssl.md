# OpenSSL Cheatsheet - CTF Crypto

## Informasi Versi

```bash
openssl version
openssl version -a
```

---

# Melihat Isi Key

## Private Key RSA

```bash
openssl rsa -in private.pem -text -noout
```

## Public Key RSA

```bash
openssl rsa -pubin -in public.pem -text -noout
```

## Semua Jenis Key

```bash
openssl pkey -in key.pem -text -noout
```

---

# Convert Key

## Private Key -> PEM

```bash
openssl rsa -in private.key -out private.pem
```

## Public Key Extract

```bash
openssl rsa -in private.pem -pubout -out public.pem
```

---

# Certificate Analysis

## Detail Certificate

```bash
openssl x509 -in cert.pem -text -noout
```

## Fingerprint

```bash
openssl x509 -in cert.pem -fingerprint -noout
```

## Expiration Date

```bash
openssl x509 -in cert.pem -enddate -noout
```

---

# Base64

## Encode

```bash
echo "hello" | openssl base64
```

## Decode

```bash
echo "aGVsbG8K" | openssl base64 -d
```

---

# Hashing

## MD5

```bash
openssl dgst -md5 file.txt
```

## SHA1

```bash
openssl dgst -sha1 file.txt
```

## SHA256

```bash
openssl dgst -sha256 file.txt
```

## SHA512

```bash
openssl dgst -sha512 file.txt
```

---

# AES Encryption

## AES-128-CBC Encrypt

```bash
openssl enc -aes-128-cbc -in flag.txt -out flag.enc
```

## AES-128-CBC Decrypt

```bash
openssl enc -aes-128-cbc -d -in flag.enc
```

## AES-256-CBC Encrypt

```bash
openssl enc -aes-256-cbc -in flag.txt -out flag.enc
```

## AES-256-CBC Decrypt

```bash
openssl enc -aes-256-cbc -d -in flag.enc
```

---

# Menentukan Cipher yang Didukung

```bash
openssl enc -list
```

---

# RSA Encryption

## Encrypt dengan Public Key

```bash
openssl pkeyutl \
-encrypt \
-pubin \
-inkey public.pem \
-in flag.txt \
-out flag.enc
```

## Decrypt dengan Private Key

```bash
openssl pkeyutl \
-decrypt \
-inkey private.pem \
-in flag.enc
```

---

# Sign dan Verify

## Sign File

```bash
openssl dgst -sha256 \
-sign private.pem \
-out sign.bin \
file.txt
```

## Verify Signature

```bash
openssl dgst -sha256 \
-verify public.pem \
-signature sign.bin \
file.txt
```

---

# Generate RSA Key

## 2048-bit

```bash
openssl genrsa -out private.pem 2048
```

## Extract Public Key

```bash
openssl rsa \
-in private.pem \
-pubout \
-out public.pem
```

---

# Random Bytes

## Hex

```bash
openssl rand -hex 16
```

## Base64

```bash
openssl rand -base64 16
```

---

# CTF Workflow

## 1. Identifikasi File

```bash
file *
strings file
xxd file | head
```

## 2. Jika Ada Key

```bash
openssl pkey -in key.pem -text -noout
```

## 3. Jika Ada Certificate

```bash
openssl x509 -in cert.pem -text -noout
```

## 4. Jika Ada File Enc

```bash
xxd file.enc | head
strings file.enc
```

## 5. Cek Cipher

```bash
openssl enc -list
```

## 6. Coba Decrypt

```bash
openssl enc -aes-256-cbc -d -in file.enc
```

## 7. RSA

```bash
openssl pkeyutl -decrypt \
-inkey private.pem \
-in file.enc
```

---

# Tools Pendukung Crypto CTF

```bash
RsaCtfTool
factordb
sage
python3
gmpy2
sympy
openssl
```

---

# Catatan Penting

Jika file:

```text
pkey = 123456789...
enc  = 987654321...
```

dan hanya berupa angka besar,

maka kemungkinan BUKAN format OpenSSL.

Biasanya challenge seperti itu harus diselesaikan dengan:

- Faktorisasi
- Modular arithmetic
- GCD
- XOR
- Persamaan matematika
- RSA custom

gunakan Python/Sage daripada OpenSSL.