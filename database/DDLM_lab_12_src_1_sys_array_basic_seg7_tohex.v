module seg7_tohex
(
input [3:0] code,
output reg [7:0] hexadecimal
);

always @ (*)
begin
case (code)
4'b0000: hexadecimal <= 8'b11000000;//all inverted for outputs
4'b0001: hexadecimal <= 8'b11111001;//
4'b0010: hexadecimal <= 8'b10100100;//
4'b0011: hexadecimal <= 8'b10110000;//
4'b0100: hexadecimal <= 8'b10011001;//
4'b0101: hexadecimal <= 8'b10010010;//
4'b0110: hexadecimal <= 8'b10000010;//
4'b0111: hexadecimal <= 8'b11111000;//
4'b1000: hexadecimal <= 8'b10000000;//
4'b1001: hexadecimal <= 8'b10010000;//
4'b1010: hexadecimal <= 8'b10001000;//
4'b1011: hexadecimal <= 8'b10000011;//
4'b1100: hexadecimal <= 8'b11000110;//
4'b1101: hexadecimal <= 8'b10100001;//
4'b1110: hexadecimal <= 8'b10000110;//
4'b1111: hexadecimal <= 8'b10001110;//
default: hexadecimal <= 8'b11111111;//
endcase
end

endmodule