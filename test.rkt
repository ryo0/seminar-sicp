#lang racket
(require rackunit)

(define (len lst) (if (null? lst) 0 (+ 1 (len (cdr lst)))))

(display (len '(1 2 3 4 5)))
