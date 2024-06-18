// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module nand_gate(
    input Vin1, Vin2,
    output Vout
    );
    supply0 gnd;
    supply1 vdd;
    wire temp;
    pmos (Vout, vdd, Vin1);
    pmos (Vout, vdd, Vin2);
    nmos (temp, gnd, Vin2);
    nmos (Vout, temp, Vin1);
endmodule
