<p align="center">
  <img alt="jotai drawing" src="./assets/images/Banner.png" width="100%" height="auto"/></br>
</p>


## Goals
This repository contains **ChiGen** and **ChiBench**, two tools designed to test and debug electronic design automation (EDA) tools. Below, you'll find descriptions of each tool and how they can be utilized.

### Chibench

**ChiBench** consists of a large collection of Verilog programs mined from open-source github repositories.
The goal of this benchmark suite is to test and debug electronic design automation (EDA) tools, such as the [Jasper Formal Verification Platform](https://www.cadence.com/en_US/home/tools/system-design-and-verification/formal-and-static-verification.html) or [Intel Quartus](https://www.intel.com.br/content/www/br/pt/products/details/fpga/development-tools/quartus-prime.html).
To test your EDA tool, simply pass all the programs in the ChiBench collection to it, and see if it crashes.
Below we list examples of issues reported in this way:

| Issue | Tool | Description |
|:-----:|:----| :-------------|
|   [2159](https://github.com/chipsalliance/verible/issues/2159)  |   [Verible's Obfuscator](https://github.com/chipsalliance/verible/tree/master/verilog/tools/obfuscator) |     Crashes when reading a program that only contains the pragma directive.        |
|   [2181](https://github.com/chipsalliance/verible/issues/2181)  |  [Verible's parser](https://github.com/chipsalliance/verible/blob/master/verilog/parser/verilog.y) |   Crashes instead of reporting syntax errors related to instantiation type.          |
|   [2189](https://github.com/chipsalliance/verible/issues/2189)  |  [Verible's code formater](https://github.com/chipsalliance/verible/blob/master/verilog/tools/formatter/README.md) |     Crashes with syntactically valid input.        |
|   [2233](https://github.com/chipsalliance/verible/issues/2233)  |  [Verible's parser](https://github.com/chipsalliance/verible/blob/master/verilog/parser/verilog.y) |   Incorrectly accepts Verilog code with mismatched program and endmodule keywords.          |
|   [5276](https://github.com/verilator/verilator/issues/5276)  |  [Verilator](https://github.com/verilator/verilator) |     Crashes with signal 9 on a very large program.        |
|   [5311](https://github.com/verilator/verilator/issues/5311)  |  [Verilator](https://github.com/verilator/verilator) |     Crashes when using time assignments.        |
|   [5312](https://github.com/verilator/verilator/issues/5312)  |  [Verilator](https://github.com/verilator/verilator) |     Crashes when calling a function created in "generate" block.        |
|   [1174](https://github.com/steveicarus/iverilog/issues/1174) |  [Icarus Verilog](https://github.com/steveicarus/iverilog) | Crashes when assigning to parameters in a procedural block. | 
|   [4598](https://github.com/YosysHQ/yosys/issues/4598)  |  [Yosys](https://github.com/YosysHQ/yosys) |     Crashes while simplifying program.|

### Chigen

**ChiGen** is a  tool designed for synthesizing realistic Verilog designs to test and debug Electronic Design Automation (EDA) tools. Originally developed to validate the [Jasper Formal Verification Platform](https://www.cadence.com/en_US/home/tools/system-design-and-verification/formal-and-static-verification.html), ChiGen has proven to be highly effective in identifying bugs across a wide range of tools, including Verible, Verilator, and Yosys. A tutorial to get started with ChiGen can be found below. 




## ChiGen Tutorial 
### Installing
#### 1. Clone Chimera: 
  ```
  git clone  https://github.com/lac-dcc/chimera.git
  ``` 

#### 2. Build Verible
The verible binary is in the `verible_bin` folder. However, if the binary does not work on the computer, try building it from [source](https://github.com/joaovam/verible/tree/73f291dc73d38e8f876ce9cc35aad62ff932f138)

<!-- - Install [Bazel](https://github.com/bazelbuild/bazel)  -->


<!-- `sudo apt install apt-transport-https curl gnupg -y | gpg --dearmor >bazel-archive-keyring.gpg` -->

#### 3. Build Chigen
```
./scripts/setup.sh
```

### 4. Train probabilistic grammar
```
./scripts/run_parser_count_productions.sh ./database verible-verilog-syntax grammar.json
```

### 5. Run
```
./build/Chimera grammar.json 1 > program.v
```

### 6. Format (optional)
```
verible-verilog-format --inplace program.v
```

If you ever use ChiBench or ChiGen to find bugs in some EDA tool, we would appreciate it very much if you could reach out to us and report your experience.
If you need help to set up the scripts to do this kind of exploration, feel free to reach out to us as well!

## Technical Report

The process of constructing and curating this collection of benchmarks is described on this [technical report](https://arxiv.org/abs/2406.06550).
Cite it as:

```
@misc{Sumitani24,
  title={ChiBench: a Benchmark Suite for Testing Electronic Design Automation Tools}, 
  author={Rafael Sumitani and João Victor Amorim and Augusto Mafra and Mirlaine Crepalde and Fernando Magno Quintão Pereira},
  year={2024},
  eprint={2406.06550},
  archivePrefix={arXiv},
  primaryClass={cs.AR}
}
```

## Provenance

ChiBench contains only programs that were originally distributed with some license.
Thus, each program in the ChiBench suite contains, as a header comment, the original license of that specification, plus a link to the repository from where that code was obtained.
Notice that these programs might use different licenses, given that they were extracted from different projects.
On May 24th, 2024, the following licenses were used among the repositories mined to build the ChiBench collection:

<div style="margin-left: auto;
            margin-right: auto;
            width: 50%">

| License | # |
|---------|---|
|Apache License 2.0|341|
|MIT License|331|
|GNU General Public License v3.0|159|
|GNU General Public License v2.0|37|
|BSD 3-Clause "New" or "Revised" License|37|
|BSD 2-Clause "Simplified" License|27|
|GNU Lesser General Public License v2.1|10|
|Creative Commons Zero v1.0 Universal|9|
|The Unlicense|7|
|GNU Lesser General Public License v3.0|5|
|Mozilla Public License 2.0|5|
|ISC License|5|
|Creative Commons Attribution Share Alike 4.0 International|4|
|CERN Open Hardware Licence Version 2 - Permissive|3|
|GNU Affero General Public License v3.0|3|
|Creative Commons Attribution 4.0 International|2|
|CERN Open Hardware Licence Version 2 - Strongly Reciprocal|1|
|CERN Open Hardware Licence Version 2 - Weakly Reciprocal|1|

</div>



## Acknowledgment

This project is sponsored by Cadence Design Systems.
Additionally, the different people involved in this project acknowledge the support of [CNPq](https://www.gov.br/cnpq/pt-br), [FAPEMIG](http://www.fapemig.br/pt/), and [CAPES](https://www.gov.br/capes/pt-br).
Finally, thank UFMG's [Department of Computer Science](https://dcc.ufmg.br/) for making available the infrastructure necessary to carry out this project.
