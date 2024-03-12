`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: crossbar_comb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module crossbar_comb
# (
  // The data width of input data
  parameter data_width = 16,
  // The data width utilized for accumulated results
  parameter num_input = 8,
  parameter num_output = 8,
  // The latency of adder
  parameter sel_width = $clog2(num_input)
)
(
  input  wire  [num_input * data_width-1:0]  up_dat,
  input  wire  [num_output*sel_width-1:0]       sel,
  output wire  [num_output * data_width-1:0]      dn_dat
);

wire [data_width*num_input-1:0] joints[num_output-1:0];
wire [data_width-1:0] up_dats[num_input-1:0];
wire [data_width-1:0] dn_dats[num_output-1:0];
wire [sel_width-1:0]  sels[num_output-1:0];

genvar i,j;

generate
	for (i=0; i<num_input; i=i+1) begin :assign_inputs
			assign up_dats[i] = up_dat[( data_width*i + data_width-1) : (data_width*i)];
		end 

	for (j=0; j<num_output; j=j+1) begin :assign_outputs
	        assign sels[j] = sel[( sel_width*j + sel_width-1) : (sel_width*j)];
			assign dn_dat[( data_width*j + data_width-1) : (data_width*j)] = dn_dats[j];
		end 
endgenerate

generate
	// connection from input to mid where mid is the actual input to the mux
	for (i=0; i<num_input; i=i+1) begin :con_i
		for (j=0; j<num_output; j=j+1) begin :con_j
			assign joints[j][( data_width*i + data_width-1) : (data_width*i)] = up_dats[i];
		end // con_j
	end // connection

	// instantiate N mux 
	for (j=0; j<num_output; j = j+1) begin : u_mux
		mux_comb #(
		  .num_input(num_input),
		  .data_width(data_width)
		  ) u_mux_comb(
			.up_dat(joints[j]),
			.sel(sels[j]),
			.dn_dat(dn_dats[j])
			);
	end // mux_instant
endgenerate


endmodule
