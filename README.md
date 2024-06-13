<p align="center">
  <img alt="jotai drawing" src="./assets/images/Banner.png" width="100%" height="auto"/></br>
</p>

## Goals

ChiBench consists of a large collection of Verilog programs mined from open-source github repositories.
The goal of this benchmark suite is to test and debug electronic design automation (EDA) tools, such as the [Jasper Formal Verification Platform](https://www.cadence.com/en_US/home/tools/system-design-and-verification/formal-and-static-verification.html) or [Intel Quartus](https://www.intel.com.br/content/www/br/pt/products/details/fpga/development-tools/quartus-prime.html).
To test your EDA tool, simply pass all the programs in the ChiBench collection to it, and see if it crashes.
Below we list three examples of issues reported in this way:

* [2159](https://github.com/chipsalliance/verible/issues/2159): Verible's [obfuscator](https://github.com/chipsalliance/verible/tree/master/verilog/tools/obfuscator) crashes when reading a program that only contains the pragma directive.
* [2181](https://github.com/chipsalliance/verible/issues/2181): Verible's [parser](https://github.com/chipsalliance/verible/blob/master/verilog/parser/verilog.y) crashes instead of reporting syntax errors related to instantiation type.
* [2189](https://github.com/chipsalliance/verible/issues/2189): Verible's [code formater](https://github.com/chipsalliance/verible/blob/master/verilog/tools/formatter/README.md) crashes with syntactically valid input.

If you ever use ChiBench to find bugs in some EDA tool, we would appreciate it very much if you could reach out to us and report your experience.
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
