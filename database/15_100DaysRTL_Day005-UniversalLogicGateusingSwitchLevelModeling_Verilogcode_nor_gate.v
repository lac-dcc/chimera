// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module nor_gate(
    input Vin1, Vin2,
    output Vout
    );
    supply0 gnd;
    supply1 vdd;
    wire temp;
    pmos (temp, vdd, Vin1);
    pmos (Vout, temp, Vin2);
    nmos (Vout, gnd, Vin1);
    nmos (Vout, gnd, Vin2);
endmodule
