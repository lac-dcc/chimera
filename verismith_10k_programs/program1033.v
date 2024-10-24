module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire188;
  wire signed [(3'h6):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  assign y = {wire188,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg10,
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
                 (1'h0)};
  assign wire4 = (~$unsigned((+wire1[(2'h3):(2'h2)])));
  assign wire5 = $unsigned(wire1);
  assign wire6 = (8'haa);
  assign wire7 = ($signed($signed({wire5, wire2})) >= (~$signed((wire1 ?
                     $unsigned(wire5) : (wire6 ? wire3 : wire4)))));
  assign wire8 = (wire2 & wire2);
  assign wire9 = wire5[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg10 <= $signed((&(8'hb8)));
      reg11 <= ((~&(-(|{wire4}))) ?
          ($unsigned({wire1, $signed(wire4)}) >>> {(8'h9d),
              $unsigned(wire8[(1'h0):(1'h0)])}) : $unsigned(wire5));
    end
  always
    @(posedge clk) begin
      reg12 <= reg11[(2'h2):(1'h0)];
      reg13 <= $signed(($unsigned(((wire6 >> wire6) >= (wire7 * reg10))) ^~ $signed((8'ha0))));
      reg14 <= (&$signed((|$unsigned(((8'hb6) ? (8'hb0) : wire6)))));
      reg15 <= (wire8[(2'h2):(2'h2)] ?
          reg14[(3'h5):(2'h3)] : wire3[(3'h5):(3'h4)]);
      if (wire8)
        begin
          reg16 <= $unsigned((|((!$unsigned(wire5)) ?
              (~|(wire4 && (8'hb3))) : $unsigned((wire3 ? reg11 : reg14)))));
          reg17 <= (!($unsigned(wire0) >= (~wire3)));
        end
      else
        begin
          if ({(8'ha1)})
            begin
              reg16 <= wire9[(2'h3):(1'h1)];
              reg17 <= (8'hb9);
              reg18 <= ((^~((((8'hb7) >>> reg16) - (-wire2)) ?
                  (^~wire8) : $signed($unsigned(reg10)))) ^ (8'h9e));
              reg19 <= wire1;
            end
          else
            begin
              reg16 <= ((reg14[(3'h4):(3'h4)] != $signed(reg18[(1'h0):(1'h0)])) ?
                  (($unsigned(((8'hbe) ?
                          (8'ha5) : wire4)) != $signed({(8'hb0)})) ?
                      ((wire7[(1'h0):(1'h0)] ?
                          wire9[(2'h3):(2'h2)] : $signed(wire7)) ^ (~(wire4 ?
                          (8'hab) : reg13))) : ((reg10 >>> $unsigned(reg17)) ?
                          wire7 : (8'haa))) : (wire0[(3'h4):(3'h4)] ?
                      (8'ha9) : $signed(($signed((8'ha0)) ?
                          $signed((8'ha8)) : (&reg11)))));
              reg17 <= ((($signed(wire5) >> $signed(reg12)) ^ $unsigned(wire9)) ?
                  (wire5[(3'h4):(2'h2)] ?
                      ((|(~^wire5)) ? wire0 : $unsigned((+wire1))) : ({{reg12,
                                  wire1},
                              reg19} ?
                          ((reg15 ? (8'had) : wire8) ?
                              $signed(wire3) : (wire3 ?
                                  wire0 : (8'hab))) : $signed($unsigned(reg15)))) : reg17);
              reg18 <= wire1[(3'h4):(1'h1)];
              reg19 <= wire1;
            end
          reg20 <= reg14;
        end
    end
  assign wire21 = ((wire6[(1'h0):(1'h0)] - (!wire6[(2'h2):(2'h2)])) <= reg20[(1'h1):(1'h0)]);
  assign wire22 = ({(({reg15, (8'had)} ?
                              (^wire21) : (~^reg16)) != wire2[(3'h5):(3'h4)]),
                          (wire7[(3'h4):(2'h2)] & reg15)} ?
                      {$signed((reg14 ? $signed(reg17) : (^reg13)))} : reg18);
  assign wire23 = ((wire1 - $signed(wire9[(3'h4):(2'h2)])) ?
                      wire8[(1'h0):(1'h0)] : $signed((!(!$unsigned(wire5)))));
  assign wire24 = $unsigned((reg12 ?
                      (wire21 ?
                          ($signed(wire8) ?
                              {(8'hb0)} : $unsigned((8'ha2))) : {(^~(8'hb1)),
                              wire0[(3'h4):(1'h0)]}) : wire1[(4'hb):(3'h6)]));
  assign wire25 = ((^($unsigned($signed(reg17)) ^ (~^reg19[(3'h6):(3'h4)]))) >= wire2[(2'h2):(1'h1)]);
  assign wire26 = reg20[(4'h8):(1'h1)];
  assign wire27 = $unsigned(wire8);
  module28 #() modinst189 (wire188, clk, wire3, reg12, reg18, wire25, reg19);
endmodule

module module28
#(parameter param186 = {(~&((+(~^(8'hb8))) ~^ (((7'h43) | (8'ha9)) ~^ ((8'h9d) <<< (8'h9e)))))}, 
parameter param187 = (&param186))
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'hff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire33;
  input wire [(5'h14):(1'h0)] wire32;
  input wire [(5'h11):(1'h0)] wire31;
  input wire signed [(2'h2):(1'h0)] wire30;
  input wire signed [(5'h13):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire184;
  wire [(4'hc):(1'h0)] wire160;
  wire signed [(5'h12):(1'h0)] wire73;
  wire [(4'hc):(1'h0)] wire72;
  wire [(4'hd):(1'h0)] wire71;
  wire signed [(4'h9):(1'h0)] wire70;
  wire signed [(5'h13):(1'h0)] wire68;
  wire signed [(4'h8):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire39;
  wire [(4'he):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire34;
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  assign y = {wire184,
                 wire160,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire68,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire34,
                 reg35,
                 reg36,
                 reg37,
                 (1'h0)};
  assign wire34 = ($signed((^$signed((~&(8'ha3))))) & wire31[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg35 <= {wire30[(1'h1):(1'h0)],
          (wire32 ~^ $signed($unsigned((wire33 > wire29))))};
      reg36 <= reg35;
      reg37 <= ($unsigned((wire29[(3'h5):(2'h2)] ?
              (reg36[(2'h3):(2'h2)] == (|wire31)) : wire30)) ?
          (+((8'ha8) ?
              (wire33[(1'h0):(1'h0)] + wire32[(4'ha):(2'h3)]) : $signed((wire31 ?
                  (7'h43) : reg35)))) : ((&{wire34[(4'h9):(2'h2)]}) - ((8'ha3) + reg36[(1'h0):(1'h0)])));
    end
  assign wire38 = ((|reg36) < (~^(~^(~|wire29))));
  assign wire39 = $unsigned(wire38);
  assign wire40 = wire33[(3'h6):(2'h2)];
  assign wire41 = ($signed((&{$unsigned((8'hb8))})) >= $signed($signed(wire40)));
  assign wire42 = (^~(($signed(wire33[(3'h6):(1'h1)]) ?
                      (-(reg36 | (8'haf))) : wire31[(3'h7):(3'h4)]) ~^ (wire29 - (wire39[(1'h1):(1'h1)] >= reg35[(4'ha):(1'h1)]))));
  assign wire43 = ({((wire41 << wire38) * wire42[(5'h11):(1'h1)])} * (^~$unsigned($signed($signed(reg37)))));
  assign wire44 = $signed(wire31);
  assign wire45 = wire38;
  module46 #() modinst69 (.wire48(wire44), .clk(clk), .wire49(wire31), .y(wire68), .wire47(wire39), .wire51(wire45), .wire50(reg35));
  assign wire70 = wire31;
  assign wire71 = $unsigned(($unsigned(($signed(wire45) ?
                          ((8'hb2) ? wire68 : wire42) : wire40)) ?
                      $signed(wire39[(5'h14):(2'h3)]) : ($signed((~^wire41)) ?
                          ($unsigned(wire44) >> {wire34}) : $signed($signed(wire38)))));
  assign wire72 = (8'h9e);
  assign wire73 = (^~wire30);
  module74 #() modinst161 (wire160, clk, wire39, wire38, wire73, wire29);
  module162 #() modinst185 (.clk(clk), .wire166(wire70), .wire165(wire43), .wire164(wire160), .y(wire184), .wire163(wire72));
endmodule

module module162  (y, clk, wire166, wire165, wire164, wire163);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire166;
  input wire [(5'h10):(1'h0)] wire165;
  input wire signed [(4'hc):(1'h0)] wire164;
  input wire [(2'h3):(1'h0)] wire163;
  wire signed [(3'h7):(1'h0)] wire183;
  wire [(4'hf):(1'h0)] wire182;
  wire [(3'h5):(1'h0)] wire181;
  wire [(4'h8):(1'h0)] wire179;
  wire signed [(4'h8):(1'h0)] wire178;
  wire [(5'h14):(1'h0)] wire177;
  wire [(4'h8):(1'h0)] wire176;
  wire signed [(4'hf):(1'h0)] wire175;
  wire signed [(5'h12):(1'h0)] wire174;
  wire [(4'hf):(1'h0)] wire173;
  wire [(5'h15):(1'h0)] wire172;
  wire [(4'h9):(1'h0)] wire171;
  wire [(2'h3):(1'h0)] wire170;
  wire [(5'h14):(1'h0)] wire169;
  wire signed [(4'ha):(1'h0)] wire168;
  wire signed [(5'h14):(1'h0)] wire167;
  reg [(5'h10):(1'h0)] reg180 = (1'h0);
  assign y = {wire183,
                 wire182,
                 wire181,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 reg180,
                 (1'h0)};
  assign wire167 = (!($signed($unsigned(wire166)) > (~^(~$unsigned(wire164)))));
  assign wire168 = (^~{{$unsigned((wire167 ? wire165 : wire166))}});
  assign wire169 = $signed({($signed(wire164[(3'h4):(2'h3)]) ?
                           $unsigned(((8'ha0) ?
                               wire164 : wire165)) : (+wire166)),
                       ($unsigned(wire166[(1'h0):(1'h0)]) >>> (wire163[(1'h1):(1'h1)] ?
                           (wire163 <<< (8'h9e)) : wire163[(1'h0):(1'h0)]))});
  assign wire170 = $unsigned(wire163[(2'h3):(1'h1)]);
  assign wire171 = (+wire166);
  assign wire172 = {wire169, (^~wire168)};
  assign wire173 = $unsigned(wire169[(4'h9):(2'h3)]);
  assign wire174 = (($signed(wire169) ?
                       $signed({wire164[(3'h7):(3'h6)],
                           ((7'h42) ?
                               wire167 : wire163)}) : (~$unsigned((&wire167)))) + wire166);
  assign wire175 = ($signed(wire164) && (({$unsigned(wire166)} >> wire168[(2'h2):(1'h0)]) << (8'h9f)));
  assign wire176 = {(((&wire165[(1'h0):(1'h0)]) - $signed((~wire173))) ?
                           {(8'hb3),
                               {wire167[(5'h13):(5'h13)],
                                   (~&wire172)}} : $unsigned(wire163)),
                       (wire170 - {$signed(wire169[(5'h14):(2'h2)])})};
  assign wire177 = wire176[(3'h6):(1'h1)];
  assign wire178 = (wire175 | wire174[(4'hf):(4'h8)]);
  assign wire179 = wire178[(3'h7):(3'h7)];
  always
    @(posedge clk) begin
      reg180 <= (wire164 != ($unsigned((~&wire165[(3'h7):(2'h2)])) ?
          (wire172 && ((~^wire164) <<< (wire176 ?
              wire169 : (8'ha0)))) : (|(&$unsigned(wire177)))));
    end
  assign wire181 = (wire172[(4'hb):(3'h4)] == (wire178[(1'h1):(1'h0)] ?
                       ($signed((-wire176)) ^~ (+(-wire169))) : wire176));
  assign wire182 = ({(wire181[(1'h0):(1'h0)] - wire179),
                           $signed((+$unsigned((8'h9d))))} ?
                       (wire171[(2'h3):(2'h3)] < $signed({wire175})) : (($unsigned(wire176[(4'h8):(2'h2)]) ?
                               $signed((&wire172)) : $unsigned(wire181)) ?
                           (((wire181 >= wire167) ?
                                   $signed(wire181) : (wire177 ?
                                       (8'h9d) : wire177)) ?
                               ((~|reg180) ?
                                   $signed(wire166) : $signed(wire164)) : wire164) : wire167));
  assign wire183 = wire167[(5'h14):(4'ha)];
endmodule

module module74  (y, clk, wire78, wire77, wire76, wire75);
  output wire [(32'h3dc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire78;
  input wire [(4'he):(1'h0)] wire77;
  input wire [(4'h9):(1'h0)] wire76;
  input wire [(2'h3):(1'h0)] wire75;
  wire signed [(2'h2):(1'h0)] wire159;
  wire signed [(5'h12):(1'h0)] wire158;
  wire [(4'he):(1'h0)] wire157;
  wire signed [(5'h12):(1'h0)] wire156;
  wire signed [(5'h12):(1'h0)] wire155;
  wire [(4'ha):(1'h0)] wire154;
  wire signed [(4'h8):(1'h0)] wire153;
  wire [(2'h2):(1'h0)] wire152;
  wire signed [(2'h3):(1'h0)] wire151;
  wire [(4'h8):(1'h0)] wire150;
  wire [(5'h12):(1'h0)] wire149;
  wire signed [(4'hf):(1'h0)] wire148;
  wire [(5'h12):(1'h0)] wire135;
  wire signed [(4'hc):(1'h0)] wire134;
  wire signed [(3'h5):(1'h0)] wire94;
  wire signed [(2'h3):(1'h0)] wire93;
  wire signed [(5'h13):(1'h0)] wire85;
  wire [(4'hb):(1'h0)] wire79;
  reg [(2'h2):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg146 = (1'h0);
  reg [(4'ha):(1'h0)] reg145 = (1'h0);
  reg [(5'h15):(1'h0)] reg144 = (1'h0);
  reg [(2'h3):(1'h0)] reg143 = (1'h0);
  reg [(3'h7):(1'h0)] reg142 = (1'h0);
  reg [(3'h6):(1'h0)] reg141 = (1'h0);
  reg signed [(4'he):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg138 = (1'h0);
  reg [(5'h11):(1'h0)] reg137 = (1'h0);
  reg [(4'h9):(1'h0)] reg136 = (1'h0);
  reg [(5'h12):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg132 = (1'h0);
  reg [(5'h13):(1'h0)] reg131 = (1'h0);
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg129 = (1'h0);
  reg [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg125 = (1'h0);
  reg [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg123 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg121 = (1'h0);
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  reg [(5'h15):(1'h0)] reg119 = (1'h0);
  reg [(3'h4):(1'h0)] reg118 = (1'h0);
  reg [(5'h12):(1'h0)] reg117 = (1'h0);
  reg [(4'hf):(1'h0)] reg116 = (1'h0);
  reg [(4'hc):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg114 = (1'h0);
  reg [(4'hb):(1'h0)] reg113 = (1'h0);
  reg [(3'h7):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg110 = (1'h0);
  reg [(4'hd):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(2'h2):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(3'h6):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg97 = (1'h0);
  reg [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(3'h7):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(2'h2):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg80 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire135,
                 wire134,
                 wire94,
                 wire93,
                 wire85,
                 wire79,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
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
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 (1'h0)};
  assign wire79 = $signed(wire77);
  always
    @(posedge clk) begin
      reg80 <= ((~((wire77 ?
              $unsigned(wire77) : ((8'hbb) ?
                  (8'ha0) : wire76)) >= $unsigned($unsigned(wire76)))) ?
          ($unsigned((((8'hb2) ?
              wire79 : wire75) & (wire79 + (8'hb4)))) ^~ ($unsigned((^wire78)) ?
              wire78[(1'h1):(1'h1)] : $signed($unsigned((8'ha1))))) : (~^($signed((wire79 ?
                  wire79 : wire78)) ?
              wire75 : $signed({wire79}))));
      reg81 <= $signed((reg80 ?
          reg80[(3'h4):(1'h1)] : $signed($signed(wire76))));
      reg82 <= $unsigned((8'hb8));
      reg83 <= wire79;
      reg84 <= $unsigned($signed($unsigned(wire76[(1'h0):(1'h0)])));
    end
  assign wire85 = reg83;
  always
    @(posedge clk) begin
      reg86 <= (reg84 ?
          (~((~(^~reg80)) ?
              ($unsigned(reg83) ?
                  $unsigned((8'hba)) : reg82) : wire75[(2'h3):(1'h1)])) : {((^(~&reg82)) + ((~|reg81) ?
                  reg84[(4'h8):(3'h6)] : (wire79 ^ reg81)))});
      reg87 <= ($signed((wire75[(1'h0):(1'h0)] >>> wire76[(3'h7):(2'h2)])) >>> (^((!(wire79 ?
              reg81 : wire79)) ?
          $signed((8'ha0)) : $unsigned((reg80 | wire79)))));
      if (wire77)
        begin
          reg88 <= (+(^$unsigned(($signed(wire77) > $unsigned(reg84)))));
        end
      else
        begin
          reg88 <= (^~(8'ha4));
          if ($unsigned(($unsigned({(reg87 >>> wire78),
              $signed(wire78)}) | $unsigned(reg88))))
            begin
              reg89 <= (+($unsigned(reg86) ?
                  $signed((+(8'hb5))) : wire78[(3'h4):(2'h2)]));
              reg90 <= (7'h43);
            end
          else
            begin
              reg89 <= (($signed($unsigned({reg89,
                  reg83})) >= $unsigned((^~(~|wire79)))) ^ (reg83 ?
                  $signed((wire79[(3'h7):(3'h4)] >= $signed(reg80))) : {((+reg86) >>> reg90),
                      $signed((reg80 != reg86))}));
              reg90 <= wire79;
            end
          reg91 <= {{($signed(wire78[(3'h4):(2'h3)]) > ((wire85 & reg81) ?
                      (reg80 ? reg83 : reg90) : reg82))}};
        end
      reg92 <= (($unsigned({(reg80 * reg84)}) ?
          $signed({(~|reg89)}) : wire77[(3'h5):(3'h4)]) >= $unsigned(((((8'hb0) || reg82) ?
              $unsigned(reg91) : wire77) ?
          $unsigned(((7'h43) + wire79)) : ((wire77 & reg91) < $signed(wire76)))));
    end
  assign wire93 = $unsigned((&(|{(8'h9d), $signed(reg84)})));
  assign wire94 = ((($unsigned((wire93 <= reg89)) ?
                          (&wire85) : ((reg82 ?
                              reg80 : reg83) || reg91[(2'h2):(1'h1)])) ?
                      (^(~|$signed(reg87))) : $signed((+$signed(reg91)))) & ((reg84[(3'h6):(3'h4)] || wire75[(1'h0):(1'h0)]) * $signed($unsigned(wire75[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      if (reg84[(4'h9):(3'h5)])
        begin
          reg95 <= reg90;
          if ($unsigned($signed(reg82)))
            begin
              reg96 <= ((reg90 - (~^((^reg89) ? reg81 : (8'hb5)))) ?
                  reg83 : ($unsigned((reg83[(4'hb):(3'h7)] ?
                      $unsigned(reg81) : $unsigned(reg84))) <<< ({reg84} && (((8'hb3) < wire93) + (wire77 ?
                      reg80 : reg80)))));
              reg97 <= $signed(($signed(((reg87 | reg88) ?
                      ((8'haa) ? (8'hbd) : reg91) : $signed(wire93))) ?
                  $signed($signed($unsigned(reg87))) : $signed($signed(reg87))));
              reg98 <= wire94;
            end
          else
            begin
              reg96 <= wire93;
              reg97 <= reg81;
              reg98 <= reg80[(4'hd):(4'hc)];
            end
          reg99 <= reg83[(4'he):(2'h2)];
          if ((~&$signed($signed((^~(^reg86))))))
            begin
              reg100 <= ({wire93, $unsigned(($signed(reg89) <= (7'h41)))} ?
                  wire76[(3'h4):(3'h4)] : $unsigned(((8'hbc) ?
                      (~|(reg84 + (7'h43))) : $signed($unsigned(reg87)))));
            end
          else
            begin
              reg100 <= (8'hb3);
              reg101 <= (~|$unsigned($unsigned({reg84})));
              reg102 <= (8'hbd);
              reg103 <= wire94[(2'h2):(1'h1)];
            end
          if (wire76)
            begin
              reg104 <= $signed(reg95);
              reg105 <= $signed($unsigned($unsigned(wire94[(1'h0):(1'h0)])));
              reg106 <= $unsigned((~&(&(wire78[(3'h4):(1'h0)] & ((7'h43) ~^ (8'ha8))))));
              reg107 <= reg84[(3'h4):(2'h2)];
            end
          else
            begin
              reg104 <= {wire76[(1'h0):(1'h0)],
                  $signed((((reg104 - wire94) ? reg90 : $unsigned((8'hab))) ?
                      (!$unsigned((7'h40))) : {(wire85 ? reg80 : reg87),
                          (|reg91)}))};
              reg105 <= $signed($unsigned((^(reg106[(2'h2):(1'h1)] >= reg105))));
              reg106 <= {reg104[(1'h0):(1'h0)], reg91[(3'h6):(3'h6)]};
              reg107 <= ((((^~(~^reg95)) ?
                      (|$signed(reg83)) : $signed((reg102 ?
                          reg80 : wire78))) < $unsigned($unsigned(reg81))) ?
                  wire78 : $unsigned((^~$unsigned(((8'h9f) ?
                      reg105 : wire75)))));
            end
        end
      else
        begin
          reg95 <= $signed(reg84);
          reg96 <= (reg92[(4'h8):(3'h6)] ?
              $signed($signed((~(&wire79)))) : $signed({$signed({(7'h42)}),
                  $unsigned($unsigned((8'hab)))}));
          reg97 <= (($unsigned(({reg87} == reg91)) <<< $unsigned((~(reg95 - wire94)))) - $unsigned(reg100[(3'h4):(2'h2)]));
        end
      reg108 <= reg91[(3'h6):(3'h4)];
      if (reg91)
        begin
          reg109 <= $signed(reg98);
          if ((!reg98))
            begin
              reg110 <= ($unsigned(reg90[(3'h6):(3'h6)]) ?
                  $signed($signed($unsigned((8'h9c)))) : (~(~^{((8'hbb) ^~ (8'hac)),
                      (~^reg88)})));
              reg111 <= ((reg101[(2'h2):(2'h2)] >>> ((^(~wire85)) ?
                      $unsigned(reg104) : reg86)) ?
                  (8'hb2) : reg83);
            end
          else
            begin
              reg110 <= $signed($signed((~|reg102[(4'hb):(4'h8)])));
              reg111 <= reg88[(4'h8):(1'h0)];
              reg112 <= ($unsigned((-$unsigned($signed(reg97)))) >> $unsigned((8'ha2)));
              reg113 <= (~|$unsigned($unsigned({reg105})));
            end
          if ((reg108 <= reg113[(2'h3):(2'h3)]))
            begin
              reg114 <= {$unsigned({reg103}),
                  ((reg83[(4'h8):(1'h1)] ?
                      (8'hb5) : $unsigned((reg109 ?
                          (8'hb0) : (8'hb4)))) > $signed(($signed(reg101) ?
                      wire77[(4'he):(3'h4)] : $signed(reg105))))};
              reg115 <= ((wire94[(1'h0):(1'h0)] ?
                  ($signed($unsigned(reg107)) ?
                      reg96 : reg87) : {wire78[(2'h2):(2'h2)]}) ~^ (($unsigned($unsigned((8'ha2))) ^~ $unsigned((reg82 <<< (7'h42)))) ?
                  reg107 : ({(reg102 ? reg108 : reg112), $signed(reg81)} ?
                      $unsigned(reg110[(3'h5):(2'h3)]) : $signed($signed(reg96)))));
              reg116 <= (({(~^wire76), $signed({reg105})} ?
                      $signed(reg110[(4'ha):(3'h4)]) : {(^$unsigned(reg96))}) ?
                  (reg114[(2'h2):(1'h0)] >>> (($signed((8'hb7)) != reg109) + ((reg107 ?
                          (8'h9e) : reg98) ?
                      $signed(reg106) : reg106[(1'h0):(1'h0)]))) : ($signed((reg107 << (8'h9c))) ?
                      reg115 : ((-reg104) ?
                          reg89 : (~&((7'h40) ? reg80 : reg101)))));
            end
          else
            begin
              reg114 <= wire77;
            end
          reg117 <= reg116;
          reg118 <= reg111[(1'h1):(1'h1)];
        end
      else
        begin
          reg109 <= ({$unsigned(reg111),
                  $unsigned($unsigned($unsigned(reg100)))} ?
              $signed((~^{(reg92 ^~ (8'ha6)),
                  reg118[(3'h4):(2'h3)]})) : {{$unsigned($signed((8'hbc)))}});
          reg110 <= $unsigned(wire93);
          reg111 <= (reg92 < $signed($unsigned($unsigned((reg92 >>> wire75)))));
        end
      if (reg106[(2'h3):(1'h0)])
        begin
          reg119 <= (8'ha5);
          reg120 <= (-((&{(reg108 || reg117)}) < $signed($unsigned(reg83[(4'h8):(3'h5)]))));
          if ($unsigned(($signed($signed((reg110 <= reg84))) ?
              reg97[(4'he):(3'h7)] : reg102)))
            begin
              reg121 <= (+reg105);
              reg122 <= (|(-((reg110 ^ $signed(reg112)) < (+{(8'hb9),
                  (8'hac)}))));
            end
          else
            begin
              reg121 <= reg121[(4'h8):(3'h6)];
              reg122 <= $unsigned(reg99);
            end
          reg123 <= (($signed(reg107) ?
                  (reg87 ~^ (~&$unsigned(reg97))) : $unsigned($unsigned((!(8'had))))) ?
              reg105 : ({($unsigned(wire93) - {reg87})} ?
                  reg118[(2'h2):(1'h0)] : $unsigned(reg81)));
        end
      else
        begin
          reg119 <= $signed($signed((reg103[(3'h4):(2'h3)] || ((reg101 * reg116) >= {reg117,
              reg101}))));
          if (((|$signed(reg89)) ?
              reg116[(3'h5):(1'h1)] : $signed((((wire94 << reg112) || (|(8'ha3))) && reg101[(1'h0):(1'h0)]))))
            begin
              reg120 <= {$signed($signed($unsigned((~wire76)))),
                  $unsigned($signed(((reg95 > reg101) >= reg115[(4'hc):(4'ha)])))};
              reg121 <= $unsigned({((8'hb9) == $unsigned(((7'h42) >>> reg96))),
                  ((wire93[(1'h1):(1'h1)] ? reg83 : (|reg110)) ?
                      (8'hae) : $unsigned($unsigned(reg110)))});
              reg122 <= $signed(reg114[(4'hb):(4'hb)]);
              reg123 <= (~|((8'hbe) | (((wire75 ^~ (8'hae)) ?
                      (reg114 > reg111) : $signed(reg104)) ?
                  $unsigned(reg105[(1'h1):(1'h0)]) : (~|(reg82 ~^ reg115)))));
              reg124 <= ((~(8'had)) >= {(reg82 ?
                      (^~(^(8'hb4))) : (+reg89[(3'h5):(3'h5)]))});
            end
          else
            begin
              reg120 <= reg87[(2'h2):(1'h0)];
              reg121 <= $signed(reg104);
              reg122 <= reg95[(1'h0):(1'h0)];
            end
        end
      if (reg92[(1'h1):(1'h0)])
        begin
          reg125 <= (($signed(reg104) ^~ $unsigned($signed(reg116))) ?
              $unsigned($signed(($signed(reg121) ?
                  (reg121 ?
                      reg103 : reg115) : $unsigned(wire85)))) : $unsigned((~|$signed((~|reg91)))));
          if ((reg122 ?
              ((8'hb1) >= {(+$signed(reg124))}) : {$signed((|reg119[(5'h14):(4'hf)])),
                  $unsigned(($unsigned(reg84) ? reg113 : (^~reg95)))}))
            begin
              reg126 <= reg97;
              reg127 <= $unsigned(reg96);
            end
          else
            begin
              reg126 <= $signed(reg119[(2'h2):(1'h0)]);
              reg127 <= (($unsigned((reg91[(3'h6):(2'h2)] ?
                  (reg89 - reg86) : (~|reg112))) & reg89[(1'h0):(1'h0)]) & $unsigned(($unsigned((reg127 * reg104)) ?
                  $signed($signed(reg96)) : $unsigned((8'hb4)))));
              reg128 <= reg80;
            end
        end
      else
        begin
          if (reg103[(4'hd):(4'hb)])
            begin
              reg125 <= reg117;
              reg126 <= $unsigned((($unsigned($unsigned(reg124)) ?
                      (+(reg84 ?
                          reg117 : wire79)) : $unsigned($unsigned(wire75))) ?
                  (|{$unsigned(reg120)}) : ($signed(reg90[(4'hc):(4'h8)]) ?
                      reg97[(5'h10):(3'h4)] : $signed(reg88[(4'hc):(3'h6)]))));
            end
          else
            begin
              reg125 <= $unsigned($signed($unsigned(($unsigned(wire76) ?
                  $signed(wire76) : reg116))));
              reg126 <= {(~&$signed({$unsigned(reg99)})),
                  reg115[(4'hc):(4'hc)]};
              reg127 <= (~(({wire85[(1'h0):(1'h0)], reg105[(4'h9):(4'h9)]} ?
                      $unsigned($unsigned(reg91)) : {$unsigned((7'h41)),
                          $unsigned(reg82)}) ?
                  $unsigned(reg125) : (8'hab)));
            end
          reg128 <= (({($unsigned(reg128) ? reg103 : reg90[(4'hb):(2'h3)])} ?
              reg119[(3'h5):(3'h5)] : (reg88[(4'hc):(3'h7)] ?
                  {$signed(reg125)} : ((~^reg113) ?
                      $signed((8'hbd)) : reg96[(1'h1):(1'h0)]))) >>> $signed(((~&{(8'hae),
                  reg101}) ?
              ((reg109 & (7'h41)) ?
                  $unsigned(wire77) : $signed(reg122)) : ({reg107, reg96} ?
                  (reg101 - reg103) : $unsigned(reg103)))));
          if (reg102)
            begin
              reg129 <= (((~&$signed($unsigned(reg104))) != reg99) | (wire76 ?
                  $unsigned(reg117) : (|$signed((~wire75)))));
              reg130 <= wire79;
              reg131 <= reg122[(3'h7):(1'h1)];
              reg132 <= {wire94};
            end
          else
            begin
              reg129 <= wire75[(2'h3):(2'h2)];
              reg130 <= ({(^((~|reg86) & (!reg110))),
                  ({$unsigned(reg125),
                      (reg126 >> reg81)} && (^~$unsigned(reg91)))} != reg96);
              reg131 <= ($unsigned($signed(($unsigned(wire75) <= (reg125 > reg98)))) ^ reg119[(3'h5):(3'h4)]);
              reg132 <= $unsigned($signed(($signed((reg120 ?
                  reg86 : wire85)) + $unsigned(reg100[(4'h9):(1'h1)]))));
              reg133 <= $signed((^~(&(-$unsigned((8'ha3))))));
            end
        end
    end
  assign wire134 = {{$signed(reg83[(4'hf):(1'h1)]), (~^$signed(reg96))}};
  assign wire135 = $signed(($unsigned(reg97) ?
                       wire77[(4'hc):(4'hc)] : {reg98}));
  always
    @(posedge clk) begin
      reg136 <= ((reg98[(4'h8):(1'h1)] + {((~^reg105) ?
                  $unsigned(reg96) : $signed(reg112)),
              $signed((^reg100))}) ?
          {reg109[(1'h1):(1'h0)],
              $signed((wire76[(3'h4):(1'h1)] ?
                  reg101[(2'h3):(1'h0)] : (reg103 ?
                      (8'hab) : reg82)))} : $signed(((~&$unsigned(reg108)) && $signed($unsigned(reg105)))));
      reg137 <= {({(reg111[(3'h4):(1'h1)] != $unsigned(reg121)),
                  $signed(reg82[(1'h0):(1'h0)])} ?
              (({reg109,
                  (8'h9c)} != (!reg127)) >= reg123[(4'h8):(3'h6)]) : $unsigned((^$unsigned(reg108)))),
          (reg123[(4'h8):(2'h2)] ~^ ((8'hb5) + reg118))};
      if (($unsigned($signed($signed({reg129}))) ?
          $unsigned((^~wire76[(2'h3):(1'h0)])) : (|(reg130[(4'ha):(2'h3)] ^~ wire134[(4'ha):(1'h0)]))))
        begin
          reg138 <= (((^~reg83) ?
                  $signed(reg99) : $unsigned(reg105[(4'hf):(4'ha)])) ?
              (reg97 ?
                  reg128 : ({wire135[(4'ha):(4'h9)]} ?
                      reg92 : reg89)) : (~^(((reg118 && wire79) ?
                      $signed(reg88) : (reg136 || reg83)) ?
                  ((^~wire78) ?
                      reg128 : {(8'hb3), reg100}) : ((-reg98) < (&reg83)))));
          if ((^reg91[(3'h4):(1'h1)]))
            begin
              reg139 <= reg111[(4'ha):(1'h1)];
              reg140 <= (wire77[(1'h0):(1'h0)] ?
                  (($signed({reg136}) || ((reg81 <<< reg84) - reg91)) >>> reg123) : (reg86 <= ($signed($unsigned(reg138)) || $signed(reg136[(1'h1):(1'h1)]))));
              reg141 <= ((wire93[(1'h1):(1'h1)] > $unsigned(reg105)) ?
                  (reg140 != ((^(reg87 ?
                      reg107 : reg97)) - ($unsigned(reg133) + (^reg140)))) : $signed(($signed($unsigned(wire94)) & (wire77 ?
                      (-reg81) : $unsigned(reg123)))));
              reg142 <= reg96;
            end
          else
            begin
              reg139 <= $unsigned((reg81 ?
                  ((&$signed(reg130)) ?
                      reg114[(4'hb):(3'h4)] : (&(8'hbd))) : $unsigned(reg107[(3'h7):(1'h0)])));
              reg140 <= {(~|$signed((~|{reg103, reg108}))),
                  $signed((^(8'ha4)))};
            end
          reg143 <= (~|(8'hb1));
          reg144 <= ((reg116 << $signed(reg125)) ?
              reg83[(1'h0):(1'h0)] : {reg129[(5'h10):(4'hd)]});
          reg145 <= reg143;
        end
      else
        begin
          reg138 <= (8'haa);
          reg139 <= $signed($unsigned(reg140));
          reg140 <= $signed($signed({{(reg125 - (8'ha2)), (reg81 >> wire85)},
              reg132[(3'h5):(1'h1)]}));
          reg141 <= ((reg132 ?
                  (!((8'hbf) ?
                      $unsigned(reg116) : (reg115 ?
                          reg90 : reg108))) : ((+reg99) ? (8'hb8) : reg131)) ?
              reg82[(3'h7):(3'h4)] : (~^($unsigned(((7'h42) | reg124)) ?
                  reg113[(3'h6):(3'h4)] : ($signed(reg113) ?
                      $signed(reg104) : (wire94 || reg88)))));
        end
      reg146 <= $unsigned($signed(reg130[(3'h7):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg147 <= reg145[(3'h5):(2'h2)];
    end
  assign wire148 = $unsigned((wire94[(1'h1):(1'h0)] ?
                       (^((reg144 ? (8'hbe) : reg104) ?
                           (reg139 & (8'h9c)) : {reg104})) : reg118[(1'h0):(1'h0)]));
  assign wire149 = $unsigned({$unsigned(reg84[(4'ha):(4'h9)]),
                       ((((8'hb5) | wire78) | $signed(reg141)) ?
                           reg86[(5'h14):(3'h6)] : ({reg142} ?
                               (reg133 == reg115) : $signed((8'haa))))});
  assign wire150 = $unsigned(reg108);
  assign wire151 = (reg130 && (reg88[(4'hc):(4'ha)] >>> ($unsigned(reg100) ?
                       {$signed(wire93),
                           (reg113 ? reg87 : reg90)} : (reg112 >= (reg104 ?
                           reg120 : reg113)))));
  assign wire152 = ((((~$unsigned(reg109)) && {reg139, (8'ha9)}) ?
                       {($unsigned(reg103) && (reg123 || reg105)),
                           (~^(8'hb2))} : reg117[(5'h10):(3'h7)]) + $signed((($signed((8'ha7)) ?
                           ((8'hb1) < reg100) : $unsigned(reg143)) ?
                       reg141 : reg124[(4'he):(2'h2)])));
  assign wire153 = ((~wire78) << reg110);
  assign wire154 = ($signed(((-$unsigned(reg130)) || $signed($unsigned(wire76)))) ?
                       {$signed((~(~&reg112))),
                           (wire85[(2'h2):(1'h1)] >>> reg117[(5'h10):(1'h1)])} : reg98[(3'h4):(2'h3)]);
  assign wire155 = (~|$unsigned((($signed(reg128) << wire85[(2'h3):(1'h0)]) <<< ((wire151 * wire85) ?
                       (reg139 ^~ reg146) : {reg131, reg84}))));
  assign wire156 = ($signed($signed(($signed(reg140) + {(8'hb3), reg112}))) ?
                       $unsigned($signed({wire93})) : reg109);
  assign wire157 = wire154[(1'h1):(1'h0)];
  assign wire158 = (reg146[(5'h10):(4'he)] ?
                       ($unsigned({{reg121}}) == ((~(~reg104)) ?
                           (~^{wire151}) : $signed({reg125}))) : (($unsigned((~reg119)) ?
                               {(reg84 >> reg140)} : {(^~reg81)}) ?
                           ((~reg110[(2'h2):(1'h0)]) >> reg129[(4'he):(2'h2)]) : reg86[(2'h2):(1'h0)]));
  assign wire159 = $unsigned($signed({{$signed(reg129), $unsigned(wire75)},
                       ((reg87 < wire134) ~^ $unsigned(wire75))}));
endmodule

module module46
#(parameter param66 = ((|((-{(8'hb4), (8'hbf)}) - {(~(8'hb7))})) ? ({((-(8'hb1)) ? (&(8'hab)) : (8'h9e))} ? (({(8'hb6)} ? {(8'hb3), (8'hb7)} : ((8'hbc) ? (8'hb6) : (8'hb8))) ? ({(8'ha2), (8'hb5)} ? ((8'hb0) ? (8'hac) : (8'had)) : {(8'hb3), (8'ha5)}) : (((8'hb4) ^ (8'had)) ? ((8'ha8) ? (8'hb2) : (8'ha3)) : ((8'ha7) && (7'h43)))) : (|((^(8'h9c)) << {(8'hb1), (8'hbf)}))) : ((&(((8'ha3) ? (8'hb6) : (8'h9c)) ? ((8'ha8) >>> (8'ha4)) : (&(8'hb5)))) ? (~|(((8'hb4) ? (8'hb6) : (8'h9e)) <<< (|(8'hbd)))) : {({(7'h43)} ? (|(8'hbe)) : ((8'hb9) < (8'ha9)))})), 
parameter param67 = {param66, param66})
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire51;
  input wire signed [(4'hf):(1'h0)] wire50;
  input wire signed [(2'h2):(1'h0)] wire49;
  input wire signed [(2'h2):(1'h0)] wire48;
  input wire signed [(5'h15):(1'h0)] wire47;
  wire signed [(3'h5):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire64;
  wire [(4'hd):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire62;
  wire [(5'h13):(1'h0)] wire61;
  wire [(5'h10):(1'h0)] wire60;
  wire signed [(4'ha):(1'h0)] wire52;
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire52,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire52 = $unsigned(((~$signed((wire48 ? wire48 : wire48))) ?
                      $signed((!(wire51 ^ (8'h9d)))) : $signed($unsigned((wire49 <<< wire51)))));
  always
    @(posedge clk) begin
      reg53 <= {($signed((wire51 <= (8'hb1))) ?
              ($signed(((8'ha5) ^ wire50)) * wire47[(4'hd):(1'h1)]) : $unsigned($unsigned(wire50))),
          (wire49 < $unsigned($unsigned($unsigned(wire50))))};
      reg54 <= ({($unsigned($unsigned(reg53)) ? wire52 : $signed(wire47))} ?
          reg53 : {wire52, wire49});
      reg55 <= $signed((reg54 * wire48[(1'h0):(1'h0)]));
      reg56 <= (8'ha5);
    end
  always
    @(posedge clk) begin
      reg57 <= reg56[(3'h5):(1'h1)];
      reg58 <= $unsigned((reg56 != (!reg53[(4'hf):(3'h5)])));
      reg59 <= (~^wire50[(1'h1):(1'h0)]);
    end
  assign wire60 = (~&(-reg54));
  assign wire61 = wire47[(1'h0):(1'h0)];
  assign wire62 = (((&($unsigned((8'hb1)) ?
                          ((8'hbf) ^~ reg54) : $signed(wire51))) ?
                      wire47 : wire48[(1'h1):(1'h1)]) <<< (wire52[(4'ha):(3'h7)] + $unsigned($unsigned($signed(reg55)))));
  assign wire63 = (((wire50[(2'h2):(2'h2)] ?
                          (reg54 ?
                              (wire61 ?
                                  reg56 : reg55) : (^wire52)) : wire62[(1'h0):(1'h0)]) + ((!(+(8'hae))) ?
                          $unsigned(wire47) : reg56[(4'hb):(4'h9)])) ?
                      $signed($signed($unsigned((wire49 || wire60)))) : (+(reg57 | $signed((wire49 >= wire50)))));
  assign wire64 = (|$signed((({wire47} <<< (|wire47)) > (reg56[(2'h2):(2'h2)] ?
                      ((8'hac) ? wire49 : wire48) : $unsigned(reg53)))));
  assign wire65 = ((~({wire49[(1'h1):(1'h0)]} ?
                          $unsigned($unsigned(wire47)) : ((wire63 && (8'ha2)) ?
                              $signed(wire62) : $signed(wire62)))) ?
                      $unsigned($unsigned((wire50 ?
                          {reg56} : $unsigned(wire63)))) : $unsigned(($unsigned((wire52 ?
                          (8'ha1) : reg53)) < wire60[(4'hf):(4'ha)])));
endmodule
