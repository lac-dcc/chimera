// This program was cloned from: https://github.com/ahmd-kamel/Single-Cycle_MIPS
// License: The Unlicense

module INSTRUCTION_MEMORY
#(
    parameter DATA_WIDTH = 32,
    parameter ADD_WIDTH = 32,
    parameter DEPTH = 32
)(
    input [DATA_WIDTH - 1 : 0] pc_in,
    output [ADD_WIDTH - 1 : 0] ins_out
);

    reg [DATA_WIDTH - 1 : 0] inst [0 : DEPTH - 1];

    initial begin
        $readmemh("Program_3_Machine_Code.txt", inst);
    end

    assign ins_out = inst[(pc_in >> 'd2)];

endmodule