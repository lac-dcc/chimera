module seg7_lut(
   output reg [6:0] hex,
   input [3:0] value
   );

   always @(*)
   begin
      case (value)
         4'h1: hex = 7'b1111001;   // ---t----
         4'h2: hex = 7'b0100100;   // |      |
         4'h3: hex = 7'b0110000;   // lt    rt
         4'h4: hex = 7'b0011001;   // |      |
         4'h5: hex = 7'b0010010;   // ---m----
         4'h6: hex = 7'b0000010;   // |      |
         4'h7: hex = 7'b1111000;   // lb    rb
         4'h8: hex = 7'b0000000;   // |      |
         4'h9: hex = 7'b0011000;   // ---b----
         4'ha: hex = 7'b0001000;
         4'hb: hex = 7'b0000011;
         4'hc: hex = 7'b1000110;
         4'hd: hex = 7'b0100001;
         4'he: hex = 7'b0000110;
         4'hf: hex = 7'b0001110;
         4'h0: hex = 7'b1000000;
      endcase
   end

endmodule
