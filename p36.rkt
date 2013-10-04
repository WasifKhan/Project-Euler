#lang racket

(define (ispali n)
  (cond
    [(or (= 1 (string-length n)) (= (string-length n) 0)) #t]
    [(string=? (substring n 0 1) (substring n (- (string-length n) 1))) (ispali (substring n 1 (- (string-length n) 1)))]
    [else #f]))

(define (biggestnum num exp)
  (cond
    [(and (positive? (- num (expt 2 exp))) (negative? (- num (expt 2 (+ exp 1))))) (+ exp 1)]
    [(zero? (- num (expt 2 exp))) (+ 1 exp)]
    [else (biggestnum num (+ 1 exp))]))
(define (exp n)
  (cond
    [(= n 0) 0]
    [(= n 1) 1]
    [else (biggestnum n 1)]))
(define (convertb n str)
  (define a (exp n))
  (define b (number->string (* (expt 10 (- a 1)))))
  (cond
    [(= a -1) str]
    [(= a 0) str]
    [(= a 1) (string-append (substring str 0 (- (string-length str) 1)) "1")]
    [else
     (cond
       [(string=? "" str) (convertb (- n (expt 2 (- a 1))) b)]
       [else (convertb (- n (expt 2 (- a 1))) (string-append (substring str 0 (- (string-length str) (string-length b))) b))])]))
(define (convert n)
  (convertb n ""))

(define (summ num lst)
  (cond
    [(= num 1000000) (foldr + 1 lst)]
    [(and (ispali (number->string num)) (ispali (convert num))) (summ (+ 1 num) (cons num lst))]
    [else (summ (+ 1 num) lst)]))
(define (sum1)
  (summ 2 '()))
(define answer (sum1))