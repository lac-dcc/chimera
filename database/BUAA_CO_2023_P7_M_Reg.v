// This program was cloned from: https://github.com/Qin-shihuang/BUAA_CO_2023
// License: MIT License

module M_Reg (
    input wire req,
    input wire [4:0] E_ExcCode,
    input wire E_bd,
    input wire E_Exc_Ov_DM,

    output reg [4:0] M_ExcCode_old,
    output reg M_bd,
    output reg M_Exc_Ov_DM,

    input wire E_DM_RE,
    output reg M_DM_RE,

    input wire clk,
    input wire rst,
    input wire WE,

    input wire [31:0] E_PC,
    input wire [1:0] E_Tnew,

    input wire [4:0] E_RT_Addr,
    input wire [4:0] E_RD_Addr,
    input wire [31:0] E_RT,
    input wire E_DM_WE,
    input wire [2:0] E_DM_Align,
    input wire E_CP0_WE,
    input wire E_eret,

    input wire [31:0] E_ALURes,
    input wire [31:0] E_MulDiv_Out,
    input wire E_Reg_WE,
    input wire [4:0] E_Reg_WA,
    input wire [2:0] E_Reg_WD_sel,

    output reg [31:0] M_PC,
    output reg [1:0] M_Tnew,

    output reg [4:0] M_RT_Addr,
    output reg [4:0] M_RD_Addr,
    output reg [31:0] M_RT,
    output reg M_DM_WE,
    output reg [2:0] M_DM_Align,
    output reg M_CP0_WE,
    output reg M_eret,

    output reg [31:0] M_ALURes,
    output reg [31:0] M_MulDiv_Out,
    output reg M_Reg_WE,
    output reg [4:0] M_Reg_WA,
    output reg [2:0] M_Reg_WD_sel
);
    always @(posedge clk) begin
        if (rst || req) begin
            M_ExcCode_old <= 0;
            M_bd <= 0;
            M_Exc_Ov_DM <= 0;

            M_DM_RE <= 0;

            M_PC <= req? 32'h00004180: 0;
            M_Tnew <= 0;
            M_RT_Addr <= 0;
            M_RD_Addr <= 0;
            M_RT <= 0;
            M_DM_WE <= 0;
            M_DM_Align <= 0;
            M_CP0_WE <= 0;
            M_eret <= 0;
            M_ALURes <= 0;
            M_MulDiv_Out <= 0;
            M_Reg_WE <= 0;
            M_Reg_WA <= 0;
            M_Reg_WD_sel <= 0;
        end
        else if (WE) begin
            M_ExcCode_old <= E_ExcCode;
            M_bd <= E_bd;
            M_Exc_Ov_DM <= E_Exc_Ov_DM;

            M_DM_RE <= E_DM_RE;

            M_PC <= E_PC;
            M_Tnew <= E_Tnew;
            M_RT_Addr <= E_RT_Addr;
            M_RD_Addr <= E_RD_Addr;
            M_RT <= E_RT;
            M_DM_WE <= E_DM_WE;
            M_DM_Align <= E_DM_Align;
            M_CP0_WE <= E_CP0_WE;
            M_eret <= E_eret;
            M_ALURes <= E_ALURes;
            M_MulDiv_Out <= E_MulDiv_Out;
            M_Reg_WE <= E_Reg_WE;
            M_Reg_WA <= E_Reg_WA;
            M_Reg_WD_sel <= E_Reg_WD_sel;
        end
    end
endmodule