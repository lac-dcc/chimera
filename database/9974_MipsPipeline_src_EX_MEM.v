// This program was cloned from: https://github.com/TCL606/MipsPipeline
// License: MIT License

module EX_MEM(
    input wire clk,
    input wire reset,
    
    input wire MemRead_EX,
    input wire MemWrite_EX,
    input wire [31:0] ALUOut_EX,
    input wire [4:0] Rw_EX,
    input wire [1:0] MemtoReg_EX,
    input wire RegWrite_EX,
    input wire [31:0] rt_EX,
    input wire LoadByte_EX,
    input wire [31:0] PC_EX,
    input wire Load_EX,

    output reg MemRead_MEM,
    output reg MemWrite_MEM,
    output reg [31:0] ALUOut_MEM,
    output reg [4:0] Rw_MEM,
    output reg [1:0] MemtoReg_MEM,
    output reg RegWrite_MEM,
    output reg [31:0] rt_MEM,
    output reg LoadByte_MEM,
    output reg [31:0] PC_MEM,
    output reg Load_MEM
);

initial begin
    MemRead_MEM <= 0;
    MemWrite_MEM <= 0;
    ALUOut_MEM <= 0;
    Rw_MEM <= 0;
    MemtoReg_MEM <= 0;
    RegWrite_MEM <= 0;
    rt_MEM <= 0;
    LoadByte_MEM <= 0;
    PC_MEM <= 0; 
    Load_MEM <= 0;
end

always@(posedge clk or posedge reset) begin
    if(reset) begin
        MemRead_MEM <= 0;
        MemWrite_MEM <= 0;
        ALUOut_MEM <= 0;
        Rw_MEM <= 0;
        MemtoReg_MEM <= 0;
        RegWrite_MEM <= 0;
        rt_MEM <= 0;
        LoadByte_MEM <= 0;
        PC_MEM <= 0;
        Load_MEM <= 0;
    end
    else begin
        MemRead_MEM <= MemRead_EX;
        MemWrite_MEM <= MemWrite_EX;
        ALUOut_MEM <= ALUOut_EX;
        Rw_MEM <= Rw_EX;
        MemtoReg_MEM <= MemtoReg_EX;
        RegWrite_MEM <= RegWrite_EX;
        rt_MEM <= rt_EX;
        LoadByte_MEM <= LoadByte_EX;
        PC_MEM <= PC_EX;
        Load_MEM <= Load_EX;
    end
end

endmodule