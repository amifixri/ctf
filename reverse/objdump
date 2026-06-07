# Reverse Engineering Notes - Objdump

## Cek Tipe File

```bash
file chall
```

## Disassembly

```bash
objdump -M intel -d chall
```

## Lihat Section

```bash
objdump -h chall
```

## Lihat Symbol

```bash
objdump -t chall
```

## Dump Data

```bash
objdump -s chall
```

## Semua Informasi ELF

```bash
objdump -x chall
```

---

# Assembly Dasar

## mov

```asm
mov eax,5
```

```c
eax = 5;
```

## cmp

```asm
cmp eax,5
```

```c
if(eax == 5)
```

## je

```asm
je success
```

```c
if(a == b)
```

## jne

```asm
jne fail
```

```c
if(a != b)
```

## call

```asm
call strcmp
```

Panggil fungsi.

## ret

```asm
ret
```

Keluar dari fungsi.

---

# Workflow Reverse

```bash
file chall
strings chall
objdump -t chall
objdump -M intel -d chall
```

Lanjutkan dengan Ghidra untuk membaca pseudocode.