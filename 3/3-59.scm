(define (integral-cooefficients)
  (define (iter n)
    (cons-stream (/ 1 n) (iter (+ n 1)))
  )
  (iter 1)
)

(define (mul-streams s1 s2)
  (cons-stream (* (car-stream s2) (car-stream s1))
	       (mul-streams (cdr-stream s1) (cdr-stream s2))
  )
)

(define (integrate-series series)
  (cons-stream c (mul-streams series integral-cooefficients))
  )

(define (sin-cos-series-generator n)
    (cons-stream (/ 1 n) (sin-cos-series-generator (* -1 (+ n 2))))
  )

(define (sin-series)
  (sin-cos-series-generator 1)
)

(define (cos-series)
  (cons-stream 1 (sin-cos-series-generator -2))
)

(define cosine-series
  (cons-stream 1 (integrate-series sine-series)))
(define sine-series
  (cons-stream 0 (integrate-series cosine-series)))
