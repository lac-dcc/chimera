module top
#(parameter param103 = (((((~(8'hbd)) ? {(8'ha4)} : ((8'had) ? (8'h9c) : (8'ha1))) - (+((8'hb0) && (8'ha8)))) ? ((((8'ha8) ^~ (8'haa)) ? ((8'hbf) > (8'ha7)) : (8'ha5)) ? ({(8'had)} >= {(8'hbf), (8'ha9)}) : ((^(7'h41)) < ((8'hb0) == (8'hbd)))) : ((((8'hab) <<< (8'h9f)) && (~(8'hb7))) ~^ (((8'ha9) ? (8'hb0) : (8'ha5)) ? ((8'h9c) ? (8'ha5) : (8'h9c)) : ((8'ha4) <<< (8'hb8))))) | (((^~(~|(8'ha4))) != ({(7'h41)} ? {(8'hb5), (8'hbe)} : {(8'hb2), (8'ha7)})) ? ((((8'hac) & (8'had)) ? (!(8'hb3)) : ((8'hb7) ? (8'had) : (8'h9d))) <= (7'h44)) : (8'haa))), 
parameter param104 = (-{param103, {{{(8'hbf)}}, ((-param103) >= (param103 ? param103 : param103))}}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire102;
  wire signed [(4'h9):(1'h0)] wire100;
  wire [(4'h8):(1'h0)] wire28;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  assign y = {wire102,
                 wire100,
                 wire28,
                 wire7,
                 wire6,
                 wire5,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
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
                 (1'h0)};
  assign wire5 = ($signed((|(7'h44))) > {(^{(wire4 ? wire0 : (8'hae)),
                         {wire4}})});
  assign wire6 = $signed({wire5[(4'ha):(3'h4)],
                     ($unsigned((wire5 ? wire3 : wire0)) ?
                         (wire3 ^~ {wire1,
                             wire5}) : $unsigned($signed(wire4)))});
  assign wire7 = $unsigned($unsigned(wire5[(3'h4):(1'h0)]));
  always
    @(posedge clk) begin
      reg8 <= wire0;
      reg9 <= wire7;
      reg10 <= $signed(($signed(wire6) ?
          (^~wire1[(1'h0):(1'h0)]) : ((wire3[(3'h5):(3'h4)] && $unsigned(reg9)) ?
              (wire5 * (reg9 ? reg8 : wire3)) : (|reg8[(2'h3):(2'h2)]))));
      reg11 <= (wire0 ? (wire5 < wire4[(1'h0):(1'h0)]) : wire4);
      if (reg11[(4'h8):(2'h3)])
        begin
          reg12 <= ($signed(wire3) <<< wire5[(1'h0):(1'h0)]);
          if ($signed($signed((|(~|$unsigned(wire0))))))
            begin
              reg13 <= ({($signed(reg10[(4'h9):(1'h1)]) ?
                      $unsigned($signed(wire4)) : $unsigned((~|(8'hb8))))} <= reg8);
              reg14 <= $signed((7'h42));
              reg15 <= $unsigned(($signed(wire5[(4'he):(2'h2)]) ^ (+reg13[(4'hc):(3'h5)])));
              reg16 <= $signed($unsigned(reg12));
            end
          else
            begin
              reg13 <= $signed(reg11[(1'h1):(1'h0)]);
            end
          if ((!((~|(reg12 ?
              {(7'h40),
                  (8'hbc)} : (-reg15))) ^ $unsigned($unsigned($unsigned((8'hbb)))))))
            begin
              reg17 <= reg11;
              reg18 <= (!((~^$unsigned((~reg15))) ^ $unsigned(wire3[(3'h7):(3'h4)])));
              reg19 <= wire2;
              reg20 <= $unsigned(($signed(wire4[(4'h9):(4'h9)]) || (|reg16)));
              reg21 <= {reg12};
            end
          else
            begin
              reg17 <= $signed(reg21[(4'h9):(4'h8)]);
              reg18 <= wire1[(1'h0):(1'h0)];
            end
          reg22 <= reg11[(3'h4):(2'h2)];
          if ((8'hbf))
            begin
              reg23 <= (~|(8'h9d));
              reg24 <= (wire4[(4'h8):(2'h2)] ?
                  ({$unsigned(reg18), $unsigned($signed(wire5))} ?
                      {((wire4 | reg14) == (|reg17))} : ($unsigned($unsigned(reg13)) ?
                          ((reg18 + reg9) ?
                              $signed(wire2) : (reg10 >= reg18)) : wire5[(4'hf):(1'h1)])) : $unsigned({$unsigned(((8'hb9) ?
                          wire1 : reg10)),
                      reg22[(4'hb):(1'h0)]}));
              reg25 <= {$signed(reg11[(4'he):(1'h0)])};
            end
          else
            begin
              reg23 <= (+(~&(reg23 ?
                  $signed($unsigned((7'h41))) : $unsigned({reg13}))));
              reg24 <= (wire5 | ((8'hbc) ? reg18 : reg14[(3'h7):(2'h3)]));
              reg25 <= (!$signed($signed(wire4)));
              reg26 <= wire0[(1'h1):(1'h1)];
              reg27 <= {$signed((((8'hae) ?
                      (reg25 >>> (8'ha8)) : $unsigned(reg26)) ^~ (8'hb0)))};
            end
        end
      else
        begin
          reg12 <= (($signed($unsigned((reg21 << reg26))) | {((wire3 ?
                  wire0 : (8'ha5)) >>> reg14)}) < $signed(reg19));
        end
    end
  assign wire28 = wire2;
  module29 #() modinst101 (wire100, clk, reg9, reg10, reg14, reg16);
  assign wire102 = reg23[(3'h5):(3'h4)];
endmodule

module module29
#(parameter param99 = (((-(((8'hbe) <= (8'hbb)) ? (&(8'hb5)) : ((7'h42) ? (8'hba) : (8'haf)))) >>> ((((8'hb5) ? (8'hb8) : (8'ha4)) ? ((8'h9d) == (8'h9e)) : (|(8'ha8))) ? (~&((8'hbb) - (8'hbd))) : {(8'ha6)})) >> {((-(~(8'ha6))) ? {((8'hb7) ? (8'hbc) : (8'hb4))} : ((!(8'hac)) >> (8'hbd))), ({((8'hbb) >= (8'hb6))} ? (8'hb4) : (((8'hac) & (8'hae)) <<< ((7'h44) | (8'hb4))))}))
(y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire33;
  input wire signed [(5'h14):(1'h0)] wire32;
  input wire [(5'h15):(1'h0)] wire31;
  input wire [(3'h7):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire98;
  wire signed [(4'he):(1'h0)] wire97;
  wire signed [(5'h10):(1'h0)] wire96;
  wire signed [(4'h8):(1'h0)] wire95;
  wire [(3'h5):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire90;
  wire [(5'h14):(1'h0)] wire89;
  wire [(5'h14):(1'h0)] wire88;
  wire signed [(4'hd):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire35;
  wire signed [(3'h7):(1'h0)] wire34;
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg91 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire90,
                 wire89,
                 wire88,
                 wire86,
                 wire35,
                 wire34,
                 reg93,
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire34 = (~|wire32[(2'h3):(2'h3)]);
  assign wire35 = (7'h44);
  module36 #() modinst87 (.wire40(wire34), .clk(clk), .wire38(wire32), .y(wire86), .wire37(wire35), .wire39(wire31));
  assign wire88 = (8'hb9);
  assign wire89 = (^(^{(((8'ha4) ? wire32 : wire86) && (wire88 <<< (8'hb0)))}));
  assign wire90 = {wire88};
  always
    @(posedge clk) begin
      reg91 <= (^((((wire89 | (7'h44)) ? (wire31 >>> wire32) : {(8'hb9)}) ?
              wire90[(3'h7):(3'h5)] : wire31) ?
          wire88[(5'h12):(3'h4)] : wire30));
      reg92 <= ($unsigned({{(wire33 >>> wire34)},
          $unsigned((wire31 == wire88))}) >> (wire86 ?
          $unsigned((+(-wire31))) : (8'hbd)));
      reg93 <= (($signed((wire31[(5'h13):(4'hf)] & {wire34})) >= reg91[(1'h1):(1'h1)]) ^~ $signed(wire31));
    end
  assign wire94 = wire32;
  assign wire95 = wire34[(3'h6):(1'h1)];
  assign wire96 = wire31[(2'h2):(1'h0)];
  assign wire97 = $signed((~|((-(reg92 ? wire30 : wire33)) ?
                      $signed(wire30) : $signed($signed(wire88)))));
  assign wire98 = {((wire96 ?
                          ((wire86 * wire89) ?
                              (~|(7'h40)) : (!wire89)) : ($signed(wire88) ?
                              $signed(wire33) : (|wire86))) + $unsigned($signed((~&reg93)))),
                      wire30[(2'h3):(1'h1)]};
endmodule

module module36
#(parameter param85 = (~&(-((((7'h43) <= (7'h41)) ? ((8'had) ? (8'hb3) : (8'ha0)) : ((8'h9e) && (8'ha9))) ^~ (~|(!(7'h42)))))))
(y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h1f5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire40;
  input wire [(5'h15):(1'h0)] wire39;
  input wire signed [(5'h14):(1'h0)] wire38;
  input wire [(2'h3):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire84;
  wire [(3'h4):(1'h0)] wire83;
  wire signed [(2'h2):(1'h0)] wire82;
  wire [(5'h10):(1'h0)] wire81;
  wire [(4'ha):(1'h0)] wire80;
  wire [(3'h5):(1'h0)] wire79;
  wire signed [(4'hc):(1'h0)] wire78;
  wire [(3'h5):(1'h0)] wire77;
  wire [(5'h14):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire42;
  wire signed [(5'h13):(1'h0)] wire41;
  reg [(5'h11):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg69 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 reg76,
                 reg75,
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
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
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
                 (1'h0)};
  assign wire41 = $unsigned(((7'h44) || ($unsigned($unsigned(wire38)) ?
                      wire37[(1'h0):(1'h0)] : wire40)));
  assign wire42 = (($unsigned(wire39) ?
                          $signed(wire40) : (!(~&$signed(wire40)))) ?
                      ($signed(wire38[(3'h7):(1'h0)]) < $signed(wire40)) : {{(+$signed(wire40)),
                              wire37},
                          $signed(((~&wire37) ?
                              wire37[(2'h3):(1'h0)] : {wire37, wire38}))});
  assign wire43 = $signed($signed(wire41));
  assign wire44 = $signed(wire40);
  assign wire45 = $signed(wire38[(5'h13):(4'he)]);
  assign wire46 = wire37;
  assign wire47 = (wire40 <= wire44[(4'h9):(1'h1)]);
  assign wire48 = (~&(wire45[(3'h4):(3'h4)] <<< (((wire39 | wire45) << wire40) ?
                      wire46 : $unsigned(wire38))));
  always
    @(posedge clk) begin
      if (wire40[(1'h0):(1'h0)])
        begin
          reg49 <= (wire38 >> ((&((wire40 ? wire37 : wire46) ?
              $signed(wire37) : {(8'had)})) <= $signed(wire41)));
        end
      else
        begin
          reg49 <= wire40[(3'h4):(3'h4)];
          if ($signed(({wire43[(4'h8):(3'h5)]} ?
              {$unsigned(wire37),
                  wire42[(4'hd):(2'h3)]} : $signed((~&$unsigned(wire44))))))
            begin
              reg50 <= ($unsigned((((wire39 - wire47) ?
                  $signed(wire39) : {wire43}) - (~|(-wire44)))) >> $signed(wire44[(4'h8):(3'h4)]));
              reg51 <= (wire41 >>> $unsigned(($signed(((8'ha6) - wire41)) <= $unsigned((8'hac)))));
              reg52 <= $signed($unsigned(wire44));
              reg53 <= (reg51[(3'h4):(1'h0)] ? (~^wire42) : {$signed(wire39)});
              reg54 <= ($signed((((~^wire48) ?
                  $unsigned(wire42) : $signed(reg53)) >> wire40[(3'h5):(2'h3)])) + $signed(wire38[(4'h9):(3'h6)]));
            end
          else
            begin
              reg50 <= {wire44};
              reg51 <= reg51[(1'h1):(1'h0)];
              reg52 <= (|$unsigned(wire40[(2'h3):(1'h1)]));
              reg53 <= (+((wire48[(3'h4):(2'h2)] ?
                      $unsigned($unsigned(reg50)) : $unsigned(reg51[(3'h4):(1'h0)])) ?
                  ((~&(wire48 ? wire43 : reg51)) ?
                      wire45 : $signed($unsigned(wire47))) : (8'h9d)));
            end
          reg55 <= {(-$unsigned(((wire44 <= reg51) ?
                  ((7'h42) ? (8'hac) : reg52) : wire37[(1'h0):(1'h0)])))};
          reg56 <= $signed(((reg51 ?
              {$unsigned(wire42),
                  (wire38 ? wire43 : wire44)} : ($signed(wire42) ?
                  $signed(reg54) : $signed(wire38))) || (reg49 ?
              reg52[(1'h0):(1'h0)] : ($unsigned(wire43) | reg54))));
        end
      reg57 <= (($signed(((wire48 ? reg56 : reg54) ?
              $unsigned(wire39) : (wire38 != (8'ha3)))) - wire43[(3'h6):(2'h3)]) ?
          (((+wire48[(2'h3):(2'h2)]) >= (-wire45)) >= wire48[(4'hc):(4'h9)]) : (wire42[(1'h1):(1'h0)] || ($signed($signed(reg49)) ?
              (^wire45) : $signed(((8'hb9) * wire47)))));
    end
  always
    @(posedge clk) begin
      reg58 <= (&(~&(({wire40} <= (wire37 ^ reg49)) ?
          $signed((|(8'haa))) : reg55[(3'h5):(2'h2)])));
      if ({(~&$unsigned(wire47[(4'hb):(1'h0)]))})
        begin
          reg59 <= $unsigned($unsigned($signed((~|(reg56 ? reg50 : reg51)))));
          reg60 <= reg59[(3'h6):(3'h6)];
          reg61 <= $unsigned((~&$signed(((wire47 ? wire44 : (8'hb0)) ?
              $unsigned(reg52) : (wire38 ? wire44 : (8'hbc))))));
        end
      else
        begin
          reg59 <= $signed((($unsigned($signed((8'hb3))) ^~ wire37[(2'h3):(1'h1)]) ?
              (wire44 ~^ (^~(wire45 ?
                  (7'h44) : (8'h9d)))) : (reg52[(1'h1):(1'h0)] >= $unsigned($signed(wire41)))));
          reg60 <= $unsigned(reg58);
          reg61 <= $signed(wire40);
          reg62 <= (wire44 <<< reg56[(4'h9):(4'h9)]);
        end
      reg63 <= $unsigned((~$signed(wire46[(5'h11):(2'h2)])));
      if ({reg54[(3'h6):(3'h5)],
          $signed(($signed((8'h9f)) ?
              ((reg54 ? wire47 : wire44) == (reg60 ?
                  wire47 : reg51)) : reg62))})
        begin
          reg64 <= (reg53 - (|($unsigned((!(8'hb1))) ?
              (~^wire41) : wire46[(4'hb):(4'ha)])));
          reg65 <= ($unsigned($unsigned((8'ha3))) ?
              (~{{(7'h40)}, $signed(wire45)}) : wire48[(3'h5):(2'h2)]);
          reg66 <= $signed(reg65);
          reg67 <= reg49;
        end
      else
        begin
          reg64 <= $signed({($unsigned((reg64 && reg50)) > $unsigned((reg62 + wire45))),
              reg65[(1'h0):(1'h0)]});
          reg65 <= $signed(((|($unsigned(wire47) ?
                  {reg60} : $unsigned(wire40))) ?
              wire41 : $signed($signed(reg64))));
          reg66 <= (|{(~reg61[(4'hb):(4'hb)]),
              (((reg57 + wire47) < wire37) > (reg54 ?
                  (reg54 ? reg54 : reg60) : (reg54 ? (8'hb6) : wire38)))});
          if ($signed((($signed($unsigned(wire45)) - $signed($signed((8'ha1)))) <= $unsigned(wire41))))
            begin
              reg67 <= {{((~^((7'h40) ? wire40 : wire41)) + $signed((wire37 ?
                          wire47 : (8'hbc))))},
                  wire45[(2'h3):(1'h1)]};
              reg68 <= reg66;
              reg69 <= (wire43 ?
                  ($signed({{reg59, wire47}, ((8'h9d) || reg55)}) ?
                      $signed($unsigned(((8'ha8) != reg64))) : $unsigned($unsigned(((8'ha4) & wire38)))) : reg54);
              reg70 <= (|{(reg57[(3'h6):(2'h3)] ?
                      reg61[(4'ha):(2'h2)] : (^{wire37})),
                  wire48[(5'h11):(4'h9)]});
            end
          else
            begin
              reg67 <= (&$signed(((^(!reg57)) ?
                  (~&(reg54 <<< wire40)) : (7'h40))));
              reg68 <= (8'hb3);
            end
          reg71 <= wire40[(2'h2):(2'h2)];
        end
      reg72 <= reg59[(2'h2):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg73 <= $unsigned((^~$signed($unsigned(reg60[(2'h2):(1'h0)]))));
      reg74 <= ({$signed(((reg69 > (8'ha2)) ?
              $unsigned(reg50) : reg51[(1'h1):(1'h1)]))} | $signed(reg70[(1'h0):(1'h0)]));
      reg75 <= reg50;
      reg76 <= $unsigned((reg53 >> (((reg57 ? reg60 : (8'hae)) ?
              (wire37 || reg53) : $signed((8'ha5))) ?
          (reg72[(1'h1):(1'h0)] * $unsigned(wire44)) : $signed(reg62))));
    end
  assign wire77 = ($unsigned(($unsigned($signed(wire41)) ?
                      reg58 : $unsigned($unsigned(reg62)))) >>> (~^$signed($signed($signed(reg51)))));
  assign wire78 = $unsigned(($unsigned(((reg50 & reg66) >> $unsigned(reg72))) ?
                      (reg61[(3'h5):(1'h0)] ?
                          $signed(reg74) : reg54[(4'he):(4'h8)]) : ((^~(reg60 ?
                              reg57 : (7'h43))) ?
                          (8'hbc) : reg70[(1'h1):(1'h1)])));
  assign wire79 = ((8'hb1) << reg64[(3'h5):(2'h2)]);
  assign wire80 = {$unsigned($unsigned(($signed(reg56) ? (-wire79) : wire39))),
                      $signed({$signed($unsigned(reg69)),
                          ($unsigned(reg67) ? reg51 : (~|wire45))})};
  assign wire81 = (8'hb8);
  assign wire82 = reg53[(2'h2):(1'h0)];
  assign wire83 = ((|reg63[(4'hb):(3'h6)]) ?
                      ((-((wire42 ? (8'ha8) : reg69) ?
                              {reg74} : $unsigned((8'hba)))) ?
                          wire79 : ($unsigned(wire37[(1'h1):(1'h1)]) ~^ reg64[(4'hc):(3'h4)])) : reg62[(4'h8):(3'h4)]);
  assign wire84 = (!($unsigned((8'hb5)) << wire37[(2'h3):(1'h1)]));
endmodule
