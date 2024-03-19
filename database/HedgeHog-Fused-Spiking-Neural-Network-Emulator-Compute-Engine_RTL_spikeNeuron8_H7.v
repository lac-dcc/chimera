//spikeNeuron8_H7.v
//
// Author:  Jerry D. Harthcock
// Version:  1.23  June 28, 2020
// Copyright (C) 2020.  All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                    //
//                                                 SYMPL Open-Source                                                  //
//                          HedgeHog Fused Spiking Neural Network Emulator/Compute Engine                             //
//                                    Evaluation and Product Development License                                      //
//                                                                                                                    //
//                                                                                                                    //
// Open-source means:  this source code and this instruction set ("this IP") may be freely downloaded, copied,        //
// modified, distributed and used in accordance with the terms and conditons of the licenses provided herein.         //
//                                                                                                                    //
// Provided that you comply with all the terms and conditions set forth herein, Jerry D. Harthcock ("licensor"),      //
// the original author and exclusive copyright owner of this HedgeHog Fused Spiking Neural Network Emulator/Compute   //
// Engine, including related development software ("this IP"), hereby grants recipient of this IP ("licensee"),       //
// a world-wide, paid-up, non-exclusive license to implement this IP within the programmable fabric of Xilinx Kintex  //
// Ultra Plus brand FPGAs--only--and used only for the purposes of evaluation, education, and development of end      //
// products and related development tools.                                                                            //
//                                                                                                                    //
// Furthermore, limited to the purposes of prototyping, evaluation, characterization and testing of implementations   //
// in a hard, custom or semi-custom ASIC, any university or institution of higher education may have their            //
// implementation of this IP produced for said limited purposes at any foundary of their choosing provided that such  //
// prototypes do not ever wind up in commercial circulation, with this license extending to such foundary and is in   //
// connection with said academic pursuit under the supervision of said university or institution of higher education. //
//                                                                                                                    //
// Any copying, distribution, customization, modification, or derivative work of this IP must include an exact copy   //
// of this license and original copyright notice at the very top of each source file and any derived netlist, and,    //
// in the case of binaries, a printed copy of this license and/or a text format copy in a separate file distributed   //
// with said netlists or binary files having the file name, "LICENSE.txt".  You, the licensee, also agree not to      //
// remove any copyright notices from any source file covered or distributed under this Evaluation and Product         //
// Development License.                                                                                               //
//                                                                                                                    //
// LICENSOR DOES NOT WARRANT OR GUARANTEE THAT YOUR USE OF THIS IP WILL NOT INFRINGE THE RIGHTS OF OTHERS OR          //
// THAT IT IS SUITABLE OR FIT FOR ANY PURPOSE AND THAT YOU, THE LICENSEE, AGREE TO HOLD LICENSOR HARMLESS FROM        //
// ANY CLAIM BROUGHT BY YOU OR ANY THIRD PARTY FOR YOUR SUCH USE.                                                     //
//                                                                                                                    //
// Licensor reserves all his rights, including, but in no way limited to, the right to change or modify the terms     //
// and conditions of this Evaluation and Product Development License anytime without notice of any kind to anyone.    //
// By using this IP for any purpose, licensee agrees to all the terms and conditions set forth in this Evaluation     //
// and Product Development License.                                                                                   //
//                                                                                                                    //
// This Evaluation and Product Development License does not include the right to sell products that incorporate       //
// this IP or any IP derived from this IP. If you would like to obtain such a license, please contact Licensor.       //
//                                                                                                                    //
// Licensor can be contacted at:  SYMPL.gpu@gmail.com or Jerry.Harthcock@gmail.com                                    //
//                                                                                                                    //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


 `timescale 1ns/100ps

 module spikeNeuron8_H7 (
    CLK,
    RESET,
    pushSpikesIn,
    rate0,
    rate1,
    rate2,
    rate3,
    rate4,
    rate5,
    rate6,
    rate7,
    spikeIn0,
    spikeIn1,
    spikeIn2,
    spikeIn3,
    spikeIn4,
    spikeIn5,
    spikeIn6,
    spikeIn7,
    threshold,    
    weight0,    
    weight1,    
    weight2,    
    weight3,    
    weight4,    
    weight5,    
    weight6,    
    weight7,
    activate,
    accumulate, 
    prevSum,   
    levelOut0,
    levelOut1,
    levelOut2,
    levelOut3,
    levelOut4,
    levelOut5,
    levelOut6,
    levelOut7,
    levelOutMembr,
    spikeOut,
    err,
    slope
    );

input  CLK;
input  RESET;
input  pushSpikesIn;
input  [2:0] rate0;
input  [2:0] rate1;
input  [2:0] rate2;
input  [2:0] rate3;
input  [2:0] rate4;
input  [2:0] rate5;
input  [2:0] rate6;
input  [2:0] rate7;
input  spikeIn0;
input  spikeIn1;
input  spikeIn2;
input  spikeIn3;
input  spikeIn4;
input  spikeIn5;
input  spikeIn6;
input  spikeIn7;
input  [15:0] threshold;
input  [15:0] weight0;
input  [15:0] weight1;
input  [15:0] weight2;
input  [15:0] weight3;
input  [15:0] weight4;
input  [15:0] weight5;
input  [15:0] weight6;
input  [15:0] weight7;
input  activate;
input  accumulate;
input  [15:0] prevSum;  //previous sum
output [15:0] levelOut0;
output [15:0] levelOut1;
output [15:0] levelOut2;
output [15:0] levelOut3;
output [15:0] levelOut4;
output [15:0] levelOut5;
output [15:0] levelOut6;
output [15:0] levelOut7;
output [15:0] levelOutMembr;
output  spikeOut;
output [15:0] err;
output [15:0] slope;

wire [15:0] slope;

wire [15:0] R01;
wire [15:0] R23;
wire [15:0] R45;
wire [15:0] R67;
wire [15:0] R0123;
wire [15:0] R4567;
wire [15:0] R01234567;
wire [15:0] levelOutMembr;
wire [15:0] accumSum;

wire [15:0] err;

wire spikeOut;

wire [15:0] threshGateAdj;

wire killDend_A0;
wire killDend_B0;
wire killDend_A1;
wire killDend_B1;
wire killDend_A2;
wire killDend_B2;
wire killDend_A3;
wire killDend_B3;

assign spikeOut = activate ? (levelOutMembr > threshold) : 1'b0;
assign accumSum = accumulate ? prevSum : 16'h0000;

dualDendRC_H7 dualDend_0(
    .CLK           (CLK          ), 
    .RESET         (RESET        ), 
    .pushSpikesIn  (pushSpikesIn ),  
    .rateA         (rate0        ), 
    .rateB         (rate1        ), 
    .spikeInA      (spikeIn0     ), 
    .spikeInB      (spikeIn1     ), 
    .membraneFired (spikeOut     ),
    .weightA       (weight0      ),
    .weightB       (weight1      ),
    .levelOutA     (levelOut0    ),
    .levelOutB     (levelOut1    ),
    .killDend_A    (killDend_A0  ),
    .killDend_B    (killDend_B0  )
    );                           

dualDendRC_H7 dualDend_1(
    .CLK           (CLK          ), 
    .RESET         (RESET        ),   
    .pushSpikesIn  (pushSpikesIn ),  
    .rateA         (rate2        ), 
    .rateB         (rate3        ), 
    .spikeInA      (spikeIn2     ), 
    .spikeInB      (spikeIn3     ), 
    .membraneFired (spikeOut     ),
    .weightA       (weight2      ),
    .weightB       (weight3      ),
    .levelOutA     (levelOut2    ),
    .levelOutB     (levelOut3    ),
    .killDend_A    (killDend_A1  ),
    .killDend_B    (killDend_B1  )
    );                           

dualDendRC_H7 dualDend_2(
    .CLK           (CLK          ), 
    .RESET         (RESET        ),   
    .pushSpikesIn  (pushSpikesIn ),  
    .rateA         (rate4        ), 
    .rateB         (rate5        ), 
    .spikeInA      (spikeIn4     ), 
    .spikeInB      (spikeIn5     ), 
    .membraneFired (spikeOut     ),
    .weightA       (weight4      ),
    .weightB       (weight5      ),
    .levelOutA     (levelOut4    ),
    .levelOutB     (levelOut5    ),
    .killDend_A    (killDend_A2  ),
    .killDend_B    (killDend_B2  )
    );                           

dualDendRC_H7 dualDend_3(
    .CLK           (CLK          ), 
    .RESET         (RESET        ),   
    .pushSpikesIn  (pushSpikesIn ),  
    .rateA         (rate6        ), 
    .rateB         (rate7        ), 
    .spikeInA      (spikeIn6     ), 
    .spikeInB      (spikeIn7     ), 
    .membraneFired (spikeOut     ),
    .weightA       (weight6      ),
    .weightB       (weight7      ),
    .levelOutA     (levelOut6    ),
    .levelOutB     (levelOut7    ),
    .killDend_A    (killDend_A3  ),
    .killDend_B    (killDend_B3  )
    );                            


FADD711 fadd_01(
    .CLK   (CLK      ),
    .A     (killDend_A0 ? 16'b0 : levelOut0),
    .GRSinA(3'b0     ),
    .B     (killDend_B0 ? 16'b0 : levelOut1),
    .GRSinB(3'b0     ),
    .R     (R01      ),
    .GRSout(         ),
    .except(         )
    );     

FADD711 fadd_23(
    .CLK   (CLK      ),
    .A     (killDend_A1 ? 16'b0 : levelOut2),
    .GRSinA(3'b0     ),
    .B     (killDend_B1 ? 16'b0 : levelOut3),
    .GRSinB(3'b0     ),
    .R     (R23      ),
    .GRSout(         ),
    .except(         )
    );     

FADD711 fadd_45(
    .CLK   (CLK      ),
    .A     (killDend_A2 ? 16'b0 : levelOut4),
    .GRSinA(3'b0     ),
    .B     (killDend_B2 ? 16'b0 : levelOut5),
    .GRSinB(3'b0     ),
    .R     (R45      ),
    .GRSout(         ),
    .except(         )
    );     

FADD711 fadd_67(
    .CLK   (CLK      ),
    .A     (killDend_A3 ? 16'b0 : levelOut6),
    .GRSinA(3'b0     ),
    .B     (killDend_B3 ? 16'b0 : levelOut7),
    .GRSinB(3'b0     ),
    .R     (R67      ),
    .GRSout(         ),
    .except(         )
    );     

wire killDend_A0B0;
wire killDend_A1B1;
wire killDend_A2B2;
wire killDend_A3B3;
assign killDend_A0B0 = killDend_A0 || killDend_B0;
assign killDend_A1B1 = killDend_A1 || killDend_B1;
assign killDend_A2B2 = killDend_A2 || killDend_B2;
assign killDend_A3B3 = killDend_A3 || killDend_B3;


FADD711 fadd_0123(
    .CLK   (CLK  ),
    .A     (killDend_A0B0 ? 16'b0 : R01  ),
    .GRSinA(3'b0 ),
    .B     (killDend_A1B1 ? 16'b0 : R23  ),
    .GRSinB(3'b0 ),
    .R     (R0123),
    .GRSout(     ),
    .except(     )
    );     

FADD711 fadd_4567(
    .CLK   (CLK  ),
    .A     (killDend_A2B2 ? 16'b0 : R45  ),
    .GRSinA(3'b0 ),
    .B     (killDend_A3B3 ? 16'b0 : R67  ),
    .GRSinB(3'b0 ),
    .R     (R4567),
    .GRSout(     ),
    .except(     )
    );     

wire killDend_A0B0A1B1;
wire killDend_A2B2A3B3;
assign killDend_A0B0A1B1 = killDend_A0B0 || killDend_A1B1;
assign killDend_A2B2A3B3 = killDend_A2B2 || killDend_A3B3;

FADD711 fadd_01234567(
    .CLK   (CLK  ),
    .A     (killDend_A0B0A1B1 ? 16'b0 : R0123),
    .GRSinA(3'b0 ),
    .B     (killDend_A2B2A3B3 ? 16'b0 : R4567),
    .GRSinB(3'b0 ),
    .R     (R01234567),
    .GRSout(     ),
    .except(     )
    );     

wire killAll;
assign killAll = killDend_A0B0A1B1 || killDend_A2B2A3B3;

FADD711 fadd_R(
    .CLK   (CLK  ),
    .A     (killAll ? 16'b0 : R01234567),
    .GRSinA(3'b0 ),
    .B     (killAll ? 16'b0 : accumSum),
    .GRSinB(3'b0 ),
    .R     (levelOutMembr),
    .GRSout(     ),
    .except(     )
    );   

`ifdef HedgeHog_HAS_ERROR_TRACE    
FADD711 fadd_err(
    .CLK   (CLK  ),
    .A     (threshold),
    .GRSinA(3'b0 ),
    .B     ({1'b1, levelOutMembr[14:0]}),
    .GRSinB(3'b0 ),
    .R     (err  ),    
    .GRSout(     ),
    .except(     )
    ); 
`else
assign err = 0;
`endif

`ifdef HedgeHog_HAS_SLOPE_TRACE      
reg [15:0] prevLevelOut;
always@(posedge CLK) prevLevelOut <= levelOutMembr;

FADD711 fadd_slope(
    .CLK   (CLK  ),
    .A     (levelOutMembr),
    .GRSinA(3'b0 ),
    .B     ({1'b1, prevLevelOut[14:0]}),
    .GRSinB(3'b0 ),
    .R     (slope),    
    .GRSout(     ),
    .except(     )
    );     
`else
assign slope = 0;
`endif

endmodule
