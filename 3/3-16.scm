(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define t1 (cons (cons 3 4) (cons 5 6)))

(define t2 (cons t1 t1))

(define t3 (cons 3 t1))

1 ]=> (count-pairs t1)

;Value: 3

1 ]=> (count-pairs t2)

;Value: 7

1 ]=> (count-pairs t3)

;Value: 4
