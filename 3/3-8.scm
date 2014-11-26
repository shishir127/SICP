(define (f arg)
  (let ((x (null)))
    (if (null? x)
	(set! x arg)
	x
    )
  )
)

(+ (f 0) (f 1))
