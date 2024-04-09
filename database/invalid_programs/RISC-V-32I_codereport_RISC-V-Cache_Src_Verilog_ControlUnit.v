//ControlUnit作为译码器，解析指令并且输出控制信号
module ControlUnit(
    input wire [6:0] Op,
    input wire [2:0] Fn3,
    input wire [6:0] Fn7,
    output wire JalD,
    output wire JalrD,
    output reg [2:0] RegWriteD,
    output wire MemToRegD,
    output reg [3:0] MemWriteD,
    output wire LoadNpcD,
    output wire BranchD,
    output reg [4:0] AluContrlD,
    output wire [1:0] AluSrc2D,
    output wire AluSrc1D,
    output reg [2:0] ImmType        
    );
    //
`include "Parameters.v"   
    //
    assign LoadNpcD = JalD | JalrD;
    assign JalD = (Op==7'b1101111)?1'b1:1'b0;
    assign JalrD = (Op==7'b1100111)?1'b1:1'b0;
    assign BranchD = (Op==7'b1100011)?1'b1:1'b0;
    assign MemToRegD = (Op==7'b0000011)?1'b1:1'b0;
    assign AluSrc1D = (Op==7'b0010111)?1'b1:1'b0;
    // 0: reg, 1: imm, 10, pc
    assign AluSrc2D = ( (Op==7'b0010011)&&(Fn3[1:0]==2'b01) )?(2'b01):(((Op==7'b0110011)||(Op==7'b1100011))?2'b00:2'b10);
    //
    always@(*)
    case(Op)
        7'b0010011:begin    //移位运算和立即数计算
            RegWriteD<=LW;
            MemWriteD<=4'b0000;
            ImmType<=ITYPE;
            case(Fn3)
                3'b000:AluContrlD<=ADD;  //ADDI
                3'b001:AluContrlD<=SLL;  //SLLI
                3'b010:AluContrlD<=SLT;  //SLTI
                3'b011:AluContrlD<=SLTU;   //SLTIU
                3'b100:AluContrlD<=XOR;    //XORI
                3'b101:
                    if(Fn7[5]==1)
                        AluContrlD<=SRA;   //SRAI
                    else
                        AluContrlD<=SRL;   //SRLI
                3'b110:AluContrlD<=OR;   //ORI
                default:AluContrlD<=AND;    //ANDI     3'b111                                                    
            endcase
        end
        7'b0110011:begin    //寄存器寄存器型算数逻辑计算
            RegWriteD<=LW;
            MemWriteD<=4'b0000;
            ImmType<=ITYPE;
            case(Fn3)
                3'b000:begin
                    if(Fn7[5]==1)
                        AluContrlD<=SUB;   //SUB
                    else
                        AluContrlD<=ADD;   //ADD
                end
                3'b001:AluContrlD<=SLL;    //SLL
                3'b010:AluContrlD<=SLT;    //SLT
                3'b011:AluContrlD<=SLTU;    //SLTU
                3'b100:AluContrlD<=XOR;    //XOR
                3'b101:begin
                    if(Fn7[5]==1)
                        AluContrlD<=SRA;   //SRA
                    else
                        AluContrlD<=SRL;   //SRL
                end  
                3'b110:AluContrlD<=OR;    //OR
                default:AluContrlD<=AND;    //AND   3'b111                                       
            endcase
        end
        7'b0000011:begin    //存储器读
            MemWriteD<=4'b0000;
            AluContrlD<=ADD;
            ImmType<=ITYPE;
            case(Fn3)
                3'b000:RegWriteD<=LB;    //LB
                3'b001:RegWriteD<=LH;    //LH
                3'b010:RegWriteD<=LW;    //LW
                3'b100:RegWriteD<=LBU;    //LBU
                default:RegWriteD<=LHU;    //LHU  3'b101                                                            
            endcase
        end
        7'b0100011:begin    //存储器写
            RegWriteD<=NOREGWRITE;
            AluContrlD<=ADD;
            ImmType<=STYPE; 
            case(Fn3)
                3'b000:MemWriteD<=4'b0001;    //SB
                3'b001:MemWriteD<=4'b0011;    //SH
                default:MemWriteD<=4'b1111;   //SW    3'b010                                                       
            endcase
        end
        7'b0110111:begin    //LUI
        RegWriteD<=LW;
        MemWriteD<=4'b0000;
        AluContrlD<=LUI;
        ImmType<=UTYPE;     
        end 
        7'b0010111:begin    //AUIPC
        RegWriteD<=3'd3;
        MemWriteD<=4'b0000;
        AluContrlD<=ADD;
        ImmType<=UTYPE;
        end
        7'b1101111:begin    //JAL
        RegWriteD<=LW;
        MemWriteD<=4'b0000;
        AluContrlD<=ADD;
        ImmType<=JTYPE;       
        end
        7'b1100111:begin    //JALR      I型指令
        RegWriteD<=LW;
        MemWriteD<=4'b0000;
        AluContrlD<=ADD;
        ImmType<=ITYPE;         
        end
        7'b1100011:begin    //条件分支
            RegWriteD<=NOREGWRITE;
            MemWriteD<=4'b0000;
            ImmType<=BTYPE;
            case(Fn3)
                3'b000:AluContrlD<=BEQ;    //BEQ
                3'b001:AluContrlD<=BNE;    //BNE
                3'b100:AluContrlD<=BLT;    //BLT
                3'b101:AluContrlD<=BGE;    //BGE 
                3'b110:AluContrlD<=BLTU;    //BLTU
                default:AluContrlD<=BGEU;    //BGEU 3'b111                                                        
            endcase
        end
        default:begin       //无效指令或者空指令
        RegWriteD<=NOREGWRITE;
        MemWriteD<=4'b0000;
        AluContrlD<=ADD;
        ImmType<=ITYPE;
        end
    endcase
    
endmodule