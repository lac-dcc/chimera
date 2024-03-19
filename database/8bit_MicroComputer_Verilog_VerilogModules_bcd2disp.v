`timescale 1ns / 1ps
module bcd2sevenseg(
    input [3:0] bcd,
    output reg [6:0] seg
    );
always @(bcd)
begin
    case (bcd)
        0 : seg <= 7'b1111110;
        1 : seg <= 7'b0110000;
        2 : seg <= 7'b1101101;
        3 : seg <= 7'b1111001;
        4 : seg <= 7'b0110011;
        5 : seg <= 7'b1011011;
        6 : seg <= 7'b1011111;
        7 : seg <= 7'b1110000;
        8 : seg <= 7'b1111111;
        9 : seg <= 7'b1111011;
        10 : seg <= 7'b1110111;
        11 : seg <= 7'b0011111;
        12 : seg <= 7'b1001110;
        13 : seg <= 7'b0111101;
        14 : seg <= 7'b1001111;
        15 : seg <= 7'b1000111;
        default : seg <= 7'b0000000; 
    endcase
end  
endmodule