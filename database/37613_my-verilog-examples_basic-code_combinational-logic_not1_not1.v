// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// NOT gate used in my programable-8-bit-microprocessor

module not1_gate(
    input       a,        // 2-Input
    output      y);       // Output

    // GATE PRIMITIVE
    not (y, a);

endmodule

module not1_dataflow(
    input       a,        // 2-Input
    output      y);       // Output

    // CONTINUOUS ASSIGNMENT STATEMENT
    assign y = ~a;

endmodule

module not1_behavioral(
    input       a,        // 2-Input
    output reg  y);       // Output

    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(a) begin
        y <= ~a;
    end

endmodule