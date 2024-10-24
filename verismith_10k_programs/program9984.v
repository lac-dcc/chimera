module top
#(parameter param184 = ((+(|(((8'ha9) == (8'h9d)) ? ((8'ha9) ? (8'ha6) : (8'hbb)) : {(8'haa)}))) ? (|((^((8'ha9) ? (8'had) : (8'hb8))) > ((&(8'h9c)) ? ((8'hb9) ? (8'ha0) : (8'hb1)) : ((8'hb4) ? (8'hbb) : (8'hbf))))) : ((8'hbb) ? ((|(^~(8'ha9))) ? ((-(8'haa)) ? ((8'ha6) > (8'hb6)) : ((8'hbe) == (8'had))) : ((~&(8'ha8)) & ((7'h40) ~^ (7'h40)))) : (((!(8'hab)) && (~&(7'h42))) ~^ ((~^(8'ha7)) << (^~(8'hbf)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire183;
  wire signed [(2'h2):(1'h0)] wire182;
  wire signed [(4'hb):(1'h0)] wire181;
  wire signed [(2'h2):(1'h0)] wire180;
  wire signed [(4'he):(1'h0)] wire179;
  wire [(2'h3):(1'h0)] wire176;
  wire signed [(2'h3):(1'h0)] wire175;
  wire [(4'hf):(1'h0)] wire174;
  wire signed [(4'hb):(1'h0)] wire169;
  wire [(5'h13):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire78;
  wire signed [(4'he):(1'h0)] wire79;
  wire signed [(4'hb):(1'h0)] wire80;
  wire signed [(5'h14):(1'h0)] wire81;
  wire [(5'h10):(1'h0)] wire82;
  wire [(3'h5):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire127;
  wire signed [(5'h12):(1'h0)] wire171;
  wire [(3'h6):(1'h0)] wire172;
  reg [(5'h12):(1'h0)] reg178 = (1'h0);
  reg [(3'h4):(1'h0)] reg177 = (1'h0);
  assign y = {wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire176,
                 wire175,
                 wire174,
                 wire169,
                 wire76,
                 wire78,
                 wire79,
                 wire80,
                 wire81,
                 wire82,
                 wire83,
                 wire127,
                 wire171,
                 wire172,
                 reg178,
                 reg177,
                 (1'h0)};
  module5 #() modinst77 (.wire8(wire4), .wire6(wire0), .y(wire76), .clk(clk), .wire10(wire1), .wire9(wire3), .wire7(wire2));
  assign wire78 = ((((7'h40) << ((wire2 || (7'h42)) ?
                          $signed((8'hb3)) : wire1)) <= (!(-(~&wire3)))) ?
                      (wire2[(3'h6):(3'h4)] < (wire76 <= (-{(8'hb8)}))) : $signed((((~|wire0) ?
                          $signed(wire3) : (|(8'had))) * wire3)));
  assign wire79 = {((wire3 ? wire4[(5'h10):(4'hc)] : wire4) ?
                          $unsigned((((8'hbd) ? wire4 : wire1) ?
                              (~&wire2) : ((8'hb9) || wire78))) : wire0)};
  assign wire80 = $unsigned((wire79[(3'h7):(1'h1)] >= wire79[(3'h6):(3'h6)]));
  assign wire81 = {((!(^~(wire2 ?
                          (8'ha9) : wire79))) != (((wire4 * (8'ha5)) <<< (wire0 ?
                              wire0 : wire3)) ?
                          (7'h44) : wire80))};
  assign wire82 = ($signed(wire76) || ($signed((wire1 > wire80)) ?
                      $unsigned(wire1) : wire81));
  assign wire83 = (8'hab);
  module84 #() modinst128 (.wire86(wire4), .clk(clk), .y(wire127), .wire88(wire2), .wire87(wire78), .wire89(wire79), .wire85(wire80));
  module129 #() modinst170 (.clk(clk), .wire130(wire76), .wire131(wire80), .wire132(wire3), .y(wire169), .wire134(wire79), .wire133(wire0));
  assign wire171 = ((~^$signed((wire83 - (~wire81)))) || wire83[(1'h0):(1'h0)]);
  module84 #() modinst173 (wire172, clk, wire169, wire76, wire171, wire78, wire4);
  assign wire174 = wire79;
  assign wire175 = $signed($signed($signed($unsigned(wire83[(2'h2):(1'h0)]))));
  assign wire176 = ((~$unsigned(($unsigned((8'ha4)) ?
                           (wire174 ? wire80 : (7'h44)) : $unsigned(wire2)))) ?
                       (($signed((wire171 ? wire81 : (8'haf))) ?
                               $unsigned((8'h9e)) : wire1[(2'h2):(1'h1)]) ?
                           ($signed($unsigned((8'ha4))) <= ((wire171 ?
                               wire4 : wire127) > (~^(8'h9c)))) : $unsigned(((wire175 <= wire127) & ((8'ha8) >> wire79)))) : (wire81 ?
                           wire4 : ($unsigned(wire0) | $unsigned((~wire0)))));
  always
    @(posedge clk) begin
      reg177 <= (wire79[(4'hd):(3'h4)] != (&wire2));
      reg178 <= wire83;
    end
  assign wire179 = reg177[(1'h0):(1'h0)];
  assign wire180 = ((((wire179 <= $signed(reg178)) + {$signed(wire127)}) ?
                       $unsigned($signed({wire78})) : ($unsigned((wire3 ?
                           (8'ha2) : wire3)) <= $signed(wire171))) < $unsigned(wire175[(2'h3):(2'h3)]));
  assign wire181 = wire79;
  assign wire182 = $unsigned((~^$signed($unsigned($unsigned(wire169)))));
  assign wire183 = ((~&wire182) | (7'h42));
endmodule

module module129
#(parameter param168 = (((((~^(8'hbd)) != (+(8'hb8))) ? (((8'haa) & (8'hac)) | ((8'h9c) ? (8'hac) : (7'h43))) : (((8'ha9) > (8'ha1)) ? (&(7'h41)) : ((8'hbc) ? (8'haf) : (8'ha0)))) ? {({(8'hae), (8'hbf)} ? (~^(8'h9d)) : ((8'hb8) ? (8'h9f) : (8'ha3)))} : (|(((8'had) != (8'hab)) >>> ((7'h40) ? (8'ha5) : (8'ha3))))) - (&(-(((8'hb4) > (8'hbd)) ? {(8'hac)} : (~|(8'ha3)))))))
(y, clk, wire134, wire133, wire132, wire131, wire130);
  output wire [(32'h174):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire134;
  input wire signed [(3'h6):(1'h0)] wire133;
  input wire signed [(4'hb):(1'h0)] wire132;
  input wire [(2'h3):(1'h0)] wire131;
  input wire [(4'hc):(1'h0)] wire130;
  wire signed [(4'h9):(1'h0)] wire147;
  wire [(5'h10):(1'h0)] wire146;
  wire signed [(4'he):(1'h0)] wire145;
  wire [(5'h13):(1'h0)] wire144;
  reg signed [(4'h8):(1'h0)] reg167 = (1'h0);
  reg [(4'hc):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg165 = (1'h0);
  reg [(5'h10):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg163 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg162 = (1'h0);
  reg [(3'h6):(1'h0)] reg161 = (1'h0);
  reg [(4'h8):(1'h0)] reg160 = (1'h0);
  reg [(5'h14):(1'h0)] reg159 = (1'h0);
  reg [(4'ha):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg157 = (1'h0);
  reg [(5'h15):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg155 = (1'h0);
  reg [(3'h4):(1'h0)] reg154 = (1'h0);
  reg [(4'ha):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg152 = (1'h0);
  reg [(4'h8):(1'h0)] reg151 = (1'h0);
  reg [(4'hf):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg143 = (1'h0);
  reg [(4'h9):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg140 = (1'h0);
  reg [(4'hb):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg138 = (1'h0);
  reg [(4'he):(1'h0)] reg137 = (1'h0);
  reg [(3'h7):(1'h0)] reg136 = (1'h0);
  reg [(3'h6):(1'h0)] reg135 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire144,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg135 <= wire133;
      reg136 <= $signed(wire132);
      reg137 <= $signed((~^wire131[(1'h1):(1'h1)]));
      if (reg136[(2'h3):(2'h3)])
        begin
          if ($unsigned(($signed(reg135) ?
              (wire132[(3'h6):(1'h1)] & (wire132 <= (wire134 < wire134))) : $signed({$signed((8'hbb))}))))
            begin
              reg138 <= (~|({wire134,
                  $unsigned((wire131 ?
                      wire134 : wire133))} || ((-$unsigned((8'hb9))) ~^ (((8'hb0) << reg135) >> $unsigned((8'ha3))))));
            end
          else
            begin
              reg138 <= ((wire131[(2'h3):(2'h3)] ?
                      ((((8'hb2) ? reg136 : reg136) ?
                              ((8'ha9) - reg136) : (~reg137)) ?
                          (|reg136[(3'h6):(3'h6)]) : ((wire133 ?
                                  wire133 : (8'hb5)) ?
                              ((8'ha4) ?
                                  wire134 : (8'haa)) : $unsigned((8'hb8)))) : (wire130 >> ({reg138} >= (^reg137)))) ?
                  reg136 : (8'hb3));
              reg139 <= wire134[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg138 <= $unsigned($signed((8'ha4)));
          reg139 <= (~&(^($unsigned($unsigned(wire131)) > reg137)));
          reg140 <= $signed({reg139});
          if (((-(wire133 | (~&$signed(wire131)))) - ((((~reg135) ?
              $unsigned((8'hba)) : $unsigned((8'ha7))) - reg140[(4'hc):(3'h4)]) >> ({reg140,
                  reg137} ?
              wire132 : (8'ha5)))))
            begin
              reg141 <= reg139[(3'h7):(3'h4)];
              reg142 <= reg141[(5'h10):(4'hb)];
            end
          else
            begin
              reg141 <= (8'hb2);
            end
          reg143 <= $unsigned($unsigned(reg136));
        end
    end
  assign wire144 = $unsigned(reg143[(1'h0):(1'h0)]);
  assign wire145 = wire144;
  assign wire146 = ($signed(wire144[(4'he):(4'hb)]) ?
                       $unsigned(((reg136 << wire132) ?
                           $signed((-wire133)) : (~$unsigned(wire133)))) : (~^$signed({$unsigned((7'h40))})));
  assign wire147 = ($signed(((^(reg142 != wire134)) >>> (8'hb2))) ?
                       ((^~(~|$unsigned(reg135))) ?
                           reg141[(5'h10):(5'h10)] : (reg136 != ($signed(wire145) ?
                               (~|reg137) : wire133))) : ($unsigned(wire133[(3'h5):(3'h4)]) ?
                           (^{$signed(reg141),
                               (reg135 ?
                                   (8'hb2) : reg137)}) : reg140[(4'ha):(4'h9)]));
  always
    @(posedge clk) begin
      reg148 <= (^~wire146[(5'h10):(4'hf)]);
    end
  always
    @(posedge clk) begin
      if (reg139[(4'hb):(3'h7)])
        begin
          reg149 <= {($signed($signed((reg135 >> reg137))) | reg141[(3'h5):(3'h4)]),
              (wire145 ?
                  reg142[(3'h6):(3'h5)] : ($signed((8'hbf)) || (8'hac)))};
          reg150 <= ($signed({wire134[(3'h4):(2'h2)]}) ?
              reg142 : ($signed((~(wire134 & reg141))) ?
                  {{$signed((8'h9f))}} : {((-wire145) ?
                          {reg149, wire146} : wire134)}));
        end
      else
        begin
          reg149 <= {{((~^wire146[(1'h1):(1'h0)]) ?
                      $signed(wire134[(1'h1):(1'h0)]) : ((~^wire131) <= (&(8'ha7))))}};
        end
      reg151 <= $unsigned((~|reg141));
      reg152 <= reg135[(1'h0):(1'h0)];
      reg153 <= $signed((wire133[(3'h4):(3'h4)] <<< (-$signed((wire147 ?
          reg150 : wire145)))));
      reg154 <= $unsigned($signed($signed(reg152)));
    end
  always
    @(posedge clk) begin
      reg155 <= ($signed($unsigned($unsigned({wire146}))) ?
          ((!$signed((~|wire144))) < ({wire131[(1'h1):(1'h0)],
                  (reg149 ^ wire146)} ?
              wire147 : ((reg141 ?
                  reg140 : reg135) ~^ $signed((8'haf))))) : {$unsigned($unsigned({reg139,
                  reg137})),
              wire133[(3'h6):(3'h4)]});
      if (wire144)
        begin
          reg156 <= (~|reg141);
          if (((~|(reg153[(4'ha):(3'h4)] ?
                  (~|((8'haa) ? reg142 : reg139)) : $signed({reg150}))) ?
              reg139[(1'h1):(1'h1)] : ((+wire130) * $signed({wire146[(4'h8):(3'h5)]}))))
            begin
              reg157 <= (~|(~|$signed({(wire145 < wire146), (&wire147)})));
            end
          else
            begin
              reg157 <= {({(!(reg135 || wire144)),
                      reg150[(1'h1):(1'h0)]} | (wire144[(3'h4):(1'h1)] ?
                      $signed({wire133}) : $signed((reg154 ?
                          reg140 : reg153))))};
              reg158 <= ((wire147 && ((7'h42) && (!{wire131}))) ?
                  $signed($unsigned($signed((reg153 ^~ wire134)))) : ($unsigned(reg156[(5'h13):(4'hf)]) ^~ (((wire132 ?
                          reg154 : reg139) ?
                      (wire147 * reg139) : $unsigned(reg143)) <<< ($signed(wire133) >>> (wire134 ?
                      wire133 : reg155)))));
              reg159 <= ({($unsigned($unsigned(reg150)) < (&(reg143 | wire131)))} ?
                  (&($unsigned(wire134) ?
                      reg153 : (+$unsigned(wire144)))) : (~|(~&{(!reg140),
                      (reg139 ? wire147 : wire131)})));
              reg160 <= $signed((~^reg139));
              reg161 <= (($signed(reg152[(4'h8):(3'h5)]) ?
                      (~|((wire134 ? reg152 : wire130) ?
                          ((8'h9f) || wire134) : $signed(wire134))) : {((reg138 > wire131) * reg154),
                          (^~$signed(reg157))}) ?
                  (-$unsigned($unsigned(reg136[(2'h2):(2'h2)]))) : ((+reg150) ?
                      $unsigned((reg136 ?
                          {(8'hbb)} : reg140)) : {($signed(reg143) == (reg157 ^ wire133))}));
            end
          if ($unsigned($unsigned((($unsigned(wire147) == {reg142}) ~^ reg151[(1'h1):(1'h1)]))))
            begin
              reg162 <= ((|(((~|(8'haf)) - $signed(reg160)) < ({reg149,
                          (8'hb5)} ?
                      (wire134 ? reg136 : reg153) : reg137))) ?
                  ((((wire147 ? reg158 : (8'h9e)) >>> ((7'h40) ?
                              reg139 : reg143)) ?
                          reg157[(3'h7):(3'h6)] : (~|$signed(wire144))) ?
                      reg150[(1'h0):(1'h0)] : {wire134}) : {(8'hab), reg152});
              reg163 <= (reg142[(1'h0):(1'h0)] >>> ($signed($unsigned((reg151 ?
                  (8'h9c) : (8'hb1)))) ^ (&({reg158} != (&reg150)))));
              reg164 <= reg163[(1'h1):(1'h0)];
              reg165 <= (({(~(reg148 ? reg140 : reg148)),
                          (~&(wire147 && reg152))} ?
                      (reg155 >= $signed({wire145})) : ($signed(((8'haa) && reg139)) ?
                          reg158 : $signed({wire131}))) ?
                  wire144 : (+reg139));
            end
          else
            begin
              reg162 <= $unsigned($signed($unsigned(reg162[(2'h2):(2'h2)])));
              reg163 <= $unsigned((($signed(reg155) ?
                      (^~(+reg156)) : {(reg136 ? wire144 : wire146),
                          wire145[(4'hd):(2'h3)]}) ?
                  reg165[(3'h4):(1'h0)] : (reg159[(4'hc):(4'hc)] << reg151[(3'h6):(3'h5)])));
            end
          reg166 <= reg154;
        end
      else
        begin
          reg156 <= $signed(reg157[(2'h3):(1'h0)]);
          reg157 <= (reg163[(3'h5):(1'h1)] || (~|($unsigned(reg152) ?
              $signed((reg164 ? reg136 : reg148)) : reg162[(1'h0):(1'h0)])));
          reg158 <= (reg152[(4'he):(3'h4)] >>> $signed(reg141));
          reg159 <= reg154[(2'h2):(1'h1)];
        end
      reg167 <= $signed((&(reg160[(2'h3):(1'h1)] && reg141[(4'hc):(4'h8)])));
    end
endmodule

module module84  (y, clk, wire85, wire86, wire87, wire88, wire89);
  output wire [(32'h15):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire85;
  input wire signed [(5'h13):(1'h0)] wire86;
  input wire signed [(4'hf):(1'h0)] wire87;
  input wire signed [(4'ha):(1'h0)] wire88;
  input wire [(4'he):(1'h0)] wire89;
  wire signed [(4'h8):(1'h0)] wire126;
  wire signed [(3'h6):(1'h0)] wire90;
  wire signed [(3'h4):(1'h0)] wire91;
  wire signed [(2'h2):(1'h0)] wire124;
  assign y = {wire126, wire90, wire91, wire124, (1'h0)};
  assign wire90 = $signed(((~$unsigned(wire89[(1'h0):(1'h0)])) << wire88));
  assign wire91 = (8'hb7);
  module92 #() modinst125 (wire124, clk, wire86, wire87, wire90, wire89, wire85);
  assign wire126 = ((((8'ha1) <<< (~&(wire90 ? (8'hb8) : wire89))) == wire85) ?
                       ((8'hbc) - (~^$unsigned((wire86 << wire88)))) : {($signed(wire90[(2'h2):(1'h1)]) ?
                               $unsigned((wire88 & wire87)) : ((wire87 & wire90) ?
                                   $unsigned(wire91) : (wire87 != (8'hbe)))),
                           (~|{(wire86 ? wire88 : wire85),
                               (wire91 && wire91)})});
endmodule

module module5
#(parameter param75 = ((-(&((|(8'haf)) ? (~(7'h43)) : (|(8'hbe))))) + ((({(7'h43), (8'ha2)} | ((8'hb0) ^ (8'ha7))) ~^ (((8'hb3) ^ (8'had)) << ((8'hb8) | (8'hb9)))) >>> (((|(8'ha7)) == ((8'ha5) >>> (8'h9f))) && (8'ha2)))))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h1e7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire6;
  input wire [(4'hc):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire74;
  wire signed [(3'h4):(1'h0)] wire73;
  wire [(2'h2):(1'h0)] wire72;
  wire signed [(4'h9):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire42;
  wire [(4'hd):(1'h0)] wire43;
  wire signed [(5'h14):(1'h0)] wire70;
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire27,
                 wire36,
                 wire41,
                 wire42,
                 wire43,
                 wire70,
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
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(wire9))
        begin
          reg11 <= ((8'ha3) ?
              $unsigned(({wire6[(5'h11):(1'h0)], {(8'ha0)}} ?
                  wire8 : $signed($signed((8'hb7))))) : wire6[(3'h4):(2'h3)]);
        end
      else
        begin
          reg11 <= (&($signed(({(8'hab), reg11} & $signed(reg11))) | wire8));
          if ($unsigned(($unsigned($signed(wire10[(1'h1):(1'h1)])) + (^(~&wire10[(4'h8):(1'h0)])))))
            begin
              reg12 <= $signed(($unsigned((wire8[(5'h12):(4'ha)] != (wire6 | (8'hba)))) != wire10));
              reg13 <= (reg12[(2'h2):(1'h1)] > {((reg12 <= wire10[(1'h1):(1'h1)]) && reg12[(2'h2):(1'h0)])});
            end
          else
            begin
              reg12 <= reg11[(1'h0):(1'h0)];
              reg13 <= wire6;
            end
          reg14 <= $unsigned((~|reg11[(2'h3):(2'h3)]));
          reg15 <= (~|($unsigned($unsigned(wire7[(2'h3):(2'h2)])) > ($signed((wire8 > reg14)) ?
              wire7[(3'h6):(3'h6)] : {(wire10 ? reg11 : (8'hb9)),
                  $unsigned(wire8)})));
        end
      if (({(reg11[(3'h4):(1'h0)] & ((8'hb8) ?
              $signed(wire6) : {wire8}))} * $signed(wire9[(3'h7):(3'h5)])))
        begin
          if ($signed(($unsigned(reg15[(3'h6):(2'h2)]) || {$unsigned(wire9[(4'hc):(3'h4)]),
              $unsigned(((8'h9c) > wire8))})))
            begin
              reg16 <= ({$signed({(reg14 ? reg13 : wire8), {reg13}}),
                  ((((8'hb9) ? reg14 : wire10) <= (wire6 ? reg13 : reg12)) ?
                      $unsigned($unsigned(reg11)) : {(wire8 ? reg11 : reg12),
                          (!wire9)})} && reg14);
              reg17 <= ((&(wire10[(4'ha):(1'h0)] ? $signed((&reg11)) : reg11)) ?
                  reg11 : (reg16 | $signed($signed($signed(wire10)))));
              reg18 <= wire10[(1'h0):(1'h0)];
              reg19 <= reg14[(2'h2):(1'h1)];
            end
          else
            begin
              reg16 <= $signed(($unsigned($unsigned(reg18)) ^~ ($signed(((7'h42) ^~ reg16)) || (~|reg17[(4'h9):(2'h3)]))));
              reg17 <= {$unsigned(((~reg18) < wire6)),
                  ($unsigned($signed(reg12[(3'h4):(1'h1)])) ?
                      {(reg19 ? {reg12, reg11} : wire7),
                          {(+wire6),
                              (wire10 ?
                                  wire7 : reg12)}} : reg18[(2'h2):(1'h0)])};
            end
          reg20 <= $unsigned({$unsigned(((reg19 || reg16) && (reg15 > (8'h9f))))});
          reg21 <= $signed({wire10[(2'h3):(2'h3)],
              ($signed(reg13[(4'hf):(4'hb)]) ? {(~(8'ha6))} : (7'h42))});
        end
      else
        begin
          reg16 <= (((wire8 >>> $signed($unsigned(reg17))) ^ ((!$unsigned(reg13)) ?
                  $unsigned($unsigned((8'ha7))) : ((wire10 ? wire8 : (8'hb3)) ?
                      {reg13, (8'hbb)} : reg20[(5'h12):(4'h8)]))) ?
              ((!(+$signed(reg17))) ?
                  $signed({reg17, {wire9}}) : ($unsigned((wire10 ?
                          reg19 : reg21)) ?
                      reg16[(4'h9):(1'h0)] : ($unsigned(reg12) ?
                          (~&wire6) : $unsigned(reg14)))) : ((($unsigned(reg17) ?
                      (reg16 <= reg19) : wire7[(4'hc):(4'h8)]) ?
                  reg15[(4'hd):(4'hd)] : reg19) || wire6));
          if ($unsigned((+(^~((wire8 ? reg21 : reg11) << reg12)))))
            begin
              reg17 <= wire7[(2'h3):(2'h2)];
            end
          else
            begin
              reg17 <= wire8[(4'hf):(4'hf)];
              reg18 <= $unsigned((~(reg20 ?
                  reg21[(4'hf):(3'h4)] : (~&(~&reg18)))));
              reg19 <= $signed($signed({reg19[(4'ha):(3'h6)]}));
              reg20 <= (|reg21);
            end
          reg21 <= $signed(((8'h9e) ?
              {reg16[(1'h0):(1'h0)]} : $signed((((8'hae) ?
                  reg13 : reg18) || reg16[(4'h9):(3'h5)]))));
          reg22 <= $unsigned($signed($signed(((~wire7) << reg21[(2'h2):(2'h2)]))));
          reg23 <= reg15;
        end
      reg24 <= (~^((8'hb5) ?
          $unsigned((reg11[(3'h7):(1'h1)] ?
              $signed(reg11) : $unsigned(reg21))) : (~^$unsigned((reg23 ^~ reg21)))));
      reg25 <= $unsigned((($unsigned((reg17 | reg24)) ?
          (((8'h9f) == wire10) < (reg14 >= reg16)) : reg21) << reg21[(2'h2):(1'h0)]));
      reg26 <= ((^(-{reg20, reg23[(3'h4):(1'h0)]})) ?
          {reg21[(2'h2):(2'h2)],
              {(~|$signed(reg22)),
                  (reg13[(4'hd):(4'h8)] ?
                      $signed(reg24) : (wire10 ?
                          reg11 : reg14))}} : ({(reg21[(2'h3):(1'h0)] & {wire6}),
              $signed((reg12 ? reg22 : reg15))} || (^(wire9[(2'h3):(2'h2)] ?
              $unsigned((7'h43)) : (8'ha8)))));
    end
  assign wire27 = (-reg21);
  always
    @(posedge clk) begin
      reg28 <= reg23;
      reg29 <= (&$signed(reg20[(4'hf):(4'hf)]));
      reg30 <= $unsigned(((!$signed(reg24[(4'ha):(4'h8)])) ?
          reg22 : ((7'h40) <<< $unsigned((reg19 ? reg15 : (8'ha8))))));
      reg31 <= $unsigned((~^reg20));
    end
  always
    @(posedge clk) begin
      reg32 <= (-reg23);
      reg33 <= (&((+(8'hba)) | (|wire10[(3'h6):(3'h6)])));
      reg34 <= ((+reg29) ? wire9[(4'h8):(4'h8)] : reg21[(2'h2):(2'h2)]);
      reg35 <= {reg26};
    end
  assign wire36 = wire8[(5'h12):(3'h6)];
  always
    @(posedge clk) begin
      reg37 <= $signed($signed(reg29));
      if ($unsigned(reg17))
        begin
          if ((($signed({(reg14 ^~ (8'ha0))}) ?
                  wire6 : $signed($signed((reg16 ? reg22 : reg22)))) ?
              reg15[(4'he):(3'h7)] : (((~^$signed(reg21)) ?
                  wire9[(4'h8):(2'h2)] : $unsigned((wire27 ?
                      reg34 : reg12))) && reg11[(4'he):(4'h9)])))
            begin
              reg38 <= reg21[(2'h2):(2'h2)];
              reg39 <= $unsigned((($unsigned($signed(reg14)) ^~ ((reg31 ?
                  reg11 : (8'hba)) <<< $signed(reg19))) + $signed(reg30)));
              reg40 <= $unsigned(reg23[(3'h4):(1'h1)]);
            end
          else
            begin
              reg38 <= $unsigned(reg20);
              reg39 <= reg14;
              reg40 <= wire7[(1'h1):(1'h0)];
            end
        end
      else
        begin
          reg38 <= reg13;
          reg39 <= $signed(((^~((reg18 | reg19) - reg13)) ?
              reg19 : (-$signed((reg17 >= reg24)))));
          reg40 <= {reg29[(3'h5):(1'h0)], wire10};
        end
    end
  assign wire41 = reg17;
  assign wire42 = reg17;
  assign wire43 = (({(reg11 - {reg38}),
                      ((|reg11) ?
                          (~|reg30) : (reg39 ?
                              reg35 : reg39))} <= (~&wire27)) && $unsigned({(7'h44)}));
  module44 #() modinst71 (wire70, clk, reg16, reg24, wire9, reg12);
  assign wire72 = {$signed((~^(reg25[(3'h6):(3'h5)] ?
                          $signed((8'hba)) : (reg31 ? wire6 : reg38)))),
                      {$unsigned($unsigned((reg29 ? (7'h41) : reg21)))}};
  assign wire73 = {$signed($signed((~reg21))), (~(8'ha3))};
  assign wire74 = (reg28[(2'h3):(2'h3)] ?
                      $unsigned((((reg30 ? reg32 : reg22) >= (^(8'h9e))) ?
                          {(wire10 > wire8),
                              reg29[(4'h8):(3'h4)]} : $unsigned((wire6 ?
                              reg28 : (8'ha2))))) : (wire7[(4'hc):(1'h0)] >= ({(reg30 || reg26)} ?
                          ($unsigned(wire70) ^~ {wire42}) : reg24)));
endmodule

module module44
#(parameter param69 = ((~&(((~|(8'h9f)) ? ((8'h9f) - (8'ha7)) : ((8'hb4) * (8'hb4))) ? {((8'ha0) >>> (8'h9d)), ((8'ha3) == (8'h9f))} : (((8'had) >>> (8'ha8)) ^~ ((8'hb3) ? (8'ha0) : (8'ha1))))) ? (((-((8'ha2) <<< (8'h9e))) && (^((8'ha5) >> (7'h44)))) ^~ (8'ha2)) : (&((~&((8'ha4) || (8'hb5))) ~^ (((8'ha2) < (8'hb3)) ? ((8'ha4) ? (8'hac) : (8'ha2)) : {(8'ha6), (8'hbf)})))))
(y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire48;
  input wire signed [(2'h2):(1'h0)] wire47;
  input wire [(4'hc):(1'h0)] wire46;
  input wire signed [(4'hc):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire53;
  wire [(4'ha):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire51;
  wire [(3'h7):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire49;
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg63 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg56 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  assign y = {wire68,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
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
                 (1'h0)};
  assign wire49 = ({((8'h9e) <= (wire48 < $signed((8'ha9))))} ?
                      (($unsigned($unsigned(wire48)) ?
                          $signed(wire48[(4'h8):(3'h5)]) : wire46[(4'h8):(3'h5)]) == ($unsigned({wire46}) ?
                          $unsigned(((8'ha3) ?
                              wire46 : (8'ha9))) : ($signed((8'h9e)) + wire46[(3'h7):(1'h1)]))) : wire45[(4'h8):(4'h8)]);
  assign wire50 = $unsigned((8'hbf));
  assign wire51 = (wire50[(1'h1):(1'h1)] ?
                      wire47[(1'h1):(1'h1)] : (wire48[(2'h2):(1'h0)] >= (8'hae)));
  assign wire52 = $unsigned($signed((8'ha2)));
  assign wire53 = wire51;
  always
    @(posedge clk) begin
      reg54 <= $signed(((!$unsigned({wire46,
          (8'hb6)})) & wire46[(4'ha):(2'h3)]));
      reg55 <= (wire48 ?
          wire48 : {(($unsigned(wire50) ?
                  $signed(wire46) : $signed(wire53)) << $unsigned(wire53))});
      if (((^wire49[(3'h4):(3'h4)]) ?
          $unsigned({$signed((wire52 ? wire46 : wire46)),
              (+(+wire45))}) : wire49[(4'ha):(3'h5)]))
        begin
          reg56 <= (wire45 != (~|(((wire53 ?
                  wire46 : wire46) == wire50[(1'h1):(1'h1)]) ?
              (~^wire49) : {wire45[(4'ha):(1'h0)]})));
          reg57 <= $unsigned(({($signed(reg56) ?
                  {wire49} : (wire51 ~^ wire52))} == wire51[(1'h0):(1'h0)]));
          reg58 <= wire51;
          reg59 <= (!(((^~$unsigned((8'hba))) || (wire48 <<< wire53)) ?
              reg54 : (~&wire52[(3'h5):(2'h2)])));
        end
      else
        begin
          if (wire46)
            begin
              reg56 <= (|($signed($unsigned($unsigned(reg56))) > wire51));
              reg57 <= ($signed(((~^reg57) ?
                  (^~wire51[(3'h6):(3'h5)]) : wire52)) || {$unsigned($signed((wire52 ?
                      wire49 : reg58))),
                  (wire45[(3'h4):(2'h2)] + (|(wire47 ? (8'h9f) : wire52)))});
              reg58 <= $unsigned(reg54[(2'h3):(2'h2)]);
              reg59 <= wire49;
            end
          else
            begin
              reg56 <= $signed(reg55);
              reg57 <= (-((wire46 != ($signed(wire46) & $signed((8'hb5)))) ?
                  (reg59 * (^~$signed(reg57))) : {reg55[(1'h0):(1'h0)],
                      {reg58[(1'h1):(1'h0)], (wire46 < wire45)}}));
              reg58 <= (!(&wire51));
              reg59 <= $unsigned($unsigned({reg55[(3'h5):(1'h0)]}));
            end
          if ($unsigned(wire50[(3'h6):(2'h2)]))
            begin
              reg60 <= ($signed({$signed($signed((8'h9e)))}) ?
                  $signed((wire48 >= $unsigned($unsigned((8'hbc))))) : {(reg59[(1'h0):(1'h0)] ?
                          $unsigned($signed(reg57)) : (wire47[(1'h1):(1'h1)] ?
                              $unsigned(wire50) : $signed(reg57))),
                      {(wire51[(1'h0):(1'h0)] - (wire50 && reg58)), wire49}});
            end
          else
            begin
              reg60 <= wire47;
            end
          reg61 <= $signed(((~^$unsigned((wire51 ?
              wire48 : (8'ha9)))) || wire50));
          reg62 <= ($signed(reg59) ?
              $signed(wire50[(3'h6):(1'h0)]) : $unsigned((wire45 < ($unsigned((8'ha5)) - {wire50,
                  reg54}))));
        end
      reg63 <= $signed(($signed($unsigned(reg59[(2'h2):(2'h2)])) ?
          {wire45,
              ($unsigned(reg58) ?
                  (reg56 - reg58) : $unsigned(wire49))} : ((((8'haf) >> reg61) - {reg59}) | $unsigned($unsigned(wire52)))));
      reg64 <= wire46;
    end
  always
    @(posedge clk) begin
      reg65 <= reg57;
      reg66 <= wire46;
      reg67 <= $signed(((&(^~$signed(reg57))) ^~ $unsigned($unsigned($signed(wire47)))));
    end
  assign wire68 = ((^reg57) >= (~|(reg60 | wire50)));
endmodule

module module92
#(parameter param122 = {(((|((8'h9f) ? (8'ha5) : (8'ha7))) - (((8'hac) ? (7'h41) : (8'hb0)) ? (|(7'h41)) : ((8'ha5) & (8'ha3)))) > ((~^((8'hac) ? (8'hb8) : (8'hbb))) ? (|((8'ha1) == (8'had))) : ({(7'h43)} ? ((8'had) ? (8'ha6) : (8'hbf)) : ((7'h42) <= (7'h40)))))}, 
parameter param123 = (-(param122 ~^ ({{param122, param122}} ~^ param122))))
(y, clk, wire97, wire96, wire95, wire94, wire93);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire97;
  input wire signed [(2'h2):(1'h0)] wire96;
  input wire [(3'h4):(1'h0)] wire95;
  input wire signed [(4'he):(1'h0)] wire94;
  input wire [(4'h9):(1'h0)] wire93;
  wire signed [(5'h15):(1'h0)] wire121;
  wire signed [(4'hc):(1'h0)] wire120;
  wire signed [(2'h2):(1'h0)] wire119;
  wire [(2'h3):(1'h0)] wire118;
  wire [(5'h12):(1'h0)] wire117;
  wire signed [(2'h3):(1'h0)] wire116;
  wire signed [(4'hd):(1'h0)] wire110;
  wire signed [(5'h15):(1'h0)] wire109;
  wire signed [(4'ha):(1'h0)] wire108;
  wire [(5'h14):(1'h0)] wire107;
  wire [(3'h5):(1'h0)] wire100;
  wire [(3'h7):(1'h0)] wire99;
  wire signed [(4'hb):(1'h0)] wire98;
  reg [(4'h9):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg114 = (1'h0);
  reg [(5'h11):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg112 = (1'h0);
  reg [(4'h9):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg104 = (1'h0);
  reg [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire100,
                 wire99,
                 wire98,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 (1'h0)};
  assign wire98 = ($unsigned((7'h42)) ?
                      $unsigned($unsigned(((+wire97) >> (~|wire97)))) : (wire96 << wire97[(1'h0):(1'h0)]));
  assign wire99 = $unsigned({wire97[(2'h2):(1'h0)]});
  assign wire100 = $signed({wire93, $unsigned({(wire96 ? wire98 : wire99)})});
  always
    @(posedge clk) begin
      reg101 <= $signed(((8'hbb) << wire96));
    end
  always
    @(posedge clk) begin
      reg102 <= ((+({$signed(reg101), $signed(wire99)} ?
          (7'h43) : $signed((wire96 && wire95)))) ^ wire98[(3'h4):(2'h2)]);
      reg103 <= $signed(wire98[(2'h3):(2'h2)]);
      reg104 <= $unsigned($signed((~{(wire100 ? (8'hbc) : wire95),
          $unsigned((8'h9f))})));
      reg105 <= $unsigned({$unsigned((|$unsigned((8'hbe)))),
          ($unsigned($unsigned(reg104)) ?
              $signed({wire99, wire98}) : $signed(reg104[(1'h0):(1'h0)]))});
      reg106 <= (|$unsigned(({(reg103 ^ reg105),
          (wire93 ? (8'hb3) : (8'ha7))} <= $signed({wire94, (8'hab)}))));
    end
  assign wire107 = wire99;
  assign wire108 = (^~(reg104[(2'h3):(1'h1)] ?
                       (&$unsigned((reg106 ?
                           wire93 : reg103))) : (~($signed((8'ha2)) >>> wire97[(2'h3):(1'h0)]))));
  assign wire109 = wire97[(2'h3):(2'h2)];
  assign wire110 = ((~&(wire109 ?
                       wire94[(3'h4):(2'h2)] : $signed(wire107[(4'hf):(3'h6)]))) != {$unsigned({((8'hb6) || reg101)}),
                       $unsigned($unsigned((|wire108)))});
  always
    @(posedge clk) begin
      reg111 <= wire108[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg112 <= (((|reg102[(4'h8):(3'h5)]) <<< $unsigned($unsigned($unsigned(wire99)))) ?
          (-$unsigned((wire98 ?
              (^~wire95) : wire95[(1'h1):(1'h1)]))) : (reg102[(1'h0):(1'h0)] ?
              (!wire97) : $unsigned(wire96[(1'h0):(1'h0)])));
      reg113 <= reg103[(2'h3):(1'h0)];
      reg114 <= $signed({$unsigned(wire109[(5'h10):(3'h4)]),
          reg104[(2'h2):(2'h2)]});
      reg115 <= $signed(wire95[(2'h2):(1'h0)]);
    end
  assign wire116 = $unsigned($signed((-(reg106[(2'h2):(2'h2)] + reg115[(3'h7):(2'h2)]))));
  assign wire117 = (|reg106[(4'hc):(4'hc)]);
  assign wire118 = {reg105};
  assign wire119 = (^~$unsigned(reg115));
  assign wire120 = $unsigned({(8'hb5), $signed($unsigned({wire116, reg103}))});
  assign wire121 = {$signed(wire108), wire110};
endmodule
