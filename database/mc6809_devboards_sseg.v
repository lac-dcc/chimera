`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:58:13 09/23/2016
// Design Name: 
// Module Name:    sseg 
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

module sseg(
            input           clk,
            input           reset,
            input [15:0]    data,
            output [7:0]    sseg,
            output [3:0]    an
            );

reg [15:0] delay=16'H0000;
reg [3:0] digit=4'H0;

reg [3:0] anode;
assign an = anode;

reg [7:0] ss;
assign sseg = ss;

always @(*)
begin
    case (delay[15:14])
        2'b00:
        begin
            anode = 4'b1110;
            digit = data[3:0];
        end
        2'b01:
        begin
            anode = 4'b1101;
            digit = data[7:4];
        end
        2'b10:
        begin
            anode = 4'b1011;
            digit = data[11:8];
        end        
        2'b11:
        begin
            anode = 4'b0111;
            digit = data[15:12];
        end        
    endcase
    
    case (digit)
        4'H0: 
            ss = 8'b11000000;
        4'H1:
            ss = 8'b11111001;
        4'H2:
            ss = 8'b10100100;
        4'H3: 
            ss = 8'b10110000;
        4'H4:
            ss = 8'b10011001;
        4'H5:
            ss = 8'b10010010;
        4'H6: 
            ss = 8'b10000010;
        4'H7:
            ss = 8'b11111000;
        4'H8:
            ss = 8'b10000000;
        4'H9: 
            ss = 8'b10010000;
        4'HA:
            ss = 8'b10001000;
        4'HB:
            ss = 8'b10000011;
        4'HC: 
            ss = 8'b11000110;
        4'HD:
            ss = 8'b10100001;
        4'HE:
            ss = 8'b10000110;
        4'HF: 
            ss = 8'b10001110;
    endcase
end

always @(posedge clk or posedge reset)
begin
    if (reset)
        delay <= 16'H0000;
    else
        delay <= delay + 1'b1;
end          




endmodule
