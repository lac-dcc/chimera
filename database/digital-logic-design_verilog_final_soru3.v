`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2022 11:13:07 PM
// Design Name: 
// Module Name: soru3
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


module soru3 #(parameter c_clkfreq = 100000000) 
(
input clk, 
input rst, 
input signal_i,
output reg signal_o
);

localparam S_ZERO       = 2'b00;
localparam S_ZERO2ONE   = 2'b01;
localparam S_ONE2ZERO   = 2'b10;
localparam S_ONE        = 2'b11;

reg [1:0] state;

reg [$clog2(c_clkfreq/1000)-1:0] timer1ms;
reg timertick1ms;
reg timeren;

always@(posedge clk) begin
    if (rst) begin
        timertick1ms    <= 0;
        timer1ms        <= 0;
    end
    else begin
        if (timeren == 1'b1) begin
            if (timer1ms == (c_clkfreq/1000)-1) begin
                timer1ms        <= 0;
                timertick1ms    <= 1; 
            end
            else begin
                timer1ms        <= timer1ms + 1;
                timertick1ms    <= 0;
            end            
        end
        else begin
            timer1ms        <= 0;
            timertick1ms    <= 0;
        end
    end
end

always@(posedge clk) begin
    if (rst) begin
        state       <= S_ZERO;
        timeren     <= 0;
        signal_o    <= 1'b0;
    end
    else begin

        case (state)
        S_ZERO  : begin
            signal_o    <= 1'b0;
            timeren     <= 0;
            if (signal_i == 1'b1) begin
                state   <= S_ZERO2ONE;
                timeren <= 1;
            end          
        end
        S_ZERO2ONE  : begin
            signal_o    <= 1'b0; 
            if (signal_i == 1'b0) begin
                state   <= S_ZERO;
                timeren <= 0;
            end
            if (timertick1ms) begin
                state   <= S_ONE;
                timeren <= 0;
            end                    
        end
        S_ONE2ZERO  : begin
            signal_o    <= 1'b1; 
            if (signal_i == 1'b1) begin
                state   <= S_ONE;
                timeren <= 0;
            end
            if (timertick1ms) begin
                state   <= S_ZERO;
                timeren <= 0;
            end 
        end
        S_ONE  : begin
            signal_o    <= 1'b1;
            timeren     <= 0;
            if (signal_i == 1'b0) begin
                state   <= S_ONE2ZERO;
                timeren <= 1;
            end                       
        end
        default: begin
                    
                 end
        endcase     

    end
end
    
endmodule