#lang racket

(define (findpythag n a b c lst)
  (cond
    [(= c (ceiling (/ n 2))) (length lst)]
    [(= b c) (findpythag n 1 1 (add1 c) lst)]
    {(= a (+ 1 b)) (findpythag n 1 (add1 b) c lst)}
    [(and (= n (+ a b c)) (= (sqr c) (+ (sqr b) (sqr a)))) (findpythag n (add1 a) b c (cons (list a b c) lst))]
    [else (findpythag n (add1 a) b c lst)]))
(define (fp n)
  (findpythag n (floor (/ n 4)) (floor (/ n 4)) (floor (/ n 3)) '()))

(define (max n m maxsofar)
  (cond
    [(= n 900) m]
    [(> (fp n) maxsofar) (max (+ 2 n) n (fp n))]
    [else (max (+ 2 n) m maxsofar)]))
(define answer (max 800 720 6))