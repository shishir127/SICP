(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    (define (assoc key records)
      (cond ((null? records) false)
	    ((same-key? key (caar records)) (car records))
	    (else (assoc key (cdr records)))))
    (define (lookup . keys)
      (define (iter current-table key)
	(if (null? key)
	    (cdr current-table)
	    (let ((subtable        (assoc (car key) (cdr current-table)))
	         )
	       (if subtable
		   (iter subtable (cdr key))
		   nil
	       )
	    )
        )
      )
      (if (null? keys)
	  (display "No keys were passed for lookup")
	  (iter (car keys) (cdr keys))
	  )
      )
    (define (add-key table key)
       (set-cdr! table (cons (cons key nil) (cdr table)))
    )
    (define (insert! value . keys)
      (define (iter current-table key)
        (let ((subtable (assoc (car key) (cdr current-table))))
	(if (null? key)
	    (if (subtable)
		(set-cdr! subtable value)
	        (begin (add-key current-table key)
		       (set-cdr! (car (cdr current-table)) value)
		       ('ok)
		)
	    )
	     (if subtable
		 (iter subtable (cdr key))
		 (begin (add-key current-table (car key))
			(iter (car (cdr current-table)) (cdr key))
		 )
	     )
	)
          )
      )
      (if (null? keys)
	  (display "No keys were passed for the insertion")
	  (iter local-table keys)
      )
    )    
    (define (dispatch m)
      (cond ((same-key? m 'lookup) lookup)
            ((same-key? m 'insert!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch)
  )


(define test (make-table eq?))
((test 'insert!) 2 "two")
