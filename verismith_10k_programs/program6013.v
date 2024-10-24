module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire signed [(3'h7):(1'h0)] wire249;
  wire [(5'h12):(1'h0)] wire248;
  wire signed [(5'h13):(1'h0)] wire247;
  wire [(3'h5):(1'h0)] wire246;
  wire signed [(2'h3):(1'h0)] wire245;
  wire signed [(4'hb):(1'h0)] wire244;
  wire [(4'hf):(1'h0)] wire243;
  wire signed [(5'h13):(1'h0)] wire241;
  wire signed [(4'hf):(1'h0)] wire240;
  wire signed [(4'he):(1'h0)] wire231;
  wire signed [(4'hc):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire60;
  wire [(5'h12):(1'h0)] wire61;
  wire signed [(5'h11):(1'h0)] wire229;
  wire signed [(5'h13):(1'h0)] wire233;
  wire signed [(4'he):(1'h0)] wire234;
  wire signed [(4'hf):(1'h0)] wire235;
  wire signed [(3'h5):(1'h0)] wire236;
  wire [(5'h12):(1'h0)] wire237;
  wire signed [(5'h15):(1'h0)] wire238;
  reg [(4'hb):(1'h0)] reg251 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg62 = (1'h0);
  assign y = {wire249,
                 wire248,
                 wire247,
                 wire246,
                 wire245,
                 wire244,
                 wire243,
                 wire241,
                 wire240,
                 wire231,
                 wire58,
                 wire60,
                 wire61,
                 wire229,
                 wire233,
                 wire234,
                 wire235,
                 wire236,
                 wire237,
                 wire238,
                 reg251,
                 reg62,
                 (1'h0)};
  module4 #() modinst59 (wire58, clk, wire1, wire0, wire2, wire3);
  assign wire60 = $unsigned(wire1);
  assign wire61 = $unsigned($signed($signed(wire58[(3'h5):(1'h1)])));
  always
    @(posedge clk) begin
      reg62 <= $signed($unsigned($signed(((-wire2) ?
          (wire2 >> (8'hb0)) : $signed((8'ha1))))));
    end
  module63 #() modinst230 (wire229, clk, wire61, wire3, wire1, reg62);
  module4 #() modinst232 (wire231, clk, wire3, reg62, wire1, wire60);
  assign wire233 = (~^wire2[(5'h12):(2'h3)]);
  assign wire234 = $unsigned(((!$signed($signed(wire60))) & $unsigned((-(^(8'hb0))))));
  assign wire235 = ((wire61[(5'h10):(4'h8)] ?
                       wire0 : $unsigned(($unsigned(reg62) >> (~&wire60)))) * wire229[(4'ha):(4'ha)]);
  assign wire236 = wire235;
  assign wire237 = $signed(wire231);
  module19 #() modinst239 (.wire22(reg62), .wire20(wire0), .clk(clk), .wire21(wire2), .y(wire238), .wire23(wire61));
  assign wire240 = (wire235 ?
                       (~|(8'ha5)) : ((^(!$unsigned((7'h43)))) ?
                           $unsigned((|$signed(reg62))) : {($unsigned((8'ha4)) != $unsigned(wire2)),
                               wire238[(1'h1):(1'h1)]}));
  module19 #() modinst242 (.wire21(wire233), .wire23(wire238), .clk(clk), .y(wire241), .wire22(wire240), .wire20(wire237));
  assign wire243 = $unsigned({$signed($unsigned((wire231 && wire61)))});
  assign wire244 = $signed((wire58 ? wire237 : wire0[(3'h4):(2'h2)]));
  assign wire245 = (|$signed(wire231));
  assign wire246 = wire241[(3'h4):(1'h0)];
  assign wire247 = $signed(wire2);
  assign wire248 = wire60;
  module63 #() modinst250 (wire249, clk, wire248, wire2, wire61, wire234);
  always
    @(posedge clk) begin
      reg251 <= $signed(wire236);
    end
endmodule

module module63
#(parameter param228 = (!(~&(&((8'hb7) ? ((8'had) * (8'hbb)) : {(8'h9f)})))))
(y, clk, wire64, wire65, wire66, wire67);
  output wire [(32'h37d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire64;
  input wire [(5'h11):(1'h0)] wire65;
  input wire [(5'h10):(1'h0)] wire66;
  input wire [(4'hc):(1'h0)] wire67;
  wire signed [(4'hf):(1'h0)] wire226;
  wire signed [(4'ha):(1'h0)] wire190;
  wire [(5'h10):(1'h0)] wire152;
  wire [(3'h4):(1'h0)] wire151;
  wire signed [(5'h12):(1'h0)] wire150;
  wire [(4'h8):(1'h0)] wire142;
  wire signed [(5'h14):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire69;
  wire [(4'ha):(1'h0)] wire119;
  reg signed [(4'hd):(1'h0)] reg121 = (1'h0);
  reg [(4'hf):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg125 = (1'h0);
  reg [(3'h4):(1'h0)] reg126 = (1'h0);
  reg [(3'h6):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg129 = (1'h0);
  reg signed [(4'he):(1'h0)] reg130 = (1'h0);
  reg [(2'h3):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg134 = (1'h0);
  reg signed [(4'he):(1'h0)] reg135 = (1'h0);
  reg signed [(4'he):(1'h0)] reg136 = (1'h0);
  reg [(4'hf):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg139 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg140 = (1'h0);
  reg [(5'h10):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg143 = (1'h0);
  reg [(5'h11):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg145 = (1'h0);
  reg [(5'h13):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(3'h4):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg149 = (1'h0);
  reg signed [(4'he):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg154 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg156 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg158 = (1'h0);
  reg [(4'hc):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg161 = (1'h0);
  reg [(4'hd):(1'h0)] reg162 = (1'h0);
  reg [(5'h14):(1'h0)] reg163 = (1'h0);
  reg [(2'h2):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg165 = (1'h0);
  reg [(4'ha):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg167 = (1'h0);
  reg [(4'h9):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg169 = (1'h0);
  reg [(5'h11):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg171 = (1'h0);
  reg [(5'h15):(1'h0)] reg172 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg173 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg174 = (1'h0);
  reg [(5'h10):(1'h0)] reg175 = (1'h0);
  reg [(5'h10):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg177 = (1'h0);
  reg [(5'h10):(1'h0)] reg178 = (1'h0);
  reg [(5'h13):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg182 = (1'h0);
  reg signed [(4'he):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg185 = (1'h0);
  reg [(4'hf):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg187 = (1'h0);
  reg [(4'ha):(1'h0)] reg188 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg189 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg192 = (1'h0);
  assign y = {wire226,
                 wire190,
                 wire152,
                 wire151,
                 wire150,
                 wire142,
                 wire68,
                 wire69,
                 wire119,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 reg133,
                 reg134,
                 reg135,
                 reg136,
                 reg137,
                 reg138,
                 reg139,
                 reg140,
                 reg141,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg153,
                 reg154,
                 reg155,
                 reg156,
                 reg157,
                 reg158,
                 reg159,
                 reg160,
                 reg161,
                 reg162,
                 reg163,
                 reg164,
                 reg165,
                 reg166,
                 reg167,
                 reg168,
                 reg169,
                 reg170,
                 reg171,
                 reg172,
                 reg173,
                 reg174,
                 reg175,
                 reg176,
                 reg177,
                 reg178,
                 reg179,
                 reg180,
                 reg181,
                 reg182,
                 reg183,
                 reg184,
                 reg185,
                 reg186,
                 reg187,
                 reg188,
                 reg189,
                 reg191,
                 reg192,
                 (1'h0)};
  assign wire68 = $signed((wire64[(4'hf):(4'h8)] ?
                      {(wire67 >>> {wire64, wire67}),
                          wire67[(3'h6):(3'h5)]} : wire65));
  assign wire69 = $signed(wire66[(3'h5):(3'h5)]);
  module70 #() modinst120 (wire119, clk, wire69, wire64, wire66, wire67, wire65);
  always
    @(posedge clk) begin
      if (((7'h40) ? wire69[(1'h1):(1'h1)] : wire64))
        begin
          reg121 <= $unsigned(($signed($signed((wire68 ~^ wire65))) ?
              wire68[(4'he):(2'h2)] : wire64));
          reg122 <= (|(~((8'hab) + {$signed(wire68)})));
          if (($signed(wire69) ?
              (!$unsigned((!wire65))) : ($unsigned(($unsigned(wire68) != (wire66 + reg122))) ?
                  (wire67 ^~ wire69[(3'h6):(3'h5)]) : (!wire65[(3'h5):(2'h3)]))))
            begin
              reg123 <= $unsigned($signed((($signed(wire64) ?
                      (^wire68) : $signed((8'hb0))) ?
                  ((wire64 ? reg121 : wire66) || (wire64 ?
                      (8'hbd) : wire64)) : (8'had))));
              reg124 <= (|$unsigned(wire67[(2'h3):(2'h2)]));
              reg125 <= {(reg124[(2'h2):(1'h0)] ~^ ((~&(reg123 ?
                      reg121 : wire68)) <= $signed(((8'h9f) ?
                      reg123 : wire69)))),
                  wire119};
            end
          else
            begin
              reg123 <= $unsigned(reg124);
              reg124 <= ($signed((|$unsigned(reg122))) ?
                  (8'ha8) : $signed(((8'had) >= {(8'ha2), $signed(wire69)})));
              reg125 <= $signed(reg124[(2'h2):(2'h2)]);
              reg126 <= $signed($signed($unsigned($unsigned($signed(wire68)))));
            end
          if ((wire65[(2'h3):(2'h3)] ?
              wire68[(2'h2):(2'h2)] : $signed($unsigned(({wire68} ?
                  $unsigned(reg124) : wire119[(3'h7):(2'h2)])))))
            begin
              reg127 <= $unsigned(reg125[(2'h3):(1'h1)]);
              reg128 <= {$unsigned((8'h9f)), wire67};
              reg129 <= $signed((wire64[(2'h3):(2'h3)] ?
                  (!$unsigned((wire65 < reg124))) : ({((8'ha4) - wire65),
                      $signed(wire65)} < (+(^~wire64)))));
            end
          else
            begin
              reg127 <= (8'h9e);
            end
        end
      else
        begin
          if ($signed((~&($unsigned(wire65[(4'hd):(4'hc)]) ?
              $unsigned((wire68 + wire69)) : $signed((~wire65))))))
            begin
              reg121 <= $signed((reg125[(3'h5):(1'h1)] && wire64));
              reg122 <= {wire69,
                  ($unsigned((((8'h9f) - wire67) ?
                          (reg129 == reg123) : $unsigned((8'hb7)))) ?
                      wire69[(4'h8):(1'h0)] : reg125)};
              reg123 <= ($unsigned(wire119) ?
                  {wire65} : ($signed(wire65) ?
                      ({wire66[(3'h7):(2'h2)]} ?
                          wire65[(1'h1):(1'h0)] : (reg129 ?
                              $signed(wire66) : reg124)) : $signed(wire66[(4'ha):(2'h2)])));
            end
          else
            begin
              reg121 <= (~(~|(!(reg125[(3'h7):(2'h3)] || (wire65 >>> reg127)))));
              reg122 <= reg128[(3'h5):(2'h3)];
              reg123 <= reg127;
            end
          reg124 <= $signed((&reg127));
          reg125 <= (reg125 ? $signed(reg126) : wire65[(4'h9):(3'h5)]);
          reg126 <= ((((reg126 ?
              (reg124 ^ reg124) : {(8'hb8),
                  reg126}) << reg129) >= wire69) ^~ $unsigned(($signed((-wire69)) ?
              wire66[(3'h7):(1'h0)] : {reg125, $signed(wire64)})));
          if ($signed($signed({$unsigned((^~wire69))})))
            begin
              reg127 <= reg129[(1'h0):(1'h0)];
              reg128 <= (wire66[(3'h5):(1'h0)] ?
                  reg121[(4'h9):(4'h9)] : (reg121[(1'h1):(1'h0)] ?
                      reg127 : $unsigned(((-reg126) < $unsigned(wire64)))));
              reg129 <= (|wire69[(4'he):(2'h3)]);
              reg130 <= (8'ha1);
            end
          else
            begin
              reg127 <= wire67[(2'h2):(1'h1)];
              reg128 <= $signed(($signed(reg124) & ((|reg130[(4'hc):(1'h1)]) & reg128[(3'h4):(2'h2)])));
              reg129 <= reg125[(3'h5):(2'h2)];
            end
        end
      reg131 <= (~^wire68[(5'h13):(4'hf)]);
      reg132 <= reg125[(3'h4):(2'h2)];
      if ((~^((7'h44) > (((reg127 | wire66) ? $signed(wire69) : wire67) ?
          reg122[(2'h2):(1'h1)] : ((~reg121) ?
              (reg129 ? reg123 : wire69) : (^reg130))))))
        begin
          reg133 <= $signed($signed($unsigned((^~wire65))));
          reg134 <= $unsigned({(8'hb7)});
          reg135 <= ((|$signed($signed($unsigned(reg131)))) ?
              (wire64 ?
                  {reg134, {wire68[(4'hc):(1'h1)]}} : (|{$unsigned(reg121),
                      reg134[(3'h7):(3'h6)]})) : reg124[(1'h0):(1'h0)]);
          if (wire65[(4'he):(3'h6)])
            begin
              reg136 <= $signed(reg126[(1'h0):(1'h0)]);
              reg137 <= $unsigned((($unsigned({wire69,
                  reg127}) - (^~reg127)) != {$unsigned(reg121),
                  reg127[(3'h6):(2'h2)]}));
              reg138 <= reg121[(3'h5):(2'h3)];
              reg139 <= reg129;
              reg140 <= reg137;
            end
          else
            begin
              reg136 <= (((^~$unsigned($unsigned(reg122))) ^~ (+reg137[(1'h0):(1'h0)])) == (~$signed($unsigned((^(8'hae))))));
              reg137 <= (^~((^reg126[(2'h3):(1'h1)]) < (((reg132 & reg130) ?
                      (reg131 ? reg129 : (8'ha6)) : reg135[(4'h8):(2'h3)]) ?
                  {(|(8'ha4)),
                      (wire119 ? reg129 : reg123)} : $unsigned(wire119))));
              reg138 <= $unsigned($unsigned((|(^~$signed(reg138)))));
            end
        end
      else
        begin
          if (reg123)
            begin
              reg133 <= (((reg124 + reg139[(2'h3):(1'h1)]) >> ($unsigned(reg132) ?
                      (reg121 ^ (reg127 >> reg135)) : (^reg133[(5'h12):(5'h10)]))) ?
                  reg122[(2'h2):(2'h2)] : ((^~$signed({reg121, (8'hb4)})) ?
                      reg124[(1'h1):(1'h0)] : ((~|(~^(8'hb7))) & (&reg134[(4'h9):(1'h0)]))));
              reg134 <= (8'ha9);
            end
          else
            begin
              reg133 <= wire119;
            end
          reg135 <= (reg121 ? reg139 : reg127[(3'h5):(2'h2)]);
          reg136 <= ({$unsigned($signed((reg123 << reg139)))} ?
              reg134[(3'h4):(2'h3)] : ($signed((8'hb0)) ?
                  reg140 : reg135[(4'hc):(3'h5)]));
          if ($signed(reg122[(2'h3):(1'h0)]))
            begin
              reg137 <= (^~(~$unsigned($signed(wire64[(5'h12):(1'h0)]))));
              reg138 <= reg136[(4'h8):(1'h0)];
            end
          else
            begin
              reg137 <= reg135;
              reg138 <= $signed({($signed(((8'h9f) != reg135)) > {(reg121 < (8'hb0))}),
                  (((8'h9d) ~^ reg121) ? reg122 : wire65)});
              reg139 <= $unsigned(reg123[(4'hb):(4'ha)]);
              reg140 <= reg130;
            end
        end
      reg141 <= $unsigned($unsigned(($unsigned($unsigned((8'hb2))) >= (reg132[(2'h3):(1'h1)] ?
          (-wire119) : $unsigned((7'h40))))));
    end
  assign wire142 = reg131[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg143 <= $unsigned(wire64);
      if ((((8'hb6) ? (8'ha0) : $signed((reg132 != reg124))) ?
          $unsigned((^$signed($signed(reg125)))) : $unsigned($unsigned(reg123))))
        begin
          if ((~{{reg122, (((8'ha7) ? reg138 : reg141) << (+reg143))}}))
            begin
              reg144 <= (&(reg143[(3'h5):(1'h0)] >= $unsigned($signed($unsigned(reg139)))));
              reg145 <= ({(({reg129} ?
                      $signed(wire67) : wire67) < ($signed(reg139) ?
                      $unsigned(reg130) : reg131)),
                  {($unsigned(reg132) >= $unsigned(reg135)),
                      reg136}} * (^~((7'h44) ? wire64 : $signed(wire65))));
            end
          else
            begin
              reg144 <= $signed(reg133[(5'h13):(4'h8)]);
              reg145 <= (reg138 != $signed(reg143[(4'hf):(4'hd)]));
              reg146 <= (wire67 ?
                  (((wire66[(4'hf):(3'h6)] > {wire65,
                      (7'h44)}) + (!(!reg125))) || reg140) : {$signed({((8'haf) << reg129)})});
              reg147 <= ($signed((reg132[(3'h4):(3'h4)] + ((wire142 + (8'hac)) ^ (!reg125)))) ~^ (reg143[(4'hb):(4'ha)] < ($unsigned($signed(wire119)) >> {(^reg126)})));
            end
          reg148 <= ({reg145[(5'h10):(4'hf)],
              (~&((reg133 ? reg141 : wire119) != reg128))} ^ (-wire65));
          reg149 <= (|((8'hb8) || $unsigned((reg129[(2'h3):(2'h3)] | (reg141 * reg134)))));
        end
      else
        begin
          reg144 <= (~&$signed((~&$unsigned((!reg123)))));
        end
    end
  assign wire150 = reg146[(3'h6):(1'h1)];
  assign wire151 = (+reg145[(2'h3):(2'h3)]);
  assign wire152 = (~|((reg121 ^ (reg121 < ((8'h9d) <= reg144))) ?
                       reg121[(4'h9):(2'h3)] : reg137));
  always
    @(posedge clk) begin
      reg153 <= wire152;
      reg154 <= $signed((!{($unsigned((8'hb3)) ? wire67 : (8'hae)),
          wire65[(4'hc):(3'h7)]}));
      if ((reg146 * $unsigned(((!wire64) ?
          $signed($unsigned((8'hac))) : reg149))))
        begin
          if (((^~reg135[(4'hd):(1'h0)]) < reg131[(1'h0):(1'h0)]))
            begin
              reg155 <= reg136[(3'h5):(1'h1)];
              reg156 <= $unsigned(($unsigned((&{reg124, reg135})) ?
                  reg138 : {(8'hbd)}));
            end
          else
            begin
              reg155 <= reg154[(1'h1):(1'h1)];
              reg156 <= $signed((wire65 ?
                  (wire67[(4'h8):(3'h6)] < $signed({(8'haa)})) : $unsigned(((^reg129) <= $unsigned(wire69)))));
              reg157 <= reg145;
              reg158 <= wire65[(2'h2):(2'h2)];
              reg159 <= ($signed(reg147[(2'h2):(2'h2)]) ?
                  wire67 : $signed((~^($signed(wire68) ?
                      reg134 : $signed(reg132)))));
            end
          reg160 <= (($unsigned($unsigned($unsigned((8'hb8)))) != $signed(($signed(wire67) ?
                  reg139 : wire142))) ?
              $unsigned($signed($unsigned(reg149))) : (~&($unsigned((reg132 ?
                  (8'haa) : reg128)) | {(reg132 ? reg149 : wire65),
                  reg143[(2'h2):(1'h1)]})));
        end
      else
        begin
          reg155 <= ({($unsigned((reg149 == reg133)) ?
                      $unsigned($signed(reg143)) : ($unsigned(reg135) ?
                          (|reg154) : wire68)),
                  reg154[(1'h1):(1'h1)]} ?
              reg145 : ($signed(reg134[(2'h2):(1'h0)]) < reg148));
          if ($unsigned(({(8'hb1),
              $signed((~&reg137))} * $signed(reg125[(1'h0):(1'h0)]))))
            begin
              reg156 <= reg144[(5'h10):(1'h0)];
            end
          else
            begin
              reg156 <= {reg148[(1'h0):(1'h0)], $unsigned(wire66)};
              reg157 <= (($signed({$unsigned(reg133), reg138}) ?
                  reg154 : reg144) < reg140[(3'h4):(2'h2)]);
              reg158 <= $unsigned((7'h40));
              reg159 <= wire66;
              reg160 <= (+$signed(reg156));
            end
          reg161 <= wire64;
          if ((($unsigned((reg130[(3'h5):(1'h0)] >= ((8'h9e) ?
                  reg144 : wire142))) >> (~^reg154[(1'h0):(1'h0)])) ?
              $signed(((~^$unsigned(reg145)) ?
                  (-(reg138 || wire150)) : (~&{reg137}))) : (8'hb1)))
            begin
              reg162 <= (reg141[(3'h6):(1'h1)] <<< ({(~&reg128[(1'h0):(1'h0)])} ?
                  (~|$signed($unsigned(wire152))) : $unsigned(reg137)));
              reg163 <= (wire119[(1'h0):(1'h0)] ?
                  reg129[(3'h4):(1'h0)] : $signed((($unsigned(reg138) < reg138) ?
                      wire152 : ((8'hb1) <<< (~^(8'hb0))))));
              reg164 <= reg156;
              reg165 <= (^(($unsigned(reg146) ? (~|(!reg128)) : reg140) ?
                  (reg161[(3'h6):(1'h1)] ?
                      wire151[(1'h1):(1'h1)] : $signed((~^reg146))) : reg133));
            end
          else
            begin
              reg162 <= reg158[(3'h4):(2'h3)];
            end
        end
      reg166 <= $unsigned($unsigned((!{reg132})));
      if (wire67[(3'h5):(3'h5)])
        begin
          reg167 <= ($unsigned((~(&$signed(reg159)))) ?
              {((reg138[(3'h4):(2'h3)] <= reg136) ?
                      $unsigned($unsigned(reg123)) : reg145)} : $unsigned($unsigned((~^(^~wire119)))));
          if ((8'ha3))
            begin
              reg168 <= (wire150[(4'h9):(3'h5)] ?
                  wire68[(1'h1):(1'h1)] : reg145);
              reg169 <= (!(((8'hbb) <<< reg147) ?
                  (((~|(8'hb5)) ? $signed(wire151) : $signed(reg160)) ?
                      (reg136 ?
                          (reg157 ?
                              reg121 : (8'hb2)) : (reg162 - reg157)) : reg162[(3'h6):(3'h5)]) : (reg163[(5'h10):(5'h10)] << reg161[(4'h9):(1'h1)])));
            end
          else
            begin
              reg168 <= $unsigned((~$unsigned($signed(reg157))));
              reg169 <= (8'hb0);
            end
          reg170 <= ($unsigned(($signed(reg123[(4'hf):(4'h8)]) >= reg137[(2'h3):(2'h3)])) << reg158[(4'h9):(2'h2)]);
        end
      else
        begin
          if (reg137[(4'he):(1'h1)])
            begin
              reg167 <= $unsigned($unsigned({wire151, wire67[(4'h9):(4'h9)]}));
              reg168 <= reg157[(1'h1):(1'h0)];
            end
          else
            begin
              reg167 <= $signed((reg124[(2'h2):(2'h2)] ?
                  (reg126 ? reg137 : reg127) : (&wire142)));
              reg168 <= (reg168 & reg149);
              reg169 <= $unsigned($signed(reg170));
              reg170 <= reg148;
              reg171 <= (~|$signed({reg154[(2'h3):(2'h3)],
                  (~^((8'haa) ? wire152 : reg140))}));
            end
          reg172 <= ($signed(wire67) ?
              (|reg162) : $signed(((&$unsigned(wire142)) && reg159)));
          reg173 <= ($signed({$signed(wire151)}) ^ (reg135 - (-reg168[(3'h4):(2'h2)])));
          if ((~^(~&reg167[(2'h2):(1'h1)])))
            begin
              reg174 <= $unsigned(reg144);
              reg175 <= $signed(reg169);
            end
          else
            begin
              reg174 <= {reg162, reg172[(4'hf):(4'h9)]};
              reg175 <= wire67;
              reg176 <= reg156;
            end
        end
    end
  always
    @(posedge clk) begin
      if ((reg138[(3'h6):(3'h5)] ?
          $signed($unsigned((8'hb1))) : (reg155[(2'h2):(1'h0)] + reg128[(3'h6):(2'h3)])))
        begin
          if ((^~$unsigned(reg131)))
            begin
              reg177 <= {(((reg158 ?
                              reg144[(3'h6):(2'h3)] : (reg139 ?
                                  wire119 : reg158)) ?
                          reg141 : reg134) ?
                      ($unsigned($signed(wire64)) ?
                          reg126[(1'h1):(1'h0)] : ((reg126 == wire152) >>> reg155)) : reg148[(2'h2):(1'h1)])};
              reg178 <= (($signed((~|$unsigned(reg126))) ?
                  (~$unsigned(wire69)) : (($signed(wire67) && (~^reg135)) ?
                      $signed(reg168[(4'h8):(2'h3)]) : (~&reg163[(4'hb):(3'h4)]))) || $unsigned({$unsigned($unsigned(wire68)),
                  $signed($unsigned(reg122))}));
              reg179 <= (({({reg134, reg173} ^~ reg149[(4'h9):(3'h7)]),
                  reg137} | {$signed((~|reg172)),
                  ((wire67 ? reg125 : reg164) ?
                      (~^reg176) : reg159)}) >>> wire64);
              reg180 <= ({reg158[(4'ha):(3'h7)]} ?
                  $signed(wire142[(3'h7):(2'h3)]) : {reg169[(4'he):(4'hd)],
                      ((8'h9e) ? (!$signed((8'had))) : {(~^reg128)})});
              reg181 <= ($signed(wire66) ^~ $unsigned($signed($signed((reg141 ?
                  reg177 : reg154)))));
            end
          else
            begin
              reg177 <= ($unsigned((((reg157 ? (8'hab) : reg164) ?
                          $signed((8'ha3)) : (reg177 ^~ reg181)) ?
                      $signed(((8'hbb) ?
                          (8'h9e) : reg166)) : $signed($unsigned(wire69)))) ?
                  reg145 : $unsigned({reg126[(2'h2):(1'h0)],
                      reg171[(4'hd):(4'hb)]}));
              reg178 <= ((reg132[(3'h5):(2'h3)] ?
                      $signed(reg155[(1'h1):(1'h1)]) : $unsigned(reg149)) ?
                  (((^(~&wire151)) ? (8'hbb) : $unsigned((reg155 - reg157))) ?
                      (^~(~&reg171[(4'ha):(1'h0)])) : $unsigned(($signed(reg168) ?
                          (~&wire142) : (8'hb2)))) : reg180[(2'h3):(2'h3)]);
              reg179 <= $signed({((reg131 && $signed(reg133)) & {(reg147 ?
                          reg180 : reg140),
                      $unsigned((8'ha3))})});
              reg180 <= reg128;
            end
          if ((((($unsigned(reg121) && (wire119 >> (8'hbb))) >= $signed((reg168 < (8'ha0)))) ^ reg138[(3'h7):(3'h4)]) >>> (reg138[(3'h4):(3'h4)] ?
              {reg136[(4'hd):(1'h1)]} : (+(^(reg169 ? (8'ha9) : reg147))))))
            begin
              reg182 <= $signed({(~&((reg164 == wire69) ?
                      $unsigned(wire67) : reg168[(3'h5):(1'h1)]))});
              reg183 <= (((8'had) ?
                  $signed((&$unsigned(reg124))) : (((~&reg160) > (^~reg124)) ^~ $unsigned($unsigned((8'hb8))))) & wire119[(1'h1):(1'h0)]);
            end
          else
            begin
              reg182 <= (({({(8'hbe)} ? reg125 : reg169),
                      (+reg183)} >> (~&($unsigned(reg166) ?
                      $signed(reg135) : $signed((8'hbb))))) ?
                  reg139[(2'h3):(2'h3)] : {($unsigned((wire151 ^ reg175)) ?
                          wire66 : ($signed(reg147) ?
                              (8'ha7) : (reg143 + wire64)))});
              reg183 <= (^~$unsigned($signed((7'h40))));
              reg184 <= ($signed($signed(($signed(reg128) ?
                      reg171[(4'he):(1'h0)] : {reg163, (8'hac)}))) ?
                  wire142 : wire152);
              reg185 <= $signed(reg136);
              reg186 <= $unsigned($signed(wire151[(3'h4):(2'h2)]));
            end
          reg187 <= reg158[(3'h4):(3'h4)];
          reg188 <= ((~&reg174) << ((((reg121 ? reg160 : reg130) ?
                  $unsigned(reg180) : (reg179 ?
                      (8'hb1) : reg133)) <<< $signed((&reg144))) ?
              (~|({reg139} ?
                  $signed((8'hbc)) : reg178[(4'h8):(1'h0)])) : ((8'hb8) + {$signed(reg169)})));
        end
      else
        begin
          reg177 <= ((-reg156[(4'hb):(4'h9)]) > reg177);
          reg178 <= {$signed(((((8'hb3) | wire65) ^ $signed(wire69)) == (-$signed(reg187)))),
              reg121[(4'hc):(4'ha)]};
          reg179 <= (reg137 * ({($unsigned((8'hbf)) ^ $signed(reg186))} - $signed(($signed(reg182) ~^ (!(8'ha6))))));
        end
      reg189 <= (8'haf);
    end
  assign wire190 = (|$unsigned(({{reg149, reg171}} ?
                       reg186[(4'ha):(3'h4)] : (~|reg137[(2'h3):(1'h1)]))));
  always
    @(posedge clk) begin
      reg191 <= $unsigned(($unsigned($unsigned(wire66[(2'h2):(2'h2)])) ?
          $unsigned(wire190[(3'h6):(3'h5)]) : (^{(-reg157), $signed(reg126)})));
      reg192 <= reg181[(2'h2):(1'h0)];
    end
  module193 #() modinst227 (.wire198(reg146), .wire197(reg188), .wire195(reg187), .wire196(reg179), .y(wire226), .clk(clk), .wire194(reg121));
endmodule

module module4
#(parameter param56 = (|(!(((~|(8'hb4)) ? ((8'hb9) ? (7'h42) : (8'hb4)) : ((8'hb2) ? (8'hba) : (8'h9e))) ? (~|((8'hac) << (8'ha8))) : (((8'hb4) ? (7'h40) : (8'hb4)) ? ((8'ha3) <= (8'hba)) : ((8'ha6) ? (8'hb5) : (8'hb5)))))), 
parameter param57 = {{({((8'h9d) > (8'ha4)), param56} ? ((~&param56) ? (^~param56) : (param56 << param56)) : param56)}})
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire6;
  input wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire18,
                 wire17,
                 wire16,
                 wire12,
                 wire11,
                 reg15,
                 reg14,
                 reg13,
                 reg10,
                 reg9,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg9 <= (+$signed((((wire7 ? (8'hba) : wire6) ?
          {wire6, (8'h9f)} : $unsigned(wire6)) - ($unsigned(wire7) ?
          $signed(wire5) : ((7'h41) ? wire5 : (7'h43))))));
      reg10 <= $signed(reg9[(4'hf):(4'hb)]);
    end
  assign wire11 = ((wire6[(3'h6):(3'h4)] ~^ (wire8[(2'h2):(1'h1)] <<< wire5)) ?
                      {(((8'ha1) ?
                              $signed(wire7) : wire6) && wire8[(2'h2):(1'h0)])} : reg10[(3'h4):(2'h2)]);
  assign wire12 = (^wire7[(3'h5):(3'h5)]);
  always
    @(posedge clk) begin
      reg13 <= $signed($signed({({reg9, wire8} != reg9), $signed((!wire7))}));
      reg14 <= wire11;
      reg15 <= (($signed(($signed(wire12) | reg10[(2'h2):(1'h0)])) ?
              (~^(^~$unsigned(wire5))) : wire6[(3'h7):(1'h0)]) ?
          wire12[(1'h0):(1'h0)] : $signed(wire11));
    end
  assign wire16 = $unsigned({(^~$unsigned(reg10)),
                      ($unsigned(reg13[(1'h1):(1'h0)]) ^~ $unsigned(wire8[(1'h1):(1'h0)]))});
  assign wire17 = reg14;
  assign wire18 = (^wire12[(2'h2):(1'h1)]);
  module19 #() modinst52 (wire51, clk, reg13, wire5, wire6, reg9);
  assign wire53 = wire5[(4'hc):(4'hc)];
  assign wire54 = $unsigned(($signed($unsigned((wire11 ? wire51 : reg9))) ?
                      (wire7[(4'h9):(3'h7)] ?
                          $signed((wire17 ?
                              wire17 : reg9)) : reg9) : $signed(($signed(wire51) ?
                          (!reg14) : (wire8 ? reg14 : wire18)))));
  assign wire55 = wire12;
endmodule

module module19
#(parameter param50 = ((((((8'hb3) || (8'ha3)) ? ((8'ha6) + (8'hb0)) : ((8'hba) + (7'h42))) ? ((|(8'hb8)) ? (^~(8'hbf)) : ((8'haa) < (8'hbf))) : ((8'haa) > ((8'hbc) ? (8'hac) : (8'ha6)))) >> {(((8'hb4) ^ (8'ha5)) ? ((7'h41) > (8'hb9)) : ((8'h9f) ~^ (8'ha3)))}) ? (~&{{{(8'hac), (7'h44)}}, (((7'h40) ? (7'h44) : (8'ha4)) | ((8'hb4) != (8'ha3)))}) : (((~&{(8'hb4), (8'hb8)}) - (((7'h43) << (7'h40)) || (~&(8'ha4)))) ? ((((8'hbf) == (8'hb2)) ? (&(8'hb7)) : ((8'h9d) && (8'ha8))) & {(~|(8'ha4))}) : ((8'ha2) ? (|((8'hba) == (8'hae))) : {((8'hbe) <= (8'hb5))}))))
(y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire23;
  input wire [(4'h9):(1'h0)] wire22;
  input wire signed [(5'h13):(1'h0)] wire21;
  input wire [(4'h9):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire42;
  wire [(3'h5):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire24;
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire24 = {(wire23[(4'h8):(2'h3)] ?
                          $unsigned((wire21[(2'h2):(2'h2)] ?
                              $unsigned(wire23) : (^~wire20))) : (wire20[(2'h2):(1'h1)] ?
                              ((~^wire21) > (wire21 ?
                                  wire23 : wire22)) : ((wire23 != wire22) ?
                                  $unsigned((7'h40)) : (wire20 <= wire20))))};
  assign wire25 = $signed(($unsigned(wire24[(4'h8):(3'h6)]) - wire23));
  assign wire26 = $signed($signed((((&wire24) - wire21[(2'h3):(1'h1)]) >= wire20)));
  assign wire27 = $signed(($signed($unsigned((wire24 ?
                      wire23 : wire25))) > {(wire24 ?
                          {wire23, wire23} : $signed((8'ha5)))}));
  assign wire28 = $signed($unsigned((wire22 ?
                      $signed((wire22 ? wire23 : wire20)) : wire22)));
  assign wire29 = wire23;
  always
    @(posedge clk) begin
      reg30 <= ($signed($signed(((wire23 ?
          wire26 : wire25) == $signed(wire27)))) ~^ wire24);
      if (wire26[(3'h4):(2'h3)])
        begin
          reg31 <= $signed($unsigned($signed($signed(wire22[(3'h7):(1'h0)]))));
          reg32 <= (~|$unsigned({(+(wire26 - wire22))}));
          reg33 <= wire27;
        end
      else
        begin
          if ($signed($signed($signed(reg32[(4'h9):(3'h6)]))))
            begin
              reg31 <= (wire29 ?
                  ($signed((((8'ha4) ?
                      wire21 : reg31) != wire21[(3'h4):(1'h0)])) < ((~&$signed(wire28)) ?
                      (wire21 ?
                          (wire29 ~^ reg33) : {wire20}) : reg31)) : ($signed(wire21) ?
                      ($signed($signed((8'ha7))) <= $unsigned($unsigned(reg30))) : (((reg32 ?
                          wire26 : wire21) >>> wire21) ^~ reg30[(2'h3):(2'h3)])));
              reg32 <= (wire27[(1'h0):(1'h0)] ? wire23 : wire27);
              reg33 <= wire23[(3'h4):(3'h4)];
            end
          else
            begin
              reg31 <= wire29[(2'h3):(1'h0)];
              reg32 <= wire29[(2'h2):(1'h0)];
              reg33 <= wire22[(1'h1):(1'h0)];
            end
        end
      if (((wire25 && wire23) >>> (8'ha5)))
        begin
          reg34 <= (-($signed((8'ha4)) & ($unsigned((^reg33)) ?
              reg33[(1'h1):(1'h1)] : ($unsigned(wire24) <<< (~|wire28)))));
          reg35 <= (|reg31);
          reg36 <= (((^wire26[(4'h9):(3'h7)]) ?
              reg35 : $signed(wire23)) & $signed($signed(((!(8'hae)) ?
              (~wire20) : wire28))));
        end
      else
        begin
          reg34 <= (((reg32 > {{wire25},
                  $unsigned(reg36)}) & $signed({(wire22 <= reg30)})) ?
              ((wire20[(4'h8):(3'h6)] ?
                  $unsigned(reg30) : ((reg36 >>> reg35) ?
                      (reg33 > wire23) : $signed(reg31))) & wire20) : ($unsigned($unsigned(wire25)) ?
                  wire23[(3'h6):(1'h1)] : {($signed(wire22) ?
                          (8'hb8) : ((8'hb7) < wire22))}));
        end
    end
  assign wire37 = reg31;
  assign wire38 = ((8'hac) ?
                      wire20[(3'h4):(2'h3)] : $unsigned(((reg34[(3'h4):(1'h1)] <<< wire22[(3'h6):(2'h2)]) >> (|$signed(wire28)))));
  assign wire39 = ((($signed((wire24 ? reg36 : reg34)) ?
                              (|((8'had) ?
                                  wire29 : wire37)) : ((~^reg35) > (reg31 ?
                                  reg31 : reg33))) ?
                          (^~$signed((~^reg34))) : $unsigned((|(wire28 ^~ (8'hbe))))) ?
                      $unsigned(($unsigned(reg33) == reg34[(5'h10):(3'h6)])) : $unsigned(reg35));
  assign wire40 = (~^(&(wire23 ? wire25 : reg30[(3'h7):(2'h2)])));
  assign wire41 = ({wire26[(3'h5):(3'h5)],
                      $unsigned((8'ha6))} >> wire22[(2'h2):(2'h2)]);
  assign wire42 = wire24;
  assign wire43 = ({((8'ha3) ^ $signed(wire28)),
                          $signed($unsigned(((8'hb5) ? wire27 : reg36)))} ?
                      $signed($signed({((8'hbd) ? wire40 : wire21),
                          (~&wire37)})) : (^wire40));
  always
    @(posedge clk) begin
      reg44 <= ($unsigned($signed($unsigned((wire28 ~^ (8'hab))))) ?
          reg30 : ((|(&(wire43 != wire20))) ? wire21[(3'h5):(2'h3)] : wire22));
      reg45 <= {$unsigned(($signed(wire26) ?
              $signed((reg35 <<< wire37)) : ((!reg31) ?
                  $unsigned(wire42) : (wire41 ? (8'hbf) : wire28))))};
      reg46 <= wire39[(2'h3):(2'h3)];
      reg47 <= $unsigned((~&$signed((+reg33))));
      if ($signed((reg36 ?
          (reg44 ? (&{(8'hb6)}) : (~|(wire27 != wire24))) : wire20)))
        begin
          reg48 <= $unsigned($signed((~^(wire21 != {(8'hbe), wire21}))));
        end
      else
        begin
          reg48 <= (-(^$unsigned(wire26)));
          reg49 <= ((8'hba) ?
              $signed({$unsigned(wire24),
                  (((8'hbc) ? wire38 : wire28) ?
                      $signed(reg48) : wire22)}) : (reg35 | {((reg31 ?
                      (8'h9f) : reg33) > (reg31 ^ (7'h40)))}));
        end
    end
endmodule

module module193  (y, clk, wire198, wire197, wire196, wire195, wire194);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire198;
  input wire signed [(3'h5):(1'h0)] wire197;
  input wire signed [(4'hd):(1'h0)] wire196;
  input wire [(2'h2):(1'h0)] wire195;
  input wire signed [(3'h4):(1'h0)] wire194;
  wire [(3'h6):(1'h0)] wire225;
  wire [(4'hd):(1'h0)] wire224;
  wire [(4'hd):(1'h0)] wire223;
  wire signed [(4'h9):(1'h0)] wire222;
  wire signed [(5'h14):(1'h0)] wire221;
  wire [(3'h6):(1'h0)] wire220;
  wire signed [(4'hc):(1'h0)] wire219;
  wire [(3'h5):(1'h0)] wire218;
  wire signed [(4'he):(1'h0)] wire209;
  wire [(4'he):(1'h0)] wire208;
  wire [(3'h6):(1'h0)] wire207;
  wire signed [(5'h14):(1'h0)] wire206;
  wire [(5'h11):(1'h0)] wire205;
  wire signed [(3'h7):(1'h0)] wire204;
  wire [(3'h7):(1'h0)] wire203;
  wire [(4'hd):(1'h0)] wire202;
  wire [(4'h8):(1'h0)] wire201;
  wire signed [(4'h8):(1'h0)] wire200;
  wire signed [(3'h7):(1'h0)] wire199;
  reg [(4'h9):(1'h0)] reg217 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg216 = (1'h0);
  reg [(2'h3):(1'h0)] reg215 = (1'h0);
  reg [(5'h11):(1'h0)] reg214 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg213 = (1'h0);
  reg [(5'h11):(1'h0)] reg212 = (1'h0);
  reg [(4'ha):(1'h0)] reg211 = (1'h0);
  reg [(3'h6):(1'h0)] reg210 = (1'h0);
  assign y = {wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire219,
                 wire218,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 (1'h0)};
  assign wire199 = (|wire197[(3'h4):(2'h3)]);
  assign wire200 = $signed((8'hbd));
  assign wire201 = (wire200 ?
                       wire194[(1'h1):(1'h0)] : ((($unsigned(wire196) ?
                               wire197 : wire196) <<< $unsigned($unsigned(wire196))) ?
                           wire198 : wire196[(3'h7):(2'h2)]));
  assign wire202 = (~$signed(($unsigned((wire194 && wire194)) ^ (wire196 && (wire195 ?
                       wire199 : wire194)))));
  assign wire203 = {(wire199 == (wire194 == {((8'h9d) <<< wire202),
                           wire197[(2'h3):(2'h3)]})),
                       wire196};
  assign wire204 = $unsigned($unsigned(wire199));
  assign wire205 = wire196;
  assign wire206 = (~^wire202);
  assign wire207 = wire204[(3'h7):(1'h1)];
  assign wire208 = (wire204[(3'h4):(1'h1)] ?
                       wire202[(3'h6):(2'h2)] : wire199[(1'h1):(1'h1)]);
  assign wire209 = (wire204 && (wire204[(1'h0):(1'h0)] ?
                       $signed(({wire207} ?
                           (wire195 ^~ wire199) : $signed(wire205))) : $signed(wire196[(2'h3):(1'h0)])));
  always
    @(posedge clk) begin
      reg210 <= $unsigned(wire200[(1'h0):(1'h0)]);
      reg211 <= $unsigned($unsigned(wire194[(3'h4):(3'h4)]));
      reg212 <= ((-(^wire198[(3'h7):(1'h0)])) ?
          $signed(wire205) : $signed(wire197));
    end
  always
    @(posedge clk) begin
      reg213 <= (~(|reg212));
      reg214 <= {wire200,
          {((~&(~|wire198)) != wire194[(2'h3):(1'h0)]),
              $unsigned($unsigned(((8'hb1) ? (8'hb6) : reg212)))}};
      reg215 <= (|$signed({$signed($signed(reg210)),
          $signed(reg212[(4'hc):(4'h8)])}));
      reg216 <= (^~(!wire201));
      reg217 <= (wire198[(3'h6):(1'h0)] >= wire204);
    end
  assign wire218 = {{$signed(((wire200 ? reg216 : reg210) + {(8'ha1),
                               wire195})),
                           $signed(wire196)}};
  assign wire219 = (($signed($unsigned(reg213)) ?
                           ($signed(wire207) || {$unsigned(reg215),
                               (&(8'hb4))}) : $unsigned(((!wire208) | (wire195 < (8'ha3))))) ?
                       (wire204[(3'h7):(3'h7)] > (-reg212[(4'he):(4'h9)])) : (+$unsigned($signed(reg214[(4'ha):(4'ha)]))));
  assign wire220 = (wire196 > reg211);
  assign wire221 = reg210[(2'h3):(1'h1)];
  assign wire222 = $unsigned((~|$unsigned({(reg212 | wire206)})));
  assign wire223 = ($unsigned(((wire200[(3'h6):(3'h6)] || wire220) ?
                       wire200[(1'h1):(1'h0)] : $signed($signed(reg214)))) & (~($signed($signed(wire220)) ?
                       $unsigned({wire199}) : (&wire205))));
  assign wire224 = reg216[(2'h2):(2'h2)];
  assign wire225 = $signed((&{($signed(wire219) ?
                           reg215 : (reg213 <= wire194))}));
endmodule

module module70  (y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'h1c6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire75;
  input wire [(5'h12):(1'h0)] wire74;
  input wire signed [(3'h4):(1'h0)] wire73;
  input wire signed [(3'h7):(1'h0)] wire72;
  input wire signed [(5'h11):(1'h0)] wire71;
  wire [(3'h7):(1'h0)] wire118;
  wire [(5'h11):(1'h0)] wire117;
  wire [(3'h7):(1'h0)] wire116;
  wire signed [(4'hc):(1'h0)] wire115;
  wire signed [(4'hf):(1'h0)] wire114;
  wire signed [(5'h10):(1'h0)] wire112;
  wire [(5'h11):(1'h0)] wire111;
  wire signed [(4'hc):(1'h0)] wire110;
  wire signed [(2'h3):(1'h0)] wire109;
  wire signed [(4'he):(1'h0)] wire108;
  wire signed [(2'h2):(1'h0)] wire107;
  wire [(2'h3):(1'h0)] wire105;
  wire signed [(5'h12):(1'h0)] wire91;
  wire [(4'ha):(1'h0)] wire90;
  wire [(4'h9):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire88;
  wire [(2'h2):(1'h0)] wire83;
  wire signed [(4'ha):(1'h0)] wire82;
  reg signed [(5'h15):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(3'h4):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg101 = (1'h0);
  reg [(5'h14):(1'h0)] reg100 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(4'h8):(1'h0)] reg97 = (1'h0);
  reg [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(5'h15):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg86 = (1'h0);
  reg [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(3'h6):(1'h0)] reg76 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire105,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire83,
                 wire82,
                 reg113,
                 reg106,
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
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed($signed({($unsigned(wire75) & wire75),
          $unsigned((wire71 ? wire71 : wire71))})))
        begin
          if ((wire71 ?
              $unsigned($signed(wire74[(4'hf):(3'h4)])) : (wire71 || (8'hbc))))
            begin
              reg76 <= wire74;
              reg77 <= ({wire74} <= $unsigned(wire74[(4'ha):(4'h9)]));
              reg78 <= wire75[(2'h2):(2'h2)];
              reg79 <= {(($signed(((8'hba) ~^ wire73)) >> (|$signed(wire71))) ?
                      reg77[(4'he):(1'h0)] : reg77),
                  wire71};
              reg80 <= reg76;
            end
          else
            begin
              reg76 <= $signed((!reg80));
            end
          reg81 <= ((8'hbc) ?
              $signed(wire71) : ($unsigned({(reg77 && wire72), (~&wire75)}) ?
                  reg76[(3'h6):(3'h4)] : $unsigned(reg76)));
        end
      else
        begin
          reg76 <= $unsigned((8'ha3));
          reg77 <= ($signed($unsigned(wire73[(2'h3):(1'h1)])) <= (wire71 <<< ($unsigned($unsigned(reg77)) ?
              ((wire74 ~^ (8'ha4)) ?
                  (reg76 & reg79) : $signed(reg81)) : (-(~^wire75)))));
          reg78 <= wire73[(2'h3):(1'h0)];
        end
    end
  assign wire82 = ($unsigned(((~wire71[(4'hc):(1'h0)]) ?
                      (((8'ha7) < reg77) ?
                          $unsigned(reg76) : (wire75 == reg77)) : $unsigned(wire75))) >>> ($signed(wire72[(1'h1):(1'h1)]) & {$unsigned($unsigned(reg77)),
                      wire74}));
  assign wire83 = ($signed(reg77) || reg78);
  always
    @(posedge clk) begin
      reg84 <= reg77[(2'h3):(1'h0)];
      reg85 <= ($signed((~$unsigned($unsigned(wire83)))) ?
          ($unsigned(((&wire71) ? $signed(reg81) : wire71)) ?
              (wire74[(1'h1):(1'h1)] >>> wire74[(4'he):(3'h7)]) : (reg77[(1'h1):(1'h1)] > (+$unsigned((8'ha1))))) : wire72);
      reg86 <= wire82[(2'h2):(1'h0)];
      reg87 <= $signed(reg77);
    end
  assign wire88 = $unsigned($signed(reg79[(3'h7):(1'h0)]));
  assign wire89 = (~(wire71 && $signed($signed($unsigned((8'ha3))))));
  assign wire90 = {wire89};
  assign wire91 = (8'h9d);
  always
    @(posedge clk) begin
      if (reg86)
        begin
          reg92 <= wire82[(2'h3):(2'h3)];
          if ((~^wire71[(2'h3):(2'h3)]))
            begin
              reg93 <= reg76;
              reg94 <= (^~{(~|(&(~reg93)))});
              reg95 <= $signed(reg85[(2'h2):(1'h1)]);
            end
          else
            begin
              reg93 <= reg93[(4'h8):(2'h2)];
              reg94 <= $unsigned(reg79);
            end
          reg96 <= wire82[(4'ha):(4'ha)];
          reg97 <= ((^(~|reg79)) >>> reg94);
          reg98 <= (~$signed((~|$signed(reg87))));
        end
      else
        begin
          reg92 <= reg92[(1'h1):(1'h0)];
          reg93 <= (($signed($signed($unsigned((8'ha9)))) ~^ (($unsigned(reg77) + (|wire88)) ?
                  (|reg92[(5'h11):(4'hb)]) : (8'h9c))) ?
              reg93 : (8'hae));
          reg94 <= ($signed((~{(wire89 < reg77)})) || $signed((~|$signed((reg84 ^~ reg87)))));
          reg95 <= reg98;
        end
      if ($unsigned((~|(|(^~(reg80 ? (8'hbb) : (8'haa)))))))
        begin
          reg99 <= (+$signed(reg85));
          reg100 <= reg87;
          reg101 <= reg77;
        end
      else
        begin
          reg99 <= (~&$signed(reg81));
          if ((~$signed(($signed((wire72 ? reg92 : wire89)) ?
              (^$signed(reg101)) : reg94))))
            begin
              reg100 <= (^~{reg99, $unsigned((&reg77[(3'h6):(3'h5)]))});
              reg101 <= reg80;
              reg102 <= reg98[(1'h0):(1'h0)];
              reg103 <= $unsigned(($signed(reg99[(3'h6):(3'h5)]) < wire82));
              reg104 <= reg101[(3'h4):(2'h3)];
            end
          else
            begin
              reg100 <= wire72;
            end
        end
    end
  assign wire105 = ({((8'hb8) ~^ ($unsigned(wire82) ?
                               {reg97, reg79} : $unsigned((8'hb4))))} ?
                       (~$signed((+(reg94 >>> (8'ha7))))) : (reg92 ?
                           $signed(((^~wire73) ?
                               ((8'hb9) >= reg77) : (~|wire72))) : wire91[(4'hb):(3'h4)]));
  always
    @(posedge clk) begin
      reg106 <= $unsigned($signed(reg96[(4'hf):(4'hd)]));
    end
  assign wire107 = reg80;
  assign wire108 = $signed(reg87[(4'h8):(3'h4)]);
  assign wire109 = (reg92 * (!reg77[(4'hb):(4'ha)]));
  assign wire110 = $signed((|wire107));
  assign wire111 = ((($signed(((8'h9c) != wire89)) | $signed($unsigned(wire73))) << $signed(wire72[(2'h2):(2'h2)])) <= reg100[(2'h2):(1'h0)]);
  assign wire112 = $signed((~|($signed($unsigned((8'hae))) && ((8'h9e) ?
                       {reg103} : (8'ha6)))));
  always
    @(posedge clk) begin
      reg113 <= $unsigned({(~|(~&(reg94 < (8'hb5)))),
          $signed($signed(wire112))});
    end
  assign wire114 = wire91[(5'h10):(4'hd)];
  assign wire115 = reg86;
  assign wire116 = {((+($unsigned(reg103) ?
                           wire73 : (-reg99))) * ($signed($signed(reg99)) ?
                           ((reg87 <<< reg97) ?
                               $signed(wire90) : (reg113 <<< wire107)) : {$unsigned((8'h9c)),
                               $unsigned(reg99)}))};
  assign wire117 = reg101[(2'h2):(2'h2)];
  assign wire118 = $unsigned(wire114);
endmodule
