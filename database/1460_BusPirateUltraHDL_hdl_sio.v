// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0

// ---------------------------------------------------------------------------
//
// SPI master verilog implementation
//
// Written by Chris van Dongen/SMDprutser for the buspirate NextGen Ultra
// SPI info here: https://en.wikipedia.org/wiki/Serial_Peripheral_Interface
//
// ---------------------------------------------------------------------------
`ifndef __SIO__
`define __SIO__
module sio (
// general control
	rst,				// resets module to known state
	clkin,				// clock that makes everyhting tick
// sync signals
	go,					// starts a SPI transmission
	state,				// state of module (0=idle, 1=busy/transmitting)
	autocs,
	bits,
// data in/out
	data_i,				// data in (will get transmitted)
	data_o,				// data out (will get received)
// spi signals
	mosi,				// master out slave in
	sclk,				// SPI clock (= clkin/2)
	miso,				// master in slave out
	cs					// chip select
	);

//
input rst;
input clkin;

input autocs;
input go;
output reg state;
input [15:0] data_i;
output reg [15:0] data_o;
input [3:0] bits;
reg [3:0] bitcount;		// number of bits to transmit

input miso;
output reg mosi;
output reg sclk;
output reg cs;

// internal vars

reg clockphase;			// where are we in our clockcycle (0= 1st half, 1= 2nd half)

always @ (posedge clkin or posedge rst)

if(rst)
	begin
		data_o <= 16'h00;
		mosi <= 1'b0;
		sclk <= 1'b0;
		state <= 1'b0;
		cs <= 1'b1;
		bitcount <=4'b0000;
	end
else
	begin
		if(state === 1'b0)
			begin
			if(go === 1'b1)		// only accept go when we are idle
				begin	//start sending bits
					state <= 1'b1;
					//sclk <= 1'b0;
					if(autocs) cs <= 1'b0;			// cs line (auto?????)
					data_o <= 16'h00;
					bitcount <= bits;
				end
			else //go === 1'b0
				begin	//idle everything
					//sclk <= 1'b0;		// clock line
					if (autocs) cs <= 1'b1;			// cs line
				end
			end

		else //state === 1'b1					// transmit the bits and receive them
		begin
			if(sclk === 1'b0)
				begin //clock low, setup data and tick the clock line
					mosi <= data_i[bitcount];
					sclk <= 1'b1;
				end
		  else
				begin //clock high, read data and clear clock line
					data_o[bitcount] <= miso;
					sclk <= 1'b0;
					bitcount <= bitcount - 1;
					if(bitcount===4'b0000)
						begin
							state<=1'b0;
						end
				end
		end
	end

endmodule
`endif
