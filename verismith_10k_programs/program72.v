module top
#(parameter param146 = {(~|(+{((8'ha7) > (8'hb1)), ((8'hb9) ? (8'hb0) : (8'hb4))})), (((8'ha1) + ((~(8'hab)) == {(8'hae), (8'hba)})) || (&((+(8'ha2)) & ((8'hb6) ? (8'ha5) : (8'ha3)))))}, 
parameter param147 = (~^((~((param146 ? param146 : param146) ? param146 : param146)) <<< ((&(param146 ~^ param146)) ? (param146 ? param146 : (param146 ? param146 : param146)) : (param146 << {param146, param146})))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h14e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire141;
  wire [(3'h7):(1'h0)] wire140;
  wire [(3'h4):(1'h0)] wire128;
  wire [(3'h5):(1'h0)] wire127;
  wire signed [(4'hd):(1'h0)] wire125;
  wire signed [(4'h9):(1'h0)] wire123;
  wire signed [(5'h14):(1'h0)] wire122;
  wire signed [(3'h5):(1'h0)] wire121;
  wire [(5'h14):(1'h0)] wire120;
  wire signed [(4'hb):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire118;
  reg [(4'hd):(1'h0)] reg145 = (1'h0);
  reg [(5'h13):(1'h0)] reg144 = (1'h0);
  reg [(5'h14):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg137 = (1'h0);
  reg [(3'h6):(1'h0)] reg136 = (1'h0);
  reg [(4'hc):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg133 = (1'h0);
  reg [(3'h5):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg129 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire128,
                 wire127,
                 wire125,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire4,
                 wire24,
                 wire118,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 (1'h0)};
  assign wire4 = $signed($unsigned(wire2));
  module5 #() modinst25 (.wire7(wire2), .wire8(wire0), .y(wire24), .wire6(wire1), .clk(clk), .wire9(wire3));
  module26 #() modinst119 (.y(wire118), .wire29(wire0), .wire30(wire1), .wire27(wire3), .wire31(wire24), .clk(clk), .wire28(wire2));
  assign wire120 = {({wire24,
                               (wire2[(4'he):(4'ha)] ?
                                   $unsigned(wire1) : wire24)} ?
                           wire2 : (&{(wire118 ? wire2 : wire0)}))};
  assign wire121 = wire118;
  assign wire122 = wire121[(3'h5):(2'h2)];
  module43 #() modinst124 (.wire46(wire1), .wire47(wire118), .wire45(wire3), .y(wire123), .clk(clk), .wire44(wire120));
  module43 #() modinst126 (.y(wire125), .clk(clk), .wire44(wire120), .wire46(wire4), .wire45(wire123), .wire47(wire0));
  assign wire127 = $unsigned($signed({wire121, wire120[(3'h6):(3'h5)]}));
  assign wire128 = wire4[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg129 <= $signed((8'hb3));
      reg130 <= (8'had);
      reg131 <= $unsigned((8'hbc));
      if (wire128)
        begin
          reg132 <= wire4;
        end
      else
        begin
          reg132 <= (8'ha9);
          reg133 <= $signed((!wire128));
          reg134 <= ($signed(wire1[(4'hc):(3'h5)]) ?
              wire125[(3'h7):(3'h6)] : ((~^$unsigned($unsigned((8'hbc)))) ?
                  (((wire118 + (8'hae)) ? $signed(wire118) : $signed(wire118)) ?
                      $signed(wire118[(4'he):(3'h5)]) : (wire24 << (~|(7'h44)))) : wire118[(4'hd):(3'h7)]));
          if ({({($signed(reg131) ? $signed(reg132) : reg133),
                  ({(7'h42),
                      reg129} + (&(8'h9c)))} | $unsigned($unsigned($signed(wire24))))})
            begin
              reg135 <= (reg132[(2'h2):(2'h2)] & (~|(reg130[(4'h9):(2'h3)] ?
                  ((&(7'h42)) ?
                      (~^wire24) : wire0[(3'h5):(1'h0)]) : ((wire122 || reg132) ?
                      $unsigned((8'ha8)) : (wire24 ? wire122 : wire0)))));
              reg136 <= $unsigned($unsigned(reg131));
            end
          else
            begin
              reg135 <= $signed((wire2 + $signed($unsigned($signed(wire3)))));
              reg136 <= (~($signed((reg130[(4'hb):(1'h0)] ^~ wire128[(2'h2):(1'h0)])) ?
                  wire122 : {$signed($signed(reg130))}));
              reg137 <= (!$signed({$unsigned((^wire3)),
                  ((wire121 >= (8'ha1)) + (wire4 ? (8'h9e) : wire121))}));
              reg138 <= ({wire122[(5'h13):(4'h8)], $signed(wire122)} ?
                  wire3[(4'h8):(3'h4)] : wire2[(4'h8):(2'h3)]);
            end
          reg139 <= ($unsigned((($unsigned(reg135) ?
                  {wire125, wire121} : wire3[(4'h9):(3'h4)]) ?
              wire0 : wire3[(3'h4):(2'h3)])) != (((wire121 > {(8'had)}) >>> (reg136[(3'h6):(2'h2)] ?
              (reg129 & reg132) : (reg137 >> wire3))) ^~ $unsigned((|(reg133 ?
              (8'ha0) : wire128)))));
        end
    end
  assign wire140 = (~|$signed((^~(wire1 ?
                       $signed(wire1) : $unsigned(wire122)))));
  assign wire141 = reg134[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg142 <= $signed((~|reg134[(2'h2):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg143 <= $signed({(&(7'h41)),
          ($signed($signed(wire121)) ~^ (reg138[(4'hf):(1'h1)] < (-reg134)))});
      reg144 <= (({$signed((wire123 ^ reg139))} ^~ reg130) || (reg135 > $signed(wire1[(4'hf):(4'hf)])));
      reg145 <= (reg137[(4'ha):(4'h9)] == wire3);
    end
endmodule

module module26
#(parameter param117 = (^~(&((~^(^~(8'hb3))) ? ((~(7'h44)) ? ((8'hb9) ? (8'hba) : (8'hbd)) : (+(8'h9e))) : (~&((8'hb8) ? (8'hb8) : (8'ha2)))))))
(y, clk, wire27, wire28, wire29, wire30, wire31);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire27;
  input wire signed [(4'h8):(1'h0)] wire28;
  input wire [(4'hd):(1'h0)] wire29;
  input wire [(5'h14):(1'h0)] wire30;
  input wire signed [(5'h13):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire116;
  wire signed [(5'h10):(1'h0)] wire115;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire70;
  wire [(4'h8):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire100;
  wire signed [(4'h9):(1'h0)] wire113;
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire32,
                 wire42,
                 wire70,
                 wire72,
                 wire100,
                 wire113,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg102,
                 reg103,
                 (1'h0)};
  assign wire32 = wire29;
  always
    @(posedge clk) begin
      reg33 <= $signed($unsigned((wire31 ?
          (&(wire27 >> wire28)) : ((wire30 ?
              wire31 : (8'h9c)) & $signed(wire32)))));
      reg34 <= $signed(reg33[(4'hc):(4'h8)]);
      if ((8'hb7))
        begin
          reg35 <= $signed(wire30[(4'hb):(4'h8)]);
          reg36 <= (8'hbb);
          reg37 <= ($unsigned((~&(~wire29))) ?
              (|wire32[(2'h2):(1'h1)]) : (~^$unsigned(reg35)));
        end
      else
        begin
          if (reg36)
            begin
              reg35 <= reg33;
              reg36 <= reg37;
            end
          else
            begin
              reg35 <= $unsigned((8'h9f));
              reg36 <= {reg34[(3'h4):(1'h1)],
                  (((reg37 || $signed(reg34)) >= reg34[(3'h4):(3'h4)]) >> {wire32[(3'h6):(2'h2)]})};
            end
          reg37 <= (8'haf);
          reg38 <= reg34;
          reg39 <= $signed((wire27[(3'h4):(1'h1)] ?
              {(!wire30[(3'h4):(1'h0)]),
                  wire32[(1'h0):(1'h0)]} : $signed(reg35)));
        end
      reg40 <= ((8'ha7) <= (((~^(!wire32)) >> $signed(wire32)) ~^ (7'h43)));
      reg41 <= reg34;
    end
  assign wire42 = {$signed((wire29[(3'h5):(2'h3)] ?
                          {$unsigned((7'h42)),
                              $signed(wire28)} : ($signed(wire32) && {reg41,
                              wire28}))),
                      reg37[(5'h11):(3'h7)]};
  module43 #() modinst71 (.clk(clk), .y(wire70), .wire45(wire42), .wire47(wire32), .wire44(wire31), .wire46(wire29));
  assign wire72 = ($signed((~&{(wire28 ? wire31 : reg40)})) ?
                      ({$unsigned($unsigned(wire28)),
                          {$signed(reg33),
                              wire27[(2'h3):(2'h2)]}} <<< $signed(wire30[(5'h13):(5'h13)])) : (wire42[(1'h1):(1'h0)] ?
                          $signed($unsigned((reg39 ?
                              reg41 : reg37))) : (8'h9d)));
  module73 #() modinst101 (.wire74(reg37), .wire77(reg38), .wire75(wire31), .wire76(wire29), .clk(clk), .y(wire100));
  always
    @(posedge clk) begin
      reg102 <= wire28;
      reg103 <= $signed($signed(($signed((reg40 == wire72)) ?
          (wire42[(3'h6):(1'h1)] ~^ (reg34 ?
              reg37 : (8'hbc))) : (~^(|wire70)))));
    end
  module104 #() modinst114 (.wire105(wire29), .wire107(wire42), .y(wire113), .wire108(wire30), .clk(clk), .wire106(reg36));
  assign wire115 = ($unsigned((reg34[(2'h3):(2'h3)] != $signed((~&reg33)))) <= $signed($signed((~$signed(wire100)))));
  assign wire116 = (~&((~^$unsigned(wire30[(5'h14):(4'hd)])) ^ reg35));
endmodule

module module5
#(parameter param23 = (~(|(^(-(&(8'hb9)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire9;
  input wire signed [(2'h2):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire16;
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= (8'ha5);
      if ((wire7 ?
          {(wire6 != (((8'ha6) ? wire8 : wire8) - (wire8 ? wire9 : wire7))),
              (+(|(~wire9)))} : (8'ha9)))
        begin
          reg11 <= $signed(wire7);
          reg12 <= (-({(wire7[(2'h2):(1'h1)] ? $unsigned((8'hb3)) : (8'ha6)),
                  $unsigned($signed(reg10))} ?
              {wire7} : wire6[(3'h5):(3'h4)]));
          reg13 <= (!reg11);
          reg14 <= {$signed((wire9[(2'h2):(2'h2)] || $unsigned((wire6 ?
                  reg10 : wire9))))};
        end
      else
        begin
          reg11 <= reg11[(3'h4):(1'h1)];
          reg12 <= (8'ha9);
          reg13 <= wire9;
          reg14 <= (^~(~|(($signed(reg12) ?
              reg13[(4'ha):(3'h7)] : reg12) <= (^(reg10 > reg11)))));
          reg15 <= reg11[(1'h0):(1'h0)];
        end
    end
  assign wire16 = reg14[(1'h0):(1'h0)];
  assign wire17 = reg11;
  assign wire18 = ($signed($signed(($signed(wire6) ^ $unsigned(reg15)))) || (reg10 <= reg10[(5'h10):(5'h10)]));
  assign wire19 = reg12;
  assign wire20 = {reg13[(4'hd):(4'h8)]};
  assign wire21 = $unsigned(wire20[(2'h3):(1'h1)]);
  assign wire22 = wire8;
endmodule

module module104  (y, clk, wire108, wire107, wire106, wire105);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire108;
  input wire [(5'h10):(1'h0)] wire107;
  input wire [(3'h5):(1'h0)] wire106;
  input wire signed [(4'hd):(1'h0)] wire105;
  wire signed [(4'hc):(1'h0)] wire112;
  wire signed [(2'h3):(1'h0)] wire111;
  wire [(5'h13):(1'h0)] wire110;
  wire [(4'h9):(1'h0)] wire109;
  assign y = {wire112, wire111, wire110, wire109, (1'h0)};
  assign wire109 = $signed(wire106[(1'h1):(1'h1)]);
  assign wire110 = {(&((wire107[(1'h0):(1'h0)] ?
                               $signed(wire108) : wire109[(4'h8):(1'h1)]) ?
                           (wire108 ?
                               (wire106 - wire106) : wire107) : (~|$unsigned(wire105)))),
                       (!$unsigned({((8'hae) ? wire108 : (8'hbd))}))};
  assign wire111 = $signed($signed(wire109));
  assign wire112 = $unsigned(wire110[(5'h11):(3'h6)]);
endmodule

module module73
#(parameter param98 = ((~(({(8'hbf), (8'hab)} & ((8'ha4) ? (8'hae) : (8'hbe))) ? (((8'hb6) ? (8'ha7) : (8'hb7)) ? ((8'had) > (8'hb0)) : (&(8'hbe))) : (!{(7'h42), (8'hb4)}))) ? ((({(8'hab)} ? ((8'ha9) || (8'hb7)) : ((8'ha7) | (8'h9c))) ? ((~|(8'hb0)) ? {(8'hb7), (8'hb1)} : ((8'ha2) ? (8'h9c) : (8'hb7))) : (~&((8'ha6) || (8'hba)))) ? (~(|(8'haf))) : {(((8'haa) == (7'h43)) ? ((8'hbd) ? (8'hba) : (8'ha7)) : ((8'hb8) > (8'h9f)))}) : (!{(((8'hbb) <<< (8'hbc)) >> (~^(8'ha3))), ((~^(8'ha3)) != (8'hb0))})), 
parameter param99 = {(param98 ^ (^(|param98)))})
(y, clk, wire77, wire76, wire75, wire74);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire77;
  input wire signed [(3'h4):(1'h0)] wire76;
  input wire [(4'hf):(1'h0)] wire75;
  input wire signed [(2'h3):(1'h0)] wire74;
  wire [(4'ha):(1'h0)] wire97;
  wire [(4'hb):(1'h0)] wire96;
  wire [(2'h2):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire78;
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg93 = (1'h0);
  reg [(4'hf):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(4'hd):(1'h0)] reg88 = (1'h0);
  reg [(4'h9):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg82 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg81 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire80,
                 wire79,
                 wire78,
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
  assign wire78 = {$signed(((8'hae) & {(~^wire77)})),
                      ($signed(((^~wire74) && (wire76 ?
                          (8'hb5) : wire76))) || wire76[(1'h0):(1'h0)])};
  assign wire79 = (wire74 || $unsigned((($unsigned(wire78) >> (wire78 ?
                          (8'hbc) : wire77)) ?
                      $signed((wire77 ?
                          wire76 : wire74)) : (^~(wire76 | wire78)))));
  assign wire80 = (|(((!(wire79 ? wire78 : wire74)) >>> {wire78}) ?
                      (!wire75) : {$unsigned($unsigned(wire77)),
                          (wire77 <<< (7'h43))}));
  always
    @(posedge clk) begin
      reg81 <= (&(8'hb4));
      reg82 <= ($unsigned($unsigned((~(reg81 < wire78)))) <<< $unsigned($unsigned((wire76[(1'h0):(1'h0)] ?
          wire79[(2'h2):(1'h1)] : (reg81 ? wire75 : wire79)))));
      reg83 <= (reg81[(2'h2):(1'h1)] ?
          (8'had) : $unsigned(((8'hac) ?
              (~^$unsigned(wire80)) : wire79[(2'h3):(2'h2)])));
      reg84 <= reg83[(3'h6):(3'h6)];
    end
  always
    @(posedge clk) begin
      reg85 <= {($unsigned((reg82[(2'h2):(1'h0)] != wire76[(3'h4):(3'h4)])) ^~ ({(reg84 ?
                      wire80 : wire78),
                  wire80[(1'h1):(1'h1)]} ?
              wire77[(4'h9):(2'h2)] : reg81[(3'h4):(3'h4)])),
          {($signed($signed(reg84)) << (^(wire78 ^ wire77)))}};
      reg86 <= $unsigned($signed($unsigned((((8'hb3) || wire77) - wire79))));
      reg87 <= $signed($signed(({(reg82 | reg83), (+wire79)} ?
          reg86 : (^(&wire79)))));
      if (reg81)
        begin
          reg88 <= (~((reg87 <= wire74) | (($signed((8'haf)) ?
              $unsigned((8'h9e)) : (wire77 ? wire77 : reg86)) - ((~^wire78) ?
              (~|reg86) : $signed(wire75)))));
          reg89 <= wire77;
        end
      else
        begin
          reg88 <= wire74;
          reg89 <= $unsigned((8'hac));
          reg90 <= {$signed(reg88),
              ((wire78[(3'h7):(2'h2)] >= $signed(wire74[(1'h0):(1'h0)])) != (+$signed(reg87[(3'h4):(3'h4)])))};
          if (reg85[(2'h3):(2'h3)])
            begin
              reg91 <= reg84[(4'h9):(3'h5)];
              reg92 <= {reg90[(1'h1):(1'h1)]};
              reg93 <= ($unsigned({($signed(reg81) ?
                      (wire80 ? (8'hb2) : reg87) : (&wire80)),
                  $signed({(7'h44)})}) || $signed($unsigned(($signed((8'hb7)) ?
                  (~reg91) : reg86[(2'h3):(2'h2)]))));
            end
          else
            begin
              reg91 <= (^~($signed($signed($unsigned((8'haf)))) ^~ (((wire79 ?
                      (8'h9e) : reg84) && reg89[(4'ha):(2'h3)]) ?
                  ($unsigned((8'hb2)) << (reg92 ?
                      reg92 : wire79)) : (reg82[(3'h5):(1'h1)] >> reg93[(4'hd):(3'h5)]))));
              reg92 <= (reg93[(1'h0):(1'h0)] * reg88[(4'h9):(4'h9)]);
              reg93 <= (wire74 ?
                  $unsigned($signed((~wire75[(4'hb):(4'hb)]))) : reg89[(3'h4):(3'h4)]);
            end
          if ($unsigned(((8'hba) ?
              $unsigned({(+reg87)}) : (reg84[(3'h5):(3'h5)] ?
                  {reg90, $signed(reg88)} : reg89[(1'h1):(1'h0)]))))
            begin
              reg94 <= $signed(reg86[(4'ha):(2'h2)]);
              reg95 <= ({$unsigned($signed((reg89 ? reg83 : (8'ha1)))),
                      $signed(wire77[(4'h8):(2'h3)])} ?
                  reg91 : wire74);
            end
          else
            begin
              reg94 <= $unsigned($signed(((8'haa) ?
                  {$unsigned(wire78), $unsigned(wire78)} : ($signed((8'hbd)) ?
                      wire79[(2'h2):(2'h2)] : (reg94 && reg90)))));
            end
        end
    end
  assign wire96 = (~|((wire79[(1'h1):(1'h1)] < reg85) >= (($unsigned(reg88) || $unsigned(reg90)) ?
                      ($unsigned(reg86) > (|wire79)) : $unsigned(wire76[(1'h0):(1'h0)]))));
  assign wire97 = $signed($unsigned(($signed(((8'hb7) > wire80)) ?
                      (|(reg83 ^ wire75)) : reg88[(1'h1):(1'h0)])));
endmodule

module module43
#(parameter param68 = (-((7'h41) ? (~|((8'haf) ? ((7'h41) ? (8'hbe) : (8'had)) : ((8'ha8) ? (8'ha5) : (8'hb7)))) : (^~(((8'ha0) ? (8'h9e) : (8'hb7)) && ((8'hb2) & (8'hb7)))))), 
parameter param69 = param68)
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire47;
  input wire [(4'hb):(1'h0)] wire46;
  input wire [(4'h9):(1'h0)] wire45;
  input wire signed [(5'h13):(1'h0)] wire44;
  wire signed [(3'h4):(1'h0)] wire67;
  wire signed [(3'h5):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire60;
  wire [(2'h3):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire55;
  wire signed [(3'h4):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire53;
  wire signed [(2'h3):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire51;
  wire [(3'h5):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire49;
  wire signed [(5'h10):(1'h0)] wire48;
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire60,
                 wire59,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire48 = $unsigned(($signed($unsigned(wire44[(4'hc):(4'ha)])) < wire45));
  assign wire49 = (~|(&$signed((8'ha5))));
  assign wire50 = {wire46[(4'ha):(4'h8)]};
  assign wire51 = wire45[(3'h5):(3'h5)];
  assign wire52 = $signed(($unsigned((+wire51)) ?
                      (({wire44, wire51} ?
                              (wire48 ? wire46 : (8'hbb)) : (wire47 ?
                                  wire44 : wire49)) ?
                          wire44 : $unsigned(((8'hbb) ^~ wire50))) : $signed(wire46)));
  assign wire53 = {(($unsigned(((7'h43) >= wire50)) ?
                          wire45[(4'h9):(3'h4)] : (^(wire52 || (8'hb1)))) - wire45)};
  assign wire54 = $unsigned(wire47);
  assign wire55 = wire53;
  always
    @(posedge clk) begin
      reg56 <= ($signed((8'hba)) || wire45);
      reg57 <= (&(!$unsigned($signed(wire44))));
      reg58 <= (|$unsigned($signed(wire48)));
    end
  assign wire59 = ((wire52 ^~ ((~(8'hb0)) ?
                      (wire54 ?
                          $signed(wire49) : (reg58 ?
                              wire52 : wire46)) : (^~(wire51 ?
                          wire48 : wire54)))) | $unsigned(wire54[(1'h0):(1'h0)]));
  assign wire60 = $signed((($unsigned((8'hb7)) ^~ $signed($unsigned(wire53))) ?
                      ($unsigned((reg57 != (8'hb2))) ?
                          $signed({wire52}) : reg57[(2'h3):(1'h0)]) : ($unsigned((^~wire53)) ?
                          {wire59,
                              (wire59 ?
                                  (8'ha8) : reg58)} : $signed(wire54[(3'h4):(3'h4)]))));
  always
    @(posedge clk) begin
      reg61 <= wire59[(2'h2):(1'h0)];
      if (wire47)
        begin
          reg62 <= reg57[(4'h9):(1'h0)];
        end
      else
        begin
          reg62 <= $signed(reg56[(4'ha):(4'h8)]);
          reg63 <= (((((wire48 ? (8'hbb) : wire44) ?
              (wire44 ? wire60 : (8'hbd)) : $signed(wire52)) && ((reg58 ?
              (8'ha6) : reg58) ^~ $unsigned(wire48))) < (8'hae)) <= (~|wire50[(3'h5):(2'h3)]));
          reg64 <= $unsigned($unsigned(((^~(wire46 ~^ wire45)) ?
              ($signed(wire59) ? (!wire60) : $signed(wire53)) : ({wire59,
                      wire51} ?
                  (~wire53) : $signed(reg62)))));
          reg65 <= ($signed({((wire51 < wire51) ?
                      wire47[(2'h3):(2'h3)] : $unsigned(wire45))}) ?
              $unsigned((-(8'hae))) : ($unsigned(wire48) ?
                  reg61 : $unsigned($unsigned($unsigned(wire49)))));
        end
    end
  assign wire66 = ((8'hb6) ?
                      reg64 : $signed(((^~wire55) > ($unsigned(wire60) - (wire49 ?
                          wire46 : wire47)))));
  assign wire67 = $signed($signed(wire46[(2'h2):(1'h0)]));
endmodule
