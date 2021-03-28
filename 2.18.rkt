#lang racket
(require sicp)

(define (reverse l)
    (if (null? l)
    nil
    (append (reverse (cdr l)) (list (car l)))
    )
)

(display (reverse (list 1 2 3 4)))