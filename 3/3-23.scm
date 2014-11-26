(define (make-deque)
  (let ((pointers (cons () ()))
	(size 0)
	(head (car pointers))
	(tail (cdr pointers))
	)
    (define (last-element)
      (define (iter seq)
	(if (null? (cdr seq))
	    seq
	    (iter (cdr seq))
	)
      )
      (iter head)
    )
    (define empty-deque?
      (= size 0)
      )
    (define front-deque
      head
    )
    (define rear-deque
      tail
    )
    (define (front-insert-deque! element)
      (let ((new-head (cons element head))
	    )
	(begin (set! head new-head)
	       (set! size (+ 1 size))
	       (if (null? tail)
		   (set! tail head)
	       )
	)
      )
    )
    (define (rear-insert-deque! element)
      (let ((new-pair (cons element null))
	   )
	(begin (set-cdr! tail new-pair)
	       (set! tail new-pair)
	       (set! size (+ 1 size))
	       (if (null? head)
		   (set! head tail)
		   null
	       )
        )
      )
    )
    (define front-delete-deque!
      (if (empty-deque?)
	  null
	  (let ((de-q-element head)
		)
	    (begin (set! head (cdr head))
		   (set! size (- size 1))
		   (cond((empty-deque?)     (set! tail null))
		   (de-q-element)
	    )
	  )
      )
      )
    (define rear-delete-deque!
      (if (empty-deque?)
	  null
	  (let((de-q-element tail)
	      )
	    (begin (set! tail (last-element))
		   (set! size (- size 1))
		   (cond ((empty-deque?)    (set! head null)))
		   (de-q-element)
	    )
	  )
      )
    )
    
    (define (print-head-and-go seq)
      (if (null? seq)
	  null
	  (begin (display (car seq)," -- ")
		 (print-head-and-go (cdr seq))
	  )
      )
    )
    
    (define (dispatch msg)
      (cond ((eq? msg 'empty-deque?)     (empty-deque?))
	    ((eq? msg 'front-deque?)     (front-deque?))
	    ((eq? msg 'rear-deque?)      (rear-deque?))
	    ((eq? msg 'front-insert-deque!)     front-insert-deque!)
	    ((eq? msg 'rear-insert-deque!)     rear-insert-deque!)
	    ((eq? msg 'front-delete-deque!)     front-insert-deque!)
	    ((eq? msg 'rear-delete-deque!)     rear-delete-deque!)
	    ((eq? msg 'print-deque)     (print-head-and-go head))
	    (else     (display "Unknown command"))
      )
    )
  )
  )
)
