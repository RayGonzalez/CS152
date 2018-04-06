
% Enter your KB below this line:


problem(battery_flat) :- not(engine(turn_over)), battery(bad).
battery(bad) :- lights(weak).
battery(bad) :- radio(weak).
problem(engine_flooded):- engine(turn_over), smell(gas).
problem(out_of_gas) :- engine(turn_over), gas_gauge(empty).

engine(X) :- ask(engine, X).
battery(X) :- ask(battery, X).
lights(X) :- ask(lights, X).
smell(X) :- ask(smell, X).
radio(X) :- ask(radio, X).
gas_gauge(X) :- ask(gas_gauge, X).


% The code below implements the prompting to ask the user:


%Asking clauses

ask(A, V):-
known(yes, A, V), % succeed if true
!.	% stop looking

ask(A, V):-
known(_, A, V), % fail if false
!, fail.

ask(A, V):-
not multivalued(A),
write_py(A:not_multivalued),
known(yes, A, V2),
V \== V2,
!, fail.

ask(A, V):-
read_py(A,V,Y), % get the answer
asserta(known(Y, A, V)), % remember it
Y == yes.	% succeed or fail

