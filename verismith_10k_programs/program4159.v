module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  assign y = {wire31, wire30, wire28, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $unsigned(wire1[(1'h1):(1'h0)]);
  assign wire6 = {$signed($signed({(wire1 * wire0), wire4[(5'h11):(2'h2)]})),
                     ($unsigned(wire2) ? (~wire4) : (~^{wire4}))};
  assign wire7 = (wire1[(3'h7):(3'h5)] || ((wire5[(3'h6):(2'h3)] * $unsigned(wire4)) <<< (8'hb8)));
  module8 #() modinst29 (wire28, clk, wire7, wire3, wire6, wire2);
  assign wire30 = wire2;
  assign wire31 = {{(&(^$signed(wire6)))}};
endmodule

module module8
#(parameter param27 = (((^~({(8'ha7)} ? ((8'ha2) ? (8'haf) : (8'h9c)) : (!(8'hb8)))) ? (-{((8'ha7) - (8'hb7))}) : {(((8'hbb) ? (7'h41) : (8'hb3)) || ((8'ha4) == (7'h40)))}) ? ((~({(8'ha8)} ~^ (-(8'ha9)))) <= ((|(8'haf)) | ({(8'h9d), (7'h41)} ? {(7'h40), (8'hbb)} : {(7'h43)}))) : (((((8'ha1) >= (8'ha3)) ? ((8'h9e) ? (8'hb2) : (8'hab)) : (~&(8'hb3))) ^~ (((7'h41) != (8'hae)) ? {(8'hb8), (7'h40)} : ((8'hab) < (8'hb5)))) & (|{((8'hb9) >= (8'ha6))}))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire12;
  input wire signed [(3'h7):(1'h0)] wire11;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire13;
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 (1'h0)};
  assign wire13 = wire11;
  assign wire14 = {$unsigned(wire11[(3'h5):(2'h3)]), wire13[(1'h0):(1'h0)]};
  assign wire15 = (wire11[(2'h2):(2'h2)] != wire14);
  assign wire16 = wire11;
  assign wire17 = {wire13,
                      ($unsigned($signed($unsigned(wire15))) ?
                          $signed((~|wire16[(2'h2):(1'h1)])) : (((wire15 ?
                              wire14 : wire12) & (8'haa)) & ($unsigned((8'hb1)) + $signed((8'ha1)))))};
  assign wire18 = wire16[(1'h1):(1'h0)];
  assign wire19 = (wire14[(1'h1):(1'h0)] ?
                      (!$signed(wire17[(3'h5):(1'h1)])) : wire14);
  assign wire20 = ($signed(wire9[(4'hb):(3'h4)]) ?
                      (~wire9[(4'hd):(4'hd)]) : $signed(wire15[(3'h6):(3'h4)]));
  assign wire21 = $signed($signed($signed((|$signed(wire19)))));
  assign wire22 = wire9;
  assign wire23 = (^(((&(wire12 | wire11)) - wire22[(2'h3):(1'h0)]) ?
                      (+($unsigned(wire9) > (wire16 >> wire14))) : wire21[(1'h0):(1'h0)]));
  assign wire24 = (wire13[(1'h1):(1'h0)] * wire12[(4'h9):(3'h7)]);
  assign wire25 = {$signed((~(|(~|(8'ha2)))))};
  assign wire26 = {wire19[(3'h5):(3'h4)]};
endmodule
