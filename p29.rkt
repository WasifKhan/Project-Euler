#lang racket

(define (genlst a b lst)
  (cond
    [(= a 101)  lst]
    [(= b 101) (genlst (+ a 1) 2 lst)]
    [(member (expt a b) lst) (genlst a (+ 1 b) lst)]
    [else (genlst a (+ 1 b) (cons (expt a b) lst))]))
(define answer (length (genlst 2 2 '())))