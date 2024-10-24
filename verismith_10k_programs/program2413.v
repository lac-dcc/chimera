module top
#(parameter param50 = (((8'hab) | ({(&(8'ha6))} ^ ((~&(8'ha8)) == (!(8'hb1))))) + {(({(8'ha4)} | {(8'h9f), (7'h40)}) ? (~^((8'hb6) ? (8'hb3) : (8'h9c))) : ((+(8'hb1)) ? {(8'ha0), (8'ha5)} : (&(8'hb1))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h204):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire21;
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg4 = (1'h0);
  assign y = {wire22,
                 wire21,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (|wire0);
      if (((|wire0[(2'h2):(1'h0)]) ? wire0 : (~wire0)))
        begin
          if ($unsigned(((+(-wire3)) ?
              (({wire0, reg4} ? (wire1 <= wire3) : $signed(reg4)) ?
                  wire1 : $signed((wire3 ? wire3 : (8'ha6)))) : (8'ha1))))
            begin
              reg5 <= (($unsigned(((wire3 >>> wire0) ?
                      wire1[(1'h1):(1'h0)] : {(8'haf)})) ?
                  (reg4[(3'h4):(1'h0)] != reg4[(1'h1):(1'h0)]) : $signed((|(wire0 ?
                      wire1 : wire3)))) >= (~|reg4[(1'h1):(1'h0)]));
              reg6 <= $signed((&wire1[(2'h2):(1'h0)]));
              reg7 <= $signed((~((wire0 ?
                  $signed(reg5) : $unsigned(reg6)) * (+$signed(wire0)))));
              reg8 <= {$unsigned({$signed({reg7}),
                      ((wire2 & wire0) ?
                          (reg6 ? wire1 : wire3) : $unsigned(reg4))})};
            end
          else
            begin
              reg5 <= (~|reg4[(3'h4):(2'h2)]);
              reg6 <= $signed(reg4);
              reg7 <= ({reg5[(3'h6):(1'h0)],
                      (((reg7 ? wire0 : wire3) ?
                              reg8[(1'h1):(1'h0)] : {wire0, reg5}) ?
                          $unsigned($unsigned(reg4)) : ((reg5 >= reg5) + reg4))} ?
                  $unsigned(((7'h42) < $unsigned(reg7[(4'h8):(1'h1)]))) : (~|$signed($unsigned(wire3[(3'h4):(2'h2)]))));
              reg8 <= reg8[(2'h2):(1'h1)];
              reg9 <= $signed((($signed($unsigned((8'ha2))) ?
                      $unsigned($unsigned((8'ha7))) : ((reg5 ?
                              (8'ha7) : wire1) ?
                          (-reg8) : ((8'hbc) ? reg6 : wire3))) ?
                  wire3[(2'h2):(1'h0)] : $signed(((reg7 + reg5) != wire0[(2'h3):(2'h2)]))));
            end
          reg10 <= $signed({($unsigned($signed(reg4)) <= (((8'h9e) ?
                      wire2 : reg5) ?
                  reg6[(4'h9):(1'h1)] : reg9[(4'hb):(3'h7)])),
              reg8});
          reg11 <= $signed($signed($unsigned($signed((8'hb0)))));
        end
      else
        begin
          reg5 <= reg9;
        end
      if ($unsigned($unsigned(reg4)))
        begin
          reg12 <= $unsigned(reg4[(2'h2):(1'h1)]);
          reg13 <= $unsigned(reg12[(3'h4):(1'h0)]);
          reg14 <= ($signed(reg9[(4'hb):(2'h2)]) ?
              ((($unsigned(reg8) & (reg11 ? reg4 : reg13)) ?
                      (reg9 | (reg7 ? wire0 : reg7)) : {(wire3 <<< wire0)}) ?
                  {reg9[(5'h10):(1'h1)]} : $unsigned((&wire3[(1'h0):(1'h0)]))) : reg10[(3'h5):(2'h3)]);
          reg15 <= wire3[(3'h5):(2'h2)];
          if (((reg14[(3'h4):(3'h4)] || reg13[(3'h4):(2'h2)]) ?
              (reg8[(3'h4):(2'h2)] >= reg12) : (^reg12[(3'h4):(3'h4)])))
            begin
              reg16 <= {$signed((~^reg6[(4'h8):(4'h8)])), (-(8'ha4))};
              reg17 <= $signed(($signed((&{wire1,
                  reg10})) || reg8[(2'h2):(1'h1)]));
              reg18 <= reg12[(2'h3):(2'h2)];
              reg19 <= wire3[(2'h3):(2'h3)];
            end
          else
            begin
              reg16 <= (8'haf);
              reg17 <= ($unsigned((~{$unsigned(wire2),
                      (reg19 ? reg15 : (8'h9e))})) ?
                  {$signed(((reg13 ? reg6 : reg15) & (reg7 <= reg7))),
                      {$unsigned($unsigned(reg7))}} : (~&$unsigned($unsigned((reg13 <= reg17)))));
            end
        end
      else
        begin
          if ({$signed(reg5)})
            begin
              reg12 <= $unsigned(((|wire0[(1'h1):(1'h1)]) ?
                  (reg19[(4'h9):(3'h4)] ?
                      ({reg12} | (reg7 ?
                          (8'h9f) : reg18)) : reg11[(3'h5):(3'h5)]) : ((~^wire0[(2'h3):(1'h0)]) ?
                      $unsigned((reg17 << reg13)) : $signed(wire3[(3'h4):(3'h4)]))));
              reg13 <= (wire0[(2'h2):(2'h2)] ?
                  $signed(wire2) : (reg13[(3'h5):(1'h0)] ?
                      (8'hb6) : {wire1[(2'h2):(2'h2)], $unsigned(wire1)}));
            end
          else
            begin
              reg12 <= $unsigned((~&$unsigned(((reg7 || reg14) >>> $signed(wire2)))));
              reg13 <= (~^reg5[(2'h2):(1'h0)]);
              reg14 <= $unsigned(wire0);
              reg15 <= (!((!((reg4 ? reg8 : wire1) ?
                      reg15[(3'h5):(2'h3)] : (reg11 >> reg13))) ?
                  (^$unsigned($unsigned(reg4))) : $unsigned(reg15)));
            end
        end
      reg20 <= (&$signed(($signed((!wire2)) > ((~reg8) ?
          (reg9 ? reg14 : (8'hae)) : (reg5 * (7'h43))))));
    end
  assign wire21 = reg9[(4'ha):(4'h9)];
  assign wire22 = reg9[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      if (reg16[(2'h2):(2'h2)])
        begin
          reg23 <= wire21;
          reg24 <= (-{reg4, $signed($signed(reg4[(2'h3):(1'h1)]))});
          reg25 <= (reg9 != $unsigned((($signed(wire1) && $signed(reg7)) + (wire21[(2'h2):(1'h0)] ?
              reg18 : (~wire3)))));
          reg26 <= reg6;
        end
      else
        begin
          reg23 <= ((+$unsigned($unsigned((reg16 ?
              wire1 : reg24)))) <= $unsigned($signed(((wire0 ? reg15 : reg18) ?
              $unsigned(reg14) : (~|(8'ha5))))));
          if (wire22)
            begin
              reg24 <= (wire1 ?
                  (reg19[(4'hb):(3'h7)] >> reg7) : (((|{reg19}) ?
                          ((8'h9e) ?
                              $signed(reg12) : (8'ha6)) : $unsigned((&reg17))) ?
                      ($signed($signed(reg23)) ?
                          $unsigned($signed(reg4)) : ((~|reg8) ?
                              {reg23} : reg6[(4'h8):(2'h2)])) : ($unsigned(reg23) ?
                          $signed((~|(8'h9c))) : $signed((reg18 ?
                              reg16 : reg13)))));
              reg25 <= ({(({reg6} * $signed(reg14)) ?
                      $unsigned($unsigned(wire0)) : ($signed(wire3) ?
                          $unsigned(reg25) : (+(7'h41)))),
                  (wire22[(1'h0):(1'h0)] ?
                      ((reg5 != reg7) == reg23) : {{reg7,
                              reg4}})} && ($signed((reg12 < $signed(reg4))) < $unsigned($signed(wire21[(2'h3):(2'h3)]))));
              reg26 <= ($signed(((|$signed(reg5)) ?
                  {$signed(wire2)} : (((8'ha6) ^~ reg13) ?
                      (wire1 ? reg19 : reg23) : {wire0, wire22}))) | (^wire2));
            end
          else
            begin
              reg24 <= ((((~^$unsigned(wire0)) & $unsigned((8'ha6))) ?
                  (reg7 >= $unsigned(reg17[(4'hc):(4'ha)])) : reg26) != (~|$signed((~^$signed((8'had))))));
              reg25 <= ($signed(reg13[(3'h7):(3'h7)]) > $unsigned((reg12 ?
                  (|$signed(wire2)) : $signed($signed(wire3)))));
              reg26 <= reg9;
            end
          reg27 <= $unsigned(((((8'ha7) ?
              (wire22 ? reg24 : reg12) : (wire22 ?
                  reg6 : wire22)) != reg17[(2'h2):(1'h1)]) >> reg25[(4'h9):(3'h7)]));
          if (reg13)
            begin
              reg28 <= (~|$signed((~&((^~reg6) >>> {reg11, wire1}))));
              reg29 <= $signed(($unsigned((~&{reg27})) ?
                  (($unsigned(wire0) >>> ((7'h40) <<< wire2)) < $unsigned((reg19 ?
                      reg17 : reg20))) : ((reg18 * $signed(reg19)) ?
                      ($signed(reg25) - (|(8'hbe))) : (~|{(8'h9d)}))));
              reg30 <= reg25;
            end
          else
            begin
              reg28 <= $unsigned(reg12);
              reg29 <= (7'h41);
              reg30 <= $signed($unsigned(((reg7[(4'hc):(3'h6)] ?
                      (-reg24) : wire2[(5'h11):(4'hb)]) ?
                  wire0 : (reg10 - $unsigned(wire22)))));
              reg31 <= (^~reg13);
              reg32 <= (reg9[(3'h4):(3'h4)] ? reg5 : reg7[(4'ha):(3'h7)]);
            end
          reg33 <= reg16[(1'h0):(1'h0)];
        end
      reg34 <= (((reg10 < (^~reg11)) ?
              (+reg4[(2'h3):(1'h0)]) : $unsigned($signed((8'hb9)))) ?
          $signed((reg13[(2'h3):(2'h2)] + $unsigned((~|reg9)))) : {$unsigned((~&reg7))});
      if (((~reg19[(4'he):(4'hc)]) ~^ $signed({(!((8'ha5) * reg17)),
          $unsigned($signed(reg11))})))
        begin
          reg35 <= ((8'h9d) ?
              $unsigned(reg20[(3'h7):(3'h4)]) : {$signed(({reg7} ?
                      $signed(reg32) : (reg5 ^~ reg27))),
                  (^((|reg10) ^ wire21[(3'h4):(1'h1)]))});
          reg36 <= $signed($signed($unsigned((-wire3[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg35 <= $signed(wire0);
          if ($signed($unsigned(reg9)))
            begin
              reg36 <= reg33;
              reg37 <= ($signed((reg24 ? (8'ha1) : reg9)) ?
                  ($signed((8'h9d)) ?
                      ($signed(reg33) ?
                          $signed((reg28 ? reg30 : reg19)) : $unsigned({reg29,
                              reg18})) : (+($unsigned(reg5) <<< reg6))) : {((8'hbb) == $signed((wire21 <= (8'ha4)))),
                      (((reg11 ?
                          reg10 : reg18) * $signed(reg15)) << reg8[(1'h0):(1'h0)])});
            end
          else
            begin
              reg36 <= ($unsigned(reg8) != reg28);
              reg37 <= {({$signed($unsigned(reg27)), reg5} ?
                      $unsigned(reg17) : ($signed($unsigned(reg32)) >>> reg35[(3'h4):(1'h1)]))};
            end
          if (reg6)
            begin
              reg38 <= $unsigned((8'ha0));
              reg39 <= $unsigned(reg36[(4'h8):(3'h7)]);
            end
          else
            begin
              reg38 <= {reg31[(1'h0):(1'h0)]};
              reg39 <= $unsigned($unsigned($signed($unsigned($signed(reg39)))));
              reg40 <= reg5;
            end
        end
      if (($signed(((-reg35[(3'h5):(2'h3)]) ?
          {$signed(reg27),
              reg8[(1'h0):(1'h0)]} : ($signed(reg25) || reg36))) ^~ $signed(reg20[(3'h5):(3'h5)])))
        begin
          reg41 <= reg24;
          reg42 <= reg7;
          reg43 <= (-($signed($signed({reg11})) ^~ (!$signed((reg35 << wire22)))));
          reg44 <= reg32[(4'h8):(1'h0)];
        end
      else
        begin
          if ($signed($unsigned((reg13 == $signed($unsigned(reg32))))))
            begin
              reg41 <= ($signed(($signed({reg20}) ?
                  ((reg12 < reg14) ^~ wire22[(1'h1):(1'h0)]) : (^~{(8'ha3)}))) <<< ($signed((|reg33)) - reg28[(1'h0):(1'h0)]));
              reg42 <= (^~(&$unsigned($unsigned({reg42}))));
              reg43 <= (8'haa);
              reg44 <= {reg6,
                  (($unsigned($unsigned(reg20)) ?
                          wire2[(2'h3):(2'h2)] : reg41[(3'h5):(3'h4)]) ?
                      reg17[(4'he):(4'ha)] : (reg7[(4'hd):(4'hc)] ^ (~^(reg35 ^~ reg27))))};
            end
          else
            begin
              reg41 <= ($unsigned(reg10[(3'h6):(3'h4)]) || ($signed(reg12[(2'h2):(2'h2)]) >>> (reg5[(3'h4):(1'h1)] * $unsigned(reg34))));
            end
          reg45 <= reg7;
          reg46 <= (+{$unsigned($signed(wire1[(1'h1):(1'h0)])),
              (!{$signed(wire2)})});
          reg47 <= $signed(reg10);
          reg48 <= ($unsigned((reg14[(2'h3):(2'h2)] << ($unsigned(reg42) ?
              reg13 : wire2))) | $signed(reg17[(4'hc):(3'h6)]));
        end
      reg49 <= ($signed((!($signed(reg20) ?
          (8'hab) : (reg31 >>> reg20)))) || reg11[(4'h9):(4'h9)]);
    end
endmodule
