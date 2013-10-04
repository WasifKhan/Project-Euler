#lang racket

(define (howlong? n counter)
  (cond
    [(= n 1) counter]
    [(even? n) (howlong? (/ n 2) (+ 1 counter))]
    [else (howlong? (+ (* 3 n) 1) (+ 1 counter))]))
(define (howlong n)
  (howlong? n 1))

(define (bignum? n num maxsofar)
  (cond
    [(= n 1000000) num]
    [(> (howlong n) maxsofar) (bignum? (+ 1 n) n (howlong n))]
    [else (bignum? (+ 1 n) num maxsofar)]))
(define (bignum n)
  (bignum? n 0 0))