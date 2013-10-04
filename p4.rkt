#lang racket



(define (ispali n)
  (cond
    [(or (= 0 (string-length n)) (= 1 (string-length n))) #t]
    [(string=? (substring n 0 1) (substring n (- (string-length n) 1))) (ispali (substring n 1 (- (string-length n) 1)))]
    [else #f]))
(define (isproduct n num) 
  (cond
    [(= num 1000) #f]
    [(and (integer? (/ n num)) (= (string-length (number->string (/ n num))) 3)) #t]
    [else (isproduct n (+ 1 num))]))

(define (lp n)
  (cond
    [(and (ispali (number->string n)) (isproduct n 100)) n]
    [else (lp (- n 1))]))
      
