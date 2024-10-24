module top
#(parameter param162 = ({({((8'h9f) * (8'hb6)), {(8'hb7)}} ? {(8'ha7)} : ((^~(8'hba)) >= ((7'h41) ? (8'hae) : (8'hb3)))), ({{(8'ha4)}} == ((7'h40) ? ((8'hb5) >= (8'h9f)) : ((8'had) << (8'ha8))))} ? {(~|(^((8'hab) << (8'ha2)))), ((8'ha9) ? {((8'hb8) + (8'h9d)), ((8'hba) ? (8'ha6) : (8'hae))} : (|((8'haa) >> (8'hb3))))} : (&((((8'hb7) < (8'ha8)) && ((8'hab) <<< (7'h41))) >>> ((|(8'hb8)) ~^ (~^(8'ha0)))))), 
parameter param163 = ((~&(((+param162) >> (8'ha5)) ? ((~|param162) ? {param162, (8'ha4)} : (param162 >= param162)) : ((param162 ? (8'hbb) : param162) ? param162 : (~&param162)))) ~^ ((~&{{param162, param162}, (8'h9f)}) ? ((((7'h41) ^ param162) <= {param162, param162}) ? (param162 >= (|(8'hb0))) : ({param162} + (param162 <= param162))) : param162)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire161;
  wire signed [(3'h7):(1'h0)] wire160;
  wire signed [(5'h14):(1'h0)] wire159;
  wire signed [(2'h3):(1'h0)] wire158;
  wire [(3'h5):(1'h0)] wire58;
  wire [(4'h9):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire156;
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire58,
                 wire11,
                 wire10,
                 wire5,
                 wire156,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 (1'h0)};
  assign wire5 = wire2[(4'hb):(3'h4)];
  always
    @(posedge clk) begin
      reg6 <= ((wire3[(4'hd):(4'h8)] ~^ (8'hbb)) ?
          (&wire2[(3'h5):(1'h0)]) : (~&($signed(wire3) ?
              wire4[(2'h2):(1'h0)] : (^~$unsigned(wire2)))));
      reg7 <= $signed($signed(({$signed((8'ha0)), wire3} ?
          ((~^reg6) == $unsigned(wire2)) : (&$signed(wire0)))));
      reg8 <= (^(({(wire1 < wire4),
              (wire4 + wire0)} || ((|reg6) < (reg7 * reg7))) ?
          ((~^(~^wire5)) ?
              $unsigned($unsigned(reg7)) : ($unsigned(wire4) >>> {(8'hb2),
                  wire0})) : wire4));
      reg9 <= wire5;
    end
  assign wire10 = $unsigned(wire4);
  assign wire11 = ((($unsigned((!wire4)) && $signed((wire1 - (8'ha8)))) ?
                          (reg6 ?
                              ((wire10 >> reg9) ?
                                  wire0 : wire3) : $unsigned((wire2 ^ wire10))) : $unsigned({wire3})) ?
                      ($signed(wire4[(2'h2):(1'h0)]) >> wire3[(4'he):(3'h7)]) : wire2[(4'hc):(4'hb)]);
  module12 #() modinst59 (.y(wire58), .wire15(wire4), .wire16(wire1), .wire13(reg9), .clk(clk), .wire14(wire2));
  module60 #() modinst157 (.clk(clk), .wire62(wire4), .y(wire156), .wire65(reg9), .wire63(reg7), .wire61(wire0), .wire64(wire1));
  assign wire158 = $unsigned((&(wire58 ?
                       $unsigned(wire10[(4'h8):(2'h3)]) : $signed((wire0 ?
                           wire4 : wire10)))));
  assign wire159 = wire11;
  assign wire160 = wire158;
  assign wire161 = (~(^$signed($signed((~|wire11)))));
endmodule

module module60
#(parameter param155 = ({((((8'hbf) ^ (8'ha5)) >>> (^(8'ha3))) ? (+((8'had) || (8'ha7))) : (|((8'ha2) > (8'hbd)))), ((~|{(8'hb3), (8'hbc)}) ? ({(8'had), (8'ha4)} < ((7'h44) ? (8'h9d) : (8'hb0))) : ((^(8'hb7)) ? (+(8'h9c)) : (~|(8'hae))))} && (((^~((7'h40) + (7'h41))) && ({(7'h42)} ~^ ((8'hb5) ? (7'h40) : (8'ha4)))) ? (^~((&(8'ha0)) ? (8'ha7) : ((8'h9f) ? (8'hb9) : (8'ha9)))) : ((!((8'hac) ? (8'ha8) : (8'hb9))) <= ((~^(7'h41)) ? ((7'h41) ^~ (8'ha3)) : ((8'hae) ? (8'haa) : (8'hb0)))))))
(y, clk, wire61, wire62, wire63, wire64, wire65);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire61;
  input wire [(5'h15):(1'h0)] wire62;
  input wire signed [(5'h13):(1'h0)] wire63;
  input wire signed [(3'h6):(1'h0)] wire64;
  input wire signed [(4'hc):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire154;
  wire [(4'h8):(1'h0)] wire153;
  wire [(3'h7):(1'h0)] wire152;
  wire [(5'h14):(1'h0)] wire151;
  wire [(4'h9):(1'h0)] wire150;
  wire signed [(5'h13):(1'h0)] wire148;
  wire signed [(5'h15):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire68;
  wire [(3'h6):(1'h0)] wire69;
  wire [(4'hc):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire72;
  wire signed [(3'h7):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire92;
  wire [(5'h14):(1'h0)] wire93;
  wire [(3'h7):(1'h0)] wire94;
  wire [(4'h9):(1'h0)] wire129;
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire148,
                 wire67,
                 wire68,
                 wire69,
                 wire71,
                 wire72,
                 wire73,
                 wire74,
                 wire90,
                 wire92,
                 wire93,
                 wire94,
                 wire129,
                 reg66,
                 reg70,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg66 <= {(wire63[(4'hb):(4'ha)] & wire64[(1'h0):(1'h0)]),
          ($signed(wire65) * $signed(wire64))};
    end
  assign wire67 = {(wire63 ?
                          (wire62[(2'h3):(2'h2)] >> ((~&(8'hbd)) ?
                              (reg66 != reg66) : wire64[(3'h5):(2'h3)])) : wire61),
                      $unsigned(($signed((wire63 ?
                          wire64 : wire63)) - $signed(wire64)))};
  assign wire68 = wire65[(3'h4):(2'h3)];
  assign wire69 = $signed(wire68);
  always
    @(posedge clk) begin
      reg70 <= ($unsigned(wire62) >> $signed($signed(((wire67 == wire61) ?
          (8'hba) : wire68))));
    end
  assign wire71 = $unsigned($signed((($signed(wire69) ?
                          (^wire63) : $unsigned(reg66)) ?
                      $signed(wire68[(2'h3):(1'h0)]) : (^~(wire65 ?
                          wire65 : reg70)))));
  assign wire72 = ($signed($unsigned($signed((^(8'hbd))))) == wire64[(3'h5):(2'h2)]);
  assign wire73 = $signed(($signed((&wire65[(2'h3):(1'h1)])) & {(wire68[(1'h1):(1'h1)] > $signed(wire71))}));
  assign wire74 = {(wire67 ?
                          ((~|wire64) < ($signed(reg66) ?
                              (~&(8'ha1)) : wire65)) : $unsigned(wire65[(2'h2):(2'h2)])),
                      ($unsigned(wire72) >>> {(^wire73)})};
  module75 #() modinst91 (wire90, clk, wire74, reg70, wire67, wire69, wire63);
  assign wire92 = (wire90 ?
                      {$unsigned($unsigned((7'h44))),
                          $signed(((wire71 ?
                              (8'had) : wire90) <<< wire68[(1'h0):(1'h0)]))} : (wire68 ?
                          (wire67 ?
                              $unsigned((^~wire67)) : ($unsigned(wire67) <= $unsigned(wire72))) : $unsigned(($unsigned((8'hb2)) ?
                              wire64[(3'h5):(2'h2)] : wire65))));
  assign wire93 = $signed($unsigned($signed(wire69)));
  assign wire94 = wire93;
  module95 #() modinst130 (wire129, clk, wire73, wire71, reg66, wire67);
  module131 #() modinst149 (wire148, clk, wire129, wire65, wire61, wire69, reg70);
  assign wire150 = $unsigned($signed((wire71[(3'h4):(1'h1)] >> wire65)));
  assign wire151 = ($signed(($signed(wire62) || (8'ha8))) ?
                       (wire62[(4'hc):(3'h6)] << (wire64[(1'h1):(1'h0)] > ($unsigned(wire150) ?
                           $unsigned(wire74) : ((8'hac) >> (8'hb0))))) : $unsigned($signed($unsigned($signed(wire61)))));
  assign wire152 = $unsigned((&(&(^~(+wire65)))));
  assign wire153 = $unsigned($signed(wire71[(4'hb):(1'h0)]));
  assign wire154 = $unsigned((^~(7'h40)));
endmodule

module module12  (y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire16;
  input wire signed [(5'h14):(1'h0)] wire15;
  input wire [(5'h10):(1'h0)] wire14;
  input wire signed [(4'hb):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire56;
  wire [(4'hf):(1'h0)] wire55;
  wire signed [(4'hb):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire53;
  wire signed [(3'h7):(1'h0)] wire52;
  wire signed [(4'he):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire50;
  wire [(3'h7):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire46;
  wire signed [(2'h3):(1'h0)] wire31;
  wire signed [(4'ha):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire17;
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire46,
                 wire31,
                 wire30,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg57,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire17 = ((!(($unsigned(wire16) < $signed(wire14)) ?
                          wire15[(2'h2):(2'h2)] : $signed($signed((8'hae))))) ?
                      $unsigned((|$signed($signed((8'hb3))))) : (wire15 + ($signed((wire13 >= wire14)) ?
                          (&wire14[(3'h4):(1'h0)]) : wire15)));
  assign wire18 = ((-wire14[(2'h2):(1'h0)]) || wire17);
  assign wire19 = (wire18 <= {(((~&wire15) ?
                          $unsigned((7'h44)) : (wire16 ?
                              wire13 : wire15)) << wire14)});
  assign wire20 = $unsigned(wire19);
  assign wire21 = (^~$unsigned({((!wire18) ?
                          $unsigned(wire15) : (wire19 > wire17)),
                      wire16[(4'ha):(3'h5)]}));
  assign wire22 = wire18[(1'h0):(1'h0)];
  assign wire23 = wire20[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      if (wire18[(3'h6):(3'h5)])
        begin
          reg24 <= (~&wire17);
          reg25 <= wire16[(4'hb):(2'h3)];
        end
      else
        begin
          if ((-{reg24[(2'h2):(2'h2)]}))
            begin
              reg24 <= $signed({wire14[(4'hd):(4'hc)],
                  (+{(wire17 ? wire14 : wire19), (~wire14)})});
              reg25 <= ($signed(wire17[(2'h3):(1'h0)]) ^~ $signed(wire14));
              reg26 <= $unsigned((reg24 & ((wire15[(5'h11):(4'he)] ?
                  wire20 : wire13) + wire15)));
              reg27 <= (~^wire18[(1'h0):(1'h0)]);
            end
          else
            begin
              reg24 <= (~^(~&reg26[(1'h0):(1'h0)]));
              reg25 <= ($signed(wire19) ?
                  $signed($signed(wire22[(3'h7):(3'h5)])) : {{wire19}});
            end
          reg28 <= (~&wire15);
          if ($unsigned((!wire23[(4'h8):(2'h3)])))
            begin
              reg29 <= wire23[(2'h3):(1'h1)];
            end
          else
            begin
              reg29 <= wire22[(1'h1):(1'h0)];
            end
        end
    end
  assign wire30 = $unsigned($unsigned($signed(wire18)));
  assign wire31 = $signed($signed((wire15 ?
                      reg29 : $signed(reg27[(3'h4):(3'h4)]))));
  module32 #() modinst47 (wire46, clk, wire22, wire15, wire21, wire16);
  assign wire48 = $unsigned($unsigned(wire46));
  assign wire49 = $signed($signed(wire16));
  assign wire50 = wire18;
  assign wire51 = reg26;
  assign wire52 = {$unsigned($signed($signed((wire16 ? wire18 : reg24))))};
  assign wire53 = wire23[(4'h9):(3'h5)];
  assign wire54 = $signed($signed(wire52));
  assign wire55 = $signed($signed(wire48[(1'h1):(1'h0)]));
  assign wire56 = $signed($unsigned(wire55[(4'hf):(4'hf)]));
  always
    @(posedge clk) begin
      reg57 <= ($signed((-wire23)) ?
          $signed(({$signed(wire51),
              (wire22 ?
                  wire15 : wire23)} & $signed(((8'hb0) >>> wire55)))) : ($signed(((wire16 <= reg25) & $signed((8'hbe)))) ?
              (~&wire54[(3'h4):(1'h0)]) : $unsigned((8'hbc))));
    end
endmodule

module module32  (y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire36;
  input wire signed [(5'h13):(1'h0)] wire35;
  input wire signed [(5'h14):(1'h0)] wire34;
  input wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(2'h2):(1'h0)] wire45;
  wire signed [(2'h3):(1'h0)] wire44;
  wire signed [(4'h8):(1'h0)] wire43;
  wire [(5'h13):(1'h0)] wire42;
  wire [(4'ha):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire37;
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 (1'h0)};
  assign wire37 = (^({wire35[(5'h13):(4'hf)]} ?
                      $signed(wire34[(3'h6):(3'h6)]) : {wire33[(2'h2):(1'h0)],
                          {wire36[(3'h4):(1'h0)], wire36}}));
  assign wire38 = $signed($signed($signed(wire33[(2'h3):(2'h2)])));
  assign wire39 = {($unsigned($unsigned((!wire38))) >= wire33[(2'h2):(1'h1)]),
                      wire36};
  assign wire40 = wire33;
  assign wire41 = $signed(wire33[(2'h3):(1'h1)]);
  assign wire42 = ($signed((!(&wire38[(3'h6):(1'h1)]))) ?
                      (wire37[(1'h0):(1'h0)] ?
                          wire40 : (wire35 && $signed($unsigned(wire40)))) : wire39);
  assign wire43 = wire40[(5'h13):(4'hf)];
  assign wire44 = ($unsigned($signed((wire39 ?
                          wire35 : wire38[(3'h6):(3'h6)]))) ?
                      $signed(wire35) : ((wire36 ?
                              ($signed(wire38) ~^ {wire41}) : ($signed(wire43) ^ (&wire38))) ?
                          wire35[(5'h10):(4'hd)] : $unsigned($unsigned($unsigned(wire36)))));
  assign wire45 = (~|$unsigned(wire36));
endmodule

module module131  (y, clk, wire136, wire135, wire134, wire133, wire132);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire136;
  input wire signed [(4'hc):(1'h0)] wire135;
  input wire [(5'h13):(1'h0)] wire134;
  input wire signed [(2'h2):(1'h0)] wire133;
  input wire [(4'h8):(1'h0)] wire132;
  wire [(2'h2):(1'h0)] wire147;
  wire signed [(2'h2):(1'h0)] wire146;
  wire signed [(5'h13):(1'h0)] wire145;
  wire [(4'hc):(1'h0)] wire144;
  wire [(4'he):(1'h0)] wire143;
  wire [(4'hf):(1'h0)] wire142;
  wire signed [(5'h15):(1'h0)] wire141;
  wire signed [(3'h6):(1'h0)] wire140;
  wire signed [(3'h6):(1'h0)] wire139;
  wire signed [(2'h2):(1'h0)] wire138;
  wire [(4'hc):(1'h0)] wire137;
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 (1'h0)};
  assign wire137 = ($unsigned(wire134[(4'hf):(4'he)]) ? wire135 : wire136);
  assign wire138 = wire134[(5'h11):(4'hc)];
  assign wire139 = (~|wire132[(2'h3):(1'h0)]);
  assign wire140 = $unsigned(wire137[(4'hc):(4'hc)]);
  assign wire141 = (+(|($signed($unsigned(wire135)) ?
                       (wire137 <= (wire134 <<< wire137)) : $unsigned(wire134))));
  assign wire142 = $signed($unsigned((wire136[(1'h1):(1'h1)] ?
                       $unsigned((~wire134)) : $signed($unsigned(wire139)))));
  assign wire143 = $signed($unsigned(wire136));
  assign wire144 = ($signed(($signed(wire141) ^~ $signed((wire136 ^~ wire139)))) >> (8'h9f));
  assign wire145 = wire142;
  assign wire146 = ($unsigned($signed(((wire134 - wire142) ?
                           (wire142 ? wire134 : wire139) : wire133))) ?
                       wire132[(3'h4):(3'h4)] : $signed((wire144[(1'h1):(1'h0)] ?
                           wire137[(2'h3):(1'h1)] : (~|(8'hb9)))));
  assign wire147 = $signed(wire142[(4'h9):(3'h4)]);
endmodule

module module95
#(parameter param128 = (~(~^{{((8'hb1) ? (8'ha5) : (8'hab)), (8'h9e)}})))
(y, clk, wire99, wire98, wire97, wire96);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire99;
  input wire [(4'hc):(1'h0)] wire98;
  input wire signed [(4'hf):(1'h0)] wire97;
  input wire signed [(3'h7):(1'h0)] wire96;
  wire signed [(2'h3):(1'h0)] wire127;
  wire signed [(5'h13):(1'h0)] wire126;
  wire [(4'h9):(1'h0)] wire125;
  wire signed [(4'h9):(1'h0)] wire124;
  wire [(5'h11):(1'h0)] wire123;
  wire [(2'h2):(1'h0)] wire122;
  wire signed [(5'h10):(1'h0)] wire121;
  wire signed [(3'h6):(1'h0)] wire120;
  wire [(4'ha):(1'h0)] wire119;
  wire [(4'hb):(1'h0)] wire118;
  wire [(3'h7):(1'h0)] wire117;
  wire signed [(4'hc):(1'h0)] wire116;
  wire signed [(4'h8):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire114;
  wire signed [(5'h14):(1'h0)] wire105;
  wire signed [(4'h9):(1'h0)] wire104;
  wire signed [(4'h8):(1'h0)] wire103;
  wire [(3'h6):(1'h0)] wire102;
  wire [(3'h7):(1'h0)] wire101;
  wire [(5'h11):(1'h0)] wire100;
  reg signed [(3'h5):(1'h0)] reg113 = (1'h0);
  reg [(5'h12):(1'h0)] reg112 = (1'h0);
  reg [(5'h13):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg109 = (1'h0);
  reg [(3'h5):(1'h0)] reg108 = (1'h0);
  reg [(3'h6):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  assign y = {wire127,
                 wire126,
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
                 wire115,
                 wire114,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire100 = (&wire97);
  assign wire101 = wire97;
  assign wire102 = $signed(wire101[(1'h0):(1'h0)]);
  assign wire103 = $signed((~|$signed($signed(wire96[(3'h6):(3'h6)]))));
  assign wire104 = (((~$signed((&wire103))) ?
                           ((wire101 | (~&wire100)) ?
                               wire99 : (wire97[(4'hf):(3'h5)] ?
                                   (|wire99) : wire102)) : wire96[(3'h6):(1'h0)]) ?
                       wire98[(3'h7):(3'h5)] : ((~|(((8'hb2) != (7'h41)) ?
                           (wire102 - wire96) : {wire103,
                               wire97})) && $unsigned($unsigned(wire102[(3'h6):(2'h2)]))));
  assign wire105 = wire98[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg106 <= (7'h43);
    end
  always
    @(posedge clk) begin
      reg107 <= ($signed(wire102) ? wire104[(1'h1):(1'h1)] : wire98);
      if (((~({((8'hb8) - wire96)} ^ reg106[(4'hf):(4'he)])) + (($signed($unsigned(wire98)) ?
          $signed(reg106) : $unsigned($unsigned((8'haa)))) & ((8'hbf) >> {wire101}))))
        begin
          reg108 <= (wire98[(3'h5):(3'h5)] & ($signed($signed($signed((8'h9f)))) <<< $signed(({wire99} << wire103))));
          if ($unsigned((8'hb6)))
            begin
              reg109 <= $signed($signed((~^(~{wire101, wire97}))));
              reg110 <= reg107[(3'h5):(3'h5)];
              reg111 <= $signed({$signed($unsigned($unsigned(reg109)))});
              reg112 <= (^$signed($signed((~&wire101[(2'h3):(2'h3)]))));
            end
          else
            begin
              reg109 <= wire102;
              reg110 <= reg112[(3'h6):(3'h4)];
              reg111 <= $signed($unsigned($unsigned({(wire98 <<< wire96)})));
            end
          reg113 <= (wire102 == (~($signed((!reg109)) ?
              {$unsigned(reg110)} : reg109)));
        end
      else
        begin
          if ($unsigned({$signed(((reg110 ?
                  reg109 : reg108) == $signed(wire100))),
              (~^(^~(wire96 != wire104)))}))
            begin
              reg108 <= {(wire105 >> wire100[(2'h3):(1'h1)]),
                  $signed((~^reg112))};
              reg109 <= ($signed(($signed(((8'ha7) ^ wire102)) ?
                  ({wire105} ?
                      (~wire96) : $signed(wire99)) : $unsigned((wire101 ?
                      (8'hb8) : wire105)))) | wire97);
            end
          else
            begin
              reg108 <= $unsigned(($signed($unsigned((reg109 ?
                  wire105 : wire96))) < $unsigned(($unsigned(wire105) ?
                  wire99 : (~^reg109)))));
            end
          reg110 <= (|(reg111[(3'h6):(3'h5)] ?
              ({(8'hab)} ? wire101 : (8'hb1)) : ((wire104[(2'h3):(2'h3)] ?
                      wire104[(2'h3):(2'h2)] : wire100[(4'h8):(2'h3)]) ?
                  $signed((reg109 ? wire100 : wire105)) : ({reg113,
                      wire103} + reg110))));
          reg111 <= $signed($signed($signed({{(8'hb0), wire99}})));
        end
    end
  assign wire114 = reg109[(1'h1):(1'h1)];
  assign wire115 = $signed((8'ha5));
  assign wire116 = $signed(((reg112 ?
                       wire99[(3'h4):(1'h1)] : $unsigned(((8'hba) ?
                           wire105 : wire100))) && wire100));
  assign wire117 = $signed($signed(((~&$signed(wire96)) ?
                       {(wire105 ? wire104 : reg106),
                           (~wire102)} : (wire97[(4'he):(4'h8)] != $unsigned(reg107)))));
  assign wire118 = reg109;
  assign wire119 = $unsigned((8'hb4));
  assign wire120 = wire97;
  assign wire121 = ($signed(wire118) > (7'h42));
  assign wire122 = (wire119 ?
                       (-(^~wire116[(4'hc):(3'h7)])) : (wire104[(3'h6):(3'h4)] | reg111[(1'h1):(1'h0)]));
  assign wire123 = (^~($unsigned($unsigned(reg111)) ?
                       ($unsigned($signed((8'hba))) == ((&wire98) & $signed(reg110))) : wire116[(4'hb):(3'h6)]));
  assign wire124 = (wire99[(2'h3):(1'h1)] | $unsigned($signed(($unsigned(wire104) * (8'ha4)))));
  assign wire125 = wire114[(2'h2):(1'h0)];
  assign wire126 = wire104;
  assign wire127 = {$signed($signed((((8'ha3) * wire118) << $signed(reg110)))),
                       reg110[(3'h5):(2'h2)]};
endmodule

module module75
#(parameter param89 = (|(((~&(~^(8'ha9))) ? (^~((8'hb0) ? (8'ha5) : (8'ha3))) : (((8'hb5) ? (8'hb9) : (8'ha1)) + (~^(8'h9d)))) <= ((^((7'h41) < (8'hb6))) != (|((8'ha7) ^ (8'ha6)))))))
(y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire80;
  input wire [(4'hd):(1'h0)] wire79;
  input wire [(5'h15):(1'h0)] wire78;
  input wire [(3'h6):(1'h0)] wire77;
  input wire signed [(5'h13):(1'h0)] wire76;
  wire [(2'h2):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire87;
  wire signed [(2'h2):(1'h0)] wire86;
  wire [(4'hb):(1'h0)] wire85;
  wire signed [(5'h13):(1'h0)] wire84;
  wire signed [(4'h8):(1'h0)] wire83;
  wire signed [(4'hf):(1'h0)] wire82;
  wire signed [(3'h5):(1'h0)] wire81;
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 (1'h0)};
  assign wire81 = ($signed(wire76) ?
                      $unsigned($signed(($signed(wire76) != wire79[(4'ha):(4'ha)]))) : $signed(($unsigned(wire79) + $unsigned($unsigned(wire76)))));
  assign wire82 = $unsigned((((wire81[(1'h1):(1'h0)] | wire77[(3'h5):(2'h3)]) ?
                          ({(8'hb7),
                              wire81} ^~ wire79) : ({wire80} < (~wire77))) ?
                      (wire76[(1'h0):(1'h0)] >> (|(wire81 != wire77))) : (~&wire78[(1'h1):(1'h0)])));
  assign wire83 = $unsigned(wire78[(4'h9):(2'h2)]);
  assign wire84 = (~^wire80);
  assign wire85 = wire83[(2'h2):(1'h1)];
  assign wire86 = ((7'h41) ?
                      wire83 : (((^~$unsigned(wire85)) << $signed($unsigned((8'ha5)))) != (~&(~&$signed(wire84)))));
  assign wire87 = $unsigned({((8'ha8) << (^~$signed(wire76)))});
  assign wire88 = (((wire87[(2'h3):(2'h3)] <<< wire83[(3'h5):(1'h1)]) ?
                          (^~(wire86 ?
                              wire85 : (-wire76))) : $signed($unsigned((^~wire80)))) ?
                      wire87 : (((^(wire80 ? (8'hb3) : wire80)) ?
                              (~(wire76 << wire84)) : $signed($unsigned(wire80))) ?
                          {wire79,
                              (wire84[(4'hc):(2'h2)] ?
                                  wire76 : $signed(wire80))} : $unsigned(((wire82 ?
                              wire84 : wire80) >> wire76[(3'h5):(2'h2)]))));
endmodule
