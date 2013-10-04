#lang racket

(define (makestr n str)
  (cond
    [(= n 1000001) str]
    [else (makestr (add1 n) (string-append str (number->string n)))]))
(define (s n)
  (makestr n ""))
(define (findnth str n)
  (string->number (list->string (list (string-ref str (sub1 n))))))
(define str (s 1))
(define answer (* (findnth str 1)
                  (findnth str 10)
                  (findnth str 100)
                  (findnth str 1000)
                  (findnth str 10000)
                  (findnth str 100000)
                  (findnth str 1000000)))