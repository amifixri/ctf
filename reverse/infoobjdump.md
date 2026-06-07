# Reverse Engineering - Objdump Notes

## Apa itu Objdump?

`objdump` adalah tool bawaan Linux yang digunakan untuk melihat isi file executable (ELF), object file, dan library.

Dalam Reverse Engineering, objdump sering digunakan untuk:

- Melihat assembly program
- Melihat fungsi yang ada di binary
- Melihat section ELF
- Mencari petunjuk sebelum membuka Ghidra

Objdump termasuk **Static Analysis** karena tidak menjalankan program.

---

# Hubungan Tools Reverse Engineering

| Tool | Fungsi |
|--------|---------|
| file | Identifikasi tipe file |
| strings | Ambil string dari binary |
| objdump | Lihat isi binary |
| readelf | Analisis struktur ELF |
| Ghidra | Decompile ke pseudocode |
| gdb | Dynamic Analysis |

Workflow umum:

```bash
file chall
strings chall
objdump -t chall
objdump -M intel -d chall
```

Jika masih belum paham alur program:

```text
Buka Ghidra
```

---

# 1. file

Digunakan untuk mengetahui tipe file.

```bash
file chall
```

Contoh output:

```text
chall: ELF 64-bit LSB executable, x86-64
```

Artinya:

- ELF = executable Linux
- 64-bit = arsitektur 64-bit
- x86-64 = CPU Intel/AMD modern

---

# 2. objdump -d

Digunakan untuk melakukan disassembly.

```bash
objdump -d chall
```

Lebih direkomendasikan:

```bash
objdump -M intel -d chall
```

Contoh output:

```asm
0000000000401136 <main>:
401136: push rbp
401137: mov rbp,rsp
40113a: mov eax,0x1
40113f: pop rbp
401140: ret
```

Penjelasan:

```asm
push rbp
```

Simpan stack frame lama.

```asm
mov rbp,rsp
```

Persiapan fungsi.

```asm
mov eax,0x1
```

Isi register eax dengan angka 1.

```asm
ret
```

Keluar dari fungsi.

---

# 3. objdump -h

Melihat section dalam ELF.

```bash
objdump -h chall
```

Contoh output:

```text
Idx Name
0 .text
1 .data
2 .bss
3 .rodata
```

## Penjelasan

### .text

Berisi kode program.

### .data

Berisi variabel yang memiliki nilai awal.

### .bss

Variabel yang belum diinisialisasi.

### .rodata

String dan data read-only.

Contoh:

```c
printf("Hello");
```

String "Hello" biasanya berada di:

```text
.rodata
```

---

# 4. objdump -t

Melihat symbol table.

```bash
objdump -t chall
```

Contoh output:

```text
main
check_password
print_flag
```

Manfaat:

Kadang langsung terlihat fungsi penting seperti:

```text
validate
check_password
decrypt_flag
print_flag
```

---

# 5. objdump -s

Dump data mentah.

```bash
objdump -s chall
```

Contoh:

```hex
4c 4b 53 7b
```

Konversi ke ASCII:

```text
4c = L
4b = K
53 = S
7b = {
```

Hasil:

```text
LKS{
```

---

# 6. objdump -x

Menampilkan informasi lengkap ELF.

```bash
objdump -x chall
```

Informasi yang ditampilkan:

- Entry Point
- Symbol
- Section
- Dynamic Libraries

Biasanya digunakan saat analisis lebih lanjut.

---

# Assembly Dasar yang Wajib Hafal

## mov

```asm
mov eax,5
```

Artinya:

```c
eax = 5;
```

---

## cmp

```asm
cmp eax,5
```

Bandingkan dua nilai.

Mirip:

```c
if(eax == 5)
```

---

## je

```asm
je success
```

Jump jika sama.

Mirip:

```c
if(a == b)
```

---

## jne

```asm
jne fail
```

Jump jika tidak sama.

Mirip:

```c
if(a != b)
```

---

## call

```asm
call strcmp
```

Panggil fungsi.

Mirip:

```c
strcmp(...)
```

---

## ret

```asm
ret
```

Keluar dari fungsi.

---

# Contoh Analisis Reverse

Misalkan ditemukan:

```asm
mov eax,5
cmp eax,5
je success
```

Analisis:

Langkah 1:

```asm
mov eax,5
```

eax sekarang bernilai:

```text
5
```

Langkah 2:

```asm
cmp eax,5
```

Bandingkan:

```text
5 dengan 5
```

Hasil:

```text
Sama
```

Langkah 3:

```asm
je success
```

Karena sama:

```text
Program lompat ke success
```

---

# Tips LKS Reverse Engineering

Prioritas belajar:

1. file
2. strings
3. Ghidra
4. strcmp
5. strlen
6. memcmp
7. XOR
8. Base64
9. Objdump dasar
10. Assembly dasar

Jangan menghafal seluruh assembly.

Untuk tingkat LKS Provinsi biasanya cukup memahami:

```text
mov
cmp
je
jne
call
ret
```

karena sebagian besar challenge bisa diselesaikan melalui pseudocode Ghidra.