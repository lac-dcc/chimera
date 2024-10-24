module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h313):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire130;
  wire signed [(2'h3):(1'h0)] wire108;
  wire signed [(5'h15):(1'h0)] wire107;
  wire [(5'h14):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire105;
  wire signed [(3'h5):(1'h0)] wire104;
  wire signed [(2'h2):(1'h0)] wire102;
  wire signed [(4'h9):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg129 = (1'h0);
  reg [(5'h12):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg127 = (1'h0);
  reg [(2'h2):(1'h0)] reg126 = (1'h0);
  reg [(4'hb):(1'h0)] reg125 = (1'h0);
  reg [(4'h9):(1'h0)] reg124 = (1'h0);
  reg [(5'h14):(1'h0)] reg123 = (1'h0);
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg [(4'hf):(1'h0)] reg121 = (1'h0);
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(2'h2):(1'h0)] reg119 = (1'h0);
  reg [(3'h6):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg117 = (1'h0);
  reg [(4'he):(1'h0)] reg116 = (1'h0);
  reg [(4'h8):(1'h0)] reg115 = (1'h0);
  reg [(3'h6):(1'h0)] reg114 = (1'h0);
  reg [(4'h8):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg [(4'h9):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  assign y = {wire130,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire102,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire7,
                 wire6,
                 wire5,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
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
                 reg24,
                 reg25,
                 reg26,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 (1'h0)};
  assign wire5 = $unsigned((8'hb3));
  assign wire6 = wire5[(3'h5):(2'h3)];
  assign wire7 = {{wire0[(1'h1):(1'h0)], wire5[(3'h4):(1'h1)]}};
  always
    @(posedge clk) begin
      reg8 <= wire6;
      reg9 <= reg8;
      if ((wire5[(3'h6):(1'h1)] == ($signed(wire7[(2'h2):(1'h0)]) ?
          wire4[(1'h0):(1'h0)] : (^~{(^~reg8), (|(8'hab))}))))
        begin
          if ((!((8'hb9) ~^ ({(reg8 ? wire0 : wire2), (7'h44)} ?
              $unsigned(reg9[(3'h4):(2'h3)]) : $signed({wire2})))))
            begin
              reg10 <= $unsigned(({(~wire3)} ?
                  $signed({$unsigned(reg8)}) : $unsigned((~^$signed(wire4)))));
              reg11 <= (~{(^~{wire5[(3'h4):(1'h1)]}), reg10});
              reg12 <= (~&reg10[(4'h8):(1'h0)]);
              reg13 <= $unsigned($unsigned((~&($unsigned(wire5) ?
                  reg10 : reg10[(4'hc):(3'h5)]))));
            end
          else
            begin
              reg10 <= wire6[(1'h0):(1'h0)];
              reg11 <= wire6[(3'h4):(2'h2)];
              reg12 <= $unsigned(wire4);
              reg13 <= (reg12[(1'h0):(1'h0)] ? (8'ha2) : wire7);
            end
          reg14 <= $signed(((~^reg13) != (-(reg13 - $unsigned(wire0)))));
          reg15 <= ((wire4[(4'h8):(1'h1)] * (|wire7)) & (~&(wire1 && {$signed(wire2)})));
          if ((~^(8'ha7)))
            begin
              reg16 <= (8'hbc);
              reg17 <= (^(~&$signed($signed($signed(reg15)))));
              reg18 <= (((wire6 < reg12) ?
                  {wire2[(4'he):(2'h3)],
                      wire1} : $signed($unsigned($unsigned(wire7)))) <= ($unsigned(reg14) ^~ (((reg14 ?
                      wire2 : reg10) ?
                  reg12 : (7'h42)) < wire6[(2'h2):(1'h1)])));
              reg19 <= $signed((({((8'hbd) ? reg15 : wire0)} ?
                  $signed((reg13 + wire6)) : (8'h9e)) >> (wire1 << reg18[(2'h3):(1'h1)])));
            end
          else
            begin
              reg16 <= ($signed((8'haa)) * (({$signed(reg10),
                      (reg19 ? reg11 : wire1)} ^ $signed((wire3 - reg9))) ?
                  $signed(wire1[(3'h5):(3'h5)]) : ((reg15 ?
                      reg9[(3'h4):(2'h3)] : $signed(wire5)) || {$unsigned(reg8),
                      {wire2, reg11}})));
            end
          reg20 <= {$signed(wire2[(4'hb):(4'h9)]),
              {$unsigned(reg12[(1'h0):(1'h0)])}};
        end
      else
        begin
          if (({$unsigned({$signed((8'ha9)), (reg9 - wire2)})} ?
              reg13[(3'h7):(3'h6)] : (|wire2)))
            begin
              reg10 <= $signed((reg11 >>> {(+(|(8'hab)))}));
              reg11 <= ((+(!$signed((8'hb3)))) ?
                  ($signed((((8'hb9) <<< (7'h40)) ?
                          (reg18 << (8'ha0)) : ((8'hba) >> wire5))) ?
                      $signed(wire2[(1'h0):(1'h0)]) : {wire2[(3'h5):(1'h0)]}) : wire3);
            end
          else
            begin
              reg10 <= $unsigned($unsigned($signed(reg9[(1'h0):(1'h0)])));
              reg11 <= (wire5[(3'h7):(2'h2)] ?
                  ((reg10[(2'h2):(2'h2)] << $signed($unsigned((8'ha9)))) ~^ {$signed({wire5})}) : (wire6 ~^ {wire4}));
              reg12 <= (+((((&reg14) <<< ((7'h42) ? reg9 : reg8)) ?
                      reg8 : $unsigned(reg15[(4'hd):(3'h4)])) ?
                  $signed((reg8 ? $signed(reg11) : (-wire6))) : {(8'hbc)}));
              reg13 <= ((^~($signed((~reg12)) - $signed($signed(wire6)))) - wire4);
              reg14 <= $signed((~$unsigned(($unsigned(reg18) << reg10[(3'h6):(1'h1)]))));
            end
          reg15 <= wire3;
          reg16 <= $unsigned(((|$unsigned({wire1})) <= $signed(((~^reg18) ?
              (wire4 <<< wire2) : wire0))));
        end
      reg21 <= $signed(($signed($signed(((8'hb4) ? wire1 : wire3))) ?
          (-((-wire2) ?
              (reg12 ?
                  reg20 : reg12) : $unsigned(reg9))) : {wire2[(2'h2):(2'h2)],
              reg16[(4'hb):(3'h6)]}));
      if ($signed((8'hbe)))
        begin
          reg22 <= reg15;
          reg23 <= wire2;
          reg24 <= $unsigned(($signed(reg21) + $unsigned((reg10[(4'h8):(1'h1)] == (~^wire5)))));
        end
      else
        begin
          if ($unsigned(((reg21[(1'h0):(1'h0)] ?
                  ((8'hb3) ^~ wire6[(3'h7):(3'h6)]) : $signed((8'h9f))) ?
              reg13[(1'h0):(1'h0)] : reg8)))
            begin
              reg22 <= $signed(reg23);
              reg23 <= $signed($signed(reg20));
            end
          else
            begin
              reg22 <= $signed({(~((+wire5) + reg20[(1'h0):(1'h0)]))});
            end
          reg24 <= wire0;
          reg25 <= {(reg16[(4'hc):(3'h6)] ?
                  $unsigned($unsigned(reg9[(2'h2):(1'h0)])) : (-$signed(wire1)))};
          reg26 <= ($signed({reg22[(1'h1):(1'h0)]}) ?
              (^($unsigned((reg11 + wire6)) ?
                  $unsigned((wire4 ?
                      reg21 : reg24)) : (reg17[(4'he):(3'h4)] + reg23[(4'hc):(2'h3)]))) : $signed((^~$signed(reg18[(2'h3):(2'h2)]))));
        end
    end
  assign wire27 = reg9;
  assign wire28 = (&(!reg26));
  assign wire29 = (((((wire3 < reg25) ? $signed(wire28) : (reg24 || wire7)) ?
                          ((reg17 ? wire7 : reg17) ?
                              $unsigned(reg22) : $unsigned(wire0)) : ((reg16 ?
                                  reg10 : reg23) ?
                              wire28 : ((8'hac) != (8'hab)))) ?
                      $unsigned(reg12[(2'h3):(2'h2)]) : (&($signed(wire28) ?
                          $signed(reg20) : (!reg10)))) >>> {{wire27,
                          (~&wire28)}});
  assign wire30 = reg17[(4'hf):(3'h6)];
  assign wire31 = $unsigned(reg22);
  assign wire32 = $signed(wire4);
  always
    @(posedge clk) begin
      reg33 <= $signed({reg10[(3'h5):(3'h4)]});
      reg34 <= $signed({reg22[(2'h3):(1'h0)],
          ($unsigned(reg18) ? $signed(reg25[(2'h3):(2'h3)]) : {reg11})});
      if ((|$unsigned(reg25[(2'h2):(1'h0)])))
        begin
          if (wire30[(2'h3):(1'h1)])
            begin
              reg35 <= $unsigned(((^~wire28) ~^ ($signed((reg10 ?
                      (8'ha4) : reg18)) ?
                  $signed($signed(wire27)) : $signed((!wire6)))));
              reg36 <= reg35[(1'h0):(1'h0)];
              reg37 <= (($unsigned($unsigned($unsigned(wire4))) <= wire27) ^ wire27[(3'h4):(2'h2)]);
              reg38 <= $signed($unsigned(((|$signed(wire6)) ?
                  $unsigned(reg18[(2'h3):(1'h1)]) : (!reg25[(1'h1):(1'h0)]))));
              reg39 <= reg25[(2'h3):(1'h0)];
            end
          else
            begin
              reg35 <= $signed((reg33[(3'h4):(2'h3)] >= $unsigned((((8'h9c) & wire3) ?
                  (wire6 ? reg8 : (8'ha9)) : (~|reg35)))));
              reg36 <= (reg13[(3'h6):(3'h5)] ?
                  (((^~(reg35 ? reg11 : reg11)) || $signed((wire6 + wire0))) ?
                      reg20 : reg14) : $signed((&$unsigned((wire4 ?
                      (8'ha5) : reg12)))));
              reg37 <= $signed($signed($signed({wire4[(3'h6):(3'h5)],
                  reg9[(3'h4):(2'h3)]})));
              reg38 <= wire27;
              reg39 <= {$unsigned({(8'hb3), {((8'ha4) ? reg21 : reg22)}}),
                  wire5};
            end
          reg40 <= wire6;
        end
      else
        begin
          if (reg20[(1'h0):(1'h0)])
            begin
              reg35 <= (~(reg10 - reg11[(4'hd):(4'hd)]));
            end
          else
            begin
              reg35 <= ({reg17, reg39} ?
                  reg16[(3'h4):(1'h0)] : {reg15,
                      (({wire0} * reg9[(3'h4):(3'h4)]) ?
                          (reg38 ?
                              $unsigned(reg38) : reg8) : (reg17[(5'h10):(4'he)] ?
                              $unsigned(reg16) : $unsigned(wire5)))});
              reg36 <= wire31;
              reg37 <= reg20[(2'h2):(1'h1)];
              reg38 <= reg14;
              reg39 <= ($unsigned(reg21) ?
                  ((!(((8'haf) ? (8'hb8) : wire0) ?
                          {(8'hb7)} : $unsigned(reg13))) ?
                      $signed($unsigned((reg9 ^~ reg23))) : (-$unsigned((reg8 >= reg11)))) : wire7);
            end
          reg40 <= $unsigned($unsigned(((^(~&reg9)) ?
              reg15[(3'h5):(3'h4)] : ($signed(wire1) <<< (wire32 < reg15)))));
          if ((+$unsigned($signed((reg8 ?
              $unsigned(reg22) : wire4[(3'h7):(2'h3)])))))
            begin
              reg41 <= wire5;
            end
          else
            begin
              reg41 <= $signed($signed(($signed($unsigned(reg10)) ?
                  $signed(wire4) : wire3)));
              reg42 <= $unsigned($unsigned((((reg19 - (8'hae)) ?
                      (reg19 ? reg26 : reg25) : ((8'hb8) ? reg22 : (8'hb0))) ?
                  $signed(reg26[(4'h8):(3'h6)]) : ({reg12} ?
                      (reg18 ? reg37 : (8'ha8)) : reg24[(3'h6):(2'h2)]))));
            end
          reg43 <= $signed(reg16);
          reg44 <= {({(~^$unsigned(reg12))} ?
                  (^~(+$unsigned(reg25))) : $signed((((8'h9f) | wire5) >>> $unsigned(reg8)))),
              $unsigned({$signed(reg23[(3'h7):(3'h6)])})};
        end
      reg45 <= reg42;
      reg46 <= {reg10, $signed($signed($signed((reg38 & reg35))))};
    end
  module47 #() modinst103 (.wire51(wire3), .wire49(reg13), .wire50(reg33), .wire52(wire5), .wire48(reg23), .y(wire102), .clk(clk));
  assign wire104 = $unsigned($unsigned(($unsigned((&(8'hac))) ?
                       $signed(reg26) : $signed({reg8}))));
  assign wire105 = $signed(($signed({(reg34 ? reg35 : reg39),
                           wire28[(2'h3):(2'h2)]}) ?
                       $unsigned((8'ha6)) : {wire6[(3'h6):(2'h2)]}));
  assign wire106 = reg45[(2'h2):(1'h1)];
  assign wire107 = wire106[(2'h3):(1'h0)];
  assign wire108 = $signed($signed($signed({$unsigned(reg18)})));
  always
    @(posedge clk) begin
      reg109 <= reg13;
      if ((reg13[(4'ha):(4'h9)] ? $signed(reg25) : $unsigned($signed(wire3))))
        begin
          reg110 <= (!{($signed(wire6) ?
                  reg18[(3'h4):(1'h0)] : (+(reg37 + wire6)))});
          reg111 <= ($unsigned($unsigned($signed($signed(reg43)))) << (reg20 >>> (+wire102[(1'h1):(1'h1)])));
        end
      else
        begin
          reg110 <= (((($unsigned(reg41) ?
                  ((8'hac) ? reg11 : reg42) : (wire2 ?
                      wire29 : reg9)) >= (reg18 ?
                  ((8'hb7) ? wire105 : (8'hac)) : reg21[(2'h2):(2'h2)])) ?
              (8'hb2) : $unsigned((+(reg21 > reg41)))) | $unsigned((~$signed($unsigned(reg24)))));
          reg111 <= (&($unsigned(wire4) * (reg11[(4'h8):(4'h8)] ?
              $signed(reg110[(4'hc):(3'h4)]) : wire104)));
          if ($unsigned(reg46[(1'h1):(1'h0)]))
            begin
              reg112 <= ({$unsigned((8'hbc)),
                  (~$unsigned({wire27, (8'ha0)}))} || reg13[(3'h7):(3'h5)]);
              reg113 <= $signed(reg9);
              reg114 <= (|reg44[(4'he):(3'h6)]);
              reg115 <= (-wire105[(2'h3):(1'h1)]);
            end
          else
            begin
              reg112 <= ((&wire108) | ($unsigned($unsigned(wire31[(2'h2):(1'h0)])) ?
                  reg13 : $unsigned(((wire27 <= (8'ha1)) ?
                      (~|reg17) : (wire102 < reg39)))));
              reg113 <= wire32;
              reg114 <= $signed($unsigned(reg14));
            end
          reg116 <= $signed({$unsigned(reg16)});
        end
      reg117 <= reg25[(2'h2):(1'h1)];
      reg118 <= (($signed($unsigned((~wire107))) ?
              reg21 : (((~|reg10) >> $unsigned(reg110)) ^~ $unsigned(wire2[(3'h5):(2'h3)]))) ?
          ({$signed((reg33 ? reg117 : reg39)),
                  $signed(((7'h44) ? wire7 : reg116))} ?
              reg35 : {$unsigned($unsigned(wire28)),
                  reg115}) : (&({$unsigned(wire107), wire107} * ((&(8'ha9)) ?
              reg112 : $signed(reg8)))));
      reg119 <= reg118[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      if (((reg119 ?
              ((!((8'ha0) ? reg19 : reg109)) ?
                  (-reg46) : $signed($signed(reg119))) : ({reg22[(4'ha):(3'h7)],
                  $signed(reg19)} * reg39[(3'h6):(3'h5)])) ?
          $signed(reg109) : {reg117, reg46}))
        begin
          reg120 <= ((~$signed(($signed((8'ha4)) ?
              $unsigned(wire4) : reg37[(1'h0):(1'h0)]))) >>> {(~^wire108[(2'h3):(1'h0)]),
              ($unsigned(reg114) ? reg18[(2'h2):(2'h2)] : (8'hb6))});
          reg121 <= wire2;
          reg122 <= {(wire107 ?
                  $unsigned((+reg8)) : (-(wire27 ?
                      (wire3 | reg35) : (wire2 ~^ reg12))))};
          if (((wire4[(3'h6):(1'h1)] ?
                  (~|{(wire3 ? reg110 : reg110)}) : reg110[(2'h3):(1'h0)]) ?
              (((~^reg36[(4'h9):(2'h2)]) ?
                      (wire27 <<< (reg25 - reg42)) : (wire29[(1'h1):(1'h1)] >>> $unsigned((8'haf)))) ?
                  (^(~^(reg26 | (8'ha7)))) : $signed((((8'hbe) || reg40) ?
                      (~reg26) : (reg20 ?
                          reg46 : wire31)))) : wire32[(2'h3):(1'h1)]))
            begin
              reg123 <= $unsigned(reg120[(3'h5):(1'h0)]);
              reg124 <= $signed((~|reg39));
              reg125 <= (((+reg46[(4'ha):(4'h9)]) * $signed(($unsigned(reg38) ?
                  (reg113 & reg39) : $signed(reg40)))) <<< reg42[(3'h6):(2'h2)]);
              reg126 <= wire102[(1'h1):(1'h1)];
            end
          else
            begin
              reg123 <= (({{{wire30, reg16}, wire105[(2'h2):(1'h0)]},
                      reg40[(5'h13):(3'h7)]} ?
                  (wire106[(5'h10):(2'h3)] < reg116) : ($signed($signed((8'ha9))) ?
                      reg112[(3'h4):(3'h4)] : (reg10 & (reg38 | reg23)))) ^ (8'hb6));
              reg124 <= $unsigned((-(!(wire1[(3'h6):(3'h4)] ?
                  (wire5 + reg121) : $unsigned(wire28)))));
              reg125 <= $signed(((^reg21[(1'h1):(1'h1)]) ?
                  {((~|reg11) ^~ ((8'haa) <= reg9))} : $unsigned(wire31)));
            end
          reg127 <= ((^~wire4) ?
              (8'ha4) : ($signed(((~&reg14) ?
                  $unsigned((8'haa)) : (~|reg124))) << reg46));
        end
      else
        begin
          if (((+((+(~(8'hbf))) <= reg120)) == $signed($unsigned($unsigned((^(8'ha5)))))))
            begin
              reg120 <= (!reg17[(2'h3):(2'h2)]);
              reg121 <= reg123[(1'h1):(1'h1)];
            end
          else
            begin
              reg120 <= $signed(wire4[(1'h0):(1'h0)]);
              reg121 <= $signed($unsigned((7'h41)));
              reg122 <= $unsigned((-$unsigned((&(~|(8'hbb))))));
              reg123 <= reg122;
            end
          reg124 <= (reg42 & (~wire4));
        end
      reg128 <= ((wire29 + $signed((8'had))) ?
          {$unsigned(reg17),
              ($unsigned(reg17[(3'h4):(1'h0)]) && reg112)} : $unsigned(reg116));
      reg129 <= {(({wire30[(1'h0):(1'h0)]} ?
              $signed(reg114) : {(reg23 >>> (8'h9d)),
                  reg120[(3'h6):(1'h1)]}) == wire29),
          reg11[(4'hb):(4'h8)]};
    end
  assign wire130 = $unsigned((((8'hb7) << ((wire30 <= reg126) && (reg8 * (7'h43)))) ?
                       (|$unsigned($unsigned(reg33))) : (&(&$unsigned((8'h9e))))));
endmodule

module module47
#(parameter param100 = (((!(^((8'hbc) ? (8'had) : (8'hb8)))) ? ((((8'hb5) ? (8'hb0) : (8'hb2)) > {(8'h9f), (8'h9f)}) > (((8'hae) ~^ (8'hb6)) >>> (+(8'ha6)))) : (~((+(8'ha4)) < ((8'ha8) ? (7'h40) : (8'hb3))))) ? (^(({(8'hb8)} ? ((8'had) >> (7'h43)) : (-(7'h40))) ? (8'hab) : (((8'hbf) ? (8'hb9) : (7'h43)) ~^ ((8'hb7) ? (8'hbf) : (8'ha3))))) : (~^(^~((!(7'h44)) <<< ((8'h9e) == (8'hb2)))))), 
parameter param101 = (({((param100 ? param100 : param100) ^ (~^param100))} >= {((-param100) ? ((8'ha7) >>> param100) : (|param100))}) & ((param100 || param100) ? (8'hac) : {{(8'hae), param100}, ({param100, param100} ? (param100 == param100) : (param100 ? param100 : param100))})))
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'h249):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire52;
  input wire [(4'he):(1'h0)] wire51;
  input wire signed [(5'h13):(1'h0)] wire50;
  input wire [(3'h4):(1'h0)] wire49;
  input wire [(4'h8):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire99;
  wire [(4'ha):(1'h0)] wire98;
  wire [(4'hf):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire75;
  wire signed [(4'he):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire67;
  wire [(4'h8):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire64;
  wire [(3'h4):(1'h0)] wire63;
  wire signed [(5'h13):(1'h0)] wire62;
  wire [(3'h5):(1'h0)] wire61;
  wire [(5'h12):(1'h0)] wire60;
  wire [(5'h11):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire53;
  reg signed [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg95 = (1'h0);
  reg [(5'h15):(1'h0)] reg94 = (1'h0);
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg81 = (1'h0);
  reg [(5'h10):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire76,
                 wire75,
                 wire74,
                 wire68,
                 wire67,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire53,
                 reg97,
                 reg96,
                 reg95,
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
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg66,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire53 = $unsigned((wire52[(3'h6):(1'h1)] ?
                      (({wire49} > $signed(wire50)) ?
                          {wire52, $signed((8'hbf))} : ({(8'haa)} ?
                              (7'h42) : (!wire50))) : wire50[(5'h12):(4'hb)]));
  always
    @(posedge clk) begin
      reg54 <= wire49;
      reg55 <= {$signed((^~((7'h42) ? (reg54 << reg54) : (^wire50)))),
          $unsigned(reg54[(4'hf):(2'h2)])};
      reg56 <= ($signed(((wire51 ?
          (wire52 ? wire50 : (8'hb3)) : wire48) >>> reg54)) || (reg54 ?
          $signed((^~wire48)) : (^$unsigned((~^reg54)))));
      reg57 <= $signed((8'ha1));
      reg58 <= {$signed((wire50 ? reg56 : (!((8'haf) ? wire49 : wire53)))),
          $signed((wire52 < (^~wire51)))};
    end
  assign wire59 = wire50;
  assign wire60 = ({$unsigned($unsigned(wire50))} ?
                      wire59 : ((^wire49) - {$signed((~&reg55))}));
  assign wire61 = $signed($signed(wire50[(1'h1):(1'h1)]));
  assign wire62 = (((^~((|reg55) ? (|(8'h9d)) : {(8'hb2), (8'hbc)})) ?
                      wire48[(2'h2):(2'h2)] : ((8'ha5) ?
                          (wire48 ? (8'hb1) : wire51[(4'h9):(4'h8)]) : ((reg54 ?
                              wire52 : wire48) != (reg57 <= wire59)))) ^ $unsigned(($signed((reg58 <<< wire52)) ^~ ((+wire52) > $signed(reg58)))));
  assign wire63 = (&wire52);
  assign wire64 = ($signed((reg57[(3'h5):(2'h3)] ~^ {{wire61,
                          wire61}})) ^ (~|$signed((8'ha6))));
  assign wire65 = (wire60[(3'h4):(3'h4)] ? $signed(wire59) : $signed(reg57));
  always
    @(posedge clk) begin
      reg66 <= $signed($signed((($signed(wire59) ?
          {wire53} : (8'ha4)) | $signed(wire64[(1'h0):(1'h0)]))));
    end
  assign wire67 = wire50[(5'h11):(5'h11)];
  assign wire68 = $signed(($unsigned((8'h9f)) ? reg57 : wire65));
  always
    @(posedge clk) begin
      reg69 <= ($signed(wire60[(1'h0):(1'h0)]) ?
          {wire61[(1'h0):(1'h0)]} : (wire63 ?
              (((wire49 ? wire52 : wire50) ?
                  $unsigned(wire52) : $signed(wire49)) == wire53[(4'hd):(4'hc)]) : $unsigned($unsigned((~|reg56)))));
      reg70 <= reg56[(1'h1):(1'h1)];
      reg71 <= {$signed($signed(reg54[(4'he):(4'hc)])), wire59[(3'h7):(1'h0)]};
      if (wire59)
        begin
          reg72 <= (8'ha3);
          reg73 <= $signed(reg55);
        end
      else
        begin
          reg72 <= {{(((reg66 != wire67) ?
                      ((8'h9f) ? wire53 : wire61) : (~|(8'hb9))) * wire68),
                  (reg70[(1'h0):(1'h0)] ? wire62[(5'h11):(1'h1)] : wire68)},
              $signed(reg73)};
          reg73 <= (7'h44);
        end
    end
  assign wire74 = ({$signed(($unsigned(wire62) && (reg56 ? wire52 : wire60)))} ?
                      {$unsigned($signed($unsigned(wire52))),
                          ({$unsigned(wire65)} ?
                              wire51 : wire50[(3'h5):(3'h5)])} : $unsigned(wire61));
  assign wire75 = $unsigned((reg57 != wire67));
  assign wire76 = $unsigned($unsigned(((wire65 ?
                          (wire74 ? (7'h42) : wire50) : wire64) ?
                      $unsigned($unsigned(wire68)) : $unsigned((wire62 ?
                          wire65 : reg54)))));
  always
    @(posedge clk) begin
      reg77 <= ($signed(((|wire52[(3'h7):(3'h5)]) ?
          reg66[(1'h0):(1'h0)] : {$unsigned((8'hb1)),
              (8'ha8)})) && $unsigned(wire76[(3'h4):(3'h4)]));
      reg78 <= (8'hba);
      if ($unsigned($unsigned(reg78[(3'h7):(3'h6)])))
        begin
          reg79 <= (reg77[(1'h0):(1'h0)] ?
              (&(($signed(reg72) ?
                  (wire49 == reg72) : (^wire59)) ~^ {$signed(wire65),
                  (reg69 ? reg70 : wire68)})) : wire61[(3'h5):(3'h4)]);
          if ($signed(((wire52[(5'h10):(4'he)] && $signed((wire50 * wire61))) ?
              reg56 : ($unsigned(wire53[(4'he):(1'h0)]) < {{(8'h9c)}}))))
            begin
              reg80 <= ($signed((~((reg79 * (7'h44)) ?
                      {(7'h43), reg72} : wire74))) ?
                  reg57 : $unsigned(wire75[(2'h3):(1'h0)]));
              reg81 <= (^($signed(wire53[(4'hf):(2'h2)]) >>> $signed({(wire52 >>> reg54),
                  reg69})));
            end
          else
            begin
              reg80 <= ((8'ha9) ? $signed(reg66) : $signed($unsigned(wire64)));
              reg81 <= wire59;
              reg82 <= ($signed($unsigned($signed((wire64 >> reg56)))) ?
                  (reg72[(3'h5):(1'h0)] || $signed(($signed((8'h9e)) + reg57))) : reg56[(3'h5):(2'h2)]);
              reg83 <= (8'hb0);
              reg84 <= wire76[(3'h7):(1'h0)];
            end
          reg85 <= reg79;
          reg86 <= wire74[(4'he):(4'he)];
        end
      else
        begin
          reg79 <= ((8'haa) << $signed((~^$unsigned((^~wire59)))));
          reg80 <= wire60;
          reg81 <= ($unsigned($signed($unsigned(reg81))) ^~ (+$unsigned($unsigned(wire53[(5'h10):(2'h3)]))));
          reg82 <= (8'hac);
          reg83 <= ((reg71[(4'ha):(3'h4)] <<< wire68) && wire49[(2'h2):(1'h1)]);
        end
      if (({$signed({reg54, wire74[(4'hb):(3'h7)]})} ?
          (({(~&wire48), $signed(reg69)} > ((wire52 ?
                  (8'had) : (7'h43)) && (wire49 ? reg83 : reg69))) ?
              reg71 : $signed($unsigned($signed(wire76)))) : reg86))
        begin
          if ({(!((~&(wire51 != reg81)) >>> (~^$signed(reg56)))),
              ((($unsigned(wire48) != (reg82 != reg77)) ?
                  ((wire68 ^~ wire75) ?
                      $signed((8'ha2)) : reg57[(1'h1):(1'h1)]) : ($signed(reg70) ?
                      (~|wire65) : {reg86})) > $signed($signed((wire51 + reg85))))})
            begin
              reg87 <= (reg86[(4'h8):(4'h8)] ?
                  wire74[(4'he):(3'h4)] : $unsigned((reg77 == (^~reg86[(4'he):(3'h7)]))));
              reg88 <= $unsigned(wire65[(4'h8):(2'h2)]);
            end
          else
            begin
              reg87 <= (reg84 <<< $signed((reg88[(2'h3):(2'h3)] && (-wire65))));
              reg88 <= reg69;
              reg89 <= (wire52 & reg58);
              reg90 <= wire74[(1'h1):(1'h1)];
            end
          reg91 <= {{({(reg54 * reg84)} <<< $unsigned(((7'h41) >= reg87))),
                  (~&$signed((reg56 <= (8'hbb))))},
              (~&{reg69[(2'h3):(2'h2)], $unsigned((-reg55))})};
        end
      else
        begin
          if ({{reg55[(4'hf):(4'hf)]},
              $unsigned($signed((reg69 ? reg79 : (~|reg55))))})
            begin
              reg87 <= ({(&reg66[(3'h6):(1'h0)]),
                      (wire52 ? {$unsigned(reg90)} : wire65[(2'h2):(1'h0)])} ?
                  reg80[(4'he):(2'h3)] : ((^~(!$unsigned(wire60))) & (8'hbf)));
              reg88 <= ((~^$signed($unsigned((~|wire52)))) ?
                  (~$signed(reg57[(3'h5):(3'h4)])) : $unsigned((8'hb9)));
              reg89 <= $signed({wire65[(3'h7):(1'h1)]});
              reg90 <= ({$unsigned($signed((!wire51)))} & (8'ha4));
            end
          else
            begin
              reg87 <= $unsigned($signed((reg89 ?
                  (8'hb7) : $signed(wire48[(1'h0):(1'h0)]))));
              reg88 <= $signed($signed($unsigned(((reg77 ?
                  wire74 : wire75) > {reg78, reg89}))));
              reg89 <= wire74;
            end
          if (reg71)
            begin
              reg91 <= $unsigned({reg78[(2'h3):(1'h1)]});
              reg92 <= (($unsigned(($signed((7'h42)) | $unsigned(wire67))) > reg91[(1'h1):(1'h1)]) ?
                  $unsigned((&((!(8'ha7)) ?
                      reg70 : {reg85}))) : (wire68 && ($unsigned($signed(reg80)) ?
                      ($unsigned(reg71) << reg66[(2'h2):(1'h0)]) : $unsigned(reg90))));
              reg93 <= $unsigned((!($unsigned((~&wire65)) ?
                  wire59[(5'h11):(4'h8)] : {(+reg84), $unsigned(wire64)})));
              reg94 <= $unsigned(wire61);
              reg95 <= {$signed(((8'hb0) ?
                      reg56 : {{wire53, reg89}, (wire60 ? reg94 : reg93)}))};
            end
          else
            begin
              reg91 <= {$unsigned(($signed(reg54) ?
                      ((~reg54) ?
                          (~reg92) : (reg69 ?
                              wire53 : reg91)) : ($signed(reg83) ?
                          $unsigned(reg69) : $unsigned((8'hb2)))))};
              reg92 <= (wire64[(1'h1):(1'h1)] < ($signed(reg56[(3'h4):(2'h2)]) ?
                  wire52[(2'h3):(2'h2)] : ($signed($signed(reg83)) >= (|reg57[(1'h1):(1'h1)]))));
              reg93 <= $unsigned((~^(reg80[(3'h7):(3'h5)] < ((reg78 || wire63) ?
                  $signed(reg93) : (wire60 ~^ reg77)))));
              reg94 <= ($signed((!reg72[(4'hb):(1'h1)])) ?
                  (~^$signed((reg73[(4'ha):(1'h0)] | (^~reg95)))) : {reg95});
            end
          reg96 <= wire74;
        end
      reg97 <= reg55[(2'h2):(2'h2)];
    end
  assign wire98 = reg78;
  assign wire99 = (reg54 << (!(-$unsigned($signed(wire65)))));
endmodule
