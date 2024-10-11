// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// from https://stackoverflow.com/questions/37431914/ice40-icestorm-fpga-flow-bi-directional-io-pins

// last updated 2020-06-01 by mza
`define icestick

module top(
	input CLK,
	output reg LED1 = 0,
	inout J1_3
);
	wire din;
	reg dout = 0;
	reg dout_en = 0;
	SB_IO #(
	    .PIN_TYPE(6'b 1010_01),
	    .PULLUP(1'b 0)
	) my_inout (
	    .PACKAGE_PIN(J1_3),
	    .OUTPUT_ENABLE(dout_en),
	    .D_OUT_0(dout),
	    .D_IN_0(din)
	);
	always @(posedge CLK) begin
		if (din) begin
			LED1 <= 1;
			dout <= 1;
			dout_en <= 1;
		end else begin
			LED1 <= 0;
		end
	end
endmodule // top

