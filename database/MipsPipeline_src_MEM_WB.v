// This program was cloned from: https://github.com/TCL606/MipsPipeline
// License: MIT License

module MEM_WB(
    input wire clk,
    input wire reset,

    input wire RegWrite_MEM,
    input wire [1:0] MemtoReg_MEM,
    input wire [4:0] Rw_MEM,
    input wire [31:0] ReadData_MEM,
    input wire [31:0] ALUOut_MEM,
    input wire [31:0] PC_MEM,
    input wire Load_MEM,

    output reg RegWrite_WB,
    output reg [1:0] MemtoReg_WB,
    output reg [4:0] Rw_WB,
    output reg [31:0] ReadData_WB,
    output reg [31:0] ALUOut_WB,
    output reg [31:0] PC_WB,
    output reg Load_WB
);

initial begin
    RegWrite_WB <= 0;
    MemtoReg_WB <= 0;
    Rw_WB <= 0;
    ReadData_WB <= 0;
    ALUOut_WB <= 0;
    PC_WB <= 0;
    Load_WB <= 0;
end

always @(posedge clk or posedge reset) begin
    if(reset) begin
        RegWrite_WB <= 0;
        MemtoReg_WB <= 0;
        Rw_WB <= 0;
        ReadData_WB <= 0;
        ALUOut_WB <= 0;
        PC_WB <= 0;
        Load_WB <= 0;
    end
    else begin
        RegWrite_WB <= RegWrite_MEM;
        MemtoReg_WB <= MemtoReg_MEM;
        Rw_WB <= Rw_MEM;
        ReadData_WB <= ReadData_MEM;
        ALUOut_WB <= ALUOut_MEM;
        PC_WB <= PC_MEM;
        Load_WB <= Load_MEM;
    end
end

endmodule