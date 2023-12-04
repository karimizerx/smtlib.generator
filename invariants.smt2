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
