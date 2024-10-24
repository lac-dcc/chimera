module top
#(parameter param162 = ({(~|(&(^(8'hb4))))} && {((^((7'h43) ? (8'hb4) : (8'hb9))) - (((7'h44) >= (8'haf)) == (8'hba))), {{(8'hbe)}}}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  wire signed [(2'h2):(1'h0)] wire156;
  wire [(3'h4):(1'h0)] wire155;
  wire signed [(5'h12):(1'h0)] wire150;
  wire [(5'h13):(1'h0)] wire149;
  wire [(5'h14):(1'h0)] wire147;
  wire [(4'hf):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire86;
  reg signed [(5'h15):(1'h0)] reg161 = (1'h0);
  reg [(5'h11):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg154 = (1'h0);
  reg [(3'h4):(1'h0)] reg153 = (1'h0);
  reg [(4'h9):(1'h0)] reg152 = (1'h0);
  assign y = {wire156,
                 wire155,
                 wire150,
                 wire149,
                 wire147,
                 wire88,
                 wire4,
                 wire86,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg154,
                 reg153,
                 reg152,
                 (1'h0)};
  assign wire4 = wire2;
  module5 #() modinst87 (wire86, clk, wire3, wire4, wire0, wire1, wire2);
  assign wire88 = (^~$signed(((~^$signed(wire1)) != {{(8'hbd), (8'ha5)},
                      $unsigned(wire3)})));
  module89 #() modinst148 (wire147, clk, wire88, wire4, wire86, wire0);
  assign wire149 = wire147[(5'h14):(3'h4)];
  module89 #() modinst151 (wire150, clk, wire147, wire2, wire149, wire4);
  always
    @(posedge clk) begin
      reg152 <= {$unsigned(wire86[(4'h9):(3'h5)]),
          ((~^$signed(wire88)) ?
              $signed(((wire149 ? wire88 : wire88) ?
                  (|wire149) : $signed(wire2))) : $signed(((wire3 >> wire150) != wire2)))};
      reg153 <= wire149[(3'h5):(3'h4)];
      reg154 <= wire88[(4'h9):(3'h4)];
    end
  assign wire155 = wire4[(3'h5):(1'h1)];
  assign wire156 = wire2;
  always
    @(posedge clk) begin
      reg157 <= $unsigned(wire149);
      if ($unsigned(wire1))
        begin
          reg158 <= wire1[(4'hf):(4'ha)];
          reg159 <= $signed((wire155 ?
              ($unsigned($unsigned(reg154)) ?
                  ((~&wire1) ^~ wire149[(4'h8):(3'h7)]) : $unsigned((~|wire86))) : {(^~wire0[(4'h8):(3'h6)]),
                  wire149}));
          reg160 <= {$signed(($unsigned((wire2 ?
                  wire2 : wire149)) < (~|$signed(reg159)))),
              ((8'hb7) ?
                  wire155 : $signed(((reg152 ? reg154 : wire155) || {wire3})))};
          reg161 <= ($unsigned(($unsigned((reg160 ?
              reg159 : wire149)) <<< wire3)) ^~ ($unsigned(($signed((8'ha0)) <= $signed(wire156))) ?
              wire149[(2'h2):(1'h1)] : (~^(wire156 ?
                  $unsigned((8'hb0)) : reg160[(2'h3):(1'h0)]))));
        end
      else
        begin
          reg158 <= (!($unsigned((!reg157[(4'h9):(4'h8)])) ?
              wire156 : ((+$unsigned(reg157)) ?
                  {{wire155}, wire0[(1'h0):(1'h0)]} : reg157)));
          reg159 <= ({$unsigned($signed($signed(wire1)))} ?
              $signed((8'ha6)) : reg161);
          reg160 <= reg154[(3'h5):(3'h4)];
          reg161 <= ({$signed($unsigned(wire3)),
              $signed($signed(reg154))} + $signed((-$unsigned($unsigned(wire150)))));
        end
    end
endmodule

module module89
#(parameter param145 = (~&(((!(8'h9c)) ? (|{(7'h44), (8'had)}) : ((-(8'hae)) ? (&(8'hb4)) : ((8'ha2) * (8'hb2)))) - ((((8'ha0) ? (7'h43) : (8'hb9)) ? ((8'hb6) ? (8'ha8) : (8'haa)) : ((8'haf) >= (8'ha9))) == (7'h41)))), 
parameter param146 = (|{{{(!param145)}, (((8'hb6) + param145) ? (8'ha6) : {param145, (8'h9c)})}, ((8'hb7) - ((~(8'h9e)) ? {param145, param145} : (8'hab)))}))
(y, clk, wire90, wire91, wire92, wire93);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire90;
  input wire signed [(4'ha):(1'h0)] wire91;
  input wire signed [(4'h9):(1'h0)] wire92;
  input wire signed [(4'hc):(1'h0)] wire93;
  wire signed [(3'h4):(1'h0)] wire144;
  wire signed [(4'h9):(1'h0)] wire143;
  wire signed [(5'h10):(1'h0)] wire142;
  wire [(5'h14):(1'h0)] wire141;
  wire [(4'h9):(1'h0)] wire140;
  wire signed [(4'hd):(1'h0)] wire139;
  wire [(4'he):(1'h0)] wire138;
  wire signed [(4'hd):(1'h0)] wire137;
  wire signed [(2'h3):(1'h0)] wire130;
  wire [(3'h6):(1'h0)] wire129;
  wire [(2'h3):(1'h0)] wire128;
  wire [(4'hf):(1'h0)] wire127;
  wire signed [(5'h10):(1'h0)] wire126;
  wire signed [(4'hb):(1'h0)] wire125;
  wire signed [(4'he):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire95;
  wire signed [(3'h4):(1'h0)] wire123;
  reg [(5'h14):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg [(4'hd):(1'h0)] reg132 = (1'h0);
  reg [(4'he):(1'h0)] reg131 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire94,
                 wire95,
                 wire123,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 (1'h0)};
  assign wire94 = $signed((^$signed($unsigned((|wire93)))));
  assign wire95 = wire91[(2'h3):(1'h1)];
  module96 #() modinst124 (wire123, clk, wire93, wire92, wire95, wire91, wire90);
  assign wire125 = wire93[(1'h0):(1'h0)];
  assign wire126 = {$unsigned((({wire125} ?
                           (^~wire91) : $signed((8'h9d))) + {$unsigned(wire91)}))};
  assign wire127 = (~&(wire93 ?
                       ((wire123 ^~ $signed((7'h40))) ?
                           (^~$signed(wire123)) : (wire92[(3'h7):(2'h2)] ?
                               {wire91} : wire125)) : ($signed((~&wire126)) ?
                           (!(^~wire93)) : ($signed(wire123) <<< $unsigned(wire92)))));
  assign wire128 = wire93[(3'h7):(2'h2)];
  assign wire129 = ((wire93[(3'h6):(1'h1)] - ($signed(wire91) ?
                       (~&(-wire90)) : wire127[(3'h4):(1'h0)])) | wire127[(4'he):(4'he)]);
  assign wire130 = wire125[(4'hb):(2'h3)];
  always
    @(posedge clk) begin
      reg131 <= {$unsigned({$signed($signed(wire127)),
              {wire94[(4'ha):(2'h3)], ((8'h9d) + (8'ha7))}})};
      reg132 <= wire91;
      if ((wire94 ~^ (|wire127[(4'h9):(3'h4)])))
        begin
          reg133 <= wire127;
          reg134 <= (wire129 < ($signed((wire125 >> (wire123 ?
              wire93 : (8'hbc)))) * (~wire128)));
          reg135 <= wire125;
          reg136 <= reg131;
        end
      else
        begin
          reg133 <= $signed((~$signed($signed(wire129[(1'h1):(1'h0)]))));
        end
    end
  assign wire137 = $unsigned(wire95[(3'h5):(2'h3)]);
  assign wire138 = $unsigned((|$unsigned($signed($unsigned(reg136)))));
  assign wire139 = (~^(~^wire125[(4'ha):(4'h9)]));
  assign wire140 = ($unsigned($signed(wire90)) || $unsigned(({reg135,
                           (wire125 <<< (8'ha1))} ?
                       wire91[(2'h2):(2'h2)] : $signed((-wire137)))));
  assign wire141 = ((+({(wire126 << reg136), (reg134 ? wire92 : reg133)} ?
                           (wire123 ?
                               (reg135 || wire93) : wire95) : (wire92[(3'h5):(2'h2)] ?
                               (|wire130) : {reg135, (8'ha7)}))) ?
                       (wire137 >= reg131[(3'h4):(3'h4)]) : $unsigned($signed($signed($unsigned(wire91)))));
  assign wire142 = (reg135[(2'h3):(1'h0)] ?
                       wire141[(3'h5):(2'h2)] : $signed(wire129));
  assign wire143 = reg133[(4'hc):(3'h6)];
  assign wire144 = {{$unsigned($unsigned((wire91 ? wire143 : wire140)))},
                       reg132};
endmodule

module module5
#(parameter param84 = ({((((8'ha0) ? (7'h42) : (8'ha4)) ? (-(7'h44)) : ((7'h43) ^~ (8'hbd))) ? (((8'ha5) ? (8'ha1) : (7'h43)) == ((8'haf) ~^ (7'h40))) : (8'haf)), ((+((7'h42) ? (7'h40) : (8'ha7))) ? ((^(8'hba)) ~^ {(8'hae), (8'h9e)}) : (|(8'hb8)))} ? (((((8'hb0) ? (8'h9c) : (8'hba)) <<< (~^(8'hae))) | (((8'ha4) <= (8'hba)) > ((7'h41) == (7'h44)))) <<< ((&(~&(8'had))) - {((8'hbb) || (8'hb9)), ((7'h41) ? (7'h40) : (8'ha6))})) : (((8'hbb) ? ((^~(8'hb4)) ? {(8'hb3)} : ((8'h9d) ? (8'h9d) : (8'ha8))) : (((8'hbf) ? (8'ha9) : (8'h9f)) ? ((8'ha2) ? (8'hbc) : (7'h42)) : ((7'h41) <<< (8'ha5)))) ^~ {(~|(&(8'ha3))), {((8'ha3) ? (8'ha0) : (8'hb7)), {(8'ha6)}}})), 
parameter param85 = {(7'h44)})
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire83;
  wire [(4'h8):(1'h0)] wire82;
  wire [(3'h5):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire41;
  wire [(4'he):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire79;
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire63,
                 wire42,
                 wire41,
                 wire40,
                 wire38,
                 wire11,
                 wire65,
                 wire79,
                 (1'h0)};
  assign wire11 = wire8[(2'h3):(1'h0)];
  module12 #() modinst39 (wire38, clk, wire11, wire6, wire9, wire8);
  assign wire40 = (|{$unsigned(wire10[(1'h0):(1'h0)]), wire6});
  assign wire41 = wire40;
  assign wire42 = (wire40[(4'ha):(2'h3)] ?
                      $signed(($unsigned(((8'ha5) ? wire8 : wire8)) ?
                          $signed(wire6[(1'h1):(1'h0)]) : (wire7[(5'h10):(4'he)] != wire40[(3'h6):(2'h2)]))) : (!{$unsigned(wire41[(1'h0):(1'h0)])}));
  module43 #() modinst64 (.wire45(wire9), .wire44(wire42), .wire46(wire40), .y(wire63), .wire48(wire8), .wire47(wire38), .clk(clk));
  assign wire65 = $unsigned((~^(&$unsigned((wire7 ? wire63 : wire6)))));
  module66 #() modinst80 (.wire67(wire10), .wire71(wire40), .wire70(wire9), .wire68(wire41), .wire69(wire8), .clk(clk), .y(wire79));
  assign wire81 = wire79[(4'h9):(3'h5)];
  assign wire82 = wire11[(2'h3):(2'h3)];
  assign wire83 = wire38;
endmodule

module module66  (y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire71;
  input wire [(2'h2):(1'h0)] wire70;
  input wire [(4'he):(1'h0)] wire69;
  input wire [(5'h13):(1'h0)] wire68;
  input wire [(4'ha):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire76;
  wire [(4'h9):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire73;
  wire signed [(3'h6):(1'h0)] wire72;
  assign y = {wire78, wire77, wire76, wire75, wire74, wire73, wire72, (1'h0)};
  assign wire72 = $signed(wire70);
  assign wire73 = $unsigned($signed(($signed(wire67[(4'ha):(3'h6)]) && (+$signed(wire68)))));
  assign wire74 = wire72;
  assign wire75 = (((((wire70 ? wire68 : (8'hb0)) ?
                      wire74 : {wire68,
                          (8'had)}) >> (~&$signed(wire74))) >>> ((wire67 || $unsigned(wire69)) ?
                      (~&(wire68 == wire73)) : ((wire68 & wire68) & $unsigned((8'ha0))))) && wire68);
  assign wire76 = wire72[(3'h6):(2'h3)];
  assign wire77 = {{$unsigned(((wire76 ?
                              wire71 : wire68) <<< (wire74 << wire72))),
                          $signed(($unsigned((8'h9f)) + wire67[(3'h7):(3'h4)]))},
                      (&($signed((wire69 ? wire70 : wire73)) ^ {wire71,
                          wire72}))};
  assign wire78 = $signed((^~$signed(wire67[(2'h2):(2'h2)])));
endmodule

module module43  (y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire48;
  input wire signed [(2'h3):(1'h0)] wire47;
  input wire signed [(2'h2):(1'h0)] wire46;
  input wire signed [(4'he):(1'h0)] wire45;
  input wire signed [(4'hd):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire60;
  wire [(4'hc):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire58;
  wire [(3'h5):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire56;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(3'h4):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire49;
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire49 = (~(($unsigned($signed(wire44)) ?
                          $unsigned((wire46 ^ wire45)) : wire47[(1'h1):(1'h0)]) ?
                      (-(~&wire48)) : wire46));
  assign wire50 = ((8'hb1) ? $unsigned(wire49) : (8'h9c));
  assign wire51 = {$unsigned(wire49), $unsigned(wire47[(1'h0):(1'h0)])};
  assign wire52 = (~|wire49);
  always
    @(posedge clk) begin
      reg53 <= wire44[(2'h3):(1'h1)];
      reg54 <= wire49;
      reg55 <= (~^((reg54 - (|(wire45 ? wire49 : (8'ha2)))) ?
          $unsigned(((wire48 >> reg53) ?
              (wire47 || wire45) : wire49)) : reg54));
    end
  assign wire56 = $signed(wire51[(1'h0):(1'h0)]);
  assign wire57 = (+wire51);
  assign wire58 = ((^$signed({$signed((8'hb2))})) & $unsigned($unsigned({(!wire46),
                      wire49[(4'hc):(1'h0)]})));
  assign wire59 = $unsigned({wire46[(2'h2):(1'h0)]});
  assign wire60 = $unsigned($unsigned(reg55));
  assign wire61 = $unsigned(($signed((|wire44[(3'h7):(3'h7)])) ?
                      $signed($unsigned((~&(8'hb3)))) : wire58[(3'h7):(3'h4)]));
  assign wire62 = ((wire44 << ({reg53[(1'h1):(1'h0)],
                      wire51[(2'h3):(2'h2)]} ^ ((wire49 < wire57) ?
                      wire59 : wire61))) ^~ ({(|$signed((8'ha2)))} ?
                      {$signed((wire51 ^ wire44)),
                          wire44[(4'h8):(4'h8)]} : (-wire51)));
endmodule

module module12
#(parameter param37 = ((((&(+(7'h41))) ? ((!(8'hbe)) && (8'h9f)) : (8'hb5)) ? ((~|(~(8'haa))) ? (((8'hb4) >= (8'hb5)) & (~&(8'ha6))) : {((8'hae) ? (7'h43) : (8'hab))}) : ((((8'h9d) ? (8'ha5) : (8'hbb)) - ((7'h44) > (8'hb6))) & (|((8'hac) ~^ (8'h9f))))) ? {(((!(8'hbd)) ? ((7'h42) >>> (7'h43)) : {(8'hb1)}) ? (&((8'hb7) >>> (8'hbf))) : (!((7'h43) << (8'h9c))))} : {{(-((8'hae) ? (8'hb4) : (8'haf)))}}))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h10e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire16;
  input wire signed [(4'he):(1'h0)] wire15;
  input wire [(4'h8):(1'h0)] wire14;
  input wire [(4'hb):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire22;
  wire [(4'ha):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire17;
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  assign y = {wire36,
                 wire32,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg35,
                 reg34,
                 reg33,
                 reg31,
                 (1'h0)};
  assign wire17 = {{$signed($unsigned($signed(wire13))), (8'hbf)},
                      wire13[(3'h4):(1'h0)]};
  assign wire18 = ((~(8'hb0)) ?
                      (({(wire13 ? wire17 : wire16)} ?
                              {((8'ha5) | (8'ha6)),
                                  (wire14 ?
                                      wire17 : wire16)} : $unsigned(((7'h44) - wire13))) ?
                          $unsigned(wire16[(3'h5):(3'h4)]) : ($unsigned(((8'h9c) ?
                                  wire16 : wire15)) ?
                              ({wire14} ?
                                  wire16 : {(8'hb7),
                                      (8'hb6)}) : $signed(wire14))) : wire14);
  assign wire19 = wire13;
  assign wire20 = (+wire17);
  assign wire21 = $unsigned(((~^$signed((^~(8'ha4)))) ?
                      {wire19, (^(|wire18))} : (|wire13[(4'h9):(3'h4)])));
  assign wire22 = $signed(wire18[(2'h3):(2'h3)]);
  assign wire23 = (~^({((wire22 > wire15) ?
                          ((8'hb4) >> wire15) : (wire16 ?
                              wire18 : (8'hab)))} < ({(wire22 ^ wire14),
                      (wire16 ? wire20 : wire21)} == wire19[(4'ha):(1'h0)])));
  assign wire24 = wire17;
  assign wire25 = ($signed($unsigned($unsigned($signed((8'hb0))))) - ($signed($signed((wire23 ?
                          wire24 : (8'ha2)))) ?
                      ($signed({(7'h42),
                          wire17}) >>> $unsigned(wire17)) : $signed((!wire19[(3'h7):(1'h1)]))));
  assign wire26 = wire23;
  assign wire27 = $signed(((wire14[(4'h8):(1'h1)] ?
                          wire18[(2'h3):(2'h2)] : wire21) ?
                      (^((wire24 || wire20) ?
                          $signed(wire13) : wire21[(3'h4):(1'h0)])) : (wire19 ?
                          ({wire23} == $unsigned(wire24)) : (~^wire15[(4'he):(3'h7)]))));
  assign wire28 = (~&wire19);
  assign wire29 = wire25;
  assign wire30 = (~^(^~$unsigned((wire16 ?
                      wire28[(4'ha):(3'h5)] : $signed((8'hbf))))));
  always
    @(posedge clk) begin
      reg31 <= wire21[(3'h4):(2'h3)];
    end
  assign wire32 = ((&wire21) ? wire20[(5'h10):(4'hb)] : $unsigned((|(8'ha9))));
  always
    @(posedge clk) begin
      if ($unsigned({((wire16[(2'h2):(1'h0)] ?
                  wire21[(2'h2):(1'h0)] : {wire32, (8'ha1)}) ?
              {(wire21 ? (8'hae) : wire24),
                  (wire22 ? (8'hb8) : wire16)} : wire26[(1'h1):(1'h0)])}))
        begin
          reg33 <= wire19;
          reg34 <= wire18[(3'h6):(3'h5)];
          reg35 <= ($signed((wire20[(4'ha):(3'h7)] >= ((^~wire24) != wire21))) * (8'hbb));
        end
      else
        begin
          reg33 <= $unsigned({$signed(($unsigned(reg31) ?
                  (wire22 | wire16) : wire25[(4'hc):(4'hc)]))});
          reg34 <= (($unsigned({wire25[(4'h8):(3'h7)]}) ?
                  $signed($signed((wire32 ?
                      wire26 : wire22))) : ((wire32[(1'h0):(1'h0)] ?
                      $signed(wire23) : {reg34, wire21}) * ((wire21 ?
                          wire26 : wire26) ?
                      wire21[(3'h4):(3'h4)] : (wire27 ? wire26 : (8'hb7))))) ?
              (~&(-$signed($signed(reg33)))) : wire24[(2'h2):(1'h1)]);
          reg35 <= wire22;
        end
    end
  assign wire36 = {{wire23[(3'h4):(3'h4)]}};
endmodule

module module96
#(parameter param121 = ((8'ha3) ? ((~^({(8'ha5)} ? ((7'h41) ^ (8'h9c)) : (|(7'h43)))) ? (^~(8'hbb)) : {(7'h40)}) : (~^(~&((+(8'hb5)) ? ((8'hac) ? (8'hba) : (8'hb9)) : ((8'hb0) ? (8'ha0) : (8'hbb)))))), 
parameter param122 = (|(param121 != param121)))
(y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire101;
  input wire signed [(4'h9):(1'h0)] wire100;
  input wire signed [(3'h6):(1'h0)] wire99;
  input wire [(4'h9):(1'h0)] wire98;
  input wire [(4'hf):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire120;
  wire signed [(4'he):(1'h0)] wire119;
  wire [(3'h5):(1'h0)] wire118;
  wire signed [(3'h7):(1'h0)] wire117;
  wire signed [(4'hc):(1'h0)] wire116;
  wire signed [(4'he):(1'h0)] wire115;
  wire [(3'h4):(1'h0)] wire114;
  wire signed [(3'h4):(1'h0)] wire113;
  wire signed [(4'hb):(1'h0)] wire109;
  wire signed [(3'h7):(1'h0)] wire108;
  wire signed [(5'h13):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire103;
  wire [(4'hb):(1'h0)] wire102;
  reg signed [(5'h12):(1'h0)] reg112 = (1'h0);
  reg [(5'h12):(1'h0)] reg111 = (1'h0);
  reg [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg104 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire109,
                 wire108,
                 wire107,
                 wire103,
                 wire102,
                 reg112,
                 reg111,
                 reg110,
                 reg106,
                 reg105,
                 reg104,
                 (1'h0)};
  assign wire102 = $signed($signed($unsigned(wire99[(2'h3):(1'h1)])));
  assign wire103 = wire101[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg104 <= $signed(((($signed((8'ha8)) != ((8'h9e) ? wire99 : wire100)) ?
          (wire97[(1'h1):(1'h1)] ?
              (wire102 & wire102) : wire98) : (~^wire99)) >>> wire100));
      reg105 <= reg104;
      reg106 <= wire101;
    end
  assign wire107 = $unsigned({$signed($unsigned(wire101[(4'hc):(2'h3)]))});
  assign wire108 = ($signed(wire107[(3'h5):(2'h3)]) ?
                       reg106 : $signed($signed(wire101)));
  assign wire109 = (8'ha0);
  always
    @(posedge clk) begin
      reg110 <= $unsigned(wire108);
      reg111 <= {wire99,
          (wire100[(1'h0):(1'h0)] | $unsigned({wire109[(4'hb):(1'h1)]}))};
      reg112 <= wire100[(4'h9):(2'h2)];
    end
  assign wire113 = $signed((+{{$signed(wire100)}}));
  assign wire114 = wire103[(3'h4):(2'h3)];
  assign wire115 = ($unsigned(reg105[(2'h2):(2'h2)]) ?
                       (reg110 ?
                           wire100[(4'h9):(1'h1)] : wire108) : (reg106 > $unsigned((reg104[(4'hc):(4'h9)] >> $signed(wire107)))));
  assign wire116 = ((^wire97) || (~$signed({(reg104 ? (8'hba) : wire113),
                       (wire114 || (8'ha3))})));
  assign wire117 = wire109[(2'h2):(2'h2)];
  assign wire118 = wire107;
  assign wire119 = (&((!wire117) >= reg112));
  assign wire120 = ($unsigned((~reg111)) ?
                       (wire101 < (&wire98[(2'h2):(1'h0)])) : reg110);
endmodule
