module top
#(parameter param55 = ((~(~(8'hb3))) <<< ((~^(8'hac)) ? (|(&((8'hac) <<< (8'hbc)))) : (((~(8'hbd)) ? ((8'hb9) <<< (8'ha7)) : (^(8'hbd))) == {{(7'h40)}, {(8'hbf)}}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h234):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire51;
  wire [(3'h4):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire30;
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg4 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire32,
                 wire31,
                 wire30,
                 reg48,
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
                 reg36,
                 reg35,
                 reg34,
                 reg33,
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
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ($signed(wire3[(4'hc):(2'h2)]) ?
          $unsigned((~&wire3[(3'h4):(3'h4)])) : (^(8'hb0)));
      if ($unsigned(wire1[(4'h9):(1'h1)]))
        begin
          reg5 <= (~^((reg4[(1'h1):(1'h0)] ?
                  wire0[(1'h1):(1'h1)] : $unsigned(wire1)) ?
              (-wire0[(2'h3):(1'h0)]) : (wire0[(2'h2):(1'h0)] ?
                  $unsigned($signed(wire0)) : {{(7'h40), wire0},
                      $unsigned(wire2)})));
          reg6 <= (~&$unsigned({reg4, $signed((reg4 ? reg5 : wire2))}));
          reg7 <= wire3[(4'hc):(3'h4)];
        end
      else
        begin
          reg5 <= wire1[(4'ha):(2'h3)];
          reg6 <= $signed(wire0[(4'h9):(4'h9)]);
          if (reg6)
            begin
              reg7 <= reg5[(5'h10):(3'h7)];
              reg8 <= (((~$signed($signed(reg7))) ?
                      ({((8'ha0) & wire2)} ?
                          {(reg6 - reg6),
                              (reg5 > wire2)} : reg6[(1'h0):(1'h0)]) : (-(reg4[(1'h1):(1'h0)] << (reg7 ?
                          reg4 : reg4)))) ?
                  wire2[(3'h4):(3'h4)] : ((7'h44) << $unsigned((reg7 ?
                      $signed(wire0) : reg4[(3'h5):(2'h3)]))));
              reg9 <= wire1;
              reg10 <= wire2;
            end
          else
            begin
              reg7 <= ($unsigned(((-$signed((7'h42))) ?
                  ({(8'hae),
                      reg10} != reg5) : reg7[(2'h3):(2'h2)])) < $unsigned($signed((~^wire3[(3'h7):(2'h2)]))));
            end
        end
      reg11 <= (~^reg4);
      reg12 <= $signed($signed($signed(wire1)));
    end
  always
    @(posedge clk) begin
      if (((($signed((reg8 ? wire3 : wire3)) || reg6[(3'h7):(3'h5)]) + (((reg4 ?
              wire3 : reg6) ?
          reg6 : {wire2}) - $unsigned(reg6[(4'hb):(4'h9)]))) | $signed((~^reg10[(1'h1):(1'h1)]))))
        begin
          reg13 <= reg11[(3'h7):(2'h3)];
          reg14 <= $signed(reg10);
          reg15 <= (~wire2[(1'h1):(1'h1)]);
          if ((~^reg5[(4'hb):(2'h2)]))
            begin
              reg16 <= reg14;
              reg17 <= $signed((&{wire0[(2'h2):(2'h2)], (~&wire3)}));
              reg18 <= reg8;
            end
          else
            begin
              reg16 <= (({$signed((reg13 <= reg10)),
                      $signed(reg16[(3'h6):(3'h5)])} ?
                  wire2 : $unsigned((8'ha3))) | reg7[(4'h8):(3'h5)]);
            end
        end
      else
        begin
          reg13 <= (reg6 ?
              {(&{(^(8'haf))}),
                  (&$signed(reg14[(1'h0):(1'h0)]))} : $signed({$signed($signed(reg7)),
                  $signed($unsigned(wire2))}));
          reg14 <= ($signed(($unsigned($signed(reg18)) | $unsigned((reg7 ?
                  reg5 : reg4)))) ?
              reg17[(2'h3):(1'h0)] : (~|({reg7, {reg15}} ?
                  $unsigned(reg14[(4'h9):(2'h2)]) : (reg7[(3'h6):(3'h4)] != {(8'hb1)}))));
          reg15 <= (!$unsigned($unsigned({((8'h9f) ^ (8'ha1))})));
          reg16 <= $unsigned(reg7);
          reg17 <= $unsigned(reg8);
        end
      reg19 <= reg17[(5'h11):(5'h11)];
    end
  always
    @(posedge clk) begin
      if ((~^reg15))
        begin
          reg20 <= (&($signed((^~(reg17 || reg5))) ~^ (8'ha8)));
          if ((~^reg4[(1'h1):(1'h0)]))
            begin
              reg21 <= reg7[(1'h0):(1'h0)];
              reg22 <= reg20;
              reg23 <= wire3;
              reg24 <= $signed((!($signed(reg18[(4'hd):(4'h8)]) ?
                  (reg15 == (reg7 ? reg21 : reg20)) : $signed((&(8'h9c))))));
            end
          else
            begin
              reg21 <= reg8;
            end
          if ((!(^~reg15[(1'h1):(1'h1)])))
            begin
              reg25 <= (!(-$signed(($signed((8'ha5)) ?
                  ((8'had) ~^ reg23) : $signed(reg5)))));
              reg26 <= $signed((8'ha5));
              reg27 <= wire1;
            end
          else
            begin
              reg25 <= {wire1[(3'h7):(3'h4)], reg19};
              reg26 <= reg4;
              reg27 <= $unsigned($unsigned($unsigned({((8'hbe) - reg18)})));
              reg28 <= $unsigned((^~{reg19[(4'hc):(4'h9)]}));
              reg29 <= (-((~{reg21[(2'h2):(2'h2)],
                  reg4[(2'h2):(1'h1)]}) || (reg20 ?
                  reg28 : $signed((reg21 ? reg17 : reg10)))));
            end
        end
      else
        begin
          reg20 <= reg26;
          reg21 <= (($signed((^~$unsigned(reg27))) < ((reg20[(2'h2):(1'h0)] ^ (reg15 ^~ wire0)) ?
              wire3 : reg15[(1'h0):(1'h0)])) ^ reg29[(4'hc):(3'h4)]);
        end
    end
  assign wire30 = ({((reg20[(2'h2):(2'h2)] ?
                              reg13[(1'h0):(1'h0)] : reg4[(2'h2):(1'h1)]) ?
                          (reg23 >>> (reg24 * reg4)) : $signed((reg19 ^~ reg11)))} * (8'hb1));
  assign wire31 = reg6;
  assign wire32 = wire2;
  always
    @(posedge clk) begin
      reg33 <= wire1;
      reg34 <= reg26[(4'he):(4'ha)];
      reg35 <= ((($signed(wire32[(4'h9):(4'h8)]) ?
              (8'hb4) : reg26[(3'h4):(1'h0)]) ^~ {(((8'hb0) ?
                      (8'ha8) : (8'hb8)) ?
                  $signed(wire2) : ((8'hb6) >= reg13)),
              reg7}) ?
          ((reg16[(4'h8):(4'h8)] ?
                  $unsigned($unsigned(reg7)) : (((7'h42) != reg5) || (reg34 << reg6))) ?
              reg18 : $signed(($signed(reg24) ~^ $signed(reg5)))) : (~|$unsigned((~((8'hb7) ?
              wire32 : reg9)))));
      if ((~&(^~((reg22[(2'h3):(2'h2)] ?
          ((8'hae) + reg25) : (8'hb8)) == $signed($unsigned(reg34))))))
        begin
          if ($unsigned({(reg9[(3'h5):(2'h3)] ? (~&{reg14, reg29}) : (|reg16)),
              $signed($signed(reg7[(1'h0):(1'h0)]))}))
            begin
              reg36 <= reg28;
              reg37 <= reg36[(2'h2):(2'h2)];
              reg38 <= reg25[(2'h3):(2'h2)];
              reg39 <= (wire30[(3'h4):(2'h2)] + (!reg38));
              reg40 <= (^~(~|$unsigned({(^~reg12), $unsigned((8'ha1))})));
            end
          else
            begin
              reg36 <= {(-(wire30[(1'h1):(1'h1)] >> $signed((~^(8'ha1))))),
                  ((({(7'h44)} == $unsigned(reg18)) >>> $signed((reg28 != reg15))) ?
                      (~&(8'h9f)) : $unsigned(((reg5 ^~ reg5) << $unsigned(reg33))))};
            end
          reg41 <= reg6[(2'h3):(1'h0)];
          reg42 <= $unsigned($signed((~^(reg22 ?
              (~&reg15) : (reg9 ? wire30 : wire0)))));
          if ((wire32 > reg13[(1'h1):(1'h1)]))
            begin
              reg43 <= reg25;
              reg44 <= $unsigned(reg20);
              reg45 <= reg41[(3'h4):(2'h2)];
              reg46 <= reg21;
              reg47 <= ((($signed($unsigned(reg26)) | $unsigned(wire0)) ?
                      (+($unsigned(reg9) <<< ((8'hac) >>> reg39))) : $unsigned($unsigned(wire1))) ?
                  $signed((^~(wire0[(2'h2):(2'h2)] ?
                      ((8'hb0) ^ reg41) : (reg22 ?
                          reg12 : reg24)))) : ($signed(($unsigned(reg27) ?
                      $unsigned(reg5) : $signed(reg6))) | $signed($signed((reg37 ?
                      reg42 : (8'ha1))))));
            end
          else
            begin
              reg43 <= $signed($unsigned(reg17[(3'h7):(3'h6)]));
              reg44 <= reg43[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg36 <= reg36;
          reg37 <= $unsigned({$signed(wire2)});
          reg38 <= wire32;
          if ((!reg9[(4'hb):(4'hb)]))
            begin
              reg39 <= $unsigned(reg40[(3'h5):(3'h5)]);
              reg40 <= $unsigned($signed(reg16[(4'hf):(2'h3)]));
              reg41 <= $signed({$unsigned(reg24[(3'h7):(1'h1)]),
                  (~&$signed((reg15 <= (8'h9c))))});
            end
          else
            begin
              reg39 <= reg13[(3'h4):(2'h2)];
              reg40 <= (((reg47 << {((8'ha2) ?
                      reg15 : reg45)}) < (-({wire30} >> reg39))) || (!($unsigned(reg27[(1'h1):(1'h0)]) << (reg17 + (reg36 ?
                  reg26 : reg7)))));
              reg41 <= (~$signed(reg39[(3'h4):(1'h0)]));
            end
          reg42 <= {(|$signed({reg40[(4'he):(3'h7)], (~^(8'h9c))}))};
        end
      reg48 <= (~|reg8[(3'h6):(2'h3)]);
    end
  assign wire49 = (~reg38);
  assign wire50 = $signed(($signed(reg13[(1'h0):(1'h0)]) ?
                      reg36 : ((8'hba) ? reg9[(4'hf):(4'ha)] : reg20)));
  assign wire51 = ({{((reg22 ? reg12 : reg16) ? (reg9 < (8'hbb)) : (8'ha0)),
                              $signed(wire3[(4'hb):(4'h9)])}} ?
                      (reg15[(1'h1):(1'h1)] ?
                          ($signed($unsigned(reg46)) & {reg35[(1'h1):(1'h1)],
                              reg43}) : {(^~(reg26 ? wire49 : (8'hae))),
                              reg27}) : ($signed((((8'ha0) ~^ reg35) ?
                          $signed((8'had)) : reg25[(2'h3):(2'h3)])) + $unsigned(reg26)));
  assign wire52 = $signed((reg42[(4'hc):(3'h7)] ?
                      reg27 : wire2[(3'h6):(1'h1)]));
  assign wire53 = {$unsigned(reg13), reg20};
  assign wire54 = $unsigned((^reg44));
endmodule
