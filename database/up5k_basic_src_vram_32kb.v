// This program was cloned from: https://github.com/emeb/up5k_basic
// License: MIT License

// vram_32kb.v - 32k byte inferred RAM for video
// 05-16-18 E. Brombaugh

module vram_32kb(
    input clk,
    input we,
    input [14:0] addr,
    input [7:0] din,
    output reg [7:0] dout_byte,
	output [15:0] dout_word
);

	wire [15:0] data;
	
    // instantiate the big RAM
	SB_SPRAM256KA mem (
		.ADDRESS(addr[14:1]),
		.DATAIN({din,din}),
		.MASKWREN(addr[0]?4'b1100:4'b0011),
		.WREN(we),
		.CHIPSELECT(1'b1),
		.CLOCK(clk),
		.STANDBY(1'b0),
		.SLEEP(1'b0),
		.POWEROFF(1'b1),
		.DATAOUT(data)
	);
    
    // pipeline the output select
    reg hilo_sel;
    always @(posedge clk)
        hilo_sel <= addr[0];
	
	always @(*)
		dout_byte = hilo_sel ? data[15:8] : data[7:0];
	
	assign dout_word = data;
endmodule
