module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1d4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire56;
  wire [(3'h6):(1'h0)] wire55;
  wire [(4'hb):(1'h0)] wire54;
  wire signed [(4'h9):(1'h0)] wire53;
  wire [(4'h8):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire38;
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  assign y = {wire67,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire5,
                 wire6,
                 wire7,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire38,
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
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg8,
                 reg9,
                 reg10,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = $signed($unsigned($unsigned((&(wire2 ? (8'hb7) : wire5)))));
  assign wire7 = $signed(wire1);
  always
    @(posedge clk) begin
      reg8 <= ($signed((((wire1 ?
              wire7 : wire6) * $signed(wire4)) < ((~&wire3) >>> $signed(wire0)))) ?
          ({wire4[(3'h6):(3'h5)], {$signed(wire7)}} ?
              (+($signed(wire1) ?
                  wire0[(1'h0):(1'h0)] : (wire0 ?
                      wire1 : wire7))) : ({(+wire5)} == $signed((wire6 ?
                  wire5 : wire7)))) : $unsigned($signed(($signed((7'h44)) <<< (wire2 >>> wire2)))));
      reg9 <= $signed(($signed(((reg8 ? wire7 : wire3) ?
              (|(8'hb3)) : (wire2 ? reg8 : wire4))) ?
          ($signed({reg8, wire6}) ?
              $unsigned((wire2 ?
                  wire7 : wire0)) : $signed(wire1)) : ($unsigned((wire7 & wire7)) ?
              (wire5 ?
                  (wire6 ?
                      wire2 : (8'hab)) : reg8) : (((8'h9d) <<< reg8) == (~&wire7)))));
      reg10 <= $unsigned((wire5 ?
          $unsigned($signed(wire1[(2'h2):(1'h1)])) : ({reg8} + {(wire5 ?
                  wire4 : wire6),
              $signed(wire0)})));
    end
  assign wire11 = (wire7[(4'ha):(2'h3)] ?
                      $signed($unsigned((wire6 ?
                          reg8[(4'ha):(2'h3)] : (wire0 ?
                              wire2 : reg9)))) : (~^((~((8'ha5) ?
                              wire3 : wire0)) ?
                          reg10 : $signed((wire1 ? (8'hae) : reg9)))));
  assign wire12 = wire1;
  assign wire13 = $unsigned($unsigned(($unsigned((~^wire12)) ?
                      (8'h9c) : $unsigned(wire3))));
  assign wire14 = $unsigned($signed(reg9[(4'he):(4'hd)]));
  assign wire15 = wire11[(2'h2):(1'h1)];
  module16 #() modinst39 (.clk(clk), .wire17(wire11), .y(wire38), .wire19(wire2), .wire20(wire5), .wire18(reg10));
  always
    @(posedge clk) begin
      reg40 <= wire6;
      reg41 <= $unsigned(((({wire15} - (&reg10)) ?
              reg40[(4'h9):(1'h0)] : ($signed(wire11) ?
                  $signed(wire0) : ((8'hb0) <<< wire38))) ?
          (wire14 ^ {(8'hb4),
              $signed(wire4)}) : ((^~wire6[(2'h2):(2'h2)]) < reg9)));
      reg42 <= reg9;
      reg43 <= $signed(((((wire2 ^~ (8'ha5)) == {(8'ha2), (8'h9c)}) ?
          (+wire4) : wire12) << ({wire12[(4'hc):(3'h6)]} ?
          wire0[(3'h6):(1'h1)] : reg40)));
    end
  always
    @(posedge clk) begin
      reg44 <= ($signed(((-{reg8}) ^ wire14[(2'h3):(2'h3)])) ?
          ((~&((!reg43) - $unsigned(wire7))) ^ $unsigned($unsigned((reg41 < wire7)))) : (((wire12 ?
                  wire5 : wire38[(3'h5):(3'h5)]) + ($signed(wire2) ^~ (wire12 - reg9))) ?
              {(!(wire1 || wire38))} : (((8'hbe) * $unsigned((8'hbb))) ?
                  reg43[(4'hc):(4'h8)] : wire7[(2'h2):(1'h0)])));
      reg45 <= (8'ha9);
      reg46 <= $signed(wire0[(1'h1):(1'h1)]);
      if (($unsigned((&{(8'haa), $signed(wire14)})) ?
          $unsigned(wire15) : wire2))
        begin
          reg47 <= {$unsigned($signed($unsigned(reg40)))};
        end
      else
        begin
          reg47 <= reg47[(3'h4):(2'h2)];
          reg48 <= wire15[(5'h10):(4'hf)];
          if (((^~(^$signed(reg46))) ?
              {$unsigned($unsigned((reg46 ?
                      (8'ha2) : wire7)))} : $unsigned((&($signed(reg47) ?
                  (7'h42) : reg44[(1'h1):(1'h0)])))))
            begin
              reg49 <= {($signed((wire2 ?
                      (wire1 ?
                          reg45 : wire15) : (8'hae))) >> $signed($signed(reg40[(3'h5):(3'h4)])))};
              reg50 <= ($signed((($unsigned(wire6) > (8'ha1)) ?
                  $unsigned($unsigned(reg8)) : {wire6,
                      (reg41 ?
                          reg43 : wire15)})) <= $signed(({$signed((8'hae))} ?
                  ($unsigned(wire15) ? $signed(wire15) : (8'ha0)) : wire7)));
            end
          else
            begin
              reg49 <= (wire6 ^ {wire1[(1'h1):(1'h1)], reg9[(4'hc):(4'hc)]});
              reg50 <= {$signed((~^((wire11 ? reg9 : reg45) ?
                      $signed(reg45) : (8'hab))))};
            end
          reg51 <= (+wire14[(1'h1):(1'h1)]);
          reg52 <= $unsigned(reg46);
        end
    end
  assign wire53 = $signed(wire1);
  assign wire54 = wire12;
  assign wire55 = reg47[(1'h0):(1'h0)];
  assign wire56 = wire15[(4'hd):(3'h7)];
  always
    @(posedge clk) begin
      reg57 <= (|reg47);
      reg58 <= $signed({(~wire38),
          (reg45[(1'h0):(1'h0)] ? (^~$unsigned(reg48)) : (!$signed(reg51)))});
      reg59 <= $unsigned(reg10);
      if (wire12)
        begin
          if ((+reg9))
            begin
              reg60 <= wire5[(2'h3):(2'h2)];
              reg61 <= {((wire5[(3'h4):(2'h2)] ?
                          $signed(reg43) : wire12[(4'h9):(3'h6)]) ?
                      $signed(wire6) : reg40[(4'ha):(4'h8)]),
                  reg52[(2'h2):(1'h1)]};
              reg62 <= {(($signed(((8'hbc) ? wire13 : reg43)) ?
                          (reg52 != (&reg8)) : $unsigned((&wire3))) ?
                      reg10 : wire55[(2'h3):(2'h2)]),
                  (((wire2[(4'hd):(2'h2)] == wire0) + (wire3 ?
                          ((8'ha6) != wire54) : (wire0 ? reg43 : wire15))) ?
                      $signed(reg45) : $signed(wire11))};
              reg63 <= wire11[(4'hf):(4'h8)];
              reg64 <= (-{(reg52 ?
                      $unsigned({reg52}) : ($unsigned(reg51) ?
                          (~reg60) : (wire53 ? wire4 : wire11)))});
            end
          else
            begin
              reg60 <= reg9;
              reg61 <= reg42[(1'h1):(1'h1)];
              reg62 <= $signed((~^$unsigned((~|{reg44, wire4}))));
              reg63 <= $signed($signed(wire6));
              reg64 <= (+$unsigned(((reg58 > reg10) >> ((|reg43) + $unsigned(wire14)))));
            end
          reg65 <= reg62[(4'hc):(1'h0)];
        end
      else
        begin
          reg60 <= ($signed(((+(wire6 << reg41)) >= wire3[(2'h3):(1'h1)])) ?
              ((~|(((8'hb3) ? (7'h43) : reg61) ?
                  (+reg59) : $signed((8'h9d)))) | $unsigned((~|(+wire3)))) : wire4[(4'hd):(4'h8)]);
          reg61 <= (wire13 & reg65[(2'h2):(1'h1)]);
          reg62 <= $unsigned(({$signed($signed(reg10)),
                  (^~wire56[(1'h0):(1'h0)])} ?
              $unsigned(reg47) : wire3[(4'hb):(4'hb)]));
          reg63 <= (reg51 ?
              (&($unsigned(reg48) < reg48[(1'h1):(1'h1)])) : $unsigned($signed(wire54[(3'h6):(2'h2)])));
        end
      reg66 <= (((^~$signed((8'h9e))) ?
          $signed($unsigned((&reg9))) : wire5) - reg45);
    end
  assign wire67 = ((|(((reg57 ?
                      wire4 : reg51) ~^ wire4) <<< {reg47[(3'h6):(1'h1)],
                      $signed(wire12)})) - (^($unsigned((~^reg45)) ?
                      $signed({wire2}) : reg50)));
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire20;
  input wire [(5'h12):(1'h0)] wire19;
  input wire [(3'h7):(1'h0)] wire18;
  input wire signed [(5'h12):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(5'h14):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire28;
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg21 <= wire20;
      if ($unsigned((8'hb1)))
        begin
          reg22 <= {(((!$signed(wire20)) ?
                  ((wire19 & (8'h9f)) << $unsigned(wire19)) : ({wire17} ^~ $signed(wire18))) >> (^~$signed(wire20))),
              $signed($signed(wire17[(4'h8):(4'h8)]))};
          if ($unsigned($signed(($signed((reg22 ?
              reg21 : wire19)) >= {reg22[(4'h9):(3'h7)]}))))
            begin
              reg23 <= {(~^wire20)};
              reg24 <= {wire17[(4'he):(4'hd)], reg21[(4'hc):(3'h7)]};
              reg25 <= reg24[(2'h2):(1'h1)];
              reg26 <= {($signed($signed($unsigned(reg25))) ?
                      {wire18,
                          (~^(reg22 >>> reg24))} : ($unsigned(reg25) ^ $signed(((8'hb3) > wire18)))),
                  ((8'hbe) >>> {(reg21 ^~ (|(8'ha7))), {wire17, (^reg22)}})};
              reg27 <= wire17;
            end
          else
            begin
              reg23 <= wire19;
            end
        end
      else
        begin
          reg22 <= (((reg24 && $unsigned($signed(reg26))) >> (wire18[(3'h6):(2'h3)] << $signed((wire20 > reg24)))) ?
              (({$signed((8'hb9)), {reg27}} ?
                  $unsigned($unsigned(reg26)) : $signed({wire20,
                      wire17})) >= (+reg22[(4'hb):(3'h6)])) : $unsigned(((reg23[(4'ha):(3'h6)] ?
                  (reg25 ?
                      reg22 : (8'ha5)) : (~reg26)) == $unsigned($unsigned(reg26)))));
          reg23 <= ((^((&$signed(reg23)) ?
                  (~&wire19[(4'h9):(3'h7)]) : (&reg22))) ?
              $unsigned(((+$signed(reg25)) <<< (+(8'hb1)))) : (reg25[(1'h1):(1'h1)] | $signed($unsigned(reg22))));
        end
    end
  assign wire28 = $signed(({reg25[(1'h0):(1'h0)]} ?
                      (wire19[(4'hb):(2'h3)] > {(reg25 ?
                              reg21 : (8'ha7))}) : (({reg22,
                              reg22} & (wire18 - reg26)) ?
                          (reg26[(1'h1):(1'h0)] ?
                              $signed(reg25) : $unsigned(reg21)) : (!(reg23 ?
                              reg27 : reg26)))));
  assign wire29 = $unsigned(((((~|wire19) <= (wire19 != wire28)) ?
                          ($signed(reg22) ?
                              reg21 : (wire17 >> wire28)) : $signed(reg27[(4'hc):(2'h3)])) ?
                      reg24[(2'h2):(1'h0)] : (((reg27 ? reg24 : (7'h42)) ?
                              (!reg23) : (wire18 << (8'h9f))) ?
                          (&reg24) : ({wire18, (8'ha2)} ? (8'ha2) : wire17))));
  assign wire30 = (((^(^~{wire17})) != (^~(((8'ha1) ?
                          reg25 : wire28) < $signed(reg21)))) ?
                      (wire17[(4'hd):(4'ha)] ?
                          (reg22 ?
                              $signed(reg27) : ({wire17, reg26} ?
                                  (reg25 ?
                                      reg22 : wire17) : wire19[(2'h2):(1'h0)])) : wire29[(3'h5):(2'h2)]) : ((reg21 >> (~|(reg24 && reg21))) << $unsigned({(reg22 ?
                              (8'hbe) : reg25)})));
  assign wire31 = $signed($unsigned($signed((^(wire28 ? wire28 : wire17)))));
  assign wire32 = {(reg24[(3'h4):(2'h3)] != $signed($unsigned({wire30})))};
  assign wire33 = reg25;
  assign wire34 = $unsigned(({($signed(reg21) ? reg25 : $unsigned(wire30)),
                          (8'hba)} ?
                      (reg22 ^ ((wire17 ?
                          reg23 : wire20) * (!(8'hb1)))) : reg22[(4'h8):(4'h8)]));
  assign wire35 = reg22;
  assign wire36 = reg21;
  assign wire37 = (8'hbc);
endmodule
