`timescale 1ns / 1ps

module ShiftReg2(
    input [21:0] x,
    input clk,
    output reg [22:0] o1,o2,o3,o4
    );
    
    reg [21:0] Register [0:10];
    integer i;
    
    always@(posedge clk)
    begin
    Register[10] <= x;
    for(i=0; i < 10; i = i + 1)
    begin
        Register[i] <= Register[i+1];
    end
    
    o1 <= {1'b0, Register[0]};
    o2 <= {1'b0, Register[1]};
    
    o3 <= {1'b0, Register[9]};
    o4 <= {1'b0, Register[10]};
     
    end
    
endmodule