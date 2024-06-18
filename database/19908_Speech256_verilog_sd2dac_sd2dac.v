// This program was cloned from: https://github.com/trcwm/Speech256
// License: GNU Lesser General Public License v3.0

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
// Second-order sigma-delta DAC 
// The DAC has a pull interface.
//
// Number of input bits used: 12
//
// Designed for a clock rate of 2.5 MHz
// 

module SD2DAC (
        clk, 
        rst_an, 
        din,        // 16 bit signed data input
        din_ack,    // is high for 1 clock cycle after reading the din signal
        dacout      // 1-bit SD output signal
    );


    input signed [15:0] din;
    input rst_an, clk;
    output reg din_ack;
    output reg dacout;

    reg [15:0] din_reg;     // data input register
    reg [15:0] last_din;    // previous input sample
    //reg [15:0] delta;

    reg [7:0]  counter; // sample counter
    reg signed [15:0] state1, state2;       // integrator states
    reg signed [15:0] new_state1, new_state2;
    reg signed [15:0] state1_in, state2_in; // input to integrators
    wire signed [15:0] state1_a, state2_a;  // output of integrator adders
    wire signed [16:0] quant_in;

    reg quant_out;

    always @(posedge clk or negedge rst_an)
    begin
      if (rst_an == 0)
      begin
        state1 <= 0;
        state2 <= 0;
        counter <= 0;
        din_reg <= 0;
      end
      else
      begin
        // clocked process
        state1 <= new_state1;
        state2 <= new_state2;
        dacout <= quant_out;
        counter <= counter + 1;
        if (din_ack == 1)
        begin
            last_din <= din_reg;
            din_reg <= {din[15], din[15:1]};    // div by 2!
        end
      end
    end

    assign state1_a = state1 + state1_in;
    assign state2_a = state2 + state2_in;
    assign quant_in = $signed( { {3{din_reg[15]}}, din_reg[15:2]} ) +  state2;

    always @(*)
    begin
        // ------------------------------
        // calculate new state 1
        // ------------------------------

        if (quant_out == 1)
            // (din >> 2) - (quant_out >> 2)
            state1_in <= $signed( { {2{din_reg[15]}}, din_reg[15:2]} ) - $signed(16'h1FFF);
        else
            state1_in <= $signed( { {2{din_reg[15]}}, din_reg[15:2]} ) + $signed(16'h1FFF);

        // check for saturation:
        //   if operand sign bits are the same
        //   the result should have the same
        //   sign bit, if not, we need to
        //   saturate.
        //
        // 1000 + 1111 => 1000 (-8 + -1 saturates at -8)
        // 0111 + 0001 => 0111  (7 + 1 saturates at 7)
        //
        if (state1[15] == state1_in[15])
        begin
            if (state1[15] != state1_a[15])
                new_state1 <= state1[15] ? 16'h8000 : 16'h7FFF;
            else
                new_state1 <= state1_a;                
        end
        else
            new_state1 <= state1_a;

        // ------------------------------
        // calculate new state 2
        // ------------------------------

        if (quant_out == 1)
            // state1 - (quant_out >> 1)
            state2_in <= state1 - $signed(16'h3FFF);
        else
            state2_in <= state1 + $signed(16'h3FFF);

        if (state2[15] == state2_in[15])
        begin
            if (state2[15] != state2_a[15])
                new_state2 <= state2[15] ? 16'h8000 : 16'h7FFF;
            else
                new_state2 <= state2_a;
        end
        else
            new_state2 <= state2_a;

        // ------------------------------
        // calculate quantizer
        // ------------------------------
        
        quant_out <= !quant_in[16];

        if (counter == 8'h0)
            din_ack <= 1;
        else
            din_ack <= 0;
    end

endmodule    