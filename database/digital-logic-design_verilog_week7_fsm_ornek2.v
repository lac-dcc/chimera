// This program was cloned from: https://github.com/mbaykenar/digital-logic-design
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2022 12:33:07 AM
// Design Name: 
// Module Name: fsm_ornek2
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


module fsm_ornek2
(
input clk,
input rst_n,
input signal_i,
output detect_o
);

localparam tetik_bekle  = 1'b0;
localparam tetik_alindi = 1'b1;

reg state;
reg detect;

always @(posedge clk, negedge rst_n) begin
    if (rst_n == 1'b0) begin
        state <= tetik_bekle;
    end
    else begin
        case (state)
            tetik_bekle : begin
                if (signal_i == 1'b0) begin
                    state <= tetik_bekle;
                end
                else begin
                    state <= tetik_alindi;
                end
            end 
            tetik_alindi : begin
                if (signal_i == 1'b0) begin
                    state <= tetik_bekle;
                end
                else begin
                    state <= tetik_alindi;
                end                
            end
            default: begin
                state <= tetik_bekle;
            end
        endcase
    end
end

always@(*) begin
    if (state == tetik_bekle) begin
        if (signal_i == 1'b0) begin
            detect = 1'b0;
        end
        else begin
            detect = 1'b1;
        end
    end
    else begin
        detect = 1'b0;
    end
end

assign detect_o = detect;

endmodule