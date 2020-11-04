#lang debug racket/base
(require rackunit)
(require racket/trace)

(define (comb n m)
  (if (or (= m 1) (= n m))
      1
    (+ (comb (- n 1) m) (comb (- n 1) (- m 1)))))
(check-equal? (comb 1 1) 1)
(check-equal? (comb 2 1) 1)
(check-equal? (comb 3 2) 2)
(check-equal? (comb 4 3) 3)
(check-equal? (comb 5 3) 6)
(check-equal? (comb 6 4) 10)
(check-equal? (comb 6 5) 5)
