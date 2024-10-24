module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire3;
  wire [(2'h3):(1'h0)] wire186;
  wire signed [(4'hb):(1'h0)] wire184;
  wire signed [(4'h8):(1'h0)] wire138;
  wire [(4'ha):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire61;
  wire signed [(3'h4):(1'h0)] wire63;
  wire signed [(5'h11):(1'h0)] wire133;
  reg [(4'hd):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg135 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  assign y = {wire186,
                 wire184,
                 wire138,
                 wire4,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire61,
                 wire63,
                 wire133,
                 reg137,
                 reg136,
                 reg135,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg17,
                 (1'h0)};
  assign wire4 = $signed(({$signed(wire0),
                     $signed(wire0)} && (wire0 >= (-(wire1 ?
                     (8'hb1) : wire3)))));
  always
    @(posedge clk) begin
      if (($signed((({wire1} * wire4) ?
              $unsigned(wire0) : $unsigned((wire3 ? (8'h9e) : wire1)))) ?
          {wire0} : $unsigned((((-wire0) ? $signed(wire3) : {wire3, wire1}) ?
              ($signed(wire0) ?
                  $unsigned(wire3) : (+wire1)) : (wire2 >>> wire0[(3'h6):(3'h5)])))))
        begin
          reg5 <= $unsigned($signed(($unsigned(wire1) || $signed((wire1 ?
              wire4 : wire3)))));
          if (wire1)
            begin
              reg6 <= (~{$unsigned((|(8'h9c)))});
              reg7 <= wire1;
              reg8 <= (!reg6[(3'h7):(3'h6)]);
              reg9 <= reg7[(1'h1):(1'h0)];
              reg10 <= $unsigned(($unsigned((wire2 > (reg8 ? reg9 : reg5))) ?
                  (8'hbc) : (|((^~wire0) >> (wire3 ? wire2 : reg8)))));
            end
          else
            begin
              reg6 <= wire3;
              reg7 <= ($signed(($unsigned((!wire2)) * {{reg6, reg10}})) ?
                  (~$unsigned((wire2 ?
                      $signed(reg10) : wire2))) : $signed((~&(^~wire3))));
              reg8 <= $unsigned((~$unsigned(($unsigned(wire4) < reg9))));
              reg9 <= {wire3,
                  (reg5 ?
                      (~^(8'hb2)) : ($unsigned((~|(8'hac))) ^~ ($signed(wire4) * $unsigned(wire4))))};
            end
        end
      else
        begin
          if ((~wire3[(1'h1):(1'h0)]))
            begin
              reg5 <= ($signed((+((~reg9) > $signed(reg7)))) <= ((((8'ha9) << $unsigned(wire0)) >= (8'ha3)) && $signed($unsigned($signed(reg5)))));
              reg6 <= (wire2 ?
                  {$signed((reg10[(4'h9):(1'h0)] && $unsigned(wire2))),
                      (^~($unsigned((8'hbd)) ~^ $unsigned(wire2)))} : $unsigned({$unsigned(wire1)}));
              reg7 <= (~^($signed(({reg10, reg8} ?
                  $signed(reg8) : ((8'hbb) ?
                      reg8 : wire2))) <<< (reg8[(4'hb):(2'h3)] ?
                  $unsigned(reg10) : ((wire0 ?
                      wire4 : reg9) * $unsigned(wire0)))));
            end
          else
            begin
              reg5 <= (&$unsigned((wire4 * (reg9 ?
                  reg9[(1'h0):(1'h0)] : (wire3 << wire0)))));
              reg6 <= (((~&{(~reg6),
                  {wire3}}) == (8'hb8)) ~^ ($signed((~&wire0)) ?
                  (reg5[(2'h2):(1'h0)] | (~|(reg9 ~^ wire3))) : wire2[(1'h0):(1'h0)]));
            end
        end
      reg11 <= $unsigned((($unsigned(reg6[(1'h1):(1'h0)]) ?
              $unsigned((~&wire4)) : $unsigned($signed(wire2))) ?
          $unsigned((reg9 != $signed(reg6))) : reg6));
      reg12 <= $unsigned($signed(($unsigned($unsigned(reg8)) >>> $signed(reg8[(1'h0):(1'h0)]))));
    end
  assign wire13 = (|{wire4[(2'h3):(1'h1)], wire4[(2'h3):(1'h1)]});
  assign wire14 = reg11;
  assign wire15 = $unsigned(reg10[(3'h5):(2'h3)]);
  assign wire16 = wire0[(4'h9):(2'h3)];
  always
    @(posedge clk) begin
      reg17 <= {(reg8 >>> $signed(reg9)), reg5[(1'h1):(1'h0)]};
    end
  module18 #() modinst62 (wire61, clk, reg11, reg5, reg12, wire14, wire16);
  assign wire63 = (&($signed(((^~(8'hbe)) <= $unsigned(wire13))) ?
                      $unsigned(((wire13 ? wire16 : wire16) ?
                          $unsigned(wire2) : (reg5 - wire4))) : $unsigned($signed((reg10 ?
                          wire3 : reg6)))));
  module64 #() modinst134 (.wire67(wire0), .y(wire133), .clk(clk), .wire65(wire2), .wire68(wire14), .wire69(wire1), .wire66(wire16));
  always
    @(posedge clk) begin
      reg135 <= (wire3 ?
          (($unsigned((~^reg11)) >> ({wire13, reg9} ?
              $signed(reg7) : {wire61,
                  (8'h9f)})) == wire0) : ((!(~&(!(8'hb9)))) ?
              $signed({$signed(reg17)}) : wire63[(3'h4):(2'h2)]));
      reg136 <= $signed(reg8[(4'hb):(3'h4)]);
      reg137 <= wire3[(3'h5):(2'h2)];
    end
  assign wire138 = wire133[(4'ha):(4'ha)];
  module139 #() modinst185 (wire184, clk, wire1, reg7, wire133, reg17);
  assign wire186 = reg17[(4'hb):(4'h8)];
endmodule

module module139
#(parameter param182 = {((~^{(7'h43), {(8'ha2)}}) & (^~((8'hb4) ? {(8'ha9)} : (~|(7'h43)))))}, 
parameter param183 = ((~|(((^~param182) ^~ (param182 | (8'ha6))) ^ ((param182 ? (8'haf) : (8'hb7)) != (-param182)))) >= (param182 ? (!(^((8'ha9) ^ param182))) : ((~&(!param182)) ? (&{param182}) : (param182 <<< (param182 << param182))))))
(y, clk, wire143, wire142, wire141, wire140);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire143;
  input wire signed [(4'ha):(1'h0)] wire142;
  input wire [(4'he):(1'h0)] wire141;
  input wire [(5'h10):(1'h0)] wire140;
  wire [(4'hb):(1'h0)] wire181;
  wire signed [(2'h3):(1'h0)] wire180;
  wire [(5'h15):(1'h0)] wire179;
  wire [(4'hb):(1'h0)] wire174;
  wire [(5'h13):(1'h0)] wire173;
  wire signed [(3'h5):(1'h0)] wire172;
  wire [(2'h3):(1'h0)] wire170;
  wire [(3'h5):(1'h0)] wire169;
  wire signed [(3'h7):(1'h0)] wire167;
  wire signed [(4'hd):(1'h0)] wire144;
  reg [(4'h9):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg177 = (1'h0);
  reg [(4'ha):(1'h0)] reg176 = (1'h0);
  reg [(4'hd):(1'h0)] reg175 = (1'h0);
  reg [(3'h7):(1'h0)] reg171 = (1'h0);
  assign y = {wire181,
                 wire180,
                 wire179,
                 wire174,
                 wire173,
                 wire172,
                 wire170,
                 wire169,
                 wire167,
                 wire144,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg171,
                 (1'h0)};
  assign wire144 = {(|(~^({wire142, (7'h40)} ^ $unsigned(wire141)))),
                       {wire140,
                           {(~^(wire142 ? (8'hae) : wire142)),
                               $signed($unsigned(wire141))}}};
  module145 #() modinst168 (.y(wire167), .wire149(wire140), .wire148(wire143), .clk(clk), .wire146(wire142), .wire147(wire141));
  assign wire169 = wire144[(3'h6):(3'h5)];
  assign wire170 = $unsigned(((($signed(wire143) ?
                               (wire167 << wire169) : (wire167 ?
                                   wire169 : wire169)) ?
                           {(wire144 ? (8'hbf) : wire141)} : wire144) ?
                       {$unsigned((wire141 ? wire169 : wire169))} : wire144));
  always
    @(posedge clk) begin
      reg171 <= (7'h40);
    end
  assign wire172 = wire140;
  assign wire173 = wire169;
  assign wire174 = $unsigned(wire167[(3'h6):(3'h6)]);
  always
    @(posedge clk) begin
      reg175 <= (~wire172[(3'h5):(1'h1)]);
      reg176 <= ($signed(($unsigned($unsigned(wire140)) ?
          wire172 : $signed({reg171}))) - $signed($signed(((8'hb2) != (+reg175)))));
      reg177 <= $unsigned($unsigned((&(~^(wire174 > wire143)))));
      reg178 <= wire142[(4'ha):(2'h2)];
    end
  assign wire179 = (~|((wire142 | (wire172 - (wire167 ?
                       wire167 : wire172))) && $signed({(wire143 > wire144),
                       {wire169}})));
  assign wire180 = $unsigned(((~|(&wire170)) ?
                       $unsigned(($signed(wire169) ?
                           $unsigned(wire172) : $unsigned(wire142))) : reg178));
  assign wire181 = ($unsigned({(&$unsigned((8'hb0))),
                           (~^(wire142 ? wire142 : reg178))}) ?
                       reg177[(4'ha):(1'h1)] : (wire170 ^ $signed((reg175[(4'hd):(4'hd)] && (wire172 ?
                           wire170 : wire180)))));
endmodule

module module64
#(parameter param131 = {((~&({(8'h9c)} ? (^~(7'h42)) : ((8'hb5) <= (8'hbf)))) ? ((!(8'had)) ? ({(8'hb3), (8'haa)} & ((8'hb3) ? (8'hba) : (7'h42))) : (|((8'hb4) == (8'hb5)))) : ((((8'ha0) != (8'ha4)) ? ((8'hac) ? (8'hb2) : (8'ha6)) : ((8'hae) ? (8'h9c) : (8'hbc))) ? {(~|(8'hac)), {(8'ha1)}} : ({(8'hb5), (8'hbf)} ^ ((7'h42) || (8'hac))))), (((~|{(7'h40)}) == ((~&(8'haf)) && ((8'h9e) ? (7'h41) : (8'ha5)))) ? ((8'hbb) ? (7'h41) : {((8'h9c) ? (8'hb2) : (8'h9e)), {(8'hb9)}}) : (^((~&(8'hb1)) ? (|(8'hb4)) : (~(7'h43)))))}, 
parameter param132 = param131)
(y, clk, wire65, wire66, wire67, wire68, wire69);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire65;
  input wire [(5'h13):(1'h0)] wire66;
  input wire signed [(4'hd):(1'h0)] wire67;
  input wire signed [(5'h11):(1'h0)] wire68;
  input wire signed [(5'h10):(1'h0)] wire69;
  wire [(4'he):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire72;
  wire signed [(5'h10):(1'h0)] wire117;
  reg [(3'h7):(1'h0)] reg130 = (1'h0);
  reg [(3'h5):(1'h0)] reg129 = (1'h0);
  reg [(3'h7):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg127 = (1'h0);
  reg signed [(4'he):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg124 = (1'h0);
  reg [(5'h14):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg122 = (1'h0);
  reg [(3'h4):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  reg [(5'h15):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  assign y = {wire70,
                 wire71,
                 wire72,
                 wire117,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 (1'h0)};
  assign wire70 = wire69[(2'h3):(1'h0)];
  assign wire71 = {(-wire69),
                      (wire68[(5'h10):(5'h10)] ?
                          (((wire67 ? (8'hb1) : (8'hbd)) ?
                                  (8'hae) : $signed(wire65)) ?
                              ((wire68 << wire67) ?
                                  $unsigned(wire68) : wire70[(1'h1):(1'h0)]) : $signed($signed(wire70))) : ((8'ha3) > (8'hb6)))};
  assign wire72 = {((($signed(wire65) ?
                              $unsigned(wire67) : $unsigned((8'h9c))) != $unsigned(wire66[(4'hc):(3'h7)])) ?
                          $unsigned(wire65[(4'ha):(3'h5)]) : wire66),
                      $signed($unsigned(wire67[(4'hc):(4'h9)]))};
  always
    @(posedge clk) begin
      if ($signed((+$signed((&$signed((8'h9c)))))))
        begin
          reg73 <= $unsigned(($unsigned(wire72[(5'h10):(3'h7)]) <<< $unsigned($signed((wire66 ?
              wire66 : (8'h9d))))));
          reg74 <= (wire66[(4'h9):(1'h1)] != (((wire68 ?
                  (+wire72) : {(8'haa)}) << $unsigned((wire67 ?
                  wire71 : (8'hb4)))) ?
              {$signed((wire68 - wire69))} : $signed(((~&wire71) & $unsigned(wire72)))));
        end
      else
        begin
          if (wire66)
            begin
              reg73 <= (^~$unsigned((wire65 == $signed($signed(wire67)))));
            end
          else
            begin
              reg73 <= (~&($signed((wire67 ? (reg73 == wire66) : wire65)) ?
                  $unsigned(wire67[(4'hb):(4'h9)]) : (wire71[(3'h4):(1'h1)] - {(reg73 >= reg74)})));
            end
        end
      reg75 <= ($unsigned((reg73[(1'h1):(1'h0)] - (|((8'hac) ?
              reg73 : wire70)))) ?
          wire72 : reg74[(5'h13):(1'h0)]);
      reg76 <= reg73;
    end
  module77 #() modinst118 (.wire81(wire65), .wire82(wire69), .y(wire117), .clk(clk), .wire79(wire71), .wire80(wire72), .wire78(wire70));
  always
    @(posedge clk) begin
      if ((wire68[(2'h3):(2'h3)] ?
          $signed(wire69) : (|$signed(((reg73 > wire117) ?
              wire70[(4'he):(3'h4)] : (~&wire70))))))
        begin
          reg119 <= (8'hb2);
          reg120 <= (~|($unsigned(({wire72, reg119} >>> $unsigned(reg75))) ?
              (^reg73[(3'h4):(1'h1)]) : $signed($signed((wire70 + wire71)))));
        end
      else
        begin
          if (wire68)
            begin
              reg119 <= $unsigned({$unsigned(((~^(8'h9c)) <<< reg73)),
                  (reg119 == (((7'h43) != reg75) ?
                      (wire71 ? reg73 : wire117) : (^reg119)))});
              reg120 <= (!(+$unsigned(wire70)));
              reg121 <= ($unsigned({({(8'hb2)} > wire66),
                      {(wire71 ? wire66 : reg73), wire67}}) ?
                  reg120 : (reg75[(3'h5):(3'h4)] - $unsigned($unsigned($unsigned(wire65)))));
              reg122 <= reg76;
              reg123 <= wire117;
            end
          else
            begin
              reg119 <= wire67[(4'hc):(4'hb)];
              reg120 <= (~^(7'h41));
              reg121 <= wire68[(3'h4):(1'h1)];
              reg122 <= ($signed($unsigned(((7'h43) ? (&reg122) : {wire70}))) ?
                  (reg121[(2'h2):(1'h1)] >> (-$unsigned($signed((8'haf))))) : (8'hb3));
              reg123 <= $signed((+({(wire66 ? wire67 : wire66), {wire65}} ?
                  ($signed(reg76) ^ (~^reg121)) : ((|wire71) ?
                      $unsigned(reg74) : wire72[(3'h5):(3'h4)]))));
            end
          reg124 <= (|reg121[(1'h0):(1'h0)]);
          reg125 <= ($signed($signed(((reg124 <<< wire71) || $signed(wire71)))) ?
              $unsigned($signed((^(!wire69)))) : (wire68[(2'h3):(1'h0)] ?
                  (($unsigned(reg120) ?
                          $unsigned(reg119) : (reg123 ? wire117 : wire68)) ?
                      {(reg75 ? reg76 : wire69)} : {reg121[(1'h1):(1'h0)],
                          (8'hab)}) : wire67));
          if (($signed(reg122[(3'h6):(1'h1)]) ?
              ($unsigned((-(reg124 >> wire69))) ?
                  ($unsigned(wire72[(1'h1):(1'h1)]) >>> $unsigned(reg123[(5'h13):(4'hb)])) : ($unsigned($unsigned(reg120)) ?
                      {$unsigned(wire117),
                          (wire67 ?
                              wire72 : reg124)} : $signed((reg74 && wire68)))) : wire67))
            begin
              reg126 <= ((^~(|$signed($signed(wire69)))) <= (($signed((wire68 ?
                  wire68 : reg124)) <<< reg124) < $signed(wire69)));
              reg127 <= {$unsigned(reg120[(2'h3):(1'h0)])};
              reg128 <= (~|$unsigned($unsigned({(~^wire69), $signed(wire66)})));
              reg129 <= (((+reg122[(3'h5):(1'h1)]) ?
                      {(&(wire68 ? reg125 : wire65))} : (&$signed(reg74))) ?
                  reg73 : (!(7'h41)));
              reg130 <= reg123[(2'h3):(2'h2)];
            end
          else
            begin
              reg126 <= (!(reg121[(2'h3):(1'h0)] == reg129));
              reg127 <= ({wire72} ?
                  ($signed($signed({reg126,
                      reg76})) < wire70[(4'h8):(3'h7)]) : reg75);
              reg128 <= (8'ha8);
              reg129 <= $unsigned($unsigned($unsigned($signed($unsigned((8'hae))))));
            end
        end
    end
endmodule

module module18
#(parameter param60 = (^~{{{(|(8'h9c))}}}))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire23;
  input wire [(4'ha):(1'h0)] wire22;
  input wire signed [(3'h7):(1'h0)] wire21;
  input wire signed [(5'h15):(1'h0)] wire20;
  input wire signed [(4'h9):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  wire [(4'hd):(1'h0)] wire56;
  wire [(3'h6):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire24;
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire54,
                 wire30,
                 wire25,
                 wire24,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 (1'h0)};
  assign wire24 = wire20[(4'hc):(4'ha)];
  assign wire25 = (8'hab);
  always
    @(posedge clk) begin
      reg26 <= wire21;
      reg27 <= wire24;
      reg28 <= ($unsigned($signed(wire19)) * ($unsigned(($signed(wire22) <<< $signed(wire22))) ?
          ($unsigned((-wire21)) ~^ (wire24[(4'ha):(3'h4)] ?
              (~wire20) : (wire19 ? (8'hb4) : reg26))) : wire25));
      reg29 <= (+((~((!wire19) ? (wire23 & wire25) : wire22)) ?
          wire21 : $signed((8'h9f))));
    end
  assign wire30 = $unsigned(wire21);
  module31 #() modinst55 (.wire34(wire23), .clk(clk), .y(wire54), .wire36(reg29), .wire35(wire22), .wire33(wire25), .wire32(wire21));
  assign wire56 = reg28;
  assign wire57 = wire24;
  assign wire58 = {wire19[(2'h3):(2'h3)]};
  assign wire59 = wire23;
endmodule

module module31
#(parameter param53 = ((+((~^((7'h40) ? (7'h43) : (8'hb8))) ? (((8'ha6) ? (8'haf) : (7'h43)) ? (+(8'ha3)) : ((8'haa) ? (8'ha9) : (7'h44))) : (~&(+(8'ha0))))) && ((8'ha5) == ((((8'hb7) ? (8'h9d) : (8'hb9)) ? (8'ha9) : ((8'hbd) <= (8'ha7))) ? {{(8'hae), (8'ha1)}, (^~(8'hb5))} : ((~&(8'hab)) ? (&(8'h9e)) : ((8'hba) >> (8'hbd)))))))
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire36;
  input wire signed [(2'h2):(1'h0)] wire35;
  input wire signed [(5'h15):(1'h0)] wire34;
  input wire signed [(5'h14):(1'h0)] wire33;
  input wire [(3'h7):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire52;
  wire [(5'h15):(1'h0)] wire51;
  wire signed [(3'h4):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire37;
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire37 = {(wire32[(3'h7):(3'h7)] <= wire32[(3'h6):(2'h2)]),
                      {$signed(wire32), (&wire36[(2'h3):(1'h1)])}};
  assign wire38 = $unsigned(wire36[(4'h8):(3'h4)]);
  assign wire39 = $unsigned($signed(wire37[(3'h7):(2'h3)]));
  assign wire40 = (^(~|{wire38, ($signed(wire32) - wire32)}));
  assign wire41 = ($unsigned(wire33[(4'he):(4'ha)]) >>> ((wire32 ?
                          $signed({wire32}) : {$signed((8'hbb))}) ?
                      (wire40[(4'hf):(4'hb)] ?
                          ((wire34 && wire40) ?
                              $unsigned(wire32) : wire37) : ((wire38 ?
                                  wire34 : wire37) ?
                              (wire39 <<< wire32) : wire32[(1'h0):(1'h0)])) : ((8'ha8) ?
                          $unsigned((wire32 >> wire35)) : ({wire37, wire34} ?
                              (~&wire32) : (8'h9d)))));
  always
    @(posedge clk) begin
      reg42 <= (-$signed(wire38));
      reg43 <= wire32;
      reg44 <= (wire32 ~^ $unsigned($signed((wire38[(3'h6):(3'h4)] ?
          wire32 : reg43))));
      reg45 <= {(^~(($unsigned(wire41) ? wire39 : {wire40, wire34}) ?
              ((wire38 || (8'haf)) ^~ $unsigned(wire40)) : (wire34 ?
                  (wire41 && wire35) : $signed(wire33))))};
    end
  assign wire46 = $signed(wire41[(5'h10):(1'h1)]);
  assign wire47 = reg43;
  assign wire48 = reg42[(3'h7):(3'h6)];
  assign wire49 = $unsigned($signed(($signed(((8'hbb) ?
                      wire48 : wire33)) * (7'h42))));
  assign wire50 = ((!{wire38[(2'h2):(1'h1)]}) & $signed((+(reg45 ?
                      (^~wire49) : (|wire32)))));
  assign wire51 = (~|(+wire49));
  assign wire52 = wire40[(3'h4):(1'h1)];
endmodule

module module77
#(parameter param116 = ((&(~^(~((7'h43) - (8'hb5))))) ? {({(|(8'haa)), ((7'h40) ? (8'ha2) : (8'haf))} ? (^~((7'h44) > (8'hba))) : {((7'h41) ? (8'hab) : (8'h9f))})} : (!((+{(8'hb5)}) ? (((8'hae) >>> (8'ha5)) ? (~|(8'hae)) : {(8'hba)}) : (8'hb1)))))
(y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire82;
  input wire [(2'h2):(1'h0)] wire81;
  input wire [(4'ha):(1'h0)] wire80;
  input wire signed [(5'h12):(1'h0)] wire79;
  input wire [(4'hc):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire115;
  wire signed [(4'hb):(1'h0)] wire114;
  wire signed [(5'h10):(1'h0)] wire113;
  wire signed [(3'h7):(1'h0)] wire112;
  wire signed [(4'ha):(1'h0)] wire111;
  wire signed [(4'h9):(1'h0)] wire110;
  wire [(5'h12):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire107;
  wire [(5'h13):(1'h0)] wire90;
  wire [(4'ha):(1'h0)] wire83;
  reg [(4'hf):(1'h0)] reg108 = (1'h0);
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(3'h4):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg100 = (1'h0);
  reg [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(4'hd):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  reg [(5'h11):(1'h0)] reg88 = (1'h0);
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire107,
                 wire90,
                 wire83,
                 reg108,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  assign wire83 = ((^(~{wire82, (wire80 ? wire79 : wire81)})) ?
                      $unsigned((wire81 <= $unsigned(wire79[(4'he):(3'h6)]))) : wire79);
  always
    @(posedge clk) begin
      reg84 <= (|(~$signed((wire81[(2'h2):(1'h1)] ?
          {wire79, wire83} : $signed(wire83)))));
      if ((wire82 >>> ($unsigned(wire82[(1'h0):(1'h0)]) ?
          $unsigned(wire83) : (^~$unsigned((wire79 ? wire80 : wire82))))))
        begin
          reg85 <= wire83;
          reg86 <= reg84;
          reg87 <= $unsigned($signed(($signed($signed((8'ha5))) < wire81[(1'h0):(1'h0)])));
          reg88 <= wire81[(1'h0):(1'h0)];
        end
      else
        begin
          reg85 <= {({reg84,
                  $signed((wire82 ?
                      wire82 : reg85))} != ((!(wire82 | wire78)) < wire82)),
              $signed((&((wire79 ? reg87 : wire80) + $unsigned(reg88))))};
        end
      reg89 <= $unsigned((~^(wire81[(2'h2):(1'h1)] ?
          {(8'hb2), $unsigned(wire81)} : {$unsigned(wire81),
              $signed(wire80)})));
    end
  assign wire90 = reg84[(3'h6):(3'h5)];
  always
    @(posedge clk) begin
      reg91 <= $unsigned(wire80);
      reg92 <= $signed(reg87[(4'hb):(4'ha)]);
      if ({reg85, wire83})
        begin
          reg93 <= $signed(((wire81[(1'h1):(1'h0)] == (8'ha5)) > $unsigned(reg89)));
          if ((~^reg91[(2'h2):(1'h0)]))
            begin
              reg94 <= $signed(reg93[(1'h0):(1'h0)]);
              reg95 <= wire81[(2'h2):(1'h0)];
              reg96 <= $signed({(8'hae)});
            end
          else
            begin
              reg94 <= $unsigned(reg88[(4'hf):(4'h9)]);
              reg95 <= ((8'hbc) ?
                  ($signed({$signed((8'ha4))}) * wire90[(1'h1):(1'h0)]) : $unsigned(reg94));
            end
          if ($signed(wire81[(1'h1):(1'h0)]))
            begin
              reg97 <= $signed({$unsigned({(~|wire80),
                      (reg93 ? reg84 : reg87)}),
                  ($unsigned({wire83}) || $unsigned({reg84}))});
            end
          else
            begin
              reg97 <= ($signed(wire82) <<< wire79);
            end
          reg98 <= wire79[(5'h10):(4'h9)];
        end
      else
        begin
          reg93 <= reg84;
          if (wire81)
            begin
              reg94 <= (!reg85[(3'h5):(2'h3)]);
              reg95 <= (~&$unsigned((-reg95)));
              reg96 <= $unsigned((~$unsigned($unsigned((reg94 >> wire78)))));
              reg97 <= $unsigned(wire83[(4'h9):(4'h8)]);
              reg98 <= (({((reg93 ? reg87 : (8'hbf)) ?
                      $signed(reg92) : wire80)} > $signed(($unsigned(reg93) ?
                  reg98 : $unsigned(reg94)))) || wire83);
            end
          else
            begin
              reg94 <= reg98;
              reg95 <= {$signed(reg92)};
              reg96 <= ($signed(reg98) ?
                  $unsigned((~|(reg92[(4'hc):(4'ha)] ^~ reg97[(2'h3):(1'h0)]))) : reg97);
            end
          reg99 <= (+$unsigned($signed(($unsigned(reg88) ?
              (~reg97) : (!reg87)))));
          reg100 <= (&$unsigned(reg99));
          if (reg94)
            begin
              reg101 <= wire78[(3'h6):(1'h0)];
              reg102 <= reg92[(4'hf):(3'h6)];
              reg103 <= (wire90[(3'h7):(2'h2)] & (^reg99));
              reg104 <= $signed((($signed((reg92 >> reg89)) > $unsigned((~|reg101))) ^~ $signed($signed((7'h43)))));
              reg105 <= reg84[(4'hd):(2'h2)];
            end
          else
            begin
              reg101 <= $signed($unsigned({({wire82} <<< ((8'ha8) | reg88))}));
              reg102 <= reg88;
              reg103 <= $unsigned(({reg100,
                      ((reg103 ? (7'h42) : reg89) ~^ $unsigned(reg84))} ?
                  reg93 : {(-$unsigned(reg86))}));
              reg104 <= (&{$unsigned({(~^(8'ha9)), (reg93 ? reg89 : reg94)})});
              reg105 <= ($unsigned((+reg102)) ? reg101[(1'h0):(1'h0)] : reg91);
            end
        end
    end
  always
    @(posedge clk) begin
      reg106 <= reg85;
    end
  assign wire107 = $signed((~|((reg98[(3'h7):(3'h4)] ?
                       (reg93 ^~ reg97) : (reg96 >> reg89)) | $signed((-wire90)))));
  always
    @(posedge clk) begin
      reg108 <= (-$unsigned((wire81[(2'h2):(1'h1)] ?
          $signed((~|reg88)) : $unsigned(((7'h41) ~^ (7'h42))))));
    end
  assign wire109 = (~^wire79[(4'h8):(1'h0)]);
  assign wire110 = {($unsigned(({reg98, wire107} ?
                               (reg105 < (8'ha5)) : ((8'h9e) << wire90))) ?
                           wire79[(5'h10):(4'ha)] : (reg98[(4'hc):(4'h8)] <<< reg92)),
                       (wire90 ?
                           $unsigned($unsigned((reg100 ?
                               reg91 : reg84))) : $unsigned($unsigned({reg97})))};
  assign wire111 = wire110;
  assign wire112 = $signed(reg103);
  assign wire113 = $unsigned($signed(wire110));
  assign wire114 = (reg100 ?
                       ($unsigned($signed((reg92 || reg88))) ?
                           $unsigned($signed($signed((7'h41)))) : {reg101}) : (!(8'hb7)));
  assign wire115 = reg101;
endmodule

module module145  (y, clk, wire149, wire148, wire147, wire146);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire149;
  input wire signed [(5'h14):(1'h0)] wire148;
  input wire signed [(2'h2):(1'h0)] wire147;
  input wire [(3'h6):(1'h0)] wire146;
  wire [(4'hb):(1'h0)] wire166;
  wire signed [(5'h15):(1'h0)] wire165;
  wire [(4'hb):(1'h0)] wire153;
  wire [(2'h3):(1'h0)] wire152;
  wire [(5'h15):(1'h0)] wire151;
  wire signed [(3'h6):(1'h0)] wire150;
  reg [(5'h11):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg159 = (1'h0);
  reg [(5'h14):(1'h0)] reg158 = (1'h0);
  reg [(4'h9):(1'h0)] reg157 = (1'h0);
  reg [(2'h2):(1'h0)] reg156 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg155 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg154 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 (1'h0)};
  assign wire150 = wire148[(4'h8):(4'h8)];
  assign wire151 = wire146;
  assign wire152 = (8'h9f);
  assign wire153 = (~wire151[(4'h9):(3'h5)]);
  always
    @(posedge clk) begin
      reg154 <= (8'ha8);
      if (reg154[(4'h8):(1'h1)])
        begin
          reg155 <= ((+wire147[(2'h2):(1'h0)]) ?
              $signed($unsigned(wire152)) : wire146);
          if (wire149)
            begin
              reg156 <= wire151[(4'he):(3'h4)];
              reg157 <= $unsigned(($signed(wire149) == (^(+wire153[(4'hb):(3'h7)]))));
              reg158 <= reg155[(3'h6):(3'h4)];
              reg159 <= {(wire151 < (((wire149 < (8'ha7)) ?
                      (wire149 >= wire152) : wire153[(2'h3):(2'h3)]) + wire149)),
                  $unsigned(((reg157 ?
                          $unsigned(reg156) : (reg157 || (8'hb3))) ?
                      {(wire149 < reg155)} : reg158))};
              reg160 <= ((8'ha6) != $unsigned(reg159));
            end
          else
            begin
              reg156 <= wire147[(2'h2):(2'h2)];
              reg157 <= (^((&$signed((wire149 ?
                  reg154 : reg160))) + (((reg159 < (8'hb0)) & $unsigned(wire146)) >>> (reg159[(4'h9):(3'h6)] & {(7'h44)}))));
              reg158 <= (wire151[(3'h6):(3'h4)] << reg156[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg155 <= reg154;
          reg156 <= ($signed((~$unsigned(reg159[(1'h0):(1'h0)]))) || (~&{wire151[(5'h15):(5'h11)]}));
          reg157 <= $unsigned((reg157[(3'h6):(3'h6)] ?
              reg160 : $unsigned(wire150)));
          if ({($unsigned(((8'hbc) || (wire149 ~^ (8'hbe)))) ?
                  wire150 : $signed(reg154))})
            begin
              reg158 <= {(wire150[(3'h6):(1'h1)] < ((+(^~reg158)) - reg159[(1'h1):(1'h0)])),
                  wire151[(4'h8):(1'h1)]};
              reg159 <= $unsigned((^reg158));
            end
          else
            begin
              reg158 <= {(8'ha0)};
              reg159 <= (($signed(((wire152 ? reg160 : (7'h41)) ?
                          ((8'hac) ? reg160 : wire147) : {wire151})) ?
                      ($signed(((8'ha5) ~^ reg154)) ?
                          reg160 : wire152[(2'h3):(1'h0)]) : (+{$signed((8'hbd)),
                          (wire147 ? wire146 : wire150)})) ?
                  $unsigned(reg155[(3'h6):(3'h6)]) : (|reg156[(2'h2):(2'h2)]));
              reg160 <= reg157;
            end
          reg161 <= (wire149[(4'hb):(2'h2)] ?
              $signed((($signed(wire148) <= $unsigned(wire147)) > $signed((~&reg157)))) : (reg157[(3'h6):(3'h6)] ^~ (~&$signed($signed(wire148)))));
        end
      reg162 <= ($unsigned({{{wire148}}}) >>> {{$unsigned((reg161 ?
                  reg158 : reg154))}});
      reg163 <= ($unsigned($unsigned($signed(wire153))) ^ (|$unsigned((~((8'hbb) <<< (8'hac))))));
      reg164 <= (wire147 || $unsigned(($unsigned((wire146 != wire148)) ^~ ((!wire147) ?
          $signed(reg158) : ((8'h9d) ? reg155 : wire153)))));
    end
  assign wire165 = (~^reg156[(2'h2):(1'h0)]);
  assign wire166 = (~^($signed((^~reg160)) ^~ (|{wire150[(1'h0):(1'h0)]})));
endmodule
