#lang racket

(define (sumof n sum)
  (cond
    [(= n (/ n 10)) (+ sum n)]
    [else (sumof (floor (/ n 10)) (+ sum (remainder n 10)))]))
(define (sum n)
  (sumof n 0))
(define (maxsum a b maxsofar)
  (cond
    [(= a 100) maxsofar]
    [(= b 100) (maxsum (+ a 1) 1 maxsofar)]
    [(< maxsofar (sum (expt a b))) (maxsum a (+ 1 b) (sum (expt a b)))]
    [else (maxsum a (add1 b) maxsofar)]))
(define answer (maxsum 1 1 0))
