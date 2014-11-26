(define (expand num den radix)
  (cons-stream
   (quotient (* num radix) den)
   (expand (remainder (* num radix) den) den radix)))

looks like long division. output of (expand 3 4 10) is (3,7,5,0,0,0....)
