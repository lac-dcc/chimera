//binToDecH8Engine.v
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

module binToDecH8Engine(
    CLK           ,
    RESET         ,
    RM            ,
    wren          ,
    wrdata        ,
    fractionOnly  ,
    intDigit8, 
    intDigit7, 
    intDigit6, 
    intDigit5, 
    intDigit4, 
    intDigit3, 
    intDigit2, 
    intDigit1, 
    intDigit0, 
    fractDigit7,
    fractDigit6,
    fractDigit5,
    fractDigit4,
    fractDigit3,
    fractDigit2,
    fractDigit1,
    fractDigit0,    
    baseExp       
);

input CLK;
input RESET;
input [1:0] RM;
input wren;
input [15:0] wrdata;
output fractionOnly;
output [3:0] intDigit8; 
output [3:0] intDigit7; 
output [3:0] intDigit6; 
output [3:0] intDigit5; 
output [3:0] intDigit4; 
output [3:0] intDigit3; 
output [3:0] intDigit2; 
output [3:0] intDigit1; 
output [3:0] intDigit0; 
output [3:0] fractDigit7;
output [3:0] fractDigit6;
output [3:0] fractDigit5;
output [3:0] fractDigit4;
output [3:0] fractDigit3;
output [3:0] fractDigit2;
output [3:0] fractDigit1;
output [3:0] fractDigit0;

output [4:0] baseExp;

reg [6:0] exp_del_1,
          exp_del_2,
          exp_del_3,
          exp_del_4,
          exp_del_5;

reg        wren_del_1,
           wren_del_2,
           wren_del_3,
           wren_del_4,
           wren_del_5;
           
reg fractionOnly_del_2,
    fractionOnly_del_3,
    fractionOnly_del_4,
    fractionOnly_del_5;           

wire [3:0] intDigit7;
wire [3:0] intDigit6;
wire [3:0] intDigit5;
wire [3:0] intDigit4;
wire [3:0] intDigit3;
wire [3:0] intDigit2;
wire [3:0] intDigit1;
wire [3:0] intDigit0;
wire [3:0] fractDigit7;  //possible carry here
wire [3:0] fractDigit6;
wire [3:0] fractDigit5;
wire [3:0] fractDigit4;
wire [3:0] fractDigit3;
wire [3:0] fractDigit2;
wire [3:0] fractDigit1;
wire [3:0] fractDigit0;

wire [3:0] fractDigit7o;  //possible carry here
wire [3:0] fractDigit6o;
wire [3:0] fractDigit5o;
wire [3:0] fractDigit4o;
wire [3:0] fractDigit3o;
wire [3:0] fractDigit2o;
wire [3:0] fractDigit1o;
wire [3:0] fractDigit0o;

assign fractDigit7 =  fractDigit7o;
assign fractDigit6 = |fractDigit7o ? fractDigit7o : fractDigit6o;
assign fractDigit5 = |fractDigit7o ? fractDigit6o : fractDigit5o;
assign fractDigit4 = |fractDigit7o ? fractDigit5o : fractDigit4o;
assign fractDigit3 = |fractDigit7o ? fractDigit4o : fractDigit3o;
assign fractDigit2 = |fractDigit7o ? fractDigit3o : fractDigit2o;
assign fractDigit1 = |fractDigit7o ? fractDigit2o : fractDigit1o;
assign fractDigit0 = |fractDigit7o ? fractDigit1o : fractDigit0o;

wire fractionOnly  ;
wire [4:0] baseExp ;
wire [4:0] preBaseExp;

wire [26:0] bcdIntOut;
wire [23:0] bcdFractOut;
wire [8:0] fractMask;

wire fractionOnly_del_1;
wire expMinus;

assign baseExp = |fractDigit7o ? preBaseExp - 1 : preBaseExp;

assign expMinus = wrdata[14:8] < 63;

assign fractionOnly = fractionOnly_del_5;                              

// 1.0 e+18 = 1R
// 1.0 e+17 = 1Q
// 1.0 e+16 = 1P
// 1.0 e+15 = 1O
// 1.0 e+14 = 1N
// 1.0 e+13 = 1M
// 1.0 e+12 = 1L
// 1.0 e+11 = 1K
// 1.0 e+10 = 1J
// 1.0 e+9  = 1I
// 1.0 e+8  = 1H
// 1.0 e+7  = 1G
// 1.0 e+6  = 1F
// 1.0 e+5  = 1E
// 1.0 e+4  = 1D
// 1.0 e+3  = 1C
// 1.0 e+2  = 1B
// 1.0 e+1  = 1A

// 1.0 e-1  = 1a
// 1.0 e-2  = 1b
// 1.0 e-3  = 1c
// 1.0 e-4  = 1d
// 1.0 e-5  = 1e
// 1.0 e-6  = 1f
// 1.0 e-7  = 1g
// 1.0 e-8  = 1h
// 1.0 e-9  = 1i
// 1.0 e-10 = 1j
// 1.0 e-11 = 1k
// 1.0 e-12 = 1l
// 1.0 e-13 = 1m
// 1.0 e-14 = 1n
// 1.0 e-15 = 1o
// 1.0 e-16 = 1p
// 1.0 e-17 = 1q
// 1.0 e-18 = 1r
                


H8IntegerPart h8int(      //this is 2 clocks deep
    .CLK          (CLK            ),  
    .RESET        (RESET          ),
    .RM           (RM             ),
    .wren         (wren           ), 
    .wrdata       (wrdata         ),  
    .bcdIntegerOut(bcdIntOut      ),  
    .fractMask    (fractMask      ),
    .fractionOnly (fractionOnly_del_1 )
    );

binToBCD27 bcdInt(     //this is 3 clocks deep
    .CLK       (CLK       ),
    .RESET     (RESET     ),
    .binIn     (bcdIntOut ),   
    .decDigit8 (intDigit8 ),          
    .decDigit7 (intDigit7 ),          
    .decDigit6 (intDigit6 ),
    .decDigit5 (intDigit5 ),
    .decDigit4 (intDigit4 ),
    .decDigit3 (intDigit3 ),
    .decDigit2 (intDigit2 ),
    .decDigit1 (intDigit1 ),
    .decDigit0 (intDigit0 )
    );

H8FractPart h8fract(      
    .CLK          (CLK          ),
    .RESET        (RESET        ),
    .RM           (RM           ),
    .wren         (wren         ),
    .wrdata       (wrdata       ),
    .bcdFractOut  (bcdFractOut  ),
    .fractMask    (fractMask    )
    );     
                          
binToBCD27 bcdFract(       
    .CLK       (CLK         ),
    .RESET     (RESET       ),
    .binIn     ({3'b0, bcdFractOut}),
    .decDigit8 (),
    .decDigit7 (fractDigit7o),
    .decDigit6 (fractDigit6o),
    .decDigit5 (fractDigit5o),
    .decDigit4 (fractDigit4o),
    .decDigit3 (fractDigit3o),
    .decDigit2 (fractDigit2o),
    .decDigit1 (fractDigit1o),
    .decDigit0 (fractDigit0o)
    );
    
H8_baseExpROM ExpROM(
    .CLK    (CLK    ),
    .RESET  (RESET  ),
    .rden   (wren_del_4),
    .rdaddrs(exp_del_4),
    .baseExp(preBaseExp)   //decimal exponent out
    );    

always @(posedge CLK) begin
    if (RESET) begin
       exp_del_1  <= 0;
       exp_del_2  <= 0;
       exp_del_3  <= 0;
       exp_del_4  <= 0;
       exp_del_5  <= 0; 
    end      
   else begin
       exp_del_1  <= wrdata[14:8];
       exp_del_2  <= exp_del_1;
       exp_del_3  <= exp_del_2 ;
       exp_del_4  <= exp_del_3 ;
       exp_del_5  <= exp_del_4 ; 
   end
end 

always @(posedge CLK) begin
    if (RESET) begin
       wren_del_1  <= 0;
       wren_del_2  <= 0;
       wren_del_3  <= 0;
       wren_del_4  <= 0;
       wren_del_5  <= 0; 
    end      
   else begin
       wren_del_1  <= wren;
       wren_del_2  <= wren_del_1;
       wren_del_3  <= wren_del_2 ;
       wren_del_4  <= wren_del_3 ;
       wren_del_5  <= wren_del_4 ; 
   end
end 

always @(posedge CLK) begin
    if (RESET) begin
       fractionOnly_del_2  <= 0;
       fractionOnly_del_3  <= 0;
       fractionOnly_del_4  <= 0;
       fractionOnly_del_5  <= 0; 
    end      
   else begin
       fractionOnly_del_2  <= fractionOnly_del_1;
       fractionOnly_del_3  <= fractionOnly_del_2 ;
       fractionOnly_del_4  <= fractionOnly_del_3 ;
       fractionOnly_del_5  <= fractionOnly_del_4 ; 
   end
end 

endmodule
