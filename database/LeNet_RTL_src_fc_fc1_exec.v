//==================================================================================================
//  Filename      : fc1_exec.v
//  Created On    : 2018-01-06 13:58:11
//  Last Modified : 2018-03-22 14:39:04
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : FC 1st Layer Execute Module.
//
//
//==================================================================================================
module fc1_exec(/*autoport*/
//output
			f6_rdata,
//input
			clk,
			rst_n,
			f6_wr_en,
			mac_3,
			f6_raddr);

input clk;
input rst_n;

input f6_wr_en;
input [2759:0] mac_3;    //mac result. mac3_1 ~ mac3_120.

input [6:0]  f6_raddr;
output[15:0] f6_rdata;

//Bias
parameter b_1 = 16'b0000010110000110;
parameter b_2 = 16'b1111111110101111;
parameter b_3 = 16'b1111101000100100;
parameter b_4 = 16'b1111111000100110;
parameter b_5 = 16'b1111101011110100;
parameter b_6 = 16'b1111101111011000;
parameter b_7 = 16'b1111100111001111;
parameter b_8 = 16'b1111110001100001;
parameter b_9 = 16'b1111110110000010;
parameter b_10 = 16'b1111111110001010;
parameter b_11 = 16'b0000001110010110;
parameter b_12 = 16'b1111111011100111;
parameter b_13 = 16'b1111110100100000;
parameter b_14 = 16'b0000001011111100;
parameter b_15 = 16'b0000010101111110;
parameter b_16 = 16'b1111111101111011;
parameter b_17 = 16'b0000000100100110;
parameter b_18 = 16'b0000000011011111;
parameter b_19 = 16'b0000011000101101;
parameter b_20 = 16'b0000000100011111;
parameter b_21 = 16'b0000010000110000;
parameter b_22 = 16'b0000000001100000;
parameter b_23 = 16'b1111110110101010;
parameter b_24 = 16'b0000010000100011;
parameter b_25 = 16'b0000010000011010;
parameter b_26 = 16'b1111110010100110;
parameter b_27 = 16'b1111101101100011;
parameter b_28 = 16'b0000001010001111;
parameter b_29 = 16'b0000001010011111;
parameter b_30 = 16'b1111111001011100;
parameter b_31 = 16'b0000001010011100;
parameter b_32 = 16'b1111110110010000;
parameter b_33 = 16'b1111101110010110;
parameter b_34 = 16'b1111110001001101;
parameter b_35 = 16'b0000000100011000;
parameter b_36 = 16'b1111111100000110;
parameter b_37 = 16'b1111110100000101;
parameter b_38 = 16'b1111110001101001;
parameter b_39 = 16'b1111110001111100;
parameter b_40 = 16'b1111111111000111;
parameter b_41 = 16'b1111110101001100;
parameter b_42 = 16'b0000000000001010;
parameter b_43 = 16'b0000000111001001;
parameter b_44 = 16'b1111110110000001;
parameter b_45 = 16'b1111110011011111;
parameter b_46 = 16'b1111110100101001;
parameter b_47 = 16'b1111111111001100;
parameter b_48 = 16'b1111111010101110;
parameter b_49 = 16'b1111111010011011;
parameter b_50 = 16'b1111110100110110;
parameter b_51 = 16'b1111110011100111;
parameter b_52 = 16'b1111111001110110;
parameter b_53 = 16'b1111110001101010;
parameter b_54 = 16'b0000010011100110;
parameter b_55 = 16'b0000000100011000;
parameter b_56 = 16'b0000000001110000;
parameter b_57 = 16'b0000000100100011;
parameter b_58 = 16'b1111110110100100;
parameter b_59 = 16'b0000011000011000;
parameter b_60 = 16'b1111111011001010;
parameter b_61 = 16'b1111101100000000;
parameter b_62 = 16'b1111111000001111;
parameter b_63 = 16'b1111101001010000;
parameter b_64 = 16'b0000001100100011;
parameter b_65 = 16'b1111110111000100;
parameter b_66 = 16'b1111110010011011;
parameter b_67 = 16'b1111111000111111;
parameter b_68 = 16'b1111111000110111;
parameter b_69 = 16'b1111111001001101;
parameter b_70 = 16'b1111110000010100;
parameter b_71 = 16'b1111110001101011;
parameter b_72 = 16'b0000010000000111;
parameter b_73 = 16'b0000001001100011;
parameter b_74 = 16'b1111100011111111;
parameter b_75 = 16'b1111111000110100;
parameter b_76 = 16'b0000010011000111;
parameter b_77 = 16'b0000001000111100;
parameter b_78 = 16'b1111111000111101;
parameter b_79 = 16'b1111110000011110;
parameter b_80 = 16'b0000001001101110;
parameter b_81 = 16'b1111111110101110;
parameter b_82 = 16'b0000001011000100;
parameter b_83 = 16'b0000001010000000;
parameter b_84 = 16'b0000000010010010;
parameter b_85 = 16'b0000000111101010;
parameter b_86 = 16'b0000000110110001;
parameter b_87 = 16'b0000001111000110;
parameter b_88 = 16'b0000001111101010;
parameter b_89 = 16'b1111100100100111;
parameter b_90 = 16'b0000000101110101;
parameter b_91 = 16'b1111110111000001;
parameter b_92 = 16'b0000010000110011;
parameter b_93 = 16'b0000001010011110;
parameter b_94 = 16'b0000001100101000;
parameter b_95 = 16'b1111101101110111;
parameter b_96 = 16'b0000001101010100;
parameter b_97 = 16'b1111111011110101;
parameter b_98 = 16'b1111111010110101;
parameter b_99 = 16'b0000010100100001;
parameter b_100 = 16'b1111110110100000;
parameter b_101 = 16'b1111111110100101;
parameter b_102 = 16'b1111110011101000;
parameter b_103 = 16'b0000010101001110;
parameter b_104 = 16'b0000100010100011;
parameter b_105 = 16'b1111110110010101;
parameter b_106 = 16'b0000000100001001;
parameter b_107 = 16'b1111110100000000;
parameter b_108 = 16'b0000011011100001;
parameter b_109 = 16'b0000001010000010;
parameter b_110 = 16'b0000001000111001;
parameter b_111 = 16'b1111110111100101;
parameter b_112 = 16'b0000000011010001;
parameter b_113 = 16'b0000010010100010;
parameter b_114 = 16'b1111111111000000;
parameter b_115 = 16'b0000000111101011;
parameter b_116 = 16'b1111111100111011;
parameter b_117 = 16'b0000001010010101;
parameter b_118 = 16'b0000000010000100;
parameter b_119 = 16'b0000000000110100;
parameter b_120 = 16'b0000000000010101;






wire [15:0] fc1_d_out[119:0];
wire [15:0] fc1_b_in[119:0];
wire[22:0] fc1_d_in[119:0];
generate
	genvar i;
	for(i=0;i<120;i=i+1)begin:fc1_unit_gen
		fc_unit fc_unit(/*autoinst*/
			.d_out(fc1_d_out[i]),
			.clk(clk),
			.rst_n(rst_n),
			.d_in(fc1_d_in[i]),
			.b_in(fc1_b_in[i]),
			.wr_en(f6_wr_en));
		assign fc1_d_in[i] = mac_3[23*i+22:23*i];
	end
endgenerate



//Bias initial

assign fc1_b_in[0] =  b_1;
assign fc1_b_in[1] =  b_2;
assign fc1_b_in[2] =  b_3;
assign fc1_b_in[3] =  b_4;
assign fc1_b_in[4] =  b_5;
assign fc1_b_in[5] =  b_6;
assign fc1_b_in[6] =  b_7;
assign fc1_b_in[7] =  b_8;
assign fc1_b_in[8] =  b_9;
assign fc1_b_in[9] =  b_10;
assign fc1_b_in[10] =  b_11;
assign fc1_b_in[11] =  b_12;
assign fc1_b_in[12] =  b_13;
assign fc1_b_in[13] =  b_14;
assign fc1_b_in[14] =  b_15;
assign fc1_b_in[15] =  b_16;
assign fc1_b_in[16] =  b_17;
assign fc1_b_in[17] =  b_18;
assign fc1_b_in[18] =  b_19;
assign fc1_b_in[19] =  b_20;
assign fc1_b_in[20] =  b_21;
assign fc1_b_in[21] =  b_22;
assign fc1_b_in[22] =  b_23;
assign fc1_b_in[23] =  b_24;
assign fc1_b_in[24] =  b_25;
assign fc1_b_in[25] =  b_26;
assign fc1_b_in[26] =  b_27;
assign fc1_b_in[27] =  b_28;
assign fc1_b_in[28] =  b_29;
assign fc1_b_in[29] =  b_30;
assign fc1_b_in[30] =  b_31;
assign fc1_b_in[31] =  b_32;
assign fc1_b_in[32] =  b_33;
assign fc1_b_in[33] =  b_34;
assign fc1_b_in[34] =  b_35;
assign fc1_b_in[35] =  b_36;
assign fc1_b_in[36] =  b_37;
assign fc1_b_in[37] =  b_38;
assign fc1_b_in[38] =  b_39;
assign fc1_b_in[39] =  b_40;
assign fc1_b_in[40] =  b_41;
assign fc1_b_in[41] =  b_42;
assign fc1_b_in[42] =  b_43;
assign fc1_b_in[43] =  b_44;
assign fc1_b_in[44] =  b_45;
assign fc1_b_in[45] =  b_46;
assign fc1_b_in[46] =  b_47;
assign fc1_b_in[47] =  b_48;
assign fc1_b_in[48] =  b_49;
assign fc1_b_in[49] =  b_50;
assign fc1_b_in[50] =  b_51;
assign fc1_b_in[51] =  b_52;
assign fc1_b_in[52] =  b_53;
assign fc1_b_in[53] =  b_54;
assign fc1_b_in[54] =  b_55;
assign fc1_b_in[55] =  b_56;
assign fc1_b_in[56] =  b_57;
assign fc1_b_in[57] =  b_58;
assign fc1_b_in[58] =  b_59;
assign fc1_b_in[59] =  b_60;
assign fc1_b_in[60] =  b_61;
assign fc1_b_in[61] =  b_62;
assign fc1_b_in[62] =  b_63;
assign fc1_b_in[63] =  b_64;
assign fc1_b_in[64] =  b_65;
assign fc1_b_in[65] =  b_66;
assign fc1_b_in[66] =  b_67;
assign fc1_b_in[67] =  b_68;
assign fc1_b_in[68] =  b_69;
assign fc1_b_in[69] =  b_70;
assign fc1_b_in[70] =  b_71;
assign fc1_b_in[71] =  b_72;
assign fc1_b_in[72] =  b_73;
assign fc1_b_in[73] =  b_74;
assign fc1_b_in[74] =  b_75;
assign fc1_b_in[75] =  b_76;
assign fc1_b_in[76] =  b_77;
assign fc1_b_in[77] =  b_78;
assign fc1_b_in[78] =  b_79;
assign fc1_b_in[79] =  b_80;
assign fc1_b_in[80] =  b_81;
assign fc1_b_in[81] =  b_82;
assign fc1_b_in[82] =  b_83;
assign fc1_b_in[83] =  b_84;
assign fc1_b_in[84] =  b_85;
assign fc1_b_in[85] =  b_86;
assign fc1_b_in[86] =  b_87;
assign fc1_b_in[87] =  b_88;
assign fc1_b_in[88] =  b_89;
assign fc1_b_in[89] =  b_90;
assign fc1_b_in[90] =  b_91;
assign fc1_b_in[91] =  b_92;
assign fc1_b_in[92] =  b_93;
assign fc1_b_in[93] =  b_94;
assign fc1_b_in[94] =  b_95;
assign fc1_b_in[95] =  b_96;
assign fc1_b_in[96] =  b_97;
assign fc1_b_in[97] =  b_98;
assign fc1_b_in[98] =  b_99;
assign fc1_b_in[99] =  b_100;
assign fc1_b_in[100] =  b_101;
assign fc1_b_in[101] =  b_102;
assign fc1_b_in[102] =  b_103;
assign fc1_b_in[103] =  b_104;
assign fc1_b_in[104] =  b_105;
assign fc1_b_in[105] =  b_106;
assign fc1_b_in[106] =  b_107;
assign fc1_b_in[107] =  b_108;
assign fc1_b_in[108] =  b_109;
assign fc1_b_in[109] =  b_110;
assign fc1_b_in[110] =  b_111;
assign fc1_b_in[111] =  b_112;
assign fc1_b_in[112] =  b_113;
assign fc1_b_in[113] =  b_114;
assign fc1_b_in[114] =  b_115;
assign fc1_b_in[115] =  b_116;
assign fc1_b_in[116] =  b_117;
assign fc1_b_in[117] =  b_118;
assign fc1_b_in[118] =  b_119;
assign fc1_b_in[119] =  b_120;

reg [6:0] f6_raddr_r;
always@(posedge clk)begin
	f6_raddr_r <= f6_raddr;
end
(* max_fanout = 50 *)reg [15:0] f6_rdata_r;
always@(posedge clk)begin
	f6_rdata_r <= fc1_d_out[f6_raddr_r];
end
assign f6_rdata = f6_rdata_r;


endmodule 

