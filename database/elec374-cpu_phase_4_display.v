// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

module Seven_Seg_Display_Out (
 output reg [7:0] outputt,
 input clk,
 input [3:0] data
 );
always @(negedge clk)
 begin
 case (data[3:0])
4'b0000 : outputt <= 8'b11000000;
4'b0001 : outputt <= 8'b11111001;
4'b0010 : outputt <= 8'b10100100;
4'b0011 : outputt <= 8'b10110000;
4'b0100 : outputt <= 8'b10011001;
4'b0101 : outputt <= 8'b10010010;
4'b0110 : outputt <= 8'b10000010;
4'b0111 : outputt <= 8'b11111000;
4'b1000 : outputt <= 8'b10000000;
4'b1001 : outputt <= 8'b10010000;
4'b1010 : outputt <= 8'b10001000;
4'b1011 : outputt <= 8'b10000011;
4'b1100 : outputt <= 8'b11000110;
4'b1101 : outputt <= 8'b10100001;
4'b1110 : outputt <= 8'b10000110;
4'b1111 : outputt <= 8'b10001110;
 endcase
 end
endmodule 