// This program was cloned from: https://github.com/emeb/up5k_basic
// License: MIT License

// ram_32kb.v - 32k byte inferred RAM
// 03-11-18 E. Brombaugh

module ram_32kb(
    input clk,
    input sel,
    input we,
	input [7:0] wp,
    input [14:0] addr,
    input [7:0] din,
    output reg [7:0] dout
);

	// write protect 4k blocks
	reg wp_we;
	always @(*)
		case(addr[14:12])
			3'd0:wp_we = (~wp[0] & we);
			3'd1:wp_we = (~wp[1] & we);
			3'd2:wp_we = (~wp[2] & we);
			3'd3:wp_we = (~wp[3] & we);
			3'd4:wp_we = (~wp[4] & we);
			3'd5:wp_we = (~wp[5] & we);
			3'd6:wp_we = (~wp[6] & we);
			3'd7:wp_we = (~wp[7] & we);
		endcase
			
//`define SIMULATE
`ifdef SIMULATE
	integer i;
    reg [7:0] memory[0:32767];
	
	// clear RAM to avoid simulation errors
	initial
		for (i = 0; i < 32768; i = i +1)
			memory[i] <= 0;
    
    // synchronous write
    always @(posedge clk)
        if(sel & wp_we)
            memory[addr] <= din;
    
    // synchronous read
    always @(posedge clk)
        dout <= memory[addr];
`else
	wire [15:0] data;
	
    // instantiate the big RAM
	SB_SPRAM256KA mem (
		.ADDRESS(addr[14:1]),
		.DATAIN({din,din}),
		.MASKWREN(addr[0]?4'b1100:4'b0011),
		.WREN(wp_we),
		.CHIPSELECT(sel),
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
		dout = hilo_sel ? data[15:8] : data[7:0];
`endif
endmodule
