// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module logic_gates(
    input a, b,
    output and_g,
    output or_g,
    output not_g,
    output nand_g,
    output nor_g,
    output xor_g,
    output xnor_g
    );
    
    and andgate(and_g, a, b);
    or orgate(or_g, a, b);
    not notgate(not_g, a);
    nand nandgate(nand_g, a, b);
    nor norgate(nor_g, a, b);
    xor xorgate(xor_g, a, b);
    xnor xnorgate(xnor_g, a, b);
endmodule
