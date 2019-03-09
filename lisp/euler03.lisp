(defun primep (num)
  (if (equal num 1) (return-from primep t))
  (loop for x from 2 to (floor (/ num 2)) do
        (if (equal 0 (mod num x)) (return-from primep nil)))
  (return-from primep t))

(defun factor-once (num)
  (prog ((answer nil))
     (loop for x from 2 to (floor (/ num 2)) do
           (if (equal 0 (mod num x)) (progn
                                       (setf answer (cons (/ num x) (cons x answer)))
                                       (return-from factor-once answer))))
     (return-from factor-once nil)))

(defun factor-all (num)
  (let ((result (factor-once num)) (temp nil))
    (loop
      (setf temp (factor-once (car result)))
      (if temp
          (setf result (append temp (cdr result)))
(return-from factor-all result)))))
