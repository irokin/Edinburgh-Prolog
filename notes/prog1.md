##### Logic Programming
A programming paradigm differs from _functional_ and _imperative_ paradigms.

It has a _declarative_ reading.
> _Declarative Programming_ describes the logic of computation without expressing its control flow.

The inspiring idea is that:
> We ask a question to the computer, and the computer gives the answer without the need of telling it how to solve the question.

##### Prolog:
Core based on first-order logic
Algorithmic realization via <strong> unification, search</strong>

##### Atom:
A sequence of alphanumeric characters, starting with lower case letter
A string enclosed in single quotes

##### Variable:
A string with an uppercase letter

##### Predicates:
A predicates has the form of $p(t_1, ..., t_n)$ where $p$ is an atom, and $t_i$ are terms.

Predicates has two components: a name and an arity.

##### Facts:
A fact is an assertion that an instance of the predicate is true.
A collection of facts is known as knowledge base.

#### Goal:
Goal is a sequence of predicates, connected by conjunctions.
Such as, p1(t1, ..., tn), p2(t1', ..., tn'), which is read as p holds of t1, ..., tn'.
Predicates can be 0-ary, such as the built-ins: true, false, fail.

#### Rules:
Rules take the form of head-body:
The head predicate holds if the collective truth value of body is true.
Example: _sibling(X,Y) :- parent(Z,X), parent(Z,Y)_
