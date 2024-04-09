//EXSegReg是指执行阶段的段寄存器，存储�?前一阶段指令的译码结果，供EX段使�?
module EXSegReg(
    input wire clk,
    input wire rst,
    input wire en,
    input wire clear,
    //数据信号
    input wire [31:0] PCD,
    output reg [31:0] PCE, 
    input wire [31:0] BrPCD,
    output reg [31:0] BrPCE, 
    input wire [31:0] ImmD,
    output reg [31:0] ImmE,
    input wire [4:0] RdD,
    output reg [4:0] RdE,
    input wire [4:0] Rs1D,
    output reg [4:0] Rs1E,
    input wire [4:0] Rs2D,
    output reg [4:0] Rs2E,
    input wire [31:0] RegOut1D,
    output reg [31:0] RegOut1E,
    input wire [31:0] RegOut2D,
    output reg [31:0] RegOut2E,
    //控制信号
    input wire JalrD,
    output reg JalrE,
    input wire [2:0] RegWriteD,
    output reg [2:0] RegWriteE,
    input wire MemToRegD,
    output reg MemToRegE,
    input wire [3:0] MemWriteD,
    output reg [3:0] MemWriteE,
    input wire LoadNpcD,
    output reg LoadNpcE,
    input wire [4:0] AluContrlD,
    output reg [4:0] AluContrlE,
    input wire AluSrc1D,
    output reg AluSrc1E,
    input wire [1:0] AluSrc2D,
    output reg [1:0] AluSrc2E
    );
    //
    always@(posedge clk or posedge rst)
    begin
        if(rst)
            begin
            PCE<=32'b0; 
            BrPCE<=32'b0; 
            ImmE<=32'b0;
            RdE<=32'b0;
            Rs1E<=5'b0;
            Rs2E<=5'b0;
            RegOut1E<=32'b0;
            RegOut2E<=32'b0;
            JalrE<=1'b0;
            RegWriteE<=1'b0;
            MemToRegE<=1'b0;
            MemWriteE<=1'b0;
            LoadNpcE<=1'b0;
            AluContrlE<=5'b0;
            AluSrc1E<=1'b0; 
            AluSrc2E<=2'b0; 
            end
        else if(en)
            if(clear)
                begin
                PCE<=32'b0; 
                BrPCE<=32'b0; 
                ImmE<=32'b0;
                RdE<=32'b0;
                Rs1E<=5'b0;
                Rs2E<=5'b0;
                RegOut1E<=32'b0;
                RegOut2E<=32'b0;
                JalrE<=1'b0;
                RegWriteE<=1'b0;
                MemToRegE<=1'b0;
                MemWriteE<=1'b0;
                LoadNpcE<=1'b0;
                AluContrlE<=5'b0;
                AluSrc1E<=1'b0; 
                AluSrc2E<=2'b0;     
                end
            else
                begin
                PCE<=PCD; 
                BrPCE<=BrPCD; 
                ImmE<=ImmD;
                RdE<=RdD;
                Rs1E<=Rs1D;
                Rs2E<=Rs2D;
                RegOut1E<=RegOut1D;
                RegOut2E<=RegOut2D;
                JalrE<=JalrD;
                RegWriteE=RegWriteD;
                MemToRegE<=MemToRegD;
                MemWriteE<=MemWriteD;
                LoadNpcE<=LoadNpcD;
                AluContrlE<=AluContrlD;
                AluSrc1E<=AluSrc1D;
                AluSrc2E<=AluSrc2D;         
                end                
    end
    
endmodule
