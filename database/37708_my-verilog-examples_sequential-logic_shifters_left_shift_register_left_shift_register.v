// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// A 4-bit left shift register.

module left_shift_register_behavioral (
    input            clk,           // clk
    input            rst,           // Reset
    input            d,             // d
    output reg [3:0] out);          // out

    // LEFT SHIFT REGISTER
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ (posedge clk) begin
        if (rst) begin
            out <= 4'b0000;
        end else begin
            out <= {out[2:0], d};
        end
    end

endmodule
