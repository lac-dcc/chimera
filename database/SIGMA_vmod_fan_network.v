//##########################################################
// Generated Fowarding Adder Network (FAN topology)
// Author: Eric Qin
// Contact: ecqin@gatech.edu
//##########################################################


module fan_network # (
	parameter DATA_TYPE =  32 ,
	parameter NUM_PES =  32 ,
	parameter LOG2_PES =  5 ) (
	clk,
	rst,
	i_valid,
	i_data_bus,
	i_add_en_bus,
	i_cmd_bus,
	i_sel_bus,
	o_valid,
	o_data_bus
);
	input clk;
	input rst;
	input i_valid; // valid input data bus
	input [NUM_PES*DATA_TYPE-1 : 0] i_data_bus; // input data bus
	input [(NUM_PES-1)-1 : 0] i_add_en_bus; // adder enable bus
	input [3*(NUM_PES-1)-1 : 0] i_cmd_bus; // command bits for each adder
	input [19 : 0] i_sel_bus; // select bits for FAN topolgy
	output reg [NUM_PES-1 : 0] o_valid; // output valid signal
	output reg [NUM_PES*DATA_TYPE-1 : 0] o_data_bus; // output data bus

	// tree wires (includes binary and forwarding wires)
	wire [ 959  : 0] w_fan_lvl_0;
	wire [ 447  : 0] w_fan_lvl_1;
	wire [ 191  : 0] w_fan_lvl_2;
	wire [ 63  : 0] w_fan_lvl_3;
	wire [ 31  : 0] w_fan_lvl_4;


	// flop forwarding levels across levels to maintain pipeline timing
	reg [63 : 0] r_fan_ff_lvl_0_to_4;
	reg [191 : 0] r_fan_ff_lvl_0_to_3;
	reg [447 : 0] r_fan_ff_lvl_0_to_2;
	reg [63 : 0] r_fan_ff_lvl_1_to_4;
	reg [191 : 0] r_fan_ff_lvl_1_to_3;
	reg [63 : 0] r_fan_ff_lvl_2_to_4;


	// output virtual neuron (completed partial sums) wires for each level and valid bits
	wire [1023 : 0] w_vn_lvl_0;
	wire [31 : 0] w_vn_lvl_0_valid;
	wire [511 : 0] w_vn_lvl_1;
	wire [15 : 0] w_vn_lvl_1_valid;
	wire [255 : 0] w_vn_lvl_2;
	wire [7 : 0] w_vn_lvl_2_valid;
	wire [127 : 0] w_vn_lvl_3;
	wire [3 : 0] w_vn_lvl_3_valid;
	wire [63 : 0] w_vn_lvl_4;
	wire [1 : 0] w_vn_lvl_4_valid;


	// output ff within each level of adder tree to maintain pipeline behavior
	reg [5119 : 0] r_lvl_output_ff;
	reg [159 : 0] r_lvl_output_ff_valid;


	// valid FFs for each level of the adder tree
	reg [6 : 0] r_valid;
	// flop final adder output cmd and values
	reg [DATA_TYPE-1:0] r_final_sum;
	reg r_final_add;
	reg r_final_add2;
	// FAN topology flip flops between forwarding levels to maintain pipeline timing
	always @ (posedge clk) begin
		if (rst == 1'b1) begin
			r_fan_ff_lvl_0_to_4 = 'd0;
			r_fan_ff_lvl_0_to_3 = 'd0;
			r_fan_ff_lvl_0_to_2 = 'd0;
			r_fan_ff_lvl_1_to_4 = 'd0;
			r_fan_ff_lvl_1_to_3 = 'd0;
			r_fan_ff_lvl_2_to_4 = 'd0;
		end else begin
			r_fan_ff_lvl_0_to_4[31:0] = r_fan_ff_lvl_0_to_3[95:64];
			r_fan_ff_lvl_0_to_4[63:32] = r_fan_ff_lvl_0_to_3[127:96];
			r_fan_ff_lvl_0_to_3[31:0] = r_fan_ff_lvl_0_to_2[95:64];
			r_fan_ff_lvl_0_to_3[63:32] = r_fan_ff_lvl_0_to_2[127:96];
			r_fan_ff_lvl_0_to_3[95:64] = r_fan_ff_lvl_0_to_2[223:192];
			r_fan_ff_lvl_0_to_3[127:96] = r_fan_ff_lvl_0_to_2[255:224];
			r_fan_ff_lvl_0_to_3[159:128] = r_fan_ff_lvl_0_to_2[351:320];
			r_fan_ff_lvl_0_to_3[191:160] = r_fan_ff_lvl_0_to_2[383:352];
			r_fan_ff_lvl_0_to_2[31:0] = w_fan_lvl_0[95:64];
			r_fan_ff_lvl_0_to_2[63:32] = w_fan_lvl_0[127:96];
			r_fan_ff_lvl_0_to_2[95:64] = w_fan_lvl_0[223:192];
			r_fan_ff_lvl_0_to_2[127:96] = w_fan_lvl_0[255:224];
			r_fan_ff_lvl_0_to_2[159:128] = w_fan_lvl_0[351:320];
			r_fan_ff_lvl_0_to_2[191:160] = w_fan_lvl_0[383:352];
			r_fan_ff_lvl_0_to_2[223:192] = w_fan_lvl_0[479:448];
			r_fan_ff_lvl_0_to_2[255:224] = w_fan_lvl_0[511:480];
			r_fan_ff_lvl_0_to_2[287:256] = w_fan_lvl_0[607:576];
			r_fan_ff_lvl_0_to_2[319:288] = w_fan_lvl_0[639:608];
			r_fan_ff_lvl_0_to_2[351:320] = w_fan_lvl_0[735:704];
			r_fan_ff_lvl_0_to_2[383:352] = w_fan_lvl_0[767:736];
			r_fan_ff_lvl_0_to_2[415:384] = w_fan_lvl_0[863:832];
			r_fan_ff_lvl_0_to_2[447:416] = w_fan_lvl_0[895:864];
			r_fan_ff_lvl_1_to_4[31:0] = r_fan_ff_lvl_1_to_3[95:64];
			r_fan_ff_lvl_1_to_4[63:32] = r_fan_ff_lvl_1_to_3[127:96];
			r_fan_ff_lvl_1_to_3[31:0] = w_fan_lvl_1[95:64];
			r_fan_ff_lvl_1_to_3[63:32] = w_fan_lvl_1[127:96];
			r_fan_ff_lvl_1_to_3[95:64] = w_fan_lvl_1[223:192];
			r_fan_ff_lvl_1_to_3[127:96] = w_fan_lvl_1[255:224];
			r_fan_ff_lvl_1_to_3[159:128] = w_fan_lvl_1[351:320];
			r_fan_ff_lvl_1_to_3[191:160] = w_fan_lvl_1[383:352];
			r_fan_ff_lvl_2_to_4[31:0] = w_fan_lvl_2[95:64];
			r_fan_ff_lvl_2_to_4[63:32] = w_fan_lvl_2[127:96];
		end
	end


	// Output Buffers and Muxes across all levels to pipeline finished VNs (complete Psums)
	always @ (posedge clk) begin
		if (rst == 1'b1) begin
			r_lvl_output_ff[1023:0] <= 'd0;
			r_lvl_output_ff_valid[31:0] <= 'd0;
		end else begin
			if (w_vn_lvl_0_valid[1:0] == 2'b11) begin // both VN complete
				r_lvl_output_ff[63:0] <= w_vn_lvl_0[63:0];
				r_lvl_output_ff_valid[1:0] <= 2'b11;
			end else if (w_vn_lvl_0_valid[1:0] == 2'b10) begin // right VN complete
				r_lvl_output_ff[63:32] <= w_vn_lvl_0[63:32];
				r_lvl_output_ff[31:0] <= 'd0;
				r_lvl_output_ff_valid[1:0] <= 2'b10;
			end else if (w_vn_lvl_0_valid[1:0] == 2'b01) begin // left VN complete
				r_lvl_output_ff[63:0] <= 'd0;
				r_lvl_output_ff[31:0] <= w_vn_lvl_0[31:0];
				r_lvl_output_ff_valid[1:0] <= 2'b01;
			end else begin // no VN complete
				r_lvl_output_ff[63:0] <= 'd0; 
				r_lvl_output_ff_valid[1:0] <= 2'b00;
			end


			if (w_vn_lvl_0_valid[3:2] == 2'b11) begin // both VN complete
				r_lvl_output_ff[127:64] <= w_vn_lvl_0[127:64];
				r_lvl_output_ff_valid[3:2] <= 2'b11;
			end else if (w_vn_lvl_0_valid[3:2] == 2'b10) begin // right VN complete
				r_lvl_output_ff[127:96] <= w_vn_lvl_0[127:96];
				r_lvl_output_ff[95:64] <= 'd0;
				r_lvl_output_ff_valid[3:2] <= 2'b10;
			end else if (w_vn_lvl_0_valid[3:2] == 2'b01) begin // left VN complete
				r_lvl_output_ff[127:64] <= 'd0;
				r_lvl_output_ff[95:64] <= w_vn_lvl_0[95:64];
				r_lvl_output_ff_valid[3:2] <= 2'b01;
			end else begin // no VN complete
				r_lvl_output_ff[127:64] <= 'd0; 
				r_lvl_output_ff_valid[3:2] <= 2'b00;
			end


			if (w_vn_lvl_0_valid[5:4] == 2'b11) begin // both VN complete
				r_lvl_output_ff[191:128] <= w_vn_lvl_0[191:128];
				r_lvl_output_ff_valid[5:4] <= 2'b11;
			end else if (w_vn_lvl_0_valid[5:4] == 2'b10) begin // right VN complete
				r_lvl_output_ff[191:160] <= w_vn_lvl_0[191:160];
				r_lvl_output_ff[159:128] <= 'd0;
				r_lvl_output_ff_valid[5:4] <= 2'b10;
			end else if (w_vn_lvl_0_valid[5:4] == 2'b01) begin // left VN complete
				r_lvl_output_ff[191:128] <= 'd0;
				r_lvl_output_ff[159:128] <= w_vn_lvl_0[159:128];
				r_lvl_output_ff_valid[5:4] <= 2'b01;
			end else begin // no VN complete
				r_lvl_output_ff[191:128] <= 'd0; 
				r_lvl_output_ff_valid[5:4] <= 2'b00;
			end


			if (w_vn_lvl_0_valid[7:6] == 2'b11) begin // both VN complete
				r_lvl_output_ff[255:192] <= w_vn_lvl_0[255:192];
				r_lvl_output_ff_valid[7:6] <= 2'b11;
			end else if (w_vn_lvl_0_valid[7:6] == 2'b10) begin // right VN complete
				r_lvl_output_ff[255:224] <= w_vn_lvl_0[255:224];
				r_lvl_output_ff[223:192] <= 'd0;
				r_lvl_output_ff_valid[7:6] <= 2'b10;
			end else if (w_vn_lvl_0_valid[7:6] == 2'b01) begin // left VN complete
				r_lvl_output_ff[255:192] <= 'd0;
				r_lvl_output_ff[223:192] <= w_vn_lvl_0[223:192];
				r_lvl_output_ff_valid[7:6] <= 2'b01;
			end else begin // no VN complete
				r_lvl_output_ff[255:192] <= 'd0; 
				r_lvl_output_ff_valid[7:6] <= 2'b00;
			end


			if (w_vn_lvl_0_valid[9:8] == 2'b11) begin // both VN complete
				r_lvl_output_ff[319:256] <= w_vn_lvl_0[319:256];
				r_lvl_output_ff_valid[9:8] <= 2'b11;
			end else if (w_vn_lvl_0_valid[9:8] == 2'b10) begin // right VN complete
				r_lvl_output_ff[319:288] <= w_vn_lvl_0[319:288];
				r_lvl_output_ff[287:256] <= 'd0;
				r_lvl_output_ff_valid[9:8] <= 2'b10;
			end else if (w_vn_lvl_0_valid[9:8] == 2'b01) begin // left VN complete
				r_lvl_output_ff[319:256] <= 'd0;
				r_lvl_output_ff[287:256] <= w_vn_lvl_0[287:256];
				r_lvl_output_ff_valid[9:8] <= 2'b01;
			end else begin // no VN complete
				r_lvl_output_ff[319:256] <= 'd0; 
				r_lvl_output_ff_valid[9:8] <= 2'b00;
			end


			if (w_vn_lvl_0_valid[11:10] == 2'b11) begin // both VN complete
				r_lvl_output_ff[383:320] <= w_vn_lvl_0[383:320];
				r_lvl_output_ff_valid[11:10] <= 2'b11;
			end else if (w_vn_lvl_0_valid[11:10] == 2'b10) begin // right VN complete
				r_lvl_output_ff[383:352] <= w_vn_lvl_0[383:352];
				r_lvl_output_ff[351:320] <= 'd0;
				r_lvl_output_ff_valid[11:10] <= 2'b10;
			end else if (w_vn_lvl_0_valid[11:10] == 2'b01) begin // left VN complete
				r_lvl_output_ff[383:320] <= 'd0;
				r_lvl_output_ff[351:320] <= w_vn_lvl_0[351:320];
				r_lvl_output_ff_valid[11:10] <= 2'b01;
			end else begin // no VN complete
				r_lvl_output_ff[383:320] <= 'd0; 
				r_lvl_output_ff_valid[11:10] <= 2'b00;
			end


			if (w_vn_lvl_0_valid[13:12] == 2'b11) begin // both VN complete
				r_lvl_output_ff[447:384] <= w_vn_lvl_0[447:384];
				r_lvl_output_ff_valid[13:12] <= 2'b11;
			end else if (w_vn_lvl_0_valid[13:12] == 2'b10) begin // right VN complete
				r_lvl_output_ff[447:416] <= w_vn_lvl_0[447:416];
				r_lvl_output_ff[415:384] <= 'd0;
				r_lvl_output_ff_valid[13:12] <= 2'b10;
			end else if (w_vn_lvl_0_valid[13:12] == 2'b01) begin // left VN complete
				r_lvl_output_ff[447:384] <= 'd0;
				r_lvl_output_ff[415:384] <= w_vn_lvl_0[415:384];
				r_lvl_output_ff_valid[13:12] <= 2'b01;
			end else begin // no VN complete
				r_lvl_output_ff[447:384] <= 'd0; 
				r_lvl_output_ff_valid[13:12] <= 2'b00;
			end


			if (w_vn_lvl_0_valid[15:14] == 2'b11) begin // both VN complete
				r_lvl_output_ff[511:448] <= w_vn_lvl_0[511:448];
				r_lvl_output_ff_valid[15:14] <= 2'b11;
			end else if (w_vn_lvl_0_valid[15:14] == 2'b10) begin // right VN complete
				r_lvl_output_ff[511:480] <= w_vn_lvl_0[511:480];
				r_lvl_output_ff[479:448] <= 'd0;
				r_lvl_output_ff_valid[15:14] <= 2'b10;
			end else if (w_vn_lvl_0_valid[15:14] == 2'b01) begin // left VN complete
				r_lvl_output_ff[511:448] <= 'd0;
				r_lvl_output_ff[479:448] <= w_vn_lvl_0[479:448];
				r_lvl_output_ff_valid[15:14] <= 2'b01;
			end else begin // no VN complete
				r_lvl_output_ff[511:448] <= 'd0; 
				r_lvl_output_ff_valid[15:14] <= 2'b00;
			end


			if (w_vn_lvl_0_valid[17:16] == 2'b11) begin // both VN complete
				r_lvl_output_ff[575:512] <= w_vn_lvl_0[575:512];
				r_lvl_output_ff_valid[17:16] <= 2'b11;
			end else if (w_vn_lvl_0_valid[17:16] == 2'b10) begin // right VN complete
				r_lvl_output_ff[575:544] <= w_vn_lvl_0[575:544];
				r_lvl_output_ff[543:512] <= 'd0;
				r_lvl_output_ff_valid[17:16] <= 2'b10;
			end else if (w_vn_lvl_0_valid[17:16] == 2'b01) begin // left VN complete
				r_lvl_output_ff[575:512] <= 'd0;
				r_lvl_output_ff[543:512] <= w_vn_lvl_0[543:512];
				r_lvl_output_ff_valid[17:16] <= 2'b01;
			end else begin // no VN complete
				r_lvl_output_ff[575:512] <= 'd0; 
				r_lvl_output_ff_valid[17:16] <= 2'b00;
			end


			if (w_vn_lvl_0_valid[19:18] == 2'b11) begin // both VN complete
				r_lvl_output_ff[639:576] <= w_vn_lvl_0[639:576];
				r_lvl_output_ff_valid[19:18] <= 2'b11;
			end else if (w_vn_lvl_0_valid[19:18] == 2'b10) begin // right VN complete
				r_lvl_output_ff[639:608] <= w_vn_lvl_0[639:608];
				r_lvl_output_ff[607:576] <= 'd0;
				r_lvl_output_ff_valid[19:18] <= 2'b10;
			end else if (w_vn_lvl_0_valid[19:18] == 2'b01) begin // left VN complete
				r_lvl_output_ff[639:576] <= 'd0;
				r_lvl_output_ff[607:576] <= w_vn_lvl_0[607:576];
				r_lvl_output_ff_valid[19:18] <= 2'b01;
			end else begin // no VN complete
				r_lvl_output_ff[639:576] <= 'd0; 
				r_lvl_output_ff_valid[19:18] <= 2'b00;
			end


			if (w_vn_lvl_0_valid[21:20] == 2'b11) begin // both VN complete
				r_lvl_output_ff[703:640] <= w_vn_lvl_0[703:640];
				r_lvl_output_ff_valid[21:20] <= 2'b11;
			end else if (w_vn_lvl_0_valid[21:20] == 2'b10) begin // right VN complete
				r_lvl_output_ff[703:672] <= w_vn_lvl_0[703:672];
				r_lvl_output_ff[671:640] <= 'd0;
				r_lvl_output_ff_valid[21:20] <= 2'b10;
			end else if (w_vn_lvl_0_valid[21:20] == 2'b01) begin // left VN complete
				r_lvl_output_ff[703:640] <= 'd0;
				r_lvl_output_ff[671:640] <= w_vn_lvl_0[671:640];
				r_lvl_output_ff_valid[21:20] <= 2'b01;
			end else begin // no VN complete
				r_lvl_output_ff[703:640] <= 'd0; 
				r_lvl_output_ff_valid[21:20] <= 2'b00;
			end


			if (w_vn_lvl_0_valid[23:22] == 2'b11) begin // both VN complete
				r_lvl_output_ff[767:704] <= w_vn_lvl_0[767:704];
				r_lvl_output_ff_valid[23:22] <= 2'b11;
			end else if (w_vn_lvl_0_valid[23:22] == 2'b10) begin // right VN complete
				r_lvl_output_ff[767:736] <= w_vn_lvl_0[767:736];
				r_lvl_output_ff[735:704] <= 'd0;
				r_lvl_output_ff_valid[23:22] <= 2'b10;
			end else if (w_vn_lvl_0_valid[23:22] == 2'b01) begin // left VN complete
				r_lvl_output_ff[767:704] <= 'd0;
				r_lvl_output_ff[735:704] <= w_vn_lvl_0[735:704];
				r_lvl_output_ff_valid[23:22] <= 2'b01;
			end else begin // no VN complete
				r_lvl_output_ff[767:704] <= 'd0; 
				r_lvl_output_ff_valid[23:22] <= 2'b00;
			end


			if (w_vn_lvl_0_valid[25:24] == 2'b11) begin // both VN complete
				r_lvl_output_ff[831:768] <= w_vn_lvl_0[831:768];
				r_lvl_output_ff_valid[25:24] <= 2'b11;
			end else if (w_vn_lvl_0_valid[25:24] == 2'b10) begin // right VN complete
				r_lvl_output_ff[831:800] <= w_vn_lvl_0[831:800];
				r_lvl_output_ff[799:768] <= 'd0;
				r_lvl_output_ff_valid[25:24] <= 2'b10;
			end else if (w_vn_lvl_0_valid[25:24] == 2'b01) begin // left VN complete
				r_lvl_output_ff[831:768] <= 'd0;
				r_lvl_output_ff[799:768] <= w_vn_lvl_0[799:768];
				r_lvl_output_ff_valid[25:24] <= 2'b01;
			end else begin // no VN complete
				r_lvl_output_ff[831:768] <= 'd0; 
				r_lvl_output_ff_valid[25:24] <= 2'b00;
			end


			if (w_vn_lvl_0_valid[27:26] == 2'b11) begin // both VN complete
				r_lvl_output_ff[895:832] <= w_vn_lvl_0[895:832];
				r_lvl_output_ff_valid[27:26] <= 2'b11;
			end else if (w_vn_lvl_0_valid[27:26] == 2'b10) begin // right VN complete
				r_lvl_output_ff[895:864] <= w_vn_lvl_0[895:864];
				r_lvl_output_ff[863:832] <= 'd0;
				r_lvl_output_ff_valid[27:26] <= 2'b10;
			end else if (w_vn_lvl_0_valid[27:26] == 2'b01) begin // left VN complete
				r_lvl_output_ff[895:832] <= 'd0;
				r_lvl_output_ff[863:832] <= w_vn_lvl_0[863:832];
				r_lvl_output_ff_valid[27:26] <= 2'b01;
			end else begin // no VN complete
				r_lvl_output_ff[895:832] <= 'd0; 
				r_lvl_output_ff_valid[27:26] <= 2'b00;
			end


			if (w_vn_lvl_0_valid[29:28] == 2'b11) begin // both VN complete
				r_lvl_output_ff[959:896] <= w_vn_lvl_0[959:896];
				r_lvl_output_ff_valid[29:28] <= 2'b11;
			end else if (w_vn_lvl_0_valid[29:28] == 2'b10) begin // right VN complete
				r_lvl_output_ff[959:928] <= w_vn_lvl_0[959:928];
				r_lvl_output_ff[927:896] <= 'd0;
				r_lvl_output_ff_valid[29:28] <= 2'b10;
			end else if (w_vn_lvl_0_valid[29:28] == 2'b01) begin // left VN complete
				r_lvl_output_ff[959:896] <= 'd0;
				r_lvl_output_ff[927:896] <= w_vn_lvl_0[927:896];
				r_lvl_output_ff_valid[29:28] <= 2'b01;
			end else begin // no VN complete
				r_lvl_output_ff[959:896] <= 'd0; 
				r_lvl_output_ff_valid[29:28] <= 2'b00;
			end


			if (w_vn_lvl_0_valid[31:30] == 2'b11) begin // both VN complete
				r_lvl_output_ff[1023:960] <= w_vn_lvl_0[1023:960];
				r_lvl_output_ff_valid[31:30] <= 2'b11;
			end else if (w_vn_lvl_0_valid[31:30] == 2'b10) begin // right VN complete
				r_lvl_output_ff[1023:992] <= w_vn_lvl_0[1023:992];
				r_lvl_output_ff[991:960] <= 'd0;
				r_lvl_output_ff_valid[31:30] <= 2'b10;
			end else if (w_vn_lvl_0_valid[31:30] == 2'b01) begin // left VN complete
				r_lvl_output_ff[1023:960] <= 'd0;
				r_lvl_output_ff[991:960] <= w_vn_lvl_0[991:960];
				r_lvl_output_ff_valid[31:30] <= 2'b01;
			end else begin // no VN complete
				r_lvl_output_ff[1023:960] <= 'd0; 
				r_lvl_output_ff_valid[31:30] <= 2'b00;
			end


		end
	end


	always @ (posedge clk) begin
		if (rst == 1'b1) begin
			r_lvl_output_ff[2047:1024] <= 'd0;
			r_lvl_output_ff_valid[63:32] <= 'd0;
		end else begin
			r_lvl_output_ff[1055:1024] <= r_lvl_output_ff[31:0];
			r_lvl_output_ff_valid[32] <= r_lvl_output_ff_valid[0];


			if (w_vn_lvl_1_valid[0] == 1'b1) begin
				r_lvl_output_ff[1087:1056] <= w_vn_lvl_1[31:0];
				r_lvl_output_ff_valid[33] <= 1'b1;
			end else begin
				r_lvl_output_ff[1087:1056] <= r_lvl_output_ff[63:32];
				r_lvl_output_ff_valid[33] <= r_lvl_output_ff_valid[1];
			end


			if (w_vn_lvl_1_valid[1] == 1'b1) begin
				r_lvl_output_ff[1119:1088] <= w_vn_lvl_1[63:32];
				r_lvl_output_ff_valid[34] <= 1'b1;
			end else begin
				r_lvl_output_ff[1119:1088] <= r_lvl_output_ff[95:64];
				r_lvl_output_ff_valid[34] <= r_lvl_output_ff_valid[2];
			end


			r_lvl_output_ff[1151:1120] <= r_lvl_output_ff[127:96];
			r_lvl_output_ff_valid[35] <= r_lvl_output_ff_valid[3];


			r_lvl_output_ff[1183:1152] <= r_lvl_output_ff[159:128];
			r_lvl_output_ff_valid[36] <= r_lvl_output_ff_valid[4];


			if (w_vn_lvl_1_valid[2] == 1'b1) begin
				r_lvl_output_ff[1215:1184] <= w_vn_lvl_1[95:64];
				r_lvl_output_ff_valid[37] <= 1'b1;
			end else begin
				r_lvl_output_ff[1215:1184] <= r_lvl_output_ff[191:160];
				r_lvl_output_ff_valid[37] <= r_lvl_output_ff_valid[5];
			end


			if (w_vn_lvl_1_valid[3] == 1'b1) begin
				r_lvl_output_ff[1247:1216] <= w_vn_lvl_1[127:96];
				r_lvl_output_ff_valid[38] <= 1'b1;
			end else begin
				r_lvl_output_ff[1247:1216] <= r_lvl_output_ff[223:192];
				r_lvl_output_ff_valid[38] <= r_lvl_output_ff_valid[6];
			end


			r_lvl_output_ff[1279:1248] <= r_lvl_output_ff[255:224];
			r_lvl_output_ff_valid[39] <= r_lvl_output_ff_valid[7];


			r_lvl_output_ff[1311:1280] <= r_lvl_output_ff[287:256];
			r_lvl_output_ff_valid[40] <= r_lvl_output_ff_valid[8];


			if (w_vn_lvl_1_valid[4] == 1'b1) begin
				r_lvl_output_ff[1343:1312] <= w_vn_lvl_1[159:128];
				r_lvl_output_ff_valid[41] <= 1'b1;
			end else begin
				r_lvl_output_ff[1343:1312] <= r_lvl_output_ff[319:288];
				r_lvl_output_ff_valid[41] <= r_lvl_output_ff_valid[9];
			end


			if (w_vn_lvl_1_valid[5] == 1'b1) begin
				r_lvl_output_ff[1375:1344] <= w_vn_lvl_1[191:160];
				r_lvl_output_ff_valid[42] <= 1'b1;
			end else begin
				r_lvl_output_ff[1375:1344] <= r_lvl_output_ff[351:320];
				r_lvl_output_ff_valid[42] <= r_lvl_output_ff_valid[10];
			end


			r_lvl_output_ff[1407:1376] <= r_lvl_output_ff[383:352];
			r_lvl_output_ff_valid[43] <= r_lvl_output_ff_valid[11];


			r_lvl_output_ff[1439:1408] <= r_lvl_output_ff[415:384];
			r_lvl_output_ff_valid[44] <= r_lvl_output_ff_valid[12];


			if (w_vn_lvl_1_valid[6] == 1'b1) begin
				r_lvl_output_ff[1471:1440] <= w_vn_lvl_1[223:192];
				r_lvl_output_ff_valid[45] <= 1'b1;
			end else begin
				r_lvl_output_ff[1471:1440] <= r_lvl_output_ff[447:416];
				r_lvl_output_ff_valid[45] <= r_lvl_output_ff_valid[13];
			end


			if (w_vn_lvl_1_valid[7] == 1'b1) begin
				r_lvl_output_ff[1503:1472] <= w_vn_lvl_1[255:224];
				r_lvl_output_ff_valid[46] <= 1'b1;
			end else begin
				r_lvl_output_ff[1503:1472] <= r_lvl_output_ff[479:448];
				r_lvl_output_ff_valid[46] <= r_lvl_output_ff_valid[14];
			end


			r_lvl_output_ff[1535:1504] <= r_lvl_output_ff[511:480];
			r_lvl_output_ff_valid[47] <= r_lvl_output_ff_valid[15];


			r_lvl_output_ff[1567:1536] <= r_lvl_output_ff[543:512];
			r_lvl_output_ff_valid[48] <= r_lvl_output_ff_valid[16];


			if (w_vn_lvl_1_valid[8] == 1'b1) begin
				r_lvl_output_ff[1599:1568] <= w_vn_lvl_1[287:256];
				r_lvl_output_ff_valid[49] <= 1'b1;
			end else begin
				r_lvl_output_ff[1599:1568] <= r_lvl_output_ff[575:544];
				r_lvl_output_ff_valid[49] <= r_lvl_output_ff_valid[17];
			end


			if (w_vn_lvl_1_valid[9] == 1'b1) begin
				r_lvl_output_ff[1631:1600] <= w_vn_lvl_1[319:288];
				r_lvl_output_ff_valid[50] <= 1'b1;
			end else begin
				r_lvl_output_ff[1631:1600] <= r_lvl_output_ff[607:576];
				r_lvl_output_ff_valid[50] <= r_lvl_output_ff_valid[18];
			end


			r_lvl_output_ff[1663:1632] <= r_lvl_output_ff[639:608];
			r_lvl_output_ff_valid[51] <= r_lvl_output_ff_valid[19];


			r_lvl_output_ff[1695:1664] <= r_lvl_output_ff[671:640];
			r_lvl_output_ff_valid[52] <= r_lvl_output_ff_valid[20];


			if (w_vn_lvl_1_valid[10] == 1'b1) begin
				r_lvl_output_ff[1727:1696] <= w_vn_lvl_1[351:320];
				r_lvl_output_ff_valid[53] <= 1'b1;
			end else begin
				r_lvl_output_ff[1727:1696] <= r_lvl_output_ff[703:672];
				r_lvl_output_ff_valid[53] <= r_lvl_output_ff_valid[21];
			end


			if (w_vn_lvl_1_valid[11] == 1'b1) begin
				r_lvl_output_ff[1759:1728] <= w_vn_lvl_1[383:352];
				r_lvl_output_ff_valid[54] <= 1'b1;
			end else begin
				r_lvl_output_ff[1759:1728] <= r_lvl_output_ff[735:704];
				r_lvl_output_ff_valid[54] <= r_lvl_output_ff_valid[22];
			end


			r_lvl_output_ff[1791:1760] <= r_lvl_output_ff[767:736];
			r_lvl_output_ff_valid[55] <= r_lvl_output_ff_valid[23];


			r_lvl_output_ff[1823:1792] <= r_lvl_output_ff[799:768];
			r_lvl_output_ff_valid[56] <= r_lvl_output_ff_valid[24];


			if (w_vn_lvl_1_valid[12] == 1'b1) begin
				r_lvl_output_ff[1855:1824] <= w_vn_lvl_1[415:384];
				r_lvl_output_ff_valid[57] <= 1'b1;
			end else begin
				r_lvl_output_ff[1855:1824] <= r_lvl_output_ff[831:800];
				r_lvl_output_ff_valid[57] <= r_lvl_output_ff_valid[25];
			end


			if (w_vn_lvl_1_valid[13] == 1'b1) begin
				r_lvl_output_ff[1887:1856] <= w_vn_lvl_1[447:416];
				r_lvl_output_ff_valid[58] <= 1'b1;
			end else begin
				r_lvl_output_ff[1887:1856] <= r_lvl_output_ff[863:832];
				r_lvl_output_ff_valid[58] <= r_lvl_output_ff_valid[26];
			end


			r_lvl_output_ff[1919:1888] <= r_lvl_output_ff[895:864];
			r_lvl_output_ff_valid[59] <= r_lvl_output_ff_valid[27];


			r_lvl_output_ff[1951:1920] <= r_lvl_output_ff[927:896];
			r_lvl_output_ff_valid[60] <= r_lvl_output_ff_valid[28];


			if (w_vn_lvl_1_valid[14] == 1'b1) begin
				r_lvl_output_ff[1983:1952] <= w_vn_lvl_1[479:448];
				r_lvl_output_ff_valid[61] <= 1'b1;
			end else begin
				r_lvl_output_ff[1983:1952] <= r_lvl_output_ff[959:928];
				r_lvl_output_ff_valid[61] <= r_lvl_output_ff_valid[29];
			end


			if (w_vn_lvl_1_valid[15] == 1'b1) begin
				r_lvl_output_ff[2015:1984] <= w_vn_lvl_1[511:480];
				r_lvl_output_ff_valid[62] <= 1'b1;
			end else begin
				r_lvl_output_ff[2015:1984] <= r_lvl_output_ff[991:960];
				r_lvl_output_ff_valid[62] <= r_lvl_output_ff_valid[30];
			end


			r_lvl_output_ff[2047:2016] <= r_lvl_output_ff[1023:992];
			r_lvl_output_ff_valid[63] <= r_lvl_output_ff_valid[31];


		end
	end


	always @ (posedge clk) begin
		if (rst == 1'b1) begin
			r_lvl_output_ff[3071:2048] <= 'd0;
			r_lvl_output_ff_valid[95:64] <= 'd0;
		end else begin
			r_lvl_output_ff[2079:2048] <= r_lvl_output_ff[1055:1024];
			r_lvl_output_ff_valid[64] <= r_lvl_output_ff_valid[32];


			r_lvl_output_ff[2111:2080] <= r_lvl_output_ff[1087:1056];
			r_lvl_output_ff_valid[65] <= r_lvl_output_ff_valid[33];


			r_lvl_output_ff[2143:2112] <= r_lvl_output_ff[1119:1088];
			r_lvl_output_ff_valid[66] <= r_lvl_output_ff_valid[34];


			if (w_vn_lvl_2_valid[0] == 1'b1) begin
				r_lvl_output_ff[2175:2144] <= w_vn_lvl_2[31:0];
				r_lvl_output_ff_valid[67] <= 1'b1;
			end else begin
				r_lvl_output_ff[2175:2144] <= r_lvl_output_ff[1151:1120];
				r_lvl_output_ff_valid[67] <= r_lvl_output_ff_valid[35];
			end


			if (w_vn_lvl_2_valid[1] == 1'b1) begin
				r_lvl_output_ff[2207:2176] <= w_vn_lvl_2[63:32];
				r_lvl_output_ff_valid[68] <= 1'b1;
			end else begin
				r_lvl_output_ff[2207:2176] <= r_lvl_output_ff[1183:1152];
				r_lvl_output_ff_valid[68] <= r_lvl_output_ff_valid[36];
			end


			r_lvl_output_ff[2239:2208] <= r_lvl_output_ff[1215:1184];
			r_lvl_output_ff_valid[69] <= r_lvl_output_ff_valid[37];


			r_lvl_output_ff[2271:2240] <= r_lvl_output_ff[1247:1216];
			r_lvl_output_ff_valid[70] <= r_lvl_output_ff_valid[38];


			r_lvl_output_ff[2303:2272] <= r_lvl_output_ff[1279:1248];
			r_lvl_output_ff_valid[71] <= r_lvl_output_ff_valid[39];


			r_lvl_output_ff[2335:2304] <= r_lvl_output_ff[1311:1280];
			r_lvl_output_ff_valid[72] <= r_lvl_output_ff_valid[40];


			r_lvl_output_ff[2367:2336] <= r_lvl_output_ff[1343:1312];
			r_lvl_output_ff_valid[73] <= r_lvl_output_ff_valid[41];


			r_lvl_output_ff[2399:2368] <= r_lvl_output_ff[1375:1344];
			r_lvl_output_ff_valid[74] <= r_lvl_output_ff_valid[42];


			if (w_vn_lvl_2_valid[2] == 1'b1) begin
				r_lvl_output_ff[2431:2400] <= w_vn_lvl_2[95:64];
				r_lvl_output_ff_valid[75] <= 1'b1;
			end else begin
				r_lvl_output_ff[2431:2400] <= r_lvl_output_ff[1407:1376];
				r_lvl_output_ff_valid[75] <= r_lvl_output_ff_valid[43];
			end


			if (w_vn_lvl_2_valid[3] == 1'b1) begin
				r_lvl_output_ff[2463:2432] <= w_vn_lvl_2[127:96];
				r_lvl_output_ff_valid[76] <= 1'b1;
			end else begin
				r_lvl_output_ff[2463:2432] <= r_lvl_output_ff[1439:1408];
				r_lvl_output_ff_valid[76] <= r_lvl_output_ff_valid[44];
			end


			r_lvl_output_ff[2495:2464] <= r_lvl_output_ff[1471:1440];
			r_lvl_output_ff_valid[77] <= r_lvl_output_ff_valid[45];


			r_lvl_output_ff[2527:2496] <= r_lvl_output_ff[1503:1472];
			r_lvl_output_ff_valid[78] <= r_lvl_output_ff_valid[46];


			r_lvl_output_ff[2559:2528] <= r_lvl_output_ff[1535:1504];
			r_lvl_output_ff_valid[79] <= r_lvl_output_ff_valid[47];


			r_lvl_output_ff[2591:2560] <= r_lvl_output_ff[1567:1536];
			r_lvl_output_ff_valid[80] <= r_lvl_output_ff_valid[48];


			r_lvl_output_ff[2623:2592] <= r_lvl_output_ff[1599:1568];
			r_lvl_output_ff_valid[81] <= r_lvl_output_ff_valid[49];


			r_lvl_output_ff[2655:2624] <= r_lvl_output_ff[1631:1600];
			r_lvl_output_ff_valid[82] <= r_lvl_output_ff_valid[50];


			if (w_vn_lvl_2_valid[4] == 1'b1) begin
				r_lvl_output_ff[2687:2656] <= w_vn_lvl_2[159:128];
				r_lvl_output_ff_valid[83] <= 1'b1;
			end else begin
				r_lvl_output_ff[2687:2656] <= r_lvl_output_ff[1663:1632];
				r_lvl_output_ff_valid[83] <= r_lvl_output_ff_valid[51];
			end


			if (w_vn_lvl_2_valid[5] == 1'b1) begin
				r_lvl_output_ff[2719:2688] <= w_vn_lvl_2[191:160];
				r_lvl_output_ff_valid[84] <= 1'b1;
			end else begin
				r_lvl_output_ff[2719:2688] <= r_lvl_output_ff[1695:1664];
				r_lvl_output_ff_valid[84] <= r_lvl_output_ff_valid[52];
			end


			r_lvl_output_ff[2751:2720] <= r_lvl_output_ff[1727:1696];
			r_lvl_output_ff_valid[85] <= r_lvl_output_ff_valid[53];


			r_lvl_output_ff[2783:2752] <= r_lvl_output_ff[1759:1728];
			r_lvl_output_ff_valid[86] <= r_lvl_output_ff_valid[54];


			r_lvl_output_ff[2815:2784] <= r_lvl_output_ff[1791:1760];
			r_lvl_output_ff_valid[87] <= r_lvl_output_ff_valid[55];


			r_lvl_output_ff[2847:2816] <= r_lvl_output_ff[1823:1792];
			r_lvl_output_ff_valid[88] <= r_lvl_output_ff_valid[56];


			r_lvl_output_ff[2879:2848] <= r_lvl_output_ff[1855:1824];
			r_lvl_output_ff_valid[89] <= r_lvl_output_ff_valid[57];


			r_lvl_output_ff[2911:2880] <= r_lvl_output_ff[1887:1856];
			r_lvl_output_ff_valid[90] <= r_lvl_output_ff_valid[58];


			if (w_vn_lvl_2_valid[6] == 1'b1) begin
				r_lvl_output_ff[2943:2912] <= w_vn_lvl_2[223:192];
				r_lvl_output_ff_valid[91] <= 1'b1;
			end else begin
				r_lvl_output_ff[2943:2912] <= r_lvl_output_ff[1919:1888];
				r_lvl_output_ff_valid[91] <= r_lvl_output_ff_valid[59];
			end


			if (w_vn_lvl_2_valid[7] == 1'b1) begin
				r_lvl_output_ff[2975:2944] <= w_vn_lvl_2[255:224];
				r_lvl_output_ff_valid[92] <= 1'b1;
			end else begin
				r_lvl_output_ff[2975:2944] <= r_lvl_output_ff[1951:1920];
				r_lvl_output_ff_valid[92] <= r_lvl_output_ff_valid[60];
			end


			r_lvl_output_ff[3007:2976] <= r_lvl_output_ff[1983:1952];
			r_lvl_output_ff_valid[93] <= r_lvl_output_ff_valid[61];


			r_lvl_output_ff[3039:3008] <= r_lvl_output_ff[2015:1984];
			r_lvl_output_ff_valid[94] <= r_lvl_output_ff_valid[62];


			r_lvl_output_ff[3071:3040] <= r_lvl_output_ff[2047:2016];
			r_lvl_output_ff_valid[95] <= r_lvl_output_ff_valid[63];


		end
	end


	always @ (posedge clk) begin
		if (rst == 1'b1) begin
			r_lvl_output_ff[4095:3072] <= 'd0;
			r_lvl_output_ff_valid[127:96] <= 'd0;
		end else begin
			r_lvl_output_ff[3103:3072] <= r_lvl_output_ff[2079:2048];
			r_lvl_output_ff_valid[96] <= r_lvl_output_ff_valid[64];


			r_lvl_output_ff[3135:3104] <= r_lvl_output_ff[2111:2080];
			r_lvl_output_ff_valid[97] <= r_lvl_output_ff_valid[65];


			r_lvl_output_ff[3167:3136] <= r_lvl_output_ff[2143:2112];
			r_lvl_output_ff_valid[98] <= r_lvl_output_ff_valid[66];


			r_lvl_output_ff[3199:3168] <= r_lvl_output_ff[2175:2144];
			r_lvl_output_ff_valid[99] <= r_lvl_output_ff_valid[67];


			r_lvl_output_ff[3231:3200] <= r_lvl_output_ff[2207:2176];
			r_lvl_output_ff_valid[100] <= r_lvl_output_ff_valid[68];


			r_lvl_output_ff[3263:3232] <= r_lvl_output_ff[2239:2208];
			r_lvl_output_ff_valid[101] <= r_lvl_output_ff_valid[69];


			r_lvl_output_ff[3295:3264] <= r_lvl_output_ff[2271:2240];
			r_lvl_output_ff_valid[102] <= r_lvl_output_ff_valid[70];


			if (w_vn_lvl_3_valid[0] == 1'b1) begin
				r_lvl_output_ff[3327:3296] <= w_vn_lvl_3[31:0];
				r_lvl_output_ff_valid[103] <= 1'b1;
			end else begin
				r_lvl_output_ff[3327:3296] <= r_lvl_output_ff[2303:2272];
				r_lvl_output_ff_valid[103] <= r_lvl_output_ff_valid[71];
			end


			if (w_vn_lvl_3_valid[1] == 1'b1) begin
				r_lvl_output_ff[3359:3328] <= w_vn_lvl_3[63:32];
				r_lvl_output_ff_valid[104] <= 1'b1;
			end else begin
				r_lvl_output_ff[3359:3328] <= r_lvl_output_ff[2335:2304];
				r_lvl_output_ff_valid[104] <= r_lvl_output_ff_valid[72];
			end


			r_lvl_output_ff[3391:3360] <= r_lvl_output_ff[2367:2336];
			r_lvl_output_ff_valid[105] <= r_lvl_output_ff_valid[73];


			r_lvl_output_ff[3423:3392] <= r_lvl_output_ff[2399:2368];
			r_lvl_output_ff_valid[106] <= r_lvl_output_ff_valid[74];


			r_lvl_output_ff[3455:3424] <= r_lvl_output_ff[2431:2400];
			r_lvl_output_ff_valid[107] <= r_lvl_output_ff_valid[75];


			r_lvl_output_ff[3487:3456] <= r_lvl_output_ff[2463:2432];
			r_lvl_output_ff_valid[108] <= r_lvl_output_ff_valid[76];


			r_lvl_output_ff[3519:3488] <= r_lvl_output_ff[2495:2464];
			r_lvl_output_ff_valid[109] <= r_lvl_output_ff_valid[77];


			r_lvl_output_ff[3551:3520] <= r_lvl_output_ff[2527:2496];
			r_lvl_output_ff_valid[110] <= r_lvl_output_ff_valid[78];


			r_lvl_output_ff[3583:3552] <= r_lvl_output_ff[2559:2528];
			r_lvl_output_ff_valid[111] <= r_lvl_output_ff_valid[79];


			r_lvl_output_ff[3615:3584] <= r_lvl_output_ff[2591:2560];
			r_lvl_output_ff_valid[112] <= r_lvl_output_ff_valid[80];


			r_lvl_output_ff[3647:3616] <= r_lvl_output_ff[2623:2592];
			r_lvl_output_ff_valid[113] <= r_lvl_output_ff_valid[81];


			r_lvl_output_ff[3679:3648] <= r_lvl_output_ff[2655:2624];
			r_lvl_output_ff_valid[114] <= r_lvl_output_ff_valid[82];


			r_lvl_output_ff[3711:3680] <= r_lvl_output_ff[2687:2656];
			r_lvl_output_ff_valid[115] <= r_lvl_output_ff_valid[83];


			r_lvl_output_ff[3743:3712] <= r_lvl_output_ff[2719:2688];
			r_lvl_output_ff_valid[116] <= r_lvl_output_ff_valid[84];


			r_lvl_output_ff[3775:3744] <= r_lvl_output_ff[2751:2720];
			r_lvl_output_ff_valid[117] <= r_lvl_output_ff_valid[85];


			r_lvl_output_ff[3807:3776] <= r_lvl_output_ff[2783:2752];
			r_lvl_output_ff_valid[118] <= r_lvl_output_ff_valid[86];


			if (w_vn_lvl_3_valid[2] == 1'b1) begin
				r_lvl_output_ff[3839:3808] <= w_vn_lvl_3[95:64];
				r_lvl_output_ff_valid[119] <= 1'b1;
			end else begin
				r_lvl_output_ff[3839:3808] <= r_lvl_output_ff[2815:2784];
				r_lvl_output_ff_valid[119] <= r_lvl_output_ff_valid[87];
			end


			if (w_vn_lvl_3_valid[3] == 1'b1) begin
				r_lvl_output_ff[3871:3840] <= w_vn_lvl_3[127:96];
				r_lvl_output_ff_valid[120] <= 1'b1;
			end else begin
				r_lvl_output_ff[3871:3840] <= r_lvl_output_ff[2847:2816];
				r_lvl_output_ff_valid[120] <= r_lvl_output_ff_valid[88];
			end


			r_lvl_output_ff[3903:3872] <= r_lvl_output_ff[2879:2848];
			r_lvl_output_ff_valid[121] <= r_lvl_output_ff_valid[89];


			r_lvl_output_ff[3935:3904] <= r_lvl_output_ff[2911:2880];
			r_lvl_output_ff_valid[122] <= r_lvl_output_ff_valid[90];


			r_lvl_output_ff[3967:3936] <= r_lvl_output_ff[2943:2912];
			r_lvl_output_ff_valid[123] <= r_lvl_output_ff_valid[91];


			r_lvl_output_ff[3999:3968] <= r_lvl_output_ff[2975:2944];
			r_lvl_output_ff_valid[124] <= r_lvl_output_ff_valid[92];


			r_lvl_output_ff[4031:4000] <= r_lvl_output_ff[3007:2976];
			r_lvl_output_ff_valid[125] <= r_lvl_output_ff_valid[93];


			r_lvl_output_ff[4063:4032] <= r_lvl_output_ff[3039:3008];
			r_lvl_output_ff_valid[126] <= r_lvl_output_ff_valid[94];


			r_lvl_output_ff[4095:4064] <= r_lvl_output_ff[3071:3040];
			r_lvl_output_ff_valid[127] <= r_lvl_output_ff_valid[95];


		end
	end


	always @ (posedge clk) begin
		if (rst == 1'b1) begin
			r_lvl_output_ff[5119:4096] <= 'd0;
			r_lvl_output_ff_valid[159:128] <= 'd0;
		end else begin
			r_lvl_output_ff[4127:4096] <= r_lvl_output_ff[3103:3072];
			r_lvl_output_ff_valid[128] <= r_lvl_output_ff_valid[96];


			r_lvl_output_ff[4159:4128] <= r_lvl_output_ff[3135:3104];
			r_lvl_output_ff_valid[129] <= r_lvl_output_ff_valid[97];


			r_lvl_output_ff[4191:4160] <= r_lvl_output_ff[3167:3136];
			r_lvl_output_ff_valid[130] <= r_lvl_output_ff_valid[98];


			r_lvl_output_ff[4223:4192] <= r_lvl_output_ff[3199:3168];
			r_lvl_output_ff_valid[131] <= r_lvl_output_ff_valid[99];


			r_lvl_output_ff[4255:4224] <= r_lvl_output_ff[3231:3200];
			r_lvl_output_ff_valid[132] <= r_lvl_output_ff_valid[100];


			r_lvl_output_ff[4287:4256] <= r_lvl_output_ff[3263:3232];
			r_lvl_output_ff_valid[133] <= r_lvl_output_ff_valid[101];


			r_lvl_output_ff[4319:4288] <= r_lvl_output_ff[3295:3264];
			r_lvl_output_ff_valid[134] <= r_lvl_output_ff_valid[102];


			r_lvl_output_ff[4351:4320] <= r_lvl_output_ff[3327:3296];
			r_lvl_output_ff_valid[135] <= r_lvl_output_ff_valid[103];


			r_lvl_output_ff[4383:4352] <= r_lvl_output_ff[3359:3328];
			r_lvl_output_ff_valid[136] <= r_lvl_output_ff_valid[104];


			r_lvl_output_ff[4415:4384] <= r_lvl_output_ff[3391:3360];
			r_lvl_output_ff_valid[137] <= r_lvl_output_ff_valid[105];


			r_lvl_output_ff[4447:4416] <= r_lvl_output_ff[3423:3392];
			r_lvl_output_ff_valid[138] <= r_lvl_output_ff_valid[106];


			r_lvl_output_ff[4479:4448] <= r_lvl_output_ff[3455:3424];
			r_lvl_output_ff_valid[139] <= r_lvl_output_ff_valid[107];


			r_lvl_output_ff[4511:4480] <= r_lvl_output_ff[3487:3456];
			r_lvl_output_ff_valid[140] <= r_lvl_output_ff_valid[108];


			r_lvl_output_ff[4543:4512] <= r_lvl_output_ff[3519:3488];
			r_lvl_output_ff_valid[141] <= r_lvl_output_ff_valid[109];


			r_lvl_output_ff[4575:4544] <= r_lvl_output_ff[3551:3520];
			r_lvl_output_ff_valid[142] <= r_lvl_output_ff_valid[110];


			if (w_vn_lvl_4_valid[0] == 1'b1) begin
				r_lvl_output_ff[4607:4576] <= w_vn_lvl_4[31:0];
				r_lvl_output_ff_valid[143] <= 1'b1;
			end else begin
				r_lvl_output_ff[4607:4576] <= r_lvl_output_ff[3583:3552];
				r_lvl_output_ff_valid[143] <= r_lvl_output_ff_valid[111];
			end


			if (w_vn_lvl_4_valid[1] == 1'b1) begin
				r_lvl_output_ff[4639:4608] <= w_vn_lvl_4[63:32];
				r_lvl_output_ff_valid[144] <= 1'b1;
			end else begin
				r_lvl_output_ff[4639:4608] <= r_lvl_output_ff[3615:3584];
				r_lvl_output_ff_valid[144] <= r_lvl_output_ff_valid[112];
			end


			r_lvl_output_ff[4671:4640] <= r_lvl_output_ff[3647:3616];
			r_lvl_output_ff_valid[145] <= r_lvl_output_ff_valid[113];


			r_lvl_output_ff[4703:4672] <= r_lvl_output_ff[3679:3648];
			r_lvl_output_ff_valid[146] <= r_lvl_output_ff_valid[114];


			r_lvl_output_ff[4735:4704] <= r_lvl_output_ff[3711:3680];
			r_lvl_output_ff_valid[147] <= r_lvl_output_ff_valid[115];


			r_lvl_output_ff[4767:4736] <= r_lvl_output_ff[3743:3712];
			r_lvl_output_ff_valid[148] <= r_lvl_output_ff_valid[116];


			r_lvl_output_ff[4799:4768] <= r_lvl_output_ff[3775:3744];
			r_lvl_output_ff_valid[149] <= r_lvl_output_ff_valid[117];


			r_lvl_output_ff[4831:4800] <= r_lvl_output_ff[3807:3776];
			r_lvl_output_ff_valid[150] <= r_lvl_output_ff_valid[118];


			r_lvl_output_ff[4863:4832] <= r_lvl_output_ff[3839:3808];
			r_lvl_output_ff_valid[151] <= r_lvl_output_ff_valid[119];


			r_lvl_output_ff[4895:4864] <= r_lvl_output_ff[3871:3840];
			r_lvl_output_ff_valid[152] <= r_lvl_output_ff_valid[120];


			r_lvl_output_ff[4927:4896] <= r_lvl_output_ff[3903:3872];
			r_lvl_output_ff_valid[153] <= r_lvl_output_ff_valid[121];


			r_lvl_output_ff[4959:4928] <= r_lvl_output_ff[3935:3904];
			r_lvl_output_ff_valid[154] <= r_lvl_output_ff_valid[122];


			r_lvl_output_ff[4991:4960] <= r_lvl_output_ff[3967:3936];
			r_lvl_output_ff_valid[155] <= r_lvl_output_ff_valid[123];


			r_lvl_output_ff[5023:4992] <= r_lvl_output_ff[3999:3968];
			r_lvl_output_ff_valid[156] <= r_lvl_output_ff_valid[124];


			r_lvl_output_ff[5055:5024] <= r_lvl_output_ff[4031:4000];
			r_lvl_output_ff_valid[157] <= r_lvl_output_ff_valid[125];


			r_lvl_output_ff[5087:5056] <= r_lvl_output_ff[4063:4032];
			r_lvl_output_ff_valid[158] <= r_lvl_output_ff_valid[126];


			r_lvl_output_ff[5119:5088] <= r_lvl_output_ff[4095:4064];
			r_lvl_output_ff_valid[159] <= r_lvl_output_ff_valid[127];


		end
	end


	// Flop input valid for different level of the adder tree
	always @ (*) begin
		if (i_valid == 1'b1) begin
			r_valid[0] <= 1'b1;
		end else begin
			r_valid[0] <= 1'b0;
		end
	end

	genvar i;
	generate
		for (i=0; i < 6; i=i+1) begin
			always @ (posedge clk) begin
				if (rst == 1'b1) begin
					r_valid[i+1] <= 1'b0;
				end else begin
					r_valid[i+1] <= r_valid[i];
				end
			end
		end
	endgenerate

	// Instantiating Adder Switches

	edge_adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_0 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[0]),
		.i_data_bus(i_data_bus[63 : 0]),
		.i_add_en(i_add_en_bus[0]),
		.i_cmd(i_cmd_bus[2:0]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_0[63 : 0]),
		.o_vn_valid(w_vn_lvl_0_valid[1 : 0]),
		.o_adder(w_fan_lvl_0[31 : 0])
	);

	edge_adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_1 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[1]),
		.i_data_bus({ w_fan_lvl_0[63:32], w_fan_lvl_0[31:0]}),
		.i_add_en(i_add_en_bus[16]),
		.i_cmd(i_cmd_bus[50:48]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_1[63 : 0]),
		.o_vn_valid(w_vn_lvl_1_valid[1 : 0]),
		.o_adder(w_fan_lvl_1[31 : 0])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_2 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[0]),
		.i_data_bus(i_data_bus[127 : 64]),
		.i_add_en(i_add_en_bus[1]),
		.i_cmd(i_cmd_bus[5:3]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_0[127 : 64]),
		.o_vn_valid(w_vn_lvl_0_valid[3 : 2]),
		.o_adder(w_fan_lvl_0[95 : 32])
	);

	edge_adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 4 ),
		.SEL_IN( 2 )) my_adder_3 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[2]),
		.i_data_bus({ w_fan_lvl_1[63:32], r_fan_ff_lvl_0_to_2[63:32], r_fan_ff_lvl_0_to_2[31:0], w_fan_lvl_1[31:0]}),
		.i_add_en(i_add_en_bus[24]),
		.i_cmd(i_cmd_bus[74:72]),
		.i_sel(i_sel_bus[1:0]),
		.o_vn(w_vn_lvl_2[63 : 0]),
		.o_vn_valid(w_vn_lvl_2_valid[1 : 0]),
		.o_adder(w_fan_lvl_2[31 : 0])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_4 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[0]),
		.i_data_bus(i_data_bus[191 : 128]),
		.i_add_en(i_add_en_bus[2]),
		.i_cmd(i_cmd_bus[8:6]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_0[191 : 128]),
		.o_vn_valid(w_vn_lvl_0_valid[5 : 4]),
		.o_adder(w_fan_lvl_0[159 : 96])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_5 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[1]),
		.i_data_bus({ w_fan_lvl_0[191:160], w_fan_lvl_0[159:128]}),
		.i_add_en(i_add_en_bus[17]),
		.i_cmd(i_cmd_bus[53:51]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_1[127 : 64]),
		.o_vn_valid(w_vn_lvl_1_valid[3 : 2]),
		.o_adder(w_fan_lvl_1[95 : 32])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_6 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[0]),
		.i_data_bus(i_data_bus[255 : 192]),
		.i_add_en(i_add_en_bus[3]),
		.i_cmd(i_cmd_bus[11:9]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_0[255 : 192]),
		.o_vn_valid(w_vn_lvl_0_valid[7 : 6]),
		.o_adder(w_fan_lvl_0[223 : 160])
	);

	edge_adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 6 ),
		.SEL_IN( 4 )) my_adder_7 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[3]),
		.i_data_bus({ w_fan_lvl_2[63:32], r_fan_ff_lvl_1_to_3[63:32], r_fan_ff_lvl_0_to_3[63:32], r_fan_ff_lvl_0_to_3[31:0], r_fan_ff_lvl_1_to_3[31:0], w_fan_lvl_2[31:0]}),
		.i_add_en(i_add_en_bus[28]),
		.i_cmd(i_cmd_bus[86:84]),
		.i_sel(i_sel_bus[11:8]),
		.o_vn(w_vn_lvl_3[63 : 0]),
		.o_vn_valid(w_vn_lvl_3_valid[1 : 0]),
		.o_adder(w_fan_lvl_3[31 : 0])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_8 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[0]),
		.i_data_bus(i_data_bus[319 : 256]),
		.i_add_en(i_add_en_bus[4]),
		.i_cmd(i_cmd_bus[14:12]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_0[319 : 256]),
		.o_vn_valid(w_vn_lvl_0_valid[9 : 8]),
		.o_adder(w_fan_lvl_0[287 : 224])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_9 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[1]),
		.i_data_bus({ w_fan_lvl_0[319:288], w_fan_lvl_0[287:256]}),
		.i_add_en(i_add_en_bus[18]),
		.i_cmd(i_cmd_bus[56:54]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_1[191 : 128]),
		.o_vn_valid(w_vn_lvl_1_valid[5 : 4]),
		.o_adder(w_fan_lvl_1[159 : 96])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_10 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[0]),
		.i_data_bus(i_data_bus[383 : 320]),
		.i_add_en(i_add_en_bus[5]),
		.i_cmd(i_cmd_bus[17:15]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_0[383 : 320]),
		.o_vn_valid(w_vn_lvl_0_valid[11 : 10]),
		.o_adder(w_fan_lvl_0[351 : 288])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 4 ),
		.SEL_IN( 2 )) my_adder_11 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[2]),
		.i_data_bus({ w_fan_lvl_1[191:160], r_fan_ff_lvl_0_to_2[191:160], r_fan_ff_lvl_0_to_2[159:128], w_fan_lvl_1[159:128]}),
		.i_add_en(i_add_en_bus[25]),
		.i_cmd(i_cmd_bus[77:75]),
		.i_sel(i_sel_bus[3:2]),
		.o_vn(w_vn_lvl_2[127 : 64]),
		.o_vn_valid(w_vn_lvl_2_valid[3 : 2]),
		.o_adder(w_fan_lvl_2[95 : 32])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_12 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[0]),
		.i_data_bus(i_data_bus[447 : 384]),
		.i_add_en(i_add_en_bus[6]),
		.i_cmd(i_cmd_bus[20:18]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_0[447 : 384]),
		.o_vn_valid(w_vn_lvl_0_valid[13 : 12]),
		.o_adder(w_fan_lvl_0[415 : 352])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_13 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[1]),
		.i_data_bus({ w_fan_lvl_0[447:416], w_fan_lvl_0[415:384]}),
		.i_add_en(i_add_en_bus[19]),
		.i_cmd(i_cmd_bus[59:57]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_1[255 : 192]),
		.o_vn_valid(w_vn_lvl_1_valid[7 : 6]),
		.o_adder(w_fan_lvl_1[223 : 160])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_14 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[0]),
		.i_data_bus(i_data_bus[511 : 448]),
		.i_add_en(i_add_en_bus[7]),
		.i_cmd(i_cmd_bus[23:21]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_0[511 : 448]),
		.o_vn_valid(w_vn_lvl_0_valid[15 : 14]),
		.o_adder(w_fan_lvl_0[479 : 416])
	);

	edge_adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 8 ),
		.SEL_IN( 4 )) my_adder_15 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[4]),
		.i_data_bus({ w_fan_lvl_3[63:32], r_fan_ff_lvl_2_to_4[63:32], r_fan_ff_lvl_1_to_4[63:32], r_fan_ff_lvl_0_to_4[63:32], r_fan_ff_lvl_0_to_4[31:0], r_fan_ff_lvl_1_to_4[31:0], r_fan_ff_lvl_2_to_4[31:0], w_fan_lvl_3[31:0]}),
		.i_add_en(i_add_en_bus[30]),
		.i_cmd(i_cmd_bus[92:90]),
		.i_sel(i_sel_bus[19:16]),
		.o_vn(w_vn_lvl_4[63 : 0]),
		.o_vn_valid(w_vn_lvl_4_valid[1 : 0]),
		.o_adder(w_fan_lvl_4[31 : 0])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_16 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[0]),
		.i_data_bus(i_data_bus[575 : 512]),
		.i_add_en(i_add_en_bus[8]),
		.i_cmd(i_cmd_bus[26:24]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_0[575 : 512]),
		.o_vn_valid(w_vn_lvl_0_valid[17 : 16]),
		.o_adder(w_fan_lvl_0[543 : 480])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_17 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[1]),
		.i_data_bus({ w_fan_lvl_0[575:544], w_fan_lvl_0[543:512]}),
		.i_add_en(i_add_en_bus[20]),
		.i_cmd(i_cmd_bus[62:60]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_1[319 : 256]),
		.o_vn_valid(w_vn_lvl_1_valid[9 : 8]),
		.o_adder(w_fan_lvl_1[287 : 224])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_18 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[0]),
		.i_data_bus(i_data_bus[639 : 576]),
		.i_add_en(i_add_en_bus[9]),
		.i_cmd(i_cmd_bus[29:27]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_0[639 : 576]),
		.o_vn_valid(w_vn_lvl_0_valid[19 : 18]),
		.o_adder(w_fan_lvl_0[607 : 544])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 4 ),
		.SEL_IN( 2 )) my_adder_19 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[2]),
		.i_data_bus({ w_fan_lvl_1[319:288], r_fan_ff_lvl_0_to_2[319:288], r_fan_ff_lvl_0_to_2[287:256], w_fan_lvl_1[287:256]}),
		.i_add_en(i_add_en_bus[26]),
		.i_cmd(i_cmd_bus[80:78]),
		.i_sel(i_sel_bus[5:4]),
		.o_vn(w_vn_lvl_2[191 : 128]),
		.o_vn_valid(w_vn_lvl_2_valid[5 : 4]),
		.o_adder(w_fan_lvl_2[159 : 96])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_20 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[0]),
		.i_data_bus(i_data_bus[703 : 640]),
		.i_add_en(i_add_en_bus[10]),
		.i_cmd(i_cmd_bus[32:30]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_0[703 : 640]),
		.o_vn_valid(w_vn_lvl_0_valid[21 : 20]),
		.o_adder(w_fan_lvl_0[671 : 608])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_21 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[1]),
		.i_data_bus({ w_fan_lvl_0[703:672], w_fan_lvl_0[671:640]}),
		.i_add_en(i_add_en_bus[21]),
		.i_cmd(i_cmd_bus[65:63]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_1[383 : 320]),
		.o_vn_valid(w_vn_lvl_1_valid[11 : 10]),
		.o_adder(w_fan_lvl_1[351 : 288])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_22 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[0]),
		.i_data_bus(i_data_bus[767 : 704]),
		.i_add_en(i_add_en_bus[11]),
		.i_cmd(i_cmd_bus[35:33]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_0[767 : 704]),
		.o_vn_valid(w_vn_lvl_0_valid[23 : 22]),
		.o_adder(w_fan_lvl_0[735 : 672])
	);

	edge_adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 6 ),
		.SEL_IN( 4 )) my_adder_23 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[3]),
		.i_data_bus({ w_fan_lvl_2[191:160], r_fan_ff_lvl_1_to_3[191:160], r_fan_ff_lvl_0_to_3[191:160], r_fan_ff_lvl_0_to_3[159:128], r_fan_ff_lvl_1_to_3[159:128], w_fan_lvl_2[159:128]}),
		.i_add_en(i_add_en_bus[29]),
		.i_cmd(i_cmd_bus[89:87]),
		.i_sel(i_sel_bus[15:12]),
		.o_vn(w_vn_lvl_3[127 : 64]),
		.o_vn_valid(w_vn_lvl_3_valid[3 : 2]),
		.o_adder(w_fan_lvl_3[63 : 32])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_24 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[0]),
		.i_data_bus(i_data_bus[831 : 768]),
		.i_add_en(i_add_en_bus[12]),
		.i_cmd(i_cmd_bus[38:36]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_0[831 : 768]),
		.o_vn_valid(w_vn_lvl_0_valid[25 : 24]),
		.o_adder(w_fan_lvl_0[799 : 736])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_25 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[1]),
		.i_data_bus({ w_fan_lvl_0[831:800], w_fan_lvl_0[799:768]}),
		.i_add_en(i_add_en_bus[22]),
		.i_cmd(i_cmd_bus[68:66]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_1[447 : 384]),
		.o_vn_valid(w_vn_lvl_1_valid[13 : 12]),
		.o_adder(w_fan_lvl_1[415 : 352])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_26 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[0]),
		.i_data_bus(i_data_bus[895 : 832]),
		.i_add_en(i_add_en_bus[13]),
		.i_cmd(i_cmd_bus[41:39]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_0[895 : 832]),
		.o_vn_valid(w_vn_lvl_0_valid[27 : 26]),
		.o_adder(w_fan_lvl_0[863 : 800])
	);

	edge_adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 4 ),
		.SEL_IN( 2 )) my_adder_27 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[2]),
		.i_data_bus({ w_fan_lvl_1[447:416], r_fan_ff_lvl_0_to_2[447:416], r_fan_ff_lvl_0_to_2[415:384], w_fan_lvl_1[415:384]}),
		.i_add_en(i_add_en_bus[27]),
		.i_cmd(i_cmd_bus[83:81]),
		.i_sel(i_sel_bus[7:6]),
		.o_vn(w_vn_lvl_2[255 : 192]),
		.o_vn_valid(w_vn_lvl_2_valid[7 : 6]),
		.o_adder(w_fan_lvl_2[191 : 160])
	);

	adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_28 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[0]),
		.i_data_bus(i_data_bus[959 : 896]),
		.i_add_en(i_add_en_bus[14]),
		.i_cmd(i_cmd_bus[44:42]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_0[959 : 896]),
		.o_vn_valid(w_vn_lvl_0_valid[29 : 28]),
		.o_adder(w_fan_lvl_0[927 : 864])
	);

	edge_adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_29 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[1]),
		.i_data_bus({ w_fan_lvl_0[959:928], w_fan_lvl_0[927:896]}),
		.i_add_en(i_add_en_bus[23]),
		.i_cmd(i_cmd_bus[71:69]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_1[511 : 448]),
		.o_vn_valid(w_vn_lvl_1_valid[15 : 14]),
		.o_adder(w_fan_lvl_1[447 : 416])
	);

	edge_adder_switch #(
		.DATA_TYPE( 32 ),
		.NUM_IN( 2 ),
		.SEL_IN( 2 )) my_adder_30 (
		.clk(clk),
		.rst(rst),
		.i_valid(r_valid[0]),
		.i_data_bus(i_data_bus[1023 : 960]),
		.i_add_en(i_add_en_bus[15]),
		.i_cmd(i_cmd_bus[47:45]),
		.i_sel(2'b00),
		.o_vn(w_vn_lvl_0[1023 : 960]),
		.o_vn_valid(w_vn_lvl_0_valid[31 : 30]),
		.o_adder(w_fan_lvl_0[959 : 928])
	);


	// Flop last level adder cmd for timing matching
	always @ (posedge clk) begin
		if (rst == 1'b1) begin
			r_final_add <= 'd0;
			r_final_add2 <= 'd0;
			r_final_sum <= 'd0;
		end else begin
			r_final_add <= i_add_en_bus[30];
			r_final_add2 <= r_final_add;
			r_final_sum <= w_fan_lvl_4;
			end
	end


	// Assigning output bus (with correct timing and final adder mux)
	always @ (*) begin
		if (rst == 1'b1) begin
			o_data_bus <= 'd0;
		end else begin
			o_data_bus[479:0] <= r_lvl_output_ff[4575:4096];
			if (r_final_add2 == 1'b1) begin
				o_data_bus[511:480] <= r_final_sum;
			end else begin
				o_data_bus[511:480] <= r_lvl_output_ff[4607:4576];
			end
			o_data_bus[1023:512] <= r_lvl_output_ff[5119:4608];
		end
	end


	// Assigning output valid (with correct timing and final adder mux)
	always @ (*) begin
		if (rst == 1'b1 || r_valid[6] == 1'b0) begin
			o_valid <= 'd0;
		end else begin
			o_valid[14:0] <= r_lvl_output_ff_valid[143:128];
			if (r_final_add2 == 1'b1) begin
				o_valid[15] <= 1'b1 ;
			end else begin
				o_valid[15] <= r_lvl_output_ff_valid[143];
			end
			o_valid[31:16] <= r_lvl_output_ff_valid[159:144];
		end
	end


endmodule
