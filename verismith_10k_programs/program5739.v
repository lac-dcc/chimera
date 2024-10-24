module top
#(parameter param32 = ((~|(^(((8'ha8) ^~ (8'hb4)) ? ((8'hbb) ? (8'hb5) : (7'h43)) : ((8'hbf) ? (8'haa) : (8'ha5))))) == (((((8'hbc) ? (8'ha3) : (8'haa)) ? ((8'haa) ? (8'haf) : (8'hb8)) : {(8'h9f)}) ^~ ((^~(7'h40)) + ((8'hac) ? (8'hb8) : (7'h42)))) ~^ ((((7'h42) != (8'ha5)) ^ (^~(8'hbf))) << {((8'hbc) ? (8'h9f) : (8'hbb)), (|(8'ha2))}))), 
parameter param33 = param32)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg5 = (1'h0);
  assign y = {wire26,
                 wire4,
                 reg31,
                 reg30,
                 reg29,
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
                 reg5,
                 (1'h0)};
  assign wire4 = (wire0[(2'h2):(1'h0)] ?
                     wire1[(1'h1):(1'h0)] : {(((~wire3) ?
                             {(8'hb7), wire3} : (|wire0)) << wire3)});
  always
    @(posedge clk) begin
      if (wire4[(1'h1):(1'h0)])
        begin
          if ((($signed(wire3) == (^(-wire3[(1'h1):(1'h1)]))) >> ((8'hb4) ?
              wire2 : wire0[(2'h2):(2'h2)])))
            begin
              reg5 <= (^($signed(($signed(wire3) << (^~wire3))) <<< ($signed((~|wire4)) * wire1)));
              reg6 <= wire2;
              reg7 <= (-$unsigned({$unsigned($signed(reg5))}));
              reg8 <= $unsigned((^~(reg7[(1'h0):(1'h0)] * reg6[(5'h15):(5'h12)])));
              reg9 <= ($signed($signed(reg7)) ?
                  $signed(reg7) : $signed(wire0[(2'h2):(2'h2)]));
            end
          else
            begin
              reg5 <= reg7;
              reg6 <= $unsigned($unsigned(reg9));
              reg7 <= wire4;
              reg8 <= ((^(((8'h9e) || $unsigned(wire2)) | ($unsigned(wire0) ?
                  (reg9 - reg8) : reg5[(2'h3):(1'h1)]))) == $unsigned({reg8,
                  ((wire2 ^ (7'h42)) ^ wire3[(3'h6):(1'h1)])}));
            end
          reg10 <= wire1[(1'h0):(1'h0)];
          reg11 <= $unsigned({reg7, wire2[(3'h4):(1'h1)]});
        end
      else
        begin
          reg5 <= ($unsigned(wire2[(1'h0):(1'h0)]) * reg8[(4'h8):(4'h8)]);
          reg6 <= $signed($signed(((~|{reg5, reg10}) <<< (~&$unsigned(reg7)))));
          if ($signed(reg5))
            begin
              reg7 <= reg8;
              reg8 <= reg7;
            end
          else
            begin
              reg7 <= ((reg7 <= $unsigned($signed($signed(wire0)))) ?
                  $unsigned((({reg7, wire2} ?
                      $signed(wire0) : (wire3 ?
                          wire1 : reg5)) >= $unsigned(wire2))) : (8'ha7));
              reg8 <= ($unsigned((wire4[(1'h1):(1'h1)] ?
                      $unsigned($unsigned(wire3)) : $unsigned($unsigned(reg11)))) ?
                  reg10[(3'h5):(2'h2)] : ({{(8'hac), $unsigned(reg9)},
                          {$unsigned(reg6)}} ?
                      (wire0[(1'h1):(1'h1)] ?
                          $signed((reg11 ? wire0 : reg6)) : ((~reg8) ?
                              $unsigned(wire3) : $unsigned(reg6))) : ($signed((^~reg9)) > (8'ha8))));
            end
          reg9 <= ($signed($signed({(!wire0)})) ?
              $signed({$signed($unsigned((8'hbf)))}) : $signed(($unsigned($unsigned((8'hb3))) ?
                  $signed((reg10 << reg11)) : (^(reg10 ? (8'h9c) : reg5)))));
          reg10 <= reg7;
        end
      if (reg10[(3'h4):(2'h3)])
        begin
          reg12 <= reg7[(1'h0):(1'h0)];
          reg13 <= $unsigned({(reg11 ? reg11 : wire4)});
          reg14 <= wire4[(1'h0):(1'h0)];
          reg15 <= (wire2[(1'h1):(1'h1)] - (8'ha4));
          reg16 <= $unsigned(wire1);
        end
      else
        begin
          if (wire0[(1'h0):(1'h0)])
            begin
              reg12 <= {reg8, {$unsigned({$signed(reg11)})}};
              reg13 <= (+$signed($unsigned(reg11)));
              reg14 <= (^((((wire1 > wire2) ?
                  (wire1 ?
                      reg6 : reg11) : $signed((8'hb3))) >> $signed(reg7)) >= $unsigned({$unsigned(wire2)})));
              reg15 <= (-{((reg15[(3'h6):(2'h3)] ?
                      $unsigned(reg14) : wire3) <<< $signed((reg10 ?
                      reg10 : reg10))),
                  (((reg15 + reg14) ? (reg12 ^~ wire1) : $unsigned(reg13)) ?
                      reg5[(3'h4):(1'h0)] : {reg13, reg9})});
            end
          else
            begin
              reg12 <= $unsigned(({{reg12[(4'hb):(3'h5)], $signed((8'ha5))},
                      (^$unsigned(reg9))} ?
                  (-(~&(reg15 >>> (7'h42)))) : (($signed((8'ha5)) >> (reg5 ?
                      reg15 : reg13)) || wire0[(1'h0):(1'h0)])));
              reg13 <= (8'hb8);
            end
          if (reg16)
            begin
              reg16 <= ((|reg12[(2'h2):(2'h2)]) ? reg11 : reg16[(3'h4):(3'h4)]);
              reg17 <= (!($signed(wire3) ?
                  reg14 : (&((wire1 && reg13) ?
                      {reg9} : reg10[(4'h9):(2'h3)]))));
            end
          else
            begin
              reg16 <= (~^reg5);
              reg17 <= reg8[(4'hb):(4'hb)];
              reg18 <= {(wire2 ? reg10 : ((8'haa) ? (8'ha0) : reg9)),
                  (wire4 ^ reg8)};
            end
        end
      if (reg8)
        begin
          reg19 <= $unsigned((reg8 ?
              reg17 : $signed($unsigned((wire4 ^ wire4)))));
          reg20 <= ({(($signed(wire0) ^~ (reg16 ? reg14 : reg5)) ?
                      $unsigned($signed(wire0)) : $unsigned(reg16[(1'h0):(1'h0)]))} ?
              {$signed($unsigned($signed(reg6)))} : (!$signed(($signed(reg18) ?
                  (reg6 <<< (8'ha2)) : (+(8'hb7))))));
          if ($unsigned(((($unsigned(reg8) | (reg8 == (8'hbe))) ^~ (7'h41)) ^ {{{reg17,
                      reg16},
                  $unsigned(wire3)}})))
            begin
              reg21 <= $signed((reg5[(1'h1):(1'h1)] ?
                  ($signed($unsigned(wire1)) ?
                      reg10[(3'h5):(1'h0)] : (((8'ha2) ?
                          reg9 : (8'hb4)) ^~ $signed((8'hb4)))) : {reg19[(2'h2):(2'h2)]}));
              reg22 <= $unsigned(reg20[(2'h2):(2'h2)]);
              reg23 <= $signed((~reg16[(4'hc):(4'hb)]));
              reg24 <= {{reg20[(2'h2):(1'h1)], $unsigned((^(reg7 - reg8)))},
                  $signed((8'hb7))};
            end
          else
            begin
              reg21 <= ($unsigned($unsigned((-(~&reg9)))) ?
                  (+$unsigned(($signed((8'haf)) & $unsigned(reg7)))) : reg5[(3'h5):(2'h3)]);
            end
        end
      else
        begin
          reg19 <= {(~&((reg16 ? (wire2 ? reg9 : reg14) : $signed(reg21)) ?
                  (reg11 + (wire4 ? reg9 : reg18)) : (8'ha0)))};
          reg20 <= (8'hbd);
          reg21 <= (reg7[(1'h0):(1'h0)] <= reg16[(4'hf):(4'he)]);
        end
      reg25 <= reg16[(1'h0):(1'h0)];
    end
  assign wire26 = ((|$unsigned(reg7[(1'h1):(1'h1)])) ?
                      reg11[(2'h3):(2'h2)] : (((((8'hbd) ? reg15 : reg16) ?
                              (8'hac) : (reg10 > reg13)) || ((wire2 | (8'hb6)) ?
                              $unsigned((8'h9f)) : reg19)) ?
                          reg13 : $signed($signed(((8'hba) ?
                              (8'hb4) : wire1)))));
  always
    @(posedge clk) begin
      reg27 <= reg11;
      reg28 <= $signed((reg9[(3'h4):(2'h2)] ?
          {$signed(reg5[(2'h3):(1'h1)]), (~|{(8'haa)})} : wire1));
      reg29 <= reg24[(3'h6):(3'h4)];
      reg30 <= ((^~((reg25[(4'hb):(4'ha)] ~^ (reg17 < wire4)) & ((reg18 > (8'ha1)) ?
          (~|reg16) : $unsigned(reg8)))) + {(^((&reg17) != reg20[(1'h1):(1'h0)])),
          ($signed({wire2, reg22}) ? (+$signed(reg5)) : wire26)});
      reg31 <= {$signed(reg9),
          $unsigned($unsigned($unsigned($unsigned(reg21))))};
    end
endmodule
