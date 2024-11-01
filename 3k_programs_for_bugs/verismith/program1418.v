module top
#(parameter param120 = (((((!(8'hb4)) ? {(8'ha3), (8'ha2)} : ((8'ha3) ? (7'h44) : (8'hb5))) != {(+(8'ha6)), ((8'hb1) - (8'h9d))}) ? (((-(8'ha4)) ? (~&(8'h9c)) : {(8'hb7)}) < (8'hb9)) : ((((7'h43) ^~ (8'hb8)) < ((8'hb8) >= (8'ha6))) && ((~|(7'h44)) ? {(8'ha2), (7'h44)} : ((8'ha9) | (8'hac))))) ? (({((8'hb2) * (8'hbc))} ? ((8'hb8) ? (~|(8'haf)) : ((8'ha7) && (7'h42))) : (((8'ha7) & (8'ha2)) ^~ (~&(8'hba)))) && ((((7'h44) != (8'ha5)) ? (|(8'hbb)) : (~^(8'hae))) ? ((!(8'hb7)) << ((8'ha4) != (8'hae))) : (^~((8'hb1) ? (8'had) : (8'hbf))))) : (-(~^({(7'h42)} ? ((8'hb5) * (7'h41)) : ((8'h9f) <<< (8'hab)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h173):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire signed [(4'h9):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire118;
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire118,
                 reg7,
                 reg8,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 (1'h0)};
  assign wire4 = $signed($unsigned($unsigned(wire0)));
  assign wire5 = wire0;
  assign wire6 = wire2;
  always
    @(posedge clk) begin
      reg7 <= wire3[(2'h3):(2'h2)];
      reg8 <= ({$signed($unsigned(wire5[(4'hb):(1'h0)])),
          {wire0,
              $signed((wire5 ?
                  wire5 : wire4))}} ~^ $signed(reg7[(1'h0):(1'h0)]));
    end
  assign wire9 = reg7[(2'h3):(1'h0)];
  assign wire10 = $signed((wire2[(1'h1):(1'h0)] << wire5[(5'h10):(4'h8)]));
  assign wire11 = (8'hb3);
  assign wire12 = ((~^((wire9[(3'h5):(3'h4)] * $unsigned(wire10)) ~^ (|(wire10 || wire1)))) ?
                      wire0 : (&($unsigned(wire0) < wire11[(2'h2):(1'h0)])));
  assign wire13 = (8'hbe);
  assign wire14 = (({(&(-wire6)), reg8} < (wire3[(3'h5):(1'h1)] ?
                          ((7'h43) << wire6) : {$signed(wire4),
                              $unsigned(reg8)})) ?
                      reg8[(1'h1):(1'h1)] : {wire6,
                          (wire13 >> (-$unsigned(wire5)))});
  always
    @(posedge clk) begin
      if ((wire4 ?
          (($signed($unsigned(wire9)) < wire1) ?
              (+wire2) : wire1[(4'hb):(4'h9)]) : wire13[(2'h2):(1'h0)]))
        begin
          reg15 <= (|(8'ha4));
          reg16 <= $signed((+wire9));
          reg17 <= $signed(wire11);
          reg18 <= ($unsigned(wire5) ?
              {$signed({$signed(wire10), $unsigned(reg7)}),
                  {wire12[(1'h1):(1'h0)],
                      (8'hac)}} : $signed((reg17[(3'h7):(2'h2)] ^ (~&(wire6 ?
                  wire0 : reg15)))));
        end
      else
        begin
          if ($unsigned((~(~|(wire6[(3'h4):(1'h1)] ~^ wire10)))))
            begin
              reg15 <= {$unsigned(wire1),
                  (($unsigned($unsigned(wire14)) >> {(wire10 ?
                          wire14 : (8'hb4))}) <= ($unsigned((wire6 ?
                          wire13 : reg16)) ?
                      wire14 : {wire5}))};
              reg16 <= $unsigned((($unsigned($unsigned(wire10)) ?
                  ((wire5 ?
                      wire2 : wire5) ~^ $unsigned(reg15)) : wire5) < $signed($unsigned($unsigned(wire13)))));
            end
          else
            begin
              reg15 <= wire9;
              reg16 <= {wire1[(4'ha):(3'h7)],
                  ($signed((((8'hb2) ? wire0 : wire3) ? (7'h43) : (^~wire11))) ?
                      wire11 : $unsigned(wire3[(4'hc):(3'h7)]))};
              reg17 <= (8'hb0);
              reg18 <= (((|(reg16[(1'h0):(1'h0)] | reg7)) ?
                  reg7 : $signed(wire0[(1'h0):(1'h0)])) != $unsigned((8'h9f)));
            end
          if (reg8[(2'h3):(1'h0)])
            begin
              reg19 <= (&$unsigned($signed(reg7[(1'h1):(1'h0)])));
              reg20 <= reg17;
              reg21 <= $signed($unsigned(reg8[(2'h3):(1'h0)]));
            end
          else
            begin
              reg19 <= (((^wire6[(4'ha):(3'h4)]) * {($unsigned(wire4) ?
                      $unsigned(reg8) : wire11[(2'h2):(2'h2)]),
                  $signed(reg7)}) ^~ (8'hac));
              reg20 <= ((reg21[(3'h5):(2'h2)] ?
                  wire4 : $unsigned(wire10)) & reg21[(3'h4):(2'h3)]);
            end
          reg22 <= (((+((~^reg18) <= $unsigned((8'hac)))) ?
              wire14 : wire9) <<< {$signed(($unsigned(wire14) <= $unsigned((8'hbd)))),
              wire9[(4'h9):(4'h9)]});
          reg23 <= reg15[(1'h1):(1'h0)];
          if (reg7)
            begin
              reg24 <= $unsigned($unsigned((-wire14)));
            end
          else
            begin
              reg24 <= reg17;
              reg25 <= (+wire6);
              reg26 <= $unsigned(((8'ha4) ?
                  {{((8'h9e) ? wire13 : wire5), $unsigned(reg18)},
                      wire1} : ((!(wire1 != wire9)) * {(wire11 ?
                          (8'ha4) : wire3),
                      (~wire4)})));
            end
        end
      reg27 <= $unsigned(((&($signed(reg21) ?
          {wire0, (8'hba)} : $unsigned(wire9))) * (-(+(|wire14)))));
    end
  always
    @(posedge clk) begin
      reg28 <= $signed($unsigned(((wire4[(1'h0):(1'h0)] ?
          {(8'hbf), wire1} : (^~wire12)) - $signed((wire1 ? reg22 : reg16)))));
      reg29 <= $unsigned({(wire1 ?
              $unsigned($unsigned(wire1)) : $signed({wire5})),
          $signed($signed($signed(reg16)))});
    end
  assign wire30 = (-(^reg18));
  assign wire31 = {reg15, reg27[(1'h1):(1'h1)]};
  assign wire32 = (((7'h41) ^ wire11[(1'h0):(1'h0)]) ?
                      wire10[(1'h1):(1'h1)] : {wire2});
  assign wire33 = ({wire10[(2'h3):(1'h1)]} == $signed($unsigned(((wire12 ?
                          reg27 : reg21) ?
                      (~wire3) : {wire11, wire32}))));
  module34 #() modinst119 (wire118, clk, reg22, wire11, reg25, reg20);
endmodule

module module34
#(parameter param117 = (((~|(((8'hb5) || (8'ha6)) ? (+(8'haa)) : {(8'ha3), (8'hb9)})) <= (((&(8'h9f)) - (|(8'hb3))) ? ((~&(8'ha7)) ? (|(8'h9d)) : (7'h42)) : ((-(8'hb6)) - ((8'hab) >= (8'hbf))))) ? (((((8'ha2) ^~ (8'hb0)) ? ((8'ha1) ? (8'haa) : (8'ha3)) : (^(7'h43))) <<< (-((7'h43) < (8'hae)))) ? ((((8'hb8) ? (8'haa) : (8'ha2)) != ((8'ha1) && (8'hb3))) ^~ {(8'ha7)}) : ((((8'h9d) ? (8'hb5) : (7'h40)) >= ((8'hba) ? (8'hb1) : (8'hbe))) ? (~((8'hb8) != (7'h42))) : (((8'h9f) | (8'hb7)) + (&(8'ha6))))) : (((~&(^~(8'ha2))) ? (((8'hb9) ? (8'ha7) : (7'h41)) >>> ((8'hbc) <<< (8'hbb))) : (~|((8'hbf) ? (8'hbf) : (8'hb7)))) << ((((8'ha6) | (8'hbe)) ^ (8'ha6)) < {((7'h40) ? (8'hab) : (7'h41))}))))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire38;
  input wire [(4'h9):(1'h0)] wire37;
  input wire [(5'h14):(1'h0)] wire36;
  input wire signed [(5'h11):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire74;
  wire [(5'h14):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire76;
  wire signed [(4'hf):(1'h0)] wire77;
  wire [(2'h3):(1'h0)] wire93;
  wire [(4'hb):(1'h0)] wire95;
  wire signed [(4'hc):(1'h0)] wire96;
  wire signed [(3'h4):(1'h0)] wire97;
  wire signed [(5'h14):(1'h0)] wire98;
  wire signed [(5'h12):(1'h0)] wire99;
  wire signed [(5'h10):(1'h0)] wire100;
  wire [(5'h11):(1'h0)] wire101;
  wire signed [(5'h13):(1'h0)] wire115;
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg82 = (1'h0);
  assign y = {wire74,
                 wire39,
                 wire76,
                 wire77,
                 wire93,
                 wire95,
                 wire96,
                 wire97,
                 wire98,
                 wire99,
                 wire100,
                 wire101,
                 wire115,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 (1'h0)};
  assign wire39 = $unsigned($signed((-wire38[(2'h3):(1'h1)])));
  module40 #() modinst75 (wire74, clk, wire37, wire35, wire36, wire39, wire38);
  assign wire76 = $unsigned((~&((wire36 ? (^~wire39) : (!wire38)) ?
                      {wire38[(4'he):(4'he)]} : $unsigned((+wire37)))));
  assign wire77 = {(8'ha7),
                      ($unsigned((+(+wire36))) <<< {wire39[(5'h10):(1'h1)]})};
  always
    @(posedge clk) begin
      reg78 <= ({(!((wire39 > wire36) ? wire76 : (8'h9c))),
          wire39} >>> ((wire36 ?
          $unsigned(wire77) : (-wire74[(4'hd):(4'ha)])) | wire77[(4'hc):(3'h4)]));
      reg79 <= $unsigned($unsigned($unsigned({wire37[(4'h8):(4'h8)], wire36})));
      reg80 <= (^~((^~(^((8'hbc) < wire39))) && ($signed($unsigned(reg79)) ?
          (wire39[(4'hd):(4'ha)] ?
              (wire39 ?
                  wire77 : wire77) : wire74[(4'h9):(3'h7)]) : wire38[(5'h11):(4'h8)])));
      reg81 <= (&(wire39 == wire39[(4'h8):(2'h2)]));
      reg82 <= (($unsigned({$unsigned(wire38)}) >> ((+reg80) - wire74[(3'h4):(2'h3)])) <= ($unsigned(wire38) ?
          reg78[(3'h4):(1'h1)] : wire77));
    end
  module83 #() modinst94 (.wire87(reg79), .wire85(wire38), .wire84(wire37), .y(wire93), .wire86(reg80), .clk(clk));
  assign wire95 = (reg81 ?
                      (((reg82[(1'h1):(1'h1)] ?
                              reg82 : $signed(reg79)) + {wire39[(4'hf):(2'h2)]}) ?
                          reg82[(4'hd):(4'hc)] : wire39) : $signed({(^(&reg81)),
                          $unsigned((8'hac))}));
  assign wire96 = (wire74[(3'h7):(1'h1)] << $signed(wire39));
  assign wire97 = (wire96[(1'h1):(1'h1)] ?
                      $signed(($unsigned((reg81 ? wire96 : wire74)) ?
                          (|(wire77 ?
                              reg79 : wire93)) : $signed($unsigned(wire38)))) : $unsigned((reg78 ?
                          (~^wire36[(4'hd):(4'hb)]) : $unsigned($unsigned(wire37)))));
  assign wire98 = $unsigned(wire74);
  assign wire99 = reg79[(3'h7):(3'h4)];
  assign wire100 = {{reg80, wire97}};
  assign wire101 = (-{$unsigned(reg78[(3'h6):(3'h6)]),
                       $unsigned($unsigned(wire76))});
  module102 #() modinst116 (wire115, clk, wire39, reg78, wire101, wire36);
endmodule

module module102
#(parameter param114 = (((~^((&(8'had)) ? {(8'hb3)} : (~|(8'hb0)))) ? (|(8'ha1)) : (^~{((8'ha2) ? (8'h9f) : (7'h41)), ((8'hae) || (8'hbf))})) ^ (+((~&(~^(8'ha4))) ? (((8'hab) << (8'ha4)) < ((8'hb6) ? (8'haf) : (8'ha5))) : (((8'had) ? (8'hb4) : (8'ha4)) * (~&(8'h9f)))))))
(y, clk, wire106, wire105, wire104, wire103);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire106;
  input wire [(5'h14):(1'h0)] wire105;
  input wire signed [(5'h11):(1'h0)] wire104;
  input wire signed [(2'h3):(1'h0)] wire103;
  wire signed [(4'h9):(1'h0)] wire111;
  wire signed [(4'h8):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire109;
  wire signed [(4'hc):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire107;
  reg signed [(5'h14):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg112 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 reg113,
                 reg112,
                 (1'h0)};
  assign wire107 = $signed((wire103[(1'h0):(1'h0)] ?
                       $unsigned(wire106[(4'hd):(4'ha)]) : $signed($unsigned((wire106 + wire105)))));
  assign wire108 = (wire105[(4'he):(2'h3)] ?
                       wire107[(4'h8):(3'h4)] : (+(wire107 != $unsigned(wire107))));
  assign wire109 = (wire105 ~^ wire107[(1'h1):(1'h0)]);
  assign wire110 = {wire106[(1'h0):(1'h0)], wire109[(1'h1):(1'h1)]};
  assign wire111 = ((~&$unsigned(((wire108 ^ wire103) ?
                           $signed((8'h9d)) : wire107[(3'h7):(3'h5)]))) ?
                       $unsigned((8'ha6)) : {(((~(8'ha7)) ?
                                   (wire104 ?
                                       wire104 : wire105) : $signed(wire108)) ?
                               (^(wire107 <= wire104)) : (-(wire107 ?
                                   wire105 : (8'hb0)))),
                           {(wire104 ?
                                   (wire108 >>> (8'ha7)) : (wire106 ?
                                       (7'h43) : wire104))}});
  always
    @(posedge clk) begin
      reg112 <= wire111;
      reg113 <= wire110;
    end
endmodule

module module83  (y, clk, wire87, wire86, wire85, wire84);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire87;
  input wire [(4'he):(1'h0)] wire86;
  input wire signed [(4'hf):(1'h0)] wire85;
  input wire signed [(4'h8):(1'h0)] wire84;
  wire [(3'h5):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  wire signed [(5'h12):(1'h0)] wire89;
  wire signed [(2'h2):(1'h0)] wire88;
  assign y = {wire92, wire91, wire90, wire89, wire88, (1'h0)};
  assign wire88 = ($unsigned($signed(wire86)) != wire85);
  assign wire89 = (!wire85[(3'h6):(3'h5)]);
  assign wire90 = (~({{(wire85 >>> wire86)}} || ((|$signed((8'ha2))) - ((|(8'hae)) ?
                      $signed(wire86) : (wire87 ? wire89 : wire89)))));
  assign wire91 = {(~&($unsigned({wire87}) ?
                          {$unsigned(wire88)} : $unsigned((wire87 ?
                              wire88 : (8'had))))),
                      ({((+wire89) ? (wire90 ? wire87 : wire87) : wire85),
                              wire88[(1'h1):(1'h1)]} ?
                          wire86[(3'h4):(1'h1)] : ((~&wire90) ?
                              (((8'hbd) ? wire85 : wire86) ?
                                  wire87[(2'h3):(1'h0)] : $unsigned(wire86)) : ((wire86 ?
                                  (8'hb9) : wire85) ~^ wire90[(1'h0):(1'h0)])))};
  assign wire92 = $unsigned((-$signed((!(8'hb4)))));
endmodule

module module40
#(parameter param72 = (^(((~&((8'h9c) ? (8'h9e) : (8'hb4))) ? (((8'hb7) ? (8'hb4) : (8'hba)) ? ((8'h9c) ? (8'h9e) : (8'ha0)) : ((8'ha1) ? (8'hbc) : (8'h9f))) : (((8'hab) ? (8'ha5) : (8'ha6)) ? ((8'ha5) && (8'ha3)) : ((8'hb9) ? (8'ha0) : (8'hb3)))) ? (~((8'hb1) ? ((8'haf) ? (8'hb6) : (8'ha4)) : (8'hb4))) : ((((8'hb5) ? (8'hb0) : (8'hbe)) - (~^(8'ha4))) ? (((8'hb0) <= (8'hbe)) ? ((8'hb4) < (8'h9e)) : (&(8'hb5))) : (|{(8'hbb), (7'h41)})))), 
parameter param73 = (8'ha8))
(y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire45;
  input wire [(4'hb):(1'h0)] wire44;
  input wire [(5'h11):(1'h0)] wire43;
  input wire [(5'h14):(1'h0)] wire42;
  input wire signed [(5'h12):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire71;
  wire signed [(5'h10):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire69;
  wire signed [(4'hc):(1'h0)] wire68;
  wire [(4'ha):(1'h0)] wire67;
  wire signed [(2'h3):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire55;
  wire [(4'hb):(1'h0)] wire46;
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire55,
                 wire46,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire46 = (((({wire44, wire45} << wire45) ?
                      (+(wire42 ?
                          (8'hb9) : wire45)) : $unsigned((~&wire45))) <<< ((&(wire45 == wire42)) ?
                      (!$unsigned(wire41)) : $unsigned((~|wire45)))) ^~ $unsigned((wire43 <<< $unsigned($signed(wire43)))));
  always
    @(posedge clk) begin
      reg47 <= ((^$unsigned(wire45)) >> wire42);
      reg48 <= {($signed(((-wire43) >>> $unsigned(wire41))) & (wire42 ?
              (wire42 - wire45) : (((8'hae) == reg47) ?
                  (~|(8'hb1)) : wire42[(4'h9):(1'h0)]))),
          (({wire44[(3'h4):(1'h0)],
              reg47[(2'h3):(2'h2)]} >= (~^wire44[(3'h4):(1'h0)])) <= (!(-reg47)))};
      reg49 <= ({$signed(({wire42} > (|wire44)))} ?
          {(^{$unsigned((8'ha5)), (|wire45)})} : ((($signed(reg48) ^~ (wire42 ?
              wire45 : wire41)) == ($unsigned((8'ha4)) ?
              (&wire46) : (wire46 ^~ (8'ha9)))) && (~^wire42)));
    end
  always
    @(posedge clk) begin
      reg50 <= ($unsigned((reg49[(3'h4):(1'h1)] ?
          $signed(wire44) : ((~|(8'hb3)) | (reg49 - (8'hba))))) | {($signed(reg48[(3'h7):(1'h1)]) ?
              {(wire42 ? reg47 : reg48), (~reg48)} : wire45[(4'h8):(2'h2)])});
      reg51 <= $signed(wire42[(4'hd):(4'hd)]);
      reg52 <= $unsigned((|(~&(+$unsigned(wire42)))));
      reg53 <= (!wire46);
      reg54 <= $signed((-{(~$unsigned((8'ha6)))}));
    end
  assign wire55 = reg50[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg56 <= $signed((~^wire46[(3'h7):(1'h0)]));
      if ((&$unsigned((~$unsigned($unsigned(reg50))))))
        begin
          reg57 <= reg50[(1'h0):(1'h0)];
          if ((((((wire41 ? (8'hb9) : wire46) ?
                  $signed(wire41) : reg48[(2'h2):(2'h2)]) ?
              reg56 : reg57) ^ reg50[(1'h0):(1'h0)]) && (^~(8'hb6))))
            begin
              reg58 <= $signed((~^wire45[(4'h8):(3'h5)]));
              reg59 <= (reg58 ?
                  ({wire41} ?
                      (-$unsigned($unsigned(reg53))) : $unsigned(reg57)) : reg48[(3'h4):(3'h4)]);
              reg60 <= (8'hb4);
              reg61 <= ($unsigned(wire41) ?
                  (reg54 <<< {({wire45, reg60} ?
                          (~&reg52) : (&wire46))}) : $unsigned(((wire44 ?
                          reg53 : ((8'hb8) != wire42)) ?
                      $unsigned(reg51) : $unsigned(wire44))));
              reg62 <= reg52[(1'h1):(1'h0)];
            end
          else
            begin
              reg58 <= $unsigned(((~&(^wire43)) ?
                  $signed(reg56[(1'h0):(1'h0)]) : reg59));
              reg59 <= (^~({($signed(reg48) > (reg61 & wire46)),
                      (~reg48[(4'hc):(1'h1)])} ?
                  $signed({$signed((8'hb4))}) : $unsigned($signed($signed(reg50)))));
              reg60 <= wire43[(4'h9):(2'h2)];
            end
          reg63 <= $signed((~|$unsigned((8'h9f))));
          reg64 <= reg49;
        end
      else
        begin
          reg57 <= $signed((~|(^~$unsigned($unsigned(wire41)))));
          reg58 <= ((!$signed(($unsigned(reg63) ?
              reg61 : wire44[(2'h2):(1'h1)]))) - (+$signed(reg64)));
          if ((^~((reg63 - {$signed(reg58)}) ?
              (reg61[(3'h6):(2'h2)] ~^ (^wire43)) : reg50[(2'h2):(1'h1)])))
            begin
              reg59 <= wire41[(2'h2):(1'h0)];
              reg60 <= $unsigned($unsigned(reg60));
              reg61 <= (~^wire41);
            end
          else
            begin
              reg59 <= $signed((!{wire55}));
              reg60 <= wire43[(4'hc):(3'h7)];
              reg61 <= (((+reg51) ?
                      $signed($signed($unsigned((8'ha3)))) : (+((8'hb3) ?
                          (reg64 ? reg47 : reg49) : {reg47, reg51}))) ?
                  ({(wire41[(5'h12):(4'ha)] != reg59), (&$unsigned(reg53))} ?
                      ($signed((~&wire41)) && $signed(((8'hbc) ?
                          reg63 : (7'h40)))) : $signed($signed(reg61[(3'h4):(3'h4)]))) : (reg58 << ($signed((8'h9e)) <= (reg62 || $unsigned(wire41)))));
              reg62 <= $signed(reg48[(2'h2):(1'h1)]);
              reg63 <= (wire45 ?
                  (($signed((^(8'hbe))) ? $unsigned({reg58, reg54}) : wire44) ?
                      (~|(-(wire43 + reg64))) : (((8'had) ?
                              ((8'ha8) ? reg50 : reg49) : (^wire43)) ?
                          (((8'hab) ? (8'h9c) : reg49) ?
                              {(8'h9d)} : $signed(reg49)) : (-{wire42,
                              reg60}))) : wire42);
            end
          reg64 <= reg47;
        end
    end
  assign wire65 = $unsigned((reg58[(4'hb):(3'h6)] || ((8'hae) - wire46)));
  assign wire66 = ($signed($unsigned(reg47)) ?
                      ($unsigned(wire46[(3'h7):(1'h1)]) ?
                          ($signed($signed(wire45)) == {reg56[(1'h0):(1'h0)]}) : (^{(!reg51),
                              (wire41 || wire45)})) : (reg47 != ((reg50 ?
                          (reg61 ?
                              reg49 : (8'hb0)) : reg64[(5'h10):(4'hc)]) >= reg53[(3'h5):(1'h0)])));
  assign wire67 = wire42;
  assign wire68 = ($unsigned((~{(reg64 ^ (8'ha5)), wire43})) ?
                      reg50[(1'h0):(1'h0)] : $unsigned(reg59));
  assign wire69 = (reg59 ?
                      (8'haf) : (($signed($unsigned(reg59)) ^~ (((8'haf) * wire65) ?
                              (8'h9e) : $unsigned(reg52))) ?
                          ((+{wire42, reg60}) ?
                              $unsigned(reg63[(3'h5):(1'h0)]) : $unsigned((|wire46))) : reg52[(3'h6):(1'h0)]));
  assign wire70 = $signed(($unsigned(reg54[(3'h5):(1'h1)]) ?
                      (wire41[(2'h2):(1'h0)] ?
                          {(wire66 >> wire65),
                              $unsigned(wire69)} : wire42[(3'h6):(3'h4)]) : $signed((&reg58[(2'h2):(1'h1)]))));
  assign wire71 = {$signed((($signed(wire67) <= (&wire66)) > ((~reg59) ?
                          $signed(reg53) : {reg64}))),
                      (($signed($unsigned(wire45)) ?
                          {$unsigned((8'hb5))} : (+$signed(wire70))) * $unsigned($unsigned($signed(wire45))))};
endmodule
