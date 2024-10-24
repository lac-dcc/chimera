module top
#(parameter param27 = ((8'ha2) ? {((8'ha1) | (~^((8'ha3) && (8'h9c)))), ((^(|(8'hae))) ? ({(8'hb9)} >= (&(8'hab))) : ((^(8'hbc)) ? ((8'hbc) ? (8'ha4) : (8'h9e)) : {(8'hbd), (8'hbb)}))} : (!({((8'hb1) ? (8'hb5) : (8'ha9)), ((8'haa) >>> (8'ha7))} ? (^((8'hb5) ^~ (8'hbe))) : (~&{(8'hb0), (7'h44)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  assign y = {wire7,
                 wire6,
                 wire5,
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
  assign wire5 = ($unsigned((($signed(wire3) ?
                         wire0 : (wire1 ?
                             wire0 : wire2)) != wire2[(2'h3):(2'h2)])) ?
                     wire1[(1'h0):(1'h0)] : wire2);
  assign wire6 = wire0[(4'h8):(4'h8)];
  assign wire7 = (-(&((wire6 ? wire0 : (wire3 < (8'hbe))) == (wire3 ?
                     (8'ha5) : (wire6 | wire1)))));
  always
    @(posedge clk) begin
      if ((wire6[(3'h6):(1'h1)] <<< (7'h41)))
        begin
          if ($signed((wire1 ?
              wire2[(4'he):(3'h7)] : {(+(!wire5)), (^~$unsigned((8'h9f)))})))
            begin
              reg8 <= ({wire7[(4'he):(4'hb)], wire0[(4'ha):(3'h6)]} ?
                  wire4[(4'he):(2'h3)] : wire6);
              reg9 <= {(|$unsigned((~&$signed(wire4)))), wire2[(4'hd):(4'h9)]};
              reg10 <= {$signed($signed({(wire5 ? (8'hbb) : reg9),
                      ((8'had) ? wire5 : (8'ha3))}))};
              reg11 <= wire2[(4'hc):(4'hb)];
              reg12 <= $signed((wire2[(3'h6):(1'h1)] && reg10));
            end
          else
            begin
              reg8 <= (|{($unsigned((!(8'ha2))) ?
                      (~&(reg12 ? wire2 : wire7)) : reg11[(2'h2):(2'h2)])});
              reg9 <= ((~^reg10[(3'h4):(2'h2)]) >>> (|wire4[(3'h7):(3'h5)]));
              reg10 <= (((|($unsigned(wire2) >= (reg12 < wire4))) ?
                      ((wire6[(4'hd):(1'h0)] && wire3[(3'h5):(1'h0)]) ?
                          $unsigned(wire7) : $unsigned(((8'ha3) <<< wire3))) : wire0[(3'h6):(2'h2)]) ?
                  (wire0 ^~ ($signed((reg12 || (7'h44))) ?
                      $signed($unsigned(reg9)) : wire0[(3'h7):(2'h2)])) : reg9);
            end
          reg13 <= $signed(wire1);
          reg14 <= $unsigned(((wire1[(2'h2):(1'h1)] ?
                  (^$signed(wire5)) : wire5[(4'h9):(3'h4)]) ?
              (~&wire2[(3'h4):(1'h0)]) : $signed(((wire6 > reg8) ?
                  (reg11 == wire0) : reg11))));
          if ((~|$signed(wire2[(2'h2):(1'h0)])))
            begin
              reg15 <= reg14;
              reg16 <= reg12;
              reg17 <= (wire4 ? (~|$unsigned((8'ha4))) : wire5);
            end
          else
            begin
              reg15 <= wire2[(4'hd):(2'h2)];
              reg16 <= ({$unsigned((8'hbd)),
                      ((~^(wire0 ? wire2 : wire5)) ?
                          $signed({reg11}) : $unsigned({reg12, (8'had)}))} ?
                  (((&(reg14 - reg8)) >>> wire0[(3'h6):(3'h4)]) ?
                      ((~|(reg17 ? (7'h43) : wire1)) ?
                          $unsigned((~^(8'ha2))) : $unsigned((wire5 ?
                              reg15 : reg15))) : wire7[(4'he):(3'h7)]) : ($unsigned(((^wire5) ~^ (reg11 ^ wire6))) ?
                      $signed((~^$signed(reg14))) : (8'hb7)));
              reg17 <= (+reg8[(5'h12):(2'h2)]);
              reg18 <= (~^$signed(reg10));
            end
        end
      else
        begin
          reg8 <= ((^~(($unsigned((8'hbf)) || ((7'h44) ? reg11 : (8'haa))) ?
                  $signed((reg8 >= wire2)) : {$unsigned(reg9)})) ?
              ((!$signed((reg12 < reg15))) ? reg12 : wire4) : (reg9 ?
                  wire1[(1'h0):(1'h0)] : wire6[(2'h3):(2'h3)]));
          reg9 <= (~^reg14[(4'hc):(4'hc)]);
          reg10 <= reg12[(1'h0):(1'h0)];
          reg11 <= reg14;
        end
      reg19 <= $signed($unsigned((((wire3 ^ reg18) ^~ (&(8'ha7))) ?
          $signed((wire6 ? reg13 : wire5)) : reg10)));
      reg20 <= (reg11[(2'h3):(1'h1)] | reg8[(5'h14):(3'h6)]);
      if ($signed(wire3))
        begin
          reg21 <= wire1;
          if ((reg19[(3'h6):(1'h1)] == ({reg21} >>> {($signed(wire1) ^~ $unsigned(wire4)),
              (wire6 > (wire3 == reg14))})))
            begin
              reg22 <= (($signed({reg12}) <= $signed(reg21)) + $signed($signed((~|(&reg21)))));
              reg23 <= $signed(reg16[(1'h1):(1'h0)]);
              reg24 <= wire6;
              reg25 <= reg14;
            end
          else
            begin
              reg22 <= $signed((8'ha9));
              reg23 <= wire3;
              reg24 <= $unsigned((reg25 >>> (~|reg12[(2'h3):(2'h3)])));
              reg25 <= $signed($unsigned(((reg22 | (~&wire6)) ?
                  ((|wire7) ? wire5 : (&reg8)) : reg18[(1'h1):(1'h1)])));
              reg26 <= ($signed((8'hbe)) ^ wire6);
            end
        end
      else
        begin
          if ({reg12, reg15[(1'h0):(1'h0)]})
            begin
              reg21 <= ((^~({wire5[(4'h9):(2'h3)]} ?
                  ({reg9} ?
                      (reg14 >= (8'ha2)) : wire3) : $unsigned($unsigned(wire4)))) >> reg16);
            end
          else
            begin
              reg21 <= (~&((reg23 + ((reg15 << reg9) ?
                      {wire7, reg14} : (wire1 ^ wire6))) ?
                  (reg9[(1'h0):(1'h0)] > (8'h9e)) : reg13[(3'h5):(2'h3)]));
              reg22 <= reg17[(3'h5):(1'h0)];
            end
          reg23 <= (((reg16[(2'h2):(2'h2)] ?
                  (~|reg26[(4'h8):(1'h0)]) : ((reg11 ^ reg14) ?
                      $unsigned((8'hb0)) : reg24[(3'h7):(3'h6)])) ^~ $unsigned({wire5,
                  {reg9}})) ?
              $unsigned(wire2[(5'h12):(5'h12)]) : reg20);
        end
    end
endmodule
