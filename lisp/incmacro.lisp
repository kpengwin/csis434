;   Coding Ground link: http://tpcg.io/cZAJIi
;
;   Explanation: A macro is not a function. According to http://wiki.c2.com/?LispMacro
;       "x[Lisp macros] are a way to transform Lisp code. During a macroexpansion phase,
;       the Lisp expression will be passed to the macro function. The macro function
;       can do arbitrary computation at macroexpansion time. The result of this call
;       has to be again Lisp code. This Lisp code then is what the interpreter or
;       compiler sees and executes or compiles."
;   In this case, we call the function "setTo10" (misnamed now) with "x"
;   x is not 25, x is the symbol which points to 25
;   So in order to use 25, the option used here is to use 'symbol-value' to ask:
;   "What is the value of the symbol x?" which is 25.
;   Note though that this doesn't actually point x to a different value - after the 
;   macro call, x is still 25. (This is true of the original "setTo10" macro too)
        
(defmacro setTo10 (num) (setq num (+ 1 (symbol-value num))) (print num) )

(setq x 20)

(print x)

(setTo10 x)
