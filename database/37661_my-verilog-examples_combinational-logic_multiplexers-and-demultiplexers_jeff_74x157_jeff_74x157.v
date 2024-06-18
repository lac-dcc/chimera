// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// Quad 2-line to 1-line data selector/multiplexer, non-inverting outputs.
// Based on the 7400-series integrated circuits used in my
// programable-8-bit-microprocessor.
    
module jeff_74x157_behavioral(
    input       [3:0] a,            // INPUT DATA A
    input       [3:0] b,            // INPUT DATA B
    input             s,            // SELECT
    input             en,           // ENABLE
    output reg  [3:0] y             // OUTPUT DATA
);

    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ ( * ) begin
        if (~en) begin
            y <= 4'h0;
        end else begin
            case(s)
                1'b0 : y <= a;
                1'b1 : y <= b;
            endcase
        end
    end

endmodule
