module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = (wire1 > $unsigned({$unsigned($signed(wire3)),
                     wire3[(4'hc):(4'h9)]}));
  assign wire6 = {((~|($unsigned(wire1) <<< {wire3, wire4})) ?
                         (8'hb7) : (!(^~{wire1, wire1})))};
  assign wire7 = wire3[(3'h4):(1'h0)];
  assign wire8 = ($signed(({(^wire2), wire4} - wire2)) ?
                     (8'hb0) : $signed((wire2 ?
                         $signed(wire5) : $signed((^~wire6)))));
  assign wire9 = wire5[(4'hc):(1'h0)];
  assign wire10 = $signed((^($unsigned((wire2 == wire1)) ?
                      $unsigned({wire1, wire6}) : wire2)));
  assign wire11 = wire0[(1'h0):(1'h0)];
  assign wire12 = (-wire1[(3'h5):(3'h4)]);
endmodule
