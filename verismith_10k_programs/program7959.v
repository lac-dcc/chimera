module top
#(parameter param92 = {(+(~(~&((8'ha5) ? (8'hb2) : (7'h44))))), (~(^~(((8'hba) && (8'hb6)) ? ((8'hbf) ? (7'h43) : (8'ha3)) : ((7'h42) ? (8'hbe) : (8'ha8)))))}, 
parameter param93 = ({param92, param92} * param92))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h374):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire90;
  wire [(3'h4):(1'h0)] wire89;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire35;
  wire signed [(5'h14):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire68;
  wire [(4'hc):(1'h0)] wire69;
  wire [(2'h2):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire87;
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire5,
                 wire17,
                 wire18,
                 wire25,
                 wire34,
                 wire35,
                 wire36,
                 wire48,
                 wire68,
                 wire69,
                 wire70,
                 wire87,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
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
                 reg37,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
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
  assign wire5 = $unsigned((wire3 ?
                     ($signed(wire1[(1'h0):(1'h0)]) ?
                         $signed($signed(wire0)) : $unsigned((^wire4))) : ((~|(~wire3)) ?
                         $signed(wire0[(2'h3):(2'h2)]) : (-(wire2 | wire3)))));
  always
    @(posedge clk) begin
      if ({wire1[(3'h4):(1'h0)], $signed(wire1)})
        begin
          reg6 <= (+((8'ha9) > (!((wire3 & wire2) >> (wire0 >> wire5)))));
          reg7 <= ($unsigned(($unsigned((wire2 & (7'h42))) <= wire0)) | (&(wire1[(2'h2):(1'h1)] ?
              $signed(wire0) : wire5)));
          if ($unsigned(reg6))
            begin
              reg8 <= {((~|($signed((8'hbb)) > $unsigned(wire3))) ?
                      ($unsigned($signed(wire1)) < wire1) : (({(7'h44)} != {(8'ha4)}) ~^ (!(-reg7))))};
              reg9 <= (|$signed(reg7[(3'h7):(3'h4)]));
              reg10 <= {$unsigned({(&{wire0, reg8})})};
              reg11 <= (reg7[(2'h2):(2'h2)] ?
                  $unsigned({wire2[(1'h1):(1'h1)]}) : ($signed((+$signed((8'hb3)))) ?
                      ((((8'hac) ~^ wire2) * (reg9 ? reg9 : wire2)) ?
                          (+(~reg8)) : wire4[(1'h0):(1'h0)]) : $unsigned($signed((&reg10)))));
              reg12 <= $signed(wire3);
            end
          else
            begin
              reg8 <= $unsigned({wire5[(4'ha):(3'h5)]});
            end
          reg13 <= $unsigned(wire2);
        end
      else
        begin
          reg6 <= $unsigned(($unsigned($signed((wire5 == (8'haa)))) ?
              $unsigned(((|wire2) ?
                  (^~(8'ha2)) : $signed(reg10))) : {(-$unsigned(wire2)),
                  (-(wire0 - (8'hbf)))}));
          if ($unsigned($unsigned(reg9[(2'h3):(1'h0)])))
            begin
              reg7 <= (reg8[(3'h4):(3'h4)] ?
                  reg11[(2'h3):(2'h2)] : {($unsigned(reg7) & reg7[(3'h4):(3'h4)]),
                      wire2});
              reg8 <= (((8'ha8) == $unsigned(wire2[(3'h4):(3'h4)])) && ($unsigned($signed(reg7)) ?
                  $unsigned(reg11[(1'h0):(1'h0)]) : (&$signed({wire2,
                      (8'ha1)}))));
              reg9 <= ($unsigned(reg10[(2'h2):(2'h2)]) ?
                  ($signed($unsigned((reg9 ?
                      wire1 : reg13))) <<< {$unsigned($signed(wire3))}) : reg10[(1'h0):(1'h0)]);
              reg10 <= (|$signed($unsigned($signed(reg8))));
              reg11 <= ($signed(reg6) ?
                  $unsigned(($signed(wire3[(5'h12):(3'h5)]) ?
                      (^~(reg12 ? wire0 : wire1)) : {(|reg11),
                          $unsigned(wire1)})) : reg8[(3'h6):(3'h4)]);
            end
          else
            begin
              reg7 <= wire1[(1'h1):(1'h1)];
              reg8 <= (((|wire0) - $unsigned(reg11[(2'h2):(1'h0)])) && (8'hbc));
              reg9 <= {wire1[(2'h2):(1'h0)]};
              reg10 <= (wire3 > ((~|{reg9}) * reg11));
            end
          reg12 <= $signed((-($signed(wire2) ?
              $unsigned((wire4 >> reg12)) : reg6[(2'h2):(2'h2)])));
          reg13 <= $signed(wire5[(2'h2):(1'h0)]);
        end
      if (reg9[(1'h0):(1'h0)])
        begin
          reg14 <= $unsigned((|$unsigned((^~reg6[(1'h0):(1'h0)]))));
          if (((reg13 - {$signed($unsigned(reg11))}) >= (8'hae)))
            begin
              reg15 <= (^(wire1[(1'h0):(1'h0)] ?
                  ($signed({(8'ha1)}) ?
                      ($signed(reg13) ?
                          (~&reg12) : (^~(8'haa))) : (+reg8)) : (+$signed((reg12 * wire2)))));
            end
          else
            begin
              reg15 <= (($unsigned(reg14) ?
                      wire1 : $signed(reg14[(2'h2):(1'h1)])) ?
                  $unsigned($unsigned($signed((reg10 & wire1)))) : ($signed(wire2[(3'h4):(3'h4)]) ?
                      {($signed(reg15) ?
                              (wire5 ~^ (8'hb3)) : {wire1})} : $unsigned(($unsigned(reg14) ?
                          wire1 : (reg9 <<< reg10)))));
            end
        end
      else
        begin
          reg14 <= $signed(reg11[(1'h1):(1'h0)]);
          reg15 <= (&$unsigned(($unsigned($unsigned(reg13)) ?
              wire0[(1'h0):(1'h0)] : reg13)));
          reg16 <= $unsigned((reg11[(3'h4):(2'h2)] ?
              {(8'ha7)} : {reg13, $signed(wire0[(2'h2):(1'h1)])}));
        end
    end
  assign wire17 = (((reg10[(2'h2):(1'h1)] * wire3[(3'h4):(3'h4)]) <= reg16[(3'h7):(1'h0)]) ?
                      (!$signed({(wire3 && wire1), (wire4 | reg10)})) : wire5);
  assign wire18 = $unsigned((wire5 + (~^(-(!wire2)))));
  always
    @(posedge clk) begin
      reg19 <= (^~(~|(~&({reg7} ? (wire18 != (8'hba)) : reg14))));
      reg20 <= ((&reg11) ?
          ($signed(((reg19 & reg9) && (reg16 - (8'h9c)))) ?
              ({((8'hbd) ?
                      reg14 : wire4)} ^ $unsigned((|reg13))) : ((~&$signed(reg14)) != $signed((reg15 ?
                  (8'hbe) : wire1)))) : reg14);
      reg21 <= wire0[(2'h3):(2'h3)];
      reg22 <= wire17;
    end
  always
    @(posedge clk) begin
      reg23 <= {$unsigned(reg7), $signed(reg20[(4'hc):(4'h8)])};
      reg24 <= reg12;
    end
  assign wire25 = wire17[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      if ($signed({reg8, reg22}))
        begin
          if ($signed($unsigned(reg6[(3'h5):(2'h2)])))
            begin
              reg26 <= {((((-wire25) ^~ $signed(reg11)) && $signed(((8'had) << reg7))) + reg14[(3'h5):(1'h1)])};
              reg27 <= $unsigned($unsigned({(8'h9c)}));
              reg28 <= wire25;
            end
          else
            begin
              reg26 <= $unsigned((|wire0));
            end
          reg29 <= {((~|wire4) < {(|{reg13, reg20})}),
              ($signed($signed((reg28 >>> reg7))) ?
                  reg20 : (~^$signed({reg23})))};
          if (reg8)
            begin
              reg30 <= $unsigned((~&wire3));
              reg31 <= reg22[(3'h4):(1'h0)];
              reg32 <= $signed(reg20);
            end
          else
            begin
              reg30 <= reg29[(1'h0):(1'h0)];
              reg31 <= reg6[(3'h7):(2'h2)];
              reg32 <= $signed(wire3[(2'h2):(2'h2)]);
            end
        end
      else
        begin
          reg26 <= wire1[(2'h2):(1'h1)];
          reg27 <= reg30;
          reg28 <= wire2;
          reg29 <= reg28[(4'hb):(3'h7)];
          reg30 <= {(~reg22)};
        end
      reg33 <= wire5;
    end
  assign wire34 = $signed((reg12 ?
                      reg30[(3'h7):(3'h7)] : wire3[(4'ha):(3'h7)]));
  assign wire35 = wire1[(1'h1):(1'h1)];
  assign wire36 = $signed((^~$unsigned({$signed(reg14), reg20})));
  always
    @(posedge clk) begin
      reg37 <= reg24[(4'h8):(1'h1)];
      if ((((!wire36[(4'ha):(3'h6)]) ?
              (~|(8'ha1)) : {((^reg24) ? $signed(wire4) : $unsigned((8'hbd))),
                  (|(reg7 ? reg11 : reg20))}) ?
          (reg11 ^~ {$signed(reg33),
              reg27[(3'h5):(2'h2)]}) : ((reg13[(3'h5):(1'h1)] ?
                  (~reg6[(1'h0):(1'h0)]) : {$unsigned(reg27),
                      (wire2 ? wire35 : wire4)}) ?
              {wire2[(1'h1):(1'h1)],
                  ((7'h41) ?
                      (reg24 == reg11) : $unsigned((8'hb9)))} : (^(+$signed(wire1))))))
        begin
          reg38 <= $signed((^({(&reg33)} >> {(-reg15)})));
        end
      else
        begin
          reg38 <= (wire36 ? (-(8'hae)) : {reg8});
          reg39 <= reg15;
          if ($signed(($signed(wire1) ?
              ($unsigned((reg33 && wire3)) * (+reg21)) : {((reg10 != reg38) ?
                      reg11 : wire3),
                  $signed((7'h41))})))
            begin
              reg40 <= ((reg14 ?
                  $signed(({(8'ha1),
                      reg39} < reg23[(4'h9):(3'h4)])) : ((reg9[(1'h0):(1'h0)] ?
                      (~reg32) : {reg37}) || reg16[(2'h2):(1'h0)])) ^~ (!reg11));
              reg41 <= (+reg39[(5'h10):(4'h8)]);
            end
          else
            begin
              reg40 <= reg16;
              reg41 <= reg27;
              reg42 <= wire36[(3'h5):(2'h2)];
              reg43 <= reg23[(1'h1):(1'h1)];
              reg44 <= $signed($signed($signed(reg12)));
            end
        end
      reg45 <= reg15[(4'h9):(4'h9)];
      reg46 <= $signed({$signed(({reg10, wire2} ?
              $signed(reg13) : {reg37, reg26})),
          ({(!reg38)} * reg28[(5'h13):(3'h5)])});
      reg47 <= reg21;
    end
  assign wire48 = ($signed(({(!reg6),
                          $unsigned(reg37)} > wire2[(2'h2):(1'h1)])) ?
                      ({wire36, wire35[(3'h4):(1'h1)]} ?
                          $unsigned(reg16[(4'h9):(3'h5)]) : ($unsigned(reg20[(4'ha):(2'h2)]) != wire36)) : $signed(($unsigned(reg9[(2'h3):(1'h0)]) ?
                          (!wire1) : reg12)));
  always
    @(posedge clk) begin
      reg49 <= {reg15};
      if ((wire36 > $signed($signed({reg24[(1'h0):(1'h0)], $signed(reg46)}))))
        begin
          if (($unsigned((|reg49[(3'h6):(1'h0)])) | (!(((reg12 ^ (8'ha8)) >>> $signed(reg16)) & (wire18 << $signed(reg28))))))
            begin
              reg50 <= $unsigned((+reg20[(4'hc):(4'hc)]));
            end
          else
            begin
              reg50 <= (~^$unsigned(wire34));
              reg51 <= (-($signed(wire17) ?
                  {({wire25,
                          reg40} + ((8'h9d) + (7'h40)))} : (wire5[(4'hd):(2'h3)] * reg50[(1'h1):(1'h1)])));
            end
          reg52 <= (reg45 ?
              wire3 : ((7'h40) <<< (($unsigned((8'h9c)) ?
                  $unsigned((8'haa)) : (-(8'h9e))) <= (~(reg42 ?
                  (7'h43) : reg19)))));
        end
      else
        begin
          reg50 <= ((($signed(wire48[(2'h2):(1'h1)]) <= ($unsigned(reg41) ?
                      reg42 : reg24)) ?
                  $unsigned(($unsigned(wire17) != $signed(wire0))) : wire25) ?
              reg46 : reg31);
          reg51 <= reg29[(2'h3):(2'h2)];
          if (((^~(((wire2 ? wire1 : reg28) || ((7'h40) & reg21)) ?
              reg26[(3'h6):(2'h2)] : ($signed((8'had)) ?
                  (-(8'haf)) : reg10))) << (reg21 >= (~reg22[(5'h10):(4'hc)]))))
            begin
              reg52 <= reg8;
              reg53 <= wire2;
              reg54 <= reg31;
              reg55 <= reg47[(2'h3):(1'h0)];
              reg56 <= reg42[(3'h6):(1'h1)];
            end
          else
            begin
              reg52 <= (7'h40);
              reg53 <= {reg47[(4'hf):(3'h6)]};
              reg54 <= (~^wire0);
            end
          reg57 <= (^reg37[(4'hc):(4'hb)]);
        end
      if ((reg7 ?
          (+reg20[(1'h1):(1'h0)]) : (reg57 ?
              $signed(((wire1 ?
                  reg31 : reg26) > wire4[(2'h2):(1'h0)])) : $unsigned(wire25))))
        begin
          reg58 <= $signed($signed(((-$unsigned(wire4)) ? reg13 : reg54)));
          reg59 <= reg31;
          if ((~&($unsigned((8'ha8)) ?
              $signed((&reg44)) : (reg50 >>> reg21[(4'hc):(3'h4)]))))
            begin
              reg60 <= ((reg6[(3'h6):(2'h2)] >= wire34[(4'hd):(3'h6)]) ?
                  $unsigned(reg50[(1'h1):(1'h1)]) : reg54[(1'h1):(1'h0)]);
              reg61 <= $signed((($signed((reg42 ?
                      (8'hb9) : reg26)) + (^reg23[(4'hc):(4'ha)])) ?
                  (reg33 <<< (-((8'haa) ?
                      (7'h43) : reg32))) : {($signed(reg16) ?
                          (reg46 == wire2) : ((8'haf) << reg22))}));
              reg62 <= $unsigned((~&(~^$unsigned($signed(reg7)))));
              reg63 <= (^~(|(reg16[(1'h0):(1'h0)] ?
                  ($signed(reg49) ?
                      $unsigned(wire34) : {reg57,
                          reg32}) : $unsigned(reg6[(2'h2):(1'h1)]))));
              reg64 <= $unsigned($signed((reg37 - (reg22[(4'hc):(1'h0)] ?
                  $unsigned(reg50) : (&reg15)))));
            end
          else
            begin
              reg60 <= (^~wire4);
              reg61 <= (~^{$unsigned(reg9)});
            end
          reg65 <= (!reg19);
        end
      else
        begin
          reg58 <= (-(reg11[(3'h4):(1'h0)] != reg43[(3'h7):(2'h2)]));
          reg59 <= $signed({$signed($signed(((8'had) <<< reg33)))});
          reg60 <= $unsigned({reg29[(4'ha):(3'h7)],
              (^$signed((wire18 ? reg59 : reg7)))});
        end
      if ((8'ha7))
        begin
          reg66 <= $unsigned((&reg63));
          reg67 <= reg26[(3'h6):(2'h2)];
        end
      else
        begin
          reg66 <= reg33;
          reg67 <= reg49;
        end
    end
  assign wire68 = (!wire17[(1'h0):(1'h0)]);
  assign wire69 = ((&$unsigned(wire5[(3'h4):(2'h3)])) ?
                      ((wire48[(1'h0):(1'h0)] <<< wire48) * ($signed(reg53) << {$unsigned(reg45)})) : (+reg45[(4'hb):(1'h1)]));
  assign wire70 = ((+$signed(($unsigned(wire5) && reg54))) ?
                      ({(wire18 ?
                              (reg43 ? reg42 : reg30) : (reg50 ?
                                  wire18 : reg24)),
                          reg47[(5'h12):(4'h8)]} > (reg12[(3'h4):(1'h0)] ?
                          (&reg14) : ((|reg27) && (wire2 <<< reg11)))) : {(((reg23 ?
                                      wire5 : reg62) ?
                                  (wire34 <= (8'ha0)) : {(8'haa)}) ?
                              ((8'ha4) == reg19) : $unsigned((reg21 ?
                                  (8'h9d) : (8'hb5))))});
  always
    @(posedge clk) begin
      reg71 <= wire68[(5'h14):(1'h0)];
      reg72 <= ((~reg16) ?
          reg39 : ((|reg52[(4'h8):(4'h8)]) >>> ((|(wire18 ?
              reg59 : wire18)) ~^ {$unsigned(wire69), {(8'hb4), reg27}})));
      reg73 <= {wire1[(1'h1):(1'h1)], reg15};
      reg74 <= (8'hb2);
      reg75 <= ((({reg57} ? reg54[(2'h2):(2'h2)] : (-$signed(reg29))) ?
              ({$unsigned(reg8), $signed(reg42)} > reg46) : (|$unsigned((reg57 ?
                  wire68 : reg19)))) ?
          (~$signed({reg63, ((8'ha9) ? reg8 : reg59)})) : (reg71 ?
              ($unsigned((^reg13)) ?
                  $unsigned($signed(reg44)) : wire36[(3'h5):(2'h3)]) : reg16));
    end
  module76 #() modinst88 (.y(wire87), .wire77(reg74), .wire81(wire0), .wire80(wire18), .clk(clk), .wire78(reg16), .wire79(wire1));
  assign wire89 = (($signed((^~(^reg38))) ?
                      {((reg59 || reg32) == $signed(wire18)),
                          reg58} : reg44[(2'h2):(2'h2)]) | reg47);
  assign wire90 = (reg15[(5'h13):(4'he)] ?
                      ((reg38[(4'he):(4'ha)] ?
                          (reg10[(1'h1):(1'h0)] ?
                              (reg62 == wire2) : $signed(reg63)) : reg21[(4'ha):(1'h1)]) <<< reg39[(2'h2):(1'h0)]) : reg8[(2'h2):(2'h2)]);
  assign wire91 = (wire0[(3'h5):(2'h3)] ?
                      (reg42[(3'h5):(3'h5)] == (~^$unsigned((reg53 + reg29)))) : (((~&$signed(reg26)) < $unsigned(reg50[(1'h0):(1'h0)])) - (8'ha9)));
endmodule

module module76
#(parameter param86 = (8'ha5))
(y, clk, wire81, wire80, wire79, wire78, wire77);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire81;
  input wire signed [(4'he):(1'h0)] wire80;
  input wire [(2'h3):(1'h0)] wire79;
  input wire [(3'h6):(1'h0)] wire78;
  input wire signed [(3'h5):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire84;
  wire [(3'h7):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire82;
  assign y = {wire85, wire84, wire83, wire82, (1'h0)};
  assign wire82 = {($signed(((wire79 < wire79) ~^ (wire79 ?
                              (8'hbf) : wire78))) ?
                          ((^wire79) ?
                              (|wire80[(4'h9):(1'h0)]) : wire78) : $signed($signed((+(8'ha8)))))};
  assign wire83 = $signed(wire80[(3'h5):(1'h1)]);
  assign wire84 = (wire83[(3'h4):(2'h3)] ?
                      (wire82 ?
                          (~|wire83[(2'h3):(1'h0)]) : (wire80[(1'h0):(1'h0)] + ((wire81 ?
                                  wire82 : wire79) ?
                              wire80[(2'h3):(1'h0)] : (8'hbf)))) : ($unsigned(wire77) ?
                          (!wire80) : $signed((~^wire83))));
  assign wire85 = ((~&wire77[(3'h5):(1'h1)]) * (|wire81));
endmodule
