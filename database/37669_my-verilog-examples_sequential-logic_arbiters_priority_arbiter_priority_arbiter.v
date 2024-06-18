// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// A three level Priority Arbiter with asynchronous reset (using if-then-else statements).

module priority_arbiter_behavioral(
    input       clk,          // Clock  
    input       rst,          // Reset
    input       req_0,        // Request 0
    input       req_1,        // Request 1
    input       req_2,        // Request 2
    output reg  gnt_0,        // Grant 0
    output reg  gnt_1,        // Grant 1
    output reg  gnt_2         // Grant 2
);

    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ (posedge clk or posedge rst) begin
        if (rst) begin
            gnt_0 <= 0;
            gnt_1 <= 0;
            gnt_2 <= 0;
        end else if (req_0) begin
            gnt_0 <= 1;
            gnt_1 <= 0;
            gnt_2 <= 0;
        end else if (req_1) begin
            gnt_0 <= 0;
            gnt_1 <= 1;
            gnt_2 <= 0;
        end else if (req_2) begin
            gnt_0 <= 0;
            gnt_1 <= 0;
            gnt_2 <= 1;
        end else begin
            gnt_0 <= 0;
            gnt_1 <= 0;
            gnt_2 <= 0;
        end
    end

endmodule
