module top
#(parameter param83 = {((~(((8'ha3) ? (8'ha5) : (8'hb3)) ? {(8'hb9)} : {(8'hab)})) >= ((((8'hac) < (8'hb9)) ? ((8'hab) ~^ (8'hb6)) : {(7'h44), (8'hae)}) & (|((8'ha0) >= (7'h42))))), {((+{(8'hbc), (8'ha6)}) <<< (|(+(8'hb4))))}})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1be):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire82;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire31;
  wire signed [(5'h12):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire80;
  reg [(4'he):(1'h0)] reg4 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  assign y = {wire82,
                 wire5,
                 wire6,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire33,
                 wire34,
                 wire80,
                 reg4,
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
                 reg32,
                 reg35,
                 reg36,
                 reg37,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= {wire2[(4'hd):(4'ha)], wire3[(1'h1):(1'h1)]};
    end
  assign wire5 = $unsigned({reg4, wire3[(1'h0):(1'h0)]});
  assign wire6 = (wire2 ? wire3[(2'h3):(2'h3)] : wire0[(4'hd):(4'h9)]);
  always
    @(posedge clk) begin
      if ((wire0[(4'ha):(3'h5)] | (^~(wire3 ?
          wire6[(3'h7):(3'h5)] : wire3[(3'h4):(2'h3)]))))
        begin
          if ($unsigned(($signed(wire2) ?
              (^wire3[(3'h4):(1'h1)]) : (((wire5 ? wire3 : wire6) ?
                  (-wire6) : reg4) <<< reg4[(4'hd):(3'h7)]))))
            begin
              reg7 <= (~^wire6[(5'h14):(4'hd)]);
            end
          else
            begin
              reg7 <= $signed((~^$signed(wire5)));
              reg8 <= (!(~&wire0[(1'h1):(1'h1)]));
              reg9 <= reg4;
              reg10 <= $signed({reg8, reg9});
            end
          reg11 <= (wire5[(2'h3):(1'h1)] ? reg9 : $signed($unsigned(wire2)));
          reg12 <= {$unsigned(($unsigned((wire3 ?
                  reg11 : reg9)) | $unsigned(wire3[(1'h1):(1'h1)])))};
          reg13 <= {(reg12[(2'h3):(2'h3)] >> $signed((^reg9))), (~(8'hba))};
        end
      else
        begin
          reg7 <= wire6;
        end
      if (reg12[(2'h2):(2'h2)])
        begin
          if (((($signed($signed(wire2)) + wire1[(1'h1):(1'h0)]) ?
                  (({wire0} ?
                      (reg4 == (8'h9d)) : (8'hb1)) <= (8'h9e)) : $signed((^reg8))) ?
              wire3 : (!$signed((~^(reg8 & wire5))))))
            begin
              reg14 <= $unsigned($unsigned($signed($unsigned((reg7 < reg13)))));
              reg15 <= (^~((wire3 ? $signed($signed(reg9)) : (&(8'hbe))) ?
                  reg13 : (!reg4)));
              reg16 <= $signed(($unsigned(wire3) && {(((8'hb1) ?
                      reg11 : reg10) || wire6[(5'h10):(4'hb)]),
                  {(8'hb0), {(8'hbf), reg14}}}));
            end
          else
            begin
              reg14 <= {(~|(reg10[(4'ha):(3'h6)] ^ {(reg15 < reg4),
                      (reg14 | (8'hbb))})),
                  {reg15}};
              reg15 <= reg11;
            end
          reg17 <= (~|$unsigned((($unsigned(wire1) >= (^reg15)) ?
              (reg12[(4'h8):(2'h2)] ?
                  $unsigned(reg12) : reg15) : $unsigned((reg4 ?
                  reg11 : reg13)))));
          reg18 <= reg14;
        end
      else
        begin
          reg14 <= (~|reg16);
        end
      if ($signed(((^(reg8[(5'h10):(4'hc)] ~^ (|reg14))) << (~&$unsigned((reg11 < reg12))))))
        begin
          reg19 <= (~^((reg18[(4'h9):(4'h8)] ?
              (~(wire5 - reg9)) : $unsigned($unsigned(reg17))) ^ $unsigned({(wire5 ?
                  wire2 : reg7),
              wire2})));
          reg20 <= (&wire2);
          reg21 <= (^{($signed(((8'h9d) ? reg7 : reg17)) ~^ $signed((reg18 ?
                  reg7 : reg18))),
              ((reg16[(1'h1):(1'h1)] == (reg19 || reg12)) ?
                  {reg10, ((8'hb2) ? reg9 : reg16)} : $signed(wire3))});
          reg22 <= wire1;
          reg23 <= $signed(reg20[(5'h10):(3'h5)]);
        end
      else
        begin
          reg19 <= (reg21[(4'hd):(2'h3)] < ((~^reg21[(5'h11):(4'h9)]) == reg22));
        end
      if ($signed(((&reg15) ?
          $unsigned(($signed((8'hbe)) > (&reg16))) : $signed($unsigned(reg13)))))
        begin
          reg24 <= (reg19[(4'hc):(4'h8)] ?
              (-(wire5 ?
                  $signed(reg19[(4'he):(4'hd)]) : $signed(wire5))) : reg12[(2'h3):(1'h0)]);
          reg25 <= reg16;
        end
      else
        begin
          reg24 <= $signed(($unsigned(reg24) >>> $signed((reg4[(4'ha):(4'h9)] * (~&reg18)))));
          reg25 <= (~|($unsigned((^$signed(reg25))) | reg18));
          reg26 <= $signed((($unsigned(reg8[(3'h4):(2'h2)]) <= (reg13 ?
                  {wire6, wire0} : {(8'hb3), reg24})) ?
              reg23[(1'h1):(1'h0)] : $signed(reg23)));
        end
      reg27 <= $signed(((~|$unsigned((reg14 ?
          reg11 : (8'hb4)))) * $signed($unsigned($signed(reg9)))));
    end
  assign wire28 = (~^$unsigned((~^reg4)));
  assign wire29 = ($signed({(reg20[(5'h12):(1'h1)] ?
                          reg9 : (reg4 ? reg13 : reg15))}) << (8'hb5));
  assign wire30 = $unsigned((~|$signed($signed((reg12 || wire6)))));
  assign wire31 = (reg13 ? $signed(wire1) : ((~&reg26) > (8'hab)));
  always
    @(posedge clk) begin
      reg32 <= ($signed(reg22[(5'h10):(4'ha)]) < wire28);
    end
  assign wire33 = (reg18[(4'h9):(1'h0)] ?
                      (reg7 ?
                          wire28 : reg7) : $signed((-reg27[(4'ha):(3'h6)])));
  assign wire34 = reg15;
  always
    @(posedge clk) begin
      reg35 <= wire34;
      reg36 <= {({(wire34[(1'h1):(1'h0)] != wire29),
              $signed(reg21[(3'h5):(3'h4)])} ^ reg4)};
      reg37 <= (reg24[(2'h2):(2'h2)] <<< $signed((wire1[(2'h2):(1'h0)] ?
          reg4[(2'h3):(2'h2)] : reg25)));
    end
  module38 #() modinst81 (wire80, clk, wire3, reg15, reg16, reg8);
  assign wire82 = $unsigned(($unsigned(reg4[(4'ha):(3'h5)]) + (~&wire0[(5'h13):(2'h3)])));
endmodule

module module38
#(parameter param79 = ((~(((~&(8'ha9)) ? ((8'haa) ? (8'ha3) : (8'hb6)) : {(8'ha0)}) || {(~(8'hbf)), (~|(8'ha3))})) > (~|(((&(8'haf)) & ((7'h43) <<< (8'hbb))) > ((~(8'hbb)) ? ((7'h42) <<< (8'ha1)) : ((8'hb9) || (8'h9e)))))))
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire42;
  input wire [(3'h4):(1'h0)] wire41;
  input wire signed [(2'h3):(1'h0)] wire40;
  input wire signed [(3'h4):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire77;
  wire signed [(3'h7):(1'h0)] wire76;
  wire signed [(4'hd):(1'h0)] wire75;
  wire signed [(2'h3):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  wire [(3'h4):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire67;
  wire [(2'h3):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire65;
  wire [(3'h7):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire63;
  wire [(3'h5):(1'h0)] wire62;
  wire signed [(4'hf):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire59;
  wire [(3'h4):(1'h0)] wire46;
  wire signed [(4'hb):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  wire [(4'hf):(1'h0)] wire43;
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 reg72,
                 reg71,
                 reg70,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire43 = wire41[(2'h2):(2'h2)];
  assign wire44 = wire43[(4'hd):(3'h4)];
  assign wire45 = (wire41[(3'h4):(2'h3)] - $signed(wire44[(4'ha):(3'h5)]));
  assign wire46 = $signed($signed((|(~|(|wire39)))));
  always
    @(posedge clk) begin
      reg47 <= (({wire40, $unsigned(wire45)} ?
              $signed(wire40) : ($unsigned({(8'ha4), wire41}) ?
                  {(^~wire46),
                      (wire40 ? (8'ha0) : wire42)} : (wire42[(4'hd):(4'h9)] ?
                      wire40[(2'h2):(1'h0)] : (wire42 <<< wire43)))) ?
          wire43 : ($unsigned(wire41) ?
              (wire39[(1'h1):(1'h1)] < (wire42[(2'h3):(2'h3)] ~^ wire40[(2'h3):(2'h3)])) : (wire42[(5'h11):(5'h11)] >> wire46[(3'h4):(1'h0)])));
      reg48 <= $unsigned(wire44);
      reg49 <= $unsigned({wire43});
      reg50 <= (wire40[(1'h1):(1'h0)] <= (wire41 >= wire43[(1'h0):(1'h0)]));
      if (wire41[(3'h4):(2'h2)])
        begin
          if ((8'hb0))
            begin
              reg51 <= wire39[(2'h3):(1'h0)];
              reg52 <= (wire41[(3'h4):(2'h2)] ?
                  reg50 : (^~wire44[(2'h2):(1'h1)]));
            end
          else
            begin
              reg51 <= wire40[(2'h2):(2'h2)];
              reg52 <= wire43;
              reg53 <= (^{$signed((~^{reg51}))});
              reg54 <= $unsigned((reg53[(4'hb):(4'hb)] ?
                  ({(wire39 || (7'h40)), reg47} ?
                      (!(!reg52)) : $signed((reg53 || wire45))) : wire45[(3'h7):(2'h3)]));
            end
          reg55 <= reg54;
          reg56 <= ({({$signed(wire39)} != ($unsigned(reg49) > (&reg55))),
              (~|(~|$unsigned(wire45)))} != $signed($unsigned($signed((reg55 << (8'ha8))))));
          if (($signed(reg52) ? wire39 : (~&{reg54})))
            begin
              reg57 <= $signed(($signed(((8'hb0) >> (7'h42))) != reg54));
            end
          else
            begin
              reg57 <= (^~wire40);
              reg58 <= (((~&$signed((reg51 < wire40))) ?
                  $unsigned(($signed(reg49) ?
                      (^~wire44) : ((8'hbb) >= reg53))) : (reg55[(1'h1):(1'h0)] ?
                      wire46[(1'h0):(1'h0)] : (~wire39[(3'h4):(2'h3)]))) <<< (~^(-(reg48[(3'h7):(1'h1)] ?
                  reg56 : $signed(reg51)))));
            end
        end
      else
        begin
          reg51 <= $signed({{(~^wire39)}, reg48});
          reg52 <= reg51[(4'hb):(1'h1)];
          reg53 <= $unsigned((8'hbd));
          reg54 <= (!(~^wire43));
        end
    end
  assign wire59 = (-$signed({$unsigned(reg54), $unsigned(reg55)}));
  assign wire60 = reg52;
  assign wire61 = reg56;
  assign wire62 = $unsigned((&$signed(((reg49 ? wire45 : reg54) ^~ reg47))));
  assign wire63 = $signed({reg55, reg53[(3'h5):(1'h1)]});
  assign wire64 = wire41;
  assign wire65 = {(wire44[(4'ha):(2'h2)] ? wire63 : wire44[(4'hb):(3'h7)])};
  assign wire66 = wire43[(1'h0):(1'h0)];
  assign wire67 = reg57[(2'h2):(1'h0)];
  assign wire68 = $unsigned(wire66);
  assign wire69 = (wire45 ? wire46[(1'h1):(1'h1)] : reg56);
  always
    @(posedge clk) begin
      reg70 <= (~|$unsigned((wire45[(1'h1):(1'h0)] ? wire67 : (^(^wire65)))));
      reg71 <= (wire64 >= $unsigned($unsigned((+wire60))));
      reg72 <= reg47[(4'hd):(4'hb)];
    end
  assign wire73 = {(~&($unsigned($signed(wire63)) - $unsigned((!reg56)))),
                      wire66[(2'h2):(1'h1)]};
  assign wire74 = reg56[(2'h2):(1'h0)];
  assign wire75 = reg70;
  assign wire76 = $unsigned(wire45[(3'h7):(3'h6)]);
  assign wire77 = (({({wire76} ? (reg48 ^~ wire61) : (+wire59))} ?
                          reg55 : ((reg52 | (reg72 | wire41)) ?
                              wire64 : {reg52[(1'h1):(1'h1)],
                                  ((8'ha5) ? reg50 : wire66)})) ?
                      ((+(~reg57[(3'h5):(3'h4)])) + $unsigned(reg54[(4'ha):(4'h8)])) : ((wire61 ?
                              (reg47 ? reg55 : (wire76 & wire62)) : ((wire42 ?
                                      wire45 : wire60) ?
                                  wire63 : reg56)) ?
                          ($signed((^(8'hb0))) ?
                              ($signed(wire67) ^~ {(8'hb8),
                                  reg50}) : {(~|reg53),
                                  $unsigned(wire67)}) : $signed(reg57[(3'h7):(2'h3)])));
  assign wire78 = $unsigned(wire73);
endmodule
