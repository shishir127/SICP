(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

1 ]=> (define x (list 'a 'b))

;Value: x

1 ]=> (define y (list 'c 'd))

;Value: y

1 ]=> (define z (append x y))

;Value: z

1 ]=> z

;Value 13: (a b c d)

1 ]=> (cdr x)

;Value 14: (b)

1 ]=> (define w (append! x y))

;Value: w

1 ]=> w

;Value 15: (a b c d)

1 ]=> (cdr x)

;Value 14: (b c d)
