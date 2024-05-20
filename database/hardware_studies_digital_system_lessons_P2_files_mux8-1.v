// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

module mux8_1cond (
    input wire [2:0] Sel,
    input wire [7:0] A,
    output reg F
);
always @(*) begin
case (Sel)
    3'b000: F = A[0];
    3'b001: F = A[1];
    3'b010: F = A[2];
    3'b011: F = A[3];
    3'b100: F = A[4];
    3'b101: F = A[5];
    3'b110: F = A[6];
    3'b111: F = A[7];
endcase
end
endmodule

module mux8_1logic (
    input wire [2:0] Sel,
    input wire [7:0] A,
    output wire F
);
    assign F = A[0] & ~Sel[2] & ~Sel[1] & ~Sel[0] |
          A[1] & ~Sel[2] & ~Sel[1] & Sel[0] |
          A[2] & ~Sel[2] & Sel[1] & ~Sel[0] |
          A[3] & ~Sel[2] & Sel[1] & Sel[0] |
          A[4] & Sel[2] & ~Sel[1] & ~Sel[0] |
          A[5] & Sel[2] & ~Sel[1] & Sel[0] |
          A[6] & Sel[2] & Sel[1] & ~Sel[0] |
          A[7] & Sel[2] & Sel[1] & Sel[0];
endmodule