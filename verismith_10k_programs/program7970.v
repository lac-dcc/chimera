module top
#(parameter param40 = (~((^~{(^~(8'hb8))}) <<< ((!(&(8'hb4))) ? (&(8'hb1)) : (-{(8'ha1)})))), 
parameter param41 = {param40})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  assign y = {wire39,
                 wire5,
                 wire4,
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
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = ({wire1[(1'h1):(1'h0)],
                     ((wire0[(2'h2):(1'h1)] != wire2) || wire2)} >= wire1[(1'h0):(1'h0)]);
  assign wire5 = (8'hbf);
  always
    @(posedge clk) begin
      if ((+wire1[(2'h2):(2'h2)]))
        begin
          reg6 <= (wire2[(1'h1):(1'h1)] ?
              $signed(((~{wire0}) >= wire5)) : $unsigned($signed($unsigned(wire5[(2'h3):(2'h2)]))));
          reg7 <= ($signed($unsigned((wire4[(1'h0):(1'h0)] ?
                  (~|wire2) : $signed(wire1)))) ?
              (wire5[(1'h0):(1'h0)] + wire5[(2'h3):(2'h3)]) : (~{(+wire0[(3'h5):(1'h0)]),
                  {$unsigned(wire3)}}));
          if (wire0[(3'h6):(1'h0)])
            begin
              reg8 <= wire5[(1'h1):(1'h1)];
              reg9 <= ((($unsigned($signed(reg8)) >= $unsigned($unsigned(wire1))) && wire5[(2'h2):(1'h0)]) ?
                  reg6[(3'h5):(1'h0)] : wire3);
              reg10 <= ((((&wire1[(1'h1):(1'h1)]) ?
                  wire1[(2'h3):(1'h0)] : ((reg8 ? reg6 : wire4) ?
                      {reg6,
                          (8'ha5)} : (|wire5))) >>> reg7[(5'h11):(4'hd)]) ^ $unsigned(reg7));
              reg11 <= wire3;
              reg12 <= $unsigned((wire4 ?
                  $signed(((wire4 ? wire3 : reg10) ?
                      wire0[(1'h1):(1'h0)] : $unsigned(wire2))) : $unsigned(reg6[(5'h12):(4'h8)])));
            end
          else
            begin
              reg8 <= wire4[(2'h2):(1'h0)];
              reg9 <= ($signed({(|(!wire1))}) ?
                  ({(~$unsigned((8'hae))),
                      $unsigned(wire1)} | reg10) : $unsigned($signed(reg11)));
              reg10 <= $unsigned(($signed(($unsigned(reg9) ?
                  $unsigned(reg9) : (8'h9d))) >= $signed(reg8)));
              reg11 <= {$unsigned({(wire0 ?
                          $signed(reg11) : wire4[(1'h0):(1'h0)])}),
                  (reg7 >= wire2[(1'h1):(1'h0)])};
            end
          reg13 <= (reg12[(3'h6):(3'h6)] << $signed(wire4));
        end
      else
        begin
          if ((($unsigned((^~(reg6 ?
              wire3 : reg7))) == reg13[(1'h1):(1'h0)]) ^ {(reg11[(3'h7):(1'h1)] ?
                  reg8 : ($unsigned((7'h43)) * (reg6 || wire1))),
              {$signed({wire2, (8'hb7)})}}))
            begin
              reg6 <= wire3[(1'h1):(1'h0)];
              reg7 <= ($unsigned($signed(((-reg13) ?
                  $signed(wire3) : (wire3 ?
                      wire5 : wire0)))) & ($unsigned(reg7) ~^ reg10[(1'h1):(1'h1)]));
            end
          else
            begin
              reg6 <= (!($signed($signed((wire0 + reg8))) * reg8[(2'h2):(2'h2)]));
              reg7 <= reg12;
              reg8 <= (wire2[(2'h3):(1'h1)] ?
                  ({((^~(7'h42)) ~^ reg11[(3'h4):(1'h1)])} ?
                      reg6 : $unsigned((^$signed(wire5)))) : wire3[(3'h6):(1'h1)]);
              reg9 <= (-{$signed((-(wire1 ? reg8 : (8'hb2)))),
                  $signed($unsigned(reg9))});
            end
          reg10 <= $unsigned($signed(wire4));
          reg11 <= $signed(reg6);
          reg12 <= (-reg10);
        end
      if ((wire4 ? wire2[(1'h0):(1'h0)] : $signed({wire2})))
        begin
          if ($unsigned(wire4[(1'h1):(1'h0)]))
            begin
              reg14 <= {(^~$signed(reg11[(3'h6):(3'h4)])),
                  {wire0, (!$signed($unsigned(reg8)))}};
              reg15 <= reg11;
              reg16 <= reg7[(5'h12):(5'h12)];
            end
          else
            begin
              reg14 <= reg10;
              reg15 <= $unsigned(((^~(&$unsigned(wire1))) ?
                  reg10 : ($unsigned(wire1) ?
                      ($signed((8'ha3)) ~^ wire0[(1'h0):(1'h0)]) : $signed($signed(reg6)))));
              reg16 <= $signed((reg15[(4'he):(4'hb)] & {$signed(wire1)}));
              reg17 <= reg10;
            end
        end
      else
        begin
          if ({$signed($unsigned($unsigned(((8'ha1) * reg7))))})
            begin
              reg14 <= reg15[(4'hc):(1'h1)];
              reg15 <= wire0[(2'h2):(2'h2)];
              reg16 <= (^(^reg7));
            end
          else
            begin
              reg14 <= (^((((|reg17) ?
                      $unsigned((8'hb6)) : (reg14 >> (8'hb3))) ?
                  (|$signed(reg8)) : {reg14[(1'h1):(1'h1)]}) < ((wire1[(2'h3):(1'h1)] ?
                  wire1[(2'h3):(2'h3)] : (wire3 > reg14)) < $unsigned($signed((8'had))))));
              reg15 <= {(reg13 * reg10[(3'h5):(3'h5)])};
            end
          reg17 <= (~^(-(wire0 + (8'haa))));
          reg18 <= $signed((reg9[(4'h9):(1'h0)] >= $unsigned((reg10 * {(7'h44),
              (8'h9f)}))));
          if (((-(~^reg15[(3'h6):(3'h4)])) ^~ {$unsigned((~$signed((8'hb1)))),
              ($signed((reg12 ? wire5 : (8'had))) ?
                  {(reg18 ? reg12 : (8'hb1))} : $signed({reg15, reg18}))}))
            begin
              reg19 <= (reg16[(1'h0):(1'h0)] && ((!$unsigned((8'hbc))) ^~ $unsigned((&{reg7}))));
              reg20 <= reg16[(3'h6):(1'h0)];
            end
          else
            begin
              reg19 <= {($signed($signed((reg9 <<< wire4))) ?
                      wire0[(1'h1):(1'h0)] : $signed(wire2)),
                  (reg19 == reg15[(2'h2):(1'h1)])};
              reg20 <= $unsigned((8'hb1));
              reg21 <= (~&((~&((wire0 ? wire2 : reg12) ?
                  reg14 : (wire0 - reg6))) ^ reg18[(2'h3):(1'h0)]));
              reg22 <= wire3;
              reg23 <= wire3[(1'h0):(1'h0)];
            end
          if ($signed(($unsigned(reg19[(3'h7):(1'h1)]) & (8'hbe))))
            begin
              reg24 <= reg16[(4'h9):(1'h1)];
              reg25 <= reg21[(1'h1):(1'h1)];
              reg26 <= {$unsigned($signed($signed((reg21 ? reg12 : reg17))))};
              reg27 <= $signed({wire3,
                  {$unsigned(wire4), reg11[(2'h2):(2'h2)]}});
              reg28 <= (8'hb3);
            end
          else
            begin
              reg24 <= reg24[(3'h4):(3'h4)];
              reg25 <= ((+({reg12[(4'hb):(1'h0)], (|reg24)} & ({reg23, reg25} ?
                  ((8'ha9) <= reg9) : {reg24, (8'h9f)}))) ^ (~|(((&(8'ha6)) ?
                  $unsigned(reg26) : $unsigned(reg10)) != (~&(wire1 ?
                  reg23 : (8'ha4))))));
              reg26 <= ($unsigned((((&reg14) & (wire2 ? reg9 : reg26)) ?
                  reg13[(1'h0):(1'h0)] : {reg12})) || (+reg9));
              reg27 <= (((((~&reg28) ? {reg23} : (reg21 - reg13)) * reg22) ?
                      (^reg12) : $signed(($signed(reg18) << {wire2}))) ?
                  $unsigned((reg17[(3'h4):(3'h4)] ?
                      $signed((~&reg11)) : reg21)) : (+$unsigned({(~reg10),
                      (reg22 >>> reg18)})));
            end
        end
      reg29 <= $unsigned({$signed(((wire4 ?
              reg16 : reg16) | $signed((8'ha9))))});
    end
  always
    @(posedge clk) begin
      reg30 <= (reg12 ?
          (~^reg11[(1'h0):(1'h0)]) : (~{($signed(reg29) ?
                  $signed((8'h9e)) : reg20),
              {(~^wire3), (reg25 ? wire3 : reg12)}}));
      reg31 <= {$signed({$unsigned({reg18, reg24}), reg23[(2'h2):(2'h2)]})};
      if (reg19)
        begin
          if (($signed((((reg8 ^ reg8) ?
                      (reg13 | reg13) : (reg24 ? wire2 : reg29)) ?
                  $signed((wire5 + reg31)) : reg20[(3'h5):(2'h2)])) ?
              (|(^{(^~reg27), $unsigned(reg17)})) : reg31))
            begin
              reg32 <= ($signed(reg27[(5'h14):(2'h3)]) >> $signed((&wire0)));
              reg33 <= ($signed((reg22[(1'h0):(1'h0)] ?
                  ((wire3 ? wire1 : reg25) ?
                      (reg20 ?
                          reg18 : wire5) : (wire0 & (7'h43))) : (reg17 && reg27))) && wire1);
              reg34 <= reg24[(3'h6):(2'h3)];
              reg35 <= ((~^wire1) ^~ reg25[(1'h1):(1'h0)]);
              reg36 <= ((+($signed(reg19) ?
                  reg35[(3'h7):(3'h5)] : $unsigned((~&reg17)))) | {(reg27 ?
                      ((reg27 | reg11) ^ (reg25 ?
                          reg34 : reg20)) : wire1[(2'h2):(1'h1)])});
            end
          else
            begin
              reg32 <= reg36;
              reg33 <= (8'had);
              reg34 <= $unsigned((~&reg30));
            end
        end
      else
        begin
          if ($signed(reg29))
            begin
              reg32 <= {((~^(~$unsigned(reg20))) ?
                      ({{(8'h9f), reg11}, ((8'hb4) | reg7)} == ((reg29 ?
                              (8'ha9) : wire5) ?
                          (reg20 - reg19) : (~^(8'hb7)))) : ((8'ha9) ?
                          wire5 : (wire0 == reg34[(4'ha):(3'h5)]))),
                  (^~{(8'h9e)})};
              reg33 <= (reg18[(1'h1):(1'h1)] < reg15);
              reg34 <= ($signed((reg31 ?
                  $signed(((8'ha8) ^~ wire0)) : ((|reg20) ^ reg12[(3'h5):(1'h0)]))) <= $unsigned(($unsigned((^~reg19)) | reg17)));
              reg35 <= reg29;
            end
          else
            begin
              reg32 <= $unsigned((~^{($signed(wire4) ?
                      $signed(reg8) : $signed(reg9)),
                  reg26[(1'h1):(1'h0)]}));
              reg33 <= (7'h41);
            end
          reg36 <= reg10[(1'h0):(1'h0)];
          reg37 <= reg24;
          reg38 <= ($signed((~|(reg25[(3'h4):(1'h0)] >> (8'hb1)))) << reg22);
        end
    end
  assign wire39 = {(reg15[(5'h11):(4'ha)] + wire2)};
endmodule
