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
// Source part of speech synth
//

module SOURCE (
        clk, 
        rst_an, 
        period,         // period in 10kHz samples        
        amplitude,      // unsigned 15-bit desired amplitude of source output
        strobe,         // when strobe == '1' a new source_out will be generated
        period_done,    // is set to '1' at the end of the period
        source_out      // signed 16-bit source output
    );

	//////////// CLOCK //////////
	input clk;

    //////////// RESET, ACTIVE LOW //////////
    input rst_an;

	//////////// OUTPUTS //////////
	output reg signed [15:0] source_out;
    output reg period_done;

	//////////// INPUTS //////////
    input [14:0] amplitude;
    input [7:0]  period;
    input        strobe;

    // internal counter and data registers
    reg signed [7:0] periodcnt;
    reg        [16:0] lfsr;
    reg        last_strobe;

    always @(posedge clk, negedge rst_an)
    begin
        if (rst_an == 0)
        begin
            // reset values
            periodcnt <= 0;
            period_done <= 1;
            source_out <= 0;
            last_strobe <= 0;
            lfsr <= 17'h1;   //note: never reset the LFSR to zero!
        end
        else
        begin
            // default value
            period_done <= 0;

            if ((strobe == 1) && (last_strobe == 0))
            begin
                // if period == 0, we need to generate noise
                // else we generate a pulse wave
                if (period == 0)
                begin
                    // ------------------------------------------------------------
                    //   LFSR NOISE GENERATOR
                    // ------------------------------------------------------------
                    if (periodcnt >= 64)                        
                    begin
                        periodcnt <= 0;
                        period_done <= 1;
                    end
                    else
                        periodcnt <= periodcnt + 1;
                    
                    // lfsr polynomial is X^17 + X^3 + 1
                    lfsr <= {lfsr[15:0], lfsr[16] ^ lfsr[2]};
                    source_out <= lfsr[0] ? {1'b0, amplitude} : {1'b1, ~amplitude};
                end
                else
                begin
                    // ------------------------------------------------------------
                    //   PULSE GENERATOR
                    // ------------------------------------------------------------        
                    // make periodcnt count from 0 .. period-1
                    if (periodcnt >= period)
                    begin
                        periodcnt <= 0;
                        period_done <= 1;
                    end
                    else
                        periodcnt <= periodcnt + 1;

                    if (periodcnt < 8)
                        source_out <= {1'b0, amplitude};
                    else
                        source_out <= 16'h0000;  

                    // reset the noise generator when not in use, 
                    // so it also works on FPGA's where there
                    // is no reset :)
                    lfsr <= 17'h1;   //note: never reset the LFSR to zero!                          
                end
            end
            last_strobe <= strobe;
        end
    end

endmodule
