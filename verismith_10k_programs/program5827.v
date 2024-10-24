module top
#(parameter param197 = (((~|{(~^(8'ha6)), ((8'hbb) ? (7'h40) : (8'h9c))}) | (&((^~(8'hb3)) ? ((8'hac) ? (8'ha2) : (8'hae)) : ((8'hba) ? (7'h43) : (8'hb4))))) ? (~&(^~((!(8'hb5)) ^~ (8'h9c)))) : ({(((8'ha3) ? (8'hb5) : (8'ha6)) >>> (!(8'hb1))), {(^(8'hba))}} ~^ (((^~(8'hbf)) ? ((7'h42) ? (8'hb5) : (8'hbc)) : {(8'h9e), (8'ha9)}) > (+{(8'hb1), (7'h44)})))), 
parameter param198 = ((param197 ? (8'h9d) : param197) ? (({{param197}} && (param197 ? (param197 ? (8'hbe) : (8'ha6)) : (8'hbb))) << ((^param197) ^ (|param197))) : ({({param197, param197} >= {(8'hb2), param197}), {(param197 ? param197 : (8'haa)), (~^param197)}} || (~^{(param197 ? (8'h9f) : param197)}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  wire [(5'h15):(1'h0)] wire196;
  wire [(4'hb):(1'h0)] wire194;
  wire signed [(5'h12):(1'h0)] wire193;
  wire signed [(5'h11):(1'h0)] wire192;
  wire [(3'h6):(1'h0)] wire191;
  wire signed [(5'h10):(1'h0)] wire190;
  wire [(5'h15):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire188;
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  assign y = {wire196,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire4,
                 wire8,
                 wire188,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = {wire3[(4'h8):(1'h1)],
                     ($signed($signed((wire3 || wire0))) | $unsigned(({(7'h40)} ?
                         wire2[(1'h1):(1'h0)] : {wire3, wire1})))};
  always
    @(posedge clk) begin
      reg5 <= $signed(wire4);
      reg6 <= reg5;
      reg7 <= wire1[(3'h7):(1'h1)];
    end
  assign wire8 = $signed(reg7[(3'h6):(1'h0)]);
  module9 #() modinst189 (.wire13(reg5), .wire10(wire4), .clk(clk), .y(wire188), .wire14(wire0), .wire12(reg6), .wire11(wire3));
  assign wire190 = ({(((-reg5) & (wire2 ? wire2 : wire4)) ?
                               ({wire4, reg6} ~^ wire3[(2'h3):(1'h1)]) : wire1),
                           (8'ha1)} ?
                       $signed($signed($signed((wire1 ?
                           wire188 : wire8)))) : $unsigned((wire8 ?
                           (wire1 ?
                               (reg6 ?
                                   wire8 : wire188) : (-(8'h9f))) : wire2[(3'h7):(1'h0)])));
  assign wire191 = $signed(($signed(wire188) <= {{wire3[(3'h7):(3'h6)]}}));
  assign wire192 = $signed($unsigned(($signed(reg6[(5'h10):(4'hd)]) >= $unsigned((wire1 ?
                       (8'hba) : (8'h9e))))));
  assign wire193 = (wire3 ?
                       ((~(wire1[(3'h7):(3'h6)] <= wire191)) || (((wire4 ?
                                   wire191 : wire8) ?
                               $signed(wire188) : $unsigned((8'h9d))) ?
                           wire191[(2'h2):(2'h2)] : reg6)) : (reg5 ^ (~&(wire1[(4'hd):(4'h9)] ?
                           wire191 : wire0))));
  module18 #() modinst195 (wire194, clk, wire192, wire4, reg7, reg6);
  assign wire196 = (wire8 ?
                       $signed((({wire8, (8'ha0)} ^ $unsigned(wire188)) ?
                           (8'h9f) : ((wire194 <= wire188) >> $unsigned(reg5)))) : ((wire193[(4'ha):(4'h8)] >>> {reg7,
                           {wire1, (8'ha5)}}) + (&wire194)));
endmodule

module module9  (y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire14;
  input wire signed [(5'h11):(1'h0)] wire13;
  input wire [(5'h13):(1'h0)] wire12;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire154;
  wire signed [(4'he):(1'h0)] wire114;
  wire signed [(5'h11):(1'h0)] wire113;
  wire signed [(4'ha):(1'h0)] wire111;
  wire [(4'h8):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire92;
  wire [(4'hf):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire86;
  wire signed [(5'h10):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire61;
  wire [(5'h15):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire156;
  wire [(5'h12):(1'h0)] wire186;
  reg [(4'he):(1'h0)] reg116 = (1'h0);
  reg [(3'h6):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  assign y = {wire154,
                 wire114,
                 wire113,
                 wire111,
                 wire93,
                 wire92,
                 wire91,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire83,
                 wire63,
                 wire61,
                 wire17,
                 wire16,
                 wire15,
                 wire156,
                 wire186,
                 reg116,
                 reg115,
                 reg90,
                 reg85,
                 (1'h0)};
  assign wire15 = ((&$signed($signed((~|wire12)))) ? wire11 : wire13);
  assign wire16 = $unsigned(wire13);
  assign wire17 = $signed(($unsigned($unsigned(((8'ha7) || wire15))) ?
                      {(wire12[(4'hd):(3'h7)] >>> $signed(wire14))} : $signed($signed(wire12[(4'hc):(4'hb)]))));
  module18 #() modinst62 (wire61, clk, wire12, wire17, wire15, wire10);
  assign wire63 = {$signed($unsigned(wire61))};
  module64 #() modinst84 (wire83, clk, wire11, wire16, wire13, wire63);
  always
    @(posedge clk) begin
      reg85 <= wire16;
    end
  assign wire86 = $signed((wire83 ?
                      wire10[(3'h5):(2'h3)] : $signed($unsigned($unsigned(wire16)))));
  assign wire87 = (wire14 ?
                      wire16 : {$unsigned($unsigned((&wire10))), (~^wire11)});
  assign wire88 = $signed((^((reg85 ? $signed(wire15) : (~^wire17)) ?
                      (&$unsigned(wire87)) : $unsigned($signed(reg85)))));
  assign wire89 = ((-(!$signed(wire88[(2'h2):(1'h1)]))) ?
                      wire88[(2'h2):(2'h2)] : $unsigned($unsigned(reg85)));
  always
    @(posedge clk) begin
      reg90 <= $unsigned(wire83);
    end
  assign wire91 = wire12;
  assign wire92 = {wire13};
  assign wire93 = $unsigned({$signed({(reg90 && (8'hb2))})});
  module94 #() modinst112 (.wire97(wire17), .y(wire111), .clk(clk), .wire98(wire16), .wire96(wire91), .wire95(wire83));
  assign wire113 = $signed($unsigned(({(wire12 == (8'hb8)),
                       ((8'had) + wire92)} < $unsigned((wire87 || wire86)))));
  assign wire114 = wire83;
  always
    @(posedge clk) begin
      reg115 <= (wire10 > $unsigned((wire88[(4'hc):(1'h1)] ?
          $signed((wire113 ? (8'hb6) : wire88)) : ($unsigned(wire89) ?
              wire89 : $unsigned(wire92)))));
      reg116 <= $signed({$unsigned((|(&wire15)))});
    end
  module117 #() modinst155 (.wire118(wire111), .wire121(wire114), .wire119(wire113), .wire122(wire89), .y(wire154), .clk(clk), .wire120(wire17));
  assign wire156 = reg90;
  module157 #() modinst187 (wire186, clk, wire91, wire89, wire113, wire15, wire87);
endmodule

module module157
#(parameter param185 = ((((8'had) ? (((7'h40) ^ (8'h9c)) ? (~^(8'h9d)) : (~&(8'h9c))) : ((^(8'hb0)) || ((8'ha0) >>> (8'hbc)))) ? {(((8'hb1) != (8'hb1)) ? ((8'h9d) ? (8'had) : (8'hbf)) : ((8'hbe) ? (8'ha2) : (8'ha9)))} : ((((8'h9e) ? (8'haa) : (7'h44)) ? ((8'hb2) * (8'haf)) : ((8'hbb) * (8'ha0))) ~^ (((8'ha6) | (8'hb0)) ? ((8'ha7) >>> (8'ha3)) : {(8'hb0), (8'hba)}))) >> (~^((^~((8'had) & (7'h44))) <= (((8'hbb) ? (8'hbf) : (8'ha7)) ? ((8'hbc) ? (8'hb0) : (7'h43)) : ((8'ha0) ? (8'hbe) : (8'hb8)))))))
(y, clk, wire162, wire161, wire160, wire159, wire158);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire162;
  input wire signed [(5'h10):(1'h0)] wire161;
  input wire [(2'h2):(1'h0)] wire160;
  input wire [(5'h12):(1'h0)] wire159;
  input wire [(5'h14):(1'h0)] wire158;
  wire signed [(2'h2):(1'h0)] wire184;
  wire [(3'h5):(1'h0)] wire183;
  wire signed [(2'h2):(1'h0)] wire182;
  wire [(5'h10):(1'h0)] wire181;
  wire [(3'h4):(1'h0)] wire180;
  wire signed [(5'h12):(1'h0)] wire179;
  wire [(4'hc):(1'h0)] wire178;
  wire signed [(5'h11):(1'h0)] wire177;
  wire [(4'hb):(1'h0)] wire176;
  wire [(3'h5):(1'h0)] wire175;
  wire signed [(4'hc):(1'h0)] wire169;
  wire signed [(4'h8):(1'h0)] wire168;
  wire signed [(3'h5):(1'h0)] wire167;
  wire [(5'h13):(1'h0)] wire166;
  wire [(4'hf):(1'h0)] wire165;
  wire [(4'hb):(1'h0)] wire164;
  wire signed [(4'hf):(1'h0)] wire163;
  reg signed [(3'h6):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg173 = (1'h0);
  reg [(4'h9):(1'h0)] reg172 = (1'h0);
  reg [(5'h14):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg170 = (1'h0);
  assign y = {wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 (1'h0)};
  assign wire163 = wire161;
  assign wire164 = ({((~&(8'hbd)) ?
                           $unsigned($signed(wire162)) : (8'had))} < $unsigned($unsigned(wire163[(4'ha):(3'h6)])));
  assign wire165 = $signed((+(~|$signed((wire160 * wire163)))));
  assign wire166 = ((-(-wire158)) >> $unsigned($unsigned(wire160)));
  assign wire167 = $unsigned((((((8'ha9) + wire162) >= wire161[(4'hd):(2'h2)]) ?
                       $unsigned(wire166[(5'h11):(5'h10)]) : $unsigned(wire164[(3'h5):(3'h4)])) <= $signed((|(^wire161)))));
  assign wire168 = (~^((((-wire158) ?
                               (wire162 >= wire161) : wire166[(4'hc):(1'h1)]) ?
                           wire159[(5'h11):(5'h11)] : ((wire163 >> wire160) | $signed(wire159))) ?
                       wire164 : {(|(wire167 < wire159))}));
  assign wire169 = (((~^wire160[(2'h2):(2'h2)]) << wire167) ?
                       (wire158 ?
                           (~&(&(wire166 ?
                               wire161 : wire168))) : wire165) : (wire164 ^ $unsigned(({wire162,
                           (8'hb7)} > (wire161 + wire167)))));
  always
    @(posedge clk) begin
      reg170 <= $signed(wire162);
      reg171 <= wire161[(5'h10):(3'h5)];
      reg172 <= reg171[(5'h11):(2'h2)];
      reg173 <= {$unsigned(($signed(((8'ha9) <= (8'hb9))) ?
              $signed((7'h43)) : wire158))};
      reg174 <= reg173;
    end
  assign wire175 = $unsigned($unsigned($unsigned(wire161[(4'hb):(2'h3)])));
  assign wire176 = ($signed($unsigned({$signed(reg170)})) ?
                       $unsigned(reg173) : (wire166[(1'h1):(1'h0)] ?
                           wire168 : reg174[(3'h6):(3'h5)]));
  assign wire177 = reg174;
  assign wire178 = ($unsigned(((wire161 ?
                           (wire164 ?
                               wire160 : wire158) : wire168[(2'h3):(1'h0)]) >= wire176)) ?
                       wire177 : wire177[(3'h6):(2'h2)]);
  assign wire179 = (~|$signed((&((~(8'haf)) - (wire177 ? wire166 : reg171)))));
  assign wire180 = $unsigned($unsigned((^wire175[(1'h0):(1'h0)])));
  assign wire181 = ($unsigned($signed($signed(wire176))) ?
                       $unsigned($unsigned($unsigned((wire165 && wire161)))) : wire165);
  assign wire182 = {wire163,
                       (^(wire167 >>> $signed((wire179 ? wire181 : wire166))))};
  assign wire183 = (wire162 ?
                       {{(reg172[(3'h4):(2'h3)] + $signed(wire159))}} : (wire163 > (|(wire179 <= (wire162 < reg170)))));
  assign wire184 = (wire180[(1'h0):(1'h0)] ?
                       $signed(wire169) : (|{reg173,
                           ((wire161 <<< (8'hb4)) ?
                               (^wire183) : $signed(wire162))}));
endmodule

module module117
#(parameter param152 = (~&((^~(((8'hbd) - (8'hbb)) ? ((8'hbd) == (8'hb4)) : ((8'ha4) >> (8'haf)))) == (((~|(8'hb0)) ? {(8'hae), (7'h42)} : ((8'ha3) ? (8'hb9) : (8'hb9))) - {(^(8'haa))}))), 
parameter param153 = param152)
(y, clk, wire122, wire121, wire120, wire119, wire118);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire122;
  input wire signed [(4'h9):(1'h0)] wire121;
  input wire signed [(5'h10):(1'h0)] wire120;
  input wire [(3'h5):(1'h0)] wire119;
  input wire signed [(4'h8):(1'h0)] wire118;
  wire signed [(4'hb):(1'h0)] wire151;
  wire signed [(4'hd):(1'h0)] wire150;
  wire [(5'h14):(1'h0)] wire149;
  wire signed [(4'hb):(1'h0)] wire148;
  wire signed [(4'hd):(1'h0)] wire147;
  wire [(4'hb):(1'h0)] wire144;
  wire signed [(4'hd):(1'h0)] wire143;
  wire [(4'hc):(1'h0)] wire142;
  wire [(4'hb):(1'h0)] wire129;
  wire signed [(5'h15):(1'h0)] wire127;
  wire signed [(3'h4):(1'h0)] wire126;
  wire [(5'h14):(1'h0)] wire125;
  wire [(3'h7):(1'h0)] wire124;
  wire signed [(2'h2):(1'h0)] wire123;
  reg signed [(3'h6):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg141 = (1'h0);
  reg [(3'h5):(1'h0)] reg140 = (1'h0);
  reg [(3'h4):(1'h0)] reg139 = (1'h0);
  reg [(4'h9):(1'h0)] reg138 = (1'h0);
  reg [(4'hb):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg136 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg134 = (1'h0);
  reg [(5'h13):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg128 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire144,
                 wire143,
                 wire142,
                 wire129,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 reg146,
                 reg145,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg128,
                 (1'h0)};
  assign wire123 = (($signed(($signed((8'ha7)) * (~|(8'hb2)))) - wire122[(1'h1):(1'h1)]) || ((+wire119) ?
                       $unsigned(((~&wire120) ^~ (wire120 < wire120))) : (^wire119[(3'h5):(1'h1)])));
  assign wire124 = {({wire118[(3'h7):(3'h7)], wire122} ?
                           wire122 : ({$signed(wire119),
                               (wire118 ~^ wire122)} <= $signed(wire118)))};
  assign wire125 = $signed($unsigned({(~^(wire124 | (8'hb0)))}));
  assign wire126 = wire123;
  assign wire127 = $signed($unsigned(((^$signed(wire125)) - (wire121 ?
                       $unsigned(wire125) : (~wire121)))));
  always
    @(posedge clk) begin
      reg128 <= (|($unsigned($signed((~wire119))) + $signed(wire118)));
    end
  assign wire129 = (wire122[(2'h2):(1'h1)] >>> $unsigned({{$signed(wire125)}}));
  always
    @(posedge clk) begin
      if ($unsigned(wire123[(1'h0):(1'h0)]))
        begin
          reg130 <= (((~^$unsigned($signed(wire119))) ?
                  $unsigned(($unsigned(wire123) ?
                      {reg128, wire126} : $signed(wire122))) : reg128) ?
              $unsigned($signed((~^{wire121}))) : $signed(({$unsigned(wire118),
                  $signed(wire124)} ~^ $unsigned(wire125[(4'ha):(4'h9)]))));
        end
      else
        begin
          reg130 <= wire124;
          reg131 <= {(({(-wire118), (wire119 ? reg128 : wire121)} ?
                  (!wire122) : wire119) * wire127)};
        end
      reg132 <= $signed((7'h40));
      if ((!reg130[(2'h3):(2'h2)]))
        begin
          reg133 <= {wire120[(5'h10):(1'h0)]};
          reg134 <= {((($unsigned(reg130) ?
                  (reg133 ?
                      wire119 : wire118) : $unsigned((8'hb0))) & $unsigned($signed(reg128))) * ($signed((~^reg130)) ?
                  wire129 : (~&(-wire122)))),
              wire120[(3'h6):(2'h3)]};
          if ((~|(^~($unsigned({reg128, wire125}) ?
              $signed(wire125[(5'h11):(1'h0)]) : $signed((wire124 ?
                  wire125 : reg128))))))
            begin
              reg135 <= (~^{wire122[(1'h0):(1'h0)]});
              reg136 <= (~&wire120[(4'he):(2'h3)]);
              reg137 <= (|(~&$unsigned((wire129[(4'h8):(2'h2)] * (!(8'ha8))))));
              reg138 <= (~&($signed(($signed(wire119) ?
                      reg131 : $signed(reg132))) ?
                  wire120[(2'h2):(1'h0)] : $signed({(&wire118)})));
              reg139 <= {(!reg138[(1'h1):(1'h0)]),
                  (reg128[(1'h1):(1'h0)] ?
                      reg128[(1'h1):(1'h0)] : $unsigned(wire124))};
            end
          else
            begin
              reg135 <= wire120[(3'h6):(3'h4)];
              reg136 <= (!wire125[(4'h8):(3'h6)]);
              reg137 <= reg132;
              reg138 <= {((($signed(reg130) ?
                      (&wire122) : (reg138 ?
                          wire122 : reg137)) == (^~$unsigned(reg132))) || ($unsigned(reg133[(4'hc):(1'h1)]) ^~ {$signed(wire121)})),
                  $unsigned(reg130)};
            end
          reg140 <= (wire119[(1'h1):(1'h1)] + reg133);
        end
      else
        begin
          reg133 <= $signed(wire120[(1'h0):(1'h0)]);
        end
      reg141 <= (wire120 >>> ({(reg137 == wire125[(1'h0):(1'h0)])} < wire121[(3'h6):(2'h3)]));
    end
  assign wire142 = reg141;
  assign wire143 = {reg134};
  assign wire144 = $signed(((reg133 <= (~|((8'hb9) ~^ wire142))) ?
                       $signed($unsigned((reg130 ?
                           wire123 : reg133))) : ($unsigned((reg130 ?
                           wire122 : wire127)) < ($unsigned(wire121) ?
                           reg128 : $unsigned(wire127)))));
  always
    @(posedge clk) begin
      reg145 <= {reg139,
          {$signed((^{wire125})),
              $unsigned((reg136[(2'h3):(2'h2)] ?
                  $unsigned(wire125) : reg136[(1'h0):(1'h0)]))}};
      reg146 <= reg145;
    end
  assign wire147 = wire122[(2'h2):(1'h1)];
  assign wire148 = $signed(($unsigned(wire126) ?
                       $signed($signed(((8'hb8) ?
                           (8'had) : wire122))) : reg139[(2'h2):(1'h1)]));
  assign wire149 = (-reg139[(2'h3):(2'h3)]);
  assign wire150 = {reg136, ((8'ha0) <<< wire121[(4'h8):(3'h5)])};
  assign wire151 = $signed(reg136[(1'h0):(1'h0)]);
endmodule

module module94
#(parameter param109 = ({(~&(-{(8'hbd), (8'ha2)})), (({(8'hb2), (8'hab)} >>> (~^(8'ha2))) ? (((8'hb5) * (8'ha6)) <= (~&(8'h9c))) : (~^(~&(8'hb0))))} >>> ({(((8'hbb) & (7'h40)) >>> ((8'hb2) ? (8'h9f) : (8'ha2)))} ? (7'h42) : {((8'hb7) ? ((8'hb3) == (8'ha8)) : (-(8'hb1)))})), 
parameter param110 = param109)
(y, clk, wire98, wire97, wire96, wire95);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire98;
  input wire [(4'ha):(1'h0)] wire97;
  input wire signed [(3'h5):(1'h0)] wire96;
  input wire [(5'h10):(1'h0)] wire95;
  wire signed [(3'h6):(1'h0)] wire106;
  wire [(4'he):(1'h0)] wire105;
  wire [(4'hd):(1'h0)] wire104;
  wire signed [(5'h14):(1'h0)] wire99;
  reg [(4'hd):(1'h0)] reg108 = (1'h0);
  reg [(5'h14):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg103 = (1'h0);
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(5'h14):(1'h0)] reg101 = (1'h0);
  reg [(5'h13):(1'h0)] reg100 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire99,
                 reg108,
                 reg107,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  assign wire99 = $unsigned($unsigned((+{$signed(wire98), {wire95}})));
  always
    @(posedge clk) begin
      reg100 <= (^wire98[(4'hb):(4'h8)]);
      reg101 <= $signed(wire95[(4'hc):(3'h6)]);
      reg102 <= wire98[(4'h8):(1'h1)];
      reg103 <= wire98[(2'h2):(2'h2)];
    end
  assign wire104 = (($unsigned(reg100[(4'hf):(4'hc)]) ?
                       $signed($signed(reg102[(4'h9):(3'h7)])) : reg100[(4'hb):(2'h2)]) > (wire98[(4'hd):(3'h7)] ?
                       wire97 : ($signed($unsigned(reg103)) <<< $unsigned($signed(reg100)))));
  assign wire105 = (~^(($unsigned(wire99) ?
                           $unsigned(reg103) : $unsigned(wire95[(4'h8):(2'h3)])) ?
                       wire98[(4'hc):(2'h3)] : wire104));
  assign wire106 = ($signed({$signed({wire97})}) >>> ($signed(((wire99 + reg101) <= reg101)) ?
                       {$unsigned(wire99[(5'h10):(3'h5)]),
                           (|(~&reg102))} : (!$signed(wire98))));
  always
    @(posedge clk) begin
      reg107 <= ($unsigned({$signed((reg101 ?
              wire96 : wire98))}) ^ ($unsigned(((reg102 ?
              wire97 : wire98) ^~ (|wire104))) ?
          (reg102 ? wire104 : reg103) : $signed({$unsigned((8'ha1))})));
      reg108 <= reg102[(4'h9):(1'h0)];
    end
endmodule

module module64
#(parameter param82 = (-(~^((~|((8'ha0) ^~ (8'hbf))) ? {((8'ha2) <<< (8'hb5))} : {(~|(8'hbe)), {(7'h41), (7'h42)}}))))
(y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire68;
  input wire signed [(3'h6):(1'h0)] wire67;
  input wire signed [(5'h11):(1'h0)] wire66;
  input wire [(2'h2):(1'h0)] wire65;
  wire [(4'ha):(1'h0)] wire81;
  wire signed [(3'h7):(1'h0)] wire80;
  wire [(4'ha):(1'h0)] wire79;
  wire signed [(5'h15):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire77;
  wire signed [(3'h4):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  wire [(4'hc):(1'h0)] wire72;
  wire signed [(3'h5):(1'h0)] wire71;
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 reg70,
                 reg69,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg69 <= (wire68[(2'h3):(2'h2)] ? wire66 : wire66[(4'hd):(4'hb)]);
      reg70 <= (~&(&wire65[(2'h2):(1'h1)]));
    end
  assign wire71 = ($signed(wire66) + ({(^(~wire65))} > wire65[(2'h2):(2'h2)]));
  assign wire72 = (-$unsigned((|wire65)));
  assign wire73 = $signed($unsigned(((wire72[(1'h0):(1'h0)] ?
                          (~&wire65) : (wire66 ? wire68 : wire72)) ?
                      (wire72[(2'h3):(2'h3)] ?
                          $unsigned(wire72) : wire68[(1'h0):(1'h0)]) : wire72)));
  assign wire74 = (|($signed(((wire68 ^ wire72) ^~ reg70[(1'h0):(1'h0)])) > ($signed($unsigned(wire68)) <<< $signed(wire71[(2'h2):(1'h1)]))));
  assign wire75 = (&wire68[(1'h0):(1'h0)]);
  assign wire76 = (reg70[(3'h5):(1'h0)] ~^ $signed(wire73));
  assign wire77 = $unsigned(reg69[(2'h2):(1'h0)]);
  assign wire78 = wire77[(4'h9):(4'h8)];
  assign wire79 = (^wire75);
  assign wire80 = (+wire65[(2'h2):(2'h2)]);
  assign wire81 = ((^~((reg69 ? $signed(wire71) : wire78) ?
                      ($unsigned((8'h9c)) == {wire66,
                          (8'hba)}) : wire75[(2'h3):(1'h1)])) + (wire80 <= {{(wire71 - wire65),
                          (wire72 | (7'h41))}}));
endmodule

module module18  (y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h1d7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire22;
  input wire [(5'h15):(1'h0)] wire21;
  input wire [(2'h2):(1'h0)] wire20;
  input wire [(5'h10):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(4'h8):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire43;
  wire signed [(3'h6):(1'h0)] wire42;
  wire [(5'h15):(1'h0)] wire41;
  wire [(4'he):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire23;
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire37,
                 wire36,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg40,
                 reg39,
                 reg38,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire23 = wire21;
  assign wire24 = ((wire22[(3'h4):(1'h1)] && (+wire22[(4'ha):(3'h7)])) ?
                      wire21[(3'h4):(2'h2)] : wire21[(4'hc):(2'h3)]);
  assign wire25 = $signed(wire24);
  assign wire26 = {$unsigned(((|$signed(wire23)) ?
                          $signed(wire25) : $unsigned(wire20[(2'h2):(1'h1)]))),
                      {(wire20[(1'h0):(1'h0)] ?
                              {(wire21 ?
                                      wire20 : wire23)} : wire23[(1'h0):(1'h0)])}};
  assign wire27 = $signed($signed((8'ha1)));
  always
    @(posedge clk) begin
      reg28 <= $unsigned(wire26[(2'h2):(1'h0)]);
      reg29 <= {(wire19 ?
              (((&wire26) ? {reg28} : $signed(wire27)) ?
                  $unsigned(reg28) : reg28) : (~^(wire20[(1'h0):(1'h0)] ?
                  (^~wire21) : wire23))),
          wire23[(2'h2):(1'h1)]};
      if (($unsigned($signed({(wire24 ? wire27 : wire19)})) ?
          wire24[(4'h8):(3'h5)] : wire27))
        begin
          reg30 <= wire27;
        end
      else
        begin
          reg30 <= reg28[(4'hf):(1'h1)];
          reg31 <= $unsigned($signed(wire24[(2'h2):(1'h0)]));
          reg32 <= wire24[(3'h5):(3'h4)];
          reg33 <= wire27[(2'h2):(1'h0)];
          reg34 <= ((((wire22 ?
                      (wire24 ? reg29 : wire23) : {wire24,
                          reg33}) * (-$unsigned(wire26))) ?
                  reg31[(4'h8):(1'h0)] : ((|$signed(wire24)) ?
                      (-$signed((8'hb4))) : ($signed(wire25) ^~ $unsigned(reg31)))) ?
              (reg28[(4'h8):(2'h3)] - (((wire27 ? (7'h40) : reg33) >= (wire20 ?
                      wire21 : (7'h44))) ?
                  reg33[(2'h2):(1'h0)] : ((~|wire20) ^~ reg33[(3'h5):(3'h4)]))) : ($unsigned(reg29) ?
                  reg28[(2'h3):(1'h1)] : (~&((wire19 <= wire27) >> $unsigned(wire22)))));
        end
      reg35 <= ($signed(wire25) ?
          $signed($unsigned((^(reg30 & wire26)))) : $signed({((wire23 ?
                  reg34 : wire26) && (|wire20))}));
    end
  assign wire36 = ({($unsigned(wire21) ?
                              $unsigned(reg31[(5'h11):(4'ha)]) : (wire20 ?
                                  $unsigned(reg28) : wire23))} ?
                      (wire20[(1'h1):(1'h0)] ~^ (((reg35 ?
                              wire24 : (8'hb5)) == {reg32}) ?
                          $unsigned((wire21 <= wire24)) : {$signed(wire26),
                              $signed(wire25)})) : wire19[(5'h10):(3'h5)]);
  assign wire37 = ($unsigned((reg33[(1'h0):(1'h0)] ?
                      reg35[(1'h1):(1'h0)] : reg32[(1'h1):(1'h1)])) << $signed((8'hb1)));
  always
    @(posedge clk) begin
      reg38 <= wire24;
      reg39 <= $unsigned(((~^(reg34[(1'h1):(1'h0)] != {wire23})) ?
          ($unsigned(wire23) ?
              (+$unsigned(reg32)) : $unsigned($signed(reg33))) : reg33[(3'h4):(1'h1)]));
      reg40 <= $unsigned(reg30[(4'hd):(3'h4)]);
    end
  assign wire41 = {($signed($signed($unsigned(wire21))) ?
                          $unsigned((~(reg31 ~^ reg40))) : (((!wire19) | (|reg33)) ?
                              reg40 : ((wire19 ^~ wire22) ?
                                  (wire25 - wire27) : (reg32 * (8'hbe)))))};
  assign wire42 = $unsigned($unsigned((((reg38 ~^ (8'hbd)) | ((8'hbb) ?
                          wire20 : wire20)) ?
                      {$signed(wire25)} : reg38[(2'h2):(1'h0)])));
  assign wire43 = wire21[(5'h12):(5'h10)];
  assign wire44 = $signed(({wire19} ?
                      wire27[(2'h2):(1'h1)] : ((~(wire37 <<< reg30)) ?
                          ({wire25, wire36} ?
                              reg35[(3'h4):(1'h0)] : (-reg38)) : ((!reg40) ?
                              (~^reg32) : (^wire22)))));
  assign wire45 = (^wire26);
  assign wire46 = wire41;
  assign wire47 = wire27[(1'h0):(1'h0)];
  assign wire48 = (wire27[(2'h2):(1'h1)] == ($signed($unsigned((&(8'hb6)))) ?
                      reg39[(2'h2):(1'h0)] : reg30[(3'h6):(1'h0)]));
  assign wire49 = {$signed(wire26)};
  assign wire50 = $signed(reg30);
  assign wire51 = wire43;
  always
    @(posedge clk) begin
      reg52 <= (!(((wire50[(4'h8):(1'h0)] ^ (+wire42)) >>> (reg38[(3'h4):(2'h3)] ?
          wire46 : wire48[(5'h11):(3'h4)])) || $signed({(wire37 ?
              (8'had) : (8'hbc))})));
      if ($unsigned(((wire49[(3'h5):(2'h3)] > $signed({reg38})) ^~ (~^$signed($signed(wire41))))))
        begin
          reg53 <= (((&wire21) ?
                  ($unsigned(wire22) != (^{wire45,
                      wire25})) : (~$signed($unsigned(reg32)))) ?
              $signed(wire37) : wire26[(2'h2):(1'h1)]);
          if ((($unsigned((~^(~|wire25))) ?
                  $signed($unsigned(wire51)) : $signed((~|$unsigned(reg33)))) ?
              (wire42 * reg52[(2'h3):(2'h2)]) : $unsigned($signed((((7'h43) ?
                  wire42 : wire45) - wire51[(3'h7):(2'h3)])))))
            begin
              reg54 <= wire23;
              reg55 <= wire23;
              reg56 <= $signed($unsigned(reg33[(3'h4):(1'h1)]));
              reg57 <= wire19;
              reg58 <= (^~$unsigned((reg33[(1'h0):(1'h0)] ?
                  reg33[(1'h0):(1'h0)] : (reg35 < $unsigned(wire22)))));
            end
          else
            begin
              reg54 <= (~|$unsigned(reg40));
            end
        end
      else
        begin
          reg53 <= $signed(reg38);
          reg54 <= $signed((~(((wire47 >= reg35) ~^ (wire27 ?
              (8'ha1) : wire25)) << (^~(reg55 && wire26)))));
          reg55 <= wire44;
          reg56 <= (&wire36[(4'ha):(4'ha)]);
        end
    end
  assign wire59 = $unsigned(((&{(wire24 ? reg54 : (8'hb9)),
                      (reg38 & wire51)}) ^~ $unsigned((~^wire50))));
  assign wire60 = ($unsigned((^wire43)) ?
                      ($signed($unsigned((~|reg30))) ?
                          $signed((wire48[(4'hf):(4'he)] * {wire24,
                              reg53})) : wire42[(1'h1):(1'h0)]) : ((reg30[(5'h11):(4'ha)] > (~(wire21 ?
                              wire20 : wire37))) ?
                          ($unsigned((reg31 <= (8'h9f))) + (+(!wire26))) : wire23[(1'h0):(1'h0)]));
endmodule
