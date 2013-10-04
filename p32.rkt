#lang racket

(define (includes a b c)
  (define a1 (number->string a))
  (define b1 (number->string b))
  (define c1 (number->string c))
  (define all (string-append a1 b1 c1))
  (define all1 (string->list all))
  (= 8 
     (- (length all1) 1)
     (length (remove #\9 all1))
     (length (remove #\8 all1))
     (length (remove #\7 all1))
     (length (remove #\6 all1))
     (length (remove #\5 all1))
     (length (remove #\4 all1))
     (length (remove #\3 all1))
     (length (remove #\2 all1))
     (length (remove #\1 all1))))

(define (multiply a b lst)
  (define c (* a b))
  (cond
    [(= a 50) lst]
    [(= b 2000) (multiply (add1 a) 1 lst)]
    [(includes a b c) (multiply a (add1 b) (cons c lst))]
    [else (multiply a (add1 b) lst)]))
(define answer (- (foldr + 0 (multiply 1 1 '())) (+ 5346 5796)))
