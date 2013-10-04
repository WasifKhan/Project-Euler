#lang racket

(define two 999998)


(define (f n k)
  (cond
    [(= n 1) k]
    [else (* n (f (- n 1) k))]))

(define answer "Done by hand")