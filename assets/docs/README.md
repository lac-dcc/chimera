# How ChiGen Works

ChiGen works in four phases. Figure 1 shows how these phases are related.
The rest of this section describes each of these steps.

<p align="center">
  <img alt="Overview of ChiGen" src="./assets/images/ChiGenOvf.png" width="80%" height="auto"/></br>
</p>

## Syntax Generation via Probabilistic Grammars

To produce a Verilog specification, ChiGen begins by generating a "skeleton" of the design: a structure that adheres to Verilog's syntactic rules. This skeleton is created using a Probabilistic Context-Free Grammar (PCFG), which assigns probabilities to sequences of production rules.
These production rules were taken from Verible's grammar, which contains 456 productions meant to parse the IEEE 1800-2017 standard.
ChiGen enables conditional dependencies between rule applications, allowing the probability of a given rule to depend on previously selected *K* rules (a K-gram), resulting in "sequence-aware" probabilities.
We limit the probability context *K* - the chain of production rules associated with a probability - to six productions, as each additional context introduces a potentially exponential increase in the table of probabilities.
To construct the PCFG, ChiGen parses a training set of Verilog designs.
It parses each file in this set, recording how often each sequence of productions is used during parsing.
Example 1 shows instances of probabilistic grammars.

**Example 1:**
Figure 2 shows two examples of PCFGs.
The example in Figure 2 (a) does not take context into consideration.
The example in Figure 2 (b) considers contexts of depth one; that is, it can "remember" the rule that led to the production of the current non-terminal that must be expanded.
As an illustration, the chance of increasing a list of declarations decreases, if we know that this list has already one element, as very long chains of declarations are uncommon.

<p align="center">
  <img alt="Probabilistic Grammar" src="./assets/images/probabilisticGrammar.png" width="80%" height="auto"/></br>
</p>

**Example 2:**
Figure 3 (a) shows an example of design that is produced by exercising the probabilistic grammar.
Each production rule is activated according to its probabilities.
The starting symbol of the grammar has probability 1.0; hence, syntax generation always starts with a non-null design.
If a rule *A ::= B C* is activated, then it creates two new non-terminals, which will, in turn, be activated too.
Each of these non-terminals might be the left-hand side of multiple productions.
The choice of which production is activated depends on the probabilities associated with them.
This process terminates, as eventually terminals, or the empty string, are produced.

<p align="center">
  <img alt="The Verilog Skeleton" src="./assets/images/VerilogSkeleton.png" width="80%" height="auto"/></br>
</p>

## Variable Renaming and Scope Creation

The design in Figure 3 (a) contains only placeholders where symbol names are expected.
In the next state of code generation, a "scope delimiter" replaces these placeholders with variable names.
Renaming uses a set of "in-scope" variables, and follows three  rules:
(i) The declaration of a placeholder is renamed with a new symbol *s*, and *s* is inserted into the set of in-scope elements associated with the current scope.
(ii) Uses of a placeholder are randomly replaced with any symbol in the set of in-scope elements.
(iii) Once the scope delimiter leaves a scope region, it removes from the set of in-scope elements the variables declared within that region.

## Type Inference via Unification

The scope delimiter discussed in the previous section assigns names to variables, but their types remain undefined.
In the subsequent phase of code generation, a "type inference engine" deduces these types. This type inference process follows the well-known [Hindley-Milner](https://en.wikipedia.org/wiki/Hindley%E2%80%93Milner_type_system) algorithm, widely used in languages such as SML/NJ, Haskell, and Rust. However, we adopt the two-stage formulation proposed by [Sulzmann](https://link.springer.com/chapter/10.1007/3-540-44716-4_16): first, we generate constraints; then, we solve these constraints through unification. Each constraint consists of a pair $(t_0, t_1)$, indicating that terms $t_0$ and $t_1$ must share the same type. These terms may represent primitive types or open type variables (such as `type_1` in Figure 3).

**Example 3:**
Figure 4 (a) shows the seven pairs of constraints generated for the design in Figure 3. These pairs are produced by visiting the abstract syntax tree that describes the skeleton code. For instance, the pair $(\mathtt{id\_1}, \mathtt{id\_6})$ is produced because of the assignment `always id_6 = id_1` present in the skeleton. This pair indicates that the type of these two identifiers must be the same. The result of unifying all the pairs appears in Figure 4 (b), where the type placeholders have been replaced with actual type names in this updated version of our running example.

<p align="center">
  <img alt="The Type Inference Engine" src="./assets/images/typeInference.png" width="80%" height="auto"/></br>
</p>
