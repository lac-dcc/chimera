# Using Chigen

This steps explain how to generate programs using Chigen. The first step is to train the probabilistic grammar. We do that using the `run_parser_count_productions.sh` script.

The command format is:

```bash
./scripts/run_parser_count_productions.sh <directory> <verible_parser_executable> <output_file> <n>
```

Where:

```
directory: Directory with the verilog programs database.
verible_parser_executable: Path for verible's parser.
output_file: File to save the grammar in json format.
n: Size of the context.
```

Next we should run Chigen:

```bash
./build/Chimera [OPTIONS] <grammar> <n>
```

```
grammar: File containing the probabilistic grammar.
n: Size of the context of the grammar.
```

It is important to match the size of the context in the grammar file and the value of n, otherwise Chigen will abort the execution.

Chigen has a number of flags for debug and verbosity, for more information you can check it out through the `--help` flag.

For a more detailed tutorial refer to this [video](https://www.youtube.com/watch?v=cCHaC3S1K9c).
