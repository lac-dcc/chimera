module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire115;
  wire [(5'h10):(1'h0)] wire114;
  wire [(4'he):(1'h0)] wire113;
  wire [(5'h13):(1'h0)] wire112;
  wire [(4'hc):(1'h0)] wire111;
  wire [(4'he):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire109;
  wire [(4'he):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg [(4'h8):(1'h0)] reg107 = (1'h0);
  reg [(4'hd):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire104,
                 wire102,
                 wire7,
                 wire6,
                 wire5,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 (1'h0)};
  assign wire5 = (((-((^~wire0) & wire0[(4'hb):(2'h2)])) & wire2) || (-(~(wire1[(3'h7):(2'h3)] ?
                     wire2[(4'hb):(1'h0)] : (wire1 || wire0)))));
  assign wire6 = (8'ha2);
  assign wire7 = wire5;
  module8 #() modinst103 (wire102, clk, wire0, wire7, wire1, wire5);
  assign wire104 = (|$signed(wire4));
  always
    @(posedge clk) begin
      reg105 <= $signed((|$unsigned($unsigned((wire7 ? wire102 : wire102)))));
      reg106 <= wire4[(5'h11):(2'h2)];
      reg107 <= $unsigned($signed({(^~$signed(wire2)),
          (^~(reg106 ? wire3 : wire6))}));
      reg108 <= (wire2 || $unsigned($signed(wire7)));
    end
  assign wire109 = (wire1 ?
                       wire1 : ($signed($signed((^~reg107))) ^~ {wire4[(4'he):(2'h3)],
                           wire0[(3'h7):(1'h1)]}));
  assign wire110 = (((wire102[(1'h1):(1'h1)] ?
                           (|wire109[(3'h6):(3'h5)]) : (wire1 ?
                               wire6 : (wire4 - wire1))) ?
                       ((wire102 ?
                           (wire1 && wire0) : $unsigned(wire102)) == (((8'h9d) ?
                               (8'haf) : wire5) ?
                           (wire4 != (8'ha1)) : reg107[(1'h0):(1'h0)])) : (((reg108 ?
                               wire7 : (7'h42)) ?
                           {wire3,
                               wire2} : wire102[(3'h4):(1'h0)]) >>> $signed((8'ha0)))) > (($signed(((7'h41) ?
                       reg108 : wire1)) << wire2) <<< wire3[(5'h13):(1'h0)]));
  assign wire111 = ((8'hb2) || (~(reg106 ?
                       ((8'ha6) ? (~^(8'hac)) : reg108) : wire109)));
  assign wire112 = wire1[(5'h12):(5'h10)];
  assign wire113 = (((wire110[(4'h8):(2'h2)] ~^ $unsigned($signed((8'hbc)))) ?
                           (~&(!wire3[(5'h11):(5'h11)])) : $signed(wire0[(3'h6):(2'h2)])) ?
                       $unsigned(((^~(^~reg108)) ?
                           ($unsigned(wire6) ?
                               (~^(8'hac)) : (^(8'hb4))) : ($unsigned(wire102) ?
                               wire4 : wire109))) : (~^((|$signed(reg105)) <<< $signed(reg105))));
  assign wire114 = wire6[(5'h12):(1'h0)];
  assign wire115 = (($unsigned($signed($unsigned(wire3))) ?
                       $signed(wire3[(5'h12):(5'h11)]) : {wire6[(3'h6):(2'h2)]}) >= (~&reg107));
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire12;
  input wire [(5'h12):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire101;
  wire [(3'h6):(1'h0)] wire100;
  wire signed [(4'ha):(1'h0)] wire99;
  wire signed [(4'he):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire97;
  wire [(2'h2):(1'h0)] wire96;
  wire [(4'hd):(1'h0)] wire92;
  wire signed [(4'h9):(1'h0)] wire91;
  wire signed [(5'h12):(1'h0)] wire90;
  wire signed [(3'h7):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire87;
  wire [(5'h12):(1'h0)] wire13;
  reg [(2'h2):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(4'hd):(1'h0)] reg93 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire87,
                 wire13,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  assign wire13 = $signed(wire11[(4'h8):(3'h7)]);
  module14 #() modinst88 (.clk(clk), .wire15(wire12), .wire17(wire10), .wire16(wire11), .wire18(wire13), .y(wire87));
  assign wire89 = {$signed(wire13[(4'hb):(4'ha)])};
  assign wire90 = wire13;
  assign wire91 = ((({$signed(wire9)} ?
                          $unsigned((~^wire87)) : $unsigned(wire12[(3'h7):(3'h6)])) ?
                      wire87[(2'h2):(1'h0)] : $signed($unsigned((8'ha8)))) | $signed($signed((wire11[(4'h8):(2'h2)] && {(8'haf)}))));
  assign wire92 = (^~{(~&wire87[(1'h0):(1'h0)])});
  always
    @(posedge clk) begin
      reg93 <= (wire89 + {wire13});
      reg94 <= wire92[(2'h2):(2'h2)];
      reg95 <= $unsigned($signed((wire12 ?
          {wire11[(2'h2):(1'h1)], wire11[(5'h12):(4'hb)]} : ($unsigned(reg94) ?
              (reg93 > wire89) : {wire91, wire12}))));
    end
  assign wire96 = {reg95};
  assign wire97 = $unsigned((~|(8'ha6)));
  assign wire98 = $signed((8'hb4));
  assign wire99 = $unsigned(((^$unsigned(((7'h41) ? wire97 : wire91))) ?
                      reg95 : ($unsigned({wire89}) ?
                          (~wire12) : ((|reg95) ?
                              {(8'hb9)} : $signed((8'haa))))));
  assign wire100 = (({(!{(8'hb2)}),
                       reg95} & $signed((~$signed((8'hb7))))) < $signed(wire12[(4'ha):(1'h0)]));
  assign wire101 = $signed($unsigned(wire98));
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h2c8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire18;
  input wire signed [(4'h8):(1'h0)] wire17;
  input wire [(5'h12):(1'h0)] wire16;
  input wire signed [(2'h2):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire86;
  wire signed [(3'h5):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire61;
  wire [(3'h5):(1'h0)] wire60;
  wire [(3'h4):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  reg signed [(4'hb):(1'h0)] reg84 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg83 = (1'h0);
  reg [(4'hb):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(4'hb):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire61,
                 wire60,
                 wire44,
                 wire43,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire20,
                 wire19,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg59,
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
                 reg46,
                 reg45,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire19 = wire15[(1'h1):(1'h1)];
  assign wire20 = $signed(({$signed(wire18)} ?
                      $signed($unsigned((wire15 <= (8'hb1)))) : wire17[(3'h7):(1'h0)]));
  always
    @(posedge clk) begin
      reg21 <= wire20;
      reg22 <= ($unsigned((8'hb3)) ? reg21 : wire19[(1'h1):(1'h1)]);
    end
  assign wire23 = ($unsigned({$unsigned(wire17[(3'h5):(1'h1)]),
                      ((~^wire18) ^~ (-wire19))}) * $signed(wire18));
  assign wire24 = (({{$signed(wire19), (8'h9e)},
                          (!$unsigned(wire16))} || wire18[(2'h3):(1'h1)]) ?
                      ($unsigned(((wire17 ? (8'hb7) : wire15) ~^ {reg21,
                              wire15})) ?
                          (((reg21 >= reg22) ?
                                  (wire15 && wire15) : (wire20 ?
                                      wire20 : wire16)) ?
                              $signed(wire18[(1'h1):(1'h1)]) : $unsigned(wire16[(4'hd):(3'h5)])) : (wire15[(1'h1):(1'h0)] ?
                              (-(wire15 ?
                                  reg21 : reg22)) : $unsigned((|wire23)))) : wire17);
  assign wire25 = $signed($signed(wire15));
  assign wire26 = ((~wire25[(4'hb):(1'h0)]) ~^ ((-(|(wire25 ?
                      wire20 : reg22))) <<< $unsigned($unsigned(wire16))));
  assign wire27 = {{{$unsigned({wire17})}, $signed(wire17)}};
  assign wire28 = wire18;
  assign wire29 = $signed(wire18[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg30 <= ($unsigned(reg21[(3'h6):(2'h2)]) < (^~{$unsigned(wire26[(2'h3):(2'h3)]),
          (8'ha5)}));
      if ($unsigned((reg22 ^ (~|{((8'hb7) <= wire28), $unsigned(wire24)}))))
        begin
          reg31 <= ($signed(wire17[(3'h7):(2'h3)]) == ($unsigned(wire17) >>> ($unsigned((|wire27)) ?
              $signed($unsigned(wire15)) : wire23)));
          if ($unsigned(($unsigned($signed($unsigned(wire24))) ?
              {wire24, {(wire19 * wire20), (wire17 != (8'haa))}} : wire27)))
            begin
              reg32 <= (wire28[(3'h5):(1'h0)] != $unsigned($signed((&(wire16 ?
                  wire19 : wire15)))));
              reg33 <= $signed(($unsigned((wire24 || (wire20 ?
                      wire29 : wire29))) ?
                  (^~$unsigned({wire17, reg21})) : $signed($unsigned((wire25 ?
                      reg32 : wire19)))));
              reg34 <= wire28[(4'hc):(4'hc)];
            end
          else
            begin
              reg32 <= ($unsigned((^((wire27 * wire17) << wire28))) ~^ $signed(wire29[(1'h0):(1'h0)]));
              reg33 <= reg21;
              reg34 <= ((($unsigned(reg33[(2'h2):(2'h2)]) ?
                  ($signed(wire24) ?
                      wire20[(4'hd):(1'h1)] : (~^reg34)) : $unsigned($signed(wire18))) >> wire23) * (+wire27[(4'hd):(3'h6)]));
              reg35 <= wire18[(1'h0):(1'h0)];
              reg36 <= {(8'ha8),
                  ($unsigned((wire15 ?
                      {(8'hba), wire25} : {(8'hbc),
                          wire16})) < $unsigned(wire18[(1'h1):(1'h0)]))};
            end
          if ((($signed($signed(reg21)) >> ($unsigned(wire19[(2'h2):(1'h1)]) ?
                  wire20 : $unsigned(reg34[(3'h5):(1'h1)]))) ?
              {wire24,
                  (~&(((8'hbe) > wire26) ?
                      $signed(reg30) : $unsigned(wire16)))} : ($signed((~&wire29)) - ((+(reg35 >= wire15)) ?
                  $signed((wire27 ? wire29 : reg33)) : $signed(reg21)))))
            begin
              reg37 <= $unsigned({$unsigned((8'hb1)),
                  (wire19 ? $signed(reg32) : reg36[(4'hd):(4'ha)])});
              reg38 <= $signed({(reg30[(1'h1):(1'h0)] - ((wire28 ?
                      reg34 : wire25) >>> (reg30 << wire20))),
                  (^wire24)});
              reg39 <= ((^wire26) ?
                  $unsigned($unsigned(wire26)) : $signed(reg38[(4'h8):(1'h1)]));
            end
          else
            begin
              reg37 <= (reg33[(1'h1):(1'h0)] >> wire20[(4'hf):(4'h8)]);
              reg38 <= $signed(($signed((reg33 || wire19)) * $signed(wire25)));
              reg39 <= $signed($signed((reg33[(2'h3):(2'h3)] && reg39)));
              reg40 <= (((wire23 ?
                  (&(wire26 < reg38)) : (^~$signed(reg36))) >>> (wire25[(1'h1):(1'h1)] ?
                  ((reg37 ? (8'hb1) : wire15) ?
                      $unsigned(wire29) : (!reg30)) : reg35[(4'h8):(4'h8)])) <= {(-(~(reg33 ?
                      wire29 : wire27)))});
            end
          reg41 <= (((8'ha6) ?
              {$signed(reg39)} : (|{(!wire17),
                  (wire15 ? wire18 : reg40)})) * ((8'h9e) ?
              {{wire15}} : reg36[(3'h5):(1'h0)]));
          reg42 <= (~(~&$unsigned(wire17[(4'h8):(2'h2)])));
        end
      else
        begin
          reg31 <= reg35[(2'h3):(2'h3)];
        end
    end
  assign wire43 = (+$signed(reg35));
  assign wire44 = wire17;
  always
    @(posedge clk) begin
      if ((reg34[(4'hf):(4'ha)] ?
          $signed($unsigned($unsigned((reg22 ?
              wire15 : wire43)))) : $signed(wire20)))
        begin
          reg45 <= ($unsigned($unsigned(wire26[(2'h3):(1'h0)])) >> reg30[(2'h3):(2'h2)]);
          if ((-wire27))
            begin
              reg46 <= (wire16[(4'hc):(4'hc)] ?
                  $signed({(wire26[(2'h2):(1'h1)] ?
                          (reg38 ? (8'haf) : wire24) : ((8'hbf) ?
                              reg32 : wire17)),
                      (^(reg38 & reg31))}) : $unsigned(((&wire20) ?
                      ((&reg34) || (wire17 ?
                          reg42 : reg36)) : (wire17 ^~ (wire15 ?
                          reg41 : reg21)))));
              reg47 <= ($unsigned($unsigned(reg36)) ?
                  ((reg33 << $signed((wire23 | reg42))) ?
                      ((^(^~wire18)) ?
                          (wire44[(3'h4):(2'h3)] ?
                              {wire19, wire23} : (reg39 ?
                                  reg41 : reg22)) : {(reg31 && wire27),
                              (8'hb5)}) : $signed($unsigned($unsigned(wire18)))) : $signed($signed((wire19 ?
                      $unsigned(wire15) : {(8'hbc)}))));
              reg48 <= (+(wire27[(1'h0):(1'h0)] ?
                  reg36 : $signed(($signed(wire19) ?
                      (-wire18) : $signed(wire16)))));
            end
          else
            begin
              reg46 <= wire16;
            end
          reg49 <= wire17;
          if ((($signed(reg37) != ($unsigned($unsigned(reg21)) ?
                  ($unsigned((8'ha8)) && {wire28}) : ({wire17,
                      (8'hbb)} || $unsigned(reg40)))) ?
              (!reg40) : reg33[(1'h1):(1'h1)]))
            begin
              reg50 <= (&($signed((&$unsigned(wire29))) | wire18));
              reg51 <= (~|(+reg21[(3'h7):(1'h1)]));
              reg52 <= wire19[(2'h2):(1'h0)];
              reg53 <= $unsigned({wire15[(2'h2):(1'h0)],
                  (-$signed((reg52 ? reg42 : reg48)))});
            end
          else
            begin
              reg50 <= $unsigned(((((8'hbe) ? $unsigned(reg35) : wire20) ?
                  $unsigned($unsigned(reg51)) : {$unsigned(wire20),
                      (wire16 ?
                          reg33 : reg45)}) > ((+(wire27 >= wire15)) == ((8'hb6) ?
                  reg45[(3'h5):(3'h5)] : $signed((8'ha1))))));
              reg51 <= (!{$unsigned({(wire18 ? (8'hbe) : (8'hb5)),
                      (reg46 ? reg50 : (8'h9e))}),
                  reg50});
              reg52 <= (($signed({$signed((8'hb4)), $signed(reg45)}) ?
                      (8'hba) : (~^$unsigned((wire19 ? wire43 : reg36)))) ?
                  (8'h9e) : reg42);
              reg53 <= $signed($unsigned((((reg30 ?
                      reg53 : reg42) == (|reg37)) ?
                  {(reg51 ? reg21 : wire26)} : ({reg30} | wire27))));
              reg54 <= ((reg21 == (~&reg38)) > reg49);
            end
          reg55 <= wire16[(4'hb):(1'h1)];
        end
      else
        begin
          reg45 <= (8'ha2);
          reg46 <= (8'hbe);
        end
      reg56 <= reg46;
      if (reg54)
        begin
          reg57 <= wire23[(1'h0):(1'h0)];
          reg58 <= ($unsigned(($signed($unsigned(wire16)) ?
                  ((reg56 ? reg50 : (8'ha9)) ?
                      wire43 : wire18[(3'h4):(2'h3)]) : (8'hbe))) ?
              (^~(reg35[(2'h2):(1'h1)] <<< reg55)) : $unsigned(wire28[(4'hc):(3'h7)]));
          reg59 <= ($unsigned($signed(((reg32 >>> wire17) || $signed(reg57)))) * (({$signed(wire18)} ?
              (reg50[(1'h1):(1'h1)] ?
                  reg39 : $signed((8'hb3))) : {(reg48 <= reg50)}) && $signed((wire25[(4'h9):(2'h3)] ^ (~&reg34)))));
        end
      else
        begin
          reg57 <= {(~|($unsigned((reg54 ?
                  wire43 : wire43)) <= (reg49[(1'h1):(1'h1)] | reg46[(3'h6):(2'h3)])))};
        end
    end
  assign wire60 = ($unsigned(reg57[(4'h8):(3'h7)]) ?
                      reg32[(2'h3):(1'h1)] : wire19[(3'h4):(1'h0)]);
  assign wire61 = (^reg47[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if (($signed({$signed(reg36[(4'he):(1'h1)]),
          $signed((reg59 ?
              reg49 : wire17))}) || ($signed((^~wire28)) < (8'hae))))
        begin
          reg62 <= ($unsigned($unsigned(reg37)) ?
              $unsigned(reg54[(1'h0):(1'h0)]) : ($signed(wire60[(3'h4):(2'h3)]) ^~ $unsigned((reg57[(3'h5):(3'h5)] ?
                  reg46[(3'h7):(3'h4)] : (!reg40)))));
        end
      else
        begin
          if ($unsigned(wire18))
            begin
              reg62 <= $unsigned($signed($signed(wire16)));
              reg63 <= ($unsigned($signed($unsigned((reg54 ~^ wire15)))) ?
                  (reg36[(5'h10):(4'h8)] ?
                      ({(reg37 ? (8'hbf) : wire28)} > (~^(reg30 ?
                          reg59 : reg55))) : (((~&reg47) & reg48) ?
                          $unsigned(wire60[(3'h4):(1'h1)]) : $unsigned((reg32 ?
                              reg51 : (8'hba))))) : (~|{(8'ha1), reg46}));
            end
          else
            begin
              reg62 <= $unsigned($signed(($unsigned($signed(reg63)) == {(~|(8'hb6))})));
              reg63 <= $unsigned((reg55[(4'hb):(3'h6)] ?
                  $unsigned(((reg32 ?
                      wire20 : reg42) * (-(8'hb1)))) : (|($unsigned((8'hb3)) ~^ (wire61 > wire26)))));
              reg64 <= {(reg34[(4'ha):(2'h3)] ?
                      wire18 : (!reg55[(2'h3):(1'h1)])),
                  ($signed({(~|wire44)}) != $signed((~^$signed(reg39))))};
              reg65 <= ($signed($signed(reg56[(4'hb):(3'h5)])) ?
                  reg35[(1'h0):(1'h0)] : reg45[(1'h1):(1'h1)]);
              reg66 <= $signed(reg55[(3'h7):(3'h5)]);
            end
          if ($unsigned(reg36))
            begin
              reg67 <= $unsigned(({(~^reg66[(1'h0):(1'h0)]),
                  reg55} >= ((reg22[(3'h6):(3'h4)] ~^ (wire60 ?
                      wire17 : (8'ha7))) ?
                  $signed($unsigned(reg46)) : wire60[(3'h4):(2'h2)])));
              reg68 <= reg49[(1'h0):(1'h0)];
              reg69 <= (reg49 != {(reg31 || $signed($unsigned(reg65)))});
              reg70 <= wire16[(4'h8):(3'h4)];
            end
          else
            begin
              reg67 <= reg57[(3'h4):(1'h1)];
              reg68 <= wire23[(3'h4):(3'h4)];
              reg69 <= reg41;
              reg70 <= $signed($signed((wire17[(3'h6):(2'h3)] ?
                  {(reg58 ? reg52 : wire28),
                      $signed((8'hb4))} : {reg54[(4'h9):(4'h9)]})));
            end
          if ((reg55 ^ $signed((|$signed($unsigned(wire44))))))
            begin
              reg71 <= {reg54[(4'hc):(4'h8)]};
              reg72 <= (&{reg70,
                  ($signed(wire44[(1'h1):(1'h0)]) ?
                      $unsigned($unsigned(reg66)) : $unsigned((|(8'hbc))))});
              reg73 <= reg50[(4'hc):(3'h5)];
            end
          else
            begin
              reg71 <= (&{($signed((reg32 ?
                      (8'ha8) : reg36)) >> $signed((&reg59)))});
              reg72 <= reg38;
            end
        end
      reg74 <= $signed(reg30);
      if ((reg21 != reg45[(3'h5):(1'h0)]))
        begin
          reg75 <= {$unsigned({$signed($unsigned(wire27))}), wire29};
          reg76 <= ((~&reg72[(4'hb):(4'hb)]) ?
              $unsigned((|wire15[(1'h1):(1'h0)])) : ($signed(((reg65 >= reg55) ?
                  (reg31 ?
                      (8'hbe) : reg65) : wire20)) ~^ reg63[(1'h0):(1'h0)]));
          reg77 <= (($unsigned(reg56) || {((+(8'h9f)) >= reg71)}) ?
              ((wire29 ?
                  $unsigned((reg56 ?
                      reg51 : reg66)) : $signed($signed(reg32))) >> reg68) : $signed(reg76));
          reg78 <= ($signed(reg65) || (^~reg34[(4'ha):(2'h3)]));
        end
      else
        begin
          reg75 <= {reg47[(1'h1):(1'h1)],
              ($unsigned($unsigned((~&wire28))) >= (&reg62[(3'h5):(2'h3)]))};
          reg76 <= reg78;
          reg77 <= ((~&wire60[(2'h3):(2'h3)]) * ({wire27} ? reg77 : (~reg58)));
        end
      if ($signed(wire16[(4'h8):(4'h8)]))
        begin
          reg79 <= reg64[(2'h3):(2'h3)];
          reg80 <= (8'haf);
          reg81 <= $signed($signed(wire17));
          reg82 <= $signed(wire26);
          reg83 <= (7'h41);
        end
      else
        begin
          reg79 <= (~^wire25[(4'h9):(3'h4)]);
          reg80 <= (~&reg55[(2'h3):(1'h0)]);
          reg81 <= reg58;
        end
      reg84 <= $signed($unsigned(reg79));
    end
  assign wire85 = $unsigned((~&{(reg35[(4'h8):(3'h7)] ^ $signed(wire16)),
                      ((reg83 >= wire20) > $unsigned(wire60))}));
  assign wire86 = $signed($signed((wire60 ?
                      reg79[(2'h2):(1'h0)] : ((reg74 ? reg50 : reg70) ?
                          (8'had) : (~^(8'h9f))))));
endmodule
