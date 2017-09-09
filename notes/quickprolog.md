backtrack**Prolog Cheat Sheet**:

| Symbol | Functionality | Comment
| :-: | :-: | :-:
| % | single line Comment |
| /\* */ | multi-line comment |
| + | instantiated predicate | mode declaration
| - | uninstantiated predicate | mode declaration
| ? | + or - predicate | mode declaration
| _ | anonymous variable | when the name of the variable is unimportant
| \\+ | negation |
| ! | Cuts | Provide limited control over backtracking
| | |

#### Prolog Program:
**Recursion**:
A rule with some predicate in its head can contain the reference to the same predicate in its body.

**backtrack**:
backtrack can be forced by typing a semi-colon after Prolog finds the first solution to the query.

<p align="center">
<img src="/Users/yulong/Documents/SourceTree/Edinburgh-Prolog/pics/backtrack.png">
</p>


**Standard Programming Style**
Some documentation guidelines:

- A skeletal description of the predicate with __mode declaration__ at the start of each argument, e.g. _parent(Parent, Child)_.
- Mode declaration are either + (The argument is instantiated whenever the predicate is called) or - (The argument is uninstantiated whenever the predicate is called) or ? (The argument can either be uninstantiated or instantiated).
- Below the skeletal description an English description should be put.
- unimportant variable should be named with underscore _ . By unimportant, we mean the variable only occurs once in the knowledge base.

**Prolog Terms**
All Prolog data structures are called terms, which includes:

- Constant - either an atom or a number
- Variable
- Complex/Compound Term

> Atom: Any sequence of characters starting with non-Upper Case or Underscore is seen as an atom

**Lists**
Lists are presented in Prolog by either:

| Symbol | Comment
|:-:|:-:
| .(arg1, arg2) | arg2 must be a list
| [ ] | empty list

**Operators**
The operators are allocated two descriptive attributes: The _Precedence_ and _Type_.

> Precedence: In a nested term, the precedence decides which component term is the primary functor, other terms will act like the arguments of the primary term.

> Type: decides the attached position for the term, it could be prefix/infix/postfix - fx/xfy/xf

| Symbol | Comment   |  
|--|---|--
| current_op/3 | show the type and precedence of the op   |  
| display/1  | show the operator implemented using the standard prolog syntax |  

**Unification**
Variable is instantiated to a fact.
Possible Cases:

Assume we have Term 1 as T1, Term 2 as T2:

- If T1 and T2 are constants.
    - Succeed, if they are the same
    - Failed, otherwise
- If T1 is variable, T2 is constant
    - Succeed, if T1 is instantiated to T2
- If T1 and T2 are compound terms
    - Check weather they have same functor and arity, if Yes proceed.
    - Check weather each pair of arguments from the same position is unified with each other, if Yes then succeed.

The built-in syntax **=** can be used to unify two terms.

**Numerical expression evaluation**
The numerical expression can be manipulated like any other terms. To evaluate a numerical term, one could use following statement:

``` prolog
X is 2+3*4 %to evaluate the expression
14 is 2+3*4 %evaluate a given number
```

The goal on the right of the `is` syntax must be a **evaluable expression**. e.g. + - * / cos sin...

**Negation**
The syntax for negation is `\+`. Returning true from a negation operator does not mean the goal you have negated is proved false in the logical sense. It does mean the goal cannot be established from current database.

**The Closed World Assumption**
The clauses in a knowledge base are the complete descriptions of their corresponding predicates/queries.

**Cuts**
The symbol `!` is used for pruning branches that are mutually exclusive to the found proof in attempt to avoid meaningless further searching. The Cuts that does not alter the meaning of the program is referred to as Green Cuts, otherwise referred to as Red Cuts.

#### Prolog Programming Techniques
1. Recursion-Decomposition : separate the base cases from the recursive cases.
```prolog
% Decomposition
member(X, [X|_]).
member(X, [_|T]) :-
    member(X, T).
```

2.
