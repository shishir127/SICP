(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value
           (logical-or (get-signal a1) (get-signal a2))))
      (after-delay or-gate-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'ok)

(define (logical-or sig1 sig2)
  (logical-not (logical-and (logical-not sig1) (logical-not sig2)))
)

(define (or-gate-delay)
  (+ (* 2 not-gate-delay) and-gate-delay)
)
