module top
#(parameter param196 = (((((^~(8'had)) >> {(8'ha1), (8'ha6)}) < (!((8'ha4) & (7'h40)))) ? (8'ha0) : (~^{((8'ha6) > (8'hb8)), (&(7'h43))})) ? ({((~(8'ha3)) <<< ((8'hb5) ? (8'hab) : (8'had)))} ? ((~&(|(8'hac))) != (-((8'ha2) >> (8'ha5)))) : (&(((8'hbc) >>> (8'had)) >>> ((8'ha4) || (8'h9c))))) : (&(&(8'h9f)))), 
parameter param197 = param196)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h26e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire190;
  wire [(4'hf):(1'h0)] wire189;
  wire [(5'h11):(1'h0)] wire188;
  wire signed [(5'h13):(1'h0)] wire171;
  wire [(2'h2):(1'h0)] wire170;
  wire [(5'h13):(1'h0)] wire169;
  wire [(2'h3):(1'h0)] wire168;
  wire [(3'h4):(1'h0)] wire161;
  wire [(4'h8):(1'h0)] wire112;
  wire [(2'h3):(1'h0)] wire99;
  wire signed [(4'hc):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire84;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire163;
  wire signed [(4'h9):(1'h0)] wire164;
  wire signed [(5'h12):(1'h0)] wire165;
  wire [(5'h13):(1'h0)] wire166;
  reg signed [(5'h14):(1'h0)] reg195 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg193 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg192 = (1'h0);
  reg signed [(4'he):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg187 = (1'h0);
  reg [(4'he):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg185 = (1'h0);
  reg [(5'h10):(1'h0)] reg184 = (1'h0);
  reg [(3'h4):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg182 = (1'h0);
  reg [(5'h14):(1'h0)] reg181 = (1'h0);
  reg [(3'h4):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg179 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg178 = (1'h0);
  reg [(4'he):(1'h0)] reg177 = (1'h0);
  reg [(2'h2):(1'h0)] reg176 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg174 = (1'h0);
  reg signed [(4'he):(1'h0)] reg173 = (1'h0);
  reg [(4'h8):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg5 = (1'h0);
  reg [(5'h11):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(3'h6):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg97 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  assign y = {wire190,
                 wire189,
                 wire188,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire161,
                 wire112,
                 wire99,
                 wire86,
                 wire84,
                 wire6,
                 wire163,
                 wire164,
                 wire165,
                 wire166,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg5,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ($signed(wire0) >= $unsigned($signed($unsigned($unsigned(wire2)))));
    end
  assign wire6 = reg5[(5'h10):(4'ha)];
  module7 #() modinst85 (wire84, clk, wire2, wire0, wire3, wire1, reg5);
  assign wire86 = wire84[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg87 <= (wire3[(3'h4):(1'h1)] ^ $signed((~^(wire0 * reg5[(3'h4):(2'h3)]))));
      reg88 <= {$unsigned((~|wire6[(4'hb):(3'h4)]))};
      if ({$unsigned({$signed($signed(wire6))}),
          $unsigned($unsigned(wire0[(1'h1):(1'h0)]))})
        begin
          if (($signed(($signed((wire86 >>> wire2)) ?
                  (wire2[(1'h1):(1'h0)] ^ wire84[(3'h7):(3'h6)]) : $unsigned((wire3 ?
                      (8'hb1) : wire6)))) ?
              {($signed((8'hb1)) && (wire2[(4'h8):(3'h6)] ?
                      (reg87 ?
                          reg5 : reg5) : wire1[(4'hf):(2'h3)]))} : (~&($signed(reg88[(4'hc):(3'h7)]) ?
                  (+(reg87 - reg87)) : (wire86[(3'h7):(3'h7)] < wire1[(1'h0):(1'h0)])))))
            begin
              reg89 <= (wire4[(1'h0):(1'h0)] >= (~|wire86));
              reg90 <= (8'had);
            end
          else
            begin
              reg89 <= (!(+((~^(|wire3)) ?
                  (reg5 ?
                      $unsigned(reg87) : (-reg89)) : $signed($unsigned(wire4)))));
              reg90 <= (^~((~&(^~((7'h40) >> (7'h41)))) ?
                  wire86[(4'hc):(3'h4)] : (wire3[(3'h4):(1'h1)] ?
                      ((wire84 ? wire1 : reg88) ?
                          $unsigned(reg5) : {reg89}) : ((wire3 ?
                              (7'h43) : reg90) ?
                          wire4[(4'ha):(2'h2)] : (wire6 ? reg5 : reg5)))));
              reg91 <= ($signed(((wire2[(1'h1):(1'h0)] && (~&wire4)) >= (wire84[(4'h8):(2'h2)] ?
                  $unsigned(wire84) : ((7'h42) >> wire2)))) ~^ wire1[(4'h8):(3'h5)]);
              reg92 <= wire1[(4'h9):(1'h0)];
            end
        end
      else
        begin
          reg89 <= ((((~{(8'ha5)}) < reg90) >= ($signed($unsigned(reg5)) ?
                  {(~^reg91), (wire2 ? wire2 : reg90)} : (wire3 ?
                      $unsigned(reg89) : $unsigned(wire2)))) ?
              (reg91 == {$unsigned($signed(wire1)),
                  (&(wire1 ? wire84 : wire2))}) : wire4[(1'h0):(1'h0)]);
          reg90 <= $signed(({(reg91[(3'h7):(2'h2)] ?
                      (reg89 ? reg91 : reg92) : (^(8'h9f))),
                  $signed((wire4 * reg87))} ?
              $signed(((reg5 ? reg92 : (8'hb1)) == {wire86,
                  wire86})) : (($signed((8'hb0)) && $unsigned(reg87)) ?
                  reg87 : {$unsigned(wire0)})));
        end
      if ({(($signed($unsigned(reg89)) <<< (wire0 >= {wire84, reg89})) ?
              $signed((reg91[(3'h4):(2'h2)] - $unsigned(wire3))) : {({wire1,
                          (8'hbc)} ?
                      ((7'h42) ? reg89 : (8'hbf)) : $unsigned(wire86))})})
        begin
          reg93 <= (+$unsigned($signed(($signed(reg90) >> $unsigned(reg90)))));
          reg94 <= wire0;
          reg95 <= (8'hb9);
        end
      else
        begin
          if ((~^$unsigned((((8'hb2) ?
              wire6[(4'h9):(3'h4)] : reg89[(2'h3):(2'h3)]) & ({wire0,
              reg90} & (^wire86))))))
            begin
              reg93 <= reg89;
              reg94 <= $unsigned($signed($unsigned(wire2[(3'h6):(3'h5)])));
            end
          else
            begin
              reg93 <= $unsigned($signed(wire0));
              reg94 <= ($unsigned(reg93) ?
                  $signed({($unsigned(wire4) << $signed((8'ha5))),
                      {reg91,
                          (+reg5)}}) : ((reg91[(4'ha):(1'h1)] < (^$unsigned(wire3))) ?
                      ($signed(((7'h40) ? reg88 : (8'haf))) ?
                          ($unsigned(reg89) ?
                              wire4 : (wire86 ^~ reg88)) : $unsigned($unsigned(wire4))) : (((reg94 >= wire3) ?
                          reg92[(1'h1):(1'h1)] : reg89[(1'h0):(1'h0)]) | $signed($unsigned((8'ha1))))));
            end
          reg95 <= $signed($unsigned(reg90));
          reg96 <= $signed(wire4);
          reg97 <= $signed({$unsigned((8'hb2))});
        end
      reg98 <= $unsigned(reg90);
    end
  assign wire99 = $signed((8'hbc));
  module100 #() modinst113 (.wire104(wire3), .y(wire112), .wire102(reg93), .clk(clk), .wire103(wire86), .wire101(reg5));
  module114 #() modinst162 (wire161, clk, reg95, reg92, reg5, reg93, wire84);
  assign wire163 = $signed(wire3[(4'hc):(2'h3)]);
  assign wire164 = (((7'h44) ?
                           (reg5 ?
                               (&$unsigned(reg90)) : (wire4[(3'h5):(2'h2)] ?
                                   $signed(wire163) : (wire4 ?
                                       wire84 : wire86))) : $unsigned($unsigned((8'haa)))) ?
                       ((($signed(reg87) ?
                               $unsigned(reg98) : $signed(reg97)) << $signed((reg93 & wire6))) ?
                           {(!(|reg87)),
                               ((reg98 ? wire84 : wire3) ?
                                   (wire4 * reg93) : (~wire84))} : $unsigned(((!wire1) >> (reg97 ^~ reg97)))) : wire99);
  assign wire165 = (-{$signed(($unsigned(wire1) < wire84[(5'h10):(3'h6)])),
                       $unsigned(wire86[(3'h5):(3'h4)])});
  module45 #() modinst167 (.y(wire166), .wire48(reg89), .clk(clk), .wire47(wire165), .wire46(reg90), .wire49(reg96));
  assign wire168 = wire0;
  assign wire169 = (wire161[(3'h4):(3'h4)] ?
                       reg98[(5'h10):(3'h5)] : {{wire161[(2'h2):(2'h2)],
                               $unsigned(wire84)}});
  assign wire170 = ($unsigned(wire4[(1'h0):(1'h0)]) > (~|$unsigned(reg93)));
  assign wire171 = (wire163[(3'h5):(3'h4)] ?
                       wire164 : {(&reg90), wire170[(2'h2):(2'h2)]});
  always
    @(posedge clk) begin
      if (wire86[(3'h6):(2'h3)])
        begin
          reg172 <= ($signed($unsigned($unsigned({wire6,
              reg95}))) == reg96[(2'h2):(1'h0)]);
        end
      else
        begin
          reg172 <= $signed((~&(~^reg91)));
          reg173 <= ((7'h43) ? wire161[(2'h3):(1'h0)] : reg94);
          if (reg90)
            begin
              reg174 <= $signed($unsigned(($signed(reg90) ?
                  $unsigned(reg92) : wire171)));
              reg175 <= ((((^$unsigned(reg174)) ?
                  ($unsigned(reg90) ?
                      wire163 : reg172) : {$signed(wire170)}) ^ (8'ha3)) || $signed(reg173));
              reg176 <= (wire165[(1'h0):(1'h0)] == (8'ha0));
            end
          else
            begin
              reg174 <= (&$unsigned((~{reg174, (wire166 != reg174)})));
            end
          if ($unsigned($unsigned((((!wire169) ? $unsigned(reg174) : reg90) ?
              (8'hab) : (|reg173)))))
            begin
              reg177 <= ((((^(^~wire99)) ?
                      (reg89[(2'h3):(1'h0)] ?
                          $unsigned((8'hb1)) : reg88[(3'h4):(1'h0)]) : ((reg175 ?
                              wire0 : wire0) ?
                          wire163[(2'h3):(1'h1)] : wire169)) && wire166) ?
                  (~^{$unsigned(reg176[(1'h1):(1'h0)])}) : (($unsigned((7'h44)) ?
                          (reg174 ?
                              $signed(reg175) : reg175) : {(reg88 >> wire112),
                              wire1[(4'h8):(1'h1)]}) ?
                      wire165 : $unsigned(($unsigned((8'h9d)) ?
                          {reg5, reg93} : $signed(reg93)))));
            end
          else
            begin
              reg177 <= $unsigned(reg88);
              reg178 <= (wire84[(4'hb):(3'h7)] ? wire86 : {wire169});
            end
          reg179 <= $unsigned((((8'hb4) ?
              $signed({(8'ha6),
                  (8'ha9)}) : {(reg89 | reg97)}) != (~&(wire164[(3'h5):(3'h4)] <<< (8'hb1)))));
        end
      reg180 <= (($unsigned($signed(reg90[(3'h4):(2'h2)])) ?
          reg93 : (+$signed($signed(wire6)))) <<< (reg173 ?
          ($unsigned(reg96[(3'h4):(1'h1)]) ^ (^$unsigned((8'hbe)))) : (~^$unsigned(reg98))));
      reg181 <= ((~|reg96) ?
          ((wire169[(4'ha):(2'h2)] ^~ wire99) != (~&wire99[(1'h1):(1'h0)])) : {(wire112 || wire168),
              $signed((8'h9d))});
      if (($unsigned(wire168) >= ({reg98} <= (~^wire164))))
        begin
          reg182 <= (wire168 ?
              (wire163 ?
                  reg176[(2'h2):(2'h2)] : wire170[(1'h1):(1'h0)]) : (((+{wire163}) ?
                      (^$signed(reg181)) : (|$signed((8'hac)))) ?
                  (wire166 ?
                      ($signed((8'h9e)) ?
                          (~&(8'hae)) : wire4) : (~|((8'ha4) | reg181))) : wire0[(4'hd):(4'hc)]));
          if ($unsigned((^~(-((reg5 ?
              reg92 : (8'ha8)) || reg93[(3'h6):(1'h1)])))))
            begin
              reg183 <= (|(((&((8'h9d) ? wire164 : reg172)) ?
                      ((!wire99) + (wire112 ?
                          wire166 : reg182)) : ((reg180 ^ reg89) ?
                          reg97[(1'h1):(1'h1)] : (wire2 ? reg177 : wire3))) ?
                  wire0 : reg180));
              reg184 <= $signed($unsigned((((reg88 ? reg177 : wire86) ?
                  (reg172 != reg176) : (reg90 ?
                      wire4 : reg183)) << (-reg175[(2'h2):(1'h1)]))));
              reg185 <= wire112;
              reg186 <= (($signed({(wire4 ?
                      wire112 : reg92)}) * wire1) < ((~(wire170 ?
                      reg176 : wire163)) ?
                  (($signed((7'h44)) ? wire170 : (wire86 >>> reg182)) ?
                      ({(8'hb9), (8'hbb)} ?
                          (wire169 ^~ reg97) : wire163[(2'h3):(2'h3)]) : reg90) : $signed({{reg177,
                          reg183},
                      (reg181 ? wire0 : wire3)})));
              reg187 <= ($unsigned(((reg180[(1'h0):(1'h0)] - (~&wire3)) ?
                  {$signed(wire171)} : $unsigned($unsigned(wire4)))) ~^ (~wire2));
            end
          else
            begin
              reg183 <= $signed(wire99);
            end
        end
      else
        begin
          reg182 <= $signed(wire163[(3'h5):(2'h3)]);
          reg183 <= reg5[(4'hc):(4'hb)];
          reg184 <= {{reg173}, reg176};
        end
    end
  assign wire188 = $signed((&(wire168[(2'h3):(1'h1)] ?
                       (8'hbf) : {wire168, $signed((8'h9e))})));
  assign wire189 = (^~(-(wire6[(3'h5):(1'h0)] ?
                       $signed($unsigned((8'h9f))) : (+(|reg95)))));
  assign wire190 = ($signed(reg91[(4'hd):(4'h9)]) << (^~$signed(wire163[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg191 <= reg97;
      reg192 <= (8'had);
      reg193 <= ({$unsigned($signed(wire2[(2'h3):(2'h3)]))} ?
          (reg175[(1'h0):(1'h0)] ?
              $unsigned(wire165[(4'h8):(3'h5)]) : reg90[(3'h6):(1'h0)]) : $unsigned(($unsigned((^~wire4)) ?
              (~&wire84[(1'h0):(1'h0)]) : $unsigned($unsigned((8'hb7))))));
      reg194 <= reg5[(5'h11):(4'hf)];
      reg195 <= ({((|(reg192 ~^ reg95)) > wire2[(3'h5):(1'h1)]),
              (+($signed(reg89) || reg187[(1'h1):(1'h1)]))} ?
          (reg97 ?
              ($signed($unsigned(reg92)) ~^ {$unsigned(wire165),
                  reg176}) : $unsigned($unsigned(reg185))) : (({(reg193 || reg175)} - $signed(wire1)) ?
              (!{{reg178, reg182}, reg194}) : $unsigned(reg90[(3'h6):(1'h0)])));
    end
endmodule

module module114  (y, clk, wire119, wire118, wire117, wire116, wire115);
  output wire [(32'h1dd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire119;
  input wire signed [(4'he):(1'h0)] wire118;
  input wire signed [(4'hd):(1'h0)] wire117;
  input wire signed [(5'h14):(1'h0)] wire116;
  input wire signed [(5'h13):(1'h0)] wire115;
  wire signed [(5'h11):(1'h0)] wire160;
  wire [(4'hd):(1'h0)] wire159;
  wire [(5'h15):(1'h0)] wire158;
  wire [(4'he):(1'h0)] wire157;
  wire [(3'h5):(1'h0)] wire156;
  wire signed [(2'h3):(1'h0)] wire155;
  wire [(5'h12):(1'h0)] wire138;
  wire [(4'h8):(1'h0)] wire137;
  wire [(4'hd):(1'h0)] wire128;
  reg signed [(3'h4):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg153 = (1'h0);
  reg [(2'h3):(1'h0)] reg152 = (1'h0);
  reg [(3'h4):(1'h0)] reg151 = (1'h0);
  reg signed [(4'he):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg148 = (1'h0);
  reg [(4'hf):(1'h0)] reg147 = (1'h0);
  reg [(2'h2):(1'h0)] reg146 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg144 = (1'h0);
  reg [(5'h13):(1'h0)] reg143 = (1'h0);
  reg [(4'hf):(1'h0)] reg142 = (1'h0);
  reg [(5'h13):(1'h0)] reg141 = (1'h0);
  reg [(4'hf):(1'h0)] reg140 = (1'h0);
  reg [(3'h4):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg136 = (1'h0);
  reg [(4'hf):(1'h0)] reg135 = (1'h0);
  reg [(5'h11):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg133 = (1'h0);
  reg [(4'ha):(1'h0)] reg132 = (1'h0);
  reg [(5'h14):(1'h0)] reg131 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg129 = (1'h0);
  reg [(4'ha):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg126 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg123 = (1'h0);
  reg [(4'he):(1'h0)] reg122 = (1'h0);
  reg signed [(4'he):(1'h0)] reg121 = (1'h0);
  reg [(4'h8):(1'h0)] reg120 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire138,
                 wire137,
                 wire128,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(wire118[(4'h9):(2'h3)]))
        begin
          if (($signed((wire117 ?
              ($unsigned((8'hae)) ?
                  wire115[(5'h13):(5'h11)] : (wire118 * wire119)) : wire116[(5'h13):(2'h2)])) <= $unsigned($signed($signed(wire119[(3'h6):(1'h1)])))))
            begin
              reg120 <= (wire118[(2'h3):(2'h2)] && $unsigned(wire116));
              reg121 <= $signed({wire115});
              reg122 <= (wire117[(3'h6):(2'h3)] ?
                  $signed($unsigned($signed($signed(reg120)))) : wire115[(4'hf):(3'h4)]);
            end
          else
            begin
              reg120 <= (^$signed((~{reg122, {reg122}})));
              reg121 <= (~(wire116 ?
                  wire117[(4'h8):(2'h3)] : $unsigned(reg121[(4'hd):(3'h5)])));
              reg122 <= ($unsigned((~|reg121[(3'h4):(2'h2)])) ?
                  (wire119[(3'h6):(3'h4)] > (($signed((8'ha4)) ?
                          (~^wire117) : (^reg122)) ?
                      $signed((wire116 ?
                          (8'ha2) : wire118)) : (wire116 <= (reg120 != wire116)))) : ($unsigned(wire119) == (((wire117 ?
                              reg120 : wire115) ?
                          wire115 : (~wire119)) ?
                      $unsigned($signed((7'h42))) : (wire118 ?
                          (reg120 ? wire118 : (8'hba)) : (^(8'hac))))));
              reg123 <= $signed((+(((reg120 && reg121) <<< reg122[(4'ha):(3'h5)]) + (!$unsigned(wire116)))));
              reg124 <= $unsigned(wire119);
            end
          reg125 <= reg121;
        end
      else
        begin
          reg120 <= ($unsigned(reg120) ?
              ((reg120 < (|$signed(reg123))) ?
                  (($unsigned(reg120) <= wire117) ?
                      $signed(reg120[(4'h8):(4'h8)]) : (reg121 ?
                          wire117[(4'hb):(4'hb)] : $signed((8'had)))) : wire116[(3'h6):(3'h4)]) : $unsigned(reg121[(4'hb):(3'h5)]));
          reg121 <= {reg121[(3'h6):(3'h6)]};
          if (wire115[(1'h0):(1'h0)])
            begin
              reg122 <= $signed({((reg120[(1'h0):(1'h0)] ?
                          reg123[(1'h0):(1'h0)] : wire115[(2'h2):(1'h0)]) ?
                      reg120 : reg124)});
              reg123 <= (7'h44);
              reg124 <= reg121[(4'ha):(1'h1)];
              reg125 <= $unsigned(((^(reg120[(3'h4):(2'h3)] > reg120)) <= $unsigned($signed(wire115))));
            end
          else
            begin
              reg122 <= ((!$signed($signed({reg125}))) || ((((+wire116) || $unsigned(reg122)) || wire118) ^ (((-reg123) ?
                      (reg123 > reg125) : (reg120 < wire116)) ?
                  (~|(^~wire119)) : {{wire116}})));
              reg123 <= (~&wire115[(3'h6):(1'h0)]);
            end
          reg126 <= (^~{({(+reg125)} ?
                  ($unsigned(reg125) ?
                      $unsigned(reg122) : reg125[(1'h0):(1'h0)]) : $unsigned($unsigned(reg120))),
              {$signed(wire117[(3'h4):(2'h2)])}});
        end
      reg127 <= {({$unsigned(reg120), $unsigned((+wire116))} ?
              $signed((reg126[(3'h4):(2'h3)] ~^ $unsigned((8'hab)))) : reg124),
          $signed((reg120 ?
              reg125[(1'h0):(1'h0)] : (reg121[(3'h6):(3'h6)] ?
                  (^reg123) : (8'ha8))))};
    end
  assign wire128 = {$unsigned($unsigned($signed($unsigned(reg124)))),
                       $signed((7'h41))};
  always
    @(posedge clk) begin
      if (($unsigned($signed($unsigned($signed(wire115)))) ?
          (reg127[(4'ha):(3'h4)] == ((8'ha5) ?
              reg124 : $signed(wire128))) : {(8'hbc), wire116[(4'hd):(3'h4)]}))
        begin
          reg129 <= wire116[(3'h6):(3'h6)];
          if ((^~(!$signed((-(reg125 ? reg125 : wire116))))))
            begin
              reg130 <= ({$signed((reg126 ?
                      $signed(wire116) : {reg121,
                          reg123}))} ^~ $signed((reg125 > ((reg126 ?
                  reg125 : reg125) < $signed(reg125)))));
            end
          else
            begin
              reg130 <= $unsigned(wire115[(2'h2):(1'h0)]);
              reg131 <= $unsigned((~$signed((^$unsigned(reg121)))));
              reg132 <= $signed(reg120[(2'h2):(2'h2)]);
            end
          reg133 <= {(|(((~|reg129) ?
                  (reg124 < (8'h9c)) : $signed(wire115)) + reg129[(1'h1):(1'h0)]))};
          reg134 <= reg123;
          reg135 <= (^($signed((&(&reg121))) ?
              reg134[(3'h4):(1'h1)] : (~&(reg127 & $signed(reg134)))));
        end
      else
        begin
          if (reg124)
            begin
              reg129 <= reg132[(1'h0):(1'h0)];
              reg130 <= reg133;
              reg131 <= (|reg123);
              reg132 <= (^reg121);
            end
          else
            begin
              reg129 <= (~&$signed(reg121));
              reg130 <= ($unsigned(({wire117} ? (8'hb5) : wire117)) - reg122);
              reg131 <= (reg127[(4'h9):(3'h5)] + (($signed($unsigned(reg122)) == reg129[(4'h9):(3'h5)]) == ({reg125,
                  $signed(reg121)} - wire118)));
              reg132 <= (-$unsigned(reg132[(3'h6):(1'h1)]));
            end
          reg133 <= (-({($unsigned((8'hbe)) ?
                      reg135[(4'hc):(3'h4)] : $signed(wire118))} ?
              wire116 : ($signed($signed((8'ha7))) ^~ reg129[(4'h8):(2'h2)])));
        end
      reg136 <= reg126;
    end
  assign wire137 = ((-wire128) ?
                       (($unsigned(reg136) ?
                           $unsigned(reg126[(3'h5):(1'h1)]) : (wire118 ?
                               (~^reg136) : reg124[(4'h8):(1'h1)])) + $unsigned(reg135)) : $unsigned(({reg127,
                           (8'hbd)} << ({reg127, reg134} <= $signed(reg136)))));
  assign wire138 = $unsigned((^~($unsigned(reg125[(2'h3):(1'h1)]) ?
                       reg120[(3'h7):(1'h0)] : (^(~wire115)))));
  always
    @(posedge clk) begin
      if ((^reg121))
        begin
          reg139 <= {(!(~^$unsigned({reg131})))};
          reg140 <= reg124;
          reg141 <= (wire115[(4'h9):(3'h4)] ?
              $signed(wire116) : (!(!$unsigned(wire118))));
          reg142 <= ((reg120[(3'h7):(3'h4)] ?
              ((-(^reg120)) == $signed(reg125[(3'h5):(1'h0)])) : $signed($signed((^reg124)))) + (~&$unsigned($signed((&reg130)))));
          reg143 <= reg142[(4'hb):(1'h0)];
        end
      else
        begin
          reg139 <= wire119[(3'h6):(1'h1)];
        end
      reg144 <= (+$signed($unsigned((^{wire118}))));
      if ((8'ha4))
        begin
          reg145 <= reg125[(1'h1):(1'h0)];
          reg146 <= reg131[(5'h11):(3'h7)];
          reg147 <= ((^~$unsigned((~|$signed(reg144)))) ?
              $signed(wire138[(5'h10):(4'ha)]) : reg143[(2'h3):(2'h2)]);
          reg148 <= $signed((8'hae));
          if (reg124[(4'h9):(3'h6)])
            begin
              reg149 <= $signed(($signed($signed((~&wire138))) ^~ (&$unsigned($unsigned(wire138)))));
              reg150 <= reg144;
              reg151 <= ((^~reg123[(1'h1):(1'h0)]) ?
                  (wire128[(2'h2):(1'h1)] ^ reg120[(3'h5):(3'h5)]) : ($signed(reg135) ?
                      $signed({(8'hb6),
                          (reg145 ? reg135 : (8'hb6))}) : (^~reg129)));
              reg152 <= $unsigned(reg135[(3'h4):(1'h0)]);
              reg153 <= ($signed($signed($unsigned(reg133))) != ({wire117[(3'h7):(3'h6)],
                  ($unsigned((8'had)) ?
                      reg123 : $signed(reg148))} << {reg120}));
            end
          else
            begin
              reg149 <= ({((8'hbb) ?
                          (+{wire128, reg125}) : $signed($unsigned(reg150))),
                      {$unsigned((reg143 <= reg148)),
                          (~^reg143[(4'h9):(3'h6)])}} ?
                  $signed($signed($signed((&reg150)))) : reg122);
              reg150 <= ($signed({wire116,
                      ((reg131 != reg152) <<< (reg132 ? (8'hbd) : reg144))}) ?
                  (^~$signed($signed($unsigned(reg127)))) : (reg140 && reg148));
              reg151 <= (reg126[(2'h3):(1'h0)] ?
                  ((reg133[(3'h6):(1'h0)] ?
                      reg153 : {reg139[(3'h4):(2'h3)]}) | (+reg120)) : $unsigned((reg149[(2'h3):(1'h1)] >> (+$signed(reg148)))));
              reg152 <= reg124;
              reg153 <= reg127[(1'h1):(1'h0)];
            end
        end
      else
        begin
          if (({(reg136 ?
                      ((^reg122) ?
                          (|reg129) : reg142[(3'h7):(3'h4)]) : $signed(reg124[(3'h7):(3'h4)]))} ?
              $signed({reg141}) : reg142))
            begin
              reg145 <= ($signed($unsigned($unsigned((reg123 ?
                      reg152 : reg146)))) ?
                  (~|$unsigned(reg123[(2'h2):(1'h1)])) : wire138[(3'h7):(3'h6)]);
              reg146 <= (^~$unsigned({$signed({wire116, reg135})}));
              reg147 <= $unsigned((~wire118[(4'hd):(3'h5)]));
            end
          else
            begin
              reg145 <= (+$unsigned($unsigned($unsigned(reg130[(4'h9):(3'h4)]))));
            end
          reg148 <= reg149[(3'h4):(1'h0)];
          reg149 <= (reg143[(3'h7):(3'h5)] ~^ $signed($unsigned($unsigned(reg127[(1'h1):(1'h1)]))));
          reg150 <= (reg139 * $signed(($unsigned(reg144) || (~|reg121[(1'h0):(1'h0)]))));
          reg151 <= (reg129[(3'h6):(3'h6)] ~^ $signed((^~{reg143[(4'hf):(4'h9)]})));
        end
    end
  always
    @(posedge clk) begin
      reg154 <= ({($unsigned($unsigned(reg147)) > ((reg134 ?
              reg125 : reg144) + (~^reg148)))} ^ $unsigned((((wire128 != reg124) + (reg124 ?
          (8'hbf) : reg146)) == {(-wire128)})));
    end
  assign wire155 = ({(reg129 * (wire115[(4'ha):(4'h9)] ?
                           {reg140,
                               (8'ha4)} : $unsigned((8'hb0))))} ^ ($signed(({reg123,
                           wire128} | $signed(wire115))) ?
                       reg154 : (+$signed(wire138))));
  assign wire156 = reg125[(3'h5):(2'h2)];
  assign wire157 = wire138;
  assign wire158 = (~$signed((&$unsigned((reg153 ? wire118 : reg131)))));
  assign wire159 = $unsigned($signed({reg124[(2'h3):(1'h1)]}));
  assign wire160 = {(wire159 + (^reg149))};
endmodule

module module100
#(parameter param110 = {(^~({(~&(8'ha8)), (^~(8'ha6))} < ({(8'h9c)} != ((8'hac) <= (7'h42)))))}, 
parameter param111 = (!(param110 ? {((param110 ? param110 : param110) ? param110 : (param110 & param110))} : (param110 ? param110 : ((param110 >> (8'hae)) || (param110 ? param110 : param110))))))
(y, clk, wire104, wire103, wire102, wire101);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire104;
  input wire signed [(4'h8):(1'h0)] wire103;
  input wire signed [(4'hf):(1'h0)] wire102;
  input wire signed [(4'hc):(1'h0)] wire101;
  wire [(5'h15):(1'h0)] wire109;
  wire signed [(3'h4):(1'h0)] wire108;
  wire [(5'h13):(1'h0)] wire107;
  wire [(3'h6):(1'h0)] wire106;
  wire signed [(4'hf):(1'h0)] wire105;
  assign y = {wire109, wire108, wire107, wire106, wire105, (1'h0)};
  assign wire105 = $signed((wire103[(3'h6):(3'h6)] && (wire101 ?
                       wire101 : ($unsigned(wire101) ^~ $unsigned(wire104)))));
  assign wire106 = $unsigned((~^wire102[(4'he):(2'h3)]));
  assign wire107 = $unsigned(($unsigned($unsigned(wire103)) ?
                       (^~(~$signed(wire101))) : {$unsigned($signed(wire102)),
                           wire105}));
  assign wire108 = {$signed(wire104)};
  assign wire109 = ($unsigned({((wire101 ? wire101 : wire103) >>> (wire101 ?
                           wire104 : wire106)),
                       wire108[(2'h3):(1'h1)]}) ^ ((wire102 << $unsigned((wire103 ?
                       wire103 : wire106))) << $signed($signed((wire103 ?
                       (8'hb2) : wire107)))));
endmodule

module module7
#(parameter param83 = (-(-((^~((7'h43) >> (7'h42))) ? ((8'hac) ? ((8'hb3) ? (8'ha5) : (8'had)) : (8'ha1)) : (((8'had) || (8'h9d)) >= ((8'hbf) + (8'haf)))))))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire8;
  input wire [(3'h6):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire [(5'h13):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire70;
  wire [(4'h9):(1'h0)] wire69;
  wire [(2'h2):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  wire signed [(3'h5):(1'h0)] wire66;
  wire signed [(4'h9):(1'h0)] wire65;
  wire [(5'h13):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire63;
  wire signed [(3'h7):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire43;
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg75 = (1'h0);
  reg [(3'h7):(1'h0)] reg74 = (1'h0);
  reg [(5'h10):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire61,
                 wire13,
                 wire43,
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
                 (1'h0)};
  assign wire13 = wire9;
  module14 #() modinst44 (.wire16(wire13), .wire15(wire8), .y(wire43), .wire18(wire10), .wire17(wire12), .wire19(wire11), .clk(clk));
  module45 #() modinst62 (wire61, clk, wire9, wire11, wire13, wire10);
  assign wire63 = (~$signed(wire43[(3'h6):(2'h2)]));
  assign wire64 = $unsigned((+({wire11[(5'h10):(4'hd)],
                      $signed(wire63)} <<< $signed((~|wire11)))));
  assign wire65 = wire64;
  assign wire66 = wire10[(4'h9):(4'h9)];
  assign wire67 = $unsigned({wire8});
  assign wire68 = (wire64[(5'h13):(4'h8)] ^ (!$unsigned(((wire9 ?
                      wire64 : wire43) * $signed(wire65)))));
  assign wire69 = $signed((8'hb0));
  assign wire70 = {(~|wire43[(2'h2):(1'h1)]), wire67};
  always
    @(posedge clk) begin
      reg71 <= wire12[(4'hf):(2'h3)];
      if ($signed($signed(wire61[(3'h6):(3'h6)])))
        begin
          if ((~|$signed((^(~(wire68 >= (8'ha5)))))))
            begin
              reg72 <= (-($unsigned(wire69) ?
                  (^$signed($unsigned((8'hb4)))) : ({(wire12 ?
                          wire9 : wire43)} * wire70)));
              reg73 <= wire70[(2'h2):(1'h1)];
              reg74 <= {$signed({((wire11 >>> reg71) ?
                          {wire70, wire11} : $signed(reg72))}),
                  wire63[(2'h2):(1'h1)]};
              reg75 <= (($signed((wire12[(3'h4):(3'h4)] ?
                      (~&wire43) : (reg72 ? wire67 : reg73))) ?
                  (~^$unsigned(reg71[(3'h6):(3'h4)])) : $unsigned($unsigned($unsigned((8'ha0))))) >= ((^~wire61) <<< $unsigned($signed(wire70[(1'h1):(1'h1)]))));
              reg76 <= (^($unsigned(reg72[(3'h5):(2'h2)]) ?
                  (~^($unsigned(wire63) ?
                      $signed(wire70) : reg75[(3'h4):(1'h0)])) : $unsigned((^(|wire70)))));
            end
          else
            begin
              reg72 <= wire8;
              reg73 <= $signed({((~&$signed(reg71)) ?
                      {(wire9 ? wire65 : wire11),
                          reg75} : reg75[(4'h8):(3'h4)]),
                  reg74[(3'h6):(2'h3)]});
              reg74 <= wire67[(4'h9):(4'h8)];
              reg75 <= (((~{$signed((8'ha7))}) < wire10) ?
                  wire63[(1'h1):(1'h0)] : {wire10[(4'ha):(3'h7)]});
              reg76 <= $signed((^$signed(wire66)));
            end
          if (((8'hb7) | $signed(wire67)))
            begin
              reg77 <= (wire12[(4'hc):(3'h7)] + (reg74 ?
                  ((~^(wire9 ? wire10 : (8'ha0))) ?
                      wire8 : wire67) : $unsigned((~|(reg73 ?
                      wire10 : wire63)))));
              reg78 <= wire12[(4'h8):(2'h2)];
              reg79 <= (~(wire43[(3'h7):(2'h2)] ?
                  wire61[(2'h2):(2'h2)] : $signed($signed($signed(wire70)))));
            end
          else
            begin
              reg77 <= ($unsigned((~&$signed($signed(reg74)))) - $signed($signed((~^$unsigned(reg72)))));
              reg78 <= (~reg72[(1'h1):(1'h1)]);
              reg79 <= reg72;
              reg80 <= $signed((wire66[(3'h4):(1'h1)] ?
                  ((+reg74) ?
                      $unsigned((wire43 >= reg76)) : $signed((~|wire70))) : reg71[(3'h5):(2'h3)]));
              reg81 <= ($unsigned(reg76[(3'h5):(3'h4)]) - ($signed({(7'h40)}) ^ (~|$unsigned((reg74 ^~ (8'had))))));
            end
          reg82 <= (&(~|($signed((~^wire67)) ?
              reg75[(4'ha):(3'h6)] : (!reg71))));
        end
      else
        begin
          reg72 <= wire67;
          reg73 <= reg76;
          reg74 <= reg79;
          reg75 <= ({$unsigned($signed(wire64[(4'h9):(3'h4)]))} < wire43);
        end
    end
endmodule

module module45
#(parameter param60 = (~^(((((8'h9d) >= (8'hb3)) >> (|(7'h43))) ? (((8'hbc) >>> (8'ha2)) << ((7'h42) ^ (8'hb9))) : {(~^(8'ha4))}) ^~ ({(8'hac), ((7'h44) ? (8'hbf) : (8'had))} | {((8'hb2) ? (8'hb6) : (7'h44)), ((8'ha8) ? (8'h9c) : (8'had))}))))
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire49;
  input wire signed [(3'h4):(1'h0)] wire48;
  input wire [(5'h12):(1'h0)] wire47;
  input wire signed [(3'h6):(1'h0)] wire46;
  wire signed [(3'h6):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire53;
  wire signed [(4'h8):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire50;
  reg signed [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire50 = wire46[(1'h1):(1'h0)];
  assign wire51 = $signed((~$signed(wire47)));
  assign wire52 = $signed(wire46);
  assign wire53 = wire51;
  assign wire54 = $signed((~&((wire50 - (wire46 ? wire50 : (8'hb1))) ?
                      ($unsigned(wire51) ?
                          $unsigned((8'hb8)) : wire46) : {wire51[(2'h2):(1'h1)],
                          wire47})));
  assign wire55 = $signed(($unsigned($unsigned(((8'hb0) || wire47))) ?
                      wire47 : $unsigned($signed(((8'h9c) >>> wire53)))));
  always
    @(posedge clk) begin
      reg56 <= $unsigned((8'hbc));
    end
  always
    @(posedge clk) begin
      reg57 <= ($signed($unsigned(($signed(wire54) > wire52[(3'h6):(1'h1)]))) >= wire47);
      reg58 <= {{wire51, (wire48 ? ((~wire49) >>> $unsigned((8'had))) : reg57)},
          (8'hb9)};
      reg59 <= {wire48, wire50};
    end
endmodule

module module14
#(parameter param41 = {(((((8'haf) < (8'ha0)) ? ((7'h42) - (8'hb4)) : {(8'hb4), (8'hac)}) ? (((7'h41) == (7'h40)) >>> ((8'hbe) >= (8'haa))) : (((8'ha5) ? (8'hae) : (8'hb7)) << (~&(8'hba)))) ? ((^((8'hae) ? (8'hba) : (7'h40))) - ((-(7'h43)) ^~ ((8'hbc) << (8'hb3)))) : ({(8'hac)} ? {((8'ha3) ? (8'hac) : (8'hba)), (^(8'hab))} : (((8'ha0) >= (8'h9e)) ? ((8'ha5) ? (8'ha5) : (8'hbd)) : ((8'hb4) ? (8'ha3) : (8'ha8)))))}, 
parameter param42 = ((8'haa) ? param41 : (~(+(((8'ha9) - param41) ? {param41, param41} : (8'ha9))))))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire signed [(4'h9):(1'h0)] wire18;
  input wire [(4'he):(1'h0)] wire17;
  input wire [(2'h2):(1'h0)] wire16;
  input wire [(3'h6):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(4'he):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire20;
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  assign y = {wire40,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg26,
                 (1'h0)};
  assign wire20 = ({(~|{$signed(wire15), wire19[(3'h4):(2'h2)]}),
                          $signed($unsigned((-(8'ha7))))} ?
                      wire16 : $signed($unsigned(wire17[(4'hc):(4'hb)])));
  assign wire21 = wire16;
  assign wire22 = ($unsigned((($unsigned(wire18) ?
                          (!wire20) : (8'ha7)) ~^ ((wire17 != wire19) == ((8'had) ?
                          (7'h41) : wire16)))) ?
                      wire16 : wire20);
  assign wire23 = (^(wire15[(1'h1):(1'h1)] | ((wire20 ?
                      wire22[(4'h9):(2'h2)] : ((8'hb2) || wire18)) >>> {$unsigned((8'ha9)),
                      $signed(wire18)})));
  assign wire24 = (+$signed(((~&$signed(wire21)) > {$signed(wire16)})));
  assign wire25 = ((wire15[(3'h6):(1'h1)] ?
                      wire15[(3'h6):(3'h6)] : wire24) - $unsigned($unsigned($signed(wire23))));
  always
    @(posedge clk) begin
      reg26 <= ((|wire19) ?
          ((-$unsigned($signed(wire23))) - (!wire18[(4'h8):(4'h8)])) : (~^$unsigned(($unsigned(wire18) ?
              $unsigned(wire16) : (wire16 ? wire15 : wire23)))));
    end
  assign wire27 = wire19;
  assign wire28 = $unsigned(wire15);
  assign wire29 = $unsigned(($signed(((8'hb5) <<< $unsigned(wire16))) || ($unsigned((wire24 ?
                          wire19 : wire16)) ?
                      $unsigned({wire19, (8'h9d)}) : (^(~&wire28)))));
  assign wire30 = {wire27[(2'h2):(2'h2)],
                      $signed(((~^$unsigned(wire29)) > (wire19 * (^~wire16))))};
  assign wire31 = (8'ha8);
  assign wire32 = ($unsigned($signed((wire28[(4'h8):(1'h0)] << (wire29 * wire22)))) ?
                      (wire18 >= ({(^wire20)} ?
                          (+(~^wire19)) : $unsigned((^~wire19)))) : ((^~{$unsigned((8'hb8))}) ?
                          (&{(reg26 | wire23)}) : (($signed(wire28) <= (|wire22)) ?
                              $unsigned(wire31) : $signed((wire17 ?
                                  wire28 : wire22)))));
  assign wire33 = $signed(wire15);
  always
    @(posedge clk) begin
      if ((+($signed(wire33) ?
          $unsigned({reg26, $signed(wire28)}) : (~|reg26[(4'ha):(2'h3)]))))
        begin
          if ($unsigned($signed($unsigned((8'ha5)))))
            begin
              reg34 <= {($unsigned(wire24[(2'h3):(2'h2)]) < (wire15 & (~^{wire24,
                      wire20}))),
                  $signed(wire30[(4'he):(3'h6)])};
              reg35 <= ((8'hab) <= $signed(($unsigned({(8'ha7),
                  wire30}) ~^ {(wire31 & wire17), (wire17 - wire22)})));
            end
          else
            begin
              reg34 <= (|wire28);
              reg35 <= (7'h44);
              reg36 <= wire33;
            end
          reg37 <= wire29[(4'ha):(4'ha)];
        end
      else
        begin
          reg34 <= (+reg37);
        end
      reg38 <= wire32;
      reg39 <= reg36[(2'h3):(1'h0)];
    end
  assign wire40 = $signed($unsigned((((reg36 * reg37) <<< wire16) < (8'ha6))));
endmodule
