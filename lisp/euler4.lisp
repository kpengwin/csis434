(defun count-digits (num)
  (cond
    ((< num 10) (return-from count-digits 1))
    (t (return-from count-digits (+ 1 (count-digits (floor (/ num 10))))))))

(defun last-digit (num)
  (return-from last-digit (mod num 10)))

(defun first-digit (num)
  (return-from first-digit (* 1 (floor (/ num (expt 10 (- (count-digits num) 1)))))))

(defun n-digit (digit num)
  (return-from n-digit (* 1 (floor (/ (mod num (expt 10 digit)) (expt 10 (- digit 1)))))))

(defun is-palindrome (num)
  (prog ((length (count-digits num)))
    (loop for x from 1 to (floor (/ length 2)) do
          (cond
            ((= (n-digit x num) (n-digit (- (+ 1 length) x) num)) t)
            (t (return-from is-palindrome nil))))
     (return-from is-palindrome t)))

(defun lop-digits (num)
  (prog ((n num))
     (setf n (floor (/ n 10)))
     (setf n (- n (* (first-digit n) (expt 10 (- (count-digits n) 1)))))
     (return-from lop-digits n)))

(defun check-for-palindromes (second-num)
  (loop for x from second-num downto 1 do
        (when (is-palindrome (* x second-num)) (return-from check-for-palindromes (* x second-num)))))

(defvar *G* nil)
(loop for x from 999 downto 1 do (setf *G* (cons (check-for-palindromes x) *G*)))
(setf *G* (remove nil *G*))
(reduce #'max *G*)
