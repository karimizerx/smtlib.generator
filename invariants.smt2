<<<<<<< HEAD
(declare-fun Invar (Int Int) Bool)
(assert (Invar 4 0))
(assert (forall (( x Int ) ( y Int )) (=> (and (Invar x y) (> x 0)) (Invar (- x 1) (+ x y)))))
(assert (forall (( x Int ) ( y Int )) (=> (and (Invar x y) (<= x 0)) (= y 10))))
(check-sat)
(get-model)
(exit)
=======
;synthèse d'invariant
;on déclare le symbole non interprété de relation Invar
(declare-fun Invar (Int Int) bool)
;l'assertion Invar est vraie initialement
(assert (Invar 4 0))
;la relation Invar est un invariant de boucle
(assert (forall ((i Int) (v Int)) (=> (and (Invar i v) (> i 0)) (Invar (- i 1) (+ v i)) ) ) )
;la relation Invar doit être sûr
(assert (forall ((i Int) (v Int)) (=> (and (Invar i v) (<= i 0)) (= v 10) ) ) )
(check-sat-using (then qe smt))
(get-model)
(exit)
>>>>>>> 5090a7d2a4964815c0d36d79f3e251528afcd292
