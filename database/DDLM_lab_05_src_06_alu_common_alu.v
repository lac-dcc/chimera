//ALU commands
`define ALU_AND 2'b00
`define ALU_ADD 2'b01
`define ALU_SLL 2'b10
`define ALU_SLT 2'b11

module alu
#(
    parameter WIDTH = 4,
    parameter SHIFT = 2
)
(
    input      [WIDTH - 1:0] x, y,
    input      [SHIFT - 1:0] shamt,
    input      [ 1:0]        operation,
    output                   zero,
    output reg [WIDTH - 1:0] result
);

    always @ (*) begin
        case (operation)
            `ALU_AND : result = x & y; 
            `ALU_ADD : result = x + y;
            `ALU_SLL : result = y << shamt;
            `ALU_SLT : result = (x < y) ? 1 : 0;
        endcase
    end

    //Flags
    assign zero      = (result == 0);

endmodule