// This program was cloned from: https://github.com/Qin-shihuang/BUAA_CO_2023
// License: MIT License

module D_Reg (
    input wire req,
    input wire [4:0] F_ExcCode,
    input wire F_bd,

    output reg [4:0] D_ExcCode_old,
    output reg D_bd,

    input wire        clk   ,
    input wire        rst   ,
    input wire        WE    ,
    input wire [31:0] F_PC   ,
    input wire [31:0] F_Inst ,
    output reg [31:0] D_PC   ,
    output reg [31:0] D_Inst 
);
    always @(posedge clk ) begin
        if (rst || req) begin
            D_PC   <= req ? 32'h00004180 : 0;
            D_Inst <= 0;
            D_ExcCode_old <= 0;
            D_bd <= 0;
        end
        else if (WE) begin
            D_PC   <= F_PC;
            D_Inst <= F_Inst;
            D_ExcCode_old <= F_ExcCode;
            D_bd <= F_bd;
        end
    end  
endmodule