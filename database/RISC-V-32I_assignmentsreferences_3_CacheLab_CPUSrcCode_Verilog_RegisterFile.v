//RegisterFile为CPU的寄存器组32*32bit
module RegisterFile(
    input wire clk,
    input wire rst,
    input wire [2:0] WE3,
    input wire [4:0] A1,
    input wire [4:0] A2,
    input wire [4:0] A3,
    input wire [31:0] WD3,
    output wire [31:0] RD1,
    output wire [31:0] RD2
    );

    //定义32*32bit的寄存器
    reg [31:0] RegFile[31:1];
    //
    integer i;
    //rst低位复位
    always@(negedge clk or posedge rst)
    begin 
        if(rst)
            begin
                for(i=1;i<32;i=i+1)
                    RegFile[i][31:0]<=32'b0;
                    //RegFile[i][31:0]<=i;                                   
            end
        else if(A3!=5'b0)
            begin
                if(WE3 != 0)
                    begin
                        RegFile[A3]<=WD3;
                    end
            end        
    end
    //    
    assign RD1= (A1==5'b0)?32'b0:RegFile[A1];
    assign RD2= (A2==5'b0)?32'b0:RegFile[A2];
    
endmodule
