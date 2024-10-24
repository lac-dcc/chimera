module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire3[(4'hf):(4'h8)];
  assign wire5 = (^(wire3 ?
                     (($signed(wire4) >> wire0[(3'h4):(2'h3)]) && ($signed((8'hbf)) && wire4[(3'h7):(2'h2)])) : wire3[(4'h8):(3'h6)]));
  assign wire6 = {$signed({$unsigned($signed(wire2)), wire3})};
  assign wire7 = (wire1 ?
                     wire0 : ($signed((~^(~wire6))) ?
                         wire6 : {(~&wire6[(3'h5):(1'h1)])}));
endmodule
