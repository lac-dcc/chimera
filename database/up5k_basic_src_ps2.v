// ps2.v - PS/2 synchronous serial I/O port
// 04-01-19 E. Brombaugh

`default_nettype none

module ps2(
	input clk,				// system clock
	input rst,				// system reset
	input cs,				// chip select
	input we,				// write enable
	input [1:0] addr,		// register select
	input [7:0] din,		// data bus input
	output reg [7:0] dout,	// data bus output
	output [3:0] diag,		// diagnostic output
	inout ps2_clk,			// ps2 clock pin
	inout ps2_dat			// ps2 data pin
);
	// addresses
	localparam PS2_CTRL = 2'd0;		// PS2 control register location
	localparam PS2_DATA = 2'd1;		// PS2 data register location
	localparam PS2_RSTA = 2'd2;		// PS2 raw status register location
	localparam PS2_RDAT = 2'd3;		// PS2 raw data register location

	// common signals
	wire ps2_clk_in, ps2_dat_in, clrerr;
	
	// synchronize to local clock
	reg [2:0] clk_pipe, dat_pipe;
	reg ps2_clk_ena, ps2_clk_sync, ps2_dat_sync;
	always @(posedge clk)
	begin
		clk_pipe <= {clk_pipe[1:0], ps2_clk_in};
		dat_pipe <= {dat_pipe[1:0], ps2_dat_in};
		ps2_clk_ena <= clk_pipe[2] & !clk_pipe[1]; // falling edge
		ps2_clk_sync <= clk_pipe[2]; 
		ps2_dat_sync <= dat_pipe[2]; // prior to rising edge.
	end
	
	// Transmit PS/2 data
	wire tx_active, tx_err, ps2_clk_oe, ps2_dat_oe;
	ps2_tx utx(
		.clk(clk),
		.rst(rst | clrerr),
		.tx_ena(cs & (addr == PS2_DATA) & we),
		.tx_data(din),
		.ps2_clk_ena(ps2_clk_ena),
		.ps2_clk_sync(ps2_clk_sync),
		.ps2_dat_sync(ps2_dat_sync),
		.tx_active(tx_active),
		.tx_err(tx_err),
		.ps2_clk_oe(ps2_clk_oe),
		.ps2_dat_oe(ps2_dat_oe)
	);
	
	// Receive raw PS/2 data
	wire [7:0] rx_code;
	wire rx_done, rx_frmerr, rx_parerr;
	ps2_rx urx(
		.clk(clk),
		.rst(rst | clrerr | tx_active),
		.ps2_clk_ena(ps2_clk_ena),
		.ps2_dat_sync(ps2_dat_sync),
		.rx_code(rx_code),
		.rx_done(rx_done),
		.rx_frmerr(rx_frmerr),
		.rx_parerr(rx_parerr)
	);
	
	// Decode from scan codes to ASCII
	wire [7:0] ascii;
	wire valid, caps_lock;
	ps2_decode udecode(
		.clk(clk),
		.rst(rst | clrerr),
		.ena(rx_done),
		.code(rx_code),
		.ascii(ascii),
		.valid(valid),
		.caps_lock(caps_lock)
	);
		
	// raw data and status
	reg [7:0] raw_data;
	reg raw_rdy;
	always @(posedge clk)
		if(rst | clrerr)
			raw_rdy <= 1'b0;
		else
		begin
			if(rx_done)
			begin
				raw_data <= rx_code;
				raw_rdy <= 1'b1;
			end
			else if(cs & !we & (addr == PS2_RDAT))
				raw_rdy <= 1'b0;
		end
		
	// RX ready and overflow bits
	reg rx_rdy, rx_ovfl;
	always @(posedge clk)
		if(rst | clrerr)
		begin
			rx_rdy <= 1'b0;
			rx_ovfl <= 1'b0;
		end
		else if(valid)
		begin
			// data received - set ready
			rx_rdy <= 1'b1;
			//overflow if previous ready not cleared
			rx_ovfl <= rx_rdy;
		end
		else if(cs & !we & (addr == PS2_DATA))
		begin
			// clear ready when reading data
			rx_rdy <= 1'b0;
		end
	
	// control register - just the clear bit for now
	reg cr;
	always @(posedge clk)
		if(rst)
			cr <= 1'b0;
		else if(cs & we & (addr == PS2_CTRL))
			cr <= din[0];
	assign clrerr = cr;
		
	// data output
	always @(posedge clk)
		if(cs & !we)
			case(addr)
				PS2_CTRL: dout <= {
							1'b0,
							tx_err,
							~tx_active,
							caps_lock,
							rx_parerr,
							rx_frmerr,
							rx_ovfl,
							rx_rdy
						};	// read status
				PS2_DATA: dout <= ascii;	// read ascii data
				PS2_RSTA: dout <= {7'h00,raw_rdy}; // raw status 
				PS2_RDAT: dout <= raw_data;	// read ascii data
			endcase
	
	// Clock driver
	SB_IO #(
		.PIN_TYPE(6'b101001),
		.PULLUP(1'b0),
		.NEG_TRIGGER(1'b0),
		.IO_STANDARD("SB_LVCMOS")
	) uclk (
		.PACKAGE_PIN(ps2_clk),
		.LATCH_INPUT_VALUE(1'b0),
		.CLOCK_ENABLE(1'b0),
		.INPUT_CLK(1'b0),
		.OUTPUT_CLK(1'b0),
		.OUTPUT_ENABLE(ps2_clk_oe),
		.D_OUT_0(1'b0),
		.D_OUT_1(1'b0),
		.D_IN_0(ps2_clk_in),
		.D_IN_1()
	);

	// Data driver
	SB_IO #(
		.PIN_TYPE(6'b101001),
		.PULLUP(1'b0),
		.NEG_TRIGGER(1'b0),
		.IO_STANDARD("SB_LVCMOS")
	) udat (
		.PACKAGE_PIN(ps2_dat),
		.LATCH_INPUT_VALUE(1'b0),
		.CLOCK_ENABLE(1'b0),
		.INPUT_CLK(1'b0),
		.OUTPUT_CLK(1'b0),
		.OUTPUT_ENABLE(ps2_dat_oe),
		.D_OUT_0(1'b0),
		.D_OUT_1(1'b0),
		.D_IN_0(ps2_dat_in),
		.D_IN_1()
	);

	// hook up diagnostics
	assign diag = {ps2_dat_oe,ps2_clk_oe,tx_err,tx_active};
endmodule
