// This program was cloned from: https://github.com/yztong/LeNet_RTL
// License: MIT License

//==================================================================================================
//  Filename      : fc2_exec.v
//  Created On    : 2018-01-06 14:25:57
//  Last Modified : 2018-03-22 14:39:43
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : FC 2nd Layer Execute Module.
//
//
//==================================================================================================

module fc2_exec(/*autoport*/
//output
			f7_rdata,
//input
			clk,
			rst_n,
			f7_wr_en,
			mac_4,
			f7_raddr);

input clk;
input rst_n;
input f7_wr_en;

input [1931:0] mac_4;	//mac result. mac4_1 ~ mac4_84.


input [6:0]  f7_raddr;
output[15:0] f7_rdata;


parameter b_1 = 16'b0000011001110101;
parameter b_2 = 16'b0000100011000100;
parameter b_3 = 16'b1111110001111000;
parameter b_4 = 16'b1111111000000011;
parameter b_5 = 16'b0000101011000010;
parameter b_6 = 16'b1111110001100100;
parameter b_7 = 16'b0000010010001111;
parameter b_8 = 16'b1111100011101000;
parameter b_9 = 16'b1111110011110010;
parameter b_10 = 16'b1111110010110110;
parameter b_11 = 16'b0000010001011010;
parameter b_12 = 16'b0000001110001010;
parameter b_13 = 16'b0000001110101000;
parameter b_14 = 16'b1111110010000011;
parameter b_15 = 16'b1111101111001001;
parameter b_16 = 16'b0000001100000111;
parameter b_17 = 16'b0000100000000001;
parameter b_18 = 16'b1111011111001000;
parameter b_19 = 16'b0000010110000000;
parameter b_20 = 16'b1111100010101011;
parameter b_21 = 16'b1111110111100010;
parameter b_22 = 16'b1111111101110001;
parameter b_23 = 16'b0000001001001010;
parameter b_24 = 16'b1111101000000111;
parameter b_25 = 16'b0000011010010011;
parameter b_26 = 16'b0000000011001100;
parameter b_27 = 16'b1111101110011110;
parameter b_28 = 16'b0000011010111110;
parameter b_29 = 16'b0000001001010111;
parameter b_30 = 16'b0000001001010001;
parameter b_31 = 16'b0000101000000111;
parameter b_32 = 16'b0000010111110100;
parameter b_33 = 16'b1111101111000111;
parameter b_34 = 16'b1111111001001011;
parameter b_35 = 16'b1111100100001010;
parameter b_36 = 16'b1111110011010010;
parameter b_37 = 16'b0000000100001111;
parameter b_38 = 16'b1111011111101011;
parameter b_39 = 16'b1111111111101100;
parameter b_40 = 16'b1111110110000110;
parameter b_41 = 16'b0000001001010110;
parameter b_42 = 16'b0000000010011111;
parameter b_43 = 16'b1111111111010101;
parameter b_44 = 16'b0000010010101010;
parameter b_45 = 16'b0000100111000011;
parameter b_46 = 16'b1111101101011011;
parameter b_47 = 16'b0000011110111001;
parameter b_48 = 16'b1111111110101100;
parameter b_49 = 16'b1111111011011010;
parameter b_50 = 16'b0000000111001101;
parameter b_51 = 16'b1111100011010001;
parameter b_52 = 16'b0000010100101011;
parameter b_53 = 16'b0000011010100110;
parameter b_54 = 16'b1111110110101010;
parameter b_55 = 16'b1111110100010000;
parameter b_56 = 16'b0000100001001000;
parameter b_57 = 16'b0000000011000101;
parameter b_58 = 16'b1111111011000001;
parameter b_59 = 16'b0000000101010100;
parameter b_60 = 16'b0000010001001000;
parameter b_61 = 16'b1111101101110000;
parameter b_62 = 16'b0000010010110001;
parameter b_63 = 16'b0000010011100011;
parameter b_64 = 16'b1111111111010100;
parameter b_65 = 16'b1111011001100011;
parameter b_66 = 16'b1111110110100110;
parameter b_67 = 16'b0000011001110111;
parameter b_68 = 16'b0000010000110110;
parameter b_69 = 16'b1111111100111010;
parameter b_70 = 16'b1111101111100010;
parameter b_71 = 16'b1111110111101010;
parameter b_72 = 16'b1111110111101110;
parameter b_73 = 16'b1111111010101110;
parameter b_74 = 16'b0000000110011011;
parameter b_75 = 16'b1111101110100001;
parameter b_76 = 16'b0000000100011100;
parameter b_77 = 16'b0000010010010000;
parameter b_78 = 16'b1111100101010111;
parameter b_79 = 16'b0000010100111010;
parameter b_80 = 16'b1111110000011110;
parameter b_81 = 16'b1111110011011000;
parameter b_82 = 16'b0000001010100111;
parameter b_83 = 16'b0000010111011000;
parameter b_84 = 16'b0000010000110010;





wire [15:0] fc2_d_out[83:0];
wire [15:0] fc2_b_in[83:0];
wire[22:0] fc2_d_in[83:0];
generate
	genvar i;
	for(i=0;i<84;i=i+1)begin:fc2_unit_gen
		fc_unit fc_unit(/*autoinst*/
			.d_out(fc2_d_out[i]),
			.clk(clk),
			.rst_n(rst_n),
			.d_in(fc2_d_in[i]),
			.b_in(fc2_b_in[i]),
			.wr_en(f7_wr_en));
		assign fc2_d_in[i] = mac_4[23*i+22:23*i];
	end
endgenerate

//Bias initial
assign fc2_b_in[0] =  b_1;
assign fc2_b_in[1] =  b_2;
assign fc2_b_in[2] =  b_3;
assign fc2_b_in[3] =  b_4;
assign fc2_b_in[4] =  b_5;
assign fc2_b_in[5] =  b_6;
assign fc2_b_in[6] =  b_7;
assign fc2_b_in[7] =  b_8;
assign fc2_b_in[8] =  b_9;
assign fc2_b_in[9] =  b_10;
assign fc2_b_in[10] = b_11;
assign fc2_b_in[11] = b_12;
assign fc2_b_in[12] = b_13;
assign fc2_b_in[13] = b_14;
assign fc2_b_in[14] = b_15;
assign fc2_b_in[15] = b_16;
assign fc2_b_in[16] = b_17;
assign fc2_b_in[17] = b_18;
assign fc2_b_in[18] = b_19;
assign fc2_b_in[19] = b_20;
assign fc2_b_in[20] = b_21;
assign fc2_b_in[21] = b_22;
assign fc2_b_in[22] = b_23;
assign fc2_b_in[23] = b_24;
assign fc2_b_in[24] = b_25;
assign fc2_b_in[25] = b_26;
assign fc2_b_in[26] = b_27;
assign fc2_b_in[27] = b_28;
assign fc2_b_in[28] = b_29;
assign fc2_b_in[29] = b_30;
assign fc2_b_in[30] = b_31;
assign fc2_b_in[31] = b_32;
assign fc2_b_in[32] = b_33;
assign fc2_b_in[33] = b_34;
assign fc2_b_in[34] = b_35;
assign fc2_b_in[35] = b_36;
assign fc2_b_in[36] = b_37;
assign fc2_b_in[37] = b_38;
assign fc2_b_in[38] = b_39;
assign fc2_b_in[39] = b_40;
assign fc2_b_in[40] = b_41;
assign fc2_b_in[41] = b_42;
assign fc2_b_in[42] = b_43;
assign fc2_b_in[43] = b_44;
assign fc2_b_in[44] = b_45;
assign fc2_b_in[45] = b_46;
assign fc2_b_in[46] = b_47;
assign fc2_b_in[47] = b_48;
assign fc2_b_in[48] = b_49;
assign fc2_b_in[49] = b_50;
assign fc2_b_in[50] = b_51;
assign fc2_b_in[51] = b_52;
assign fc2_b_in[52] = b_53;
assign fc2_b_in[53] = b_54;
assign fc2_b_in[54] = b_55;
assign fc2_b_in[55] = b_56;
assign fc2_b_in[56] = b_57;
assign fc2_b_in[57] = b_58;
assign fc2_b_in[58] = b_59;
assign fc2_b_in[59] = b_60;
assign fc2_b_in[60] = b_61;
assign fc2_b_in[61] = b_62;
assign fc2_b_in[62] = b_63;
assign fc2_b_in[63] = b_64;
assign fc2_b_in[64] = b_65;
assign fc2_b_in[65] = b_66;
assign fc2_b_in[66] = b_67;
assign fc2_b_in[67] = b_68;
assign fc2_b_in[68] = b_69;
assign fc2_b_in[69] = b_70;
assign fc2_b_in[70] = b_71;
assign fc2_b_in[71] = b_72;
assign fc2_b_in[72] = b_73;
assign fc2_b_in[73] = b_74;
assign fc2_b_in[74] = b_75;
assign fc2_b_in[75] = b_76;
assign fc2_b_in[76] = b_77;
assign fc2_b_in[77] = b_78;
assign fc2_b_in[78] = b_79;
assign fc2_b_in[79] = b_80;
assign fc2_b_in[80] = b_81;
assign fc2_b_in[81] = b_82;
assign fc2_b_in[82] = b_83;
assign fc2_b_in[83] = b_84;


reg [6:0] f7_raddr_r;
always@(posedge clk)begin
	f7_raddr_r <= f7_raddr;
end
(* max_fanout = 50 *)reg [15:0] f7_rdata_r;
always@(posedge clk)begin
	f7_rdata_r <= fc2_d_out[f7_raddr_r];
end
assign f7_rdata = f7_rdata_r;


endmodule 

