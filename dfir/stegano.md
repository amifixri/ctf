# Steganography Cheatsheet

## Tools

- strings
- exiftool
- binwalk
- steghide
- zsteg

---

# 1. strings

Menampilkan string yang terdapat di dalam file.

## Basic Usage

```bash
strings file.jpg
```

## Cari Flag

```bash
strings file.jpg | grep flag
```

## Cari Kata Tertentu

```bash
strings file.jpg | grep password
```

## Kegunaan

- Mencari flag
- Mencari password
- Mencari URL
- Mencari petunjuk challenge

---

# 2. exiftool

Melihat metadata file.

## Basic Usage

```bash
exiftool image.jpg
```

## Cari Comment

```bash
exiftool image.jpg | grep Comment
```

## Cari Author

```bash
exiftool image.jpg | grep Author
```

## Cari GPS

```bash
exiftool image.jpg | grep GPS
```

## Kegunaan

- Melihat metadata tersembunyi
- Mencari lokasi GPS
- Mencari komentar tersembunyi
- Mencari nama pembuat file

---

# 3. binwalk

Mendeteksi file tersembunyi dalam file lain.

## Scan File

```bash
binwalk image.jpg
```

Contoh Output:

```text
DECIMAL       HEXADECIMAL
0             0x0         JPEG image data
12345         0x3039      Zip archive data
```

## Extract Otomatis

```bash
binwalk -e image.jpg
```

Output:

```text
_extracted/
```

## Extract Recursive

```bash
binwalk -Me image.jpg
```

## Kegunaan

- Menemukan ZIP tersembunyi
- Menemukan file dalam file
- Analisis firmware
- Ekstraksi otomatis

---

# 4. steghide

Mengekstrak data yang disembunyikan dalam file.

## Lihat Informasi

```bash
steghide info image.jpg
```

## Extract Data

```bash
steghide extract -sf image.jpg
```

## Extract Dengan Password

```bash
steghide extract -sf image.jpg -p password
```

## Embed File

```bash
steghide embed -cf image.jpg -ef secret.txt
```

## Kegunaan

- Extract file tersembunyi
- Embed file ke gambar
- Challenge steganografi

---

# 5. zsteg

Khusus PNG.

## Scan PNG

```bash
zsteg image.png
```

## Scan Semua Metode

```bash
zsteg -a image.png
```

## Kegunaan

- Mencari data tersembunyi pada PNG
- Menganalisis bit-plane
- Challenge CTF PNG

---

# Workflow CTF

Jika mendapatkan file gambar:

## 1. Identifikasi File

```bash
file image.jpg
```

---

## 2. Cari String

```bash
strings image.jpg
```

---

## 3. Cek Metadata

```bash
exiftool image.jpg
```

---

## 4. Cari File Tersembunyi

```bash
binwalk image.jpg
```

---

## 5. Extract File

```bash
binwalk -e image.jpg
```

---

## 6. Cek Steghide

```bash
steghide info image.jpg
```

```bash
steghide extract -sf image.jpg
```

---

## 7. Jika PNG

```bash
zsteg -a image.png
```

---

# Quick Commands

```bash
file image.jpg

strings image.jpg

strings image.jpg | grep flag

exiftool image.jpg

binwalk image.jpg

binwalk -e image.jpg

binwalk -Me image.jpg

steghide info image.jpg

steghide extract -sf image.jpg

zsteg -a image.png
```

---

# Prioritas Belajar LKS/CTF

1. strings
2. exiftool
3. binwalk
4. steghide
5. zsteg

Dengan menguasai 5 tools ini, sebagian besar soal steganografi dasar hingga menengah pada CTF dan LKS dapat dikerjakan.