module top
#(parameter param88 = (+{(^(((7'h42) ? (8'ha7) : (8'hbf)) <= (&(8'hb6)))), {(^((8'hb1) != (8'hb8))), {((8'ha2) << (8'ha8)), {(8'hb4)}}}}), 
parameter param89 = (param88 ? param88 : ({(&(param88 < param88))} ? (+(^~param88)) : (param88 <= ((~^param88) ? {param88} : {param88, param88})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire87;
  wire signed [(4'h9):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire61;
  wire [(3'h6):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire78;
  reg signed [(3'h4):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire61,
                 wire25,
                 wire24,
                 wire7,
                 wire6,
                 wire5,
                 wire78,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 (1'h0)};
  assign wire5 = {$unsigned({(wire0[(1'h0):(1'h0)] >>> $signed(wire3))}),
                     wire1};
  assign wire6 = (wire3 != wire3);
  assign wire7 = $signed(wire0[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg8 <= $unsigned(({$signed($signed((8'h9d))),
          wire3[(3'h4):(2'h3)]} >>> wire3[(5'h10):(4'h9)]));
      reg9 <= reg8;
      reg10 <= ($unsigned($unsigned(($unsigned((8'hbd)) << $signed(wire0)))) ?
          wire0[(1'h0):(1'h0)] : wire4[(3'h7):(3'h6)]);
      if ((7'h40))
        begin
          reg11 <= $unsigned(wire7);
        end
      else
        begin
          reg11 <= ((((wire0 <<< ((7'h42) ? wire0 : wire5)) <= (^{wire2})) ?
                  (+$unsigned((~|wire7))) : wire5[(1'h0):(1'h0)]) ?
              (wire1[(4'hb):(1'h0)] ?
                  reg8 : wire5[(1'h1):(1'h0)]) : $signed((7'h41)));
          reg12 <= (wire0[(1'h1):(1'h1)] - ($unsigned((^(reg10 ?
              reg9 : wire4))) ~^ {{{reg9, wire7}}}));
          if (($signed({wire2}) >> wire2[(5'h13):(2'h2)]))
            begin
              reg13 <= ($signed(reg12[(4'hd):(4'ha)]) ?
                  reg9[(3'h7):(1'h0)] : {(reg11 ?
                          ((reg11 || wire6) != $unsigned(reg8)) : $unsigned($unsigned(wire6))),
                      ($signed((wire2 ? wire7 : reg9)) ?
                          reg9 : ((reg8 | wire6) ?
                              (wire1 ? wire6 : reg12) : wire7))});
              reg14 <= $signed($signed(wire0[(3'h4):(1'h1)]));
              reg15 <= ((&(reg8 + {$signed(wire0),
                      (reg10 ? reg13 : (8'ha0))})) ?
                  (~^(($signed(reg14) ?
                      {wire7, reg9} : $unsigned(wire2)) >= {$unsigned((8'hb8)),
                      $signed(wire5)})) : $signed($signed(($signed(reg13) < reg14[(2'h3):(2'h3)]))));
            end
          else
            begin
              reg13 <= $signed((!(^~$signed(reg10))));
            end
        end
      if (($signed((-((wire6 ? reg12 : (8'hab)) ?
              $unsigned(reg12) : {reg11}))) ?
          reg12 : $unsigned($signed(({wire2} >> {reg8, wire5})))))
        begin
          if ((-(wire1[(3'h6):(3'h6)] ?
              {((&(8'hb3)) ? (wire6 ? wire7 : wire6) : (wire0 ? wire7 : reg14)),
                  (~&reg15[(2'h2):(1'h1)])} : (((~&wire2) | $unsigned(reg11)) + (wire6[(1'h1):(1'h1)] ?
                  (~wire0) : $signed(reg15))))))
            begin
              reg16 <= ((-wire3) ?
                  wire2 : (({wire4[(3'h4):(2'h3)]} ?
                      (reg12[(4'hf):(3'h5)] && reg9) : wire0[(2'h3):(2'h2)]) & (-$signed({reg11,
                      wire1}))));
              reg17 <= $signed(wire1);
              reg18 <= ((^((reg14[(2'h3):(2'h2)] > wire3) ?
                  wire3 : ($unsigned(reg10) && reg11[(4'ha):(3'h4)]))) || reg9[(3'h5):(3'h4)]);
            end
          else
            begin
              reg16 <= $signed(((~((wire4 || reg12) ?
                      (^~reg18) : $signed(reg14))) ?
                  wire0[(1'h0):(1'h0)] : $unsigned((reg16[(3'h6):(3'h6)] ?
                      (wire1 ? (8'hb2) : (8'ha2)) : (+reg10)))));
              reg17 <= reg14[(1'h0):(1'h0)];
            end
          if (($signed(reg18[(2'h3):(2'h2)]) * wire4[(1'h1):(1'h0)]))
            begin
              reg19 <= reg10[(3'h6):(1'h0)];
            end
          else
            begin
              reg19 <= reg13;
              reg20 <= wire2;
              reg21 <= ((+$unsigned({$signed(wire1)})) ?
                  $signed(($signed(reg19[(4'hd):(3'h6)]) ?
                      $signed({reg18}) : $unsigned(wire0[(1'h0):(1'h0)]))) : (^{wire0[(1'h1):(1'h0)]}));
              reg22 <= (reg14 >> {reg19[(5'h14):(5'h13)],
                  $unsigned(((reg15 ? wire3 : wire7) ?
                      reg20 : $unsigned(wire6)))});
              reg23 <= ($signed(((~&reg10[(4'he):(4'hd)]) >= ((^~reg21) * (reg17 ?
                  wire1 : (8'hb1))))) <<< wire1[(2'h2):(1'h1)]);
            end
        end
      else
        begin
          if (($unsigned(reg16) <= reg11))
            begin
              reg16 <= reg18;
              reg17 <= ($unsigned(reg23[(4'ha):(4'h9)]) ?
                  ((~&(+$signed(wire5))) + $unsigned((-$signed(reg12)))) : (((reg23 == $unsigned(reg22)) << ({wire7,
                          wire4} ?
                      $signed(reg8) : (reg16 << (8'hab)))) != (reg21 == wire4[(3'h7):(2'h3)])));
              reg18 <= (^$signed($unsigned($signed({wire4, wire5}))));
            end
          else
            begin
              reg16 <= ((~^wire7[(4'ha):(3'h7)]) * $signed(($unsigned((^reg18)) >>> (!$signed(reg14)))));
              reg17 <= ($signed(($signed(reg12) ?
                      ($unsigned(reg17) ? $signed(reg13) : {reg21}) : wire6)) ?
                  {(|$unsigned($signed(reg19)))} : (+($signed((wire0 ?
                          reg22 : wire2)) ?
                      reg22[(3'h5):(3'h5)] : $unsigned(reg22[(3'h6):(1'h0)]))));
            end
          reg19 <= wire3;
          reg20 <= $signed((reg8 ^~ $unsigned($signed((~wire7)))));
        end
    end
  assign wire24 = (wire2[(4'hf):(2'h2)] * ({$unsigned($unsigned(reg9))} ?
                      $signed((-wire4[(4'he):(4'hb)])) : reg21[(1'h1):(1'h0)]));
  assign wire25 = $signed({wire7,
                      ((reg10 + ((7'h40) ? wire24 : reg13)) > wire3)});
  module26 #() modinst62 (wire61, clk, reg19, reg20, reg9, wire3, reg21);
  module63 #() modinst79 (.wire65(wire3), .y(wire78), .clk(clk), .wire67(reg9), .wire66(wire7), .wire64(wire61));
  always
    @(posedge clk) begin
      if (((|$signed((-(reg16 | reg16)))) ~^ reg16[(4'he):(3'h6)]))
        begin
          reg80 <= (~^reg13);
        end
      else
        begin
          reg80 <= {wire24,
              (^~$unsigned(({reg22, reg18} > (reg8 ? reg22 : wire4))))};
          reg81 <= (~&reg22[(5'h12):(4'h9)]);
          reg82 <= ($signed($signed($signed(wire78))) < ($unsigned((^~(~|wire2))) >>> ((|{wire1}) ?
              ($signed(reg16) ?
                  (~&reg11) : $unsigned(reg19)) : (reg80 >= $signed(reg15)))));
          reg83 <= (reg14 == wire7);
          reg84 <= ((wire25 ?
                  ($unsigned($signed(wire5)) ?
                      reg13[(2'h2):(1'h1)] : ($signed((8'h9e)) ?
                          (reg8 && reg19) : ((8'hb5) ^~ wire7))) : (^((|reg23) ?
                      $signed(reg23) : (reg17 >> reg9)))) ?
              $unsigned($signed(reg8)) : ($unsigned(((^reg20) ?
                      reg13 : (&reg16))) ?
                  (&wire1) : wire2[(3'h5):(3'h4)]));
        end
    end
  assign wire85 = $signed($unsigned((((^wire4) ? (8'ha9) : (reg81 ^~ wire4)) ?
                      reg23[(2'h2):(1'h1)] : (-((8'ha2) ? wire24 : wire7)))));
  assign wire86 = {(!(8'h9f))};
  assign wire87 = reg8;
endmodule

module module63  (y, clk, wire67, wire66, wire65, wire64);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire67;
  input wire signed [(5'h15):(1'h0)] wire66;
  input wire signed [(5'h15):(1'h0)] wire65;
  input wire signed [(4'hf):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire73;
  wire [(2'h2):(1'h0)] wire72;
  wire signed [(3'h6):(1'h0)] wire71;
  wire [(3'h6):(1'h0)] wire70;
  wire signed [(5'h13):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire68;
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 reg75,
                 (1'h0)};
  assign wire68 = ((wire66[(5'h11):(1'h1)] <<< $signed(((wire66 == wire66) ?
                          (wire67 < (7'h44)) : {wire64}))) ?
                      (wire65[(2'h3):(1'h0)] ?
                          wire66[(4'hf):(4'he)] : wire66[(5'h12):(4'ha)]) : $signed(wire64[(3'h6):(1'h0)]));
  assign wire69 = ({(~^($signed((8'hb4)) < (|wire65)))} ^~ ((((+wire68) >> wire68[(1'h1):(1'h1)]) | (!((8'ha3) ?
                          wire64 : (8'hb0)))) ?
                      (8'haf) : (7'h42)));
  assign wire70 = (~|(+($signed(((8'hbb) < wire68)) & ((wire67 ?
                          wire68 : wire69) ?
                      (wire67 ? wire64 : wire67) : $signed(wire67)))));
  assign wire71 = wire66[(4'hd):(4'ha)];
  assign wire72 = wire66;
  assign wire73 = ((^wire67) >= ((($signed(wire64) <= $signed((8'ha7))) - ((wire71 && wire66) && $signed(wire69))) ?
                      ((wire69 & wire67[(2'h2):(1'h1)]) | ((wire65 ?
                          wire70 : wire70) << (wire69 >> wire72))) : wire69[(4'h8):(3'h6)]));
  assign wire74 = wire66[(4'hc):(4'hb)];
  always
    @(posedge clk) begin
      reg75 <= wire68;
    end
  assign wire76 = wire72;
  assign wire77 = wire64;
endmodule

module module26
#(parameter param59 = (+(((((8'hb9) ? (8'h9f) : (8'hae)) ? {(8'hb1)} : (!(7'h44))) * {((8'haf) ? (8'hb3) : (8'hab)), {(8'hb3), (8'hbc)}}) != ((7'h43) ? ((~|(8'hb5)) ? (|(8'h9e)) : ((8'hb9) ? (8'hac) : (8'ha1))) : (^~{(7'h42), (8'h9c)})))), 
parameter param60 = ({(-(-((8'had) ^ param59)))} ? ((((&param59) <= param59) + ((param59 ? param59 : param59) ? param59 : (param59 ? param59 : param59))) ? (~^((~&param59) >= (param59 ~^ (8'hb6)))) : (((param59 > param59) ? {(8'hb6)} : {param59}) >>> ((+param59) ? (param59 ? param59 : param59) : (param59 ~^ param59)))) : ((!(param59 && (~&(8'ha1)))) > (({(8'h9d), param59} ~^ (~&param59)) == param59))))
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h16f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire31;
  input wire [(4'hb):(1'h0)] wire30;
  input wire [(5'h13):(1'h0)] wire29;
  input wire [(4'hb):(1'h0)] wire28;
  input wire [(4'h9):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  wire [(4'ha):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire31)
        begin
          reg32 <= (!wire28);
          reg33 <= {$unsigned(wire29[(5'h13):(4'hc)]),
              $signed($unsigned(((wire27 ? wire31 : wire29) ?
                  $unsigned(reg32) : wire30)))};
          reg34 <= ({reg33, wire31} ? reg32[(1'h1):(1'h1)] : reg33);
          reg35 <= reg32;
          reg36 <= wire31;
        end
      else
        begin
          reg32 <= (!reg35[(1'h1):(1'h1)]);
          reg33 <= ($unsigned($unsigned(((wire29 + reg36) ?
              (!reg33) : (reg33 ?
                  reg32 : (8'haa))))) * $unsigned(wire31[(2'h3):(1'h1)]));
        end
      if (reg36[(4'hf):(4'he)])
        begin
          reg37 <= wire29;
          reg38 <= $signed(reg34[(3'h6):(2'h2)]);
          reg39 <= (~&(!({(reg36 ? (8'hbc) : reg33)} ?
              ((~^wire29) ~^ $signed((8'ha8))) : $signed($signed(wire28)))));
          reg40 <= {($signed(({reg32, reg35} ?
                  reg34 : $unsigned(reg39))) << reg38)};
          reg41 <= ($signed({$signed(wire31[(1'h1):(1'h1)])}) ?
              reg34[(4'hd):(1'h0)] : reg39[(3'h7):(3'h4)]);
        end
      else
        begin
          reg37 <= (wire29 < $signed($unsigned(reg33)));
          reg38 <= (!wire28[(3'h4):(1'h1)]);
          reg39 <= ({$unsigned(reg32), reg32} ?
              $signed(reg41[(2'h2):(1'h1)]) : {(reg35[(3'h7):(3'h7)] <= (8'haf))});
          reg40 <= (^~wire29[(1'h1):(1'h0)]);
          reg41 <= $signed(($unsigned(reg34[(2'h2):(1'h1)]) ?
              reg39 : $unsigned(reg32)));
        end
      reg42 <= ((~|(&wire27)) ?
          (~|((|$unsigned((8'hb0))) != reg37)) : $signed($signed(reg33[(3'h5):(1'h1)])));
      reg43 <= ((~(reg33[(1'h0):(1'h0)] && (&{reg39, wire27}))) & (8'hbf));
      reg44 <= ((8'ha6) || (+reg37));
    end
  assign wire45 = wire27[(2'h2):(1'h1)];
  assign wire46 = $unsigned((^~$unsigned((reg44[(2'h2):(1'h0)] ?
                      (~&reg34) : $unsigned(wire28)))));
  assign wire47 = (7'h44);
  assign wire48 = reg33[(2'h3):(2'h3)];
  assign wire49 = wire45;
  assign wire50 = ((|$signed($unsigned(reg32))) ?
                      (-{$unsigned((reg41 ? reg33 : reg41))}) : reg32);
  assign wire51 = $signed(($signed((((8'hbc) ? reg39 : (8'ha3)) ?
                      (wire28 ?
                          wire29 : wire45) : (wire31 << wire27))) - (&({reg44} ?
                      (~wire46) : wire46))));
  assign wire52 = $unsigned((((~{reg37, wire46}) < $unsigned({reg32,
                      wire48})) & reg35[(2'h2):(1'h1)]));
  assign wire53 = (~|wire51[(4'h9):(4'h9)]);
  always
    @(posedge clk) begin
      reg54 <= (wire49[(4'h9):(2'h2)] <<< reg40[(4'h8):(3'h4)]);
      if (($unsigned($unsigned($signed((~|reg44)))) ?
          (wire31[(2'h2):(1'h0)] ?
              ((8'hbe) ?
                  ((reg42 & wire28) ?
                      wire49[(3'h6):(2'h2)] : {wire53}) : ($signed(wire47) ~^ {reg40,
                      reg38})) : (wire45[(4'hc):(1'h0)] * wire51[(4'h9):(3'h6)])) : (-({reg54,
                  wire53[(2'h3):(2'h2)]} ?
              (^~{reg54, (8'hb1)}) : {$unsigned((8'hae))}))))
        begin
          if (wire27[(3'h5):(2'h2)])
            begin
              reg55 <= $signed($signed((|wire27[(4'h9):(1'h1)])));
            end
          else
            begin
              reg55 <= $signed($unsigned($signed($unsigned((reg32 ?
                  wire48 : reg54)))));
            end
          reg56 <= {$unsigned(((^wire27) ?
                  (wire48[(1'h1):(1'h1)] ?
                      (reg40 < reg36) : ((8'ha5) <<< (8'hbd))) : wire29[(3'h4):(1'h0)]))};
          reg57 <= ($signed((~{$unsigned(reg34),
              (reg43 ^~ wire31)})) < $unsigned($signed(((reg42 >= reg41) && (~&wire45)))));
        end
      else
        begin
          reg55 <= reg40;
          reg56 <= reg39[(1'h1):(1'h1)];
          reg57 <= wire50[(1'h0):(1'h0)];
        end
      reg58 <= reg33[(2'h2):(2'h2)];
    end
endmodule
