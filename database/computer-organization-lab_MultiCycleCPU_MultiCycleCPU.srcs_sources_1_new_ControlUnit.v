`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/12 22:03:51
// Design Name: 
// Module Name: ControlUnit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ControlUnit(
    input clk, rst,
    input zero, sign,
    input [5:0] opcode,
    output wire InsMemRW,
    output reg PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, WrRegDSrc, mRD, mWR, IRWre, ExtSel,
    output reg [1:0] PCSrc,
    output reg [1:0] RegDst,
    output reg [2:0] ALUOp
    );
    
    reg [2:0] state;
    assign InsMemRW = 1;    // 本次实验中，指令存储器只读
    
    /* 状态转移 */
    always @(posedge clk or negedge rst) begin
        if(rst==0) begin
            state <= 3'b000;
            PCWre <= 1;
            IRWre <= 1;
        end
        else begin
            case(state)
                3'b000: state <= 3'b001;
                3'b001: begin
                        if(opcode==6'b110100 || opcode==6'b110101 || opcode==6'b110110) state <= 3'b101;
                        else if(opcode==6'b110000 || opcode==6'b110001) state <= 3'b010;
                        else if(opcode==6'b111000 || opcode==6'b111001 || opcode==6'b111010 || opcode==6'b111111)
                            state <= 3'b000;
                        else state <= 3'b110;
                    end
                3'b110: state <= 3'b111;
                3'b010: state <= 3'b011;
                3'b011: begin
                        if(opcode==6'b110001) state <= 3'b100;
                        else state <= 3'b000;
                    end
                3'b111, 3'b101, 3'b100: state <= 3'b000;
            endcase
        end
    end
    
    /* 输出函数 */
    always @(state or opcode or zero or sign) begin  // 注意触发条件
        case(opcode)
            6'b000000: begin  // add
                {ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, mRD, ExtSel, PCSrc[1:0], RegDst[1:0], ALUOp[2:0]} <= 13'b000100_00_10_000;
                case(state)
                    3'b000: {IRWre, mWR, RegWre} = 4'b100;
                    3'b001: {IRWre, mWR, RegWre} = 4'b100;
                    3'b110: {IRWre, mWR, RegWre} = 4'b100;
                    3'b111: {IRWre, mWR, RegWre} = 4'b101;
                endcase
            end
            6'b000001: begin  // sub
                {ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, mRD, ExtSel, PCSrc[1:0], RegDst[1:0], ALUOp[2:0]} <= 13'b000100_00_10_001;
                case(state)
                    3'b000: {IRWre, mWR, RegWre} = 4'b100;
                    3'b001: {IRWre, mWR, RegWre} = 4'b100;
                    3'b110: {IRWre, mWR, RegWre} = 4'b100;
                    3'b111: {IRWre, mWR, RegWre} = 4'b101;
                endcase
            end
            6'b000010: begin  // addiu
                {ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, mRD, ExtSel, PCSrc[1:0], RegDst[1:0], ALUOp[2:0]} <= 13'b010101_00_01_000;
                case(state)
                    3'b000: {IRWre, mWR, RegWre} = 4'b100;
                    3'b001: {IRWre, mWR, RegWre} = 4'b100;
                    3'b110: {IRWre, mWR, RegWre} = 4'b100;
                    3'b111: {IRWre, mWR, RegWre} = 4'b101;
                endcase
            end
            6'b010000: begin  // and
                {ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, mRD, ExtSel, PCSrc[1:0], RegDst[1:0], ALUOp[2:0]} <= 13'b000100_00_10_100;
                case(state)
                    3'b000: {IRWre, mWR, RegWre} = 4'b100;
                    3'b001: {IRWre, mWR, RegWre} = 4'b100;
                    3'b110: {IRWre, mWR, RegWre} = 4'b100;
                    3'b111: {IRWre, mWR, RegWre} = 4'b101;
                endcase
            end
            6'b010001: begin  // andi
                {ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, mRD, ExtSel, PCSrc[1:0], RegDst[1:0], ALUOp[2:0]} <= 13'b010100_00_01_100;
                case(state)
                    3'b000: {IRWre, mWR, RegWre} = 4'b100;
                    3'b001: {IRWre, mWR, RegWre} = 4'b100;
                    3'b110: {IRWre, mWR, RegWre} = 4'b100;
                    3'b111: {IRWre, mWR, RegWre} = 4'b101;
                endcase
            end
            6'b010010: begin  // ori
                {ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, mRD, ExtSel, PCSrc[1:0], RegDst[1:0], ALUOp[2:0]} <= 13'b010100_00_01_011;
                case(state)
                    3'b000: {IRWre, mWR, RegWre} = 4'b100;
                    3'b001: {IRWre, mWR, RegWre} = 4'b100;
                    3'b110: {IRWre, mWR, RegWre} = 4'b100;
                    3'b111: {IRWre, mWR, RegWre} = 4'b101;
                endcase
            end
            6'b010011: begin  // xori
                {ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, mRD, ExtSel, PCSrc[1:0], RegDst[1:0], ALUOp[2:0]} <= 13'b010100_00_01_111;
                case(state)
                    3'b000: {IRWre, mWR, RegWre} = 4'b100;
                    3'b001: {IRWre, mWR, RegWre} = 4'b100;
                    3'b110: {IRWre, mWR, RegWre} = 4'b100;
                    3'b111: {IRWre, mWR, RegWre} = 4'b101;
                endcase
            end
            6'b011000: begin  // sll
                {ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, mRD, ExtSel, PCSrc[1:0], RegDst[1:0], ALUOp[2:0]} <= 13'b100100_00_10_010;
                case(state)
                    3'b000: {IRWre, mWR, RegWre} = 4'b100;
                    3'b001: {IRWre, mWR, RegWre} = 4'b100;
                    3'b110: {IRWre, mWR, RegWre} = 4'b100;
                    3'b111: {IRWre, mWR, RegWre} = 4'b101;
                endcase
           end
            6'b100110: begin  // slti
                {ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, mRD, ExtSel, PCSrc[1:0], RegDst[1:0], ALUOp[2:0]} <= 13'b010101_00_01_110;
                case(state)
                    3'b000: {IRWre, mWR, RegWre} = 4'b100;
                    3'b001: {IRWre, mWR, RegWre} = 4'b100;
                    3'b110: {IRWre, mWR, RegWre} = 4'b100;
                    3'b111: {IRWre, mWR, RegWre} = 4'b101;
                endcase
            end
            6'b100111: begin  // slt
                {ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, mRD, ExtSel, PCSrc[1:0], RegDst[1:0], ALUOp[2:0]} <= 13'b000100_00_10_110;
                case(state)
                    3'b000: {IRWre, mWR, RegWre} = 4'b100;
                    3'b001: {IRWre, mWR, RegWre} = 4'b100;
                    3'b110: {IRWre, mWR, RegWre} = 4'b100;
                    3'b111: {IRWre, mWR, RegWre} = 4'b101;
                endcase
            end
            6'b110000: begin  // sw
                {ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, mRD, ExtSel, PCSrc[1:0], RegDst[1:0], ALUOp[2:0]} <= 13'b010101_00_00_000;
                case(state)
                    3'b000: {IRWre, mWR, RegWre} = 4'b100;
                    3'b001: {IRWre, mWR, RegWre} = 4'b100;
                    3'b010: {IRWre, mWR, RegWre} = 4'b100;
                    3'b011: {IRWre, mWR, RegWre} = 4'b110;
                endcase
            end
            6'b110001: begin  // lw
                {ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, mRD, ExtSel, PCSrc[1:0], RegDst[1:0], ALUOp[2:0]} <= 13'b011111_00_01_000;
                case(state)
                    3'b000: {IRWre, mWR, RegWre} = 4'b100;
                    3'b001: {IRWre, mWR, RegWre} = 4'b100;
                    3'b010: {IRWre, mWR, RegWre} = 4'b100;
                    3'b011: {IRWre, mWR, RegWre} = 4'b100;
                    3'b100: {IRWre, mWR, RegWre} = 4'b101;
                endcase
            end
            6'b110100: begin  // beq
                {ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, mRD, ExtSel, RegDst[1:0], ALUOp[2:0]} <= 11'b000101_00_001;
                PCSrc[1:0] <= (zero==1) ? 2'b01 : 2'b00;
                case(state)
                    3'b000: {IRWre, mWR, RegWre} = 4'b100;
                    default: {IRWre, mWR, RegWre} = 4'b100;
                endcase
            end
            6'b110101: begin  // bne
                {ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, mRD, ExtSel, RegDst[1:0], ALUOp[2:0]} <= 11'b000101_00_001;
                PCSrc[1:0] <= (zero==0) ? 2'b01 : 2'b00;
                case(state)
                    3'b000: {IRWre, mWR, RegWre} = 4'b100;
                    default: {IRWre, mWR, RegWre} = 4'b100;
                endcase
            end
            6'b110110: begin  // bltz
                {ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, mRD, ExtSel, RegDst[1:0], ALUOp[2:0]} <= 11'b000101_00_000;
                PCSrc[1:0] <= (sign==1) ? 2'b01 : 2'b00;
                case(state)
                    3'b000: {IRWre, mWR, RegWre} = 4'b100;
                    default: {IRWre, mWR, RegWre} = 4'b100;
                endcase
            end
            6'b111000: begin  // j
                {ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, mRD, ExtSel, PCSrc[1:0], RegDst[1:0], ALUOp[2:0]} <= 13'b000100_11_00_000;
                case(state)
                    3'b000: {IRWre, mWR, RegWre} = 4'b100;
                    3'b001: {IRWre, mWR, RegWre} = 4'b100;
                endcase
            end
            6'b111001: begin  // jr
                {ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, mRD, ExtSel, PCSrc[1:0], RegDst[1:0], ALUOp[2:0]} <= 13'b000100_10_00_000;
                case(state)
                    3'b000: {IRWre, mWR, RegWre} = 4'b100;
                    3'b001: {IRWre, mWR, RegWre} = 4'b100;
                endcase
            end
            6'b111010: begin  // jal
                {ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, mRD, ExtSel, PCSrc[1:0], RegDst[1:0], ALUOp[2:0]} <= 13'b000000_11_00_000;
                case(state)
                    3'b000: {IRWre, mWR, RegWre} = 4'b100;
                    3'b001: {IRWre, mWR, RegWre} = 4'b101;  // jal在ID阶段（001）写寄存器
                endcase
            end
            6'b111111: begin  // halt
                {ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, mRD, ExtSel, PCSrc[1:0], RegDst[1:0], ALUOp[2:0]} <= 13'b000100_00_00_000;
                {IRWre, mWR, RegWre} = 4'b100;
            end
        endcase
    end
    
    always @(negedge clk) begin
        case(state)
            3'b111, 3'b101, 3'b100: PCWre <= 1;
            3'b011: PCWre <= (opcode==6'b110000 ? 1 : 0);   // sw
            3'b001: PCWre <= (opcode==6'b111000||opcode==6'b111001||opcode==6'b111010 ? 1 : 0);  // j, jr, jal
            default: PCWre <= 0;
        endcase
    end
    
endmodule
