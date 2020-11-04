#lang debug racket/base
(require rackunit)
(require racket/trace)
(define (fun n)
  (if (< n 3) n
    (+ (fun (- n 1)) (* 2 (fun (- n 2))) (* 3 (fun (- n 3))))))

(fun 2)
(fun 3)
(fun 4)
(fun 5)
(fun 10)

; 下から積み上げていくイメージ
(define (fun2-iter n counter a b c)
  (cond
    [(= n counter) a]
    (else
     (fun2-iter n (+ counter 1) (+ a (* 2 b) (* 3 c)) a b))))
(define (fun2 n)
  (if (< n 3) n (fun2-iter n 3 4 2 1)))

; (trace fun2-iter)

(fun2 2)
(fun2 3)
(fun2 4)
(fun2 5)
(fun2 10)
(check-equal? (fun 1) (fun2 1))
(check-equal? (fun 2) (fun2 2))
(check-equal? (fun 3) (fun2 3))
(check-equal? (fun 4) (fun2 4))
(check-equal? (fun 5) (fun2 5))
(check-equal? (fun 6) (fun2 6))
(check-equal? (fun 11) (fun2 11))
; (check-equal? (fun 37) (fun2 37))
