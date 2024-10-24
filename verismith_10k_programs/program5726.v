module top
#(parameter param140 = (-(~^((^~((7'h44) && (7'h42))) == {(~|(7'h41))}))), 
parameter param141 = (~param140))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire139;
  wire [(5'h10):(1'h0)] wire138;
  wire [(2'h2):(1'h0)] wire137;
  wire [(3'h7):(1'h0)] wire136;
  wire signed [(5'h11):(1'h0)] wire135;
  wire signed [(4'hf):(1'h0)] wire134;
  wire signed [(4'hb):(1'h0)] wire133;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire66;
  wire signed [(4'hd):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire69;
  wire signed [(3'h4):(1'h0)] wire123;
  wire [(5'h14):(1'h0)] wire125;
  wire signed [(4'hc):(1'h0)] wire127;
  wire signed [(5'h12):(1'h0)] wire129;
  wire signed [(4'hf):(1'h0)] wire130;
  wire signed [(4'hd):(1'h0)] wire131;
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire5,
                 wire6,
                 wire7,
                 wire66,
                 wire68,
                 wire69,
                 wire123,
                 wire125,
                 wire127,
                 wire129,
                 wire130,
                 wire131,
                 (1'h0)};
  assign wire5 = {wire0,
                     $unsigned($unsigned($unsigned((wire4 ? wire3 : wire1))))};
  assign wire6 = (^$unsigned((~&{$unsigned((7'h41)), wire4[(4'ha):(1'h0)]})));
  assign wire7 = $unsigned({wire2});
  module8 #() modinst67 (wire66, clk, wire7, wire0, wire4, wire6);
  assign wire68 = $signed($unsigned((!(~&{wire6, wire2}))));
  assign wire69 = wire0[(2'h2):(1'h0)];
  module70 #() modinst124 (wire123, clk, wire4, wire6, wire7, wire2);
  module35 #() modinst126 (.wire38(wire2), .y(wire125), .clk(clk), .wire39(wire0), .wire37(wire1), .wire36(wire69));
  module70 #() modinst128 (wire127, clk, wire66, wire3, wire4, wire125);
  assign wire129 = $unsigned({$signed(wire6[(3'h7):(1'h0)])});
  assign wire130 = ({$unsigned((~&(+wire0)))} ?
                       $signed(((wire69 == wire127[(1'h1):(1'h0)]) || (~^wire68))) : $signed(wire66));
  module16 #() modinst132 (.y(wire131), .wire20(wire130), .clk(clk), .wire17(wire68), .wire21(wire129), .wire19(wire5), .wire18(wire69));
  assign wire133 = wire4;
  assign wire134 = ({($signed({wire66}) ?
                               (|$signed(wire125)) : ({wire127} ?
                                   wire6[(3'h7):(2'h2)] : wire127))} ?
                       (^{$unsigned(((8'ha8) ?
                               wire133 : wire4))}) : (^$unsigned(wire2)));
  assign wire135 = ($unsigned($unsigned($unsigned(wire125))) ?
                       (~^(8'haa)) : (^~wire1));
  assign wire136 = (^~wire133[(4'h8):(2'h2)]);
  assign wire137 = (&$unsigned((-$unsigned(wire0))));
  assign wire138 = ($unsigned($unsigned(({wire5, wire2} ?
                           ((8'hb2) ^ wire136) : (~^wire125)))) ?
                       $unsigned((+$signed((^wire137)))) : wire125[(2'h3):(2'h2)]);
  assign wire139 = wire137[(1'h0):(1'h0)];
endmodule

module module70
#(parameter param122 = (8'hb2))
(y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire74;
  input wire signed [(4'hf):(1'h0)] wire73;
  input wire [(5'h14):(1'h0)] wire72;
  input wire [(5'h14):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire121;
  wire [(2'h2):(1'h0)] wire119;
  wire signed [(2'h3):(1'h0)] wire96;
  wire [(2'h2):(1'h0)] wire95;
  wire signed [(4'hc):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire76;
  wire [(5'h10):(1'h0)] wire75;
  reg signed [(5'h11):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(4'he):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg92 = (1'h0);
  reg [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(5'h15):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(3'h6):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(5'h11):(1'h0)] reg81 = (1'h0);
  reg [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  assign y = {wire121,
                 wire119,
                 wire96,
                 wire95,
                 wire94,
                 wire77,
                 wire76,
                 wire75,
                 reg98,
                 reg97,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire75 = wire74[(3'h4):(3'h4)];
  assign wire76 = $unsigned((((wire71[(1'h1):(1'h1)] - wire72[(2'h2):(1'h1)]) ?
                      (|wire73) : (((8'haf) != wire75) ?
                          (wire74 ?
                              wire71 : (7'h41)) : (wire73 & wire74))) != ((wire71[(4'hb):(4'h9)] * wire71[(4'hf):(3'h7)]) ^ wire74)));
  assign wire77 = (|wire73[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg78 <= {(wire74[(1'h0):(1'h0)] ^ ((^(^wire75)) == ($signed(wire72) - wire77))),
          (+$unsigned(wire77))};
      if (wire75)
        begin
          reg79 <= $unsigned(wire74);
        end
      else
        begin
          reg79 <= wire76[(2'h2):(2'h2)];
          if ($unsigned(reg79[(2'h3):(2'h3)]))
            begin
              reg80 <= wire73;
              reg81 <= ((((~(reg79 - (7'h40))) ?
                  wire72[(2'h2):(1'h0)] : ($unsigned(wire76) ?
                      $signed(reg79) : (wire77 ?
                          wire72 : (8'hb4)))) & reg79[(3'h5):(3'h4)]) * (|wire77));
              reg82 <= (^($signed(wire73[(4'he):(4'hc)]) ?
                  (wire72 >= $unsigned((reg80 ?
                      reg78 : reg79))) : (((^~wire77) < (&reg81)) >>> wire71)));
              reg83 <= wire73[(3'h6):(3'h4)];
              reg84 <= ((reg81 <<< reg83) - ($signed(reg80) || wire74[(2'h2):(1'h1)]));
            end
          else
            begin
              reg80 <= reg82;
              reg81 <= (!wire71);
              reg82 <= $signed($signed({(wire72 + {(8'ha6)}),
                  ($signed(wire71) != wire71)}));
              reg83 <= wire73[(3'h7):(1'h1)];
              reg84 <= wire74;
            end
          reg85 <= (((~^reg79[(3'h4):(2'h3)]) + wire77[(3'h6):(1'h0)]) ?
              (((~reg83) ? (8'hb4) : wire75) && $signed(((8'ha3) <<< ((8'hb4) ?
                  reg81 : reg80)))) : $unsigned({(reg79 ?
                      (wire75 * wire77) : (~wire71))}));
          if (wire71[(4'hf):(4'h9)])
            begin
              reg86 <= ({$signed($signed(wire75[(4'hb):(3'h4)]))} ?
                  (((wire72 + (wire77 ? reg82 : reg81)) ?
                      ($unsigned(reg84) ?
                          ((8'hbf) ? wire71 : reg80) : ((8'ha7) ?
                              wire74 : reg81)) : $unsigned((~&wire75))) >= reg78[(3'h6):(2'h2)]) : reg85[(1'h0):(1'h0)]);
              reg87 <= (((~^(^$unsigned((8'hb6)))) ?
                      (-($unsigned(reg83) & $unsigned(wire74))) : (($signed(wire73) ?
                              reg80 : (reg83 != (8'ha8))) ?
                          wire73 : ($unsigned(reg79) ?
                              (reg81 ? reg80 : wire75) : $signed(reg86)))) ?
                  (wire73[(3'h5):(2'h3)] | $unsigned($unsigned((wire73 != reg78)))) : reg79[(3'h7):(3'h7)]);
            end
          else
            begin
              reg86 <= reg78;
              reg87 <= ((($signed((&wire73)) ?
                          $unsigned((^wire74)) : $unsigned($signed(reg81))) ?
                      (~&wire72[(1'h0):(1'h0)]) : {(wire77 ?
                              wire71 : reg79[(3'h7):(1'h0)]),
                          wire73}) ?
                  reg80 : reg84);
            end
        end
      reg88 <= reg80;
      if ($signed((($unsigned(reg88) ?
              wire76[(3'h6):(2'h2)] : (~|wire72[(1'h1):(1'h1)])) ?
          ({(^~reg84), reg85[(1'h1):(1'h1)]} ?
              ($unsigned(wire71) ?
                  (wire77 >= reg80) : reg86[(5'h10):(4'h8)]) : $signed(((8'hb3) ?
                  reg82 : reg84))) : $signed($signed(reg83)))))
        begin
          reg89 <= reg84[(4'hc):(3'h5)];
          reg90 <= (|$unsigned($signed((~reg79[(4'h9):(3'h4)]))));
          reg91 <= wire71[(4'hc):(2'h2)];
        end
      else
        begin
          reg89 <= ($unsigned($signed((((8'had) != (7'h40)) ?
                  $unsigned(wire71) : (+wire76)))) ?
              (wire73[(4'hd):(2'h2)] ?
                  $unsigned(reg81[(4'he):(4'hb)]) : reg85) : $unsigned((reg81 ?
                  reg79[(3'h4):(2'h2)] : reg89[(4'hd):(1'h0)])));
          reg90 <= {($unsigned($unsigned($unsigned((8'haa)))) + ($signed($signed(reg81)) - reg88[(2'h2):(1'h0)]))};
          reg91 <= reg84;
          reg92 <= (+{{{(reg81 ? reg88 : wire73)},
                  ({wire76, reg85} ~^ ((8'hb1) ? reg88 : reg80))},
              (wire72 | reg88[(2'h3):(1'h0)])});
          reg93 <= reg87;
        end
    end
  assign wire94 = reg83[(3'h5):(3'h5)];
  assign wire95 = {$signed($signed(reg92[(3'h5):(2'h2)])),
                      ($unsigned((wire73[(3'h6):(2'h2)] ?
                          ((8'ha5) | reg92) : (~|reg92))) < (~&reg80))};
  assign wire96 = ((&$unsigned($signed($signed(wire76)))) > (~&(^~reg91[(4'h8):(1'h0)])));
  always
    @(posedge clk) begin
      reg97 <= wire74[(3'h6):(1'h0)];
      reg98 <= ($signed(($signed((&reg81)) <<< $unsigned({wire96, (8'ha5)}))) ?
          wire94[(3'h7):(2'h3)] : ($unsigned({reg92,
              (wire94 ? reg80 : reg88)}) ~^ reg86));
    end
  module99 #() modinst120 (wire119, clk, wire73, wire72, reg93, reg83);
  assign wire121 = ($signed(($unsigned($signed((8'ha9))) < wire96)) < reg97[(3'h4):(3'h4)]);
endmodule

module module8
#(parameter param65 = {(+(|((8'ha8) ? ((7'h41) + (8'ha5)) : ((8'ha7) < (8'hac))))), ((~|(~|((7'h42) & (8'hb3)))) ? ({((8'hb9) != (8'hbc)), (&(8'hbd))} ? ({(8'hba), (8'h9d)} - ((7'h44) ^~ (8'ha5))) : (((8'hb4) ? (8'ha4) : (7'h44)) ? ((8'hb4) >> (8'hb6)) : ((7'h40) ? (8'hae) : (8'hb8)))) : (|({(8'hab), (8'hac)} ? (-(8'ha4)) : {(8'ha0)})))})
(y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire signed [(4'hc):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire63;
  wire [(5'h14):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire30;
  assign y = {wire63,
                 wire34,
                 wire33,
                 wire32,
                 wire13,
                 wire14,
                 wire15,
                 wire30,
                 (1'h0)};
  assign wire13 = wire9[(2'h2):(1'h1)];
  assign wire14 = $signed({wire11[(4'h9):(4'h8)]});
  assign wire15 = $unsigned(((8'hbd) ^ (|wire11)));
  module16 #() modinst31 (.wire19(wire14), .y(wire30), .wire18(wire12), .wire17(wire15), .wire20(wire9), .clk(clk), .wire21(wire13));
  assign wire32 = $signed((7'h43));
  assign wire33 = wire30;
  assign wire34 = ((~$signed(wire15)) ? $signed(wire9) : {wire12});
  module35 #() modinst64 (wire63, clk, wire13, wire32, wire10, wire34);
endmodule

module module35
#(parameter param61 = ({(7'h41)} ^~ (8'hbd)), 
parameter param62 = param61)
(y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire39;
  input wire [(5'h13):(1'h0)] wire38;
  input wire signed [(5'h12):(1'h0)] wire37;
  input wire signed [(5'h14):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire46;
  wire [(2'h2):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire40 = $unsigned((~|$signed((8'hbe))));
  assign wire41 = wire40;
  assign wire42 = (^~$signed({$signed((wire36 ? wire38 : (8'h9f)))}));
  assign wire43 = (8'ha0);
  assign wire44 = (+$signed((wire38[(5'h10):(2'h2)] >> wire37)));
  assign wire45 = wire39;
  assign wire46 = (8'hb1);
  always
    @(posedge clk) begin
      reg47 <= (wire43[(3'h4):(2'h3)] <<< (~&$signed((wire37[(2'h2):(1'h1)] <<< wire44[(2'h3):(2'h3)]))));
      reg48 <= (8'hb3);
      reg49 <= wire38[(4'he):(3'h6)];
      if (wire36)
        begin
          reg50 <= (8'ha8);
          reg51 <= $signed((^$unsigned($signed((wire36 + (8'hb3))))));
          reg52 <= (~|(~^($signed(wire40) + reg50[(1'h1):(1'h0)])));
          reg53 <= ($signed(wire44) ?
              wire44[(3'h4):(1'h0)] : $unsigned({$unsigned((wire44 ?
                      reg51 : wire38)),
                  wire46}));
        end
      else
        begin
          reg50 <= (~&(+((!$unsigned(wire45)) ?
              $unsigned(wire37[(3'h5):(1'h0)]) : {wire45[(1'h1):(1'h0)],
                  (8'hb3)})));
          reg51 <= {reg49};
          if ($signed((reg51 ?
              $unsigned(((wire43 ? wire40 : reg53) ?
                  (^~wire40) : ((8'hb7) ? (7'h41) : wire39))) : wire39)))
            begin
              reg52 <= $unsigned($unsigned((!wire37)));
            end
          else
            begin
              reg52 <= (-reg49[(2'h3):(1'h0)]);
            end
          if ((~^(~&(~^$signed(reg53)))))
            begin
              reg53 <= (((~|reg51) ? reg53 : (-$signed((reg53 | wire41)))) ?
                  (~$signed(wire36)) : (wire45[(1'h1):(1'h0)] ?
                      $signed(reg51[(3'h6):(1'h0)]) : $signed(wire42[(1'h1):(1'h0)])));
              reg54 <= wire39[(4'h8):(1'h1)];
              reg55 <= (((~((reg51 >> reg54) ~^ wire38)) ?
                      ((^(+wire38)) ~^ {(|(8'hb3)),
                          $unsigned((8'ha9))}) : reg49[(3'h5):(3'h5)]) ?
                  $unsigned(($signed($unsigned(wire42)) << reg47)) : reg47[(3'h6):(2'h2)]);
              reg56 <= $signed((8'hb8));
              reg57 <= reg54;
            end
          else
            begin
              reg53 <= $unsigned((~^reg54));
              reg54 <= reg54[(3'h6):(2'h3)];
              reg55 <= reg48[(1'h0):(1'h0)];
            end
          reg58 <= (reg56 <= reg50[(3'h4):(1'h0)]);
        end
    end
  assign wire59 = $signed(((reg53 ?
                          reg54[(4'h9):(2'h3)] : {((8'hb6) ?
                                  wire38 : wire37)}) ?
                      (({wire40} ?
                          reg50[(2'h2):(1'h0)] : reg53[(4'hd):(1'h1)]) | $unsigned($unsigned(reg56))) : reg50[(3'h4):(1'h1)]));
  assign wire60 = $unsigned(($signed(reg49) <= $unsigned(($unsigned(reg47) <<< $unsigned(wire41)))));
endmodule

module module16
#(parameter param29 = (+{(^(((8'ha5) != (8'haf)) - ((8'h9f) ^~ (7'h43))))}))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire21;
  input wire signed [(4'hc):(1'h0)] wire20;
  input wire [(3'h7):(1'h0)] wire19;
  input wire signed [(4'hc):(1'h0)] wire18;
  input wire signed [(4'hd):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire22;
  assign y = {wire28, wire27, wire26, wire25, wire24, wire23, wire22, (1'h0)};
  assign wire22 = $unsigned($unsigned((!((^wire17) == $signed(wire18)))));
  assign wire23 = wire19[(2'h2):(1'h1)];
  assign wire24 = $unsigned($signed((wire18 | $unsigned($signed((7'h44))))));
  assign wire25 = wire23;
  assign wire26 = ($unsigned((wire19[(2'h3):(1'h0)] <= $unsigned((wire25 ?
                      wire23 : wire25)))) == $signed((wire21 != {(wire17 + wire17)})));
  assign wire27 = (wire17 ?
                      ($signed((!$unsigned(wire25))) ?
                          ($signed((^~wire18)) ?
                              $signed((wire23 ?
                                  wire23 : wire25)) : ((~wire24) ^ (wire19 ~^ wire24))) : wire22) : $signed((8'hb5)));
  assign wire28 = ((8'ha9) ?
                      {wire17[(1'h1):(1'h0)]} : $signed({(8'hb9),
                          $signed(wire23[(4'ha):(2'h2)])}));
endmodule

module module99
#(parameter param117 = (-((~^(((8'hb1) ? (8'ha6) : (8'had)) & ((8'hab) ? (8'had) : (8'ha9)))) ? (~|(+((8'ha3) ^ (8'haf)))) : (^~(~&{(8'ha9)})))), 
parameter param118 = (|{(~((param117 ? param117 : (8'hb2)) | (param117 ? param117 : param117)))}))
(y, clk, wire103, wire102, wire101, wire100);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire103;
  input wire signed [(5'h14):(1'h0)] wire102;
  input wire signed [(3'h4):(1'h0)] wire101;
  input wire signed [(3'h6):(1'h0)] wire100;
  wire signed [(5'h10):(1'h0)] wire116;
  wire signed [(3'h6):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire114;
  wire [(3'h7):(1'h0)] wire113;
  wire [(5'h11):(1'h0)] wire112;
  wire [(5'h13):(1'h0)] wire111;
  wire signed [(4'hf):(1'h0)] wire110;
  wire [(4'he):(1'h0)] wire109;
  wire signed [(3'h4):(1'h0)] wire108;
  wire signed [(4'hf):(1'h0)] wire107;
  wire signed [(5'h12):(1'h0)] wire106;
  wire [(5'h12):(1'h0)] wire105;
  wire [(4'hd):(1'h0)] wire104;
  assign y = {wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 (1'h0)};
  assign wire104 = (((+(wire101[(2'h2):(1'h1)] ?
                       $unsigned(wire103) : (+(8'haf)))) - wire100) && (($signed(wire102[(5'h14):(4'h9)]) >>> {(8'ha3),
                       $signed(wire101)}) | wire100));
  assign wire105 = (wire104 ?
                       (~(wire102[(5'h13):(4'h9)] & wire102)) : $signed((wire104 ?
                           $signed((^wire102)) : ((^wire101) - wire100))));
  assign wire106 = ((~&(^(!wire102[(2'h2):(1'h1)]))) <= $unsigned($unsigned(wire101[(2'h3):(2'h2)])));
  assign wire107 = $signed((8'ha1));
  assign wire108 = $unsigned(wire106);
  assign wire109 = (-$unsigned(wire103[(2'h3):(2'h3)]));
  assign wire110 = (~^$signed((^wire109)));
  assign wire111 = (-wire109[(4'h9):(1'h0)]);
  assign wire112 = {(wire111[(4'ha):(3'h6)] >>> (-wire103)),
                       wire102[(3'h5):(2'h2)]};
  assign wire113 = $signed(wire110[(3'h4):(3'h4)]);
  assign wire114 = wire111[(3'h5):(2'h2)];
  assign wire115 = (((wire114[(2'h2):(2'h2)] & (&(wire114 ?
                       (8'ha6) : (8'hb1)))) <<< (wire112 ?
                       (~|wire104) : (wire110 >> wire108[(3'h4):(3'h4)]))) >>> $signed((($signed(wire112) ^ (^~wire105)) ?
                       $signed((wire114 >> (7'h41))) : $unsigned((wire110 >> wire101)))));
  assign wire116 = $unsigned({$unsigned((~(wire115 * wire108))),
                       (&{(wire101 + wire106), wire109})});
endmodule
