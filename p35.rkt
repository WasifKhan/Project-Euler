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

(define (rotate n)
  (define a (number->string n))
  (string->number (string-append (substring a 1) (substring a 0 1))))
(define (rotate1 n len)
  (cond
    [(= len (string-length (number->string n))) #t]
    [(p n) (rotate1 (rotate n) (add1 len))]
    [else #f]))
(define (r n)
  (rotate1 n 0))

(define (haseven n)
  (define a (string->list (number->string n)))
  (not (= (length a) (length (remove #\5 a)) (length (remove #\2 a)) (length (remove #\4 a)) (length (remove #\6 a)) (length (remove #\8 a)) (length (remove #\0 a)))))
(define (findall n ctr)
  (cond
    [(= n 1000001) ctr]
    [(haseven n) (findall (+ 2 n) ctr)]
    [(r n) (findall (+ 2 n) (add1 ctr))]
    [else (findall (+ 2 n) ctr)]))
(define answer (findall 3 2))
