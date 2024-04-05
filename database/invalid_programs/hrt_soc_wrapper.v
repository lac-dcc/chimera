module top(
	input clkin, gsrn,
	output [7:0] led
);

wire [7:0] soc_led;

/*
Run the SoC at a very slow clock for demonstration purposes
*/
reg [13:0] clkdiv;
always @(posedge clkin)
	clkdiv <= clkdiv + 1'b1;

attosoc soc_i (
	.clk(clkdiv[13]),
	.reset(~gsrn),
	.led(soc_led),
);

genvar ii;
generate
for (ii = 0; ii < 8; ii = ii + 1'b1) begin: led_buf
	LUT4 #(.INIT(16'h5555)) inv_i(.A(soc_led[ii]), .B(1'b1), .C(1'b1), .D(1'b1), .Z(led[ii]));
end
endgenerate

endmodule