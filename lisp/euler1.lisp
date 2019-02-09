(defun 3or5 (num)
  (cond
    ((= (mod num 3) 0) num)
    ((= (mod num 5) 0) num)
    (t nil)))

(defun listem ()
  (delete nil (loop for x from 1 to 999 collecting (3or5 x))))

(defun answer ()
  (apply '+ (listem)))
