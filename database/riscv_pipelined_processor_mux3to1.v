// This program was cloned from: https://github.com/AuraGuardian23/riscv_pipelined_processor
// License: MIT License

module mux3to1(input [63:0] a, input [63:0] b, input [63:0] c, input [1:0] forward, output reg [63:0] o);
always @(*)
    case (forward)
        2'b00: o = a;
        2'b01: o = b;
        2'b10: o = c;
    endcase
endmodule