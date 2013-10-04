#lang racket

(define (sumofdigits1 n counter)
  (cond
    [(= (remainder n 10) n) (+ counter n)]
    [(not (= (remainder n 10) n)) (sumofdigits1 (floor (/ n 10)) (+ counter (remainder n 10)))]))
(define (summ n)
  (sumofdigits1 n 0))