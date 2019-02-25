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

is_murder_weapon(Weapon) :- crime(_,_,_,_,Weapon,_),
    !,
    format('~w is the murder weapon.~n', [Weapon]).
is_murder_weapon(Weapon) :- \+crime(_,_t,_,_,Weapon,_),
    format('~w is not the murder weapon.~n', [Weapon]),
    fail.

is_murder_time(Time) :- crime(_,_,Time,_,_,_),
    !,
    format('~w is the time of the murder.~n', [Time]).
is_murder_time(Time) :- \+crime(_,_,Time,_,_,_),
    format('~w is not the time of the murder.~n', [Time]),
    fail.

is_murder_location(Location) :- crime(_,_,_,Location,_,_),
    !,
    format('~w is the location of the murder.~n', [Location]).
is_murder_location(Location) :- \+crime(_,_,_,Location,_,_),
    format('~w is not the location of the murder.~n', [Location]),
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

murderer_gender :- crime(Gender,_,_,_,_,_),
		     !,
		     format('The murderer is ~w.~n', [Gender]).
murderer_name :- crime(_,Name,_,_,_,_),
		     !,
		     format('The murderer is ~w.~n', [Name]).
murderer_time :- crime(_,_,Time,_,_,_),
		     !,
		     format('The murder happened during ~w.~n', [Time]).
murderer_location :- crime(_,_,_,Location,_,_),
		     !,
		     format('The murderer happened at ~w.~n', [Location]).
murderer_weapon :- crime(_,_,_,_,Weapon,_),
		     !,
		     format('The murderer used the ~w.~n', [Weapon]).
murderer_age :- crime(_,_,_,_,_,Age),
		     !,
		     format('The murderer is ~w years old.~n', [Age]).


all_males :- findall(X, male(X), Y),
	     format('The males are ~w.~n', [Y]).

all_females :- findall(X, female(X), Y),
	       format('The females are ~w.~n', [Y]).

what_users(Weapon) :- findall(X, weapon(X, Weapon), Suspects),
		      format('The fingerprints on the gun match ~w.~n', [Suspects]).

how_many_users(Weapon) :- findall(X, weapon(X, Weapon), Suspects),
			  length(Suspects, Length),
			  format('There are ~w sets of fingerprints on the ~w.~n', [Length,Weapon]).

exact_age(Age) :- findall(X, age(X, Age), Suspects),
		  exists_exact_age(Suspects, Age).

exists_exact_age([], Age) :- !, format('There are no suspects of exactly ~w years.~n', [Age]).
exists_exact_age(_, Age) :- !, format('There is someone who is exactly ~w years old.~n', [Age]).

