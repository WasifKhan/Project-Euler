#lang racket

(define (arrive1 n ctr)
  (define sum (foldr + 0 (map (lambda (x) (* (string->number x) (string->number x))) (map string (string->list (number->string n))))))
  (cond
    [(= ctr 70) #f]
    [(= 1 sum) #t]
    [else (arrive1 sum (add1 ctr))]))
(define (a n)
  (arrive1 n 0))
(define (all n lst)
  (cond
    [(= n 10000000) (- 9999999 (length lst))]
    [(a n) (all (add1 n) (cons n lst))]
    [else (all (add1 n) lst)]))
(define answer (all 1 '()))