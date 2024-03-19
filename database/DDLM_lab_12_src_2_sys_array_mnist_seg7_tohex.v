module seg7_tohex
(
input [9:0] code,
output reg [7:0] hexadecimal
);

always @ (*)
begin
case (code)
10'b0000000001: hexadecimal <= 8'b11000000;//all inverted for outputs; 0
10'b0000000010: hexadecimal <= 8'b11111001;// 1
10'b0000000100: hexadecimal <= 8'b10100100;// 2
10'b0000001000: hexadecimal <= 8'b10110000;// 3
10'b0000010000: hexadecimal <= 8'b10011001;// 4
10'b0000100000: hexadecimal <= 8'b10010010;// 5
10'b0001000000: hexadecimal <= 8'b10000010;// 6
10'b0010000000: hexadecimal <= 8'b11111000;// 7
10'b0100000000: hexadecimal <= 8'b10000000;// 8
10'b1000000000: hexadecimal <= 8'b10010000;// 9
default: hexadecimal <= 8'b11111111;// disabled
endcase
end

endmodule