// This program was cloned from: https://github.com/navin9212/RISC-V
// License: Apache License 2.0

module alu_test;
    reg clk_tb;
    reg reset_tb;
    reg [6:0] opcode_tb;
    reg [3:0] AluControl_tb;
    reg [31:0] SrcA_tb;
    reg [31:0] SrcB_tb;
    reg PCSrc_tb;
    wire [31:0] AluResult_tb;
    wire [31:0] AluOut_tb;
    wire Cond_Chk_tb;
    wire [31:0] pc_up_tb;

alu a0(
    .clk(clk_tb),
    .reset(reset_tb),
    .opcode_reg(opcode_tb),
    .AluControl_reg(AluControl_tb),
    .SrcA_reg(SrcA_tb),
    .SrcB_reg(SrcB_tb),
    .PCSrc_reg(PCSrc_tb),
    .AluResult_reg(AluResult_tb),
    .AluOut_reg(AluOut_tb),
    .Cond_Chk_reg(Cond_Chk_tb),
    .pc_up_reg(pc_up_tb)
);

initial begin
clk_tb <= 0;
reset_tb <= 1;
#15
reset_tb <= 0;
end

always 
begin
    #10 clk_tb = ~clk_tb;
end

always @(posedge clk_tb) begin
    // R-type (add)
    opcode_tb = 7'b0110011;
    AluControl_tb = 4'b0000;
    SrcA_tb = 32'h00001111;
    SrcB_tb = 32'h00001010;
    PCSrc_tb = 1'b0;
    
    #60
    // B-type (beq)
    opcode_tb = 7'b1100011;
    AluControl_tb = 4'b1000;
    SrcA_tb = 32'h00001111;
    SrcB_tb = 32'h00001111;
    PCSrc_tb = 1'b1;
    #60
    $finish;
end
endmodule