module top
#(parameter param40 = {(((((8'hb7) ? (8'hba) : (8'hb9)) <= (~&(8'hb4))) ? (((8'h9d) | (7'h42)) ^ (!(8'ha6))) : ((&(8'h9e)) > ((8'hb6) == (7'h43)))) >= (8'hbc))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  assign y = {wire39,
                 wire12,
                 wire11,
                 wire10,
                 wire7,
                 wire6,
                 wire5,
                 reg38,
                 reg37,
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
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = wire4[(2'h3):(2'h2)];
  assign wire6 = wire4[(1'h0):(1'h0)];
  assign wire7 = $unsigned(wire5);
  always
    @(posedge clk) begin
      reg8 <= wire0;
      reg9 <= $unsigned($signed($unsigned({$signed(wire5)})));
    end
  assign wire10 = wire1[(1'h0):(1'h0)];
  assign wire11 = (~^$unsigned(((-(wire5 ^ wire5)) ?
                      $signed((reg9 ? wire1 : reg9)) : reg8)));
  assign wire12 = wire5;
  always
    @(posedge clk) begin
      if (wire12[(1'h1):(1'h0)])
        begin
          if ($signed($signed({$signed((wire5 + wire1))})))
            begin
              reg13 <= ((~&$unsigned({{(8'ha3),
                      wire2}})) <<< wire4[(2'h3):(2'h3)]);
            end
          else
            begin
              reg13 <= wire2[(1'h1):(1'h0)];
              reg14 <= $signed(wire10);
            end
          reg15 <= wire2;
          reg16 <= $unsigned($signed((($signed(wire3) ?
              wire3 : ((8'haf) ? (8'hb9) : wire1)) || {wire2[(1'h0):(1'h0)],
              $unsigned(reg9)})));
          reg17 <= $signed(((!reg13[(5'h10):(2'h2)]) != $signed(((+wire5) ?
              (~&wire3) : (&reg8)))));
        end
      else
        begin
          reg13 <= ($signed(($unsigned(wire4[(2'h2):(2'h2)]) * $signed((reg15 >>> wire12)))) ?
              wire5 : ((!(^$unsigned(wire1))) ?
                  (wire12[(2'h2):(2'h2)] ?
                      $signed(wire0) : reg15[(1'h0):(1'h0)]) : ((wire5 >> wire4) - wire1)));
          if (((($signed((^reg9)) ?
                      (wire2 * $signed(reg9)) : (^~(reg16 && (8'had)))) ?
                  (($unsigned(reg17) ? wire12[(2'h2):(1'h0)] : wire2) ?
                      (^wire6) : ((reg9 ^~ wire11) ?
                          $unsigned((8'hb7)) : {reg13,
                              wire12})) : (~($unsigned(reg9) ?
                      wire0[(1'h0):(1'h0)] : $unsigned(reg17)))) ?
              ((~^(((8'hb1) > wire6) ? $unsigned(reg16) : $signed(reg13))) ?
                  $signed(({wire11, wire4} ?
                      (!reg9) : $signed(wire11))) : ((8'hb9) << (wire3[(1'h0):(1'h0)] ?
                      {reg8} : (wire4 ? wire10 : wire5)))) : (-(reg14 ?
                  (wire6[(4'hc):(3'h5)] | reg14[(3'h7):(3'h7)]) : ((wire0 ^~ (8'hae)) ?
                      (reg17 <= (8'hbf)) : (reg16 ? wire3 : reg13))))))
            begin
              reg14 <= ((^~(~$signed(reg15[(1'h0):(1'h0)]))) <= reg13);
              reg15 <= $signed(wire2);
            end
          else
            begin
              reg14 <= wire6[(3'h6):(2'h2)];
            end
          reg16 <= ((&$unsigned($signed((~&reg14)))) ~^ ($signed((~wire10[(2'h2):(1'h0)])) >> wire11));
          reg17 <= reg17[(1'h1):(1'h1)];
          if ($signed((!wire4)))
            begin
              reg18 <= wire3;
              reg19 <= $signed((8'h9e));
              reg20 <= ($signed(wire3[(1'h1):(1'h1)]) ?
                  $unsigned(wire10[(3'h4):(3'h4)]) : ($signed(((~|reg15) ?
                          wire5[(1'h0):(1'h0)] : {(8'hbf)})) ?
                      (+$signed($signed(wire3))) : wire1[(1'h1):(1'h0)]));
              reg21 <= wire1[(1'h1):(1'h1)];
              reg22 <= (($unsigned((^(reg16 ? reg9 : wire5))) ?
                      wire3[(1'h1):(1'h1)] : reg9[(1'h1):(1'h1)]) ?
                  {(~^(~&$unsigned(reg18)))} : {reg20});
            end
          else
            begin
              reg18 <= reg13[(1'h1):(1'h0)];
              reg19 <= $unsigned(reg8[(5'h11):(3'h7)]);
              reg20 <= $signed($unsigned(({wire5[(4'hd):(4'hc)],
                      ((8'hb3) != reg15)} ?
                  reg16 : ((wire4 >>> reg19) ? wire5 : reg22[(1'h0):(1'h0)]))));
            end
        end
      if ({reg17})
        begin
          if (((reg22[(2'h2):(1'h0)] ?
              (reg13 + (wire4 || ((8'ha5) >>> reg9))) : (~^wire4)) & $signed($unsigned(($signed(reg16) >= $unsigned(wire1))))))
            begin
              reg23 <= $signed(reg18[(4'h9):(4'h9)]);
              reg24 <= ($unsigned(wire2) != ((^~(wire1[(1'h1):(1'h0)] >>> (wire11 ?
                      reg20 : reg15))) ?
                  (reg20 * reg22) : reg14));
              reg25 <= (+$signed(((|(reg8 ? wire1 : reg18)) ?
                  ((reg17 || (7'h44)) == (-wire0)) : reg22)));
              reg26 <= reg13;
            end
          else
            begin
              reg23 <= $signed((+($signed((~&wire10)) ?
                  $signed($unsigned(wire3)) : ((reg18 ?
                      wire5 : reg13) && (wire11 >= reg9)))));
              reg24 <= $unsigned((^~((wire6[(4'he):(3'h5)] ?
                  (|reg24) : $signed((8'hbd))) == reg17[(2'h3):(1'h0)])));
              reg25 <= $signed((^(~^(|reg20[(1'h0):(1'h0)]))));
              reg26 <= ($signed({(wire3 ?
                          (reg16 ?
                              (8'hbd) : (7'h40)) : wire0[(3'h4):(3'h4)])}) ?
                  {$unsigned(reg13[(4'hb):(3'h6)])} : reg14);
              reg27 <= $unsigned(wire11[(4'h9):(4'h8)]);
            end
          reg28 <= reg17;
          reg29 <= $signed((~|$signed((|$unsigned(wire5)))));
        end
      else
        begin
          reg23 <= (wire4 ?
              ({wire5} <= $unsigned(wire2)) : ($signed({$signed(reg15),
                  $unsigned(reg13)}) < (|(~&wire12))));
          reg24 <= $unsigned($unsigned((!$unsigned((wire1 ?
              reg27 : (8'hb6))))));
        end
      if ($unsigned(wire1))
        begin
          reg30 <= wire11;
          if ($unsigned(wire1))
            begin
              reg31 <= wire0;
              reg32 <= (~&((~|($unsigned(reg25) < (-reg13))) ?
                  ((wire4 ? (reg17 ? wire6 : reg24) : $signed(reg18)) ?
                      (((8'ha7) ? reg24 : (8'ha9)) >> {reg30,
                          wire11}) : wire10) : $unsigned($unsigned($unsigned(wire11)))));
              reg33 <= (^{$unsigned(reg27)});
              reg34 <= $unsigned(((((|reg25) == (reg19 ?
                  reg25 : (8'hbc))) ^~ reg29[(2'h2):(1'h1)]) - reg23[(3'h7):(3'h7)]));
              reg35 <= reg17[(3'h7):(2'h2)];
            end
          else
            begin
              reg31 <= $signed($signed($unsigned(((wire5 ~^ wire11) ?
                  (^~reg31) : (~reg20)))));
            end
          reg36 <= $signed((~&{$unsigned(reg31), $signed((~&wire2))}));
        end
      else
        begin
          reg30 <= (~reg24[(2'h3):(2'h3)]);
        end
      reg37 <= reg13[(3'h4):(3'h4)];
      reg38 <= reg15;
    end
  assign wire39 = ((reg14[(3'h7):(3'h7)] | (reg9[(3'h4):(3'h4)] > {((8'h9d) - reg34)})) & (|reg33[(4'h8):(4'h8)]));
endmodule
