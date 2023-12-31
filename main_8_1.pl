/******************************************************************************
Вариант 1
Создать динамическую базу данных "Таблица умножения"

*******************************************************************************/
% Динамическая база данных для хранения фактов таблицы умножения.
:- dynamic multiplication_fact/3.

% Предикат для заполнения базы данных таблицей умножения.
fill_multiplication_table :-
    between(1, 10, X), % Первый множитель от 1 до 10
    between(1, 10, Y), % Второй множитель от 1 до 10
    Result is X * Y,   % Вычисляем произведение
    assertz(multiplication_fact(X, Y, Result)), % Добавляем факт в базу данных
    fail. % Нам нужно перебрать все комбинации.
fill_multiplication_table.

% Предикат для вывода таблицы умножения.
display_multiplication_table :-
    write('Таблица умножения:'), nl,
    % Перебираем все факты в базе данных и выводим их.
    multiplication_fact(X, Y, Result),
    format('~w * ~w = ~w~n', [X, Y, Result]), % Изменено форматирование для новой строки
    fail. % Продолжаем перебирать факты.
display_multiplication_table :- nl.

    
% Предикат для удаления факта по номеру строки.
remove_row(Number) :-
    retract(multiplication_fact(Number, _, _)),
    fail.


% Инициализация и запуск программы.
:- fill_multiplication_table.

% Вывод таблицы умножения после инициализации.
:- display_multiplication_table.

% Удаляем четвертую строку.
:-remove_row(4).

% Перепечатываем таблицу умножения после удаления строки.
:-display_multiplication_table.