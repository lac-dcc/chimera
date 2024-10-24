module top
#(parameter param52 = ({{(&(-(7'h42)))}, ((~(^~(8'h9c))) == (((8'hab) | (8'hbd)) ? (~^(8'hbe)) : ((8'hb4) <= (8'hae))))} ? (((~&((8'ha9) ? (8'hab) : (8'hb6))) ? (((8'hb5) || (8'h9d)) ? ((8'hbc) + (8'hbe)) : ((8'ha1) & (8'h9f))) : ({(8'haf), (8'ha5)} <= ((7'h40) ^ (7'h41)))) ? (8'h9c) : (-{((8'hb8) == (8'hb9))})) : ((((~&(8'hb8)) | ((8'hb0) ? (8'hb7) : (8'h9d))) ? {(&(8'hae))} : ((&(7'h43)) ? (~(8'h9f)) : {(8'h9c)})) ? {(~(8'hbd))} : (^(((7'h44) != (8'hb1)) ? ((8'hb8) ? (8'hb1) : (8'hac)) : (~|(8'hbc)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1ca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  wire [(2'h2):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  assign y = {wire27,
                 wire18,
                 wire17,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire5 = (wire4 ?
                     wire2[(4'ha):(4'h8)] : (({(wire1 >= (8'hb8)),
                             $signed(wire2)} + wire4[(4'ha):(2'h3)]) ?
                         (wire4[(4'h9):(4'h9)] ? wire4 : wire3) : wire1));
  assign wire6 = $unsigned((~($unsigned(wire4[(3'h6):(1'h0)]) ?
                     (8'h9d) : $signed(wire3))));
  assign wire7 = (&((({wire4} ~^ (8'ha2)) ^ ($signed(wire1) ?
                         $unsigned(wire3) : wire2)) ?
                     $unsigned(wire1) : ($unsigned($signed(wire2)) <<< wire5[(3'h7):(3'h7)])));
  assign wire8 = ((!($unsigned($signed(wire3)) >>> $signed($signed(wire6)))) - ((-$unsigned($signed(wire7))) ?
                     wire2[(4'hb):(1'h1)] : {wire3,
                         ((&wire6) ?
                             (wire6 != wire2) : (wire5 ? wire5 : wire0))}));
  assign wire9 = (-$signed(wire7));
  assign wire10 = ($signed($unsigned(wire0)) + (wire0 ?
                      ((wire7 ?
                          $signed(wire1) : (wire4 >>> (8'hbf))) == $signed($unsigned(wire0))) : {((wire9 || wire2) ?
                              $signed(wire0) : $signed(wire3))}));
  assign wire11 = (-wire10);
  always
    @(posedge clk) begin
      reg12 <= $unsigned(wire2);
      reg13 <= {wire2};
      reg14 <= (wire9[(3'h7):(3'h4)] <<< (wire5 && wire10));
      reg15 <= wire3;
      reg16 <= reg15;
    end
  assign wire17 = wire5;
  assign wire18 = (~|{($signed((8'ha9)) || $unsigned({(8'hbe)})),
                      (wire4 & (wire6 != (wire11 ? wire17 : wire11)))});
  always
    @(posedge clk) begin
      if (wire1[(1'h1):(1'h0)])
        begin
          reg19 <= $unsigned((^~{reg14[(4'h9):(3'h7)]}));
          reg20 <= ($signed((~&$signed($unsigned(reg19)))) ?
              wire18[(3'h7):(3'h7)] : $unsigned(($unsigned((reg13 * wire17)) ?
                  {$unsigned(reg14)} : $signed({reg19}))));
        end
      else
        begin
          if ($unsigned((+($signed(wire0[(4'ha):(2'h3)]) ?
              ((wire4 ? (8'hbe) : wire7) << {reg16,
                  (8'ha5)}) : {(wire4 >> (8'hb5))}))))
            begin
              reg19 <= wire18;
              reg20 <= ((~(7'h41)) <<< (~&(7'h40)));
              reg21 <= (~^(|$signed((!(8'ha4)))));
              reg22 <= (~&$signed((reg12 & ((~^wire0) >>> $unsigned(reg16)))));
              reg23 <= (((wire9[(3'h7):(1'h0)] ?
                          ((8'hb2) ?
                              $unsigned(reg12) : (reg22 ?
                                  wire1 : wire1)) : (-(8'hb9))) ?
                      $unsigned($unsigned((wire5 << reg22))) : $signed((8'ha9))) ?
                  ((^($signed(wire10) ?
                      (reg16 || wire4) : $signed(reg21))) - (wire6 ?
                      (^(&wire11)) : (^~reg12[(1'h1):(1'h1)]))) : {reg20[(3'h4):(1'h0)],
                      ($signed($unsigned(wire8)) ?
                          ((~^wire3) ?
                              reg13[(3'h7):(2'h3)] : (wire8 ^ reg13)) : {((8'hb7) ?
                                  wire6 : wire17),
                              wire6})});
            end
          else
            begin
              reg19 <= (~&wire7[(1'h1):(1'h0)]);
              reg20 <= ($unsigned({$unsigned($unsigned(wire0)),
                  wire6[(2'h3):(2'h2)]}) ~^ (((^~$unsigned((8'hba))) == reg15[(1'h0):(1'h0)]) ?
                  $unsigned($signed($unsigned(reg15))) : wire6));
              reg21 <= ((reg23 & $signed(reg12[(1'h1):(1'h1)])) ?
                  (~&$unsigned(((reg22 ?
                      reg23 : (8'ha4)) + $signed(reg12)))) : (^reg23));
              reg22 <= reg21;
            end
        end
      reg24 <= ((^~reg19) * $unsigned($unsigned(reg20[(1'h0):(1'h0)])));
      if (wire11)
        begin
          reg25 <= wire17[(3'h5):(2'h2)];
          reg26 <= reg22[(3'h4):(1'h0)];
        end
      else
        begin
          reg25 <= (!($unsigned({(^reg16),
              reg14}) + ($signed(reg12[(2'h2):(2'h2)]) ?
              wire5[(4'ha):(4'h8)] : (^~(reg16 | wire5)))));
        end
    end
  assign wire27 = wire3[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (reg26[(2'h2):(2'h2)])
        begin
          reg28 <= ($signed((~|$signed($unsigned(reg14)))) > $unsigned({reg14[(3'h4):(1'h0)]}));
          if (reg16[(2'h2):(1'h0)])
            begin
              reg29 <= ({(reg26[(4'h8):(3'h7)] < (-wire7)),
                  (wire1[(1'h0):(1'h0)] << {(+wire5),
                      wire17[(1'h0):(1'h0)]})} ^~ {wire27[(4'h8):(2'h2)],
                  (8'ha3)});
              reg30 <= ($unsigned(wire3) ? $unsigned((8'h9c)) : wire3);
              reg31 <= wire1;
              reg32 <= wire18;
              reg33 <= ($signed($unsigned($unsigned((wire1 != wire11)))) ?
                  reg31 : wire6);
            end
          else
            begin
              reg29 <= (wire0[(4'h8):(2'h3)] ?
                  wire7[(3'h4):(3'h4)] : (+(((reg22 || wire2) ^~ (reg23 == reg24)) ^~ reg21[(3'h4):(3'h4)])));
              reg30 <= (~&{$unsigned($signed({reg23, (8'hbd)}))});
              reg31 <= (reg14 | (((-reg30[(2'h3):(1'h0)]) * $signed((wire6 ~^ reg15))) > wire3[(4'hc):(3'h5)]));
            end
        end
      else
        begin
          reg28 <= reg20[(4'h8):(2'h3)];
          reg29 <= ($signed(wire11[(1'h0):(1'h0)]) - (^~$unsigned(reg15[(1'h0):(1'h0)])));
          reg30 <= ({$unsigned(reg23[(4'hf):(2'h2)])} ?
              (~|($unsigned((wire27 ?
                  wire0 : reg12)) || (!wire3[(1'h0):(1'h0)]))) : reg33[(4'hc):(4'hb)]);
          if (($signed(($signed({wire5}) ?
              ($signed(reg29) > (reg14 ?
                  wire18 : wire3)) : $signed((8'ha9)))) >>> reg12))
            begin
              reg31 <= $signed($unsigned($unsigned(reg25[(2'h2):(1'h1)])));
              reg32 <= (reg19[(2'h3):(1'h1)] >> wire1[(1'h1):(1'h1)]);
            end
          else
            begin
              reg31 <= $signed((^wire6[(4'h8):(1'h0)]));
              reg32 <= reg15[(2'h3):(2'h2)];
              reg33 <= $unsigned(reg24);
              reg34 <= (&reg28);
            end
        end
      reg35 <= (-reg13[(2'h3):(2'h3)]);
      if ((-wire5[(3'h7):(3'h4)]))
        begin
          reg36 <= wire18[(3'h6):(2'h3)];
          reg37 <= {($unsigned(wire2) <= ($unsigned(((8'hbd) ?
                  wire27 : reg23)) >> $unsigned((~^wire9))))};
          reg38 <= {$signed($unsigned($signed((|reg21)))),
              ((({reg29, reg37} ? wire4[(2'h2):(1'h0)] : {(8'h9c)}) ?
                      ((8'hb1) != $unsigned(wire18)) : $unsigned((^~reg13))) ?
                  $signed((reg34[(1'h1):(1'h1)] == reg19[(4'ha):(3'h6)])) : $signed($unsigned(wire3)))};
          if (wire4)
            begin
              reg39 <= $unsigned(($unsigned((((8'haa) & (8'haf)) < $signed(reg30))) >>> $unsigned($signed(wire11))));
              reg40 <= (~((({reg20,
                      wire1} & (reg20 | reg38)) & reg23[(4'hf):(3'h7)]) ?
                  (~(reg12[(1'h0):(1'h0)] ?
                      $signed(reg13) : reg28[(1'h1):(1'h1)])) : $signed($signed({wire1}))));
            end
          else
            begin
              reg39 <= $signed((8'ha8));
              reg40 <= ($unsigned(reg21) > $signed({$unsigned({wire17, wire0}),
                  (~&(reg37 && reg29))}));
              reg41 <= (&(((reg24 != (reg22 ? reg38 : wire17)) && ((wire1 ?
                      wire9 : reg20) ?
                  (^reg38) : (wire17 ? (8'hba) : reg29))) <= (+(+(reg32 ?
                  reg30 : reg35)))));
              reg42 <= (8'hb5);
              reg43 <= reg19[(2'h3):(1'h1)];
            end
          if (((~(reg16 ?
              $signed($signed(reg26)) : ($signed(reg26) ?
                  $unsigned(wire8) : $unsigned(reg42)))) != $unsigned($signed(((reg21 << wire5) > {reg14})))))
            begin
              reg44 <= (~(^((+$unsigned(reg24)) ?
                  $signed(reg35) : {(reg39 ? reg21 : reg21),
                      reg20[(2'h3):(2'h3)]})));
            end
          else
            begin
              reg44 <= (reg40 >>> $unsigned($signed(reg44[(1'h1):(1'h0)])));
              reg45 <= $signed({((reg31 & (reg14 ~^ (8'ha1))) ?
                      $signed({(8'hbf),
                          reg21}) : $unsigned(wire1[(1'h0):(1'h0)]))});
              reg46 <= wire8[(1'h0):(1'h0)];
            end
        end
      else
        begin
          if (($unsigned(wire1) ?
              $signed((((reg29 == wire3) ?
                  (reg32 ?
                      reg23 : wire10) : $signed((8'h9d))) - $unsigned($unsigned(reg39)))) : (($signed(reg40[(1'h0):(1'h0)]) * {(-reg31)}) >> wire27)))
            begin
              reg36 <= ((|(({reg39, (8'hb6)} ?
                      (wire6 ^ wire0) : (reg30 > reg15)) ?
                  {reg31} : $signed($signed(wire17)))) << reg26);
              reg37 <= (+$signed((wire7 ^~ $signed((wire10 != reg34)))));
              reg38 <= reg28;
              reg39 <= $unsigned(({($signed((8'haf)) <<< $unsigned(reg46)),
                  {(wire5 ?
                          reg26 : wire8)}} | (wire2[(2'h2):(2'h2)] <= reg43)));
              reg40 <= {reg45[(2'h3):(1'h0)]};
            end
          else
            begin
              reg36 <= (^($unsigned(reg25) ?
                  (wire27[(2'h3):(1'h0)] ?
                      reg40 : reg24) : (($signed(reg40) != (&wire9)) ?
                      $unsigned($signed((8'hb7))) : ((reg13 & reg36) ?
                          (reg45 >>> reg38) : $unsigned(reg15)))));
              reg37 <= (~&(8'hba));
              reg38 <= {$signed(((8'ha9) ?
                      reg43[(1'h1):(1'h0)] : $signed($unsigned(reg22)))),
                  $signed((wire4[(3'h6):(3'h5)] ?
                      {(-reg16),
                          $signed(reg13)} : ((~^wire4) || ((8'hbc) + reg20))))};
            end
        end
      reg47 <= wire10;
      reg48 <= reg44;
    end
  always
    @(posedge clk) begin
      reg49 <= $unsigned($unsigned({(~|$signed(reg41)), wire7[(1'h1):(1'h0)]}));
      reg50 <= ((8'hb4) || wire10[(4'ha):(4'ha)]);
      reg51 <= $signed(((|wire6) ? $unsigned(reg36) : wire18));
    end
endmodule
