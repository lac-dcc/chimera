module top
#(parameter param237 = (+(-{(((8'hae) ? (8'h9f) : (8'haf)) < ((8'ha0) || (7'h43)))})), 
parameter param238 = (^(-({(param237 ? param237 : param237), {param237, param237}} >= ((param237 ^ param237) ? (param237 >>> param237) : param237)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h27b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire236;
  wire [(5'h14):(1'h0)] wire234;
  wire [(4'h8):(1'h0)] wire233;
  wire signed [(5'h14):(1'h0)] wire225;
  wire signed [(5'h11):(1'h0)] wire211;
  wire signed [(3'h7):(1'h0)] wire209;
  wire [(5'h13):(1'h0)] wire208;
  wire signed [(5'h10):(1'h0)] wire207;
  wire signed [(4'h9):(1'h0)] wire206;
  wire signed [(5'h13):(1'h0)] wire197;
  wire signed [(5'h13):(1'h0)] wire195;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire227;
  wire [(5'h14):(1'h0)] wire228;
  wire signed [(5'h13):(1'h0)] wire229;
  wire [(5'h11):(1'h0)] wire230;
  wire [(4'hd):(1'h0)] wire231;
  reg signed [(4'h9):(1'h0)] reg224 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg223 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg222 = (1'h0);
  reg [(3'h7):(1'h0)] reg221 = (1'h0);
  reg [(3'h4):(1'h0)] reg220 = (1'h0);
  reg [(3'h4):(1'h0)] reg219 = (1'h0);
  reg [(5'h15):(1'h0)] reg218 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg217 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg216 = (1'h0);
  reg [(5'h13):(1'h0)] reg215 = (1'h0);
  reg [(4'ha):(1'h0)] reg214 = (1'h0);
  reg [(3'h6):(1'h0)] reg213 = (1'h0);
  reg [(3'h5):(1'h0)] reg212 = (1'h0);
  reg [(3'h4):(1'h0)] reg210 = (1'h0);
  reg [(5'h14):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg202 = (1'h0);
  reg [(5'h12):(1'h0)] reg201 = (1'h0);
  reg [(5'h15):(1'h0)] reg200 = (1'h0);
  reg [(5'h14):(1'h0)] reg199 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  assign y = {wire236,
                 wire234,
                 wire233,
                 wire225,
                 wire211,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire197,
                 wire195,
                 wire6,
                 wire5,
                 wire227,
                 wire228,
                 wire229,
                 wire230,
                 wire231,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg210,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = (wire3 ?
                     ((~&$signed((wire1 ^ wire3))) & wire3[(3'h7):(3'h5)]) : $signed((((wire3 >> wire2) != wire0) ^~ $signed(wire3[(3'h4):(1'h1)]))));
  assign wire6 = wire5[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg7 <= (!(~^wire4[(3'h5):(2'h3)]));
      reg8 <= (wire1 < (~^({(8'ha1)} ?
          $unsigned((wire5 != wire0)) : $unsigned($signed(wire6)))));
      reg9 <= wire6;
      reg10 <= (-($signed(reg7[(4'h8):(3'h5)]) ?
          wire0 : ((!(wire6 * wire5)) ?
              {wire0[(3'h6):(2'h3)], wire0} : reg9[(3'h5):(1'h1)])));
    end
  module11 #() modinst196 (.wire16(wire2), .clk(clk), .wire15(reg9), .y(wire195), .wire12(reg8), .wire14(reg7), .wire13(wire4));
  module11 #() modinst198 (wire197, clk, wire1, reg7, wire6, wire5, wire4);
  always
    @(posedge clk) begin
      reg199 <= $signed($signed(wire195));
      if ((+reg9[(5'h10):(4'hc)]))
        begin
          reg200 <= wire2;
          reg201 <= (wire3[(4'h8):(3'h5)] ?
              (+$signed($unsigned(reg10[(4'h8):(3'h4)]))) : {wire0[(4'ha):(3'h7)],
                  $signed($signed({(8'hb1), wire3}))});
          reg202 <= $unsigned(wire6[(4'hc):(3'h6)]);
          reg203 <= $unsigned(wire1);
          reg204 <= reg10;
        end
      else
        begin
          reg200 <= $signed((+$signed(reg201[(5'h11):(1'h0)])));
        end
      reg205 <= $signed($unsigned($unsigned(($unsigned(reg199) ?
          wire1[(4'hf):(2'h2)] : (reg7 ? wire3 : wire195)))));
    end
  assign wire206 = $unsigned((~^($signed(wire4[(4'hd):(3'h5)]) ?
                       (!(reg10 * reg203)) : ((~&wire5) <<< (-wire6)))));
  assign wire207 = (^(|$signed((7'h43))));
  assign wire208 = ($signed(wire1) ?
                       ((($unsigned(wire3) ? reg201 : wire1) ?
                           (~reg201) : wire4[(3'h5):(3'h5)]) == (7'h42)) : (({reg10} && reg204) ?
                           reg204 : reg10));
  assign wire209 = {(($signed((~&wire2)) * wire3[(3'h4):(2'h3)]) ^ reg203),
                       $unsigned($signed(wire0[(4'hb):(3'h4)]))};
  always
    @(posedge clk) begin
      reg210 <= ({wire5, ({$signed(reg7)} ? (8'hb5) : (|$unsigned((8'hb4))))} ?
          $unsigned(($signed(reg10[(4'ha):(3'h6)]) & wire209)) : (-wire197));
    end
  assign wire211 = {((-reg9[(3'h7):(1'h0)]) ?
                           {wire197[(3'h7):(1'h1)],
                               $signed($signed(reg8))} : $signed(wire207))};
  always
    @(posedge clk) begin
      if (reg10[(4'hb):(1'h1)])
        begin
          reg212 <= (reg205[(4'hd):(3'h5)] < (~$unsigned((&wire208[(2'h2):(1'h0)]))));
          if (reg204[(3'h7):(1'h0)])
            begin
              reg213 <= ($unsigned({(((8'ha5) + wire211) ?
                          (reg204 ? wire2 : wire6) : $unsigned(reg210)),
                      reg9}) ?
                  {$unsigned({$unsigned(reg212), (wire0 == wire5)}),
                      $unsigned(reg10)} : reg8);
              reg214 <= reg203[(3'h7):(3'h5)];
              reg215 <= {wire1,
                  {(8'hbd),
                      ((reg7 ? reg7[(2'h3):(1'h1)] : wire3) ?
                          wire1[(2'h3):(1'h1)] : (reg214 == (wire195 ?
                              (8'hba) : reg210)))}};
              reg216 <= wire208[(4'hc):(4'h8)];
            end
          else
            begin
              reg213 <= ($signed(((reg202[(4'h8):(4'h8)] * reg214) + $unsigned({reg200}))) ?
                  $unsigned(((!{reg213,
                      (8'ha1)}) && reg9[(4'h9):(3'h4)])) : (|{$unsigned(reg203[(1'h1):(1'h0)]),
                      ($signed(reg212) ? $signed(wire4) : {reg212})}));
              reg214 <= (((8'hb0) < reg212[(2'h3):(1'h0)]) + reg213);
              reg215 <= (wire208 ?
                  ($unsigned($signed(reg210)) ?
                      (wire3 > ($signed(reg204) ?
                          (reg212 != wire1) : {(8'ha5),
                              wire1})) : ($unsigned((+wire207)) ?
                          (^~(wire2 - reg200)) : reg8[(5'h10):(4'hd)])) : (~^{(reg8 <= reg202)}));
            end
          if ({($unsigned(wire5) < (($signed(wire3) ?
                      reg204 : reg9[(3'h5):(3'h4)]) ?
                  {(&reg201)} : reg200))})
            begin
              reg217 <= (((|reg202[(3'h7):(3'h5)]) != (wire206[(1'h0):(1'h0)] ?
                      wire208[(3'h5):(3'h4)] : wire3)) ?
                  reg202 : ($unsigned(reg200[(5'h12):(3'h6)]) ?
                      reg215[(2'h2):(1'h0)] : $unsigned(reg8)));
            end
          else
            begin
              reg217 <= ((~&wire5) ?
                  reg203[(3'h6):(3'h4)] : ($unsigned(((reg10 ?
                              wire195 : wire5) ?
                          (~|(8'hbe)) : (reg216 ? reg213 : wire1))) ?
                      {$signed({wire208, wire3}),
                          wire207} : $unsigned(reg200)));
              reg218 <= $unsigned(reg214);
              reg219 <= (!$unsigned({(reg7 >= reg8)}));
            end
          if ((8'hbd))
            begin
              reg220 <= $unsigned(wire211[(4'hb):(1'h1)]);
              reg221 <= (({(&$unsigned(wire208)), wire2} ?
                      ($unsigned(((8'ha1) ? (8'hb6) : reg220)) ?
                          reg217[(2'h3):(2'h2)] : $unsigned(((7'h44) ?
                              reg8 : wire195))) : $unsigned($unsigned(((8'had) ?
                          reg218 : wire1)))) ?
                  reg217[(3'h5):(3'h4)] : (-(!{((8'ha1) ? wire1 : reg200)})));
              reg222 <= (8'hb2);
            end
          else
            begin
              reg220 <= wire5[(4'hb):(4'h8)];
            end
        end
      else
        begin
          if (($signed(wire0[(4'hb):(3'h6)]) - reg202))
            begin
              reg212 <= {({reg201[(1'h0):(1'h0)],
                      (reg200[(1'h0):(1'h0)] ?
                          ((7'h40) ? reg220 : reg7) : (~|wire3))} + wire4),
                  reg8[(2'h3):(2'h2)]};
              reg213 <= $unsigned((~^reg221));
            end
          else
            begin
              reg212 <= $unsigned(((wire209 ^ ((wire5 >= wire195) && (reg215 ?
                  wire5 : wire206))) > $signed(($signed(wire1) ?
                  $signed(reg210) : ((8'ha7) ? (8'hb3) : reg213)))));
              reg213 <= wire209;
            end
          if (reg200[(2'h2):(2'h2)])
            begin
              reg214 <= $unsigned((8'ha7));
              reg215 <= (^reg205);
              reg216 <= ((^~(reg8 ?
                  (!reg221[(3'h5):(1'h1)]) : reg205[(5'h12):(5'h11)])) || {(~&(~|wire1[(4'h9):(4'h9)])),
                  {reg9[(5'h10):(3'h6)]}});
              reg217 <= (($unsigned((^(~^reg220))) >= $unsigned((8'hbe))) > wire5);
            end
          else
            begin
              reg214 <= (|$signed((+((reg217 ? reg214 : reg200) ?
                  wire197[(1'h1):(1'h0)] : $signed(reg7)))));
              reg215 <= $signed((^~$signed(($unsigned(wire197) ?
                  $signed(reg213) : reg215[(3'h7):(2'h3)]))));
              reg216 <= (^~reg217[(3'h5):(3'h4)]);
              reg217 <= (~|(^~$signed(wire197[(4'ha):(2'h2)])));
              reg218 <= {reg220[(2'h3):(2'h3)]};
            end
          reg219 <= $unsigned($signed((^~reg202)));
        end
      reg223 <= $signed(((^~reg202) + (^~$signed(reg7[(4'hf):(3'h4)]))));
      reg224 <= wire4[(2'h3):(2'h2)];
    end
  module11 #() modinst226 (wire225, clk, reg215, reg200, reg203, wire208, reg223);
  assign wire227 = reg223;
  assign wire228 = reg213[(3'h4):(2'h2)];
  assign wire229 = reg8;
  assign wire230 = ((reg217[(1'h1):(1'h1)] ?
                       $unsigned({(~&wire3),
                           $unsigned(reg218)}) : $signed($signed(((8'hac) >= reg220)))) <= $signed(({(reg218 ?
                           reg8 : (8'ha8))} << ({reg215, reg202} ?
                       (8'hba) : (~|wire195)))));
  module66 #() modinst232 (wire231, clk, wire225, wire229, reg222, wire4);
  assign wire233 = ($unsigned(reg220) ?
                       $signed($unsigned(reg9[(5'h13):(4'ha)])) : (~|$signed(reg218[(5'h15):(4'hd)])));
  module145 #() modinst235 (.wire149(reg202), .wire146(wire209), .wire150(reg10), .y(wire234), .wire147(wire6), .clk(clk), .wire148(reg205));
  assign wire236 = $unsigned($signed(wire225));
endmodule

module module11  (y, clk, wire12, wire13, wire14, wire15, wire16);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire12;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire [(5'h10):(1'h0)] wire14;
  input wire signed [(5'h13):(1'h0)] wire15;
  input wire [(3'h7):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire194;
  wire [(2'h3):(1'h0)] wire193;
  wire [(4'hb):(1'h0)] wire192;
  wire [(2'h3):(1'h0)] wire191;
  wire signed [(4'hb):(1'h0)] wire190;
  wire signed [(2'h2):(1'h0)] wire189;
  wire signed [(4'hd):(1'h0)] wire185;
  wire signed [(4'ha):(1'h0)] wire183;
  wire [(3'h7):(1'h0)] wire144;
  wire [(5'h10):(1'h0)] wire135;
  wire [(4'hb):(1'h0)] wire133;
  wire signed [(3'h4):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire91;
  wire [(5'h13):(1'h0)] wire90;
  wire [(5'h11):(1'h0)] wire88;
  wire signed [(5'h15):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire63;
  reg signed [(4'hc):(1'h0)] reg188 = (1'h0);
  reg [(5'h15):(1'h0)] reg187 = (1'h0);
  reg [(5'h12):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg136 = (1'h0);
  reg [(5'h10):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg138 = (1'h0);
  reg [(5'h14):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg140 = (1'h0);
  reg [(2'h2):(1'h0)] reg141 = (1'h0);
  reg [(4'h9):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg143 = (1'h0);
  assign y = {wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire185,
                 wire183,
                 wire144,
                 wire135,
                 wire133,
                 wire92,
                 wire91,
                 wire90,
                 wire88,
                 wire65,
                 wire17,
                 wire63,
                 reg188,
                 reg187,
                 reg186,
                 reg136,
                 reg137,
                 reg138,
                 reg139,
                 reg140,
                 reg141,
                 reg142,
                 reg143,
                 (1'h0)};
  assign wire17 = wire15[(5'h12):(2'h3)];
  module18 #() modinst64 (.y(wire63), .wire21(wire13), .wire23(wire15), .wire19(wire16), .wire22(wire14), .clk(clk), .wire20(wire12));
  assign wire65 = wire63;
  module66 #() modinst89 (wire88, clk, wire14, wire12, wire17, wire63);
  assign wire90 = $signed($signed($signed((wire65 ?
                      $signed(wire14) : $unsigned(wire17)))));
  assign wire91 = $signed($signed(((wire15 >>> $unsigned(wire63)) > $signed((wire12 ?
                      wire15 : wire88)))));
  assign wire92 = ((($signed((+wire63)) ?
                              $signed(wire90) : (-$unsigned(wire88))) ?
                          ($unsigned(wire15) ?
                              wire15[(1'h0):(1'h0)] : ({wire91,
                                  wire90} & (!wire16))) : $signed(((|wire15) ?
                              (wire63 ?
                                  wire17 : wire17) : wire14[(4'he):(4'h8)]))) ?
                      ($unsigned(wire90) & {{(wire15 <= wire13)}}) : ({(^~wire90[(1'h1):(1'h1)])} || {wire16,
                          $unsigned($signed((8'hbf)))}));
  module93 #() modinst134 (.y(wire133), .wire96(wire13), .wire94(wire12), .wire95(wire16), .clk(clk), .wire97(wire15));
  assign wire135 = {$signed((+$signed($signed((8'hbf))))),
                       $unsigned($unsigned({$unsigned(wire13)}))};
  always
    @(posedge clk) begin
      reg136 <= $signed((^~$signed({wire14, {(8'ha8), (8'hb7)}})));
      reg137 <= $signed(wire133);
      reg138 <= ($signed((^~wire88[(3'h7):(3'h5)])) - wire91[(2'h3):(2'h3)]);
      reg139 <= wire90[(3'h7):(3'h6)];
      if ($unsigned(((|$unsigned(wire92)) ^ reg139[(4'ha):(4'h9)])))
        begin
          reg140 <= (~^$signed((~^$signed($unsigned(wire90)))));
          reg141 <= (($signed(wire65) >= (((+wire15) > (wire14 | reg137)) ~^ reg138[(2'h2):(1'h1)])) * ({{((8'hae) <= wire12),
                  {wire63}},
              $unsigned((wire88 ? wire91 : reg139))} >> ({(^~wire133),
                  ((8'ha5) ? (7'h40) : reg139)} ?
              (((8'hbc) != wire90) && (wire14 << wire91)) : (!reg138))));
          reg142 <= $unsigned($unsigned($unsigned((8'hae))));
          reg143 <= {wire63[(3'h4):(2'h3)],
              $unsigned({wire91[(4'hc):(1'h0)], reg137})};
        end
      else
        begin
          reg140 <= $unsigned($signed(($unsigned(wire133) ~^ wire91)));
        end
    end
  assign wire144 = ((reg138 ?
                       (8'hab) : (((~wire15) ? wire12 : {wire15, reg142}) ?
                           $signed({wire12}) : (reg139[(1'h1):(1'h1)] ?
                               $signed((8'hac)) : $signed(reg140)))) >> $unsigned((+$signed({wire133,
                       wire14}))));
  module145 #() modinst184 (.wire150(reg137), .wire149(reg139), .wire147(wire13), .wire148(reg138), .wire146(wire88), .clk(clk), .y(wire183));
  assign wire185 = (wire14[(2'h3):(2'h2)] ~^ reg143[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg186 <= $signed(($signed($unsigned((wire183 || reg138))) ?
          reg137[(4'he):(3'h4)] : (((wire185 ? reg143 : wire90) - wire183) ?
              (8'hb4) : (wire17[(4'ha):(3'h6)] ?
                  ((8'hbb) ? wire16 : wire65) : reg141[(1'h0):(1'h0)]))));
      reg187 <= $signed((+(($signed(wire90) ? wire90 : wire185) ?
          ((wire12 ? wire14 : wire16) ^~ (|(8'hbc))) : wire88)));
      reg188 <= reg141[(1'h0):(1'h0)];
    end
  assign wire189 = wire12[(4'h9):(4'h9)];
  assign wire190 = $unsigned((~|{$signed(wire144)}));
  assign wire191 = wire16;
  assign wire192 = (wire90[(4'hd):(4'hc)] > $signed(wire135[(3'h4):(2'h3)]));
  assign wire193 = {$signed((^wire185)),
                       $unsigned(((reg142 ?
                           $signed((7'h40)) : (wire16 ?
                               reg143 : wire133)) & (wire190[(3'h4):(2'h3)] ?
                           wire88 : (~|reg187))))};
  assign wire194 = (~^$unsigned((~|$unsigned(wire185[(3'h4):(1'h1)]))));
endmodule

module module145
#(parameter param182 = (^~{(((~^(8'ha4)) >>> {(8'hb1), (8'ha8)}) != (((8'haa) != (8'hbe)) > ((8'hb4) ? (7'h44) : (8'hba)))), {(((7'h40) ? (8'hbb) : (8'had)) ? ((8'h9d) ? (7'h40) : (8'had)) : ((8'hb1) ? (8'hb7) : (8'hb7)))}}))
(y, clk, wire150, wire149, wire148, wire147, wire146);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire150;
  input wire signed [(5'h14):(1'h0)] wire149;
  input wire signed [(3'h5):(1'h0)] wire148;
  input wire signed [(5'h15):(1'h0)] wire147;
  input wire [(3'h7):(1'h0)] wire146;
  wire [(4'hb):(1'h0)] wire181;
  wire [(2'h3):(1'h0)] wire180;
  wire signed [(5'h10):(1'h0)] wire179;
  wire [(5'h14):(1'h0)] wire178;
  wire signed [(4'ha):(1'h0)] wire177;
  wire signed [(3'h7):(1'h0)] wire176;
  wire signed [(5'h13):(1'h0)] wire167;
  wire [(3'h6):(1'h0)] wire166;
  wire [(4'h8):(1'h0)] wire165;
  wire signed [(5'h15):(1'h0)] wire162;
  wire signed [(3'h4):(1'h0)] wire161;
  wire [(4'hf):(1'h0)] wire160;
  wire [(5'h12):(1'h0)] wire159;
  wire signed [(4'ha):(1'h0)] wire158;
  reg signed [(3'h5):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg174 = (1'h0);
  reg [(3'h4):(1'h0)] reg173 = (1'h0);
  reg [(2'h2):(1'h0)] reg172 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg170 = (1'h0);
  reg [(3'h7):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg168 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg163 = (1'h0);
  reg [(2'h3):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg156 = (1'h0);
  reg [(4'h8):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg154 = (1'h0);
  reg [(5'h15):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg151 = (1'h0);
  assign y = {wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire167,
                 wire166,
                 wire165,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg164,
                 reg163,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg151 <= (wire149[(4'hb):(1'h1)] ?
          wire149 : ($signed(((wire148 || (8'ha7)) ?
                  {wire146, wire147} : wire149)) ?
              ((!$signed(wire149)) ?
                  wire150[(5'h10):(4'he)] : wire149[(4'hf):(3'h4)]) : ({$unsigned(wire146),
                  ((8'h9e) ? wire147 : wire150)} & (8'h9c))));
      reg152 <= $signed((+{$unsigned((8'hbc)),
          ((~|wire149) ? wire148 : $unsigned((8'ha7)))}));
      reg153 <= (-wire150);
      if ($unsigned($signed($signed(((&wire149) ?
          {reg152, wire147} : reg153[(5'h10):(2'h3)])))))
        begin
          if (wire150)
            begin
              reg154 <= (wire147[(4'h8):(3'h7)] ?
                  ($signed($unsigned({wire150,
                      wire149})) != (~^({wire147} << $unsigned(reg153)))) : $signed(wire149[(2'h3):(2'h3)]));
              reg155 <= (&{((~|(reg153 ? wire148 : reg151)) ?
                      wire149[(2'h2):(2'h2)] : wire150[(2'h2):(1'h1)]),
                  $signed({(&reg151), wire148})});
              reg156 <= {((8'haf) <= (($signed(reg151) ?
                      $unsigned(wire150) : $signed(reg152)) && $unsigned(reg154)))};
              reg157 <= {reg156, $unsigned(reg151)};
            end
          else
            begin
              reg154 <= ($unsigned(($unsigned($unsigned(reg155)) ?
                      ($signed(reg151) < $signed(reg155)) : $signed((^reg155)))) ?
                  ({$signed((^~reg151))} ?
                      reg156 : (^~((^~reg151) ?
                          wire146 : $unsigned(reg156)))) : $unsigned(($unsigned($unsigned((8'hb9))) * reg153[(5'h15):(3'h6)])));
              reg155 <= wire148[(2'h3):(2'h2)];
              reg156 <= (($unsigned(wire146) ?
                  (($unsigned(wire150) ~^ (wire147 ? reg154 : (7'h40))) ?
                      $unsigned((+(8'had))) : (reg153[(4'hf):(4'ha)] - reg156)) : wire146[(3'h7):(3'h5)]) ^~ $unsigned(({$signed(reg152)} >>> (^~(wire147 <= reg156)))));
            end
        end
      else
        begin
          reg154 <= reg151[(4'he):(4'hd)];
          reg155 <= $unsigned(({$unsigned($signed(reg155))} - reg154[(3'h4):(2'h3)]));
        end
    end
  assign wire158 = reg151[(1'h0):(1'h0)];
  assign wire159 = $unsigned(reg157[(2'h2):(2'h2)]);
  assign wire160 = (($unsigned(reg154) <= ($signed($unsigned(reg151)) ?
                           $unsigned(wire150[(4'hb):(4'h9)]) : wire150)) ?
                       reg156 : $unsigned((8'hb3)));
  assign wire161 = $unsigned(((-$unsigned((-wire147))) <<< ((reg153 <<< (wire146 >> wire147)) ?
                       wire160[(3'h7):(2'h3)] : (^wire148))));
  assign wire162 = $signed(wire160[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg163 <= wire149[(4'hc):(4'ha)];
      reg164 <= (wire149[(4'he):(4'hb)] ?
          $unsigned(($unsigned(((8'ha0) ? (8'hb3) : wire149)) ?
              $signed(reg154) : reg163)) : $unsigned((wire160 >= $unsigned($signed((8'hbf))))));
    end
  assign wire165 = ((reg154 < $unsigned((7'h42))) ?
                       (~&$signed($unsigned(reg152))) : wire147);
  assign wire166 = $signed(reg156);
  assign wire167 = (8'ha5);
  always
    @(posedge clk) begin
      if ((wire162 == $signed(reg152)))
        begin
          if ((($unsigned(((&reg153) ?
                  $unsigned((8'ha4)) : (wire165 - reg153))) >>> $signed(($unsigned(reg156) >> reg152[(4'he):(4'he)]))) ?
              ($unsigned(((wire161 & wire161) << wire159)) - $unsigned($unsigned(wire161[(2'h2):(1'h0)]))) : $signed(wire149[(4'hc):(4'ha)])))
            begin
              reg168 <= $unsigned((^(8'hbf)));
              reg169 <= $unsigned((-(8'h9d)));
              reg170 <= wire167[(3'h4):(1'h1)];
            end
          else
            begin
              reg168 <= $unsigned(reg155[(1'h0):(1'h0)]);
              reg169 <= (wire159[(5'h10):(4'ha)] & $signed(reg152));
              reg170 <= reg155;
              reg171 <= (~|reg164);
              reg172 <= {(~&{reg168, ((wire147 * wire149) <= {reg164})}),
                  $unsigned($unsigned({$signed(reg154)}))};
            end
          reg173 <= {$unsigned(wire147), {reg152}};
        end
      else
        begin
          reg168 <= wire161[(1'h1):(1'h0)];
          if ({({$signed({reg172}), (7'h40)} || ((!(wire161 >> (8'h9f))) ?
                  wire166 : ({reg163, wire167} ? {wire146} : (!wire162)))),
              wire165[(2'h2):(2'h2)]})
            begin
              reg169 <= $unsigned($signed({(wire166 ?
                      (wire161 ? wire148 : (8'hb4)) : $signed(reg164)),
                  $unsigned(((8'ha4) >= wire146))}));
              reg170 <= ($unsigned((wire166 == wire146[(1'h0):(1'h0)])) >= reg169);
              reg171 <= {reg164[(1'h1):(1'h0)],
                  ($signed($signed(wire166[(1'h0):(1'h0)])) && (|(~^(^~reg171))))};
            end
          else
            begin
              reg169 <= reg173[(1'h0):(1'h0)];
              reg170 <= {reg173[(3'h4):(1'h0)],
                  {(((&reg156) ?
                          reg172[(2'h2):(1'h1)] : wire159[(1'h1):(1'h1)]) + reg157),
                      (+$unsigned((!(8'hbf))))}};
            end
          reg172 <= $unsigned((~|$unsigned(($unsigned(reg169) ~^ reg157[(1'h0):(1'h0)]))));
          reg173 <= {reg153[(4'hf):(1'h1)]};
          reg174 <= (!(wire161 ?
              ({wire150} || wire146) : reg157[(2'h2):(1'h1)]));
        end
      reg175 <= {{$signed(wire162[(4'ha):(1'h0)])},
          (wire166 ? (~|$unsigned((reg152 > reg156))) : reg155)};
    end
  assign wire176 = (reg173 ?
                       reg173[(2'h3):(2'h2)] : (reg168 ~^ {{(reg175 ?
                                   wire159 : wire159),
                               $unsigned((8'hb7))}}));
  assign wire177 = $unsigned($unsigned(wire165[(2'h3):(2'h3)]));
  assign wire178 = (&($unsigned(wire149) ?
                       (!$signed(wire146[(3'h5):(2'h3)])) : $signed(reg168)));
  assign wire179 = reg173[(1'h0):(1'h0)];
  assign wire180 = wire166;
  assign wire181 = $unsigned((wire147[(1'h0):(1'h0)] <= $unsigned(((7'h41) ?
                       wire179[(3'h6):(2'h3)] : (wire158 ?
                           wire179 : wire180)))));
endmodule

module module93  (y, clk, wire97, wire96, wire95, wire94);
  output wire [(32'h1c1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire97;
  input wire signed [(5'h14):(1'h0)] wire96;
  input wire [(3'h5):(1'h0)] wire95;
  input wire signed [(5'h13):(1'h0)] wire94;
  wire signed [(4'hb):(1'h0)] wire132;
  wire [(5'h10):(1'h0)] wire131;
  wire signed [(2'h3):(1'h0)] wire130;
  wire [(4'ha):(1'h0)] wire118;
  wire [(4'hb):(1'h0)] wire106;
  wire [(5'h15):(1'h0)] wire105;
  wire [(4'ha):(1'h0)] wire104;
  wire [(4'he):(1'h0)] wire100;
  wire signed [(4'he):(1'h0)] wire99;
  wire [(5'h14):(1'h0)] wire98;
  reg [(5'h14):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg126 = (1'h0);
  reg [(5'h10):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg120 = (1'h0);
  reg [(4'he):(1'h0)] reg119 = (1'h0);
  reg [(4'he):(1'h0)] reg117 = (1'h0);
  reg [(5'h12):(1'h0)] reg116 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg112 = (1'h0);
  reg [(5'h10):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(4'he):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg101 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire118,
                 wire106,
                 wire105,
                 wire104,
                 wire100,
                 wire99,
                 wire98,
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
                 reg103,
                 reg102,
                 reg101,
                 (1'h0)};
  assign wire98 = {$unsigned(($signed((^~wire94)) ^ ((wire95 | wire96) ?
                          ((8'hbe) ? wire97 : wire96) : ((8'hbb) != wire96)))),
                      {$signed(wire96)}};
  assign wire99 = (^~($unsigned($unsigned(wire97)) ^ ({wire94} ?
                      wire97 : (+(wire94 ? wire94 : wire95)))));
  assign wire100 = ((wire98[(4'hd):(4'ha)] ^~ wire99) & $unsigned(wire98[(4'h9):(3'h7)]));
  always
    @(posedge clk) begin
      reg101 <= (!(8'hbd));
      reg102 <= wire97;
      reg103 <= (-(wire97[(1'h0):(1'h0)] ?
          {((wire96 ? wire97 : (8'hb0)) ?
                  $unsigned(wire94) : (wire94 <<< reg101)),
              (reg101[(3'h4):(2'h3)] ?
                  wire96[(4'he):(4'h9)] : reg101[(1'h0):(1'h0)])} : ($signed((!wire96)) | $signed($unsigned(wire97)))));
    end
  assign wire104 = (reg101[(1'h1):(1'h0)] ?
                       ($unsigned(wire96[(5'h10):(1'h1)]) ?
                           (wire96[(3'h6):(2'h3)] ?
                               ($signed(wire95) ?
                                   ((7'h43) || (8'h9e)) : wire97[(2'h3):(2'h2)]) : $signed({reg101})) : $signed(($signed((8'hba)) ?
                               $unsigned((8'haa)) : $signed(wire95)))) : reg103);
  assign wire105 = (^(wire100 ?
                       $unsigned($unsigned((wire96 ?
                           wire98 : wire95))) : (wire96[(4'hf):(4'hc)] > $unsigned(wire100))));
  assign wire106 = {($signed(((-wire98) & $signed(wire97))) ?
                           ($unsigned($unsigned(wire94)) <= (~|reg102[(2'h3):(1'h0)])) : wire100[(4'hb):(4'hb)])};
  always
    @(posedge clk) begin
      reg107 <= ({(~|wire97),
              (wire104[(4'ha):(3'h5)] ? wire106 : ((-reg103) * (|wire106)))} ?
          (&$unsigned($unsigned(wire106))) : (&{($unsigned(wire96) ?
                  $signed(wire104) : (~wire97))}));
      reg108 <= ((-$unsigned(wire96[(3'h4):(1'h0)])) ?
          reg102 : ($signed((~|$unsigned(wire100))) ?
              reg101[(2'h2):(2'h2)] : ((((8'hbd) == wire99) + wire105[(3'h7):(3'h4)]) + $signed(wire100[(2'h3):(1'h0)]))));
      if (($unsigned(((wire104[(4'ha):(3'h6)] | reg102) ?
              $unsigned($signed(reg101)) : ($unsigned(reg108) ?
                  wire94[(5'h11):(1'h1)] : wire100[(4'hb):(1'h1)]))) ?
          $unsigned((reg103 != (wire105 != $unsigned(wire95)))) : wire99[(1'h0):(1'h0)]))
        begin
          reg109 <= wire98[(5'h12):(5'h11)];
          reg110 <= $unsigned(((^reg103[(3'h7):(3'h5)]) ?
              $unsigned((~wire94)) : ((8'ha5) + $unsigned((wire104 ?
                  (8'ha1) : wire97)))));
          reg111 <= wire105;
        end
      else
        begin
          reg109 <= $unsigned(wire100);
          if ((((|reg103[(3'h6):(1'h0)]) ?
              (^wire104[(4'h9):(1'h0)]) : $unsigned($unsigned((^~wire96)))) & (^~$unsigned(($unsigned(wire98) ?
              wire104[(4'h8):(3'h6)] : {wire94})))))
            begin
              reg110 <= (~^(($signed((+wire99)) || reg109[(3'h7):(3'h4)]) <<< (!(^~$unsigned(reg102)))));
              reg111 <= reg109[(2'h2):(1'h0)];
              reg112 <= wire97;
              reg113 <= $signed((7'h44));
            end
          else
            begin
              reg110 <= (^(($signed((reg108 != (8'haf))) ?
                  $unsigned(wire96[(4'ha):(1'h0)]) : ((|wire100) & ((8'ha4) ?
                      (7'h41) : (7'h44)))) != {$unsigned($unsigned(reg107)),
                  {(~|wire98), (~^(8'hb2))}}));
              reg111 <= (^$unsigned(reg109[(4'h9):(1'h1)]));
              reg112 <= wire96;
              reg113 <= ((^~reg103[(3'h5):(2'h3)]) ^~ $unsigned(reg103));
              reg114 <= reg112;
            end
          if (($unsigned(wire95) * ({((reg103 ? wire98 : reg102) ?
                  reg110[(4'ha):(4'ha)] : (wire99 - wire105))} ~^ {reg111[(1'h0):(1'h0)]})))
            begin
              reg115 <= reg114;
              reg116 <= $unsigned(wire94[(1'h0):(1'h0)]);
              reg117 <= reg108[(1'h0):(1'h0)];
            end
          else
            begin
              reg115 <= $unsigned(wire95[(2'h3):(2'h2)]);
              reg116 <= (reg117[(4'hc):(4'h8)] || {wire104[(3'h5):(2'h3)],
                  wire98[(2'h2):(1'h1)]});
            end
        end
    end
  assign wire118 = (reg101[(3'h5):(2'h3)] ?
                       $signed($unsigned($unsigned((+(8'hbc))))) : $signed({{(reg107 ?
                                   reg112 : (8'hba))}}));
  always
    @(posedge clk) begin
      reg119 <= wire100[(1'h0):(1'h0)];
      if (reg116)
        begin
          reg120 <= ($unsigned({$signed($unsigned((8'hb6)))}) | ((wire97[(1'h1):(1'h0)] ?
              ({reg117} ?
                  (~(8'ha4)) : $unsigned(reg116)) : $unsigned($signed((8'hb4)))) << (wire104 == reg103[(2'h3):(2'h2)])));
        end
      else
        begin
          reg120 <= ((8'h9f) - ({((wire100 >> wire94) ?
                      wire118[(1'h1):(1'h1)] : $unsigned((7'h41))),
                  $unsigned(wire118[(3'h6):(2'h2)])} ?
              ((|wire94[(3'h4):(2'h2)]) ^ ((reg101 | wire98) ?
                  (~|reg116) : ((8'haf) ?
                      reg116 : (8'ha5)))) : $signed((reg119[(1'h0):(1'h0)] ?
                  ((8'ha0) * wire100) : wire100))));
          reg121 <= ($unsigned(wire95) ? reg108[(3'h6):(2'h3)] : (-reg108));
          if ((reg107 >= reg101))
            begin
              reg122 <= $signed(($signed(($signed(reg109) + $unsigned(reg110))) ?
                  (($unsigned(reg116) ?
                          ((8'hbc) ? reg111 : wire106) : $signed((8'haa))) ?
                      reg121[(2'h3):(2'h3)] : $signed((reg117 * (8'h9d)))) : {{(wire96 ?
                              wire105 : wire97)},
                      wire97}));
              reg123 <= (8'hb5);
            end
          else
            begin
              reg122 <= $signed($unsigned((wire100[(2'h3):(1'h0)] ?
                  $signed({reg102, reg110}) : (|reg111[(3'h4):(3'h4)]))));
              reg123 <= (((8'hb1) != $unsigned(wire100)) ?
                  $signed((&({(8'ha8), (8'hba)} ?
                      (+reg120) : (reg111 != reg102)))) : $unsigned($signed(($unsigned(reg117) ?
                      (reg112 <<< reg113) : $signed((8'hb0))))));
              reg124 <= (8'h9e);
            end
          if (wire98[(5'h13):(4'hd)])
            begin
              reg125 <= ((reg101 <<< (reg124[(5'h11):(3'h7)] | (reg110[(3'h7):(3'h7)] ?
                  {wire96, wire104} : $unsigned(wire104)))) ^~ (8'ha9));
              reg126 <= $unsigned(($unsigned($signed((-reg117))) >= (reg123[(4'hb):(4'h9)] ?
                  $signed((reg110 ? wire106 : reg114)) : ($unsigned((8'h9f)) ?
                      $signed(reg111) : wire104[(1'h0):(1'h0)]))));
              reg127 <= $unsigned($unsigned($signed(reg110[(1'h1):(1'h0)])));
            end
          else
            begin
              reg125 <= $signed(($unsigned($signed((8'ha2))) <<< (($signed(reg107) ?
                  (wire100 ? reg113 : wire105) : {(8'hb8),
                      reg102}) * ((&reg109) ?
                  (reg117 ? reg107 : reg111) : reg113[(2'h2):(2'h2)]))));
              reg126 <= (~$signed(reg116));
              reg127 <= reg117[(4'hb):(4'ha)];
              reg128 <= (reg123 ?
                  ($signed(({reg110, reg109} <<< wire106[(4'hb):(3'h4)])) ?
                      reg122 : (|(-reg112))) : {({reg122,
                          reg111[(2'h2):(1'h1)]} < $unsigned((reg101 ?
                          reg125 : wire106))),
                      ($signed((reg110 ? wire95 : (8'h9c))) ?
                          reg124 : {{wire105, reg109}})});
            end
          reg129 <= $unsigned(reg116[(3'h4):(1'h1)]);
        end
    end
  assign wire130 = reg110;
  assign wire131 = wire98[(5'h12):(4'he)];
  assign wire132 = {$signed($unsigned(wire100)),
                       (^~($signed($signed(reg122)) ?
                           reg120 : ({reg116} <<< (reg109 >> reg112))))};
endmodule

module module66
#(parameter param87 = {(((((8'hac) >> (8'hbc)) ? ((8'hbe) ? (8'ha7) : (8'h9e)) : ((8'ha0) ~^ (7'h44))) ? ((&(8'hbe)) ? ((8'hb1) ? (8'ha5) : (8'hba)) : (!(8'hb9))) : (-(!(8'hb7)))) == ({((8'ha9) << (8'hac))} ? ((^(8'ha0)) < {(8'haf), (8'hac)}) : (8'had)))})
(y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire70;
  input wire signed [(5'h10):(1'h0)] wire69;
  input wire [(5'h13):(1'h0)] wire68;
  input wire [(5'h11):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire83;
  wire [(4'hf):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire81;
  wire signed [(4'h9):(1'h0)] wire80;
  wire signed [(4'hd):(1'h0)] wire79;
  wire [(5'h15):(1'h0)] wire78;
  wire [(2'h3):(1'h0)] wire76;
  wire [(2'h2):(1'h0)] wire75;
  wire signed [(2'h2):(1'h0)] wire74;
  wire [(3'h4):(1'h0)] wire73;
  wire signed [(4'hb):(1'h0)] wire72;
  wire signed [(4'hc):(1'h0)] wire71;
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 reg86,
                 reg85,
                 reg77,
                 (1'h0)};
  assign wire71 = ((8'ha2) | $signed(($signed($unsigned(wire68)) ?
                      ((wire67 ^ wire70) ?
                          wire67 : $unsigned(wire70)) : wire70)));
  assign wire72 = wire68[(3'h6):(2'h2)];
  assign wire73 = wire71[(4'h9):(3'h7)];
  assign wire74 = ($signed(($signed((~^wire68)) ?
                          {wire69[(1'h1):(1'h1)],
                              ((8'ha1) ~^ wire69)} : ((|wire73) ?
                              (8'had) : wire68))) ?
                      wire68[(2'h3):(1'h1)] : wire67[(4'ha):(1'h0)]);
  assign wire75 = wire73;
  assign wire76 = wire73;
  always
    @(posedge clk) begin
      reg77 <= (&(((^$unsigned(wire76)) ?
          wire67[(4'h8):(2'h2)] : wire72[(3'h7):(1'h0)]) != $signed($unsigned((8'hbc)))));
    end
  assign wire78 = $unsigned($signed($unsigned(wire72)));
  assign wire79 = $unsigned($unsigned(wire72));
  assign wire80 = {((((wire78 * (8'ha7)) | $unsigned(wire68)) & ((wire70 << wire72) >> $unsigned(wire67))) ?
                          $unsigned($unsigned((wire73 ?
                              wire76 : wire70))) : ($unsigned((reg77 > wire74)) ?
                              wire74 : ($unsigned(reg77) ^~ $unsigned(reg77)))),
                      (~|$signed((wire72[(4'h9):(3'h7)] >>> $signed(wire79))))};
  assign wire81 = (wire68[(5'h10):(4'hd)] ?
                      $signed((((reg77 - wire79) > (wire72 && wire79)) ?
                          $signed($signed(wire73)) : $signed($signed(wire68)))) : wire67[(4'hf):(4'hc)]);
  assign wire82 = $signed((&{(!(wire81 <<< wire67)),
                      (-(wire69 ? wire75 : wire72))}));
  assign wire83 = ($signed((wire68[(4'h9):(2'h2)] ?
                      wire70[(3'h7):(3'h4)] : wire68[(4'ha):(4'h9)])) * wire71[(3'h6):(3'h5)]);
  assign wire84 = (wire80 ?
                      (((~|(~&wire80)) || $signed($unsigned(wire82))) ?
                          ($signed((wire67 + wire80)) <<< $unsigned(wire75)) : (&(~&(wire80 <<< wire80)))) : $unsigned($unsigned(wire80[(4'h8):(4'h8)])));
  always
    @(posedge clk) begin
      reg85 <= $signed((~((~^wire68) - $signed((wire72 ^~ wire72)))));
      reg86 <= (~|$unsigned(((~|((8'hb4) >> (8'ha2))) ?
          (wire68[(5'h13):(4'hf)] == (^~wire72)) : ((~wire83) + (wire84 ?
              (8'hb3) : wire80)))));
    end
endmodule

module module18  (y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h194):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire23;
  input wire [(5'h10):(1'h0)] wire22;
  input wire signed [(3'h6):(1'h0)] wire21;
  input wire [(4'hb):(1'h0)] wire20;
  input wire [(3'h7):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire [(3'h5):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire38;
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire55,
                 wire52,
                 wire38,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg54,
                 reg53,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg24 <= wire21[(1'h0):(1'h0)];
      reg25 <= reg24[(4'h8):(2'h2)];
      reg26 <= $signed($signed((wire23[(2'h2):(1'h1)] && $signed((wire21 ^~ wire21)))));
    end
  always
    @(posedge clk) begin
      reg27 <= (|($signed($unsigned((~^wire19))) ?
          $unsigned({{reg26}}) : (!wire22[(4'h9):(4'h8)])));
      if ($signed(reg24))
        begin
          reg28 <= wire20[(4'h8):(3'h7)];
          if ((-$signed((|((~^reg27) ? $signed(wire19) : $unsigned(reg27))))))
            begin
              reg29 <= $signed(((^~({reg26} ?
                  $unsigned((8'hbb)) : {reg28})) == $unsigned({((8'ha1) ?
                      wire19 : reg25),
                  ((8'hb4) ^~ reg26)})));
              reg30 <= $signed(wire20[(2'h3):(2'h2)]);
            end
          else
            begin
              reg29 <= reg28[(1'h1):(1'h0)];
            end
        end
      else
        begin
          reg28 <= $unsigned(($unsigned($unsigned($signed(reg27))) <= (^reg26[(3'h6):(3'h5)])));
        end
      if (reg27)
        begin
          reg31 <= (8'ha8);
          if ($unsigned((wire22 != wire21[(3'h6):(2'h3)])))
            begin
              reg32 <= (~^(~^$signed($signed(reg25))));
              reg33 <= wire20[(1'h0):(1'h0)];
            end
          else
            begin
              reg32 <= $unsigned($signed((reg29 != (^~reg33[(1'h0):(1'h0)]))));
              reg33 <= reg33;
              reg34 <= {(-(^~((reg24 >= wire21) ?
                      ((8'hb0) ^~ reg33) : (reg33 + reg31))))};
            end
        end
      else
        begin
          if (reg28[(2'h2):(1'h1)])
            begin
              reg31 <= (reg26[(3'h4):(2'h3)] <= $signed(({reg31[(4'hb):(4'h8)]} ?
                  (~|wire22) : ($signed(wire22) * (!wire19)))));
              reg32 <= (reg27[(4'h9):(4'h8)] >= $unsigned($unsigned(((+reg24) ?
                  reg26[(1'h0):(1'h0)] : $signed((8'hb0))))));
              reg33 <= ($unsigned((((reg31 * reg32) >>> (reg28 ~^ reg33)) ?
                  $signed(wire22[(3'h7):(1'h1)]) : reg25)) - reg26[(3'h6):(3'h4)]);
              reg34 <= (wire20 || reg27);
              reg35 <= (reg31 ?
                  (~^$unsigned(((wire23 - (8'ha1)) - reg30[(2'h2):(2'h2)]))) : $signed(wire22));
            end
          else
            begin
              reg31 <= (reg34 > (^$signed($signed({wire23, reg26}))));
              reg32 <= (+reg24);
              reg33 <= $unsigned({$unsigned(((reg35 ^~ reg27) >= $signed(reg26))),
                  ((((8'ha1) ?
                      reg31 : reg32) < $signed((8'hbb))) != (+$unsigned(reg26)))});
            end
          reg36 <= $unsigned(reg25[(4'h8):(3'h7)]);
        end
      reg37 <= ((~&({$signed(reg34), (reg29 ? reg35 : reg36)} ?
              (-(reg31 ^ reg32)) : {(reg33 ? reg33 : reg36)})) ?
          (8'hb9) : reg35);
    end
  assign wire38 = reg28;
  always
    @(posedge clk) begin
      reg39 <= $unsigned((^~(|((reg27 == wire23) ?
          (reg30 * reg37) : (reg27 > wire38)))));
      reg40 <= reg24;
      if ((reg35 ?
          {({(wire20 ^~ reg35), $signed(reg40)} >> reg37[(3'h6):(3'h6)]),
              $signed($unsigned(((8'ha8) ?
                  wire20 : wire19)))} : {reg31[(4'hc):(2'h2)],
              $unsigned(reg27[(3'h6):(2'h3)])}))
        begin
          reg41 <= wire20[(3'h4):(3'h4)];
          reg42 <= ((((!((8'ha8) ~^ reg33)) ?
                  ($signed(wire22) > wire23[(2'h2):(1'h0)]) : (reg31 ^ $unsigned(reg31))) ?
              (reg29[(3'h5):(1'h1)] ^~ ({reg37, wire22} ?
                  $signed(wire21) : {(8'haf),
                      (8'haa)})) : $unsigned(($signed(reg39) ^~ reg28))) ^~ $signed(($signed($unsigned(reg34)) ?
              (~&(~&(8'h9c))) : (wire21[(3'h4):(2'h3)] ^~ reg28))));
          if (reg27)
            begin
              reg43 <= reg34;
              reg44 <= ((~(reg25[(3'h7):(2'h3)] ?
                  reg41 : reg40[(1'h0):(1'h0)])) >>> $unsigned($signed((+reg42))));
              reg45 <= (reg24[(3'h6):(1'h1)] >> wire23);
            end
          else
            begin
              reg43 <= ($unsigned($signed(((reg37 != wire19) ?
                  $unsigned(reg37) : $unsigned(reg27)))) * ((reg43[(1'h1):(1'h0)] >= ($unsigned(reg41) ?
                      (wire38 ? reg36 : reg24) : $signed(wire21))) ?
                  ($signed((reg24 >= reg42)) == {(^reg43),
                      reg35}) : $unsigned(reg44)));
              reg44 <= reg43[(4'h8):(3'h5)];
              reg45 <= (($signed(((^reg33) >> $signed((7'h44)))) ?
                  (reg41 & $unsigned($signed(reg30))) : wire20) <= $signed({((reg39 ?
                          reg37 : reg32) ?
                      reg35[(4'h8):(3'h4)] : ((8'had) ? wire38 : reg26)),
                  reg40}));
              reg46 <= reg28[(1'h1):(1'h0)];
            end
        end
      else
        begin
          reg41 <= reg41[(1'h0):(1'h0)];
          reg42 <= reg41;
          reg43 <= wire20[(4'hb):(2'h2)];
          reg44 <= (&($unsigned(reg46[(4'hd):(4'hc)]) ?
              (+reg35) : (reg24 ?
                  {$unsigned(reg31)} : $unsigned($signed(reg35)))));
          reg45 <= $unsigned(((wire19[(3'h6):(3'h4)] ?
                  wire22 : wire19[(3'h7):(3'h7)]) ?
              $signed((~^(reg45 * reg39))) : reg34[(5'h13):(5'h12)]));
        end
      reg47 <= $unsigned($signed({$signed((8'hb8))}));
      if ($unsigned((~|$unsigned(reg44))))
        begin
          reg48 <= $unsigned($unsigned(reg46));
          reg49 <= ($signed((|((~(8'hbe)) << $signed((8'hba))))) << (reg40 == $unsigned($signed($unsigned((8'hb5))))));
        end
      else
        begin
          reg48 <= (~^wire20[(3'h6):(3'h5)]);
          reg49 <= (^~wire22[(3'h6):(3'h4)]);
          reg50 <= $unsigned({$signed(((reg39 ?
                  reg34 : (8'hab)) <= reg33[(1'h1):(1'h0)]))});
          reg51 <= (({((-(8'hae)) & $signed(reg35)),
              reg31[(4'hb):(2'h3)]} ^~ $unsigned({$signed(reg25),
              reg30[(4'ha):(2'h2)]})) <<< wire21);
        end
    end
  assign wire52 = ($signed(reg45[(4'h8):(3'h4)]) == $signed($signed(reg42)));
  always
    @(posedge clk) begin
      reg53 <= ($unsigned((|($unsigned(reg40) ?
          (8'h9e) : (reg42 | reg33)))) | reg45);
      reg54 <= $unsigned(reg43[(2'h3):(2'h3)]);
    end
  assign wire55 = (({reg41[(1'h1):(1'h1)],
                          ((wire52 ? reg46 : reg51) != (reg35 ?
                              reg32 : reg37))} ?
                      reg30[(4'hb):(2'h3)] : (((!reg26) ~^ {reg27, reg28}) ?
                          {(reg40 ^ reg34), (reg42 ? reg40 : reg54)} : {(reg25 ?
                                  reg46 : reg43)})) << $signed((reg29[(1'h1):(1'h1)] ?
                      $signed($unsigned(wire19)) : (wire21[(3'h4):(2'h3)] ?
                          (reg51 ? wire22 : reg45) : $unsigned(wire20)))));
  always
    @(posedge clk) begin
      reg56 <= (~&{reg30[(4'hb):(2'h3)]});
      reg57 <= reg43;
      reg58 <= (!($signed($unsigned($unsigned(reg37))) ?
          (-reg56[(2'h3):(1'h1)]) : (+(+$signed(wire19)))));
      reg59 <= reg40[(3'h5):(2'h3)];
      reg60 <= $unsigned(reg34);
    end
  assign wire61 = reg59[(1'h0):(1'h0)];
  assign wire62 = $signed(wire52[(1'h0):(1'h0)]);
endmodule
