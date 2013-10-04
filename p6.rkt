#lang racket



(define (genlist n)
  (cond
    [(= n 101) empty]
    [else (cons n (genlist (+ n 1)))]))

(define sqrofsum (* (foldr + 0 (genlist 1)) (foldr + 0 (genlist 1))))
(define sumofsqr (foldr + 0 (map (lambda (x) (* x x)) (genlist 1))))
(define answer (- sqrofsum sumofsqr))