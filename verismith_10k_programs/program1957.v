module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1bb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire43;
  wire [(5'h13):(1'h0)] wire42;
  wire [(4'ha):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire30,
                 wire29,
                 wire26,
                 wire5,
                 wire4,
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
                 reg28,
                 reg27,
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
                 (1'h0)};
  assign wire4 = ((+wire1[(3'h4):(1'h1)]) <<< (-(((-wire3) ?
                     (~&wire3) : (!wire2)) > wire0[(3'h5):(3'h5)])));
  assign wire5 = ($signed({wire4, $signed((wire3 >>> wire0))}) ?
                     $unsigned($signed($signed((&(8'ha3))))) : wire4);
  always
    @(posedge clk) begin
      reg6 <= wire2[(3'h5):(1'h1)];
      if (wire5)
        begin
          reg7 <= $signed((!(~|wire2[(4'hc):(4'h9)])));
        end
      else
        begin
          reg7 <= $unsigned($unsigned($unsigned(((wire5 <= wire2) ?
              $unsigned(wire5) : (wire2 ? wire3 : wire2)))));
          reg8 <= ($signed($unsigned($signed(wire1))) ?
              $unsigned(wire0[(4'ha):(2'h2)]) : wire5[(4'h8):(3'h4)]);
          if (wire4[(3'h4):(1'h1)])
            begin
              reg9 <= wire0[(4'h8):(2'h2)];
              reg10 <= (wire0[(4'ha):(4'h8)] ?
                  wire2[(1'h1):(1'h1)] : $unsigned(wire5));
              reg11 <= ({wire0, $signed(({wire5, wire0} || (~reg10)))} & wire2);
              reg12 <= reg8[(2'h3):(1'h1)];
              reg13 <= ((($unsigned(((8'ha6) ?
                      reg7 : wire4)) >> reg6[(4'hf):(2'h2)]) ?
                  (((^~wire5) ? {reg6} : $unsigned(wire1)) ?
                      (~&wire3) : $signed(((8'hac) ?
                          reg7 : reg6))) : $unsigned((wire2[(3'h6):(1'h1)] ?
                      (wire1 ? (8'had) : reg12) : $signed((8'hb0))))) | (reg6 ?
                  (8'hab) : wire0[(2'h3):(1'h0)]));
            end
          else
            begin
              reg9 <= $signed(reg10[(1'h0):(1'h0)]);
              reg10 <= (|$signed(((~^(!reg12)) ~^ wire5)));
              reg11 <= ((((|(^wire2)) ?
                  (((8'ha7) != reg11) ~^ $unsigned(wire2)) : wire3) ^ reg12[(5'h11):(3'h6)]) << wire1[(4'h8):(3'h6)]);
            end
          reg14 <= (^~$signed(((7'h44) ^~ reg11)));
          reg15 <= reg13[(1'h1):(1'h0)];
        end
      reg16 <= {(reg10[(2'h3):(2'h2)] & (reg11 ?
              ((-reg15) & (reg15 ? reg7 : (7'h43))) : reg10[(1'h0):(1'h0)]))};
      if (wire1[(3'h7):(1'h0)])
        begin
          if ($signed(wire1))
            begin
              reg17 <= (((({wire5, wire3} ?
                  (reg15 ?
                      reg11 : reg11) : $signed(wire0)) ^~ ((reg9 && (8'h9f)) >> $signed((7'h40)))) ^~ $unsigned(reg7[(4'h9):(3'h7)])) & {((-$signed(reg10)) < wire5)});
              reg18 <= ($signed({$unsigned(reg13[(4'h9):(3'h4)])}) ?
                  (-reg16) : reg6[(2'h3):(1'h0)]);
              reg19 <= wire2[(3'h5):(2'h3)];
              reg20 <= ((($unsigned((^~reg18)) && reg15[(1'h1):(1'h0)]) || (wire4[(2'h2):(2'h2)] ?
                  ({reg8} ^~ (reg13 <<< reg18)) : (!(reg16 ?
                      (8'h9e) : (8'hb3))))) & reg7);
            end
          else
            begin
              reg17 <= reg10;
              reg18 <= ($signed($unsigned($signed((^(8'h9d))))) ^~ {(~&reg15[(2'h2):(2'h2)]),
                  reg19[(2'h2):(1'h1)]});
              reg19 <= $signed(((|reg13) ?
                  {$unsigned(reg8)} : reg11[(4'ha):(2'h3)]));
              reg20 <= $unsigned(reg17);
            end
          reg21 <= $signed(((~&((reg19 & reg10) - wire2)) ?
              reg10[(3'h4):(3'h4)] : reg17));
        end
      else
        begin
          if ((-$unsigned($signed(wire1[(4'ha):(1'h1)]))))
            begin
              reg17 <= ((reg6[(4'hb):(3'h7)] ? reg21 : reg21) ?
                  reg10 : {$unsigned(reg10[(2'h3):(1'h1)])});
              reg18 <= $unsigned($signed($unsigned(($unsigned(reg21) == {wire0,
                  (7'h42)}))));
              reg19 <= $unsigned($unsigned({$unsigned(reg11),
                  {$unsigned(wire0)}}));
            end
          else
            begin
              reg17 <= reg9;
              reg18 <= $unsigned(reg14[(2'h3):(2'h2)]);
              reg19 <= $signed(reg13[(4'hd):(1'h1)]);
            end
          reg20 <= reg7;
          if ($signed({$unsigned(((&(7'h44)) ?
                  reg17[(3'h6):(3'h5)] : $signed(reg17)))}))
            begin
              reg21 <= $unsigned(reg19[(1'h1):(1'h1)]);
              reg22 <= ((!$signed({(8'hab)})) + reg19);
              reg23 <= $signed(reg11[(2'h2):(1'h0)]);
            end
          else
            begin
              reg21 <= (+reg19[(1'h0):(1'h0)]);
              reg22 <= (reg14 ^ $unsigned(((^$unsigned((8'ha5))) ~^ $unsigned($unsigned(reg21)))));
              reg23 <= wire0[(4'hc):(3'h6)];
              reg24 <= (&reg10);
            end
          reg25 <= reg21;
        end
    end
  assign wire26 = ($signed({$unsigned((reg14 ?
                          reg7 : wire0))}) - (-reg11[(3'h4):(3'h4)]));
  always
    @(posedge clk) begin
      reg27 <= (~($unsigned(wire3[(4'hf):(3'h4)]) != (^~{{wire4, reg6}})));
      reg28 <= $unsigned(reg18[(2'h3):(1'h0)]);
    end
  assign wire29 = $signed({reg11});
  assign wire30 = (reg19[(1'h0):(1'h0)] ? (8'hb8) : reg11);
  always
    @(posedge clk) begin
      if (((((reg18 || (8'hb9)) <<< reg12[(4'h9):(3'h7)]) ^~ {reg8}) == $unsigned(((reg14 - {reg23}) ^~ wire5))))
        begin
          reg31 <= $unsigned($unsigned((reg17 ?
              (wire4[(2'h3):(1'h1)] || (reg15 & reg23)) : reg19[(1'h1):(1'h0)])));
          if (($unsigned(wire26) ?
              $signed($signed(($unsigned(reg18) ?
                  (+wire4) : (reg23 != wire2)))) : (8'hb6)))
            begin
              reg32 <= (^(wire1 - $unsigned(({reg31,
                  reg8} & $unsigned((8'hb0))))));
              reg33 <= $signed((reg11[(3'h7):(3'h7)] >> (((reg21 ?
                  (8'hac) : (8'ha2)) >= $unsigned(reg28)) + $signed((reg22 - reg13)))));
              reg34 <= $signed($signed(((&(reg15 ? reg9 : reg17)) ?
                  $unsigned($unsigned(reg18)) : {(+(8'haa))})));
              reg35 <= wire3;
              reg36 <= $unsigned((((~|(reg21 ?
                      (8'hbd) : reg25)) | $signed(reg27[(4'hf):(3'h7)])) ?
                  {(^~reg11), reg32[(3'h7):(3'h6)]} : ((reg22 ?
                      $unsigned(wire2) : {reg11}) || $unsigned((reg18 - (8'ha3))))));
            end
          else
            begin
              reg32 <= wire2;
              reg33 <= reg11;
              reg34 <= $signed((reg23[(3'h7):(3'h7)] ?
                  (~|($signed(wire4) ?
                      $signed(reg34) : (8'ha3))) : ((~&(reg28 <= reg22)) ?
                      ((reg11 ? wire5 : wire26) ?
                          (reg34 > (8'had)) : $signed(wire5)) : reg28[(2'h2):(1'h1)])));
              reg35 <= {{{(~^(wire0 > reg35))}}};
            end
        end
      else
        begin
          if (((~|(!reg25)) * (~&reg24)))
            begin
              reg31 <= (~^wire5);
              reg32 <= wire26;
            end
          else
            begin
              reg31 <= (!(reg28 ?
                  $signed(((reg27 ?
                      reg28 : reg14) != $signed(wire29))) : (^(~reg14))));
              reg32 <= reg28[(4'hb):(4'hb)];
              reg33 <= ({$unsigned($signed($signed(wire29)))} - ((reg19 ?
                      $signed({(8'hbe), reg31}) : (reg23 >> $signed(reg14))) ?
                  reg23 : {$signed((wire29 < reg27)), reg17}));
              reg34 <= $unsigned({wire3});
            end
          reg35 <= reg20;
          reg36 <= reg20;
          reg37 <= ((reg23 >= (&(wire29[(2'h3):(1'h1)] >= reg15[(2'h2):(2'h2)]))) ?
              (^~{((reg10 < reg9) ? $signed((8'hb9)) : $signed((8'hb3))),
                  (reg11[(4'h9):(2'h2)] - {reg16})}) : ($unsigned(((8'hb7) ?
                  reg7[(4'ha):(3'h4)] : reg20[(1'h0):(1'h0)])) <<< reg22));
          reg38 <= (^$unsigned((wire30 ?
              reg28[(4'hf):(4'he)] : ($signed((8'hb0)) ?
                  wire29[(4'hb):(1'h1)] : (|wire2)))));
        end
      reg39 <= wire3[(4'h8):(3'h4)];
      reg40 <= (reg16 << ({(~&reg36[(4'hd):(2'h3)])} < reg8));
      reg41 <= ($unsigned($unsigned($unsigned((wire2 ?
          reg24 : (8'h9e))))) && $unsigned(($signed(reg38) ?
          $signed(reg23[(4'hc):(1'h0)]) : ((reg23 - reg11) ?
              reg16[(3'h4):(3'h4)] : $signed(reg12)))));
    end
  assign wire42 = (8'ha7);
  assign wire43 = (|$unsigned(reg37[(3'h6):(3'h4)]));
endmodule
