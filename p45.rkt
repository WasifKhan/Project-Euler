#lang racket

(define (tri n)
  (/ (* n (add1 n)) 2))
(define (istri n)
  (or (and (integer? (/ (+ -1 (sqrt (- 1 (* 4 (* -2 n))))) 2)) (positive? (/ (+ -1 (sqrt (- 1 (* 4 (* -2 n))))) 2))) (and (integer? (/ (- -1 (sqrt (- 1 (* 4 (* -2 n))))) 2)) (positive? (/ (- -1 (sqrt (- 1 (* 4 (* -2 n))))) 2)))))
(define (ispenta n)
  (or (and (integer? (/ (+ 1 (sqrt (- 1 (* 12 (* -2 n))))) 6)) (positive? (/ (+ 1 (sqrt (- 1 (* 12 (* -2 n))))) 6))) (and (integer? (/ (- 1 (sqrt (- 1 (* 12 (* -22 n))))) 6)) (positive? (/ (- 1 (sqrt (- 1 (* 12 (* -22 n))))) 6)))))
(define (ishexa n)
  (or (and (integer? (/ (+ 1 (sqrt (- 1 (* 8 (* -1 n))))) 4)) (positive? (/ (+ 1 (sqrt (- 1 (* 8 (* -1 n))))) 4))) (and (integer? (/ (- 1 (sqrt (- 1 (* 8 (* -1 n))))) 4)) (positive? (/ (- 1 (sqrt (- 1 (* 8 (* -1 n))))) 4)))))

(define (nexttri n counter)
  (cond
    [(and (ishexa n) (ispenta n) (istri n)) n]
    [else (nexttri (tri counter) (add1 counter))]))
(define answer (nexttri 2 286))