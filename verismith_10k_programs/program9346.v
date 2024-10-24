module top
#(parameter param81 = ((~|(7'h40)) ? {({((8'hbf) >>> (8'ha5))} ? (((8'hb7) != (8'hb5)) < ((8'h9f) ^~ (8'haf))) : ((|(8'h9f)) - ((8'hb8) >>> (8'hba)))), (~|(|((8'ha6) - (8'ha1))))} : {({((8'h9e) * (8'hae))} >>> ((~|(8'hbd)) << ((8'ha8) && (8'hb6)))), (({(7'h40)} ? ((8'hab) || (8'ha8)) : ((8'hba) + (7'h41))) ? (+((8'hb6) < (8'hbb))) : {((8'h9d) ? (8'hb4) : (8'hb7)), {(8'hae), (7'h40)}})}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire80;
  wire [(4'h9):(1'h0)] wire79;
  wire [(4'hf):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire76,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = ($signed({(8'h9f)}) || (~((((8'ha3) ? wire3 : wire1) ?
                         (+(8'hbd)) : (wire0 ? (8'hac) : wire3)) ?
                     $unsigned(((7'h41) > (8'ha9))) : $unsigned($unsigned(wire1)))));
  assign wire5 = (wire0 ~^ wire4[(5'h13):(3'h4)]);
  assign wire6 = wire0[(3'h7):(3'h7)];
  assign wire7 = ({wire3[(3'h4):(3'h4)]} > {$unsigned((((8'hbd) ?
                         wire3 : wire2) >> wire3))});
  assign wire8 = (~$signed(wire0));
  always
    @(posedge clk) begin
      reg9 <= (^(~((wire2[(4'h9):(4'h9)] >= {(8'ha4), wire1}) ?
          $signed((wire7 ? (8'hbe) : wire4)) : wire2)));
      reg10 <= wire5[(4'h8):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg11 <= wire4[(4'h8):(4'h8)];
      reg12 <= $signed(reg9[(3'h7):(3'h7)]);
      if ($signed((|wire3[(4'h8):(3'h6)])))
        begin
          reg13 <= reg10[(2'h3):(2'h2)];
        end
      else
        begin
          reg13 <= wire3;
        end
      reg14 <= ((|wire6[(3'h7):(1'h0)]) & {$signed({(wire5 ? reg12 : wire7),
              $unsigned(reg13)}),
          reg9[(3'h7):(1'h0)]});
    end
  module15 #() modinst77 (wire76, clk, wire5, wire4, reg11, reg14);
  assign wire78 = $unsigned(wire8[(3'h6):(3'h5)]);
  assign wire79 = (^~({((reg11 - wire2) ? (wire7 && reg14) : $signed((7'h43))),
                          ((reg9 ? wire0 : reg11) ?
                              wire0[(3'h4):(1'h1)] : wire7[(3'h6):(3'h6)])} ?
                      ({wire0[(1'h0):(1'h0)], $signed(wire1)} && (&{(8'hab),
                          reg13})) : ($signed($unsigned(wire1)) ?
                          ($signed((8'hb0)) ?
                              wire0[(2'h2):(1'h1)] : (^(8'h9c))) : $unsigned((wire6 && wire0)))));
  assign wire80 = wire6[(2'h2):(1'h0)];
endmodule

module module15
#(parameter param75 = (~^{{(8'hbb)}}))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h25c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire19;
  input wire [(5'h15):(1'h0)] wire18;
  input wire signed [(2'h3):(1'h0)] wire17;
  input wire signed [(5'h12):(1'h0)] wire16;
  wire signed [(4'h8):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire72;
  wire signed [(3'h5):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire56;
  wire signed [(4'hb):(1'h0)] wire44;
  wire signed [(3'h4):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire27;
  wire [(3'h4):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire20;
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg [(2'h3):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire57,
                 wire56,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire21,
                 wire20,
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
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire20 = $signed(((((wire16 >= wire18) && (wire16 ? wire18 : wire17)) ?
                          wire16[(4'ha):(2'h2)] : ($signed(wire16) && wire19[(4'h9):(2'h3)])) ?
                      wire16 : {$unsigned(wire19)}));
  assign wire21 = ($unsigned((~(&wire18))) && wire20);
  always
    @(posedge clk) begin
      reg22 <= (($unsigned(((!wire18) ?
          (wire20 ?
              wire19 : (7'h44)) : wire18[(2'h3):(1'h0)])) || (^~wire19[(4'hc):(4'ha)])) >>> $unsigned($signed($unsigned(((7'h43) > wire19)))));
      reg23 <= (^~(reg22 ^ ($signed($signed((8'hb1))) << (&(wire16 & wire20)))));
      reg24 <= (wire17 >= wire17);
      if ((^$unsigned(wire16)))
        begin
          reg25 <= $signed((wire21[(3'h6):(3'h4)] && (((reg24 ~^ wire19) ?
                  $unsigned(reg24) : $signed((8'hb4))) ?
              (-(reg23 || reg23)) : $signed((reg22 ? wire17 : reg23)))));
        end
      else
        begin
          reg25 <= wire16;
        end
    end
  assign wire26 = $unsigned(reg23[(4'hf):(4'ha)]);
  assign wire27 = (reg24[(1'h0):(1'h0)] == (|($unsigned(wire19[(4'h9):(4'h8)]) ?
                      (&$signed(wire18)) : $signed(wire26[(2'h2):(2'h2)]))));
  assign wire28 = reg25[(1'h0):(1'h0)];
  assign wire29 = (($signed(wire16[(4'h9):(4'h9)]) <= {$unsigned((wire17 <= reg22))}) ?
                      $signed({$signed((!wire26))}) : (~($signed((~&wire21)) ?
                          reg24 : ((reg25 ?
                              (8'hba) : wire21) ^ (wire18 <= wire17)))));
  always
    @(posedge clk) begin
      reg30 <= wire21[(3'h4):(1'h0)];
      reg31 <= (((8'hb5) ?
          (+$unsigned($signed(wire27))) : $signed((8'hb9))) != $unsigned($unsigned(($unsigned(reg23) >>> $unsigned(wire17)))));
      reg32 <= wire18[(5'h11):(4'hd)];
      reg33 <= ((wire19 ? $signed($unsigned({wire27, wire27})) : wire16) ?
          {$unsigned(reg32[(2'h3):(1'h0)])} : ($unsigned((~|reg24[(2'h3):(2'h2)])) ?
              (^~(~&(^wire21))) : $unsigned(reg22)));
      if (($signed(wire20) ?
          (~|$signed(($signed(reg23) ?
              (wire21 ? wire27 : wire19) : (8'hba)))) : wire17[(1'h1):(1'h0)]))
        begin
          reg34 <= $signed($signed(((^~((8'hb6) >= reg23)) ?
              {(^wire18), {reg23, reg31}} : (~^wire16[(2'h2):(1'h1)]))));
          reg35 <= (((|$unsigned((wire21 ? reg24 : reg33))) ?
                  {(8'hbd)} : ((8'hac) ?
                      {(reg31 ? (7'h44) : reg30)} : (&$unsigned(wire26)))) ?
              wire27[(3'h6):(1'h1)] : (~|((wire18[(4'h9):(1'h1)] ?
                  $signed(reg22) : (reg31 | wire27)) >>> ($unsigned(reg25) ?
                  $signed(wire16) : $signed(reg23)))));
          reg36 <= ($unsigned(($unsigned((&reg25)) ~^ $unsigned((wire19 == reg34)))) < (reg33[(3'h5):(1'h0)] ?
              reg30 : $unsigned((!(reg22 | wire26)))));
        end
      else
        begin
          reg34 <= (wire27[(5'h11):(4'ha)] ?
              $signed(reg34) : $signed($signed(wire28)));
          if ((reg24[(3'h6):(2'h3)] ?
              ((-reg36[(5'h12):(4'h9)]) >> {($signed(reg23) == (wire28 ?
                      wire19 : reg32)),
                  reg32[(3'h5):(2'h2)]}) : reg32[(2'h3):(2'h3)]))
            begin
              reg35 <= ($signed($unsigned(wire18[(2'h2):(1'h1)])) ?
                  $signed((({reg24} > (~&wire26)) ?
                      wire21[(3'h5):(1'h1)] : (8'hb6))) : {$signed(reg36),
                      $unsigned((^((8'ha8) ? wire28 : wire29)))});
            end
          else
            begin
              reg35 <= wire20[(4'h9):(2'h3)];
              reg36 <= $signed(((($unsigned(wire20) ?
                      (~^(8'h9f)) : (wire26 << (8'ha2))) && wire19) ?
                  ({$unsigned(wire27)} * (^~{reg30,
                      reg33})) : $signed((8'hb5))));
              reg37 <= $unsigned({(wire21 ? wire21[(1'h1):(1'h0)] : reg30),
                  $signed(reg33)});
              reg38 <= reg36[(4'he):(3'h4)];
            end
          reg39 <= (|wire20[(4'h9):(4'h9)]);
        end
    end
  assign wire40 = (reg35 >> reg25[(2'h2):(2'h2)]);
  assign wire41 = (-reg25);
  assign wire42 = $unsigned(wire29[(4'hb):(1'h0)]);
  assign wire43 = (~&(8'hbe));
  assign wire44 = reg23[(4'hd):(4'h9)];
  always
    @(posedge clk) begin
      reg45 <= reg35[(5'h10):(5'h10)];
      if ((wire26[(3'h4):(2'h2)] >> ((!wire18) * (8'hb0))))
        begin
          reg46 <= (wire20 ?
              $unsigned(((reg39[(1'h0):(1'h0)] < wire19[(1'h0):(1'h0)]) <= $unsigned((^~reg38)))) : wire44[(3'h7):(3'h6)]);
          reg47 <= wire44;
          if (reg37)
            begin
              reg48 <= wire41;
              reg49 <= $unsigned(((($signed((8'ha3)) ?
                      {reg22} : (reg31 >= wire41)) ?
                  $signed($signed(wire18)) : ({reg39,
                      reg23} == wire29[(2'h3):(1'h1)])) < $signed((!wire26[(1'h1):(1'h1)]))));
              reg50 <= $signed((~&(wire17[(1'h0):(1'h0)] ?
                  reg31[(1'h1):(1'h1)] : $unsigned($signed(wire20)))));
            end
          else
            begin
              reg48 <= (($unsigned(reg38[(3'h4):(1'h0)]) | (({reg38,
                      (8'haa)} ~^ (reg45 ? wire17 : wire42)) ?
                  ($signed(wire26) <<< reg30) : $signed((reg36 - wire41)))) <<< ($unsigned($signed({wire16})) < wire19[(4'h8):(3'h4)]));
              reg49 <= (~^{$signed(wire18)});
              reg50 <= $signed(wire20[(3'h7):(1'h0)]);
            end
          if ($signed(($unsigned(($signed(wire40) ?
                  wire28 : $unsigned(reg37))) ?
              (^reg24) : $signed((wire21 ? $unsigned(reg23) : (~&reg39))))))
            begin
              reg51 <= (($signed($signed(((8'hb8) ? wire16 : wire44))) ?
                  (^~(!wire21)) : $signed(((wire26 ? reg35 : (8'hbb)) ?
                      (reg31 ? wire21 : (8'hb2)) : ((7'h40) ?
                          reg22 : reg49)))) && $signed(reg25[(2'h2):(1'h1)]));
              reg52 <= {reg48[(4'ha):(4'h9)]};
              reg53 <= wire41;
            end
          else
            begin
              reg51 <= {(reg38[(3'h7):(3'h7)] << ($signed(wire42) + (-$unsigned(reg25))))};
              reg52 <= (!$unsigned((($signed(wire40) & wire41[(4'h9):(1'h0)]) ^ wire42[(2'h3):(1'h1)])));
              reg53 <= wire16;
              reg54 <= (^{wire19});
            end
          reg55 <= wire40;
        end
      else
        begin
          reg46 <= (wire20 + $signed((!(reg33[(5'h10):(4'hd)] ?
              (|reg49) : {reg32}))));
          reg47 <= $unsigned(reg45[(4'h9):(3'h5)]);
          reg48 <= ({({$signed(wire41), (~|reg38)} ?
                  (reg37 >= $unsigned(reg53)) : (wire28 << (-reg33))),
              ((reg52 ? reg53[(4'h9):(3'h5)] : (wire16 < reg46)) ?
                  $signed(reg32[(3'h6):(2'h2)]) : $signed((reg39 ?
                      reg37 : wire18)))} << ($unsigned({reg33[(2'h3):(1'h0)]}) ?
              (reg30[(1'h1):(1'h0)] ?
                  $unsigned((|reg37)) : (|{reg45, wire41})) : reg30));
          reg49 <= (reg38 ?
              $signed(($unsigned(reg50) > reg54[(1'h0):(1'h0)])) : reg31[(1'h1):(1'h1)]);
        end
    end
  assign wire56 = ((-$signed($unsigned((wire28 ? wire40 : reg35)))) ^ wire19);
  assign wire57 = $unsigned((8'hb5));
  always
    @(posedge clk) begin
      if (((wire16 ?
          (reg51[(3'h4):(2'h3)] ?
              $signed({reg46, reg39}) : (~|{reg48})) : (($signed((8'ha2)) ?
                  {reg23} : $unsigned(wire26)) ?
              ((wire19 == reg53) ?
                  $unsigned(wire19) : {reg47,
                      (8'hb1)}) : wire40[(1'h1):(1'h0)])) < reg24))
        begin
          if (($unsigned($unsigned((8'h9d))) ?
              $unsigned(wire42[(2'h3):(1'h0)]) : reg34))
            begin
              reg58 <= $unsigned((((wire26 ? (&wire19) : reg24[(2'h3):(2'h3)]) ?
                  wire44[(2'h2):(2'h2)] : $signed((reg34 ?
                      (8'hb0) : reg37))) >> $signed({(-(7'h41))})));
              reg59 <= $signed(reg46[(4'hc):(3'h5)]);
              reg60 <= ($signed(reg49[(2'h3):(2'h2)]) ?
                  (&($signed($unsigned(reg47)) || (wire41[(4'ha):(3'h5)] ?
                      (wire43 ?
                          reg39 : reg49) : wire42[(2'h3):(1'h1)]))) : reg25[(2'h3):(1'h0)]);
              reg61 <= {(reg34 ?
                      $signed(($signed(wire40) ?
                          {reg48} : $unsigned(reg58))) : ((reg50[(4'h9):(2'h2)] ?
                              reg22 : wire56[(3'h7):(1'h0)]) ?
                          (~|$signed(reg60)) : reg22))};
            end
          else
            begin
              reg58 <= reg51;
              reg59 <= (8'hbd);
              reg60 <= $signed(((reg59[(2'h3):(2'h3)] ?
                      reg22 : {{wire29}, wire18[(4'he):(4'h8)]}) ?
                  (($signed(reg30) ?
                      (reg59 ?
                          wire26 : reg33) : wire26[(1'h1):(1'h1)]) == $unsigned((reg31 - reg47))) : $signed(reg48[(4'h9):(4'h9)])));
            end
          reg62 <= {($unsigned(reg47[(3'h5):(2'h3)]) ?
                  ($signed($unsigned((8'hb4))) ?
                      $unsigned(((8'hb0) > reg51)) : (8'ha3)) : reg30),
              ((~$signed((reg51 ^ wire21))) | $signed(((wire16 >>> reg31) > (reg38 ?
                  reg23 : reg23))))};
          reg63 <= wire16[(1'h1):(1'h0)];
        end
      else
        begin
          reg58 <= reg30[(1'h0):(1'h0)];
        end
      reg64 <= wire57[(1'h1):(1'h0)];
      reg65 <= reg52;
      if (($unsigned((^$unsigned(reg55))) - wire43))
        begin
          if (reg62)
            begin
              reg66 <= reg31;
              reg67 <= wire20[(2'h3):(1'h0)];
            end
          else
            begin
              reg66 <= $signed(reg62);
              reg67 <= $unsigned(((!$signed(reg22[(1'h1):(1'h0)])) ?
                  ($signed((reg24 && reg37)) + $signed((wire16 ?
                      (8'ha0) : (8'hbb)))) : wire19[(3'h6):(3'h5)]));
            end
          if ((-(wire19[(1'h0):(1'h0)] >> $signed($unsigned($signed(reg49))))))
            begin
              reg68 <= $unsigned($unsigned(reg60[(2'h3):(2'h2)]));
              reg69 <= $signed(reg65);
              reg70 <= {wire17};
              reg71 <= {wire26[(2'h2):(1'h1)],
                  {($unsigned($unsigned((7'h40))) ?
                          wire29[(2'h2):(1'h0)] : reg63),
                      (((reg39 ? reg35 : reg31) == (~^(8'hb9))) ?
                          wire41[(4'ha):(1'h1)] : ($unsigned(reg61) ?
                              reg52[(2'h2):(2'h2)] : ((8'hae) - reg61)))}};
            end
          else
            begin
              reg68 <= $unsigned((&reg22[(2'h2):(1'h0)]));
              reg69 <= ({({reg50[(1'h0):(1'h0)], {reg34, reg51}} ?
                      (~|((8'hb4) ^ reg65)) : (+reg67))} ~^ (reg65[(4'h9):(1'h1)] ?
                  (((reg63 ? reg65 : reg68) ?
                      reg68[(4'hd):(1'h1)] : (reg67 > wire42)) ^~ ({(7'h44),
                      wire27} > reg67)) : ($signed($unsigned(reg62)) ?
                      $unsigned(reg23) : ((~^reg53) < $signed(reg46)))));
            end
        end
      else
        begin
          reg66 <= $unsigned({reg24});
          reg67 <= $signed(({reg35, $signed($signed(reg55))} ?
              (~^(~&reg30)) : ($signed((reg60 ? reg55 : wire29)) ?
                  wire16[(4'he):(4'h9)] : reg48[(5'h11):(1'h1)])));
        end
    end
  assign wire72 = ($unsigned({(~|$signed(reg71)),
                      ((!wire29) ~^ {reg31, reg23})}) * (({(reg63 ?
                              reg52 : wire29),
                          (wire17 ? reg47 : reg59)} ?
                      ({reg67} == (wire26 | reg35)) : reg50[(4'h9):(1'h0)]) ^~ $signed((reg34 >= $unsigned(reg34)))));
  assign wire73 = $signed((reg24 >= $signed($unsigned(wire57))));
  assign wire74 = wire17[(1'h0):(1'h0)];
endmodule
