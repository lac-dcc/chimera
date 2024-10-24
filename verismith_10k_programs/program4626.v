module top
#(parameter param50 = ((8'h9d) ? ((-{{(7'h44)}}) ^~ (({(8'ha1), (8'hb3)} ? ((8'hb1) ^~ (8'ha8)) : ((8'hab) < (8'h9e))) | ((!(7'h42)) ? (~|(8'ha5)) : ((8'haf) ? (7'h44) : (8'hba))))) : {(((8'haf) < ((8'h9c) ? (8'haa) : (8'hb6))) <= (((8'hac) ~^ (7'h44)) || {(8'h9d)}))}), 
parameter param51 = param50)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h22b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire49,
                 wire20,
                 wire4,
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
                 (1'h0)};
  assign wire4 = wire1[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg5 <= ($signed($unsigned(wire4)) & $signed({(~^(wire2 & wire2))}));
      reg6 <= (wire3 ~^ wire1[(3'h6):(1'h0)]);
      reg7 <= wire0;
      if ($signed(((&$signed((reg6 < reg6))) ^~ (&reg6[(4'h8):(3'h4)]))))
        begin
          if (wire2[(4'hc):(4'h8)])
            begin
              reg8 <= (&$signed((&$signed((8'hab)))));
              reg9 <= {(($unsigned((wire4 >> (8'had))) <<< $unsigned(wire0)) ?
                      (reg8 ?
                          wire4 : wire3[(3'h4):(2'h2)]) : (^~$signed(reg7[(1'h1):(1'h0)]))),
                  reg6};
              reg10 <= (wire0 ? (~&(&wire2)) : reg6[(4'hd):(4'hd)]);
              reg11 <= reg8;
            end
          else
            begin
              reg8 <= (^~{(~|reg9)});
              reg9 <= $signed($signed($signed($signed(((8'hba) ?
                  reg8 : wire0)))));
              reg10 <= reg9[(2'h2):(2'h2)];
            end
          reg12 <= ($signed(wire4) - wire0);
          reg13 <= ($unsigned(((~^reg12[(3'h6):(2'h2)]) != reg11[(3'h7):(1'h1)])) >>> $unsigned((~$unsigned(((8'hb7) + wire4)))));
          if ($signed((($signed((reg9 ?
              wire4 : wire3)) != (~|(-wire1))) >>> (wire4 ?
              wire4[(4'hf):(4'hc)] : ((-reg7) <<< $unsigned(reg11))))))
            begin
              reg14 <= $unsigned(reg13[(1'h0):(1'h0)]);
              reg15 <= reg11[(3'h5):(3'h4)];
              reg16 <= $signed($unsigned(($signed($signed(wire1)) ?
                  ((+wire2) & reg13[(2'h3):(1'h0)]) : (^$signed(reg6)))));
            end
          else
            begin
              reg14 <= reg8[(1'h1):(1'h1)];
              reg15 <= $signed((~$signed((reg9[(2'h2):(1'h1)] ?
                  reg14 : (reg15 ? (8'hbe) : reg6)))));
              reg16 <= {wire1};
              reg17 <= (reg7 ?
                  {(~|$unsigned((reg6 ? reg12 : (8'ha6))))} : (8'hba));
            end
          reg18 <= (-(~&(!((wire3 ? reg15 : wire2) ?
              reg15[(4'hd):(4'ha)] : wire2[(5'h10):(3'h7)]))));
        end
      else
        begin
          if (reg5[(5'h10):(4'h8)])
            begin
              reg8 <= (reg17[(1'h0):(1'h0)] ?
                  ((+{reg6[(4'hd):(4'hb)]}) ?
                      (reg7[(2'h3):(2'h3)] ^ reg15[(4'ha):(3'h4)]) : {$signed($signed(reg15))}) : (!wire0[(4'ha):(2'h3)]));
              reg9 <= {((8'haa) ? $unsigned(reg18) : $unsigned($signed(reg6))),
                  (!(~&($unsigned(reg5) ~^ $unsigned(wire3))))};
              reg10 <= $unsigned($unsigned((~reg11)));
              reg11 <= reg8;
              reg12 <= $signed($signed((($signed((8'hac)) | (^reg6)) ?
                  (~^(~&(7'h40))) : {(reg5 ? reg7 : reg11), $signed(reg10)})));
            end
          else
            begin
              reg8 <= $unsigned((+$unsigned(reg16)));
            end
          reg13 <= (($signed({(8'ha9),
                  {reg6, wire3}}) + $unsigned($unsigned(reg7))) ?
              (wire3 >= $unsigned($signed({reg6,
                  (8'hbc)}))) : wire0[(2'h2):(1'h0)]);
          reg14 <= (8'hb5);
        end
      reg19 <= $signed(reg17);
    end
  assign wire20 = (wire1[(3'h5):(3'h5)] >> ((8'hbd) ?
                      $unsigned((reg13 ?
                          wire2 : reg6[(4'he):(1'h0)])) : {$unsigned((reg14 ?
                              wire2 : reg5)),
                          ($unsigned(reg8) ?
                              (reg17 ? (8'hab) : reg9) : (~&reg6))}));
  always
    @(posedge clk) begin
      reg21 <= $unsigned(((((+reg15) <<< {reg19,
              reg10}) + (~|$unsigned(wire2))) ?
          reg13 : (~&({reg12} ? $unsigned(reg10) : reg13))));
      reg22 <= (reg13 <= wire3);
      if (reg6[(1'h1):(1'h0)])
        begin
          reg23 <= (8'ha0);
          reg24 <= $signed(reg15);
          if (reg12)
            begin
              reg25 <= (~|reg16);
            end
          else
            begin
              reg25 <= $unsigned(wire2[(4'ha):(3'h6)]);
              reg26 <= reg22;
              reg27 <= (reg16[(4'h9):(3'h5)] & ($unsigned((|reg8[(4'h8):(3'h6)])) < $unsigned((^~(reg6 ?
                  reg19 : reg14)))));
              reg28 <= $unsigned((reg15 ?
                  $unsigned(((wire2 ? reg9 : reg18) ?
                      (|wire20) : (reg14 ?
                          reg15 : reg10))) : $unsigned($signed($signed(reg11)))));
              reg29 <= wire1[(3'h5):(2'h3)];
            end
          if (($unsigned((($unsigned(reg17) == reg13[(1'h0):(1'h0)]) >>> $signed((8'hac)))) ?
              reg16[(2'h2):(1'h1)] : $unsigned((-(reg26 - $unsigned(reg12))))))
            begin
              reg30 <= {(reg17 == $unsigned($signed($signed(reg26))))};
              reg31 <= (^~reg30);
              reg32 <= ((!$signed($signed($signed(wire0)))) + reg23[(4'hb):(4'hb)]);
            end
          else
            begin
              reg30 <= $unsigned(((((8'h9f) >> $signed((7'h44))) != $unsigned($unsigned(reg23))) < {(+((8'hab) ?
                      reg28 : (8'hbb)))}));
              reg31 <= $signed(wire0);
              reg32 <= (-(8'hbc));
              reg33 <= ({{(wire0 - reg11[(1'h1):(1'h1)]), reg13[(1'h0):(1'h0)]},
                  (reg29[(4'h8):(3'h5)] ?
                      $unsigned(reg25[(4'h8):(1'h1)]) : (reg18[(1'h0):(1'h0)] == (wire1 ?
                          wire2 : reg24)))} > (^~$signed($unsigned(reg10[(2'h2):(1'h1)]))));
            end
          reg34 <= ($unsigned(((reg16[(4'hc):(3'h7)] <<< (!wire0)) == reg33)) ?
              {$unsigned((!$signed(wire20))),
                  $signed($signed($signed(reg27)))} : reg31);
        end
      else
        begin
          if ($unsigned(($signed($signed($unsigned((8'hb4)))) ?
              (~|reg19[(5'h11):(4'he)]) : $unsigned($signed({reg16, wire1})))))
            begin
              reg23 <= ($signed(reg7[(1'h1):(1'h0)]) ?
                  reg7[(2'h3):(1'h0)] : $signed((!wire4)));
              reg24 <= reg18;
              reg25 <= wire1;
              reg26 <= (+reg22);
            end
          else
            begin
              reg23 <= reg17;
            end
          reg27 <= reg30;
        end
      reg35 <= ({((!(~^reg21)) ?
                  $unsigned({(8'ha3)}) : $unsigned({reg33, reg10})),
              $signed((wire3[(4'hc):(3'h7)] ? reg13 : $unsigned(reg6)))} ?
          reg8 : (&((~|(reg12 != (8'hba))) ?
              (~^$unsigned(wire20)) : (~^$signed(reg28)))));
      if (reg23)
        begin
          if (wire20[(3'h7):(2'h3)])
            begin
              reg36 <= $unsigned(((-((~^(8'hb0)) ^~ reg6)) ?
                  $unsigned({$signed(reg33)}) : reg29));
              reg37 <= $signed((|reg10[(2'h3):(2'h3)]));
              reg38 <= {reg14[(2'h2):(1'h0)],
                  {$signed(({reg9} ? $signed((8'ha0)) : reg14))}};
              reg39 <= ($signed((-$unsigned((reg34 ? reg10 : reg8)))) ?
                  ($unsigned((8'hbf)) ?
                      (reg25[(1'h1):(1'h0)] ~^ ((|reg29) && {(8'ha4),
                          reg21})) : (!reg28[(3'h4):(1'h0)])) : ({($signed(reg25) ?
                          (!reg15) : (reg9 ?
                              wire1 : reg17))} - (reg5 - (((8'hb1) < reg29) + (wire1 ?
                      reg16 : reg13)))));
              reg40 <= $signed((!$signed(wire1[(2'h2):(1'h1)])));
            end
          else
            begin
              reg36 <= (+reg14[(1'h0):(1'h0)]);
              reg37 <= (8'hb7);
              reg38 <= {$signed((+((|reg39) ? $signed(wire1) : (-(8'hb6)))))};
              reg39 <= reg38;
            end
          reg41 <= (reg18[(2'h3):(1'h1)] ?
              $signed($unsigned((^reg40))) : $signed((~&({reg27} << (&reg34)))));
          reg42 <= (~&{(($unsigned(reg26) ?
                  (~(8'hb1)) : reg6) && $signed(reg26))});
          reg43 <= {$signed(wire2), (~&reg22[(2'h2):(2'h2)])};
          reg44 <= reg5[(1'h0):(1'h0)];
        end
      else
        begin
          reg36 <= (~|((((-reg35) ?
              {(8'hab)} : $signed(reg5)) ~^ $signed((reg23 ?
              reg22 : wire20))) ^~ (({reg5,
              reg7} != $unsigned(reg8)) ^ (~&{reg29, (7'h42)}))));
          reg37 <= (~|{$unsigned((reg44 ?
                  $unsigned(reg44) : wire0[(2'h2):(1'h1)]))});
          reg38 <= {((^$signed(reg32[(4'h9):(3'h5)])) ^~ $signed(reg43[(1'h0):(1'h0)]))};
          reg39 <= ((wire20[(3'h4):(1'h1)] << reg10[(3'h6):(1'h1)]) ?
              (~^(8'hb4)) : $unsigned(reg43));
        end
    end
  always
    @(posedge clk) begin
      reg45 <= (~|(($signed(reg33) >> $signed($unsigned(reg43))) >>> ({(reg40 ?
                  reg25 : (8'ha4))} ?
          (reg12 ? reg7 : (~&reg21)) : $signed($unsigned(reg23)))));
      reg46 <= ($unsigned(reg39[(2'h3):(2'h2)]) ?
          $unsigned({$signed($signed((8'hba))),
              (~|$unsigned(reg29))}) : (~^$signed((|reg22[(4'h9):(4'h8)]))));
      reg47 <= reg19;
      reg48 <= (reg31[(4'ha):(2'h2)] ^~ (((~^(+reg12)) ?
          $signed(((8'hb6) ?
              reg47 : reg47)) : $signed({reg17})) != (($signed(wire0) ?
              (reg47 ? reg9 : reg21) : reg32) ?
          reg19[(4'hb):(4'ha)] : (~reg25[(3'h7):(2'h2)]))));
    end
  assign wire49 = (~|reg8[(2'h3):(2'h2)]);
endmodule
