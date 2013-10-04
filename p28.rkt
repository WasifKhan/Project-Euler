#lang racket


(define (topright1 n counter lst)
  (cond
    [(= (+ 2 n) counter) (foldr + 0 lst)]
    [else
     (topright1 n (+ 2 counter) (cons (sqr counter) lst))]))
(define topright (topright1 1001 3 '()))


(define (topleft1 n lst)
  (cond
    [(= n (+ 1 (+ 0.5 (/ 1001 2)))) (foldr + 0 lst)]
    [else (topleft1 (+ 1 n) (cons (+ 3 (- (* 4 (* n n)) (* 6 n))) lst))]))
(define topleft (topleft1 2 '()))

(define (bottomleft1 n lst)
  (cond
    [(= n (+ 1 (+ 0.5 (/ 1001 2)))) (foldr + 0 lst)]
    [else (bottomleft1 (+ 1 n) (cons (+ 5 (- (* 4 (* n n)) (* 8 n))) lst))]))
(define bottomleft (bottomleft1 2 '()))

(define (bottomright1 n lst)
  (cond
    [(= n (+ 1 (+ 0.5 (/ 1001 2)))) (foldr + 0 lst)]
    [else (bottomright1 (+ 1 n) (cons (+ 7 (- (* 4 (* n n)) (* 10 n))) lst))]))
(define bottomright (bottomright1 2 '()))

(define total (+ 1 topright topleft bottomright bottomleft))