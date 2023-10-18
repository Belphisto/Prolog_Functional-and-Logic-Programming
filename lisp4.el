;gnu clisp  2.49.60

(defun nested-sum (lst)
  (let ((sum 0))
    (dolist (item lst sum)
      (if (listp item)
          (incf sum (nested-sum item))
          (incf sum item)))))

(setq data '(1 (2 ((3))) (4 5 5)))

(format t "Входные данные: ~a~%" data)
(format t "Выходные данные: ~a~%" (nested-sum data))
