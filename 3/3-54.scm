(define ones (cons-stream 1 ones))

(define integers (cons-stream 1 (add-streams ones integers)))

(define (mul-streams s1 s2)
  (cons-stream (* (stream-car s1) (stream-car s2))
	       (mul-streams (stream-cdr s1) (stream-cdr s2))
  )
)

(define factorials (cons-stream 1 (mul-streams factorials  integers)))
