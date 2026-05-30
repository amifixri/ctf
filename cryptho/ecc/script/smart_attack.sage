from sage.all import *

def smart_attack(P, Q, p):
    """
    Smart Attack untuk anomalous curve
    Syarat:
    #E(Fp) = p
    """

    E = P.curve()

    assert E.order() == p

    K = Qp(p, 2)

    Eq = E.change_ring(K)

    Px, Py = P.xy()
    Qx, Qy = Q.xy()

    Pq = Eq.lift_x(ZZ(Px))
    Qq = Eq.lift_x(ZZ(Qx))

    pP = p * Pq
    pQ = p * Qq

    phiP = -(pP[0] / pP[1])
    phiQ = -(pQ[0] / pQ[1])

    return ZZ(phiQ / phiP)

# ========================
# Contoh Penggunaan
# ========================

p = 1019

E = EllipticCurve(GF(p), [1, 1])

print("Order =", E.order())

P = E.random_point()

k_secret = 123

Q = k_secret * P

try:
    recovered = smart_attack(P, Q, p)

    print("Recovered =", recovered)

except:
    print("Kurva bukan anomalous")
