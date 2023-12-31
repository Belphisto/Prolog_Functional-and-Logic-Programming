/******************************************************************************
Задание 1: Опишите предикат, содержащий сведения из предметной области "Подарки":
Ник подарил Тому книгу.
Мэри подарила Тому ручку.
Рик подарил Мэри игрушку.
Боб подарил Пэт игрушку.
Получите ответы на следующие вопросы:
•	Правда ли, что Рик подарил Мэри игрушку? 
•	Правда ли, что Ник подарил Тому игрушку?
•	Что подарила на день рождения Тому Мэри?
•	Что подарили Тому на день рождения?
•	Кто подарил Пэт игрушку?

*******************************************************************************/


% Предикаты о подарках
podaril(nik, tom, kniga).
podaril(mary, tom, ruchka).
podaril(rik, mary, igrushka).
podaril(bob, pat, igrushka).

% Вопросы и ответы
rik_podaril_mary_igrushku :- podaril(rik, mary, igrushka).
nik_podaril_tomu_igrushku :- podaril(nik, tom, igrushka).

% Предикат для получения подарков, которые Мэри подарила Тому
podarila_mary_tomu(X) :- podaril(mary, tom, X).

% Предикат для получения всех подарков, которые Тому получил
podarili_tomu(X) :- findall(P, (podaril(_, tom, P); podaril(_, tom, P)), TempList), list_to_set(TempList, X).

% Предикат для определения, кто подарил игрушку Пэту
kto_podaril_patu_igrushku(X) :- podaril(X, pat, igrushka).

main :-
    process,
    halt.

process :-
    % Запуск запросов
    write('Правда ли, что Рик подарил Мэри игрушку? '),
    (rik_podaril_mary_igrushku -> write('Да'); write('Нет')),nl,
    
    write('Правда ли, что Ник подарил Тому игрушку? '),
    (nik_podaril_tomu_igrushku -> write('Да'); write('Нет')),nl,
    
    write('Что подарила на день рождения Тому Мэри? '),podarila_mary_tomu(X),write(X),nl,
    
    write('Что подарили Тому на день рождения? '),podarili_tomu(Y),write(Y),nl,
    
    write('Кто подарил Пэту игрушку? '),kto_podaril_patu_igrushku(Z),write(Z),nl.
:- main.


