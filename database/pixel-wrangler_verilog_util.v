`ifndef _util_v_
`define _util_v_

module
tristate(
	inout pin,
	input enable,
	input data_out,
	output data_in
);
	parameter PULLUP = 1'b0;
	SB_IO #(
		.PIN_TYPE(6'b1010_01), // tristatable output
		.PULLUP(PULLUP)
	) buffer(
		.PACKAGE_PIN(pin),
		.OUTPUT_ENABLE(enable),
		.D_IN_0(data_in),
		.D_OUT_0(data_out)
	);
endmodule


module clk_div3(
	input clk,
	input reset,
	output clk_out
);
	reg [1:0] pos_count, neg_count;
	assign clk_out = (pos_count == 2) || (neg_count == 2);
 
	always @(posedge clk)
	if (reset || pos_count == 2)
		pos_count <= 0;
	else
		pos_count <= pos_count + 1;

	always @(negedge clk)
	if (reset || neg_count == 2)
		neg_count <= 0;
	else
		neg_count <= neg_count + 1;
 
endmodule


module spram_32k(
	input clk,
	input reset = 0,
	input cs = 1,
	input wen,
	input [13:0] wr_addr,
	input [15:0] wr_data,
	input [3:0] wr_mask = 4'b1111,
	input [13:0] rd_addr,
	output [15:0] rd_data
);
	SB_SPRAM256KA ram(
		// read 16 bits at a time
		.DATAOUT(rd_data),
		.ADDRESS(wen ? wr_addr : rd_addr),
		.DATAIN(wr_data),
		.MASKWREN(wr_mask),
		.WREN(wen),

		.CHIPSELECT(cs && !reset),
		.CLOCK(clk),

		// if we cared about power, maybe we would adjust these
		.STANDBY(1'b0),
		.SLEEP(1'b0),
		.POWEROFF(1'b1)
	);

endmodule


module clock_cross_strobe(
	input clk_in,
	input in,
	input clk_out,
	output out
);
	reg flag = 0;
	reg last_flag = 0;
	reg out = 0;

	always @(posedge clk_in)
		if (in)
			flag <= ~flag;

	always @(posedge clk_out)
	begin
		out <= last_flag != flag;
		last_flag <= flag;
	end
endmodule


module edge_detect(
	input clk,
	input in,
	output fall,
	output rise
);
	reg last;
	assign fall = !in &&  last;
	assign rise =  in && !last;
	always @(posedge clk)
		last <= in;
endmodule

`endif
