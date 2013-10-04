#lang racket

(define (sumofdigits n sum)
  (cond
    [(= n (floor (/ n 10))) (+ sum (expt n 5))]
    [else (sumofdigits (floor (/ n 10)) (+ sum (expt (remainder n 10) 5)))]))
(define (sum n)
  (sumofdigits n 0))

(define (lstofall n lst)
  (cond
    [(= n 500000) lst]
    [(= n (sum n)) (lstofall (add1 n) (cons n lst))]
    [else (lstofall (add1 n) lst)]))
(define answer (foldr + 0 (lstofall 2 '())))