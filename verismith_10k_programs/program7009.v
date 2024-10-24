module top
#(parameter param154 = (+{(8'hac), ((((8'hbb) >= (8'hab)) + ((8'hae) && (8'hb1))) <= ((-(8'hb8)) ? (^(8'hb5)) : ((7'h44) ? (8'hb9) : (7'h42))))}), 
parameter param155 = (~^param154))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire152;
  wire [(4'hb):(1'h0)] wire151;
  wire [(5'h13):(1'h0)] wire150;
  wire [(5'h10):(1'h0)] wire149;
  wire signed [(4'hd):(1'h0)] wire148;
  wire [(2'h3):(1'h0)] wire130;
  wire signed [(5'h10):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire71;
  wire [(4'he):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire132;
  wire [(5'h14):(1'h0)] wire133;
  wire signed [(4'h8):(1'h0)] wire134;
  wire [(4'hd):(1'h0)] wire139;
  wire signed [(5'h15):(1'h0)] wire140;
  reg signed [(5'h12):(1'h0)] reg147 = (1'h0);
  reg [(4'hc):(1'h0)] reg146 = (1'h0);
  reg [(4'h8):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg144 = (1'h0);
  reg [(5'h14):(1'h0)] reg143 = (1'h0);
  reg [(2'h2):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg135 = (1'h0);
  reg [(5'h11):(1'h0)] reg136 = (1'h0);
  reg signed [(4'he):(1'h0)] reg137 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg138 = (1'h0);
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire130,
                 wire73,
                 wire71,
                 wire6,
                 wire5,
                 wire4,
                 wire132,
                 wire133,
                 wire134,
                 wire139,
                 wire140,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg135,
                 reg136,
                 reg137,
                 reg138,
                 (1'h0)};
  assign wire4 = (&($signed($signed({(8'hb4)})) ?
                     $signed(((wire0 ? wire1 : wire3) ?
                         wire1 : wire1[(5'h11):(4'h9)])) : wire3));
  assign wire5 = (&(&wire2[(1'h0):(1'h0)]));
  assign wire6 = wire2;
  module7 #() modinst72 (wire71, clk, wire1, wire4, wire5, wire3);
  assign wire73 = (&$unsigned(wire1));
  module74 #() modinst131 (.wire79(wire73), .y(wire130), .wire77(wire3), .wire78(wire0), .clk(clk), .wire75(wire2), .wire76(wire71));
  assign wire132 = {{(wire3[(4'hb):(1'h0)] >>> $unsigned(wire6[(4'hb):(3'h7)])),
                           (8'haa)}};
  assign wire133 = wire132;
  assign wire134 = wire132[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg135 <= (~&$signed(($signed({(7'h43), wire130}) ?
          ((!wire2) ? {wire133} : (wire71 ? wire5 : wire130)) : (wire71 ?
              (-wire132) : ((8'hb1) >= (8'ha3))))));
      reg136 <= wire133;
      reg137 <= wire5[(4'h9):(3'h4)];
      reg138 <= wire0[(4'hb):(4'hb)];
    end
  assign wire139 = reg137[(3'h4):(1'h1)];
  module12 #() modinst141 (wire140, clk, wire134, reg136, wire73, wire3);
  always
    @(posedge clk) begin
      if ((((wire132 >>> $signed(wire134)) ?
              wire2[(4'h8):(1'h1)] : $unsigned({(~|wire71)})) ?
          $unsigned(wire2) : {(&$unsigned($unsigned(wire139)))}))
        begin
          reg142 <= $unsigned({wire1[(4'h9):(3'h6)]});
          reg143 <= {$unsigned(((wire6[(3'h6):(2'h2)] | {(8'hac),
                  wire73}) == {$signed(wire3), (wire4 ? wire139 : wire71)})),
              reg135[(5'h12):(5'h10)]};
        end
      else
        begin
          reg142 <= ((wire132 | $unsigned(reg136[(3'h7):(3'h4)])) ?
              {($unsigned(((7'h42) << (7'h42))) - wire3[(5'h13):(5'h10)])} : ({($signed(wire3) ?
                      $signed((8'ha6)) : (reg135 ?
                          reg143 : wire132))} ~^ wire4));
          reg143 <= $unsigned($unsigned((^$unsigned(reg138))));
          reg144 <= $signed((+($signed($unsigned((8'h9d))) ?
              reg136 : (!$unsigned(wire71)))));
        end
      reg145 <= $unsigned(wire134[(3'h6):(1'h0)]);
      reg146 <= {wire4,
          {((~^(wire133 <<< wire132)) <= $signed((reg142 ? wire0 : reg142))),
              (wire140 ^ $unsigned({reg142, wire4}))}};
      reg147 <= (~wire0[(3'h5):(3'h5)]);
    end
  assign wire148 = reg136;
  assign wire149 = $unsigned($unsigned((~^$signed((reg147 != wire134)))));
  assign wire150 = ((reg138 ?
                       $signed($unsigned(((7'h44) && wire148))) : ($signed($signed(reg137)) ?
                           wire1[(3'h4):(1'h0)] : $signed(reg142[(1'h1):(1'h1)]))) == {wire134,
                       $signed(((~wire149) & (~|wire4)))});
  assign wire151 = ($unsigned({{(~wire139),
                           (~&reg142)}}) + ((^~$signed($signed(wire139))) == wire139[(4'ha):(4'h9)]));
  module46 #() modinst153 (.wire49(wire1), .y(wire152), .wire47(wire140), .wire48(reg143), .wire50(reg146), .clk(clk));
endmodule

module module74  (y, clk, wire79, wire78, wire77, wire76, wire75);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire79;
  input wire [(4'hf):(1'h0)] wire78;
  input wire signed [(4'hb):(1'h0)] wire77;
  input wire [(5'h15):(1'h0)] wire76;
  input wire [(4'he):(1'h0)] wire75;
  wire [(3'h7):(1'h0)] wire129;
  wire signed [(5'h11):(1'h0)] wire128;
  wire signed [(3'h5):(1'h0)] wire127;
  wire [(5'h10):(1'h0)] wire126;
  wire signed [(4'hb):(1'h0)] wire125;
  wire signed [(4'hb):(1'h0)] wire124;
  wire signed [(5'h14):(1'h0)] wire123;
  wire signed [(4'h9):(1'h0)] wire122;
  wire signed [(5'h15):(1'h0)] wire121;
  wire signed [(4'hf):(1'h0)] wire120;
  wire [(2'h2):(1'h0)] wire119;
  wire [(5'h10):(1'h0)] wire118;
  wire [(4'hf):(1'h0)] wire117;
  wire [(5'h12):(1'h0)] wire116;
  wire [(4'h9):(1'h0)] wire115;
  wire signed [(3'h4):(1'h0)] wire114;
  wire signed [(2'h2):(1'h0)] wire112;
  wire signed [(5'h14):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire80;
  assign y = {wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire112,
                 wire81,
                 wire80,
                 (1'h0)};
  assign wire80 = ((&(|((!wire75) ?
                          (wire79 || wire79) : wire79[(3'h6):(3'h4)]))) ?
                      {(wire79 ?
                              ($unsigned(wire78) >>> (wire77 <= wire78)) : wire77)} : wire77[(4'h9):(1'h0)]);
  assign wire81 = (8'hbc);
  module82 #() modinst113 (.wire86(wire78), .y(wire112), .wire85(wire81), .wire84(wire80), .clk(clk), .wire83(wire75));
  assign wire114 = $unsigned(wire78[(4'hc):(3'h6)]);
  assign wire115 = $unsigned((^~(|((!wire112) < (wire76 ?
                       wire112 : wire112)))));
  assign wire116 = (|$signed($unsigned($signed((8'ha6)))));
  assign wire117 = wire116;
  assign wire118 = $unsigned($unsigned(($unsigned((wire80 ? wire77 : wire76)) ?
                       $unsigned($unsigned(wire77)) : {(~^wire115)})));
  assign wire119 = wire118;
  assign wire120 = (wire112[(2'h2):(1'h1)] == wire75[(1'h0):(1'h0)]);
  assign wire121 = ((~|((&(^~wire116)) ?
                       wire112[(1'h0):(1'h0)] : wire78[(4'ha):(3'h5)])) & ((|(+$unsigned(wire119))) * $unsigned((wire118 ?
                       {wire112, wire119} : (8'h9e)))));
  assign wire122 = {wire81[(4'hb):(3'h5)]};
  assign wire123 = wire117;
  assign wire124 = wire116[(4'he):(4'ha)];
  assign wire125 = (($unsigned((~|wire118[(4'h8):(1'h0)])) << (~^((8'hb3) != $signed(wire80)))) <<< (wire75 ?
                       (&wire81) : ($signed($unsigned(wire116)) > (!((8'had) ?
                           wire123 : (7'h42))))));
  assign wire126 = $signed($signed({$unsigned((8'ha6))}));
  assign wire127 = {($signed(wire117[(4'hf):(2'h2)]) ?
                           wire126[(3'h7):(3'h7)] : $unsigned(({wire118} - $unsigned((8'hbf))))),
                       $signed($unsigned((wire120 == {(8'haa)})))};
  assign wire128 = ($signed({{(wire117 ? wire79 : wire112)},
                       $signed(wire126[(4'ha):(1'h1)])}) ~^ ($unsigned({(wire81 ?
                           (8'hae) : wire80)}) || {((wire78 ?
                           wire121 : wire123) >> (wire76 ? wire77 : wire80))}));
  assign wire129 = $unsigned(wire126[(4'h8):(4'h8)]);
endmodule

module module7
#(parameter param70 = (((|(+(8'h9d))) == (((8'hba) ~^ ((8'ha2) || (8'ha5))) ? (((8'hb3) - (7'h43)) ? ((8'hab) ? (8'hb4) : (8'ha6)) : ((7'h44) ? (8'hbf) : (8'hb7))) : {((8'hb3) ? (7'h43) : (8'hb8))})) + (((~&{(7'h41), (8'hba)}) ? {(~|(8'hb1)), ((8'hb0) ? (8'haf) : (8'hb9))} : (-{(8'hae)})) << (^(~&(|(7'h43)))))))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire11;
  input wire [(4'ha):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire69;
  wire signed [(3'h5):(1'h0)] wire68;
  wire signed [(4'hb):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire62;
  wire signed [(5'h10):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire41;
  reg [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire65,
                 wire64,
                 wire62,
                 wire61,
                 wire60,
                 wire58,
                 wire45,
                 wire44,
                 wire43,
                 wire41,
                 reg67,
                 reg66,
                 reg63,
                 (1'h0)};
  module12 #() modinst42 (wire41, clk, wire8, wire11, wire10, wire9);
  assign wire43 = (~wire10);
  assign wire44 = ((($unsigned((wire10 ? wire8 : wire43)) << ($signed((8'h9e)) ?
                              (wire8 << wire43) : wire8)) ?
                          wire11[(4'h9):(1'h0)] : (+(|$unsigned(wire9)))) ?
                      (~|(+(!wire9))) : ($unsigned({((8'hb6) >>> wire9),
                              wire11}) ?
                          (8'ha4) : $signed($signed(wire43[(3'h4):(1'h1)]))));
  assign wire45 = wire43;
  module46 #() modinst59 (wire58, clk, wire45, wire43, wire44, wire41);
  assign wire60 = $unsigned($unsigned((wire11[(1'h1):(1'h1)] ?
                      $signed({wire11, wire10}) : wire11[(3'h6):(3'h4)])));
  assign wire61 = wire41;
  assign wire62 = wire44;
  always
    @(posedge clk) begin
      reg63 <= $signed($unsigned((+wire43[(3'h6):(3'h5)])));
    end
  assign wire64 = (^~$signed($signed((&(wire43 ? wire41 : wire58)))));
  assign wire65 = $unsigned(wire43[(3'h7):(3'h7)]);
  always
    @(posedge clk) begin
      reg66 <= $unsigned(wire41);
      reg67 <= $unsigned((~&wire58));
    end
  assign wire68 = wire45[(3'h7):(3'h4)];
  assign wire69 = $signed(({$signed(wire11), $unsigned(wire65[(4'ha):(1'h1)])} ?
                      wire60 : {{$signed(wire43)}}));
endmodule

module module46  (y, clk, wire50, wire49, wire48, wire47);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire50;
  input wire signed [(3'h5):(1'h0)] wire49;
  input wire signed [(5'h14):(1'h0)] wire48;
  input wire [(5'h15):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire52;
  wire signed [(5'h10):(1'h0)] wire51;
  assign y = {wire57, wire56, wire55, wire54, wire53, wire52, wire51, (1'h0)};
  assign wire51 = $signed($signed(wire50[(2'h3):(1'h0)]));
  assign wire52 = $unsigned(wire49);
  assign wire53 = $unsigned($signed(wire51[(4'he):(4'ha)]));
  assign wire54 = $signed((wire47 & {(~|{wire50, wire53})}));
  assign wire55 = $unsigned(wire49);
  assign wire56 = $signed(wire49);
  assign wire57 = {{($unsigned($signed(wire47)) << wire48)},
                      wire51[(4'ha):(3'h5)]};
endmodule

module module12
#(parameter param39 = (~^((!({(7'h43), (8'ha4)} ^ ((8'haf) | (8'ha7)))) ? (((7'h42) ? ((8'ha5) ? (8'hbd) : (8'ha1)) : (^(7'h41))) || (((8'hbb) != (8'hbf)) ? {(7'h41)} : (~(8'hbf)))) : {(((8'hb6) <= (7'h43)) >>> ((8'hac) ? (7'h42) : (8'hbf)))})), 
parameter param40 = ((({(^param39)} ? (~&{param39, (8'hb8)}) : {(param39 == param39)}) | (({param39} ? (param39 ? param39 : param39) : {param39, (8'h9f)}) ? {(param39 + param39)} : (param39 == (~^param39)))) >= ((((param39 ? param39 : param39) && param39) ? param39 : (param39 ? ((8'hb1) + param39) : (param39 ? param39 : (8'hac)))) ? (param39 || param39) : param39)))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire16;
  input wire [(3'h4):(1'h0)] wire15;
  input wire [(2'h2):(1'h0)] wire14;
  input wire [(4'hc):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire38;
  wire signed [(4'he):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
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
                 (1'h0)};
  assign wire17 = $signed(wire15);
  assign wire18 = $signed((8'hb9));
  assign wire19 = wire16;
  assign wire20 = $unsigned($unsigned((8'had)));
  assign wire21 = $signed((-(-(~&(wire13 ? wire13 : wire14)))));
  always
    @(posedge clk) begin
      reg22 <= wire21;
      if ({$unsigned(((7'h44) && ($signed(reg22) ?
              ((7'h44) ? reg22 : (8'hbb)) : (wire17 ? (8'ha9) : wire16))))})
        begin
          reg23 <= $unsigned(wire17[(4'hc):(4'hc)]);
          reg24 <= wire18;
          reg25 <= ({wire19} & (((wire21 & (&wire19)) ?
                  $signed($signed(wire14)) : wire21[(4'h9):(3'h5)]) ?
              $signed($signed($signed(wire15))) : wire18[(1'h1):(1'h0)]));
        end
      else
        begin
          if (($unsigned((+(reg23 > ((8'ha8) ?
              wire19 : reg25)))) == (+($signed($signed(reg22)) < $signed((wire19 ?
              wire21 : wire15))))))
            begin
              reg23 <= ($signed((^$signed((~&wire14)))) ?
                  $signed($unsigned($unsigned(reg24))) : (8'hb7));
              reg24 <= $signed(reg22[(3'h4):(1'h1)]);
              reg25 <= reg25;
            end
          else
            begin
              reg23 <= ((~|($signed((wire20 & wire18)) & $unsigned($unsigned(wire17)))) ^~ (~^wire17));
              reg24 <= ((~^$unsigned(wire18)) ?
                  $signed(wire16) : $unsigned((~^reg25)));
            end
          reg26 <= wire17;
        end
      reg27 <= ($unsigned(($signed($unsigned(reg26)) >= (^~$unsigned(reg24)))) ?
          (!wire18[(1'h0):(1'h0)]) : (~wire19));
      reg28 <= ((!reg22) ? wire19 : (8'ha6));
    end
  always
    @(posedge clk) begin
      reg29 <= (~|wire13);
      reg30 <= wire20[(2'h2):(1'h0)];
      reg31 <= (~^(((wire21 ^ (wire14 ? reg25 : reg23)) < {wire13}) - reg23));
      if ($signed((-{{reg22, (reg23 ? reg27 : reg28)}})))
        begin
          if ({{(reg28[(5'h10):(4'hd)] ? (&wire14[(2'h2):(1'h0)]) : wire21),
                  reg22[(3'h6):(2'h2)]}})
            begin
              reg32 <= reg29[(4'he):(1'h0)];
            end
          else
            begin
              reg32 <= (((reg24 >>> $unsigned($unsigned(wire14))) > ({(wire18 >= wire15)} ?
                      wire16[(1'h0):(1'h0)] : (wire15 ~^ (reg29 ?
                          reg26 : wire20)))) ?
                  $signed($signed({(~|(8'hb1))})) : reg31);
              reg33 <= ($unsigned($unsigned(($signed(reg23) ?
                      (wire17 ? reg31 : reg30) : wire19[(1'h0):(1'h0)]))) ?
                  reg22 : {$unsigned($signed(reg25[(4'h8):(3'h7)])),
                      $signed({$unsigned((8'h9c)), $signed((8'h9c))})});
              reg34 <= (-reg27);
              reg35 <= (~|(wire15 ?
                  ((wire14 | (^~(8'ha2))) & $signed(((8'hb0) ?
                      wire18 : wire15))) : ($signed((reg32 ? reg30 : reg32)) ?
                      (((7'h44) ? (8'ha6) : reg34) ?
                          (reg25 << reg28) : (reg22 ^~ reg25)) : (+wire21))));
              reg36 <= reg23;
            end
        end
      else
        begin
          reg32 <= reg32;
          if ($signed((~((!reg29) ?
              (reg34 ? $signed(reg29) : (wire20 - wire18)) : reg30))))
            begin
              reg33 <= $signed((+((~|{reg30, reg25}) ?
                  reg28[(4'hb):(4'h8)] : (8'ha9))));
              reg34 <= (wire19[(2'h3):(2'h3)] ?
                  (~&reg30) : (reg25[(4'h9):(3'h4)] ?
                      {$unsigned((wire16 ?
                              reg26 : reg35))} : ($unsigned((reg26 != reg25)) + reg28[(1'h0):(1'h0)])));
            end
          else
            begin
              reg33 <= wire19[(1'h1):(1'h1)];
              reg34 <= reg22;
              reg35 <= (~^wire21[(3'h7):(3'h4)]);
            end
          reg36 <= (&{(reg32 ? $signed((wire20 ? wire20 : wire20)) : (8'h9f)),
              wire21[(2'h2):(1'h1)]});
        end
    end
  assign wire37 = ($signed($unsigned($signed($signed(reg32)))) ?
                      ($unsigned(wire21) >>> ((&(reg24 ?
                          wire19 : wire16)) + wire15[(3'h4):(2'h2)])) : ((~^(~^(reg28 <= reg33))) ?
                          $signed(((^~reg36) ?
                              (^~wire15) : reg28[(1'h0):(1'h0)])) : $signed($unsigned($unsigned(reg30)))));
  assign wire38 = ((wire18 ?
                      ($unsigned((7'h42)) < $signed(reg32[(4'hf):(3'h6)])) : $signed($unsigned(((8'h9e) ?
                          reg32 : reg26)))) << ($signed(reg33) ?
                      $unsigned(reg35) : (~|reg34)));
endmodule

module module82  (y, clk, wire86, wire85, wire84, wire83);
  output wire [(32'h118):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire86;
  input wire signed [(5'h14):(1'h0)] wire85;
  input wire [(4'he):(1'h0)] wire84;
  input wire signed [(4'h8):(1'h0)] wire83;
  wire signed [(2'h3):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire signed [(4'h8):(1'h0)] wire109;
  wire signed [(3'h5):(1'h0)] wire108;
  wire signed [(3'h5):(1'h0)] wire107;
  wire [(4'h8):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire105;
  wire [(2'h2):(1'h0)] wire104;
  wire signed [(5'h10):(1'h0)] wire102;
  wire signed [(4'h9):(1'h0)] wire101;
  wire signed [(4'hb):(1'h0)] wire92;
  wire signed [(4'he):(1'h0)] wire91;
  wire [(3'h5):(1'h0)] wire90;
  wire [(5'h13):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire87;
  reg signed [(3'h7):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg99 = (1'h0);
  reg [(4'hc):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg96 = (1'h0);
  reg [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire102,
                 wire101,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 reg103,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  assign wire87 = wire83;
  assign wire88 = $unsigned(wire86[(1'h0):(1'h0)]);
  assign wire89 = {(^~wire85[(4'ha):(1'h1)]), (^wire83[(1'h0):(1'h0)])};
  assign wire90 = ({$signed(wire83)} ^ wire84);
  assign wire91 = $signed((wire88 <<< wire87[(5'h10):(1'h0)]));
  assign wire92 = wire88[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      if ($unsigned(wire84))
        begin
          reg93 <= wire84;
          reg94 <= (wire88 == (^~(|reg93[(3'h5):(3'h4)])));
          reg95 <= (-({(^$unsigned(reg93)), $signed(wire84)} ?
              ((wire84[(4'hd):(3'h6)] >>> wire87[(5'h10):(1'h0)]) ^ (-(-wire89))) : $signed($unsigned(wire84))));
          reg96 <= $unsigned(wire91);
        end
      else
        begin
          reg93 <= (~$unsigned($unsigned(((reg95 ^~ wire87) ?
              wire90[(3'h5):(3'h5)] : (reg95 ? wire92 : wire90)))));
        end
      reg97 <= $unsigned($unsigned((|($signed(reg95) <= (!wire84)))));
    end
  always
    @(posedge clk) begin
      reg98 <= $signed(wire85);
      reg99 <= wire89;
      reg100 <= wire86;
    end
  assign wire101 = ((({wire83[(2'h3):(2'h2)]} ? wire85 : reg96[(2'h3):(2'h2)]) ?
                           $signed((wire91 != (8'hb8))) : (((^~wire85) * (reg96 <<< wire87)) ?
                               $signed(wire87[(4'hf):(4'h9)]) : (wire89[(5'h13):(4'h8)] ?
                                   (reg100 << reg100) : {reg95}))) ?
                       ($signed(wire87) << ($signed($unsigned(reg94)) ?
                           (&reg95) : wire90)) : reg98[(3'h6):(1'h1)]);
  assign wire102 = (({$signed({wire101, wire83}),
                               $signed((wire90 ? reg97 : reg94))} ?
                           $unsigned((~(wire84 != reg99))) : (~(|wire86[(2'h3):(1'h0)]))) ?
                       wire87[(2'h2):(2'h2)] : (wire90 ?
                           $signed((8'hbd)) : reg100));
  always
    @(posedge clk) begin
      reg103 <= reg94[(2'h3):(2'h3)];
    end
  assign wire104 = $unsigned(((~|(|(wire88 * (8'h9e)))) + (wire84 & wire86[(3'h7):(3'h7)])));
  assign wire105 = $unsigned({reg95[(4'h8):(3'h6)]});
  assign wire106 = (8'haa);
  assign wire107 = $unsigned(reg100);
  assign wire108 = wire87;
  assign wire109 = (reg93[(2'h3):(2'h2)] >= $signed($signed(reg103)));
  assign wire110 = $unsigned(((((-reg99) >= wire92) ?
                           wire91[(3'h7):(2'h2)] : (((8'hb1) << wire87) | reg94[(4'hb):(4'h9)])) ?
                       $unsigned($signed($signed(wire106))) : ($unsigned((^wire102)) >>> (!(wire105 <= wire89)))));
  assign wire111 = (wire91[(3'h6):(2'h2)] - (~^((+reg100) ?
                       (8'hbc) : (wire109 + $signed((8'h9c))))));
endmodule
