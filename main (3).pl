/******************************************************************************
Вычислить значения выражений:
Вариант 1.
1.	(x2 + 6Y) / (8 – е2)
2.	Y*ln(x)*(cos(60o)/tg(45o))+Y

*******************************************************************************/
main:-
        process,
        halt.

process:-
        X=2,
        Y=3,
        
        % градусы в радианы
        Degrees60 = 60,
        Degrees45 = 45,
        Radians60 is Degrees60 * pi / 180,
        Radians45 is Degrees45 * pi / 180,
        
        Expression1 is (X*X + 6^Y) / (8 - exp(1)^2),
        Expression2 is Y * log(X) * (cos(Radians60) / tan(Radians45)) + Y,
        
        write('Значение выражения (x^2 + 6Y) / (8 - e^2) при X = '), 
            write(X), write(' и Y = '), write(Y), write(' равно: '), write(Expression1), nl,
        write('Значение выражения Y * ln(x) * (cos(60) / tan(45)) + Y при X = '),
            write(X), write(' и Y = '), write(Y), write(' равно: '), write(Expression2), nl.
:- main.
