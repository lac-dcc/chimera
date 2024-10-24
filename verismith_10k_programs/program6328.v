module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire signed [(3'h6):(1'h0)] wire209;
  wire [(3'h4):(1'h0)] wire202;
  wire signed [(5'h14):(1'h0)] wire201;
  wire signed [(5'h11):(1'h0)] wire200;
  wire [(5'h13):(1'h0)] wire199;
  wire [(4'h9):(1'h0)] wire198;
  wire [(3'h6):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire20;
  wire signed [(4'h9):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire196;
  wire [(4'hf):(1'h0)] wire204;
  wire [(5'h13):(1'h0)] wire205;
  wire [(3'h5):(1'h0)] wire206;
  wire signed [(4'hc):(1'h0)] wire207;
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  assign y = {wire209,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire196,
                 wire204,
                 wire205,
                 wire206,
                 wire207,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((^(~|$signed($signed((wire4 << (7'h41)))))))
        begin
          reg5 <= wire4[(5'h10):(4'hb)];
          reg6 <= reg5[(1'h0):(1'h0)];
        end
      else
        begin
          reg5 <= $unsigned(wire3);
        end
      reg7 <= (~&$signed(reg5[(3'h5):(3'h4)]));
      reg8 <= reg7[(4'h9):(2'h2)];
      if (((wire2 <= reg8[(4'hd):(2'h3)]) ~^ reg5[(3'h6):(1'h1)]))
        begin
          if (reg6)
            begin
              reg9 <= (({$unsigned(wire3[(3'h5):(1'h0)]), reg5} ?
                      wire3 : (&(((8'hbd) << reg7) ?
                          (~&reg7) : {(8'hb5), (8'hb7)}))) ?
                  $unsigned((wire3[(3'h4):(1'h0)] ?
                      ($unsigned(wire3) ?
                          (wire1 ?
                              wire1 : reg6) : wire2) : wire3[(3'h4):(3'h4)])) : (~&wire0[(4'hb):(2'h2)]));
              reg10 <= wire3[(3'h4):(3'h4)];
              reg11 <= $signed((~(((~^reg9) >= (-wire1)) ?
                  {$signed(reg7)} : (8'hb5))));
              reg12 <= reg8;
              reg13 <= $unsigned($unsigned((^~$signed(((8'ha6) | reg6)))));
            end
          else
            begin
              reg9 <= {$signed((&(+{(8'ha7), wire2})))};
              reg10 <= $unsigned((wire1[(4'h8):(2'h2)] | (($unsigned(wire3) <= (reg13 ?
                  wire2 : reg5)) & $unsigned(reg12))));
              reg11 <= $unsigned($unsigned((wire1[(3'h6):(3'h4)] ~^ ((-reg7) >>> wire0))));
              reg12 <= $unsigned((&{{(reg7 == reg8), reg5[(2'h3):(1'h1)]},
                  ((reg6 ? reg10 : wire4) ~^ wire1[(2'h2):(1'h1)])}));
              reg13 <= (^~reg6);
            end
          reg14 <= reg9;
          reg15 <= ($unsigned($signed($unsigned(reg5[(3'h4):(1'h0)]))) ?
              ($unsigned(((&reg13) ? $signed(reg12) : ((7'h42) || (8'hb7)))) ?
                  (reg11 ?
                      wire0[(5'h12):(2'h3)] : (-$unsigned(reg14))) : reg14) : (~^{$unsigned((wire3 | reg9))}));
          reg16 <= (!reg10);
        end
      else
        begin
          reg9 <= reg12;
          if ((((((wire3 ? reg9 : wire3) ~^ reg13) ?
                      (+(^~(8'hbd))) : (wire2 ?
                          {wire4, wire4} : $unsigned(wire4))) ?
                  ($unsigned((reg7 <<< (8'hbf))) & $signed((reg10 ?
                      reg9 : reg6))) : $unsigned(({(8'hba)} ?
                      $unsigned((7'h44)) : $signed((8'hb7))))) ?
              (~|(wire3 ^~ ($unsigned(reg10) <<< (reg12 || reg6)))) : ((~|(7'h40)) ?
                  reg15 : $unsigned(reg5[(1'h1):(1'h1)]))))
            begin
              reg10 <= (~^$unsigned(reg11[(2'h2):(1'h1)]));
              reg11 <= $signed(((~reg5) - reg16));
              reg12 <= reg16;
              reg13 <= (reg7 - reg5);
              reg14 <= $signed((&({$signed(reg11)} == (~wire1[(3'h6):(3'h4)]))));
            end
          else
            begin
              reg10 <= reg6;
            end
          reg15 <= (reg7[(5'h10):(4'he)] ~^ $signed($signed((8'ha8))));
          if ($signed(reg16[(3'h4):(2'h2)]))
            begin
              reg16 <= (wire3 - ((reg6 ?
                  (!(~&reg11)) : $unsigned(((8'hb6) ?
                      (7'h41) : reg15))) | ($signed(((8'ha4) <= reg9)) << $unsigned($unsigned(reg13)))));
            end
          else
            begin
              reg16 <= ((&({(wire1 | reg13),
                  (-reg7)} && reg10[(5'h11):(1'h1)])) <<< (reg6 ~^ wire1[(3'h7):(1'h1)]));
            end
        end
      reg17 <= ((~^(wire1 ?
          $signed(reg7) : {(reg6 ? wire0 : reg14)})) && (!wire3));
    end
  assign wire18 = reg13[(4'hc):(2'h2)];
  assign wire19 = (((~|((-(8'hb9)) || reg14[(3'h5):(3'h5)])) ?
                          (7'h44) : {{wire3[(2'h2):(1'h1)]},
                              (~((7'h41) && reg8))}) ?
                      ({(&$unsigned(reg13)),
                          reg10[(3'h6):(1'h0)]} > $signed($unsigned(((8'ha9) ?
                          wire2 : wire2)))) : reg10[(4'hb):(2'h3)]);
  assign wire20 = (wire0 >> (~^wire3));
  assign wire21 = ($signed((reg8[(4'h8):(3'h4)] ?
                          (|$unsigned((7'h41))) : (7'h42))) ?
                      ((^$signed($signed(reg10))) ?
                          ($signed((wire1 ?
                              wire1 : wire1)) != {$unsigned(wire1),
                              $signed(reg17)}) : (8'ha3)) : {(((!reg5) ?
                              (reg16 ?
                                  reg13 : reg17) : $unsigned(reg9)) - (((7'h40) ?
                              wire20 : reg12) <= (reg9 ? wire3 : reg7)))});
  assign wire22 = wire0;
  assign wire23 = {(($signed((reg10 <<< reg12)) ?
                          $unsigned((wire21 ^~ reg6)) : wire22[(1'h1):(1'h1)]) <<< wire2[(2'h3):(2'h3)]),
                      (~&$unsigned($unsigned(wire1)))};
  module24 #() modinst197 (.wire27(reg15), .wire25(wire1), .wire26(reg12), .clk(clk), .y(wire196), .wire28(reg16));
  assign wire198 = wire4[(1'h1):(1'h0)];
  assign wire199 = reg12;
  assign wire200 = wire22;
  assign wire201 = $unsigned($signed((~({(8'h9d), reg13} && $signed(reg6)))));
  module114 #() modinst203 (.wire116(wire199), .clk(clk), .y(wire202), .wire118(reg17), .wire115(reg15), .wire117(reg7), .wire119(reg8));
  assign wire204 = (reg10[(5'h12):(5'h10)] ?
                       $signed((|wire19)) : $signed(wire21[(4'h9):(3'h5)]));
  assign wire205 = $unsigned($signed(wire201[(5'h13):(3'h5)]));
  assign wire206 = $signed({$unsigned((~|$signed(reg16)))});
  module72 #() modinst208 (.wire73(wire0), .wire77(wire200), .wire74(reg15), .clk(clk), .y(wire207), .wire75(wire198), .wire76(reg16));
  assign wire209 = ($signed(wire4) <<< ((~|$unsigned(((8'ha8) < reg11))) || (wire18[(2'h3):(2'h2)] ?
                       ($signed((8'ha8)) && ((8'hb7) ^~ wire199)) : reg15[(1'h1):(1'h0)])));
endmodule

module module24  (y, clk, wire25, wire26, wire27, wire28);
  output wire [(32'h20a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire25;
  input wire [(5'h13):(1'h0)] wire26;
  input wire signed [(5'h10):(1'h0)] wire27;
  input wire [(5'h14):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire191;
  wire [(4'hd):(1'h0)] wire190;
  wire [(5'h10):(1'h0)] wire189;
  wire [(2'h3):(1'h0)] wire186;
  wire [(5'h15):(1'h0)] wire180;
  wire [(4'hf):(1'h0)] wire142;
  wire signed [(4'h9):(1'h0)] wire112;
  wire signed [(3'h5):(1'h0)] wire71;
  wire signed [(4'he):(1'h0)] wire70;
  wire [(5'h15):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire68;
  wire [(3'h6):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire48;
  wire [(4'ha):(1'h0)] wire144;
  wire [(4'h9):(1'h0)] wire159;
  reg [(4'ha):(1'h0)] reg195 = (1'h0);
  reg [(4'hc):(1'h0)] reg194 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg193 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg188 = (1'h0);
  reg [(2'h3):(1'h0)] reg187 = (1'h0);
  reg [(4'h8):(1'h0)] reg185 = (1'h0);
  reg [(3'h6):(1'h0)] reg184 = (1'h0);
  reg [(3'h4):(1'h0)] reg183 = (1'h0);
  reg [(5'h14):(1'h0)] reg182 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  assign y = {wire191,
                 wire190,
                 wire189,
                 wire186,
                 wire180,
                 wire142,
                 wire112,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire50,
                 wire29,
                 wire30,
                 wire48,
                 wire144,
                 wire159,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg188,
                 reg187,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 (1'h0)};
  assign wire29 = (wire26 * (((8'hbb) ?
                      wire26 : $unsigned($signed((8'hb6)))) <= wire27[(2'h2):(1'h1)]));
  assign wire30 = ((+(+(|(wire28 ?
                      wire28 : wire27)))) * (wire29[(1'h0):(1'h0)] ?
                      (((wire27 ?
                          (8'ha6) : wire29) > $unsigned(wire26)) << {wire28}) : wire26[(1'h0):(1'h0)]));
  module31 #() modinst49 (wire48, clk, wire26, wire27, wire29, wire25, wire28);
  assign wire50 = $unsigned((+($unsigned(wire28[(1'h0):(1'h0)]) == wire27[(3'h5):(2'h2)])));
  always
    @(posedge clk) begin
      reg51 <= $unsigned($unsigned((wire30[(2'h3):(1'h1)] + $unsigned(wire30))));
      if ((&{(((wire29 ? wire27 : wire48) ?
                  (wire27 ? wire27 : wire27) : (!wire26)) ?
              wire28 : $signed($unsigned(wire25))),
          ({$signed((8'hbd)), $signed(wire25)} ?
              {$unsigned(wire30), (^~(7'h41))} : (~|{wire28}))}))
        begin
          reg52 <= (reg51 ~^ ({wire26} != (~|($unsigned(reg51) ~^ wire25[(2'h2):(2'h2)]))));
          reg53 <= (~|((|(~&(reg51 >> wire50))) ?
              (wire27 | ($signed((8'hbd)) ?
                  {(8'ha4)} : (&wire28))) : ($unsigned(reg51) ?
                  wire30 : ((~^wire27) > (reg52 ? wire27 : wire28)))));
          reg54 <= ((-(($signed(reg51) <<< (reg52 ? reg51 : wire29)) ?
                  reg52 : (wire25[(3'h7):(3'h4)] | {wire26, wire29}))) ?
              wire28[(3'h7):(1'h0)] : (~($unsigned((^~reg51)) ?
                  ({(7'h43)} ?
                      (wire26 ?
                          (8'ha3) : wire50) : (~&wire27)) : $signed($unsigned((8'hb1))))));
        end
      else
        begin
          if ((8'hb3))
            begin
              reg52 <= (($unsigned($unsigned((wire28 >= reg52))) < $signed((&((7'h44) ?
                  wire26 : wire30)))) ~^ wire50);
              reg53 <= $unsigned((|(wire28[(4'h9):(1'h0)] ?
                  ((^~wire30) >> $unsigned(wire50)) : reg53)));
            end
          else
            begin
              reg52 <= (~^($signed($signed($signed(reg52))) ^ wire27[(3'h6):(1'h0)]));
              reg53 <= ((reg52[(5'h11):(5'h11)] ?
                  (^~wire48) : wire48[(4'ha):(1'h1)]) != wire28);
              reg54 <= (&{($unsigned((8'hb9)) == {(reg51 >>> reg54),
                      (|(8'hb4))}),
                  ((^(wire27 ? wire29 : wire25)) ?
                      (~$unsigned(wire25)) : wire30[(1'h1):(1'h0)])});
              reg55 <= ((!$unsigned(((wire27 ? wire48 : wire48) ?
                  {(8'h9f),
                      reg54} : wire26[(2'h2):(1'h0)]))) + (wire50 | wire25[(2'h2):(1'h0)]));
              reg56 <= $signed(wire26[(5'h12):(4'h8)]);
            end
          if (($unsigned(reg52[(3'h7):(3'h6)]) ?
              wire30 : {$unsigned((~reg54))}))
            begin
              reg57 <= (!($unsigned((7'h41)) && (8'hac)));
              reg58 <= wire30[(2'h3):(1'h0)];
              reg59 <= ($signed(wire29[(3'h5):(2'h3)]) ^ reg52[(5'h10):(4'h8)]);
              reg60 <= $unsigned(wire28[(3'h6):(3'h6)]);
            end
          else
            begin
              reg57 <= $signed($unsigned($unsigned((~|$unsigned((8'hb5))))));
              reg58 <= reg59[(1'h1):(1'h0)];
              reg59 <= $unsigned((wire25[(3'h4):(1'h1)] ?
                  ($signed((wire50 ? reg57 : (8'ha2))) ?
                      ((wire30 >= reg56) == $signed((8'ha7))) : (+reg60[(4'he):(4'h9)])) : (|$unsigned({reg55,
                      wire27}))));
              reg60 <= $signed(wire25[(1'h1):(1'h0)]);
              reg61 <= $signed((^~$signed((+(-wire48)))));
            end
          reg62 <= (8'hb9);
          reg63 <= (|reg61[(2'h2):(1'h0)]);
          reg64 <= ($signed((+(8'hbd))) ^~ $signed(reg54));
        end
      reg65 <= (($unsigned((^~(-wire30))) <= $signed($unsigned((wire26 ~^ reg55)))) ?
          (^reg55[(1'h1):(1'h0)]) : reg54[(2'h2):(1'h0)]);
      reg66 <= $signed((((reg55 ? ((8'h9e) << reg51) : {wire26}) ?
              (-$unsigned(reg51)) : ({(8'hb3)} ? $signed(reg62) : reg65)) ?
          $unsigned($unsigned($signed(reg62))) : (8'hbf)));
      reg67 <= ((^$unsigned((^~wire29[(3'h5):(2'h2)]))) ? reg60 : wire48);
    end
  assign wire68 = (&(+wire48[(1'h1):(1'h1)]));
  assign wire69 = (~&$signed({(7'h43)}));
  assign wire70 = $signed(((-reg65) + wire25[(2'h2):(2'h2)]));
  assign wire71 = ({(~|wire30[(1'h0):(1'h0)])} ?
                      ((-$unsigned({(8'hac)})) ?
                          $signed($signed((!wire30))) : (reg52[(3'h6):(3'h4)] + ({reg54,
                                  wire27} ?
                              $unsigned(reg55) : $signed(wire26)))) : $signed((!(wire68[(1'h0):(1'h0)] ?
                          (reg56 ? wire30 : wire48) : reg60[(4'h9):(1'h1)]))));
  module72 #() modinst113 (wire112, clk, wire70, wire69, reg53, reg55, reg65);
  module114 #() modinst143 (.wire118(wire69), .wire115(wire25), .wire119(wire27), .clk(clk), .wire116(reg56), .wire117(reg55), .y(wire142));
  assign wire144 = reg51;
  module145 #() modinst160 (wire159, clk, wire27, reg58, reg63, reg55);
  module161 #() modinst181 (wire180, clk, wire48, wire68, reg51, reg61, reg64);
  always
    @(posedge clk) begin
      reg182 <= ({(wire142 && (|(reg62 ?
              reg63 : reg67)))} * $signed(($signed((-reg63)) << (~^(wire25 ?
          reg57 : reg55)))));
      reg183 <= (reg62[(2'h3):(1'h0)] ~^ (wire180 + reg65[(5'h12):(4'h9)]));
      reg184 <= $unsigned($unsigned(($unsigned((reg57 ? wire50 : wire30)) ?
          reg183[(1'h1):(1'h1)] : $unsigned((wire180 >>> reg63)))));
      reg185 <= reg64[(1'h0):(1'h0)];
    end
  assign wire186 = (~wire30[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg187 <= ($unsigned((8'hb1)) ?
          wire27 : {(wire69[(4'hc):(4'ha)] ?
                  wire112 : (~(reg51 ? reg52 : wire50)))});
      reg188 <= wire25[(3'h7):(2'h2)];
    end
  assign wire189 = (wire180 + $unsigned((+$signed((7'h41)))));
  assign wire190 = wire159[(3'h4):(1'h1)];
  assign wire191 = reg54;
  always
    @(posedge clk) begin
      if ($unsigned((reg57[(4'hb):(4'h8)] ?
          ({reg185[(2'h3):(2'h3)]} ?
              $unsigned({wire28}) : ((wire26 < (8'ha4)) ?
                  wire25 : (~reg66))) : $unsigned((reg66 >> $unsigned(reg56))))))
        begin
          if (wire27)
            begin
              reg192 <= reg54;
              reg193 <= $unsigned((wire30 ?
                  $signed(reg192[(4'h8):(1'h0)]) : reg187[(1'h1):(1'h1)]));
              reg194 <= (reg182[(4'h9):(3'h7)] == wire159[(1'h1):(1'h1)]);
            end
          else
            begin
              reg192 <= wire30;
            end
        end
      else
        begin
          reg192 <= $unsigned({(^{(reg55 & (8'hb6)), {wire69, (8'h9f)}}),
              $unsigned(((reg54 ? wire25 : reg63) ? {reg192} : {wire159}))});
          reg193 <= reg51[(1'h1):(1'h0)];
        end
      reg195 <= $unsigned((($signed($signed(wire50)) ?
          $signed((reg185 & reg62)) : $unsigned((~|reg63))) - wire68[(3'h5):(2'h3)]));
    end
endmodule

module module161
#(parameter param179 = (!(((((8'hb6) ^ (8'hb4)) ? ((8'hb5) ? (8'h9c) : (8'hbc)) : (8'ha1)) ? ((&(8'h9c)) ~^ ((8'hae) ? (8'hbd) : (8'hbc))) : ((8'hba) ? ((8'hbe) ? (8'h9d) : (8'hb0)) : ((8'h9e) ? (8'hae) : (8'ha7)))) < (-{(!(8'h9c))}))))
(y, clk, wire166, wire165, wire164, wire163, wire162);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire166;
  input wire [(4'hd):(1'h0)] wire165;
  input wire signed [(5'h11):(1'h0)] wire164;
  input wire [(4'hd):(1'h0)] wire163;
  input wire [(5'h10):(1'h0)] wire162;
  wire [(3'h4):(1'h0)] wire173;
  wire [(4'hc):(1'h0)] wire170;
  wire [(5'h12):(1'h0)] wire169;
  wire signed [(4'h8):(1'h0)] wire167;
  reg signed [(3'h4):(1'h0)] reg178 = (1'h0);
  reg [(4'h9):(1'h0)] reg177 = (1'h0);
  reg [(2'h3):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg172 = (1'h0);
  reg [(4'he):(1'h0)] reg171 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg168 = (1'h0);
  assign y = {wire173,
                 wire170,
                 wire169,
                 wire167,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg172,
                 reg171,
                 reg168,
                 (1'h0)};
  assign wire167 = $unsigned($unsigned((8'hb1)));
  always
    @(posedge clk) begin
      reg168 <= wire167;
    end
  assign wire169 = (~|wire166[(2'h2):(2'h2)]);
  assign wire170 = wire167[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg171 <= ((~|{$signed(((8'hbb) << wire170)),
              ({wire164, wire164} <<< wire163)}) ?
          $signed($unsigned({(&wire166), (8'ha5)})) : (|(~(7'h44))));
      reg172 <= (|(8'hae));
    end
  assign wire173 = ($unsigned((($signed(wire166) ?
                           (reg172 + wire167) : ((8'hab) >> wire162)) ?
                       ((8'ha9) ^~ $signed(wire167)) : ($signed(wire167) != {wire169,
                           (8'ha4)}))) == (wire164[(3'h5):(3'h5)] <<< ((|((8'hbd) > wire167)) >>> wire164)));
  always
    @(posedge clk) begin
      if ({reg172[(2'h3):(2'h2)]})
        begin
          if (((~|(wire169 ?
              ((8'hb6) ?
                  $unsigned(wire166) : (wire162 < wire166)) : ($unsigned(reg168) ?
                  (8'hbe) : $unsigned(wire166)))) & (wire170[(1'h1):(1'h0)] + wire166[(1'h0):(1'h0)])))
            begin
              reg174 <= reg168[(2'h2):(1'h1)];
              reg175 <= (+(^~$signed(wire167)));
              reg176 <= (wire164 ?
                  (({$signed(wire173)} ?
                      ($signed(wire166) <<< $signed(wire163)) : (&((8'hb7) ?
                          wire162 : wire170))) >> wire163[(4'hc):(1'h1)]) : ($unsigned(wire164) <<< (8'haf)));
              reg177 <= {$signed(($unsigned({reg172}) > {wire166,
                      (reg174 == reg168)})),
                  wire169[(1'h0):(1'h0)]};
              reg178 <= (((((reg174 == wire169) ? (~|wire166) : (+(8'ha4))) ?
                      wire170 : reg168) ?
                  $signed((+{reg175,
                      wire166})) : $signed((reg176[(1'h0):(1'h0)] ?
                      $signed(wire166) : $signed(reg168)))) ^~ (((wire164 * $signed((8'ha7))) ?
                      ({wire170, wire173} ?
                          wire165 : $signed(wire164)) : wire173[(2'h3):(2'h3)]) ?
                  $unsigned($signed(((8'hab) >> (8'h9e)))) : ({(wire163 ?
                              (8'h9c) : reg171),
                          reg172} ?
                      wire165[(2'h3):(2'h2)] : {(reg177 <= reg176),
                          ((7'h40) << wire166)})));
            end
          else
            begin
              reg174 <= $unsigned(wire166[(1'h1):(1'h1)]);
              reg175 <= {{$unsigned((^~(wire167 ? reg168 : reg171)))},
                  {wire165, (|wire164)}};
              reg176 <= $signed(reg175[(2'h2):(2'h2)]);
            end
        end
      else
        begin
          reg174 <= ((($signed((|reg171)) ?
                  (+wire165) : {wire165,
                      reg177[(4'h8):(2'h3)]}) + reg175[(2'h3):(2'h2)]) ?
              $unsigned(wire170[(3'h6):(3'h5)]) : $unsigned({(~wire165[(2'h3):(2'h2)]),
                  $signed({reg175})}));
        end
    end
endmodule

module module145
#(parameter param157 = (^(~(((-(8'hb0)) ? ((8'ha7) == (8'hbb)) : ((8'hb1) ? (8'hb9) : (8'hb6))) < (((8'h9c) >>> (8'hbe)) ? ((8'ha9) ? (8'had) : (8'ha5)) : {(8'hbf)})))), 
parameter param158 = ((param157 - (^~(((8'hb9) ? param157 : param157) ? (param157 > param157) : param157))) != (^~(8'hb4))))
(y, clk, wire149, wire148, wire147, wire146);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire149;
  input wire [(2'h2):(1'h0)] wire148;
  input wire [(5'h10):(1'h0)] wire147;
  input wire signed [(4'ha):(1'h0)] wire146;
  wire signed [(4'he):(1'h0)] wire156;
  wire [(5'h12):(1'h0)] wire153;
  wire [(5'h15):(1'h0)] wire152;
  wire [(4'he):(1'h0)] wire151;
  wire signed [(5'h10):(1'h0)] wire150;
  reg [(5'h15):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg154 = (1'h0);
  assign y = {wire156,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 reg155,
                 reg154,
                 (1'h0)};
  assign wire150 = {(((wire147 >>> ((8'ha7) & wire147)) && (~&$unsigned(wire148))) ?
                           (wire149[(4'h8):(3'h6)] * $signed((wire149 ?
                               wire148 : (8'ha9)))) : wire146),
                       ((&$unsigned((wire146 ?
                           wire147 : wire148))) << $signed($unsigned($unsigned(wire148))))};
  assign wire151 = ((~^($unsigned($signed((8'hac))) && $signed(wire147))) ?
                       wire146[(4'h9):(4'h9)] : (wire147[(4'h8):(4'h8)] ?
                           $signed(({(8'ha4)} ~^ $signed(wire146))) : wire146[(2'h3):(2'h2)]));
  assign wire152 = $signed(($unsigned($signed($unsigned(wire146))) ?
                       wire150[(4'hb):(4'h9)] : ((!(wire147 ?
                               (8'hb7) : wire146)) ?
                           $signed($unsigned(wire149)) : wire147[(4'hc):(3'h7)])));
  assign wire153 = $signed((($unsigned(wire149[(4'h9):(1'h0)]) ?
                       $signed((+wire148)) : wire146[(4'h9):(3'h5)]) <= $unsigned((~|(wire148 <= (8'ha8))))));
  always
    @(posedge clk) begin
      reg154 <= (+{(wire149[(4'he):(1'h1)] ~^ (8'ha0)),
          ((+(wire147 ? wire151 : wire151)) <= wire149)});
      reg155 <= $unsigned(wire150);
    end
  assign wire156 = ((wire150[(5'h10):(4'ha)] <<< {$unsigned((wire150 ?
                           wire147 : wire149)),
                       (-{wire151, reg154})}) | {(({(7'h44)} ?
                           $signed((7'h44)) : $unsigned(wire152)) + (!(wire147 ?
                           (8'hbb) : reg155))),
                       ({reg155} << reg155)});
endmodule

module module114
#(parameter param140 = (~^({(8'haf), {((8'h9e) ? (8'hbe) : (7'h40)), ((8'hb0) ^~ (8'hbb))}} > {((-(8'had)) ? ((8'hb4) | (8'hbc)) : {(8'ha9), (7'h40)}), ({(8'ha2), (8'hb3)} ? (~|(8'hb9)) : (~&(8'ha4)))})), 
parameter param141 = param140)
(y, clk, wire119, wire118, wire117, wire116, wire115);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire119;
  input wire signed [(4'hd):(1'h0)] wire118;
  input wire [(5'h12):(1'h0)] wire117;
  input wire [(4'hc):(1'h0)] wire116;
  input wire signed [(5'h12):(1'h0)] wire115;
  wire signed [(5'h15):(1'h0)] wire131;
  wire signed [(5'h15):(1'h0)] wire130;
  wire signed [(4'hc):(1'h0)] wire129;
  wire signed [(3'h4):(1'h0)] wire128;
  wire [(4'ha):(1'h0)] wire127;
  wire [(5'h15):(1'h0)] wire126;
  wire [(3'h5):(1'h0)] wire124;
  wire signed [(2'h3):(1'h0)] wire123;
  wire signed [(5'h12):(1'h0)] wire122;
  wire signed [(3'h7):(1'h0)] wire121;
  wire signed [(5'h10):(1'h0)] wire120;
  reg signed [(5'h13):(1'h0)] reg139 = (1'h0);
  reg [(2'h3):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg134 = (1'h0);
  reg [(4'h9):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg125 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg125,
                 (1'h0)};
  assign wire120 = ($unsigned(((wire116 || $signed(wire117)) & ((^~wire117) && wire118[(4'hc):(3'h4)]))) ?
                       $signed((~^wire117[(3'h4):(1'h0)])) : (~&wire115[(1'h1):(1'h1)]));
  assign wire121 = $signed({($unsigned({wire118}) < $unsigned((wire119 + wire116)))});
  assign wire122 = ($signed((~$signed((~wire119)))) ?
                       {wire118[(1'h1):(1'h0)],
                           $signed((wire119[(2'h3):(2'h2)] ?
                               $signed((8'hb9)) : (wire115 && wire118)))} : {wire121});
  assign wire123 = ((wire115 ~^ wire121[(3'h6):(2'h3)]) + wire118);
  assign wire124 = (^~$signed((wire119 ?
                       ((wire120 || wire121) ?
                           ((8'hb6) >> (7'h44)) : (!wire116)) : ($signed(wire123) & (wire116 - wire118)))));
  always
    @(posedge clk) begin
      reg125 <= (~&(!(8'hbe)));
    end
  assign wire126 = (wire120[(4'hb):(3'h6)] ?
                       wire119[(4'ha):(4'ha)] : (^~{wire116}));
  assign wire127 = $signed({wire115[(4'hd):(4'hd)]});
  assign wire128 = (((|(8'ha2)) ?
                           (wire118 ?
                               wire119[(3'h7):(1'h0)] : ($unsigned((8'hbb)) ?
                                   (wire115 ? wire120 : wire119) : ((8'hab) ?
                                       wire120 : wire115))) : wire126[(5'h11):(3'h6)]) ?
                       wire116[(2'h3):(1'h0)] : (^~(($signed(wire126) ?
                               (|(8'hac)) : (wire123 ? wire126 : wire123)) ?
                           $signed((^~wire117)) : wire120[(2'h3):(2'h3)])));
  assign wire129 = $signed(({(wire115[(5'h12):(4'hc)] ?
                               $signed(wire120) : (wire119 ?
                                   wire115 : (7'h41))),
                           ($unsigned(reg125) ? $unsigned((7'h44)) : (8'hb7))} ?
                       (wire118 ?
                           (wire124 >> $unsigned(wire115)) : $unsigned($signed(wire126))) : ($signed((wire115 ?
                               wire127 : wire128)) ?
                           wire118[(2'h3):(1'h0)] : wire128[(1'h0):(1'h0)])));
  assign wire130 = wire128;
  assign wire131 = wire124;
  always
    @(posedge clk) begin
      reg132 <= wire129[(2'h3):(1'h0)];
      if (($signed(({wire117[(5'h10):(4'hd)]} ?
          (wire121[(2'h3):(2'h2)] ^~ $unsigned(reg132)) : $unsigned({wire122,
              wire123}))) * (($signed($unsigned(reg125)) ?
          $signed((wire129 * (8'ha6))) : (~&wire116)) ~^ wire115)))
        begin
          reg133 <= (($unsigned($unsigned((wire120 == wire117))) >> $unsigned(wire130)) ?
              wire118 : wire115[(1'h1):(1'h0)]);
          reg134 <= (+(8'hb2));
          reg135 <= (^~(~^(|wire130[(4'hd):(3'h6)])));
          reg136 <= (~|(+wire121[(3'h7):(1'h1)]));
          reg137 <= reg125[(4'hc):(4'hc)];
        end
      else
        begin
          reg133 <= (~|$signed($signed((~^(~|wire128)))));
          if (reg134)
            begin
              reg134 <= (8'hbd);
            end
          else
            begin
              reg134 <= $unsigned($signed((~(wire123 <<< wire126))));
              reg135 <= wire127;
              reg136 <= $unsigned($unsigned(($unsigned({wire120}) ?
                  (wire123[(1'h1):(1'h1)] ~^ (wire120 ~^ wire126)) : ($unsigned(reg134) ?
                      (reg135 || (8'ha2)) : (&wire122)))));
            end
          reg137 <= reg137;
        end
      reg138 <= {wire116};
      reg139 <= ($unsigned($signed(wire115[(2'h3):(1'h0)])) ^ {(reg137[(3'h4):(1'h0)] >> (!(reg136 || wire124))),
          (~&(^(wire119 ? reg137 : wire130)))});
    end
endmodule

module module72
#(parameter param111 = (^((~{(~|(7'h42)), (8'hb3)}) >= {((7'h41) ? (8'hb0) : ((8'hbd) ? (8'hb6) : (8'hb9)))})))
(y, clk, wire77, wire76, wire75, wire74, wire73);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire77;
  input wire [(4'h9):(1'h0)] wire76;
  input wire signed [(4'h9):(1'h0)] wire75;
  input wire signed [(5'h14):(1'h0)] wire74;
  input wire [(4'hd):(1'h0)] wire73;
  wire signed [(4'ha):(1'h0)] wire108;
  wire [(4'hc):(1'h0)] wire107;
  wire [(4'h8):(1'h0)] wire106;
  wire [(3'h7):(1'h0)] wire105;
  wire signed [(3'h4):(1'h0)] wire99;
  wire signed [(3'h6):(1'h0)] wire98;
  wire signed [(3'h4):(1'h0)] wire97;
  wire [(3'h5):(1'h0)] wire96;
  wire signed [(3'h4):(1'h0)] wire82;
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg [(4'h9):(1'h0)] reg109 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg101 = (1'h0);
  reg signed [(4'he):(1'h0)] reg100 = (1'h0);
  reg [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg91 = (1'h0);
  reg [(4'h8):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(5'h10):(1'h0)] reg85 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg81 = (1'h0);
  reg [(4'hd):(1'h0)] reg80 = (1'h0);
  reg [(3'h6):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg78 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire82,
                 reg110,
                 reg109,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg95,
                 reg94,
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
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg78 <= $signed(wire74[(3'h5):(1'h1)]);
      reg79 <= (^wire74);
      if (wire76)
        begin
          reg80 <= $unsigned((7'h44));
        end
      else
        begin
          reg80 <= (|(8'hb9));
          reg81 <= (wire76 & wire75[(1'h1):(1'h1)]);
        end
    end
  assign wire82 = reg81;
  always
    @(posedge clk) begin
      reg83 <= $signed(((&((reg79 == wire82) ?
          wire77[(1'h1):(1'h1)] : (wire76 ?
              wire75 : wire76))) >= (|$unsigned({reg80}))));
      reg84 <= reg79[(2'h3):(1'h0)];
      if ($signed(reg80[(4'hb):(3'h5)]))
        begin
          reg85 <= $signed((reg83 == wire74[(2'h3):(1'h1)]));
          if (((~|(!reg84)) >= ({$unsigned(wire76),
              wire74[(5'h11):(4'hf)]} | (|wire75[(3'h6):(1'h1)]))))
            begin
              reg86 <= (&($unsigned($unsigned(wire74[(3'h4):(1'h0)])) ?
                  $unsigned((~|(wire77 >>> wire82))) : wire75[(1'h0):(1'h0)]));
              reg87 <= $unsigned((~|$signed($unsigned((wire76 ?
                  wire74 : wire82)))));
              reg88 <= reg86;
              reg89 <= (!(($signed((~^wire73)) ?
                      (8'ha5) : $unsigned(reg85[(4'hd):(3'h5)])) ?
                  $signed(reg87[(2'h2):(1'h1)]) : ({wire76} ?
                      (+$signed(reg86)) : (wire76 ? reg79 : $signed(reg79)))));
            end
          else
            begin
              reg86 <= $signed(reg83[(4'hb):(4'h8)]);
              reg87 <= (8'hb0);
              reg88 <= (&(-$signed(reg84[(5'h11):(5'h10)])));
            end
          reg90 <= (reg80[(3'h5):(3'h5)] ?
              $signed((({reg80, wire82} || (reg85 >> (8'hb4))) ?
                  $signed(((8'hba) ? reg89 : wire82)) : {$signed((8'hae)),
                      (7'h43)})) : (wire73[(3'h7):(2'h3)] >>> $signed({(&reg86)})));
        end
      else
        begin
          reg85 <= (reg89[(4'h9):(2'h3)] ?
              wire73 : {(reg84[(2'h2):(1'h0)] ?
                      $unsigned(wire75[(1'h1):(1'h1)]) : $signed({(8'ha5),
                          reg83}))});
          reg86 <= $signed(reg80[(1'h1):(1'h0)]);
        end
      if (($unsigned(((~&$unsigned(reg88)) ?
              (wire74[(4'hb):(4'h9)] ?
                  (~&reg88) : wire76[(3'h5):(1'h0)]) : $signed(reg78))) ?
          {reg79, wire82} : $unsigned({((8'ha3) ~^ ((8'ha9) >> reg88)),
              $unsigned({(8'hb7), reg78})})))
        begin
          reg91 <= {reg87[(2'h3):(2'h2)]};
          reg92 <= ($signed(reg90[(3'h4):(2'h2)]) & $unsigned(((~(&reg91)) - {(reg81 ?
                  reg89 : reg83),
              (reg88 ? reg90 : reg91)})));
          reg93 <= $signed($unsigned((!reg84)));
          reg94 <= $unsigned(($signed($unsigned({reg86, reg84})) ?
              $signed(({reg87} || reg92)) : ($unsigned($unsigned((8'haf))) ?
                  {wire82[(3'h4):(1'h1)]} : reg90[(4'h8):(1'h0)])));
          reg95 <= reg94[(2'h3):(1'h1)];
        end
      else
        begin
          reg91 <= reg89[(5'h10):(3'h7)];
          reg92 <= wire77;
          reg93 <= {$unsigned(reg92[(3'h4):(1'h1)])};
          reg94 <= wire76[(1'h1):(1'h0)];
          reg95 <= (($signed((~&wire77)) | {$unsigned((&reg81)),
              ((reg85 ? reg86 : reg93) < (reg89 || (8'h9d)))}) <= wire75);
        end
    end
  assign wire96 = (^~(((+(^reg79)) ?
                      wire77[(2'h2):(1'h1)] : reg90) * $unsigned(((8'hbc) >= {wire75,
                      wire76}))));
  assign wire97 = $unsigned((^~$unsigned(((&(8'hb3)) ?
                      reg91[(3'h4):(2'h2)] : reg87))));
  assign wire98 = (((reg85 ?
                          {((8'hab) ? wire97 : (8'hb3)),
                              (reg88 <<< reg87)} : reg94[(3'h4):(3'h4)]) * $unsigned($signed($signed(reg81)))) ?
                      (&wire82) : $unsigned($signed(reg92)));
  assign wire99 = ($unsigned((7'h44)) ?
                      {(|$unsigned($signed(reg95))),
                          wire76} : (wire82[(2'h3):(1'h0)] || (reg88 ?
                          {$unsigned(reg93), $unsigned(wire97)} : wire76)));
  always
    @(posedge clk) begin
      if ((&{$signed($signed((|reg92)))}))
        begin
          if ({(+$signed({((8'hbf) * wire98)}))})
            begin
              reg100 <= {(^~{$unsigned($unsigned(reg78)),
                      $unsigned($signed((8'hb6)))}),
                  {{$unsigned((reg80 + wire73)),
                          ((wire82 ? reg91 : reg94) ?
                              reg80[(4'hb):(3'h4)] : $unsigned(wire96))}}};
            end
          else
            begin
              reg100 <= $unsigned(((8'hb1) >>> reg88[(1'h1):(1'h1)]));
            end
          reg101 <= wire99;
        end
      else
        begin
          reg100 <= $signed(reg86);
          reg101 <= reg90[(3'h7):(1'h0)];
          reg102 <= $unsigned(reg84);
          reg103 <= wire99[(2'h2):(2'h2)];
          reg104 <= ((reg102 ? (^~$unsigned(wire98[(1'h1):(1'h1)])) : wire75) ?
              reg90[(1'h0):(1'h0)] : (({reg92[(3'h5):(2'h3)]} ?
                      $unsigned(reg88) : ($unsigned(wire96) <= $signed(reg83))) ?
                  $unsigned($signed(((8'ha6) >> reg93))) : wire74));
        end
    end
  assign wire105 = $signed((reg87[(2'h2):(1'h0)] ^ {$unsigned(wire77[(2'h2):(1'h1)]),
                       ($signed(reg91) << (wire73 ^~ reg90))}));
  assign wire106 = $unsigned($signed((~|wire99)));
  assign wire107 = $signed(wire73[(2'h2):(1'h1)]);
  assign wire108 = reg89[(4'hd):(2'h3)];
  always
    @(posedge clk) begin
      reg109 <= ($unsigned((($signed(reg85) ? $signed((8'ha8)) : {wire105}) ?
          (8'ha4) : $signed(reg103))) < {$unsigned((^$unsigned(wire96)))});
      reg110 <= (($signed((8'ha9)) ?
          ($unsigned((wire108 ?
              reg93 : reg92)) & $unsigned(wire105[(3'h7):(3'h5)])) : $signed(($unsigned(wire98) >= reg101))) != reg94);
    end
endmodule

module module31
#(parameter param47 = ((({((8'ha8) <<< (7'h44)), ((7'h44) ? (8'hba) : (7'h42))} <= (~|(8'ha4))) == (^(((8'ha7) ? (8'ha9) : (8'ha4)) << ((7'h44) ? (8'ha0) : (8'hb1))))) <= (~|((((7'h43) != (8'hac)) ? ((8'hb4) >>> (8'hb2)) : (+(8'hbc))) ? (((8'hb3) ? (8'hba) : (8'h9d)) && ((8'hab) ? (8'ha8) : (8'had))) : {(^~(8'ha7)), (-(8'hac))}))))
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire36;
  input wire signed [(3'h6):(1'h0)] wire35;
  input wire signed [(4'hd):(1'h0)] wire34;
  input wire signed [(3'h7):(1'h0)] wire33;
  input wire [(5'h13):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire37;
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 (1'h0)};
  assign wire37 = ($unsigned(((wire32 ?
                          (wire34 ?
                              (8'hae) : (8'hb9)) : wire32[(1'h0):(1'h0)]) == wire36)) ?
                      (wire36 ?
                          $signed(((8'hac) << (wire33 ?
                              wire35 : wire34))) : wire36[(1'h0):(1'h0)]) : wire36);
  assign wire38 = $signed({(wire35[(3'h4):(1'h1)] >= $signed((wire33 * wire33))),
                      $signed((wire35[(3'h5):(1'h1)] ?
                          (^~(8'hb8)) : $unsigned(wire34)))});
  assign wire39 = $unsigned($signed((((wire38 == wire34) >= {(8'hb9)}) ?
                      ($signed(wire34) ?
                          $unsigned(wire38) : $signed(wire33)) : $signed((wire38 ?
                          (8'h9e) : (8'ha2))))));
  assign wire40 = (wire34[(3'h6):(3'h4)] ?
                      (+$unsigned({wire34,
                          wire38[(3'h4):(2'h3)]})) : $unsigned((~(|(^wire34)))));
  assign wire41 = wire36[(3'h4):(2'h3)];
  assign wire42 = wire35[(3'h4):(3'h4)];
  assign wire43 = $unsigned(wire42[(4'ha):(2'h2)]);
  assign wire44 = ($unsigned(wire40[(1'h1):(1'h1)]) || wire42);
  assign wire45 = wire42;
  assign wire46 = ((wire39[(1'h0):(1'h0)] + $signed(wire42[(4'hf):(4'hf)])) ^ {wire45});
endmodule
