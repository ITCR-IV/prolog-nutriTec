
print_diet :- 
	dieta(X), write(X), fail.

miembro(H,[H|_T]).
miembro(X,[_H|T]) :- miembro(X,T).

% tipos: proteina, keto, vegana, pescatariana
posibles_tipos([proteina, keto, vegana, pescatariana, []]).
% calorias: 1500-4000
% padecimientos: diabetes, dislipidemia, hipercolesterolemia, sobrepeso, desnutrido
posibles_padecimientos([diabetes, dislipidemia, hipercolesterolemia, sobrepeso, desnutrido]).
% actividad: 0, 1, 2, 3, 4, 5, 6, 7 (veces a la semana)
posibles_actividades([0, 1, 2, 3, 4, 5, 6, 7]).
% comidas: la comida que traigan
posibles_comidas(['gallo pinto', avena, granola, salchicha, jamón, pescado, carne, huevo, verduras, aguacate, leche, maní, fruta, papa, carne, tortilla, queso, pollo, atún]).

%%% DIETA 1
dieta('
   Desayuno:  4 Huevos picados con verduras. 
     1 de aguacate. 
Merienda Mañana: 1 taza leche. 
   1 taza de fruta. 
   1 cdta de mantequilla de maní. 
   Almuerzo:  1 taza de vegetales salteados. 
1 taza de pure de papas. 
1 bistec encebollado (300g) 
   Merienda tarde:  1 taza de café o té. 
      2 tortillas del Fogon. 
      30g de queso. 
      1 Fruta. 
   Cena:  1 taza de ensalada. 
    300g de pollo a la plancha. 
    1 lata de atún mediana en agua.') :- tipo(T), miembro(T, [proteina, keto, []]), write(T), nl,
					calorias(Cal), (Cal<4000, Cal>2900), 
					padecimientos(P), miembro(P, [desnutrido, diabetes, dislipidemia, []]), write(P), nl,
					actividad(A), miembro(A, [3, 4, 5, 6, 7]), write(A), nl,
					comida(C), not(miembro(C, [huevo, verduras, aguacate, leche, maní, fruta, papa, carne, tortilla, queso, pollo, atún])).

%%% DIETA 2
dieta('
   Desayuno:  ½ taza de gallo pinto. 
     1 Huevo + rebanada de queso blanco. 
     1 cdta de aceite de oliva para preparar el huevo. 
Merienda Mañana: ½ taza de yogurt light. 
   ¼ taza de granola sin azúcar añadida.
   1 taza de papaya picada. 
   Almuerzo:  2 tazas de ensalada Mixta 
1/3 taza de arroz + ½ taza de frijoles, garbanzos o lentejas. 
1 Filet de pescado a la plancho 
   Merienda tarde:  1 taza de café o té. 
      2 Rebanadas de pan Integral. 
      30g de atún en agua. 
      1 cdta de margarina. 
   Cena:  2 tazas de ensalada verde mixta. 
    1 tortilla de trigo. 
    1 lata de atún mediana en agua. 
    1/8 de aguacate. ') :- tipo(T), miembro(T, [pescatariana, []]), write(T), nl,
					calorias(Cal), (Cal<3300, Cal>2000), 
					padecimientos(P), miembro(P, [sobrepeso, desnutrido, diabetes, dislipidemia, []]), write(P), nl,
					actividad(A), miembro(A, [0, 1, 2, 3]), write(A), nl,
					comida(C), not(miembro(C, [huevo, queso, aguacate, leche, frijoles, fruta, garbanzos, papaya, lenteja, pescado, atún, queso, tortilla])).

%%% DIETA 3
dieta('
   Desayuno:  1 taza de gallo pinto o avena.
Merienda Mañana: 1 taza de frutas con granola.
   Almuerzo:  Sopa de garbanzos,
   	con 1 taza de vegetales.
   Merienda tarde:  1 taza de café o té. 
   	tortillas con queso de soya.
   Cena:  1 taza de ensalada
    	Pasta con salsa de tomate.') :- tipo(T), miembro(T, [vegana, []]), write(T), nl,
					calorias(Cal), (Cal<1200, Cal>2400), 
					padecimientos(P), miembro(P, [hipercolesterolemia, sobrepeso, diabetes, dislipidemia, []]), write(P), nl,
					actividad(A), miembro(A, [0, 1, 2, 3]), write(A), nl,
					comida(C), not(miembro(C, ['gallo pinto', verduras, garbanzos, avena, fruta, tortilla, queso, soya])).

%%% DIETA 4
dieta('
   Desayuno:  3 huevos.
Merienda Mañana: 1 taza leche. 
   1 cdta de mantequilla de maní. 
   Almuerzo:  Salchichas con jamón. 
   Merienda tarde: 100g de queso.
   Cena: Filet de carne.') :- tipo(T), miembro(T, [keto, []]), write(T), nl,
					calorias(Cal), (Cal<1200, Cal>2500), 
					padecimientos(P), miembro(P, [sobrepeso, []]), write(P), nl,
					actividad(A), miembro(A, [1, 2, 3]), write(A), nl,
					comida(C), not(miembro(C, [huevo, leche, maní, salchicha, jamón, queso, carne])).

%%% DIETA 5
dieta('
   Desayuno:  2 tazas de gallo pinto
     1 de aguacate. 
Merienda Mañana: 1 taza de fruta. 
   3 cdta de mantequilla de maní. 
   Almuerzo:  1 taza de vegetales salteados. 
	1 taza de pure de papas. 
	3 tazas de garbanzos.
   Merienda tarde:  1 taza de café o té. 
      1 Granola.
      1 Fruta. 
   Cena:  1 taza de ensalada. 
    2 tazas de garbanzos.
    .') :- tipo(T), miembro(T, [vegana, pescatariana []]), write(T), nl,
					calorias(Cal), (Cal<4200, Cal>2600), 
					padecimientos(P), miembro(P, [hipercolesterolemia, desnutrido, diabetes, dislipidemia, []]), write(P), nl,
					actividad(A), miembro(A, [1, 2, 3, 4, 5, 6, 7]), write(A), nl,
					comida(C), not(miembro(C, ['gallo pinto', aguacate, fruta, maní, vegetales, papa, garbanzos, granola, fruta])).
