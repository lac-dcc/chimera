module top
#(parameter param167 = ((({((7'h44) && (8'h9f))} | {((7'h42) ? (8'hb0) : (8'h9c))}) - (~|(((8'hb8) >= (8'hac)) ? (8'haa) : ((8'hae) ? (7'h41) : (8'hab))))) ^~ (~&((((8'haa) ? (8'ha8) : (8'ha3)) ? ((8'ha2) <<< (8'ha1)) : ((8'hbb) ~^ (8'hbf))) ? (~&(^~(8'ha9))) : (((8'hbb) ? (8'hbe) : (8'hb7)) ? ((8'ha1) ^~ (8'hb6)) : ((7'h43) <<< (8'hac)))))), 
parameter param168 = {(-(((param167 | param167) ? param167 : (^~(8'ha4))) ? {(~param167)} : (!(param167 & param167)))), ((param167 >>> ((param167 || param167) <<< (param167 ? param167 : param167))) ? {({param167, param167} ? (&param167) : (param167 ? param167 : (8'h9d))), (param167 <<< param167)} : (+(8'h9d)))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire166;
  wire signed [(2'h2):(1'h0)] wire165;
  wire [(4'h8):(1'h0)] wire164;
  wire [(3'h7):(1'h0)] wire163;
  wire signed [(2'h3):(1'h0)] wire161;
  wire signed [(5'h11):(1'h0)] wire5;
  assign y = {wire166, wire165, wire164, wire163, wire161, wire5, (1'h0)};
  assign wire5 = ($unsigned($signed(wire1)) ?
                     wire3 : {$unsigned($signed((~wire2))), wire2});
  module6 #() modinst162 (.wire8(wire5), .y(wire161), .wire7(wire3), .clk(clk), .wire10(wire0), .wire9(wire4));
  assign wire163 = {wire2};
  assign wire164 = wire2;
  assign wire165 = ((wire1 ? $signed(wire164) : $signed((8'hb4))) | {wire2,
                       {(~^(wire161 == wire161))}});
  assign wire166 = (wire4[(1'h0):(1'h0)] >> (($unsigned(wire164[(3'h6):(3'h6)]) ?
                           {$unsigned(wire0)} : (wire3[(2'h2):(1'h0)] ?
                               $unsigned(wire1) : wire5)) ?
                       $unsigned($signed(wire161)) : (wire4[(3'h6):(3'h5)] ?
                           $signed($signed(wire3)) : wire165)));
endmodule

module module6
#(parameter param159 = (8'ha3), 
parameter param160 = (^~(({(param159 ? param159 : param159), (^(8'haf))} - (8'hbc)) ? (&(~(param159 ? param159 : param159))) : param159)))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire146;
  wire signed [(5'h15):(1'h0)] wire144;
  wire signed [(4'hb):(1'h0)] wire116;
  wire signed [(5'h12):(1'h0)] wire78;
  wire [(4'ha):(1'h0)] wire114;
  reg signed [(3'h7):(1'h0)] reg158 = (1'h0);
  reg [(3'h4):(1'h0)] reg157 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg153 = (1'h0);
  reg [(2'h2):(1'h0)] reg152 = (1'h0);
  reg [(3'h5):(1'h0)] reg151 = (1'h0);
  reg [(4'h8):(1'h0)] reg150 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg148 = (1'h0);
  reg [(5'h12):(1'h0)] reg147 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  assign y = {wire146,
                 wire144,
                 wire116,
                 wire78,
                 wire114,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg81,
                 reg80,
                 (1'h0)};
  module11 #() modinst79 (wire78, clk, wire10, wire9, wire7, wire8);
  always
    @(posedge clk) begin
      reg80 <= $unsigned($unsigned((($signed((7'h44)) ?
          (wire8 >= (8'haa)) : (+wire7)) ~^ (wire9[(1'h0):(1'h0)] != (wire9 || (8'hbf))))));
      reg81 <= wire10[(5'h11):(4'ha)];
    end
  module82 #() modinst115 (.wire84(reg80), .wire85(wire9), .wire83(wire78), .clk(clk), .wire86(wire10), .y(wire114));
  assign wire116 = wire7[(3'h7):(3'h5)];
  module117 #() modinst145 (wire144, clk, wire78, wire114, reg81, wire7, wire116);
  assign wire146 = $signed(wire116[(4'ha):(3'h5)]);
  always
    @(posedge clk) begin
      reg147 <= wire144[(4'hc):(4'hb)];
      reg148 <= wire10;
      if (reg81)
        begin
          reg149 <= reg147;
        end
      else
        begin
          reg149 <= $unsigned((wire10[(4'hf):(3'h4)] >>> wire146[(2'h3):(1'h0)]));
          reg150 <= wire78[(5'h12):(3'h5)];
          reg151 <= (wire114[(1'h0):(1'h0)] << wire78);
          if ($signed($unsigned(($unsigned($unsigned(wire114)) ?
              ((reg149 ?
                  reg81 : wire78) ^ wire9[(4'h8):(1'h1)]) : (wire78 ~^ wire144[(2'h3):(1'h1)])))))
            begin
              reg152 <= reg151;
              reg153 <= (|(+(&$unsigned(wire144))));
              reg154 <= {(^$unsigned($signed(reg152[(2'h2):(2'h2)]))),
                  reg81[(4'h8):(3'h7)]};
            end
          else
            begin
              reg152 <= reg151;
            end
          if (reg152[(2'h2):(1'h0)])
            begin
              reg155 <= (reg151[(2'h2):(2'h2)] >= wire8[(4'h8):(1'h0)]);
              reg156 <= $unsigned((+(~^($signed((8'h9c)) ?
                  {wire9, wire114} : reg152[(1'h0):(1'h0)]))));
              reg157 <= (reg147[(5'h12):(1'h1)] ?
                  $signed(($signed((reg81 - reg151)) ?
                      ({wire7, wire10} ?
                          {reg153, reg149} : ((8'had) ?
                              reg148 : reg153)) : wire10)) : $signed($unsigned(wire7)));
              reg158 <= ((8'hac) << wire78[(2'h2):(1'h1)]);
            end
          else
            begin
              reg155 <= ($signed(wire78[(4'hd):(3'h7)]) ?
                  (&(^wire146)) : (~|wire114));
              reg156 <= $signed((!$unsigned($unsigned((-wire8)))));
              reg157 <= ((|$signed(({wire10} || reg155[(5'h10):(3'h4)]))) ?
                  (|$unsigned($unsigned($unsigned(wire7)))) : reg150[(1'h1):(1'h1)]);
              reg158 <= (7'h40);
            end
        end
    end
endmodule

module module117
#(parameter param143 = ({{(((8'ha2) - (8'ha2)) ? ((8'ha6) ? (8'hb0) : (8'ha5)) : ((8'ha3) ? (7'h40) : (8'hbb)))}, ((-(8'hac)) + (((8'h9c) & (8'hb0)) ? ((8'haf) >> (8'hb1)) : ((8'hbd) && (7'h40))))} ? ((^{(~&(8'hb1))}) ? ((~^((8'hbd) + (8'hb5))) == (((8'ha7) << (8'hb1)) ? ((8'ha0) ? (8'hb6) : (8'haf)) : ((8'hb2) ? (7'h43) : (8'hbf)))) : ((((8'hba) >>> (8'hac)) <<< ((8'hb9) >= (8'ha4))) ? ((^(8'hab)) ? {(8'h9c)} : (+(7'h41))) : (((8'ha9) | (8'hb3)) * ((8'hbe) ? (8'hb8) : (8'h9c))))) : ((((+(8'ha5)) ? ((8'h9f) ? (8'ha6) : (8'ha8)) : ((7'h42) - (8'hac))) ? {{(8'hbe)}} : ((+(8'hb8)) < (!(8'ha5)))) ? ((((8'hac) ? (7'h40) : (8'ha5)) > ((8'ha6) ? (8'hb7) : (8'hb9))) <= (((8'had) ? (8'hbc) : (8'ha4)) ? ((7'h42) && (8'ha0)) : {(8'hb2), (8'ha6)})) : (~&(((8'haa) >>> (8'hb0)) == (|(8'h9d)))))))
(y, clk, wire122, wire121, wire120, wire119, wire118);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire122;
  input wire [(4'h8):(1'h0)] wire121;
  input wire signed [(5'h13):(1'h0)] wire120;
  input wire signed [(5'h11):(1'h0)] wire119;
  input wire [(4'hb):(1'h0)] wire118;
  wire [(4'hc):(1'h0)] wire142;
  wire [(4'hb):(1'h0)] wire141;
  wire signed [(5'h15):(1'h0)] wire140;
  wire [(4'ha):(1'h0)] wire139;
  wire signed [(4'h8):(1'h0)] wire138;
  wire signed [(4'hf):(1'h0)] wire137;
  wire signed [(4'he):(1'h0)] wire136;
  wire signed [(5'h15):(1'h0)] wire135;
  wire signed [(5'h10):(1'h0)] wire134;
  wire [(5'h15):(1'h0)] wire133;
  wire [(3'h6):(1'h0)] wire132;
  wire signed [(4'hc):(1'h0)] wire131;
  wire [(2'h2):(1'h0)] wire130;
  wire signed [(5'h14):(1'h0)] wire129;
  wire [(4'h9):(1'h0)] wire128;
  wire signed [(4'ha):(1'h0)] wire127;
  wire signed [(4'hd):(1'h0)] wire126;
  wire [(4'hf):(1'h0)] wire125;
  reg signed [(5'h15):(1'h0)] reg124 = (1'h0);
  reg signed [(4'he):(1'h0)] reg123 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
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
                 reg124,
                 reg123,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg123 <= $unsigned($unsigned((!($unsigned(wire121) >>> (wire121 ?
          wire120 : wire122)))));
      reg124 <= ({(~^({wire120, reg123} == (wire118 ?
              wire118 : reg123)))} == wire120);
    end
  assign wire125 = ({$signed(($unsigned(wire119) ?
                               $unsigned(wire118) : $signed(wire119))),
                           wire120} ?
                       ($signed($unsigned(((8'hbf) | reg124))) ?
                           $signed($unsigned((wire120 == (8'ha4)))) : $signed(((~&(8'h9c)) != reg124))) : wire122);
  assign wire126 = $unsigned(wire120[(2'h3):(1'h1)]);
  assign wire127 = (|(((8'hb0) ~^ {$unsigned(wire118), $unsigned((7'h42))}) ?
                       (|(^(!reg123))) : $signed({(wire121 ? wire119 : reg123),
                           reg124[(5'h13):(4'h8)]})));
  assign wire128 = wire127;
  assign wire129 = (+{{$unsigned($unsigned(wire126)), wire121},
                       (wire126 ?
                           $unsigned($unsigned(wire120)) : $unsigned(wire118[(4'h8):(2'h3)]))});
  assign wire130 = wire118[(3'h4):(2'h2)];
  assign wire131 = wire119[(2'h2):(2'h2)];
  assign wire132 = {$unsigned((wire130[(2'h2):(2'h2)] ?
                           (wire128[(1'h0):(1'h0)] << $signed(wire131)) : wire125)),
                       (~(+(8'h9e)))};
  assign wire133 = wire127;
  assign wire134 = $unsigned((|wire120[(4'h8):(2'h2)]));
  assign wire135 = reg124;
  assign wire136 = $signed($unsigned(wire135[(4'he):(4'ha)]));
  assign wire137 = wire134;
  assign wire138 = (wire121[(2'h3):(2'h2)] ?
                       $unsigned(((~&{wire125}) ?
                           wire132 : wire136)) : $signed($unsigned($signed(wire131))));
  assign wire139 = $unsigned($unsigned($signed(($unsigned((8'hb2)) >>> wire122))));
  assign wire140 = $unsigned((!((wire118 ? {(8'hac)} : $signed(reg123)) ?
                       (-((8'hb8) ^~ wire119)) : {{wire121},
                           (wire139 || wire118)})));
  assign wire141 = ((8'hbf) ?
                       $signed($unsigned(wire127[(1'h1):(1'h0)])) : ((8'ha4) ?
                           wire131[(3'h6):(1'h0)] : wire140[(5'h14):(3'h7)]));
  assign wire142 = wire137[(4'he):(3'h6)];
endmodule

module module82
#(parameter param113 = {((&((^(8'hac)) ? ((8'ha9) > (8'ha6)) : ((8'had) ? (8'ha8) : (8'hb7)))) ^~ (((8'ha3) <= (8'hae)) && {(!(7'h43)), ((8'hb0) == (8'hb1))}))})
(y, clk, wire86, wire85, wire84, wire83);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire86;
  input wire [(5'h11):(1'h0)] wire85;
  input wire signed [(5'h12):(1'h0)] wire84;
  input wire signed [(5'h12):(1'h0)] wire83;
  wire signed [(2'h2):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire106;
  wire signed [(3'h5):(1'h0)] wire105;
  wire signed [(3'h6):(1'h0)] wire104;
  wire signed [(4'h8):(1'h0)] wire103;
  wire [(4'h9):(1'h0)] wire102;
  wire signed [(2'h2):(1'h0)] wire101;
  wire [(5'h13):(1'h0)] wire98;
  wire signed [(4'hc):(1'h0)] wire97;
  wire signed [(3'h4):(1'h0)] wire96;
  wire [(2'h3):(1'h0)] wire95;
  wire [(2'h2):(1'h0)] wire94;
  wire [(4'h9):(1'h0)] wire93;
  wire signed [(4'h9):(1'h0)] wire92;
  wire signed [(3'h6):(1'h0)] wire91;
  wire signed [(4'h8):(1'h0)] wire90;
  wire signed [(3'h5):(1'h0)] wire88;
  wire [(4'h8):(1'h0)] wire87;
  reg signed [(3'h7):(1'h0)] reg112 = (1'h0);
  reg [(5'h10):(1'h0)] reg111 = (1'h0);
  reg [(2'h3):(1'h0)] reg110 = (1'h0);
  reg signed [(4'he):(1'h0)] reg109 = (1'h0);
  reg [(4'hd):(1'h0)] reg108 = (1'h0);
  reg [(4'hb):(1'h0)] reg100 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg89 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire88,
                 wire87,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg100,
                 reg99,
                 reg89,
                 (1'h0)};
  assign wire87 = wire85[(3'h4):(2'h3)];
  assign wire88 = wire86[(4'hb):(4'ha)];
  always
    @(posedge clk) begin
      reg89 <= wire87[(2'h3):(2'h2)];
    end
  assign wire90 = ((-wire83[(4'he):(4'hc)]) <= wire85);
  assign wire91 = (wire90[(2'h2):(1'h1)] <<< (~$signed($signed((wire88 ?
                      wire84 : wire87)))));
  assign wire92 = wire84;
  assign wire93 = $signed($signed({wire84[(4'hd):(1'h1)]}));
  assign wire94 = $unsigned($unsigned((($unsigned(wire84) >>> wire90) != ((8'hb7) < wire84[(3'h4):(1'h1)]))));
  assign wire95 = (((-$signed({(8'hb0)})) ?
                          wire92[(4'h9):(4'h9)] : $unsigned($unsigned((wire92 ?
                              wire94 : wire88)))) ?
                      {$signed((|(8'haf))), wire86[(4'hd):(2'h2)]} : (8'hb3));
  assign wire96 = wire91;
  assign wire97 = wire94;
  assign wire98 = (~^(^$signed(((|wire92) ?
                      wire95[(2'h2):(1'h1)] : $unsigned(wire96)))));
  always
    @(posedge clk) begin
      reg99 <= $unsigned(wire85[(1'h1):(1'h0)]);
      reg100 <= {{wire87[(3'h7):(2'h2)], {$unsigned($signed(wire88))}},
          wire86[(1'h0):(1'h0)]};
    end
  assign wire101 = (wire98 >> (wire87 ? wire94 : $unsigned($signed(reg100))));
  assign wire102 = {$unsigned((wire90 ?
                           {(~&wire95)} : $signed($signed(wire97))))};
  assign wire103 = {reg99,
                       (wire85 == $unsigned($unsigned($unsigned((8'hb7)))))};
  assign wire104 = wire91[(1'h0):(1'h0)];
  assign wire105 = wire92[(2'h3):(2'h2)];
  assign wire106 = wire105[(2'h2):(2'h2)];
  assign wire107 = ((wire92 > wire101[(1'h1):(1'h0)]) ?
                       $signed($signed(wire106)) : ($signed($unsigned((wire94 >> (8'hb8)))) ?
                           reg99[(4'hc):(3'h7)] : $unsigned(({wire103,
                               wire106} == wire96[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg108 <= wire102[(1'h0):(1'h0)];
      reg109 <= {$signed((((reg108 > wire88) <= (wire107 & reg100)) ^ reg100[(1'h0):(1'h0)]))};
      reg110 <= ((wire85 ?
          {$unsigned((reg108 ? (8'hb2) : wire90)),
              (~|$signed(wire107))} : reg99) || (~wire93));
      reg111 <= $signed(wire97[(4'hb):(1'h0)]);
      reg112 <= (($signed(wire96[(1'h0):(1'h0)]) ~^ $unsigned($signed($unsigned(wire105)))) ?
          $unsigned($signed(((wire103 ?
              wire95 : wire105) > reg99[(3'h5):(3'h5)]))) : ((($unsigned(wire94) & wire92[(4'h9):(3'h7)]) ?
                  (wire98[(4'ha):(2'h2)] ^~ wire88) : (wire105 ?
                      reg99 : $signed(wire88))) ?
              (wire86[(4'hc):(4'hc)] | (!wire87)) : wire106));
    end
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h2de):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire15;
  input wire signed [(4'ha):(1'h0)] wire14;
  input wire signed [(3'h7):(1'h0)] wire13;
  input wire [(5'h11):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire22;
  wire [(4'ha):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire16;
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  assign y = {wire68,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire23,
                 wire22,
                 wire21,
                 wire18,
                 wire17,
                 wire16,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg41,
                 reg40,
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
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire16 = (~(|(~|((|wire15) ?
                      (wire14 ^ wire12) : (wire14 ? wire15 : wire14)))));
  assign wire17 = $signed(wire14);
  assign wire18 = $signed($signed($signed($signed((wire13 && wire17)))));
  always
    @(posedge clk) begin
      reg19 <= $unsigned($unsigned((-($unsigned(wire17) ~^ (!wire12)))));
      reg20 <= $unsigned((((^(8'hae)) ^ {wire12,
          (~wire13)}) + (((^wire12) + {(8'ha6)}) ?
          (^$signed(wire17)) : ((wire13 ?
              wire12 : wire15) >>> (wire16 && (8'hbc))))));
    end
  assign wire21 = (8'ha2);
  assign wire22 = (((~|(!$signed((8'hb9)))) && {{wire13[(3'h7):(3'h7)],
                          (reg19 * wire21)},
                      ($signed(wire15) ?
                          $signed(wire15) : (|(7'h43)))}) >= $signed(((wire15 + wire15) && wire12)));
  assign wire23 = (wire14 > $unsigned(reg20[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg24 <= $signed($signed($signed(wire18[(4'he):(3'h5)])));
      reg25 <= (($unsigned({(wire17 >>> wire14),
              $unsigned(wire22)}) * ($signed((wire13 <= wire18)) | $unsigned((&wire14)))) ?
          $signed($unsigned($signed(wire14))) : wire17[(2'h2):(2'h2)]);
      if ((-wire22))
        begin
          reg26 <= ($signed(wire22) <<< {{(~((7'h40) ? reg25 : wire12))},
              wire18});
          reg27 <= (($signed((8'hb6)) ?
                  wire18[(3'h7):(3'h7)] : ({(8'hb9),
                      (wire23 ? wire23 : wire21)} > {(wire12 && wire16)})) ?
              $signed({reg20[(2'h2):(2'h2)]}) : reg26[(2'h3):(2'h3)]);
          reg28 <= wire13[(3'h7):(1'h0)];
          reg29 <= reg28[(1'h1):(1'h0)];
          reg30 <= $unsigned(({{wire21[(3'h6):(3'h4)]}} ?
              wire16[(3'h5):(3'h5)] : (~wire12)));
        end
      else
        begin
          if ($unsigned(({(reg27[(2'h2):(1'h1)] || {wire16}), wire18} ?
              {{reg19[(4'h8):(2'h3)], $unsigned(wire14)},
                  $signed(wire13)} : $unsigned($unsigned(wire14)))))
            begin
              reg26 <= ($signed(wire18) ?
                  $signed(wire14) : ((+wire22[(2'h3):(1'h0)]) == $signed(reg27)));
              reg27 <= ($signed(($signed(reg25) ?
                  wire14[(4'h8):(2'h3)] : ({reg26} ?
                      $unsigned(wire14) : reg20))) * (reg29 ?
                  (&(wire15[(1'h0):(1'h0)] ?
                      reg28 : (|(8'hb0)))) : $unsigned($unsigned((reg25 & reg20)))));
              reg28 <= ({(~|(~^$unsigned(wire15))), (~^{reg27})} ?
                  {(wire22 ?
                          wire14 : {(reg29 >>> wire16),
                              reg24})} : ((wire23 <= (&wire17)) - wire14[(3'h4):(1'h0)]));
            end
          else
            begin
              reg26 <= wire23[(4'he):(4'hc)];
            end
          reg29 <= $signed((-(~|reg19[(2'h3):(2'h3)])));
          reg30 <= wire12[(3'h5):(2'h2)];
          if (($unsigned(((+$signed(wire14)) ?
              (|((8'hb5) ?
                  (8'ha4) : wire15)) : ((^wire12) * (^~reg29)))) > wire13[(3'h7):(3'h4)]))
            begin
              reg31 <= (8'ha3);
              reg32 <= $signed(({reg29} ?
                  (reg31 ?
                      (wire16 ?
                          $signed(reg19) : $unsigned(wire16)) : $signed((reg29 ?
                          wire13 : reg20))) : {wire14, reg30[(1'h1):(1'h0)]}));
            end
          else
            begin
              reg31 <= wire15;
              reg32 <= $signed((~^$unsigned($unsigned(wire22[(1'h1):(1'h0)]))));
              reg33 <= wire22[(1'h1):(1'h1)];
            end
        end
    end
  assign wire34 = wire18;
  assign wire35 = (8'hb3);
  assign wire36 = $unsigned($unsigned(($unsigned({wire23}) ~^ $unsigned($signed((8'hbe))))));
  assign wire37 = (^wire21);
  assign wire38 = wire12[(4'ha):(4'ha)];
  assign wire39 = (8'ha6);
  always
    @(posedge clk) begin
      reg40 <= {(+($unsigned($signed((8'hbd))) ?
              $unsigned((reg33 ? wire14 : wire23)) : wire36[(1'h0):(1'h0)]))};
      reg41 <= $unsigned(({((~|reg28) ? (7'h40) : (&wire14)),
              {$signed(wire16), (~|reg40)}} ?
          reg19 : wire34[(4'hf):(4'he)]));
    end
  assign wire42 = (wire12 ?
                      $unsigned((~|$unsigned($signed(wire21)))) : ({(^~$signed(wire23))} ?
                          wire18 : (($unsigned(reg25) ?
                              (reg28 ?
                                  wire18 : wire38) : (wire21 ~^ wire13)) || reg25)));
  assign wire43 = wire23;
  assign wire44 = ({$signed(((reg33 >> (8'hb1)) >>> (!reg27)))} << ((^~$unsigned((reg29 ^ reg33))) > (!reg31[(4'h9):(3'h4)])));
  assign wire45 = ((reg20 ?
                      (^~({wire21} >>> (wire23 >> wire21))) : (^~wire35[(3'h5):(3'h4)])) && wire14);
  assign wire46 = $signed($signed($signed(wire34)));
  always
    @(posedge clk) begin
      if (wire18[(2'h3):(1'h0)])
        begin
          reg47 <= wire13[(3'h4):(2'h2)];
          reg48 <= (reg41 ? $signed((&(8'hbd))) : reg47);
          reg49 <= reg31;
          reg50 <= $signed(($unsigned(({wire21} ?
                  (+reg40) : ((8'ha7) + wire34))) ?
              ({(reg30 ? wire12 : wire36)} ?
                  $unsigned((wire35 != wire12)) : reg40[(1'h1):(1'h0)]) : wire16[(3'h5):(1'h0)]));
        end
      else
        begin
          reg47 <= ({reg27[(1'h1):(1'h1)],
              (((reg49 ? reg32 : wire22) ? wire21 : (~reg50)) ?
                  ((wire34 ? (8'hbd) : (8'h9d)) ?
                      reg25 : wire34[(3'h5):(3'h5)]) : $unsigned($signed(wire45)))} < $unsigned(wire42[(4'hc):(4'hb)]));
          reg48 <= $unsigned($unsigned(($unsigned(wire22) ?
              (-(wire39 ? wire18 : (8'hae))) : (|$unsigned(wire43)))));
          if ({$signed({((reg19 - reg24) ?
                      (wire16 | wire16) : ((8'hbe) >= (8'hb7)))})})
            begin
              reg49 <= {$unsigned(wire35)};
              reg50 <= (~&{wire38, wire18});
              reg51 <= $signed((-$signed(reg24)));
            end
          else
            begin
              reg49 <= (+{(!$signed($unsigned(reg27))),
                  $unsigned($unsigned({wire44}))});
              reg50 <= wire36;
            end
          reg52 <= $signed(reg41[(1'h0):(1'h0)]);
          reg53 <= {{reg24}};
        end
      reg54 <= (wire15[(3'h5):(1'h1)] <= $signed((wire15[(3'h4):(2'h3)] ?
          reg25[(4'hd):(3'h4)] : ((wire12 < wire16) ?
              (reg30 && reg47) : $signed(reg26)))));
      if (reg19)
        begin
          reg55 <= reg49;
          reg56 <= ({wire44[(3'h4):(2'h2)]} * {(~&({reg27} ?
                  $signed(wire22) : (reg25 ? wire23 : wire34)))});
          reg57 <= (wire37 ? reg20[(2'h2):(1'h1)] : wire44[(1'h0):(1'h0)]);
          reg58 <= $signed(reg28[(1'h1):(1'h1)]);
        end
      else
        begin
          reg55 <= (!(~$unsigned($signed((reg54 && wire42)))));
          if (({$unsigned((~((8'haa) ? wire35 : reg33)))} >>> ($signed(reg47) ?
              {wire18[(2'h2):(2'h2)]} : ((~^$unsigned(wire44)) ?
                  $unsigned(((8'h9e) << reg57)) : {reg24,
                      reg51[(4'hc):(4'h8)]}))))
            begin
              reg56 <= (!$unsigned(((&$signed((8'ha8))) ?
                  (wire45 ^ wire23[(4'he):(1'h0)]) : reg53)));
              reg57 <= reg40;
            end
          else
            begin
              reg56 <= (wire14 ?
                  $signed($signed({(reg30 ?
                          reg56 : (8'ha5))})) : $signed($unsigned(wire34[(2'h3):(1'h1)])));
              reg57 <= wire21;
            end
          if ((wire46 > (&$signed((wire39 ~^ {reg58, reg40})))))
            begin
              reg58 <= $unsigned((((reg48[(1'h1):(1'h1)] ?
                      (wire36 && wire44) : (wire39 ? reg27 : reg41)) ?
                  (8'h9f) : (~&$unsigned(reg56))) ~^ wire34[(5'h13):(4'ha)]));
              reg59 <= (|wire35[(3'h4):(3'h4)]);
              reg60 <= wire16[(2'h3):(1'h1)];
              reg61 <= ((((8'hb6) ?
                      reg50[(3'h4):(2'h3)] : wire36[(4'h9):(3'h6)]) ?
                  reg29 : (!wire18[(3'h4):(2'h3)])) != ($unsigned(({wire18} - $signed(wire17))) ?
                  wire39[(3'h5):(1'h0)] : $signed({(-reg27)})));
            end
          else
            begin
              reg58 <= $signed($unsigned($unsigned(((reg55 >= wire18) ^~ (~&wire17)))));
            end
          if ({(($unsigned(reg31) ?
                      {{wire22}, (reg25 ? wire17 : wire17)} : (!{reg48})) ?
                  (reg55 < {(reg29 != (8'ha3)),
                      $unsigned(wire37)}) : ((reg52[(3'h4):(2'h2)] ?
                      $unsigned(reg59) : reg19[(3'h4):(2'h2)]) ^~ (^~$signed(wire12)))),
              $unsigned(wire44[(1'h0):(1'h0)])})
            begin
              reg62 <= (($unsigned($unsigned((~|reg56))) == wire39) >> ((((wire35 - reg47) ?
                  (wire12 ?
                      reg30 : wire16) : reg49) * $signed(wire34)) >= $signed($signed((reg50 ?
                  reg54 : wire22)))));
              reg63 <= {(^~$signed($unsigned({reg27, (8'hbd)}))),
                  {($signed(reg53) ?
                          $unsigned(wire43) : ((wire18 ~^ wire38) >>> (reg52 + reg49))),
                      (wire21[(1'h1):(1'h0)] ?
                          (+$unsigned(reg48)) : $signed(wire13))}};
              reg64 <= $signed($unsigned(((^(8'hb1)) ?
                  {$unsigned(reg63)} : ($unsigned((8'hbc)) < $unsigned(reg50)))));
              reg65 <= {($unsigned((+$signed((8'haf)))) ?
                      ((^reg30[(1'h0):(1'h0)]) & $unsigned($signed(reg49))) : $unsigned($unsigned((+(8'hb1)))))};
              reg66 <= $unsigned(wire37[(3'h7):(3'h5)]);
            end
          else
            begin
              reg62 <= wire35[(3'h7):(3'h5)];
              reg63 <= $signed(wire14);
            end
          reg67 <= reg54;
        end
    end
  assign wire68 = reg61;
  always
    @(posedge clk) begin
      reg69 <= reg49;
      if ((|$signed({reg63[(2'h2):(2'h2)]})))
        begin
          reg70 <= (reg29 ?
              wire12 : (((reg48 != {reg64}) ?
                  reg32[(1'h0):(1'h0)] : $unsigned($unsigned(reg28))) << {(~(reg66 ?
                      reg40 : wire17)),
                  ((wire36 ? wire36 : reg29) <= (reg25 ? reg63 : reg26))}));
          reg71 <= (reg60[(3'h5):(1'h1)] ^ {wire35[(3'h5):(3'h4)]});
          reg72 <= $signed($unsigned($unsigned((wire45 ?
              (wire14 & reg41) : $signed(reg19)))));
          reg73 <= reg29[(4'hd):(2'h2)];
          if ((-$signed(reg48)))
            begin
              reg74 <= ({(~|$signed($unsigned(reg67)))} << $signed((&((reg32 > (8'hb3)) <<< (~(8'hb5))))));
              reg75 <= (!((~&($unsigned((7'h42)) ?
                  (~|reg25) : reg29)) <= reg20));
            end
          else
            begin
              reg74 <= {reg51};
              reg75 <= $signed(($signed((reg27[(3'h4):(3'h4)] ?
                      {reg49} : (wire35 >= wire34))) ?
                  reg61[(1'h1):(1'h0)] : (!(+(wire13 >>> wire46)))));
              reg76 <= $signed(reg54[(3'h7):(1'h0)]);
              reg77 <= wire21;
            end
        end
      else
        begin
          reg70 <= $unsigned(wire43);
          reg71 <= $signed(reg20);
          reg72 <= (reg47 >= (~reg58[(4'hf):(1'h0)]));
        end
    end
endmodule
