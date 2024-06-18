// This program was cloned from: https://github.com/ahmd-kamel/Single-Cycle_MIPS
// License: The Unlicense

module MUX
#(
    parameter DATA_WIDTH = 32
) (
    input wire sel,
    input wire[DATA_WIDTH - 1 : 0] in1, in2,
    output reg[DATA_WIDTH - 1 : 0] out
);

    always @(*) begin
        
        if(sel) begin
            out = in2;
        end
        else begin
            out = in1;
        end
    end

endmodule