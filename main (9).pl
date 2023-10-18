/******************************************************************************
Разработайте экспертную систему идентификации типа транспортного средства
(автобус, велосипед, мотоцикл, мотороллер).
*******************************************************************************/
% База знаний о транспортных средствах и их характеристиках.
vehicle(bus, wheels(4), engine(yes)).
vehicle(bicycle, wheels(2), engine(no)).
vehicle(motorcycle, wheels(2), engine(yes)).
vehicle(cart, wheels(4), engine(no)).


% Правило идентификации типа транспортного средства.
identify_vehicle(VehicleType) :-
    write('Введите характеристики транспортного средства:'), nl,
    write('Количество колес (2 или 4): '),
    read(Wheels),
    write('Наличие двигателя (yes/no): '),
    read(Engine),
    vehicle(VehicleType, wheels(W), engine(E)),
    (Wheels = W, Engine = E ->
        write('Идентифицировано транспортное средство: '), write(VehicleType), nl;
    fail).
identify_vehicle(_).

% Главный предикат.
main :-
    identify_vehicle(_),
    main.



:- main.
