module top
#(parameter param89 = (&{((((8'ha9) ? (8'hac) : (8'ha6)) & (8'had)) != (|{(8'ha1), (8'ha9)})), {((8'hbb) ? ((8'hb1) >= (8'hb6)) : {(8'hb0), (8'hb1)})}}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h240):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire signed [(2'h2):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire87;
  wire signed [(4'h9):(1'h0)] wire86;
  wire signed [(5'h10):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire84;
  wire [(3'h4):(1'h0)] wire82;
  wire [(2'h2):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire58;
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire82,
                 wire81,
                 wire4,
                 wire5,
                 wire6,
                 wire22,
                 wire58,
                 reg83,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
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
                 (1'h0)};
  assign wire4 = (wire0 == $unsigned(wire2[(3'h5):(3'h5)]));
  assign wire5 = ({wire1} ?
                     (^~($unsigned($signed(wire4)) ?
                         $signed((wire0 + wire0)) : $signed((^~wire3)))) : $unsigned($unsigned((wire3[(3'h7):(3'h5)] && wire0[(3'h7):(3'h4)]))));
  assign wire6 = $signed(wire0[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg7 <= (~(-(8'hbe)));
      reg8 <= (|$unsigned(wire6));
    end
  always
    @(posedge clk) begin
      reg9 <= $signed(reg7[(3'h4):(1'h1)]);
      if (wire2)
        begin
          reg10 <= wire5[(4'ha):(3'h4)];
          reg11 <= {{wire0[(3'h6):(1'h0)]}};
          if ({$unsigned($signed(($signed(wire0) - (+wire1))))})
            begin
              reg12 <= $unsigned(((8'h9f) ?
                  reg11[(3'h5):(1'h0)] : ({reg11[(3'h6):(1'h1)]} ?
                      $unsigned($signed(reg9)) : (8'hb3))));
              reg13 <= wire4;
            end
          else
            begin
              reg12 <= $unsigned(((~^(^~reg12)) - wire3[(4'hc):(3'h4)]));
              reg13 <= (-(reg12[(3'h4):(3'h4)] ?
                  ($unsigned(wire2) ?
                      ($signed(wire4) ?
                          $unsigned(reg13) : (reg10 ?
                              (8'ha1) : reg7)) : $signed((&reg9))) : {(wire5[(2'h3):(1'h1)] ?
                          reg7 : $unsigned(wire2)),
                      (|reg10[(1'h0):(1'h0)])}));
              reg14 <= (wire5 >> $unsigned(wire6[(2'h3):(2'h3)]));
            end
          reg15 <= ($signed({((reg9 & wire2) ? $unsigned(reg13) : (7'h41)),
                  $signed((-reg8))}) ?
              $unsigned($unsigned((~|$signed((8'ha4))))) : ((!$unsigned({(8'hb3),
                  reg10})) - (~^wire6[(1'h1):(1'h1)])));
        end
      else
        begin
          reg10 <= (8'ha0);
          reg11 <= wire0[(1'h1):(1'h0)];
          reg12 <= (((((wire5 ? reg15 : wire3) ?
                  wire1[(1'h0):(1'h0)] : ((8'hae) != reg7)) | ($signed((8'haa)) ?
                  (reg10 == reg10) : (reg13 | wire4))) ?
              (~|((reg14 & reg13) ?
                  reg8 : $signed(wire4))) : reg14[(4'hb):(3'h6)]) + reg8);
        end
      reg16 <= {(({$signed(reg12)} ~^ ({wire6, reg9} ?
                  {wire3, reg11} : {wire0})) ?
              $signed($unsigned($unsigned(reg13))) : (reg7 <= wire1[(3'h6):(3'h6)]))};
      reg17 <= {(~|($signed($unsigned(wire2)) ?
              (~^(wire1 >> wire0)) : {$unsigned(wire3)}))};
      reg18 <= wire4[(4'h9):(2'h3)];
    end
  always
    @(posedge clk) begin
      reg19 <= ((~(wire0 != ((reg13 >= reg15) ?
              (reg11 ^ wire4) : $signed(reg9)))) ?
          $unsigned((8'h9f)) : ((~|$signed(reg13)) ?
              (wire3[(5'h10):(4'hf)] ? (~^{reg14}) : reg13) : ((reg8 ?
                      {reg16} : (wire1 <= reg14)) ?
                  reg12[(4'hb):(3'h7)] : ($unsigned(reg13) || (-wire0)))));
      reg20 <= $unsigned(reg9);
    end
  always
    @(posedge clk) begin
      reg21 <= $unsigned({$unsigned(({reg15} <= $unsigned(wire2)))});
    end
  assign wire22 = ((((wire5[(2'h2):(1'h0)] >> (reg7 ^~ reg20)) ?
                          ((wire6 ? wire2 : (8'ha0)) ?
                              (wire4 >= reg19) : $signed(reg14)) : wire4[(4'h9):(3'h7)]) ?
                      (((reg14 ? wire3 : reg10) ?
                              $signed(wire5) : (reg9 & reg20)) ?
                          ((~^(8'hb2)) ?
                              $signed(wire5) : ((8'hb2) ?
                                  reg16 : reg7)) : reg7) : (reg13[(4'hf):(3'h5)] ?
                          (-{(8'haa),
                              reg16}) : (|$unsigned(reg17)))) >>> reg21[(1'h1):(1'h1)]);
  module23 #() modinst59 (wire58, clk, reg19, wire6, reg13, reg10);
  always
    @(posedge clk) begin
      if ((+(^~reg12[(3'h7):(3'h7)])))
        begin
          reg60 <= (8'hbd);
          reg61 <= (~|reg18);
        end
      else
        begin
          reg60 <= reg18[(1'h0):(1'h0)];
          reg61 <= wire2;
          if ((|(wire5[(3'h6):(1'h0)] ?
              $unsigned({((8'ha7) ? wire1 : reg17),
                  ((8'hba) ?
                      (8'hb4) : (8'hb3))}) : ($signed((wire3 != wire6)) * reg17[(3'h7):(3'h6)]))))
            begin
              reg62 <= ($signed((~&$signed($unsigned((8'ha4))))) <<< (reg60 > reg20[(1'h0):(1'h0)]));
              reg63 <= reg20[(4'h8):(1'h0)];
              reg64 <= $unsigned((&{reg17[(4'h9):(2'h3)],
                  {((8'hbf) ? reg12 : (8'hac))}}));
              reg65 <= (+reg11[(4'hc):(3'h7)]);
              reg66 <= {(((8'hbb) < $signed((!reg10))) ?
                      (-((~|(8'hbc)) ?
                          $unsigned((8'h9e)) : (reg62 ?
                              reg7 : wire4))) : ((^~(reg19 ?
                          reg65 : reg21)) || {((8'ha3) * wire4),
                          $signed(reg61)})),
                  ($unsigned((wire2[(3'h6):(3'h4)] + wire1)) ?
                      $signed($signed(reg65[(1'h0):(1'h0)])) : (wire2[(2'h2):(1'h0)] ?
                          $unsigned((reg21 - reg61)) : ((reg14 ~^ wire5) ^ reg65[(3'h5):(1'h0)])))};
            end
          else
            begin
              reg62 <= $unsigned(wire4[(4'hc):(4'ha)]);
              reg63 <= ((7'h42) ?
                  (reg60 & ($signed($unsigned((8'ha6))) ?
                      (-$signed(reg8)) : $signed($unsigned(reg8)))) : (($unsigned(reg61) ?
                      reg15 : $signed((reg19 ^ reg19))) >> reg16[(1'h0):(1'h0)]));
              reg64 <= reg61;
              reg65 <= ((+(($unsigned(reg18) ^~ (reg16 >= reg65)) ?
                      $signed((reg12 && reg16)) : reg21[(3'h5):(2'h3)])) ?
                  {wire1} : {reg13, reg12});
              reg66 <= (($signed(($signed((8'hae)) && $signed(wire58))) * $signed(reg60)) ?
                  ({wire2[(1'h1):(1'h0)], reg63[(5'h11):(3'h7)]} ?
                      $signed((-(wire2 != (8'hb7)))) : reg10) : $signed(wire4));
            end
        end
      reg67 <= reg12[(2'h3):(2'h3)];
      reg68 <= reg16;
      reg69 <= ($signed($unsigned(({reg13,
          wire22} | $unsigned(reg8)))) | $signed($signed((reg10 ?
          $unsigned(reg62) : reg20[(3'h7):(1'h0)]))));
    end
  always
    @(posedge clk) begin
      if ($unsigned(reg20[(4'he):(2'h3)]))
        begin
          if ($signed(reg64))
            begin
              reg70 <= ((-(^~$signed(wire5))) ?
                  $signed($unsigned((!(reg9 ^~ wire4)))) : {(8'hab)});
              reg71 <= reg15;
              reg72 <= (wire22[(2'h2):(1'h0)] ?
                  (+reg8) : (reg12 ?
                      reg16[(2'h2):(1'h0)] : (!wire22[(1'h1):(1'h1)])));
            end
          else
            begin
              reg70 <= $signed(reg8[(1'h0):(1'h0)]);
            end
          reg73 <= reg20[(1'h1):(1'h0)];
        end
      else
        begin
          reg70 <= reg65[(1'h0):(1'h0)];
          reg71 <= ($unsigned((($unsigned(reg14) | reg61) || ($signed(reg11) ?
                  $signed(reg18) : $signed(reg68)))) ?
              $unsigned(reg73) : (7'h42));
          if (reg60)
            begin
              reg72 <= reg66;
              reg73 <= reg19[(2'h3):(1'h0)];
              reg74 <= ({reg66[(4'hc):(3'h7)]} == (|(8'hb3)));
            end
          else
            begin
              reg72 <= (wire22 ?
                  (reg20 ?
                      ((reg60[(4'ha):(1'h0)] != reg9[(5'h11):(4'hd)]) ?
                          {$unsigned(wire22),
                              wire1[(3'h7):(3'h4)]} : {{wire3}}) : reg61[(4'h9):(4'h8)]) : $signed((+$unsigned((wire0 - reg60)))));
              reg73 <= $unsigned((8'hb3));
            end
          reg75 <= $signed($signed(($unsigned({reg9,
              reg9}) >> $unsigned((&reg12)))));
          reg76 <= ((($unsigned($unsigned(reg13)) ?
              reg16 : $unsigned($signed(wire4))) - $unsigned($unsigned($signed(reg73)))) ~^ (8'hb2));
        end
      if ((!($signed({(~|reg60), (^reg21)}) ? (8'ha5) : reg73[(1'h0):(1'h0)])))
        begin
          reg77 <= ((8'hab) ^ (+$unsigned((+(reg66 <= wire6)))));
          reg78 <= reg62;
        end
      else
        begin
          reg77 <= ((^~$signed(wire5)) ? (reg77 << $signed(reg64)) : reg11);
          reg78 <= $signed((reg8[(3'h6):(2'h3)] ?
              $unsigned($unsigned({reg71,
                  (8'hbc)})) : $signed(reg66[(2'h2):(1'h1)])));
        end
      reg79 <= (+(((&reg66[(2'h3):(1'h1)]) ?
          reg78[(3'h6):(1'h1)] : wire22[(1'h0):(1'h0)]) & (~^$signed((reg13 * reg68)))));
      reg80 <= reg16;
    end
  assign wire81 = $unsigned((&reg10[(2'h3):(2'h3)]));
  assign wire82 = $unsigned(reg75[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg83 <= reg63[(1'h0):(1'h0)];
    end
  assign wire84 = ({$unsigned($unsigned((reg78 ? reg66 : (8'haa)))),
                          (~(reg10[(1'h0):(1'h0)] & reg14))} ?
                      reg77 : wire82[(2'h2):(1'h1)]);
  assign wire85 = wire4[(3'h7):(3'h5)];
  assign wire86 = {(|(reg64[(4'h8):(3'h5)] || (wire85 ?
                          $unsigned(wire85) : (reg74 ? reg80 : (8'ha3))))),
                      $unsigned(reg7)};
  assign wire87 = (&reg78);
  assign wire88 = wire81[(1'h1):(1'h0)];
endmodule

module module23  (y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire27;
  input wire signed [(5'h12):(1'h0)] wire26;
  input wire signed [(3'h6):(1'h0)] wire25;
  input wire [(3'h7):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire56;
  wire [(4'ha):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire28;
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire53,
                 wire31,
                 wire28,
                 reg29,
                 reg30,
                 (1'h0)};
  assign wire28 = ($signed($unsigned(($signed(wire24) ?
                      wire25[(2'h3):(2'h2)] : wire25))) >>> (wire25[(2'h3):(1'h1)] >= wire27));
  always
    @(posedge clk) begin
      reg29 <= $signed($signed(((~&wire24) && (wire24 ?
          $signed(wire28) : (~|wire28)))));
      reg30 <= reg29;
    end
  assign wire31 = $signed(wire27[(4'h8):(3'h5)]);
  module32 #() modinst54 (wire53, clk, wire24, wire27, reg30, wire25, wire31);
  assign wire55 = wire27[(3'h6):(2'h3)];
  assign wire56 = ($unsigned($unsigned($signed($unsigned(reg29)))) ?
                      ((~|((8'ha9) <<< $signed(wire55))) ?
                          (+reg30) : (|($signed(wire53) ?
                              wire25[(2'h2):(1'h0)] : reg29[(3'h4):(2'h3)]))) : (~^($unsigned(reg29) < {wire26,
                          wire28})));
  assign wire57 = $unsigned(wire28[(3'h5):(3'h5)]);
endmodule

module module32
#(parameter param51 = (~(((~&(~(8'ha0))) << ((!(8'hb9)) <<< (8'ha2))) ? (8'had) : (^(8'hbb)))), 
parameter param52 = (~^(~|({(|param51)} ? (~(7'h42)) : (-(param51 == param51))))))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire37;
  input wire [(4'he):(1'h0)] wire36;
  input wire [(4'h8):(1'h0)] wire35;
  input wire signed [(3'h4):(1'h0)] wire34;
  input wire signed [(4'h9):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ({(8'hb1), {(-(&(wire33 ? wire34 : wire35)))}})
        begin
          reg38 <= ($unsigned((8'hbb)) ?
              ((((wire35 << wire34) ? wire36[(2'h3):(2'h3)] : wire36) ?
                  (wire34 == {wire36}) : ((^wire35) ?
                      (~(8'ha6)) : $unsigned((8'h9f)))) >= (-(-wire34))) : ((&wire35) ?
                  ((8'hb8) ? wire37[(2'h3):(1'h1)] : wire35) : wire34));
          reg39 <= (&reg38);
          if (reg39)
            begin
              reg40 <= wire36[(4'he):(4'hc)];
            end
          else
            begin
              reg40 <= $unsigned({$signed({((8'h9f) | wire36)}),
                  $signed(reg39)});
              reg41 <= (^(~&(((&wire37) ?
                  (wire33 > (8'ha4)) : $unsigned(wire34)) == (~&$signed(wire37)))));
            end
          reg42 <= $unsigned($unsigned(reg39[(2'h2):(1'h0)]));
          if ($unsigned(wire33))
            begin
              reg43 <= (!($unsigned(reg42[(4'hb):(1'h1)]) ?
                  (~|wire34) : reg40[(1'h0):(1'h0)]));
              reg44 <= wire37;
              reg45 <= ($signed(((~{wire37}) ? (7'h44) : reg43)) ?
                  $signed({$unsigned(wire35[(1'h0):(1'h0)])}) : $unsigned(((!reg40) ^~ $signed(wire33))));
              reg46 <= $unsigned(((((reg40 ? reg42 : wire33) >>> {reg45,
                      reg40}) ?
                  reg43[(2'h3):(2'h2)] : ($unsigned(reg45) ?
                      $signed(reg39) : wire34[(1'h1):(1'h0)])) | $signed($unsigned($signed(wire35)))));
            end
          else
            begin
              reg43 <= $signed((reg42 ?
                  (-(^~$signed(wire37))) : {({reg38, reg40} ^ reg40),
                      $signed({wire37})}));
              reg44 <= (wire36 != ((+((wire35 + wire35) >> $unsigned(wire33))) ^ $unsigned($unsigned($unsigned(wire37)))));
              reg45 <= $signed({{$unsigned(wire35[(3'h5):(3'h5)]),
                      ({wire37} > reg45)},
                  wire34[(2'h3):(1'h0)]});
              reg46 <= (&$signed(wire34[(1'h0):(1'h0)]));
              reg47 <= ({$signed((|(~|reg39))),
                      (reg44[(2'h3):(2'h2)] ~^ (reg39[(2'h2):(1'h1)] < {wire36}))} ?
                  {(~|wire37)} : reg40);
            end
        end
      else
        begin
          reg38 <= (($unsigned(reg40) ?
              (~^$signed((reg44 ^~ wire34))) : {(^$unsigned(wire37)),
                  (wire34 <= $unsigned(reg38))}) <<< reg41);
          reg39 <= (-reg40[(1'h1):(1'h1)]);
          reg40 <= (+(^~$unsigned($unsigned((reg45 >>> reg45)))));
        end
    end
  assign wire48 = (|$signed((~&$unsigned((reg45 || reg43)))));
  assign wire49 = $signed((reg41[(2'h2):(1'h0)] ?
                      {$signed((~&reg43)),
                          (&{reg43, reg46})} : (reg45 + reg41[(3'h5):(1'h1)])));
  assign wire50 = reg41[(1'h1):(1'h1)];
endmodule
