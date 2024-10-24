module top
#(parameter param36 = ((!((&((7'h43) >>> (8'hba))) ? ((~^(7'h42)) ? ((8'hac) ? (7'h40) : (8'hb7)) : (-(8'hb1))) : (8'hab))) == (((~^{(8'hb4), (8'hbc)}) * {((8'hab) & (8'hbf))}) ? (!{(~^(8'ha1)), {(7'h42)}}) : (~&{(~^(8'hb9)), (+(8'hbe))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h193):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire28;
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire28,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($signed((wire2[(3'h7):(1'h1)] + (wire2 ?
          wire0 : (8'hb6)))))))
        begin
          reg5 <= wire4[(1'h0):(1'h0)];
          if ($unsigned(wire1))
            begin
              reg6 <= wire1[(3'h4):(1'h1)];
              reg7 <= (wire3[(2'h2):(1'h1)] - (-$unsigned($unsigned(wire2[(1'h0):(1'h0)]))));
              reg8 <= $signed({$signed({(reg7 <= (8'hb0)), {reg5, (8'hbe)}})});
              reg9 <= ($signed({wire3[(2'h2):(2'h2)],
                      ($unsigned(reg7) ~^ $unsigned(wire0))}) ?
                  $unsigned((~|wire3)) : $signed($signed((8'hb8))));
              reg10 <= wire3;
            end
          else
            begin
              reg6 <= (^(8'hb0));
              reg7 <= $unsigned(wire2[(5'h10):(5'h10)]);
            end
          reg11 <= (-((wire3 ?
                  (|(reg8 ? reg9 : reg6)) : $unsigned($unsigned((8'hb6)))) ?
              $signed(reg7[(2'h2):(1'h1)]) : reg9[(1'h0):(1'h0)]));
        end
      else
        begin
          if ($signed($signed(((8'ha3) ^~ $signed($unsigned(wire2))))))
            begin
              reg5 <= $unsigned(((wire1 ?
                  $unsigned($signed(reg10)) : {(-(8'hb0))}) + (reg7 ?
                  (+wire3[(2'h3):(2'h3)]) : (~&reg5))));
              reg6 <= {wire0};
              reg7 <= (wire1[(3'h4):(3'h4)] ? reg6 : wire4);
            end
          else
            begin
              reg5 <= $unsigned($signed($signed((wire1 >>> (reg11 ?
                  wire2 : wire1)))));
            end
          reg8 <= $unsigned(((&(~|(wire0 && reg9))) ?
              (-reg9[(2'h2):(1'h1)]) : reg10));
          reg9 <= $signed($signed(reg6[(3'h6):(2'h3)]));
          reg10 <= ($unsigned((~^reg10)) || reg7);
        end
      if (reg8)
        begin
          reg12 <= $signed((wire2[(3'h6):(2'h3)] ?
              reg5[(1'h1):(1'h0)] : wire3[(3'h5):(3'h4)]));
          reg13 <= reg8;
          reg14 <= {($unsigned($signed((reg11 ^ wire1))) + (reg7[(2'h2):(1'h0)] ?
                  (~(8'h9e)) : ((reg7 ^~ reg7) && wire4)))};
          reg15 <= wire0;
          if (reg11)
            begin
              reg16 <= reg15;
              reg17 <= (($unsigned(reg7[(1'h0):(1'h0)]) ?
                  reg6 : $signed($unsigned((wire0 ?
                      wire3 : wire0)))) & {wire2[(3'h7):(3'h5)],
                  ($unsigned($unsigned(reg6)) & $unsigned((^reg7)))});
              reg18 <= (wire3[(3'h5):(2'h3)] ?
                  $signed(reg5[(1'h1):(1'h1)]) : (((reg10 ?
                              (-(8'haa)) : (reg16 ^ wire4)) ?
                          $signed((wire1 ^~ reg15)) : reg12) ?
                      $signed((reg9 - $signed((8'hae)))) : (7'h42)));
            end
          else
            begin
              reg16 <= ($signed(reg5) ?
                  $signed((((reg9 + wire0) ?
                          ((8'h9e) ? reg5 : (8'hb8)) : reg11[(3'h5):(1'h1)]) ?
                      {(-reg14)} : $signed($unsigned(reg14)))) : $signed(reg17[(4'hc):(1'h0)]));
              reg17 <= reg12;
              reg18 <= $signed(($signed($signed((wire4 ? reg17 : reg9))) ?
                  (|reg9[(1'h0):(1'h0)]) : ((~|(reg15 && reg12)) ^ $unsigned((reg5 ?
                      (8'ha5) : reg5)))));
              reg19 <= wire4[(3'h4):(2'h3)];
              reg20 <= reg14[(2'h3):(2'h2)];
            end
        end
      else
        begin
          reg12 <= $signed($signed($signed(wire3[(3'h4):(1'h1)])));
          reg13 <= reg11[(4'hb):(2'h2)];
        end
      if ($signed({($unsigned(wire3[(3'h4):(3'h4)]) ?
              $signed(wire2) : reg18[(4'ha):(3'h4)]),
          (|(wire4[(3'h7):(3'h4)] <<< $unsigned(reg17)))}))
        begin
          if ($signed((8'ha7)))
            begin
              reg21 <= $signed(reg13[(1'h1):(1'h1)]);
              reg22 <= reg7[(2'h3):(1'h1)];
              reg23 <= $unsigned(({$unsigned((^reg9))} ?
                  (~|(((8'h9c) && (8'h9c)) ^~ $signed(reg14))) : reg9[(2'h2):(1'h1)]));
              reg24 <= reg15[(1'h1):(1'h1)];
            end
          else
            begin
              reg21 <= (((8'hb5) ? {(^reg7)} : (&$unsigned(reg9))) ?
                  {wire0[(1'h0):(1'h0)]} : $unsigned(($signed((~&(8'hb9))) ?
                      $unsigned(reg10) : reg22[(4'he):(2'h3)])));
              reg22 <= ($signed((~^($signed(reg18) ?
                      (reg7 ? reg14 : reg13) : (reg16 ? (8'ha6) : reg17)))) ?
                  {(reg10 ?
                          reg11[(3'h5):(2'h3)] : $unsigned((wire0 ?
                              reg24 : wire3))),
                      (reg8 >> wire0)} : $unsigned(reg21[(3'h7):(3'h7)]));
            end
          reg25 <= (+reg16);
          reg26 <= $unsigned((^(8'hb6)));
          reg27 <= wire4;
        end
      else
        begin
          reg21 <= $unsigned((((wire4[(3'h4):(1'h1)] ?
                      (~reg13) : (reg11 ? (8'hac) : reg23)) ?
                  (!(reg27 << reg15)) : (reg21[(4'hd):(2'h2)] != wire0)) ?
              reg20[(4'hb):(3'h6)] : $signed($signed(reg17))));
          reg22 <= {$signed($signed(wire0)),
              (^(((reg6 != (8'hab)) && (reg13 & wire1)) <<< (!(reg6 ?
                  reg25 : reg27))))};
          reg23 <= ((reg18[(1'h1):(1'h1)] ?
              $signed(reg24[(3'h6):(2'h3)]) : ((~|reg16[(2'h2):(2'h2)]) || (~(reg7 ^~ reg24)))) << ((((reg16 ?
                      reg14 : reg9) ?
                  wire1 : $signed(reg7)) ?
              (!reg27) : reg21) & $signed($signed(reg20[(4'hd):(1'h1)]))));
        end
    end
  assign wire28 = $signed($unsigned(($signed(reg7[(2'h2):(1'h0)]) || reg25)));
  always
    @(posedge clk) begin
      reg29 <= reg6;
      reg30 <= {{reg17[(1'h0):(1'h0)],
              ($unsigned($signed(reg19)) > (reg27[(4'hb):(2'h3)] && $signed(reg6)))},
          {$unsigned($signed($signed(reg25)))}};
    end
  always
    @(posedge clk) begin
      reg31 <= ((~&({$unsigned(wire0), $unsigned(wire2)} ?
          (reg19 == reg20) : (((8'ha1) ?
              (8'ha7) : reg5) < $signed(reg16)))) ~^ reg12[(4'h8):(2'h3)]);
    end
  always
    @(posedge clk) begin
      reg32 <= reg23;
      reg33 <= $unsigned($signed($signed($signed((reg17 ? reg14 : reg9)))));
      reg34 <= $signed(($unsigned((^~(reg5 ?
          (8'hb1) : wire3))) - reg27[(4'h9):(1'h1)]));
      reg35 <= $unsigned((reg24[(3'h7):(1'h1)] == $unsigned($unsigned(reg13[(2'h2):(1'h1)]))));
    end
endmodule
