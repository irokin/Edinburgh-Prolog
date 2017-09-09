#### Installation
The whole Aleph is contained in a single Prolog file 'Aleph.pl'. Starting a SWI-Prolog interpreter to load the file in with `consult()` or `[ ]`.

#### Basic Aleph Algorithm
- Select Example
the target query you want to generalize from examples
- Build Most Specific Clause
construct the bottom clause
- Search
bottom-clause-based generalization
- Remove Redundant
only keep the most generalized clauses constituting the final theory

#### Theory Construction
##### Required files
3 data files called 'background file', 'positive example file', 'negative example file'.

Background file contains:

- Prolog clauses that encode information relevant to the domain
- Prolog commands
- language and search restrictions for Aleph which includes
    - _modes_
        - It declares the mode of call for predicates that can appear in the query clause hypothesised by Aleph, and it takes the form
        `mode(Recallnumber, PredicateMode)`
    - _types_
    - _determinations_
        - Generate and Test Algorithm: Generate the solution to a problem and test it, only return the solutions that pass the test.
          
