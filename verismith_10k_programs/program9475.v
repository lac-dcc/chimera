module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire131;
  wire [(4'hb):(1'h0)] wire130;
  wire [(5'h13):(1'h0)] wire129;
  wire [(3'h7):(1'h0)] wire128;
  wire [(4'ha):(1'h0)] wire127;
  wire [(5'h15):(1'h0)] wire125;
  wire signed [(5'h14):(1'h0)] wire4;
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire125,
                 wire4,
                 (1'h0)};
  assign wire4 = $unsigned((~$unsigned((~wire1))));
  module5 #() modinst126 (wire125, clk, wire2, wire4, wire3, wire0);
  assign wire127 = ((~|$signed($signed($signed(wire1)))) != {{((&wire4) ?
                               wire2[(3'h4):(1'h0)] : wire2),
                           (wire2 ? wire2[(4'hd):(2'h2)] : $unsigned(wire0))}});
  assign wire128 = {$unsigned(($signed((!wire0)) ? {(~wire0)} : wire127))};
  assign wire129 = (wire125[(4'hd):(1'h0)] >> $signed({$unsigned({wire128}),
                       ((|wire125) ?
                           wire128[(2'h3):(1'h0)] : $signed((7'h40)))}));
  assign wire130 = wire129;
  assign wire131 = $unsigned(({(~^wire128[(2'h3):(1'h0)]),
                           wire125[(3'h4):(1'h1)]} ?
                       wire128[(2'h2):(2'h2)] : $signed((+$signed(wire2)))));
endmodule

module module5
#(parameter param124 = ((-{((~^(8'ha9)) ? ((8'hb0) != (8'ha6)) : (^~(8'hbc))), (~((8'ha2) ? (8'hb0) : (8'h9c)))}) ? ((~(+((8'hba) ? (8'hbb) : (8'ha8)))) <= ((((8'had) ? (8'hab) : (8'haa)) ? (~&(8'hb5)) : (&(8'h9c))) >= (((8'hb4) ? (8'hb5) : (8'haf)) ? ((8'hb1) ? (8'hba) : (7'h41)) : ((8'hbb) > (7'h43))))) : (+((~&(~&(8'hb7))) ? ((^(8'ha8)) != ((8'h9e) ? (7'h43) : (8'hae))) : (~((8'ha4) ? (8'hb1) : (8'ha7)))))))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire6;
  input wire [(5'h14):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire123;
  wire [(3'h5):(1'h0)] wire122;
  wire [(3'h6):(1'h0)] wire121;
  wire signed [(4'he):(1'h0)] wire119;
  wire [(5'h14):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire69;
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire119,
                 wire10,
                 wire11,
                 wire69,
                 (1'h0)};
  assign wire10 = (^~wire7);
  assign wire11 = $signed(wire8);
  module12 #() modinst70 (wire69, clk, wire6, wire7, wire9, wire10, wire8);
  module71 #() modinst120 (wire119, clk, wire6, wire8, wire10, wire7);
  assign wire121 = ((((wire119 ? (8'hb9) : (-wire8)) ?
                           (((8'had) ? wire11 : wire119) ?
                               (^~(8'hb4)) : $signed(wire8)) : (|wire11)) + (8'hbc)) ?
                       wire119[(2'h2):(1'h0)] : (~&$signed($signed((8'ha3)))));
  assign wire122 = $signed((^((8'ha2) ?
                       {(~|wire7),
                           $signed(wire121)} : (((8'ha6) <= (8'hb8)) ^~ wire121))));
  assign wire123 = {$unsigned($signed(wire6[(4'ha):(3'h4)]))};
endmodule

module module71
#(parameter param117 = {{{{((8'hb0) ? (7'h44) : (8'hbd))}}, (~&((~&(8'hb3)) ? (7'h41) : ((8'hab) ? (8'hba) : (8'hab))))}, (|((-(~^(8'hbd))) ? ({(8'ha4), (7'h43)} & {(8'haa), (8'ha2)}) : (((8'hb9) ? (8'haf) : (7'h42)) ? ((8'ha4) ~^ (8'hb0)) : (8'ha9))))}, 
parameter param118 = ((param117 != param117) << ((-(param117 ? {param117, param117} : ((8'ha3) ? param117 : param117))) ? ((((8'hba) << param117) ? (-(8'h9f)) : ((8'h9e) >>> param117)) ? param117 : (~(param117 - param117))) : (((|param117) - (~(8'ha8))) << ((param117 == param117) >>> (param117 * param117))))))
(y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'h21d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire75;
  input wire signed [(5'h11):(1'h0)] wire74;
  input wire signed [(2'h2):(1'h0)] wire73;
  input wire signed [(4'h9):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire112;
  wire signed [(4'hc):(1'h0)] wire111;
  wire [(4'hf):(1'h0)] wire110;
  wire signed [(2'h2):(1'h0)] wire109;
  wire [(2'h3):(1'h0)] wire108;
  wire [(3'h7):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire77;
  wire [(4'hc):(1'h0)] wire76;
  reg signed [(5'h13):(1'h0)] reg116 = (1'h0);
  reg [(3'h7):(1'h0)] reg115 = (1'h0);
  reg [(4'hc):(1'h0)] reg114 = (1'h0);
  reg [(5'h10):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg [(4'hf):(1'h0)] reg105 = (1'h0);
  reg [(5'h15):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg101 = (1'h0);
  reg [(4'hf):(1'h0)] reg100 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg96 = (1'h0);
  reg [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg94 = (1'h0);
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg92 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  reg [(5'h10):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg84 = (1'h0);
  reg [(4'h9):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg107,
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
                 (1'h0)};
  assign wire76 = ((7'h44) ? wire72 : (|wire75));
  assign wire77 = (!(wire74 ?
                      (wire72 != (^~$signed(wire73))) : (wire72[(4'h8):(3'h7)] * (~|$unsigned(wire74)))));
  assign wire78 = (-$signed(((^(wire73 > wire76)) >= ((-wire72) ?
                      $unsigned(wire75) : (wire73 ? (8'h9f) : wire73)))));
  assign wire79 = {$signed($signed(((~wire76) ?
                          (wire74 ? wire74 : (8'hb1)) : $unsigned(wire78)))),
                      $unsigned({$signed({wire74}), {{(7'h40)}, (8'ha9)}})};
  assign wire80 = wire74;
  always
    @(posedge clk) begin
      reg81 <= ((((~^{(8'haa)}) && ($signed(wire80) ?
              (wire77 ? wire79 : wire78) : (&wire78))) == $signed(wire72)) ?
          (~&{((wire80 ? wire74 : wire77) <<< wire76)}) : $signed({wire76,
              $signed(wire80[(3'h7):(3'h5)])}));
      reg82 <= (~($signed($signed(wire78)) ~^ (((wire75 ?
              wire79 : (8'ha8)) * wire80[(3'h5):(1'h0)]) ?
          $signed($unsigned(wire80)) : $unsigned((wire73 ? wire77 : wire78)))));
      reg83 <= {$unsigned(wire78)};
      reg84 <= (($signed(wire73[(2'h2):(1'h0)]) ?
          (!((~&wire72) ?
              {wire74} : (-wire79))) : wire75[(1'h1):(1'h0)]) ^~ (($unsigned($unsigned(wire76)) ?
          wire77 : (~^((8'had) == (8'ha9)))) == $unsigned(reg83[(3'h6):(2'h2)])));
      reg85 <= reg84;
    end
  always
    @(posedge clk) begin
      if (wire73[(1'h0):(1'h0)])
        begin
          reg86 <= (wire79[(1'h1):(1'h0)] ^ (^~wire77));
          if (($unsigned((~&((wire72 > reg84) < $unsigned(reg84)))) != wire75))
            begin
              reg87 <= {$unsigned(($signed((wire75 ^ reg82)) ~^ (8'hb2))),
                  $unsigned(reg82[(4'hc):(4'hc)])};
              reg88 <= ($signed((((reg87 ? reg81 : reg83) ?
                  $unsigned(wire78) : (wire77 ?
                      reg81 : wire79)) * $signed(wire75))) - {({{wire79,
                              wire80}} ?
                      $unsigned($unsigned(wire73)) : {$unsigned((8'hb3)),
                          (~&wire73)})});
            end
          else
            begin
              reg87 <= $signed(wire78[(3'h6):(3'h5)]);
            end
          reg89 <= reg83[(4'h8):(2'h3)];
          reg90 <= (+reg86[(3'h5):(3'h4)]);
        end
      else
        begin
          reg86 <= reg90;
          if ($signed($unsigned($signed($signed((8'haa))))))
            begin
              reg87 <= (~reg90);
              reg88 <= reg84;
              reg89 <= wire78[(5'h11):(4'h8)];
              reg90 <= $unsigned($signed(reg82[(4'ha):(4'ha)]));
            end
          else
            begin
              reg87 <= (wire80 && {wire75});
              reg88 <= (~{((+(reg89 ?
                      wire74 : (8'hbf))) << (wire79 ^~ $signed(wire77)))});
              reg89 <= reg90[(1'h0):(1'h0)];
              reg90 <= $signed(($signed(((reg88 ^~ (8'hb1)) || (7'h44))) ?
                  wire79[(2'h3):(2'h2)] : ({$unsigned(reg88)} ~^ (8'h9d))));
              reg91 <= $signed(reg85[(4'he):(4'hc)]);
            end
          reg92 <= {($signed(($signed(reg89) <<< (reg83 ? (8'ha7) : wire79))) ?
                  $unsigned($unsigned($unsigned(reg91))) : (~&(reg84[(2'h3):(1'h0)] ?
                      (!reg86) : (8'hba))))};
          reg93 <= reg85;
          reg94 <= ($unsigned($unsigned(reg90)) || reg90);
        end
      reg95 <= $signed($unsigned(((reg90[(1'h1):(1'h1)] ?
          {wire72} : reg85[(4'h9):(4'h8)]) ^ reg86)));
    end
  always
    @(posedge clk) begin
      if (wire74)
        begin
          reg96 <= wire74;
          reg97 <= $unsigned(((-(~$unsigned(wire80))) ?
              (reg89[(4'hf):(1'h1)] ?
                  reg91[(4'hd):(3'h7)] : wire78[(4'he):(4'ha)]) : ((reg88[(4'hb):(3'h7)] ?
                      wire79 : $signed(reg84)) ?
                  reg92 : $unsigned({wire73}))));
          if (((reg96 >>> ($unsigned($signed(reg96)) ?
                  $unsigned((reg85 | reg91)) : $unsigned((-reg94)))) ?
              $signed(wire78[(4'h8):(3'h4)]) : $unsigned(reg89[(4'he):(3'h6)])))
            begin
              reg98 <= ((~^(~^({(8'h9f), reg91} ? (8'ha6) : reg92))) ?
                  (reg97[(3'h6):(3'h6)] ?
                      reg95 : (8'hab)) : (!wire77[(4'hb):(4'h9)]));
              reg99 <= $signed(($unsigned((reg94[(4'h9):(3'h6)] ?
                      (reg94 ? reg83 : reg97) : {reg89, reg94})) ?
                  $signed(($unsigned(reg85) ?
                      (reg81 * (8'hbd)) : (reg87 ?
                          reg95 : wire75))) : (-($unsigned(wire80) ?
                      (8'hb6) : $unsigned(reg86)))));
              reg100 <= (~&($unsigned(reg94[(1'h0):(1'h0)]) ?
                  (^~reg92[(4'ha):(2'h2)]) : $signed($signed((reg99 >>> wire74)))));
              reg101 <= $signed($signed(reg88));
              reg102 <= (reg82[(4'he):(1'h0)] ?
                  ($unsigned(wire74) && (~^($signed(reg81) >>> (~|reg90)))) : ($signed($signed(reg83)) == ((~(^(7'h42))) != {$unsigned(reg99),
                      (wire72 <= reg101)})));
            end
          else
            begin
              reg98 <= reg93[(1'h0):(1'h0)];
              reg99 <= ($signed(wire76[(3'h4):(3'h4)]) || (((reg95 ?
                          {reg90, wire74} : (reg100 ? reg81 : reg83)) ?
                      (reg101[(4'hf):(2'h3)] & {reg81, wire75}) : wire78) ?
                  {$unsigned($signed(reg83))} : (~{reg95,
                      $unsigned((8'hb7))})));
            end
          if ((^{$unsigned(({(7'h43)} <<< $unsigned(wire77)))}))
            begin
              reg103 <= (8'ha2);
              reg104 <= $unsigned(((~(!(8'hbc))) ?
                  (+$unsigned((wire75 & reg81))) : (reg99 ?
                      ({reg87} * (wire79 ?
                          reg92 : reg87)) : $signed($unsigned(reg94)))));
              reg105 <= ((8'hb0) ? {reg95, $signed(wire73)} : reg96);
              reg106 <= (($unsigned((reg95 ? $signed(reg82) : reg88)) ?
                  (~|($signed((8'h9d)) <= (+reg81))) : (reg94[(3'h5):(3'h4)] ?
                      {$unsigned(reg96),
                          (reg85 | reg95)} : $unsigned(reg96[(4'hf):(1'h0)]))) <= ($unsigned($signed($signed(wire72))) ?
                  {((!reg98) <<< $signed(wire75))} : reg96[(4'h8):(2'h2)]));
            end
          else
            begin
              reg103 <= reg87;
            end
          reg107 <= ((+($unsigned((wire78 >>> (8'ha4))) ?
              (!(8'hbf)) : ($signed(reg89) ? reg105 : reg102))) ~^ wire73);
        end
      else
        begin
          reg96 <= $signed(((-((reg104 || reg84) ^~ reg83[(4'h9):(2'h3)])) ?
              $signed($signed($signed((8'hbc)))) : {$signed(reg98[(4'ha):(1'h0)])}));
          reg97 <= (8'ha7);
          reg98 <= reg83[(4'h8):(3'h4)];
        end
    end
  assign wire108 = wire80;
  assign wire109 = $unsigned($unsigned($signed(reg105)));
  assign wire110 = (reg103 >= $unsigned($signed(((+reg95) ?
                       (wire77 > wire77) : $signed(reg97)))));
  assign wire111 = reg89[(1'h1):(1'h0)];
  assign wire112 = (((8'ha5) | (8'hae)) | wire78);
  always
    @(posedge clk) begin
      if ((!reg105))
        begin
          reg113 <= $signed(wire73[(1'h1):(1'h0)]);
          reg114 <= ((wire79[(3'h4):(1'h1)] ?
                  $unsigned($unsigned((wire77 ?
                      reg99 : wire80))) : reg104[(5'h13):(4'hf)]) ?
              ((($unsigned(reg85) ?
                      (reg88 & reg88) : $unsigned((8'hb5))) == (8'hbd)) ?
                  (^reg83) : reg105) : {(~($unsigned(wire80) ^ (reg81 <<< reg96))),
                  $signed((reg95 << reg95[(1'h1):(1'h1)]))});
          reg115 <= ({(|((reg113 ? reg102 : reg90) ^ (reg86 < reg102))),
                  {(((8'hbe) > reg88) && $unsigned(reg84))}} ?
              (reg98 ?
                  $unsigned(wire78) : ((reg92 ? (reg92 >= reg98) : (+reg93)) ?
                      (+(wire78 <<< reg106)) : ((^wire78) ?
                          (8'hbb) : $signed(reg99)))) : {$signed((reg97[(5'h14):(4'he)] + $unsigned(wire72))),
                  $unsigned(reg97[(4'hd):(4'hd)])});
        end
      else
        begin
          reg113 <= ($signed(reg88) >>> {wire75[(1'h0):(1'h0)], (+reg89)});
        end
      reg116 <= (|(wire79[(3'h4):(1'h0)] ?
          reg105 : {((^~reg90) > (^~wire79))}));
    end
endmodule

module module12
#(parameter param68 = ((-{(-(^(8'haf))), (-{(8'hae), (8'hbb)})}) >= (((~((8'haf) >>> (7'h44))) ? (((8'h9d) - (8'ha7)) ? (&(8'hb2)) : (|(8'hb6))) : (|((8'hac) >= (8'hbe)))) ^ ((((8'ha1) && (8'hbe)) ? ((8'hb8) ? (8'ha8) : (8'hb9)) : (&(8'hbf))) ? (((8'hb0) & (8'hbc)) ? {(8'hbd)} : ((8'had) >= (8'ha5))) : {(&(8'hbf))}))))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h29d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire17;
  input wire [(5'h14):(1'h0)] wire16;
  input wire signed [(4'hc):(1'h0)] wire15;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire signed [(3'h7):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire67;
  wire signed [(5'h15):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire65;
  wire [(5'h13):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire32,
                 wire31,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
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
                 reg44,
                 reg43,
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
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire18 = $unsigned((^wire16));
  assign wire19 = ((wire15 < wire13[(3'h5):(3'h4)]) || ($signed(wire17[(1'h1):(1'h1)]) >= ((~^(!wire13)) ?
                      ({wire14, wire16} ?
                          (wire18 ?
                              wire17 : wire17) : $signed((8'hac))) : wire18[(4'hd):(4'h9)])));
  assign wire20 = $unsigned(wire13[(3'h6):(3'h4)]);
  assign wire21 = $signed(wire14);
  always
    @(posedge clk) begin
      reg22 <= wire13;
      reg23 <= $signed(wire16[(5'h14):(1'h0)]);
      reg24 <= ($signed(wire17[(1'h0):(1'h0)]) ?
          reg23 : (({wire21} ?
                  reg22[(3'h6):(3'h6)] : (reg23 >= $unsigned((8'h9c)))) ?
              (wire17 ? (&(wire18 ^ wire19)) : wire15) : (((~wire19) ?
                      reg22 : (wire14 * reg22)) ?
                  ($signed(reg23) >> $unsigned(wire21)) : (-wire21))));
      if (wire16)
        begin
          reg25 <= $signed((^~(((wire21 & reg22) ?
              {reg22} : $unsigned(reg22)) <= wire19[(3'h7):(1'h1)])));
          reg26 <= wire17;
          reg27 <= ($signed($signed((!(wire17 ? reg24 : (8'hb3))))) ?
              (~(({reg26} ? (reg25 ? reg23 : wire14) : (wire16 >= wire20)) ?
                  $unsigned((wire13 <= wire17)) : (^~{wire14,
                      reg22}))) : wire19[(1'h1):(1'h1)]);
          reg28 <= ({(&$signed((wire21 >= wire16))),
              ({reg23,
                  {reg27,
                      wire16}} << wire15[(4'h8):(2'h2)])} ^~ {$unsigned(((wire13 ?
                  (8'ha3) : reg24) < (reg23 ~^ reg26))),
              $signed($unsigned($signed(wire18)))});
        end
      else
        begin
          reg25 <= ((($signed($signed(wire18)) >> $unsigned(reg22[(4'h8):(2'h3)])) ?
              (~&reg25[(4'h9):(2'h3)]) : (((reg25 ~^ wire21) ?
                  (reg28 >= wire13) : (8'hbb)) == ((wire13 ^~ reg28) & $unsigned((8'hb5))))) ^ (wire20[(3'h4):(1'h1)] || (8'hb6)));
          reg26 <= reg23[(1'h0):(1'h0)];
          reg27 <= (~^{$signed({$unsigned((8'hb0)), (!wire14)}), wire16});
          reg28 <= wire13[(1'h0):(1'h0)];
          reg29 <= ((reg24 ?
              (!$unsigned($unsigned(reg22))) : (8'had)) > wire21);
        end
    end
  always
    @(posedge clk) begin
      reg30 <= reg28[(1'h1):(1'h0)];
    end
  assign wire31 = (^~({$unsigned($unsigned(reg30)),
                      (wire21[(4'hc):(2'h2)] ?
                          reg26[(1'h0):(1'h0)] : wire17)} >>> $signed(((reg22 || wire16) ?
                      reg25 : wire19))));
  assign wire32 = (^~reg24);
  always
    @(posedge clk) begin
      reg33 <= (8'hb9);
      if ((~(^~(~&$signed(reg29[(2'h2):(1'h1)])))))
        begin
          reg34 <= $unsigned(wire19);
          reg35 <= $unsigned(wire14[(4'hf):(1'h0)]);
        end
      else
        begin
          if (reg23)
            begin
              reg34 <= ((~(reg28[(3'h6):(3'h4)] || (+(reg29 & (8'hbd))))) ?
                  ((^reg26) ?
                      (((reg34 >> wire14) ?
                              ((8'haf) ?
                                  (8'ha5) : reg22) : ((8'hb3) ^~ (8'h9c))) ?
                          ((^reg30) ?
                              (&(8'hb4)) : wire31) : $signed(reg30)) : wire13) : (({$signed(wire19),
                          {wire20}} != (!{(8'hb4), wire13})) ?
                      ({(wire19 >= reg24),
                          (~wire13)} * reg25) : $unsigned($signed((reg33 == reg29)))));
              reg35 <= ($signed(wire20) != wire18[(2'h3):(1'h0)]);
            end
          else
            begin
              reg34 <= $unsigned($signed((reg26 ?
                  (~&(reg23 ?
                      wire21 : (8'ha7))) : (reg23[(5'h11):(4'ha)] != (wire14 || reg22)))));
              reg35 <= ((($unsigned((reg28 ?
                      wire16 : reg24)) << $unsigned(((8'ha1) == (8'hb3)))) ^~ wire13[(1'h0):(1'h0)]) ?
                  (~^$unsigned(((^~reg23) ?
                      reg26[(2'h3):(1'h0)] : reg28))) : $signed((~(&wire17[(1'h0):(1'h0)]))));
              reg36 <= ((({$unsigned(wire32)} >>> (^~(^wire16))) < wire14) != reg22[(4'ha):(3'h4)]);
              reg37 <= ($signed({(8'hbd), (|(+reg34))}) ?
                  wire32[(2'h3):(2'h2)] : reg23[(5'h14):(3'h6)]);
            end
          reg38 <= wire16[(1'h1):(1'h0)];
          if ((~^wire15))
            begin
              reg39 <= (($unsigned((wire16[(2'h2):(1'h1)] ?
                      $unsigned(reg34) : $signed(wire21))) ?
                  (&$signed((wire18 ? wire19 : wire20))) : reg22) <<< reg27);
              reg40 <= (((~(wire17[(1'h0):(1'h0)] ?
                      (8'ha9) : wire15)) >>> (-reg34[(4'hd):(2'h3)])) ?
                  reg36[(4'he):(4'h8)] : $signed($unsigned({reg37})));
              reg41 <= wire17;
            end
          else
            begin
              reg39 <= $signed((reg35[(2'h2):(1'h1)] < (wire21 ?
                  (|reg27) : ((wire17 ? (8'haa) : (8'ha3)) ?
                      (!wire21) : reg36))));
              reg40 <= $signed($unsigned({(!$unsigned(reg30))}));
              reg41 <= reg41;
              reg42 <= $signed(((reg29[(3'h4):(2'h2)] ?
                      wire18 : reg36[(4'hb):(1'h0)]) ?
                  $signed(((^~reg29) ?
                      (wire16 ?
                          reg23 : wire21) : $unsigned((8'ha0)))) : (8'ha0)));
              reg43 <= $unsigned($unsigned((reg42 ?
                  (^(wire13 ? reg25 : wire31)) : wire17)));
            end
          if (((-(~$signed(((8'ha2) ? (8'had) : wire31)))) ?
              ({((~|reg42) ~^ {wire13, reg35})} <= $unsigned({(|wire17),
                  {reg37}})) : (((+$signed(reg33)) ^~ wire17[(1'h1):(1'h0)]) - wire31)))
            begin
              reg44 <= reg24;
              reg45 <= (({$signed(reg34[(4'he):(4'hd)]), reg30} ?
                  $unsigned(reg33) : ($unsigned((~^reg37)) | (~&reg23[(5'h11):(4'he)]))) > (!($signed($signed(reg35)) ?
                  (8'hbb) : (+$unsigned(wire15)))));
              reg46 <= (~|wire21);
              reg47 <= ((~$signed((-$signed(reg33)))) >>> ((8'hb3) ?
                  $signed(((!reg23) ^ {reg22,
                      reg26})) : $signed($unsigned((~&reg43)))));
            end
          else
            begin
              reg44 <= ((reg46[(3'h6):(3'h6)] & reg30[(5'h11):(5'h11)]) ?
                  reg38 : {(~^wire13), (~|reg23)});
            end
        end
      reg48 <= reg39[(2'h3):(1'h1)];
      if ({$unsigned($signed(reg25)),
          ($signed(((&wire13) <= wire32[(2'h2):(1'h1)])) ?
              {(reg47 << $unsigned(wire31))} : $signed((-{reg43})))})
        begin
          if ((wire21[(2'h2):(1'h0)] >> reg38))
            begin
              reg49 <= ($unsigned((8'ha8)) && (reg28[(4'h8):(3'h7)] ?
                  (($unsigned((8'ha8)) && wire19[(4'he):(3'h4)]) * (~&(wire14 ?
                      wire21 : reg29))) : $unsigned($unsigned((wire19 ?
                      reg37 : (8'ha5))))));
              reg50 <= reg43;
              reg51 <= (wire15 ?
                  (($signed($unsigned((7'h43))) ?
                          reg46 : $signed(((8'hb1) ? reg27 : wire21))) ?
                      reg37 : reg44) : (8'ha7));
              reg52 <= reg42;
              reg53 <= reg42;
            end
          else
            begin
              reg49 <= $unsigned($unsigned({(8'hbc),
                  (~|reg45[(4'h9):(4'h8)])}));
              reg50 <= ({(~&{((8'ha5) ? (8'hb3) : wire18), $unsigned((8'hb1))}),
                  reg26[(1'h1):(1'h1)]} | $signed($signed(reg51)));
            end
          reg54 <= reg33[(4'hd):(1'h0)];
        end
      else
        begin
          if ((!$unsigned(($signed(reg38) ? reg50 : wire19[(4'ha):(4'ha)]))))
            begin
              reg49 <= wire17[(1'h0):(1'h0)];
            end
          else
            begin
              reg49 <= {(^~reg26),
                  $unsigned({((wire13 ? reg22 : reg45) >= (reg49 ^~ wire18)),
                      reg51[(1'h0):(1'h0)]})};
              reg50 <= ($signed((reg52 >>> {(~&reg30), (~&reg28)})) - reg46);
              reg51 <= (+((~|($unsigned(reg46) > $signed(reg43))) - (|reg51)));
              reg52 <= {reg38};
              reg53 <= wire32;
            end
          if ((($signed((-$signed(reg39))) | (($unsigned((8'h9f)) >= $unsigned(reg38)) ?
              (~$signed(wire21)) : ((wire17 ? reg46 : reg36) ?
                  (reg27 ? wire14 : (8'ha0)) : (wire17 ?
                      (8'hab) : wire21)))) - reg40[(2'h3):(2'h2)]))
            begin
              reg54 <= wire31;
              reg55 <= ((reg46[(2'h3):(1'h0)] ?
                  reg35[(4'h8):(4'h8)] : ($unsigned((|reg37)) <= ((reg45 ?
                          reg45 : reg35) ?
                      (reg44 || reg26) : (reg48 ?
                          reg35 : wire32)))) & reg45[(3'h5):(2'h3)]);
              reg56 <= ((reg40 + reg52[(3'h7):(1'h1)]) ^ (~&reg34));
              reg57 <= (((reg29 ?
                          (!reg33[(4'h8):(4'h8)]) : $unsigned(reg41[(3'h5):(2'h2)])) ?
                      wire31[(3'h7):(3'h7)] : wire20) ?
                  ($unsigned($unsigned($signed(reg41))) ?
                      wire16[(5'h10):(5'h10)] : reg38[(1'h1):(1'h0)]) : reg35[(5'h11):(4'hc)]);
            end
          else
            begin
              reg54 <= $unsigned(wire21);
              reg55 <= $unsigned(((^(^$unsigned(reg46))) ?
                  ($signed((reg39 ? (8'haf) : reg26)) ?
                      $unsigned(wire14[(1'h0):(1'h0)]) : $signed(reg49[(5'h11):(1'h0)])) : (&reg22[(2'h3):(1'h1)])));
              reg56 <= (wire13 && {(reg50 & $unsigned((reg36 ?
                      reg22 : reg49)))});
              reg57 <= wire17;
              reg58 <= reg24[(4'he):(3'h5)];
            end
          reg59 <= (wire16 == $unsigned(((!$signed(wire15)) ?
              ({reg51, reg52} > (wire13 ? reg40 : reg58)) : ((wire20 ?
                  reg51 : reg28) == (reg30 ? reg35 : reg37)))));
          reg60 <= $signed(reg40[(3'h7):(3'h6)]);
        end
      if ((8'hbf))
        begin
          reg61 <= {({(8'hbf)} ?
                  reg42 : ($signed({wire19}) ?
                      wire17[(2'h2):(2'h2)] : ((~^reg50) >>> $unsigned(reg30))))};
          reg62 <= $unsigned(reg26[(1'h0):(1'h0)]);
        end
      else
        begin
          reg61 <= reg62[(5'h12):(1'h1)];
          if ({$unsigned($unsigned((8'h9c))),
              $signed((^~($signed((8'hb2)) ? (8'hac) : (reg60 >= reg57))))})
            begin
              reg62 <= (8'hb2);
              reg63 <= reg33[(5'h10):(1'h1)];
              reg64 <= {(($unsigned(reg39) >> {(reg38 > (8'hb7))}) < $signed(reg22)),
                  $signed($signed(($signed((8'h9d)) * reg38[(1'h0):(1'h0)])))};
            end
          else
            begin
              reg62 <= reg42;
              reg63 <= {$signed(reg64[(3'h4):(1'h0)]),
                  ({{reg56, reg27[(4'he):(2'h3)]}} ?
                      ($signed($unsigned(reg33)) - wire15) : (reg40 ?
                          wire18[(4'ha):(2'h3)] : $unsigned(reg28[(1'h0):(1'h0)])))};
            end
        end
    end
  assign wire65 = ($signed((|wire32[(5'h13):(4'he)])) ?
                      ($signed($unsigned((reg50 <= (8'hae)))) ~^ reg54[(3'h4):(1'h1)]) : $unsigned((^~reg33[(4'ha):(3'h5)])));
  assign wire66 = reg63;
  assign wire67 = $unsigned(($unsigned(reg64[(3'h4):(3'h4)]) ?
                      $signed($unsigned(reg38)) : reg37[(5'h14):(2'h2)]));
endmodule
