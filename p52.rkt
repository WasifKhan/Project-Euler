#lang racket

(define (samedigits1 n m)
  (cond
    [(empty? n) (empty? m)]
    [(= (length n) (length m)) (samedigits1 (remove (first n) n) (remove (first n) m))]
    [else #f]))
(define (samedigits n m)
  (samedigits1 (string->list (number->string n)) (string->list (number->string m))))
      
(define (gothroughall n)
  (cond
    [(and (samedigits n (* 2 n)) (samedigits n (* 3 n)) (samedigits n (* 4 n)) (samedigits n (* 5 n)) (samedigits n (* 6 n))) n]
    [else (gothroughall (add1 n))]))
(define answer (gothroughall 1))