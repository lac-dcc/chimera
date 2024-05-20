// This program was cloned from: https://github.com/lnls-dig/infra-cores
// License: GNU Lesser General Public License v3.0

////////////////////////////////////////////////////////////////////////////////
//              ____      _      _____   _   _          _                     //
//             / ___|    / \    | ____| | \ | |   ___  | |  ___               //
//            | |       / _ \   |  _|   |  \| |  / _ \ | | / __|              //
//            | |___   / ___ \  | |___  | |\  | |  __/ | | \__ \              //
//             \____| /_/   \_\ |_____| |_| \_|  \___| |_| |___/              //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
//
// FMC-Pico-1M4 ADC SPI Interface, version 1.0
//
// Copyright (c) 2017 CAEN ELS s.r.l.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//
// FMC-Pico-1M4 ADC SPI Interface
// ==============================
//
//
//  This is a SPI module for communication with FMC-Pico-1M4 ADC
//
//  It consist of 4 state machines:
//      - CONVERT GEN ( on start holds cnv signal high for T_CONV_HIGH [s])
//      - CONVERT WAIT ( waits for conversion to complete, T_CONV_WAIT[s] )
//      - SCLK GEN  ( on falling edge of busy ( = ADC has data ready )
//                      starts sending SCLK clock, set with SCLK_FREQ [Hz] )
//      - DATA ACQUISITION ( captures data on negedge of returning SCLK,
//                           when is done (has captured BITS bits),
//                           send data to out_* port )
//
////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 100ps

module fmc_pico_spi #(
	parameter BITS=20,

	// main clock frequency
	parameter CLK_FREQ = 300_000_000,

	// SCLK frequency
	parameter SCLK_FREQ = 75_000_000
)(
	//--------------- Clock and reset ---------------
	input                   clk,
	input                   reset,
	//--------------- Control signals ---------------
	input                   start,
	//--------------- SPI bus -----------------------
	input                   sdo1,
	input                   sdo2,
	input                   sdo3,
	input                   sdo4,
	output reg              sck,
	input                   sck_rtrn,
	input                   busy_cmn,
	output reg              cnv,
	//--------------- output bus -------------------
	output reg [BITS-1:0]   out_data1,
	output reg [BITS-1:0]   out_data2,
	output reg [BITS-1:0]   out_data3,
	output reg [BITS-1:0]   out_data4,
	output reg              out_valid,
	output reg              out_busy
);

// number of channels
parameter NR_CHAN  = 4;

// time for CONV to be held high
parameter real T_CONV_HIGH          = 25e-9;
localparam integer CYCLES_CONV_HIGH = T_CONV_HIGH * CLK_FREQ - 1;

// ADC supports max 1MSPS
parameter real T_CONV_MIN_TIME		= 1e-6;
localparam integer CYCLES_MIN_TIME  = T_CONV_MIN_TIME * CLK_FREQ - CYCLES_CONV_HIGH - 3;

// time from CONV high to BUSY low
parameter real T_CONV_WAIT          = 675e-9 + 7e-9;
localparam integer CYCLES_CONV_WAIT = T_CONV_WAIT * CLK_FREQ;

//==============================================================================
// CONVERT GENERATION

// counts cycles of CONV high
reg [8:0] conv_counter;
initial conv_counter = 0;

localparam S_CONV_IDLE  = 1,
           S_CONV_HIGH  = 2,
           S_CONV_WAIT  = 3;

reg [7:0] state_conv;
initial state_conv = S_CONV_IDLE;

initial cnv = 0;

always @ (posedge clk) begin
	case( state_conv )
	//=====================================================
	// waits for start
	S_CONV_IDLE: begin
		if ( start ) begin
			state_conv   <= S_CONV_HIGH;
			conv_counter <= 0;
			cnv          <= 1;
		end
	end
	//=====================================================
	// holds conv high
	S_CONV_HIGH: begin
		conv_counter    <= conv_counter + 1;
		if( conv_counter == CYCLES_CONV_HIGH ) begin
			state_conv  <= S_CONV_WAIT;
			conv_counter <= 0;
			cnv          <= 0;
		end
	end
	//=====================================================
	// wait to not exceed 1MSPS
	S_CONV_WAIT: begin
		conv_counter    <= conv_counter + 1;
		if( conv_counter == CYCLES_MIN_TIME ) begin
			state_conv  <= S_CONV_IDLE;
			conv_counter <= 0;
		end
	end
	endcase
end

//==============================================================================
// CONVERT WAIT

reg data_ready;
initial data_ready = 0;

reg conv_high_counting;
initial conv_high_counting = 0;

reg [7:0] conv_high_counter;
initial conv_high_counter = 0;

always @ ( posedge clk ) begin

	data_ready  <= 0;

	if ( conv_high_counting ) begin
		conv_high_counter   <= conv_high_counter + 1;

		if ( conv_high_counter == CYCLES_CONV_WAIT ) begin
			data_ready          <= 1;
			conv_high_counter   <= 0;
			conv_high_counting  <= 0;
		end

	end else begin
		if ( start && (state_conv == S_CONV_IDLE)) begin
			conv_high_counting  <= 1;
		end
	end
end


//==============================================================================
//  SCLK GENERATION

// counts clocks between SCLK transitions
reg [6:0] spi_counter;
initial spi_counter = 0;
initial sck = 0;
reg [4:0] sck_cntr;

localparam S_SCLK_IDLE  = 1,
           S_SCLK_GEN   = 2;

reg [7:0] state_sclk;
initial state_sclk = S_SCLK_IDLE;

always @ (posedge clk) begin

	case( state_sclk )
		//=====================================================
		// waits for negedge busy (= data ready)
		S_SCLK_IDLE: begin
			if ( data_ready ) begin
				state_sclk  <= S_SCLK_GEN;
				spi_counter <= 0;
				sck_cntr    <= 0;
			end
		end
		//=====================================================
		// generates clock
		S_SCLK_GEN: begin
			spi_counter <= spi_counter + 1;

			if ( spi_counter == CLK_FREQ / SCLK_FREQ / 2 - 1 ) begin
				spi_counter <= 0;
				sck <= ~sck;
				if (sck) sck_cntr <= sck_cntr + 1;
			end

			if ( sck_cntr == BITS )  begin
				state_sclk <= S_SCLK_IDLE;
				sck        <= 0;
			end
		end
		//=====================================================
	endcase
end


//==============================================================================
//  DATA ACQUISTION

// initialize output values
initial out_busy = 0;
initial out_data1 = 0;
initial out_data2 = 0;
initial out_data3 = 0;
initial out_data4 = 0;
initial out_valid = 0;

// negedge detection of sck_rtrn
reg sck_rtrn_s, sck_rtrn_ss;
always @ (posedge clk) sck_rtrn_s <= sck_rtrn;
always @ (posedge clk) sck_rtrn_ss <= sck_rtrn_s;

// synchronizer to clk clock domain
reg [3:0] sdo_s, sdo_ss;
always @ (posedge clk) begin
	sdo_s[0] <= sdo1;
	sdo_s[1] <= sdo2;
	sdo_s[2] <= sdo3;
	sdo_s[3] <= sdo4;
	sdo_ss[0] <= sdo_s[0];
	sdo_ss[1] <= sdo_s[1];
	sdo_ss[2] <= sdo_s[2];
	sdo_ss[3] <= sdo_s[3];
end

// counts number of bits in SPI word
reg [4:0] bit_counter;
//initial bit_counter = 0;

reg [BITS-1:0]  tmp_reg [0:3];

localparam S_DATA_IDLE  = 1,
           S_DATA_ACQ   = 2,
           S_DATA_DONE  = 3;

reg [7:0] state_data;
initial state_data = S_DATA_IDLE;

integer i;
always @ (posedge clk) begin
	out_valid   <= 0;

	if ( start ) out_busy    <= 1;

	case( state_data )
		//=====================================================
		// waits for data ready
		S_DATA_IDLE: begin
			if ( data_ready ) begin
				state_data  <= S_DATA_ACQ;
				bit_counter <= BITS - 1; // -1 because we count to zero
			 end
		end
		//=====================================================
		// saves data on negedge of return clock
		S_DATA_ACQ: begin
			if ( (sck_rtrn_ss == 0) && (sck_rtrn_s == 1 )) begin
				for(i = 0; i < NR_CHAN; i = i + 1)
					tmp_reg[i] <= {tmp_reg[i][BITS-2:0], sdo_ss[i]};

				bit_counter <=  bit_counter - 1;

				if(bit_counter == 0) state_data  <= S_DATA_DONE;
			end
		end
		//=====================================================
		// sends data to output port
		S_DATA_DONE: begin
			out_data1   <= tmp_reg[0];
			out_data2   <= tmp_reg[1];
			out_data3   <= tmp_reg[2];
			out_data4   <= tmp_reg[3];
			out_valid   <= 1;
			out_busy    <= 0;
			state_data  <= S_DATA_IDLE;
		end
		//=====================================================
	endcase
end


endmodule // fmc_pico_spi
