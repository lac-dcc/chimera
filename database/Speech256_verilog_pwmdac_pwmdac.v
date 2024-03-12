// SPEECH 256
// Copyright (C) 2017 Niels Moseley / Moseley Instruments
// http://www.moseleyinstruments.com
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
// 
// Very simple, i.e. 8-bit non noise-shaping pulse-width modulation (PWM) DAC.
// The DAC has a pull interface.
//
// For a 10 kHz output rate, the clock rate should be 2.560 MHz
// 

//`define USE_PREFILTER

module PWMDAC (
        clk, 
        rst_an, 
        din,        // 16 bit signed data input
        din_ack,    // is high for 1 clock cycle after reading the din signal
        dacout      // 1-bit PWM output signal
    );

	//////////// CLOCK //////////
	input clk;

    //////////// RESET, ACTIVE LOW //////////
    input rst_an;

	//////////// DAC OUTPUT //////////
	output reg dacout;

	//////////// DATA BUS //////////
	input signed [7:0] din;
    output reg din_ack;             // is high for 1 clock cycle after reading the din signal

    // internal counter and data registers
    reg signed [7:0] counter;
    reg signed [7:0] data;

    // pre-emphasis filter
    reg signed [7:0]   last_data;
    wire signed [10:0] sum1;

    // 7- bit signed quantization input
    // so we now have 20kHz carrier instead of 10kHz
    // .. 
    reg signed [6:0]  quantdata;

    assign sum1 = $signed({data[7] ,{data, 2'b00}}) + data   - $signed({last_data, 2'b00});

    // output saturation
    always @(*)
    begin        
        if (sum1[10] ^ sum1[9] != 0)
        begin
            // saturation needed
            quantdata = sum1[10] ?  8'h80 : 8'h7F;
        end
        else 
            quantdata = sum1[9:3];
    end

    always @(posedge clk, negedge rst_an)
    begin
        if (rst_an == 0)
        begin
            // reset values
            counter <= 0;
            dacout  <= 0;
            din_ack <= 0;
            data    <= 0;
        end
        else
        begin
            // increment counter
            counter <= counter + 8'b00000001;

            // compare counter with data 
            // and set output accordingly.
            //
            // Note, we use 7 bits of the counter
            // as a PWM waveform to get 2x 10 kHz carrier wave
            // but the counter itself needs to be 8 bits
            // so the sample rate is still 10ksps!
            `ifdef USE_PREFILTER
                if (quantdata > $signed(counter[6:0]))
                    dacout <= 1;
                else
                    dacout <= 0;
            `else
                if ($signed(data[7:1]) > $signed(counter[6:0]))
                    dacout <= 1;
                else
                    dacout <= 0;            
            `endif

            // load new data into DAC when
            // counter is 127
            if (counter == 8'h7F)
            begin
                last_data <= data;
                data <= din;
                din_ack <= 1;        
            end
            else
                din_ack <= 0;            
        end
    end
endmodule
