module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire169;
  wire [(3'h6):(1'h0)] wire166;
  wire signed [(4'he):(1'h0)] wire164;
  wire [(4'hb):(1'h0)] wire163;
  wire [(5'h15):(1'h0)] wire161;
  reg signed [(4'hb):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg167 = (1'h0);
  assign y = {wire169,
                 wire166,
                 wire164,
                 wire163,
                 wire161,
                 reg168,
                 reg167,
                 (1'h0)};
  module5 #() modinst162 (wire161, clk, wire0, wire4, wire1, wire2);
  assign wire163 = ($signed(wire0[(2'h3):(1'h0)]) | (|wire0));
  module5 #() modinst165 (.wire7(wire0), .clk(clk), .wire8(wire161), .wire9(wire2), .y(wire164), .wire6(wire4));
  assign wire166 = $unsigned(wire0[(3'h5):(3'h5)]);
  always
    @(posedge clk) begin
      reg167 <= $signed(($signed(wire3) ? wire2 : wire3[(4'hc):(3'h7)]));
      reg168 <= ($unsigned($unsigned($signed({wire166, (8'had)}))) ?
          $unsigned($signed(($signed(wire3) ?
              (-wire163) : (~&wire166)))) : wire166[(2'h2):(1'h0)]);
    end
  assign wire169 = ($signed(((+$unsigned((8'hb4))) ?
                       (wire166 <<< wire164[(4'hc):(4'ha)]) : wire4)) - {$signed((wire2 ~^ reg168))});
endmodule

module module5
#(parameter param160 = (((8'hb0) ? (!(((8'hbe) ? (8'had) : (8'h9c)) > ((8'hab) >>> (8'hba)))) : (((&(7'h42)) != {(8'h9f)}) ? (((7'h44) ? (7'h42) : (8'hb7)) - {(8'h9f)}) : (8'h9f))) != (((!((8'hbe) ? (8'hb9) : (8'h9f))) >= (((8'ha0) >= (8'hae)) ? {(8'hb9), (8'h9d)} : ((8'hab) <<< (8'hbf)))) ? ({(8'ha5)} > ((!(8'ha6)) <= ((8'ha1) <<< (8'hbd)))) : (^~(8'hbb)))))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire6;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire159;
  wire [(4'hd):(1'h0)] wire158;
  wire [(4'ha):(1'h0)] wire157;
  wire [(3'h7):(1'h0)] wire156;
  wire signed [(4'hb):(1'h0)] wire134;
  wire signed [(4'h8):(1'h0)] wire109;
  wire [(5'h11):(1'h0)] wire108;
  wire signed [(5'h15):(1'h0)] wire107;
  wire [(5'h15):(1'h0)] wire106;
  wire [(3'h6):(1'h0)] wire69;
  wire [(5'h12):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire72;
  wire [(3'h5):(1'h0)] wire73;
  wire signed [(4'h9):(1'h0)] wire74;
  wire [(4'h8):(1'h0)] wire75;
  wire signed [(4'hd):(1'h0)] wire79;
  wire signed [(4'h8):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire104;
  wire signed [(4'hd):(1'h0)] wire136;
  wire [(4'hc):(1'h0)] wire154;
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(4'hb):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire134,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire69,
                 wire71,
                 wire72,
                 wire73,
                 wire74,
                 wire75,
                 wire79,
                 wire80,
                 wire104,
                 wire136,
                 wire154,
                 reg76,
                 reg77,
                 reg78,
                 (1'h0)};
  module10 #() modinst70 (wire69, clk, wire8, wire9, wire6, wire7);
  assign wire71 = (|(^wire8));
  assign wire72 = $unsigned(wire69);
  assign wire73 = wire6;
  assign wire74 = ($unsigned(((wire7 & $signed(wire73)) ?
                      (wire73 == wire69[(3'h4):(3'h4)]) : (8'hbd))) <= $signed(wire72[(2'h2):(1'h0)]));
  assign wire75 = $unsigned({wire9});
  always
    @(posedge clk) begin
      if ($unsigned(wire69[(3'h4):(2'h3)]))
        begin
          reg76 <= (((!(!$unsigned(wire69))) ?
              wire6 : ((-wire74[(1'h0):(1'h0)]) ?
                  $unsigned($signed(wire8)) : wire7)) << wire73);
          reg77 <= ({{{(reg76 >>> reg76), wire71}},
              (wire8[(3'h5):(2'h2)] + $signed($signed(wire72)))} <= wire8[(4'hd):(2'h2)]);
        end
      else
        begin
          reg76 <= $unsigned($signed(($signed($signed(wire75)) ?
              ($signed(wire75) - {wire73,
                  wire69}) : ($unsigned(wire74) >= wire71[(4'he):(2'h3)]))));
          reg77 <= wire75;
        end
      reg78 <= ($unsigned($unsigned($signed($unsigned(wire6)))) & (((wire69[(2'h2):(2'h2)] ?
              (~wire72) : $signed(wire69)) - {(wire72 ? (8'hab) : (8'h9f)),
              $unsigned(wire9)}) ?
          wire7[(4'hb):(4'ha)] : $unsigned((^(^~wire75)))));
    end
  assign wire79 = ((8'ha8) & $signed(({(wire73 ? wire73 : wire69)} ?
                      $signed((wire75 + wire72)) : wire7)));
  assign wire80 = $unsigned($unsigned(((8'ha4) ?
                      $signed($unsigned(wire8)) : $unsigned((8'ha1)))));
  module81 #() modinst105 (wire104, clk, wire79, reg78, wire6, reg76, wire7);
  assign wire106 = {wire69};
  assign wire107 = $unsigned(($unsigned($unsigned(wire7[(3'h4):(1'h0)])) ?
                       wire74 : $unsigned(($signed(wire106) > wire71[(3'h7):(1'h1)]))));
  assign wire108 = {wire71};
  assign wire109 = reg76;
  module110 #() modinst135 (.wire115(wire9), .wire111(wire108), .wire114(wire106), .wire112(reg77), .y(wire134), .clk(clk), .wire113(reg78));
  assign wire136 = ($signed($unsigned((wire104 ?
                       wire6[(3'h4):(3'h4)] : $signed(wire72)))) <= wire74);
  module137 #() modinst155 (.wire139(wire7), .y(wire154), .clk(clk), .wire140(reg78), .wire138(wire79), .wire141(wire9));
  assign wire156 = wire74;
  assign wire157 = wire71;
  assign wire158 = wire69;
  assign wire159 = ($unsigned((|$unsigned((wire104 || (8'h9d))))) <= (((^~wire80[(3'h7):(2'h3)]) * wire79[(3'h5):(2'h3)]) ?
                       (~^wire158) : (8'h9f)));
endmodule

module module137  (y, clk, wire141, wire140, wire139, wire138);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire141;
  input wire signed [(4'hd):(1'h0)] wire140;
  input wire signed [(4'hc):(1'h0)] wire139;
  input wire [(4'h8):(1'h0)] wire138;
  wire [(4'he):(1'h0)] wire150;
  wire signed [(4'he):(1'h0)] wire149;
  wire [(4'hc):(1'h0)] wire148;
  wire [(2'h2):(1'h0)] wire147;
  wire [(5'h15):(1'h0)] wire146;
  wire signed [(5'h10):(1'h0)] wire145;
  wire signed [(4'h9):(1'h0)] wire144;
  wire signed [(3'h4):(1'h0)] wire143;
  wire [(5'h10):(1'h0)] wire142;
  reg signed [(3'h5):(1'h0)] reg153 = (1'h0);
  reg [(4'hd):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg151 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 reg153,
                 reg152,
                 reg151,
                 (1'h0)};
  assign wire142 = (((~$unsigned((wire140 ?
                       wire141 : wire138))) * $signed((^wire138[(3'h6):(2'h3)]))) >> (($signed(wire140) ?
                       $unsigned(wire138[(3'h7):(3'h7)]) : wire139[(4'hc):(3'h4)]) >> $unsigned(($unsigned((8'hae)) == {wire138,
                       wire138}))));
  assign wire143 = (8'h9c);
  assign wire144 = ($unsigned($unsigned(($unsigned(wire139) ^ {wire143}))) ?
                       {((|(~^wire140)) ? {{wire139}} : wire143[(1'h0):(1'h0)]),
                           wire141} : (|$unsigned(wire138[(1'h1):(1'h0)])));
  assign wire145 = (wire140 * (&wire144));
  assign wire146 = wire138[(2'h2):(1'h0)];
  assign wire147 = (^~wire141);
  assign wire148 = (((((~^(8'ha3)) ? wire140 : wire147) ?
                               (~(~|wire138)) : $unsigned(((8'ha8) ?
                                   wire147 : wire144))) ?
                           ({$signed(wire138),
                               $unsigned((8'hb2))} - ($signed(wire142) ?
                               (|wire145) : wire145[(4'hf):(4'hf)])) : wire139) ?
                       (!wire139) : wire138);
  assign wire149 = ($signed($unsigned((~&$unsigned(wire138)))) != $signed(wire139[(4'h9):(2'h2)]));
  assign wire150 = wire145[(3'h6):(2'h3)];
  always
    @(posedge clk) begin
      reg151 <= wire144;
      if ({wire146[(3'h5):(2'h2)],
          ((wire147[(1'h1):(1'h1)] ?
                  wire140[(1'h1):(1'h1)] : ($unsigned(wire148) >> wire141)) ?
              (&wire141) : {((^wire146) ? $unsigned(wire147) : (8'ha8)),
                  (((8'hbc) || wire143) ? {wire141, (8'haf)} : wire141)})})
        begin
          reg152 <= $signed({$signed(wire141[(3'h6):(2'h2)]),
              $signed(wire148)});
        end
      else
        begin
          reg152 <= wire143[(2'h2):(1'h0)];
        end
      reg153 <= (~{$unsigned((|(wire142 >>> reg152))),
          ({wire143[(1'h0):(1'h0)], $unsigned(wire145)} ?
              {(wire140 ? (8'hbd) : wire148), reg152} : {{wire142, wire150}})});
    end
endmodule

module module110  (y, clk, wire115, wire114, wire113, wire112, wire111);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire115;
  input wire [(5'h15):(1'h0)] wire114;
  input wire [(4'ha):(1'h0)] wire113;
  input wire signed [(3'h4):(1'h0)] wire112;
  input wire signed [(4'h8):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire133;
  wire signed [(5'h11):(1'h0)] wire132;
  wire signed [(4'hb):(1'h0)] wire131;
  wire [(3'h7):(1'h0)] wire130;
  wire signed [(3'h5):(1'h0)] wire129;
  wire signed [(2'h3):(1'h0)] wire120;
  wire [(5'h11):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire118;
  wire [(5'h10):(1'h0)] wire117;
  wire [(4'hd):(1'h0)] wire116;
  reg signed [(3'h6):(1'h0)] reg128 = (1'h0);
  reg [(4'hc):(1'h0)] reg127 = (1'h0);
  reg [(3'h7):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg125 = (1'h0);
  reg [(5'h13):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg123 = (1'h0);
  reg [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg121 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 (1'h0)};
  assign wire116 = wire114;
  assign wire117 = (wire113[(3'h4):(3'h4)] ?
                       (~^(wire111[(2'h3):(1'h0)] == ($unsigned(wire112) < wire113[(1'h1):(1'h0)]))) : (($signed($signed(wire113)) ?
                           ((wire115 & wire114) ^~ (^~wire111)) : (!$signed(wire116))) <<< {(~|wire116)}));
  assign wire118 = {(|$unsigned($unsigned($unsigned((8'hbf)))))};
  assign wire119 = wire113;
  assign wire120 = $signed((&wire112[(2'h3):(2'h2)]));
  always
    @(posedge clk) begin
      if (wire116[(2'h2):(1'h0)])
        begin
          reg121 <= wire114;
        end
      else
        begin
          if ($signed(wire118))
            begin
              reg121 <= wire113;
            end
          else
            begin
              reg121 <= ({(((^wire118) ?
                              (wire120 ?
                                  wire111 : (8'hbc)) : wire112[(3'h4):(3'h4)]) ?
                          wire119 : {$unsigned(wire119),
                              reg121[(2'h2):(1'h1)]}),
                      ($unsigned($signed(wire118)) - reg121)} ?
                  $signed(wire113[(2'h2):(2'h2)]) : wire113[(3'h7):(2'h3)]);
              reg122 <= $signed($unsigned(wire113[(1'h0):(1'h0)]));
              reg123 <= $signed(wire118[(4'he):(4'hb)]);
            end
          reg124 <= (($unsigned(((!wire119) ?
                  (wire114 ? reg123 : wire113) : $signed(wire120))) ?
              (wire119 != ($unsigned(wire113) + wire111[(3'h4):(3'h4)])) : $signed((wire116 ?
                  (reg123 ?
                      (8'hb5) : (8'ha7)) : (wire116 | wire113)))) >>> $unsigned(wire119));
          reg125 <= wire119[(4'hc):(4'ha)];
          reg126 <= ($unsigned((8'h9e)) ?
              $unsigned(wire111[(1'h1):(1'h1)]) : (wire117 + (^~($unsigned(wire117) ?
                  wire116[(4'hc):(1'h1)] : (wire111 ^ reg122)))));
          reg127 <= (^~wire119);
        end
      reg128 <= (^$signed((8'had)));
    end
  assign wire129 = reg122;
  assign wire130 = (wire115 ?
                       $signed($unsigned({wire129[(2'h2):(1'h0)]})) : (((wire116 ?
                           wire112 : $unsigned(wire129)) || wire117[(3'h5):(3'h4)]) < wire114));
  assign wire131 = wire117;
  assign wire132 = reg127;
  assign wire133 = wire131;
endmodule

module module81
#(parameter param102 = (({((~^(7'h41)) >= (+(8'hbb)))} ? {(!{(8'hbc), (8'hba)})} : ((-((7'h42) ? (8'hbc) : (8'hbb))) ? (-((7'h43) * (8'ha1))) : ((&(8'hab)) ? ((8'hb1) >> (7'h40)) : (~&(8'hb3))))) ? (~^(8'ha3)) : ((-(((8'hab) ^~ (8'hbe)) + ((8'ha3) - (8'hb5)))) != ((!((8'h9d) ? (8'hb3) : (8'hbc))) + ({(8'hab), (8'hb3)} >>> ((8'h9e) ? (7'h44) : (8'hb3)))))), 
parameter param103 = ((~|(((param102 ? param102 : param102) && (param102 ? param102 : param102)) < ((8'hb6) ? (param102 < param102) : ((8'ha4) <= param102)))) <= (((~|param102) > (!(param102 ? param102 : param102))) ? (^((|(8'ha3)) & (8'hb5))) : ((|(^param102)) + (8'hbe)))))
(y, clk, wire86, wire85, wire84, wire83, wire82);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire86;
  input wire [(5'h14):(1'h0)] wire85;
  input wire [(4'hc):(1'h0)] wire84;
  input wire signed [(5'h14):(1'h0)] wire83;
  input wire [(4'hf):(1'h0)] wire82;
  wire [(4'h9):(1'h0)] wire101;
  wire [(4'hc):(1'h0)] wire100;
  wire [(4'hd):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire98;
  wire [(5'h15):(1'h0)] wire97;
  wire [(4'hb):(1'h0)] wire95;
  wire signed [(2'h2):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire93;
  wire signed [(5'h14):(1'h0)] wire92;
  wire [(5'h10):(1'h0)] wire91;
  wire signed [(2'h2):(1'h0)] wire90;
  wire [(5'h14):(1'h0)] wire89;
  wire signed [(4'ha):(1'h0)] wire88;
  wire signed [(5'h15):(1'h0)] wire87;
  reg [(5'h12):(1'h0)] reg96 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 reg96,
                 (1'h0)};
  assign wire87 = $unsigned(wire83);
  assign wire88 = wire87;
  assign wire89 = (wire85 ?
                      (~^$signed($signed($signed(wire84)))) : {wire84,
                          {wire84[(3'h5):(1'h0)],
                              ((!wire85) && (wire83 ? wire86 : wire85))}});
  assign wire90 = ((8'hb7) ? wire89[(4'hd):(4'hd)] : (8'h9d));
  assign wire91 = ((-$unsigned((|$unsigned(wire83)))) + wire84);
  assign wire92 = {$unsigned($unsigned(($unsigned(wire87) ?
                          (^(8'hb1)) : {wire86, wire86})))};
  assign wire93 = wire92;
  assign wire94 = (($unsigned((!$unsigned(wire85))) ?
                      (wire86[(4'hb):(4'h9)] ?
                          $signed($signed(wire84)) : $unsigned((wire92 <<< wire92))) : (!wire89)) ~^ (~wire85));
  assign wire95 = wire91;
  always
    @(posedge clk) begin
      reg96 <= $unsigned(wire84);
    end
  assign wire97 = ((^$signed((+(wire92 == wire82)))) ?
                      ({$signed({wire85}),
                          $signed((wire93 ?
                              wire83 : wire83))} && (-(wire91 ^ $signed(wire82)))) : $unsigned(wire83));
  assign wire98 = wire95;
  assign wire99 = {(~|$signed(((wire86 ? wire98 : wire98) ?
                          wire90 : wire97[(5'h12):(1'h0)])))};
  assign wire100 = wire87[(5'h14):(5'h13)];
  assign wire101 = $signed($unsigned(($unsigned(wire82[(3'h5):(3'h5)]) <= wire91)));
endmodule

module module10
#(parameter param68 = (~^(-(8'hb9))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h23d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire14;
  input wire signed [(3'h6):(1'h0)] wire13;
  input wire signed [(3'h4):(1'h0)] wire12;
  input wire signed [(5'h11):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  wire signed [(3'h6):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  reg signed [(4'hd):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire32,
                 wire31,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
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
                 reg53,
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
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg30,
                 reg29,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire15 = (wire12 ? wire13 : (~$signed(wire11)));
  assign wire16 = $signed(((wire11 ?
                      $signed((!wire12)) : (~^{wire11,
                          wire13})) > {$signed((~&wire14)),
                      $unsigned($unsigned(wire15))}));
  assign wire17 = $unsigned($signed(wire14));
  assign wire18 = $signed(wire11[(1'h0):(1'h0)]);
  assign wire19 = $unsigned(wire11);
  assign wire20 = (wire15[(4'h8):(4'h8)] ?
                      wire13[(3'h6):(3'h6)] : $unsigned((|wire14)));
  assign wire21 = wire16[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg22 <= {$signed(wire14)};
      reg23 <= $unsigned(({{(wire15 > wire19), (wire15 < wire12)},
              {$signed(wire11), wire11}} ?
          wire16 : $unsigned(wire14[(3'h6):(1'h1)])));
      reg24 <= ((&wire12) * {$unsigned((wire16[(4'hb):(3'h7)] >>> (wire11 ~^ wire15)))});
    end
  assign wire25 = wire13;
  assign wire26 = wire19;
  assign wire27 = ((^~reg22[(3'h7):(2'h3)]) - (((~&(wire11 ?
                          wire21 : (8'hab))) ?
                      wire19[(3'h5):(1'h0)] : ((wire19 ? wire12 : wire19) ?
                          (~|(7'h41)) : $signed(wire17))) + wire15[(4'hc):(1'h1)]));
  assign wire28 = {$unsigned({$unsigned((wire12 <= wire16)),
                          $unsigned(wire12[(2'h2):(2'h2)])}),
                      {wire11, wire11}};
  always
    @(posedge clk) begin
      reg29 <= wire18;
      reg30 <= (reg29 ^ wire20[(4'h8):(3'h6)]);
    end
  assign wire31 = reg24[(3'h4):(1'h1)];
  assign wire32 = $signed({{wire15[(1'h1):(1'h1)]}});
  always
    @(posedge clk) begin
      if (reg30[(1'h1):(1'h0)])
        begin
          if ((((!(((8'hb3) ? (8'h9d) : reg22) ?
                  (reg30 ? (8'ha5) : wire16) : (wire13 ?
                      reg29 : wire18))) | ((~((8'hbe) + (8'hab))) ?
                  ($unsigned(wire17) * $unsigned(wire26)) : $signed((-wire32)))) ?
              {$unsigned($unsigned(wire28[(2'h3):(2'h3)]))} : (8'hb9)))
            begin
              reg33 <= reg22[(4'hb):(1'h0)];
              reg34 <= ((wire27 >> wire21) ? wire16 : wire15[(5'h10):(5'h10)]);
            end
          else
            begin
              reg33 <= {wire26[(1'h1):(1'h1)],
                  $unsigned((reg34[(4'hc):(3'h7)] ^ wire14))};
              reg34 <= $signed(wire14[(5'h12):(3'h4)]);
              reg35 <= wire13;
              reg36 <= (|wire31[(4'h8):(3'h5)]);
            end
          reg37 <= (reg34[(3'h7):(1'h0)] == wire20);
          reg38 <= (~&(~|($signed($signed(reg34)) >> {(8'hb5),
              (reg37 ? (8'ha1) : wire19)})));
        end
      else
        begin
          reg33 <= (|$signed($unsigned((|(8'hbd)))));
          reg34 <= ((^~(($signed(reg36) & $signed(reg29)) >= wire26[(1'h0):(1'h0)])) ?
              ($signed(wire31) ^~ (~&(|(~wire19)))) : (wire31 ?
                  {(reg30[(1'h0):(1'h0)] ?
                          (wire25 && wire20) : $unsigned(reg24))} : $signed((reg36 == (^reg34)))));
          reg35 <= wire21;
          reg36 <= reg34;
          reg37 <= (reg36[(3'h6):(2'h3)] < (~^reg37[(3'h6):(1'h1)]));
        end
      if ($signed(wire13))
        begin
          reg39 <= wire26;
          reg40 <= {{(wire13 ? (&{wire15}) : wire21)},
              (wire25[(4'hb):(3'h5)] <= $unsigned($unsigned((reg36 ?
                  reg39 : reg36))))};
          reg41 <= ($signed((reg37 ?
                  wire28[(1'h0):(1'h0)] : wire28[(1'h0):(1'h0)])) ?
              $signed($signed((wire12[(1'h0):(1'h0)] ?
                  {reg37, reg36} : (~&(8'ha5))))) : wire32);
        end
      else
        begin
          reg39 <= {{reg24}};
          if ($signed((reg24[(4'h8):(3'h7)] <<< $unsigned(($unsigned(reg29) <= reg23[(3'h6):(1'h0)])))))
            begin
              reg40 <= $unsigned(((((8'ha2) ?
                      $signed(wire26) : (reg35 | reg38)) + $unsigned($signed((8'hb2)))) ?
                  $signed(wire14[(4'hc):(3'h5)]) : ($unsigned((wire13 ?
                      (8'h9c) : wire26)) ^ reg29[(1'h1):(1'h0)])));
            end
          else
            begin
              reg40 <= (reg38 + (~&wire31[(1'h0):(1'h0)]));
              reg41 <= (((-($unsigned(wire21) - $signed(wire19))) <= reg23[(4'h8):(1'h0)]) * (wire13 ?
                  wire28 : (wire12 ^ wire15[(4'hd):(2'h2)])));
              reg42 <= (&$unsigned((+reg23)));
            end
          reg43 <= wire26;
          reg44 <= $signed((wire17 != reg29));
          reg45 <= reg42;
        end
      reg46 <= $unsigned(((wire26[(1'h1):(1'h1)] << ($signed((8'hb9)) ?
              (~|wire18) : {wire20})) ?
          $unsigned($signed($signed(reg45))) : $unsigned(reg34[(1'h0):(1'h0)])));
    end
  assign wire47 = (!(wire19[(2'h2):(2'h2)] != ($unsigned({wire32}) ?
                      (~&(reg41 ? reg23 : (8'hba))) : ((reg38 ?
                          (8'hb5) : (8'ha2)) ~^ reg23))));
  assign wire48 = (reg23 ?
                      (($unsigned($signed(wire20)) ?
                          {wire11[(1'h0):(1'h0)]} : ((^~reg33) != reg43[(2'h3):(1'h0)])) ^ ({{(8'hb2)}} ^~ (!(8'ha3)))) : wire31);
  assign wire49 = (reg38[(3'h7):(3'h6)] << (&$signed($signed(((8'ha9) ?
                      wire20 : reg30)))));
  assign wire50 = (~&{(8'hb6)});
  assign wire51 = (wire48[(1'h1):(1'h0)] ~^ (($signed($unsigned(wire20)) + (+reg39)) ?
                      ((+$unsigned(reg42)) + ($signed(wire27) ?
                          {wire25,
                              reg39} : $unsigned(wire18))) : $unsigned(((reg36 & (8'had)) ?
                          (wire18 ? wire31 : (8'hab)) : $signed(reg30)))));
  assign wire52 = (($unsigned($unsigned($signed(wire11))) != $signed((8'haf))) ?
                      (reg43[(3'h7):(3'h4)] && wire28) : $signed((-$signed((reg33 ?
                          wire47 : wire26)))));
  always
    @(posedge clk) begin
      if ($signed(wire19))
        begin
          if (wire17[(1'h0):(1'h0)])
            begin
              reg53 <= reg22[(3'h6):(3'h5)];
              reg54 <= reg36[(4'hd):(4'hc)];
              reg55 <= (reg42[(1'h0):(1'h0)] ?
                  {$signed($unsigned({reg22})),
                      $unsigned((wire11 == $signed(wire32)))} : $unsigned((!reg34[(1'h0):(1'h0)])));
              reg56 <= $signed(((&(^~$signed(reg38))) >> $signed(reg35[(4'h9):(3'h5)])));
              reg57 <= (wire20 + wire25);
            end
          else
            begin
              reg53 <= $signed($unsigned($signed(reg37[(2'h3):(1'h0)])));
              reg54 <= ((8'hb8) && wire17);
            end
          if (reg36)
            begin
              reg58 <= (wire21 - reg39[(4'hd):(3'h7)]);
            end
          else
            begin
              reg58 <= wire52;
            end
          reg59 <= wire19[(2'h2):(2'h2)];
        end
      else
        begin
          if ($unsigned((~^(((&(7'h41)) || $signed(reg35)) ^~ wire48))))
            begin
              reg53 <= ({reg37[(3'h6):(1'h0)]} ?
                  (((((8'ha1) ~^ wire25) ? reg36[(1'h0):(1'h0)] : (-wire14)) ?
                      (8'hbc) : ((wire17 > wire16) != wire14)) >= $unsigned(wire31)) : ($unsigned((~^{wire11,
                      wire19})) || ($unsigned((~|(8'hbd))) ?
                      $signed(reg41) : $unsigned(wire25[(4'hc):(4'h8)]))));
              reg54 <= wire16;
            end
          else
            begin
              reg53 <= (~$unsigned(reg24));
              reg54 <= ({(~^$unsigned((wire31 ? reg57 : wire47))), (8'h9e)} ?
                  $signed(wire48) : wire50);
              reg55 <= {$signed(reg34[(3'h4):(3'h4)])};
              reg56 <= wire25;
            end
          if (wire18[(4'h8):(3'h6)])
            begin
              reg57 <= $unsigned(reg55[(3'h5):(3'h4)]);
            end
          else
            begin
              reg57 <= wire26[(3'h6):(2'h3)];
              reg58 <= $unsigned((~(($signed(wire52) ? reg37 : $signed(reg24)) ?
                  $unsigned(reg59) : (((8'ha1) ? (7'h40) : reg41) ?
                      $signed(reg23) : ((8'ha4) ? reg45 : reg24)))));
            end
          reg59 <= (|(+(((wire14 <= wire20) && $signed(wire21)) ?
              (wire31 ? (wire31 * reg53) : (8'hbb)) : reg53[(5'h11):(2'h2)])));
          reg60 <= (~|$signed($unsigned((|(wire51 ? reg57 : reg30)))));
          if ((reg58 ?
              $signed($signed((^wire18))) : (~&(($unsigned(reg40) ~^ reg39) ?
                  wire32[(4'h9):(2'h2)] : (&reg59)))))
            begin
              reg61 <= (($unsigned($signed((^~reg24))) ?
                      (reg40[(1'h0):(1'h0)] <<< $signed((~|wire16))) : wire31[(4'hb):(3'h5)]) ?
                  (wire19[(3'h6):(1'h1)] ?
                      wire31 : (wire17[(3'h5):(1'h1)] ?
                          $unsigned(wire17[(3'h5):(1'h1)]) : ({wire52, reg29} ?
                              reg36 : (wire47 < wire11)))) : (!{wire17}));
              reg62 <= (reg36[(2'h2):(1'h1)] ?
                  (^(&wire28[(3'h6):(1'h0)])) : (!((!(wire32 ? reg58 : reg57)) ?
                      (8'ha4) : wire28[(3'h6):(1'h0)])));
              reg63 <= ($unsigned($signed((~^$signed((8'hbb))))) ?
                  $unsigned(reg29) : ($signed((reg57[(4'ha):(3'h7)] ~^ wire18)) * (~|((reg54 ^ reg46) ?
                      $signed(reg58) : $signed(wire50)))));
              reg64 <= $signed((|(+wire20[(3'h5):(3'h4)])));
              reg65 <= (|wire14);
            end
          else
            begin
              reg61 <= ((8'hbf) ^ wire14);
              reg62 <= reg59;
              reg63 <= $unsigned(({(((8'ha2) ^~ wire13) && {wire32})} ?
                  (wire13[(3'h4):(2'h3)] ? wire32 : wire18) : ((reg35 ?
                      $unsigned(reg41) : $unsigned(reg58)) <<< (+$unsigned(wire20)))));
              reg64 <= (8'hae);
            end
        end
      reg66 <= ((({$unsigned(reg43)} * wire17) << $unsigned(wire15[(3'h5):(2'h2)])) ^~ (&{(~&reg44),
          reg38}));
      reg67 <= reg61[(1'h0):(1'h0)];
    end
endmodule
