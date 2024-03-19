`timescale 1ns/1ps
module RAM(input clk, input [3:0] address, input write_enable, input read_enable, inout [7:0] data);
reg [7:0] Memory[15:0];
reg [7:0] buffer;

initial begin
    Memory[0] <= 8'b0001_1010;
    Memory[1] <= 8'b0010_1011;
    Memory[2] <= 8'b0100_0101;
    Memory[3] <= 8'b0011_1100;
    Memory[4] <= 8'b0010_1101;
    Memory[5] <= 8'b1110_0000;
    Memory[6] <= 8'b0001_1110;
    Memory[7] <= 8'b0010_1111;
    Memory[8] <= 8'b1110_0000;
    Memory[9] <= 8'b1111_0000;
    Memory[10] <= 8'b0000_0011;
    Memory[11] <= 8'b0000_0010;
    Memory[12] <= 8'b0000_0001;
    Memory[13] <= 8'b0000_0101;
    Memory[14] <= 8'b0000_1010;
    Memory[15] <= 8'b0000_1011;
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