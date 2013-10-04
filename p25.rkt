#lang racket

(define (fib1 n n0 lastfib prevfib)
  (cond
    [(= n0  n) lastfib]
    [else (fib1 n (+ 1 n0) (+ lastfib prevfib) lastfib)]))
(define (fib n)
  (fib1 n 1 1 0))
(define (dig n)
  (length (string->list (number->string n))))

(define (firstterm n)
  (cond
    [(= 1000 (dig (fib n))) n]
    [else (firstterm (+ n 1))]))
(define answer (firstterm 4500))
