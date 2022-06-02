/* Aluno: Lucas Albino Martins
   Matricula: 12011ECP022
   Disciplina: PLIA
   Data: 07-12-2020
   Problema Avaliador:
   Completar o avaliador para fazer operações com seno (sin), cosseno (cos), tangente (tg),
    expoente (elevado ^), logaritmo neperiano (log), logaritmo decimal (log10), exponencial (exp),
    máximo (max), mínimo (min), raiz quadrada (sqrt) e o símbolo pi.
   Nome do código: avaliador.pl
 */
avalia(C,C) :- number(C). %constante
avalia(A+B,Valor) :-
    avalia(A,ValorA),
    avalia(B,ValorB),
    Valor is ValorA + ValorB.
avalia(-A,Valor) :-
    avalia(A,ValorA),
    Valor is -ValorA.
avalia(A-B,Valor) :-
    avalia(A,ValorA),
    avalia(B,ValorB),
    Valor is ValorA - ValorB.
avalia(A*B,Valor) :-
    avalia(A,ValorA),
    avalia(B,ValorB),
    Valor is ValorA * ValorB.
avalia(A/B,Valor) :-
    avalia(A,ValorA),
    avalia(B,ValorB),
    Valor is ValorA / ValorB.
avalia(sqrt(A),Valor) :- /* Raiz quadrada */
    avalia(A,ValorA),
    Valor is sqrt(ValorA).
avalia(sin(A),Valor) :- /* Seno */
    avalia(A,ValorA),
    Valor is sin(ValorA).
avalia(cos(A),Valor) :- /* Cosseno */
    avalia(A,ValorA),
    Valor is cos(ValorA).
avalia(tan(A),Valor) :- /* Tangente */
    avalia(A,ValorA),
    Valor is tan(ValorA).
avalia(A^B,Valor) :- /* elevado ^ ou potencialização */
    avalia(A,ValorA),
    avalia(B,ValorB),
    Valor is ValorA ^ ValorB.
avalia(log(A),Valor) :- /* Logaritmo neperiano */
    avalia(A,ValorA),
    Valor is log(ValorA).
avalia(log10(A),Valor) :- /* Logaritmo decimal */
    avalia(A,ValorA),
    Valor is log10(ValorA).
avalia(exp(A),Valor) :- /* exponencial */
    avalia(A,ValorA),
    Valor is exp(ValorA).
avalia(max(A, B, Valor)) :- /* Máximo */
                avalia(A,ValorA),
                avalia(B,ValorB),
                ValorA >= ValorB,
                Valor is ValorA.
avalia(max(A, B, Valor)) :-
                avalia(A,ValorA),
                avalia(B,ValorB),
                ValorA < ValorB,
                Valor is ValorB.
avalia(min(A, B, Valor)) :- /* Mínimo */
                avalia(A,ValorA),
                avalia(B,ValorB),
                ValorA =< ValorB,
                Valor is ValorA.
avalia(min(A, B, Valor)) :-
                avalia(A,ValorA),
                avalia(B,ValorB),
                ValorA > ValorB,
                Valor is ValorB.

avalia(π,Valor):- Valor is pi. /* Símbolo de π */
avalia(pi,Valor):- Valor is pi. 

/* Saída executadas:

1 ?- ['problema_avaliador.pl'].
Warning: /mnt/d/UFU - AAER/PLIA/problema_avaliador.pl:72:
        Clauses of avalia/2 are not together in the source-file
          Earlier definition at /mnt/d/UFU - AAER/PLIA/problema_avaliador.pl:11
          Current predicate: avalia/1
          Use :- discontiguous avalia/2. to suppress this message
true.

2 avalia(1+11,X).
X = 12 .

3 avalia(10-(2*3),X).
X = 4 .

4 avalia((3-2)*3,X).
X = 3 .

5 ?- avalia((2-10)*(4-8),X).
X = 32 .

6 ?- avalia(sin(3.14159265359/2)*3,X).
X = 3.0.

7 ?- avalia((sin(3.14159265359/2)^2)+(cos(0)^2),X).
X = 2.0.

8 ?- avalia(tan(1)-0.5574077246549023,X).
X = 1.0.

9 ?- avalia(2^3,X).
X = 8.

10 ?- avalia(log(7.4)-0.0014800002101243,X).
X = 2.0.

11 ?- avalia((3*4)/log10(100),X).
X = 6.0.

12 ?- avalia((exp(2)+0.61094390106935)/2,X).
X = 4.0.

13 ?- avalia(max(3,-2,X)).
X = 3 .

14 ?- avalia(min(-1,4,X)).
X = -1 .

15 ?- avalia(sqrt(16)+4,X).
X = 8.0.

16 ?- avalia(sin(π/(2)),X).
X = 1.0.
   ?- avalia(cos(2*π),X).
X = 1.0.
    ?- avalia(sin(pi/2),X).
X = 1.0.
   ?- avalia(cos(pi*2),X).
X = 1.0.
*/
