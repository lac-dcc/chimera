// This program was cloned from: https://github.com/Helazhary/Riscv-Verilog-Pipelined
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2024 03:16:12 PM
// Design Name: 
// Module Name: datapath_tb
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


module datapath_tb( );

    reg clk, rst;
 reg [1:0] led_sel; reg[3:0]SSD_sel;
  wire[15:0] LED;
   wire[12:0] ssd;


    DataPath DP( .clk(clk), .rst(rst), .led_sel(led_sel), .SSD_sel(SSD_sel), .LED(LED),  .ssd(ssd));
    //RiscVPipeline PDb( .clk(clk), .rst(rst), .led_sel(led_sel), .SSD_sel(SSD_sel), .LED(LED),  .ssd(ssd)); 

    initial begin

        clk =0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        #10
        rst = 0;
        #10000




        $finish;
    end

endmodule
