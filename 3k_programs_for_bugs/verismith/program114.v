module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2c6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire300;
  wire signed [(5'h15):(1'h0)] wire297;
  wire [(4'he):(1'h0)] wire276;
  wire signed [(5'h15):(1'h0)] wire275;
  wire [(4'h9):(1'h0)] wire273;
  wire signed [(5'h15):(1'h0)] wire138;
  wire [(3'h5):(1'h0)] wire39;
  wire [(5'h12):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  reg signed [(4'hb):(1'h0)] reg299 = (1'h0);
  reg [(2'h2):(1'h0)] reg298 = (1'h0);
  reg [(2'h3):(1'h0)] reg296 = (1'h0);
  reg [(2'h3):(1'h0)] reg295 = (1'h0);
  reg signed [(4'he):(1'h0)] reg294 = (1'h0);
  reg [(4'h8):(1'h0)] reg293 = (1'h0);
  reg [(3'h4):(1'h0)] reg292 = (1'h0);
  reg [(4'he):(1'h0)] reg291 = (1'h0);
  reg [(4'h9):(1'h0)] reg290 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg289 = (1'h0);
  reg [(4'ha):(1'h0)] reg288 = (1'h0);
  reg [(3'h6):(1'h0)] reg287 = (1'h0);
  reg [(4'he):(1'h0)] reg286 = (1'h0);
  reg [(4'he):(1'h0)] reg285 = (1'h0);
  reg [(3'h4):(1'h0)] reg284 = (1'h0);
  reg [(4'h8):(1'h0)] reg283 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg282 = (1'h0);
  reg [(4'hd):(1'h0)] reg281 = (1'h0);
  reg [(4'ha):(1'h0)] reg280 = (1'h0);
  reg [(4'h9):(1'h0)] reg279 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg278 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg277 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  assign y = {wire300,
                 wire297,
                 wire276,
                 wire275,
                 wire273,
                 wire138,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg299,
                 reg298,
                 reg296,
                 reg295,
                 reg294,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
                 reg283,
                 reg282,
                 reg281,
                 reg280,
                 reg279,
                 reg278,
                 reg277,
                 reg5,
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
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned((8'ha5));
      reg6 <= (~(^~(((8'haa) | wire1) & (wire1[(2'h3):(1'h1)] | $signed(wire2)))));
      if ({reg6})
        begin
          if (((wire0 ?
                  ($signed($signed(wire1)) ?
                      (~(wire4 * reg5)) : (|wire3[(1'h1):(1'h0)])) : $unsigned(reg6)) ?
              wire3 : ($signed(reg6[(3'h5):(2'h2)]) >= $signed((^~$unsigned((8'ha3)))))))
            begin
              reg7 <= ((~|wire2) ? wire3[(1'h0):(1'h0)] : reg6);
              reg8 <= (|(+$signed(reg5)));
              reg9 <= (reg5[(4'h9):(4'h9)] ?
                  wire0[(3'h5):(2'h3)] : (^~((~&$unsigned((8'h9c))) <<< $signed((~reg6)))));
            end
          else
            begin
              reg7 <= reg8;
              reg8 <= reg8[(2'h3):(2'h2)];
              reg9 <= (8'hbf);
            end
        end
      else
        begin
          reg7 <= $signed($unsigned(((reg6[(4'h8):(3'h7)] & (~wire2)) ?
              reg6 : (8'ha2))));
        end
      reg10 <= wire2;
      reg11 <= (~$signed((&(+$unsigned(wire3)))));
    end
  always
    @(posedge clk) begin
      reg12 <= ($signed($signed({(reg5 ? (8'ha1) : reg6),
              ((8'ha9) ? reg6 : reg10)})) ?
          $unsigned($unsigned((!$unsigned((8'ha4))))) : reg9);
      if ((~&(reg6 ?
          (((reg12 ^ reg10) - (reg8 >= (8'ha7))) ?
              reg12[(2'h3):(2'h2)] : {reg6}) : (wire1[(3'h6):(2'h3)] ~^ reg10[(2'h3):(1'h0)]))))
        begin
          if (wire3)
            begin
              reg13 <= reg12[(1'h1):(1'h0)];
            end
          else
            begin
              reg13 <= (((~{wire3[(2'h2):(1'h0)], reg5}) ?
                  $signed((-reg7[(3'h6):(2'h3)])) : (-((wire0 + reg13) ?
                      (^(8'hbf)) : (+wire1)))) + (($unsigned((wire1 ?
                          reg12 : wire3)) ?
                      $unsigned((8'hab)) : $signed(reg6[(2'h2):(1'h0)])) ?
                  wire1[(3'h5):(2'h2)] : reg13));
              reg14 <= $unsigned((wire0[(2'h2):(1'h1)] + reg8));
              reg15 <= wire2[(2'h3):(1'h0)];
              reg16 <= (+$unsigned((~|($signed(reg10) | $signed(reg11)))));
            end
          if (wire2[(4'hc):(4'ha)])
            begin
              reg17 <= (|(~{(~^(!reg11)), $signed(((8'ha5) ? reg14 : reg16))}));
              reg18 <= ({(~&$signed($signed(reg16))),
                      (&$signed(reg13[(1'h0):(1'h0)]))} ?
                  (-{(reg9 ? ((8'hae) ? reg14 : reg17) : {reg17})}) : reg12);
            end
          else
            begin
              reg17 <= {wire4, reg9[(2'h3):(2'h2)]};
              reg18 <= $unsigned(reg13);
              reg19 <= (!(8'hbd));
              reg20 <= $unsigned(((+$unsigned((wire2 ?
                  wire1 : reg6))) << reg17));
              reg21 <= reg12;
            end
          reg22 <= {$signed(wire4[(1'h1):(1'h1)])};
        end
      else
        begin
          reg13 <= reg19[(1'h0):(1'h0)];
          reg14 <= $signed((&($signed(reg14) - (8'hb9))));
          if (((($signed($signed((8'ha1))) > reg20[(2'h3):(2'h2)]) ?
                  $signed($signed((reg11 ? reg13 : reg9))) : wire0) ?
              (8'hbc) : ((reg13[(2'h2):(1'h1)] & reg7[(1'h0):(1'h0)]) ?
                  {($signed(wire1) ~^ wire4[(2'h2):(2'h2)])} : ($signed($signed(reg10)) ^ reg22[(4'ha):(3'h4)]))))
            begin
              reg15 <= (^~((8'hb0) ?
                  $unsigned(((8'hab) ^ ((8'hb8) ?
                      wire4 : reg8))) : wire2[(4'hb):(4'h9)]));
              reg16 <= (~^(~^$unsigned((~reg11[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg15 <= $signed((|reg21));
              reg16 <= (~^(reg17 ?
                  (((wire4 ? reg15 : reg8) ? (reg12 ? reg6 : reg20) : reg21) ?
                      ((~|reg9) > reg12) : wire1[(3'h5):(1'h1)]) : reg14[(2'h3):(2'h2)]));
              reg17 <= (~^(~|((wire0 != $signed(reg14)) ?
                  (~|$unsigned((7'h42))) : {wire4[(1'h1):(1'h0)]})));
              reg18 <= $signed(($unsigned(reg13) + wire3[(1'h0):(1'h0)]));
            end
          reg19 <= $unsigned((7'h42));
        end
      if ((reg15 ? reg17[(2'h2):(1'h1)] : ({(&(~reg12))} ~^ (8'ha4))))
        begin
          reg23 <= $signed(($signed((!reg10[(1'h0):(1'h0)])) ?
              reg18[(4'h8):(3'h4)] : (reg9 ?
                  {reg22,
                      reg7[(3'h7):(3'h4)]} : $unsigned(reg16[(2'h2):(2'h2)]))));
          reg24 <= $unsigned({$signed((reg10[(3'h4):(2'h2)] * $signed(wire4))),
              reg9});
          if (reg10)
            begin
              reg25 <= (reg21 < wire2[(5'h14):(1'h1)]);
              reg26 <= (8'hb0);
              reg27 <= (+$unsigned(reg8[(3'h5):(2'h3)]));
              reg28 <= ((+(8'ha9)) ?
                  ($signed({{wire2, wire3}}) < reg11) : reg8);
            end
          else
            begin
              reg25 <= reg26;
              reg26 <= reg16[(2'h3):(1'h1)];
            end
          reg29 <= (reg11 - reg8[(3'h5):(1'h0)]);
          reg30 <= (|$signed((-$unsigned((reg6 && reg16)))));
        end
      else
        begin
          reg23 <= reg15;
          reg24 <= ($unsigned($signed($signed(reg27))) && reg20);
        end
      if ($unsigned($signed($signed(reg22))))
        begin
          reg31 <= reg15[(4'h8):(2'h2)];
          reg32 <= $signed(((($unsigned(wire0) ?
              wire2[(2'h2):(2'h2)] : $signed(reg13)) <= reg8) <= reg6[(3'h7):(2'h3)]));
        end
      else
        begin
          reg31 <= {(|(~reg13)), reg11[(2'h3):(1'h0)]};
          reg32 <= $unsigned(((($unsigned(reg23) ?
              (8'ha1) : {reg6}) | {(reg29 <<< reg26)}) >>> wire0));
        end
    end
  assign wire33 = (($unsigned(reg32) ? wire4[(1'h1):(1'h1)] : reg9) ?
                      (-reg6[(4'h8):(3'h5)]) : ($unsigned($signed($signed(reg16))) >>> (wire0 ?
                          reg23[(2'h3):(1'h1)] : $unsigned((reg19 ?
                              reg14 : wire4)))));
  assign wire34 = reg30;
  assign wire35 = (($signed($unsigned($signed(reg28))) && $unsigned({$unsigned(reg11),
                          $signed(reg31)})) ?
                      reg31 : wire3);
  assign wire36 = $unsigned($unsigned(reg11[(2'h2):(2'h2)]));
  assign wire37 = (reg17[(1'h1):(1'h0)] - (|((|reg12) ?
                      reg21 : $unsigned(reg8[(3'h5):(1'h1)]))));
  assign wire38 = $signed(((~&reg19) ? $unsigned(wire35) : reg11));
  assign wire39 = $unsigned((|(({(7'h44), (8'hb1)} ?
                          reg23[(4'h8):(3'h7)] : (reg8 <<< reg14)) ?
                      ((reg19 && (8'hb9)) >= $unsigned(reg11)) : (wire2[(5'h11):(3'h4)] ?
                          $unsigned(reg9) : $unsigned((8'hb0))))));
  module40 #() modinst139 (wire138, clk, wire37, wire3, reg5, reg27);
  module140 #() modinst274 (.wire142(reg5), .wire141(wire39), .wire143(reg28), .clk(clk), .wire145(reg15), .wire144(wire35), .y(wire273));
  assign wire275 = wire38;
  assign wire276 = ((~^$signed({reg9, $unsigned(wire34)})) >= (reg26 ?
                       (~(~{(8'hb7), reg31})) : (reg26[(4'h9):(1'h1)] ?
                           ($unsigned(wire37) != (reg30 ?
                               reg9 : reg10)) : wire34)));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(wire275)))
        begin
          reg277 <= (-wire39);
          reg278 <= $unsigned($unsigned($signed({(reg6 ? wire39 : reg32),
              $signed((8'ha2))})));
          reg279 <= ($signed(((~|wire275) << ({wire3, reg18} ?
                  wire2[(4'hf):(4'hc)] : (!wire37)))) ?
              reg7 : reg11[(2'h2):(1'h0)]);
          reg280 <= reg277[(3'h4):(2'h3)];
        end
      else
        begin
          reg277 <= $unsigned((wire4 ?
              reg280[(1'h1):(1'h1)] : ($signed(reg13) && reg30)));
          reg278 <= ($unsigned($unsigned((|reg25))) - wire33);
          reg279 <= $signed(($unsigned(($unsigned(wire0) ?
              (reg22 ? reg20 : reg15) : reg19)) <<< (^~((^(8'hbc)) ?
              (reg7 ? wire2 : wire39) : (reg18 ? wire39 : reg278)))));
          if (reg5[(4'ha):(3'h5)])
            begin
              reg280 <= ((+$signed((-reg280))) >= reg31);
              reg281 <= (-reg18[(4'h8):(3'h7)]);
            end
          else
            begin
              reg280 <= reg16[(1'h1):(1'h1)];
              reg281 <= (7'h42);
            end
          if ((8'hb1))
            begin
              reg282 <= wire3[(1'h1):(1'h1)];
              reg283 <= (8'ha8);
              reg284 <= wire273;
              reg285 <= ((|$unsigned($signed($unsigned((7'h41))))) + {($signed((reg15 ?
                      reg8 : reg281)) + reg30[(5'h12):(5'h11)])});
            end
          else
            begin
              reg282 <= ((7'h42) | (!$signed((-wire3[(2'h2):(2'h2)]))));
            end
        end
      if ({(reg15[(4'ha):(1'h0)] >= (((&reg32) & {reg285}) ?
              $unsigned($signed(wire1)) : ($unsigned(reg31) <<< $signed(reg13)))),
          $signed((reg8[(3'h4):(1'h1)] ?
              (((8'ha1) >>> reg283) || $unsigned(reg283)) : reg5))})
        begin
          if ((~^({{{reg23}}, ($signed(wire2) > $signed(reg21))} >= (((~^reg9) ?
                  (reg23 >>> wire38) : reg283[(2'h2):(1'h0)]) ?
              reg21[(3'h6):(3'h4)] : wire0))))
            begin
              reg286 <= $signed((+$signed({wire36[(2'h2):(1'h0)]})));
            end
          else
            begin
              reg286 <= reg29[(1'h1):(1'h1)];
              reg287 <= {wire36};
              reg288 <= $signed((8'hb8));
              reg289 <= (7'h40);
              reg290 <= (7'h44);
            end
          reg291 <= $signed(((((^~reg21) ? (~^reg285) : $signed(wire276)) ?
              $unsigned((wire276 && reg284)) : ((wire33 + reg25) ?
                  (reg277 ? reg282 : reg14) : (&reg282))) || {((reg287 ?
                      (8'hbe) : reg278) ?
                  reg285 : reg280[(4'h8):(1'h1)])}));
          if ((wire276[(4'hd):(3'h6)] ?
              ((reg27 ~^ wire38[(4'ha):(4'h8)]) ?
                  {(wire33 == (wire0 == (8'hac)))} : $unsigned($unsigned(reg21[(2'h3):(1'h1)]))) : ({{((8'hae) ?
                              reg285 : reg22),
                          (reg25 << reg291)},
                      wire275[(5'h11):(4'h8)]} ?
                  (~((reg25 ? wire2 : reg283) ?
                      (wire1 && (8'h9e)) : (wire33 ?
                          wire35 : reg286))) : $unsigned(reg281[(3'h4):(1'h0)]))))
            begin
              reg292 <= reg284[(2'h3):(2'h2)];
              reg293 <= reg16[(1'h0):(1'h0)];
              reg294 <= reg284;
              reg295 <= ({$unsigned(reg21[(1'h1):(1'h0)])} ^~ ($signed(((+(8'hbc)) > (8'h9c))) ?
                  $signed($signed(wire35[(5'h10):(4'h8)])) : reg6));
            end
          else
            begin
              reg292 <= wire0;
              reg293 <= {(reg277 && $unsigned({reg28})), reg21[(4'h9):(1'h0)]};
              reg294 <= {$signed(reg32)};
            end
          reg296 <= $signed((((&(reg277 ?
              reg23 : reg277)) <= ({reg278} | $signed(reg283))) ~^ ($signed(reg6) != reg282[(2'h3):(2'h2)])));
        end
      else
        begin
          reg286 <= $signed((reg27 ?
              $signed($signed($signed(reg279))) : $unsigned($signed(reg17))));
          reg287 <= (^reg8[(3'h4):(1'h1)]);
          if ($signed({((+reg23[(3'h7):(2'h3)]) ? {{reg285, reg32}} : reg6),
              {($signed(reg289) ? reg296 : $unsigned((8'h9d))),
                  (wire34[(1'h1):(1'h1)] ^ {wire3, wire36})}}))
            begin
              reg288 <= $unsigned((~&$unsigned({(reg30 ? wire1 : reg24)})));
            end
          else
            begin
              reg288 <= ($signed((+(-reg295))) <= reg27[(5'h12):(4'h9)]);
              reg289 <= $unsigned($unsigned((~^(^reg6))));
              reg290 <= $signed($signed((((~wire35) ^~ (~|reg32)) ?
                  $unsigned($unsigned(reg7)) : $signed(wire275))));
              reg291 <= (-(&($unsigned(reg18) > ((^~wire36) & reg13))));
            end
          reg292 <= $signed((reg9 < $unsigned(wire37[(3'h4):(1'h1)])));
        end
    end
  assign wire297 = (~|((+$unsigned((reg277 <= (8'hbe)))) ?
                       $unsigned(reg283[(3'h7):(3'h6)]) : $signed($signed(reg25[(2'h3):(1'h0)]))));
  always
    @(posedge clk) begin
      reg298 <= wire39;
      reg299 <= $unsigned(reg281);
    end
  assign wire300 = (^(($signed((7'h41)) ?
                           ((-reg285) << $unsigned(reg284)) : $unsigned((reg26 ~^ wire36))) ?
                       $signed(($signed(reg15) ?
                           (reg23 >>> (8'h9e)) : $signed(reg21))) : ({$unsigned(reg296),
                               (^~reg13)} ?
                           {reg285, reg22} : ((|wire3) ?
                               (~&(8'ha6)) : $unsigned(reg14)))));
endmodule

module module140
#(parameter param272 = {{{(~^((8'ha9) ? (8'ha3) : (8'ha1))), (+(8'hb0))}, ({{(8'hb9), (8'ha9)}} ? (^(~|(8'hab))) : {((7'h41) <= (8'hb8)), ((8'ha6) - (8'hbc))})}})
(y, clk, wire145, wire144, wire143, wire142, wire141);
  output wire [(32'h1f3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire145;
  input wire [(5'h10):(1'h0)] wire144;
  input wire [(4'hf):(1'h0)] wire143;
  input wire signed [(2'h3):(1'h0)] wire142;
  input wire [(3'h4):(1'h0)] wire141;
  wire signed [(5'h12):(1'h0)] wire271;
  wire [(5'h14):(1'h0)] wire178;
  wire signed [(2'h3):(1'h0)] wire155;
  wire signed [(2'h3):(1'h0)] wire154;
  wire [(5'h13):(1'h0)] wire153;
  wire signed [(2'h3):(1'h0)] wire152;
  wire signed [(3'h5):(1'h0)] wire151;
  wire signed [(5'h12):(1'h0)] wire150;
  wire signed [(5'h13):(1'h0)] wire149;
  wire [(4'hf):(1'h0)] wire148;
  wire [(3'h7):(1'h0)] wire147;
  wire signed [(5'h14):(1'h0)] wire146;
  wire [(4'h9):(1'h0)] wire190;
  wire [(2'h2):(1'h0)] wire191;
  wire signed [(4'hb):(1'h0)] wire235;
  wire signed [(5'h14):(1'h0)] wire237;
  wire [(2'h3):(1'h0)] wire269;
  reg signed [(2'h3):(1'h0)] reg180 = (1'h0);
  reg [(4'hc):(1'h0)] reg181 = (1'h0);
  reg [(2'h2):(1'h0)] reg182 = (1'h0);
  reg [(2'h3):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg184 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg185 = (1'h0);
  reg [(4'ha):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg187 = (1'h0);
  reg [(4'h8):(1'h0)] reg188 = (1'h0);
  reg [(4'h8):(1'h0)] reg189 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg238 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg239 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg240 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg241 = (1'h0);
  reg [(4'h9):(1'h0)] reg242 = (1'h0);
  reg [(5'h15):(1'h0)] reg243 = (1'h0);
  reg [(5'h12):(1'h0)] reg244 = (1'h0);
  reg [(5'h11):(1'h0)] reg245 = (1'h0);
  reg signed [(4'he):(1'h0)] reg246 = (1'h0);
  reg [(5'h13):(1'h0)] reg247 = (1'h0);
  reg [(5'h15):(1'h0)] reg248 = (1'h0);
  reg [(4'he):(1'h0)] reg249 = (1'h0);
  reg [(5'h12):(1'h0)] reg250 = (1'h0);
  reg [(3'h5):(1'h0)] reg251 = (1'h0);
  reg [(5'h13):(1'h0)] reg252 = (1'h0);
  assign y = {wire271,
                 wire178,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire190,
                 wire191,
                 wire235,
                 wire237,
                 wire269,
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
                 reg238,
                 reg239,
                 reg240,
                 reg241,
                 reg242,
                 reg243,
                 reg244,
                 reg245,
                 reg246,
                 reg247,
                 reg248,
                 reg249,
                 reg250,
                 reg251,
                 reg252,
                 (1'h0)};
  assign wire146 = {{$signed($unsigned((wire143 < wire143)))},
                       wire145[(3'h5):(3'h5)]};
  assign wire147 = ((&$signed(wire146)) ?
                       $unsigned(wire146) : {$signed(wire143[(3'h5):(2'h3)])});
  assign wire148 = (|wire144[(2'h2):(2'h2)]);
  assign wire149 = wire142[(2'h2):(2'h2)];
  assign wire150 = wire149[(1'h1):(1'h1)];
  assign wire151 = $unsigned({(wire149[(1'h0):(1'h0)] & wire145[(2'h3):(1'h1)])});
  assign wire152 = wire145;
  assign wire153 = (~($signed(($unsigned(wire145) ~^ wire148)) >= $signed($unsigned((wire146 ?
                       wire145 : wire146)))));
  assign wire154 = wire141;
  assign wire155 = (wire154[(1'h1):(1'h1)] ?
                       (~|(wire145[(3'h5):(2'h3)] != ({wire151} < ((8'ha2) ?
                           wire145 : wire144)))) : (~^(wire142 ?
                           (^~wire146) : $signed((^~wire151)))));
  module156 #() modinst179 (wire178, clk, wire144, wire155, wire148, wire152, wire149);
  always
    @(posedge clk) begin
      reg180 <= (~^wire141[(2'h2):(1'h0)]);
      if ((8'hb9))
        begin
          reg181 <= (~^$unsigned((~|wire153)));
          reg182 <= ((wire147 ?
              (wire145 >= ((wire154 ~^ wire155) ?
                  (~&wire145) : {wire143,
                      wire146})) : (^(~^(8'ha6)))) ~^ (^{(+(wire154 ?
                  wire151 : wire147)),
              wire150[(4'he):(3'h4)]}));
          if (($signed({wire146}) | $unsigned(wire153[(4'hb):(4'h8)])))
            begin
              reg183 <= (-wire150[(4'he):(3'h7)]);
            end
          else
            begin
              reg183 <= wire141[(2'h3):(2'h2)];
              reg184 <= $unsigned((~|{{(wire141 & wire150)}}));
              reg185 <= wire154;
            end
          reg186 <= $signed($signed((((wire149 != wire148) ?
              (wire178 != (8'ha1)) : wire147) > $unsigned((8'h9f)))));
          reg187 <= {{($unsigned(wire153[(4'he):(2'h2)]) != $unsigned((wire150 && reg182)))},
              wire150};
        end
      else
        begin
          reg181 <= wire147[(1'h0):(1'h0)];
          reg182 <= $unsigned({{(wire141 ? (reg180 * reg186) : (8'hba)),
                  wire148[(2'h2):(1'h1)]}});
          reg183 <= (|$signed((wire142[(1'h0):(1'h0)] << ($unsigned(reg183) ?
              wire149 : (wire148 || (8'hb9))))));
        end
    end
  always
    @(posedge clk) begin
      reg188 <= (wire144 ?
          reg185[(3'h4):(2'h2)] : $signed((((wire143 << (8'hb7)) ?
              (wire144 << reg181) : $unsigned(wire150)) - {((8'hae) ?
                  wire145 : wire149),
              wire145[(2'h2):(1'h0)]})));
      reg189 <= $unsigned((~&($unsigned($signed(wire142)) << (wire153[(3'h4):(2'h2)] ?
          $unsigned(wire152) : (wire141 & wire148)))));
    end
  assign wire190 = $unsigned(($signed($signed(((8'ha5) - (8'hb2)))) ?
                       {{wire152[(1'h0):(1'h0)],
                               (reg187 ?
                                   wire147 : wire145)}} : ((reg185 * (~^wire151)) ?
                           $unsigned($unsigned(reg181)) : $signed((8'ha3)))));
  assign wire191 = ({reg186,
                       ((~|reg184[(1'h0):(1'h0)]) >>> {(reg183 ?
                               wire153 : wire190)})} << {(((wire152 ?
                               wire146 : wire146) + reg183[(1'h1):(1'h1)]) ?
                           (!((8'ha5) > wire154)) : ((&reg182) >>> (&(8'h9c))))});
  module192 #() modinst236 (.wire193(reg184), .wire194(wire155), .wire195(wire190), .clk(clk), .y(wire235), .wire196(reg186));
  assign wire237 = (&$signed((wire144 ? (~&(&wire142)) : $unsigned({reg186}))));
  always
    @(posedge clk) begin
      if (wire154[(2'h3):(1'h1)])
        begin
          reg238 <= {wire191};
          if (((reg187 ?
              ($unsigned((8'hb0)) ?
                  $signed((wire151 ?
                      (8'h9e) : reg185)) : (8'ha8)) : $signed(wire144)) & $signed($unsigned((^(wire155 ?
              wire235 : reg184))))))
            begin
              reg239 <= reg183;
              reg240 <= wire153;
              reg241 <= $signed(reg182);
            end
          else
            begin
              reg239 <= (wire143 + (wire154 ?
                  (-(reg240[(1'h1):(1'h1)] ^~ {reg240})) : (~^reg181)));
              reg240 <= (^~(reg188 ?
                  wire146 : ($unsigned((~&(8'h9f))) <<< {(!reg189)})));
              reg241 <= {{(~^(~^$unsigned((8'ha9)))),
                      $signed({(~&reg241), ((8'hbf) | (8'ha0))})},
                  wire237};
              reg242 <= (($unsigned(wire153[(3'h7):(2'h3)]) < ((reg187[(2'h2):(2'h2)] ^ (reg240 ?
                      wire152 : (7'h40))) << wire143)) ?
                  (+$signed(((wire190 ? reg239 : wire178) ?
                      (8'hb0) : (wire150 ?
                          reg184 : (7'h40))))) : reg182[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          reg238 <= wire148[(4'hb):(3'h4)];
          reg239 <= $unsigned(reg180);
          reg240 <= (&(8'hb4));
        end
      reg243 <= reg185;
      reg244 <= {$unsigned((&$signed((^~(8'h9f)))))};
      if (wire155)
        begin
          reg245 <= wire141[(1'h1):(1'h1)];
          reg246 <= {(reg238 ?
                  (~^(wire150[(4'h8):(1'h0)] < (~|(8'ha8)))) : $unsigned(reg181[(2'h2):(2'h2)])),
              $signed(((~(reg239 ? reg243 : (8'h9f))) ?
                  reg244 : $unsigned(reg183)))};
          reg247 <= (&wire237[(4'hc):(2'h2)]);
          reg248 <= (|$signed((((reg242 ?
                  reg187 : wire147) << reg183[(1'h1):(1'h1)]) ?
              (wire151 <= $unsigned(reg242)) : (~|(|wire146)))));
        end
      else
        begin
          if (({(~&((wire148 + wire154) || wire152[(2'h3):(2'h3)]))} ?
              {$signed(wire145), (&reg181)} : $unsigned(reg182)))
            begin
              reg245 <= $signed(reg241);
            end
          else
            begin
              reg245 <= reg241;
              reg246 <= $signed(wire145);
              reg247 <= (((reg187[(4'hc):(1'h1)] ?
                      (~&(^~wire235)) : $signed({wire155, wire153})) ?
                  $signed(reg186[(3'h4):(3'h4)]) : reg183[(2'h2):(2'h2)]) ~^ (reg184 + reg241[(3'h4):(3'h4)]));
              reg248 <= reg188[(2'h3):(2'h3)];
              reg249 <= $signed(wire191);
            end
          if (({wire148[(2'h2):(1'h1)],
              (((|wire237) != (!wire142)) ?
                  reg184 : ((reg249 >> reg180) + $unsigned(reg239)))} + $unsigned(wire143)))
            begin
              reg250 <= (-reg183[(1'h0):(1'h0)]);
            end
          else
            begin
              reg250 <= (-(-reg247[(4'ha):(3'h4)]));
              reg251 <= wire145[(3'h4):(3'h4)];
            end
        end
      reg252 <= wire145;
    end
  module253 #() modinst270 (.clk(clk), .wire255(wire178), .wire254(reg252), .wire256(reg245), .wire257(reg187), .y(wire269));
  assign wire271 = $signed($unsigned({$unsigned($signed((8'hb1))),
                       $signed($unsigned(wire269))}));
endmodule

module module40  (y, clk, wire41, wire42, wire43, wire44);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire41;
  input wire [(2'h2):(1'h0)] wire42;
  input wire signed [(4'hc):(1'h0)] wire43;
  input wire signed [(5'h13):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire50;
  wire [(3'h6):(1'h0)] wire51;
  wire [(4'hd):(1'h0)] wire52;
  wire signed [(2'h2):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire136;
  reg [(5'h11):(1'h0)] reg48 = (1'h0);
  assign y = {wire45,
                 wire46,
                 wire47,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire85,
                 wire136,
                 reg48,
                 (1'h0)};
  assign wire45 = (~^$unsigned($signed(({(8'hb6), wire42} ?
                      {wire41, wire41} : ((8'hab) ? wire43 : wire42)))));
  assign wire46 = wire43[(4'hc):(1'h1)];
  assign wire47 = wire46[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg48 <= (((!$unsigned($unsigned(wire42))) ?
          (8'h9f) : (((|wire47) ?
              (wire44 | wire42) : (!wire47)) | wire41)) ~^ (8'hab));
    end
  assign wire49 = wire44[(5'h10):(1'h1)];
  assign wire50 = $unsigned($unsigned({((wire43 ? wire46 : wire45) ?
                          ((8'haf) ? wire49 : (8'hb2)) : (!reg48))}));
  assign wire51 = $unsigned($unsigned(wire41[(4'h8):(2'h2)]));
  assign wire52 = wire41[(4'hd):(4'ha)];
  assign wire53 = ({(((wire52 & wire47) ? $unsigned(wire45) : {wire46}) ?
                              {(~^wire44)} : (|{wire44, wire45})),
                          reg48} ?
                      $signed((~^wire50)) : $signed(wire50));
  module54 #() modinst86 (wire85, clk, wire44, reg48, wire52, wire50, wire49);
  module87 #() modinst137 (wire136, clk, wire42, wire45, reg48, wire47);
endmodule

module module87
#(parameter param135 = ((((~&((8'hb1) ? (7'h44) : (8'hbb))) || (((8'hb4) ? (8'hb2) : (8'ha1)) ? ((8'hb9) & (8'hbb)) : {(8'hbe), (8'hae)})) == {((+(8'hb8)) - (|(8'hb7))), {((8'hb1) <<< (8'ha2))}}) ^~ (8'ha6)))
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h1e0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire91;
  input wire [(5'h11):(1'h0)] wire90;
  input wire [(5'h11):(1'h0)] wire89;
  input wire [(4'hb):(1'h0)] wire88;
  wire signed [(5'h10):(1'h0)] wire134;
  wire [(4'ha):(1'h0)] wire133;
  wire [(3'h6):(1'h0)] wire132;
  wire [(4'he):(1'h0)] wire131;
  wire [(4'hb):(1'h0)] wire130;
  wire signed [(2'h2):(1'h0)] wire129;
  wire [(2'h2):(1'h0)] wire128;
  wire [(2'h3):(1'h0)] wire127;
  wire [(5'h13):(1'h0)] wire126;
  wire signed [(4'ha):(1'h0)] wire106;
  wire [(3'h6):(1'h0)] wire105;
  wire signed [(5'h12):(1'h0)] wire101;
  wire signed [(5'h10):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire93;
  wire signed [(2'h2):(1'h0)] wire92;
  reg signed [(4'hc):(1'h0)] reg125 = (1'h0);
  reg [(4'h9):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg122 = (1'h0);
  reg [(4'hf):(1'h0)] reg121 = (1'h0);
  reg signed [(4'he):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg [(3'h4):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(4'ha):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg108 = (1'h0);
  reg [(4'h8):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(5'h14):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire106,
                 wire105,
                 wire101,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
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
                 reg104,
                 reg103,
                 reg102,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire92 = (!(({(~wire91)} ?
                      (wire91 != $unsigned((8'h9f))) : (&(wire89 ?
                          (8'hac) : (8'hb0)))) ^ $signed(wire89)));
  assign wire93 = (wire91 ?
                      wire92[(1'h0):(1'h0)] : $signed((((+(8'hbb)) >>> (wire90 ?
                          wire91 : (8'hb0))) >>> (!wire88[(2'h3):(1'h1)]))));
  assign wire94 = (wire88[(1'h1):(1'h1)] ? wire88 : wire92[(1'h0):(1'h0)]);
  assign wire95 = (wire94 | wire92);
  always
    @(posedge clk) begin
      reg96 <= (&wire89);
      reg97 <= $signed($signed((wire94 ?
          (wire92 ? {wire95, wire89} : $unsigned(wire93)) : $signed((wire91 ?
              reg96 : wire90)))));
      if (wire89[(4'hb):(2'h2)])
        begin
          if ((($unsigned(wire94[(4'hc):(2'h2)]) | ({((7'h43) ?
                      wire89 : (8'hbe)),
                  $unsigned(wire94)} ?
              wire88 : $unsigned(wire91))) || wire94))
            begin
              reg98 <= ({(8'hab)} ?
                  {wire95,
                      (((wire88 ? wire91 : wire90) ?
                          ((8'ha3) * reg96) : $unsigned((8'ha8))) ^ wire94)} : wire93);
              reg99 <= wire89;
            end
          else
            begin
              reg98 <= reg99;
            end
        end
      else
        begin
          reg98 <= reg96[(1'h0):(1'h0)];
          reg99 <= wire91[(2'h2):(2'h2)];
          reg100 <= ((8'ha7) ?
              $signed(({$unsigned(wire95),
                  (wire91 * (8'hb7))} + wire93)) : ((|(wire95[(2'h2):(2'h2)] ?
                      wire88[(3'h7):(1'h1)] : {wire91})) ?
                  (-wire89) : reg98[(2'h2):(1'h0)]));
        end
    end
  assign wire101 = $unsigned({{wire92}, $signed(wire94[(3'h7):(2'h2)])});
  always
    @(posedge clk) begin
      reg102 <= {((reg99[(5'h13):(3'h6)] ?
                  {wire91[(2'h2):(2'h2)]} : ((wire94 | (8'hab)) > $unsigned(reg99))) ?
              reg97[(1'h1):(1'h0)] : ($signed(wire91[(1'h1):(1'h0)]) ?
                  wire101 : (~&{wire92})))};
      reg103 <= {reg98, reg98[(2'h3):(2'h3)]};
      reg104 <= wire89[(4'h9):(1'h0)];
    end
  assign wire105 = wire93;
  assign wire106 = (~&(+$signed(((^wire89) >> (wire93 ^~ (8'h9c))))));
  always
    @(posedge clk) begin
      reg107 <= (~&$signed(($unsigned(wire88) >>> (^~reg100))));
      reg108 <= $unsigned(reg104[(1'h1):(1'h1)]);
      if ($unsigned(reg108))
        begin
          reg109 <= (8'hb7);
        end
      else
        begin
          if (reg97[(3'h5):(1'h0)])
            begin
              reg109 <= wire106[(1'h0):(1'h0)];
              reg110 <= reg104;
              reg111 <= (wire90[(3'h6):(3'h6)] ?
                  (~|$signed((reg97[(3'h4):(1'h0)] - (reg108 ?
                      wire105 : reg110)))) : reg97);
            end
          else
            begin
              reg109 <= reg99[(4'ha):(3'h7)];
              reg110 <= reg107;
              reg111 <= wire95;
              reg112 <= $signed((+reg100));
              reg113 <= $unsigned($signed({wire93, (^(~reg102))}));
            end
        end
      if ((^(reg98 * reg110)))
        begin
          reg114 <= reg99;
          reg115 <= reg99[(3'h4):(3'h4)];
          if (($signed(wire91[(2'h2):(2'h2)]) ?
              wire94 : {$unsigned($signed((-wire90)))}))
            begin
              reg116 <= reg104[(1'h1):(1'h1)];
              reg117 <= (~^reg100[(3'h7):(3'h7)]);
            end
          else
            begin
              reg116 <= (wire92[(1'h1):(1'h0)] ?
                  (8'ha8) : ((|((8'hbd) ? reg103 : $signed((8'hb6)))) ?
                      wire105 : $unsigned($signed(wire94))));
              reg117 <= $unsigned({(((reg107 ^ reg96) ?
                          (&reg116) : (reg107 && reg114)) ?
                      (|(-wire89)) : $signed({reg113}))});
            end
          reg118 <= (8'hab);
        end
      else
        begin
          if (($signed((reg96[(5'h15):(1'h1)] ^ $unsigned({(7'h44)}))) ?
              $signed(reg96[(2'h3):(1'h1)]) : ((+reg116) + (8'hb9))))
            begin
              reg114 <= wire95;
              reg115 <= ((($unsigned({reg97, reg111}) * $unsigned(reg99)) ?
                  (8'ha4) : $unsigned(reg108[(4'hb):(1'h0)])) << wire93[(4'h8):(3'h7)]);
              reg116 <= (reg103 != {wire94[(2'h2):(1'h0)]});
              reg117 <= $signed(reg108[(4'hb):(2'h2)]);
            end
          else
            begin
              reg114 <= reg115;
              reg115 <= $signed(reg102[(4'h9):(2'h3)]);
              reg116 <= $signed((($signed(wire89) ?
                      ($signed(reg100) ?
                          wire89[(4'h9):(2'h2)] : (reg102 ?
                              reg115 : reg99)) : {reg118}) ?
                  (((wire101 ? reg103 : wire92) ?
                      reg113[(3'h7):(3'h4)] : ((7'h40) ?
                          (8'hbe) : (8'ha8))) && reg103[(4'he):(3'h7)]) : (&(^~((7'h41) ?
                      (8'ha8) : wire90)))));
              reg117 <= $unsigned((|$unsigned(((wire101 ?
                  wire90 : (7'h41)) >= {reg110}))));
            end
          reg118 <= (8'h9e);
          reg119 <= reg104[(1'h0):(1'h0)];
          reg120 <= $unsigned(((reg104[(1'h1):(1'h1)] ?
              ((8'hb7) ?
                  wire88 : reg102[(3'h5):(1'h1)]) : $unsigned(wire89)) || ((~^wire88[(4'hb):(4'ha)]) & wire95[(1'h1):(1'h0)])));
          if ($unsigned(($unsigned($signed(wire89[(4'he):(4'hb)])) ?
              reg107[(3'h6):(3'h6)] : (~|$unsigned(wire106[(3'h6):(2'h2)])))))
            begin
              reg121 <= (~^reg114);
              reg122 <= {((~|$signed($unsigned(reg97))) >>> (~|wire91[(1'h0):(1'h0)])),
                  ((8'ha7) >> (~reg119))};
              reg123 <= {reg114};
              reg124 <= (reg102[(1'h0):(1'h0)] >>> $signed(({(reg116 && wire91)} ~^ $unsigned((wire106 ?
                  reg104 : reg97)))));
            end
          else
            begin
              reg121 <= wire101[(3'h6):(3'h6)];
              reg122 <= reg120[(3'h4):(1'h0)];
              reg123 <= {($unsigned(({reg112} ?
                      $unsigned(reg113) : (+wire93))) ~^ {reg124})};
              reg124 <= wire93;
            end
        end
      reg125 <= wire91[(1'h0):(1'h0)];
    end
  assign wire126 = $signed(({reg107} ?
                       ($unsigned($signed(reg119)) >> $unsigned($signed((8'haf)))) : wire94));
  assign wire127 = $unsigned(reg100);
  assign wire128 = $signed({$signed({wire94[(4'hc):(4'ha)]}),
                       (((-reg121) & {(8'ha8),
                           reg97}) + reg100[(3'h4):(1'h1)])});
  assign wire129 = (+reg119);
  assign wire130 = reg118;
  assign wire131 = (wire130[(3'h7):(3'h6)] ?
                       $unsigned(({{wire92},
                           (reg103 ?
                               wire127 : reg125)} * (wire128[(1'h1):(1'h1)] <= {reg96}))) : reg114);
  assign wire132 = wire91[(1'h1):(1'h1)];
  assign wire133 = $signed((reg118[(3'h5):(3'h5)] & reg108[(4'h9):(4'h8)]));
  assign wire134 = ((|{wire106[(3'h5):(3'h4)],
                       (wire101 ?
                           (wire131 ?
                               reg116 : wire95) : (~reg116))}) == reg102[(3'h7):(2'h3)]);
endmodule

module module54
#(parameter param83 = ((((((8'hb6) ? (8'had) : (8'hb7)) < (~&(8'hb4))) ? (((8'ha7) || (8'hba)) ? ((8'hb8) ? (8'haa) : (8'hae)) : (!(8'h9d))) : {{(8'hbf), (8'haf)}}) * (((~(7'h40)) ? ((8'ha6) == (8'hac)) : (-(8'hb0))) | ((~&(8'ha0)) ? (!(7'h43)) : ((8'hab) ^ (8'hbf))))) ? ({(8'hb3), (((8'hb0) ? (8'hae) : (8'ha8)) ? ((8'hbe) ~^ (7'h41)) : {(8'hb3), (8'hb0)})} >>> ({(-(8'hb5)), ((8'ha2) >> (8'hba))} == (((8'hae) ? (8'hbc) : (8'ha0)) - ((7'h42) ? (8'h9d) : (8'hbc))))) : ((^~{(8'hb4)}) ? (({(8'ha6), (8'ha2)} ? ((8'hb1) == (7'h44)) : ((8'ha6) - (8'ha4))) ? (^~{(8'hb5)}) : (-((8'ha7) > (8'ha5)))) : ((!(8'hb3)) >>> ((8'hbf) & ((8'hbc) ? (8'hbe) : (7'h40)))))), 
parameter param84 = ({param83} ? (((8'h9f) ? {(param83 ? param83 : (8'haf))} : (param83 < ((8'ha3) << param83))) ? (~(8'hb5)) : (~((param83 - param83) ? (param83 ? param83 : param83) : param83))) : ((8'ha5) ? param83 : (((param83 ? param83 : param83) ? {param83} : param83) & ({(8'haf)} >>> param83)))))
(y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire59;
  input wire signed [(4'hf):(1'h0)] wire58;
  input wire signed [(4'hd):(1'h0)] wire57;
  input wire [(4'h8):(1'h0)] wire56;
  input wire [(3'h7):(1'h0)] wire55;
  wire signed [(4'ha):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire79;
  wire [(4'hd):(1'h0)] wire78;
  wire signed [(3'h7):(1'h0)] wire77;
  wire [(2'h3):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire62;
  wire [(2'h3):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire60;
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  assign y = {wire82,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 reg81,
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
                 (1'h0)};
  assign wire60 = wire57[(3'h5):(3'h5)];
  assign wire61 = ((~|wire59[(4'h9):(4'h8)]) ?
                      ((+wire57) << {wire60}) : (((wire55 ?
                          (&(8'hb9)) : $unsigned(wire60)) ^~ ($unsigned(wire55) ?
                          $unsigned(wire56) : (wire57 > wire57))) >>> (($signed((8'ha2)) >> (wire57 ?
                              wire56 : wire60)) ?
                          ((7'h41) ? wire56 : (wire56 >> wire58)) : wire59)));
  assign wire62 = {(^~$unsigned({(wire55 >> wire57), {wire56, wire59}}))};
  assign wire63 = (!{(~|{wire59, $unsigned(wire56)}),
                      ((wire62[(2'h3):(1'h0)] ? $signed(wire55) : (-wire61)) ?
                          (wire56[(4'h8):(2'h2)] >>> (wire60 ?
                              wire62 : wire55)) : ({wire62,
                              (8'h9e)} >> (wire56 && wire61)))});
  always
    @(posedge clk) begin
      reg64 <= (wire63 ?
          {$signed({(~^wire56), $unsigned(wire60)}),
              $signed($signed((wire63 ?
                  wire56 : (8'ha4))))} : (~(($unsigned(wire61) ?
                  $signed(wire55) : $unsigned(wire58)) ?
              ((wire60 ^~ wire55) < wire61[(1'h0):(1'h0)]) : ((8'hbb) ?
                  (wire56 ^~ wire59) : $unsigned(wire56)))));
      reg65 <= (|(wire62[(3'h4):(3'h4)] < (((8'ha9) ?
              reg64[(4'h8):(3'h6)] : (wire58 ? wire59 : wire59)) ?
          $unsigned((wire63 ?
              reg64 : wire60)) : (wire61[(2'h2):(1'h1)] ^ (&wire61)))));
      reg66 <= $signed((!$unsigned(wire62)));
      if ((^~((wire59 ?
              ((reg65 > (7'h44)) ?
                  reg64[(1'h0):(1'h0)] : (reg64 || reg66)) : {{wire58},
                  wire60[(2'h3):(2'h3)]}) ?
          wire57 : (8'ha9))))
        begin
          reg67 <= $signed({$unsigned($unsigned(wire58[(1'h0):(1'h0)])),
              ({$signed(wire57)} > (~(wire63 ? (8'ha0) : (8'hbb))))});
          reg68 <= {reg67};
        end
      else
        begin
          if ($signed($unsigned(wire55[(1'h1):(1'h1)])))
            begin
              reg67 <= (+$unsigned($signed($signed({wire60}))));
            end
          else
            begin
              reg67 <= (8'ha2);
              reg68 <= $unsigned((|reg64));
              reg69 <= (+$unsigned($signed(((wire57 >>> reg66) ?
                  reg66 : $signed(wire62)))));
              reg70 <= wire58[(3'h4):(2'h3)];
            end
          reg71 <= wire59[(4'h8):(2'h2)];
          reg72 <= reg67;
          reg73 <= reg69[(2'h3):(1'h1)];
        end
      reg74 <= ((8'hbf) ?
          reg73[(2'h2):(2'h2)] : {wire63[(3'h4):(3'h4)],
              $unsigned(((reg68 ? reg69 : reg71) ? (|wire63) : wire56))});
    end
  assign wire75 = ((^~(8'haf)) ?
                      $signed(wire58[(3'h4):(2'h3)]) : ($signed($signed(wire58[(4'h8):(1'h1)])) ?
                          {((wire61 ? wire55 : reg67) ? wire61 : reg70),
                              wire59[(3'h7):(3'h6)]} : (+reg64[(3'h5):(1'h1)])));
  assign wire76 = reg70;
  assign wire77 = wire56[(2'h2):(2'h2)];
  assign wire78 = ((|(^{reg65})) ?
                      (reg66 ?
                          wire62 : $signed(($unsigned(wire55) >= $unsigned(reg70)))) : (~^reg72[(3'h4):(1'h1)]));
  assign wire79 = $unsigned(reg68);
  assign wire80 = $unsigned((~^wire75));
  always
    @(posedge clk) begin
      reg81 <= {($unsigned((wire62 ? reg66 : ((8'hac) | wire76))) ?
              $signed(($unsigned(reg67) ? (~|(8'hb8)) : {wire78})) : (&reg72))};
    end
  assign wire82 = (wire60 ?
                      ({wire80[(2'h3):(2'h3)]} ?
                          ((8'hbc) >>> ((wire80 != wire59) ~^ (|wire55))) : $signed(((reg81 <= wire63) >= reg68[(1'h1):(1'h1)]))) : (reg72[(1'h1):(1'h1)] ?
                          reg74[(1'h1):(1'h1)] : {(+(8'hbe)),
                              wire59[(4'h9):(4'h8)]}));
endmodule

module module253
#(parameter param267 = ((~(((-(8'ha0)) ? ((8'hb0) ? (8'ha8) : (7'h44)) : (~&(8'ha5))) == (((7'h42) ? (8'hbf) : (7'h40)) ? {(8'hb3), (7'h43)} : (^~(8'hb6))))) ? ((({(8'haf), (8'ha6)} ? (~^(8'hb0)) : (+(8'haa))) ? {{(8'hb7)}, ((7'h40) <= (7'h43))} : {((8'hb5) << (8'haf))}) ? ((8'ha4) ? (((8'hb9) ? (8'hb4) : (8'h9f)) & ((8'hb6) ? (8'h9d) : (8'hb0))) : (^((8'h9d) ? (8'hb4) : (8'haa)))) : ({{(8'h9c), (7'h40)}, ((8'hb9) ? (8'ha3) : (7'h42))} < {((8'hbc) ? (8'hb5) : (8'ha8)), ((7'h42) ? (8'hb6) : (8'ha7))})) : ((&((7'h41) ? ((8'ha5) ? (8'h9f) : (8'hbe)) : (~(8'hba)))) ? ((^~(|(7'h44))) ^ (~|{(8'ha9), (8'ha6)})) : (8'ha2))), 
parameter param268 = (|param267))
(y, clk, wire257, wire256, wire255, wire254);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire257;
  input wire signed [(5'h10):(1'h0)] wire256;
  input wire [(4'hc):(1'h0)] wire255;
  input wire [(5'h13):(1'h0)] wire254;
  wire signed [(5'h10):(1'h0)] wire266;
  wire [(3'h5):(1'h0)] wire265;
  wire [(5'h10):(1'h0)] wire264;
  wire [(4'hb):(1'h0)] wire263;
  wire [(3'h4):(1'h0)] wire262;
  wire [(2'h3):(1'h0)] wire261;
  wire [(5'h14):(1'h0)] wire260;
  wire signed [(5'h10):(1'h0)] wire259;
  wire signed [(3'h7):(1'h0)] wire258;
  assign y = {wire266,
                 wire265,
                 wire264,
                 wire263,
                 wire262,
                 wire261,
                 wire260,
                 wire259,
                 wire258,
                 (1'h0)};
  assign wire258 = $signed(wire257);
  assign wire259 = (({wire256} & (((wire256 || (8'had)) || (!(8'ha6))) ~^ (&(+wire258)))) ?
                       (wire258[(3'h6):(2'h2)] ?
                           (($unsigned(wire257) ?
                               wire257 : $signed(wire254)) << $signed((wire254 ?
                               wire258 : wire255))) : $unsigned($unsigned($signed((8'hbc))))) : $unsigned(wire256));
  assign wire260 = $signed((wire258[(3'h4):(1'h1)] < $unsigned({$unsigned(wire257),
                       (8'had)})));
  assign wire261 = ((^~{$unsigned({wire256})}) ?
                       (8'hb3) : ($signed({wire260}) ? wire258 : wire259));
  assign wire262 = wire261[(1'h1):(1'h0)];
  assign wire263 = $unsigned($signed(wire259[(4'hf):(4'h8)]));
  assign wire264 = $signed(wire261[(1'h0):(1'h0)]);
  assign wire265 = $signed(($unsigned($signed(wire254[(1'h1):(1'h1)])) ?
                       {wire255[(3'h6):(2'h2)]} : {(8'ha0), wire257}));
  assign wire266 = wire254[(5'h12):(3'h5)];
endmodule

module module192
#(parameter param234 = (|(((((8'ha7) ? (8'hb7) : (8'h9d)) << (|(8'hb0))) ? (~|((8'hb6) ? (8'hb7) : (8'ha4))) : ((&(8'hb8)) ? ((7'h40) << (8'h9f)) : ((8'h9e) <= (8'hb8)))) | ((~|((7'h40) <= (8'hb4))) >>> (((8'hb3) | (8'haa)) ? ((8'hb6) ? (8'hbb) : (8'ha6)) : ((8'ha4) ^~ (8'hb6)))))))
(y, clk, wire196, wire195, wire194, wire193);
  output wire [(32'h19d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire196;
  input wire signed [(4'h9):(1'h0)] wire195;
  input wire signed [(2'h3):(1'h0)] wire194;
  input wire [(5'h12):(1'h0)] wire193;
  wire signed [(2'h3):(1'h0)] wire233;
  wire signed [(4'h9):(1'h0)] wire232;
  wire signed [(4'ha):(1'h0)] wire231;
  wire signed [(4'hc):(1'h0)] wire230;
  wire [(4'hb):(1'h0)] wire229;
  wire [(5'h14):(1'h0)] wire228;
  wire signed [(4'h8):(1'h0)] wire227;
  wire [(4'h8):(1'h0)] wire226;
  wire [(5'h10):(1'h0)] wire225;
  wire signed [(5'h11):(1'h0)] wire224;
  wire [(4'hc):(1'h0)] wire223;
  wire signed [(5'h10):(1'h0)] wire222;
  wire signed [(3'h6):(1'h0)] wire221;
  wire signed [(5'h13):(1'h0)] wire220;
  wire signed [(4'ha):(1'h0)] wire219;
  wire [(5'h15):(1'h0)] wire218;
  wire signed [(3'h7):(1'h0)] wire217;
  wire [(2'h2):(1'h0)] wire216;
  wire signed [(4'h9):(1'h0)] wire215;
  wire [(5'h12):(1'h0)] wire214;
  reg signed [(4'hd):(1'h0)] reg213 = (1'h0);
  reg [(4'he):(1'h0)] reg212 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg211 = (1'h0);
  reg [(3'h5):(1'h0)] reg210 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg209 = (1'h0);
  reg [(4'ha):(1'h0)] reg208 = (1'h0);
  reg [(5'h10):(1'h0)] reg207 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg206 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg205 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg204 = (1'h0);
  reg [(5'h13):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg202 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg201 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg200 = (1'h0);
  reg [(5'h15):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg198 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg197 = (1'h0);
  assign y = {wire233,
                 wire232,
                 wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire219,
                 wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 reg213,
                 reg212,
                 reg211,
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
                 reg197,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($signed($unsigned(wire194[(1'h0):(1'h0)])) ^~ $unsigned({$unsigned($unsigned((8'ha3)))})))
        begin
          reg197 <= wire193[(4'hb):(3'h7)];
          if ((({wire193} != wire193) >>> ($unsigned($unsigned((reg197 <<< reg197))) ?
              reg197 : {(wire194[(2'h2):(2'h2)] ?
                      $unsigned(wire193) : $signed(wire195)),
                  wire194})))
            begin
              reg198 <= reg197[(3'h5):(3'h4)];
            end
          else
            begin
              reg198 <= $signed((((^~(^~wire196)) ?
                  (8'ha8) : (reg198[(3'h4):(2'h3)] <= $signed(reg197))) + wire194[(2'h3):(1'h1)]));
              reg199 <= reg197[(1'h0):(1'h0)];
              reg200 <= reg198[(2'h2):(1'h1)];
            end
          reg201 <= (wire195 ?
              $unsigned(wire195[(3'h6):(1'h1)]) : (!(($signed((7'h44)) ?
                      (reg198 - wire194) : reg199[(4'hb):(4'ha)]) ?
                  ((wire194 ?
                      (7'h41) : reg198) && $signed(wire196)) : reg200[(4'ha):(3'h7)])));
        end
      else
        begin
          reg197 <= wire195;
          reg198 <= (reg200 ?
              wire193[(4'hf):(4'he)] : (&wire196[(3'h5):(3'h4)]));
          reg199 <= reg198[(2'h2):(1'h0)];
          reg200 <= wire194;
        end
      reg202 <= reg201[(3'h5):(1'h0)];
      if ((8'ha8))
        begin
          reg203 <= $signed((wire193 && wire196));
          reg204 <= {wire195[(1'h0):(1'h0)]};
          if ((-reg201))
            begin
              reg205 <= reg204;
            end
          else
            begin
              reg205 <= $signed(reg198[(3'h4):(3'h4)]);
              reg206 <= (({wire194[(2'h3):(2'h3)], reg198} >> reg205) ?
                  (&{reg201[(4'h8):(3'h6)]}) : ($unsigned(reg204[(1'h1):(1'h0)]) >= (((reg199 ^ wire196) ?
                          (^~reg200) : (~|(8'h9d))) ?
                      (8'hb6) : $unsigned((wire195 - reg198)))));
              reg207 <= $signed(wire194);
              reg208 <= wire195;
              reg209 <= wire193[(3'h7):(3'h7)];
            end
          reg210 <= reg201[(1'h0):(1'h0)];
          if (reg202[(3'h6):(3'h4)])
            begin
              reg211 <= $unsigned({reg200, reg205});
              reg212 <= (($unsigned($signed(((8'hb9) | reg202))) < $signed(reg209)) == ({$unsigned((-(8'hb1))),
                      (8'hac)} ?
                  (|(reg201 ?
                      (~reg208) : $signed(reg203))) : $signed((|(reg200 ?
                      (8'hb4) : wire196)))));
              reg213 <= {$unsigned({reg204, wire194})};
            end
          else
            begin
              reg211 <= $signed(($signed($unsigned($unsigned(wire193))) ?
                  $unsigned(wire195) : (-((~|reg199) ?
                      $signed(reg208) : reg204))));
            end
        end
      else
        begin
          reg203 <= $signed((&wire196));
          reg204 <= $unsigned(($signed(reg198) >>> $unsigned(reg200)));
          if ({(&$signed(reg203))})
            begin
              reg205 <= {reg202[(2'h3):(1'h1)], (~&$signed((^~reg202)))};
              reg206 <= (~^(((~|wire193) ?
                      $unsigned(reg198[(1'h0):(1'h0)]) : (reg204 * (~&reg206))) ?
                  $signed((!{reg200})) : reg213));
            end
          else
            begin
              reg205 <= reg202[(3'h5):(1'h1)];
            end
          if ({{$unsigned($unsigned(reg206[(1'h1):(1'h1)]))},
              $unsigned((~^$unsigned($unsigned(reg202))))})
            begin
              reg207 <= $unsigned(((^~(reg202 * (reg210 ? reg209 : reg212))) ?
                  {$signed(((8'ha4) & wire195)),
                      ($unsigned((8'h9e)) ?
                          reg208[(3'h6):(2'h3)] : (~&reg197))} : reg201[(1'h1):(1'h0)]));
              reg208 <= (^~reg204[(2'h2):(1'h0)]);
              reg209 <= ((wire194 ?
                  (^((reg200 > reg201) ?
                      reg213[(1'h1):(1'h0)] : reg199[(1'h1):(1'h1)])) : (($signed(reg207) != ((8'hb2) ?
                          reg202 : reg212)) ?
                      (|wire193[(3'h7):(3'h5)]) : reg202)) < $signed($unsigned({$signed(wire195)})));
            end
          else
            begin
              reg207 <= reg205[(2'h2):(2'h2)];
              reg208 <= reg210[(1'h0):(1'h0)];
              reg209 <= $unsigned(($signed(reg202[(4'ha):(1'h1)]) >= wire196));
              reg210 <= (^~(wire194 <= wire193));
            end
          if (reg200[(1'h1):(1'h1)])
            begin
              reg211 <= $unsigned($signed(reg204[(3'h4):(2'h2)]));
            end
          else
            begin
              reg211 <= reg201[(4'h9):(4'h8)];
            end
        end
    end
  assign wire214 = (+reg213);
  assign wire215 = {(({$unsigned(reg213)} ?
                           reg207 : ((reg210 ?
                               reg199 : reg203) & $unsigned(wire194))) ~^ $unsigned(((wire193 != reg198) ?
                           (reg199 ? reg213 : reg213) : {reg205, (8'ha7)}))),
                       (($unsigned(reg211) ?
                           ({reg198,
                               reg211} || $unsigned(reg210)) : $unsigned($unsigned((8'h9c)))) | reg211)};
  assign wire216 = (reg205[(1'h1):(1'h1)] ?
                       $unsigned(reg203[(5'h10):(4'hc)]) : $signed(reg203));
  assign wire217 = reg202[(4'hb):(2'h3)];
  assign wire218 = ((wire194 ?
                       ((^~(reg210 ? wire193 : (7'h41))) ^ ({wire216, reg213} ?
                           (8'hbe) : $signed(reg206))) : ((8'h9d) ^ wire195[(3'h4):(3'h4)])) == (^wire194[(1'h1):(1'h1)]));
  assign wire219 = reg207[(3'h7):(1'h1)];
  assign wire220 = $unsigned($unsigned((~|(reg204 ?
                       $signed(wire196) : $unsigned(reg198)))));
  assign wire221 = (reg204[(1'h1):(1'h1)] != ((((reg205 ~^ wire215) ?
                           (8'haf) : $signed(wire195)) ?
                       reg201[(1'h1):(1'h1)] : ((reg198 ?
                           reg208 : reg198) || reg213)) >>> (((~&wire196) ?
                           wire215[(3'h7):(2'h2)] : (reg202 | reg199)) ?
                       wire195[(3'h4):(1'h1)] : $signed((!wire220)))));
  assign wire222 = ($unsigned((-reg207)) != (reg207 + (^~reg203)));
  assign wire223 = $signed(reg209);
  assign wire224 = $unsigned(({(+wire218),
                       wire217} < $unsigned((~^$unsigned(wire218)))));
  assign wire225 = wire220;
  assign wire226 = (~|$signed({(|(|reg207))}));
  assign wire227 = ($signed(reg200) ? (~^reg203) : (^reg205));
  assign wire228 = (|((reg213 != wire226[(1'h1):(1'h1)]) < wire225));
  assign wire229 = {$unsigned(($unsigned({wire228,
                           wire220}) - wire218[(4'hd):(3'h5)]))};
  assign wire230 = {$signed((^~{(wire214 ? (8'hb3) : wire215),
                           (wire195 ? (7'h42) : (8'ha1))})),
                       reg201[(4'h8):(4'h8)]};
  assign wire231 = wire222;
  assign wire232 = $signed((reg198 ?
                       $unsigned($signed(wire222[(4'hb):(3'h6)])) : $unsigned({wire195,
                           (reg200 ? reg212 : wire195)})));
  assign wire233 = (wire231[(3'h5):(1'h1)] >= wire219);
endmodule

module module156  (y, clk, wire161, wire160, wire159, wire158, wire157);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire161;
  input wire signed [(2'h2):(1'h0)] wire160;
  input wire [(3'h7):(1'h0)] wire159;
  input wire signed [(2'h3):(1'h0)] wire158;
  input wire [(5'h13):(1'h0)] wire157;
  wire signed [(4'hb):(1'h0)] wire177;
  wire [(4'h8):(1'h0)] wire176;
  wire signed [(4'hb):(1'h0)] wire175;
  wire [(2'h2):(1'h0)] wire174;
  wire signed [(4'hc):(1'h0)] wire173;
  wire signed [(4'h9):(1'h0)] wire169;
  wire signed [(2'h3):(1'h0)] wire168;
  wire signed [(3'h5):(1'h0)] wire164;
  wire signed [(3'h5):(1'h0)] wire163;
  wire signed [(2'h2):(1'h0)] wire162;
  reg [(3'h4):(1'h0)] reg172 = (1'h0);
  reg [(4'h8):(1'h0)] reg171 = (1'h0);
  reg [(5'h15):(1'h0)] reg170 = (1'h0);
  reg [(5'h15):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg166 = (1'h0);
  reg [(4'hf):(1'h0)] reg165 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire169,
                 wire168,
                 wire164,
                 wire163,
                 wire162,
                 reg172,
                 reg171,
                 reg170,
                 reg167,
                 reg166,
                 reg165,
                 (1'h0)};
  assign wire162 = ($unsigned((-((wire161 + wire161) | (~^wire161)))) & ($signed($signed(wire157[(1'h0):(1'h0)])) >> ((~&wire157) & {$unsigned((8'h9f)),
                       (wire160 >> (8'hae))})));
  assign wire163 = wire158;
  assign wire164 = ($signed(wire157[(3'h6):(2'h2)]) < (!(($unsigned((8'ha5)) ?
                           ((8'h9e) < wire163) : (wire157 ?
                               wire161 : wire159)) ?
                       wire160[(1'h1):(1'h0)] : wire163)));
  always
    @(posedge clk) begin
      reg165 <= $signed($unsigned($unsigned((wire164 - wire163[(3'h4):(1'h0)]))));
      reg166 <= ($signed(wire158[(1'h0):(1'h0)]) || ((~&$unsigned((-wire158))) ?
          $unsigned($unsigned(((8'haf) ?
              wire163 : wire160))) : $signed(($unsigned(wire157) ?
              $unsigned(wire163) : (^wire157)))));
      reg167 <= $unsigned($signed(((reg166[(4'hd):(3'h4)] - (wire159 ?
              reg165 : wire157)) ?
          ($signed(wire160) ?
              $signed(reg166) : $unsigned(wire164)) : wire161[(1'h1):(1'h1)])));
    end
  assign wire168 = $unsigned(wire161[(4'ha):(3'h4)]);
  assign wire169 = $signed($unsigned((&(-(reg165 ? wire168 : reg165)))));
  always
    @(posedge clk) begin
      reg170 <= wire164;
      reg171 <= wire160[(2'h2):(1'h1)];
      reg172 <= $signed((((|(wire160 <<< wire158)) >> wire169) ?
          $unsigned(reg166[(4'hc):(2'h2)]) : (~&$signed((reg170 <= reg171)))));
    end
  assign wire173 = (~$signed((+wire162)));
  assign wire174 = reg172;
  assign wire175 = (^reg171[(3'h7):(2'h2)]);
  assign wire176 = wire163;
  assign wire177 = (8'ha7);
endmodule
