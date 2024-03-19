// H8FractPart.v
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

module H8FractPart (
    CLK          , 
    RESET        , 
    RM           ,
    wren         ,  
    wrdata       ,  
    bcdFractOut  ,
    fractMask
    );

input CLK;
input RESET;
input [1:0] RM;
input wren;
input [15:0]  wrdata;
output [23:0] bcdFractOut;
input  [8:0] fractMask;

parameter NEAREST = 2'b00;
parameter POSINF  = 2'b01;
parameter NEGINF  = 2'b10;
parameter ZERO    = 2'b11;

reg [23:0] fractFinalq;
reg roundit_q;
reg [2:0] chafCarries;
reg [7:0] chafFinalq;

wire [23:0] fractD8_fract7;
wire [23:0] fractD6_fract5;
wire [23:0] fractD4_fract3;
wire [23:0] fractD2_fract1;
wire [23:0] fractD0;  

wire [23:0] fractD8_fract7__fractD6_fract5;
wire [23:0] fractD4_fract3__fractD2_fract1__fractD0;

wire [23:0] bcdFractOut;
              
wire [9:0] chafD7_chafD6; 
wire [9:0] chafD5_chafD4; 
wire [9:0] chafD3_chafD2; 
wire [9:0] chafD1_chafD0; 

wire [9:0] chafD7_chafD6__chafD5_chafD4;  
wire [9:0] chafD3_chafD2__chafD1_chafD0;

wire [10:0] chafFinal;

wire [2:0] GRS;
assign GRS = {chafFinalq[7:6], |chafFinalq[5:0]};

reg roundit;
always @(*)
        case(RM)
            NEAREST : if (((GRS==3'b100) && fractFinalq[0]) || (GRS[2] && |GRS[1:0])) roundit = 1'b1;    //when GRS = (3'b100 && lsb) OR when GRS = 101 or 110 or 111 then round it
                      else roundit = 1'b0;
            POSINF  : if (~fractFinalq[15] && |GRS) roundit = 1'b1;
                      else roundit = 1'b0;
            NEGINF  : if (fractFinalq[15] && |GRS) roundit = 1'b1;
                      else roundit = 1'b0;
            ZERO    : roundit = 1'b0;
        endcase


wire [6:0] biasedExp;
wire [8:0] mant;
wire zeroIn;

wire [23:0] FractWeight;

assign biasedExp = wrdata[14:8];
assign mant = fractMask;
assign zeroIn = ~|wrdata[14:0];

ROMweightsFract_H8 fractROM(
    .CLK    (CLK  ),
    .RESET  (RESET),
    .rden   (wren ),
    .rdaddrs(biasedExp[6:0]),
    .mantissa  (wrdata[7:0]),
    .FractWeight (FractWeight),
    .zeroIn (zeroIn)
    );    
        
assign fractD8_fract7 = ((mant[8] ?         FractWeight[23: 0]  : 0) + (mant[7] ? { 1'b0, FractWeight[23: 1]} : 0));  
assign fractD6_fract5 = ((mant[6] ? { 2'b0, FractWeight[23: 2]} : 0) + (mant[5] ? { 3'b0, FractWeight[23: 3]} : 0));
assign fractD4_fract3 = ((mant[4] ? { 4'b0, FractWeight[23: 4]} : 0) + (mant[3] ? { 5'b0, FractWeight[23: 5]} : 0));
assign fractD2_fract1 = ((mant[2] ? { 6'b0, FractWeight[23: 6]} : 0) + (mant[1] ? { 7'b0, FractWeight[23: 7]} : 0));
assign fractD0        =  (mant[0] ? { 8'b0, FractWeight[23: 8]} : 0);                                              

assign fractD8_fract7__fractD6_fract5 = fractD8_fract7 + fractD6_fract5;
assign fractD4_fract3__fractD2_fract1__fractD0 = fractD4_fract3 + fractD2_fract1 + fractD0;

assign chafD7_chafD6 = (mant[ 7] ? {FractWeight[0  ],  7'b0} : 0) + (mant[ 6] ? {FractWeight[1:0],  6'b0} : 0);  
assign chafD5_chafD4 = (mant[ 5] ? {FractWeight[2:0],  5'b0} : 0) + (mant[ 4] ? {FractWeight[3:0],  4'b0} : 0);
assign chafD3_chafD2 = (mant[ 3] ? {FractWeight[4:0],  3'b0} : 0) + (mant[ 2] ? {FractWeight[5:0],  2'b0} : 0);  
assign chafD1_chafD0 = (mant[ 1] ? {FractWeight[6:0],  1'b0} : 0) + (mant[ 0] ? {FractWeight[7:0]} : 0) ;
        
assign chafD7_chafD6__chafD5_chafD4 = chafD7_chafD6 + chafD5_chafD4;
assign chafD3_chafD2__chafD1_chafD0 = chafD3_chafD2 + chafD1_chafD0;
        
assign chafFinal = chafD7_chafD6__chafD5_chafD4 + chafD3_chafD2__chafD1_chafD0;
    
always @(posedge CLK) fractFinalq <= fractD8_fract7__fractD6_fract5 + fractD4_fract3__fractD2_fract1__fractD0;

assign bcdFractOut = fractFinalq + chafCarries + roundit_q;

always @(posedge CLK) begin
    if (RESET) begin
        roundit_q   <= 0;
        chafCarries <= 0;
        chafFinalq  <= 0;
    end
    else begin
        roundit_q <= roundit;
        chafCarries <= chafFinal[10:8];
        chafFinalq <= chafFinal[7:0];
    end
end
        
endmodule






