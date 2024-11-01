module top
#(parameter param47 = (((~|((-(8'ha8)) ? ((8'ha8) ? (8'hb7) : (8'ha5)) : ((7'h44) & (8'hb1)))) * (7'h41)) ? (~((8'ha2) ? (~^(8'ha7)) : (((8'ha0) <<< (8'h9e)) ? {(8'hb9), (8'ha2)} : ((8'ha2) + (8'ha3))))) : ((((~&(8'h9f)) ? ((8'hb0) && (8'hb8)) : (!(8'ha6))) ~^ (((8'hbb) && (8'had)) ? ((8'hab) ? (8'hbb) : (8'ha6)) : {(8'h9f)})) ~^ (((|(8'hb9)) ? {(8'had)} : (!(8'hb3))) ? (((8'ha7) & (8'hb9)) >= (~&(8'h9c))) : ((+(8'ha4)) ? ((8'ha2) ? (8'h9c) : (8'ha4)) : {(8'hb8)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h228):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire42;
  wire [(4'ha):(1'h0)] wire41;
  wire signed [(3'h7):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire12,
                 wire6,
                 wire5,
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
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = $signed((({wire2[(2'h3):(2'h3)], (wire2 >> wire1)} ?
                     (+{wire1, (8'hbe)}) : (wire4 ?
                         (wire2 ?
                             wire2 : (7'h43)) : wire4)) >= $signed($signed(wire2))));
  assign wire6 = ({(((8'ha3) <= $signed((8'hab))) ?
                         $signed(wire2) : wire1)} <<< wire0);
  always
    @(posedge clk) begin
      reg7 <= {$signed(($unsigned(wire6[(3'h6):(1'h1)]) ?
              (wire0 ? $signed(wire0) : {wire2, wire4}) : wire6)),
          (wire3[(2'h3):(1'h0)] ? wire0 : wire3[(1'h0):(1'h0)])};
      if ((~|wire2))
        begin
          reg8 <= $unsigned((8'h9e));
          reg9 <= {wire1};
        end
      else
        begin
          reg8 <= $unsigned(((!((^wire3) << $signed(wire5))) ?
              (((reg8 ? wire0 : (8'h9d)) ?
                  (^~(8'hbc)) : (wire6 && reg7)) & $signed(reg7[(3'h6):(1'h1)])) : (((-reg7) ?
                      (wire5 & (8'hbe)) : reg7[(1'h0):(1'h0)]) ?
                  wire6 : reg8)));
          if (wire3[(3'h5):(1'h1)])
            begin
              reg9 <= wire5;
            end
          else
            begin
              reg9 <= ((~$signed(((reg9 ?
                  wire1 : reg8) & $unsigned(wire0)))) >= ((&(wire0 ?
                      {wire3} : (reg7 == wire5))) ?
                  ((~^wire1) ^~ (+$signed(wire0))) : {wire1}));
              reg10 <= $unsigned($signed($signed((^~(wire4 ? wire1 : reg9)))));
            end
        end
      reg11 <= (|$signed(((((7'h44) > reg8) == (wire0 ? wire2 : reg9)) ?
          (+(wire5 ? reg10 : wire4)) : wire3[(2'h3):(2'h2)])));
    end
  assign wire12 = ((8'hbb) < (&wire5[(3'h5):(2'h3)]));
  always
    @(posedge clk) begin
      reg13 <= $signed((^($unsigned($unsigned(wire6)) ?
          (~&$signed(wire4)) : $unsigned(reg11))));
      reg14 <= ($signed(((-{reg7, wire0}) ?
              $unsigned((wire3 | reg13)) : ($signed(reg11) <= {wire3}))) ?
          {$unsigned(((8'hb8) < ((8'h9d) ?
                  (8'h9f) : reg11)))} : ($unsigned((8'haa)) <<< (((reg7 >>> wire1) <<< $unsigned((8'ha1))) ?
              reg13[(4'h9):(2'h2)] : ($signed(reg8) != (wire12 ?
                  (8'ha1) : wire5)))));
      reg15 <= wire5;
      reg16 <= $unsigned(wire0[(1'h0):(1'h0)]);
      reg17 <= (+(reg10 ? (7'h44) : (reg10 << (~$signed(wire2)))));
    end
  assign wire18 = $signed($unsigned(wire12[(4'he):(4'h9)]));
  assign wire19 = ((($unsigned((reg17 - wire1)) > ($unsigned(reg13) & wire4[(2'h2):(1'h0)])) || ($signed((8'hb0)) | $unsigned((reg11 ?
                      reg13 : (8'hb1))))) < $signed(reg10));
  assign wire20 = ((&($unsigned((wire18 * reg14)) ?
                          wire12[(4'hf):(4'h9)] : wire12[(4'hc):(4'ha)])) ?
                      (reg14[(3'h6):(2'h3)] ?
                          (8'ha1) : wire12[(3'h4):(2'h3)]) : $unsigned(((^(wire5 ?
                          wire0 : wire1)) ^ ((^~wire2) ?
                          {wire4} : ((8'ha8) ? wire18 : wire19)))));
  assign wire21 = $unsigned((($unsigned(wire4) ^~ $signed({wire0})) == ((~^reg7[(3'h7):(3'h7)]) ?
                      (((8'hb6) ?
                          reg13 : (8'ha9)) << $signed(wire2)) : ((reg15 > reg11) ?
                          reg14 : (~&wire6)))));
  always
    @(posedge clk) begin
      reg22 <= (wire21 < (reg14 <<< $signed((&(reg9 ? (8'hbb) : (8'haa))))));
      reg23 <= $unsigned({(wire1 ?
              ((^reg14) ?
                  $signed((8'hb5)) : (reg11 >= wire2)) : reg7[(4'h8):(1'h1)]),
          ({{reg22, wire21}, {reg7}} ? {wire2[(3'h5):(2'h3)]} : {(+reg8)})});
      if ($signed($unsigned({((~|reg7) | (~&wire19))})))
        begin
          reg24 <= reg15;
          reg25 <= (($signed($signed(wire5)) << (({reg14,
                  wire0} ~^ (reg8 + wire0)) >> $signed((wire21 ?
                  wire2 : (8'ha2))))) ?
              $signed($signed(wire4)) : reg7[(5'h12):(3'h4)]);
          reg26 <= ((~|($unsigned(wire2) != (~wire18[(2'h2):(1'h1)]))) - reg14[(1'h1):(1'h1)]);
          if ({{((8'ha7) ? wire3 : {{wire5}})}})
            begin
              reg27 <= $unsigned((((wire1[(4'h8):(1'h0)] ?
                          (reg7 || (7'h42)) : $signed(reg15)) ?
                      reg25[(3'h7):(3'h6)] : $unsigned($signed(reg17))) ?
                  (wire4[(3'h4):(1'h0)] ~^ reg16[(1'h1):(1'h0)]) : (8'hac)));
              reg28 <= (8'ha3);
              reg29 <= ({(~&$unsigned((wire0 * (8'hbd)))),
                  wire6[(1'h0):(1'h0)]} || $signed((reg23 ?
                  {(~reg11)} : {$signed(wire2)})));
              reg30 <= (7'h43);
              reg31 <= (!(~($signed($signed((8'hae))) ?
                  (!(wire19 >>> wire6)) : ({reg13,
                      reg26} - reg7[(5'h11):(5'h10)]))));
            end
          else
            begin
              reg27 <= $signed($signed(reg15));
              reg28 <= reg30;
              reg29 <= ((|$signed(wire20[(2'h2):(1'h0)])) ?
                  $signed($signed(wire18)) : (^(&(&$signed((8'hbc))))));
            end
        end
      else
        begin
          reg24 <= (reg11 ? wire2[(4'ha):(3'h5)] : wire20[(2'h2):(2'h2)]);
        end
      if ($signed((-reg10[(3'h6):(3'h6)])))
        begin
          reg32 <= wire5;
          reg33 <= reg32;
        end
      else
        begin
          if ($unsigned(($signed($unsigned($signed(wire19))) ?
              $signed(((reg29 ?
                  reg8 : wire4) * $unsigned(reg26))) : $signed(reg7))))
            begin
              reg32 <= wire0[(4'ha):(3'h7)];
              reg33 <= reg14[(5'h11):(5'h10)];
            end
          else
            begin
              reg32 <= (^~(reg27 || ($signed({wire0}) - reg9[(1'h0):(1'h0)])));
              reg33 <= reg17;
              reg34 <= $signed(wire6[(2'h3):(1'h0)]);
              reg35 <= $unsigned(wire6);
            end
          if ((wire6 ?
              ($signed((wire4 == wire1)) & ($signed(wire18[(3'h4):(2'h2)]) && $unsigned((reg25 <<< wire0)))) : (!reg32)))
            begin
              reg36 <= reg17[(4'hb):(4'ha)];
              reg37 <= wire4[(3'h7):(2'h3)];
              reg38 <= wire0;
              reg39 <= {reg22, (8'hb2)};
              reg40 <= $signed(($unsigned({reg13[(4'hb):(4'ha)]}) | $signed((reg32[(3'h7):(2'h3)] || (reg25 ?
                  reg8 : reg23)))));
            end
          else
            begin
              reg36 <= (($signed((~|(reg35 ? reg16 : (7'h41)))) ?
                  wire5 : ({{reg40},
                      (reg27 ?
                          wire18 : reg26)} || $unsigned($unsigned(reg34)))) | $signed(((^~((8'ha9) ?
                      (7'h43) : reg26)) ?
                  ($unsigned(wire6) ?
                      reg8[(4'hc):(4'ha)] : (reg32 || reg32)) : (&(reg38 >>> reg24)))));
              reg37 <= (wire12 >> ({((~^reg34) >>> (reg25 <<< wire0))} | $signed(wire3)));
            end
        end
    end
  assign wire41 = (($unsigned($signed($signed(reg26))) ?
                          ((&(&wire20)) - (8'ha6)) : wire20) ?
                      reg29 : (reg38 >> {$signed($unsigned(reg11)),
                          $signed(reg33[(4'hf):(4'hb)])}));
  assign wire42 = (&{reg27[(4'h8):(2'h2)]});
  assign wire43 = $unsigned(($signed((wire21[(3'h4):(1'h1)] & ((8'ha2) ?
                          reg32 : reg32))) ?
                      $unsigned((~|(reg13 ?
                          reg25 : reg32))) : ((8'h9f) | $signed($signed(reg23)))));
  assign wire44 = $unsigned(($signed(wire1[(3'h5):(3'h4)]) >= $unsigned($unsigned($unsigned(wire3)))));
  assign wire45 = ($unsigned($unsigned(wire44[(5'h11):(4'hc)])) < ($unsigned(wire41) <= $unsigned($signed($signed((7'h42))))));
  assign wire46 = reg17[(4'hc):(2'h3)];
endmodule
