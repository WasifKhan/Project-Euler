#lang racket

(define (fact1 n factsofar)
  (cond
    [(= n 1) factsofar]
    [else (fact1 (sub1 n) (* n factsofar))]))
(define (fact n)
  (fact1 n 1))
(define (c n r)
  (/ (fact n) (* (fact r) (fact (- n r)))))

(define (num n r counter)
  (cond
    [(= n 101) counter]
    [(= r n) (num (add1 n) 1 counter)]
    [(< 1000000 (c n r)) (num n (add1 r) (add1 counter))]
    [else (num n (add1 r) counter)]))
(define answer (num 1 1 0))