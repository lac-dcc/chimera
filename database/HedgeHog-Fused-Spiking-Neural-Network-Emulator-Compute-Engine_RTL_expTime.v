//expTime.v
//
// Author:  Jerry D. Harthcock
// Version:  1.22  May 3, 2020
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

module expTime(
    CLK,
    RESET,
    ldRepeatReg,
    act_q5,
    pushSpikesIn_q5,
    spikeOut7,
    spikeOut6,
    spikeOut5,
    spikeOut4,
    spikeOut3,
    spikeOut2,
    spikeOut1,
    spikeOut0,
    rdaddrs,
    oneExp
    );
    
input CLK;
input RESET;
input ldRepeatReg;
input act_q5;
input pushSpikesIn_q5;
input spikeOut7;
input spikeOut6;
input spikeOut5;
input spikeOut4;
input spikeOut3;
input spikeOut2;
input spikeOut1;
input spikeOut0;
input [4:0] rdaddrs;
output [15:0] oneExp;
    
reg ldRepeatReg_q1;
reg ldRepeatReg_q2;
reg ldRepeatReg_q3;
reg ldRepeatReg_q4;
reg ldRepeatReg_q5;

reg [15:0] expOfspikeOut7;
reg [15:0] expOfspikeOut6;
reg [15:0] expOfspikeOut5;
reg [15:0] expOfspikeOut4;
reg [15:0] expOfspikeOut3;
reg [15:0] expOfspikeOut2;
reg [15:0] expOfspikeOut1;
reg [15:0] expOfspikeOut0;

//reg [7:0] expPntr;
reg [11:0] expPntr;

reg [15:0] oneExp;

wire [15:0] prob0;    
wire [15:0] prob1;    
wire [15:0] prob2;    
wire [15:0] prob3;    
wire [15:0] prob4;    
wire [15:0] prob5;    
wire [15:0] prob6;    
wire [15:0] prob7; 
wire [4:0] expBufSel;
wire [15:0] R01;
wire [15:0] R23;
wire [15:0] R45;
wire [15:0] R67;
wire [15:0] R0123;
wire [15:0] R4567;
wire [15:0] expSum;
wire [15:0] expOfTick;

assign expBufSel = rdaddrs[4:0];

always @(posedge CLK) begin
    ldRepeatReg_q1 <= ldRepeatReg;
    ldRepeatReg_q2 <= ldRepeatReg_q1;
    ldRepeatReg_q3 <= ldRepeatReg_q2;
    ldRepeatReg_q4 <= ldRepeatReg_q3;
    ldRepeatReg_q5 <= ldRepeatReg_q4;
end

always @(posedge CLK)
    if (RESET || ldRepeatReg_q5) expPntr <= 0;
    else if (pushSpikesIn_q5 && act_q5) expPntr <= expPntr + 1'b1;
    
tickExp tickExp(
    .CLK    (CLK),
    .rden   (pushSpikesIn_q5 && act_q5),
    .rdaddrs(expPntr),
    .rddata (expOfTick)   //exponential of this tick
    );    

always @(posedge CLK)
    if (RESET || ldRepeatReg_q5) begin
        expOfspikeOut7 <= 0;
        expOfspikeOut6 <= 0;
        expOfspikeOut5 <= 0;
        expOfspikeOut4 <= 0;
        expOfspikeOut3 <= 0;
        expOfspikeOut2 <= 0;
        expOfspikeOut1 <= 0;
        expOfspikeOut0 <= 0;
    end    
    else if (pushSpikesIn_q5 && act_q5) begin
        if (spikeOut7) expOfspikeOut7 <= expOfTick;
        if (spikeOut6) expOfspikeOut6 <= expOfTick;
        if (spikeOut5) expOfspikeOut5 <= expOfTick;
        if (spikeOut4) expOfspikeOut4 <= expOfTick;
        if (spikeOut3) expOfspikeOut3 <= expOfTick;
        if (spikeOut2) expOfspikeOut2 <= expOfTick;
        if (spikeOut1) expOfspikeOut1 <= expOfTick;
        if (spikeOut0) expOfspikeOut0 <= expOfTick;
    end


FADD711 fadd_01(
    .CLK   (CLK      ),
    .A     (expOfspikeOut0),
    .GRSinA(3'b0     ),
    .B     (expOfspikeOut1),
    .GRSinB(3'b0     ),
    .R     (R01      ),
    .GRSout(         ),
    .except(         )
    );     
    
FADD711 fadd_23(
    .CLK   (CLK      ),
    .A     (expOfspikeOut2),
    .GRSinA(3'b0     ),
    .B     (expOfspikeOut3),
    .GRSinB(3'b0     ),
    .R     (R23      ),
    .GRSout(         ),
    .except(         )
    );     
    
FADD711 fadd_45(
    .CLK   (CLK      ),
    .A     (expOfspikeOut4),
    .GRSinA(3'b0     ),
    .B     (expOfspikeOut5),
    .GRSinB(3'b0     ),
    .R     (R45      ),
    .GRSout(         ),
    .except(         )
    );     
    
FADD711 fadd_67(
    .CLK   (CLK      ),
    .A     (expOfspikeOut6),
    .GRSinA(3'b0     ),
    .B     (expOfspikeOut7),
    .GRSinB(3'b0     ),
    .R     (R67      ),
    .GRSout(         ),
    .except(         )
    );     
    
FADD711 fadd_0123(
    .CLK   (CLK      ),
    .A     (R01      ),
    .GRSinA(3'b0     ),
    .B     (R23      ),
    .GRSinB(3'b0     ),
    .R     (R0123    ),
    .GRSout(         ),
    .except(         )
    );     
    
FADD711 fadd_4567(
    .CLK   (CLK      ),
    .A     (R45      ),
    .GRSinA(3'b0     ),
    .B     (R67      ),
    .GRSinB(3'b0     ),
    .R     (R4567    ),
    .GRSout(         ),
    .except(         )
    );     

FADD711 fadd_expSum(
    .CLK   (CLK      ),
    .A     (R0123    ),
    .GRSinA(3'b0     ),
    .B     (R4567    ),
    .GRSinB(3'b0     ),
    .R     (expSum   ),
    .GRSout(         ),
    .except(         )
    );     

   
FDIV711 div0(    // 4 clocks
    .CLK   (CLK   ),
    .RESET (RESET ),
    .A     (expOfspikeOut0),
    .GRSinA(3'b000),
    .B     (~|expSum ? 15'h3F00 : expSum),
    .GRSinB(3'b000),
    .R     (prob0 ),
    .GRSout(      ),
    .except(      )
    );
    
FDIV711 div1(    // 4 clocks
    .CLK   (CLK   ),
    .RESET (RESET ),
    .A     (expOfspikeOut1),
    .GRSinA(3'b000),
    .B     (~|expSum ? 15'h3F00 : expSum),
    .GRSinB(3'b000),
    .R     (prob1 ),
    .GRSout(      ),
    .except(      )
    );
    
FDIV711 div2(    // 4 clocks
    .CLK   (CLK   ),
    .RESET (RESET ),
    .A     (expOfspikeOut2),
    .GRSinA(3'b000),
    .B     (~|expSum ? 15'h3F00 : expSum),
    .GRSinB(3'b000),
    .R     (prob2 ),
    .GRSout(      ),
    .except(      )
    );
    
FDIV711 div3(    // 4 clocks
    .CLK   (CLK   ),
    .RESET (RESET ),
    .A     (expOfspikeOut3),
    .GRSinA(3'b000),
    .B     (~|expSum ? 15'h3F00 : expSum),
    .GRSinB(3'b000),
    .R     (prob3 ),
    .GRSout(      ),
    .except(      )
    );
  
FDIV711 div4(    // 4 clocks
    .CLK   (CLK   ),
    .RESET (RESET ),
    .A     (expOfspikeOut4),
    .GRSinA(3'b000),
    .B     (~|expSum ? 15'h3F00 : expSum),
    .GRSinB(3'b000),
    .R     (prob4 ),
    .GRSout(      ),
    .except(      )
    );

FDIV711 div5(    // 4 clocks
    .CLK   (CLK   ),
    .RESET (RESET ),
    .A     (expOfspikeOut5),
    .GRSinA(3'b000),
    .B     (~|expSum ? 15'h3F00 : expSum),
    .GRSinB(3'b000),
    .R     (prob5 ),
    .GRSout(      ),
    .except(      )
    );
 
FDIV711 div6(    // 4 clocks
    .CLK   (CLK   ),
    .RESET (RESET ),
    .A     (expOfspikeOut6),
    .GRSinA(3'b000),
    .B     (~|expSum ? 15'h3F00 : expSum),
    .GRSinB(3'b000),
    .R     (prob6 ),
    .GRSout(      ),
    .except(      )
    );
  
FDIV711 div7(    // 4 clocks
    .CLK   (CLK   ),
    .RESET (RESET ),
    .A     (expOfspikeOut7),
    .GRSinA(3'b000),
    .B     (~|expSum ? 15'h3F00 : expSum),
    .GRSinB(3'b000),
    .R     (prob7 ),
    .GRSout(      ),
    .except(      )
    );
        

always @(*)
    case(expBufSel)
        5'b00000 : oneExp = expOfspikeOut0;
        5'b00001 : oneExp = expOfspikeOut1;
        5'b00010 : oneExp = expOfspikeOut2;
        5'b00011 : oneExp = expOfspikeOut3;
        5'b00100 : oneExp = expOfspikeOut4;
        5'b00101 : oneExp = expOfspikeOut5;
        5'b00110 : oneExp = expOfspikeOut6;
        5'b00111 : oneExp = expOfspikeOut7;
        5'b01000 : oneExp = prob0;
        5'b01001 : oneExp = prob1;
        5'b01010 : oneExp = prob2;
        5'b01011 : oneExp = prob3;
        5'b01100 : oneExp = prob4;
        5'b01101 : oneExp = prob5;
        5'b01110 : oneExp = prob6;
        5'b01111 : oneExp = prob7;
         default : oneExp = expSum;
    endcase

endmodule
