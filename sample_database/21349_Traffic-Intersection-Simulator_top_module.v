// This program was cloned from: https://github.com/thefranciscoflores/Traffic-Intersection-Simulator
// License: GNU General Public License v2.0

`timescale 1ns / 1ps

module top_module(

    input CLK100MHZ, reset,
    input NSPED_bttn, EWPED_bttn,
    input NSLT_sw, EWLT_sw,
    
    output NSLT_LED, EWLT_LED,
    output [7:0] AN,
    output [6:0] SEG,
    output audioOut,
    output wire aud_sd,
    output NSPED_request, EWPED_request,
    output NS_RED, NS_YELLOW, NS_GREEN,
    output EW_RED, EW_YELLOW, EW_GREEN
);


    wire [2:0] NS_LED, EW_LED;
    wire [3:0] NScount, EWcount;
    reg [3:0] temp = 4'hF;
    
    wire playSound;
    

    trafficStateMachine FSM(
        .CLK100MHZ(CLK100MHZ), 
        .reset(reset), 
        .NSLT_sw(NSLT_sw), 
        .EWLT_sw(EWLT_sw), 
        .NSPED_bttn(NSPED_bttn), 
        .EWPED_bttn(EWPED_bttn), 
        .NScount(NScount), 
        .EWcount(EWcount), 
        .NS_LED(NS_LED), 
        .EW_LED(EW_LED), 
        .NSLT_LED(NSLT_LED), 
        .EWLT_LED(EWLT_LED), 
        .playSound(playSound),
        .NSPED_request(NSPED_request), 
        .EWPED_request(EWPED_request)
        );
        
    SongPlayer alarmPlayer(
        .clock(CLK100MHZ), 
        .reset(reset), 
        .playSound(playSound),
        .audioOut(audioOut), 
        .aud_sd(aud_sd)
         );
    
    
    seg7_control DISPLAY(
         .clk(CLK100MHZ),
         .reset(reset),
         .digit1(NScount), 
         .digit2(temp), 
         .digit3(temp), 
         .digit4(temp), 
         .digit5(EWcount),
         .digit6(temp),
         .digit7(temp),
         .digit8(temp),
         .seg(SEG), 
         .digit(AN) 
            );
    
    assign NS_RED = NS_LED[2];
    assign NS_YELLOW = NS_LED[1];
    assign NS_GREEN = NS_LED[0];
    
    assign EW_RED = EW_LED[2];
    assign EW_YELLOW = EW_LED[1];
    assign EW_GREEN = EW_LED[0];
 
endmodule
