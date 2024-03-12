`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: mux_reg
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


module mux_comb
# (
  // The data width of input data
  parameter data_width = 16,
  // The data width utilized for accumulated results
  parameter num_input = 1024,
  // The latency of adder
  parameter sel_width = $clog2(num_input)
)
(
  input  wire  [num_input * data_width-1:0]  up_dat,
  input  wire  [sel_width-1:0]       sel,
  output wire  [data_width-1:0]      dn_dat

);
genvar i,j;
wire [data_width-1:0] up_dats[num_input-1:0];
generate
	for (i=0; i<num_input; i=i+1) begin :assign_inputs
			assign up_dats[i] = up_dat[( data_width*i + data_width-1) : (data_width*i)];
		end 
endgenerate

assign dn_dat = up_dats[sel];

endmodule
