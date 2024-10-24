module top
#(parameter param144 = (8'hb9))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire143;
  wire [(5'h10):(1'h0)] wire142;
  wire signed [(4'he):(1'h0)] wire141;
  wire [(4'hb):(1'h0)] wire140;
  wire [(2'h2):(1'h0)] wire138;
  assign y = {wire143, wire142, wire141, wire140, wire138, (1'h0)};
  module5 #() modinst139 (wire138, clk, wire3, wire4, wire2, wire0);
  assign wire140 = ((^~$signed($signed((wire3 > wire1)))) == $unsigned((~((wire0 ?
                       wire2 : (8'h9c)) & $unsigned(wire3)))));
  assign wire141 = (|((!$signed({wire4, wire0})) && ((8'ha8) ?
                       (wire3 != $unsigned(wire2)) : {$signed(wire2)})));
  assign wire142 = $unsigned((^{($signed(wire4) ?
                           (wire1 ^ wire141) : (~|wire141))}));
  assign wire143 = (wire0 ?
                       wire4 : ($unsigned($unsigned($unsigned((8'hbc)))) + $signed({$signed(wire4),
                           {wire0, wire2}})));
endmodule

module module5
#(parameter param137 = (((-{(!(7'h42)), {(7'h43)}}) ? (({(8'hb8), (8'hab)} >>> ((8'hba) - (8'hab))) ? (((7'h42) ? (8'ha0) : (8'hbc)) ? ((8'hb7) ? (7'h42) : (8'hbd)) : {(8'hbe)}) : (((7'h42) ? (8'ha9) : (8'h9d)) ? (8'hac) : (|(7'h42)))) : ((((8'hb2) ? (7'h42) : (8'ha5)) ? ((8'hb2) ? (8'hb4) : (8'hbc)) : (+(8'ha3))) ? ((~&(8'ha8)) ? {(8'hbc)} : ((8'hb4) <= (8'hb7))) : (~&((8'hae) & (8'hb8))))) >= (({((8'hba) > (8'hb6))} ? (~|(|(7'h44))) : ({(7'h41)} ~^ {(8'hac), (8'ha3)})) ? ({((8'ha2) ? (8'hbd) : (8'hbc)), ((8'hbc) ~^ (8'ha3))} ? (|((7'h44) < (8'haf))) : (-((8'hbf) ? (8'hb3) : (8'h9c)))) : (^~((~|(8'hbe)) ? {(7'h43)} : ((8'ha6) ? (8'hb0) : (8'h9f)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  input wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire136;
  wire signed [(4'h8):(1'h0)] wire131;
  wire signed [(5'h14):(1'h0)] wire130;
  wire signed [(5'h11):(1'h0)] wire129;
  wire [(4'he):(1'h0)] wire128;
  wire signed [(3'h4):(1'h0)] wire107;
  wire [(4'hf):(1'h0)] wire76;
  wire [(2'h3):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire74;
  reg [(3'h4):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg134 = (1'h0);
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(3'h5):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg123 = (1'h0);
  reg [(4'h8):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg119 = (1'h0);
  reg [(2'h3):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg114 = (1'h0);
  reg [(4'hd):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg110 = (1'h0);
  reg [(2'h2):(1'h0)] reg109 = (1'h0);
  assign y = {wire136,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire107,
                 wire76,
                 wire24,
                 wire11,
                 wire10,
                 wire26,
                 wire74,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire10 = wire7[(2'h2):(2'h2)];
  assign wire11 = (((^(!(-wire9))) * (&($unsigned((8'h9f)) ?
                          $unsigned(wire7) : wire8[(1'h1):(1'h0)]))) ?
                      $signed((!(^(wire9 ?
                          wire7 : wire8)))) : $signed(wire6[(4'h9):(4'h8)]));
  module12 #() modinst25 (.wire17(wire8), .y(wire24), .wire14(wire11), .wire16(wire7), .wire13(wire9), .wire15(wire10), .clk(clk));
  assign wire26 = wire6[(4'ha):(4'h8)];
  module27 #() modinst75 (.wire28(wire26), .y(wire74), .wire31(wire9), .wire32(wire11), .wire29(wire7), .clk(clk), .wire30(wire10));
  assign wire76 = wire11[(1'h1):(1'h0)];
  module77 #() modinst108 (wire107, clk, wire76, wire7, wire11, wire9);
  always
    @(posedge clk) begin
      reg109 <= $signed(wire9[(5'h12):(5'h12)]);
      if (((~^$unsigned({(wire9 ? wire107 : wire9),
          ((8'hbf) >= wire74)})) == ($signed((^~(wire76 << reg109))) ?
          (!$unsigned($signed(wire107))) : (+$signed(wire7[(3'h4):(2'h2)])))))
        begin
          reg110 <= reg109[(1'h0):(1'h0)];
        end
      else
        begin
          if ($signed(($signed($signed($signed(wire11))) ?
              wire11[(5'h14):(2'h3)] : $signed((~|(wire10 + wire107))))))
            begin
              reg110 <= $unsigned($signed($signed($signed({wire8, wire24}))));
              reg111 <= wire8[(4'h8):(4'h8)];
              reg112 <= ((|$unsigned(wire74[(3'h4):(1'h0)])) ?
                  ({((reg109 ? (8'hba) : (8'ha8)) ?
                          (wire24 + reg110) : {wire74}),
                      (!((8'ha4) ? (8'hb1) : wire11))} <= (((wire9 ?
                          (8'hb0) : wire6) & $signed((8'hb2))) ?
                      {wire11} : $unsigned($unsigned((8'ha6))))) : $signed($signed($unsigned(reg109))));
              reg113 <= (~|wire6);
            end
          else
            begin
              reg110 <= reg109[(1'h1):(1'h1)];
              reg111 <= $unsigned(wire24[(1'h1):(1'h0)]);
              reg112 <= ((wire107 ?
                      $unsigned($signed(wire76)) : wire74[(2'h3):(1'h0)]) ?
                  (($signed((^wire107)) ?
                      wire11[(3'h5):(2'h3)] : $unsigned(reg113[(4'h8):(3'h6)])) != (!wire76[(3'h6):(2'h3)])) : wire76);
              reg113 <= $signed(wire11[(5'h12):(4'hf)]);
              reg114 <= (~^wire10);
            end
          reg115 <= (($unsigned((wire74[(1'h1):(1'h0)] ?
                  {reg113, wire6} : (wire6 ?
                      reg114 : wire6))) != (~wire24[(2'h3):(2'h3)])) ?
              wire6[(4'hd):(2'h2)] : {$unsigned(wire107),
                  (reg112 ? (~&$unsigned(wire76)) : wire8[(3'h6):(1'h0)])});
          reg116 <= wire26[(2'h2):(2'h2)];
          reg117 <= {({(reg109[(2'h2):(1'h1)] ~^ (~wire24)),
                  {$unsigned(wire74),
                      $signed(wire9)}} + {$signed($unsigned((8'ha3))), reg109}),
              $unsigned({(8'hb1)})};
        end
      if ($signed(reg113))
        begin
          reg118 <= (reg113[(4'h8):(3'h6)] ?
              (^$signed($unsigned($unsigned(reg115)))) : ($signed((~|wire107[(2'h2):(1'h1)])) == $unsigned({reg109})));
          reg119 <= reg115;
          reg120 <= wire7[(3'h5):(3'h4)];
          reg121 <= $unsigned($unsigned((((|reg119) + wire7[(3'h4):(3'h4)]) >= wire24)));
          reg122 <= $signed($unsigned((wire7[(1'h0):(1'h0)] != ((wire107 ?
                  reg121 : reg113) ?
              $signed(wire74) : $unsigned(reg117)))));
        end
      else
        begin
          reg118 <= (reg122[(1'h1):(1'h1)] ?
              (~&$unsigned(((~|wire6) >= (|reg122)))) : (({$unsigned(wire10),
                      ((7'h43) ? wire107 : wire11)} != $signed(reg121)) ?
                  (^($unsigned(wire10) + $signed((8'ha6)))) : $unsigned(reg115[(5'h13):(4'hb)])));
          reg119 <= reg111;
          reg120 <= (wire10[(5'h10):(3'h7)] >> (~^reg113[(4'ha):(4'h9)]));
          reg121 <= (~|(wire76[(1'h1):(1'h1)] ?
              $signed(reg115) : ($signed(((8'hb3) & (8'hbd))) >= {{wire74}})));
          if (reg115[(4'hb):(3'h5)])
            begin
              reg122 <= $unsigned((((|(reg110 ~^ wire10)) ?
                  {(wire11 && (8'hba)),
                      (reg112 ?
                          reg117 : (8'ha9))} : (|$signed(reg120))) >> ({reg115[(1'h1):(1'h1)]} <<< ((~^reg114) >> reg117))));
              reg123 <= $unsigned($signed($signed(((!wire26) <<< (wire6 ^~ (8'ha3))))));
              reg124 <= $unsigned((~^(-(reg122 ? $signed(reg110) : (^wire7)))));
              reg125 <= ((^($signed({reg111}) ?
                  ((reg123 ?
                      reg120 : reg121) ^ (wire107 != (8'hbb))) : (~(reg113 ?
                      wire8 : wire76)))) << (($unsigned(reg120[(3'h6):(2'h3)]) - reg118) || wire8));
              reg126 <= {$signed($signed((-{reg119}))),
                  (^~(({wire11, (8'ha1)} || ((8'hb8) ?
                      reg116 : reg119)) << $signed({reg123, (8'had)})))};
            end
          else
            begin
              reg122 <= {$signed($unsigned((wire24 <= (reg112 + wire10)))),
                  $unsigned($signed($signed(reg111[(2'h3):(1'h1)])))};
              reg123 <= ($signed({(((8'hab) << (8'hb7)) ?
                      reg114[(1'h0):(1'h0)] : reg120)}) ^~ ((wire74 >> $unsigned((reg116 ?
                      reg114 : wire107))) ?
                  $unsigned(($unsigned(wire10) <= reg109)) : (({wire107} ?
                          (wire8 ? wire11 : reg122) : $signed((8'hac))) ?
                      ($signed(wire10) | (wire8 ?
                          reg117 : reg126)) : ($signed(reg119) << $signed(reg118)))));
              reg124 <= {$signed((^~{$signed(wire6)}))};
              reg125 <= (($unsigned(((8'had) >= (~reg118))) ?
                      wire107 : reg109[(2'h2):(1'h1)]) ?
                  (reg125[(2'h2):(2'h2)] ?
                      $unsigned({(reg115 | wire7)}) : $unsigned((~$signed(reg123)))) : (($unsigned($signed(reg121)) ?
                          ((reg112 || (7'h40)) >>> wire10) : $signed($signed(wire11))) ?
                      (-{(reg122 == wire74)}) : (!reg120[(2'h2):(1'h1)])));
            end
        end
      reg127 <= $unsigned({(({reg111} & ((8'hb1) ? wire9 : wire7)) ?
              (~reg114[(3'h5):(1'h1)]) : (wire9[(4'hf):(3'h7)] ?
                  reg112[(1'h1):(1'h1)] : (^wire107)))});
    end
  assign wire128 = (+wire26[(1'h0):(1'h0)]);
  assign wire129 = reg110[(2'h3):(1'h1)];
  assign wire130 = $signed((~reg120));
  assign wire131 = ((reg125[(1'h1):(1'h1)] >>> wire76[(2'h3):(2'h3)]) ?
                       (^~reg118[(2'h3):(2'h3)]) : ($unsigned(reg118[(1'h1):(1'h0)]) ?
                           $signed(reg115[(5'h10):(4'hc)]) : (($unsigned(wire10) ?
                               reg111[(4'h9):(1'h0)] : (^reg111)) << $signed($unsigned(wire24)))));
  always
    @(posedge clk) begin
      reg132 <= ({reg126[(4'h9):(1'h1)]} >> reg125);
      reg133 <= ((({reg118,
              (reg125 ?
                  (7'h44) : reg111)} >>> $signed((reg110 > reg127))) >= (+(^~reg112[(2'h2):(2'h2)]))) ?
          (wire128 << (~|$signed((wire24 ?
              reg110 : reg111)))) : ({($unsigned(wire24) & $signed((8'hb6)))} ^ (reg121[(3'h4):(1'h1)] ?
              reg116[(4'hb):(4'ha)] : (~|$unsigned(reg109)))));
      reg134 <= ((|$signed($signed((^reg124)))) ?
          (~^(-(reg112[(2'h3):(2'h3)] >>> {reg124,
              wire6}))) : (&wire76[(4'ha):(3'h5)]));
      reg135 <= $signed(reg112);
    end
  assign wire136 = reg110;
endmodule

module module77  (y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire81;
  input wire signed [(4'ha):(1'h0)] wire80;
  input wire [(5'h14):(1'h0)] wire79;
  input wire [(4'hf):(1'h0)] wire78;
  wire [(4'hf):(1'h0)] wire106;
  wire [(4'h8):(1'h0)] wire85;
  wire [(4'he):(1'h0)] wire84;
  reg signed [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(3'h5):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg98 = (1'h0);
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  reg [(4'hf):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(4'hd):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg92 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(4'hb):(1'h0)] reg90 = (1'h0);
  reg [(5'h10):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  assign y = {wire106,
                 wire85,
                 wire84,
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
                 reg83,
                 reg82,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg82 <= (~|wire80[(4'h9):(4'h8)]);
      reg83 <= ((~|(wire78[(1'h1):(1'h0)] & (((8'hb1) ? reg82 : wire79) ?
              $signed(wire81) : {wire78}))) ?
          ($signed((8'hb2)) ?
              (^~((reg82 ?
                  wire80 : wire79) + reg82[(2'h3):(1'h1)])) : (~|wire79[(5'h11):(4'h8)])) : (((reg82[(1'h0):(1'h0)] != wire80) ?
              wire80[(4'h9):(4'h8)] : $unsigned(wire81[(4'h8):(3'h6)])) < reg82[(3'h5):(1'h0)]));
    end
  assign wire84 = (($signed($signed((~|wire79))) <<< $unsigned(wire81[(1'h1):(1'h0)])) * $signed((reg83[(2'h2):(1'h0)] & ($signed(reg82) ^~ (~|wire80)))));
  assign wire85 = wire79;
  always
    @(posedge clk) begin
      reg86 <= (~&$signed($unsigned((-wire80))));
      reg87 <= (8'hac);
      if ((((((reg86 ? wire81 : wire84) || (^~reg86)) ?
              (wire78[(4'ha):(3'h6)] <<< (7'h41)) : (-(reg87 <= wire78))) ?
          wire85[(3'h7):(1'h0)] : ((reg86[(2'h3):(1'h0)] != (7'h42)) ?
              $unsigned(((8'hb2) > reg87)) : {{reg86}})) & (~^{reg87[(3'h7):(3'h6)]})))
        begin
          reg88 <= (wire85 ^ ((($signed(wire80) == wire79) >> (reg87[(2'h3):(2'h2)] && wire78[(4'h8):(2'h2)])) & wire79[(3'h4):(1'h0)]));
          reg89 <= ((~&(~&$unsigned((&wire78)))) ?
              (~&(8'ha2)) : (reg88 ?
                  {((reg83 ?
                          wire85 : wire81) && wire84)} : wire81[(2'h2):(2'h2)]));
          reg90 <= (^~$unsigned(((~|wire78) ?
              (reg86 != $unsigned((8'hb0))) : ((~|reg82) ?
                  (!wire79) : $unsigned(wire80)))));
          reg91 <= wire84[(1'h1):(1'h1)];
        end
      else
        begin
          reg88 <= {(+wire80[(1'h1):(1'h0)])};
          reg89 <= (-$signed((!$signed((reg90 ? wire79 : reg90)))));
          reg90 <= (wire79 ?
              (&(&$unsigned((~reg86)))) : (^reg90[(4'ha):(3'h6)]));
        end
      reg92 <= ($unsigned((~^reg87)) > {$unsigned((^$signed(reg88))), reg91});
      if (wire81[(2'h2):(2'h2)])
        begin
          reg93 <= (8'ha7);
          reg94 <= reg90;
          if (((reg91 ?
                  (~((8'hbb) - (reg93 & (8'hab)))) : reg83[(1'h0):(1'h0)]) ?
              wire80 : ((8'ha3) ?
                  (reg94[(2'h3):(2'h2)] ^~ (~&(reg86 ?
                      reg86 : wire79))) : (~^wire84))))
            begin
              reg95 <= {$signed(reg86[(1'h1):(1'h0)]),
                  {({(~|wire78)} ?
                          ((reg86 ? wire85 : reg82) ?
                              wire79[(3'h7):(3'h4)] : reg82[(3'h7):(2'h3)]) : (~wire85[(1'h0):(1'h0)])),
                      wire80}};
              reg96 <= $unsigned(wire79[(4'hd):(4'hd)]);
              reg97 <= (+reg91[(3'h5):(3'h4)]);
              reg98 <= reg93[(2'h3):(1'h1)];
              reg99 <= (~^($signed({$signed(reg90), wire78[(4'hc):(4'h9)]}) ?
                  $unsigned($unsigned({reg92})) : (($signed(reg86) ?
                          $signed(reg87) : (wire78 - reg90)) ?
                      (wire84[(3'h4):(2'h3)] >>> (reg89 ?
                          reg90 : (8'ha0))) : $signed((wire79 < reg90)))));
            end
          else
            begin
              reg95 <= ((~&(-(+wire84[(4'hc):(4'h9)]))) > $signed({(reg91[(3'h5):(1'h1)] ?
                      reg99[(1'h1):(1'h1)] : reg98),
                  ((reg90 >> wire84) ?
                      (reg90 <<< reg89) : reg91[(1'h0):(1'h0)])}));
              reg96 <= (($unsigned(($signed((7'h44)) ? (^~wire78) : reg82)) ?
                      wire78[(1'h0):(1'h0)] : $signed((!reg88[(5'h10):(4'he)]))) ?
                  (8'h9f) : (~&$signed(reg95)));
              reg97 <= (+$signed(($signed((reg99 ? reg89 : (8'hab))) ?
                  $signed($signed(reg98)) : {((8'haa) ^ reg86),
                      reg93[(4'ha):(2'h2)]})));
              reg98 <= (8'hbe);
              reg99 <= ((|$unsigned({(~wire85)})) ?
                  $signed((+$signed((reg97 - reg89)))) : $signed(reg90));
            end
          reg100 <= wire81;
          reg101 <= ($signed(reg83[(4'hc):(3'h6)]) ?
              $unsigned(((+(reg95 ?
                  reg94 : reg96)) - (~&(reg96 | reg94)))) : reg97[(4'ha):(4'h8)]);
        end
      else
        begin
          reg93 <= wire78;
          reg94 <= reg87[(3'h4):(1'h1)];
          if ((reg98 ? $signed($signed($unsigned(reg99))) : (^reg83)))
            begin
              reg95 <= (^$signed((wire79[(3'h7):(3'h5)] ?
                  {reg92[(4'ha):(1'h1)], (^reg95)} : (^$unsigned(reg93)))));
            end
          else
            begin
              reg95 <= (($signed(wire79) ?
                      ((^~{wire84, reg94}) ?
                          (reg82 ?
                              (~(8'hab)) : wire79[(4'ha):(3'h4)]) : {(wire81 ?
                                  reg96 : reg87)}) : $unsigned((~(~^reg100)))) ?
                  ((~^wire79[(4'hd):(3'h7)]) ?
                      reg86[(2'h3):(1'h1)] : (($unsigned(reg100) ?
                              (wire80 ? reg89 : reg99) : (reg92 ?
                                  reg96 : wire80)) ?
                          $signed(reg83[(3'h5):(2'h3)]) : wire78[(3'h4):(1'h1)])) : (8'hb8));
            end
          if (reg96)
            begin
              reg96 <= (reg87 >>> $unsigned(((reg92[(4'ha):(2'h2)] ?
                  (reg101 << wire84) : (reg91 ^ reg92)) > reg89[(4'he):(4'hd)])));
              reg97 <= ((8'had) ~^ (~^$unsigned(($unsigned(wire80) ?
                  (reg87 & (8'ha0)) : (reg92 ? reg87 : (8'h9e))))));
            end
          else
            begin
              reg96 <= reg88[(4'hf):(4'hc)];
              reg97 <= (wire78 <= $signed((reg95 ?
                  $signed((reg100 ^ wire84)) : wire80[(3'h4):(1'h0)])));
              reg98 <= wire79[(3'h7):(1'h0)];
              reg99 <= (^~reg91);
              reg100 <= (!(!reg95));
            end
        end
    end
  always
    @(posedge clk) begin
      reg102 <= ($unsigned((reg91[(3'h4):(1'h0)] || (^reg82))) * (^wire80));
      reg103 <= $unsigned($signed($signed((8'hbe))));
      reg104 <= ($unsigned({(~&reg95), $unsigned((-reg103))}) ?
          reg89 : (|({reg89[(2'h2):(1'h0)]} ?
              $signed(reg86[(2'h2):(1'h0)]) : reg102)));
      reg105 <= {{{($unsigned(reg91) ?
                      reg94[(4'hd):(4'ha)] : $unsigned(reg92))},
              wire79[(4'he):(4'ha)]}};
    end
  assign wire106 = $unsigned($signed({$unsigned((~&reg92))}));
endmodule

module module27  (y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h1d0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire32;
  input wire [(5'h14):(1'h0)] wire31;
  input wire [(5'h13):(1'h0)] wire30;
  input wire signed [(5'h10):(1'h0)] wire29;
  input wire [(4'h8):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  wire signed [(3'h7):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire33;
  reg signed [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
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
                 (1'h0)};
  assign wire33 = (+wire32[(3'h6):(3'h6)]);
  assign wire34 = wire31[(4'hf):(4'h9)];
  assign wire35 = $signed(wire32);
  assign wire36 = $unsigned({wire32});
  assign wire37 = ($signed(($unsigned(wire36) + $unsigned($signed((8'haa))))) == $signed((wire28[(3'h5):(1'h1)] ?
                      {$signed((8'hab)), $signed(wire31)} : wire36)));
  assign wire38 = {wire35[(2'h2):(1'h0)]};
  assign wire39 = ($unsigned($unsigned($signed((wire32 ^ wire29)))) < {wire33});
  assign wire40 = wire37;
  assign wire41 = wire40;
  assign wire42 = ((~(8'ha1)) != $unsigned(wire38));
  assign wire43 = {($signed((wire32 * (wire34 + wire37))) * $signed($unsigned((wire30 ?
                          (8'hbf) : wire42))))};
  assign wire44 = (($unsigned((&(wire28 ? wire32 : wire29))) ~^ {wire41,
                      $unsigned((^~wire41))}) >= (^(^wire43)));
  assign wire45 = (wire35[(1'h1):(1'h0)] >= (wire29[(3'h5):(1'h1)] ~^ ((((8'hb7) ?
                          wire40 : (8'ha1)) ?
                      $signed(wire29) : (|wire31)) - $unsigned((wire36 - wire28)))));
  assign wire46 = ({({$signed(wire45), wire31} ?
                          $unsigned(wire37[(3'h6):(2'h3)]) : ((8'hb9) ?
                              wire45[(2'h2):(1'h0)] : wire43[(3'h7):(2'h3)])),
                      $signed({(~wire32)})} * wire43);
  assign wire47 = wire46[(4'hc):(3'h7)];
  always
    @(posedge clk) begin
      reg48 <= (wire40 - {(((wire39 ? (8'hbf) : wire42) ?
              wire46[(4'hc):(4'hb)] : wire46) > ($unsigned(wire37) ?
              $signed(wire44) : (&(8'hbf))))});
      if (((($unsigned((wire43 ? wire40 : wire39)) - (~(wire40 ?
                  (8'ha2) : wire36))) ?
              $unsigned(wire30[(4'h8):(3'h4)]) : (8'hb5)) ?
          $unsigned(((wire45[(3'h4):(1'h1)] ? {wire38} : {(8'hb1), wire30}) ?
              (&$signed((8'hb5))) : wire40)) : wire32[(1'h1):(1'h1)]))
        begin
          if ((^~$signed((wire43 ?
              ((wire35 ? reg48 : wire43) == reg48) : (!(8'ha8))))))
            begin
              reg49 <= (+{wire37});
            end
          else
            begin
              reg49 <= wire41;
            end
          reg50 <= $signed($signed($unsigned({$signed(wire43), wire41})));
          reg51 <= wire38[(2'h2):(1'h0)];
          reg52 <= {(^~$unsigned(wire44))};
          reg53 <= $unsigned(reg49[(3'h5):(1'h1)]);
        end
      else
        begin
          reg49 <= wire40;
          if ((^~{(($unsigned(wire45) ?
                  {reg52} : $signed((8'hb2))) < $unsigned({wire34})),
              {($signed(reg48) <<< (-wire40))}}))
            begin
              reg50 <= wire47[(3'h6):(3'h6)];
              reg51 <= reg49[(2'h2):(1'h1)];
            end
          else
            begin
              reg50 <= $unsigned(wire45[(2'h2):(1'h1)]);
              reg51 <= (wire30[(4'hb):(4'h8)] << ((wire33[(4'ha):(2'h2)] && wire43) || wire34[(1'h1):(1'h0)]));
              reg52 <= (^~wire41[(1'h0):(1'h0)]);
            end
          reg53 <= {{wire45, $signed($unsigned((wire44 ? wire42 : wire40)))}};
          reg54 <= $unsigned($signed((((wire28 ?
                  reg51 : wire33) - $signed(wire37)) ?
              (7'h40) : (!((8'ha7) - reg50)))));
        end
      reg55 <= $unsigned(wire35);
      if ($unsigned((($signed((wire33 ?
              wire45 : reg51)) - reg55[(2'h2):(1'h1)]) ?
          {((~^wire32) * wire30),
              (wire34 ?
                  $unsigned(wire47) : (wire31 ?
                      wire37 : wire42))} : $signed((wire46 ?
              (+wire30) : wire34)))))
        begin
          reg56 <= ($signed((-{(8'hbd),
              (wire30 >= wire30)})) + (+$signed($unsigned((+wire34)))));
          if (wire44)
            begin
              reg57 <= ($unsigned((((reg51 >>> wire28) ?
                      wire28[(1'h0):(1'h0)] : (reg55 ?
                          wire44 : (8'ha3))) - (~&(wire30 ? reg54 : wire41)))) ?
                  (~&(((wire46 ? wire32 : (8'hb3)) ?
                          $signed((8'ha4)) : (~|reg55)) ?
                      (wire28 ?
                          ((8'ha6) <= wire40) : reg56) : $signed((!(8'haf))))) : $unsigned(($signed((~&wire33)) ^~ (|(^~wire31)))));
              reg58 <= (-(~((!(|wire33)) ?
                  wire35[(4'h9):(2'h3)] : wire40[(3'h7):(1'h1)])));
              reg59 <= {$signed((8'hb2)), reg55};
              reg60 <= ($signed(($signed((reg53 <<< wire28)) ?
                      (wire43 * wire42) : reg56[(3'h5):(2'h3)])) ?
                  (~$signed(($unsigned(reg48) != $unsigned(reg50)))) : (reg55[(1'h1):(1'h0)] ?
                      {$signed(wire40[(3'h4):(2'h3)]),
                          ((wire38 < wire46) ~^ $unsigned(wire36))} : wire43[(4'hd):(3'h6)]));
              reg61 <= ((((reg60 + (wire39 & (8'hb8))) ?
                          ((reg49 ?
                              reg58 : wire30) || (~reg57)) : wire38[(3'h5):(2'h2)]) ?
                      reg60[(4'hd):(4'hd)] : wire35) ?
                  $unsigned($unsigned(reg58)) : $signed($signed({{wire37,
                          wire32}})));
            end
          else
            begin
              reg57 <= ($unsigned($unsigned($unsigned($unsigned(reg52)))) ?
                  {(wire35[(3'h4):(1'h1)] >= $signed(wire37)),
                      wire38[(4'hb):(3'h7)]} : wire30[(4'ha):(3'h7)]);
              reg58 <= $signed((wire44[(4'he):(4'hd)] & (wire44[(4'h8):(3'h7)] ?
                  $unsigned((wire40 ?
                      (7'h42) : (8'ha5))) : {wire29[(1'h1):(1'h1)]})));
              reg59 <= (|wire32[(2'h2):(1'h1)]);
              reg60 <= $unsigned({$unsigned((8'hb9))});
            end
          reg62 <= reg56;
        end
      else
        begin
          reg56 <= {reg58};
        end
    end
  always
    @(posedge clk) begin
      reg63 <= reg53;
      reg64 <= $signed(reg59);
      if ($unsigned((8'hab)))
        begin
          reg65 <= wire42;
          if (reg55[(3'h4):(3'h4)])
            begin
              reg66 <= $signed(wire29[(4'ha):(3'h7)]);
              reg67 <= $unsigned(({$unsigned(reg61), reg65} ?
                  ((8'h9c) ?
                      reg52 : $unsigned({wire43,
                          reg56})) : $signed($unsigned(reg49[(2'h2):(1'h1)]))));
              reg68 <= (reg54 ? reg54 : wire40);
              reg69 <= $signed(wire34);
            end
          else
            begin
              reg66 <= reg49;
              reg67 <= (^~(reg65 * (!(~&reg54[(4'hc):(3'h6)]))));
              reg68 <= $signed((reg60[(2'h3):(1'h1)] < $signed(wire33)));
            end
          reg70 <= ((&(8'hb7)) ?
              $unsigned({(~&$signed(reg49))}) : $unsigned((~&reg48)));
          reg71 <= wire41[(1'h1):(1'h1)];
          reg72 <= $unsigned($unsigned(reg53));
        end
      else
        begin
          reg65 <= $signed(reg54);
        end
      reg73 <= $signed(wire32);
    end
endmodule

module module12
#(parameter param22 = (~&(&({{(8'ha1), (8'haa)}, ((8'ha7) ? (7'h44) : (8'h9c))} ? ((!(8'hb1)) ? ((7'h42) ? (8'hb6) : (8'hbb)) : ((8'ha2) ^~ (8'hae))) : ((^(8'h9f)) && ((8'hab) ? (8'hab) : (8'hb8)))))), 
parameter param23 = (~&((param22 >= (param22 <= (~param22))) || (&param22))))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire17;
  input wire [(4'hd):(1'h0)] wire16;
  input wire [(4'hd):(1'h0)] wire15;
  input wire [(3'h5):(1'h0)] wire14;
  input wire signed [(5'h11):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire18;
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  assign y = {wire21, wire20, wire18, reg19, (1'h0)};
  assign wire18 = ({$signed(wire16[(2'h3):(2'h2)])} > $signed({($unsigned((8'had)) ?
                          (wire16 ? (8'hb9) : wire16) : {(8'hb8), (8'ha3)}),
                      $signed(((8'ha1) > wire15))}));
  always
    @(posedge clk) begin
      reg19 <= $signed((~^wire18));
    end
  assign wire20 = wire16[(4'ha):(2'h3)];
  assign wire21 = $unsigned($unsigned({(8'ha3),
                      (((8'hae) ? wire15 : wire20) ?
                          (wire14 ? wire18 : wire15) : $unsigned(wire20))}));
endmodule
