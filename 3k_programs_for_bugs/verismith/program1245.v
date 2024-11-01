module top
#(parameter param228 = {(8'haf), (((-{(8'ha3)}) ? (((8'ha5) <= (8'h9e)) ? (+(8'hb8)) : ((8'hb6) ? (8'ha8) : (8'ha5))) : {((8'hb0) ? (8'h9f) : (8'hb1)), {(8'had)}}) ? (((^(8'ha8)) || (&(8'hb3))) ^ (((8'h9c) | (7'h42)) & {(7'h40), (8'hb5)})) : {((~|(7'h44)) ? (!(8'hb7)) : ((8'ha9) ? (8'hbc) : (8'ha9)))})})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire54;
  wire [(5'h11):(1'h0)] wire223;
  reg signed [(5'h12):(1'h0)] reg227 = (1'h0);
  reg [(4'hc):(1'h0)] reg226 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg225 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg5 = (1'h0);
  assign y = {wire70,
                 wire54,
                 wire223,
                 reg227,
                 reg226,
                 reg225,
                 reg58,
                 reg57,
                 reg56,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed(wire4);
      reg6 <= ((~|{$signed(wire4[(4'ha):(2'h2)])}) >> wire3[(1'h0):(1'h0)]);
      reg7 <= $unsigned({$signed((wire2 ? wire4[(4'hf):(1'h1)] : (8'haa)))});
      if ($signed($unsigned({$signed((wire2 << wire1)),
          ((wire1 <= wire2) + (^wire1))})))
        begin
          reg8 <= reg7;
        end
      else
        begin
          reg8 <= {(reg8[(3'h7):(3'h5)] - wire0)};
        end
      reg9 <= reg6[(3'h5):(3'h4)];
    end
  module10 #() modinst55 (wire54, clk, reg5, reg7, wire4, reg8, reg9);
  always
    @(posedge clk) begin
      reg56 <= (~&{$unsigned($signed($signed(reg8))), wire4});
      reg57 <= reg5;
      reg58 <= $signed(((!((^reg9) ?
          (wire4 ? reg56 : wire4) : wire4)) >>> $signed($unsigned(wire2))));
    end
  module59 #() modinst71 (wire70, clk, reg6, wire54, wire0, wire3, reg8);
  module72 #() modinst224 (wire223, clk, wire0, wire3, reg56, reg8, wire70);
  always
    @(posedge clk) begin
      reg225 <= (((8'ha6) ?
              reg6 : (reg5[(1'h1):(1'h0)] ?
                  {wire3[(3'h6):(3'h4)],
                      reg58} : (reg6[(3'h4):(1'h0)] == (wire70 ^~ wire3)))) ?
          reg5 : (wire0 & {{wire1, $unsigned(wire3)}, wire223[(2'h2):(1'h1)]}));
      reg226 <= (~|$unsigned((~wire70)));
      if ($signed($unsigned(($signed($signed(wire2)) <= $unsigned((~|reg8))))))
        begin
          reg227 <= reg5;
        end
      else
        begin
          reg227 <= wire4[(4'hf):(4'ha)];
        end
    end
endmodule

module module72
#(parameter param222 = (^{((((8'hbf) ? (8'ha4) : (8'h9d)) == (~^(8'h9e))) ^~ (7'h41))}))
(y, clk, wire73, wire74, wire75, wire76, wire77);
  output wire [(32'h28c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire73;
  input wire signed [(4'hf):(1'h0)] wire74;
  input wire signed [(4'hd):(1'h0)] wire75;
  input wire signed [(4'he):(1'h0)] wire76;
  input wire [(3'h6):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire221;
  wire signed [(4'h8):(1'h0)] wire146;
  wire signed [(5'h12):(1'h0)] wire127;
  wire [(5'h14):(1'h0)] wire114;
  wire [(5'h12):(1'h0)] wire113;
  wire [(4'h9):(1'h0)] wire112;
  wire signed [(3'h7):(1'h0)] wire111;
  wire [(4'hf):(1'h0)] wire110;
  wire [(3'h4):(1'h0)] wire78;
  wire signed [(4'he):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire81;
  wire [(5'h13):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire193;
  wire signed [(4'hf):(1'h0)] wire195;
  wire signed [(3'h7):(1'h0)] wire196;
  wire signed [(4'ha):(1'h0)] wire197;
  wire signed [(5'h13):(1'h0)] wire219;
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg [(4'he):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg98 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg102 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg115 = (1'h0);
  reg [(5'h13):(1'h0)] reg116 = (1'h0);
  reg [(4'hb):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg [(5'h11):(1'h0)] reg122 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg [(3'h7):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg129 = (1'h0);
  reg [(2'h3):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg131 = (1'h0);
  reg [(5'h11):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg133 = (1'h0);
  reg signed [(4'he):(1'h0)] reg134 = (1'h0);
  assign y = {wire221,
                 wire146,
                 wire127,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire78,
                 wire79,
                 wire80,
                 wire81,
                 wire94,
                 wire193,
                 wire195,
                 wire196,
                 wire197,
                 wire219,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg128,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 reg133,
                 reg134,
                 (1'h0)};
  assign wire78 = $signed(wire74);
  assign wire79 = wire78;
  assign wire80 = (((~(8'ha6)) >>> wire78) ?
                      {wire77,
                          $unsigned({$signed(wire77)})} : {wire79[(1'h1):(1'h0)],
                          wire78[(2'h2):(1'h0)]});
  assign wire81 = (~&((~$signed((8'hbf))) ?
                      wire78[(2'h2):(1'h0)] : {{$unsigned(wire77)},
                          $unsigned((^~wire73))}));
  module82 #() modinst95 (.clk(clk), .wire85(wire78), .wire87(wire81), .wire84(wire80), .y(wire94), .wire83(wire73), .wire86(wire74));
  always
    @(posedge clk) begin
      if ($signed(($unsigned($unsigned(wire81)) ?
          $signed({wire75,
              (wire94 ? wire79 : wire80)}) : $unsigned(($unsigned(wire77) ?
              (wire80 > wire76) : wire78[(1'h1):(1'h1)])))))
        begin
          reg96 <= $unsigned({wire77[(3'h4):(2'h3)],
              (|($signed((8'ha1)) != $unsigned(wire81)))});
          if ($unsigned($unsigned($unsigned(wire74[(4'hf):(1'h1)]))))
            begin
              reg97 <= ((~(^~(|(wire76 ? wire77 : wire78)))) ?
                  (^~$unsigned($unsigned(wire79))) : (wire74 && wire73[(3'h4):(2'h3)]));
              reg98 <= (~&((^((wire94 - wire73) << $signed(wire94))) || {(&(~^reg96)),
                  {{reg96}}}));
            end
          else
            begin
              reg97 <= reg98[(2'h3):(2'h3)];
              reg98 <= $signed((+wire76[(1'h0):(1'h0)]));
            end
          reg99 <= $unsigned((^{$unsigned((&wire76)),
              ({(8'ha6), reg96} ? $unsigned(wire78) : $unsigned(wire74))}));
          if ({(8'hbf), $unsigned(reg99[(4'hd):(2'h2)])})
            begin
              reg100 <= ({($unsigned($unsigned(wire79)) ?
                      (reg96[(3'h6):(2'h3)] > ((8'hb9) < reg98)) : wire73[(4'h9):(2'h2)])} - (8'ha8));
              reg101 <= wire81[(4'hf):(4'hb)];
              reg102 <= $unsigned(wire73[(3'h4):(1'h1)]);
              reg103 <= $unsigned({$unsigned((!(+wire75))),
                  ($unsigned($unsigned((8'ha9))) && ((~^reg99) ?
                      $unsigned(wire75) : reg101))});
            end
          else
            begin
              reg100 <= ((~^$signed(reg100)) <= (^reg102));
            end
        end
      else
        begin
          reg96 <= reg102[(2'h2):(1'h0)];
          reg97 <= $signed((+(reg101 ?
              $unsigned(wire77) : $signed(((8'ha1) ? wire73 : reg96)))));
          if ((~&{wire73[(4'h9):(3'h4)], (wire76 + (~|(wire77 - reg101)))}))
            begin
              reg98 <= ($signed((+reg100)) ?
                  reg99 : (~&{((wire77 << reg101) != wire78[(1'h0):(1'h0)])}));
            end
          else
            begin
              reg98 <= (((wire74 ? reg96[(1'h1):(1'h0)] : (^~$signed(reg101))) ?
                      (8'ha4) : ((reg102 ? $unsigned(reg100) : wire74) ?
                          $signed((wire73 ~^ reg100)) : ($unsigned(wire76) ?
                              (reg96 ? wire75 : (8'haf)) : $signed(wire76)))) ?
                  reg98[(2'h3):(2'h3)] : reg100[(2'h3):(1'h0)]);
              reg99 <= {wire79[(4'ha):(4'h9)], wire94};
              reg100 <= (8'h9c);
              reg101 <= (|$signed((&($unsigned(wire78) <<< $unsigned(reg96)))));
              reg102 <= (reg101[(2'h3):(2'h2)] <<< (-$signed(($unsigned(wire73) - (8'ha3)))));
            end
        end
      reg104 <= {(|reg101[(2'h3):(1'h1)])};
      if ((($signed((wire79 ? (~wire73) : (^~reg100))) ?
              (wire76 ?
                  $signed({reg98}) : (!((8'hae) ?
                      wire79 : reg97))) : ((reg104[(3'h7):(1'h0)] >= (~(8'haa))) ?
                  (~|wire76) : {wire75})) ?
          wire78 : (^~wire77)))
        begin
          reg105 <= (((!reg98) ?
                  ($signed(reg101[(3'h5):(3'h4)]) ^~ reg100) : (^(~^wire81[(4'hf):(4'ha)]))) ?
              (!($signed(reg101) ?
                  wire74 : ((+wire81) ?
                      (reg97 ?
                          (8'hab) : wire94) : $signed(reg97)))) : (({reg100[(2'h3):(2'h2)]} ?
                      {reg104[(4'hd):(4'ha)], (reg96 - (8'hb9))} : wire73) ?
                  wire94 : reg98));
          if ((-(8'ha8)))
            begin
              reg106 <= wire81[(4'he):(4'hd)];
            end
          else
            begin
              reg106 <= (wire79 ?
                  (reg99[(2'h3):(2'h3)] ?
                      {(~&$unsigned((8'ha4)))} : $signed($signed($signed(reg99)))) : {$signed((~|$unsigned(reg100)))});
              reg107 <= wire75[(4'hc):(2'h3)];
            end
          reg108 <= (!(+(~{$unsigned(wire94), $unsigned(wire74)})));
        end
      else
        begin
          reg105 <= $signed((~&(!(-(reg98 ? reg105 : reg101)))));
          reg106 <= reg104;
          reg107 <= $unsigned((reg96[(3'h5):(2'h3)] >> $unsigned(reg107)));
        end
      reg109 <= ({$unsigned(reg96[(1'h1):(1'h1)])} ?
          wire74 : (wire81 ?
              $unsigned((reg101 ?
                  (wire76 ?
                      wire80 : reg103) : reg102[(1'h1):(1'h0)])) : (^wire77[(2'h3):(1'h0)])));
    end
  assign wire110 = $signed($signed($signed((reg100[(2'h3):(2'h2)] || $signed(wire81)))));
  assign wire111 = ($unsigned((7'h44)) > $signed(wire80[(1'h0):(1'h0)]));
  assign wire112 = reg105;
  assign wire113 = wire112[(3'h4):(3'h4)];
  assign wire114 = ($unsigned({$unsigned({reg105, wire113})}) ?
                       $unsigned(wire79[(4'h9):(2'h2)]) : $signed((8'ha1)));
  always
    @(posedge clk) begin
      if ((^((^~wire81) >> $unsigned({(wire74 ? reg103 : wire78),
          $signed((8'h9f))}))))
        begin
          reg115 <= $unsigned(wire94);
          if (reg97[(1'h0):(1'h0)])
            begin
              reg116 <= ((8'ha9) ?
                  {$signed((~|wire111[(1'h1):(1'h1)]))} : $unsigned(($unsigned((~^reg96)) ?
                      $signed($signed(wire81)) : ((reg107 ? wire80 : wire114) ?
                          $unsigned(wire74) : {wire80, (8'h9e)}))));
              reg117 <= {reg98,
                  $unsigned({(((8'hbe) <= (8'h9f)) ?
                          $unsigned(reg105) : (reg101 << reg108))})};
              reg118 <= $signed({wire81[(1'h0):(1'h0)],
                  $unsigned(($unsigned(wire94) >= $unsigned(reg101)))});
            end
          else
            begin
              reg116 <= {((reg100[(2'h2):(1'h1)] ?
                          {(wire77 ^ wire114)} : (~|$signed(wire114))) ?
                      {wire79[(3'h6):(3'h6)]} : $signed({wire73[(4'h9):(3'h4)],
                          {reg118, reg104}}))};
            end
          reg119 <= (&reg109);
        end
      else
        begin
          reg115 <= (-wire76[(3'h6):(1'h0)]);
        end
      if (wire81)
        begin
          reg120 <= $signed(reg117);
          reg121 <= (reg104[(3'h6):(3'h5)] == (($signed(reg117[(3'h5):(2'h2)]) ?
                  $unsigned($signed(reg108)) : (wire79 >> (reg109 & (7'h43)))) ?
              reg104 : reg97[(2'h2):(1'h0)]));
        end
      else
        begin
          reg120 <= $signed(((((reg107 > wire94) >>> (reg104 ?
                      (8'hab) : reg120)) ?
                  $signed((-reg106)) : (~(reg106 << reg106))) ?
              $signed((|(~|reg109))) : (reg107[(2'h3):(1'h1)] ?
                  (^~reg104[(2'h2):(2'h2)]) : ($signed(wire79) ?
                      $signed(wire114) : (reg105 == wire113)))));
          reg121 <= reg120[(1'h1):(1'h1)];
          reg122 <= $signed(($signed(reg109) ?
              (+wire75) : reg98[(1'h0):(1'h0)]));
          reg123 <= ($unsigned((+((wire94 & wire114) ^ {wire74,
              reg108}))) >>> (({reg98[(1'h1):(1'h1)], reg117[(3'h5):(2'h2)]} ?
              {$signed(reg118)} : $signed($signed((8'hbe)))) || $unsigned((~&(reg96 ?
              wire75 : (7'h43))))));
        end
      reg124 <= ($signed((^wire76)) ?
          wire80 : (-($signed(reg106) ?
              ($unsigned(reg103) ?
                  ((8'hbb) ? reg118 : reg99) : reg101) : (8'h9e))));
      reg125 <= $unsigned($unsigned(wire112));
      reg126 <= (^$unsigned((wire79 ?
          $unsigned((wire113 & wire94)) : wire112[(3'h5):(1'h0)])));
    end
  assign wire127 = $unsigned(((~|reg123[(4'h8):(3'h5)]) ?
                       $signed((!$signed(wire113))) : (wire75 == $signed(((8'ha5) ?
                           reg105 : (8'hac))))));
  always
    @(posedge clk) begin
      reg128 <= $signed(((~^$signed(wire111[(1'h1):(1'h0)])) > (((wire81 ?
          reg122 : (8'had)) ^~ {reg115, reg119}) & (^~{(8'ha6)}))));
      if ((+reg118[(2'h2):(2'h2)]))
        begin
          reg129 <= reg99;
        end
      else
        begin
          reg129 <= (wire94[(4'he):(3'h7)] == wire76);
          reg130 <= {reg117[(1'h0):(1'h0)],
              $signed((-($signed(reg98) != (reg129 ? reg104 : (8'ha5)))))};
          reg131 <= (wire74[(4'h8):(3'h6)] ?
              (8'hb7) : $signed(((+$signed(reg125)) <<< ((wire94 <= reg122) << (8'hb7)))));
        end
      reg132 <= wire75;
      reg133 <= wire73[(3'h5):(1'h1)];
      reg134 <= ((^~($unsigned((wire73 || reg122)) ?
          reg106 : $signed((8'ha7)))) || (~&$signed({{reg119, wire78}})));
    end
  module135 #() modinst147 (wire146, clk, reg121, wire73, wire113, wire114, reg98);
  module148 #() modinst194 (wire193, clk, wire74, wire80, reg97, reg122, reg98);
  assign wire195 = {((((+(8'ha0)) >= reg119[(3'h4):(1'h1)]) >>> {(reg123 ?
                                   reg124 : reg100)}) ?
                           (~^$signed(wire77[(1'h1):(1'h0)])) : $unsigned(($unsigned(wire146) ?
                               reg100[(2'h2):(1'h1)] : $signed(reg131)))),
                       reg134[(4'h9):(2'h2)]};
  assign wire196 = ((~((&{(8'ha9), reg131}) | $signed({wire75, reg123}))) ?
                       (reg101 == {{$signed(reg105)}}) : (((wire76 ?
                                   reg126[(1'h0):(1'h0)] : (reg105 - reg106)) ?
                               reg126 : $unsigned($signed(reg115))) ?
                           ($signed({wire111,
                               reg130}) * $signed(wire195)) : reg134));
  assign wire197 = (reg121[(2'h3):(2'h3)] - ($unsigned(reg102[(2'h2):(1'h0)]) - reg119));
  module198 #() modinst220 (.wire200(wire193), .wire199(wire81), .wire203(wire76), .wire201(reg119), .y(wire219), .wire202(reg129), .clk(clk));
  assign wire221 = $signed((({reg105} < reg104) ^~ ((-$unsigned((8'ha4))) ?
                       {(+wire146)} : wire146[(3'h5):(1'h1)])));
endmodule

module module59  (y, clk, wire64, wire63, wire62, wire61, wire60);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire64;
  input wire signed [(5'h14):(1'h0)] wire63;
  input wire signed [(4'hb):(1'h0)] wire62;
  input wire signed [(2'h3):(1'h0)] wire61;
  input wire signed [(2'h3):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire66;
  wire [(4'hf):(1'h0)] wire65;
  assign y = {wire69, wire68, wire67, wire66, wire65, (1'h0)};
  assign wire65 = ((^wire61[(1'h0):(1'h0)]) ?
                      (wire62 ?
                          ((wire61[(1'h0):(1'h0)] ?
                                  (wire64 >= wire64) : (wire63 + (8'had))) ?
                              wire63[(4'h9):(1'h0)] : $unsigned($signed(wire60))) : wire63) : (|(&$signed(wire62[(4'h9):(3'h5)]))));
  assign wire66 = ((-wire62[(4'h9):(1'h0)]) ?
                      wire61[(2'h3):(2'h2)] : $signed(($unsigned((8'ha4)) >>> $unsigned((wire62 ?
                          wire63 : wire60)))));
  assign wire67 = {{wire61, (~(-((8'ha4) >= (8'hbc))))}, (wire66 > wire65)};
  assign wire68 = wire67[(3'h5):(2'h2)];
  assign wire69 = wire61[(2'h2):(1'h1)];
endmodule

module module10
#(parameter param52 = (({{((8'ha7) >>> (7'h44))}} ? (8'haa) : (({(8'h9e), (8'hb1)} ? ((8'hbd) ? (8'ha0) : (8'hb8)) : ((8'hb0) >> (8'hbc))) || (((8'hbb) || (8'hb3)) >> {(8'ha2)}))) >>> ({{((8'hb8) ? (8'h9f) : (8'haf))}} == (&(!((8'hb1) && (8'ha7)))))), 
parameter param53 = ((!param52) && (((+(-param52)) ? (param52 < (param52 ? param52 : param52)) : (param52 <= param52)) & param52)))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire15;
  input wire [(5'h13):(1'h0)] wire14;
  input wire signed [(4'hf):(1'h0)] wire13;
  input wire signed [(4'ha):(1'h0)] wire12;
  input wire [(3'h5):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire27;
  wire [(4'hb):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(3'h7):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire16;
  assign y = {wire51,
                 wire49,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 (1'h0)};
  assign wire16 = wire13[(2'h2):(1'h0)];
  assign wire17 = ($unsigned(wire15[(2'h3):(1'h0)]) <<< $signed($unsigned(wire12[(2'h3):(2'h3)])));
  assign wire18 = $signed((8'hb8));
  assign wire19 = wire12;
  assign wire20 = $unsigned((($signed(wire17[(4'hc):(3'h4)]) ?
                      wire11 : $signed(wire11)) & {wire13,
                      wire14[(3'h4):(1'h1)]}));
  assign wire21 = wire11[(3'h4):(1'h0)];
  assign wire22 = wire11[(2'h2):(1'h0)];
  assign wire23 = (wire12 ~^ wire11);
  assign wire24 = {(~&$unsigned(wire18[(4'h9):(4'h9)]))};
  assign wire25 = (~^$unsigned(wire14[(4'h9):(3'h7)]));
  assign wire26 = (((~|{wire22[(3'h4):(3'h4)]}) ?
                      wire21 : ($unsigned(wire17[(4'hb):(3'h6)]) ?
                          ($unsigned(wire13) ~^ (wire25 ?
                              wire22 : wire21)) : (~|$signed(wire13)))) < {{(&(8'ha3))},
                      $signed($unsigned($signed(wire25)))});
  assign wire27 = ((&(!$unsigned((wire20 ? wire25 : wire14)))) ?
                      (~&$unsigned($signed((wire26 && wire23)))) : wire26[(4'h8):(3'h7)]);
  assign wire28 = $unsigned($signed($signed((|(^wire27)))));
  assign wire29 = (wire12[(3'h4):(1'h1)] > (^wire23[(4'hd):(3'h7)]));
  assign wire30 = {$signed(($signed(wire13) >> wire20[(3'h7):(1'h1)])),
                      ((($signed(wire16) & (wire20 != wire20)) ?
                          wire14 : wire21[(2'h3):(2'h3)]) < $unsigned($signed($unsigned((8'hbd)))))};
  assign wire31 = (((8'hab) || wire20) ?
                      wire22 : $signed(($signed((8'hb6)) ?
                          (wire18 >= wire27) : $unsigned(wire22))));
  module32 #() modinst50 (wire49, clk, wire12, wire13, wire28, wire23);
  assign wire51 = wire27;
endmodule

module module32  (y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire36;
  input wire [(4'hf):(1'h0)] wire35;
  input wire [(5'h14):(1'h0)] wire34;
  input wire signed [(3'h4):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire41;
  wire [(4'h9):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire37;
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 reg45,
                 (1'h0)};
  assign wire37 = wire34;
  assign wire38 = $unsigned($unsigned($unsigned($signed((!wire33)))));
  assign wire39 = $signed($unsigned((8'hb2)));
  assign wire40 = (((8'hae) ~^ {$unsigned((wire33 > wire39))}) <= {(~|$unsigned(wire39[(1'h0):(1'h0)]))});
  assign wire41 = $unsigned($signed(((((7'h44) || wire34) ^ $signed(wire36)) ?
                      wire39[(1'h1):(1'h1)] : (wire34 + wire38))));
  assign wire42 = (~|wire33[(3'h4):(2'h3)]);
  assign wire43 = (wire38 ?
                      (~{wire33[(2'h2):(1'h0)],
                          ((+(8'ha6)) ?
                              {wire39, wire40} : (wire37 ?
                                  wire41 : (8'haa)))}) : $signed((wire37 ?
                          wire36[(2'h3):(1'h1)] : wire40[(1'h0):(1'h0)])));
  assign wire44 = ({(&$signed((wire36 ? wire41 : wire37)))} ?
                      $signed((+(+$unsigned((8'hbd))))) : {$unsigned(wire36[(4'h8):(4'h8)])});
  always
    @(posedge clk) begin
      reg45 <= (~^wire42);
    end
  assign wire46 = (8'h9f);
  assign wire47 = $signed($signed(wire35[(2'h2):(1'h1)]));
  assign wire48 = (&((~^$unsigned((wire37 ? (8'hbe) : wire34))) ?
                      wire41 : (~|(^~$unsigned(wire40)))));
endmodule

module module198
#(parameter param217 = {(((^~((8'hb5) ? (8'hac) : (8'ha9))) ? ((^(7'h43)) && {(8'hbd), (8'h9c)}) : (+((8'h9d) ? (8'hae) : (8'hb0)))) ? (~&((~&(8'ha7)) ? (^(8'hb7)) : ((8'had) > (7'h41)))) : ((((8'ha3) + (8'hb1)) ? {(8'ha7)} : (^~(8'hb2))) ^ (8'hbe))), {({((8'ha0) || (7'h43)), ((8'ha4) ? (8'hac) : (8'had))} ? {{(7'h42)}, {(8'ha5), (8'ha2)}} : {(~&(8'ha7)), ((8'hac) ? (8'hbf) : (8'ha2))}), (((7'h40) - {(8'ha4), (8'ha3)}) && (((7'h44) && (8'ha0)) > {(8'hae), (7'h43)}))}}, 
parameter param218 = (|(param217 ^ param217)))
(y, clk, wire203, wire202, wire201, wire200, wire199);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire203;
  input wire signed [(5'h15):(1'h0)] wire202;
  input wire [(4'hb):(1'h0)] wire201;
  input wire signed [(4'hb):(1'h0)] wire200;
  input wire signed [(4'h8):(1'h0)] wire199;
  wire [(4'hf):(1'h0)] wire216;
  wire [(3'h5):(1'h0)] wire215;
  wire signed [(5'h10):(1'h0)] wire214;
  wire signed [(5'h15):(1'h0)] wire213;
  wire [(2'h2):(1'h0)] wire212;
  wire signed [(3'h7):(1'h0)] wire211;
  wire [(5'h13):(1'h0)] wire210;
  wire [(3'h5):(1'h0)] wire209;
  wire [(4'hc):(1'h0)] wire208;
  wire signed [(5'h11):(1'h0)] wire206;
  wire signed [(5'h11):(1'h0)] wire205;
  wire [(2'h2):(1'h0)] wire204;
  reg [(3'h4):(1'h0)] reg207 = (1'h0);
  assign y = {wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire206,
                 wire205,
                 wire204,
                 reg207,
                 (1'h0)};
  assign wire204 = $unsigned($signed(wire202[(4'ha):(3'h4)]));
  assign wire205 = {(!wire199)};
  assign wire206 = (($unsigned(wire202[(4'hf):(1'h0)]) <<< $unsigned((((7'h44) << wire204) & $signed((8'h9e))))) ?
                       wire205 : wire199[(4'h8):(1'h0)]);
  always
    @(posedge clk) begin
      reg207 <= wire205[(3'h7):(1'h1)];
    end
  assign wire208 = wire204[(2'h2):(1'h1)];
  assign wire209 = (wire200[(1'h0):(1'h0)] ?
                       wire201 : $signed($unsigned(reg207[(1'h0):(1'h0)])));
  assign wire210 = (8'hae);
  assign wire211 = {wire206, {{wire200, wire202}}};
  assign wire212 = ((($signed((&(8'hab))) << {(~^reg207),
                           wire203[(4'hc):(1'h0)]}) >> (~|((wire205 ?
                               wire206 : wire203) ?
                           (|wire199) : wire208))) ?
                       wire210 : wire205[(5'h10):(4'hf)]);
  assign wire213 = wire200[(4'h9):(1'h1)];
  assign wire214 = $unsigned((^$signed(wire209[(2'h3):(1'h1)])));
  assign wire215 = (^wire199[(2'h2):(1'h1)]);
  assign wire216 = ((((~^wire213) ? ((~wire199) + wire209) : wire209) ?
                       $signed($unsigned($signed((8'hbb)))) : wire202[(2'h3):(2'h3)]) >>> ($signed(wire203) ?
                       {wire214[(3'h7):(1'h1)],
                           ($unsigned(wire206) ?
                               (wire212 ?
                                   wire208 : (8'h9e)) : (wire202 < wire202))} : $signed(wire202[(3'h6):(1'h0)])));
endmodule

module module148  (y, clk, wire153, wire152, wire151, wire150, wire149);
  output wire [(32'h1cc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire153;
  input wire signed [(2'h2):(1'h0)] wire152;
  input wire [(4'h9):(1'h0)] wire151;
  input wire signed [(5'h11):(1'h0)] wire150;
  input wire [(2'h2):(1'h0)] wire149;
  wire signed [(5'h15):(1'h0)] wire192;
  wire signed [(3'h6):(1'h0)] wire191;
  wire signed [(2'h2):(1'h0)] wire190;
  wire [(3'h4):(1'h0)] wire189;
  wire [(5'h12):(1'h0)] wire188;
  wire signed [(5'h15):(1'h0)] wire182;
  wire [(3'h7):(1'h0)] wire181;
  wire signed [(4'he):(1'h0)] wire180;
  wire signed [(4'hd):(1'h0)] wire172;
  wire signed [(4'hc):(1'h0)] wire171;
  wire [(3'h5):(1'h0)] wire170;
  wire [(4'hb):(1'h0)] wire169;
  wire signed [(5'h13):(1'h0)] wire168;
  wire [(5'h11):(1'h0)] wire167;
  wire signed [(4'ha):(1'h0)] wire166;
  wire [(4'hf):(1'h0)] wire165;
  wire [(4'hf):(1'h0)] wire164;
  wire [(4'hb):(1'h0)] wire163;
  wire signed [(4'hc):(1'h0)] wire162;
  reg signed [(5'h13):(1'h0)] reg187 = (1'h0);
  reg signed [(4'he):(1'h0)] reg186 = (1'h0);
  reg [(5'h13):(1'h0)] reg185 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg184 = (1'h0);
  reg [(3'h7):(1'h0)] reg183 = (1'h0);
  reg [(3'h6):(1'h0)] reg179 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg178 = (1'h0);
  reg [(5'h12):(1'h0)] reg177 = (1'h0);
  reg [(4'h8):(1'h0)] reg176 = (1'h0);
  reg [(3'h6):(1'h0)] reg175 = (1'h0);
  reg [(3'h5):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg161 = (1'h0);
  reg [(5'h10):(1'h0)] reg160 = (1'h0);
  reg [(5'h11):(1'h0)] reg159 = (1'h0);
  reg [(4'h8):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg157 = (1'h0);
  reg [(4'hb):(1'h0)] reg156 = (1'h0);
  reg [(2'h3):(1'h0)] reg155 = (1'h0);
  reg [(4'hb):(1'h0)] reg154 = (1'h0);
  assign y = {wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire182,
                 wire181,
                 wire180,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($signed(wire150[(4'hc):(3'h4)]) != ({$unsigned((wire153 >>> wire150))} ?
          (wire152 ?
              ((wire150 > wire152) ^ (!wire151)) : {(wire152 ?
                      wire153 : (7'h44))}) : (wire151 ?
              $unsigned($signed((8'ha6))) : wire150))))
        begin
          if (wire149)
            begin
              reg154 <= $unsigned(wire151[(3'h6):(2'h2)]);
              reg155 <= reg154[(3'h4):(1'h0)];
            end
          else
            begin
              reg154 <= ($signed({((reg155 <= wire150) ?
                          (reg154 * reg154) : (wire150 + wire151))}) ?
                  $unsigned(({reg154[(4'hb):(1'h0)],
                          (wire151 ? (8'hab) : (8'ha8))} ?
                      ((~wire151) ?
                          (&(8'hb1)) : (wire152 && reg155)) : (wire151 && $unsigned(wire153)))) : reg155[(2'h3):(2'h3)]);
              reg155 <= (^~wire149[(1'h1):(1'h1)]);
              reg156 <= wire149;
              reg157 <= $signed((reg156 != $signed((wire150[(4'hc):(3'h5)] - (8'hbc)))));
            end
          reg158 <= reg154;
          if ((reg155 || ((wire153[(2'h3):(1'h0)] ?
              reg158 : $unsigned((!reg156))) == (($unsigned((7'h41)) ?
                  $signed((8'h9d)) : (|wire149)) ?
              wire150 : $signed((|reg154))))))
            begin
              reg159 <= ({(|{wire152[(2'h2):(1'h0)]})} ?
                  reg156[(3'h6):(2'h2)] : $unsigned(wire152));
            end
          else
            begin
              reg159 <= ((~($unsigned((~&reg156)) ?
                  (wire150[(4'h9):(3'h5)] + (wire150 * reg154)) : (((8'hab) < wire150) ?
                      reg159[(4'h9):(4'h8)] : (reg158 ?
                          reg158 : (8'h9d))))) || $signed($signed(wire152)));
            end
          reg160 <= $signed(reg158);
        end
      else
        begin
          if (reg155[(2'h2):(1'h0)])
            begin
              reg154 <= {$signed($unsigned((reg156[(4'h8):(3'h7)] << reg160)))};
            end
          else
            begin
              reg154 <= $unsigned((((|reg158[(3'h6):(3'h5)]) ?
                  ($signed(wire150) >>> wire153) : reg157) > (~^(^~$unsigned(reg155)))));
              reg155 <= reg155[(1'h1):(1'h1)];
            end
          reg156 <= ($signed(({$unsigned(reg157), $unsigned(reg157)} ?
              (wire151[(2'h2):(1'h1)] ^ (8'hb2)) : ($unsigned(reg156) & reg155))) | (({(wire149 * (8'hbc))} > (~&(reg159 ?
              wire151 : reg154))) <= wire150));
          if ($signed((((~^wire152[(1'h0):(1'h0)]) ?
              (reg160 ?
                  wire151[(3'h6):(3'h6)] : (|(8'ha2))) : reg160) & ((8'hbf) ?
              ((reg159 ? reg156 : reg155) <= {wire152, wire153}) : (^~(reg158 ?
                  reg155 : wire153))))))
            begin
              reg157 <= ({($unsigned(wire152[(1'h1):(1'h1)]) + reg156)} ?
                  $signed((8'ha1)) : (-($unsigned(reg160) + reg160[(4'ha):(3'h6)])));
              reg158 <= $signed(reg156);
              reg159 <= reg158;
              reg160 <= (($unsigned(((reg158 >> (8'hab)) != reg159[(4'h8):(3'h6)])) >>> (!({reg157} ?
                  reg159 : reg154))) >>> $signed(reg155[(2'h3):(1'h0)]));
              reg161 <= ($signed(((+(reg159 ?
                      reg154 : (8'ha9))) >>> (reg156[(3'h6):(3'h6)] ?
                      (wire152 ? reg154 : reg155) : {reg159}))) ?
                  (($unsigned(((8'ha7) ? wire153 : reg158)) >> (reg157 ?
                      (reg155 ?
                          reg158 : reg154) : $unsigned(wire152))) ~^ ((^wire151) ?
                      reg160 : reg158)) : {(wire149[(2'h2):(1'h0)] == (+(~(8'hb0))))});
            end
          else
            begin
              reg157 <= {((reg157[(4'ha):(4'h8)] ?
                      $signed((&reg156)) : reg156) > (+$unsigned(reg157)))};
            end
        end
    end
  assign wire162 = $signed(reg157);
  assign wire163 = $unsigned($unsigned((^~(&((8'ha6) & (8'hb0))))));
  assign wire164 = (&reg156[(3'h6):(1'h1)]);
  assign wire165 = $signed({reg158[(4'h8):(2'h3)],
                       $unsigned($unsigned(wire149))});
  assign wire166 = $unsigned($signed((^$signed((8'hbe)))));
  assign wire167 = ({$signed(wire150), $unsigned((+{wire166, reg160}))} ?
                       reg155 : ((^(wire151 ?
                               {(8'h9f)} : (wire149 << reg161))) ?
                           ($unsigned($unsigned(wire151)) >= (reg161[(3'h5):(2'h2)] ?
                               reg157 : $signed(wire152))) : reg157));
  assign wire168 = (reg158 << (wire150 ^~ $signed(wire165[(3'h7):(3'h7)])));
  assign wire169 = reg157[(4'hf):(3'h5)];
  assign wire170 = wire164;
  assign wire171 = wire167;
  assign wire172 = ((wire153 ?
                           (~^$unsigned(reg157)) : (+(~((8'ha1) ~^ (8'ha1))))) ?
                       (wire170 ?
                           (wire151 <<< ((|wire169) ?
                               {wire165,
                                   wire171} : (reg161 - wire150))) : ((&(!wire165)) ?
                               $signed($signed(reg155)) : ($unsigned(wire170) ?
                                   wire166[(3'h5):(2'h2)] : (!wire153)))) : (wire167 ?
                           (!reg154) : wire169[(3'h6):(3'h4)]));
  always
    @(posedge clk) begin
      reg173 <= $unsigned($unsigned(wire167));
      if ((^reg158[(2'h2):(2'h2)]))
        begin
          reg174 <= $unsigned((wire169 ? reg154 : wire166));
          reg175 <= (~$unsigned($signed((wire164 ^~ (~&wire165)))));
        end
      else
        begin
          if (reg173)
            begin
              reg174 <= $signed($signed(wire171));
              reg175 <= ($signed(wire153) ?
                  (($unsigned(wire168) << (~^{wire164})) ?
                      ($signed($signed(reg159)) - ((wire165 >> reg156) <<< $signed(reg159))) : (((~^wire153) ?
                          {wire153} : $signed(reg156)) ^~ ((wire151 <<< reg155) >>> (reg155 > wire168)))) : (($signed((wire153 ?
                      reg161 : wire171)) | $unsigned(((8'h9e) >>> reg159))) >> wire152));
              reg176 <= $signed({$unsigned(reg159)});
              reg177 <= $signed(wire151);
            end
          else
            begin
              reg174 <= (8'hb7);
            end
          reg178 <= wire164;
        end
      reg179 <= (!((wire152 ~^ (!(wire172 & reg156))) ~^ (^~$unsigned($signed(wire171)))));
    end
  assign wire180 = ((((^$signed(wire153)) ?
                           {(wire153 ~^ reg178),
                               (^(8'ha3))} : (|(^reg161))) | ($unsigned($signed(reg179)) ?
                           reg158 : $signed({wire171}))) ?
                       wire150 : {((&(reg177 ? wire171 : (8'hb2))) ?
                               (8'hb1) : wire150),
                           $unsigned($signed($unsigned((7'h44))))});
  assign wire181 = (~($unsigned((8'hbc)) ?
                       (($unsigned(wire170) ?
                           (reg159 ?
                               reg178 : wire149) : $signed(reg156)) >> wire151[(2'h2):(1'h0)]) : (wire153[(3'h4):(2'h2)] ?
                           $signed((wire151 ?
                               reg175 : (8'h9e))) : (reg173[(2'h2):(1'h1)] - wire151[(4'h8):(1'h1)]))));
  assign wire182 = (-(!reg157));
  always
    @(posedge clk) begin
      reg183 <= ((-wire164[(2'h2):(1'h0)]) && reg174);
      reg184 <= (~&$signed((&reg159[(3'h7):(2'h2)])));
      reg185 <= (8'h9f);
      reg186 <= (~$unsigned($signed((8'hb3))));
      reg187 <= reg178;
    end
  assign wire188 = $signed((reg185[(3'h4):(2'h2)] <= (8'hbb)));
  assign wire189 = $signed($signed(({((8'ha5) ? reg157 : wire181),
                       (~^(8'h9d))} << $signed((reg155 == wire151)))));
  assign wire190 = wire180[(2'h3):(1'h0)];
  assign wire191 = ($unsigned((8'had)) + reg157[(4'h9):(2'h3)]);
  assign wire192 = (wire182 ?
                       (8'hb3) : {(!(~|wire151[(4'h9):(3'h6)])), (8'hb0)});
endmodule

module module135  (y, clk, wire140, wire139, wire138, wire137, wire136);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire140;
  input wire signed [(5'h12):(1'h0)] wire139;
  input wire [(5'h12):(1'h0)] wire138;
  input wire [(5'h14):(1'h0)] wire137;
  input wire signed [(5'h12):(1'h0)] wire136;
  wire signed [(4'hc):(1'h0)] wire145;
  wire signed [(3'h5):(1'h0)] wire144;
  wire signed [(4'hf):(1'h0)] wire143;
  wire [(2'h2):(1'h0)] wire142;
  wire [(5'h14):(1'h0)] wire141;
  assign y = {wire145, wire144, wire143, wire142, wire141, (1'h0)};
  assign wire141 = $unsigned((~|(~({wire136, (8'h9c)} - (wire136 ?
                       wire137 : wire140)))));
  assign wire142 = wire138;
  assign wire143 = $signed((^~wire142[(2'h2):(2'h2)]));
  assign wire144 = $unsigned((~^(wire138 ?
                       $unsigned(wire138) : $unsigned(wire136[(3'h5):(3'h4)]))));
  assign wire145 = $unsigned($signed((((wire140 > (7'h41)) ~^ wire137[(4'hd):(3'h5)]) ?
                       $unsigned($signed(wire144)) : $signed((~&(8'hb3))))));
endmodule

module module82
#(parameter param93 = ((7'h40) ? ((^~((^(8'hba)) && ((7'h40) ^~ (8'ha5)))) + (^~((+(8'hbb)) ? ((8'ha3) ? (8'hbd) : (8'hbd)) : ((8'hb1) | (8'haf))))) : (|{({(8'ha2), (8'hb9)} ^ ((8'ha3) ? (8'ha3) : (8'ha1)))})))
(y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire87;
  input wire signed [(4'hf):(1'h0)] wire86;
  input wire signed [(3'h4):(1'h0)] wire85;
  input wire [(2'h3):(1'h0)] wire84;
  input wire [(4'h8):(1'h0)] wire83;
  wire [(4'hf):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire90;
  wire signed [(4'hc):(1'h0)] wire89;
  wire signed [(3'h4):(1'h0)] wire88;
  assign y = {wire92, wire91, wire90, wire89, wire88, (1'h0)};
  assign wire88 = wire84;
  assign wire89 = ($unsigned((|$unsigned((wire87 - wire88)))) - wire86);
  assign wire90 = (wire85 ?
                      wire83 : ($signed(wire84) ?
                          (-(!$signed(wire89))) : (wire84[(1'h0):(1'h0)] ?
                              {wire83[(3'h4):(3'h4)],
                                  $signed(wire89)} : wire84[(1'h1):(1'h1)])));
  assign wire91 = $signed((wire88 + (~|wire90)));
  assign wire92 = $unsigned(wire91);
endmodule
