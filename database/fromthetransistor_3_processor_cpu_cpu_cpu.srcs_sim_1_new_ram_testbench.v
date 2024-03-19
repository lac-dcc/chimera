`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2020 11:00:56 AM
// Design Name: 
// Module Name: ram_testbench
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


module ram_testbench;

reg clock = 0;
reg [19:0] memory_address = 0;
reg should_write = 0;
reg [31:0] i_data;
wire [31:0] o_data;

always #5
begin
    clock <= ~clock;
end

ram uut(
     .i_clock(clock),
    .i_memory_address(memory_address),
    .i_should_write(should_write),
    .i_data(i_data),
    .o_data(o_data)
);

initial
begin
    // Initially empty
    memory_address = 20'b00000000000000000000;
    #20    
    if (o_data != 32'b00000000000000000000000000000000)
    begin
        $display("Test failed :(");
    end
    
    // cannot write if i_should_write = 0
    i_data = 32'b00000000000000000000000000000010;
    #20
    if (o_data != 32'b00000000000000000000000000000000)
    begin
        $display("Test failed :(");
    end
    
    // can write if i_should_write = 1
    should_write = 1;
    #20
    if (o_data != 32'b00000000000000000000000000000010)
    begin
        $display("Test failed :(");
    end
    
    // can write to different another addresses
    memory_address = 20'b00000000000000000001;
    #20    
    if (o_data != 32'b00000000000000000000000000000010)
    begin
        $display("Test failed :(");
    end
    
    memory_address = 20'b00000000000000000010;
    #20    
    if (o_data != 32'b00000000000000000000000000000010)
    begin
        $display("Test failed :(");
    end
    
    memory_address = 20'b00000000000000000011;
    #20    
    if (o_data != 32'b00000000000000000000000000000010)
    begin
        $display("Test failed :(");
    end
    
end
endmodule
