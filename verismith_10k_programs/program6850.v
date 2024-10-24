module top
#(parameter param139 = (-((^~({(8'hab)} ? {(8'hb0), (7'h40)} : ((8'ha4) ? (7'h41) : (7'h44)))) >>> {((8'hb5) ? (~(8'ha9)) : (7'h44)), {((7'h41) * (8'had))}})), 
parameter param140 = (((({param139} - (param139 > param139)) ? ((param139 ? param139 : param139) ? (param139 * param139) : (~&param139)) : param139) ? {param139} : param139) != (^((~^(~param139)) >= ((^~(8'hae)) && (param139 ? param139 : param139))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire122;
  wire signed [(5'h13):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire137;
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  assign y = {wire122,
                 wire64,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire14,
                 wire15,
                 wire29,
                 wire62,
                 wire137,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire5 = (wire1[(4'h9):(1'h1)] ~^ $unsigned(wire4[(2'h3):(1'h1)]));
  assign wire6 = ($signed(($signed({wire0}) ?
                     $signed(wire0) : wire2)) == {(~$signed((wire4 ?
                         (8'ha4) : wire5))),
                     wire5});
  assign wire7 = $unsigned((!(8'hb7)));
  assign wire8 = {$signed((-(8'hab))), wire6[(1'h1):(1'h0)]};
  assign wire9 = $signed(wire2);
  assign wire10 = (^~wire6);
  assign wire11 = ((~|{wire9}) ?
                      $signed(($signed(wire5[(4'he):(4'hb)]) && ((~|wire0) << (8'ha2)))) : wire6);
  always
    @(posedge clk) begin
      reg12 <= wire11[(3'h6):(1'h0)];
      reg13 <= ((~&$unsigned(wire9)) || $signed(wire7[(4'h8):(2'h2)]));
    end
  assign wire14 = ($signed($signed($unsigned((-(8'ha6))))) ?
                      ((($unsigned(wire11) ?
                          $unsigned(wire2) : reg12[(1'h0):(1'h0)]) * (|(wire3 ?
                          wire1 : wire11))) & ($signed((~|reg12)) ?
                          $unsigned((|reg12)) : wire0[(4'h9):(4'h8)])) : $unsigned((((wire9 ?
                          (8'had) : (8'hb2)) <<< wire11[(2'h3):(1'h1)]) + wire6)));
  assign wire15 = wire7[(2'h3):(2'h2)];
  module16 #() modinst30 (.wire21(reg12), .wire17(wire10), .y(wire29), .wire18(wire15), .clk(clk), .wire19(wire6), .wire20(wire8));
  module31 #() modinst63 (.wire34(wire10), .y(wire62), .wire32(wire9), .wire36(wire3), .clk(clk), .wire33(wire29), .wire35(wire0));
  assign wire64 = $signed(wire8);
  module65 #() modinst123 (wire122, clk, wire3, wire7, wire64, wire11, wire2);
  module124 #() modinst138 (wire137, clk, wire14, wire11, wire122, wire7, wire29);
endmodule

module module124  (y, clk, wire129, wire128, wire127, wire126, wire125);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire129;
  input wire signed [(4'h8):(1'h0)] wire128;
  input wire signed [(4'ha):(1'h0)] wire127;
  input wire signed [(4'he):(1'h0)] wire126;
  input wire [(5'h12):(1'h0)] wire125;
  wire signed [(4'h9):(1'h0)] wire136;
  wire [(4'ha):(1'h0)] wire135;
  wire [(5'h11):(1'h0)] wire134;
  wire signed [(3'h5):(1'h0)] wire133;
  wire [(4'hd):(1'h0)] wire132;
  wire [(5'h12):(1'h0)] wire131;
  wire [(4'hb):(1'h0)] wire130;
  assign y = {wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 (1'h0)};
  assign wire130 = {($unsigned($unsigned($unsigned(wire129))) <<< (~(~|$unsigned(wire128)))),
                       ((!{wire127[(4'ha):(1'h1)], $unsigned(wire128)}) ?
                           (((wire129 ?
                               wire128 : wire129) << (~^(8'ha0))) <<< ((~^wire125) >> wire127[(4'h9):(3'h4)])) : (8'hb3))};
  assign wire131 = {((+$signed(wire126)) ?
                           (8'hb5) : $signed(wire125[(4'ha):(2'h3)]))};
  assign wire132 = wire127[(4'h9):(2'h2)];
  assign wire133 = ($signed((({wire131, wire126} + $unsigned(wire126)) ?
                       wire132[(4'hb):(3'h5)] : ($unsigned(wire130) ?
                           (8'haa) : $unsigned(wire132)))) ^ {($unsigned((~wire127)) ?
                           {wire129[(4'hd):(1'h1)],
                               (~|wire126)} : (~(~^wire125))),
                       wire129[(2'h2):(1'h1)]});
  assign wire134 = {wire125[(4'he):(4'h9)],
                       $signed($signed($signed($signed(wire127))))};
  assign wire135 = (({(&(|(8'ha1))),
                           ((wire132 == (8'h9f)) ?
                               $unsigned(wire128) : (~|wire131))} ?
                       wire134[(4'hb):(3'h7)] : wire129[(1'h0):(1'h0)]) >> $unsigned((~^$unsigned(wire132[(4'h8):(3'h4)]))));
  assign wire136 = wire133;
endmodule

module module65  (y, clk, wire66, wire67, wire68, wire69, wire70);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire66;
  input wire signed [(5'h14):(1'h0)] wire67;
  input wire [(5'h13):(1'h0)] wire68;
  input wire signed [(4'he):(1'h0)] wire69;
  input wire [(4'ha):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire121;
  wire signed [(3'h5):(1'h0)] wire111;
  wire [(4'he):(1'h0)] wire110;
  wire signed [(3'h6):(1'h0)] wire109;
  wire [(5'h14):(1'h0)] wire108;
  wire [(4'hd):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire72;
  wire signed [(4'hb):(1'h0)] wire73;
  wire [(2'h2):(1'h0)] wire106;
  reg signed [(4'h9):(1'h0)] reg120 = (1'h0);
  reg [(2'h2):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg117 = (1'h0);
  reg [(5'h13):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg112 = (1'h0);
  assign y = {wire121,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire71,
                 wire72,
                 wire73,
                 wire106,
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
  assign wire71 = wire69;
  assign wire72 = wire67[(2'h2):(2'h2)];
  assign wire73 = (|wire66[(3'h4):(2'h3)]);
  module74 #() modinst107 (.wire76(wire73), .wire75(wire66), .clk(clk), .y(wire106), .wire77(wire68), .wire79(wire72), .wire78(wire67));
  assign wire108 = ($unsigned(wire71) ? wire70 : wire71[(4'hc):(2'h2)]);
  assign wire109 = (wire69[(4'hc):(1'h0)] ?
                       (^~(8'ha9)) : {$signed(($signed(wire70) ?
                               wire73 : wire68[(4'hb):(4'ha)]))});
  assign wire110 = (((~((wire69 ?
                       wire69 : wire108) >> $signed(wire70))) >= wire66) >>> (~^(^$signed(wire106[(1'h0):(1'h0)]))));
  assign wire111 = $unsigned((~(wire73 && (!$unsigned(wire69)))));
  always
    @(posedge clk) begin
      reg112 <= ({wire110[(1'h0):(1'h0)],
          ((&wire72) ?
              wire111 : $signed(wire67[(5'h13):(3'h5)]))} || $signed((~wire73[(3'h6):(1'h0)])));
      if (wire72)
        begin
          reg113 <= $unsigned($unsigned((^~{$unsigned(wire67)})));
        end
      else
        begin
          reg113 <= (!(~&$unsigned(reg113[(2'h2):(1'h1)])));
          reg114 <= (wire66 ^ wire66[(4'hb):(2'h2)]);
          reg115 <= {(({(wire69 ? wire110 : wire66),
                      (wire68 - wire67)} >= $signed(wire109)) ?
                  (-$signed((reg113 ^~ wire73))) : wire106[(2'h2):(1'h0)]),
              ((wire111 ? reg112 : $signed(reg114)) || (((reg113 ^ (8'hb1)) ?
                      (wire73 ? (8'h9d) : wire110) : $signed(wire68)) ?
                  $unsigned(wire109[(2'h2):(1'h0)]) : ({wire72} <= {wire68})))};
          if ($unsigned($unsigned((+(wire68[(4'hf):(3'h7)] ?
              (-wire110) : (wire111 ? wire73 : wire106))))))
            begin
              reg116 <= (|{(|$unsigned(wire70[(1'h1):(1'h0)]))});
              reg117 <= (((+((8'ha5) + {wire106, wire110})) ?
                      (!$unsigned($signed(wire72))) : ((reg112[(3'h4):(2'h3)] ~^ (~wire108)) ?
                          $unsigned(((8'hae) || wire67)) : $unsigned((wire67 ?
                              wire109 : wire67)))) ?
                  ((!((wire73 ? reg114 : reg116) ?
                          reg115[(4'he):(1'h0)] : $signed(wire71))) ?
                      $signed($unsigned(wire70)) : ($unsigned((wire68 * reg113)) >= ($signed(wire67) ?
                          wire71 : wire108[(5'h14):(5'h13)]))) : wire110[(4'h9):(2'h2)]);
              reg118 <= (7'h41);
            end
          else
            begin
              reg116 <= ((^((8'ha0) >> {$signed(reg114),
                  (~|reg115)})) > {(^reg118[(3'h7):(2'h2)]), wire71});
            end
          reg119 <= wire68;
        end
      reg120 <= $signed(reg115);
    end
  assign wire121 = (8'ha7);
endmodule

module module31
#(parameter param60 = (((8'hb6) ^ ({{(8'haa)}, (~&(8'h9c))} ? ({(8'hb1)} >> ((8'hb9) >> (8'hbe))) : (~&((8'hb6) ~^ (8'hb5))))) ? (((((8'hb0) - (8'hb6)) - {(8'hb8), (8'hba)}) >> ((|(8'hbb)) ? ((8'hbe) ? (8'hae) : (8'h9f)) : {(8'ha1)})) & (^~(7'h41))) : {({((8'ha9) ^ (8'hb4)), ((8'ha8) ? (8'haa) : (8'hbe))} ? (8'hbf) : {((8'hb5) ? (8'ha0) : (7'h40))})}), 
parameter param61 = ((^~(((param60 ? (8'hba) : (8'h9f)) ? (param60 ? param60 : param60) : (param60 >>> param60)) ? param60 : param60)) ^~ (((8'haf) ? param60 : {{param60, param60}, param60}) ? param60 : param60)))
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire36;
  input wire [(3'h5):(1'h0)] wire35;
  input wire [(5'h13):(1'h0)] wire34;
  input wire [(4'hc):(1'h0)] wire33;
  input wire [(4'hb):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire51;
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  assign y = {wire52,
                 wire51,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg37 <= wire32[(4'ha):(3'h6)];
      if (((^wire33[(1'h0):(1'h0)]) ~^ $unsigned(($unsigned((^~wire35)) ?
          $unsigned((wire36 * (8'hb0))) : ((reg37 ?
              wire32 : (8'h9e)) >> $unsigned(wire35))))))
        begin
          if ($unsigned($signed((($unsigned(wire33) ?
                  (wire34 ? wire34 : wire32) : $unsigned(wire32)) ?
              (!reg37) : {wire34, {wire36}}))))
            begin
              reg38 <= $unsigned($unsigned(wire36[(3'h5):(2'h3)]));
              reg39 <= reg38;
              reg40 <= (wire32[(4'hb):(4'ha)] ?
                  ((^(wire36[(2'h2):(1'h0)] ?
                          $signed(reg39) : ((8'hb2) && reg37))) ?
                      $signed(((wire34 < wire32) <= {wire33})) : {(~^(8'ha4)),
                          (wire34 ?
                              ((8'h9c) >> (8'hbd)) : reg38[(1'h0):(1'h0)])}) : $unsigned(wire32[(3'h5):(1'h0)]));
            end
          else
            begin
              reg38 <= ({$unsigned(((wire35 && wire33) != {wire34, reg38})),
                      $unsigned(wire33)} ?
                  wire36[(4'h9):(3'h7)] : $signed(({$unsigned(wire34),
                      {(8'hb8)}} ^ reg40)));
              reg39 <= $signed($unsigned((!reg37)));
              reg40 <= $signed(($unsigned({$unsigned(reg37)}) << reg39[(4'hd):(4'h8)]));
              reg41 <= {reg39[(4'hd):(3'h6)]};
              reg42 <= ($unsigned(reg37) ?
                  {((|$signed(reg37)) <<< $unsigned($unsigned(wire32)))} : wire35);
            end
        end
      else
        begin
          if ((!(+$unsigned(($unsigned((8'h9f)) ?
              $unsigned(reg37) : $signed(wire32))))))
            begin
              reg38 <= (8'hb9);
              reg39 <= wire36;
              reg40 <= $unsigned((wire32 ?
                  ({(7'h40)} || $unsigned(reg41)) : (^($unsigned(reg40) ^ wire34[(5'h12):(4'hf)]))));
            end
          else
            begin
              reg38 <= {$signed(wire34)};
              reg39 <= (({($unsigned(reg42) ?
                      (wire34 <<< (8'hbd)) : reg39[(5'h12):(4'h8)])} | (^~wire35)) < $unsigned(wire35[(2'h2):(1'h0)]));
              reg40 <= reg38[(4'h9):(2'h2)];
            end
          reg41 <= {(-$unsigned(reg41))};
          if ((8'ha8))
            begin
              reg42 <= wire34[(2'h3):(1'h1)];
              reg43 <= wire36;
            end
          else
            begin
              reg42 <= (reg43 ?
                  (^{{reg41[(4'hd):(4'hd)]}, $signed((^~(8'hbc)))}) : ((wire33 ?
                          reg37 : $unsigned(wire36[(2'h3):(2'h3)])) ?
                      {((wire32 ?
                              wire36 : wire36) | (^reg38))} : ((^~reg42[(3'h4):(2'h3)]) ?
                          reg42 : (~(reg40 ~^ reg39)))));
              reg43 <= (($unsigned((reg37 ?
                      (reg37 ? wire34 : wire32) : reg37[(4'hb):(4'h9)])) ?
                  $signed($signed((reg40 ?
                      reg42 : (7'h43)))) : (8'h9f)) <<< (~|(((-reg37) ~^ ((8'hb6) ?
                  reg42 : reg39)) || {$unsigned(wire33), {reg42, wire35}})));
              reg44 <= (reg38 <= reg37[(1'h1):(1'h1)]);
              reg45 <= reg44[(1'h0):(1'h0)];
              reg46 <= (8'hba);
            end
          if ({wire34[(4'he):(4'h9)], wire36})
            begin
              reg47 <= wire36[(1'h1):(1'h0)];
              reg48 <= reg47;
              reg49 <= (~^(reg46[(2'h2):(1'h1)] <<< reg38[(4'h8):(3'h7)]));
            end
          else
            begin
              reg47 <= {((^~reg41) ? reg40[(2'h2):(1'h1)] : $signed((8'haf))),
                  (~|$unsigned((reg37[(4'hf):(2'h3)] & reg42[(2'h3):(1'h1)])))};
              reg48 <= wire33[(4'ha):(2'h3)];
            end
        end
      reg50 <= $signed($signed(reg38));
    end
  assign wire51 = (|((8'hbe) <<< $signed((&$signed((8'hba))))));
  assign wire52 = ((!reg38) ?
                      $signed((^(^$signed(reg46)))) : {$unsigned(reg46[(3'h5):(1'h1)])});
  always
    @(posedge clk) begin
      reg53 <= (reg45 || ({(~^(wire35 ? reg42 : reg49)),
          wire33[(2'h3):(1'h0)]} | $signed(reg39)));
      reg54 <= (!{wire52[(4'hb):(4'h9)]});
      if ($signed(reg48[(1'h1):(1'h0)]))
        begin
          reg55 <= ($signed(reg46) | reg45[(1'h0):(1'h0)]);
          if (($unsigned(wire51[(3'h4):(3'h4)]) >= wire34))
            begin
              reg56 <= (~^$signed(wire36));
            end
          else
            begin
              reg56 <= ($signed({(((8'hb8) != reg55) ~^ reg39[(3'h7):(1'h1)]),
                  $unsigned((~(8'ha7)))}) + (reg38[(3'h7):(3'h7)] >= {reg55[(4'h9):(3'h4)]}));
            end
          reg57 <= $unsigned(((reg42 ?
              {wire51[(2'h2):(1'h0)]} : wire34) >> {((~&(8'h9d)) | {reg44,
                  (8'hb3)}),
              (+(+(7'h43)))}));
        end
      else
        begin
          reg55 <= $signed((~^((reg49[(1'h1):(1'h0)] ?
              (~|reg44) : wire34[(3'h5):(2'h3)]) * reg39[(1'h1):(1'h1)])));
          reg56 <= (~(+(~&((reg45 >= reg48) ?
              wire36 : wire35[(3'h4):(3'h4)]))));
          reg57 <= wire34[(4'h8):(3'h7)];
          reg58 <= ((+($unsigned((wire36 || wire52)) << {reg54})) ?
              ($unsigned(wire33) ?
                  $signed(({wire34,
                      wire51} * wire35[(3'h4):(1'h1)])) : (~|(^{reg39,
                      reg53}))) : ((((!(7'h41)) ?
                          $signed(reg38) : $signed(reg37)) ?
                      (~|$unsigned(reg45)) : {(wire32 != reg46)}) ?
                  wire52 : ((reg39[(4'h9):(3'h5)] ? (!wire36) : (+reg42)) ?
                      reg50 : reg46)));
          reg59 <= (^$unsigned((((wire32 ? (8'h9d) : (8'ha3)) ?
              (reg40 & reg49) : $unsigned((8'ha1))) == (((8'hb3) ?
              reg40 : wire33) == reg47))));
        end
    end
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire21;
  input wire signed [(3'h7):(1'h0)] wire20;
  input wire signed [(4'hb):(1'h0)] wire19;
  input wire signed [(3'h6):(1'h0)] wire18;
  input wire [(4'hd):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire22;
  assign y = {wire28, wire27, wire26, wire25, wire24, wire23, wire22, (1'h0)};
  assign wire22 = (((((|wire19) >> wire20) >> $signed(wire20)) != wire19) ?
                      wire18[(2'h2):(1'h1)] : $unsigned($signed(wire19)));
  assign wire23 = ((~^(^~$signed($unsigned(wire19)))) ?
                      (((8'ha7) ?
                              $signed((wire19 ? wire21 : wire22)) : (8'hb4)) ?
                          {$unsigned((wire22 ?
                                  wire17 : (7'h43)))} : (((!(8'hb7)) >>> (wire18 ^~ wire22)) != ((wire17 << wire20) >> (wire20 | wire20)))) : wire20[(2'h3):(1'h0)]);
  assign wire24 = $unsigned($signed($unsigned(($signed(wire17) ?
                      {(7'h43), wire23} : wire17))));
  assign wire25 = $signed((~&$unsigned(wire20)));
  assign wire26 = $signed(wire17);
  assign wire27 = wire24;
  assign wire28 = ((~|$unsigned(wire24)) ?
                      ($unsigned(wire21[(2'h2):(2'h2)]) ?
                          (wire20 < $signed($signed(wire27))) : wire24) : (~^($signed((+wire24)) ?
                          $signed(wire27[(4'h8):(2'h3)]) : wire19[(4'ha):(4'ha)])));
endmodule

module module74  (y, clk, wire79, wire78, wire77, wire76, wire75);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire79;
  input wire signed [(5'h14):(1'h0)] wire78;
  input wire signed [(4'hc):(1'h0)] wire77;
  input wire signed [(4'h8):(1'h0)] wire76;
  input wire [(2'h2):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire105;
  wire [(4'hb):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire103;
  wire [(4'hd):(1'h0)] wire102;
  wire [(5'h10):(1'h0)] wire101;
  wire [(4'hc):(1'h0)] wire100;
  wire signed [(5'h10):(1'h0)] wire99;
  wire signed [(3'h5):(1'h0)] wire98;
  wire [(4'hb):(1'h0)] wire97;
  wire signed [(5'h10):(1'h0)] wire88;
  wire signed [(4'ha):(1'h0)] wire87;
  wire [(5'h11):(1'h0)] wire86;
  wire [(4'ha):(1'h0)] wire85;
  wire signed [(4'he):(1'h0)] wire84;
  wire [(4'he):(1'h0)] wire83;
  wire [(5'h15):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire80;
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg94 = (1'h0);
  reg [(5'h14):(1'h0)] reg93 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(4'ha):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire81,
                 wire80,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg82,
                 (1'h0)};
  assign wire80 = wire75[(2'h2):(1'h0)];
  assign wire81 = $unsigned(wire79[(3'h5):(2'h2)]);
  always
    @(posedge clk) begin
      reg82 <= $unsigned(((((wire75 * wire76) || $unsigned((8'hb4))) ?
          (~|$unsigned(wire75)) : (^~(wire77 ?
              wire81 : wire81))) ~^ wire80[(3'h4):(2'h3)]));
    end
  assign wire83 = $unsigned(wire79);
  assign wire84 = $unsigned({$signed(wire78[(4'hb):(4'h8)])});
  assign wire85 = wire83[(2'h3):(2'h2)];
  assign wire86 = wire78;
  assign wire87 = (wire85[(3'h4):(1'h0)] && $signed($unsigned(((wire79 ?
                      wire85 : wire79) & (wire76 ? wire75 : wire75)))));
  assign wire88 = wire86[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      if ($unsigned(wire80))
        begin
          reg89 <= ($signed((~&$unsigned(((8'hbc) >> wire80)))) <= $unsigned((($signed((8'haa)) ?
              $signed(wire87) : (wire78 ?
                  wire84 : wire85)) >= wire76[(1'h0):(1'h0)])));
          reg90 <= (wire83[(4'hb):(4'ha)] ?
              (+(-wire84[(4'hd):(3'h5)])) : $unsigned(($signed((8'ha2)) ?
                  {(^reg89)} : $unsigned(wire80[(3'h7):(3'h7)]))));
          reg91 <= $unsigned(wire79[(3'h6):(3'h6)]);
          reg92 <= (~^$unsigned($signed((8'haa))));
        end
      else
        begin
          if ($signed((~^$unsigned(((reg89 ? (8'hb3) : reg91) ^ {wire84,
              reg91})))))
            begin
              reg89 <= {((((wire84 ~^ wire86) ?
                          {reg90, wire75} : (reg82 ? wire83 : wire78)) ?
                      reg91 : (8'hab)) <<< $unsigned({{wire76},
                      reg91[(1'h0):(1'h0)]}))};
            end
          else
            begin
              reg89 <= (8'hb0);
              reg90 <= {(~^$signed(wire88)), (~^((~(8'ha4)) > wire84))};
              reg91 <= ($signed($unsigned($unsigned((wire76 ?
                      wire76 : (8'ha7))))) ?
                  {wire80[(4'hd):(3'h5)]} : wire88[(4'hb):(1'h1)]);
              reg92 <= (!{($signed({wire85}) ?
                      {(|wire78), $unsigned((8'hb2))} : wire78),
                  $unsigned(wire86)});
            end
        end
      if ($signed($unsigned(wire80)))
        begin
          reg93 <= $signed(reg90);
        end
      else
        begin
          reg93 <= (8'hba);
          reg94 <= {wire78, $signed(reg89)};
          reg95 <= $unsigned($signed((wire85[(3'h5):(1'h1)] ?
              $signed($unsigned(reg82)) : wire85)));
        end
      reg96 <= reg92[(4'h9):(4'h9)];
    end
  assign wire97 = reg95[(1'h1):(1'h1)];
  assign wire98 = ({(reg89 ? reg93[(3'h6):(3'h6)] : ({reg91} == {wire85}))} ?
                      wire81 : (($unsigned(((8'ha7) ?
                              wire85 : wire83)) || (~|$unsigned(wire80))) ?
                          reg89 : $signed(wire87[(3'h4):(3'h4)])));
  assign wire99 = reg92[(2'h2):(2'h2)];
  assign wire100 = $signed($unsigned(({(wire84 ?
                           reg91 : wire97)} & $signed((7'h43)))));
  assign wire101 = (((8'haa) ?
                       reg94[(2'h3):(2'h2)] : wire78) == ($unsigned(reg90[(3'h4):(2'h2)]) != (+reg93[(5'h11):(2'h3)])));
  assign wire102 = (~(|$signed(wire80[(2'h3):(1'h1)])));
  assign wire103 = (wire80 + (+wire79[(4'ha):(2'h2)]));
  assign wire104 = (wire88[(5'h10):(3'h7)] ?
                       wire101[(4'h8):(4'h8)] : $unsigned($unsigned(((reg92 ?
                           wire87 : (7'h43)) < wire102[(1'h1):(1'h0)]))));
  assign wire105 = ((wire77 << wire77) + {wire88[(3'h5):(2'h3)]});
endmodule
