module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  assign y = {wire32,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = wire0[(2'h2):(2'h2)];
  assign wire5 = $signed(($unsigned((wire3[(1'h1):(1'h1)] & (wire0 > wire1))) + (^({wire1,
                     (8'hb2)} <= wire1[(5'h10):(4'hd)]))));
  assign wire6 = $signed({(-$signed(wire4[(4'h8):(1'h0)]))});
  assign wire7 = (wire3[(3'h4):(3'h4)] ?
                     ((&$signed($signed(wire6))) ?
                         $signed(wire6) : $signed($unsigned(wire4))) : $signed(($signed((wire2 >= wire5)) >>> wire2)));
  always
    @(posedge clk) begin
      if (wire7[(2'h3):(2'h2)])
        begin
          if (($signed(wire0) ?
              ($signed((^~(wire1 ?
                  wire6 : (8'hb9)))) <<< ((8'hb8) ^ $unsigned(wire5[(2'h2):(1'h0)]))) : (|$unsigned(((-wire3) ?
                  (wire5 & wire3) : $signed(wire3))))))
            begin
              reg8 <= wire3;
              reg9 <= wire2[(4'hb):(4'ha)];
              reg10 <= (^~wire6);
              reg11 <= reg8[(1'h0):(1'h0)];
              reg12 <= wire0[(4'h9):(3'h6)];
            end
          else
            begin
              reg8 <= $unsigned(($signed((reg10[(5'h10):(5'h10)] <= (reg10 ?
                  reg11 : wire4))) <<< $signed(wire1)));
            end
        end
      else
        begin
          reg8 <= reg12;
          reg9 <= (^$signed(wire3));
          reg10 <= (^{(-reg9)});
          if ((wire4 ^~ ({($unsigned(wire0) ?
                  $signed(wire6) : $signed((8'hbb))),
              $unsigned((^reg8))} - $unsigned((~&(~(8'hb7)))))))
            begin
              reg11 <= $unsigned($signed(reg10[(4'hb):(3'h5)]));
              reg12 <= (($signed(((8'hb9) == (wire3 || wire4))) ?
                      (~&({reg9, wire7} ? {reg8} : {wire0})) : (wire2 ?
                          $signed((|wire5)) : {$signed(wire5), (^~reg12)})) ?
                  $signed(wire4) : $signed(wire0[(3'h5):(3'h4)]));
            end
          else
            begin
              reg11 <= $unsigned($signed((!$unsigned((wire4 < wire6)))));
              reg12 <= reg11;
              reg13 <= ({(wire1[(1'h1):(1'h1)] > {$signed(wire6)})} ?
                  reg12 : reg12);
              reg14 <= {$signed($signed(((wire0 - reg10) ?
                      $signed(reg11) : $signed((8'hb3)))))};
            end
        end
      if ($unsigned(wire7))
        begin
          if ($signed($unsigned(wire7[(5'h12):(4'hd)])))
            begin
              reg15 <= (({reg12, $signed((wire4 & reg12))} & $unsigned((~&{reg8,
                  wire6}))) << (({{(8'hb6)}, reg13[(3'h6):(3'h6)]} ?
                      ((~wire5) ? {wire7, wire1} : {wire3, reg9}) : ({reg9,
                          reg8} < wire4[(3'h6):(3'h6)])) ?
                  $signed({{reg10, reg9},
                      $unsigned(wire7)}) : $unsigned((&wire3[(2'h2):(1'h0)]))));
              reg16 <= ((($signed({wire6}) || $unsigned((wire2 ^ (8'hb7)))) ?
                      (wire4[(2'h2):(1'h0)] ?
                          ((wire6 ? wire5 : wire3) ?
                              (-reg13) : $unsigned(reg12)) : ($signed(reg8) ?
                              $unsigned(wire7) : {wire2})) : {reg14[(4'he):(3'h5)],
                          (^~{reg14, reg11})}) ?
                  ((^$signed(((8'h9d) == wire4))) >= ($signed(reg9[(1'h1):(1'h1)]) ?
                      ((reg12 * reg12) == (~wire6)) : wire6[(3'h4):(3'h4)])) : $unsigned((($signed(wire4) - $unsigned(wire0)) ?
                      reg14 : reg12[(4'ha):(1'h1)])));
              reg17 <= {$signed($unsigned({reg16}))};
              reg18 <= (!(-(((wire3 <<< reg14) ?
                      (reg11 ? reg16 : reg16) : (reg11 & reg13)) ?
                  (wire4[(4'hd):(1'h1)] ?
                      $unsigned(reg17) : wire5[(3'h4):(1'h0)]) : (-(reg10 ?
                      reg14 : wire0)))));
            end
          else
            begin
              reg15 <= wire6[(4'ha):(1'h1)];
              reg16 <= ($unsigned(($unsigned((^(7'h44))) ?
                  ((reg11 ^ (8'hbe)) ?
                      ((8'hae) == reg14) : $signed((7'h41))) : $signed($unsigned(reg12)))) <= $signed($unsigned($signed($unsigned(reg15)))));
              reg17 <= $signed((~((+$unsigned(reg13)) <<< $unsigned(reg12[(4'he):(2'h3)]))));
              reg18 <= (-$signed({((+reg16) ?
                      (reg17 >>> (7'h40)) : wire3[(2'h2):(2'h2)]),
                  $signed($signed(reg17))}));
            end
          reg19 <= $signed($unsigned($signed(reg13)));
          reg20 <= $signed((reg8[(1'h0):(1'h0)] ?
              reg8[(2'h2):(2'h2)] : (^$unsigned(reg11))));
          reg21 <= wire7[(5'h10):(4'he)];
          reg22 <= (~|(($signed($unsigned(reg21)) >>> $unsigned((wire5 ^~ wire3))) >>> $signed(reg15)));
        end
      else
        begin
          reg15 <= (+$signed($signed((wire4[(4'hf):(4'he)] > (wire2 < reg20)))));
          reg16 <= (!(((~^$unsigned(wire0)) - $unsigned(reg16)) > (($unsigned(reg15) > ((8'ha3) >= (8'ha2))) ?
              $signed(reg20[(3'h4):(2'h2)]) : ((~reg21) ?
                  reg20[(1'h0):(1'h0)] : {(7'h43), (8'hb1)}))));
          if ({(!wire3)})
            begin
              reg17 <= {$signed($unsigned((&$unsigned(wire1)))),
                  ((((reg10 ^ wire3) ^ reg18) && ({(8'h9f)} ?
                      (!reg22) : (wire6 ? wire4 : reg9))) & reg20)};
            end
          else
            begin
              reg17 <= $unsigned(reg9[(1'h0):(1'h0)]);
            end
        end
      if ($unsigned(wire6))
        begin
          if ($unsigned($unsigned(reg20[(2'h2):(1'h0)])))
            begin
              reg23 <= {$signed(wire5), wire2};
            end
          else
            begin
              reg23 <= (~(8'h9e));
            end
          reg24 <= ($unsigned((~(+$signed((8'ha3))))) ?
              ((($unsigned(wire1) ? reg12 : (wire0 * wire7)) ?
                      reg23[(3'h7):(3'h4)] : {(wire0 ? reg17 : reg21)}) ?
                  $signed((~|reg12[(5'h10):(2'h2)])) : (reg17 ?
                      (^~(~|reg11)) : ((reg10 + reg19) < (reg19 ?
                          wire6 : wire6)))) : $signed(({wire5[(2'h3):(1'h1)]} >>> $signed(((8'h9e) ?
                  reg8 : reg9)))));
        end
      else
        begin
          if (wire5[(2'h2):(1'h0)])
            begin
              reg23 <= {$unsigned($unsigned($signed((reg8 << wire6))))};
            end
          else
            begin
              reg23 <= $unsigned($unsigned($signed($unsigned(reg14))));
              reg24 <= $unsigned(reg21[(3'h4):(1'h0)]);
              reg25 <= reg10[(3'h5):(2'h2)];
            end
          if (($unsigned((((~wire5) != $unsigned(reg22)) >> reg24[(4'he):(3'h6)])) ?
              ($unsigned((wire1[(4'ha):(2'h3)] > $unsigned(reg14))) ?
                  (((reg9 >= (8'had)) || (~^(8'hba))) <= (8'ha8)) : (^~$signed((reg10 ?
                      wire3 : reg19)))) : $unsigned(reg22)))
            begin
              reg26 <= reg24[(1'h0):(1'h0)];
            end
          else
            begin
              reg26 <= (~&wire1);
              reg27 <= (($unsigned(((reg26 ?
                      reg14 : reg15) <<< $signed(reg20))) <<< wire4) ?
                  {$unsigned((+reg8[(2'h2):(1'h1)]))} : $signed($unsigned(reg23[(4'h9):(2'h3)])));
              reg28 <= ((!{(&reg26[(4'h9):(3'h5)])}) ?
                  $signed(wire4[(2'h3):(1'h0)]) : $unsigned((reg12 ?
                      ($unsigned(reg12) <= {wire6,
                          reg15}) : (^~((7'h41) > (8'hbd))))));
            end
          reg29 <= ((reg19 >= $signed((8'hb7))) * wire5[(1'h0):(1'h0)]);
        end
      reg30 <= $signed($unsigned($unsigned(reg24)));
      reg31 <= $unsigned((reg15 ?
          ($signed((reg22 ^~ (8'ha8))) - $unsigned(reg28)) : (^~(~(wire6 >>> reg29)))));
    end
  assign wire32 = $signed(wire5);
endmodule
