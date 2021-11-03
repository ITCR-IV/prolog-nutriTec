%Oración inicial de Saludo a Nutritec

oracion(S0,S):-agradecimiento(S0,S1),sintagma_nominal(Pers,Num,Gend,S1,S2),sintagma_verbal(Pers,Num,S2,S).
oracion(S0,S):-agradecimiento(S0,S1),advebio_negacion_afirmación(S1,S2),sintagma_nominal(Pers,Num,Gend,S2,S3),sintagma_verbal(Pers,Num,S3,S).
oracion(S0,S):-sintagma_nominal(Pers,Num,_Gend,S0,S1),sintagma_verbal(Pers,Num,S1,S).
oracion(S0,S):-advebio_negacion_afirmación(S0,S1),sintagma_nominal(Pers,Num,_Gend,S1,S2),sintagma_verbal(Pers,Num,S2,S).
oracion(S0,S):-sintagma_verbal(Pers,Num,S0,S).
oracion(S0,S):-sintagma_nominal(Pers,Num,Gend,S0,S).
oracion(S0,S):-agradecimiento(S0,S).
oracion(S0,S):-saludoGeneral(S0,S).
oracion(S0,S):-advebio_negacion_afirmación(S0,S).

sintagma_nominal(Pers,Num,Gend,S0,S):-pronombre(Pers,Num,Gend,S0,S).
sintagma_nominal(Pers,Num,Gend,S0,S):-complemento_directo(Pers,Num,Gend,S0,S).

complemento_directo(Pers,Num,Gend,S0,S):-nombre(Pers,Num,Gend,S0,S).
complemento_directo(Pers,Num,Gend,S0,S):-adjetivo(Num,Gend,S0,S).
complemento_directo(Pers,Num,Gend,S0,S):-nombre(Pers,Num,Gend,S0,S1),adjetivo(Num,Gend,S1,S).
complemento_directo(Pers,Num,Gend,S0,S):-determinante(Num,Gend,S0,S1),nombre(Pers,Num,Gend,S1,S).
complemento_directo(Pers,Num,Gend,S0,S):-determinante(Num,Gend,S0,S1),nombre(Pers,Num,Gend,S1,S2),adjetivo(Num,Gend,S2,S).

sintagma_verbal(Pers,Num,S0,S):-verbo_transitivo(Pers,Num,S0,S).
sintagma_verbal(Pers,Num,S0,S):-verbo_transitivo(Pers,Num,S0,S1),complemento_directo(_Pers2,_Num2,_Gend2,S1,S).
sintagma_verbal(Pers,Num,S0,S):-verbo_transitivo(Pers,Num,S0,S1),verbo_infinitivo(S1,S).
sintagma_verbal(Pers,Num,S0,S):-verbo_transitivo(Pers,Num,S0,S1),verbo_infinitivo(S1,S2),complemento_directo(_Pers2,_Num2,_Gend2,S2,S).

saludoGeneral(S0,S):-saludo(S0,S1),nombreNutriTec(S1,S).

determinante(s,m,['el'|S],S).
determinante(s,m,['al'|S],S).
determinante(p,m,['los'|S],S).
determinante(p,m,['a','los'|S],S).
determinante(s,f,['la'|S],S).
determinante(s,f,['a','la'|S],S).
determinante(p,f,['las'|S],S).
determinante(p,f,['a','las'|S],S).
determinante(s,m,['un'|S],S).
determinante(s,m,['a','un'|S],S).
determinante(p,m,['unos'|S],S).
determinante(p,m,['a','unos'|S],S).
determinante(s,f,['una'|S],S).
determinante(s,f,['a','una'|S],S).
determinante(p,f,['unas'|S],S).
determinante(p,f,['a','unas'|S],S).

nombre(t,s,m,['sobrepeso'|S],S).
nombre(t,p,m,['mariscos'|S],S).
nombre(t,s,f,['avena'|S],S).
nombre(t,s,m,['peso'|S],S).
nombre(t,s,f,['granola'|S],S).
nombre(t,s,f,['salchicha'|S],S).
nombre(t,s,m,['jamón'|S],S).
nombre(t,s,m,['pescado'|S],S).
nombre(t,s,m,['huevo'|S],S).
nombre(t,p,f,['verduras'|S],S).
nombre(t,s,f,['leche'|S],S).
nombre(t,s,f,['fruta'|S],S).
nombre(t,s,f,['tortilla'|S],S).
nombre(t,s,m,['queso'|S],S).
nombre(t,s,m,['pollo'|S],S).
nombre(t,s,m,['atún'|S],S).
nombre(t,s,m,['maní'|S],S).
nombre(t,s,f,['carne'|S],S).
nombre(t,s,f,['diabetes'|S],S).
nombre(t,s,f,['dislipidemia'|S],S).
nombre(t,s,f,['hipercolosterolemia'|S],S).
nombre(t,s,f,['con','hipercolosterolemia'|S],S).
nombre(t,s,m,['sobrepeso'|S],S).
nombre(t,s,m,['con','sobrepeso'|S],S).
nombre(t,s,m,['desnutrición'|S],S).
nombre(t,s,m,['con','desnutrición'|S],S).
nombre(t,s,m,['desnutrido'|S],S).
nombre(t,s,m,['estilo','de','vida'|S],S).
nombre(t,s,f,['dieta'|S],S).
nombre(t,s,f,['preferencia'|S],S).
nombre(t,s,m,['ciclismo'|S],S).
nombre(t,s,f,['natación'|S],S).
nombre(t,s,m,['deporte'|S],S).
nombre(t,p,f,['prefrencias'|S],S).
nombre(t,p,f,[_NumCalorias,'calorías'|S],S).
nombre(t,s,m,['activo'|S],S).
nombre(t,p,f,[_NumVeces,'veces','a','la','semana'|S],S).

adjetivo(s,m,['saludable'|S],S).
adjetivo(s,f,['saludable'|S],S).
adjetivo(p,m,['saludables'|S],S).
adjetivo(p,f,['saludables'|S],S).
adjetivo(s,m,['sano'|S],S).
adjetivo(p,m,['sanos'|S],S).
adjetivo(s,f,['sana'|S],S).
adjetivo(p,f,['sanas'|S],S).
adjetivo(s,f,['keto'|S],S).
adjetivo(s,f,['vegana'|S],S).
adjetivo(s,f,['pescaatriana'|S],S).
adjetivo(s,f,['proteica'|S],S).
adjetivo(s,f,['normal'|S],S).
adjetivo(s,m,['normal'|S],S).
adjetivo(s,m,[_NumVeces,'veces','a','la','semana'|S],S).

verbo_infinitivo(['llevar'|S],S).
verbo_infinitivo(['ser'|S],S).
verbo_infinitivo(['llegar'|S],S).
verbo_infinitivo(['comer'|S],S).
verbo_infinitivo(['consumir'|S],S).
verbo_infinitivo(['a correr'|S],S).
verbo_infinitivo(['a nadar'|S],S).
verbo_infinitivo(['a caminar'|S],S).
verbo_infinitivo(['hacer'|S],S).
verbo_infinitivo(['estar'|S],S).
verbo_infinitivo(['seguir'|S],S).

verbo_transitivo(p,s,['salgo'|S],S).
verbo_transitivo(p,s,['corro'|S],S).
verbo_transitivo(p,s,['corro'|S],S).
verbo_transitivo(p,s,['deseo'|S],S).
verbo_transitivo(p,s,['deseo'|S],S).
verbo_transitivo(p,s,['tengo'|S],S).
verbo_transitivo(t,s,['quiere'|S],S).
verbo_transitivo(p,s,['quiero'|S],S).
verbo_transitivo(p,s,['estoy'|S],S).
verbo_transitivo(t,s,['diagnosticaron'|S],S).
verbo_transitivo(t,s,['han','diagnosticado'|S],S).
verbo_transitivo(t,s,['recomendaron'|S],S).
verbo_transitivo(t,s,['han','recomendado'|S],S).
verbo_transitivo(p,s,['había','pensado'|S],S).
verbo_transitivo(p,s,['había','calculado'|S],S).
verbo_transitivo(p,s,['prefiero'|S],S).
verbo_transitivo(p,s,['hago'|S],S).
verbo_transitivo(t,s,['gusta'|S],S).

pronombre(p,s,n,['Yo'|S],S).
pronombre(p,s,n,['yo'|S],S).
pronombre(p,s,n,['Me'|S],S).
pronombre(t,s,n,['Me'|S],S).

agradecimiento(['Gracias,'|S],S).
agradecimiento(['Muchas','Gracias,'|S],S).
agradecimiento(['Gracias'|S],S).
agradecimiento(['Muchas','Gracias'|S],S).

advebio_negacion_afirmación(['sí'|S],S).
advebio_negacion_afirmación(['Sí'|S],S).
advebio_negacion_afirmación(['sí,'|S],S).
advebio_negacion_afirmación(['Sí,'|S],S).
advebio_negacion_afirmación(['no'|S],S).
advebio_negacion_afirmación(['No'|S],S).
advebio_negacion_afirmación(['no,'|S],S).
advebio_negacion_afirmación(['No,'|S],S).

nombreNutriTec(['NutriTec'|S],S).
saludo(['Hola'|S],S).
saludo(['Buenos','dias'|S],S).
saludo(['Buenas','tardes'|S],S).
saludo(['Buenas','noches'|S],S).

my_read(List):-
read_string(user,"\n","\r",_,String),
atom_string(Atom,String),
atomic_list_concat(List,' ',Atom).

