module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire [(3'h5):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire15;
  assign y = {wire20, wire19, wire18, wire17, wire4, wire15, (1'h0)};
  assign wire4 = wire0;
  module5 #() modinst16 (wire15, clk, wire2, wire1, wire3, wire0, wire4);
  assign wire17 = $signed((!({(wire3 ? wire3 : wire1),
                      wire15} - wire4[(4'hf):(1'h0)])));
  assign wire18 = $signed($signed((wire0 ?
                      (8'haf) : (wire1 >>> (wire4 != wire0)))));
  assign wire19 = wire4;
  assign wire20 = $unsigned({$unsigned($signed($unsigned(wire1)))});
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h1a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  input wire [(3'h4):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  assign y = {wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = wire6;
  assign wire12 = (~&wire6[(2'h3):(1'h1)]);
  assign wire13 = {{((~((7'h40) << wire8)) >= wire11[(1'h0):(1'h0)]),
                          {$unsigned($signed(wire11))}},
                      wire10[(3'h4):(1'h0)]};
  assign wire14 = {(~(!$signed($unsigned(wire6))))};
endmodule
