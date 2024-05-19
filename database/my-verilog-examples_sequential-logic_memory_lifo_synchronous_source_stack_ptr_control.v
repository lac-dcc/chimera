// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// A synchronous lifo stack pointer

module stack_ptr_control (
    input             clk,              // Clock
    input             rst,              // Reset
    input             w_next,           // Write next
    input             r_next,           // Read next
    output reg [3:0]  wrt_ptr,          // Write pointer
    output reg [3:0]  rd_ptr);          // Read pointer

    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ (posedge clk) begin
        //RESET
        if (rst) begin
            wrt_ptr <= 4'b0000;
            rd_ptr <= 4'b0000;
        // BOTTOM - PUSH
        end else if ((wrt_ptr == 4'b0000) & (w_next)) begin
            wrt_ptr <= wrt_ptr + 1;
        // BOTTOM - POP
        end else if ((rd_ptr == 4'b0000) & (r_next)) begin
            wrt_ptr <= 4'b0000;
        // PUSH
        end else if (w_next) begin
            wrt_ptr <= wrt_ptr + 1;
            rd_ptr <= rd_ptr + 1;
        // POP
        end else if (r_next) begin
            wrt_ptr <= wrt_ptr - 1;
            rd_ptr <= rd_ptr - 1;
        end
    end

endmodule