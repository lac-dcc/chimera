module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire45;
  wire [(4'ha):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire77;
  wire [(2'h2):(1'h0)] wire79;
  wire [(4'hb):(1'h0)] wire161;
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg64 = (1'h0);
  reg [(4'h9):(1'h0)] reg65 = (1'h0);
  assign y = {wire45,
                 wire52,
                 wire77,
                 wire79,
                 wire161,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 (1'h0)};
  module5 #() modinst46 (wire45, clk, wire1, wire3, wire0, wire2, wire4);
  always
    @(posedge clk) begin
      reg47 <= (+(($signed({wire2}) ?
              wire4[(2'h3):(2'h3)] : $signed(wire1[(3'h5):(3'h5)])) ?
          wire2 : $unsigned(wire3[(4'ha):(3'h6)])));
      reg48 <= {{{(((8'hba) << wire2) <<< reg47), $unsigned(reg47)},
              wire1[(1'h0):(1'h0)]},
          (+$signed({(wire1 + wire45), wire2}))};
      reg49 <= $unsigned($unsigned(($signed($unsigned((8'ha9))) * wire3[(1'h1):(1'h1)])));
      reg50 <= (!reg47);
      reg51 <= reg47;
    end
  assign wire52 = $unsigned(reg51);
  always
    @(posedge clk) begin
      reg53 <= (|(~&({(wire4 ? reg48 : (8'ha4)), {reg51}} == {(reg49 ?
              reg48 : reg51),
          (+reg51)})));
      reg54 <= ((reg47[(1'h0):(1'h0)] + $signed(reg53)) ?
          wire3[(4'hd):(4'hb)] : {(7'h42)});
      reg55 <= (((((~reg49) | (^~reg49)) ?
              (&{reg54, reg54}) : $unsigned($signed(reg48))) > {(^wire1)}) ?
          (reg49[(4'he):(4'hc)] != reg51[(4'hc):(4'ha)]) : reg48[(1'h0):(1'h0)]);
      if (wire1[(1'h1):(1'h0)])
        begin
          reg56 <= $unsigned(reg54);
          if ((+reg53[(2'h2):(1'h0)]))
            begin
              reg57 <= $signed((~(|((^~wire0) ?
                  (reg48 ~^ wire1) : (reg48 ? reg56 : reg49)))));
              reg58 <= ({(wire0[(5'h11):(5'h10)] <= ({reg50,
                      wire45} >>> (reg48 ? reg50 : (8'ha4)))),
                  reg54} >= $signed((($unsigned(wire2) ?
                  wire3 : ((8'h9d) >= wire0)) == (reg50 ?
                  $signed(reg50) : $signed(reg50)))));
              reg59 <= (8'hb6);
              reg60 <= $unsigned(reg49[(3'h4):(2'h2)]);
              reg61 <= (+(8'hb5));
            end
          else
            begin
              reg57 <= $unsigned($unsigned(reg47[(1'h1):(1'h1)]));
            end
        end
      else
        begin
          reg56 <= ((8'hbc) ?
              (&(&((reg49 ? reg54 : reg55) >> (wire3 ?
                  wire1 : (8'had))))) : (~|$signed($unsigned(((8'hbe) ?
                  wire45 : wire0)))));
          reg57 <= reg55;
          if (reg53)
            begin
              reg58 <= $signed((((|$signed(reg54)) ?
                  wire45[(3'h7):(3'h5)] : $unsigned({wire0,
                      (8'hbd)})) < $signed(reg54)));
              reg59 <= $unsigned(reg54[(2'h3):(2'h2)]);
              reg60 <= reg53[(4'hb):(4'ha)];
              reg61 <= reg58;
              reg62 <= $signed((-((8'hbf) - (+(!wire3)))));
            end
          else
            begin
              reg58 <= (8'hb2);
            end
          if ({(!reg60), (-reg47)})
            begin
              reg63 <= {(~|({(8'ha5)} ? (8'ha4) : wire0[(4'he):(1'h1)])),
                  (reg48 <= wire1[(4'ha):(3'h6)])};
              reg64 <= wire45;
            end
          else
            begin
              reg63 <= (7'h40);
              reg64 <= (wire2[(5'h15):(3'h6)] >>> wire4);
            end
          reg65 <= ({($signed($unsigned(wire0)) >>> $unsigned($signed(reg57))),
              $unsigned($signed(reg58))} | ((~reg59) >>> {$signed((reg64 ?
                  reg59 : reg58)),
              wire52}));
        end
    end
  module66 #() modinst78 (wire77, clk, reg49, reg59, reg47, reg57);
  assign wire79 = (+(({(reg53 ~^ reg57),
                      $unsigned(wire1)} ^ $unsigned($unsigned(reg59))) >= $unsigned(((8'hb8) > $signed(reg51)))));
  module80 #() modinst162 (wire161, clk, reg48, wire52, reg56, reg54);
endmodule

module module80
#(parameter param159 = (~&(((((8'ha3) ? (8'had) : (8'h9c)) ? (-(8'hbe)) : (8'hb8)) * (-(&(8'hb5)))) ~^ ((^~((8'hbd) >> (7'h44))) == (!((7'h40) ? (8'hb4) : (8'hb1)))))), 
parameter param160 = (param159 ^ (param159 ? (param159 << ({(8'h9e), param159} >= (param159 << param159))) : {param159, {(~param159), {param159, param159}}})))
(y, clk, wire84, wire83, wire82, wire81);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire84;
  input wire [(4'ha):(1'h0)] wire83;
  input wire signed [(5'h10):(1'h0)] wire82;
  input wire signed [(4'hc):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire158;
  wire [(3'h4):(1'h0)] wire157;
  wire signed [(5'h11):(1'h0)] wire156;
  wire [(3'h6):(1'h0)] wire155;
  wire [(4'ha):(1'h0)] wire154;
  wire [(4'h9):(1'h0)] wire153;
  wire signed [(2'h3):(1'h0)] wire152;
  wire signed [(2'h2):(1'h0)] wire151;
  wire [(3'h4):(1'h0)] wire150;
  wire signed [(4'h8):(1'h0)] wire149;
  wire [(4'hc):(1'h0)] wire107;
  wire [(4'h9):(1'h0)] wire90;
  wire [(5'h12):(1'h0)] wire89;
  wire signed [(5'h13):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire87;
  wire [(4'hc):(1'h0)] wire86;
  wire signed [(5'h11):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire109;
  wire signed [(4'hf):(1'h0)] wire147;
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg91 = (1'h0);
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
                 wire107,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire109,
                 wire147,
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire85 = ((((wire81[(2'h2):(1'h1)] ? (~|wire83) : $unsigned(wire81)) ?
                          $unsigned((wire82 ?
                              wire83 : wire84)) : $signed(wire81[(3'h4):(2'h3)])) & (~&$unsigned($unsigned((8'hb9))))) ?
                      {{wire84}} : (wire82 ?
                          $signed({(wire84 ? wire82 : wire82),
                              $unsigned(wire84)}) : (wire84[(1'h1):(1'h0)] > {(wire81 ?
                                  wire83 : (8'hb5)),
                              $unsigned(wire84)})));
  assign wire86 = $signed(wire82[(4'hd):(3'h4)]);
  assign wire87 = $unsigned(wire84);
  assign wire88 = ($unsigned($unsigned($signed((wire81 == wire86)))) | {$unsigned(wire85[(5'h11):(5'h11)]),
                      (8'hbc)});
  assign wire89 = wire85[(2'h3):(2'h2)];
  assign wire90 = wire86[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg91 <= $unsigned(wire85);
      reg92 <= {$signed({$signed(wire89),
              ((wire88 ? wire83 : (8'ha0)) >> (8'hbf))})};
    end
  module93 #() modinst108 (wire107, clk, wire90, wire85, wire88, reg91);
  assign wire109 = {$unsigned(((!((8'ha5) ? wire87 : wire88)) ?
                           $unsigned((-wire84)) : (8'ha9))),
                       {$unsigned($signed((wire86 ? wire85 : wire82))),
                           wire84[(1'h0):(1'h0)]}};
  module110 #() modinst148 (.wire114(wire82), .wire113(wire109), .wire111(reg91), .clk(clk), .y(wire147), .wire112(wire84));
  assign wire149 = (~&wire84[(3'h4):(1'h0)]);
  assign wire150 = wire84;
  assign wire151 = reg91[(5'h15):(4'h8)];
  assign wire152 = ((|wire86) ~^ $signed(wire147[(3'h7):(2'h3)]));
  assign wire153 = wire83[(3'h7):(1'h1)];
  assign wire154 = wire81;
  assign wire155 = $signed(wire90[(4'h8):(1'h0)]);
  assign wire156 = (+$unsigned(((wire85 ?
                       wire152[(1'h0):(1'h0)] : $unsigned(wire107)) || wire88)));
  assign wire157 = $unsigned(wire149[(1'h0):(1'h0)]);
  assign wire158 = $signed(((wire107 ^~ $signed((wire90 & wire83))) ?
                       (8'hb9) : $unsigned($unsigned($signed(wire86)))));
endmodule

module module66  (y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire70;
  input wire [(2'h3):(1'h0)] wire69;
  input wire signed [(3'h4):(1'h0)] wire68;
  input wire [(4'hd):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire73;
  wire signed [(2'h3):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire71;
  assign y = {wire76, wire75, wire74, wire73, wire72, wire71, (1'h0)};
  assign wire71 = (8'hac);
  assign wire72 = wire69[(2'h2):(1'h1)];
  assign wire73 = ({$unsigned(((&(8'hb3)) | wire69))} != (^((~wire72[(1'h0):(1'h0)]) ?
                      {$unsigned(wire69)} : {wire70, $unsigned(wire67)})));
  assign wire74 = wire67[(4'h8):(3'h7)];
  assign wire75 = ({$unsigned($unsigned((wire71 >>> (8'hbd))))} ?
                      wire69[(1'h1):(1'h1)] : wire74[(3'h6):(1'h1)]);
  assign wire76 = $signed($signed(wire71));
endmodule

module module5
#(parameter param44 = (((~&((|(8'ha3)) <= (-(7'h42)))) <<< ((~|((8'hb8) ? (8'hb4) : (8'h9f))) || (-((8'hba) ? (8'had) : (8'ha8))))) == (~|(&((+(8'h9f)) ? ((8'ha2) <<< (7'h43)) : ((8'hb7) ? (8'ha2) : (8'ha7)))))))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h21):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire6;
  input wire [(5'h10):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire signed [(4'hc):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire25;
  assign y = {wire43, wire42, wire40, wire11, wire25, (1'h0)};
  assign wire11 = $unsigned(wire6[(2'h3):(1'h1)]);
  module12 #() modinst26 (.y(wire25), .wire17(wire6), .wire13(wire8), .clk(clk), .wire15(wire11), .wire16(wire9), .wire14(wire7));
  module27 #() modinst41 (wire40, clk, wire11, wire6, wire7, wire8);
  assign wire42 = ((~|{(8'ha7), $unsigned($unsigned((8'h9d)))}) << {(&wire9)});
  assign wire43 = (^~((~((wire11 ? wire8 : wire25) ?
                      wire40 : (wire40 ?
                          wire8 : wire42))) && {$unsigned($unsigned(wire42)),
                      (^~(7'h41))}));
endmodule

module module27
#(parameter param38 = (&{(|(((8'hbc) * (8'had)) >> (!(8'h9c)))), (8'hb8)}), 
parameter param39 = ((|param38) ^ param38))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire31;
  input wire [(4'h9):(1'h0)] wire30;
  input wire [(5'h10):(1'h0)] wire29;
  input wire [(5'h14):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire37;
  wire [(4'hd):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire32;
  assign y = {wire37, wire36, wire35, wire34, wire33, wire32, (1'h0)};
  assign wire32 = (+(~(~&wire31)));
  assign wire33 = wire28[(4'h8):(3'h6)];
  assign wire34 = {wire30, wire32[(3'h6):(2'h2)]};
  assign wire35 = (($unsigned((+$signed((8'ha7)))) ?
                      (~^($unsigned((8'ha3)) ?
                          $signed(wire30) : wire32)) : $unsigned({wire28})) <<< wire32);
  assign wire36 = $signed(wire31);
  assign wire37 = wire30[(2'h2):(2'h2)];
endmodule

module module12
#(parameter param24 = (((({(8'hbc), (8'ha1)} ~^ (8'ha8)) || (((8'hb1) ? (8'h9d) : (8'ha1)) ? (!(8'ha4)) : ((8'hb0) ? (8'h9c) : (8'hb9)))) > ((((8'h9e) ? (8'hba) : (8'haf)) ? (+(8'had)) : (|(7'h42))) ? (|(8'hbe)) : ({(8'haf), (8'hbb)} >> ((8'ha1) ^~ (8'ha4))))) ? (({((8'hb4) ? (8'hab) : (8'ha4))} ? ({(8'hb9), (8'hbc)} ? {(8'haa), (8'hac)} : {(8'hb4), (8'haa)}) : (8'ha3)) ? ((~^((8'h9c) >> (8'hb1))) ? ((~|(8'hbc)) ? (!(8'hb7)) : (8'haf)) : ((^(8'hb1)) ~^ (^~(8'hb6)))) : ((((8'hb4) ? (8'ha4) : (8'hbe)) ? {(8'haf), (8'hb1)} : (~&(8'h9e))) ? (~|((8'ha7) <<< (8'ha2))) : (((8'hb9) ^ (8'had)) & ((8'haf) ? (8'hbf) : (8'hbe))))) : ((8'hb4) ? ((((8'h9f) ? (8'hb8) : (8'hb3)) ? (^(8'ha1)) : ((8'ha5) ? (7'h43) : (8'ha7))) ? (8'hbe) : (8'hb3)) : (~|(((8'hac) ? (8'hac) : (8'ha7)) & ((7'h41) ? (8'ha4) : (8'ha9)))))))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire17;
  input wire [(5'h15):(1'h0)] wire16;
  input wire [(2'h3):(1'h0)] wire15;
  input wire signed [(3'h5):(1'h0)] wire14;
  input wire [(4'hd):(1'h0)] wire13;
  wire signed [(4'ha):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire18;
  assign y = {wire23, wire22, wire21, wire20, wire19, wire18, (1'h0)};
  assign wire18 = ((wire14[(3'h4):(2'h2)] ?
                      {wire17,
                          $unsigned($signed(wire13))} : (|wire16)) >>> wire14);
  assign wire19 = (((!(!(^~wire17))) & wire15[(2'h3):(2'h2)]) ?
                      $signed($unsigned(wire16[(4'hf):(2'h2)])) : {(wire14[(2'h3):(2'h2)] >> $signed(((8'hb9) ?
                              wire18 : wire15))),
                          wire14});
  assign wire20 = $signed(wire14[(3'h4):(1'h1)]);
  assign wire21 = wire15[(2'h2):(1'h0)];
  assign wire22 = ($unsigned($signed((wire20[(5'h14):(3'h6)] ?
                      (wire15 ?
                          wire13 : wire13) : (8'hae)))) != (|(+$signed((wire17 ?
                      wire21 : wire18)))));
  assign wire23 = (!wire19);
endmodule

module module110
#(parameter param146 = (((|(-{(8'hb7), (8'hbd)})) < ({(8'h9f), ((7'h40) ? (8'ha3) : (7'h40))} && {((8'ha1) <= (8'hbf))})) ? (({(!(8'ha3)), ((8'hbd) ? (8'ha1) : (8'hb0))} | (((8'ha9) >> (7'h42)) ? (|(8'h9c)) : {(8'h9f), (8'ha9)})) ? ((((8'ha8) ? (7'h41) : (8'hb2)) <= ((8'h9e) * (8'hb9))) - (((8'hb6) ? (8'hb7) : (8'hb5)) >= (&(8'ha0)))) : ((^((8'h9c) >> (7'h44))) & (((8'ha8) << (8'hb7)) ? ((8'h9d) >>> (8'hbd)) : (!(8'ha8))))) : ((7'h41) ? {({(8'h9c), (8'h9c)} < {(8'hbf)}), (~&((8'hb0) ? (7'h44) : (8'ha2)))} : (+(((8'haa) ^~ (7'h40)) + (&(8'hba)))))))
(y, clk, wire114, wire113, wire112, wire111);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire114;
  input wire signed [(2'h2):(1'h0)] wire113;
  input wire [(3'h5):(1'h0)] wire112;
  input wire signed [(3'h7):(1'h0)] wire111;
  wire signed [(5'h13):(1'h0)] wire145;
  wire signed [(3'h5):(1'h0)] wire144;
  wire [(3'h4):(1'h0)] wire143;
  wire [(2'h3):(1'h0)] wire142;
  wire signed [(3'h5):(1'h0)] wire136;
  wire signed [(5'h15):(1'h0)] wire135;
  wire [(5'h12):(1'h0)] wire134;
  wire signed [(3'h5):(1'h0)] wire133;
  wire signed [(2'h3):(1'h0)] wire132;
  wire [(4'hc):(1'h0)] wire119;
  wire signed [(3'h7):(1'h0)] wire118;
  wire [(4'hf):(1'h0)] wire117;
  wire [(4'ha):(1'h0)] wire116;
  wire signed [(2'h3):(1'h0)] wire115;
  reg signed [(5'h13):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg140 = (1'h0);
  reg [(4'hc):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg137 = (1'h0);
  reg [(2'h3):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg130 = (1'h0);
  reg signed [(4'he):(1'h0)] reg129 = (1'h0);
  reg [(4'ha):(1'h0)] reg128 = (1'h0);
  reg [(4'h9):(1'h0)] reg127 = (1'h0);
  reg [(4'h8):(1'h0)] reg126 = (1'h0);
  reg [(4'he):(1'h0)] reg125 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg124 = (1'h0);
  reg [(5'h10):(1'h0)] reg123 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg122 = (1'h0);
  reg [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
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
                 (1'h0)};
  assign wire115 = $unsigned($signed((wire114[(2'h3):(1'h1)] ?
                       ((wire111 ? wire111 : (8'hab)) | (wire113 ?
                           wire114 : wire111)) : ($signed(wire111) >>> (wire112 << wire114)))));
  assign wire116 = wire115[(1'h0):(1'h0)];
  assign wire117 = wire116[(1'h1):(1'h1)];
  assign wire118 = (~&(($unsigned($unsigned(wire112)) ^~ $signed($unsigned((8'ha5)))) ?
                       wire117 : $signed($unsigned(((8'h9c) ?
                           wire114 : wire117)))));
  assign wire119 = (8'h9f);
  always
    @(posedge clk) begin
      reg120 <= (wire117[(4'h9):(3'h7)] - $signed(((~&(wire119 >>> wire114)) ?
          wire113 : ($unsigned(wire118) ? wire116 : (wire116 >>> wire116)))));
      reg121 <= (~|$signed($unsigned($unsigned(wire113[(1'h0):(1'h0)]))));
      if ($unsigned((|wire116[(4'ha):(4'h8)])))
        begin
          reg122 <= (-($unsigned(wire119) ?
              (^~$signed((|wire113))) : ({(wire115 * wire118),
                      (wire115 ? wire112 : (8'hb7))} ?
                  {wire117[(1'h1):(1'h1)], $signed(wire117)} : ((reg120 ?
                          wire111 : wire114) ?
                      {wire119, wire112} : (wire119 ~^ wire115)))));
          reg123 <= (!wire115[(2'h3):(2'h2)]);
        end
      else
        begin
          reg122 <= wire114[(3'h5):(3'h4)];
        end
      if ((8'ha4))
        begin
          if ($signed(reg123))
            begin
              reg124 <= (~&(reg121[(1'h0):(1'h0)] > ((~$signed((7'h44))) ?
                  $signed($unsigned((8'ha3))) : (|$signed(wire114)))));
              reg125 <= {reg124,
                  {(reg123 ?
                          (wire111 & $unsigned(wire119)) : $signed((wire117 ^~ wire113)))}};
            end
          else
            begin
              reg124 <= $signed((~$unsigned($unsigned((reg120 && reg123)))));
              reg125 <= wire119[(2'h2):(2'h2)];
              reg126 <= {wire115};
            end
          reg127 <= (8'h9d);
          reg128 <= ((^(^$signed(((8'ha8) ? wire112 : reg126)))) ?
              {(wire111[(1'h0):(1'h0)] ?
                      (reg120 >> $signed((8'had))) : $signed(reg126))} : $signed(wire111));
          reg129 <= (reg126 ?
              (($signed(wire112[(2'h3):(1'h0)]) ?
                  $unsigned((+wire113)) : $signed(wire111[(1'h1):(1'h0)])) > $unsigned((&(^~wire118)))) : (($signed($signed(wire118)) ?
                  (reg120[(4'ha):(4'ha)] ^ {reg127,
                      reg122}) : reg120) || wire116));
          reg130 <= (!$signed((reg122 - (-(~(8'hb5))))));
        end
      else
        begin
          if ($unsigned((({reg126[(4'h8):(3'h7)], $unsigned(wire114)} ?
                  reg122 : reg124) ?
              $unsigned(reg123) : {$signed($unsigned((8'ha9))),
                  $unsigned($unsigned(reg126))})))
            begin
              reg124 <= $unsigned((($signed((reg128 - reg123)) <= $signed((reg121 ?
                  reg126 : wire119))) << wire111[(3'h6):(1'h0)]));
              reg125 <= (8'ha2);
              reg126 <= ((+(-((~|(8'hbd)) ?
                      {reg127, wire114} : (wire114 << wire117)))) ?
                  {$signed((((8'haf) ? (8'h9e) : reg129) ?
                          {wire118} : reg127))} : {wire117});
              reg127 <= reg121[(2'h3):(2'h2)];
              reg128 <= ((!$unsigned($unsigned({reg123}))) ?
                  wire111[(3'h4):(1'h0)] : ((wire117 >= ($signed(reg130) ~^ reg125[(1'h1):(1'h1)])) ?
                      $unsigned(reg120[(3'h7):(3'h4)]) : {((wire119 * (8'haf)) ?
                              wire114 : wire112[(3'h5):(1'h0)]),
                          $signed($unsigned(reg122))}));
            end
          else
            begin
              reg124 <= $unsigned(reg126);
              reg125 <= (^wire113);
              reg126 <= {(wire119[(1'h0):(1'h0)] ~^ (8'ha7))};
              reg127 <= reg130[(3'h5):(2'h3)];
            end
        end
      reg131 <= $unsigned(reg122);
    end
  assign wire132 = reg124[(3'h7):(1'h0)];
  assign wire133 = $unsigned((8'ha4));
  assign wire134 = ($unsigned(wire133) << (wire117[(3'h7):(3'h4)] ?
                       $unsigned(($unsigned(reg120) ?
                           (wire111 != wire114) : (+reg126))) : $unsigned(((~|wire133) != {reg131}))));
  assign wire135 = (&(+(({(7'h44)} >>> (reg125 ? (8'hb3) : wire117)) ?
                       (~$signed(wire118)) : {reg125, wire133})));
  assign wire136 = ($signed((8'ha9)) >= wire112[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      if (((reg126 < reg120[(4'hb):(4'h9)]) ?
          (reg129[(2'h3):(1'h0)] ?
              $unsigned((~^wire114[(3'h4):(3'h4)])) : wire113) : wire114))
        begin
          reg137 <= (reg120[(3'h4):(1'h0)] ^~ {($signed($unsigned(reg121)) ?
                  (|{reg130}) : {(-reg129)})});
          reg138 <= reg124[(4'h8):(2'h3)];
          reg139 <= (($signed($unsigned((wire136 != (8'h9d)))) | wire112) ?
              wire116[(4'h9):(3'h6)] : $signed(({$unsigned(reg125)} == $unsigned((reg123 ?
                  reg128 : reg130)))));
        end
      else
        begin
          reg137 <= {($signed(wire115[(2'h3):(2'h2)]) ?
                  $unsigned({$unsigned(reg123),
                      (~^wire111)}) : ({(reg122 > wire115), $signed((8'hb0))} ?
                      (8'hb1) : {(&(8'ha6))}))};
          reg138 <= $signed(((!$unsigned($unsigned((8'h9d)))) ?
              (($unsigned(wire114) ?
                  $unsigned(reg126) : $unsigned((8'ha8))) << wire117) : $unsigned(($signed((8'ha0)) + reg130))));
          reg139 <= $unsigned((~(^reg125)));
          reg140 <= wire114[(4'h9):(4'h9)];
        end
      reg141 <= (reg122 ? (~&reg126) : reg123);
    end
  assign wire142 = $unsigned((^~wire136));
  assign wire143 = $signed(reg125[(4'ha):(3'h7)]);
  assign wire144 = wire119[(3'h6):(3'h6)];
  assign wire145 = wire114[(2'h3):(2'h2)];
endmodule

module module93
#(parameter param106 = {(+{(((8'h9c) || (8'hbd)) > ((7'h40) >>> (7'h42)))}), ((+(~&((7'h44) == (8'ha7)))) != {{(|(8'ha4)), ((7'h43) ? (8'ha5) : (8'ha1))}, (|((8'hb9) - (8'h9f)))})})
(y, clk, wire97, wire96, wire95, wire94);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire97;
  input wire [(3'h7):(1'h0)] wire96;
  input wire signed [(5'h13):(1'h0)] wire95;
  input wire [(5'h14):(1'h0)] wire94;
  wire [(4'hc):(1'h0)] wire105;
  wire [(4'h9):(1'h0)] wire103;
  wire [(5'h12):(1'h0)] wire102;
  wire [(4'h9):(1'h0)] wire101;
  wire [(5'h14):(1'h0)] wire100;
  wire [(5'h11):(1'h0)] wire99;
  wire signed [(5'h14):(1'h0)] wire98;
  reg signed [(5'h14):(1'h0)] reg104 = (1'h0);
  assign y = {wire105,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 reg104,
                 (1'h0)};
  assign wire98 = $signed($signed((-wire95)));
  assign wire99 = $unsigned((&wire95[(5'h10):(2'h2)]));
  assign wire100 = ($unsigned($unsigned(({(8'hb2), wire99} ?
                       {(8'h9f),
                           wire98} : $signed(wire99)))) ~^ $unsigned({((|wire95) - (wire97 ?
                           wire98 : wire96)),
                       $unsigned((-wire99))}));
  assign wire101 = $unsigned(wire99);
  assign wire102 = $unsigned((($unsigned($unsigned(wire99)) <<< $unsigned(wire98)) ?
                       {$signed($unsigned(wire96)),
                           {$signed(wire99),
                               wire97[(2'h3):(2'h3)]}} : (wire94[(4'hb):(3'h5)] << wire99[(4'hb):(1'h0)])));
  assign wire103 = ((^~$signed(wire97[(3'h7):(2'h2)])) ^ $signed(wire102[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg104 <= (~&wire96);
    end
  assign wire105 = wire94;
endmodule
