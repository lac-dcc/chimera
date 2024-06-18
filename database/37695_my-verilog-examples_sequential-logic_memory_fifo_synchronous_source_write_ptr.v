// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// A synchronous fifo write pointer

module write_ptr (
    input             clk,              // Clock
    input             rst,              // Reset
    input             w_next,           // Write next
    output reg [3:0]  w_ptr);           // Write pointer

    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ (posedge clk) begin
        if (rst) begin
            w_ptr <= 3'b000;
        end else if (w_next) begin
            w_ptr <= w_ptr + 1;
        end else begin
            w_ptr <= w_ptr;
        end
    end

endmodule
// 