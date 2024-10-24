module top
#(parameter param116 = {(^(~((+(7'h44)) ? (~|(8'hae)) : (8'hba)))), (((((8'hb0) ? (8'hab) : (8'hb7)) < ((8'hbe) != (8'hbc))) ? (8'hb4) : (((8'hbd) ? (7'h43) : (8'h9e)) ? ((8'hb3) <= (8'hbe)) : ((7'h41) ? (8'hab) : (8'ha4)))) ? (&(&((7'h44) ? (7'h40) : (8'ha9)))) : (({(8'hbd), (8'hbc)} << ((8'ha4) ^~ (8'ha3))) ? (((8'hb7) ? (8'ha3) : (8'hb9)) ? ((7'h40) ? (8'ha7) : (8'hbd)) : (~&(8'ha5))) : ((8'hb7) <= {(8'hb6), (8'ha7)})))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h266):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire115;
  wire signed [(5'h13):(1'h0)] wire114;
  wire signed [(3'h4):(1'h0)] wire103;
  wire signed [(4'h8):(1'h0)] wire102;
  wire [(4'hc):(1'h0)] wire99;
  wire [(4'h9):(1'h0)] wire98;
  wire signed [(5'h12):(1'h0)] wire96;
  wire [(3'h7):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg110 = (1'h0);
  reg [(4'hb):(1'h0)] reg109 = (1'h0);
  reg [(5'h14):(1'h0)] reg108 = (1'h0);
  reg [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(4'ha):(1'h0)] reg105 = (1'h0);
  reg [(4'ha):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg100 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire103,
                 wire102,
                 wire99,
                 wire98,
                 wire96,
                 wire18,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg101,
                 reg100,
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
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire5 = $unsigned((wire4[(2'h3):(1'h0)] + wire1));
  assign wire6 = wire3[(4'hf):(2'h3)];
  assign wire7 = $signed($unsigned($signed($unsigned((wire6 ?
                     wire1 : wire4)))));
  assign wire8 = ((wire3[(2'h2):(1'h1)] ?
                         $signed($unsigned(wire7[(2'h2):(2'h2)])) : (~|{wire6})) ?
                     (wire2[(3'h7):(3'h4)] ?
                         wire3[(2'h3):(2'h2)] : wire6) : (&$signed((wire2 ?
                         $unsigned(wire0) : $signed((8'ha6))))));
  assign wire9 = $unsigned($unsigned($unsigned((~^$unsigned(wire2)))));
  assign wire10 = $signed((~|wire4[(2'h3):(2'h3)]));
  assign wire11 = ($unsigned(wire2[(1'h0):(1'h0)]) != wire9);
  always
    @(posedge clk) begin
      if (wire2)
        begin
          reg12 <= (wire2[(4'h8):(3'h6)] * ({{(wire9 > wire7),
                  wire10[(3'h5):(1'h0)]},
              (wire7 >>> wire4[(2'h3):(1'h0)])} << (($signed(wire5) ?
                  wire11 : (wire4 ^~ wire4)) ?
              $signed(wire4) : (^~$signed(wire5)))));
          if (((wire8[(1'h1):(1'h1)] + $unsigned((wire7[(2'h3):(2'h2)] ?
              wire7[(4'hb):(1'h0)] : (~^wire6)))) * (!((~^wire5) ?
              {$unsigned(wire2)} : $unsigned((wire3 ? wire4 : wire0))))))
            begin
              reg13 <= ($signed($unsigned($unsigned($unsigned(wire0)))) > {wire7[(3'h4):(2'h3)],
                  ((7'h41) ? wire2[(2'h3):(1'h0)] : wire2[(4'h8):(4'h8)])});
              reg14 <= (($signed($unsigned(wire6[(3'h5):(3'h5)])) ?
                      (((reg13 & (7'h43)) && $unsigned(wire2)) ?
                          ($unsigned((8'hae)) ~^ $unsigned(wire2)) : {$unsigned(wire3)}) : ({$unsigned(wire4)} ?
                          {wire11[(5'h11):(3'h5)],
                              $unsigned((8'hac))} : wire1)) ?
                  (~(wire6[(2'h3):(2'h2)] == ((wire8 ?
                      wire0 : wire3) + $signed(reg12)))) : ($signed((^(~^(8'hb2)))) <<< (7'h43)));
              reg15 <= $unsigned(((!reg13[(2'h2):(1'h1)]) ?
                  $signed((~^(~wire1))) : $signed($signed((wire3 >>> wire5)))));
              reg16 <= wire8;
            end
          else
            begin
              reg13 <= {((wire3[(4'h9):(2'h3)] ?
                          (8'h9c) : (^~reg14[(1'h0):(1'h0)])) ?
                      $signed($signed(reg14)) : $signed(wire8)),
                  (($signed($signed(wire4)) + ({wire8, (8'ha4)} ?
                          (reg16 ? wire2 : wire0) : {(8'h9e), reg15})) ?
                      ($unsigned(((7'h40) ~^ (8'ha0))) ?
                          ((wire10 >= wire2) || $signed(reg12)) : $unsigned(((8'hb8) ?
                              wire11 : wire11))) : (8'ha0))};
            end
          reg17 <= {(wire8[(3'h5):(3'h4)] * wire5[(1'h1):(1'h0)])};
        end
      else
        begin
          reg12 <= wire7[(2'h2):(1'h0)];
        end
    end
  assign wire18 = $signed(reg12[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg19 <= wire1;
      reg20 <= wire9[(5'h13):(5'h13)];
      reg21 <= {wire6, $unsigned((!$signed(reg14)))};
      if ($signed(reg20[(4'h9):(2'h3)]))
        begin
          reg22 <= (($unsigned($signed((reg14 ?
              (8'h9c) : (8'hb1)))) * $signed($signed((~^wire7)))) > reg20[(4'h8):(2'h2)]);
          reg23 <= (~^$unsigned(wire9[(2'h3):(2'h3)]));
          if ((~&({(~&wire18[(2'h3):(1'h0)]),
                  ((reg16 ^~ wire11) ? (~wire11) : (wire4 ? wire18 : wire11))} ?
              (((^~wire5) * $signed(wire7)) ?
                  wire10[(1'h1):(1'h1)] : (8'ha0)) : reg19[(4'hc):(3'h4)])))
            begin
              reg24 <= reg17[(4'ha):(4'h9)];
            end
          else
            begin
              reg24 <= {(!($signed((8'h9d)) << ($signed(reg23) >> (^(7'h44))))),
                  ((8'haf) && wire8)};
              reg25 <= $unsigned(reg12[(1'h0):(1'h0)]);
              reg26 <= ($unsigned(({$signed((8'hb8))} ?
                      ((wire7 ? reg12 : wire5) ?
                          reg12 : $signed(reg23)) : wire0[(4'hf):(4'ha)])) ?
                  ((-((wire3 << (8'hb0)) ?
                          {wire11} : (reg14 ? reg22 : reg25))) ?
                      reg12 : wire1[(3'h6):(2'h3)]) : reg25);
              reg27 <= ($unsigned((|(wire1 || ((7'h40) ? wire4 : wire4)))) ?
                  {(~|wire9[(1'h0):(1'h0)])} : $signed((($signed(wire4) <<< reg22) ?
                      $unsigned({reg22}) : (~$signed(wire6)))));
              reg28 <= $unsigned(wire5[(2'h3):(1'h0)]);
            end
        end
      else
        begin
          if ((($unsigned(((reg13 ?
                  (8'hbe) : reg25) << reg14[(4'hc):(4'h9)])) < {{(^~reg24)}}) ?
              {$signed(((wire10 ? reg24 : (8'h9f)) ?
                      $unsigned(wire2) : reg23[(2'h3):(2'h3)]))} : $signed($signed((^~(reg26 >>> (7'h42)))))))
            begin
              reg22 <= reg23[(2'h3):(2'h3)];
              reg23 <= $unsigned($signed(reg22[(2'h3):(1'h0)]));
            end
          else
            begin
              reg22 <= (reg16[(4'hb):(3'h4)] < ($unsigned($signed($signed(wire2))) ?
                  $signed(wire3) : $signed(((wire1 >= reg23) & (reg12 ?
                      reg20 : (8'ha2))))));
              reg23 <= reg21;
              reg24 <= wire11;
            end
          reg25 <= wire7;
          if ($unsigned(reg22[(1'h0):(1'h0)]))
            begin
              reg26 <= ($unsigned(($signed((reg25 ^~ reg19)) * {{reg24}})) >> (|$unsigned($unsigned((reg26 ?
                  (8'hbc) : reg21)))));
              reg27 <= reg20[(3'h7):(2'h2)];
            end
          else
            begin
              reg26 <= $unsigned((^{$unsigned($signed(reg24)),
                  (~^$unsigned(reg21))}));
              reg27 <= reg26[(4'hb):(1'h0)];
              reg28 <= reg26[(5'h12):(4'hb)];
            end
          if ($unsigned({(8'h9d),
              ((((7'h43) ^ reg16) ? reg14[(4'h9):(1'h1)] : $signed(reg23)) ?
                  {$signed(reg19), {reg12}} : wire18)}))
            begin
              reg29 <= wire4;
            end
          else
            begin
              reg29 <= ($signed((+$unsigned((reg29 & reg29)))) | (^~($signed($signed(reg26)) | wire3[(3'h4):(2'h3)])));
              reg30 <= (reg13 ^ (($unsigned((reg19 >= wire1)) >> reg25[(5'h10):(4'hb)]) << $signed({wire10[(1'h1):(1'h1)]})));
              reg31 <= (reg21 ?
                  ($unsigned($signed($unsigned((8'hb7)))) ?
                      $signed({(~reg16)}) : $unsigned($unsigned($signed((8'hbc))))) : $unsigned(wire0[(1'h0):(1'h0)]));
              reg32 <= $unsigned(wire5);
              reg33 <= ((~^{reg15[(3'h4):(3'h4)]}) ?
                  ((8'ha6) ?
                      $unsigned((-(~wire0))) : ($unsigned((reg13 ?
                          reg30 : reg26)) - $unsigned($signed(reg12)))) : $unsigned(($unsigned((wire5 ?
                      (8'ha6) : wire5)) <<< ($unsigned(wire5) ?
                      reg16 : reg23))));
            end
        end
      if (({$signed(reg30)} ?
          (wire7[(3'h4):(2'h2)] ?
              $signed((reg30[(1'h0):(1'h0)] >= {reg21,
                  reg26})) : wire2) : $signed(wire10)))
        begin
          reg34 <= $signed(wire5);
          reg35 <= wire18[(3'h7):(1'h0)];
          reg36 <= $signed($unsigned(wire7[(1'h0):(1'h0)]));
          reg37 <= reg35[(3'h6):(3'h4)];
          reg38 <= ((($signed((~reg24)) ?
              $signed({(8'hb9),
                  reg12}) : $unsigned($unsigned(wire9))) && wire18) <<< {reg14[(3'h6):(1'h0)],
              reg19[(4'he):(1'h1)]});
        end
      else
        begin
          reg34 <= (reg36[(3'h4):(1'h1)] ?
              (^$signed($signed((~^reg16)))) : (reg32 != $unsigned($signed($signed((7'h44))))));
        end
    end
  module39 #() modinst97 (wire96, clk, reg17, reg38, reg30, reg24);
  assign wire98 = $signed(({reg21,
                      (~reg16[(5'h11):(4'hf)])} ^~ reg37[(1'h1):(1'h0)]));
  assign wire99 = ((8'ha1) ?
                      reg35[(4'h9):(2'h3)] : ({reg24[(3'h6):(3'h6)], {wire7}} ?
                          $unsigned($unsigned((reg33 ^ wire98))) : reg16));
  always
    @(posedge clk) begin
      reg100 <= (^(wire9 * $unsigned((reg14[(5'h11):(5'h10)] ?
          $signed(wire96) : $unsigned(reg15)))));
      reg101 <= (($unsigned(reg21[(3'h4):(2'h2)]) ?
              {wire10, $signed((reg29 ? wire2 : wire8))} : (8'hb5)) ?
          (8'hb9) : (wire5 ? ((^$unsigned(reg100)) || reg12) : wire2));
    end
  assign wire102 = $signed((reg20[(3'h5):(1'h0)] | reg19[(4'he):(2'h3)]));
  assign wire103 = {($unsigned(((reg34 > (8'h9e)) * (reg20 ?
                           wire99 : wire10))) - ((~^reg23) || wire9[(4'hf):(3'h5)]))};
  always
    @(posedge clk) begin
      if (($signed($unsigned($signed(reg101))) ?
          wire1 : ($signed($unsigned($signed(reg33))) ?
              (~&((reg34 == reg38) ?
                  ((8'ha1) & reg17) : wire6[(4'h8):(1'h0)])) : {{reg21,
                      (!reg29)}})))
        begin
          reg104 <= $signed(reg27[(4'h8):(1'h0)]);
          reg105 <= reg104;
          if (reg24[(4'he):(1'h1)])
            begin
              reg106 <= reg20[(3'h4):(1'h0)];
              reg107 <= (+(wire4 ?
                  (((reg36 ? wire9 : (8'hb5)) >= {wire3}) ?
                      $unsigned($unsigned(reg26)) : $signed($signed(reg37))) : (^wire1[(4'h9):(1'h1)])));
              reg108 <= reg20[(4'h8):(1'h1)];
            end
          else
            begin
              reg106 <= $signed($signed($signed(wire4[(2'h3):(1'h1)])));
              reg107 <= (8'ha2);
              reg108 <= reg22;
            end
          reg109 <= (~&(+(wire2 ?
              $unsigned($unsigned(reg28)) : ($unsigned(reg25) && $unsigned(reg20)))));
          if ((((reg100 * ((reg14 >> reg29) >>> (reg14 ? reg34 : (7'h42)))) ?
              wire98 : $signed((wire7[(3'h7):(3'h6)] ^~ (~wire6)))) ^~ (($unsigned((reg25 && wire102)) ?
              {{(8'hbe)},
                  (reg105 ?
                      wire0 : (7'h40))} : ((~reg31) + (reg32 < reg16))) & {$unsigned($unsigned(wire3))})))
            begin
              reg110 <= (^~$signed((^~reg13[(1'h1):(1'h1)])));
              reg111 <= wire9;
              reg112 <= $unsigned((|(reg32 - {(reg33 ? wire2 : reg37)})));
              reg113 <= $signed($signed((~(((8'hbf) < wire98) ^~ reg29[(2'h2):(1'h1)]))));
            end
          else
            begin
              reg110 <= (reg35[(2'h3):(1'h0)] <<< reg21);
              reg111 <= reg13;
              reg112 <= (!$signed($unsigned($signed(reg24))));
            end
        end
      else
        begin
          reg104 <= $signed({((^~(wire1 ? (8'hb6) : wire2)) ?
                  ((~&reg105) ?
                      $unsigned(reg13) : (+reg107)) : $signed(reg100[(3'h4):(2'h3)])),
              (|reg113[(2'h3):(1'h1)])});
          reg105 <= (reg13 ?
              reg36 : ($signed(reg110[(1'h1):(1'h0)]) & ((8'hbc) ?
                  $unsigned($unsigned(wire8)) : wire99[(2'h3):(2'h2)])));
          reg106 <= ((~(8'hac)) > (|$signed((-$unsigned((8'hbc))))));
          reg107 <= ($signed($signed($unsigned(reg105))) ?
              ((^~reg100[(5'h11):(4'h9)]) ?
                  $unsigned((+(~|reg32))) : $signed(reg104[(1'h0):(1'h0)])) : $unsigned($signed($unsigned(reg22[(2'h2):(2'h2)]))));
          reg108 <= ({(8'had)} << $unsigned(({$signed(reg17), (~&reg106)} ?
              $signed((reg20 ? wire103 : reg23)) : (^wire0[(3'h6):(3'h6)]))));
        end
    end
  assign wire114 = ((!(((reg101 ? wire5 : reg35) ?
                           (wire96 == (8'hb3)) : $signed(reg32)) ?
                       ((reg22 | reg19) * reg37[(2'h3):(2'h3)]) : wire1[(4'h8):(2'h2)])) > wire98);
  assign wire115 = ((~reg109[(3'h7):(3'h6)]) | ((($signed(reg21) ?
                           {reg109, wire102} : (reg36 ?
                               wire0 : wire2)) <<< $signed(reg36)) ?
                       (reg30[(4'h8):(1'h0)] ?
                           ((8'haa) ?
                               reg109 : $signed(reg27)) : $signed((!reg35))) : reg35[(4'hb):(4'h9)]));
endmodule

module module39
#(parameter param95 = (^{(((~^(8'ha9)) ? (!(8'hb9)) : ((8'hbb) == (8'ha5))) || (((8'had) <= (8'hbf)) ? ((8'hbb) ? (8'hb7) : (8'hb9)) : ((8'hae) ? (7'h41) : (8'h9d)))), (({(7'h41), (8'hb0)} ^ (|(8'haa))) ? ({(8'hb3)} ? ((8'hb8) ? (8'ha5) : (8'ha6)) : {(8'ha7), (8'ha3)}) : (((8'ha7) ? (8'haf) : (8'hb8)) ? (-(7'h43)) : ((7'h42) ~^ (8'hbd))))}))
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire43;
  input wire signed [(5'h14):(1'h0)] wire42;
  input wire [(5'h14):(1'h0)] wire41;
  input wire [(4'hf):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire94;
  wire [(4'he):(1'h0)] wire93;
  wire [(2'h3):(1'h0)] wire92;
  wire [(2'h3):(1'h0)] wire91;
  wire signed [(4'hf):(1'h0)] wire90;
  wire signed [(4'hb):(1'h0)] wire89;
  wire signed [(5'h11):(1'h0)] wire88;
  wire signed [(4'hd):(1'h0)] wire84;
  wire signed [(4'h8):(1'h0)] wire83;
  wire [(3'h6):(1'h0)] wire82;
  wire [(3'h4):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire80;
  wire signed [(3'h7):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire78;
  wire signed [(4'h8):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire53;
  wire signed [(5'h15):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire44;
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(4'h8):(1'h0)] reg86 = (1'h0);
  reg [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire76,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire44,
                 reg87,
                 reg86,
                 reg85,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire44 = (($unsigned((^~{wire43})) <<< $unsigned(($unsigned((8'hac)) ?
                          (wire42 > wire42) : (&wire41)))) ?
                      (+$unsigned((~|wire41[(4'hc):(4'hc)]))) : $signed((^$unsigned(wire40))));
  always
    @(posedge clk) begin
      reg45 <= $signed(wire41[(4'h8):(2'h3)]);
      reg46 <= (reg45[(3'h4):(2'h2)] ?
          $signed(reg45) : (wire44 ^ (+wire43[(3'h5):(1'h1)])));
      if (wire44)
        begin
          reg47 <= wire41[(4'h8):(3'h5)];
          reg48 <= $signed($signed($unsigned(wire40[(3'h6):(1'h0)])));
          reg49 <= ((wire42 << $signed($unsigned({wire44,
              wire43}))) + (&($unsigned(wire42) ?
              (reg45 >> $signed(wire42)) : reg47)));
        end
      else
        begin
          reg47 <= ($unsigned(reg45) & (wire42[(3'h7):(3'h6)] || ($signed((~^wire40)) >>> (~|(reg48 & reg48)))));
          reg48 <= {$signed((^reg47[(1'h0):(1'h0)])), (+wire43)};
          reg49 <= $signed((~^{reg49[(1'h0):(1'h0)]}));
        end
    end
  assign wire50 = $unsigned({reg46});
  assign wire51 = $unsigned((~|$unsigned(((^~wire44) * $signed(wire50)))));
  assign wire52 = wire42[(4'h9):(3'h4)];
  assign wire53 = $signed(wire42);
  assign wire54 = (((({(8'ha3)} || (reg46 ?
                      wire43 : (8'ha9))) * $signed(wire42[(4'he):(3'h4)])) >>> wire44) == wire43[(3'h7):(1'h0)]);
  module55 #() modinst77 (wire76, clk, wire52, reg48, wire42, reg46);
  assign wire78 = wire53[(3'h4):(1'h0)];
  assign wire79 = $unsigned($signed(reg48));
  assign wire80 = wire43[(3'h6):(1'h1)];
  assign wire81 = $signed(wire53);
  assign wire82 = (($signed((~|$signed(wire51))) ?
                          $unsigned(($signed(wire52) ?
                              reg48[(4'hb):(1'h1)] : (wire42 ?
                                  wire78 : (8'hab)))) : $unsigned((((7'h44) >>> wire54) ^ {wire79}))) ?
                      (wire53 ~^ (wire53[(1'h1):(1'h1)] ?
                          $unsigned((^~wire41)) : wire43[(4'hb):(3'h6)])) : wire40);
  assign wire83 = wire41[(5'h14):(3'h6)];
  assign wire84 = $unsigned(((+{$signed((8'ha5))}) ?
                      (((wire41 != wire78) > wire78) >= $unsigned((!wire79))) : (wire53[(3'h4):(3'h4)] ?
                          wire41[(3'h5):(3'h4)] : ((wire44 <= (8'hb9)) ?
                              (wire80 == wire44) : (wire53 ?
                                  wire78 : (8'ha5))))));
  always
    @(posedge clk) begin
      reg85 <= (wire81 ?
          $signed({$unsigned((reg49 ? wire81 : wire83))}) : (((wire50 ?
                      $unsigned(wire80) : $signed(wire44)) ?
                  {(^reg45)} : (~(!(8'h9f)))) ?
              (+$unsigned($signed(wire43))) : reg45));
      reg86 <= (!wire44);
      reg87 <= {((~|(8'hb7)) != reg45),
          ((wire81[(2'h3):(2'h3)] ?
              ((8'ha2) > wire50[(3'h6):(3'h4)]) : {wire79}) & {((wire52 ?
                      (8'ha6) : wire42) ?
                  ((8'hb2) ? reg85 : wire40) : {(8'hb9), reg45})})};
    end
  assign wire88 = wire42[(5'h13):(2'h3)];
  assign wire89 = (^wire88);
  assign wire90 = (((reg49[(3'h7):(3'h4)] ?
                          $signed($signed((8'hb9))) : wire52[(3'h6):(3'h5)]) || wire40[(4'hb):(1'h1)]) ?
                      wire41[(3'h7):(1'h0)] : {wire52});
  assign wire91 = $signed({(7'h42)});
  assign wire92 = $signed((($unsigned({wire82}) ?
                          ($signed(wire90) ?
                              (!wire53) : $unsigned(wire51)) : $unsigned($unsigned(reg49))) ?
                      reg85 : ($unsigned(wire88[(4'h8):(3'h7)]) ?
                          ((8'hb6) ?
                              $signed(wire52) : wire83) : (&{(7'h42)}))));
  assign wire93 = wire78;
  assign wire94 = $unsigned(wire80[(4'hd):(1'h1)]);
endmodule

module module55
#(parameter param75 = (|{(((8'hb9) ? {(8'h9e)} : {(8'ha3)}) != ({(8'ha6), (8'hba)} ? ((8'hbc) ? (8'hb0) : (8'ha2)) : ((8'ha8) ^~ (8'hb0)))), (!((~&(8'ha2)) ? (&(8'hbd)) : {(8'hb0), (8'ha3)}))}))
(y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire59;
  input wire [(4'ha):(1'h0)] wire58;
  input wire signed [(3'h5):(1'h0)] wire57;
  input wire [(5'h11):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire74;
  wire signed [(5'h12):(1'h0)] wire73;
  wire signed [(3'h6):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire71;
  wire signed [(4'h8):(1'h0)] wire70;
  wire [(4'h8):(1'h0)] wire69;
  wire [(2'h3):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire67;
  wire [(4'h9):(1'h0)] wire66;
  wire signed [(4'hd):(1'h0)] wire65;
  wire signed [(4'hc):(1'h0)] wire64;
  wire signed [(4'h9):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire60;
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire61,
                 wire60,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire60 = wire59;
  assign wire61 = wire60[(5'h11):(4'hb)];
  always
    @(posedge clk) begin
      reg62 <= wire57;
      reg63 <= wire57;
    end
  assign wire64 = wire60;
  assign wire65 = (~^wire60);
  assign wire66 = wire65[(2'h3):(1'h1)];
  assign wire67 = $signed(((&wire60) & $unsigned((wire60 ?
                      wire58 : reg62[(4'he):(3'h7)]))));
  assign wire68 = reg63;
  assign wire69 = wire66[(2'h2):(1'h1)];
  assign wire70 = wire64[(4'ha):(4'h8)];
  assign wire71 = $signed({{({reg62, reg62} ^~ (wire61 ? reg63 : wire64))},
                      $signed({wire60[(4'he):(3'h4)]})});
  assign wire72 = $unsigned((|$unsigned($unsigned($unsigned(reg63)))));
  assign wire73 = $signed((wire59 >= {wire70,
                      $unsigned((wire56 ? wire58 : wire57))}));
  assign wire74 = $signed(reg62);
endmodule
