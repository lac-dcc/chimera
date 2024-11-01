module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire175;
  wire [(4'hc):(1'h0)] wire174;
  wire [(3'h7):(1'h0)] wire173;
  wire [(4'he):(1'h0)] wire172;
  wire [(3'h5):(1'h0)] wire166;
  wire signed [(4'h8):(1'h0)] wire164;
  wire [(5'h10):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  wire signed [(2'h3):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg171 = (1'h0);
  reg [(4'hc):(1'h0)] reg170 = (1'h0);
  reg [(3'h4):(1'h0)] reg169 = (1'h0);
  reg [(4'ha):(1'h0)] reg168 = (1'h0);
  reg [(4'hd):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire166,
                 wire164,
                 wire21,
                 wire20,
                 wire19,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = {$signed($unsigned((|$unsigned(wire1)))), wire3};
  assign wire6 = (+(($unsigned($unsigned(wire2)) ?
                         wire4[(1'h0):(1'h0)] : $unsigned($signed(wire4))) ?
                     wire0[(1'h0):(1'h0)] : wire1));
  assign wire7 = wire4[(1'h0):(1'h0)];
  assign wire8 = $unsigned((-(((wire6 ? wire2 : wire0) ?
                         {wire1, wire1} : $signed(wire7)) ?
                     wire5 : {(wire7 * wire1), wire4})));
  assign wire9 = (wire3 - wire7);
  always
    @(posedge clk) begin
      if ((wire4[(2'h2):(1'h0)] + (((&wire9[(4'hf):(3'h4)]) * {(wire3 ?
                  wire3 : wire2),
              wire8}) ?
          wire4 : wire3[(4'hb):(4'hb)])))
        begin
          if (({{{(~wire5), $unsigned(wire7)}}} ?
              (|wire7[(1'h1):(1'h0)]) : $unsigned(wire3[(3'h4):(3'h4)])))
            begin
              reg10 <= wire2[(3'h6):(1'h0)];
              reg11 <= ((wire4 >>> (({wire4} | (wire2 ?
                      wire5 : wire7)) ~^ $signed({(8'ha8)}))) ?
                  $signed(({{(8'h9c), wire0}, (+wire0)} ?
                      ($signed(wire1) ^~ (wire0 * wire5)) : (~^wire3[(3'h6):(1'h0)]))) : $unsigned(wire2));
            end
          else
            begin
              reg10 <= $unsigned({$signed((~|(wire4 >> (8'ha7)))),
                  ($signed((!wire3)) > (((8'hb9) ? wire1 : wire4) + wire8))});
              reg11 <= (-(($unsigned({reg10, wire3}) ?
                      wire5 : ($signed(wire6) ?
                          $unsigned(wire4) : $signed(wire9))) ?
                  $signed((8'hb2)) : (+(!wire8))));
              reg12 <= {wire4[(2'h3):(2'h3)],
                  (wire7 ? wire5 : reg11[(4'h8):(1'h0)])};
            end
          reg13 <= (!$unsigned((({wire9, wire0} ?
              wire9 : $signed(wire4)) ~^ $unsigned((wire7 >> wire1)))));
          reg14 <= wire5;
        end
      else
        begin
          reg10 <= wire5[(1'h0):(1'h0)];
          reg11 <= (wire8[(4'hb):(3'h7)] & wire8[(4'hb):(1'h1)]);
        end
      reg15 <= ($unsigned(wire3) ?
          $unsigned(reg10[(5'h11):(3'h5)]) : $signed(wire6));
      reg16 <= wire4;
      reg17 <= $unsigned((wire3[(3'h4):(1'h1)] ?
          $signed($unsigned($signed((8'ha9)))) : reg12[(2'h2):(1'h1)]));
      reg18 <= $signed($unsigned(({(reg10 >>> reg10)} >>> (wire2[(4'hd):(4'hd)] | (reg14 ?
          (8'ha8) : reg17)))));
    end
  assign wire19 = wire4;
  assign wire20 = {reg10,
                      $signed({$signed($signed(wire2)),
                          ((wire6 <= wire8) ?
                              reg11[(3'h5):(2'h3)] : $unsigned(wire0))})};
  assign wire21 = (((~|reg10[(5'h11):(3'h6)]) & wire19) << {wire0[(4'h9):(3'h4)]});
  module22 #() modinst165 (wire164, clk, wire9, wire8, wire2, wire4);
  assign wire166 = $signed((+wire1[(5'h14):(1'h0)]));
  always
    @(posedge clk) begin
      reg167 <= (|$unsigned({(|wire2[(2'h3):(1'h0)])}));
      reg168 <= $unsigned($unsigned($signed(wire3)));
      reg169 <= wire5[(4'hb):(1'h1)];
      reg170 <= reg168;
      reg171 <= (&($unsigned(($signed(wire6) ?
          (wire7 - wire21) : reg15)) <= (~^wire166[(3'h5):(3'h4)])));
    end
  assign wire172 = ($unsigned((~&wire6[(4'ha):(3'h6)])) | reg167[(1'h0):(1'h0)]);
  assign wire173 = $signed(wire20[(1'h0):(1'h0)]);
  assign wire174 = wire6[(5'h12):(4'hf)];
  assign wire175 = $signed($unsigned({wire20}));
endmodule

module module22  (y, clk, wire23, wire24, wire25, wire26);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire23;
  input wire signed [(5'h12):(1'h0)] wire24;
  input wire signed [(5'h15):(1'h0)] wire25;
  input wire [(5'h15):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire163;
  wire signed [(5'h14):(1'h0)] wire162;
  wire signed [(4'he):(1'h0)] wire160;
  wire signed [(5'h10):(1'h0)] wire131;
  wire signed [(4'hc):(1'h0)] wire130;
  wire signed [(3'h7):(1'h0)] wire129;
  wire [(4'hf):(1'h0)] wire128;
  wire signed [(3'h4):(1'h0)] wire127;
  wire [(4'hd):(1'h0)] wire126;
  wire signed [(4'h9):(1'h0)] wire125;
  wire [(4'h9):(1'h0)] wire123;
  wire [(3'h6):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire66;
  wire signed [(4'he):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire28;
  wire [(5'h15):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire63;
  reg [(5'h11):(1'h0)] reg132 = (1'h0);
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg134 = (1'h0);
  reg [(4'hd):(1'h0)] reg135 = (1'h0);
  reg [(5'h15):(1'h0)] reg136 = (1'h0);
  reg [(3'h6):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg139 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire160,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire123,
                 wire67,
                 wire66,
                 wire65,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire63,
                 reg132,
                 reg133,
                 reg134,
                 reg135,
                 reg136,
                 reg137,
                 reg138,
                 reg139,
                 (1'h0)};
  assign wire27 = wire24[(4'hb):(4'ha)];
  assign wire28 = $unsigned($signed(wire26[(1'h1):(1'h1)]));
  assign wire29 = ({((wire24[(4'hf):(1'h0)] <<< wire24[(3'h7):(3'h7)]) != ((wire26 ?
                          wire28 : wire23) ^ (~&(7'h44)))),
                      wire27[(2'h2):(2'h2)]} ^ {wire24[(3'h7):(1'h1)]});
  assign wire30 = wire28[(1'h1):(1'h1)];
  assign wire31 = wire25;
  module32 #() modinst64 (.clk(clk), .wire34(wire28), .wire36(wire31), .wire37(wire29), .wire33(wire24), .wire35(wire26), .y(wire63));
  assign wire65 = wire30;
  assign wire66 = ((({(^~wire63)} ?
                          (&$signed(wire25)) : $unsigned($signed(wire28))) && (wire63[(1'h0):(1'h0)] + wire24[(4'he):(4'hd)])) ?
                      wire28[(2'h3):(1'h1)] : (~|$unsigned($unsigned((wire65 ~^ wire30)))));
  assign wire67 = $unsigned(wire31);
  module68 #() modinst124 (.y(wire123), .wire69(wire65), .wire71(wire66), .clk(clk), .wire70(wire24), .wire72(wire29));
  assign wire125 = wire26[(3'h6):(3'h5)];
  assign wire126 = (|$unsigned(((8'hb2) ?
                       $signed(wire30[(1'h1):(1'h0)]) : (+((8'h9e) ?
                           wire63 : wire67)))));
  assign wire127 = $unsigned((8'hb9));
  assign wire128 = wire24;
  assign wire129 = $signed($signed($unsigned((wire27 <<< (wire29 ?
                       (8'ha1) : wire30)))));
  assign wire130 = $unsigned({(~^$unsigned(wire25[(3'h6):(2'h3)]))});
  assign wire131 = $signed($unsigned($unsigned($unsigned($signed(wire130)))));
  always
    @(posedge clk) begin
      if (wire126[(4'h9):(3'h4)])
        begin
          reg132 <= $unsigned(($signed(wire66) * $signed($signed($signed(wire65)))));
          reg133 <= (8'hbf);
          reg134 <= {{wire24[(3'h6):(2'h2)]}};
          reg135 <= wire25;
        end
      else
        begin
          if ((reg135[(3'h4):(2'h3)] * wire130[(1'h1):(1'h0)]))
            begin
              reg132 <= $signed(wire65);
              reg133 <= ($unsigned((8'ha3)) ?
                  wire67[(3'h5):(3'h4)] : ($unsigned($unsigned($signed(wire23))) >> $signed(($signed(wire127) & (!wire30)))));
              reg134 <= $unsigned($unsigned((~&wire125[(3'h6):(3'h6)])));
            end
          else
            begin
              reg132 <= ((^((-wire129) ?
                  $unsigned(wire66) : ((8'hb2) ?
                      reg132[(5'h10):(5'h10)] : $unsigned(wire31)))) || $unsigned(($unsigned(reg135) ?
                  wire126 : (~&$unsigned(wire127)))));
              reg133 <= (~|({$signed((wire123 - wire27))} ?
                  ((wire66 ?
                      wire26 : (reg133 >>> wire29)) | wire23) : ($unsigned(wire29) ?
                      (^~$unsigned(wire131)) : wire129[(2'h3):(1'h0)])));
              reg134 <= $signed($signed(wire129[(3'h4):(2'h3)]));
              reg135 <= $unsigned((8'hb0));
              reg136 <= ((^~((&wire29[(5'h14):(5'h11)]) ^~ (+$unsigned((8'h9f))))) ^~ (~^(8'ha5)));
            end
          reg137 <= wire127;
          reg138 <= ({(wire123 <= reg136),
              ((wire25[(3'h7):(2'h2)] || reg132) ?
                  (wire25[(1'h1):(1'h1)] ?
                      (reg133 >>> wire67) : (wire25 == wire23)) : wire128)} - (wire131[(4'hf):(4'h9)] > ($signed((reg132 ?
              wire130 : (8'hb9))) >> {(reg136 | reg132), (~|wire25)})));
          reg139 <= $unsigned((8'hb6));
        end
    end
  module140 #() modinst161 (.wire144(wire29), .clk(clk), .wire145(reg135), .wire143(wire129), .wire141(wire23), .wire142(wire128), .y(wire160));
  assign wire162 = reg135;
  assign wire163 = (~^(~|$signed(((wire26 ? reg132 : reg136) <= (wire23 ?
                       wire128 : wire66)))));
endmodule

module module140
#(parameter param159 = {(({((8'hb8) ^ (8'hbb)), (|(8'hb2))} << {((8'haa) & (8'hbf))}) != (((+(8'hb6)) ? ((8'hbf) ? (8'ha8) : (8'ha4)) : ((8'hb1) ? (7'h40) : (7'h40))) < {(~(8'hb5))}))})
(y, clk, wire145, wire144, wire143, wire142, wire141);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire145;
  input wire [(5'h11):(1'h0)] wire144;
  input wire [(3'h7):(1'h0)] wire143;
  input wire [(3'h7):(1'h0)] wire142;
  input wire [(2'h3):(1'h0)] wire141;
  wire signed [(4'h9):(1'h0)] wire158;
  wire [(3'h7):(1'h0)] wire157;
  wire signed [(5'h13):(1'h0)] wire156;
  wire [(4'hc):(1'h0)] wire155;
  wire [(5'h15):(1'h0)] wire154;
  wire signed [(3'h7):(1'h0)] wire153;
  wire signed [(4'hb):(1'h0)] wire152;
  wire signed [(4'ha):(1'h0)] wire151;
  wire signed [(5'h15):(1'h0)] wire150;
  wire signed [(4'h8):(1'h0)] wire149;
  wire signed [(5'h13):(1'h0)] wire148;
  wire signed [(4'hc):(1'h0)] wire147;
  wire [(3'h6):(1'h0)] wire146;
  assign y = {wire158,
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
                 wire147,
                 wire146,
                 (1'h0)};
  assign wire146 = $unsigned(wire145[(3'h5):(1'h0)]);
  assign wire147 = $signed(((!(wire143 ?
                           (~^wire143) : wire143[(2'h2):(1'h0)])) ?
                       {(^wire143[(3'h5):(3'h5)])} : {wire144,
                           ((wire141 || wire142) || wire142[(3'h6):(3'h5)])}));
  assign wire148 = wire143;
  assign wire149 = $signed(($unsigned(wire144) ?
                       wire143 : ($unsigned($signed(wire143)) + ($unsigned(wire148) ?
                           (8'hbf) : $signed(wire142)))));
  assign wire150 = ($signed(wire141[(2'h2):(2'h2)]) ?
                       (8'ha5) : $unsigned($unsigned($unsigned($signed(wire148)))));
  assign wire151 = ((7'h41) && ((~($signed(wire149) || wire141[(1'h1):(1'h0)])) ?
                       (!((^(8'h9d)) && (&wire148))) : (~|$unsigned((wire147 ?
                           wire143 : wire150)))));
  assign wire152 = (((^~$signed((!wire150))) == $unsigned((~|(wire146 ?
                       wire144 : wire142)))) * wire144);
  assign wire153 = $unsigned((($unsigned($signed(wire148)) < ((wire144 ~^ wire143) ?
                       ((8'h9d) || wire152) : $signed(wire149))) | {(((8'hbc) ?
                               wire146 : wire152) ?
                           $unsigned(wire149) : (wire149 ?
                               wire149 : wire149))}));
  assign wire154 = (~|$unsigned((|$signed((&wire152)))));
  assign wire155 = $signed((8'ha4));
  assign wire156 = (({(wire152[(3'h5):(3'h4)] ? wire149 : (|wire149)),
                               wire147} ?
                           {(-$signed((7'h43)))} : wire144) ?
                       wire149 : $unsigned(wire154[(4'hd):(3'h4)]));
  assign wire157 = wire149;
  assign wire158 = wire157;
endmodule

module module68
#(parameter param121 = {((8'h9e) < ((((8'hb5) ? (8'ha6) : (8'ha8)) <<< ((7'h44) || (7'h43))) ? (((8'hb8) ? (8'hab) : (8'hb3)) ? ((7'h44) ? (8'ha2) : (8'hae)) : ((7'h42) >>> (8'hbc))) : (|{(8'hbd)}))), ({(!((8'hb0) ? (8'hb6) : (8'hb8)))} < ((((8'haf) ? (8'hb0) : (8'hb4)) == ((8'hab) ? (8'ha1) : (7'h44))) ? (+{(8'ha1), (8'hb0)}) : {{(8'haa), (7'h43)}, (8'ha5)}))}, 
parameter param122 = param121)
(y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h233):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire72;
  input wire signed [(4'hf):(1'h0)] wire71;
  input wire [(4'h8):(1'h0)] wire70;
  input wire [(4'he):(1'h0)] wire69;
  wire signed [(5'h15):(1'h0)] wire120;
  wire signed [(4'h8):(1'h0)] wire119;
  wire signed [(4'he):(1'h0)] wire118;
  wire [(5'h13):(1'h0)] wire117;
  wire [(4'hf):(1'h0)] wire116;
  wire [(5'h13):(1'h0)] wire115;
  wire signed [(3'h7):(1'h0)] wire114;
  wire signed [(4'h8):(1'h0)] wire113;
  wire [(4'hf):(1'h0)] wire112;
  wire [(5'h10):(1'h0)] wire84;
  wire signed [(4'hf):(1'h0)] wire83;
  wire [(4'hf):(1'h0)] wire82;
  wire signed [(4'h8):(1'h0)] wire81;
  wire signed [(5'h11):(1'h0)] wire80;
  wire signed [(5'h14):(1'h0)] wire79;
  wire signed [(3'h7):(1'h0)] wire78;
  wire signed [(3'h7):(1'h0)] wire77;
  wire [(5'h14):(1'h0)] wire76;
  wire signed [(2'h2):(1'h0)] wire75;
  wire signed [(4'ha):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire73;
  reg [(3'h4):(1'h0)] reg111 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg [(5'h11):(1'h0)] reg109 = (1'h0);
  reg [(4'hd):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg107 = (1'h0);
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg98 = (1'h0);
  reg [(4'hf):(1'h0)] reg97 = (1'h0);
  reg [(4'h8):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg94 = (1'h0);
  reg [(4'hd):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(5'h11):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg85 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
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
  assign wire73 = wire69;
  assign wire74 = $signed(($unsigned($signed((&wire70))) ?
                      (~^(+wire69)) : (~(wire71 + (wire72 <= (8'ha4))))));
  assign wire75 = wire71[(3'h5):(1'h1)];
  assign wire76 = (8'hb8);
  assign wire77 = {(8'h9f),
                      (!(($unsigned(wire69) ?
                              (wire70 ?
                                  wire75 : wire70) : wire76[(2'h2):(1'h0)]) ?
                          wire73[(5'h13):(5'h12)] : {wire73[(4'h8):(4'h8)]}))};
  assign wire78 = $unsigned(wire74[(2'h3):(1'h0)]);
  assign wire79 = $signed(((^~$unsigned((wire69 + (8'hb5)))) ?
                      wire71 : {((wire77 <<< wire78) <= (wire73 ?
                              wire69 : wire76))}));
  assign wire80 = wire72[(4'ha):(1'h0)];
  assign wire81 = ((($signed((wire77 ? wire80 : wire79)) ?
                          {$unsigned(wire72),
                              (|wire80)} : wire72[(1'h0):(1'h0)]) && $unsigned((8'had))) ?
                      $unsigned((((wire74 ~^ (8'hbc)) >>> wire71) + {(wire76 ?
                              wire80 : wire75)})) : $signed((wire76 >>> $unsigned(wire77))));
  assign wire82 = wire75;
  assign wire83 = (($unsigned(wire80[(4'hc):(3'h6)]) ?
                      $signed($unsigned(wire78)) : (((8'hbf) <<< (~^wire76)) ?
                          (!$unsigned(wire78)) : ((+wire75) & wire82))) | wire72);
  assign wire84 = {$unsigned((~&$signed((^wire71))))};
  always
    @(posedge clk) begin
      reg85 <= $unsigned((8'had));
      if ({($signed($unsigned(wire78)) > {((wire84 ?
                  reg85 : (8'ha3)) >> wire78[(3'h6):(1'h1)]),
              ($unsigned(wire81) ?
                  $signed(reg85) : (reg85 ? wire69 : wire70))}),
          (~|wire82[(1'h1):(1'h1)])})
        begin
          reg86 <= (wire79 | $unsigned({$signed((|wire77))}));
          reg87 <= ($unsigned(($unsigned((wire84 ~^ reg86)) ?
                  (~wire71) : $signed($signed(wire78)))) ?
              ((^~($signed(wire83) != (8'ha2))) ?
                  wire69[(4'hd):(4'hb)] : (^(7'h40))) : ((-wire76[(4'hb):(1'h1)]) != {(-(wire81 * (8'haf))),
                  wire70[(3'h7):(3'h4)]}));
        end
      else
        begin
          reg86 <= ($signed((^~((^wire81) || (wire72 ?
              wire79 : wire70)))) >>> $signed($unsigned($signed((wire69 ?
              wire83 : wire78)))));
          if ($signed((8'hb5)))
            begin
              reg87 <= wire83[(4'h8):(2'h3)];
              reg88 <= $unsigned(($unsigned($signed((wire72 ?
                      wire71 : wire77))) ?
                  wire77[(3'h6):(3'h5)] : $signed(((wire73 ?
                      (8'hbd) : reg86) == wire75[(1'h1):(1'h0)]))));
              reg89 <= (wire78[(3'h4):(2'h2)] != {wire75[(1'h0):(1'h0)]});
              reg90 <= $signed(((wire77 ?
                  (!$unsigned(wire76)) : (&wire71[(2'h2):(1'h1)])) > reg87));
              reg91 <= (~&(({(-reg88)} ?
                  $signed((^~wire77)) : (wire74[(4'ha):(3'h4)] ^ (!wire82))) << $unsigned($unsigned((~|wire73)))));
            end
          else
            begin
              reg87 <= $unsigned($unsigned(((wire69[(2'h3):(2'h2)] ?
                  ((8'h9e) & reg89) : reg90[(4'h9):(1'h0)]) >>> wire69[(2'h3):(1'h0)])));
              reg88 <= {wire83[(3'h5):(1'h1)], wire83[(3'h6):(3'h6)]};
              reg89 <= (($unsigned(((8'ha3) <= $signed(reg86))) ?
                      wire69[(3'h7):(1'h1)] : {$unsigned((reg89 ?
                              (8'hb0) : wire73)),
                          $signed({(8'haa), reg90})}) ?
                  (7'h43) : (!{({wire77, reg85} ? (reg91 != reg89) : (8'ha4)),
                      {(-wire74)}}));
            end
          reg92 <= (&((!$unsigned((wire69 * wire70))) ~^ (wire76[(1'h1):(1'h1)] || (wire72 ?
              wire82 : {wire69, (8'ha4)}))));
          reg93 <= reg91[(3'h7):(1'h1)];
        end
      if (((~^$signed((!(reg90 ^ reg85)))) - reg85[(3'h7):(3'h7)]))
        begin
          if (wire73)
            begin
              reg94 <= ($signed($signed(wire82[(4'he):(3'h7)])) ?
                  (~(|((~reg88) ?
                      {reg85, (8'hb5)} : (wire81 ?
                          reg85 : wire71)))) : $unsigned(((^~reg89[(3'h4):(1'h0)]) ?
                      reg92[(4'ha):(2'h3)] : ((-wire83) ?
                          $unsigned(reg93) : (reg89 ? reg93 : wire78)))));
              reg95 <= ($unsigned($signed(wire76[(3'h6):(1'h1)])) ^ ($unsigned(($unsigned((8'hac)) ?
                      reg91 : reg91[(1'h1):(1'h0)])) ?
                  (reg94[(4'ha):(3'h6)] || ((|reg91) ?
                      wire74[(4'ha):(3'h5)] : wire83)) : $unsigned(wire84[(1'h0):(1'h0)])));
              reg96 <= $unsigned(reg95[(1'h0):(1'h0)]);
            end
          else
            begin
              reg94 <= ({(~^$signed($signed(wire80)))} >= reg86[(2'h2):(2'h2)]);
              reg95 <= reg87[(1'h0):(1'h0)];
              reg96 <= (&(!$unsigned(((~|reg88) ?
                  $signed((8'ha0)) : reg89[(1'h1):(1'h0)]))));
              reg97 <= $unsigned($unsigned($signed(($unsigned((8'hb8)) + ((7'h42) ?
                  reg87 : wire79)))));
              reg98 <= $unsigned($unsigned({reg93}));
            end
          if (wire79)
            begin
              reg99 <= $unsigned({(8'hb5),
                  ((wire70[(3'h6):(3'h6)] ?
                          wire84[(3'h5):(3'h4)] : reg86[(3'h4):(1'h1)]) ?
                      (((8'hbb) ? (8'ha1) : reg92) ?
                          $signed(reg88) : (+reg92)) : (wire83 ?
                          wire76[(1'h0):(1'h0)] : $signed(reg98)))});
              reg100 <= wire80[(4'h9):(3'h7)];
            end
          else
            begin
              reg99 <= ((((8'hbb) == $signed(((8'had) ?
                      wire72 : wire76))) >>> reg97[(4'he):(4'ha)]) ?
                  (-reg87) : $unsigned($signed($unsigned({wire83}))));
              reg100 <= (reg95[(1'h1):(1'h1)] ?
                  wire72 : $signed(($unsigned((^reg90)) ?
                      {$unsigned((8'hbb))} : {$unsigned((8'ha9)),
                          (reg91 != (8'hba))})));
            end
          reg101 <= (($unsigned((reg96 ~^ reg97)) ?
                  wire75[(1'h0):(1'h0)] : (reg94 <<< $signed($unsigned(wire74)))) ?
              ($unsigned(wire74) * $unsigned(wire74[(3'h7):(1'h1)])) : $unsigned(reg87));
          reg102 <= $signed((((~^(wire80 ? reg91 : wire80)) ?
              (reg99 ~^ (8'hbd)) : ($signed((7'h42)) >> $unsigned(wire82))) >> $signed(reg91)));
          reg103 <= ((|$signed(reg91[(2'h2):(2'h2)])) ^ {((wire82 ?
                  $unsigned(wire78) : (+wire71)) > ((reg96 ?
                  (8'hb1) : reg90) || (wire81 ^ wire69)))});
        end
      else
        begin
          if ((wire83[(2'h3):(1'h1)] | $signed({(wire76[(2'h2):(1'h0)] ?
                  $unsigned(reg95) : (reg101 ? reg85 : reg88))})))
            begin
              reg94 <= ((wire77[(3'h6):(2'h2)] ^ (~reg100)) <= $unsigned((((8'hbb) ^~ ((7'h42) ?
                  (8'hb2) : wire69)) < wire82[(4'hb):(3'h4)])));
              reg95 <= ((^{$unsigned($unsigned((7'h43))), reg93}) ^~ wire75);
              reg96 <= $signed(wire73);
              reg97 <= $signed($unsigned($unsigned($unsigned(reg100[(2'h3):(1'h0)]))));
              reg98 <= reg102[(3'h5):(1'h0)];
            end
          else
            begin
              reg94 <= reg94[(4'hb):(3'h7)];
            end
          reg99 <= wire77[(1'h0):(1'h0)];
          reg100 <= (reg92[(4'hc):(3'h6)] << (&$unsigned(($signed((8'hb7)) ?
              $signed((8'hbb)) : wire69[(4'hc):(1'h1)]))));
          if (($unsigned((-(!$unsigned(reg103)))) ?
              (-(reg95[(1'h1):(1'h1)] ~^ reg93)) : ((reg85[(2'h3):(1'h0)] ?
                  wire76 : $unsigned($signed(reg103))) >>> $unsigned({$signed(reg102)}))))
            begin
              reg101 <= reg90[(3'h5):(3'h5)];
              reg102 <= wire69[(4'hb):(1'h0)];
              reg103 <= (8'hac);
              reg104 <= ($signed(reg89[(3'h5):(2'h2)]) ?
                  $signed({wire73[(5'h11):(4'ha)]}) : (8'hbe));
              reg105 <= ((wire78 ?
                      ((&$signed((8'ha4))) ?
                          ((wire82 >= reg97) << wire70[(3'h7):(2'h3)]) : (reg104 ?
                              (wire82 >> reg86) : $unsigned(reg85))) : (8'had)) ?
                  $unsigned(wire79) : ($unsigned(wire82[(4'hf):(1'h1)]) ?
                      $unsigned(($unsigned(wire75) == (^~reg99))) : {(reg90 >>> wire79[(4'hd):(4'h9)])}));
            end
          else
            begin
              reg101 <= (wire77[(1'h0):(1'h0)] > (((&(wire76 ?
                      wire70 : wire82)) ?
                  (|$signed(reg102)) : wire73) <<< reg100[(3'h5):(2'h2)]));
              reg102 <= $unsigned((wire74[(3'h5):(2'h3)] << wire75));
            end
          if (wire79[(5'h14):(5'h11)])
            begin
              reg106 <= ((reg89 ?
                  $unsigned(($signed(wire81) | ((8'hba) ~^ (8'hb5)))) : (8'ha0)) && reg104);
              reg107 <= ($unsigned((^$unsigned($unsigned(wire69)))) ?
                  reg105 : wire69);
              reg108 <= reg97;
              reg109 <= ($signed({({(8'ha6)} - $signed(wire84))}) ?
                  (wire78 && reg107[(4'ha):(4'h8)]) : reg96[(3'h6):(3'h5)]);
              reg110 <= ((-reg101[(4'hf):(4'h9)]) ?
                  wire76[(1'h0):(1'h0)] : (wire80 - $unsigned(wire76)));
            end
          else
            begin
              reg106 <= (($unsigned((^~(~|wire76))) >> ($signed((reg102 ^~ reg102)) ?
                      ($signed(reg88) ?
                          $signed(reg98) : $unsigned(reg99)) : (reg88[(4'h9):(3'h4)] ?
                          reg91 : (reg86 >= (8'hb4))))) ?
                  $unsigned(reg88[(4'h8):(3'h5)]) : {reg100,
                      reg101[(4'h8):(2'h3)]});
              reg107 <= (~((((~&reg102) ~^ ((8'hac) ? reg100 : wire76)) ?
                      $unsigned(wire78) : ({reg88, wire69} ?
                          $signed(wire84) : reg108)) ?
                  $signed($unsigned(((8'hab) == reg103))) : reg95[(1'h1):(1'h1)]));
              reg108 <= $unsigned($unsigned(wire70[(2'h3):(2'h3)]));
              reg109 <= (wire69 || $signed($unsigned(((~|(8'hbe)) < $unsigned(wire84)))));
              reg110 <= $unsigned(((+reg93) < wire82));
            end
        end
      reg111 <= (($unsigned($unsigned($signed(wire75))) ^~ $unsigned((8'had))) ?
          (-(~^(!(reg110 ? wire69 : reg100)))) : {reg87});
    end
  assign wire112 = $unsigned($unsigned(reg109));
  assign wire113 = {$signed($signed(reg106[(1'h0):(1'h0)])), wire73};
  assign wire114 = reg108[(2'h2):(1'h0)];
  assign wire115 = $signed(((wire80 == (wire79[(3'h6):(1'h0)] ?
                       wire73 : reg103[(3'h6):(3'h6)])) ^ $signed((&wire73))));
  assign wire116 = reg94;
  assign wire117 = (|(~^wire116));
  assign wire118 = (~&{$unsigned({{reg104}}), (~&(|wire77[(3'h7):(1'h1)]))});
  assign wire119 = ($signed((reg107 < (wire117 ?
                       (reg102 << wire74) : reg91[(4'he):(4'ha)]))) || ({reg86[(2'h2):(1'h1)],
                           ((wire113 == reg91) ?
                               (wire114 ?
                                   reg95 : reg100) : (wire80 >>> wire83))} ?
                       ($unsigned($signed(reg85)) || ($unsigned(wire82) ?
                           (wire70 >= reg97) : (~|reg89))) : (wire115[(4'he):(4'h8)] ?
                           ((~reg108) ?
                               (wire78 & reg106) : $unsigned(wire82)) : $unsigned(((8'hb5) ?
                               reg98 : reg106)))));
  assign wire120 = ({$unsigned(((-reg99) ?
                           (reg101 >= (8'hb4)) : {reg98, reg105})),
                       (&(8'hb1))} ^ (wire118 <= (({wire81, wire69} ?
                       $unsigned(wire80) : wire76) & (&(~|reg105)))));
endmodule

module module32
#(parameter param61 = (((({(8'haf)} < (~^(8'h9f))) * (|{(8'h9c), (8'ha7)})) >= ((((8'hb0) ~^ (8'hbd)) & ((8'hb8) ? (7'h40) : (8'ha2))) | {((8'ha0) ? (8'ha9) : (8'h9d)), ((8'h9c) ? (8'hbe) : (8'h9e))})) > ({(((8'hb5) < (8'hbd)) > {(8'ha7), (8'h9f)})} || (((&(8'ha8)) + ((8'hbe) <= (8'hb7))) - {((8'ha3) ? (8'ha9) : (7'h40))}))), 
parameter param62 = (~^(param61 ? (((param61 >= (8'hb3)) <= (!param61)) ? ((param61 || (8'hac)) * {param61}) : ((!param61) != (param61 ? param61 : param61))) : ({{param61}, param61} ? {(~&param61)} : (8'hbb)))))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire37;
  input wire [(4'he):(1'h0)] wire36;
  input wire [(5'h15):(1'h0)] wire35;
  input wire [(5'h12):(1'h0)] wire34;
  input wire signed [(5'h11):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire59;
  wire [(4'hb):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire38;
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire38 = (~(8'hb7));
  assign wire39 = $signed((wire36[(2'h2):(2'h2)] ?
                      wire33[(4'ha):(3'h5)] : wire38));
  assign wire40 = $unsigned((wire35[(2'h3):(2'h3)] == (($signed(wire37) && $signed(wire34)) ?
                      wire39 : $signed((wire39 && (8'hb9))))));
  assign wire41 = {{((wire39 ? $unsigned(wire39) : {wire37}) ~^ wire33)},
                      {wire37[(2'h3):(2'h3)]}};
  always
    @(posedge clk) begin
      reg42 <= wire34;
      reg43 <= wire37[(3'h6):(2'h3)];
    end
  assign wire44 = $unsigned(wire34);
  assign wire45 = $unsigned(wire38[(3'h6):(3'h6)]);
  assign wire46 = $unsigned((8'haf));
  assign wire47 = $signed($unsigned($unsigned(wire45)));
  assign wire48 = (~^wire33[(1'h1):(1'h1)]);
  assign wire49 = ($signed(wire37) ?
                      (wire38[(4'h8):(2'h2)] ?
                          $signed({wire44[(2'h2):(1'h1)]}) : $unsigned(wire40)) : $unsigned((!$unsigned(wire36[(4'he):(4'hb)]))));
  assign wire50 = {((8'ha4) ?
                          (wire49 >>> ((wire41 ? wire37 : wire36) ?
                              (wire34 + wire48) : (+wire35))) : wire47)};
  assign wire51 = ((-wire40) * wire36[(4'hb):(3'h4)]);
  assign wire52 = $unsigned($signed(wire44));
  assign wire53 = wire35;
  assign wire54 = $unsigned((((wire50 ?
                          wire44 : ((8'haa) <<< wire39)) > (wire37[(3'h4):(1'h1)] ?
                          $unsigned(wire37) : $signed(wire45))) ?
                      $signed($unsigned(reg42[(2'h3):(1'h0)])) : reg42));
  assign wire55 = (&$unsigned(wire35[(4'he):(4'he)]));
  assign wire56 = $signed({$unsigned($unsigned($unsigned(wire45))),
                      (((~|wire48) ? wire55[(1'h1):(1'h1)] : {reg42}) ?
                          reg42 : (wire36[(4'h8):(2'h3)] ?
                              {wire35} : (wire46 ? wire54 : wire50)))});
  assign wire57 = (&(($unsigned(wire40) ?
                      wire52[(1'h1):(1'h0)] : $unsigned($signed(wire53))) || wire39));
  assign wire58 = (wire47[(4'h8):(2'h3)] ?
                      reg43[(4'hb):(4'h9)] : ($signed(wire56[(4'hd):(4'hb)]) ?
                          (~$signed($unsigned(wire34))) : ($unsigned({wire47,
                              wire55}) > (reg43 <<< (wire56 <<< wire53)))));
  assign wire59 = $signed($signed($unsigned($unsigned($unsigned(wire34)))));
  assign wire60 = ({wire34, ($unsigned($unsigned(wire58)) > (|wire44))} ?
                      ((!(wire48 ^ (|wire48))) >= $unsigned(wire36[(2'h3):(2'h3)])) : ($signed($unsigned(wire58[(3'h6):(3'h5)])) == $unsigned($unsigned($signed(wire55)))));
endmodule
