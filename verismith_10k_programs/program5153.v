module top
#(parameter param211 = (((^~(((8'haa) ? (8'hb0) : (8'hb7)) ? (^~(8'hb3)) : (|(8'hba)))) ? {({(8'ha2)} ? ((8'hb3) || (8'hb9)) : ((8'haf) >> (7'h43))), (&{(8'hbd)})} : (|((-(8'ha4)) ? ((8'hac) ? (8'haf) : (8'ha7)) : {(8'haa), (8'hb9)}))) != ((!{((8'ha7) >= (7'h43))}) ~^ (~^((&(8'h9d)) ? (~|(8'h9f)) : ((8'hac) ? (8'ha1) : (8'hb1)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire210;
  wire [(5'h14):(1'h0)] wire209;
  wire signed [(4'he):(1'h0)] wire203;
  wire signed [(3'h6):(1'h0)] wire202;
  wire [(5'h15):(1'h0)] wire201;
  wire signed [(3'h6):(1'h0)] wire200;
  wire [(3'h6):(1'h0)] wire199;
  wire signed [(4'hd):(1'h0)] wire187;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire189;
  wire [(3'h4):(1'h0)] wire197;
  reg signed [(5'h12):(1'h0)] reg208 = (1'h0);
  reg [(3'h5):(1'h0)] reg207 = (1'h0);
  reg signed [(4'he):(1'h0)] reg206 = (1'h0);
  reg [(4'ha):(1'h0)] reg205 = (1'h0);
  reg [(5'h12):(1'h0)] reg190 = (1'h0);
  reg [(4'hc):(1'h0)] reg191 = (1'h0);
  reg [(4'hf):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg193 = (1'h0);
  reg [(3'h4):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg196 = (1'h0);
  assign y = {wire210,
                 wire209,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire187,
                 wire7,
                 wire6,
                 wire5,
                 wire189,
                 wire197,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg190,
                 reg191,
                 reg192,
                 reg193,
                 reg194,
                 reg195,
                 reg196,
                 (1'h0)};
  assign wire5 = (((^(~&((8'hb6) >>> wire4))) ?
                     {$signed((8'ha6))} : (7'h43)) <<< wire4);
  assign wire6 = ($unsigned(wire0) >>> ($unsigned($unsigned(((8'ha2) ?
                         wire2 : wire1))) ?
                     wire2[(4'h8):(1'h0)] : ($unsigned(((8'hbb) ^ (8'ha3))) ?
                         wire4 : (|$signed(wire1)))));
  assign wire7 = $unsigned((!{({wire1, wire3} ?
                         (wire4 - wire2) : (~|(8'hb3)))}));
  module8 #() modinst188 (wire187, clk, wire7, wire0, wire1, wire4, wire5);
  assign wire189 = $signed(wire3);
  always
    @(posedge clk) begin
      reg190 <= wire2;
      if (wire6[(1'h0):(1'h0)])
        begin
          reg191 <= {$signed(wire6)};
          reg192 <= (wire5[(3'h6):(2'h3)] ?
              $unsigned(($signed((reg190 | wire2)) ?
                  ((~^wire7) <= (wire6 * wire3)) : (&{(8'ha8)}))) : (wire1[(3'h6):(2'h3)] <<< wire5[(4'h8):(2'h3)]));
          reg193 <= (($unsigned($unsigned(reg190)) ^~ $unsigned(reg191)) ?
              wire187[(2'h3):(2'h2)] : $unsigned(reg190[(4'h8):(4'h8)]));
          reg194 <= wire0;
          reg195 <= ($signed(wire2) - $unsigned($signed($unsigned($unsigned(wire187)))));
        end
      else
        begin
          reg191 <= (~|($signed($signed({(8'hb7)})) ?
              {$unsigned((|reg194)),
                  {{wire7}}} : (((^~(8'hb2)) >> wire1[(1'h0):(1'h0)]) + $signed((~&wire1)))));
          reg192 <= (reg191 <<< reg194);
        end
      reg196 <= reg194;
    end
  module77 #() modinst198 (wire197, clk, wire4, wire187, reg192, wire3, reg191);
  assign wire199 = (^(^((!$unsigned(wire2)) ?
                       ((~&reg192) ?
                           (~|wire187) : (wire6 ^ wire4)) : (+$signed(wire2)))));
  assign wire200 = (($unsigned((8'ha5)) ?
                           ({(-wire197)} == $unsigned({wire0,
                               wire1})) : (~$unsigned($unsigned(wire3)))) ?
                       $unsigned(((~&{wire6, (8'haa)}) ?
                           ($unsigned(wire7) ~^ reg191[(4'hb):(2'h3)]) : ($unsigned(reg190) && (^~wire0)))) : reg194);
  assign wire201 = (wire7 - wire189);
  assign wire202 = $signed((|{(!(reg196 ? wire187 : wire199)),
                       wire201[(3'h4):(2'h3)]}));
  module50 #() modinst204 (.wire51(wire1), .y(wire203), .wire53(wire6), .wire55(wire187), .clk(clk), .wire54(wire0), .wire52(reg195));
  always
    @(posedge clk) begin
      reg205 <= $signed((~&$signed((reg193[(1'h1):(1'h1)] ?
          (wire202 <= wire6) : (reg194 ? wire5 : wire3)))));
      reg206 <= $unsigned((^~$unsigned(((reg194 && wire3) != (~&reg205)))));
      reg207 <= {(~^(~|$unsigned(((7'h44) > wire203)))), (8'hbf)};
      reg208 <= wire6;
    end
  assign wire209 = $unsigned({(wire197[(1'h1):(1'h0)] ?
                           $signed(reg207) : $signed(reg196)),
                       {(+wire0[(4'h8):(3'h6)])}});
  assign wire210 = (~((wire7 ?
                           ((reg193 ?
                               reg205 : wire5) >>> $signed(reg196)) : ((8'h9d) ?
                               $signed((8'h9d)) : ((8'ha8) != wire2))) ?
                       (^($unsigned(wire199) << {wire199})) : $unsigned($unsigned(reg191[(2'h3):(2'h3)]))));
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h195):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire11;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire [(4'hc):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire186;
  wire [(2'h3):(1'h0)] wire185;
  wire [(4'he):(1'h0)] wire184;
  wire signed [(5'h15):(1'h0)] wire183;
  wire [(3'h4):(1'h0)] wire170;
  wire signed [(4'he):(1'h0)] wire169;
  wire [(4'h9):(1'h0)] wire168;
  wire [(5'h15):(1'h0)] wire167;
  wire signed [(4'hb):(1'h0)] wire166;
  wire [(3'h5):(1'h0)] wire165;
  wire signed [(5'h15):(1'h0)] wire164;
  wire [(3'h5):(1'h0)] wire163;
  wire [(4'hc):(1'h0)] wire162;
  wire signed [(4'hb):(1'h0)] wire156;
  wire signed [(4'he):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire76;
  wire [(4'he):(1'h0)] wire126;
  reg signed [(2'h3):(1'h0)] reg182 = (1'h0);
  reg [(4'he):(1'h0)] reg181 = (1'h0);
  reg [(5'h10):(1'h0)] reg180 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg179 = (1'h0);
  reg [(4'h8):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg176 = (1'h0);
  reg [(4'h8):(1'h0)] reg175 = (1'h0);
  reg [(2'h3):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg171 = (1'h0);
  reg [(4'hb):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg159 = (1'h0);
  reg [(3'h6):(1'h0)] reg158 = (1'h0);
  assign y = {wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire156,
                 wire74,
                 wire49,
                 wire14,
                 wire47,
                 wire76,
                 wire126,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 (1'h0)};
  assign wire14 = wire10;
  module15 #() modinst48 (.wire20(wire12), .wire19(wire10), .clk(clk), .wire18(wire14), .wire16(wire11), .y(wire47), .wire17(wire13));
  assign wire49 = (wire12[(3'h5):(1'h1)] != ((((wire47 - wire10) > wire12[(4'h9):(2'h2)]) ?
                      $unsigned((wire47 || wire12)) : $unsigned((~^wire9))) || (~^{(~^wire12),
                      $unsigned(wire13)})));
  module50 #() modinst75 (.wire52(wire12), .wire55(wire9), .wire51(wire11), .y(wire74), .wire53(wire14), .wire54(wire47), .clk(clk));
  assign wire76 = $signed((~wire9[(4'hc):(2'h3)]));
  module77 #() modinst127 (.wire82(wire9), .wire80(wire13), .y(wire126), .wire81(wire47), .wire78(wire74), .wire79(wire49), .clk(clk));
  module128 #() modinst157 (.wire131(wire126), .wire129(wire13), .wire132(wire76), .clk(clk), .wire130(wire9), .y(wire156));
  always
    @(posedge clk) begin
      if ((($signed((-(-wire9))) ?
          (((wire156 & wire9) || $unsigned(wire11)) ?
              wire74 : $unsigned(wire12)) : ((!wire156) + ($signed(wire74) ?
              wire47[(4'h9):(4'h8)] : wire76[(4'h8):(1'h0)]))) ~^ $signed((wire156 ~^ $signed((^wire156))))))
        begin
          reg158 <= (wire47 ? $unsigned($signed(wire76)) : (7'h40));
        end
      else
        begin
          reg158 <= {{({(wire74 << wire156), reg158} ?
                      (8'hae) : ((^~wire76) - $signed((8'hb0)))),
                  wire13},
              {wire9[(1'h0):(1'h0)]}};
          reg159 <= wire14;
        end
      reg160 <= $unsigned($unsigned((($unsigned(wire13) ?
          (wire13 >= wire47) : wire12[(4'h8):(3'h5)]) ~^ $signed($unsigned(wire49)))));
      reg161 <= $unsigned(reg158);
    end
  assign wire162 = {$signed($unsigned((~&(wire76 ? (8'haa) : wire13))))};
  assign wire163 = wire9[(3'h6):(1'h0)];
  assign wire164 = reg158[(2'h2):(1'h0)];
  assign wire165 = wire13[(4'hb):(4'ha)];
  assign wire166 = ($signed(reg161[(4'hb):(1'h0)]) ?
                       ((((reg159 ? (8'hb8) : wire47) <<< (wire14 & (8'ha3))) ?
                           wire10 : (+(^wire165))) > ({wire126} ?
                           $signed($signed((8'had))) : wire13[(4'hb):(1'h1)])) : wire11[(3'h6):(1'h0)]);
  assign wire167 = $signed($signed($unsigned(({(8'hb8), reg160} ?
                       (!wire165) : (wire13 >> wire126)))));
  assign wire168 = reg161;
  assign wire169 = wire163[(1'h1):(1'h1)];
  assign wire170 = wire74[(3'h6):(3'h6)];
  always
    @(posedge clk) begin
      reg171 <= {(($unsigned((reg159 != (8'ha9))) + (8'ha9)) && {((!wire14) ?
                  wire162[(4'h9):(3'h7)] : wire13),
              wire14[(4'ha):(3'h6)]})};
      if (((~|$signed(({wire13} >> $signed(wire156)))) << (8'hbf)))
        begin
          if (wire9)
            begin
              reg172 <= wire170;
              reg173 <= wire74;
              reg174 <= $signed((8'ha7));
              reg175 <= ({($unsigned((wire163 ^~ wire165)) ?
                          {(reg171 >= reg161)} : wire162[(3'h4):(1'h1)])} ?
                  $unsigned($signed(($signed(wire164) ?
                      (wire74 << reg159) : (&wire169)))) : (((~(wire49 && (8'ha9))) || (~^$signed(wire167))) ?
                      (-$unsigned((~^wire10))) : (($signed(wire12) ?
                              $unsigned(wire13) : (reg160 ? wire10 : wire170)) ?
                          (wire49 ?
                              (-wire169) : $unsigned((8'hb1))) : $signed((wire49 != reg158)))));
            end
          else
            begin
              reg172 <= ($unsigned(wire10) ?
                  reg174 : {$unsigned(wire162[(3'h7):(1'h0)])});
            end
          reg176 <= (~&wire74[(3'h6):(1'h1)]);
          if ((&{$signed((!wire11[(2'h2):(1'h1)])), reg158}))
            begin
              reg177 <= $signed($unsigned((reg172 || $unsigned((^~wire169)))));
              reg178 <= {$unsigned($unsigned(wire168)),
                  {wire47[(3'h5):(3'h5)], wire163[(2'h3):(1'h0)]}};
              reg179 <= reg171[(3'h7):(3'h5)];
            end
          else
            begin
              reg177 <= $unsigned(reg176);
              reg178 <= $signed((($unsigned((wire164 <<< reg159)) ~^ (^((8'haf) >= reg161))) != $unsigned($unsigned($unsigned(wire47)))));
              reg179 <= {wire167};
            end
        end
      else
        begin
          reg172 <= (|(~^$unsigned(reg177[(2'h2):(1'h1)])));
          if ($signed((reg172 ?
              (({(8'hbe)} > (wire14 <<< reg172)) ?
                  (|(+wire126)) : {reg174[(2'h2):(1'h0)]}) : ($signed($signed(reg158)) ?
                  $signed($signed(wire13)) : wire9[(4'hf):(3'h4)]))))
            begin
              reg173 <= $signed($unsigned($unsigned(wire170)));
              reg174 <= (((~$unsigned((wire10 ?
                      wire47 : wire167))) <<< wire167) ?
                  wire163[(2'h2):(1'h0)] : ((reg179[(2'h2):(1'h1)] ?
                      (+(~&wire10)) : wire126[(4'h8):(4'h8)]) <<< ($unsigned($signed(wire167)) ?
                      (~&{(8'ha8), wire166}) : (~^$signed(reg171)))));
              reg175 <= wire47;
            end
          else
            begin
              reg173 <= wire168;
              reg174 <= ($signed(wire11) ^ $signed((~|reg172[(2'h3):(2'h2)])));
              reg175 <= (reg175 & $unsigned((wire169[(1'h0):(1'h0)] >> wire12[(4'hb):(3'h6)])));
              reg176 <= $signed((wire11[(1'h0):(1'h0)] ?
                  $signed(((reg171 | wire167) >>> (reg175 & wire163))) : $unsigned($unsigned(((8'hb6) - reg158)))));
            end
          reg177 <= (+$unsigned({wire165[(3'h5):(1'h1)],
              ((reg178 + wire13) ? (+reg176) : (reg171 ? (7'h43) : wire126))}));
          if ($unsigned(reg172[(3'h6):(2'h3)]))
            begin
              reg178 <= $signed(reg173[(2'h3):(2'h2)]);
              reg179 <= (wire156[(3'h5):(3'h5)] & $unsigned(wire162[(4'ha):(1'h1)]));
            end
          else
            begin
              reg178 <= ((reg177 < {(~&reg175)}) ?
                  $signed($unsigned(((reg178 == reg176) ^ wire126))) : ({(&reg173)} == wire74[(2'h2):(1'h0)]));
              reg179 <= $signed(reg176);
              reg180 <= {wire162, ($signed(wire76) > wire74)};
              reg181 <= reg161[(1'h0):(1'h0)];
            end
          reg182 <= wire74;
        end
    end
  assign wire183 = (~wire10[(2'h2):(1'h1)]);
  assign wire184 = {(|(($signed(wire47) < ((8'hb2) ?
                           wire162 : wire164)) && $unsigned($unsigned(wire170)))),
                       $signed($signed(((wire49 >= (8'hbf)) == $signed(wire76))))};
  assign wire185 = (^(~&reg171));
  assign wire186 = ($signed($unsigned(($unsigned((8'ha5)) * (|wire49)))) ^~ $unsigned(wire76[(3'h4):(1'h0)]));
endmodule

module module128
#(parameter param154 = (&(^(^{(+(7'h44))}))), 
parameter param155 = param154)
(y, clk, wire132, wire131, wire130, wire129);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire132;
  input wire [(4'h9):(1'h0)] wire131;
  input wire signed [(5'h13):(1'h0)] wire130;
  input wire [(4'hc):(1'h0)] wire129;
  wire signed [(4'h9):(1'h0)] wire143;
  wire [(5'h10):(1'h0)] wire142;
  wire [(3'h6):(1'h0)] wire134;
  wire [(3'h6):(1'h0)] wire133;
  reg signed [(4'he):(1'h0)] reg153 = (1'h0);
  reg [(5'h15):(1'h0)] reg152 = (1'h0);
  reg [(2'h3):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg147 = (1'h0);
  reg [(5'h11):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg145 = (1'h0);
  reg [(2'h2):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg141 = (1'h0);
  reg [(5'h14):(1'h0)] reg140 = (1'h0);
  reg [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(4'h8):(1'h0)] reg138 = (1'h0);
  reg [(4'hc):(1'h0)] reg137 = (1'h0);
  reg [(5'h13):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg135 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire134,
                 wire133,
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
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 (1'h0)};
  assign wire133 = $signed({($signed(wire132) ?
                           wire132 : ($signed(wire131) <= wire130))});
  assign wire134 = ((^~$unsigned(wire132)) ?
                       (|(!(~|wire130))) : $unsigned((($unsigned(wire132) >> (8'ha1)) > $signed((~wire133)))));
  always
    @(posedge clk) begin
      if ($unsigned(({((wire129 ? wire130 : wire130) ?
              wire132[(1'h1):(1'h1)] : wire131)} <= (!(|wire134[(3'h5):(3'h5)])))))
        begin
          reg135 <= wire132[(1'h0):(1'h0)];
          reg136 <= (reg135 >= (($unsigned(wire129[(4'h9):(3'h4)]) ?
                  (+wire130[(4'hc):(3'h5)]) : wire131[(2'h3):(1'h0)]) ?
              (((8'hb7) ?
                  wire130 : {wire130}) | $unsigned(wire131[(3'h4):(2'h3)])) : (^{(8'ha9)})));
        end
      else
        begin
          reg135 <= wire130[(3'h5):(1'h1)];
          if (wire133)
            begin
              reg136 <= $unsigned(wire132);
              reg137 <= ({($unsigned($signed((8'hbd))) ?
                          (wire129[(3'h5):(1'h1)] ?
                              $signed(wire130) : reg135[(2'h2):(2'h2)]) : wire133)} ?
                  $signed($unsigned((reg135[(3'h5):(3'h4)] & ((8'haa) >>> wire132)))) : (!wire134));
              reg138 <= wire134[(3'h6):(2'h3)];
              reg139 <= wire134[(1'h0):(1'h0)];
            end
          else
            begin
              reg136 <= reg139;
              reg137 <= wire132[(2'h2):(1'h1)];
              reg138 <= {({reg135[(3'h4):(1'h1)],
                      $unsigned(reg135)} | (~(~^{wire132})))};
              reg139 <= ((-wire131[(4'h9):(3'h4)]) ?
                  wire133[(3'h6):(1'h1)] : ((wire129 ?
                      (^(~|reg139)) : $unsigned($unsigned(wire132))) >>> reg136));
            end
          reg140 <= {(({{reg138, reg139}, {reg139, wire131}} ?
                      reg136 : $signed((reg138 * wire134))) ?
                  reg135 : (~&reg138))};
        end
      reg141 <= (&((reg136 ?
              $signed((&wire130)) : ($unsigned(reg139) ?
                  (^~reg135) : wire134)) ?
          reg136 : $unsigned($signed(reg138[(1'h0):(1'h0)]))));
    end
  assign wire142 = ((~({wire129, (reg140 << wire130)} - ((reg138 | wire129) ?
                           reg135[(3'h7):(1'h0)] : (wire131 ?
                               wire131 : reg138)))) ?
                       $signed(wire132) : reg140);
  assign wire143 = (reg135[(3'h6):(1'h0)] | wire134);
  always
    @(posedge clk) begin
      reg144 <= wire132[(2'h3):(2'h2)];
      if (wire143[(1'h1):(1'h0)])
        begin
          reg145 <= (($unsigned(wire143[(2'h3):(2'h3)]) > reg136) + (wire143 ~^ reg140));
          reg146 <= (^~(&(^~reg141)));
          reg147 <= ($signed(reg139[(3'h7):(3'h5)]) && wire142[(4'hb):(1'h0)]);
          if (wire133)
            begin
              reg148 <= reg136[(4'ha):(1'h0)];
              reg149 <= $signed($unsigned(wire132));
            end
          else
            begin
              reg148 <= ((^reg139) | $unsigned(reg135[(3'h7):(3'h7)]));
              reg149 <= ($unsigned((~reg144)) * ((&reg139) ?
                  (-(~$signed((8'ha4)))) : $signed(reg135)));
              reg150 <= ($unsigned((((-(7'h41)) ?
                      $signed(reg145) : ((8'ha0) >= reg147)) != $signed({reg138,
                      reg147}))) ?
                  ((8'ha9) ?
                      (^wire131) : reg145[(1'h0):(1'h0)]) : {($unsigned(reg135[(2'h3):(1'h1)]) << $signed((&reg141))),
                      $unsigned((!$signed(wire132)))});
              reg151 <= (8'ha4);
              reg152 <= (wire130 ~^ $unsigned($unsigned(reg138[(2'h2):(2'h2)])));
            end
          reg153 <= reg136;
        end
      else
        begin
          reg145 <= reg150[(2'h3):(1'h1)];
          reg146 <= reg137;
          reg147 <= {((((reg137 ~^ wire134) <= (reg144 << (8'ha9))) ?
                      $signed(((7'h42) ?
                          reg141 : reg140)) : reg150[(2'h2):(1'h1)]) ?
                  $unsigned(reg146) : ($signed(wire143[(2'h2):(1'h1)]) << (|reg138)))};
        end
    end
endmodule

module module77
#(parameter param125 = (~(({((8'hb4) >>> (8'hac)), ((8'haa) + (8'ha5))} ? (((8'hb9) >> (8'hb6)) < (+(8'hba))) : (((8'ha9) ? (8'hb3) : (8'hab)) || ((8'ha9) & (8'ha3)))) > ((~|((7'h43) ? (8'hae) : (8'ha0))) ? (^((8'ha5) ~^ (8'hb8))) : (((8'hb9) ? (7'h43) : (8'ha6)) ? ((8'hb7) <= (8'h9f)) : ((8'ha7) ^~ (8'ha9)))))))
(y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'h204):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire82;
  input wire signed [(3'h4):(1'h0)] wire81;
  input wire signed [(4'h9):(1'h0)] wire80;
  input wire signed [(5'h15):(1'h0)] wire79;
  input wire [(4'hc):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire124;
  wire signed [(3'h7):(1'h0)] wire123;
  wire [(3'h4):(1'h0)] wire122;
  wire signed [(4'h8):(1'h0)] wire121;
  wire [(2'h2):(1'h0)] wire99;
  wire [(2'h3):(1'h0)] wire98;
  wire signed [(4'hd):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire96;
  wire signed [(4'he):(1'h0)] wire91;
  wire signed [(4'hf):(1'h0)] wire84;
  wire [(3'h7):(1'h0)] wire83;
  reg [(5'h11):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg118 = (1'h0);
  reg [(5'h12):(1'h0)] reg117 = (1'h0);
  reg [(4'hf):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg115 = (1'h0);
  reg [(4'hf):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg [(5'h12):(1'h0)] reg109 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(2'h3):(1'h0)] reg105 = (1'h0);
  reg [(4'hc):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(4'hb):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg95 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire91,
                 wire84,
                 wire83,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
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
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  assign wire83 = ($unsigned({$unsigned($unsigned((8'ha8))),
                          wire79[(5'h14):(3'h4)]}) ?
                      $unsigned((wire81 > ((wire82 ? wire78 : wire80) ?
                          wire81[(2'h3):(2'h3)] : {wire81,
                              wire79}))) : (!((wire80[(2'h2):(1'h0)] ?
                          wire82[(2'h2):(2'h2)] : $signed((8'hb8))) ^~ $unsigned(wire79[(1'h0):(1'h0)]))));
  assign wire84 = ($unsigned((-$signed(wire81[(3'h4):(1'h1)]))) ?
                      wire81[(3'h4):(1'h0)] : wire79);
  always
    @(posedge clk) begin
      reg85 <= $unsigned(wire79[(4'hf):(4'he)]);
      reg86 <= (|(reg85[(2'h3):(2'h3)] << (!reg85[(2'h3):(1'h0)])));
      reg87 <= $signed(wire82[(3'h6):(1'h0)]);
      reg88 <= $unsigned(reg86);
    end
  always
    @(posedge clk) begin
      reg89 <= ($unsigned((wire79[(5'h15):(3'h7)] > ({reg87, (8'ha2)} ?
          $signed(wire83) : (reg86 << wire80)))) == wire82[(4'h9):(3'h5)]);
    end
  always
    @(posedge clk) begin
      reg90 <= reg89[(3'h4):(1'h1)];
    end
  assign wire91 = $unsigned((($unsigned($unsigned(reg89)) ^ $signed(wire80[(3'h6):(1'h0)])) >= (reg85[(3'h4):(1'h0)] ?
                      reg85[(3'h4):(1'h1)] : $unsigned(reg85))));
  always
    @(posedge clk) begin
      reg92 <= ($unsigned(((~|wire84[(3'h7):(3'h7)]) ?
          reg87 : wire91[(3'h6):(3'h6)])) ^ (wire91[(3'h7):(2'h3)] ?
          ($signed((wire83 ? reg89 : wire91)) ?
              $unsigned(reg87) : wire80[(3'h6):(1'h0)]) : (~&({wire83, wire79} ?
              (~wire79) : (reg89 ? wire84 : (8'hbe))))));
      reg93 <= wire80[(4'h8):(3'h5)];
      reg94 <= ({$signed({(~wire82)}), (!$unsigned((8'ha0)))} + (!(+reg90)));
      reg95 <= $unsigned(reg93);
    end
  assign wire96 = (|($signed($unsigned((reg92 ? reg88 : wire81))) ?
                      wire84 : $signed($signed(wire91))));
  assign wire97 = (-$signed(wire78));
  assign wire98 = ((~|wire83[(3'h6):(1'h1)]) ?
                      $unsigned((wire81 ^~ $unsigned((reg93 ^~ wire97)))) : $unsigned(({$unsigned(reg92)} >= {(reg93 ~^ reg85)})));
  assign wire99 = wire91;
  always
    @(posedge clk) begin
      reg100 <= (($unsigned(((reg89 >>> reg93) ^~ (wire78 ^ wire99))) | $unsigned($unsigned(wire99[(2'h2):(2'h2)]))) && $unsigned($unsigned(reg93)));
    end
  always
    @(posedge clk) begin
      reg101 <= $unsigned(((reg85 ? (~|(^~wire83)) : reg94[(3'h5):(1'h0)]) ?
          (reg100 ?
              {$signed(reg94)} : ((wire91 >>> (8'h9f)) <<< (reg85 + wire98))) : reg87[(3'h7):(2'h3)]));
      if ((reg94[(3'h6):(2'h2)] ?
          wire97[(4'ha):(1'h1)] : $unsigned($unsigned(((^~reg89) ^~ (8'haa))))))
        begin
          reg102 <= (~|((~^(7'h42)) ?
              (($signed(wire83) ?
                  (~^reg90) : $unsigned(reg86)) ~^ (~$unsigned(reg88))) : ((reg89[(4'hb):(3'h5)] ?
                  reg94[(4'h9):(3'h7)] : $unsigned(wire99)) >= wire80[(3'h7):(3'h4)])));
          reg103 <= $unsigned($unsigned((8'ha1)));
          reg104 <= reg85;
          reg105 <= (reg103 && wire97[(2'h2):(1'h1)]);
          reg106 <= (8'hb4);
        end
      else
        begin
          reg102 <= ((((8'hb0) ?
              $signed((reg92 ^ (8'hbd))) : (~(wire78 == reg94))) & wire99[(1'h0):(1'h0)]) >>> ($signed($unsigned((wire91 ?
              wire81 : (8'hbc)))) != {(~&(~reg105))}));
        end
      reg107 <= (^~(wire96[(1'h1):(1'h0)] >>> wire82));
      reg108 <= ($signed(reg87) & (-$unsigned($unsigned(reg94))));
    end
  always
    @(posedge clk) begin
      reg109 <= {reg86, (+(&$unsigned(((8'h9d) ? reg107 : reg102))))};
      if (((~^$signed((^$signed(wire97)))) ?
          $signed((reg101[(3'h4):(2'h3)] | wire80[(2'h2):(2'h2)])) : reg104[(4'ha):(3'h7)]))
        begin
          reg110 <= $signed((reg108[(3'h4):(2'h2)] ?
              reg89[(4'h9):(3'h4)] : $signed(($signed(reg86) ?
                  reg87 : $unsigned((8'hb9))))));
          if ((wire78[(4'ha):(4'h9)] - ((($signed(wire80) < reg94[(3'h5):(3'h5)]) - reg89) ?
              wire84 : {$unsigned((wire98 <= (8'hb3))),
                  (reg103[(3'h7):(2'h2)] ? $unsigned(reg101) : (^reg105))})))
            begin
              reg111 <= $unsigned(((($unsigned(reg103) ?
                      reg106 : wire96) << {wire83[(1'h1):(1'h1)],
                      {(8'h9d), (8'ha9)}}) ?
                  (&({reg105,
                      reg109} < reg86[(4'ha):(4'h8)])) : (reg105[(2'h2):(2'h2)] ?
                      $unsigned($unsigned(reg93)) : wire80[(3'h5):(2'h3)])));
              reg112 <= {reg87[(4'he):(3'h4)], reg87[(5'h13):(2'h2)]};
            end
          else
            begin
              reg111 <= $signed(reg93);
              reg112 <= ($unsigned((((~|wire91) & reg100[(1'h0):(1'h0)]) ?
                      (wire98 * $signed(reg85)) : ((reg102 + reg110) + $unsigned((8'hac))))) ?
                  $signed($unsigned(reg94[(3'h4):(2'h3)])) : (8'hb6));
              reg113 <= $unsigned(((|(reg90[(2'h3):(1'h1)] ?
                  $unsigned((8'hb4)) : $signed(wire96))) > reg102[(1'h0):(1'h0)]));
              reg114 <= $signed(reg111);
              reg115 <= ((^~wire83[(3'h6):(3'h6)]) ?
                  $signed((($unsigned((8'hae)) < $unsigned(wire81)) ?
                      $unsigned((reg94 ~^ wire84)) : wire96[(1'h0):(1'h0)])) : $unsigned((!wire78[(2'h3):(1'h0)])));
            end
          reg116 <= reg108[(4'hd):(4'ha)];
        end
      else
        begin
          reg110 <= $unsigned(reg94);
          reg111 <= reg100;
          reg112 <= (wire81 ^~ (((~|reg105) ?
                  (~|{(8'h9f), wire79}) : {(wire80 < wire99)}) ?
              ($unsigned((reg92 ?
                  wire98 : reg100)) >= reg111) : $signed($unsigned($signed(reg107)))));
        end
      if ((reg106 ? reg106[(3'h4):(1'h1)] : (8'hb1)))
        begin
          reg117 <= (~^{(reg107 >= reg114[(3'h6):(1'h1)]),
              reg115[(2'h2):(1'h1)]});
        end
      else
        begin
          reg117 <= (({(&(~&reg100))} && $signed($signed(wire97))) ?
              ($unsigned(((^reg102) ?
                  (wire78 >> reg92) : reg95)) << (($signed(reg93) ~^ reg104) >>> $signed($signed(reg115)))) : ((($unsigned((7'h43)) ?
                          reg95 : (~reg117)) ?
                      wire82 : reg93) ?
                  $signed($signed(reg87[(2'h2):(1'h1)])) : $unsigned((wire78[(2'h2):(1'h0)] ?
                      reg106 : reg108[(1'h1):(1'h0)]))));
          reg118 <= $signed((reg103 >= $signed(((&reg108) >> {reg88,
              wire81}))));
          reg119 <= reg103[(3'h7):(2'h3)];
        end
      reg120 <= {(~(8'ha6)), $signed($signed(reg105))};
    end
  assign wire121 = (({$unsigned($signed(reg101))} >> $signed(wire78[(2'h2):(1'h1)])) ?
                       ((((&reg104) ?
                               (&(8'had)) : $signed((8'hbf))) ^ {reg89[(4'hf):(4'he)],
                               ((8'hab) ? reg104 : reg110)}) ?
                           $unsigned(wire98) : $unsigned((wire82 ?
                               (reg116 >>> reg94) : ((8'hb2) ?
                                   wire80 : wire91)))) : ((8'hb4) ?
                           reg108[(3'h4):(1'h1)] : $signed(({reg114,
                               wire83} >> (+reg109)))));
  assign wire122 = {($signed($unsigned($signed(wire99))) ?
                           ({(~&reg93)} ?
                               $signed(reg85) : {$signed(reg116)}) : (($unsigned(reg102) ?
                                   ((8'ha4) ?
                                       (8'hb3) : reg94) : $signed(wire82)) ?
                               wire98[(1'h1):(1'h0)] : $unsigned($unsigned(wire80)))),
                       reg117[(4'ha):(4'h9)]};
  assign wire123 = reg85[(2'h3):(1'h1)];
  assign wire124 = wire97[(3'h6):(2'h3)];
endmodule

module module50
#(parameter param72 = {{(~^(((8'hba) ? (8'haa) : (7'h41)) > ((8'haa) ^~ (8'hbb))))}}, 
parameter param73 = ((-(((param72 ? param72 : param72) * param72) ? ((~|param72) ? (-param72) : (8'had)) : (^(param72 ? param72 : (8'ha0))))) ? (-param72) : ((((param72 ? param72 : param72) + (param72 != param72)) | ((+param72) ? (|param72) : param72)) >> (8'ha6))))
(y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire55;
  input wire signed [(4'h9):(1'h0)] wire54;
  input wire [(4'hc):(1'h0)] wire53;
  input wire [(4'he):(1'h0)] wire52;
  input wire signed [(5'h11):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire59;
  wire signed [(5'h12):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire signed [(3'h5):(1'h0)] wire56;
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
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
                 reg60,
                 (1'h0)};
  assign wire56 = $signed(wire53);
  assign wire57 = ($unsigned(($unsigned(wire56) ?
                      wire51 : ($signed(wire51) != wire51))) || (8'ha3));
  assign wire58 = wire54;
  assign wire59 = $signed((~^{(wire55[(3'h7):(2'h3)] <<< wire52[(4'h9):(3'h4)])}));
  always
    @(posedge clk) begin
      if ($unsigned($signed((~{wire58[(3'h5):(2'h2)]}))))
        begin
          reg60 <= $signed((8'ha9));
          reg61 <= (!wire53);
        end
      else
        begin
          reg60 <= wire55;
          reg61 <= wire53[(3'h7):(1'h1)];
          if ($signed($unsigned((~wire51[(4'h8):(1'h0)]))))
            begin
              reg62 <= (^(wire53 < (wire56 ?
                  wire55 : ($signed(wire55) << wire58[(4'hd):(2'h3)]))));
              reg63 <= wire56;
              reg64 <= $signed(reg60);
              reg65 <= $unsigned(wire59[(4'h8):(3'h7)]);
              reg66 <= $signed(reg63);
            end
          else
            begin
              reg62 <= (reg66 * $signed({(-$signed(wire52)), wire55}));
            end
          reg67 <= (($unsigned(reg61) * ($unsigned(wire57) ?
                  $signed($signed(wire59)) : (reg63[(4'he):(1'h1)] <<< (wire51 ?
                      reg63 : wire55)))) ?
              wire53[(4'hb):(4'ha)] : (reg63[(1'h0):(1'h0)] ?
                  (!{$unsigned(wire55)}) : (-wire55[(2'h2):(1'h1)])));
          reg68 <= (-$unsigned($unsigned($unsigned((reg65 - wire58)))));
        end
      reg69 <= wire52;
      reg70 <= {wire51,
          ({reg67[(5'h10):(2'h2)],
                  ((8'ha5) ? $unsigned(wire58) : ((8'ha8) <<< wire55))} ?
              (~^$unsigned(wire56[(1'h1):(1'h1)])) : ($unsigned(wire58[(1'h0):(1'h0)]) ?
                  $signed($unsigned(reg69)) : $signed((reg63 ?
                      wire59 : wire54))))};
      reg71 <= wire54[(4'h8):(2'h2)];
    end
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire20;
  input wire [(4'h9):(1'h0)] wire19;
  input wire signed [(4'hf):(1'h0)] wire18;
  input wire signed [(3'h6):(1'h0)] wire17;
  input wire signed [(4'he):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire46;
  wire signed [(3'h7):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire28;
  wire signed [(2'h3):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  assign y = {wire46,
                 wire40,
                 wire39,
                 wire38,
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
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire21 = {$signed($signed(wire18)), wire20};
  assign wire22 = wire17[(2'h2):(2'h2)];
  assign wire23 = {wire16[(4'ha):(4'h9)]};
  assign wire24 = $unsigned(($unsigned($signed($unsigned((8'hbb)))) << wire22));
  assign wire25 = ($unsigned(wire23) | wire23);
  assign wire26 = (wire24 >>> ((wire20 ?
                          wire23[(3'h6):(1'h1)] : (~$signed(wire24))) ?
                      $signed((~^wire25[(4'he):(4'h8)])) : wire17));
  assign wire27 = (^(wire22[(3'h5):(2'h3)] ?
                      (^wire25) : (-wire18[(2'h3):(1'h0)])));
  assign wire28 = wire25;
  assign wire29 = (+(((~wire26[(3'h5):(2'h2)]) >>> $unsigned((wire26 ?
                          (8'hb7) : wire21))) ?
                      ({(!wire22), $signed(wire21)} ?
                          (((8'hb6) || wire28) != {wire26,
                              wire27}) : wire22) : $unsigned(wire20[(4'hd):(3'h5)])));
  assign wire30 = {wire29[(5'h13):(4'h8)],
                      ((~^wire16) ?
                          ($signed((~^wire17)) >>> $signed((wire27 ?
                              wire29 : wire23))) : (wire21[(3'h4):(2'h2)] && wire23[(1'h1):(1'h1)]))};
  assign wire31 = {$signed({(&$signed(wire18)), (^~(|wire26))}),
                      ((((wire22 ? wire16 : wire27) != (wire29 ?
                              wire29 : wire28)) ?
                          $signed(wire24) : wire18[(2'h2):(2'h2)]) ^ (-{(^wire22),
                          $unsigned(wire16)}))};
  assign wire32 = (wire29[(4'he):(3'h7)] ?
                      wire21[(3'h4):(1'h1)] : wire26[(1'h1):(1'h0)]);
  assign wire33 = {wire26, wire30};
  assign wire34 = (wire32[(1'h0):(1'h0)] != wire26[(2'h3):(1'h1)]);
  assign wire35 = wire23;
  assign wire36 = (~|((|wire35[(2'h3):(2'h2)]) ?
                      (+$unsigned(wire32[(1'h0):(1'h0)])) : wire16));
  assign wire37 = $signed(wire21);
  assign wire38 = wire34[(4'hc):(3'h4)];
  assign wire39 = wire30;
  assign wire40 = $signed((~|{(wire39[(4'hb):(2'h3)] >> wire39),
                      {(~&wire31), (wire29 ? wire22 : (8'hb7))}}));
  always
    @(posedge clk) begin
      reg41 <= (wire27 ?
          wire28[(1'h1):(1'h1)] : $signed((({wire21, (8'h9d)} > wire23) ?
              (+(wire33 > wire24)) : wire35[(3'h5):(2'h2)])));
      reg42 <= $unsigned($unsigned($signed(($signed(wire29) ?
          (&wire23) : (wire28 < wire40)))));
      reg43 <= $unsigned(((^~{(wire34 ? wire16 : wire40)}) ?
          wire24 : $unsigned($signed($unsigned(wire28)))));
      reg44 <= $signed(wire18[(4'hb):(2'h3)]);
      reg45 <= $unsigned(reg43);
    end
  assign wire46 = ((^~{(^~{(8'hb0)}),
                      (~$unsigned(wire27))}) ^~ ({$signed((reg42 >> wire37)),
                          wire28} ?
                      wire20[(4'hc):(4'h8)] : (!wire28[(2'h3):(1'h1)])));
endmodule
