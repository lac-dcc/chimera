// This program was cloned from: https://github.com/Qin-shihuang/BUAA_CO_2023
// License: MIT License

module E_Reg (
    input wire stall,
    input wire req,
    
    input wire D_ALUOv,
    input wire D_DM_Ov,
    input wire [4:0] D_ExcCode,
    input wire D_bd,

    output reg E_ALUOv,
    output reg E_DM_Ov,
    output reg [4:0] E_ExcCode_old,
    output reg E_bd,

    input wire D_DM_RE,
    output reg E_DM_RE,

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
    input wire [4:0] D_ALUOp,
    input wire [3:0] D_MulDivOp,

    input wire [4:0] D_RT_Addr,
    input wire [4:0] D_RD_Addr,
    input wire [31:0] D_RT,
    input wire D_DM_WE,
    input wire [2:0] D_DM_Align,
    input wire D_CP0_WE,
    input wire D_eret,

    input wire D_Reg_WE,
    input wire [4:0] D_Reg_WA,
    input wire [2:0] D_Reg_WD_sel,

    output reg [31:0] E_PC,
    output reg [1:0] E_Tnew,

    output reg [4:0] E_RS_Addr,
    output reg [31:0] E_RS,
    output reg [31:0] E_Imm32,
    output reg [4:0] E_Shamt,
    output reg E_ALU_B_sel,
    output reg [4:0] E_ALUOp,
    output reg [3:0] E_MulDivOp,

    output reg [4:0] E_RT_Addr,
    output reg [4:0] E_RD_Addr,
    output reg [31:0] E_RT,
    output reg E_DM_WE,
    output reg [2:0] E_DM_Align,
    output reg E_CP0_WE,
    output reg E_eret,

    output reg E_Reg_WE,
    output reg [4:0] E_Reg_WA,
    output reg [2:0] E_Reg_WD_sel
);
    always @(posedge clk) begin
        if (rst || req || stall) begin 
            E_ALUOv <= 0;
            E_DM_Ov <= 0;
            E_ExcCode_old <= 0;
            E_bd <= stall ? D_bd : 0;
            E_DM_RE <= 0;

            E_PC <= stall ? D_PC : (req ? 32'h00004180 : 0);
            E_Tnew <= 0;
            E_RS_Addr <= 0;
            E_RS <= 0;
            E_Imm32 <= 0;
            E_Shamt <= 0;
            E_ALU_B_sel <= 0;
            E_ALUOp <= 0;
            E_MulDivOp <= 0;
            E_RT_Addr <= 0;
            E_RD_Addr <= 0;
            E_RT <= 0;
            E_DM_WE <= 0;
            E_DM_Align <= 0;
            E_CP0_WE <= 0;
            E_eret <= 0;
            E_Reg_WE <= 0;
            E_Reg_WA <= 0;
            E_Reg_WD_sel <= 0;
        end
        else if (WE) begin
            E_ALUOv <= D_ALUOv;
            E_DM_Ov <= D_DM_Ov;
            E_ExcCode_old <= D_ExcCode;
            E_bd <= D_bd;
            E_DM_RE <= D_DM_RE;

            E_PC <= D_PC;
            E_Tnew <= D_Tnew;
            E_RS_Addr <= D_RS_Addr;
            E_RS <= D_RS;
            E_Imm32 <= D_Imm32;
            E_Shamt <= D_Shamt;
            E_ALU_B_sel <= D_ALU_B_sel;
            E_ALUOp <= D_ALUOp;
            E_MulDivOp <= D_MulDivOp;
            E_RT_Addr <= D_RT_Addr;
            E_RD_Addr <= D_RD_Addr;
            E_RT <= D_RT;
            E_DM_WE <= D_DM_WE;
            E_DM_Align <= D_DM_Align;
            E_CP0_WE <= D_CP0_WE;
            E_eret <= D_eret;
            E_Reg_WE <= D_Reg_WE;
            E_Reg_WA <= D_Reg_WA;
            E_Reg_WD_sel <= D_Reg_WD_sel;
        end
    end  
endmodule