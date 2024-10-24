module top
#(parameter param96 = ((((((8'hac) ? (8'ha8) : (8'ha6)) ? ((8'hb4) ? (8'hb0) : (7'h42)) : (~&(7'h42))) && (!((8'haa) ? (8'ha2) : (8'hb8)))) <= ({(!(7'h43)), {(8'ha5), (8'h9e)}} ? (((8'ha1) >> (7'h43)) ^ ((8'ha5) ? (7'h40) : (8'hb2))) : (((8'hb1) >> (8'hbb)) ? ((8'hbf) <= (8'ha5)) : (~^(7'h42))))) << (^((((8'ha1) - (8'ha7)) >> (|(8'hbd))) ? (((8'ha0) ? (8'hb1) : (8'hac)) ? ((8'h9c) <<< (7'h41)) : ((8'ha9) ? (8'hb6) : (7'h44))) : (((8'hb0) ? (8'hae) : (8'h9f)) ? {(7'h43)} : (~(8'hbe)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire [(4'he):(1'h0)] wire95;
  wire signed [(4'h8):(1'h0)] wire94;
  wire signed [(4'hf):(1'h0)] wire93;
  wire signed [(3'h7):(1'h0)] wire92;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire90;
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  reg [(4'hc):(1'h0)] reg4 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire6,
                 wire7,
                 wire90,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned(wire0[(2'h3):(1'h1)]);
      reg5 <= {reg4};
    end
  assign wire6 = $signed(($unsigned((^~(8'ha7))) ?
                     $unsigned((wire2 & reg4[(3'h5):(3'h5)])) : ($unsigned(wire2[(4'he):(4'hd)]) + ({reg5,
                             reg4} ?
                         $signed(reg4) : ((8'hba) ? wire3 : wire0)))));
  assign wire7 = {(~&(!((+reg4) ? ((8'hbe) - reg4) : (~|wire0)))),
                     (wire6 ? {wire1} : wire0)};
  always
    @(posedge clk) begin
      if ((((((-wire0) ? (8'ha7) : $unsigned((7'h44))) ?
          $signed(wire3[(4'hf):(4'hf)]) : wire0) >> $unsigned(((wire6 != reg4) - wire6[(1'h1):(1'h1)]))) != ({({wire0,
                  reg5} & (^~(8'hb7))),
              $unsigned($signed(wire6))} ?
          wire7 : ((-{wire1}) == wire3[(4'he):(4'hd)]))))
        begin
          reg8 <= wire0[(2'h3):(1'h0)];
          if ((($signed(wire7) ^ wire6) >>> wire6[(1'h1):(1'h1)]))
            begin
              reg9 <= wire1[(3'h7):(1'h1)];
              reg10 <= ($unsigned(((wire1[(4'h8):(3'h4)] ? wire6 : wire1) ?
                  wire6[(1'h0):(1'h0)] : $unsigned({wire3}))) && $unsigned((($signed(wire2) & (wire6 ?
                  reg4 : reg5)) - wire1)));
              reg11 <= ((8'h9d) == wire3);
              reg12 <= ($signed(({(wire1 > wire0),
                  $unsigned(reg11)} ~^ reg5)) != wire2[(4'ha):(3'h4)]);
              reg13 <= $signed(reg4[(3'h7):(3'h4)]);
            end
          else
            begin
              reg9 <= reg10;
              reg10 <= (8'hbb);
              reg11 <= (+{$signed((wire1 ^ reg12))});
              reg12 <= ((~($unsigned((&wire6)) ?
                      wire6[(2'h2):(2'h2)] : ($signed(reg10) ?
                          (~&reg12) : $signed(wire2)))) ?
                  (wire1[(3'h7):(3'h5)] == reg9[(4'h9):(2'h2)]) : $signed(reg8));
              reg13 <= (wire7 ?
                  (-wire7) : (wire1[(3'h4):(1'h1)] ?
                      (^$signed(reg10)) : $signed(reg11)));
            end
        end
      else
        begin
          reg8 <= $unsigned($unsigned(reg12[(1'h0):(1'h0)]));
        end
      reg14 <= (reg8[(4'h9):(3'h4)] ? (^reg8) : $signed(reg11[(3'h5):(2'h2)]));
      reg15 <= $signed((~$unsigned(reg8[(4'ha):(4'ha)])));
    end
  module16 #() modinst91 (.wire18(reg8), .wire19(wire6), .wire17(reg14), .y(wire90), .wire20(reg11), .clk(clk), .wire21(reg15));
  assign wire92 = ((+(~^wire3[(4'hf):(4'h8)])) ?
                      $unsigned((reg14 != $signed($unsigned(wire2)))) : $signed({$signed(wire6),
                          reg12}));
  assign wire93 = reg5[(4'hc):(4'hc)];
  assign wire94 = ((~&$unsigned({wire93})) ?
                      $signed(reg9[(3'h5):(1'h0)]) : (((8'ha2) ?
                          {{(8'hbb),
                                  reg10}} : {$unsigned((8'ha0))}) == $signed(wire7)));
  assign wire95 = wire7;
endmodule

module module16
#(parameter param88 = ((((8'ha4) != (((8'ha9) << (8'ha7)) == ((8'h9e) ^~ (8'hb4)))) + (~&((8'ha6) != ((8'hbd) ? (7'h44) : (8'hb4))))) * ((~|(&(~(8'hb1)))) == (({(8'hba), (8'hba)} != {(8'ha0), (8'hb9)}) ? (((8'hae) | (8'hba)) <= ((7'h44) ? (8'hb5) : (8'ha0))) : (((8'hbc) ? (8'hb2) : (8'ha6)) * ((7'h40) ? (8'hb3) : (8'haa)))))), 
parameter param89 = param88)
(y, clk, wire17, wire18, wire19, wire20, wire21);
  output wire [(32'h23f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire17;
  input wire [(3'h6):(1'h0)] wire18;
  input wire signed [(5'h12):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire20;
  input wire signed [(2'h3):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire87;
  wire [(3'h4):(1'h0)] wire86;
  wire signed [(4'h8):(1'h0)] wire85;
  wire signed [(5'h12):(1'h0)] wire84;
  wire signed [(4'h8):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire58;
  wire [(4'h8):(1'h0)] wire59;
  wire signed [(3'h4):(1'h0)] wire60;
  wire [(5'h13):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire82;
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire22,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire57,
                 wire58,
                 wire59,
                 wire60,
                 wire61,
                 wire62,
                 wire63,
                 wire64,
                 wire65,
                 wire82,
                 reg56,
                 reg55,
                 reg54,
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
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire22 = wire18;
  always
    @(posedge clk) begin
      reg23 <= {(($unsigned($signed((8'haa))) ?
                  $unsigned(wire20[(3'h5):(3'h5)]) : ((wire22 >> wire21) ?
                      $signed(wire21) : wire19)) ?
              {(!(wire21 ? wire22 : wire19))} : $signed((-wire22))),
          wire21};
      reg24 <= ($unsigned((wire18 ?
              $signed(wire22) : ($unsigned((8'hb8)) ~^ $signed(wire22)))) ?
          (($unsigned(wire18) ^~ reg23[(3'h5):(3'h4)]) ~^ ((^$unsigned(wire17)) ^~ (wire22[(1'h0):(1'h0)] ?
              $signed((8'ha3)) : wire20[(3'h7):(3'h4)]))) : $signed(wire20[(4'ha):(1'h1)]));
      if (wire20)
        begin
          reg25 <= (reg24[(1'h0):(1'h0)] && (~&wire22));
          reg26 <= ((~|wire17[(3'h5):(1'h0)]) ?
              {$unsigned((reg24[(1'h0):(1'h0)] ?
                      (reg24 ?
                          wire21 : reg23) : wire18[(2'h3):(2'h2)]))} : wire18);
        end
      else
        begin
          reg25 <= (wire21 ?
              $unsigned(((~^(wire22 ?
                  wire20 : reg24)) ~^ (^~wire19))) : wire19[(3'h5):(2'h2)]);
        end
      reg27 <= $unsigned(wire20);
      reg28 <= (8'h9c);
    end
  assign wire29 = $unsigned(wire18);
  assign wire30 = (wire22 >> wire20);
  assign wire31 = {wire20[(4'hb):(3'h5)]};
  assign wire32 = (wire21 + $signed((|$unsigned(reg23[(2'h3):(1'h1)]))));
  always
    @(posedge clk) begin
      reg33 <= $unsigned((|$signed((8'hb7))));
      if (({wire19,
          (((~wire30) ? $unsigned((8'hbd)) : (reg27 >= reg33)) ?
              ((wire19 ?
                  wire22 : reg28) ^~ $unsigned(wire20)) : $signed($unsigned(reg27)))} && ((((wire17 & wire32) ?
                  $unsigned(wire18) : reg23) ?
              ($signed(wire19) ?
                  reg24 : (reg28 && reg33)) : (~$signed(wire22))) ?
          reg28 : wire32)))
        begin
          reg34 <= ($unsigned(reg28[(2'h2):(1'h1)]) ?
              {$signed(({wire20, (8'hbd)} ?
                      wire22 : wire32[(4'hc):(4'ha)]))} : $signed((8'ha3)));
        end
      else
        begin
          reg34 <= (^{wire17});
          reg35 <= $unsigned(($unsigned({$unsigned(wire21), reg28}) >> (reg34 ?
              reg33[(1'h0):(1'h0)] : {(wire19 ? wire31 : wire19)})));
          reg36 <= ({$unsigned({reg28[(1'h1):(1'h0)],
                  (wire17 ?
                      reg34 : wire21)})} == $signed($unsigned({(+reg24)})));
        end
      reg37 <= $unsigned(((((8'h9c) ? $signed(wire21) : $signed(reg27)) ?
              wire32 : ((&reg28) >> reg35[(2'h2):(1'h0)])) ?
          wire19 : {(reg27 + (8'h9d))}));
      if ((~^$unsigned($unsigned((((8'hab) && wire22) ?
          (8'hb3) : ((8'h9f) ? wire30 : wire29))))))
        begin
          reg38 <= wire22[(2'h3):(1'h1)];
          reg39 <= wire29;
          reg40 <= (wire19[(3'h5):(2'h3)] > reg33);
          reg41 <= (8'hac);
          reg42 <= ((!reg24[(2'h3):(2'h2)]) ?
              wire30 : {(reg23[(4'h9):(4'h8)] ?
                      reg37[(1'h0):(1'h0)] : (!(reg35 ? wire31 : reg41))),
                  $signed(((reg38 ? reg41 : wire32) || {(8'hb8), reg23}))});
        end
      else
        begin
          if (($unsigned($signed(({reg26, wire22} != $unsigned(reg39)))) ?
              wire30[(4'hd):(1'h0)] : $unsigned({wire32, reg33})))
            begin
              reg38 <= ($signed($signed($unsigned(wire20[(3'h5):(3'h5)]))) >= ((~|reg33) - $unsigned(((reg24 ?
                  reg23 : reg25) * reg40))));
              reg39 <= wire32;
              reg40 <= $unsigned(({reg24} >> (^~{reg35, $signed(wire17)})));
            end
          else
            begin
              reg38 <= ((+(reg28[(1'h0):(1'h0)] ?
                  (~^$signed(reg28)) : $signed(wire29[(2'h2):(1'h0)]))) >> ($signed(wire18[(1'h0):(1'h0)]) ?
                  $signed((((8'ha6) ? (8'h9d) : (8'hbd)) ?
                      reg38 : reg27[(5'h10):(4'h9)])) : $signed(wire17)));
              reg39 <= $unsigned(wire17[(3'h5):(3'h4)]);
              reg40 <= $signed((+$unsigned(($signed(wire30) ?
                  {(8'hbf)} : (reg34 <= wire30)))));
              reg41 <= $signed($unsigned((!$unsigned((^~wire31)))));
              reg42 <= ($unsigned(wire29[(1'h0):(1'h0)]) | ((~^$unsigned((wire18 ?
                      reg24 : wire20))) ?
                  $unsigned(((reg41 ~^ (8'hae)) ?
                      (reg33 ?
                          wire29 : (8'hb0)) : (reg26 || reg39))) : (((wire20 ?
                      reg24 : reg33) <= reg41) ~^ reg27[(4'h8):(4'h8)])));
            end
          reg43 <= $signed(reg37[(3'h5):(1'h1)]);
          reg44 <= ((^$signed((|$unsigned(reg26)))) ^ (reg33 ?
              (!$signed((-wire20))) : wire32));
        end
    end
  always
    @(posedge clk) begin
      reg45 <= (+wire17);
      reg46 <= ((8'hae) ?
          $signed((($signed((8'hbd)) <<< $unsigned(reg39)) ^~ reg43)) : ($unsigned(reg39[(3'h7):(3'h5)]) != $signed((reg25[(3'h5):(1'h0)] ?
              (reg37 ? wire29 : reg28) : reg42))));
      if ((-$signed((reg39[(3'h7):(1'h1)] == $unsigned(wire20)))))
        begin
          reg47 <= $unsigned((8'hb5));
          reg48 <= (~^(wire17[(2'h3):(2'h2)] ?
              wire32 : $unsigned(((reg28 <<< reg34) >> (wire21 ?
                  wire30 : reg25)))));
          if (wire20)
            begin
              reg49 <= ({(|reg45[(3'h4):(1'h1)]),
                      $signed((wire32[(4'hf):(4'h9)] | wire30))} ?
                  {(reg23[(3'h6):(3'h4)] | $unsigned($unsigned(reg36)))} : {wire30[(4'he):(3'h5)]});
              reg50 <= ((~(wire21[(2'h3):(1'h1)] ?
                  (!(wire22 ? wire19 : wire22)) : ($unsigned(reg28) ?
                      reg44[(2'h2):(2'h2)] : (-reg42)))) | (^(|($unsigned(reg49) <= {wire18,
                  wire32}))));
              reg51 <= reg28;
              reg52 <= (+((^~(~&$unsigned(reg40))) & $signed({(~|reg41)})));
              reg53 <= (8'hb9);
            end
          else
            begin
              reg49 <= wire22;
              reg50 <= ($unsigned($unsigned($signed((wire32 ?
                      (8'hba) : wire20)))) ?
                  $unsigned((^~$unsigned((reg42 >= reg49)))) : wire20[(3'h5):(1'h1)]);
              reg51 <= (reg53 ^ wire29);
              reg52 <= wire17;
              reg53 <= ({(($unsigned(wire29) == $signed(reg40)) ?
                      reg48[(4'h8):(3'h6)] : reg52),
                  wire17} > (reg40 << wire21));
            end
          reg54 <= $unsigned(wire29);
        end
      else
        begin
          reg47 <= (reg48 ?
              reg54[(3'h4):(3'h4)] : (~|$unsigned($signed((reg23 >> wire29)))));
          reg48 <= ($signed(reg50) ?
              reg37[(3'h4):(2'h2)] : $unsigned((~|$unsigned((~&wire20)))));
          reg49 <= reg42;
          reg50 <= $signed((^$signed(reg39[(3'h5):(2'h3)])));
          if ((~|(^~reg53)))
            begin
              reg51 <= ($unsigned((reg43[(4'hf):(2'h2)] ?
                  wire21 : (|(+reg26)))) == wire20);
              reg52 <= (|(~reg36));
              reg53 <= reg38[(3'h4):(2'h3)];
              reg54 <= reg41[(3'h6):(2'h2)];
              reg55 <= wire31;
            end
          else
            begin
              reg51 <= reg25;
              reg52 <= reg38[(2'h2):(2'h2)];
              reg53 <= wire21;
              reg54 <= {(~|reg24)};
            end
        end
      reg56 <= $unsigned($signed((($signed((7'h44)) >= $unsigned(wire31)) <= reg41)));
    end
  assign wire57 = (8'hb6);
  assign wire58 = ((~&$signed(((^(7'h43)) ? wire20 : (&reg50)))) ?
                      reg37 : $signed($signed(reg42)));
  assign wire59 = (reg28[(1'h1):(1'h0)] ?
                      reg49 : $unsigned(($signed(reg56) || ((wire22 ~^ reg27) <<< ((8'ha8) ?
                          reg56 : reg24)))));
  assign wire60 = ({reg51,
                      ($signed($unsigned(reg53)) <= ($signed(reg26) < $unsigned(reg47)))} ~^ (8'hae));
  assign wire61 = reg36[(4'hd):(4'h8)];
  assign wire62 = reg46;
  assign wire63 = wire60[(1'h0):(1'h0)];
  assign wire64 = wire30;
  assign wire65 = reg49;
  module66 #() modinst83 (.wire69(reg25), .y(wire82), .wire70(reg37), .wire71(reg35), .wire68(wire62), .wire67(reg40), .clk(clk));
  assign wire84 = (reg56 > $signed(reg53[(4'hb):(4'hb)]));
  assign wire85 = {wire59,
                      ($signed($signed($unsigned(wire17))) | (-$signed(reg27[(4'h8):(3'h7)])))};
  assign wire86 = ((-($unsigned($unsigned(wire85)) + ({wire61,
                      reg51} + (8'had)))) + reg35);
  assign wire87 = reg51[(3'h5):(1'h0)];
endmodule

module module66
#(parameter param81 = {((({(8'hab)} || (^(8'ha7))) ^ (((8'h9e) ? (8'hb2) : (8'ha0)) ? (8'hbb) : ((8'hb2) || (8'hbc)))) ? ((|((8'hb3) ? (8'hb1) : (8'hac))) >= (~((8'hb6) ? (8'ha7) : (8'hb2)))) : (((!(8'hb8)) ? ((8'hbb) ? (8'hae) : (8'hab)) : {(8'hbe), (8'ha5)}) >= (((8'hbd) ? (8'hbf) : (8'had)) ? ((8'hb0) < (8'ha9)) : (+(8'h9d)))))})
(y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire71;
  input wire [(4'h9):(1'h0)] wire70;
  input wire signed [(4'hc):(1'h0)] wire69;
  input wire signed [(2'h2):(1'h0)] wire68;
  input wire [(4'hb):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire79;
  wire signed [(3'h6):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  wire signed [(3'h4):(1'h0)] wire76;
  wire signed [(3'h4):(1'h0)] wire75;
  wire [(5'h10):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire73;
  wire signed [(5'h13):(1'h0)] wire72;
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 (1'h0)};
  assign wire72 = (+{(wire70 ?
                          ((^wire69) ?
                              (wire69 == wire71) : $unsigned(wire67)) : (((7'h41) == wire68) ?
                              {(8'ha1), wire67} : {wire71})),
                      wire68[(2'h2):(1'h1)]});
  assign wire73 = $unsigned(wire71);
  assign wire74 = wire71;
  assign wire75 = (~^wire71);
  assign wire76 = {($signed({$unsigned(wire68), (wire71 ? wire69 : wire74)}) ?
                          (^~(~&$signed(wire67))) : wire73),
                      $signed((|$unsigned((wire73 ^ (8'hbb)))))};
  assign wire77 = (|wire76);
  assign wire78 = $signed((-{wire69[(3'h7):(1'h0)]}));
  assign wire79 = wire75;
  assign wire80 = ($unsigned($unsigned(wire78[(3'h5):(3'h5)])) ?
                      wire70 : $unsigned($unsigned(wire78)));
endmodule
