; Two examples from The Little Schemer
; Illustrating basic branching/recursion

(defun atom? (x) ( not (listp x)))

(defun lat? (l)
  (cond
    ((null l) t)
    ((atom? (car l)) (lat? (cdr l)))
    (t nil)))

(defun member? (a lat)
  (cond
    ((null lat) nil)
    (t (or (eq (car lat) a)
              (member? a (cdr lat))))))

(setq l '(bacon and eggs))

(print (lat? l))

(setq lat '(mashed potatoes and meat gravy))

(setq a 'cranberry)

(print (member? a lat))
