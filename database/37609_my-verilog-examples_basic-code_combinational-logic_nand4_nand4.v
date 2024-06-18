// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// 4-input NAND gate used in my programable-8-bit-microprocessor

module nand4_gate(
    input       a, b, c, d,  // 4-Input
    output      y);          // Output

    // GATE PRIMITIVE
    nand (y, a, b, c, d);

endmodule

module nand4_dataflow(
    input       a, b, c, d,  // 4-Input
    output      y);          // Output


    // CONTINUOUS ASSIGNMENT STATEMENT
    assign y = ~(a & b & c & d);

endmodule

module nand4_behavioral(
    input       a, b, c, d,  // 4-Input
    output reg  y);          // Output

    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(a or b or c or d) begin
        y <= ~(a & b & c & d);
    end

endmodule