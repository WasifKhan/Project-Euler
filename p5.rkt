#lang racket


(define l1 (list 11 12 13 14 15 16 17 18 19 20))


(define (evenlydivis n lst)
  (cond
    [(empty? lst) #t]
    [(integer? (/ n (first lst))) (evenlydivis n (rest lst))]
    [else #f]))
(define (evn n)
  (evenlydivis n l1))
      

(define (findnum n)
  (cond
    [(evn n) n]
    [else (findnum (+ n 2))]))
