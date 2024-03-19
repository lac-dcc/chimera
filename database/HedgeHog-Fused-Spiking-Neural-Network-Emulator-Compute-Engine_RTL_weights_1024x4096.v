//weights_1024x4096.v     1024bits (128 bytes) wide by 4096 deep
// read-modify-write RAM only--meaning it must be read before written
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

module weights_1024x4096(
    CLK,
    wren,
    wraddrs,
    wrdata,
    rden,
    rdaddrs,
    rddata,
    weightsOut
    );
    
input CLK;
input wren;
input [17:0] wraddrs;   //writes must be on 16-bit boundaries
input [15:0] wrdata;
input rden;
input [17:0] rdaddrs;
output [15:0] rddata;
output [1023:0] weightsOut;

reg [5:0] rdWordSel_q1;
reg [15:0] rddata;

wire [5:0] rdWordSel;
wire [1023:0] weightsOut;

wire ram0wren;
wire ram1wren;
wire ram2wren;
wire ram3wren;
wire ram4wren;
wire ram5wren;
wire ram6wren;
wire ram7wren;
wire ram8wren;
wire ram9wren;
wire ram10wren;
wire ram11wren;
wire ram12wren;
wire ram13wren;
wire ram14wren;
wire ram15wren;

assign rdWordSel = rdaddrs[5:0];

assign ram0wren  = wren && wraddrs[5:2]==4'b0000;
assign ram1wren  = wren && wraddrs[5:2]==4'b0001;
assign ram2wren  = wren && wraddrs[5:2]==4'b0010;
assign ram3wren  = wren && wraddrs[5:2]==4'b0011;
assign ram4wren  = wren && wraddrs[5:2]==4'b0100;
assign ram5wren  = wren && wraddrs[5:2]==4'b0101;
assign ram6wren  = wren && wraddrs[5:2]==4'b0110;
assign ram7wren  = wren && wraddrs[5:2]==4'b0111;
assign ram8wren  = wren && wraddrs[5:2]==4'b1000;
assign ram9wren  = wren && wraddrs[5:2]==4'b1001;
assign ram10wren = wren && wraddrs[5:2]==4'b1010;
assign ram11wren = wren && wraddrs[5:2]==4'b1011;
assign ram12wren = wren && wraddrs[5:2]==4'b1100;
assign ram13wren = wren && wraddrs[5:2]==4'b1101;
assign ram14wren = wren && wraddrs[5:2]==4'b1110;
assign ram15wren = wren && wraddrs[5:2]==4'b1111;

UltraTDP64x4096_16 ram0(
    .CLK     (CLK             ),
    .wren    (ram0wren        ),
    .wraddrs ({wraddrs[17:6], wraddrs[1:0]}),
    .wrdata  (wrdata          ),
    .rden    (rden            ),
    .rdaddrs (rdaddrs[17:6]   ),
    .rddata64(weightsOut[63:0])
    );

UltraTDP64x4096_16 ram1(
    .CLK     (CLK             ),
    .wren    (ram1wren        ),
    .wraddrs ({wraddrs[17:6], wraddrs[1:0]}),
    .wrdata  (wrdata          ),
    .rden    (rden            ),
    .rdaddrs (rdaddrs[17:6]   ),
    .rddata64(weightsOut[127:64])
    );

UltraTDP64x4096_16 ram2(
    .CLK     (CLK             ),
    .wren    (ram2wren        ),
    .wraddrs ({wraddrs[17:6], wraddrs[1:0]}),
    .wrdata  (wrdata          ),
    .rden    (rden            ),
    .rdaddrs (rdaddrs[17:6]   ),
    .rddata64(weightsOut[191:128])
    );

UltraTDP64x4096_16 ram3(
    .CLK     (CLK             ),
    .wren    (ram3wren        ),
    .wraddrs ({wraddrs[17:6], wraddrs[1:0]}),
    .wrdata  (wrdata          ),
    .rden    (rden            ),
    .rdaddrs (rdaddrs[17:6]   ),
    .rddata64(weightsOut[255:192])
    );

UltraTDP64x4096_16 ram4(
    .CLK     (CLK             ),
    .wren    (ram4wren        ),
    .wraddrs ({wraddrs[17:6], wraddrs[1:0]}),
    .wrdata  (wrdata          ),
    .rden    (rden            ),
    .rdaddrs (rdaddrs[17:6]   ),
    .rddata64(weightsOut[319:256])
    );

UltraTDP64x4096_16 ram5(
    .CLK     (CLK             ),
    .wren    (ram5wren        ),
    .wraddrs ({wraddrs[17:6], wraddrs[1:0]}),
    .wrdata  (wrdata          ),
    .rden    (rden            ),
    .rdaddrs (rdaddrs[17:6]   ),
    .rddata64(weightsOut[383:320])
    );

UltraTDP64x4096_16 ram6(
    .CLK     (CLK             ),
    .wren    (ram6wren        ),
    .wraddrs ({wraddrs[17:6], wraddrs[1:0]}),
    .wrdata  (wrdata          ),
    .rden    (rden            ),
    .rdaddrs (rdaddrs[17:6]   ),
    .rddata64(weightsOut[447:384])
    );

UltraTDP64x4096_16 ram7(
    .CLK     (CLK             ),
    .wren    (ram7wren        ),
    .wraddrs ({wraddrs[17:6], wraddrs[1:0]}),
    .wrdata  (wrdata          ),
    .rden    (rden            ),
    .rdaddrs (rdaddrs[17:6]   ),
    .rddata64(weightsOut[511:448])
    );

UltraTDP64x4096_16 ram8(
    .CLK     (CLK             ),
    .wren    (ram8wren        ),
    .wraddrs ({wraddrs[17:6], wraddrs[1:0]}),
    .wrdata  (wrdata          ),
    .rden    (rden            ),
    .rdaddrs (rdaddrs[17:6]   ),
    .rddata64(weightsOut[575:512])
    );

UltraTDP64x4096_16 ram9(
    .CLK     (CLK             ),
    .wren    (ram9wren        ),
    .wraddrs ({wraddrs[17:6], wraddrs[1:0]}),
    .wrdata  (wrdata          ),
    .rden    (rden            ),
    .rdaddrs (rdaddrs[17:6]   ),
    .rddata64(weightsOut[639:576])
    );

UltraTDP64x4096_16 ram10(
    .CLK     (CLK             ),
    .wren    (ram10wren       ),
    .wraddrs ({wraddrs[17:6], wraddrs[1:0]}),
    .wrdata  (wrdata          ),
    .rden    (rden            ),
    .rdaddrs (rdaddrs[17:6]   ),
    .rddata64(weightsOut[703:640])
    );

UltraTDP64x4096_16 ram11(
    .CLK     (CLK             ),
    .wren    (ram11wren       ),
    .wraddrs ({wraddrs[17:6], wraddrs[1:0]}),
    .wrdata  (wrdata          ),
    .rden    (rden            ),
    .rdaddrs (rdaddrs[17:6]   ),
    .rddata64(weightsOut[767:704])
    );

UltraTDP64x4096_16 ram12(
    .CLK     (CLK             ),
    .wren    (ram12wren       ),
    .wraddrs ({wraddrs[17:6], wraddrs[1:0]}),
    .wrdata  (wrdata          ),
    .rden    (rden            ),
    .rdaddrs (rdaddrs[17:6]   ),
    .rddata64(weightsOut[831:768])
    );

UltraTDP64x4096_16 ram13(
    .CLK     (CLK             ),
    .wren    (ram13wren       ),
    .wraddrs ({wraddrs[17:6], wraddrs[1:0]}),
    .wrdata  (wrdata          ),
    .rden    (rden            ),
    .rdaddrs (rdaddrs[17:6]   ),
    .rddata64(weightsOut[895:832])
    );

UltraTDP64x4096_16 ram14(
    .CLK     (CLK             ),
    .wren    (ram14wren       ),
    .wraddrs ({wraddrs[17:6], wraddrs[1:0]}),
    .wrdata  (wrdata          ),
    .rden    (rden            ),
    .rdaddrs (rdaddrs[17:6]   ),
    .rddata64(weightsOut[959:896])
    );

UltraTDP64x4096_16 ram15(
    .CLK     (CLK             ),
    .wren    (ram15wren       ),
    .wraddrs ({wraddrs[17:6], wraddrs[1:0]}),
    .wrdata  (wrdata          ),
    .rden    (rden            ),
    .rdaddrs (rdaddrs[17:6]   ),
    .rddata64(weightsOut[1023:960])
    );



always @(*)
    (* parallel *) case(rdWordSel_q1)
        6'd0  : rddata = weightsOut[ 15:0  ];
        6'd1  : rddata = weightsOut[ 31:16 ];
        6'd2  : rddata = weightsOut[ 47:32 ];
        6'd3  : rddata = weightsOut[ 63:48 ];
        6'd4  : rddata = weightsOut[ 79:64 ];
        6'd5  : rddata = weightsOut[ 95:80 ];
        6'd6  : rddata = weightsOut[111:96 ];
        6'd7  : rddata = weightsOut[127:112];
        6'd8  : rddata = weightsOut[143:128];
        6'd9  : rddata = weightsOut[159:144];
        6'd10 : rddata = weightsOut[175:160];
        6'd11 : rddata = weightsOut[191:176];
        6'd12 : rddata = weightsOut[207:192];
        6'd13 : rddata = weightsOut[223:208];
        6'd14 : rddata = weightsOut[239:224];
        6'd15 : rddata = weightsOut[255:240];
        6'd16 : rddata = weightsOut[271:256];
        6'd17 : rddata = weightsOut[287:272];
        6'd18 : rddata = weightsOut[303:288];
        6'd19 : rddata = weightsOut[319:304];
        6'd20 : rddata = weightsOut[335:320];
        6'd21 : rddata = weightsOut[351:336];
        6'd22 : rddata = weightsOut[367:352];
        6'd23 : rddata = weightsOut[383:368];
        6'd24 : rddata = weightsOut[399:384];
        6'd25 : rddata = weightsOut[415:400];
        6'd26 : rddata = weightsOut[431:416];
        6'd27 : rddata = weightsOut[447:432];
        6'd28 : rddata = weightsOut[463:448];
        6'd29 : rddata = weightsOut[479:464];
        6'd30 : rddata = weightsOut[495:480];
        6'd31 : rddata = weightsOut[511:496];
        6'd32 : rddata = weightsOut[527:512];
        6'd33 : rddata = weightsOut[543:528];
        6'd34 : rddata = weightsOut[559:544];
        6'd35 : rddata = weightsOut[575:560];
        6'd36 : rddata = weightsOut[591:576];
        6'd37 : rddata = weightsOut[607:592];
        6'd38 : rddata = weightsOut[623:608];
        6'd39 : rddata = weightsOut[639:624];
        6'd40 : rddata = weightsOut[655:640];
        6'd41 : rddata = weightsOut[671:656];
        6'd42 : rddata = weightsOut[687:672];
        6'd43 : rddata = weightsOut[703:688];
        6'd44 : rddata = weightsOut[719:704];
        6'd45 : rddata = weightsOut[735:720];
        6'd46 : rddata = weightsOut[751:736];
        6'd47 : rddata = weightsOut[767:752];
        6'd48 : rddata = weightsOut[783:768];
        6'd49 : rddata = weightsOut[799:784];
        6'd50 : rddata = weightsOut[815:800];
        6'd51 : rddata = weightsOut[831:816];
        6'd52 : rddata = weightsOut[847:832];
        6'd53 : rddata = weightsOut[863:848];
        6'd54 : rddata = weightsOut[879:864];
        6'd55 : rddata = weightsOut[895:880];
        6'd56 : rddata = weightsOut[911:896];
        6'd57 : rddata = weightsOut[927:912];
        6'd58 : rddata = weightsOut[943:928];
        6'd59 : rddata = weightsOut[959:944];
        6'd60 : rddata = weightsOut[975:960];
        6'd61 : rddata = weightsOut[991:976];
        6'd62 : rddata = weightsOut[1007:992 ];
        6'd63 : rddata = weightsOut[1023:1008];
    endcase
    
always @(posedge CLK) rdWordSel_q1 <= rdWordSel;

endmodule

   
