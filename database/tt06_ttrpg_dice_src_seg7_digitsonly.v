// This program was cloned from: https://github.com/sanojn/tt06_ttrpg_dice
// License: Apache License 2.0

module seg7_digitsonly(
  input  [3:0] digit,
  output reg [6:0] display // Segments g through a, in that order
);

  always @(*) begin
    case (digit)
      4'd0 :   display = 7'b0111111;
      4'd1 :   display = 7'b0000110;
      4'd2 :   display = 7'b1011011;
      4'd3 :   display = 7'b1001111;
      4'd4 :   display = 7'b1100110;
      4'd5 :   display = 7'b1101101;
      4'd6 :   display = 7'b1111101;
      4'd7 :   display = 7'b0000111;
      4'd8 :   display = 7'b1111111;
      4'd9 :   display = 7'b1101111;
      default: display = 7'bxxxxxxx;
    endcase  
  end

endmodule
