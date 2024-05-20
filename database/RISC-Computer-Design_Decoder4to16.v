// This program was cloned from: https://github.com/Harminder13/RISC-Computer-Design
// License: MIT License

module Decoder4to16(
    input [3:0] input_bits,
    output reg [15:0] output_bits
);

always @*
begin
    case(input_bits)
        4'b0000: output_bits = 16'b0000000000000001;
        4'b0001: output_bits = 16'b0000000000000010;
        4'b0010: output_bits = 16'b0000000000000100;
        4'b0011: output_bits = 16'b0000000000001000;
        4'b0100: output_bits = 16'b0000000000010000;
        4'b0101: output_bits = 16'b0000000000100000;
        4'b0110: output_bits = 16'b0000000001000000;
        4'b0111: output_bits = 16'b0000000010000000;
        4'b1000: output_bits = 16'b0000000100000000;
        4'b1001: output_bits = 16'b0000001000000000;
        4'b1010: output_bits = 16'b0000010000000000;
        4'b1011: output_bits = 16'b0000100000000000;
        4'b1100: output_bits = 16'b0001000000000000;
        4'b1101: output_bits = 16'b0010000000000000;
        4'b1110: output_bits = 16'b0100000000000000;
        4'b1111: output_bits = 16'b1000000000000000;
        default: output_bits = 16'b0000000000000000; // Just for safety
    endcase
end
endmodule
