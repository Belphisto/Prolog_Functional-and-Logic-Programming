/******************************************************************************
Задание 2: Рассмотрите дерево родственных отношений:
Мария родитель Федора
Иван родитель Федора
Мария родитель Степана
Иван родитель Степана

Федор родитель Ольги
Федор родитель Татьяны

Сформулируйте на Прологе следующие вопросы в виде правил 
1)	Является ли Федор родителем Ольги?
2)	Кто является родителем Татьяны?
3)	Кто дети Ивана?
4)	Кто является родителем родителя Ольги?
5)	Кто внуки Ивана?
6)	Есть ли у Федора и Степана общий родитель?
7)	Кто чей родитель?
*******************************************************************************/
%Предикаты о родителях и детях
roditel(maria, fedor).
roditel(maria, stepan).
roditel(ivan, fedor).
roditel(ivan, stepan).
roditel(fedor, olga).
roditel(fedor, tatyana).

% Вопросы в виде правил
% Является ли Федор родителем Ольги?
rod_parent(X, Y) :- roditel(X, Y), Y = olga.
% Кто является родителем Татьяны?
rod_parent(X, tatyana) :- roditel(X, tatyana).
% Кто дети Ивана?
dety(Ivan, X) :- roditel(Ivan, X).
% Кто является родителем родителя Ольги?
roditel_roditelya_olgi(X) :- roditel(Y, olga), roditel(X, Y).
% Кто внуки Ивана?
vnuki(Ivan, X) :- roditel(Ivan, Y), roditel(Y, X).
%Есть ли у Федора и Степана общий родитель?
obshiy_roditel(X, Y) :- roditel(Z, X), roditel(Z, Y), X \= Y.
%Кто чей родитель?
chey_roditel(X, Y) :-
    (roditel(X, Y) -> 
        write(X), write(' родитель '), write(Y)
    ; roditel(Y, X) ->
        write(Y), write(' родитель '), write(X)
    ; 
        write(X), write(' и '), write(Y), write(' не связаны родительскими отношениями')
    ),
    nl.


/******************************************************************************
Задание 3:
К базе знаний «Родственники» добавьте отношения «мужчина» и «женщина» и правило, определяющее, являются ли два субъекта друг другу сестрами.
Используя процесс вычисления цели (запустив проект), получите ответ на вопрос: сестра ли Ольга Татьяне?
*******************************************************************************/
% Предикаты о поле каждого субъекта
gender(maria, zhenshchina).
gender(ivan, muzhchina).
gender(fedor, muzhchina).
gender(olga, zhenshchina).
gender(tatyana, zhenshchina).
gender(fedor, muzhchina).

% Предикат для определения, являются ли два субъекта сестрами
sisters(X, Y) :- 
    roditel(Z, X), 
    roditel(Z, Y),
    X \= Y,
    gender(X, zhenshchina), 
    gender(Y, zhenshchina).


/******************************************************************************
Задание 4:
Введите отношение «имеет_ребенка»: всякий родитель имеет ребенка.
Ответьте на вопрос: есть ли дети у Ивана, у Степана?
*******************************************************************************/    
% Отношение "имеет_ребенка"
imeet_child(X) :- roditel(X, _).
 
 
/******************************************************************************
Задание 5:
Определите отношение дядя(X, Y) через отношение родитель и брат.
Является ли Степан дядей Ольги? Является ли Иван дядей Федору?
*******************************************************************************/
% Отношение "брат"
brat(X, Y) :- 
    X \= Y,  % Проверка, чтобы X и Y были разными
    roditel(Z, X),  % Z - общий родитель
    roditel(Z, Y).

% Отношение "дядя"
dyadya(X, Y) :- 
    X \= Y,  % Проверка, чтобы X и Y были разными
    brat(X, Z),  % X - брат Z
    roditel(Z, Y).


/******************************************************************************
Основная программа
*******************************************************************************/
main:-
        process1,
        process2,
        process3,
        process4,
        halt.

%вызов вопросов задания 2
process1:-
        write('1. Является ли Федор родителем Ольги? '),
            (rod_parent(fedor, olga) -> write('Да'); write('Нет')), nl,
          
        write('2. Кто является родителем Татьяны? '),
            rod_parent(X, tatyana), write(X), nl,
            
        write('3. Кто дети Ивана? '),
            findall(Y, dety(ivan, Y), Child), write(Child), nl,
            
        write('4. Кто является родителем родителя Ольги? '),
            findall(Y, roditel_roditelya_olgi(Y), Roditely), write(Roditely), nl,
            
        write('5. Кто внуки Ивана? '),
            findall(Y, vnuki(ivan, Y), AllVnuki), write(AllVnuki), nl,
            
        write('6. Есть ли у Федора и Степана общий родитель? '),
            (obshiy_roditel(fedor, stepan) -> write('Да'); write('Нет')), nl,
            
        write('7. Кто чей родитель? '),
            chey_roditel(fedor, olga),
        write('7. Кто чей родитель? '),
            chey_roditel(tatyana, maria),
        write('7. Кто чей родитель? '),
            chey_roditel(olga, olga),
        write('7. Кто чей родитель? '),
            chey_roditel(olga, fedor), nl.
            
%вызов вопросов задания 3
process2:-
        write('Сестра ли Ольга Татьяне? '),
            (sisters(olga, tatyana) -> write('Да'); write('Нет')), nl.
            
%вызов вопросов задания 4
process3:-
        write('Есть ли дети у Ивана? '),
            (imeet_child(ivan) -> write('Да'); write('Нет')), nl,
            
        write('Есть ли дети у Степана? '),
            (imeet_child(stepan) -> write('Да'); write('Нет')), nl.
%вызов вопросов задания 5
process4:-
        write('Степан является дядей Ольги? '),
            (dyadya(stepan, olga) -> write('Да'); write('Нет')),nl,
    
        write('Иван является дядей Федору? '),
            (dyadya(ivan, fedor) -> write('Да'); write('Нет')), nl.
:- main.