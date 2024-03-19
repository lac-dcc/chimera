`timescale 1ns/1ps
module PC(input clk, input rst, input enable, input [3:0] jmploc, input jmp, output reg [3:0] count);
wire CLK;
assign CLK = (clk & enable);
initial begin
    count <= 4'b0000;
end
always @(posedge CLK)
begin
    if(rst)
    begin
        count <= 4'b0000;
    end
    else
    begin
        count <= count + 1;
    end
end

always @(posedge clk)
begin
    if(jmp)
    begin
        count <= jmploc;
    end
end
endmodule