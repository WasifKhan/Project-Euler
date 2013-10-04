#lang racket

(define (ispythag a b c)
  (= (+ (* a a) (* b b)) (* c c)))
    
(define (sum1000? a b c)
  (= 1000 (+ a b c)))

(define (findpythag a b c)
  (cond
    [(= b 1000) (findpythag (+ 1 a) 1 1)]
    [(= c 1000) (findpythag a (+ 1 b) 1)]
    [(and (ispythag a b c) (sum1000? a b c)) (list (* a b c) a b c)]
    [else (findpythag a b (+ 1 c))]))