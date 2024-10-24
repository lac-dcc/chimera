module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire133;
  wire signed [(4'hc):(1'h0)] wire132;
  wire signed [(4'hc):(1'h0)] wire79;
  wire [(3'h5):(1'h0)] wire84;
  wire [(5'h13):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire86;
  wire [(4'hb):(1'h0)] wire87;
  wire signed [(4'hc):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire130;
  reg [(3'h4):(1'h0)] reg83 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire79,
                 wire84,
                 wire85,
                 wire86,
                 wire87,
                 wire88,
                 wire130,
                 reg83,
                 reg82,
                 reg81,
                 (1'h0)};
  module5 #() modinst80 (wire79, clk, wire1, wire2, wire3, wire4, wire0);
  always
    @(posedge clk) begin
      reg81 <= wire3;
      reg82 <= $signed($unsigned((~{wire79[(3'h6):(3'h6)]})));
      reg83 <= (~reg82);
    end
  assign wire84 = $signed((~|(wire3[(3'h5):(2'h2)] ?
                      $signed((wire1 ? reg83 : reg82)) : wire1)));
  assign wire85 = ($signed(wire2) ? {wire84, (8'h9e)} : wire1[(3'h6):(2'h3)]);
  assign wire86 = ($signed(($signed($signed(reg83)) >= (!(wire85 ~^ wire85)))) ?
                      wire2 : $unsigned((~&$unsigned(reg81))));
  assign wire87 = ($signed((|reg82)) ?
                      ($unsigned((wire0 ?
                          $signed(reg82) : wire3[(4'h8):(4'h8)])) - $unsigned((+wire3))) : wire86);
  assign wire88 = ($signed($unsigned(((8'h9d) >= $signed(reg82)))) <= (~^$signed($signed($signed(wire79)))));
  module89 #() modinst131 (wire130, clk, wire86, wire2, wire4, wire79, wire3);
  assign wire132 = $signed(wire2);
  assign wire133 = (($unsigned($signed((wire79 != wire85))) >>> (^($signed(wire84) ?
                           $signed(reg82) : wire130))) ?
                       wire79 : ((-wire84[(1'h0):(1'h0)]) ?
                           ($signed($unsigned(wire88)) | $signed(((8'hb0) ^ wire1))) : wire84));
endmodule

module module89
#(parameter param128 = ({(((~&(8'hbb)) ? (!(8'hb3)) : ((8'hb0) < (8'hb5))) ? ((^~(8'hba)) ? (&(8'hb0)) : {(8'hbc)}) : (((8'ha6) || (8'ha9)) ? ((8'hb1) >= (8'ha6)) : ((8'ha9) ? (7'h40) : (8'hb4)))), ((+{(8'ha8), (8'had)}) ? (^((8'hb7) <= (8'hae))) : ((+(8'ha7)) << ((8'haa) <<< (8'hb6))))} <<< (+(+(((8'hac) ~^ (8'ha3)) < ((8'ha4) >>> (8'hb0)))))), 
parameter param129 = (~|param128))
(y, clk, wire94, wire93, wire92, wire91, wire90);
  output wire [(32'h1a4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire94;
  input wire [(3'h6):(1'h0)] wire93;
  input wire signed [(4'h8):(1'h0)] wire92;
  input wire signed [(4'h9):(1'h0)] wire91;
  input wire signed [(3'h6):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire127;
  wire signed [(5'h12):(1'h0)] wire126;
  wire signed [(3'h4):(1'h0)] wire120;
  wire [(5'h11):(1'h0)] wire119;
  wire [(4'hc):(1'h0)] wire118;
  wire [(4'hf):(1'h0)] wire117;
  wire signed [(4'h9):(1'h0)] wire116;
  wire [(4'hd):(1'h0)] wire115;
  wire [(5'h12):(1'h0)] wire114;
  wire signed [(4'hc):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire101;
  wire signed [(5'h15):(1'h0)] wire100;
  wire [(5'h13):(1'h0)] wire99;
  reg signed [(5'h15):(1'h0)] reg125 = (1'h0);
  reg [(4'hd):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg123 = (1'h0);
  reg [(4'hd):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg111 = (1'h0);
  reg [(2'h3):(1'h0)] reg110 = (1'h0);
  reg [(4'h8):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  reg [(5'h11):(1'h0)] reg104 = (1'h0);
  reg [(4'h9):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned($unsigned(wire92[(3'h7):(3'h4)])) << {{((wire92 ?
                  wire94 : wire93) - wire91)}}))
        begin
          reg95 <= $signed($unsigned(wire93[(1'h1):(1'h1)]));
          reg96 <= (!(&$signed($signed((wire90 >> wire90)))));
        end
      else
        begin
          reg95 <= (~wire91);
          reg96 <= wire93;
          reg97 <= (wire94 * (8'ha8));
          reg98 <= $signed((~|$unsigned(reg96)));
        end
    end
  assign wire99 = reg95;
  assign wire100 = {(-$signed(wire94))};
  assign wire101 = reg95[(2'h3):(2'h2)];
  assign wire102 = ($unsigned($unsigned(wire94[(2'h2):(2'h2)])) ?
                       {((wire92[(3'h6):(2'h3)] != wire100) ?
                               (^~reg97) : $signed((reg98 ? wire101 : wire90))),
                           (~&((~wire101) ?
                               $signed(wire99) : $unsigned(reg98)))} : $signed({((reg98 | wire92) ?
                               wire91[(2'h2):(2'h2)] : (+wire90)),
                           $signed(reg97[(3'h4):(2'h2)])}));
  always
    @(posedge clk) begin
      reg103 <= {(~|$signed((wire91 ?
              reg96[(4'hd):(1'h0)] : ((8'hb2) ? (8'ha6) : wire101))))};
      reg104 <= $unsigned(wire100);
      reg105 <= ($signed(wire92) && (wire100[(1'h0):(1'h0)] && wire93[(3'h4):(1'h1)]));
      if (wire100[(4'h8):(4'h8)])
        begin
          reg106 <= reg96;
          reg107 <= $signed(({wire93} + (!({reg95, wire101} ?
              $signed(wire90) : {reg103, reg95}))));
          reg108 <= {(8'ha2),
              (((~^wire90) == (-reg95)) ~^ ($unsigned(reg107[(2'h2):(1'h1)]) ?
                  $signed((wire101 ?
                      (7'h40) : reg104)) : $unsigned($signed(wire100))))};
          if ({$unsigned((^~$unsigned((^~reg97))))})
            begin
              reg109 <= (~^$signed($signed(reg108)));
              reg110 <= $signed($signed((reg108 <<< ($unsigned(reg108) > $unsigned(wire94)))));
              reg111 <= (($unsigned($unsigned(reg107[(2'h3):(1'h1)])) ?
                  $unsigned(((wire91 ? reg105 : wire93) ?
                      (|(8'hbd)) : (reg105 ?
                          (8'hb6) : wire102))) : $unsigned($signed(reg106))) - (~(!(&(+reg96)))));
              reg112 <= {((reg104[(3'h5):(2'h3)] ?
                      wire92[(3'h6):(1'h1)] : $signed($unsigned(reg98))) + (($unsigned((8'hb7)) ?
                          (-(8'h9c)) : (!reg96)) ?
                      (wire94 ?
                          wire101[(1'h0):(1'h0)] : (reg98 ?
                              wire99 : wire90)) : ((wire90 ^ (8'hba)) >>> $unsigned(wire91)))),
                  {(reg97[(2'h2):(2'h2)] ?
                          wire92[(3'h6):(2'h2)] : $signed(reg108[(1'h1):(1'h0)]))}};
            end
          else
            begin
              reg109 <= $unsigned({({{reg105},
                      $signed(reg105)} >> wire93[(3'h5):(2'h2)])});
              reg110 <= (-{$unsigned($unsigned(((8'haa) && reg111)))});
              reg111 <= reg108;
            end
        end
      else
        begin
          reg106 <= $unsigned((wire93 ?
              (!(reg106 ?
                  (reg105 << (8'hb0)) : $unsigned(reg103))) : $unsigned($signed((~(8'hba))))));
          reg107 <= reg112;
          reg108 <= {reg96, reg108};
          reg109 <= (+wire102[(4'hc):(2'h2)]);
        end
      reg113 <= $unsigned(((wire100 - {(wire101 || reg98), $signed(wire100)}) ?
          ((+reg104[(3'h7):(3'h4)]) <= reg103) : ($unsigned(wire99[(4'ha):(3'h4)]) ?
              reg112[(4'hc):(4'ha)] : wire93[(3'h6):(3'h6)])));
    end
  assign wire114 = ($signed((+reg97[(2'h3):(2'h3)])) ?
                       (reg98 + $unsigned(((reg97 + reg97) > wire94[(3'h4):(1'h0)]))) : $signed((~$unsigned((wire100 ?
                           reg98 : wire101)))));
  assign wire115 = $signed((^{((7'h43) >= reg95),
                       ((reg110 == wire92) ~^ reg103[(3'h6):(3'h5)])}));
  assign wire116 = (|reg113[(2'h2):(1'h1)]);
  assign wire117 = $signed(((($unsigned(reg110) ?
                           (wire102 ?
                               reg103 : reg113) : (wire92 ^ wire115)) * (~^(wire94 > wire102))) ?
                       {((wire114 ?
                               reg109 : (8'hb3)) < reg106[(4'h8):(4'h8)])} : reg113));
  assign wire118 = ((!(^~{(reg110 && reg95)})) ?
                       reg106 : (reg108[(3'h4):(2'h2)] == ($signed(reg98) > reg111)));
  assign wire119 = (reg96[(4'he):(3'h7)] ?
                       (wire93 > (wire118 * (-reg111[(3'h5):(2'h2)]))) : {reg95[(1'h0):(1'h0)]});
  assign wire120 = $signed({$unsigned($unsigned((reg111 && wire119)))});
  always
    @(posedge clk) begin
      reg121 <= (+(&wire117));
      reg122 <= (($unsigned(wire92[(4'h8):(4'h8)]) ?
              $unsigned(((~|reg108) < (wire91 ?
                  reg112 : (8'hac)))) : (|wire120)) ?
          wire99[(4'he):(3'h6)] : $unsigned(wire101));
      reg123 <= (reg106[(1'h0):(1'h0)] ?
          wire100[(1'h1):(1'h0)] : wire93[(3'h5):(1'h0)]);
      reg124 <= $signed($signed(reg107[(1'h1):(1'h1)]));
      reg125 <= (+(({$signed(reg107), $unsigned(wire92)} ?
              $signed(reg95[(4'h8):(4'h8)]) : (|(8'hb2))) ?
          $unsigned(reg96) : $unsigned(((wire99 <= wire114) ?
              wire100 : (+reg103)))));
    end
  assign wire126 = reg123[(2'h2):(1'h0)];
  assign wire127 = $signed(reg111);
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire6;
  input wire [(5'h11):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(3'h7):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire78;
  wire [(4'ha):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire71;
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire11,
                 wire12,
                 wire71,
                 (1'h0)};
  assign wire11 = wire9[(5'h11):(4'hd)];
  assign wire12 = wire11;
  module13 #() modinst72 (wire71, clk, wire7, wire6, wire8, wire11, wire9);
  assign wire73 = wire6;
  assign wire74 = {($signed(((wire10 ?
                              (8'hbf) : (8'hbd)) + (wire10 < (8'hb9)))) ?
                          {{{wire71}, (+(8'h9d))},
                              wire11} : wire8[(5'h15):(5'h15)])};
  assign wire75 = wire74;
  assign wire76 = $unsigned((wire10 ?
                      ($unsigned($unsigned(wire10)) ?
                          {$signed(wire12),
                              (~|(8'ha8))} : (!(wire10 != wire71))) : $signed((wire10[(3'h6):(2'h2)] > (8'hb0)))));
  assign wire77 = $signed($signed({{wire11, wire10},
                      {(|wire8), $signed(wire8)}}));
  assign wire78 = $unsigned(wire71);
endmodule

module module13
#(parameter param69 = ((~|(^~{(^(8'hbe))})) >> ((((~|(7'h41)) ^~ (~|(8'h9d))) && ((|(8'hb6)) ^~ ((8'hb7) <= (8'hae)))) | ((8'hbd) ? ((+(7'h44)) >= ((8'hb5) + (8'h9d))) : (((8'h9f) == (8'ha2)) & (8'hab))))), 
parameter param70 = param69)
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h23e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire18;
  input wire [(5'h10):(1'h0)] wire17;
  input wire signed [(5'h15):(1'h0)] wire16;
  input wire signed [(4'hd):(1'h0)] wire15;
  input wire signed [(3'h5):(1'h0)] wire14;
  wire signed [(3'h5):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire53;
  wire [(5'h13):(1'h0)] wire52;
  wire [(2'h3):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  wire signed [(3'h6):(1'h0)] wire47;
  wire [(3'h4):(1'h0)] wire46;
  wire signed [(4'ha):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire19;
  reg signed [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  assign y = {wire68,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire19,
                 reg67,
                 reg66,
                 reg65,
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
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire19 = (wire17 ?
                      ((+wire18[(3'h4):(1'h0)]) != ($unsigned(((8'haf) ?
                              wire16 : wire15)) ?
                          $signed(((8'hae) ?
                              (8'hac) : wire18)) : $unsigned(wire14))) : $unsigned(wire14[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      reg20 <= wire16;
      if (wire17)
        begin
          if ({wire14})
            begin
              reg21 <= (-(8'hb7));
              reg22 <= (8'hb5);
              reg23 <= $unsigned({$signed(reg20)});
              reg24 <= $unsigned({reg20[(3'h6):(3'h6)]});
              reg25 <= (&$unsigned((wire17[(3'h4):(1'h1)] ?
                  reg20 : $signed((~&wire18)))));
            end
          else
            begin
              reg21 <= (8'hbf);
              reg22 <= wire17[(4'hd):(4'hb)];
              reg23 <= reg24[(4'hb):(3'h4)];
              reg24 <= wire17;
              reg25 <= wire18[(4'hc):(1'h1)];
            end
          if (reg22)
            begin
              reg26 <= {wire17,
                  ($signed($unsigned($signed(reg25))) ?
                      {(reg22[(3'h7):(2'h2)] ? (+(8'hbe)) : (|reg20)),
                          wire15[(3'h6):(3'h5)]} : {{(~^(8'haa))}})};
              reg27 <= wire17;
            end
          else
            begin
              reg26 <= $signed((|($signed(((8'hb9) ? reg21 : wire17)) ?
                  (8'h9d) : wire16[(4'h8):(1'h0)])));
            end
          if (((reg26[(2'h3):(1'h0)] & reg23[(1'h0):(1'h0)]) ?
              (reg22 > {(reg21[(1'h1):(1'h1)] ?
                      reg26 : (-wire16))}) : ($signed(($signed(wire14) << $signed(wire16))) ^ (8'ha7))))
            begin
              reg28 <= ($unsigned(reg22) ?
                  wire14 : (((((8'hb9) ? reg23 : reg23) ?
                      reg27[(1'h1):(1'h1)] : reg21) <= {reg22,
                      (8'hb4)}) <<< (wire16[(1'h1):(1'h1)] ?
                      $unsigned((wire17 ^ reg24)) : (wire14[(3'h4):(2'h3)] ?
                          wire19[(3'h4):(3'h4)] : $signed(reg22)))));
              reg29 <= $unsigned(($unsigned(reg22) ?
                  ($signed($signed(wire14)) ?
                      reg25[(3'h4):(3'h4)] : $unsigned($unsigned((8'hb9)))) : $signed(reg21)));
              reg30 <= ((($signed((reg26 ? wire18 : wire18)) ?
                  reg22[(1'h0):(1'h0)] : reg23) | ((wire17[(3'h6):(3'h4)] ?
                      (reg28 - reg27) : $unsigned(reg20)) ?
                  $unsigned((~^(8'hb1))) : $unsigned($signed(wire15)))) >= ((wire19[(2'h3):(2'h2)] ?
                      (reg22 ? wire19 : $signed(reg24)) : {{wire19, reg27}}) ?
                  {wire15[(4'h8):(1'h0)]} : (({reg21, reg21} ?
                      $unsigned(reg28) : $signed(reg26)) >>> $signed($signed(reg28)))));
              reg31 <= (($signed($unsigned($unsigned(wire15))) ?
                  $unsigned((reg20 || (~|reg22))) : reg21[(2'h3):(2'h2)]) == wire16[(3'h6):(1'h0)]);
              reg32 <= $unsigned(wire16);
            end
          else
            begin
              reg28 <= $signed((^~wire15));
            end
          reg33 <= (reg29 >= {(~(&reg30))});
        end
      else
        begin
          if ((&($signed(reg23) ? reg26[(1'h0):(1'h0)] : reg21[(2'h2):(1'h1)])))
            begin
              reg21 <= $unsigned((reg26 ?
                  (reg25 ?
                      $signed($signed(reg33)) : $signed($signed(reg29))) : ((-$signed(reg26)) && ((8'h9e) ?
                      wire16[(4'hf):(4'hc)] : (reg31 ? (8'h9f) : wire16)))));
              reg22 <= (reg21 != ((reg33 | $unsigned(wire17[(3'h4):(3'h4)])) ?
                  (((reg27 > reg31) >>> (~|reg24)) > ((reg25 <<< wire17) <<< (reg20 ?
                      reg23 : reg27))) : $unsigned($unsigned((reg20 > reg30)))));
            end
          else
            begin
              reg21 <= (^$signed((^~{(reg31 ? reg20 : reg23)})));
              reg22 <= (($unsigned({$signed(wire15)}) <= ($signed({wire19}) ^~ ($signed(reg29) ?
                  {(8'hb6),
                      wire15} : ((8'hba) <<< (8'h9e))))) < ({((~^reg20) && wire18[(2'h2):(1'h1)]),
                  (8'ha4)} > reg32));
              reg23 <= reg22;
              reg24 <= {$signed((~^({(8'h9e)} ?
                      (reg31 ? wire16 : reg27) : (reg22 >= reg27))))};
              reg25 <= ({(wire17 ?
                          reg31[(4'hb):(3'h4)] : (~^$unsigned(reg27)))} ?
                  wire15[(1'h1):(1'h1)] : wire14);
            end
          if ((($unsigned($unsigned({wire19, wire18})) ?
                  reg29 : (&{$unsigned(wire15), (~^wire15)})) ?
              $unsigned((~^reg23)) : reg22[(4'hf):(4'hb)]))
            begin
              reg26 <= {$unsigned(wire18), reg21[(1'h0):(1'h0)]};
              reg27 <= {{(((wire16 ? reg31 : reg20) ~^ (reg24 ?
                          (8'hbc) : wire15)) > reg31[(1'h0):(1'h0)])}};
            end
          else
            begin
              reg26 <= wire19;
              reg27 <= wire14[(3'h5):(3'h5)];
              reg28 <= (-$signed(reg23));
              reg29 <= reg30[(4'ha):(4'h8)];
            end
        end
      if ($unsigned(($unsigned((~^{reg26})) < $unsigned($unsigned((!wire16))))))
        begin
          reg34 <= reg29;
        end
      else
        begin
          reg34 <= (^~(($signed((&wire16)) >> $signed(wire15[(3'h7):(2'h3)])) ?
              $unsigned($unsigned((reg27 <= wire18))) : wire15[(3'h5):(3'h4)]));
          reg35 <= ($signed($unsigned(reg32)) + {({reg21[(3'h4):(2'h2)]} ?
                  (^$signed((8'hba))) : {reg32})});
          reg36 <= wire18[(3'h7):(1'h1)];
          reg37 <= (~|(!(!reg30)));
          reg38 <= wire14[(2'h2):(1'h1)];
        end
      if ({reg34[(4'hd):(3'h5)]})
        begin
          reg39 <= (~^{$signed(({wire15, wire14} & ((8'hbe) < reg22))),
              ($unsigned((~&reg24)) ? reg28 : wire19[(1'h0):(1'h0)])});
          if ($signed(reg22[(5'h12):(5'h12)]))
            begin
              reg40 <= reg28;
              reg41 <= $signed((((8'hb7) == $signed(((8'ha2) ^ reg40))) || ($unsigned({(8'h9f)}) ?
                  ($signed(reg32) ? (-reg35) : $unsigned(reg29)) : (8'had))));
              reg42 <= (^~reg33[(3'h6):(2'h2)]);
              reg43 <= $signed(reg33);
            end
          else
            begin
              reg40 <= $signed((~^reg40[(1'h1):(1'h1)]));
              reg41 <= (^~$signed(reg29));
              reg42 <= ({reg26[(1'h1):(1'h1)]} >> $unsigned({wire15[(3'h4):(2'h2)],
                  reg42}));
            end
          reg44 <= (reg23[(3'h5):(3'h4)] < $unsigned((wire18[(2'h3):(1'h0)] >= wire16)));
        end
      else
        begin
          reg39 <= reg25;
          reg40 <= ($signed({$unsigned($signed(reg32)),
                  ((reg42 ? reg28 : reg28) ?
                      (reg22 ? wire14 : reg27) : $signed(wire14))}) ?
              (reg42[(1'h1):(1'h0)] ?
                  (reg21 ?
                      (8'hb8) : (8'ha6)) : ($signed((|reg35)) <= {$unsigned(wire19)})) : ($signed($unsigned((&reg26))) ^~ reg31[(4'h9):(3'h4)]));
        end
    end
  assign wire45 = reg39;
  assign wire46 = (reg34 ?
                      reg36[(3'h4):(1'h0)] : $unsigned($unsigned($unsigned((reg41 > reg39)))));
  assign wire47 = reg25[(3'h5):(1'h0)];
  assign wire48 = $unsigned(reg42);
  assign wire49 = (^$unsigned(($signed($signed((8'hbb))) ? wire16 : reg30)));
  assign wire50 = reg40[(1'h1):(1'h1)];
  assign wire51 = {((-$unsigned($signed((8'hb3)))) ?
                          reg21[(2'h2):(1'h0)] : {$signed(reg27[(3'h6):(3'h6)])})};
  assign wire52 = wire15;
  assign wire53 = ($signed((+$unsigned((reg35 ? wire15 : reg31)))) ?
                      (+reg26) : $unsigned($signed((8'hb0))));
  always
    @(posedge clk) begin
      reg54 <= ((reg37 ?
          (~&$signed((wire14 ?
              wire17 : wire15))) : wire16) << $signed(((reg31[(4'he):(4'he)] > {reg37}) ?
          reg32[(4'h8):(2'h2)] : $signed($unsigned(wire18)))));
      reg55 <= wire17;
      reg56 <= ((7'h42) ~^ $unsigned({(reg43[(4'he):(4'hd)] ?
              (reg44 ~^ reg28) : {reg29}),
          (reg44 ? ((8'h9f) != (8'hb0)) : (reg35 >= wire50))}));
      if ($signed($unsigned(reg44[(4'he):(4'h9)])))
        begin
          if ($unsigned(({reg40} >>> (|((reg23 ~^ wire52) ?
              (reg40 ? (8'ha5) : wire53) : (wire48 ^~ (8'hba)))))))
            begin
              reg57 <= ((^reg39[(2'h2):(1'h1)]) ^~ $unsigned(reg36[(1'h1):(1'h1)]));
              reg58 <= $unsigned((!({(reg22 && wire53), wire45[(3'h7):(2'h2)]} ?
                  (wire16 != reg21[(1'h0):(1'h0)]) : $unsigned($signed(wire19)))));
              reg59 <= (($unsigned(($signed((8'hba)) ?
                      (reg36 == (8'hb2)) : (8'hb6))) ?
                  ((!$unsigned(wire16)) ?
                      $signed(reg41[(2'h2):(2'h2)]) : $signed((8'haf))) : wire16[(4'hc):(3'h4)]) && $signed(wire46[(1'h0):(1'h0)]));
            end
          else
            begin
              reg57 <= $unsigned(wire48[(3'h7):(3'h4)]);
              reg58 <= $unsigned((-(~^$signed(wire18[(3'h5):(2'h3)]))));
              reg59 <= $unsigned(reg23[(2'h2):(1'h0)]);
              reg60 <= ((reg40[(1'h0):(1'h0)] ^~ ((^$signed(wire17)) >>> $unsigned((~&reg25)))) ?
                  $signed((~|wire15)) : $unsigned($unsigned(reg34[(2'h2):(1'h1)])));
            end
          reg61 <= reg39;
          if ((!(8'hba)))
            begin
              reg62 <= ($unsigned((wire49 ?
                      (~^reg36[(3'h6):(2'h2)]) : $unsigned(((8'ha1) <<< reg25)))) ?
                  wire53[(4'h9):(3'h6)] : $signed($signed((7'h43))));
              reg63 <= reg34[(3'h6):(3'h5)];
              reg64 <= $unsigned($signed($signed((8'h9f))));
            end
          else
            begin
              reg62 <= (~|(^~$unsigned((~^wire47))));
              reg63 <= $signed(wire45);
            end
          reg65 <= $unsigned(wire14[(2'h2):(1'h1)]);
          reg66 <= ({$unsigned({((8'h9c) & reg41), reg42})} - (^~{(((8'hbf) ?
                      reg36 : (8'had)) ?
                  reg57 : (-(8'hb6)))}));
        end
      else
        begin
          if ($signed((&(^$signed((wire47 ? wire46 : wire45))))))
            begin
              reg57 <= reg42;
              reg58 <= reg62[(3'h6):(3'h5)];
              reg59 <= $unsigned((((~^reg22[(4'hc):(3'h6)]) >= ($unsigned(reg41) >> wire45)) <<< $signed($signed($unsigned(wire46)))));
              reg60 <= {$signed($signed(($unsigned(wire18) <<< $unsigned(reg60))))};
            end
          else
            begin
              reg57 <= (+$signed(($signed($signed(reg54)) ?
                  (reg38[(3'h5):(3'h4)] ~^ $unsigned(wire18)) : wire45)));
              reg58 <= {(reg66 - reg54)};
              reg59 <= $unsigned((8'ha8));
              reg60 <= wire18;
            end
          reg61 <= $signed($unsigned({((reg42 ? reg57 : wire51) >>> (wire45 ?
                  wire53 : wire17)),
              $signed((reg28 != reg32))}));
          reg62 <= (!$signed({(reg43 >= reg55[(1'h1):(1'h1)])}));
          reg63 <= reg62;
          if (reg38)
            begin
              reg64 <= (-(reg21 ?
                  $unsigned({wire50}) : ({$signed((7'h43))} ?
                      ($unsigned(reg22) >> $signed(reg42)) : $unsigned((~&reg36)))));
              reg65 <= ((^(+{$signed(reg31)})) == (reg33[(3'h7):(1'h0)] ?
                  (reg23[(2'h3):(2'h2)] ^~ (+{reg22,
                      wire48})) : {$signed((reg59 * (7'h42))), reg41}));
              reg66 <= ((($unsigned($unsigned(reg37)) <= reg60) << $unsigned($unsigned($unsigned(wire19)))) ?
                  $unsigned(($unsigned(reg60[(4'hd):(4'hb)]) ?
                      (|{reg28}) : reg29)) : reg23[(3'h5):(1'h0)]);
            end
          else
            begin
              reg64 <= (reg66 >= (($unsigned((wire19 & wire47)) ~^ reg36) ?
                  {(!$unsigned(reg62))} : (~&{$unsigned(reg39),
                      $signed(reg22)})));
              reg65 <= (|reg43[(3'h7):(2'h3)]);
            end
        end
      reg67 <= (reg20[(2'h2):(2'h2)] << {{({(8'hb8),
                  reg39} && (reg40 - wire14)),
              (8'hbf)}});
    end
  assign wire68 = reg44[(3'h6):(2'h2)];
endmodule
