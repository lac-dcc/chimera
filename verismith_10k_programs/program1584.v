module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire1[(3'h7):(3'h6)];
  assign wire6 = {(7'h43)};
  assign wire7 = (-(wire4[(2'h2):(2'h2)] || wire4[(3'h5):(3'h4)]));
  assign wire8 = $signed(((-($unsigned(wire4) ?
                         ((8'h9e) ? wire1 : wire4) : wire4)) ?
                     wire6 : wire5));
endmodule
