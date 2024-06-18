// This program was cloned from: https://github.com/mbaykenar/digital-logic-design
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2022 03:59:37 PM
// Design Name: 
// Module Name: fsm_ornek4
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


module fsm_ornek4
(
input clk,
input rst_n,
input ta_i,
input tb_i,
output [1:0] la_o,
output [1:0] lb_o
);

localparam S0  = 2'b00;
localparam S1  = 2'b01;
localparam S2  = 2'b10;
localparam S3  = 2'b11;

localparam green    = 2'b00;
localparam yellow   = 2'b01;
localparam red      = 2'b10;

reg [1:0] la,lb;
reg [1:0] state;

always @(posedge clk, negedge rst_n) begin
    if (rst_n == 1'b0) begin
        state <= S0;
    end
    else begin
        case (state)
            S0 : begin
                if (ta_i == 1'b1) begin
                    state <= S0;
                end
                else begin
                    state <= S1;
                end
            end 
            S1 : begin
                state <= S2;             
            end
            S2 : begin
                if (tb_i == 1'b0) begin
                    state <= S3;
                end
                else begin
                    state <= S2;
                end
            end
            S3 : begin
                state <= S0; 
            end                         
            default: begin
                state <= S0;
            end
        endcase
    end
end

always@(*) begin
    case (state)
        S0 : begin
            la = green;
            lb = red;
        end 
        S1 : begin
            la = yellow;
            lb = red;
        end
        S2 : begin
            la = red;
            lb = green;
        end
        S3 : begin
            la = red;
            lb = yellow;
        end             
        default: begin
            la = green;
            lb = red;
        end
    endcase
end

assign la_o = la;
assign lb_o = lb;

endmodule