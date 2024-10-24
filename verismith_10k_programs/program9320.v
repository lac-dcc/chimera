module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h133):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire4,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
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
                 (1'h0)};
  assign wire4 = ((!wire1) << (($signed($unsigned(wire0)) ~^ {$signed(wire0)}) <= {$signed((wire3 < wire0)),
                     wire0[(2'h3):(1'h1)]}));
  always
    @(posedge clk) begin
      reg5 <= {(8'hbc),
          $signed((wire3[(3'h7):(2'h3)] ?
              ($signed(wire2) ?
                  $signed(wire1) : wire2[(2'h3):(1'h0)]) : {$unsigned(wire3)}))};
      reg6 <= ($signed((({wire4, wire0} ?
          (reg5 ? wire3 : (8'hbe)) : (wire2 ?
              (8'hbd) : wire1)) <= ((^wire0) + wire0))) ^ $signed((~reg5[(1'h0):(1'h0)])));
      reg7 <= (wire2 ?
          $signed(reg5[(4'hb):(2'h3)]) : ($signed($unsigned(reg6[(3'h6):(3'h4)])) && $signed($signed(wire3))));
      reg8 <= (+$unsigned(((~^(wire2 >> wire0)) ?
          $signed(wire3[(3'h5):(1'h1)]) : wire2)));
    end
  always
    @(posedge clk) begin
      reg9 <= (reg6 ?
          ((8'hab) ?
              $unsigned(reg7) : wire4[(3'h7):(2'h2)]) : (&(-$unsigned(reg8))));
      if ((8'ha3))
        begin
          reg10 <= (($unsigned(((^~reg7) >> (reg8 <<< (8'hb6)))) ?
                  $signed(($unsigned((8'hbd)) ^ {reg9,
                      wire0})) : $signed(wire2)) ?
              $unsigned((({reg9} ?
                  reg5[(3'h6):(2'h2)] : wire1) <= $unsigned($signed(reg5)))) : ($unsigned($signed(((8'h9d) * reg8))) >> reg9[(3'h4):(1'h0)]));
          reg11 <= $unsigned(($signed({(8'h9e)}) + ((^{wire3}) ?
              reg6[(4'ha):(2'h2)] : wire1[(3'h4):(1'h1)])));
        end
      else
        begin
          if (wire4[(2'h3):(2'h2)])
            begin
              reg10 <= $signed($signed(reg10));
              reg11 <= wire1[(2'h3):(2'h3)];
            end
          else
            begin
              reg10 <= reg7;
            end
          if ($unsigned((^~({(wire4 << wire1)} & $unsigned((wire0 ?
              reg10 : wire4))))))
            begin
              reg12 <= reg11;
              reg13 <= (reg10[(5'h12):(4'h9)] >>> (((~|wire0) ?
                  (reg7[(2'h3):(1'h0)] ?
                      reg11 : (reg5 ?
                          wire3 : reg9)) : reg6) + $signed($unsigned(((8'hb3) <<< reg9)))));
              reg14 <= (~|((~&(+reg12[(2'h2):(1'h1)])) << (&((!reg7) ^ (wire3 >> reg8)))));
              reg15 <= (~|(reg11[(3'h5):(2'h3)] + reg13));
            end
          else
            begin
              reg12 <= ((reg8 || (((reg7 ? wire0 : reg14) ?
                      reg13[(4'h8):(3'h7)] : (reg6 - reg15)) >= $unsigned((reg14 - reg9)))) ?
                  {{$unsigned($unsigned(reg8))}} : reg6);
              reg13 <= $unsigned(reg6[(3'h7):(3'h6)]);
              reg14 <= {(({(reg6 | (8'hb2))} - $unsigned(reg9)) ?
                      (((reg13 ? wire4 : (8'hab)) ?
                          (~^reg5) : (reg7 ^ reg6)) < (&{wire4,
                          wire2})) : $unsigned((reg6[(4'h9):(3'h7)] ?
                          {wire3, reg9} : reg13[(4'h8):(1'h0)])))};
            end
          reg16 <= reg8[(4'hb):(4'h9)];
          if ((^$signed($signed({$unsigned((8'hb5)), (^reg10)}))))
            begin
              reg17 <= $signed({({reg16} ?
                      reg12[(1'h1):(1'h1)] : reg16[(1'h0):(1'h0)]),
                  wire1});
              reg18 <= $unsigned(reg16[(2'h3):(2'h3)]);
            end
          else
            begin
              reg17 <= ((({reg9[(4'hb):(2'h3)], (reg7 << reg10)} ?
                          {$signed(reg7),
                              reg18[(3'h4):(1'h1)]} : $signed((reg8 - reg15))) ?
                      reg8 : ((reg14 != reg16[(1'h0):(1'h0)]) >> $signed(reg11))) ?
                  reg8 : ({(reg12[(1'h0):(1'h0)] ?
                              $signed((8'hb9)) : (+(8'ha6)))} ?
                      ((|reg14) ? reg10 : wire4) : reg18[(4'h8):(3'h7)]));
            end
          if (({{{$unsigned(reg9), (8'hb5)},
                      ((+reg17) ?
                          reg10[(4'h9):(3'h4)] : ((8'haa) ? reg9 : (8'hbf)))},
                  wire4[(3'h5):(3'h5)]} ?
              (~^reg16[(2'h2):(1'h1)]) : (7'h44)))
            begin
              reg19 <= reg13[(4'h9):(4'h9)];
              reg20 <= wire4;
              reg21 <= $unsigned((&$unsigned((+$signed(reg18)))));
            end
          else
            begin
              reg19 <= $signed(reg15);
              reg20 <= ((wire4[(1'h0):(1'h0)] >= $signed({(reg20 ?
                      reg19 : reg14)})) | ({reg11[(4'h9):(3'h4)],
                      $signed(wire3)} ?
                  ((^~$signed(reg16)) < $signed(reg9[(4'hd):(4'hc)])) : $unsigned(reg16[(2'h2):(1'h1)])));
              reg21 <= (!(((~|$signed(reg16)) <<< reg21) ?
                  reg16[(1'h0):(1'h0)] : (reg20[(2'h2):(2'h2)] && (8'h9c))));
              reg22 <= $signed(((^~$unsigned((reg10 ? reg21 : wire3))) ?
                  (reg16 != ($unsigned(reg12) ^ ((8'ha5) ^ reg7))) : (&(+{reg5,
                      reg18}))));
              reg23 <= $unsigned((($signed(((8'hb9) <= (8'had))) & {(^~reg16),
                  $unsigned(reg16)}) >> reg17[(2'h3):(1'h0)]));
            end
        end
      reg24 <= (reg7[(1'h0):(1'h0)] && (-$signed(reg18[(3'h5):(2'h3)])));
      reg25 <= ({reg17, reg6} != $signed(((reg6[(4'hb):(2'h2)] ?
              (!reg8) : (|reg24)) ?
          $unsigned((reg12 && reg5)) : {(reg12 || reg18)})));
      reg26 <= {$signed(($signed({wire3,
              reg11}) || $signed($unsigned((8'hae))))),
          ({(~&wire4), (+(reg19 ? wire0 : reg19))} & reg23[(3'h4):(3'h4)])};
    end
  assign wire27 = (~^($signed((^~(~&reg6))) ?
                      (+$unsigned((reg22 ?
                          reg12 : reg25))) : ($unsigned(reg23) & $unsigned(reg24[(3'h6):(2'h3)]))));
  assign wire28 = $signed($unsigned(($signed(wire27) >>> $unsigned((reg26 ?
                      reg21 : reg25)))));
  always
    @(posedge clk) begin
      if (((~$unsigned(reg23[(4'hc):(4'hc)])) ?
          {reg11, $signed($unsigned(wire3))} : $signed({{(reg23 ?
                      reg20 : (8'hbd)),
                  reg10[(5'h12):(1'h0)]}})))
        begin
          reg29 <= {$unsigned(reg13)};
          reg30 <= $signed($unsigned((reg15 ?
              ((reg15 ? reg17 : wire0) ? reg7 : reg14[(1'h1):(1'h1)]) : {reg16,
                  (wire28 ? wire1 : reg25)})));
          reg31 <= ($signed((|{(wire2 + wire28),
              $signed(reg21)})) ^ reg14[(1'h1):(1'h0)]);
          reg32 <= $signed($unsigned(reg26[(2'h3):(1'h1)]));
          reg33 <= (-({({reg9, (8'hbb)} * (reg31 == reg20)),
              (wire2[(1'h0):(1'h0)] ?
                  reg22[(4'hc):(4'hc)] : (~^reg31))} >> {(^$signed((8'ha9))),
              $unsigned($unsigned(reg12))}));
        end
      else
        begin
          if ($signed(reg17[(3'h4):(1'h0)]))
            begin
              reg29 <= reg30[(2'h3):(2'h3)];
              reg30 <= reg12;
            end
          else
            begin
              reg29 <= ($signed(reg7[(2'h2):(1'h0)]) ?
                  (wire28[(4'h8):(1'h1)] ^ (~(~reg33))) : (reg10[(4'ha):(4'h9)] <= (((-wire1) ?
                          (+reg21) : (reg32 ? wire28 : reg23)) ?
                      reg10 : $signed((reg23 ^ reg16)))));
              reg30 <= reg13;
              reg31 <= (^~{reg14, (reg32 < (-$unsigned(reg16)))});
            end
          reg32 <= (((($signed(wire0) ? (!wire2) : {reg26}) & ($signed(reg8) ?
                      $signed(reg12) : $signed(wire3))) ?
                  $signed((reg21 > (reg13 >> reg14))) : $unsigned($unsigned((reg33 ?
                      wire1 : wire27)))) ?
              ((&$unsigned((reg33 ? reg33 : reg23))) ?
                  reg15[(4'h8):(3'h7)] : (^wire2)) : $unsigned(wire2));
          reg33 <= reg31[(1'h0):(1'h0)];
          reg34 <= reg18;
        end
      reg35 <= $signed((wire2 ?
          $unsigned(reg30) : (reg8[(3'h5):(1'h1)] == (+(reg9 ?
              reg29 : reg34)))));
    end
endmodule
