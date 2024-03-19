`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:49:33 06/02/2018 
// Design Name: 
// Module Name:    xiaodou 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module xiaodou(
    input clk_100MHz,
    input BTN,
    output reg BTN_Out
    );
    reg BTN1,BTN2;
    wire BTN_Down;
    reg [21:0] cnt;
    reg BTN_20ms_1,BTN_20ms_2;
    wire BTN_Up;
    
    always @(posedge clk_100MHz)
    begin
        BTN1 <= BTN;
        BTN2 <= BTN1;
    end
    assign BTN_Down = (~BTN2)&& BTN1 ; //从0到1的跳变
    
    always @(posedge clk_100MHz)
    begin
        if (BTN_Down) 
            begin
                cnt <= 22'b0;
                BTN_Out <= 1'b1;
            end
        else    cnt <= cnt+1'b1;
        if (cnt==22'h20000) BTN_20ms_1 <= BTN;
        BTN_20ms_2 <= BTN_20ms_1;
        if (BTN_Up) BTN_Out <= 1'b0;
    end
    
    assign BTN_Up = BTN_20ms_2 && (~BTN_20ms_1);//从1到0
    
endmodule

