module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h246):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire52;
  wire [(4'hc):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire32;
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg4 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire32,
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
                 reg33,
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
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed((+$unsigned($signed($unsigned(wire0)))));
      if ($unsigned($signed(wire2[(4'h8):(3'h5)])))
        begin
          reg5 <= (~|(7'h43));
          reg6 <= (8'hae);
          reg7 <= {(~|reg4[(3'h4):(2'h3)]),
              $signed(($signed($unsigned(reg6)) || ($signed((8'hb4)) + reg5)))};
          reg8 <= ($signed((|($unsigned(wire0) ^ reg5))) ?
              $unsigned($unsigned((wire2 != (wire0 >= reg4)))) : (|$signed(($unsigned(reg7) ?
                  reg4[(4'hb):(3'h4)] : $signed(reg6)))));
          reg9 <= ($signed((~$signed($unsigned(reg4)))) ?
              (~|wire1[(4'hb):(1'h0)]) : $signed(reg7));
        end
      else
        begin
          if ({$unsigned($signed($signed({wire3}))),
              ((^$unsigned(((8'h9c) ?
                  reg8 : reg6))) << (reg9[(2'h3):(1'h0)] | {$signed(wire1),
                  $unsigned(reg9)}))})
            begin
              reg5 <= $signed((!$signed($signed(wire0[(3'h6):(3'h6)]))));
              reg6 <= (reg8 ? (~|wire2[(4'hb):(3'h6)]) : (|wire1));
              reg7 <= (~^reg4);
              reg8 <= $signed($unsigned(wire0[(3'h4):(1'h1)]));
              reg9 <= $unsigned(reg6[(3'h6):(3'h5)]);
            end
          else
            begin
              reg5 <= ($unsigned((~$unsigned((^reg9)))) ?
                  $unsigned(wire3[(5'h12):(3'h5)]) : (7'h44));
            end
          if ($unsigned(wire3))
            begin
              reg10 <= wire2[(2'h2):(1'h1)];
              reg11 <= (~&reg9);
            end
          else
            begin
              reg10 <= $unsigned(($signed($unsigned($signed(reg8))) ?
                  (reg8[(1'h0):(1'h0)] ?
                      ((reg10 ^ wire2) <= $signed(wire3)) : $unsigned((~|(7'h41)))) : (reg7[(4'ha):(4'h8)] - $signed((reg10 ?
                      wire1 : reg10)))));
            end
          if ((reg11[(4'hc):(2'h2)] ?
              $unsigned((|$unsigned(reg10[(4'h8):(2'h2)]))) : (+(~|wire0[(1'h1):(1'h1)]))))
            begin
              reg12 <= ($signed((~wire2)) || $signed(wire3));
              reg13 <= $signed($signed(((reg6[(3'h7):(3'h7)] ^~ $unsigned(reg7)) < (wire0[(3'h6):(1'h0)] ?
                  $signed((7'h40)) : (reg9 + reg4)))));
              reg14 <= reg4[(1'h0):(1'h0)];
              reg15 <= ($signed($unsigned((reg5[(4'h8):(2'h3)] << $signed(reg4)))) ?
                  (!$unsigned(((reg10 || reg12) ?
                      reg14 : reg14))) : $signed($unsigned($signed($unsigned(reg7)))));
              reg16 <= (~|(~|$unsigned({$signed((8'h9f))})));
            end
          else
            begin
              reg12 <= wire1[(3'h5):(2'h3)];
            end
          if ({($signed(reg16[(4'ha):(3'h5)]) != reg9),
              $signed((((reg4 ? reg12 : reg8) ?
                      {reg13} : reg14[(1'h0):(1'h0)]) ?
                  (~^$unsigned(wire3)) : reg8[(4'h8):(2'h2)]))})
            begin
              reg17 <= (reg13[(1'h1):(1'h1)] != reg7);
            end
          else
            begin
              reg17 <= reg9[(1'h1):(1'h1)];
              reg18 <= $signed(wire1[(4'hc):(4'h8)]);
              reg19 <= ((~((~&wire0) ?
                  $signed(reg11[(3'h6):(2'h3)]) : (^~(reg13 ?
                      wire0 : (8'hb6))))) == $unsigned(((&(wire2 ?
                      reg18 : reg4)) ?
                  $signed(reg15[(2'h3):(1'h1)]) : $signed($signed((8'hbd))))));
              reg20 <= $unsigned(((~&reg19[(1'h0):(1'h0)]) ?
                  (~|(reg16 ?
                      (reg8 * wire0) : $unsigned((8'hb3)))) : (~((8'ha6) ?
                      (reg11 ? reg15 : reg16) : (wire0 ? wire1 : reg6)))));
              reg21 <= $unsigned((~|(reg9 - ((reg15 >> reg11) ?
                  (reg7 | reg17) : $unsigned(wire0)))));
            end
          reg22 <= $unsigned(($unsigned(reg18[(1'h1):(1'h1)]) >> reg10[(4'h9):(1'h1)]));
        end
      if (reg16)
        begin
          reg23 <= (|$unsigned((($unsigned(reg7) | (+reg10)) ?
              $signed($unsigned(reg18)) : ((|(7'h43)) ^ wire2))));
        end
      else
        begin
          reg23 <= ($signed($signed(($unsigned(reg11) ?
              (^~wire2) : reg6[(4'ha):(3'h5)]))) ^ $signed(reg23[(2'h2):(1'h0)]));
          if ({$unsigned({($signed(reg15) != reg16), {(reg15 * reg15)}})})
            begin
              reg24 <= $unsigned(($signed((^reg15[(3'h7):(3'h5)])) ?
                  (8'hb6) : wire1[(4'ha):(3'h6)]));
              reg25 <= reg12;
              reg26 <= reg11;
              reg27 <= (|(reg18[(3'h4):(1'h0)] != (~|($signed(wire2) < reg19[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg24 <= {(~(reg12 ?
                      (~&$unsigned(reg4)) : (~reg24[(2'h3):(2'h3)])))};
              reg25 <= ($unsigned($signed(($unsigned(reg27) >> (|reg10)))) ?
                  (~|(reg10[(3'h7):(2'h3)] ~^ $signed((~^reg20)))) : (reg11 ^~ reg5));
            end
          reg28 <= reg12[(2'h2):(1'h0)];
          reg29 <= (~&(reg23 == (reg16 & (~|reg8[(4'h8):(1'h1)]))));
        end
      reg30 <= reg17[(2'h2):(1'h0)];
      reg31 <= reg30;
    end
  assign wire32 = (-(^($signed(reg21) * ($signed(reg21) ?
                      {reg20, reg12} : reg29[(3'h6):(2'h3)]))));
  always
    @(posedge clk) begin
      reg33 <= ({{((reg9 ? wire0 : reg24) ?
                      (reg31 ^~ wire1) : reg12[(1'h0):(1'h0)])},
              $unsigned((~^$signed((8'ha3))))} ?
          ($signed(reg8) ?
              (^~($unsigned(wire2) ?
                  {wire3, reg18} : (~reg16))) : reg29) : ((^~($unsigned(reg29) ?
                  (reg16 ? reg18 : wire3) : wire3[(4'he):(4'h8)])) ?
              (~$signed((~reg5))) : ($signed((wire2 ? reg9 : reg16)) ?
                  reg16[(4'ha):(3'h4)] : $signed((reg29 - reg8)))));
    end
  assign wire34 = reg33;
  assign wire35 = $unsigned({($unsigned((reg24 ? (8'hbd) : (8'hb3))) ?
                          $signed((reg20 && wire3)) : wire3[(4'ha):(3'h6)])});
  assign wire36 = $signed($unsigned((reg11[(3'h4):(2'h3)] ?
                      ({reg20} ?
                          ((8'hb0) ?
                              wire0 : wire35) : (-reg33)) : $signed((reg26 >= wire0)))));
  assign wire37 = (~&{$signed((|$unsigned(reg11))),
                      (reg11[(3'h7):(3'h5)] > {(^~(8'hb3)), (reg20 < reg15)})});
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((8'hb5))))
        begin
          reg38 <= $unsigned(((8'haf) * $unsigned(reg21[(1'h1):(1'h0)])));
          if (({wire1[(3'h6):(1'h0)]} ^ $signed($signed({reg19}))))
            begin
              reg39 <= reg25;
              reg40 <= (^reg8[(4'h8):(2'h2)]);
              reg41 <= $unsigned(wire37);
              reg42 <= reg31;
              reg43 <= (+$signed(reg6));
            end
          else
            begin
              reg39 <= ($unsigned((+(-reg42[(2'h2):(1'h0)]))) ?
                  (reg18[(2'h3):(1'h0)] | reg30) : reg10[(3'h4):(2'h2)]);
              reg40 <= (reg22 ?
                  $signed(wire0[(3'h5):(2'h2)]) : $unsigned((($unsigned((8'hbe)) ?
                          reg22 : (reg24 ? wire37 : (8'hb4))) ?
                      {$signed(reg17),
                          (reg22 ?
                              reg7 : wire1)} : ($signed(reg17) != (reg10 != (8'ha0))))));
            end
        end
      else
        begin
          reg38 <= wire34[(4'ha):(3'h7)];
          reg39 <= reg15[(4'hd):(4'ha)];
          reg40 <= reg27;
          reg41 <= $unsigned(reg26);
          reg42 <= $signed($signed(wire0));
        end
      if ($signed((($signed($signed(wire3)) ^ $unsigned(((8'h9e) ?
              reg27 : (8'ha3)))) ?
          reg25[(3'h5):(3'h5)] : (8'hb7))))
        begin
          reg44 <= (((~&reg26[(2'h2):(2'h2)]) * reg6) & (~^(+($signed((8'ha3)) > reg11))));
        end
      else
        begin
          reg44 <= reg42;
          reg45 <= (reg44[(2'h3):(2'h3)] ?
              $signed((($unsigned(reg39) ? reg28[(1'h1):(1'h0)] : (^reg11)) ?
                  (reg10 == $signed(reg25)) : reg5[(3'h7):(1'h0)])) : $unsigned((|((^~reg16) ?
                  (wire32 > (8'hae)) : {reg9}))));
          reg46 <= ($signed(reg14) ?
              ($signed((7'h40)) ?
                  $unsigned(($signed((8'hbb)) >>> reg20[(1'h1):(1'h1)])) : $unsigned((-(reg42 ?
                      reg21 : reg10)))) : reg39[(2'h2):(1'h1)]);
        end
      reg47 <= reg27[(4'hf):(4'h9)];
      if ($signed(((~|{reg20[(4'ha):(4'ha)], $signed((8'ha8))}) ?
          reg42[(4'h9):(2'h3)] : ($signed($unsigned(reg28)) ^ reg22))))
        begin
          if ((8'hbc))
            begin
              reg48 <= {(^((((8'hb9) <<< (8'ha2)) ^~ (reg33 > wire34)) || $signed(reg20[(3'h5):(2'h2)]))),
                  $signed((~$unsigned(reg22)))};
              reg49 <= ($unsigned(($unsigned((reg11 ? reg21 : reg8)) ?
                      (-$signed(wire1)) : $unsigned($unsigned(reg23)))) ?
                  reg41[(3'h6):(2'h2)] : reg48[(5'h11):(4'hf)]);
            end
          else
            begin
              reg48 <= $unsigned($unsigned(reg4));
              reg49 <= $unsigned($unsigned($unsigned(reg20)));
              reg50 <= ($unsigned($signed((reg19[(1'h0):(1'h0)] ?
                  wire37 : (reg7 <= reg22)))) + reg8[(3'h4):(1'h0)]);
            end
        end
      else
        begin
          reg48 <= reg9[(3'h6):(2'h2)];
          reg49 <= {reg40};
          reg50 <= ({$signed($signed(reg43[(4'ha):(3'h6)]))} != {$signed($signed(reg41)),
              ({reg40} ?
                  {$signed(reg30)} : ((reg17 && wire37) ?
                      reg12 : wire34[(4'h9):(2'h3)]))});
        end
    end
  assign wire51 = ((^((|$unsigned(wire1)) ?
                      ($signed((8'hb9)) ?
                          wire1[(3'h7):(1'h0)] : $unsigned(reg41)) : (~&((8'h9d) ?
                          reg5 : reg15)))) <= $unsigned(reg20[(4'h9):(4'h9)]));
  assign wire52 = {$signed((~$unsigned({wire37}))), reg48[(4'hf):(4'he)]};
endmodule
