module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h20a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire130;
  wire signed [(4'hf):(1'h0)] wire132;
  wire [(5'h12):(1'h0)] wire133;
  wire signed [(4'he):(1'h0)] wire134;
  wire [(5'h10):(1'h0)] wire135;
  wire signed [(4'hf):(1'h0)] wire136;
  wire [(4'hf):(1'h0)] wire249;
  wire [(3'h7):(1'h0)] wire251;
  wire signed [(4'hd):(1'h0)] wire259;
  wire [(2'h3):(1'h0)] wire261;
  wire signed [(4'hb):(1'h0)] wire262;
  wire [(4'ha):(1'h0)] wire263;
  wire signed [(4'ha):(1'h0)] wire265;
  wire [(3'h6):(1'h0)] wire268;
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg138 = (1'h0);
  reg [(5'h10):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg140 = (1'h0);
  reg [(2'h2):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg142 = (1'h0);
  reg [(3'h7):(1'h0)] reg143 = (1'h0);
  reg [(5'h10):(1'h0)] reg144 = (1'h0);
  reg [(5'h10):(1'h0)] reg145 = (1'h0);
  reg [(2'h3):(1'h0)] reg146 = (1'h0);
  reg [(5'h10):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg148 = (1'h0);
  reg [(4'h8):(1'h0)] reg252 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg253 = (1'h0);
  reg [(3'h7):(1'h0)] reg254 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg255 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg256 = (1'h0);
  reg [(5'h15):(1'h0)] reg257 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg258 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg266 = (1'h0);
  reg [(3'h6):(1'h0)] reg267 = (1'h0);
  assign y = {wire5,
                 wire11,
                 wire130,
                 wire132,
                 wire133,
                 wire134,
                 wire135,
                 wire136,
                 wire249,
                 wire251,
                 wire259,
                 wire261,
                 wire262,
                 wire263,
                 wire265,
                 wire268,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg137,
                 reg138,
                 reg139,
                 reg140,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg252,
                 reg253,
                 reg254,
                 reg255,
                 reg256,
                 reg257,
                 reg258,
                 reg266,
                 reg267,
                 (1'h0)};
  assign wire5 = {(!(wire3 || (wire1 < wire1))),
                     (wire2[(4'hf):(2'h3)] ^~ (wire0 >> ($unsigned(wire2) + wire1[(2'h2):(1'h1)])))};
  always
    @(posedge clk) begin
      reg6 <= $signed(wire4);
      reg7 <= $unsigned(reg6[(3'h4):(2'h2)]);
      reg8 <= wire2;
    end
  always
    @(posedge clk) begin
      reg9 <= ((~&$signed((reg6[(1'h0):(1'h0)] ?
          wire1[(2'h2):(2'h2)] : (wire4 | (8'hbe))))) != $unsigned({wire0[(3'h6):(3'h5)],
          $unsigned(((8'hbb) - wire0))}));
      reg10 <= wire3;
    end
  assign wire11 = (~^{reg6});
  module12 #() modinst131 (.wire14(wire5), .clk(clk), .y(wire130), .wire13(wire3), .wire15(reg7), .wire16(reg9));
  assign wire132 = (+wire130[(4'he):(4'ha)]);
  assign wire133 = wire4;
  assign wire134 = (~&(wire4 ?
                       {((~|wire5) << ((7'h40) ? reg9 : reg10)),
                           wire5} : (!({(8'haf)} != $unsigned(wire130)))));
  assign wire135 = ($signed(wire132) ? wire0 : (8'ha4));
  assign wire136 = (~(($signed($unsigned((8'hbc))) >= $signed((reg8 ?
                       (8'ha0) : reg9))) > (^{wire11})));
  always
    @(posedge clk) begin
      if ({(~&(^wire1))})
        begin
          if ((&$unsigned((wire11 ?
              (+(reg6 - wire133)) : ((wire136 ?
                  (8'ha1) : (8'ha2)) || (wire11 + wire135))))))
            begin
              reg137 <= ($signed($signed($unsigned((wire1 ? reg6 : reg8)))) ?
                  (^(((&reg7) ?
                      (reg8 << wire3) : wire2[(4'h9):(1'h0)]) + (~|$signed(wire1)))) : (8'hbc));
            end
          else
            begin
              reg137 <= $unsigned((|(wire132 || (~&reg10[(3'h6):(3'h4)]))));
              reg138 <= ($unsigned({wire134[(3'h4):(2'h2)]}) != $unsigned(reg6));
              reg139 <= reg8[(2'h3):(2'h3)];
              reg140 <= wire2;
              reg141 <= wire3;
            end
          reg142 <= (~|((+(~|(reg141 << (8'hb0)))) * reg138));
          reg143 <= wire2[(4'h8):(3'h5)];
          reg144 <= ($unsigned(wire11[(4'h8):(4'h8)]) >= ((|reg138) == {reg9}));
        end
      else
        begin
          if ((((wire136 ? reg144[(3'h6):(3'h6)] : {((8'hb2) << wire2)}) ?
                  (~^$unsigned((!reg143))) : (($unsigned(reg6) || (~|wire11)) || $signed($signed((8'hab))))) ?
              reg139[(4'h8):(3'h5)] : wire133))
            begin
              reg137 <= ((~^(^~((~^(8'hbc)) ? ((7'h43) + reg9) : (8'hb3)))) ?
                  reg7 : $signed(wire136[(1'h1):(1'h1)]));
            end
          else
            begin
              reg137 <= wire133;
              reg138 <= (~&({((~wire2) ? wire4[(3'h6):(2'h2)] : $signed(wire4)),
                  wire2} + $unsigned((8'ha6))));
              reg139 <= ($unsigned({(~&reg6)}) - wire11[(3'h5):(2'h3)]);
              reg140 <= wire133[(4'hc):(3'h5)];
            end
          reg141 <= ($signed((^({wire2} * (!reg144)))) ?
              {$unsigned((wire1 == $signed(reg142))),
                  $unsigned(reg141)} : $signed(reg144));
          reg142 <= $signed({((reg137 << (reg142 * wire2)) ?
                  (reg6[(4'h8):(2'h3)] ?
                      (reg7 || wire130) : wire130) : $unsigned(wire5[(4'hd):(3'h7)])),
              (~$signed((&wire0)))});
        end
      reg145 <= $unsigned($signed(wire5));
      reg146 <= wire130;
      reg147 <= wire3[(3'h4):(2'h3)];
      reg148 <= reg140[(4'h9):(3'h5)];
    end
  module149 #() modinst250 (.wire150(wire136), .clk(clk), .wire152(reg147), .y(wire249), .wire153(wire5), .wire151(reg143));
  assign wire251 = (|(&$unsigned((~^(wire1 ? reg10 : reg145)))));
  always
    @(posedge clk) begin
      reg252 <= $unsigned((reg6[(5'h10):(1'h1)] < (^~((wire134 | reg139) ?
          (wire251 ^~ wire2) : (wire133 ? wire11 : (8'hb0))))));
      reg253 <= wire136[(4'h8):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg254 <= ($unsigned(wire11[(4'h8):(4'h8)]) ?
          (reg9[(4'hb):(4'ha)] != reg139[(4'he):(4'ha)]) : ((reg141[(2'h2):(1'h0)] + reg10[(3'h5):(3'h4)]) ?
              wire133[(2'h3):(2'h2)] : (($signed((8'ha9)) != reg144) < ((~^reg147) <<< $signed(reg141)))));
      reg255 <= {$unsigned($unsigned((wire134[(1'h1):(1'h0)] && reg254[(1'h1):(1'h1)])))};
      reg256 <= (!reg143);
      reg257 <= ({$signed((8'hbd)),
          wire136[(4'he):(1'h1)]} >= reg255[(4'he):(2'h2)]);
      reg258 <= reg143[(1'h1):(1'h0)];
    end
  module171 #() modinst260 (wire259, clk, wire5, reg255, reg148, wire134);
  assign wire261 = ((reg139 ? $unsigned(wire133) : $unsigned((+(8'ha9)))) ?
                       ($unsigned(reg8) <<< $unsigned(((^wire136) ?
                           (wire2 >> wire4) : $unsigned((8'h9e))))) : $unsigned($signed((^~$unsigned((7'h42))))));
  assign wire262 = (wire4[(4'hf):(4'hb)] ?
                       (|(^$signed((wire5 ~^ reg147)))) : ($signed(reg6[(4'hc):(3'h5)]) ?
                           $unsigned($signed(reg140[(3'h4):(2'h2)])) : (|$unsigned({wire130}))));
  module61 #() modinst264 (.y(wire263), .wire64(reg254), .clk(clk), .wire63(reg6), .wire62(reg8), .wire65(reg256));
  assign wire265 = $unsigned($signed($unsigned($unsigned((^~reg253)))));
  always
    @(posedge clk) begin
      reg266 <= $signed(wire130[(4'h8):(4'h8)]);
      reg267 <= (|$unsigned($signed(((-wire2) ^~ reg144[(4'hd):(4'ha)]))));
    end
  module149 #() modinst269 (.wire153(reg255), .clk(clk), .wire152(reg147), .wire151(reg139), .y(wire268), .wire150(wire132));
endmodule

module module149  (y, clk, wire153, wire152, wire151, wire150);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire153;
  input wire [(4'hb):(1'h0)] wire152;
  input wire signed [(3'h7):(1'h0)] wire151;
  input wire signed [(4'hf):(1'h0)] wire150;
  wire signed [(2'h3):(1'h0)] wire248;
  wire [(4'h9):(1'h0)] wire247;
  wire signed [(4'he):(1'h0)] wire246;
  wire signed [(4'hd):(1'h0)] wire244;
  wire [(5'h13):(1'h0)] wire224;
  wire [(5'h10):(1'h0)] wire170;
  wire [(4'hc):(1'h0)] wire167;
  wire [(4'hf):(1'h0)] wire164;
  wire [(3'h6):(1'h0)] wire163;
  wire [(4'he):(1'h0)] wire159;
  wire [(4'ha):(1'h0)] wire158;
  wire signed [(3'h5):(1'h0)] wire157;
  wire [(4'hc):(1'h0)] wire156;
  wire [(4'hd):(1'h0)] wire155;
  wire signed [(4'he):(1'h0)] wire154;
  reg signed [(3'h6):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg161 = (1'h0);
  reg [(5'h15):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg165 = (1'h0);
  reg [(5'h11):(1'h0)] reg166 = (1'h0);
  reg [(5'h15):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg169 = (1'h0);
  assign y = {wire248,
                 wire247,
                 wire246,
                 wire244,
                 wire224,
                 wire170,
                 wire167,
                 wire164,
                 wire163,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 reg160,
                 reg161,
                 reg162,
                 reg165,
                 reg166,
                 reg168,
                 reg169,
                 (1'h0)};
  assign wire154 = wire152;
  assign wire155 = (wire150[(4'hf):(4'h8)] >> {(({wire152} ?
                           (|wire152) : ((7'h41) ^~ wire154)) >= wire152)});
  assign wire156 = (($signed((wire154 ?
                           (wire154 && (7'h44)) : (|wire153))) == $signed($signed(wire150))) ?
                       $unsigned((({wire152, wire152} ?
                           (wire153 ?
                               (8'hb8) : wire150) : wire151) ^ ((wire155 ?
                           wire154 : wire150) && (wire151 ?
                           wire155 : wire154)))) : $signed(wire155));
  assign wire157 = (~^(($signed((~wire153)) ?
                       (wire152 - (+(8'hbb))) : $signed($unsigned((8'hb8)))) > {((wire155 ?
                           wire153 : wire153) <<< (wire150 < wire150)),
                       $signed((^wire150))}));
  assign wire158 = {wire154};
  assign wire159 = (!(&wire153[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      reg160 <= {wire157, $signed($unsigned((wire150 & $signed(wire152))))};
      reg161 <= wire153;
      reg162 <= wire159;
    end
  assign wire163 = $signed(((({wire151} != $unsigned(wire150)) ?
                           $signed($unsigned(wire151)) : ($unsigned(wire152) && wire153[(3'h5):(3'h5)])) ?
                       $signed(($signed(reg160) ?
                           (~|reg162) : (8'hb2))) : wire155[(4'h9):(2'h2)]));
  assign wire164 = (-{$signed(wire151)});
  always
    @(posedge clk) begin
      reg165 <= reg160;
      reg166 <= (wire152[(3'h6):(1'h1)] ? reg162[(5'h13):(5'h12)] : wire154);
    end
  assign wire167 = ((($unsigned((wire163 > wire154)) | (^reg166[(5'h11):(5'h11)])) || (({reg165} < (~^(8'h9c))) ?
                           ($unsigned(wire153) ^ wire159) : wire155)) ?
                       {(^(-(reg160 ^ wire157)))} : (wire153[(5'h10):(4'he)] ?
                           wire153 : ((wire163 && $unsigned(wire155)) ?
                               reg166[(4'hb):(3'h5)] : (8'hbc))));
  always
    @(posedge clk) begin
      reg168 <= $signed(reg160[(3'h5):(3'h4)]);
      reg169 <= ({$signed(reg161[(2'h2):(1'h0)])} ?
          ($signed((&$unsigned(reg166))) ^ ({(wire153 ?
                  wire163 : (8'hb6))} >> (+reg162[(4'hf):(4'hb)]))) : $unsigned(wire159[(1'h1):(1'h1)]));
    end
  assign wire170 = $unsigned($signed(($signed((&reg162)) ?
                       ({reg166} ^~ (wire155 && reg160)) : $unsigned((reg166 ?
                           (8'ha1) : wire154)))));
  module171 #() modinst225 (.wire175(wire159), .wire172(wire153), .clk(clk), .wire174(wire170), .wire173(wire150), .y(wire224));
  module226 #() modinst245 (wire244, clk, wire150, wire154, reg169, wire155, wire157);
  assign wire246 = wire167[(4'h9):(4'h8)];
  assign wire247 = (^$unsigned(reg168));
  assign wire248 = {($signed(wire244) ?
                           $unsigned((8'hab)) : reg161[(3'h7):(2'h3)])};
endmodule

module module12  (y, clk, wire13, wire14, wire15, wire16);
  output wire [(32'h27a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire13;
  input wire [(4'he):(1'h0)] wire14;
  input wire [(2'h2):(1'h0)] wire15;
  input wire signed [(3'h6):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire129;
  wire [(5'h13):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire21;
  wire signed [(4'hc):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire23;
  wire signed [(4'hf):(1'h0)] wire45;
  wire [(4'hd):(1'h0)] wire46;
  wire [(3'h5):(1'h0)] wire47;
  wire signed [(3'h5):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire52;
  wire signed [(3'h6):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire54;
  wire signed [(5'h10):(1'h0)] wire55;
  wire signed [(4'hb):(1'h0)] wire85;
  wire [(2'h3):(1'h0)] wire127;
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  assign y = {wire129,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire45,
                 wire46,
                 wire47,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire85,
                 wire127,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg48,
                 reg49,
                 reg50,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 (1'h0)};
  assign wire17 = {{wire13, (~wire15)}};
  assign wire18 = {(wire17[(1'h1):(1'h0)] ?
                          ($signed($signed(wire16)) <= $unsigned((+wire15))) : wire16)};
  assign wire19 = $signed($signed($unsigned(wire18)));
  assign wire20 = $unsigned(wire18[(4'ha):(1'h1)]);
  assign wire21 = ($unsigned($signed((!$unsigned(wire13)))) ?
                      ((((^~wire20) - $signed(wire18)) & $signed(wire13)) ?
                          ({(wire15 ? wire19 : wire16),
                              (wire14 ? wire20 : wire16)} & {$unsigned((8'hb8)),
                              $signed((8'ha5))}) : (({wire20} ?
                              (wire13 ?
                                  wire19 : (7'h43)) : (8'hac)) << $signed((+wire13)))) : $signed($signed($signed(wire14))));
  assign wire22 = (~&((~|((wire18 ? wire15 : wire15) ?
                          wire16 : wire18[(3'h7):(1'h1)])) ?
                      (~&$unsigned($signed(wire19))) : ($unsigned((~|wire21)) ?
                          {$signed(wire18)} : wire20[(4'hd):(4'hc)])));
  assign wire23 = (((wire19 ?
                          $signed(((8'hb6) - wire13)) : (wire14[(3'h4):(1'h0)] ?
                              wire19[(4'hf):(4'hf)] : (wire21 ?
                                  wire17 : wire22))) ?
                      (~&{wire13}) : ((wire13[(2'h3):(1'h1)] ?
                              wire16[(3'h4):(1'h0)] : ((8'ha5) ?
                                  wire19 : wire22)) ?
                          wire19[(4'h9):(1'h1)] : $unsigned((8'hb7)))) >>> $signed($signed(($unsigned(wire17) <= (wire17 ?
                      wire14 : wire16)))));
  always
    @(posedge clk) begin
      if (({wire16, wire16[(2'h2):(2'h2)]} ?
          ($unsigned(wire13[(2'h3):(1'h1)]) ?
              wire22[(4'ha):(3'h5)] : ($unsigned((8'ha4)) ~^ $signed((wire14 ?
                  (8'hbe) : wire15)))) : $signed($unsigned(wire15[(1'h0):(1'h0)]))))
        begin
          reg24 <= $unsigned(wire14[(4'he):(1'h1)]);
          if (wire14[(4'he):(3'h5)])
            begin
              reg25 <= (+(wire22[(4'hc):(4'ha)] ?
                  wire13[(2'h3):(2'h2)] : (wire15 == $unsigned((wire22 << wire15)))));
              reg26 <= (~|($unsigned((~^$unsigned(wire18))) > $unsigned((~|wire18))));
              reg27 <= $unsigned((+(&$unsigned(wire23))));
              reg28 <= $signed(wire20[(3'h6):(1'h1)]);
              reg29 <= (8'ha9);
            end
          else
            begin
              reg25 <= (~&(^(+{(reg26 ? (8'hb0) : reg28)})));
              reg26 <= wire19;
            end
          reg30 <= ($signed($unsigned({(wire16 ?
                  wire21 : (8'hbb))})) & {reg26});
          if ({wire20, reg28})
            begin
              reg31 <= $signed((8'hb7));
              reg32 <= (wire19[(3'h7):(3'h6)] ?
                  (({wire15, wire23[(4'ha):(3'h6)]} ?
                      {(wire19 ? (8'hbc) : wire21), wire20} : ((~wire16) ?
                          {wire22,
                              reg28} : (7'h41))) >>> reg26) : reg25[(3'h7):(2'h2)]);
              reg33 <= {$signed($unsigned(wire21))};
              reg34 <= wire16[(1'h1):(1'h0)];
              reg35 <= (wire14 >> (~&($signed((|wire21)) ?
                  (~(~^(8'ha3))) : reg27[(3'h7):(3'h6)])));
            end
          else
            begin
              reg31 <= (~|reg33[(4'hc):(3'h6)]);
              reg32 <= ((^~wire23) ?
                  ((~&$unsigned((wire17 == wire19))) != $signed($unsigned((reg25 || reg33)))) : (~(8'hb7)));
              reg33 <= wire20;
              reg34 <= (wire18[(4'h9):(1'h0)] << (wire16 ?
                  {reg27,
                      ((reg32 >>> reg33) ?
                          $unsigned(wire14) : reg30[(1'h0):(1'h0)])} : $signed(reg31[(3'h4):(1'h0)])));
              reg35 <= reg35[(3'h4):(2'h3)];
            end
          if (wire15[(1'h0):(1'h0)])
            begin
              reg36 <= ({$unsigned(((^(8'hb9)) ?
                      (+wire15) : (wire14 ? reg27 : wire23))),
                  $signed(({(8'h9f)} ?
                      $signed(reg33) : $unsigned(reg34)))} ^~ wire19);
              reg37 <= ((-$signed(reg31)) != wire21);
              reg38 <= $signed(wire15);
              reg39 <= $unsigned($unsigned($signed($signed(wire20))));
              reg40 <= ($unsigned((^$signed((reg24 <= wire17)))) ?
                  wire15[(1'h1):(1'h0)] : $unsigned(($signed((~^reg31)) >> reg32)));
            end
          else
            begin
              reg36 <= reg30;
              reg37 <= (~|$unsigned(((-{wire13,
                  (7'h40)}) <<< (reg32 & $unsigned(reg40)))));
              reg38 <= ($signed(reg28[(3'h5):(1'h0)]) * reg33[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          reg24 <= wire13[(2'h3):(2'h3)];
          reg25 <= (wire17 ?
              (~$unsigned({reg35[(1'h1):(1'h1)],
                  (wire21 ? reg38 : reg40)})) : $signed((((reg31 ?
                      (8'hbc) : (8'hb0)) >= $signed((8'hae))) ?
                  ((|reg28) ?
                      (!reg34) : (reg30 ?
                          wire15 : reg24)) : $unsigned($unsigned(wire20)))));
        end
      reg41 <= $signed(reg29);
      reg42 <= $unsigned({{(wire19[(4'hf):(2'h2)] ? (&wire17) : (~(8'ha7))),
              (reg26 ? (-reg33) : (|wire23))}});
      reg43 <= (^($signed($signed($unsigned((8'ha4)))) >> (^($unsigned(wire15) ?
          (reg30 ? reg33 : reg29) : $signed(reg30)))));
      reg44 <= ((~|(-((reg29 ? wire20 : wire13) ?
          (~^reg31) : $unsigned(wire21)))) > wire13[(2'h3):(1'h1)]);
    end
  assign wire45 = {(!$unsigned((~|reg41))),
                      $signed(($signed((wire16 ?
                          wire17 : reg34)) ^~ ((reg38 - reg41) ?
                          (8'ha7) : {(8'ha4), wire20})))};
  assign wire46 = $unsigned((wire45 ?
                      {$signed((wire22 != wire16))} : (reg44[(4'hc):(4'h8)] <= (|reg33[(2'h3):(2'h3)]))));
  assign wire47 = wire45;
  always
    @(posedge clk) begin
      reg48 <= reg40[(2'h2):(2'h2)];
      reg49 <= ($unsigned(($unsigned(reg26[(3'h5):(3'h5)]) ?
          wire19 : $unsigned(reg30))) || $unsigned(($unsigned($signed(reg43)) != wire13[(1'h1):(1'h1)])));
      reg50 <= {($unsigned($unsigned((^reg33))) >> $signed(($unsigned(reg33) ^~ $unsigned(wire16))))};
    end
  assign wire51 = ((($unsigned({(8'ha4), wire14}) ?
                          {((8'hb5) ?
                                  reg38 : wire22)} : (~^reg48)) >>> $signed($unsigned(reg50))) ?
                      {wire17, (~^(!(reg35 ? reg44 : reg36)))} : wire18);
  assign wire52 = wire14;
  assign wire53 = ($unsigned((8'h9e)) >> reg29[(4'hb):(2'h3)]);
  assign wire54 = reg30[(1'h0):(1'h0)];
  assign wire55 = $unsigned(reg44[(4'hf):(4'hc)]);
  always
    @(posedge clk) begin
      reg56 <= ({(reg41[(4'hb):(3'h4)] + $unsigned((!(8'hbe)))),
          wire22} >> reg32[(4'h8):(1'h0)]);
      if (reg48[(2'h2):(1'h1)])
        begin
          reg57 <= reg33;
          if ((8'ha3))
            begin
              reg58 <= (^~(~^{{reg40}, (wire47 == (wire20 ? reg28 : wire52))}));
              reg59 <= (reg37 & {reg30});
              reg60 <= $signed($unsigned({wire54, reg31}));
            end
          else
            begin
              reg58 <= (7'h43);
              reg59 <= (&(+$unsigned((wire17 ?
                  (reg49 ^~ (8'hb8)) : reg59[(5'h12):(4'h9)]))));
              reg60 <= (7'h42);
            end
        end
      else
        begin
          reg57 <= $signed((({wire14[(2'h2):(2'h2)]} ^ $unsigned((~^reg35))) ?
              (-((&reg41) < $unsigned(reg57))) : {$signed($signed(wire20)),
                  wire14[(1'h0):(1'h0)]}));
          reg58 <= $unsigned(($unsigned(((~^(8'h9f)) <<< wire52)) ?
              $signed(reg57[(1'h1):(1'h1)]) : ({(8'h9c)} ?
                  (~&wire16) : wire14)));
          reg59 <= $unsigned((8'hb0));
          reg60 <= {$unsigned((&{$signed(wire23)}))};
        end
    end
  module61 #() modinst86 (.wire65(wire23), .y(wire85), .wire63(wire22), .clk(clk), .wire62(reg34), .wire64(reg49));
  module87 #() modinst128 (.wire89(wire45), .clk(clk), .wire88(reg34), .y(wire127), .wire91(reg48), .wire90(reg25));
  assign wire129 = reg31[(3'h4):(2'h2)];
endmodule

module module87
#(parameter param126 = ((({{(8'hb9), (7'h41)}, (+(8'ha5))} * ((!(8'hba)) ? (!(8'ha8)) : {(8'ha3), (7'h40)})) ^~ (((~^(8'hb4)) ? {(8'ha8), (8'hb7)} : ((8'hb3) ^~ (7'h43))) + (((7'h41) == (8'haf)) ? ((7'h40) ? (8'h9c) : (8'ha3)) : (~^(8'hbf))))) && (^{{((8'hb8) + (8'ha3)), ((8'ha8) == (8'ha6))}, (-(~^(8'ha1)))})))
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire91;
  input wire [(3'h4):(1'h0)] wire90;
  input wire signed [(3'h6):(1'h0)] wire89;
  input wire [(5'h10):(1'h0)] wire88;
  wire signed [(3'h7):(1'h0)] wire125;
  wire signed [(4'hc):(1'h0)] wire124;
  wire signed [(4'hd):(1'h0)] wire123;
  wire signed [(2'h2):(1'h0)] wire122;
  wire signed [(5'h10):(1'h0)] wire121;
  wire [(4'ha):(1'h0)] wire120;
  wire signed [(4'ha):(1'h0)] wire119;
  wire [(2'h2):(1'h0)] wire118;
  wire signed [(2'h2):(1'h0)] wire117;
  wire [(4'hf):(1'h0)] wire116;
  wire signed [(2'h3):(1'h0)] wire115;
  wire [(4'hb):(1'h0)] wire114;
  wire [(5'h13):(1'h0)] wire113;
  wire signed [(4'hb):(1'h0)] wire102;
  wire signed [(4'he):(1'h0)] wire98;
  wire [(4'hf):(1'h0)] wire97;
  wire signed [(4'hc):(1'h0)] wire96;
  wire [(5'h14):(1'h0)] wire95;
  wire signed [(5'h14):(1'h0)] wire94;
  wire [(5'h13):(1'h0)] wire93;
  wire signed [(4'hd):(1'h0)] wire92;
  reg signed [(4'hb):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg111 = (1'h0);
  reg [(5'h13):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg109 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(5'h11):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg [(4'hc):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire102,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
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
                 reg101,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire92 = wire88;
  assign wire93 = ((8'h9c) ?
                      $unsigned((8'hba)) : $unsigned(({(^~wire90),
                          {(8'ha4)}} == $unsigned(wire89[(3'h4):(3'h4)]))));
  assign wire94 = $signed(wire89[(2'h2):(1'h0)]);
  assign wire95 = (wire93 ?
                      $unsigned(($unsigned((wire92 ? wire88 : wire94)) ?
                          ($signed(wire89) << wire90) : (+(~^wire89)))) : wire92);
  assign wire96 = wire91[(2'h2):(1'h0)];
  assign wire97 = $signed($signed(((+wire93[(1'h1):(1'h0)]) > (8'had))));
  assign wire98 = ($signed((wire93 ?
                          wire89 : {(wire95 ? wire90 : wire94), {wire96}})) ?
                      $signed((wire93[(5'h12):(3'h4)] ?
                          ((^(8'ha2)) ?
                              $signed(wire96) : {(8'ha2),
                                  wire91}) : wire96)) : ({((wire88 ?
                                      wire89 : wire93) ?
                                  (~^wire94) : wire94)} ?
                          $signed((wire90 ?
                              (wire95 ?
                                  wire91 : wire89) : $unsigned(wire90))) : $signed($signed((wire88 ?
                              (8'had) : wire93)))));
  always
    @(posedge clk) begin
      reg99 <= (($unsigned(wire95) ?
          $signed((8'hbc)) : wire88) | ($signed({(wire92 ? wire90 : (8'h9c)),
          (+wire95)}) - $signed(($signed(wire90) ? (+wire88) : (~|wire92)))));
      reg100 <= $signed(wire97[(3'h7):(3'h6)]);
      reg101 <= $signed(($unsigned($signed(wire94[(5'h10):(2'h3)])) <<< wire97[(2'h2):(1'h1)]));
    end
  assign wire102 = wire92;
  always
    @(posedge clk) begin
      if ($unsigned($signed((+$unsigned((reg100 == (8'hab)))))))
        begin
          reg103 <= $signed(wire88);
          if (((wire92 >= ($signed(((8'hbb) << reg100)) << $unsigned((wire94 != (8'ha5))))) == wire97))
            begin
              reg104 <= (wire91 | wire90);
              reg105 <= ($unsigned({{(&wire96)}}) ?
                  (({$unsigned(reg103)} ?
                      (^(reg103 ?
                          reg100 : wire97)) : $unsigned(wire95)) && {wire88}) : wire94[(5'h14):(5'h11)]);
            end
          else
            begin
              reg104 <= wire97[(2'h2):(2'h2)];
            end
          reg106 <= $signed($signed($signed($signed(wire97))));
          reg107 <= ((^~(|$unsigned((reg105 == wire93)))) >>> $signed($unsigned(wire89)));
        end
      else
        begin
          reg103 <= reg99;
          reg104 <= (~|wire88[(4'h9):(3'h7)]);
        end
      reg108 <= $signed(wire102);
      reg109 <= ((($unsigned($unsigned(wire96)) <<< ({wire91, reg103} ?
                  wire95 : (^~(8'h9d)))) ?
              (wire93 ?
                  $signed($signed(reg106)) : reg108[(1'h1):(1'h1)]) : reg100[(2'h3):(2'h2)]) ?
          wire91 : $signed($signed(((reg104 >> reg100) ?
              $unsigned(reg107) : (8'ha7)))));
      if ((~^wire97))
        begin
          reg110 <= reg104;
          reg111 <= $unsigned($unsigned((+reg108)));
        end
      else
        begin
          reg110 <= $signed((($signed(reg109) < {$unsigned(reg106),
                  $unsigned(wire98)}) ?
              $unsigned((reg104[(1'h1):(1'h1)] ?
                  (reg100 >= wire96) : reg105[(3'h5):(1'h1)])) : reg108));
          reg111 <= $signed((8'hb2));
        end
      reg112 <= wire97;
    end
  assign wire113 = $signed((~|wire89));
  assign wire114 = (($unsigned((^~(wire96 | reg99))) >= ($unsigned((wire92 ?
                           wire95 : reg105)) ?
                       ($signed(wire89) ?
                           $signed(reg109) : (wire92 & reg107)) : $signed((wire97 ?
                           reg101 : wire113)))) | $signed(reg110));
  assign wire115 = (wire94 ?
                       {(reg107 & ($unsigned(wire102) >>> (reg105 + reg109)))} : reg111[(3'h7):(1'h1)]);
  assign wire116 = (((8'h9c) ?
                           $signed(wire89[(1'h1):(1'h1)]) : $unsigned((|wire92))) ?
                       (8'hb5) : wire114[(2'h3):(1'h1)]);
  assign wire117 = reg99;
  assign wire118 = reg99;
  assign wire119 = $signed(($signed($unsigned(reg110)) >= wire102));
  assign wire120 = $unsigned($signed((~&wire94[(4'hc):(4'h8)])));
  assign wire121 = reg108[(2'h2):(2'h2)];
  assign wire122 = reg105;
  assign wire123 = (reg99 * $unsigned(($signed(reg111) && wire88)));
  assign wire124 = (!wire96[(4'ha):(1'h1)]);
  assign wire125 = (wire96[(4'h8):(2'h2)] * ((~^reg106) ?
                       reg104[(1'h0):(1'h0)] : $signed(wire97[(4'h8):(4'h8)])));
endmodule

module module61
#(parameter param84 = ((((^~{(7'h42), (8'ha6)}) ? ({(8'hb8)} ? {(8'haf)} : {(8'ha5), (7'h43)}) : (+((8'haf) ? (8'ha1) : (8'hb0)))) ? (^(((8'h9e) < (8'ha1)) != (~(8'haa)))) : {((~(8'hbe)) || ((7'h44) ? (8'hb8) : (8'ha2)))}) ~^ ({(^~(~(8'hae))), ((~^(7'h41)) >>> ((8'hb4) ~^ (8'hba)))} ? (^~(^~((8'ha6) <= (8'hb8)))) : ((((8'ha9) <<< (8'h9c)) ? {(8'hb7)} : (^(8'haa))) ? ({(8'hb7), (8'ha5)} ? (-(7'h42)) : (~&(8'ha6))) : ((^(8'hae)) ? (~^(7'h43)) : ((8'ha9) >= (8'hb6)))))))
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire65;
  input wire signed [(3'h7):(1'h0)] wire64;
  input wire [(3'h4):(1'h0)] wire63;
  input wire [(5'h15):(1'h0)] wire62;
  wire [(4'ha):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire80;
  wire [(3'h7):(1'h0)] wire78;
  wire signed [(4'he):(1'h0)] wire77;
  wire signed [(4'hb):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire75;
  wire [(4'hf):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire73;
  wire signed [(4'hb):(1'h0)] wire72;
  wire [(2'h2):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire66;
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 reg79,
                 reg71,
                 (1'h0)};
  assign wire66 = ((8'hb9) ?
                      (((~((8'hb7) ? wire65 : wire64)) ?
                              ({wire65, wire63} < wire64) : ((!wire63) ?
                                  (&wire65) : (~&wire64))) ?
                          (^wire62[(1'h1):(1'h0)]) : $unsigned(wire65[(2'h2):(1'h0)])) : (~(8'haf)));
  assign wire67 = $signed(($signed((7'h43)) ?
                      (wire64 ? (8'hbd) : {$unsigned(wire62)}) : (~^wire64)));
  assign wire68 = {$unsigned($signed($unsigned(wire65))), (~wire65)};
  assign wire69 = ({($unsigned((~^wire65)) != ((wire63 <<< wire64) ?
                              (|wire66) : wire68))} ?
                      wire65[(3'h4):(3'h4)] : ($unsigned({wire63[(2'h3):(1'h0)],
                          ((8'ha3) | wire68)}) < (&$signed(wire68[(3'h6):(1'h0)]))));
  assign wire70 = {$unsigned($signed((wire69 > wire63))),
                      (wire65 ?
                          $unsigned((wire66 ^ wire68)) : wire62[(4'hc):(1'h1)])};
  always
    @(posedge clk) begin
      reg71 <= wire64[(1'h1):(1'h1)];
    end
  assign wire72 = $signed((~|{wire69[(1'h1):(1'h1)]}));
  assign wire73 = wire68[(3'h4):(2'h2)];
  assign wire74 = (~^((~(wire63 ?
                          wire63[(1'h0):(1'h0)] : (wire73 ? wire63 : wire62))) ?
                      wire73[(1'h1):(1'h0)] : $signed($unsigned($unsigned(wire68)))));
  assign wire75 = wire62;
  assign wire76 = wire68;
  assign wire77 = ($unsigned(wire73) != wire66);
  assign wire78 = $unsigned($unsigned(((~|{wire76}) ?
                      wire76[(1'h1):(1'h1)] : ($signed(reg71) - (wire62 ?
                          wire67 : wire72)))));
  always
    @(posedge clk) begin
      reg79 <= $signed($unsigned({wire75, $unsigned(wire77)}));
    end
  assign wire80 = (~^((~^$unsigned((7'h42))) | (+$unsigned($signed(wire75)))));
  assign wire81 = {reg79[(3'h4):(2'h2)],
                      ((~&$signed($signed((8'haf)))) ?
                          wire77[(2'h2):(1'h0)] : wire69)};
  assign wire82 = $signed(wire68[(2'h2):(1'h0)]);
  assign wire83 = (^~wire62);
endmodule

module module226
#(parameter param243 = ((({(8'hae), {(8'hbe)}} ? (((8'ha8) ? (8'hb3) : (8'hb6)) ? (+(8'ha4)) : ((8'hb2) ? (8'h9c) : (8'ha5))) : (~&(8'h9d))) ? {(((8'h9d) + (8'hb8)) + {(7'h42)})} : ((^~((8'h9c) != (8'hba))) + (-((8'hbe) ? (8'hbc) : (8'hb8))))) ? (((8'hba) ? (&(^(8'ha4))) : (!((8'hb0) >= (8'hbb)))) ? (^((8'hbd) << (^(8'h9d)))) : {{(!(8'hbb)), (~|(8'hae))}, (8'had)}) : (&((((8'hb0) ^ (8'ha3)) ? (~&(8'ha2)) : ((8'hae) ^~ (8'ha4))) ~^ ({(8'ha8), (8'hac)} - ((8'hae) ? (8'hb6) : (8'h9d)))))))
(y, clk, wire231, wire230, wire229, wire228, wire227);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire231;
  input wire [(4'hd):(1'h0)] wire230;
  input wire [(5'h11):(1'h0)] wire229;
  input wire [(4'hc):(1'h0)] wire228;
  input wire signed [(3'h5):(1'h0)] wire227;
  wire signed [(4'h9):(1'h0)] wire242;
  wire signed [(4'h8):(1'h0)] wire241;
  wire [(4'hd):(1'h0)] wire234;
  wire [(3'h7):(1'h0)] wire233;
  wire signed [(3'h4):(1'h0)] wire232;
  reg [(5'h10):(1'h0)] reg240 = (1'h0);
  reg [(3'h4):(1'h0)] reg239 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg238 = (1'h0);
  reg [(3'h6):(1'h0)] reg237 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg236 = (1'h0);
  reg [(4'h9):(1'h0)] reg235 = (1'h0);
  assign y = {wire242,
                 wire241,
                 wire234,
                 wire233,
                 wire232,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 (1'h0)};
  assign wire232 = (|(wire230[(3'h5):(3'h5)] ?
                       $signed((-{(8'hae),
                           (8'hae)})) : $unsigned($signed($signed((8'ha8))))));
  assign wire233 = $unsigned(($signed((8'haa)) ?
                       wire231 : $unsigned($unsigned(wire231))));
  assign wire234 = $signed(((8'hb3) ?
                       wire232[(1'h1):(1'h0)] : wire232[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      reg235 <= wire234[(4'h8):(3'h4)];
    end
  always
    @(posedge clk) begin
      reg236 <= wire230;
      reg237 <= ($signed($signed(reg236)) ?
          $signed($unsigned(wire233)) : reg236);
      reg238 <= $signed(wire230);
      reg239 <= $signed(((8'ha0) ?
          $unsigned(wire232[(2'h3):(1'h1)]) : wire227));
      reg240 <= reg239;
    end
  assign wire241 = (reg235[(3'h7):(3'h7)] < (($unsigned(reg235) << $unsigned((-reg237))) * $signed((wire227 ?
                       (reg239 ? reg235 : wire233) : $signed(reg238)))));
  assign wire242 = ((((~|(&wire227)) ?
                           (~&reg238) : {$signed(wire230),
                               $signed(reg235)}) != (reg238[(1'h1):(1'h1)] ?
                           wire228 : ({wire231} * wire228[(4'h9):(3'h7)]))) ?
                       wire227 : (+($unsigned($unsigned(wire227)) | (((8'ha5) ?
                               wire229 : reg236) ?
                           (|wire227) : $signed(wire230)))));
endmodule

module module171
#(parameter param222 = ((~|((+((8'h9f) ? (7'h40) : (8'h9d))) ? (~&((8'had) && (8'hb9))) : (^~((8'hbd) <<< (8'ha1))))) || ((~|(((8'hb1) ? (8'ha7) : (8'hb9)) && ((8'hb1) ? (8'ha3) : (8'hb9)))) || {({(8'haa)} ? ((8'hbe) ? (8'h9e) : (8'haf)) : (~^(8'hb2)))})), 
parameter param223 = (^~((param222 ? {param222, param222} : ({param222, param222} >>> (-param222))) ? param222 : param222)))
(y, clk, wire175, wire174, wire173, wire172);
  output wire [(32'h20b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire175;
  input wire signed [(3'h6):(1'h0)] wire174;
  input wire [(4'hf):(1'h0)] wire173;
  input wire [(4'he):(1'h0)] wire172;
  wire signed [(4'ha):(1'h0)] wire221;
  wire [(4'he):(1'h0)] wire220;
  wire signed [(4'hf):(1'h0)] wire219;
  wire [(5'h13):(1'h0)] wire218;
  wire [(3'h6):(1'h0)] wire217;
  wire [(5'h12):(1'h0)] wire216;
  wire [(4'hc):(1'h0)] wire215;
  wire [(4'ha):(1'h0)] wire214;
  wire [(3'h4):(1'h0)] wire212;
  wire [(4'ha):(1'h0)] wire211;
  wire [(5'h10):(1'h0)] wire197;
  wire [(4'he):(1'h0)] wire196;
  wire [(3'h4):(1'h0)] wire195;
  wire signed [(5'h12):(1'h0)] wire194;
  wire signed [(3'h7):(1'h0)] wire176;
  reg [(4'h9):(1'h0)] reg213 = (1'h0);
  reg signed [(4'he):(1'h0)] reg210 = (1'h0);
  reg [(4'h9):(1'h0)] reg209 = (1'h0);
  reg [(5'h12):(1'h0)] reg208 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg207 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg206 = (1'h0);
  reg [(4'he):(1'h0)] reg205 = (1'h0);
  reg [(4'h8):(1'h0)] reg204 = (1'h0);
  reg [(4'hf):(1'h0)] reg203 = (1'h0);
  reg [(4'h8):(1'h0)] reg202 = (1'h0);
  reg [(2'h3):(1'h0)] reg201 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg200 = (1'h0);
  reg [(5'h14):(1'h0)] reg199 = (1'h0);
  reg [(4'hb):(1'h0)] reg198 = (1'h0);
  reg [(5'h11):(1'h0)] reg193 = (1'h0);
  reg [(5'h15):(1'h0)] reg192 = (1'h0);
  reg [(3'h4):(1'h0)] reg191 = (1'h0);
  reg [(4'hd):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg189 = (1'h0);
  reg [(5'h13):(1'h0)] reg188 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg187 = (1'h0);
  reg [(4'hb):(1'h0)] reg186 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg185 = (1'h0);
  reg [(2'h2):(1'h0)] reg184 = (1'h0);
  reg [(4'ha):(1'h0)] reg183 = (1'h0);
  reg [(4'hb):(1'h0)] reg182 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg181 = (1'h0);
  reg [(5'h13):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg178 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg177 = (1'h0);
  assign y = {wire221,
                 wire220,
                 wire219,
                 wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire212,
                 wire211,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire176,
                 reg213,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg193,
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
                 (1'h0)};
  assign wire176 = wire174[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      if (wire172[(2'h3):(2'h3)])
        begin
          reg177 <= $signed(wire174);
          reg178 <= ((((~|wire175[(2'h3):(2'h2)]) > $signed({(8'hbd)})) <<< (+$signed(wire174[(2'h2):(2'h2)]))) ?
              ((wire175[(1'h1):(1'h1)] ^~ wire175) ?
                  $signed($signed({(7'h41), wire173})) : ((((8'hbd) ?
                          reg177 : wire174) << wire175) ?
                      {(wire176 ?
                              wire172 : wire176)} : $signed((wire174 + reg177)))) : wire175);
          reg179 <= $unsigned((wire176 & reg178[(5'h11):(5'h10)]));
          if ($unsigned($unsigned((|($unsigned(wire173) ?
              (reg177 >= wire173) : (reg178 >> (8'ha0)))))))
            begin
              reg180 <= ((^~(((^~reg177) ?
                      $signed(wire175) : $signed(wire172)) > $signed((wire173 ?
                      reg178 : wire176)))) ?
                  ($unsigned(({wire174, wire173} >= (wire172 ?
                          wire173 : reg179))) ?
                      $unsigned(((wire174 <= reg178) ?
                          (!(8'h9c)) : (reg177 | (8'hbf)))) : ((&$unsigned((7'h42))) ?
                          $unsigned((reg178 + wire173)) : wire174[(1'h1):(1'h0)])) : {{({wire172,
                              wire175} >>> $signed(wire176)),
                          wire175},
                      wire172});
            end
          else
            begin
              reg180 <= $unsigned($signed(reg177));
              reg181 <= $signed(({((wire172 * wire176) || (reg177 ?
                      reg177 : wire174)),
                  $signed(wire173[(4'hb):(4'h8)])} - $unsigned((reg180 ?
                  $signed(reg177) : reg177[(2'h3):(1'h0)]))));
              reg182 <= (~reg178);
              reg183 <= wire175[(3'h5):(1'h0)];
              reg184 <= (reg177[(2'h3):(2'h3)] ~^ reg182[(3'h6):(1'h1)]);
            end
          reg185 <= reg179;
        end
      else
        begin
          reg177 <= ($signed(reg180[(3'h4):(2'h3)]) - wire176[(2'h2):(1'h0)]);
          reg178 <= reg180[(5'h11):(4'hc)];
          reg179 <= (~|reg180[(4'h9):(2'h2)]);
        end
      if ($signed($signed($unsigned({(reg183 ? reg181 : wire173),
          $signed((8'hbb))}))))
        begin
          reg186 <= (~wire174);
          reg187 <= ((^$unsigned({{reg184}})) ?
              $signed((!((&wire173) * reg186))) : {$unsigned(reg180[(4'hd):(4'ha)])});
          reg188 <= ($signed($unsigned((+reg185[(3'h5):(2'h3)]))) ?
              (&(-$unsigned(reg180[(1'h1):(1'h1)]))) : ((&((wire172 ^ wire175) > $unsigned(reg184))) <<< ((((7'h44) ?
                      wire176 : reg183) ?
                  reg183[(4'ha):(3'h4)] : $signed((7'h43))) - (reg178[(3'h5):(3'h5)] ?
                  (reg183 ? (8'hbb) : wire175) : $signed((8'ha1))))));
        end
      else
        begin
          if ($signed((&$signed($signed((reg185 > reg178))))))
            begin
              reg186 <= reg186[(2'h3):(2'h2)];
              reg187 <= (|reg184);
              reg188 <= ((~|{({reg186, reg186} ~^ wire173)}) ^ (!reg182));
            end
          else
            begin
              reg186 <= $signed((-wire176[(3'h7):(3'h5)]));
              reg187 <= (8'hae);
            end
          reg189 <= $signed($signed(reg183[(4'h9):(3'h6)]));
          if (({$unsigned($signed((!reg183))),
              {reg182}} <<< reg178[(4'h8):(4'h8)]))
            begin
              reg190 <= reg182[(3'h6):(3'h6)];
              reg191 <= (~|(($unsigned(reg183[(4'h9):(2'h2)]) != reg188[(4'ha):(4'ha)]) ?
                  $unsigned(($unsigned(reg186) ?
                      ((8'haf) && wire174) : (|reg186))) : ($unsigned((reg179 ?
                          reg178 : reg183)) ?
                      $unsigned({reg182}) : reg189[(4'hd):(4'h8)])));
            end
          else
            begin
              reg190 <= wire176[(3'h6):(1'h1)];
              reg191 <= wire173;
              reg192 <= reg187;
              reg193 <= (^((8'h9c) == $signed(reg179[(4'h9):(4'h8)])));
            end
        end
    end
  assign wire194 = reg183;
  assign wire195 = (~({wire172,
                       (wire174 ?
                           {reg188} : ((7'h42) || reg193))} || (reg179[(4'h8):(1'h1)] >>> reg183[(4'ha):(1'h1)])));
  assign wire196 = (~|reg188[(4'hd):(1'h0)]);
  assign wire197 = (|($unsigned({((8'haa) - reg193)}) ^ $signed($signed(wire175[(4'h9):(2'h2)]))));
  always
    @(posedge clk) begin
      reg198 <= (reg181 >> ((8'hb2) ?
          $unsigned(((+reg190) ?
              (+reg183) : $unsigned(reg193))) : reg189[(2'h3):(2'h2)]));
      reg199 <= ($unsigned((wire172 ?
              (!(reg189 ? reg198 : reg193)) : (~^$unsigned(reg188)))) ?
          $unsigned({{(reg189 - wire195)},
              wire197[(4'hb):(2'h2)]}) : ($signed(wire196) + reg186[(2'h2):(1'h1)]));
      if (reg183)
        begin
          reg200 <= $signed((-$unsigned((-((8'hab) ? reg179 : reg177)))));
        end
      else
        begin
          reg200 <= {$signed(reg180)};
          reg201 <= reg179;
          reg202 <= {wire176};
          reg203 <= (^~$unsigned((7'h40)));
        end
      if (((!$signed(reg203)) > reg180))
        begin
          reg204 <= (-reg179[(2'h2):(2'h2)]);
          reg205 <= $unsigned($unsigned(reg180[(4'hb):(2'h2)]));
        end
      else
        begin
          if (wire174[(3'h5):(2'h2)])
            begin
              reg204 <= {$signed($signed(reg184[(1'h1):(1'h0)])),
                  reg184[(2'h2):(1'h1)]};
              reg205 <= ((|$signed($unsigned((~wire194)))) <= $unsigned({((~reg193) == reg180[(4'h8):(3'h7)])}));
              reg206 <= reg185[(2'h2):(1'h1)];
              reg207 <= reg202[(2'h3):(1'h1)];
              reg208 <= (^((~&$signed((reg179 ? reg192 : reg187))) ?
                  $signed(reg203[(4'hd):(3'h7)]) : $unsigned((reg180[(4'he):(4'ha)] ?
                      {reg184, reg189} : $unsigned(reg177)))));
            end
          else
            begin
              reg204 <= {{((8'hbc) ?
                          (~|reg204) : (reg203 ~^ (reg193 != reg202))),
                      (+$signed((wire174 ? reg177 : wire194)))},
                  ($unsigned(({reg187} <= (reg186 ^~ reg184))) ?
                      $signed($unsigned(reg203[(3'h5):(1'h0)])) : (-(^~(!reg181))))};
              reg205 <= reg180;
              reg206 <= wire176[(3'h7):(3'h7)];
              reg207 <= {$unsigned($signed(($unsigned(reg198) ?
                      reg179[(4'h9):(2'h3)] : (8'hb4))))};
              reg208 <= reg189;
            end
          reg209 <= reg177;
          reg210 <= (reg183 ^~ (($unsigned((reg190 ?
              reg180 : reg203)) ^~ reg203[(4'hd):(4'hc)]) >= ((!(reg191 || reg193)) + reg205[(4'he):(3'h7)])));
        end
    end
  assign wire211 = $unsigned((7'h42));
  assign wire212 = $signed(reg192);
  always
    @(posedge clk) begin
      reg213 <= (reg203[(4'hc):(3'h5)] && $unsigned($unsigned(reg182)));
    end
  assign wire214 = ((^~{($signed(reg213) ?
                           $signed(reg187) : wire173[(4'hb):(2'h3)]),
                       $unsigned((!reg201))}) & ((^~(-(reg209 ?
                           reg185 : reg188))) ?
                       wire195[(2'h3):(1'h0)] : (^{{reg186, wire174}})));
  assign wire215 = reg206;
  assign wire216 = $unsigned(wire173[(4'hd):(4'ha)]);
  assign wire217 = reg182[(4'h9):(1'h1)];
  assign wire218 = (+(wire215[(3'h7):(1'h1)] - (wire175[(3'h6):(2'h3)] ?
                       (+(reg204 < reg192)) : reg198[(3'h5):(1'h0)])));
  assign wire219 = {(|reg183[(2'h3):(2'h3)])};
  assign wire220 = (reg188 == reg189[(3'h6):(3'h5)]);
  assign wire221 = $unsigned({$unsigned(wire220[(3'h6):(3'h4)]),
                       {$signed($unsigned(reg201))}});
endmodule
