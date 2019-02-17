age(dana,39).
age(jane,27).
age(john,45).
age(paul,34).

crime(female,dana,afternoon,library,gun,39).

female(dana).
female(jane).

male(john).
male(paul).

tl(dana,afternoon,library).
tl(dana,dawn,conservatory).
tl(dana,dusk,porch).
tl(dana,midmorning,conservatory).
tl(dana,noon,porch).
tl(jane,afternoon,porch).
tl(jane,dawn,conservatory).
tl(jane,dusk,kitchen).
tl(jane,midmorning,library).
tl(jane,noon,library).
tl(john,afternoon,kitchen).
tl(john,dawn,library).
tl(john,dusk,porch).
tl(john,midmorning,kitchen).
tl(john,noon,porch).
tl(paul,afternoon,porch).
tl(paul,dawn,conservatory).
tl(paul,dusk,porch).
tl(paul,midmorning,kitchen).
tl(paul,noon,library).

weapon(dana,gun).
weapon(jane,gun).
weapon(john,poison).
weapon(paul,gun).

is_murderer(Suspect) :- crime(_,Suspect,_,_,_,_),
    !,
    format('~w is the murderer.~n', [Suspect]).
is_murderer(Suspect) :- \+crime(_,Suspect,_,_,_,_),
    format('~w is not the murderer.~n', [Suspect]),
    fail.

where_was(Suspect,Time) :- tl(Suspect,Time,Location),
    !,
    format('~w was at ~w during ~w.~n', [Suspect, Location, Time]).

was_ever(Suspect,Location) :- tl(Suspect,_,Location),
    !,
    format('~w did spend some time at ~w.~n', [Suspect, Location]).
was_ever(Suspect,Location) :- \+tl(Suspect,_,Location),
    format('~w was never at ~w.~n', [Suspect, Location]),
    fail.

which_weapon(Suspect) :- weapon(Suspect, Weapon),
    !,
    format('~w\'s fingerprints are on the ~w.~n', [Suspect, Weapon]).

gender(Suspect) :- male(Suspect),
    !,
    format('~w is male.~n', [Suspect]).
gender(Suspect) :- female(Suspect),
    !,
    format('~w is female.~n', [Suspect]).

what_age(Suspect) :- age(Suspect,Age),
    !,
    format('~w is ~w years old.~n', [Suspect, Age]).


