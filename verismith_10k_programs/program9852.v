module top
#(parameter param82 = (((({(8'hb7)} ? ((8'ha5) ? (8'h9c) : (8'hb6)) : (~&(8'ha6))) ? (|(8'ha7)) : (((8'ha8) + (8'hb2)) ? {(8'ha5), (8'ha2)} : (~|(7'h42)))) ^~ (!(7'h40))) ? (((((8'hb4) ? (8'hb7) : (8'h9d)) == {(8'haf)}) ? (8'ha2) : (^((7'h40) ? (8'hb0) : (7'h42)))) ? (!(((8'hb8) ? (8'h9e) : (8'hb4)) <= ((7'h40) ? (7'h43) : (8'h9c)))) : ((((8'haf) ? (8'hb0) : (8'hab)) ? ((8'ha4) ? (7'h40) : (8'hb9)) : ((8'ha7) ~^ (8'haf))) && {((8'hba) ^ (8'hb7)), ((8'haf) ? (8'had) : (8'ha6))})) : ((~&(((8'hb9) & (8'had)) ? (^~(8'ha3)) : ((8'hac) * (8'ha7)))) ? (({(8'h9d), (8'hac)} < ((8'hba) & (8'hbf))) < ((|(8'ha8)) != (8'hb8))) : (~|(^((8'hbf) ? (8'hb5) : (8'ha5)))))), 
parameter param83 = (~|param82))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h14c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire76;
  wire signed [(4'hc):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  assign y = {wire81,
                 wire76,
                 wire30,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg80,
                 reg79,
                 reg78,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
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
  assign wire4 = $signed((|$unsigned((~$unsigned(wire3)))));
  assign wire5 = ($signed(wire2[(4'h8):(3'h5)]) != {$signed(wire3[(4'hc):(1'h0)]),
                     {((~wire3) ? {wire1} : (wire3 && (8'hb7))),
                         ((wire1 >> wire2) > $unsigned(wire3))}});
  assign wire6 = ({$unsigned(((wire0 ~^ wire3) >> wire4)),
                         ((~|((8'hbb) ?
                             (8'hb6) : wire4)) * (|$unsigned(wire5)))} ?
                     (~|$unsigned(((8'ha1) < $signed(wire1)))) : (((~&(wire5 ?
                             wire1 : wire2)) < ($unsigned(wire5) >>> (|wire1))) ?
                         (~|$signed($unsigned(wire4))) : $unsigned(((8'hb9) ?
                             wire2[(3'h6):(3'h5)] : wire0))));
  assign wire7 = wire1;
  always
    @(posedge clk) begin
      if (wire6[(2'h2):(2'h2)])
        begin
          reg8 <= wire3;
          reg9 <= (wire4[(5'h13):(2'h3)] > $signed({wire0[(4'hc):(1'h0)]}));
          reg10 <= ((8'ha6) | (~$signed(wire3)));
          reg11 <= ((^wire4) ? wire6[(2'h3):(1'h0)] : reg10);
        end
      else
        begin
          if ({(wire1[(4'hb):(2'h3)] ?
                  ((-(reg9 - (8'ha0))) + wire4[(3'h6):(3'h5)]) : wire4[(5'h11):(2'h3)])})
            begin
              reg8 <= $signed((~((^{wire6, wire0}) ^ (((8'h9f) ?
                      (8'ha0) : wire1) ?
                  ((8'ha3) ? wire2 : reg10) : wire5))));
              reg9 <= {wire2};
              reg10 <= ((+(|$unsigned((wire7 + reg8)))) ?
                  $unsigned(((|$signed(reg11)) ?
                      $unsigned(wire3[(2'h3):(1'h0)]) : reg10[(1'h0):(1'h0)])) : $signed(reg10[(3'h7):(3'h4)]));
              reg11 <= $signed($unsigned({(((8'ha6) + (8'hbb)) ?
                      $signed(reg9) : wire4)}));
              reg12 <= reg8[(2'h3):(2'h3)];
            end
          else
            begin
              reg8 <= (wire5 ?
                  {$signed(wire2)} : (&{$signed((wire4 >>> wire4))}));
            end
          reg13 <= (|reg12);
          if (wire1[(4'hb):(4'h8)])
            begin
              reg14 <= $unsigned({reg8[(4'hb):(3'h6)], wire2[(1'h1):(1'h0)]});
            end
          else
            begin
              reg14 <= (reg11 ?
                  reg14[(2'h3):(2'h2)] : (wire5[(1'h0):(1'h0)] ?
                      ({reg10} | wire5) : (~|$signed((reg12 ?
                          (8'hb6) : reg14)))));
              reg15 <= ($signed(reg13[(5'h13):(2'h2)]) & (8'hbd));
            end
        end
      reg16 <= $unsigned(((reg9 ?
              {$unsigned(wire0), (wire4 ? reg14 : reg8)} : {reg14,
                  $unsigned(reg13)}) ?
          (($signed(wire7) != $unsigned(wire0)) && $unsigned(((8'hae) >= reg13))) : ((&{wire2}) ^~ reg10)));
      reg17 <= ({$signed(wire2)} ?
          $signed($unsigned(wire6)) : (($unsigned(wire4) ?
                  $unsigned(wire4[(5'h11):(4'hf)]) : $unsigned(((8'hbb) ?
                      wire1 : reg8))) ?
              (~^$unsigned(wire0)) : wire1));
      reg18 <= $signed(($unsigned({$unsigned((8'hb6))}) || reg9));
      reg19 <= ((~|$signed((|$unsigned(reg8)))) ?
          {wire3, wire5[(2'h2):(2'h2)]} : reg18);
    end
  assign wire20 = ({(((reg9 ? reg16 : reg11) ? (~&wire7) : $signed((7'h43))) ?
                              ($signed(wire1) >> (reg10 ^ reg15)) : $unsigned($unsigned(reg11))),
                          wire4[(5'h13):(1'h1)]} ?
                      reg11 : (((~&(~|reg8)) ^~ $unsigned(reg14)) ?
                          reg15[(4'h8):(3'h6)] : (((^~(8'ha3)) != wire2[(2'h3):(2'h2)]) ?
                              $unsigned(reg10[(3'h4):(1'h0)]) : ((reg15 ?
                                  reg19 : wire7) ^~ reg9[(4'ha):(4'h9)]))));
  assign wire21 = $unsigned($signed((reg13[(3'h5):(1'h1)] << reg14[(2'h2):(1'h1)])));
  assign wire22 = reg11;
  assign wire23 = wire5;
  assign wire24 = (~$unsigned($signed(wire7)));
  always
    @(posedge clk) begin
      reg25 <= (+$signed((reg13 ?
          {(reg11 > wire0)} : {reg9[(4'hb):(2'h3)], (wire0 & wire7)})));
      reg26 <= $unsigned((-$signed(reg13[(5'h10):(5'h10)])));
      reg27 <= $unsigned($unsigned($signed((&(~^wire24)))));
      reg28 <= reg10[(3'h7):(2'h2)];
      reg29 <= (^~reg27[(3'h7):(3'h5)]);
    end
  assign wire30 = wire23;
  module31 #() modinst77 (wire76, clk, reg13, reg8, wire21, wire0);
  always
    @(posedge clk) begin
      reg78 <= (~$signed({(reg26[(3'h4):(2'h2)] ? $signed(reg25) : (-wire6)),
          ({reg14, wire23} | $unsigned(wire20))}));
      reg79 <= {wire24[(1'h0):(1'h0)]};
      reg80 <= ({$signed(reg12[(2'h3):(1'h0)])} ?
          reg15[(1'h0):(1'h0)] : wire3[(4'hd):(3'h4)]);
    end
  assign wire81 = (~|reg15);
endmodule

module module31
#(parameter param75 = ({({((8'ha8) ? (8'haf) : (8'ha8))} ? (((8'hba) ? (7'h43) : (8'hb4)) ? ((8'hb3) ^ (8'h9f)) : ((8'h9c) ? (8'ha3) : (8'hb0))) : (~((8'h9d) ? (8'hbd) : (8'hb9)))), (8'hb2)} > {(|(-((8'hab) ? (8'ha4) : (8'hb0))))}))
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h179):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire35;
  input wire signed [(5'h10):(1'h0)] wire34;
  input wire [(4'hb):(1'h0)] wire33;
  input wire signed [(2'h3):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire73;
  wire signed [(2'h3):(1'h0)] wire72;
  wire signed [(3'h5):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire66;
  wire signed [(4'hb):(1'h0)] wire59;
  wire signed [(2'h2):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire36;
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire66,
                 wire59,
                 wire43,
                 wire42,
                 wire37,
                 wire36,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
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
                 reg46,
                 reg45,
                 reg44,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire36 = $signed(wire32);
  assign wire37 = wire36;
  always
    @(posedge clk) begin
      reg38 <= wire35[(3'h7):(3'h7)];
      reg39 <= $unsigned(wire35[(1'h1):(1'h0)]);
      reg40 <= {$signed((~^((reg39 && wire35) && wire36)))};
      reg41 <= (wire35 ? ((&reg39) & (8'ha9)) : $signed(wire34[(1'h1):(1'h0)]));
    end
  assign wire42 = $unsigned($unsigned($signed(wire33)));
  assign wire43 = $signed(wire37);
  always
    @(posedge clk) begin
      reg44 <= wire42;
      reg45 <= ((($unsigned((&reg39)) <<< (reg39 ?
          {wire33,
              reg39} : wire32)) >> {$unsigned(wire43[(2'h2):(1'h1)])}) * ((^~((8'hbf) ?
              {wire42, wire37} : reg44)) ?
          (~((reg38 ? wire32 : wire34) ?
              (reg41 ?
                  reg40 : wire36) : $signed(reg38))) : $signed((+wire32[(2'h2):(2'h2)]))));
      reg46 <= $unsigned(wire32);
      if (wire42[(1'h1):(1'h0)])
        begin
          reg47 <= (wire36[(1'h1):(1'h0)] ?
              $unsigned((-(^~wire35[(3'h4):(1'h1)]))) : {($unsigned($signed(reg41)) >= $signed((reg38 ?
                      reg38 : reg41)))});
          reg48 <= {({{(wire34 < wire35), (reg40 || reg39)}} ?
                  ($signed(((8'ha1) < reg45)) ?
                      {wire33} : (~&{wire37, wire37})) : (7'h43))};
          reg49 <= ($unsigned(wire43[(1'h0):(1'h0)]) < reg48);
          reg50 <= $unsigned($unsigned(reg48[(1'h0):(1'h0)]));
        end
      else
        begin
          reg47 <= reg39;
        end
      if ((~|(((wire37[(5'h11):(4'he)] < {reg48, reg41}) ~^ ((8'ha8) ?
              $signed(wire43) : (8'hb2))) ?
          wire32[(2'h2):(2'h2)] : ($unsigned(wire37) ^ (+(!(8'ha0)))))))
        begin
          reg51 <= wire33;
          if ({reg50})
            begin
              reg52 <= (wire33 ? $unsigned(wire42) : wire32);
              reg53 <= {wire35[(3'h7):(2'h3)]};
              reg54 <= reg52;
              reg55 <= $signed((+(^reg44)));
            end
          else
            begin
              reg52 <= reg47;
              reg53 <= wire43;
              reg54 <= $signed(wire32);
              reg55 <= (reg44[(1'h1):(1'h0)] ?
                  (+((~|(~^reg38)) ?
                      ((reg40 + (7'h42)) >> (reg38 - (8'ha4))) : reg54[(2'h2):(2'h2)])) : reg38[(3'h7):(2'h3)]);
              reg56 <= (wire32[(1'h1):(1'h1)] & $unsigned($unsigned((-reg53[(5'h11):(4'hc)]))));
            end
          reg57 <= $unsigned((reg49[(1'h1):(1'h1)] <<< reg53[(3'h6):(3'h4)]));
          reg58 <= ((~^((~^$unsigned(reg55)) ^ $signed((reg56 + reg48)))) ?
              ($unsigned(({reg53, wire37} ?
                  {wire36} : $signed(wire35))) & wire32) : ((($unsigned(reg57) ?
                          (wire34 ? (8'hb4) : wire35) : wire35) ?
                      ($signed(wire43) ?
                          (wire32 ?
                              wire42 : reg40) : $signed(reg47)) : (&(|(8'hb6)))) ?
                  reg54 : ($unsigned(wire32[(1'h1):(1'h0)]) ?
                      (reg49 ?
                          $unsigned(reg46) : reg50) : $unsigned({reg47}))));
        end
      else
        begin
          reg51 <= ((((^~$signed(wire42)) <<< reg51[(1'h0):(1'h0)]) < reg52[(4'h8):(2'h3)]) & reg38[(1'h0):(1'h0)]);
          reg52 <= reg44;
          reg53 <= (^$signed((((8'hb5) ?
              $signed(reg48) : reg46) + {{wire37}})));
          if ({$unsigned(($signed(reg46) ?
                  (reg47 << (reg50 ? wire42 : reg57)) : {$unsigned((7'h42))})),
              ((reg54[(4'h9):(1'h1)] ?
                      ((reg47 ? (8'hb6) : reg49) ?
                          $signed((8'ha8)) : {wire34}) : (-(|wire43))) ?
                  reg56 : ((wire37[(3'h4):(2'h2)] ? wire43 : {wire34}) ?
                      (&wire36) : (~|wire34)))})
            begin
              reg54 <= $unsigned($unsigned($signed($signed((reg51 ?
                  (8'haa) : reg51)))));
              reg55 <= reg40[(2'h3):(2'h2)];
              reg56 <= (wire32[(2'h3):(1'h1)] < wire33[(3'h4):(2'h2)]);
            end
          else
            begin
              reg54 <= {(!{(^~((8'hb9) ? reg39 : wire36))})};
              reg55 <= {reg39, $unsigned($signed(reg38[(2'h2):(1'h0)]))};
            end
        end
    end
  assign wire59 = (($signed(reg49[(1'h1):(1'h0)]) * ((8'ha2) && $signed({wire35}))) ^ $unsigned({wire32,
                      reg50}));
  always
    @(posedge clk) begin
      if ($signed(reg44))
        begin
          reg60 <= (($signed(reg54[(2'h3):(2'h3)]) << reg55) <<< $unsigned((~&((reg45 ?
                  reg53 : reg51) ?
              wire32 : (reg56 ? wire33 : reg38)))));
        end
      else
        begin
          if (wire59)
            begin
              reg60 <= ((+$unsigned((-((8'had) >>> reg49)))) ?
                  wire32 : $signed($signed(reg55)));
              reg61 <= reg46[(2'h3):(2'h2)];
              reg62 <= ($unsigned(($signed($unsigned((8'hbf))) ?
                  reg60 : (wire43[(2'h2):(1'h0)] && $unsigned(wire37)))) ^ $unsigned(wire35));
            end
          else
            begin
              reg60 <= ($signed(((8'ha7) ?
                  ({wire42} <= $signed(reg54)) : $unsigned({(8'ha8)}))) <<< ((~&wire42) >> $signed($unsigned((wire43 ?
                  reg60 : (8'hb9))))));
              reg61 <= reg50;
              reg62 <= wire42;
              reg63 <= $signed($unsigned(reg54));
              reg64 <= {$unsigned(wire42[(1'h0):(1'h0)]),
                  ($signed((-$unsigned(reg45))) ?
                      $signed((~|(reg44 ?
                          reg49 : reg38))) : $unsigned((!$unsigned((8'ha1)))))};
            end
          reg65 <= ($signed(((reg61 ?
                  (wire35 > reg41) : reg47[(1'h0):(1'h0)]) << reg57)) ?
              (~|wire42[(1'h0):(1'h0)]) : reg44[(3'h4):(1'h1)]);
        end
    end
  assign wire66 = {wire33};
  always
    @(posedge clk) begin
      reg67 <= $unsigned(wire35);
      reg68 <= ((+$signed((|$unsigned(reg54)))) ?
          reg55[(2'h3):(2'h2)] : (|reg61));
      reg69 <= (^(8'hbb));
      reg70 <= (~&(reg67[(3'h7):(3'h4)] + (reg52[(4'h9):(2'h2)] ?
          ((wire42 ?
              reg67 : reg57) ^ $signed(reg45)) : ($unsigned(reg54) * {(8'had)}))));
    end
  assign wire71 = $signed(reg58[(2'h2):(1'h1)]);
  assign wire72 = ((~^reg55[(2'h2):(1'h1)]) < (+$signed(wire37)));
  assign wire73 = (($unsigned(((reg55 || reg53) ?
                              ((8'ha3) ? reg50 : reg53) : (8'hb8))) ?
                          $signed(wire34[(1'h1):(1'h0)]) : (~&reg60[(5'h11):(5'h10)])) ?
                      reg41 : reg49);
  assign wire74 = reg49;
endmodule
