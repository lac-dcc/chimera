module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire61;
  wire [(5'h10):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  assign y = {wire61, wire60, wire58, wire6, wire5, (1'h0)};
  assign wire5 = ((8'hb6) ? (wire2 && wire2[(2'h2):(2'h2)]) : wire3);
  assign wire6 = wire2[(3'h4):(1'h0)];
  module7 #() modinst59 (wire58, clk, wire3, wire6, wire0, wire4);
  assign wire60 = wire1;
  assign wire61 = wire1;
endmodule

module module7
#(parameter param56 = (+(&(~^((+(8'hb8)) ? (^(8'hb3)) : ((7'h41) ? (7'h41) : (7'h43)))))), 
parameter param57 = (&{param56, ((param56 < (param56 << param56)) ? (~|param56) : (&(param56 ~^ param56)))}))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h245):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire11;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire [(3'h4):(1'h0)] wire9;
  input wire signed [(4'hc):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire30;
  wire signed [(5'h13):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire25;
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= $signed((!$signed(wire11[(4'hd):(1'h1)])));
      if ({wire10[(1'h0):(1'h0)],
          (~&($unsigned($signed(wire9)) ?
              $signed(((7'h41) | wire11)) : (|(^(8'ha1)))))})
        begin
          reg13 <= reg12;
          if ($unsigned(($unsigned((~^(reg12 == (7'h43)))) ?
              $signed(({wire10, wire11} | (wire9 ?
                  (8'h9f) : wire10))) : wire9[(2'h3):(1'h0)])))
            begin
              reg14 <= ($signed($signed(((wire11 ?
                      wire8 : reg12) < (~&wire11)))) ?
                  ((~&{$unsigned(wire9)}) * ($unsigned(((8'ha9) ^ reg12)) && wire9)) : (reg13 ?
                      reg12 : (($signed(wire10) ?
                          wire11[(4'hb):(3'h5)] : (wire11 ^~ reg12)) >> reg13[(3'h7):(1'h1)])));
              reg15 <= wire11[(3'h4):(2'h2)];
              reg16 <= (reg14 ?
                  $signed(($unsigned(reg14) >> $unsigned(reg14))) : {$unsigned(((wire10 | reg13) ?
                          ((8'hb3) == reg15) : reg14[(1'h0):(1'h0)])),
                      (reg15 <<< $unsigned($signed(wire9)))});
              reg17 <= reg14[(3'h6):(3'h4)];
              reg18 <= ((!$unsigned(reg15)) > $signed({wire8[(3'h4):(2'h2)],
                  {$unsigned(reg17)}}));
            end
          else
            begin
              reg14 <= (({$unsigned($unsigned(reg15)),
                          $signed(reg12[(3'h6):(2'h2)])} ?
                      (wire8 ^ (~&(reg13 ?
                          reg18 : reg15))) : ((+reg17[(3'h7):(1'h0)]) ?
                          $signed(((8'ha7) >>> wire10)) : reg15[(2'h2):(1'h0)])) ?
                  $signed($signed($unsigned(wire9))) : (reg13 ?
                      reg17[(1'h1):(1'h1)] : (~(~&(wire11 ? wire11 : reg18)))));
              reg15 <= ($signed((~|$signed($unsigned((8'hb2))))) ?
                  (reg13 > (reg13[(3'h4):(3'h4)] ?
                      wire10[(4'he):(3'h6)] : (((8'h9e) != (8'hbd)) + $signed(wire9)))) : $unsigned($signed({(reg12 < reg17),
                      wire8[(1'h0):(1'h0)]})));
              reg16 <= reg15[(1'h1):(1'h0)];
            end
        end
      else
        begin
          reg13 <= $unsigned($unsigned(($signed(reg17[(3'h5):(1'h1)]) ?
              wire11 : $signed((^wire11)))));
          if (reg12)
            begin
              reg14 <= $unsigned($unsigned($unsigned((-$signed(wire10)))));
              reg15 <= $signed(wire11);
            end
          else
            begin
              reg14 <= (~|(({(reg15 ? wire11 : wire8)} ?
                  (~|{reg16, wire8}) : $signed(wire10)) + (-reg17)));
              reg15 <= (wire11[(4'hc):(4'h9)] ?
                  (^(((wire11 && wire8) ^~ reg14) | wire8)) : $signed($signed((+$signed((8'ha8))))));
            end
          reg16 <= $unsigned(reg17);
          if ($signed(reg15))
            begin
              reg17 <= {(8'ha3)};
              reg18 <= ((wire8[(1'h1):(1'h0)] | (^~({reg15, reg14} ?
                      ((8'ha1) ? reg14 : reg15) : (wire9 >> reg12)))) ?
                  reg17 : reg13[(4'ha):(3'h5)]);
              reg19 <= $unsigned(reg18);
              reg20 <= ({$unsigned(reg15[(1'h0):(1'h0)])} > $signed($signed(reg15[(1'h0):(1'h0)])));
              reg21 <= ($unsigned($signed({(!(8'hba))})) <<< {((-reg17[(3'h7):(2'h2)]) ?
                      $unsigned(reg18) : wire10[(3'h5):(2'h2)]),
                  wire10});
            end
          else
            begin
              reg17 <= reg13[(2'h3):(2'h2)];
              reg18 <= (+wire8);
              reg19 <= ((|($unsigned((reg13 ?
                      reg19 : reg14)) || reg18[(5'h10):(3'h4)])) ?
                  (|(wire10[(2'h2):(1'h1)] ?
                      (wire9 ^~ ((8'hba) ?
                          wire11 : wire10)) : reg12)) : (^~(8'ha1)));
            end
          reg22 <= {$unsigned(reg18[(1'h0):(1'h0)])};
        end
      if ($signed((-$signed($signed((reg19 ? (8'hb7) : reg12))))))
        begin
          reg23 <= (~|$signed(wire11[(4'ha):(3'h7)]));
          reg24 <= ((&$unsigned((-reg16[(4'h9):(1'h1)]))) ^ $signed((reg19 != reg13)));
        end
      else
        begin
          reg23 <= {($unsigned($unsigned(((8'haf) ?
                  reg16 : reg18))) < wire9[(2'h2):(2'h2)])};
          reg24 <= {{($signed(reg21) ?
                      (^{wire11}) : ((~^(8'hb9)) ^ reg12[(1'h0):(1'h0)])),
                  reg16[(1'h1):(1'h0)]},
              ((reg24[(3'h5):(3'h4)] ?
                  wire10[(3'h6):(1'h1)] : wire9[(3'h4):(3'h4)]) - ($signed(reg16[(4'h8):(3'h6)]) ^ reg18[(5'h14):(2'h2)]))};
        end
    end
  assign wire25 = (wire9[(1'h1):(1'h1)] ?
                      reg16[(3'h6):(1'h1)] : $unsigned(((~reg16[(4'h8):(3'h5)]) >= $unsigned((wire9 ?
                          reg20 : wire10)))));
  assign wire26 = $unsigned(({$signed((reg22 && (8'hb0)))} - reg12));
  assign wire27 = (reg15 ?
                      $signed(((8'haa) ?
                          (reg18[(3'h7):(3'h7)] >>> (8'h9d)) : reg23)) : $unsigned(reg12[(3'h4):(1'h1)]));
  assign wire28 = ((~^(8'ha3)) >>> (8'ha2));
  assign wire29 = (reg17 ^~ reg22[(5'h10):(3'h7)]);
  assign wire30 = (^~((reg22[(4'h9):(4'h8)] ?
                      reg17[(3'h4):(1'h0)] : {(8'ha9),
                          (reg21 < reg21)}) >>> ($signed((8'haa)) ^~ (reg14[(3'h5):(3'h4)] ?
                      $signed(wire10) : wire11))));
  assign wire31 = wire11[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg32 <= $unsigned(wire27[(1'h1):(1'h1)]);
      if (wire30[(1'h0):(1'h0)])
        begin
          if ($unsigned($unsigned({wire9[(3'h4):(1'h0)]})))
            begin
              reg33 <= $signed({(((wire31 ?
                      wire27 : reg17) == wire26[(4'ha):(4'ha)]) << $signed((-reg15)))});
              reg34 <= $unsigned($unsigned(($signed(wire25[(4'hb):(3'h6)]) ?
                  (&$signed(wire29)) : wire29)));
            end
          else
            begin
              reg33 <= reg17;
              reg34 <= $signed(((wire11 ?
                      reg32[(1'h0):(1'h0)] : $unsigned((wire29 & wire11))) ?
                  (~&(!((8'hb4) ? reg20 : (8'ha1)))) : ({{reg16}} ?
                      ({(8'hb5)} ? (8'hb4) : (7'h40)) : (((8'ha4) >= reg21) ?
                          (wire29 ? wire31 : wire8) : (reg24 ?
                              wire8 : wire10)))));
              reg35 <= $signed(((+($unsigned(reg33) & (wire26 ?
                  wire30 : wire25))) && reg22));
              reg36 <= (8'ha5);
              reg37 <= reg35[(1'h0):(1'h0)];
            end
          reg38 <= $unsigned((7'h44));
          if (reg34)
            begin
              reg39 <= $signed(reg38[(4'hb):(2'h2)]);
            end
          else
            begin
              reg39 <= wire29[(1'h0):(1'h0)];
            end
          reg40 <= (&(^(($unsigned(reg14) <<< $unsigned((8'ha8))) ?
              $unsigned(reg35) : reg23[(4'hf):(3'h4)])));
          reg41 <= ((wire29 ^ reg18[(2'h2):(2'h2)]) ?
              reg12[(1'h1):(1'h1)] : reg19);
        end
      else
        begin
          reg33 <= $unsigned({wire27});
          reg34 <= reg41;
          reg35 <= (^((((^~wire8) << $signed(wire10)) ?
              ((reg15 ? (7'h40) : reg38) ?
                  reg24 : (~^wire10)) : $unsigned((!(7'h43)))) != $signed((~^$signed((8'hae))))));
        end
      reg42 <= ($unsigned((~|wire30[(2'h2):(1'h1)])) ?
          reg17 : reg18[(4'h8):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg43 <= (~^(reg21[(5'h11):(3'h5)] << {(reg12[(3'h4):(1'h0)] ?
              $signed(reg17) : reg33[(5'h12):(4'h8)]),
          (|wire29)}));
      reg44 <= reg16;
      reg45 <= (~&((reg40 ?
              reg23[(2'h2):(1'h1)] : (reg43[(1'h1):(1'h1)] ?
                  (&wire8) : reg42[(3'h7):(2'h3)])) ?
          ((~(8'hb5)) < {(reg14 ? wire26 : wire10)}) : wire31));
    end
  always
    @(posedge clk) begin
      if (reg13)
        begin
          reg46 <= ($unsigned($unsigned((wire29 ?
              (8'hba) : reg45))) >>> $unsigned((&(!$signed(reg37)))));
        end
      else
        begin
          reg46 <= ($signed($signed((7'h40))) ?
              (wire9 ?
                  $unsigned(wire11[(4'hd):(1'h0)]) : $unsigned($signed(reg13))) : reg35[(1'h1):(1'h1)]);
          if ($signed(wire11))
            begin
              reg47 <= (~reg40);
              reg48 <= (~|(~|reg44[(3'h4):(1'h1)]));
              reg49 <= reg15;
              reg50 <= (8'hb7);
              reg51 <= reg45;
            end
          else
            begin
              reg47 <= (((!reg42[(4'hb):(3'h5)]) ?
                  ((^$signed(reg51)) ?
                      $unsigned((reg32 ?
                          (7'h40) : reg46)) : reg44[(3'h5):(3'h5)]) : {reg49[(1'h1):(1'h0)]}) ^ {(reg34[(2'h3):(2'h2)] ?
                      ($unsigned(reg44) & reg37[(3'h4):(3'h4)]) : $unsigned(wire27)),
                  $signed(reg24)});
            end
        end
      reg52 <= ((-$unsigned(reg47)) ^ ((reg42[(3'h5):(2'h3)] ?
          reg23 : wire25[(4'hc):(4'hc)]) == {((|(8'hae)) ^~ $signed((8'hbf))),
          reg51}));
      reg53 <= (wire8[(2'h2):(2'h2)] ?
          ((7'h42) * ($signed((reg34 ?
              reg24 : wire29)) != (!reg34[(3'h4):(2'h2)]))) : (-(8'hab)));
    end
  assign wire54 = wire29[(3'h5):(2'h2)];
  assign wire55 = reg14;
endmodule
