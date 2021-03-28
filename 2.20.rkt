#lang racket
(require sicp)

(define (same x y) (= (remainder x 2) (remainder y 2)))

(define (same-parity . l)
    (define (sub x l)
        (if (null? l)
            l
            (if (same x (car l))
                (cons (car l) (sub x (cdr l)))
                 (sub x (cdr l))
                )
            )
        )
    (sub (car l) l)
)

(display (same-parity 1 2 3 4 5))

(display (same-parity 2 3 4 5))