module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire10;
  wire [(4'hf):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = wire0[(3'h7):(1'h0)];
  assign wire5 = (!wire1[(4'hd):(1'h1)]);
  assign wire6 = wire2;
  assign wire7 = {((8'h9c) ?
                         ($signed((^wire0)) ?
                             $unsigned(wire6) : wire4[(3'h7):(1'h0)]) : (~&$signed($signed(wire6))))};
  assign wire8 = (($unsigned(((~^wire4) ?
                         ((8'hb2) >>> (7'h41)) : (~|wire1))) >>> wire1) ?
                     $unsigned($signed(wire2)) : (~&{$unsigned(wire3)}));
  assign wire9 = $unsigned($unsigned((8'hb3)));
  assign wire10 = (^({$unsigned((wire5 ? (8'hba) : (8'ha0)))} ?
                      wire9 : $unsigned($signed(wire0[(4'hd):(4'hb)]))));
  assign wire11 = $signed($unsigned(wire9[(2'h2):(1'h1)]));
  assign wire12 = (|wire11);
  assign wire13 = (wire9 ?
                      $signed(($signed((8'h9e)) ~^ $unsigned({wire5}))) : wire0[(4'ha):(3'h6)]);
  assign wire14 = {wire11, wire5[(5'h15):(1'h1)]};
  assign wire15 = (~^{wire4});
  assign wire16 = (((($unsigned(wire10) ? wire4[(5'h12):(1'h1)] : wire0) ?
                              (8'haf) : {$unsigned(wire13), {wire15}}) ?
                          ((|wire5) << (+wire0[(4'hc):(4'ha)])) : $signed((|(|wire2)))) ?
                      (8'hba) : wire15);
  assign wire17 = ($signed(wire16) > $unsigned((~&($signed(wire0) >>> (~wire5)))));
  assign wire18 = ($unsigned($signed(wire1)) ?
                      wire12[(3'h4):(3'h4)] : wire11[(4'he):(3'h7)]);
  assign wire19 = wire6[(1'h1):(1'h0)];
endmodule
