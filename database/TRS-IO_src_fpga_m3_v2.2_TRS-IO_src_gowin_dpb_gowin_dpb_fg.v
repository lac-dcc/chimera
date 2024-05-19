// This program was cloned from: https://github.com/apuder/TRS-IO
// License: GNU General Public License v3.0

//Copyright (C)2014-2023 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//GOWIN Version: V1.9.9 Beta-4 Education
//Part Number: GW1NR-LV9QN88PC6/I5
//Device: GW1NR-9
//Device Version: C
//Created Time: Sun Feb 18 21:49:39 2024

module Gowin_DPB_FG (douta, doutb, clka, ocea, cea, reseta, wrea, clkb, oceb, ceb, resetb, wreb, ada, dina, adb, dinb);

output [7:0] douta;
output [7:0] doutb;
input clka;
input ocea;
input cea;
input reseta;
input wrea;
input clkb;
input oceb;
input ceb;
input resetb;
input wreb;
input [13:0] ada;
input [7:0] dina;
input [13:0] adb;
input [7:0] dinb;

wire [13:0] dpb_inst_0_douta_w;
wire [1:0] dpb_inst_0_douta;
wire [13:0] dpb_inst_0_doutb_w;
wire [1:0] dpb_inst_0_doutb;
wire [13:0] dpb_inst_1_douta_w;
wire [3:2] dpb_inst_1_douta;
wire [13:0] dpb_inst_1_doutb_w;
wire [3:2] dpb_inst_1_doutb;
wire [11:0] dpb_inst_2_douta_w;
wire [3:0] dpb_inst_2_douta;
wire [11:0] dpb_inst_2_doutb_w;
wire [3:0] dpb_inst_2_doutb;
wire [13:0] dpb_inst_3_douta_w;
wire [5:4] dpb_inst_3_douta;
wire [13:0] dpb_inst_3_doutb_w;
wire [5:4] dpb_inst_3_doutb;
wire [13:0] dpb_inst_4_douta_w;
wire [7:6] dpb_inst_4_douta;
wire [13:0] dpb_inst_4_doutb_w;
wire [7:6] dpb_inst_4_doutb;
wire [11:0] dpb_inst_5_douta_w;
wire [7:4] dpb_inst_5_douta;
wire [11:0] dpb_inst_5_doutb_w;
wire [7:4] dpb_inst_5_doutb;
wire dff_q_0;
wire dff_q_1;
wire dff_q_2;
wire dff_q_3;
wire cea_w;
wire ceb_w;
wire gw_gnd;

assign cea_w = ~wrea & cea;
assign ceb_w = ~wreb & ceb;
assign gw_gnd = 1'b0;

DPB dpb_inst_0 (
    .DOA({dpb_inst_0_douta_w[13:0],dpb_inst_0_douta[1:0]}),
    .DOB({dpb_inst_0_doutb_w[13:0],dpb_inst_0_doutb[1:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,ada[13]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[13]}),
    .ADA({ada[12:0],gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[1:0]}),
    .ADB({adb[12:0],gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[1:0]})
);

defparam dpb_inst_0.READ_MODE0 = 1'b1;
defparam dpb_inst_0.READ_MODE1 = 1'b1;
defparam dpb_inst_0.WRITE_MODE0 = 2'b00;
defparam dpb_inst_0.WRITE_MODE1 = 2'b00;
defparam dpb_inst_0.BIT_WIDTH_0 = 2;
defparam dpb_inst_0.BIT_WIDTH_1 = 2;
defparam dpb_inst_0.BLK_SEL_0 = 3'b000;
defparam dpb_inst_0.BLK_SEL_1 = 3'b000;
defparam dpb_inst_0.RESET_MODE = "SYNC";

DPB dpb_inst_1 (
    .DOA({dpb_inst_1_douta_w[13:0],dpb_inst_1_douta[3:2]}),
    .DOB({dpb_inst_1_doutb_w[13:0],dpb_inst_1_doutb[3:2]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,ada[13]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[13]}),
    .ADA({ada[12:0],gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[3:2]}),
    .ADB({adb[12:0],gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[3:2]})
);

defparam dpb_inst_1.READ_MODE0 = 1'b1;
defparam dpb_inst_1.READ_MODE1 = 1'b1;
defparam dpb_inst_1.WRITE_MODE0 = 2'b00;
defparam dpb_inst_1.WRITE_MODE1 = 2'b00;
defparam dpb_inst_1.BIT_WIDTH_0 = 2;
defparam dpb_inst_1.BIT_WIDTH_1 = 2;
defparam dpb_inst_1.BLK_SEL_0 = 3'b000;
defparam dpb_inst_1.BLK_SEL_1 = 3'b000;
defparam dpb_inst_1.RESET_MODE = "SYNC";

DPB dpb_inst_2 (
    .DOA({dpb_inst_2_douta_w[11:0],dpb_inst_2_douta[3:0]}),
    .DOB({dpb_inst_2_doutb_w[11:0],dpb_inst_2_doutb[3:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[13],ada[12]}),
    .BLKSELB({gw_gnd,adb[13],adb[12]}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[3:0]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[3:0]})
);

defparam dpb_inst_2.READ_MODE0 = 1'b1;
defparam dpb_inst_2.READ_MODE1 = 1'b1;
defparam dpb_inst_2.WRITE_MODE0 = 2'b00;
defparam dpb_inst_2.WRITE_MODE1 = 2'b00;
defparam dpb_inst_2.BIT_WIDTH_0 = 4;
defparam dpb_inst_2.BIT_WIDTH_1 = 4;
defparam dpb_inst_2.BLK_SEL_0 = 3'b010;
defparam dpb_inst_2.BLK_SEL_1 = 3'b010;
defparam dpb_inst_2.RESET_MODE = "SYNC";

DPB dpb_inst_3 (
    .DOA({dpb_inst_3_douta_w[13:0],dpb_inst_3_douta[5:4]}),
    .DOB({dpb_inst_3_doutb_w[13:0],dpb_inst_3_doutb[5:4]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,ada[13]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[13]}),
    .ADA({ada[12:0],gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[5:4]}),
    .ADB({adb[12:0],gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[5:4]})
);

defparam dpb_inst_3.READ_MODE0 = 1'b1;
defparam dpb_inst_3.READ_MODE1 = 1'b1;
defparam dpb_inst_3.WRITE_MODE0 = 2'b00;
defparam dpb_inst_3.WRITE_MODE1 = 2'b00;
defparam dpb_inst_3.BIT_WIDTH_0 = 2;
defparam dpb_inst_3.BIT_WIDTH_1 = 2;
defparam dpb_inst_3.BLK_SEL_0 = 3'b000;
defparam dpb_inst_3.BLK_SEL_1 = 3'b000;
defparam dpb_inst_3.RESET_MODE = "SYNC";

DPB dpb_inst_4 (
    .DOA({dpb_inst_4_douta_w[13:0],dpb_inst_4_douta[7:6]}),
    .DOB({dpb_inst_4_doutb_w[13:0],dpb_inst_4_doutb[7:6]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,ada[13]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[13]}),
    .ADA({ada[12:0],gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[7:6]}),
    .ADB({adb[12:0],gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[7:6]})
);

defparam dpb_inst_4.READ_MODE0 = 1'b1;
defparam dpb_inst_4.READ_MODE1 = 1'b1;
defparam dpb_inst_4.WRITE_MODE0 = 2'b00;
defparam dpb_inst_4.WRITE_MODE1 = 2'b00;
defparam dpb_inst_4.BIT_WIDTH_0 = 2;
defparam dpb_inst_4.BIT_WIDTH_1 = 2;
defparam dpb_inst_4.BLK_SEL_0 = 3'b000;
defparam dpb_inst_4.BLK_SEL_1 = 3'b000;
defparam dpb_inst_4.RESET_MODE = "SYNC";

DPB dpb_inst_5 (
    .DOA({dpb_inst_5_douta_w[11:0],dpb_inst_5_douta[7:4]}),
    .DOB({dpb_inst_5_doutb_w[11:0],dpb_inst_5_doutb[7:4]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,ada[13],ada[12]}),
    .BLKSELB({gw_gnd,adb[13],adb[12]}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[7:4]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[7:4]})
);

defparam dpb_inst_5.READ_MODE0 = 1'b1;
defparam dpb_inst_5.READ_MODE1 = 1'b1;
defparam dpb_inst_5.WRITE_MODE0 = 2'b00;
defparam dpb_inst_5.WRITE_MODE1 = 2'b00;
defparam dpb_inst_5.BIT_WIDTH_0 = 4;
defparam dpb_inst_5.BIT_WIDTH_1 = 4;
defparam dpb_inst_5.BLK_SEL_0 = 3'b010;
defparam dpb_inst_5.BLK_SEL_1 = 3'b010;
defparam dpb_inst_5.RESET_MODE = "SYNC";

DFFE dff_inst_0 (
  .Q(dff_q_0),
  .D(ada[13]),
  .CLK(clka),
  .CE(cea_w)
);
DFFE dff_inst_1 (
  .Q(dff_q_1),
  .D(dff_q_0),
  .CLK(clka),
  .CE(ocea)
);
DFFE dff_inst_2 (
  .Q(dff_q_2),
  .D(adb[13]),
  .CLK(clkb),
  .CE(ceb_w)
);
DFFE dff_inst_3 (
  .Q(dff_q_3),
  .D(dff_q_2),
  .CLK(clkb),
  .CE(oceb)
);
MUX2 mux_inst_2 (
  .O(douta[0]),
  .I0(dpb_inst_0_douta[0]),
  .I1(dpb_inst_2_douta[0]),
  .S0(dff_q_1)
);
MUX2 mux_inst_5 (
  .O(douta[1]),
  .I0(dpb_inst_0_douta[1]),
  .I1(dpb_inst_2_douta[1]),
  .S0(dff_q_1)
);
MUX2 mux_inst_8 (
  .O(douta[2]),
  .I0(dpb_inst_1_douta[2]),
  .I1(dpb_inst_2_douta[2]),
  .S0(dff_q_1)
);
MUX2 mux_inst_11 (
  .O(douta[3]),
  .I0(dpb_inst_1_douta[3]),
  .I1(dpb_inst_2_douta[3]),
  .S0(dff_q_1)
);
MUX2 mux_inst_14 (
  .O(douta[4]),
  .I0(dpb_inst_3_douta[4]),
  .I1(dpb_inst_5_douta[4]),
  .S0(dff_q_1)
);
MUX2 mux_inst_17 (
  .O(douta[5]),
  .I0(dpb_inst_3_douta[5]),
  .I1(dpb_inst_5_douta[5]),
  .S0(dff_q_1)
);
MUX2 mux_inst_20 (
  .O(douta[6]),
  .I0(dpb_inst_4_douta[6]),
  .I1(dpb_inst_5_douta[6]),
  .S0(dff_q_1)
);
MUX2 mux_inst_23 (
  .O(douta[7]),
  .I0(dpb_inst_4_douta[7]),
  .I1(dpb_inst_5_douta[7]),
  .S0(dff_q_1)
);
MUX2 mux_inst_26 (
  .O(doutb[0]),
  .I0(dpb_inst_0_doutb[0]),
  .I1(dpb_inst_2_doutb[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_29 (
  .O(doutb[1]),
  .I0(dpb_inst_0_doutb[1]),
  .I1(dpb_inst_2_doutb[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_32 (
  .O(doutb[2]),
  .I0(dpb_inst_1_doutb[2]),
  .I1(dpb_inst_2_doutb[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_35 (
  .O(doutb[3]),
  .I0(dpb_inst_1_doutb[3]),
  .I1(dpb_inst_2_doutb[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_38 (
  .O(doutb[4]),
  .I0(dpb_inst_3_doutb[4]),
  .I1(dpb_inst_5_doutb[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_41 (
  .O(doutb[5]),
  .I0(dpb_inst_3_doutb[5]),
  .I1(dpb_inst_5_doutb[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_44 (
  .O(doutb[6]),
  .I0(dpb_inst_4_doutb[6]),
  .I1(dpb_inst_5_doutb[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_47 (
  .O(doutb[7]),
  .I0(dpb_inst_4_doutb[7]),
  .I1(dpb_inst_5_doutb[7]),
  .S0(dff_q_3)
);
endmodule //Gowin_DPB_FG
