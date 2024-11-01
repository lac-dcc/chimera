module top
#(parameter param25 = {(~(^~(((8'hb1) ? (8'h9e) : (8'hb8)) >> {(8'h9f)}))), (!((((8'ha0) ? (8'ha0) : (8'h9c)) | ((8'hb8) ? (8'hae) : (8'hba))) > (~{(8'had)})))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  assign y = {wire23,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = ((-($unsigned((8'ha0)) ^ (!{(8'ha0)}))) ?
                     ((8'h9d) != wire2[(2'h3):(1'h0)]) : (wire3[(3'h7):(2'h3)] ?
                         {((wire2 ? wire0 : (8'hb4)) << ((8'hba) < wire4)),
                             (^~(wire1 ?
                                 wire2 : wire0))} : ({(wire0 || (8'hb5)),
                                 (!wire2)} ?
                             (-wire3) : wire2)));
  assign wire6 = wire3;
  assign wire7 = $signed(wire6);
  assign wire8 = wire5[(1'h0):(1'h0)];
  assign wire9 = (wire2 ?
                     {(({wire7, (8'hb4)} ?
                             ((8'ha7) ? wire0 : wire8) : (wire5 ?
                                 wire2 : (8'h9c))) + $unsigned(wire8)),
                         $signed((8'hbd))} : $unsigned(wire1));
  assign wire10 = (|$unsigned(wire2[(2'h2):(2'h2)]));
  assign wire11 = wire5;
  assign wire12 = {(~^(($unsigned(wire10) | {wire11}) ?
                          (wire7[(1'h0):(1'h0)] ?
                              {wire2} : $unsigned(wire5)) : $signed((8'haf)))),
                      $unsigned((8'hb4))};
  assign wire13 = wire12[(5'h13):(2'h3)];
  module14 #() modinst24 (wire23, clk, wire2, wire13, wire11, wire1);
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h20):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire18;
  input wire [(4'hd):(1'h0)] wire17;
  input wire signed [(3'h4):(1'h0)] wire16;
  input wire [(2'h3):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire19;
  assign y = {wire22, wire21, wire20, wire19, (1'h0)};
  assign wire19 = ($unsigned((wire16[(3'h4):(2'h2)] || wire16)) ^ wire15[(2'h3):(2'h3)]);
  assign wire20 = $signed((8'ha1));
  assign wire21 = $unsigned(wire18[(3'h4):(1'h1)]);
  assign wire22 = $unsigned(wire16[(3'h4):(2'h2)]);
endmodule
