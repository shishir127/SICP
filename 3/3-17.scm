(define (num-elements seq)
  (define (iter seq count)
    (if (null? seq)
	count
	(iter (cdr seq) (+ count 1))
    )
  )
  (iter seq 0)
)

(define (contains? seq element)
  (cond ((null? seq)     false)
	((eq? (car seq) element)     (eq? (car seq) element))
	(else     (contains? (cdr seq) element))
  )
)

(define (count-distinct-pairs seq)
  (let ((distinct-pairs (list ))
       )
    (define (iter s)
      (cond((null? s)     null)
	   ((pair? s)     (if (contains? distinct-pairs s)
			      (begin (iter (car s))
				     (iter (cdr s))
			      )
                              (begin (set! distinct-pairs (cons s distinct-pairs))
                                     (iter (car s))
                                     (iter (cdr s))
                              )
			  )
	   )
      )
    )
    (begin (iter seq)
	   (num-elements distinct-pairs)
    )
  )
)

(define t1 (cons (cons 3 4) (cons 5 6)))

(define t2 (cons t1 t1))

(define t3 (cons 3 t1))

> (count-distinct-pairs t1)
3
> (count-distinct-pairs t2)
4
> (count-distinct-pairs t3)
4
