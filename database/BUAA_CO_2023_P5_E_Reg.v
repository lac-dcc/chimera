// This program was cloned from: https://github.com/Qin-shihuang/BUAA_CO_2023
// License: MIT License

module E_Reg (
    input wire clk,
    input wire rst,
    input wire WE,

    input wire [31:0] D_PC,
    input wire [1:0] D_Tnew,

    input wire [4:0] D_RS_Addr,
    input wire [31:0] D_RS,
    input wire [31:0] D_Imm32,
    input wire [4:0] D_Shamt,
    input wire D_ALU_B_sel,
    input wire D_ALU_Shift_sel,
    input wire [4:0] D_ALUOp,

    input wire [4:0] D_RT_Addr,
    input wire [31:0] D_RT,
    input wire D_DM_WE,
    input wire [1:0] D_DM_Align,
    input wire D_DM_Sign,

    input wire D_Reg_WE,
    input wire [4:0] D_Reg_WA,
    input wire [1:0] D_Reg_WD_sel,

    output reg [31:0] E_PC,
    output reg [1:0] E_Tnew,

    output reg [4:0] E_RS_Addr,
    output reg [31:0] E_RS,
    output reg [31:0] E_Imm32,
    output reg [4:0] E_Shamt,
    output reg E_ALU_B_sel,
    output reg E_ALU_Shift_sel,
    output reg [4:0] E_ALUOp,

    output reg [4:0] E_RT_Addr,
    output reg [31:0] E_RT,
    output reg E_DM_WE,
    output reg [1:0] E_DM_Align,
    output reg E_DM_Sign,

    output reg E_Reg_WE,
    output reg [4:0] E_Reg_WA,
    output reg [1:0] E_Reg_WD_sel
);
    always @(posedge clk) begin
        if (rst) begin 
            E_PC <= 0;
            E_Tnew <= 0;
            E_RS_Addr <= 0;
            E_RS <= 0;
            E_Imm32 <= 0;
            E_Shamt <= 0;
            E_ALU_B_sel <= 0;
            E_ALU_Shift_sel <= 0;
            E_ALUOp <= 0;
            E_RT_Addr <= 0;
            E_RT <= 0;
            E_DM_WE <= 0;
            E_DM_Align <= 0;
            E_DM_Sign <= 0;
            E_Reg_WE <= 0;
            E_Reg_WA <= 0;
            E_Reg_WD_sel <= 0;
        end
        else if (WE) begin
            E_PC <= D_PC;
            E_Tnew <= D_Tnew;
            E_RS_Addr <= D_RS_Addr;
            E_RS <= D_RS;
            E_Imm32 <= D_Imm32;
            E_Shamt <= D_Shamt;
            E_ALU_B_sel <= D_ALU_B_sel;
            E_ALU_Shift_sel <= D_ALU_Shift_sel;
            E_ALUOp <= D_ALUOp;
            E_RT_Addr <= D_RT_Addr;
            E_RT <= D_RT;
            E_DM_WE <= D_DM_WE;
            E_DM_Align <= D_DM_Align;
            E_DM_Sign <= D_DM_Sign;
            E_Reg_WE <= D_Reg_WE;
            E_Reg_WA <= D_Reg_WA;
            E_Reg_WD_sel <= D_Reg_WD_sel;
        end
    end  
endmodule