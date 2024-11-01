module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire4;
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  assign y = {wire10, wire9, wire4, reg8, reg7, reg6, reg5, (1'h0)};
  assign wire4 = $signed($unsigned({{(8'hb4)}}));
  always
    @(posedge clk) begin
      reg5 <= wire4[(3'h7):(1'h0)];
      reg6 <= (wire4[(2'h3):(1'h0)] ?
          (!($signed((-(8'hbe))) << wire2[(4'he):(2'h2)])) : wire2);
      reg7 <= wire2[(4'hd):(4'h8)];
      reg8 <= $signed(((({reg6} <= (8'hb5)) <<< (((7'h40) ? (8'hbb) : (8'hbf)) ?
              (wire4 ? wire4 : (8'hae)) : $unsigned(wire3))) ?
          $signed((!(!wire1))) : ((~|(reg6 <<< wire3)) ?
              wire1[(4'h8):(3'h7)] : $unsigned($signed(wire4)))));
    end
  assign wire9 = (reg5[(1'h0):(1'h0)] >>> wire1);
  assign wire10 = $unsigned(((wire1[(1'h1):(1'h1)] ~^ ({wire9} >= wire9[(5'h10):(1'h0)])) ~^ $signed(wire9[(4'h9):(3'h5)])));
endmodule
