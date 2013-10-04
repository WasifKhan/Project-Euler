#lang racket



(define (factors1 n counter lst)
  (cond
    [(= counter n) lst]
    [(= (length lst) 9) lst]
    [(integer? (/ n counter)) (factors1 n (+ 1 counter) (append (list counter) lst))]
    [else (factors1 n (+ 1 counter) lst)]))
(define (factors n)
  (factors1 n 2 empty))

(define (isprime1 n counter)
  (cond
    [(= n counter) #t]
    [(integer? (/ n counter)) #f]
    [else (isprime1 n (+ 1 counter))]))
(define (isprime n)
  (isprime1 n 2))


(define answer (first (filter isprime (factors 600851475143))))
