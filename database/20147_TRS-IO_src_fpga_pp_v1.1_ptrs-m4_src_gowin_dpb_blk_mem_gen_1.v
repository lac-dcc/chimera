// This program was cloned from: https://github.com/apuder/TRS-IO
// License: GNU General Public License v3.0

//Copyright (C)2014-2022 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//GOWIN Version: V1.9.8.09 Education
//Part Number: GW2A-LV18PG256C8/I7
//Device: GW2A-18C
//Created Time: Sat Jun 17 07:18:41 2023

module blk_mem_gen_1 (douta, doutb, clka, ocea, cea, reseta, wrea, clkb, oceb, ceb, resetb, wreb, ada, dina, adb, dinb);

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
input [15:0] ada;
input [7:0] dina;
input [15:0] adb;
input [7:0] dinb;

wire [14:0] dpb_inst_0_douta_w;
wire [0:0] dpb_inst_0_douta;
wire [14:0] dpb_inst_0_doutb_w;
wire [0:0] dpb_inst_0_doutb;
wire [14:0] dpb_inst_1_douta_w;
wire [0:0] dpb_inst_1_douta;
wire [14:0] dpb_inst_1_doutb_w;
wire [0:0] dpb_inst_1_doutb;
wire [14:0] dpb_inst_2_douta_w;
wire [0:0] dpb_inst_2_douta;
wire [14:0] dpb_inst_2_doutb_w;
wire [0:0] dpb_inst_2_doutb;
wire [14:0] dpb_inst_3_douta_w;
wire [0:0] dpb_inst_3_douta;
wire [14:0] dpb_inst_3_doutb_w;
wire [0:0] dpb_inst_3_doutb;
wire [14:0] dpb_inst_4_douta_w;
wire [1:1] dpb_inst_4_douta;
wire [14:0] dpb_inst_4_doutb_w;
wire [1:1] dpb_inst_4_doutb;
wire [14:0] dpb_inst_5_douta_w;
wire [1:1] dpb_inst_5_douta;
wire [14:0] dpb_inst_5_doutb_w;
wire [1:1] dpb_inst_5_doutb;
wire [14:0] dpb_inst_6_douta_w;
wire [1:1] dpb_inst_6_douta;
wire [14:0] dpb_inst_6_doutb_w;
wire [1:1] dpb_inst_6_doutb;
wire [14:0] dpb_inst_7_douta_w;
wire [1:1] dpb_inst_7_douta;
wire [14:0] dpb_inst_7_doutb_w;
wire [1:1] dpb_inst_7_doutb;
wire [14:0] dpb_inst_8_douta_w;
wire [2:2] dpb_inst_8_douta;
wire [14:0] dpb_inst_8_doutb_w;
wire [2:2] dpb_inst_8_doutb;
wire [14:0] dpb_inst_9_douta_w;
wire [2:2] dpb_inst_9_douta;
wire [14:0] dpb_inst_9_doutb_w;
wire [2:2] dpb_inst_9_doutb;
wire [14:0] dpb_inst_10_douta_w;
wire [2:2] dpb_inst_10_douta;
wire [14:0] dpb_inst_10_doutb_w;
wire [2:2] dpb_inst_10_doutb;
wire [14:0] dpb_inst_11_douta_w;
wire [2:2] dpb_inst_11_douta;
wire [14:0] dpb_inst_11_doutb_w;
wire [2:2] dpb_inst_11_doutb;
wire [14:0] dpb_inst_12_douta_w;
wire [3:3] dpb_inst_12_douta;
wire [14:0] dpb_inst_12_doutb_w;
wire [3:3] dpb_inst_12_doutb;
wire [14:0] dpb_inst_13_douta_w;
wire [3:3] dpb_inst_13_douta;
wire [14:0] dpb_inst_13_doutb_w;
wire [3:3] dpb_inst_13_doutb;
wire [14:0] dpb_inst_14_douta_w;
wire [3:3] dpb_inst_14_douta;
wire [14:0] dpb_inst_14_doutb_w;
wire [3:3] dpb_inst_14_doutb;
wire [14:0] dpb_inst_15_douta_w;
wire [3:3] dpb_inst_15_douta;
wire [14:0] dpb_inst_15_doutb_w;
wire [3:3] dpb_inst_15_doutb;
wire [14:0] dpb_inst_16_douta_w;
wire [4:4] dpb_inst_16_douta;
wire [14:0] dpb_inst_16_doutb_w;
wire [4:4] dpb_inst_16_doutb;
wire [14:0] dpb_inst_17_douta_w;
wire [4:4] dpb_inst_17_douta;
wire [14:0] dpb_inst_17_doutb_w;
wire [4:4] dpb_inst_17_doutb;
wire [14:0] dpb_inst_18_douta_w;
wire [4:4] dpb_inst_18_douta;
wire [14:0] dpb_inst_18_doutb_w;
wire [4:4] dpb_inst_18_doutb;
wire [14:0] dpb_inst_19_douta_w;
wire [4:4] dpb_inst_19_douta;
wire [14:0] dpb_inst_19_doutb_w;
wire [4:4] dpb_inst_19_doutb;
wire [14:0] dpb_inst_20_douta_w;
wire [5:5] dpb_inst_20_douta;
wire [14:0] dpb_inst_20_doutb_w;
wire [5:5] dpb_inst_20_doutb;
wire [14:0] dpb_inst_21_douta_w;
wire [5:5] dpb_inst_21_douta;
wire [14:0] dpb_inst_21_doutb_w;
wire [5:5] dpb_inst_21_doutb;
wire [14:0] dpb_inst_22_douta_w;
wire [5:5] dpb_inst_22_douta;
wire [14:0] dpb_inst_22_doutb_w;
wire [5:5] dpb_inst_22_doutb;
wire [14:0] dpb_inst_23_douta_w;
wire [5:5] dpb_inst_23_douta;
wire [14:0] dpb_inst_23_doutb_w;
wire [5:5] dpb_inst_23_doutb;
wire [14:0] dpb_inst_24_douta_w;
wire [6:6] dpb_inst_24_douta;
wire [14:0] dpb_inst_24_doutb_w;
wire [6:6] dpb_inst_24_doutb;
wire [14:0] dpb_inst_25_douta_w;
wire [6:6] dpb_inst_25_douta;
wire [14:0] dpb_inst_25_doutb_w;
wire [6:6] dpb_inst_25_doutb;
wire [14:0] dpb_inst_26_douta_w;
wire [6:6] dpb_inst_26_douta;
wire [14:0] dpb_inst_26_doutb_w;
wire [6:6] dpb_inst_26_doutb;
wire [14:0] dpb_inst_27_douta_w;
wire [6:6] dpb_inst_27_douta;
wire [14:0] dpb_inst_27_doutb_w;
wire [6:6] dpb_inst_27_doutb;
wire [14:0] dpb_inst_28_douta_w;
wire [7:7] dpb_inst_28_douta;
wire [14:0] dpb_inst_28_doutb_w;
wire [7:7] dpb_inst_28_doutb;
wire [14:0] dpb_inst_29_douta_w;
wire [7:7] dpb_inst_29_douta;
wire [14:0] dpb_inst_29_doutb_w;
wire [7:7] dpb_inst_29_doutb;
wire [14:0] dpb_inst_30_douta_w;
wire [7:7] dpb_inst_30_douta;
wire [14:0] dpb_inst_30_doutb_w;
wire [7:7] dpb_inst_30_doutb;
wire [14:0] dpb_inst_31_douta_w;
wire [7:7] dpb_inst_31_douta;
wire [14:0] dpb_inst_31_doutb_w;
wire [7:7] dpb_inst_31_doutb;
wire dff_q_0;
wire dff_q_1;
wire dff_q_2;
wire dff_q_3;
wire mux_o_0;
wire mux_o_1;
wire mux_o_3;
wire mux_o_4;
wire mux_o_6;
wire mux_o_7;
wire mux_o_9;
wire mux_o_10;
wire mux_o_12;
wire mux_o_13;
wire mux_o_15;
wire mux_o_16;
wire mux_o_18;
wire mux_o_19;
wire mux_o_21;
wire mux_o_22;
wire mux_o_24;
wire mux_o_25;
wire mux_o_27;
wire mux_o_28;
wire mux_o_30;
wire mux_o_31;
wire mux_o_33;
wire mux_o_34;
wire mux_o_36;
wire mux_o_37;
wire mux_o_39;
wire mux_o_40;
wire mux_o_42;
wire mux_o_43;
wire mux_o_45;
wire mux_o_46;
wire cea_w;
wire ceb_w;
wire gw_gnd;

assign cea_w = ~wrea & cea;
assign ceb_w = ~wreb & ceb;
assign gw_gnd = 1'b0;

DPB dpb_inst_0 (
    .DOA({dpb_inst_0_douta_w[14:0],dpb_inst_0_douta[0]}),
    .DOB({dpb_inst_0_doutb_w[14:0],dpb_inst_0_doutb[0]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[0]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[0]})
);

defparam dpb_inst_0.READ_MODE0 = 1'b0;
defparam dpb_inst_0.READ_MODE1 = 1'b0;
defparam dpb_inst_0.WRITE_MODE0 = 2'b00;
defparam dpb_inst_0.WRITE_MODE1 = 2'b00;
defparam dpb_inst_0.BIT_WIDTH_0 = 1;
defparam dpb_inst_0.BIT_WIDTH_1 = 1;
defparam dpb_inst_0.BLK_SEL_0 = 3'b000;
defparam dpb_inst_0.BLK_SEL_1 = 3'b000;
defparam dpb_inst_0.RESET_MODE = "SYNC";

DPB dpb_inst_1 (
    .DOA({dpb_inst_1_douta_w[14:0],dpb_inst_1_douta[0]}),
    .DOB({dpb_inst_1_doutb_w[14:0],dpb_inst_1_doutb[0]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[0]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[0]})
);

defparam dpb_inst_1.READ_MODE0 = 1'b0;
defparam dpb_inst_1.READ_MODE1 = 1'b0;
defparam dpb_inst_1.WRITE_MODE0 = 2'b00;
defparam dpb_inst_1.WRITE_MODE1 = 2'b00;
defparam dpb_inst_1.BIT_WIDTH_0 = 1;
defparam dpb_inst_1.BIT_WIDTH_1 = 1;
defparam dpb_inst_1.BLK_SEL_0 = 3'b001;
defparam dpb_inst_1.BLK_SEL_1 = 3'b001;
defparam dpb_inst_1.RESET_MODE = "SYNC";

DPB dpb_inst_2 (
    .DOA({dpb_inst_2_douta_w[14:0],dpb_inst_2_douta[0]}),
    .DOB({dpb_inst_2_doutb_w[14:0],dpb_inst_2_doutb[0]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[0]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[0]})
);

defparam dpb_inst_2.READ_MODE0 = 1'b0;
defparam dpb_inst_2.READ_MODE1 = 1'b0;
defparam dpb_inst_2.WRITE_MODE0 = 2'b00;
defparam dpb_inst_2.WRITE_MODE1 = 2'b00;
defparam dpb_inst_2.BIT_WIDTH_0 = 1;
defparam dpb_inst_2.BIT_WIDTH_1 = 1;
defparam dpb_inst_2.BLK_SEL_0 = 3'b010;
defparam dpb_inst_2.BLK_SEL_1 = 3'b010;
defparam dpb_inst_2.RESET_MODE = "SYNC";

DPB dpb_inst_3 (
    .DOA({dpb_inst_3_douta_w[14:0],dpb_inst_3_douta[0]}),
    .DOB({dpb_inst_3_doutb_w[14:0],dpb_inst_3_doutb[0]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[0]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[0]})
);

defparam dpb_inst_3.READ_MODE0 = 1'b0;
defparam dpb_inst_3.READ_MODE1 = 1'b0;
defparam dpb_inst_3.WRITE_MODE0 = 2'b00;
defparam dpb_inst_3.WRITE_MODE1 = 2'b00;
defparam dpb_inst_3.BIT_WIDTH_0 = 1;
defparam dpb_inst_3.BIT_WIDTH_1 = 1;
defparam dpb_inst_3.BLK_SEL_0 = 3'b011;
defparam dpb_inst_3.BLK_SEL_1 = 3'b011;
defparam dpb_inst_3.RESET_MODE = "SYNC";

DPB dpb_inst_4 (
    .DOA({dpb_inst_4_douta_w[14:0],dpb_inst_4_douta[1]}),
    .DOB({dpb_inst_4_doutb_w[14:0],dpb_inst_4_doutb[1]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[1]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[1]})
);

defparam dpb_inst_4.READ_MODE0 = 1'b0;
defparam dpb_inst_4.READ_MODE1 = 1'b0;
defparam dpb_inst_4.WRITE_MODE0 = 2'b00;
defparam dpb_inst_4.WRITE_MODE1 = 2'b00;
defparam dpb_inst_4.BIT_WIDTH_0 = 1;
defparam dpb_inst_4.BIT_WIDTH_1 = 1;
defparam dpb_inst_4.BLK_SEL_0 = 3'b000;
defparam dpb_inst_4.BLK_SEL_1 = 3'b000;
defparam dpb_inst_4.RESET_MODE = "SYNC";

DPB dpb_inst_5 (
    .DOA({dpb_inst_5_douta_w[14:0],dpb_inst_5_douta[1]}),
    .DOB({dpb_inst_5_doutb_w[14:0],dpb_inst_5_doutb[1]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[1]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[1]})
);

defparam dpb_inst_5.READ_MODE0 = 1'b0;
defparam dpb_inst_5.READ_MODE1 = 1'b0;
defparam dpb_inst_5.WRITE_MODE0 = 2'b00;
defparam dpb_inst_5.WRITE_MODE1 = 2'b00;
defparam dpb_inst_5.BIT_WIDTH_0 = 1;
defparam dpb_inst_5.BIT_WIDTH_1 = 1;
defparam dpb_inst_5.BLK_SEL_0 = 3'b001;
defparam dpb_inst_5.BLK_SEL_1 = 3'b001;
defparam dpb_inst_5.RESET_MODE = "SYNC";

DPB dpb_inst_6 (
    .DOA({dpb_inst_6_douta_w[14:0],dpb_inst_6_douta[1]}),
    .DOB({dpb_inst_6_doutb_w[14:0],dpb_inst_6_doutb[1]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[1]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[1]})
);

defparam dpb_inst_6.READ_MODE0 = 1'b0;
defparam dpb_inst_6.READ_MODE1 = 1'b0;
defparam dpb_inst_6.WRITE_MODE0 = 2'b00;
defparam dpb_inst_6.WRITE_MODE1 = 2'b00;
defparam dpb_inst_6.BIT_WIDTH_0 = 1;
defparam dpb_inst_6.BIT_WIDTH_1 = 1;
defparam dpb_inst_6.BLK_SEL_0 = 3'b010;
defparam dpb_inst_6.BLK_SEL_1 = 3'b010;
defparam dpb_inst_6.RESET_MODE = "SYNC";

DPB dpb_inst_7 (
    .DOA({dpb_inst_7_douta_w[14:0],dpb_inst_7_douta[1]}),
    .DOB({dpb_inst_7_doutb_w[14:0],dpb_inst_7_doutb[1]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[1]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[1]})
);

defparam dpb_inst_7.READ_MODE0 = 1'b0;
defparam dpb_inst_7.READ_MODE1 = 1'b0;
defparam dpb_inst_7.WRITE_MODE0 = 2'b00;
defparam dpb_inst_7.WRITE_MODE1 = 2'b00;
defparam dpb_inst_7.BIT_WIDTH_0 = 1;
defparam dpb_inst_7.BIT_WIDTH_1 = 1;
defparam dpb_inst_7.BLK_SEL_0 = 3'b011;
defparam dpb_inst_7.BLK_SEL_1 = 3'b011;
defparam dpb_inst_7.RESET_MODE = "SYNC";

DPB dpb_inst_8 (
    .DOA({dpb_inst_8_douta_w[14:0],dpb_inst_8_douta[2]}),
    .DOB({dpb_inst_8_doutb_w[14:0],dpb_inst_8_doutb[2]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[2]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[2]})
);

defparam dpb_inst_8.READ_MODE0 = 1'b0;
defparam dpb_inst_8.READ_MODE1 = 1'b0;
defparam dpb_inst_8.WRITE_MODE0 = 2'b00;
defparam dpb_inst_8.WRITE_MODE1 = 2'b00;
defparam dpb_inst_8.BIT_WIDTH_0 = 1;
defparam dpb_inst_8.BIT_WIDTH_1 = 1;
defparam dpb_inst_8.BLK_SEL_0 = 3'b000;
defparam dpb_inst_8.BLK_SEL_1 = 3'b000;
defparam dpb_inst_8.RESET_MODE = "SYNC";

DPB dpb_inst_9 (
    .DOA({dpb_inst_9_douta_w[14:0],dpb_inst_9_douta[2]}),
    .DOB({dpb_inst_9_doutb_w[14:0],dpb_inst_9_doutb[2]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[2]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[2]})
);

defparam dpb_inst_9.READ_MODE0 = 1'b0;
defparam dpb_inst_9.READ_MODE1 = 1'b0;
defparam dpb_inst_9.WRITE_MODE0 = 2'b00;
defparam dpb_inst_9.WRITE_MODE1 = 2'b00;
defparam dpb_inst_9.BIT_WIDTH_0 = 1;
defparam dpb_inst_9.BIT_WIDTH_1 = 1;
defparam dpb_inst_9.BLK_SEL_0 = 3'b001;
defparam dpb_inst_9.BLK_SEL_1 = 3'b001;
defparam dpb_inst_9.RESET_MODE = "SYNC";

DPB dpb_inst_10 (
    .DOA({dpb_inst_10_douta_w[14:0],dpb_inst_10_douta[2]}),
    .DOB({dpb_inst_10_doutb_w[14:0],dpb_inst_10_doutb[2]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[2]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[2]})
);

defparam dpb_inst_10.READ_MODE0 = 1'b0;
defparam dpb_inst_10.READ_MODE1 = 1'b0;
defparam dpb_inst_10.WRITE_MODE0 = 2'b00;
defparam dpb_inst_10.WRITE_MODE1 = 2'b00;
defparam dpb_inst_10.BIT_WIDTH_0 = 1;
defparam dpb_inst_10.BIT_WIDTH_1 = 1;
defparam dpb_inst_10.BLK_SEL_0 = 3'b010;
defparam dpb_inst_10.BLK_SEL_1 = 3'b010;
defparam dpb_inst_10.RESET_MODE = "SYNC";

DPB dpb_inst_11 (
    .DOA({dpb_inst_11_douta_w[14:0],dpb_inst_11_douta[2]}),
    .DOB({dpb_inst_11_doutb_w[14:0],dpb_inst_11_doutb[2]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[2]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[2]})
);

defparam dpb_inst_11.READ_MODE0 = 1'b0;
defparam dpb_inst_11.READ_MODE1 = 1'b0;
defparam dpb_inst_11.WRITE_MODE0 = 2'b00;
defparam dpb_inst_11.WRITE_MODE1 = 2'b00;
defparam dpb_inst_11.BIT_WIDTH_0 = 1;
defparam dpb_inst_11.BIT_WIDTH_1 = 1;
defparam dpb_inst_11.BLK_SEL_0 = 3'b011;
defparam dpb_inst_11.BLK_SEL_1 = 3'b011;
defparam dpb_inst_11.RESET_MODE = "SYNC";

DPB dpb_inst_12 (
    .DOA({dpb_inst_12_douta_w[14:0],dpb_inst_12_douta[3]}),
    .DOB({dpb_inst_12_doutb_w[14:0],dpb_inst_12_doutb[3]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[3]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[3]})
);

defparam dpb_inst_12.READ_MODE0 = 1'b0;
defparam dpb_inst_12.READ_MODE1 = 1'b0;
defparam dpb_inst_12.WRITE_MODE0 = 2'b00;
defparam dpb_inst_12.WRITE_MODE1 = 2'b00;
defparam dpb_inst_12.BIT_WIDTH_0 = 1;
defparam dpb_inst_12.BIT_WIDTH_1 = 1;
defparam dpb_inst_12.BLK_SEL_0 = 3'b000;
defparam dpb_inst_12.BLK_SEL_1 = 3'b000;
defparam dpb_inst_12.RESET_MODE = "SYNC";

DPB dpb_inst_13 (
    .DOA({dpb_inst_13_douta_w[14:0],dpb_inst_13_douta[3]}),
    .DOB({dpb_inst_13_doutb_w[14:0],dpb_inst_13_doutb[3]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[3]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[3]})
);

defparam dpb_inst_13.READ_MODE0 = 1'b0;
defparam dpb_inst_13.READ_MODE1 = 1'b0;
defparam dpb_inst_13.WRITE_MODE0 = 2'b00;
defparam dpb_inst_13.WRITE_MODE1 = 2'b00;
defparam dpb_inst_13.BIT_WIDTH_0 = 1;
defparam dpb_inst_13.BIT_WIDTH_1 = 1;
defparam dpb_inst_13.BLK_SEL_0 = 3'b001;
defparam dpb_inst_13.BLK_SEL_1 = 3'b001;
defparam dpb_inst_13.RESET_MODE = "SYNC";

DPB dpb_inst_14 (
    .DOA({dpb_inst_14_douta_w[14:0],dpb_inst_14_douta[3]}),
    .DOB({dpb_inst_14_doutb_w[14:0],dpb_inst_14_doutb[3]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[3]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[3]})
);

defparam dpb_inst_14.READ_MODE0 = 1'b0;
defparam dpb_inst_14.READ_MODE1 = 1'b0;
defparam dpb_inst_14.WRITE_MODE0 = 2'b00;
defparam dpb_inst_14.WRITE_MODE1 = 2'b00;
defparam dpb_inst_14.BIT_WIDTH_0 = 1;
defparam dpb_inst_14.BIT_WIDTH_1 = 1;
defparam dpb_inst_14.BLK_SEL_0 = 3'b010;
defparam dpb_inst_14.BLK_SEL_1 = 3'b010;
defparam dpb_inst_14.RESET_MODE = "SYNC";

DPB dpb_inst_15 (
    .DOA({dpb_inst_15_douta_w[14:0],dpb_inst_15_douta[3]}),
    .DOB({dpb_inst_15_doutb_w[14:0],dpb_inst_15_doutb[3]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[3]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[3]})
);

defparam dpb_inst_15.READ_MODE0 = 1'b0;
defparam dpb_inst_15.READ_MODE1 = 1'b0;
defparam dpb_inst_15.WRITE_MODE0 = 2'b00;
defparam dpb_inst_15.WRITE_MODE1 = 2'b00;
defparam dpb_inst_15.BIT_WIDTH_0 = 1;
defparam dpb_inst_15.BIT_WIDTH_1 = 1;
defparam dpb_inst_15.BLK_SEL_0 = 3'b011;
defparam dpb_inst_15.BLK_SEL_1 = 3'b011;
defparam dpb_inst_15.RESET_MODE = "SYNC";

DPB dpb_inst_16 (
    .DOA({dpb_inst_16_douta_w[14:0],dpb_inst_16_douta[4]}),
    .DOB({dpb_inst_16_doutb_w[14:0],dpb_inst_16_doutb[4]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[4]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[4]})
);

defparam dpb_inst_16.READ_MODE0 = 1'b0;
defparam dpb_inst_16.READ_MODE1 = 1'b0;
defparam dpb_inst_16.WRITE_MODE0 = 2'b00;
defparam dpb_inst_16.WRITE_MODE1 = 2'b00;
defparam dpb_inst_16.BIT_WIDTH_0 = 1;
defparam dpb_inst_16.BIT_WIDTH_1 = 1;
defparam dpb_inst_16.BLK_SEL_0 = 3'b000;
defparam dpb_inst_16.BLK_SEL_1 = 3'b000;
defparam dpb_inst_16.RESET_MODE = "SYNC";

DPB dpb_inst_17 (
    .DOA({dpb_inst_17_douta_w[14:0],dpb_inst_17_douta[4]}),
    .DOB({dpb_inst_17_doutb_w[14:0],dpb_inst_17_doutb[4]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[4]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[4]})
);

defparam dpb_inst_17.READ_MODE0 = 1'b0;
defparam dpb_inst_17.READ_MODE1 = 1'b0;
defparam dpb_inst_17.WRITE_MODE0 = 2'b00;
defparam dpb_inst_17.WRITE_MODE1 = 2'b00;
defparam dpb_inst_17.BIT_WIDTH_0 = 1;
defparam dpb_inst_17.BIT_WIDTH_1 = 1;
defparam dpb_inst_17.BLK_SEL_0 = 3'b001;
defparam dpb_inst_17.BLK_SEL_1 = 3'b001;
defparam dpb_inst_17.RESET_MODE = "SYNC";

DPB dpb_inst_18 (
    .DOA({dpb_inst_18_douta_w[14:0],dpb_inst_18_douta[4]}),
    .DOB({dpb_inst_18_doutb_w[14:0],dpb_inst_18_doutb[4]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[4]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[4]})
);

defparam dpb_inst_18.READ_MODE0 = 1'b0;
defparam dpb_inst_18.READ_MODE1 = 1'b0;
defparam dpb_inst_18.WRITE_MODE0 = 2'b00;
defparam dpb_inst_18.WRITE_MODE1 = 2'b00;
defparam dpb_inst_18.BIT_WIDTH_0 = 1;
defparam dpb_inst_18.BIT_WIDTH_1 = 1;
defparam dpb_inst_18.BLK_SEL_0 = 3'b010;
defparam dpb_inst_18.BLK_SEL_1 = 3'b010;
defparam dpb_inst_18.RESET_MODE = "SYNC";

DPB dpb_inst_19 (
    .DOA({dpb_inst_19_douta_w[14:0],dpb_inst_19_douta[4]}),
    .DOB({dpb_inst_19_doutb_w[14:0],dpb_inst_19_doutb[4]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[4]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[4]})
);

defparam dpb_inst_19.READ_MODE0 = 1'b0;
defparam dpb_inst_19.READ_MODE1 = 1'b0;
defparam dpb_inst_19.WRITE_MODE0 = 2'b00;
defparam dpb_inst_19.WRITE_MODE1 = 2'b00;
defparam dpb_inst_19.BIT_WIDTH_0 = 1;
defparam dpb_inst_19.BIT_WIDTH_1 = 1;
defparam dpb_inst_19.BLK_SEL_0 = 3'b011;
defparam dpb_inst_19.BLK_SEL_1 = 3'b011;
defparam dpb_inst_19.RESET_MODE = "SYNC";

DPB dpb_inst_20 (
    .DOA({dpb_inst_20_douta_w[14:0],dpb_inst_20_douta[5]}),
    .DOB({dpb_inst_20_doutb_w[14:0],dpb_inst_20_doutb[5]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[5]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[5]})
);

defparam dpb_inst_20.READ_MODE0 = 1'b0;
defparam dpb_inst_20.READ_MODE1 = 1'b0;
defparam dpb_inst_20.WRITE_MODE0 = 2'b00;
defparam dpb_inst_20.WRITE_MODE1 = 2'b00;
defparam dpb_inst_20.BIT_WIDTH_0 = 1;
defparam dpb_inst_20.BIT_WIDTH_1 = 1;
defparam dpb_inst_20.BLK_SEL_0 = 3'b000;
defparam dpb_inst_20.BLK_SEL_1 = 3'b000;
defparam dpb_inst_20.RESET_MODE = "SYNC";

DPB dpb_inst_21 (
    .DOA({dpb_inst_21_douta_w[14:0],dpb_inst_21_douta[5]}),
    .DOB({dpb_inst_21_doutb_w[14:0],dpb_inst_21_doutb[5]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[5]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[5]})
);

defparam dpb_inst_21.READ_MODE0 = 1'b0;
defparam dpb_inst_21.READ_MODE1 = 1'b0;
defparam dpb_inst_21.WRITE_MODE0 = 2'b00;
defparam dpb_inst_21.WRITE_MODE1 = 2'b00;
defparam dpb_inst_21.BIT_WIDTH_0 = 1;
defparam dpb_inst_21.BIT_WIDTH_1 = 1;
defparam dpb_inst_21.BLK_SEL_0 = 3'b001;
defparam dpb_inst_21.BLK_SEL_1 = 3'b001;
defparam dpb_inst_21.RESET_MODE = "SYNC";

DPB dpb_inst_22 (
    .DOA({dpb_inst_22_douta_w[14:0],dpb_inst_22_douta[5]}),
    .DOB({dpb_inst_22_doutb_w[14:0],dpb_inst_22_doutb[5]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[5]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[5]})
);

defparam dpb_inst_22.READ_MODE0 = 1'b0;
defparam dpb_inst_22.READ_MODE1 = 1'b0;
defparam dpb_inst_22.WRITE_MODE0 = 2'b00;
defparam dpb_inst_22.WRITE_MODE1 = 2'b00;
defparam dpb_inst_22.BIT_WIDTH_0 = 1;
defparam dpb_inst_22.BIT_WIDTH_1 = 1;
defparam dpb_inst_22.BLK_SEL_0 = 3'b010;
defparam dpb_inst_22.BLK_SEL_1 = 3'b010;
defparam dpb_inst_22.RESET_MODE = "SYNC";

DPB dpb_inst_23 (
    .DOA({dpb_inst_23_douta_w[14:0],dpb_inst_23_douta[5]}),
    .DOB({dpb_inst_23_doutb_w[14:0],dpb_inst_23_doutb[5]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[5]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[5]})
);

defparam dpb_inst_23.READ_MODE0 = 1'b0;
defparam dpb_inst_23.READ_MODE1 = 1'b0;
defparam dpb_inst_23.WRITE_MODE0 = 2'b00;
defparam dpb_inst_23.WRITE_MODE1 = 2'b00;
defparam dpb_inst_23.BIT_WIDTH_0 = 1;
defparam dpb_inst_23.BIT_WIDTH_1 = 1;
defparam dpb_inst_23.BLK_SEL_0 = 3'b011;
defparam dpb_inst_23.BLK_SEL_1 = 3'b011;
defparam dpb_inst_23.RESET_MODE = "SYNC";

DPB dpb_inst_24 (
    .DOA({dpb_inst_24_douta_w[14:0],dpb_inst_24_douta[6]}),
    .DOB({dpb_inst_24_doutb_w[14:0],dpb_inst_24_doutb[6]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[6]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[6]})
);

defparam dpb_inst_24.READ_MODE0 = 1'b0;
defparam dpb_inst_24.READ_MODE1 = 1'b0;
defparam dpb_inst_24.WRITE_MODE0 = 2'b00;
defparam dpb_inst_24.WRITE_MODE1 = 2'b00;
defparam dpb_inst_24.BIT_WIDTH_0 = 1;
defparam dpb_inst_24.BIT_WIDTH_1 = 1;
defparam dpb_inst_24.BLK_SEL_0 = 3'b000;
defparam dpb_inst_24.BLK_SEL_1 = 3'b000;
defparam dpb_inst_24.RESET_MODE = "SYNC";

DPB dpb_inst_25 (
    .DOA({dpb_inst_25_douta_w[14:0],dpb_inst_25_douta[6]}),
    .DOB({dpb_inst_25_doutb_w[14:0],dpb_inst_25_doutb[6]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[6]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[6]})
);

defparam dpb_inst_25.READ_MODE0 = 1'b0;
defparam dpb_inst_25.READ_MODE1 = 1'b0;
defparam dpb_inst_25.WRITE_MODE0 = 2'b00;
defparam dpb_inst_25.WRITE_MODE1 = 2'b00;
defparam dpb_inst_25.BIT_WIDTH_0 = 1;
defparam dpb_inst_25.BIT_WIDTH_1 = 1;
defparam dpb_inst_25.BLK_SEL_0 = 3'b001;
defparam dpb_inst_25.BLK_SEL_1 = 3'b001;
defparam dpb_inst_25.RESET_MODE = "SYNC";

DPB dpb_inst_26 (
    .DOA({dpb_inst_26_douta_w[14:0],dpb_inst_26_douta[6]}),
    .DOB({dpb_inst_26_doutb_w[14:0],dpb_inst_26_doutb[6]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[6]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[6]})
);

defparam dpb_inst_26.READ_MODE0 = 1'b0;
defparam dpb_inst_26.READ_MODE1 = 1'b0;
defparam dpb_inst_26.WRITE_MODE0 = 2'b00;
defparam dpb_inst_26.WRITE_MODE1 = 2'b00;
defparam dpb_inst_26.BIT_WIDTH_0 = 1;
defparam dpb_inst_26.BIT_WIDTH_1 = 1;
defparam dpb_inst_26.BLK_SEL_0 = 3'b010;
defparam dpb_inst_26.BLK_SEL_1 = 3'b010;
defparam dpb_inst_26.RESET_MODE = "SYNC";

DPB dpb_inst_27 (
    .DOA({dpb_inst_27_douta_w[14:0],dpb_inst_27_douta[6]}),
    .DOB({dpb_inst_27_doutb_w[14:0],dpb_inst_27_doutb[6]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[6]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[6]})
);

defparam dpb_inst_27.READ_MODE0 = 1'b0;
defparam dpb_inst_27.READ_MODE1 = 1'b0;
defparam dpb_inst_27.WRITE_MODE0 = 2'b00;
defparam dpb_inst_27.WRITE_MODE1 = 2'b00;
defparam dpb_inst_27.BIT_WIDTH_0 = 1;
defparam dpb_inst_27.BIT_WIDTH_1 = 1;
defparam dpb_inst_27.BLK_SEL_0 = 3'b011;
defparam dpb_inst_27.BLK_SEL_1 = 3'b011;
defparam dpb_inst_27.RESET_MODE = "SYNC";

DPB dpb_inst_28 (
    .DOA({dpb_inst_28_douta_w[14:0],dpb_inst_28_douta[7]}),
    .DOB({dpb_inst_28_doutb_w[14:0],dpb_inst_28_doutb[7]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[7]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[7]})
);

defparam dpb_inst_28.READ_MODE0 = 1'b0;
defparam dpb_inst_28.READ_MODE1 = 1'b0;
defparam dpb_inst_28.WRITE_MODE0 = 2'b00;
defparam dpb_inst_28.WRITE_MODE1 = 2'b00;
defparam dpb_inst_28.BIT_WIDTH_0 = 1;
defparam dpb_inst_28.BIT_WIDTH_1 = 1;
defparam dpb_inst_28.BLK_SEL_0 = 3'b000;
defparam dpb_inst_28.BLK_SEL_1 = 3'b000;
defparam dpb_inst_28.RESET_MODE = "SYNC";

DPB dpb_inst_29 (
    .DOA({dpb_inst_29_douta_w[14:0],dpb_inst_29_douta[7]}),
    .DOB({dpb_inst_29_doutb_w[14:0],dpb_inst_29_doutb[7]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[7]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[7]})
);

defparam dpb_inst_29.READ_MODE0 = 1'b0;
defparam dpb_inst_29.READ_MODE1 = 1'b0;
defparam dpb_inst_29.WRITE_MODE0 = 2'b00;
defparam dpb_inst_29.WRITE_MODE1 = 2'b00;
defparam dpb_inst_29.BIT_WIDTH_0 = 1;
defparam dpb_inst_29.BIT_WIDTH_1 = 1;
defparam dpb_inst_29.BLK_SEL_0 = 3'b001;
defparam dpb_inst_29.BLK_SEL_1 = 3'b001;
defparam dpb_inst_29.RESET_MODE = "SYNC";

DPB dpb_inst_30 (
    .DOA({dpb_inst_30_douta_w[14:0],dpb_inst_30_douta[7]}),
    .DOB({dpb_inst_30_doutb_w[14:0],dpb_inst_30_doutb[7]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[7]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[7]})
);

defparam dpb_inst_30.READ_MODE0 = 1'b0;
defparam dpb_inst_30.READ_MODE1 = 1'b0;
defparam dpb_inst_30.WRITE_MODE0 = 2'b00;
defparam dpb_inst_30.WRITE_MODE1 = 2'b00;
defparam dpb_inst_30.BIT_WIDTH_0 = 1;
defparam dpb_inst_30.BIT_WIDTH_1 = 1;
defparam dpb_inst_30.BLK_SEL_0 = 3'b010;
defparam dpb_inst_30.BLK_SEL_1 = 3'b010;
defparam dpb_inst_30.RESET_MODE = "SYNC";

DPB dpb_inst_31 (
    .DOA({dpb_inst_31_douta_w[14:0],dpb_inst_31_douta[7]}),
    .DOB({dpb_inst_31_doutb_w[14:0],dpb_inst_31_doutb[7]}),
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
    .BLKSELA({gw_gnd,ada[15],ada[14]}),
    .BLKSELB({gw_gnd,adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[7]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[7]})
);

defparam dpb_inst_31.READ_MODE0 = 1'b0;
defparam dpb_inst_31.READ_MODE1 = 1'b0;
defparam dpb_inst_31.WRITE_MODE0 = 2'b00;
defparam dpb_inst_31.WRITE_MODE1 = 2'b00;
defparam dpb_inst_31.BIT_WIDTH_0 = 1;
defparam dpb_inst_31.BIT_WIDTH_1 = 1;
defparam dpb_inst_31.BLK_SEL_0 = 3'b011;
defparam dpb_inst_31.BLK_SEL_1 = 3'b011;
defparam dpb_inst_31.RESET_MODE = "SYNC";

DFFE dff_inst_0 (
  .Q(dff_q_0),
  .D(ada[15]),
  .CLK(clka),
  .CE(cea_w)
);
DFFE dff_inst_1 (
  .Q(dff_q_1),
  .D(ada[14]),
  .CLK(clka),
  .CE(cea_w)
);
DFFE dff_inst_2 (
  .Q(dff_q_2),
  .D(adb[15]),
  .CLK(clkb),
  .CE(ceb_w)
);
DFFE dff_inst_3 (
  .Q(dff_q_3),
  .D(adb[14]),
  .CLK(clkb),
  .CE(ceb_w)
);
MUX2 mux_inst_0 (
  .O(mux_o_0),
  .I0(dpb_inst_0_douta[0]),
  .I1(dpb_inst_1_douta[0]),
  .S0(dff_q_1)
);
MUX2 mux_inst_1 (
  .O(mux_o_1),
  .I0(dpb_inst_2_douta[0]),
  .I1(dpb_inst_3_douta[0]),
  .S0(dff_q_1)
);
MUX2 mux_inst_2 (
  .O(douta[0]),
  .I0(mux_o_0),
  .I1(mux_o_1),
  .S0(dff_q_0)
);
MUX2 mux_inst_3 (
  .O(mux_o_3),
  .I0(dpb_inst_4_douta[1]),
  .I1(dpb_inst_5_douta[1]),
  .S0(dff_q_1)
);
MUX2 mux_inst_4 (
  .O(mux_o_4),
  .I0(dpb_inst_6_douta[1]),
  .I1(dpb_inst_7_douta[1]),
  .S0(dff_q_1)
);
MUX2 mux_inst_5 (
  .O(douta[1]),
  .I0(mux_o_3),
  .I1(mux_o_4),
  .S0(dff_q_0)
);
MUX2 mux_inst_6 (
  .O(mux_o_6),
  .I0(dpb_inst_8_douta[2]),
  .I1(dpb_inst_9_douta[2]),
  .S0(dff_q_1)
);
MUX2 mux_inst_7 (
  .O(mux_o_7),
  .I0(dpb_inst_10_douta[2]),
  .I1(dpb_inst_11_douta[2]),
  .S0(dff_q_1)
);
MUX2 mux_inst_8 (
  .O(douta[2]),
  .I0(mux_o_6),
  .I1(mux_o_7),
  .S0(dff_q_0)
);
MUX2 mux_inst_9 (
  .O(mux_o_9),
  .I0(dpb_inst_12_douta[3]),
  .I1(dpb_inst_13_douta[3]),
  .S0(dff_q_1)
);
MUX2 mux_inst_10 (
  .O(mux_o_10),
  .I0(dpb_inst_14_douta[3]),
  .I1(dpb_inst_15_douta[3]),
  .S0(dff_q_1)
);
MUX2 mux_inst_11 (
  .O(douta[3]),
  .I0(mux_o_9),
  .I1(mux_o_10),
  .S0(dff_q_0)
);
MUX2 mux_inst_12 (
  .O(mux_o_12),
  .I0(dpb_inst_16_douta[4]),
  .I1(dpb_inst_17_douta[4]),
  .S0(dff_q_1)
);
MUX2 mux_inst_13 (
  .O(mux_o_13),
  .I0(dpb_inst_18_douta[4]),
  .I1(dpb_inst_19_douta[4]),
  .S0(dff_q_1)
);
MUX2 mux_inst_14 (
  .O(douta[4]),
  .I0(mux_o_12),
  .I1(mux_o_13),
  .S0(dff_q_0)
);
MUX2 mux_inst_15 (
  .O(mux_o_15),
  .I0(dpb_inst_20_douta[5]),
  .I1(dpb_inst_21_douta[5]),
  .S0(dff_q_1)
);
MUX2 mux_inst_16 (
  .O(mux_o_16),
  .I0(dpb_inst_22_douta[5]),
  .I1(dpb_inst_23_douta[5]),
  .S0(dff_q_1)
);
MUX2 mux_inst_17 (
  .O(douta[5]),
  .I0(mux_o_15),
  .I1(mux_o_16),
  .S0(dff_q_0)
);
MUX2 mux_inst_18 (
  .O(mux_o_18),
  .I0(dpb_inst_24_douta[6]),
  .I1(dpb_inst_25_douta[6]),
  .S0(dff_q_1)
);
MUX2 mux_inst_19 (
  .O(mux_o_19),
  .I0(dpb_inst_26_douta[6]),
  .I1(dpb_inst_27_douta[6]),
  .S0(dff_q_1)
);
MUX2 mux_inst_20 (
  .O(douta[6]),
  .I0(mux_o_18),
  .I1(mux_o_19),
  .S0(dff_q_0)
);
MUX2 mux_inst_21 (
  .O(mux_o_21),
  .I0(dpb_inst_28_douta[7]),
  .I1(dpb_inst_29_douta[7]),
  .S0(dff_q_1)
);
MUX2 mux_inst_22 (
  .O(mux_o_22),
  .I0(dpb_inst_30_douta[7]),
  .I1(dpb_inst_31_douta[7]),
  .S0(dff_q_1)
);
MUX2 mux_inst_23 (
  .O(douta[7]),
  .I0(mux_o_21),
  .I1(mux_o_22),
  .S0(dff_q_0)
);
MUX2 mux_inst_24 (
  .O(mux_o_24),
  .I0(dpb_inst_0_doutb[0]),
  .I1(dpb_inst_1_doutb[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_25 (
  .O(mux_o_25),
  .I0(dpb_inst_2_doutb[0]),
  .I1(dpb_inst_3_doutb[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_26 (
  .O(doutb[0]),
  .I0(mux_o_24),
  .I1(mux_o_25),
  .S0(dff_q_2)
);
MUX2 mux_inst_27 (
  .O(mux_o_27),
  .I0(dpb_inst_4_doutb[1]),
  .I1(dpb_inst_5_doutb[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_28 (
  .O(mux_o_28),
  .I0(dpb_inst_6_doutb[1]),
  .I1(dpb_inst_7_doutb[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_29 (
  .O(doutb[1]),
  .I0(mux_o_27),
  .I1(mux_o_28),
  .S0(dff_q_2)
);
MUX2 mux_inst_30 (
  .O(mux_o_30),
  .I0(dpb_inst_8_doutb[2]),
  .I1(dpb_inst_9_doutb[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_31 (
  .O(mux_o_31),
  .I0(dpb_inst_10_doutb[2]),
  .I1(dpb_inst_11_doutb[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_32 (
  .O(doutb[2]),
  .I0(mux_o_30),
  .I1(mux_o_31),
  .S0(dff_q_2)
);
MUX2 mux_inst_33 (
  .O(mux_o_33),
  .I0(dpb_inst_12_doutb[3]),
  .I1(dpb_inst_13_doutb[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_34 (
  .O(mux_o_34),
  .I0(dpb_inst_14_doutb[3]),
  .I1(dpb_inst_15_doutb[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_35 (
  .O(doutb[3]),
  .I0(mux_o_33),
  .I1(mux_o_34),
  .S0(dff_q_2)
);
MUX2 mux_inst_36 (
  .O(mux_o_36),
  .I0(dpb_inst_16_doutb[4]),
  .I1(dpb_inst_17_doutb[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_37 (
  .O(mux_o_37),
  .I0(dpb_inst_18_doutb[4]),
  .I1(dpb_inst_19_doutb[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_38 (
  .O(doutb[4]),
  .I0(mux_o_36),
  .I1(mux_o_37),
  .S0(dff_q_2)
);
MUX2 mux_inst_39 (
  .O(mux_o_39),
  .I0(dpb_inst_20_doutb[5]),
  .I1(dpb_inst_21_doutb[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_40 (
  .O(mux_o_40),
  .I0(dpb_inst_22_doutb[5]),
  .I1(dpb_inst_23_doutb[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_41 (
  .O(doutb[5]),
  .I0(mux_o_39),
  .I1(mux_o_40),
  .S0(dff_q_2)
);
MUX2 mux_inst_42 (
  .O(mux_o_42),
  .I0(dpb_inst_24_doutb[6]),
  .I1(dpb_inst_25_doutb[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_43 (
  .O(mux_o_43),
  .I0(dpb_inst_26_doutb[6]),
  .I1(dpb_inst_27_doutb[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_44 (
  .O(doutb[6]),
  .I0(mux_o_42),
  .I1(mux_o_43),
  .S0(dff_q_2)
);
MUX2 mux_inst_45 (
  .O(mux_o_45),
  .I0(dpb_inst_28_doutb[7]),
  .I1(dpb_inst_29_doutb[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_46 (
  .O(mux_o_46),
  .I0(dpb_inst_30_doutb[7]),
  .I1(dpb_inst_31_doutb[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_47 (
  .O(doutb[7]),
  .I0(mux_o_45),
  .I1(mux_o_46),
  .S0(dff_q_2)
);
endmodule //blk_mem_gen_1
