module top
#(parameter param151 = {(8'hb7)})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire [(2'h3):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire150;
  wire [(3'h7):(1'h0)] wire149;
  wire [(4'h8):(1'h0)] wire148;
  wire [(3'h7):(1'h0)] wire146;
  wire [(3'h7):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire148,
                 wire146,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire6,
                 wire5,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = wire2[(1'h1):(1'h1)];
  assign wire6 = (~|wire5);
  always
    @(posedge clk) begin
      if (wire3[(1'h1):(1'h0)])
        begin
          reg7 <= wire6[(3'h5):(2'h2)];
          reg8 <= wire5[(1'h0):(1'h0)];
          reg9 <= wire4[(2'h3):(2'h2)];
          reg10 <= ($unsigned(({(~|wire3),
                  wire2[(4'h8):(1'h0)]} >>> ((~|reg8) && reg7))) ?
              wire3[(2'h2):(1'h0)] : (|(($signed((8'hab)) * (-reg7)) ?
                  (8'ha5) : {(wire6 ? reg8 : wire0)})));
        end
      else
        begin
          reg7 <= {$unsigned(wire6)};
          reg8 <= wire2[(2'h2):(2'h2)];
        end
    end
  assign wire11 = (^~$signed($signed((+{reg10, wire2}))));
  assign wire12 = wire11;
  assign wire13 = $signed($unsigned((&(~&(wire2 ^ (8'hb7))))));
  assign wire14 = (wire13 ?
                      ($signed($unsigned(wire6[(3'h5):(1'h1)])) ?
                          wire11 : ({(8'h9c)} <= $unsigned((reg10 ?
                              wire6 : reg7)))) : reg9);
  assign wire15 = {(($unsigned($signed(wire4)) ?
                          wire2[(2'h3):(1'h1)] : wire13) != (((8'h9d) == (wire13 ?
                              wire1 : wire12)) ?
                          wire6 : $signed((~^wire4))))};
  module16 #() modinst147 (.wire18(wire13), .wire19(wire6), .wire20(reg7), .wire17(reg9), .clk(clk), .y(wire146));
  assign wire148 = $unsigned(wire4[(5'h10):(4'hd)]);
  assign wire149 = $unsigned(wire3);
  assign wire150 = {($signed(((reg9 ?
                               (8'hb0) : wire13) >>> wire15[(3'h5):(3'h5)])) ?
                           $signed($signed(wire11)) : $signed($unsigned($signed((8'hb3)))))};
endmodule

module module16  (y, clk, wire17, wire18, wire19, wire20);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire17;
  input wire signed [(5'h14):(1'h0)] wire18;
  input wire signed [(5'h14):(1'h0)] wire19;
  input wire [(5'h14):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire145;
  wire [(4'hc):(1'h0)] wire144;
  wire [(4'h9):(1'h0)] wire143;
  wire signed [(4'hd):(1'h0)] wire86;
  wire [(3'h7):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire54;
  wire signed [(2'h2):(1'h0)] wire113;
  wire [(4'h8):(1'h0)] wire141;
  assign y = {wire145,
                 wire144,
                 wire143,
                 wire86,
                 wire56,
                 wire21,
                 wire54,
                 wire113,
                 wire141,
                 (1'h0)};
  assign wire21 = wire19[(4'h9):(3'h6)];
  module22 #() modinst55 (wire54, clk, wire20, wire17, wire19, wire21, wire18);
  assign wire56 = (($signed(wire54[(3'h5):(3'h4)]) <<< (8'hb1)) ?
                      wire17 : wire18);
  module57 #() modinst87 (.wire61(wire19), .wire59(wire21), .wire58(wire56), .wire60(wire54), .clk(clk), .wire62(wire20), .y(wire86));
  module88 #() modinst114 (.y(wire113), .wire90(wire54), .wire91(wire19), .clk(clk), .wire89(wire18), .wire92(wire86));
  module115 #() modinst142 (wire141, clk, wire20, wire21, wire86, wire19, wire18);
  assign wire143 = $signed($signed($signed($signed($unsigned(wire113)))));
  assign wire144 = $unsigned(wire19[(4'hc):(4'h8)]);
  assign wire145 = ((~|wire143[(1'h1):(1'h0)]) <= (+(wire20 < wire17[(3'h6):(1'h1)])));
endmodule

module module115
#(parameter param139 = (^~((((8'h9f) ? ((8'h9f) <<< (8'ha7)) : ((8'h9f) ? (8'had) : (8'ha3))) ? ((~(8'ha5)) <= (~|(8'ha8))) : (((7'h43) | (7'h43)) ? {(8'hbf), (8'hb6)} : ((8'hb0) ? (8'ha1) : (8'hbc)))) == ((8'ha7) != (~|(|(8'hbf)))))), 
parameter param140 = ({((8'h9f) ~^ (param139 - {param139, param139}))} ? param139 : (8'hb9)))
(y, clk, wire120, wire119, wire118, wire117, wire116);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire120;
  input wire [(3'h7):(1'h0)] wire119;
  input wire signed [(4'hd):(1'h0)] wire118;
  input wire [(5'h11):(1'h0)] wire117;
  input wire signed [(3'h4):(1'h0)] wire116;
  wire [(4'hb):(1'h0)] wire136;
  wire signed [(5'h12):(1'h0)] wire135;
  wire [(5'h14):(1'h0)] wire134;
  wire signed [(3'h5):(1'h0)] wire133;
  wire [(4'h8):(1'h0)] wire132;
  wire signed [(5'h15):(1'h0)] wire131;
  wire [(5'h15):(1'h0)] wire130;
  wire signed [(2'h3):(1'h0)] wire129;
  wire signed [(4'ha):(1'h0)] wire128;
  wire signed [(5'h12):(1'h0)] wire127;
  wire signed [(3'h5):(1'h0)] wire126;
  wire [(4'hb):(1'h0)] wire125;
  wire signed [(4'hb):(1'h0)] wire124;
  wire [(2'h3):(1'h0)] wire123;
  wire [(5'h15):(1'h0)] wire122;
  wire signed [(5'h14):(1'h0)] wire121;
  reg signed [(4'he):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg137 = (1'h0);
  assign y = {wire136,
                 wire135,
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
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 reg138,
                 reg137,
                 (1'h0)};
  assign wire121 = wire118;
  assign wire122 = wire119;
  assign wire123 = $signed(wire119);
  assign wire124 = (~$signed($signed(($signed(wire116) || $signed(wire122)))));
  assign wire125 = ((wire124 ^ (wire118 <= wire120)) ?
                       (~|(!wire121)) : (8'hbb));
  assign wire126 = (~^((8'hba) ?
                       $unsigned((~|$unsigned(wire122))) : $unsigned({$signed(wire124),
                           wire119})));
  assign wire127 = (~&(wire126[(2'h2):(2'h2)] - ($unsigned({wire122}) && $signed($signed(wire121)))));
  assign wire128 = {wire123[(1'h0):(1'h0)], wire120[(4'h8):(2'h2)]};
  assign wire129 = (wire126 ?
                       (((|{(8'ha6),
                           wire128}) == (wire119[(3'h7):(3'h6)] >> $unsigned(wire120))) == $signed(wire123[(1'h1):(1'h1)])) : $signed($signed($signed(((8'ha2) != (8'h9d))))));
  assign wire130 = $signed($unsigned((+{$signed(wire126)})));
  assign wire131 = $signed($unsigned(wire116[(2'h3):(1'h1)]));
  assign wire132 = $signed(wire121);
  assign wire133 = {wire121};
  assign wire134 = $signed(wire118[(2'h3):(2'h3)]);
  assign wire135 = $unsigned((!{($unsigned(wire131) <= (^~wire134)),
                       $unsigned(wire125[(3'h5):(2'h3)])}));
  assign wire136 = (wire118 && {wire118});
  always
    @(posedge clk) begin
      reg137 <= wire118[(4'h9):(3'h7)];
      reg138 <= (({$unsigned(wire136)} ?
          reg137[(4'hd):(1'h1)] : $unsigned((&((8'haf) || wire122)))) != wire124[(2'h3):(2'h3)]);
    end
endmodule

module module88
#(parameter param111 = ((((^~((8'hba) ^ (7'h43))) ? ({(8'hbc), (8'hb4)} ? (^(8'hab)) : ((8'hbd) ? (8'hbb) : (8'hbe))) : (((7'h41) == (8'ha0)) ? ((8'hbb) <<< (8'haf)) : ((8'hbb) ? (8'hb4) : (8'h9d)))) ~^ {(((8'ha6) >= (7'h43)) ? (!(8'hae)) : {(7'h40), (8'hb5)})}) ? ({(((8'hb7) ^~ (8'hae)) != ((8'ha9) ^ (8'hb2))), (((8'h9d) ~^ (8'hbd)) << ((8'hbb) ? (8'hb2) : (8'hbf)))} << (~&((+(8'ha1)) ? (~(8'hbf)) : ((8'ha3) ? (8'h9d) : (8'ha0))))) : (((((8'haa) ? (8'hbd) : (8'hb1)) ^ ((8'hbb) ^ (8'ha0))) ? ((+(8'hb6)) ^ ((8'h9f) ? (8'ha0) : (8'hae))) : (~{(8'hb7)})) ? ({((8'ha3) ? (8'ha2) : (8'ha7))} <= {{(8'hb8)}}) : (((-(8'ha9)) ? {(8'ha0), (8'ha3)} : ((8'hac) & (8'hae))) ? ((&(8'hb5)) >= ((8'hac) ? (8'had) : (8'hb3))) : (((8'hb6) >> (7'h44)) | (~|(8'hbf)))))), 
parameter param112 = {(param111 == (^param111))})
(y, clk, wire92, wire91, wire90, wire89);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire92;
  input wire signed [(4'ha):(1'h0)] wire91;
  input wire signed [(5'h15):(1'h0)] wire90;
  input wire [(4'h8):(1'h0)] wire89;
  wire signed [(4'hf):(1'h0)] wire110;
  wire [(5'h13):(1'h0)] wire109;
  wire [(3'h6):(1'h0)] wire108;
  wire [(3'h6):(1'h0)] wire107;
  wire signed [(3'h7):(1'h0)] wire106;
  wire [(3'h6):(1'h0)] wire105;
  wire [(4'hf):(1'h0)] wire104;
  wire signed [(4'hb):(1'h0)] wire103;
  wire signed [(3'h5):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire101;
  wire [(4'hf):(1'h0)] wire99;
  wire [(4'ha):(1'h0)] wire98;
  wire [(4'ha):(1'h0)] wire97;
  wire signed [(4'hc):(1'h0)] wire93;
  reg signed [(3'h4):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire99,
                 wire98,
                 wire97,
                 wire93,
                 reg100,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire93 = ($unsigned(((!((8'h9f) ? wire89 : wire91)) ?
                          {$unsigned(wire90),
                              (8'hbb)} : $unsigned($unsigned(wire91)))) ?
                      wire89[(3'h5):(1'h0)] : ((wire91 ?
                              {{wire92}, wire90} : (|wire90[(4'h9):(3'h5)])) ?
                          {($signed((8'hb0)) & wire90)} : ({(^~wire89)} ?
                              {(|wire92)} : wire92)));
  always
    @(posedge clk) begin
      reg94 <= (8'hb8);
    end
  always
    @(posedge clk) begin
      reg95 <= reg94[(3'h5):(1'h1)];
      reg96 <= ((wire93 - ((~&$unsigned(wire92)) >= $signed((reg95 ^ wire93)))) > $signed((^(~wire90))));
    end
  assign wire97 = {(reg94 ?
                          $signed(wire91[(1'h1):(1'h0)]) : (reg95[(4'h9):(2'h3)] ?
                              $signed((8'hb2)) : ($unsigned(reg96) == wire93)))};
  assign wire98 = ($signed($signed(($signed(reg96) ?
                          {reg96, wire90} : (8'hbb)))) ?
                      $signed(wire90) : reg94[(3'h4):(2'h2)]);
  assign wire99 = $unsigned({{(reg94 ?
                              (wire90 ? wire98 : wire91) : ((7'h42) ?
                                  wire97 : wire92)),
                          ((wire93 | wire92) ?
                              ((8'h9f) ?
                                  (7'h40) : (8'hb7)) : wire91[(3'h7):(3'h4)])},
                      {((wire89 - wire90) ? (-wire93) : {wire98, wire89}),
                          $signed($signed(wire97))}});
  always
    @(posedge clk) begin
      reg100 <= $signed((~|$signed(reg96)));
    end
  assign wire101 = $unsigned(wire89[(4'h8):(3'h7)]);
  assign wire102 = (!(((+$unsigned((8'h9e))) + wire97) ~^ $unsigned(((wire98 - wire92) & reg96))));
  assign wire103 = $signed((reg95[(3'h4):(3'h4)] ?
                       (($signed(wire99) < ((8'had) << wire92)) ?
                           ($unsigned(wire102) <<< (wire102 ?
                               reg94 : reg100)) : (wire101[(3'h5):(1'h0)] ?
                               (wire98 >= reg96) : $signed(reg95))) : $unsigned($signed($signed(wire99)))));
  assign wire104 = wire93[(3'h5):(2'h3)];
  assign wire105 = {wire91};
  assign wire106 = (({$signed((wire98 >>> wire101)), (8'hbb)} ?
                           {reg95[(3'h6):(1'h1)]} : ((~(~wire92)) ?
                               {wire93[(4'h8):(1'h0)]} : (wire89[(1'h1):(1'h1)] - (wire103 ?
                                   (8'ha6) : (8'hae))))) ?
                       (-wire91[(4'h9):(3'h6)]) : wire98[(4'h9):(3'h7)]);
  assign wire107 = wire97;
  assign wire108 = $unsigned(wire91[(3'h7):(3'h4)]);
  assign wire109 = wire98[(3'h6):(3'h5)];
  assign wire110 = (^(&wire97[(4'h9):(3'h6)]));
endmodule

module module57  (y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'h129):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire62;
  input wire signed [(3'h4):(1'h0)] wire61;
  input wire signed [(5'h13):(1'h0)] wire60;
  input wire signed [(5'h15):(1'h0)] wire59;
  input wire [(3'h7):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire83;
  wire [(2'h3):(1'h0)] wire82;
  wire signed [(5'h12):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire75;
  wire signed [(2'h3):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire73;
  wire signed [(4'h8):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire71;
  wire signed [(3'h7):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire67;
  wire signed [(5'h13):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire65;
  wire signed [(4'he):(1'h0)] wire64;
  wire signed [(4'h8):(1'h0)] wire63;
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  reg signed [(4'he):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire63 = $unsigned(wire61[(1'h1):(1'h1)]);
  assign wire64 = $signed($signed($signed((&$unsigned(wire60)))));
  assign wire65 = wire58[(3'h6):(1'h1)];
  assign wire66 = wire60[(5'h10):(1'h0)];
  assign wire67 = (wire58[(3'h4):(2'h3)] ?
                      ((-$unsigned(wire64)) <= {$unsigned($unsigned(wire58)),
                          wire61}) : $signed(($unsigned(wire61) >>> $unsigned(wire66))));
  assign wire68 = $unsigned({wire63});
  assign wire69 = (~&$unsigned((wire59[(4'ha):(2'h2)] ^ ({wire58, wire68} ?
                      (&wire58) : (8'haa)))));
  assign wire70 = (&({$signed(wire65)} ^ {{(wire62 ? (8'hbe) : (8'hb7)),
                          $unsigned(wire59)},
                      {wire61[(2'h3):(1'h0)], $signed((8'ha2))}}));
  assign wire71 = (wire62 >= $signed({($unsigned(wire61) ?
                          (+wire59) : {wire70}),
                      (((8'h9c) << wire58) <<< $signed(wire61))}));
  assign wire72 = (^~(wire64 ?
                      ($unsigned($signed(wire59)) ?
                          ((wire71 ? wire70 : wire70) ?
                              (8'h9f) : wire70) : (wire58[(1'h1):(1'h1)] ^ wire61[(1'h0):(1'h0)])) : $signed(wire64[(4'h8):(3'h5)])));
  assign wire73 = ({$unsigned(($signed((8'ha0)) < wire61))} << (wire60[(3'h7):(3'h4)] + $unsigned($signed(wire72))));
  assign wire74 = $signed(wire73[(5'h10):(3'h4)]);
  assign wire75 = (^wire63[(2'h2):(1'h0)]);
  assign wire76 = $unsigned($signed(wire62));
  always
    @(posedge clk) begin
      reg77 <= wire75;
      reg78 <= $unsigned({$signed((~&$unsigned(wire58))),
          wire69[(1'h1):(1'h0)]});
      reg79 <= ($signed(wire76[(1'h1):(1'h0)]) ?
          (|wire65) : (wire60[(1'h1):(1'h1)] ?
              ({$unsigned(wire67), $unsigned(wire76)} ?
                  reg77 : wire76[(2'h2):(2'h2)]) : ({wire70,
                  {(8'hb6), wire69}} > wire69)));
    end
  always
    @(posedge clk) begin
      reg80 <= wire67;
      reg81 <= wire69[(3'h4):(1'h1)];
    end
  assign wire82 = (reg80[(3'h6):(1'h1)] ~^ {{(8'hbd),
                          (~|(wire67 <<< wire67))}});
  assign wire83 = (~^((($signed(wire75) ?
                              $unsigned(wire73) : (wire72 * wire82)) ?
                          $unsigned((wire75 ?
                              wire60 : wire76)) : wire61[(1'h0):(1'h0)]) ?
                      (wire75[(4'h8):(3'h4)] | wire75[(3'h4):(3'h4)]) : $unsigned((wire71 > (^~reg79)))));
  assign wire84 = $unsigned((wire59 > wire73[(2'h3):(2'h3)]));
  assign wire85 = $signed({wire60, (wire63 == reg77[(3'h6):(1'h1)])});
endmodule

module module22
#(parameter param52 = ((({(~|(8'hbd)), ((8'hbb) ? (8'hb9) : (8'h9c))} ? (((7'h44) >> (7'h42)) || ((8'hb7) ? (8'hbd) : (8'ha4))) : ({(8'ha2)} ? ((8'ha9) ? (8'hb9) : (8'hb0)) : (!(8'hba)))) ? ((+((8'ha7) ? (8'hbb) : (8'hb1))) <<< (|((8'ha2) ? (8'hb2) : (8'ha3)))) : ((~&((8'ha3) ? (8'hb3) : (8'ha5))) <<< (((8'h9e) ? (8'hbb) : (8'haa)) << {(8'hbc)}))) ~^ ((&(~&((8'h9f) ? (8'ha4) : (7'h40)))) & {(|{(7'h41), (8'haf)})})), 
parameter param53 = (({((param52 ? param52 : param52) ? (-param52) : (!param52)), (-(param52 != param52))} | (8'hb0)) ^~ (({(param52 ? (8'hb3) : param52), (-param52)} ? param52 : (~(param52 ? param52 : param52))) ? (param52 ? (+param52) : param52) : (8'hb6))))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire27;
  input wire signed [(4'hc):(1'h0)] wire26;
  input wire signed [(4'hd):(1'h0)] wire25;
  input wire signed [(4'he):(1'h0)] wire24;
  input wire signed [(5'h14):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire34;
  wire [(3'h4):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire28;
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 reg48,
                 reg47,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire28 = ((((-(8'hab)) <= (wire24 == wire27)) ?
                          {$signed({wire24, wire27}),
                              (~((8'ha2) ? wire23 : wire27))} : wire27) ?
                      wire26[(3'h5):(2'h3)] : ({$unsigned((wire27 ?
                              wire26 : wire27))} && (wire23 ?
                          wire24[(3'h6):(2'h2)] : wire27)));
  assign wire29 = ((((~^((8'hb4) ? wire25 : wire25)) & {{wire26, wire28},
                              (~&wire23)}) ?
                          wire24[(4'h9):(2'h3)] : $signed((-(^(7'h44))))) ?
                      {wire26[(3'h4):(1'h0)]} : (~|wire26));
  assign wire30 = $unsigned(wire28);
  assign wire31 = ($signed({(8'hb3)}) ?
                      (wire27[(2'h3):(1'h1)] ?
                          wire27[(4'hb):(4'hb)] : $signed({$signed(wire25)})) : (wire29[(4'h8):(3'h4)] ?
                          (wire23 ?
                              wire29 : {(-wire27)}) : ((8'h9f) >>> (~&{wire27}))));
  assign wire32 = wire27;
  assign wire33 = ($signed((wire23 ? wire27 : wire23)) ?
                      ($signed((8'ha6)) ?
                          wire24 : $unsigned({$unsigned(wire26)})) : wire27);
  assign wire34 = wire31[(1'h0):(1'h0)];
  assign wire35 = {wire33[(2'h3):(2'h2)]};
  always
    @(posedge clk) begin
      reg36 <= wire28;
      reg37 <= wire33[(1'h0):(1'h0)];
      reg38 <= wire33[(2'h2):(1'h1)];
      reg39 <= wire23;
      reg40 <= (-wire35[(1'h0):(1'h0)]);
    end
  assign wire41 = $unsigned({$unsigned((wire24[(4'ha):(2'h2)] ?
                          {reg38, wire26} : $unsigned(wire26))),
                      ({wire30} ?
                          (reg39[(4'hc):(4'hc)] ?
                              (reg40 > wire23) : (+reg40)) : {$unsigned(reg40),
                              (reg38 - wire27)})});
  assign wire42 = wire34;
  assign wire43 = {(({(~reg39)} ?
                              $unsigned((wire42 ?
                                  wire23 : wire30)) : (-$signed(wire33))) ?
                          $signed($signed((reg39 ~^ wire30))) : (!wire23[(4'h9):(2'h3)])),
                      $signed((!{$signed((8'hb9)), $unsigned(reg39)}))};
  assign wire44 = wire29[(2'h2):(1'h0)];
  assign wire45 = ({(reg39[(5'h10):(4'h8)] ?
                          {$unsigned(wire44), {wire26, reg40}} : (wire41 ?
                              $unsigned(wire28) : $unsigned(reg36)))} && $unsigned(((~|wire25[(1'h0):(1'h0)]) >> wire24[(1'h1):(1'h1)])));
  assign wire46 = $signed(wire32[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg47 <= (($unsigned($signed(reg40[(4'hf):(1'h0)])) >>> $unsigned(($signed(reg38) ?
          (wire28 ? wire23 : wire28) : (wire26 ?
              wire27 : wire43)))) ^ $signed($signed(wire23)));
      reg48 <= ($unsigned((!wire23)) <<< (wire43 != $unsigned(wire42[(4'hb):(1'h1)])));
    end
  assign wire49 = $signed($signed(($unsigned(reg37[(4'he):(3'h5)]) && wire34[(2'h3):(2'h2)])));
  assign wire50 = $signed((^$signed((wire34 ?
                      wire27[(3'h5):(3'h4)] : reg40[(4'h8):(3'h6)]))));
  assign wire51 = (reg38[(4'hc):(4'hb)] ?
                      $signed($signed((~^reg40))) : $unsigned((($signed((8'hb7)) | $unsigned(wire33)) >>> ((~^wire42) > (~|wire49)))));
endmodule
