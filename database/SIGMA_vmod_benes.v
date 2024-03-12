`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////////////////////////

// Design: benes.v
// Author: Eric Qin

// Description: Benes Network (Distribution Network)

// Reference: https://www.cs.cmu.edu/afs/cs.cmu.edu/project/phrensy/pub/papers/AroraLM94/node7.html

///////////////////////////////////////////////////////////////////////////////////////////////////
/*
Sample Indexing Diagram with 8 PES example

Table:
 O   --> switch (regular)
 $	 --> input switch
 #   --> output switch
 

----------------------------------------------------------------------------------------------- 
Data IO Diagram: 

r_data_bus_ff[Element 0] -->  $     O     O     O     O     O     # --> w_dist_bus[Element 0]
 
r_data_bus_ff[Element 1] -->  $     O     O     O     O     O     # --> w_dist_bus[Element 1]
 
r_data_bus_ff[Element 2] -->  $     O     O     O     O     O     # --> w_dist_bus[Element 2]
 
r_data_bus_ff[Element 3] -->  $     O     O     O     O     O     # --> w_dist_bus[Element 3]
 
r_data_bus_ff[Element 4] -->  $     O     O     O     O     O     # --> w_dist_bus[Element 4]
 
r_data_bus_ff[Element 5] -->  $     O     O     O     O     O     # --> w_dist_bus[Element 5]
 
r_data_bus_ff[Element 6] -->  $     O     O     O     O     O     # --> w_dist_bus[Element 6]

r_data_bus_ff[Element 7] -->  $     O     O     O     O     O     # --> w_dist_bus[Element 7]


----------------------------------------------------------------------------------------------- 
Horizontal Internal Wires Diagram: (between each switch) 

$ w_internal[0]  O w_internal[2]  O w_internal[4]  O w_internal[6]  O w_internal[8]  O w_internal[10] # 

$ w_internal[12] O w_internal[14] O w_internal[16] O w_internal[18] O w_internal[20] O w_internal[22] # 

$ w_internal[24] O w_internal[26] O w_internal[28] O w_internal[30] O w_internal[32] O w_internal[34] # 

$ w_internal[36] O w_internal[38] O w_internal[40] O w_internal[42] O w_internal[44] O w_internal[46] #  

$ w_internal[48] O w_internal[50] O w_internal[52] O w_internal[54] O w_internal[56] O w_internal[58] # 

$ w_internal[60] O w_internal[62] O w_internal[64] O w_internal[66] O w_internal[68] O w_internal[70] # 

$ w_internal[72] O w_internal[74] O w_internal[76] O w_internal[78] O w_internal[80] O w_internal[82] # 

$ w_internal[84] O w_internal[86] O w_internal[88] O w_internal[90] O w_internal[92] O w_internal[94] #  

----------------------------------------------------------------------------------------------- 
Diagonal Internal Wires Diagram: (between each switch)

$ w_internal[1]  O w_internal[3]  O w_internal[5]  O w_internal[7]  O w_internal[9]  O w_internal[11] # 

$ w_internal[13] O w_internal[15] O w_internal[17] O w_internal[19] O w_internal[21] O w_internal[23] # 

$ w_internal[25] O w_internal[27] O w_internal[29] O w_internal[31] O w_internal[33] O w_internal[35] # 

$ w_internal[37] O w_internal[39] O w_internal[41] O w_internal[43] O w_internal[45] O w_internal[47] #  

$ w_internal[49] O w_internal[51] O w_internal[53] O w_internal[55] O w_internal[57] O w_internal[59] # 

$ w_internal[61] O w_internal[63] O w_internal[65] O w_internal[67] O w_internal[69] O w_internal[71] # 

$ w_internal[73] O w_internal[75] O w_internal[77] O w_internal[79] O w_internal[81] O w_internal[83] # 

$ w_internal[85] O w_internal[87] O w_internal[89] O w_internal[91] O w_internal[93] O w_internal[95] #  

----------------------------------------------------------------------------------------------- 
Mux Select Signals Diagram (inputs to each switch)
	* input switch does not require any control signals --> value will go to both horizontal and diagonal
	* output switch only requires one control bit

NA  r_mux_bus_ff[0,1]      r_mux_bus_ff[2,3]      r_mux_bus_ff[4,5]      r_mux_bus_ff[6,7]      r_mux_bus_ff[8,9]     r_mux_bus_ff[80]

NA  r_mux_bus_ff[10,11]    r_mux_bus_ff[12,13]    r_mux_bus_ff[14,15]    r_mux_bus_ff[16,17]    r_mux_bus_ff[18,19]   r_mux_bus_ff[81]

NA  r_mux_bus_ff[20,21]    r_mux_bus_ff[22,23]    r_mux_bus_ff[24,25]    r_mux_bus_ff[26,27]    r_mux_bus_ff[28,29]   r_mux_bus_ff[82]

NA  r_mux_bus_ff[30,31]    r_mux_bus_ff[32,33]    r_mux_bus_ff[34,35]    r_mux_bus_ff[36,37]    r_mux_bus_ff[38,39]   r_mux_bus_ff[83]

NA  r_mux_bus_ff[40,41]    r_mux_bus_ff[42,43]    r_mux_bus_ff[44,45]    r_mux_bus_ff[46,47]    r_mux_bus_ff[48,49]   r_mux_bus_ff[84]

NA  r_mux_bus_ff[50,51]    r_mux_bus_ff[52,53]    r_mux_bus_ff[54,55]    r_mux_bus_ff[56,57]    r_mux_bus_ff[58,59]   r_mux_bus_ff[85]

NA  r_mux_bus_ff[60,61]    r_mux_bus_ff[62,63]    r_mux_bus_ff[64,65]    r_mux_bus_ff[66,67]    r_mux_bus_ff[68,69]   r_mux_bus_ff[86]

NA  r_mux_bus_ff[70,71]    r_mux_bus_ff[72,73]    r_mux_bus_ff[74,75]    r_mux_bus_ff[76,77]    r_mux_bus_ff[78,79]   r_mux_bus_ff[87]


----------------------------------------------------------------------------------------------- 

*/
///////////////////////////////////////////////////////////////////////////////////////////////////

module benes # (
	parameter DATA_TYPE = 16, // data type
	parameter NUM_PES = 8, // num of pes
	parameter LEVELS = 7) ( // 2*(log2PE) + 1
	clk,
	rst,
	i_data_bus, // input data bus
	i_mux_bus, // mux select control bus
	o_dist_bus // output bus to the multipliers
);

	input clk;
	input rst;
	input [NUM_PES * DATA_TYPE -1 : 0] i_data_bus; // input data bus
	input [2*(LEVELS-2)*NUM_PES + NUM_PES-1 : 0] i_mux_bus; // mux select bus

	output reg [NUM_PES * DATA_TYPE -1 : 0] o_dist_bus; // output distribution bus

	reg [NUM_PES * DATA_TYPE -1 : 0] r_data_bus_ff; // FF version of input data bus
	reg [2*(LEVELS-2)*NUM_PES + NUM_PES-1 : 0] r_mux_bus_ff; // FF version of mux select bus

	wire [NUM_PES * DATA_TYPE -1 : 0] w_dist_bus; // wire to be FF to o_dist_bus
	wire [DATA_TYPE-1 : 0] w_internal [2*NUM_PES*(LEVELS-1)-1:0]; // internal wire 

	always @ (*) begin // Fix: latched rather than FF (timing fix)
		if (rst == 1'b1) begin
			r_data_bus_ff <= 'd0;
		end else begin
			r_data_bus_ff <= i_data_bus;
		end
	end
	
	always @ (posedge clk) begin
		if (rst == 1'b1) begin
			r_mux_bus_ff <= 'd0;
			o_dist_bus <= 'd0;
		end else begin
			r_mux_bus_ff <= i_mux_bus;
			o_dist_bus <= w_dist_bus;		
		end
	end

	genvar i, j; 
	
	/////////////////////////////////////////////////////////////////////////
	// First Level - Input
	/////////////////////////////////////////////////////////////////////////
	generate
		for (i=0; i<NUM_PES; i=i+1) begin : in_switch
			input_switch #(.WIDTH(DATA_TYPE)) in_switch (
				.y(w_internal[2*i*(LEVELS-1)]), // horizontal output of switch to w_internal
				.z(w_internal[2*i*(LEVELS-1)+1]), // diagonal output of switch to w_internal
				.in(r_data_bus_ff[(i+1)*DATA_TYPE-1:i*DATA_TYPE])
			);
		end
	endgenerate

	/////////////////////////////////////////////////////////////////////////
	// Last Level - Output
	/////////////////////////////////////////////////////////////////////////
	generate
		for (i=0; i<NUM_PES; i=i+1) begin : out_switch
			if (i % 2 == 0) begin : from_nw // input diagonal link from south-west switch, should always be horizontal
				output_switch  #(.WIDTH(DATA_TYPE))  out_switch (
					.y(w_dist_bus[i*DATA_TYPE+DATA_TYPE-1 : i*DATA_TYPE]), // to output dist bus
					.in0(w_internal[2*i*(LEVELS-1)+(2*(LEVELS-2))]), // connect from the horizontal switch
					.in1(w_internal[2*(i+1)*(LEVELS-1)+(2*(LEVELS-2))+1]), // connect from the south-west diagonal switch
					.sel(r_mux_bus_ff[2*NUM_PES*(LEVELS-2)+i]) // mux select bit
				);
			end else begin : from_sw // input diagonal link from north-west switch
				output_switch  #(.WIDTH(DATA_TYPE))  out_switch (
					.y(w_dist_bus[i*DATA_TYPE+DATA_TYPE-1 : i*DATA_TYPE]), // to output dist bus
					.in0(w_internal[2*i*(LEVELS-1)+(2*(LEVELS-2))]), // connect from the horizontal switch
					.in1(w_internal[2*(i-1)*(LEVELS-1)+(2*(LEVELS-2))+1]), // connect from the north-west diagonal switch
					.sel(r_mux_bus_ff[2*NUM_PES*(LEVELS-2)+i]) // mux select bit
				);
			end
		end
	endgenerate 


	/////////////////////////////////////////////////////////////////////////
	// Intermediate Levels - Everything else in between
	/////////////////////////////////////////////////////////////////////////
	generate
		for (i=0; i<NUM_PES; i=i+1) begin :mid_switch_y
			for (j=1; j<=(LEVELS-2); j=j+1) begin: mid_switch_x
				// mid and left of mid switches
				if (j <= (LEVELS-1)/2 ) begin : mid_and_left 
					if (i % (2**j) < (2**(j-1))) begin : from_sw // input diagonal link from south-west switch
						switch  #(.WIDTH(DATA_TYPE))  imm_switch (
							.y(w_internal[2*i*(LEVELS-1)+2*j]), // horizontal output of switch to w_internal
							.z(w_internal[2*i*(LEVELS-1)+2*j+1]), // diagonal output of switch to w_internal
							.in0(w_internal[2*i*(LEVELS-1)+2*(j-1)]), // connect from the horizontal switch
							.in1(w_internal[2*(i+(2**(j-1)))*(LEVELS-1)+2*(j-1)+1]), // connect from a diagonal switch
							.sel0(r_mux_bus_ff[2*(LEVELS-2)*i+(2*(j-1))]), // mux select bit
							.sel1(r_mux_bus_ff[2*(LEVELS-2)*i+(2*(j-1)+1)]) // mux select bit
						);
					end else begin : from_nw // input diagonal link from north-west switch
						switch  #(.WIDTH(DATA_TYPE))  imm_switch (
							.y(w_internal[2*i*(LEVELS-1)+2*j]),  // horizontal output of switch to w_internal
							.z(w_internal[2*i*(LEVELS-1)+2*j+1]), // diagonal output of switch to w_internal
							.in0(w_internal[2*i*(LEVELS-1)+2*(j-1)]), // connect from the horizontal switch
							.in1(w_internal[2*(i-(2**(j-1)))*(LEVELS-1)+2*(j-1)+1]), // connect from a diagonal switch
							.sel0(r_mux_bus_ff[2*(LEVELS-2)*i+(2*(j-1))]), // mux select bit
							.sel1(r_mux_bus_ff[2*(LEVELS-2)*i+(2*(j-1)+1)]) // mux select bit
						);
					end
				// right of mid switches
				end else begin : right_of_mid
					if (i % (2**(LEVELS-j)) < (2**(LEVELS-j-1))) begin : from_sw // input diagonal link from south-west switch 
						switch  #(.WIDTH(DATA_TYPE))  imm_switch (
							.y(w_internal[2*i*(LEVELS-1)+2*j]), // horizontal output of switch to w_internal
							.z(w_internal[2*i*(LEVELS-1)+2*j+1]), // diagonal output of switch to w_internal
							.in0(w_internal[2*i*(LEVELS-1)+2*(j-1)]), // connect from the horizontal switch
							.in1(w_internal[2*(i+(2**(LEVELS-j-1)))*(LEVELS-1)+2*(j-1)+1]), // connect from a diagonal switch 
							.sel0(r_mux_bus_ff[2*(LEVELS-2)*i+(2*(j-1))]), // mux select bit
							.sel1(r_mux_bus_ff[2*(LEVELS-2)*i+(2*(j-1)+1)]) // mux select bit
						);
					end else begin : from_nw// input diagonal link from north-west switch
						switch  #(.WIDTH(DATA_TYPE))  imm_switch (
							.y(w_internal[2*i*(LEVELS-1)+2*j]), // horizontal output of switch to w_internal
							.z(w_internal[2*i*(LEVELS-1)+2*j+1]), // diagonal output of switch to w_internal
							.in0(w_internal[2*i*(LEVELS-1)+2*(j-1)]), // connect from the horizontal switch
							.in1(w_internal[2*(i-(2**(LEVELS-j-1)))*(LEVELS-1)+2*(j-1)+1]), // connect from a diagonal switch 
							.sel0(r_mux_bus_ff[2*(LEVELS-2)*i+(2*(j-1))]), // mux select bit
							.sel1(r_mux_bus_ff[2*(LEVELS-2)*i+(2*(j-1)+1)]) // mux select bit
						);
					end
				end
			end
		end
	endgenerate 

endmodule


//////////////////////////////////////////////////////////////////////////////////////

module input_switch #(parameter WIDTH = 16) (y, z, in);

	output [WIDTH-1:0] y, z;
	input [WIDTH-1:0] in;
	
	assign y = in;
	assign z = in;

endmodule

//////////////////////////////////////////////////////////////////////////////////////

module output_switch #(parameter WIDTH = 16) (y, in0, in1, sel);

	output [WIDTH-1:0] y;
	input [WIDTH-1:0] in0, in1;
	input sel;

	// If select is 0, output from horizontal
	// If select is 1, output from diagonal
	
	benes_mux #(.W(WIDTH)) mux0 ( .o(y), .a(in0), .b(in1), .sel(sel) );

endmodule


//////////////////////////////////////////////////////////////////////////////////////

module switch #(parameter WIDTH = 16) (y, z, in0, in1, sel0, sel1);

	output [WIDTH-1:0] y, z;
	input [WIDTH-1:0] in0, in1;
	input sel0, sel1;

	// If select is 0, then pass input from horizontal
	// If select is 1, then pass input from diagonal
	// y output goes to horizontal
	// z output goes to diagonal
	
	benes_mux #(.W(WIDTH)) mux0 ( .o(y), .a(in0), .b(in1), .sel(sel0) ); // y output is horizontal
	benes_mux #(.W(WIDTH)) mux1 ( .o(z), .a(in0), .b(in1), .sel(sel1) ); // z output is diagonal

endmodule

//////////////////////////////////////////////////////////////////////////////////////

module benes_mux #(parameter W = 16) (o, a, b, sel);
	
	output reg [W-1:0] o;
	input [W-1:0] a, b;
	input sel;

	always @ (sel or a or b) begin
		o = sel ? b : a;
	end

endmodule 

//////////////////////////////////////////////////////////////////////////////////////


