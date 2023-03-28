% Zadani c. 29:
% Napiste program resici ukol dany predikatem u29(LIN,VOUT), kde LIN je
% vstupni ciselny seznam obsahujici cisla z intervalu <2,20> a VOUT je
% promenna, ve ktere se vraci pocet prvocisel v seznamu LIN.

% Testovaci predikaty:									% LOUT
u29_1:- u29([5,3,2,4,9,12,17],VOUT),write(VOUT).	% 4
u29_2:- u29([3,5,7,11,13,17],VOUT),write(VOUT).		% 6
u29_3:- u29([6,4,12],VOUT),write(VOUT).			% 0
u29_r:- write('Zadej LIN: '),read(LIN),
	u29(LIN,VOUT),write(VOUT).

% Reseni:
u29(LIN,VOUT) :- prime_counter(LIN,Counter), VOUT is Counter.
	
% Pokud je list prazdny	
prime_counter([],0).

% Hlavni telo
prime_counter([Head|Tail],Counter) :- 
	prime_counter(Tail,Counter1),
	is_it_prime(Head,Counter2),
	Counter is Counter1 + Counter2.

% Hledani prvocisel
is_it_prime(NUMBER,TO_ADD) :- 
	(((NUMBER mod 2) =:= 0 , NUMBER =\= 2) ;
	((NUMBER mod 3) =:= 0 , NUMBER =\= 3))
	-> TO_ADD is 0; TO_ADD is 1.

% Komentar ke kodu:
% Z definice prvocisel plyne, ze pokud chceme zjistit, jestli je cislo prvocislem,
% tak staci ho podelit pouze vsemi prvocisly, ktere jsou mensi jak jeho odmocnina
% tudiz pro obor <2,20> je maximum sqrt(20) =~ 4,5 (prvocila jsou 1,2,3,5), 5 uz 
% neni potreba. Tudiz staci podelit pouze 2 a 3 (1 neni v intervalu <2,20>)