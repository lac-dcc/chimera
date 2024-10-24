module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire238;
  wire [(4'hd):(1'h0)] wire234;
  wire [(4'hb):(1'h0)] wire232;
  wire signed [(4'h9):(1'h0)] wire5;
  reg signed [(2'h3):(1'h0)] reg237 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg236 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  assign y = {wire238,
                 wire234,
                 wire232,
                 wire5,
                 reg237,
                 reg236,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 (1'h0)};
  assign wire5 = wire4;
  always
    @(posedge clk) begin
      reg6 <= (~^((&(&(wire4 - wire3))) * $signed($signed(wire3[(1'h1):(1'h0)]))));
      if ({((reg6 ?
              wire5[(3'h7):(3'h7)] : reg6[(3'h7):(2'h2)]) || ($unsigned(wire3) ?
              ((wire2 || wire4) < $signed(wire1)) : (^~{reg6, wire4}))),
          wire1[(4'h8):(3'h7)]})
        begin
          reg7 <= $unsigned({($signed({wire4,
                  wire0}) == wire5[(1'h0):(1'h0)])});
        end
      else
        begin
          reg7 <= $unsigned(wire2[(1'h0):(1'h0)]);
          if ($signed(wire5[(2'h2):(2'h2)]))
            begin
              reg8 <= wire1[(2'h3):(2'h3)];
              reg9 <= (wire5[(1'h1):(1'h1)] <<< wire1[(4'ha):(2'h3)]);
              reg10 <= wire1;
              reg11 <= ((^$unsigned((~$signed(reg7)))) < (($unsigned($signed(reg9)) ?
                  wire2[(2'h3):(2'h2)] : {reg6[(3'h4):(3'h4)]}) * (-((8'ha6) ^ (reg8 >= reg7)))));
            end
          else
            begin
              reg8 <= $unsigned(reg8[(1'h0):(1'h0)]);
              reg9 <= wire0;
              reg10 <= ((8'ha6) != ($unsigned(reg10) ?
                  (({wire2, wire1} | wire3[(2'h3):(2'h3)]) ?
                      ((reg7 != wire0) < (wire4 ?
                          wire1 : wire0)) : $unsigned($unsigned(reg7))) : $signed((wire3[(1'h0):(1'h0)] ?
                      wire1[(2'h2):(1'h0)] : reg6[(3'h6):(3'h6)]))));
            end
        end
      reg12 <= ({wire5, wire1} << (~|wire0));
    end
  always
    @(posedge clk) begin
      reg13 <= ((reg9 ?
              $signed($unsigned(wire3[(2'h2):(1'h1)])) : {reg6[(3'h7):(3'h6)],
                  reg6[(3'h7):(2'h3)]}) ?
          (-(!(^wire3))) : $unsigned({{((8'hb3) && reg6)}}));
      reg14 <= reg9[(2'h2):(2'h2)];
      reg15 <= ((wire5 ?
          $signed({(|wire2)}) : ($signed(reg13) ^~ (^~{reg10,
              wire5}))) < reg11[(3'h4):(1'h0)]);
      reg16 <= wire1;
    end
  module17 #() modinst233 (.wire19(wire2), .y(wire232), .wire21(reg10), .wire20(reg7), .clk(clk), .wire18(wire0), .wire22(reg9));
  module152 #() modinst235 (wire234, clk, reg10, wire3, reg6, wire2);
  always
    @(posedge clk) begin
      reg236 <= (reg11 ? wire5 : (reg9[(2'h3):(2'h3)] || wire0));
      reg237 <= wire5[(3'h7):(3'h7)];
    end
  assign wire238 = reg8;
endmodule

module module17  (y, clk, wire18, wire19, wire20, wire21, wire22);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire18;
  input wire [(5'h10):(1'h0)] wire19;
  input wire signed [(5'h11):(1'h0)] wire20;
  input wire [(5'h13):(1'h0)] wire21;
  input wire [(5'h12):(1'h0)] wire22;
  wire [(4'ha):(1'h0)] wire231;
  wire signed [(4'hd):(1'h0)] wire230;
  wire signed [(4'hc):(1'h0)] wire229;
  wire [(2'h3):(1'h0)] wire228;
  wire signed [(5'h11):(1'h0)] wire227;
  wire [(4'he):(1'h0)] wire226;
  wire [(5'h12):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire70;
  wire [(4'hd):(1'h0)] wire149;
  wire [(5'h13):(1'h0)] wire151;
  wire [(4'hf):(1'h0)] wire199;
  wire signed [(5'h12):(1'h0)] wire201;
  wire signed [(4'hf):(1'h0)] wire202;
  wire signed [(4'h9):(1'h0)] wire203;
  wire [(2'h2):(1'h0)] wire224;
  reg signed [(3'h7):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg205 = (1'h0);
  reg [(5'h15):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg207 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg208 = (1'h0);
  reg [(5'h15):(1'h0)] reg209 = (1'h0);
  reg [(3'h6):(1'h0)] reg210 = (1'h0);
  assign y = {wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire226,
                 wire67,
                 wire69,
                 wire70,
                 wire149,
                 wire151,
                 wire199,
                 wire201,
                 wire202,
                 wire203,
                 wire224,
                 reg204,
                 reg205,
                 reg206,
                 reg207,
                 reg208,
                 reg209,
                 reg210,
                 (1'h0)};
  module23 #() modinst68 (.wire26(wire18), .clk(clk), .wire24(wire19), .y(wire67), .wire25(wire20), .wire27(wire22));
  assign wire69 = $signed($unsigned((^~wire67)));
  assign wire70 = ((&(~|$signed(wire69))) < $signed($unsigned(($unsigned(wire69) ?
                      $unsigned(wire18) : (|wire67)))));
  module71 #() modinst150 (wire149, clk, wire21, wire20, wire70, wire19);
  assign wire151 = $unsigned((8'hba));
  module152 #() modinst200 (wire199, clk, wire151, wire19, wire20, wire22);
  assign wire201 = (wire67[(1'h0):(1'h0)] ?
                       (((wire70 <= (&wire67)) <= ((wire21 != (8'had)) ?
                               wire67[(4'hd):(1'h0)] : (-wire67))) ?
                           wire20 : $unsigned(wire67)) : wire199[(4'hf):(3'h7)]);
  assign wire202 = $signed((8'hb6));
  assign wire203 = wire19[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      if (wire203)
        begin
          reg204 <= $signed(($unsigned(wire199) <= (~^wire149)));
        end
      else
        begin
          reg204 <= (^~(8'had));
          if (($signed((+(!$signed(wire203)))) + {$unsigned(wire67[(3'h7):(2'h3)])}))
            begin
              reg205 <= wire18;
              reg206 <= (($unsigned((-wire151)) > ($signed((wire201 < wire69)) << $unsigned((^(8'ha2))))) ?
                  wire67[(4'he):(4'hb)] : $signed($signed(((wire20 == reg205) & {(8'hae)}))));
            end
          else
            begin
              reg205 <= (!wire151[(4'hf):(1'h1)]);
              reg206 <= ($unsigned($unsigned({$signed(wire70),
                  $signed(wire69)})) < $signed(wire151));
              reg207 <= ($signed((~|(&$signed(wire199)))) ?
                  $unsigned(wire18[(1'h0):(1'h0)]) : ($unsigned($unsigned((reg205 ?
                          (8'ha2) : (8'hbf)))) ?
                      (^($signed(wire69) <<< $unsigned(wire199))) : reg205));
              reg208 <= $unsigned(reg206[(4'hc):(1'h0)]);
            end
        end
      reg209 <= wire199[(3'h5):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg210 <= $signed(wire19[(4'hf):(4'hd)]);
    end
  module211 #() modinst225 (.clk(clk), .wire215(wire67), .wire212(reg205), .wire214(wire19), .y(wire224), .wire213(wire201));
  assign wire226 = (wire70[(4'ha):(4'h8)] ? reg210 : {(^~(~^wire20))});
  assign wire227 = wire20[(3'h7):(1'h1)];
  assign wire228 = $unsigned((wire67[(2'h3):(2'h2)] ?
                       (&(reg210[(3'h5):(3'h5)] ?
                           wire227[(3'h4):(1'h1)] : $signed((8'h9d)))) : wire201[(5'h12):(4'hc)]));
  assign wire229 = (&wire67[(3'h7):(2'h2)]);
  assign wire230 = ($unsigned(wire203) ?
                       $unsigned(((!(wire18 || reg210)) ?
                           $signed({wire20}) : $signed($unsigned(wire151)))) : (8'hbc));
  assign wire231 = $signed((wire21[(1'h0):(1'h0)] ?
                       (((wire18 ? wire224 : wire22) >>> (wire229 ?
                           wire203 : reg204)) << ({reg204,
                           (8'hb2)} > $unsigned(reg210))) : {reg207[(4'hf):(4'hb)]}));
endmodule

module module211
#(parameter param222 = {((~|(~&{(8'ha1)})) ? (~&(((8'hb6) ? (7'h43) : (7'h40)) - (~|(8'hb1)))) : ((((8'hbd) && (8'hbe)) | (&(8'ha0))) > ((^(7'h40)) ? ((8'hb3) <<< (8'hbc)) : ((8'hb8) ? (8'hb6) : (8'hb5))))), {((((8'h9d) ? (8'had) : (8'hb8)) ? ((8'ha6) < (8'hb4)) : ((8'ha6) ? (8'had) : (8'hb4))) && (~&(^~(8'hbd))))}}, 
parameter param223 = param222)
(y, clk, wire215, wire214, wire213, wire212);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire215;
  input wire [(4'hf):(1'h0)] wire214;
  input wire signed [(5'h12):(1'h0)] wire213;
  input wire [(2'h3):(1'h0)] wire212;
  wire signed [(3'h5):(1'h0)] wire221;
  wire signed [(4'h8):(1'h0)] wire220;
  wire [(5'h11):(1'h0)] wire219;
  wire signed [(4'h9):(1'h0)] wire218;
  wire signed [(3'h7):(1'h0)] wire217;
  wire [(5'h12):(1'h0)] wire216;
  assign y = {wire221, wire220, wire219, wire218, wire217, wire216, (1'h0)};
  assign wire216 = $signed((&($signed((8'hb4)) == $unsigned(((8'haa) > wire212)))));
  assign wire217 = (|wire216[(4'hd):(3'h6)]);
  assign wire218 = wire217[(3'h4):(1'h0)];
  assign wire219 = $unsigned({$unsigned((^~(^wire216)))});
  assign wire220 = wire217[(3'h5):(1'h0)];
  assign wire221 = wire213[(1'h0):(1'h0)];
endmodule

module module152  (y, clk, wire156, wire155, wire154, wire153);
  output wire [(32'h20a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire156;
  input wire [(4'he):(1'h0)] wire155;
  input wire [(4'he):(1'h0)] wire154;
  input wire signed [(4'hd):(1'h0)] wire153;
  wire [(2'h2):(1'h0)] wire198;
  wire signed [(4'ha):(1'h0)] wire197;
  wire [(4'he):(1'h0)] wire196;
  wire [(5'h15):(1'h0)] wire195;
  wire [(4'hf):(1'h0)] wire194;
  wire signed [(4'h8):(1'h0)] wire193;
  wire signed [(3'h7):(1'h0)] wire192;
  wire signed [(3'h4):(1'h0)] wire191;
  wire signed [(5'h11):(1'h0)] wire190;
  wire signed [(3'h6):(1'h0)] wire189;
  wire [(4'h9):(1'h0)] wire188;
  wire signed [(5'h13):(1'h0)] wire187;
  wire [(4'he):(1'h0)] wire186;
  wire [(5'h14):(1'h0)] wire169;
  wire [(3'h4):(1'h0)] wire159;
  wire [(3'h7):(1'h0)] wire158;
  wire [(4'hb):(1'h0)] wire157;
  reg [(3'h4):(1'h0)] reg185 = (1'h0);
  reg [(4'hf):(1'h0)] reg184 = (1'h0);
  reg [(5'h12):(1'h0)] reg183 = (1'h0);
  reg [(3'h6):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg180 = (1'h0);
  reg [(4'he):(1'h0)] reg179 = (1'h0);
  reg [(4'he):(1'h0)] reg178 = (1'h0);
  reg [(5'h14):(1'h0)] reg177 = (1'h0);
  reg [(4'h9):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg175 = (1'h0);
  reg [(5'h11):(1'h0)] reg174 = (1'h0);
  reg [(5'h13):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg172 = (1'h0);
  reg [(4'hd):(1'h0)] reg171 = (1'h0);
  reg [(4'h9):(1'h0)] reg170 = (1'h0);
  reg [(4'h8):(1'h0)] reg168 = (1'h0);
  reg [(4'hc):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg166 = (1'h0);
  reg [(4'hf):(1'h0)] reg165 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg160 = (1'h0);
  assign y = {wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire169,
                 wire159,
                 wire158,
                 wire157,
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
                 reg170,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 (1'h0)};
  assign wire157 = (~{$unsigned((~|$unsigned(wire155))), wire154});
  assign wire158 = wire156[(4'hf):(4'h9)];
  assign wire159 = (8'ha9);
  always
    @(posedge clk) begin
      reg160 <= wire159[(1'h1):(1'h1)];
      if ((((~&$unsigned($signed(reg160))) || {$unsigned((+wire156)),
              $signed({wire155, wire153})}) ?
          $signed(reg160[(3'h5):(2'h3)]) : $unsigned($unsigned({{wire155},
              wire158[(3'h7):(1'h1)]}))))
        begin
          if (wire158[(3'h5):(1'h1)])
            begin
              reg161 <= wire154;
              reg162 <= wire157;
            end
          else
            begin
              reg161 <= $signed($unsigned((reg162 ?
                  wire156[(4'hf):(3'h5)] : wire155[(3'h7):(2'h2)])));
              reg162 <= (~^$signed(reg162[(3'h6):(3'h5)]));
              reg163 <= $signed((reg161 ?
                  (($signed((8'hba)) ?
                          (reg160 ? (8'hab) : wire154) : (reg160 - wire157)) ?
                      $signed((reg162 * wire155)) : ((+reg162) ?
                          wire155 : reg161)) : ({{(8'ha5)}} ?
                      ((reg162 ?
                          (8'had) : wire158) <<< wire153) : reg162[(3'h4):(1'h0)])));
              reg164 <= (wire159 ?
                  ($unsigned(((wire158 ^~ wire155) ?
                      (wire159 >> wire159) : $unsigned(reg162))) >= $signed({$signed((8'ha7)),
                      wire158[(3'h4):(1'h0)]})) : (+$signed($signed((reg160 ?
                      wire156 : wire153)))));
            end
          reg165 <= $signed((~&reg160));
        end
      else
        begin
          reg161 <= {$unsigned(((~|(8'hbb)) == (&wire157)))};
          if ((^wire155[(4'hb):(4'h8)]))
            begin
              reg162 <= reg160;
              reg163 <= (^~{$unsigned($signed($unsigned(wire157))),
                  ((wire155 ?
                      (wire154 > wire154) : (^~reg161)) << ($unsigned(reg165) ?
                      reg165 : reg165))});
              reg164 <= ({(wire159[(1'h1):(1'h0)] >= $signed($unsigned(reg161))),
                      ({reg163} ?
                          reg164[(3'h6):(1'h0)] : (^~$unsigned((8'hac))))} ?
                  (reg165[(4'hf):(4'ha)] >>> $unsigned((wire158[(3'h6):(3'h5)] > wire157[(1'h0):(1'h0)]))) : ($signed(reg165[(4'hc):(4'hb)]) >>> ($signed((|(8'ha3))) ?
                      reg165[(4'h9):(1'h0)] : (8'hbf))));
              reg165 <= reg163;
            end
          else
            begin
              reg162 <= {wire155[(4'h9):(2'h3)],
                  $signed($unsigned((!(wire155 ? reg161 : wire158))))};
              reg163 <= $unsigned((8'hb6));
            end
          reg166 <= wire157;
        end
      reg167 <= (wire157 & (~wire155[(4'h8):(3'h4)]));
      reg168 <= $unsigned(((~&{(~&reg161),
          $unsigned((8'hb6))}) & $signed(reg163[(4'hd):(4'ha)])));
    end
  assign wire169 = {(-(!$signed($unsigned(reg168)))), {wire157[(3'h6):(2'h3)]}};
  always
    @(posedge clk) begin
      reg170 <= {$unsigned(($signed((^~reg163)) ?
              $unsigned(wire169[(5'h11):(5'h11)]) : reg163[(3'h4):(2'h2)]))};
      reg171 <= (((reg167 ^ wire159[(1'h1):(1'h1)]) ?
          {(|(&wire153))} : ((~&wire159) ?
              (8'hb9) : (reg163[(4'ha):(4'h8)] ?
                  reg167 : $signed((7'h43))))) & reg166);
      reg172 <= (wire154 > (8'hb0));
      if ($unsigned(wire169[(1'h0):(1'h0)]))
        begin
          reg173 <= wire157;
          reg174 <= (wire158 ^ $unsigned(reg162[(1'h1):(1'h0)]));
        end
      else
        begin
          if ({{(((|reg162) ? $signed(reg162) : (~&(8'hbe))) ?
                      $unsigned($signed(reg165)) : $signed(wire158[(2'h2):(1'h1)]))},
              ((wire158[(3'h4):(2'h2)] ?
                  reg171 : (8'h9c)) + ({{reg168}} & $unsigned($signed(reg160))))})
            begin
              reg173 <= $signed($unsigned(reg166[(5'h11):(4'h8)]));
            end
          else
            begin
              reg173 <= $signed(reg167);
              reg174 <= ($signed($unsigned({reg173, reg160})) ?
                  $unsigned($unsigned($unsigned(reg168))) : reg160);
              reg175 <= (wire169 ?
                  (reg160 ?
                      wire169 : {(((8'hb9) > reg168) ?
                              (reg161 ? reg165 : reg167) : (reg164 ?
                                  (8'h9f) : reg173)),
                          (~&(reg173 ~^ (8'h9e)))}) : reg163[(3'h5):(1'h0)]);
              reg176 <= ((wire154 ?
                  ((8'ha1) ^ (|$signed(reg171))) : $signed((reg175[(1'h1):(1'h0)] == reg163))) ~^ ((~&{$unsigned(reg174),
                      (wire157 ^~ reg162)}) ?
                  $unsigned(($unsigned((8'hb7)) ?
                      (^~wire155) : (~&reg162))) : (~^{wire158, wire169})));
              reg177 <= reg168[(3'h6):(2'h2)];
            end
          reg178 <= {$unsigned($signed(((8'hba) ?
                  $unsigned(wire153) : $signed(reg167)))),
              $signed($signed(reg170[(3'h5):(2'h3)]))};
          if (reg161[(4'ha):(2'h3)])
            begin
              reg179 <= (($unsigned((~(reg160 ? reg166 : (8'hb0)))) ?
                  reg163 : (~&{{reg168, wire153},
                      (wire169 || (8'ha1))})) >= (reg172 ?
                  ({(wire158 ^ wire169)} ?
                      ($signed(wire158) ?
                          reg174 : wire158) : $unsigned($signed(wire158))) : (((reg171 ?
                          reg163 : reg170) && (~&wire155)) ?
                      (8'hb4) : $signed((-wire153)))));
              reg180 <= $unsigned(((wire169 ?
                      $signed($unsigned(reg165)) : $signed((~|(8'hb7)))) ?
                  reg161 : $signed(wire159)));
              reg181 <= ((reg172 << {(^$unsigned((8'had)))}) >> ($signed(wire157[(1'h0):(1'h0)]) <= $unsigned({reg175,
                  $unsigned(reg160)})));
              reg182 <= ((~^reg180) ?
                  reg181 : {(!((^~(8'h9e)) || $unsigned(wire157)))});
              reg183 <= reg180[(1'h1):(1'h0)];
            end
          else
            begin
              reg179 <= wire157[(3'h5):(1'h0)];
              reg180 <= ($unsigned({reg175,
                  $unsigned((reg170 ?
                      reg174 : wire153))}) || $unsigned(reg170));
              reg181 <= $unsigned(wire158);
              reg182 <= (reg162[(4'he):(3'h7)] >> reg162);
            end
          reg184 <= reg163;
        end
      reg185 <= ({wire169} ?
          (({$signed(reg176), $signed(reg161)} ?
              (~|(reg161 >>> (8'hbf))) : (7'h42)) >= {reg171[(1'h1):(1'h1)],
              reg171}) : ($signed(wire157[(4'hb):(2'h3)]) ~^ reg181[(3'h5):(2'h3)]));
    end
  assign wire186 = $unsigned(reg160[(1'h0):(1'h0)]);
  assign wire187 = $signed($unsigned($signed((^(wire159 ? reg183 : (8'hab))))));
  assign wire188 = ({wire154} || ($unsigned(wire154[(4'h8):(1'h0)]) ?
                       wire187[(4'hc):(4'hc)] : ($unsigned(reg162[(2'h3):(1'h1)]) << $signed((reg170 ?
                           (8'ha2) : reg165)))));
  assign wire189 = $unsigned(reg170[(4'h8):(4'h8)]);
  assign wire190 = $unsigned({{($signed(reg182) ~^ reg171[(4'h8):(4'h8)]),
                           (((8'hbd) >= reg173) != reg177)}});
  assign wire191 = $unsigned((reg177[(3'h4):(1'h0)] >>> reg179));
  assign wire192 = ($unsigned(wire153[(3'h7):(1'h1)]) << ((({wire188} ?
                           (|reg172) : (wire154 - reg161)) ?
                       (8'hab) : (wire159 * {wire187,
                           reg184})) * (~&(+$signed(wire158)))));
  assign wire193 = (|$signed(((~&(-reg163)) ?
                       wire158[(1'h1):(1'h1)] : reg168[(3'h6):(2'h3)])));
  assign wire194 = (($unsigned((|$signed(wire186))) ^ reg176) ?
                       (reg164[(4'ha):(4'ha)] ?
                           (reg171 != (^(reg160 && wire190))) : (|(|(^reg167)))) : ($unsigned(wire192) <= $unsigned($signed((reg167 ?
                           wire156 : (8'ha5))))));
  assign wire195 = {wire193, wire192};
  assign wire196 = $signed(((~|($unsigned(reg162) ?
                           $unsigned(wire190) : (reg181 != reg173))) ?
                       reg170[(3'h7):(3'h7)] : ($signed(reg182) != (wire190[(4'h8):(4'h8)] != reg165))));
  assign wire197 = ($unsigned({(~(~|reg181))}) ?
                       ($signed($unsigned((reg178 || reg168))) ?
                           $signed({(wire191 ?
                                   reg165 : reg179)}) : $signed($signed((reg163 > wire154)))) : (reg183[(1'h0):(1'h0)] - $signed($signed({wire153}))));
  assign wire198 = wire155;
endmodule

module module71
#(parameter param148 = ((~{(|((8'h9f) != (7'h43))), (&((8'hb8) ? (8'hb0) : (8'h9d)))}) - (|(|(8'ha3)))))
(y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'h359):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire75;
  input wire signed [(2'h2):(1'h0)] wire74;
  input wire signed [(4'hf):(1'h0)] wire73;
  input wire [(3'h7):(1'h0)] wire72;
  wire [(5'h10):(1'h0)] wire99;
  wire [(4'h8):(1'h0)] wire98;
  wire signed [(4'hc):(1'h0)] wire97;
  wire signed [(3'h6):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire95;
  wire [(4'h9):(1'h0)] wire94;
  wire [(5'h10):(1'h0)] wire81;
  wire signed [(4'h9):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire78;
  wire [(3'h4):(1'h0)] wire77;
  wire [(4'h9):(1'h0)] wire76;
  reg [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(5'h15):(1'h0)] reg146 = (1'h0);
  reg [(4'hf):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg141 = (1'h0);
  reg signed [(4'he):(1'h0)] reg140 = (1'h0);
  reg [(5'h15):(1'h0)] reg139 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg137 = (1'h0);
  reg [(4'h9):(1'h0)] reg136 = (1'h0);
  reg [(5'h10):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg134 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg130 = (1'h0);
  reg [(3'h7):(1'h0)] reg129 = (1'h0);
  reg [(5'h11):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg127 = (1'h0);
  reg [(3'h7):(1'h0)] reg126 = (1'h0);
  reg [(4'hd):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg122 = (1'h0);
  reg [(3'h6):(1'h0)] reg121 = (1'h0);
  reg [(3'h6):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg118 = (1'h0);
  reg [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg [(4'hf):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg110 = (1'h0);
  reg [(4'hd):(1'h0)] reg109 = (1'h0);
  reg [(4'hf):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  reg [(4'he):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  reg [(5'h11):(1'h0)] reg102 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg90 = (1'h0);
  reg [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg82 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
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
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
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
                 (1'h0)};
  assign wire76 = {$unsigned({$unsigned((wire74 ? wire74 : wire73))}),
                      ($unsigned(wire75[(3'h7):(3'h6)]) ?
                          wire73[(2'h3):(1'h0)] : (^~({wire75,
                              wire72} + $unsigned((8'ha5)))))};
  assign wire77 = (((^~wire74) ?
                      ($unsigned(wire72[(1'h1):(1'h0)]) ?
                          {(wire76 << wire74),
                              wire74} : $unsigned((^wire75))) : ((8'ha6) ?
                          wire74 : wire75)) | $unsigned((wire73[(4'h9):(3'h4)] ?
                      ((wire74 ? wire74 : wire75) & (wire75 ?
                          wire75 : wire72)) : (wire76 < (~^wire72)))));
  assign wire78 = (($unsigned($signed(wire76[(3'h4):(1'h0)])) || (+$signed(wire74[(1'h0):(1'h0)]))) ?
                      wire76[(3'h7):(2'h2)] : ({wire76} ?
                          $signed($signed($unsigned(wire74))) : (($signed((8'hbe)) ?
                              wire74 : {wire72}) || (7'h42))));
  assign wire79 = ($unsigned({(wire75 & wire74)}) ?
                      (&($unsigned((&wire76)) ?
                          $unsigned((wire72 | (8'ha6))) : wire74)) : ($signed(wire77[(1'h0):(1'h0)]) ?
                          ($unsigned((wire72 ?
                              wire76 : wire78)) > wire72) : ($signed(wire75[(3'h5):(1'h1)]) ^~ ((wire72 * wire76) ?
                              $signed(wire78) : $signed((8'h9d))))));
  assign wire80 = $unsigned((8'hb8));
  assign wire81 = ((&$unsigned($signed((wire74 ~^ wire74)))) | $unsigned(wire78));
  always
    @(posedge clk) begin
      if (($signed((^((~^wire78) || (~^wire72)))) * wire77))
        begin
          reg82 <= wire76;
          reg83 <= $signed((!reg82));
          if (reg82[(4'hc):(3'h4)])
            begin
              reg84 <= (-(-{reg82[(4'ha):(4'h8)]}));
            end
          else
            begin
              reg84 <= wire80;
              reg85 <= $unsigned((-(~|$signed(reg82[(3'h7):(3'h7)]))));
              reg86 <= (wire75 > reg82[(3'h7):(2'h3)]);
              reg87 <= (({$signed({wire80, reg82}), wire76[(2'h2):(1'h0)]} ?
                  (((8'ha4) ?
                      $unsigned(reg85) : wire74) <= ((~&wire80) || {wire74})) : (wire79 > (((8'hbd) ?
                          (8'hb3) : wire75) ?
                      wire81[(4'hb):(3'h6)] : (|(7'h41))))) | (^$signed(($unsigned(wire78) != reg82))));
              reg88 <= $unsigned(wire76[(2'h3):(2'h3)]);
            end
          reg89 <= {($unsigned($signed($signed((7'h42)))) ?
                  $signed(reg83[(2'h2):(1'h0)]) : reg84)};
        end
      else
        begin
          reg82 <= $signed((wire79 ?
              (((|wire77) ~^ {(8'hb7)}) ?
                  {((8'hb7) ? wire81 : wire76), $unsigned(reg85)} : (((7'h40) ?
                      reg85 : reg89) <= $unsigned(reg87))) : wire81[(4'ha):(4'ha)]));
          reg83 <= reg86[(2'h2):(1'h1)];
          if (wire73[(4'ha):(4'h8)])
            begin
              reg84 <= (8'hb0);
              reg85 <= ({(!($signed(reg86) ?
                          ((8'hb5) ^~ reg83) : $signed(wire73)))} ?
                  reg89[(3'h6):(1'h1)] : ((~^{wire76[(3'h5):(3'h4)],
                      (~^wire76)}) && (+wire80[(4'h8):(3'h7)])));
              reg86 <= ((wire79[(4'hf):(4'h9)] ?
                      $unsigned(({reg88,
                          wire81} || $unsigned(reg85))) : $signed((8'hb2))) ?
                  $unsigned(({{reg85, reg86},
                      $unsigned(wire80)} + wire81[(5'h10):(1'h0)])) : ({$signed((wire77 ?
                              wire76 : wire74)),
                          reg87} ?
                      wire72[(3'h7):(1'h0)] : {reg84[(4'ha):(4'ha)],
                          {$signed(reg83), wire73}}));
              reg87 <= (~(^~$signed({{reg87}, (^(8'hbd))})));
              reg88 <= $unsigned({(($unsigned(wire77) ?
                      reg85 : $signed(reg88)) >= reg83)});
            end
          else
            begin
              reg84 <= {$signed($unsigned($signed({reg85, (8'hb4)}))),
                  $unsigned($unsigned(reg83))};
              reg85 <= ((^wire81[(3'h4):(1'h1)]) ^ (wire81 - (^$signed(wire77[(3'h4):(2'h3)]))));
            end
          reg89 <= (({$unsigned($signed(reg82))} ^~ $signed($signed((reg85 ~^ wire74)))) <= $signed($unsigned($unsigned((|(8'ha0))))));
        end
      reg90 <= {(!$signed(wire75[(4'hb):(3'h5)]))};
      reg91 <= $unsigned((&wire78[(4'h8):(3'h4)]));
      reg92 <= (reg90 ?
          (((~&(reg87 ? (8'hae) : wire73)) == wire79[(4'hb):(3'h4)]) ?
              reg86 : wire78[(4'ha):(3'h6)]) : (8'hb1));
      reg93 <= ((~^wire72) ^~ ((+($unsigned(reg91) << (8'hb3))) ?
          ($unsigned($unsigned((8'hbd))) << $unsigned(wire78[(4'h9):(1'h1)])) : {reg83[(5'h10):(4'hb)],
              $unsigned(wire79)}));
    end
  assign wire94 = reg85[(5'h10):(3'h6)];
  assign wire95 = ({$unsigned(reg83)} || wire73);
  assign wire96 = ($unsigned($signed(reg84[(4'h9):(3'h5)])) || (reg83[(3'h5):(3'h4)] ?
                      reg84 : $unsigned((~|{reg93, (8'hb5)}))));
  assign wire97 = wire73;
  assign wire98 = ((~^{(wire75[(3'h4):(1'h0)] + reg93)}) >>> $unsigned(((|reg90) > {(reg84 << wire77)})));
  assign wire99 = wire96;
  always
    @(posedge clk) begin
      if ((((8'hb8) <<< (((-wire96) <<< $unsigned(wire74)) ?
              $signed((reg82 ? reg90 : wire97)) : (8'ha9))) ?
          (-reg82) : wire97))
        begin
          reg100 <= (8'ha2);
          reg101 <= $unsigned($signed((^~(+wire96))));
          reg102 <= {wire76[(3'h5):(3'h4)]};
          if (wire94[(4'h9):(2'h3)])
            begin
              reg103 <= ($signed($signed(((^wire95) | {wire95}))) ~^ wire73[(3'h6):(1'h1)]);
              reg104 <= wire72[(2'h2):(1'h1)];
              reg105 <= (wire74 ?
                  {$signed($signed(wire95)),
                      wire98[(2'h2):(2'h2)]} : (reg84[(5'h11):(1'h0)] ~^ ((|(reg88 <<< wire97)) ^ {(!reg100)})));
              reg106 <= (wire98 ?
                  reg102 : $unsigned((((wire81 ? wire97 : wire97) ?
                      reg90 : $unsigned(wire95)) > reg88)));
            end
          else
            begin
              reg103 <= $signed((^$unsigned(reg92)));
              reg104 <= wire96;
              reg105 <= (reg92[(2'h2):(1'h1)] + $unsigned((((~|(8'hbb)) ?
                      ((7'h42) ? wire79 : (8'ha3)) : (reg101 ?
                          reg89 : reg103)) ?
                  $signed((~wire98)) : (|$unsigned(reg101)))));
            end
        end
      else
        begin
          reg100 <= {reg84,
              $unsigned(($signed({reg103, reg91}) ?
                  wire76[(1'h1):(1'h1)] : $unsigned((^~reg83))))};
          reg101 <= ({reg105[(4'h8):(1'h0)],
              (!{(~reg101),
                  ((8'h9c) ? reg105 : wire78)})} <<< ((wire76[(2'h3):(1'h1)] ?
                  (~^{reg84}) : reg89[(3'h4):(2'h3)]) ?
              $unsigned(wire96[(3'h6):(1'h0)]) : $signed(wire73[(4'ha):(4'h8)])));
        end
      reg107 <= $unsigned(($unsigned(({reg106} | (8'ha4))) ?
          (reg91[(3'h6):(1'h0)] ?
              {(reg104 ? wire96 : wire94), $signed(reg85)} : $unsigned((reg90 ?
                  wire77 : reg86))) : reg88[(4'h8):(2'h3)]));
      if (reg83[(3'h7):(1'h1)])
        begin
          if (wire74)
            begin
              reg108 <= (reg89[(2'h3):(2'h2)] ~^ {({(-wire79)} ?
                      ($signed(wire96) ?
                          $signed(reg87) : $unsigned((8'ha5))) : $unsigned($unsigned((8'hb1)))),
                  $unsigned($signed((reg105 <= reg103)))});
            end
          else
            begin
              reg108 <= (~|(~&(~wire81[(4'hb):(2'h3)])));
              reg109 <= (($signed(wire81[(4'hf):(4'hc)]) ?
                      reg93 : wire81[(2'h2):(1'h1)]) ?
                  reg103 : (((!reg85[(3'h5):(2'h3)]) ?
                      (~^(^~(8'h9c))) : $unsigned((reg86 | reg87))) + ((((8'hb2) ?
                          (8'hab) : wire72) != ((8'ha8) ? reg107 : wire98)) ?
                      $unsigned({reg85}) : $signed($signed(reg87)))));
              reg110 <= (((8'hb4) ~^ wire97) ?
                  {$signed(reg86[(3'h7):(3'h6)]),
                      (($signed(reg90) ?
                          (reg88 | (8'hac)) : (wire77 ?
                              wire72 : reg93)) ~^ ((-wire97) ?
                          (wire76 ? reg87 : wire96) : (~reg102)))} : wire81);
              reg111 <= ((&wire94) ~^ ($unsigned((~((8'haa) - (8'hb2)))) ?
                  $unsigned(($unsigned(reg84) ?
                      ((7'h41) ^ (8'ha6)) : $signed(reg88))) : $unsigned((^$signed(reg86)))));
              reg112 <= ((-$unsigned(wire73[(4'hd):(4'h9)])) ?
                  reg108[(4'he):(3'h6)] : $unsigned($signed($signed((wire74 ?
                      reg103 : reg109)))));
            end
          reg113 <= wire80;
          reg114 <= (!(8'hae));
          if ($unsigned(reg82))
            begin
              reg115 <= {$unsigned($unsigned(wire81[(1'h1):(1'h0)]))};
              reg116 <= wire97[(4'hc):(3'h7)];
              reg117 <= (reg110 != (reg85 ?
                  reg82 : ($signed(reg93[(3'h4):(1'h1)]) ?
                      ((reg90 - reg88) ^~ $unsigned(reg109)) : reg111)));
              reg118 <= ((($unsigned(reg88) ?
                          ((~&reg105) || (wire77 != reg100)) : reg100[(2'h3):(1'h1)]) ?
                      (&$signed({reg116, wire99})) : wire99[(4'he):(2'h3)]) ?
                  ({(~&(reg91 ? (7'h40) : (8'hae))), (^~(wire75 ^ wire94))} ?
                      (reg100 ^ $signed(reg112)) : (wire75[(3'h7):(3'h6)] ^ ((wire99 * reg108) - $unsigned(wire79)))) : $signed({$unsigned((reg113 - wire78)),
                      $signed((wire75 || reg93))}));
            end
          else
            begin
              reg115 <= wire73[(2'h3):(2'h3)];
              reg116 <= (^~reg113);
              reg117 <= {reg92[(1'h0):(1'h0)],
                  $signed(({$signed(reg114)} ?
                      wire80 : $signed(((7'h42) < reg117))))};
              reg118 <= (&$unsigned(({$unsigned(reg83),
                  $unsigned(wire75)} >> $unsigned((reg116 >= reg118)))));
              reg119 <= (|wire76);
            end
        end
      else
        begin
          reg108 <= $signed((reg107 ? (+wire73) : reg101[(1'h0):(1'h0)]));
          reg109 <= $signed((reg119 > $signed($signed({reg118, wire74}))));
          reg110 <= $signed(reg87[(2'h2):(1'h0)]);
        end
      if ($unsigned($signed($signed({(~|wire94), (wire74 || reg91)}))))
        begin
          reg120 <= {(~|$signed({$signed(wire96)})),
              ({(reg85 << (reg88 ? wire97 : wire78)), (-(8'ha9))} ?
                  (((8'hae) > reg100[(2'h2):(1'h0)]) ?
                      {$unsigned(reg100)} : ((wire97 && reg91) ?
                          {reg115, reg90} : reg111[(1'h1):(1'h0)])) : (reg87 ?
                      (&$unsigned(wire96)) : wire72[(1'h0):(1'h0)]))};
          reg121 <= ($signed($unsigned(((reg113 || reg109) ?
              reg86 : (^~reg105)))) || reg113[(2'h3):(2'h3)]);
          reg122 <= (-(7'h44));
          reg123 <= $signed($unsigned(($signed((reg109 ^ reg106)) ?
              reg82 : (^$signed(reg113)))));
          if ($signed((+wire81[(3'h5):(3'h4)])))
            begin
              reg124 <= ((reg87 ?
                      $unsigned({$signed(reg88),
                          ((8'ha2) << reg89)}) : $unsigned($signed($unsigned(reg118)))) ?
                  (reg109[(1'h1):(1'h1)] >= (reg86[(3'h6):(3'h4)] ?
                      $unsigned($unsigned(reg93)) : $signed(wire73))) : reg115);
            end
          else
            begin
              reg124 <= reg106[(3'h6):(1'h1)];
            end
        end
      else
        begin
          reg120 <= $unsigned((^reg113));
          reg121 <= $unsigned((({$signed(reg88)} ?
              reg106[(2'h3):(2'h2)] : ($signed(reg120) ?
                  reg124[(4'hd):(4'h8)] : (-reg101))) != ($signed({wire73}) ?
              (wire98[(1'h0):(1'h0)] > {wire72, reg120}) : (reg121 ^ ((8'hbd) ?
                  reg101 : reg108)))));
          reg122 <= reg91;
          reg123 <= (((reg111 ?
                  $unsigned($signed(reg101)) : (-(wire80 ^ (8'hbb)))) ?
              (((^~wire74) ? {reg103} : $unsigned(reg120)) ?
                  ($signed(reg123) && reg123[(4'ha):(3'h5)]) : reg119) : reg88[(4'h8):(3'h4)]) - (!(~&wire80[(4'h8):(3'h7)])));
          if (($unsigned(wire73[(3'h4):(1'h1)]) ^ $signed((reg120 ?
              (^$unsigned((8'haa))) : (^~((8'hb0) ? wire94 : wire98))))))
            begin
              reg124 <= reg91[(4'h8):(3'h4)];
              reg125 <= {reg84[(4'hb):(3'h5)]};
              reg126 <= reg117;
              reg127 <= ($signed((reg108[(4'hf):(3'h6)] ?
                      wire77[(2'h3):(2'h3)] : (^~$unsigned(reg83)))) ?
                  reg121 : (~$unsigned(reg87[(2'h2):(2'h2)])));
            end
          else
            begin
              reg124 <= $signed((reg104 == reg88));
              reg125 <= $unsigned($unsigned((&$unsigned(((7'h43) | wire94)))));
              reg126 <= ($signed(reg100) ~^ reg121[(2'h2):(1'h1)]);
              reg127 <= $unsigned(reg103);
              reg128 <= $signed($unsigned(reg85));
            end
        end
      if (reg90[(3'h7):(2'h3)])
        begin
          reg129 <= $signed($signed({(~(^~reg92)),
              $unsigned((wire76 && (8'ha2)))}));
          if ({$signed(($unsigned(reg89) || reg129))})
            begin
              reg130 <= (&(reg104 + (~^wire97)));
              reg131 <= $signed(($signed(reg101[(1'h1):(1'h1)]) ?
                  reg100[(2'h3):(1'h0)] : ($signed($signed(wire97)) ?
                      $signed($signed(reg120)) : (((8'hb3) | reg90) << $signed(reg88)))));
              reg132 <= $unsigned((((^reg115) ? reg111[(2'h3):(1'h0)] : reg91) ?
                  $signed($signed(wire76[(3'h7):(3'h4)])) : (~&$signed(reg121))));
              reg133 <= reg113[(2'h3):(2'h3)];
            end
          else
            begin
              reg130 <= $signed(($signed(reg103[(4'h8):(3'h7)]) - (~&((~reg87) >= (~reg115)))));
              reg131 <= reg107[(4'hd):(3'h6)];
              reg132 <= ((7'h43) - $unsigned(((((8'hb0) ?
                      reg111 : reg100) && (8'ha8)) ?
                  ((wire77 ? reg123 : reg115) ?
                      $signed(reg90) : (reg133 + reg104)) : (&reg92[(2'h2):(2'h2)]))));
              reg133 <= (8'ha4);
              reg134 <= ((wire97 ~^ (((reg130 ?
                      reg133 : reg88) ~^ (reg119 * (8'hac))) ?
                  $signed($signed((8'hbc))) : reg123)) | reg127);
            end
          reg135 <= ((reg113[(1'h0):(1'h0)] ?
              $signed((~|((8'had) ? reg105 : reg117))) : (~wire98)) ~^ reg133);
        end
      else
        begin
          reg129 <= $unsigned($unsigned(((~(wire75 || reg106)) ?
              ((reg83 ?
                  reg123 : wire97) && $signed(reg108)) : $signed(reg118[(4'hb):(3'h6)]))));
          if ($unsigned(reg134))
            begin
              reg130 <= reg104;
              reg131 <= $unsigned(reg112);
              reg132 <= reg109;
              reg133 <= wire81;
              reg134 <= (($signed(($unsigned(reg125) && $unsigned(reg125))) ?
                  $unsigned(reg122) : (wire76 & $unsigned((reg101 ?
                      (8'ha9) : reg88)))) < ((reg106 ?
                      $signed((reg92 ?
                          (8'hb2) : reg111)) : (reg119[(4'hd):(1'h1)] & reg88)) ?
                  $unsigned(reg109) : ((-(+reg109)) ?
                      reg129[(2'h2):(2'h2)] : $signed($unsigned(wire97)))));
            end
          else
            begin
              reg130 <= (wire96[(2'h2):(2'h2)] ?
                  reg103[(3'h7):(3'h6)] : (reg88 ?
                      reg102 : reg87[(2'h2):(1'h0)]));
              reg131 <= (-reg86);
            end
          reg135 <= {wire98[(1'h1):(1'h1)]};
          reg136 <= $unsigned((~&$signed($signed(reg86[(1'h1):(1'h0)]))));
        end
    end
  always
    @(posedge clk) begin
      if ((&(~^(~|$unsigned({reg104, reg108})))))
        begin
          reg137 <= $signed(((wire96 | (reg87 ?
              (reg119 <= reg135) : $unsigned(wire76))) != {$signed({reg122,
                  (8'hb6)}),
              reg133[(4'he):(1'h1)]}));
          reg138 <= ($unsigned(((^wire77) && reg126[(3'h5):(1'h1)])) ?
              reg88 : ($signed($unsigned((wire94 * reg110))) ?
                  ((8'hb6) ?
                      ((wire96 ?
                          reg83 : wire96) && {reg110}) : ((reg104 - wire72) + (wire80 ?
                          reg87 : reg90))) : ($unsigned({reg93,
                      reg124}) >= reg119)));
          if ($unsigned(reg138))
            begin
              reg139 <= (((wire76 <<< ({reg111} || (reg131 ^ (7'h41)))) || $unsigned($unsigned((wire78 || wire76)))) ^ ((|$unsigned(reg104)) ?
                  wire98[(3'h6):(3'h5)] : (^~(|(~wire74)))));
              reg140 <= (~^(^wire79));
              reg141 <= ((reg116 != $unsigned($signed($unsigned(reg114)))) ~^ $unsigned((reg122 ?
                  wire97[(4'ha):(1'h1)] : {reg116[(2'h2):(2'h2)]})));
              reg142 <= (~reg141);
            end
          else
            begin
              reg139 <= ((~&$unsigned($unsigned({wire98}))) > (reg106[(3'h4):(1'h0)] >> ((~^wire73) ?
                  (~^((8'hae) << reg92)) : {wire97})));
              reg140 <= (~|$signed((~((reg116 ?
                  reg137 : wire81) && (reg130 & reg125)))));
              reg141 <= ((~&reg108[(4'hb):(4'hb)]) != wire78);
            end
          reg143 <= (~(^~{wire98[(3'h4):(3'h4)]}));
          reg144 <= $signed((~^((reg102[(4'hb):(2'h3)] >= (reg119 ^~ reg131)) * reg126[(2'h2):(1'h0)])));
        end
      else
        begin
          reg137 <= (+$unsigned((({(8'ha3), (8'hbd)} ~^ (reg112 < reg132)) ?
              $unsigned((!reg142)) : wire97[(3'h5):(1'h1)])));
          reg138 <= reg133[(3'h7):(3'h5)];
          reg139 <= wire72[(2'h2):(1'h0)];
          reg140 <= $signed($signed((~^(reg82[(4'ha):(4'h8)] >> (reg89 & reg121)))));
          reg141 <= reg108[(2'h2):(1'h1)];
        end
      reg145 <= $unsigned($signed($signed($signed(reg82[(4'he):(4'h8)]))));
      reg146 <= reg111[(3'h6):(3'h5)];
      reg147 <= (reg122[(2'h2):(2'h2)] <= ($signed($unsigned(reg93[(3'h5):(3'h4)])) ?
          (((|reg120) >>> (reg143 ? reg83 : reg90)) <<< {$signed((8'h9f)),
              wire81}) : wire96));
    end
endmodule

module module23
#(parameter param65 = (8'ha5), 
parameter param66 = {((param65 ? {(8'hb8), {param65}} : ({(8'ha8)} != ((8'hb5) ? param65 : (8'ha2)))) << param65)})
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire27;
  input wire [(4'hd):(1'h0)] wire26;
  input wire [(3'h5):(1'h0)] wire25;
  input wire [(5'h10):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire64;
  wire signed [(2'h3):(1'h0)] wire63;
  wire signed [(4'hd):(1'h0)] wire62;
  wire signed [(3'h4):(1'h0)] wire56;
  wire [(4'h8):(1'h0)] wire55;
  wire [(3'h4):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire52;
  wire signed [(2'h2):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire45;
  wire signed [(4'hf):(1'h0)] wire28;
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire56,
                 wire55,
                 wire53,
                 wire52,
                 wire46,
                 wire45,
                 wire28,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg54,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
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
                 (1'h0)};
  assign wire28 = (wire24[(4'hf):(2'h3)] || wire27);
  always
    @(posedge clk) begin
      reg29 <= wire24[(4'hc):(1'h0)];
      if ($unsigned($signed($signed(wire24[(3'h6):(3'h5)]))))
        begin
          reg30 <= (((&wire24) <= {(wire27[(3'h5):(1'h1)] != (reg29 ?
                      wire26 : wire27)),
                  (8'hbe)}) ?
              $signed(((wire27[(2'h2):(2'h2)] ?
                  (wire25 != wire28) : $unsigned(wire28)) && $unsigned(wire26))) : $unsigned((^$unsigned($signed(wire26)))));
          if (wire27[(4'h8):(3'h5)])
            begin
              reg31 <= $unsigned(($unsigned(wire25[(3'h5):(2'h3)]) < $signed($unsigned($unsigned(wire27)))));
              reg32 <= wire28[(1'h1):(1'h1)];
            end
          else
            begin
              reg31 <= $signed(reg31[(2'h3):(2'h2)]);
              reg32 <= (wire25[(3'h5):(1'h0)] == wire24);
              reg33 <= (^(reg31 ?
                  {{reg31[(3'h6):(3'h4)], {wire25, reg31}}} : wire27));
            end
          reg34 <= {(reg29 ?
                  (reg30[(2'h2):(1'h1)] != reg32) : $unsigned(($signed(wire27) ?
                      reg33 : (wire27 & wire25))))};
        end
      else
        begin
          if ((!wire28))
            begin
              reg30 <= (wire27 && wire27[(3'h7):(3'h4)]);
              reg31 <= wire28[(1'h0):(1'h0)];
              reg32 <= reg33;
              reg33 <= $unsigned($signed((-{wire25})));
              reg34 <= $unsigned($unsigned(reg34));
            end
          else
            begin
              reg30 <= ((^(($unsigned(reg29) ?
                      wire24[(4'hd):(4'h9)] : $signed((7'h43))) ?
                  $signed((reg33 ?
                      reg34 : reg34)) : ($unsigned(reg34) > reg34))) <= $unsigned({$unsigned(wire24),
                  $unsigned($signed(reg34))}));
              reg31 <= {$signed($signed(wire26[(4'h8):(1'h0)]))};
              reg32 <= $unsigned((~&(wire28 ?
                  $unsigned(reg31) : ((reg31 ? reg32 : wire24) ?
                      $signed(wire26) : (reg30 >> wire25)))));
              reg33 <= (((reg34 || $signed((~^wire28))) ?
                      (reg34 ^~ {(reg32 ? wire26 : reg32),
                          reg29}) : (~($signed(wire26) || (reg33 ?
                          wire26 : reg34)))) ?
                  $unsigned((8'hb7)) : $signed(reg29[(2'h3):(1'h0)]));
              reg34 <= reg31[(1'h0):(1'h0)];
            end
          reg35 <= (-$signed($unsigned(reg31)));
        end
      if (((((~^$unsigned(wire24)) >= ($unsigned((8'hb8)) ?
              (8'hba) : reg29[(4'he):(4'hd)])) | $unsigned($unsigned($signed(wire28)))) ?
          (!reg29[(1'h0):(1'h0)]) : ($unsigned((|(+wire26))) ?
              $unsigned($unsigned($unsigned(reg31))) : ($unsigned(reg34) ?
                  (reg32 >> (wire24 ?
                      wire28 : reg35)) : reg32[(3'h6):(2'h2)]))))
        begin
          reg36 <= ((^~$unsigned(wire25)) ~^ $unsigned((wire24[(4'hc):(1'h0)] ?
              ($unsigned(reg33) + {wire27}) : (8'h9c))));
        end
      else
        begin
          reg36 <= (~&(~|reg32));
          reg37 <= $unsigned(wire24);
        end
      reg38 <= $unsigned({wire28,
          ($unsigned({(8'hb8), (8'hb6)}) <= (^~$signed(reg37)))});
      if (reg35)
        begin
          if (($signed((~|(^~(reg31 || wire24)))) ~^ ((8'hb6) ?
              (($signed(reg37) ? (reg33 || reg29) : reg36) ^ (reg30 ?
                  (reg31 ? wire25 : reg30) : {(7'h43), reg38})) : reg34)))
            begin
              reg39 <= (wire28[(4'hc):(3'h6)] ? (^(~reg38)) : $signed(wire26));
              reg40 <= {$unsigned($unsigned(($unsigned(wire28) >= (wire28 ?
                      reg35 : (8'ha4))))),
                  (($signed(reg31[(4'h8):(3'h4)]) ?
                          (wire26 ?
                              (wire24 >>> (8'hab)) : (reg39 > reg29)) : reg29) ?
                      $unsigned(({wire25} ?
                          $unsigned((8'ha0)) : reg38[(3'h5):(2'h3)])) : wire26[(4'h9):(4'h8)])};
              reg41 <= $signed($unsigned((~|$signed(reg33))));
              reg42 <= (reg33 == ((!(~(7'h44))) ? reg39 : reg33));
              reg43 <= $unsigned(reg38);
            end
          else
            begin
              reg39 <= reg32[(1'h1):(1'h1)];
              reg40 <= $signed((((^reg39) ?
                      $signed($signed(reg41)) : ($signed(reg38) ?
                          (wire25 || reg35) : (reg34 == reg31))) ?
                  $unsigned(((reg39 & reg41) * (^~(8'hb1)))) : reg42[(3'h5):(1'h0)]));
              reg41 <= (&(~^{(~$signed((8'hb2))), (8'haf)}));
              reg42 <= (~$unsigned(((&wire27[(3'h6):(1'h0)]) == (8'h9c))));
              reg43 <= (($signed($unsigned((reg39 ? (8'ha4) : wire28))) ?
                      (((~|reg39) | (wire27 <= reg41)) <= (reg30[(1'h1):(1'h1)] << ((8'h9f) ?
                          (8'ha7) : reg29))) : $signed((wire25[(1'h1):(1'h1)] ?
                          $signed(reg34) : $unsigned(reg31)))) ?
                  $signed(((reg30 ?
                      $unsigned(reg34) : $signed(reg35)) | (7'h42))) : reg37[(2'h2):(1'h0)]);
            end
        end
      else
        begin
          reg39 <= (&$signed({(8'had),
              ($unsigned(reg33) <= wire28[(4'h9):(2'h2)])}));
          if (wire26[(4'h9):(2'h3)])
            begin
              reg40 <= (&(^~$signed(($signed(reg29) ?
                  $signed(reg43) : (reg42 <<< reg33)))));
              reg41 <= (^~$signed(reg37));
              reg42 <= ($unsigned(wire28) ^ (8'h9c));
            end
          else
            begin
              reg40 <= $signed(((&{reg43[(2'h2):(2'h2)]}) >= $unsigned(((-wire26) ^~ (reg40 <= reg38)))));
              reg41 <= $unsigned(wire24);
              reg42 <= reg38;
              reg43 <= ($signed(wire24) == reg35[(2'h2):(1'h1)]);
              reg44 <= (reg43 ?
                  (~|{{((8'hb0) ~^ (8'hb2))}}) : (^~((+(reg35 ?
                      reg43 : reg31)) & wire25[(1'h1):(1'h0)])));
            end
        end
    end
  assign wire45 = $unsigned($unsigned(($unsigned((~reg34)) ^~ ((reg35 == reg31) * reg41[(3'h4):(1'h0)]))));
  assign wire46 = reg29;
  always
    @(posedge clk) begin
      reg47 <= (8'hb3);
      reg48 <= (reg37 == (reg33[(4'h8):(1'h1)] ?
          (reg43[(4'h8):(2'h2)] ?
              $signed($unsigned((8'ha1))) : reg43) : $unsigned(wire46)));
      reg49 <= $signed(($unsigned(reg36[(1'h0):(1'h0)]) ?
          (reg48[(1'h0):(1'h0)] ?
              (&(^~reg29)) : reg37) : wire45[(1'h1):(1'h0)]));
      reg50 <= (&{wire45[(2'h2):(1'h0)],
          ($unsigned((&reg41)) | reg47[(1'h0):(1'h0)])});
      reg51 <= (({{$unsigned(reg35), {wire24, reg30}}} ?
          $signed($signed((wire28 ?
              reg29 : reg38))) : $unsigned((8'haa))) ^~ ({(~|wire24)} && $unsigned(reg35)));
    end
  assign wire52 = $signed((-($unsigned($unsigned(reg29)) ?
                      $unsigned((wire25 ?
                          wire46 : reg49)) : reg31[(2'h3):(1'h0)])));
  assign wire53 = reg33;
  always
    @(posedge clk) begin
      reg54 <= reg33;
    end
  assign wire55 = (~|reg44[(1'h1):(1'h0)]);
  assign wire56 = (((~&((^reg54) ? (+reg40) : (^reg29))) ?
                          wire52[(3'h5):(3'h4)] : $unsigned((^reg36[(3'h4):(3'h4)]))) ?
                      reg37[(1'h0):(1'h0)] : (reg37[(4'he):(1'h0)] || {($signed(reg37) ?
                              {wire24, reg36} : (&wire46))}));
  always
    @(posedge clk) begin
      reg57 <= (~|(^~($unsigned($signed(reg49)) ?
          ({wire55} > wire53[(2'h2):(1'h0)]) : ((reg35 ?
              reg42 : reg30) & ((8'hb3) ~^ reg32)))));
      reg58 <= (|(~$signed($signed(reg42[(3'h7):(3'h4)]))));
      reg59 <= {(&{wire53, $signed((&wire55))})};
      reg60 <= ($signed((($unsigned(reg35) ?
          (-reg36) : wire28) - reg47[(1'h1):(1'h0)])) >>> (&reg58[(3'h5):(1'h1)]));
      reg61 <= {((wire56 > ((reg44 ? wire24 : reg29) <= (wire25 ?
                  reg58 : (8'hbe)))) ?
              reg30[(1'h0):(1'h0)] : $signed(({reg39} != reg33[(4'hd):(4'hd)]))),
          $signed(reg59)};
    end
  assign wire62 = ($signed({(~$unsigned(reg60))}) ?
                      ($unsigned((~&reg51[(3'h6):(1'h0)])) ?
                          (|wire27) : wire46[(1'h1):(1'h1)]) : $signed({(wire24 ^ wire24[(3'h4):(1'h1)])}));
  assign wire63 = ((wire27[(4'h8):(4'h8)] ?
                          (~($signed(reg58) >>> {reg43})) : reg41[(2'h2):(2'h2)]) ?
                      reg54[(3'h7):(3'h5)] : (reg49 << reg33[(1'h0):(1'h0)]));
  assign wire64 = wire52[(2'h3):(2'h3)];
endmodule
