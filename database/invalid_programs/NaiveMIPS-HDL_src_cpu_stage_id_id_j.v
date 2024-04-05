`include "../defs.v"
module id_j(/*autoport*/
//output
            op,
            address,
//input
            inst);

input wire[31:0] inst;
output reg[7:0] op;
output wire[25:0] address;

assign address = inst[25:0];


always @(*) begin
    case(inst[31:26])
    6'h02: op <= `OP_J;
    6'h03: op <= `OP_JAL;
    default: op <= `OP_INVAILD;
    endcase
end


endmodule