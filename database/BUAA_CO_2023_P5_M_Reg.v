// This program was cloned from: https://github.com/Qin-shihuang/BUAA_CO_2023
// License: MIT License

module M_Reg (
    input wire clk,
    input wire rst,
    input wire WE,

    input wire [31:0] E_PC,
    input wire [1:0] E_Tnew,

    input wire [4:0] E_RT_Addr,
    input wire [31:0] E_RT,
    input wire E_DM_WE,
    input wire [1:0] E_DM_Align,
    input wire E_DM_Sign,

    input wire [31:0] E_ALURes,
    input wire E_Reg_WE,
    input wire [4:0] E_Reg_WA,
    input wire [1:0] E_Reg_WD_sel,

    output reg [31:0] M_PC,
    output reg [1:0] M_Tnew,

    output reg [4:0] M_RT_Addr,
    output reg [31:0] M_RT,
    output reg M_DM_WE,
    output reg [1:0] M_DM_Align,
    output reg M_DM_Sign,

    output reg [31:0] M_ALURes,
    output reg M_Reg_WE,
    output reg [4:0] M_Reg_WA,
    output reg [1:0] M_Reg_WD_sel
);
    always @(posedge clk) begin
        if (rst) begin
            M_PC <= 0;
            M_Tnew <= 0;
            M_RT_Addr <= 0;
            M_RT <= 0;
            M_DM_WE <= 0;
            M_DM_Align <= 0;
            M_DM_Sign <= 0;
            M_ALURes <= 0;
            M_Reg_WE <= 0;
            M_Reg_WA <= 0;
            M_Reg_WD_sel <= 0;
        end
        else if (WE) begin
            M_PC <= E_PC;
            M_Tnew <= E_Tnew;
            M_RT_Addr <= E_RT_Addr;
            M_RT <= E_RT;
            M_DM_WE <= E_DM_WE;
            M_DM_Align <= E_DM_Align;
            M_DM_Sign <= E_DM_Sign;
            M_ALURes <= E_ALURes;
            M_Reg_WE <= E_Reg_WE;
            M_Reg_WA <= E_Reg_WA;
            M_Reg_WD_sel <= E_Reg_WD_sel;
        end
    end
endmodule