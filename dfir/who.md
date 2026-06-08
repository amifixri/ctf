# Digital Forensics Cheatsheet

## Log Analysis

Tujuan:
- Menemukan aktivitas user
- Mencari login gagal
- Menemukan serangan brute force
- Mengetahui aktivitas sistem

### Lokasi Log Linux

```bash
/var/log/auth.log
/var/log/syslog
/var/log/messages
```

### Log Web Server

```bash
/var/log/apache2/access.log
/var/log/apache2/error.log
```

### Command Penting

Lihat isi file:

```bash
cat auth.log
```

Cari kata tertentu:

```bash
grep "Failed password" auth.log
```

Hitung jumlah IP:

```bash
grep "Failed password" auth.log | awk '{print $11}' | sort | uniq -c
```

Cari login sukses:

```bash
grep "Accepted password" auth.log
```

---

# Network Forensics (PCAP)

Tool:
- Wireshark
- tshark

## Filter Penting

HTTP

```text
http
```

DNS

```text
dns
```

FTP

```text
ftp
```

TCP

```text
tcp
```

UDP

```text
udp
```

ICMP

```text
icmp
```

HTTP Request

```text
http.request
```

HTTP Response

```text
http.response
```

## Yang Dicari Saat CTF

- Username
- Password
- Cookie
- File transfer
- DNS query
- Flag

### Export Object

Wireshark

```text
File
→ Export Objects
→ HTTP
```

---

# Steganography

## strings

Melihat string tersembunyi

```bash
strings image.jpg
```

Cari flag

```bash
strings image.jpg | grep flag
```

---

## exiftool

Melihat metadata

```bash
exiftool image.jpg
```

Yang dicari:

- Author
- Comment
- GPS
- Hidden Metadata

---

## binwalk

Mendeteksi file tersembunyi

```bash
binwalk image.jpg
```

Extract otomatis

```bash
binwalk -e image.jpg
```

---

## steghide

Extract data tersembunyi

```bash
steghide extract -sf image.jpg
```

Info file

```bash
steghide info image.jpg
```

---

# File Recovery / Carving

## foremost

Recover file terhapus

```bash
foremost disk.img
```

Output:

```bash
output/
```

---

## scalpel

Recover file berdasarkan signature

```bash
scalpel disk.img
```

---

## binwalk

Extract file dari firmware

```bash
binwalk -e firmware.bin
```

---

# Disk Forensics

Tool:
- Autopsy
- Sleuth Kit

## mmls

Melihat partisi

```bash
mmls disk.img
```

---

## fls

Melihat file

```bash
fls disk.img
```

Recursive

```bash
fls -r disk.img
```

---

## icat

Mengambil file

```bash
icat disk.img inode
```

Contoh

```bash
icat disk.img 128 > secret.txt
```

---

## fsstat

Informasi filesystem

```bash
fsstat disk.img
```

---

# Memory Forensics

Tool:
- Volatility 3

## Melihat proses

```bash
vol.py -f mem.raw windows.pslist
```

---

## Melihat command

```bash
vol.py -f mem.raw windows.cmdline
```

---

## Melihat koneksi jaringan

```bash
vol.py -f mem.raw windows.netscan
```

---

## Melihat file yang dibuka

```bash
vol.py -f mem.raw windows.filescan
```

---

## Dump proses

```bash
vol.py -f mem.raw windows.dumpfiles
```

---

# OSINT

## Whois

```bash
whois example.com
```

---

## DNS Lookup

```bash
nslookup example.com
```

atau

```bash
dig example.com
```

---

## Subdomain Enumeration

```bash
subfinder -d example.com
```

---

## Google Dork

Cari PDF

```text
site:example.com filetype:pdf
```

Cari Login

```text
site:example.com inurl:login
```

Cari Directory Listing

```text
site:example.com intitle:"index of"
```

---

# Workflow Forensics CTF

## Jika Dapat File Log

```bash
cat
less
grep
awk
sort
uniq
```

## Jika Dapat PCAP

```text
Wireshark
→ Follow TCP Stream
→ HTTP
→ DNS
→ FTP
```

## Jika Dapat Gambar

```bash
file
strings
exiftool
binwalk
steghide
```

## Jika Dapat Disk Image

```bash
mmls
fls
icat
```

## Jika Dapat Memory Dump

```bash
pslist
cmdline
netscan
filescan
```

---

# Prioritas Belajar LKS

1. Log Analysis
2. Wireshark (PCAP)
3. Steganography
4. File Carving
5. Volatility
6. Disk Forensics
7. OSINT

---

# Checklist Sebelum LKS

- [ ] Bisa menggunakan grep
- [ ] Bisa membaca auth.log
- [ ] Bisa analisis PCAP di Wireshark
- [ ] Bisa memakai strings
- [ ] Bisa memakai exiftool
- [ ] Bisa memakai binwalk
- [ ] Bisa memakai steghide
- [ ] Bisa memakai Volatility
- [ ] Bisa memakai fls dan icat
- [ ] Bisa melakukan OSINT dasar