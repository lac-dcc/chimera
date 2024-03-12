/*
 * lib74.v
 * 
 * Verilog simulation models for 74 series ICs
 * 
 */

`ifdef DELAY_SIM
  `define AND2_DELAY    9
  `define NAND3_DELAY  10
  `define NAND2_DELAY   8
  `define NOR2_DELAY    8
  `define NOR3_DELAY   10
  `define OR2_DELAY    10
  `define DLAT_DELAY   15
  `define DFF_DELAY    17
`else
  `define AND2_DELAY   0
  `define NAND3_DELAY  0
  `define NAND2_DELAY  0
  `define NOR2_DELAY   0
  `define NOR3_DELAY   0
  `define OR2_DELAY    0
  `define DLAT_DELAY   0
  `define DFF_DELAY    0
`endif

// Quad nand2 74HCT00
module SN7400 (
               i0_0, i0_1, o0,
               i1_0, i1_1, o1,
               i2_0, i2_1, o2,
               i3_0, i3_1, o3,
               vss, vdd               
               );
  input i0_0, i0_1;
  input i1_0, i1_1;
  input i2_0, i2_1;
  input i3_0, i3_1;
  output o0;
  output o1;
  output o2;
  output o3;  
  input  vss, vdd;
  
  nand  #(`NAND2_DELAY) U0  ( o0, i0_0, i0_1);  
  nand  #(`NAND2_DELAY) U1  ( o1, i1_0, i1_1);  
  nand  #(`NAND2_DELAY) U2  ( o2, i2_0, i2_1);  
  nand  #(`NAND2_DELAY) U3  ( o3, i3_0, i3_1); 
endmodule

// Quad NOR2 74HCT02
module SN7402 (
               i0_0, i0_1, o0,
               i1_0, i1_1, o1,
               i2_0, i2_1, o2,
               i3_0, i3_1, o3,
               vss, vdd               
               );
  input i0_0, i0_1;
  input i1_0, i1_1;
  input i2_0, i2_1;
  input i3_0, i3_1;
  output o0;
  output o1;
  output o2;
  output o3;  
  input  vss, vdd;
  
  nor #(`NOR2_DELAY) U0  ( o0, i0_0, i0_1);  
  nor #(`NOR2_DELAY) U1  ( o1, i1_0, i1_1);  
  nor #(`NOR2_DELAY) U2  ( o2, i2_0, i2_1);  
  nor #(`NOR2_DELAY) U3  ( o3, i3_0, i3_1); 
endmodule

// Quad AND2 74HCT08
module SN7408 (
               i0_0, i0_1, o0,
               i1_0, i1_1, o1,
               i2_0, i2_1, o2,
               i3_0, i3_1, o3,
               vss, vdd               
               );
  input i0_0, i0_1;
  input i1_0, i1_1;
  input i2_0, i2_1;
  input i3_0, i3_1;
  output o0;
  output o1;
  output o2;
  output o3;  
  input  vss, vdd;
  
        
  and #(`AND2_DELAY) U0 ( o0, i0_0, i0_1);  
  and #(`AND2_DELAY) U1 ( o1, i1_0, i1_1);  
  and #(`AND2_DELAY) U2 ( o2, i2_0, i2_1);  
  and #(`AND2_DELAY) U3 ( o3, i3_0, i3_1); 
endmodule


// Triple nand3 74HCT10
module SN7410 (
               i0_0, i0_1, i0_2, o0,
               i1_0, i1_1, i1_2, o1,
               i2_0, i2_1, i2_2, o2,
               vss, vdd
               );
  input i0_0, i0_1, i0_2;
  input i1_0, i1_1, i1_2;
  input i2_0, i2_1, i2_2;
  output o0;
  output o1;
  output o2;

  input  vss, vdd;
  
  nand #(`NAND3_DELAY) U0 ( o0, i0_0, i0_1, i0_2);  
  nand #(`NAND3_DELAY) U1 ( o1, i1_0, i1_1, i1_2);  
  nand #(`NAND3_DELAY) U2 ( o2, i2_0, i2_1, i2_2);  
endmodule

// Triple NOR3 74HCT27
module SN7427 (
               i0_0, i0_1, i0_2, o0,
               i1_0, i1_1, i1_2, o1,
               i2_0, i2_1, i2_2, o2,
               vss, vdd
               );
  input i0_0, i0_1, i0_2;
  input i1_0, i1_1, i1_2;
  input i2_0, i2_1, i2_2;
  output o0;
  output o1;
  output o2;

  input  vss, vdd;
  
  nor #(`NOR3_DELAY) U0 ( o0, i0_0, i0_1, i0_2);  
  nor #(`NOR3_DELAY) U1 ( o1, i1_0, i1_1, i1_2);  
  nor #(`NOR3_DELAY) U2 ( o2, i2_0, i2_1, i2_2);  
endmodule
 
// Quad or2 74HCT32
module SN7432 (
               i0_0, i0_1, o0,
               i1_0, i1_1, o1,
               i2_0, i2_1, o2,
               i3_0, i3_1, o3,
               vss, vdd               
               );
  input i0_0, i0_1;
  input i1_0, i1_1;
  input i2_0, i2_1;
  input i3_0, i3_1;
  output o0;
  output o1;
  output o2;
  output o3;  
  input  vss, vdd;
  
  
  or #(`OR2_DELAY) U0 ( o0, i0_0, i0_1);  
  or #(`OR2_DELAY) U1 ( o1, i1_0, i1_1);  
  or #(`OR2_DELAY) U2 ( o2, i2_0, i2_1);  
  or #(`OR2_DELAY) U3 ( o3, i3_0, i3_1); 
endmodule


// Quad Latch 74HCT75
module SN7475 (
               d0, q0, qb0,
               d1, q1, qb1,
               d2, q2, qb2,
               d3, q3, qb3,
               en01, en23,               
               vss, vdd               
               );
  input d0;
  input d1;
  input d2;
  input d3;
  input en01, en23;  
  output q0, qb0;
  output q1, qb1;
  output q2, qb2;
  output q3, qb3;  
  input  vss, vdd;

  reg [1:0] q01_r;
  reg [1:0] q23_r;  

  assign {q0,q1,qb0,qb1} = {q01_r, ~q01_r};
  assign {q2,q3,qb2,qb3} = {q23_r, ~q23_r};
  
  
  always @ ( * ) 
    if ( en01 )
      q01_r <= #(`DLAT_DELAY) {d0, d1 } ;

  always @ ( * ) 
    if ( en23 ) 
      q23_r <= #(`DLAT_DELAY) {d2, d3 } ;
  
endmodule
                    
// Hex posedge triggered D-FF with clear*
module SN74174 (
                clock,
                resetb,
                d0,
                d1,
                d2,
                d3,
                d4,
                d5,              
                q0,
                q1,
                q2,
                q3,
                q4,
                q5,
                vdd, 
                vss
                );
  input clock;  
  input resetb;  
  input d0;  
  input d1;  
  input d2;
  input d3;
  input d4;
  input d5;              
  output q0;
  output q1;
  output q2;
  output q3;
  output q4;
  output q5;
  input vdd; 
  input vss;

  reg [5:0] q_r;

  assign { q5,q4,q3,q2,q1,q0}  = q_r;  
  
  always @ (posedge clock or negedge resetb )
    if ( !resetb )
      q_r = 6'b0;
    else
      q_r= #(`DFF_DELAY) { d5,d4,d3,d2,d1,d0} ;
  
endmodule // SN74174

