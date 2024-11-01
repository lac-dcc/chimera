module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg5 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire20,
                 wire19,
                 wire18,
                 wire4,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
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
  assign wire4 = $signed((wire3[(4'h9):(1'h1)] ?
                     wire0[(3'h7):(1'h1)] : {wire1[(1'h1):(1'h0)],
                         $signed((wire0 || wire1))}));
  always
    @(posedge clk) begin
      if ({$unsigned(wire0[(3'h7):(3'h5)])})
        begin
          reg5 <= $unsigned((8'ha6));
          reg6 <= wire3;
          reg7 <= $unsigned(((reg5 ?
              $signed((reg5 < wire0)) : wire1) | (^~$unsigned(wire3[(1'h1):(1'h1)]))));
        end
      else
        begin
          if ({reg6[(2'h2):(1'h1)],
              {{(^~{reg5, wire2})},
                  (((reg5 << wire0) && $signed(wire1)) != ($signed(wire4) | (8'ha8)))}})
            begin
              reg5 <= $signed((((&(reg5 ?
                      wire1 : (8'ha2))) != wire2[(3'h6):(1'h1)]) ?
                  ((~&(8'hbe)) <<< reg7) : reg7[(4'h9):(2'h3)]));
              reg6 <= (wire4[(3'h6):(1'h1)] << ($signed($unsigned(reg7)) ?
                  wire3[(4'hc):(4'hc)] : wire4[(2'h3):(1'h0)]));
              reg7 <= ($signed((reg6[(2'h2):(1'h0)] ?
                  (&reg6) : (reg6 ?
                      (reg5 & wire4) : (wire4 <<< wire0)))) <<< $unsigned({($signed(wire1) ?
                      (wire2 + wire1) : $unsigned(reg7)),
                  $signed($unsigned(reg5))}));
              reg8 <= wire0[(3'h5):(3'h4)];
              reg9 <= ({(~$signed((^reg7)))} ? reg8[(4'h8):(3'h7)] : reg8);
            end
          else
            begin
              reg5 <= ((reg6 ?
                  $signed($unsigned({reg5, wire2})) : $unsigned(((reg8 ?
                      wire0 : wire1) << (reg5 ?
                      reg7 : reg9)))) >> reg7[(4'h9):(3'h6)]);
              reg6 <= (+reg7[(3'h7):(2'h2)]);
              reg7 <= reg7[(4'h8):(1'h0)];
              reg8 <= $unsigned(wire3[(3'h6):(3'h4)]);
              reg9 <= wire0[(4'ha):(4'h8)];
            end
          reg10 <= (&{$signed((reg7 <= (reg6 ? (8'ha9) : reg6)))});
          reg11 <= $unsigned(reg9[(4'he):(1'h0)]);
          reg12 <= (|$unsigned((8'ha8)));
          if (($unsigned(reg12[(5'h14):(3'h6)]) ?
              $unsigned((((reg8 - wire3) ?
                      $signed((8'had)) : ((8'h9d) ? reg10 : reg9)) ?
                  $unsigned(wire2[(3'h5):(3'h4)]) : (^$signed(reg5)))) : reg7))
            begin
              reg13 <= (8'hb5);
              reg14 <= reg12[(3'h6):(3'h4)];
              reg15 <= reg14[(4'hf):(4'hb)];
              reg16 <= (reg15[(4'h9):(4'h8)] & (8'ha0));
            end
          else
            begin
              reg13 <= $signed((((wire4 >= ((8'hb9) >= wire2)) ?
                  $signed({(8'ha8)}) : (+wire3[(4'ha):(1'h1)])) >> {reg6[(1'h1):(1'h1)]}));
            end
        end
      reg17 <= (wire0[(2'h3):(1'h0)] ?
          {$unsigned(((&(8'ha1)) >> ((8'hb4) ? reg15 : reg6))),
              {((reg9 ? reg12 : (8'hbb)) ? (~|wire0) : (wire0 ? reg11 : wire0)),
                  (~|$signed(reg7))}} : $unsigned($unsigned($unsigned((!(8'hb3))))));
    end
  assign wire18 = $signed((8'hb8));
  assign wire19 = wire2[(4'h9):(3'h4)];
  assign wire20 = $signed((~|wire18[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      if ((^~$signed(wire2)))
        begin
          reg21 <= ((reg5 ?
              (($signed((8'hbb)) ? $unsigned((8'hac)) : {wire1}) ?
                  $signed($signed((7'h44))) : (wire20 || (~(8'haa)))) : (wire0 ?
                  wire18[(2'h2):(1'h1)] : $unsigned($unsigned(reg6)))) >> (reg15[(1'h1):(1'h0)] ?
              $signed(($signed(wire20) <<< $unsigned(reg13))) : (((reg9 - reg13) ?
                      wire19 : (wire4 < wire19)) ?
                  $signed($unsigned(wire0)) : ((reg13 - (8'h9d)) ?
                      $signed(reg8) : (!reg11)))));
          if (($unsigned({{{(8'hbd)}, {(8'hb2)}}, (8'ha6)}) ?
              (^reg6[(2'h2):(1'h0)]) : (reg14 - (&((reg15 ? reg8 : reg13) ?
                  reg17[(3'h4):(2'h3)] : (-reg10))))))
            begin
              reg22 <= (+(reg11 & reg21[(3'h4):(2'h2)]));
              reg23 <= (reg10[(2'h2):(1'h1)] * $unsigned($unsigned(wire0[(3'h6):(2'h2)])));
              reg24 <= reg17;
            end
          else
            begin
              reg22 <= $unsigned(($unsigned((8'hb0)) ?
                  $unsigned($unsigned($unsigned(reg14))) : $signed(($signed(reg6) ?
                      $unsigned((8'hb8)) : ((8'hac) ? reg17 : (8'ha3))))));
              reg23 <= $signed(reg5);
              reg24 <= (reg21 ?
                  $unsigned($signed($signed(reg17))) : reg6[(1'h0):(1'h0)]);
              reg25 <= reg21[(2'h3):(2'h3)];
              reg26 <= (!({$signed((8'ha2)),
                  reg11} && $signed(($unsigned(reg17) <<< reg16))));
            end
        end
      else
        begin
          reg21 <= {({reg6} >> (-reg12[(5'h14):(2'h2)])), reg9};
          reg22 <= {reg23, (|(-(~wire3)))};
        end
      reg27 <= $unsigned(reg12[(3'h5):(1'h0)]);
      reg28 <= reg9[(4'h8):(4'h8)];
      reg29 <= $signed(reg6);
    end
  assign wire30 = reg22;
  assign wire31 = ($signed(reg23) ?
                      $unsigned($unsigned(((~^reg17) ?
                          (reg29 ^~ wire18) : {wire3}))) : {$signed(reg14),
                          reg6});
  assign wire32 = (reg21 * $unsigned($signed(reg26)));
endmodule
