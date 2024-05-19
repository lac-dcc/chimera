// This program was cloned from: https://github.com/mbaykenar/digital-logic-design
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2022 04:37:29 PM
// Design Name: 
// Module Name: pipeline
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


module pipeline
(
input clk,
input rst_n,
input [7:0] a_i,
input [7:0] b_i,
input [7:0] c_i,
input [7:0] d_i,
input [7:0] ctrl1_i,
input [7:0] ctrl2_i,
output [9:0] e_o,
output [9:0] f_o
);

reg [9:0] e,f;
reg [7:0] a,b,c,d;
reg [7:0] ctrl1,ctrl2;
reg [8:0] ctrl_result;
reg gr,sm;

always @(*) begin

    if (ctrl1 > ctrl2)
        ctrl_result = ctrl1 - ctrl2;
    else
        ctrl_result = ctrl1 | ctrl2;
    
    gr = 0;
    sm = 0;
    if (ctrl_result > 9'd355) begin
        gr = 1;
    end
    else if (ctrl_result < 9'd355) begin
        sm = 1;
    end

end

always @(posedge clk, negedge rst_n) begin
    if (rst_n == 1'b0) begin
        a       <= {8{1'b0}};
        b       <= {8{1'b0}};
        c       <= {8{1'b0}};
        d       <= {8{1'b0}};
        ctrl1   <= {8{1'b0}};
        ctrl2   <= {8{1'b0}};
        e       <= {10{1'b0}};
        f       <= {10{1'b0}};        
    end
    else begin
        a       <= a_i;
        b       <= b_i;
        c       <= c_i;
        d       <= d_i;
        ctrl1   <= ctrl1_i;
        ctrl2   <= ctrl2_i;
        if (gr) begin
            e   <= (a + b) + (c + d);
            f   <= (a + b) - (c + d);
        end
        else if (sm) begin
            e   <= (a - b) + (c - d);
            f   <= (-a + b) + (-c + d);
        end
        else begin
            e   <= {2'b00, (a ^ b) | (c ^ d)};
            f   <= {2'b11, (a & b) ^ (c & d)};
        end
    end
    
end

assign e_o = e;
assign f_o = f;

endmodule