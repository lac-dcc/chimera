//Alu接收两个32位操作数，同时接收AluContrl实现ALU功能的�?�择
//输出�?32bit的AluOut，和1bit的Branch,Branch=1代表条件分支进行跳转，Branch=0代表分支条件不成立，执行PC+4
//AluContrl的位数：为了实现RV32I,ALU�?要支持SLL、SRL、SRA、ADD、SUB、XOR、OR、AND、SLT、SLTU和BEQ、BNE�?
//BLT、BLTU、BGE、BGEU
//以及LUI
//�?3+5+2+6+1种操作，因此共需�?5bit
module ALU(
    input wire [31:0] Operand1,
    input wire [31:0] Operand2,
    input wire [4:0] AluContrl,
    output reg Branch,
    output reg [31:0] AluOut
    );
    //
`include "Parameters.v"
    //
    wire signed [31:0] Operand1S = $signed(Operand1);
    wire signed [31:0] Operand2S = $signed(Operand2);
    //
    always@(*)
    case(AluContrl)
//算数逻辑
    SLL:       //SLL
        begin
        Branch<=1'b0;
        AluOut<=Operand1<<(Operand2[4:0]);
        end 
    SRL:       //SRL
        begin
        Branch<=1'b0;
        AluOut<=Operand1>>(Operand2[4:0]);
        end 
    SRA:       //SRA
        begin
        Branch<=1'b0;
        AluOut<=Operand1S >>> (Operand2[4:0]);
        end 
    ADD:       //ADD
        begin
        Branch<=1'b0;
        AluOut<=Operand1 + Operand2;
        end    
    SUB:       //SUB
        begin
        Branch<=1'b0;
        AluOut<=Operand1 - Operand2;
        end 
    XOR:       //XOR
        begin
        Branch<=1'b0;
        AluOut<=Operand1 ^ Operand2;
        end 
    OR:       //OR
        begin
        Branch<=1'b0;
        AluOut<=Operand1 | Operand2;
        end     
    AND:       //AND
        begin
        Branch<=1'b0;
        AluOut<=Operand1 & Operand2;
        end   
    SLT:       //SLT
        begin
        Branch<=1'b0;
        AluOut<=Operand1S < Operand2S ? 32'd1:32'd0;
        end 
    SLTU:       //SLTU
        begin
        Branch<=1'b0;
        AluOut<=Operand1 < Operand2 ? 32'd1:32'd0;
        end 
//分支预测
    BEQ:      //BEQ
        begin
        AluOut<=32'b0;
        if(Operand1==Operand2)
            Branch<=1'b1;
        else
            Branch<=1'b0;
        end 
    BNE:      //BNE
        begin
        AluOut<=32'b0;
        if(Operand1!=Operand2)
            Branch<=1'b1;
        else
            Branch<=1'b0;
        end    
    BLT:      //BLT
        begin
        AluOut<=32'b0;
        if(Operand1S<Operand2S)
            Branch<=1'b1;
        else
            Branch<=1'b0;
        end 
    BLTU:      //BLTU
        begin
        AluOut<=32'b0;
        if(Operand1<Operand2)
            Branch<=1'b1;
        else
            Branch<=1'b0;
        end 
    BGE:      //BGE
        begin
        AluOut<=32'b0;
        if(Operand1S>=Operand2S)
            Branch<=1'b1;
        else
            Branch<=1'b0;
        end 
    BGEU:    //BGEU
        begin
        AluOut<=32'b0;
        if(Operand1>=Operand2)
            Branch<=1'b1;
        else
            Branch<=1'b0;
        end        
    default:    //LUI 4'd16
        begin
        AluOut<={ Operand2[31:12],12'b0 };
        Branch<=1'b0;  
        end                                  
    endcase
endmodule