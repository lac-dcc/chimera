// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// Multiplexer - Four inputs, one output.

module mux_4x1_behavioral(
    input       a, b, c, d,      // 4 Inputs
    input       [1:0] sel,       // Select
    output reg  y);              // 1 Output

    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ ( * ) begin
        case(sel)
            2'b00 : y <= a;
            2'b01 : y <= b;
            2'b10 : y <= c;
            2'b11 : y <= d;
        endcase
    end

endmodule
