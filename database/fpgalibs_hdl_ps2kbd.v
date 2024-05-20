// This program was cloned from: https://github.com/trabucayre/fpgalibs
// License: MIT License

// AUTHOR=Paul Ruiz
// LICENSE=BSD
// PS/2 KBD interface (input only)
// Algorithm based on a VHDL routine by Grant Searle
//
module ps2kbd(
  input wire clk,
  
  input wire ps2_clk,
  input wire ps2_data,
  
  output reg [7:0] ps2_code,
  output reg strobe,
  output reg err
);

  // sync ps2_data
  //
  reg serin;
  always @(posedge clk) serin <= ps2_data;
  
  // sync & 'debounce' ps2_clock
  //
  parameter LEN = 8;
  reg bitclk = 0;
  reg [LEN:0] stable = 0;

  always @(posedge clk)
  begin
    stable = { stable[LEN-1:0], ps2_clk };
    if ( &stable) bitclk <= 1;
    if (~|stable) bitclk <= 0;
  end
  
  wire bitedge = bitclk && (~|stable[LEN-1:0]);
  
  // clock in KBD bits (start - 8 data - odd parity - stop)
  //
  reg [8:0] shift = 0;
  reg [3:0] bitcnt = 0;
  reg parity = 0;

  always @(posedge clk)
  begin
    strobe <= 0; err <= 0;
    if (bitedge) begin
      // wait for start bit
      if (bitcnt==0) begin
        parity <= 0;
        if (!serin) bitcnt <= bitcnt + 1;
        end
      // shift in 9 bits (8 data + parity)
      else if (bitcnt<10) begin
        shift  <= { serin, shift[8:1] };
        parity <= parity ^ serin;
        bitcnt <= bitcnt + 1;
        end
      // check stop bit, parity
      else begin
        bitcnt <= 0;
        if (parity && serin) begin
          ps2_code <= shift[7:0];
          strobe <= 1;
          end
        else
          err <= 1;
      end
    end
  end

endmodule
