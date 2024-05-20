// This program was cloned from: https://github.com/Qin-shihuang/BUAA_CO_2023
// License: MIT License

module W_Reg (
    input wire req,    

    input wire clk,
    input wire rst,
    input wire WE,

    input wire [31:0] M_PC,

    input wire [31:0] M_ALURes,
    input wire [31:0] M_MulDiv_Out,
    input wire [31:0] M_DM_RD,
    input wire M_Reg_WE,
    input wire [4:0] M_Reg_WA,
    input wire [2:0] M_Reg_WD_sel,
    input wire [31:0] M_CP0Out,
    
    output reg [31:0] W_PC,

    output reg [31:0] W_ALURes,
    output reg [31:0] W_MulDiv_Out,
    output reg [31:0] W_DM_RD,
    output reg W_Reg_WE,
    output reg [4:0] W_Reg_WA,
    output reg [2:0] W_Reg_WD_sel,
    output reg [31:0] W_CP0Out
);
    always @(posedge clk ) begin
        if (rst || req) begin 
            W_PC <= req ? 32'h00004180 : 0;
            W_CP0Out <= 0;
            W_ALURes <= 0;
            W_MulDiv_Out <= 0;
            W_DM_RD <= 0;
            W_Reg_WE <= 0;
            W_Reg_WA <= 0;
            W_Reg_WD_sel <= 0;
            W_CP0Out <= 0;
        end
        else if (WE) begin
            W_CP0Out <= M_CP0Out;
            W_PC <= M_PC;
            W_ALURes <= M_ALURes;
            W_MulDiv_Out <= M_MulDiv_Out;
            W_DM_RD <= M_DM_RD;
            W_Reg_WE <= M_Reg_WE;
            W_Reg_WA <= M_Reg_WA;
            W_Reg_WD_sel <= M_Reg_WD_sel;
            W_CP0Out <= M_CP0Out;
        end
    end
endmodule