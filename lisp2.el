;gnu clisp  2.49.60

;Вариант 1
; Пользователь вводит два числа x и y. Программа должна вывести все числа от x до y (или от y до x) включительно.
(defun print-range (x y)
  (let ((start (min x y))
        (end (max x y)))
    (loop for num from start to end
          do (format t "~a~%" num))))

(format t "Введите два числа X и Y: ")
(setq x (read))
(setq y (read))
(print-range x y)
