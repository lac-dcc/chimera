module top
#(parameter param33 = (&{((!((8'ha9) ? (7'h40) : (8'h9d))) ? (((8'ha8) | (8'ha8)) ~^ ((8'hba) != (8'ha3))) : ((8'hb9) ? ((8'had) <<< (8'hb1)) : ((8'hbc) != (8'hae)))), (-(+((8'ha4) ? (8'hbe) : (8'hab))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire4;
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = (wire1[(4'h9):(2'h3)] ?
                     ((-{wire0[(4'h8):(3'h5)]}) ?
                         ($unsigned({wire0}) ?
                             wire2[(2'h2):(1'h1)] : $signed((wire3 <= wire1))) : $signed($unsigned(wire1[(1'h0):(1'h0)]))) : (~&wire0[(3'h7):(3'h7)]));
  assign wire5 = $unsigned(wire1);
  assign wire6 = (({$signed(wire4[(1'h0):(1'h0)]), wire1[(4'h8):(1'h0)]} ?
                     $unsigned((~^$signed(wire4))) : wire1[(3'h7):(3'h6)]) <= wire4);
  assign wire7 = wire2;
  assign wire8 = {wire7};
  assign wire9 = $unsigned(wire6);
  always
    @(posedge clk) begin
      reg10 <= $signed(($unsigned($unsigned((wire3 ~^ wire8))) ?
          ((((8'hb9) ? wire2 : (7'h44)) ?
              (wire6 ? wire2 : wire6) : (wire3 ^~ wire2)) > (wire9 ?
              wire2[(4'h9):(1'h0)] : wire6[(2'h2):(1'h0)])) : (8'hb3)));
      reg11 <= $signed($unsigned(($unsigned((wire1 ?
          (8'hb3) : wire7)) - ($unsigned(wire8) == (wire5 ? wire9 : wire8)))));
      reg12 <= wire1;
      if (((+$unsigned($unsigned(wire0[(1'h0):(1'h0)]))) ?
          $unsigned(wire2[(4'ha):(4'h9)]) : (wire1[(3'h4):(2'h2)] ?
              (((wire3 ^~ wire7) ? (wire8 - wire1) : $unsigned(wire6)) ?
                  wire5[(3'h6):(2'h2)] : ($signed((8'hac)) + $unsigned(wire9))) : wire8[(3'h7):(3'h7)])))
        begin
          if ((((((~|wire3) ? (~^wire6) : $unsigned(reg12)) ?
                      wire6[(1'h1):(1'h0)] : $unsigned(wire9)) ?
                  (wire6[(1'h0):(1'h0)] ?
                      {(wire9 && wire3)} : (wire8[(2'h2):(1'h0)] < reg10)) : (wire1 ?
                      wire6 : (reg12[(1'h1):(1'h1)] >>> (wire9 ?
                          reg11 : wire8)))) ?
              (|(8'ha9)) : $signed((+reg10))))
            begin
              reg13 <= $signed((~^($signed((~wire4)) ?
                  $unsigned(wire1[(4'hc):(2'h3)]) : {wire1[(3'h7):(3'h4)]})));
            end
          else
            begin
              reg13 <= {(^~(($signed((8'h9e)) ?
                      (wire0 + wire2) : ((8'hae) || reg11)) == ((wire7 >= wire3) << $signed(wire4)))),
                  ($unsigned((^{reg11, wire9})) ?
                      (~|$unsigned(reg13[(3'h5):(2'h3)])) : ((~&reg10[(1'h1):(1'h1)]) + $signed((|wire2))))};
              reg14 <= $signed(({wire1[(2'h3):(2'h2)]} ?
                  $signed($unsigned((wire4 > wire0))) : ((-(7'h43)) ?
                      ({reg12} < (reg10 ?
                          reg12 : wire9)) : wire1[(3'h7):(2'h2)])));
              reg15 <= $signed((~$signed($unsigned($signed(wire3)))));
              reg16 <= ($signed(($signed($unsigned((8'hbc))) ?
                  $unsigned(reg14) : ((reg12 != reg12) == reg12[(3'h7):(3'h6)]))) >= ((+(-$unsigned(wire7))) | ({$unsigned((8'hb4))} ?
                  {$signed(wire8)} : ($signed((8'ha5)) ?
                      (wire3 ^~ wire3) : (~|(8'hac))))));
            end
          reg17 <= $signed($unsigned(wire6));
          reg18 <= wire2[(3'h7):(3'h4)];
          reg19 <= $signed((-{(-(!wire2))}));
          reg20 <= $unsigned((reg16 ?
              reg15[(2'h2):(1'h1)] : $signed(((wire9 << (8'had)) ^ wire3[(4'h9):(1'h1)]))));
        end
      else
        begin
          reg13 <= $unsigned($signed({({wire8} ?
                  ((8'hb4) ? wire7 : wire8) : {reg18})}));
          reg14 <= ((8'hb3) ? reg16[(4'h9):(2'h2)] : reg11);
        end
    end
  assign wire21 = $unsigned($unsigned({$signed((~^(8'hae))), {(&wire4)}}));
  assign wire22 = reg19;
  always
    @(posedge clk) begin
      if ((+$signed({wire5[(3'h4):(2'h3)]})))
        begin
          if (((reg10 ?
                  ((wire0 ? (-reg11) : (reg11 <<< reg20)) + {(reg13 ?
                          (8'h9c) : wire0)}) : ($signed($unsigned(wire5)) ?
                      $unsigned($signed(reg14)) : ((wire3 <= reg12) ?
                          (wire8 ^ wire3) : wire4[(1'h1):(1'h0)]))) ?
              reg12[(1'h1):(1'h0)] : reg18[(1'h1):(1'h0)]))
            begin
              reg23 <= reg13;
              reg24 <= {($unsigned(((reg11 ? reg14 : reg17) < (wire22 ?
                          (7'h42) : reg19))) ?
                      (wire21 ?
                          wire22 : reg10[(2'h3):(1'h1)]) : $signed($unsigned((reg10 ?
                          wire22 : reg19)))),
                  (~^$unsigned(($signed(wire6) >>> reg19)))};
            end
          else
            begin
              reg23 <= $signed((reg16 || $unsigned($unsigned(((7'h44) >= reg14)))));
              reg24 <= reg24;
              reg25 <= reg10;
              reg26 <= {reg20};
              reg27 <= (^~$unsigned(reg14[(3'h7):(2'h3)]));
            end
          reg28 <= (-{($unsigned($unsigned(reg20)) ?
                  ((reg17 ? reg12 : wire7) & (wire21 ?
                      reg18 : wire5)) : (+(8'h9f))),
              (|(&(wire5 >> reg23)))});
          reg29 <= (wire5[(3'h7):(1'h1)] ?
              {(reg16 ?
                      reg12 : ((^(7'h40)) ?
                          $signed(wire22) : $signed(wire7)))} : wire2[(3'h6):(3'h4)]);
        end
      else
        begin
          reg23 <= (wire9[(5'h10):(3'h4)] < reg26[(1'h1):(1'h1)]);
          if ((reg26[(3'h5):(3'h5)] ?
              ({(wire0 ? (reg12 == reg17) : (wire5 != wire8)), wire8} ?
                  ($signed((~|wire3)) && ((reg12 ^~ wire9) ?
                      (wire22 ?
                          reg17 : reg12) : reg26)) : wire1) : $unsigned($unsigned((~reg11[(1'h1):(1'h0)])))))
            begin
              reg24 <= (($signed(({reg15} ?
                      (8'ha3) : reg17)) | $signed($unsigned($signed(reg20)))) ?
                  wire21 : (reg27 && wire5[(3'h6):(3'h4)]));
              reg25 <= reg17;
              reg26 <= $unsigned(((reg16 && $unsigned((reg12 <<< reg29))) ?
                  wire0[(3'h4):(3'h4)] : (((~&reg24) == (8'hac)) ?
                      {{reg13, reg25}, (~&wire4)} : (((8'hbf) ?
                          (7'h43) : reg19) <= $unsigned(reg19)))));
              reg27 <= reg25;
              reg28 <= $unsigned({$unsigned(($unsigned(reg14) ?
                      (reg17 ? (8'hb6) : reg16) : wire6))});
            end
          else
            begin
              reg24 <= reg23[(4'hb):(4'h9)];
              reg25 <= (($unsigned(wire21) * reg16[(1'h0):(1'h0)]) ?
                  ((((8'hb8) ?
                      $unsigned(reg20) : reg25) << $unsigned($unsigned(reg26))) >> {{(wire4 ?
                              wire9 : reg25),
                          (reg15 ? reg26 : wire2)},
                      $unsigned(wire5)}) : wire7);
            end
          reg29 <= (^reg28[(1'h0):(1'h0)]);
          reg30 <= wire3[(3'h6):(3'h4)];
          reg31 <= $unsigned($unsigned($unsigned(reg23)));
        end
      reg32 <= $unsigned(reg18);
    end
endmodule
