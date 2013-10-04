#lang racket

(define (ispenta n)
  (define a (/ (+ 1 (sqrt (+ 1 (* 24 n)))) 6))
  (or (and (integer? a))))

(define (penta n)
  (/ (* n (- (* 3 n) 1)) 2))
(define (pair a b limit)
  (define a1 (penta a))
  (define b1 (penta b))
  (cond
    [(= a limit) (pair 1 limit (+ 100 limit))]
    [(= b limit) (pair (add1 a) 1 limit)]
    [(and (ispenta (- b1 a1)) (ispenta (+ b1 a1))) (- b1 a1)]
    [else (pair a (add1 b) limit)]))
(define answer (pair 1 2 100))
