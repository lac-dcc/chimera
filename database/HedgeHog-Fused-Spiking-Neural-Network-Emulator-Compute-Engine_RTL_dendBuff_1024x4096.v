//dendBuff_1024x4096.v     1024bits (128 bytes) wide by 4096 deep
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

module dendBuff_1024x4096(
    CLK,
    wren,
    wraddrs,
    wrdata,
    rden,
    rdaddrs,
    rddata,
    dendLevels
    );
    
input CLK;
input wren;
input [11:0] wraddrs;
input [1023:0] wrdata;
input rden;
input [17:0] rdaddrs;
output [15:0] rddata;
output [1023:0] dendLevels;

reg [5:0] wordSel_q1;

reg [15:0] rddata;

wire [5:0] wordSel;
wire [11:0] groupSel;
wire [1023:0] dendLevels;
wire [1023:0] rddata_q1;

assign wordSel = rdaddrs[5:0];
assign groupSel = rdaddrs[17:6];
assign dendLevels = rddata_q1;

ultraRAMx72_TDP #(.ADDRS_WIDTH(12)) 
    ram0(  //"true" dual port RAM built from ultraRAM
    .CLK     (CLK       ),
    .wrenA   (wren      ),
    .wrenB   (1'b0      ),
    .wraddrsA(wraddrs   ),
    .wraddrsB(12'b0     ),
    .wrdataA (wrdata[63:0]),
    .wrdataB (64'b0     ),
    .rdenA   (1'b0      ),
    .rdenB   (rden      ),
    .rdaddrsA(12'b0     ),
    .rdaddrsB(groupSel  ),
    .rddataA (          ),
    .rddataB (rddata_q1[63:0])
    );        

ultraRAMx72_TDP #(.ADDRS_WIDTH(12)) 
    ram1(  //"true" dual port RAM built from ultraRAM
    .CLK     (CLK       ),
    .wrenA   (wren      ),
    .wrenB   (1'b0      ),
    .wraddrsA(wraddrs   ),
    .wraddrsB(12'b0     ),
    .wrdataA (wrdata[127:64]),
    .wrdataB (64'b0     ),
    .rdenA   (1'b0      ),
    .rdenB   (rden      ),
    .rdaddrsA(12'b0     ),
    .rdaddrsB(groupSel  ),
    .rddataA (          ),
    .rddataB (rddata_q1[127:64])
    );        

ultraRAMx72_TDP #(.ADDRS_WIDTH(12)) 
    ram2(  //"true" dual port RAM built from ultraRAM
    .CLK     (CLK       ),
    .wrenA   (wren      ),
    .wrenB   (1'b0      ),
    .wraddrsA(wraddrs   ),
    .wraddrsB(12'b0     ),
    .wrdataA (wrdata[191:128]),
    .wrdataB (64'b0     ),
    .rdenA   (1'b0      ),
    .rdenB   (rden      ),
    .rdaddrsA(12'b0     ),
    .rdaddrsB(groupSel  ),
    .rddataA (          ),
    .rddataB (rddata_q1[191:128])
    );        

ultraRAMx72_TDP #(.ADDRS_WIDTH(12))
    ram3(  //"true" dual port RAM built from ultraRAM
    .CLK     (CLK       ),
    .wrenA   (wren      ),
    .wrenB   (1'b0      ),
    .wraddrsA(wraddrs   ),
    .wraddrsB(12'b0     ),
    .wrdataA (wrdata[255:192]),
    .wrdataB (64'b0     ),
    .rdenA   (1'b0      ),
    .rdenB   (rden      ),
    .rdaddrsA(12'b0     ),
    .rdaddrsB(groupSel  ),
    .rddataA (          ),
    .rddataB (rddata_q1[255:192])
    );        

ultraRAMx72_TDP #(.ADDRS_WIDTH(12))
    ram4(  //"true" dual port RAM built from ultraRAM
    .CLK     (CLK       ),
    .wrenA   (wren      ),
    .wrenB   (1'b0      ),
    .wraddrsA(wraddrs   ),
    .wraddrsB(12'b0     ),
    .wrdataA (wrdata[319:256]),
    .wrdataB (64'b0     ),
    .rdenA   (1'b0      ),
    .rdenB   (rden      ),
    .rdaddrsA(12'b0     ),
    .rdaddrsB(groupSel  ),
    .rddataA (          ),
    .rddataB (rddata_q1[319:256])
    );        

ultraRAMx72_TDP #(.ADDRS_WIDTH(12))
    ram5(  //"true" dual port RAM built from ultraRAM
    .CLK     (CLK       ),
    .wrenA   (wren      ),
    .wrenB   (1'b0      ),
    .wraddrsA(wraddrs   ),
    .wraddrsB(12'b0     ),
    .wrdataA (wrdata[383:320]),
    .wrdataB (64'b0     ),
    .rdenA   (1'b0      ),
    .rdenB   (rden      ),
    .rdaddrsA(12'b0     ),
    .rdaddrsB(groupSel  ),
    .rddataA (          ),
    .rddataB (rddata_q1[383:320])
    );        

ultraRAMx72_TDP #(.ADDRS_WIDTH(12))
    ram6(  //"true" dual port RAM built from ultraRAM
    .CLK     (CLK       ),
    .wrenA   (wren      ),
    .wrenB   (1'b0      ),
    .wraddrsA(wraddrs),
    .wraddrsB(12'b0     ),
    .wrdataA (wrdata[447:384]),
    .wrdataB (64'b0     ),
    .rdenA   (1'b0      ),
    .rdenB   (rden      ),
    .rdaddrsA(12'b0     ),
    .rdaddrsB(groupSel  ),
    .rddataA (          ),
    .rddataB (rddata_q1[447:384])
    );        

ultraRAMx72_TDP #(.ADDRS_WIDTH(12))
    ram7(  //"true" dual port RAM built from ultraRAM
    .CLK     (CLK       ),
    .wrenA   (wren      ),
    .wrenB   (1'b0      ),
    .wraddrsA(wraddrs),
    .wraddrsB(12'b0     ),
    .wrdataA (wrdata[511:448]),
    .wrdataB (64'b0     ),
    .rdenA   (1'b0      ),
    .rdenB   (rden      ),
    .rdaddrsA(12'b0     ),
    .rdaddrsB(groupSel  ),
    .rddataA (          ),
    .rddataB (rddata_q1[511:448])
    );        

ultraRAMx72_TDP #(.ADDRS_WIDTH(12))
    ram8(  //"true" dual port RAM built from ultraRAM
    .CLK     (CLK       ),
    .wrenA   (wren      ),
    .wrenB   (1'b0      ),
    .wraddrsA(wraddrs),
    .wraddrsB(12'b0     ),
    .wrdataA (wrdata[575:512]),
    .wrdataB (64'b0     ),
    .rdenA   (1'b0      ),
    .rdenB   (rden      ),
    .rdaddrsA(12'b0     ),
    .rdaddrsB(groupSel  ),
    .rddataA (          ),
    .rddataB (rddata_q1[575:512])
    );        

ultraRAMx72_TDP #(.ADDRS_WIDTH(12))
    ram9(  //"true" dual port RAM built from ultraRAM
    .CLK     (CLK       ),
    .wrenA   (wren      ),
    .wrenB   (1'b0      ),
    .wraddrsA(wraddrs),
    .wraddrsB(12'b0     ),
    .wrdataA (wrdata[639:576]),
    .wrdataB (64'b0     ),
    .rdenA   (1'b0      ),
    .rdenB   (rden      ),
    .rdaddrsA(12'b0     ),
    .rdaddrsB(groupSel  ),
    .rddataA (          ),
    .rddataB (rddata_q1[639:576])
    );        

ultraRAMx72_TDP #(.ADDRS_WIDTH(12))
    ramA(  //"true" dual port RAM built from ultraRAM
    .CLK     (CLK       ),
    .wrenA   (wren      ),
    .wrenB   (1'b0      ),
    .wraddrsA(wraddrs),
    .wraddrsB(12'b0     ),
    .wrdataA (wrdata[703:640]),
    .wrdataB (64'b0     ),
    .rdenA   (1'b0      ),
    .rdenB   (rden      ),
    .rdaddrsA(12'b0     ),
    .rdaddrsB(groupSel  ),
    .rddataA (          ),
    .rddataB (rddata_q1[703:640])
    );        

ultraRAMx72_TDP #(.ADDRS_WIDTH(12))
    ramB(  //"true" dual port RAM built from ultraRAM
    .CLK     (CLK       ),
    .wrenA   (wren      ),
    .wrenB   (1'b0      ),
    .wraddrsA(wraddrs),
    .wraddrsB(12'b0     ),
    .wrdataA (wrdata[767:704]),
    .wrdataB (64'b0     ),
    .rdenA   (1'b0      ),
    .rdenB   (rden      ),
    .rdaddrsA(12'b0     ),
    .rdaddrsB(groupSel  ),
    .rddataA (          ),
    .rddataB (rddata_q1[767:704])
    );        

ultraRAMx72_TDP #(.ADDRS_WIDTH(12))
    ramC(  //"true" dual port RAM built from ultraRAM
    .CLK     (CLK       ),
    .wrenA   (wren      ),
    .wrenB   (1'b0      ),
    .wraddrsA(wraddrs),
    .wraddrsB(12'b0     ),
    .wrdataA (wrdata[831:768]),
    .wrdataB (64'b0     ),
    .rdenA   (1'b0      ),
    .rdenB   (rden      ),
    .rdaddrsA(12'b0     ),
    .rdaddrsB(groupSel  ),
    .rddataA (          ),
    .rddataB (rddata_q1[831:768])
    );        

ultraRAMx72_TDP #(.ADDRS_WIDTH(12))
    ramD(  //"true" dual port RAM built from ultraRAM
    .CLK     (CLK       ),
    .wrenA   (wren      ),
    .wrenB   (1'b0      ),
    .wraddrsA(wraddrs),
    .wraddrsB(12'b0     ),
    .wrdataA (wrdata[895:832]),
    .wrdataB (64'b0     ),
    .rdenA   (1'b0      ),
    .rdenB   (rden      ),
    .rdaddrsA(12'b0     ),
    .rdaddrsB(groupSel  ),
    .rddataA (          ),
    .rddataB (rddata_q1[895:832])
    );        

ultraRAMx72_TDP #(.ADDRS_WIDTH(12))
    ramE(  //"true" dual port RAM built from ultraRAM
    .CLK     (CLK       ),
    .wrenA   (wren      ),
    .wrenB   (1'b0      ),
    .wraddrsA(wraddrs),
    .wraddrsB(12'b0     ),
    .wrdataA (wrdata[959:896]),
    .wrdataB (64'b0     ),
    .rdenA   (1'b0      ),
    .rdenB   (rden      ),
    .rdaddrsA(12'b0     ),
    .rdaddrsB(groupSel  ),
    .rddataA (          ),
    .rddataB (rddata_q1[959:896])
    );        

ultraRAMx72_TDP #(.ADDRS_WIDTH(12))
    ramF(  //"true" dual port RAM built from ultraRAM
    .CLK     (CLK       ),
    .wrenA   (wren      ),
    .wrenB   (1'b0      ),
    .wraddrsA(wraddrs),
    .wraddrsB(12'b0     ),
    .wrdataA (wrdata[1023:960]),
    .wrdataB (64'b0     ),
    .rdenA   (1'b0      ),
    .rdenB   (rden      ),
    .rdaddrsA(12'b0     ),
    .rdaddrsB(groupSel  ),
    .rddataA (          ),
    .rddataB (rddata_q1[1023:960])
    );        

always @(*)
    (* parallel *) case(wordSel_q1)
        6'd0  : rddata = rddata_q1[15:0];
        6'd1  : rddata = rddata_q1[31:16];
        6'd2  : rddata = rddata_q1[47:32];
        6'd3  : rddata = rddata_q1[63:48];
        6'd4  : rddata = rddata_q1[79:64];
        6'd5  : rddata = rddata_q1[95:80];
        6'd6  : rddata = rddata_q1[111:96];
        6'd7  : rddata = rddata_q1[127:112];
        6'd8  : rddata = rddata_q1[143:128];
        6'd9  : rddata = rddata_q1[159:144];
        6'd10 : rddata = rddata_q1[175:160];
        6'd11 : rddata = rddata_q1[191:176];
        6'd12 : rddata = rddata_q1[207:192];
        6'd13 : rddata = rddata_q1[223:208];
        6'd14 : rddata = rddata_q1[239:224];
        6'd15 : rddata = rddata_q1[255:240];
        6'd16 : rddata = rddata_q1[271:256];
        6'd17 : rddata = rddata_q1[287:272];
        6'd18 : rddata = rddata_q1[303:288];
        6'd19 : rddata = rddata_q1[319:304];
        6'd20 : rddata = rddata_q1[335:320];
        6'd21 : rddata = rddata_q1[351:336];
        6'd22 : rddata = rddata_q1[367:352];
        6'd23 : rddata = rddata_q1[383:368];
        6'd24 : rddata = rddata_q1[399:384];
        6'd25 : rddata = rddata_q1[415:400];
        6'd26 : rddata = rddata_q1[431:416];
        6'd27 : rddata = rddata_q1[447:432];
        6'd28 : rddata = rddata_q1[463:448];
        6'd29 : rddata = rddata_q1[479:464];
        6'd30 : rddata = rddata_q1[495:480];
        6'd31 : rddata = rddata_q1[511:496];
        6'd32 : rddata = rddata_q1[527:512];
        6'd33 : rddata = rddata_q1[543:528];
        6'd34 : rddata = rddata_q1[559:544];
        6'd35 : rddata = rddata_q1[575:560];
        6'd36 : rddata = rddata_q1[591:576];
        6'd37 : rddata = rddata_q1[607:592];
        6'd38 : rddata = rddata_q1[623:608];
        6'd39 : rddata = rddata_q1[639:624];
        6'd40 : rddata = rddata_q1[655:640];
        6'd41 : rddata = rddata_q1[671:656];
        6'd42 : rddata = rddata_q1[687:672];
        6'd43 : rddata = rddata_q1[703:688];
        6'd44 : rddata = rddata_q1[719:704];
        6'd45 : rddata = rddata_q1[735:720];
        6'd46 : rddata = rddata_q1[751:736];
        6'd47 : rddata = rddata_q1[767:752];
        6'd48 : rddata = rddata_q1[783:768];
        6'd49 : rddata = rddata_q1[799:784];
        6'd50 : rddata = rddata_q1[815:800];
        6'd51 : rddata = rddata_q1[831:816];
        6'd52 : rddata = rddata_q1[847:832];
        6'd53 : rddata = rddata_q1[863:848];
        6'd54 : rddata = rddata_q1[879:864];
        6'd55 : rddata = rddata_q1[895:880];
        6'd56 : rddata = rddata_q1[911:896];
        6'd57 : rddata = rddata_q1[927:912];
        6'd58 : rddata = rddata_q1[943:928];
        6'd59 : rddata = rddata_q1[959:944];
        6'd60 : rddata = rddata_q1[975:960];
        6'd61 : rddata = rddata_q1[991:976];
        6'd62 : rddata = rddata_q1[1007:992];
        6'd63 : rddata = rddata_q1[1023:1008];
    endcase

always @(posedge CLK) wordSel_q1 <= wordSel;

endmodule

   
