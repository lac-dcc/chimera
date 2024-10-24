module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire169;
  wire [(5'h10):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  assign y = {wire169, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ($unsigned({((wire2 ? (8'hbc) : wire1) ?
                             $signed((8'hb1)) : $unsigned(wire2))}) ?
                     {{$signed(wire3),
                             $unsigned({wire1})}} : wire2[(2'h3):(2'h3)]);
  assign wire5 = (wire1[(1'h1):(1'h1)] >= ($signed((wire1 <= (8'hb5))) ?
                     wire0 : (wire3[(1'h1):(1'h0)] ?
                         $unsigned($signed(wire1)) : (wire1 ?
                             wire4 : $signed(wire4)))));
  assign wire6 = {$signed((~^(wire0[(2'h3):(2'h2)] ? wire5 : (~&(8'ha1))))),
                     ((^~(~^(8'hb5))) ?
                         wire2[(2'h3):(1'h0)] : $unsigned(wire5[(1'h1):(1'h0)]))};
  assign wire7 = wire5;
  assign wire8 = ((~&$unsigned((8'hb0))) | $signed($signed((wire1[(1'h1):(1'h1)] ?
                     $signed(wire6) : wire5[(1'h0):(1'h0)]))));
  module9 #() modinst170 (.wire10(wire6), .wire12(wire7), .y(wire169), .wire13(wire2), .wire11(wire0), .clk(clk));
endmodule

module module9  (y, clk, wire10, wire11, wire12, wire13);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire11;
  input wire [(4'hd):(1'h0)] wire12;
  input wire [(4'hf):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire168;
  wire signed [(5'h15):(1'h0)] wire166;
  wire signed [(4'hc):(1'h0)] wire114;
  wire signed [(3'h6):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire62;
  wire [(2'h2):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire65;
  wire [(5'h13):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire67;
  wire signed [(2'h3):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire112;
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  assign y = {wire168,
                 wire166,
                 wire114,
                 wire14,
                 wire62,
                 wire64,
                 wire65,
                 wire66,
                 wire67,
                 wire68,
                 wire69,
                 wire86,
                 wire112,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 (1'h0)};
  assign wire14 = (~$signed($signed($unsigned($signed(wire10)))));
  module15 #() modinst63 (.wire17(wire14), .wire19(wire13), .clk(clk), .wire18(wire10), .wire16(wire11), .y(wire62));
  assign wire64 = (+(wire11 <= $unsigned($signed((wire14 ?
                      (8'hbf) : wire11)))));
  assign wire65 = wire10;
  assign wire66 = (8'h9d);
  assign wire67 = (~&$signed(wire65[(4'h9):(4'h9)]));
  assign wire68 = $signed((($unsigned((wire10 - wire13)) >= $signed((8'ha4))) ?
                      wire12[(3'h4):(3'h4)] : $signed(((wire64 ^~ wire10) ?
                          $signed(wire66) : (wire13 ? wire67 : wire64)))));
  assign wire69 = wire62[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg70 <= $signed(wire67);
      reg71 <= (~^{wire14, $signed(wire62)});
      reg72 <= ($signed((8'hb5)) ?
          wire12 : (|((8'ha7) ?
              wire66[(4'hf):(1'h0)] : wire64[(2'h2):(1'h1)])));
      reg73 <= (((8'hb0) ?
              (7'h42) : {(|(wire10 ? wire14 : reg71)), (~^(wire14 + reg72))}) ?
          $signed(wire69[(1'h0):(1'h0)]) : {(~^wire62[(1'h1):(1'h0)])});
      reg74 <= ($unsigned((~wire62)) >> reg70);
    end
  module75 #() modinst87 (.wire77(wire66), .wire79(wire62), .wire78(wire12), .y(wire86), .clk(clk), .wire76(wire67));
  module88 #() modinst113 (wire112, clk, wire14, wire62, reg73, reg74, wire11);
  assign wire114 = $unsigned($unsigned($signed((8'hb8))));
  module115 #() modinst167 (wire166, clk, wire66, reg72, wire114, wire69, wire62);
  assign wire168 = (wire14 && $unsigned((-{(~(8'hb4)),
                       ((8'ha8) ? (8'hbf) : wire67)})));
endmodule

module module115
#(parameter param165 = (~&{{{((7'h40) << (8'hb9)), ((8'hbc) ? (8'had) : (8'ha4))}, (8'ha9)}}))
(y, clk, wire120, wire119, wire118, wire117, wire116);
  output wire [(32'h216):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire120;
  input wire [(5'h13):(1'h0)] wire119;
  input wire signed [(4'hc):(1'h0)] wire118;
  input wire [(4'h9):(1'h0)] wire117;
  input wire signed [(4'h8):(1'h0)] wire116;
  wire [(4'h9):(1'h0)] wire160;
  wire signed [(4'ha):(1'h0)] wire149;
  wire signed [(4'hc):(1'h0)] wire148;
  wire signed [(3'h5):(1'h0)] wire147;
  wire [(4'hd):(1'h0)] wire146;
  wire signed [(4'h8):(1'h0)] wire145;
  wire signed [(4'hb):(1'h0)] wire132;
  wire [(5'h10):(1'h0)] wire131;
  wire [(5'h13):(1'h0)] wire130;
  wire signed [(4'ha):(1'h0)] wire129;
  wire [(5'h11):(1'h0)] wire128;
  wire [(4'h9):(1'h0)] wire127;
  wire signed [(5'h14):(1'h0)] wire126;
  wire signed [(3'h5):(1'h0)] wire124;
  wire [(3'h4):(1'h0)] wire122;
  wire [(4'hd):(1'h0)] wire121;
  reg [(5'h12):(1'h0)] reg164 = (1'h0);
  reg [(4'hf):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg159 = (1'h0);
  reg [(4'hd):(1'h0)] reg158 = (1'h0);
  reg [(3'h5):(1'h0)] reg157 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg156 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg155 = (1'h0);
  reg [(4'he):(1'h0)] reg154 = (1'h0);
  reg [(4'ha):(1'h0)] reg153 = (1'h0);
  reg [(5'h13):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg151 = (1'h0);
  reg [(5'h11):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg144 = (1'h0);
  reg [(5'h12):(1'h0)] reg143 = (1'h0);
  reg [(4'ha):(1'h0)] reg142 = (1'h0);
  reg [(5'h10):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg139 = (1'h0);
  reg [(5'h15):(1'h0)] reg138 = (1'h0);
  reg [(5'h15):(1'h0)] reg137 = (1'h0);
  reg [(5'h15):(1'h0)] reg136 = (1'h0);
  reg [(5'h12):(1'h0)] reg135 = (1'h0);
  reg [(3'h6):(1'h0)] reg134 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg [(3'h5):(1'h0)] reg125 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  assign y = {wire160,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire124,
                 wire122,
                 wire121,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
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
                 reg125,
                 reg123,
                 (1'h0)};
  assign wire121 = (wire119 ?
                       ((-$signed((wire116 + wire117))) == wire119) : $signed(wire119[(4'hb):(4'h8)]));
  assign wire122 = ($unsigned(((8'hb6) ?
                       $unsigned((-wire121)) : ($signed(wire118) ^ (+wire117)))) >>> (wire119[(4'ha):(3'h7)] & (((wire116 >= wire121) ?
                           $signed((8'ha9)) : (wire118 & wire119)) ?
                       wire120[(1'h0):(1'h0)] : $signed(((8'hb9) * wire116)))));
  always
    @(posedge clk) begin
      reg123 <= $signed({$unsigned(($unsigned(wire119) ?
              $unsigned(wire118) : (-wire119)))});
    end
  assign wire124 = reg123;
  always
    @(posedge clk) begin
      reg125 <= $signed((~^$unsigned(((wire118 ^ wire118) - ((7'h43) ?
          wire120 : wire120)))));
    end
  assign wire126 = (8'ha3);
  assign wire127 = (reg123[(3'h4):(1'h0)] ?
                       (|$signed(($unsigned(reg123) ?
                           reg125[(3'h5):(3'h5)] : (wire126 ?
                               (8'ha0) : wire116)))) : $signed((-(&{wire122,
                           (8'hb5)}))));
  assign wire128 = wire127;
  assign wire129 = ({(!$unsigned((^wire128)))} ?
                       {$unsigned(($unsigned(wire120) ^ (wire116 ?
                               wire126 : (8'ha4))))} : $unsigned((|wire118[(3'h7):(2'h3)])));
  assign wire130 = (-wire124[(1'h0):(1'h0)]);
  assign wire131 = wire128[(3'h4):(3'h4)];
  assign wire132 = wire130;
  always
    @(posedge clk) begin
      reg133 <= ($signed(((7'h43) > wire118)) & (wire121 ?
          wire121[(1'h0):(1'h0)] : (8'h9f)));
      reg134 <= {$unsigned($signed(wire126))};
      reg135 <= wire126;
      if (wire129[(2'h3):(2'h2)])
        begin
          reg136 <= wire127;
          reg137 <= (+({(+$signed((8'hb2))),
              (((7'h42) ? reg125 : wire118) ?
                  (+reg134) : wire131[(4'h8):(2'h2)])} >> $unsigned({((8'hb6) * reg123),
              wire121[(4'h8):(3'h5)]})));
          reg138 <= {wire118[(3'h6):(3'h5)],
              (reg135[(4'hf):(3'h4)] != ({reg137[(5'h12):(4'h8)]} <<< (wire126 & $unsigned(wire120))))};
          reg139 <= reg134[(1'h1):(1'h1)];
          reg140 <= wire124;
        end
      else
        begin
          if (($unsigned($signed((|(~&wire127)))) ?
              {(wire119[(4'h9):(1'h1)] ?
                      ((~&reg135) - (wire120 && (8'hbc))) : ($signed(wire129) ?
                          (reg140 ~^ wire119) : (reg136 * wire127))),
                  (({wire126} ?
                      wire128 : (&reg140)) >> {(!reg123)})} : (8'hb0)))
            begin
              reg136 <= $signed(wire116);
            end
          else
            begin
              reg136 <= $unsigned($signed($unsigned(wire119[(3'h6):(2'h2)])));
              reg137 <= {(reg138[(1'h0):(1'h0)] + (~^wire126)),
                  (&(~|$unsigned(((8'haf) || reg135))))};
              reg138 <= (reg135[(4'hf):(4'hf)] ?
                  ($unsigned({$signed(wire132), $unsigned(wire118)}) ?
                      (-(|((8'ha1) ?
                          wire128 : wire124))) : wire121[(4'hb):(4'hb)]) : $signed((wire129 == (wire120 & wire116[(3'h7):(1'h1)]))));
              reg139 <= ($unsigned((reg134[(2'h3):(1'h1)] ^~ $signed(wire118[(4'hc):(4'h9)]))) ?
                  reg135[(4'hb):(2'h2)] : $signed(((reg138[(3'h7):(2'h3)] ?
                      reg123[(3'h4):(1'h0)] : $unsigned(reg140)) * (^~((7'h43) >> wire132)))));
              reg140 <= $signed((|(8'ha4)));
            end
          reg141 <= $unsigned(($signed((8'hbc)) ^ wire121));
          reg142 <= reg140[(2'h2):(2'h2)];
          reg143 <= reg138;
          reg144 <= {(((7'h42) ?
                      (&{reg136, wire121}) : (reg137 ?
                          $signed((8'hbc)) : (wire122 ? reg143 : wire118))) ?
                  $signed({{reg133, reg139}, wire118}) : wire131)};
        end
    end
  assign wire145 = reg135[(4'h9):(3'h7)];
  assign wire146 = (|{$signed((|$signed(reg133)))});
  assign wire147 = $unsigned(($unsigned(wire131) ?
                       (7'h40) : reg135[(4'he):(1'h1)]));
  assign wire148 = {$unsigned($unsigned($signed(((7'h43) != wire116)))),
                       (8'hb0)};
  assign wire149 = {$signed(wire132),
                       ({wire117,
                           {(wire129 ? reg135 : wire130),
                               {wire119, wire145}}} * wire127[(1'h0):(1'h0)])};
  always
    @(posedge clk) begin
      if (wire126)
        begin
          reg150 <= $signed($signed(((((7'h44) << wire124) ^~ $signed((8'hba))) && $unsigned(wire126))));
          reg151 <= (8'hb4);
          reg152 <= ($unsigned($unsigned((&{wire117}))) ?
              wire126[(2'h2):(1'h1)] : reg134[(1'h0):(1'h0)]);
          reg153 <= $unsigned(wire116[(2'h2):(1'h1)]);
        end
      else
        begin
          reg150 <= (^$unsigned(((wire130 ?
              wire127[(2'h2):(1'h0)] : $unsigned(wire129)) << ((reg152 ?
              reg125 : reg139) ~^ wire129[(4'h8):(2'h2)]))));
        end
      if (reg133[(4'h8):(4'h8)])
        begin
          if (wire127)
            begin
              reg154 <= ($unsigned((8'hb8)) ? (8'hbb) : {wire132});
              reg155 <= ((+wire121[(3'h4):(3'h4)]) ?
                  {((8'h9d) || reg125)} : $signed((-$unsigned(reg153))));
              reg156 <= $unsigned(wire117);
              reg157 <= (~^reg140[(1'h0):(1'h0)]);
            end
          else
            begin
              reg154 <= ((&(+$signed(wire124))) ?
                  (wire148[(2'h2):(1'h0)] - wire129) : (((&(wire149 ?
                          reg123 : (8'ha1))) < reg157[(3'h4):(1'h0)]) ?
                      {wire145} : (~wire131)));
              reg155 <= wire129;
              reg156 <= ((($unsigned((wire122 ?
                  reg143 : (8'h9c))) || {$unsigned(reg150)}) & reg141) << (($unsigned(wire127[(3'h6):(2'h2)]) ?
                  $unsigned(reg138[(5'h10):(4'h8)]) : (wire119 ?
                      (!reg156) : $unsigned(reg139))) || wire146));
              reg157 <= (~^wire119);
            end
          reg158 <= $unsigned(reg138[(1'h1):(1'h1)]);
        end
      else
        begin
          reg154 <= $signed({wire131});
          reg155 <= (~|{(~{reg143[(2'h2):(2'h2)]})});
          reg156 <= (reg150[(1'h0):(1'h0)] != reg151);
        end
      reg159 <= wire122[(1'h0):(1'h0)];
    end
  assign wire160 = (8'hb7);
  always
    @(posedge clk) begin
      reg161 <= ($signed($signed({(reg136 <<< reg143),
          $unsigned(reg138)})) + ($signed(reg144[(2'h3):(2'h3)]) ?
          ($unsigned((reg157 - wire117)) ?
              $unsigned($signed(wire122)) : ((wire148 - wire120) << {reg154,
                  wire130})) : (wire116[(3'h6):(3'h6)] - $signed(((8'ha8) ^ wire117)))));
      reg162 <= ((+$unsigned((|((8'hac) ? (8'ha7) : wire145)))) << reg144);
      reg163 <= $unsigned(wire149[(4'ha):(3'h4)]);
      reg164 <= (^$signed((($unsigned(wire127) || reg141) ?
          $unsigned(reg158[(4'hb):(1'h1)]) : (reg138[(5'h12):(1'h0)] * (7'h44)))));
    end
endmodule

module module88
#(parameter param110 = (!((~{(~&(8'hae)), (~(8'ha2))}) ^ ((^((8'hb0) ^ (8'haa))) ~^ {((8'h9e) ? (8'ha0) : (8'hac))}))), 
parameter param111 = (8'ha9))
(y, clk, wire93, wire92, wire91, wire90, wire89);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire93;
  input wire [(3'h6):(1'h0)] wire92;
  input wire [(4'hf):(1'h0)] wire91;
  input wire [(3'h4):(1'h0)] wire90;
  input wire signed [(2'h3):(1'h0)] wire89;
  wire [(2'h2):(1'h0)] wire109;
  wire [(3'h4):(1'h0)] wire108;
  wire [(4'hf):(1'h0)] wire107;
  wire [(2'h2):(1'h0)] wire106;
  wire signed [(3'h7):(1'h0)] wire105;
  wire [(5'h13):(1'h0)] wire102;
  wire signed [(2'h3):(1'h0)] wire101;
  wire signed [(4'h8):(1'h0)] wire100;
  wire signed [(3'h7):(1'h0)] wire99;
  wire [(5'h12):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire97;
  wire [(5'h15):(1'h0)] wire96;
  wire signed [(4'hb):(1'h0)] wire95;
  wire [(4'hb):(1'h0)] wire94;
  reg signed [(3'h6):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg103 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire94 = $unsigned({($unsigned(wire90[(1'h1):(1'h0)]) ?
                          (wire93 ?
                              (^~wire90) : $signed(wire90)) : $signed((~wire90))),
                      ($unsigned(wire90) ?
                          {wire90, $unsigned(wire93)} : ({wire89,
                              (8'hac)} | (wire92 + wire91)))});
  assign wire95 = (wire94 >>> wire92[(3'h4):(3'h4)]);
  assign wire96 = wire92;
  assign wire97 = (!(wire93 != $unsigned(wire94)));
  assign wire98 = $signed((wire94[(2'h3):(2'h3)] & wire89));
  assign wire99 = wire92;
  assign wire100 = (!(wire94 ?
                       ($unsigned({wire90}) - (&wire96[(5'h15):(4'hd)])) : wire89));
  assign wire101 = ($signed({(+$signed((7'h40)))}) >>> $signed({(!$signed((8'ha3)))}));
  assign wire102 = (~|wire101[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg103 <= ((~^(~wire89)) ?
          (wire102[(3'h5):(1'h1)] ?
              $signed(({wire101, wire92} ?
                  (wire98 ?
                      wire92 : wire101) : $unsigned(wire98))) : wire89) : ($signed((~|$unsigned(wire99))) + (~&((~|wire99) << (!wire98)))));
      reg104 <= reg103[(4'h8):(2'h2)];
    end
  assign wire105 = wire99[(3'h5):(3'h5)];
  assign wire106 = ({$unsigned((wire102[(4'he):(3'h7)] ?
                               wire98 : $unsigned(wire91)))} ?
                       {(^~$signed(((8'ha8) ?
                               wire93 : wire102)))} : $unsigned((reg103[(3'h7):(1'h0)] ?
                           wire100[(3'h5):(2'h2)] : $unsigned($unsigned(wire91)))));
  assign wire107 = wire93[(2'h3):(1'h1)];
  assign wire108 = {((~&$signed($signed(wire101))) ^ (($signed((8'h9c)) ?
                               (wire102 * (8'hb0)) : (-wire89)) ?
                           ((8'h9e) ?
                               (wire90 ? wire95 : wire102) : (wire105 ?
                                   reg104 : wire99)) : ((wire106 ~^ wire97) ?
                               $signed(reg104) : (~^(8'hab))))),
                       ($unsigned(wire107[(4'h9):(3'h6)]) ?
                           $unsigned(wire102[(1'h0):(1'h0)]) : ((|wire106[(1'h0):(1'h0)]) ^~ $signed((+wire98))))};
  assign wire109 = wire101;
endmodule

module module75
#(parameter param84 = ((((((8'hab) ? (8'hb9) : (8'ha7)) ? (&(7'h42)) : ((8'hb4) ? (8'hac) : (8'hb1))) ? (((8'hb2) != (7'h40)) & ((8'hbf) >= (8'hb3))) : (((8'ha1) >> (8'ha2)) ? (!(7'h41)) : ((8'hb2) ? (8'hb2) : (7'h43)))) ^ {(((8'hb4) | (8'hba)) >> (&(8'hb2)))}) ~^ (-(~((8'hb4) - ((8'hae) ? (8'ha3) : (7'h40)))))), 
parameter param85 = param84)
(y, clk, wire79, wire78, wire77, wire76);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire79;
  input wire signed [(3'h7):(1'h0)] wire78;
  input wire signed [(3'h5):(1'h0)] wire77;
  input wire signed [(3'h6):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire80;
  reg [(3'h4):(1'h0)] reg83 = (1'h0);
  assign y = {wire82, wire81, wire80, reg83, (1'h0)};
  assign wire80 = wire76;
  assign wire81 = $unsigned((~wire76[(3'h5):(3'h4)]));
  assign wire82 = ((~|$unsigned({wire76[(1'h0):(1'h0)],
                      $unsigned(wire76)})) >> (((wire78 & (&wire77)) | (!(~|wire81))) ?
                      (-$unsigned((wire77 ? wire76 : wire77))) : wire76));
  always
    @(posedge clk) begin
      reg83 <= wire80;
    end
endmodule

module module15
#(parameter param61 = (8'ha4))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h1ed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire19;
  input wire [(3'h6):(1'h0)] wire18;
  input wire signed [(3'h6):(1'h0)] wire17;
  input wire signed [(4'he):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire60;
  wire signed [(4'ha):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire57;
  wire signed [(5'h15):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire55;
  wire [(3'h6):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire46;
  wire signed [(4'hd):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire20;
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire26,
                 wire25,
                 wire20,
                 reg51,
                 reg43,
                 reg42,
                 reg41,
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
                 reg27,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire20 = (wire18[(2'h2):(2'h2)] ?
                      {(wire19[(4'h8):(3'h5)] != (wire17 <= $signed(wire18)))} : $unsigned(wire16[(2'h3):(2'h2)]));
  always
    @(posedge clk) begin
      reg21 <= $unsigned((wire19[(4'h9):(1'h0)] || wire17));
      reg22 <= wire19[(1'h0):(1'h0)];
      reg23 <= $unsigned(($unsigned($unsigned($signed(reg22))) ?
          $unsigned((~(wire19 ? reg21 : (8'hbc)))) : (+reg21)));
      reg24 <= (|reg21);
    end
  assign wire25 = ((reg21 <= (reg21[(3'h6):(2'h2)] ?
                          {wire18, {(8'ha1)}} : reg23)) ?
                      reg21 : $signed((^~(~(wire18 << wire19)))));
  assign wire26 = $unsigned($unsigned($signed($unsigned((^~wire19)))));
  always
    @(posedge clk) begin
      reg27 <= $unsigned((!$unsigned($signed(((7'h42) <= wire17)))));
      reg28 <= wire18[(3'h4):(2'h3)];
      reg29 <= $unsigned({((~reg22[(1'h0):(1'h0)]) * ((wire17 ?
                  reg28 : wire26) ?
              reg24[(2'h2):(2'h2)] : reg22[(3'h7):(1'h0)]))});
      if ($unsigned($unsigned((($unsigned(wire26) > (8'ha5)) ?
          (reg21 ? {reg22, reg22} : wire25[(4'h9):(2'h3)]) : ((+wire16) ?
              (reg29 + reg29) : wire19)))))
        begin
          if (wire25[(2'h3):(2'h3)])
            begin
              reg30 <= $signed((!((~&$signed(wire26)) <<< (8'ha2))));
              reg31 <= wire18[(2'h2):(1'h0)];
              reg32 <= {{($unsigned($signed((8'hb9))) + (!(wire25 <<< reg24)))},
                  wire25[(3'h7):(3'h5)]};
              reg33 <= reg32[(4'hf):(3'h7)];
            end
          else
            begin
              reg30 <= reg27[(3'h5):(3'h4)];
              reg31 <= wire19[(2'h3):(1'h0)];
              reg32 <= reg33[(4'hb):(3'h6)];
              reg33 <= (^reg21);
            end
          if ({reg30[(4'h8):(3'h4)]})
            begin
              reg34 <= ($signed((wire18 && (wire25[(1'h1):(1'h1)] * (reg27 <= reg27)))) <= ((~((reg30 ?
                      reg21 : wire26) ?
                  reg22[(1'h0):(1'h0)] : ((8'hb7) ^ reg22))) * (^~(+reg33))));
              reg35 <= wire20;
            end
          else
            begin
              reg34 <= $signed((~{reg23, reg35[(1'h0):(1'h0)]}));
              reg35 <= $unsigned((8'hb2));
              reg36 <= ((~|$unsigned(reg32[(1'h1):(1'h0)])) ?
                  {reg28, wire26[(4'hd):(3'h5)]} : reg27);
              reg37 <= {(~{(|$signed(reg24)), (8'haf)})};
            end
          reg38 <= wire20[(2'h2):(1'h1)];
          reg39 <= ({wire17} ^~ $signed((reg30[(5'h11):(4'h8)] ?
              $signed(wire16[(1'h1):(1'h1)]) : {(~|reg32),
                  (wire26 > wire26)})));
        end
      else
        begin
          reg30 <= $signed((wire19[(3'h4):(2'h3)] ?
              $unsigned(($signed(reg28) ?
                  $unsigned(reg27) : (reg39 && reg38))) : wire17[(1'h0):(1'h0)]));
          reg31 <= reg29;
        end
    end
  always
    @(posedge clk) begin
      reg40 <= (($unsigned({(|wire19)}) || $unsigned(reg33)) == (reg37[(2'h3):(2'h3)] ?
          {reg29, (|reg36)} : $unsigned((~&wire17[(2'h3):(2'h2)]))));
      reg41 <= reg36;
      reg42 <= (|((reg31[(1'h1):(1'h0)] ?
              (^~(wire20 & reg39)) : ((+reg28) ? (reg24 | reg28) : wire18)) ?
          $unsigned(reg23[(1'h1):(1'h1)]) : $unsigned($signed({wire17,
              reg21}))));
      reg43 <= $signed({wire16[(2'h2):(2'h2)]});
    end
  assign wire44 = (-$signed($signed((&$unsigned(wire20)))));
  assign wire45 = {(^~$signed((-(^~wire44)))), reg35[(4'ha):(4'h8)]};
  assign wire46 = ($unsigned((-(reg21[(4'h9):(1'h1)] < ((8'hb6) ?
                          wire17 : wire19)))) ?
                      $unsigned((~&(^~(wire17 > reg43)))) : reg37[(2'h3):(2'h3)]);
  assign wire47 = $unsigned($unsigned($unsigned(($unsigned(reg36) >> reg33))));
  assign wire48 = $unsigned(((8'hb7) && reg27));
  assign wire49 = reg35[(4'hc):(1'h0)];
  assign wire50 = reg40;
  always
    @(posedge clk) begin
      reg51 <= reg29[(1'h0):(1'h0)];
    end
  assign wire52 = reg39;
  assign wire53 = (~(8'h9f));
  assign wire54 = ((^~($signed(wire53[(2'h2):(1'h1)]) ?
                      (reg40 >>> (wire48 ?
                          (8'hb9) : reg40)) : reg27)) >= {(-$unsigned($unsigned(reg29))),
                      (8'hab)});
  assign wire55 = (^~reg28[(4'hf):(4'h8)]);
  assign wire56 = (reg22 ?
                      $unsigned(wire44) : ($unsigned($unsigned((&wire49))) != wire16));
  assign wire57 = $unsigned((8'hb8));
  assign wire58 = $signed((^($signed($unsigned(reg39)) >> reg41[(1'h0):(1'h0)])));
  assign wire59 = $unsigned($signed($signed($signed((~wire56)))));
  assign wire60 = wire17;
endmodule
