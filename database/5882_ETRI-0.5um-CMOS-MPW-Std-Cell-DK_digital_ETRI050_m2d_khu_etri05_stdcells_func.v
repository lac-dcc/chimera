// This program was cloned from: https://github.com/GoodKook/ETRI-0.5um-CMOS-MPW-Std-Cell-DK
// License: GNU General Public License v3.0

//
// Functional model of ETRI050 Std-Cells for zero-time net-simulation
//

/* verilator lint_off IMPLICIT */
/* verilator lint_off DECLFILENAME */

module khu_etri05_stdcells_func;
endmodule

`celldefine

module AND2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;
    and (Y, A, B);
endmodule

module AND2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;
    and (Y, A, B);
endmodule

module AOI21X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;
   and (I0_out, A, B);
   or  (I1_out, I0_out, C);
   not (Y, I1_out);
endmodule

module AOI22X1 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;
   and (I0_out, A, B);
   and (I1_out, C, D);
   or  (I2_out, I0_out, I1_out);
   not (Y, I2_out);
endmodule

module BUFX2 (A, Y);
input  A ;
output Y ;
   buf (Y, A);
endmodule

module BUFX4 (A, Y);
input  A ;
output Y ;
   buf (Y, A);
endmodule

module CLKBUF1 (A, Y);
input  A ;
output Y ;
   buf (Y, A);
endmodule

module CLKBUF2 (A, Y);
input  A ;
output Y ;
   buf (Y, A);
endmodule

module CLKBUF3 (A, Y);
input  A ;
output Y ;
   buf (Y, A);
endmodule

module DFFNEGX1 (CLK, D, Q);
input  CLK ;
input  D ;
output Q ;
    reg Q;
    always @(negedge CLK)
        Q <= D;
endmodule

module DFFPOSX1 (CLK, D, Q);
input  CLK ;
input  D ;
output Q ;
    reg Q;
    always @(posedge CLK)
        Q <= D;
endmodule

module DFFSR (CLK, D, R, S, Q);
input  CLK ;
input  D ;
input  R ;
input  S ;
output Q ;
    reg Q;
    always @(negedge CLK or negedge S or negedge R)
        if (!S)
            Q <= 1'b1;
        else if (!R)
            Q <= 1'b0;
        else
            Q <= D;
endmodule

module FAX1 (A, B, C, YC, YS);
input  A ;
input  B ;
input  C ;
output YC ;
output YS ;
   and (I0_out, A, B);
   and (I1_out, B, C);
   and (I3_out, C, A);
   or  (YC, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (YS, I5_out, C);
endmodule

module FILL ();
endmodule

module HAX1 (A, B, YC, YS);
input  A ;
input  B ;
output YC ;
output YS ;
   and (YC, A, B);
   xor (YS, A, B);
endmodule

module INVX1 (A, Y);
input  A ;
output Y ;
   not (Y, A);
endmodule

module INVX2 (A, Y);
input  A ;
output Y ;
   not (Y, A);
endmodule

module INVX4 (A, Y);
input  A ;
output Y ;
   not (Y, A);
endmodule

module INVX8 (A, Y);
input  A ;
output Y ;
   not (Y, A);
endmodule

module LATCH (CLK, D, Q);
input  CLK ;
input  D ;
output Q ;
    reg Q;
    always @(CLK)
        if (CLK)
            Q <= D;
endmodule

module MUX2X1 (A, B, S, Y);
input  A ;
input  B ;
input  S ;
output Y ;
    reg Y;
    always @(*)
        if (!S)
            Y = ~A;
        else
            Y = ~B;
endmodule

module NAND2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;
   and (I0_out, A, B);
   not (Y, I0_out);
endmodule

module NAND3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;
   and (I1_out, A, B, C);
   not (Y, I1_out);
endmodule

module NOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;
   or  (I0_out, A, B);
   not (Y, I0_out);
endmodule

module NOR3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;
   or  (I1_out, A, B, C);
   not (Y, I1_out);
endmodule

module OAI21X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;
   or  (I0_out, A, B);
   and (I1_out, I0_out, C);
   not (Y, I1_out);
endmodule

module OAI22X1 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;
   or  (I0_out, A, B);
   or  (I1_out, C, D);
   and (I2_out, I0_out, I1_out);
   not (Y, I2_out);
endmodule

module OR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;
   or  (Y, A, B);
endmodule

module OR2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;
   or  (Y, A, B);
endmodule

module TBUFX1 (A, EN, Y);
input  A ;
input  EN ;
output Y ;
   not (I0_out, A);
   bufif1 (Y, I0_out, EN);
endmodule

module TBUFX2 (A, EN, Y);
input  A ;
input  EN ;
output Y ;
   not (I0_out, A);
   bufif1 (Y, I0_out, EN);
endmodule

module XNOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;
   xor (I0_out, A, B);
   not (Y, I0_out);
endmodule

module XOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;
   xor (Y, A, B);
endmodule

`endcelldefine
