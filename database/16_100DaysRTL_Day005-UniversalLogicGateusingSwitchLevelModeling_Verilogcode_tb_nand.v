// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module tb_nand;
    reg Vin1, Vin2;
    wire Vout;
    nand_gate dut(Vin1, Vin2, Vout);
    initial Vin1= 1'b0;
    initial Vin2= 1'b0;
    initial forever #50 Vin1 = ~Vin1;
    initial forever #100 Vin2 = ~Vin2;
    initial #600 $finish;
endmodule
