module top
#(parameter param169 = ({{(((7'h43) <<< (8'ha0)) ? ((7'h44) ? (8'hab) : (8'ha4)) : (~^(8'hbe)))}} ? (((((7'h44) >= (8'hb0)) ? ((8'ha4) ? (8'hb4) : (8'ha2)) : {(8'hbd)}) & (((8'hbb) ? (8'ha4) : (8'h9e)) ? (~^(8'hbb)) : ((8'hb1) | (8'hb4)))) + (~((~(8'hab)) ^~ (!(8'hbe))))) : ((+((^~(7'h42)) ? (~|(8'ha1)) : ((8'ha6) >>> (7'h44)))) ? ((8'hb9) ? (8'ha9) : {((8'hb8) ? (7'h44) : (8'hb5))}) : {(^(|(8'ha5)))})), 
parameter param170 = (+param169))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h184):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire168;
  wire signed [(4'he):(1'h0)] wire167;
  wire [(5'h11):(1'h0)] wire166;
  wire [(4'ha):(1'h0)] wire165;
  wire signed [(5'h13):(1'h0)] wire164;
  wire signed [(4'hc):(1'h0)] wire161;
  wire [(5'h11):(1'h0)] wire160;
  wire [(5'h12):(1'h0)] wire158;
  wire signed [(4'h8):(1'h0)] wire157;
  wire signed [(5'h14):(1'h0)] wire156;
  wire signed [(5'h12):(1'h0)] wire155;
  wire [(4'hf):(1'h0)] wire154;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire152;
  reg signed [(5'h12):(1'h0)] reg163 = (1'h0);
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire161,
                 wire160,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire37,
                 wire25,
                 wire14,
                 wire13,
                 wire12,
                 wire4,
                 wire152,
                 reg163,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  assign wire4 = ((wire0[(3'h5):(1'h1)] ?
                     $unsigned({{wire3, wire3}}) : {wire3,
                         (&(~^wire2))}) == ((!(~(wire3 ? wire3 : wire2))) ?
                     wire3 : $signed(({wire0, wire0} ?
                         $signed(wire3) : wire2))));
  always
    @(posedge clk) begin
      if ((wire3 ?
          ($signed((wire0 ? wire0[(4'h8):(3'h5)] : (wire2 >> wire3))) ?
              {$unsigned($signed(wire0)),
                  wire2} : $signed({(wire0 >>> wire0)})) : wire2))
        begin
          reg5 <= (($signed((~^wire2)) < $unsigned({$signed(wire0), wire0})) ?
              (|((~|(wire2 ? wire2 : wire3)) ?
                  {(wire2 || wire3), $unsigned(wire1)} : ({wire2,
                      wire0} > wire1))) : (~$signed($signed($signed((8'hb3))))));
        end
      else
        begin
          reg5 <= wire0[(2'h2):(1'h1)];
        end
      reg6 <= {$signed((&wire3))};
      if (wire2[(2'h2):(2'h2)])
        begin
          reg7 <= $unsigned(((((reg5 ^~ (8'hb6)) * (reg5 << (8'ha1))) ?
              ($unsigned(wire1) || reg6[(4'hb):(3'h6)]) : ($signed(reg5) == ((8'h9d) ?
                  reg6 : wire0))) ^~ (((~|reg5) >= $unsigned(wire0)) - $unsigned(wire1[(4'hc):(2'h2)]))));
          reg8 <= $signed(wire2);
          reg9 <= (8'hb9);
        end
      else
        begin
          reg7 <= wire4[(4'h8):(3'h6)];
          reg8 <= (wire3[(4'h8):(2'h2)] | reg6[(4'hd):(3'h5)]);
          reg9 <= ((({$unsigned((7'h43))} & (reg5 ?
                  (reg6 > (8'hb5)) : (reg9 ? wire2 : wire1))) ?
              $unsigned({(reg5 ? reg9 : reg9), {reg9}}) : (($unsigned(reg7) ?
                      (!reg9) : (-reg8)) ?
                  (7'h41) : {$unsigned(reg9)})) & $unsigned(wire4));
          reg10 <= {reg9[(1'h0):(1'h0)],
              $unsigned($unsigned({(wire3 ? wire4 : wire4)}))};
        end
      reg11 <= (~reg8[(1'h0):(1'h0)]);
    end
  assign wire12 = wire3[(1'h0):(1'h0)];
  assign wire13 = wire4[(4'ha):(3'h6)];
  assign wire14 = ($signed($unsigned({$signed(wire1),
                      (reg5 | wire1)})) * ($unsigned(wire13) ?
                      wire4 : wire4[(4'h8):(1'h0)]));
  module15 #() modinst26 (wire25, clk, wire3, reg5, wire1, wire4, wire2);
  module27 #() modinst38 (.wire30(wire25), .wire28(reg11), .y(wire37), .wire29(wire2), .clk(clk), .wire31(wire14));
  module39 #() modinst153 (wire152, clk, wire13, reg8, wire25, wire3);
  assign wire154 = $signed(reg6);
  assign wire155 = ($unsigned(($unsigned((~|wire37)) ?
                       reg6[(4'hf):(4'hc)] : wire12[(3'h4):(1'h0)])) + $signed((!reg7)));
  assign wire156 = ({wire155[(3'h5):(2'h2)]} * reg6[(2'h3):(2'h2)]);
  assign wire157 = $signed(wire14);
  module39 #() modinst159 (wire158, clk, wire155, wire12, wire14, wire13);
  assign wire160 = $signed($unsigned({reg10[(1'h1):(1'h1)],
                       $unsigned(reg8[(3'h7):(2'h3)])}));
  module27 #() modinst162 (wire161, clk, wire155, wire0, wire12, wire4);
  always
    @(posedge clk) begin
      reg163 <= $signed({($unsigned((~^wire158)) ? (|(~&reg7)) : reg5),
          $signed($unsigned($signed(wire3)))});
    end
  assign wire164 = (reg6[(3'h4):(2'h3)] ^ $unsigned((($signed((8'hb9)) ?
                           $unsigned(reg6) : (wire160 ? wire14 : wire13)) ?
                       $signed((^reg11)) : ($signed(reg11) <= reg8))));
  assign wire165 = $unsigned(((&(wire164 == $signed(wire157))) ?
                       (-$signed($signed(reg8))) : $unsigned(($unsigned(wire160) == ((8'hb8) ^~ reg7)))));
  assign wire166 = ((((^~$signed(wire158)) ?
                       (wire13[(3'h4):(3'h4)] >>> (reg163 ^~ wire12)) : ({wire12,
                           (8'hb0)} ~^ (8'ha7))) + (~|$unsigned({wire161,
                       reg5}))) | reg8[(2'h2):(1'h0)]);
  assign wire167 = {reg11, wire156[(4'ha):(3'h7)]};
  assign wire168 = wire155;
endmodule

module module39
#(parameter param150 = {{(+(((7'h40) ? (8'hbd) : (8'h9f)) | ((8'hae) << (8'hab))))}}, 
parameter param151 = ((|param150) ? (~^{(~^(^param150)), ((param150 >= param150) * param150)}) : ((~|(&(param150 ? (8'ha7) : param150))) ? (8'hb5) : ((param150 < param150) <<< (param150 ? (+param150) : (param150 ? param150 : param150))))))
(y, clk, wire40, wire41, wire42, wire43);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire40;
  input wire signed [(4'hb):(1'h0)] wire41;
  input wire [(4'ha):(1'h0)] wire42;
  input wire [(5'h15):(1'h0)] wire43;
  wire [(4'h9):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire45;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire74;
  wire signed [(4'hd):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire148;
  assign y = {wire44,
                 wire45,
                 wire46,
                 wire47,
                 wire74,
                 wire76,
                 wire77,
                 wire148,
                 (1'h0)};
  assign wire44 = wire42[(2'h2):(2'h2)];
  assign wire45 = {$signed({(^~{wire40}), $signed((wire44 == wire44))})};
  assign wire46 = $unsigned(wire45);
  assign wire47 = (&wire44[(4'h8):(3'h7)]);
  module48 #() modinst75 (wire74, clk, wire40, wire45, wire43, wire42);
  assign wire76 = $unsigned((~|(~|(8'h9e))));
  assign wire77 = (wire43[(4'ha):(1'h1)] ?
                      (~&{{$unsigned((8'haa)), (7'h40)},
                          (wire40 | (wire43 ?
                              wire47 : wire47))}) : ($signed((wire43 ?
                          (&wire47) : $unsigned(wire76))) != (($unsigned(wire42) <<< $unsigned((8'h9e))) & wire40)));
  module78 #() modinst149 (wire148, clk, wire74, wire43, wire76, wire41, wire42);
endmodule

module module27
#(parameter param36 = (((8'h9e) > (~|((7'h43) != (|(7'h42))))) >> ((~|{((8'haf) ? (8'ha5) : (8'had)), ((8'hbc) ^ (8'hae))}) == (~&(((8'hac) ? (8'h9c) : (8'ha1)) ? (~(8'ha2)) : {(8'hbc)})))))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h23):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire31;
  input wire [(2'h3):(1'h0)] wire30;
  input wire [(5'h13):(1'h0)] wire29;
  input wire [(3'h4):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire35;
  wire [(2'h2):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  assign y = {wire35, wire34, wire33, wire32, (1'h0)};
  assign wire32 = wire31;
  assign wire33 = $unsigned(($signed(((!wire29) ~^ $unsigned(wire29))) ?
                      wire30 : ((~&$signed(wire28)) ~^ $unsigned((wire31 ?
                          (8'ha3) : wire28)))));
  assign wire34 = $unsigned(wire28[(1'h1):(1'h0)]);
  assign wire35 = wire31;
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h27):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire20;
  input wire signed [(4'hc):(1'h0)] wire19;
  input wire signed [(3'h7):(1'h0)] wire18;
  input wire signed [(4'hc):(1'h0)] wire17;
  input wire signed [(4'hf):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire24;
  wire signed [(4'hd):(1'h0)] wire23;
  wire signed [(3'h5):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire21;
  assign y = {wire24, wire23, wire22, wire21, (1'h0)};
  assign wire21 = wire16;
  assign wire22 = wire17[(3'h5):(2'h2)];
  assign wire23 = (wire21 <= $unsigned(wire18[(3'h4):(3'h4)]));
  assign wire24 = $signed({(&((wire20 >> wire18) ?
                          wire16[(4'hc):(2'h3)] : $signed(wire21))),
                      $signed((((8'ha4) ? wire17 : (8'ha1)) && {wire16}))});
endmodule

module module78
#(parameter param147 = ((({(+(8'h9d))} ~^ (+((7'h43) ? (8'hba) : (8'ha6)))) - (((^(7'h43)) ? (-(7'h41)) : ((8'hb5) ? (8'h9c) : (8'hba))) >> (|((8'had) ? (7'h42) : (8'ha6))))) ? (!(~&(-((7'h40) * (8'hbb))))) : ((^(^((8'h9f) < (8'hb5)))) ? (({(8'hab)} ? ((8'ha7) ? (7'h44) : (8'h9f)) : ((8'h9d) && (8'hb9))) ^ ((~|(8'hb4)) >> (8'ha5))) : ({((8'ha3) != (8'had))} ? (~|(8'hb5)) : (8'hb8)))))
(y, clk, wire83, wire82, wire81, wire80, wire79);
  output wire [(32'h2f5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire83;
  input wire signed [(5'h15):(1'h0)] wire82;
  input wire [(4'hd):(1'h0)] wire81;
  input wire [(4'hb):(1'h0)] wire80;
  input wire signed [(3'h6):(1'h0)] wire79;
  wire [(3'h7):(1'h0)] wire128;
  wire signed [(5'h10):(1'h0)] wire119;
  wire [(3'h4):(1'h0)] wire118;
  wire [(3'h6):(1'h0)] wire117;
  wire signed [(5'h14):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire114;
  wire signed [(5'h13):(1'h0)] wire112;
  wire signed [(4'hc):(1'h0)] wire111;
  wire [(3'h7):(1'h0)] wire110;
  wire signed [(3'h7):(1'h0)] wire109;
  wire [(4'ha):(1'h0)] wire85;
  wire signed [(5'h14):(1'h0)] wire84;
  reg [(3'h6):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg145 = (1'h0);
  reg [(4'hf):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg143 = (1'h0);
  reg [(4'hb):(1'h0)] reg142 = (1'h0);
  reg [(5'h10):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg137 = (1'h0);
  reg [(5'h12):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg134 = (1'h0);
  reg [(4'h9):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg132 = (1'h0);
  reg [(2'h3):(1'h0)] reg131 = (1'h0);
  reg [(2'h2):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg129 = (1'h0);
  reg [(3'h6):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg124 = (1'h0);
  reg [(5'h12):(1'h0)] reg123 = (1'h0);
  reg [(4'h8):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg120 = (1'h0);
  reg [(3'h4):(1'h0)] reg116 = (1'h0);
  reg [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(5'h14):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(5'h14):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg101 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(5'h15):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg [(3'h5):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(5'h14):(1'h0)] reg86 = (1'h0);
  assign y = {wire128,
                 wire119,
                 wire118,
                 wire117,
                 wire115,
                 wire114,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire85,
                 wire84,
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
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg116,
                 reg113,
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
                 (1'h0)};
  assign wire84 = {wire81};
  assign wire85 = $signed((({{wire84}, $unsigned(wire80)} << wire81) ?
                      ($unsigned({wire84,
                          wire80}) && {(-(8'ha3))}) : ($unsigned(wire84) & ((wire84 ?
                          wire84 : wire81) != wire83[(4'h9):(2'h3)]))));
  always
    @(posedge clk) begin
      if ((((!(wire85[(4'h8):(3'h6)] & {wire81})) << ({(+wire84),
              wire80[(1'h0):(1'h0)]} * wire84)) ?
          ((($signed(wire84) ? (~|wire80) : $signed(wire79)) ?
              wire84[(4'hf):(4'hf)] : (|(wire81 ?
                  wire85 : wire80))) && $unsigned($unsigned($unsigned(wire83)))) : $unsigned({wire83[(1'h1):(1'h0)]})))
        begin
          reg86 <= wire79[(2'h2):(1'h1)];
        end
      else
        begin
          reg86 <= ({wire79} - ($unsigned((8'ha0)) | wire84[(2'h2):(2'h2)]));
          reg87 <= $unsigned(wire81);
          reg88 <= $unsigned($signed(($unsigned(wire85) ?
              ($signed((8'hac)) && (wire81 ?
                  (8'ha2) : wire81)) : $unsigned(wire79))));
          reg89 <= $unsigned({($signed((~^wire83)) == reg87)});
          reg90 <= (($signed({$unsigned(wire79), $unsigned(reg86)}) ?
              (((|wire82) + {wire80,
                  reg87}) <<< ((wire80 >> wire83) == (7'h41))) : $unsigned(wire79)) > (~|$signed(wire83)));
        end
      reg91 <= (~^$unsigned(reg89));
      reg92 <= (&(wire84[(4'hb):(4'ha)] ?
          $unsigned($signed($unsigned((8'h9e)))) : (wire83[(4'hb):(4'hb)] | reg86)));
      reg93 <= wire85[(2'h3):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg94 <= wire81;
    end
  always
    @(posedge clk) begin
      if ((wire79 * ({reg88[(2'h3):(2'h2)],
          wire82[(4'ha):(2'h2)]} > (($unsigned(reg93) >> ((8'hb6) ~^ wire79)) > $signed((wire81 && reg92))))))
        begin
          reg95 <= ({reg89[(3'h7):(1'h1)]} ?
              reg93 : $unsigned(($signed((wire85 || (8'haa))) & $signed({wire82,
                  reg92}))));
          reg96 <= $unsigned(wire82);
        end
      else
        begin
          if ((~^(~$signed((^reg89)))))
            begin
              reg95 <= (^wire80);
              reg96 <= (!(|$signed($signed((reg90 - (8'hae))))));
              reg97 <= $signed({reg92,
                  $unsigned((~&(wire81 ? wire80 : wire80)))});
              reg98 <= wire85[(4'h8):(2'h3)];
              reg99 <= wire84;
            end
          else
            begin
              reg95 <= $signed((((^{reg94}) >>> (!$unsigned(reg87))) ^~ $unsigned($unsigned(reg92[(1'h0):(1'h0)]))));
              reg96 <= $unsigned($unsigned(reg88[(3'h5):(2'h3)]));
              reg97 <= $unsigned($signed(((reg90 ?
                      (+wire81) : (wire80 - wire80)) ?
                  $signed($unsigned(reg99)) : ((reg93 > (8'hab)) ?
                      $unsigned(wire83) : $unsigned(reg90)))));
            end
          reg100 <= wire84;
          if (($unsigned(((~|(reg96 << reg95)) || (reg94 && (~|wire82)))) ?
              reg92[(4'h8):(3'h6)] : $signed((|$signed($unsigned((8'hb7)))))))
            begin
              reg101 <= {$signed(reg98[(5'h10):(5'h10)])};
              reg102 <= reg100[(4'ha):(3'h6)];
              reg103 <= reg101[(4'h8):(1'h0)];
            end
          else
            begin
              reg101 <= (8'hb8);
            end
        end
    end
  always
    @(posedge clk) begin
      reg104 <= ((^$signed((~$unsigned(wire79)))) >>> {((-(~wire83)) ?
              ((~^reg86) ? (~&reg87) : (|reg98)) : $unsigned((wire83 ?
                  reg96 : wire82))),
          reg95});
      reg105 <= $unsigned((reg92[(5'h10):(2'h2)] ?
          (|$signed((+reg96))) : ((^~{(8'h9f), wire79}) ?
              $signed({reg100, reg97}) : ((reg102 ? wire81 : reg96) ?
                  reg98[(3'h6):(3'h6)] : $signed(reg97)))));
      reg106 <= reg90[(1'h0):(1'h0)];
      reg107 <= $unsigned((((&(+reg93)) < reg89) <= (reg97[(2'h3):(2'h2)] > reg99[(1'h1):(1'h0)])));
      reg108 <= reg100;
    end
  assign wire109 = {$unsigned(reg93[(4'ha):(1'h1)])};
  assign wire110 = $unsigned(($unsigned($signed(reg89)) ?
                       reg106 : ($signed((~reg90)) ?
                           wire82 : (+wire84[(5'h10):(3'h6)]))));
  assign wire111 = $signed((reg106 ?
                       (reg107 ?
                           wire110 : ($unsigned(reg100) ?
                               reg97 : (reg94 != (8'hb7)))) : (reg90 || reg101[(4'h9):(4'h9)])));
  assign wire112 = (8'ha6);
  always
    @(posedge clk) begin
      reg113 <= ((wire85 | reg91) ~^ reg106);
    end
  assign wire114 = $unsigned($unsigned($unsigned(wire110[(2'h2):(1'h0)])));
  assign wire115 = (~$unsigned($signed((8'hb5))));
  always
    @(posedge clk) begin
      reg116 <= $unsigned(reg93);
    end
  assign wire117 = $unsigned(wire110);
  assign wire118 = $signed(wire82[(4'hf):(3'h4)]);
  assign wire119 = (^$signed(({wire83, $signed(reg87)} ?
                       ($signed(reg93) && $unsigned(reg87)) : $signed($unsigned((8'hb3))))));
  always
    @(posedge clk) begin
      reg120 <= reg86;
      reg121 <= ($unsigned($signed(($unsigned(wire79) ?
          $unsigned(reg106) : (reg103 ?
              reg105 : wire82)))) <= (reg116 > (8'hb1)));
      if ((~|reg90[(3'h5):(1'h1)]))
        begin
          reg122 <= {$signed($signed((~|(~|reg98))))};
          reg123 <= {reg105};
          reg124 <= $unsigned(($signed(($signed(reg121) & (wire111 ?
                  reg90 : wire109))) ?
              reg108[(5'h11):(2'h3)] : ($signed(wire80[(1'h0):(1'h0)]) >> (8'ha1))));
          if ($signed((~&($signed(reg100) ?
              (reg94 < (reg116 ?
                  reg87 : reg101)) : $unsigned(reg92[(3'h5):(1'h0)])))))
            begin
              reg125 <= $unsigned((($signed(reg108) != ($signed((8'hb3)) ?
                      {wire111} : (~wire110))) ?
                  reg100[(3'h6):(3'h4)] : $signed($signed($unsigned(reg97)))));
              reg126 <= (~$signed($unsigned($unsigned({(8'hae)}))));
              reg127 <= (((~^$signed(wire81)) < reg101) ?
                  (-((-wire118[(2'h2):(1'h0)]) ?
                      $unsigned((reg92 ?
                          reg107 : wire112)) : reg89[(4'h8):(1'h0)])) : $unsigned($signed(wire79[(2'h2):(1'h1)])));
            end
          else
            begin
              reg125 <= (reg92[(3'h6):(1'h0)] < (8'hb4));
              reg126 <= (^((($unsigned(wire79) ^ (wire84 ? wire114 : reg99)) ?
                      $signed((reg98 ?
                          reg113 : reg97)) : wire81[(4'hb):(3'h5)]) ?
                  $unsigned(reg90[(3'h6):(3'h4)]) : ((!(wire109 == reg106)) >>> ($unsigned(reg95) ?
                      (~wire79) : $unsigned(reg101)))));
            end
        end
      else
        begin
          reg122 <= $signed(((~&reg98) ?
              wire109[(1'h0):(1'h0)] : (~|(reg96[(3'h4):(1'h0)] ?
                  reg121[(4'hb):(4'h8)] : wire118[(2'h2):(1'h1)]))));
        end
    end
  assign wire128 = $signed({{reg98}, wire109});
  always
    @(posedge clk) begin
      if ({(7'h41)})
        begin
          if (reg94)
            begin
              reg129 <= {$unsigned((reg87 ?
                      ((reg91 ^~ reg98) ?
                          (reg125 ?
                              reg90 : wire118) : wire118[(1'h1):(1'h1)]) : reg101))};
              reg130 <= (reg99 >> $signed(wire118));
              reg131 <= $signed((({(wire110 >>> reg113)} ~^ wire83[(4'ha):(3'h6)]) ?
                  $unsigned({reg102, (~|wire115)}) : reg107));
              reg132 <= (reg124[(3'h7):(2'h3)] ^~ (!(~^wire117[(3'h6):(2'h3)])));
            end
          else
            begin
              reg129 <= {reg105};
              reg130 <= reg90;
              reg131 <= $signed((|$signed(((!(8'hab)) ~^ reg99[(2'h2):(1'h1)]))));
            end
          reg133 <= $signed((|$signed(reg105)));
          if (wire109[(3'h6):(1'h0)])
            begin
              reg134 <= reg103;
            end
          else
            begin
              reg134 <= $signed((&reg102));
              reg135 <= reg94[(2'h2):(2'h2)];
              reg136 <= ($signed(reg103[(4'h8):(3'h6)]) ?
                  reg121[(3'h7):(3'h5)] : $signed($unsigned($unsigned({(8'ha6),
                      reg93}))));
            end
          if ((($unsigned({reg122[(3'h5):(1'h1)],
                  wire114}) + ((~^reg127[(3'h5):(2'h2)]) << (^reg125[(5'h14):(4'h9)]))) ?
              wire80[(2'h2):(1'h0)] : (wire115[(3'h4):(1'h0)] && $unsigned(wire85))))
            begin
              reg137 <= reg103[(2'h2):(1'h1)];
              reg138 <= (((reg122[(4'h8):(4'h8)] ?
                  $signed((reg132 <<< wire81)) : $signed((wire80 <= reg108))) > {$unsigned((wire117 < reg124)),
                  (^$unsigned(wire80))}) >> (wire115[(3'h7):(3'h5)] >>> reg100));
              reg139 <= reg135;
              reg140 <= reg103;
            end
          else
            begin
              reg137 <= (8'ha9);
              reg138 <= $signed($unsigned(($unsigned(reg92) == (~^((8'hb7) ?
                  wire79 : wire84)))));
              reg139 <= reg88;
            end
          if (((8'haf) | $signed((+reg125[(5'h10):(4'h9)]))))
            begin
              reg141 <= wire82;
              reg142 <= $signed($signed((({reg136, reg132} < {reg113}) ?
                  reg101 : (|$signed((8'hae))))));
            end
          else
            begin
              reg141 <= $unsigned(wire111);
              reg142 <= ((~|wire82[(3'h5):(3'h4)]) || $signed((-reg127[(2'h2):(2'h2)])));
              reg143 <= (reg129[(3'h4):(2'h3)] ^~ $unsigned((((~&reg130) && (reg123 ~^ wire115)) ?
                  $unsigned(reg103[(3'h7):(3'h7)]) : ((wire85 | wire81) && (reg89 ?
                      reg108 : reg95)))));
              reg144 <= $signed(((($signed(reg108) << $unsigned(reg86)) ?
                  reg102 : wire79) == {{(reg137 ? reg139 : reg107)}}));
            end
        end
      else
        begin
          reg129 <= $signed(wire112[(5'h13):(4'h8)]);
          reg130 <= (~|(-$signed((!((8'ha7) >>> reg139)))));
          reg131 <= reg107[(4'h9):(4'h8)];
          if (reg121)
            begin
              reg132 <= (reg104[(4'h8):(3'h4)] ^ $unsigned((7'h43)));
              reg133 <= reg107[(3'h6):(1'h1)];
              reg134 <= reg94;
              reg135 <= $signed($unsigned((~^(reg134 < (+wire84)))));
              reg136 <= ((((|reg92) ?
                  $signed($signed((7'h42))) : $signed($signed(wire79))) >= (&$unsigned({(8'had)}))) >= reg107);
            end
          else
            begin
              reg132 <= reg129[(2'h2):(1'h0)];
              reg133 <= ((^~$unsigned(({reg135} ?
                      (reg90 < (8'hb0)) : (+wire84)))) ?
                  reg90[(3'h6):(3'h6)] : ($signed($signed({reg95})) - {(^~(reg113 ?
                          wire84 : (7'h42)))}));
              reg134 <= (((((reg126 ? wire84 : (8'hb4)) ?
                          ((8'hb6) << reg100) : $signed(wire80)) ?
                      (8'hb2) : $unsigned((reg135 ?
                          reg91 : reg137))) || reg97[(1'h1):(1'h1)]) ?
                  (!(reg122 ?
                      $signed((reg99 <= wire83)) : $unsigned($signed((8'ha3))))) : ($unsigned(($unsigned(wire128) <= $unsigned(reg98))) + (((~^(8'hb3)) ^~ reg103[(3'h5):(2'h3)]) ?
                      {reg139[(4'hb):(1'h0)]} : (wire110[(1'h1):(1'h1)] << (~|wire84)))));
              reg135 <= reg127;
              reg136 <= ((-$unsigned(wire82)) >= (reg108[(5'h13):(5'h12)] ?
                  (~|($signed(reg100) ?
                      (^reg133) : {reg89})) : ((wire84[(4'hc):(3'h7)] ?
                          (^~reg106) : reg101[(4'h8):(4'h8)]) ?
                      (^~wire118) : $unsigned(wire128[(1'h1):(1'h0)]))));
            end
          reg137 <= {reg136, $signed((~&$unsigned((+reg116))))};
        end
      reg145 <= (reg129[(4'ha):(4'h9)] ~^ reg93);
      reg146 <= $unsigned({reg134[(2'h3):(1'h0)]});
    end
endmodule

module module48
#(parameter param73 = ((((8'h9e) ? ((&(8'hbf)) || ((8'hbd) ~^ (8'ha5))) : {((8'hbf) >= (8'ha6)), ((8'ha4) > (8'hba))}) ? {(~&((8'h9d) ? (8'ha8) : (8'hb1))), ((-(7'h40)) ^~ ((8'hbf) <<< (8'h9d)))} : ({((8'hb0) < (8'hb9))} >> (((8'ha9) && (8'hb6)) ? ((7'h43) ? (8'hb4) : (8'hbb)) : (8'hb6)))) >= {(((~&(8'hb7)) <= {(7'h44), (8'hae)}) || (((8'hbe) ? (8'h9c) : (8'had)) ? (^~(7'h44)) : (|(8'h9c))))}))
(y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire52;
  input wire [(3'h4):(1'h0)] wire51;
  input wire signed [(5'h11):(1'h0)] wire50;
  input wire signed [(4'ha):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire72;
  wire signed [(5'h12):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire70;
  wire [(4'hd):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire67;
  wire [(5'h13):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire60;
  wire signed [(5'h13):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire53;
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire53,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg54,
                 (1'h0)};
  assign wire53 = $signed($signed(wire50));
  always
    @(posedge clk) begin
      reg54 <= $unsigned({(|(8'hb2))});
    end
  assign wire55 = $unsigned({($signed($unsigned(wire52)) + wire50)});
  assign wire56 = ((~reg54[(4'he):(4'he)]) ?
                      $signed(($unsigned(reg54[(3'h6):(3'h5)]) ?
                          (7'h43) : wire55[(4'h9):(4'h8)])) : wire51);
  assign wire57 = (^~(+$signed($unsigned((-wire51)))));
  assign wire58 = ($unsigned(((!$signed(wire49)) ?
                      wire57[(1'h1):(1'h1)] : ((wire56 - reg54) && $unsigned((8'ha3))))) ^~ $unsigned(((~|(^wire53)) >= (&wire53[(4'h9):(1'h0)]))));
  assign wire59 = $unsigned(wire58[(3'h6):(1'h1)]);
  assign wire60 = $unsigned(wire52[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg61 <= wire59[(4'h9):(4'h8)];
      reg62 <= $signed(wire52[(1'h1):(1'h0)]);
      reg63 <= (8'haf);
      reg64 <= {wire51};
      reg65 <= (wire51 ? (8'hbb) : $signed((8'hac)));
    end
  assign wire66 = ((-($unsigned((wire60 != wire49)) ?
                      $signed((8'hbc)) : ($unsigned(reg61) ?
                          (reg54 ? reg61 : reg64) : {wire52}))) + reg54);
  assign wire67 = (reg54[(4'hd):(2'h2)] <= ({($signed(wire50) <<< {reg62}),
                      $signed(wire60)} >= (wire58[(4'hb):(4'h9)] ^~ ({(8'hb5),
                          wire50} ?
                      wire53[(3'h6):(2'h3)] : (reg63 ^~ wire55)))));
  assign wire68 = reg63[(4'h9):(3'h7)];
  assign wire69 = $signed($signed({(~^(&reg54)), (-$signed(wire67))}));
  assign wire70 = reg61[(2'h2):(2'h2)];
  assign wire71 = wire68[(3'h4):(1'h0)];
  assign wire72 = (reg63 ?
                      ((wire67 ?
                          reg63 : (wire60 ?
                              $signed(wire67) : $unsigned(wire56))) - $signed(($unsigned(wire59) - (wire56 ?
                          wire68 : reg62)))) : $unsigned($unsigned(((7'h43) + (reg62 < wire67)))));
endmodule
