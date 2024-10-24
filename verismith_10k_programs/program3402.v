module top
#(parameter param151 = (7'h42))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire144;
  wire signed [(3'h4):(1'h0)] wire143;
  wire [(3'h5):(1'h0)] wire142;
  wire signed [(3'h5):(1'h0)] wire141;
  wire signed [(4'h8):(1'h0)] wire140;
  wire [(5'h14):(1'h0)] wire139;
  wire signed [(3'h5):(1'h0)] wire138;
  wire [(4'hf):(1'h0)] wire137;
  wire [(4'ha):(1'h0)] wire136;
  wire [(5'h14):(1'h0)] wire135;
  wire [(4'he):(1'h0)] wire134;
  wire signed [(5'h13):(1'h0)] wire132;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire146;
  wire [(5'h13):(1'h0)] wire147;
  wire signed [(4'hf):(1'h0)] wire148;
  wire signed [(4'ha):(1'h0)] wire149;
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire132,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire146,
                 wire147,
                 wire148,
                 wire149,
                 (1'h0)};
  assign wire5 = $unsigned({(wire0 <<< $signed({wire4})),
                     $signed(wire0[(1'h0):(1'h0)])});
  assign wire6 = $unsigned($signed((^((wire1 ? wire0 : wire5) ?
                     (wire3 | wire5) : wire2[(1'h1):(1'h0)]))));
  assign wire7 = ((^$signed(wire1)) ?
                     $unsigned($unsigned(wire0[(2'h2):(2'h2)])) : wire4[(4'hd):(3'h4)]);
  assign wire8 = $unsigned(((wire6 ?
                         wire5[(2'h3):(2'h3)] : (wire2 ?
                             (wire6 ? wire6 : wire6) : (wire6 >> wire1))) ?
                     $unsigned(((~|wire5) ?
                         (-(8'hb5)) : (wire6 ? wire1 : wire7))) : wire2));
  module9 #() modinst133 (.wire10(wire1), .wire13(wire7), .wire12(wire5), .y(wire132), .wire11(wire2), .clk(clk));
  assign wire134 = wire8[(1'h1):(1'h0)];
  assign wire135 = wire2[(3'h4):(2'h2)];
  assign wire136 = $unsigned(($signed((~(~|wire6))) ?
                       wire1[(4'hc):(3'h7)] : $signed(wire135)));
  assign wire137 = wire6;
  assign wire138 = wire5;
  assign wire139 = {(|$unsigned({(wire8 >> wire4), $unsigned(wire137)})),
                       {(~&wire2[(3'h5):(1'h0)])}};
  assign wire140 = $signed(wire6);
  assign wire141 = ($signed($signed((8'hbb))) ?
                       (|((^~(wire4 ?
                           wire137 : wire137)) << $signed(wire8))) : $signed(((^wire134) ?
                           (((8'hbe) ? wire7 : wire136) ?
                               $unsigned(wire140) : (8'h9f)) : wire5[(4'hc):(4'hb)])));
  assign wire142 = ({$signed(((8'haf) ? wire137 : wire134[(1'h1):(1'h0)])),
                       (wire5[(3'h4):(3'h4)] == ($signed(wire137) ?
                           (wire140 ?
                               wire1 : wire132) : (!(8'hb5))))} << wire139);
  assign wire143 = (wire4 ?
                       (wire136[(1'h1):(1'h1)] ?
                           wire139[(3'h4):(1'h1)] : $unsigned(({wire138} ?
                               $signed(wire140) : (~^wire135)))) : (wire5 ?
                           $unsigned(wire1[(3'h7):(3'h4)]) : {wire3, (8'hb7)}));
  module16 #() modinst145 (wire144, clk, wire0, wire6, wire7, wire137, wire141);
  assign wire146 = ($unsigned(wire137) ?
                       {$signed($unsigned((wire0 & (8'hb0)))),
                           ({wire135[(5'h13):(1'h1)],
                               (wire134 ?
                                   wire142 : wire8)} - $unsigned(wire136[(4'h8):(3'h7)]))} : $unsigned({(^~$unsigned((8'hb1))),
                           $signed(wire135)}));
  assign wire147 = (wire140[(1'h0):(1'h0)] ^ wire7);
  assign wire148 = wire143[(1'h0):(1'h0)];
  module16 #() modinst150 (wire149, clk, wire140, wire135, wire146, wire147, wire4);
endmodule

module module9
#(parameter param130 = ((!(((^~(7'h40)) == ((8'hb6) >> (8'had))) & ((~(8'ha2)) >>> (|(8'hac))))) >>> ((|((!(8'h9c)) ^~ ((8'hb7) <= (8'h9f)))) ? ((((8'h9e) * (8'hb4)) != ((8'haf) * (8'ha3))) ? {((7'h43) ^ (8'ha7)), (^(8'ha7))} : ((~^(8'hbd)) <= {(8'hb8)})) : ((|((8'haa) ^ (8'had))) ? (!(~|(8'hae))) : {((8'hbf) == (8'haa)), ((8'ha9) ? (8'hb9) : (8'hab))}))), 
parameter param131 = (({((param130 * (7'h40)) ? (param130 != param130) : (^param130)), ((param130 ? param130 : param130) >> (param130 >= param130))} && ((8'hbb) ? (!(param130 ? param130 : param130)) : ((&param130) ^ (param130 ^~ param130)))) ? (^(|(!param130))) : param130))
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire13;
  input wire signed [(4'hf):(1'h0)] wire12;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire63;
  wire signed [(5'h11):(1'h0)] wire88;
  wire signed [(3'h5):(1'h0)] wire90;
  wire signed [(3'h5):(1'h0)] wire91;
  wire [(4'ha):(1'h0)] wire104;
  wire signed [(5'h12):(1'h0)] wire106;
  wire signed [(3'h5):(1'h0)] wire107;
  wire [(4'hd):(1'h0)] wire109;
  wire [(5'h15):(1'h0)] wire110;
  wire [(5'h12):(1'h0)] wire128;
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  assign y = {wire61,
                 wire15,
                 wire14,
                 wire63,
                 wire88,
                 wire90,
                 wire91,
                 wire104,
                 wire106,
                 wire107,
                 wire109,
                 wire110,
                 wire128,
                 reg108,
                 (1'h0)};
  assign wire14 = $unsigned($signed($signed(wire12[(4'hf):(4'hb)])));
  assign wire15 = ($signed((wire10[(1'h0):(1'h0)] ?
                      $signed(wire13) : ($signed(wire14) ~^ $signed(wire13)))) & $unsigned(($signed($unsigned(wire10)) < ($unsigned((7'h43)) ?
                      (~wire10) : wire12))));
  module16 #() modinst62 (wire61, clk, wire11, wire10, wire15, wire14, wire12);
  assign wire63 = wire14[(4'hf):(3'h7)];
  module64 #() modinst89 (wire88, clk, wire14, wire15, wire63, wire13);
  assign wire90 = $signed(((wire61 + (wire12[(4'hd):(2'h3)] == (^~(8'hae)))) ?
                      (~^((+wire15) ?
                          (wire15 == wire88) : (wire11 | wire11))) : (wire15[(4'h9):(3'h5)] ?
                          wire63 : ((^~wire11) * (wire11 ? wire13 : wire12)))));
  assign wire91 = wire10[(3'h4):(1'h0)];
  module92 #() modinst105 (wire104, clk, wire14, wire88, wire61, wire10);
  assign wire106 = wire10;
  assign wire107 = wire90[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg108 <= wire91[(3'h5):(3'h4)];
    end
  assign wire109 = (|($signed((-$unsigned(wire13))) > $signed(wire63[(4'h8):(4'h8)])));
  assign wire110 = (^~$unsigned($unsigned(wire12)));
  module111 #() modinst129 (wire128, clk, wire88, reg108, wire10, wire110);
endmodule

module module111
#(parameter param127 = ((|(8'ha2)) & (((^~((8'ha2) ? (7'h42) : (8'ha2))) ? (|(|(8'haa))) : (&((8'hac) <<< (7'h41)))) ? ((!((8'hbd) & (8'hb7))) * (^~((8'h9f) ~^ (8'h9d)))) : (&(((8'hb9) ? (8'hab) : (7'h41)) & ((8'hba) ? (8'hbb) : (8'haa)))))))
(y, clk, wire115, wire114, wire113, wire112);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire115;
  input wire signed [(5'h12):(1'h0)] wire114;
  input wire signed [(4'hc):(1'h0)] wire113;
  input wire signed [(5'h14):(1'h0)] wire112;
  wire signed [(2'h2):(1'h0)] wire126;
  wire signed [(5'h10):(1'h0)] wire125;
  wire [(2'h3):(1'h0)] wire124;
  wire signed [(2'h3):(1'h0)] wire123;
  wire [(4'hd):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire121;
  wire [(5'h11):(1'h0)] wire120;
  wire signed [(4'he):(1'h0)] wire119;
  wire signed [(5'h15):(1'h0)] wire118;
  wire signed [(4'hc):(1'h0)] wire117;
  wire [(3'h4):(1'h0)] wire116;
  assign y = {wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 (1'h0)};
  assign wire116 = $unsigned(wire114[(5'h11):(2'h2)]);
  assign wire117 = wire114[(1'h0):(1'h0)];
  assign wire118 = wire113;
  assign wire119 = wire117[(4'hc):(3'h7)];
  assign wire120 = ($signed({(!(+wire115)),
                       ($signed(wire116) ?
                           wire113[(3'h6):(3'h4)] : (wire113 == wire118))}) == wire118[(3'h5):(3'h5)]);
  assign wire121 = ($signed({{wire120[(5'h10):(4'h9)]},
                           (wire112[(4'ha):(4'ha)] * {wire112})}) ?
                       $unsigned($unsigned($signed({(8'hbe)}))) : (~^(~wire117[(1'h0):(1'h0)])));
  assign wire122 = wire121[(3'h4):(3'h4)];
  assign wire123 = wire114;
  assign wire124 = $unsigned($signed(wire117));
  assign wire125 = ($signed(((|{wire124}) ?
                       (~$signed(wire112)) : $signed(wire121))) - {(8'hb0)});
  assign wire126 = ($signed((wire124 & wire122[(4'h9):(2'h3)])) >= {wire117[(1'h1):(1'h0)]});
endmodule

module module92
#(parameter param102 = (({(((8'ha5) ? (8'hbb) : (8'ha9)) ? {(8'h9c), (8'ha3)} : ((7'h42) >= (8'ha9))), {((7'h40) + (8'hb7)), ((8'hbf) ? (8'hb0) : (8'hb7))}} <<< (+((~&(8'hbd)) <<< ((8'hbe) != (7'h44))))) ? {(|(((8'hb3) < (7'h44)) ^ {(8'h9d)})), ((((8'hbc) ^ (8'hb3)) - ((8'ha0) == (8'hb4))) >> (8'hb3))} : (~^({((8'hb7) && (8'hb6)), ((8'h9f) < (8'hae))} ? (|(~(8'hb9))) : {{(7'h44)}}))), 
parameter param103 = (^(+(((param102 >>> param102) & (param102 == param102)) ~^ {(param102 | param102), {param102}}))))
(y, clk, wire96, wire95, wire94, wire93);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire96;
  input wire signed [(2'h3):(1'h0)] wire95;
  input wire signed [(3'h6):(1'h0)] wire94;
  input wire signed [(5'h15):(1'h0)] wire93;
  wire [(4'ha):(1'h0)] wire101;
  wire signed [(5'h10):(1'h0)] wire100;
  wire signed [(3'h5):(1'h0)] wire99;
  wire [(5'h12):(1'h0)] wire98;
  wire [(3'h4):(1'h0)] wire97;
  assign y = {wire101, wire100, wire99, wire98, wire97, (1'h0)};
  assign wire97 = ((wire94 <= $unsigned(((wire96 < wire96) ~^ $signed(wire93)))) ?
                      $signed(wire93[(4'he):(4'hd)]) : $signed((wire94[(3'h4):(1'h0)] ?
                          {(8'hba),
                              {wire95,
                                  wire93}} : ((wire93 && wire95) < (8'hbc)))));
  assign wire98 = {wire94,
                      ({((wire95 ? wire95 : wire93) >> (wire93 << (8'hb3))),
                              ($unsigned(wire97) ?
                                  (wire93 ? wire93 : wire96) : (~wire95))} ?
                          wire93[(3'h7):(3'h5)] : wire93)};
  assign wire99 = $unsigned(({$unsigned(wire93),
                          $unsigned((wire98 ? (8'ha0) : wire95))} ?
                      $signed((+(-wire94))) : wire93));
  assign wire100 = {$signed(wire97), (~^wire93[(4'ha):(4'h9)])};
  assign wire101 = $signed(wire97[(1'h1):(1'h1)]);
endmodule

module module64
#(parameter param86 = (((!(!((8'ha5) ? (8'ha4) : (8'ha1)))) ? ((8'hbf) ? ((|(8'ha5)) != (+(8'hb1))) : ({(8'ha1)} <= ((8'haa) ? (7'h43) : (8'hb6)))) : (~^((~(8'ha3)) ? {(8'h9f), (8'hbe)} : (~^(8'had))))) ? ({(((8'hb8) * (8'hbc)) <<< ((8'had) ? (7'h44) : (8'h9d))), {((8'hac) ? (8'hb8) : (7'h44)), (~|(7'h41))}} | (^(+{(8'haa), (8'hb3)}))) : ((-{((8'hbe) ? (8'ha8) : (8'ha0)), ((8'ha0) ? (8'haf) : (8'hb0))}) ? (((^~(8'hb8)) * {(8'hbf)}) << (((8'hbe) ? (8'hac) : (8'hac)) & ((8'ha1) ? (8'h9c) : (8'hae)))) : (~&({(8'ha5), (8'hbd)} + (-(8'ha8)))))), 
parameter param87 = param86)
(y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire68;
  input wire signed [(5'h10):(1'h0)] wire67;
  input wire signed [(4'he):(1'h0)] wire66;
  input wire signed [(2'h3):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire84;
  wire [(4'hb):(1'h0)] wire83;
  wire signed [(4'ha):(1'h0)] wire82;
  wire [(3'h6):(1'h0)] wire81;
  wire [(4'h9):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire79;
  wire signed [(4'he):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire75;
  wire signed [(4'hd):(1'h0)] wire72;
  wire signed [(4'hb):(1'h0)] wire71;
  wire signed [(4'hb):(1'h0)] wire70;
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg69 = (1'h0);
  assign y = {wire85,
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
                 wire72,
                 wire71,
                 wire70,
                 reg74,
                 reg73,
                 reg69,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg69 <= (wire65[(2'h2):(1'h1)] ?
          $signed({((wire66 <= wire67) || {wire67}),
              {(wire67 + (8'ha3))}}) : wire67[(2'h2):(1'h1)]);
    end
  assign wire70 = {wire68[(3'h7):(2'h2)]};
  assign wire71 = $signed(($unsigned($unsigned(((8'hbd) ? wire66 : wire67))) ?
                      (~|wire70) : (|(wire68[(4'ha):(1'h1)] ?
                          $unsigned((8'ha1)) : wire67[(2'h3):(2'h2)]))));
  assign wire72 = $unsigned($signed(wire70[(3'h5):(1'h1)]));
  always
    @(posedge clk) begin
      reg73 <= (~&wire65[(2'h2):(1'h1)]);
      reg74 <= ($unsigned((wire65[(1'h1):(1'h1)] ~^ ({reg69,
              wire65} >>> ((8'ha0) ? reg73 : reg69)))) ?
          wire68[(4'h9):(1'h1)] : wire68[(3'h4):(3'h4)]);
    end
  assign wire75 = wire66[(3'h4):(1'h1)];
  assign wire76 = wire71[(2'h3):(2'h3)];
  assign wire77 = (|$unsigned({$signed({wire76, reg69}),
                      ((wire68 <= wire68) ? wire66 : wire67)}));
  assign wire78 = wire71[(3'h5):(1'h0)];
  assign wire79 = wire72;
  assign wire80 = wire67;
  assign wire81 = $unsigned((wire80 <<< (+$unsigned(((8'hb3) + (7'h40))))));
  assign wire82 = wire66[(4'hc):(3'h5)];
  assign wire83 = (~&((((wire75 > wire72) >>> $signed((8'h9d))) ^ (wire70 <= $signed(reg74))) ?
                      (|({wire68} - $signed(wire68))) : ((~^wire70) << $unsigned((8'hb5)))));
  assign wire84 = (((8'hbd) ?
                          $signed(((8'ha8) << $unsigned((7'h41)))) : (($signed(wire68) <= wire83[(3'h7):(2'h3)]) ?
                              ((^~wire70) ?
                                  (~wire78) : (wire80 ?
                                      reg73 : wire72)) : (~(wire82 < wire65)))) ?
                      reg73[(4'hd):(4'h9)] : ({$signed($signed(wire68)),
                          {$signed(wire66),
                              (|wire75)}} > (wire71[(4'hb):(4'h8)] || $unsigned(wire71[(4'h9):(1'h0)]))));
  assign wire85 = (8'haa);
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h1cf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire21;
  input wire signed [(3'h6):(1'h0)] wire20;
  input wire [(3'h4):(1'h0)] wire19;
  input wire signed [(4'hf):(1'h0)] wire18;
  input wire [(3'h5):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire56;
  wire signed [(3'h6):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire42;
  wire signed [(4'hc):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire34;
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ({wire17, wire18[(4'hc):(2'h3)]})
        begin
          reg22 <= wire20[(1'h1):(1'h1)];
          reg23 <= ($unsigned((($signed(wire17) * wire20[(2'h2):(2'h2)]) ?
                  {reg22[(3'h4):(2'h2)]} : (wire18 && $signed(wire17)))) ?
              wire18 : (wire19 ^~ (8'haa)));
        end
      else
        begin
          if ($signed($unsigned($unsigned((^(8'haa))))))
            begin
              reg22 <= reg22[(4'hd):(3'h6)];
            end
          else
            begin
              reg22 <= ((wire18 ~^ ((&((8'hb5) ?
                  wire21 : wire18)) != wire18[(4'ha):(2'h3)])) * (((reg22[(3'h4):(1'h0)] ^ (wire21 ?
                  wire20 : (8'hbe))) <<< $unsigned((wire18 ?
                  wire18 : wire20))) <= ((~wire21) ?
                  wire18[(4'hb):(3'h7)] : {(reg23 ? wire19 : wire18)})));
              reg23 <= $signed({reg23,
                  ({(&(8'h9c))} ?
                      {$signed((8'h9e)),
                          (reg22 & wire21)} : $signed((8'hb7)))});
              reg24 <= $unsigned(wire19);
              reg25 <= {$signed((wire18 ^ ($signed(reg24) * {wire18, wire21}))),
                  (wire18[(2'h3):(1'h0)] ?
                      (((~&wire19) ? (~^wire18) : wire18) ~^ ($unsigned(reg24) ?
                          wire17[(1'h1):(1'h0)] : (8'ha2))) : $unsigned(wire17))};
              reg26 <= $signed($signed(wire20));
            end
          if ((!$signed(($unsigned((wire21 ?
              wire20 : (8'ha2))) >> (|$unsigned(reg26))))))
            begin
              reg27 <= $signed(((^~(wire21[(2'h2):(2'h2)] | (reg24 ?
                      wire17 : reg23))) ?
                  wire18 : $signed(wire18[(2'h3):(1'h1)])));
            end
          else
            begin
              reg27 <= reg25;
            end
          reg28 <= {(8'ha4)};
          reg29 <= wire18[(4'ha):(4'h8)];
        end
      reg30 <= reg28;
      reg31 <= wire21;
      reg32 <= $signed((^~reg24));
      reg33 <= {((8'haf) ? (^(^$signed(reg23))) : $signed(wire19)),
          $unsigned(wire21)};
    end
  assign wire34 = ($unsigned($signed(wire20[(3'h4):(1'h1)])) | reg23[(4'ha):(3'h7)]);
  assign wire35 = $signed((-(({reg28} ?
                      $unsigned(reg26) : reg33[(3'h7):(3'h6)]) && $signed((reg27 ~^ (8'h9f))))));
  assign wire36 = (reg25 << $unsigned(($signed($unsigned(reg25)) ?
                      $signed($signed(reg25)) : reg26[(1'h0):(1'h0)])));
  assign wire37 = wire18[(4'hd):(3'h4)];
  assign wire38 = (~|wire19[(1'h1):(1'h1)]);
  assign wire39 = $signed($unsigned((reg30[(4'h9):(4'h8)] ?
                      {(^~wire20), $unsigned(reg23)} : (!$unsigned(reg25)))));
  assign wire40 = (~|wire20[(1'h1):(1'h0)]);
  assign wire41 = $unsigned($signed($unsigned(({wire21, wire36} ?
                      wire18[(3'h4):(1'h1)] : $signed((8'had))))));
  assign wire42 = $unsigned(wire19[(1'h0):(1'h0)]);
  assign wire43 = (|(&($unsigned($signed(reg24)) ?
                      (~|(+reg25)) : $signed((reg31 ? wire20 : (7'h41))))));
  always
    @(posedge clk) begin
      if (((^~(&{((8'hbc) ? reg22 : wire21),
          (wire35 | reg25)})) * $unsigned($signed($unsigned(reg25)))))
        begin
          if (($signed(reg33) ?
              wire42[(1'h0):(1'h0)] : (((~reg23[(1'h0):(1'h0)]) ?
                      wire41 : ({reg32, wire21} || (8'ha1))) ?
                  reg26[(1'h1):(1'h1)] : $unsigned($unsigned($unsigned(reg26))))))
            begin
              reg44 <= ((~^$unsigned($unsigned($unsigned(wire42)))) >= (|wire19));
              reg45 <= {wire38[(3'h6):(3'h4)],
                  (~|(reg44[(4'ha):(3'h4)] >>> wire19))};
            end
          else
            begin
              reg44 <= wire20[(3'h4):(1'h0)];
            end
          reg46 <= reg30[(3'h6):(3'h6)];
          if (((-wire36[(1'h0):(1'h0)]) ^~ $signed((+$unsigned((~&reg24))))))
            begin
              reg47 <= ((($signed((reg30 ^~ wire34)) >> (~&(reg31 ?
                      wire39 : wire19))) ?
                  (((wire41 - wire18) ^ {wire42}) > (~(^~(8'ha2)))) : $signed(((wire41 == reg25) >= (reg33 ?
                      reg44 : (8'ha6))))) >>> (~|$signed(({reg33,
                  wire37} << (wire41 || (8'ha4))))));
              reg48 <= $signed((^~wire40[(2'h2):(2'h2)]));
              reg49 <= reg26;
            end
          else
            begin
              reg47 <= $unsigned($unsigned((+$signed($unsigned((8'hbb))))));
              reg48 <= ((+(((^wire38) ?
                      (-reg24) : $signed(reg46)) >> $unsigned($signed(wire37)))) ?
                  $unsigned($unsigned(reg45[(3'h7):(2'h3)])) : ((+reg49[(3'h5):(1'h1)]) || wire17[(1'h1):(1'h1)]));
              reg49 <= reg45;
              reg50 <= ({$unsigned((~|(wire18 ?
                      (8'hb4) : reg25)))} == wire38[(1'h1):(1'h0)]);
            end
          reg51 <= reg48;
          reg52 <= $signed($unsigned(wire19[(3'h4):(1'h0)]));
        end
      else
        begin
          if ($signed((!$unsigned($unsigned((~^wire21))))))
            begin
              reg44 <= (8'ha2);
              reg45 <= $signed($signed((^(&reg32))));
              reg46 <= reg27[(2'h2):(1'h0)];
              reg47 <= reg30;
            end
          else
            begin
              reg44 <= $unsigned($unsigned(reg51[(2'h3):(1'h0)]));
              reg45 <= ($signed((8'h9f)) ?
                  ({{$unsigned((8'hb1))}} ?
                      (+reg49[(4'h9):(2'h3)]) : reg46) : reg45[(4'h8):(1'h1)]);
              reg46 <= $unsigned(wire40);
              reg47 <= wire40;
            end
          reg48 <= ((8'h9d) < reg28[(3'h4):(2'h3)]);
          reg49 <= wire37;
        end
      reg53 <= ($signed(($unsigned($unsigned(reg22)) ?
          reg23 : (~^reg48))) + $signed((-wire17)));
      reg54 <= ((+((|wire18[(4'hf):(4'ha)]) < (+{(8'hac)}))) ~^ wire41);
    end
  assign wire55 = $signed($signed(reg46));
  assign wire56 = (!((8'hb1) ?
                      ($signed((wire34 ?
                          wire39 : (8'haa))) <= $unsigned((reg32 & reg45))) : {wire34}));
  assign wire57 = wire37;
  assign wire58 = $signed(({($signed(reg45) * wire19)} == $signed(reg24)));
  assign wire59 = $signed((~wire43));
  assign wire60 = $unsigned((8'ha3));
endmodule
