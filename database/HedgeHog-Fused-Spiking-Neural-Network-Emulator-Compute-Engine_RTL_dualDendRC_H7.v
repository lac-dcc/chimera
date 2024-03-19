//dualDendRC_H7.v
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

module dualDendRC_H7 (
    CLK,
    RESET,
    pushSpikesIn,  
    rateA,
    rateB,
    spikeInA,
    spikeInB,
    membraneFired,
    weightA,
    weightB,
    levelOutA,
    levelOutB,
    killDend_A,
    killDend_B
    );
input CLK;
input RESET;
input pushSpikesIn;
input [2:0] rateA;
input [2:0] rateB;
input spikeInA;
input spikeInB;
input membraneFired;
input [15:0] weightA;
input [15:0] weightB;
output [15:0] levelOutA;
output [15:0] levelOutB;
output killDend_A;
output killDend_B;

parameter idle = 2'b00;
parameter charge = 2'b01;
parameter discharge = 2'b10;

reg [5:0] tickA;
reg [5:0] tickB;

reg [1:0] stateA;
reg [1:0] stateB;
reg [1:0] stateA_q1;
reg [1:0] stateB_q1;

wire dischargedA;    // 1 = discharged, 0 = still discharging
wire dischargedB;    // 1 = discharged, 0 = still discharging
wire chargedA;       // 1 = charged, 0 = still charging
wire chargedB;       // 1 = charged, 0 = still charging

wire [15:0] levelOutA;
wire [15:0] levelOutB;

wire [33:0] TauA;
wire [33:0] TauB;

wire resetA;
wire resetB;


wire [15:0] percentA;
wire [15:0] percentB;

wire [8:0] rdaddrsA;
wire [8:0] rdaddrsB;

wire killDend_A;
wire killDend_B;

assign killDend_A = resetA || (stateA==idle);
assign killDend_B = resetB || (stateB==idle);

assign percentA = (stateA==idle || stateA_q1==charge || stateA_q1==idle) ? TauA[31:16] : TauA[15:0];
assign percentB = (stateB==idle || stateB_q1==charge || stateB_q1==idle) ? TauB[31:16] : TauB[15:0];

assign resetA = RESET || membraneFired;  
assign resetB = RESET || membraneFired;  

assign rdaddrsA = {rateA, tickA};
assign rdaddrsB = {rateB, tickB};

assign  chargedA = TauA[33] && (stateA==charge);   
assign  chargedB = TauB[33] && (stateB==charge); 
assign  dischargedA = TauA[32] && |tickA && (stateA==discharge);
assign  dischargedB = TauB[32] && |tickB && (stateB==discharge);
  
tauRom_H7 tauRom(
   .CLK     (CLK     ),
   .rdenA   (1'b1    ),
   .rdenB   (1'b1    ),
   .rdaddrsA(rdaddrsA),
   .rdaddrsB(rdaddrsB),
   .rddataA (TauA    ),
   .rddataB (TauB    )
    );    

FMUL711 FMUL_A(
    .CLK   (CLK),
    .A     (|stateA ? weightA : 16'b0),
    .GRSinA(3'b0),
    .B     (membraneFired ? 16'b0 : percentA),
    .GRSinB(3'b0),
    .R     (levelOutA),
    .GRSout(  ),
    .except(  )
    );

FMUL711 FMUL_B(
    .CLK   (CLK),
    .A     (|stateB ? weightB : 16'b0),
    .GRSinA(3'b0  ),
    .B     (membraneFired ? 16'b0 : percentB),
    .GRSinB(3'b0  ),
    .R     (levelOutB),
    .GRSout(  ),
    .except(  )
    );
    
always @(posedge CLK)
    if(resetA) begin
        tickA <= 0;
        stateA <= 0;
        stateA_q1 <= 0;
    end    
    else if (pushSpikesIn) begin
        stateA_q1 <= stateA;
        case(stateA)
                 idle : if (spikeInA) begin     //wait here for a spike on the input
                           stateA <= charge;    //when detected go to charge state
                           tickA <= 1;
                        end   
               charge : if (~chargedA) tickA <= tickA + 1; //if not charged, then increase 
                        else begin         //if charged, go to discharge
                           stateA <= discharge;
                           tickA <= 0;
                        end   
            discharge : if (dischargedA || &tickA) begin
                           stateA <= idle; //if discharged or max ticks reached, go back to idle
                           tickA <= 0;
                        end   
                        else tickA <= tickA + 1;
                                
              default : begin
                           tickA <= 0;
                           stateA <= idle;
                        end
        endcase                   
    end
    
always @(posedge CLK)
    if(resetB) begin
        tickB <= 0;
        stateB <= 0;
        stateB_q1 <= 0;
    end    
    else if (pushSpikesIn) begin
        stateB_q1 <= stateB;
        case(stateB)
                 idle : if (spikeInB) begin     //wait here for a spike on the input
                           stateB <= charge;    //when detected go to charge state
                           tickB <= 1;
                        end   
               charge : if (~chargedB) tickB <= tickB + 1;  
                        else begin
                           stateB <= discharge;
                           tickB <= 0;
                        end   
            discharge : if (dischargedB || &tickB) begin
                           stateB <= idle; //if discharged or max ticks reached, go back to idle
                           tickB <= 0;
                        end   
                        else tickB <= tickB + 1;
                                
              default : begin
                           tickB <= 0;
                           stateB <= idle;
                        end
        endcase                   
    end    
                          
endmodule
