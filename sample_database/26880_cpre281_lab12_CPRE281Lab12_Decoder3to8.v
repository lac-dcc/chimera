// This program was cloned from: https://github.com/regales/cpre281
// License: Apache License 2.0

module Decoder3to8(EN, W2, W1, W0, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7);
input EN, W2, W1, W0;
output Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;

reg Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;
always@(EN or W2 or W1 or W0)

begin
if(EN)
case({W2, W1, W0})
3'b000 : {Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} = 8'b00000001;
3'b001 : {Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} = 8'b00000010;
3'b010 : {Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} = 8'b00000100;
3'b011 : {Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} = 8'b00001000;
3'b100 : {Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} = 8'b00010000;
3'b101 : {Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} = 8'b00100000;
3'b110 : {Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} = 8'b01000000;
3'b111 : {Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} = 8'b10000000;

default : {Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} = 8'b00000000;

endcase
end
endmodule


