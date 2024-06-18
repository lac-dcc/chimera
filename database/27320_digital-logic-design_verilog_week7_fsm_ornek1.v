// This program was cloned from: https://github.com/mbaykenar/digital-logic-design
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2022 12:00:54 AM
// Design Name: 
// Module Name: fsm_ornek1
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


module fsm_ornek1
(
input clk,
input rst_n,
input anahtar_i,
output kirmizi_o,
output yesil_o
);

localparam kat0 = 1'b0;
localparam kat1 = 1'b1;

reg kat;
reg kirmizi, yesil;

always @(posedge clk, negedge rst_n) begin
    if (rst_n == 1'b0) begin
        kat <= kat0;
    end
    else begin
        case (kat)
            kat0 : begin
                if (anahtar_i == 1'b0) begin
                    kat <= kat0;
                end
                else begin
                    kat <= kat1;
                end
            end 
            kat1 : begin
                if (anahtar_i == 1'b0) begin
                    kat <= kat0;
                end
                else begin
                    kat <= kat1;
                end                
            end
            default: begin
                kat <= kat0;
            end
        endcase
    end
end

always@(*) begin
    if (kat == kat0) begin
        kirmizi = 1'b1;
        yesil   = 1'b0;
    end
    else begin
        kirmizi = 1'b0;
        yesil   = 1'b1;        
    end
end

assign kirmizi_o = kirmizi; 
assign yesil_o = yesil; 

endmodule