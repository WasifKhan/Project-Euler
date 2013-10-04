#lang racket

(define (gensum n sumsofar)
  (cond
    [(= n 1001) sumsofar]
    [else (gensum (add1 n) (+ (expt n n) sumsofar))]))
(define answer (gensum 1 0))