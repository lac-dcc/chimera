// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

module M_ID_EX_REG(
    input flushE,
    input clk,
    input[4:0] rsD,
    input[31:0] instrD,
    input regwrite, memtoreg, memwrite,
    input[2:0] alucontrol,
    input alusrc, regdst,
    input[31:0] srca, writedata,
    input[4:0] rtD, rdD,
    input[31:0] signimmD,
    output reg regwriteE, memtoregE, memwriteE,
    output reg[2:0] alucontrolE,
    output reg alusrcE, regdstE,
    output reg[31:0] srcaMUX, writedataMUX,
    output reg[4:0] rtE, rdE,
    output reg[31:0] signimmE,
    output reg[31:0] instrE,
    output reg[4:0] rsE);

    always@(posedge clk) begin
        if(flushE==1'b1) begin
            regwriteE <= 0;
            memtoregE <= 0;
            memwriteE <= 0;
            //branchE <= 0;
            alucontrolE <= 0;
            alusrcE <= 0;
            regdstE <= 0;
            srcaMUX <= 0;
            writedataMUX <= 0;
            rtE <= 0;
            rdE <= 0;
            signimmE <= 0;
            //pcplus4E <= 0;
            instrE <= 0;
            rsE <= 0;
        end
        else begin
            regwriteE <= regwrite;
            memtoregE <= memtoreg;
            memwriteE <= memwrite;
            //branchE <= branch;
            alucontrolE <= alucontrol;
            alusrcE <= alusrc;
            regdstE <= regdst;
            srcaMUX <= srca;
            writedataMUX <= writedata;
            rtE <= rtD;
            rdE <= rdD;
            signimmE <= signimmD;
            //	pcplus4E <= pcplus4D;
            instrE <= instrD;
            rsE <= rsD;
            if(instrE!=8'hx)
                $display("Instruction %h is in EX stage", instrE);
        end
    end
endmodule