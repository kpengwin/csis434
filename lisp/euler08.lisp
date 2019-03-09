(defvar *the-big-number* 7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450)

(defvar *the-big-list* nil)
(setf *the-big-list* (split-digits *the-big-number*))


(defun split-digits (input-number)
  (prog ((new-list nil))
     (loop for x from 1 to (count-digits input-number) do
           (setf new-list (cons (n-digit x input-number) new-list)))
     (return-from split-digits new-list)))

(defun count-digits (num)
  (cond
    ((< num 10) (return-from count-digits 1))
    (t (return-from count-digits (+ 1 (count-digits (floor (/ num 10))))))))

(defun n-digit (digit num)
  (return-from n-digit (* 1 (floor (/ (mod num (expt 10 digit)) (expt 10 (- digit 1)))))))

(defun adjacent-lists (sublist-length input-list)
  (let ((list-of-sublists
          (loop for x from 0 to
                (- (list-length input-list) sublist-length) collecting
                (let ((sublist nil)) (setf sublist
                                           (loop for y from 0 to (- sublist-length 1) collecting
                                                 (nth (+ x y) input-list)))))))
    (return-from adjacent-lists list-of-sublists)))

(defun product-of-list-of-lists (input-list)
  (let ((product-list nil))
    (setf product-list
          (loop for x in input-list collecting
                (apply '* x)))))

(defun answer ()
  (reduce #'max (product-of-list-of-lists (adjacent-lists 13 *the-big-list*))))
