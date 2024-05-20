// This program was cloned from: https://github.com/navin9212/RISC-V
// License: Apache License 2.0

//  module declaration
module fetch_unit(
    // input ports
    input clk,
    input reset,
    input wire PCEn_reg, // enables pc register
    input wire [31:0] pc_up_reg, // ALU output (updated pc value)
    // output ports
    output reg [31:0] pc_reg // output pc register
);

//  definition
always @(posedge clk)
begin
    if (reset) begin
        pc_reg <= 0;
    end
    else if (PCEn_reg == 1'b1) begin
        pc_reg <= pc_up_reg; // pc updated to new pc value for PCEn_reg = 1
    end
    else begin
        pc_reg <= pc_reg; // pc remains instead
    end
end
endmodule