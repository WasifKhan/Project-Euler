#lang racket


(define (one n num)
  (cond
    [(= n 700) num]
    [else (one (add1 n) (remainder (* num (expt 2 10000)) 10000000000))]))
(define (two n num)
  (cond
    [(= n 80) num]
    [else (two (add1 n) (remainder (* num (expt 2 10000)) 10000000000))]))
(define (three n num)
  (cond
    [(= n 3) num]
    [else (three (add1 n) (remainder (* num (expt 2 10000)) 10000000000))]))

(define (five n num)
  (cond
    [(= n 40) num]
    [else (five (add1 n) (remainder (* num (expt 2 10)) 10000000000))]))
(define (six n num)
  (cond
    [(= n 5) num]
    [else (six (add1 n) (remainder (* num (expt 2 10)) 10000000000))]))
(define (seven n num)
  (cond
    [(= n 7) num]
    [else (seven (add1 n) (remainder (* num 2) 10000000000))]))

(define first (one 0 1))
(define second (two 0 1))
(define third (three 0 1))

(define fifth (five 0 1))
(define sixth (six 0 1))
(define seventh (seven 0 1))
(define answer (remainder (+ (* 28433 9700303872) 1) 10000000000)