// This program was cloned from: https://github.com/hacksterous/Zed80
// License: GNU General Public License v3.0

//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//Tool Version: V1.9.9.02
//Part Number: GW2AR-LV18QN88C8/I7
//Device: GW2AR-18
//Created Time: Thu May  9 10:42:58 2024

module RAM56k (dout, clk, oce, ce, reset, wre, ad, din);

output [7:0] dout;
input clk;
input oce;
input ce;
input reset;
input wre;
input [15:0] ad;
input [7:0] din;

wire [30:0] sp_inst_0_dout_w;
wire [0:0] sp_inst_0_dout;
wire [30:0] sp_inst_1_dout_w;
wire [0:0] sp_inst_1_dout;
wire [30:0] sp_inst_2_dout_w;
wire [1:1] sp_inst_2_dout;
wire [30:0] sp_inst_3_dout_w;
wire [1:1] sp_inst_3_dout;
wire [30:0] sp_inst_4_dout_w;
wire [0:0] sp_inst_4_dout;
wire [30:0] sp_inst_5_dout_w;
wire [1:1] sp_inst_5_dout;
wire [29:0] sp_inst_6_dout_w;
wire [1:0] sp_inst_6_dout;
wire [30:0] sp_inst_7_dout_w;
wire [2:2] sp_inst_7_dout;
wire [30:0] sp_inst_8_dout_w;
wire [2:2] sp_inst_8_dout;
wire [30:0] sp_inst_9_dout_w;
wire [3:3] sp_inst_9_dout;
wire [30:0] sp_inst_10_dout_w;
wire [3:3] sp_inst_10_dout;
wire [30:0] sp_inst_11_dout_w;
wire [2:2] sp_inst_11_dout;
wire [30:0] sp_inst_12_dout_w;
wire [3:3] sp_inst_12_dout;
wire [29:0] sp_inst_13_dout_w;
wire [3:2] sp_inst_13_dout;
wire [30:0] sp_inst_14_dout_w;
wire [4:4] sp_inst_14_dout;
wire [30:0] sp_inst_15_dout_w;
wire [4:4] sp_inst_15_dout;
wire [30:0] sp_inst_16_dout_w;
wire [5:5] sp_inst_16_dout;
wire [30:0] sp_inst_17_dout_w;
wire [5:5] sp_inst_17_dout;
wire [30:0] sp_inst_18_dout_w;
wire [4:4] sp_inst_18_dout;
wire [30:0] sp_inst_19_dout_w;
wire [5:5] sp_inst_19_dout;
wire [29:0] sp_inst_20_dout_w;
wire [5:4] sp_inst_20_dout;
wire [30:0] sp_inst_21_dout_w;
wire [6:6] sp_inst_21_dout;
wire [30:0] sp_inst_22_dout_w;
wire [6:6] sp_inst_22_dout;
wire [30:0] sp_inst_23_dout_w;
wire [7:7] sp_inst_23_dout;
wire [30:0] sp_inst_24_dout_w;
wire [7:7] sp_inst_24_dout;
wire [30:0] sp_inst_25_dout_w;
wire [6:6] sp_inst_25_dout;
wire [30:0] sp_inst_26_dout_w;
wire [7:7] sp_inst_26_dout;
wire [29:0] sp_inst_27_dout_w;
wire [7:6] sp_inst_27_dout;
wire dff_q_0;
wire dff_q_1;
wire mux_o_4;
wire mux_o_5;
wire mux_o_11;
wire mux_o_12;
wire mux_o_18;
wire mux_o_19;
wire mux_o_25;
wire mux_o_26;
wire mux_o_32;
wire mux_o_33;
wire mux_o_39;
wire mux_o_40;
wire mux_o_46;
wire mux_o_47;
wire mux_o_53;
wire mux_o_54;
wire ce_w;
wire gw_gnd;

assign ce_w = ~wre & ce;
assign gw_gnd = 1'b0;

SP sp_inst_0 (
    .DO({sp_inst_0_dout_w[30:0],sp_inst_0_dout[0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[0]})
);

defparam sp_inst_0.READ_MODE = 1'b0;
defparam sp_inst_0.WRITE_MODE = 2'b00;
defparam sp_inst_0.BIT_WIDTH = 1;
defparam sp_inst_0.BLK_SEL = 3'b000;
defparam sp_inst_0.RESET_MODE = "SYNC";

SP sp_inst_1 (
    .DO({sp_inst_1_dout_w[30:0],sp_inst_1_dout[0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[0]})
);

defparam sp_inst_1.READ_MODE = 1'b0;
defparam sp_inst_1.WRITE_MODE = 2'b00;
defparam sp_inst_1.BIT_WIDTH = 1;
defparam sp_inst_1.BLK_SEL = 3'b001;
defparam sp_inst_1.RESET_MODE = "SYNC";

SP sp_inst_2 (
    .DO({sp_inst_2_dout_w[30:0],sp_inst_2_dout[1]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[1]})
);

defparam sp_inst_2.READ_MODE = 1'b0;
defparam sp_inst_2.WRITE_MODE = 2'b00;
defparam sp_inst_2.BIT_WIDTH = 1;
defparam sp_inst_2.BLK_SEL = 3'b000;
defparam sp_inst_2.RESET_MODE = "SYNC";

SP sp_inst_3 (
    .DO({sp_inst_3_dout_w[30:0],sp_inst_3_dout[1]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[1]})
);

defparam sp_inst_3.READ_MODE = 1'b0;
defparam sp_inst_3.WRITE_MODE = 2'b00;
defparam sp_inst_3.BIT_WIDTH = 1;
defparam sp_inst_3.BLK_SEL = 3'b001;
defparam sp_inst_3.RESET_MODE = "SYNC";

SP sp_inst_4 (
    .DO({sp_inst_4_dout_w[30:0],sp_inst_4_dout[0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[0]})
);

defparam sp_inst_4.READ_MODE = 1'b0;
defparam sp_inst_4.WRITE_MODE = 2'b00;
defparam sp_inst_4.BIT_WIDTH = 1;
defparam sp_inst_4.BLK_SEL = 3'b010;
defparam sp_inst_4.RESET_MODE = "SYNC";

SP sp_inst_5 (
    .DO({sp_inst_5_dout_w[30:0],sp_inst_5_dout[1]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[1]})
);

defparam sp_inst_5.READ_MODE = 1'b0;
defparam sp_inst_5.WRITE_MODE = 2'b00;
defparam sp_inst_5.BIT_WIDTH = 1;
defparam sp_inst_5.BLK_SEL = 3'b010;
defparam sp_inst_5.RESET_MODE = "SYNC";

SP sp_inst_6 (
    .DO({sp_inst_6_dout_w[29:0],sp_inst_6_dout[1:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[15],ad[14],ad[13]}),
    .AD({ad[12:0],gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[1:0]})
);

defparam sp_inst_6.READ_MODE = 1'b0;
defparam sp_inst_6.WRITE_MODE = 2'b00;
defparam sp_inst_6.BIT_WIDTH = 2;
defparam sp_inst_6.BLK_SEL = 3'b110;
defparam sp_inst_6.RESET_MODE = "SYNC";

SP sp_inst_7 (
    .DO({sp_inst_7_dout_w[30:0],sp_inst_7_dout[2]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[2]})
);

defparam sp_inst_7.READ_MODE = 1'b0;
defparam sp_inst_7.WRITE_MODE = 2'b00;
defparam sp_inst_7.BIT_WIDTH = 1;
defparam sp_inst_7.BLK_SEL = 3'b000;
defparam sp_inst_7.RESET_MODE = "SYNC";

SP sp_inst_8 (
    .DO({sp_inst_8_dout_w[30:0],sp_inst_8_dout[2]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[2]})
);

defparam sp_inst_8.READ_MODE = 1'b0;
defparam sp_inst_8.WRITE_MODE = 2'b00;
defparam sp_inst_8.BIT_WIDTH = 1;
defparam sp_inst_8.BLK_SEL = 3'b001;
defparam sp_inst_8.RESET_MODE = "SYNC";

SP sp_inst_9 (
    .DO({sp_inst_9_dout_w[30:0],sp_inst_9_dout[3]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3]})
);

defparam sp_inst_9.READ_MODE = 1'b0;
defparam sp_inst_9.WRITE_MODE = 2'b00;
defparam sp_inst_9.BIT_WIDTH = 1;
defparam sp_inst_9.BLK_SEL = 3'b000;
defparam sp_inst_9.RESET_MODE = "SYNC";

SP sp_inst_10 (
    .DO({sp_inst_10_dout_w[30:0],sp_inst_10_dout[3]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3]})
);

defparam sp_inst_10.READ_MODE = 1'b0;
defparam sp_inst_10.WRITE_MODE = 2'b00;
defparam sp_inst_10.BIT_WIDTH = 1;
defparam sp_inst_10.BLK_SEL = 3'b001;
defparam sp_inst_10.RESET_MODE = "SYNC";

SP sp_inst_11 (
    .DO({sp_inst_11_dout_w[30:0],sp_inst_11_dout[2]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[2]})
);

defparam sp_inst_11.READ_MODE = 1'b0;
defparam sp_inst_11.WRITE_MODE = 2'b00;
defparam sp_inst_11.BIT_WIDTH = 1;
defparam sp_inst_11.BLK_SEL = 3'b010;
defparam sp_inst_11.RESET_MODE = "SYNC";

SP sp_inst_12 (
    .DO({sp_inst_12_dout_w[30:0],sp_inst_12_dout[3]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3]})
);

defparam sp_inst_12.READ_MODE = 1'b0;
defparam sp_inst_12.WRITE_MODE = 2'b00;
defparam sp_inst_12.BIT_WIDTH = 1;
defparam sp_inst_12.BLK_SEL = 3'b010;
defparam sp_inst_12.RESET_MODE = "SYNC";

SP sp_inst_13 (
    .DO({sp_inst_13_dout_w[29:0],sp_inst_13_dout[3:2]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[15],ad[14],ad[13]}),
    .AD({ad[12:0],gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3:2]})
);

defparam sp_inst_13.READ_MODE = 1'b0;
defparam sp_inst_13.WRITE_MODE = 2'b00;
defparam sp_inst_13.BIT_WIDTH = 2;
defparam sp_inst_13.BLK_SEL = 3'b110;
defparam sp_inst_13.RESET_MODE = "SYNC";

SP sp_inst_14 (
    .DO({sp_inst_14_dout_w[30:0],sp_inst_14_dout[4]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[4]})
);

defparam sp_inst_14.READ_MODE = 1'b0;
defparam sp_inst_14.WRITE_MODE = 2'b00;
defparam sp_inst_14.BIT_WIDTH = 1;
defparam sp_inst_14.BLK_SEL = 3'b000;
defparam sp_inst_14.RESET_MODE = "SYNC";

SP sp_inst_15 (
    .DO({sp_inst_15_dout_w[30:0],sp_inst_15_dout[4]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[4]})
);

defparam sp_inst_15.READ_MODE = 1'b0;
defparam sp_inst_15.WRITE_MODE = 2'b00;
defparam sp_inst_15.BIT_WIDTH = 1;
defparam sp_inst_15.BLK_SEL = 3'b001;
defparam sp_inst_15.RESET_MODE = "SYNC";

SP sp_inst_16 (
    .DO({sp_inst_16_dout_w[30:0],sp_inst_16_dout[5]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[5]})
);

defparam sp_inst_16.READ_MODE = 1'b0;
defparam sp_inst_16.WRITE_MODE = 2'b00;
defparam sp_inst_16.BIT_WIDTH = 1;
defparam sp_inst_16.BLK_SEL = 3'b000;
defparam sp_inst_16.RESET_MODE = "SYNC";

SP sp_inst_17 (
    .DO({sp_inst_17_dout_w[30:0],sp_inst_17_dout[5]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[5]})
);

defparam sp_inst_17.READ_MODE = 1'b0;
defparam sp_inst_17.WRITE_MODE = 2'b00;
defparam sp_inst_17.BIT_WIDTH = 1;
defparam sp_inst_17.BLK_SEL = 3'b001;
defparam sp_inst_17.RESET_MODE = "SYNC";

SP sp_inst_18 (
    .DO({sp_inst_18_dout_w[30:0],sp_inst_18_dout[4]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[4]})
);

defparam sp_inst_18.READ_MODE = 1'b0;
defparam sp_inst_18.WRITE_MODE = 2'b00;
defparam sp_inst_18.BIT_WIDTH = 1;
defparam sp_inst_18.BLK_SEL = 3'b010;
defparam sp_inst_18.RESET_MODE = "SYNC";

SP sp_inst_19 (
    .DO({sp_inst_19_dout_w[30:0],sp_inst_19_dout[5]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[5]})
);

defparam sp_inst_19.READ_MODE = 1'b0;
defparam sp_inst_19.WRITE_MODE = 2'b00;
defparam sp_inst_19.BIT_WIDTH = 1;
defparam sp_inst_19.BLK_SEL = 3'b010;
defparam sp_inst_19.RESET_MODE = "SYNC";

SP sp_inst_20 (
    .DO({sp_inst_20_dout_w[29:0],sp_inst_20_dout[5:4]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[15],ad[14],ad[13]}),
    .AD({ad[12:0],gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[5:4]})
);

defparam sp_inst_20.READ_MODE = 1'b0;
defparam sp_inst_20.WRITE_MODE = 2'b00;
defparam sp_inst_20.BIT_WIDTH = 2;
defparam sp_inst_20.BLK_SEL = 3'b110;
defparam sp_inst_20.RESET_MODE = "SYNC";

SP sp_inst_21 (
    .DO({sp_inst_21_dout_w[30:0],sp_inst_21_dout[6]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[6]})
);

defparam sp_inst_21.READ_MODE = 1'b0;
defparam sp_inst_21.WRITE_MODE = 2'b00;
defparam sp_inst_21.BIT_WIDTH = 1;
defparam sp_inst_21.BLK_SEL = 3'b000;
defparam sp_inst_21.RESET_MODE = "SYNC";

SP sp_inst_22 (
    .DO({sp_inst_22_dout_w[30:0],sp_inst_22_dout[6]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[6]})
);

defparam sp_inst_22.READ_MODE = 1'b0;
defparam sp_inst_22.WRITE_MODE = 2'b00;
defparam sp_inst_22.BIT_WIDTH = 1;
defparam sp_inst_22.BLK_SEL = 3'b001;
defparam sp_inst_22.RESET_MODE = "SYNC";

SP sp_inst_23 (
    .DO({sp_inst_23_dout_w[30:0],sp_inst_23_dout[7]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7]})
);

defparam sp_inst_23.READ_MODE = 1'b0;
defparam sp_inst_23.WRITE_MODE = 2'b00;
defparam sp_inst_23.BIT_WIDTH = 1;
defparam sp_inst_23.BLK_SEL = 3'b000;
defparam sp_inst_23.RESET_MODE = "SYNC";

SP sp_inst_24 (
    .DO({sp_inst_24_dout_w[30:0],sp_inst_24_dout[7]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7]})
);

defparam sp_inst_24.READ_MODE = 1'b0;
defparam sp_inst_24.WRITE_MODE = 2'b00;
defparam sp_inst_24.BIT_WIDTH = 1;
defparam sp_inst_24.BLK_SEL = 3'b001;
defparam sp_inst_24.RESET_MODE = "SYNC";

SP sp_inst_25 (
    .DO({sp_inst_25_dout_w[30:0],sp_inst_25_dout[6]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[6]})
);

defparam sp_inst_25.READ_MODE = 1'b0;
defparam sp_inst_25.WRITE_MODE = 2'b00;
defparam sp_inst_25.BIT_WIDTH = 1;
defparam sp_inst_25.BLK_SEL = 3'b010;
defparam sp_inst_25.RESET_MODE = "SYNC";

SP sp_inst_26 (
    .DO({sp_inst_26_dout_w[30:0],sp_inst_26_dout[7]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7]})
);

defparam sp_inst_26.READ_MODE = 1'b0;
defparam sp_inst_26.WRITE_MODE = 2'b00;
defparam sp_inst_26.BIT_WIDTH = 1;
defparam sp_inst_26.BLK_SEL = 3'b010;
defparam sp_inst_26.RESET_MODE = "SYNC";

SP sp_inst_27 (
    .DO({sp_inst_27_dout_w[29:0],sp_inst_27_dout[7:6]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({ad[15],ad[14],ad[13]}),
    .AD({ad[12:0],gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7:6]})
);

defparam sp_inst_27.READ_MODE = 1'b0;
defparam sp_inst_27.WRITE_MODE = 2'b00;
defparam sp_inst_27.BIT_WIDTH = 2;
defparam sp_inst_27.BLK_SEL = 3'b110;
defparam sp_inst_27.RESET_MODE = "SYNC";

DFFE dff_inst_0 (
  .Q(dff_q_0),
  .D(ad[15]),
  .CLK(clk),
  .CE(ce_w)
);
DFFE dff_inst_1 (
  .Q(dff_q_1),
  .D(ad[14]),
  .CLK(clk),
  .CE(ce_w)
);
MUX2 mux_inst_4 (
  .O(mux_o_4),
  .I0(sp_inst_0_dout[0]),
  .I1(sp_inst_1_dout[0]),
  .S0(dff_q_1)
);
MUX2 mux_inst_5 (
  .O(mux_o_5),
  .I0(sp_inst_4_dout[0]),
  .I1(sp_inst_6_dout[0]),
  .S0(dff_q_1)
);
MUX2 mux_inst_6 (
  .O(dout[0]),
  .I0(mux_o_4),
  .I1(mux_o_5),
  .S0(dff_q_0)
);
MUX2 mux_inst_11 (
  .O(mux_o_11),
  .I0(sp_inst_2_dout[1]),
  .I1(sp_inst_3_dout[1]),
  .S0(dff_q_1)
);
MUX2 mux_inst_12 (
  .O(mux_o_12),
  .I0(sp_inst_5_dout[1]),
  .I1(sp_inst_6_dout[1]),
  .S0(dff_q_1)
);
MUX2 mux_inst_13 (
  .O(dout[1]),
  .I0(mux_o_11),
  .I1(mux_o_12),
  .S0(dff_q_0)
);
MUX2 mux_inst_18 (
  .O(mux_o_18),
  .I0(sp_inst_7_dout[2]),
  .I1(sp_inst_8_dout[2]),
  .S0(dff_q_1)
);
MUX2 mux_inst_19 (
  .O(mux_o_19),
  .I0(sp_inst_11_dout[2]),
  .I1(sp_inst_13_dout[2]),
  .S0(dff_q_1)
);
MUX2 mux_inst_20 (
  .O(dout[2]),
  .I0(mux_o_18),
  .I1(mux_o_19),
  .S0(dff_q_0)
);
MUX2 mux_inst_25 (
  .O(mux_o_25),
  .I0(sp_inst_9_dout[3]),
  .I1(sp_inst_10_dout[3]),
  .S0(dff_q_1)
);
MUX2 mux_inst_26 (
  .O(mux_o_26),
  .I0(sp_inst_12_dout[3]),
  .I1(sp_inst_13_dout[3]),
  .S0(dff_q_1)
);
MUX2 mux_inst_27 (
  .O(dout[3]),
  .I0(mux_o_25),
  .I1(mux_o_26),
  .S0(dff_q_0)
);
MUX2 mux_inst_32 (
  .O(mux_o_32),
  .I0(sp_inst_14_dout[4]),
  .I1(sp_inst_15_dout[4]),
  .S0(dff_q_1)
);
MUX2 mux_inst_33 (
  .O(mux_o_33),
  .I0(sp_inst_18_dout[4]),
  .I1(sp_inst_20_dout[4]),
  .S0(dff_q_1)
);
MUX2 mux_inst_34 (
  .O(dout[4]),
  .I0(mux_o_32),
  .I1(mux_o_33),
  .S0(dff_q_0)
);
MUX2 mux_inst_39 (
  .O(mux_o_39),
  .I0(sp_inst_16_dout[5]),
  .I1(sp_inst_17_dout[5]),
  .S0(dff_q_1)
);
MUX2 mux_inst_40 (
  .O(mux_o_40),
  .I0(sp_inst_19_dout[5]),
  .I1(sp_inst_20_dout[5]),
  .S0(dff_q_1)
);
MUX2 mux_inst_41 (
  .O(dout[5]),
  .I0(mux_o_39),
  .I1(mux_o_40),
  .S0(dff_q_0)
);
MUX2 mux_inst_46 (
  .O(mux_o_46),
  .I0(sp_inst_21_dout[6]),
  .I1(sp_inst_22_dout[6]),
  .S0(dff_q_1)
);
MUX2 mux_inst_47 (
  .O(mux_o_47),
  .I0(sp_inst_25_dout[6]),
  .I1(sp_inst_27_dout[6]),
  .S0(dff_q_1)
);
MUX2 mux_inst_48 (
  .O(dout[6]),
  .I0(mux_o_46),
  .I1(mux_o_47),
  .S0(dff_q_0)
);
MUX2 mux_inst_53 (
  .O(mux_o_53),
  .I0(sp_inst_23_dout[7]),
  .I1(sp_inst_24_dout[7]),
  .S0(dff_q_1)
);
MUX2 mux_inst_54 (
  .O(mux_o_54),
  .I0(sp_inst_26_dout[7]),
  .I1(sp_inst_27_dout[7]),
  .S0(dff_q_1)
);
MUX2 mux_inst_55 (
  .O(dout[7]),
  .I0(mux_o_53),
  .I1(mux_o_54),
  .S0(dff_q_0)
);
endmodule //RAM56k
