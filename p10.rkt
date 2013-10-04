#lang racket

(define (isprime? n counter)
  (cond
    [(= n counter) #t]
    [(integer? (/ n counter)) #f]
    [else (isprime? n (+ 1 counter))]))
(define (isprime n)
  (isprime? n 3))
(define (divisiblebyn n num)
  (cond
    [(= num 13) #t]
    [(integer? (/ n num)) #f]
    [else (divisiblebyn n (+ 2 num))]))
(define (sumtomil n lst)
  (cond
    [(= n 2000001) (foldr + (foldr + 2 (list 3 5 7 9 11)) lst)]
    [(divisiblebyn n 3)
     (cond
       [(isprime n) (sumtomil (+ 2 n) (cons n lst))]
       [else (sumtomil (+ 2 n) lst)])]
    [else (sumtomil (+ 2 n) lst)]))
(define answer (sumtomil 3 '()))