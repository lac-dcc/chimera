// This program was cloned from: https://github.com/Qin-shihuang/BUAA_CO_2023
// License: MIT License

module W_Reg (
    input wire clk,
    input wire rst,
    input wire WE,

    input wire [31:0] M_PC,

    input wire [31:0] M_ALURes,
    input wire [31:0] M_DM_RD,
    input wire M_Reg_WE,
    input wire [4:0] M_Reg_WA,
    input wire [1:0] M_Reg_WD_sel,
    
    output reg [31:0] W_PC,

    output reg [31:0] W_ALURes,
    output reg [31:0] W_DM_RD,
    output reg W_Reg_WE,
    output reg [4:0] W_Reg_WA,
    output reg [1:0] W_Reg_WD_sel
);
    always @(posedge clk ) begin
        if (rst) begin 
            W_PC <= 0;
            W_ALURes <= 0;
            W_DM_RD <= 0;
            W_Reg_WE <= 0;
            W_Reg_WA <= 0;
            W_Reg_WD_sel <= 0;
        end
        else if (WE) begin
            W_PC <= M_PC;
            W_ALURes <= M_ALURes;
            W_DM_RD <= M_DM_RD;
            W_Reg_WE <= M_Reg_WE;
            W_Reg_WA <= M_Reg_WA;
            W_Reg_WD_sel <= M_Reg_WD_sel;
        end
    end
endmodule