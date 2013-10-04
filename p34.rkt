#lang racket

(define (fact n maxsofar)
  (cond
    [(<= n 1) maxsofar]
    [else (fact (sub1 n) (* n maxsofar))]))

(define (sum n add)
  (cond
    [(= 0 (floor (/ n 10))) (+ (fact n 1) add)]
    [else (sum (floor (/ n 10)) (+ (fact (remainder n 10) 1) add))]))

(define (findall n sum1)
  (cond
    [(= n 100000) sum1]
    [(= n (sum n 0)) (findall (add1 n) (+ n sum1))]
    [else (findall (add1 n) sum1)]))
(define answer (findall 3 0))