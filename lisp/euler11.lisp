(defun divides (potential-factor number)
  (cond
    ((= (/ number potential-factor) (floor (/ number potential-factor))) t)
    (t nil)))

(defun count-divisors (number)
  (prog ((num-divisors 0))
    (loop for x from 1 to number do
	 (cond
	   ((divides x number) (setf num-divisors (+ 1 num-divisors)))))
    (return-from count-divisors num-divisors)))

(defun answer12 ()
  (let ((x 1) (triangular-num 0) (highest-digits 0))
    (loop
       (prog ((num-divisors (count-divisors triangular-num)))
	  (cond ((> num-divisors highest-digits)
		 (progn
		   (format t "~d: ~d~%" triangular-num num-divisors)
		   (setf highest-digits num-divisors))))
	  (cond ((> num-divisors 500) (return-from answer12 triangular-num)))
	  (setf triangular-num (+ x triangular-num))
	  (setf x (+ 1 x))))))
