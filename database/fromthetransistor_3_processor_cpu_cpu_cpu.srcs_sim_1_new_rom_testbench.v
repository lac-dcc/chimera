`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2020 05:39:29 PM
// Design Name: 
// Module Name: rom_testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rom_testbench;

reg clock = 0;
reg [19:0] memory_address;
wire [31:0] data;

always #5
begin
    clock <= ~clock;
end

rom uut(
     .i_clock(clock),
    .i_memory_address(memory_address),
    .o_data(data)
);

initial
begin
    memory_address = 20'b00000000000000000000;
    #20    
    if (data != 32'b00000000000000000000000000000011)
    begin
        $display("Test failed :(");
    end
    
    memory_address = 20'b00000000000000000001;
    #20
    if (data != 32'b00000000000000000000000000000010)
    begin
        $display("Test failed :(");
    end
    
    memory_address = 20'b00000000000000000010; 
    #20
    if (data != 32'b00000000000000000000000000000001)
    begin
        $display("Test failed :(");
    end
end
endmodule
