(define (create-list val length)
  (if (<= length 1)
      (list )
      (cons null (create-list val (- length 1)))
  )
)

(define (list-length seq)
  (define (iter l n)
    (if (null? l)
	n
	(iter (cdr l) (+ n 1))
    )
  )
      (iter seq 0)
)

(define (plausible-combinations tenant floors conditions)
  (let (((solutions)    (null))
       )
    (if (null? tenant)
	null
	(for-each (lambda (floor)
		    (cond ((not (null? (car floor)))     (begin (set-car! floor tenant)
								(if (satisifies? floors conditions)
								    (set! solutions (cons floors solutions))
								    null
								)
								(set-car! floor null)
							 )
						   )
			  )
		    )
		  )
		  floors
	)
    )
  )
)

(define (multiple-dwelling vars conditions)
  (define (iter tenants floors)
    (if (null? tenants)
	(begin (display-if-occupied floors)
	       true
	)
	(for-each (lambda (x)
		    (for-each (lambda (y)
				      (multiple-dwelling (remove-from-list tenants x) y)
			      )
			      (plausible-combinations x floors conditions)
		    )
		  )
		  vars
	)
    )
  )
  (if (null? vars)
      null
      (iter vars (create-list null (list-length vars)))
  )
)

(define test (list 1 2 3 4 5))
