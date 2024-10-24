module top
#(parameter param38 = (((~|((~^(8'hb6)) ? ((7'h43) | (8'hbe)) : ((8'haa) ? (8'ha3) : (8'ha7)))) >>> (~(((8'ha8) != (8'h9c)) || ((7'h40) ? (8'ha1) : (8'hbd))))) << (|((((7'h44) < (8'hbd)) ? {(8'hbd)} : (-(8'h9c))) ? (~|((8'hb9) ? (7'h43) : (8'hae))) : (|((8'hb3) ? (8'hbb) : (8'hac)))))), 
parameter param39 = (param38 ? ({((8'hb3) < (param38 <<< param38)), {{param38}}} | param38) : (~&(~&((-param38) ^ {param38, (8'h9f)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1d6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire37,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire4,
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
  assign wire4 = ((|(($unsigned(wire2) << wire2) >> $signed(wire1))) && wire0[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg5 <= wire3[(2'h2):(1'h1)];
      reg6 <= ((^~wire2) * (~|wire0[(1'h1):(1'h0)]));
      if ((^~$unsigned((&($signed(reg5) && {wire1})))))
        begin
          reg7 <= $signed(reg6);
          reg8 <= (!wire1);
          reg9 <= (+{$unsigned(($unsigned(wire1) >= reg6[(2'h3):(2'h2)]))});
          reg10 <= $signed(((!$unsigned((reg7 - reg9))) ?
              $unsigned($signed(wire2[(2'h2):(1'h0)])) : ($signed((wire3 < reg7)) * (~^(8'ha7)))));
        end
      else
        begin
          reg7 <= $signed($signed($unsigned({reg6})));
          reg8 <= ($signed(wire4) & (+({reg10[(2'h2):(1'h1)]} ?
              (wire1[(1'h0):(1'h0)] > wire4) : $unsigned((!wire0)))));
          if (wire3)
            begin
              reg9 <= wire4;
            end
          else
            begin
              reg9 <= reg7[(2'h2):(1'h1)];
              reg10 <= $signed(((&((reg9 >= reg9) ?
                  reg9 : $signed(wire4))) > (((reg6 ?
                      wire1 : wire1) <<< (wire2 ? reg7 : reg9)) ?
                  $unsigned(reg8) : {reg8})));
            end
          if ($signed({reg6, wire2[(3'h7):(1'h0)]}))
            begin
              reg11 <= wire4[(4'h9):(3'h6)];
              reg12 <= (~|$unsigned($signed((!(wire3 <<< wire2)))));
              reg13 <= $unsigned((8'hb8));
              reg14 <= wire4;
            end
          else
            begin
              reg11 <= (wire3 ?
                  $unsigned((8'haf)) : (~|$signed($signed((reg10 ^ reg11)))));
              reg12 <= reg6;
            end
          reg15 <= ($unsigned($signed($signed($unsigned(wire1)))) | reg12);
        end
      reg16 <= (8'hbb);
    end
  assign wire17 = (+((-{$signed((8'hbd))}) && {(~^$unsigned(reg15))}));
  assign wire18 = wire1[(2'h3):(1'h1)];
  assign wire19 = ((~&$unsigned(({wire0,
                      reg13} != reg13))) | {(reg12 - {(+(7'h42)),
                          $unsigned((8'hb5))})});
  assign wire20 = $signed(((~^(reg5[(1'h0):(1'h0)] <<< (wire3 ?
                          wire1 : wire3))) ?
                      $unsigned((wire19 <= (reg8 & reg15))) : wire19));
  assign wire21 = wire3[(4'ha):(3'h6)];
  assign wire22 = ($signed($signed((~&wire1))) ^ reg6[(2'h2):(1'h1)]);
  assign wire23 = (!(-((8'hb4) ?
                      $signed($signed(reg16)) : {(reg8 ? wire19 : reg5)})));
  always
    @(posedge clk) begin
      reg24 <= $unsigned({($unsigned((wire23 ? reg11 : wire2)) && {((8'haa) ?
                  wire4 : reg6)}),
          (((reg5 ^~ reg9) ? (^~reg8) : {(7'h44), reg9}) ^ $unsigned((wire17 ?
              reg10 : wire20)))});
      if ((reg6 >>> (reg13 - $signed(wire18))))
        begin
          reg25 <= (~(({$signed(wire4)} ^~ ((reg6 ? wire2 : wire21) ?
              (wire0 << wire4) : (reg5 ? reg14 : wire22))) - ((&{(8'hb0),
              wire3}) | $signed((!wire21)))));
          if ((+wire1[(4'hc):(1'h1)]))
            begin
              reg26 <= $unsigned({(wire2[(1'h1):(1'h1)] ?
                      $signed($signed(reg14)) : $signed((wire4 ?
                          reg15 : wire23))),
                  ($unsigned((wire21 ? wire20 : reg5)) ?
                      ((reg10 << (7'h41)) ? reg8 : reg11) : $signed(((8'had) ?
                          reg25 : wire21)))});
              reg27 <= reg13;
              reg28 <= $unsigned(wire18);
            end
          else
            begin
              reg26 <= $signed(wire1);
              reg27 <= (wire4 > (^~$signed((|(+reg27)))));
            end
          reg29 <= reg25;
        end
      else
        begin
          reg25 <= (reg8[(1'h1):(1'h1)] ?
              (wire23 == (8'had)) : reg5[(4'hb):(1'h0)]);
          reg26 <= $unsigned(wire3);
        end
      reg30 <= (!(-($unsigned((~&wire18)) <= (8'h9e))));
      reg31 <= reg9[(2'h3):(1'h0)];
    end
  always
    @(posedge clk) begin
      if ($unsigned(reg29[(1'h1):(1'h1)]))
        begin
          reg32 <= wire23;
          if (reg13)
            begin
              reg33 <= reg12[(4'hb):(3'h7)];
              reg34 <= {((^reg13[(2'h3):(1'h1)]) ?
                      $unsigned((((8'ha2) ?
                          reg14 : reg26) >>> (^~reg5))) : (reg7[(1'h1):(1'h0)] >= (|$unsigned(wire19)))),
                  $signed(((-wire22) ?
                      $signed((wire0 != reg30)) : (+reg13[(4'h8):(3'h7)])))};
              reg35 <= ((|(~|{(reg14 ? (8'hba) : reg7)})) + (~$signed(reg30)));
            end
          else
            begin
              reg33 <= (|$signed(reg31));
              reg34 <= reg16[(5'h12):(5'h12)];
            end
        end
      else
        begin
          reg32 <= $signed((reg15 <= reg34));
          reg33 <= (^$signed($unsigned(wire1)));
          reg34 <= reg14[(5'h13):(3'h5)];
        end
      reg36 <= $signed((({$unsigned(reg10), {reg30, wire0}} >>> ((-reg32) ?
          reg16[(4'h8):(2'h2)] : (reg33 ? wire19 : reg6))) | reg29));
    end
  assign wire37 = ($signed({($signed(reg11) ?
                              reg34 : (wire19 ? reg27 : wire22)),
                          $unsigned((-wire20))}) ?
                      {$signed(($unsigned(reg34) ?
                              {(8'ha4)} : $unsigned(reg28))),
                          $unsigned(reg28)} : $unsigned((-$signed(reg14))));
endmodule
