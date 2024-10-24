module top
#(parameter param46 = ({{(~|((8'h9e) ? (7'h42) : (8'haa)))}, ((-(!(7'h40))) ? (((8'hba) ? (8'hb8) : (7'h40)) | ((8'h9d) || (8'haa))) : (8'hac))} ? (((((8'hba) ? (8'hb1) : (8'ha6)) << ((8'hb5) > (8'hb4))) ? (^((8'hbe) >>> (8'hbb))) : (((8'ha5) >= (8'hb8)) ? ((8'hb5) - (7'h44)) : ((8'ha3) <<< (8'hbc)))) + (~(((7'h44) ? (8'hab) : (8'hbe)) + ((8'ha7) ? (8'h9d) : (8'hb1))))) : (!(({(8'h9d), (8'hb4)} ? (8'hae) : (~&(8'hbf))) || {((7'h41) ? (8'h9d) : (8'hb3)), (8'hac)}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h20d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire41;
  wire [(4'hf):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  reg [(5'h13):(1'h0)] reg4 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire11,
                 wire10,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
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
                 reg12,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed($signed((($unsigned(wire2) && $unsigned(wire2)) ?
          (wire2[(4'h8):(2'h3)] ? wire3 : $signed(wire3)) : wire3))))
        begin
          reg4 <= (wire2[(1'h0):(1'h0)] * (8'hae));
          reg5 <= $signed((~^{wire1[(4'ha):(2'h2)]}));
          reg6 <= ({wire2} >= $signed($signed($signed((reg5 ?
              wire3 : (8'hb4))))));
        end
      else
        begin
          reg4 <= wire2;
          if ((~|$signed((wire1[(3'h7):(2'h3)] + reg5[(4'ha):(3'h7)]))))
            begin
              reg5 <= (wire0[(3'h5):(1'h0)] ?
                  ((&(!$unsigned(reg6))) ?
                      (wire1[(2'h2):(1'h1)] & $unsigned($signed(wire0))) : {{$signed(wire3),
                              wire0[(1'h0):(1'h0)]}}) : reg4);
              reg6 <= (|wire3[(3'h5):(2'h2)]);
              reg7 <= $signed($signed($unsigned(($unsigned(reg6) ?
                  reg6 : reg6[(4'he):(4'hd)]))));
            end
          else
            begin
              reg5 <= wire0[(3'h7):(3'h6)];
            end
          reg8 <= {$unsigned(((wire3 & $signed(reg4)) * (~((8'hb7) ?
                  wire1 : (7'h41))))),
              wire2};
          reg9 <= (($unsigned((^~reg8[(4'h9):(3'h6)])) ?
                  ($signed((wire3 <= reg5)) != ((reg5 ? reg6 : reg5) ?
                      (wire3 ?
                          wire2 : (8'hb0)) : (wire3 && reg6))) : (~&(reg8[(3'h6):(1'h0)] ?
                      wire1[(1'h0):(1'h0)] : $unsigned((8'hb7))))) ?
              (wire1 ?
                  $signed((wire2 > $unsigned((7'h40)))) : ((reg6[(4'hc):(4'ha)] < reg7[(2'h3):(1'h1)]) ^~ $signed((wire0 - reg6)))) : {{reg5}});
        end
    end
  assign wire10 = (8'hb4);
  assign wire11 = reg6[(5'h11):(3'h4)];
  always
    @(posedge clk) begin
      reg12 <= (&$unsigned({wire2}));
      reg13 <= (wire1 != wire3[(4'hc):(4'h9)]);
    end
  always
    @(posedge clk) begin
      if (reg8[(4'h9):(2'h3)])
        begin
          reg14 <= reg9[(2'h3):(1'h0)];
          reg15 <= (^reg4[(4'he):(4'hc)]);
          reg16 <= ({$signed($signed({wire11})),
                  $signed($signed($unsigned(reg4)))} ?
              wire10[(4'h9):(1'h0)] : ((~((reg9 ? wire2 : reg5) >= reg8)) ?
                  (reg13[(4'h9):(3'h6)] ~^ $unsigned(reg12[(1'h0):(1'h0)])) : wire11));
          reg17 <= $unsigned($unsigned({{reg7[(2'h3):(1'h0)]}}));
        end
      else
        begin
          reg14 <= $unsigned(reg9[(2'h3):(1'h1)]);
          reg15 <= (^wire0[(3'h5):(2'h2)]);
          if (({{($signed(reg14) * wire11[(4'h9):(3'h7)]),
                      ($unsigned(wire11) < (reg6 ^ reg16))}} ?
              $signed({$signed((wire0 == wire2))}) : $signed($unsigned((wire11 > reg9[(2'h2):(2'h2)])))))
            begin
              reg16 <= (wire3[(2'h3):(1'h1)] >> $unsigned(reg4[(2'h3):(2'h3)]));
              reg17 <= (wire11[(4'hf):(3'h6)] ?
                  (wire3 ?
                      wire11[(2'h3):(2'h2)] : $unsigned($signed({reg7}))) : ({({reg17} - (~reg15))} && reg13));
            end
          else
            begin
              reg16 <= wire11;
              reg17 <= $unsigned(((reg14 == {(wire0 ? reg16 : reg6)}) ?
                  $unsigned(reg6[(1'h0):(1'h0)]) : (((wire3 ?
                          reg9 : (8'h9c)) <= reg6) ?
                      $unsigned((|reg12)) : $signed((7'h43)))));
            end
          reg18 <= $unsigned($signed($unsigned({(|wire11)})));
        end
      reg19 <= $signed(reg6);
      if ($unsigned($unsigned((wire10 >>> {reg9, wire1}))))
        begin
          if (reg4)
            begin
              reg20 <= reg17;
              reg21 <= (~|$unsigned((reg9 ?
                  (~^((8'hbe) ? wire2 : reg4)) : (wire0[(3'h6):(3'h4)] ?
                      (&reg19) : $unsigned((8'hbd))))));
              reg22 <= (~&(reg7 ^~ wire11));
              reg23 <= ((!$signed(reg6)) ?
                  {(((~&reg13) << (+reg20)) * (~|{wire2, reg14})),
                      reg21} : (~|reg15));
              reg24 <= (reg6 | ((+{$unsigned(reg14), reg6}) && reg17));
            end
          else
            begin
              reg20 <= $signed($unsigned(reg17[(4'h8):(4'h8)]));
              reg21 <= {(&$signed((reg17[(3'h7):(1'h1)] ? wire2 : reg21))),
                  reg4};
            end
          reg25 <= $signed((($unsigned((reg24 >= reg13)) ?
              {(-reg20)} : $unsigned(reg19)) && $unsigned(((+wire2) ?
              (reg14 ? reg6 : wire11) : reg16[(1'h0):(1'h0)]))));
          if ($unsigned({($unsigned((~&(8'hb4))) ^ ((wire2 ?
                      (8'ha0) : (8'h9e)) ?
                  (~&wire0) : (-reg13))),
              $signed(((reg24 ? reg5 : reg7) >> (reg19 ? wire3 : reg6)))}))
            begin
              reg26 <= reg21;
            end
          else
            begin
              reg26 <= (7'h41);
            end
          reg27 <= wire11;
        end
      else
        begin
          reg20 <= ({reg20, (wire2 - (~^(reg4 || reg21)))} ?
              (({(~&(8'haa)), {reg27}} != reg23[(3'h4):(2'h2)]) ?
                  $unsigned(wire3[(4'h9):(3'h5)]) : ($signed($signed(reg5)) >> ((reg22 || reg15) > wire3))) : reg9[(3'h4):(1'h0)]);
          reg21 <= $unsigned(reg14);
          if ((8'h9f))
            begin
              reg22 <= reg18;
              reg23 <= (reg7 ~^ $unsigned((!reg8)));
              reg24 <= reg20[(4'ha):(3'h5)];
              reg25 <= ({$signed($signed($signed(reg4))),
                  (8'hae)} != $signed((reg12 ? (&{reg17, wire10}) : reg9)));
              reg26 <= $unsigned(($signed($signed({reg5,
                  (8'ha0)})) ^~ $unsigned($signed($unsigned(reg20)))));
            end
          else
            begin
              reg22 <= $signed(((reg4[(4'h9):(2'h2)] ?
                      {{reg20, wire0}, wire1} : reg12) ?
                  $signed(((wire2 ? reg8 : reg12) >>> (reg20 ?
                      reg15 : reg4))) : ((reg4[(5'h10):(1'h0)] ?
                      (reg21 ~^ wire11) : $signed(wire0)) ^~ reg26[(2'h3):(1'h1)])));
            end
        end
      reg28 <= (($unsigned($signed(reg14[(4'hb):(4'h8)])) << $unsigned(reg6[(4'ha):(3'h7)])) ?
          (wire0[(4'h8):(1'h1)] ?
              (($signed(reg8) ?
                  wire2 : $signed((8'h9c))) | reg13) : (reg25[(3'h6):(3'h5)] & reg26)) : reg15[(2'h2):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg29 <= $signed((8'hae));
      reg30 <= ((8'ha7) ?
          (8'h9d) : $unsigned(((+(8'hae)) ?
              (&reg13[(4'h9):(2'h3)]) : reg25[(4'hc):(4'hc)])));
      if ((reg8[(3'h6):(2'h3)] ? $signed(wire2) : wire3))
        begin
          reg31 <= reg16;
          reg32 <= $signed((|$unsigned(((reg22 < reg23) ?
              reg13[(1'h1):(1'h1)] : (reg13 && (8'hb0))))));
          reg33 <= ((8'h9f) == $signed(reg12[(1'h0):(1'h0)]));
        end
      else
        begin
          reg31 <= ((+(reg18 ?
              ($signed(reg12) ~^ reg6[(2'h3):(2'h2)]) : ($unsigned(reg5) ?
                  (8'hba) : (+reg27)))) == ((~wire0[(1'h0):(1'h0)]) <= reg19));
          reg32 <= {$signed((-(reg27[(2'h2):(1'h0)] ?
                  (8'haf) : $unsigned(reg12))))};
          if (reg28[(4'hd):(4'hb)])
            begin
              reg33 <= $signed(((^~reg25[(3'h4):(2'h2)]) ?
                  reg19[(3'h6):(3'h4)] : (~&(+$unsigned(reg23)))));
              reg34 <= ($signed(($unsigned(reg12) != $unsigned(wire0))) ?
                  reg5 : reg20);
              reg35 <= (($signed($signed($unsigned(wire0))) && {(reg20 ^~ reg8[(3'h7):(2'h2)]),
                      (reg6[(3'h5):(2'h2)] << (reg5 ? reg12 : reg8))}) ?
                  {(^~(~reg22)), $unsigned((8'hb0))} : reg24);
              reg36 <= (reg30[(5'h12):(4'h9)] | (((!(reg6 & reg16)) ^ (|(reg7 ^~ reg17))) ?
                  (((wire3 | reg29) ^ reg21[(4'hb):(3'h7)]) ?
                      wire0[(3'h7):(3'h4)] : (8'hb0)) : reg8));
            end
          else
            begin
              reg33 <= $signed({$unsigned(($unsigned(reg28) >> (wire11 ?
                      reg17 : reg27)))});
              reg34 <= ($unsigned({(^~wire2)}) ?
                  ((reg20[(2'h2):(1'h0)] ?
                          (reg9 ?
                              wire0[(2'h2):(1'h0)] : $signed(reg7)) : ((~|reg18) ?
                              (|(8'ha1)) : ((8'h9f) ? reg13 : reg20))) ?
                      ($signed((reg12 > reg8)) << reg14) : (+(wire2 == (reg33 ?
                          reg22 : (8'hb8))))) : reg23);
              reg35 <= (reg17[(5'h12):(5'h10)] ^ (~&$signed(reg23)));
              reg36 <= $signed(reg13[(1'h1):(1'h1)]);
            end
        end
      reg37 <= reg9;
      reg38 <= (8'hab);
    end
  assign wire39 = (~^(({reg32, reg27} ?
                          $unsigned((~^wire2)) : $unsigned(reg35[(2'h2):(2'h2)])) ?
                      reg35 : reg23[(2'h3):(2'h2)]));
  assign wire40 = ((reg26 ?
                      (($unsigned(reg20) < reg17[(4'he):(1'h0)]) ^ (8'h9d)) : {(reg28 ?
                              $unsigned((8'hb4)) : (wire10 ?
                                  reg35 : reg36))}) > {reg8[(1'h0):(1'h0)]});
  assign wire41 = (reg16[(4'he):(1'h0)] ?
                      ($unsigned(({reg15} ? $signed(reg31) : {reg7})) ?
                          (~reg25) : ({(-reg5),
                              (reg23 == wire0)} != reg36[(2'h3):(1'h1)])) : wire11);
  always
    @(posedge clk) begin
      reg42 <= wire11[(4'h9):(3'h4)];
      reg43 <= $signed(reg28[(4'ha):(3'h6)]);
      reg44 <= $signed((^((+(reg6 ? wire10 : (8'ha4))) ?
          (^~(reg26 ? reg33 : reg35)) : reg15[(4'h9):(1'h1)])));
      reg45 <= reg38;
    end
endmodule
