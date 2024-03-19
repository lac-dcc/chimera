// Modified version of OSU's TSMC 18nm stdcell library.

module dummy(A, B, C, D, EN, Y, YC, YS);
    input A;
    input B;
    input C;
    input D;
    input EN;
    output [24:0] Y;
    output [1:0] YC;
    output [1:0] YS;

    AND2X1 inst_1 (A, B, Y[1]);
    AND2X2 inst_2 (A, B, Y[2]);
    AOI21X1 inst_3 (A, B, C, Y[3]);
    AOI22X1 inst_4 (A, B, C, D, Y[4]);
    BUFX2 inst_5 (A, Y[5]);
    BUFX4 inst_6 (A, Y[6]);
    CLKBUF1 inst_7 (A, Y[7]);
    CLKBUF2 inst_8 (A, Y[8]);
    CLKBUF3 inst_9 (A, Y[9]);
    FAX1 inst_10 (A, B, C, YC[0], YS[0]);
    HAX1 inst_11 (A, B, YC[1], YS[1]);
    INVX1 inst_12 (A, Y[10]);
    INVX2 inst_13 (A, Y[11]);
    INVX4 inst_14 (A, Y[12]);
    INVX8 inst_15 (A, Y[13]);
    NAND2X1 inst_16 (A, B, Y[14]);
    NAND3X1 inst_17 (A, B, C, Y[15]);
    NOR2X1 inst_18 (A, B, Y[16]);
    NOR3X1 inst_19 (A, B, C, Y[17]);
    OAI21X1 inst_20 (A, B, C, Y[18]);
    OAI22X1 inst_21 (A, B, C, D, Y[19]);
    OR2X1 inst_22 (A, B, Y[20]);
    OR2X2 inst_23 (A, B, Y[21]);
    TBUFX1 inst_24 (A, EN, Y[22]);
    TBUFX2 inst_25 (A, EN, Y[23]);
    XNOR2X1 inst_26 (A, B, Y[24]);
    XOR2X1 inst_27 (A, B, Y[0]);

endmodule

`timescale 1ns/10ps
`celldefine
module AND2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$B$Y = 0.065:0.065:0.065,
       tphhl$B$Y = 0.086:0.086:0.086,
       tpllh$A$Y = 0.064:0.064:0.064,
       tphhl$A$Y = 0.076:0.076:0.076;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.079:0.079:0.079,
       tphhl$A$Y = 0.094:0.094:0.094,
       tpllh$B$Y = 0.082:0.082:0.082,
       tphhl$B$Y = 0.1:0.1:0.1;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI21X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I0_out, A, B);
   or  (I1_out, I0_out, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.048:0.048:0.048,
       tphlh$A$Y = 0.065:0.065:0.065,
       tplhl$B$Y = 0.049:0.049:0.049,
       tphlh$B$Y = 0.055:0.055:0.055,
       tplhl$C$Y = 0.039:0.041:0.043,
       tphlh$C$Y = 0.039:0.048:0.056;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
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

   specify
     // delay parameters
     specparam
       tplhl$C$Y = 0.042:0.043:0.045,
       tphlh$C$Y = 0.054:0.064:0.073,
       tplhl$D$Y = 0.041:0.043:0.044,
       tphlh$D$Y = 0.047:0.055:0.064,
       tplhl$A$Y = 0.055:0.06:0.064,
       tphlh$A$Y = 0.068:0.077:0.086,
       tplhl$B$Y = 0.056:0.06:0.065,
       tphlh$B$Y = 0.06:0.069:0.079;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX2 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.08:0.08:0.08,
       tphhl$A$Y = 0.09:0.09:0.09;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX4 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.094:0.094:0.094,
       tphhl$A$Y = 0.097:0.097:0.097;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUF1 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.17:0.17:0.17,
       tphhl$A$Y = 0.17:0.17:0.17;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUF2 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.23:0.23:0.23,
       tphhl$A$Y = 0.24:0.24:0.24;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUF3 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.29:0.29:0.29,
       tphhl$A$Y = 0.3:0.3:0.3;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
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

   specify
     // delay parameters
     specparam
       tpllh$A$YS = 0.19:0.2:0.2,
       tplhl$A$YS = 0.18:0.18:0.18,
       tpllh$A$YC = 0.11:0.11:0.11,
       tphhl$A$YC = 0.13:0.13:0.13,
       tpllh$B$YS = 0.19:0.2:0.21,
       tplhl$B$YS = 0.19:0.19:0.19,
       tpllh$B$YC = 0.11:0.11:0.12,
       tphhl$B$YC = 0.13:0.13:0.14,
       tpllh$C$YS = 0.19:0.2:0.2,
       tplhl$C$YS = 0.18:0.18:0.18,
       tpllh$C$YC = 0.1:0.11:0.12,
       tphhl$C$YC = 0.12:0.12:0.13;

     // path delays
     (A *> YC) = (tpllh$A$YC, tphhl$A$YC);
     (A *> YS) = (tpllh$A$YS, tplhl$A$YS);
     (B *> YC) = (tpllh$B$YC, tphhl$B$YC);
     (B *> YS) = (tpllh$B$YS, tplhl$B$YS);
     (C *> YC) = (tpllh$C$YC, tphhl$C$YC);
     (C *> YS) = (tpllh$C$YS, tplhl$C$YS);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module HAX1 (A, B, YC, YS);
input  A ;
input  B ;
output YC ;
output YS ;

   and (YC, A, B);
   xor (YS, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$YS = 0.15:0.15:0.15,
       tplhl$A$YS = 0.15:0.15:0.15,
       tpllh$A$YC = 0.085:0.085:0.085,
       tphhl$A$YC = 0.11:0.11:0.11,
       tpllh$B$YS = 0.14:0.14:0.14,
       tplhl$B$YS = 0.15:0.15:0.15,
       tpllh$B$YC = 0.083:0.083:0.083,
       tphhl$B$YC = 0.097:0.097:0.097;

     // path delays
     (A *> YC) = (tpllh$A$YC, tphhl$A$YC);
     (A *> YS) = (tpllh$A$YS, tplhl$A$YS);
     (B *> YC) = (tpllh$B$YC, tphhl$B$YC);
     (B *> YS) = (tpllh$B$YS, tplhl$B$YS);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX1 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.031:0.031:0.031,
       tphlh$A$Y = 0.038:0.038:0.038;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX2 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.033:0.033:0.033,
       tphlh$A$Y = 0.038:0.038:0.038;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX4 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.033:0.033:0.033,
       tphlh$A$Y = 0.038:0.038:0.038;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX8 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.033:0.033:0.033,
       tphlh$A$Y = 0.038:0.038:0.038;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine


`timescale 1ns/10ps
`celldefine
module NAND2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.033:0.033:0.033,
       tphlh$A$Y = 0.054:0.054:0.054,
       tplhl$B$Y = 0.031:0.031:0.031,
       tphlh$B$Y = 0.046:0.046:0.046;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$B$Y = 0.039:0.039:0.039,
       tphlh$B$Y = 0.066:0.066:0.066,
       tplhl$A$Y = 0.041:0.041:0.041,
       tphlh$A$Y = 0.077:0.077:0.077,
       tplhl$C$Y = 0.033:0.033:0.033,
       tphlh$C$Y = 0.052:0.052:0.052;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$B$Y = 0.038:0.038:0.038,
       tphlh$B$Y = 0.044:0.044:0.044,
       tplhl$A$Y = 0.052:0.052:0.052,
       tphlh$A$Y = 0.049:0.049:0.049;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$B$Y = 0.069:0.069:0.069,
       tphlh$B$Y = 0.065:0.065:0.065,
       tplhl$C$Y = 0.049:0.049:0.049,
       tphlh$C$Y = 0.048:0.048:0.048,
       tplhl$A$Y = 0.077:0.077:0.077,
       tphlh$A$Y = 0.07:0.07:0.07;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI21X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I0_out, A, B);
   and (I1_out, I0_out, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.05:0.05:0.05,
       tphlh$A$Y = 0.066:0.066:0.066,
       tplhl$B$Y = 0.04:0.04:0.04,
       tphlh$B$Y = 0.061:0.061:0.061,
       tplhl$C$Y = 0.03:0.038:0.046,
       tphlh$C$Y = 0.048:0.049:0.05;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
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

   specify
     // delay parameters
     specparam
       tplhl$D$Y = 0.038:0.047:0.055,
       tphlh$D$Y = 0.055:0.055:0.056,
       tplhl$C$Y = 0.044:0.054:0.064,
       tphlh$C$Y = 0.059:0.059:0.06,
       tplhl$A$Y = 0.051:0.06:0.07,
       tphlh$A$Y = 0.075:0.078:0.081,
       tplhl$B$Y = 0.044:0.052:0.059,
       tphlh$B$Y = 0.071:0.073:0.076;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$B$Y = 0.086:0.086:0.086,
       tphhl$B$Y = 0.081:0.081:0.081,
       tpllh$A$Y = 0.074:0.074:0.074,
       tphhl$A$Y = 0.076:0.076:0.076;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$B$Y = 0.1:0.1:0.1,
       tphhl$B$Y = 0.099:0.099:0.099,
       tpllh$A$Y = 0.093:0.093:0.093,
       tphhl$A$Y = 0.094:0.094:0.094;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX1 (A, EN, Y);
input  A ;
input  EN ;
output Y ;

   not (I0_out, A);
   bufif1 (Y, I0_out, EN);

   specify
     // delay parameters
     specparam
       tpzh$EN$Y = 0.064:0.064:0.064,
       tpzl$EN$Y = 0.021:0.021:0.021,
       tplz$EN$Y = 0.044:0.044:0.044,
       tphz$EN$Y = 0.059:0.059:0.059,
       tplhl$A$Y = 0.043:0.043:0.043,
       tphlh$A$Y = 0.062:0.062:0.062;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (EN *> Y) = (0, 0, tplz$EN$Y, tpzh$EN$Y, tphz$EN$Y, tpzl$EN$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX2 (A, EN, Y);
input  A ;
input  EN ;
output Y ;

   not (I0_out, A);
   bufif1 (Y, I0_out, EN);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.045:0.045:0.045,
       tphlh$A$Y = 0.062:0.062:0.062,
       tpzh$EN$Y = 0.067:0.067:0.067,
       tpzl$EN$Y = 0.021:0.021:0.021,
       tplz$EN$Y = 0.044:0.044:0.044,
       tphz$EN$Y = 0.06:0.06:0.06;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (EN *> Y) = (0, 0, tplz$EN$Y, tpzh$EN$Y, tphz$EN$Y, tpzl$EN$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XNOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.085:0.085:0.085,
       tplhl$A$Y = 0.081:0.081:0.081,
       tpllh$B$Y = 0.1:0.1:0.1,
       tplhl$B$Y = 0.089:0.089:0.089;

     // path delays
     (A *> Y) = (tpllh$A$Y, tplhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$B$Y = 0.096:0.096:0.096,
       tplhl$B$Y = 0.091:0.091:0.091,
       tpllh$A$Y = 0.085:0.085:0.085,
       tplhl$A$Y = 0.08:0.08:0.08;

     // path delays
     (A *> Y) = (tpllh$A$Y, tplhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine
