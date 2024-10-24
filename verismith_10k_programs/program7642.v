module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire130;
  wire signed [(3'h7):(1'h0)] wire129;
  wire signed [(5'h14):(1'h0)] wire128;
  wire signed [(4'he):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire126;
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire29,
                 wire126,
                 reg31,
                 (1'h0)};
  assign wire5 = ($signed($unsigned(($unsigned(wire1) ?
                     wire1[(4'ha):(4'ha)] : (wire1 ?
                         wire4 : wire0)))) >> ((($unsigned(wire1) ?
                     $signed((8'ha1)) : wire2[(1'h0):(1'h0)]) ^ wire3) - (8'ha5)));
  assign wire6 = (~&wire4[(4'h8):(3'h6)]);
  assign wire7 = {$signed((!$unsigned((wire6 || wire5)))),
                     $signed(((8'hae) ? {wire5, $unsigned(wire2)} : (8'h9c)))};
  assign wire8 = wire3[(1'h1):(1'h1)];
  assign wire9 = $unsigned($unsigned(wire0));
  assign wire10 = (($signed(wire9[(1'h1):(1'h0)]) ?
                          $signed({(wire3 ?
                                  wire4 : wire7)}) : $signed(((-wire7) ?
                              (wire5 ? wire6 : (7'h43)) : $unsigned(wire5)))) ?
                      wire4[(4'hc):(4'hb)] : (8'had));
  assign wire11 = wire10[(2'h2):(1'h1)];
  assign wire12 = (+wire3[(2'h2):(1'h1)]);
  assign wire13 = (~&$signed((~&(+wire12[(2'h2):(1'h0)]))));
  assign wire14 = wire9;
  assign wire15 = (~^($signed((~&wire8)) | (($signed(wire13) ?
                      (8'hbc) : (~(8'hbe))) <<< $signed(wire7))));
  module16 #() modinst30 (.clk(clk), .wire20(wire0), .wire17(wire5), .y(wire29), .wire19(wire1), .wire18(wire7));
  always
    @(posedge clk) begin
      reg31 <= (+(&(wire4 >= wire1[(5'h11):(3'h7)])));
    end
  module32 #() modinst127 (wire126, clk, wire7, wire29, wire6, wire12, wire14);
  assign wire128 = (|$unsigned($signed((wire9 * $signed(wire0)))));
  assign wire129 = ({wire10[(1'h1):(1'h0)]} <= {$unsigned(reg31),
                       ((&(-wire3)) >= {wire1[(4'he):(3'h7)],
                           ((8'ha8) ? (8'ha6) : wire14)})});
  assign wire130 = wire129[(3'h7):(1'h0)];
endmodule

module module32
#(parameter param125 = ((^(^~((+(8'ha0)) & {(8'hbd), (8'hbb)}))) & (&((((8'had) ? (8'ha1) : (8'ha5)) ? ((8'hab) ? (8'hbb) : (7'h41)) : ((8'haa) ? (8'ha8) : (8'hbf))) ? (((8'hbc) ? (8'ha3) : (8'ha0)) + ((8'h9f) ? (8'ha9) : (8'ha6))) : (|(^~(8'hba)))))))
(y, clk, wire33, wire34, wire35, wire36, wire37);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire33;
  input wire signed [(5'h15):(1'h0)] wire34;
  input wire [(5'h15):(1'h0)] wire35;
  input wire [(4'hf):(1'h0)] wire36;
  input wire signed [(4'hd):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire124;
  wire [(5'h15):(1'h0)] wire123;
  wire [(4'hb):(1'h0)] wire122;
  wire [(2'h3):(1'h0)] wire121;
  wire [(5'h10):(1'h0)] wire120;
  wire signed [(4'hf):(1'h0)] wire112;
  wire signed [(4'h8):(1'h0)] wire111;
  wire [(3'h4):(1'h0)] wire110;
  wire signed [(4'ha):(1'h0)] wire109;
  wire [(5'h10):(1'h0)] wire108;
  wire [(4'hf):(1'h0)] wire107;
  wire [(2'h2):(1'h0)] wire106;
  wire signed [(5'h10):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire67;
  wire signed [(3'h6):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire70;
  wire [(2'h2):(1'h0)] wire104;
  reg [(3'h5):(1'h0)] reg119 = (1'h0);
  reg [(5'h10):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg117 = (1'h0);
  reg [(4'hf):(1'h0)] reg116 = (1'h0);
  reg [(4'hf):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg114 = (1'h0);
  reg [(4'hf):(1'h0)] reg113 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire38,
                 wire39,
                 wire67,
                 wire69,
                 wire70,
                 wire104,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 (1'h0)};
  assign wire38 = ({(wire33[(3'h5):(2'h3)] > ((wire34 ^ (8'h9d)) <<< $signed(wire36))),
                          (~wire33)} ?
                      ($signed({wire34[(3'h5):(3'h5)], wire33}) ?
                          (-wire36) : ((~(wire36 ?
                              wire35 : wire33)) <<< wire33)) : $signed(((~|wire34) ?
                          wire36 : ($unsigned(wire37) ?
                              $signed(wire37) : (~^wire34)))));
  assign wire39 = wire36[(1'h1):(1'h0)];
  module40 #() modinst68 (.y(wire67), .clk(clk), .wire44(wire33), .wire41(wire37), .wire42(wire38), .wire43(wire35));
  assign wire69 = (^wire36[(2'h3):(2'h3)]);
  assign wire70 = wire38;
  module71 #() modinst105 (wire104, clk, wire70, wire35, wire37, wire33, wire39);
  assign wire106 = ((|(-$signed(((8'h9c) ? wire36 : (8'hb0))))) ?
                       ((^~(wire37 >> (~|wire70))) >>> {{(wire69 * wire67)}}) : (!($signed((!(8'ha1))) == (wire37[(3'h4):(1'h1)] >> (wire33 ?
                           wire36 : wire37)))));
  assign wire107 = (wire67 ?
                       (~^(|wire37[(4'hd):(2'h3)])) : $unsigned((!wire69)));
  assign wire108 = wire69[(2'h2):(2'h2)];
  assign wire109 = (|(|(~&((~|wire107) >> $unsigned(wire67)))));
  assign wire110 = ((7'h43) >= wire35[(4'h8):(3'h6)]);
  assign wire111 = {({wire67[(3'h5):(2'h2)]} << wire108[(4'hb):(2'h3)]),
                       (!(($signed(wire34) && {wire109}) ?
                           {(~|wire110), wire67} : wire70))};
  assign wire112 = wire67[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg113 <= (({(-$signed((8'hbe)))} != ((^$signed(wire112)) != $signed((!wire33)))) ?
          (~$unsigned(((wire112 ^~ (8'ha3)) ?
              (wire107 & wire69) : (wire35 ?
                  (7'h44) : wire37)))) : ($signed(((wire69 < (8'hb2)) >>> $unsigned(wire106))) ?
              $signed($unsigned(wire69[(3'h4):(2'h3)])) : $signed($signed({wire70}))));
      reg114 <= $unsigned({(wire106 ? (8'had) : $signed(reg113))});
      if ($unsigned(((8'hb3) ?
          (wire36[(4'h8):(4'h8)] != wire110[(1'h0):(1'h0)]) : $unsigned((~$unsigned(wire34))))))
        begin
          reg115 <= (~$signed((^reg113[(4'hd):(4'hd)])));
          if ($unsigned($unsigned({$signed(wire34[(4'hc):(2'h2)])})))
            begin
              reg116 <= {(~|(wire111 > $signed(wire38)))};
              reg117 <= (8'ha3);
            end
          else
            begin
              reg116 <= (-reg117);
              reg117 <= ((-(-$unsigned($unsigned(reg114)))) ?
                  ({$signed((reg115 <= wire69))} + ($signed((wire39 ?
                      wire106 : wire107)) << $unsigned($signed(wire106)))) : wire104[(1'h1):(1'h0)]);
              reg118 <= $signed(wire111);
            end
        end
      else
        begin
          reg115 <= ($unsigned(((((8'ha4) ?
                  (8'hbc) : wire36) >= $unsigned(wire106)) <<< wire108)) ?
              ($unsigned(((8'hb0) ?
                  wire104[(1'h1):(1'h1)] : $unsigned(wire34))) && $signed($signed((+(8'hbb))))) : wire108[(4'hd):(1'h1)]);
          reg116 <= wire67;
        end
      reg119 <= wire107;
    end
  assign wire120 = $unsigned($unsigned(wire33));
  assign wire121 = wire67;
  assign wire122 = wire104[(2'h2):(1'h0)];
  assign wire123 = (&$unsigned($signed((reg115[(1'h1):(1'h1)] ?
                       (~&(8'hba)) : {reg116}))));
  assign wire124 = wire69;
endmodule

module module16
#(parameter param27 = (((~&(~|((7'h40) ? (8'ha2) : (8'h9d)))) ? {(8'hbd)} : (({(8'hbe), (8'h9f)} && ((8'hb9) + (8'hab))) ^~ (8'ha4))) <= (((|((8'hb0) > (8'hb8))) ? ({(8'hb8), (8'hbd)} >>> ((7'h43) + (7'h44))) : (^((8'h9c) < (8'hb1)))) && ((((8'ha0) >>> (8'hb2)) ? ((8'ha5) ? (8'hba) : (8'ha0)) : ((8'hb5) >> (8'hb8))) ? ((^~(8'hb8)) ? (&(8'hbf)) : (8'hbe)) : (+((8'ha4) ? (8'h9d) : (8'ha8)))))), 
parameter param28 = param27)
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire20;
  input wire [(3'h4):(1'h0)] wire19;
  input wire signed [(5'h14):(1'h0)] wire18;
  input wire [(4'hb):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire21;
  assign y = {wire26, wire25, wire24, wire23, wire22, wire21, (1'h0)};
  assign wire21 = (7'h43);
  assign wire22 = (^wire17[(2'h3):(2'h2)]);
  assign wire23 = wire21;
  assign wire24 = wire20[(3'h6):(3'h6)];
  assign wire25 = $signed((~&$signed(((wire21 ? wire19 : wire23) ?
                      wire19[(3'h4):(2'h3)] : (8'hbc)))));
  assign wire26 = wire22;
endmodule

module module71
#(parameter param103 = {(((((7'h43) > (8'ha8)) | (-(8'hb6))) <<< ({(8'ha9)} == {(8'ha3)})) ? ((8'hab) <<< {{(8'hb5)}, {(8'haf), (8'had)}}) : ((((8'ha8) ? (8'hab) : (8'hb4)) != {(8'hbb), (7'h40)}) ? (((7'h42) ? (8'hb2) : (8'haf)) ~^ (&(8'haa))) : (&(~(8'haa)))))})
(y, clk, wire76, wire75, wire74, wire73, wire72);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire76;
  input wire signed [(3'h5):(1'h0)] wire75;
  input wire [(3'h6):(1'h0)] wire74;
  input wire signed [(2'h3):(1'h0)] wire73;
  input wire [(3'h5):(1'h0)] wire72;
  wire [(2'h2):(1'h0)] wire102;
  wire signed [(5'h12):(1'h0)] wire101;
  wire [(3'h7):(1'h0)] wire100;
  wire [(2'h3):(1'h0)] wire99;
  wire [(4'he):(1'h0)] wire98;
  wire signed [(5'h10):(1'h0)] wire97;
  wire signed [(2'h3):(1'h0)] wire77;
  reg signed [(5'h10):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(4'h9):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(2'h2):(1'h0)] reg91 = (1'h0);
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  reg [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg [(2'h3):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire77,
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
                 (1'h0)};
  assign wire77 = wire76;
  always
    @(posedge clk) begin
      reg78 <= $unsigned($signed(wire73[(2'h2):(2'h2)]));
      if (($unsigned(wire75[(2'h3):(1'h1)]) << ($unsigned(wire73[(1'h1):(1'h1)]) <= $signed($unsigned((-wire73))))))
        begin
          reg79 <= ({wire72[(1'h0):(1'h0)], wire72[(2'h2):(1'h1)]} ?
              $signed(reg78) : wire76);
          reg80 <= $signed((wire72 != wire74));
          if (($signed(wire76) ?
              $unsigned($signed(((~&wire75) || (reg80 ?
                  (8'haa) : wire72)))) : $unsigned(reg79)))
            begin
              reg81 <= (8'hba);
              reg82 <= (((reg79[(1'h0):(1'h0)] || $signed(reg80)) && {{(wire74 < wire76)}}) ?
                  $signed((reg79 ?
                      ((wire74 ? (8'hb6) : (8'hba)) ~^ (wire72 ?
                          wire73 : (8'hab))) : {(8'haa),
                          $signed((8'h9f))})) : {{($unsigned((8'hac)) ?
                              (8'hb0) : (reg80 ? wire75 : (8'hb4))),
                          $signed($unsigned(wire75))},
                      ($signed((8'hb2)) != wire74)});
              reg83 <= (~|(wire72 | (reg82 < $signed((&(8'ha8))))));
              reg84 <= (~(&$unsigned($signed({reg83}))));
            end
          else
            begin
              reg81 <= $signed(wire77[(1'h0):(1'h0)]);
              reg82 <= {({($unsigned(reg84) & {reg79}),
                          $unsigned(((8'hb6) ? reg82 : reg81))} ?
                      {(~^(7'h43)), $unsigned({(8'ha6)})} : ((^~(!wire76)) ?
                          $unsigned(wire77[(2'h3):(1'h0)]) : reg83[(3'h4):(2'h3)])),
                  wire76[(4'h8):(1'h0)]};
            end
        end
      else
        begin
          reg79 <= ((($signed(reg84) - ((reg81 ? reg80 : reg78) ?
                      (reg79 ? (7'h40) : (8'hb8)) : (reg78 >= wire73))) ?
                  wire75 : (wire77 ?
                      ((~&reg81) ?
                          (wire76 ^~ reg83) : (reg84 ?
                              wire76 : reg82)) : wire77)) ?
              reg82 : $signed($signed(wire72[(2'h3):(1'h0)])));
          reg80 <= reg84[(2'h3):(2'h3)];
          reg81 <= $signed((wire75 >>> {($unsigned((8'ha5)) >= $signed(reg78))}));
          reg82 <= reg84[(2'h3):(1'h0)];
        end
    end
  always
    @(posedge clk) begin
      reg85 <= {wire74, (!$signed(reg84[(1'h0):(1'h0)]))};
      if ($signed(((reg79[(4'hb):(4'h9)] ?
              (reg83[(4'hb):(4'h8)] >= (wire74 ?
                  wire74 : wire74)) : (~|{wire74})) ?
          reg79 : (reg85 && ((~&reg83) ?
              ((8'hba) ? reg85 : reg81) : (reg80 ? (8'ha0) : reg78))))))
        begin
          reg86 <= {{reg83[(4'he):(4'hc)],
                  (^(wire77 ^ reg83[(5'h11):(3'h6)]))}};
        end
      else
        begin
          reg86 <= {$unsigned((-((&(8'hb8)) ?
                  (wire73 && reg86) : (reg86 >= wire73)))),
              reg79[(1'h0):(1'h0)]};
          reg87 <= {((wire73[(2'h2):(1'h0)] || ({wire73, wire74} >>> (wire72 ?
                      wire72 : wire75))) ?
                  ((~|wire76) ?
                      wire75 : (reg81 ?
                          (-reg81) : (~reg85))) : reg79[(3'h7):(1'h1)]),
              $signed(reg82)};
          reg88 <= wire73;
        end
      if ((~reg88))
        begin
          reg89 <= (8'hb4);
          reg90 <= reg78[(3'h7):(3'h7)];
          reg91 <= reg82[(4'ha):(3'h7)];
          reg92 <= ((((wire72[(2'h2):(2'h2)] || ((8'hb3) + (8'hb9))) << (reg78[(2'h2):(1'h1)] ?
                  $signed(reg78) : (reg91 ? reg81 : wire74))) ?
              $unsigned(reg82[(1'h1):(1'h1)]) : wire76) & (reg83[(4'he):(2'h2)] ?
              {reg83,
                  reg89} : ($unsigned((reg89 | reg82)) != $signed((^wire77)))));
          reg93 <= wire74[(1'h1):(1'h0)];
        end
      else
        begin
          reg89 <= (reg80[(3'h4):(3'h4)] > (reg90[(1'h0):(1'h0)] ?
              ((~^$unsigned(reg80)) ?
                  $unsigned((&wire72)) : ($signed(wire73) ?
                      reg92[(1'h0):(1'h0)] : (reg89 <= (8'ha0)))) : ($signed((~|(7'h44))) + reg82)));
          reg90 <= ($unsigned($signed({(wire77 >= reg86),
                  wire76[(3'h6):(3'h4)]})) ?
              (wire76[(3'h4):(1'h0)] >> reg93) : (($unsigned(reg93) ^ {reg81}) >> {reg84[(3'h5):(3'h4)]}));
          reg91 <= $signed(wire72);
          reg92 <= reg87;
          if (($signed((^~((reg91 ~^ (8'h9e)) || $unsigned((8'hac))))) ?
              ($signed(({(8'hbd)} & reg89[(4'h8):(1'h0)])) ?
                  (&reg89[(3'h7):(3'h6)]) : (|$signed(reg83[(3'h5):(3'h5)]))) : $unsigned(wire76[(3'h5):(3'h5)])))
            begin
              reg93 <= reg85[(1'h1):(1'h1)];
              reg94 <= ((reg93[(1'h0):(1'h0)] ?
                  (~reg82) : $unsigned(($signed(reg78) ?
                      ((8'hb3) << reg90) : (reg91 * reg84)))) > reg90[(3'h5):(2'h3)]);
            end
          else
            begin
              reg93 <= (((((-reg94) ?
                      $signed((8'hba)) : $signed((8'ha7))) < (reg89[(3'h4):(2'h3)] ?
                      (8'haf) : $signed(reg85))) >>> ($unsigned((reg93 ?
                          (8'hbe) : reg83)) ?
                      ($signed(wire72) >>> (+reg89)) : ($signed(reg94) ?
                          (|(8'hbc)) : {wire73}))) ?
                  $signed(reg79[(4'h9):(3'h4)]) : (reg94[(4'h8):(2'h3)] ?
                      wire75[(2'h2):(2'h2)] : (-(reg88[(4'hc):(4'ha)] <= (reg85 ?
                          reg92 : reg82)))));
              reg94 <= reg89;
              reg95 <= ((8'hbb) ?
                  $signed((($unsigned(reg94) << wire77) * ({reg78} * reg93[(2'h3):(2'h2)]))) : $unsigned(reg79));
            end
        end
      reg96 <= ($signed({$unsigned(reg86),
              (reg94[(3'h6):(3'h6)] ? $unsigned(wire75) : {reg85})}) ?
          $unsigned(reg83) : {{(((8'hb0) ?
                      (8'hbc) : (8'hb8)) > (wire75 - reg83))},
              $unsigned(({reg85} & $signed(wire77)))});
    end
  assign wire97 = (-($unsigned($unsigned((8'ha4))) ?
                      (|reg94[(3'h7):(2'h3)]) : wire74[(2'h2):(1'h0)]));
  assign wire98 = $signed(($signed($unsigned((wire75 ? (8'hb6) : reg89))) ?
                      (~|reg85) : wire72));
  assign wire99 = (8'ha2);
  assign wire100 = ((!{($unsigned(reg88) + (reg92 ?
                           reg85 : wire76))}) != reg88[(4'h9):(3'h7)]);
  assign wire101 = ((!reg81) ^~ (~(~($unsigned(wire77) ?
                       {reg82, (8'h9f)} : (reg81 ~^ wire75)))));
  assign wire102 = {wire76,
                       ((|(~^reg91[(2'h2):(2'h2)])) ?
                           $unsigned($signed($unsigned(wire73))) : (wire100 ?
                               (-$unsigned(reg85)) : (-{reg88})))};
endmodule

module module40
#(parameter param66 = (((^~{{(8'h9e), (8'haa)}}) ? ({(~^(8'hb0))} ? (((8'hb4) == (8'hb2)) * ((8'hac) << (8'h9d))) : (^~{(8'hb1), (7'h42)})) : ((^(8'hba)) ? ((!(8'haa)) < ((8'hba) == (8'hb4))) : (^~((8'ha0) ? (8'haa) : (8'ha3))))) + {{((+(8'hbf)) ? ((8'hae) ? (8'h9f) : (8'ha6)) : {(8'ha6), (8'haa)})}, ((((7'h42) < (8'hbc)) ? ((8'ha6) ? (8'haa) : (8'ha3)) : ((8'hb9) + (8'hb9))) ? ((!(8'hb7)) * {(8'h9f)}) : (~&((8'ha1) & (8'ha3))))}))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire44;
  input wire signed [(3'h6):(1'h0)] wire43;
  input wire [(4'hc):(1'h0)] wire42;
  input wire [(4'hd):(1'h0)] wire41;
  wire signed [(3'h5):(1'h0)] wire65;
  wire signed [(2'h2):(1'h0)] wire64;
  wire signed [(3'h7):(1'h0)] wire63;
  wire [(5'h14):(1'h0)] wire62;
  wire [(2'h2):(1'h0)] wire60;
  wire signed [(4'hd):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire54;
  wire [(4'hc):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire51;
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 reg61,
                 reg55,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg45 <= (((^$signed($unsigned(wire43))) > wire41[(4'hb):(3'h4)]) ?
          $unsigned($unsigned(wire41)) : $signed(wire41));
      reg46 <= wire41;
      reg47 <= ((^wire41) ?
          (wire41[(4'hc):(3'h5)] ?
              (((wire42 == wire42) ?
                      (wire44 ? (8'ha6) : (8'hb9)) : {wire43, reg46}) ?
                  (wire42[(3'h5):(1'h0)] ?
                      {(7'h43),
                          reg45} : {wire43}) : (wire43 ^ reg45)) : {(~&$signed((8'h9c))),
                  ((8'hb0) ~^ (-wire41))}) : $signed((~&($signed(wire43) ~^ (wire43 + wire41)))));
      reg48 <= ($unsigned($signed($unsigned($unsigned((8'ha8))))) * wire41);
      reg49 <= reg46[(2'h2):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg50 <= ($unsigned(reg48[(4'hf):(3'h6)]) ?
          $signed((8'hbf)) : (^~reg49[(4'hd):(4'hc)]));
    end
  assign wire51 = {((-wire41[(2'h2):(2'h2)]) ?
                          (($signed(reg50) ?
                              (!reg45) : (reg47 != (8'h9c))) - {{wire41},
                              (reg45 << (8'h9d))}) : wire41),
                      {$unsigned((wire41 ?
                              $unsigned(reg46) : reg50[(5'h13):(4'hf)])),
                          ((^(|wire43)) ?
                              $signed((~|reg45)) : {$signed(reg48)})}};
  assign wire52 = {wire41[(3'h5):(2'h2)]};
  assign wire53 = $signed({$signed($signed($unsigned(wire42))),
                      $signed(({reg48} < $unsigned((7'h40))))});
  assign wire54 = wire51;
  always
    @(posedge clk) begin
      reg55 <= $unsigned(wire52);
    end
  assign wire56 = wire51[(1'h1):(1'h0)];
  assign wire57 = (~^$unsigned(({(!wire42)} ?
                      $unsigned(wire43[(3'h6):(3'h4)]) : ((wire42 ?
                              reg55 : wire51) ?
                          (|wire43) : wire44[(2'h3):(2'h3)]))));
  assign wire58 = $unsigned((^~{$signed(((8'haf) ? (7'h41) : wire51))}));
  assign wire59 = reg46[(1'h0):(1'h0)];
  assign wire60 = ($signed($signed((wire42[(2'h2):(1'h1)] ?
                      $signed(reg48) : (|wire59)))) == wire44);
  always
    @(posedge clk) begin
      reg61 <= wire54[(4'hc):(3'h4)];
    end
  assign wire62 = $signed(($unsigned(wire54) * {wire60, reg46}));
  assign wire63 = wire51[(2'h2):(2'h2)];
  assign wire64 = ($signed((~|$unsigned($signed(reg47)))) ?
                      (wire63 * wire59[(3'h4):(2'h2)]) : wire57);
  assign wire65 = wire56;
endmodule
