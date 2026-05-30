Smart's Attack
 Konsep
Smart's Attack adalah serangan terhadap kurva eliptik anomalous.

Kurva disebut anomalous jika:

#E(Fp) = p
Pada kondisi ini ECDLP yang normalnya sulit dapat diselesaikan secara efisien.

Target
Diketahui:
Q = kP

Cari:
k

---

Ciri Challenge
* Diberikan p
* Diberikan kurva E
* Diberikan titik P
* Diberikan titik Q
* Order kurva sama dengan p

---

## Tools
* SageMath

---

## Workflow
1. Cek order kurva.
2. Pastikan #E(Fp) = p.
3. Jalankan Smart Attack.
4. Recover discrete log.

---

## Command
sage smart_attack.sage
---

## Catatan

Jika order kurva tidak sama dengan p maka Smart Attack biasanya tidak berlaku.
Jika order kurva tidak sama dengan p maka Smart Attack biasanya tidak berlaku.
