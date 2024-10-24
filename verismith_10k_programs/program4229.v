module top
#(parameter param197 = (^~((-(+((8'hb2) ? (8'h9d) : (8'had)))) ? ({((8'hbe) <<< (8'hab))} ? {(^(8'hb1)), ((8'hbb) * (8'ha1))} : ({(8'ha0), (8'hb3)} ? ((8'ha3) ? (8'ha4) : (8'h9e)) : (^(8'hab)))) : ((((8'h9f) >= (8'hae)) ^~ {(8'had)}) + (((8'hbc) ? (8'hb6) : (8'h9e)) ? (7'h43) : (&(7'h43)))))), 
parameter param198 = ((|(param197 - ({(8'ha8), param197} == (param197 ? param197 : param197)))) ? param197 : (~&(~^param197))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire [(4'h8):(1'h0)] wire191;
  wire [(5'h10):(1'h0)] wire190;
  wire signed [(4'hd):(1'h0)] wire189;
  wire signed [(4'hf):(1'h0)] wire188;
  wire signed [(5'h13):(1'h0)] wire187;
  wire signed [(4'hc):(1'h0)] wire186;
  wire [(5'h11):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire121;
  wire [(5'h14):(1'h0)] wire122;
  wire [(5'h13):(1'h0)] wire165;
  wire [(4'he):(1'h0)] wire167;
  wire [(2'h3):(1'h0)] wire184;
  reg signed [(4'hd):(1'h0)] reg196 = (1'h0);
  reg [(5'h12):(1'h0)] reg195 = (1'h0);
  reg [(5'h14):(1'h0)] reg194 = (1'h0);
  reg [(2'h3):(1'h0)] reg193 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg168 = (1'h0);
  assign y = {wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire119,
                 wire121,
                 wire122,
                 wire165,
                 wire167,
                 wire184,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg168,
                 (1'h0)};
  module4 #() modinst120 (wire119, clk, wire0, wire1, wire2, wire3, (8'ha3));
  assign wire121 = $unsigned($unsigned(wire1[(2'h3):(2'h3)]));
  assign wire122 = wire121;
  module123 #() modinst166 (wire165, clk, wire2, wire1, wire121, wire0);
  assign wire167 = (+wire122[(4'he):(4'h8)]);
  always
    @(posedge clk) begin
      reg168 <= $unsigned(wire167[(2'h3):(2'h3)]);
    end
  module169 #() modinst185 (wire184, clk, wire3, wire1, wire2, wire0, wire121);
  assign wire186 = $signed(wire2);
  assign wire187 = (~$unsigned(wire2[(4'ha):(3'h7)]));
  assign wire188 = wire119;
  assign wire189 = (!wire119);
  assign wire190 = $signed((^$signed({$unsigned(wire122),
                       wire119[(4'ha):(4'h8)]})));
  assign wire191 = $signed(({({(8'h9f)} ? (wire184 && wire0) : wire3),
                           (wire119 ? $unsigned(wire3) : (~|(8'had)))} ?
                       $signed(({wire0} ?
                           $signed(wire188) : (wire188 > reg168))) : $unsigned($unsigned((wire187 | (8'ha0))))));
  always
    @(posedge clk) begin
      reg192 <= (({{$unsigned((8'ha4))}} ^ ((-(wire188 ?
              (8'hb4) : wire184)) >> {$unsigned((8'ha9))})) ?
          $signed($unsigned(((wire3 <= wire190) ?
              ((7'h44) ? wire0 : wire191) : (^~reg168)))) : ((({wire186,
                      wire191} ?
                  wire186[(2'h2):(2'h2)] : wire121) ?
              $unsigned($unsigned(wire0)) : {(~|wire186),
                  wire186[(2'h3):(1'h0)]}) < wire3[(3'h4):(1'h0)]));
      reg193 <= (^~(wire2[(3'h4):(1'h1)] ~^ $unsigned($signed((wire187 >= wire119)))));
      reg194 <= (wire121 != (wire2[(4'he):(4'hb)] | (&wire3)));
      reg195 <= wire122[(5'h14):(3'h5)];
      reg196 <= wire119[(1'h1):(1'h0)];
    end
endmodule

module module169
#(parameter param182 = (((|({(8'hb4), (7'h41)} ? ((8'ha2) + (8'hb2)) : (&(8'ha4)))) ? (+(^~((8'ha4) ? (8'ha6) : (8'ha9)))) : ((((8'ha1) ? (8'haa) : (8'hb2)) ? ((8'ha7) ? (8'hb5) : (8'hb0)) : {(7'h40), (8'hbf)}) ? (((8'hb4) ? (8'hb4) : (8'hb3)) ? (+(8'had)) : ((8'hb0) ? (8'ha9) : (8'ha4))) : {(8'ha6), ((8'hb9) << (8'hb8))})) ? (|((((8'hb2) ? (8'had) : (8'hb8)) ? (~|(8'hba)) : {(8'hb3), (8'ha0)}) - (7'h42))) : {((&(|(8'hab))) != ((^(8'hb9)) << ((7'h41) ? (8'haa) : (8'hbc)))), ((8'haf) * (+(&(8'hb1))))}), 
parameter param183 = ((~&(((8'ha9) + (param182 > param182)) + param182)) - ({(|(param182 ? (8'hb9) : param182)), param182} & (8'ha3))))
(y, clk, wire174, wire173, wire172, wire171, wire170);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire174;
  input wire signed [(5'h11):(1'h0)] wire173;
  input wire signed [(4'hc):(1'h0)] wire172;
  input wire signed [(5'h11):(1'h0)] wire171;
  input wire [(3'h4):(1'h0)] wire170;
  wire signed [(5'h14):(1'h0)] wire181;
  wire [(4'h9):(1'h0)] wire180;
  wire signed [(4'hb):(1'h0)] wire179;
  wire signed [(5'h12):(1'h0)] wire178;
  wire [(4'hf):(1'h0)] wire177;
  wire [(4'hd):(1'h0)] wire176;
  wire signed [(5'h14):(1'h0)] wire175;
  assign y = {wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 (1'h0)};
  assign wire175 = wire170[(3'h4):(2'h3)];
  assign wire176 = wire173[(4'hd):(4'ha)];
  assign wire177 = (((wire174 - wire170[(2'h2):(1'h1)]) || ((8'hb7) <<< (wire174[(4'h9):(3'h6)] | wire172))) ?
                       (+(wire172 >>> ($unsigned(wire171) | $signed(wire170)))) : $signed($unsigned($unsigned($signed((7'h42))))));
  assign wire178 = (-$unsigned((((wire170 > wire176) ?
                       wire174 : (wire171 ~^ (8'h9d))) * (8'hbd))));
  assign wire179 = $signed(($signed(wire174[(3'h5):(3'h4)]) ?
                       {wire172[(3'h4):(1'h1)],
                           ((7'h40) ?
                               $signed((8'hae)) : {wire178,
                                   wire175})} : ((wire171 ^~ ((8'hb9) * wire175)) * ($signed(wire171) == wire177[(2'h3):(2'h3)]))));
  assign wire180 = (|wire177[(1'h1):(1'h0)]);
  assign wire181 = ($signed({(^~$unsigned(wire177)),
                       ($signed(wire179) ?
                           $unsigned(wire177) : wire176[(4'hc):(4'hc)])}) == wire176[(2'h2):(1'h0)]);
endmodule

module module123  (y, clk, wire124, wire125, wire126, wire127);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire124;
  input wire [(4'h8):(1'h0)] wire125;
  input wire signed [(5'h13):(1'h0)] wire126;
  input wire [(5'h15):(1'h0)] wire127;
  wire signed [(5'h15):(1'h0)] wire160;
  wire [(2'h2):(1'h0)] wire128;
  wire signed [(4'hd):(1'h0)] wire129;
  wire [(3'h7):(1'h0)] wire130;
  wire signed [(3'h7):(1'h0)] wire131;
  wire signed [(5'h13):(1'h0)] wire132;
  wire signed [(4'he):(1'h0)] wire133;
  wire signed [(4'h9):(1'h0)] wire134;
  wire signed [(4'hd):(1'h0)] wire135;
  wire [(5'h14):(1'h0)] wire155;
  reg signed [(5'h14):(1'h0)] reg164 = (1'h0);
  reg [(5'h10):(1'h0)] reg163 = (1'h0);
  reg [(5'h11):(1'h0)] reg162 = (1'h0);
  reg [(5'h10):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg159 = (1'h0);
  reg [(4'h9):(1'h0)] reg158 = (1'h0);
  reg [(4'ha):(1'h0)] reg157 = (1'h0);
  assign y = {wire160,
                 wire128,
                 wire129,
                 wire130,
                 wire131,
                 wire132,
                 wire133,
                 wire134,
                 wire135,
                 wire155,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg159,
                 reg158,
                 reg157,
                 (1'h0)};
  assign wire128 = ($signed(wire126[(5'h11):(3'h6)]) > (^~$signed({((8'hb6) ?
                           wire124 : wire126),
                       {wire125}})));
  assign wire129 = (((8'haf) ?
                       $unsigned($signed($unsigned(wire127))) : wire127) & $signed((!{(wire128 << wire124),
                       wire127})));
  assign wire130 = (($unsigned((-$unsigned(wire129))) ~^ $unsigned($signed((~^wire126)))) & $unsigned(({wire124[(3'h4):(3'h4)],
                       wire127} >= ((~^wire124) | wire124))));
  assign wire131 = (8'ha0);
  assign wire132 = {wire131[(3'h7):(1'h1)], (+$unsigned(wire129))};
  assign wire133 = {(^~($unsigned($unsigned((8'hbc))) ?
                           $unsigned($signed(wire130)) : $unsigned($unsigned(wire125)))),
                       (~|wire126[(5'h11):(5'h11)])};
  assign wire134 = $signed((($signed((^~wire128)) ^ (^wire130[(2'h2):(1'h1)])) ?
                       (8'ha0) : (~^$signed((~|(8'hac))))));
  assign wire135 = (wire128[(2'h2):(1'h0)] ^~ {{(^~wire132[(4'hd):(3'h5)]),
                           $signed((~wire131))}});
  module136 #() modinst156 (wire155, clk, wire125, wire130, wire132, wire129, wire126);
  always
    @(posedge clk) begin
      reg157 <= ((+(wire130 ?
              {$unsigned(wire132),
                  $signed((8'hb1))} : $signed(wire130[(3'h6):(2'h3)]))) ?
          ({wire125} ?
              (wire134 < (-(wire127 ?
                  wire155 : wire124))) : {$signed((&wire127)),
                  $signed(wire130)}) : $unsigned((8'ha9)));
      reg158 <= reg157[(2'h3):(1'h0)];
      reg159 <= $signed(((($unsigned(wire124) ?
              $signed(wire133) : $signed(wire127)) ?
          ({wire124, wire133} ?
              {reg158} : wire124) : wire155[(2'h2):(2'h2)]) * reg157[(1'h0):(1'h0)]));
    end
  assign wire160 = (|(7'h41));
  always
    @(posedge clk) begin
      reg161 <= ($unsigned(($unsigned($unsigned(wire124)) ?
              {$unsigned(reg159),
                  wire125[(1'h0):(1'h0)]} : wire127[(3'h4):(2'h2)])) ?
          $unsigned(wire155[(5'h11):(2'h3)]) : ((wire135[(4'ha):(2'h3)] == (wire134[(3'h6):(2'h3)] && (reg158 ?
                  (8'hb9) : wire129))) ?
              $unsigned(((reg157 ~^ (8'hb4)) ?
                  (~&wire133) : (wire124 || wire130))) : $unsigned(((wire127 <= reg157) > {wire131}))));
      reg162 <= (wire126[(5'h11):(4'ha)] ?
          $signed($unsigned({wire130, (^~wire129)})) : (((((8'hbb) != reg157) ?
              (reg161 ?
                  wire134 : wire135) : $signed(wire160)) << $signed($unsigned(wire135))) ^~ ({$unsigned(reg157),
              $unsigned(reg157)} * {(8'hae), wire134})));
      reg163 <= (~|$unsigned($signed($unsigned((wire134 ? wire125 : reg161)))));
      reg164 <= {wire128[(1'h0):(1'h0)]};
    end
endmodule

module module4
#(parameter param117 = (((-(-((8'hab) || (7'h44)))) ? (({(8'ha9)} ? ((8'had) <<< (8'h9f)) : {(8'hbe)}) - {(-(8'hae))}) : ((((8'hac) ? (8'ha3) : (8'ha8)) ? {(8'hb7)} : ((8'h9c) << (8'hb6))) <= {((8'ha3) ? (8'ha6) : (8'hb3)), {(7'h43)}})) ? (|({((8'ha0) ? (8'hb7) : (8'hb7))} ? (~&((8'ha0) & (8'hbb))) : {((8'hbe) > (8'hbe))})) : {(((~&(8'hb9)) ? ((7'h43) + (8'ha5)) : (^~(8'haa))) ^~ (8'hb6))}), 
parameter param118 = (+{param117}))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h2f7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire9;
  input wire signed [(3'h5):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire6;
  input wire signed [(3'h6):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire103;
  wire signed [(4'he):(1'h0)] wire102;
  wire signed [(5'h12):(1'h0)] wire101;
  wire [(4'he):(1'h0)] wire100;
  wire [(2'h3):(1'h0)] wire99;
  wire signed [(4'hf):(1'h0)] wire98;
  wire [(4'he):(1'h0)] wire97;
  wire signed [(4'ha):(1'h0)] wire96;
  wire [(4'ha):(1'h0)] wire95;
  wire signed [(2'h3):(1'h0)] wire77;
  wire [(4'hd):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire75;
  wire signed [(4'he):(1'h0)] wire74;
  wire [(3'h5):(1'h0)] wire73;
  wire signed [(5'h13):(1'h0)] wire72;
  wire [(4'hd):(1'h0)] wire71;
  wire [(3'h7):(1'h0)] wire69;
  reg [(4'hb):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg [(3'h5):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg110 = (1'h0);
  reg [(4'hd):(1'h0)] reg109 = (1'h0);
  reg [(4'hf):(1'h0)] reg108 = (1'h0);
  reg [(2'h2):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg106 = (1'h0);
  reg [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg94 = (1'h0);
  reg [(3'h6):(1'h0)] reg93 = (1'h0);
  reg [(5'h11):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(5'h15):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg82 = (1'h0);
  reg [(4'h9):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  assign y = {wire116,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
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
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire6)
        begin
          reg10 <= (8'hb5);
          reg11 <= (wire8[(3'h4):(3'h4)] ?
              (((wire8 ? wire7 : reg10) * $unsigned((+wire6))) ?
                  $signed((^~(8'hbc))) : (&wire8)) : $unsigned(wire5[(2'h2):(1'h1)]));
          if (reg11[(4'h9):(3'h7)])
            begin
              reg12 <= reg11[(3'h4):(1'h0)];
              reg13 <= ($unsigned(reg11[(2'h2):(1'h0)]) ?
                  wire5[(1'h0):(1'h0)] : $unsigned(wire9[(3'h6):(3'h6)]));
              reg14 <= (($signed($signed((wire7 ? reg13 : (8'hb4)))) ?
                      (($signed(reg13) ?
                          (~&reg12) : (wire9 || wire6)) & (wire9[(4'h9):(1'h1)] ?
                          $unsigned(wire6) : wire5)) : reg10) ?
                  (^~(wire5 ?
                      (|$signed(wire8)) : $unsigned((~^wire6)))) : (~^($unsigned(((7'h42) ?
                      wire8 : (8'ha3))) ~^ (reg11[(1'h0):(1'h0)] | ((8'ha7) ?
                      reg10 : reg10)))));
            end
          else
            begin
              reg12 <= $unsigned(reg13);
            end
          reg15 <= ($unsigned((!$signed($unsigned(wire6)))) ?
              reg10[(3'h6):(2'h3)] : ($signed(wire6[(4'he):(4'hc)]) & ((!$unsigned((8'h9c))) ?
                  reg14[(5'h10):(4'hd)] : reg14)));
          if ({wire5[(2'h2):(2'h2)]})
            begin
              reg16 <= $signed((-wire6[(4'hb):(4'ha)]));
              reg17 <= {((^~reg14) <= (wire8[(3'h5):(3'h4)] ?
                      reg11 : (~&wire9[(4'h9):(4'h9)]))),
                  ((-$signed((reg11 != reg15))) - ({reg16} >>> ($signed(reg11) ?
                      reg11 : reg13[(4'ha):(4'ha)])))};
              reg18 <= (+$unsigned((+$unsigned($signed(reg11)))));
              reg19 <= $signed($signed($signed(({reg14} == $unsigned(reg16)))));
              reg20 <= wire8[(2'h3):(1'h1)];
            end
          else
            begin
              reg16 <= ({wire6} ?
                  reg16[(3'h7):(1'h1)] : (-$signed($unsigned({reg17}))));
              reg17 <= reg13;
              reg18 <= {$unsigned((($signed(reg16) ?
                          ((8'hb1) ? wire5 : wire8) : wire5) ?
                      (~(reg13 <<< reg14)) : $signed($signed(wire9))))};
              reg19 <= ((8'h9e) ?
                  $signed(($unsigned((~&reg15)) - ($signed(reg15) <<< reg14))) : $unsigned(((((7'h40) ?
                          reg19 : wire8) ^ (wire6 ? reg15 : (8'ha6))) ?
                      wire8 : (8'hb5))));
            end
        end
      else
        begin
          reg10 <= {(reg13 ^ $unsigned((7'h42))),
              $signed($signed((!$unsigned(reg13))))};
        end
      reg21 <= $signed(reg16[(1'h0):(1'h0)]);
      reg22 <= (({$unsigned($unsigned(reg19))} ^~ $signed(wire6[(1'h1):(1'h0)])) ?
          $unsigned(($unsigned($signed(reg14)) ?
              (+wire8[(3'h5):(2'h3)]) : $signed(wire8))) : ((+reg10) <<< wire7));
      reg23 <= (~^wire8[(3'h4):(3'h4)]);
      reg24 <= $unsigned((((((8'ha7) | (8'h9c)) ?
                  (wire7 ^ wire5) : $unsigned((8'h9f))) ?
              (^$unsigned(reg21)) : {reg16[(3'h7):(3'h5)], $unsigned(wire9)}) ?
          $signed(wire7) : wire9));
    end
  module25 #() modinst70 (.wire26(reg21), .wire27(reg17), .wire30(reg14), .clk(clk), .wire28(wire6), .wire29(wire9), .y(wire69));
  assign wire71 = $unsigned({$unsigned(reg20[(4'hc):(4'hb)]),
                      $unsigned(($signed(wire9) ?
                          ((8'hb1) ^~ reg23) : ((8'hbb) != wire5)))});
  assign wire72 = ({$signed(((reg20 >> (8'ha4)) ?
                          (reg20 << wire8) : (reg13 ? reg10 : reg22))),
                      (^reg19[(1'h0):(1'h0)])} >>> (8'hb7));
  assign wire73 = (~&$signed(($signed($signed(wire6)) ?
                      wire8 : (((8'hb1) >>> wire69) ?
                          $unsigned(wire6) : (reg10 >> (8'ha5))))));
  assign wire74 = wire7[(2'h2):(2'h2)];
  assign wire75 = (8'h9d);
  assign wire76 = {(~(&$unsigned(wire5[(1'h0):(1'h0)]))), wire5};
  assign wire77 = $unsigned($signed((((wire5 ?
                          reg21 : wire9) || $signed(wire75)) ?
                      reg24 : wire73[(3'h4):(3'h4)])));
  always
    @(posedge clk) begin
      if (({reg10[(2'h2):(2'h2)], (wire8[(2'h3):(1'h0)] | wire77)} ?
          {wire69[(2'h2):(1'h1)]} : wire71))
        begin
          reg78 <= ((~^$signed((wire7[(4'hf):(4'h8)] ?
              $signed((8'hb8)) : $signed(wire77)))) - reg11[(4'hb):(2'h2)]);
          reg79 <= (~(^wire76[(3'h7):(3'h4)]));
          reg80 <= $unsigned($signed({reg79[(1'h0):(1'h0)], reg18}));
          if (reg79[(3'h4):(2'h2)])
            begin
              reg81 <= (8'hb8);
              reg82 <= $unsigned(reg14);
              reg83 <= wire8[(3'h4):(2'h3)];
              reg84 <= ($unsigned((8'h9d)) ?
                  reg79 : (~&$signed(((~(8'hae)) ?
                      reg79 : ((7'h44) ? (8'hb1) : reg11)))));
              reg85 <= reg10;
            end
          else
            begin
              reg81 <= $unsigned($signed(($unsigned(wire9) ?
                  reg21[(2'h3):(2'h2)] : $signed((-wire9)))));
            end
        end
      else
        begin
          if (wire8[(3'h4):(1'h1)])
            begin
              reg78 <= ({(!($signed(wire71) ~^ (wire7 != reg85))),
                  (reg24 ? $unsigned((reg20 || reg23)) : reg80)} & (wire77 ?
                  wire71[(1'h1):(1'h1)] : wire69[(3'h7):(3'h4)]));
              reg79 <= $unsigned($unsigned((reg85[(3'h7):(2'h2)] ?
                  $signed($signed(reg15)) : {(~^wire71)})));
              reg80 <= reg78[(3'h5):(2'h2)];
              reg81 <= wire73;
              reg82 <= (|(~^($signed(wire5[(2'h2):(1'h0)]) - (reg23[(2'h2):(1'h0)] >= (wire74 - reg15)))));
            end
          else
            begin
              reg78 <= {(wire75 ?
                      (wire5 ?
                          $unsigned(((8'h9c) * reg85)) : ($signed(wire9) * (~&wire9))) : (+(^$signed(reg21))))};
            end
          reg83 <= wire75;
          reg84 <= (reg23[(2'h3):(2'h2)] && {$unsigned($signed((!reg82)))});
          reg85 <= $unsigned({($signed(reg20) ?
                  ((reg78 ? reg84 : reg10) ?
                      reg17 : reg23[(1'h1):(1'h1)]) : $unsigned((~^wire77)))});
          if (wire6)
            begin
              reg86 <= reg82[(3'h7):(1'h1)];
              reg87 <= ($signed(((^~reg19) ?
                  (((8'hb6) && reg24) ?
                      $unsigned(wire77) : (~&reg12)) : ($unsigned(reg10) && (reg20 & wire77)))) <= reg17);
              reg88 <= reg12[(3'h6):(2'h3)];
              reg89 <= $unsigned($signed({$signed(wire73)}));
            end
          else
            begin
              reg86 <= (^{reg16});
            end
        end
      reg90 <= wire76[(1'h1):(1'h1)];
      if (reg81)
        begin
          reg91 <= ($unsigned(((!(&reg21)) ?
              $signed((&reg82)) : (!(+reg86)))) - {$unsigned($unsigned((-wire75)))});
          reg92 <= {reg12[(2'h2):(1'h0)],
              ((({wire72} ?
                  (^(8'ha2)) : wire73[(1'h0):(1'h0)]) >> $signed($unsigned(wire73))) >>> $signed((reg21[(1'h1):(1'h0)] ?
                  reg80 : (wire7 ? reg16 : (8'hb1)))))};
          reg93 <= wire71[(4'hb):(4'ha)];
          reg94 <= $unsigned(reg85);
        end
      else
        begin
          reg91 <= ($unsigned($signed(({reg78, (8'hb4)} > $signed((8'ha2))))) ?
              reg90[(4'hb):(2'h3)] : (($signed((+reg92)) ^~ wire6) ?
                  wire75[(3'h5):(3'h4)] : {($signed(reg83) << $signed(reg78)),
                      (8'hb2)}));
          reg92 <= reg87[(2'h3):(2'h3)];
        end
    end
  assign wire95 = ((~^reg90) && reg18);
  assign wire96 = $unsigned(reg18[(3'h6):(2'h3)]);
  assign wire97 = reg79[(2'h2):(1'h1)];
  assign wire98 = {$unsigned(($signed({wire7, reg17}) ?
                          (7'h43) : (reg85 ^~ (wire76 == wire69))))};
  assign wire99 = (reg84 ? {reg12} : wire69[(3'h4):(2'h2)]);
  assign wire100 = $unsigned((~(reg79 ?
                       $unsigned({reg89, wire77}) : {(reg12 ?
                               reg17 : (8'ha4))})));
  assign wire101 = {$unsigned((^~wire100))};
  assign wire102 = ((~&wire73[(2'h2):(2'h2)]) | ($unsigned(reg22) ?
                       ($unsigned(wire99[(1'h1):(1'h1)]) ^ $signed(((8'ha5) <<< reg18))) : $signed($unsigned($signed(wire73)))));
  assign wire103 = $unsigned(((wire102 ?
                           $unsigned((reg20 >> wire75)) : $signed({wire76,
                               wire5})) ?
                       $signed(reg91[(3'h5):(3'h4)]) : (wire7 >>> (wire97 ?
                           (^wire69) : (8'ha0)))));
  always
    @(posedge clk) begin
      if (({($unsigned(reg79) >> (~|(reg82 ? wire103 : (8'hb5)))),
          $signed(reg81[(4'h8):(3'h7)])} - $signed(($signed((reg84 + wire102)) <= ({wire96} ?
          reg11[(3'h6):(2'h3)] : $signed(reg89))))))
        begin
          reg104 <= wire99;
          if ($unsigned($unsigned(((wire103[(3'h4):(2'h3)] * (8'hb7)) ^~ (8'hbb)))))
            begin
              reg105 <= $signed(wire77[(1'h1):(1'h1)]);
              reg106 <= reg18[(4'h9):(2'h2)];
            end
          else
            begin
              reg105 <= ($unsigned(wire101) >>> $signed((($unsigned(reg23) >>> (|reg89)) == $unsigned(reg79))));
              reg106 <= wire95;
              reg107 <= {reg94[(4'h8):(3'h4)],
                  $unsigned($signed((~(reg81 ? reg94 : reg22))))};
            end
          if (wire98[(1'h0):(1'h0)])
            begin
              reg108 <= (wire103[(5'h13):(4'hc)] < ((wire96 == $signed((reg89 - reg78))) ?
                  ((-((8'hb6) == reg90)) ?
                      reg11[(3'h7):(3'h4)] : ((wire100 || wire103) ^~ $unsigned(reg12))) : {(reg93 ?
                          ((8'had) ? reg80 : reg18) : (+reg12)),
                      ((reg22 ? reg24 : reg91) != (^wire100))}));
              reg109 <= reg21[(1'h1):(1'h1)];
            end
          else
            begin
              reg108 <= reg82;
            end
          reg110 <= $signed(wire98);
          if (reg91)
            begin
              reg111 <= {(($unsigned(reg107[(2'h2):(2'h2)]) <= wire73) ?
                      $signed(wire7) : $signed(wire96[(3'h5):(3'h4)]))};
              reg112 <= reg92;
            end
          else
            begin
              reg111 <= $signed($signed($unsigned((7'h44))));
              reg112 <= reg86[(3'h4):(1'h1)];
              reg113 <= (8'hba);
            end
        end
      else
        begin
          reg104 <= (|{({(wire7 + reg10)} ?
                  ((8'hbd) == (^~wire75)) : ($signed((8'ha5)) != reg94))});
          if (($signed(reg112[(4'h8):(3'h6)]) <<< reg90[(1'h0):(1'h0)]))
            begin
              reg105 <= ({{wire74[(4'ha):(4'ha)]},
                  $signed(reg92)} ^ $signed((~^$signed((+(8'ha7))))));
              reg106 <= $signed((+(+((wire97 ? reg83 : wire97) ?
                  (8'ha2) : $signed(wire100)))));
              reg107 <= reg22[(4'hc):(3'h6)];
              reg108 <= $signed({{$signed(reg24)}, reg113[(4'ha):(3'h6)]});
              reg109 <= (($unsigned($signed(reg79)) ?
                      (reg19 >>> ($signed((7'h40)) ?
                          (reg16 ? reg84 : wire101) : (wire72 ?
                              wire69 : wire73))) : reg11[(3'h4):(1'h1)]) ?
                  wire8 : reg15);
            end
          else
            begin
              reg105 <= $unsigned((-reg86[(2'h2):(2'h2)]));
              reg106 <= (^{{$unsigned(reg81[(3'h5):(1'h0)])}});
              reg107 <= $unsigned(((reg10[(3'h5):(1'h0)] < $unsigned($signed(wire96))) != $signed((reg20 ~^ reg89))));
            end
          reg110 <= $unsigned($signed(((^reg79[(2'h3):(1'h0)]) <= (~^reg112))));
          reg111 <= ($signed(reg110[(1'h0):(1'h0)]) ^~ $signed($unsigned($signed((reg17 <= reg16)))));
          if ({(reg13 ?
                  $unsigned(((~&reg18) && (wire103 ?
                      reg80 : reg110))) : reg93)})
            begin
              reg112 <= {(8'hb4), $signed({{(~&wire97)}, reg111})};
              reg113 <= ($signed((((wire71 >> (8'ha6)) ?
                          (reg20 ? (8'h9d) : wire69) : reg93[(1'h1):(1'h1)]) ?
                      ((wire7 - wire9) ?
                          wire69 : (reg12 ? wire5 : wire99)) : (|wire8))) ?
                  $unsigned({reg111[(3'h5):(1'h1)],
                      (~|$unsigned(reg91))}) : (($signed(reg15) >>> reg18[(2'h2):(1'h0)]) || (-((~&(8'ha1)) ?
                      ((8'ha2) ^~ wire69) : wire71[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg112 <= reg85[(4'hc):(4'h9)];
              reg113 <= ({$signed($signed((reg86 | reg107))),
                      $signed($unsigned((wire100 || reg14)))} ?
                  (($unsigned(((8'h9f) ? (8'haa) : reg105)) ?
                      $unsigned($unsigned(wire103)) : ($signed(reg24) * (wire76 - reg107))) && $unsigned($signed($unsigned(wire97)))) : (wire5[(1'h0):(1'h0)] ?
                      ($signed({reg13}) << {(^reg18),
                          (reg16 && reg13)}) : (reg81[(2'h2):(1'h0)] ~^ (^~(~(8'ha1))))));
              reg114 <= (reg94[(5'h12):(4'hd)] ?
                  ($signed(reg109[(2'h3):(2'h2)]) > (+(|$signed((8'ha2))))) : reg91);
              reg115 <= $unsigned(reg90[(4'hf):(4'hd)]);
            end
        end
    end
  assign wire116 = ($unsigned({(((8'ha6) ?
                           reg13 : reg92) != $signed(reg104))}) >>> reg11);
endmodule

module module25
#(parameter param67 = {((((|(8'ha7)) ? (~(8'hb5)) : ((8'ha8) != (8'ha1))) == (!((7'h40) ^~ (8'hb0)))) ? (((-(8'ha7)) && ((8'hb9) << (7'h40))) ? (((8'hb0) > (8'hb6)) ~^ ((8'had) ? (8'hba) : (8'hb4))) : ((~&(8'hbf)) ? (^~(8'ha8)) : ((8'ha9) ~^ (8'ha9)))) : ((~|((8'h9d) ^ (8'haf))) ^ {((7'h44) ? (8'hbe) : (8'hbe))})), ({(((8'hb7) < (8'hab)) ? ((8'hbd) ? (7'h41) : (8'hba)) : ((8'hba) != (8'hb2))), (((8'hbe) ? (8'ha9) : (7'h42)) ^~ (!(8'hba)))} ? (({(8'hba), (7'h44)} * ((8'ha5) ? (8'haa) : (7'h41))) > ((8'hae) == (!(8'h9f)))) : (&{((8'ha8) ? (8'hbd) : (8'hab))}))}, 
parameter param68 = (&param67))
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h1bf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire30;
  input wire signed [(4'h8):(1'h0)] wire29;
  input wire signed [(5'h12):(1'h0)] wire28;
  input wire [(2'h3):(1'h0)] wire27;
  input wire signed [(5'h14):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire65;
  wire signed [(4'hf):(1'h0)] wire64;
  wire [(4'hf):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire59;
  wire signed [(3'h4):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire42;
  wire [(4'hc):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire31;
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire59,
                 wire58,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire32,
                 wire31,
                 reg61,
                 reg60,
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
                 reg46,
                 reg45,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire31 = (wire27 ^~ (^~((~((8'ha3) <<< wire29)) >> (-{wire28,
                      wire27}))));
  assign wire32 = wire30[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg33 <= $signed($signed({wire29}));
      if ((+$signed({(~^$unsigned(wire28)),
          (wire28[(4'h9):(2'h3)] > (wire27 ? wire32 : reg33))})))
        begin
          reg34 <= ($unsigned({$unsigned(((8'h9f) ? (8'ha5) : reg33))}) ?
              ((^$unsigned((wire26 ? wire30 : reg33))) ?
                  $signed($unsigned((&wire28))) : {((wire29 ?
                          wire32 : reg33) << wire30),
                      (^~(wire29 | (8'ha6)))}) : (~$unsigned((^~wire32[(3'h4):(1'h1)]))));
          if ((wire26[(4'hb):(3'h6)] ^~ $unsigned(wire30[(1'h0):(1'h0)])))
            begin
              reg35 <= $unsigned(wire31[(5'h12):(2'h3)]);
              reg36 <= {$unsigned(reg35), {reg35[(2'h3):(1'h0)], reg34}};
            end
          else
            begin
              reg35 <= (~|(&$unsigned((wire31[(4'h8):(3'h4)] || (8'hb9)))));
              reg36 <= (reg34 ?
                  wire30 : (|($signed((&wire28)) ?
                      $unsigned(wire29) : {wire31[(4'ha):(4'h8)]})));
              reg37 <= (+({($unsigned(reg34) << {wire27,
                      (8'haa)})} + wire27[(2'h3):(1'h0)]));
            end
          reg38 <= $signed((~^wire27));
          reg39 <= (7'h42);
        end
      else
        begin
          reg34 <= (wire29[(1'h0):(1'h0)] ?
              reg38[(4'h8):(2'h2)] : $signed({$unsigned({wire32}), (-wire32)}));
          reg35 <= reg38[(2'h2):(2'h2)];
          reg36 <= $signed($unsigned($unsigned(wire30[(1'h0):(1'h0)])));
          reg37 <= wire27[(2'h3):(2'h3)];
          reg38 <= $unsigned((~&$unsigned($unsigned(wire32))));
        end
    end
  assign wire40 = $signed({(~|reg34[(1'h1):(1'h0)])});
  assign wire41 = $unsigned(((~reg37[(3'h6):(3'h4)]) ?
                      $unsigned($unsigned($unsigned(reg35))) : {$unsigned((wire26 << wire28)),
                          {$unsigned(reg33)}}));
  assign wire42 = (|$unsigned((-wire31)));
  assign wire43 = ((wire32 ?
                      $signed(wire42[(1'h1):(1'h1)]) : ($signed((reg36 ?
                          wire30 : reg39)) ^ ($signed(wire32) == (reg35 && (7'h44))))) ~^ $unsigned((8'hbb)));
  assign wire44 = wire41;
  always
    @(posedge clk) begin
      reg45 <= reg34[(1'h0):(1'h0)];
      if (wire29[(1'h0):(1'h0)])
        begin
          reg46 <= $signed($unsigned(((~^(wire30 ?
              reg37 : (8'hbc))) || wire32[(1'h1):(1'h1)])));
          reg47 <= (((((&(8'haf)) ?
                  wire32 : wire41[(3'h7):(3'h5)]) & ((wire42 ^~ (8'ha2)) ?
                  (~&wire32) : reg38[(1'h0):(1'h0)])) ?
              reg35 : ((8'hbf) >= $unsigned(wire28[(4'h9):(3'h7)]))) == wire30);
          if (wire41)
            begin
              reg48 <= $unsigned((8'h9f));
            end
          else
            begin
              reg48 <= $signed((($signed({wire31}) ?
                      (!(reg39 ? (8'hb8) : wire28)) : (&(reg48 ?
                          wire29 : wire43))) ?
                  ((|wire26[(3'h6):(1'h0)]) != wire31) : (|(~|wire27[(1'h0):(1'h0)]))));
              reg49 <= $unsigned(wire30);
            end
          reg50 <= reg49[(2'h2):(2'h2)];
          reg51 <= reg36;
        end
      else
        begin
          reg46 <= $unsigned(reg47);
          reg47 <= $unsigned(reg46);
          reg48 <= {$signed((~(|reg38)))};
          reg49 <= $signed(((reg34[(2'h3):(2'h2)] ^ ((reg38 + wire32) ?
                  $unsigned(wire43) : $signed((8'hbf)))) ?
              (+$signed($signed(reg50))) : reg48[(2'h3):(2'h3)]));
          reg50 <= reg49[(1'h1):(1'h1)];
        end
      reg52 <= ($unsigned($unsigned($unsigned({(8'h9c),
          wire43}))) ^ $signed({(((8'ha2) == (7'h44)) || wire43[(5'h10):(3'h7)])}));
      reg53 <= (-wire26[(3'h6):(2'h2)]);
      if (reg33[(2'h2):(1'h0)])
        begin
          reg54 <= (wire28 ? reg45 : reg37[(2'h2):(1'h1)]);
          reg55 <= reg47[(4'hc):(1'h0)];
          reg56 <= {(+reg33)};
          reg57 <= ((8'hbc) ^ {($unsigned(wire26[(4'h8):(3'h5)]) >> ($signed(wire27) ?
                  (reg52 == reg37) : (wire31 ? reg46 : reg48)))});
        end
      else
        begin
          reg54 <= ($signed($unsigned((^reg54))) ?
              ((|{$unsigned(reg57),
                  (wire40 >> reg45)}) || (~&reg37[(4'ha):(2'h2)])) : $signed($signed(($unsigned(reg37) - (~^reg50)))));
          reg55 <= (-wire40[(3'h7):(3'h7)]);
        end
    end
  assign wire58 = $signed((^~(reg50[(4'hc):(3'h5)] ?
                      ((~&reg55) < (|wire43)) : $signed((~^(7'h41))))));
  assign wire59 = reg57;
  always
    @(posedge clk) begin
      reg60 <= reg45[(1'h1):(1'h0)];
      reg61 <= ((reg37[(2'h2):(1'h1)] ? wire31[(2'h2):(2'h2)] : wire42) ?
          (+wire40) : reg36);
    end
  assign wire62 = (~($unsigned(((reg36 ? wire42 : reg36) ^~ (~^(8'h9e)))) ?
                      $unsigned((reg38 ?
                          (&reg46) : wire41[(3'h5):(1'h0)])) : $unsigned((reg57 ?
                          (^(8'hb3)) : reg50[(4'ha):(1'h1)]))));
  assign wire63 = (8'hb7);
  assign wire64 = reg53[(2'h3):(2'h2)];
  assign wire65 = (|reg33);
  assign wire66 = $unsigned(wire29);
endmodule

module module136
#(parameter param153 = (|(|((((8'h9c) ? (8'hba) : (7'h40)) < {(8'ha7)}) + ((~|(8'hb2)) ? ((8'hbd) ? (8'ha6) : (7'h43)) : {(8'hb0)})))), 
parameter param154 = {param153, (&((((8'ha1) * param153) ? (param153 ? param153 : param153) : (8'hb0)) << (((8'hb6) ? param153 : param153) ? (param153 > param153) : (7'h41))))})
(y, clk, wire141, wire140, wire139, wire138, wire137);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire141;
  input wire signed [(2'h3):(1'h0)] wire140;
  input wire signed [(5'h13):(1'h0)] wire139;
  input wire signed [(4'hd):(1'h0)] wire138;
  input wire [(2'h3):(1'h0)] wire137;
  wire signed [(3'h4):(1'h0)] wire152;
  wire [(4'he):(1'h0)] wire151;
  wire signed [(3'h4):(1'h0)] wire150;
  wire signed [(5'h14):(1'h0)] wire149;
  wire signed [(3'h5):(1'h0)] wire146;
  reg signed [(2'h3):(1'h0)] reg148 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg147 = (1'h0);
  reg [(4'hd):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg144 = (1'h0);
  reg [(4'he):(1'h0)] reg143 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg142 = (1'h0);
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire146,
                 reg148,
                 reg147,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg142 <= $signed(((((~(8'h9c)) ?
                  $unsigned(wire137) : wire141[(3'h4):(1'h1)]) ?
              (~|$signed(wire139)) : wire137) ?
          (((-(8'h9d)) < wire141[(1'h0):(1'h0)]) <= $signed($signed(wire140))) : (^~wire140)));
      reg143 <= $signed((~|$unsigned(((reg142 ? wire137 : wire139) ?
          $signed(wire140) : {wire140, wire140}))));
      reg144 <= reg142;
      reg145 <= ((wire141 ~^ $unsigned((-$unsigned(wire138)))) == $signed($unsigned($signed((~|reg143)))));
    end
  assign wire146 = wire137[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg147 <= ($unsigned((^~$signed((&wire138)))) ?
          reg145 : ((^~(8'hb8)) >= reg143));
      reg148 <= (~reg143);
    end
  assign wire149 = reg145;
  assign wire150 = reg144;
  assign wire151 = $unsigned($unsigned(($signed((wire146 ^~ reg143)) && $signed($signed(reg143)))));
  assign wire152 = (wire151[(4'hb):(4'hb)] >= $signed(reg145));
endmodule
