module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire196;
  wire signed [(4'he):(1'h0)] wire188;
  wire [(5'h15):(1'h0)] wire187;
  wire [(4'ha):(1'h0)] wire186;
  wire [(5'h12):(1'h0)] wire185;
  wire [(4'h9):(1'h0)] wire184;
  wire signed [(4'hd):(1'h0)] wire182;
  wire [(4'hb):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  reg [(4'hd):(1'h0)] reg195 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg193 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg191 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg189 = (1'h0);
  assign y = {wire196,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire182,
                 wire7,
                 wire6,
                 wire5,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 (1'h0)};
  assign wire5 = {(wire0 ~^ wire2)};
  assign wire6 = $signed((8'hbc));
  assign wire7 = {wire2[(2'h2):(1'h1)], (wire6[(2'h3):(1'h0)] | wire3)};
  module8 #() modinst183 (.clk(clk), .wire10(wire7), .wire12(wire4), .wire9(wire0), .wire11(wire1), .y(wire182));
  assign wire184 = ($unsigned($unsigned($unsigned((&wire3)))) ?
                       wire1[(4'he):(1'h0)] : ({wire1} ?
                           {(wire5 ?
                                   (wire5 ? wire4 : wire3) : $unsigned(wire3)),
                               wire182[(4'hd):(4'hc)]} : wire4));
  assign wire185 = wire182[(4'h8):(2'h2)];
  assign wire186 = ($signed({$signed((+wire6))}) ?
                       {wire2[(3'h6):(3'h5)]} : $unsigned($signed($signed((wire1 >>> wire185)))));
  assign wire187 = $unsigned(((~&{$unsigned(wire4),
                       wire1}) > {(wire6[(1'h1):(1'h0)] <= $unsigned(wire3))}));
  assign wire188 = (&$signed(wire187));
  always
    @(posedge clk) begin
      reg189 <= (-wire2);
      reg190 <= {wire3[(3'h7):(1'h1)]};
      reg191 <= wire186[(2'h3):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg192 <= $signed($signed(wire187));
      reg193 <= wire6;
      reg194 <= (&$signed($unsigned((&(reg190 - wire185)))));
      reg195 <= (8'hb4);
    end
  assign wire196 = wire187;
endmodule

module module8
#(parameter param181 = ({(({(8'hb6), (8'h9c)} ? ((8'ha2) ~^ (8'hb0)) : ((8'h9c) ? (7'h44) : (8'hbe))) ? (((8'ha3) >> (8'hb3)) & (~|(8'hbd))) : (((8'ha1) ? (8'ha1) : (8'hb4)) ? (~(8'ha3)) : ((8'hb0) ? (8'hb3) : (8'ha5))))} ? (&{(((8'hbe) | (8'hb1)) ? ((8'h9c) ? (8'hae) : (8'hb5)) : (!(8'ha2)))}) : {{(((8'ha9) || (8'hb4)) | (~(8'ha1)))}, (|(((8'hb5) ? (8'hb4) : (7'h41)) ? ((7'h44) ^ (8'ha1)) : (&(8'hba))))}))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire [(4'hb):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire180;
  wire signed [(4'h9):(1'h0)] wire179;
  wire signed [(5'h10):(1'h0)] wire178;
  wire signed [(4'h8):(1'h0)] wire177;
  wire [(5'h13):(1'h0)] wire176;
  wire [(5'h12):(1'h0)] wire175;
  wire signed [(4'hf):(1'h0)] wire174;
  wire signed [(2'h3):(1'h0)] wire173;
  wire [(5'h13):(1'h0)] wire172;
  wire signed [(5'h15):(1'h0)] wire71;
  wire [(5'h11):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire130;
  wire [(4'hf):(1'h0)] wire132;
  wire signed [(5'h12):(1'h0)] wire133;
  wire [(2'h3):(1'h0)] wire134;
  wire [(5'h11):(1'h0)] wire135;
  wire signed [(5'h13):(1'h0)] wire170;
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire71,
                 wire14,
                 wire130,
                 wire132,
                 wire133,
                 wire134,
                 wire135,
                 wire170,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg13 <= {$unsigned(wire11), $unsigned({(-$signed(wire9))})};
    end
  assign wire14 = $unsigned({(((wire11 ?
                          wire11 : reg13) ^ (~^wire12)) - (((8'had) <<< wire12) ?
                          {wire10, wire10} : wire12[(1'h0):(1'h0)]))});
  module15 #() modinst72 (wire71, clk, reg13, wire10, wire12, wire11);
  module73 #() modinst131 (.wire75(wire71), .wire78(wire14), .wire76(reg13), .clk(clk), .wire77(wire9), .y(wire130), .wire74(wire11));
  assign wire132 = wire10;
  assign wire133 = {($unsigned(reg13[(2'h2):(1'h0)]) ^~ reg13[(4'h9):(3'h6)])};
  assign wire134 = ($signed((~&$signed((~&wire132)))) <<< $signed((&wire132[(4'ha):(1'h1)])));
  assign wire135 = $signed({(((^wire134) - {wire71,
                           wire133}) | $signed((reg13 ^ wire71))),
                       (~&(&{wire12, wire10}))});
  module136 #() modinst171 (.wire137(reg13), .wire139(wire132), .wire140(wire9), .wire138(wire135), .clk(clk), .y(wire170));
  assign wire172 = {(^~{wire14, (8'hae)}),
                       {(($signed(wire135) ?
                               wire9 : $unsigned(wire134)) & wire135[(3'h6):(2'h3)])}};
  assign wire173 = $unsigned(wire172);
  assign wire174 = reg13;
  assign wire175 = ($unsigned($signed($unsigned($signed(wire133)))) ~^ (wire135 ?
                       ({(wire9 << (8'haa)),
                           wire130[(3'h6):(2'h2)]} && (wire133[(4'h8):(2'h2)] ?
                           $unsigned((8'ha9)) : $unsigned(wire9))) : $unsigned(((wire71 ?
                           wire14 : wire134) >= ((8'hbc) ?
                           (8'ha9) : (8'hb3))))));
  assign wire176 = wire135[(5'h11):(4'hc)];
  assign wire177 = (wire172[(4'hc):(3'h6)] ^~ wire133[(4'hd):(4'ha)]);
  assign wire178 = (+reg13[(3'h5):(3'h5)]);
  assign wire179 = (~^$unsigned(wire176[(1'h1):(1'h0)]));
  assign wire180 = ($unsigned($unsigned((wire132[(1'h1):(1'h0)] & (wire178 >> wire175)))) ?
                       $signed($signed($unsigned(wire12))) : $unsigned({wire170[(2'h3):(2'h2)],
                           (~^(wire132 ? wire170 : wire9))}));
endmodule

module module136
#(parameter param168 = (~|((~^((^~(8'hb3)) ? {(8'hb1)} : ((8'ha0) <= (8'hb6)))) >> (!(^~(+(8'hac)))))), 
parameter param169 = (!((param168 ? (((7'h42) > (7'h43)) ? (param168 == param168) : {param168, param168}) : param168) ? (~|{param168, (param168 ? param168 : param168)}) : param168)))
(y, clk, wire140, wire139, wire138, wire137);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire140;
  input wire signed [(4'hf):(1'h0)] wire139;
  input wire [(4'hf):(1'h0)] wire138;
  input wire signed [(3'h5):(1'h0)] wire137;
  wire signed [(5'h10):(1'h0)] wire167;
  wire [(2'h3):(1'h0)] wire166;
  wire signed [(5'h14):(1'h0)] wire165;
  wire signed [(4'he):(1'h0)] wire164;
  wire signed [(2'h3):(1'h0)] wire163;
  wire [(4'hf):(1'h0)] wire162;
  wire signed [(3'h7):(1'h0)] wire161;
  wire [(4'hf):(1'h0)] wire160;
  wire signed [(4'hf):(1'h0)] wire159;
  wire [(3'h5):(1'h0)] wire158;
  wire [(3'h5):(1'h0)] wire157;
  wire [(4'hc):(1'h0)] wire156;
  wire signed [(4'ha):(1'h0)] wire155;
  wire [(3'h5):(1'h0)] wire154;
  wire signed [(4'hf):(1'h0)] wire153;
  wire signed [(4'hd):(1'h0)] wire152;
  wire [(3'h6):(1'h0)] wire144;
  wire signed [(2'h3):(1'h0)] wire143;
  wire [(5'h12):(1'h0)] wire142;
  wire [(4'hd):(1'h0)] wire141;
  reg [(5'h11):(1'h0)] reg151 = (1'h0);
  reg signed [(4'he):(1'h0)] reg150 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg149 = (1'h0);
  reg [(4'hc):(1'h0)] reg148 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg145 = (1'h0);
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
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 (1'h0)};
  assign wire141 = (((~|$signed(wire140[(3'h7):(2'h2)])) || $unsigned($unsigned((8'hb2)))) & (~$signed(wire138[(1'h0):(1'h0)])));
  assign wire142 = wire140[(2'h2):(2'h2)];
  assign wire143 = {wire139[(3'h7):(1'h0)]};
  assign wire144 = (~&{wire140, $unsigned((~wire138))});
  always
    @(posedge clk) begin
      if (((+((!(wire144 ^ wire142)) >> $signed((7'h43)))) & $signed((+wire144[(3'h4):(2'h2)]))))
        begin
          reg145 <= (^~$signed((8'ha6)));
        end
      else
        begin
          reg145 <= ($unsigned(wire143) >= wire140[(3'h7):(3'h7)]);
        end
      if (wire142[(5'h12):(5'h11)])
        begin
          if ((!reg145))
            begin
              reg146 <= {(wire137 ? $signed(wire140) : reg145)};
              reg147 <= ($unsigned((~wire139)) ?
                  ((wire142[(4'hc):(4'hc)] ?
                          (wire144[(1'h0):(1'h0)] ?
                              wire138[(3'h6):(3'h6)] : reg146) : ($signed((8'h9e)) ^ wire142)) ?
                      wire143 : ((wire144[(1'h0):(1'h0)] ?
                          $signed(wire143) : $signed(reg146)) * (!$unsigned(wire144)))) : wire141[(1'h0):(1'h0)]);
              reg148 <= (8'h9f);
            end
          else
            begin
              reg146 <= wire137[(2'h2):(2'h2)];
              reg147 <= $unsigned($signed(((wire143[(2'h3):(1'h1)] ?
                  (&wire143) : (wire141 ? reg147 : wire139)) << ((wire139 ?
                      wire137 : (8'ha1)) ?
                  $unsigned(wire143) : (wire139 ? reg145 : reg145)))));
              reg148 <= wire141[(4'ha):(4'ha)];
              reg149 <= (&reg146);
              reg150 <= {((!(|reg148)) ?
                      ((|$unsigned(wire138)) ?
                          wire137 : $signed($unsigned(wire142))) : (~reg147))};
            end
        end
      else
        begin
          if ($unsigned((($unsigned($unsigned(reg146)) ?
                  ((~|reg148) ?
                      wire137[(3'h4):(3'h4)] : reg145[(3'h7):(3'h4)]) : (+(wire137 ?
                      reg148 : reg146))) ?
              ((+(~|wire138)) ^ wire141[(4'hd):(3'h6)]) : ($signed(reg146) ^ reg150[(4'h9):(3'h4)]))))
            begin
              reg146 <= wire141[(2'h3):(1'h0)];
            end
          else
            begin
              reg146 <= {$signed(($signed((|wire144)) ?
                      wire139[(4'ha):(2'h3)] : ({reg150, wire141} ?
                          (wire138 ? reg150 : reg146) : $signed((8'ha4)))))};
            end
          reg147 <= $unsigned({(wire143[(2'h3):(2'h2)] ?
                  {(wire143 ? (8'haf) : reg146),
                      (wire138 ? wire142 : wire141)} : ((wire141 ?
                          reg146 : reg150) ?
                      (+wire141) : wire143[(1'h1):(1'h1)]))});
          reg148 <= $signed((!(~&$signed(reg146[(3'h6):(3'h5)]))));
        end
      reg151 <= (^~(~&(~|wire143[(1'h1):(1'h1)])));
    end
  assign wire152 = $signed($unsigned(wire140));
  assign wire153 = ($unsigned($signed((8'h9f))) == (+(reg148[(3'h7):(1'h0)] ^~ (~^(reg150 & (8'hb2))))));
  assign wire154 = wire140;
  assign wire155 = (reg151[(3'h5):(2'h3)] ?
                       (wire140 ?
                           ($signed((wire152 ? wire139 : reg148)) ?
                               {(reg149 + wire143),
                                   $signed(wire137)} : $unsigned((reg151 ~^ wire142))) : $signed((wire137[(2'h3):(1'h0)] ?
                               (wire139 ?
                                   wire141 : (8'hb5)) : wire137[(2'h3):(1'h0)]))) : $unsigned($unsigned($signed(reg147[(1'h1):(1'h1)]))));
  assign wire156 = ((^~(8'ha7)) ?
                       ((|($signed(reg151) ?
                           (reg145 ?
                               (8'hb6) : reg151) : reg149[(1'h0):(1'h0)])) - $unsigned((wire139 ?
                           (wire154 << wire140) : wire140))) : (((wire138 ?
                                   ((8'h9c) >>> (8'h9d)) : (~&(8'h9f))) ?
                               {(+wire139)} : (~wire143[(2'h2):(1'h0)])) ?
                           $signed(({reg149,
                               reg149} <<< $unsigned((8'hac)))) : wire152[(1'h1):(1'h0)]));
  assign wire157 = ($unsigned(((~|(reg150 >= reg150)) ?
                           ({(8'had)} ?
                               $signed(wire156) : $unsigned((8'hb7))) : wire143)) ?
                       $unsigned($unsigned($unsigned((~&wire156)))) : wire138);
  assign wire158 = wire138;
  assign wire159 = $unsigned((+(+((^~wire138) & wire158))));
  assign wire160 = $unsigned(wire157);
  assign wire161 = $signed(reg149[(3'h4):(3'h4)]);
  assign wire162 = ($unsigned($signed(($signed(wire152) ~^ $unsigned(reg147)))) ?
                       wire154 : $signed(wire144));
  assign wire163 = wire138;
  assign wire164 = (~|$signed((8'haf)));
  assign wire165 = $signed(reg145[(2'h2):(1'h1)]);
  assign wire166 = (wire152 < (reg147[(1'h0):(1'h0)] <= $signed(((wire144 == (8'ha1)) >> $unsigned((8'hb8))))));
  assign wire167 = $unsigned((wire154 + $unsigned({wire157[(3'h5):(2'h3)]})));
endmodule

module module73
#(parameter param129 = (~&((((!(8'ha3)) >> ((8'h9e) ? (8'ha8) : (8'hab))) ? {((8'haa) & (8'h9e)), ((8'hb4) ? (8'h9f) : (8'ha6))} : ((-(8'ha6)) < ((8'hb8) ~^ (8'h9f)))) || ((((8'ha1) ? (8'ha7) : (8'ha0)) ? (+(8'hbb)) : {(8'hb5), (8'hb0)}) ? ((~&(8'hbb)) ? (^(7'h40)) : (+(8'hb8))) : (+(^(8'hbd)))))))
(y, clk, wire78, wire77, wire76, wire75, wire74);
  output wire [(32'h245):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire78;
  input wire [(3'h6):(1'h0)] wire77;
  input wire [(4'h8):(1'h0)] wire76;
  input wire signed [(5'h15):(1'h0)] wire75;
  input wire [(5'h14):(1'h0)] wire74;
  wire [(3'h7):(1'h0)] wire128;
  wire [(3'h6):(1'h0)] wire127;
  wire signed [(4'he):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire110;
  wire signed [(5'h14):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire83;
  wire signed [(4'hf):(1'h0)] wire79;
  reg signed [(3'h4):(1'h0)] reg126 = (1'h0);
  reg [(4'hc):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg124 = (1'h0);
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(5'h13):(1'h0)] reg120 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg119 = (1'h0);
  reg [(4'hb):(1'h0)] reg118 = (1'h0);
  reg [(3'h4):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(3'h7):(1'h0)] reg113 = (1'h0);
  reg [(5'h10):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg109 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg105 = (1'h0);
  reg [(5'h14):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg103 = (1'h0);
  reg [(2'h2):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg101 = (1'h0);
  reg [(5'h10):(1'h0)] reg100 = (1'h0);
  reg signed [(4'he):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(4'h8):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire111,
                 wire110,
                 wire84,
                 wire83,
                 wire79,
                 reg126,
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
                 reg113,
                 reg112,
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
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg82,
                 reg81,
                 reg80,
                 (1'h0)};
  assign wire79 = $signed((wire77 ?
                      wire78[(3'h6):(1'h0)] : (-wire74[(5'h11):(4'hc)])));
  always
    @(posedge clk) begin
      reg80 <= (8'ha7);
      reg81 <= ((({wire77, (wire78 ? wire75 : wire74)} <<< (~|(wire78 ?
          wire78 : wire78))) >> ((wire76[(3'h7):(2'h3)] ?
              wire76 : $unsigned(wire75)) ?
          (wire79[(4'h8):(2'h3)] != (reg80 ?
              (7'h44) : (8'hae))) : wire77)) >= reg80);
      reg82 <= wire74;
    end
  assign wire83 = $signed($signed($unsigned($signed((^~(8'ha7))))));
  assign wire84 = (+$signed((~&($unsigned((8'hb4)) ?
                      $signed(wire77) : wire74))));
  always
    @(posedge clk) begin
      reg85 <= wire78[(3'h4):(1'h1)];
      reg86 <= {{$unsigned($signed((wire84 ? wire77 : wire76))),
              wire84[(1'h0):(1'h0)]}};
      if (((~|({(wire75 ? wire83 : (8'hb9))} ?
          (8'ha7) : (wire74[(4'h8):(3'h7)] ?
              (-wire78) : (reg80 << wire78)))) >>> (((!$unsigned((7'h41))) == wire77[(2'h2):(1'h1)]) ?
          $unsigned(wire75[(4'he):(4'ha)]) : (^(^(wire78 - wire79))))))
        begin
          reg87 <= $unsigned($unsigned($signed(wire74[(5'h11):(4'hd)])));
          reg88 <= reg87[(1'h0):(1'h0)];
          reg89 <= {reg88};
          reg90 <= (($signed({(~reg87)}) ^~ (($unsigned(wire75) ?
              $unsigned(reg81) : {(8'hb1)}) && $unsigned($signed((8'haf))))) < $unsigned($unsigned(wire77)));
        end
      else
        begin
          if (($signed(($unsigned($signed(reg82)) | reg80)) ?
              {{reg90}, wire78[(4'ha):(2'h2)]} : {reg81[(3'h4):(2'h3)],
                  (8'hbc)}))
            begin
              reg87 <= (&(-($unsigned($unsigned(reg89)) << ($signed(reg80) - (wire78 ^ reg88)))));
              reg88 <= wire84;
              reg89 <= {(7'h42)};
              reg90 <= $signed((reg80[(5'h13):(2'h2)] << $signed(wire84)));
            end
          else
            begin
              reg87 <= reg86[(1'h0):(1'h0)];
              reg88 <= (reg90[(2'h3):(2'h3)] & wire83[(4'ha):(4'ha)]);
              reg89 <= $unsigned({(((reg82 > wire79) + {reg82}) * (wire79[(4'hb):(4'hb)] ?
                      $signed(reg82) : (wire75 << (7'h42)))),
                  ((~^(wire84 && (8'ha4))) == ((reg82 >= reg89) ?
                      (reg80 ? wire77 : reg85) : {wire74, (8'h9d)}))});
            end
          if (reg89)
            begin
              reg91 <= (wire78[(4'hd):(4'h8)] ?
                  (^~wire75[(5'h10):(3'h7)]) : ((reg80 ?
                          (-wire77) : $signed($unsigned((8'haf)))) ?
                      ({reg81,
                          reg90} || $unsigned(wire79[(4'hd):(4'hd)])) : $unsigned($unsigned((~|(8'ha3))))));
              reg92 <= {$unsigned($signed((!wire75[(4'ha):(4'h8)]))),
                  reg81[(4'hc):(4'h8)]};
              reg93 <= (((reg85[(1'h1):(1'h1)] >> wire77) - (!(((8'hb4) ?
                  reg91 : (8'hae)) >>> (wire83 ? wire83 : reg85)))) - wire75);
              reg94 <= wire83[(3'h6):(3'h5)];
            end
          else
            begin
              reg91 <= reg88;
              reg92 <= reg93;
            end
        end
      reg95 <= ((&reg80) ^~ (({(reg87 ? wire76 : reg82), ((8'hab) <<< wire76)} ?
              $signed(reg80[(5'h10):(4'hd)]) : (|(~wire84))) ?
          {$signed(reg93),
              $unsigned((reg80 > wire83))} : (^$unsigned(wire74))));
      reg96 <= {((7'h44) >>> $unsigned($unsigned({reg81, wire77})))};
    end
  always
    @(posedge clk) begin
      reg97 <= reg91[(1'h1):(1'h1)];
      if ($signed(wire79))
        begin
          reg98 <= ({reg82} >>> $unsigned(((reg97[(2'h3):(1'h1)] ?
              {wire77, reg90} : reg88[(3'h6):(3'h5)]) ^~ {(reg94 ?
                  wire77 : wire84)})));
        end
      else
        begin
          reg98 <= ((+reg88[(4'hb):(3'h6)]) + wire77[(3'h5):(1'h1)]);
          reg99 <= $signed(wire75[(4'hd):(1'h1)]);
        end
      reg100 <= $signed(reg81[(4'hb):(4'hb)]);
      if ($unsigned(((^(wire76 ? $unsigned(reg92) : $unsigned(wire79))) ?
          reg99[(4'hc):(4'hc)] : {((8'had) || (&wire77))})))
        begin
          reg101 <= reg89;
          if (reg82[(1'h0):(1'h0)])
            begin
              reg102 <= wire75[(5'h13):(3'h4)];
              reg103 <= (($signed((reg91[(4'hd):(4'h8)] == ((7'h42) ?
                  reg85 : reg88))) ^ $signed(($unsigned(reg92) >> (8'h9e)))) ^~ reg89[(2'h2):(1'h1)]);
              reg104 <= (reg89 ?
                  wire77[(1'h0):(1'h0)] : $signed(((reg89[(5'h12):(4'h9)] ?
                      wire76 : reg93[(2'h2):(1'h1)]) ^ ((reg88 - (8'haa)) <= $unsigned((8'hb1))))));
            end
          else
            begin
              reg102 <= (!(~|((wire75[(5'h14):(4'he)] | (-reg103)) & {reg88,
                  $unsigned(reg87)})));
            end
          if ((($signed(($unsigned(reg86) && {reg97})) ?
              $signed((reg102[(1'h1):(1'h0)] & reg101)) : (^$signed(((8'hbd) ?
                  wire79 : reg80)))) && $unsigned(({$signed(reg94),
                  $unsigned(wire78)} ?
              reg99 : reg93))))
            begin
              reg105 <= (8'ha1);
              reg106 <= reg81;
              reg107 <= $unsigned((-$signed({reg93[(4'hd):(4'hd)]})));
              reg108 <= $signed($unsigned(wire78));
              reg109 <= ((({$unsigned(reg106), {reg90}} ?
                  reg95[(3'h7):(2'h3)] : (reg92 & (wire79 + wire74))) <= (^~$signed($signed(reg99)))) | wire76);
            end
          else
            begin
              reg105 <= $signed(reg105);
              reg106 <= reg88;
              reg107 <= (wire84 ?
                  (({(~reg81),
                          $signed(reg93)} > ($unsigned(reg86) ~^ reg81[(2'h3):(2'h3)])) ?
                      $unsigned((~&reg97[(2'h2):(1'h0)])) : ((&wire74[(4'hf):(1'h1)]) ?
                          $unsigned((wire79 <<< reg86)) : wire79[(2'h3):(1'h1)])) : (($unsigned(((8'hbb) ?
                      reg98 : reg89)) && $signed(reg107[(4'h8):(3'h7)])) & (((|wire77) ^ (reg97 ^ wire79)) ?
                      reg106 : wire83[(2'h2):(1'h1)])));
              reg108 <= $unsigned(({($signed(reg82) ?
                          ((8'ha6) ? reg102 : wire74) : reg92[(1'h0):(1'h0)]),
                      reg81} ?
                  reg99 : reg80[(3'h6):(1'h1)]));
            end
        end
      else
        begin
          if ($unsigned($signed($unsigned(($signed(reg99) ?
              (wire77 ? reg81 : reg96) : reg94)))))
            begin
              reg101 <= (-(reg90 == reg94));
            end
          else
            begin
              reg101 <= reg94[(1'h0):(1'h0)];
            end
          reg102 <= reg97[(1'h1):(1'h0)];
          if (reg92)
            begin
              reg103 <= (((^~reg82[(4'hc):(4'ha)]) ?
                      $signed((~&wire74[(4'h8):(3'h7)])) : ($unsigned((wire75 ~^ (8'hab))) ?
                          $unsigned((reg81 ?
                              reg89 : reg109)) : $unsigned(((8'hbf) || (8'hac))))) ?
                  ($signed($signed((reg91 ^ (8'hbd)))) - (reg90 & (!reg98[(3'h4):(1'h1)]))) : $unsigned($unsigned(($unsigned(wire76) ?
                      reg86 : $signed(reg103)))));
            end
          else
            begin
              reg103 <= $signed({$unsigned($signed($unsigned(reg80)))});
              reg104 <= $signed(reg87[(3'h7):(2'h2)]);
              reg105 <= (8'ha0);
            end
        end
    end
  assign wire110 = {(~(+$signed($signed(reg96))))};
  assign wire111 = {($signed(($unsigned(reg100) ? wire79 : $signed(reg98))) ?
                           (8'h9c) : $signed(reg100[(4'hb):(2'h2)]))};
  always
    @(posedge clk) begin
      reg112 <= reg82;
      reg113 <= (($unsigned(($signed(reg109) ?
              ((7'h42) ? wire110 : reg94) : wire77[(1'h1):(1'h1)])) ?
          ({reg81, (8'ha2)} ?
              $signed((^~reg104)) : ($unsigned(reg98) - (reg102 ^~ reg88))) : (8'hba)) ~^ wire75[(4'h9):(3'h7)]);
      reg114 <= (-(({$unsigned(wire110), ((8'had) ? reg93 : (8'ha8))} ^ reg80) ?
          reg91[(1'h0):(1'h0)] : reg104[(3'h7):(2'h2)]));
      reg115 <= (reg96[(4'he):(3'h6)] <<< $unsigned($unsigned(wire84)));
    end
  always
    @(posedge clk) begin
      if (reg82[(4'hc):(4'ha)])
        begin
          reg116 <= ((reg87 << ((~&(reg97 ? reg95 : reg95)) ?
              $signed(reg106[(4'h9):(4'h9)]) : reg104[(5'h14):(4'hf)])) >>> ((((reg82 - wire77) == ((8'ha9) >= reg87)) <= (&reg89)) & {((~^wire74) ?
                  (~&reg115) : reg106[(4'h8):(3'h4)]),
              (reg86[(3'h4):(2'h3)] || (reg113 ? wire84 : reg102))}));
          reg117 <= wire77[(3'h5):(3'h4)];
          if (reg87[(4'ha):(1'h1)])
            begin
              reg118 <= ({((&reg82) ?
                      $signed(reg113[(1'h0):(1'h0)]) : (~|wire78))} ~^ $unsigned((-(+(reg112 > reg107)))));
            end
          else
            begin
              reg118 <= wire110;
              reg119 <= (-wire79[(4'ha):(3'h4)]);
              reg120 <= ($signed((8'hab)) ? (7'h42) : wire78);
              reg121 <= (reg116[(2'h2):(1'h0)] && $unsigned((wire79[(4'hf):(3'h6)] ?
                  (~^((8'ha0) - reg88)) : reg96)));
            end
          reg122 <= reg87[(2'h3):(1'h1)];
        end
      else
        begin
          reg116 <= ($signed({{$signed(reg95), (reg107 != reg114)},
                  ($unsigned(reg106) ~^ (wire110 ? reg82 : (8'h9d)))}) ?
              $signed(((8'ha9) ?
                  ($signed(reg97) - {wire77}) : $unsigned(reg80))) : wire83);
        end
      reg123 <= $unsigned($unsigned(reg108));
      reg124 <= {$signed($signed((~reg99[(3'h7):(2'h2)])))};
      reg125 <= reg105[(2'h2):(1'h0)];
      reg126 <= ($signed((^~reg100)) ?
          $unsigned(reg99) : wire76[(2'h3):(1'h0)]);
    end
  assign wire127 = ((~|(reg119 * (~wire110[(3'h5):(1'h1)]))) >> reg90);
  assign wire128 = (8'h9e);
endmodule

module module15
#(parameter param70 = ({{(^(~|(8'hba)))}} ^~ (!{(((7'h41) < (8'h9f)) | ((8'ha5) | (8'hbf))), (((8'ha8) ~^ (8'ha5)) == ((8'hbe) >>> (7'h44)))})))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h234):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire18;
  input wire signed [(5'h15):(1'h0)] wire17;
  input wire signed [(5'h14):(1'h0)] wire16;
  wire signed [(4'hb):(1'h0)] wire69;
  wire [(4'ha):(1'h0)] wire68;
  wire [(4'hd):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire20;
  reg [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire20,
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
                 reg46,
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
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire20 = ((!wire18[(3'h7):(3'h5)]) ~^ $unsigned(($unsigned({wire16,
                      wire19}) + (wire17[(4'h8):(4'h8)] <<< (^~wire16)))));
  always
    @(posedge clk) begin
      reg21 <= $unsigned(wire19);
      reg22 <= ((!((~&wire19) ?
          {{wire17, wire18}, wire19} : (wire19[(3'h7):(3'h4)] ?
              (wire17 ? (8'ha9) : (8'h9d)) : ((8'h9f) ?
                  wire19 : wire17)))) * (wire19 <= (wire16 ?
          (wire18 | (wire17 <<< wire16)) : reg21)));
      reg23 <= wire17;
      if (((($unsigned($unsigned(reg22)) ?
              $unsigned((-wire20)) : (wire20[(2'h2):(2'h2)] > $signed(wire19))) < {(~&wire16),
              $unsigned((wire16 <= reg23))}) ?
          wire18[(1'h0):(1'h0)] : ($signed($signed($unsigned(wire16))) ?
              wire16[(4'h9):(2'h2)] : wire19)))
        begin
          if ($signed({$unsigned((((8'ha4) << reg21) ?
                  (|wire16) : (wire16 ^ wire20)))}))
            begin
              reg24 <= wire17;
            end
          else
            begin
              reg24 <= (wire19 ? wire19[(1'h1):(1'h0)] : reg24[(4'hb):(1'h0)]);
            end
          reg25 <= (reg23[(2'h3):(2'h2)] ?
              ((($signed((8'hb0)) >>> wire20) ?
                      wire18[(4'hb):(3'h4)] : {(+(8'hb9)), wire17}) ?
                  (~&reg21) : wire20) : (~&({$unsigned(wire18)} & (wire20[(1'h0):(1'h0)] && (wire17 >> (8'ha1))))));
          reg26 <= $signed(((((8'hb9) ? $signed((8'hb5)) : (8'hae)) ?
              ($unsigned(wire19) ?
                  {reg25} : (reg22 >>> wire16)) : reg23) << $unsigned(($unsigned((8'h9c)) >= (wire18 == wire17)))));
        end
      else
        begin
          reg24 <= (reg24[(2'h3):(2'h3)] * (($unsigned($unsigned(reg22)) > $unsigned(wire19)) ~^ $unsigned($unsigned((wire19 ?
              reg22 : wire18)))));
          if (($unsigned(reg23[(2'h3):(2'h3)]) ^ $signed({$signed($unsigned(reg24)),
              ($signed(reg23) ? (~|wire17) : {wire17, (8'hb6)})})))
            begin
              reg25 <= (wire20 ?
                  $signed((wire17[(3'h5):(3'h4)] - (~|$signed(wire16)))) : wire16[(1'h1):(1'h1)]);
            end
          else
            begin
              reg25 <= (!wire18[(4'hb):(4'ha)]);
              reg26 <= (^$unsigned((($signed(reg23) && reg23) ?
                  ((reg21 ? reg21 : reg24) ?
                      (wire18 ? reg21 : wire16) : {reg23,
                          wire17}) : $signed($unsigned(reg22)))));
              reg27 <= wire18;
            end
          if (wire19)
            begin
              reg28 <= $signed($signed((($signed((8'hb3)) ^~ (reg25 ?
                  reg22 : reg25)) > {reg25[(1'h1):(1'h0)]})));
              reg29 <= wire18;
              reg30 <= (wire17 ^~ $signed((|{$unsigned(wire16)})));
              reg31 <= $unsigned(reg22[(3'h6):(3'h6)]);
            end
          else
            begin
              reg28 <= $unsigned((&((reg23[(2'h2):(2'h2)] < reg25) ?
                  $signed((-reg22)) : ({reg27, reg30} | ((8'hab) ?
                      reg31 : reg25)))));
              reg29 <= (($signed((-(reg28 ?
                  reg21 : wire18))) | $unsigned($signed((reg21 ?
                  wire19 : reg25)))) >> (!wire18[(1'h0):(1'h0)]));
              reg30 <= reg25[(3'h5):(2'h3)];
              reg31 <= $signed(((|$signed($signed(wire19))) ?
                  ({wire17, ((8'ha7) ? wire19 : wire17)} ?
                      $unsigned($signed((8'hbf))) : wire17[(5'h12):(4'h9)]) : ($unsigned($signed(reg30)) ?
                      $unsigned(reg26) : (+{wire20}))));
              reg32 <= ($signed((($signed(wire16) + reg24[(4'hc):(4'ha)]) ?
                      reg30[(4'h8):(3'h7)] : {$signed(reg25),
                          (reg23 ? reg29 : reg23)})) ?
                  $unsigned((+(&wire16))) : $signed(reg25[(1'h1):(1'h0)]));
            end
          if (reg29[(1'h1):(1'h1)])
            begin
              reg33 <= reg26;
              reg34 <= ((+(reg27 ?
                      $unsigned((reg33 <= reg22)) : $signed((!wire20)))) ?
                  (^(!(8'ha3))) : ($signed(($signed(wire16) & $unsigned(reg32))) << {$unsigned(wire16[(4'hd):(4'ha)])}));
              reg35 <= ((~|{$signed($signed(wire17)), (8'hb7)}) ?
                  reg27[(1'h0):(1'h0)] : $unsigned(wire16));
            end
          else
            begin
              reg33 <= {wire18};
              reg34 <= ((~$signed(reg27[(5'h10):(4'hf)])) ?
                  $signed(((((8'hbe) <= reg29) ?
                          (reg34 | reg31) : {(8'ha3), (8'hbf)}) ?
                      (~&$signed(reg34)) : ((~&reg23) >= {reg27,
                          wire18}))) : $signed(($signed({(8'hb9),
                      wire18}) & ($unsigned((8'hb9)) ^ $signed(reg21)))));
              reg35 <= reg33[(1'h0):(1'h0)];
              reg36 <= reg30[(4'he):(3'h6)];
            end
          reg37 <= $unsigned((|((^reg24[(3'h5):(3'h5)]) ?
              reg35 : (reg33[(1'h1):(1'h0)] ? (reg34 ^~ wire18) : {reg25}))));
        end
    end
  assign wire38 = {$signed(({$unsigned(wire17),
                          {reg25}} >>> (^~$unsigned(reg27))))};
  assign wire39 = (|wire17[(2'h3):(2'h3)]);
  assign wire40 = (&$unsigned(reg28[(2'h2):(2'h2)]));
  assign wire41 = ({(reg26[(4'hc):(1'h0)] >= wire17[(4'hf):(4'hf)])} - ((+(|(~^wire19))) ?
                      reg22[(1'h0):(1'h0)] : reg30));
  assign wire42 = ((wire20 == ((!$unsigned(wire39)) && ((^reg30) >>> (&wire39)))) ?
                      reg21 : ($signed(($unsigned((8'hbc)) ? wire17 : reg35)) ?
                          ((+$unsigned(wire17)) == ($signed(reg31) ?
                              (+wire38) : (wire19 ?
                                  reg31 : reg30))) : (~&reg37)));
  assign wire43 = wire39[(3'h6):(3'h5)];
  assign wire44 = $signed({$signed($signed(reg29[(4'ha):(3'h5)])),
                      (~|(reg21[(2'h3):(2'h2)] && (wire39 ?
                          (7'h44) : (8'ha8))))});
  assign wire45 = wire39[(4'hb):(3'h7)];
  always
    @(posedge clk) begin
      if ({reg36[(2'h3):(2'h2)], {{reg29, (^~(wire38 >> wire20))}}})
        begin
          reg46 <= $unsigned($signed(wire16[(3'h6):(3'h4)]));
        end
      else
        begin
          reg46 <= (^~reg37);
        end
      reg47 <= $signed($signed(wire42[(4'he):(4'he)]));
      if ($unsigned((&reg35)))
        begin
          if (((reg33[(1'h0):(1'h0)] ? (~|wire43[(1'h1):(1'h0)]) : wire41) ?
              $unsigned((8'ha6)) : (-$signed(reg21))))
            begin
              reg48 <= ((-(wire44[(4'hc):(4'h9)] ?
                  (reg21 >> $signed(reg27)) : ((|wire18) >> reg34[(1'h0):(1'h0)]))) + $unsigned(wire16));
              reg49 <= $signed(reg31);
            end
          else
            begin
              reg48 <= (reg27 || reg36[(3'h4):(1'h1)]);
              reg49 <= (wire38[(5'h12):(2'h3)] ?
                  (~|{(^$unsigned(reg29)),
                      ($signed(reg26) ?
                          $signed(wire38) : reg31[(2'h3):(1'h1)])}) : ((reg30 << ((wire16 != wire44) != reg33)) ?
                      wire19 : (&$unsigned(reg36))));
            end
          reg50 <= {(8'hb8)};
          reg51 <= $signed(reg31[(3'h5):(2'h3)]);
          reg52 <= (($unsigned({(wire44 ? (8'h9c) : reg48)}) ?
              {(~(reg26 <<< wire18)),
                  reg25[(2'h2):(1'h1)]} : {reg36[(3'h4):(2'h2)]}) && $unsigned((reg25 == ($unsigned(reg23) <= $unsigned(reg35)))));
          if ((&$unsigned((!$unsigned((reg28 ? reg23 : reg47))))))
            begin
              reg53 <= ((!($signed((|(8'hbb))) ^~ ((reg46 != reg28) ?
                      (8'hac) : reg29[(2'h2):(2'h2)]))) ?
                  wire42[(4'hf):(4'h8)] : (~(~|(|(wire16 & (8'hb1))))));
              reg54 <= (reg36 ?
                  (+$signed(wire40)) : $signed($unsigned((+reg31[(3'h6):(1'h1)]))));
              reg55 <= reg21;
              reg56 <= ((+(~($unsigned(wire19) != reg22[(2'h3):(2'h3)]))) ?
                  ((wire45[(1'h0):(1'h0)] ?
                          $signed((~^reg24)) : reg32[(2'h3):(1'h0)]) ?
                      reg21 : (~|reg25)) : (reg33 ?
                      (reg51[(4'hd):(4'hc)] ?
                          ($signed(wire20) ?
                              $unsigned(reg22) : (&reg54)) : {$unsigned(reg48),
                              $signed(reg25)}) : $signed($signed((reg28 ?
                          reg22 : wire16)))));
              reg57 <= (((-(8'hb1)) ? (~|reg54) : wire41[(2'h3):(2'h3)]) ?
                  {(((reg52 | reg30) ?
                          (~&(8'hbc)) : (7'h41)) << (~&(^~wire43)))} : $unsigned((^wire42[(4'hf):(2'h2)])));
            end
          else
            begin
              reg53 <= (reg55[(2'h3):(1'h1)] ?
                  reg31[(3'h4):(2'h2)] : (&reg55[(1'h0):(1'h0)]));
              reg54 <= {$unsigned((+(^reg32))),
                  (wire20 ? reg50 : $signed($signed(reg25)))};
              reg55 <= {((reg57[(3'h5):(1'h1)] ?
                      $unsigned((~reg29)) : reg48[(3'h4):(2'h3)]) && {((~|wire40) ?
                          {reg37} : $signed(wire42))}),
                  $signed($signed((~&(!reg27))))};
              reg56 <= reg36[(3'h4):(3'h4)];
            end
        end
      else
        begin
          reg48 <= reg23[(1'h1):(1'h0)];
          reg49 <= $signed(({($unsigned(wire42) ? reg27 : reg27),
              ($unsigned(reg31) ?
                  (wire44 * reg57) : (^wire41))} & (~|((~reg33) ?
              $signed(wire40) : $unsigned(reg52)))));
        end
      reg58 <= (8'hb2);
    end
  always
    @(posedge clk) begin
      if ((~&$unsigned($unsigned(((~wire20) ? reg55 : wire20[(4'hd):(3'h6)])))))
        begin
          reg59 <= wire43[(2'h2):(1'h1)];
          reg60 <= reg37;
        end
      else
        begin
          reg59 <= wire45[(1'h0):(1'h0)];
          reg60 <= (^~$unsigned({(8'hbc), $unsigned($unsigned(wire41))}));
          reg61 <= ($signed(wire41[(2'h3):(1'h1)]) ?
              (wire42[(4'he):(3'h4)] ?
                  ($signed($signed(reg58)) << reg25) : (8'ha5)) : ($unsigned(reg25) ?
                  $unsigned({{reg60, reg52}}) : reg49));
        end
      reg62 <= (reg59 <= reg26);
      reg63 <= reg35[(1'h0):(1'h0)];
      reg64 <= ($unsigned($signed((~&(reg28 ?
          (7'h43) : wire38)))) + (({(|reg51), (reg57 ? reg33 : wire45)} ?
          ((wire18 ? reg37 : reg53) ?
              $unsigned((8'hb7)) : (reg25 < reg24)) : $signed({reg59})) > $unsigned(reg61)));
      reg65 <= $signed({(~^reg33),
          ({(^~(8'hb3)), (wire17 != reg59)} * (((8'hbe) < reg32) ?
              reg35[(2'h2):(2'h2)] : ((8'h9c) ? reg23 : reg25)))});
    end
  assign wire66 = (8'haf);
  assign wire67 = ((($signed((7'h40)) <<< (-((8'hb3) * reg31))) ?
                          ((wire16[(4'he):(4'hb)] ?
                              $unsigned(wire40) : {reg36}) - reg31[(3'h6):(3'h4)]) : ($signed(reg36) >>> (reg54 - (|reg55)))) ?
                      (~|(!(reg35[(3'h4):(3'h4)] ?
                          (reg48 ?
                              reg31 : (8'ha6)) : reg60))) : $unsigned($signed(reg33[(1'h0):(1'h0)])));
  assign wire68 = reg64[(1'h0):(1'h0)];
  assign wire69 = $unsigned((&wire19[(3'h4):(2'h3)]));
endmodule
