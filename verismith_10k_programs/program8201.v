module top #(parameter param170 = (8'hbf)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire169;
  wire [(3'h7):(1'h0)] wire168;
  wire [(5'h14):(1'h0)] wire167;
  wire [(3'h7):(1'h0)] wire165;
  wire [(2'h2):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  assign y = {wire169, wire168, wire167, wire165, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (wire2 ? wire2[(3'h7):(3'h5)] : $signed(wire3));
  assign wire5 = wire2[(4'hb):(1'h0)];
  assign wire6 = wire1[(1'h0):(1'h0)];
  module7 #() modinst166 (.wire9(wire1), .wire8(wire5), .wire10(wire0), .clk(clk), .wire11(wire3), .y(wire165));
  assign wire167 = wire6[(1'h0):(1'h0)];
  assign wire168 = {$signed((wire1[(3'h5):(1'h1)] ?
                           wire5 : ($signed(wire3) ?
                               $signed(wire165) : $unsigned((8'ha7))))),
                       wire167};
  assign wire169 = {wire1[(1'h0):(1'h0)]};
endmodule

module module7  (y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire8;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire164;
  wire signed [(4'he):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire55;
  wire signed [(4'he):(1'h0)] wire56;
  wire [(5'h15):(1'h0)] wire57;
  wire signed [(4'ha):(1'h0)] wire109;
  wire [(4'hd):(1'h0)] wire111;
  wire signed [(3'h4):(1'h0)] wire112;
  wire signed [(5'h14):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire114;
  wire [(5'h15):(1'h0)] wire115;
  wire [(3'h7):(1'h0)] wire116;
  wire signed [(5'h10):(1'h0)] wire117;
  wire [(5'h11):(1'h0)] wire138;
  wire [(4'hb):(1'h0)] wire162;
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  assign y = {wire164,
                 wire50,
                 wire52,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire109,
                 wire111,
                 wire112,
                 wire113,
                 wire114,
                 wire115,
                 wire116,
                 wire117,
                 wire138,
                 wire162,
                 reg53,
                 (1'h0)};
  module12 #() modinst51 (.wire13(wire8), .wire16(wire9), .clk(clk), .y(wire50), .wire14(wire11), .wire15(wire10));
  assign wire52 = ($signed($signed((wire10 >> $unsigned(wire11)))) ?
                      wire9[(3'h5):(1'h1)] : (|$unsigned(wire11[(4'ha):(1'h0)])));
  always
    @(posedge clk) begin
      reg53 <= $signed((wire8 ?
          $signed(((wire8 ? wire50 : wire8) ?
              (|wire9) : (8'hb1))) : ($unsigned($signed((8'h9c))) ?
              (wire52 ? wire11 : (!wire8)) : $unsigned({wire11, wire9}))));
    end
  assign wire54 = (wire9[(4'hc):(4'h9)] <<< ((8'h9d) || {{(-(8'h9c)), {wire50}},
                      wire8[(3'h7):(1'h0)]}));
  assign wire55 = $unsigned(((((~^(8'hb7)) > $unsigned(wire8)) ?
                          (~^reg53[(4'ha):(1'h1)]) : wire8[(1'h0):(1'h0)]) ?
                      wire54[(4'h9):(2'h2)] : (+($signed((8'ha8)) ~^ {wire10}))));
  assign wire56 = $unsigned(wire54[(3'h6):(1'h1)]);
  assign wire57 = $unsigned($signed(wire9));
  module58 #() modinst110 (wire109, clk, wire54, wire55, wire11, wire57);
  assign wire111 = wire55[(1'h1):(1'h0)];
  assign wire112 = {wire50[(4'h8):(3'h7)]};
  assign wire113 = (wire56[(4'ha):(3'h6)] ?
                       $unsigned((8'hbb)) : $unsigned((wire111[(1'h1):(1'h1)] ?
                           $signed($signed(wire56)) : $signed((~^wire55)))));
  assign wire114 = ({((((8'h9f) | (8'h9e)) ?
                           $unsigned(wire54) : wire57) ^ {{wire112, wire112},
                           $unsigned(wire8)}),
                       $signed(($unsigned(wire52) != (wire50 ?
                           wire54 : wire52)))} ^ ($signed(((wire8 ?
                           wire55 : wire8) ?
                       wire8 : wire10[(3'h6):(3'h4)])) || $signed(wire113)));
  assign wire115 = (((!(wire52 ^~ $unsigned(wire111))) ?
                           wire111 : $unsigned((&$signed((8'ha2))))) ?
                       ({((wire52 ? (8'ha0) : wire50) ?
                                   (wire109 ?
                                       (8'hb3) : wire112) : ((8'h9f) < (8'hba))),
                               (~^(wire57 ? wire52 : (8'ha4)))} ?
                           wire57[(4'hc):(4'hb)] : $unsigned((~|(wire113 | wire9)))) : (((&{wire54}) ?
                               ((+wire113) <<< $unsigned(wire111)) : $unsigned((reg53 >= (7'h42)))) ?
                           reg53[(1'h0):(1'h0)] : wire10));
  assign wire116 = (wire56 ? $unsigned($signed(wire50)) : wire112);
  assign wire117 = (-$signed(($signed({wire115, reg53}) ?
                       ((wire52 >>> wire52) ?
                           (~&wire113) : ((8'hb4) ?
                               wire116 : wire50)) : (wire113 >= (~^(8'hb4))))));
  module118 #() modinst139 (.wire120(wire50), .clk(clk), .y(wire138), .wire123(reg53), .wire122(wire57), .wire119(wire54), .wire121(wire109));
  module140 #() modinst163 (.wire141(wire56), .wire142(wire138), .wire144(wire115), .wire145(wire113), .wire143(wire111), .y(wire162), .clk(clk));
  assign wire164 = wire114[(3'h5):(3'h5)];
endmodule

module module140
#(parameter param161 = (((8'ha9) ^ (((^~(8'hb9)) < ((8'hbe) ? (8'hbe) : (8'ha5))) ? (8'hbe) : (^~(&(8'ha4))))) & ((-(((8'ha7) + (7'h40)) ? ((8'hb5) ? (8'haa) : (8'hbf)) : ((8'hb3) ? (7'h44) : (8'hbf)))) >> ((((8'h9c) <<< (7'h40)) ? (8'h9c) : (&(8'hae))) != {((8'hb0) ? (8'ha0) : (8'h9c))}))))
(y, clk, wire145, wire144, wire143, wire142, wire141);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire145;
  input wire signed [(5'h15):(1'h0)] wire144;
  input wire [(4'hb):(1'h0)] wire143;
  input wire [(4'h9):(1'h0)] wire142;
  input wire signed [(4'he):(1'h0)] wire141;
  wire signed [(4'he):(1'h0)] wire160;
  wire [(3'h7):(1'h0)] wire159;
  wire [(4'h9):(1'h0)] wire158;
  wire signed [(4'h8):(1'h0)] wire157;
  wire [(5'h14):(1'h0)] wire156;
  wire signed [(3'h5):(1'h0)] wire155;
  wire [(3'h5):(1'h0)] wire154;
  wire [(4'hf):(1'h0)] wire152;
  wire [(3'h5):(1'h0)] wire151;
  wire [(3'h4):(1'h0)] wire150;
  wire [(4'hf):(1'h0)] wire149;
  wire signed [(4'ha):(1'h0)] wire148;
  wire [(3'h7):(1'h0)] wire147;
  wire [(3'h5):(1'h0)] wire146;
  reg signed [(4'hc):(1'h0)] reg153 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 reg153,
                 (1'h0)};
  assign wire146 = (8'hbd);
  assign wire147 = $signed(((~|{(wire144 + wire146),
                       {(8'hbb)}}) != (wire141 | $unsigned($unsigned(wire144)))));
  assign wire148 = wire145[(2'h3):(1'h0)];
  assign wire149 = $signed({wire146[(1'h0):(1'h0)],
                       {((wire141 <<< wire147) || $unsigned((7'h43))),
                           $signed(wire145[(2'h3):(2'h3)])}});
  assign wire150 = wire143[(3'h6):(3'h4)];
  assign wire151 = $unsigned((8'h9d));
  assign wire152 = wire151[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg153 <= {{(wire145[(2'h3):(2'h2)] && wire142[(2'h2):(1'h1)])},
          $signed((+wire152[(4'hd):(4'hc)]))};
    end
  assign wire154 = ($signed($unsigned((+(wire145 <= wire147)))) ^~ reg153[(4'ha):(3'h6)]);
  assign wire155 = $unsigned($unsigned(({{wire145, wire142}} ?
                       wire148 : wire145[(4'he):(4'hc)])));
  assign wire156 = wire141[(4'he):(4'hb)];
  assign wire157 = $unsigned($signed({(-(wire151 ? wire154 : wire148))}));
  assign wire158 = $unsigned($unsigned((((reg153 >= wire145) || $unsigned(reg153)) ?
                       wire148[(3'h5):(2'h2)] : $unsigned(wire148[(3'h5):(3'h5)]))));
  assign wire159 = ($unsigned(wire143) * $unsigned($signed($unsigned((wire149 - wire154)))));
  assign wire160 = $signed(wire144[(4'hf):(2'h3)]);
endmodule

module module118
#(parameter param137 = ({((((8'hb7) || (8'h9f)) <<< (|(8'hbc))) ^ ((~&(8'hb2)) ? {(8'hbf)} : ((8'hbb) ? (8'hbd) : (8'hae))))} == (~|(({(8'ha9)} > ((8'hb7) ? (8'hac) : (8'haf))) | (&(^(8'ha3)))))))
(y, clk, wire123, wire122, wire121, wire120, wire119);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire123;
  input wire signed [(5'h15):(1'h0)] wire122;
  input wire [(3'h7):(1'h0)] wire121;
  input wire signed [(4'h9):(1'h0)] wire120;
  input wire [(4'hf):(1'h0)] wire119;
  wire [(4'h9):(1'h0)] wire131;
  wire signed [(3'h6):(1'h0)] wire130;
  wire signed [(3'h5):(1'h0)] wire129;
  wire signed [(5'h10):(1'h0)] wire128;
  wire [(4'hc):(1'h0)] wire127;
  wire [(5'h13):(1'h0)] wire126;
  wire [(5'h10):(1'h0)] wire125;
  wire [(4'hc):(1'h0)] wire124;
  reg [(5'h14):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg135 = (1'h0);
  reg [(5'h10):(1'h0)] reg134 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg133 = (1'h0);
  reg [(5'h12):(1'h0)] reg132 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 (1'h0)};
  assign wire124 = $unsigned((!$signed(($unsigned(wire121) && $unsigned(wire121)))));
  assign wire125 = wire123;
  assign wire126 = wire123[(2'h2):(1'h0)];
  assign wire127 = $signed((wire124[(1'h1):(1'h1)] ?
                       (wire124[(1'h0):(1'h0)] >= {$signed(wire121),
                           (wire125 ?
                               wire120 : wire122)}) : wire123[(1'h0):(1'h0)]));
  assign wire128 = $signed((+(wire122 <<< $signed($unsigned((8'hb7))))));
  assign wire129 = $unsigned($signed((~|(+(wire127 == wire126)))));
  assign wire130 = (((((wire120 ^~ wire124) * (|wire120)) ?
                               wire125[(3'h5):(2'h3)] : ((wire123 > wire124) ?
                                   $signed((8'hbe)) : $signed((8'hab)))) ?
                           ($unsigned(wire123) ?
                               ($signed(wire124) > wire126[(3'h4):(2'h3)]) : ({wire129,
                                       wire119} ?
                                   $unsigned(wire125) : wire120)) : ({wire122,
                               (~^wire121)} & ((wire126 ?
                               wire121 : wire129) >> (^~wire122)))) ?
                       wire119[(4'h8):(2'h3)] : wire122[(4'h9):(2'h2)]);
  assign wire131 = (wire124[(3'h5):(1'h0)] ?
                       (~wire119) : ($unsigned($signed((wire121 < wire123))) ?
                           $signed((^(~&wire119))) : wire124));
  always
    @(posedge clk) begin
      if (wire120[(3'h4):(2'h2)])
        begin
          reg132 <= $signed((($unsigned((~^(8'h9d))) & ((wire123 ^~ wire122) && $signed(wire130))) | wire128));
          reg133 <= $signed(wire120);
        end
      else
        begin
          reg132 <= (~$unsigned({$unsigned($unsigned((7'h40))),
              $signed((-wire122))}));
          reg133 <= wire120[(3'h6):(3'h5)];
        end
      reg134 <= wire129[(2'h3):(2'h2)];
      reg135 <= ((((wire128 != (~|(7'h43))) ?
                  ($signed(wire126) ? reg132 : wire129) : $signed(((8'ha3) ?
                      wire123 : wire129))) ?
              reg134[(2'h2):(2'h2)] : (wire123[(4'h9):(1'h1)] <= ((~|wire124) ?
                  wire121 : {wire127, wire130}))) ?
          (~|(|($signed(wire120) ?
              wire122[(5'h11):(5'h11)] : $unsigned(wire127)))) : ($unsigned(((wire122 ~^ wire129) ?
              (wire128 << wire131) : (^~wire124))) * $signed($unsigned(reg134[(5'h10):(2'h3)]))));
      reg136 <= $signed((wire124[(1'h1):(1'h1)] ?
          ($unsigned($unsigned(reg135)) == (~|(reg135 != wire131))) : $signed($signed((~(7'h43))))));
    end
endmodule

module module58
#(parameter param107 = (-((8'ha1) ~^ (((&(8'h9d)) ? {(8'hbf), (8'ha4)} : ((8'ha3) << (8'hb0))) ? ((|(8'hba)) ? ((8'hbe) ? (8'ha5) : (8'hab)) : ((8'hb3) << (8'ha3))) : (((8'hb9) ? (8'ha2) : (8'hae)) * ((8'hbe) ? (8'hbb) : (7'h43)))))), 
parameter param108 = ({{(((8'ha6) * param107) & (param107 == param107))}, (((|param107) ? {param107} : {param107, param107}) ? {(^~param107), (^(8'ha0))} : ((param107 ? (8'ha5) : param107) ^~ param107))} ? {(8'hba), ({((8'hb3) || param107), (&(8'hab))} ? (&param107) : {param107, (param107 ^~ param107)})} : (param107 ? {(~&{param107, param107})} : ((^(param107 ? param107 : param107)) - (+(-(8'ha7)))))))
(y, clk, wire62, wire61, wire60, wire59);
  output wire [(32'h1c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire62;
  input wire signed [(2'h2):(1'h0)] wire61;
  input wire signed [(3'h7):(1'h0)] wire60;
  input wire signed [(5'h15):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire100;
  wire signed [(3'h7):(1'h0)] wire99;
  wire signed [(3'h6):(1'h0)] wire98;
  wire signed [(5'h14):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire76;
  wire signed [(2'h2):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire73;
  wire [(5'h11):(1'h0)] wire72;
  wire signed [(4'hf):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire69;
  wire signed [(4'ha):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire65;
  wire [(3'h7):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire63;
  reg signed [(4'h9):(1'h0)] reg106 = (1'h0);
  reg [(3'h5):(1'h0)] reg105 = (1'h0);
  reg [(3'h4):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg [(4'hf):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg95 = (1'h0);
  reg [(2'h2):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(4'h8):(1'h0)] reg92 = (1'h0);
  reg [(3'h6):(1'h0)] reg91 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(5'h11):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire65,
                 wire64,
                 wire63,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
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
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire63 = (($signed(($signed(wire60) ?
                      {wire59,
                          wire59} : (wire59 - wire59))) && {($signed(wire60) ?
                          $signed(wire60) : (wire59 & wire60)),
                      ((!wire62) ?
                          wire59[(4'h9):(1'h1)] : $signed((8'hbc)))}) - ({(^~$unsigned(wire59))} ?
                      (!$signed(wire59)) : $signed((wire62[(4'hb):(3'h5)] ?
                          wire59 : {wire60, wire60}))));
  assign wire64 = $unsigned(({$signed((wire63 ? wire63 : wire63)),
                          $unsigned(wire60)} ?
                      ((7'h43) || {(wire59 + wire63)}) : $signed(wire60[(2'h2):(1'h1)])));
  assign wire65 = (~|wire62[(4'hd):(1'h1)]);
  always
    @(posedge clk) begin
      reg66 <= ($unsigned(wire61) * (wire61[(2'h2):(1'h0)] ?
          ({(~|wire65)} ?
              $signed(wire65[(1'h1):(1'h1)]) : $unsigned((~&wire59))) : $signed($unsigned(((8'h9d) > wire63)))));
      reg67 <= (8'hbc);
    end
  assign wire68 = {$signed(wire63)};
  assign wire69 = (wire62[(3'h4):(1'h0)] ? wire62 : wire59[(1'h0):(1'h0)]);
  assign wire70 = $unsigned(wire62[(3'h7):(2'h3)]);
  assign wire71 = reg67[(3'h6):(2'h3)];
  assign wire72 = {$signed({((wire68 ? wire65 : wire70) < $signed(wire63)),
                          ((wire59 ? wire70 : wire63) >>> (8'h9e))})};
  assign wire73 = $unsigned(wire68);
  assign wire74 = reg66[(1'h1):(1'h0)];
  assign wire75 = $unsigned(($signed(((7'h41) ?
                      (wire70 + wire71) : $unsigned(wire59))) >= ((~{wire65}) && $unsigned({wire65,
                      reg66}))));
  assign wire76 = $signed($signed((((wire65 >>> wire63) ?
                          $signed(wire68) : {wire73, reg66}) ?
                      $unsigned((wire72 ?
                          wire68 : wire59)) : (wire60[(3'h4):(2'h3)] ~^ ((8'hbc) ^~ wire60)))));
  assign wire77 = reg67[(4'hc):(3'h4)];
  always
    @(posedge clk) begin
      reg78 <= wire68[(1'h1):(1'h1)];
      if ((~|(wire76 ?
          wire72[(4'h9):(3'h6)] : ({wire59} < ($signed((8'ha7)) || $unsigned(wire77))))))
        begin
          reg79 <= (((~^(wire60 ?
              (wire60 ?
                  wire75 : wire72) : ((8'ha8) < wire59))) >= (((wire72 || (8'h9f)) < wire63[(2'h3):(2'h2)]) ?
              (reg66 ?
                  wire61[(1'h0):(1'h0)] : wire68) : wire69[(3'h5):(1'h0)])) > $unsigned((reg78[(1'h1):(1'h1)] ?
              $signed(wire61[(1'h1):(1'h1)]) : $unsigned(wire68))));
          reg80 <= ((8'ha2) ?
              (^$unsigned((+(wire64 || wire59)))) : $signed({wire63[(3'h4):(2'h3)],
                  (~^$unsigned(wire68))}));
          if (reg67[(4'ha):(2'h2)])
            begin
              reg81 <= $unsigned(({$unsigned((reg78 >= wire59))} ?
                  ($signed((wire64 <<< reg78)) || wire65[(3'h7):(3'h7)]) : (~&wire72[(3'h6):(2'h2)])));
              reg82 <= (((reg79 ?
                  $signed(((8'hbc) ?
                      wire75 : wire61)) : (~reg66)) > ($signed((wire63 * (8'hba))) != (8'hab))) - (((~$signed(wire63)) >>> ((reg67 ?
                          (8'hbc) : reg78) ?
                      (!(8'hb2)) : {reg80})) ?
                  (wire72[(2'h3):(2'h2)] ?
                      $unsigned((wire70 ?
                          wire59 : wire72)) : ($signed((8'h9f)) ?
                          $unsigned(wire62) : $signed(wire63))) : ($unsigned((wire71 <<< (8'hb6))) == (wire71[(2'h3):(1'h0)] ?
                      (~^reg67) : wire68))));
              reg83 <= (|(reg66[(2'h2):(2'h2)] ?
                  (reg82 ?
                      ((|reg80) ?
                          (reg79 ?
                              wire64 : reg80) : wire63) : wire72[(3'h6):(1'h1)]) : wire62[(4'he):(3'h5)]));
            end
          else
            begin
              reg81 <= (&wire61);
              reg82 <= (wire68[(1'h0):(1'h0)] ?
                  (((8'hbe) * ({wire61} != (wire70 ? wire63 : (8'ha4)))) ?
                      $unsigned(((wire72 ? reg79 : wire71) ?
                          $signed(wire64) : (~|reg82))) : (($unsigned(wire75) ?
                              reg79 : $signed((8'hae))) ?
                          $unsigned(wire62) : ((wire74 ^~ (8'hac)) >>> (7'h40)))) : $signed((~^wire76)));
              reg83 <= ({{(^(|reg81)), wire70}, reg66} ?
                  $unsigned(wire74[(2'h2):(1'h1)]) : (wire70[(1'h0):(1'h0)] <<< wire65[(4'hd):(1'h1)]));
              reg84 <= {($unsigned((|wire64)) <= ($signed($unsigned(wire69)) ?
                      $unsigned($unsigned(wire71)) : wire59))};
            end
          reg85 <= $signed((wire71[(2'h2):(2'h2)] - reg79[(4'ha):(4'h9)]));
          reg86 <= wire75[(1'h0):(1'h0)];
        end
      else
        begin
          if ($unsigned((+(wire61[(2'h2):(1'h0)] ?
              ($signed(wire74) ?
                  (wire59 ? reg84 : wire75) : (reg78 ?
                      wire61 : (8'ha5))) : (wire75 + $unsigned(reg82))))))
            begin
              reg79 <= ((($unsigned(((7'h42) ^~ reg86)) ?
                      reg86[(1'h0):(1'h0)] : (-(reg80 ? reg66 : (8'h9c)))) ?
                  ($unsigned((wire70 || (8'hb2))) | {wire61}) : (((reg78 - (8'hb7)) ?
                      $unsigned(reg66) : $signed(wire75)) != $signed($unsigned(reg81)))) - wire60);
              reg80 <= (~reg85[(3'h5):(1'h0)]);
              reg81 <= $signed(wire71[(4'h9):(2'h2)]);
              reg82 <= (~|$unsigned(reg79[(3'h5):(1'h1)]));
            end
          else
            begin
              reg79 <= ($unsigned((+({reg84, (8'hb0)} ?
                  ((7'h44) << wire77) : ((8'hb6) ?
                      wire76 : wire65)))) >> wire69[(1'h1):(1'h0)]);
              reg80 <= (+reg78[(3'h4):(1'h1)]);
              reg81 <= $unsigned({(wire59[(1'h0):(1'h0)] | reg85)});
              reg82 <= (!(|$signed($unsigned($unsigned(reg80)))));
            end
          reg83 <= ((-(~&((-reg66) > $signed(wire75)))) << (wire63 ?
              ($signed($unsigned(wire71)) ^~ reg80[(3'h5):(2'h3)]) : (^~$signed((wire72 >> reg66)))));
          reg84 <= {wire74};
          reg85 <= (|$unsigned(($unsigned((reg79 ? wire69 : wire69)) ?
              wire71 : ((reg81 * reg67) ?
                  ((8'hb9) == reg78) : $signed((8'hab))))));
          if ($unsigned({reg78, (|($signed(reg67) && ((8'hba) <= reg85)))}))
            begin
              reg86 <= (+(reg85 ?
                  (wire73[(4'hc):(2'h3)] ?
                      reg86 : $signed((~^wire59))) : $signed(wire64[(2'h2):(1'h1)])));
              reg87 <= wire61;
              reg88 <= wire74;
              reg89 <= {(8'hbb)};
              reg90 <= {(((!reg67[(4'h9):(1'h0)]) >>> wire76) ?
                      $signed((reg81[(1'h1):(1'h1)] ?
                          $unsigned((8'hb7)) : (wire71 ^~ (8'hbe)))) : wire64)};
            end
          else
            begin
              reg86 <= $unsigned({($unsigned({reg88, (8'hb8)}) ?
                      (reg78 >= wire60) : (reg85 >>> $unsigned((8'ha2))))});
              reg87 <= $signed($unsigned((~&wire77)));
              reg88 <= $unsigned((reg83[(3'h6):(2'h3)] ~^ reg80[(4'hd):(3'h4)]));
            end
        end
      if (wire73[(3'h7):(3'h4)])
        begin
          reg91 <= wire76;
          reg92 <= ($unsigned($unsigned(wire61[(1'h1):(1'h1)])) ?
              ((7'h41) ?
                  $unsigned($signed((!reg91))) : $unsigned((reg81 ?
                      $signed(wire74) : $signed((8'hbb))))) : (|($unsigned({reg91,
                      (8'haa)}) ?
                  reg85 : (^(!(8'haa))))));
          reg93 <= (-({reg80[(4'he):(3'h6)], (&((8'hb3) >> wire68))} * wire74));
          reg94 <= {wire64, $unsigned(((^wire77[(4'ha):(3'h7)]) + reg79))};
        end
      else
        begin
          if (($signed($signed(wire70[(4'hd):(3'h7)])) ?
              (wire65 ?
                  wire64 : (~^$signed((reg90 ? wire74 : (8'hb7))))) : wire63))
            begin
              reg91 <= $unsigned(((({(8'hbb), wire65} <= $signed(wire75)) ?
                      (wire77[(2'h2):(2'h2)] != wire69) : $unsigned(reg93[(1'h0):(1'h0)])) ?
                  {$unsigned((&reg85)),
                      (wire77[(1'h0):(1'h0)] ~^ (8'hab))} : ($signed($signed(reg67)) | (7'h41))));
              reg92 <= {reg92};
              reg93 <= wire71[(4'hd):(2'h3)];
              reg94 <= $unsigned($signed($unsigned($signed({(8'ha6)}))));
            end
          else
            begin
              reg91 <= ((wire62 & ({reg78[(1'h1):(1'h1)]} ?
                  $signed($signed(reg82)) : reg80)) == (~&wire77[(3'h5):(3'h5)]));
              reg92 <= (!(|$signed(((wire69 <= (8'hab)) < $unsigned(reg87)))));
            end
          reg95 <= $unsigned(((wire70 ~^ reg78) ?
              (~|($unsigned(reg82) && wire59[(4'hc):(4'hc)])) : (wire60 ?
                  {wire60} : $unsigned({reg90, reg79}))));
        end
      reg96 <= wire77;
    end
  assign wire97 = (reg67[(3'h7):(1'h0)] ?
                      wire73 : ((|reg84[(4'ha):(3'h7)]) ?
                          $signed(wire64[(2'h3):(1'h0)]) : ((reg94 ?
                                  (wire72 ?
                                      wire77 : reg87) : wire63[(2'h3):(2'h3)]) ?
                              ((reg96 ? wire61 : (8'hab)) ?
                                  reg82[(2'h2):(1'h0)] : {wire72}) : ({reg86,
                                  (8'hb8)} >= {reg78}))));
  assign wire98 = ($signed({(reg80[(5'h14):(3'h6)] ? (~wire59) : (|wire76)),
                      ($signed(reg90) > (wire77 >> reg87))}) != ($unsigned(($unsigned(reg94) | (~^wire60))) && wire72));
  assign wire99 = (~^$signed({$unsigned($unsigned(reg94)),
                      $unsigned({wire63})}));
  assign wire100 = (!reg94);
  always
    @(posedge clk) begin
      if ($signed((({wire77} << $unsigned($signed(wire73))) ^~ (^~$unsigned((+wire98))))))
        begin
          reg101 <= (8'hb0);
          if (((wire69[(1'h0):(1'h0)] >= (+$unsigned({(8'hb3), (8'hb5)}))) ?
              ((~reg83[(1'h1):(1'h0)]) | (|{(wire70 * (8'ha7))})) : reg66[(4'ha):(3'h7)]))
            begin
              reg102 <= (+$signed($signed($unsigned({(8'h9e)}))));
              reg103 <= reg84[(3'h4):(1'h0)];
              reg104 <= $signed(($signed((~&(reg92 >> reg92))) ?
                  $signed(reg83) : (($unsigned(reg94) > (reg92 | reg94)) ?
                      wire64[(3'h4):(1'h1)] : ($signed(reg67) == $signed(reg88)))));
              reg105 <= ({((^~{(7'h41), reg101}) >> (-(reg90 ?
                      wire63 : (8'hbf)))),
                  (wire74[(1'h1):(1'h1)] || $signed((8'ha3)))} ^~ ((($signed(wire97) < $unsigned(reg83)) ?
                  wire76[(2'h3):(1'h0)] : $unsigned($unsigned((8'ha9)))) == $signed(reg86[(2'h3):(1'h0)])));
            end
          else
            begin
              reg102 <= reg67[(4'h9):(4'h9)];
              reg103 <= ($signed($signed($signed($unsigned(reg81)))) == $signed({reg81}));
              reg104 <= wire100;
              reg105 <= (~^($unsigned((~&(wire68 << wire69))) ?
                  (^~$signed(((8'ha3) + reg66))) : (reg89 || wire65[(4'hc):(4'hb)])));
              reg106 <= wire63;
            end
        end
      else
        begin
          reg101 <= (-$unsigned($signed(reg79)));
          reg102 <= (^wire76[(1'h1):(1'h0)]);
          reg103 <= (reg104 >> (wire73[(4'hb):(3'h6)] | {reg86[(2'h2):(1'h0)],
              (8'ha8)}));
          reg104 <= (wire74[(3'h4):(3'h4)] > $signed($unsigned(((+(8'ha6)) ?
              $signed(wire72) : $signed(reg102)))));
        end
    end
endmodule

module module12  (y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h185):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire16;
  input wire signed [(3'h4):(1'h0)] wire15;
  input wire signed [(5'h11):(1'h0)] wire14;
  input wire signed [(3'h7):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire20;
  wire signed [(2'h3):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire17;
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire43,
                 wire42,
                 wire41,
                 wire30,
                 wire29,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg46,
                 reg45,
                 reg44,
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
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire17 = ({(((wire16 ? wire13 : (8'hb2)) ?
                              {wire14, wire15} : (+wire13)) ?
                          ((wire16 | wire13) >> wire14[(1'h0):(1'h0)]) : wire16[(4'ha):(1'h0)])} >>> (&(~$unsigned(wire15))));
  assign wire18 = $signed((^wire17[(4'h8):(3'h4)]));
  assign wire19 = {{(^(~^(wire17 ? wire13 : wire15))),
                          $signed(wire14[(2'h3):(1'h1)])}};
  assign wire20 = wire16[(3'h7):(3'h4)];
  assign wire21 = $unsigned((wire17 ?
                      $signed($unsigned($signed(wire15))) : (|$signed((wire18 + wire19)))));
  always
    @(posedge clk) begin
      reg22 <= ($unsigned((((wire17 > (7'h44)) ?
          wire21 : ((8'ha7) <<< wire14)) < ((wire16 ?
          wire20 : wire16) ^ wire13))) & wire16[(4'ha):(3'h4)]);
      if ((wire18[(3'h6):(3'h4)] ?
          wire16[(4'hb):(4'hb)] : (~^{(wire15 != (&reg22))})))
        begin
          reg23 <= $unsigned(($signed({{wire15}, (!(8'hbc))}) ?
              $signed((^~$signed(wire18))) : wire21[(1'h0):(1'h0)]));
          reg24 <= $unsigned($unsigned(wire20));
          reg25 <= {$signed(wire17), (^~wire13)};
          reg26 <= $unsigned($unsigned($unsigned($signed((8'hb6)))));
          reg27 <= reg26;
        end
      else
        begin
          reg23 <= (~|reg25);
          if ($unsigned((~$signed($unsigned(wire21)))))
            begin
              reg24 <= $signed($signed($unsigned({reg23[(3'h6):(3'h4)],
                  {reg27}})));
              reg25 <= {reg25[(2'h2):(1'h1)]};
            end
          else
            begin
              reg24 <= reg26[(1'h0):(1'h0)];
              reg25 <= ({($unsigned((+reg27)) >> $signed($unsigned(wire18)))} >= reg24);
            end
          reg26 <= (~$unsigned($signed($signed(wire21[(1'h1):(1'h1)]))));
          reg27 <= $signed(($signed($unsigned(wire21)) ?
              $signed($unsigned($signed(reg22))) : ({(wire14 ?
                      wire20 : wire18)} * reg24[(2'h3):(2'h3)])));
          reg28 <= (({(wire20 ? (-wire19) : (reg26 ~^ wire18)),
              ((wire13 ^~ reg22) ?
                  ((8'hb0) > reg27) : (+reg23))} + (-(^(^~reg27)))) <<< (reg27[(3'h6):(1'h0)] ?
              {wire13, reg24[(3'h4):(1'h1)]} : ((+{reg26}) ?
                  reg25[(2'h2):(1'h0)] : (reg25 ?
                      $signed(wire21) : $signed(wire15)))));
        end
    end
  assign wire29 = reg26;
  assign wire30 = (reg28 + $unsigned(reg24[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if (reg24[(2'h2):(2'h2)])
        begin
          reg31 <= $signed(($unsigned(((reg28 ? (8'ha9) : reg24) ?
                  wire19 : (|reg24))) ?
              $signed((|reg28)) : (reg26 << (8'hb7))));
          reg32 <= {(((!reg23) >>> wire30[(3'h5):(1'h0)]) ^~ (8'ha6)),
              $signed($unsigned((^~((8'had) ? wire19 : reg24))))};
          if (wire18[(4'hf):(2'h2)])
            begin
              reg33 <= ((~|$signed($signed($unsigned(wire19)))) - reg32[(3'h7):(3'h6)]);
              reg34 <= $unsigned((&(^$signed($unsigned(reg26)))));
              reg35 <= wire14;
              reg36 <= $unsigned((~&reg26[(1'h0):(1'h0)]));
              reg37 <= $unsigned((reg24[(1'h1):(1'h0)] + reg36));
            end
          else
            begin
              reg33 <= $unsigned({(+(-(&wire20))), reg23[(3'h6):(3'h6)]});
              reg34 <= $signed($unsigned((wire13[(1'h0):(1'h0)] ?
                  reg32[(3'h7):(3'h6)] : wire21)));
              reg35 <= (wire30[(3'h6):(2'h2)] ?
                  $unsigned({(&wire13), $signed((wire29 ~^ reg35))}) : wire14);
            end
        end
      else
        begin
          reg31 <= (&wire16[(3'h6):(3'h4)]);
        end
      reg38 <= ((-$unsigned((-((8'ha6) ?
          wire14 : reg25)))) < ($signed({(wire29 ? reg26 : (8'hbd)),
          {reg26}}) ^~ $signed(reg23)));
      reg39 <= (~&reg27);
      reg40 <= reg38;
    end
  assign wire41 = ({reg26[(4'h9):(4'h8)], (8'ha9)} ?
                      (-reg36) : $unsigned(((((8'ha0) == reg22) <<< $unsigned((8'ha9))) ?
                          $unsigned(wire15[(2'h3):(1'h1)]) : reg38[(5'h13):(4'he)])));
  assign wire42 = $signed($signed(wire20[(1'h1):(1'h0)]));
  assign wire43 = ($signed(wire20) ?
                      (reg28 <<< reg24[(1'h0):(1'h0)]) : (^((-{reg34,
                          wire15}) & ($unsigned(wire42) + $signed((8'ha6))))));
  always
    @(posedge clk) begin
      reg44 <= {$signed(($unsigned(wire16) ?
              reg32[(4'hb):(4'h9)] : wire13[(1'h0):(1'h0)])),
          (+$signed(wire29))};
      reg45 <= ($signed(wire21) < ($unsigned(((reg23 + reg37) ?
              (&(7'h40)) : (^reg39))) ?
          ((reg39[(4'h8):(3'h4)] ^~ (wire20 >> wire29)) >> wire13) : ((&wire14[(3'h5):(1'h0)]) ?
              (-reg22) : (wire16[(3'h5):(1'h0)] == wire42))));
      reg46 <= (({reg45[(4'ha):(4'ha)]} ? reg24 : {wire30[(4'hb):(3'h5)]}) ?
          (~|({$signed(reg24), reg33} & {(wire43 * reg44),
              {wire15, reg26}})) : ($signed(((~&wire41) ?
              (~^reg27) : (wire16 & wire19))) || wire19[(2'h2):(1'h0)]));
    end
  assign wire47 = (~|{(wire42 & (!(8'ha9)))});
  assign wire48 = $signed(((|$signed(wire41[(4'hf):(1'h0)])) ~^ reg38));
  assign wire49 = wire42[(4'hd):(3'h5)];
endmodule
