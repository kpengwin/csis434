(defun fizzbuzz ()
  (loop for x from 1 to 100 do
        (cond
          ((and (= 0 (mod x 3)) (= 0 (mod x 5))) (format t "FizzBuzz ~%"))
          ((= 0 (mod x 3)) (format t "Fizz~%"))
          ((= 0 (mod x 5)) (format t "Buzz~%":wt (format t "~d~%" x)))))
