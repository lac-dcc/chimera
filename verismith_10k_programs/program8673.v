module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ((!(+wire0[(1'h1):(1'h0)])) | (wire0[(3'h5):(2'h3)] ?
                     $signed((((8'haf) | wire0) && wire2[(3'h4):(2'h3)])) : $unsigned((~^(-(8'hb8))))));
  assign wire5 = $unsigned(($unsigned(((~wire0) ?
                     {wire3} : wire4[(2'h2):(2'h2)])) <<< $signed(({wire2,
                     (7'h41)} && wire2[(4'h8):(3'h4)]))));
  assign wire6 = wire0[(3'h6):(3'h5)];
  assign wire7 = $unsigned($unsigned($signed(($signed(wire1) ?
                     $unsigned((8'hb8)) : (^~wire4)))));
  assign wire8 = $unsigned(($unsigned({wire5, (wire2 < wire5)}) ?
                     wire0 : wire1[(5'h15):(4'ha)]));
endmodule
