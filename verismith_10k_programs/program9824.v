module top #(parameter param216 = (7'h40)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire215;
  wire signed [(3'h6):(1'h0)] wire214;
  wire signed [(5'h11):(1'h0)] wire213;
  wire signed [(4'h8):(1'h0)] wire212;
  wire signed [(4'ha):(1'h0)] wire211;
  wire [(4'he):(1'h0)] wire210;
  wire [(4'hf):(1'h0)] wire209;
  wire signed [(4'hf):(1'h0)] wire208;
  wire [(4'hb):(1'h0)] wire207;
  wire [(5'h11):(1'h0)] wire206;
  wire signed [(4'hb):(1'h0)] wire204;
  wire signed [(5'h13):(1'h0)] wire203;
  wire [(5'h14):(1'h0)] wire202;
  wire [(3'h6):(1'h0)] wire201;
  wire [(4'hf):(1'h0)] wire199;
  wire [(5'h13):(1'h0)] wire8;
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg4 = (1'h0);
  assign y = {wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire199,
                 wire8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire1[(3'h4):(2'h3)])
        begin
          reg4 <= wire3;
          reg5 <= (wire1 ?
              $unsigned(((~|reg4[(3'h6):(2'h2)]) < ((|wire3) & (8'hb0)))) : reg4[(4'h9):(2'h2)]);
        end
      else
        begin
          reg4 <= $unsigned(((wire3 ? $signed({wire3}) : (8'hab)) ?
              reg5[(2'h2):(2'h2)] : (~^(~&$unsigned(wire0)))));
          reg5 <= wire2;
          reg6 <= $unsigned(wire1[(2'h3):(2'h3)]);
        end
      reg7 <= $unsigned(reg5[(2'h3):(1'h0)]);
    end
  assign wire8 = {{$signed($signed((wire0 ? reg5 : reg6)))},
                     wire1[(2'h2):(1'h1)]};
  module9 #() modinst200 (.wire11(wire0), .clk(clk), .y(wire199), .wire12(reg4), .wire14(wire8), .wire13(wire3), .wire10(wire2));
  assign wire201 = $unsigned(wire2);
  assign wire202 = {(reg6 != wire3[(5'h15):(2'h3)]),
                       {{(-(wire201 ? (7'h44) : (8'hb1))), wire201},
                           (reg6 ?
                               $unsigned((wire3 ?
                                   reg5 : wire201)) : wire3[(4'hc):(4'hc)])}};
  assign wire203 = wire202;
  module34 #() modinst205 (.wire36(reg5), .wire39(wire3), .y(wire204), .clk(clk), .wire35(reg7), .wire38(reg6), .wire37(wire203));
  assign wire206 = ($unsigned((wire199[(2'h3):(1'h0)] * wire3[(3'h4):(1'h0)])) ?
                       ((|((^~wire202) <= (~^reg4))) | (8'hac)) : $unsigned($signed((-(reg5 ?
                           wire203 : wire1)))));
  assign wire207 = wire201;
  assign wire208 = wire207[(2'h3):(1'h0)];
  assign wire209 = (!($signed($unsigned({(8'h9f), wire199})) ?
                       ($unsigned((wire204 ? wire1 : wire1)) ?
                           wire204[(3'h4):(2'h2)] : ($signed(wire208) >>> {reg5})) : ((~(wire199 <= wire2)) ?
                           wire202[(4'h9):(1'h1)] : (^~(wire8 ?
                               (8'hba) : wire201)))));
  assign wire210 = $unsigned($signed(wire2[(4'h9):(3'h5)]));
  assign wire211 = (|reg7);
  assign wire212 = wire203[(3'h5):(3'h5)];
  assign wire213 = wire201[(3'h4):(2'h2)];
  assign wire214 = $unsigned($signed((~^$unsigned($signed(wire2)))));
  assign wire215 = ((~&((!$signed(reg6)) ?
                           wire209[(4'hf):(4'hc)] : ($unsigned((8'hbc)) ?
                               (-wire199) : (~|wire202)))) ?
                       {wire3,
                           (!((^wire199) ?
                               (wire8 + wire201) : $unsigned(wire0)))} : ((wire1 >> (+$signed(reg5))) && (8'hbf)));
endmodule

module module9  (y, clk, wire10, wire11, wire12, wire13, wire14);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire13;
  input wire signed [(5'h13):(1'h0)] wire14;
  wire [(3'h4):(1'h0)] wire198;
  wire signed [(4'hc):(1'h0)] wire196;
  wire [(4'hc):(1'h0)] wire195;
  wire [(2'h2):(1'h0)] wire176;
  wire [(4'he):(1'h0)] wire116;
  wire signed [(5'h13):(1'h0)] wire115;
  wire [(5'h11):(1'h0)] wire114;
  wire signed [(4'hb):(1'h0)] wire74;
  wire signed [(4'ha):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire112;
  wire [(5'h13):(1'h0)] wire178;
  wire signed [(4'he):(1'h0)] wire179;
  wire signed [(4'h8):(1'h0)] wire190;
  wire [(5'h12):(1'h0)] wire192;
  wire [(3'h6):(1'h0)] wire193;
  assign y = {wire198,
                 wire196,
                 wire195,
                 wire176,
                 wire116,
                 wire115,
                 wire114,
                 wire74,
                 wire33,
                 wire32,
                 wire31,
                 wire29,
                 wire76,
                 wire112,
                 wire178,
                 wire179,
                 wire190,
                 wire192,
                 wire193,
                 (1'h0)};
  module15 #() modinst30 (wire29, clk, wire11, wire12, wire10, wire13, wire14);
  assign wire31 = ((~&$signed($signed((wire14 >= wire14)))) ?
                      ((&wire29) ?
                          $unsigned((8'ha4)) : $unsigned($signed((wire10 >>> wire14)))) : (&$unsigned(((wire13 && wire12) ?
                          $signed(wire12) : $signed(wire29)))));
  assign wire32 = $unsigned($signed((!$unsigned(wire13))));
  assign wire33 = wire14;
  module34 #() modinst75 (.y(wire74), .clk(clk), .wire36(wire31), .wire35(wire29), .wire39(wire14), .wire37(wire12), .wire38(wire33));
  assign wire76 = wire12[(1'h1):(1'h1)];
  module77 #() modinst113 (.wire80(wire14), .wire78(wire31), .wire79(wire74), .y(wire112), .wire82(wire32), .clk(clk), .wire81(wire13));
  assign wire114 = $signed($signed((+$signed($unsigned(wire10)))));
  assign wire115 = wire10[(3'h4):(2'h3)];
  assign wire116 = ((wire112[(1'h1):(1'h0)] ?
                       $unsigned((wire10 ~^ $signed(wire31))) : $signed((7'h43))) >> {((!$signed(wire14)) ?
                           $unsigned(wire33[(4'h9):(4'h8)]) : $unsigned($signed(wire14))),
                       $signed((~(-(8'ha0))))});
  module117 #() modinst177 (.wire118(wire14), .wire120(wire112), .wire122(wire74), .clk(clk), .y(wire176), .wire121(wire76), .wire119(wire33));
  assign wire178 = wire13;
  assign wire179 = wire12;
  module180 #() modinst191 (.y(wire190), .clk(clk), .wire184(wire115), .wire183(wire112), .wire181(wire10), .wire182(wire114));
  assign wire192 = (((~|(|(wire74 ?
                       wire10 : (8'ha5)))) >= wire29) < $signed($signed((^(wire32 ?
                       wire112 : wire31)))));
  module15 #() modinst194 (.wire16(wire179), .y(wire193), .wire19(wire12), .clk(clk), .wire17(wire116), .wire18(wire112), .wire20(wire115));
  assign wire195 = $signed(wire193);
  module180 #() modinst197 (wire196, clk, wire14, wire12, wire114, wire192);
  assign wire198 = ($unsigned(wire176[(1'h1):(1'h1)]) || ($signed((((8'hac) ^ wire114) ?
                           (wire176 ? wire31 : (8'hb5)) : (&wire115))) ?
                       wire179 : ($unsigned(wire29) <= $unsigned((~wire31)))));
endmodule

module module180
#(parameter param189 = ({(((-(7'h41)) + ((8'ha2) >= (8'ha9))) ? (((8'hb1) < (7'h42)) ? ((8'ha7) ? (7'h44) : (8'haf)) : (-(8'hb5))) : {(8'hb8), (!(8'hb0))}), {(|{(8'ha8), (8'hb8)}), {((8'hb5) ? (8'hbe) : (7'h40))}}} ? ((8'hb3) ? (((8'hb6) < ((8'hbb) ? (8'hba) : (8'ha3))) ? (((8'hac) ? (8'ha7) : (8'h9d)) * (8'haf)) : (((8'hb5) >= (8'ha9)) >= (~|(8'h9d)))) : {((+(8'hb5)) << ((7'h41) != (7'h42)))}) : (!(~^(~{(8'hac)})))))
(y, clk, wire184, wire183, wire182, wire181);
  output wire [(32'h21):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire184;
  input wire signed [(5'h14):(1'h0)] wire183;
  input wire signed [(4'hc):(1'h0)] wire182;
  input wire signed [(2'h3):(1'h0)] wire181;
  wire [(5'h10):(1'h0)] wire187;
  wire [(2'h3):(1'h0)] wire186;
  wire [(2'h2):(1'h0)] wire185;
  reg signed [(4'hb):(1'h0)] reg188 = (1'h0);
  assign y = {wire187, wire186, wire185, reg188, (1'h0)};
  assign wire185 = ($signed(wire184[(5'h11):(2'h3)]) >> wire181);
  assign wire186 = $unsigned((wire185[(1'h1):(1'h0)] ?
                       (((wire183 << wire184) ? $signed(wire181) : (&wire183)) ?
                           (wire181[(2'h2):(1'h0)] ?
                               $signed(wire182) : (wire185 >= wire184)) : ($unsigned(wire184) ?
                               ((8'hb4) ? wire181 : wire181) : {wire184,
                                   wire182})) : $signed($signed(wire184[(3'h6):(2'h2)]))));
  assign wire187 = ((&$unsigned($signed({wire186, wire183}))) ?
                       $signed(wire183) : wire182);
  always
    @(posedge clk) begin
      reg188 <= {(wire181 ?
              $signed((wire183[(2'h3):(2'h2)] ?
                  {wire185, wire181} : wire184)) : $unsigned(((~|(8'hb5)) ?
                  (!wire185) : $signed((8'hab))))),
          wire182};
    end
endmodule

module module117  (y, clk, wire122, wire121, wire120, wire119, wire118);
  output wire [(32'h270):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire122;
  input wire signed [(4'h8):(1'h0)] wire121;
  input wire signed [(4'hb):(1'h0)] wire120;
  input wire signed [(4'ha):(1'h0)] wire119;
  input wire [(5'h12):(1'h0)] wire118;
  wire [(5'h12):(1'h0)] wire174;
  wire signed [(4'he):(1'h0)] wire166;
  wire [(5'h11):(1'h0)] wire165;
  wire [(4'h8):(1'h0)] wire164;
  wire signed [(4'ha):(1'h0)] wire154;
  wire [(4'h9):(1'h0)] wire131;
  wire [(3'h5):(1'h0)] wire130;
  wire [(5'h10):(1'h0)] wire129;
  wire signed [(5'h14):(1'h0)] wire128;
  wire signed [(4'he):(1'h0)] wire127;
  wire [(4'hd):(1'h0)] wire126;
  wire [(5'h10):(1'h0)] wire125;
  wire [(3'h7):(1'h0)] wire124;
  wire [(3'h7):(1'h0)] wire123;
  reg [(4'hc):(1'h0)] reg175 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg173 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg172 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg171 = (1'h0);
  reg [(4'he):(1'h0)] reg170 = (1'h0);
  reg [(5'h11):(1'h0)] reg169 = (1'h0);
  reg [(5'h13):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg167 = (1'h0);
  reg [(5'h14):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg161 = (1'h0);
  reg [(5'h12):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg159 = (1'h0);
  reg [(5'h12):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg156 = (1'h0);
  reg [(4'hd):(1'h0)] reg155 = (1'h0);
  reg [(2'h3):(1'h0)] reg153 = (1'h0);
  reg [(5'h14):(1'h0)] reg152 = (1'h0);
  reg [(4'h9):(1'h0)] reg151 = (1'h0);
  reg [(4'hb):(1'h0)] reg150 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  reg [(3'h5):(1'h0)] reg148 = (1'h0);
  reg [(2'h2):(1'h0)] reg147 = (1'h0);
  reg [(5'h10):(1'h0)] reg146 = (1'h0);
  reg [(5'h14):(1'h0)] reg145 = (1'h0);
  reg [(5'h14):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg142 = (1'h0);
  reg [(4'ha):(1'h0)] reg141 = (1'h0);
  reg [(4'h8):(1'h0)] reg140 = (1'h0);
  reg [(3'h6):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg138 = (1'h0);
  reg [(2'h3):(1'h0)] reg137 = (1'h0);
  reg [(3'h4):(1'h0)] reg136 = (1'h0);
  reg [(5'h13):(1'h0)] reg135 = (1'h0);
  reg [(3'h6):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg132 = (1'h0);
  assign y = {wire174,
                 wire166,
                 wire165,
                 wire164,
                 wire154,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 reg175,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg153,
                 reg152,
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
                 reg132,
                 (1'h0)};
  assign wire123 = wire122[(1'h0):(1'h0)];
  assign wire124 = wire118;
  assign wire125 = {{wire120[(4'h8):(3'h7)], wire118},
                       (~|$unsigned({$signed(wire121)}))};
  assign wire126 = (~$signed((~|((wire119 ? wire121 : wire121) ?
                       $signed(wire121) : {(8'hb8)}))));
  assign wire127 = $unsigned((($unsigned(wire126[(3'h5):(1'h0)]) && wire120) - (wire120[(2'h2):(2'h2)] ?
                       ((wire121 & wire123) ?
                           $signed((8'hb9)) : $unsigned(wire119)) : (wire124 ?
                           (~&wire125) : {(8'hb7)}))));
  assign wire128 = wire127[(2'h2):(1'h0)];
  assign wire129 = $signed(((wire118[(4'hf):(4'he)] >>> {$signed(wire123),
                       wire121}) * {wire119,
                       $signed((wire128 ? wire119 : wire118))}));
  assign wire130 = (8'ha8);
  assign wire131 = {(wire130[(3'h5):(1'h0)] ?
                           (wire127[(3'h6):(1'h0)] ?
                               (~^$signed(wire128)) : wire118[(4'hf):(1'h1)]) : wire122)};
  always
    @(posedge clk) begin
      if (($unsigned(wire122[(2'h3):(1'h1)]) >= (($unsigned($unsigned((7'h41))) || (^$signed((8'ha0)))) ?
          $unsigned(((+wire120) < $unsigned(wire129))) : ((^wire124[(3'h6):(3'h6)]) == ($unsigned(wire129) >= wire130)))))
        begin
          reg132 <= wire118;
          if ((~(^(wire125[(3'h7):(3'h7)] ?
              wire126[(4'hc):(4'h9)] : $signed((|wire131))))))
            begin
              reg133 <= wire126[(4'h9):(3'h4)];
              reg134 <= wire119[(3'h6):(3'h5)];
              reg135 <= $unsigned(({((reg134 >> (8'hb4)) >> $signed(wire121))} ?
                  $signed(wire126) : $unsigned((7'h42))));
              reg136 <= ($signed(({{wire120, reg134},
                  (wire121 - reg132)} <= $unsigned($unsigned(wire128)))) + reg132[(1'h1):(1'h1)]);
              reg137 <= wire131;
            end
          else
            begin
              reg133 <= $signed($signed($unsigned(((wire118 + wire118) & (reg136 >> wire129)))));
            end
          if ((~&($signed(wire120[(2'h3):(1'h1)]) ?
              ($unsigned(wire122) < $signed(wire124[(2'h3):(1'h1)])) : $unsigned({reg132,
                  ((8'hab) ? wire119 : wire123)}))))
            begin
              reg138 <= $signed((8'ha4));
              reg139 <= ($signed($unsigned($unsigned((wire126 ?
                      wire131 : reg138)))) ?
                  (8'hab) : (({wire121} >= $signed($signed(wire127))) >>> $signed((-reg132[(3'h4):(2'h3)]))));
            end
          else
            begin
              reg138 <= (~^(reg135 ?
                  (reg135 ?
                      $unsigned(wire131[(4'h8):(3'h7)]) : (reg139 ?
                          wire127 : $signed(wire125))) : $unsigned((reg139[(2'h3):(2'h3)] <= $signed(wire131)))));
              reg139 <= $signed((+(wire127 ?
                  $signed($signed(wire130)) : $unsigned($unsigned(reg135)))));
              reg140 <= wire126[(2'h2):(1'h1)];
              reg141 <= wire126;
              reg142 <= {(wire127 > wire119)};
            end
          reg143 <= ((^~(wire122 == ({wire123} ?
              (wire120 ?
                  (7'h40) : reg135) : wire127))) >> (|(reg136[(2'h3):(1'h0)] ?
              {wire131, (|wire126)} : $unsigned($unsigned(wire124)))));
        end
      else
        begin
          reg132 <= reg139;
        end
      if ($unsigned(((~|({reg137, reg135} ?
              (reg133 ? (8'h9c) : wire125) : (^~reg132))) ?
          (((-reg134) ? {reg134, reg135} : reg143) ?
              $unsigned((^~reg135)) : (reg139 ?
                  wire127 : (wire119 * wire120))) : (+wire131[(3'h4):(1'h0)]))))
        begin
          if ($signed(($unsigned(reg134[(1'h1):(1'h1)]) >= (wire127 ?
              reg140 : (~^reg141[(2'h3):(1'h0)])))))
            begin
              reg144 <= wire126[(4'hd):(4'h8)];
              reg145 <= ($unsigned(($signed(((8'hb3) ? wire130 : wire129)) ?
                      $signed($unsigned((8'hae))) : (wire124[(2'h2):(1'h0)] >>> $unsigned((8'hbf))))) ?
                  wire127[(1'h0):(1'h0)] : (wire123 + reg133));
              reg146 <= $unsigned(wire128[(2'h3):(2'h3)]);
              reg147 <= (-($signed(reg136[(2'h2):(1'h0)]) - reg138));
            end
          else
            begin
              reg144 <= (&({reg134[(1'h1):(1'h1)],
                      {(reg146 ? reg138 : reg134)}} ?
                  reg141[(1'h0):(1'h0)] : reg133));
              reg145 <= ((($unsigned(reg134) ?
                  ($signed(wire125) | reg147) : (|(wire124 + reg141))) ~^ (~&((wire127 * reg147) <<< ((8'ha9) == wire121)))) ^~ $unsigned(wire125));
              reg146 <= wire122[(1'h1):(1'h0)];
              reg147 <= ({{wire118}} * $signed((({wire121,
                      wire124} >> wire121) ?
                  {(~reg135), {wire125}} : (+wire130))));
            end
          if (((^~$signed((wire130 ? (wire125 != reg138) : wire122))) ?
              ($signed((+(+wire131))) - reg134) : wire119))
            begin
              reg148 <= wire127;
              reg149 <= reg138;
            end
          else
            begin
              reg148 <= $signed(((|$signed($unsigned(reg148))) ?
                  ((!{wire120}) * (wire131 ~^ $unsigned(wire123))) : (({wire119,
                          reg144} >> $signed(wire124)) ?
                      ((reg145 ? reg136 : wire129) ?
                          (^~wire119) : $signed(reg144)) : $signed({reg144}))));
              reg149 <= {$unsigned($signed(({wire129} >>> (wire130 & reg148))))};
            end
        end
      else
        begin
          if (({wire120[(3'h5):(2'h3)],
              (reg140[(4'h8):(3'h4)] != {(^~wire129)})} - (reg136 >> (^((wire118 ?
                  reg136 : reg143) ?
              (wire119 + reg142) : (wire125 ? reg137 : wire127))))))
            begin
              reg144 <= $unsigned((((&(reg141 ? wire118 : wire125)) ?
                      $unsigned((-reg134)) : $unsigned((reg132 + (8'hb2)))) ?
                  $unsigned($signed($unsigned(wire131))) : $unsigned({reg138,
                      $unsigned(reg142)})));
              reg145 <= (8'ha4);
              reg146 <= (((8'hb7) ?
                  $signed($signed($signed(wire120))) : $unsigned(((reg136 ?
                          wire130 : reg137) ?
                      {reg139} : $signed(reg144)))) + (wire131[(3'h4):(3'h4)] >>> wire121));
            end
          else
            begin
              reg144 <= ($unsigned((reg135[(4'h9):(3'h4)] ?
                  ((8'ha8) ?
                      {(8'ha6),
                          (8'ha1)} : (~|reg132)) : {reg137})) << (^~{$signed($unsigned(wire127)),
                  ($signed(reg144) * (reg143 * wire125))}));
            end
          if ($signed((reg133[(1'h0):(1'h0)] > (((wire129 ?
                  (8'hb1) : reg143) && (reg132 + reg144)) ?
              $signed($signed(wire122)) : {((8'haf) ? reg147 : reg145),
                  {reg132}}))))
            begin
              reg147 <= ((~^wire130[(3'h5):(1'h0)]) ?
                  wire121[(1'h0):(1'h0)] : wire131);
              reg148 <= (8'hb3);
              reg149 <= wire127[(2'h2):(1'h0)];
              reg150 <= (~^(~reg140));
              reg151 <= (^~wire126);
            end
          else
            begin
              reg147 <= $unsigned((~^reg142));
            end
        end
      if ($unsigned((~^{$signed(reg144[(5'h13):(4'hd)]), reg147})))
        begin
          reg152 <= {$signed((8'ha1))};
          reg153 <= {({((wire119 ^ (8'hb2)) ?
                          $signed(wire121) : (wire122 ? reg132 : reg142))} ?
                  (8'ha8) : reg134),
              $unsigned((wire125[(4'hf):(4'hc)] - (reg146[(4'he):(1'h0)] ?
                  (reg138 >> reg147) : $signed(reg138))))};
        end
      else
        begin
          reg152 <= wire120[(2'h3):(1'h0)];
          reg153 <= $unsigned((8'ha9));
        end
    end
  assign wire154 = ($signed((({reg135, (8'hba)} && (wire126 ?
                       wire126 : wire124)) <= (|reg139[(3'h5):(1'h1)]))) || $unsigned($unsigned($unsigned($unsigned(wire126)))));
  always
    @(posedge clk) begin
      if (($signed((((reg137 >> reg153) >> reg152) ^~ ((wire126 ^~ reg145) != (8'hbc)))) ?
          reg147[(2'h2):(1'h1)] : (((reg152[(5'h13):(4'hb)] ?
              reg151[(1'h1):(1'h0)] : (reg146 ^~ wire123)) || (wire122 ?
              {reg145, reg138} : {wire127})) <= (8'hbe))))
        begin
          reg155 <= $signed($signed((~&(!reg138[(2'h3):(2'h2)]))));
          reg156 <= {(~^(~^(~|(reg142 ? reg134 : wire125))))};
          reg157 <= {reg139[(1'h0):(1'h0)]};
          reg158 <= $signed((~{$signed($unsigned(wire123)),
              ($unsigned(wire126) >= (|reg139))}));
          reg159 <= reg158[(5'h10):(4'ha)];
        end
      else
        begin
          reg155 <= (reg142[(2'h2):(2'h2)] >>> ($unsigned(reg132) ?
              $unsigned($signed({(8'hb0)})) : wire129[(3'h7):(3'h4)]));
          reg156 <= reg155[(4'h9):(3'h6)];
          reg157 <= (+$unsigned(reg143[(4'h9):(3'h6)]));
          reg158 <= {((-{reg133, $unsigned(reg136)}) - reg139[(1'h1):(1'h0)])};
          if (reg136[(1'h1):(1'h1)])
            begin
              reg159 <= (~&{(|{$unsigned(reg144)}),
                  {(~^(~wire126)), {$signed(reg153), (~^reg151)}}});
              reg160 <= $unsigned((8'hab));
            end
          else
            begin
              reg159 <= ($unsigned(($unsigned((reg140 * (8'ha7))) ?
                      (+reg146[(3'h4):(1'h1)]) : (wire121 | (reg135 ?
                          wire131 : reg151)))) ?
                  (^(~$unsigned(reg151))) : wire125[(4'hc):(2'h2)]);
              reg160 <= $unsigned({reg144[(3'h7):(2'h2)]});
              reg161 <= (7'h44);
              reg162 <= (wire124 ~^ (wire121 ?
                  wire124[(2'h2):(2'h2)] : (((8'hb4) ?
                          (reg137 ? reg135 : reg158) : (-reg146)) ?
                      reg153 : reg141[(1'h0):(1'h0)])));
              reg163 <= (~|($unsigned((^~(~|reg135))) ?
                  reg155 : $signed({$unsigned(reg157),
                      (reg148 ? reg139 : reg141)})));
            end
        end
    end
  assign wire164 = ({reg132[(1'h0):(1'h0)]} ?
                       $unsigned((^~wire131[(3'h5):(3'h4)])) : (8'hb5));
  assign wire165 = reg147[(1'h0):(1'h0)];
  assign wire166 = wire127;
  always
    @(posedge clk) begin
      reg167 <= $signed((((reg135[(4'hb):(1'h0)] ?
                  $unsigned(wire129) : (wire165 | wire124)) ?
              (~|$signed(reg138)) : $unsigned(wire126[(4'h8):(2'h3)])) ?
          $signed(((reg152 && (8'haf)) ?
              (reg163 ? reg139 : reg159) : (8'hb1))) : reg150[(4'h9):(3'h6)]));
      if ((-{reg155, $unsigned($signed((reg139 | reg161)))}))
        begin
          if (reg136[(1'h1):(1'h0)])
            begin
              reg168 <= wire119[(3'h6):(3'h5)];
              reg169 <= (^((($unsigned(reg135) ?
                      reg148[(2'h2):(1'h0)] : (^reg137)) ?
                  (&{reg133,
                      wire126}) : reg159[(4'h9):(1'h0)]) != wire120[(4'hb):(4'h9)]));
            end
          else
            begin
              reg168 <= wire118[(2'h3):(2'h3)];
            end
          if ($signed({reg142, wire165[(3'h5):(2'h2)]}))
            begin
              reg170 <= (reg163 >>> {(~^($unsigned(reg161) ?
                      wire120[(2'h3):(1'h1)] : (reg161 != reg146))),
                  wire119});
              reg171 <= (^~(|($signed(wire154) ?
                  {(reg163 + reg141), (+wire124)} : {(reg157 ?
                          reg145 : reg136)})));
              reg172 <= reg140[(1'h1):(1'h1)];
            end
          else
            begin
              reg170 <= $signed(($signed({wire165}) <<< (~|reg170[(2'h2):(1'h0)])));
              reg171 <= $signed(reg156[(3'h4):(1'h0)]);
              reg172 <= $signed($unsigned({reg135}));
              reg173 <= ((reg142 >= reg146[(3'h4):(1'h1)]) <<< $unsigned(reg149[(5'h13):(4'ha)]));
            end
        end
      else
        begin
          if ($signed((^~(~^wire165))))
            begin
              reg168 <= (~^$unsigned({($unsigned(wire127) ?
                      (8'hb8) : wire127)}));
              reg169 <= $unsigned((($unsigned(reg138[(2'h3):(2'h3)]) ?
                      ($signed(reg168) > $signed(reg170)) : reg147[(1'h0):(1'h0)]) ?
                  $unsigned((reg171 ?
                      (reg162 != wire118) : $signed(reg144))) : $unsigned($unsigned($unsigned(reg167)))));
              reg170 <= ($unsigned((wire131 >>> $signed({reg168}))) || $signed($unsigned(wire121[(2'h3):(2'h3)])));
              reg171 <= ((($signed($signed((8'hb0))) >= (reg157 >> (&wire122))) ?
                      wire154[(2'h2):(2'h2)] : (reg152 ?
                          ((~|reg167) * (~|reg137)) : ($signed(reg173) ?
                              $unsigned((8'hb9)) : (wire131 && reg149)))) ?
                  ((7'h40) != reg140) : ((reg133[(2'h2):(1'h0)] + $unsigned({(8'ha9),
                          wire164})) ?
                      {$signed((reg172 ? wire124 : wire125)),
                          reg132} : reg145));
              reg172 <= $unsigned((~|(~^(~|(reg163 ? reg147 : reg135)))));
            end
          else
            begin
              reg168 <= $signed($unsigned(($signed((~|reg149)) < ({reg138} <= reg172))));
              reg169 <= ($unsigned(reg142[(4'h8):(4'h8)]) >>> ({((8'hbf) & (&(8'hab)))} ?
                  (((wire131 ? wire164 : wire127) ?
                      ((8'hab) ?
                          reg139 : wire119) : $signed(wire130)) <= (8'hbf)) : (reg144[(4'hb):(4'h9)] ?
                      reg138 : ((+reg152) ?
                          (reg133 ? wire128 : reg136) : reg136))));
            end
          reg173 <= $unsigned(reg160);
        end
    end
  assign wire174 = reg136[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg175 <= wire118[(4'hd):(3'h7)];
    end
endmodule

module module77  (y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire82;
  input wire signed [(4'hc):(1'h0)] wire81;
  input wire [(4'hb):(1'h0)] wire80;
  input wire [(4'hb):(1'h0)] wire79;
  input wire signed [(4'hf):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire111;
  wire [(4'ha):(1'h0)] wire110;
  wire signed [(5'h10):(1'h0)] wire109;
  wire signed [(5'h12):(1'h0)] wire94;
  wire signed [(2'h2):(1'h0)] wire93;
  wire signed [(5'h14):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire91;
  wire [(2'h3):(1'h0)] wire90;
  wire [(3'h5):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire83;
  reg [(4'hd):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg [(4'h9):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg103 = (1'h0);
  reg [(4'hc):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg98 = (1'h0);
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg signed [(4'he):(1'h0)] reg95 = (1'h0);
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg87 = (1'h0);
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire84,
                 wire83,
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
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  assign wire83 = (wire82 >= $signed($signed($signed($unsigned(wire81)))));
  assign wire84 = $signed(wire78[(3'h7):(1'h1)]);
  always
    @(posedge clk) begin
      reg85 <= {(|wire81[(3'h6):(1'h0)]), $unsigned(wire78[(3'h4):(2'h3)])};
      reg86 <= (8'ha1);
      reg87 <= ($signed({($unsigned(wire81) <= {wire79,
              wire78})}) & $signed(wire81[(2'h2):(2'h2)]));
      reg88 <= (reg86 ~^ $unsigned(reg85));
      reg89 <= (-(~reg86[(5'h11):(2'h3)]));
    end
  assign wire90 = ((8'hb6) < (wire82[(1'h1):(1'h1)] ?
                      $signed($unsigned(wire81[(4'hb):(4'h9)])) : wire81[(3'h6):(2'h3)]));
  assign wire91 = wire84;
  assign wire92 = $unsigned(wire82);
  assign wire93 = $signed(($unsigned({$signed(reg89), reg87}) && wire92));
  assign wire94 = {(^wire93)};
  always
    @(posedge clk) begin
      if (((wire82 >>> $signed({$unsigned(reg86)})) ^~ $signed((-reg85))))
        begin
          reg95 <= wire78;
          reg96 <= wire90[(2'h3):(2'h3)];
          reg97 <= reg95;
        end
      else
        begin
          reg95 <= ((reg88 >> {({reg88} ^~ wire91),
              $unsigned((wire94 >>> wire91))}) <<< $unsigned($unsigned(((^~(8'hb5)) ?
              $signed(wire79) : (~&wire79)))));
        end
      reg98 <= (~|reg97);
      reg99 <= $unsigned($signed((($unsigned(reg97) ?
          reg97 : $signed(reg98)) != {(wire79 > reg88)})));
      if ($unsigned(($unsigned($unsigned((reg99 ?
          reg96 : wire91))) << (~|$unsigned({wire92})))))
        begin
          reg100 <= $unsigned((wire93 ~^ (-wire80[(2'h3):(2'h3)])));
          reg101 <= (reg99 <= (~&(!$signed((8'hb8)))));
        end
      else
        begin
          reg100 <= {wire83};
          reg101 <= ({reg101[(4'h8):(3'h5)], reg98} && {($unsigned((reg86 ?
                      wire90 : reg96)) ?
                  $unsigned((|wire80)) : $signed(wire91))});
          reg102 <= (reg101[(4'h8):(3'h7)] ?
              wire94 : $signed((($unsigned((8'ha7)) << wire80) ?
                  reg96[(1'h1):(1'h0)] : $signed((wire79 | wire90)))));
          if ({$signed(wire78[(4'hf):(2'h2)])})
            begin
              reg103 <= ((~|$signed($signed(wire94))) ?
                  $unsigned(wire80) : (+({reg99} ?
                      $unsigned((^reg102)) : $signed((reg89 >= wire93)))));
              reg104 <= (($unsigned(wire80[(2'h2):(1'h1)]) > ((8'hb7) | $signed(reg88[(3'h7):(2'h3)]))) ?
                  {reg85[(3'h4):(2'h3)], $unsigned({reg95})} : reg87);
            end
          else
            begin
              reg103 <= $unsigned(reg99);
              reg104 <= $unsigned(($signed(wire91) ~^ wire78));
              reg105 <= wire81[(1'h1):(1'h1)];
              reg106 <= $signed(wire93[(2'h2):(1'h0)]);
              reg107 <= {$signed(wire81), (+{reg87})};
            end
          reg108 <= (+$unsigned((reg85 ?
              (^((7'h43) ? wire84 : reg86)) : $unsigned($unsigned((8'haa))))));
        end
    end
  assign wire109 = (+(((~|$unsigned(reg87)) ?
                       ((reg101 ?
                           reg101 : reg100) ^ (~^wire82)) : ($signed(reg100) | (!wire80))) <= (8'ha7)));
  assign wire110 = ($unsigned((8'hb8)) ?
                       $signed($unsigned($unsigned(reg103[(1'h0):(1'h0)]))) : (reg103 ?
                           reg103 : $unsigned(({reg98} << $signed(wire109)))));
  assign wire111 = reg107[(1'h0):(1'h0)];
endmodule

module module34
#(parameter param72 = {{(+({(8'haf), (8'h9f)} ? (8'ha5) : {(8'hab)}))}}, 
parameter param73 = param72)
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire39;
  input wire signed [(4'ha):(1'h0)] wire38;
  input wire [(5'h13):(1'h0)] wire37;
  input wire signed [(5'h13):(1'h0)] wire36;
  input wire [(3'h5):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire60;
  wire signed [(2'h3):(1'h0)] wire59;
  wire [(5'h14):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire [(4'he):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire50;
  wire [(3'h5):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire48;
  wire signed [(3'h4):(1'h0)] wire47;
  wire signed [(5'h15):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire45;
  wire signed [(4'hb):(1'h0)] wire44;
  wire signed [(3'h4):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire40;
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire54,
                 wire53,
                 wire52,
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
                 wire40,
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
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire40 = ({wire36[(4'hd):(4'hd)],
                      {wire38[(4'h9):(4'h8)],
                          (wire36[(3'h4):(3'h4)] ?
                              $signed(wire37) : (wire39 * wire36))}} >> wire39);
  assign wire41 = {(|(($signed(wire40) * $unsigned((8'hb2))) ?
                          $signed($unsigned(wire39)) : $signed((|wire40))))};
  assign wire42 = wire36;
  assign wire43 = wire35[(1'h0):(1'h0)];
  assign wire44 = wire38[(1'h1):(1'h1)];
  assign wire45 = ((^~$signed($signed((8'hb9)))) ?
                      $signed((wire44 ?
                          (wire44[(3'h5):(1'h0)] <= (wire35 < wire36)) : (~^wire41))) : wire36);
  assign wire46 = $signed((-wire45));
  assign wire47 = (wire39[(2'h2):(2'h2)] ?
                      {$unsigned((+wire41[(4'h8):(1'h1)])),
                          wire40[(5'h12):(3'h6)]} : (|{$signed({(8'hb1),
                              wire35}),
                          $signed($signed(wire39))}));
  assign wire48 = wire35[(1'h1):(1'h1)];
  assign wire49 = {($signed((~&(wire47 ? wire40 : wire38))) ?
                          ({wire37[(4'h8):(1'h0)]} == wire40) : wire39[(4'hb):(4'ha)])};
  assign wire50 = $unsigned((wire47 ?
                      (~^$unsigned((|wire36))) : (wire42[(1'h0):(1'h0)] - (8'ha6))));
  assign wire51 = $unsigned(wire45[(3'h6):(1'h1)]);
  assign wire52 = (|(wire48[(1'h1):(1'h1)] < wire39));
  assign wire53 = wire45;
  assign wire54 = (~|(($unsigned($unsigned(wire44)) ?
                          $signed(wire48[(3'h4):(1'h1)]) : wire36) ?
                      {(wire41[(4'hc):(3'h5)] != ((8'hb4) || wire36))} : $unsigned(((wire49 ^ wire38) ?
                          $signed(wire35) : $signed(wire42)))));
  always
    @(posedge clk) begin
      reg55 <= (wire37 ~^ ($signed({wire39}) ?
          (wire38[(3'h7):(3'h6)] | (wire37 < wire36)) : $signed((wire45 & (wire36 ?
              wire54 : wire43)))));
      reg56 <= $signed((|wire44));
      reg57 <= (-(($signed(reg55[(4'h8):(1'h0)]) | $unsigned((-(8'hae)))) ?
          (~&(~|(wire37 ?
              wire37 : wire41))) : (wire37[(4'ha):(1'h0)] <<< $signed(wire45[(4'hd):(4'hd)]))));
      reg58 <= wire40;
    end
  assign wire59 = reg55;
  assign wire60 = wire35[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      if ({{(wire42[(1'h0):(1'h0)] ^~ wire47[(2'h2):(1'h1)]),
              {$signed((+wire36)),
                  ((wire50 ? (8'hb7) : reg58) ?
                      ((8'hab) ? wire38 : wire44) : reg58[(3'h6):(2'h3)])}},
          wire37[(4'h8):(2'h3)]})
        begin
          if ($signed(wire59[(2'h2):(1'h1)]))
            begin
              reg61 <= reg58[(3'h6):(2'h3)];
              reg62 <= wire41[(4'h8):(3'h6)];
            end
          else
            begin
              reg61 <= reg62;
              reg62 <= $unsigned((wire49[(2'h2):(1'h0)] ~^ $signed({$unsigned((8'hb7)),
                  (-reg62)})));
              reg63 <= {$unsigned(reg55[(4'h8):(3'h7)]),
                  $signed(((~|{wire41}) ?
                      $signed($unsigned(wire35)) : ((wire43 ~^ reg58) - $signed((8'ha1)))))};
              reg64 <= (($signed((wire37 ?
                      (wire47 ^ reg55) : $signed(wire44))) ?
                  {$unsigned((^~wire51)),
                      wire46} : wire49) + $signed($signed($signed((wire53 ?
                  reg55 : wire53)))));
              reg65 <= (wire36[(2'h2):(2'h2)] || wire52[(4'h8):(2'h2)]);
            end
          reg66 <= $unsigned(wire60[(2'h3):(1'h0)]);
          reg67 <= ($unsigned({reg61[(2'h2):(1'h1)]}) ?
              (reg66 && $unsigned(reg61)) : (wire59[(2'h2):(1'h1)] == ($signed(wire37) & wire53)));
          reg68 <= (&{$signed((~$unsigned(reg61))),
              (~&($signed((8'haa)) ? $unsigned((8'hbc)) : {wire42, wire52}))});
        end
      else
        begin
          reg61 <= $unsigned($signed(wire54[(5'h13):(4'ha)]));
          reg62 <= (wire42[(2'h2):(1'h1)] >>> $unsigned(reg65[(3'h6):(1'h1)]));
          if (($signed((($unsigned(wire42) ?
              {reg55} : (wire38 ^~ reg61)) ~^ ({reg68} ?
              (wire37 ?
                  (8'haa) : (8'h9c)) : (8'ha5)))) == ((reg56[(1'h0):(1'h0)] ?
                  {(wire41 + (8'ha8)), $signed(wire59)} : ($signed(wire36) ?
                      (wire50 && reg67) : wire36)) ?
              wire45 : $signed(reg65))))
            begin
              reg63 <= $signed($unsigned($unsigned((~&{wire38}))));
              reg64 <= ($signed((8'hb8)) ? wire44 : (8'hb7));
              reg65 <= (~&$unsigned((((~wire50) == $signed(wire41)) ?
                  (wire41 > (-(7'h40))) : reg58[(2'h2):(1'h1)])));
              reg66 <= $unsigned(((&(((8'hb4) ? (7'h43) : reg65) ?
                  (+wire36) : reg56[(2'h2):(1'h0)])) <= $unsigned(wire50[(4'h8):(3'h4)])));
            end
          else
            begin
              reg63 <= wire51;
              reg64 <= (wire52[(1'h0):(1'h0)] < ({((wire37 ?
                      reg66 : wire44) - (wire50 ?
                      reg63 : (8'ha1)))} * $signed(($signed(wire59) ?
                  (wire44 ? wire48 : wire49) : ((8'hb2) + (8'hbc))))));
            end
        end
      reg69 <= (reg68[(3'h4):(1'h0)] ^~ (!reg68[(3'h4):(1'h1)]));
      reg70 <= ({{(+(|wire40)), $unsigned((^wire47))},
          $signed($signed($unsigned(wire47)))} >= {(wire52 * wire59), reg66});
      reg71 <= wire36[(3'h7):(3'h4)];
    end
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire20;
  input wire signed [(3'h4):(1'h0)] wire19;
  input wire [(4'hc):(1'h0)] wire18;
  input wire signed [(4'he):(1'h0)] wire17;
  input wire [(4'he):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire27;
  wire signed [(5'h10):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 (1'h0)};
  assign wire21 = ({(($unsigned(wire20) ?
                              wire20[(2'h2):(1'h0)] : wire18[(3'h6):(2'h3)]) <<< (~&(8'hbc))),
                          (|$unsigned(wire19[(2'h2):(1'h0)]))} ?
                      {$unsigned(($unsigned(wire19) ?
                              $signed((8'ha2)) : (wire19 == wire17))),
                          ((~|{wire16}) >>> (wire18 | $unsigned(wire16)))} : (wire17[(3'h5):(3'h5)] ?
                          $signed(wire19[(2'h3):(1'h1)]) : wire19));
  assign wire22 = {($unsigned(($signed(wire20) ^ (wire21 ? wire21 : wire19))) ?
                          $unsigned(wire20) : {wire19[(2'h2):(1'h0)],
                              ((wire17 <<< wire16) ?
                                  (wire19 ? (8'hb1) : (8'hac)) : {(8'hae),
                                      wire16})}),
                      ($signed($unsigned(wire19)) ?
                          $signed({((8'hb4) ? wire16 : wire20),
                              (+wire18)}) : (~((&wire19) ^~ (wire18 & wire16))))};
  assign wire23 = $unsigned($unsigned((((wire18 ?
                      wire16 : wire18) && $signed(wire18)) ~^ (~^((8'hb4) ?
                      (8'hab) : wire17)))));
  assign wire24 = wire21;
  assign wire25 = wire24;
  assign wire26 = (|(~|wire16[(1'h0):(1'h0)]));
  assign wire27 = (!((({wire26, wire17} > wire26) ?
                          ((+wire21) ?
                              wire18 : (wire21 ?
                                  wire19 : wire20)) : $unsigned(wire20[(5'h11):(4'hf)])) ?
                      wire18 : (wire23 < wire24)));
  assign wire28 = {$unsigned(({(wire20 ? (8'hae) : wire24)} ?
                          (8'hbf) : wire22[(4'hb):(4'hb)]))};
endmodule
