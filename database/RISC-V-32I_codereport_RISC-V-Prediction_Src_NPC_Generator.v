`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB（Embeded System Lab）
// Engineer: Haojun Xia
// Create Date: 2019/03/14 11:21:33
// Design Name: RISCV-Pipline CPU
// Module Name: NPC_Generator
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: Choose Next PC value
//////////////////////////////////////////////////////////////////////////////////
module NPC_Generator(
    input wire [31:0] PCF,JalrTarget, BranchTarget, JalTarget, BranchPredictedTargetF,PCE,
    input wire BranchE,JalD,JalrE,BranchPredictedF,BranchPredictedE,BranchPredictedTakenF,BranchPredictedTakenE,
    output reg [31:0] PC_In
    );
    always @(*)
    begin
        if(JalrE)
            PC_In <= JalrTarget;
        else if((~BranchPredictedE || BranchPredictedE && ~BranchPredictedTakenE) && BranchE) //之前没预测或者预测不跳转，但实际跳转了（在HazardUnit中进行了Flush）
            PC_In <= BranchTarget;
		else if(BranchPredictedE && BranchPredictedTakenE && ~BranchE) //之前预测跳转，但实际不跳转（在HazardUnit中进行了Flush）
			PC_In <= PCE + 4;
        else if(JalD)
            PC_In <= JalTarget;
        else if(BranchPredictedF && BranchPredictedTakenF) //本次进行预测且预测跳转
			PC_In <= BranchPredictedTargetF;
		else
            PC_In <= PCF + 4;
    end
endmodule
