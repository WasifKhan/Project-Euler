#lang racket

(define (isprime n m)
  (cond
    [(= n m) #t]
    [(integer? (/ n m)) #f]
    [else (isprime n (+ 2 m))]))
(define (p n)
  (isprime n 3))
(define (ispan n)
  (cond
    [(empty? (remove #\1 (remove #\2 (remove #\3 (remove #\4 (remove #\5 (remove #\6 (remove #\7 
             (string->list (number->string n)))))))))) #t]
    [else #f]))
                         
(define (largest n)
  (cond
    [(and (p n) (ispan n)) n]
    [else (largest (- n 2))]))
(define answer (largest 7654321))
