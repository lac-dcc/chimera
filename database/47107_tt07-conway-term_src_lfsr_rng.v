// This program was cloned from: https://github.com/ccattuto/tt07-conway-term
// License: Apache License 2.0

module lfsr_rng(
    input wire clk,
    input wire reset,
    output wire random_bit // Output only the last bit
);

  reg [15:0] lfsr_reg; // Internal LFSR register
  wire feedback;

  // XOR the feedback taps; positions are 16, 14, 13, and 11
  assign feedback = lfsr_reg[15] ^ lfsr_reg[13] ^ lfsr_reg[12] ^ lfsr_reg[10];
  assign random_bit = lfsr_reg[0]; // Output the LSB of the LFSR

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      // Set to a non-zero seed value when reset
      lfsr_reg <= 16'b0001; // Non-zero seed
    end else begin
      // Shift left by one, then bring in the new feedback bit
      lfsr_reg <= {lfsr_reg[14:0], feedback};
    end
  end

endmodule
