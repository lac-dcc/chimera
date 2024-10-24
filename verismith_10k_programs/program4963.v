module top
#(parameter param163 = ((((^(8'hb1)) << ({(8'haf), (8'ha3)} ? ((8'hb5) >= (8'ha1)) : ((7'h42) & (7'h41)))) ? {(((8'ha0) ? (8'had) : (8'ha6)) << ((8'hb9) | (7'h41))), ({(8'h9c), (8'hb7)} ? (~&(8'hb1)) : (^~(7'h44)))} : {(8'hb1), (~^((8'h9d) ^ (7'h44)))}) ? ((8'hb4) ? {(|(+(8'hae))), (^~(!(8'ha0)))} : (^~(((8'hae) <= (8'hb5)) << (^(8'hba))))) : (~{((!(8'hba)) & ((8'hbf) <= (8'hb0))), (((8'h9e) ^ (8'ha7)) >= (!(8'hb6)))})), 
parameter param164 = {param163, param163})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire signed [(5'h13):(1'h0)] wire156;
  wire [(2'h2):(1'h0)] wire155;
  wire signed [(3'h5):(1'h0)] wire154;
  wire [(5'h15):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire152;
  wire signed [(4'ha):(1'h0)] wire158;
  wire signed [(2'h3):(1'h0)] wire159;
  wire signed [(5'h11):(1'h0)] wire160;
  wire signed [(5'h14):(1'h0)] wire161;
  assign y = {wire156,
                 wire155,
                 wire154,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire152,
                 wire158,
                 wire159,
                 wire160,
                 wire161,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = $unsigned(wire4[(1'h0):(1'h0)]);
  assign wire6 = ($unsigned(((wire1 ?
                         (wire1 ? wire1 : wire2) : (wire1 ? wire1 : wire4)) ?
                     (wire3 << $signed(wire3)) : (~|$unsigned(wire4)))) <= wire3[(4'hf):(3'h5)]);
  assign wire7 = {$unsigned((8'hae))};
  module8 #() modinst153 (wire152, clk, wire2, wire6, wire4, wire3, wire7);
  assign wire154 = $signed((+{((wire0 ? wire4 : (8'hab)) ?
                           $unsigned(wire152) : {wire0}),
                       (+$signed(wire5))}));
  assign wire155 = $unsigned($signed((wire0 ^~ (7'h41))));
  module113 #() modinst157 (.wire118(wire152), .wire116(wire6), .clk(clk), .wire115(wire0), .wire117(wire5), .y(wire156), .wire114(wire1));
  assign wire158 = wire155[(1'h0):(1'h0)];
  assign wire159 = $unsigned(wire155);
  assign wire160 = wire4[(4'hf):(4'hd)];
  module73 #() modinst162 (wire161, clk, wire0, wire4, wire158, wire6, wire160);
endmodule

module module8
#(parameter param151 = {(((((8'hbc) && (8'ha2)) * (8'hb4)) ? (|((8'hb7) != (8'ha2))) : ({(7'h40)} ? {(8'ha7), (7'h42)} : ((8'hab) ^ (8'hbb)))) + ({(~&(8'h9f)), (8'haf)} != ({(8'hbe)} ? {(8'ha9), (8'haa)} : ((8'hba) ? (8'h9d) : (8'hbd)))))})
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire [(4'hf):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire signed [(4'ha):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire144;
  wire signed [(4'hc):(1'h0)] wire112;
  wire signed [(2'h2):(1'h0)] wire111;
  wire [(5'h14):(1'h0)] wire110;
  wire signed [(3'h5):(1'h0)] wire109;
  wire [(4'hc):(1'h0)] wire108;
  wire [(4'hb):(1'h0)] wire107;
  wire [(3'h4):(1'h0)] wire106;
  wire signed [(4'hc):(1'h0)] wire105;
  wire signed [(3'h6):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire103;
  reg signed [(4'he):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg148 = (1'h0);
  reg [(3'h7):(1'h0)] reg147 = (1'h0);
  reg [(4'hf):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  assign y = {wire144,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire71,
                 wire51,
                 wire21,
                 wire20,
                 wire19,
                 wire103,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= ({$signed($unsigned((wire10 ? wire12 : wire12))),
          $signed(((wire9 & wire9) <<< (|wire13)))} << $unsigned(wire10[(4'ha):(2'h2)]));
      if (($signed($signed(({wire13} ?
          $unsigned(wire12) : $unsigned(wire9)))) + wire12))
        begin
          reg15 <= (reg14[(4'hd):(4'h8)] ^~ $unsigned({$unsigned(reg14),
              wire11[(2'h3):(1'h0)]}));
          reg16 <= (wire11 ?
              (wire13 >= $unsigned((&(^~wire12)))) : ((($unsigned(wire9) << wire10[(4'hc):(2'h3)]) > (~|$signed(wire10))) + (~&((~wire10) ?
                  wire12 : (reg15 ? wire13 : reg14)))));
          if ($unsigned($unsigned($unsigned((7'h44)))))
            begin
              reg17 <= {reg15[(1'h0):(1'h0)]};
            end
          else
            begin
              reg17 <= reg16[(2'h3):(2'h2)];
            end
          reg18 <= reg14;
        end
      else
        begin
          reg15 <= ({($unsigned(((8'hac) ~^ (8'hb9))) ?
                  ((|reg14) ? (~&(8'ha5)) : $signed(reg16)) : (7'h41)),
              ($unsigned((|wire12)) ?
                  $unsigned(wire11[(3'h7):(1'h1)]) : wire10)} < reg17);
          reg16 <= ((^~wire10) ?
              (reg15[(3'h5):(2'h3)] << (((&reg16) ?
                      $unsigned((8'ha6)) : ((8'hab) ? reg18 : wire10)) ?
                  $unsigned(((8'h9d) >> reg16)) : wire10[(1'h0):(1'h0)])) : (7'h42));
          reg17 <= ((wire12[(4'he):(3'h7)] ?
              $unsigned(wire10) : ({(8'hb3),
                  (~|wire10)} | $unsigned(reg14[(5'h14):(3'h4)]))) | (|(!(-(-(8'hae))))));
        end
    end
  assign wire19 = {(!{(wire12 ? $unsigned(reg18) : $unsigned(wire10))})};
  assign wire20 = (wire19 ?
                      wire11[(3'h5):(2'h2)] : $signed($signed((~|wire11[(4'hd):(2'h3)]))));
  assign wire21 = wire20[(2'h2):(1'h1)];
  module22 #() modinst52 (.wire23(reg15), .clk(clk), .y(wire51), .wire24(wire13), .wire25(reg18), .wire26(wire20));
  module53 #() modinst72 (.clk(clk), .wire55(reg18), .wire56(wire10), .wire54(wire13), .y(wire71), .wire57(wire19));
  module73 #() modinst104 (.y(wire103), .clk(clk), .wire75(wire13), .wire74(reg18), .wire76(wire9), .wire78(reg15), .wire77(wire10));
  assign wire105 = ((wire20 ?
                       ((wire21 ? wire103 : $unsigned(wire51)) ~^ {(wire51 ?
                               reg14 : reg16),
                           wire103}) : (~|wire21)) ^ (+$unsigned(reg15)));
  assign wire106 = (-reg16[(1'h0):(1'h0)]);
  assign wire107 = {wire103, wire9};
  assign wire108 = {wire9};
  assign wire109 = {$signed($unsigned((~^(wire12 + reg15))))};
  assign wire110 = (~^{$unsigned($signed({wire21, wire10}))});
  assign wire111 = $unsigned(((!$unsigned(wire105[(4'hb):(4'hb)])) ?
                       wire105 : ({$signed(wire109),
                           $signed(wire103)} && (!((8'hb9) & wire19)))));
  assign wire112 = {wire10[(4'hc):(3'h7)]};
  module113 #() modinst145 (.wire115(wire108), .wire118(wire103), .wire114(wire11), .clk(clk), .wire117(reg17), .wire116(wire51), .y(wire144));
  always
    @(posedge clk) begin
      reg146 <= wire110[(1'h0):(1'h0)];
      if (((^{$signed(wire109[(2'h3):(1'h0)]),
          wire9[(2'h2):(2'h2)]}) || wire103[(3'h6):(3'h6)]))
        begin
          reg147 <= $signed(reg17[(2'h2):(1'h1)]);
          reg148 <= {((^(-wire108[(1'h0):(1'h0)])) >> $unsigned(wire112[(3'h5):(3'h4)])),
              $signed((((-reg18) ? wire20[(3'h4):(2'h2)] : wire12) ?
                  wire110 : (wire105[(1'h1):(1'h0)] ^ $signed(reg147))))};
        end
      else
        begin
          reg147 <= (($signed(({wire108} >> (!(8'ha0)))) * wire19) ^ (^(8'ha4)));
          reg148 <= $signed((7'h44));
          reg149 <= $unsigned((^~reg17));
          reg150 <= ((&wire13) ? $signed((8'ha1)) : $unsigned({{{reg147}}}));
        end
    end
endmodule

module module113
#(parameter param143 = ({((^((8'ha5) ? (8'hb0) : (8'ha6))) < ((~^(8'hbe)) ? ((8'ha3) <= (8'ha7)) : (8'hbe))), ({((7'h42) + (8'hb0)), (~|(8'ha6))} * (((8'ha0) + (7'h44)) ? (-(8'h9e)) : ((8'hb7) ^ (8'ha9))))} ? (((~|(-(8'ha3))) ? ((-(8'ha3)) <= ((8'ha4) ? (8'hb3) : (8'hbb))) : (-((8'ha2) && (8'ha5)))) <<< ((^{(7'h42)}) ? (((8'ha4) || (7'h43)) ? ((8'h9d) ? (8'hbf) : (8'hbc)) : ((8'h9e) + (8'h9c))) : (~^(&(8'hba))))) : ((8'hb5) ? (((^~(7'h41)) <= {(8'hbd), (8'hb7)}) >= ({(7'h41)} + (8'hb9))) : {({(8'ha7)} ? (~^(8'haa)) : ((8'hba) <<< (8'h9f))), {(+(8'hb5))}})))
(y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire118;
  input wire signed [(4'h9):(1'h0)] wire117;
  input wire [(5'h15):(1'h0)] wire116;
  input wire signed [(4'hc):(1'h0)] wire115;
  input wire [(5'h15):(1'h0)] wire114;
  wire signed [(4'hf):(1'h0)] wire142;
  wire [(2'h2):(1'h0)] wire141;
  wire signed [(5'h15):(1'h0)] wire140;
  wire signed [(5'h10):(1'h0)] wire139;
  wire [(3'h5):(1'h0)] wire131;
  wire signed [(5'h13):(1'h0)] wire130;
  wire [(4'hb):(1'h0)] wire129;
  wire signed [(3'h7):(1'h0)] wire127;
  wire [(5'h13):(1'h0)] wire126;
  wire [(5'h10):(1'h0)] wire125;
  wire [(4'hf):(1'h0)] wire124;
  wire signed [(4'hc):(1'h0)] wire123;
  wire [(4'hb):(1'h0)] wire122;
  wire signed [(5'h10):(1'h0)] wire121;
  wire [(2'h2):(1'h0)] wire120;
  wire [(4'hb):(1'h0)] wire119;
  reg signed [(5'h14):(1'h0)] reg138 = (1'h0);
  reg [(5'h13):(1'h0)] reg137 = (1'h0);
  reg [(5'h15):(1'h0)] reg136 = (1'h0);
  reg [(3'h5):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg128 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire131,
                 wire130,
                 wire129,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg128,
                 (1'h0)};
  assign wire119 = (!$unsigned(wire114));
  assign wire120 = wire114;
  assign wire121 = wire118;
  assign wire122 = $unsigned({$unsigned((~&(-wire117)))});
  assign wire123 = wire114[(4'hb):(4'h8)];
  assign wire124 = $signed(wire120);
  assign wire125 = wire123[(4'ha):(3'h4)];
  assign wire126 = wire120[(2'h2):(2'h2)];
  assign wire127 = {wire116,
                       ($unsigned(wire115[(3'h4):(2'h3)]) & $unsigned((8'ha1)))};
  always
    @(posedge clk) begin
      reg128 <= {(8'haa), $unsigned($unsigned(wire115))};
    end
  assign wire129 = wire115[(4'hc):(4'ha)];
  assign wire130 = reg128[(2'h2):(1'h0)];
  assign wire131 = ($signed({$unsigned((wire114 ? wire115 : wire118))}) ?
                       wire126 : $unsigned({$unsigned($unsigned(wire116)),
                           ({wire115} ? (8'hac) : (-reg128))}));
  always
    @(posedge clk) begin
      if ((~&((wire116 ?
          wire127[(2'h2):(2'h2)] : (^~wire130)) <<< $signed($signed((wire114 && wire118))))))
        begin
          reg132 <= ((~|wire131[(1'h1):(1'h1)]) ?
              $signed(wire124) : $unsigned((wire120 >> $unsigned(wire123[(4'hc):(4'hc)]))));
          reg133 <= wire124[(3'h6):(3'h6)];
        end
      else
        begin
          reg132 <= (|(wire125[(3'h7):(3'h5)] ?
              wire120 : ((wire127[(3'h6):(3'h6)] ~^ $signed(wire120)) < (wire119[(4'hb):(3'h5)] * (wire129 > wire125)))));
          reg133 <= {{$unsigned((|(wire118 || wire120)))},
              (~(wire120[(1'h1):(1'h0)] ? wire114 : $signed((~&wire118))))};
        end
      reg134 <= $unsigned((((8'hbc) ?
              ({reg133} ?
                  reg132[(2'h2):(1'h0)] : (wire126 ?
                      wire119 : reg132)) : $signed((~wire117))) ?
          wire131 : $unsigned($unsigned((wire118 || (8'hba))))));
      if (wire124[(4'ha):(3'h6)])
        begin
          reg135 <= wire127[(2'h3):(1'h1)];
          reg136 <= (8'ha8);
        end
      else
        begin
          reg135 <= (($unsigned({(~|wire116), wire123}) ?
              (wire122 && $unsigned(wire114[(5'h10):(4'hf)])) : wire129[(1'h1):(1'h0)]) ^~ $unsigned((($unsigned(wire125) & (~^reg128)) ~^ $unsigned((-wire114)))));
        end
      reg137 <= wire121;
      reg138 <= ((wire120 ?
          reg135 : {$unsigned(wire118),
              ((&(8'hb4)) >= wire114[(3'h4):(2'h2)])}) | $signed(reg133[(2'h2):(1'h1)]));
    end
  assign wire139 = $signed(wire130[(4'hc):(4'h9)]);
  assign wire140 = reg138;
  assign wire141 = (^wire131);
  assign wire142 = $signed((wire125[(4'hd):(2'h3)] > $signed($unsigned((|reg133)))));
endmodule

module module73
#(parameter param101 = {(7'h41), ((8'ha4) ? (|(((7'h44) < (8'ha6)) * ((8'hbe) ? (8'hbb) : (8'ha8)))) : {((|(8'ha1)) & ((8'ha6) ? (7'h41) : (8'hbc))), (~^((7'h43) ^ (8'ha6)))})}, 
parameter param102 = {(^{{{param101, param101}, param101}, ((~|param101) ? (param101 ? param101 : param101) : (param101 >>> param101))}), (8'ha0)})
(y, clk, wire78, wire77, wire76, wire75, wire74);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire78;
  input wire signed [(2'h2):(1'h0)] wire77;
  input wire signed [(4'ha):(1'h0)] wire76;
  input wire [(5'h12):(1'h0)] wire75;
  input wire signed [(5'h11):(1'h0)] wire74;
  wire [(3'h4):(1'h0)] wire97;
  wire [(4'ha):(1'h0)] wire96;
  wire [(4'ha):(1'h0)] wire86;
  wire [(5'h11):(1'h0)] wire79;
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg [(4'h9):(1'h0)] reg99 = (1'h0);
  reg [(3'h7):(1'h0)] reg98 = (1'h0);
  reg [(4'ha):(1'h0)] reg95 = (1'h0);
  reg [(4'h8):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg [(4'hc):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(3'h4):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire86,
                 wire79,
                 reg100,
                 reg99,
                 reg98,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 (1'h0)};
  assign wire79 = (^wire75);
  always
    @(posedge clk) begin
      reg80 <= wire78;
      reg81 <= wire76[(1'h1):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg82 <= ((($unsigned((wire74 < reg80)) + wire76) & (~|$signed((wire75 || reg80)))) == $unsigned((wire74[(4'he):(3'h4)] ~^ reg80)));
      reg83 <= (!$signed($unsigned($unsigned((~^wire75)))));
      reg84 <= wire74[(4'ha):(3'h4)];
      reg85 <= wire78;
    end
  assign wire86 = {(~^(~($signed(reg81) ~^ {wire78, wire78})))};
  always
    @(posedge clk) begin
      reg87 <= $unsigned(wire76);
      if (reg84[(1'h0):(1'h0)])
        begin
          reg88 <= {($unsigned($signed({wire78})) << wire78[(1'h0):(1'h0)]),
              ($signed($signed(wire86[(3'h7):(3'h7)])) ?
                  $unsigned(reg87) : (reg85[(4'hf):(2'h2)] + reg87[(2'h3):(2'h3)]))};
          reg89 <= wire79;
          reg90 <= {$unsigned((~&reg84))};
          reg91 <= $signed(($signed(wire75[(2'h3):(2'h2)]) ?
              wire86 : $signed({reg82})));
          reg92 <= (wire74 ~^ (+((^((8'ha6) ^ reg88)) + reg89[(3'h4):(3'h4)])));
        end
      else
        begin
          reg88 <= reg90;
        end
      reg93 <= $signed((~&$unsigned({(+(8'hbb)), $unsigned(wire76)})));
      reg94 <= reg83;
      reg95 <= (^~reg87);
    end
  assign wire96 = $signed(reg85);
  assign wire97 = ((~|wire75) ^ {reg94});
  always
    @(posedge clk) begin
      reg98 <= reg90;
      reg99 <= (8'haf);
      reg100 <= $unsigned($signed(reg89[(3'h4):(1'h0)]));
    end
endmodule

module module53
#(parameter param70 = (&(!({((8'hb9) ? (8'h9f) : (8'hb0))} ? (((8'haa) ? (8'ha5) : (8'haa)) <= ((8'ha2) ? (8'ha3) : (7'h40))) : ((^(8'hb3)) ? ((8'ha0) ? (8'hbf) : (8'ha9)) : ((8'ha5) ? (8'hb9) : (7'h41)))))))
(y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire57;
  input wire signed [(3'h4):(1'h0)] wire56;
  input wire signed [(2'h3):(1'h0)] wire55;
  input wire signed [(4'h8):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire69;
  wire [(5'h11):(1'h0)] wire68;
  wire [(3'h6):(1'h0)] wire67;
  wire signed [(4'hb):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire64;
  wire signed [(2'h2):(1'h0)] wire63;
  wire signed [(2'h3):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire58;
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire58,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  assign wire58 = $signed((wire54 * (~|(&(&wire56)))));
  always
    @(posedge clk) begin
      reg59 <= wire56;
    end
  always
    @(posedge clk) begin
      reg60 <= (~&(&(8'hbe)));
      reg61 <= wire57;
    end
  assign wire62 = (~^wire56);
  assign wire63 = (8'hae);
  assign wire64 = $signed((-wire57));
  assign wire65 = (!({$unsigned(wire56)} ?
                      (((wire62 ? wire56 : wire63) + (wire63 ?
                          wire55 : wire64)) - $unsigned((8'had))) : $unsigned((wire62[(1'h1):(1'h1)] ?
                          (wire54 << wire54) : ((8'haa) ? wire55 : wire55)))));
  assign wire66 = wire64;
  assign wire67 = $signed((reg61[(4'h8):(3'h6)] ^~ $unsigned($signed(wire55))));
  assign wire68 = ((^~wire63[(2'h2):(1'h0)]) <= (&(wire66[(4'h8):(3'h4)] ?
                      ($unsigned(wire67) ?
                          wire62[(2'h2):(2'h2)] : $signed(wire65)) : {(~&wire62)})));
  assign wire69 = {(~|((wire56[(1'h1):(1'h0)] ?
                              (wire63 ? (8'hbd) : wire56) : {(8'ha7), reg60}) ?
                          $signed(wire62[(1'h0):(1'h0)]) : ($signed(wire68) ?
                              wire65[(2'h3):(2'h2)] : (wire64 ?
                                  reg60 : wire62))))};
endmodule

module module22
#(parameter param49 = (|((!(8'ha1)) ? ((~|((7'h40) ? (8'ha2) : (8'hb8))) & (((7'h44) ? (8'hbc) : (8'h9d)) ~^ {(7'h41), (7'h44)})) : (!({(8'hbc), (8'hb0)} ? ((8'hbe) && (8'hbd)) : ((8'hb5) ? (8'hbf) : (8'ha8)))))), 
parameter param50 = (((param49 ? param49 : {(param49 << param49), (param49 ^ param49)}) >> (^param49)) >>> (~((^~(param49 ? param49 : param49)) && ((param49 || param49) ? param49 : (~|param49))))))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire26;
  input wire [(5'h12):(1'h0)] wire25;
  input wire [(5'h15):(1'h0)] wire24;
  input wire [(5'h15):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire27;
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire41,
                 wire27,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire27 = $unsigned(((wire24 ?
                          ($unsigned(wire26) <<< $signed(wire26)) : $signed($unsigned(wire24))) ?
                      {wire25} : (8'ha7)));
  always
    @(posedge clk) begin
      reg28 <= wire24[(2'h3):(2'h2)];
      if (wire27)
        begin
          reg29 <= wire27[(2'h2):(1'h0)];
          reg30 <= wire23;
        end
      else
        begin
          reg29 <= (~&wire23[(3'h7):(3'h4)]);
          reg30 <= ((reg28 ~^ ($unsigned((8'hb2)) ~^ (wire25[(3'h4):(1'h1)] - {(8'hbd),
              wire25}))) ~^ (wire27[(2'h3):(1'h1)] ?
              $signed((wire24 ? $signed(reg30) : wire26)) : (((reg28 ?
                      wire25 : wire23) ?
                  $signed(wire27) : $unsigned(wire25)) >> (~(reg29 ?
                  (8'hbe) : reg28)))));
          reg31 <= $unsigned({reg28[(2'h2):(2'h2)]});
        end
      if ({(~^$unsigned(((8'h9c) ? (reg31 ? wire26 : reg31) : {reg29}))),
          (!$signed(reg31[(4'h9):(2'h2)]))})
        begin
          reg32 <= {reg30[(3'h6):(2'h2)]};
          if (wire24)
            begin
              reg33 <= {(wire25[(3'h5):(3'h4)] ?
                      reg31 : ((wire25 != ((8'hae) ? wire26 : reg28)) ?
                          (reg31 <<< (wire26 ?
                              (7'h41) : wire26)) : $signed($signed((8'hb2))))),
                  ((~|$unsigned((wire24 - wire23))) & (wire27 ^~ $signed(wire27[(4'h8):(3'h4)])))};
              reg34 <= $signed(wire25[(3'h7):(3'h4)]);
              reg35 <= wire25[(5'h12):(4'hf)];
              reg36 <= $unsigned($unsigned((^(reg32 ? wire24 : (~&wire23)))));
              reg37 <= (-(($signed((reg30 ^~ reg31)) ?
                      (^{wire27}) : wire26[(3'h7):(1'h0)]) ?
                  reg29 : $signed((wire27[(2'h2):(1'h1)] ~^ (reg32 ~^ reg28)))));
            end
          else
            begin
              reg33 <= ($signed(wire27[(4'h9):(3'h4)]) + ($unsigned(($signed(wire26) ?
                      (wire26 & wire23) : reg28)) ?
                  wire24 : reg29));
              reg34 <= ($unsigned((~(~|reg32[(1'h0):(1'h0)]))) + {wire23[(5'h13):(5'h13)],
                  $signed(reg32[(1'h0):(1'h0)])});
            end
          reg38 <= wire24[(3'h6):(1'h0)];
          reg39 <= $signed(reg33[(3'h7):(3'h4)]);
          reg40 <= (((~^((wire26 >> wire27) ? reg28 : $unsigned(wire27))) ?
              ((!$signed(reg28)) ?
                  $signed(reg33[(3'h4):(2'h3)]) : {$signed(reg33)}) : reg31[(2'h3):(2'h2)]) > reg35[(3'h4):(3'h4)]);
        end
      else
        begin
          reg32 <= $unsigned(((($unsigned(reg38) <= $signed((8'ha0))) == wire24) ?
              wire23 : ((!(reg36 ~^ reg39)) ?
                  $signed({reg37}) : $signed(((8'hbe) ? wire27 : reg33)))));
          if ((&{(8'haa), ($signed($signed(reg33)) + wire26[(1'h0):(1'h0)])}))
            begin
              reg33 <= reg35;
            end
          else
            begin
              reg33 <= ($unsigned((reg29 ?
                      reg30 : ((|reg37) ? (reg38 << reg30) : reg29))) ?
                  (~|$signed((wire27[(4'h8):(2'h3)] < {(7'h41),
                      (8'ha2)}))) : wire27[(4'hb):(1'h1)]);
              reg34 <= (^~$unsigned({$signed((wire23 || reg28)),
                  ($unsigned(wire25) >= (wire27 * wire25))}));
              reg35 <= ({$signed((~|reg30[(3'h5):(2'h2)])),
                      ((~^(wire25 ? wire25 : wire23)) ?
                          reg29[(5'h10):(4'hc)] : $unsigned((reg38 ^ reg28)))} ?
                  reg34 : $unsigned({(reg38 && (reg38 || reg31)),
                      ((~|wire26) ? (~|wire24) : (reg28 & wire26))}));
            end
        end
    end
  assign wire41 = reg39[(3'h6):(3'h5)];
  always
    @(posedge clk) begin
      reg42 <= (reg38[(1'h1):(1'h1)] ? $unsigned(reg33) : {wire27});
      if ((|reg37[(3'h6):(3'h5)]))
        begin
          reg43 <= (reg35[(1'h0):(1'h0)] ? reg34[(2'h2):(1'h1)] : reg29);
          reg44 <= {(7'h40), (reg39[(4'he):(4'hc)] ^ reg42[(5'h11):(1'h0)])};
        end
      else
        begin
          reg43 <= ((reg39 == $signed($signed($signed((8'h9e))))) ?
              $signed(reg36) : $signed((8'ha3)));
        end
      reg45 <= reg40[(1'h1):(1'h0)];
      reg46 <= wire27[(3'h4):(2'h2)];
    end
  assign wire47 = $signed(wire23[(4'hc):(4'hb)]);
  assign wire48 = $signed($signed($unsigned((^~(reg39 ? reg43 : reg33)))));
endmodule
