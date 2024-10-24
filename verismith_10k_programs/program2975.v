module top
#(parameter param27 = {({(-(!(8'ha8)))} < (|((~|(8'hb2)) ? {(8'h9d), (8'hb2)} : (-(8'hb1))))), (8'hac)}, 
parameter param28 = param27)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire23;
  assign y = {wire26, wire25, wire5, wire6, wire7, wire8, wire23, (1'h0)};
  assign wire5 = (wire1 >>> wire0);
  assign wire6 = $signed($unsigned(($signed($unsigned(wire3)) << $unsigned((wire4 && wire5)))));
  assign wire7 = ($signed($unsigned(($unsigned(wire2) ?
                         wire6 : (wire6 ? wire0 : wire3)))) ?
                     $unsigned(((((8'haa) ? wire6 : wire5) <<< (wire2 ?
                             (8'ha7) : wire3)) ?
                         wire4 : (^{wire4,
                             wire3}))) : (wire2[(3'h4):(2'h2)] ^ wire4[(2'h3):(2'h3)]));
  assign wire8 = (^wire2[(1'h1):(1'h1)]);
  module9 #() modinst24 (wire23, clk, wire0, wire7, wire1, wire4, wire3);
  assign wire25 = $signed(wire3);
  assign wire26 = wire7;
endmodule

module module9  (y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire14;
  input wire [(4'hd):(1'h0)] wire13;
  input wire [(5'h10):(1'h0)] wire12;
  input wire signed [(3'h4):(1'h0)] wire11;
  input wire signed [(3'h7):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire15;
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 (1'h0)};
  assign wire15 = wire10;
  assign wire16 = $signed($signed(wire12[(3'h6):(2'h3)]));
  assign wire17 = $unsigned(((~&$unsigned((!wire10))) << $unsigned((8'had))));
  assign wire18 = $signed((|wire17));
  assign wire19 = wire18[(5'h14):(5'h14)];
  assign wire20 = wire11[(2'h3):(1'h0)];
  assign wire21 = wire11[(2'h2):(1'h0)];
  assign wire22 = (~^$signed($signed((wire14 ?
                      wire15[(1'h0):(1'h0)] : {(8'hab)}))));
endmodule
