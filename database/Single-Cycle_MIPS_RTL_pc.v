// This program was cloned from: https://github.com/ahmd-kamel/Single-Cycle_MIPS
// License: The Unlicense

module PC // edit test bench
#(
    parameter DATA_WIDTH = 32
) (
    input wire clk,reset_n,
    input wire [DATA_WIDTH - 1 : 0] pc_in,
    output reg [DATA_WIDTH - 1 : 0] pc_out
);

    always @(posedge clk, negedge reset_n) begin
        if(!reset_n)
            pc_out <= 'd0;
        else
            pc_out <= pc_in;
    
    end

endmodule