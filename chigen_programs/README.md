# Using ChiGen

This document explains how to generate programs using ChiGen. First, it shows how to train the fuzzer; then, it shows how to use it to generate Verilog programs.

## Training a Probabilistic Grammar

ChiGen requires a [probabilistic context-free grammar](https://en.wikipedia.org/wiki/Probabilistic_context-free_grammar) to generate Verilog programs. The grammar is produced out of examples of Verilog codes. To produce this grammar, we use the `run_parser_count_productions.sh` script, as follows:

```bash
./scripts/run_parser_count_productions.sh <directory> <verible_parser_executable> <output_file> <n>
```

Where:

* `directory`: Directory with the verilog programs database.
* `verible_parser_executable`: Path for verible's parser.
* `output_file`: File to save the grammar in json format.
* `n`: Size of the probabilistic context (the length of the sequence of production rules associated with a probability).

## Using ChiGen to generate Verilog programs

To generate a Verilog program, use the following command:

```bash
./build/Chimera [OPTIONS] <grammar> <n>
```

Where:

* `grammar`: File containing the probabilistic grammar.
* `n`: Size of the context of the grammar.

It is important to match the size of the context in the grammar file and the value of n, otherwise ChiGen will abort the execution.

ChiGen has a number of flags for debug and verbosity, for more information you can check it out through the `--help` flag.

For a more detailed tutorial refer to this [video](https://www.youtube.com/watch?v=cCHaC3S1K9c).
