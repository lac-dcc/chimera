module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire7,
                 wire6,
                 wire5,
                 reg33,
                 reg32,
                 reg31,
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
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = wire3[(3'h6):(2'h3)];
  assign wire6 = wire4[(4'he):(1'h1)];
  assign wire7 = (wire5[(1'h1):(1'h0)] - wire5[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg8 <= $signed({($signed(wire2) ?
              {(wire6 ? (8'hab) : wire6), $unsigned((8'ha0))} : (((7'h40) ?
                      wire3 : (8'hb6)) ?
                  wire2[(1'h0):(1'h0)] : (wire6 >>> wire0))),
          ((wire7[(1'h1):(1'h1)] ? (~&wire4) : {wire1}) ?
              ((!wire4) && (wire3 >>> wire1)) : ((wire7 ? wire7 : (8'hb4)) ?
                  (wire0 != wire3) : {wire2, wire0}))});
      if (reg8)
        begin
          if (wire6[(1'h1):(1'h0)])
            begin
              reg9 <= $signed({(-wire4[(3'h6):(3'h6)]), wire1[(3'h7):(3'h6)]});
            end
          else
            begin
              reg9 <= {$unsigned((~&({wire7} ?
                      $unsigned(reg8) : $signed(reg9))))};
              reg10 <= $signed((wire0 == (((wire4 ? wire4 : wire2) ?
                  (wire3 >>> wire5) : $unsigned(reg9)) >= $unsigned((reg8 != wire6)))));
              reg11 <= wire1;
            end
          if ($unsigned(wire0))
            begin
              reg12 <= {(($signed(((8'ha4) + wire3)) << wire6[(3'h4):(3'h4)]) ~^ (((!reg8) ?
                          (wire2 - reg11) : $signed(wire2)) ?
                      {(wire4 + wire1),
                          (wire3 ? (8'h9c) : wire2)} : $signed((&wire4))))};
              reg13 <= {($unsigned(((reg11 <= wire3) ?
                          {wire0} : $unsigned(wire6))) ?
                      $signed((wire3 ~^ $signed(wire6))) : (&((~&wire1) ?
                          $signed(reg10) : $unsigned(reg10))))};
              reg14 <= wire2;
              reg15 <= $signed(wire2[(2'h3):(2'h3)]);
              reg16 <= ((&(~|$unsigned(reg15[(2'h2):(2'h2)]))) + $unsigned(((((8'h9c) ^ reg15) & {(8'haa),
                      wire1}) ?
                  reg10[(2'h2):(1'h1)] : (^~(reg8 & reg9)))));
            end
          else
            begin
              reg12 <= reg12;
              reg13 <= $signed(wire5[(4'ha):(3'h5)]);
              reg14 <= (($signed((|(!wire2))) ?
                      reg11 : $unsigned((-((8'ha2) != reg11)))) ?
                  (reg11 ?
                      reg10[(2'h2):(1'h0)] : ((((8'ha6) ?
                          (8'ha6) : (7'h41)) >> $unsigned(reg15)) > {reg14[(4'hc):(3'h4)],
                          (8'hae)})) : (!reg13[(3'h4):(1'h0)]));
              reg15 <= wire3;
              reg16 <= reg8[(1'h1):(1'h1)];
            end
          reg17 <= reg16[(4'h9):(3'h7)];
          reg18 <= {$signed((wire5 ?
                  (+wire2[(2'h2):(1'h1)]) : (((8'ha0) ?
                      wire5 : reg12) >> wire7)))};
        end
      else
        begin
          reg9 <= reg8;
          if ((+($signed(reg12[(4'hf):(3'h7)]) << $unsigned($unsigned((-wire1))))))
            begin
              reg10 <= {wire6, reg15};
              reg11 <= $signed(reg15);
              reg12 <= (($unsigned(reg14[(4'ha):(1'h0)]) << $unsigned(wire5)) != reg14[(1'h1):(1'h0)]);
              reg13 <= (|(|(8'ha8)));
            end
          else
            begin
              reg10 <= ($unsigned((~|wire4[(3'h4):(3'h4)])) * $signed($signed($signed((~&wire7)))));
            end
        end
      if ((7'h43))
        begin
          if ({({reg17[(1'h1):(1'h1)], reg10[(1'h1):(1'h0)]} ?
                  (reg14[(2'h2):(1'h0)] ?
                      $unsigned((wire3 ?
                          wire2 : reg9)) : (|$unsigned(wire7))) : reg15[(1'h1):(1'h0)])})
            begin
              reg19 <= (|($signed((!{wire2,
                  reg13})) ~^ (!$signed($signed(wire5)))));
              reg20 <= (wire5 ?
                  $signed($signed(wire0)) : $signed((((wire2 >>> reg18) >> $signed(reg16)) > ($signed(reg18) ^~ wire2))));
              reg21 <= wire4[(3'h6):(2'h2)];
              reg22 <= ($signed((!{wire1[(2'h2):(1'h0)], wire5})) ?
                  reg9 : reg15);
            end
          else
            begin
              reg19 <= (&(8'ha1));
              reg20 <= ((~reg21[(2'h3):(2'h3)]) << $signed(reg15));
              reg21 <= $signed((((reg15[(2'h2):(1'h0)] ?
                      $unsigned((8'hbf)) : (8'hba)) ?
                  ((8'had) >> (8'hbd)) : (reg12 ?
                      reg20[(3'h6):(3'h4)] : wire4)) << (wire2[(1'h1):(1'h1)] ?
                  (|$unsigned(wire6)) : $signed($unsigned((8'hbe))))));
              reg22 <= reg17[(3'h7):(2'h3)];
            end
          reg23 <= (({$signed((&wire3))} ^~ wire1[(2'h2):(1'h0)]) ?
              $unsigned(wire3[(4'h8):(3'h4)]) : $unsigned((8'h9e)));
          reg24 <= wire5;
          reg25 <= reg10;
          reg26 <= reg19;
        end
      else
        begin
          if (((~^{((reg20 ? reg19 : (8'hb1)) & (^(8'hae))), reg23}) ?
              reg18[(3'h7):(2'h3)] : (reg8 ?
                  reg26[(3'h6):(3'h6)] : ((((8'ha7) ^~ reg12) ?
                      (reg17 ?
                          reg8 : reg14) : $unsigned(wire5)) | {(reg22 == reg24)}))))
            begin
              reg19 <= $unsigned($signed({$signed($unsigned(reg14))}));
            end
          else
            begin
              reg19 <= reg15;
            end
          reg20 <= ($unsigned((~|$unsigned((reg14 - (7'h41))))) ?
              wire7 : reg17);
        end
      reg27 <= {reg11, reg15};
      reg28 <= reg12;
    end
  assign wire29 = ((reg9 ^~ (((reg11 || reg20) != wire5[(4'hc):(3'h7)]) ?
                      (((8'h9f) ?
                          reg15 : reg18) == $unsigned(wire5)) : (-$signed(reg16)))) < (^(~|((|reg11) >>> {wire7}))));
  assign wire30 = $signed(($signed(reg23) << $unsigned((8'ha4))));
  always
    @(posedge clk) begin
      reg31 <= reg9[(4'h8):(2'h3)];
      reg32 <= reg27[(1'h0):(1'h0)];
      reg33 <= reg24[(4'hc):(3'h6)];
    end
endmodule
