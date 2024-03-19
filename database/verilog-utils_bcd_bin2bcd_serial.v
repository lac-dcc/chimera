//
// Convert a binary input to binary-coded-decimal (BCD) output.
// Each binary coded decimal digit occupies 4-bits of the ouput bus.
// The number of output digits and input binary width are configurable. It
// is possible to choose binary input widths that will cause the BCD output to overflow,
// so care must be exercised by the invokee.
//
// The implementation follows Xlinx App Note "XAPP 029". There is a block instantiated for
// each BCD digit, which recieves the binary data serially. It takes n cycles to convert an
// n-bit binary input. Each BCD digit has a registered carry output to the next digit.
//
// There is no explicit reset, each new conversion request clears all previous state whether
// a conversion was in progress or not.
`timescale 1ns / 1ps

module bin2bcd_serial #(
  parameter BINARY_BITS        = 16, // # of bits of binary input
  parameter BCD_DIGITS         = 5  // # of digits of BCD output
  ) (
    input wire clock,
    input wire start,
    input wire [BINARY_BITS-1:0] binary_in,

    output wire [4*BCD_DIGITS-1:0] bcd_out,    // output bus
    output wire done                           // indicate conversion done
  );

  // binary input shift register and counter
  reg [BINARY_BITS-1:0] binary_shift = 0;
  reg [$clog2(BINARY_BITS):0] binary_count = 0;
  assign done = binary_count == 0;

  always @(posedge clock) begin
      if(start) begin
          binary_shift <= binary_in;
          binary_count <= BINARY_BITS;
      end else if (binary_count != 0) begin
          binary_shift <= { binary_shift[BINARY_BITS-2:0], 1'b0 };
          binary_count <= binary_count - 1'b1;
      end
  end

  wire [BCD_DIGITS:0] bcd_carry;
  assign bcd_carry[0] = binary_shift[BINARY_BITS-1]; // MSB
  wire clock_enable   = start | ~done;

  genvar j;
  generate
    for (j = 0; j < BCD_DIGITS; j=j+1) begin: DIGITS
      bcd_digit digit (
          .clock(   clock ),
          .init(    start ),
          .mod_in(  bcd_carry[j] ),
          .mod_out( bcd_carry[j+1] ),
          .digit(   bcd_out[4*j +: 4] ),
          .ce( clock_enable )
      );
    end
  endgenerate

endmodule

// Regarding the init signal: At first it seems that digit[0] should have an explicit clear ("& ~init")
// like the rest. However digit[0] loads mod_in unconditionaly, and since mod_out is masked
// by & ~init this ensures digit[0] of higher digits is cleared during the init cycle whilst not loosing
// a cycle in the conversion for synchronous clearing.
module bcd_digit (
  input wire clock,
  input wire ce,
  input wire init,
  input wire mod_in,
  output wire mod_out,
  output reg [3:0] digit
  );

  wire fiveOrMore = digit >= 5;
  assign mod_out  = fiveOrMore & ~init;

  always @(posedge clock) begin
    if (ce) begin
      digit[0] <= mod_in;
      digit[1] <= ~init & (~mod_out ? digit[0] : ~digit[0]);
      digit[2] <= ~init & (~mod_out ? digit[1] : digit[1] == digit[0]);
      digit[3] <= ~init & (~mod_out ? digit[2] : digit[0] & digit[3]);
    end
  end

endmodule
