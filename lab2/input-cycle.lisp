;;prompt-read: function adapted from Peter Siebel's book "Practical Common Lisp" Section 3
(defun prompt-read (prompt)
  (format *query-io* "~a >" prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun generate-clue ()
  (format nil "pretend this is a clue"))

w(defun main-loop (num-players)
  (let ((player-list (loop for y from 1 to num-players collecting y)) (black-list nil))
    (loop
       (loop for x in player-list do
	    (cond
	      ((not (member x black-list))
	       (progn
		 (format t "Player ~a, it is now your turn.~%" x)
		 (prog ((player-choice (prompt-read "Press ENTER to get your clue or type GUESS to try to guess.")))
		    (cond
		      ((equalp player-choice "GUESS")
		       (progn
			 (cond
			   ((y-or-n-p "Were you successful? ") (return-from main-loop 'GAME_OVER))
			   (t (push x black-list)))))
		      (t
		       (progn
			 (format t "~%~a~%" (generate-clue))
			 (prompt-read "Press ENTER when you are done.")
			 (format t "~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%")))))))
	      ((equalp (list-length black-list) (list-length player-list)) (return-from main-loop 'GAME_OVER))
	      (t nil))))))
