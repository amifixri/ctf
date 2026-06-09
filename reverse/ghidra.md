Ghidra Cheat Sheet (CTF Reverse Engineering)

Apa itu Ghidra?

Ghidra adalah tool reverse engineering yang digunakan untuk menganalisis file executable (ELF, EXE, DLL, dll) secara statis. Ghidra dapat melakukan:

- Disassembly (Assembly)
- Decompile ke pseudocode mirip bahasa C
- Melihat fungsi (function)
- Melihat string
- Melihat alur program
- Rename variabel dan fungsi
- Cross Reference (XREF)

Ghidra memiliki fitur decompiler yang mengubah binary menjadi representasi kode tingkat tinggi agar lebih mudah dibaca.

---

1. Membuka File

1. Jalankan Ghidra
2. File → New Project
3. Pilih Non-Shared Project
4. Import File
5. Pilih binary (ELF/EXE)
6. Klik OK
7. Double click file
8. Saat muncul Auto Analysis → Klik Analyze

Auto Analysis akan mencoba mendeteksi fungsi, string, library, dan struktur program secara otomatis.

---

2. Tampilan Penting

Listing

Menampilkan assembly.

Contoh:

MOV EAX,1
CMP EAX,2
JNE LAB_00101234

---

Decompiler

Menampilkan pseudocode C.

Contoh:

if (input == 1337) {
    puts("Correct");
}

Decompiler mengikuti fungsi yang sedang dipilih pada Code Browser.

---

Symbol Tree

Berisi:

- Functions
- Labels
- Imports
- Exports

Digunakan untuk mencari fungsi dengan cepat.

---

3. Mencari Flag

Cari String

Search → For Strings

atau

Shift + S

Contoh:

Correct
Wrong
flag
password

Jika menemukan string menarik:

Double Click → lihat fungsi yang memanggil string tersebut.

---

4. Melihat Function

Buka:

Symbol Tree → Functions

Cari fungsi seperti:

main
check
validate
verify
auth
login
FUN_00101189

Biasanya flag berada di fungsi validasi.

---

5. Cross References (XREF)

Klik string atau fungsi.

Tekan:

X

atau

Right Click → References

Fungsi:

Mengetahui siapa yang memanggil fungsi tersebut.

Contoh:

check_flag();

Cari semua pemanggilnya.

---

6. Rename Variable

Tekan:

L

Contoh:

Sebelum:

local_18

Sesudah:

user_input

Membuat pseudocode lebih mudah dibaca.

---

7. Rename Function

Tekan:

L

Contoh:

Sebelum:

FUN_00101189

Sesudah:

check_flag

---

8. Melihat Alur Program

Function Graph:

Window → Function Graph

Menampilkan diagram:

START
 |
 v
CHECK
 | \
 |  \
YES  NO
 |    |
FLAG EXIT

Mempermudah memahami logika program.

---

9. Shortcut Penting

Shortcut| Fungsi
G| Go To Address
F| Create Function
D| Disassemble
X| Show References
L| Rename
;| Comment
Shift + S| Search Strings
Ctrl + Shift + F| Search Text

---

10. Workflow Reverse CTF

Easy

Import File
↓
Analyze
↓
Search String
↓
Cari "Correct"
↓
XREF
↓
Temukan check_flag()
↓
Baca pseudocode
↓
Dapat flag

---

Medium

Import
↓
Analyze
↓
Cari main()
↓
Lihat input user
↓
Ikuti fungsi validasi
↓
Pahami algoritma
↓
Reconstruct flag

---

Hard

Import
↓
Analyze
↓
Cari main()
↓
Cari anti-debug
↓
Analisis algoritma
↓
Bandingkan dengan GDB
↓
Dapat flag

---

Tips LKS / CTF

Prioritas pertama:

1. Strings
2. main()
3. Function validation
4. XREF
5. Decompiler

Jika pseudocode aneh:

- Rename variable
- Rename function
- Lihat assembly
- Gunakan GDB untuk dynamic analysis

Karena dekompilasi tidak selalu sempurna dan kadang perlu konteks tambahan atau analisis manual.