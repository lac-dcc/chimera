module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire188;
  wire [(3'h7):(1'h0)] wire187;
  wire signed [(3'h6):(1'h0)] wire186;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire184;
  assign y = {wire188, wire187, wire186, wire5, wire6, wire184, (1'h0)};
  assign wire5 = ((^({wire0, $unsigned(wire3)} & wire1[(3'h5):(1'h0)])) ?
                     (wire3[(4'h9):(3'h6)] ?
                         wire1[(4'h9):(4'h9)] : (wire2[(4'hf):(4'h8)] ?
                             wire4[(1'h0):(1'h0)] : (wire4[(2'h3):(2'h2)] ~^ {wire4,
                                 wire4}))) : $signed((wire2 ?
                         (-wire2[(4'hb):(4'h8)]) : {$signed(wire4),
                             $signed(wire3)})));
  assign wire6 = wire2[(3'h5):(1'h0)];
  module7 #() modinst185 (.wire12(wire3), .wire8(wire2), .clk(clk), .wire10(wire6), .y(wire184), .wire9(wire1), .wire11(wire0));
  assign wire186 = $signed($unsigned(($signed(((8'ha2) ?
                       wire2 : wire5)) << ((wire5 * wire0) ?
                       wire184[(4'h9):(1'h1)] : wire1))));
  assign wire187 = ((~({(wire1 && (8'hbd))} ?
                       $signed((!wire1)) : wire4)) < (8'ha2));
  assign wire188 = wire1;
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire [(5'h11):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire183;
  wire [(5'h10):(1'h0)] wire182;
  wire signed [(5'h15):(1'h0)] wire181;
  wire [(5'h10):(1'h0)] wire179;
  wire [(4'hd):(1'h0)] wire151;
  wire signed [(5'h14):(1'h0)] wire150;
  wire signed [(5'h11):(1'h0)] wire148;
  wire signed [(4'hd):(1'h0)] wire131;
  wire [(5'h13):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire13;
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  assign y = {wire183,
                 wire182,
                 wire181,
                 wire179,
                 wire151,
                 wire150,
                 wire148,
                 wire131,
                 wire39,
                 wire15,
                 wire13,
                 reg14,
                 (1'h0)};
  assign wire13 = $signed((({$signed((8'h9f)),
                          wire8[(2'h3):(1'h0)]} <= (wire8[(3'h6):(1'h0)] == $unsigned(wire9))) ?
                      ($unsigned($unsigned(wire11)) ?
                          {(-(8'hbc)),
                              $signed(wire10)} : $unsigned((^~wire12))) : wire9[(3'h4):(3'h4)]));
  always
    @(posedge clk) begin
      reg14 <= $signed($unsigned((((|(8'h9c)) ?
              {wire8, wire9} : $unsigned((8'h9c))) ?
          $signed((|(8'haf))) : ((wire13 == wire11) ?
              (~|wire8) : (wire11 ? wire8 : wire9)))));
    end
  assign wire15 = wire11;
  module16 #() modinst40 (wire39, clk, wire15, wire8, reg14, wire11, wire9);
  module41 #() modinst132 (wire131, clk, wire8, wire39, wire9, wire12);
  module133 #() modinst149 (wire148, clk, wire8, wire12, wire15, wire131);
  assign wire150 = {{($signed((wire39 ?
                               wire39 : reg14)) <= {reg14[(1'h0):(1'h0)],
                               $signed(wire8)})}};
  assign wire151 = (((~|{{wire15},
                           (~wire12)}) & ($unsigned($unsigned(reg14)) & (^~$unsigned((8'hb1))))) ?
                       $signed($unsigned($signed($unsigned(wire15)))) : wire148[(3'h5):(1'h0)]);
  module152 #() modinst180 (.wire153(wire11), .y(wire179), .clk(clk), .wire154(wire10), .wire156(wire150), .wire155(wire39));
  assign wire181 = $unsigned((wire151 ?
                       ($unsigned($signed(wire11)) >> wire39[(5'h11):(1'h0)]) : (wire13 ?
                           ($signed(reg14) ?
                               wire11[(4'ha):(2'h3)] : {wire131,
                                   wire131}) : wire151)));
  assign wire182 = $signed({wire150[(5'h14):(4'hb)],
                       ($signed({wire8, (8'hb7)}) ?
                           ((8'h9d) ? $signed(wire148) : wire12) : wire8)});
  assign wire183 = wire12;
endmodule

module module152  (y, clk, wire156, wire155, wire154, wire153);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire156;
  input wire [(2'h3):(1'h0)] wire155;
  input wire [(4'h9):(1'h0)] wire154;
  input wire signed [(5'h11):(1'h0)] wire153;
  wire [(4'hf):(1'h0)] wire178;
  wire signed [(3'h6):(1'h0)] wire177;
  wire signed [(3'h4):(1'h0)] wire176;
  wire signed [(5'h15):(1'h0)] wire175;
  wire [(3'h5):(1'h0)] wire162;
  wire [(4'hc):(1'h0)] wire161;
  wire signed [(4'hb):(1'h0)] wire160;
  wire signed [(3'h6):(1'h0)] wire159;
  wire signed [(5'h11):(1'h0)] wire158;
  wire [(3'h4):(1'h0)] wire157;
  reg signed [(5'h11):(1'h0)] reg174 = (1'h0);
  reg [(5'h10):(1'h0)] reg173 = (1'h0);
  reg [(4'hc):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg171 = (1'h0);
  reg [(3'h7):(1'h0)] reg170 = (1'h0);
  reg [(4'ha):(1'h0)] reg169 = (1'h0);
  reg [(4'hd):(1'h0)] reg168 = (1'h0);
  reg [(4'h8):(1'h0)] reg167 = (1'h0);
  reg [(4'h9):(1'h0)] reg166 = (1'h0);
  reg [(3'h7):(1'h0)] reg165 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg163 = (1'h0);
  assign y = {wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 (1'h0)};
  assign wire157 = (~^$signed(((^~(wire153 ^~ wire156)) ? wire155 : (8'ha9))));
  assign wire158 = wire154;
  assign wire159 = {wire156,
                       (~^(!{wire157[(3'h4):(2'h2)],
                           (wire157 ? wire155 : wire154)}))};
  assign wire160 = wire156[(4'h8):(1'h0)];
  assign wire161 = $signed($signed($signed(wire153[(5'h10):(4'ha)])));
  assign wire162 = wire156;
  always
    @(posedge clk) begin
      reg163 <= wire157;
      if (wire160)
        begin
          if (wire161)
            begin
              reg164 <= (($unsigned($signed((wire155 ? reg163 : wire162))) ?
                  (wire162[(1'h0):(1'h0)] ?
                      (|wire161[(1'h1):(1'h0)]) : ((wire153 ?
                              wire156 : wire154) ?
                          {wire159, wire158} : {wire156,
                              wire160})) : $unsigned($signed($unsigned(wire158)))) >> {(wire154 ?
                      $signed((!(8'hbc))) : ((wire157 ? wire159 : wire158) ?
                          (^(7'h41)) : (8'ha1))),
                  (($signed(wire154) <= wire160) * $signed(((8'hbb) && (8'ha2))))});
              reg165 <= wire156[(2'h2):(1'h0)];
              reg166 <= $signed(reg165);
              reg167 <= {(^~$signed({(^~wire156)})), wire157[(2'h2):(1'h1)]};
              reg168 <= reg167;
            end
          else
            begin
              reg164 <= $unsigned($unsigned($unsigned(($signed(wire161) ?
                  (wire153 ? wire159 : wire154) : reg166))));
              reg165 <= (wire162[(3'h5):(1'h0)] ?
                  (^(~|$unsigned({wire156}))) : wire155);
            end
          reg169 <= {reg163};
        end
      else
        begin
          reg164 <= (8'h9d);
          if (({wire159, $signed(wire157)} > {((~^wire154[(3'h5):(3'h5)]) ?
                  wire159[(2'h3):(1'h0)] : $unsigned(((8'hb3) ?
                      (8'hbd) : (8'hb5)))),
              (wire155[(2'h2):(1'h0)] ~^ $unsigned(reg167))}))
            begin
              reg165 <= $unsigned((+$signed((|(^wire158)))));
              reg166 <= reg168[(1'h1):(1'h0)];
              reg167 <= $signed(wire153[(2'h2):(1'h1)]);
            end
          else
            begin
              reg165 <= {reg168, (!$unsigned($signed((+(8'ha2)))))};
              reg166 <= $signed(((~|wire157) ? wire160 : wire156));
              reg167 <= ({reg166} ?
                  $unsigned($unsigned((8'hae))) : reg169[(3'h5):(2'h2)]);
              reg168 <= $signed((|wire157[(2'h3):(1'h1)]));
            end
          reg169 <= ({reg168[(2'h3):(2'h2)],
              wire157} < $unsigned($signed($signed(wire160[(4'h9):(2'h3)]))));
          if (($unsigned(wire160[(3'h5):(1'h1)]) != (({wire153} >>> {reg166[(1'h0):(1'h0)]}) && wire161)))
            begin
              reg170 <= (&((((wire159 ? (7'h43) : wire153) != reg165) ?
                      (wire156 ^ {wire158}) : $signed(wire158)) ?
                  $signed((wire156 ? (+wire161) : (8'h9f))) : {((wire162 ?
                          (8'hb6) : wire158) << {wire162})}));
              reg171 <= $unsigned({$unsigned($unsigned(wire162[(2'h3):(1'h1)]))});
              reg172 <= {$unsigned((wire153[(4'hf):(2'h2)] ?
                      {(wire153 ^ wire153),
                          (reg163 << reg170)} : $unsigned({wire162}))),
                  wire162[(3'h5):(3'h4)]};
              reg173 <= wire162;
            end
          else
            begin
              reg170 <= ($signed(($signed((~&wire156)) ?
                  (|(&reg171)) : reg168[(4'h8):(1'h0)])) - (wire160 & {((wire157 >= reg168) != reg171[(4'h9):(3'h6)]),
                  reg164}));
              reg171 <= $unsigned($unsigned($signed($signed((~|wire154)))));
              reg172 <= $signed($unsigned(($signed({reg163}) <<< wire158[(4'he):(4'ha)])));
              reg173 <= $signed(($signed((~^$signed(reg163))) ?
                  (($unsigned(reg166) && (wire159 ?
                      reg167 : wire158)) >= reg170) : (^$unsigned((reg172 ~^ reg166)))));
              reg174 <= (((8'ha8) * reg173[(4'hf):(3'h6)]) > $unsigned(reg164[(1'h1):(1'h0)]));
            end
        end
    end
  assign wire175 = (~^$signed((8'hbf)));
  assign wire176 = (8'hb4);
  assign wire177 = $signed(wire160[(2'h2):(1'h0)]);
  assign wire178 = (({$unsigned($unsigned(reg169)),
                       ((wire177 ?
                           reg171 : wire157) ^~ reg166[(3'h5):(2'h2)])} == $signed(($signed(wire154) ?
                       (~(8'hb9)) : $signed(wire159)))) && reg170);
endmodule

module module133  (y, clk, wire137, wire136, wire135, wire134);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire137;
  input wire signed [(4'he):(1'h0)] wire136;
  input wire signed [(5'h11):(1'h0)] wire135;
  input wire [(3'h6):(1'h0)] wire134;
  wire signed [(5'h13):(1'h0)] wire147;
  wire [(3'h7):(1'h0)] wire142;
  wire [(3'h5):(1'h0)] wire141;
  wire signed [(2'h2):(1'h0)] wire140;
  wire [(5'h12):(1'h0)] wire139;
  wire signed [(5'h12):(1'h0)] wire138;
  reg [(5'h14):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg145 = (1'h0);
  reg [(5'h10):(1'h0)] reg144 = (1'h0);
  reg [(4'ha):(1'h0)] reg143 = (1'h0);
  assign y = {wire147,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 (1'h0)};
  assign wire138 = wire135[(4'hf):(1'h1)];
  assign wire139 = $unsigned(wire137);
  assign wire140 = {wire137[(3'h7):(2'h2)],
                       $unsigned(wire135[(5'h10):(5'h10)])};
  assign wire141 = $unsigned(((({wire139, (8'ha9)} <= $signed(wire135)) ?
                       ($signed(wire137) ?
                           (|wire137) : wire140[(1'h0):(1'h0)]) : (+wire137)) ^ (($unsigned(wire134) ?
                           (wire139 ? wire137 : wire140) : wire136) ?
                       {wire134[(3'h5):(3'h5)], $signed(wire136)} : wire136)));
  assign wire142 = (~($unsigned(((wire141 - wire137) ?
                       (wire138 ?
                           (8'h9e) : wire135) : (wire137 | (7'h44)))) <= {$unsigned({wire139,
                           (8'hbb)}),
                       wire135[(3'h7):(3'h4)]}));
  always
    @(posedge clk) begin
      reg143 <= ((~|(((wire136 ? wire136 : wire137) ?
              $signed(wire137) : (wire139 ? wire135 : (8'ha0))) ?
          wire139[(4'h9):(3'h6)] : $signed($signed(wire141)))) && wire135[(2'h2):(2'h2)]);
      reg144 <= {$signed((~^((&(8'hbb)) | {(8'ha7), wire141}))),
          $unsigned($signed({(wire141 ? wire141 : wire136),
              wire140[(1'h0):(1'h0)]}))};
      reg145 <= (8'hab);
      reg146 <= $unsigned(($signed(((&wire135) ?
              $unsigned(reg143) : ((8'h9e) >> reg144))) ?
          $signed(wire141[(3'h5):(1'h0)]) : wire138[(1'h0):(1'h0)]));
    end
  assign wire147 = ((!wire137) << (8'hb7));
endmodule

module module41
#(parameter param129 = ((!((~^((7'h44) && (8'hbf))) * ((~|(8'ha9)) ? (^~(8'ha6)) : ((8'hbc) ? (8'hbc) : (7'h41))))) ? {(((~(8'h9e)) | ((8'hb2) ? (7'h42) : (8'hae))) ? (((8'hbb) << (8'ha5)) ? ((8'ha8) ? (8'hb3) : (8'hab)) : ((8'hb9) <= (8'ha3))) : ((^~(8'hb1)) ? (8'hae) : ((8'ha5) ? (8'hb0) : (7'h40))))} : (((^~(^~(8'hb3))) ? (~&(~(8'hae))) : (8'hb0)) < ((((8'hb0) & (8'hbf)) ? {(8'hb3)} : (~(8'h9d))) ? (^{(8'h9d), (8'haa)}) : {(!(8'hbc))}))), 
parameter param130 = (+({({param129} ? param129 : param129)} ? (8'ha1) : param129)))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h3e7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire45;
  input wire signed [(5'h13):(1'h0)] wire44;
  input wire [(4'he):(1'h0)] wire43;
  input wire [(2'h2):(1'h0)] wire42;
  wire signed [(3'h4):(1'h0)] wire127;
  wire [(4'hb):(1'h0)] wire126;
  wire signed [(3'h4):(1'h0)] wire113;
  wire [(5'h13):(1'h0)] wire112;
  wire signed [(5'h11):(1'h0)] wire111;
  wire signed [(5'h11):(1'h0)] wire110;
  wire [(4'ha):(1'h0)] wire109;
  wire [(4'hf):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire69;
  wire [(4'hf):(1'h0)] wire68;
  wire signed [(4'h8):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire65;
  wire signed [(4'he):(1'h0)] wire46;
  reg [(4'h9):(1'h0)] reg128 = (1'h0);
  reg [(2'h2):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg121 = (1'h0);
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(3'h5):(1'h0)] reg119 = (1'h0);
  reg [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(4'h9):(1'h0)] reg117 = (1'h0);
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  reg [(5'h14):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg114 = (1'h0);
  reg [(4'he):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg107 = (1'h0);
  reg signed [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(3'h5):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg103 = (1'h0);
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg101 = (1'h0);
  reg [(5'h11):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  reg [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(4'hb):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg93 = (1'h0);
  reg [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg85 = (1'h0);
  reg [(4'hd):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg82 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(3'h6):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire66,
                 wire65,
                 wire46,
                 reg128,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
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
                 reg67,
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
                 (1'h0)};
  assign wire46 = {$unsigned((($unsigned(wire42) ? wire43 : wire42) ?
                          $signed(wire44) : wire42)),
                      ({(8'hae)} - wire45)};
  always
    @(posedge clk) begin
      if ($signed({($signed((wire46 ? wire45 : wire45)) != ((wire44 ?
              (8'ha4) : wire44) ^ wire46[(4'h9):(2'h3)]))}))
        begin
          if (((!{wire45}) >> (wire42[(1'h1):(1'h1)] ?
              $unsigned($unsigned($signed(wire44))) : (&(-(wire45 ?
                  wire42 : wire42))))))
            begin
              reg47 <= $signed((8'ha8));
              reg48 <= $signed(wire43[(2'h3):(2'h2)]);
              reg49 <= $unsigned((|($unsigned($signed((8'hb4))) + {$unsigned(wire45)})));
              reg50 <= ($signed(reg49) <<< (8'ha9));
              reg51 <= wire44[(1'h0):(1'h0)];
            end
          else
            begin
              reg47 <= reg49;
            end
          reg52 <= $unsigned($signed((-(8'hb7))));
          reg53 <= wire45;
          reg54 <= $unsigned($unsigned($signed(((^(8'ha5)) ?
              $signed(wire46) : $signed(wire46)))));
          reg55 <= reg48;
        end
      else
        begin
          reg47 <= reg55[(3'h5):(1'h0)];
          if ($signed($unsigned($signed($unsigned((~^reg53))))))
            begin
              reg48 <= (~|(reg53 ?
                  (~&reg55) : $unsigned((reg53[(3'h4):(2'h2)] ^~ reg52))));
              reg49 <= ((($unsigned(reg47[(2'h2):(1'h1)]) <<< $unsigned($unsigned(reg50))) ?
                  $signed(($signed(reg55) ?
                      (wire43 ? reg48 : reg55) : (wire45 || wire42))) : {reg51,
                      ($unsigned(wire42) ?
                          (8'hb4) : {reg48, reg47})}) <= reg48[(2'h3):(1'h1)]);
            end
          else
            begin
              reg48 <= (~^(~&wire43));
              reg49 <= (reg50[(3'h4):(2'h3)] && reg55);
              reg50 <= reg49;
            end
        end
      reg56 <= (8'ha4);
      reg57 <= $signed((!wire43));
      if ($signed(($unsigned($unsigned((!wire44))) | (reg54 ?
          $unsigned($unsigned((7'h41))) : wire44[(4'hc):(1'h1)]))))
        begin
          reg58 <= $unsigned($unsigned(wire45));
          reg59 <= reg53;
          reg60 <= $signed(wire43);
          reg61 <= {(~|($signed(reg55) ?
                  (reg59[(3'h6):(3'h6)] | reg49) : (((8'hbd) || (8'hbe)) ?
                      (wire42 + reg57) : $signed(reg56))))};
        end
      else
        begin
          reg58 <= (&(reg54[(2'h2):(1'h0)] ?
              $unsigned((wire45 ?
                  $unsigned((8'ha5)) : $unsigned(reg48))) : reg49));
          reg59 <= $signed((^(&$signed({reg59}))));
          if (reg56[(5'h12):(4'h9)])
            begin
              reg60 <= ($unsigned($unsigned(($unsigned(reg52) != $unsigned(reg57)))) | reg47[(2'h2):(2'h2)]);
              reg61 <= (~|{reg60, reg54[(1'h1):(1'h1)]});
              reg62 <= $signed((($unsigned({reg48, reg50}) ?
                  $unsigned(reg49) : $unsigned((reg59 ?
                      reg57 : wire44))) || ({$unsigned(reg61),
                  $signed(reg48)} | $unsigned($signed(reg57)))));
              reg63 <= $unsigned(((reg49[(3'h6):(1'h1)] == $signed((&reg59))) ?
                  ((|reg56[(4'hd):(1'h0)]) ?
                      (reg60[(4'ha):(2'h2)] <<< (reg52 <<< reg49)) : reg53[(1'h0):(1'h0)]) : $unsigned(reg58)));
            end
          else
            begin
              reg60 <= $unsigned(((reg53 ?
                  (^~(reg59 ?
                      wire45 : wire46)) : $unsigned($unsigned(reg62))) >= ((8'hb7) ^ $signed(wire46))));
            end
          reg64 <= (($signed((8'ha3)) ?
                  (^~(|wire42)) : $unsigned(($signed(wire44) << {wire42,
                      reg58}))) ?
              wire44[(4'hb):(1'h0)] : (wire42[(2'h2):(1'h0)] >>> (|$signed((~reg49)))));
        end
    end
  assign wire65 = $unsigned((~($signed(reg53) > $unsigned(wire44[(4'h8):(1'h1)]))));
  assign wire66 = {reg60[(4'h8):(3'h7)],
                      ($signed((-(wire46 > wire43))) ?
                          $signed(((reg63 ? (8'hba) : (8'haf)) ?
                              $unsigned(wire43) : reg47)) : ($signed($signed(reg56)) ~^ $unsigned(((8'ha6) ?
                              reg51 : reg47))))};
  always
    @(posedge clk) begin
      reg67 <= reg57[(5'h11):(1'h1)];
    end
  assign wire68 = ($unsigned($signed(reg51)) ?
                      ((reg64[(4'h9):(3'h6)] + wire66[(1'h1):(1'h1)]) != (reg56 + ($signed(reg48) ?
                          wire66[(1'h0):(1'h0)] : reg54[(1'h0):(1'h0)]))) : ($unsigned($unsigned((~|reg55))) ?
                          (reg55 ?
                              (^wire66) : ((wire46 | (7'h44)) ?
                                  reg62[(4'he):(1'h0)] : (reg51 > wire44))) : $signed(wire42[(1'h0):(1'h0)])));
  assign wire69 = (|(($signed((reg60 ? (8'ha8) : wire66)) ?
                      ((8'ha1) * (^reg48)) : reg49) < wire44[(1'h0):(1'h0)]));
  assign wire70 = {$signed($unsigned((^~(reg48 ? reg60 : reg62))))};
  assign wire71 = $unsigned(reg61);
  always
    @(posedge clk) begin
      reg72 <= $signed(wire44);
      if (({reg58[(2'h2):(2'h2)],
          ($signed(wire45[(1'h0):(1'h0)]) >> reg72)} & (-reg52)))
        begin
          if ((~$signed(wire45)))
            begin
              reg73 <= (($unsigned(($signed(reg50) ?
                  (reg50 ? reg72 : reg50) : {reg63,
                      (8'h9d)})) * $unsigned($signed($unsigned((8'hbb))))) || reg47[(2'h2):(2'h2)]);
              reg74 <= {$signed($unsigned(reg54[(1'h0):(1'h0)])), reg62};
            end
          else
            begin
              reg73 <= $signed($unsigned(reg59[(2'h3):(1'h0)]));
            end
          if (((reg58[(3'h4):(2'h3)] ? reg67 : reg67) ?
              $unsigned((((~&wire46) ? wire70[(5'h12):(1'h1)] : (^wire71)) ?
                  $signed($unsigned(reg49)) : reg49)) : $unsigned((~&{(wire46 & reg48)}))))
            begin
              reg75 <= (~{wire42,
                  $signed((reg74[(3'h6):(3'h6)] & $signed(wire69)))});
              reg76 <= $signed({(-((reg75 & reg67) ?
                      {(8'ha8), reg60} : $unsigned((8'hbc)))),
                  $unsigned(($unsigned(wire69) << reg75))});
              reg77 <= $unsigned({(reg72[(4'hd):(3'h6)] ?
                      (wire46[(2'h2):(1'h1)] & (wire70 == reg67)) : (reg57[(5'h13):(5'h12)] | (~^reg73)))});
              reg78 <= wire71[(2'h3):(1'h1)];
              reg79 <= (+reg52[(3'h6):(3'h5)]);
            end
          else
            begin
              reg75 <= (7'h42);
              reg76 <= reg63;
              reg77 <= {((~&$signed(reg59)) ?
                      $unsigned(reg54) : (~&$signed($signed(reg61)))),
                  wire66[(1'h1):(1'h0)]};
              reg78 <= $unsigned($signed((!wire44)));
              reg79 <= $unsigned((({{wire66}} ?
                  (~reg53) : (((7'h43) << wire70) + reg48[(3'h5):(1'h0)])) ^ (^~(8'ha8))));
            end
        end
      else
        begin
          reg73 <= reg62;
          reg74 <= {($signed(reg77[(1'h0):(1'h0)]) ?
                  $signed(({wire70} >>> reg78)) : (reg47[(2'h2):(1'h1)] ?
                      $unsigned(reg58) : $signed((wire42 ^ (8'hb3)))))};
          if ({(reg59[(3'h6):(1'h0)] >= wire42),
              $signed($signed($unsigned((reg58 ? (8'h9c) : wire65))))})
            begin
              reg75 <= ({$signed(($unsigned(reg79) ? (~wire71) : (8'ha4))),
                  $unsigned($unsigned({reg58}))} ~^ (reg53 >>> ((reg62[(5'h13):(4'h9)] && (reg61 >> reg52)) ?
                  reg59 : $unsigned($signed((8'hb1))))));
              reg76 <= reg77[(3'h4):(1'h0)];
              reg77 <= $unsigned((wire42[(2'h2):(1'h0)] ?
                  wire45 : ((~{reg77, reg64}) ~^ ((wire65 ?
                      reg57 : reg72) < {reg67}))));
              reg78 <= ((((wire71[(2'h3):(2'h2)] >>> (wire69 ?
                          reg75 : reg59)) <= (8'hb9)) ?
                      (!((reg77 ?
                          (8'ha0) : reg79) ^ (+reg73))) : (-reg78[(5'h10):(4'hf)])) ?
                  reg63[(1'h0):(1'h0)] : (&$unsigned(((reg49 >= wire66) ?
                      {reg74, wire71} : reg74[(2'h2):(1'h0)]))));
              reg79 <= reg79[(4'he):(3'h4)];
            end
          else
            begin
              reg75 <= (^$unsigned((&$signed((reg72 ? (8'hb0) : reg55)))));
              reg76 <= $signed({wire69, wire71});
              reg77 <= reg47[(3'h4):(2'h3)];
            end
          reg80 <= {($unsigned($signed(reg49[(5'h15):(5'h12)])) <= wire66)};
          reg81 <= $signed(reg72[(4'hc):(4'hc)]);
        end
      if (((~^reg57) >>> (|(|reg67[(1'h0):(1'h0)]))))
        begin
          reg82 <= ($signed(((~{reg48, reg57}) && $signed((reg74 ^~ wire68)))) ?
              $unsigned(reg76[(1'h1):(1'h0)]) : (~|{$signed($signed(reg72))}));
          if ((({$signed((&reg59))} ? wire65 : wire65) && reg76))
            begin
              reg83 <= (8'hac);
              reg84 <= (reg63 * {$unsigned((!wire42[(2'h2):(2'h2)]))});
            end
          else
            begin
              reg83 <= reg64;
              reg84 <= $unsigned(($signed((|(wire46 >> (8'hb3)))) | reg73[(4'h9):(1'h0)]));
            end
        end
      else
        begin
          reg82 <= {reg73, wire44};
          reg83 <= ((reg79 ? $signed((~^$signed(reg64))) : reg84) ?
              $signed($unsigned($signed((reg76 <= wire66)))) : wire65);
          if (wire42[(1'h1):(1'h1)])
            begin
              reg84 <= ($unsigned($signed(($signed(reg76) ?
                  (~reg47) : wire69[(5'h11):(3'h5)]))) > $signed(({reg84[(4'hc):(2'h2)]} ?
                  (reg74[(2'h2):(1'h1)] ?
                      (~|reg64) : (wire71 ^ reg84)) : (wire45[(4'he):(3'h5)] ?
                      $unsigned(wire68) : reg61[(3'h4):(1'h0)]))));
              reg85 <= $unsigned((8'hba));
              reg86 <= $signed($unsigned(($unsigned({wire71, reg51}) ?
                  reg81[(1'h1):(1'h0)] : reg81)));
              reg87 <= (~|(reg67 ?
                  $signed($unsigned($signed(reg79))) : wire68[(3'h7):(1'h0)]));
            end
          else
            begin
              reg84 <= ((+reg76) - reg48);
              reg85 <= {((+reg79[(2'h3):(1'h0)]) ?
                      {((&wire66) ? ((8'hb0) ? reg48 : reg75) : $signed(reg76)),
                          (&wire68)} : reg78[(3'h6):(1'h0)])};
              reg86 <= reg73[(3'h6):(1'h0)];
              reg87 <= $unsigned(($signed({$unsigned(reg77),
                  (reg49 ? reg62 : reg62)}) == {$unsigned($unsigned(reg72))}));
            end
          if ((($signed((7'h41)) ?
                  $signed((!reg86[(3'h7):(3'h5)])) : {(wire45 * (^wire66)),
                      $unsigned(reg77)}) ?
              (($unsigned(wire65) ? reg52 : (~|reg67)) ?
                  ($unsigned($unsigned(reg73)) ?
                      ($unsigned(wire68) < (~^reg54)) : $signed(reg54[(2'h2):(2'h2)])) : reg49) : $signed($unsigned({$signed(wire42)}))))
            begin
              reg88 <= (reg72[(3'h6):(2'h3)] >> ($unsigned($unsigned((reg52 ?
                  reg87 : reg59))) ~^ $signed((~|reg81[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg88 <= ({(^~($unsigned(reg57) | reg48[(2'h2):(2'h2)])),
                      $signed((~reg59[(2'h2):(1'h0)]))} ?
                  (-(^$unsigned({reg80,
                      reg54}))) : $signed($unsigned((8'ha6))));
              reg89 <= (8'hbd);
              reg90 <= (reg73[(4'hd):(3'h4)] >> {(reg53[(1'h1):(1'h1)] != reg56[(4'he):(3'h5)]),
                  ((wire71[(1'h0):(1'h0)] < reg52[(4'hb):(1'h0)]) ?
                      $signed($signed(reg79)) : $unsigned((wire68 && reg57)))});
              reg91 <= $signed(($unsigned($unsigned((wire45 ?
                  (8'hab) : wire68))) >>> ({((8'ha2) >>> reg50),
                      $unsigned(reg57)} ?
                  $unsigned(reg52[(4'hb):(3'h6)]) : $signed($signed((8'hae))))));
            end
          reg92 <= $unsigned({wire69, reg91[(3'h5):(2'h2)]});
        end
      if ($signed($unsigned((reg82[(2'h3):(2'h3)] >= $unsigned(reg48)))))
        begin
          reg93 <= (7'h42);
          reg94 <= $unsigned(reg63[(2'h3):(2'h3)]);
          if (wire42[(1'h0):(1'h0)])
            begin
              reg95 <= reg54;
              reg96 <= ({($signed(reg93) == (^(+reg52))),
                      (^~reg73[(3'h7):(1'h0)])} ?
                  reg52[(3'h4):(1'h0)] : {$signed((8'hb3))});
              reg97 <= wire68;
            end
          else
            begin
              reg95 <= (&(7'h41));
              reg96 <= (((reg77[(2'h2):(1'h1)] << reg51) ?
                  (+($unsigned(reg50) & {wire71,
                      wire71})) : reg53) * reg95[(4'h8):(1'h0)]);
              reg97 <= reg63[(1'h1):(1'h1)];
              reg98 <= $unsigned($signed(reg48[(4'hc):(4'hc)]));
            end
          if (wire44)
            begin
              reg99 <= (~{$unsigned(((reg76 <= reg63) ?
                      wire71 : $signed(wire70)))});
              reg100 <= (8'ha6);
              reg101 <= $unsigned($signed($signed({$signed((8'hbd)),
                  $signed(reg95)})));
              reg102 <= reg58[(3'h5):(3'h5)];
              reg103 <= {{(+((&reg91) < $signed(reg91)))},
                  reg76[(1'h1):(1'h0)]};
            end
          else
            begin
              reg99 <= {(~^($unsigned((&reg82)) ^ reg56[(4'hc):(2'h3)])),
                  reg98[(5'h12):(4'hf)]};
            end
        end
      else
        begin
          reg93 <= (^$signed($signed($signed(wire65[(4'hd):(4'h9)]))));
          reg94 <= {reg47[(2'h3):(2'h3)]};
          reg95 <= (($signed((8'hae)) ?
                  ((~|(wire45 ^ reg76)) ?
                      ((reg75 ?
                          reg94 : (8'hbd)) || (8'ha9)) : $unsigned((reg56 | reg84))) : {$unsigned((~reg60))}) ?
              $unsigned($unsigned($signed($unsigned(reg60)))) : ({reg49[(2'h3):(2'h2)]} << $unsigned($unsigned(wire71))));
          reg96 <= (reg87 ?
              $signed({$signed($unsigned(reg62))}) : $signed(reg76[(2'h3):(1'h0)]));
          if ({((($unsigned(wire42) != (8'h9d)) ?
                      {{reg95, wire66}} : $unsigned((reg96 ? reg99 : reg55))) ?
                  {(~^reg55)} : {reg54[(1'h0):(1'h0)]}),
              $unsigned(wire46)})
            begin
              reg97 <= $signed({reg92});
              reg98 <= reg102;
              reg99 <= (((+$signed($unsigned(reg94))) ?
                  (-reg57[(3'h6):(1'h1)]) : $unsigned((~&reg98))) ^~ reg82);
              reg100 <= reg67[(1'h0):(1'h0)];
            end
          else
            begin
              reg97 <= {$unsigned(({(~|wire71), (!wire45)} ?
                      (^$signed(reg82)) : (!(reg64 ? reg64 : reg58))))};
              reg98 <= $unsigned(reg76[(1'h1):(1'h1)]);
              reg99 <= ((~$unsigned(($signed((8'haa)) ^ (wire65 - (8'hb2))))) > (~{({reg94} != (wire65 ?
                      reg98 : reg101))}));
              reg100 <= reg79[(2'h2):(1'h0)];
              reg101 <= (+reg64);
            end
        end
      if ((8'ha3))
        begin
          reg104 <= ($unsigned({$unsigned($unsigned(reg85))}) ^~ (wire46[(4'hd):(3'h7)] ?
              reg73 : $signed((~&reg88))));
          if (reg67)
            begin
              reg105 <= (((($unsigned(reg59) ^~ (-wire45)) ?
                      $signed(wire65) : reg77) <= $signed({$unsigned((8'ha3))})) ?
                  reg73[(5'h10):(4'h9)] : ({$unsigned($unsigned(wire65))} ?
                      ($unsigned((+reg89)) - (((8'ha6) >> reg100) ?
                          (reg49 ? wire44 : reg51) : {reg61,
                              reg62})) : (-$signed({reg47}))));
              reg106 <= (~^reg87);
              reg107 <= (^(^~reg60));
              reg108 <= wire68[(3'h7):(2'h3)];
            end
          else
            begin
              reg105 <= $unsigned($signed((~($signed(reg57) ?
                  reg86 : $unsigned((8'haa))))));
              reg106 <= (reg55 ~^ {$unsigned(({reg78} ?
                      $unsigned(reg55) : (reg55 ? reg61 : reg77))),
                  wire68[(3'h6):(1'h0)]});
              reg107 <= (|reg90[(1'h1):(1'h1)]);
              reg108 <= $signed((reg90[(1'h1):(1'h1)] ?
                  $unsigned(($signed(reg77) ?
                      reg106 : reg61)) : $signed((reg100 > (reg99 ?
                      reg49 : wire65)))));
            end
        end
      else
        begin
          reg104 <= ($unsigned(({(~reg77)} ?
              $unsigned((8'hb1)) : $unsigned($signed(reg49)))) | $unsigned($signed((reg85 & reg52[(4'hc):(4'h9)]))));
          reg105 <= (({(&wire43[(3'h6):(1'h1)])} ~^ (((8'hb6) ?
                  (8'hae) : (reg47 < reg49)) >>> reg73)) ?
              (~&((^~{wire46}) ?
                  ((reg106 >= reg92) ^ $unsigned(reg89)) : reg78[(3'h5):(3'h4)])) : {(({wire46,
                      reg77} + reg75[(3'h5):(2'h3)]) <= (reg76 + (~wire45)))});
          reg106 <= $unsigned(reg84);
        end
    end
  assign wire109 = wire68;
  assign wire110 = $unsigned((8'hb4));
  assign wire111 = (^~$signed(reg50[(1'h1):(1'h1)]));
  assign wire112 = reg61;
  assign wire113 = reg55;
  always
    @(posedge clk) begin
      if ($unsigned((($signed((reg81 ? reg62 : (8'hbf))) ?
              (reg75 > $unsigned(reg91)) : ((8'ha0) + (wire71 ^~ wire65))) ?
          (($signed(wire66) ?
              {reg55, reg88} : $unsigned((8'hbe))) && ((^reg82) ?
              $signed(reg90) : reg77)) : (^~reg63))))
        begin
          if (wire46)
            begin
              reg114 <= {{(reg105 - reg101),
                      (wire70 ?
                          (reg96 ^ ((8'ha0) >>> (8'hb0))) : reg83[(1'h0):(1'h0)])},
                  reg97[(1'h0):(1'h0)]};
            end
          else
            begin
              reg114 <= ($signed($signed(wire71[(3'h6):(3'h5)])) * $signed($unsigned($signed(reg89))));
              reg115 <= $unsigned({($signed((reg59 + reg61)) ?
                      (-(~|reg59)) : $unsigned((|reg97))),
                  (+$unsigned($signed(reg61)))});
              reg116 <= wire44[(5'h10):(3'h4)];
              reg117 <= $unsigned(reg104[(2'h2):(1'h1)]);
            end
          if ({$signed($unsigned($signed((reg82 ? reg105 : reg53))))})
            begin
              reg118 <= reg105;
            end
          else
            begin
              reg118 <= (($unsigned((reg57[(4'he):(4'ha)] << reg95)) * (-(wire109 && {reg93}))) ?
                  $signed($signed($signed(wire68[(1'h1):(1'h0)]))) : reg72[(3'h7):(2'h2)]);
              reg119 <= $unsigned((~(reg85[(3'h4):(2'h2)] * {reg116[(4'ha):(2'h3)],
                  (reg99 ? wire44 : reg104)})));
              reg120 <= $unsigned(reg87[(2'h3):(1'h0)]);
              reg121 <= (wire113[(3'h4):(1'h0)] >> {reg89[(3'h5):(1'h0)]});
            end
        end
      else
        begin
          reg114 <= (+{(($unsigned(reg90) ?
                      $unsigned((8'hb5)) : $unsigned((8'hb7))) ?
                  (((8'hac) ?
                      reg105 : wire43) < reg87) : ((wire66 - reg61) >>> (^reg86))),
              ($unsigned(reg93[(3'h5):(2'h3)]) ~^ (~(wire71 * reg56)))});
        end
      reg122 <= reg90[(4'hb):(1'h0)];
      reg123 <= ((^~(reg106[(1'h1):(1'h0)] ?
          ($unsigned(reg51) ? (-wire111) : wire43) : reg108)) * (8'h9d));
      reg124 <= $signed($signed($signed(($signed((8'h9f)) - (-(8'hb2))))));
      reg125 <= (~|$unsigned({$unsigned($signed(reg80))}));
    end
  assign wire126 = reg51[(1'h0):(1'h0)];
  assign wire127 = $signed((reg114 > (-reg91[(4'ha):(4'h8)])));
  always
    @(posedge clk) begin
      reg128 <= (+reg114[(2'h2):(2'h2)]);
    end
endmodule

module module16
#(parameter param37 = (^(({(-(8'hb0))} ^ (&((8'hac) ? (8'ha8) : (8'hb1)))) ? (7'h43) : (^~(((8'h9d) ? (8'ha5) : (8'hb2)) ? ((8'hbb) ? (8'haa) : (8'hbb)) : {(8'hb8), (8'hb3)})))), 
parameter param38 = (~&(+param37)))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire21;
  input wire signed [(3'h4):(1'h0)] wire20;
  input wire signed [(4'h8):(1'h0)] wire19;
  input wire signed [(4'ha):(1'h0)] wire18;
  input wire signed [(4'hf):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire24;
  wire [(5'h15):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire22;
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire27,
                 wire26,
                 wire24,
                 wire23,
                 wire22,
                 reg30,
                 reg29,
                 reg28,
                 reg25,
                 (1'h0)};
  assign wire22 = $unsigned(wire17[(3'h7):(1'h1)]);
  assign wire23 = (~^(8'ha9));
  assign wire24 = $unsigned((wire18[(2'h2):(2'h2)] ? wire17 : $signed(wire22)));
  always
    @(posedge clk) begin
      reg25 <= (|(~|($signed((wire22 ?
          wire19 : wire20)) & $signed((wire21 ^ wire20)))));
    end
  assign wire26 = $unsigned($unsigned(wire19[(3'h4):(2'h2)]));
  assign wire27 = ($unsigned((((-wire26) ?
                          (wire21 <= wire22) : $signed(wire18)) ?
                      wire24[(3'h5):(1'h1)] : ($signed(wire18) ?
                          wire17[(1'h1):(1'h1)] : (wire24 < wire17)))) << $unsigned({(~^{(8'hac),
                          wire20}),
                      wire21[(1'h0):(1'h0)]}));
  always
    @(posedge clk) begin
      reg28 <= ({wire24, reg25[(4'hc):(2'h2)]} * wire19);
      reg29 <= $unsigned(({reg28[(4'ha):(1'h1)]} ?
          $unsigned(((+wire22) ?
              wire24[(4'h8):(3'h4)] : {wire17,
                  (8'hb7)})) : wire18[(3'h7):(2'h3)]));
      reg30 <= $unsigned($signed($unsigned((((8'hb4) ?
          wire27 : reg25) < {(7'h42), wire18}))));
    end
  assign wire31 = (~^(+wire22));
  assign wire32 = $signed($unsigned($unsigned($signed($signed((8'hb6))))));
  assign wire33 = $signed(wire31[(4'hc):(4'hb)]);
  assign wire34 = (~|{$signed($unsigned((wire23 ? wire27 : wire23)))});
  assign wire35 = $unsigned($unsigned(wire27[(2'h3):(2'h2)]));
  assign wire36 = {{(($signed(wire31) <<< (~|wire17)) == $signed((wire20 + wire23)))}};
endmodule
