// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module not_gate(
    input in,
    output out
    );
    supply0 gnd;
    supply1 vdd;
    
    pmos(out, vdd, in);
    nmos(out, gnd, in);
    
endmodule
