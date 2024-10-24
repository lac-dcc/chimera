module top
#(parameter param25 = (((~^((|(8'hae)) <= {(8'ha3), (8'ha5)})) ? (&({(8'h9d), (8'hbe)} ? (~&(8'h9e)) : (~|(8'hb0)))) : (!((+(8'had)) > (&(8'ha3))))) | {(&{(|(8'hb9))})}), 
parameter param26 = ({(7'h43), (param25 <= ((param25 << param25) ? (!param25) : (^param25)))} ? ((((-param25) ? ((8'hb6) || param25) : (~|param25)) | ({(8'had), param25} ? {(8'h9d), param25} : (param25 >= param25))) ? ((param25 ? ((8'ha9) ? param25 : param25) : param25) | (|{param25})) : {param25}) : (param25 ? (!(~^{(8'ha5), (8'hba)})) : (8'hb3))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire6;
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg4 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire6,
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
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (($signed(wire3) ?
          (^~$signed(wire1)) : (~^(^wire0[(5'h13):(1'h0)]))) << {(8'hb8),
          $signed(wire2[(4'hb):(4'hb)])});
      reg5 <= (+{wire0[(5'h10):(5'h10)], $signed(reg4[(2'h3):(1'h0)])});
    end
  assign wire6 = $signed((reg4[(1'h1):(1'h1)] >= ({wire3[(4'hb):(2'h3)],
                     $unsigned(wire3)} ^~ ((wire2 ? reg4 : reg5) ?
                     ((8'hbf) >= wire2) : $signed(wire2)))));
  always
    @(posedge clk) begin
      if ({wire3[(3'h7):(3'h7)], wire1[(3'h6):(1'h1)]})
        begin
          if (((^reg4[(2'h2):(1'h1)]) ?
              {wire2[(4'h8):(1'h0)]} : (wire6[(3'h5):(1'h0)] ?
                  wire2 : ((~&{reg4, wire0}) ?
                      $unsigned((+wire0)) : $signed((wire2 < reg4))))))
            begin
              reg7 <= wire1[(3'h7):(1'h1)];
              reg8 <= ((wire6 >= $unsigned(((^~wire3) ?
                  $signed((8'hbd)) : $signed(wire3)))) << $signed($unsigned((!$unsigned(reg5)))));
              reg9 <= reg8;
              reg10 <= ({(wire1[(4'h9):(3'h5)] ?
                      {(|reg5), (&(8'haf))} : ({reg9, reg8} ?
                          (~|reg8) : (|reg5)))} < $signed($signed(((reg9 + reg7) != $signed(wire0)))));
            end
          else
            begin
              reg7 <= wire6;
              reg8 <= $signed((|$signed((((8'haf) ?
                  wire3 : reg10) & (-reg7)))));
            end
          reg11 <= {$unsigned(((reg5 ^ ((8'ha7) ^ wire6)) ?
                  (~^(wire3 + (8'h9f))) : wire6[(4'h9):(4'h9)])),
              $signed((7'h44))};
        end
      else
        begin
          reg7 <= $unsigned(($unsigned($unsigned(reg9)) > ($signed({reg11,
              reg9}) ^ {(-reg7), (!wire6)})));
          if ((|wire3))
            begin
              reg8 <= $unsigned($signed($signed(({(8'hb1), wire3} ?
                  wire0 : (^wire3)))));
              reg9 <= reg5[(3'h5):(2'h3)];
              reg10 <= ($unsigned(reg5[(4'ha):(3'h6)]) ?
                  wire3 : $signed(($signed({wire2}) ?
                      {(wire1 | reg11)} : ($signed(reg7) && reg9))));
              reg11 <= (($signed({(~^reg7), (+wire3)}) ?
                      $unsigned({$unsigned(reg10)}) : reg4[(3'h6):(3'h6)]) ?
                  reg11 : wire1);
              reg12 <= ({$unsigned((^(wire2 << reg8)))} ?
                  reg8[(1'h1):(1'h1)] : reg5[(3'h6):(3'h4)]);
            end
          else
            begin
              reg8 <= (((~^(wire3[(4'hb):(3'h7)] == $unsigned(wire3))) <<< reg5) || (reg8[(4'hb):(2'h2)] ?
                  ($signed((^reg11)) - $signed($signed(wire6))) : reg10));
              reg9 <= {reg5[(1'h0):(1'h0)]};
              reg10 <= (~$unsigned($signed(($signed(wire2) ?
                  $signed(reg8) : (^(8'hb4))))));
              reg11 <= $unsigned(((wire6[(3'h7):(3'h6)] > $unsigned({reg10})) <= reg4));
            end
        end
      reg13 <= wire6;
      reg14 <= $signed($unsigned(reg8));
      if (reg4[(3'h7):(1'h1)])
        begin
          if ((wire2 ^~ wire1[(4'ha):(1'h1)]))
            begin
              reg15 <= $unsigned($unsigned((7'h42)));
              reg16 <= $unsigned((~&{((~|wire2) & reg15[(1'h0):(1'h0)])}));
              reg17 <= $signed((reg12 ? wire2 : $signed(reg9[(2'h2):(1'h1)])));
              reg18 <= $signed((reg14 ?
                  $signed(((8'ha6) ?
                      $unsigned(wire3) : (8'hbe))) : (($signed(reg11) ?
                      (~|reg7) : (wire2 ?
                          reg15 : (8'hbf))) ^ (!$signed((8'h9f))))));
              reg19 <= (wire2[(3'h4):(1'h0)] << (reg17 + wire1));
            end
          else
            begin
              reg15 <= (((($signed(wire6) ^ {reg17}) < ($signed(reg11) ?
                          ((8'hb3) ? reg5 : reg10) : (&wire1))) ?
                      (((wire1 > reg5) ? $unsigned(reg5) : reg11) ?
                          $signed(((8'hb2) ?
                              reg7 : reg8)) : $unsigned(reg4[(1'h0):(1'h0)])) : {($unsigned(reg13) ?
                              $signed(wire3) : wire3)}) ?
                  (^$unsigned(((wire3 ? wire2 : reg13) * (!(8'hac))))) : reg17);
            end
          reg20 <= $unsigned({(^(^((8'h9f) && reg9))),
              $unsigned((wire1[(3'h7):(2'h3)] ^ (-(8'hbc))))});
          reg21 <= {$signed($signed($signed(wire1[(1'h0):(1'h0)]))),
              $unsigned(((!reg15[(1'h0):(1'h0)]) ?
                  ((|reg11) << $unsigned(wire2)) : reg10))};
          reg22 <= (8'h9f);
        end
      else
        begin
          if ((reg19 ? $signed($signed(reg4)) : $unsigned((8'ha1))))
            begin
              reg15 <= wire6[(4'h9):(3'h5)];
              reg16 <= {reg5};
              reg17 <= (8'hbf);
              reg18 <= reg18;
            end
          else
            begin
              reg15 <= $unsigned({($signed((~&reg20)) & $unsigned($signed(reg13)))});
              reg16 <= reg19;
            end
          reg19 <= ($signed($unsigned($unsigned($unsigned(wire2)))) <<< (reg21[(3'h4):(2'h3)] <<< (wire1 >= ((reg10 ?
              reg16 : reg15) * (wire0 ? reg11 : reg15)))));
          reg20 <= reg19[(4'h9):(3'h6)];
          reg21 <= $unsigned(reg17);
          reg22 <= reg15;
        end
    end
  assign wire23 = (8'hbf);
  assign wire24 = ($signed((reg10[(2'h2):(1'h0)] ?
                          (+(8'hac)) : $signed(reg15[(3'h4):(1'h1)]))) ?
                      (reg20 > $signed((^~(reg15 || (8'hb7))))) : reg10[(3'h4):(2'h2)]);
endmodule
