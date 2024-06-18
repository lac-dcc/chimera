// This program was cloned from: https://github.com/Rohan7Gupta/pentaRV
// License: Apache License 2.0

`include "PC_module.v"
module fetch(clk,rst,flush, epc_taken, vector_pc, PCsrcE,PCplusImmE,PCD, instrD, PCF, instrF);
input clk, rst, flush, epc_taken;
input PCsrcE;
input [31:0] PCplusImmE, instrF, vector_pc;
output [31:0] instrD, PCD, PCF;

wire [31:0]  PCplus4F,instrF, nextPCF, four, normal_nextPCF;
reg [31:0] reg_instrF, reg_PCF;


PC_Module pc(
    .clk(clk),
    .rst(rst),
    .PC(PCF),
    .nextPC(nextPCF)
    );


assign four = 32'd4;
assign PCplus4F = PCF + four;
assign normal_nextPCF = (PCsrcE)? PCplusImmE:PCplus4F;
assign nextPCF = (epc_taken)? vector_pc: normal_nextPCF;

//pipeline registers
always @ (posedge clk or posedge rst) begin //rst used to implement stall
    if(rst | flush) begin
        reg_instrF <= 32'b0;
        reg_PCF <= 32'b0;
    end
    else begin
        reg_instrF <= instrF;
        reg_PCF <= PCF;
    end
end

//signals to Decoder
assign instrD = (rst) ? 32'b0 : reg_instrF;
assign PCD = (rst) ? 32'b0 : reg_PCF;

endmodule

