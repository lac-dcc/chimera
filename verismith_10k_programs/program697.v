module top
#(parameter param30 = {(8'hb8)}, 
parameter param31 = ((~({param30, (param30 ? param30 : param30)} + (param30 ? (~param30) : (param30 ? param30 : param30)))) ? (param30 || param30) : ((^~((-param30) ? ((8'hbc) | param30) : (~^(8'ha9)))) & param30)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire18;
  wire signed [(4'h8):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire18,
                 wire17,
                 wire4,
                 reg27,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = wire3;
  always
    @(posedge clk) begin
      reg5 <= ((^~($unsigned($signed(wire4)) ?
              wire2 : $unsigned(((8'hac) ? wire4 : (7'h41))))) ?
          (&wire2[(1'h1):(1'h0)]) : ($signed({$signed(wire0)}) ~^ wire2[(3'h7):(3'h4)]));
      reg6 <= (~(-$unsigned((8'ha4))));
      if ($unsigned(wire0))
        begin
          if ({(wire1[(4'h8):(2'h2)] ? wire2 : reg6[(4'h8):(1'h0)]), (8'hbb)})
            begin
              reg7 <= $signed((^$unsigned($unsigned((wire1 ? wire4 : wire3)))));
              reg8 <= $signed((7'h42));
              reg9 <= $signed(wire0);
              reg10 <= {(^~((wire4 != {wire3}) ~^ (~^reg7[(5'h10):(4'h9)]))),
                  {(wire3 <= reg6)}};
            end
          else
            begin
              reg7 <= $unsigned(($unsigned((&(~reg7))) >> ((~^(wire0 ?
                  wire2 : reg5)) << wire0[(3'h6):(2'h3)])));
            end
          reg11 <= ((|$unsigned(reg5[(2'h2):(1'h0)])) > wire0[(2'h3):(2'h2)]);
          reg12 <= $unsigned(wire1);
          reg13 <= $signed(($signed($signed($signed(wire0))) ?
              {reg9, wire1[(3'h6):(3'h6)]} : $unsigned(((reg10 ?
                  wire0 : reg11) & (reg10 ? wire1 : (8'ha8))))));
          reg14 <= reg11[(2'h3):(2'h2)];
        end
      else
        begin
          if ($unsigned(($signed(reg6) > $unsigned(((wire2 << reg13) ?
              $signed(wire2) : $unsigned(wire2))))))
            begin
              reg7 <= (~&$unsigned((!wire3)));
              reg8 <= (|$unsigned((~|{$unsigned(reg7), reg8[(3'h5):(2'h2)]})));
              reg9 <= (reg12[(1'h1):(1'h0)] == $unsigned((wire3 | (+$unsigned(reg6)))));
              reg10 <= $unsigned(reg12[(2'h2):(1'h1)]);
            end
          else
            begin
              reg7 <= $signed(((!$unsigned((wire3 != (8'hb1)))) ?
                  ($signed((reg5 ? wire1 : reg6)) ?
                      {(reg5 ? reg7 : (7'h40))} : reg9) : {((wire3 ?
                          (8'ha4) : reg9) <= $unsigned(reg7))}));
              reg8 <= $signed((^~({(reg11 ? reg9 : reg13)} ?
                  (8'hb8) : $unsigned(reg14))));
              reg9 <= (^(wire4 ?
                  $unsigned($signed($unsigned(wire3))) : $signed(wire2)));
              reg10 <= ($signed((~^wire2[(4'he):(2'h2)])) ?
                  $signed($unsigned($signed((~^wire4)))) : $unsigned(reg5[(1'h0):(1'h0)]));
              reg11 <= ((~|($unsigned($signed(reg5)) << $signed((+wire4)))) + $signed((((wire0 ?
                  wire1 : reg10) - (wire4 ? reg11 : reg7)) & ((reg11 ?
                  reg6 : wire0) <= wire3))));
            end
          if ((8'ha5))
            begin
              reg12 <= reg9;
            end
          else
            begin
              reg12 <= $signed($signed(wire4[(4'hd):(4'hc)]));
              reg13 <= $unsigned(reg5[(2'h2):(1'h0)]);
            end
        end
      reg15 <= ($signed($signed(reg12[(3'h4):(2'h2)])) ~^ {reg13[(2'h3):(1'h0)]});
      if (reg11[(2'h2):(2'h2)])
        begin
          reg16 <= ({{(~$signed(wire3)),
                      ($unsigned(reg6) ?
                          (reg15 ? reg10 : (8'hbb)) : (^~wire1))},
                  $unsigned((8'ha7))} ?
              $unsigned((8'ha5)) : (&reg11[(3'h5):(3'h4)]));
        end
      else
        begin
          reg16 <= $unsigned(($unsigned({$unsigned(reg12), $unsigned(reg5)}) ?
              $unsigned(($signed((8'hae)) ?
                  (wire0 == reg14) : (reg10 ?
                      reg8 : reg12))) : ($signed(wire4[(2'h3):(1'h0)]) <= {reg16})));
        end
    end
  assign wire17 = $signed({(reg15 ^~ $signed($unsigned(wire4))), reg15});
  assign wire18 = {wire2};
  always
    @(posedge clk) begin
      if ((reg6[(2'h2):(2'h2)] ?
          $signed(reg11) : (({$unsigned(wire2)} && (~^$unsigned(reg12))) ?
              $signed(reg9[(5'h11):(4'hf)]) : $unsigned(reg10[(2'h3):(1'h0)]))))
        begin
          reg19 <= reg15;
          reg20 <= $signed((($signed((wire1 ?
                  wire1 : reg11)) >> (~&$signed(reg12))) ?
              (reg7[(5'h10):(4'hf)] ?
                  (~^{reg14,
                      reg7}) : reg15[(4'ha):(3'h7)]) : (wire1[(3'h6):(2'h2)] && wire18[(4'ha):(4'ha)])));
          reg21 <= reg10;
          reg22 <= ((reg7[(1'h1):(1'h0)] ^ $signed((reg10[(5'h12):(4'h8)] ?
                  (!reg7) : wire17))) ?
              reg5[(1'h0):(1'h0)] : $signed(reg5[(2'h2):(1'h0)]));
          if (reg21)
            begin
              reg23 <= {reg13};
              reg24 <= reg19;
            end
          else
            begin
              reg23 <= reg21[(3'h7):(3'h4)];
              reg24 <= wire0[(2'h3):(1'h1)];
              reg25 <= $unsigned((reg8[(4'h9):(2'h3)] ?
                  (reg13 || (wire2 ~^ reg13[(3'h4):(2'h2)])) : ((|$signed(reg19)) ?
                      {$signed(wire18), (&wire2)} : reg24[(1'h1):(1'h1)])));
              reg26 <= ((~&$unsigned({(~&reg8), {(8'ha1)}})) ?
                  ((~&reg24[(1'h1):(1'h1)]) ?
                      $unsigned(((reg5 <= wire17) ?
                          (wire4 != reg6) : (reg20 || reg8))) : (($signed(wire1) >= reg19[(4'hd):(4'hd)]) ^~ {(8'had)})) : ($unsigned((-$signed(reg10))) && $unsigned($unsigned((8'hb9)))));
              reg27 <= $unsigned(reg20[(4'h8):(3'h5)]);
            end
        end
      else
        begin
          reg19 <= $signed((reg7[(2'h3):(2'h3)] ?
              reg15[(3'h4):(2'h3)] : {($unsigned((8'hb8)) ?
                      (~&reg12) : (^~wire17))}));
          reg20 <= {(~^{($signed(reg7) ? reg22 : $unsigned(reg5)),
                  $signed((8'hae))})};
          reg21 <= (8'hb1);
          if (((^~$unsigned({wire17[(1'h1):(1'h0)], (~&wire2)})) ?
              $signed(reg8) : $signed((~&{(~|reg12)}))))
            begin
              reg22 <= reg25;
              reg23 <= wire0[(4'hc):(1'h1)];
              reg24 <= (~^(~^wire2[(2'h2):(1'h0)]));
              reg25 <= reg24;
              reg26 <= (8'hba);
            end
          else
            begin
              reg22 <= (~&{reg5, $unsigned($signed((8'ha0)))});
            end
        end
    end
  assign wire28 = (8'hab);
  assign wire29 = ((^reg24) ?
                      $unsigned($unsigned(reg13[(3'h4):(1'h0)])) : {reg8[(2'h2):(1'h0)]});
endmodule
