module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire245;
  wire signed [(4'hd):(1'h0)] wire244;
  wire signed [(4'hc):(1'h0)] wire242;
  wire [(5'h13):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  assign y = {wire245,
                 wire244,
                 wire242,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire14,
                 wire6,
                 wire5,
                 wire4,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 (1'h0)};
  assign wire4 = $signed((wire3[(3'h5):(2'h3)] ?
                     wire2 : (wire1[(3'h5):(3'h5)] ?
                         (((7'h44) << wire0) & (&(8'hb8))) : wire1[(4'h8):(3'h6)])));
  assign wire5 = (({((wire0 > wire2) ? (wire0 << wire2) : wire2[(1'h0):(1'h0)]),
                     (wire0[(2'h2):(1'h1)] == $signed(wire4))} * ($signed((wire2 ?
                     (8'h9f) : wire4)) >>> $signed((|(8'ha1))))) - $unsigned((~^($unsigned(wire1) & $unsigned(wire2)))));
  assign wire6 = wire4[(4'hf):(4'h8)];
  always
    @(posedge clk) begin
      reg7 <= wire2[(4'h8):(2'h2)];
      reg8 <= $signed(((reg7 + {$signed(wire0), wire0}) ?
          $unsigned($signed($unsigned(wire0))) : wire1[(2'h2):(1'h0)]));
      reg9 <= $signed(((8'h9d) ?
          ({{wire0}} ?
              ({wire5} || $unsigned(wire0)) : {$unsigned(wire3)}) : wire6[(2'h2):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg10 <= (7'h44);
    end
  always
    @(posedge clk) begin
      reg11 <= (~|wire6);
    end
  always
    @(posedge clk) begin
      reg12 <= reg9[(4'hb):(1'h0)];
      reg13 <= $unsigned((&reg9));
    end
  assign wire14 = $unsigned((8'hab));
  always
    @(posedge clk) begin
      reg15 <= (7'h40);
      reg16 <= reg9[(1'h1):(1'h1)];
      reg17 <= $unsigned($signed($unsigned(reg10[(3'h7):(3'h7)])));
      reg18 <= ($unsigned((reg8 ?
              {(8'ha7), $signed((8'hb6))} : ((reg8 ? wire14 : reg16) ?
                  reg15[(4'h9):(4'h8)] : $signed(reg10)))) ?
          $unsigned((($unsigned(reg10) != reg13) != reg17[(1'h0):(1'h0)])) : wire14);
      reg19 <= (reg16[(4'hd):(4'hc)] ?
          (($unsigned((reg18 ^~ wire1)) ? reg12 : {(|reg7), $signed(reg9)}) ?
              $signed((reg7 ?
                  $signed(reg16) : (8'hbb))) : $signed({reg9[(4'h9):(3'h4)]})) : $unsigned((~(|(^~(7'h41))))));
    end
  assign wire20 = reg9;
  assign wire21 = $unsigned($signed((~|(~^wire2[(3'h5):(3'h4)]))));
  assign wire22 = $signed((reg15[(5'h12):(2'h3)] ^~ {reg13}));
  assign wire23 = ((+wire22) ?
                      wire2[(4'h8):(1'h1)] : ($unsigned(($unsigned(wire14) ~^ ((8'ha8) ?
                          reg17 : wire5))) < (reg11[(2'h3):(1'h1)] ?
                          (8'hb9) : wire5[(3'h5):(2'h2)])));
  module24 #() modinst243 (.y(wire242), .wire25(reg16), .wire27(wire0), .clk(clk), .wire28(wire23), .wire26(reg13));
  assign wire244 = wire242;
  module181 #() modinst246 (.wire186(wire4), .clk(clk), .wire185(wire20), .wire183(wire244), .wire182(reg11), .wire184(wire1), .y(wire245));
endmodule

module module24
#(parameter param240 = (((~&(8'ha5)) >>> (^~(~&(&(7'h43))))) ? (^~(^~{((8'hb1) ? (8'h9d) : (8'hb1))})) : (+((((8'hb3) <<< (8'hac)) * ((8'hbd) ? (8'ha1) : (8'hb1))) ? {((8'ha3) > (8'ha1))} : ((8'hb1) ? (-(8'ha5)) : ((8'ha9) << (8'ha5)))))), 
parameter param241 = {param240, param240})
(y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'h1b5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire28;
  input wire [(5'h15):(1'h0)] wire27;
  input wire signed [(5'h15):(1'h0)] wire26;
  input wire [(4'he):(1'h0)] wire25;
  wire [(3'h7):(1'h0)] wire238;
  wire signed [(4'hf):(1'h0)] wire237;
  wire [(5'h13):(1'h0)] wire236;
  wire signed [(5'h14):(1'h0)] wire235;
  wire signed [(3'h5):(1'h0)] wire234;
  wire signed [(2'h3):(1'h0)] wire233;
  wire signed [(5'h12):(1'h0)] wire218;
  wire [(5'h10):(1'h0)] wire217;
  wire [(4'hd):(1'h0)] wire216;
  wire [(4'h8):(1'h0)] wire215;
  wire [(3'h7):(1'h0)] wire214;
  wire [(4'hf):(1'h0)] wire213;
  wire signed [(2'h3):(1'h0)] wire211;
  wire signed [(4'hc):(1'h0)] wire179;
  wire signed [(4'hc):(1'h0)] wire140;
  wire [(2'h3):(1'h0)] wire139;
  wire [(5'h10):(1'h0)] wire136;
  wire [(3'h5):(1'h0)] wire93;
  wire [(4'he):(1'h0)] wire79;
  wire signed [(5'h15):(1'h0)] wire78;
  wire signed [(4'he):(1'h0)] wire76;
  reg [(5'h10):(1'h0)] reg232 = (1'h0);
  reg [(4'hd):(1'h0)] reg231 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg230 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg229 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg228 = (1'h0);
  reg signed [(4'he):(1'h0)] reg227 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg226 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg225 = (1'h0);
  reg [(5'h15):(1'h0)] reg224 = (1'h0);
  reg [(5'h15):(1'h0)] reg223 = (1'h0);
  reg [(2'h3):(1'h0)] reg222 = (1'h0);
  reg [(3'h5):(1'h0)] reg221 = (1'h0);
  reg [(4'hd):(1'h0)] reg220 = (1'h0);
  reg [(5'h15):(1'h0)] reg219 = (1'h0);
  reg [(5'h11):(1'h0)] reg138 = (1'h0);
  assign y = {wire238,
                 wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire233,
                 wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire211,
                 wire179,
                 wire140,
                 wire139,
                 wire136,
                 wire93,
                 wire79,
                 wire78,
                 wire76,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg138,
                 (1'h0)};
  module29 #() modinst77 (wire76, clk, wire28, wire27, wire25, wire26, (8'hb3));
  assign wire78 = ((8'ha4) - $unsigned(((-wire27[(4'h9):(2'h2)]) ?
                      {wire25, (wire25 * wire76)} : {(~&wire26), (~&wire76)})));
  assign wire79 = $unsigned(wire26);
  module80 #() modinst94 (.wire83(wire28), .wire82(wire27), .wire84(wire79), .clk(clk), .wire81(wire26), .y(wire93));
  module95 #() modinst137 (.wire97(wire28), .clk(clk), .wire98(wire79), .y(wire136), .wire96(wire76), .wire99(wire27));
  always
    @(posedge clk) begin
      reg138 <= (&$signed({wire27[(3'h5):(3'h5)]}));
    end
  assign wire139 = (!$unsigned($unsigned({(wire25 ? wire27 : reg138)})));
  assign wire140 = (^~wire136);
  module141 #() modinst180 (wire179, clk, wire76, reg138, wire28, wire78, wire136);
  module181 #() modinst212 (wire211, clk, wire26, wire78, wire25, wire139, reg138);
  assign wire213 = $unsigned(({$signed({wire93})} * reg138[(4'h9):(4'h9)]));
  assign wire214 = $unsigned(wire211[(1'h0):(1'h0)]);
  assign wire215 = {(wire211 ?
                           wire28 : (wire76 ?
                               (wire26 ?
                                   {wire140,
                                       wire27} : (wire179 | wire211)) : $signed({wire179,
                                   wire139}))),
                       ((+$unsigned((wire28 - wire136))) ^~ $signed(wire213))};
  assign wire216 = wire93[(3'h5):(2'h3)];
  assign wire217 = (($unsigned(($signed(wire93) >> {wire211})) == $signed($unsigned(((8'ha8) ?
                           wire216 : wire214)))) ?
                       wire27[(4'ha):(3'h4)] : wire140[(4'hb):(3'h6)]);
  assign wire218 = $signed((wire78 ? wire27 : (|$signed({wire216}))));
  always
    @(posedge clk) begin
      reg219 <= ($unsigned(({wire211} <<< (((8'hb7) ?
              wire179 : wire211) <= wire179))) ?
          ($unsigned((~((8'hba) - wire139))) ?
              {$unsigned(wire216[(3'h7):(1'h0)]),
                  $signed((wire216 >= reg138))} : $unsigned(((wire217 ?
                  wire214 : (8'ha6)) | $unsigned(wire140)))) : (8'ha9));
      reg220 <= (^{wire214[(3'h4):(3'h4)]});
      if ((((8'hb9) ?
              ((wire218[(4'h9):(2'h3)] != $unsigned((8'hbd))) == wire28[(4'hb):(4'ha)]) : (~&reg138[(1'h0):(1'h0)])) ?
          {wire78, $signed((-wire211))} : (wire214[(3'h6):(3'h5)] + ((+wire27) ?
              $unsigned((~|(8'h9e))) : wire26[(5'h12):(4'he)]))))
        begin
          if (((&$unsigned(((8'hb6) ?
                  wire136[(3'h7):(1'h0)] : wire26[(4'hc):(3'h4)]))) ?
              wire28[(5'h12):(3'h6)] : ($unsigned((wire26 || $unsigned(wire25))) || $signed(((|(8'ha6)) ?
                  (wire215 - wire93) : {reg219})))))
            begin
              reg221 <= {(((wire215 ? wire139[(2'h3):(1'h0)] : (!wire216)) ?
                      wire211 : wire76) ~^ reg138[(4'ha):(3'h6)]),
                  (+$unsigned(wire27[(3'h4):(3'h4)]))};
            end
          else
            begin
              reg221 <= ($unsigned((!wire140)) ?
                  $signed($unsigned(wire218)) : reg221);
            end
        end
      else
        begin
          if (wire28)
            begin
              reg221 <= wire214[(3'h6):(2'h3)];
              reg222 <= (^((wire93[(2'h3):(1'h0)] ~^ $signed(((8'hb6) >= wire78))) ?
                  wire214[(1'h1):(1'h1)] : wire76));
            end
          else
            begin
              reg221 <= (|(+(~|(+(wire216 + reg221)))));
              reg222 <= {{(wire214 ~^ $unsigned($unsigned((8'hb7))))},
                  (~wire217)};
              reg223 <= ((|reg219[(3'h7):(1'h1)]) ?
                  $unsigned(reg220) : wire136[(3'h6):(1'h0)]);
              reg224 <= reg222[(1'h0):(1'h0)];
              reg225 <= $unsigned($unsigned((!reg222[(1'h1):(1'h0)])));
            end
          reg226 <= $signed(((-$unsigned(wire216[(4'h8):(2'h2)])) + $unsigned($signed($unsigned(wire140)))));
          reg227 <= wire213[(4'h8):(4'h8)];
          if ((($signed($unsigned((reg221 | wire211))) || ({((8'hac) < wire215)} || (8'hb5))) ?
              $unsigned(reg226[(3'h6):(2'h2)]) : (({wire27[(1'h1):(1'h1)]} ?
                      (~$unsigned(wire215)) : {$unsigned(wire28)}) ?
                  $signed((wire211[(1'h0):(1'h0)] ?
                      $signed(reg222) : (reg224 ^~ wire216))) : wire79)))
            begin
              reg228 <= (((~$unsigned({wire139,
                  wire28})) - $unsigned($signed({wire211,
                  wire76}))) - ((reg220 ?
                  $signed((8'hb5)) : {{wire179, (8'hbe)}}) >>> wire215));
              reg229 <= (((8'hb0) ?
                      $signed({(wire213 ? wire218 : wire215),
                          (wire216 ? wire179 : reg223)}) : $signed((8'hb5))) ?
                  ((-wire218) >>> reg220) : wire214);
              reg230 <= $unsigned((&(wire136[(4'hf):(1'h0)] ?
                  $unsigned($signed((8'haa))) : (^~(wire216 ?
                      reg222 : wire136)))));
            end
          else
            begin
              reg228 <= (~^(~|(-$unsigned((!(8'hb5))))));
              reg229 <= wire211;
            end
        end
      reg231 <= $unsigned($unsigned(reg226[(3'h4):(2'h3)]));
      reg232 <= (~&reg219[(3'h6):(3'h5)]);
    end
  assign wire233 = (reg219[(4'hf):(1'h1)] >>> (~^{((wire217 ?
                           reg225 : wire78) || $signed(reg232)),
                       {(wire211 ? reg226 : wire179), (wire78 != wire213)}}));
  assign wire234 = $unsigned((|($unsigned(reg232[(1'h1):(1'h1)]) == (&$unsigned(reg221)))));
  assign wire235 = ($unsigned(({((7'h43) ^ reg232),
                       (reg229 ?
                           reg219 : reg231)} || (~&$unsigned(reg223)))) - reg219[(4'h9):(2'h3)]);
  assign wire236 = wire28[(1'h0):(1'h0)];
  assign wire237 = $signed($unsigned((!(reg222 ?
                       {(8'ha5)} : reg225[(2'h2):(2'h2)]))));
  module80 #() modinst239 (wire238, clk, wire213, wire79, reg232, reg224);
endmodule

module module181
#(parameter param210 = (~(((((8'ha6) >> (8'hbd)) ? ((8'ha4) - (8'hba)) : {(8'ha7)}) != ({(8'haa), (7'h44)} ? ((8'ha1) ? (8'hb9) : (8'hb6)) : (8'hbf))) != ((+(~(8'hb6))) + (|(|(8'hbe)))))))
(y, clk, wire186, wire185, wire184, wire183, wire182);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire186;
  input wire [(5'h15):(1'h0)] wire185;
  input wire signed [(4'he):(1'h0)] wire184;
  input wire [(2'h2):(1'h0)] wire183;
  input wire signed [(5'h11):(1'h0)] wire182;
  wire [(4'hc):(1'h0)] wire209;
  wire signed [(4'ha):(1'h0)] wire208;
  wire [(5'h14):(1'h0)] wire207;
  wire signed [(5'h12):(1'h0)] wire206;
  wire [(4'h8):(1'h0)] wire198;
  wire signed [(4'hc):(1'h0)] wire197;
  wire [(2'h2):(1'h0)] wire196;
  wire [(5'h12):(1'h0)] wire195;
  wire [(2'h2):(1'h0)] wire194;
  wire [(4'hf):(1'h0)] wire193;
  wire signed [(4'hd):(1'h0)] wire188;
  wire [(3'h5):(1'h0)] wire187;
  reg signed [(5'h13):(1'h0)] reg205 = (1'h0);
  reg [(4'hc):(1'h0)] reg204 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg203 = (1'h0);
  reg [(3'h6):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg201 = (1'h0);
  reg [(4'h8):(1'h0)] reg200 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg192 = (1'h0);
  reg [(3'h6):(1'h0)] reg191 = (1'h0);
  reg [(4'hf):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg189 = (1'h0);
  assign y = {wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire188,
                 wire187,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 (1'h0)};
  assign wire187 = wire186;
  assign wire188 = $signed({(&wire187[(2'h2):(1'h1)]), wire184});
  always
    @(posedge clk) begin
      reg189 <= wire188;
      reg190 <= {$signed($unsigned($unsigned(wire182[(5'h11):(1'h1)]))),
          wire187};
      reg191 <= (wire182[(4'h8):(3'h4)] ?
          $signed(wire185[(4'hc):(2'h2)]) : wire188[(3'h7):(3'h5)]);
      if (reg189[(4'hf):(3'h7)])
        begin
          reg192 <= (~^$unsigned((-reg191[(3'h4):(2'h2)])));
        end
      else
        begin
          reg192 <= (($signed(($unsigned(wire185) <= reg191[(3'h6):(2'h3)])) ?
                  ((-{wire184}) == $signed($unsigned(wire186))) : $signed(wire183[(1'h0):(1'h0)])) ?
              (((~|wire185) ? wire183 : $signed(((7'h41) - wire183))) ?
                  {($unsigned(reg190) & (^~wire187)),
                      reg192} : reg190) : (^(&wire187[(1'h1):(1'h0)])));
        end
    end
  assign wire193 = reg191;
  assign wire194 = $unsigned($unsigned(wire193));
  assign wire195 = ($unsigned(wire182) ?
                       ($unsigned(wire183[(1'h0):(1'h0)]) ?
                           reg192[(4'ha):(4'h8)] : (((reg192 ?
                                       (8'hb6) : reg190) ?
                                   $unsigned(reg189) : $unsigned(wire184)) ?
                               {(8'hb5),
                                   $unsigned(reg192)} : $unsigned((wire194 ?
                                   wire193 : reg191)))) : $signed((wire184 && (((8'ha6) < wire182) ?
                           $signed(wire187) : (wire183 ? reg191 : wire194)))));
  assign wire196 = ((~|wire187[(3'h5):(2'h2)]) ?
                       $unsigned((-{(+wire195)})) : reg189);
  assign wire197 = wire193[(3'h5):(3'h5)];
  assign wire198 = wire184;
  always
    @(posedge clk) begin
      reg199 <= (((8'ha2) == ((-(wire198 ~^ wire184)) <= ($signed((8'hb6)) ?
          (wire195 ? reg191 : wire182) : ((7'h41) ?
              wire197 : wire197)))) & reg190);
      if ((wire182[(4'h8):(2'h2)] != reg189))
        begin
          reg200 <= wire198;
          reg201 <= wire198;
          reg202 <= $unsigned((8'hae));
        end
      else
        begin
          reg200 <= (wire183[(1'h1):(1'h0)] && (~&$signed((7'h40))));
          reg201 <= wire183;
          reg202 <= (~&((8'hab) ?
              {((reg201 >>> reg200) ?
                      (|(8'hbe)) : (wire196 <= wire182))} : wire187[(3'h5):(3'h5)]));
          reg203 <= $signed(reg192[(4'hf):(2'h2)]);
        end
      if ($unsigned((($signed($signed((8'hae))) ?
              ((|reg191) * $unsigned(wire188)) : (reg201 != wire193)) ?
          reg189 : wire182[(5'h11):(4'h8)])))
        begin
          reg204 <= (wire182 >>> wire186);
        end
      else
        begin
          reg204 <= (((+(^$signed(wire183))) ?
              $signed((|reg199[(1'h1):(1'h1)])) : reg202) <= {{$unsigned((wire195 >= reg203)),
                  reg204}});
        end
    end
  always
    @(posedge clk) begin
      if (((~^$signed($signed($unsigned(reg201)))) - ($unsigned($unsigned((reg202 ?
              wire186 : (7'h44)))) ?
          {wire193} : wire184)))
        begin
          reg205 <= wire187[(1'h1):(1'h0)];
        end
      else
        begin
          reg205 <= (wire194[(2'h2):(2'h2)] <<< (~|{reg201[(2'h2):(1'h1)]}));
        end
    end
  assign wire206 = reg199[(2'h2):(2'h2)];
  assign wire207 = $unsigned($unsigned(((~|$unsigned(wire194)) - $signed(reg192))));
  assign wire208 = (((wire182 & wire198[(3'h6):(2'h3)]) ?
                           wire193[(4'hb):(3'h5)] : $unsigned($signed(wire198[(4'h8):(3'h6)]))) ?
                       (~|$unsigned(wire187[(2'h3):(2'h2)])) : (&$signed($unsigned($signed(reg192)))));
  assign wire209 = ($unsigned({((^wire182) ? wire206 : {wire187, (8'had)}),
                       $unsigned({(7'h41), reg189})}) <= wire193);
endmodule

module module141  (y, clk, wire146, wire145, wire144, wire143, wire142);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire146;
  input wire signed [(4'h8):(1'h0)] wire145;
  input wire signed [(2'h2):(1'h0)] wire144;
  input wire signed [(5'h14):(1'h0)] wire143;
  input wire [(4'hb):(1'h0)] wire142;
  wire [(4'he):(1'h0)] wire178;
  wire [(2'h3):(1'h0)] wire177;
  wire signed [(4'he):(1'h0)] wire176;
  wire [(4'hf):(1'h0)] wire175;
  wire signed [(4'hd):(1'h0)] wire174;
  wire [(2'h2):(1'h0)] wire173;
  wire signed [(3'h5):(1'h0)] wire169;
  wire signed [(5'h15):(1'h0)] wire168;
  wire [(2'h2):(1'h0)] wire167;
  wire signed [(4'hd):(1'h0)] wire166;
  wire signed [(4'hf):(1'h0)] wire165;
  wire signed [(5'h12):(1'h0)] wire164;
  wire [(4'he):(1'h0)] wire160;
  wire [(2'h2):(1'h0)] wire159;
  wire signed [(4'hf):(1'h0)] wire158;
  reg [(2'h3):(1'h0)] reg172 = (1'h0);
  reg [(4'h9):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg170 = (1'h0);
  reg [(4'ha):(1'h0)] reg163 = (1'h0);
  reg [(4'ha):(1'h0)] reg162 = (1'h0);
  reg [(2'h2):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg157 = (1'h0);
  reg [(5'h10):(1'h0)] reg156 = (1'h0);
  reg [(2'h2):(1'h0)] reg155 = (1'h0);
  reg [(4'h9):(1'h0)] reg154 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg152 = (1'h0);
  reg [(5'h14):(1'h0)] reg151 = (1'h0);
  reg [(3'h6):(1'h0)] reg150 = (1'h0);
  reg [(4'hc):(1'h0)] reg149 = (1'h0);
  reg [(3'h5):(1'h0)] reg148 = (1'h0);
  reg [(5'h15):(1'h0)] reg147 = (1'h0);
  assign y = {wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire160,
                 wire159,
                 wire158,
                 reg172,
                 reg171,
                 reg170,
                 reg163,
                 reg162,
                 reg161,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg147 <= wire142[(2'h3):(1'h0)];
      reg148 <= (+reg147);
      reg149 <= (~|wire143);
      if ($unsigned(wire144))
        begin
          reg150 <= $unsigned($unsigned((~&wire143[(4'hf):(4'h8)])));
          reg151 <= ((7'h41) ?
              {(reg150 ?
                      reg150 : wire142)} : ($signed($unsigned($signed(wire144))) ?
                  $unsigned(wire145) : ({(wire145 ? reg149 : reg148),
                      $signed(reg150)} & reg147[(3'h4):(2'h3)])));
          reg152 <= reg150;
          if ((reg148 ?
              (^$signed((reg150 ?
                  (~^reg149) : $signed(wire145)))) : {reg147[(4'h8):(2'h2)],
                  $unsigned(((^~reg148) ? (-wire143) : (reg147 == reg147)))}))
            begin
              reg153 <= (~|reg149[(2'h3):(1'h0)]);
              reg154 <= reg153[(2'h2):(2'h2)];
              reg155 <= (!((-$unsigned(reg148[(3'h5):(2'h3)])) && {({wire144,
                          wire146} ?
                      $unsigned(reg154) : $signed(reg150))}));
            end
          else
            begin
              reg153 <= reg155[(2'h2):(1'h0)];
              reg154 <= (&reg152[(4'hd):(4'ha)]);
              reg155 <= $unsigned((reg149[(3'h7):(3'h4)] ?
                  $unsigned(($unsigned(wire144) ?
                      (reg148 << reg149) : $signed(reg148))) : {{(^wire143),
                          $signed((7'h42))}}));
            end
          reg156 <= (wire144[(1'h0):(1'h0)] <<< $signed($signed(($signed(reg152) ?
              wire146[(1'h1):(1'h0)] : $signed((8'hb8))))));
        end
      else
        begin
          reg150 <= (wire143 ?
              wire143 : ($signed($signed((reg150 ?
                  reg155 : wire144))) <<< $signed(((reg156 != reg149) < (reg154 ?
                  reg149 : reg153)))));
          reg151 <= reg154;
          if ($unsigned($unsigned($unsigned(wire143[(3'h6):(2'h2)]))))
            begin
              reg152 <= $unsigned(({reg154,
                  (reg151[(2'h3):(2'h2)] | (+wire146))} ^ (&reg153)));
              reg153 <= {(reg148 << reg150),
                  ({(!wire145)} ?
                      ($unsigned($unsigned((8'haa))) ?
                          $signed((wire145 ^ reg155)) : ((~reg151) ?
                              $unsigned((8'ha4)) : $unsigned(reg152))) : reg150)};
            end
          else
            begin
              reg152 <= {$unsigned((wire143[(4'he):(3'h6)] ?
                      wire145[(2'h2):(1'h0)] : (~|reg150)))};
              reg153 <= (~|(&reg150[(2'h2):(1'h1)]));
            end
          if ($signed(((+$signed(wire146)) ?
              (wire144 ?
                  $signed((reg154 - reg155)) : ((~&reg151) ?
                      $signed(reg153) : wire142)) : reg156)))
            begin
              reg154 <= $signed($unsigned(($signed((reg149 ?
                  reg150 : reg147)) & reg153)));
              reg155 <= ((reg152[(5'h10):(4'hd)] ?
                      $signed((+wire146)) : wire146[(2'h2):(1'h0)]) ?
                  (~^{((8'ha3) ? (reg147 * reg150) : (reg149 + reg147)),
                      (8'h9c)}) : (~^(+$signed({(8'hb2)}))));
              reg156 <= reg147[(5'h13):(4'h8)];
            end
          else
            begin
              reg154 <= $signed((!$signed($signed(reg150[(3'h6):(2'h3)]))));
              reg155 <= reg148[(1'h0):(1'h0)];
              reg156 <= ((wire146 ?
                  wire145 : (~$signed($signed(reg155)))) != (((!(reg150 ?
                      wire144 : reg149)) | ($signed(wire146) ~^ $signed(reg149))) ?
                  ($signed((reg156 ? wire145 : wire143)) ?
                      (wire145[(3'h6):(1'h1)] + (8'hb4)) : wire142[(1'h0):(1'h0)]) : reg149));
              reg157 <= (~|((((8'hb3) << reg154[(4'h8):(3'h7)]) >> ($signed(wire143) ?
                      reg155[(1'h1):(1'h0)] : (reg154 ? reg147 : reg147))) ?
                  $unsigned(((reg149 ? (8'hb1) : wire145) ?
                      $unsigned(reg152) : (!reg150))) : $signed((&$unsigned(wire142)))));
            end
        end
    end
  assign wire158 = (+(^~(!$signed($unsigned(reg157)))));
  assign wire159 = reg150;
  assign wire160 = (((8'hab) ^~ $unsigned(reg154)) - (reg148 ?
                       {{(^reg156)}} : (^~$unsigned((reg157 ?
                           reg153 : wire143)))));
  always
    @(posedge clk) begin
      reg161 <= (&(~{$signed($unsigned(reg148)), (8'hb8)}));
      reg162 <= (+reg155);
      reg163 <= (&reg152[(3'h7):(3'h6)]);
    end
  assign wire164 = $signed(($signed(reg156[(3'h7):(3'h7)]) ?
                       wire160[(3'h7):(2'h2)] : (^(!wire145))));
  assign wire165 = $unsigned(wire142);
  assign wire166 = $unsigned((reg154[(3'h7):(3'h5)] ?
                       $signed(wire165[(4'hb):(3'h6)]) : ((((8'h9f) ?
                           reg156 : (8'hb2)) == reg149) << $unsigned(reg148))));
  assign wire167 = reg153[(2'h2):(2'h2)];
  assign wire168 = {$signed({(|(8'ha8))})};
  assign wire169 = wire166;
  always
    @(posedge clk) begin
      reg170 <= (reg162[(3'h5):(2'h2)] ^~ $signed($signed(({reg154,
          reg148} ^~ (wire165 << reg155)))));
      reg171 <= ($signed($unsigned(($signed(reg147) ?
          wire142 : wire160))) * (((reg162[(2'h3):(1'h1)] && reg147[(4'h8):(3'h6)]) + $signed(((7'h44) ?
              reg157 : (8'h9f)))) ?
          {$unsigned((~wire159)), {wire158, (~|(8'hbe))}} : wire144));
      reg172 <= (&{(wire145 ?
              (reg153[(1'h0):(1'h0)] ?
                  wire159[(2'h2):(1'h0)] : wire169) : ((reg153 ?
                      reg150 : (8'ha1)) ?
                  $unsigned(wire164) : wire159[(1'h0):(1'h0)]))});
    end
  assign wire173 = $signed(reg151[(5'h14):(4'h8)]);
  assign wire174 = (~|(^~$signed($signed({wire159, wire169}))));
  assign wire175 = wire145[(3'h5):(1'h0)];
  assign wire176 = (wire146[(1'h1):(1'h1)] ~^ ({$signed(reg171),
                           $unsigned($unsigned(reg154))} ?
                       (wire173[(1'h0):(1'h0)] + ((reg154 << reg161) ?
                           (wire159 ?
                               wire175 : reg149) : (&(8'ha7)))) : wire167));
  assign wire177 = ($unsigned(((~|(^reg151)) ?
                       ((~|wire169) ?
                           $unsigned(wire168) : $unsigned(wire167)) : $signed(reg151[(4'ha):(3'h4)]))) && $unsigned(($signed(reg154[(3'h4):(1'h1)]) - reg171)));
  assign wire178 = $unsigned(reg152);
endmodule

module module95  (y, clk, wire99, wire98, wire97, wire96);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire99;
  input wire signed [(3'h4):(1'h0)] wire98;
  input wire signed [(4'h9):(1'h0)] wire97;
  input wire signed [(3'h5):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire121;
  wire [(4'hc):(1'h0)] wire120;
  wire signed [(3'h4):(1'h0)] wire119;
  wire signed [(3'h7):(1'h0)] wire118;
  wire signed [(4'h9):(1'h0)] wire117;
  wire signed [(5'h11):(1'h0)] wire116;
  wire [(4'hb):(1'h0)] wire115;
  wire [(5'h12):(1'h0)] wire114;
  wire [(5'h15):(1'h0)] wire113;
  reg signed [(4'hc):(1'h0)] reg135 = (1'h0);
  reg [(3'h7):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg132 = (1'h0);
  reg [(4'h8):(1'h0)] reg131 = (1'h0);
  reg [(5'h10):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg126 = (1'h0);
  reg [(4'hf):(1'h0)] reg125 = (1'h0);
  reg [(4'h8):(1'h0)] reg124 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg123 = (1'h0);
  reg [(4'hf):(1'h0)] reg122 = (1'h0);
  reg [(5'h13):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(2'h3):(1'h0)] reg110 = (1'h0);
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(3'h6):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(4'hc):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg100 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg100 <= (8'hb0);
      reg101 <= ($signed(($signed($signed((8'hb9))) ?
          $signed($unsigned((8'hbb))) : (-wire97))) >= $signed(((wire97[(4'h9):(2'h3)] ?
          (~|wire97) : (wire98 ^~ reg100)) == $unsigned((~^wire96)))));
      reg102 <= ((((reg100 ? wire96 : $unsigned(wire98)) ?
              ((wire96 ?
                  wire97 : wire99) * (wire99 ^ reg100)) : reg101) * (-(~&(wire99 == reg100)))) ?
          $unsigned(wire99[(1'h0):(1'h0)]) : $signed((|(|$unsigned(wire98)))));
      if ($unsigned(($signed($unsigned((wire98 <= wire96))) ?
          $signed(((|wire97) ?
              {reg102, (8'ha7)} : $signed(wire97))) : $signed(wire99))))
        begin
          if (wire99)
            begin
              reg103 <= $signed(((~&((reg101 + reg102) ?
                  $unsigned(reg100) : (reg101 ?
                      wire96 : reg100))) <<< $signed($signed(wire97))));
              reg104 <= ({((8'hb4) >= wire97[(3'h6):(3'h6)])} != reg102[(2'h3):(1'h1)]);
            end
          else
            begin
              reg103 <= {{($unsigned(reg102) > ((wire97 ? reg104 : reg103) ?
                          {reg101} : reg104[(4'ha):(4'h8)]))},
                  ((&(^~(reg103 && reg101))) ?
                      (+((reg102 ? reg103 : (8'h9e)) ?
                          wire98[(2'h2):(2'h2)] : $signed(wire96))) : reg104)};
              reg104 <= {(&{{reg101[(2'h2):(1'h0)], reg104}})};
              reg105 <= (^~(reg103[(3'h5):(2'h2)] <<< wire99));
            end
          reg106 <= reg103;
          reg107 <= $signed($unsigned(((reg105[(2'h3):(2'h2)] != (reg103 >> reg105)) | $unsigned($signed(reg104)))));
          if (reg103[(3'h5):(3'h5)])
            begin
              reg108 <= reg102;
            end
          else
            begin
              reg108 <= (reg102[(1'h0):(1'h0)] ?
                  {reg105,
                      ($signed($unsigned((8'ha1))) == ((!wire97) ?
                          (^~(8'ha7)) : {reg103,
                              wire99}))} : $unsigned($signed(reg105[(3'h7):(3'h6)])));
            end
        end
      else
        begin
          reg103 <= (|reg101);
          reg104 <= {reg104};
          if ($signed({reg105[(1'h1):(1'h0)], (8'hae)}))
            begin
              reg105 <= (wire99 ~^ wire96[(3'h5):(3'h5)]);
              reg106 <= ({{$signed((reg106 ^~ wire97)),
                          ($unsigned(reg105) ?
                              reg103[(3'h5):(3'h5)] : $unsigned(wire99))}} ?
                  ((^~$signed((~|reg104))) <= $signed(((wire97 >= (8'ha7)) ^~ (wire98 + wire98)))) : (^~($unsigned(reg107) ?
                      reg101[(3'h5):(1'h1)] : reg104[(4'hd):(3'h5)])));
              reg107 <= ($signed($signed(({wire96, reg100} ?
                  (reg104 ?
                      reg104 : reg103) : (reg107 & (8'ha1))))) * $unsigned($signed((~$unsigned(reg104)))));
              reg108 <= ($signed($signed(reg101[(3'h5):(2'h2)])) ?
                  ((~&reg104[(2'h2):(1'h0)]) ?
                      wire97[(3'h7):(3'h6)] : reg101[(4'ha):(3'h7)]) : (wire97[(2'h2):(2'h2)] ?
                      (~|(~^reg103)) : (-{$unsigned(reg107),
                          $signed(reg105)})));
              reg109 <= (($signed(((reg101 ^ reg102) ?
                  (reg108 || wire99) : (reg108 << reg102))) * reg106) || ($signed($unsigned((8'ha8))) ?
                  (reg101[(4'hb):(1'h1)] ?
                      ($signed((8'haf)) ?
                          reg108[(1'h0):(1'h0)] : reg105) : reg103[(3'h6):(3'h4)]) : (wire96[(1'h0):(1'h0)] && {(|reg100)})));
            end
          else
            begin
              reg105 <= (&reg106);
            end
        end
      reg110 <= $unsigned(reg103);
    end
  always
    @(posedge clk) begin
      reg111 <= (+($unsigned((-(~reg102))) > ((-(&reg107)) != $signed($unsigned(reg103)))));
      if (reg101)
        begin
          reg112 <= reg109[(5'h14):(5'h13)];
        end
      else
        begin
          reg112 <= $signed(((reg100 ~^ (&(wire97 <<< reg102))) ^~ (($unsigned(reg110) << $unsigned(reg104)) ?
              $signed({(8'hb9)}) : (reg110[(2'h3):(2'h2)] ?
                  $signed(reg105) : ((8'hbb) | reg107)))));
        end
    end
  assign wire113 = {($signed(((wire96 ? (8'h9c) : wire96) ?
                           wire98 : $unsigned(reg107))) & $signed(((reg108 <= wire98) ?
                           wire99 : $signed(reg108))))};
  assign wire114 = ($signed(reg102[(1'h0):(1'h0)]) | wire99);
  assign wire115 = (|$unsigned((7'h42)));
  assign wire116 = reg111;
  assign wire117 = reg111;
  assign wire118 = wire97[(3'h5):(3'h5)];
  assign wire119 = reg105[(2'h2):(1'h1)];
  assign wire120 = (~&reg100[(1'h0):(1'h0)]);
  assign wire121 = wire118[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (wire120)
        begin
          if (reg107[(5'h10):(4'h8)])
            begin
              reg122 <= ($signed((((reg101 ?
                      reg107 : reg110) >> $unsigned(wire99)) ?
                  (&(wire117 << wire97)) : (wire116[(4'h8):(4'h8)] ?
                      $unsigned(reg103) : (reg104 ^ wire120)))) == (wire115 ?
                  $signed((|wire97[(3'h4):(1'h0)])) : wire116[(2'h2):(1'h1)]));
              reg123 <= reg108[(3'h6):(3'h4)];
              reg124 <= reg111[(1'h1):(1'h1)];
            end
          else
            begin
              reg122 <= reg100;
              reg123 <= $signed($unsigned((~^$signed(wire97))));
            end
        end
      else
        begin
          if (wire98[(1'h0):(1'h0)])
            begin
              reg122 <= wire113;
            end
          else
            begin
              reg122 <= reg107[(3'h5):(2'h2)];
              reg123 <= $signed((wire120[(2'h3):(1'h0)] ?
                  reg103 : (((reg105 < wire97) ?
                      wire97 : (reg111 ?
                          reg105 : (8'hb8))) <= (reg100[(2'h3):(2'h3)] || (wire116 ?
                      wire113 : reg111)))));
              reg124 <= {(($unsigned($signed(wire97)) * $signed((reg124 ?
                      reg101 : (7'h42)))) ~^ (^~($signed(reg122) ?
                      (~|reg103) : (!(8'hb7))))),
                  $signed((+((reg100 ? wire119 : wire98) ?
                      $signed(wire120) : wire96)))};
            end
          if ((&wire113))
            begin
              reg125 <= reg100[(3'h5):(2'h3)];
              reg126 <= $unsigned(({$signed((reg106 >>> reg106))} ?
                  reg124 : $signed((!(&wire116)))));
            end
          else
            begin
              reg125 <= (({{(8'ha2),
                      ((8'ha9) && reg100)}} == $unsigned($unsigned((~&(8'h9f))))) < $signed((-reg106)));
              reg126 <= (reg111 ?
                  reg105[(4'ha):(3'h7)] : wire97[(3'h4):(2'h2)]);
              reg127 <= reg101[(1'h1):(1'h0)];
            end
        end
      reg128 <= ($signed($unsigned(reg122[(3'h6):(2'h3)])) >> (~reg102));
      reg129 <= (|(($signed($unsigned(wire120)) ?
          {reg126[(3'h6):(1'h1)], $unsigned(reg106)} : $signed((wire99 ?
              wire97 : wire118))) >>> wire113[(5'h14):(1'h1)]));
      reg130 <= (^$signed($unsigned(wire117)));
      if (((~&(&(((8'ha4) ?
          reg108 : wire99) <<< reg129))) > $unsigned((&$signed({wire120})))))
        begin
          if ({wire120, $signed($unsigned(reg126))})
            begin
              reg131 <= reg123[(3'h5):(2'h3)];
              reg132 <= $signed((^~($unsigned(reg112[(3'h7):(3'h4)]) != {wire119})));
            end
          else
            begin
              reg131 <= ((($signed(wire116) ?
                      (wire119[(1'h1):(1'h0)] ?
                          (!(8'hbc)) : (|wire118)) : $signed(reg100[(5'h11):(3'h4)])) << (~&wire114[(3'h5):(1'h0)])) ?
                  wire116[(4'hb):(2'h3)] : {$unsigned((~|$unsigned((8'h9f))))});
              reg132 <= reg109;
            end
        end
      else
        begin
          reg131 <= $unsigned(reg131);
          reg132 <= (~|($signed($signed(reg101)) ?
              (((reg131 == reg123) ?
                  $unsigned((8'ha8)) : wire98) ~^ {((8'hb2) == reg105)}) : ($signed({reg105,
                  wire114}) - reg111[(1'h0):(1'h0)])));
          reg133 <= wire99;
          reg134 <= reg133;
          reg135 <= (+$signed($unsigned($signed(((8'h9d) ? reg112 : reg111)))));
        end
    end
endmodule

module module80  (y, clk, wire84, wire83, wire82, wire81);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire84;
  input wire [(3'h5):(1'h0)] wire83;
  input wire [(4'hc):(1'h0)] wire82;
  input wire signed [(5'h15):(1'h0)] wire81;
  wire signed [(3'h6):(1'h0)] wire92;
  wire [(4'hc):(1'h0)] wire91;
  wire signed [(5'h11):(1'h0)] wire90;
  wire [(4'hc):(1'h0)] wire89;
  wire [(4'hb):(1'h0)] wire88;
  wire signed [(4'hb):(1'h0)] wire87;
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg85 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 reg86,
                 reg85,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg85 <= $signed((&(~^$unsigned(((8'hbb) ? wire82 : wire81)))));
      reg86 <= $unsigned($unsigned(wire84[(2'h3):(1'h1)]));
    end
  assign wire87 = $signed((wire83[(2'h3):(2'h3)] + (reg85 ^ (^((8'ha0) << wire84)))));
  assign wire88 = {{((|wire82) ? (~^$signed(reg85)) : wire81[(1'h1):(1'h0)])},
                      reg86[(5'h14):(4'he)]};
  assign wire89 = (8'hb8);
  assign wire90 = $unsigned(wire82);
  assign wire91 = $signed(($unsigned((~&((8'had) * wire88))) ?
                      reg86 : (reg86 != ($signed(wire81) ?
                          reg86 : wire87[(1'h0):(1'h0)]))));
  assign wire92 = wire90;
endmodule

module module29
#(parameter param75 = (+({(^{(8'hbb)})} <<< (!(^((8'hb9) ^~ (8'ha3)))))))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h1aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire34;
  input wire [(5'h15):(1'h0)] wire33;
  input wire signed [(4'hb):(1'h0)] wire32;
  input wire signed [(4'hc):(1'h0)] wire31;
  input wire [(5'h13):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire signed [(3'h6):(1'h0)] wire61;
  wire signed [(4'hc):(1'h0)] wire60;
  wire [(4'he):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire54;
  wire [(3'h7):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(5'h10):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire35;
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
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
                 (1'h0)};
  assign wire35 = (+(~wire33));
  assign wire36 = {(-wire33[(5'h11):(4'h8)]), wire31};
  assign wire37 = ($unsigned($unsigned((-(wire33 << wire33)))) << wire34);
  assign wire38 = (~|(~|(^~(~|(wire30 > wire35)))));
  assign wire39 = {(&($signed(wire38) ?
                          $signed((wire38 ? (8'hbe) : wire34)) : wire30)),
                      ({(~$unsigned(wire35))} && wire38[(1'h1):(1'h0)])};
  assign wire40 = {$unsigned((((wire34 ? wire35 : wire35) ?
                              $unsigned(wire38) : (wire38 ? wire35 : wire35)) ?
                          (((8'hb7) <= wire36) ?
                              wire38 : $signed(wire38)) : (8'hb4)))};
  always
    @(posedge clk) begin
      reg41 <= {(~(wire36 ~^ $signed(wire40)))};
      reg42 <= $unsigned($signed(((+(reg41 ?
          wire35 : reg41)) ^~ $unsigned((|reg41)))));
    end
  always
    @(posedge clk) begin
      reg43 <= ($unsigned(((wire38 ?
          (+wire39) : wire34[(3'h6):(3'h4)]) >>> ({(7'h40), reg42} ?
          wire34[(3'h5):(1'h0)] : {wire35, wire36}))) >>> (-(^~(8'hae))));
      reg44 <= {(!reg42[(2'h2):(1'h0)]),
          ((+((reg43 ^ wire35) && (wire32 ? reg43 : wire38))) ?
              wire34[(2'h3):(1'h1)] : (((~|reg41) != $signed(wire38)) * (8'ha2)))};
      if (reg43[(1'h1):(1'h1)])
        begin
          if ((&{$signed($unsigned({wire32, wire34}))}))
            begin
              reg45 <= (8'hb2);
            end
          else
            begin
              reg45 <= (8'ha7);
            end
          reg46 <= $unsigned($unsigned(({wire38} <<< wire31[(2'h3):(2'h3)])));
          reg47 <= (wire38[(2'h2):(1'h1)] || $signed((&(&(wire39 ?
              (8'hbc) : reg42)))));
          reg48 <= (-(~wire35));
          reg49 <= (^~(8'hae));
        end
      else
        begin
          if (wire35)
            begin
              reg45 <= wire36;
              reg46 <= (!({(wire33 ? wire37[(4'h9):(2'h3)] : $unsigned(wire33)),
                  wire30[(3'h5):(3'h5)]} != {wire30[(1'h1):(1'h1)], reg48}));
              reg47 <= wire40[(3'h5):(2'h3)];
              reg48 <= $signed((~(^(+((8'ha0) ? (8'h9c) : (8'ha8))))));
            end
          else
            begin
              reg45 <= reg43;
              reg46 <= $signed(($unsigned($unsigned(reg44[(2'h3):(2'h2)])) ?
                  (wire34 ?
                      ((reg45 ? wire32 : (8'h9c)) ?
                          (~|reg45) : (~&wire31)) : $unsigned({wire37,
                          reg41})) : reg46[(3'h7):(3'h7)]));
              reg47 <= $unsigned($unsigned((reg48 ? (8'ha3) : reg43)));
              reg48 <= reg49;
            end
          reg49 <= wire33;
          reg50 <= wire35[(4'h8):(4'h8)];
          reg51 <= (8'hb1);
          reg52 <= $unsigned(reg47);
        end
      reg53 <= (~^$unsigned((8'hb2)));
    end
  assign wire54 = wire37[(4'hf):(3'h5)];
  assign wire55 = ((^((8'h9c) <= wire33[(4'ha):(2'h3)])) | wire31[(3'h7):(1'h1)]);
  assign wire56 = ((!(({wire32} ~^ reg47[(2'h3):(1'h1)]) ?
                      $signed((wire54 >= (8'hb9))) : $signed((wire31 ^ reg48)))) << {((reg46[(3'h4):(2'h2)] ?
                          (wire38 <<< reg46) : $signed(reg53)) * wire39[(1'h0):(1'h0)]),
                      $unsigned($unsigned(wire32[(2'h3):(2'h3)]))});
  assign wire57 = wire31;
  assign wire58 = ((wire30[(5'h12):(4'hd)] ?
                      (wire35 ?
                          {wire54[(2'h3):(1'h0)]} : ((wire37 && wire36) ~^ (wire33 || reg47))) : (-wire32)) | (((+((8'h9f) ?
                      wire39 : reg42)) && ($unsigned(wire38) ?
                      $unsigned(wire37) : (reg46 ~^ (8'hab)))) >> {((reg50 ?
                          wire56 : (8'hbd)) ^ $signed(wire33)),
                      $unsigned(reg44[(1'h0):(1'h0)])}));
  assign wire59 = wire30;
  assign wire60 = $unsigned(({$unsigned((reg51 << reg44))} ?
                      $signed(((reg51 ? wire31 : (8'ha4)) ?
                          wire57 : $unsigned(reg43))) : (reg49[(1'h1):(1'h1)] >> ($unsigned(reg41) ?
                          (~|wire30) : $unsigned(wire56)))));
  assign wire61 = $unsigned(wire35[(3'h4):(2'h2)]);
  assign wire62 = ($unsigned($unsigned((wire58[(3'h7):(1'h1)] ?
                      $signed(reg53) : (~^wire56)))) >>> (wire40 ?
                      {(^(reg51 ^ (8'hba)))} : ((~{wire31}) ?
                          ((wire57 << reg48) ?
                              (7'h40) : wire35[(4'hc):(3'h7)]) : ((wire33 ?
                                  wire58 : reg53) ?
                              (reg43 || wire54) : wire38))));
  assign wire63 = (reg48 ?
                      (~&(reg41[(4'ha):(3'h5)] + (reg52[(4'h8):(4'h8)] ?
                          {wire54,
                              reg51} : $unsigned(reg47)))) : {$signed(wire56),
                          {reg44[(1'h0):(1'h0)]}});
  always
    @(posedge clk) begin
      reg64 <= (reg47 ?
          (wire61[(1'h1):(1'h1)] ?
              (~$unsigned(((8'ha0) ?
                  wire60 : wire36))) : (|reg49[(2'h2):(2'h2)])) : $unsigned({(&(reg43 >> wire31)),
              ($unsigned(reg43) * wire30[(5'h12):(4'hc)])}));
      if ($unsigned($signed(wire30[(4'hd):(4'h8)])))
        begin
          if ($signed((-(((wire30 ? reg45 : reg51) ?
              reg44[(1'h1):(1'h0)] : $signed(reg45)) && $signed(wire33)))))
            begin
              reg65 <= $signed((reg50 >> reg42[(1'h1):(1'h1)]));
              reg66 <= $signed(wire58);
              reg67 <= ((^~$signed($unsigned((reg47 <<< (7'h40))))) != ($signed(($signed(reg64) ?
                  (reg42 >= reg44) : $signed(reg49))) == $signed($signed({reg51}))));
            end
          else
            begin
              reg65 <= ($unsigned((!wire59[(4'h8):(4'h8)])) ?
                  $signed(reg42[(2'h2):(1'h1)]) : ((wire33 + wire60) ?
                      ((^wire61) + ((reg47 >>> reg64) ?
                          reg53 : $signed(reg51))) : $unsigned((^(reg47 ?
                          reg66 : (8'h9d))))));
              reg66 <= (reg67 & ((~|reg47[(2'h2):(2'h2)]) ?
                  (wire34 * ($unsigned(reg49) ?
                      (reg44 ?
                          wire35 : (8'hb1)) : wire40)) : (^$unsigned((8'h9f)))));
              reg67 <= $signed(wire34);
            end
          reg68 <= wire62[(1'h0):(1'h0)];
          reg69 <= $signed((($signed((8'hb9)) && $unsigned(wire32)) ?
              (wire55 << reg46[(4'h9):(1'h1)]) : wire59[(4'he):(2'h3)]));
          reg70 <= (~(~^(($signed(wire63) ?
                  $unsigned((8'h9f)) : $signed((8'hb8))) ?
              $signed($signed(reg44)) : reg53)));
        end
      else
        begin
          reg65 <= (|wire35[(3'h7):(2'h2)]);
          reg66 <= wire39[(4'ha):(2'h3)];
          if ($signed(reg42))
            begin
              reg67 <= ((^($signed({reg51}) & ((-reg52) ?
                      wire56[(1'h0):(1'h0)] : wire56[(1'h0):(1'h0)]))) ?
                  $signed($signed($signed((reg64 ? reg50 : wire55)))) : wire37);
            end
          else
            begin
              reg67 <= reg50;
              reg68 <= {(wire55 ?
                      (!(&(reg42 ?
                          (7'h42) : (8'hb3)))) : $signed($unsigned(wire55)))};
              reg69 <= (!$signed($signed(((^~reg64) ^~ (^wire32)))));
              reg70 <= (^~wire56[(1'h0):(1'h0)]);
              reg71 <= $unsigned($unsigned((reg45[(2'h3):(2'h2)] ?
                  (8'ha9) : (-wire54))));
            end
          reg72 <= $signed(reg46[(3'h5):(1'h1)]);
          reg73 <= (wire61 ?
              (^~$unsigned($signed(reg48))) : reg72[(3'h4):(1'h1)]);
        end
    end
  always
    @(posedge clk) begin
      reg74 <= wire31[(3'h4):(1'h1)];
    end
endmodule
