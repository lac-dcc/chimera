module top
#(parameter param63 = {(((-{(8'hbb), (8'hb4)}) ? (+((7'h43) | (8'hbb))) : {((8'hb6) ~^ (8'hb5))}) ? (~|(((8'hb9) > (8'ha7)) ? ((8'hae) * (8'hb9)) : ((8'hbe) < (7'h42)))) : (~(~|((8'hbb) || (8'hb8))))), (((((8'hbb) >>> (8'hbf)) << ((8'hb2) & (8'ha9))) ? {((8'haa) ? (7'h42) : (7'h43)), {(7'h44)}} : (7'h43)) | ((~(+(8'h9e))) - ((~|(8'hae)) ? {(7'h40), (8'ha5)} : ((8'hb8) * (8'hba)))))}, 
parameter param64 = (~|param63))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire62;
  wire signed [(5'h10):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire59;
  wire signed [(4'ha):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire54,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = wire0;
  module6 #() modinst55 (.wire7(wire3), .y(wire54), .wire9(wire4), .clk(clk), .wire10(wire1), .wire8(wire2));
  assign wire56 = (~({{(wire4 == (8'hab))},
                      (wire0[(2'h2):(1'h0)] ^~ (wire1 >>> wire5))} ~^ wire5[(3'h7):(3'h6)]));
  assign wire57 = wire5[(5'h10):(4'he)];
  assign wire58 = ((&wire1[(5'h10):(4'h8)]) >= wire1);
  assign wire59 = $signed(((^wire54[(1'h0):(1'h0)]) && wire3));
  assign wire60 = ($signed($signed((wire59 ?
                          $signed(wire54) : wire4[(4'he):(3'h5)]))) ?
                      (&{(wire57[(4'he):(2'h2)] ? $signed(wire2) : wire4),
                          (&wire3[(4'hd):(4'h8)])}) : (~^wire57[(4'hc):(3'h6)]));
  assign wire61 = ($unsigned({$signed($signed(wire58)),
                          (((8'hbe) + wire3) ? (8'haf) : $unsigned((7'h44)))}) ?
                      ($signed((-(wire59 ? (8'hb6) : wire57))) ?
                          (wire0[(4'ha):(4'ha)] - wire0[(4'hf):(4'h9)]) : ({(wire58 ?
                                      wire56 : wire60)} ?
                              wire58 : (wire56[(3'h7):(2'h3)] ~^ wire1))) : {($signed((wire60 ?
                              (8'ha4) : wire0)) >> wire3[(1'h1):(1'h1)]),
                          wire58});
  assign wire62 = wire59[(3'h5):(3'h4)];
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h1ce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire [(3'h4):(1'h0)] wire8;
  input wire signed [(2'h2):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire53;
  wire [(2'h3):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire50;
  wire signed [(4'hc):(1'h0)] wire49;
  wire [(4'hd):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire47;
  wire [(3'h4):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire43;
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 reg42,
                 reg41,
                 reg40,
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
                 reg29,
                 reg28,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((&(((~|{wire8, wire9}) ?
          $signed((~&(8'h9e))) : $unsigned((-wire7))) & $unsigned(wire9[(4'hf):(4'hf)]))))
        begin
          reg11 <= (&$unsigned({(~&$signed(wire9)), (^(wire7 != wire9))}));
          reg12 <= ((wire10[(4'h9):(2'h3)] - ($signed($unsigned(wire10)) ?
              $signed(reg11) : $signed((wire10 | wire8)))) ^ (8'hb5));
          reg13 <= wire8;
          reg14 <= (^(|($signed(reg13[(1'h1):(1'h0)]) & (&$unsigned(reg13)))));
        end
      else
        begin
          reg11 <= wire10[(3'h7):(1'h0)];
          if ((wire9 ?
              {$signed((((8'ha5) <= reg13) <<< $signed((7'h41)))),
                  {$signed($unsigned(wire8))}} : (^(wire10 <<< reg11))))
            begin
              reg12 <= {(8'hb3), wire9[(4'h9):(3'h5)]};
              reg13 <= (reg14[(1'h0):(1'h0)] ^~ ((~^((reg13 > wire10) >= {wire8})) ?
                  $unsigned((wire9[(3'h4):(2'h3)] != $unsigned(reg13))) : $signed(($unsigned((8'hb3)) << (reg13 ?
                      wire10 : wire7)))));
              reg14 <= reg14[(3'h4):(1'h0)];
            end
          else
            begin
              reg12 <= reg12[(3'h6):(1'h1)];
              reg13 <= {reg14[(2'h2):(1'h0)]};
              reg14 <= wire10;
              reg15 <= ((wire10 ^~ ((~(reg13 << wire7)) <<< (~&{reg13,
                  (8'hb8)}))) ~^ wire8[(2'h2):(1'h1)]);
            end
          if ({((~&((~^reg11) ?
                  wire8 : $unsigned(reg13))) <= (^~reg12[(2'h3):(2'h2)])),
              ($signed(((wire10 >>> reg13) > $signed(reg15))) ?
                  $unsigned(reg14) : ((~&reg11) ?
                      wire8 : {$signed(reg14), (wire10 != reg12)}))})
            begin
              reg16 <= reg14[(1'h0):(1'h0)];
              reg17 <= {(8'ha0), wire9[(3'h7):(3'h6)]};
              reg18 <= $signed(reg17[(1'h0):(1'h0)]);
            end
          else
            begin
              reg16 <= ({(~&($signed(reg18) * (wire8 - reg13))),
                  $signed(reg17[(4'hc):(4'h8)])} >> (-reg17[(2'h3):(2'h2)]));
            end
        end
      if (((8'hbd) << $signed(({((8'hb2) ~^ wire10)} >= reg11))))
        begin
          if ((|{reg11[(3'h4):(1'h1)], wire9}))
            begin
              reg19 <= ((8'ha0) == (($signed(reg12) && $signed((wire8 ?
                  reg12 : (7'h41)))) | $signed(wire10[(1'h0):(1'h0)])));
              reg20 <= reg15;
              reg21 <= $signed($signed(reg15));
              reg22 <= wire9;
            end
          else
            begin
              reg19 <= reg11[(3'h6):(3'h4)];
              reg20 <= (reg19 ?
                  ($signed(((wire7 ? reg21 : reg16) ?
                      {(8'ha4)} : $signed((8'hb7)))) ~^ (($unsigned(wire7) ?
                          reg18 : wire8[(2'h3):(2'h3)]) ?
                      reg14[(2'h3):(1'h1)] : $unsigned({reg14}))) : (^(reg21 ?
                      reg11 : {(+reg13), $signed(reg17)})));
              reg21 <= wire8[(3'h4):(1'h1)];
              reg22 <= (~^reg13);
              reg23 <= $unsigned($unsigned(wire7));
            end
          if ($signed(($unsigned(reg17) ?
              reg16 : (reg13 >= ((reg21 + (8'hbb)) ?
                  $signed(reg23) : reg19[(3'h4):(2'h2)])))))
            begin
              reg24 <= reg21;
              reg25 <= $unsigned(reg16);
              reg26 <= (~^(^~(((~&reg12) ?
                  reg11[(4'h9):(2'h2)] : (^~reg17)) <= ({reg17} ?
                  ((8'haf) == reg12) : (reg24 ^~ reg24)))));
              reg27 <= {wire9,
                  $signed(((^reg22) ?
                      $unsigned($signed((8'hb0))) : ((~&(8'ha2)) ~^ $unsigned((8'ha7)))))};
            end
          else
            begin
              reg24 <= reg11[(1'h0):(1'h0)];
              reg25 <= $signed(($signed(($signed(reg26) >> (wire7 - reg17))) == (^~($signed(reg14) >= (^~reg12)))));
              reg26 <= reg11;
            end
          reg28 <= wire9[(4'hf):(1'h1)];
        end
      else
        begin
          reg19 <= (+$signed(reg17[(1'h1):(1'h1)]));
          reg20 <= reg28;
        end
      if ($signed($signed(((|(reg12 ^ reg19)) ?
          {$unsigned(reg13)} : $signed($signed(reg22))))))
        begin
          reg29 <= wire8;
          reg30 <= reg25;
        end
      else
        begin
          if (($signed((reg14 ?
                  $unsigned(reg24[(4'h8):(3'h4)]) : {{wire7, reg23}})) ?
              ($unsigned(reg13[(1'h1):(1'h1)]) >> (^(!(!reg17)))) : {$unsigned((reg13 ~^ (~reg22))),
                  reg16[(1'h0):(1'h0)]}))
            begin
              reg29 <= $signed({($signed($signed((7'h44))) ?
                      (wire7 << $unsigned(reg18)) : $unsigned($unsigned(reg22)))});
              reg30 <= (^{(-reg28), $signed(reg19[(3'h5):(3'h4)])});
              reg31 <= $unsigned(wire9);
            end
          else
            begin
              reg29 <= (reg30[(4'hb):(2'h3)] ~^ (reg13 <= reg13[(2'h3):(1'h0)]));
              reg30 <= reg13;
              reg31 <= reg14;
              reg32 <= (reg19[(1'h1):(1'h1)] ?
                  (~^$unsigned(reg26[(1'h0):(1'h0)])) : ({(reg22 ?
                          (reg15 == reg30) : (reg15 ?
                              (8'hab) : wire10))} && (-$signed((reg30 != reg22)))));
              reg33 <= $unsigned((-$signed(reg11[(3'h6):(2'h2)])));
            end
          reg34 <= (reg31 * ($unsigned(wire10[(3'h4):(2'h3)]) ?
              $signed(({reg17, reg30} ?
                  (-(8'ha4)) : {reg19, reg30})) : $signed($signed((+wire8)))));
          reg35 <= (&reg17[(5'h11):(4'hb)]);
          reg36 <= $signed(($signed(reg11) << reg15));
        end
      if (reg13[(2'h3):(2'h2)])
        begin
          reg37 <= {reg25[(1'h1):(1'h0)]};
          reg38 <= $signed((reg19 ?
              {{$unsigned(reg13), (reg32 & (8'hb3))}} : $signed(reg33)));
        end
      else
        begin
          if (($signed((~|reg34)) ?
              ($unsigned((~|(~^reg25))) ?
                  $unsigned((8'ha2)) : (~^($signed((8'hb1)) != $signed(reg33)))) : $signed((reg23[(3'h5):(1'h0)] | ((reg25 <<< reg20) ?
                  reg29 : $unsigned(reg36))))))
            begin
              reg37 <= $signed(reg29);
            end
          else
            begin
              reg37 <= ($signed((((+reg23) == reg36) - (reg33 & $signed(wire10)))) ?
                  (^$signed((reg29 ?
                      (reg15 ?
                          wire8 : reg36) : ((8'h9e) >>> reg24)))) : ((reg23[(4'h8):(1'h0)] ?
                          wire8 : reg12[(5'h10):(3'h5)]) ?
                      reg23 : {(^(reg15 ? wire7 : reg38)),
                          ({wire7} ~^ reg36[(4'h9):(2'h3)])}));
              reg38 <= {$unsigned((!({reg26} ?
                      {reg13, (8'hbd)} : (reg15 ? reg37 : reg13))))};
              reg39 <= $signed(((~^(^~(reg22 ? (8'h9d) : reg28))) ?
                  reg29[(3'h7):(3'h7)] : $signed(((~^wire9) ?
                      wire10 : {reg18, reg15}))));
              reg40 <= {(8'hb6)};
            end
          reg41 <= $unsigned(wire10);
          reg42 <= (~|$unsigned(({wire9} ?
              ((reg35 | reg33) ^~ $unsigned(reg33)) : $unsigned((reg22 || reg31)))));
        end
    end
  assign wire43 = $signed((7'h40));
  assign wire44 = ($signed(((reg11[(3'h7):(3'h4)] ?
                      reg21 : (reg40 >> reg34)) > $signed((wire10 ?
                      reg34 : reg21)))) >>> wire9);
  assign wire45 = reg32;
  assign wire46 = {(&{$signed($signed(wire9))}),
                      $signed((((reg26 ? reg33 : reg34) ^ (~&reg26)) ?
                          ((reg18 ? reg35 : reg28) >>> (wire7 ?
                              reg13 : (8'ha1))) : (-reg24[(3'h5):(3'h5)])))};
  assign wire47 = $signed((8'hac));
  assign wire48 = ((~&reg29) != reg25);
  assign wire49 = (&{reg29, $unsigned((&$signed(wire45)))});
  assign wire50 = {reg14[(1'h0):(1'h0)],
                      {$signed(((wire47 * (8'hab)) && (~^wire46)))}};
  assign wire51 = $unsigned(wire8[(3'h4):(2'h3)]);
  assign wire52 = wire47;
  assign wire53 = (reg14 == (-(($signed(reg39) ?
                      wire52 : $unsigned(reg25)) - $signed(wire47[(5'h14):(5'h14)]))));
endmodule
