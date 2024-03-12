`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2015 10:38:33 AM
// Design Name: 
// Module Name: camera_configure_tb
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


module camera_configure_tb;

    // inputs

    reg clk;
    reg start;
    
    //outputs 
    
    wire done;
    wire sioc;
    wire siod;
    
    camera_configure dut1
        (
        .clk(clk),
        .start(start),
        .sioc(sioc),
        .siod(siod),
        .done(done)
        );
        
        always #5 clk = ~ clk;
        
        initial begin
        clk = 0;
        start = 0;
        #100;
        start = 1;
        #10;
        start = 0;
        @(posedge done) $finish;
        end
endmodule
