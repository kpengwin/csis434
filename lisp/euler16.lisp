(defun count-digits (num)
  (cond
    ((< num 10) (return-from count-digits 1))
    (t (return-from count-digits (+ 1 (count-digits (floor (/ num 10))))))))

(defun n-digit (digit num)
  (return-from n-digit (* 1 (floor (/ (mod num (expt 10 digit)) (expt 10 (- digit 1)))))))

(defun split-digits (input-number)
  (prog ((new-list nil))
     (loop for x from 1 to (count-digits input-number) do
           (setf new-list (cons (n-digit x input-number) new-list)))
     (return-from split-digits new-list)))

(defun answer16 ()
  (apply '+ (split-digits (expt 2 1000))))
