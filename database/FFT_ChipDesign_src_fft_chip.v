//**********************************************************
// Author: @mikeq123456, copyright 2020
// e-mail: vencifreeman16@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: fft_chip
//
// Type: Sequential
//
// Purpose: 
//
// Details: 
//
// Release History:
// - Version 1.0 20/04/14: Create；
// - Version 1.1 20/05/03: Fix error by @luotian12345 and @VenciFreeman.
//
// Notes:
//
//**********************************************************

module fft_chip(

  input         clk,
  input         rst_n,
  input  [33:0] data_in,
  output [33:0] data_out

);

wire net_clk, net_rst_n;
wire [33:0] net_data_in, net_data_out;

PIW
	PIW_clk(.PAD(clk), .C(net_clk)),
	PIW_rst_n(.PAD(rst_n), .C(net_rst_n)),
	PIW_data_in0(.PAD(data_in[0]), .C(net_data_in[0])),
	PIW_data_in1(.PAD(data_in[1]), .C(net_data_in[1])),
	PIW_data_in2(.PAD(data_in[2]), .C(net_data_in[2])),
	PIW_data_in3(.PAD(data_in[3]), .C(net_data_in[3])),
	PIW_data_in4(.PAD(data_in[4]), .C(net_data_in[4])),
	PIW_data_in5(.PAD(data_in[5]), .C(net_data_in[5])),
	PIW_data_in6(.PAD(data_in[6]), .C(net_data_in[6])),
	PIW_data_in7(.PAD(data_in[7]), .C(net_data_in[7])),
	PIW_data_in8(.PAD(data_in[8]), .C(net_data_in[8])),
	PIW_data_in9(.PAD(data_in[9]), .C(net_data_in[9])),
	PIW_data_in10(.PAD(data_in[10]), .C(net_data_in[10])),
	PIW_data_in11(.PAD(data_in[11]), .C(net_data_in[11])),
	PIW_data_in12(.PAD(data_in[12]), .C(net_data_in[12])),
	PIW_data_in13(.PAD(data_in[13]), .C(net_data_in[13])),
	PIW_data_in14(.PAD(data_in[14]), .C(net_data_in[14])),
	PIW_data_in15(.PAD(data_in[15]), .C(net_data_in[15])),
	PIW_data_in16(.PAD(data_in[16]), .C(net_data_in[16])),
	PIW_data_in17(.PAD(data_in[17]), .C(net_data_in[17])),
	PIW_data_in18(.PAD(data_in[18]), .C(net_data_in[18])),
	PIW_data_in19(.PAD(data_in[19]), .C(net_data_in[19])),
	PIW_data_in20(.PAD(data_in[20]), .C(net_data_in[20])),
	PIW_data_in21(.PAD(data_in[21]), .C(net_data_in[21])),
	PIW_data_in22(.PAD(data_in[22]), .C(net_data_in[22])),
	PIW_data_in23(.PAD(data_in[23]), .C(net_data_in[23])),
	PIW_data_in24(.PAD(data_in[24]), .C(net_data_in[24])),
	PIW_data_in25(.PAD(data_in[25]), .C(net_data_in[25])),
	PIW_data_in26(.PAD(data_in[26]), .C(net_data_in[26])),
	PIW_data_in27(.PAD(data_in[27]), .C(net_data_in[27])),
	PIW_data_in28(.PAD(data_in[28]), .C(net_data_in[28])),
	PIW_data_in29(.PAD(data_in[29]), .C(net_data_in[29])),
	PIW_data_in30(.PAD(data_in[30]), .C(net_data_in[30])),
	PIW_data_in31(.PAD(data_in[31]), .C(net_data_in[31])),
	PIW_data_in32(.PAD(data_in[32]), .C(net_data_in[32])),
	PIW_data_in33(.PAD(data_in[33]), .C(net_data_in[33]));
	
PO8W
	PO8W_data_out0(.I(net_data_out[0]), .PAD(data_out[0])),
	PO8W_data_out1(.I(net_data_out[1]), .PAD(data_out[1])),
	PO8W_data_out2(.I(net_data_out[2]), .PAD(data_out[2])),
	PO8W_data_out3(.I(net_data_out[3]), .PAD(data_out[3])),
	PO8W_data_out4(.I(net_data_out[4]), .PAD(data_out[4])),
	PO8W_data_out5(.I(net_data_out[5]), .PAD(data_out[5])),
	PO8W_data_out6(.I(net_data_out[6]), .PAD(data_out[6])),
	PO8W_data_out7(.I(net_data_out[7]), .PAD(data_out[7])),
	PO8W_data_out8(.I(net_data_out[8]), .PAD(data_out[8])),
	PO8W_data_out9(.I(net_data_out[9]), .PAD(data_out[9])),
	PO8W_data_out10(.I(net_data_out[10]), .PAD(data_out[10])),
	PO8W_data_out11(.I(net_data_out[11]), .PAD(data_out[11])),
	PO8W_data_out12(.I(net_data_out[12]), .PAD(data_out[12])),
	PO8W_data_out13(.I(net_data_out[13]), .PAD(data_out[13])),
	PO8W_data_out14(.I(net_data_out[14]), .PAD(data_out[14])),
	PO8W_data_out15(.I(net_data_out[15]), .PAD(data_out[15])),
	PO8W_data_out16(.I(net_data_out[16]), .PAD(data_out[16])),
	PO8W_data_out17(.I(net_data_out[17]), .PAD(data_out[17])),
	PO8W_data_out18(.I(net_data_out[18]), .PAD(data_out[18])),
	PO8W_data_out19(.I(net_data_out[19]), .PAD(data_out[19])),
	PO8W_data_out20(.I(net_data_out[20]), .PAD(data_out[20])),
	PO8W_data_out21(.I(net_data_out[21]), .PAD(data_out[21])),
	PO8W_data_out22(.I(net_data_out[22]), .PAD(data_out[22])),
	PO8W_data_out23(.I(net_data_out[23]), .PAD(data_out[23])),
	PO8W_data_out24(.I(net_data_out[24]), .PAD(data_out[24])),
	PO8W_data_out25(.I(net_data_out[25]), .PAD(data_out[25])),
	PO8W_data_out26(.I(net_data_out[26]), .PAD(data_out[26])),
	PO8W_data_out27(.I(net_data_out[27]), .PAD(data_out[27])),
	PO8W_data_out28(.I(net_data_out[28]), .PAD(data_out[28])),
	PO8W_data_out29(.I(net_data_out[29]), .PAD(data_out[29])),
	PO8W_data_out30(.I(net_data_out[30]), .PAD(data_out[30])),
	PO8W_data_out31(.I(net_data_out[31]), .PAD(data_out[31])),
	PO8W_data_out32(.I(net_data_out[32]), .PAD(data_out[32])),
	PO8W_data_out33(.I(net_data_out[33]), .PAD(data_out[33]));
	
fft inst_fft (.clk(net_clk),
			        .rst_n(net_rst_n),
			        .data_in(net_data_in),
              .data_out(net_data_out)
             );

endmodule
	
