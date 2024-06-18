// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// 2-input NOR gate used in my programable-8-bit-microprocessor

module nor2_gate(
    input       a, b,     // 2-Input
    output      y);       // Output

    // GATE PRIMITIVE
    nor (y, a, b);

endmodule

module nor2_dataflow(
    input       a, b,     // 2-Input
    output      y);       // Output

    // CONTINUOUS ASSIGNMENT STATEMENT
    assign y = ~(a | b);

endmodule

module nor2_behavioral(
    input       a, b,     // 2-Input
    output reg  y);       // Output

    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(a or b) begin
        y <= ~(a | b);
    end

endmodule
