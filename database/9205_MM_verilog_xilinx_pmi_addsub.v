// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense

`timescale 1ns / 1ps

module pmi_addsub #(
	parameter pmi_data_width    = 32,
	parameter pmi_result_width  = 32,
	parameter pmi_sign   = "off", // unused
	parameter pmi_family = 0,
	parameter module_type= "pmi_addsub"
	)(
	input wire [pmi_data_width - 1 : 0] DataA,
	input wire [pmi_data_width - 1 : 0] DataB,
	input wire Cin,
	input wire Add_Sub,
	output wire [pmi_result_width - 1 : 0]Result,
	output wire Cout,
	output wire Overflow
);

wire [pmi_data_width : 0] tmp_addResult = DataA + DataB + Cin;
wire [pmi_data_width : 0] tmp_subResult = DataA - DataB - !Cin;   

assign Result = (Add_Sub == 1) ? tmp_addResult[pmi_result_width - 1 : 0] : tmp_subResult[pmi_result_width - 1 : 0];
assign Cout = (Add_Sub == 1) ? tmp_addResult[pmi_data_width] : !tmp_subResult[pmi_data_width];
assign Overflow = Cout;

endmodule
