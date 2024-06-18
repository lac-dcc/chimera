// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0



`include "Data_Memory.v"

module memory_cycle(clk, rst, RegWriteM, MemWriteM, ResultSrcM, RD_M, PCPlus4M, WriteDataM, 
    ALU_ResultM, RegWriteW, ResultSrcW, RD_W, PCPlus4W, ALU_ResultW, ReadDataW);
    
    // Declaration of I/Os
    input clk, rst, RegWriteM, MemWriteM, ResultSrcM;
    input [4:0] RD_M; 
    input [31:0] PCPlus4M, WriteDataM, ALU_ResultM;

    output  RegWriteW, ResultSrcW; 
    output [4:0] RD_W;
    output [31:0] PCPlus4W, ALU_ResultW, ReadDataW;

    // Declaration of Interim Wires
    wire [31:0] ReadDataM;

    // Declaration of Interim Registers
    reg RegWriteM_r, ResultSrcM_r;
    reg [4:0] RD_M_r;
    reg [31:0] PCPlus4M_r, ALU_ResultM_r, ReadDataM_r;

    // Declaration of Module Initiation
    Data_Memory Data_Memory (
                        .clk(clk),
                        .rst(rst),
                        .WE(MemWriteM),
                        .WD(WriteDataM),
                        .A(ALU_ResultM),
                        .RD(ReadDataM)
                    );

    // Memory Stage Register Logic
    always @(posedge clk or negedge rst) begin
        if (rst == 1'b0) begin
            RegWriteM_r         <= 1'b0; 
            ResultSrcM_r        <= 1'b0;
            RD_M_r              <= 5'h00;
            PCPlus4M_r          <= 32'h00000000; 
            ALU_ResultM_r       <= 32'h00000000; 
            ReadDataM_r         <= 32'h00000000;
                
        end
        else begin
            RegWriteM_r         <= RegWriteM; 
            ResultSrcM_r        <= ResultSrcM;
            RD_M_r              <= RD_M;
            PCPlus4M_r          <= PCPlus4M; 
            ALU_ResultM_r       <= ALU_ResultM; 
            ReadDataM_r         <= ReadDataM;
            


        end
    end 

    // Declaration of output assignments
    assign RegWriteW = RegWriteM_r;
    assign ResultSrcW = ResultSrcM_r;
    assign RD_W = RD_M_r;
    assign PCPlus4W = PCPlus4M_r;
    assign ALU_ResultW = ALU_ResultM_r;
    assign ReadDataW = ReadDataM_r;

endmodule