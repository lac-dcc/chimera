// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

/* This file is part of fpga-spec by ZXMicroJack - see LICENSE.txt for moreinfo */
module ps2(input wire kbd_clk, input wire kbd_data, output wire [7:0] kbd_key, output wire kbd_key_valid, input wire clk);
  reg [7:0] data_input = 0;
  reg [5:0] nbits = 0;

  reg [7:0] key = 0;
  reg valid = 0;

  assign kbd_key_valid = valid;
  assign kbd_key = key;

  reg kbd_clk_debounced;
  reg kbd_clk_last;
  reg[9:0] debounce_count;

  initial kbd_clk_debounced = 1'b0;
  initial kbd_clk_last = 1'b0;
  initial debounce_count = 0;

  // settle time for ps2 clk
  always @ (negedge clk) begin
    if (kbd_clk != kbd_clk_last) begin
      debounce_count[9:0] <= 0;
      kbd_clk_last <= kbd_clk;
    end else if (debounce_count[9:0] <= 1000) begin
    // end else if (debounce_count[9:0] <= 500) begin
      debounce_count[9:0] <= debounce_count[9:0] + 1;
    end else begin
      kbd_clk_debounced <= kbd_clk;
    end
  end

  // scan keyboard
  always @ (negedge kbd_clk_debounced) begin
    if (nbits == 0 && !kbd_data) begin
      valid <= 1'b0;
      nbits <= nbits + 1'b1;
    end else if (nbits > 0 && nbits < 9) begin
      data_input <= {kbd_data, data_input[7:1]} ;
      nbits <= nbits + 1'b1;
    end else if (nbits == 9) begin
      // parity - not implemented
      nbits <= nbits + 1'b1;
      key[7:0] <= data_input[7:0];

    end else if (nbits == 10) begin
      nbits <= 1'b0;
      valid <= 1'b1;
    end
	end

endmodule
