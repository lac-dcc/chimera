module top
#(parameter param200 = (^~(((-(~|(7'h41))) < (+((8'h9f) ? (8'hb7) : (8'hbd)))) ? ((|((8'ha0) <<< (8'hba))) != ((~&(8'haf)) ^~ {(8'h9c)})) : {{(^(8'hbf))}})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h2c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire signed [(4'h9):(1'h0)] wire199;
  wire [(4'hf):(1'h0)] wire198;
  wire signed [(5'h11):(1'h0)] wire197;
  wire signed [(2'h2):(1'h0)] wire196;
  wire signed [(5'h14):(1'h0)] wire195;
  wire [(5'h15):(1'h0)] wire194;
  wire signed [(4'ha):(1'h0)] wire193;
  wire signed [(2'h2):(1'h0)] wire192;
  wire signed [(4'h9):(1'h0)] wire191;
  wire [(5'h12):(1'h0)] wire190;
  wire signed [(5'h15):(1'h0)] wire189;
  wire signed [(4'he):(1'h0)] wire167;
  wire [(5'h10):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire165;
  reg [(4'he):(1'h0)] reg188 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg187 = (1'h0);
  reg signed [(4'he):(1'h0)] reg186 = (1'h0);
  reg [(3'h6):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg183 = (1'h0);
  reg signed [(4'he):(1'h0)] reg182 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg180 = (1'h0);
  reg [(4'h9):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg177 = (1'h0);
  reg [(2'h3):(1'h0)] reg176 = (1'h0);
  reg [(5'h11):(1'h0)] reg175 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg174 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg173 = (1'h0);
  reg [(3'h5):(1'h0)] reg172 = (1'h0);
  reg [(3'h7):(1'h0)] reg171 = (1'h0);
  reg [(4'hc):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg169 = (1'h0);
  reg signed [(4'he):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  assign y = {wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire167,
                 wire4,
                 wire5,
                 wire22,
                 wire26,
                 wire165,
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
                 reg170,
                 reg169,
                 reg168,
                 reg25,
                 reg24,
                 reg23,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $unsigned(wire2[(4'hd):(4'hd)]);
  assign wire5 = (($unsigned((~&wire3)) * {($unsigned(wire3) ?
                         (wire3 ? wire1 : wire0) : wire3),
                     ($unsigned(wire3) ?
                         (wire4 != wire2) : $unsigned(wire4))}) <= wire4);
  always
    @(posedge clk) begin
      reg6 <= (wire5 ? $signed(wire3[(2'h2):(2'h2)]) : (-wire5));
      reg7 <= (~&(wire1 & wire1[(4'he):(4'h8)]));
      reg8 <= wire3[(2'h2):(1'h0)];
      if ((($signed((~(8'hbe))) ? (~^$unsigned((reg6 ? reg7 : wire0))) : reg6) ?
          {$unsigned(wire2[(4'hf):(4'ha)])} : ((((&wire4) ?
                  reg8 : $unsigned(reg8)) ?
              $unsigned({(8'haa), reg6}) : (+(~^reg8))) << (wire4 ?
              reg6 : ((reg6 * reg8) ?
                  reg6[(1'h0):(1'h0)] : (reg7 ? wire0 : reg6))))))
        begin
          if (({reg7[(3'h5):(1'h0)]} == $unsigned((((wire4 ? reg7 : wire3) ?
              wire3 : ((8'h9c) > wire2)) >> (~&(reg6 ? wire4 : wire3))))))
            begin
              reg9 <= ((reg7[(3'h7):(1'h0)] ? wire0 : wire2) ?
                  wire1[(4'h8):(2'h2)] : $unsigned($unsigned(((8'hb4) ?
                      (~|wire5) : (~&reg7)))));
              reg10 <= (reg6[(4'h8):(3'h5)] | reg7[(4'h9):(4'h9)]);
              reg11 <= reg6[(2'h2):(2'h2)];
            end
          else
            begin
              reg9 <= $signed(wire1[(5'h10):(3'h4)]);
              reg10 <= $unsigned($unsigned({$unsigned(wire4)}));
              reg11 <= {$unsigned($unsigned(((~|wire4) ?
                      reg9 : $unsigned(reg11))))};
              reg12 <= $unsigned(({wire2[(3'h4):(2'h2)],
                  wire5} ~^ $signed(($unsigned(reg6) >= $unsigned(wire3)))));
              reg13 <= (reg8[(4'hc):(1'h0)] ?
                  wire2 : (reg8 ^~ (wire3 > (+$unsigned(wire5)))));
            end
          reg14 <= (($unsigned((-wire1[(3'h4):(2'h2)])) ?
              (|reg9) : (!(~&$signed(wire0)))) >> (reg10 == (wire0 ?
              (wire4[(2'h2):(2'h2)] ?
                  reg13[(3'h5):(2'h2)] : (^~wire0)) : (reg6 ?
                  (+reg10) : $signed(wire4)))));
          reg15 <= (~|$signed(($signed((wire0 || reg13)) ?
              (reg8[(2'h3):(2'h2)] > (-reg7)) : wire5)));
          reg16 <= reg14[(4'h8):(3'h7)];
          if (($unsigned($unsigned($signed(reg10))) ?
              ({($signed(wire4) ? (reg7 + reg7) : reg15[(2'h3):(2'h2)]),
                      {(wire5 != (8'hbb)), {wire2}}} ?
                  $unsigned(($unsigned(reg16) ^ (wire3 ?
                      (8'h9e) : reg13))) : ($unsigned((^(7'h40))) ^~ $signed((~reg6)))) : $signed($unsigned({$unsigned(wire0),
                  $unsigned(reg9)}))))
            begin
              reg17 <= $unsigned($signed($signed((~(~^reg8)))));
              reg18 <= $unsigned(((($unsigned(reg14) & $signed(reg9)) ?
                      {$signed(reg6),
                          (reg10 ?
                              wire5 : reg16)} : ((reg7 == reg15) != (!reg12))) ?
                  {wire5[(1'h0):(1'h0)]} : $unsigned(((reg17 ?
                      reg9 : wire2) && {reg15, reg16}))));
              reg19 <= reg8[(4'hf):(3'h4)];
              reg20 <= {$signed((((8'ha8) ^~ reg6[(4'hb):(3'h4)]) ?
                      $unsigned(wire5) : (&wire3[(1'h1):(1'h0)])))};
            end
          else
            begin
              reg17 <= reg10;
              reg18 <= $unsigned($unsigned((~^$unsigned(((8'hb1) >> wire0)))));
              reg19 <= $signed(reg14[(4'hc):(2'h3)]);
              reg20 <= ((reg15[(1'h0):(1'h0)] ?
                  (((reg18 ? (8'ha5) : wire5) <= $signed(wire1)) ?
                      ({reg15, wire2} ?
                          reg13 : $signed(wire2)) : (^~(&(8'hbe)))) : ($unsigned((reg7 ?
                          reg10 : wire0)) ?
                      (~|(~^wire5)) : $signed((reg18 ?
                          reg6 : wire4)))) + wire0[(3'h7):(1'h0)]);
            end
        end
      else
        begin
          reg9 <= ($signed((((reg10 ? reg16 : wire4) > (+wire4)) && wire1)) ?
              reg7[(4'h9):(1'h1)] : wire5[(1'h1):(1'h0)]);
          reg10 <= $signed({(^$unsigned(wire3[(1'h1):(1'h0)])), (~reg9)});
          if ((wire4[(3'h6):(1'h1)] ?
              (!$unsigned(reg19[(3'h6):(2'h3)])) : $signed(wire5[(1'h1):(1'h1)])))
            begin
              reg11 <= reg7;
              reg12 <= (((~|wire0) ?
                  wire0[(4'ha):(4'h9)] : $unsigned((reg16 ~^ wire1[(2'h3):(1'h1)]))) * ({((reg14 ?
                      reg6 : (8'ha1)) ~^ (reg13 <= (8'ha8))),
                  $signed($signed(reg17))} >> (^~(~(~reg10)))));
              reg13 <= (($unsigned(reg10[(4'hc):(2'h2)]) ?
                      (reg13[(1'h0):(1'h0)] >= wire1) : $unsigned((8'hac))) ?
                  ((|reg15) & wire0[(4'ha):(1'h1)]) : $signed($unsigned($unsigned($signed(wire4)))));
              reg14 <= reg9[(3'h6):(1'h1)];
            end
          else
            begin
              reg11 <= reg7;
              reg12 <= wire0;
              reg13 <= ($signed((^wire5)) ?
                  $signed(reg16) : $signed($signed(({wire1,
                      wire0} && $unsigned(wire5)))));
            end
        end
      reg21 <= {$signed(((-$signed(reg6)) ?
              $unsigned(reg7) : (reg14 ? (|reg10) : (~|(8'h9f))))),
          reg16[(2'h3):(2'h3)]};
    end
  assign wire22 = ((reg6[(3'h7):(3'h4)] ?
                          (8'ha9) : (reg17[(1'h0):(1'h0)] ~^ reg19[(4'hd):(3'h6)])) ?
                      reg15[(4'hd):(4'ha)] : ({reg6[(4'h8):(2'h3)], reg12} ?
                          {$signed(reg11),
                              ({wire3} ?
                                  reg19 : (8'h9c))} : {reg7[(3'h4):(1'h0)],
                              reg17}));
  always
    @(posedge clk) begin
      reg23 <= (8'hb4);
      reg24 <= {{($unsigned($signed(reg18)) <<< {$signed(wire2),
                  reg8[(2'h3):(2'h2)]}),
              $signed($unsigned(reg6[(4'ha):(4'ha)]))}};
    end
  always
    @(posedge clk) begin
      reg25 <= reg7[(1'h0):(1'h0)];
    end
  assign wire26 = $unsigned({{$signed(reg21[(5'h10):(4'hc)]),
                          (|reg9[(3'h7):(1'h1)])},
                      ((~(reg10 >>> (8'hbf))) ?
                          $signed((&reg6)) : $signed((reg8 ?
                              reg10 : (8'ha0))))});
  module27 #() modinst166 (wire165, clk, wire22, wire5, reg19, wire3, reg23);
  assign wire167 = reg20;
  always
    @(posedge clk) begin
      reg168 <= $signed($unsigned($unsigned($signed((wire0 >>> wire165)))));
      reg169 <= wire0;
      if (($signed($signed(((reg9 ?
          (8'ha2) : reg16) >>> $unsigned(reg7)))) | (8'hac)))
        begin
          reg170 <= $unsigned((!reg20[(4'ha):(4'h9)]));
        end
      else
        begin
          if (((!wire5) >>> (($unsigned($unsigned(reg21)) >= $unsigned(wire26)) != (~reg11))))
            begin
              reg170 <= $unsigned($signed(($unsigned($signed(reg17)) == reg17[(1'h0):(1'h0)])));
              reg171 <= ((reg17[(1'h0):(1'h0)] ?
                  ({(wire165 <= reg11), wire1} ?
                      ((reg6 >> reg18) << {reg23}) : ((!reg170) ?
                          (reg170 == reg25) : $signed(reg18))) : reg16) >> (reg14 >>> (-(^reg11[(3'h7):(3'h5)]))));
              reg172 <= $signed(((($unsigned((8'haa)) ?
                  reg11[(1'h0):(1'h0)] : (^~(7'h40))) + (-reg23)) & reg24));
              reg173 <= ((8'had) ?
                  (reg19[(2'h2):(1'h0)] ~^ $signed((^~wire5))) : $unsigned((reg13 < reg21)));
              reg174 <= {reg172, wire165[(2'h2):(1'h1)]};
            end
          else
            begin
              reg170 <= (!$unsigned(reg12));
              reg171 <= wire26;
              reg172 <= (((((reg23 - (8'hb1)) ? reg174 : $signed(wire5)) ?
                  (7'h44) : $signed((wire165 ?
                      wire22 : reg15))) >= reg172) <= wire167[(1'h0):(1'h0)]);
            end
          if ($unsigned({$signed(reg6[(3'h4):(2'h3)])}))
            begin
              reg175 <= $unsigned(($unsigned($signed((reg7 == reg172))) > reg7[(3'h7):(3'h7)]));
            end
          else
            begin
              reg175 <= $unsigned(reg18[(2'h2):(2'h2)]);
            end
          reg176 <= reg11;
        end
      if ({($signed(((&reg175) & reg18)) > reg173), reg7[(2'h2):(1'h0)]})
        begin
          if ({{(~^($unsigned(reg21) ?
                      (reg172 ? reg174 : reg172) : (reg19 ^ wire165))),
                  {((~wire165) ? $signed(reg12) : wire4[(3'h7):(3'h6)])}}})
            begin
              reg177 <= ({reg8} - (($signed($signed(wire5)) ?
                      reg11[(5'h10):(4'he)] : (8'hb1)) ?
                  $signed($unsigned(reg175[(2'h2):(1'h0)])) : wire165));
            end
          else
            begin
              reg177 <= {((~^reg175[(4'h9):(1'h1)]) ?
                      reg7[(4'h8):(2'h2)] : reg20),
                  {reg21[(1'h1):(1'h0)]}};
              reg178 <= (((8'hbf) ?
                  {reg9[(2'h3):(2'h3)]} : $unsigned(reg174[(1'h0):(1'h0)])) - (8'hba));
              reg179 <= {(8'hb6)};
              reg180 <= $signed(reg172);
              reg181 <= $signed((reg7[(1'h0):(1'h0)] || $unsigned({(reg171 ?
                      reg10 : wire5)})));
            end
          if ((($signed((+reg19)) & (^$unsigned((wire22 ^ wire0)))) ?
              wire3 : (wire4 ?
                  $unsigned((reg178[(3'h7):(3'h4)] ?
                      $unsigned(reg171) : {reg179,
                          reg10})) : $signed(((|reg21) * (reg24 ?
                      wire3 : reg176))))))
            begin
              reg182 <= wire0;
              reg183 <= $signed(wire22);
            end
          else
            begin
              reg182 <= $unsigned(reg180);
              reg183 <= (reg170 & $unsigned(($signed(reg15) ?
                  ($unsigned(wire26) ?
                      (reg174 ? wire0 : reg174) : (reg179 ?
                          (8'ha4) : reg15)) : $unsigned(reg169))));
              reg184 <= {reg176,
                  ((^($signed(reg16) ? {reg177} : reg16)) ?
                      (|reg182[(4'he):(3'h6)]) : $unsigned((reg10 - $signed((8'hbc)))))};
            end
          if ($unsigned((((wire22[(2'h3):(2'h2)] ?
                      wire22[(5'h10):(1'h0)] : {reg18}) ?
                  $unsigned(reg173[(2'h3):(2'h3)]) : {(reg24 <= reg173),
                      {reg21}}) ?
              $unsigned((&(reg10 > (8'h9f)))) : reg180[(3'h5):(3'h5)])))
            begin
              reg185 <= ($unsigned(wire165) | $signed($unsigned(($signed(reg178) == wire5[(3'h4):(1'h1)]))));
              reg186 <= wire4;
              reg187 <= wire26;
              reg188 <= ((7'h40) > reg169[(5'h10):(2'h2)]);
            end
          else
            begin
              reg185 <= {$unsigned({(wire4[(1'h1):(1'h0)] ?
                          (reg24 | reg168) : ((8'ha1) >= reg183)),
                      ($signed(reg171) ^~ (-reg12))}),
                  (!(((+(8'hbb)) ?
                      $signed(reg14) : reg7[(1'h1):(1'h1)]) > $unsigned($unsigned(reg23))))};
            end
        end
      else
        begin
          reg177 <= $signed($signed(reg11));
          reg178 <= {reg7[(3'h4):(2'h3)]};
          if ($unsigned(reg177))
            begin
              reg179 <= (reg169[(3'h6):(1'h0)] <<< ({$signed((&(8'had))),
                  $unsigned($unsigned((8'ha9)))} || ($signed((wire26 ?
                      reg18 : (8'ha6))) ?
                  reg168 : $signed($signed(reg17)))));
              reg180 <= $signed((((reg20[(3'h4):(2'h2)] ?
                      reg7 : $signed(reg180)) ?
                  $unsigned(((8'hb4) ?
                      wire0 : reg15)) : $signed($signed(reg186))) || wire4));
              reg181 <= $unsigned($signed((~({reg13} ?
                  wire1[(3'h5):(3'h5)] : $unsigned((8'hac))))));
              reg182 <= reg6[(3'h6):(2'h3)];
            end
          else
            begin
              reg179 <= $signed(wire5[(4'hc):(4'hb)]);
              reg180 <= {(!$signed($unsigned(((8'haf) || reg24))))};
            end
        end
    end
  assign wire189 = {{(|$signed(wire2[(5'h12):(3'h7)]))},
                       ($unsigned((8'hac)) >> reg181)};
  assign wire190 = {(+(~$signed(reg184)))};
  assign wire191 = reg9;
  assign wire192 = reg17[(1'h1):(1'h0)];
  assign wire193 = wire192[(1'h1):(1'h0)];
  assign wire194 = (reg7[(4'ha):(2'h3)] || reg18[(2'h3):(2'h3)]);
  assign wire195 = wire0;
  assign wire196 = $unsigned(reg173[(1'h0):(1'h0)]);
  assign wire197 = reg175[(3'h7):(2'h3)];
  assign wire198 = (wire195 ^~ (reg168 - $unsigned(((wire191 + reg180) | (wire195 && (8'h9e))))));
  assign wire199 = reg14;
endmodule

module module27  (y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire32;
  input wire signed [(5'h13):(1'h0)] wire31;
  input wire [(4'hf):(1'h0)] wire30;
  input wire signed [(5'h15):(1'h0)] wire29;
  input wire [(5'h11):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire69;
  wire [(5'h15):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  wire signed [(4'hb):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire137;
  wire [(5'h12):(1'h0)] wire139;
  wire [(3'h4):(1'h0)] wire163;
  reg signed [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  assign y = {wire84,
                 wire69,
                 wire67,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire44,
                 wire137,
                 wire139,
                 wire163,
                 reg51,
                 reg50,
                 (1'h0)};
  module33 #() modinst45 (.y(wire44), .wire37(wire28), .wire36(wire32), .clk(clk), .wire35(wire29), .wire34(wire30));
  assign wire46 = wire28[(4'h8):(3'h5)];
  assign wire47 = ({wire31} > {wire28[(4'ha):(3'h7)]});
  assign wire48 = wire32[(2'h2):(1'h1)];
  assign wire49 = $signed((7'h43));
  always
    @(posedge clk) begin
      reg50 <= wire28[(4'h8):(2'h2)];
      reg51 <= $unsigned(wire28[(3'h5):(1'h0)]);
    end
  module52 #() modinst68 (wire67, clk, wire48, wire28, reg50, wire46, wire32);
  assign wire69 = (~&wire30[(2'h2):(1'h1)]);
  module70 #() modinst85 (wire84, clk, wire69, wire28, reg50, wire47);
  module86 #() modinst138 (.wire90(wire28), .wire88(wire67), .clk(clk), .wire87(wire84), .wire89(wire29), .y(wire137));
  assign wire139 = $unsigned(wire47);
  module140 #() modinst164 (.wire144(wire32), .wire143(wire139), .y(wire163), .wire141(wire69), .clk(clk), .wire142(wire47), .wire145(wire49));
endmodule

module module140
#(parameter param162 = (|((({(8'hba), (8'hae)} == {(8'ha6), (8'had)}) >>> ((~&(8'hbb)) ? {(8'hb3)} : {(7'h41)})) <= ((((8'ha0) ? (7'h40) : (8'hab)) ? (~&(7'h42)) : ((8'hba) >= (8'hb8))) ? ((&(8'ha0)) ? ((8'haa) ? (7'h43) : (8'hbe)) : (7'h44)) : {{(8'ha4), (8'hac)}, ((7'h41) <= (8'ha6))}))))
(y, clk, wire145, wire144, wire143, wire142, wire141);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire145;
  input wire [(5'h10):(1'h0)] wire144;
  input wire [(5'h12):(1'h0)] wire143;
  input wire signed [(4'h8):(1'h0)] wire142;
  input wire signed [(5'h14):(1'h0)] wire141;
  wire [(3'h4):(1'h0)] wire159;
  wire [(4'ha):(1'h0)] wire158;
  wire [(3'h7):(1'h0)] wire157;
  wire signed [(5'h14):(1'h0)] wire156;
  reg signed [(5'h13):(1'h0)] reg161 = (1'h0);
  reg [(5'h10):(1'h0)] reg160 = (1'h0);
  reg [(5'h10):(1'h0)] reg155 = (1'h0);
  reg [(3'h6):(1'h0)] reg154 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg153 = (1'h0);
  reg [(4'h8):(1'h0)] reg152 = (1'h0);
  reg [(5'h15):(1'h0)] reg151 = (1'h0);
  reg [(2'h2):(1'h0)] reg150 = (1'h0);
  reg [(4'ha):(1'h0)] reg149 = (1'h0);
  reg signed [(4'he):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg146 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire157,
                 wire156,
                 reg161,
                 reg160,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg146 <= wire142[(1'h1):(1'h0)];
      reg147 <= wire143;
      reg148 <= {($signed(({reg146} ?
              wire143[(4'h9):(3'h6)] : {wire145})) - wire145[(3'h7):(1'h1)])};
      if ({{{$signed((8'ha0))},
              (((|wire145) >= reg148[(3'h4):(2'h3)]) ?
                  $unsigned(((8'hbe) ? wire145 : reg148)) : wire143)},
          ((wire145[(3'h4):(3'h4)] ?
                  (wire141[(2'h2):(1'h1)] << (^reg148)) : (~^(wire145 ?
                      wire143 : wire145))) ?
              {$signed((wire144 >>> reg147)),
                  $signed(wire144[(1'h0):(1'h0)])} : $unsigned($signed($signed(wire144))))})
        begin
          reg149 <= $signed(wire141[(1'h0):(1'h0)]);
          reg150 <= wire141;
          if ($signed(({reg148} ?
              $signed(wire141[(2'h2):(2'h2)]) : (^~(reg149[(3'h7):(3'h5)] != wire144[(3'h4):(3'h4)])))))
            begin
              reg151 <= {({(&wire143[(4'ha):(2'h2)])} ?
                      $signed((^~{wire142, reg149})) : ($signed(reg146) ?
                          (8'hbf) : ($signed(reg146) ?
                              (reg149 ? wire141 : reg150) : ((8'h9f) ?
                                  (8'ha1) : (8'ha3)))))};
              reg152 <= reg151[(2'h3):(2'h3)];
              reg153 <= ($signed($unsigned($signed((reg147 ?
                      reg150 : reg148)))) ?
                  reg147 : $signed({{$signed((8'hb4)), {wire141, wire145}},
                      reg150[(1'h1):(1'h0)]}));
              reg154 <= (^reg152[(3'h7):(3'h7)]);
              reg155 <= $unsigned(((((~|(8'h9e)) ^ (~^reg154)) >= reg154) | ((reg153[(2'h2):(1'h0)] ?
                      $signed(reg149) : (wire143 * (8'hb6))) ?
                  (wire145[(3'h6):(2'h2)] >> reg148) : {(wire145 + reg153)})));
            end
          else
            begin
              reg151 <= (!(~|$unsigned(reg149)));
              reg152 <= ((~(&$signed($unsigned(reg155)))) ?
                  reg148[(4'hc):(4'ha)] : (reg150[(1'h0):(1'h0)] ?
                      {$signed((^~reg147))} : $unsigned(((!(8'h9e)) != wire145))));
              reg153 <= reg155;
              reg154 <= $signed($unsigned($unsigned((+(reg153 ?
                  wire144 : reg152)))));
              reg155 <= $signed((~&($unsigned(reg149[(3'h4):(3'h4)]) >> (8'hba))));
            end
        end
      else
        begin
          reg149 <= $signed(({wire143, reg152[(3'h6):(1'h1)]} ?
              (reg155[(4'hf):(3'h7)] <= (+(reg146 ?
                  wire142 : wire145))) : reg154[(3'h5):(3'h5)]));
        end
    end
  assign wire156 = (wire145 ?
                       {wire144[(2'h3):(1'h1)]} : $signed($unsigned($signed({wire142,
                           wire144}))));
  assign wire157 = $unsigned($signed(({reg153[(3'h5):(1'h1)],
                           (wire145 - wire145)} ?
                       (^wire156) : reg153)));
  assign wire158 = ({(8'hbd)} || reg150[(1'h0):(1'h0)]);
  assign wire159 = $signed(reg149[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg160 <= {(wire144[(4'h9):(3'h6)] < $signed($signed($unsigned(reg154)))),
          {reg147[(3'h4):(3'h4)], wire142}};
      reg161 <= (^(wire142[(1'h0):(1'h0)] ?
          ($signed($unsigned(reg149)) ^ wire157) : (~|$unsigned($signed((8'ha7))))));
    end
endmodule

module module86
#(parameter param135 = {(!(8'h9d)), (^{{(|(8'h9e))}, (8'ha5)})}, 
parameter param136 = ((+(|({param135} ? (|param135) : param135))) - ({(&param135), (&(param135 ? (8'hb5) : param135))} ? (((^~param135) < (param135 ^~ param135)) ? {param135, param135} : (-param135)) : (8'hbf))))
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h1c8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire90;
  input wire [(4'h9):(1'h0)] wire89;
  input wire [(3'h6):(1'h0)] wire88;
  input wire signed [(5'h12):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire134;
  wire signed [(2'h2):(1'h0)] wire133;
  wire [(5'h11):(1'h0)] wire132;
  wire [(4'hd):(1'h0)] wire131;
  wire [(4'hc):(1'h0)] wire130;
  wire [(5'h15):(1'h0)] wire129;
  wire signed [(5'h11):(1'h0)] wire128;
  wire [(4'hf):(1'h0)] wire119;
  wire signed [(4'hf):(1'h0)] wire118;
  wire [(4'h8):(1'h0)] wire117;
  wire signed [(4'ha):(1'h0)] wire116;
  wire [(3'h5):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire114;
  wire signed [(4'h8):(1'h0)] wire113;
  wire signed [(5'h15):(1'h0)] wire107;
  wire [(3'h4):(1'h0)] wire94;
  wire [(4'hc):(1'h0)] wire93;
  wire signed [(3'h4):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire91;
  reg [(3'h7):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(4'hf):(1'h0)] reg124 = (1'h0);
  reg [(3'h5):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg122 = (1'h0);
  reg [(5'h12):(1'h0)] reg121 = (1'h0);
  reg [(5'h15):(1'h0)] reg120 = (1'h0);
  reg [(2'h2):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg111 = (1'h0);
  reg [(3'h4):(1'h0)] reg110 = (1'h0);
  reg [(3'h5):(1'h0)] reg109 = (1'h0);
  reg [(4'h9):(1'h0)] reg108 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg104 = (1'h0);
  reg [(3'h6):(1'h0)] reg103 = (1'h0);
  reg [(4'ha):(1'h0)] reg102 = (1'h0);
  reg [(3'h5):(1'h0)] reg101 = (1'h0);
  reg [(4'hb):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg95 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire107,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg106,
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
                 (1'h0)};
  assign wire91 = $signed($signed($signed($unsigned(wire89[(2'h3):(2'h2)]))));
  assign wire92 = (($signed((~^{wire89,
                      wire88})) + wire91[(4'h9):(4'h9)]) < $unsigned(wire90[(2'h3):(2'h3)]));
  assign wire93 = wire91;
  assign wire94 = (^((|(~&(^wire90))) ?
                      $signed(wire93[(3'h6):(1'h1)]) : wire89));
  always
    @(posedge clk) begin
      if (((wire91 == (wire87 ?
              $signed(wire92) : {((8'haa) ? wire87 : (8'hb2)),
                  $unsigned((7'h40))})) ?
          wire94 : ($signed((wire89[(3'h6):(1'h0)] >> (+(8'ha0)))) ?
              $unsigned(wire88[(3'h6):(1'h0)]) : {wire89, wire92})))
        begin
          reg95 <= ({$signed($signed((wire90 ^~ wire87))),
                  (~wire94[(2'h3):(1'h0)])} ?
              (($unsigned((wire89 * wire92)) ?
                      $unsigned(((7'h40) ^~ (8'hb4))) : {(wire88 | (8'hb4))}) ?
                  $unsigned((+{wire91,
                      wire89})) : ($unsigned((wire90 >>> (8'ha2))) >= $signed($unsigned((8'h9f))))) : $signed($signed($unsigned(wire90))));
        end
      else
        begin
          if ($unsigned($signed($signed({$unsigned(wire91),
              {wire94, wire87}}))))
            begin
              reg95 <= wire94[(1'h1):(1'h1)];
              reg96 <= ($unsigned($unsigned(({wire89} ?
                  $unsigned((8'ha9)) : wire92))) ^~ {wire87});
              reg97 <= (wire88[(2'h3):(1'h0)] * ((wire91 == wire88[(2'h2):(2'h2)]) ?
                  $signed($unsigned({wire91, wire93})) : $signed({wire91})));
              reg98 <= (&(~|reg96));
              reg99 <= ({($unsigned((reg98 ? wire94 : wire89)) ?
                      wire93[(2'h2):(1'h1)] : (((8'h9d) && wire94) || wire93)),
                  $unsigned($signed($unsigned(wire91)))} >= $unsigned(($unsigned({reg96}) ?
                  $signed((-wire93)) : $signed({reg96, wire89}))));
            end
          else
            begin
              reg95 <= ((|$unsigned($unsigned(reg95))) ?
                  wire87[(5'h11):(3'h7)] : {reg99[(2'h2):(2'h2)],
                      $unsigned((^((8'hb8) ? wire87 : wire91)))});
            end
          reg100 <= reg98;
          reg101 <= {wire92,
              (-((~^(~&reg98)) ?
                  reg98 : ($signed(wire92) ?
                      (wire91 ? wire93 : reg96) : wire87[(3'h6):(2'h2)])))};
          reg102 <= $unsigned(wire90[(2'h3):(1'h0)]);
          reg103 <= {(8'hbc),
              ((($signed(wire94) <<< wire92) >>> ($unsigned(reg99) ?
                      $unsigned(reg96) : ((8'hb2) ^ wire92))) ?
                  (wire94 << (&$unsigned(reg95))) : (wire92 ?
                      reg100 : (~(wire91 >>> wire94))))};
        end
      reg104 <= {$signed($unsigned($signed((wire88 > wire93))))};
      reg105 <= wire90[(1'h1):(1'h0)];
      reg106 <= wire88;
    end
  assign wire107 = (($signed(reg105[(4'h9):(2'h2)]) ?
                           (^wire94) : reg96[(4'he):(3'h5)]) ?
                       (+wire89) : wire90[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg108 <= reg99[(2'h3):(2'h2)];
      reg109 <= ($unsigned((~(~|$signed(reg97)))) ?
          (~&reg97) : $signed({(reg103[(1'h0):(1'h0)] ?
                  reg106[(3'h5):(1'h1)] : {reg100})}));
      if ((reg99 > (~&reg96[(2'h3):(1'h1)])))
        begin
          reg110 <= $signed($signed(reg103));
        end
      else
        begin
          reg110 <= $unsigned($signed($signed(($unsigned(wire92) ?
              (reg101 ? wire107 : reg105) : (reg110 == (8'hbb))))));
          reg111 <= (reg110 + $signed((7'h42)));
        end
      reg112 <= reg103;
    end
  assign wire113 = {(({$signed(wire94), $unsigned(reg98)} ? wire92 : wire87) ?
                           $unsigned((|(&(8'ha4)))) : (($unsigned(wire88) <<< $signed(reg106)) && $unsigned((reg110 ?
                               reg102 : reg103))))};
  assign wire114 = (~^((-wire107[(4'hd):(4'ha)]) ?
                       $signed($signed($unsigned(reg109))) : (8'hb8)));
  assign wire115 = reg109[(1'h0):(1'h0)];
  assign wire116 = (reg111 >>> $signed(({(wire113 ?
                           reg112 : wire87)} > ((8'hb1) <= {wire92, wire87}))));
  assign wire117 = (~{$unsigned($unsigned($signed((8'ha2)))), (~|reg98)});
  assign wire118 = {reg112};
  assign wire119 = $signed($unsigned(($signed(reg110) == (~&$unsigned(wire115)))));
  always
    @(posedge clk) begin
      reg120 <= (reg98[(3'h4):(3'h4)] ?
          reg99 : ($signed(reg104) ?
              $signed(($signed(wire88) - (wire116 ?
                  wire94 : (8'hbf)))) : (wire118[(3'h6):(1'h1)] ?
                  wire88[(1'h0):(1'h0)] : $unsigned(reg99[(4'ha):(3'h5)]))));
      reg121 <= reg112;
      reg122 <= $signed((~&(reg111[(3'h4):(3'h4)] != (((7'h44) && wire93) ?
          $signed(reg98) : (reg106 ? wire116 : reg121)))));
      reg123 <= $signed({$unsigned($signed($unsigned(wire115))),
          wire90[(1'h0):(1'h0)]});
      if (wire89)
        begin
          if (reg98)
            begin
              reg124 <= $unsigned($signed(wire91));
              reg125 <= wire87;
              reg126 <= ((reg100 >>> wire116[(4'h9):(2'h2)]) < $unsigned(($unsigned(reg97[(4'ha):(1'h1)]) ?
                  ((~^wire116) >>> $unsigned(reg125)) : ((-reg121) ?
                      (reg121 ? (8'h9e) : wire93) : $unsigned(reg109)))));
            end
          else
            begin
              reg124 <= (^~$unsigned((8'hab)));
              reg125 <= ((reg100 ?
                  (|(~|reg96[(3'h7):(2'h2)])) : reg100) >> ($unsigned((7'h40)) ?
                  {$unsigned((wire87 <= reg95))} : (((reg108 | reg104) >>> (8'hb2)) ?
                      $unsigned((reg122 < reg104)) : reg120[(3'h6):(2'h3)])));
              reg126 <= $unsigned({$signed({wire91}),
                  ((wire89[(2'h2):(2'h2)] > (reg103 ? reg110 : wire91)) ?
                      (~|reg97) : reg122[(2'h3):(2'h2)])});
              reg127 <= (reg100 ?
                  (reg120 ~^ reg99[(4'h8):(3'h5)]) : $unsigned(reg126[(3'h6):(3'h4)]));
            end
        end
      else
        begin
          if (wire114)
            begin
              reg124 <= wire113;
              reg125 <= $signed($unsigned($unsigned({(reg98 < wire114),
                  (wire91 ? reg96 : reg111)})));
            end
          else
            begin
              reg124 <= ((($signed(wire107) ?
                      wire93[(1'h0):(1'h0)] : reg110[(2'h2):(1'h0)]) ?
                  reg100[(4'h9):(2'h2)] : (^~(reg101 << ((8'hb5) ?
                      reg95 : reg106)))) == $unsigned(reg104));
              reg125 <= reg121[(3'h6):(3'h4)];
              reg126 <= ((((8'hbd) ?
                      ($unsigned(reg110) ? (!reg100) : (~reg123)) : (~^(wire91 ?
                          reg125 : wire118))) ?
                  wire117[(3'h7):(1'h0)] : (-reg96[(3'h5):(1'h1)])) <= reg98);
            end
        end
    end
  assign wire128 = (reg112 ? wire116[(2'h3):(1'h0)] : wire113);
  assign wire129 = wire91;
  assign wire130 = ({{(|reg120[(3'h7):(3'h6)])}, reg99[(1'h0):(1'h0)]} ?
                       $unsigned(wire89[(3'h6):(3'h5)]) : ($signed($unsigned(reg106[(1'h1):(1'h0)])) ?
                           ((8'hbe) ?
                               $signed((!reg112)) : $unsigned((reg96 - reg125))) : ((^{reg124,
                                   wire88}) ?
                               reg112 : (~^$unsigned(reg100)))));
  assign wire131 = $unsigned(wire116);
  assign wire132 = $unsigned((wire130[(3'h6):(1'h0)] * reg105[(1'h0):(1'h0)]));
  assign wire133 = reg109;
  assign wire134 = reg95[(4'hc):(2'h2)];
endmodule

module module70
#(parameter param82 = (&((({(7'h43), (8'had)} ? (!(8'hb4)) : (+(8'haf))) <= (8'hb0)) | ((((8'h9d) ? (8'hbc) : (8'ha3)) ? (|(8'hac)) : (!(8'ha0))) ? (-(~|(8'h9f))) : ((^~(8'hb1)) >> (8'ha4))))), 
parameter param83 = (^~(~^((|((7'h42) ? param82 : param82)) ? ({param82, param82} << param82) : param82))))
(y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire74;
  input wire signed [(5'h11):(1'h0)] wire73;
  input wire [(4'h8):(1'h0)] wire72;
  input wire [(4'ha):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire80;
  wire [(4'hd):(1'h0)] wire79;
  wire [(4'hb):(1'h0)] wire75;
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(5'h15):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  assign y = {wire81, wire80, wire79, wire75, reg78, reg77, reg76, (1'h0)};
  assign wire75 = $unsigned({wire71[(4'h8):(2'h3)],
                      ((~&wire73[(4'he):(3'h4)]) ?
                          wire72[(2'h2):(1'h0)] : (wire72[(3'h4):(1'h0)] ?
                              wire73 : $signed(wire74)))});
  always
    @(posedge clk) begin
      reg76 <= $unsigned((-$signed(({wire74} ?
          (-wire73) : $unsigned(wire71)))));
      if ($signed($unsigned({(^wire75[(4'h9):(2'h2)]),
          $signed((wire72 ? wire71 : wire72))})))
        begin
          reg77 <= ($signed($unsigned((8'hbe))) ?
              wire71[(4'h8):(3'h7)] : ($unsigned({$signed(wire73),
                  (reg76 ? reg76 : wire74)}) ^~ wire72[(3'h4):(1'h1)]));
        end
      else
        begin
          reg77 <= {{wire74[(2'h2):(2'h2)],
                  ((~{wire71}) < (~&wire71[(4'ha):(1'h0)]))},
              wire75[(2'h2):(1'h0)]};
        end
      reg78 <= wire75;
    end
  assign wire79 = ((8'hae) ? $unsigned(reg76[(4'h9):(3'h7)]) : wire72);
  assign wire80 = $signed(($signed({$signed(reg76), $signed(wire71)}) ?
                      $unsigned($unsigned(wire75)) : reg77[(1'h0):(1'h0)]));
  assign wire81 = reg77[(3'h7):(2'h3)];
endmodule

module module52
#(parameter param66 = ({(({(8'hb0)} << (~&(8'haa))) < ((~|(8'h9f)) ? ((8'h9f) ? (8'ha0) : (8'hb8)) : {(8'hb3), (8'hab)}))} != {(((8'ha5) ? ((8'ha5) <= (8'h9e)) : (~^(8'ha7))) ? (((8'ha8) ? (8'ha0) : (8'hbc)) || ((7'h40) ? (8'ha1) : (8'ha6))) : (!(8'ha5)))}))
(y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire57;
  input wire signed [(4'hf):(1'h0)] wire56;
  input wire signed [(3'h6):(1'h0)] wire55;
  input wire signed [(4'ha):(1'h0)] wire54;
  input wire signed [(4'ha):(1'h0)] wire53;
  wire signed [(3'h5):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire62;
  wire [(4'he):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire60;
  wire signed [(5'h12):(1'h0)] wire59;
  wire signed [(5'h11):(1'h0)] wire58;
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 (1'h0)};
  assign wire58 = $unsigned(wire57[(3'h4):(1'h0)]);
  assign wire59 = wire56;
  assign wire60 = (&$signed((8'ha0)));
  assign wire61 = $unsigned(wire56);
  assign wire62 = ($unsigned($unsigned(wire59[(4'hb):(4'hb)])) ?
                      ((wire58[(4'hd):(4'h9)] ?
                          $unsigned($signed((8'hac))) : ((^~wire55) >= wire59)) - $unsigned($unsigned(((8'hb2) > wire55)))) : $signed(($signed(((8'ha0) != wire57)) ?
                          {$signed(wire54)} : $signed({wire61, wire60}))));
  assign wire63 = ((-wire53) ?
                      wire56[(4'hc):(3'h4)] : ($signed(wire56) ?
                          wire58[(3'h4):(2'h2)] : (~^$signed(((8'hba) ^ wire56)))));
  assign wire64 = wire55[(2'h2):(2'h2)];
  assign wire65 = wire55;
endmodule

module module33
#(parameter param42 = (~&(^~((7'h42) ? ((8'hb7) + (^~(8'ha8))) : (((8'hb2) ? (8'h9d) : (8'hba)) - ((8'had) == (8'hb7)))))), 
parameter param43 = ((|(param42 ? ((param42 ? (8'haf) : param42) | (~param42)) : (~^(param42 ? param42 : param42)))) ? ({(((8'hbe) | param42) - (!param42))} ? (((param42 ? param42 : param42) ? param42 : param42) ? (~^(param42 ? param42 : param42)) : ((8'had) ? (~|(8'hbb)) : (~|param42))) : ((^{param42}) >>> param42)) : ((|(param42 ? param42 : param42)) > (+{param42}))))
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire37;
  input wire signed [(5'h12):(1'h0)] wire36;
  input wire [(5'h15):(1'h0)] wire35;
  input wire signed [(3'h7):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire41;
  wire signed [(5'h10):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire38;
  assign y = {wire41, wire40, wire39, wire38, (1'h0)};
  assign wire38 = (^$signed(wire34[(3'h7):(3'h4)]));
  assign wire39 = wire35[(3'h7):(1'h0)];
  assign wire40 = (+($signed(wire37[(2'h2):(2'h2)]) <<< {wire39[(3'h4):(2'h2)],
                      (^~(wire36 > wire37))}));
  assign wire41 = (wire37 ? wire37 : $unsigned($unsigned($unsigned({wire39}))));
endmodule
