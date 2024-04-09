//IFSegReg是取指段寄存器，存储着取指阶段访问的PC值
module IFSegReg(
    input wire clk,
    input wire rst,
    input wire en,
    input wire [31:0] PC_In,
    output reg [31:0] PC
    );
    
    always@(posedge clk or posedge rst)
    begin
        if(rst)
            PC<=32'b0;
        else 
        begin
            if(en)
                PC<=PC_In;
            else
                PC<=PC;        
        end
    end
    
endmodule