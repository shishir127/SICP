(define (expand-clauses clauses)
  (if (null? clauses)
      'false                          ; no else clause
      (let ((first (car clauses))
            (rest (cdr clauses)))
        (if (cond-else-clause? first)
            (if (null? rest)
                (sequence->exp (cond-actions first))
                (error "ELSE clause isn't last -- COND->IF"
                       clauses))
            (make-if (cond-predicate first)
                     (sequence->exp (cond-actions first))
                     (expand-clauses rest))))))

(define (tagged-list? exp tag)
  (if (pair? exp)
      (eq? (car exp) tag)
      false))

(define (special-form-cond-clauses exp) (cddr exp))

(define (cond->if exp)
  (expand-clauses (cond-clauses exp)))

(define (special-form-cond->if exp)
  (expand-clauses (special-form-cond-clauses exp))
)

(define (special-form? exp)
  (eq? (cadr exp) '=>)
)

(define (local-assignment-parameters exp env)
  (if (null? input)
      null
      (cons (eval-assignment exp env) (local-assignment-parameters (cdr exp) env))
  )
)

(define (local-assignment? exp)
  (tagged-list? exp 'let)
)

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
	((local-assignment? exp)     (make-procedure (lambda-parameters (local-assignment-parameters (cdr exp) env)))
						     (lambda-body (cddr exp))
						     env
				     )
	)
        ((if? exp) (eval-if exp env))
        ((lambda? exp)
         (make-procedure (lambda-parameters exp)
                         (lambda-body exp)
                         env))
        ((begin? exp) 
         (eval-sequence (begin-actions exp) env))
	((and (cond? exp) (special-form? exp))     (special-form-cond->if exp))
        ((cond? exp) (eval (cond->if exp) env))
        ((application? exp)
         (apply (eval (operator exp) env)
                (list-of-values (operands exp) env)))
        (else
         (error "Unknown expression type -- EVAL" exp)))
)
