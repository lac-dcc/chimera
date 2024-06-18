// This program was cloned from: https://github.com/glacc/untitled_verilog_microcontroller
// License: CERN Open Hardware Licence Version 2 - Strongly Reciprocal

module pio (
	input		[3:0]		addr,
	input		[7:0]		data_in,
	output	[7:0]		data_out,
	
	inout		[7:0]		p0,
	inout		[7:0]		p1,
	inout		[7:0]		p2,
	inout		[7:0]		p3,
	
	input		clk,
	input		wren,
	input		rden,
	input		ce,

	input		rst
);
	
	wire	en_p0;
	wire	en_p1;
	wire	en_p2;
	wire	en_p3;
	assign	en_p0 = (ce & addr[3:1] == 3'd0) ? 1'b1 : 1'b0;
	assign	en_p1 = (ce & addr[3:1] == 3'd1) ? 1'b1 : 1'b0;
	assign	en_p2 = (ce & addr[3:1] == 3'd2) ? 1'b1 : 1'b0;
	assign	en_p3 = (ce & addr[3:1] == 3'd3) ? 1'b1 : 1'b0;

	reg	[7:0]		data_out_latch = 8'b00000000;
	assign	data_out = (ce & rden & !wren) ? data_out_latch : 8'bzzzzzzzz;

	wire	[7:0]		data_out_p0;
	wire	[7:0]		data_out_p1;
	wire	[7:0]		data_out_p2;
	wire	[7:0]		data_out_p3;

	pio_port	port0 (
		.gpio					(p0),
		.rs					(addr[0]),
		.rden					(rden),
		.wren					(wren),
		.en					(en_p0),
		.data_in				(data_in),
		.data_out_direct	(data_out_p0),
		.clk					(clk),
		.rst					(rst)
	);

	pio_port	port1 (
		.gpio					(p1),
		.rs					(addr[0]),
		.rden					(rden),
		.wren					(wren),
		.en					(en_p1),
		.data_in				(data_in),
		.data_out_direct	(data_out_p1),
		.clk					(clk),
		.rst					(rst)
	);

	pio_port	port2 (
		.gpio					(p2),
		.rs					(addr[0]),
		.rden					(rden),
		.wren					(wren),
		.en					(en_p2),
		.data_in				(data_in),
		.data_out_direct	(data_out_p2),
		.clk					(clk),
		.rst					(rst)
	);

	pio_port	port3 (
		.gpio					(p3),
		.rs					(addr[0]),
		.rden					(rden),
		.wren					(wren),
		.en					(en_p3),
		.data_in				(data_in),
		.data_out_direct	(data_out_p3),
		.clk					(clk),
		.rst					(rst)
	);

	always @(posedge clk) begin
		if (!rst) begin
			data_out_latch = 8'b00000000;
		end else if (rden) begin
			case (addr[3:1])
				3'd0:	data_out_latch = data_out_p0;
				3'd1:	data_out_latch = data_out_p1;
				3'd2:	data_out_latch = data_out_p2;
				3'd3:	data_out_latch = data_out_p3;
			endcase
		end
	end
	
endmodule