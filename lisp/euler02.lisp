(defun fiboupto (max fib)
  (cond
    ((< (car fib) max) (fiboupto max (cons (+ (car fib) (car (cdr fib))) fib)))
    ((> (car fib) max) (cdr fib))
    (t fib)))

(defun evenfibupto (max)
  (prog ((evens '()))
    (loop for x in (fiboupto max '(1 1)) do
	 (cond
	   ((evenp x) (setf evens (cons x evens)))))
    (return evens)))

(defun answer ()
  (apply '+ (evenfibupto 4000000)))

;;; for question 25

(defun answer25 ()
  (let ((big-list (fiboupto (expt 10 999) '(1 1))))
    (+ 1 (list-length big-list))))
