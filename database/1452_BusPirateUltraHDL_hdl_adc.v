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
`ifndef __ADC__
`define __ADC__
`define ADC_BITS 14
`define ADC_CALIBRATION_BITS 32
module adc (
// general control
	rst,				// resets module to known state
	clkin,				// clock that makes everyhting tick
// sync signals
	go,					// starts a SPI transmission
	state,				// state of module (0=idle, 1=busy/transmitting)
	calibrate,
// data in/out
	data_o,				// data out (will get received)
// spi signals
	sclk,				// SPI clock (= clkin/2)
	miso,				// master in slave out
	cs					// chip select
	);

//
input rst;
input clkin;

input go;
output reg state;
input calibrate;

output reg [`ADC_BITS-1:0] data_o;
reg [4:0] bitcount;		// number of bits to transmit

reg [2:0] delay;

input miso;
output reg sclk;
output reg cs;

// internal vars
reg clockphase;			// where are we in our clockcycle (0= 1st half, 1= 2nd half)

always @ (posedge clkin or posedge rst)

if(rst)
	begin
		data_o <= 16'h00;
		//mosi <= 1'b0;
		sclk <= 1'b0;
		state <= 1'b0;
		cs <= 1'b1;
		//bitcount <=4'b0000;
	end
else
	begin
		if(state === 1'b0)
			begin
			if(go === 1'b1)		// only accept go when we are idle
				begin	//start sending bits
					state <= 1'b1;
					//sclk <= 1'b0;
					cs <= 1'b0;			// cs line (auto?????)
					data_o <= 16'h00;
					delay<=3'b111;
					if(calibrate===1'b1)
						bitcount <= `ADC_CALIBRATION_BITS-1;
					else
						bitcount <= `ADC_BITS-1;
				end
			else //go === 1'b0
				begin	//idle everything
					//sclk <= 1'b0;		// clock line
					cs <= 1'b1;			// cs line
				end
			end

		else //state === 1'b1					// transmit the bits and receive them
		begin
			if(sclk === 1'b0)
				begin //clock low, setup data and tick the clock line
					delay<=delay-1;
					if(delay===3'b000)
						begin
							sclk <= 1'b1;
							delay<=3'b111;
						end
				end
		  else
				begin //clock high, read data and clear clock line
					delay<=delay-1;
					if(delay===3'b000)
						begin
							if(calibrate===1'b0)
								data_o[bitcount] <= miso;
							sclk <= 1'b0;
							bitcount <= bitcount - 1;
							delay<=3'b111;
							if(bitcount===0)
								begin
									state<=1'b0;
								end
							end
				end
		end
	end

endmodule
`endif
