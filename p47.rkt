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
(define (factorize num n m lst) 
  (cond
    [(> m num) lst]
    [(integer? (/ n 2)) (factorize num (/ n 2) m (cons 2 lst))]
    [(and (integer? (/ n m)) (p m)) (factorize num (/ n m) m (cons m lst))]
    [else (factorize num n (+ 2 m) lst)]))
(define (f n)
  (factorize n n 3 '()))
(define (sremove num n)
  (cond
    [(= (length n) (length (remove num n))) n]
    [else (sremove num (remove num n))]))
(define (instances a lst ctr)
  (cond
    [(= (length lst) (length (remove a lst))) (expt a ctr)]
    [else (instances a (remove a lst) (add1 ctr))]))
(define (i a lst)
  (instances a lst 0))
(define (sqrlst lst newl)
  (cond
    [(empty? lst) newl]
    [else (sqrlst (sremove (first lst) lst) (cons (i (first lst) lst) newl))]))
(define (s lst)
  (sqrlst lst '()))
(define (unique n m)
  (cond
    [(and (empty? m) (empty? n)) #t]
    [(or (empty? m) (empty? n)) #f]
    [(or (member (first m) n) (member (first n) m)) #f]
    [else (unique (sremove (first n) n) (sremove (first m) m))]))
(define (find4 a b c d)
  (define a1 (s (f a)))
  (define b1 (s (f b)))
  (define c1 (s (f c)))
  (define d1 (s (f d)))
  (cond
    [(and (unique a1 b1) (unique a1 c1) (unique a1 d1) (unique b1 c1) (unique b1 d1) (unique c1 d1) (= 4 (length a1) (length b1) (length c1) (length d1))) a]
    [else (find4 b c d (add1 d))]))
(define answer (find4 100000 100000 100000 100000))
