#lang racket

(define (genlst n)
  (cond
    [(= n 1001) empty]
    [else (cons n (genlst (+ n 1)))]))

(define newlst (filter (lambda (x) (or (integer? (/ x 3)) (integer? (/ x 5)))) (genlst 1)))
(define answer (foldr + 0 newlst))