// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on

module pdp1_cpu_alu_div (
   in_clock,
	denom,
	numer,
	quotient,
	remain);

	input in_clock;
	input	[16:0]  denom;
	input	[33:0]  numer;
	output	[33:0]  quotient;
	output	[16:0]  remain;

	wire [33:0] sub_wire0;
	wire [16:0] sub_wire1;
	wire [33:0] quotient = sub_wire0[33:0];
	wire [16:0] remain = sub_wire1[16:0];

	lpm_divide	LPM_DIVIDE_component (
				.denom (denom),
				.numer (numer),
				.quotient (sub_wire0),
				.remain (sub_wire1),
				.aclr (1'b0),
				.clken (1'b1),
				.clock (in_clock));
	defparam
		LPM_DIVIDE_component.lpm_drepresentation = "UNSIGNED",
		LPM_DIVIDE_component.lpm_hint = "MAXIMIZE_SPEED=6,LPM_REMAINDERPOSITIVE=TRUE,LPM_PIPELINE=34",
		LPM_DIVIDE_component.lpm_nrepresentation = "UNSIGNED",
		LPM_DIVIDE_component.lpm_type = "LPM_DIVIDE",
		LPM_DIVIDE_component.lpm_widthd = 17,
		LPM_DIVIDE_component.lpm_widthn = 34;		
endmodule

module color_lut (
	input 					read_clk,
	input 		[7:0] 	input_index,
	output reg 	[23:0] 	output_color,
	input						write_clk,
	input 		[7:0] 	write_address,
	input 		[23:0]	write_data,
	input 					write_enable
);

reg [23:0] mem [255:0];

always @(posedge read_clk) output_color <= mem[input_index];

always @(posedge write_clk) if (write_enable) mem[write_address] <= write_data;

endmodule