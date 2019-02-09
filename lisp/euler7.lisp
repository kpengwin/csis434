(defun prime-sieve (topnum)
  (prog ((candidate-list (loop for x from 2 to topnum collecting x)) (prime-list nil))
    (loop while candidate-list
          do (progn
               (setf prime-list (cons (car candidate-list) prime-list))
               (setf candidate-list (remove-if #'(lambda (x) (let ((y (car candidate-list))) (equal (mod x y) 0))) candidate-list))))
     (return (reverse prime-list))))

(defun answer ()
  (nth 10000 (prime-sieve 110000))) (tim)
