// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rapid Silicon
// Engineer: M Usman Kiani
// 
// Create Date: 09/07/2022 03:03:52 PM
// Design Name: 
// Module Name: counterupn_1clk_dualedge_async_resetp
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


module counterupn_1clk_dualedge_async_resetp(clk, q_counter, rst_counter);
    
    parameter n = 12;
    input clk;
    input rst_counter;
    output [n-1:0] q_counter;
    reg [n-1:0] q_counter1,q_counter2;
 
    always @ (posedge clk or posedge rst_counter)
        begin
            if(rst_counter)
	    	    q_counter1 <= 0;
	        else
	    	    q_counter1 <= q_counter1 + 1;
        end
    
    always @ (negedge clk or posedge rst_counter)
        begin
            if(rst_counter)
                q_counter2 <= 0;
            else
                q_counter2 <= q_counter2 + 1;
        end

    assign q_counter = q_counter1 + q_counter2;
    
endmodule
