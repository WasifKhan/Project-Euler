#lang racket

(define (isp n m)
  (cond
    [(> m (ceiling (sqrt n))) #t]
    [(integer? (/ n m)) #f]
    [else (isp n (+ 2 m))]))
(define (p n)
  (cond
    [(integer? (/ n 2)) #f]
    [(= n 3) #t]
    [(not (or (and (integer? (/ (add1 n) 6))
                   (positive? (/ (add1 n) 6)))
              (and (integer? (/ (sub1 n) 6))
                   (positive? (/ (sub1 n) 6))))) #f]
    [else (isp n 3)]))

(define (l n)
  (string->number (substring (number->string n) 1)))
(define (r n)
  (define a (number->string n))
  (string->number (substring a 0 (- (string-length a) 1))))
(define (bigl n)
  (define a (number->string n))
  (cond
    [(and (= 1 (string-length a)) (p n)) #t]
    [(p n) (bigl (l n))]
    [else #f]))
(define (bigr n)
  (define a (number->string n))
  (cond
    [(and (= 1 (string-length a)) (p n)) #t]
    [(p n) (bigr (r n))]
    [else #f]))

(define (tp n sum)
  (cond
    [(= n 1000001) (+ 23 sum)]
    [(and (bigr n) (bigl n)) (tp (+ 2 n) (+ n sum))]
    [else (tp (+ 2 n) sum)]))
(define answer (tp 11 0))