#lang racket

(define (factorial n factsofar)
  (cond
    [(= n 1) factsofar]
    [else (factorial (- n 1) (* factsofar n))]))
(define (fact n)
  (factorial n 1))
  

(define (sumofdigits n counter)
  (cond
    [(= (remainder n 10) n) (+ counter n)]
    [else (sumofdigits (floor (/ n 10)) (+ counter (remainder n 10)))]))
(define (summ n)
  (sumofdigits n 0))
(define answer (summ (fact 100)))