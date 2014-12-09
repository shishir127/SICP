(define (an-integer-between a b)
  (define (iter low high)
    (if (= low high)
	null
	(amb low (iter (+ low 1) high))
    )
  )
  (if (> b a)
      (iter a b)
      (iter b a)
  )
)