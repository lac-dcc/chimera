// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// A synchronous lifo compare and status
// The job of this modeul is to provide empty and full flags.

module compare_and_status_logic (
    input  [3:0] wrt_ptr,         // Stack pointer
    output reg   full,            // Full
    output reg   empty);          // Empty

    parameter depth = 4'b1111;    // Depth of the FIFO

    // HOW MUCH MEMORY USED
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(*) begin
        if (wrt_ptr == 0) begin
            full <= 1'b0;
            empty <= 1'b1;
        end else if (wrt_ptr < depth) begin
            full <= 1'b0;
            empty <= 1'b0;
        end else if (wrt_ptr == depth) begin
            full <= 1'b1;
            empty <= 1'b0;
        end
    end

endmodule
