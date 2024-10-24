module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  wire signed [(2'h2):(1'h0)] wire200;
  wire [(3'h7):(1'h0)] wire199;
  wire signed [(4'ha):(1'h0)] wire198;
  wire signed [(5'h12):(1'h0)] wire197;
  wire [(5'h14):(1'h0)] wire196;
  wire [(5'h10):(1'h0)] wire194;
  wire signed [(2'h3):(1'h0)] wire101;
  wire [(4'hc):(1'h0)] wire100;
  wire [(3'h7):(1'h0)] wire93;
  wire [(4'hd):(1'h0)] wire82;
  wire signed [(4'h9):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire79;
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(4'hd):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg [(4'ha):(1'h0)] reg96 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg99 = (1'h0);
  assign y = {wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire194,
                 wire101,
                 wire100,
                 wire93,
                 wire82,
                 wire81,
                 wire4,
                 wire79,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 (1'h0)};
  assign wire4 = $unsigned($signed($signed((|$unsigned(wire0)))));
  module5 #() modinst80 (.y(wire79), .wire6(wire3), .clk(clk), .wire8(wire4), .wire9(wire0), .wire10(wire1), .wire7(wire2));
  assign wire81 = (^wire4);
  assign wire82 = ($signed(($unsigned((wire0 ? wire0 : wire3)) ?
                          ($unsigned(wire3) < {wire2}) : $signed({wire1}))) ?
                      (($signed($unsigned(wire79)) + $unsigned(wire3)) - $unsigned((wire79[(1'h1):(1'h1)] ?
                          ((8'hb3) ?
                              (8'hac) : wire3) : {wire0}))) : wire79[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire1)
        begin
          if ($unsigned($signed((wire82 < (+(wire82 > wire1))))))
            begin
              reg83 <= wire81[(4'h9):(3'h6)];
              reg84 <= wire2[(3'h7):(1'h0)];
            end
          else
            begin
              reg83 <= ((wire2 ?
                  {(reg84 ?
                          (reg84 > (8'hb9)) : (wire4 == wire0))} : (|{wire3[(2'h2):(2'h2)]})) & reg84[(1'h0):(1'h0)]);
              reg84 <= (wire0 ?
                  (wire4 * $signed(wire1)) : ({reg84} ?
                      (reg83[(3'h4):(2'h3)] ~^ (8'had)) : ((7'h43) ^~ wire82)));
              reg85 <= ((((+$signed(wire2)) <<< $signed({wire0})) > (reg83[(1'h0):(1'h0)] && ({(8'ha0),
                      wire82} ?
                  $unsigned(wire0) : wire81[(3'h7):(2'h3)]))) != ({$signed((wire79 ?
                          reg83 : wire2))} ?
                  wire82 : wire4));
              reg86 <= $unsigned((wire4[(4'h8):(3'h6)] >= {($unsigned((7'h44)) <= wire4[(2'h2):(1'h0)])}));
              reg87 <= wire82;
            end
          reg88 <= wire0[(4'hd):(2'h2)];
          reg89 <= reg86[(3'h5):(1'h1)];
        end
      else
        begin
          reg83 <= ($signed(($signed($unsigned(reg83)) ?
              $signed(wire82[(2'h2):(1'h1)]) : {(!wire0),
                  (wire0 ?
                      wire2 : wire3)})) <= $signed({$signed(wire81[(4'h9):(4'h9)])}));
        end
      reg90 <= reg84;
      reg91 <= ($unsigned(wire79[(3'h4):(1'h0)]) ?
          reg85 : (wire82 >= ($signed((wire2 ? (8'hbe) : wire0)) ^ reg88)));
      reg92 <= (&$unsigned(($signed($unsigned(reg86)) != $unsigned({(8'ha7),
          reg83}))));
    end
  assign wire93 = ((|wire2[(1'h0):(1'h0)]) ~^ ($signed((&$unsigned(wire2))) ?
                      $signed(wire3) : (8'ha9)));
  always
    @(posedge clk) begin
      reg94 <= ((wire82[(1'h1):(1'h1)] <<< ({wire93[(1'h1):(1'h1)], reg92} ?
          wire4 : $signed($unsigned(reg88)))) != $unsigned(((reg85 == $signed((8'hbf))) ~^ wire1)));
      if ((+(wire81[(3'h6):(2'h2)] ?
          ((reg90[(2'h3):(2'h3)] == $signed((7'h40))) <= reg94[(4'hb):(4'hb)]) : ((~reg91[(4'he):(2'h2)]) || (-(~|reg89))))))
        begin
          reg95 <= ({(^((^wire1) ~^ (+reg88)))} ?
              reg86[(4'h9):(3'h4)] : {((wire3[(3'h5):(2'h2)] ^ {wire1,
                      wire0}) >>> (~|(|wire82)))});
          reg96 <= $unsigned($signed($unsigned(((8'hbc) ^~ ((8'hac) ~^ reg85)))));
        end
      else
        begin
          reg95 <= $unsigned((((~^$unsigned((8'ha8))) & (~$unsigned(wire93))) * reg84[(1'h0):(1'h0)]));
          reg96 <= ({reg87[(4'h9):(3'h6)], $signed($signed({wire93}))} ?
              (reg89 ?
                  (|((|reg85) ?
                      $unsigned(reg94) : $unsigned((8'ha4)))) : {($unsigned(reg89) ?
                          (8'hb0) : (~&wire81)),
                      (-(|reg92))}) : wire4);
          reg97 <= (wire1[(1'h1):(1'h1)] >>> reg94);
          reg98 <= wire79[(1'h0):(1'h0)];
          reg99 <= (~reg91);
        end
    end
  assign wire100 = {(reg89[(3'h6):(3'h6)] ?
                           {wire82[(3'h4):(1'h1)],
                               reg88[(1'h0):(1'h0)]} : (~^reg84[(1'h1):(1'h1)]))};
  assign wire101 = $signed(reg90);
  module102 #() modinst195 (wire194, clk, reg95, reg88, wire82, wire3, reg86);
  assign wire196 = (((!((reg86 ? reg83 : reg98) ?
                           wire1[(3'h4):(1'h0)] : wire82)) ^~ ((+((8'hb7) ?
                               (8'h9d) : wire100)) ?
                           reg86 : (wire3 ?
                               wire4[(3'h5):(3'h5)] : $signed((8'had))))) ?
                       wire4[(4'hf):(4'ha)] : $unsigned($signed(((^~reg86) != $unsigned(reg90)))));
  assign wire197 = ((((~reg85) << wire81[(2'h3):(2'h2)]) | $signed((~^$signed(reg89)))) ^ reg89);
  assign wire198 = reg92;
  assign wire199 = ($unsigned(reg96[(4'h9):(1'h0)]) ?
                       wire2[(2'h2):(1'h0)] : (((~(wire194 <<< wire100)) ?
                               ({reg86} ~^ wire82[(4'h8):(3'h5)]) : $signed(wire3[(3'h5):(1'h1)])) ?
                           {$unsigned((8'ha1))} : reg84[(2'h3):(2'h2)]));
  assign wire200 = ((-{$unsigned({wire1}),
                       $unsigned(reg86[(4'h8):(3'h4)])}) <<< (8'ha7));
endmodule

module module102  (y, clk, wire103, wire104, wire105, wire106, wire107);
  output wire [(32'h1cf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire103;
  input wire [(5'h10):(1'h0)] wire104;
  input wire [(4'hd):(1'h0)] wire105;
  input wire [(4'ha):(1'h0)] wire106;
  input wire [(5'h11):(1'h0)] wire107;
  wire signed [(3'h7):(1'h0)] wire193;
  wire signed [(3'h6):(1'h0)] wire170;
  wire [(5'h14):(1'h0)] wire117;
  wire signed [(5'h14):(1'h0)] wire119;
  wire [(4'he):(1'h0)] wire120;
  wire [(5'h12):(1'h0)] wire121;
  wire signed [(4'hd):(1'h0)] wire122;
  wire signed [(5'h10):(1'h0)] wire127;
  wire signed [(2'h3):(1'h0)] wire168;
  reg [(4'h9):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg191 = (1'h0);
  reg [(3'h5):(1'h0)] reg190 = (1'h0);
  reg [(4'h9):(1'h0)] reg189 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg188 = (1'h0);
  reg [(4'h8):(1'h0)] reg187 = (1'h0);
  reg [(5'h10):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg185 = (1'h0);
  reg [(5'h12):(1'h0)] reg184 = (1'h0);
  reg [(4'hb):(1'h0)] reg183 = (1'h0);
  reg [(4'h8):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg181 = (1'h0);
  reg [(5'h12):(1'h0)] reg180 = (1'h0);
  reg [(3'h4):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg178 = (1'h0);
  reg [(4'hf):(1'h0)] reg177 = (1'h0);
  reg [(5'h13):(1'h0)] reg176 = (1'h0);
  reg [(4'hf):(1'h0)] reg175 = (1'h0);
  reg [(5'h14):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg172 = (1'h0);
  reg [(4'h8):(1'h0)] reg171 = (1'h0);
  reg [(4'ha):(1'h0)] reg126 = (1'h0);
  reg [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  reg [(5'h12):(1'h0)] reg123 = (1'h0);
  assign y = {wire193,
                 wire170,
                 wire117,
                 wire119,
                 wire120,
                 wire121,
                 wire122,
                 wire127,
                 wire168,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
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
                 reg171,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 (1'h0)};
  module108 #() modinst118 (.wire109(wire105), .wire111(wire106), .y(wire117), .wire112(wire107), .clk(clk), .wire110(wire103));
  assign wire119 = (wire117 ?
                       $signed($unsigned(wire107[(3'h6):(3'h6)])) : $signed(wire104));
  assign wire120 = (($signed((!(~&wire105))) && $unsigned((8'hbe))) ?
                       $unsigned(($signed((wire119 >>> wire103)) | $signed((~|wire107)))) : ((~(!$signed(wire104))) & $unsigned({(wire107 != wire117),
                           {wire106}})));
  assign wire121 = ((~&$signed($signed((wire119 == wire103)))) >> $unsigned(wire105));
  assign wire122 = $unsigned($signed(($unsigned((wire117 ^ wire121)) ?
                       wire107 : ((wire117 ?
                           wire117 : wire120) << $unsigned(wire120)))));
  always
    @(posedge clk) begin
      reg123 <= (wire104 | (+wire106[(4'h9):(4'h8)]));
      if ($unsigned((|((&wire107) ?
          ((^wire103) >>> $signed(wire119)) : wire103))))
        begin
          reg124 <= $unsigned((reg123 > (~^(wire106[(3'h5):(3'h4)] <= (wire103 > wire120)))));
          reg125 <= $unsigned(wire122[(3'h4):(2'h3)]);
        end
      else
        begin
          reg124 <= wire107[(1'h0):(1'h0)];
          reg125 <= (wire120 >> $signed(wire122[(2'h3):(2'h2)]));
        end
      reg126 <= $signed((!wire106));
    end
  assign wire127 = wire119[(4'h9):(2'h2)];
  module128 #() modinst169 (.y(wire168), .wire133(wire127), .wire130(wire122), .wire132(wire104), .wire131(wire107), .clk(clk), .wire129(wire119));
  assign wire170 = wire119;
  always
    @(posedge clk) begin
      if ((|reg123[(4'h8):(3'h5)]))
        begin
          if ($signed({reg126}))
            begin
              reg171 <= wire122[(3'h6):(3'h5)];
            end
          else
            begin
              reg171 <= (~(^$unsigned(((wire117 ?
                  reg126 : wire122) ~^ wire120))));
            end
          reg172 <= ($signed(((reg126 * (wire121 && reg126)) ?
                  wire168 : (8'hae))) ?
              wire103 : (reg125[(4'h9):(1'h1)] > $unsigned(wire122[(4'hc):(4'h8)])));
          reg173 <= wire122;
        end
      else
        begin
          if (wire106)
            begin
              reg171 <= ($unsigned($unsigned($unsigned(reg124[(1'h1):(1'h0)]))) ?
                  (^(wire122[(3'h4):(1'h1)] < {(8'ha4)})) : {$unsigned((~|(reg172 ?
                          wire168 : wire117))),
                      (&$unsigned($unsigned(wire127)))});
              reg172 <= (~&(|wire168[(1'h1):(1'h1)]));
              reg173 <= $signed((~^$unsigned((&reg171))));
              reg174 <= wire170[(3'h4):(3'h4)];
            end
          else
            begin
              reg171 <= (reg171[(3'h6):(3'h5)] ?
                  (($signed({wire127, wire127}) * $signed($unsigned(wire170))) ?
                      {wire122[(4'ha):(3'h6)]} : (wire127 == wire170[(3'h6):(3'h6)])) : (reg125 ?
                      (({reg172} ~^ (!(8'hb8))) ^~ $signed((wire107 ?
                          wire119 : (8'haf)))) : {wire121[(2'h3):(1'h0)]}));
              reg172 <= reg171;
              reg173 <= ((^~reg174[(4'h9):(3'h4)]) >>> (wire127 == $signed(({wire127} ?
                  (wire105 == reg173) : wire168))));
              reg174 <= ((((~&$signed(wire120)) ?
                          (|(~&reg171)) : {(^wire104), $unsigned(wire119)}) ?
                      $signed(((8'ha2) ^ ((8'hac) < reg172))) : wire170) ?
                  wire168[(1'h0):(1'h0)] : wire119[(5'h14):(2'h2)]);
            end
          reg175 <= wire170[(1'h0):(1'h0)];
          if (((reg174 ?
              $signed(reg175) : (reg124 ?
                  $signed((reg174 ?
                      (8'hbd) : wire170)) : ($unsigned(wire121) >= $unsigned(wire117)))) >= $signed((wire104[(3'h5):(2'h3)] ?
              (8'ha9) : reg172))))
            begin
              reg176 <= $unsigned((wire120 ?
                  reg171[(1'h1):(1'h0)] : (^$signed((^wire127)))));
            end
          else
            begin
              reg176 <= $signed((&reg124[(1'h0):(1'h0)]));
              reg177 <= ((~^wire105[(4'ha):(3'h6)]) ?
                  ({($unsigned(wire103) == {wire106}),
                      reg126} <= wire120) : $unsigned(reg174[(4'he):(4'ha)]));
            end
          reg178 <= reg124;
          if ((reg175 + $signed((((wire120 * wire127) ?
              reg173[(4'h9):(3'h7)] : ((8'ha2) ?
                  reg125 : reg174)) ~^ ($signed((8'hb1)) && (wire120 >= wire127))))))
            begin
              reg179 <= $signed(wire117[(4'hf):(3'h6)]);
              reg180 <= ($unsigned($signed($unsigned(wire103[(2'h3):(2'h2)]))) ?
                  reg174 : (~|(~&{(~^wire106)})));
              reg181 <= reg177[(4'hd):(1'h0)];
              reg182 <= (+(wire122 && (wire127[(4'hd):(4'h9)] ~^ reg175)));
              reg183 <= $signed(({reg171[(1'h1):(1'h1)]} ?
                  {($signed(reg177) ?
                          wire119[(5'h14):(3'h7)] : wire168)} : {$unsigned($unsigned((8'ha7))),
                      ((wire117 ? (8'ha2) : (8'ha3)) && wire121)}));
            end
          else
            begin
              reg179 <= ($signed($unsigned({reg181})) | $signed((8'h9f)));
              reg180 <= wire121;
              reg181 <= $unsigned($signed((~&({wire168} ?
                  $signed(reg182) : (8'hb2)))));
              reg182 <= $unsigned(wire104);
            end
        end
      reg184 <= {((|$signed(reg172[(4'hb):(2'h2)])) ?
              (reg183[(3'h6):(3'h6)] + ((wire127 ?
                  wire107 : (8'hae)) == {wire127,
                  wire127})) : (wire127 <= wire105[(4'ha):(4'h8)])),
          ((reg173 ? reg175 : (~|{wire121, reg173})) + reg177)};
      if ((!reg180))
        begin
          if ((~(~^((wire168[(2'h2):(2'h2)] ?
              ((7'h43) != reg176) : reg180) ^~ reg183[(2'h2):(2'h2)]))))
            begin
              reg185 <= (+(|$unsigned({reg175[(3'h7):(3'h7)]})));
              reg186 <= (wire121 ?
                  ($unsigned(reg178[(4'hf):(4'hd)]) ?
                      ($unsigned(reg178) && $signed(reg173)) : (reg179 ?
                          wire127[(5'h10):(5'h10)] : reg176[(5'h10):(4'he)])) : $unsigned(wire104));
            end
          else
            begin
              reg185 <= reg173[(3'h4):(2'h2)];
              reg186 <= reg184[(2'h2):(2'h2)];
            end
        end
      else
        begin
          if ({reg171[(1'h0):(1'h0)]})
            begin
              reg185 <= ($signed($unsigned($signed((wire117 ?
                  reg175 : wire105)))) != $unsigned((reg179 >= $unsigned(reg181[(4'hc):(3'h5)]))));
              reg186 <= $signed($signed($unsigned($unsigned($unsigned((8'ha5))))));
              reg187 <= (({((^~reg181) ? ((8'hbd) > wire106) : wire117),
                  wire105} | $signed($signed((wire127 ?
                  reg171 : reg124)))) > (8'hba));
              reg188 <= $signed({reg187});
            end
          else
            begin
              reg185 <= {{{reg123, {(reg124 < reg124)}}},
                  reg173[(3'h4):(1'h1)]};
              reg186 <= ($signed(reg186[(4'hf):(1'h1)]) ?
                  {reg180,
                      ($unsigned($signed(wire117)) && ($signed(reg171) ?
                          reg183[(3'h5):(3'h5)] : wire117))} : (wire106[(3'h7):(3'h6)] <<< $signed($signed($signed((8'hb2))))));
            end
          reg189 <= $unsigned((^reg178));
        end
    end
  always
    @(posedge clk) begin
      reg190 <= wire119;
      reg191 <= (-($unsigned(reg126) >> $unsigned((((8'hb0) ?
          reg171 : wire107) << (reg175 ? wire122 : (8'hbf))))));
      reg192 <= $signed(({($signed(wire104) < $unsigned((8'hae))),
          reg175} > {wire107[(4'hc):(1'h1)]}));
    end
  assign wire193 = $unsigned(reg123[(4'h9):(3'h4)]);
endmodule

module module5
#(parameter param78 = (~^{((~&(8'haf)) ? ({(8'hb0)} & ((8'ha2) ? (7'h42) : (8'hae))) : (((8'ha5) ? (8'hb4) : (8'h9f)) ? {(7'h40), (8'hb7)} : {(8'haf)}))}))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire signed [(3'h7):(1'h0)] wire7;
  input wire [(3'h4):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire77;
  wire [(2'h3):(1'h0)] wire76;
  wire signed [(5'h13):(1'h0)] wire75;
  wire [(5'h10):(1'h0)] wire73;
  wire [(5'h10):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire73,
                 wire44,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg16,
                 reg17,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 (1'h0)};
  assign wire11 = ({(~^(^{wire10}))} * wire9);
  assign wire12 = $unsigned(wire11);
  assign wire13 = {wire9[(3'h4):(2'h3)], wire9[(3'h5):(3'h4)]};
  assign wire14 = wire11;
  assign wire15 = $unsigned($unsigned(wire6));
  always
    @(posedge clk) begin
      reg16 <= {($unsigned(wire11[(2'h3):(1'h0)]) > (((wire6 ~^ wire7) ?
              (wire15 ^ (8'hbe)) : $signed(wire12)) & (8'hb7))),
          (!((~wire10) ? $signed($signed(wire10)) : (wire8 ~^ (!wire14))))};
      reg17 <= wire13[(1'h1):(1'h0)];
    end
  assign wire18 = ($signed(wire10) ? wire13 : (~&reg16));
  assign wire19 = reg16[(3'h5):(3'h5)];
  assign wire20 = (^($unsigned($signed(wire10)) && (($signed(wire9) || (+wire8)) - ((wire19 ?
                          wire14 : wire12) ?
                      (~|(8'ha7)) : wire7[(3'h7):(3'h7)]))));
  assign wire21 = wire10;
  assign wire22 = ((~|$signed($unsigned((~|wire18)))) ?
                      (~^($unsigned({wire7}) ?
                          (wire6 >>> {wire15, wire6}) : ((wire9 ?
                              (8'hb8) : wire15) >>> (-wire7)))) : {(|$unsigned(wire20[(2'h3):(2'h3)])),
                          wire6});
  module23 #() modinst45 (.y(wire44), .wire24(wire14), .wire27(wire19), .clk(clk), .wire26(wire6), .wire25(wire21));
  always
    @(posedge clk) begin
      if (wire11)
        begin
          reg46 <= wire44;
          if ($signed(wire8[(3'h6):(2'h3)]))
            begin
              reg47 <= (~^(-$unsigned((wire21[(4'h8):(2'h3)] ?
                  $unsigned(wire19) : ((8'haa) ? wire11 : wire10)))));
              reg48 <= $unsigned((wire44[(4'hb):(3'h7)] <= wire13));
              reg49 <= wire20;
              reg50 <= $unsigned(($unsigned({(wire22 - wire12)}) < wire19[(1'h0):(1'h0)]));
            end
          else
            begin
              reg47 <= wire11;
              reg48 <= (wire7[(3'h6):(3'h4)] ?
                  (wire10 ?
                      wire19[(2'h3):(1'h1)] : (&reg17[(2'h2):(2'h2)])) : wire18);
            end
          reg51 <= $unsigned((8'ha5));
          reg52 <= wire6;
          reg53 <= (reg16[(3'h7):(3'h5)] ? wire20 : $signed(wire18));
        end
      else
        begin
          if ((^~(&(~&{$signed((8'ha9))}))))
            begin
              reg46 <= $unsigned(($signed($unsigned((wire7 && reg47))) > ($unsigned({reg46}) <= reg49)));
              reg47 <= ($unsigned(($unsigned($signed((8'hbe))) ?
                  wire14[(3'h5):(2'h3)] : wire44[(3'h5):(2'h3)])) * reg49[(4'h8):(3'h4)]);
              reg48 <= (wire14 ? (~&$signed((8'h9e))) : (+(-{wire10})));
              reg49 <= $signed(((reg48[(3'h6):(3'h5)] ?
                      reg53[(4'hb):(3'h7)] : wire21[(2'h2):(1'h0)]) ?
                  (-reg16) : $signed(reg51)));
            end
          else
            begin
              reg46 <= (^(~(~^((!wire11) ^ (reg51 >= wire6)))));
              reg47 <= ((|wire13[(2'h2):(1'h0)]) ?
                  $unsigned(reg17[(3'h4):(2'h2)]) : ($unsigned(wire20[(1'h0):(1'h0)]) ?
                      $unsigned((^$signed(reg47))) : (({wire9,
                          reg51} != $signed(reg51)) > $signed((wire20 ?
                          wire18 : reg50)))));
              reg48 <= wire15;
              reg49 <= reg16;
              reg50 <= ({(reg47[(3'h5):(2'h2)] < $unsigned({reg49, reg52})),
                  (-$signed(wire44[(1'h1):(1'h0)]))} || (((wire11[(3'h4):(3'h4)] ?
                  ((8'hb4) & wire18) : (wire13 ?
                      reg49 : wire18)) <= $signed((~&wire18))) == wire13));
            end
        end
    end
  module54 #() modinst74 (.wire59(wire22), .wire57(wire9), .clk(clk), .wire56(reg53), .y(wire73), .wire55(wire19), .wire58(wire11));
  assign wire75 = ($signed((^({wire19} >= {reg49,
                      reg50}))) + (((+(~wire12)) ^ $signed($unsigned(wire10))) - wire21));
  assign wire76 = (~^(^~$signed($unsigned((^wire18)))));
  assign wire77 = (+reg53);
endmodule

module module54
#(parameter param71 = (^(((8'h9c) - ({(8'hbc)} ? {(8'h9c), (8'hb3)} : ((8'hb2) * (7'h41)))) <<< ({((8'hae) >= (8'h9c)), ((8'hb6) ? (8'had) : (8'hb2))} || ((~|(8'ha6)) ? (~|(8'haf)) : ((8'hbb) ? (8'ha9) : (8'hb3)))))), 
parameter param72 = param71)
(y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire59;
  input wire signed [(5'h11):(1'h0)] wire58;
  input wire [(5'h10):(1'h0)] wire57;
  input wire signed [(2'h3):(1'h0)] wire56;
  input wire signed [(2'h2):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire70;
  wire [(3'h4):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire68;
  wire signed [(4'hb):(1'h0)] wire67;
  wire [(4'h9):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire65;
  wire signed [(2'h3):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire63;
  wire [(2'h3):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire61;
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 reg60,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg60 <= wire55[(1'h1):(1'h1)];
    end
  assign wire61 = $unsigned({$unsigned((((8'hb6) && wire57) ?
                          wire57[(2'h3):(2'h2)] : wire56[(2'h2):(2'h2)])),
                      $unsigned(wire58[(4'hd):(4'h9)])});
  assign wire62 = ($signed(($signed($unsigned(reg60)) ?
                          $unsigned($signed((8'hb3))) : $signed(reg60))) ?
                      $signed((((|wire58) ?
                          wire56[(1'h1):(1'h1)] : wire57[(4'he):(2'h3)]) && wire61[(3'h6):(2'h3)])) : (reg60[(4'hf):(3'h4)] ?
                          $signed((&$signed((8'hb7)))) : wire61[(5'h12):(5'h10)]));
  assign wire63 = $signed(reg60);
  assign wire64 = {({((8'ha3) ? {wire63, wire62} : wire63[(1'h1):(1'h0)])} ?
                          (~|((wire57 <= wire61) ?
                              {wire56} : (wire58 >>> wire56))) : wire62),
                      $signed((((wire62 >> wire61) ?
                          reg60[(3'h6):(2'h2)] : (wire62 < wire62)) * ($signed(wire62) ?
                          $unsigned(reg60) : wire63[(4'hb):(4'h8)])))};
  assign wire65 = $signed((8'hb1));
  assign wire66 = (8'ha3);
  assign wire67 = ($unsigned($unsigned(((wire62 > wire64) ?
                          $unsigned(wire56) : (wire61 ? wire64 : wire66)))) ?
                      $signed($unsigned(($signed(reg60) - (wire59 ~^ wire66)))) : wire65[(3'h6):(2'h2)]);
  assign wire68 = {$unsigned((8'ha4))};
  assign wire69 = wire65;
  assign wire70 = $signed($signed(reg60));
endmodule

module module23
#(parameter param43 = (~^(~|((&(8'ha8)) ? (((8'hbc) ~^ (8'h9e)) ? (~(8'hbc)) : (8'hab)) : {((8'hb1) >> (7'h42)), ((7'h43) ^ (8'ha7))}))))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire27;
  input wire signed [(2'h3):(1'h0)] wire26;
  input wire [(4'he):(1'h0)] wire25;
  input wire signed [(4'hd):(1'h0)] wire24;
  wire [(4'hb):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire28;
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire35,
                 wire34,
                 wire33,
                 wire30,
                 wire29,
                 wire28,
                 reg36,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire28 = (wire27[(1'h0):(1'h0)] ?
                      wire24[(4'hc):(3'h4)] : $signed(wire24[(4'hd):(3'h7)]));
  assign wire29 = wire27[(1'h0):(1'h0)];
  assign wire30 = $signed($signed($unsigned(wire28[(2'h3):(2'h3)])));
  always
    @(posedge clk) begin
      reg31 <= (~&(|wire25));
      reg32 <= ($unsigned($signed(($signed(reg31) ?
              wire28 : $signed(wire24)))) ?
          $unsigned($signed(wire29[(2'h3):(2'h2)])) : $signed(reg31[(3'h7):(3'h6)]));
    end
  assign wire33 = $signed($signed(reg31));
  assign wire34 = (+(($signed((wire33 ? reg32 : wire33)) ?
                      ((~wire30) ?
                          $unsigned(wire25) : $unsigned((8'hb0))) : ((wire28 >>> reg31) == (wire28 - wire29))) == $signed(wire26[(2'h2):(2'h2)])));
  assign wire35 = $signed($signed($signed({{wire24, wire30}})));
  always
    @(posedge clk) begin
      reg36 <= reg32;
    end
  assign wire37 = wire33[(2'h2):(2'h2)];
  assign wire38 = (~((|(|(&(7'h42)))) + (^~{wire26[(2'h2):(1'h0)]})));
  assign wire39 = wire26;
  assign wire40 = ($signed((-((wire25 ? (7'h41) : wire26) > reg36))) ?
                      ({(!((7'h44) + reg36))} <= $signed(wire38[(3'h6):(2'h3)])) : $signed((^(~^$unsigned(reg32)))));
  assign wire41 = reg36[(3'h4):(1'h0)];
  assign wire42 = reg32[(1'h0):(1'h0)];
endmodule

module module128
#(parameter param167 = ({((((8'ha7) <<< (8'hac)) ? ((8'hbd) - (8'hb7)) : {(8'hbc)}) < (((8'ha3) ? (8'ha4) : (8'ha7)) <<< (!(8'h9c)))), ((((7'h41) < (8'hae)) >> ((8'haa) && (8'hb4))) >= (~&((8'hba) < (7'h42))))} ^ (((|(~(8'h9e))) < (((7'h44) ? (8'ha5) : (8'hb4)) | ((8'ha3) ? (8'hb4) : (8'hbf)))) ? (8'hb5) : (7'h42))))
(y, clk, wire133, wire132, wire131, wire130, wire129);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire133;
  input wire [(5'h10):(1'h0)] wire132;
  input wire signed [(3'h4):(1'h0)] wire131;
  input wire [(4'hd):(1'h0)] wire130;
  input wire signed [(5'h12):(1'h0)] wire129;
  wire signed [(2'h2):(1'h0)] wire166;
  wire signed [(4'hf):(1'h0)] wire165;
  wire signed [(5'h11):(1'h0)] wire164;
  wire signed [(5'h15):(1'h0)] wire163;
  wire [(5'h11):(1'h0)] wire162;
  wire [(3'h5):(1'h0)] wire161;
  wire signed [(5'h15):(1'h0)] wire160;
  wire [(3'h5):(1'h0)] wire159;
  wire signed [(2'h3):(1'h0)] wire156;
  wire signed [(5'h15):(1'h0)] wire155;
  wire [(3'h4):(1'h0)] wire154;
  wire signed [(3'h4):(1'h0)] wire153;
  wire signed [(3'h5):(1'h0)] wire152;
  wire signed [(4'hc):(1'h0)] wire151;
  wire [(5'h14):(1'h0)] wire150;
  wire signed [(4'h8):(1'h0)] wire149;
  wire signed [(5'h12):(1'h0)] wire145;
  wire [(3'h7):(1'h0)] wire135;
  reg [(4'h9):(1'h0)] reg158 = (1'h0);
  reg [(3'h6):(1'h0)] reg157 = (1'h0);
  reg [(4'h8):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg142 = (1'h0);
  reg [(3'h4):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg139 = (1'h0);
  reg [(3'h4):(1'h0)] reg138 = (1'h0);
  reg [(4'he):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg134 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire145,
                 wire135,
                 reg158,
                 reg157,
                 reg148,
                 reg147,
                 reg146,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg134,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg134 <= ((~&(wire132[(1'h1):(1'h0)] ?
              ((+wire130) >> (wire132 <= (8'h9c))) : $signed((wire129 ?
                  wire131 : wire133)))) ?
          (wire131[(1'h0):(1'h0)] ?
              wire133[(2'h2):(2'h2)] : $unsigned(wire132[(4'hd):(1'h1)])) : $signed({{$unsigned(wire130),
                  wire129},
              (((8'h9d) ? wire130 : (7'h40)) << (wire129 - wire132))}));
    end
  assign wire135 = $unsigned((~&$signed(wire133[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg136 <= ($unsigned(((~|(|wire129)) ?
          wire132[(3'h4):(3'h4)] : $unsigned(wire130))) == reg134[(2'h3):(2'h2)]);
      reg137 <= (8'had);
      reg138 <= {$signed({$signed(reg136[(1'h0):(1'h0)])}),
          (+(reg136[(2'h2):(2'h2)] > (|(~|wire132))))};
      reg139 <= (!{reg137, reg137[(4'h8):(3'h4)]});
      if ({{(reg137[(4'he):(4'hd)] * $unsigned(wire135[(3'h6):(3'h5)]))},
          $signed(wire130[(2'h3):(2'h3)])})
        begin
          reg140 <= (($signed(wire129) * $signed({(wire129 < wire129)})) ?
              (($signed($unsigned((8'ha0))) + wire130[(3'h5):(2'h3)]) ?
                  reg136 : reg134) : ({reg139} ^~ (|((reg139 ?
                      wire131 : wire133) ?
                  wire132 : (~^reg138)))));
        end
      else
        begin
          reg140 <= ((8'hb2) ^ (($unsigned((reg139 << wire131)) <<< (~^wire135[(2'h3):(1'h0)])) ?
              ($unsigned(reg140) ?
                  reg136[(3'h6):(3'h4)] : (~^(-(8'haa)))) : $unsigned(reg134[(4'h9):(3'h4)])));
          reg141 <= {(^~(^~$signed(((8'hbc) ? wire130 : (8'hb0)))))};
          if ($signed(reg137))
            begin
              reg142 <= ({(wire130[(1'h0):(1'h0)] ?
                          $unsigned((8'haf)) : wire133),
                      wire130[(3'h4):(2'h2)]} ?
                  (-$signed($signed(reg139))) : (~&(reg138 >> ({reg136,
                          reg139} ?
                      reg136 : reg137[(4'hb):(4'ha)]))));
              reg143 <= $signed((+reg134));
            end
          else
            begin
              reg142 <= ({(7'h41)} || $unsigned((+wire130[(4'hd):(2'h2)])));
            end
          reg144 <= reg142;
        end
    end
  assign wire145 = $unsigned((~((^~(wire130 <= reg140)) ?
                       $signed((8'haf)) : ((8'had) | {(8'ha4), wire133}))));
  always
    @(posedge clk) begin
      reg146 <= (wire132 ?
          wire133 : $unsigned({wire131, reg144[(4'hf):(4'he)]}));
      reg147 <= $signed({(($unsigned(wire135) - (8'h9e)) ?
              ((-reg137) && (wire131 ? reg143 : (8'hb0))) : $signed(reg142))});
      reg148 <= reg146[(1'h0):(1'h0)];
    end
  assign wire149 = (~|(reg138 >>> $unsigned((~wire133[(2'h2):(1'h0)]))));
  assign wire150 = $signed(wire145);
  assign wire151 = {{(wire149[(2'h2):(2'h2)] >= wire150[(4'hc):(2'h3)])},
                       $signed((~^reg147[(2'h2):(1'h0)]))};
  assign wire152 = wire151[(1'h1):(1'h0)];
  assign wire153 = reg148[(3'h4):(3'h4)];
  assign wire154 = ($unsigned(((~reg148[(3'h6):(1'h0)]) ^ reg141[(1'h1):(1'h0)])) >= ((~&(+$unsigned((8'hbe)))) << reg140[(2'h2):(2'h2)]));
  assign wire155 = (wire149[(1'h1):(1'h1)] >= {($unsigned((wire135 < reg143)) ?
                           wire152[(3'h4):(2'h3)] : (~^{wire152, reg148}))});
  assign wire156 = $unsigned($signed(($unsigned($signed(reg143)) ?
                       $unsigned((wire130 >>> (8'ha3))) : ($signed((8'ha7)) ?
                           wire131 : {(8'hb9), wire155}))));
  always
    @(posedge clk) begin
      reg157 <= wire133[(1'h1):(1'h1)];
      reg158 <= ($signed(reg137) | $signed(($unsigned((reg143 < wire132)) ?
          {{reg143, wire151}} : $unsigned((reg139 ? (8'ha6) : wire150)))));
    end
  assign wire159 = reg146[(3'h4):(3'h4)];
  assign wire160 = $signed(($signed(wire159[(3'h4):(2'h2)]) < reg147[(4'h9):(4'h8)]));
  assign wire161 = ($unsigned(wire153) ?
                       (~^$signed(reg136[(3'h6):(2'h3)])) : $signed(reg139[(1'h1):(1'h1)]));
  assign wire162 = reg134;
  assign wire163 = (reg140[(3'h6):(1'h1)] * $signed(reg157[(3'h5):(2'h2)]));
  assign wire164 = wire150[(3'h7):(3'h7)];
  assign wire165 = reg137[(4'h9):(3'h5)];
  assign wire166 = wire165[(2'h2):(2'h2)];
endmodule

module module108  (y, clk, wire112, wire111, wire110, wire109);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire112;
  input wire signed [(4'ha):(1'h0)] wire111;
  input wire signed [(5'h15):(1'h0)] wire110;
  input wire [(4'hd):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire116;
  wire signed [(5'h14):(1'h0)] wire115;
  wire signed [(4'hd):(1'h0)] wire114;
  wire signed [(4'h8):(1'h0)] wire113;
  assign y = {wire116, wire115, wire114, wire113, (1'h0)};
  assign wire113 = (^$unsigned(wire109[(4'hc):(4'hb)]));
  assign wire114 = (~((~^$unsigned((wire111 ? wire112 : wire111))) ?
                       {(|wire109[(4'hd):(2'h3)]),
                           wire112[(2'h3):(1'h0)]} : $signed((8'haf))));
  assign wire115 = ($unsigned({$signed(wire113[(3'h6):(1'h1)])}) ?
                       wire112[(3'h5):(2'h2)] : (-(~|($unsigned(wire109) != wire111[(3'h6):(2'h3)]))));
  assign wire116 = (((^~wire115) ?
                       ($unsigned($signed(wire114)) ?
                           wire114[(4'ha):(2'h2)] : wire114[(3'h4):(1'h0)]) : ((wire114[(4'h8):(3'h6)] > (8'h9c)) + (!wire115[(1'h0):(1'h0)]))) <<< $signed((wire114 ?
                       wire111[(1'h1):(1'h1)] : wire113[(3'h6):(2'h2)])));
endmodule
