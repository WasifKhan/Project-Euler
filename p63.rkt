#lang racket

(define (amount base exp ctr)
  (cond
    [(= base 10000) ctr]
    [(= exp 100) (amount (add1 base) 1 ctr)]
    [(= (string-length (number->string (expt base exp))) exp) (amount base (add1 exp) (add1 ctr))]
    [else (amount base (add1 exp) ctr)]))

(define answer (amount 1 1 0))