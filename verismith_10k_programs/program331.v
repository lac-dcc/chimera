module top
#(parameter param13 = (7'h41))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = {((^~({wire3, wire0} >>> (wire3 ^~ wire2))) ?
                         (8'ha9) : ((wire4[(1'h1):(1'h0)] & $unsigned(wire2)) ?
                             (~wire1[(4'h8):(3'h4)]) : (wire2 == wire0[(2'h2):(2'h2)])))};
  assign wire6 = wire2[(5'h12):(4'he)];
  assign wire7 = {$signed(wire2), wire5[(1'h0):(1'h0)]};
  assign wire8 = $signed($unsigned({((wire5 != wire2) ? (^wire7) : (~^(8'hbb))),
                     (|$signed(wire0))}));
  assign wire9 = ((~&wire7) & wire5[(1'h0):(1'h0)]);
  assign wire10 = $unsigned((wire5[(2'h3):(1'h1)] ?
                      $unsigned((8'ha1)) : ($signed((+wire4)) ?
                          $unsigned(wire8[(1'h0):(1'h0)]) : $unsigned((wire9 >> wire1)))));
  assign wire11 = wire6[(2'h3):(2'h3)];
  assign wire12 = (wire6 << $unsigned(wire2[(3'h6):(1'h1)]));
endmodule
