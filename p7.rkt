#lang racket

(define (isprime? n num)
  (cond
    [(= num 1) #t]
    [(integer? (/ n num)) #f]
    [else (isprime? n (- num 1))]))

(define (isprime n)
  (isprime? n (- n 1)))

(define (divisibleby3 n)
  (integer? (/ n 3)))
(define (divisibleby5 n)
  (integer? (/ n 5)))
(define (divisibleby7 n)
  (integer? (/ n 7)))
(define (divisibleby11 n)
  (integer? (/ n 11)))
(define (th1p n counter)
  (cond
    [(and (= counter 5) (isprime n)) n]
    [(= counter 5) (th1p (+ 2 n) counter)]
    [(or (integer? (/ n 3)) (integer? (/ n 5)) (integer? (/ n 7)) (integer? (/ n 11))) (th1p (+ 2 n) counter)]
    [(isprime n) (th1p (+ 2 n) (+ 1 counter))]
    [else (th1p (+ 2 n) counter)]))


    