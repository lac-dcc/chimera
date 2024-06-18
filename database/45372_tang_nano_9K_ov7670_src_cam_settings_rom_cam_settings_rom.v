// This program was cloned from: https://github.com/phoenix367/tang_nano_9K_ov7670
// License: MIT License

//Copyright (C)2014-2023 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//GOWIN Version: V1.9.9 Beta-4
//Part Number: GW1NR-LV9QN88PC6/I5
//Device: GW1NR-9
//Device Version: C
//Created Time: Thu Oct 19 21:37:14 2023

module cam_settings_rom (dout, ad);

output [15:0] dout;
input [6:0] ad;

wire [0:0] rom16_inst_0_dout;
wire [1:1] rom16_inst_1_dout;
wire [2:2] rom16_inst_2_dout;
wire [3:3] rom16_inst_3_dout;
wire [4:4] rom16_inst_4_dout;
wire [5:5] rom16_inst_5_dout;
wire [6:6] rom16_inst_6_dout;
wire [7:7] rom16_inst_7_dout;
wire [8:8] rom16_inst_8_dout;
wire [9:9] rom16_inst_9_dout;
wire [10:10] rom16_inst_10_dout;
wire [11:11] rom16_inst_11_dout;
wire [12:12] rom16_inst_12_dout;
wire [13:13] rom16_inst_13_dout;
wire [14:14] rom16_inst_14_dout;
wire [15:15] rom16_inst_15_dout;
wire [0:0] rom16_inst_16_dout;
wire [1:1] rom16_inst_17_dout;
wire [2:2] rom16_inst_18_dout;
wire [3:3] rom16_inst_19_dout;
wire [4:4] rom16_inst_20_dout;
wire [5:5] rom16_inst_21_dout;
wire [6:6] rom16_inst_22_dout;
wire [7:7] rom16_inst_23_dout;
wire [8:8] rom16_inst_24_dout;
wire [9:9] rom16_inst_25_dout;
wire [10:10] rom16_inst_26_dout;
wire [11:11] rom16_inst_27_dout;
wire [12:12] rom16_inst_28_dout;
wire [13:13] rom16_inst_29_dout;
wire [14:14] rom16_inst_30_dout;
wire [15:15] rom16_inst_31_dout;
wire [0:0] rom16_inst_32_dout;
wire [1:1] rom16_inst_33_dout;
wire [2:2] rom16_inst_34_dout;
wire [3:3] rom16_inst_35_dout;
wire [4:4] rom16_inst_36_dout;
wire [5:5] rom16_inst_37_dout;
wire [6:6] rom16_inst_38_dout;
wire [7:7] rom16_inst_39_dout;
wire [8:8] rom16_inst_40_dout;
wire [9:9] rom16_inst_41_dout;
wire [10:10] rom16_inst_42_dout;
wire [11:11] rom16_inst_43_dout;
wire [12:12] rom16_inst_44_dout;
wire [13:13] rom16_inst_45_dout;
wire [14:14] rom16_inst_46_dout;
wire [15:15] rom16_inst_47_dout;
wire [0:0] rom16_inst_48_dout;
wire [1:1] rom16_inst_49_dout;
wire [2:2] rom16_inst_50_dout;
wire [3:3] rom16_inst_51_dout;
wire [4:4] rom16_inst_52_dout;
wire [5:5] rom16_inst_53_dout;
wire [6:6] rom16_inst_54_dout;
wire [7:7] rom16_inst_55_dout;
wire [8:8] rom16_inst_56_dout;
wire [9:9] rom16_inst_57_dout;
wire [10:10] rom16_inst_58_dout;
wire [11:11] rom16_inst_59_dout;
wire [12:12] rom16_inst_60_dout;
wire [13:13] rom16_inst_61_dout;
wire [14:14] rom16_inst_62_dout;
wire [15:15] rom16_inst_63_dout;
wire [0:0] rom16_inst_64_dout;
wire [1:1] rom16_inst_65_dout;
wire [2:2] rom16_inst_66_dout;
wire [3:3] rom16_inst_67_dout;
wire [4:4] rom16_inst_68_dout;
wire [5:5] rom16_inst_69_dout;
wire [6:6] rom16_inst_70_dout;
wire [7:7] rom16_inst_71_dout;
wire [8:8] rom16_inst_72_dout;
wire [9:9] rom16_inst_73_dout;
wire [10:10] rom16_inst_74_dout;
wire [11:11] rom16_inst_75_dout;
wire [12:12] rom16_inst_76_dout;
wire [13:13] rom16_inst_77_dout;
wire [14:14] rom16_inst_78_dout;
wire [15:15] rom16_inst_79_dout;
wire mux_o_0;
wire mux_o_1;
wire mux_o_3;
wire mux_o_6;
wire mux_o_7;
wire mux_o_9;
wire mux_o_12;
wire mux_o_13;
wire mux_o_15;
wire mux_o_18;
wire mux_o_19;
wire mux_o_21;
wire mux_o_24;
wire mux_o_25;
wire mux_o_27;
wire mux_o_30;
wire mux_o_31;
wire mux_o_33;
wire mux_o_36;
wire mux_o_37;
wire mux_o_39;
wire mux_o_42;
wire mux_o_43;
wire mux_o_45;
wire mux_o_48;
wire mux_o_49;
wire mux_o_51;
wire mux_o_54;
wire mux_o_55;
wire mux_o_57;
wire mux_o_60;
wire mux_o_61;
wire mux_o_63;
wire mux_o_66;
wire mux_o_67;
wire mux_o_69;
wire mux_o_72;
wire mux_o_73;
wire mux_o_75;
wire mux_o_78;
wire mux_o_79;
wire mux_o_81;
wire mux_o_84;
wire mux_o_85;
wire mux_o_87;
wire mux_o_90;
wire mux_o_91;
wire mux_o_93;

ROM16 rom16_inst_0 (
    .DO(rom16_inst_0_dout[0]),
    .AD(ad[3:0])
);

defparam rom16_inst_0.INIT_0 = 16'h6C00;

ROM16 rom16_inst_1 (
    .DO(rom16_inst_1_dout[1]),
    .AD(ad[3:0])
);

defparam rom16_inst_1.INIT_0 = 16'h4C00;

ROM16 rom16_inst_2 (
    .DO(rom16_inst_2_dout[2]),
    .AD(ad[3:0])
);

defparam rom16_inst_2.INIT_0 = 16'hE104;

ROM16 rom16_inst_3 (
    .DO(rom16_inst_3_dout[3]),
    .AD(ad[3:0])
);

defparam rom16_inst_3.INIT_0 = 16'h2200;

ROM16 rom16_inst_4 (
    .DO(rom16_inst_4_dout[4]),
    .AD(ad[3:0])
);

defparam rom16_inst_4.INIT_0 = 16'h2E82;

ROM16 rom16_inst_5 (
    .DO(rom16_inst_5_dout[5]),
    .AD(ad[3:0])
);

defparam rom16_inst_5.INIT_0 = 16'hEC02;

ROM16 rom16_inst_6 (
    .DO(rom16_inst_6_dout[6]),
    .AD(ad[3:0])
);

defparam rom16_inst_6.INIT_0 = 16'h8082;

ROM16 rom16_inst_7 (
    .DO(rom16_inst_7_dout[7]),
    .AD(ad[3:0])
);

defparam rom16_inst_7.INIT_0 = 16'hCC8B;

ROM16 rom16_inst_8 (
    .DO(rom16_inst_8_dout[8]),
    .AD(ad[3:0])
);

defparam rom16_inst_8.INIT_0 = 16'h540A;

ROM16 rom16_inst_9 (
    .DO(rom16_inst_9_dout[9]),
    .AD(ad[3:0])
);

defparam rom16_inst_9.INIT_0 = 16'h6527;

ROM16 rom16_inst_10 (
    .DO(rom16_inst_10_dout[10]),
    .AD(ad[3:0])
);

defparam rom16_inst_10.INIT_0 = 16'h8672;

ROM16 rom16_inst_11 (
    .DO(rom16_inst_11_dout[11]),
    .AD(ad[3:0])
);

defparam rom16_inst_11.INIT_0 = 16'h0532;

ROM16 rom16_inst_12 (
    .DO(rom16_inst_12_dout[12]),
    .AD(ad[3:0])
);

defparam rom16_inst_12.INIT_0 = 16'hFB2F;

ROM16 rom16_inst_13 (
    .DO(rom16_inst_13_dout[13]),
    .AD(ad[3:0])
);

defparam rom16_inst_13.INIT_0 = 16'h0122;

ROM16 rom16_inst_14 (
    .DO(rom16_inst_14_dout[14]),
    .AD(ad[3:0])
);

defparam rom16_inst_14.INIT_0 = 16'hFC82;

ROM16 rom16_inst_15 (
    .DO(rom16_inst_15_dout[15]),
    .AD(ad[3:0])
);

defparam rom16_inst_15.INIT_0 = 16'h0002;

ROM16 rom16_inst_16 (
    .DO(rom16_inst_16_dout[0]),
    .AD(ad[3:0])
);

defparam rom16_inst_16.INIT_0 = 16'h0560;

ROM16 rom16_inst_17 (
    .DO(rom16_inst_17_dout[1]),
    .AD(ad[3:0])
);

defparam rom16_inst_17.INIT_0 = 16'h04E9;

ROM16 rom16_inst_18 (
    .DO(rom16_inst_18_dout[2]),
    .AD(ad[3:0])
);

defparam rom16_inst_18.INIT_0 = 16'hC005;

ROM16 rom16_inst_19 (
    .DO(rom16_inst_19_dout[3]),
    .AD(ad[3:0])
);

defparam rom16_inst_19.INIT_0 = 16'h8CC1;

ROM16 rom16_inst_20 (
    .DO(rom16_inst_20_dout[4]),
    .AD(ad[3:0])
);

defparam rom16_inst_20.INIT_0 = 16'h0845;

ROM16 rom16_inst_21 (
    .DO(rom16_inst_21_dout[5]),
    .AD(ad[3:0])
);

defparam rom16_inst_21.INIT_0 = 16'h0840;

ROM16 rom16_inst_22 (
    .DO(rom16_inst_22_dout[6]),
    .AD(ad[3:0])
);

defparam rom16_inst_22.INIT_0 = 16'h0942;

ROM16 rom16_inst_23 (
    .DO(rom16_inst_23_dout[7]),
    .AD(ad[3:0])
);

defparam rom16_inst_23.INIT_0 = 16'h4013;

ROM16 rom16_inst_24 (
    .DO(rom16_inst_24_dout[8]),
    .AD(ad[3:0])
);

defparam rom16_inst_24.INIT_0 = 16'h95A6;

ROM16 rom16_inst_25 (
    .DO(rom16_inst_25_dout[9]),
    .AD(ad[3:0])
);

defparam rom16_inst_25.INIT_0 = 16'h07D4;

ROM16 rom16_inst_26 (
    .DO(rom16_inst_26_dout[10]),
    .AD(ad[3:0])
);

defparam rom16_inst_26.INIT_0 = 16'h2B06;

ROM16 rom16_inst_27 (
    .DO(rom16_inst_27_dout[11]),
    .AD(ad[3:0])
);

defparam rom16_inst_27.INIT_0 = 16'h1B6B;

ROM16 rom16_inst_28 (
    .DO(rom16_inst_28_dout[12]),
    .AD(ad[3:0])
);

defparam rom16_inst_28.INIT_0 = 16'hEE7F;

ROM16 rom16_inst_29 (
    .DO(rom16_inst_29_dout[13]),
    .AD(ad[3:0])
);

defparam rom16_inst_29.INIT_0 = 16'hFC12;

ROM16 rom16_inst_30 (
    .DO(rom16_inst_30_dout[14]),
    .AD(ad[3:0])
);

defparam rom16_inst_30.INIT_0 = 16'h3001;

ROM16 rom16_inst_31 (
    .DO(rom16_inst_31_dout[15]),
    .AD(ad[3:0])
);

defparam rom16_inst_31.INIT_0 = 16'hC000;

ROM16 rom16_inst_32 (
    .DO(rom16_inst_32_dout[0]),
    .AD(ad[3:0])
);

defparam rom16_inst_32.INIT_0 = 16'h1418;

ROM16 rom16_inst_33 (
    .DO(rom16_inst_33_dout[1]),
    .AD(ad[3:0])
);

defparam rom16_inst_33.INIT_0 = 16'h2A45;

ROM16 rom16_inst_34 (
    .DO(rom16_inst_34_dout[2]),
    .AD(ad[3:0])
);

defparam rom16_inst_34.INIT_0 = 16'h2609;

ROM16 rom16_inst_35 (
    .DO(rom16_inst_35_dout[3]),
    .AD(ad[3:0])
);

defparam rom16_inst_35.INIT_0 = 16'h9A05;

ROM16 rom16_inst_36 (
    .DO(rom16_inst_36_dout[4]),
    .AD(ad[3:0])
);

defparam rom16_inst_36.INIT_0 = 16'h2F3C;

ROM16 rom16_inst_37 (
    .DO(rom16_inst_37_dout[5]),
    .AD(ad[3:0])
);

defparam rom16_inst_37.INIT_0 = 16'h34AC;

ROM16 rom16_inst_38 (
    .DO(rom16_inst_38_dout[6]),
    .AD(ad[3:0])
);

defparam rom16_inst_38.INIT_0 = 16'h3820;

ROM16 rom16_inst_39 (
    .DO(rom16_inst_39_dout[7]),
    .AD(ad[3:0])
);

defparam rom16_inst_39.INIT_0 = 16'hC022;

ROM16 rom16_inst_40 (
    .DO(rom16_inst_40_dout[8]),
    .AD(ad[3:0])
);

defparam rom16_inst_40.INIT_0 = 16'h552A;

ROM16 rom16_inst_41 (
    .DO(rom16_inst_41_dout[9]),
    .AD(ad[3:0])
);

defparam rom16_inst_41.INIT_0 = 16'h99F3;

ROM16 rom16_inst_42 (
    .DO(rom16_inst_42_dout[10]),
    .AD(ad[3:0])
);

defparam rom16_inst_42.INIT_0 = 16'h1E00;

ROM16 rom16_inst_43 (
    .DO(rom16_inst_43_dout[11]),
    .AD(ad[3:0])
);

defparam rom16_inst_43.INIT_0 = 16'h1F80;

ROM16 rom16_inst_44 (
    .DO(rom16_inst_44_dout[12]),
    .AD(ad[3:0])
);

defparam rom16_inst_44.INIT_0 = 16'h1FBF;

ROM16 rom16_inst_45 (
    .DO(rom16_inst_45_dout[13]),
    .AD(ad[3:0])
);

defparam rom16_inst_45.INIT_0 = 16'h1FFF;

ROM16 rom16_inst_46 (
    .DO(rom16_inst_46_dout[14]),
    .AD(ad[3:0])
);

defparam rom16_inst_46.INIT_0 = 16'h1FBC;

ROM16 rom16_inst_47 (
    .DO(rom16_inst_47_dout[15]),
    .AD(ad[3:0])
);

defparam rom16_inst_47.INIT_0 = 16'hE043;

ROM16 rom16_inst_48 (
    .DO(rom16_inst_48_dout[0]),
    .AD(ad[3:0])
);

defparam rom16_inst_48.INIT_0 = 16'hF02D;

ROM16 rom16_inst_49 (
    .DO(rom16_inst_49_dout[1]),
    .AD(ad[3:0])
);

defparam rom16_inst_49.INIT_0 = 16'hA02F;

ROM16 rom16_inst_50 (
    .DO(rom16_inst_50_dout[2]),
    .AD(ad[3:0])
);

defparam rom16_inst_50.INIT_0 = 16'h703B;

ROM16 rom16_inst_51 (
    .DO(rom16_inst_51_dout[3]),
    .AD(ad[3:0])
);

defparam rom16_inst_51.INIT_0 = 16'h0849;

ROM16 rom16_inst_52 (
    .DO(rom16_inst_52_dout[4]),
    .AD(ad[3:0])
);

defparam rom16_inst_52.INIT_0 = 16'hC822;

ROM16 rom16_inst_53 (
    .DO(rom16_inst_53_dout[5]),
    .AD(ad[3:0])
);

defparam rom16_inst_53.INIT_0 = 16'h80CC;

ROM16 rom16_inst_54 (
    .DO(rom16_inst_54_dout[6]),
    .AD(ad[3:0])
);

defparam rom16_inst_54.INIT_0 = 16'h04F0;

ROM16 rom16_inst_55 (
    .DO(rom16_inst_55_dout[7]),
    .AD(ad[3:0])
);

defparam rom16_inst_55.INIT_0 = 16'h40FF;

ROM16 rom16_inst_56 (
    .DO(rom16_inst_56_dout[8]),
    .AD(ad[3:0])
);

defparam rom16_inst_56.INIT_0 = 16'hB4D5;

ROM16 rom16_inst_57 (
    .DO(rom16_inst_57_dout[9]),
    .AD(ad[3:0])
);

defparam rom16_inst_57.INIT_0 = 16'h2099;

ROM16 rom16_inst_58 (
    .DO(rom16_inst_58_dout[10]),
    .AD(ad[3:0])
);

defparam rom16_inst_58.INIT_0 = 16'hDC1E;

ROM16 rom16_inst_59 (
    .DO(rom16_inst_59_dout[11]),
    .AD(ad[3:0])
);

defparam rom16_inst_59.INIT_0 = 16'h2460;

ROM16 rom16_inst_60 (
    .DO(rom16_inst_60_dout[12]),
    .AD(ad[3:0])
);

defparam rom16_inst_60.INIT_0 = 16'h0A80;

ROM16 rom16_inst_61 (
    .DO(rom16_inst_61_dout[13]),
    .AD(ad[3:0])
);

defparam rom16_inst_61.INIT_0 = 16'hF000;

ROM16 rom16_inst_62 (
    .DO(rom16_inst_62_dout[14]),
    .AD(ad[3:0])
);

defparam rom16_inst_62.INIT_0 = 16'h0000;

ROM16 rom16_inst_63 (
    .DO(rom16_inst_63_dout[15]),
    .AD(ad[3:0])
);

defparam rom16_inst_63.INIT_0 = 16'h307F;

ROM16 rom16_inst_64 (
    .DO(rom16_inst_64_dout[0]),
    .AD(ad[3:0])
);

defparam rom16_inst_64.INIT_0 = 16'h0209;

ROM16 rom16_inst_65 (
    .DO(rom16_inst_65_dout[1]),
    .AD(ad[3:0])
);

defparam rom16_inst_65.INIT_0 = 16'h0009;

ROM16 rom16_inst_66 (
    .DO(rom16_inst_66_dout[2]),
    .AD(ad[3:0])
);

defparam rom16_inst_66.INIT_0 = 16'h0300;

ROM16 rom16_inst_67 (
    .DO(rom16_inst_67_dout[3]),
    .AD(ad[3:0])
);

defparam rom16_inst_67.INIT_0 = 16'h0036;

ROM16 rom16_inst_68 (
    .DO(rom16_inst_68_dout[4]),
    .AD(ad[3:0])
);

defparam rom16_inst_68.INIT_0 = 16'h01F2;

ROM16 rom16_inst_69 (
    .DO(rom16_inst_69_dout[5]),
    .AD(ad[3:0])
);

defparam rom16_inst_69.INIT_0 = 16'h0247;

ROM16 rom16_inst_70 (
    .DO(rom16_inst_70_dout[6]),
    .AD(ad[3:0])
);

defparam rom16_inst_70.INIT_0 = 16'h0277;

ROM16 rom16_inst_71 (
    .DO(rom16_inst_71_dout[7]),
    .AD(ad[3:0])
);

defparam rom16_inst_71.INIT_0 = 16'h03F1;

ROM16 rom16_inst_72 (
    .DO(rom16_inst_72_dout[8]),
    .AD(ad[3:0])
);

defparam rom16_inst_72.INIT_0 = 16'h02AA;

ROM16 rom16_inst_73 (
    .DO(rom16_inst_73_dout[9]),
    .AD(ad[3:0])
);

defparam rom16_inst_73.INIT_0 = 16'h0333;

ROM16 rom16_inst_74 (
    .DO(rom16_inst_74_dout[10]),
    .AD(ad[3:0])
);

defparam rom16_inst_74.INIT_0 = 16'h0033;

ROM16 rom16_inst_75 (
    .DO(rom16_inst_75_dout[11]),
    .AD(ad[3:0])
);

defparam rom16_inst_75.INIT_0 = 16'h01C2;

ROM16 rom16_inst_76 (
    .DO(rom16_inst_76_dout[12]),
    .AD(ad[3:0])
);

defparam rom16_inst_76.INIT_0 = 16'h0202;

ROM16 rom16_inst_77 (
    .DO(rom16_inst_77_dout[13]),
    .AD(ad[3:0])
);

defparam rom16_inst_77.INIT_0 = 16'h01FD;

ROM16 rom16_inst_78 (
    .DO(rom16_inst_78_dout[14]),
    .AD(ad[3:0])
);

defparam rom16_inst_78.INIT_0 = 16'h0000;

ROM16 rom16_inst_79 (
    .DO(rom16_inst_79_dout[15]),
    .AD(ad[3:0])
);

defparam rom16_inst_79.INIT_0 = 16'h01FE;

MUX2 mux_inst_0 (
  .O(mux_o_0),
  .I0(rom16_inst_0_dout[0]),
  .I1(rom16_inst_16_dout[0]),
  .S0(ad[4])
);
MUX2 mux_inst_1 (
  .O(mux_o_1),
  .I0(rom16_inst_32_dout[0]),
  .I1(rom16_inst_48_dout[0]),
  .S0(ad[4])
);
MUX2 mux_inst_3 (
  .O(mux_o_3),
  .I0(mux_o_0),
  .I1(mux_o_1),
  .S0(ad[5])
);
MUX2 mux_inst_5 (
  .O(dout[0]),
  .I0(mux_o_3),
  .I1(rom16_inst_64_dout[0]),
  .S0(ad[6])
);
MUX2 mux_inst_6 (
  .O(mux_o_6),
  .I0(rom16_inst_1_dout[1]),
  .I1(rom16_inst_17_dout[1]),
  .S0(ad[4])
);
MUX2 mux_inst_7 (
  .O(mux_o_7),
  .I0(rom16_inst_33_dout[1]),
  .I1(rom16_inst_49_dout[1]),
  .S0(ad[4])
);
MUX2 mux_inst_9 (
  .O(mux_o_9),
  .I0(mux_o_6),
  .I1(mux_o_7),
  .S0(ad[5])
);
MUX2 mux_inst_11 (
  .O(dout[1]),
  .I0(mux_o_9),
  .I1(rom16_inst_65_dout[1]),
  .S0(ad[6])
);
MUX2 mux_inst_12 (
  .O(mux_o_12),
  .I0(rom16_inst_2_dout[2]),
  .I1(rom16_inst_18_dout[2]),
  .S0(ad[4])
);
MUX2 mux_inst_13 (
  .O(mux_o_13),
  .I0(rom16_inst_34_dout[2]),
  .I1(rom16_inst_50_dout[2]),
  .S0(ad[4])
);
MUX2 mux_inst_15 (
  .O(mux_o_15),
  .I0(mux_o_12),
  .I1(mux_o_13),
  .S0(ad[5])
);
MUX2 mux_inst_17 (
  .O(dout[2]),
  .I0(mux_o_15),
  .I1(rom16_inst_66_dout[2]),
  .S0(ad[6])
);
MUX2 mux_inst_18 (
  .O(mux_o_18),
  .I0(rom16_inst_3_dout[3]),
  .I1(rom16_inst_19_dout[3]),
  .S0(ad[4])
);
MUX2 mux_inst_19 (
  .O(mux_o_19),
  .I0(rom16_inst_35_dout[3]),
  .I1(rom16_inst_51_dout[3]),
  .S0(ad[4])
);
MUX2 mux_inst_21 (
  .O(mux_o_21),
  .I0(mux_o_18),
  .I1(mux_o_19),
  .S0(ad[5])
);
MUX2 mux_inst_23 (
  .O(dout[3]),
  .I0(mux_o_21),
  .I1(rom16_inst_67_dout[3]),
  .S0(ad[6])
);
MUX2 mux_inst_24 (
  .O(mux_o_24),
  .I0(rom16_inst_4_dout[4]),
  .I1(rom16_inst_20_dout[4]),
  .S0(ad[4])
);
MUX2 mux_inst_25 (
  .O(mux_o_25),
  .I0(rom16_inst_36_dout[4]),
  .I1(rom16_inst_52_dout[4]),
  .S0(ad[4])
);
MUX2 mux_inst_27 (
  .O(mux_o_27),
  .I0(mux_o_24),
  .I1(mux_o_25),
  .S0(ad[5])
);
MUX2 mux_inst_29 (
  .O(dout[4]),
  .I0(mux_o_27),
  .I1(rom16_inst_68_dout[4]),
  .S0(ad[6])
);
MUX2 mux_inst_30 (
  .O(mux_o_30),
  .I0(rom16_inst_5_dout[5]),
  .I1(rom16_inst_21_dout[5]),
  .S0(ad[4])
);
MUX2 mux_inst_31 (
  .O(mux_o_31),
  .I0(rom16_inst_37_dout[5]),
  .I1(rom16_inst_53_dout[5]),
  .S0(ad[4])
);
MUX2 mux_inst_33 (
  .O(mux_o_33),
  .I0(mux_o_30),
  .I1(mux_o_31),
  .S0(ad[5])
);
MUX2 mux_inst_35 (
  .O(dout[5]),
  .I0(mux_o_33),
  .I1(rom16_inst_69_dout[5]),
  .S0(ad[6])
);
MUX2 mux_inst_36 (
  .O(mux_o_36),
  .I0(rom16_inst_6_dout[6]),
  .I1(rom16_inst_22_dout[6]),
  .S0(ad[4])
);
MUX2 mux_inst_37 (
  .O(mux_o_37),
  .I0(rom16_inst_38_dout[6]),
  .I1(rom16_inst_54_dout[6]),
  .S0(ad[4])
);
MUX2 mux_inst_39 (
  .O(mux_o_39),
  .I0(mux_o_36),
  .I1(mux_o_37),
  .S0(ad[5])
);
MUX2 mux_inst_41 (
  .O(dout[6]),
  .I0(mux_o_39),
  .I1(rom16_inst_70_dout[6]),
  .S0(ad[6])
);
MUX2 mux_inst_42 (
  .O(mux_o_42),
  .I0(rom16_inst_7_dout[7]),
  .I1(rom16_inst_23_dout[7]),
  .S0(ad[4])
);
MUX2 mux_inst_43 (
  .O(mux_o_43),
  .I0(rom16_inst_39_dout[7]),
  .I1(rom16_inst_55_dout[7]),
  .S0(ad[4])
);
MUX2 mux_inst_45 (
  .O(mux_o_45),
  .I0(mux_o_42),
  .I1(mux_o_43),
  .S0(ad[5])
);
MUX2 mux_inst_47 (
  .O(dout[7]),
  .I0(mux_o_45),
  .I1(rom16_inst_71_dout[7]),
  .S0(ad[6])
);
MUX2 mux_inst_48 (
  .O(mux_o_48),
  .I0(rom16_inst_8_dout[8]),
  .I1(rom16_inst_24_dout[8]),
  .S0(ad[4])
);
MUX2 mux_inst_49 (
  .O(mux_o_49),
  .I0(rom16_inst_40_dout[8]),
  .I1(rom16_inst_56_dout[8]),
  .S0(ad[4])
);
MUX2 mux_inst_51 (
  .O(mux_o_51),
  .I0(mux_o_48),
  .I1(mux_o_49),
  .S0(ad[5])
);
MUX2 mux_inst_53 (
  .O(dout[8]),
  .I0(mux_o_51),
  .I1(rom16_inst_72_dout[8]),
  .S0(ad[6])
);
MUX2 mux_inst_54 (
  .O(mux_o_54),
  .I0(rom16_inst_9_dout[9]),
  .I1(rom16_inst_25_dout[9]),
  .S0(ad[4])
);
MUX2 mux_inst_55 (
  .O(mux_o_55),
  .I0(rom16_inst_41_dout[9]),
  .I1(rom16_inst_57_dout[9]),
  .S0(ad[4])
);
MUX2 mux_inst_57 (
  .O(mux_o_57),
  .I0(mux_o_54),
  .I1(mux_o_55),
  .S0(ad[5])
);
MUX2 mux_inst_59 (
  .O(dout[9]),
  .I0(mux_o_57),
  .I1(rom16_inst_73_dout[9]),
  .S0(ad[6])
);
MUX2 mux_inst_60 (
  .O(mux_o_60),
  .I0(rom16_inst_10_dout[10]),
  .I1(rom16_inst_26_dout[10]),
  .S0(ad[4])
);
MUX2 mux_inst_61 (
  .O(mux_o_61),
  .I0(rom16_inst_42_dout[10]),
  .I1(rom16_inst_58_dout[10]),
  .S0(ad[4])
);
MUX2 mux_inst_63 (
  .O(mux_o_63),
  .I0(mux_o_60),
  .I1(mux_o_61),
  .S0(ad[5])
);
MUX2 mux_inst_65 (
  .O(dout[10]),
  .I0(mux_o_63),
  .I1(rom16_inst_74_dout[10]),
  .S0(ad[6])
);
MUX2 mux_inst_66 (
  .O(mux_o_66),
  .I0(rom16_inst_11_dout[11]),
  .I1(rom16_inst_27_dout[11]),
  .S0(ad[4])
);
MUX2 mux_inst_67 (
  .O(mux_o_67),
  .I0(rom16_inst_43_dout[11]),
  .I1(rom16_inst_59_dout[11]),
  .S0(ad[4])
);
MUX2 mux_inst_69 (
  .O(mux_o_69),
  .I0(mux_o_66),
  .I1(mux_o_67),
  .S0(ad[5])
);
MUX2 mux_inst_71 (
  .O(dout[11]),
  .I0(mux_o_69),
  .I1(rom16_inst_75_dout[11]),
  .S0(ad[6])
);
MUX2 mux_inst_72 (
  .O(mux_o_72),
  .I0(rom16_inst_12_dout[12]),
  .I1(rom16_inst_28_dout[12]),
  .S0(ad[4])
);
MUX2 mux_inst_73 (
  .O(mux_o_73),
  .I0(rom16_inst_44_dout[12]),
  .I1(rom16_inst_60_dout[12]),
  .S0(ad[4])
);
MUX2 mux_inst_75 (
  .O(mux_o_75),
  .I0(mux_o_72),
  .I1(mux_o_73),
  .S0(ad[5])
);
MUX2 mux_inst_77 (
  .O(dout[12]),
  .I0(mux_o_75),
  .I1(rom16_inst_76_dout[12]),
  .S0(ad[6])
);
MUX2 mux_inst_78 (
  .O(mux_o_78),
  .I0(rom16_inst_13_dout[13]),
  .I1(rom16_inst_29_dout[13]),
  .S0(ad[4])
);
MUX2 mux_inst_79 (
  .O(mux_o_79),
  .I0(rom16_inst_45_dout[13]),
  .I1(rom16_inst_61_dout[13]),
  .S0(ad[4])
);
MUX2 mux_inst_81 (
  .O(mux_o_81),
  .I0(mux_o_78),
  .I1(mux_o_79),
  .S0(ad[5])
);
MUX2 mux_inst_83 (
  .O(dout[13]),
  .I0(mux_o_81),
  .I1(rom16_inst_77_dout[13]),
  .S0(ad[6])
);
MUX2 mux_inst_84 (
  .O(mux_o_84),
  .I0(rom16_inst_14_dout[14]),
  .I1(rom16_inst_30_dout[14]),
  .S0(ad[4])
);
MUX2 mux_inst_85 (
  .O(mux_o_85),
  .I0(rom16_inst_46_dout[14]),
  .I1(rom16_inst_62_dout[14]),
  .S0(ad[4])
);
MUX2 mux_inst_87 (
  .O(mux_o_87),
  .I0(mux_o_84),
  .I1(mux_o_85),
  .S0(ad[5])
);
MUX2 mux_inst_89 (
  .O(dout[14]),
  .I0(mux_o_87),
  .I1(rom16_inst_78_dout[14]),
  .S0(ad[6])
);
MUX2 mux_inst_90 (
  .O(mux_o_90),
  .I0(rom16_inst_15_dout[15]),
  .I1(rom16_inst_31_dout[15]),
  .S0(ad[4])
);
MUX2 mux_inst_91 (
  .O(mux_o_91),
  .I0(rom16_inst_47_dout[15]),
  .I1(rom16_inst_63_dout[15]),
  .S0(ad[4])
);
MUX2 mux_inst_93 (
  .O(mux_o_93),
  .I0(mux_o_90),
  .I1(mux_o_91),
  .S0(ad[5])
);
MUX2 mux_inst_95 (
  .O(dout[15]),
  .I0(mux_o_93),
  .I1(rom16_inst_79_dout[15]),
  .S0(ad[6])
);
endmodule //cam_settings_rom
