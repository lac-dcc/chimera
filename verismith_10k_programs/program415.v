module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h21):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned($unsigned(wire2));
  assign wire5 = (((-$unsigned((wire4 <<< wire1))) & (&$unsigned(wire4))) | ($signed(({wire4,
                         (8'hb5)} && wire3[(2'h3):(2'h3)])) ?
                     wire0[(3'h6):(2'h2)] : (({wire2, (8'hba)} ?
                         $unsigned(wire4) : $signed((7'h44))) | (^~{(8'hb0)}))));
  assign wire6 = (|$signed($signed(($signed(wire2) ?
                     (wire5 ? wire0 : (8'hb0)) : (^~wire5)))));
  assign wire7 = ((($unsigned($unsigned(wire2)) || ((^wire4) <= $signed(wire2))) - (8'ha1)) != (&(|{(wire0 ?
                         (8'hb8) : wire2)})));
endmodule
