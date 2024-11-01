module top
#(parameter param44 = {{((~|(8'ha0)) ^~ (((8'hb1) ? (8'had) : (7'h42)) ? ((8'h9f) ? (8'h9f) : (7'h41)) : ((8'hac) ? (8'ha6) : (8'hb9)))), (^((!(8'haf)) ? (-(8'hb1)) : (~|(8'h9e))))}, ((-((8'hb7) ? {(8'haa)} : ((8'hae) && (8'h9d)))) ? ((+((8'hb7) <= (8'ha1))) ? ({(8'h9e)} <<< ((8'ha8) * (8'hab))) : {((8'hbc) ~^ (8'hb3)), ((7'h43) ? (8'ha5) : (8'hb3))}) : (((&(8'hb4)) >= (|(8'hb0))) ? ((|(8'h9f)) ? ((8'haa) ^~ (8'ha5)) : ((8'hb0) + (7'h41))) : ((~(8'h9e)) ? ((8'hb4) <= (8'hbd)) : (^(8'hbc)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  assign y = {wire43,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire5,
                 wire4,
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
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $signed($signed(($signed((~|(8'haf))) && $unsigned((~wire2)))));
  assign wire5 = wire2;
  always
    @(posedge clk) begin
      reg6 <= wire1[(1'h1):(1'h1)];
      reg7 <= {wire4[(4'ha):(1'h0)],
          ((|wire0[(1'h0):(1'h0)]) ?
              $signed((((8'ha4) ?
                  wire1 : wire4) - wire4[(1'h0):(1'h0)])) : ((wire3[(4'h8):(2'h3)] ?
                      (7'h43) : wire2[(1'h0):(1'h0)]) ?
                  {$signed(wire2), $signed(wire4)} : {$unsigned(wire2),
                      wire4[(1'h0):(1'h0)]}))};
      reg8 <= (&$signed((wire4[(4'hd):(3'h7)] ?
          (^~wire3) : {wire5, (wire4 ? wire4 : wire2)})));
      reg9 <= $unsigned((&$unsigned((wire0 ?
          (reg6 ? reg7 : wire5) : ((8'h9f) && wire5)))));
      if (reg6)
        begin
          reg10 <= (~&wire0[(2'h2):(2'h2)]);
          if ({wire5, (^{(~|reg9[(4'h9):(4'h9)]), (wire3 == (~reg6))})})
            begin
              reg11 <= $unsigned($signed($signed($signed((~wire3)))));
            end
          else
            begin
              reg11 <= $unsigned(wire0);
              reg12 <= (wire3 < $signed((&$signed((reg7 ? reg10 : reg11)))));
              reg13 <= wire3[(4'h8):(2'h2)];
              reg14 <= (((|($signed(wire1) < $signed(wire4))) ?
                  (~$unsigned(wire2[(2'h3):(1'h0)])) : ((((8'ha0) < wire3) ?
                          {reg9, (8'hb7)} : reg11[(1'h1):(1'h1)]) ?
                      (+$unsigned(wire4)) : reg12)) + reg6[(3'h4):(2'h2)]);
              reg15 <= (~|wire5[(2'h2):(1'h0)]);
            end
        end
      else
        begin
          reg10 <= ($signed(wire3[(3'h5):(1'h1)]) ?
              (((~$signed(reg13)) <<< (^$unsigned(reg12))) ^~ ((reg12[(3'h4):(1'h1)] <= reg15[(3'h4):(2'h2)]) ?
                  wire3[(4'h9):(4'h8)] : ((reg8 ? wire0 : wire1) ?
                      $signed(reg15) : {(8'hbf)}))) : (wire2 != $signed((^{(8'hba),
                  reg10}))));
          if (wire1[(2'h2):(1'h1)])
            begin
              reg11 <= reg12[(3'h6):(1'h1)];
              reg12 <= {wire3};
              reg13 <= (wire4 ?
                  (($signed(reg14) ?
                      reg15[(1'h0):(1'h0)] : reg11[(2'h2):(1'h1)]) | {$unsigned((+(8'hb1)))}) : (^~$unsigned($unsigned(reg15[(3'h4):(1'h1)]))));
            end
          else
            begin
              reg11 <= reg15[(2'h3):(2'h2)];
              reg12 <= $signed($signed((|(|(reg13 <= reg9)))));
              reg13 <= reg8[(1'h0):(1'h0)];
              reg14 <= reg11;
              reg15 <= $unsigned({$unsigned(reg12[(4'hc):(1'h1)])});
            end
          reg16 <= {($unsigned(reg12) ?
                  $signed(wire0[(1'h1):(1'h1)]) : (($unsigned(reg10) ?
                          (wire1 | wire2) : $unsigned(reg14)) ?
                      {wire0, $unsigned((7'h42))} : (~^{reg11, wire3})))};
          reg17 <= reg13;
          reg18 <= $unsigned((8'haa));
        end
    end
  assign wire19 = ($signed((^~wire1)) ?
                      $unsigned((reg10[(3'h7):(2'h2)] ?
                          (+$signed((8'hbc))) : $signed((reg10 ?
                              reg8 : reg13)))) : $unsigned($unsigned({$unsigned(wire3),
                          reg8[(2'h3):(2'h3)]})));
  assign wire20 = (+$signed(((~^(wire3 ? (8'hab) : reg11)) ?
                      {wire1,
                          ((8'hb8) <= reg15)} : (reg14[(3'h5):(3'h4)] << (~&wire2)))));
  assign wire21 = $signed((-wire19[(1'h1):(1'h0)]));
  assign wire22 = (reg18[(2'h2):(1'h0)] ?
                      ($unsigned(wire1) << $unsigned(reg6)) : wire1);
  always
    @(posedge clk) begin
      if ((~reg12[(5'h10):(4'hf)]))
        begin
          reg23 <= $unsigned($unsigned((((wire4 ?
              (8'hae) : reg14) >= $signed(reg9)) & reg17)));
          if ((reg14 ? (~|{$unsigned(((8'hac) >>> reg15)), (^(8'hbb))}) : reg9))
            begin
              reg24 <= wire19;
              reg25 <= wire0;
            end
          else
            begin
              reg24 <= wire3[(3'h5):(1'h0)];
              reg25 <= {(8'hba)};
              reg26 <= reg14;
              reg27 <= reg23;
            end
          if (($unsigned((^~$unsigned(reg14))) ~^ wire5))
            begin
              reg28 <= $unsigned(wire22[(3'h5):(3'h5)]);
              reg29 <= $unsigned((~&wire19[(2'h3):(2'h2)]));
              reg30 <= wire21[(3'h7):(2'h3)];
              reg31 <= (+((wire4 || reg18[(2'h2):(2'h2)]) ?
                  reg10 : reg15[(1'h1):(1'h0)]));
            end
          else
            begin
              reg28 <= ($unsigned(reg23) ?
                  (!(-{(^reg28), reg16})) : $unsigned((8'ha9)));
              reg29 <= wire20;
            end
          reg32 <= reg14[(4'ha):(3'h7)];
        end
      else
        begin
          reg23 <= reg24;
          reg24 <= reg17;
          reg25 <= ((reg10[(1'h0):(1'h0)] ?
                  ($unsigned($unsigned(reg31)) + (&(8'ha8))) : $signed(wire5[(4'h8):(2'h3)])) ?
              $signed($unsigned((8'hb8))) : (~&wire1[(1'h1):(1'h1)]));
        end
      if ((|(+reg16[(3'h6):(3'h5)])))
        begin
          reg33 <= $unsigned({wire4, reg25});
          if ((+$signed(reg25[(1'h1):(1'h0)])))
            begin
              reg34 <= ($unsigned({$unsigned($signed(reg9)),
                      (|$signed(wire20))}) ?
                  ((~&reg31[(1'h1):(1'h0)]) ?
                      $unsigned(reg28[(1'h0):(1'h0)]) : (((reg12 & reg30) == (reg26 & (8'ha6))) >>> {(reg6 ^~ (8'hac)),
                          reg25})) : wire19);
              reg35 <= $signed((+(reg9[(4'h9):(3'h6)] ~^ ((^~(8'h9e)) ?
                  (~^(8'h9d)) : $signed(reg34)))));
              reg36 <= reg12;
              reg37 <= ($signed(wire21[(3'h6):(2'h2)]) ?
                  (!(!reg8)) : (reg9[(3'h6):(2'h3)] < $unsigned((8'hab))));
            end
          else
            begin
              reg34 <= $signed((+(&(!wire3))));
              reg35 <= (~^(~|{$unsigned((reg16 ? reg29 : reg11)),
                  (reg27 && reg28)}));
            end
          reg38 <= (reg7[(3'h6):(2'h2)] ?
              {{$signed($unsigned(reg27)),
                      ((~|reg23) ?
                          (reg29 <<< reg6) : (reg8 ?
                              reg10 : wire2))}} : {(&reg12),
                  (~|((reg32 * (8'hba)) ?
                      (reg30 ? reg24 : wire2) : $unsigned(reg8)))});
          reg39 <= ((^(!((^~wire3) | reg27[(3'h5):(3'h4)]))) - reg36);
        end
      else
        begin
          reg33 <= $unsigned((({$unsigned(reg33)} - $signed((-(8'hb8)))) <<< reg9[(4'h8):(3'h5)]));
          reg34 <= $unsigned(wire1);
        end
      reg40 <= ((($signed(reg18) ?
                  reg11[(2'h2):(1'h1)] : {(!reg11), (~&reg15)}) ?
              (reg32 << {$unsigned((8'h9e)),
                  $signed((8'ha5))}) : {(&(^reg35))}) ?
          reg26 : reg27[(3'h7):(3'h7)]);
      reg41 <= $unsigned({wire3});
      reg42 <= (+({(reg30[(3'h7):(3'h7)] ?
                  reg17[(2'h2):(1'h0)] : reg13[(2'h3):(2'h3)]),
              (wire4[(4'hc):(3'h5)] ~^ (!wire19))} ?
          $unsigned({(reg38 != reg10)}) : {((reg9 * reg15) ?
                  $unsigned(reg39) : $unsigned(reg28)),
              (wire21[(3'h5):(1'h1)] ?
                  (reg27 ? reg37 : (7'h44)) : (^(7'h41)))}));
    end
  assign wire43 = ($signed($unsigned((|{wire3}))) - {reg16});
endmodule
