#lang racket

(define (isprime n m)
  (cond
    [(> m (ceiling (sqrt n))) #t]
    [(or (integer? (/ n 2)) (integer? (/ n 3))) #f]
    [(or (not (integer? (/ (- n 1) 6))) (not (integer? (/ (+ n 1) 6)))) (isprime n (+ 2 m))]
    [(integer? (/ n m)) #f]
    [else (isprime n (+ 2 m))]))
(define (p n)
  (isprime n 3))

(define (primefactorize n m lst)
  (cond
    [(= n 1) lst]
    [(and (p m) (integer? (/ n m))) (primefactorize (/ n m) m (cons m lst))]
    [else (primefactorize n (+ 1 m) lst)]))
(define (f n)
  (primefactorize n 2 '()))
(define (sremove n lst)
  (cond
    [(= (length lst) (length (remove n lst))) lst]
    [else (sremove n (remove n lst))]))
(define (lstmap lst newl)
  (cond
    [(empty? lst) newl]
    [else
     (define ctr (first lst))
     (define l1 (length lst))
     (define l2 (sremove ctr lst))
     (define lmt (- l1 (length l2)))
     (lstmap (sremove ctr l2) (cons lmt newl))]))
(define (l lst)
  (lstmap lst '()))
(define (sum lst)
  (foldr * 1 (map add1 lst)))
(define (tri n)
  (/ (* n (add1 n)) 2))
(define (numofdivis n ctr)
  (cond
    [(< 500 (sum (l (f n)))) n]
    [else (numofdivis (tri ctr) (add1 ctr))]))
(define answer (numofdivis 28 10))
