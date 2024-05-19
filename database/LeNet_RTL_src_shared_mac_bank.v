// This program was cloned from: https://github.com/yztong/LeNet_RTL
// License: MIT License

//==================================================================================================
//  Filename      : shared_mac_bank.v
//  Created On    : 2017-12-29 19:17:28
//  Last Modified : 2018-03-22 14:48:15
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : shared_mac_bank Module. DSPs can be shared among all layers. 
//					This work only sharded DSPs among conv1 conv2& fc1 layer since the 
//					DSP resource is enough for this work.
//
//==================================================================================================
module shared_mac_bank(/*autoport*/
//output
			mac_1,
			mac_2,
			mac_3,
			mac_4,
			mac_5,
//input
			clk,
			f1_rdata,
			w1_rdata,
			f3_rdata,
			w3_rdata,
			f5_rdata,
			w5_rdata,
			f6_rdata,
			w6_rdata,
			f7_rdata,
			w7_rdata,
			sel,
			conv1_clr,
			conv2_clr,
			fc1_clr,
			fc2_clr,
			fc3_clr);

	input  clk;


	//mac1 input
	input [7:0] 	f1_rdata;	
	input [47:0]	w1_rdata;	//w1_1 ~ w1_6
	//mac2 input
	input [95:0]	f3_rdata;	//f3_1 ~ f3_6
	input [767:0]	w3_rdata;	//w3_1_1 ~ w3_16_6
	//mac3 input
	input [15:0]    f5_rdata;	
	input [959:0]	w5_rdata;	//w5_1 ~ w5_120

	//mac4 input
	input [15:0] 	f6_rdata;	
	input [671:0]	w6_rdata;	//w6_1 ~ w6_84

	//mac5 input
	input [15:0]	f7_rdata;
	input [79:0]	w7_rdata;	//w7_1 ~ w7_10

//mac1 output
	output [137:0]	mac_1;		//mac1_1 ~ mac1_6
//mac2 output
	output [2207:0]	mac_2;		//mac2_1_1 ~ mac2_16_6
//mac3 output
	output [2759:0]	mac_3;		//mac3_1 ~ mac3_120
//output mac4
	output [1931:0]	mac_4;		//mac4_1 ~ mac4_84	
//output mac5
	output [229:0]	mac_5;		//mac5_1 ~ mac5_10


	input wire  sel;
	input wire  conv1_clr;
	input wire  conv2_clr;
	input wire  fc1_clr;
	input wire 	fc2_clr;
	input wire 	fc3_clr;



wire [15:0] A[213:0];
wire [7:0] B[213:0];
wire [22:0] P[213:0];
wire	    SEL[213:0];



generate
	genvar i,j,k,l,m,n,x;
//----------------------------------------
//-Generate DSP units--------------------- 
//----------------------------------------	
	for(i=0;i<214;i=i+1) begin:mac_gen
		MAC mac (
	  		.CLK(clk),      // input wire CLK
	  		.A(A[i]),          // input wire [15 : 0] A
	 		.B(B[i]),          // input wire [7 : 0] B
	  		.P(P[i]),          // output wire [47 : 0] P
	  		.SEL(SEL[i])  // input wire SCLRP
		);
	end
//----------------------------------------
//-Select Input A&B&SEL for each DSP unit- 
//----------------------------------------
	for(j=0;j<16;j=j+1) begin:sel1_loop16
		for(x=0;x<6;x=x+1) begin
			assign SEL[j*6+x] = sel? conv2_clr:fc1_clr; 
			assign A[j*6+x] = sel? f3_rdata[16*x+15:16*x] : f5_rdata;
			assign B[j*6+x] = sel? w3_rdata[(j*6+x)*8+7:(j*6+x)*8] : w5_rdata[(j*6+x)*8+7:(j*6+x)*8];
		end
	end

	for(k=96;k<102;k=k+1) begin:sel2
		assign SEL[k] = sel? conv1_clr:fc1_clr;
		assign A[k] = sel? {{8{f1_rdata[7]}},f1_rdata[7:0]} : f5_rdata;
		assign B[k] = sel? w1_rdata[(k-96)*8+7:(k-96)*8] : w5_rdata[k*8+7:k*8];
	end

	for(l=102;l<120;l=l+1) begin:sel3
		assign SEL[l] = fc1_clr;
		assign A[l] = f5_rdata;
		assign B[l] = w5_rdata[l*8+7:l*8];
	end

	for(m=120;m<204;m=m+1) begin:sel4
		assign SEL[m] = fc2_clr;
		assign A[m] = f6_rdata;
		assign B[m] = w6_rdata[(m-120)*8+7:(m-120)*8];
	end
	for(n=204;n<214;n=n+1) begin:sel5
		assign SEL[n] = fc3_clr;
		assign A[n] = f7_rdata;
		assign B[n] = w7_rdata[(n-204)*8+7:(n-204)*8];
	end
	
endgenerate

//----------------------------------------
//-Mac Result Assignments-----------------
//----------------------------------------
assign mac_1 = {P[101],P[100],P[99],P[98],P[97],P[96]};
assign mac_2 = {P[95],P[94],P[93],P[92],P[91],P[90],P[89],P[88],P[87],P[86],
	P[85],P[84],P[83],P[82],P[81],P[80],P[79],P[78],P[77],P[76],P[75],P[74],
	P[73],P[72],P[71],P[70],P[69],P[68],P[67],P[66],P[65],P[64],P[63],P[62],
	P[61],P[60],P[59],P[58],P[57],P[56],P[55],P[54],P[53],P[52],P[51],P[50],
	P[49],P[48],P[47],P[46],P[45],P[44],P[43],P[42],P[41],P[40],P[39],P[38],
	P[37],P[36],P[35],P[34],P[33],P[32],P[31],P[30],P[29],P[28],P[27],P[26],
	P[25],P[24],P[23],P[22],P[21],P[20],P[19],P[18],P[17],P[16],P[15],P[14],
	P[13],P[12],P[11],P[10],P[9],P[8],P[7],P[6],P[5],P[4],P[3],P[2],P[1],P[0]};

assign mac_3 = {P[119],P[118],P[117],P[116],P[115],P[114],P[113],P[112],P[111],
	P[110],P[109],P[108],P[107],P[106],P[105],P[104],P[103],P[102],P[101],P[100],
	P[99],P[98],P[97],P[96],P[95],P[94],P[93],P[92],P[91],P[90],P[89],P[88],P[87],
	P[86],P[85],P[84],P[83],P[82],P[81],P[80],P[79],P[78],P[77],P[76],P[75],P[74],
	P[73],P[72],P[71],P[70],P[69],P[68],P[67],P[66],P[65],P[64],P[63],P[62],P[61],
	P[60],P[59],P[58],P[57],P[56],P[55],P[54],P[53],P[52],P[51],P[50],P[49],P[48],
	P[47],P[46],P[45],P[44],P[43],P[42],P[41],P[40],P[39],P[38],P[37],P[36],P[35],
	P[34],P[33],P[32],P[31],P[30],P[29],P[28],P[27],P[26],P[25],P[24],P[23],P[22],
	P[21],P[20],P[19],P[18],P[17],P[16],P[15],P[14],P[13],P[12],P[11],P[10],P[9],
	P[8],P[7],P[6],P[5],P[4],P[3],P[2],P[1],P[0]};

assign mac_4 = {P[203],P[202],P[201],P[200],P[199],P[198],P[197],P[196],P[195],
	P[194],P[193],P[192],P[191],P[190],P[189],P[188],P[187],P[186],P[185],P[184],
	P[183],P[182],P[181],P[180],P[179],P[178],P[177],P[176],P[175],P[174],P[173],
	P[172],P[171],P[170],P[169],P[168],P[167],P[166],P[165],P[164],P[163],P[162],
	P[161],P[160],P[159],P[158],P[157],P[156],P[155],P[154],P[153],P[152],P[151],
	P[150],P[149],P[148],P[147],P[146],P[145],P[144],P[143],P[142],P[141],P[140],
	P[139],P[138],P[137],P[136],P[135],P[134],P[133],P[132],P[131],P[130],P[129],
	P[128],P[127],P[126],P[125],P[124],P[123],P[122],P[121],P[120]};

assign mac_5 = {P[213],P[212],P[211],P[210],P[209],P[208],P[207],P[206],P[205],P[204]};


endmodule 