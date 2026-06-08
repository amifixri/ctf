# Reverse Engineering Cheatsheet

## 1. file
Mengetahui jenis file yang akan dianalisis.

### Contoh
```bash
file chall
```

### Output
```text
ELF 64-bit LSB executable
```

### Kegunaan
- Mengetahui apakah file ELF, EXE, DLL, Script, dll.
- Mengetahui arsitektur (32-bit / 64-bit).

---

## 2. strings
Menampilkan string yang terdapat dalam binary.

### Contoh
```bash
strings chall
```

### Filter Flag
```bash
strings chall | grep flag
```

### Kegunaan
- Mencari flag hardcoded.
- Mencari password.
- Mencari URL.
- Mencari nama fungsi.

---

## 3. readelf
Melihat struktur file ELF.

### Header ELF
```bash
readelf -h chall
```

### Section
```bash
readelf -S chall
```

### Symbol Table
```bash
readelf -s chall
```

### Semua Informasi
```bash
readelf -a chall
```

### Kegunaan
- Mengetahui entry point.
- Melihat section ELF.
- Melihat fungsi yang tersedia.
- Melihat shared library.

---

## 4. objdump
Melakukan disassembly binary.

### Disassembly
```bash
objdump -d chall
```

### Header Binary
```bash
objdump -x chall
```

### Section
```bash
objdump -h chall
```

### Kegunaan
- Melihat kode assembly.
- Melihat flow program.
- Menemukan fungsi tersembunyi.
- Menganalisis pengecekan password.

---

## 5. Ghidra
Disassembler dan Decompiler GUI.

### Kegunaan
- Melihat pseudocode C.
- Melihat fungsi program.
- Rename variabel dan fungsi.
- Analisis statis yang lebih mudah dibanding assembly.

### Biasanya Dicari
- main()
- check()
- win()
- flag()

---

## 6. GDB
Debugger untuk Dynamic Analysis.

### Menjalankan Program
```bash
gdb ./chall
```

### Menjalankan Program
```gdb
run
```

### Breakpoint di Main
```gdb
break main
run
```

### Next Instruction
```gdb
next
```

### Step Into Function
```gdb
step
```

### Continue
```gdb
continue
```

### Melihat Register
```gdb
info registers
```

### Kegunaan
- Analisis saat program berjalan.
- Melihat perubahan register.
- Mengetahui alur program.
- Bypass validasi.

---

## 7. pwndbg
Plugin GDB untuk Binary Exploitation dan Reverse Engineering.

### Kegunaan
- Tampilan register lebih jelas.
- Menampilkan stack.
- Menampilkan memory.
- Mempermudah debugging.

---

## 8. ltrace
Melihat fungsi library yang dipanggil program.

### Contoh
```bash
ltrace ./chall
```

### Output
```text
strcmp("admin", "password")
```

### Kegunaan
- Mengetahui password yang dibandingkan.
- Mengetahui fungsi libc yang digunakan.

---

## 9. strace
Melihat system call program.

### Contoh
```bash
strace ./chall
```

### Output
```text
open("flag.txt", O_RDONLY)
read(...)
write(...)
```

### Kegunaan
- Mengetahui file yang dibuka.
- Mengetahui aktivitas program terhadap sistem.

---

## 10. Hex Editor (HxD / Bless / Hexedit)

### Kegunaan
- Melihat byte mentah.
- Memodifikasi binary.
- Binary patching.

### Contoh Patch
```asm
je 0x401200
```

Menjadi:

```asm
jmp 0x401200
```

Untuk melewati pengecekan password.

---

# Workflow Reverse Engineering CTF

## Recon Awal

```bash
file chall
strings chall
```

## Analisis ELF

```bash
readelf -s chall
readelf -a chall
```

## Analisis Assembly

```bash
objdump -d chall
```

## Analisis GUI

Buka menggunakan:

- Ghidra
- IDA Free
- Cutter

## Dynamic Analysis

```bash
gdb ./chall
```

## Library Call

```bash
ltrace ./chall
```

## System Call

```bash
strace ./chall
```

---

# Urutan Belajar Reverse Engineering

1. file
2. strings
3. readelf
4. objdump
5. Ghidra
6. GDB
7. ltrace
8. strace

---

# Static Analysis

Program tidak dijalankan.

Tools:
- file
- strings
- readelf
- objdump
- Ghidra
- IDA

# Dynamic Analysis

Program dijalankan dan diamati.

Tools:
- GDB
- pwndbg
- ltrace
- strace

---

# Goal Reverse Engineering

- Memahami alur program.
- Menemukan password.
- Menemukan flag.
- Menemukan fungsi tersembunyi.
- Memodifikasi perilaku program.
- Menyelesaikan challenge CTF.