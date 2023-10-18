;gnu clisp  2.49.60
; Вариант 1
; Написать программу, вычисляющую количество раз, которое заданный список встречается в данном одномерном списке.
(defun count-sublist (main-list sublist)
  (let ((count 0))
    (dotimes (i (- (length main-list) (length sublist) 1))
      (when (equal (subseq main-list i (+ i (length sublist))) sublist)
        (incf count)))
    count))

(setq main-list '(1 2 3 4 1 2 3 4 1 2 3 1))
(setq sublist '(1 2 3))

(format t "Основной список: ~a~%" main-list)
(format t "Искомый подсписок: ~a~%" sublist)
(format t "Список встречается ~a раз(а) в основном списке.~%" (1+ (count-sublist main-list sublist)))
