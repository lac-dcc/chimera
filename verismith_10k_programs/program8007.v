module top
#(parameter param115 = ({((((8'h9d) > (8'had)) ? (^~(7'h41)) : {(8'ha3)}) ? {{(8'hb7)}} : (~((8'ha1) ? (8'ha9) : (8'hb2))))} < (+(^(^(!(8'hb0)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h19d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire114;
  wire signed [(4'hc):(1'h0)] wire113;
  wire signed [(5'h12):(1'h0)] wire112;
  wire signed [(4'hd):(1'h0)] wire111;
  wire [(4'h8):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire70;
  wire signed [(4'h8):(1'h0)] wire68;
  reg [(3'h5):(1'h0)] reg110 = (1'h0);
  reg [(4'hc):(1'h0)] reg109 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg107 = (1'h0);
  reg [(3'h6):(1'h0)] reg106 = (1'h0);
  reg [(2'h3):(1'h0)] reg4 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire104,
                 wire72,
                 wire71,
                 wire70,
                 wire68,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned(wire0))
        begin
          if ((^(wire3[(3'h4):(2'h2)] - $signed(wire3[(1'h1):(1'h1)]))))
            begin
              reg4 <= wire3;
              reg5 <= (~&reg4[(2'h3):(1'h1)]);
              reg6 <= ($signed(wire1[(3'h6):(2'h2)]) ^~ reg4[(2'h2):(1'h0)]);
            end
          else
            begin
              reg4 <= (reg5[(4'h8):(1'h0)] ?
                  $unsigned((!(+{wire1}))) : wire0[(1'h0):(1'h0)]);
              reg5 <= $signed($unsigned((reg4 ?
                  wire0[(2'h3):(1'h0)] : ((reg4 >= wire0) ?
                      $signed(wire0) : wire1))));
            end
          reg7 <= ($signed((((reg4 ? reg6 : wire3) >= (|wire0)) >>> ((wire1 ?
              wire0 : reg6) - $signed(reg4)))) && wire3[(4'hb):(3'h7)]);
          reg8 <= (reg7 & wire2);
          reg9 <= ($unsigned((8'hb2)) > (reg7 && (($signed(reg6) ?
              (reg6 ? wire0 : reg5) : ((7'h42) - wire0)) ^ (|reg5))));
          reg10 <= reg7;
        end
      else
        begin
          if ($signed((reg4[(1'h0):(1'h0)] >>> reg10[(2'h2):(1'h1)])))
            begin
              reg4 <= {$signed({((7'h44) >> $signed((8'ha6))),
                      (|((8'hb4) <= wire2))})};
              reg5 <= $signed($signed(reg8[(3'h6):(2'h2)]));
              reg6 <= (~$unsigned($unsigned(reg9[(1'h0):(1'h0)])));
              reg7 <= reg9;
            end
          else
            begin
              reg4 <= ($unsigned((~^({reg6} ?
                      (wire3 && reg4) : reg9[(2'h2):(1'h0)]))) ?
                  reg6 : (^reg7[(3'h5):(2'h3)]));
              reg5 <= wire3;
              reg6 <= (((reg4 ?
                  reg10[(2'h3):(1'h1)] : ((!reg6) >= (&wire2))) ^~ (8'haa)) ~^ (^$unsigned($unsigned((wire1 + reg10)))));
            end
          if ((^reg7))
            begin
              reg8 <= ((reg7 ? (^~$signed((&reg10))) : (wire0 && reg4)) ?
                  (!$unsigned((~^{reg4}))) : $signed(((&(8'hbe)) ?
                      ((+(8'hb1)) ^ (reg7 ^~ reg9)) : ($signed(wire2) ?
                          wire0 : $unsigned(reg6)))));
              reg9 <= $signed((|((~|$unsigned(reg6)) ?
                  $unsigned(wire0) : reg4)));
              reg10 <= (reg9 != reg5[(3'h4):(1'h0)]);
              reg11 <= (wire1[(3'h6):(2'h2)] <<< (reg8 ?
                  (~|wire1[(1'h0):(1'h0)]) : reg6));
            end
          else
            begin
              reg8 <= reg9[(1'h0):(1'h0)];
              reg9 <= $unsigned($signed(($signed((reg11 ?
                  (8'ha5) : reg7)) - (|wire1))));
              reg10 <= $signed((~&$signed((&$signed((8'hba))))));
              reg11 <= reg9[(2'h2):(1'h0)];
              reg12 <= {reg10[(1'h1):(1'h0)]};
            end
        end
      if ($signed((~&$unsigned(reg12[(4'hd):(1'h1)]))))
        begin
          if ($signed(($unsigned(reg7[(2'h3):(1'h0)]) >> $unsigned(wire2))))
            begin
              reg13 <= wire3[(3'h5):(3'h4)];
              reg14 <= reg5;
              reg15 <= reg12[(3'h7):(1'h0)];
              reg16 <= reg11[(2'h2):(2'h2)];
            end
          else
            begin
              reg13 <= (!(wire0 ?
                  $signed(reg9) : $signed(reg5[(2'h3):(2'h2)])));
              reg14 <= (reg16 ?
                  {$signed(($signed(reg12) ?
                          reg6[(3'h4):(2'h2)] : $signed((8'ha0))))} : $signed(((7'h40) && $unsigned(reg6[(2'h2):(1'h1)]))));
              reg15 <= (^~((-reg6[(4'hc):(2'h2)]) ^ ((~|reg6) ?
                  $signed(reg14) : wire0[(2'h2):(2'h2)])));
              reg16 <= $signed(($signed(((reg15 == wire2) < (&wire2))) == reg7));
            end
          reg17 <= ($signed(reg12[(4'hb):(1'h0)]) ?
              $signed(reg8) : $unsigned($signed(wire2[(1'h1):(1'h1)])));
        end
      else
        begin
          reg13 <= $signed(reg6[(3'h6):(2'h2)]);
        end
      reg18 <= ($signed($signed((^(~^reg6)))) ?
          (($signed($signed(wire0)) & $signed({wire1, (8'ha0)})) ?
              ($unsigned((reg4 >>> reg11)) ?
                  $signed({reg4,
                      reg8}) : (~&$signed(wire1))) : $unsigned($unsigned(reg14))) : $unsigned((^~(^~reg14[(2'h2):(1'h1)]))));
      reg19 <= (~&{((~|(reg12 >= reg7)) ?
              wire0[(1'h1):(1'h1)] : $signed(reg12[(2'h2):(1'h0)]))});
      reg20 <= (($signed(((&reg8) == {reg17})) ?
          ((~|reg7) || wire2) : (reg19 ?
              reg13[(5'h13):(3'h6)] : reg19)) || reg18[(4'h9):(3'h5)]);
    end
  module21 #() modinst69 (wire68, clk, reg9, wire3, wire1, reg12);
  assign wire70 = {(((~^$signed(reg13)) + $unsigned(reg16[(1'h1):(1'h1)])) ^ (($unsigned(reg17) && $unsigned(wire68)) ?
                          $unsigned($unsigned(reg12)) : reg16[(1'h0):(1'h0)])),
                      (+reg14)};
  assign wire71 = ($unsigned((reg8[(1'h1):(1'h0)] << (wire2 ?
                      (wire1 << wire3) : {(8'hb9), reg17}))) - reg6);
  assign wire72 = {(+$unsigned(((reg14 == wire3) ?
                          ((8'h9d) ? reg20 : reg9) : ((8'ha7) > reg18)))),
                      reg4[(2'h3):(2'h3)]};
  module73 #() modinst105 (.wire74(reg7), .wire77(reg16), .clk(clk), .wire75(reg17), .wire76(reg10), .wire78(reg11), .y(wire104));
  always
    @(posedge clk) begin
      if ($signed($unsigned(($signed((reg4 * wire104)) != $unsigned((+wire2))))))
        begin
          reg106 <= ((8'h9f) ?
              reg18 : $unsigned($unsigned((wire1[(3'h7):(3'h5)] ?
                  (!(8'hba)) : $signed(wire68)))));
        end
      else
        begin
          if ($unsigned({((~&$signed((8'hbc))) ?
                  reg5[(4'h8):(1'h1)] : ((&reg19) ?
                      (reg7 >> reg12) : $signed(reg11))),
              (~$signed(reg12))}))
            begin
              reg106 <= ($signed((({(7'h40)} ^ $signed(wire71)) ?
                      reg11 : reg13)) ?
                  (&reg7[(4'ha):(4'ha)]) : (+$unsigned(($signed((8'ha7)) ?
                      $unsigned(reg20) : $unsigned(wire104)))));
              reg107 <= ((&(~|(~^$signed(wire1)))) ?
                  {$signed(wire2[(2'h2):(1'h1)])} : {wire104,
                      (+({wire1} - ((8'hb3) ^~ reg11)))});
              reg108 <= {{(-$unsigned($signed(reg13))), reg9[(3'h6):(2'h3)]}};
              reg109 <= (^wire72[(5'h13):(4'h9)]);
              reg110 <= (^~reg109);
            end
          else
            begin
              reg106 <= (reg109 ?
                  $signed(wire2) : $signed(wire68[(3'h6):(1'h0)]));
              reg107 <= $signed(($unsigned(((reg16 || reg5) ?
                      ((7'h43) < (8'ha6)) : wire1)) ?
                  $unsigned(reg15[(4'h9):(3'h4)]) : $unsigned(($signed(reg18) ?
                      (+reg107) : $unsigned(reg5)))));
              reg108 <= $signed(reg4);
              reg109 <= $unsigned({reg15[(2'h2):(1'h1)], reg109});
            end
        end
    end
  assign wire111 = reg4;
  assign wire112 = ((&$unsigned((&wire71))) ?
                       (((|(wire3 ^~ (8'h9f))) != $unsigned((reg108 ?
                           (8'hac) : reg17))) | ((8'ha9) ?
                           wire70[(4'ha):(3'h6)] : {(~(8'haa)),
                               {(8'hb3),
                                   wire111}})) : (~$signed($signed(reg18))));
  assign wire113 = reg8[(1'h1):(1'h1)];
  assign wire114 = ($signed($unsigned({{wire2},
                       $unsigned(reg110)})) ~^ reg6[(2'h3):(1'h1)]);
endmodule

module module73  (y, clk, wire78, wire77, wire76, wire75, wire74);
  output wire [(32'h12a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire78;
  input wire [(4'h9):(1'h0)] wire77;
  input wire signed [(5'h13):(1'h0)] wire76;
  input wire signed [(3'h5):(1'h0)] wire75;
  input wire signed [(4'ha):(1'h0)] wire74;
  wire signed [(4'h8):(1'h0)] wire103;
  wire signed [(4'hc):(1'h0)] wire102;
  wire [(5'h14):(1'h0)] wire101;
  wire signed [(4'hb):(1'h0)] wire80;
  wire [(5'h12):(1'h0)] wire79;
  reg signed [(5'h10):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  reg [(2'h3):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg95 = (1'h0);
  reg [(4'h9):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg91 = (1'h0);
  reg [(4'h9):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire80,
                 wire79,
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
                 (1'h0)};
  assign wire79 = ($signed(wire78[(5'h12):(3'h4)]) & ($unsigned((~|(7'h42))) ?
                      (+wire74[(4'h8):(2'h2)]) : $signed(($unsigned((8'hb3)) ?
                          (wire75 ? wire78 : wire74) : wire74))));
  assign wire80 = $unsigned(wire74[(4'h9):(3'h7)]);
  always
    @(posedge clk) begin
      if ((wire75[(3'h5):(2'h2)] >= wire75))
        begin
          reg81 <= wire79;
        end
      else
        begin
          reg81 <= (^(!wire74));
          reg82 <= wire80;
          reg83 <= {wire80,
              {$unsigned($signed((reg82 ? (8'hbe) : wire74))),
                  $signed({wire76[(4'he):(3'h5)], wire80})}};
          reg84 <= (-wire75);
          reg85 <= (!(~&$unsigned(wire79[(4'h8):(3'h6)])));
        end
      if (($unsigned((~^wire77[(3'h7):(2'h2)])) & wire76[(5'h11):(4'hd)]))
        begin
          reg86 <= (((+reg83) ?
              $signed($signed($unsigned(wire75))) : $unsigned(($unsigned(wire80) << reg83[(3'h7):(3'h7)]))) * $signed((wire77[(4'h8):(2'h3)] > (wire77[(3'h4):(2'h3)] >= (~|reg82)))));
          if ((&($signed($signed({reg86, wire76})) ? (^(8'ha8)) : wire80)))
            begin
              reg87 <= (~&(~|wire80));
              reg88 <= ({({(wire79 ?
                          wire76 : (8'hb5))} < wire77[(3'h5):(1'h0)]),
                  (reg84[(2'h3):(2'h2)] << ((wire78 & wire78) ?
                      reg83 : reg82))} ^~ {wire76[(2'h3):(2'h3)], (+wire80)});
            end
          else
            begin
              reg87 <= ((($unsigned((~^wire78)) | $signed(wire75[(3'h5):(1'h1)])) && (~&$unsigned($unsigned(wire79)))) ?
                  ((({wire74} != $signed(reg84)) == (!reg81)) ?
                      reg81[(2'h3):(2'h3)] : ($unsigned((reg84 ?
                          wire75 : wire76)) >> reg84[(3'h4):(1'h1)])) : $signed((~$unsigned((+wire74)))));
              reg88 <= (reg87 >> $unsigned(reg88[(1'h1):(1'h1)]));
              reg89 <= $unsigned((~&wire75[(3'h4):(1'h1)]));
              reg90 <= ((((~|(reg81 && (8'ha5))) ?
                  ($signed(reg81) & $unsigned(reg81)) : $unsigned(reg85)) < reg86) + $signed((((reg81 ?
                  (8'ha3) : reg86) << (!reg81)) <<< ($unsigned(wire76) <= (reg86 + reg87)))));
            end
          reg91 <= $signed(reg86);
          reg92 <= $unsigned({$signed(((reg88 ? wire76 : (8'hb9)) ?
                  (~&wire78) : (8'ha6)))});
        end
      else
        begin
          if ($signed((8'hbb)))
            begin
              reg86 <= (8'hb3);
              reg87 <= ((8'ha6) ^ reg90);
            end
          else
            begin
              reg86 <= (((^~$signed((wire80 > wire76))) <= (~|reg82)) ?
                  ({$unsigned({reg84, wire76})} ?
                      (wire76[(4'he):(2'h2)] ?
                          (~^{reg87, (8'hbc)}) : ($signed(reg85) == ((8'ha5) ?
                              wire76 : reg92))) : {(8'haa)}) : reg92);
              reg87 <= (~&(~^$signed((~(wire74 - reg85)))));
              reg88 <= (~|(~$signed(reg83)));
              reg89 <= wire80;
            end
        end
      if (reg87)
        begin
          reg93 <= $unsigned(wire74[(4'h9):(1'h1)]);
          reg94 <= reg83[(4'hb):(2'h2)];
          reg95 <= (reg93 ?
              reg87 : (~&{$unsigned($signed(wire76)),
                  ((reg81 <= reg92) || reg88[(4'h9):(3'h5)])}));
        end
      else
        begin
          if ($signed($signed((wire74[(2'h3):(2'h2)] * reg82))))
            begin
              reg93 <= (~|(((|wire78) ?
                      ((~(8'ha7)) ?
                          $signed(reg94) : {reg83, reg83}) : ((8'hb6) ?
                          $signed(reg89) : wire78[(3'h6):(2'h2)])) ?
                  (7'h42) : reg88));
              reg94 <= $unsigned($unsigned({($signed(wire76) ?
                      wire77 : (8'h9f))}));
              reg95 <= $unsigned($signed($unsigned($signed(reg86))));
              reg96 <= $signed((|($signed($signed((8'ha6))) ?
                  wire74 : (~reg87))));
            end
          else
            begin
              reg93 <= (+{$signed(((wire74 ? wire77 : wire75) > (reg81 ?
                      wire77 : reg86))),
                  reg92[(4'hb):(3'h5)]});
              reg94 <= (~|(reg93 ? reg92 : (^~$unsigned((~wire75)))));
              reg95 <= ((($unsigned($signed(wire76)) > reg87) | $signed($unsigned($unsigned(wire75)))) <= $signed(($signed($unsigned(wire80)) ?
                  ((reg82 > reg96) >= {reg93,
                      reg95}) : $signed($unsigned((8'ha0))))));
              reg96 <= (($signed($signed((reg91 & wire78))) - (8'haf)) ?
                  {{(8'ha4)}} : (reg90 ^~ $signed($unsigned(wire78))));
              reg97 <= ({wire80} < ((~&reg93[(1'h0):(1'h0)]) ?
                  (($signed(reg95) << {wire75}) | (&(reg90 ?
                      reg85 : wire77))) : ((8'ha0) ?
                      (|reg90[(3'h7):(3'h6)]) : wire74[(4'ha):(3'h6)])));
            end
          reg98 <= reg81[(2'h2):(1'h0)];
          reg99 <= ((wire76[(4'ha):(2'h3)] == {((reg81 ? reg87 : reg94) ?
                      (reg90 | reg95) : wire77[(3'h4):(1'h1)])}) ?
              (+{((reg91 ? reg95 : reg92) ?
                      (wire74 ? reg81 : reg85) : $signed(reg83)),
                  ({(7'h44), reg95} ?
                      reg91 : {wire78, reg85})}) : $unsigned({reg83,
                  $unsigned(wire79[(4'hd):(4'hb)])}));
        end
      reg100 <= (!$unsigned(reg81[(3'h5):(3'h4)]));
    end
  assign wire101 = (~^$signed($unsigned((|{reg98}))));
  assign wire102 = (~&wire79);
  assign wire103 = (8'hbf);
endmodule

module module21  (y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire25;
  input wire [(4'hc):(1'h0)] wire24;
  input wire signed [(5'h14):(1'h0)] wire23;
  input wire [(4'hb):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire64;
  wire [(4'h9):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire61;
  assign y = {wire67, wire66, wire65, wire64, wire63, wire61, (1'h0)};
  module26 #() modinst62 (wire61, clk, wire25, wire22, wire23, wire24, (8'h9d));
  assign wire63 = (~wire25[(4'hc):(3'h6)]);
  assign wire64 = {wire61[(3'h4):(1'h0)]};
  assign wire65 = {($signed(($signed(wire64) ?
                              $signed(wire61) : (wire25 ? wire23 : wire64))) ?
                          $signed({(wire64 ?
                                  wire63 : wire22)}) : wire64[(3'h5):(2'h3)]),
                      $unsigned((wire64 ?
                          $unsigned($signed((8'hac))) : {(wire25 ?
                                  (8'ha3) : wire63)}))};
  assign wire66 = ((wire24 ?
                      (~&wire65[(3'h5):(3'h4)]) : (+wire23)) << (~^($unsigned((~|wire25)) ?
                      ($unsigned(wire64) == {wire23,
                          wire24}) : ($signed(wire23) << (wire23 ~^ wire63)))));
  assign wire67 = wire24[(4'ha):(2'h2)];
endmodule

module module26
#(parameter param60 = ((~(~^((8'hae) ? ((8'hb3) ? (8'hae) : (8'h9d)) : ((8'ha6) - (8'ha4))))) || (~|(^~((!(8'haf)) >>> ((7'h40) | (8'ha6)))))))
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h151):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire31;
  input wire signed [(3'h5):(1'h0)] wire30;
  input wire signed [(2'h3):(1'h0)] wire29;
  input wire signed [(4'hc):(1'h0)] wire28;
  input wire [(4'hf):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire59;
  wire [(3'h7):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire57;
  wire signed [(5'h14):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
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
                 (1'h0)};
  assign wire32 = $signed(wire28);
  assign wire33 = $unsigned(wire32);
  assign wire34 = {{(wire29[(2'h3):(2'h3)] & $unsigned(wire27[(3'h7):(3'h4)]))}};
  assign wire35 = (+$unsigned(wire31));
  assign wire36 = (wire32 ?
                      wire30[(3'h4):(3'h4)] : $signed($unsigned(((wire34 ?
                          wire28 : wire27) >> $unsigned(wire33)))));
  assign wire37 = (|wire32);
  assign wire38 = {{(8'hb8)}};
  assign wire39 = wire37;
  always
    @(posedge clk) begin
      reg40 <= (8'hbe);
      reg41 <= {($unsigned(wire39[(4'hd):(2'h3)]) ?
              (!wire34[(4'hd):(2'h2)]) : {wire30[(1'h0):(1'h0)],
                  (-(wire28 ? wire27 : wire31))})};
      reg42 <= {$unsigned((8'hbb)), {$unsigned((~&wire30))}};
    end
  always
    @(posedge clk) begin
      if ($signed((($signed($unsigned(wire31)) << $unsigned($unsigned(wire27))) - (&$signed(((8'hb8) ^~ wire29))))))
        begin
          if (wire28[(3'h4):(2'h2)])
            begin
              reg43 <= $signed({$signed(wire35)});
              reg44 <= (7'h41);
            end
          else
            begin
              reg43 <= $signed((!wire38[(3'h7):(1'h1)]));
              reg44 <= ((~^$unsigned($unsigned(((8'ha8) ?
                  wire30 : wire34)))) - $unsigned($unsigned({(~|wire37),
                  (reg40 ? (8'hbf) : reg42)})));
            end
          reg45 <= wire34;
          if ($unsigned(wire37))
            begin
              reg46 <= wire31[(3'h4):(1'h1)];
              reg47 <= (8'hbb);
            end
          else
            begin
              reg46 <= $signed({$signed(((8'ha3) >>> {wire33})),
                  (^~$unsigned($signed((8'hbf))))});
              reg47 <= wire27;
              reg48 <= $unsigned(($signed((8'ha0)) & wire32[(3'h4):(1'h1)]));
              reg49 <= $signed(wire31);
              reg50 <= ({(!$signed((reg45 ? wire28 : reg48)))} <<< wire38);
            end
          reg51 <= (wire35[(4'ha):(3'h4)] ~^ (8'hb8));
          reg52 <= {(wire34[(4'h9):(2'h3)] ?
                  (^~$signed((reg40 || (8'hbb)))) : (wire39 <= reg43[(1'h1):(1'h1)]))};
        end
      else
        begin
          reg43 <= wire33;
          reg44 <= (~($signed(($signed((8'hbf)) < reg42)) - $signed(reg51[(2'h2):(2'h2)])));
        end
      reg53 <= $unsigned(wire27);
      reg54 <= (wire30[(2'h2):(1'h0)] ?
          $unsigned({(|(wire29 <= wire30))}) : $unsigned((8'ha9)));
      reg55 <= ((((reg46 ? $unsigned(reg50) : (+reg42)) ?
              {reg48[(3'h4):(1'h1)],
                  wire32} : $signed(((8'haa) != wire36))) >> ((~|{reg46,
              wire36}) >= ((reg41 > reg51) ?
              {wire38, reg52} : $signed(reg51)))) ?
          reg53 : (~&$signed((~(reg48 + reg47)))));
      reg56 <= wire38[(3'h4):(2'h3)];
    end
  assign wire57 = {(^$signed((~&$unsigned(wire35))))};
  assign wire58 = wire32[(4'h9):(3'h5)];
  assign wire59 = wire27;
endmodule
