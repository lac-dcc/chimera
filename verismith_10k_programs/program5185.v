module top
#(parameter param12 = {(~^((~|((8'ha6) + (8'hb1))) ? {(~^(8'hb5))} : (8'hbd)))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (~wire2[(2'h3):(1'h0)]);
  assign wire6 = $unsigned($unsigned($signed(wire1)));
  assign wire7 = (~wire0);
  assign wire8 = {$signed((~^(wire3 ?
                         (wire0 >>> (8'hae)) : wire3[(1'h0):(1'h0)]))),
                     $unsigned(wire1[(3'h6):(2'h2)])};
  assign wire9 = wire4[(3'h7):(3'h7)];
  assign wire10 = ({wire7} ?
                      ((-wire7) < (|wire9[(5'h12):(5'h11)])) : (wire2 ?
                          (^~wire5[(3'h6):(1'h0)]) : (~|$unsigned((^~wire0)))));
  assign wire11 = wire8[(3'h6):(2'h2)];
endmodule
