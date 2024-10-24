module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = {({$signed(wire2[(3'h6):(1'h0)]),
                             ((wire1 ? (8'hb4) : wire1) == $unsigned(wire1))} ?
                         (wire0 ?
                             $unsigned(((7'h40) != wire3)) : $signed(wire2)) : (^~$signed({wire3})))};
  assign wire5 = $signed((+$unsigned(wire1[(4'h8):(4'h8)])));
  assign wire6 = ({wire4[(4'hb):(3'h5)],
                     $unsigned({$unsigned(wire2),
                         wire1[(4'h8):(2'h3)]})} + $signed($signed(wire3)));
  assign wire7 = (8'h9c);
  assign wire8 = $signed($unsigned(wire0[(1'h0):(1'h0)]));
endmodule
