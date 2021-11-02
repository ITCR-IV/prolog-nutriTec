:- [diets].

% Definición de reglas para los parámetros
tipo(X):- posibles_tipos(L), askTipo(X,L).
calorias(X):- askCalorias(X, 1200, 4200).
padecimientos(X):- posibles_padecimientos(L), askPadecimientos(X,L).
actividad(X):- askActividad(X).
comida(X):- askComida(X).

% main
main:- identify.

identify:-
	retractall(known(_,_)),         % clear stored information
	dieta(X),
	write('Su dieta sería:'),nl,write(X),nl.
identify:-
	write('Sus selecciones no calzan con ninguna dieta.'),nl.

% Preguntar el tipo de dieta que prefiere
askTipo(X,_):-  % Si ya se conoce entonces solo se toma la conocida
	known(tipo,X), !.
askTipo(X,Menu):-  % Si no se conoce entonces se pregunta y se guarda como "known"
	write('Tiene alguna preferencia para el tipo de dieta a realizar entre las siguientes opciones?'),
	 nl, display_menu(Menu), read(X), asserta(known(tipo, X)).

% Preguntar calorías
askCalorias(X, _, _):-
	known(calorias,X), !.

askCalorias(X, Min, Max):-
	write('Cuántas calorías desea consumir al día en un rango entre '),
	write(Min), write(' y '), write(Max), write('?'), nl, read(X),
	asserta(known(calorias,X)).

% Preguntar padecimientos
askPadecimientos(X,_):- 
	 known(padecimientos, X), !.
askPadecimientos(X,Menu):-
	write('Tiene alguna enfermedad que pueda afectar su dieta, como las siguientes opciones?'),
	nl, display_menu(Menu), read(X), asserta(known(padecimientos,sobrepeso)).

% Preguntar nivel de actividad
askActividad(X):-
	known(actividad, X), !.
askActividad(X):- 
	write('Cuántas veces a la semana es activo/a físicamente?'),
	nl, read(X), asserta(known(actividad,X)).

% Preguntar comida no deseada
askComida(X):-
	known(comida, X).
askComida(X):- 
	write('Hay alguna comida en específico que no desee comer?'),
	nl, read(X),
	asserta(known(comida,X)).

% Funciones auxiliares para mostrar menú de opciones (como para mostrar tipos de padecimientos)
display_menu(Menu):-
	disp_menu(Menu), !. % No backtrackear cuando se termina

disp_menu([]). % Fin de recursión
disp_menu([[] | Rest]):- % Saltarse el elemento vacío []
	disp_menu(Rest).

disp_menu([Item | Rest]):- % Recursivamente escribir la lista
	write('- '),write(Item),nl, 
	disp_menu(Rest).
