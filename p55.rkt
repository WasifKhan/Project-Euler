#lang racket

(define (sum n)
  (define rev (string->number (list->string (reverse (string->list (number->string n))))))
  (+ n rev))

(define (ispali n)
  (cond
    [(or (= 0 (string-length n)) (= 1 (string-length n))) #t]
    [(string=? (substring n 0 1) (substring n (- (string-length n) 1) (string-length n))) (ispali (substring n 1 (- (string-length n) 1)))]
    [else #f]))

(define (itts n counter)
  (cond
    [(= counter 50) #f]
    [(ispali (number->string (sum n))) #t]
    [else (itts (sum n) (add1 counter))]))
(define (it n)
  (itts n 0))
(define (numoflych n counter)
  (cond
    [(= n 10000) counter]
    [(it n) (numoflych (add1 n) (add1 counter))]
    [else (numoflych (add1 n) counter)]))
(define answer (- 10000 (numoflych 0 0)))