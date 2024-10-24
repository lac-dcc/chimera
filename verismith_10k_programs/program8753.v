module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire159;
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire23,
                 wire25,
                 wire26,
                 wire27,
                 wire29,
                 wire159,
                 reg28,
                 reg24,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire5 = (wire1[(3'h4):(3'h4)] << (8'hae));
  assign wire6 = wire1[(1'h0):(1'h0)];
  assign wire7 = wire0;
  assign wire8 = wire5[(4'he):(4'ha)];
  assign wire9 = (wire2[(1'h0):(1'h0)] ? {wire4[(1'h0):(1'h0)]} : (7'h42));
  assign wire10 = wire2[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      if ({$unsigned((((wire8 >>> (7'h42)) ?
              $unsigned(wire10) : $unsigned(wire7)) ^ $unsigned((+wire0)))),
          ((!(!(!wire2))) ^~ ((~^{wire5, wire0}) ?
              wire5 : $unsigned(wire2[(3'h7):(3'h4)])))})
        begin
          reg11 <= (((!(|(wire2 == wire8))) ?
                  $signed(wire1) : (+wire5[(4'hf):(4'hc)])) ?
              (wire10[(3'h6):(1'h0)] >> (!$signed(wire5[(4'ha):(4'ha)]))) : $unsigned(wire4));
          if (($unsigned(wire3) * (~wire3[(3'h4):(3'h4)])))
            begin
              reg12 <= (+$signed((8'hae)));
              reg13 <= $signed($unsigned(reg11));
              reg14 <= $unsigned($unsigned(wire5[(2'h3):(1'h0)]));
              reg15 <= (((wire4[(3'h4):(2'h2)] <<< ((~|wire3) ^ $signed(wire6))) && wire1) ?
                  {(((~^wire6) ?
                          (&reg12) : wire9[(3'h4):(1'h0)]) ^ reg11[(2'h2):(1'h0)])} : $unsigned($unsigned($signed({wire2,
                      reg12}))));
            end
          else
            begin
              reg12 <= reg15;
              reg13 <= reg13;
              reg14 <= (&$signed({(-wire9), $unsigned($unsigned(reg14))}));
              reg15 <= ($unsigned((wire1 > wire10)) ?
                  {$unsigned(reg14[(4'hc):(4'hb)])} : $signed(({$unsigned(wire1)} << {{wire9},
                      $unsigned((8'haf))})));
            end
          if ((((((~&wire2) ?
                  $unsigned((7'h40)) : (~|wire10)) != {((8'h9f) > reg13),
                  (~&wire2)}) - {reg13[(1'h1):(1'h1)]}) ?
              (((wire6 ? wire4 : (reg15 > (8'hb4))) ?
                      ($unsigned(wire0) == {reg12}) : $signed({wire8, reg14})) ?
                  $unsigned(($signed(wire3) <= (reg12 <= wire6))) : ({wire6[(3'h4):(1'h1)],
                      wire5} << {$unsigned(reg11)})) : ((((reg14 && reg15) ?
                  (reg13 * wire2) : $unsigned(reg13)) < (8'hbd)) ^~ $unsigned((~&$unsigned(wire5))))))
            begin
              reg16 <= wire10;
            end
          else
            begin
              reg16 <= (~{$unsigned({$signed(wire9)}),
                  {$signed((reg14 ? reg16 : wire10)), wire1}});
              reg17 <= (|((&reg13[(1'h0):(1'h0)]) ?
                  $unsigned((|$signed(wire0))) : $unsigned(($unsigned(reg16) ?
                      {(8'hbf), wire5} : reg11[(1'h0):(1'h0)]))));
              reg18 <= wire0;
              reg19 <= $signed({$unsigned(wire0), wire5});
            end
        end
      else
        begin
          reg11 <= (~(~{(^~(8'hbf)),
              (wire8 ? {(7'h44), wire1} : $unsigned(wire2))}));
          if ($signed(((|(reg17 ? (~&(8'haa)) : (wire6 > wire8))) ?
              ($signed(wire5) ?
                  reg12 : (+(wire10 ^ wire4))) : $signed($unsigned((|wire7))))))
            begin
              reg12 <= wire3[(4'ha):(1'h1)];
              reg13 <= reg14[(4'hc):(1'h0)];
              reg14 <= (wire4[(1'h1):(1'h0)] ?
                  (^(!$unsigned((+reg11)))) : reg12[(1'h0):(1'h0)]);
              reg15 <= (($unsigned(reg17) >> (~^$signed(reg13[(2'h2):(1'h0)]))) ?
                  $signed({(8'ha8)}) : ($unsigned((~^(reg12 ?
                          (7'h41) : reg18))) ?
                      ({((8'hb0) ?
                              wire2 : wire5)} & reg11[(2'h2):(1'h1)]) : reg11));
              reg16 <= $signed(($unsigned(((reg11 >>> wire9) ?
                  (~^wire7) : (wire6 ?
                      reg11 : wire1))) <<< reg17[(4'h9):(3'h5)]));
            end
          else
            begin
              reg12 <= wire3;
            end
          reg17 <= (&reg18[(1'h1):(1'h0)]);
          reg18 <= wire10;
        end
      reg20 <= $unsigned((~|$signed($signed((wire4 ? reg15 : reg19)))));
      reg21 <= (~((&((reg19 < (8'ha0)) ? reg12 : $unsigned(reg18))) ?
          wire10[(2'h3):(1'h1)] : wire1));
      reg22 <= reg14;
    end
  assign wire23 = $unsigned(reg19[(3'h7):(3'h4)]);
  always
    @(posedge clk) begin
      reg24 <= ({reg14[(3'h4):(2'h3)],
              (($unsigned(wire6) <<< ((8'hb7) ?
                  reg18 : wire1)) ^~ (+(^~reg20)))} ?
          ((wire4[(2'h2):(1'h1)] ^~ $unsigned({wire5,
              (8'ha9)})) >= $unsigned($unsigned((reg21 ^ reg16)))) : ((~wire6[(1'h0):(1'h0)]) >> wire23[(3'h7):(2'h2)]));
    end
  assign wire25 = (wire0 ?
                      (^~(|{(wire6 | wire0)})) : (&$unsigned($unsigned((wire9 ?
                          wire0 : wire0)))));
  assign wire26 = ((reg19[(1'h0):(1'h0)] > reg13[(4'h8):(3'h7)]) && (^~reg18[(1'h1):(1'h1)]));
  assign wire27 = (~|(^~(~&wire25)));
  always
    @(posedge clk) begin
      reg28 <= reg20;
    end
  assign wire29 = $signed((-$signed(((8'hba) < ((8'hab) ? wire0 : wire4)))));
  module30 #() modinst160 (.y(wire159), .wire33(wire9), .wire35(wire25), .wire32(reg19), .wire31(wire26), .wire34(reg14), .clk(clk));
endmodule

module module30
#(parameter param157 = (^(~|(+((8'h9e) ? (+(8'hba)) : ((8'hb6) ? (8'hba) : (8'hb5)))))), 
parameter param158 = param157)
(y, clk, wire31, wire32, wire33, wire34, wire35);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire31;
  input wire signed [(4'hb):(1'h0)] wire32;
  input wire [(5'h13):(1'h0)] wire33;
  input wire [(4'hd):(1'h0)] wire34;
  input wire [(5'h10):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire155;
  wire [(4'hc):(1'h0)] wire119;
  wire signed [(4'hf):(1'h0)] wire118;
  wire [(4'ha):(1'h0)] wire117;
  wire [(3'h7):(1'h0)] wire116;
  wire [(4'h8):(1'h0)] wire115;
  wire signed [(4'he):(1'h0)] wire114;
  wire [(2'h3):(1'h0)] wire113;
  wire signed [(3'h7):(1'h0)] wire112;
  wire signed [(4'h9):(1'h0)] wire111;
  wire signed [(4'h9):(1'h0)] wire110;
  wire signed [(4'ha):(1'h0)] wire109;
  wire signed [(5'h11):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire67;
  wire signed [(4'hb):(1'h0)] wire68;
  wire signed [(5'h14):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire107;
  assign y = {wire155,
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
                 wire65,
                 wire67,
                 wire68,
                 wire69,
                 wire107,
                 (1'h0)};
  module36 #() modinst66 (.wire37(wire33), .wire39(wire34), .wire38(wire32), .clk(clk), .y(wire65), .wire40(wire35));
  assign wire67 = wire34;
  assign wire68 = wire33[(3'h5):(3'h4)];
  assign wire69 = wire68[(1'h1):(1'h1)];
  module70 #() modinst108 (.wire72(wire65), .wire73(wire31), .wire75(wire35), .wire71(wire34), .y(wire107), .wire74(wire68), .clk(clk));
  assign wire109 = (&{wire31});
  assign wire110 = (^((!(8'ha2)) ?
                       $unsigned(((^wire67) + (wire107 ?
                           wire34 : wire109))) : wire68));
  assign wire111 = $unsigned(wire68);
  assign wire112 = wire35;
  assign wire113 = wire34;
  assign wire114 = ($signed(($unsigned((-wire32)) ?
                       (^$signed(wire33)) : (~(wire113 ?
                           wire107 : wire32)))) * (({(wire31 ?
                               wire107 : wire111),
                           $unsigned(wire111)} ?
                       ($signed((8'hba)) ?
                           (-wire67) : (&wire69)) : wire67[(3'h6):(3'h6)]) != {(8'had),
                       wire68[(2'h3):(2'h2)]}));
  assign wire115 = {wire65};
  assign wire116 = $unsigned($signed(($unsigned((wire35 - wire34)) ?
                       $unsigned($unsigned(wire68)) : (|$signed(wire32)))));
  assign wire117 = wire34[(3'h7):(1'h1)];
  assign wire118 = $signed(wire109[(4'ha):(3'h5)]);
  assign wire119 = (wire118[(3'h6):(2'h2)] < wire113[(2'h2):(1'h0)]);
  module120 #() modinst156 (wire155, clk, wire65, wire31, wire114, wire69);
endmodule

module module120
#(parameter param154 = {(8'hab)})
(y, clk, wire124, wire123, wire122, wire121);
  output wire [(32'h184):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire124;
  input wire [(3'h4):(1'h0)] wire123;
  input wire [(4'he):(1'h0)] wire122;
  input wire [(4'he):(1'h0)] wire121;
  wire signed [(4'hd):(1'h0)] wire153;
  wire [(4'hd):(1'h0)] wire152;
  wire signed [(4'hc):(1'h0)] wire144;
  wire signed [(4'hc):(1'h0)] wire143;
  wire [(4'hc):(1'h0)] wire142;
  wire signed [(5'h15):(1'h0)] wire141;
  wire signed [(4'ha):(1'h0)] wire140;
  wire signed [(3'h7):(1'h0)] wire139;
  wire signed [(4'ha):(1'h0)] wire137;
  wire [(5'h13):(1'h0)] wire134;
  wire signed [(5'h12):(1'h0)] wire133;
  wire [(3'h7):(1'h0)] wire132;
  wire [(4'hf):(1'h0)] wire131;
  wire [(4'hf):(1'h0)] wire130;
  wire [(5'h13):(1'h0)] wire129;
  wire signed [(5'h12):(1'h0)] wire128;
  wire [(4'hc):(1'h0)] wire127;
  wire signed [(5'h12):(1'h0)] wire126;
  wire signed [(4'h9):(1'h0)] wire125;
  reg signed [(3'h4):(1'h0)] reg151 = (1'h0);
  reg [(5'h11):(1'h0)] reg150 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg148 = (1'h0);
  reg [(5'h11):(1'h0)] reg147 = (1'h0);
  reg [(4'hf):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg136 = (1'h0);
  reg [(2'h2):(1'h0)] reg135 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire137,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg138,
                 reg136,
                 reg135,
                 (1'h0)};
  assign wire125 = (|{({(wire121 ? wire121 : wire124)} ?
                           (~&(wire122 == wire122)) : wire124),
                       wire123});
  assign wire126 = ($unsigned(wire121) ^~ wire123);
  assign wire127 = $signed(wire121[(4'hd):(4'hd)]);
  assign wire128 = wire126[(5'h11):(4'hf)];
  assign wire129 = ((((-wire122) ^ wire126[(5'h12):(4'hf)]) && (((wire123 ?
                                   wire123 : wire125) ?
                               (~wire125) : (+wire124)) ?
                           (wire122 + wire125[(3'h5):(3'h5)]) : ((~wire128) <= $signed(wire126)))) ?
                       (wire128[(3'h4):(2'h3)] ^~ (wire128[(1'h1):(1'h0)] == $signed(wire126))) : $signed((wire123 ?
                           (-(-wire128)) : (((8'hac) <<< wire121) ?
                               wire123[(3'h4):(3'h4)] : {wire128}))));
  assign wire130 = $signed(wire127[(1'h0):(1'h0)]);
  assign wire131 = ($unsigned((((wire121 * wire129) ?
                           wire121[(1'h0):(1'h0)] : (wire121 == (8'haf))) & wire122[(4'hb):(2'h2)])) ?
                       (8'ha1) : ({$signed({(8'h9c)}),
                           ((~&wire124) ?
                               (wire130 != wire130) : $unsigned((8'hb8)))} & (!((wire124 ?
                           wire126 : (8'ha0)) > {wire124, (8'hab)}))));
  assign wire132 = $signed({wire130[(4'hd):(1'h0)],
                       (+(wire121[(4'h9):(2'h3)] << (wire121 ?
                           wire127 : wire122)))});
  assign wire133 = $signed($signed($unsigned(wire124)));
  assign wire134 = $signed((wire133 <= ((~&((8'haf) ? (8'ha7) : wire131)) ?
                       wire123[(1'h0):(1'h0)] : (wire132[(1'h1):(1'h0)] < (&wire127)))));
  always
    @(posedge clk) begin
      reg135 <= (wire125[(1'h1):(1'h1)] ^ (&wire126[(5'h11):(4'hf)]));
      reg136 <= $signed((wire133[(4'hd):(1'h0)] << wire122[(4'hc):(2'h3)]));
    end
  assign wire137 = $unsigned((-($unsigned((wire122 ?
                       reg136 : wire124)) == ((~^wire130) * $unsigned(wire124)))));
  always
    @(posedge clk) begin
      reg138 <= $signed($unsigned((~|wire124)));
    end
  assign wire139 = (+(wire130 <= {(8'hb6)}));
  assign wire140 = reg138;
  assign wire141 = $signed(reg135);
  assign wire142 = reg136;
  assign wire143 = wire139[(3'h7):(1'h1)];
  assign wire144 = wire127[(4'hb):(4'h8)];
  always
    @(posedge clk) begin
      reg145 <= (wire144 ?
          $signed($unsigned($signed($signed(reg136)))) : $signed({(((8'h9e) > wire129) > (wire125 ?
                  wire129 : wire142))}));
      reg146 <= ($signed({$unsigned(reg145)}) ?
          (^~reg135[(1'h1):(1'h1)]) : {$unsigned(($unsigned((8'ha7)) ?
                  (wire129 < (8'ha8)) : (wire121 ? wire141 : (8'hb5))))});
      reg147 <= $signed((wire134[(2'h2):(1'h0)] && {(8'h9d),
          $signed(wire132)}));
      reg148 <= ({(({wire124} != (~^reg146)) << $unsigned($unsigned(wire137))),
          $unsigned($signed((~&reg146)))} - wire137[(2'h2):(2'h2)]);
    end
  always
    @(posedge clk) begin
      reg149 <= (($unsigned(wire142[(4'hb):(4'h8)]) ^~ (({wire121} <= {wire139}) ^~ $signed((+reg135)))) >= reg136);
      reg150 <= wire141[(4'hb):(3'h7)];
      reg151 <= $signed((+(wire140 ?
          (8'ha3) : $unsigned((wire123 ^ wire128)))));
    end
  assign wire152 = $unsigned((|wire131));
  assign wire153 = (~&((~&wire127) ~^ wire122));
endmodule

module module70
#(parameter param105 = (({{(~(8'ha2)), (^~(8'haa))}} & (7'h40)) ? (^((~((7'h40) > (8'hb4))) ? (~(7'h40)) : ({(8'haa)} ? ((8'ha7) | (8'ha6)) : {(8'h9c)}))) : (^~(-{((8'haf) && (8'hbe)), {(7'h44), (7'h41)}}))), 
parameter param106 = (((param105 ? (~|param105) : ((param105 < param105) + (param105 == (8'ha8)))) ? (^((~&param105) ? param105 : {param105})) : (8'hbf)) ? ((param105 ? param105 : param105) || param105) : param105))
(y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire75;
  input wire signed [(4'hb):(1'h0)] wire74;
  input wire signed [(5'h15):(1'h0)] wire73;
  input wire [(5'h11):(1'h0)] wire72;
  input wire signed [(3'h5):(1'h0)] wire71;
  wire [(4'h9):(1'h0)] wire104;
  wire signed [(2'h3):(1'h0)] wire103;
  wire signed [(4'h9):(1'h0)] wire102;
  wire [(3'h5):(1'h0)] wire101;
  wire signed [(4'he):(1'h0)] wire100;
  wire [(4'ha):(1'h0)] wire99;
  wire [(3'h7):(1'h0)] wire98;
  wire signed [(3'h4):(1'h0)] wire97;
  wire [(5'h10):(1'h0)] wire84;
  wire [(4'hb):(1'h0)] wire83;
  wire [(5'h13):(1'h0)] wire82;
  wire [(2'h2):(1'h0)] wire81;
  wire signed [(4'h8):(1'h0)] wire80;
  wire [(3'h7):(1'h0)] wire79;
  wire [(4'hf):(1'h0)] wire78;
  wire [(2'h2):(1'h0)] wire77;
  wire signed [(4'hc):(1'h0)] wire76;
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(4'h9):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
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
                 (1'h0)};
  assign wire76 = wire72[(1'h0):(1'h0)];
  assign wire77 = (wire71 ? wire71 : (|$unsigned(wire74)));
  assign wire78 = $unsigned((^{((~^wire71) ?
                          {wire75, wire71} : {wire76, wire77}),
                      wire77}));
  assign wire79 = wire78;
  assign wire80 = wire78;
  assign wire81 = wire76[(2'h2):(1'h0)];
  assign wire82 = (($unsigned($signed((|(8'ha4)))) && ($signed({wire72,
                              wire74}) ?
                          (wire77[(1'h0):(1'h0)] ?
                              wire73 : {wire76}) : wire78[(4'h9):(4'h9)])) ?
                      wire80[(3'h6):(3'h5)] : ((wire78[(3'h4):(3'h4)] ?
                          {(wire78 << (8'hb9))} : wire78) + (((wire81 <= wire75) ?
                          $unsigned(wire73) : wire76) ^~ ({wire78,
                          wire71} <= (^wire71)))));
  assign wire83 = (($unsigned(wire76) | wire78[(3'h5):(2'h3)]) ?
                      {(8'had)} : ($signed($unsigned((&wire71))) ?
                          wire71[(3'h4):(1'h0)] : (wire82[(5'h11):(4'h9)] ?
                              ($unsigned(wire79) | (wire81 ^ wire78)) : wire72[(4'h8):(2'h3)])));
  assign wire84 = {wire78[(2'h3):(2'h2)]};
  always
    @(posedge clk) begin
      reg85 <= {wire80[(2'h3):(1'h0)]};
      reg86 <= wire79[(3'h6):(1'h0)];
      reg87 <= wire76;
      reg88 <= $unsigned(wire80[(4'h8):(2'h3)]);
      if ((^(8'ha9)))
        begin
          reg89 <= ((!(($signed(wire84) ^~ (wire75 ? reg85 : wire76)) ?
              ((wire82 >> wire79) ?
                  wire78[(4'h9):(2'h2)] : (~wire73)) : wire71)) || (!(~wire76[(3'h6):(1'h1)])));
          reg90 <= wire81;
        end
      else
        begin
          reg89 <= (&($signed(wire73) ?
              wire71 : ((^{wire82, (7'h41)}) - wire81[(1'h0):(1'h0)])));
          if (reg86[(4'hb):(4'hb)])
            begin
              reg90 <= (~^(~|wire75));
              reg91 <= wire78;
            end
          else
            begin
              reg90 <= $signed($signed(reg87));
              reg91 <= wire75[(2'h2):(1'h1)];
              reg92 <= $unsigned(wire81);
              reg93 <= $signed($signed((((8'ha0) >= reg90[(4'hc):(3'h7)]) ?
                  (~&(~|reg88)) : ((8'haa) ?
                      wire71[(3'h5):(1'h0)] : (reg86 >>> wire74)))));
              reg94 <= reg87[(2'h3):(2'h3)];
            end
          reg95 <= ($unsigned((wire78 ?
              reg88[(2'h3):(2'h2)] : (&wire77[(1'h1):(1'h1)]))) <<< ($signed(((wire82 ?
              reg88 : reg89) > (~^wire84))) | $unsigned({((8'ha6) >= wire82),
              $signed(wire81)})));
          reg96 <= ((wire78 ?
              (~|(wire84 || reg90)) : $signed(((wire77 ?
                  wire84 : (8'hb7)) <= (wire80 ? reg90 : reg85)))) * ((({wire83,
                  reg90} >= (!reg89)) ^ {$unsigned(reg92),
                  (wire82 ? (8'hba) : (8'ha8))}) ?
              (&$signed(reg93[(1'h1):(1'h0)])) : ($unsigned({reg92}) ?
                  ($unsigned(reg89) && $signed(wire79)) : wire81)));
        end
    end
  assign wire97 = $unsigned((reg85[(2'h3):(1'h1)] != wire82[(4'hd):(3'h5)]));
  assign wire98 = (((8'had) ? wire72 : $unsigned(wire71[(1'h0):(1'h0)])) ?
                      $unsigned(($signed($unsigned(wire75)) <= $signed((^~wire77)))) : (wire73 ?
                          wire78[(4'he):(1'h1)] : {(+((8'hb4) ?
                                  reg95 : wire84)),
                              $unsigned((~wire73))}));
  assign wire99 = wire84[(4'he):(3'h6)];
  assign wire100 = (($unsigned(((wire84 ? wire82 : wire76) ?
                           (reg95 ? (8'had) : wire84) : {(8'h9f),
                               reg94})) || wire74[(1'h1):(1'h0)]) ?
                       wire84[(4'hf):(3'h7)] : (8'ha4));
  assign wire101 = wire97[(1'h1):(1'h1)];
  assign wire102 = wire80[(3'h4):(1'h1)];
  assign wire103 = (+(8'had));
  assign wire104 = reg96;
endmodule

module module36  (y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire40;
  input wire signed [(4'hd):(1'h0)] wire39;
  input wire [(4'hb):(1'h0)] wire38;
  input wire signed [(4'h9):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire64;
  wire signed [(5'h11):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire62;
  wire [(4'hc):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire57;
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg41 <= $unsigned(wire39);
      reg42 <= wire38;
      reg43 <= wire38;
    end
  always
    @(posedge clk) begin
      if ((^~$unsigned(wire37[(4'h8):(3'h5)])))
        begin
          reg44 <= ((reg41 ? $signed((8'hb1)) : wire39[(1'h0):(1'h0)]) ?
              reg41 : (^~$unsigned((~|wire38[(3'h7):(3'h7)]))));
        end
      else
        begin
          if (reg44[(4'hb):(4'ha)])
            begin
              reg44 <= (+{reg41});
            end
          else
            begin
              reg44 <= {{reg43}};
            end
          if ((7'h43))
            begin
              reg45 <= $unsigned($signed(((+reg44[(4'ha):(2'h3)]) ?
                  (-$unsigned(reg43)) : {$signed(wire40)})));
              reg46 <= $signed($signed(wire40));
              reg47 <= (((+$signed(wire38[(4'h9):(3'h4)])) * (~&((~(8'h9c)) & (wire40 ~^ (8'hbf))))) - {reg46[(3'h6):(2'h2)]});
            end
          else
            begin
              reg45 <= (~&$signed(($unsigned(reg43) ?
                  (((8'ha3) == reg44) && (~^reg46)) : (reg46 >= reg41))));
              reg46 <= wire37;
              reg47 <= reg41[(3'h4):(1'h1)];
              reg48 <= (reg45[(4'h8):(2'h3)] << (reg43[(2'h3):(1'h0)] && ((wire37[(4'h8):(2'h2)] ?
                  (~^(8'hba)) : $signed(wire39)) & $unsigned((~|reg41)))));
            end
          reg49 <= $signed({$unsigned($signed({(8'hac)}))});
          if ((&reg42[(1'h1):(1'h1)]))
            begin
              reg50 <= ((8'hb2) ?
                  $unsigned(wire37[(3'h6):(3'h4)]) : $unsigned(reg46[(3'h4):(1'h0)]));
              reg51 <= {(($signed(((8'hb7) >>> reg41)) << (!$unsigned(reg47))) ?
                      ($unsigned($unsigned(reg41)) + $signed($unsigned(reg47))) : $signed(((~reg48) ?
                          $signed(wire39) : (^~wire38)))),
                  $unsigned(($signed(wire37[(2'h3):(2'h2)]) != $signed(reg47[(3'h4):(1'h1)])))};
              reg52 <= {$signed(reg46)};
              reg53 <= ($signed((^~reg45)) ?
                  (reg43[(1'h0):(1'h0)] ?
                      ((~{wire37, reg49}) ?
                          (8'hae) : (~^$unsigned(wire39))) : $signed($unsigned(wire38))) : ($signed({$signed((8'ha7))}) >= ($unsigned(reg46) * (wire39[(3'h5):(1'h1)] + (reg41 ?
                      wire38 : reg48)))));
              reg54 <= $unsigned($unsigned((&$signed((reg48 - wire37)))));
            end
          else
            begin
              reg50 <= $signed((8'hac));
              reg51 <= $signed((({reg51} ?
                      ((-wire40) << reg47) : ($signed(wire38) ?
                          (reg51 ? reg50 : wire40) : (~|(8'hba)))) ?
                  {(~^$signed(wire37)),
                      $unsigned((^~reg51))} : reg52[(4'ha):(1'h1)]));
              reg52 <= reg42;
            end
          reg55 <= (&$signed($signed(reg48)));
        end
      reg56 <= (!((((reg53 ? reg47 : (8'ha3)) ?
              {reg45, (8'hb1)} : reg41) && reg42) ?
          reg52[(3'h5):(1'h0)] : (((reg45 ? wire38 : reg41) ?
              $unsigned(reg46) : (reg53 * reg47)) >>> (&(wire39 != (8'hb5))))));
    end
  assign wire57 = (~($signed(reg42) ?
                      reg46[(2'h2):(1'h1)] : $unsigned(wire37)));
  assign wire58 = reg56[(2'h3):(2'h2)];
  assign wire59 = (^$signed(((reg47[(2'h2):(1'h1)] > (!reg49)) != ((reg55 ?
                      reg48 : reg42) < $unsigned(reg53)))));
  assign wire60 = $unsigned($unsigned(reg47[(1'h0):(1'h0)]));
  assign wire61 = (8'hbc);
  assign wire62 = reg53[(5'h13):(4'he)];
  assign wire63 = (wire39[(1'h0):(1'h0)] ?
                      $unsigned(($signed((^reg56)) ?
                          ($signed(reg55) ?
                              reg50 : $unsigned((8'hb2))) : $unsigned({reg53,
                              (7'h42)}))) : $signed((8'ha1)));
  assign wire64 = wire40[(4'h8):(2'h3)];
endmodule
