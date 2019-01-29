(defmacro setTo10 (num) (setq num (+ 1 (symbol-value num))) (print num) )

(setq x 25)

(print x)

(setTo10 x)
