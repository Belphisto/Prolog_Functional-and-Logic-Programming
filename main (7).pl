/******************************************************************************
Задания для самостоятельной работы
Вариант 1.
Описать предметную область «Страны», включающую следующие данные: страна, столица, население, территория. 
Вывести страны и их столицы, у которых численность населения превышает 1000000 человек.

*******************************************************************************/
% Предикаты о странах:  страна, столица, население, территория.
country(russia, moscow, 10000001 , 100).
country(china, beijing, 10000, 100).
country(india, new_delhi, 2000000 , 2000).
country(brazil, brasilia, 3000000 , 300).
country(usa, washington, 1000 , 2000).

main:-
        find_countries_with_population_over_1million,
        halt.

find_countries_with_population_over_1million:-
        %  предикат country для получения данных о странах.
        country(Country, Capital, Population, _),
        % численность населения больше 1000000 человек.
        Population > 1000000,
        write('Страна: '), write(Country), nl,
        write('Столица: '), write(Capital), nl, nl,
        fail. % к следующей стране (если есть).
        find_countries_with_population_over_1million.
:- main.
