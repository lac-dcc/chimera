module top
#(parameter param211 = ((8'ha1) >>> (&((((8'hb5) ? (8'ha3) : (8'hb5)) + ((8'ha5) < (8'ha9))) ? {((8'hb8) ? (8'hbe) : (8'ha1)), ((8'h9d) << (8'hb3))} : (7'h41)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire210;
  wire [(3'h5):(1'h0)] wire209;
  wire signed [(3'h6):(1'h0)] wire207;
  wire signed [(2'h3):(1'h0)] wire206;
  wire signed [(3'h4):(1'h0)] wire205;
  wire [(5'h15):(1'h0)] wire204;
  wire [(5'h12):(1'h0)] wire203;
  wire signed [(4'hb):(1'h0)] wire198;
  wire [(5'h11):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire200;
  wire signed [(3'h5):(1'h0)] wire201;
  assign y = {wire210,
                 wire209,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire198,
                 wire7,
                 wire6,
                 wire5,
                 wire200,
                 wire201,
                 (1'h0)};
  assign wire5 = $signed(($signed(wire1) ?
                     wire2[(1'h0):(1'h0)] : ($signed((+wire0)) ?
                         wire2 : $signed((wire1 ^~ wire2)))));
  assign wire6 = wire4;
  assign wire7 = wire0;
  module8 #() modinst199 (wire198, clk, wire5, wire3, wire6, wire1, wire0);
  assign wire200 = $unsigned($unsigned($unsigned((wire6[(4'ha):(3'h6)] && $unsigned(wire4)))));
  module8 #() modinst202 (.wire10(wire7), .wire12(wire6), .wire9(wire2), .wire11(wire0), .wire13(wire3), .clk(clk), .y(wire201));
  assign wire203 = wire6[(4'h8):(2'h3)];
  assign wire204 = {((({wire6} ?
                           (wire3 ^~ wire1) : $unsigned(wire198)) + {wire5[(4'h9):(4'h8)]}) && (~|(^~(&wire203)))),
                       ({$signed($unsigned(wire1))} | (($signed((8'ha1)) != (wire7 ^ (8'ha8))) ?
                           wire201 : ((wire6 ? wire0 : wire3) - {wire2})))};
  assign wire205 = ($signed({{(8'h9d)}}) <<< ((~^$signed($unsigned(wire2))) ?
                       (wire5 ?
                           (((8'hab) * wire3) ?
                               $signed(wire201) : $signed(wire6)) : $signed(((8'ha7) ?
                               wire200 : wire4))) : ((~|(|wire198)) | (~$unsigned(wire2)))));
  assign wire206 = wire0;
  module16 #() modinst208 (.wire19(wire7), .wire20(wire203), .clk(clk), .wire18(wire200), .y(wire207), .wire17(wire3));
  assign wire209 = (wire206[(2'h3):(1'h1)] ?
                       $signed($unsigned(wire1)) : $signed(wire3[(4'hf):(4'h8)]));
  assign wire210 = ($unsigned(({wire207[(3'h5):(1'h0)],
                           {wire7, wire198}} < wire5)) ?
                       (($unsigned((wire3 != wire204)) ~^ $unsigned(wire198)) ?
                           (~wire201[(1'h0):(1'h0)]) : wire1) : (8'h9d));
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire12;
  input wire signed [(5'h11):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire197;
  wire [(4'he):(1'h0)] wire195;
  wire signed [(5'h11):(1'h0)] wire194;
  wire signed [(4'hb):(1'h0)] wire193;
  wire signed [(5'h11):(1'h0)] wire192;
  wire signed [(4'ha):(1'h0)] wire191;
  wire signed [(5'h10):(1'h0)] wire190;
  wire signed [(4'hf):(1'h0)] wire189;
  wire signed [(5'h10):(1'h0)] wire187;
  wire signed [(4'hf):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire107;
  wire signed [(3'h4):(1'h0)] wire146;
  wire [(5'h12):(1'h0)] wire148;
  wire [(4'hf):(1'h0)] wire149;
  wire [(4'hb):(1'h0)] wire185;
  assign y = {wire197,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire187,
                 wire14,
                 wire15,
                 wire45,
                 wire47,
                 wire48,
                 wire49,
                 wire50,
                 wire74,
                 wire107,
                 wire146,
                 wire148,
                 wire149,
                 wire185,
                 (1'h0)};
  assign wire14 = $unsigned((+wire13[(3'h5):(3'h4)]));
  assign wire15 = ((~&wire13[(1'h0):(1'h0)]) <= wire10[(4'h8):(1'h0)]);
  module16 #() modinst46 (.wire18(wire10), .wire17(wire12), .wire19(wire13), .wire20(wire9), .clk(clk), .y(wire45));
  assign wire47 = wire14;
  assign wire48 = wire15[(3'h5):(2'h2)];
  assign wire49 = $signed({wire13[(4'h9):(2'h2)]});
  assign wire50 = wire49[(3'h5):(3'h4)];
  module51 #() modinst75 (wire74, clk, wire14, wire9, wire49, wire47);
  module76 #() modinst108 (.clk(clk), .wire79(wire49), .wire80(wire9), .y(wire107), .wire77(wire10), .wire78(wire47));
  module109 #() modinst147 (.wire111(wire10), .wire112(wire9), .clk(clk), .y(wire146), .wire110(wire14), .wire113(wire107));
  assign wire148 = $signed({wire12[(5'h10):(1'h0)]});
  assign wire149 = ((wire45 ?
                           ($signed((wire48 >> wire12)) | wire45) : (-$unsigned(wire107))) ?
                       wire48[(4'hb):(4'h9)] : (~|(-(^~$unsigned(wire45)))));
  module150 #() modinst186 (wire185, clk, wire107, wire14, wire13, wire47, wire48);
  module51 #() modinst188 (.wire54(wire107), .clk(clk), .wire55(wire149), .wire52(wire50), .y(wire187), .wire53(wire45));
  assign wire189 = (~|$signed({(7'h42)}));
  assign wire190 = $unsigned(wire9);
  assign wire191 = ((wire187 ?
                       wire13 : (({wire189} << wire50) * $signed($unsigned(wire50)))) + ($unsigned({$signed(wire107)}) <= ((~^wire10) ?
                       $signed($signed(wire48)) : ((+(8'hac)) ?
                           $unsigned(wire74) : (wire50 < (8'hba))))));
  assign wire192 = (~&wire190[(2'h3):(2'h2)]);
  assign wire193 = wire45;
  assign wire194 = wire191[(3'h7):(3'h6)];
  module51 #() modinst196 (wire195, clk, wire10, wire49, wire192, wire194);
  assign wire197 = wire193[(4'ha):(4'h8)];
endmodule

module module150
#(parameter param184 = (((((~|(8'ha6)) ~^ (-(8'hac))) >= (+(~|(8'ha8)))) & (~^(~^(^~(8'hab))))) ? (-((((7'h40) ? (8'hab) : (7'h44)) || ((8'ha9) ? (8'hb7) : (8'h9e))) ? (-((8'hb1) ^~ (8'hbb))) : ({(8'haa)} ^ ((8'hba) | (8'hb5))))) : (~(-(!((8'hb8) <<< (8'h9f)))))))
(y, clk, wire155, wire154, wire153, wire152, wire151);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire155;
  input wire signed [(2'h3):(1'h0)] wire154;
  input wire signed [(4'hd):(1'h0)] wire153;
  input wire signed [(5'h12):(1'h0)] wire152;
  input wire [(5'h11):(1'h0)] wire151;
  wire signed [(4'ha):(1'h0)] wire181;
  wire signed [(4'h8):(1'h0)] wire177;
  wire signed [(5'h15):(1'h0)] wire176;
  wire signed [(4'hf):(1'h0)] wire175;
  wire [(5'h10):(1'h0)] wire174;
  wire signed [(5'h11):(1'h0)] wire173;
  wire [(3'h6):(1'h0)] wire167;
  wire signed [(3'h5):(1'h0)] wire162;
  wire signed [(3'h6):(1'h0)] wire161;
  wire [(5'h15):(1'h0)] wire160;
  wire signed [(4'hd):(1'h0)] wire159;
  wire [(4'h9):(1'h0)] wire158;
  wire signed [(4'h8):(1'h0)] wire157;
  wire signed [(4'he):(1'h0)] wire156;
  reg [(4'hf):(1'h0)] reg183 = (1'h0);
  reg [(2'h3):(1'h0)] reg182 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg172 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg170 = (1'h0);
  reg [(4'ha):(1'h0)] reg169 = (1'h0);
  reg [(5'h10):(1'h0)] reg168 = (1'h0);
  reg [(5'h11):(1'h0)] reg166 = (1'h0);
  reg [(4'hd):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg164 = (1'h0);
  reg [(4'he):(1'h0)] reg163 = (1'h0);
  assign y = {wire181,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire167,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 reg183,
                 reg182,
                 reg180,
                 reg179,
                 reg178,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 (1'h0)};
  assign wire156 = wire155;
  assign wire157 = (wire153 + (|wire156[(2'h2):(1'h0)]));
  assign wire158 = (~&((((wire154 ^~ wire153) ^~ $unsigned(wire154)) * wire154) ?
                       wire152 : $signed({(wire155 ? (8'h9d) : wire152),
                           $unsigned((8'hba))})));
  assign wire159 = $signed((((8'h9c) || (7'h43)) ?
                       ((wire153[(1'h0):(1'h0)] > (wire158 ?
                               wire153 : (8'h9c))) ?
                           (~$unsigned((8'hb5))) : ($unsigned(wire158) && (~wire157))) : wire158[(4'h8):(3'h6)]));
  assign wire160 = $signed(wire154);
  assign wire161 = ((-(8'hba)) ?
                       wire154[(1'h0):(1'h0)] : {wire159[(4'h9):(3'h4)],
                           ({(wire154 & wire154)} == $signed($unsigned(wire153)))});
  assign wire162 = (((~&(~wire158)) != ((((8'hb1) ? wire151 : wire160) ?
                           {wire156, wire156} : (wire160 * wire158)) ?
                       wire160[(4'hc):(4'hc)] : $unsigned($unsigned(wire158)))) + (+($signed($signed(wire152)) ?
                       {(wire153 ? (8'haf) : wire155)} : {$signed(wire155),
                           wire161})));
  always
    @(posedge clk) begin
      if (((((wire158 < wire157) + ($signed((8'hb5)) <<< (~|wire161))) <<< $unsigned($unsigned($unsigned(wire152)))) ?
          ((wire151 ?
              $signed({wire154,
                  wire154}) : wire158) <= (^~wire152)) : ($signed(((wire158 < (8'ha1)) << $unsigned(wire158))) ?
              wire162 : ($signed((wire152 * (8'ha2))) - {(!wire153)}))))
        begin
          reg163 <= wire151;
        end
      else
        begin
          reg163 <= (&(wire153 ?
              (((wire160 ?
                  wire156 : (8'had)) & $signed(wire157)) || $signed(wire162)) : (wire161 ?
                  $signed(wire160) : wire157)));
        end
      reg164 <= $signed(($signed($signed($signed(wire151))) && wire159[(3'h5):(2'h3)]));
      reg165 <= ($signed($signed(({wire152} - $signed(wire159)))) ?
          wire153[(4'ha):(2'h3)] : wire159[(3'h6):(3'h4)]);
      reg166 <= $signed($signed(wire158));
    end
  assign wire167 = ($unsigned(((wire151 ?
                           wire153 : $unsigned(wire154)) || {$signed(wire154),
                           (reg164 >> (8'hb4))})) ?
                       wire162[(1'h1):(1'h0)] : wire152[(4'hd):(3'h7)]);
  always
    @(posedge clk) begin
      reg168 <= $unsigned(reg164);
      reg169 <= wire160;
    end
  always
    @(posedge clk) begin
      reg170 <= {($signed($signed(wire161[(3'h4):(1'h1)])) ?
              $unsigned((^(wire161 ?
                  (8'hb0) : (8'haa)))) : {(reg165[(4'h8):(2'h3)] && reg166[(2'h2):(2'h2)])}),
          ((($unsigned(reg166) * (reg168 ? wire152 : wire162)) ?
                  (-(~^wire162)) : (~wire159)) ?
              (8'had) : (({wire158, wire157} ? $signed(wire161) : wire151) ?
                  reg169 : (wire159 & reg163)))};
      reg171 <= ($unsigned(wire160[(5'h14):(4'hf)]) ~^ wire157[(2'h2):(1'h0)]);
      reg172 <= ({($signed(reg164[(1'h0):(1'h0)]) ^ (8'hbf)), (7'h40)} ?
          (7'h43) : $signed(reg168));
    end
  assign wire173 = {(reg168[(3'h7):(2'h3)] ?
                           (~|wire154) : reg171[(3'h7):(3'h7)])};
  assign wire174 = $signed($unsigned((wire157[(2'h2):(1'h0)] == (8'ha8))));
  assign wire175 = wire173[(3'h5):(3'h4)];
  assign wire176 = ($signed(((wire173[(4'hc):(2'h3)] + reg169[(1'h1):(1'h0)]) ?
                       wire173 : (!{wire159}))) >> (-wire157[(4'h8):(1'h1)]));
  assign wire177 = $unsigned(($unsigned(((~(8'ha0)) ?
                           $unsigned(wire174) : (~^wire161))) ?
                       (-wire161) : (|wire152[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg178 <= reg164;
      reg179 <= $unsigned({(((~&wire159) != $unsigned(reg178)) || $unsigned($unsigned(reg170)))});
      reg180 <= (~^(reg166 ?
          reg163 : (reg166[(5'h11):(4'hc)] || (~^$signed(wire155)))));
    end
  assign wire181 = wire177;
  always
    @(posedge clk) begin
      reg182 <= (|wire155[(4'hb):(2'h2)]);
      reg183 <= $signed($unsigned(reg166));
    end
endmodule

module module109  (y, clk, wire113, wire112, wire111, wire110);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire113;
  input wire signed [(4'hc):(1'h0)] wire112;
  input wire [(4'hd):(1'h0)] wire111;
  input wire [(4'he):(1'h0)] wire110;
  wire signed [(5'h15):(1'h0)] wire145;
  wire signed [(4'h9):(1'h0)] wire144;
  wire [(5'h11):(1'h0)] wire143;
  wire [(5'h10):(1'h0)] wire142;
  wire signed [(4'h8):(1'h0)] wire122;
  wire [(3'h4):(1'h0)] wire121;
  wire [(4'hc):(1'h0)] wire120;
  wire signed [(5'h12):(1'h0)] wire119;
  wire [(4'h9):(1'h0)] wire118;
  wire signed [(3'h7):(1'h0)] wire117;
  wire [(4'h9):(1'h0)] wire116;
  wire [(5'h15):(1'h0)] wire115;
  wire [(4'he):(1'h0)] wire114;
  reg [(3'h6):(1'h0)] reg141 = (1'h0);
  reg [(3'h6):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg137 = (1'h0);
  reg [(4'h8):(1'h0)] reg136 = (1'h0);
  reg [(3'h4):(1'h0)] reg135 = (1'h0);
  reg [(4'h8):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg133 = (1'h0);
  reg [(3'h6):(1'h0)] reg132 = (1'h0);
  reg [(4'ha):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg130 = (1'h0);
  reg [(3'h5):(1'h0)] reg129 = (1'h0);
  reg [(5'h10):(1'h0)] reg128 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg124 = (1'h0);
  reg [(3'h6):(1'h0)] reg123 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
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
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 (1'h0)};
  assign wire114 = wire113[(3'h5):(3'h5)];
  assign wire115 = $unsigned(wire110[(2'h3):(1'h1)]);
  assign wire116 = $unsigned({wire112,
                       ((~^$signed(wire111)) ^~ wire110[(4'he):(4'hb)])});
  assign wire117 = $unsigned($unsigned((-wire115)));
  assign wire118 = ($unsigned($unsigned($signed((wire112 ?
                           (8'hb8) : wire110)))) ?
                       (wire113 ?
                           $unsigned((8'hbb)) : wire111) : $signed($signed((8'hb4))));
  assign wire119 = wire115[(3'h4):(3'h4)];
  assign wire120 = $signed(wire113);
  assign wire121 = $unsigned({wire114[(2'h2):(1'h1)]});
  assign wire122 = (!(~&(^(~&((8'ha5) >= (8'ha4))))));
  always
    @(posedge clk) begin
      if (wire118)
        begin
          if ($signed(wire113))
            begin
              reg123 <= ((wire119 ?
                  wire110 : (((~|wire114) ?
                      $signed(wire120) : $unsigned(wire121)) << $unsigned({wire121}))) + $unsigned((^~$unsigned((8'ha2)))));
              reg124 <= (wire112 ~^ wire116);
              reg125 <= wire114[(4'hd):(4'h9)];
            end
          else
            begin
              reg123 <= wire116[(3'h7):(3'h7)];
              reg124 <= {($unsigned({(!wire113),
                      wire110[(2'h3):(2'h2)]}) ^ ($signed(wire122) ?
                      (wire122[(2'h3):(2'h3)] < $signed((7'h43))) : wire112[(3'h6):(1'h0)])),
                  ((~|(wire115[(4'h8):(4'h8)] ? wire120 : $unsigned(wire111))) ?
                      (~&wire118) : (((8'had) ?
                          wire121 : (wire122 ?
                              wire116 : wire118)) << $signed((wire117 < wire115))))};
            end
          if ({((8'hb6) ? wire111 : wire122[(3'h7):(3'h4)])})
            begin
              reg126 <= ($unsigned($unsigned(wire119)) ?
                  wire113[(4'h8):(3'h7)] : $unsigned(wire112));
              reg127 <= wire116[(4'h8):(3'h7)];
              reg128 <= wire116;
              reg129 <= $unsigned((wire115 ?
                  reg127[(4'hf):(3'h4)] : reg125[(4'h8):(3'h7)]));
              reg130 <= (reg128 ^~ $unsigned(($unsigned((wire113 && reg128)) && $signed($signed((8'hb4))))));
            end
          else
            begin
              reg126 <= $signed((~&(8'h9d)));
              reg127 <= ((~{($signed(wire117) ?
                          wire112[(3'h6):(3'h5)] : (|wire117)),
                      ((^~wire112) ^ {reg129, wire112})}) ?
                  (!reg129) : wire117[(3'h7):(1'h0)]);
              reg128 <= $signed($signed(wire114[(4'hb):(3'h4)]));
              reg129 <= reg126[(3'h5):(1'h0)];
              reg130 <= $signed((&{$signed((~^reg130))}));
            end
          reg131 <= wire115;
          if (wire116)
            begin
              reg132 <= $unsigned({{$unsigned($unsigned(wire110)), wire117}});
              reg133 <= {reg130};
              reg134 <= (7'h43);
              reg135 <= wire121[(2'h2):(1'h1)];
            end
          else
            begin
              reg132 <= $signed(reg134);
              reg133 <= {(~|(($signed(wire114) ?
                      (+reg132) : $unsigned(reg128)) >>> ($unsigned(reg129) >= reg127)))};
              reg134 <= $unsigned($unsigned((8'haf)));
              reg135 <= $signed(({($signed((7'h43)) >>> reg125[(2'h3):(2'h2)]),
                  reg132} * (!reg126[(1'h0):(1'h0)])));
            end
          reg136 <= $signed((~&$unsigned(wire116[(3'h6):(3'h6)])));
        end
      else
        begin
          reg123 <= ((8'hb3) && (8'h9c));
          if ((!($signed(wire121[(3'h4):(1'h0)]) ?
              (~&((wire111 ? reg126 : wire110) ?
                  (reg131 * wire114) : (^wire119))) : wire119[(5'h11):(3'h7)])))
            begin
              reg124 <= reg128[(4'hc):(2'h2)];
              reg125 <= reg134;
              reg126 <= ($unsigned(reg123) << (!wire112));
              reg127 <= reg125;
              reg128 <= wire111;
            end
          else
            begin
              reg124 <= wire116;
            end
          reg129 <= $signed(($signed({(reg126 == reg130)}) << ((reg135 | $unsigned(wire114)) - ($unsigned((8'hb3)) >>> ((8'hb8) ?
              reg129 : reg127)))));
          reg130 <= ($signed(((8'hba) || (&(reg135 != wire117)))) <= $unsigned({reg129[(1'h0):(1'h0)],
              $unsigned($unsigned(reg136))}));
          reg131 <= ($unsigned((({reg128, (7'h43)} ?
                  (wire117 ?
                      (8'h9f) : reg131) : $unsigned(reg127)) <<< reg135)) ?
              {((~&(reg129 ? (8'ha7) : reg126)) ?
                      $unsigned($signed(reg124)) : (8'hb4)),
                  reg134} : reg131);
        end
    end
  always
    @(posedge clk) begin
      reg137 <= $signed((+(8'h9d)));
      reg138 <= wire114[(4'hd):(1'h1)];
      reg139 <= (reg126[(3'h6):(3'h5)] != ((wire112 - ($signed(reg126) ^ {wire115})) >>> $signed($unsigned(reg129))));
      reg140 <= $signed(($signed($signed($unsigned(reg136))) * (!$unsigned(reg125[(4'hf):(3'h7)]))));
      reg141 <= (((wire121[(2'h2):(2'h2)] ?
          reg126[(2'h3):(1'h1)] : $unsigned((!reg126))) + ((!(wire111 ?
              reg130 : reg137)) ?
          (~|wire118[(3'h7):(3'h7)]) : $signed((wire121 ?
              reg128 : (7'h40))))) - $unsigned(wire122[(3'h7):(3'h5)]));
    end
  assign wire142 = $signed(((((!wire110) ?
                           reg123 : ((8'hb8) ? (8'h9d) : reg140)) >> reg132) ?
                       reg137[(3'h7):(3'h4)] : ({(^(8'hab))} <= (wire122 ?
                           reg129[(2'h3):(2'h3)] : $signed(wire110)))));
  assign wire143 = reg125;
  assign wire144 = (~|reg141[(3'h5):(1'h1)]);
  assign wire145 = $unsigned($signed({$unsigned($unsigned(wire118)),
                       (^~(wire111 ? wire143 : reg134))}));
endmodule

module module76
#(parameter param105 = (~(~^(|((+(7'h43)) ? ((7'h44) ? (8'hbe) : (8'ha2)) : ((8'ha8) ? (8'hb0) : (8'had)))))), 
parameter param106 = ((param105 << (param105 ? ((param105 ? param105 : (8'ha7)) << param105) : param105)) ? (({(param105 ? param105 : param105)} ? (param105 >>> (8'hab)) : param105) >>> (-((param105 && param105) ? (|param105) : {param105, param105}))) : ({((8'ha4) ~^ (param105 ? param105 : param105))} ? param105 : param105)))
(y, clk, wire80, wire79, wire78, wire77);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire80;
  input wire signed [(4'hb):(1'h0)] wire79;
  input wire [(4'he):(1'h0)] wire78;
  input wire [(4'hd):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire91;
  wire signed [(5'h10):(1'h0)] wire81;
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg101 = (1'h0);
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg97 = (1'h0);
  reg [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg92 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg84 = (1'h0);
  reg [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  assign y = {wire91,
                 wire81,
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
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 (1'h0)};
  assign wire81 = wire79[(3'h7):(3'h4)];
  always
    @(posedge clk) begin
      reg82 <= $signed(({(wire81 || $unsigned(wire77)),
          wire79[(2'h2):(2'h2)]} != (wire78[(1'h0):(1'h0)] * (^~$unsigned(wire81)))));
      if ((+($signed(($signed(wire78) ? (+wire77) : $unsigned(wire78))) ?
          $signed(wire81) : (({wire78} << (8'haa)) ~^ wire80))))
        begin
          reg83 <= {$signed($signed((8'hac))), $unsigned(wire81)};
          reg84 <= wire81;
          reg85 <= $signed(wire81[(4'hd):(4'hc)]);
          reg86 <= (~&($unsigned(reg85[(2'h2):(2'h2)]) << $unsigned(($signed(reg85) || $unsigned(wire77)))));
          reg87 <= wire77;
        end
      else
        begin
          reg83 <= {(wire79[(2'h3):(1'h1)] + {$unsigned($signed(wire81)),
                  (-(~&reg86))})};
          if ($signed($signed((^~((&wire80) ?
              (reg87 * reg82) : $unsigned(reg87))))))
            begin
              reg84 <= $unsigned({({(reg82 ~^ reg82), reg83} ?
                      reg83[(3'h5):(3'h4)] : ((~&reg86) ? (&wire80) : {reg87})),
                  ($signed(reg85) ^~ ($unsigned(wire79) ?
                      reg83 : (~&wire81)))});
              reg85 <= reg82;
              reg86 <= (^wire81);
              reg87 <= $unsigned(wire79);
            end
          else
            begin
              reg84 <= (($signed((~&(wire79 >>> wire80))) > $signed({(!reg86),
                      reg83[(4'h9):(3'h4)]})) ?
                  $signed(wire81) : (wire80 && wire79[(3'h7):(3'h7)]));
              reg85 <= {($signed(((~|wire81) | reg82)) & (|(~&{reg84,
                      wire77}))),
                  $signed((({reg86, (8'ha9)} ?
                          (wire80 ? wire77 : (8'h9f)) : reg85[(3'h7):(2'h3)]) ?
                      reg83[(4'h9):(2'h3)] : (-{wire79})))};
              reg86 <= $signed(($signed(reg86[(2'h2):(1'h0)]) ?
                  ({wire80[(4'h8):(1'h0)]} <<< (~^{wire81})) : {{wire81[(3'h5):(1'h1)],
                          (wire79 != (7'h44))},
                      $unsigned((wire81 >>> reg85))}));
              reg87 <= (|$signed(reg86));
              reg88 <= reg83[(4'hb):(2'h2)];
            end
          reg89 <= $unsigned($unsigned((8'hb4)));
        end
      reg90 <= wire79[(3'h6):(3'h6)];
    end
  assign wire91 = {(~^(~wire80[(1'h0):(1'h0)])),
                      $signed($unsigned({(wire77 ? wire80 : wire77), wire81}))};
  always
    @(posedge clk) begin
      reg92 <= $unsigned($signed(wire91));
      if (($unsigned($signed(wire78)) ^ (reg85 >> ((&reg92[(1'h1):(1'h0)]) - $unsigned((~^wire77))))))
        begin
          reg93 <= wire79[(3'h6):(2'h3)];
        end
      else
        begin
          reg93 <= $signed($signed((&$signed((&reg85)))));
          reg94 <= ((wire79 ?
              reg82 : (^(|(reg88 ? reg89 : reg86)))) > (^~reg83));
          reg95 <= (~(~^reg94));
          reg96 <= wire91[(4'h9):(4'h8)];
          reg97 <= {reg93[(2'h2):(1'h1)], (^~$unsigned(wire79[(3'h5):(1'h1)]))};
        end
      if (($unsigned(reg89) ? (&$signed((^$signed(reg94)))) : reg93))
        begin
          if (($signed((+reg88)) ^~ (~&((~^$unsigned(reg88)) ^ ((^~reg96) >= (reg83 ?
              reg97 : reg85))))))
            begin
              reg98 <= (reg84[(4'hf):(3'h7)] ^~ (|wire77[(4'hd):(3'h7)]));
              reg99 <= $signed((!$signed((~(reg96 ? reg96 : wire78)))));
              reg100 <= ($unsigned((reg89 >>> (8'h9d))) | reg93);
              reg101 <= $unsigned(wire81);
              reg102 <= $signed(reg101[(4'ha):(3'h7)]);
            end
          else
            begin
              reg98 <= reg85;
            end
        end
      else
        begin
          reg98 <= wire81;
          reg99 <= ((({(^~reg93), (reg102 ? reg94 : reg87)} ?
                      $unsigned((-(8'h9f))) : ((reg95 ? reg90 : reg83) ?
                          (8'ha2) : $signed(reg101))) ?
                  ({$unsigned(wire81), reg90} ?
                      (&(reg95 - (8'hb1))) : $unsigned(((8'ha9) != reg82))) : reg92) ?
              (!$unsigned($unsigned(reg101))) : {$signed({$unsigned(reg97),
                      $unsigned(wire77)})});
          reg100 <= wire78[(4'he):(4'h8)];
        end
      reg103 <= reg93[(1'h1):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg104 <= $unsigned((~&$unsigned($signed($unsigned(wire79)))));
    end
endmodule

module module51
#(parameter param73 = ((~|(((~&(8'hbe)) & (!(8'hab))) >= {{(7'h40), (8'ha4)}, ((7'h41) - (8'ha0))})) ? {((((8'hab) ? (8'hbd) : (8'hbd)) ? ((8'haf) | (8'ha1)) : (8'ha6)) ? ((~&(8'h9d)) < ((8'h9e) - (8'hb2))) : ((8'h9e) >>> (-(8'hbb)))), ((((8'hbb) >= (7'h40)) ? ((8'ha6) <<< (8'haa)) : (~^(8'ha2))) | (~^(^(8'hae))))} : ({(((8'hac) ? (8'hb8) : (7'h41)) ^~ (!(8'hae))), ((^~(8'hb0)) ? ((8'h9e) | (8'ha3)) : (~^(8'hb0)))} ? (~&(!{(8'hb3), (8'hbd)})) : ((((8'hbf) && (8'h9e)) && ((8'haa) ? (8'ha7) : (8'hb1))) ? {((8'haf) - (8'hbc))} : ((~(8'hb1)) > (&(8'haf)))))))
(y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire55;
  input wire signed [(5'h13):(1'h0)] wire54;
  input wire [(4'hb):(1'h0)] wire53;
  input wire signed [(5'h11):(1'h0)] wire52;
  wire signed [(3'h6):(1'h0)] wire72;
  wire signed [(4'ha):(1'h0)] wire71;
  wire [(2'h3):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire61;
  wire [(3'h5):(1'h0)] wire60;
  wire [(4'hd):(1'h0)] wire59;
  wire signed [(4'hc):(1'h0)] wire58;
  wire [(2'h2):(1'h0)] wire57;
  wire [(3'h6):(1'h0)] wire56;
  reg [(4'ha):(1'h0)] reg70 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  assign wire56 = (+$signed({($signed(wire52) >> $unsigned(wire53))}));
  assign wire57 = $signed($unsigned(wire53[(4'h9):(3'h7)]));
  assign wire58 = wire55;
  assign wire59 = $signed(((($unsigned(wire57) > wire52[(3'h7):(3'h7)]) ?
                          $unsigned($unsigned(wire58)) : wire58) ?
                      (~&{wire52[(3'h7):(3'h4)]}) : $unsigned(((wire58 ?
                          (8'ha4) : wire55) >= {(8'had), (8'hb7)}))));
  assign wire60 = (($unsigned((~&$unsigned(wire56))) ?
                      $signed($unsigned(wire54[(5'h11):(3'h5)])) : (~((wire58 * wire59) | (wire52 << wire59)))) >>> ((wire57[(1'h0):(1'h0)] >= {(wire55 & wire52)}) ^~ {(+$unsigned((8'hb5)))}));
  assign wire61 = $signed((-$unsigned(((~|wire53) ?
                      $unsigned(wire57) : $signed(wire55)))));
  assign wire62 = wire60;
  assign wire63 = wire57;
  assign wire64 = (7'h42);
  assign wire65 = ($signed(((^wire64[(5'h10):(4'he)]) ?
                          ((|wire52) ^ (&wire56)) : wire56)) ?
                      $signed($unsigned(wire55[(4'hb):(2'h2)])) : (wire64 + (wire55[(4'hc):(1'h1)] ?
                          ((wire52 <<< wire58) ?
                              wire57 : {wire62, wire59}) : wire59)));
  assign wire66 = (^~$signed((($signed(wire61) << $unsigned(wire65)) < ($signed(wire65) || (wire65 ?
                      wire64 : wire64)))));
  assign wire67 = $signed(wire63[(4'he):(4'he)]);
  always
    @(posedge clk) begin
      reg68 <= (~(+$unsigned($signed(wire53[(4'ha):(1'h0)]))));
      reg69 <= (+wire57);
      reg70 <= $unsigned(((($unsigned(wire65) - $signed(wire67)) | $unsigned(wire58[(1'h1):(1'h0)])) ^ wire58));
    end
  assign wire71 = $signed(wire66[(4'hb):(3'h5)]);
  assign wire72 = wire60;
endmodule

module module16
#(parameter param43 = ((+(|((+(8'h9f)) ? ((8'had) ? (8'hb9) : (8'hb8)) : {(8'haa)}))) ? (((~&((8'ha5) != (8'ha5))) ? (((7'h44) ? (7'h41) : (8'hb9)) == ((8'hbf) >> (7'h43))) : {((8'hb8) >>> (7'h41)), ((8'h9e) ? (8'hbe) : (8'ha6))}) ? (((~|(8'had)) ? ((8'ha2) ? (8'h9d) : (8'ha6)) : (8'hb7)) ? ((~^(8'ha0)) <= ((8'hb7) << (8'hb0))) : ({(7'h41), (8'hb5)} * (~^(8'ha7)))) : (({(8'ha5)} ? (8'h9f) : ((8'ha6) ? (8'hbf) : (7'h42))) ? ({(8'hb5), (7'h44)} ? ((8'ha3) >> (8'hb1)) : (~&(8'ha2))) : ((^(7'h41)) >>> {(8'hb6)}))) : ((((&(8'hb0)) ^~ {(8'ha5), (8'ha2)}) ? {((8'ha9) ? (8'h9d) : (8'haa))} : (((8'ha5) | (8'ha8)) - (+(8'hab)))) ? ((((8'hb9) ? (8'h9c) : (8'hb7)) ~^ ((8'hb2) + (8'had))) ? (((8'ha0) <= (8'hbf)) >>> ((8'hb4) ~^ (8'ha3))) : (((8'hab) ? (8'ha0) : (8'ha5)) << ((8'ha4) <<< (8'hbc)))) : ((~&((8'hbc) ? (8'ha9) : (8'hb6))) ? ((^(7'h40)) ? ((8'h9c) ? (7'h40) : (8'hbf)) : (-(8'h9f))) : ({(8'haf), (7'h44)} ? (|(8'hbd)) : (-(8'hbd)))))), 
parameter param44 = (^~({((!param43) != ((8'hb9) ? (8'ha2) : param43)), param43} ? {(param43 > {param43, param43}), ((param43 | param43) <= param43)} : (~^(param43 ? param43 : (param43 <<< param43))))))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire20;
  input wire [(5'h11):(1'h0)] wire19;
  input wire [(2'h3):(1'h0)] wire18;
  input wire signed [(4'hb):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire40;
  wire [(4'h8):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire21;
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire23,
                 wire22,
                 wire21,
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
                 (1'h0)};
  assign wire21 = wire20[(2'h2):(1'h0)];
  assign wire22 = ($signed(((!$unsigned(wire20)) == $signed((^~wire20)))) ?
                      (~((wire20[(1'h0):(1'h0)] != $signed(wire17)) << ($unsigned(wire21) >= $signed(wire20)))) : {wire21[(1'h0):(1'h0)],
                          wire17});
  assign wire23 = (wire22[(2'h2):(1'h1)] ?
                      ((~|{(wire22 ? wire17 : wire22)}) ?
                          $signed(wire20[(1'h1):(1'h1)]) : wire20) : wire17);
  always
    @(posedge clk) begin
      if ($unsigned(($signed({{wire17, wire18}, wire23}) ?
          (&$signed($signed(wire19))) : (wire18 || wire20[(1'h0):(1'h0)]))))
        begin
          reg24 <= wire22;
          if (($unsigned(wire22) ?
              (($signed((~^wire22)) + ($unsigned(reg24) ?
                  (wire20 ?
                      wire17 : reg24) : $unsigned(reg24))) || $signed($unsigned((reg24 || wire18)))) : wire21))
            begin
              reg25 <= $signed($signed($signed($signed($signed(wire20)))));
              reg26 <= wire22;
            end
          else
            begin
              reg25 <= (wire18 ?
                  (reg24[(3'h6):(1'h1)] | wire21[(1'h0):(1'h0)]) : ((((!wire23) ?
                      $unsigned(reg26) : $signed(wire19)) << wire20[(1'h0):(1'h0)]) ^ reg25));
              reg26 <= (~^$unsigned($signed($signed($signed(reg25)))));
              reg27 <= (^(reg25[(4'h9):(2'h2)] <= ($signed((~|wire17)) ?
                  (8'hb5) : wire19[(1'h0):(1'h0)])));
              reg28 <= wire22;
              reg29 <= ($signed(wire18) ?
                  $unsigned(reg27[(2'h3):(2'h2)]) : (+($signed($signed(wire18)) <= $unsigned(wire17[(3'h5):(1'h1)]))));
            end
        end
      else
        begin
          reg24 <= (~(~^reg24));
          if ($signed(($unsigned(((wire21 | reg29) ?
              wire22 : (wire19 ?
                  reg28 : wire23))) && ($unsigned(((7'h41) <= wire22)) + reg27[(4'h9):(4'h8)]))))
            begin
              reg25 <= ({(~&(8'ha8)), wire18} ?
                  ((&reg28[(2'h3):(2'h3)]) ?
                      wire21[(2'h2):(1'h1)] : wire18) : $signed(reg25));
              reg26 <= reg29[(3'h5):(1'h0)];
            end
          else
            begin
              reg25 <= $signed($unsigned((((+reg28) ~^ wire17[(3'h6):(1'h0)]) | ((~|reg28) - ((8'hac) << (8'had))))));
              reg26 <= $signed(wire23);
              reg27 <= (8'haf);
            end
          reg28 <= ($signed(((-reg26) ?
              $unsigned($unsigned(reg29)) : (7'h44))) << ((((|reg29) ?
                  ((8'hb2) ? wire21 : wire22) : ((7'h42) != wire23)) ?
              wire23 : (reg28 * (wire23 ?
                  wire20 : (8'hb5)))) <= wire21[(1'h1):(1'h0)]));
          if ($signed(($signed((-(reg26 && reg29))) << (~$signed($unsigned(reg27))))))
            begin
              reg29 <= wire18[(1'h0):(1'h0)];
              reg30 <= ($signed(wire22[(3'h7):(2'h2)]) != (~wire21[(1'h0):(1'h0)]));
              reg31 <= ((($signed($unsigned(reg28)) ?
                  $signed($unsigned(wire23)) : reg29[(4'hf):(4'ha)]) <<< (8'h9f)) > (!((((8'haa) | wire21) ?
                      reg26 : wire19) ?
                  (+$unsigned(wire20)) : {wire17[(4'h8):(3'h5)]})));
              reg32 <= $unsigned(wire18);
            end
          else
            begin
              reg29 <= reg25;
              reg30 <= ((|($unsigned((~|reg28)) ?
                  $signed((wire17 + wire21)) : reg29[(4'hb):(3'h7)])) > wire22);
            end
          if ($signed(reg30))
            begin
              reg33 <= reg31[(1'h1):(1'h1)];
              reg34 <= reg24;
              reg35 <= wire18[(2'h3):(2'h3)];
              reg36 <= (8'hb4);
              reg37 <= (^$signed(($unsigned(reg35) | {$signed(wire21),
                  wire21[(1'h1):(1'h1)]})));
            end
          else
            begin
              reg33 <= $unsigned(reg34[(1'h1):(1'h1)]);
              reg34 <= wire22[(4'he):(3'h4)];
              reg35 <= $unsigned($signed({((reg30 ? reg34 : reg35) ?
                      $signed(wire19) : reg28),
                  wire20[(2'h2):(1'h1)]}));
            end
        end
    end
  assign wire38 = (wire19 ?
                      ({(~|(|reg35))} > (+(~(reg24 ?
                          reg32 : reg24)))) : (((wire20 >>> (wire22 ?
                                  reg31 : (8'hb2))) ?
                              $signed((wire22 > reg24)) : (wire18 ?
                                  (+reg27) : (~reg26))) ?
                          (&((-reg28) ^ {reg24})) : (((~reg37) ?
                              (reg25 ?
                                  wire20 : wire23) : (!reg36)) ^ reg36[(3'h4):(3'h4)])));
  assign wire39 = {{reg30, $signed($signed($unsigned(reg37)))},
                      (((&reg33) ^ reg29[(4'h8):(3'h6)]) ?
                          $signed(reg25) : (~|$signed($signed((8'ha8)))))};
  assign wire40 = ($unsigned($unsigned(((reg25 ? wire38 : wire21) >> {wire18,
                      wire21}))) >>> $signed(($unsigned((reg26 * (8'ha6))) ~^ (~&(wire23 ?
                      reg26 : reg34)))));
  assign wire41 = (-reg37);
  assign wire42 = (8'ha6);
endmodule
