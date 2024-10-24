module top
#(parameter param49 = (({(~|((8'hb2) ? (8'hb9) : (8'h9f)))} <= (~^(((8'hb4) < (8'hb2)) ? {(8'hbc), (8'ha8)} : (7'h40)))) != ((((+(8'had)) << (~(8'hab))) ? (((8'hba) || (8'hb1)) ? ((8'hbe) ? (8'had) : (8'ha2)) : ((8'hbb) ? (8'h9c) : (8'ha0))) : (((7'h43) ? (7'h44) : (8'ha3)) ? (~&(8'hb0)) : (~^(8'ha9)))) | (8'hbe))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire44,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = wire2[(3'h7):(1'h1)];
  assign wire6 = (+{(wire1 * {(wire1 ? wire4 : wire5)}), wire1[(2'h3):(1'h1)]});
  assign wire7 = $signed($unsigned($unsigned((~^$signed(wire5)))));
  assign wire8 = wire0[(1'h1):(1'h1)];
  assign wire9 = ((((&((7'h40) ? wire0 : (8'hbe))) < ({wire5,
                             (8'ha3)} <<< {wire3})) ?
                         wire6 : $unsigned($signed(((8'hb9) ?
                             wire3 : wire7)))) ?
                     wire6[(1'h0):(1'h0)] : $unsigned($unsigned((~|((8'hbd) ~^ wire3)))));
  assign wire10 = (~|wire9[(3'h4):(1'h1)]);
  assign wire11 = (($signed(wire9[(3'h7):(1'h1)]) ?
                      $signed(((wire8 ? wire4 : wire4) ?
                          $unsigned(wire4) : $unsigned(wire9))) : $signed(($signed(wire0) ?
                          {wire1} : $signed(wire8)))) == (-(|(|wire4))));
  module12 #() modinst45 (.wire13(wire11), .wire15(wire4), .wire16(wire1), .y(wire44), .wire14(wire10), .clk(clk));
  assign wire46 = (-$signed($unsigned((wire1 > $unsigned(wire0)))));
  assign wire47 = (~&(^~(~^($signed(wire2) ? (&wire10) : (^~wire11)))));
  assign wire48 = (8'hbd);
endmodule

module module12
#(parameter param43 = ((&((&((8'ha1) ? (8'hae) : (8'ha6))) ? (^((8'ha5) != (8'ha0))) : (-((8'hbf) ^~ (8'h9e))))) ? {{(((7'h43) > (8'hbc)) <= (-(8'ha9))), {((8'hb3) ? (8'hbd) : (8'hb6))}}} : (({{(8'hb5), (8'hba)}} & {((8'h9e) << (8'hb6)), {(7'h40), (7'h41)}}) >= {(~&((8'ha9) == (8'hb1)))})))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire16;
  input wire signed [(3'h7):(1'h0)] wire15;
  input wire [(4'hc):(1'h0)] wire14;
  input wire [(4'ha):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  wire signed [(5'h14):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire17;
  assign y = {wire42, wire41, wire40, wire38, wire17, (1'h0)};
  assign wire17 = $unsigned($unsigned(wire13));
  module18 #() modinst39 (wire38, clk, wire14, wire16, wire13, wire15);
  assign wire40 = wire38;
  assign wire41 = wire40[(2'h2):(2'h2)];
  assign wire42 = (wire15 - {$signed($unsigned((~wire17))), wire14});
endmodule

module module18  (y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire22;
  input wire [(4'hf):(1'h0)] wire21;
  input wire [(4'ha):(1'h0)] wire20;
  input wire [(2'h2):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire30;
  wire signed [(5'h13):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire25;
  wire signed [(4'h8):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire23 = wire22[(2'h2):(1'h1)];
  assign wire24 = ($signed((!{{wire19, wire19}, wire22})) ? (8'ha0) : (8'hb7));
  assign wire25 = $signed(wire24[(3'h4):(2'h3)]);
  assign wire26 = ($unsigned((($signed(wire21) ?
                          wire24[(3'h7):(3'h5)] : (wire20 ?
                              wire22 : wire25)) ^~ (^$unsigned(wire22)))) ?
                      (wire23 != {wire21[(4'hb):(3'h4)],
                          wire25}) : (^~({{wire19}, wire22} ?
                          $unsigned((wire24 ?
                              wire24 : wire21)) : ((-wire23) << ((8'hbe) <= wire22)))));
  assign wire27 = {($unsigned($signed(((8'h9e) && wire20))) ?
                          (wire25 ?
                              (~^$signed(wire23)) : $unsigned((8'hba))) : (wire25[(1'h1):(1'h1)] ?
                              $signed(wire24[(4'h8):(3'h7)]) : (8'haf)))};
  assign wire28 = $signed(((wire21[(4'ha):(2'h3)] ?
                          wire20 : $signed($unsigned(wire26))) ?
                      wire24 : (~$unsigned((!wire21)))));
  assign wire29 = wire28;
  assign wire30 = ($signed({($unsigned(wire20) == (wire29 ^~ wire28))}) ?
                      wire26[(3'h7):(3'h4)] : ($signed($signed((wire24 & wire23))) ?
                          $signed((wire24[(1'h1):(1'h0)] ?
                              {wire25} : wire19[(2'h2):(1'h0)])) : (8'ha4)));
  always
    @(posedge clk) begin
      reg31 <= wire25[(3'h6):(1'h0)];
      reg32 <= (wire19[(2'h2):(2'h2)] <<< $unsigned({(!wire20),
          $unsigned(wire26)}));
      reg33 <= ($signed($signed(((wire21 || wire30) ?
              reg31[(2'h3):(2'h2)] : {wire19}))) ?
          ((&({(7'h40), wire24} ^ wire24)) << $unsigned({$signed(wire28),
              (^~wire26)})) : $signed(wire29));
      reg34 <= $signed({(-{(wire28 ^~ (8'hac))}),
          (reg32[(1'h1):(1'h1)] == ((~wire29) << wire26))});
    end
  assign wire35 = {(({(wire19 != wire23)} & wire28) ?
                          $unsigned(wire22[(3'h5):(2'h2)]) : $unsigned(reg33)),
                      ({$signed((~wire21))} || reg32)};
  assign wire36 = wire29;
  assign wire37 = reg31;
endmodule
