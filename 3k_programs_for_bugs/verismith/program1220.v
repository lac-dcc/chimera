module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire162;
  wire [(4'h9):(1'h0)] wire161;
  wire [(4'hb):(1'h0)] wire156;
  wire [(4'h8):(1'h0)] wire86;
  wire [(4'hb):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire84;
  wire [(5'h14):(1'h0)] wire83;
  wire [(4'h9):(1'h0)] wire82;
  wire signed [(5'h14):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire80;
  wire signed [(4'hd):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire158;
  wire signed [(3'h7):(1'h0)] wire159;
  reg [(5'h15):(1'h0)] reg77 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire156,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire76,
                 wire5,
                 wire6,
                 wire7,
                 wire74,
                 wire158,
                 wire159,
                 reg77,
                 reg78,
                 reg79,
                 (1'h0)};
  assign wire5 = wire0;
  assign wire6 = (wire0[(1'h0):(1'h0)] <= (8'ha3));
  assign wire7 = ($signed({($signed(wire2) ?
                         (wire3 ~^ wire0) : (!wire4))}) || $signed((^wire1)));
  module8 #() modinst75 (wire74, clk, wire4, wire3, wire5, wire2, wire6);
  assign wire76 = wire0;
  always
    @(posedge clk) begin
      if ((wire3[(4'hb):(4'h8)] ?
          (|wire7[(5'h12):(4'ha)]) : wire1[(2'h2):(1'h0)]))
        begin
          reg77 <= {wire0[(3'h4):(3'h4)]};
          reg78 <= (($unsigned($signed((reg77 ?
              wire74 : wire0))) | ((+$unsigned((8'hbc))) == wire76[(3'h6):(3'h6)])) | (^~(^~{(reg77 && wire3),
              wire5})));
          reg79 <= ($signed($signed(($signed(wire0) ?
              {wire1,
                  reg77} : reg77[(4'hf):(3'h7)]))) != (~^($signed($unsigned(wire7)) <<< (^~(7'h43)))));
        end
      else
        begin
          reg77 <= $unsigned($signed($signed((~|(wire7 >>> wire5)))));
          reg78 <= ((+wire1) <<< $signed($unsigned(wire4[(3'h6):(3'h6)])));
        end
    end
  assign wire80 = reg78[(1'h0):(1'h0)];
  assign wire81 = wire6[(1'h1):(1'h0)];
  assign wire82 = $signed((((^~wire5[(4'hd):(3'h6)]) ?
                      (wire2[(1'h0):(1'h0)] ?
                          {wire74} : $unsigned(reg77)) : reg78) < (reg79[(2'h2):(1'h1)] ~^ ({reg77,
                      wire81} - (~|wire3)))));
  assign wire83 = wire4[(3'h7):(1'h0)];
  assign wire84 = wire80[(2'h3):(2'h2)];
  assign wire85 = wire6;
  assign wire86 = wire74[(4'hd):(3'h7)];
  module87 #() modinst157 (wire156, clk, reg77, wire83, wire80, wire0);
  assign wire158 = $signed((~|(8'hbb)));
  module92 #() modinst160 (wire159, clk, wire86, wire1, wire85, wire74, wire2);
  assign wire161 = (~wire4[(4'h9):(2'h2)]);
  assign wire162 = ((!wire5[(1'h1):(1'h1)]) & $signed({wire0[(4'hf):(1'h0)],
                       ($signed(wire74) ?
                           $signed(wire76) : (wire86 & wire3))}));
endmodule

module module87
#(parameter param155 = (((+(!(8'ha0))) ? (((~|(8'hb1)) ? ((8'hae) ? (8'had) : (8'haf)) : ((7'h43) ? (8'ha3) : (8'hae))) & ({(7'h40), (8'hb7)} ? ((8'haf) >= (8'haf)) : ((8'hbd) ~^ (8'h9e)))) : ((((8'hb3) ? (8'hab) : (8'ha5)) ? ((8'hb5) & (8'hab)) : (!(8'hb8))) ? ({(8'hb4)} >>> {(8'ha1), (7'h41)}) : (((8'ha9) ? (8'ha5) : (8'ha2)) ? (|(8'hb6)) : ((8'haa) & (8'ha5))))) >>> ({(+((7'h40) ? (8'ha5) : (7'h44)))} ^~ (~(8'hb0)))))
(y, clk, wire88, wire89, wire90, wire91);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire88;
  input wire signed [(5'h14):(1'h0)] wire89;
  input wire signed [(5'h15):(1'h0)] wire90;
  input wire signed [(5'h13):(1'h0)] wire91;
  wire [(4'ha):(1'h0)] wire154;
  wire [(4'hb):(1'h0)] wire153;
  wire [(3'h5):(1'h0)] wire152;
  wire signed [(4'h8):(1'h0)] wire151;
  wire [(3'h4):(1'h0)] wire150;
  wire [(5'h11):(1'h0)] wire104;
  wire signed [(3'h7):(1'h0)] wire106;
  wire [(5'h14):(1'h0)] wire107;
  wire signed [(2'h2):(1'h0)] wire148;
  assign y = {wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire104,
                 wire106,
                 wire107,
                 wire148,
                 (1'h0)};
  module92 #() modinst105 (.wire94(wire89), .wire95(wire90), .wire96(wire88), .wire97(wire91), .y(wire104), .clk(clk), .wire93((8'hb7)));
  assign wire106 = $unsigned((((wire90[(2'h2):(1'h0)] ?
                       wire91[(4'ha):(3'h4)] : wire91[(5'h13):(5'h12)]) ~^ $signed((^wire91))) << (&({wire104,
                       (8'ha5)} != wire90))));
  assign wire107 = $unsigned(wire106);
  module108 #() modinst149 (wire148, clk, wire89, wire91, wire107, wire88, wire104);
  assign wire150 = {wire89,
                       $unsigned(($signed($signed(wire148)) & wire107[(1'h0):(1'h0)]))};
  assign wire151 = ((!$unsigned((~|$unsigned(wire107)))) ?
                       $signed(wire90) : $unsigned((8'hb4)));
  assign wire152 = ($signed((((~&wire89) ?
                       (wire106 < wire88) : wire106) ^ wire88)) <<< wire151);
  assign wire153 = $signed(wire90);
  assign wire154 = {(+wire104[(4'hc):(3'h6)]),
                       (wire88[(3'h6):(3'h6)] * wire153[(1'h1):(1'h0)])};
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire [(3'h7):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire12;
  input wire signed [(4'hb):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire73;
  wire [(4'hb):(1'h0)] wire72;
  wire [(4'h9):(1'h0)] wire71;
  wire [(4'ha):(1'h0)] wire70;
  wire [(4'h9):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire66;
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire66,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire14 = (wire11 ?
                      (^~(((8'hac) ? (~&(8'hb4)) : {wire9}) ?
                          (wire13[(4'h8):(3'h5)] ?
                              (wire12 ?
                                  wire11 : wire10) : $signed(wire10)) : {$signed((8'ha0))})) : wire9);
  assign wire15 = wire13[(2'h3):(1'h1)];
  assign wire16 = wire10;
  assign wire17 = ($unsigned(wire9) * wire15[(4'h8):(3'h7)]);
  assign wire18 = wire17[(4'he):(4'hd)];
  assign wire19 = (wire16[(1'h0):(1'h0)] & (7'h43));
  always
    @(posedge clk) begin
      reg20 <= $signed({(8'hbe)});
      reg21 <= $signed((($signed($unsigned(wire19)) ?
              (wire18 ?
                  (wire13 ? wire19 : wire16) : (7'h43)) : $signed((^wire9))) ?
          wire16 : ($signed(wire15[(4'hb):(4'h9)]) ?
              (8'hb5) : $signed((wire9 ? wire15 : wire13)))));
      reg22 <= $signed((7'h44));
      if ($unsigned($unsigned(wire14[(1'h0):(1'h0)])))
        begin
          reg23 <= {(~$signed(((wire14 ? (8'hb6) : (7'h44)) ?
                  ((8'ha5) ? wire13 : reg22) : reg22[(4'h9):(3'h5)])))};
          if ({(($signed($signed(reg22)) | $signed((wire19 ?
                  (8'h9d) : wire12))) ^~ wire11[(3'h6):(2'h2)])})
            begin
              reg24 <= (reg21 ~^ wire14);
              reg25 <= ((reg22 ?
                  wire15[(5'h10):(4'hc)] : $unsigned($signed($unsigned(wire17)))) - $unsigned(wire13));
              reg26 <= wire17[(3'h4):(1'h1)];
              reg27 <= ({($unsigned((reg23 + wire18)) ?
                      (|(wire14 >>> wire16)) : wire11)} | wire18);
              reg28 <= {$unsigned(reg25[(1'h0):(1'h0)]), wire16[(1'h0):(1'h0)]};
            end
          else
            begin
              reg24 <= ($unsigned((+reg24)) <= (wire18 ? wire10 : reg22));
              reg25 <= (wire9[(4'hd):(3'h6)] < wire18);
            end
          if (wire9[(1'h1):(1'h0)])
            begin
              reg29 <= $unsigned(reg25[(3'h5):(2'h3)]);
              reg30 <= (7'h44);
              reg31 <= ((wire19 ?
                  ($unsigned(wire9) ?
                      ({(8'hb0)} * (reg24 ? (8'hb4) : reg20)) : ((&(8'hb1)) ?
                          (reg30 != wire16) : (+reg25))) : $unsigned(((wire12 ?
                      reg21 : (8'hab)) >= $unsigned(reg28)))) + (($unsigned((reg28 ?
                      reg28 : wire10)) ?
                  $signed({reg26}) : (reg20[(2'h3):(1'h1)] < (8'h9e))) * ($unsigned(reg20) <<< ((8'hab) - (&wire11)))));
            end
          else
            begin
              reg29 <= {{$signed(($unsigned(wire14) ?
                          reg25[(1'h1):(1'h0)] : wire17)),
                      wire9[(3'h6):(3'h4)]}};
              reg30 <= $signed({reg27[(4'h8):(3'h7)],
                  {$signed($unsigned(reg29))}});
              reg31 <= ($unsigned(reg25) ?
                  ((((|wire17) ?
                      (reg31 & reg27) : (~|(8'hae))) > (~^reg24)) + ((((8'hbc) << wire9) ?
                      reg22[(3'h5):(1'h1)] : reg26[(1'h0):(1'h0)]) ^~ ($unsigned(reg28) & (wire19 >> reg30)))) : $signed($signed($signed((-reg31)))));
            end
          reg32 <= (~^$unsigned({{reg23, $unsigned((8'hb0))}}));
          reg33 <= ($signed(reg24[(3'h5):(2'h3)]) ?
              $signed((~^((~^wire18) > $signed(wire11)))) : {(wire19[(4'ha):(3'h4)] ?
                      (reg22 ?
                          $signed(wire13) : wire14[(1'h0):(1'h0)]) : $signed(wire19[(3'h6):(3'h5)]))});
        end
      else
        begin
          if ((|$unsigned(($unsigned({reg27, reg23}) >= (reg29 ?
              (^~reg20) : reg25)))))
            begin
              reg23 <= ($signed(($unsigned(reg29) >>> $signed(wire10))) ?
                  $unsigned($signed($unsigned((reg27 ?
                      (8'h9e) : wire14)))) : $signed($signed(((reg23 ?
                      reg32 : (8'haf)) <<< (reg29 ? (8'ha2) : reg32)))));
              reg24 <= wire16;
              reg25 <= ({(($signed((8'ha5)) == $signed((8'hba))) + ((reg28 < reg24) > {reg30,
                      reg20})),
                  reg24[(1'h1):(1'h1)]} * wire12[(3'h6):(2'h3)]);
              reg26 <= reg21;
              reg27 <= ((reg32 ?
                      (wire14 && reg26) : {$signed($unsigned(wire13))}) ?
                  (8'hbd) : $unsigned(reg25));
            end
          else
            begin
              reg23 <= $unsigned($signed((&$unsigned((wire15 == wire16)))));
            end
          reg28 <= (^~(reg26 ^ $signed(reg23[(1'h1):(1'h0)])));
          reg29 <= reg28;
          reg30 <= $unsigned({reg24[(3'h7):(3'h7)], reg30[(1'h1):(1'h0)]});
        end
    end
  module34 #() modinst67 (.wire36(wire19), .clk(clk), .wire37(wire12), .wire39(reg30), .wire38(reg28), .y(wire66), .wire35(wire16));
  assign wire68 = (reg29 ?
                      $signed(reg20[(2'h3):(2'h2)]) : ({((wire9 <= (8'h9f)) >> wire19)} ?
                          reg29[(3'h4):(2'h3)] : $signed((^~wire12[(4'hc):(3'h5)]))));
  assign wire69 = $unsigned($unsigned((reg25[(3'h7):(2'h2)] ^~ (~^reg33[(4'h8):(3'h6)]))));
  assign wire70 = wire13[(3'h6):(3'h5)];
  assign wire71 = (wire12 ?
                      $unsigned($unsigned(reg27[(3'h4):(1'h0)])) : $signed((reg31[(4'h8):(4'h8)] || $signed((reg31 ?
                          wire16 : wire19)))));
  assign wire72 = $signed({$unsigned((reg33 >= {wire17}))});
  assign wire73 = ($unsigned(reg29[(2'h2):(2'h2)]) ?
                      wire69[(4'h9):(3'h7)] : reg32);
endmodule

module module34  (y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h139):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire39;
  input wire [(4'hd):(1'h0)] wire38;
  input wire signed [(4'hf):(1'h0)] wire37;
  input wire [(2'h3):(1'h0)] wire36;
  input wire signed [(3'h5):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire56;
  wire [(5'h15):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire50;
  wire signed [(3'h6):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire45;
  wire signed [(3'h4):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(4'hf):(1'h0)] wire40;
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  assign y = {wire65,
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
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  assign wire40 = wire37[(4'ha):(3'h5)];
  assign wire41 = (8'hb5);
  assign wire42 = (&$signed({($unsigned(wire38) ?
                          (wire40 < (8'ha4)) : wire37[(4'hf):(2'h3)]),
                      {{wire41}}}));
  assign wire43 = $signed($unsigned(wire41));
  assign wire44 = (~^(~wire41));
  assign wire45 = $unsigned(wire42[(1'h1):(1'h0)]);
  assign wire46 = $signed(wire45[(2'h2):(1'h1)]);
  assign wire47 = wire43;
  assign wire48 = $signed({(^~(wire44[(2'h3):(1'h1)] ?
                          (wire37 == wire46) : (&wire43))),
                      (wire41 ?
                          $signed(wire38[(2'h2):(2'h2)]) : (~&(wire36 ^ wire40)))});
  assign wire49 = $unsigned(wire36);
  assign wire50 = ($signed($unsigned((+(wire43 << wire37)))) ?
                      {$unsigned($signed({wire44,
                              wire44}))} : (!wire41[(3'h6):(3'h4)]));
  assign wire51 = wire38;
  assign wire52 = {(!$signed((~&$unsigned(wire35))))};
  assign wire53 = wire43[(3'h7):(1'h1)];
  assign wire54 = {$unsigned((wire53 ? wire41 : (wire42 - $signed(wire38))))};
  assign wire55 = ((wire35[(1'h0):(1'h0)] ?
                      wire51[(3'h4):(3'h4)] : {wire36}) <= ($unsigned(wire35) & (~$signed((8'hae)))));
  assign wire56 = {$signed($unsigned((^~wire48[(3'h5):(1'h0)])))};
  assign wire57 = $signed(wire41);
  assign wire58 = $signed((^~($signed(wire52) << wire52[(4'hf):(3'h7)])));
  always
    @(posedge clk) begin
      if ({wire57})
        begin
          reg59 <= (8'hac);
          reg60 <= wire43[(4'hb):(3'h6)];
        end
      else
        begin
          if ((-wire43))
            begin
              reg59 <= $unsigned(reg60);
            end
          else
            begin
              reg59 <= (wire53 && wire52);
            end
          reg60 <= (+(($unsigned({(8'ha8), wire44}) ?
              (~&(wire50 ? wire54 : wire55)) : ($signed(wire50) ?
                  wire40 : $signed(wire42))) || ((|(&wire52)) << $unsigned((wire50 ~^ (8'haa))))));
          reg61 <= $unsigned($signed(wire51));
          reg62 <= $unsigned((wire54 ?
              wire46 : (~&{wire50[(2'h3):(2'h3)], $signed(wire36)})));
          reg63 <= wire43;
        end
      reg64 <= $signed(((wire35[(1'h0):(1'h0)] ?
          {{wire41, reg61}} : (^~$signed(reg62))) ^~ wire44[(2'h2):(2'h2)]));
    end
  assign wire65 = wire43;
endmodule

module module108
#(parameter param146 = ((8'hb8) - {((((8'haf) || (8'ha6)) != ((8'hb9) >= (8'h9d))) ? ((^~(8'ha9)) ? ((8'haa) ? (8'ha5) : (8'ha4)) : (!(8'ha8))) : ((-(8'ha3)) < ((8'hae) ? (8'hb7) : (8'ha8)))), ((^(~|(8'had))) ? (((7'h43) ? (8'hae) : (8'ha6)) & (!(7'h40))) : (|((8'hba) ? (7'h41) : (8'ha2))))}), 
parameter param147 = (~|((({param146, param146} <= (|param146)) >= param146) ^~ (((&param146) - ((8'hac) ? param146 : param146)) ^~ (^param146)))))
(y, clk, wire113, wire112, wire111, wire110, wire109);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire113;
  input wire [(4'hb):(1'h0)] wire112;
  input wire signed [(5'h14):(1'h0)] wire111;
  input wire signed [(3'h7):(1'h0)] wire110;
  input wire [(4'hb):(1'h0)] wire109;
  wire signed [(2'h2):(1'h0)] wire117;
  wire [(3'h4):(1'h0)] wire116;
  wire signed [(4'hb):(1'h0)] wire115;
  wire [(5'h12):(1'h0)] wire114;
  reg signed [(4'he):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg144 = (1'h0);
  reg [(3'h4):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg142 = (1'h0);
  reg [(5'h11):(1'h0)] reg141 = (1'h0);
  reg [(4'hd):(1'h0)] reg140 = (1'h0);
  reg [(3'h7):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg138 = (1'h0);
  reg [(4'ha):(1'h0)] reg137 = (1'h0);
  reg [(4'hc):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg135 = (1'h0);
  reg [(4'hd):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg130 = (1'h0);
  reg [(3'h6):(1'h0)] reg129 = (1'h0);
  reg [(4'hd):(1'h0)] reg128 = (1'h0);
  reg [(3'h6):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg126 = (1'h0);
  reg [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(3'h5):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg119 = (1'h0);
  reg [(3'h7):(1'h0)] reg118 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire114,
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
                 (1'h0)};
  assign wire114 = (((~{$unsigned(wire111)}) ?
                       $signed((wire113 - {wire109})) : wire113[(4'hc):(4'hb)]) >> (wire113 ?
                       ($signed(((7'h42) >> wire109)) && $unsigned((wire111 ?
                           wire113 : wire109))) : (wire113[(2'h3):(2'h2)] ?
                           $unsigned(wire110) : (((8'hb3) ^~ wire110) ?
                               {wire111, (8'ha0)} : (^wire113)))));
  assign wire115 = $unsigned($signed(($unsigned(wire110[(3'h6):(2'h2)]) ?
                       wire110[(3'h5):(3'h5)] : $signed(wire112))));
  assign wire116 = (+wire109[(2'h2):(1'h1)]);
  assign wire117 = wire114;
  always
    @(posedge clk) begin
      reg118 <= $signed((({wire112, (~wire117)} ~^ $unsigned((-(8'hbc)))) ?
          wire110 : (^~((wire116 ? wire112 : wire117) != wire113))));
      if ({wire115})
        begin
          reg119 <= $signed((^$unsigned((8'ha9))));
          if ((!$signed(wire113)))
            begin
              reg120 <= reg119[(2'h2):(1'h0)];
              reg121 <= $unsigned(wire111);
              reg122 <= $unsigned((wire117[(1'h0):(1'h0)] << $unsigned({$signed(wire109)})));
              reg123 <= reg121[(4'hd):(3'h5)];
            end
          else
            begin
              reg120 <= ((^~(($signed(wire117) ?
                  {reg119,
                      reg123} : wire111) <= $signed(wire109[(3'h7):(3'h7)]))) | (~&(~^wire113[(4'hc):(4'hc)])));
              reg121 <= ($signed(wire114) << (($signed(reg123[(2'h2):(1'h0)]) ?
                      wire113 : $signed(wire115)) ?
                  wire114[(4'ha):(3'h5)] : reg119));
              reg122 <= (wire109[(4'hb):(3'h4)] < $signed($signed((reg121[(5'h10):(2'h3)] * $signed(wire117)))));
            end
          if (reg123)
            begin
              reg124 <= ($unsigned({$signed(wire116)}) ^ ((!reg119) ?
                  $signed($unsigned((^reg120))) : $signed(($signed((8'hae)) ?
                      reg120 : (~&wire115)))));
              reg125 <= wire111;
              reg126 <= (((|$unsigned((wire113 >>> reg119))) ?
                  (~(!wire115)) : $unsigned($signed({wire112,
                      reg120}))) >>> $signed((8'haa)));
              reg127 <= wire117;
            end
          else
            begin
              reg124 <= reg119[(1'h0):(1'h0)];
              reg125 <= (!wire116);
              reg126 <= reg120[(1'h1):(1'h1)];
              reg127 <= ({$unsigned($signed((~|wire114)))} ?
                  $unsigned($unsigned(($signed(reg126) && $unsigned(reg118)))) : $unsigned(reg118[(1'h1):(1'h1)]));
              reg128 <= ((^wire114) ?
                  (~((reg120 | $unsigned(reg119)) ?
                      (((8'h9f) ? reg121 : reg124) >= {wire110}) : ({wire111} ?
                          $signed(wire109) : (reg121 ?
                              wire117 : wire117)))) : ((wire114[(4'hf):(3'h6)] ?
                      (-$signed(reg123)) : reg118) & reg120));
            end
          if ($unsigned((reg122[(1'h1):(1'h0)] ?
              $signed($signed((reg126 ? reg128 : reg119))) : reg128)))
            begin
              reg129 <= {$signed(((~^(wire116 <= reg124)) > ($signed(wire114) ?
                      $unsigned(reg119) : $signed(wire115))))};
              reg130 <= reg120[(1'h0):(1'h0)];
              reg131 <= $signed(((wire113[(2'h2):(1'h1)] ?
                  $signed($signed(reg127)) : $unsigned((-reg122))) >= (((~reg123) ?
                  (reg127 && reg118) : reg120) <= (wire113 <<< $unsigned(reg130)))));
              reg132 <= $unsigned((wire111 ?
                  reg121[(4'h9):(2'h2)] : $signed(reg123[(1'h0):(1'h0)])));
              reg133 <= reg123;
            end
          else
            begin
              reg129 <= $signed((-{($signed(reg122) ? reg121 : (~^(8'hb8))),
                  reg126[(3'h5):(1'h1)]}));
              reg130 <= {((^$signed((wire109 ?
                      wire110 : reg119))) * (((wire113 << (8'hbe)) == $unsigned(reg118)) ?
                      ((wire110 ? reg120 : reg120) ?
                          (reg128 == reg118) : reg119) : (8'ha1))),
                  (wire117[(1'h0):(1'h0)] ?
                      (^wire109) : {($unsigned(reg131) >= $unsigned(wire114)),
                          reg129})};
              reg131 <= reg121;
              reg132 <= (reg131 ?
                  (reg127[(3'h5):(1'h0)] < (+$signed((wire117 ?
                      (8'h9d) : reg132)))) : (reg125 | {$unsigned((reg123 ?
                          reg122 : wire114)),
                      ($signed(wire111) ~^ (reg129 ? (7'h44) : wire110))}));
              reg133 <= $signed($unsigned((^~reg127[(3'h5):(3'h4)])));
            end
          reg134 <= reg127[(3'h4):(3'h4)];
        end
      else
        begin
          reg119 <= (~|$signed((8'hb7)));
          reg120 <= $signed(reg128[(3'h5):(2'h3)]);
        end
      if ({reg120, wire109})
        begin
          reg135 <= (+wire113);
        end
      else
        begin
          if (($unsigned((+(+(wire116 && wire115)))) >>> (+wire117)))
            begin
              reg135 <= (~&(reg118 <<< reg131));
            end
          else
            begin
              reg135 <= reg126[(2'h3):(2'h2)];
              reg136 <= (wire112 * (((reg132[(4'he):(4'hb)] || {reg131}) >= (reg119 * {wire110,
                      wire113})) ?
                  ((wire109[(4'h8):(4'h8)] << wire109) > (wire111 ?
                      wire113[(1'h1):(1'h0)] : (reg123 || wire117))) : {((reg126 ?
                          wire110 : reg134) != $signed(wire115)),
                      {(+reg134), (|(8'hb1))}}));
              reg137 <= $signed((((^~{reg120,
                  (8'haf)}) < reg128) && (reg128[(4'hb):(2'h2)] ^ ((reg129 ?
                      reg136 : reg127) ?
                  $unsigned(reg135) : $unsigned(reg129)))));
              reg138 <= wire115[(3'h4):(1'h1)];
              reg139 <= $signed($signed(reg125));
            end
          if ($unsigned((~&$unsigned(($signed(reg134) ?
              $signed(reg129) : ((8'ha0) ? reg132 : reg132))))))
            begin
              reg140 <= ($unsigned($unsigned(($unsigned(reg139) ?
                      $signed(reg130) : (-(8'h9f))))) ?
                  (^{$unsigned($signed(wire110))}) : (reg138[(2'h3):(2'h3)] || ((&(reg118 ?
                          wire116 : reg128)) ?
                      (^$signed(reg126)) : $unsigned($signed(reg128)))));
              reg141 <= {reg120};
              reg142 <= ($signed($unsigned({(reg124 ? (8'haf) : reg137)})) ?
                  (wire112[(2'h3):(1'h1)] ?
                      $unsigned((8'hb3)) : ((~&$signed(wire111)) == $unsigned(reg141[(4'ha):(1'h0)]))) : $signed({{reg129[(3'h5):(3'h4)]},
                      reg118[(3'h6):(1'h0)]}));
            end
          else
            begin
              reg140 <= $unsigned(((~&$unsigned($signed(wire110))) << ($signed($signed(reg122)) | reg128[(3'h4):(1'h1)])));
              reg141 <= (~$unsigned($unsigned((wire114 ? reg126 : {reg129}))));
            end
          reg143 <= (~|(!(8'h9f)));
          reg144 <= (&reg139[(1'h1):(1'h1)]);
        end
      reg145 <= reg119;
    end
endmodule

module module92  (y, clk, wire97, wire96, wire95, wire94, wire93);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire97;
  input wire signed [(5'h15):(1'h0)] wire96;
  input wire [(4'h8):(1'h0)] wire95;
  input wire signed [(4'ha):(1'h0)] wire94;
  input wire signed [(4'hc):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire103;
  wire signed [(3'h4):(1'h0)] wire102;
  wire signed [(3'h7):(1'h0)] wire101;
  wire signed [(5'h10):(1'h0)] wire100;
  wire [(4'hd):(1'h0)] wire99;
  wire [(5'h15):(1'h0)] wire98;
  assign y = {wire103, wire102, wire101, wire100, wire99, wire98, (1'h0)};
  assign wire98 = ((({wire94[(3'h4):(1'h0)]} ?
                          (wire94 - (wire94 ?
                              wire93 : wire95)) : (~&((8'hb4) * wire93))) ?
                      $unsigned($unsigned(wire95)) : (&((!(8'hb0)) & (wire97 ?
                          wire93 : wire94)))) < ({wire97[(3'h7):(3'h7)],
                      wire97} << wire96[(5'h12):(4'hf)]));
  assign wire99 = {(8'hb3)};
  assign wire100 = wire95[(2'h2):(1'h1)];
  assign wire101 = $signed(($unsigned($unsigned((wire98 ?
                       wire98 : wire99))) & ((+(wire99 ? (8'hb8) : wire99)) ?
                       (wire95 ?
                           $signed(wire96) : $unsigned((8'ha7))) : ((~|wire93) ?
                           wire100 : wire99))));
  assign wire102 = (+wire95);
  assign wire103 = $unsigned(((wire101 ^~ (^(wire99 ?
                       wire101 : (8'hb5)))) - $unsigned(($unsigned(wire95) ?
                       $unsigned((8'hb6)) : (~&wire93)))));
endmodule
