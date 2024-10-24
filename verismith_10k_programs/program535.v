module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire signed [(2'h3):(1'h0)] wire192;
  wire [(4'hf):(1'h0)] wire191;
  wire signed [(2'h2):(1'h0)] wire186;
  wire signed [(3'h5):(1'h0)] wire185;
  wire [(5'h10):(1'h0)] wire184;
  wire [(5'h14):(1'h0)] wire183;
  wire [(5'h13):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire177;
  wire signed [(3'h7):(1'h0)] wire179;
  wire [(2'h2):(1'h0)] wire180;
  wire [(3'h6):(1'h0)] wire181;
  reg [(4'ha):(1'h0)] reg190 = (1'h0);
  reg [(4'h9):(1'h0)] reg189 = (1'h0);
  reg [(3'h6):(1'h0)] reg188 = (1'h0);
  reg [(4'h9):(1'h0)] reg187 = (1'h0);
  assign y = {wire192,
                 wire191,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire4,
                 wire5,
                 wire6,
                 wire177,
                 wire179,
                 wire180,
                 wire181,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 (1'h0)};
  assign wire4 = wire1[(1'h0):(1'h0)];
  assign wire5 = wire0[(1'h0):(1'h0)];
  assign wire6 = $unsigned((8'ha2));
  module7 #() modinst178 (wire177, clk, wire3, wire2, wire1, wire5);
  assign wire179 = ((wire2 && (($unsigned(wire2) ?
                       (wire2 >> (8'hb3)) : wire2) <<< $signed($signed(wire2)))) + ((wire3[(4'h9):(1'h0)] <<< ({(8'hb3)} << (+wire177))) ^~ wire6[(1'h0):(1'h0)]));
  assign wire180 = ((wire0[(2'h2):(1'h1)] ?
                           ($signed($unsigned((8'hb5))) ?
                               (8'hae) : $signed($signed((8'ha4)))) : wire4[(1'h1):(1'h1)]) ?
                       (wire4[(1'h0):(1'h0)] * $signed((wire4 ?
                           $unsigned((8'hb1)) : {wire177,
                               (8'hb1)}))) : {(+wire6)});
  module90 #() modinst182 (.y(wire181), .wire94(wire0), .wire93(wire4), .clk(clk), .wire92(wire2), .wire91(wire6), .wire95(wire177));
  assign wire183 = wire0;
  assign wire184 = (-($unsigned(((+(8'hbf)) * {wire181, wire6})) ?
                       ($unsigned(wire180[(2'h2):(1'h0)]) ?
                           {wire6,
                               (^~wire3)} : $signed((|wire5))) : ((~&$signed(wire3)) ?
                           $unsigned($signed(wire5)) : {(-wire6)})));
  assign wire185 = {($signed(((~^wire3) ?
                           (wire1 ?
                               wire5 : (8'ha0)) : (wire1 ~^ wire0))) ^~ wire4[(4'hd):(3'h7)])};
  assign wire186 = wire5;
  always
    @(posedge clk) begin
      reg187 <= {$signed(wire183[(5'h14):(5'h14)]),
          (~(+$signed((wire185 ? wire6 : wire5))))};
      reg188 <= (+($unsigned($signed($signed(wire4))) << wire3[(3'h5):(2'h2)]));
      reg189 <= {wire186[(1'h0):(1'h0)], wire4};
      reg190 <= $signed(reg188);
    end
  assign wire191 = wire185[(1'h1):(1'h1)];
  assign wire192 = $signed((reg187 * {wire5,
                       ($unsigned(wire183) <<< (^~reg187))}));
endmodule

module module7
#(parameter param175 = (~^({(((8'hbc) ? (8'hac) : (8'hb6)) ^~ ((8'had) <<< (8'hbc))), ((+(8'h9d)) | (-(8'hae)))} <<< (~&{((8'haf) ? (8'ha4) : (8'ha2))}))), 
parameter param176 = {(((((8'hb6) ? param175 : param175) > (param175 || param175)) || ((^(8'ha4)) ? (!param175) : param175)) <<< param175)})
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h1b7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire174;
  wire signed [(3'h6):(1'h0)] wire173;
  wire [(5'h10):(1'h0)] wire172;
  wire signed [(3'h4):(1'h0)] wire171;
  wire signed [(5'h14):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire89;
  wire [(5'h11):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire87;
  wire [(5'h10):(1'h0)] wire45;
  wire [(2'h2):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire48;
  wire signed [(4'hd):(1'h0)] wire85;
  wire [(3'h7):(1'h0)] wire104;
  wire [(4'h9):(1'h0)] wire133;
  wire [(5'h14):(1'h0)] wire154;
  wire signed [(3'h4):(1'h0)] wire156;
  wire [(5'h15):(1'h0)] wire169;
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg158 = (1'h0);
  reg [(4'hb):(1'h0)] reg159 = (1'h0);
  reg [(5'h15):(1'h0)] reg160 = (1'h0);
  reg [(5'h11):(1'h0)] reg161 = (1'h0);
  reg [(4'hc):(1'h0)] reg162 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg164 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg165 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg168 = (1'h0);
  assign y = {wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire102,
                 wire89,
                 wire88,
                 wire87,
                 wire45,
                 wire16,
                 wire15,
                 wire14,
                 wire12,
                 wire47,
                 wire48,
                 wire85,
                 wire104,
                 wire133,
                 wire154,
                 wire156,
                 wire169,
                 reg13,
                 reg157,
                 reg158,
                 reg159,
                 reg160,
                 reg161,
                 reg162,
                 reg163,
                 reg164,
                 reg165,
                 reg166,
                 reg167,
                 reg168,
                 (1'h0)};
  assign wire12 = (8'h9d);
  always
    @(posedge clk) begin
      reg13 <= wire11[(4'ha):(3'h5)];
    end
  assign wire14 = (8'ha3);
  assign wire15 = ((((+$signed(reg13)) >>> $signed((!wire8))) ?
                      wire10[(1'h0):(1'h0)] : $signed({(-reg13),
                          (wire12 ^ (8'hb8))})) >= wire12[(2'h3):(1'h0)]);
  assign wire16 = $unsigned($signed({wire15[(1'h1):(1'h1)]}));
  module17 #() modinst46 (.y(wire45), .wire19(reg13), .wire21(wire8), .clk(clk), .wire20(wire15), .wire18(wire11));
  assign wire47 = ((~&($unsigned(wire15) ?
                      (8'hb9) : ((wire8 ? reg13 : wire11) ?
                          $unsigned((8'hb1)) : (wire10 ?
                              wire14 : wire10)))) != $unsigned(((wire14[(4'hd):(4'h9)] ?
                      wire14 : (wire15 & reg13)) - ($signed(wire14) <<< $signed((8'had))))));
  assign wire48 = wire12;
  module49 #() modinst86 (wire85, clk, wire15, reg13, wire48, wire45);
  assign wire87 = ((|wire10) + (+(+wire8)));
  assign wire88 = (~^wire10[(3'h6):(2'h2)]);
  assign wire89 = wire45[(4'hd):(3'h5)];
  module90 #() modinst103 (wire102, clk, wire88, wire15, wire48, wire87, wire12);
  assign wire104 = wire85[(4'hd):(2'h2)];
  module105 #() modinst134 (.wire106(wire47), .y(wire133), .wire107(wire85), .clk(clk), .wire109(wire102), .wire108(wire8));
  module135 #() modinst155 (wire154, clk, wire9, wire11, wire102, wire104);
  assign wire156 = (($unsigned((|(&wire87))) ^~ (~(&{wire154,
                       wire88}))) | $signed(wire45));
  always
    @(posedge clk) begin
      if ((8'h9f))
        begin
          reg157 <= ((($signed(wire85) ?
                  (wire15 ?
                      (^wire87) : wire47) : $unsigned(wire104[(3'h5):(1'h1)])) < ($unsigned($unsigned((8'hbc))) ?
                  (((8'had) >> wire45) - $unsigned(wire47)) : wire11)) ?
              (~&(8'hb1)) : {$unsigned($unsigned(((8'hbe) ? wire85 : wire89))),
                  wire48});
          reg158 <= wire47[(3'h6):(2'h3)];
        end
      else
        begin
          reg157 <= wire88;
          if ((({($unsigned(reg157) != $signed(wire14))} ?
              ($unsigned((reg158 ? wire89 : (8'hab))) ?
                  {wire11, {wire154}} : (reg158 ?
                      ((7'h44) ?
                          wire8 : wire87) : $unsigned(wire89))) : wire45[(4'he):(3'h4)]) + $unsigned({($signed(wire88) >>> $unsigned(reg157)),
              reg158})))
            begin
              reg158 <= $signed(wire8);
              reg159 <= ({wire47[(3'h7):(1'h1)],
                  (+reg13)} ^ (|(~&wire89[(4'he):(2'h2)])));
              reg160 <= wire133[(1'h1):(1'h1)];
              reg161 <= wire133;
            end
          else
            begin
              reg158 <= (($unsigned((~&(!wire11))) == ((+$unsigned(wire156)) ?
                      (~^((8'hb6) * reg158)) : ((~wire16) ?
                          (~(7'h40)) : wire104[(3'h7):(1'h1)]))) ?
                  wire10 : wire156[(1'h0):(1'h0)]);
              reg159 <= (~$unsigned(wire85));
              reg160 <= reg160[(4'h8):(4'h8)];
              reg161 <= wire48;
              reg162 <= $unsigned($unsigned(($unsigned((~|wire12)) != (wire89[(4'hd):(4'hb)] ?
                  $unsigned(wire15) : (8'hb2)))));
            end
          if ($unsigned(($signed($signed($signed(wire156))) ?
              {(~&(|(8'hb0)))} : $signed({{reg162, (8'hbe)}}))))
            begin
              reg163 <= {($unsigned(($signed(wire102) ?
                          ((8'hb9) - wire89) : (|wire102))) ?
                      $unsigned({{wire48},
                          wire9[(4'h9):(3'h6)]}) : wire89[(3'h7):(1'h1)]),
                  ((($unsigned(wire45) & (8'haa)) - $unsigned(wire88)) ?
                      {(wire156[(1'h1):(1'h1)] && (reg158 ^ reg161))} : (~^($unsigned(wire48) ?
                          wire47[(4'h9):(4'h9)] : (^wire9))))};
              reg164 <= wire11[(2'h3):(1'h1)];
              reg165 <= (reg163[(2'h3):(1'h0)] >>> ({wire47[(4'ha):(4'h8)],
                  (&$signed(wire156))} >= $unsigned(wire15[(4'hb):(1'h0)])));
              reg166 <= $signed(((~^((reg165 ? wire133 : wire16) ?
                      {(8'hac)} : {wire87})) ?
                  (wire9[(3'h5):(2'h2)] ?
                      (^~(+wire154)) : (-$signed(wire133))) : $signed((((8'ha7) ?
                      wire89 : reg161) >= wire85[(4'hb):(3'h7)]))));
              reg167 <= ((reg162[(2'h3):(2'h2)] ?
                  ($unsigned($unsigned(wire8)) ?
                      (wire104[(3'h6):(3'h5)] && $unsigned(wire15)) : $signed(reg163[(1'h0):(1'h0)])) : wire15) || (~|(wire89 || $unsigned((|wire154)))));
            end
          else
            begin
              reg163 <= wire102[(4'h8):(2'h2)];
              reg164 <= (~^$signed(((wire12 ?
                  (wire14 < wire102) : (wire133 || wire47)) >= {$signed((8'ha4))})));
            end
          reg168 <= wire16;
        end
    end
  module135 #() modinst170 (wire169, clk, wire12, reg161, wire88, wire89);
  assign wire171 = (!(&($signed(reg157[(1'h1):(1'h1)]) ? wire8 : reg161)));
  assign wire172 = (-(wire171 ?
                       $unsigned(($unsigned(wire9) & (+(8'hae)))) : {$signed((wire9 ?
                               wire89 : wire10))}));
  assign wire173 = ({(reg168 ? $unsigned({wire156}) : (|(wire85 >> wire12)))} ?
                       ($signed(wire48) ?
                           $signed(((wire16 ? (7'h40) : reg161) ?
                               reg157[(1'h0):(1'h0)] : (wire104 > (8'hb9)))) : $signed(wire171)) : (^~$unsigned(({(7'h41),
                           (8'ha1)} * wire14))));
  assign wire174 = wire133;
endmodule

module module135
#(parameter param153 = (^(((~&((8'hae) <<< (8'hba))) ? ((~&(8'ha4)) && (~(8'hbd))) : {((8'hbd) ? (8'hb7) : (8'ha6))}) ? {((8'hb9) >> (~(8'hbf)))} : (^~(((8'hac) ? (7'h43) : (8'hae)) ? (!(7'h40)) : {(8'hb6)})))))
(y, clk, wire139, wire138, wire137, wire136);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire139;
  input wire signed [(4'he):(1'h0)] wire138;
  input wire [(5'h11):(1'h0)] wire137;
  input wire [(3'h4):(1'h0)] wire136;
  wire signed [(2'h2):(1'h0)] wire152;
  wire signed [(5'h14):(1'h0)] wire151;
  wire signed [(5'h15):(1'h0)] wire150;
  wire [(3'h7):(1'h0)] wire149;
  wire signed [(4'hd):(1'h0)] wire148;
  wire [(4'hc):(1'h0)] wire147;
  wire signed [(4'hf):(1'h0)] wire146;
  wire signed [(4'hc):(1'h0)] wire145;
  wire signed [(4'hd):(1'h0)] wire144;
  wire [(4'h8):(1'h0)] wire143;
  wire signed [(5'h10):(1'h0)] wire142;
  wire [(4'h9):(1'h0)] wire141;
  wire signed [(3'h7):(1'h0)] wire140;
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 (1'h0)};
  assign wire140 = wire139;
  assign wire141 = $signed(wire138);
  assign wire142 = $signed(wire138[(3'h7):(3'h4)]);
  assign wire143 = ((|wire139) == $unsigned(wire142));
  assign wire144 = wire140[(3'h4):(2'h2)];
  assign wire145 = $unsigned(($unsigned((8'haa)) ?
                       $signed($signed(wire140)) : ({(wire140 ?
                                   wire143 : wire144),
                               {wire138, wire140}} ?
                           ($unsigned(wire139) ?
                               (~&wire141) : $unsigned(wire142)) : $signed(wire143))));
  assign wire146 = (^{$signed(wire143), wire138[(3'h4):(2'h3)]});
  assign wire147 = (~wire140[(3'h7):(1'h1)]);
  assign wire148 = $unsigned(wire140);
  assign wire149 = wire136;
  assign wire150 = (($signed({wire144}) * wire143) ?
                       {(+wire138)} : ((~&$signed(wire145)) + wire138));
  assign wire151 = (wire137 ? wire148 : (~|wire139[(1'h0):(1'h0)]));
  assign wire152 = ((($signed($signed(wire143)) == $unsigned($signed(wire146))) ?
                       (!$unsigned((wire139 ?
                           wire148 : wire142))) : wire147) >= ($unsigned(((wire139 + wire143) <<< $unsigned(wire144))) ^~ ((~|(wire150 ?
                           wire145 : (8'hae))) ?
                       wire146[(4'he):(3'h7)] : ($unsigned((8'h9e)) ?
                           wire137 : (wire143 ^ wire138)))));
endmodule

module module105
#(parameter param132 = {(~&({{(8'ha0), (8'h9f)}, ((8'ha9) ~^ (8'hb8))} >= ((~|(7'h43)) ? (8'had) : {(8'ha6)}))), (((((7'h43) ? (8'hba) : (8'ha7)) < {(8'hbe)}) <<< (((8'ha3) ? (8'h9c) : (8'ha4)) & (^(7'h40)))) ? (({(8'ha0), (8'haf)} ? (-(8'ha4)) : ((8'ha3) == (8'had))) ? (((8'hba) ? (8'hbf) : (8'haa)) < ((8'ha5) ^~ (8'ha9))) : {((8'hbf) >>> (7'h44))}) : (8'ha4))})
(y, clk, wire109, wire108, wire107, wire106);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire109;
  input wire signed [(5'h13):(1'h0)] wire108;
  input wire [(3'h6):(1'h0)] wire107;
  input wire signed [(4'hf):(1'h0)] wire106;
  wire [(3'h7):(1'h0)] wire131;
  wire [(4'he):(1'h0)] wire130;
  wire [(5'h13):(1'h0)] wire129;
  wire [(4'ha):(1'h0)] wire128;
  wire [(4'hc):(1'h0)] wire126;
  wire [(5'h15):(1'h0)] wire125;
  wire [(3'h7):(1'h0)] wire124;
  wire [(3'h5):(1'h0)] wire123;
  wire signed [(2'h3):(1'h0)] wire122;
  wire signed [(5'h13):(1'h0)] wire121;
  wire [(4'h9):(1'h0)] wire120;
  wire [(5'h14):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire118;
  wire signed [(5'h15):(1'h0)] wire117;
  wire signed [(4'hf):(1'h0)] wire116;
  wire [(4'h9):(1'h0)] wire115;
  wire [(2'h3):(1'h0)] wire114;
  wire [(3'h7):(1'h0)] wire113;
  wire signed [(3'h6):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire111;
  wire signed [(4'hf):(1'h0)] wire110;
  reg signed [(3'h7):(1'h0)] reg127 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 reg127,
                 (1'h0)};
  assign wire110 = wire107;
  assign wire111 = $signed($unsigned($signed({wire106})));
  assign wire112 = $unsigned((|wire109));
  assign wire113 = {wire110,
                       (&$signed((wire112[(1'h1):(1'h0)] ?
                           (&wire112) : $signed((8'hb7)))))};
  assign wire114 = (~^($signed({(wire108 > wire112)}) ?
                       $signed({(wire109 == wire106),
                           ((8'hbe) ? wire107 : wire109)}) : (wire111 ?
                           (!(wire106 ^ wire106)) : ((~&wire107) + $unsigned((8'ha4))))));
  assign wire115 = (wire114[(1'h1):(1'h1)] ?
                       (~|(7'h42)) : (($signed((wire110 & (8'hb0))) + wire114[(1'h0):(1'h0)]) ~^ $signed(wire114)));
  assign wire116 = wire106;
  assign wire117 = (~&(-$signed(wire108)));
  assign wire118 = wire117;
  assign wire119 = ($unsigned(($unsigned(wire111[(1'h1):(1'h0)]) >= wire114)) ?
                       wire111 : {wire110[(4'hf):(3'h5)],
                           (wire114[(1'h1):(1'h0)] + wire116[(2'h2):(2'h2)])});
  assign wire120 = ($unsigned(wire117[(5'h13):(2'h3)]) != wire112);
  assign wire121 = ($signed(wire113) ?
                       (~|wire120[(3'h7):(3'h5)]) : wire117[(4'hb):(3'h5)]);
  assign wire122 = wire115[(3'h7):(3'h4)];
  assign wire123 = $signed((~&wire122[(2'h2):(1'h1)]));
  assign wire124 = ((~|(-(~&$signed(wire119)))) ?
                       wire118[(4'h8):(2'h3)] : (~|$signed((|(&wire108)))));
  assign wire125 = ((+((|wire112) - ($signed((8'hbd)) > wire112))) <= $signed($unsigned(($signed(wire122) < $unsigned(wire122)))));
  assign wire126 = ((&wire113) ?
                       $unsigned({(wire111[(2'h3):(2'h2)] ?
                               (wire106 <= wire111) : (&wire123))}) : wire108);
  always
    @(posedge clk) begin
      reg127 <= ($signed($signed($unsigned((wire119 ? wire116 : wire114)))) ?
          wire119 : wire113);
    end
  assign wire128 = $signed($signed($unsigned((wire106[(1'h1):(1'h1)] > (+(8'had))))));
  assign wire129 = $signed($unsigned(wire107[(3'h5):(2'h3)]));
  assign wire130 = (8'hb8);
  assign wire131 = ($signed(wire107[(3'h6):(3'h6)]) - wire126[(4'hc):(3'h5)]);
endmodule

module module90
#(parameter param100 = (((~|(~|{(8'ha8)})) ? (((^~(8'ha3)) ? (8'ha4) : ((7'h40) ? (8'ha3) : (8'hbe))) >> {((8'hbc) ? (8'ha4) : (8'ha4))}) : (~|{((8'hae) == (8'hb4)), ((8'ha5) ? (7'h43) : (8'hb4))})) >>> (!(({(8'hb5), (8'haf)} ? ((8'haf) || (8'ha4)) : {(8'hba)}) ^ {((8'ha9) ? (8'hae) : (8'hb8)), ((8'hb1) ? (8'hb9) : (7'h43))}))), 
parameter param101 = (((param100 ? ((param100 ? param100 : param100) ~^ param100) : param100) ? {param100} : ((param100 << (param100 != param100)) ? ((+param100) >> (param100 ? param100 : (8'hbd))) : (~(param100 ^~ param100)))) ? param100 : (8'hae)))
(y, clk, wire95, wire94, wire93, wire92, wire91);
  output wire [(32'h28):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire95;
  input wire signed [(3'h7):(1'h0)] wire94;
  input wire signed [(5'h13):(1'h0)] wire93;
  input wire signed [(4'hc):(1'h0)] wire92;
  input wire signed [(5'h12):(1'h0)] wire91;
  wire signed [(4'ha):(1'h0)] wire99;
  wire [(4'hd):(1'h0)] wire98;
  wire [(2'h3):(1'h0)] wire97;
  wire [(4'hd):(1'h0)] wire96;
  assign y = {wire99, wire98, wire97, wire96, (1'h0)};
  assign wire96 = (~((~&($unsigned(wire91) ?
                      $signed(wire94) : wire93)) << (($unsigned(wire94) ?
                          (wire91 ? wire91 : wire93) : (wire94 - wire91)) ?
                      (wire93 ? {(8'hb6)} : wire93) : wire91[(5'h12):(2'h3)])));
  assign wire97 = (wire92[(3'h4):(2'h3)] ?
                      wire92[(2'h3):(2'h3)] : {(~|$signed(wire96)),
                          wire96[(4'h8):(3'h6)]});
  assign wire98 = (($unsigned($signed(wire92)) * {(~&$unsigned(wire92)),
                          $unsigned(wire94)}) ?
                      $unsigned((($signed(wire96) == $unsigned(wire95)) ?
                          ((wire97 * wire94) ?
                              $unsigned(wire93) : (wire92 + wire95)) : (7'h40))) : wire97);
  assign wire99 = $signed(((wire93[(3'h5):(1'h1)] ?
                      wire98 : (~|wire97)) ^ $unsigned((wire94[(3'h7):(2'h3)] ?
                      ((8'ha5) >>> wire95) : wire97[(1'h0):(1'h0)]))));
endmodule

module module49
#(parameter param83 = (!({(((8'ha8) ? (7'h43) : (8'hbb)) && (7'h42))} ? (((~|(8'ha4)) > (^~(8'haf))) ? (((8'ha0) | (8'hbc)) || {(8'hbf)}) : {((8'hae) - (8'hb6))}) : {(~|((8'ha4) ? (8'hb7) : (8'hb8))), {((8'hbf) ? (8'ha7) : (8'hbe)), ((7'h44) ? (8'had) : (8'ha2))}})), 
parameter param84 = ((param83 >> (({param83, param83} ~^ {param83}) >>> ((param83 ? param83 : (8'hb3)) ? (param83 < param83) : (param83 & param83)))) && ({((|param83) ? param83 : (~^param83))} | ({(param83 ? param83 : param83), {param83}} >= (|((8'hb3) ? param83 : (8'h9e)))))))
(y, clk, wire53, wire52, wire51, wire50);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire53;
  input wire signed [(5'h13):(1'h0)] wire52;
  input wire [(4'h9):(1'h0)] wire51;
  input wire [(4'ha):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire79;
  wire signed [(4'h8):(1'h0)] wire78;
  wire signed [(4'hb):(1'h0)] wire77;
  wire signed [(2'h2):(1'h0)] wire76;
  wire signed [(5'h13):(1'h0)] wire75;
  wire signed [(4'h8):(1'h0)] wire64;
  wire signed [(2'h2):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire62;
  wire signed [(4'hf):(1'h0)] wire60;
  wire [(4'hc):(1'h0)] wire59;
  wire signed [(4'hf):(1'h0)] wire58;
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(4'hc):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire64,
                 wire63,
                 wire62,
                 wire60,
                 wire59,
                 wire58,
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
                 reg61,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg54 <= $unsigned($unsigned((wire53 ?
          wire53 : {$signed(wire53), wire51})));
      reg55 <= $unsigned(wire52);
      reg56 <= (+{(~|wire50)});
      reg57 <= (wire51 & reg54[(3'h6):(3'h6)]);
    end
  assign wire58 = wire53[(4'ha):(4'h9)];
  assign wire59 = (($unsigned({(wire53 < wire50)}) ?
                      wire58 : $signed({$unsigned(wire58)})) ~^ reg54);
  assign wire60 = wire58[(4'ha):(2'h2)];
  always
    @(posedge clk) begin
      reg61 <= $unsigned(((((wire53 ? reg57 : wire50) || (reg57 ?
          wire60 : wire59)) > wire58[(1'h1):(1'h0)]) == reg54));
    end
  assign wire62 = reg54;
  assign wire63 = (~^(8'hb3));
  assign wire64 = {(~|wire60[(1'h1):(1'h1)]), (8'hb6)};
  always
    @(posedge clk) begin
      if ({(~^wire62[(3'h4):(1'h1)]),
          (reg61 ? reg54 : $unsigned($signed($unsigned(wire53))))})
        begin
          reg65 <= $unsigned(reg55);
        end
      else
        begin
          reg65 <= reg55;
          if (reg54)
            begin
              reg66 <= $signed($unsigned($unsigned((8'hbf))));
            end
          else
            begin
              reg66 <= (wire59 ?
                  {($signed({wire50, reg65}) != (8'hba))} : $unsigned({reg56}));
              reg67 <= (((reg54[(2'h2):(1'h1)] ?
                          $signed(((8'hb6) > wire63)) : (~(!(8'hbd)))) ?
                      ($unsigned(wire64) ?
                          ($signed(reg56) ?
                              $unsigned((8'hb6)) : ((7'h42) * wire62)) : ((reg56 + (8'h9c)) ?
                              wire59[(3'h5):(3'h4)] : wire63[(1'h1):(1'h1)])) : $signed(((reg54 << reg61) <<< (wire64 ?
                          reg54 : (8'hae))))) ?
                  (~&wire60) : $signed($signed(((|wire58) == reg65[(3'h6):(3'h6)]))));
              reg68 <= {reg57, (^~wire60)};
              reg69 <= wire51;
            end
          reg70 <= {(~($signed(wire64) ?
                  (reg67[(4'ha):(3'h4)] <<< ((7'h41) ?
                      (8'hb3) : wire63)) : ($signed(wire58) == (^~reg65))))};
          reg71 <= $signed({((~reg56) == ((~^wire63) ^~ wire62))});
          reg72 <= $signed($signed((+(8'hbc))));
        end
      reg73 <= reg61[(2'h2):(1'h1)];
      reg74 <= reg65[(4'h8):(3'h4)];
    end
  assign wire75 = reg66;
  assign wire76 = $unsigned({(&{reg71}), $signed($signed({reg74, wire63}))});
  assign wire77 = ((+wire64) ?
                      wire64[(1'h1):(1'h0)] : ($signed($signed((wire64 ?
                          reg65 : reg67))) <= $unsigned($signed(((8'ha1) ?
                          wire75 : (8'ha7))))));
  assign wire78 = (8'ha5);
  assign wire79 = {$signed((((reg68 <= reg65) >>> (wire63 < wire62)) ?
                          {(8'hb2),
                              (wire62 ?
                                  wire77 : reg66)} : (&((8'hb1) || wire59)))),
                      wire51};
  assign wire80 = $signed(({$signed($signed(wire51)),
                      (+reg56)} >>> $unsigned(reg69[(2'h2):(1'h0)])));
  assign wire81 = (-(~&(8'hb4)));
  assign wire82 = (wire64 <<< $unsigned(($unsigned((~|(8'had))) != $signed({wire76,
                      wire50}))));
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire21;
  input wire signed [(3'h6):(1'h0)] wire20;
  input wire [(3'h6):(1'h0)] wire19;
  input wire signed [(4'hf):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire43;
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  assign y = {wire44,
                 wire43,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(wire18[(4'hf):(4'h9)]))
        begin
          reg22 <= wire20;
          if ($unsigned(wire19[(3'h6):(1'h1)]))
            begin
              reg23 <= $signed(($unsigned($unsigned(wire19)) == wire20));
              reg24 <= $unsigned((wire18[(2'h3):(1'h1)] ?
                  $unsigned($signed(wire20[(3'h6):(2'h3)])) : $signed(((|(8'ha0)) & (wire20 ?
                      wire19 : wire20)))));
            end
          else
            begin
              reg23 <= (8'ha4);
              reg24 <= {reg22};
              reg25 <= wire19[(3'h4):(2'h3)];
              reg26 <= $unsigned((~^((((8'ha9) ? wire18 : wire21) ?
                      (^wire19) : ((8'h9f) ? wire18 : wire20)) ?
                  wire19 : (wire18[(4'ha):(3'h6)] - $signed(wire19)))));
              reg27 <= $unsigned($signed(({(reg26 ? wire21 : wire19),
                  (wire18 ? reg25 : (8'h9f))} <= (|((8'hb5) ^ wire21)))));
            end
          if ($signed($unsigned((~&wire19))))
            begin
              reg28 <= (7'h41);
              reg29 <= (({($unsigned(reg22) < ((8'hbc) ? reg23 : wire18)),
                      (^~(|wire19))} ?
                  (((&(8'ha7)) ? $signed(reg24) : (!reg27)) ?
                      ((reg28 ? wire18 : reg24) ?
                          $signed(reg28) : $unsigned(reg26)) : $unsigned((reg27 ?
                          reg24 : reg23))) : wire18[(1'h0):(1'h0)]) != (~&{reg24[(2'h3):(1'h1)],
                  $unsigned((wire18 ? wire19 : reg22))}));
              reg30 <= (reg23 ?
                  {(((8'ha4) || reg29[(4'h9):(4'h8)]) == $unsigned((reg29 ?
                          wire20 : reg23)))} : {{$signed(wire18[(3'h4):(2'h2)]),
                          (wire19[(3'h5):(3'h5)] ?
                              (-reg29) : (wire21 << reg22))},
                      {((reg28 ? wire18 : reg24) ?
                              $unsigned(reg24) : (|wire20))}});
            end
          else
            begin
              reg28 <= reg22;
            end
          reg31 <= (~^(reg23[(5'h15):(4'ha)] ?
              reg28 : (($signed(wire21) ? $signed(reg25) : {(7'h44), reg26}) ?
                  ((wire21 <<< wire20) ?
                      (reg29 ?
                          wire20 : reg30) : $signed(reg23)) : (reg27 ^ reg27))));
          reg32 <= {(reg22 ~^ (8'ha9)), wire20[(2'h2):(2'h2)]};
        end
      else
        begin
          reg22 <= (reg30[(3'h7):(1'h0)] ^ reg30);
          reg23 <= ((($unsigned({wire19}) ?
              $unsigned(reg31[(3'h6):(3'h5)]) : $signed($signed(reg29))) >> wire19[(1'h0):(1'h0)]) << (reg29 == ((8'hb0) ?
              (reg32 ? {(8'ha8), reg27} : (reg31 >> (8'hb2))) : reg30)));
          reg24 <= reg22[(2'h3):(1'h0)];
          reg25 <= (~&$signed(((reg22[(1'h0):(1'h0)] << (reg30 ?
                  wire19 : reg30)) ?
              ((+wire21) <<< (~^reg31)) : reg24[(3'h4):(1'h1)])));
          reg26 <= $signed((8'ha5));
        end
      reg33 <= (~&((^reg23[(3'h6):(2'h2)]) ?
          wire18 : $signed(((|wire18) ? $unsigned(reg30) : $unsigned(reg26)))));
    end
  always
    @(posedge clk) begin
      if (reg22)
        begin
          if ($unsigned((reg31[(3'h5):(2'h2)] ~^ $signed($unsigned($signed(reg28))))))
            begin
              reg34 <= (7'h40);
              reg35 <= reg34[(1'h1):(1'h1)];
            end
          else
            begin
              reg34 <= ($signed(((wire21[(2'h2):(1'h0)] ?
                          $signed(reg25) : {reg33, reg28}) ?
                      reg22[(4'ha):(3'h6)] : ($signed(reg24) ^~ $signed((8'hab))))) ?
                  (^$signed(wire18[(4'hc):(4'hc)])) : (&wire21[(1'h0):(1'h0)]));
              reg35 <= $signed($signed(reg22[(4'h8):(2'h2)]));
              reg36 <= (&({$unsigned((|reg25)), (+reg27)} ?
                  reg30 : $signed($unsigned((reg25 ? (8'hb9) : (8'ha6))))));
            end
        end
      else
        begin
          reg34 <= (((({reg29} ^~ $unsigned(wire21)) ~^ (((8'had) ?
                  reg34 : reg35) * (reg26 || (8'hb8)))) ?
              (reg33 || $signed(((8'hbd) ?
                  reg31 : reg31))) : (reg25[(4'he):(4'h9)] || $signed($unsigned(wire18)))) * $signed($unsigned((reg31 ?
              (~&reg33) : $unsigned(reg26)))));
        end
      if ({$signed(((reg30 + $signed(reg34)) ~^ $signed(reg30))),
          {($signed($unsigned(reg27)) > $signed($unsigned(reg31))), (8'ha3)}})
        begin
          reg37 <= ($signed((8'ha0)) != (wire19[(3'h4):(1'h0)] > $signed(reg25)));
        end
      else
        begin
          reg37 <= (!$signed($unsigned(({wire21,
              (8'h9f)} <<< wire19[(3'h5):(2'h3)]))));
          reg38 <= $unsigned(reg34);
          reg39 <= reg37;
          reg40 <= {$unsigned(($unsigned((!wire21)) ?
                  (^reg34[(3'h7):(3'h6)]) : $signed((reg34 ?
                      reg39 : (8'h9c))))),
              reg37[(4'he):(4'ha)]};
          reg41 <= ($signed($unsigned($unsigned((reg38 ? reg34 : wire21)))) ?
              ((^~((reg25 ? (8'hb5) : reg24) ^~ (wire18 ?
                  (8'hbb) : reg24))) == ((^reg31[(3'h6):(1'h0)]) & {$unsigned(wire20)})) : $unsigned(($unsigned((~^reg31)) - $unsigned({reg23}))));
        end
      reg42 <= $signed(reg35[(4'hc):(4'h9)]);
    end
  assign wire43 = reg35[(4'h9):(3'h6)];
  assign wire44 = reg37;
endmodule
