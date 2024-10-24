module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire142;
  wire [(3'h6):(1'h0)] wire140;
  wire [(4'hc):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire69;
  wire [(5'h10):(1'h0)] wire68;
  wire signed [(3'h6):(1'h0)] wire67;
  wire signed [(5'h11):(1'h0)] wire63;
  wire signed [(5'h14):(1'h0)] wire4;
  reg signed [(4'hb):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  assign y = {wire142,
                 wire140,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire63,
                 wire4,
                 reg65,
                 reg66,
                 (1'h0)};
  assign wire4 = wire0;
  module5 #() modinst64 (.wire6(wire3), .wire7(wire1), .clk(clk), .wire8(wire2), .wire9(wire4), .y(wire63));
  always
    @(posedge clk) begin
      reg65 <= wire2[(3'h4):(1'h1)];
      reg66 <= $signed((8'ha6));
    end
  assign wire67 = wire0[(4'ha):(1'h1)];
  assign wire68 = $signed(wire0);
  assign wire69 = $signed((-wire3[(4'hf):(3'h5)]));
  assign wire70 = wire2;
  assign wire71 = (+$unsigned($signed(reg65[(4'ha):(4'h9)])));
  module72 #() modinst141 (.wire76(wire71), .wire73(reg65), .clk(clk), .wire74(wire63), .y(wire140), .wire75(wire4), .wire77(wire3));
  assign wire142 = ({(({reg66} ? {reg66, wire70} : $signed(wire69)) ?
                               reg65 : wire71),
                           $signed($signed((+wire0)))} ?
                       ($signed($signed($signed(wire71))) ?
                           wire68[(4'hd):(1'h1)] : (({wire0} ?
                                   (wire3 ? wire3 : reg65) : wire1) ?
                               (wire70[(1'h1):(1'h1)] ?
                                   wire0 : (~wire70)) : (-(-reg66)))) : $signed((8'ha8)));
endmodule

module module72
#(parameter param139 = ((&(~&(~|((7'h41) ? (8'haf) : (8'ha8))))) ? (+({((8'ha7) ? (8'ha6) : (8'hb3))} != ({(7'h41)} ? ((8'hb0) ~^ (8'haa)) : ((8'hbd) ? (8'hba) : (8'h9c))))) : {(({(8'h9f)} ? ((8'ha3) ? (8'ha4) : (7'h44)) : ((8'hb8) ? (8'hbc) : (8'h9c))) || ({(8'hb8), (8'ha0)} - (7'h43)))}))
(y, clk, wire77, wire76, wire75, wire74, wire73);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire77;
  input wire signed [(4'ha):(1'h0)] wire76;
  input wire [(5'h14):(1'h0)] wire75;
  input wire [(5'h11):(1'h0)] wire74;
  input wire signed [(4'ha):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire137;
  wire signed [(3'h5):(1'h0)] wire106;
  wire [(5'h12):(1'h0)] wire105;
  wire [(4'h9):(1'h0)] wire78;
  reg [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(4'he):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg101 = (1'h0);
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg [(4'h8):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  reg [(5'h15):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg [(4'h9):(1'h0)] reg94 = (1'h0);
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  reg [(3'h6):(1'h0)] reg86 = (1'h0);
  reg signed [(4'he):(1'h0)] reg85 = (1'h0);
  reg [(4'hc):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  assign y = {wire137,
                 wire106,
                 wire105,
                 wire78,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
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
                 (1'h0)};
  assign wire78 = $unsigned((wire77 + (wire74 ?
                      (~wire75) : ((wire76 ?
                          wire77 : wire76) > $unsigned(wire75)))));
  always
    @(posedge clk) begin
      if (wire77)
        begin
          if ($unsigned($unsigned($unsigned({(wire78 ? wire74 : (8'ha8)),
              wire73}))))
            begin
              reg79 <= (wire75 & $unsigned((($unsigned((8'had)) == wire74[(3'h4):(2'h2)]) ?
                  ($signed(wire74) | (+wire77)) : $signed($unsigned(wire73)))));
              reg80 <= $signed($unsigned({(~|$unsigned(wire76)),
                  (~|((8'hb7) <<< wire77))}));
              reg81 <= {((wire75 & $unsigned((wire78 & (8'hb9)))) * $unsigned(((^~wire77) - (-reg79))))};
            end
          else
            begin
              reg79 <= reg81[(3'h4):(1'h1)];
            end
          reg82 <= {({wire75[(5'h14):(5'h13)]} && {$unsigned(wire74),
                  ((~&(8'hbd)) ? $unsigned(reg79) : {reg80, wire76})}),
              ($unsigned(wire77) ?
                  $signed(wire76[(4'h9):(3'h5)]) : wire74[(2'h2):(2'h2)])};
          if (($unsigned($unsigned((reg82 ?
                  $unsigned((8'h9d)) : $unsigned((8'h9f))))) ?
              reg80[(4'ha):(4'h9)] : ((|{wire74[(3'h5):(1'h0)]}) ?
                  (((wire74 >> wire75) ?
                      (wire77 ?
                          wire75 : wire78) : (wire76 > wire74)) - ((reg81 ^ reg79) ?
                      {(8'h9d), reg81} : (wire73 ?
                          reg80 : wire78))) : {$signed({wire76})})))
            begin
              reg83 <= $unsigned(wire73);
              reg84 <= ((~|{($unsigned(reg79) * (reg79 > wire74)),
                  ((-wire76) & $signed(wire77))}) < wire78);
            end
          else
            begin
              reg83 <= $signed({{(~&$signed(reg79))}});
              reg84 <= reg83;
              reg85 <= ($unsigned((wire77[(1'h0):(1'h0)] ?
                      (~|reg80[(5'h13):(4'h9)]) : (-(+reg79)))) ?
                  {(-(^$signed(reg79)))} : $unsigned(($unsigned(reg84[(1'h1):(1'h1)]) ?
                      ($unsigned(wire74) ?
                          $signed((8'hbf)) : ((8'hb6) ?
                              wire74 : wire78)) : ((reg79 ?
                          (8'ha8) : reg83) - (+reg82)))));
              reg86 <= wire75[(2'h2):(1'h1)];
              reg87 <= reg85[(4'hd):(4'ha)];
            end
          reg88 <= $unsigned($signed($unsigned($unsigned((wire78 < reg85)))));
        end
      else
        begin
          reg79 <= reg79[(3'h6):(1'h0)];
          reg80 <= wire77[(1'h0):(1'h0)];
        end
      reg89 <= $signed(reg79);
      if (wire78[(2'h3):(2'h3)])
        begin
          if (reg89[(3'h4):(3'h4)])
            begin
              reg90 <= $signed({$unsigned(wire74[(4'h8):(4'h8)]),
                  (reg86[(2'h2):(2'h2)] ?
                      (((8'hbe) <<< (8'hb2)) * (8'hbf)) : ((~|(8'h9c)) ?
                          (^~wire75) : $signed((7'h44))))});
              reg91 <= $signed(($unsigned(wire78[(3'h6):(3'h6)]) ?
                  $unsigned($signed($unsigned(reg84))) : ((reg86 ?
                          (~^wire78) : $signed(wire76)) ?
                      $signed($unsigned(reg87)) : {(reg82 - reg84)})));
              reg92 <= (reg84[(3'h7):(1'h1)] ?
                  wire75 : {($unsigned((reg89 ~^ wire78)) >>> (+(^~reg85)))});
              reg93 <= $signed({wire74[(4'h9):(1'h1)]});
            end
          else
            begin
              reg90 <= reg81[(4'hd):(2'h3)];
              reg91 <= {({reg90} ?
                      ({reg85} ?
                          (8'hba) : ((^~reg81) ?
                              $signed(reg92) : ((8'hb3) ^ wire75))) : {($signed(reg87) <<< $signed(reg87))}),
                  $signed((|{(^reg89)}))};
            end
          reg94 <= {(+(((wire78 ? (8'ha3) : (8'ha9)) <<< (^reg89)) ?
                  wire77[(3'h7):(2'h3)] : ((wire77 ?
                      reg82 : reg87) && (&(8'hb3)))))};
          if ($signed({$unsigned(((~^(8'h9f)) != $signed(reg85)))}))
            begin
              reg95 <= $unsigned(reg85);
              reg96 <= $unsigned(wire76[(2'h3):(2'h3)]);
              reg97 <= wire76[(1'h0):(1'h0)];
              reg98 <= $signed((((~^{(8'hac)}) >>> (~^$signed(wire75))) >>> wire76[(4'h9):(3'h4)]));
            end
          else
            begin
              reg95 <= $signed((reg97 ?
                  $signed($signed($signed(reg97))) : $signed((8'ha7))));
              reg96 <= (8'hb0);
              reg97 <= (((~^{reg84[(1'h1):(1'h1)]}) ?
                      $unsigned(reg87[(1'h0):(1'h0)]) : reg98[(3'h4):(1'h0)]) ?
                  reg93[(4'h8):(2'h2)] : {(+($unsigned(reg88) ~^ $unsigned(reg92)))});
            end
          reg99 <= (reg84[(2'h2):(2'h2)] ? reg84 : (&reg82));
        end
      else
        begin
          if ((wire74[(3'h6):(3'h5)] + (wire76 ?
              $signed((~(8'hb0))) : (reg84 ? reg87 : $unsigned(wire73)))))
            begin
              reg90 <= $unsigned(reg93[(4'h9):(2'h2)]);
              reg91 <= $signed(({(~$signed(reg98))} ?
                  ($unsigned($signed(wire75)) ^~ (wire74 ?
                      (^reg88) : $unsigned((8'hb2)))) : $unsigned((reg98[(3'h5):(2'h2)] <= $signed((8'ha4))))));
              reg92 <= (+(reg88 * {({wire76} ?
                      $unsigned(reg87) : reg91[(1'h1):(1'h0)]),
                  $signed((reg95 ? reg94 : reg95))}));
            end
          else
            begin
              reg90 <= reg79;
              reg91 <= reg97;
              reg92 <= reg93[(4'ha):(3'h6)];
            end
        end
      if (reg86[(2'h2):(1'h1)])
        begin
          if ((-((~&($signed(reg86) ?
              reg91[(2'h3):(1'h1)] : $unsigned(reg95))) ^ $unsigned({reg81[(2'h2):(1'h0)]}))))
            begin
              reg100 <= (~&$unsigned(({$signed(reg92)} > $signed((reg99 ?
                  wire77 : (7'h44))))));
            end
          else
            begin
              reg100 <= reg88;
              reg101 <= {$unsigned(reg89)};
            end
          reg102 <= (^~$unsigned($unsigned(reg82[(3'h4):(3'h4)])));
          reg103 <= ((reg88 <= {$unsigned((+reg85))}) <<< (&reg87));
          reg104 <= ({($signed($signed(reg100)) != $signed(((8'hb9) ?
                      wire74 : reg99))),
                  ((&$signed(reg82)) - (!(8'haa)))} ?
              $signed($signed($unsigned($signed(reg90)))) : reg103);
        end
      else
        begin
          reg100 <= ($unsigned(reg99[(3'h7):(1'h1)]) * (^reg80));
          reg101 <= (+$unsigned(({(wire78 ? reg102 : reg84),
              $signed(reg104)} * ($unsigned(reg98) ?
              $unsigned(wire78) : $unsigned(reg80)))));
          reg102 <= ((!reg103) ?
              {reg80,
                  (-($signed((7'h42)) ?
                      $unsigned((8'hb2)) : wire76[(2'h2):(1'h0)]))} : $signed(reg81));
        end
    end
  assign wire105 = $signed({(((|reg97) <<< $signed((8'hbc))) ?
                           (reg79[(4'h9):(4'h9)] >= (-wire74)) : $signed(wire78))});
  assign wire106 = $unsigned($unsigned((^reg79)));
  module107 #() modinst138 (wire137, clk, reg102, reg94, reg99, reg104);
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire9;
  input wire signed [(3'h4):(1'h0)] wire8;
  input wire signed [(3'h4):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire62;
  wire [(4'he):(1'h0)] wire61;
  wire [(4'h8):(1'h0)] wire60;
  wire signed [(2'h3):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire57;
  wire [(3'h6):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire10;
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire57,
                 wire37,
                 wire29,
                 wire28,
                 wire27,
                 wire11,
                 wire10,
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
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 (1'h0)};
  assign wire10 = $signed(wire9);
  assign wire11 = ((wire7[(3'h4):(1'h1)] ?
                      $unsigned(wire6) : $unsigned({$unsigned(wire10)})) == ((wire9 ?
                          $unsigned((wire10 ?
                              wire7 : wire8)) : (wire9[(2'h3):(2'h3)] ?
                              {wire8, wire7} : wire10[(4'hd):(4'hc)])) ?
                      (-((wire9 ?
                          wire7 : (8'hb0)) ^~ $unsigned(wire9))) : (($unsigned(wire9) ?
                              $unsigned((7'h41)) : {wire8, wire8}) ?
                          wire7 : $signed((wire10 ? wire7 : (8'hb0))))));
  always
    @(posedge clk) begin
      reg12 <= $unsigned($unsigned(wire7));
      if ((wire8[(1'h0):(1'h0)] ? $signed(wire11) : (7'h41)))
        begin
          reg13 <= (~&({((+wire9) | wire7), wire9[(1'h0):(1'h0)]} ?
              ($signed((wire9 >>> wire9)) ? wire9 : (8'hb9)) : $signed(wire7)));
        end
      else
        begin
          if ((|$signed($signed((reg12[(2'h3):(2'h2)] < reg13[(4'h9):(3'h6)])))))
            begin
              reg13 <= $unsigned((wire6 > (!(8'ha2))));
              reg14 <= (wire8 ?
                  reg12[(3'h6):(3'h5)] : {((^~$signed((7'h43))) & wire7[(3'h4):(2'h3)])});
              reg15 <= reg12[(2'h2):(1'h0)];
              reg16 <= $signed(reg15[(1'h1):(1'h1)]);
              reg17 <= (wire9 != ($unsigned(wire9) ^~ (-($signed(wire7) != $unsigned(reg12)))));
            end
          else
            begin
              reg13 <= $unsigned($signed(wire6[(3'h5):(2'h3)]));
              reg14 <= reg15[(2'h2):(2'h2)];
              reg15 <= $unsigned(((^~(~(8'hb9))) ?
                  reg12[(2'h3):(2'h2)] : $unsigned((~&$unsigned(reg13)))));
            end
          reg18 <= ((7'h42) ?
              ((($unsigned(reg12) ? (|reg12) : reg14[(3'h4):(3'h4)]) ?
                      ((wire6 ?
                          reg12 : reg13) > $unsigned(reg12)) : ($signed(reg15) >= reg12[(1'h1):(1'h0)])) ?
                  $signed(reg14) : $signed($unsigned($unsigned((8'hbf))))) : (^~wire11[(3'h6):(2'h3)]));
        end
      if (($unsigned((~&{(reg18 <<< reg13)})) + (|(~&(~|wire10[(4'h9):(3'h6)])))))
        begin
          reg19 <= {(+$unsigned((reg13 > {wire11, (8'hb1)}))), reg14};
        end
      else
        begin
          if ((~reg18))
            begin
              reg19 <= ($signed(wire10[(3'h6):(3'h6)]) == (wire10 ?
                  (!$signed(wire9[(1'h0):(1'h0)])) : (|((wire11 * wire11) ^~ $unsigned((8'hbb))))));
              reg20 <= reg13;
              reg21 <= reg16;
              reg22 <= ({reg16} == (reg16 ?
                  $unsigned((~|(^wire9))) : (~^((8'ha9) | $signed(wire6)))));
              reg23 <= ((~|(~^(!$unsigned(wire8)))) || ($unsigned($unsigned($signed(wire7))) ?
                  reg19[(4'h8):(2'h3)] : ($signed((+reg21)) <= $signed(reg20))));
            end
          else
            begin
              reg19 <= (8'h9e);
              reg20 <= wire11[(4'hd):(3'h7)];
              reg21 <= (reg23[(1'h1):(1'h1)] & $unsigned($unsigned(reg22[(1'h0):(1'h0)])));
              reg22 <= $unsigned(((reg15 ~^ reg12) ?
                  $signed(reg18) : $signed(wire7[(1'h0):(1'h0)])));
              reg23 <= reg13[(1'h1):(1'h0)];
            end
          if (wire10)
            begin
              reg24 <= ({$signed($signed(reg18))} << (~|$unsigned($signed((~&reg15)))));
              reg25 <= wire6[(4'h9):(3'h6)];
              reg26 <= (+{(7'h41), $unsigned($unsigned((~|reg14)))});
            end
          else
            begin
              reg24 <= (+{{$unsigned($signed(reg16))},
                  ((|reg20[(3'h6):(2'h3)]) ?
                      {(reg21 ? reg25 : (8'hab)),
                          $signed((7'h44))} : $signed($signed(reg12)))});
              reg25 <= ($signed(reg14[(1'h0):(1'h0)]) >= {$signed((~|reg26)),
                  reg22[(4'ha):(1'h1)]});
              reg26 <= (wire9 || ((((~&wire6) ?
                  (+(8'ha3)) : (~&reg23)) < $unsigned((8'had))) << reg12));
            end
        end
    end
  assign wire27 = $signed($unsigned(wire9[(2'h3):(1'h0)]));
  assign wire28 = reg26;
  assign wire29 = ((^~(($unsigned(reg26) ?
                          $unsigned(reg16) : $unsigned(reg15)) ?
                      (~(~|reg24)) : (((8'hac) ?
                          wire6 : (8'ha5)) | reg25))) >>> $signed((^{wire10[(3'h4):(2'h3)],
                      reg20})));
  always
    @(posedge clk) begin
      if ((($signed($signed(((8'hb0) ? reg23 : reg22))) ?
              reg20 : reg17[(4'hc):(4'h8)]) ?
          (reg13 < (((wire28 ? wire28 : (8'h9d)) ?
              {wire10} : $unsigned(reg23)) & (~^{wire11}))) : (~^$unsigned(($unsigned(wire27) == (-reg18))))))
        begin
          reg30 <= wire8[(1'h0):(1'h0)];
          reg31 <= ((&(wire9[(2'h2):(1'h1)] ?
                  reg22[(2'h3):(2'h3)] : ((^~wire10) == $unsigned(reg24)))) ?
              (reg15[(2'h2):(1'h1)] >>> $unsigned({(8'hb7)})) : reg20[(4'hb):(3'h7)]);
          reg32 <= $unsigned(reg12[(1'h1):(1'h1)]);
          reg33 <= (~wire7);
        end
      else
        begin
          reg30 <= $unsigned($signed(reg21[(2'h3):(1'h0)]));
          reg31 <= {($unsigned({reg14[(1'h1):(1'h1)], $unsigned(reg13)}) ?
                  ($unsigned((reg16 ? wire8 : (8'ha5))) ?
                      (wire28[(2'h3):(2'h2)] <= reg26) : reg15[(1'h0):(1'h0)]) : $signed(reg13[(3'h4):(2'h2)])),
              (^~(~&$signed((reg19 || reg23))))};
        end
      reg34 <= $signed($unsigned($signed(({wire6, reg15} ?
          (+reg12) : (~reg26)))));
      reg35 <= {$unsigned($unsigned(reg34)), (~^reg22[(2'h2):(1'h1)])};
      reg36 <= reg23;
    end
  assign wire37 = (+(wire29 ?
                      ((wire7[(2'h2):(2'h2)] ?
                          wire6 : $unsigned(reg31)) * ($unsigned(reg25) ?
                          reg18[(1'h1):(1'h0)] : reg15)) : ({(^reg16)} ?
                          (+(!reg33)) : reg19)));
  module38 #() modinst58 (wire57, clk, reg34, reg22, reg31, reg14, reg15);
  assign wire59 = {reg20[(1'h1):(1'h0)],
                      ($signed((7'h41)) ~^ {$unsigned((reg15 << wire28)),
                          $unsigned((reg24 ? reg32 : reg22))})};
  assign wire60 = reg16;
  assign wire61 = $signed(({$unsigned(wire28),
                      $unsigned((reg21 ? reg16 : reg13))} << ((^~(!reg20)) ?
                      {reg32, (reg36 ^ reg23)} : (~&$unsigned(reg21)))));
  assign wire62 = (~|(8'hae));
endmodule

module module38
#(parameter param55 = (!{(~&({(8'ha5), (8'hbc)} - ((8'hbd) ? (8'hac) : (8'hb1)))), ((((8'ha3) <= (7'h43)) ? ((8'ha4) << (7'h41)) : ((8'ha1) ? (8'hb0) : (8'hb4))) || (((8'hb0) ? (8'hae) : (8'h9e)) && ((7'h42) - (8'ha2))))}), 
parameter param56 = ((!((~^(param55 ^ param55)) >>> (param55 || (param55 == param55)))) ? (param55 ? (({param55, param55} - (~param55)) << ({param55, param55} ^~ {param55})) : (~|((param55 ? param55 : param55) <= param55))) : {param55}))
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire43;
  input wire signed [(3'h4):(1'h0)] wire42;
  input wire signed [(4'hb):(1'h0)] wire41;
  input wire signed [(3'h6):(1'h0)] wire40;
  input wire signed [(2'h2):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire50;
  wire signed [(4'hc):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire44;
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire44,
                 reg54,
                 reg53,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire44 = (wire42[(1'h1):(1'h1)] != wire41[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg45 <= (~&wire40[(3'h5):(2'h3)]);
    end
  always
    @(posedge clk) begin
      reg46 <= $signed(wire43);
      reg47 <= ($unsigned(reg45[(1'h0):(1'h0)]) ?
          (reg45 ?
              wire40[(3'h6):(1'h0)] : {wire41[(2'h2):(1'h0)]}) : ($unsigned({wire41,
                  $signed(wire44)}) ?
              (^($unsigned(reg46) ?
                  $signed(wire40) : wire39)) : ($signed((wire40 != wire41)) ?
                  wire44[(2'h2):(1'h1)] : $signed($signed(wire44)))));
    end
  assign wire48 = ($signed($signed(((!reg45) <= wire39))) ?
                      {$signed(wire43[(2'h2):(2'h2)]),
                          ($signed(reg45[(1'h0):(1'h0)]) < ((8'ha0) ?
                              $unsigned(reg46) : wire40))} : wire40);
  assign wire49 = reg47[(4'hb):(2'h2)];
  assign wire50 = $unsigned($signed(wire44[(4'h8):(3'h5)]));
  assign wire51 = wire40[(3'h4):(3'h4)];
  assign wire52 = ((((|$signed(wire39)) ?
                          wire50[(2'h2):(2'h2)] : $signed({wire50, wire48})) ?
                      (((wire42 && (8'hb1)) ?
                          $signed(wire48) : $unsigned(wire49)) <= $unsigned(wire43)) : (~^$unsigned((7'h43)))) >>> (^~((wire41 ?
                          wire51[(1'h1):(1'h0)] : ((8'hba) ? wire42 : wire49)) ?
                      $signed((wire39 ? wire40 : wire49)) : wire51)));
  always
    @(posedge clk) begin
      reg53 <= $signed((8'h9c));
      reg54 <= wire51;
    end
endmodule

module module107
#(parameter param135 = (((({(8'hb0)} ^~ ((8'hb7) ? (8'h9d) : (8'h9c))) ? {(8'hbf), {(8'hbb), (8'hb6)}} : (((8'hb1) ? (8'hb7) : (8'hac)) ? (~(8'ha4)) : ((8'ha5) ? (8'hbb) : (7'h43)))) | (~^(^{(7'h40), (8'haf)}))) ? (((^~((8'hab) ? (8'hba) : (8'ha0))) ? {(~|(8'hb9)), ((8'ha5) ^ (8'ha9))} : (((7'h43) ? (8'ha1) : (8'haa)) ? ((8'ha0) == (8'ha1)) : ((8'had) == (8'ha4)))) ? (~|({(8'hb5)} ? {(8'hbb), (8'hb1)} : ((8'hb5) && (8'hab)))) : {(((8'haf) > (8'ha6)) << (+(8'ha0))), (~|((8'hb6) ? (8'ha3) : (8'hbc)))}) : (((((8'ha4) ? (8'hbe) : (7'h42)) >= ((8'hb7) ? (8'hab) : (8'hb0))) <<< ((-(8'hab)) >> ((8'hb2) != (8'hab)))) ? ((~^((7'h40) ? (8'hae) : (8'hb1))) ? (((8'hb7) << (8'haf)) ? ((8'hbb) ? (8'ha8) : (8'hbf)) : ((8'hb9) >>> (8'hb1))) : (!((8'h9c) >= (8'hb3)))) : {(((8'h9d) ? (8'ha9) : (8'h9e)) ? ((8'h9c) ? (8'hbb) : (8'hb3)) : (|(8'hb9)))})), 
parameter param136 = (param135 ? {((~&{param135, param135}) ? (^~(param135 ? param135 : param135)) : (^~(param135 ? param135 : param135)))} : (8'hb2)))
(y, clk, wire111, wire110, wire109, wire108);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire111;
  input wire [(4'h9):(1'h0)] wire110;
  input wire signed [(3'h6):(1'h0)] wire109;
  input wire signed [(3'h6):(1'h0)] wire108;
  wire [(4'hc):(1'h0)] wire134;
  wire [(4'hb):(1'h0)] wire130;
  wire signed [(3'h6):(1'h0)] wire126;
  wire [(4'hd):(1'h0)] wire125;
  wire [(4'hc):(1'h0)] wire124;
  wire signed [(3'h4):(1'h0)] wire123;
  reg [(5'h13):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg129 = (1'h0);
  reg [(4'hf):(1'h0)] reg128 = (1'h0);
  reg [(4'hc):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(4'h8):(1'h0)] reg120 = (1'h0);
  reg [(4'he):(1'h0)] reg119 = (1'h0);
  reg [(4'hf):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg115 = (1'h0);
  reg [(4'hc):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(3'h6):(1'h0)] reg112 = (1'h0);
  assign y = {wire134,
                 wire130,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 reg133,
                 reg132,
                 reg131,
                 reg129,
                 reg128,
                 reg127,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire108[(2'h3):(2'h3)])
        begin
          reg112 <= $unsigned($signed($unsigned(((8'hb0) ?
              (~|wire109) : (&wire109)))));
          reg113 <= ($signed(wire108[(1'h0):(1'h0)]) ?
              wire108[(2'h2):(1'h0)] : $unsigned((8'hb9)));
          if ($signed(reg113))
            begin
              reg114 <= reg113[(1'h1):(1'h1)];
              reg115 <= ((7'h41) & (((|$unsigned(wire110)) ?
                      ((&reg112) >> (+reg114)) : $signed({wire108, wire109})) ?
                  $unsigned({wire108[(3'h4):(2'h3)]}) : $signed(reg112[(1'h0):(1'h0)])));
              reg116 <= (reg114[(4'ha):(4'h9)] | {(&$signed((^~reg112))),
                  (~^(^wire108[(1'h0):(1'h0)]))});
            end
          else
            begin
              reg114 <= (-$unsigned(wire108));
              reg115 <= reg115[(3'h7):(3'h7)];
            end
          reg117 <= (^~$unsigned(reg114[(4'h9):(4'h9)]));
          reg118 <= (reg113 ?
              (((reg115[(3'h6):(2'h2)] ?
                  (reg116 ^~ wire109) : {(8'hbe),
                      (8'ha1)}) < reg113[(3'h7):(2'h3)]) ^ ($unsigned($signed(reg114)) && $unsigned($unsigned(reg115)))) : ((reg112 ?
                  ((reg113 ?
                      wire109 : (7'h44)) << wire110[(2'h2):(1'h0)]) : {wire111}) - (reg112[(3'h6):(3'h4)] ?
                  (-{wire110}) : $signed(reg116[(2'h3):(1'h0)]))));
        end
      else
        begin
          if (wire111[(3'h4):(1'h1)])
            begin
              reg112 <= reg114;
              reg113 <= ($signed((+$unsigned($unsigned((8'hb4))))) ?
                  $unsigned((8'h9e)) : (8'had));
              reg114 <= wire110;
            end
          else
            begin
              reg112 <= $signed({(^~wire109[(1'h0):(1'h0)]),
                  ((reg116[(5'h14):(4'hc)] ?
                      wire111 : $unsigned(reg117)) > (!reg115))});
              reg113 <= {reg118,
                  ({$unsigned(((7'h44) == wire109)),
                      reg112} || {{$unsigned((8'ha4)), reg114}})};
              reg114 <= wire109[(3'h6):(1'h0)];
            end
          reg115 <= (!(!{($signed(wire109) <= (~&reg114)),
              (reg113 ? ((8'ha6) * reg116) : $signed(wire109))}));
          reg116 <= ({wire109[(1'h0):(1'h0)]} ?
              (~^reg117[(2'h2):(2'h2)]) : reg115[(3'h7):(3'h7)]);
          if ({($signed((!(reg117 <<< (8'hbd)))) ^ (($signed((8'had)) ?
                      $signed(wire111) : $unsigned(wire110)) ?
                  ((|reg114) ?
                      $unsigned(wire110) : $unsigned(reg115)) : reg117[(4'h8):(4'h8)]))})
            begin
              reg117 <= reg118[(1'h0):(1'h0)];
              reg118 <= $unsigned(wire111[(4'hd):(1'h0)]);
            end
          else
            begin
              reg117 <= (~|(~(reg113 >>> reg115)));
              reg118 <= reg112;
              reg119 <= wire110[(3'h6):(3'h4)];
              reg120 <= (8'hb7);
              reg121 <= $signed(reg116[(5'h12):(4'ha)]);
            end
          reg122 <= wire111[(1'h0):(1'h0)];
        end
    end
  assign wire123 = (reg113[(2'h3):(1'h1)] - wire108[(1'h1):(1'h1)]);
  assign wire124 = (wire108[(3'h5):(2'h3)] - $signed(({reg118} ?
                       (^(7'h42)) : reg120)));
  assign wire125 = ($signed($signed(((~reg112) ^ wire109[(1'h0):(1'h0)]))) || ((({wire111} ?
                           (~|wire111) : $unsigned(reg119)) - (!(-wire111))) ?
                       $signed(reg112) : $signed((-$signed(reg115)))));
  assign wire126 = reg117;
  always
    @(posedge clk) begin
      reg127 <= wire109;
      reg128 <= wire108[(3'h5):(2'h2)];
      reg129 <= reg119[(4'he):(3'h6)];
    end
  assign wire130 = {{$signed($unsigned($unsigned(reg129)))}};
  always
    @(posedge clk) begin
      reg131 <= $unsigned(({{(~|wire110),
              (wire126 >>> wire108)}} >>> (~^({reg113} ?
          (&wire111) : reg129[(3'h4):(1'h1)]))));
      reg132 <= (((8'h9e) > (&$unsigned(wire125[(3'h6):(1'h1)]))) ?
          {((8'ha1) >>> ((reg114 ?
                  reg128 : reg119) > $signed(reg131)))} : reg121[(1'h0):(1'h0)]);
      reg133 <= ((reg128 ?
          (+$unsigned(wire111[(3'h7):(1'h0)])) : reg112) <<< reg121);
    end
  assign wire134 = (8'hac);
endmodule
