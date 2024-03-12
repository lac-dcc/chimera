`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 23:55:36
// Design Name: 
// Module Name: Button_Debounce
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


module Button_Debounce(
    input clk,
    input btn_in,
    output btn_out
    );
    
    reg [2:0] btn=0;
    wire clk_20ms;
    
    ClockDivisor #(1000000) t_20ms(clk,clk_20ms);
    
    always @(posedge clk_20ms) begin
        btn[0]<=btn_in;
        btn[1]<=btn[0];
        btn[2]<=btn[1];
    end
    assign btn_out=(btn[2]&btn[1]&btn[0])|(~btn[2]&btn[1]&btn[0]);
endmodule


module ClockDivisor(
    input clkin,
    output reg clkout=0
    );
    parameter n=50000000;
    reg [31:0] count=1;
    always @ (posedge clkin)
    begin
        if(count<n)
            count<=count+1;
        else
        begin
            count<=1;
            clkout<=~clkout;
        end
    end
endmodule
