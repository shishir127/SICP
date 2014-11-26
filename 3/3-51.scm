(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (stream-cons
       (apply proc (map (lambda (x) (force x)) argstreams))
       (apply stream-map
              (cons proc (map (lambda (x) (cdr x)) argstreams))))))


(define (show x)
  (display-line x)
  x)
