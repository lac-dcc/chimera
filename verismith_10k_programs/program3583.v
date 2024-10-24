module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = wire0[(4'hf):(4'hf)];
  assign wire6 = (^(~&{$unsigned(wire1)}));
  assign wire7 = ((|$signed((^~(wire0 != wire3)))) ?
                     (($unsigned((wire6 <<< wire1)) ?
                         wire5[(2'h2):(2'h2)] : (wire1[(3'h6):(2'h2)] ?
                             $unsigned(wire3) : {wire3})) > $unsigned(wire4[(3'h4):(1'h0)])) : $signed(wire4));
  assign wire8 = $signed($unsigned((+wire7[(2'h2):(1'h1)])));
  assign wire9 = $unsigned((|(~|(8'haf))));
  assign wire10 = (8'h9e);
  assign wire11 = (~wire6);
  assign wire12 = $unsigned((~($signed((wire7 * (8'h9e))) | wire11[(3'h5):(3'h5)])));
endmodule
