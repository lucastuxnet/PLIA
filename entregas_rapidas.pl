%------------------------------------------------------------------------------
% Autor: Lucas Albino Martins
% Matricula: 12011ECP022
% Data: 09/11/2020
%https://rachacuca.com.br/logica/problemas/entregas-rapidas/
%------------------------------------------------------------------------------

resolucao(S) :-
           S = entrega(endereco(_,_,_,_,_,_),
					   endereco(_,_,_,_,_,_),
                       endereco(_,_,_,_,_,_),
                       endereco(_,_,_,_,_,_),
                       endereco(_,_,_,_,_,_)),

%O motoboy de capacete Amarelo está em algum lugar entre a moto com a placa BBB-2222 e quem vai para o Centro, nessa ordem.
                    algum_lugar_entre(A,B,C,S),
                    capacete(A,amarelo),
                    placa(B,bbb_2222),
                    destino(C,centro),

%Fagner está exatamente à esquerda do dono da moto menos rodada.
                    exatamente_a_esquerda(D,E,S),
                    nome(D,fagner),
                    quilometragem(E,vinte_mil),

%A moto de placa EEE-5555 está em uma das pontas.
                    uma_das_pontas(F,S),
                    placa(F,eee_5555),

%A moto com 40 mil Km está em algum lugar à direita do motoboy de capacete Amarelo.
                    algum_lugar_a_direita(G,H,S),
                    quilometragem(G,quarenta_mil),
                    capacete(H,amarelo),

%Régis está na quinta posição.
                    quinto_a_sair(I,S),
                    nome(I,regis),

%O dono do capacete Azul está em algum lugar entre o quem tem 32 anos e quem está com o capacete Branco, nessa ordem.
                    algum_lugar_entre(J,K,L,S),
                    capacete(J,azul),
                    idade(K,trinta_e_dois),
                    capacete(L,branco),

%Na terceira posição está a moto de placa AAA-1111.
                    terceiro_a_sair(M,S),
                    placa(M,aaa_1111),

%O motoboy de 25 anos está em algum lugar entre o motoboy de capacete Amarelo e o motoboy mais velho, nessa ordem.
                    algum_lugar_entre(N,O,P,S),
                    idade(N,vinte_e_cinco),
                    capacete(O,amarelo),
                    idade(P,trinta_e_sete),

%O motoboy de capacete Amarelo está em algum lugar à esquerda da moto de placa DDD-4444.
                    algum_lugar_a_esquerda(Q,R,S),
                    capacete(Q,amarelo),
                    placa(R,ddd_4444),

%Quem vai para a zona Leste está exatamente à direita de quem vai para a zona Norte.
                    exatamente_a_direita(T,U,S),
                    destino(T,zona_leste),
                    destino(U,zona_norte),

%A moto de placa AAA-1111 está com 30 mil Km.
                    terceiro_a_sair(V,S),
                    placa(V,aaa_1111),
                    quilometragem(V,trinta_mil),

%Clayton está em algum lugar entre o motoboy que vai para a zona Sul e o Jardel, nessa ordem.
                    algum_lugar_entre(A1,A2,A3,S),
                    nome(A1,clayton),
                    destino(A2,zona_sul),
                    nome(A3,jardel),

%O motoboy de 28 anos está em algum lugar à direita do motoboy de capacete Amarelo.
                    algum_lugar_a_direita(A4,A5,S),
                    idade(A4,vinte_e_oito),
                    capacete(A5,amarelo),

%A moto de placa DDD-4444 está exatamente à esquerda do motoboy que vai para o Centro.
                    exatamente_a_esquerda(A6,A7,S),
                    placa(A6,ddd_4444),
                    destino(A7,centro),

%O motoboy de 25 anos está ao lado do motoboy que vai para a zona Leste.
                    algum_lugar_ao_lado(A8,A9,S),
                    idade(A8,vinte_e_cinco),
                    destino(A9,zona_leste),

%O motoboy do capacete Amarelo está em algum lugar entre a moto com 60 mil Km e o motoboy de 37 anos.
                    algum_lugar_entre(B1,B2,B3,S),
                    capacete(B1,amarelo),
                    quilometragem(B2,sessenta_mil),
                    idade(B3,trinta_e_sete),

%Na primeira posição está o motoboy de 32 anos.
                    primeiro_a_sair(B4,S),
                    idade(B4,trinta_e_dois),

%Clayton está exatamente à esquerda do dono do capacete Verde.
                    exatamente_a_esquerda(B5,B6,S),
                    nome(B5,clayton),
                    capacete(B6,verde),

%Jardel está em algum lugar à esquerda da moto com 20 mil Km.
                    algum_lugar_a_esquerda(B7,B8,S),
                    nome(B7,jardel),
                    quilometragem(B8,vinte_mil),

%Quem vai para a zona Norte está em algum lugar entre a moto de placa BBB-2222 e quem vai para a zona Oeste, nessa ordem.
                        algum_lugar_entre(B9,C1,C2,S),
                        destino(B9,zona_norte),
                        placa(C1,bbb_2222),
                        destino(C2,zona_oeste),

%Resticoes de fechamento.
                        motoboy(D1,S),
                        nome(D1,odair),

                        motoboy(D2,S),
                        capacete(D2,vermelho),

                        motoboy(D3,S),
                        idade(D3,vinte),

                        motoboy(D4,S),
                        quilometragem(D4,cinquenta_mil),

                        motoboy(D5,S),
                        placa(D5,ccc_3333).


motoboy(X,entrega(X,_,_,_,_)).
motoboy(X,entrega(_,X,_,_,_)).
motoboy(X,entrega(_,_,X,_,_)).
motoboy(X,entrega(_,_,_,X,_)).
motoboy(X,entrega(_,_,_,_,X)).

capacete(endereco(X,_,_,_,_,_),X).
nome(endereco(_,X,_,_,_,_),X).
idade(endereco(_,_,X,_,_,_),X).
destino(endereco(_,_,_,X,_,_),X).
quilometragem(endereco(_,_,_,_,X,_),X).
placa(endereco(_,_,_,_,_,X),X).

uma_das_pontas(X,entrega(X,_,_,_,_)).
uma_das_pontas(X,entrega(_,_,_,_,X)).

algum_lugar_ao_lado(X,Y,entrega(X,Y,_,_,_)).
algum_lugar_ao_lado(X,Y,entrega(_,X,Y,_,_)).
algum_lugar_ao_lado(X,Y,entrega(_,_,X,Y,_)).
algum_lugar_ao_lado(X,Y,entrega(_,_,_,X,Y)).
algum_lugar_ao_lado(X,Y,entrega(_,_,_,Y,X)).
algum_lugar_ao_lado(X,Y,entrega(_,_,Y,X,_)).
algum_lugar_ao_lado(X,Y,entrega(_,Y,X,_,_)).
algum_lugar_ao_lado(X,Y,entrega(Y,X,_,_,_)).

algum_lugar_a_esquerda(X,Y,entrega(X,Y,_,_,_)).
algum_lugar_a_esquerda(X,Y,entrega(X,_,Y,_,_)).
algum_lugar_a_esquerda(X,Y,entrega(X,_,_,Y,_)).
algum_lugar_a_esquerda(X,Y,entrega(X,_,_,_,Y)).
algum_lugar_a_esquerda(X,Y,entrega(_,X,Y,_,_)).
algum_lugar_a_esquerda(X,Y,entrega(_,X,_,Y,_)).
algum_lugar_a_esquerda(X,Y,entrega(_,X,_,_,Y)).
algum_lugar_a_esquerda(X,Y,entrega(_,_,X,Y,_)).
algum_lugar_a_esquerda(X,Y,entrega(_,_,X,_,Y)).
algum_lugar_a_esquerda(X,Y,entrega(_,_,_,X,Y)).

algum_lugar_a_direita(X,Y,entrega(_,_,_,Y,X)).
algum_lugar_a_direita(X,Y,entrega(_,_,Y,_,X)).
algum_lugar_a_direita(X,Y,entrega(_,Y,_,_,X)).
algum_lugar_a_direita(X,Y,entrega(Y,_,_,_,X)).
algum_lugar_a_direita(X,Y,entrega(_,_,Y,X,_)).
algum_lugar_a_direita(X,Y,entrega(_,Y,_,X,_)).
algum_lugar_a_direita(X,Y,entrega(Y,_,_,X,_)).
algum_lugar_a_direita(X,Y,entrega(_,Y,X,_,_)).
algum_lugar_a_direita(X,Y,entrega(Y,_,X,_,_)).
algum_lugar_a_direita(X,Y,entrega(Y,X,_,_,_)).

exatamente_a_direita(X,Y,entrega(Y,X,_,_,_)).
exatamente_a_direita(X,Y,entrega(_,Y,X,_,_)).
exatamente_a_direita(X,Y,entrega(_,_,Y,X,_)).
exatamente_a_direita(X,Y,entrega(-,_,_,Y,X)).

exatamente_a_esquerda(X,Y,entrega(_,_,_,X,Y)).
exatamente_a_esquerda(X,Y,entrega(_,_,X,Y,_)).
exatamente_a_esquerda(X,Y,entrega(_,X,Y,_,_)).
exatamente_a_esquerda(X,Y,entrega(X,Y,_,_,_)).

algum_lugar_entre(X,Y,Z,entrega(Y,X,Z,_,_)).
algum_lugar_entre(X,Y,Z,entrega(Y,X,_,Z,_)).
algum_lugar_entre(X,Y,Z,entrega(Y,X,_,_,Z)).
algum_lugar_entre(X,Y,Z,entrega(Y,_,X,Z,_)).
algum_lugar_entre(X,Y,Z,entrega(Y,_,X,_,Z)).
algum_lugar_entre(X,Y,Z,entrega(Y,_,_,X,Z)).
algum_lugar_entre(X,Y,Z,entrega(_,Y,X,Z,_)).
algum_lugar_entre(X,Y,Z,entrega(_,Y,X,_,Z)).
algum_lugar_entre(X,Y,Z,entrega(_,Y,_,X,Z)).
algum_lugar_entre(X,Y,Z,entrega(_,_,Y,X,Z)).

quinto_a_sair(X,entrega(_,_,_,_,X)).

terceiro_a_sair(X,entrega(_,_,X,_,_)).

primeiro_a_sair(X,entrega(X,_,_,_,_)).
