module top
#(parameter param34 = (({(~|((8'ha6) ? (8'hb4) : (8'ha4))), (7'h40)} ^~ ((~^{(8'hb3), (7'h41)}) && {((8'ha1) ^ (8'hb5))})) ? (!(^~(-((7'h42) ? (8'hb7) : (8'hb2))))) : (~^{((+(8'ha5)) ? (~&(8'hbf)) : ((7'h42) ? (8'hb5) : (8'ha9)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire28;
  wire signed [(3'h4):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire6,
                 wire5,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
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
                 (1'h0)};
  assign wire5 = ((!wire2[(1'h1):(1'h0)]) ?
                     (wire2[(4'h9):(1'h0)] ?
                         wire3[(2'h2):(1'h1)] : $signed(($signed(wire1) || $signed(wire1)))) : wire1);
  assign wire6 = wire4[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg7 <= $signed((wire2[(4'hc):(3'h6)] + $signed((!wire0[(2'h3):(2'h2)]))));
      reg8 <= wire0;
      reg9 <= {$unsigned($unsigned($signed($unsigned(wire1))))};
      if (((^~(~&wire2)) ^~ (((!(^wire6)) ~^ wire3) ?
          reg8[(3'h7):(3'h6)] : wire6)))
        begin
          reg10 <= $unsigned((~|(-wire6[(3'h7):(2'h2)])));
          if (wire0)
            begin
              reg11 <= {{(reg7 ?
                          ($unsigned(wire6) ?
                              $signed(wire3) : (reg10 >= wire6)) : wire2),
                      wire3},
                  ($unsigned(reg8) | $signed((~$unsigned(wire6))))};
            end
          else
            begin
              reg11 <= (-(((wire3[(2'h2):(1'h1)] == (~&(8'haf))) ?
                  (&$unsigned(reg8)) : wire0[(1'h1):(1'h0)]) > reg7));
              reg12 <= (~|(~$signed(wire0)));
            end
          reg13 <= reg10;
          reg14 <= $signed(wire5[(1'h1):(1'h1)]);
        end
      else
        begin
          if ((|$signed((($signed(wire3) ?
                  reg8[(2'h2):(1'h0)] : reg14[(2'h3):(2'h3)]) ?
              $unsigned(wire6) : ((reg13 ? wire3 : (8'ha2)) + {wire2})))))
            begin
              reg10 <= {$signed(wire0[(1'h1):(1'h0)]), reg14};
            end
          else
            begin
              reg10 <= ((^~$signed({{reg14}})) ?
                  ((~((reg10 != reg7) ?
                      wire1 : (wire0 ?
                          reg10 : wire3))) ^~ $unsigned(reg13)) : $unsigned(reg12));
              reg11 <= wire6;
              reg12 <= ($unsigned(({reg11,
                  (&wire0)} >= (~|(^wire5)))) <<< wire2[(5'h13):(3'h6)]);
              reg13 <= $signed($unsigned((($signed(reg14) ?
                      $signed((7'h42)) : (reg11 ? wire3 : reg13)) ?
                  (8'hb9) : reg9[(1'h0):(1'h0)])));
            end
          reg14 <= {$signed(wire3[(1'h1):(1'h0)]),
              $signed($signed(($signed(wire0) || (~wire4))))};
          reg15 <= (~((&($signed((8'hb9)) ? $unsigned((8'hbd)) : (-reg9))) ?
              (($signed(reg13) ?
                  (wire0 != (8'ha2)) : (wire4 != reg10)) | reg14) : ((reg13[(4'hb):(2'h2)] ?
                      $signed(reg14) : $signed((8'hac))) ?
                  $signed(wire2[(2'h2):(1'h1)]) : ((7'h44) ~^ (wire6 - reg12)))));
          if ({($unsigned(wire4) ?
                  ({$signed(wire3), reg7} ?
                      (~$signed(wire6)) : {(reg15 ~^ wire6),
                          {wire2}}) : wire2[(3'h4):(2'h2)])})
            begin
              reg16 <= wire2[(4'h8):(3'h7)];
              reg17 <= (!$unsigned($signed(wire0[(3'h6):(2'h3)])));
              reg18 <= $signed(wire2);
            end
          else
            begin
              reg16 <= (((~&{(!reg14), reg15}) ~^ (((wire0 - reg18) ?
                      (&reg7) : (+reg13)) >> (^reg14[(4'h8):(4'h8)]))) ?
                  (reg7[(3'h6):(3'h4)] + (reg13[(4'h8):(1'h0)] <= ({wire2,
                          reg10} ?
                      ((7'h44) >> reg9) : (wire6 != reg17)))) : ($signed($unsigned(((8'ha8) ?
                          (8'h9f) : wire0))) ?
                      $signed($signed(wire1[(2'h3):(1'h1)])) : (-reg9[(1'h1):(1'h0)])));
            end
          reg19 <= $signed({reg15[(4'h9):(3'h6)],
              $signed(reg7[(1'h0):(1'h0)])});
        end
      if ((~$unsigned(($unsigned($unsigned(reg16)) ?
          wire2 : (((7'h40) ? (8'hab) : reg10) ?
              (reg16 ? wire0 : reg10) : reg15[(1'h1):(1'h1)])))))
        begin
          reg20 <= $signed(wire2);
          if (reg7[(4'hc):(1'h1)])
            begin
              reg21 <= reg17[(4'h8):(2'h2)];
              reg22 <= (^(reg17 <= (wire5 ?
                  ((wire4 ?
                      (8'hb9) : reg9) <= (reg18 - reg9)) : ((reg12 >> reg11) ?
                      (+reg19) : $signed(reg15)))));
              reg23 <= $unsigned((wire2[(1'h0):(1'h0)] >= (~|reg16)));
            end
          else
            begin
              reg21 <= wire1[(1'h1):(1'h0)];
              reg22 <= $signed(wire4[(4'hf):(3'h6)]);
              reg23 <= (-((8'hb6) && (~|$unsigned($unsigned(reg19)))));
            end
        end
      else
        begin
          reg20 <= reg23;
        end
    end
  assign wire24 = ($signed((^($unsigned(reg11) ? reg23 : $signed((8'hac))))) ?
                      $unsigned($unsigned({{reg10, reg20},
                          ((8'ha9) ?
                              reg12 : reg17)})) : ((8'h9c) + ($signed(reg13[(3'h6):(3'h5)]) ?
                          ($signed(reg7) ?
                              (+reg21) : (wire4 ? wire5 : reg20)) : ((wire2 ?
                                  wire0 : wire0) ?
                              {reg11} : $signed(reg10)))));
  assign wire25 = $signed(wire0);
  assign wire26 = (+({reg12} * (($signed(wire3) ? (~&(8'haa)) : (!reg9)) ?
                      $unsigned((&reg13)) : $unsigned($unsigned((8'hb5))))));
  assign wire27 = (($signed(((reg23 ? wire1 : reg18) ?
                          reg22[(1'h0):(1'h0)] : reg7)) ?
                      $signed($unsigned($unsigned(reg16))) : {reg19[(1'h0):(1'h0)],
                          (^(reg11 ?
                              reg14 : wire0))}) & ($signed(wire25) + (((wire6 <= reg18) != wire3[(2'h2):(2'h2)]) * reg22[(2'h3):(2'h2)])));
  assign wire28 = wire24[(4'h8):(3'h5)];
  always
    @(posedge clk) begin
      reg29 <= ((((8'ha8) >>> reg17) ?
          (($unsigned(wire5) - (reg16 < reg22)) + (wire4[(1'h1):(1'h1)] - (~reg23))) : ((!wire27[(2'h2):(2'h2)]) | {wire1[(2'h2):(2'h2)],
              (reg13 << wire26)})) <= (reg7 ?
          (~$signed(reg15[(1'h1):(1'h0)])) : reg17[(4'hd):(4'h9)]));
      reg30 <= (8'ha3);
      reg31 <= wire26[(4'hb):(1'h1)];
      reg32 <= reg9[(1'h1):(1'h1)];
      reg33 <= reg23;
    end
endmodule
