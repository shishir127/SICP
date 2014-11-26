(define (tree-map func tree)
	(cond((null? tree)     null)
	     ((list? (car tree))     (cons (tree-map func (car tree)) (tree-map func (cdr tree))
	     	     	  	     )
	     )
	     (else (cons (func (car tree)) (tree-map func (cdr tree))))
	)
)

(define (initialize seq)
  (tree-map (lambda (x) (cons x false)) seq)
)

(define (visited? node)
  (if (pair? node)
      (cdr node)
      null
  )
)

(define (visit node)
  (set-cdr! node (= 1 1))
)

(define (make-queue)
  (let ((pointers (cons () ()))
	(head (car pointers))
	(tail (cdr pointers))
       )
  (define empty?
    (null? head)
    )
  (define peek
    head
  )
  (define (en-q element)
    (begin (set! tail (cdr (cons tail element)))
	   (if (null? head)
	       (set! head tail)
	       null
	   )
    )
    )
  (define (de-q)
    (if (or (null? head) (eq? head tail))
	null
	(let ((de-q-element head)
	     )
	  (begin (set! head (cdr head))
		 de-q-element
	  )
	)
    )
  )
  (define (dispatch msg)
    (cond(((eq? msg 'empty?)     (empty?))
	  ((eq? msg 'peek)     (peek))
	  ((eq? msg 'en-q)     en-q)
	  ((eq? msg 'de-q)     (de-q))
	  (else     (display "Unknown input"))
	 )
    )
  )(define (contains-cycle? seq)
  (let ((q (make-queue))
	(s (initialize seq))
       )
    (begin ((en-q q) (car s))
	   (if (= (bfs q) true)
	       false
	       true
	   )
    )
  )
)
  dispatch
  )
)

(define (bfs q)
  (let ((node (q de-q))
       )
    (cond ((visited? node)     false)
	  ((null? node)     true)
	  (else 
	                (begin (visit node)
			       (cond ((pair? (car node))     (and (insert-queue! (car (car node)) (insert-queue! (cdr (car node)))))))
			       (bfs q)
	                )
	  )
    )
  )
)


(define (contains-cycle? seq)
  (let ((q (make-queue))
	(s (initialize seq))
       )
    (begin ((en-q q) (car s))
	   (if (= (bfs q) true)
	       false
	       true
	   )
    )
  )
)

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))
