module circl_s(
        input  wire [4:0] in_addr,
        output reg  [4:0] out_word
       );

always @*
 case( in_addr )
  5'h00: out_word = 5'h00;
  5'h01: out_word = 5'h05;
  5'h02: out_word = 5'h09;
  5'h03: out_word = 5'h0B;
  5'h04: out_word = 5'h0D;
  5'h05: out_word = 5'h0F;
  5'h06: out_word = 5'h10;
  5'h07: out_word = 5'h12;
  5'h08: out_word = 5'h13;
  5'h09: out_word = 5'h14;
  5'h0A: out_word = 5'h15;
  5'h0B: out_word = 5'h16;
  5'h0C: out_word = 5'h17;
  5'h0D: out_word = 5'h17;
  5'h0E: out_word = 5'h18;
  5'h0F: out_word = 5'h19;
  5'h10: out_word = 5'h19;
  5'h11: out_word = 5'h1A;
  5'h12: out_word = 5'h1A;
  5'h13: out_word = 5'h1B;
  5'h14: out_word = 5'h1B;
  5'h15: out_word = 5'h1C;
  5'h16: out_word = 5'h1C;
  5'h17: out_word = 5'h1C;
  5'h18: out_word = 5'h1C;
  5'h19: out_word = 5'h1D;
  5'h1A: out_word = 5'h1D;
  5'h1B: out_word = 5'h1D;
  5'h1C: out_word = 5'h1D;
  5'h1D: out_word = 5'h1D;
  5'h1E: out_word = 5'h1D;
  5'h1F: out_word = 5'h00;
 endcase

endmodule
