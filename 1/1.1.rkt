#lang racket
; 1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
; if式はbの値に応じて+か-を返す。b > 0ならa+b, b <= 0 ならa-b

; 1.5
(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))
(test 0 p)
; 適用と正規どっちがどっちか忘れたけど、遅延評価するなら当然0を返すし、
; しないなら引数が評価されて無限再帰になる
(define (square x) (* x x))
(define (sqrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess
      (sqrt-iter (improve guess x) guess
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess prev-guess)
  (< (abs (- guess prev-guess)) (/ guess 1000)))

(define (sqrt x)
  (sqrt-iter 1.0 2.0 x))

; ;;EXERCISE 1.6
; (define (new-if predicate then-clause else-clause)
;   (cond (predicate then-clause)
;         (else else-clause)))
;
; ;: (new-if (= 2 3) 0 5)
;
; ;: (new-if (= 1 1) 0 5)
;
; (define (sqrt-iter guess x)
;   (new-if (good-enough? guess x)
;           guess
;           (sqrt-iter (improve guess x)
;                      x)))
; ; 引数評価しちゃうから無限再帰になる……
; 1.7
; 以下を読んだ。
; https://www.serendip.ws/archives/328
; とりあえず1.0E29で無限ループにならずに正しい値が求まり、
; 1.0E-6が正しく計算できていればOKとしていい気がする。
(display (sqrt 23218943843298))
(newline)
(display (sqrt 1.0E29))
(newline)
(display (sqrt 1.0E-6))
(newline)
; 1.8
(define (improve-cube x y)
  (/ (+ (/ x (square y)) (* 2 y)) 3))

  (define (cube-iter guess prev-guess x)
    (if (good-enough? guess prev-guess)
        guess
        (cube-iter (improve-cube x guess) guess
                   x)))
(define (cube x)
     (cube-iter 1.0 2.0 x))
(display (cube 23218943843298))
