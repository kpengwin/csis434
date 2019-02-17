(defvar *weapons* nil)
(defvar *locations* nil)
(defvar *suspects* nil)
(defvar *times* nil)
(defvar murderer nil)

(defmacro adder (name single global)
  `(defun ,name (,single) (setf ,global (cons ,single ,global))))
(adder add-weapon weapon *weapons*)
(adder add-location location *locations*)
(adder add-suspect suspect *suspects*)
(adder add-time time *times*)

(defun user-add-weapon ()
  (format t "~%What weapon would you like to add? ")
  (add-weapon (read)))

(defun user-add-location ()
  (format t "~%What location would you like to add? ")
  (add-location (read)))

(defun user-add-time ()
  (format t "~%What time would you like to add? ")
  (add-time (read)))

(defun user-add-suspect ()
  (prog ((suspect nil))
     (format t "~%What is the name of the suspect? ")
     (setf suspect (cons (read) suspect))
     (format t "What is the age of the suspect? ")
     (setf suspect (cons (read) suspect))
     (format t "What is the gender of the suspect (m/f)? ")
     (setf suspect (cons (read) suspect))
     (add-suspect suspect)))

(defun clue-game-generator-input ()
  (format t "How many weapons (Max 8)? ")
  (loop for x from 1 to (read) do (user-add-weapon))
  (format t "How many players (Max 10)? ")
  (loop for x from 1 to (read) do (user-add-suspect))
  (format t "How many locations (Max 6)? ")
  (loop for x from 1 to (read) do (user-add-location))
  (format t "How many times (Max 6)? ")
  (loop for x from 1 to (read) do (user-add-time)))

(defun clue-game-generator-output ()
  ;; need to start by removing the actual murderer
  (setf murderer (pick-a-murderer))
  (prog ((prolog-statements (append
                             (loop for x in *suspects* collecting (generate-age x))
                             (loop for x in *suspects* collecting (generate-gender x))
                             (loop for x in *suspects* collecting (generate-weapons x))
                             (loop for x in *suspects* appending
                                  (loop for y in *times* collecting (generate-time-locations x y)))
                             (generate-murderer-stuff murderer))))
     (setf prolog-statements (sort prolog-statements #'string-lessp))
     (loop for x in prolog-statements do (format t "~a~%" x)))
  ;; generate all the stuff for the actual murderer
  ;; need to end by sorting the whole list
  ;; then output list
  )

(defun pick-a-murderer ()
  (prog* ((rng (random (list-length *suspects*))) (return-val (nth rng *suspects*)))
     (setf *suspects* (remove return-val *suspects* :test #'equal))
     (return-from pick-a-murderer return-val)))

(defun generate-age (suspect)
  (format nil "age(~(~a~),~d)." (third suspect) (second suspect)))

(defun generate-gender (suspect)
  (cond
    ((equalp 'm (first suspect)) (format nil "male(~(~a~))." (third suspect)))
    (t (format nil "female(~(~a~))." (third suspect)))))

(defun generate-weapons (suspect)
  (let ((rng (random (list-length *weapons*))))
    (format nil "weapon(~(~a,~a~))." (third suspect) (nth rng *weapons*))))

(defun generate-time-locations (suspect time)
  (let ((rng (random (list-length *locations*))))
    (format nil "tl(~(~a,~a,~a~))." (third suspect) time (nth rng *locations*))))

(defun generate-murderer-stuff (murderer)
  (let* ((rng-weapon (random (list-length *weapons*)))
        (rng-location (random (list-length *locations*)))
        (rng-time (random (list-length *times*))))
    (append
     (list (generate-age murderer))
     (list (generate-gender murderer))
     (loop for x from 0 to (- (list-length *times*) 1) collecting
           (cond
             ((= rng-time x) (format nil "tl(~(~a,~a,~a~))." (third murderer) (nth rng-time *times*) (nth rng-location *locations*)))
             (t (generate-time-locations murderer (nth x *times*)))))
     (list (format nil "weapon(~(~a,~a~))." (third murderer) (nth rng-weapon *weapons*)))
     (list (format nil "crime(~(~a,~a,~a,~a,~a,~a~))."
                   (gender (first murderer)) (third murderer) (nth rng-time *times*) (nth rng-location *locations*) (nth rng-weapon *weapons*) (second murderer))))))

(defun gender (letter)
  (cond
    ((equalp letter 'f) (return-from gender 'female))
    (t (return-from gender 'male))))

(defun wipe-vars ()
  (setf *weapons* nil)
  (setf *suspects* nil)
  (setf *locations* nil)
  (setf *times* nil))

(clue-game-generator-input)
(clue-game-generator-output)


