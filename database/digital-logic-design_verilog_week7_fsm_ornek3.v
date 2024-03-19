`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2022 01:58:36 PM
// Design Name: 
// Module Name: fsm_ornek3
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


module fsm_ornek3
(
input clk,
input rst_n,
input signal_i,
output detect_o
);

localparam tetik_bekle  = 2'b00;
localparam tetik_alindi = 2'b01;
localparam bekle        = 2'b10;

reg [1:0] state;
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
                state <= bekle;             
            end
            bekle : begin
                if (signal_i == 1'b0) begin
                    state <= tetik_bekle;
                end
                else begin
                    state <= bekle;
                end
            end             
            default: begin
                state <= tetik_bekle;
            end
        endcase
    end
end

always@(*) begin
    case (state)
        tetik_bekle : begin
            detect = 1'b0;
        end 
        tetik_alindi : begin
            detect = 1'b1;             
        end
        bekle : begin
            detect = 1'b0;
        end             
        default: begin
            detect = 1'b0;
        end
    endcase
end

assign detect_o = detect;

endmodule