// This program was cloned from: https://github.com/Meow-pilli/Testing-and-Testable-Design
// License: MIT License

//template
module lfsr_internal_xor(
    input clk,
    input reset,
    output reg [7:0] lfsr_out
);

reg [7:0] lfsr_reg;

always @(posedge clk or posedge reset) begin
    if (reset)
        lfsr_reg <= 8'b00000001; // Initial seed value
    else begin
        lfsr_reg[7:1] <= lfsr_reg[6:0];
        lfsr_reg[0] <= lfsr_reg[7] ^ lfsr_reg[4] ^ lfsr_reg[3] ^ lfsr_reg[2] ^ 1'b1;
    end
end

assign lfsr_out = lfsr_reg;

endmodule
