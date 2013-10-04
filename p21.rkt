#lang racket

(define (divisors1 n counter lstsofar)
  (cond
    [(= counter 0) lstsofar]
    [(integer? (/ n counter)) (divisors1 n (- counter 1) (cons counter lstsofar))]
    [else (divisors1 n (- counter 1) lstsofar)]))
(define (divisors n)
  (divisors1 n (- n 1) '()))
(define (isambi n)
  (define lst (divisors n))
  (cond
    [(and (= n (foldr + 0 (divisors (foldr + 0 lst)))) (not (= n (foldr + 0 lst))))   #t]
    [else #f]))
(define (genlst n lst) 
  (cond
    [(= n 1) (list (foldr + 0 lst) lst)]
    [(isambi n) (genlst (- n 1) (cons n lst))]
    [else (genlst (- n 1) lst)]))
(define answer (genlst 9999 '()))