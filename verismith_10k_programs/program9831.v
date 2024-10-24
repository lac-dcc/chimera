module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h24):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed(wire2);
  assign wire6 = ((8'hb9) ?
                     ((~^(!$unsigned(wire1))) ?
                         $unsigned(wire4) : (|{$signed(wire4)})) : (8'had));
  assign wire7 = $unsigned(wire4);
  assign wire8 = {(((^(!wire7)) ? $unsigned((wire0 ^ (8'ha5))) : wire0) ?
                         {($signed(wire4) ^ $signed(wire0))} : wire4),
                     {$unsigned($unsigned(((8'ha4) ? wire0 : wire3))),
                         wire1[(1'h1):(1'h1)]}};
endmodule
