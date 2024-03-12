// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014
//
// SPI mode 0 8-bit master module

/*
    This file is part of ZX-Evo Base Configuration firmware.

    ZX-Evo Base Configuration firmware is free software:
    you can redistribute it and/or modify it under the terms of
    the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    ZX-Evo Base Configuration firmware is distributed in the hope that
    it will be useful, but WITHOUT ANY WARRANTY; without even
    the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    See the GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with ZX-Evo Base Configuration firmware.
    If not, see <http://www.gnu.org/licenses/>.
*/


// short diagram for speed=0 (Fclk/Fspi=2, no rdy shown)
//
// clock:   ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^ (positive edges)
// counter: |00|00|10|11|12|13|14|15|16|17|18|19|1A|1B|1C|1D|1E|1F|00|00|00 // internal!
// sck:   ___________/``\__/``\__/``\__/``\__/``\__/``\__/``\__/``\_______
// sdo:   --------< do7 X do6 X do5 X do4 X do3 X do2 X do1 X do0 >-------
// sdi:   --------< di7 X di6 X di5 X di4 X di3 X di2 X di1 X di0 >-------
// bsync: ________/`````\_________________________________________________
// start: _____/``\_______________________________________________________
// din:   -----<IN>-------------------------------------------------------
// dout:   old old old old old old old old old old old old old | new new new
//
// data on sdo must be latched by slave on rising sck edge. data on sdo changes on falling edge of sck
//
// data from sdi is latched by master on positive edge of sck, while slave changes it on falling edge.
//  WARNING: slave must emit valid di7 bit BEFORE first pulse on sck!
//
// bsync is 1 while do7 is outting, otherwise it is 0
//
// start is synchronous pulse, which starts all transfer and also latches din data on the same clock edge
//  as it is registered high. start can be given anytime (only when speed=0),
//  so it is functioning then as synchronous reset. when speed!=0, there is global enable for majority of
//  flipflops in the module, so start can't be accepted at any time
//
// dout updates with freshly received data at the clock edge in which sck goes high for the last time, thus
//  latching last bit on sdi.
//
// sdo emits last bit shifted out after the transfer end
//
// when speed=0, data transfer rate could be as fast as one byte every 16 clock pulses. To achieve that,
//   start must be pulsed high simultaneously with the last high pulse of sck
//
// speed[1:0] determines Fclk/Fspi
//
//  speed | Fclk/Fspi
//  ------+----------
//  2'b00 | 2
//  2'b01 | 4
//  2'b10 | 8
//  2'b11 | 16
//
// for speed=0 you can start new transfer as fast as every 16 clocks
// for speed=1 - every 34 clocks.
// alternatively, you can check rdy output: it goes to 0 after start pulse and when it goes back to 1, you can
// issue another start at the next clock cycle. See spi2_modelled.png and .zip (modelsim project)
//
// warning: if using rdy-driven transfers and speed=0, new transfer will be started every 18 clocks.
//  it is recommended to use rdy-driven transfers when speed!=0
//
// warning: this module does not contain asynchronous reset. Provided clock is stable, start=0
//  and speed=0, module returns to initial ready state after maximum of 18+8=26 clocks. To reset module
//  to the known state from any operational state, set speed=0 and start=1 for 8 clocks
//  (that starts Fclk/Fspi=2 speed transfer for sure), then remain start=0, speed=0 for at least 18 clocks.

module spi2(

	clock, // system clock

	sck,   // SPI bus pins...
	sdo,   //
	sdi,   //
	bsync, // ...and bsync for vs1001

	start, // positive strobe that starts transfer
	rdy,   // ready (idle) - when module can accept data

	speed, // =2'b00 - sck full speed (1/2 of clock), =2'b01 - half (1/4 of clock), =2'b10 - one fourth (1/8 of clock), =2'b11 - one eighth (1/16 of clock)

	din,  // input
	dout  // and output 8bit busses
);

	input clock;


	output sck;
	wire   sck;

	output sdo;

	input sdi;

	output reg bsync;

	input start;

	output rdy;


	input [1:0] speed;

	input [7:0] din;

	output reg [7:0] dout;



	// internal regs

	reg [4:0] counter; // governs transmission

	wire enable_n; // =1 when transmission in progress

	reg [6:0] shiftin; // shifting in data from sdi before emitting it on dout

	reg [7:0] shiftout; // shifting out data to the sdo

	wire ena_shout_load; // enable load of shiftout register

	wire g_ena;
	reg [2:0] wcnt;


	initial // for simulation only!
	begin
		counter = 5'b10000;
		shiftout = 8'd0;
		shiftout = 7'd0;
		bsync = 1'd0;
		dout = 1'b0;
	end


	// rdy is enable_n
	assign rdy = enable_n;

	// sck is low bit of counter
	assign sck = counter[0];

	// enable_n is high bit of counter
	assign enable_n = counter[4];

	// sdo is high bit of shiftout
	assign sdo = shiftout[7];

	assign ena_shout_load = (start | sck) & g_ena;




	always @(posedge clock)
	begin
		if( g_ena )
		begin
			if( start )
			begin
				counter <= 5'b00000; // enable_n = 0; sck = 0;
				bsync <= 1'b1; // begin bsync pulse
			end
			else
			begin
				if( !sck ) // on the rising edge of sck
				begin
					shiftin[6:0] <= { shiftin[5:0], sdi };

					if( (&counter[3:1]) && (!enable_n) )
						dout <= { shiftin[6:0], sdi }; // update dout at the last sck rising edge
				end
				else // on the falling edge of sck
				begin
					bsync <= 1'b0;
				end

				if( !enable_n )
					counter <= counter + 5'd1;
			end
		end
	end


	// shiftout treatment is done so just to save LCELLs in acex1k
	always @(posedge clock)
	begin
		if( ena_shout_load )
		begin
			if( start )
				shiftout <= din;
			else // sck
				shiftout[7:0] <= { shiftout[6:0], shiftout[0] }; // last bit remains after end of exchange
		end
	end


	// slow speeds - governed by g_ena
	always @(posedge clock)
	begin
		if( speed!=2'b00 )
		begin
			if( start )
				wcnt <= 3'b001;
			else if( enable_n )
				wcnt <= 3'b000;
			else
				wcnt <= wcnt + 3'd1;
		end
		else
			wcnt <= 3'b000;
	end

	assign g_ena = (speed==2'b00) ? 1'b1 :
	               (speed==2'b01) ? (wcnt[0]  == 1'b0   ) :
	               (speed==2'b10) ? (wcnt[1:0]== 2'b00  ) :
	                                (wcnt[2:0]== 3'b000 ) ;


endmodule

