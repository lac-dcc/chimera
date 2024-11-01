module top
#(parameter param107 = ((((((7'h44) ? (8'ha1) : (8'haa)) ? {(8'hb6)} : {(8'had)}) << (^((8'ha4) <<< (8'ha0)))) ? (((~&(8'hb5)) < {(8'ha4), (8'hb1)}) <= (&{(8'hbb), (8'hb8)})) : {((8'ha8) ? (|(8'hae)) : ((8'hab) ? (8'hbe) : (8'ha4))), (((8'ha9) ? (8'had) : (8'hab)) || ((8'h9d) ? (8'hbc) : (8'hbc)))}) ? (((((7'h44) && (8'hae)) ? ((8'ha6) && (8'ha6)) : ((8'haa) ? (8'ha9) : (8'hb2))) == {{(8'hb5), (8'hbd)}}) ? (((|(7'h41)) ? ((8'hb5) ? (8'hb3) : (8'had)) : ((8'hb3) != (7'h43))) > (((8'ha3) < (8'hb5)) && ((8'hbf) ? (8'ha7) : (8'hbf)))) : (-({(8'ha5), (8'ha6)} ~^ ((8'ha2) ? (8'ha1) : (8'ha3))))) : (((((8'hb8) ? (8'ha4) : (8'h9f)) << (!(8'ha7))) ? (((8'ha9) ^ (8'hb2)) ? ((8'haa) <= (8'haf)) : (~|(8'h9c))) : ((^~(8'hb0)) < ((8'hbf) + (8'ha9)))) || (^((-(8'ha5)) ? (+(7'h44)) : ((8'had) << (8'hab)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h261):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  wire signed [(4'hc):(1'h0)] wire106;
  wire signed [(5'h11):(1'h0)] wire97;
  wire signed [(5'h13):(1'h0)] wire96;
  wire signed [(5'h14):(1'h0)] wire95;
  wire [(3'h4):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire13;
  wire signed [(4'h9):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire80;
  reg signed [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(5'h10):(1'h0)] reg103 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg99 = (1'h0);
  reg [(4'hd):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(4'hb):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg [(5'h10):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(4'hc):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg83 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg82 = (1'h0);
  reg [(2'h3):(1'h0)] reg4 = (1'h0);
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  assign y = {wire106,
                 wire97,
                 wire96,
                 wire95,
                 wire11,
                 wire12,
                 wire13,
                 wire15,
                 wire26,
                 wire80,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg14,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire0[(2'h2):(1'h1)];
      reg5 <= {(8'ha7),
          $unsigned((wire3[(4'h9):(4'h8)] >= $unsigned((wire2 == (8'hbc)))))};
      reg6 <= (~|(($unsigned(wire3) ?
              wire3[(3'h7):(1'h0)] : ((8'hb3) ?
                  (wire1 ? wire0 : reg5) : (|wire3))) ?
          reg5[(3'h6):(3'h5)] : (((reg5 ~^ wire3) ^~ wire0[(4'hc):(1'h1)]) & (+$signed(wire3)))));
      reg7 <= $signed((^wire2[(2'h2):(1'h1)]));
      if ($unsigned((|$unsigned($signed(((8'hbc) ? wire3 : wire0))))))
        begin
          if (wire3)
            begin
              reg8 <= (!$unsigned($unsigned(wire1[(4'hb):(3'h5)])));
              reg9 <= reg6[(1'h1):(1'h1)];
            end
          else
            begin
              reg8 <= (-wire0);
              reg9 <= (wire3 ?
                  (8'hab) : (((reg7[(2'h2):(2'h2)] <<< $unsigned(reg9)) == $signed(wire2)) ?
                      ((|(reg7 ? reg9 : reg6)) ?
                          (~|(reg9 || reg8)) : $signed(wire2)) : reg6[(1'h0):(1'h0)]));
            end
          reg10 <= (reg7[(1'h1):(1'h1)] ?
              $unsigned(((reg7 ? reg4 : (reg6 * reg6)) ?
                  (wire1 - reg8) : $signed($signed(wire1)))) : ({({reg7} ?
                      (8'hb1) : (^~wire2)),
                  $unsigned({reg5})} > (~^$unsigned((~^(8'ha5))))));
        end
      else
        begin
          reg8 <= reg8;
          reg9 <= $unsigned($signed(reg10[(4'h9):(4'h8)]));
        end
    end
  assign wire11 = (+{(8'hb7),
                      $unsigned((((7'h42) | reg8) ?
                          (^~wire2) : (wire2 ? reg7 : reg10)))});
  assign wire12 = $unsigned($unsigned(reg9));
  assign wire13 = ((($signed((reg7 ^~ wire3)) > ((-wire0) <<< reg8[(4'hb):(3'h5)])) ?
                      (((reg9 <<< wire3) < (wire1 ? reg5 : reg5)) ?
                          reg7[(1'h1):(1'h1)] : reg10) : (((reg7 && reg10) ^ wire3) * $unsigned((wire12 ?
                          (8'hb9) : (8'ha4))))) > {$unsigned($signed((&wire12))),
                      {wire0}});
  always
    @(posedge clk) begin
      reg14 <= reg4;
    end
  assign wire15 = $signed(reg4[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if (((&$signed($signed($signed(wire0)))) ?
          ((~^(~|$unsigned(wire2))) ~^ $unsigned($unsigned((reg5 ?
              wire12 : (8'hb4))))) : (+wire0)))
        begin
          reg16 <= (8'hae);
          reg17 <= (&(~^(((&wire15) ?
              $unsigned((8'hbc)) : (reg9 ?
                  wire15 : wire3)) ^~ (~|reg5[(4'ha):(4'ha)]))));
          reg18 <= (reg10[(1'h0):(1'h0)] ?
              {{wire13, reg4},
                  (({reg17, reg7} ?
                          (reg5 ? reg8 : wire13) : (reg17 ? reg9 : reg9)) ?
                      (reg6[(3'h6):(3'h4)] ?
                          reg7 : (^~wire11)) : $signed($signed(wire12)))} : wire12);
          reg19 <= {reg17[(2'h3):(1'h0)],
              ((~wire3[(3'h6):(3'h6)]) ?
                  {$signed(reg4),
                      wire1[(4'h8):(1'h0)]} : (^(~$signed((8'ha5)))))};
        end
      else
        begin
          if ((((reg4[(1'h1):(1'h0)] ?
                  (((8'hb1) * wire2) >>> ((8'hb1) ^ reg6)) : wire3) ?
              ($unsigned((^(8'hb7))) ?
                  reg19[(1'h0):(1'h0)] : reg9) : ((-$unsigned(wire11)) && reg7[(1'h0):(1'h0)])) + wire1[(3'h4):(2'h3)]))
            begin
              reg16 <= $unsigned((($signed(reg16) <<< reg4) ?
                  reg9 : (~^(wire2[(2'h2):(2'h2)] ?
                      (~^reg19) : {wire12, reg4}))));
              reg17 <= (reg9[(1'h0):(1'h0)] ?
                  $signed($unsigned({wire12,
                      wire11[(1'h1):(1'h0)]})) : (^~(^$unsigned(wire15[(2'h3):(1'h1)]))));
              reg18 <= reg17[(1'h0):(1'h0)];
            end
          else
            begin
              reg16 <= ($signed((^(reg19 && (wire0 ? reg10 : wire12)))) ?
                  reg10 : $signed($unsigned(($unsigned(reg5) ?
                      wire13 : wire13))));
              reg17 <= (($unsigned(((^~reg17) ~^ (reg9 || wire13))) ?
                      reg5[(1'h0):(1'h0)] : {(+$unsigned(reg16))}) ?
                  (((reg14[(1'h0):(1'h0)] ?
                          (wire11 > reg7) : reg19[(4'h9):(2'h2)]) ^~ $signed((reg10 ?
                          reg18 : wire3))) ?
                      (wire11[(1'h1):(1'h1)] | $unsigned($unsigned(wire15))) : wire2[(2'h3):(1'h0)]) : $signed($unsigned((!$unsigned(reg6)))));
              reg18 <= $unsigned(reg14[(1'h0):(1'h0)]);
              reg19 <= reg14[(1'h0):(1'h0)];
            end
          if ((-($unsigned((8'h9e)) ^~ reg6)))
            begin
              reg20 <= $unsigned(($signed(((^reg10) ^ reg8[(4'hb):(3'h6)])) <<< wire15[(1'h1):(1'h1)]));
              reg21 <= ({wire3[(3'h5):(3'h4)]} ?
                  (^{$unsigned(reg7), reg8}) : (~|(~^reg6)));
              reg22 <= wire13[(3'h4):(2'h2)];
            end
          else
            begin
              reg20 <= ($signed($signed({$signed(reg22)})) != {((&$signed(wire12)) && (~^$signed(reg22)))});
            end
          reg23 <= $signed($signed($unsigned({$signed((8'haa)), (^~reg21)})));
          reg24 <= reg5;
        end
      reg25 <= (!(~|$signed(wire0)));
    end
  assign wire26 = reg21[(4'hf):(4'hb)];
  module27 #() modinst81 (wire80, clk, reg23, reg17, reg7, wire1);
  always
    @(posedge clk) begin
      reg82 <= reg20[(3'h5):(2'h2)];
    end
  always
    @(posedge clk) begin
      if ((($unsigned(({reg8, wire3} ?
          $signed(reg14) : {reg25})) <= $signed((&reg4[(1'h0):(1'h0)]))) >> $unsigned($unsigned((wire13[(3'h6):(3'h5)] ?
          {reg8, wire15} : reg6)))))
        begin
          reg83 <= (reg21[(4'h9):(4'h8)] != $unsigned(($signed((!wire1)) ~^ $signed((reg22 ?
              wire1 : reg8)))));
          reg84 <= (wire80 ?
              (reg83 ~^ $signed(((~^wire11) ?
                  (&reg25) : reg4[(2'h3):(1'h0)]))) : {$signed($signed($signed(wire0))),
                  ({$unsigned(wire11)} || $unsigned(reg16))});
          if ($signed((~|(~^reg14))))
            begin
              reg85 <= $signed((~&{reg82, $signed({(7'h42)})}));
              reg86 <= $signed($unsigned((|(((8'ha0) >>> reg17) ?
                  {reg85, reg5} : $unsigned(wire80)))));
              reg87 <= $signed(((~|$unsigned($unsigned(wire26))) ?
                  $signed(wire11[(3'h4):(3'h4)]) : $unsigned(((reg5 ?
                      wire1 : (8'ha0)) != $signed((8'hb7))))));
              reg88 <= $unsigned((!reg23));
              reg89 <= ((~|(-(!{reg84, (8'h9f)}))) > wire13[(3'h5):(1'h0)]);
            end
          else
            begin
              reg85 <= reg85;
              reg86 <= (~wire0);
              reg87 <= {$signed((reg25 + reg10)),
                  $signed((($unsigned((7'h42)) <= wire3[(4'hb):(3'h7)]) ?
                      $signed((reg17 == wire1)) : $signed((^~wire15))))};
            end
          reg90 <= reg17;
        end
      else
        begin
          reg83 <= (($unsigned($signed($unsigned(reg5))) ?
                  $signed((reg9 ? {(8'ha4), reg14} : reg86)) : (((!wire12) ?
                      $unsigned(reg22) : reg87) > {((8'hbf) <= wire2),
                      reg88[(1'h0):(1'h0)]})) ?
              (-reg10) : $unsigned($signed(reg10)));
          reg84 <= $unsigned((wire2 >>> $unsigned(wire0[(4'hd):(4'h8)])));
          reg85 <= $signed($unsigned((~|($unsigned(reg83) >>> reg5[(3'h5):(3'h5)]))));
          reg86 <= wire26[(4'he):(4'hb)];
        end
      if ((~&((((reg19 >= reg83) ? reg8 : ((8'hb7) ? (8'hb4) : wire11)) ?
          reg22 : reg90[(2'h3):(1'h1)]) * wire13[(3'h5):(3'h4)])))
        begin
          reg91 <= reg17;
          reg92 <= reg22[(3'h4):(1'h0)];
          reg93 <= $signed($signed({reg86[(3'h6):(3'h4)],
              reg84[(3'h5):(1'h0)]}));
        end
      else
        begin
          reg91 <= reg83[(4'hc):(3'h4)];
          reg92 <= (~reg16);
          reg93 <= ($unsigned((~reg18)) ?
              reg7 : $unsigned((^$signed($signed(reg82)))));
          reg94 <= (({((^wire2) ? ((7'h44) | wire80) : wire13[(3'h5):(3'h4)]),
                  (8'h9e)} * ({(reg82 ? reg92 : reg17),
                  reg84[(4'hc):(3'h6)]} ~^ (+$unsigned((8'h9f))))) ?
              $unsigned($signed($unsigned($unsigned(wire13)))) : $unsigned((8'h9f)));
        end
    end
  assign wire95 = $signed(((($unsigned((8'hab)) - {wire3, reg23}) ?
                          reg85 : $signed(reg25[(3'h6):(2'h3)])) ?
                      $unsigned(($unsigned(wire12) ?
                          (wire12 < reg10) : (reg20 + reg90))) : (wire11 ~^ $signed($unsigned((8'ha6))))));
  assign wire96 = (!(^$signed(($signed((8'hab)) || reg20))));
  assign wire97 = $signed($unsigned((($signed(wire95) >> $signed(reg92)) - ($unsigned(wire15) > $unsigned(reg14)))));
  always
    @(posedge clk) begin
      reg98 <= $signed($unsigned($unsigned(reg91[(4'ha):(2'h2)])));
      if ($signed(({(reg93 ?
              reg21[(4'hd):(2'h2)] : (^reg25))} ^ (^~(reg90 >>> wire80[(4'he):(3'h5)])))))
        begin
          reg99 <= wire1;
          reg100 <= ((|$signed($unsigned((reg20 <<< reg21)))) ?
              (^~((8'haa) >> ({reg25} ?
                  reg99 : (reg4 ? wire2 : reg7)))) : reg10);
          if ($unsigned($unsigned($unsigned($unsigned($signed((8'h9f)))))))
            begin
              reg101 <= reg24[(3'h5):(3'h4)];
              reg102 <= reg6;
              reg103 <= $signed(($signed(($unsigned(wire11) ?
                  wire96 : $unsigned(reg87))) * ({wire15[(2'h3):(1'h1)],
                  reg98} * $signed((wire0 ? wire0 : reg100)))));
              reg104 <= (~^$unsigned($unsigned({$unsigned(reg9),
                  $unsigned(reg99)})));
            end
          else
            begin
              reg101 <= $unsigned($signed(reg99[(2'h3):(1'h0)]));
              reg102 <= reg101;
              reg103 <= {wire15};
              reg104 <= {(reg103[(4'hb):(2'h2)] ?
                      (7'h42) : (wire97[(5'h10):(4'h8)] ?
                          $unsigned((^~reg99)) : $unsigned({wire1, reg14})))};
            end
          reg105 <= $unsigned(({reg92[(1'h1):(1'h0)],
              ((^reg19) ?
                  (reg98 > wire97) : $signed(reg8))} >= (~&$signed($signed(reg94)))));
        end
      else
        begin
          reg99 <= reg87[(3'h7):(3'h7)];
        end
    end
  assign wire106 = $signed(reg23);
endmodule

module module27  (y, clk, wire28, wire29, wire30, wire31);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire28;
  input wire [(5'h14):(1'h0)] wire29;
  input wire [(2'h2):(1'h0)] wire30;
  input wire signed [(4'hb):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire79;
  wire signed [(5'h15):(1'h0)] wire77;
  wire [(3'h7):(1'h0)] wire76;
  wire [(3'h5):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire46;
  wire [(4'h9):(1'h0)] wire74;
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  assign y = {wire79,
                 wire77,
                 wire76,
                 wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire74,
                 reg78,
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
      if ({(~&wire31[(4'hb):(4'h9)]),
          $unsigned({$unsigned($unsigned(wire30)), {(wire29 == wire30)}})})
        begin
          reg32 <= $signed({wire28[(2'h2):(1'h0)], wire31[(2'h2):(1'h0)]});
          reg33 <= ((wire30 != (8'had)) ?
              (~|(($unsigned((7'h41)) - (wire30 || wire28)) ?
                  ((^wire30) ?
                      {wire29,
                          wire30} : $unsigned((8'hb6))) : $signed({wire31}))) : {(|$unsigned(wire29)),
                  {($unsigned(reg32) ?
                          (wire28 ? reg32 : reg32) : (wire29 && wire29))}});
          reg34 <= (((|$unsigned((wire29 ?
              (7'h41) : (8'hab)))) ^ $unsigned({(&wire28)})) ^~ reg33[(2'h3):(2'h2)]);
          if ($signed({wire29}))
            begin
              reg35 <= wire28[(2'h2):(1'h0)];
              reg36 <= $unsigned(((~^wire29[(4'hc):(1'h1)]) ?
                  $signed(wire29) : ((reg35[(2'h2):(1'h1)] ?
                          (^~reg35) : reg32[(4'h8):(4'h8)]) ?
                      (reg34 == reg32[(4'hc):(2'h2)]) : wire31)));
              reg37 <= (~^reg36[(2'h2):(2'h2)]);
              reg38 <= $signed(({(~^$unsigned((8'hba)))} ^~ {reg34[(1'h0):(1'h0)]}));
              reg39 <= ($signed(reg37[(4'hc):(4'h9)]) | $signed((reg35 >>> $signed($signed(wire30)))));
            end
          else
            begin
              reg35 <= {$signed({$signed($signed(reg36)), (~wire30)}),
                  (reg33 || $unsigned(($unsigned(reg38) ?
                      (wire29 ? (8'hbb) : reg34) : reg36)))};
              reg36 <= $unsigned(((reg34 ?
                  {(wire31 ? reg36 : (8'h9d))} : (8'hb1)) - $signed(reg37)));
              reg37 <= $signed(reg34[(4'h9):(4'h8)]);
              reg38 <= ((((^~(reg33 ? reg36 : (8'ha8))) ?
                  ($signed((8'hb9)) == wire31[(2'h2):(1'h1)]) : {(wire29 ?
                          reg36 : reg33)}) ^ $unsigned(((reg39 ?
                      reg33 : wire29) ?
                  $signed(wire29) : ((8'had) || reg37)))) ^ ($unsigned(wire30[(1'h0):(1'h0)]) << (+wire31)));
            end
        end
      else
        begin
          if ($unsigned(reg37))
            begin
              reg32 <= reg33[(2'h2):(2'h2)];
              reg33 <= (|({(&wire31), wire28} ~^ (($unsigned(reg39) ?
                      wire31[(3'h7):(1'h1)] : reg34) ?
                  $signed($unsigned(reg38)) : reg37[(4'hf):(3'h7)])));
              reg34 <= reg34;
            end
          else
            begin
              reg32 <= $unsigned(({(!((7'h41) | wire28)), $signed(wire28)} ?
                  $signed({reg35, reg36}) : $unsigned(reg36[(2'h3):(2'h2)])));
              reg33 <= (+(~|(($signed((7'h44)) ?
                  wire31[(4'h8):(3'h6)] : (reg35 ?
                      wire30 : (8'hb4))) & $unsigned((&wire30)))));
              reg34 <= $signed($signed(((reg37 >>> (wire30 ?
                  wire31 : (8'hb6))) == $signed($unsigned(reg38)))));
              reg35 <= ($unsigned($signed((!{reg32}))) ?
                  (~&(((wire31 ? reg39 : wire31) != $unsigned(wire29)) ?
                      wire29 : wire30[(2'h2):(1'h0)])) : $unsigned(($signed(reg36) ^~ ({reg36} ?
                      wire28 : $unsigned(reg38)))));
            end
          reg36 <= reg32;
        end
      reg40 <= reg35[(1'h1):(1'h0)];
      reg41 <= $unsigned(reg39);
      reg42 <= $signed($signed((8'hbf)));
    end
  assign wire43 = $signed({wire31[(4'hb):(2'h3)],
                      (~|($unsigned(wire31) ?
                          {reg42, wire31} : reg38[(1'h1):(1'h0)]))});
  assign wire44 = reg34[(4'ha):(3'h7)];
  assign wire45 = $signed({reg38[(1'h1):(1'h1)]});
  assign wire46 = (reg35 || (wire43 << $signed((&((8'hb9) ?
                      wire30 : wire28)))));
  module47 #() modinst75 (.wire51(reg37), .wire50(reg36), .wire48(wire29), .wire52(reg32), .wire49(reg34), .y(wire74), .clk(clk));
  assign wire76 = $unsigned(((wire74[(3'h4):(1'h1)] | $signed(reg36[(5'h11):(4'hf)])) ?
                      {{(wire43 << wire28), (wire29 ? reg36 : (8'hb4))},
                          $signed($unsigned(wire30))} : $unsigned(($signed(reg33) ?
                          reg39[(1'h0):(1'h0)] : (wire44 && reg38)))));
  assign wire77 = wire28;
  always
    @(posedge clk) begin
      reg78 <= wire74[(4'h9):(4'h8)];
    end
  assign wire79 = (~^((^~$signed($signed(reg34))) == (reg42[(2'h2):(2'h2)] >>> reg33[(2'h3):(2'h3)])));
endmodule

module module47
#(parameter param72 = (~^({(((8'ha1) ? (8'hae) : (8'hac)) < (&(8'hac)))} < ((^((8'ha7) ? (8'hac) : (8'hab))) >>> ((~|(8'ha8)) <= (8'hb9))))), 
parameter param73 = {{(!(^(~^(8'hb7)))), ((8'ha7) ? (8'hbe) : {param72})}})
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire52;
  input wire [(5'h14):(1'h0)] wire51;
  input wire [(5'h12):(1'h0)] wire50;
  input wire [(4'he):(1'h0)] wire49;
  input wire [(2'h3):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire70;
  wire [(4'hf):(1'h0)] wire69;
  wire [(5'h15):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire67;
  wire signed [(5'h12):(1'h0)] wire66;
  wire [(2'h2):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire53;
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(4'ha):(1'h0)] reg54 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire53,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire53 = $signed(wire50[(4'hc):(4'h8)]);
  always
    @(posedge clk) begin
      reg54 <= $signed(wire52);
      reg55 <= $unsigned((wire51 ?
          (~^wire48[(2'h3):(1'h1)]) : ((~&wire53) != $signed((wire52 ?
              reg54 : wire53)))));
    end
  always
    @(posedge clk) begin
      reg56 <= wire51;
      reg57 <= ($unsigned({($signed(reg56) ?
                  (wire53 ? (8'h9c) : wire50) : ((8'ha3) ? reg56 : wire49))}) ?
          (~^$unsigned((&$signed(reg55)))) : ($signed(wire52) ? reg54 : reg56));
      reg58 <= $unsigned(($unsigned(((wire51 ? reg57 : (8'haf)) == (reg56 ?
              reg54 : wire51))) ?
          (reg54[(1'h1):(1'h1)] ?
              $signed($unsigned(wire50)) : $signed((~|wire53))) : (^~((wire49 >= wire53) ?
              (wire51 ? wire51 : (7'h43)) : $unsigned(wire53)))));
      reg59 <= $unsigned($signed($signed(wire49[(4'hd):(3'h7)])));
      if ((reg59 || $unsigned((&(!reg54)))))
        begin
          reg60 <= (+$signed((~^$signed(wire49))));
          reg61 <= ($unsigned($signed($signed(reg60[(1'h0):(1'h0)]))) * $unsigned(reg56[(4'h8):(2'h2)]));
          reg62 <= ({(wire53 == reg59)} ?
              reg61 : $unsigned((~|((reg54 ?
                  reg54 : wire53) - $unsigned(reg58)))));
          reg63 <= {($signed($unsigned($signed(reg61))) ?
                  ($signed((reg58 >= (8'ha4))) ^~ (wire52 ^~ $unsigned(reg54))) : (&$unsigned((|wire49)))),
              wire53[(3'h4):(3'h4)]};
        end
      else
        begin
          reg60 <= $signed($unsigned(wire53));
          reg61 <= {reg55};
        end
    end
  assign wire64 = $signed((((~|(reg63 ^ (8'ha0))) ?
                          wire49[(3'h6):(2'h2)] : ((reg62 >> wire49) ?
                              $unsigned(reg60) : (reg55 ? reg59 : reg59))) ?
                      wire51[(5'h10):(4'hb)] : (^~$signed($signed(wire52)))));
  assign wire65 = ((^reg59) ?
                      wire53 : $signed((!(reg62[(4'h8):(3'h5)] || wire50))));
  assign wire66 = ($signed(reg55[(3'h4):(1'h0)]) ^~ $unsigned(wire53));
  assign wire67 = (reg59[(3'h4):(2'h2)] ?
                      (~^reg58) : (reg54[(1'h0):(1'h0)] ?
                          $signed((~|(reg58 | wire66))) : (((reg59 ?
                                  reg55 : wire49) ?
                              (wire66 > wire66) : wire65) ~^ (~&{(8'hb9),
                              wire48}))));
  assign wire68 = reg55;
  assign wire69 = reg63;
  assign wire70 = (&wire53);
  assign wire71 = (($unsigned($signed((8'ha8))) ^~ (+(~&wire64))) ?
                      wire68[(1'h1):(1'h1)] : reg59);
endmodule
