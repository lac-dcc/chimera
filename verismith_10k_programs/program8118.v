module top
#(parameter param154 = (((({(8'hbd), (8'hb4)} ? (~(8'hbe)) : ((8'hb5) - (8'hbe))) >>> ({(8'h9f)} ? (~^(8'ha0)) : (-(8'ha6)))) ? {(-(~^(8'ha4))), {((8'hb4) && (8'hbe))}} : ((^~{(7'h44), (8'ha9)}) ? ((8'hb3) > {(8'h9e)}) : (|(^~(8'hbe))))) != ({(8'hb4)} | (-(^((8'h9c) * (8'ha8)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire153;
  wire [(4'hc):(1'h0)] wire152;
  wire signed [(4'hb):(1'h0)] wire151;
  wire [(3'h5):(1'h0)] wire150;
  wire signed [(2'h3):(1'h0)] wire149;
  wire [(5'h15):(1'h0)] wire148;
  wire [(5'h13):(1'h0)] wire147;
  wire [(4'hc):(1'h0)] wire146;
  wire signed [(4'hf):(1'h0)] wire145;
  wire signed [(3'h6):(1'h0)] wire144;
  wire [(5'h11):(1'h0)] wire143;
  wire signed [(2'h3):(1'h0)] wire141;
  wire [(5'h14):(1'h0)] wire140;
  wire signed [(3'h7):(1'h0)] wire131;
  wire [(4'he):(1'h0)] wire130;
  wire [(5'h13):(1'h0)] wire127;
  wire signed [(4'hc):(1'h0)] wire126;
  wire signed [(4'hc):(1'h0)] wire125;
  wire signed [(4'ha):(1'h0)] wire123;
  wire signed [(4'hf):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg139 = (1'h0);
  reg [(5'h11):(1'h0)] reg138 = (1'h0);
  reg [(4'hf):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg136 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg128 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire141,
                 wire140,
                 wire131,
                 wire130,
                 wire127,
                 wire126,
                 wire125,
                 wire123,
                 wire5,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg129,
                 reg128,
                 (1'h0)};
  assign wire5 = (wire2[(1'h0):(1'h0)] + wire2);
  module6 #() modinst124 (wire123, clk, wire1, wire0, wire4, wire3);
  assign wire125 = {wire1[(4'hf):(4'hf)]};
  assign wire126 = (|{(($signed(wire125) < ((8'h9f) > wire0)) ?
                           wire123 : (~&(8'hb9)))});
  assign wire127 = (($unsigned((8'h9c)) < wire123) - $unsigned({(wire2 == wire125),
                       wire5[(1'h1):(1'h0)]}));
  always
    @(posedge clk) begin
      reg128 <= $unsigned(wire125[(3'h6):(3'h4)]);
      reg129 <= ({wire3[(1'h1):(1'h0)]} & (reg128 ?
          (+$unsigned(wire2)) : (!wire3)));
    end
  assign wire130 = wire125;
  assign wire131 = (wire1[(3'h7):(3'h4)] || wire126[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      if ((-{wire127}))
        begin
          reg132 <= ($unsigned(($signed($signed((8'hba))) >>> $signed(reg129))) ?
              ({wire130,
                  ($unsigned(wire3) & $signed(wire0))} >>> ((8'hbf) + ($signed(wire123) ?
                  (^~wire0) : ((8'ha2) && wire123)))) : (($unsigned($unsigned(wire123)) ?
                      ((wire130 & wire1) && $unsigned(wire131)) : reg129[(3'h4):(3'h4)]) ?
                  ($signed(((8'h9e) ? wire5 : (8'hbf))) ?
                      (wire131 ?
                          ((8'hbf) < (8'hb9)) : (wire2 ?
                              reg128 : wire3)) : $unsigned((wire4 ?
                          wire3 : reg128))) : wire123[(3'h4):(2'h2)]));
          reg133 <= wire3;
          reg134 <= (^$signed((wire1[(4'hd):(3'h5)] >>> ((!wire127) || reg129))));
        end
      else
        begin
          reg132 <= (^~{wire4[(3'h6):(3'h5)]});
          if ((wire2[(3'h4):(2'h2)] >= (reg132 ?
              (((wire0 ? wire126 : wire123) ?
                  reg129[(1'h1):(1'h1)] : wire123) > $unsigned($unsigned(wire5))) : wire3)))
            begin
              reg133 <= {$signed((($signed(wire127) || (8'h9d)) ?
                      {wire125, $signed((8'hb5))} : wire123[(3'h4):(1'h0)])),
                  wire131};
              reg134 <= (reg128 ? wire3 : (&wire123));
              reg135 <= reg129[(1'h0):(1'h0)];
              reg136 <= ((~&$signed(reg134)) ?
                  ((wire3[(4'ha):(3'h6)] * wire4[(4'hf):(3'h5)]) >> $signed(((^wire5) < $signed(wire127)))) : (wire3[(5'h10):(5'h10)] * $unsigned($unsigned((reg133 > wire5)))));
            end
          else
            begin
              reg133 <= {wire0[(1'h0):(1'h0)]};
              reg134 <= reg133;
              reg135 <= wire4;
            end
        end
      reg137 <= $signed(((($signed(reg135) > (reg134 - reg136)) && $signed(wire126[(2'h2):(1'h0)])) ?
          (((^wire127) ? (wire127 ^~ wire127) : reg136[(4'h8):(3'h6)]) ?
              reg128 : (8'hb9)) : $unsigned(wire1)));
      reg138 <= $signed((+$unsigned(wire4[(2'h2):(2'h2)])));
      reg139 <= (($signed((~|(wire131 >= wire2))) - $signed((wire4[(4'ha):(2'h3)] != (+(8'ha0))))) <<< wire4);
    end
  assign wire140 = reg133;
  module75 #() modinst142 (wire141, clk, reg139, wire5, wire126, reg137);
  assign wire143 = ((reg128[(4'h8):(4'h8)] ?
                       $unsigned($signed($unsigned(wire141))) : reg133) | (($unsigned((wire4 ?
                       wire140 : wire141)) >= reg138[(4'ha):(3'h4)]) ^~ reg128[(1'h1):(1'h0)]));
  assign wire144 = reg133;
  assign wire145 = wire2;
  assign wire146 = wire125;
  assign wire147 = (&$unsigned($unsigned(wire123)));
  assign wire148 = $signed(wire130);
  assign wire149 = ($unsigned({{(wire123 >= reg136)}}) != (~&$signed({(~|wire127)})));
  assign wire150 = wire141;
  assign wire151 = ((~&wire145[(4'ha):(1'h0)]) >= (|(&(~&wire2[(3'h4):(1'h0)]))));
  assign wire152 = reg135[(1'h0):(1'h0)];
  assign wire153 = wire125;
endmodule

module module6
#(parameter param121 = ((&(({(8'hae), (8'hbd)} ? (!(7'h42)) : ((8'hbc) < (8'haf))) && (((8'ha8) >>> (7'h43)) > (-(7'h41))))) * {((^~(~|(8'haf))) == (^~((8'hab) < (8'hb4)))), (~^(~&{(8'ha2)}))}), 
parameter param122 = param121)
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire [(3'h6):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire120;
  wire signed [(5'h14):(1'h0)] wire118;
  wire [(4'h9):(1'h0)] wire94;
  wire signed [(4'h9):(1'h0)] wire92;
  wire signed [(5'h14):(1'h0)] wire91;
  wire signed [(5'h12):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire72;
  wire signed [(3'h5):(1'h0)] wire74;
  wire signed [(4'he):(1'h0)] wire89;
  reg [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(4'he):(1'h0)] reg97 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg99 = (1'h0);
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg106 = (1'h0);
  assign y = {wire120,
                 wire118,
                 wire94,
                 wire92,
                 wire91,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire25,
                 wire27,
                 wire69,
                 wire71,
                 wire72,
                 wire74,
                 wire89,
                 reg73,
                 reg93,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 (1'h0)};
  assign wire11 = (8'hbb);
  assign wire12 = ({wire11} ?
                      {{({wire7, wire7} ?
                                  {wire9, wire8} : (wire8 ? wire8 : wire7)),
                              $unsigned(wire9)},
                          wire7[(4'h9):(3'h4)]} : wire10[(4'h8):(2'h2)]);
  assign wire13 = $signed(((((+wire7) + wire8[(3'h4):(2'h2)]) + ((wire8 && wire7) ?
                          (wire8 ^~ wire8) : ((7'h44) ? wire7 : wire7))) ?
                      (!((wire12 ? wire7 : wire9) ?
                          wire10 : $signed((8'hb8)))) : (~^$unsigned(wire8))));
  assign wire14 = $unsigned($signed($unsigned((&(wire11 <<< wire13)))));
  assign wire15 = (((^wire8[(3'h5):(2'h2)]) >> {{$signed(wire9)},
                          (~^(wire8 ? wire9 : (8'hb8)))}) ?
                      (($unsigned($unsigned((8'ha5))) ?
                          wire10[(2'h2):(2'h2)] : wire12) ~^ wire12) : (&$unsigned(wire14[(3'h4):(1'h0)])));
  module16 #() modinst26 (wire25, clk, wire12, wire7, wire9, wire11);
  assign wire27 = $signed(($signed($signed($signed(wire9))) > wire15[(2'h3):(2'h2)]));
  module28 #() modinst70 (wire69, clk, wire27, wire25, wire14, wire9);
  assign wire71 = {(wire9[(4'hc):(3'h6)] ?
                          $unsigned((!$signed(wire14))) : wire15),
                      $signed($signed(wire7[(3'h6):(1'h1)]))};
  assign wire72 = ($signed(wire25[(4'ha):(3'h7)]) >>> wire8);
  always
    @(posedge clk) begin
      reg73 <= wire7[(4'hc):(1'h0)];
    end
  assign wire74 = wire9[(5'h10):(4'h9)];
  module75 #() modinst90 (.wire78(wire7), .wire77(wire25), .wire79(wire72), .clk(clk), .y(wire89), .wire76(reg73));
  assign wire91 = (^$signed(wire89));
  assign wire92 = {((~wire91[(4'hf):(3'h6)]) ?
                          $unsigned(wire11) : wire27[(2'h3):(2'h3)]),
                      (!$signed({wire13}))};
  always
    @(posedge clk) begin
      reg93 <= {($unsigned((wire25 <= (wire14 > wire72))) ?
              $signed($unsigned($signed(wire91))) : ($signed($unsigned(wire25)) | $signed((wire11 <<< wire25)))),
          (^wire8)};
    end
  assign wire94 = ($signed($unsigned($unsigned((wire91 < wire10)))) >> (~|$signed(({(8'hbc)} ?
                      wire27 : (~^wire14)))));
  always
    @(posedge clk) begin
      if ($unsigned(((wire92 || ((wire27 ? wire11 : wire71) ?
          $unsigned(wire13) : wire15)) < (~^wire15))))
        begin
          reg95 <= {wire12[(2'h2):(1'h0)]};
          if ($unsigned(((((wire9 > (7'h41)) ~^ (wire8 ?
              (8'hb1) : wire10)) >= (~^wire27)) ~^ $signed((|(~^wire89))))))
            begin
              reg96 <= (8'haa);
              reg97 <= $unsigned(reg73);
              reg98 <= wire14[(4'hc):(3'h6)];
              reg99 <= {reg98[(4'hb):(4'hb)],
                  $signed((~&($signed(wire14) ? $unsigned(wire94) : reg95)))};
              reg100 <= (+reg73);
            end
          else
            begin
              reg96 <= (wire11 & reg100);
              reg97 <= $signed(($signed(reg93) | $signed((8'ha8))));
              reg98 <= $signed($unsigned($unsigned(($signed(wire69) ?
                  {reg97, reg99} : (wire74 ^~ reg93)))));
            end
          reg101 <= {((8'ha2) ?
                  (+reg93) : (!({wire69} ?
                      (wire13 ? wire89 : wire92) : (reg93 ? wire10 : reg93))))};
          reg102 <= $unsigned((~&{wire94, (&wire91)}));
        end
      else
        begin
          reg95 <= (reg98[(2'h3):(2'h3)] ?
              (reg102 ?
                  (reg97[(1'h0):(1'h0)] <<< ((reg101 <<< wire94) & (reg98 == (8'haf)))) : wire72) : reg101[(4'hb):(3'h7)]);
        end
      reg103 <= ((^(~&$signed(reg93))) | (^~($signed((~wire74)) << (^~$signed(reg93)))));
      reg104 <= wire89;
      reg105 <= reg100;
      reg106 <= wire25;
    end
  module107 #() modinst119 (.wire110(wire11), .clk(clk), .y(wire118), .wire108(wire89), .wire109(reg101), .wire112(wire12), .wire111(wire7));
  assign wire120 = $unsigned(((~&wire94[(1'h0):(1'h0)]) ?
                       $unsigned((&(wire27 ?
                           wire25 : reg102))) : (wire11 > $signed(reg104[(3'h5):(1'h1)]))));
endmodule

module module107
#(parameter param117 = (|((~&(((8'ha8) >= (8'ha0)) - ((8'hbb) == (7'h44)))) + {{{(8'ha7)}, ((8'hbf) >> (8'hb4))}, ((8'hbc) >> (|(8'hb9)))})))
(y, clk, wire112, wire111, wire110, wire109, wire108);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire112;
  input wire [(4'ha):(1'h0)] wire111;
  input wire signed [(3'h4):(1'h0)] wire110;
  input wire signed [(4'h9):(1'h0)] wire109;
  input wire signed [(4'he):(1'h0)] wire108;
  wire [(3'h4):(1'h0)] wire116;
  wire [(4'ha):(1'h0)] wire115;
  wire signed [(5'h14):(1'h0)] wire114;
  wire signed [(5'h10):(1'h0)] wire113;
  assign y = {wire116, wire115, wire114, wire113, (1'h0)};
  assign wire113 = wire111[(4'ha):(3'h4)];
  assign wire114 = (wire109 << ((wire109[(2'h3):(2'h3)] | wire112) <= (~^($signed(wire109) || ((8'hbf) ?
                       wire110 : wire111)))));
  assign wire115 = $unsigned(wire111);
  assign wire116 = {(~(8'hb1)), $signed($signed(wire112))};
endmodule

module module75
#(parameter param87 = ((8'hb9) ? ((8'ha2) && (((&(8'haf)) < ((8'hb6) & (8'hac))) << ((~(8'hbc)) ? {(8'hb1)} : ((8'hbc) ? (8'hb5) : (8'hbc))))) : ((-(|((8'hbd) ~^ (8'ha7)))) != (((^~(8'ha3)) ? (8'hb6) : ((7'h42) ? (8'h9c) : (8'hb1))) ? ((~(8'hba)) ? ((8'hba) > (8'ha1)) : ((8'hac) < (8'hbf))) : (((8'had) <<< (7'h42)) >>> (&(8'hb7)))))), 
parameter param88 = (param87 ? ({((~^(8'hac)) ? (param87 ^~ param87) : (param87 | param87)), (((8'hbe) ? (8'haa) : param87) >>> param87)} < param87) : (~^(|((param87 & param87) | param87)))))
(y, clk, wire79, wire78, wire77, wire76);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire79;
  input wire [(4'hf):(1'h0)] wire78;
  input wire [(4'hc):(1'h0)] wire77;
  input wire signed [(4'h9):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire85;
  wire [(3'h6):(1'h0)] wire84;
  wire [(4'h9):(1'h0)] wire83;
  wire [(3'h7):(1'h0)] wire82;
  wire signed [(3'h6):(1'h0)] wire81;
  wire signed [(2'h2):(1'h0)] wire80;
  assign y = {wire86, wire85, wire84, wire83, wire82, wire81, wire80, (1'h0)};
  assign wire80 = (|($signed(wire78) ?
                      (^wire78[(3'h6):(2'h2)]) : (^~((wire76 ?
                              (7'h40) : wire76) ?
                          $signed(wire79) : {(8'hbb), wire76}))));
  assign wire81 = ($signed(wire80) ?
                      wire76[(3'h7):(2'h2)] : wire78[(4'hf):(3'h7)]);
  assign wire82 = (8'hb1);
  assign wire83 = wire81;
  assign wire84 = ((|(-(+wire81))) <<< {(8'h9f)});
  assign wire85 = $signed({($signed(wire82) || $unsigned($unsigned(wire84)))});
  assign wire86 = wire80;
endmodule

module module28  (y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h19d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire32;
  input wire signed [(4'h9):(1'h0)] wire31;
  input wire [(3'h5):(1'h0)] wire30;
  input wire [(4'hd):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire62;
  wire signed [(4'ha):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire46;
  wire [(4'h9):(1'h0)] wire33;
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(5'h10):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire33,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
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
                 (1'h0)};
  assign wire33 = wire30[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg34 <= (((|wire31[(2'h2):(1'h1)]) ?
              (((|wire33) ?
                  wire33 : wire30) < (~^wire33[(1'h1):(1'h0)])) : ($unsigned(wire31) + ((+wire29) ?
                  (wire29 ^~ wire33) : {wire29, wire30}))) ?
          wire29 : (wire33 ?
              $signed(wire29[(1'h1):(1'h0)]) : ($signed($signed((8'ha0))) ?
                  $signed((wire32 ? wire32 : (8'hb8))) : (wire32 ?
                      wire31[(4'h8):(3'h5)] : (wire31 ? wire31 : wire32)))));
      reg35 <= (($unsigned($signed($signed((8'ha8)))) + {wire31,
          wire32[(2'h2):(1'h1)]}) && reg34[(3'h5):(1'h1)]);
      if ((wire30[(2'h3):(1'h0)] ~^ reg35[(1'h0):(1'h0)]))
        begin
          reg36 <= $signed($signed((wire33 ?
              {reg34} : {(reg34 << reg34), reg34[(2'h2):(1'h1)]})));
          reg37 <= wire31;
          reg38 <= reg37[(3'h6):(3'h6)];
          reg39 <= reg36;
          if ($signed($signed((((^~reg36) ?
              {reg36, (8'ha9)} : ((8'haf) ?
                  reg37 : reg36)) <= (+$signed(reg37))))))
            begin
              reg40 <= {$signed((~^(~&(~(7'h41)))))};
            end
          else
            begin
              reg40 <= {wire29,
                  (reg38 <<< $unsigned($unsigned($unsigned(reg37))))};
              reg41 <= (reg38[(3'h7):(3'h6)] <<< ((reg39 | ((reg36 ?
                  wire31 : reg34) && $signed(reg40))) ^~ {$signed({wire30,
                      reg34})}));
              reg42 <= (&$unsigned(({$signed((7'h41)), $signed(reg38)} ?
                  reg41 : (reg41 != reg36[(1'h0):(1'h0)]))));
              reg43 <= $signed(reg36);
              reg44 <= wire29;
            end
        end
      else
        begin
          reg36 <= ((!wire33) ? wire29 : reg34[(1'h1):(1'h0)]);
        end
      reg45 <= ($signed($signed(({(8'ha5), wire32} <<< (^~(8'ha9))))) ?
          $unsigned({(reg40[(3'h5):(3'h4)] ? (8'ha4) : wire33[(2'h3):(2'h2)]),
              reg37}) : (!($unsigned((-wire31)) & ($unsigned(reg44) >> reg36))));
    end
  assign wire46 = reg37;
  assign wire47 = ((wire46 ?
                          $signed((+reg45[(4'h8):(1'h0)])) : wire30[(3'h4):(2'h2)]) ?
                      reg40 : $signed(($signed((reg41 + reg41)) != ((wire33 ?
                              reg36 : reg37) ?
                          (reg43 ? reg37 : reg41) : (~(8'hb5))))));
  assign wire48 = $unsigned((~&$signed(reg43[(3'h4):(2'h2)])));
  assign wire49 = (~|($signed(reg42[(1'h1):(1'h1)]) + wire29[(3'h4):(2'h3)]));
  always
    @(posedge clk) begin
      reg50 <= reg38;
      if ({reg38[(1'h1):(1'h0)],
          $signed($signed(((wire33 ? (8'ha6) : reg43) ?
              (reg35 ? wire48 : (7'h43)) : (wire29 <<< wire29))))})
        begin
          reg51 <= $signed(reg40[(3'h7):(2'h2)]);
          if ((8'ha0))
            begin
              reg52 <= ({wire46, (|reg41)} >>> reg50);
              reg53 <= ((wire48[(1'h0):(1'h0)] || {$unsigned((reg52 ?
                      reg35 : wire33)),
                  $signed((reg50 ^ reg42))}) < wire30);
              reg54 <= {wire30[(1'h0):(1'h0)], reg44[(3'h4):(2'h3)]};
              reg55 <= ($unsigned({reg36[(1'h1):(1'h0)],
                  ({reg51} >>> $signed(reg41))}) | $signed(($unsigned((+wire47)) ?
                  reg37[(2'h2):(1'h0)] : ((^wire32) ?
                      (reg50 ? reg52 : reg41) : $unsigned(reg50)))));
              reg56 <= $unsigned(reg41[(3'h4):(1'h1)]);
            end
          else
            begin
              reg52 <= $signed((reg45 >>> $unsigned(wire29)));
              reg53 <= wire48;
              reg54 <= wire32;
              reg55 <= reg39[(4'hc):(2'h2)];
            end
          reg57 <= {reg55[(1'h0):(1'h0)]};
          reg58 <= (&reg35);
          reg59 <= reg34[(1'h0):(1'h0)];
        end
      else
        begin
          reg51 <= wire49;
          reg52 <= (~|(reg50 * $signed((~|(wire33 ? reg58 : wire46)))));
          reg53 <= {($unsigned(reg52) == ((8'ha2) ?
                  (~|(reg37 << reg39)) : $unsigned((reg51 <= reg50))))};
        end
    end
  assign wire60 = wire33;
  assign wire61 = (wire49 ?
                      (+(($unsigned((8'ha9)) ?
                              $unsigned(wire60) : reg36[(1'h1):(1'h1)]) ?
                          $signed(wire46) : {$unsigned(reg44),
                              $signed((7'h44))})) : $unsigned($signed(reg57)));
  assign wire62 = reg50;
  always
    @(posedge clk) begin
      if (({((reg53 ?
                  wire46[(1'h0):(1'h0)] : $unsigned((8'haa))) ^ (reg55 * $signed(reg34))),
              {reg40}} ?
          reg57[(3'h5):(1'h1)] : (reg56 & (~&$signed((~(8'haa)))))))
        begin
          reg63 <= (^(^$unsigned((((8'hb0) & reg50) ?
              $signed(wire60) : wire47[(1'h1):(1'h1)]))));
        end
      else
        begin
          reg63 <= wire30[(3'h5):(1'h0)];
        end
      reg64 <= ((&{(reg57[(3'h5):(3'h4)] * $signed((8'ha8))),
          $unsigned((wire29 ?
              reg36 : reg43))}) & (reg42[(1'h1):(1'h0)] == $unsigned((!(wire32 ?
          reg58 : reg52)))));
      if (($unsigned(reg44) ?
          reg54 : ((8'hbd) ?
              ((~^reg42) ?
                  wire48[(3'h4):(1'h1)] : ((wire47 || reg54) ?
                      (reg44 < reg39) : (^(8'h9d)))) : $unsigned($signed((reg39 ?
                  reg55 : reg58))))))
        begin
          reg65 <= ((reg44 || (8'hb3)) << $signed((|(8'hbb))));
          reg66 <= $unsigned((((|(8'hb1)) ?
              $unsigned((reg39 ?
                  reg54 : reg52)) : wire60) - (-$unsigned((reg51 ?
              reg36 : reg64)))));
        end
      else
        begin
          reg65 <= $unsigned(reg55);
        end
      reg67 <= {(~&((!$signed(reg50)) | ($unsigned(wire60) <= $signed(reg34))))};
      reg68 <= $unsigned(((($signed(reg54) << wire48[(4'hb):(4'h8)]) ?
              $unsigned($signed(wire48)) : $signed((wire32 >>> (8'hbd)))) ?
          (reg50[(4'hb):(4'h8)] == reg35[(2'h3):(1'h1)]) : ($unsigned(((8'ha0) * reg39)) == reg64)));
    end
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire20;
  input wire [(3'h6):(1'h0)] wire19;
  input wire signed [(4'hc):(1'h0)] wire18;
  input wire [(5'h12):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  assign y = {wire24, wire22, wire21, reg23, (1'h0)};
  assign wire21 = (~^$unsigned($signed((wire20[(3'h6):(3'h4)] ?
                      (wire20 == wire18) : (wire19 ^~ wire17)))));
  assign wire22 = (|$signed(wire18[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg23 <= wire21[(5'h12):(4'hc)];
    end
  assign wire24 = ($signed($signed(reg23)) ?
                      $signed($signed(($signed(wire21) << (^~(8'ha9))))) : {wire20});
endmodule
