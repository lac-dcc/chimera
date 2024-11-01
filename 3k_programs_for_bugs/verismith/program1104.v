module top
#(parameter param158 = (8'ha5), 
parameter param159 = (!({(param158 ? (param158 & param158) : {param158, (8'ha0)})} >> ((|(8'hb0)) ? (-(param158 <= param158)) : {param158}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire157;
  wire [(4'hc):(1'h0)] wire156;
  wire signed [(4'hf):(1'h0)] wire155;
  wire signed [(4'he):(1'h0)] wire153;
  wire signed [(5'h15):(1'h0)] wire152;
  wire [(4'h8):(1'h0)] wire151;
  wire [(3'h5):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire108;
  wire [(4'hf):(1'h0)] wire110;
  wire [(5'h15):(1'h0)] wire149;
  assign y = {wire157,
                 wire156,
                 wire155,
                 wire153,
                 wire152,
                 wire151,
                 wire4,
                 wire5,
                 wire17,
                 wire19,
                 wire20,
                 wire108,
                 wire110,
                 wire149,
                 (1'h0)};
  assign wire4 = (8'h9e);
  assign wire5 = wire4[(3'h5):(2'h2)];
  module6 #() modinst18 (.wire8(wire0), .wire7(wire3), .wire9(wire4), .clk(clk), .wire10(wire1), .y(wire17));
  assign wire19 = wire4[(2'h3):(2'h2)];
  assign wire20 = ($signed(wire19) + $unsigned(wire2[(3'h6):(3'h5)]));
  module21 #() modinst109 (wire108, clk, wire17, wire20, wire3, wire5);
  assign wire110 = wire3;
  module111 #() modinst150 (wire149, clk, wire17, wire3, wire0, wire19, wire1);
  assign wire151 = (~$unsigned({((wire149 <= wire0) <<< (wire5 ?
                           wire4 : wire2)),
                       $unsigned($unsigned(wire19))}));
  assign wire152 = wire2;
  module21 #() modinst154 (.wire22(wire149), .wire24(wire5), .wire23(wire2), .y(wire153), .wire25(wire152), .clk(clk));
  assign wire155 = $unsigned((wire110[(3'h4):(1'h0)] ?
                       wire3[(4'hb):(4'ha)] : wire110));
  assign wire156 = (8'hb8);
  assign wire157 = $signed((~|{((!wire1) ? (wire17 >> wire3) : (|wire17))}));
endmodule

module module111  (y, clk, wire116, wire115, wire114, wire113, wire112);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire116;
  input wire [(5'h13):(1'h0)] wire115;
  input wire [(5'h12):(1'h0)] wire114;
  input wire [(5'h14):(1'h0)] wire113;
  input wire signed [(3'h6):(1'h0)] wire112;
  wire signed [(4'hb):(1'h0)] wire148;
  wire [(2'h3):(1'h0)] wire147;
  wire [(4'hb):(1'h0)] wire146;
  wire [(4'hf):(1'h0)] wire145;
  wire signed [(4'hc):(1'h0)] wire144;
  wire [(4'hb):(1'h0)] wire143;
  wire signed [(4'he):(1'h0)] wire142;
  wire [(3'h4):(1'h0)] wire140;
  wire [(4'hc):(1'h0)] wire127;
  wire signed [(5'h14):(1'h0)] wire126;
  wire [(4'he):(1'h0)] wire125;
  wire [(4'hc):(1'h0)] wire124;
  wire [(4'h8):(1'h0)] wire123;
  wire signed [(4'ha):(1'h0)] wire122;
  wire [(4'ha):(1'h0)] wire119;
  wire signed [(2'h3):(1'h0)] wire118;
  wire signed [(4'ha):(1'h0)] wire117;
  reg signed [(4'hf):(1'h0)] reg121 = (1'h0);
  reg [(5'h13):(1'h0)] reg120 = (1'h0);
  assign y = {wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire140,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire119,
                 wire118,
                 wire117,
                 reg121,
                 reg120,
                 (1'h0)};
  assign wire117 = wire113;
  assign wire118 = wire115;
  assign wire119 = (((((wire113 ?
                           wire113 : wire114) != $signed(wire112)) ^~ (|$signed(wire118))) ?
                       wire114[(4'he):(4'hd)] : wire113[(1'h1):(1'h0)]) >> wire115[(4'hc):(1'h1)]);
  always
    @(posedge clk) begin
      reg120 <= $signed(wire112[(3'h5):(1'h0)]);
      reg121 <= $signed(((^~wire113) ?
          $signed((!$signed(wire119))) : wire115[(3'h6):(3'h4)]));
    end
  assign wire122 = (^~wire118[(1'h0):(1'h0)]);
  assign wire123 = wire116;
  assign wire124 = $signed({$signed(reg121[(4'hf):(3'h4)])});
  assign wire125 = (&wire118[(1'h0):(1'h0)]);
  assign wire126 = {$signed($unsigned(wire117))};
  assign wire127 = wire119;
  module128 #() modinst141 (.wire129(wire122), .wire131(wire127), .clk(clk), .wire132(wire126), .wire130(wire116), .y(wire140));
  assign wire142 = (8'hb5);
  assign wire143 = $unsigned((8'hbd));
  assign wire144 = (((!((wire127 ? wire122 : wire123) ? reg121 : wire114)) ?
                       $signed((~{(8'hab), wire124})) : wire123) - (~&((8'hbb) ?
                       wire123[(2'h2):(2'h2)] : wire127)));
  assign wire145 = ($unsigned((($unsigned(wire125) ^ (wire113 ?
                           (8'haf) : wire125)) <= ($signed(wire115) ?
                           ((8'haf) ? (8'h9d) : wire127) : $signed(wire113)))) ?
                       (8'haa) : wire124);
  assign wire146 = (-(~|({wire124[(1'h0):(1'h0)], {wire142}} >= (~|(8'hbb)))));
  assign wire147 = ($unsigned((((wire112 <= wire123) ?
                           $unsigned((8'ha0)) : $unsigned(wire122)) * $signed($signed(wire114)))) ?
                       $unsigned(wire127[(2'h2):(1'h1)]) : ($signed({(reg120 ?
                               wire116 : wire112),
                           (wire123 ?
                               wire113 : wire125)}) > wire127[(4'hc):(2'h2)]));
  assign wire148 = ($unsigned($signed($signed($signed(wire147)))) ?
                       $unsigned((~^$signed($signed(wire140)))) : (+$unsigned(wire142)));
endmodule

module module21  (y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire25;
  input wire [(2'h3):(1'h0)] wire24;
  input wire [(5'h13):(1'h0)] wire23;
  input wire [(5'h15):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire107;
  wire [(4'h9):(1'h0)] wire106;
  wire signed [(5'h13):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire104;
  assign y = {wire107,
                 wire106,
                 wire63,
                 wire27,
                 wire26,
                 wire65,
                 wire104,
                 (1'h0)};
  assign wire26 = $unsigned((~|(~^($signed((8'hb2)) >= (wire25 ?
                      wire23 : wire22)))));
  assign wire27 = wire26;
  module28 #() modinst64 (wire63, clk, wire27, wire25, wire22, wire23, wire26);
  assign wire65 = {($signed(($signed(wire63) * $signed(wire23))) <<< (((!wire27) > $unsigned(wire24)) && wire26[(3'h7):(1'h0)])),
                      wire25};
  module66 #() modinst105 (wire104, clk, wire27, wire25, wire65, wire22, wire63);
  assign wire106 = $unsigned((wire25 & {(~^(wire22 >= wire25)),
                       (~&(wire104 <<< wire25))}));
  assign wire107 = wire26;
endmodule

module module6
#(parameter param16 = (({(((8'haf) ? (8'ha3) : (7'h43)) ? (^~(8'hbd)) : ((8'ha8) >> (8'hae)))} ? {(^{(7'h44), (8'hbc)}), (~&(&(8'hb7)))} : ((^((8'had) ? (8'ha7) : (8'ha8))) ? {((8'hb1) ^~ (8'hb0)), {(8'hae)}} : ((8'hb4) ^~ ((8'ha9) ? (8'h9c) : (8'haa))))) ? (^(^((~&(8'hb8)) ~^ ((8'hb7) || (8'hb0))))) : ((|(|((8'ha3) ? (8'hac) : (8'hbb)))) >> ((((8'hbb) && (8'h9c)) ? ((8'h9f) ? (8'hbf) : (7'h40)) : {(8'haf)}) ? ((&(8'ha7)) >>> {(8'hb2)}) : {((8'hbc) >> (8'h9e)), ((8'hac) ? (8'ha0) : (8'hb7))}))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire signed [(2'h3):(1'h0)] wire9;
  input wire signed [(3'h7):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire11;
  assign y = {wire15, wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = $signed(wire7[(1'h1):(1'h1)]);
  assign wire12 = (&($signed(wire8) ?
                      $unsigned(((~|wire7) ^~ (+(8'ha6)))) : ((8'h9f) ?
                          wire9[(1'h1):(1'h0)] : {$unsigned(wire7)})));
  assign wire13 = $signed(($signed({wire8[(3'h4):(1'h0)]}) ?
                      wire9[(2'h2):(1'h1)] : {($unsigned(wire10) + (wire8 != wire10)),
                          (!$signed(wire7))}));
  assign wire14 = wire10[(1'h1):(1'h1)];
  assign wire15 = wire7[(3'h4):(2'h3)];
endmodule

module module66
#(parameter param103 = (~^(8'hac)))
(y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire71;
  input wire signed [(5'h15):(1'h0)] wire70;
  input wire [(4'hd):(1'h0)] wire69;
  input wire signed [(5'h14):(1'h0)] wire68;
  input wire [(4'hb):(1'h0)] wire67;
  wire signed [(2'h3):(1'h0)] wire102;
  wire [(5'h11):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire85;
  wire signed [(4'hc):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire82;
  wire signed [(3'h5):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire80;
  wire [(2'h3):(1'h0)] wire79;
  wire [(3'h4):(1'h0)] wire78;
  wire signed [(3'h5):(1'h0)] wire77;
  wire [(4'h9):(1'h0)] wire76;
  wire signed [(5'h10):(1'h0)] wire75;
  wire [(5'h13):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire72;
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg98 = (1'h0);
  reg [(2'h2):(1'h0)] reg97 = (1'h0);
  reg [(2'h3):(1'h0)] reg96 = (1'h0);
  reg [(3'h5):(1'h0)] reg95 = (1'h0);
  reg [(4'ha):(1'h0)] reg94 = (1'h0);
  reg [(5'h12):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg88 = (1'h0);
  reg [(2'h2):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  assign y = {wire102,
                 wire86,
                 wire85,
                 wire84,
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
                 wire72,
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
                 reg83,
                 (1'h0)};
  assign wire72 = wire68;
  assign wire73 = (((wire67 * ((wire68 ? (8'ha3) : wire69) == ((8'hb0) ?
                          (8'hb5) : wire72))) >>> (&$signed(((7'h41) != wire67)))) ?
                      (8'hb4) : (wire72[(3'h4):(2'h3)] ?
                          $signed(((!wire70) ?
                              (wire69 >> wire71) : (wire70 ?
                                  wire67 : (8'haf)))) : $unsigned($unsigned(wire68[(3'h6):(3'h5)]))));
  assign wire74 = wire67[(3'h6):(3'h5)];
  assign wire75 = wire71[(3'h6):(1'h1)];
  assign wire76 = {{(wire74[(3'h4):(2'h2)] ?
                              $unsigned($signed(wire70)) : {$unsigned(wire70)}),
                          $signed(({wire73} ?
                              $signed(wire73) : (wire67 ? wire69 : (8'hac))))}};
  assign wire77 = $unsigned(wire76[(2'h2):(2'h2)]);
  assign wire78 = wire72;
  assign wire79 = ((8'hbc) ~^ $unsigned({{wire73[(5'h11):(3'h6)]},
                      ({wire69, wire72} && wire73)}));
  assign wire80 = $unsigned($unsigned({wire79}));
  assign wire81 = $unsigned(wire73);
  assign wire82 = wire67[(3'h5):(3'h4)];
  always
    @(posedge clk) begin
      reg83 <= wire77;
    end
  assign wire84 = $signed($signed(wire74[(1'h1):(1'h0)]));
  assign wire85 = (-wire75[(3'h6):(3'h4)]);
  assign wire86 = ((&{(^(|wire74))}) != wire82[(4'hd):(2'h2)]);
  always
    @(posedge clk) begin
      reg87 <= wire78;
      if ((reg83 | wire79[(2'h2):(1'h1)]))
        begin
          if ((|(^~wire70[(5'h15):(1'h1)])))
            begin
              reg88 <= (wire67 != wire69);
              reg89 <= $signed((~&$signed(reg88)));
              reg90 <= wire80[(3'h7):(3'h7)];
            end
          else
            begin
              reg88 <= {wire77,
                  (wire69[(3'h4):(3'h4)] <= {(^~(wire86 ? wire76 : wire76)),
                      $unsigned((^~wire70))})};
              reg89 <= ((+$signed(wire84[(3'h4):(2'h2)])) >> wire70);
              reg90 <= wire86[(5'h11):(4'h9)];
            end
          if (wire81)
            begin
              reg91 <= (wire70 >> wire71);
            end
          else
            begin
              reg91 <= $unsigned((~|$signed({(wire80 ? (8'hbb) : wire85)})));
              reg92 <= wire68[(5'h12):(3'h5)];
              reg93 <= $unsigned((8'hb3));
              reg94 <= wire77;
            end
        end
      else
        begin
          reg88 <= {{(~^$unsigned((&wire84))),
                  $unsigned($signed((wire74 ? (8'hb1) : wire72)))}};
          reg89 <= wire80;
          if ($signed(((($signed(wire85) << wire75[(1'h0):(1'h0)]) ?
                  $signed($signed(reg90)) : ((8'ha5) < (-wire73))) ?
              wire76[(3'h7):(3'h7)] : (8'ha7))))
            begin
              reg90 <= {(($unsigned(wire85) ?
                      $unsigned((reg92 >> (8'haa))) : $unsigned($unsigned(reg94))) <<< reg88[(4'he):(1'h1)])};
              reg91 <= wire71[(3'h5):(1'h0)];
              reg92 <= wire72;
            end
          else
            begin
              reg90 <= (reg88[(4'he):(3'h4)] >>> wire77);
              reg91 <= wire86;
              reg92 <= wire80;
              reg93 <= reg94;
              reg94 <= ($signed(reg83[(1'h1):(1'h1)]) ?
                  ($signed(((~|reg94) - (~wire69))) != $unsigned({(~&wire85)})) : $unsigned((|((^(8'hb2)) ?
                      wire77[(1'h1):(1'h0)] : $signed(reg89)))));
            end
          reg95 <= $signed((~^(-wire71)));
          if ((&$signed(wire68)))
            begin
              reg96 <= $signed($unsigned(((~reg87[(2'h2):(1'h1)]) ?
                  (~|$unsigned((8'ha7))) : reg95)));
              reg97 <= (~&($signed($unsigned(reg83)) ?
                  (~$unsigned(wire73[(3'h4):(2'h2)])) : (-{(&wire77)})));
            end
          else
            begin
              reg96 <= (~&(!$signed((wire71[(4'hd):(4'hd)] <<< {wire74}))));
              reg97 <= reg93[(4'hc):(4'ha)];
              reg98 <= $signed((~|(!$unsigned(reg90))));
            end
        end
      reg99 <= reg96[(2'h2):(1'h0)];
      reg100 <= reg97;
      reg101 <= ($unsigned((~&reg100)) >= {$unsigned($signed((wire67 ?
              wire85 : reg100)))});
    end
  assign wire102 = $signed(reg94);
endmodule

module module28
#(parameter param62 = (|((+{((8'hbd) ? (8'ha4) : (8'hbf))}) ~^ {(~|((8'h9d) ? (8'hb3) : (8'h9e)))})))
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire33;
  input wire signed [(5'h13):(1'h0)] wire32;
  input wire signed [(4'hc):(1'h0)] wire31;
  input wire [(5'h13):(1'h0)] wire30;
  input wire signed [(5'h14):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire61;
  wire [(5'h11):(1'h0)] wire60;
  wire [(5'h14):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire52;
  wire [(2'h3):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire34;
  reg signed [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire54,
                 wire53,
                 wire52,
                 wire35,
                 wire34,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
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
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire34 = ((wire31[(4'hc):(3'h5)] - $signed((~wire32[(4'h9):(4'h8)]))) ?
                      (~&(wire32 ?
                          $unsigned($unsigned(wire29)) : wire30)) : {$signed($signed(wire33))});
  assign wire35 = $unsigned($signed(((+((8'hb0) != wire30)) || wire32[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg36 <= {$unsigned((~&(^(~(8'ha3))))),
          {(($signed((8'hbd)) * {wire30, (8'hbd)}) ^~ (|(wire32 != wire29))),
              $unsigned(wire31)}};
      if ((8'hac))
        begin
          if (wire34)
            begin
              reg37 <= reg36[(4'h9):(2'h3)];
              reg38 <= $unsigned((^(+((wire33 ? wire32 : (8'ha9)) ?
                  $signed(wire31) : $signed(reg37)))));
              reg39 <= $signed(wire31);
            end
          else
            begin
              reg37 <= reg39[(3'h5):(2'h2)];
              reg38 <= wire34;
              reg39 <= $unsigned(wire31[(4'hc):(4'hc)]);
              reg40 <= wire31;
            end
          reg41 <= (($signed($signed($signed((8'hb0)))) ^ reg36) ?
              (($unsigned($signed((8'hb0))) ?
                      {(wire33 ? reg39 : reg36),
                          (reg36 ?
                              reg40 : wire29)} : (reg38[(4'he):(2'h3)] || (wire30 | wire32))) ?
                  ($signed($signed(wire29)) ?
                      {(&wire32)} : ((8'hb1) ?
                          reg37[(1'h1):(1'h1)] : {wire31})) : {({wire32,
                          reg40} ^~ wire32)}) : wire31[(4'hc):(3'h4)]);
          reg42 <= {reg36[(3'h7):(1'h1)]};
          reg43 <= ($unsigned(reg40) != ({(wire35[(1'h0):(1'h0)] ?
                      $signed(wire32) : {reg40}),
                  wire31[(4'h9):(2'h3)]} ?
              wire29[(1'h0):(1'h0)] : $signed(wire33)));
        end
      else
        begin
          reg37 <= $signed($unsigned((&wire29[(4'hf):(4'he)])));
        end
      reg44 <= ({reg42[(4'h9):(1'h1)]} & ($unsigned($unsigned((reg41 ?
              reg40 : wire32))) ?
          {(^~$unsigned(reg42))} : {({reg43, wire35} ~^ $signed(reg43)),
              wire35[(1'h0):(1'h0)]}));
      reg45 <= $signed((-($signed((wire35 + (7'h41))) ?
          reg41[(4'hc):(4'hb)] : (reg40 ?
              ((7'h42) ? reg39 : reg44) : reg38[(4'hc):(3'h6)]))));
      reg46 <= ({reg39[(2'h3):(2'h2)]} ? reg36 : $signed(wire30));
    end
  always
    @(posedge clk) begin
      reg47 <= $signed($signed(((+$unsigned((8'hac))) * $signed($unsigned(reg36)))));
      reg48 <= (~$unsigned($unsigned((!(wire33 ? reg39 : (7'h42))))));
      reg49 <= $unsigned($signed(wire35));
      reg50 <= $unsigned(((($signed(reg46) ?
          $signed(reg44) : reg43[(2'h3):(1'h1)]) == {((8'had) >= wire33)}) ~^ $unsigned(reg40[(4'hd):(1'h1)])));
      reg51 <= ({$signed($unsigned(reg41[(1'h1):(1'h0)]))} ?
          reg41[(4'hb):(1'h1)] : $signed({$unsigned({reg38, reg40}),
              ((reg44 | reg47) ? wire35[(1'h1):(1'h1)] : reg45)}));
    end
  assign wire52 = ((~(~($signed((8'hbc)) ?
                      reg46[(4'h9):(4'h9)] : reg36[(3'h5):(1'h0)]))) < ($unsigned({reg50[(2'h2):(1'h1)],
                          $unsigned(reg40)}) ?
                      (^~$signed((reg39 ? wire32 : (8'ha0)))) : (|reg40)));
  assign wire53 = ((reg40[(4'hc):(1'h0)] ^~ (reg44 ?
                      (&$unsigned(wire30)) : reg49[(4'hb):(1'h1)])) > reg41);
  assign wire54 = reg41[(4'hc):(4'ha)];
  always
    @(posedge clk) begin
      reg55 <= $unsigned((^~$signed((wire30[(4'hd):(4'hb)] ?
          (|reg46) : reg44))));
      reg56 <= (8'ha4);
      reg57 <= (8'hb7);
      reg58 <= {$unsigned(wire53[(3'h6):(2'h3)])};
      reg59 <= (!$signed(((wire33 ^ (reg45 <<< reg36)) ?
          ($unsigned(reg49) ?
              (wire35 ? reg48 : reg46) : (reg57 ? wire29 : reg44)) : (!{reg41,
              (8'ha8)}))));
    end
  assign wire60 = reg45[(4'h8):(1'h1)];
  assign wire61 = (8'ha8);
endmodule

module module128  (y, clk, wire132, wire131, wire130, wire129);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire132;
  input wire signed [(4'hc):(1'h0)] wire131;
  input wire [(3'h7):(1'h0)] wire130;
  input wire signed [(3'h6):(1'h0)] wire129;
  wire [(4'hd):(1'h0)] wire136;
  wire [(3'h7):(1'h0)] wire135;
  reg [(4'hb):(1'h0)] reg139 = (1'h0);
  reg [(3'h5):(1'h0)] reg138 = (1'h0);
  reg [(2'h3):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg134 = (1'h0);
  reg signed [(4'he):(1'h0)] reg133 = (1'h0);
  assign y = {wire136, wire135, reg139, reg138, reg137, reg134, reg133, (1'h0)};
  always
    @(posedge clk) begin
      reg133 <= (~(wire129[(2'h3):(1'h1)] || {((!wire130) ?
              wire132 : {(8'ha6), wire130}),
          $signed(wire129[(2'h3):(2'h2)])}));
      reg134 <= ($unsigned((&({(7'h40),
          wire132} >> reg133[(4'he):(3'h7)]))) || $unsigned(wire132));
    end
  assign wire135 = $unsigned(($unsigned((~(wire129 ?
                       (8'h9f) : (8'ha1)))) || wire129[(3'h4):(1'h1)]));
  assign wire136 = ($unsigned(wire131[(4'hb):(3'h7)]) ?
                       ((^~wire132[(4'hc):(2'h3)]) + {(wire135 ?
                               (wire129 >> wire135) : wire135)}) : $unsigned($unsigned(wire135[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      reg137 <= (^$unsigned($signed(reg134[(1'h0):(1'h0)])));
      reg138 <= $signed($unsigned($signed($signed((reg134 ^ (7'h40))))));
    end
  always
    @(posedge clk) begin
      reg139 <= (((((reg133 ? reg134 : reg133) ?
          wire129[(3'h6):(3'h6)] : {(7'h43)}) >> ({wire131} || ((8'hb0) || wire129))) & wire130[(2'h2):(1'h0)]) < wire131[(3'h6):(3'h4)]);
    end
endmodule
