module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire160;
  wire signed [(3'h7):(1'h0)] wire159;
  wire [(4'h9):(1'h0)] wire158;
  wire [(2'h2):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire121;
  wire signed [(3'h7):(1'h0)] wire122;
  wire signed [(4'hb):(1'h0)] wire123;
  wire [(5'h13):(1'h0)] wire124;
  wire signed [(3'h5):(1'h0)] wire125;
  wire [(2'h2):(1'h0)] wire155;
  reg signed [(3'h6):(1'h0)] reg157 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire119,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire121,
                 wire122,
                 wire123,
                 wire124,
                 wire125,
                 wire155,
                 reg157,
                 (1'h0)};
  assign wire5 = $unsigned(($signed((((7'h44) ?
                     wire0 : (8'h9c)) <<< $unsigned(wire0))) | wire4[(4'h9):(3'h4)]));
  assign wire6 = wire1[(1'h0):(1'h0)];
  assign wire7 = ($unsigned(wire6) ?
                     ($unsigned($signed(wire4)) ?
                         ({((8'hb6) || wire3)} >> $signed((wire0 > wire2))) : $signed($signed((+wire4)))) : ((wire5 ?
                         $unsigned((wire2 != wire2)) : $signed((+(8'hb2)))) & ((wire3[(3'h6):(3'h6)] - (wire2 ?
                             (8'hb2) : (7'h41))) ?
                         wire0 : $signed((wire4 ? (8'h9d) : wire2)))));
  assign wire8 = (wire3[(2'h3):(2'h2)] <<< {wire6});
  assign wire9 = wire6[(3'h7):(3'h5)];
  assign wire10 = wire6[(1'h0):(1'h0)];
  assign wire11 = wire7;
  assign wire12 = (wire1[(3'h6):(3'h4)] ? (8'ha1) : wire5);
  assign wire13 = (+($unsigned($signed((wire12 ? wire4 : wire0))) ?
                      wire9 : {wire9[(1'h0):(1'h0)], wire1}));
  module14 #() modinst120 (.wire18(wire2), .wire19(wire5), .wire15(wire13), .y(wire119), .wire17(wire6), .clk(clk), .wire16(wire9));
  assign wire121 = wire12;
  assign wire122 = (wire6[(3'h7):(3'h4)] ? (!wire6) : wire10);
  assign wire123 = {wire5,
                       $unsigned((((wire122 ? wire13 : wire8) >= (8'hb9)) ?
                           (^~{(8'ha0), wire13}) : (~^(wire11 ?
                               wire8 : wire6))))};
  assign wire124 = $unsigned((^$unsigned(wire11)));
  assign wire125 = $signed(wire1);
  module126 #() modinst156 (.wire129(wire13), .wire128(wire125), .wire131(wire6), .clk(clk), .wire130(wire123), .y(wire155), .wire127(wire9));
  always
    @(posedge clk) begin
      reg157 <= {(wire8 ?
              (wire2[(1'h1):(1'h0)] ?
                  $signed(((7'h44) ?
                      wire155 : wire11)) : (&$signed(wire7))) : {wire13[(4'h8):(3'h4)],
                  (7'h43)}),
          (($unsigned(wire155[(1'h0):(1'h0)]) ?
                  wire0 : ($signed(wire5) ?
                      (wire123 ? (8'hac) : (8'ha0)) : (8'haf))) ?
              (({(8'hb3), wire10} ? {wire125} : $unsigned(wire9)) ?
                  $signed({wire123}) : wire121) : $signed($unsigned($unsigned(wire125))))};
    end
  assign wire158 = wire124;
  assign wire159 = $signed(wire1);
  assign wire160 = (~&$signed($signed(wire6)));
endmodule

module module126
#(parameter param154 = {({(((8'hbe) ? (8'hb0) : (8'hac)) ? (^(8'hb5)) : (^~(8'ha8))), (((8'ha8) ^~ (8'h9c)) ? (^~(8'hb6)) : ((8'hbf) ? (7'h41) : (8'hb1)))} - (((+(8'ha4)) ? ((8'hb8) ? (7'h40) : (8'ha3)) : ((8'haf) == (7'h40))) > {{(8'hae), (8'hbd)}}))})
(y, clk, wire131, wire130, wire129, wire128, wire127);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire131;
  input wire [(4'h8):(1'h0)] wire130;
  input wire signed [(4'hd):(1'h0)] wire129;
  input wire signed [(2'h3):(1'h0)] wire128;
  input wire signed [(5'h13):(1'h0)] wire127;
  wire [(5'h11):(1'h0)] wire153;
  wire signed [(5'h15):(1'h0)] wire152;
  wire signed [(4'hf):(1'h0)] wire132;
  reg signed [(5'h10):(1'h0)] reg151 = (1'h0);
  reg [(5'h15):(1'h0)] reg150 = (1'h0);
  reg [(4'ha):(1'h0)] reg149 = (1'h0);
  reg [(2'h2):(1'h0)] reg148 = (1'h0);
  reg [(4'he):(1'h0)] reg147 = (1'h0);
  reg [(3'h6):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg145 = (1'h0);
  reg [(5'h10):(1'h0)] reg144 = (1'h0);
  reg [(2'h3):(1'h0)] reg143 = (1'h0);
  reg [(4'hc):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg141 = (1'h0);
  reg [(4'hf):(1'h0)] reg140 = (1'h0);
  reg signed [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(5'h11):(1'h0)] reg138 = (1'h0);
  reg [(5'h12):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg135 = (1'h0);
  reg [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(4'hb):(1'h0)] reg133 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire132,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
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
                 (1'h0)};
  assign wire132 = {wire128};
  always
    @(posedge clk) begin
      reg133 <= {wire128[(2'h2):(1'h1)],
          $unsigned($signed(($signed(wire128) ?
              $unsigned(wire129) : $unsigned(wire130))))};
      if (wire130)
        begin
          reg134 <= $unsigned(((!($unsigned(wire131) ?
              (wire131 <<< (8'ha1)) : $signed(wire131))) && ($signed(wire131) * (wire127 > $signed((8'hbf))))));
          reg135 <= $unsigned((~|({(wire129 ? wire129 : (7'h40)),
                  $unsigned(wire132)} ?
              reg133[(4'h9):(1'h0)] : {(8'ha6), reg133})));
          reg136 <= (reg133 ?
              $signed((+((!wire128) ?
                  $signed((8'hb1)) : (wire130 ?
                      wire132 : reg133)))) : (~|wire130));
        end
      else
        begin
          reg134 <= {(~(wire129[(4'h8):(1'h0)] ?
                  (~wire127[(4'h8):(2'h3)]) : wire127[(4'ha):(3'h5)]))};
          reg135 <= ($signed(($unsigned(reg133[(1'h0):(1'h0)]) ?
                  wire130 : ($unsigned(wire128) ?
                      (reg136 >>> reg136) : $signed(wire128)))) ?
              wire128 : $unsigned(wire130));
          reg136 <= $unsigned($unsigned({(8'hbf), reg134}));
          if (reg134[(4'hc):(4'hb)])
            begin
              reg137 <= ({wire127, wire131[(3'h4):(2'h2)]} != ((8'hbc) ?
                  (reg133 ? (8'ha2) : {wire132, $unsigned(reg134)}) : wire132));
              reg138 <= {reg135,
                  $signed((((reg135 ? reg136 : reg136) ?
                          (^~reg135) : $unsigned((8'ha4))) ?
                      (+{(8'hae)}) : (!reg133[(2'h2):(1'h0)])))};
              reg139 <= (+(wire127[(2'h2):(1'h0)] ?
                  $signed(((&reg138) ^~ wire127[(3'h6):(1'h1)])) : wire127));
              reg140 <= (($signed((^~(reg133 ? wire130 : reg139))) ?
                  $signed({(wire129 == wire132),
                      $unsigned((8'hbb))}) : ($signed($signed(reg137)) ?
                      ($signed((8'h9c)) ?
                          reg138[(4'hd):(3'h4)] : (reg138 ?
                              reg133 : (8'h9c))) : $unsigned((+wire127)))) ^ $unsigned(((^$unsigned(wire128)) >= reg135)));
            end
          else
            begin
              reg137 <= (~|(|($unsigned((reg137 ?
                  (8'hb4) : wire132)) < $signed($unsigned(wire132)))));
              reg138 <= reg136[(3'h7):(1'h1)];
            end
          reg141 <= (reg135[(4'he):(3'h5)] << reg140);
        end
      reg142 <= reg136[(3'h5):(2'h3)];
      reg143 <= (($signed(($signed(wire127) ?
                  wire128[(2'h2):(1'h0)] : (&(8'haf)))) ?
              wire129[(4'hc):(2'h3)] : (8'ha5)) ?
          ((~((~wire132) > {reg134})) ?
              (|(wire130 >> (|(8'hb0)))) : (-$unsigned((wire129 ?
                  reg140 : reg135)))) : (((reg142[(3'h7):(3'h4)] * $unsigned(reg142)) >>> (-wire131[(3'h6):(1'h0)])) ?
              $signed(reg134[(1'h0):(1'h0)]) : reg137[(5'h10):(1'h0)]));
      if (reg143)
        begin
          reg144 <= wire127[(2'h2):(2'h2)];
          if ((!$signed(reg138[(4'h9):(4'h8)])))
            begin
              reg145 <= (wire128[(1'h0):(1'h0)] ?
                  ($signed($unsigned((~|reg134))) & $signed(wire131[(4'he):(4'ha)])) : ($unsigned({(8'hbd),
                      $unsigned(reg135)}) | {{(-(8'hbc)),
                          reg135[(4'hf):(1'h0)]}}));
              reg146 <= reg144[(4'h9):(1'h1)];
              reg147 <= ((~reg136) > ({reg145[(2'h3):(2'h3)]} ^~ {wire128}));
              reg148 <= $signed((reg134 | wire128[(1'h1):(1'h1)]));
            end
          else
            begin
              reg145 <= (|$signed((~^(7'h40))));
              reg146 <= reg138[(3'h6):(1'h1)];
              reg147 <= reg146[(3'h4):(1'h1)];
            end
          reg149 <= (reg142 ^ $signed($unsigned($signed((-reg134)))));
          reg150 <= reg148[(1'h1):(1'h0)];
          reg151 <= reg147;
        end
      else
        begin
          reg144 <= {{$signed($unsigned((~|wire128))),
                  (!(+(reg145 ? reg134 : (8'ha3))))}};
          reg145 <= reg138[(4'hd):(2'h2)];
        end
    end
  assign wire152 = $signed((8'ha8));
  assign wire153 = $signed(reg140[(4'hc):(3'h5)]);
endmodule

module module14
#(parameter param117 = ((((^~(^(8'hb6))) ? (!{(8'ha6), (8'ha8)}) : {((8'hb9) ^~ (8'hb2))}) | {(((8'hb4) ? (8'hb9) : (7'h40)) == (^~(8'hbc)))}) ? (({(^~(7'h43))} + {((8'ha9) ? (8'ha6) : (8'hb9))}) ? ((((8'hb1) > (8'hb1)) != {(8'hbe), (8'hac)}) ? (((8'haf) ? (8'hae) : (8'hba)) && {(8'hac), (8'hb9)}) : {(!(8'hbb)), (^(8'ha8))}) : ({((8'hb4) <<< (8'hb7)), (~(7'h41))} ? (8'ha8) : (((8'h9e) && (8'ha5)) ^~ ((7'h40) ? (7'h43) : (8'haa))))) : ((8'hae) ? ((8'hb0) ? ({(8'hb5)} >= {(8'hbd), (8'haf)}) : ((-(8'h9c)) ? {(8'ha1)} : ((8'hb0) || (8'h9c)))) : (~&((~&(8'ha9)) ? (~&(7'h40)) : {(8'h9e)})))), 
parameter param118 = ((8'hb7) <= ((8'hbf) * {(^~param117)})))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire19;
  input wire [(4'h8):(1'h0)] wire18;
  input wire [(5'h13):(1'h0)] wire17;
  input wire signed [(5'h14):(1'h0)] wire16;
  input wire [(4'hb):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire116;
  wire [(3'h5):(1'h0)] wire40;
  wire signed [(4'hf):(1'h0)] wire42;
  wire [(2'h3):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire45;
  wire signed [(4'hf):(1'h0)] wire46;
  wire signed [(4'h9):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire49;
  wire [(2'h3):(1'h0)] wire54;
  wire [(4'hc):(1'h0)] wire55;
  wire [(3'h5):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire114;
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  assign y = {wire116,
                 wire40,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire48,
                 wire49,
                 wire54,
                 wire55,
                 wire56,
                 wire114,
                 reg47,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 (1'h0)};
  module20 #() modinst41 (.wire23(wire18), .wire24(wire19), .clk(clk), .y(wire40), .wire22(wire16), .wire21(wire17), .wire25(wire15));
  assign wire42 = $signed(wire40[(1'h0):(1'h0)]);
  assign wire43 = $unsigned(({$signed({wire42})} & (~|wire42[(4'h9):(3'h6)])));
  assign wire44 = {wire17[(4'hb):(3'h6)], (&{(^~((8'hbd) && wire42))})};
  assign wire45 = ($unsigned((wire15 ^ (-(wire15 << wire19)))) ?
                      wire19[(4'hb):(4'ha)] : ((^~wire17) | $unsigned(($unsigned(wire43) ?
                          {(7'h41)} : wire15))));
  assign wire46 = (wire17 ?
                      (^wire43) : $unsigned({(wire19 ?
                              (&wire40) : $unsigned(wire15)),
                          (wire40[(1'h0):(1'h0)] ?
                              $unsigned(wire18) : (^(7'h44)))}));
  always
    @(posedge clk) begin
      reg47 <= $signed($signed((wire40[(1'h0):(1'h0)] <= $unsigned((wire43 * wire17)))));
    end
  assign wire48 = ($unsigned(wire45) || ((wire18[(4'h8):(1'h1)] & (^$signed(wire44))) ?
                      wire43[(2'h3):(1'h0)] : wire19));
  assign wire49 = ((wire19 >> (^wire40[(3'h4):(2'h2)])) * wire45[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      if ($signed($signed(wire45[(2'h2):(1'h1)])))
        begin
          reg50 <= wire45;
          reg51 <= $signed(wire19[(1'h0):(1'h0)]);
          reg52 <= ($unsigned((($signed(wire40) ?
                  {reg51, (8'ha2)} : {reg50}) + wire42[(2'h3):(1'h0)])) ?
              ($unsigned(wire46[(2'h2):(1'h1)]) && $unsigned($unsigned((wire49 ?
                  wire18 : wire40)))) : (wire15 ^~ wire16));
          reg53 <= ((wire17 ?
              (((+wire44) * wire15[(3'h4):(2'h2)]) ?
                  $unsigned($signed((8'ha1))) : ((~^wire46) ?
                      {reg51} : wire19[(2'h2):(1'h1)])) : (wire49 >= ((wire42 != wire46) << $signed(wire40)))) >= (wire42[(3'h5):(2'h2)] ?
              wire43 : ((wire19 ^ reg51) - ((wire46 ?
                  wire19 : (8'hb5)) ~^ (^wire48)))));
        end
      else
        begin
          reg50 <= (~&wire48);
        end
    end
  assign wire54 = {wire15[(4'h9):(4'h8)]};
  assign wire55 = {{wire16, $unsigned($unsigned(wire18[(3'h7):(3'h7)]))}};
  assign wire56 = $signed(wire19);
  module57 #() modinst115 (.wire59(wire43), .wire60(reg51), .clk(clk), .y(wire114), .wire61(wire45), .wire58(wire48));
  assign wire116 = wire18[(2'h2):(1'h1)];
endmodule

module module57
#(parameter param112 = {((~^(&{(8'hbc)})) ? ((((8'haf) ? (8'had) : (8'hbb)) ? {(8'had), (8'hb6)} : ((8'hb5) ? (8'haa) : (7'h40))) ? (((8'h9c) ? (8'hb6) : (8'hbc)) >>> (+(8'hb2))) : {((8'ha8) ^~ (8'ha5))}) : (^(^((8'hb1) == (8'hab)))))}, 
parameter param113 = (((&param112) > {(((8'hb4) + param112) && {param112}), ((param112 ? param112 : param112) ? (param112 ? param112 : param112) : (-(8'ha4)))}) || param112))
(y, clk, wire61, wire60, wire59, wire58);
  output wire [(32'h241):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire61;
  input wire [(4'hc):(1'h0)] wire60;
  input wire signed [(2'h2):(1'h0)] wire59;
  input wire signed [(4'h9):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire111;
  wire [(5'h14):(1'h0)] wire110;
  wire signed [(5'h11):(1'h0)] wire109;
  wire [(3'h7):(1'h0)] wire108;
  wire signed [(5'h10):(1'h0)] wire107;
  wire [(3'h6):(1'h0)] wire106;
  wire [(5'h14):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire104;
  wire signed [(2'h2):(1'h0)] wire103;
  wire [(5'h12):(1'h0)] wire102;
  wire signed [(5'h14):(1'h0)] wire101;
  wire signed [(3'h7):(1'h0)] wire100;
  wire [(5'h15):(1'h0)] wire71;
  wire signed [(4'hd):(1'h0)] wire70;
  wire [(3'h4):(1'h0)] wire67;
  wire [(2'h3):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire63;
  wire signed [(3'h7):(1'h0)] wire62;
  reg signed [(4'hb):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg98 = (1'h0);
  reg [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg95 = (1'h0);
  reg [(5'h13):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg90 = (1'h0);
  reg [(2'h3):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire71,
                 wire70,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
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
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg69,
                 reg68,
                 (1'h0)};
  assign wire62 = (|$unsigned($unsigned($signed(wire60[(3'h7):(3'h4)]))));
  assign wire63 = $signed($unsigned((|wire61)));
  assign wire64 = wire61;
  assign wire65 = $unsigned((wire60[(2'h3):(1'h0)] ?
                      wire58[(2'h3):(2'h2)] : wire63));
  assign wire66 = (~&{$signed({((8'hb0) ? wire58 : wire58)})});
  assign wire67 = wire60[(4'h8):(2'h3)];
  always
    @(posedge clk) begin
      reg68 <= ({(($signed(wire64) ? (-wire66) : wire62[(1'h1):(1'h1)]) ?
              {$unsigned(wire63),
                  {wire65, (8'hbf)}} : $unsigned($signed(wire60)))} < {(wire65 ?
              wire64[(1'h0):(1'h0)] : {(~&wire66)}),
          $signed((|(wire64 ? wire60 : wire62)))});
      reg69 <= wire63;
    end
  assign wire70 = $unsigned(reg69);
  assign wire71 = $signed((({$unsigned(wire67)} != {(reg68 << reg68),
                          (|wire67)}) ?
                      wire65[(3'h4):(1'h0)] : wire63));
  always
    @(posedge clk) begin
      reg72 <= ((((8'hb0) ?
              $unsigned((wire62 << (7'h44))) : (wire59 | $unsigned(wire71))) ?
          (7'h42) : (~(|((8'ha6) ? wire64 : (8'hbe))))) + {$signed(reg68)});
      if ({$unsigned($unsigned({wire58}))})
        begin
          reg73 <= (((wire61 ? $signed(wire67[(1'h1):(1'h0)]) : (+wire67)) ?
              wire59 : wire63[(4'ha):(1'h0)]) <<< (^~(~^wire71[(4'ha):(3'h4)])));
          reg74 <= (8'hb4);
          if ((~&reg69))
            begin
              reg75 <= wire67;
              reg76 <= (^({wire65[(2'h3):(2'h2)], $signed(wire59)} ?
                  {wire63[(5'h11):(4'h8)]} : $signed(((~&wire64) ?
                      {wire58} : wire60[(1'h0):(1'h0)]))));
              reg77 <= wire64;
              reg78 <= reg75[(4'h9):(4'h9)];
            end
          else
            begin
              reg75 <= wire58;
              reg76 <= (~|(-$signed($unsigned(reg77[(2'h3):(2'h2)]))));
              reg77 <= (wire60[(4'hb):(3'h4)] ?
                  $unsigned(($signed($unsigned(wire62)) ?
                      wire58 : $signed($unsigned(reg74)))) : wire71);
              reg78 <= ($unsigned($unsigned((-reg76[(2'h3):(1'h0)]))) ?
                  wire58 : (($signed((~&(8'hb0))) <<< ({reg75, wire59} ?
                          (~|reg74) : ((8'ha6) ? wire62 : reg76))) ?
                      (^($signed(wire67) ?
                          $signed(reg68) : $unsigned(wire70))) : reg68[(1'h0):(1'h0)]));
            end
          if ((&wire64))
            begin
              reg79 <= ($signed(($signed($unsigned((7'h43))) >= {wire58[(1'h0):(1'h0)]})) < {wire66[(1'h1):(1'h1)],
                  $signed(((&wire71) ?
                      (wire60 ? reg75 : (8'haf)) : wire71[(1'h1):(1'h1)]))});
              reg80 <= $signed(wire63[(4'hc):(1'h0)]);
              reg81 <= ($unsigned((reg74 ~^ wire61[(1'h0):(1'h0)])) ^~ ((~|(wire62[(1'h1):(1'h0)] ?
                      (~wire60) : wire71)) ?
                  ((!((8'hbb) ~^ reg80)) ^ $unsigned((8'ha5))) : reg75));
            end
          else
            begin
              reg79 <= (8'h9c);
              reg80 <= (~(8'hb2));
              reg81 <= ((reg81[(3'h6):(1'h1)] << (8'ha2)) ?
                  wire61[(2'h3):(1'h1)] : {reg74,
                      $signed(((8'hb2) ^ {wire70, reg75}))});
              reg82 <= reg69;
            end
          reg83 <= (wire71 ? wire59 : reg68[(1'h1):(1'h0)]);
        end
      else
        begin
          reg73 <= $unsigned((reg75[(2'h3):(2'h2)] != ({(wire63 ?
                  wire67 : (8'hb8)),
              {wire60, reg72}} && (~&(reg69 > reg81)))));
          reg74 <= $signed(wire64);
        end
    end
  always
    @(posedge clk) begin
      if (wire71[(2'h2):(1'h1)])
        begin
          reg84 <= $unsigned($signed((~^(wire59 ?
              (|reg74) : (reg76 >= reg77)))));
          reg85 <= ((reg72 >> (!$unsigned(reg83))) - $unsigned({reg73,
              $unsigned((wire71 > (8'hb8)))}));
          reg86 <= reg78;
          reg87 <= ((!$signed($unsigned(wire65[(1'h1):(1'h0)]))) > $signed(($signed($signed(reg83)) ?
              $signed(reg78[(4'hd):(4'h9)]) : ((wire70 ? reg84 : reg86) ?
                  {reg77} : $unsigned(wire61)))));
          if ($signed((~$signed((^wire58)))))
            begin
              reg88 <= reg79;
              reg89 <= reg72;
              reg90 <= $unsigned((~(((~|wire62) >> (8'hb9)) <= reg89[(2'h2):(1'h0)])));
              reg91 <= reg83;
            end
          else
            begin
              reg88 <= (|reg78[(2'h2):(1'h0)]);
              reg89 <= {(reg90[(3'h6):(3'h4)] ?
                      $signed($unsigned($unsigned(wire62))) : wire65[(4'h8):(3'h6)]),
                  $unsigned(reg78)};
              reg90 <= ((^~(reg85[(1'h0):(1'h0)] ? wire66 : $signed(reg79))) ?
                  ({(reg89 ? {wire65, reg74} : $unsigned(reg68)),
                      ({reg91,
                          reg76} << reg85[(2'h2):(2'h2)])} <<< wire70[(4'h8):(3'h7)]) : (~&$unsigned($unsigned((reg74 >= wire65)))));
              reg91 <= ($unsigned(wire63) < ({$unsigned({wire58})} != (-({reg89} < (~|wire63)))));
            end
        end
      else
        begin
          reg84 <= $unsigned(reg68);
          reg85 <= $signed($unsigned(wire61[(4'ha):(3'h4)]));
          if ((+wire65[(3'h6):(2'h3)]))
            begin
              reg86 <= reg91[(4'hc):(1'h0)];
              reg87 <= $signed({(reg73 ?
                      ((wire58 >>> reg78) <= (&reg87)) : wire71[(2'h2):(1'h1)]),
                  $unsigned({reg85, $signed(wire71)})});
              reg88 <= reg74[(2'h3):(1'h0)];
              reg89 <= (&$signed({(reg81[(5'h12):(4'h8)] ?
                      (reg69 && reg79) : (wire66 - wire71))}));
              reg90 <= reg77;
            end
          else
            begin
              reg86 <= wire67;
              reg87 <= reg77;
              reg88 <= wire59[(1'h1):(1'h1)];
            end
        end
      reg92 <= reg80;
      if ((((&(~&{reg88})) ?
          $unsigned($signed(((8'h9d) ?
              wire58 : wire67))) : wire71[(1'h1):(1'h1)]) == (~^wire67)))
        begin
          reg93 <= reg68[(1'h0):(1'h0)];
          if (((^$unsigned((wire67 ? reg87 : reg68[(1'h1):(1'h0)]))) ?
              {wire58[(4'h8):(3'h6)],
                  {$unsigned({reg90})}} : ({(|wire60[(3'h4):(2'h3)])} & reg91[(3'h7):(1'h1)])))
            begin
              reg94 <= $unsigned((((^~(8'hb9)) & $signed((^reg73))) && (8'ha7)));
              reg95 <= $unsigned(reg81[(1'h0):(1'h0)]);
              reg96 <= $unsigned({(({reg90} > (~^(8'ha4))) != reg79[(3'h5):(2'h3)]),
                  $unsigned(($signed(reg72) < {reg76, reg82}))});
            end
          else
            begin
              reg94 <= (reg73 > {($signed((^~(8'ha0))) ^~ reg80[(1'h0):(1'h0)])});
            end
          reg97 <= (~^(~^(~(&{reg89, reg86}))));
          reg98 <= $signed($signed({$signed($unsigned(reg88))}));
          reg99 <= $signed(wire59);
        end
      else
        begin
          if ($unsigned($unsigned((-$unsigned((reg69 ? reg80 : wire61))))))
            begin
              reg93 <= $unsigned((((~&(reg89 ?
                  (8'haf) : reg80)) - ((reg92 > reg84) ?
                  reg88[(2'h3):(2'h2)] : (reg87 ^~ reg82))) | reg95[(1'h1):(1'h0)]));
              reg94 <= $signed((~|reg94[(3'h6):(1'h1)]));
              reg95 <= $signed((($unsigned($signed(reg96)) & $unsigned((~wire61))) ^~ (|{$signed(reg94),
                  {(8'hb4), reg87}})));
              reg96 <= wire67;
              reg97 <= $signed(reg98);
            end
          else
            begin
              reg93 <= (^$signed(($signed((8'hb6)) > ((reg79 ?
                      (7'h40) : (8'ha5)) ?
                  $signed(reg76) : reg92))));
              reg94 <= $unsigned((wire59 ^~ ($signed($unsigned(reg84)) ?
                  (wire60 | wire67) : reg69)));
              reg95 <= wire66[(2'h3):(1'h0)];
              reg96 <= $unsigned($unsigned(wire63));
              reg97 <= ((-(((|wire65) & (reg75 ? wire63 : reg84)) ?
                  (7'h43) : $signed((reg89 ?
                      wire62 : (8'hb0))))) || ($unsigned(reg77) ?
                  $signed(({wire65, reg87} ?
                      (wire65 ?
                          wire59 : reg84) : (reg94 >= (8'hbd)))) : (~&reg90)));
            end
          reg98 <= $signed((^~$unsigned($signed((wire65 >>> reg78)))));
        end
    end
  assign wire100 = $signed($signed(reg99[(4'h9):(4'h9)]));
  assign wire101 = wire71;
  assign wire102 = {((($signed(wire100) & reg83[(3'h6):(3'h6)]) < $unsigned($unsigned(reg93))) ^ $unsigned({(reg69 + (8'h9c)),
                           {(8'hb3), (8'hbc)}})),
                       {(^~reg74)}};
  assign wire103 = reg80;
  assign wire104 = {$signed(reg88)};
  assign wire105 = wire103[(2'h2):(2'h2)];
  assign wire106 = {(|(!reg80[(3'h4):(1'h1)]))};
  assign wire107 = reg88[(1'h1):(1'h1)];
  assign wire108 = ({(+$signed($signed(wire60)))} <= reg95[(4'hb):(4'ha)]);
  assign wire109 = (|reg73[(3'h5):(1'h0)]);
  assign wire110 = {$unsigned((~^$signed($unsigned(wire58)))), (~reg92)};
  assign wire111 = $signed($unsigned($unsigned((+{reg75}))));
endmodule

module module20
#(parameter param39 = {(-({((8'ha5) || (8'hb3))} >> (((8'hb7) <= (8'hb9)) ^~ ((8'h9c) ? (8'ha5) : (8'hb3))))), {((|((8'ha6) || (7'h42))) || ((&(8'hb5)) << (8'hb0))), (((~|(7'h44)) ? (!(8'hb9)) : ((8'hba) ? (8'hbf) : (8'ha2))) - (((8'ha9) > (8'ha9)) < (&(8'hb8))))}})
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire25;
  input wire signed [(4'hd):(1'h0)] wire24;
  input wire [(4'h8):(1'h0)] wire23;
  input wire [(3'h7):(1'h0)] wire22;
  input wire signed [(3'h7):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire35;
  wire signed [(5'h14):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire26;
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 (1'h0)};
  assign wire26 = $signed((!{($signed((8'hbf)) < {wire23, wire25})}));
  assign wire27 = wire22;
  assign wire28 = (-$signed($unsigned(wire23)));
  assign wire29 = wire23[(3'h5):(3'h5)];
  assign wire30 = $signed((wire28[(1'h0):(1'h0)] ?
                      $signed($signed((wire28 | (8'h9c)))) : wire22));
  assign wire31 = (wire23[(2'h3):(1'h0)] ^ ((wire29[(1'h0):(1'h0)] ?
                          ($signed((7'h43)) ?
                              $signed(wire29) : (^~(8'ha0))) : $signed((!wire22))) ?
                      ($signed((wire30 ? (8'hbe) : (7'h43))) ?
                          $unsigned(((8'hb4) >> wire21)) : ({wire26} ?
                              (wire23 + wire28) : {wire22})) : wire27[(4'h8):(2'h3)]));
  assign wire32 = wire31;
  assign wire33 = $signed({(-$signed(wire26))});
  assign wire34 = wire31[(4'hc):(4'h9)];
  assign wire35 = wire33[(4'ha):(1'h1)];
  assign wire36 = wire34[(5'h11):(1'h0)];
  assign wire37 = wire22[(3'h6):(2'h3)];
  assign wire38 = (~^{wire33[(4'hc):(4'hb)], (~^((8'hb9) ? wire26 : wire32))});
endmodule
