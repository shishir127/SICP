(define s (cons-stream 1 (add-streams s s)))

s is a sequence where the nth term is 2*((n-1)th term). the 1st term in the sequence is 1.
