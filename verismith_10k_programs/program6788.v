module top
#(parameter param28 = ((^(8'hab)) << (!(^~(((8'had) << (7'h40)) >> (8'hbd))))), 
parameter param29 = ((param28 & (((~param28) ^ (param28 <= param28)) ? ((param28 ? param28 : param28) ^ param28) : param28)) ? ((({param28} ? (param28 <<< param28) : (param28 ? param28 : param28)) ? (~&(param28 ? param28 : param28)) : (&param28)) ^~ (8'ha5)) : param28))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire27;
  wire signed [(4'h9):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = (^wire1[(2'h2):(2'h2)]);
  assign wire6 = {$signed($signed(($signed(wire2) >> ((8'hbc) ?
                         wire0 : wire2)))),
                     wire3[(4'he):(3'h4)]};
  always
    @(posedge clk) begin
      if (wire2)
        begin
          reg7 <= ((((wire4 ? $unsigned(wire5) : (wire6 & wire5)) ?
                      $signed($signed(wire4)) : ((wire1 ? wire0 : wire5) ?
                          wire6 : (wire1 ? wire6 : wire3))) ?
                  $unsigned($signed($unsigned(wire2))) : wire1) ?
              (($unsigned($unsigned(wire6)) >>> {$signed(wire6)}) ?
                  wire5 : wire5) : $unsigned(((^(^wire0)) ?
                  (wire1 ? (|wire5) : {wire3, wire4}) : (!wire6))));
          reg8 <= (8'ha4);
          if ($unsigned(((~^$signed($signed(wire3))) == (-wire6))))
            begin
              reg9 <= (&(^wire6[(3'h4):(1'h1)]));
              reg10 <= (~&wire2);
            end
          else
            begin
              reg9 <= $unsigned(wire1);
              reg10 <= wire1[(2'h2):(1'h1)];
              reg11 <= $signed((~|$unsigned(wire6[(1'h0):(1'h0)])));
              reg12 <= $unsigned(wire4[(3'h6):(3'h4)]);
              reg13 <= {wire6[(1'h1):(1'h1)]};
            end
          reg14 <= {$unsigned(reg8),
              $signed(($signed((~reg12)) >= ((8'hb6) ?
                  (reg8 * wire3) : (~&reg7))))};
        end
      else
        begin
          reg7 <= $unsigned($unsigned(reg12[(2'h3):(2'h2)]));
          reg8 <= reg14[(5'h13):(4'h8)];
          reg9 <= ((8'ha8) | reg9[(2'h3):(2'h2)]);
        end
      if (wire3)
        begin
          if (((+(wire2[(3'h5):(1'h0)] ?
              $signed($unsigned((8'hb1))) : ({reg7} ?
                  $signed(reg14) : (reg10 <= reg14)))) * ($signed(($signed(wire2) ?
                  reg11[(4'h8):(3'h4)] : wire3[(4'hd):(4'ha)])) ?
              ($signed(wire0[(3'h4):(3'h4)]) || (8'hbf)) : ($unsigned($signed((8'ha2))) ?
                  wire4[(3'h6):(1'h1)] : reg10))))
            begin
              reg15 <= $signed(wire0);
              reg16 <= $unsigned($signed(wire0));
              reg17 <= ($signed(($signed($unsigned(wire1)) <= wire0)) || $unsigned((reg13[(4'h9):(3'h7)] <= reg9)));
            end
          else
            begin
              reg15 <= $unsigned(reg11[(3'h4):(1'h0)]);
              reg16 <= $unsigned($unsigned(((!reg8) ?
                  {reg14[(1'h1):(1'h1)], (-wire5)} : (~^reg9[(2'h3):(2'h3)]))));
              reg17 <= ($signed(($signed(reg8[(4'hb):(3'h5)]) || $signed((+reg8)))) ?
                  wire5[(3'h7):(1'h1)] : reg13);
            end
        end
      else
        begin
          if ($unsigned($signed(($signed(reg15[(3'h7):(3'h7)]) * (!reg16)))))
            begin
              reg15 <= ($unsigned((wire6[(3'h4):(1'h0)] ?
                      $signed((reg8 ? reg10 : reg7)) : ({wire2} ?
                          reg12[(1'h0):(1'h0)] : {reg16, wire1}))) ?
                  ((!$signed((reg8 ? reg14 : reg13))) ?
                      ((&wire5) ?
                          wire6 : {wire0,
                              $unsigned(reg8)}) : ((wire0[(2'h3):(2'h3)] ~^ $signed(reg11)) + wire1[(1'h0):(1'h0)])) : ((reg9[(2'h2):(1'h1)] + {(^wire4)}) ?
                      {$signed((reg13 ~^ reg7))} : (^~(wire5[(2'h3):(1'h1)] <<< (wire1 >>> (8'hbe))))));
              reg16 <= (!{((reg14 ^ $unsigned((8'ha6))) | ({wire5,
                      reg8} <= $unsigned((8'ha6))))});
              reg17 <= {$signed(((reg13 ?
                      $signed(reg12) : (+reg10)) && (-wire0)))};
              reg18 <= $unsigned((({reg8[(5'h10):(4'hf)]} ^~ ($signed(wire3) ?
                      (wire0 != wire0) : reg17)) ?
                  wire2 : wire3));
              reg19 <= (({wire1} >>> reg15[(4'ha):(3'h7)]) << reg10[(3'h6):(3'h5)]);
            end
          else
            begin
              reg15 <= (&reg16[(1'h1):(1'h0)]);
            end
          reg20 <= ($signed($signed(wire3[(5'h12):(1'h1)])) > (reg14[(4'hd):(3'h5)] ^~ reg17[(4'ha):(3'h6)]));
          reg21 <= wire5[(4'ha):(3'h4)];
        end
      reg22 <= {$signed($signed((reg14[(3'h6):(3'h5)] <<< wire1[(3'h5):(3'h4)]))),
          $signed($unsigned($signed((-reg21))))};
    end
  assign wire23 = ((wire4 | $unsigned(((~&reg11) ? (reg7 + reg22) : reg21))) ?
                      $unsigned((((wire2 ?
                          (8'hb0) : (8'ha8)) & (reg22 <<< wire2)) >> reg14)) : (wire5 <= $unsigned(reg22[(2'h2):(1'h1)])));
  assign wire24 = {(&reg14), wire5[(3'h7):(1'h0)]};
  assign wire25 = {(wire1 ?
                          wire1[(2'h2):(2'h2)] : (($signed(reg15) ?
                              (~|(8'hb1)) : (wire2 ?
                                  reg14 : (8'hbf))) + (reg8[(4'hf):(4'hf)] * reg16))),
                      wire4[(4'he):(4'h9)]};
  assign wire26 = ((wire2 > $signed({wire5,
                      wire1[(1'h1):(1'h0)]})) | $unsigned($signed({((8'hbc) && (8'hb9)),
                      $signed(wire1)})));
  assign wire27 = (($signed((reg15[(1'h1):(1'h0)] ?
                      {(8'ha3),
                          reg8} : $unsigned(reg17))) >>> (($signed(reg19) ?
                          reg12[(1'h0):(1'h0)] : (~wire26)) ?
                      $signed((wire3 * (8'hb2))) : ((!wire23) ?
                          (~|reg7) : (+reg7)))) * ($signed($signed($signed(reg20))) ?
                      (((wire24 < reg8) <= reg7[(3'h7):(3'h6)]) ?
                          $signed((reg11 || reg16)) : wire25) : ($signed(wire2) ?
                          (reg7 ?
                              {wire26} : (wire25 - wire3)) : $signed($signed((8'ha3))))));
endmodule
