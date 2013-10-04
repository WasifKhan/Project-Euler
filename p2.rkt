#lang racket



(define (fibh n counter prev last)
  (cond
    [(= counter n) prev]
    [else (fibh n (+ 1 counter) (+ prev last) prev)]))
(define (fib n)
  (fibh n 2 2 1))

(define (sum4m n sum)
  (cond
    [(>= (fib n) 4000000) sum]
    [(even? (fib n)) (sum4m (+ 1 n) (+ sum (fib n)))]
    [else (sum4m (+ 1 n) sum)]))