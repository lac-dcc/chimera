//binToDecCharBuf.v
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
 
module  binToDecCharBuf (
    CLK,
    RESET,
    RM,
    wren,
    wraddrs,
    wrdata,
    rden,
    rdaddrs,
    rddata
    );    

input CLK;
input RESET;
input [1:0] RM; //round mode
input wren;
input [13:0] wraddrs;
input [15:0] wrdata;
input rden;
input [17:0] rdaddrs;
output [63:0] rddata;

parameter NEAREST = 2'b00;
parameter POSINF  = 2'b01;
parameter NEGINF  = 2'b10;
parameter ZERO    = 2'b11;

//reg    [15:0] RAMA[262143:0];
reg    [63:0] RAMA[16383:0];

reg [63:0] rddata;


reg wren_del_1 , 
    wren_del_2 , 
    wren_del_3 , 
    wren_del_4 , 
    wren_del_5 , 
    wren_del_6; 

reg [17:0] wraddrs_del_1,    
    wraddrs_del_2 , 
    wraddrs_del_3 , 
    wraddrs_del_4 , 
    wraddrs_del_5 , 
    wraddrs_del_6 ; 


wire [63:0] ascOut; 


binToDecCharH8 binToDecChar(
    .RESET (RESET ),
    .CLK   (CLK   ),
    .RM    (RM),
    .wren  (wren  ),
    .wrdata(wrdata[15:0]),
    .ascOut(ascOut)
    );     

always @(posedge CLK) begin
    if (rden) rddata <=  RAMA[rdaddrs];
end

always @(posedge CLK) begin
    if (wren_del_6) RAMA[wraddrs_del_6] <= ascOut;
end 
  
always @(posedge CLK) begin
    if (RESET) begin
        wren_del_1  <= 1'b0;
        wren_del_2  <= 1'b0;
        wren_del_3  <= 1'b0;
        wren_del_4  <= 1'b0;
        wren_del_5  <= 1'b0;
        wren_del_6  <= 1'b0;
    end    
    else begin
        wren_del_1  <= wren;
        wren_del_2  <= wren_del_1 ;
        wren_del_3  <= wren_del_2 ;
        wren_del_4  <= wren_del_3 ;
        wren_del_5  <= wren_del_4 ;
        wren_del_6  <= wren_del_5 ;
    end                    
end

always @(posedge CLK) begin
    if (RESET) begin
        wraddrs_del_1  <= 0;
        wraddrs_del_2  <= 0;
        wraddrs_del_3  <= 0;
        wraddrs_del_4  <= 0;
        wraddrs_del_5  <= 0;
        wraddrs_del_6  <= 0;
    end    
    else begin
        wraddrs_del_1  <= wraddrs;
        wraddrs_del_2  <= wraddrs_del_1 ;
        wraddrs_del_3  <= wraddrs_del_2 ;
        wraddrs_del_4  <= wraddrs_del_3 ;
        wraddrs_del_5  <= wraddrs_del_4 ;
        wraddrs_del_6  <= wraddrs_del_5 ;
    end                    
end

endmodule
