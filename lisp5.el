;gnu clisp  2.49.60

(defun flatten (lst)
  (if (null lst)
      '()
      (if (atom (car lst))
          (cons (car lst) (flatten (cdr lst)))
          (append (flatten (car lst)) (flatten (cdr lst))))))


(setq data '(1 (2 ((3))) (4 5)))

(format t "Входные данные: ~a~%" data)
(format t "Выходные данные: ~a~%" (flatten data))