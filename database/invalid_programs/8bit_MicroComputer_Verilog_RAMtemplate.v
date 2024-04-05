`timescale 1ns/1ps
module RAM(input clk, input [3:0] address, input write_enable, input read_enable, inout [7:0] data);
reg [7:0] Memory[15:0];
reg [7:0] buffer;

initial begin
    Memory[0] <= 8'b{0};
    Memory[1] <= 8'b{1};
    Memory[2] <= 8'b{2};
    Memory[3] <= 8'b{3};
    Memory[4] <= 8'b{4};
    Memory[5] <= 8'b{5};
    Memory[6] <= 8'b{6};
    Memory[7] <= 8'b{7};
    Memory[8] <= 8'b{8};
    Memory[9] <= 8'b{9};
    Memory[10] <= 8'b{10};
    Memory[11] <= 8'b{11};
    Memory[12] <= 8'b{12};
    Memory[13] <= 8'b{13};
    Memory[14] <= 8'b{14};
    Memory[15] <= 8'b{15};
end


always @(posedge clk)
begin
    if(write_enable & ~read_enable)
    begin
        Memory[address] <= data;
    end
    else
    begin
        buffer <= Memory[address];
    end
end

assign data = (read_enable & ~write_enable) ? buffer : 8'bzzzzzzzz;

endmodule