(defun sum-of-squares (topnum)
  (apply '+ (loop for x from 1 to topnum collecting (expt x 2))))

(defun square-of-sums (topnum)
  (expt (apply '+ (loop for x from 1 to topnum collecting x)) 2))

(defun difference-between-sum-squares-and-square-sums (topnum)
  (- (square-of-sums topnum) (sum-of-squares topnum)))
