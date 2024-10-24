module top
#(parameter param219 = ((-((((7'h44) > (8'hba)) <<< ((8'hbe) ? (7'h44) : (8'ha5))) << (((8'ha5) ? (8'hb5) : (8'ha0)) ? ((8'h9f) <<< (8'hba)) : ((7'h43) - (8'hb7))))) ? ((8'ha6) ? ((^((8'hba) ? (8'ha9) : (8'hb2))) ~^ {{(8'h9d), (7'h44)}}) : (+({(8'hbb)} ? ((7'h42) >>> (8'haa)) : (~&(8'ha9))))) : (((8'hbd) ? (((8'ha3) + (7'h42)) ? ((8'h9f) <<< (8'hb6)) : {(8'hb5)}) : (-((8'hbd) | (8'hbd)))) * ({((8'ha4) ? (8'hb0) : (8'hb0))} ? (~^((8'hbb) ? (8'had) : (8'ha7))) : (~&(~(8'hb8)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire218;
  wire [(4'hd):(1'h0)] wire217;
  wire [(4'ha):(1'h0)] wire209;
  wire signed [(4'h8):(1'h0)] wire150;
  wire [(5'h10):(1'h0)] wire149;
  wire signed [(5'h11):(1'h0)] wire147;
  wire [(3'h5):(1'h0)] wire214;
  wire [(5'h12):(1'h0)] wire215;
  reg [(5'h15):(1'h0)] reg211 = (1'h0);
  reg [(3'h5):(1'h0)] reg212 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg213 = (1'h0);
  assign y = {wire218,
                 wire217,
                 wire209,
                 wire150,
                 wire149,
                 wire147,
                 wire214,
                 wire215,
                 reg211,
                 reg212,
                 reg213,
                 (1'h0)};
  module5 #() modinst148 (wire147, clk, wire4, wire3, wire0, wire1, wire2);
  assign wire149 = (wire0 >>> $signed({(~^(|wire3)),
                       {(wire1 ? wire4 : wire0), (8'hbf)}}));
  assign wire150 = $signed({$signed(($signed((8'ha4)) ?
                           (~wire2) : (wire3 ? wire147 : wire2))),
                       wire149});
  module151 #() modinst210 (.clk(clk), .wire156(wire4), .y(wire209), .wire155(wire0), .wire153(wire149), .wire152(wire1), .wire154(wire147));
  always
    @(posedge clk) begin
      reg211 <= ((wire2 ~^ wire3) <= wire3[(3'h5):(1'h0)]);
      reg212 <= $signed(({$unsigned(wire147[(4'ha):(1'h1)])} ?
          {wire3} : wire4[(5'h11):(4'ha)]));
      reg213 <= reg211[(3'h7):(2'h3)];
    end
  assign wire214 = (wire0 ?
                       (!(wire209 < $signed(reg213[(3'h7):(3'h4)]))) : {wire3[(4'h9):(2'h2)],
                           (wire1 ? $signed((8'ha7)) : $unsigned(wire4))});
  module28 #() modinst216 (.wire31(wire147), .wire30(wire1), .y(wire215), .clk(clk), .wire29(reg213), .wire32(wire3));
  assign wire217 = (($signed(wire149) && $signed(wire150)) ?
                       $unsigned(wire214[(1'h0):(1'h0)]) : (8'ha9));
  assign wire218 = $unsigned(((wire214[(3'h4):(2'h2)] > ($unsigned(wire4) ?
                       wire0 : wire217[(4'hd):(2'h3)])) < $signed(((wire3 & (8'ha9)) - (|(8'ha0))))));
endmodule

module module151  (y, clk, wire152, wire153, wire154, wire155, wire156);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire152;
  input wire [(5'h10):(1'h0)] wire153;
  input wire [(5'h11):(1'h0)] wire154;
  input wire signed [(2'h2):(1'h0)] wire155;
  input wire signed [(4'h9):(1'h0)] wire156;
  wire signed [(4'hc):(1'h0)] wire208;
  wire [(5'h12):(1'h0)] wire207;
  wire signed [(5'h14):(1'h0)] wire206;
  wire [(3'h7):(1'h0)] wire205;
  wire signed [(2'h3):(1'h0)] wire158;
  wire [(5'h11):(1'h0)] wire159;
  wire [(4'hc):(1'h0)] wire160;
  wire signed [(5'h11):(1'h0)] wire161;
  wire signed [(4'h9):(1'h0)] wire199;
  reg signed [(5'h12):(1'h0)] reg204 = (1'h0);
  reg [(4'he):(1'h0)] reg203 = (1'h0);
  reg [(5'h11):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg201 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg157 = (1'h0);
  assign y = {wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire158,
                 wire159,
                 wire160,
                 wire161,
                 wire199,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg157,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg157 <= {$signed(wire155)};
    end
  assign wire158 = wire155;
  assign wire159 = $unsigned($unsigned({$signed((~|reg157))}));
  assign wire160 = $unsigned(reg157);
  assign wire161 = {(~&(wire154 ? wire156 : wire158))};
  module162 #() modinst200 (wire199, clk, wire152, wire160, wire159, wire156, wire161);
  always
    @(posedge clk) begin
      reg201 <= $unsigned((^~((((7'h42) << reg157) ?
              (wire160 | wire158) : (wire155 <= wire155)) ?
          {(8'ha3), (^~(8'ha1))} : wire160)));
      reg202 <= reg201[(1'h1):(1'h0)];
      reg203 <= ((^~$signed((&$unsigned((8'ha6))))) << $unsigned($signed(($unsigned(wire160) >> reg202))));
      reg204 <= wire160[(4'h9):(4'h9)];
    end
  assign wire205 = (((wire155[(2'h2):(1'h1)] ^~ ($unsigned((8'hae)) ^ wire153)) << ($signed(wire160[(4'h9):(4'h8)]) ?
                       $unsigned($unsigned(reg203)) : ($signed(wire160) | $unsigned(reg201)))) <= $unsigned($unsigned((wire199 - reg202))));
  assign wire206 = (~^wire161[(4'ha):(3'h7)]);
  assign wire207 = (|$signed((&($unsigned((7'h41)) >>> wire156[(1'h1):(1'h1)]))));
  assign wire208 = $unsigned((~&(wire158 <= wire152)));
endmodule

module module5
#(parameter param145 = (-(~(7'h41))), 
parameter param146 = param145)
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h188):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire6;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire [(4'hb):(1'h0)] wire8;
  input wire signed [(3'h5):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire10;
  wire [(4'hf):(1'h0)] wire143;
  wire [(4'hb):(1'h0)] wire142;
  wire [(5'h14):(1'h0)] wire136;
  wire [(5'h13):(1'h0)] wire135;
  wire [(4'h8):(1'h0)] wire134;
  wire [(4'h9):(1'h0)] wire133;
  wire [(4'hc):(1'h0)] wire132;
  wire signed [(3'h5):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire116;
  wire signed [(5'h14):(1'h0)] wire130;
  reg signed [(5'h10):(1'h0)] reg144 = (1'h0);
  reg [(3'h6):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg140 = (1'h0);
  reg [(4'hb):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg138 = (1'h0);
  reg [(4'ha):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire116,
                 wire130,
                 reg144,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= (^~$unsigned(($unsigned((~|(8'hb6))) > ($unsigned(wire8) ?
          (~&wire6) : $unsigned(wire7)))));
    end
  assign wire12 = $unsigned((wire10[(1'h0):(1'h0)] <= (reg11[(5'h10):(4'h9)] ?
                      reg11[(4'h9):(4'h9)] : (wire9 < (^(8'hb8))))));
  assign wire13 = wire8[(3'h4):(2'h3)];
  assign wire14 = wire13;
  assign wire15 = $unsigned((8'had));
  assign wire16 = (!$signed((wire8[(3'h7):(3'h7)] ?
                      $signed(((8'hb8) ~^ (8'hb7))) : $unsigned(wire10))));
  assign wire17 = (!((~&{(wire16 ? wire8 : wire9)}) ?
                      wire15[(4'hd):(4'h8)] : (!$unsigned($signed(wire15)))));
  assign wire18 = wire6;
  always
    @(posedge clk) begin
      reg19 <= ($unsigned(wire13[(2'h3):(1'h1)]) << $unsigned(wire6[(1'h0):(1'h0)]));
      reg20 <= wire15[(1'h0):(1'h0)];
      reg21 <= (^$unsigned((((wire6 ?
          reg20 : (7'h43)) >= $unsigned((8'had))) | (wire17[(1'h0):(1'h0)] ?
          $signed((7'h41)) : (reg11 ? reg11 : wire12)))));
      reg22 <= wire8[(4'h9):(3'h5)];
    end
  always
    @(posedge clk) begin
      if (reg20)
        begin
          reg23 <= (reg22 + $unsigned(reg20));
        end
      else
        begin
          reg23 <= $signed($unsigned($unsigned(wire7)));
          reg24 <= wire9[(2'h2):(2'h2)];
        end
      reg25 <= {$signed(($signed(reg24[(4'hf):(4'hb)]) ^ wire18[(3'h7):(3'h7)]))};
      reg26 <= reg23;
      if (wire17[(1'h0):(1'h0)])
        begin
          reg27 <= reg21;
        end
      else
        begin
          reg27 <= ($signed(($signed((wire9 ?
                  wire17 : (8'hbc))) << ($signed(wire8) ?
                  reg27[(3'h4):(1'h0)] : wire6[(2'h2):(1'h0)]))) ?
              (^~reg27) : $unsigned($unsigned($unsigned($signed(reg11)))));
        end
    end
  module28 #() modinst117 (.y(wire116), .wire29(reg19), .wire31(wire6), .wire32(wire10), .clk(clk), .wire30(reg22));
  module118 #() modinst131 (.wire122(reg25), .wire119(wire14), .clk(clk), .wire123(wire17), .wire121(reg19), .wire120(wire6), .y(wire130));
  assign wire132 = ($unsigned(((~(~|(7'h43))) ?
                           $signed((~&(7'h40))) : ({reg19} ?
                               $unsigned(wire9) : (wire6 ^~ reg20)))) ?
                       $unsigned($signed($signed(reg11[(4'hc):(4'ha)]))) : (^~wire16[(4'ha):(4'ha)]));
  assign wire133 = ((|$signed(($unsigned(wire9) ?
                           (-reg21) : $unsigned(reg25)))) ?
                       (($signed((+wire6)) != ((wire18 ?
                               wire17 : wire130) ^~ wire7[(3'h4):(1'h0)])) ?
                           ($unsigned((~^wire6)) ?
                               (&$signed(reg21)) : wire17) : wire18[(3'h6):(1'h1)]) : $signed($signed(({(7'h44),
                               reg24} ?
                           reg21 : (^reg25)))));
  assign wire134 = ($signed((reg11[(3'h4):(1'h1)] ?
                           (~(wire15 | wire16)) : wire10)) ?
                       $signed((~&$signed((~|wire10)))) : ($unsigned(((wire17 ?
                           reg22 : wire14) ^~ $unsigned((8'hbc)))) <= wire10));
  assign wire135 = $unsigned(((~|$signed((wire18 ?
                       wire17 : reg24))) != (~^wire116)));
  assign wire136 = $signed((wire12[(1'h1):(1'h0)] | $signed(wire130)));
  always
    @(posedge clk) begin
      reg137 <= $unsigned((8'ha3));
      reg138 <= ((reg24 >>> reg22[(4'h8):(2'h3)]) > ($unsigned(reg22[(1'h1):(1'h1)]) <<< $signed(((wire17 ?
          reg137 : wire10) | {reg22}))));
      reg139 <= (~&reg27);
      reg140 <= $signed(($unsigned(wire15[(5'h13):(5'h11)]) << ((wire16 >= reg19[(2'h2):(2'h2)]) ^~ wire16[(3'h7):(3'h7)])));
      reg141 <= ((-reg24[(3'h6):(2'h3)]) ?
          $signed({{reg27[(4'he):(1'h1)]}, $unsigned(wire14)}) : (~^reg20));
    end
  assign wire142 = reg137[(3'h6):(1'h0)];
  assign wire143 = wire10[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg144 <= (&(reg138[(4'h8):(3'h5)] ?
          ((wire18 ? (reg21 ? reg23 : wire132) : $unsigned(wire15)) ?
              {(wire8 ? reg19 : reg22),
                  ((8'hbd) ?
                      wire17 : wire15)} : (~&{(8'ha5)})) : (~{$unsigned(wire13),
              ((8'hb8) ? (8'ha6) : wire12)})));
    end
endmodule

module module118  (y, clk, wire123, wire122, wire121, wire120, wire119);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire123;
  input wire [(3'h5):(1'h0)] wire122;
  input wire signed [(4'hd):(1'h0)] wire121;
  input wire signed [(5'h12):(1'h0)] wire120;
  input wire [(3'h6):(1'h0)] wire119;
  wire signed [(5'h15):(1'h0)] wire129;
  wire signed [(4'hc):(1'h0)] wire128;
  wire [(5'h13):(1'h0)] wire127;
  wire signed [(5'h14):(1'h0)] wire126;
  wire [(5'h15):(1'h0)] wire125;
  wire signed [(4'hb):(1'h0)] wire124;
  assign y = {wire129, wire128, wire127, wire126, wire125, wire124, (1'h0)};
  assign wire124 = $signed($signed({wire120[(4'hd):(2'h3)],
                       ((wire120 ?
                           wire120 : wire120) > ((8'h9c) >>> wire121))}));
  assign wire125 = {(^~$signed((~^(^~wire123)))), $unsigned(wire122)};
  assign wire126 = wire125;
  assign wire127 = wire124[(4'ha):(3'h5)];
  assign wire128 = wire119[(3'h5):(2'h3)];
  assign wire129 = (8'ha9);
endmodule

module module28  (y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h40c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire32;
  input wire signed [(4'h9):(1'h0)] wire31;
  input wire [(4'ha):(1'h0)] wire30;
  input wire [(4'ha):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire92;
  wire signed [(5'h14):(1'h0)] wire91;
  wire signed [(3'h4):(1'h0)] wire60;
  wire [(5'h12):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire55;
  wire signed [(4'h8):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire50;
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg113 = (1'h0);
  reg [(4'he):(1'h0)] reg112 = (1'h0);
  reg [(3'h5):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg110 = (1'h0);
  reg [(3'h7):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(5'h14):(1'h0)] reg101 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg95 = (1'h0);
  reg [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  reg [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg84 = (1'h0);
  reg [(5'h10):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg73 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
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
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
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
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
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
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg33 <= wire31[(3'h4):(1'h1)];
      reg34 <= wire30[(2'h3):(1'h0)];
      reg35 <= reg34[(4'h8):(2'h2)];
      reg36 <= (+wire30[(3'h4):(2'h2)]);
    end
  always
    @(posedge clk) begin
      reg37 <= (~|wire29);
      reg38 <= (&$signed({$signed({reg33, wire29})}));
      reg39 <= wire31;
    end
  always
    @(posedge clk) begin
      if (($unsigned($signed(reg38)) >> (~|reg39)))
        begin
          reg40 <= reg33[(2'h3):(2'h2)];
          if (reg33[(3'h5):(2'h3)])
            begin
              reg41 <= $signed(reg37[(5'h12):(4'hf)]);
            end
          else
            begin
              reg41 <= (~|(($unsigned(wire31[(2'h3):(1'h1)]) ~^ reg34[(5'h11):(2'h3)]) <<< (reg38 & $unsigned($signed(wire31)))));
              reg42 <= $unsigned($unsigned(wire29[(1'h1):(1'h0)]));
              reg43 <= ((reg42 && ((&$unsigned((8'ha2))) ?
                  {wire29[(2'h3):(1'h0)]} : (reg39[(2'h2):(1'h1)] ?
                      (reg42 ?
                          reg36 : (8'ha1)) : reg41[(3'h4):(3'h4)]))) <<< (reg42[(4'ha):(3'h6)] ?
                  ({(reg37 <<< reg40)} ?
                      reg38[(4'h8):(2'h3)] : $signed((reg36 ?
                          reg33 : (8'had)))) : reg33[(2'h3):(1'h1)]));
              reg44 <= (-(~(((reg41 != (8'h9e)) > (reg43 && reg43)) ^~ $unsigned($unsigned(reg34)))));
            end
          reg45 <= reg34[(3'h4):(3'h4)];
        end
      else
        begin
          if ($signed(($signed(($unsigned(reg41) >= {wire31,
              reg40})) | $signed(((wire30 ? reg43 : (7'h41)) ?
              (8'hae) : ((8'hbe) || wire32))))))
            begin
              reg40 <= $unsigned($signed(wire29[(1'h0):(1'h0)]));
              reg41 <= $unsigned(reg41[(4'ha):(2'h2)]);
              reg42 <= wire31;
              reg43 <= ($signed($unsigned((~(wire32 || reg34)))) & $signed(reg35));
              reg44 <= {wire30[(3'h5):(1'h0)],
                  {($unsigned((~^reg41)) ?
                          {$unsigned(reg44)} : {$signed(reg37), (^~reg44)}),
                      (((~^reg39) > (wire31 && wire30)) ?
                          $signed((~&reg34)) : $signed($unsigned(reg39)))}};
            end
          else
            begin
              reg40 <= (($unsigned($unsigned(reg38)) == (+(+((7'h44) ?
                  reg34 : (8'ha8))))) <= $signed(($unsigned((7'h40)) - ((reg45 ?
                  (8'hb4) : reg45) >= reg34[(5'h11):(4'ha)]))));
              reg41 <= (8'hb8);
            end
          reg45 <= $unsigned(({$signed($unsigned(reg37))} ?
              $signed($signed($signed(reg36))) : $unsigned({(wire30 >>> reg41)})));
          reg46 <= (8'haf);
          reg47 <= ((($unsigned((reg41 < reg36)) ? $unsigned(reg39) : reg43) ?
              $unsigned((wire30[(4'h9):(3'h5)] ?
                  (!reg46) : (reg34 ? reg42 : (8'h9f)))) : $signed(((8'haf) ?
                  $signed((7'h41)) : wire32[(1'h0):(1'h0)]))) <= reg45);
        end
      reg48 <= ((reg42[(5'h11):(4'hc)] ?
              (($signed(reg41) > (8'h9f)) ?
                  (-((8'h9c) ?
                      reg46 : reg36)) : $signed(wire31[(2'h2):(1'h1)])) : reg38) ?
          ({reg38} ?
              (reg39[(5'h10):(3'h4)] >> ((~reg46) ?
                  ((8'h9f) ?
                      wire31 : reg45) : {reg44})) : {reg35[(2'h3):(2'h2)],
                  (^$unsigned((8'hb4)))}) : $unsigned((wire32 ?
              reg39[(4'ha):(2'h3)] : {reg36, {reg35}})));
      reg49 <= reg36;
    end
  assign wire50 = ({(!$signed($signed(reg49)))} ?
                      reg49 : $signed((~&(reg34 ? $signed(reg47) : reg37))));
  assign wire51 = reg37;
  assign wire52 = (((reg36 ?
                          $unsigned((~|wire51)) : $unsigned((&(8'had)))) ^ $signed((!$signed(wire32)))) ?
                      (&{$unsigned((~&(7'h40))),
                          wire32}) : (reg43 - (((!reg33) ?
                              $unsigned(reg47) : reg49[(2'h2):(2'h2)]) ?
                          reg37[(3'h4):(1'h1)] : (~&(reg40 << wire32)))));
  assign wire53 = reg45[(5'h12):(3'h7)];
  assign wire54 = $unsigned($signed({$unsigned((reg46 >>> reg49))}));
  assign wire55 = ((^~(~&(^~{reg45}))) ?
                      reg41 : (reg47 || ({reg43[(1'h1):(1'h1)],
                          {(8'hb4)}} - (reg47[(3'h7):(1'h1)] ?
                          {wire51, reg37} : wire54))));
  assign wire56 = $signed($unsigned((~^wire53)));
  assign wire57 = (~^wire55);
  assign wire58 = ((~&(^~$unsigned($signed(reg44)))) <<< ($signed(((&wire53) ?
                          reg35[(3'h5):(2'h3)] : (wire29 ? (7'h44) : reg45))) ?
                      (|($unsigned(wire50) ? (~&(7'h43)) : reg36)) : {reg49,
                          (!$unsigned(wire51))}));
  assign wire59 = ($unsigned((reg47[(5'h10):(4'h9)] ?
                      {(wire52 ? wire29 : reg33),
                          $unsigned(reg41)} : reg44)) ^~ $signed((~^reg39[(5'h15):(5'h15)])));
  assign wire60 = (({((8'h9c) ? wire54 : $unsigned(reg35)),
                          ($unsigned(reg37) != reg46[(1'h0):(1'h0)])} ?
                      $unsigned(reg47) : (wire56 >>> reg48)) != reg37[(3'h6):(2'h2)]);
  always
    @(posedge clk) begin
      if ($signed((reg49[(2'h2):(1'h0)] * ($signed((wire54 ? reg36 : reg47)) ?
          ((reg49 == reg37) ?
              $unsigned(wire31) : $signed(reg42)) : ($signed((8'ha4)) == $signed(reg45))))))
        begin
          reg61 <= ((($signed(((8'hbe) ?
                      (7'h41) : (8'ha6))) != $signed((reg36 ~^ reg45))) ?
                  {((+(8'ha0)) ? $signed(wire55) : (wire32 >>> wire56)),
                      $unsigned(reg47[(3'h6):(1'h0)])} : $signed((~|$unsigned(reg33)))) ?
              wire60[(2'h2):(1'h1)] : (($unsigned((wire51 ?
                      wire60 : reg48)) >>> (&$signed(reg43))) ?
                  (reg33[(2'h3):(2'h2)] ?
                      ((~(8'ha9)) ?
                          (^~reg44) : (reg39 ? reg46 : (7'h41))) : ((~^reg45) ?
                          (reg49 * reg34) : (reg45 ?
                              wire55 : reg35))) : (((reg45 >>> reg46) ?
                      (&wire51) : $unsigned(reg46)) ^~ $signed($unsigned(wire60)))));
          if (reg39[(5'h12):(4'hf)])
            begin
              reg62 <= reg42;
              reg63 <= reg49[(3'h4):(2'h2)];
            end
          else
            begin
              reg62 <= $signed(wire31[(3'h4):(1'h1)]);
              reg63 <= (!($unsigned($unsigned(reg36[(2'h2):(1'h0)])) << {$signed({reg33})}));
              reg64 <= reg61;
            end
          reg65 <= $unsigned({wire29[(4'h8):(3'h4)],
              {$signed((|reg39)), ((^~wire56) && wire57[(3'h6):(3'h4)])}});
        end
      else
        begin
          if (wire57)
            begin
              reg61 <= wire53;
              reg62 <= $unsigned((&$unsigned(wire51)));
              reg63 <= (reg61[(1'h1):(1'h1)] + $signed(({$signed(reg62),
                      reg65[(2'h2):(1'h1)]} ?
                  (wire57 ? reg46 : (reg42 | reg62)) : reg61[(3'h5):(1'h0)])));
              reg64 <= $unsigned($signed(((|wire59[(5'h11):(4'hd)]) ?
                  $signed({wire52, reg63}) : ($unsigned(wire53) ?
                      reg63[(4'ha):(1'h0)] : wire52[(5'h10):(4'h8)]))));
            end
          else
            begin
              reg61 <= wire58[(1'h1):(1'h1)];
              reg62 <= (&wire32[(5'h10):(3'h4)]);
              reg63 <= $signed(reg61);
              reg64 <= {($signed(reg45) > ($unsigned((^(8'hb9))) ?
                      {(&reg43), reg44} : ((wire52 ? reg64 : reg43) ?
                          reg45 : $signed(wire52))))};
              reg65 <= reg39;
            end
          reg66 <= $signed(reg48[(3'h5):(3'h4)]);
          reg67 <= $unsigned(((+$unsigned($unsigned(reg61))) ? reg49 : wire60));
          reg68 <= (&reg48[(3'h5):(3'h5)]);
          reg69 <= $signed((wire57[(4'hc):(4'h8)] >>> reg36[(1'h1):(1'h0)]));
        end
      if ((((($unsigned(wire54) ?
                  reg43 : (|reg35)) ^ (~&reg68[(3'h4):(2'h2)])) ?
              (reg33[(3'h4):(3'h4)] ?
                  reg62[(2'h3):(2'h3)] : (wire56[(4'ha):(2'h2)] ?
                      {(8'hb0),
                          wire57} : (~|reg38))) : $unsigned(reg38[(4'ha):(3'h7)])) ?
          {$signed(($unsigned(reg38) ?
                  (reg67 >= wire52) : $signed(reg47)))} : wire56[(1'h0):(1'h0)]))
        begin
          if (($signed($unsigned($unsigned({reg42, reg63}))) ?
              $signed($unsigned(wire30[(2'h2):(1'h1)])) : (wire52 ?
                  $signed(reg40) : ({(reg40 ? wire60 : (8'ha5))} ?
                      ((reg64 >> wire30) ?
                          (reg35 != reg62) : wire30) : wire60[(1'h1):(1'h0)]))))
            begin
              reg70 <= {wire56, (reg39[(2'h3):(1'h0)] >> reg41[(4'ha):(3'h7)])};
              reg71 <= ($unsigned($unsigned((-(reg36 ? reg44 : wire29)))) ?
                  ($signed(($unsigned(reg66) ?
                      wire57 : {(8'ha4),
                          wire32})) && reg66) : reg35[(3'h4):(3'h4)]);
              reg72 <= $signed({({(reg39 ? reg33 : reg49)} ?
                      (!wire58[(3'h6):(2'h3)]) : ($signed(reg38) ?
                          ((7'h44) ? reg69 : wire51) : ((8'h9e) * wire55)))});
              reg73 <= $unsigned($unsigned((~(~^(&reg68)))));
              reg74 <= ((8'ha9) ?
                  (~&$signed((!$unsigned(wire29)))) : $signed((reg73[(4'hb):(3'h7)] ?
                      (8'ha5) : $unsigned($unsigned(reg34)))));
            end
          else
            begin
              reg70 <= reg45[(4'ha):(2'h2)];
              reg71 <= {(~|$unsigned($unsigned(reg72[(4'h8):(3'h5)]))),
                  (!$signed($signed($unsigned(reg36))))};
              reg72 <= (reg62 ?
                  (-$unsigned((8'ha8))) : ((~(+reg36[(3'h4):(2'h3)])) <<< wire30));
            end
          if ($unsigned(($unsigned(reg47[(4'ha):(3'h6)]) * reg72)))
            begin
              reg75 <= $signed((-$signed(reg69)));
              reg76 <= (8'hb7);
              reg77 <= (($signed(reg66) ~^ {$unsigned(reg34)}) ?
                  $signed(reg45[(4'ha):(3'h4)]) : {$unsigned((+$signed(wire51))),
                      wire58});
            end
          else
            begin
              reg75 <= (reg66 ?
                  (~^reg72) : (($unsigned((reg40 >> reg68)) ?
                          (|(reg65 ? wire59 : reg37)) : wire59[(4'ha):(3'h5)]) ?
                      reg72[(5'h12):(4'hb)] : reg73[(4'hd):(4'hb)]));
              reg76 <= (reg63[(3'h4):(3'h4)] - reg64[(3'h7):(3'h7)]);
              reg77 <= ((wire31 || reg73) & ((reg68 ?
                      (&(wire51 ? reg61 : reg68)) : $unsigned(reg48)) ?
                  reg67 : reg75[(1'h1):(1'h1)]));
            end
          if (wire51[(3'h6):(2'h3)])
            begin
              reg78 <= $signed($unsigned((~|reg69)));
            end
          else
            begin
              reg78 <= ($unsigned($unsigned((8'hb0))) == (8'ha3));
            end
        end
      else
        begin
          if (reg75[(3'h6):(3'h5)])
            begin
              reg70 <= reg38[(2'h2):(1'h0)];
              reg71 <= reg72[(1'h0):(1'h0)];
              reg72 <= $unsigned($signed($signed($signed($unsigned((8'h9d))))));
              reg73 <= (reg64 ^ (~^$signed(wire57[(3'h7):(3'h7)])));
              reg74 <= $unsigned((~&reg67));
            end
          else
            begin
              reg70 <= $unsigned($unsigned(reg44));
              reg71 <= $unsigned(($signed(wire53) >> (reg37 ?
                  (reg69 ? wire57 : reg48) : reg68[(4'hf):(4'hc)])));
            end
          if (wire58[(4'hc):(1'h0)])
            begin
              reg75 <= {$unsigned($unsigned($unsigned((wire51 ?
                      reg62 : reg37))))};
              reg76 <= (+(~wire53[(2'h3):(2'h3)]));
              reg77 <= (+$signed($unsigned(wire60[(3'h4):(1'h0)])));
              reg78 <= reg68;
            end
          else
            begin
              reg75 <= $unsigned((!($unsigned((reg69 ? wire50 : reg66)) ?
                  (7'h43) : $unsigned(((8'ha0) >> wire54)))));
            end
        end
      reg79 <= $unsigned($signed(reg33));
      if ($unsigned(reg37[(3'h7):(3'h7)]))
        begin
          reg80 <= (^~$signed(($unsigned((^reg79)) ?
              {reg69[(4'h9):(4'h9)], wire29} : (!$unsigned(reg70)))));
        end
      else
        begin
          reg80 <= ({reg42, reg74} ?
              (&reg43) : ({reg64[(5'h10):(4'hb)]} ?
                  ((+$signed(reg70)) ?
                      (~&(reg72 ? reg43 : wire56)) : (!(wire30 ?
                          reg68 : reg42))) : (8'hb3)));
          if (($signed((^$signed(reg74))) + reg45))
            begin
              reg81 <= {$unsigned(reg35)};
              reg82 <= ($unsigned(wire52) ?
                  $unsigned(reg39[(5'h15):(1'h1)]) : (8'ha0));
              reg83 <= (^~reg45[(3'h5):(1'h0)]);
            end
          else
            begin
              reg81 <= reg64[(2'h2):(1'h0)];
              reg82 <= reg72[(3'h6):(3'h6)];
              reg83 <= ({{reg81}} || $unsigned(reg67));
              reg84 <= wire50[(1'h0):(1'h0)];
            end
          if (reg35)
            begin
              reg85 <= wire50[(2'h3):(1'h0)];
              reg86 <= (-(~&reg46[(1'h0):(1'h0)]));
              reg87 <= reg67;
              reg88 <= (wire56[(3'h4):(3'h4)] ?
                  (reg82 - (reg75 ?
                      $unsigned($signed(wire51)) : {(!reg61)})) : (|{(reg35[(3'h5):(2'h2)] ?
                          $unsigned((8'ha7)) : reg34[(3'h5):(1'h1)])}));
              reg89 <= {{$signed((~^wire54[(4'h8):(3'h5)]))},
                  $unsigned($signed($signed($signed(reg45))))};
            end
          else
            begin
              reg85 <= reg89;
              reg86 <= {($signed({$signed(reg71), $unsigned(wire52)}) ?
                      reg84[(4'hb):(1'h1)] : $unsigned(reg88[(4'hd):(2'h3)]))};
              reg87 <= reg47;
              reg88 <= ({{((reg61 ? reg39 : (8'h9f)) ?
                          (wire59 <<< (8'h9f)) : $signed(reg67))}} * reg70);
            end
        end
      reg90 <= (reg34[(4'ha):(3'h4)] ^ (wire55[(2'h2):(1'h1)] ?
          ((reg41[(4'h8):(2'h2)] ? $unsigned(reg78) : reg39[(3'h7):(3'h4)]) ?
              {(reg48 ? reg48 : (8'hac)),
                  (reg40 >>> (7'h41))} : (|$unsigned(reg47))) : (|$unsigned((&reg71)))));
    end
  assign wire91 = ((^(((~|wire32) < $signed(reg80)) ?
                      (|{reg68,
                          reg70}) : wire58[(4'hf):(1'h1)])) < $signed((~reg41[(3'h5):(3'h4)])));
  assign wire92 = reg46;
  assign wire93 = ({reg77} < (&reg79));
  always
    @(posedge clk) begin
      reg94 <= wire30[(1'h1):(1'h0)];
      reg95 <= (($unsigned(($unsigned(reg42) ?
              (^~reg75) : (wire91 ^~ reg62))) ^ reg46) ?
          $signed($signed(($unsigned(reg39) != reg83[(1'h1):(1'h0)]))) : reg40);
      if ($unsigned($signed(wire30)))
        begin
          if (($signed((^~((reg82 ? reg38 : reg61) ?
              wire91 : (reg61 << reg69)))) && reg69[(3'h5):(3'h5)]))
            begin
              reg96 <= (8'hba);
              reg97 <= (8'had);
            end
          else
            begin
              reg96 <= $unsigned(wire57[(4'hc):(3'h5)]);
              reg97 <= $unsigned({reg95,
                  (+($signed(reg40) ^ wire56[(3'h5):(3'h5)]))});
            end
          reg98 <= wire32[(4'hf):(2'h2)];
        end
      else
        begin
          reg96 <= wire51[(4'h9):(4'h8)];
          reg97 <= (($signed(reg40) ?
              $signed(wire58) : (((~^reg83) ?
                      reg49 : (reg97 ? (7'h42) : reg68)) ?
                  {wire92[(3'h6):(2'h2)]} : (reg65 > $signed(reg75)))) < {{reg82[(1'h0):(1'h0)]}});
          if ({(($unsigned(reg49) ?
                      ($signed(reg85) && reg85[(1'h0):(1'h0)]) : reg84) ?
                  {(wire59 && {reg73,
                          reg40})} : $signed((((8'hb5) << reg47) <= reg96[(4'h9):(3'h6)]))),
              {reg42[(4'h8):(4'h8)], (-$unsigned(((8'hb9) ^ reg46)))}})
            begin
              reg98 <= reg39[(5'h14):(5'h13)];
              reg99 <= (((~&wire56[(4'ha):(4'ha)]) && $signed(reg80[(3'h5):(1'h1)])) >>> (($unsigned($unsigned((7'h43))) | $signed((reg73 ?
                  reg45 : reg69))) - (wire50[(1'h0):(1'h0)] ?
                  (reg62 <= (reg95 <<< (8'ha7))) : (+(wire59 && (8'hb9))))));
              reg100 <= (8'hbe);
              reg101 <= reg81;
              reg102 <= reg77[(4'hb):(2'h2)];
            end
          else
            begin
              reg98 <= $unsigned(reg38);
              reg99 <= (reg70 << (|$unsigned((+((8'hbf) & wire57)))));
              reg100 <= $signed((($signed($unsigned((8'hbc))) == reg99) ?
                  $unsigned({(wire51 << (8'ha9))}) : reg102[(2'h3):(1'h1)]));
            end
          if (reg101[(5'h12):(5'h11)])
            begin
              reg103 <= $unsigned($unsigned(reg70[(5'h10):(3'h6)]));
              reg104 <= reg81[(3'h4):(1'h1)];
            end
          else
            begin
              reg103 <= $unsigned($signed({reg47[(4'he):(4'h9)],
                  $unsigned($unsigned(wire55))}));
              reg104 <= {($unsigned(((reg90 * (8'ha0)) > reg36[(4'h8):(4'h8)])) != $unsigned((-$unsigned(reg98))))};
              reg105 <= $signed(wire60[(2'h2):(2'h2)]);
            end
        end
    end
  always
    @(posedge clk) begin
      if (reg100[(4'h8):(2'h2)])
        begin
          if (reg38)
            begin
              reg106 <= wire54;
              reg107 <= reg78[(1'h1):(1'h0)];
              reg108 <= reg36[(2'h3):(2'h2)];
              reg109 <= (((reg74 ?
                      {(reg63 ^ reg95),
                          $signed(reg96)} : ($unsigned(reg76) && reg97[(4'h8):(3'h6)])) ~^ (reg81[(4'ha):(3'h5)] ?
                      $unsigned(reg94) : wire29)) ?
                  ((((reg65 != wire60) ?
                          (reg33 << (8'h9d)) : wire29[(3'h6):(3'h4)]) >>> ((~reg104) ?
                          $unsigned(reg62) : reg102)) ?
                      reg71[(1'h1):(1'h0)] : reg88) : ((~^$signed(reg85[(4'h9):(4'h8)])) >> (-(wire31[(1'h1):(1'h1)] <<< (wire60 ?
                      (8'hbb) : reg107)))));
              reg110 <= {wire93[(3'h5):(2'h2)]};
            end
          else
            begin
              reg106 <= $signed((~$unsigned($unsigned((reg44 ?
                  reg43 : reg43)))));
            end
          reg111 <= ((8'ha2) ?
              wire31 : $unsigned($unsigned(($unsigned(reg84) ?
                  $signed(reg72) : (&wire51)))));
          reg112 <= reg41;
          reg113 <= reg89[(3'h4):(1'h1)];
          reg114 <= (~&{wire59});
        end
      else
        begin
          reg106 <= $unsigned(reg77);
          reg107 <= (8'hba);
          reg108 <= reg85;
        end
      reg115 <= (reg86[(3'h4):(3'h4)] ?
          (~$signed(((-reg45) ?
              $signed(reg75) : reg106[(3'h7):(1'h1)]))) : reg79[(5'h15):(1'h0)]);
    end
endmodule

module module162
#(parameter param197 = (|(+(^~((8'had) ? ((8'hb6) ? (7'h41) : (7'h43)) : {(8'hac)})))), 
parameter param198 = ((!(8'hb7)) ^ (+param197)))
(y, clk, wire167, wire166, wire165, wire164, wire163);
  output wire [(32'h133):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire167;
  input wire [(3'h5):(1'h0)] wire166;
  input wire signed [(5'h11):(1'h0)] wire165;
  input wire [(3'h7):(1'h0)] wire164;
  input wire signed [(5'h11):(1'h0)] wire163;
  wire [(5'h11):(1'h0)] wire196;
  wire [(2'h3):(1'h0)] wire195;
  wire [(3'h4):(1'h0)] wire194;
  wire [(5'h13):(1'h0)] wire193;
  wire signed [(4'hc):(1'h0)] wire187;
  wire signed [(4'hc):(1'h0)] wire186;
  wire signed [(3'h7):(1'h0)] wire185;
  wire signed [(3'h6):(1'h0)] wire184;
  wire [(3'h5):(1'h0)] wire180;
  wire signed [(4'ha):(1'h0)] wire179;
  wire signed [(2'h2):(1'h0)] wire178;
  wire signed [(5'h15):(1'h0)] wire177;
  wire signed [(5'h10):(1'h0)] wire176;
  wire [(5'h14):(1'h0)] wire175;
  wire signed [(4'h8):(1'h0)] wire174;
  wire [(4'hf):(1'h0)] wire173;
  wire signed [(4'h8):(1'h0)] wire172;
  wire [(4'ha):(1'h0)] wire171;
  wire [(5'h10):(1'h0)] wire170;
  wire signed [(3'h6):(1'h0)] wire169;
  wire signed [(3'h6):(1'h0)] wire168;
  reg signed [(5'h10):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg189 = (1'h0);
  reg [(4'he):(1'h0)] reg188 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg183 = (1'h0);
  reg [(2'h3):(1'h0)] reg182 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg181 = (1'h0);
  assign y = {wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg183,
                 reg182,
                 reg181,
                 (1'h0)};
  assign wire168 = (($unsigned((wire167 ?
                       (wire165 ?
                           wire166 : wire164) : wire164[(3'h5):(2'h3)])) & wire165[(4'ha):(4'h8)]) < $signed(($unsigned((-wire163)) ?
                       ($signed((8'hab)) ?
                           $unsigned(wire163) : wire165[(3'h4):(1'h0)]) : $unsigned((wire164 || wire166)))));
  assign wire169 = $unsigned($unsigned(wire166[(3'h4):(2'h3)]));
  assign wire170 = (({(|$signed(wire166)),
                           (^~wire163)} & ((wire167 > $unsigned(wire167)) ^ wire167)) ?
                       (~$signed($signed((wire168 ?
                           wire163 : wire164)))) : (wire168 <<< $signed(((wire166 ?
                               wire166 : wire164) ?
                           (8'h9d) : $signed(wire165)))));
  assign wire171 = wire169[(3'h5):(2'h3)];
  assign wire172 = (-$signed({($signed(wire166) <<< $unsigned(wire169))}));
  assign wire173 = (wire166 ?
                       (+wire170) : (wire168 ?
                           ($signed($unsigned((8'ha7))) ?
                               $unsigned(wire169[(3'h6):(3'h4)]) : $unsigned((!(7'h40)))) : $signed((wire163 < {wire163}))));
  assign wire174 = wire163;
  assign wire175 = ((^~$unsigned(wire168)) ?
                       ($signed(wire164) ?
                           ((wire174[(1'h0):(1'h0)] >> $unsigned(wire169)) ^~ ($unsigned((8'hb9)) >> (wire168 || (8'hb2)))) : (wire173 ?
                               (wire169 ^~ $signed(wire172)) : ({wire173,
                                       wire164} ?
                                   (wire173 ?
                                       wire163 : wire165) : wire165[(2'h2):(2'h2)]))) : $signed(wire163));
  assign wire176 = wire165;
  assign wire177 = wire175[(3'h5):(3'h5)];
  assign wire178 = wire164[(1'h1):(1'h1)];
  assign wire179 = (~&((wire177[(4'he):(3'h5)] ?
                           ($signed(wire172) * wire178) : ((8'h9f) ?
                               $unsigned((8'ha2)) : (wire163 >>> wire163))) ?
                       wire163 : wire165));
  assign wire180 = wire165;
  always
    @(posedge clk) begin
      reg181 <= wire173;
      reg182 <= $unsigned((~&{(wire180[(1'h0):(1'h0)] ?
              (~wire164) : $unsigned(wire172))}));
      reg183 <= {{{wire166, wire173[(4'hb):(1'h0)]}}, wire180};
    end
  assign wire184 = (((((wire173 * wire173) >>> wire180[(2'h2):(2'h2)]) - wire164) ?
                       wire163[(1'h1):(1'h1)] : (((^~wire166) ^ $unsigned(wire173)) == $unsigned(wire180[(2'h2):(1'h0)]))) >= $signed((8'haa)));
  assign wire185 = (|wire176);
  assign wire186 = ((({{wire169}} ?
                           wire184[(3'h6):(3'h4)] : ($unsigned(wire177) | $signed((8'hbe)))) ?
                       (wire163[(2'h3):(2'h2)] ?
                           {(|(8'hb2)),
                               wire179[(1'h1):(1'h1)]} : reg183) : $unsigned((((8'hac) ?
                           wire174 : wire170) + (reg183 ?
                           (8'had) : wire164)))) <= wire167);
  assign wire187 = ($unsigned($signed({wire167})) * (+wire171[(3'h7):(3'h6)]));
  always
    @(posedge clk) begin
      reg188 <= $unsigned(wire186);
      reg189 <= ((($unsigned($signed(wire178)) ?
              (7'h40) : wire175[(3'h6):(2'h3)]) ?
          reg182[(2'h3):(1'h1)] : wire175[(4'h9):(4'h8)]) * $signed(wire168[(1'h1):(1'h0)]));
      reg190 <= $signed(wire172);
      reg191 <= wire177[(4'hc):(3'h6)];
      reg192 <= ((|($signed((&wire178)) << {wire168[(3'h5):(2'h3)],
              $signed(reg190)})) ?
          $signed(wire174[(3'h5):(2'h2)]) : (+wire172));
    end
  assign wire193 = wire187;
  assign wire194 = reg189[(4'h9):(3'h6)];
  assign wire195 = $unsigned((wire165 ?
                       (8'hb6) : ($signed($unsigned(reg183)) || ({wire164,
                           wire186} | $signed(wire180)))));
  assign wire196 = {reg189[(3'h7):(3'h5)],
                       {$unsigned(($unsigned(wire179) ?
                               (wire184 ? reg190 : wire194) : wire184))}};
endmodule
