module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire155;
  wire signed [(4'hb):(1'h0)] wire154;
  wire signed [(4'h8):(1'h0)] wire153;
  wire [(3'h7):(1'h0)] wire152;
  wire [(5'h13):(1'h0)] wire150;
  wire [(5'h12):(1'h0)] wire146;
  wire signed [(5'h15):(1'h0)] wire144;
  wire [(3'h5):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire33;
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  reg [(5'h10):(1'h0)] reg148 = (1'h0);
  reg [(4'h9):(1'h0)] reg147 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire150,
                 wire146,
                 wire144,
                 wire5,
                 wire33,
                 reg149,
                 reg148,
                 reg147,
                 reg6,
                 reg7,
                 (1'h0)};
  assign wire5 = ($signed(($signed((wire2 ? wire4 : wire1)) ?
                         $unsigned($unsigned((8'hac))) : $unsigned(((7'h41) ?
                             wire2 : (8'hb9))))) ?
                     $signed({{(+wire2)}}) : ({($unsigned(wire4) & wire2[(4'ha):(3'h5)])} ?
                         (wire3 ?
                             (~|$unsigned(wire3)) : {(wire0 ?
                                     wire4 : wire2)}) : (~|$unsigned((~|wire1)))));
  always
    @(posedge clk) begin
      reg6 <= (wire0 + (~^(^$signed((wire5 ? wire1 : wire2)))));
      reg7 <= ((~|$signed(wire2)) ? $unsigned(wire3[(3'h5):(3'h5)]) : wire5);
    end
  module8 #() modinst34 (.wire11(wire1), .wire12(wire3), .clk(clk), .y(wire33), .wire10(reg6), .wire9(wire4));
  module35 #() modinst145 (.wire38(reg6), .wire39(wire1), .clk(clk), .wire36(reg7), .wire37(wire3), .y(wire144));
  assign wire146 = reg6;
  always
    @(posedge clk) begin
      if (({(reg6 >= ($unsigned(wire144) - (wire0 ? wire1 : wire5)))} ?
          (!({$unsigned(reg6),
              $signed((8'hbf))} << $signed((^~wire2)))) : ($unsigned((wire2 <= (wire2 && wire33))) ?
              wire0[(3'h6):(3'h6)] : (wire5[(3'h5):(1'h0)] ?
                  {wire33[(2'h3):(2'h3)]} : $signed({wire2, (8'h9d)})))))
        begin
          reg147 <= (wire3 * (-({((8'hb8) ? wire3 : wire146), {wire5}} ?
              $unsigned($unsigned(wire1)) : ($unsigned(reg6) ?
                  (wire3 < wire2) : (wire144 ? wire3 : wire5)))));
          reg148 <= wire146[(5'h10):(4'hb)];
          reg149 <= reg147[(1'h0):(1'h0)];
        end
      else
        begin
          reg147 <= wire3[(4'h9):(4'h8)];
          reg148 <= ((&(~wire2[(5'h10):(4'hd)])) ?
              (~|(^~{(wire2 ? wire144 : (8'hba)),
                  reg149[(1'h1):(1'h1)]})) : ((-reg149[(1'h1):(1'h1)]) ?
                  wire4 : (8'hbe)));
        end
    end
  module35 #() modinst151 (wire150, clk, reg148, wire1, reg6, wire0);
  assign wire152 = wire150[(5'h13):(5'h12)];
  assign wire153 = wire2[(3'h6):(3'h5)];
  assign wire154 = $signed(((wire144 << (wire1 >= (reg148 ^ wire4))) == $unsigned(($unsigned(wire1) ?
                       $unsigned(wire153) : {wire144}))));
  assign wire155 = {(({reg147, reg149} ?
                               $signed(wire0[(1'h0):(1'h0)]) : ((wire1 ?
                                       wire152 : reg6) ?
                                   ((8'h9d) * wire2) : (^(8'ha7)))) ?
                           $signed((reg149 ?
                               wire146 : (|wire1))) : reg6[(2'h3):(2'h2)])};
endmodule

module module35
#(parameter param142 = (~^(((~&{(8'hb7), (8'ha9)}) ? (((8'h9d) & (8'ha5)) ? ((8'hb5) & (8'ha8)) : ((8'ha8) ? (8'ha1) : (8'hb1))) : (((8'ha1) * (8'h9d)) ? ((7'h43) ^~ (8'hb3)) : ((8'h9e) != (8'hb9)))) <= {(((8'hae) ? (8'hb5) : (7'h43)) ? (+(8'hae)) : {(8'h9d), (8'ha2)})})), 
parameter param143 = (((((~&param142) ? {param142} : {param142, param142}) ? (^~{param142, param142}) : {param142}) ? param142 : ({param142, param142} && ((8'hb6) ? {param142} : ((8'hae) ? param142 : param142)))) ? (^param142) : (!param142)))
(y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire39;
  input wire [(3'h6):(1'h0)] wire38;
  input wire signed [(5'h13):(1'h0)] wire37;
  input wire signed [(3'h6):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire141;
  wire [(4'hd):(1'h0)] wire140;
  wire signed [(2'h3):(1'h0)] wire139;
  wire [(2'h2):(1'h0)] wire138;
  wire signed [(4'hb):(1'h0)] wire134;
  wire signed [(4'h8):(1'h0)] wire133;
  wire signed [(4'h8):(1'h0)] wire132;
  wire [(5'h15):(1'h0)] wire131;
  wire signed [(3'h4):(1'h0)] wire129;
  wire signed [(5'h13):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire40;
  reg [(3'h4):(1'h0)] reg137 = (1'h0);
  reg [(2'h2):(1'h0)] reg136 = (1'h0);
  reg signed [(4'he):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg41 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire129,
                 wire65,
                 wire44,
                 wire43,
                 wire42,
                 wire40,
                 reg137,
                 reg136,
                 reg135,
                 reg41,
                 (1'h0)};
  assign wire40 = ($signed((~|wire36)) ?
                      (($signed($unsigned(wire38)) ?
                          {(wire36 ? wire36 : wire36)} : ((~wire37) ?
                              wire38[(2'h2):(1'h1)] : {wire39})) != $signed((^$unsigned(wire36)))) : ((^(^wire39)) >> wire39[(4'he):(4'h9)]));
  always
    @(posedge clk) begin
      reg41 <= ((~&{($unsigned(wire37) ?
              $signed(wire36) : {wire39, wire40})}) != (^$unsigned((8'had))));
    end
  assign wire42 = (~^(wire37[(4'h9):(3'h7)] ?
                      (~&((!wire38) >> $signed(reg41))) : ($unsigned((+wire40)) & reg41)));
  assign wire43 = wire39;
  assign wire44 = wire42[(1'h1):(1'h1)];
  module45 #() modinst66 (wire65, clk, wire44, wire42, wire37, reg41, wire36);
  module67 #() modinst130 (wire129, clk, wire65, wire38, wire39, wire43);
  assign wire131 = {(!((+{wire38}) < (wire43[(2'h3):(2'h2)] >> (wire42 ?
                           wire44 : wire129)))),
                       $signed($unsigned(wire36[(1'h1):(1'h0)]))};
  assign wire132 = {wire65[(2'h2):(2'h2)], (8'hb2)};
  assign wire133 = ((~$signed((((8'hbe) ? reg41 : reg41) ?
                           (wire36 ? wire65 : wire129) : $signed(wire43)))) ?
                       reg41 : wire37[(4'hb):(3'h6)]);
  assign wire134 = $unsigned({($unsigned($unsigned(wire37)) ?
                           $signed(wire65[(5'h12):(4'hf)]) : {wire43,
                               (|wire44)})});
  always
    @(posedge clk) begin
      reg135 <= ((8'ha1) == (^~wire42));
      reg136 <= ($unsigned({(~&wire42[(3'h4):(3'h4)])}) <= $unsigned((-($unsigned(wire42) ?
          (wire38 << wire132) : wire39))));
      reg137 <= $unsigned($signed(((~&wire131) <<< {wire133,
          reg41[(3'h7):(3'h6)]})));
    end
  assign wire138 = wire40[(2'h3):(2'h2)];
  assign wire139 = reg137[(2'h3):(1'h0)];
  assign wire140 = $signed(wire37[(4'he):(4'ha)]);
  assign wire141 = (wire42[(4'hb):(4'ha)] ?
                       (wire44[(3'h4):(1'h0)] ?
                           wire37[(3'h5):(3'h4)] : ($unsigned((~reg136)) ~^ $unsigned((reg137 < wire36)))) : reg137[(2'h3):(1'h0)]);
endmodule

module module8
#(parameter param32 = (~(~^(^{{(8'hb4), (8'hb9)}}))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire [(3'h4):(1'h0)] wire10;
  input wire signed [(4'h8):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire13;
  assign y = {wire30, wire15, wire14, wire13, (1'h0)};
  assign wire13 = $unsigned({(~^$signed(wire9)), wire10[(1'h1):(1'h1)]});
  assign wire14 = {({wire9} & (~($unsigned(wire9) != (8'haa))))};
  assign wire15 = ($unsigned($signed((!(~&wire9)))) ?
                      {((^(wire14 <<< wire9)) ?
                              (|wire10[(2'h3):(2'h3)]) : (8'hb7)),
                          $unsigned($signed((|wire10)))} : ($signed((wire13 >= (wire10 ?
                              wire10 : wire10))) ?
                          (|(((8'ha7) ? wire11 : wire14) ?
                              wire13 : (wire12 ?
                                  wire9 : (8'ha7)))) : (!wire10)));
  module16 #() modinst31 (.wire20(wire14), .wire17(wire12), .wire19(wire15), .clk(clk), .y(wire30), .wire18(wire13));
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire20;
  input wire [(3'h5):(1'h0)] wire19;
  input wire signed [(5'h11):(1'h0)] wire18;
  input wire [(3'h4):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire21 = wire17[(1'h1):(1'h0)];
  assign wire22 = wire19;
  assign wire23 = {wire17[(1'h0):(1'h0)]};
  assign wire24 = wire23;
  always
    @(posedge clk) begin
      if ({$unsigned((({(8'ha2)} ? wire18 : $signed(wire19)) ?
              wire18[(4'h8):(3'h4)] : $unsigned($signed(wire22))))})
        begin
          reg25 <= wire17;
          reg26 <= $signed($signed(wire22));
          reg27 <= $signed(wire19);
        end
      else
        begin
          reg25 <= $unsigned($unsigned(wire23));
          reg26 <= (~((~&wire22) >>> $signed((wire22 ?
              wire17[(1'h0):(1'h0)] : $signed((8'hb2))))));
        end
      reg28 <= ((~$unsigned(wire21)) ^~ wire17);
      reg29 <= $unsigned(($unsigned($unsigned((wire23 ?
          wire17 : wire18))) ^~ (~^($signed(wire20) || (~wire18)))));
    end
endmodule

module module67
#(parameter param127 = (~|{(~|(((8'hab) && (7'h43)) >> {(7'h43)})), (!((8'ha0) <= (^(8'hb1))))}), 
parameter param128 = (^param127))
(y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'h216):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire71;
  input wire signed [(3'h4):(1'h0)] wire70;
  input wire [(4'h8):(1'h0)] wire69;
  input wire [(4'hb):(1'h0)] wire68;
  wire signed [(2'h2):(1'h0)] wire126;
  wire signed [(2'h3):(1'h0)] wire120;
  wire signed [(2'h3):(1'h0)] wire119;
  wire signed [(3'h4):(1'h0)] wire118;
  wire [(2'h2):(1'h0)] wire117;
  wire [(4'h9):(1'h0)] wire116;
  wire [(3'h5):(1'h0)] wire115;
  wire signed [(4'he):(1'h0)] wire114;
  wire [(4'hd):(1'h0)] wire113;
  wire signed [(4'h8):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire111;
  wire [(4'h9):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire109;
  wire signed [(5'h14):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire72;
  reg [(3'h7):(1'h0)] reg125 = (1'h0);
  reg [(4'hc):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg123 = (1'h0);
  reg [(3'h7):(1'h0)] reg122 = (1'h0);
  reg [(4'ha):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(3'h4):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg [(3'h7):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg100 = (1'h0);
  reg [(3'h6):(1'h0)] reg99 = (1'h0);
  reg [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(4'he):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(3'h4):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg [(3'h6):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg [(4'h9):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg78 = (1'h0);
  reg [(3'h5):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  assign y = {wire126,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire74,
                 wire73,
                 wire72,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg107,
                 reg106,
                 reg105,
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
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire72 = {(8'ha2)};
  assign wire73 = ((~&$signed($signed((8'ha1)))) ?
                      $unsigned($unsigned({$signed(wire69),
                          (wire72 - wire72)})) : ((~|({wire68} ?
                              (~^(8'ha9)) : $unsigned(wire71))) ?
                          $unsigned(((-wire71) > $unsigned(wire70))) : $signed((-(^wire72)))));
  assign wire74 = wire69[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg75 <= wire68[(2'h3):(1'h0)];
      reg76 <= (^~(+(wire70 ?
          $unsigned($unsigned(wire71)) : ($unsigned(wire73) ?
              reg75[(1'h1):(1'h0)] : wire74))));
      reg77 <= $unsigned(($unsigned($unsigned((reg76 ~^ wire70))) && $signed($unsigned((8'hb9)))));
      reg78 <= (^~$signed(wire71[(1'h0):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg79 <= $unsigned($signed(wire74[(1'h0):(1'h0)]));
      reg80 <= (reg79[(5'h11):(2'h3)] ?
          $signed(({wire73[(2'h2):(1'h0)]} ?
              wire74[(4'h9):(2'h3)] : {((7'h42) - reg76),
                  (reg75 && wire70)})) : $signed((((8'hb8) ?
                  $unsigned(reg77) : reg78) ?
              ($signed(wire74) < $signed(wire74)) : (reg77[(1'h0):(1'h0)] ?
                  wire69[(2'h3):(1'h1)] : (reg75 ~^ reg77)))));
      if ((reg80[(3'h4):(2'h3)] && (~^({((8'ha9) ?
              wire74 : wire68)} && wire69[(3'h6):(2'h3)]))))
        begin
          reg81 <= (8'had);
          if ((8'h9c))
            begin
              reg82 <= (8'ha3);
              reg83 <= $signed((^{((~reg81) - (reg79 | (7'h44))),
                  wire74[(3'h5):(3'h4)]}));
              reg84 <= {(~$unsigned(({reg79} ?
                      {reg78, (8'ha8)} : $unsigned(wire68))))};
              reg85 <= $signed($signed({{$unsigned(wire72), $unsigned(reg75)},
                  (^~$signed(reg80))}));
              reg86 <= wire72[(3'h4):(2'h3)];
            end
          else
            begin
              reg82 <= (wire73[(2'h2):(2'h2)] ?
                  ((8'hb8) << reg86[(3'h6):(1'h1)]) : $unsigned((~reg86)));
              reg83 <= (wire73 >> ($signed(reg84[(2'h3):(2'h2)]) ?
                  $signed((-$unsigned(wire70))) : $unsigned($signed((reg85 ?
                      reg86 : reg78)))));
              reg84 <= $unsigned((!(((8'hb5) < (reg82 ~^ reg79)) ~^ ((reg76 ?
                  reg84 : reg83) > reg82))));
            end
        end
      else
        begin
          reg81 <= ($unsigned($unsigned($unsigned($signed(reg86)))) >>> reg84);
          if ($signed(($signed(reg78[(3'h4):(1'h0)]) == reg85[(3'h6):(3'h4)])))
            begin
              reg82 <= wire71;
              reg83 <= (($unsigned($unsigned({(7'h44)})) & (reg76[(5'h13):(5'h12)] ?
                      (wire69 ?
                          (~&reg77) : (wire73 ? (8'hb7) : reg83)) : (wire68 ?
                          ((8'ha7) ? wire74 : reg86) : $unsigned(reg76)))) ?
                  ($unsigned(wire68[(4'h8):(3'h7)]) | (!(+wire74))) : $unsigned(((reg79[(3'h5):(2'h2)] ?
                      (~^(8'ha1)) : reg86[(3'h5):(3'h4)]) && (reg81[(2'h2):(2'h2)] ?
                      reg80 : reg77[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg82 <= $unsigned(wire69[(2'h3):(2'h3)]);
              reg83 <= reg85[(2'h3):(1'h1)];
              reg84 <= ((8'hb2) <= $unsigned(wire71[(4'h9):(1'h1)]));
              reg85 <= ($signed(($signed((wire70 ?
                      reg75 : reg82)) & (^wire68[(2'h3):(1'h1)]))) ?
                  reg75[(1'h1):(1'h0)] : {reg86[(4'h9):(2'h3)]});
            end
          reg86 <= (~^(reg77[(3'h5):(2'h2)] ?
              {((reg79 ? wire69 : (8'hb8)) ?
                      (~^reg77) : (wire71 ^~ (7'h43)))} : (7'h42)));
        end
      if ((|(+(+($unsigned(reg81) < (|reg77))))))
        begin
          reg87 <= ($unsigned(reg75[(3'h4):(2'h3)]) ?
              reg76 : wire68[(3'h7):(1'h1)]);
          if ((~&$unsigned(wire74)))
            begin
              reg88 <= (((reg86 | reg75[(4'hc):(4'hb)]) > {$unsigned(reg76),
                  ($signed(wire69) ?
                      $unsigned((8'h9e)) : $unsigned(reg85))}) & $unsigned({$unsigned($signed(reg83)),
                  $unsigned((reg82 && wire70))}));
            end
          else
            begin
              reg88 <= (+(reg78[(4'hb):(4'ha)] ?
                  $signed((~&(~|reg75))) : (((+wire70) ?
                      $signed(wire72) : $signed(reg84)) && wire70)));
            end
          if (reg78[(3'h5):(1'h1)])
            begin
              reg89 <= reg88;
            end
          else
            begin
              reg89 <= ((~&reg79[(4'ha):(1'h0)]) >>> $signed((8'hb9)));
              reg90 <= $signed((^~((~reg83[(4'hb):(4'ha)]) ?
                  reg88 : (^{wire68, reg80}))));
            end
          if ({$unsigned(($unsigned((reg87 ~^ wire69)) ?
                  wire74[(4'ha):(2'h3)] : reg77[(3'h4):(2'h3)])),
              {$signed((8'haa)), $signed(reg85[(2'h3):(2'h3)])}})
            begin
              reg91 <= $unsigned(wire70[(2'h2):(1'h1)]);
              reg92 <= (~&$unsigned((~|({reg83, reg78} ?
                  reg77 : (reg85 | reg83)))));
              reg93 <= $signed((+$signed($signed(((8'had) ? wire72 : reg86)))));
              reg94 <= reg78[(3'h5):(2'h3)];
              reg95 <= {{wire73}};
            end
          else
            begin
              reg91 <= $signed($signed($unsigned((^~$unsigned((8'h9f))))));
              reg92 <= (wire72 | ($signed(reg81[(1'h1):(1'h1)]) + ((7'h42) ?
                  ((~&reg78) ?
                      (reg76 ?
                          wire69 : (8'ha4)) : $unsigned((7'h41))) : $signed(reg88))));
              reg93 <= reg82;
              reg94 <= {$signed(reg79[(4'hf):(3'h4)]),
                  (reg87[(1'h0):(1'h0)] ?
                      ($signed((wire74 | reg83)) ~^ (~^(reg90 ^ (8'ha7)))) : (reg89[(1'h1):(1'h0)] ?
                          $signed($unsigned(wire73)) : $unsigned((8'hba))))};
            end
          reg96 <= $unsigned((((!$unsigned(reg91)) < $unsigned(reg79[(5'h10):(4'h9)])) ?
              {reg79, $signed(reg76[(5'h14):(1'h1)])} : wire69[(2'h3):(1'h1)]));
        end
      else
        begin
          if (($unsigned((~|$signed($unsigned(reg81)))) ?
              (~^{$signed((8'h9c))}) : wire73[(2'h2):(1'h0)]))
            begin
              reg87 <= (reg96 ?
                  reg84 : $signed((wire74 <<< $signed(((8'h9c) + reg89)))));
              reg88 <= wire74[(3'h5):(3'h5)];
            end
          else
            begin
              reg87 <= ($signed((((8'hae) ?
                      (wire74 >>> wire74) : (reg83 ? reg75 : (7'h44))) ?
                  (reg86 && (~^reg80)) : $signed((~reg87)))) | reg78[(4'h9):(3'h6)]);
              reg88 <= reg89[(1'h0):(1'h0)];
              reg89 <= $signed((~$unsigned((~&(reg87 ~^ reg90)))));
              reg90 <= $signed($unsigned($unsigned(reg82)));
            end
          if ({((^~reg81) ? reg84[(1'h0):(1'h0)] : (+reg81))})
            begin
              reg91 <= reg86[(1'h1):(1'h0)];
              reg92 <= $signed((&$unsigned((^~$unsigned(reg90)))));
            end
          else
            begin
              reg91 <= $unsigned(wire73[(2'h2):(1'h0)]);
              reg92 <= (-$signed(wire74[(4'h9):(3'h4)]));
              reg93 <= $signed(reg88[(1'h1):(1'h1)]);
              reg94 <= (reg88 ?
                  (($signed(((8'ha2) >= reg91)) ?
                      reg84[(1'h0):(1'h0)] : reg75[(4'h9):(3'h5)]) ^ $signed((wire69 ?
                      {reg86,
                          reg90} : $unsigned(reg86)))) : wire73[(2'h3):(1'h0)]);
              reg95 <= $unsigned($unsigned(reg76));
            end
          reg96 <= $signed({{{(~reg92), (wire73 ? (8'ha6) : reg82)}},
              (($signed((7'h43)) >> {reg83}) & $signed(reg83))});
        end
      if (((reg77[(1'h1):(1'h0)] ?
          reg96 : ($signed(reg80) - ((reg94 ? (8'ha8) : reg91) ~^ {reg84,
              reg95}))) >> (((|$unsigned(reg92)) ?
          {reg95[(1'h1):(1'h1)]} : (~|$unsigned((8'hb1)))) <<< reg84[(1'h1):(1'h1)])))
        begin
          reg97 <= (8'hb3);
          reg98 <= ($unsigned($unsigned(wire70)) < ((reg76[(5'h10):(2'h3)] ^ wire73[(2'h2):(1'h0)]) || {reg93}));
          if ((~|($unsigned(($signed(wire72) ?
                  reg86[(2'h3):(1'h0)] : reg84[(1'h1):(1'h1)])) ?
              $signed({reg97,
                  reg78[(2'h3):(1'h0)]}) : (~&{$unsigned((8'ha1))}))))
            begin
              reg99 <= reg89;
              reg100 <= reg98;
              reg101 <= {(&$signed($unsigned((reg91 ? reg78 : wire70)))),
                  reg83[(1'h0):(1'h0)]};
              reg102 <= (((~|(~|wire68[(4'h9):(2'h3)])) || (^(&reg79[(5'h14):(4'hb)]))) ?
                  reg96[(3'h4):(3'h4)] : $unsigned({{wire72[(4'hc):(4'hc)],
                          $signed((8'ha6))},
                      $signed(((8'hbf) ? wire68 : reg80))}));
            end
          else
            begin
              reg99 <= (((~reg93) ?
                      $unsigned(($signed(reg76) ?
                          (8'hb4) : $unsigned(reg97))) : (($unsigned((8'hb4)) <= {reg101,
                              (8'h9e)}) ?
                          wire69[(3'h5):(2'h2)] : $unsigned(reg94[(3'h5):(2'h2)]))) ?
                  (reg102[(3'h7):(3'h6)] ?
                      (reg99[(2'h2):(1'h1)] <<< reg91[(4'hd):(3'h6)]) : $unsigned(wire71)) : $signed((~reg78[(1'h0):(1'h0)])));
              reg100 <= reg92;
              reg101 <= $signed((^(8'had)));
              reg102 <= {(reg79 < (8'h9f))};
              reg103 <= reg77[(3'h4):(3'h4)];
            end
          reg104 <= $signed(((~&reg82[(1'h1):(1'h1)]) ^~ reg96));
          reg105 <= (^(^~reg100));
        end
      else
        begin
          reg97 <= ($signed(reg94) == (|{($unsigned(reg85) ?
                  (reg91 ? wire73 : wire73) : reg97)}));
          if (((!$unsigned({(reg75 ? (8'had) : wire68), $signed(reg91)})) ?
              ($unsigned($signed(wire72[(1'h0):(1'h0)])) ?
                  (({reg96,
                      wire74} - (wire68 ^~ reg89)) > reg78) : ($signed({wire74}) ?
                      reg76 : ($unsigned(reg103) ^ {wire73}))) : $signed($unsigned({(reg82 ?
                      reg97 : reg92),
                  reg100}))))
            begin
              reg98 <= $signed(({$unsigned((wire69 << reg94)),
                      (reg84[(1'h1):(1'h0)] < reg78[(3'h4):(2'h3)])} ?
                  wire69[(3'h6):(1'h0)] : (wire74[(4'ha):(4'ha)] ?
                      $signed((-reg102)) : reg86)));
              reg99 <= (wire70 ^ reg101);
              reg100 <= (8'hac);
              reg101 <= ((|$signed(((reg78 ? reg102 : reg81) ?
                  wire73 : (reg103 ^~ (8'hb7))))) == {$signed(reg95),
                  ($unsigned(reg88[(2'h3):(2'h3)]) ?
                      ((~^reg102) || reg93[(2'h2):(1'h0)]) : (wire70 ?
                          $unsigned(reg97) : (wire70 ? wire69 : reg95)))});
              reg102 <= $signed((+(~&reg87)));
            end
          else
            begin
              reg98 <= reg82;
              reg99 <= ((wire70[(1'h0):(1'h0)] ?
                      ({$unsigned((8'hb7))} < ($unsigned(wire74) ?
                          $signed(reg89) : {reg92})) : $signed(((reg94 ?
                          reg84 : reg83) >>> $unsigned(reg105)))) ?
                  $unsigned({((reg90 < wire74) << (+wire70)),
                      $unsigned({reg76, reg95})}) : $unsigned(reg80));
            end
          reg103 <= (&$signed((&(reg77[(3'h4):(2'h3)] ?
              $unsigned(reg79) : {reg82}))));
          if ($signed($signed(($signed(reg82) ~^ reg104[(3'h5):(3'h4)]))))
            begin
              reg104 <= (({(!((8'hb5) >>> reg90)),
                      ($signed(reg77) <= $signed(reg76))} >= {($signed((8'ha8)) ?
                          (|reg98) : (reg98 << wire72))}) ?
                  ((|(~^((8'h9d) ?
                      (8'ha8) : reg102))) > $signed((reg96[(4'h9):(4'h8)] ?
                      (reg96 >> wire71) : (^~reg99)))) : (reg97 ?
                      ((reg83[(3'h4):(2'h3)] >= (reg95 ~^ reg79)) ?
                          $signed((^~reg98)) : ((reg105 ? reg88 : (8'ha9)) ?
                              {(8'hb4),
                                  wire74} : $signed(reg91))) : (($unsigned((8'ha4)) >>> (wire74 ?
                              reg102 : wire70)) ?
                          {(reg79 ?
                                  reg76 : reg76)} : $signed((reg96 | (8'hb0))))));
              reg105 <= $unsigned($unsigned($signed((&(wire72 ?
                  reg97 : reg90)))));
            end
          else
            begin
              reg104 <= reg84;
              reg105 <= $signed((!(reg102 <= wire71[(4'ha):(1'h1)])));
              reg106 <= ((7'h40) <<< (8'hab));
              reg107 <= ({({$unsigned(wire69), $unsigned((8'ha5))} ?
                          ($signed((8'hac)) ?
                              (reg96 <<< reg91) : reg86) : {(reg79 ?
                                  (8'hb1) : reg86),
                              (reg83 ? reg88 : reg106)}),
                      (8'ha0)} ?
                  (($unsigned((-reg79)) ? (&reg94[(3'h5):(3'h5)]) : reg104) ?
                      $unsigned($signed(reg95)) : $unsigned(({reg78, reg83} ?
                          (8'hb7) : $unsigned(reg92)))) : {$unsigned((~^$signed(wire73)))});
            end
        end
    end
  assign wire108 = wire71[(3'h4):(3'h4)];
  assign wire109 = (((reg94[(1'h1):(1'h0)] ?
                           (((8'hac) ? reg88 : reg78) >>> (reg96 ?
                               reg100 : (8'hbb))) : (wire69[(2'h3):(1'h0)] ?
                               $signed(reg84) : (reg77 ?
                                   reg98 : wire71))) >> (!($signed(reg92) != (^~wire71)))) ?
                       (~|$unsigned(reg105)) : reg102[(3'h5):(3'h4)]);
  assign wire110 = {$signed((~&wire69)),
                       (reg81[(2'h2):(1'h1)] && ({(-reg93)} ^ (8'ha2)))};
  assign wire111 = (~|(+($signed({reg84, reg105}) >= reg78[(3'h5):(1'h1)])));
  assign wire112 = {(reg88[(2'h3):(1'h1)] ? (!reg92[(4'hb):(1'h0)]) : (8'h9c)),
                       {($signed(((8'hb0) == (8'ha5))) ^~ reg98)}};
  assign wire113 = (((!reg101[(3'h7):(3'h4)]) == reg85) ?
                       $unsigned($unsigned({$signed(reg99)})) : reg103[(3'h4):(2'h2)]);
  assign wire114 = $unsigned((^wire112));
  assign wire115 = wire113;
  assign wire116 = $unsigned(reg87);
  assign wire117 = (~|$unsigned($signed($signed((7'h41)))));
  assign wire118 = ($unsigned($unsigned(reg105)) ?
                       reg96 : $unsigned(({reg93,
                           (wire114 << reg88)} ^ reg85)));
  assign wire119 = wire110[(2'h2):(1'h0)];
  assign wire120 = (reg88 ?
                       $unsigned((((wire72 > reg99) ?
                               $signed((8'hb0)) : $unsigned(wire118)) ?
                           $unsigned($signed(reg105)) : ((wire108 == reg87) * (7'h42)))) : (((((8'ha1) ?
                                   wire69 : wire119) <<< (8'ha4)) ?
                               $signed((~|wire114)) : $unsigned($signed((8'hb7)))) ?
                           ($unsigned((+reg92)) ?
                               (+(reg78 ?
                                   wire116 : reg76)) : (reg88[(2'h2):(2'h2)] ?
                                   (wire118 ?
                                       wire72 : wire115) : {reg98})) : $unsigned(wire116)));
  always
    @(posedge clk) begin
      reg121 <= $unsigned((($signed((reg86 ? reg82 : reg106)) ?
              $signed(reg95[(1'h1):(1'h0)]) : (reg85[(1'h0):(1'h0)] ?
                  (wire115 >> reg87) : reg78[(2'h2):(1'h0)])) ?
          reg98 : (wire114 <= {(wire70 ? reg88 : reg80)})));
    end
  always
    @(posedge clk) begin
      reg122 <= (|($unsigned((8'hba)) ?
          ($signed(wire118[(3'h4):(2'h3)]) ?
              ((reg103 + wire117) ?
                  $unsigned(wire112) : (reg77 ?
                      wire112 : (7'h41))) : $unsigned({reg76,
                  wire74})) : ($unsigned(reg78) < $unsigned((+wire118)))));
      reg123 <= {{((&((8'ha8) ^ reg106)) ?
                  reg99[(3'h6):(3'h5)] : ($signed(wire110) ?
                      (8'ha9) : (wire73 - wire73)))},
          $signed($unsigned(reg103))};
      reg124 <= $unsigned($unsigned(reg84[(1'h1):(1'h1)]));
      reg125 <= $unsigned((reg99[(2'h3):(1'h0)] >= $unsigned(reg95[(2'h3):(2'h2)])));
    end
  assign wire126 = wire70;
endmodule

module module45
#(parameter param63 = (|({(((8'haa) >>> (8'ha0)) ? (~(8'ha7)) : ((8'ha9) * (7'h41))), (((8'ha7) <= (8'hac)) || ((8'ha7) ? (8'hae) : (8'ha1)))} || ((^((8'hb2) == (8'ha0))) ? (-(|(8'hb1))) : (^~((7'h41) < (8'ha6)))))), 
parameter param64 = {(~^(~|{(param63 ? param63 : (7'h43)), {param63, param63}}))})
(y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire50;
  input wire signed [(4'h9):(1'h0)] wire49;
  input wire signed [(5'h13):(1'h0)] wire48;
  input wire signed [(3'h5):(1'h0)] wire47;
  input wire [(3'h4):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire62;
  wire signed [(5'h13):(1'h0)] wire61;
  wire signed [(4'h8):(1'h0)] wire60;
  wire signed [(2'h3):(1'h0)] wire59;
  wire signed [(4'hb):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire55;
  wire signed [(3'h6):(1'h0)] wire51;
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire51,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire51 = (-(~$signed($unsigned($unsigned(wire47)))));
  always
    @(posedge clk) begin
      reg52 <= wire51;
    end
  always
    @(posedge clk) begin
      reg53 <= ($signed($unsigned({$signed(wire47)})) < $unsigned((wire50 >> (7'h42))));
      reg54 <= (8'hbb);
    end
  assign wire55 = $signed($unsigned(wire47));
  assign wire56 = ($unsigned($unsigned($signed((^~wire50)))) >> $unsigned($signed($signed((-wire47)))));
  assign wire57 = $unsigned(wire51[(3'h6):(3'h5)]);
  assign wire58 = {$unsigned($unsigned(((reg52 <<< wire47) ?
                          {(8'ha1), wire51} : {reg52, wire46})))};
  assign wire59 = $unsigned((~&wire47));
  assign wire60 = $signed(($signed({(^reg54),
                      $unsigned(wire47)}) ^ $signed(($signed(wire55) >> $unsigned(reg54)))));
  assign wire61 = $signed(reg53[(3'h7):(2'h2)]);
  assign wire62 = (((~^(wire50 ? {wire51} : {wire61})) ?
                      ((~&wire47[(1'h0):(1'h0)]) ?
                          $unsigned(((8'hb0) ?
                              wire47 : (8'hb2))) : (|(&wire61))) : (8'haf)) >> $signed($unsigned($unsigned((~&wire50)))));
endmodule
