module top
#(parameter param179 = {(-{{((8'hbc) >= (8'ha7))}, {((8'hb0) - (7'h43)), (^(8'hb1))}}), {(({(8'ha8)} ? (^(8'hbf)) : ((8'hae) ~^ (8'hbb))) ? (|((7'h43) ? (8'ha1) : (8'hb8))) : (!((7'h41) ? (8'ha4) : (8'hb0)))), {{(^~(7'h42)), ((8'hac) | (7'h42))}, (~&((8'hbe) | (8'ha3)))}}})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire178;
  wire [(4'h9):(1'h0)] wire177;
  wire [(5'h11):(1'h0)] wire175;
  wire [(4'he):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  assign y = {wire178,
                 wire177,
                 wire175,
                 wire9,
                 wire7,
                 wire6,
                 wire5,
                 reg8,
                 (1'h0)};
  assign wire5 = wire0;
  assign wire6 = ($unsigned($unsigned((!$unsigned(wire5)))) ?
                     wire0 : (~{{$unsigned(wire3), $signed(wire0)}}));
  assign wire7 = {wire5,
                     ((8'hb0) ?
                         (^wire6[(1'h1):(1'h0)]) : wire2[(1'h0):(1'h0)])};
  always
    @(posedge clk) begin
      reg8 <= $signed((wire0 != ($unsigned((~&wire5)) ^~ wire2)));
    end
  assign wire9 = (~(^wire6));
  module10 #() modinst176 (wire175, clk, wire7, wire0, wire3, wire5, reg8);
  assign wire177 = ({$unsigned(((8'hb4) ? (~wire7) : ((7'h43) | wire5))),
                           $unsigned($unsigned(wire9))} ?
                       ((wire1 & $signed($unsigned(wire9))) ^ ((wire2 * (-reg8)) ?
                           wire5 : wire2[(2'h3):(1'h0)])) : (-(~|wire4[(4'ha):(3'h4)])));
  assign wire178 = $signed(wire0);
endmodule

module module10
#(parameter param173 = (~^{(!(~&((8'ha2) ? (7'h40) : (8'haf))))}), 
parameter param174 = param173)
(y, clk, wire11, wire12, wire13, wire14, wire15);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire12;
  input wire signed [(4'hc):(1'h0)] wire13;
  input wire signed [(5'h13):(1'h0)] wire14;
  input wire signed [(4'hf):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire172;
  wire signed [(2'h3):(1'h0)] wire171;
  wire signed [(3'h7):(1'h0)] wire169;
  wire [(3'h5):(1'h0)] wire111;
  wire signed [(5'h14):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire113;
  wire signed [(4'ha):(1'h0)] wire128;
  assign y = {wire172,
                 wire171,
                 wire169,
                 wire111,
                 wire61,
                 wire16,
                 wire59,
                 wire113,
                 wire128,
                 (1'h0)};
  assign wire16 = (^$signed($signed({((8'haf) ? wire12 : wire15)})));
  module17 #() modinst60 (.wire22(wire11), .clk(clk), .wire19(wire16), .wire20(wire12), .wire21(wire13), .y(wire59), .wire18(wire15));
  assign wire61 = (!wire16[(4'hd):(4'hc)]);
  module62 #() modinst112 (wire111, clk, wire13, wire11, wire59, wire15, wire12);
  assign wire113 = $unsigned((wire11[(4'ha):(4'h8)] ?
                       ($signed(wire111) <= $unsigned(wire14)) : wire16));
  module114 #() modinst129 (.wire119(wire12), .wire115(wire13), .wire116(wire61), .y(wire128), .clk(clk), .wire118(wire14), .wire117(wire111));
  module130 #() modinst170 (.wire133(wire113), .wire134(wire59), .wire131(wire61), .wire132(wire11), .clk(clk), .y(wire169));
  assign wire171 = {((wire11[(3'h6):(1'h1)] >> {(wire61 ? wire15 : wire11),
                               (wire14 ? wire128 : wire169)}) ?
                           ((8'haa) < $unsigned((~^wire59))) : (~({(8'ha5),
                               wire61} ^~ $signed(wire111)))),
                       (+wire111[(1'h0):(1'h0)])};
  assign wire172 = $unsigned($signed({(wire11[(5'h10):(4'he)] > $unsigned((8'hb5)))}));
endmodule

module module130
#(parameter param168 = {((({(8'hab)} ? ((8'ha7) ? (8'hb5) : (8'ha3)) : {(8'ha2)}) ? (((7'h44) ? (8'h9d) : (7'h40)) ? ((7'h41) ? (8'hb0) : (8'hb7)) : ((8'hac) ? (8'had) : (8'hb7))) : (+((8'hac) ? (8'h9c) : (8'hbe)))) ? {((~&(8'hb3)) ^ ((8'hb7) < (8'ha9))), (((8'hb7) ? (8'hb9) : (8'hba)) ? (7'h42) : ((8'ha4) * (8'hbd)))} : {(~&((8'hbf) ? (8'haa) : (7'h44)))})})
(y, clk, wire134, wire133, wire132, wire131);
  output wire [(32'h180):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire134;
  input wire [(2'h3):(1'h0)] wire133;
  input wire signed [(5'h15):(1'h0)] wire132;
  input wire signed [(2'h3):(1'h0)] wire131;
  wire [(4'hb):(1'h0)] wire167;
  wire signed [(3'h6):(1'h0)] wire166;
  wire signed [(5'h10):(1'h0)] wire165;
  wire signed [(4'he):(1'h0)] wire164;
  wire signed [(4'h8):(1'h0)] wire163;
  wire [(3'h4):(1'h0)] wire162;
  wire signed [(4'h9):(1'h0)] wire161;
  wire signed [(4'ha):(1'h0)] wire160;
  wire [(5'h15):(1'h0)] wire159;
  wire signed [(3'h4):(1'h0)] wire158;
  wire signed [(4'ha):(1'h0)] wire155;
  wire [(5'h14):(1'h0)] wire154;
  wire signed [(4'hf):(1'h0)] wire153;
  wire [(4'he):(1'h0)] wire152;
  wire signed [(5'h14):(1'h0)] wire151;
  wire [(3'h5):(1'h0)] wire150;
  wire [(4'hc):(1'h0)] wire149;
  wire signed [(5'h14):(1'h0)] wire148;
  wire [(3'h6):(1'h0)] wire137;
  wire [(2'h3):(1'h0)] wire136;
  wire [(4'h8):(1'h0)] wire135;
  reg [(5'h11):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg156 = (1'h0);
  reg [(2'h2):(1'h0)] reg147 = (1'h0);
  reg [(5'h15):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg145 = (1'h0);
  reg [(5'h14):(1'h0)] reg144 = (1'h0);
  reg [(2'h3):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg142 = (1'h0);
  reg [(4'hb):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg140 = (1'h0);
  reg [(4'he):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg138 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire137,
                 wire136,
                 wire135,
                 reg157,
                 reg156,
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
                 (1'h0)};
  assign wire135 = (|($signed(wire131) ?
                       {wire131} : {($signed(wire131) ?
                               $signed(wire132) : (-wire131)),
                           {wire132[(5'h15):(3'h5)]}}));
  assign wire136 = wire133;
  assign wire137 = wire135;
  always
    @(posedge clk) begin
      if (wire132)
        begin
          reg138 <= wire134[(5'h12):(1'h0)];
          reg139 <= wire131[(1'h1):(1'h1)];
          reg140 <= $unsigned((wire134[(3'h5):(2'h3)] | {(^~$signed(wire135))}));
          if (reg140)
            begin
              reg141 <= reg140;
              reg142 <= $unsigned(($signed(wire135) != reg138[(3'h5):(2'h3)]));
              reg143 <= $unsigned(({((wire132 ? wire132 : reg140) ^ {wire134,
                          reg141})} ?
                  ($signed((wire131 || reg140)) < wire133[(1'h0):(1'h0)]) : $unsigned(wire136)));
              reg144 <= $signed(((^(~^$unsigned(wire131))) << reg143[(2'h2):(1'h0)]));
              reg145 <= $signed((8'hb7));
            end
          else
            begin
              reg141 <= $unsigned($signed(reg144));
              reg142 <= ($unsigned((((reg141 <<< (8'ha0)) ?
                  (~^reg141) : (wire133 != reg144)) | $unsigned((wire135 ^~ reg145)))) << $signed($unsigned((reg143 && wire137))));
              reg143 <= ($unsigned((&($signed(wire136) | {reg144, wire131}))) ?
                  wire135[(4'h8):(3'h7)] : ($unsigned($signed((~^(8'hb7)))) >>> (((^wire136) ?
                          {wire133} : reg144[(4'h8):(3'h6)]) ?
                      ((reg142 ? wire133 : wire135) ?
                          $unsigned(reg142) : $unsigned(wire133)) : wire137[(3'h4):(2'h2)])));
            end
          reg146 <= wire137[(2'h3):(1'h1)];
        end
      else
        begin
          reg138 <= ($unsigned($signed((reg144 ?
                  reg146[(5'h12):(1'h0)] : ((7'h44) <<< reg142)))) ?
              $unsigned({reg141[(2'h2):(1'h1)]}) : (($signed((wire134 ?
                      wire135 : reg146)) + wire133[(2'h3):(1'h1)]) ?
                  $unsigned((8'ha1)) : reg138[(4'hd):(4'hb)]));
        end
      reg147 <= reg143[(2'h3):(1'h1)];
    end
  assign wire148 = (reg139[(2'h3):(1'h0)] ?
                       $signed($signed((!$signed(wire137)))) : (8'hbb));
  assign wire149 = $unsigned($signed($unsigned({$unsigned((8'hb1))})));
  assign wire150 = {$signed((((reg141 == reg145) != (wire134 ?
                               wire149 : reg138)) ?
                           (wire136[(1'h1):(1'h0)] ?
                               reg140[(1'h0):(1'h0)] : (wire135 == reg141)) : wire132[(5'h15):(4'h9)]))};
  assign wire151 = (reg146[(4'hf):(3'h5)] ^~ (($unsigned($signed(reg145)) ?
                           reg139 : $unsigned($signed(wire132))) ?
                       (reg146 ?
                           (!(wire150 ? wire136 : wire131)) : ((wire148 ?
                                   (8'hb5) : wire137) ?
                               {reg138} : reg140[(2'h2):(1'h1)])) : {(reg146 ?
                               (~&reg139) : ((8'hbd) & wire131)),
                           wire137}));
  assign wire152 = ((|wire148[(4'h8):(3'h5)]) + ($signed(($unsigned(wire149) ?
                           (reg138 ?
                               (8'ha2) : wire151) : reg142[(3'h4):(2'h3)])) ?
                       $signed(($signed(wire148) ?
                           $unsigned(wire135) : $unsigned(reg138))) : reg139));
  assign wire153 = reg147[(1'h0):(1'h0)];
  assign wire154 = ((reg138[(3'h4):(2'h3)] >> {$unsigned({(8'hab)}),
                       wire150[(1'h1):(1'h1)]}) >>> wire135);
  assign wire155 = wire154[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg156 <= $unsigned(wire150[(2'h2):(1'h1)]);
      reg157 <= $unsigned((|$unsigned($signed(wire155[(3'h7):(3'h4)]))));
    end
  assign wire158 = (($unsigned((|$signed((8'ha1)))) ?
                           ($unsigned((reg146 <<< reg138)) ?
                               $unsigned({wire133,
                                   wire150}) : (~&$unsigned(reg146))) : (~|($unsigned(wire132) ?
                               $unsigned(wire154) : reg157[(1'h0):(1'h0)]))) ?
                       ({$signed(((8'hab) ? wire155 : wire150))} >= ({{(8'hbf)},
                           wire150[(2'h3):(1'h1)]} == reg146[(5'h10):(2'h3)])) : wire132[(4'hf):(4'hf)]);
  assign wire159 = (((wire134 ?
                               ({reg146, wire133} ?
                                   $unsigned(wire150) : wire133) : ($signed((8'h9d)) && $unsigned(reg157))) ?
                           (^{{(8'ha3), reg146},
                               (&wire158)}) : ({$signed(wire133),
                               (reg138 ?
                                   reg139 : (8'h9c))} <<< $unsigned(wire137[(3'h5):(2'h3)]))) ?
                       $unsigned(wire152) : (reg138[(4'hd):(4'ha)] > (($signed((8'ha1)) ?
                           (reg140 ?
                               reg142 : reg143) : (wire152 + (7'h43))) ^~ wire148[(3'h5):(3'h4)])));
  assign wire160 = $unsigned(reg147);
  assign wire161 = $signed({{$signed({(8'hbd), wire131})},
                       $unsigned((&wire131[(2'h2):(1'h0)]))});
  assign wire162 = ($unsigned({((^~reg147) ^~ reg139),
                       (^(wire154 && (8'hbd)))}) >> (reg157[(4'hd):(3'h7)] ?
                       (((+wire151) ?
                           (reg140 >> (8'had)) : reg142[(3'h5):(1'h1)]) - $unsigned($unsigned((8'haa)))) : (8'hb7)));
  assign wire163 = {wire160[(2'h3):(2'h2)], (8'h9c)};
  assign wire164 = (^wire158);
  assign wire165 = $unsigned((+$unsigned(((reg156 ?
                       wire159 : wire135) || $signed(wire151)))));
  assign wire166 = ((~^wire132[(3'h4):(1'h1)]) ?
                       (+{$unsigned((wire151 >> reg142))}) : (wire152 ?
                           (~&(8'hab)) : $unsigned(wire155[(1'h0):(1'h0)])));
  assign wire167 = $signed($signed(((^~$unsigned((8'hb4))) > wire159[(1'h0):(1'h0)])));
endmodule

module module114  (y, clk, wire119, wire118, wire117, wire116, wire115);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire119;
  input wire signed [(4'hb):(1'h0)] wire118;
  input wire signed [(2'h3):(1'h0)] wire117;
  input wire [(2'h3):(1'h0)] wire116;
  input wire signed [(4'h8):(1'h0)] wire115;
  wire signed [(5'h15):(1'h0)] wire127;
  wire [(3'h6):(1'h0)] wire126;
  wire [(5'h13):(1'h0)] wire125;
  wire [(4'h9):(1'h0)] wire124;
  wire [(3'h4):(1'h0)] wire123;
  wire [(5'h10):(1'h0)] wire122;
  wire [(3'h7):(1'h0)] wire121;
  wire signed [(4'hc):(1'h0)] wire120;
  assign y = {wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 (1'h0)};
  assign wire120 = (8'ha7);
  assign wire121 = wire117[(1'h0):(1'h0)];
  assign wire122 = ((wire115[(1'h0):(1'h0)] - ({wire117[(2'h2):(1'h0)],
                       (~|wire116)} >= ((+wire117) ?
                       wire117[(1'h0):(1'h0)] : $signed(wire121)))) ~^ (^~(wire120 <<< wire121[(2'h3):(1'h0)])));
  assign wire123 = ({(&{$unsigned(wire122), $signed(wire120)}), wire117} ?
                       $signed({$unsigned(wire117[(2'h3):(2'h2)])}) : (wire117 ?
                           $signed($unsigned({wire121,
                               wire116})) : $unsigned($signed(((8'h9e) >>> wire115)))));
  assign wire124 = wire122;
  assign wire125 = (+({(~|$unsigned(wire121)), {wire124}} ?
                       ($unsigned(wire124[(3'h5):(2'h3)]) ?
                           ((^~(8'ha7)) <= (^~wire119)) : wire116) : wire119));
  assign wire126 = $unsigned($unsigned($signed((wire121 || (8'hb7)))));
  assign wire127 = $unsigned(({(~|wire117)} ?
                       $signed((|$signed(wire124))) : ({wire123} || ((wire125 != wire120) == $signed(wire126)))));
endmodule

module module62  (y, clk, wire67, wire66, wire65, wire64, wire63);
  output wire [(32'h1ce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire67;
  input wire signed [(4'ha):(1'h0)] wire66;
  input wire [(5'h12):(1'h0)] wire65;
  input wire signed [(4'h9):(1'h0)] wire64;
  input wire signed [(5'h11):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire110;
  wire [(4'hc):(1'h0)] wire105;
  wire [(4'ha):(1'h0)] wire104;
  wire [(5'h11):(1'h0)] wire103;
  wire signed [(4'hc):(1'h0)] wire102;
  wire [(4'h8):(1'h0)] wire85;
  wire [(4'hd):(1'h0)] wire84;
  wire signed [(3'h5):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire82;
  wire [(4'h9):(1'h0)] wire81;
  wire signed [(5'h13):(1'h0)] wire80;
  wire signed [(4'hc):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire70;
  wire signed [(5'h11):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire68;
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg106 = (1'h0);
  reg [(3'h6):(1'h0)] reg101 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  reg [(4'ha):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  reg [(3'h6):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg [(4'h8):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  assign y = {wire110,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
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
                 reg86,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 (1'h0)};
  assign wire68 = (((~|(~&(!wire64))) ?
                      wire65 : $unsigned((|$unsigned(wire67)))) == wire66[(3'h6):(3'h5)]);
  assign wire69 = (^~$unsigned(wire63[(4'ha):(1'h1)]));
  assign wire70 = ($signed((((wire68 * wire66) ~^ (wire64 ? wire64 : wire69)) ?
                      (~&{(8'ha6),
                          (8'haf)}) : ($signed(wire63) == $signed(wire63)))) == (~|{$unsigned(wire68[(3'h5):(1'h0)])}));
  assign wire71 = wire65;
  assign wire72 = wire63[(4'hd):(2'h3)];
  always
    @(posedge clk) begin
      if ($unsigned(({(|(wire72 ? (8'haa) : (8'had)))} - (wire72 ?
          $unsigned($unsigned(wire65)) : wire67[(3'h4):(2'h2)]))))
        begin
          if ((($signed(({wire67} == {(8'ha1), wire68})) ?
              wire67[(2'h2):(2'h2)] : $unsigned(wire69)) >= {$signed({wire71,
                  (^~wire67)})}))
            begin
              reg73 <= (wire72[(4'hc):(4'hc)] <<< ((~|wire70[(3'h6):(1'h0)]) - (7'h41)));
              reg74 <= $signed(({{(wire63 && wire70), wire72[(3'h6):(1'h1)]},
                  {$signed(wire66),
                      (wire71 ? wire67 : wire66)}} || reg73[(3'h5):(3'h5)]));
            end
          else
            begin
              reg73 <= wire65;
            end
          if ($signed(reg74[(3'h5):(1'h1)]))
            begin
              reg75 <= $unsigned(((((!wire64) << {wire63, wire69}) ?
                  ((wire64 ? wire72 : wire71) ?
                      ((8'hb3) ? wire63 : (8'ha3)) : (wire71 ?
                          (8'ha2) : (8'ha8))) : $signed(wire69)) < ($signed((wire66 ?
                      wire69 : (8'ha2))) ?
                  (-reg74[(4'h8):(2'h3)]) : (~|{wire66, reg73}))));
            end
          else
            begin
              reg75 <= $signed(wire67[(3'h4):(1'h0)]);
              reg76 <= (($signed((wire67 ?
                      $unsigned(wire72) : $unsigned((8'ha4)))) && $signed($unsigned(wire69[(4'hd):(1'h0)]))) ?
                  wire71[(4'hb):(4'h8)] : $signed((|{wire69})));
              reg77 <= $signed(reg76);
              reg78 <= $unsigned($unsigned($signed({wire69[(3'h4):(2'h2)],
                  (^(8'hae))})));
              reg79 <= ({$signed({$signed(reg73)})} * wire67);
            end
        end
      else
        begin
          reg73 <= $signed($signed(($signed((^wire63)) >> $unsigned($unsigned((8'hb1))))));
          if ((wire65[(4'hb):(4'h8)] ?
              (({(~|wire64), wire71} >>> reg79) ^~ (($signed(reg78) ?
                  reg74 : (wire67 ?
                      (8'hb4) : wire71)) ^~ (8'hb8))) : wire72[(3'h7):(3'h5)]))
            begin
              reg74 <= wire69[(4'hc):(1'h1)];
              reg75 <= (reg73[(3'h5):(3'h4)] ? (~$signed(reg77)) : reg73);
              reg76 <= $unsigned({{$unsigned($signed(wire65)),
                      $unsigned(reg75[(2'h3):(2'h3)])},
                  $signed((&wire64))});
              reg77 <= wire67;
              reg78 <= (({(wire64 ?
                      (reg75 > wire65) : (^wire67))} * (7'h40)) | $unsigned(wire67));
            end
          else
            begin
              reg74 <= (wire72[(4'hb):(4'ha)] << ($signed($unsigned((+reg74))) ?
                  (+((reg76 & wire67) ?
                      $unsigned(wire64) : reg73[(3'h5):(2'h2)])) : (^~((reg73 >>> wire67) ?
                      (~|reg74) : (wire72 < reg73)))));
              reg75 <= (wire64[(3'h7):(3'h6)] ?
                  $unsigned((!(-$signed(wire63)))) : {wire71,
                      (^({wire66} < reg74[(4'h9):(3'h7)]))});
              reg76 <= {($signed($signed({(8'hab)})) ?
                      $signed(($unsigned(reg73) - $signed(reg77))) : $signed(($signed(reg77) ?
                          (~|reg78) : $unsigned(wire69)))),
                  (reg77 ?
                      ($signed((wire64 >= reg78)) ?
                          $signed(wire72[(3'h4):(2'h2)]) : $unsigned($signed(wire68))) : (wire69 - wire63[(4'ha):(3'h7)]))};
              reg77 <= $signed((reg74[(4'h9):(4'h9)] ?
                  (!{(wire64 > reg75)}) : $signed(wire71)));
            end
        end
    end
  assign wire80 = wire65[(3'h7):(3'h4)];
  assign wire81 = wire70[(4'ha):(3'h7)];
  assign wire82 = {(~^{$unsigned($signed(reg75)), (+(~^wire70))}),
                      $signed(wire81)};
  assign wire83 = $unsigned({(wire65 ?
                          {$unsigned(wire64), $unsigned((8'hb3))} : {reg74}),
                      $signed($unsigned((reg78 ? wire71 : wire81)))});
  assign wire84 = $signed(wire67);
  assign wire85 = $unsigned($unsigned(reg79[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if ((|$signed((({wire66, wire69} ?
              ((8'hb7) - reg76) : ((8'hb6) - (8'ha4))) ?
          $unsigned($signed(wire69)) : reg73[(1'h0):(1'h0)]))))
        begin
          reg86 <= (8'ha8);
          reg87 <= {$signed(($unsigned((reg86 ? reg79 : wire85)) >= wire64))};
          reg88 <= (((reg79[(3'h4):(1'h0)] > reg78) | $unsigned({$signed(wire67)})) ?
              {wire70,
                  $unsigned((~^(wire82 >= reg77)))} : ($signed($unsigned((~&reg87))) <= $unsigned(reg77)));
          reg89 <= wire72;
          reg90 <= $signed(reg73);
        end
      else
        begin
          reg86 <= $unsigned((reg73[(1'h1):(1'h0)] ?
              wire64 : ((^~(wire80 < wire63)) ?
                  $unsigned((~|wire81)) : wire64)));
        end
      reg91 <= ((+wire83) ?
          ($unsigned(($signed(reg75) | (reg77 ?
              wire66 : reg86))) ^~ ({((8'ha3) <<< reg76),
              reg89[(4'hc):(3'h7)]} ^~ (+(8'hbc)))) : $signed((~&$signed($signed(wire83)))));
      reg92 <= $unsigned($unsigned((wire81 | reg75)));
      if ($signed(((&(-$unsigned(wire66))) ?
          $signed({(wire68 ? wire67 : reg91),
              (wire68 ? wire64 : reg90)}) : (8'ha5))))
        begin
          reg93 <= wire69[(3'h4):(2'h2)];
          reg94 <= wire63;
          reg95 <= (|($signed(reg73[(2'h3):(1'h1)]) | $signed($signed(reg77))));
          reg96 <= reg79[(2'h3):(2'h2)];
          if ((8'ha5))
            begin
              reg97 <= $signed({($unsigned(reg88[(1'h0):(1'h0)]) + reg87[(3'h6):(3'h6)]),
                  $unsigned($unsigned(reg89))});
              reg98 <= $unsigned(((wire68 != wire81) || {((^reg74) & reg91)}));
              reg99 <= reg93;
              reg100 <= wire63[(4'hd):(3'h4)];
              reg101 <= ($signed((^wire81[(2'h3):(1'h1)])) ?
                  $signed($signed($signed((reg94 ^ (7'h42))))) : {$unsigned(wire81[(2'h2):(1'h1)])});
            end
          else
            begin
              reg97 <= (^(reg74[(1'h0):(1'h0)] ?
                  $unsigned(reg75) : $signed((+reg95))));
              reg98 <= wire65;
              reg99 <= $signed((((~|reg87[(1'h0):(1'h0)]) ?
                      {reg97[(1'h1):(1'h1)], $unsigned(reg87)} : ((wire66 ?
                              wire69 : reg98) ?
                          $signed(wire83) : (~^reg75))) ?
                  $unsigned($unsigned($signed(reg91))) : {wire68, reg96}));
            end
        end
      else
        begin
          reg93 <= wire82[(4'ha):(2'h2)];
          reg94 <= ($signed((&($unsigned((8'h9f)) >> (wire71 * wire82)))) != wire83[(3'h4):(2'h3)]);
        end
    end
  assign wire102 = wire81;
  assign wire103 = (wire82 | ((&{$signed(wire67), (8'hae)}) >> {{(~&reg87)}}));
  assign wire104 = ((reg89[(2'h2):(1'h1)] ?
                       $unsigned($signed((^(8'ha1)))) : $signed($signed(reg91))) - $signed(wire71));
  assign wire105 = {{wire69}, (^reg90[(3'h4):(1'h0)])};
  always
    @(posedge clk) begin
      reg106 <= $unsigned($unsigned((^(reg96[(2'h2):(1'h1)] ?
          wire104 : $signed(reg95)))));
      reg107 <= (wire63 > $signed((|reg89)));
      reg108 <= (wire102[(3'h4):(1'h0)] | (((reg78[(3'h4):(1'h0)] + (8'hb0)) ?
              wire65 : wire63[(4'he):(4'h9)]) ?
          (((wire70 ? reg92 : wire83) || (reg90 ?
              reg75 : wire81)) < ($unsigned(wire71) ?
              (wire66 <= reg76) : $signed((8'hb5)))) : wire102[(4'ha):(3'h6)]));
      reg109 <= $signed(($signed({$unsigned(wire65)}) ?
          {$signed(wire71),
              (reg77[(2'h3):(1'h0)] ?
                  $signed(wire66) : reg94[(1'h1):(1'h1)])} : $unsigned($signed($signed((8'had))))));
    end
  assign wire110 = ($signed(reg92) > reg74);
endmodule

module module17
#(parameter param58 = (|((^~(^~((8'hba) ? (7'h40) : (8'hab)))) | ((8'h9d) && ((&(8'hae)) ? ((8'ha1) >= (8'hb9)) : (8'hb3))))))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h194):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire22;
  input wire signed [(2'h2):(1'h0)] wire21;
  input wire [(2'h3):(1'h0)] wire20;
  input wire signed [(2'h2):(1'h0)] wire19;
  input wire signed [(3'h6):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire55;
  wire signed [(4'h8):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire50;
  wire [(4'h9):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire48;
  wire signed [(3'h4):(1'h0)] wire47;
  wire [(3'h4):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire45;
  wire [(4'hd):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire36;
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire38,
                 wire37,
                 wire36,
                 reg52,
                 reg51,
                 reg41,
                 reg40,
                 reg39,
                 reg35,
                 reg34,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg23 <= (($signed($unsigned($unsigned(wire22))) * wire21) << wire21);
      if (wire18[(1'h1):(1'h1)])
        begin
          reg24 <= reg23;
        end
      else
        begin
          if ($signed(((|{$signed(wire18), wire22[(1'h0):(1'h0)]}) ?
              $signed(wire20[(1'h0):(1'h0)]) : $unsigned(wire19[(1'h1):(1'h0)]))))
            begin
              reg24 <= (~|wire19);
              reg25 <= {wire20[(2'h2):(1'h0)],
                  (~&$unsigned(((wire18 ? wire19 : wire20) ^~ reg23)))};
            end
          else
            begin
              reg24 <= ({$signed(wire22[(4'h8):(1'h0)])} ?
                  (wire19[(1'h1):(1'h0)] ?
                      ((~&wire22[(3'h6):(3'h5)]) ?
                          (|wire21) : reg25) : (^~((reg25 ?
                          wire22 : wire20) >= (wire19 && reg24)))) : ($signed(reg24) ^ (^~((8'ha4) ~^ (wire18 ?
                      wire18 : reg25)))));
              reg25 <= (wire20[(2'h2):(2'h2)] ?
                  (wire21[(2'h2):(2'h2)] ?
                      $unsigned($signed((reg23 ?
                          reg25 : (8'hbd)))) : wire19[(1'h1):(1'h1)]) : reg24);
              reg26 <= {$unsigned(wire22[(3'h6):(3'h6)])};
              reg27 <= (wire22[(4'h8):(2'h2)] <<< $unsigned(($unsigned((reg26 ?
                      wire21 : reg24)) ?
                  {(reg24 ? wire19 : reg24),
                      wire22} : (+wire19[(2'h2):(1'h1)]))));
              reg28 <= (8'hb2);
            end
          reg29 <= ({($unsigned($signed(reg24)) ? wire22 : reg23)} ?
              $signed($signed((reg25 ?
                  (wire22 ?
                      reg28 : wire22) : wire21[(1'h0):(1'h0)]))) : wire21);
          reg30 <= ({(~|($signed(reg29) ^ (reg28 ?
                  reg24 : wire21)))} < (-wire19));
          if (reg23[(3'h6):(1'h0)])
            begin
              reg31 <= (7'h41);
              reg32 <= wire20[(2'h2):(1'h1)];
              reg33 <= reg30;
              reg34 <= ((reg23 ?
                      (((reg23 ?
                          reg32 : reg29) >= ((7'h40) > wire22)) && ($signed(reg33) ?
                          reg26[(1'h0):(1'h0)] : (reg28 ?
                              wire19 : wire20))) : $unsigned(($unsigned((8'hac)) ?
                          (~wire19) : reg28[(4'h8):(3'h5)]))) ?
                  $signed((~&{$signed(wire20)})) : (^~{wire21,
                      (&$signed(reg26))}));
              reg35 <= $unsigned(reg34);
            end
          else
            begin
              reg31 <= ((~^$unsigned(reg25[(1'h1):(1'h1)])) & (reg25 ?
                  (8'hb6) : {(wire19 * (wire19 ? reg34 : reg29)),
                      ($signed(reg34) ? {wire18, wire20} : (!reg27))}));
              reg32 <= wire18;
              reg33 <= wire18;
              reg34 <= reg34[(4'hb):(4'hb)];
              reg35 <= reg27;
            end
        end
    end
  assign wire36 = reg29;
  assign wire37 = wire20[(1'h1):(1'h1)];
  assign wire38 = reg28[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg39 <= $signed($unsigned((wire20[(1'h1):(1'h1)] <= $unsigned({wire22}))));
      reg40 <= ($unsigned((((reg34 != (8'hab)) ?
                  ((8'ha2) + reg35) : (reg26 ? reg23 : (8'hbf))) ?
              ((wire22 ? wire18 : reg27) ~^ {reg27,
                  (8'hba)}) : (reg23 <= (reg35 && wire22)))) ?
          ((7'h43) ?
              reg32[(2'h3):(1'h1)] : $unsigned({$signed(reg25),
                  reg28})) : (reg29 ?
              wire21 : $unsigned($signed(wire37[(4'h8):(3'h7)]))));
      reg41 <= reg28[(2'h2):(1'h0)];
    end
  assign wire42 = (^~($signed($unsigned({(8'haa),
                      wire20})) >>> (+$signed(reg24))));
  assign wire43 = $signed(reg33);
  assign wire44 = reg29[(1'h0):(1'h0)];
  assign wire45 = (^~$unsigned(wire36));
  assign wire46 = reg31[(3'h5):(1'h1)];
  assign wire47 = reg39;
  assign wire48 = (reg40[(2'h3):(1'h0)] - {($signed(reg28) <<< {$unsigned(wire47),
                          reg32[(1'h0):(1'h0)]}),
                      $signed($signed(wire37))});
  assign wire49 = $unsigned((reg33[(3'h5):(1'h1)] >= reg28[(3'h6):(1'h1)]));
  assign wire50 = (8'haa);
  always
    @(posedge clk) begin
      reg51 <= $unsigned($signed(wire42));
      reg52 <= ((!(wire22 || {reg35[(4'he):(4'ha)], wire50})) ?
          {$unsigned((8'hb7))} : (-$unsigned((!wire50[(4'hd):(3'h5)]))));
    end
  assign wire53 = reg32[(3'h5):(1'h0)];
  assign wire54 = $signed((^(($unsigned(reg26) + wire47[(2'h2):(1'h1)]) >> {reg33})));
  assign wire55 = $signed(($unsigned({(&wire21),
                      reg27[(4'hc):(4'hc)]}) ~^ ({$unsigned(wire48)} ?
                      $signed((reg39 ^ reg41)) : (8'had))));
  assign wire56 = (+$unsigned(wire20));
  assign wire57 = reg29[(1'h0):(1'h0)];
endmodule
