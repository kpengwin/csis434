(defun divisible (num den)
  (if (equal (mod num den) 0) t nil))

(defun divisible-down-from (num)
  (loop for x from 20 downto 1 do
        (unless (divisible num x) (return-from divisible-down-from nil)))
  t)

(defun answer ()
  (loop for x from 1 to 1000000000000000 do
        (when (divisible-down-from x) (return-from answer x))))
