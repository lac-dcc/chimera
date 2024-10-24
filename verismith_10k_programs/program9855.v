module top
#(parameter param29 = (((8'ha9) ? (~((~|(8'hb8)) >= {(7'h43)})) : (8'hb7)) ? {(8'hac), {(-((7'h41) ? (8'hb0) : (8'ha7))), {(|(7'h40)), ((8'hb4) >>> (8'ha4))}}} : (({((8'hb4) <<< (8'ha2))} ? (((8'had) && (8'hb1)) << {(8'hb1), (7'h40)}) : ((!(8'hae)) ? ((8'ha1) ? (8'hb0) : (8'hbc)) : {(8'hab)})) ? (8'hb6) : (~|({(8'hb3), (8'ha9)} ? ((8'hb1) ? (8'h9f) : (8'ha7)) : (~|(8'h9e)))))), 
parameter param30 = (^({{(~param29)}} >> (param29 >>> ((param29 || param29) || (param29 ? param29 : param29))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  wire [(3'h7):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire22;
  reg [(4'h8):(1'h0)] reg5 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire4,
                 wire6,
                 wire22,
                 reg5,
                 (1'h0)};
  assign wire4 = (($unsigned((wire2[(3'h4):(3'h4)] ?
                     $signed(wire3) : (wire1 ?
                         wire0 : wire3))) >= wire2[(1'h1):(1'h0)]) > $unsigned({$unsigned(wire3[(3'h4):(3'h4)])}));
  always
    @(posedge clk) begin
      reg5 <= ($unsigned(wire4[(3'h4):(2'h3)]) ?
          (|((&$signed((8'ha8))) == wire3)) : wire4[(1'h1):(1'h1)]);
    end
  assign wire6 = (~^({$signed((wire4 || wire3))} || ((^~reg5[(3'h7):(3'h5)]) ?
                     (|wire1[(3'h6):(2'h3)]) : $signed((wire3 == wire0)))));
  module7 #() modinst23 (.wire11(wire3), .wire8(wire4), .y(wire22), .clk(clk), .wire9(wire2), .wire10(wire1), .wire12(wire6));
  assign wire24 = wire6[(4'ha):(4'h8)];
  assign wire25 = (wire3 | (&wire2[(4'h9):(3'h5)]));
  assign wire26 = (~^$signed(wire1));
  assign wire27 = (({(wire26[(4'h9):(3'h5)] ?
                              $signed(wire22) : wire25[(4'he):(4'hb)])} ?
                      $unsigned($unsigned((wire25 ?
                          (8'ha4) : wire1))) : (^~wire4)) - ((wire24 ?
                          ({(8'ha9),
                              (7'h41)} <<< (reg5 ~^ wire4)) : (wire3[(3'h4):(1'h1)] ?
                              (wire4 ? wire1 : reg5) : $signed(wire4))) ?
                      $unsigned(($unsigned(wire26) ?
                          (^wire25) : wire25)) : ((~^$unsigned(wire25)) <= (!wire22))));
  assign wire28 = (wire6 + reg5[(3'h6):(3'h6)]);
endmodule

module module7
#(parameter param21 = (({(8'ha1), (8'ha2)} ? {{((8'hbb) ? (8'ha1) : (8'hb4))}} : {{(^~(8'hb8))}}) ? (+((~|(|(8'hab))) ? (((8'hb2) ^ (7'h43)) ? (~(8'h9f)) : ((8'h9f) | (8'ha3))) : {{(8'haa)}, (8'ha8)})) : (^~((((8'ha2) ? (8'hab) : (8'hb4)) ? (|(8'hbe)) : ((8'hae) <<< (8'hbf))) & {((8'hbe) ? (8'hbf) : (8'hb1)), ((8'h9d) <= (8'hba))}))))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire12;
  input wire [(4'hc):(1'h0)] wire11;
  input wire [(4'hb):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire [(2'h2):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  wire signed [(4'hf):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire17;
  wire signed [(3'h6):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire13;
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 (1'h0)};
  assign wire13 = wire8;
  assign wire14 = wire12[(4'hb):(3'h4)];
  assign wire15 = $signed((!(~wire12[(2'h3):(1'h1)])));
  assign wire16 = (^$signed(((~&(wire8 ?
                      (8'hab) : wire14)) ^~ (((8'hb4) != wire8) <= $signed(wire12)))));
  assign wire17 = ((+$unsigned({$signed((8'had)), wire11})) ?
                      $unsigned(wire10) : ($unsigned($signed({(8'hbb)})) ?
                          (-$unsigned((wire13 ?
                              wire16 : wire11))) : $signed({(~wire13),
                              $unsigned(wire11)})));
  assign wire18 = wire8[(1'h1):(1'h1)];
  assign wire19 = (wire11 << wire15[(4'ha):(1'h0)]);
  assign wire20 = ((|(($unsigned(wire17) ^ $unsigned(wire18)) ?
                          wire19[(4'ha):(2'h3)] : (((8'h9e) ? wire19 : wire8) ?
                              ((8'hb2) && wire10) : {wire15, (8'ha7)}))) ?
                      (wire13 ^ $unsigned(((!wire8) ?
                          (wire15 ?
                              wire19 : (8'hb8)) : $unsigned(wire11)))) : {{(~{wire12,
                                  wire16})}});
endmodule
