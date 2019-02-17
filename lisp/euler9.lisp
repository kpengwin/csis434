(defun get-triplets-sum (total-sum)
  (loop for x from 1 to (- total-sum 2) appending
        (loop for y from 1 to (- total-sum 2) appending
              (loop for z from 1 to (- total-sum 2)
                    when (= total-sum (apply '+ (list x y z)))
                    when (< x y)
                    when (< y z)
                    when (= (+ (expt x 2) (expt y 2)) (expt z 2))
                    collect (list x y z)))))

(defun answer ()
  (apply '* (car (get-triplets-sum 1000))))
