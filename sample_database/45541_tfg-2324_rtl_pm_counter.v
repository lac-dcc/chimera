// This program was cloned from: https://github.com/p-ariza/tfg-2324
// License: MIT License

/*

Copyright (c) 2024 Pablo Ariza García

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*/

`resetall
`timescale 1ns / 1ps
`default_nettype none

module pm_counter #(
    // Flow characteristics
    parameter SIZE=64,
    parameter FREQUENCY = 350000000,
	parameter BANDWIDTH = 1000000000,
    //Precision
    parameter INTEGRATION_CYCLE=10
    )(
    input wire clk,
    input wire rst,
    output wire output_sig
);  

    //Calculate N_CYCLES from desired BANDWIDTH
	localparam FRAME_LENGTH = SIZE*8;
	localparam N_CYCLES = (FRAME_LENGTH * FREQUENCY) / BANDWIDTH;
	
	//Calculate N_CYCLES remainder
	localparam NCYCLES_SCALED = (FRAME_LENGTH * FREQUENCY * INTEGRATION_CYCLE) / BANDWIDTH;
	localparam NCYCLES_REMAINDER = NCYCLES_SCALED - (N_CYCLES * INTEGRATION_CYCLE);

    //Data width for counters
    localparam CYCLE_COUNT_WIDTH = !(N_CYCLES & (N_CYCLES-1)) ? $clog2(N_CYCLES)+1 : $clog2(N_CYCLES);
    localparam PACKET_COUNT_WIDTH = !(INTEGRATION_CYCLE & (INTEGRATION_CYCLE-1)) ? $clog2(INTEGRATION_CYCLE)+1 : $clog2(INTEGRATION_CYCLE);

    reg [CYCLE_COUNT_WIDTH-1:0] cycle_count;
    reg [PACKET_COUNT_WIDTH-1:0] packet_count;

    reg output_sig_reg;
    assign output_sig = output_sig_reg;
    
    //Rising Edge
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cycle_count <= 0;
            output_sig_reg <= 1;
            packet_count <= 0;
        end else if ((cycle_count == N_CYCLES) && packet_count < NCYCLES_REMAINDER) begin
            cycle_count <= 0;
            output_sig_reg <= 1;
            if (packet_count < INTEGRATION_CYCLE) begin
                packet_count <= packet_count + 1;
            end else begin
                packet_count <= 0;
            end
        end else if ((cycle_count == N_CYCLES-1) && packet_count >= NCYCLES_REMAINDER) begin
            cycle_count <= 0;
            output_sig_reg <= 1;
            if (packet_count == INTEGRATION_CYCLE-1) begin
                packet_count <= 0;
            end else begin
                packet_count <= packet_count + 1;
            end
        end else begin
            cycle_count <= cycle_count + 1;
            output_sig_reg <= 0;
        end
    end
endmodule