(define (l-to-r-list input)
  (if (null? input)
      null
      (cons (car input) (l-to-r-list (cdr input)))
  )
)

(define (r-to-l-list input output)
  (if (null? input)
      output
      (r-to-l-list (cdr input) (cons (car input) output))
  )
)

(define (list-of-values . args)
  (r-to-l-list args null)
)
