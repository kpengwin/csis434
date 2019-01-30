;   CodingGround link: http://tpcg.io/xEvSiK
;
;   Explanation: A macro is not a function. According to http://wiki.c2.com/?LispMacro
;       "x[Lisp macros] are a way to transform Lisp code. During a macroexpansion phase,
;       the Lisp expression will be passed to the macro function. The macro function
;       can do arbitrary computation at macroexpansion time. The result of this call
;       has to be again Lisp code. This Lisp code then is what the interpreter or
;       compiler sees and executes or compiles."
;
;   The original macro - "setTo10" does nothing of the sort. It actually does more like:
;   1. recieve the symbol 'x'
;   2. do nothing with it
;   3. assign '10' to the local variable named num
;   4. print out the value of that local variable
;
;   After it is complete, x still equals 25.
;
;   Our goal in class was to, instead, increment the number. The macro "plusOne" does this
;   1. recieve the symbol x, x is filled in for num below
;   2. create the command (setq num (+ 1 num)) EXCEPT - x is substituted for num
;   3. evaluate (now we have run: (setq x(+ 1 x)) which is what we wanted )
;
;   Also there's a builtin called incf which does the same thing.


(defmacro setTo10(num)
 (setq num 10)(format t "Inside setTo10  num = ~D~%" num))

(defmacro plusOne (num)
 `(setq ,num (+ 1 ,num)))

(defvar x 25)

(format t "After assignment: x = ~D~%" x)

(setTo10 x)


(format t "After setTo10:    x = ~D~%" x)

(plusOne x)

(format t "After plusOne:    x = ~D~%" x)

(incf x)

(format t "After incf:       x = ~D~%" x)
