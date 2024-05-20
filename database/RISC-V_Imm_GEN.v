// This program was cloned from: https://github.com/MihVuongNguyen/RISC-V
// License: Apache License 2.0

module Imm_gen (
    input [24:0] instruction,
    input [2:0] imm_sel,
    output reg [31:0] immediate_value
);

always @(*) begin
    case (imm_sel)
       3'b000 : immediate_value = {{21{instruction[24]}}, instruction[23:13]}; //I
       3'b001 : immediate_value = {{21{instruction[24]}}, instruction[23:18], instruction[4:0]}; //store
       3'b010 : immediate_value = {{20{instruction[24]}}, instruction[0], instruction[23:18], instruction[4:1], 1'b0}; //branch
       3'b011 : immediate_value = {{12{instruction[24]}}, instruction[12:5], instruction[13], instruction[23:14], 1'b0}; //jumb
       3'b100 : immediate_value = {instruction[24:5], 12'b0}; //LUI
        default: immediate_value = 0;
    endcase
end
    
endmodule