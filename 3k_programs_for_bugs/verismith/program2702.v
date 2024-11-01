module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire220;
  wire [(4'hc):(1'h0)] wire219;
  wire signed [(5'h11):(1'h0)] wire218;
  wire signed [(4'hd):(1'h0)] wire216;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  assign y = {wire220,
                 wire219,
                 wire218,
                 wire216,
                 wire7,
                 wire6,
                 wire5,
                 reg8,
                 reg9,
                 (1'h0)};
  assign wire5 = (^~(-$signed(((wire1 >= wire0) || $signed((8'h9e))))));
  assign wire6 = $signed((wire5[(1'h1):(1'h1)] ?
                     $signed(($signed(wire5) >= $signed(wire4))) : (~|wire5[(2'h3):(1'h0)])));
  assign wire7 = $signed($signed(wire4[(4'hc):(3'h6)]));
  always
    @(posedge clk) begin
      reg8 <= $signed($signed((~&(~(|(8'hb2))))));
      reg9 <= wire0;
    end
  module10 #() modinst217 (.wire11(wire5), .wire14(wire2), .y(wire216), .wire12(wire4), .wire15(wire7), .wire13(reg9), .clk(clk));
  assign wire218 = ($unsigned(wire2) ?
                       (~|wire7) : (($signed(wire216) ?
                           $unsigned(((8'hb9) ?
                               wire6 : wire3)) : wire2) != wire4));
  assign wire219 = wire0;
  assign wire220 = (^wire2[(3'h7):(3'h7)]);
endmodule

module module10
#(parameter param215 = ({(-{((8'haf) & (7'h41)), (8'hb8)})} * (((((8'h9e) ? (8'h9d) : (8'hbf)) ? ((8'ha6) ? (8'hb7) : (8'hb8)) : ((8'h9d) ^ (8'hb6))) ? {((8'ha3) ? (8'hb7) : (8'ha5)), (-(7'h41))} : (^~(^(7'h44)))) ? (~&((^(8'ha3)) ? {(8'hb7)} : ((8'hac) | (7'h41)))) : {(~^((8'hb5) ? (8'hb8) : (8'hae))), ((^(8'hb9)) & {(8'ha3), (8'hb2)})})))
(y, clk, wire11, wire12, wire13, wire14, wire15);
  output wire [(32'h217):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire signed [(5'h13):(1'h0)] wire13;
  input wire [(5'h11):(1'h0)] wire14;
  input wire [(5'h12):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire214;
  wire signed [(4'h9):(1'h0)] wire213;
  wire [(3'h4):(1'h0)] wire212;
  wire signed [(3'h4):(1'h0)] wire210;
  wire signed [(5'h14):(1'h0)] wire197;
  wire signed [(2'h2):(1'h0)] wire196;
  wire signed [(5'h15):(1'h0)] wire195;
  wire [(4'ha):(1'h0)] wire193;
  wire [(3'h5):(1'h0)] wire128;
  wire [(5'h11):(1'h0)] wire127;
  wire signed [(4'hf):(1'h0)] wire126;
  wire [(4'h9):(1'h0)] wire111;
  wire signed [(5'h12):(1'h0)] wire110;
  wire [(2'h2):(1'h0)] wire109;
  wire signed [(4'ha):(1'h0)] wire107;
  wire [(5'h15):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire58;
  wire [(2'h3):(1'h0)] wire56;
  reg signed [(3'h4):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg [(5'h13):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg121 = (1'h0);
  reg [(3'h7):(1'h0)] reg122 = (1'h0);
  reg [(5'h11):(1'h0)] reg123 = (1'h0);
  reg [(4'hd):(1'h0)] reg124 = (1'h0);
  reg [(5'h15):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg130 = (1'h0);
  reg [(5'h13):(1'h0)] reg131 = (1'h0);
  reg [(2'h3):(1'h0)] reg132 = (1'h0);
  reg [(4'hc):(1'h0)] reg133 = (1'h0);
  reg [(4'he):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg135 = (1'h0);
  reg [(5'h11):(1'h0)] reg136 = (1'h0);
  reg [(5'h11):(1'h0)] reg137 = (1'h0);
  reg [(3'h7):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg139 = (1'h0);
  assign y = {wire214,
                 wire213,
                 wire212,
                 wire210,
                 wire197,
                 wire196,
                 wire195,
                 wire193,
                 wire128,
                 wire127,
                 wire126,
                 wire111,
                 wire110,
                 wire109,
                 wire107,
                 wire60,
                 wire59,
                 wire58,
                 wire56,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 reg133,
                 reg134,
                 reg135,
                 reg136,
                 reg137,
                 reg138,
                 reg139,
                 (1'h0)};
  module16 #() modinst57 (.wire18(wire13), .wire20(wire11), .wire21(wire14), .clk(clk), .wire17(wire12), .wire19(wire15), .y(wire56));
  assign wire58 = $unsigned((wire14[(4'h9):(2'h3)] * $unsigned((|$unsigned(wire15)))));
  assign wire59 = wire58[(2'h2):(2'h2)];
  assign wire60 = wire12;
  module61 #() modinst108 (wire107, clk, wire60, wire12, wire59, wire13);
  assign wire109 = wire15[(3'h5):(1'h0)];
  assign wire110 = (8'ha8);
  assign wire111 = (-{wire107[(2'h3):(1'h1)]});
  always
    @(posedge clk) begin
      reg112 <= $unsigned($signed(wire13));
      if ($signed($unsigned(reg112[(2'h2):(2'h2)])))
        begin
          reg113 <= $signed((~|(~&$signed($unsigned(wire60)))));
          reg114 <= wire107[(4'h9):(2'h2)];
          if ($unsigned($unsigned((wire13[(4'h9):(4'h8)] < (!(wire111 == (8'hb2)))))))
            begin
              reg115 <= $signed((wire109[(1'h0):(1'h0)] >> wire60));
            end
          else
            begin
              reg115 <= wire56;
            end
        end
      else
        begin
          reg113 <= (^reg115);
        end
      if ($signed($signed($signed((+(-reg113))))))
        begin
          if ((^~$signed(reg113[(4'h9):(4'h9)])))
            begin
              reg116 <= (~|(+wire58[(3'h7):(3'h6)]));
              reg117 <= reg112;
              reg118 <= reg112;
              reg119 <= $unsigned((wire15[(1'h1):(1'h1)] ?
                  (+wire110[(3'h5):(3'h5)]) : {({reg115, (8'hb4)} << ((8'ha6) ?
                          reg115 : wire13)),
                      $unsigned(wire11)}));
            end
          else
            begin
              reg116 <= (reg113[(4'hd):(2'h3)] ?
                  ((!wire13) ?
                      ($unsigned($unsigned(reg114)) + ($signed(wire15) + $signed(wire111))) : ((reg118 ^ wire110) ?
                          wire109 : reg117)) : (~^wire56[(2'h2):(1'h1)]));
              reg117 <= $signed((((~wire110) ? (8'haf) : reg117) ?
                  wire13[(5'h11):(3'h4)] : (wire14[(2'h3):(2'h2)] << $signed($signed((8'ha1))))));
              reg118 <= wire107;
            end
          if (wire11)
            begin
              reg120 <= $signed(wire58);
              reg121 <= wire15[(4'h8):(3'h6)];
              reg122 <= $unsigned($signed((~reg118)));
            end
          else
            begin
              reg120 <= wire58;
            end
          reg123 <= (-wire107[(3'h4):(2'h3)]);
          reg124 <= $unsigned((|wire109[(1'h0):(1'h0)]));
          reg125 <= wire15[(4'h9):(3'h4)];
        end
      else
        begin
          if ((((-((~|reg121) ? reg124 : (reg112 ^ wire56))) ?
              (^~wire59[(5'h12):(3'h6)]) : reg118) ^~ $unsigned((wire60[(5'h11):(4'h8)] ?
              wire15[(2'h2):(1'h0)] : (&(wire58 >= reg112))))))
            begin
              reg116 <= reg113;
            end
          else
            begin
              reg116 <= (reg118 << $signed($unsigned(($signed(wire58) < (wire110 ?
                  wire110 : reg119)))));
              reg117 <= (+$unsigned(wire109));
              reg118 <= {($signed($signed(wire60[(4'ha):(4'ha)])) == (~&($signed(reg124) ?
                      {reg113, (8'hb1)} : ((8'h9e) ? reg124 : (8'h9d))))),
                  ((!wire107[(3'h5):(3'h5)]) ?
                      wire13 : ((reg113[(1'h0):(1'h0)] ?
                          (+wire58) : reg125) | wire12))};
            end
          reg119 <= ($unsigned((((~^wire56) ? wire12 : (reg120 | reg120)) ?
              $unsigned((^reg113)) : (~(|wire60)))) > reg117[(4'ha):(2'h3)]);
        end
    end
  assign wire126 = wire11[(2'h2):(2'h2)];
  assign wire127 = $unsigned(($signed($signed(wire110)) ?
                       wire15[(3'h6):(3'h5)] : $unsigned($signed((wire11 ?
                           wire107 : reg123)))));
  assign wire128 = $signed(reg115[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg129 <= $unsigned(wire11);
      if (($signed((reg122 | ((-reg118) >> (8'ha0)))) ?
          (wire110[(5'h11):(4'h9)] ?
              ((wire14[(3'h4):(2'h3)] >> $unsigned(reg120)) ?
                  $unsigned((wire126 ?
                      reg117 : wire11)) : wire107[(1'h0):(1'h0)]) : (+$signed(reg129))) : $signed((((~wire109) ?
              ((8'h9d) ?
                  reg116 : reg118) : reg125) ~^ (~|(wire14 ~^ wire60))))))
        begin
          reg130 <= reg112;
          reg131 <= (~(-(reg123 || reg116[(3'h6):(3'h6)])));
          reg132 <= {(~(~&{$signed(reg125)}))};
          reg133 <= (wire11 ^ {(|((reg120 ? reg117 : wire128) ?
                  (&wire128) : (^~reg132))),
              {(~^(~^(8'ha9)))}});
          reg134 <= reg112;
        end
      else
        begin
          if ((~((-(reg134[(3'h5):(2'h2)] ?
              wire127[(1'h0):(1'h0)] : $unsigned(reg115))) ^~ $signed(wire126))))
            begin
              reg130 <= wire109;
              reg131 <= (8'hb0);
            end
          else
            begin
              reg130 <= $signed({wire128,
                  (wire127 ? (^~reg132) : reg130[(3'h7):(1'h0)])});
              reg131 <= reg115;
              reg132 <= reg117[(3'h4):(1'h0)];
            end
          reg133 <= {$signed(reg130), (+$unsigned((~^(reg124 | (8'hab)))))};
          reg134 <= $unsigned({(((|reg124) + $signed(reg129)) >> {$signed(reg131)})});
          if (reg113)
            begin
              reg135 <= wire60[(2'h3):(1'h1)];
            end
          else
            begin
              reg135 <= $signed((8'hbf));
              reg136 <= ($unsigned((-{(+(8'h9c)), $unsigned(reg129)})) ?
                  wire109 : $unsigned(((8'hb2) >>> {$unsigned(wire107),
                      (wire13 >> (8'hb7))})));
              reg137 <= (reg120[(3'h5):(2'h2)] && reg124[(1'h1):(1'h0)]);
              reg138 <= wire111[(2'h2):(2'h2)];
            end
        end
      reg139 <= (reg130 != (8'hbb));
    end
  module140 #() modinst194 (.y(wire193), .wire144(wire126), .wire142(wire111), .wire143(wire14), .wire145(wire107), .clk(clk), .wire141(reg114));
  assign wire195 = (({$unsigned((reg138 ? (8'hb0) : reg125))} ?
                       $unsigned(reg116[(2'h3):(2'h3)]) : (~&wire56)) && reg114);
  assign wire196 = (!(^~({(reg125 - wire11), $signed(wire11)} ?
                       {reg138[(3'h4):(1'h1)],
                           (reg112 ~^ reg112)} : ((&reg120) ^~ (wire59 ?
                           reg122 : reg123)))));
  assign wire197 = ((~^$signed({(reg137 <<< (8'h9d))})) >>> $unsigned($unsigned(((8'ha9) >> (~&reg130)))));
  module198 #() modinst211 (.clk(clk), .wire202(wire14), .wire199(reg139), .y(wire210), .wire201(wire56), .wire200(reg129));
  assign wire212 = $signed($signed($signed(($unsigned((8'hb5)) >>> $signed((8'ha8))))));
  assign wire213 = (($unsigned({((8'hbe) ? wire197 : reg137)}) ?
                           ({(~&reg134)} >>> $signed((^reg139))) : (&$signed((~|wire59)))) ?
                       (~|$signed((~|(-reg116)))) : reg113[(1'h1):(1'h1)]);
  assign wire214 = (^~reg118[(1'h1):(1'h0)]);
endmodule

module module198
#(parameter param208 = (^~{(((|(8'hb9)) <<< (|(8'hbc))) ? (8'ha3) : {(~|(8'hae))})}), 
parameter param209 = (^~{(({param208} >>> param208) ? ((8'hb4) ~^ (param208 ? param208 : (8'ha0))) : ((param208 == param208) ~^ (|param208))), (param208 ? (~(param208 ? param208 : param208)) : param208)}))
(y, clk, wire202, wire201, wire200, wire199);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire202;
  input wire signed [(2'h2):(1'h0)] wire201;
  input wire signed [(5'h10):(1'h0)] wire200;
  input wire [(3'h7):(1'h0)] wire199;
  wire signed [(4'hd):(1'h0)] wire207;
  wire [(5'h15):(1'h0)] wire206;
  wire [(5'h10):(1'h0)] wire205;
  wire signed [(3'h5):(1'h0)] wire204;
  reg signed [(4'he):(1'h0)] reg203 = (1'h0);
  assign y = {wire207, wire206, wire205, wire204, reg203, (1'h0)};
  always
    @(posedge clk) begin
      reg203 <= $unsigned({(&((~&wire202) > (!wire200)))});
    end
  assign wire204 = $unsigned(wire200);
  assign wire205 = (wire201[(1'h0):(1'h0)] < $unsigned(wire199[(2'h3):(1'h0)]));
  assign wire206 = ((!$unsigned(((wire202 ?
                       (8'hba) : reg203) >> wire201[(1'h1):(1'h1)]))) > (wire201 * wire202[(3'h6):(3'h6)]));
  assign wire207 = ((((~(~|(8'hb2))) & (8'hb7)) ?
                           (+({wire199,
                               wire201} ^ wire201[(1'h1):(1'h1)])) : wire200[(4'h8):(1'h0)]) ?
                       $unsigned(wire206) : $signed((((wire202 ?
                           wire205 : wire206) ^ {wire202,
                           reg203}) < (wire206[(5'h12):(1'h0)] > ((8'hab) > wire201)))));
endmodule

module module140  (y, clk, wire145, wire144, wire143, wire142, wire141);
  output wire [(32'h20b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire145;
  input wire [(4'hf):(1'h0)] wire144;
  input wire [(5'h11):(1'h0)] wire143;
  input wire [(3'h4):(1'h0)] wire142;
  input wire [(4'hf):(1'h0)] wire141;
  wire signed [(4'hd):(1'h0)] wire179;
  wire signed [(2'h2):(1'h0)] wire173;
  wire signed [(2'h2):(1'h0)] wire149;
  wire signed [(5'h11):(1'h0)] wire148;
  wire [(4'hf):(1'h0)] wire147;
  wire signed [(5'h11):(1'h0)] wire146;
  reg signed [(5'h10):(1'h0)] reg192 = (1'h0);
  reg [(4'h8):(1'h0)] reg191 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg190 = (1'h0);
  reg [(4'hb):(1'h0)] reg189 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg188 = (1'h0);
  reg [(4'he):(1'h0)] reg187 = (1'h0);
  reg [(5'h11):(1'h0)] reg186 = (1'h0);
  reg [(4'hd):(1'h0)] reg185 = (1'h0);
  reg [(4'he):(1'h0)] reg184 = (1'h0);
  reg [(4'hc):(1'h0)] reg183 = (1'h0);
  reg [(4'h9):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg181 = (1'h0);
  reg [(5'h13):(1'h0)] reg180 = (1'h0);
  reg [(4'h8):(1'h0)] reg178 = (1'h0);
  reg [(4'ha):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg176 = (1'h0);
  reg [(3'h4):(1'h0)] reg175 = (1'h0);
  reg [(2'h2):(1'h0)] reg174 = (1'h0);
  reg [(2'h3):(1'h0)] reg172 = (1'h0);
  reg [(3'h4):(1'h0)] reg171 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg170 = (1'h0);
  reg [(3'h5):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg167 = (1'h0);
  reg [(5'h14):(1'h0)] reg166 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg162 = (1'h0);
  reg [(5'h13):(1'h0)] reg161 = (1'h0);
  reg [(5'h12):(1'h0)] reg160 = (1'h0);
  reg [(5'h15):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg155 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg154 = (1'h0);
  reg [(4'hb):(1'h0)] reg153 = (1'h0);
  reg [(3'h5):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg150 = (1'h0);
  assign y = {wire179,
                 wire173,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
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
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 (1'h0)};
  assign wire146 = ($unsigned(wire143) < $unsigned($signed(($unsigned(wire145) >> (+wire144)))));
  assign wire147 = {wire143[(5'h11):(3'h5)], wire146};
  assign wire148 = ((8'h9c) | ((-wire141[(4'hf):(3'h5)]) ^~ $unsigned({(~|wire147),
                       wire146})));
  assign wire149 = wire146[(4'h9):(1'h1)];
  always
    @(posedge clk) begin
      if (wire149)
        begin
          if ($unsigned((wire141 ^~ ($signed(wire148) ?
              wire141[(3'h4):(3'h4)] : (+(wire144 ? (8'hbd) : wire144))))))
            begin
              reg150 <= wire147[(4'h9):(3'h5)];
              reg151 <= reg150;
              reg152 <= wire143;
              reg153 <= $unsigned({(|$signed(wire144[(4'h8):(2'h2)]))});
              reg154 <= ($signed($signed($unsigned($unsigned(reg150)))) < (({wire145,
                      (wire148 >= wire143)} >= $signed((wire148 & wire148))) ?
                  wire146[(2'h3):(2'h3)] : reg153));
            end
          else
            begin
              reg150 <= reg150[(1'h1):(1'h1)];
              reg151 <= ((&wire146[(4'h8):(1'h0)]) ?
                  reg152[(3'h4):(1'h1)] : $unsigned((+$signed($unsigned(reg154)))));
              reg152 <= (^wire143[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          reg150 <= reg152[(3'h5):(3'h4)];
          reg151 <= $unsigned($signed((wire148 ? $signed(wire141) : wire149)));
          reg152 <= wire144;
        end
      reg155 <= ((~|{($signed(wire145) <= $unsigned(reg154))}) * reg152[(1'h1):(1'h1)]);
      reg156 <= wire143[(3'h4):(1'h1)];
      reg157 <= ($signed(wire147) ?
          reg152[(1'h1):(1'h1)] : ($signed($signed((^(7'h41)))) ?
              $signed((&wire146)) : {{(~^reg152)}}));
      reg158 <= $signed(($unsigned(reg154[(1'h1):(1'h0)]) >>> (((~^wire144) ?
          (reg153 != (8'haa)) : wire149[(2'h2):(2'h2)]) > reg151)));
    end
  always
    @(posedge clk) begin
      reg159 <= wire145[(3'h5):(2'h3)];
      reg160 <= reg155[(4'h9):(4'h9)];
      if (($unsigned(reg151[(2'h2):(2'h2)]) ?
          (~&reg154[(2'h2):(1'h0)]) : (wire149 ? (8'hb7) : (8'ha3))))
        begin
          reg161 <= (~|((reg160 ^ $signed($signed(wire146))) < $unsigned((~|reg160[(3'h6):(3'h6)]))));
          if (((&$signed(reg151)) & $signed(reg151)))
            begin
              reg162 <= wire148;
              reg163 <= (($unsigned(((8'hbe) == $signed(reg159))) ?
                      {$unsigned((reg159 * (8'hab))),
                          ($signed((8'hbc)) >>> (~^(8'hb5)))} : $signed(({wire142,
                              reg157} ?
                          (8'ha5) : ((8'h9d) ? wire145 : reg161)))) ?
                  (8'ha7) : ($unsigned((~|reg153[(1'h1):(1'h1)])) & (^(reg152 ^~ $unsigned(reg151)))));
              reg164 <= (|{(($unsigned(reg163) ?
                      $signed(reg161) : reg158[(4'hd):(4'hc)]) == (reg163 * $signed(reg163))),
                  ((reg160[(3'h6):(1'h0)] ?
                      $signed(reg154) : wire141) >= $unsigned(wire142[(1'h1):(1'h0)]))});
              reg165 <= $signed(((wire148[(4'hd):(4'hd)] ?
                      $signed(wire145) : $unsigned((8'hbc))) ?
                  $unsigned((((8'ha7) ? reg158 : reg150) >>> {reg162,
                      wire144})) : (!(reg157[(4'hc):(3'h7)] ?
                      (wire149 ? reg151 : reg161) : (reg158 ?
                          reg156 : wire142)))));
              reg166 <= reg165;
            end
          else
            begin
              reg162 <= (reg152 ?
                  reg154 : $unsigned({$signed((reg158 ? reg165 : reg165)),
                      ((wire147 <<< (8'h9d)) * ((8'hbf) << (8'hb7)))}));
              reg163 <= ({(reg153 + $signed($signed(reg152))),
                      {(((8'ha0) ~^ (7'h42)) >>> (~|reg160)),
                          $unsigned((~&(8'hb9)))}} ?
                  $unsigned($unsigned((&{reg157}))) : (8'hb3));
            end
          if ($unsigned(wire147[(2'h3):(2'h3)]))
            begin
              reg167 <= $signed((wire145[(3'h6):(2'h2)] ^~ $unsigned(($signed(wire149) != (wire141 ?
                  wire145 : reg154)))));
              reg168 <= reg165[(3'h4):(2'h3)];
              reg169 <= (~|$signed((|wire142)));
              reg170 <= (~^((wire142[(2'h2):(1'h0)] || ((wire148 - reg154) ?
                      {wire148} : $signed(wire141))) ?
                  $unsigned((~^$unsigned(reg161))) : $signed(reg154)));
            end
          else
            begin
              reg167 <= (8'hb3);
              reg168 <= {((((^wire146) || (reg165 != reg165)) * ($signed((8'hb0)) ?
                      (wire149 ^ wire149) : $signed(reg164))) < wire147),
                  (~^($unsigned((reg158 ? reg163 : reg154)) ?
                      {$signed(reg158)} : (reg151 * (reg153 == reg168))))};
              reg169 <= (^~(&reg161[(4'ha):(4'h8)]));
              reg170 <= $unsigned(({(^~reg169[(1'h1):(1'h1)]),
                  ((-reg157) ?
                      $unsigned(reg161) : reg158[(3'h6):(1'h0)])} - $signed($signed((reg156 ?
                  wire147 : wire146)))));
            end
          reg171 <= $signed(reg160[(3'h4):(2'h3)]);
          reg172 <= (({reg158[(4'hd):(4'h8)],
                  reg164[(2'h2):(2'h2)]} ^~ reg158[(2'h2):(1'h1)]) ?
              $unsigned({(&wire144[(4'h8):(1'h1)]), (^wire144)}) : wire148);
        end
      else
        begin
          reg161 <= $signed({({$unsigned(reg157)} ?
                  {$signed(reg154)} : $unsigned({reg155}))});
          reg162 <= (($signed((~|wire142[(2'h2):(1'h1)])) < $unsigned((+(-reg171)))) - ((+(-$signed(reg156))) ?
              reg157 : (8'ha1)));
          reg163 <= ($unsigned((&reg170[(1'h1):(1'h0)])) != $unsigned((~$signed((reg157 ?
              reg169 : wire143)))));
          reg164 <= $signed(wire141);
        end
    end
  assign wire173 = ((wire147[(3'h6):(3'h6)] ?
                       (&wire142) : ($signed(reg154[(2'h3):(1'h0)]) ?
                           (((8'ha5) ? (8'h9d) : wire143) ?
                               reg155[(5'h11):(4'hc)] : {reg159,
                                   (8'haa)}) : reg168[(1'h1):(1'h1)])) == ($signed({(reg157 > reg172)}) < (((reg154 <<< reg168) ?
                       reg170 : (~reg157)) ^~ (reg156 ^~ $unsigned((8'ha1))))));
  always
    @(posedge clk) begin
      reg174 <= $signed(($signed({reg166}) ?
          (|(-$signed(wire143))) : (((+reg161) || wire141) ^ {$unsigned(reg171),
              $signed(reg172)})));
      reg175 <= reg152;
      reg176 <= {reg165[(2'h3):(1'h1)],
          {(reg155[(3'h6):(3'h5)] ?
                  reg172[(2'h3):(2'h3)] : $unsigned(reg171[(2'h3):(1'h0)]))}};
      reg177 <= (~&{(8'ha2)});
      reg178 <= (reg154[(2'h2):(1'h1)] ?
          (~&$signed(($unsigned((8'ha6)) ?
              $unsigned(reg169) : wire173[(2'h2):(2'h2)]))) : wire149);
    end
  assign wire179 = $signed({reg151});
  always
    @(posedge clk) begin
      if ((8'ha7))
        begin
          if ((({(reg176 ? {(8'hb5), reg157} : $signed(reg178)),
                  ((^~(8'ha4)) ?
                      (reg155 ?
                          reg150 : reg157) : $unsigned(reg171))} >= (($unsigned((7'h43)) ?
                  $unsigned(reg169) : $signed(wire144)) & (^(reg168 >> wire148)))) ?
              reg169 : (~|reg161)))
            begin
              reg180 <= $unsigned({$signed((reg175 == reg175)),
                  (~|$unsigned($signed(wire149)))});
              reg181 <= wire143;
              reg182 <= (~$unsigned(reg175[(1'h1):(1'h0)]));
              reg183 <= (^~$unsigned($unsigned((reg163 ?
                  $unsigned((8'ha4)) : $unsigned(wire141)))));
            end
          else
            begin
              reg180 <= wire147;
              reg181 <= $signed($signed($signed((~^(|wire143)))));
              reg182 <= (-reg177[(4'ha):(4'ha)]);
              reg183 <= (^($unsigned($unsigned($signed(reg156))) ?
                  $signed($unsigned(((8'ha6) ?
                      reg183 : (8'ha7)))) : {$signed($signed((8'h9f)))}));
            end
          reg184 <= (~&$unsigned(($unsigned($signed(wire142)) << $unsigned((reg178 ?
              (8'haf) : reg155)))));
          reg185 <= (reg160[(4'ha):(4'ha)] <<< $signed(reg163));
          reg186 <= reg181;
          reg187 <= reg157[(2'h3):(2'h2)];
        end
      else
        begin
          if ((!(&((-(reg167 ? reg153 : reg152)) >>> $unsigned((-(8'hb6)))))))
            begin
              reg180 <= (wire173[(2'h2):(1'h0)] ?
                  {(reg157[(3'h6):(3'h5)] == wire147)} : reg172[(2'h2):(2'h2)]);
              reg181 <= (8'haa);
            end
          else
            begin
              reg180 <= reg175[(2'h2):(1'h0)];
              reg181 <= (8'hba);
              reg182 <= ({reg163, reg177[(3'h6):(1'h1)]} || $signed(reg162));
            end
          if (reg186[(1'h1):(1'h0)])
            begin
              reg183 <= $signed(($unsigned(reg165) ?
                  reg161[(4'hc):(1'h1)] : reg185[(2'h3):(1'h0)]));
              reg184 <= ((~&((reg167[(5'h10):(4'h8)] * reg183) ?
                      (~&$unsigned(reg161)) : reg172)) ?
                  $unsigned(reg177) : reg181[(3'h5):(2'h2)]);
              reg185 <= (8'ha6);
              reg186 <= reg183[(2'h2):(1'h1)];
              reg187 <= reg175[(3'h4):(2'h2)];
            end
          else
            begin
              reg183 <= (((reg162 ?
                          reg171[(2'h3):(1'h1)] : reg160[(3'h6):(1'h0)]) ?
                      reg161 : $signed({$signed(reg186)})) ?
                  ($unsigned(wire179[(4'h8):(3'h4)]) ?
                      $unsigned((&(reg167 ?
                          wire149 : reg171))) : $signed(((^(8'h9e)) != $unsigned((8'ha6))))) : reg160);
            end
          reg188 <= reg153[(3'h4):(1'h1)];
          if ((({$signed(((7'h44) ^ reg170)),
                  ((|reg183) - (reg153 ? wire142 : reg175))} - (~&(~&reg175))) ?
              $signed(((~|$signed(reg175)) | (|(reg166 <<< reg156)))) : $unsigned((~&(-{reg184,
                  wire147})))))
            begin
              reg189 <= reg175[(3'h4):(1'h1)];
              reg190 <= $signed($unsigned((^reg169)));
            end
          else
            begin
              reg189 <= (~|$unsigned(reg169));
              reg190 <= $signed((reg167 >>> $signed((^~(reg150 ?
                  reg175 : reg181)))));
              reg191 <= {{wire173, $unsigned(((8'hb5) <<< wire145))},
                  (^reg175[(2'h3):(1'h1)])};
            end
        end
      reg192 <= ($unsigned((reg166[(4'hc):(3'h5)] < $unsigned({wire179}))) == (^~{((-reg170) ?
              reg186[(4'hd):(2'h2)] : (wire149 ^ reg163))}));
    end
endmodule

module module61
#(parameter param106 = ((((^((8'h9d) | (8'haa))) ? (((8'ha9) ? (8'hb9) : (8'hac)) ? (~(8'ha5)) : ((8'h9c) ^ (8'haa))) : {((8'hb8) ~^ (8'ha5))}) ^ ((!(8'hb0)) ? (((8'hb6) ? (8'hbd) : (8'ha7)) ^~ (8'h9f)) : {(^(8'h9d))})) & (((~(&(8'ha4))) ? ((^(8'hbd)) >> (-(8'ha4))) : ((+(8'hac)) ? (8'hae) : ((8'hac) - (8'ha5)))) ? ((|(~^(8'h9e))) ^~ (&(~^(8'h9c)))) : {(((8'haa) ? (8'hb6) : (8'ha1)) << {(7'h43), (8'hbb)})})))
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h1cb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire65;
  input wire [(5'h13):(1'h0)] wire64;
  input wire signed [(5'h12):(1'h0)] wire63;
  input wire signed [(5'h13):(1'h0)] wire62;
  wire signed [(4'hf):(1'h0)] wire105;
  wire [(5'h10):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire103;
  wire [(4'he):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire101;
  wire signed [(4'hd):(1'h0)] wire100;
  wire [(2'h3):(1'h0)] wire95;
  wire signed [(3'h6):(1'h0)] wire90;
  wire signed [(5'h15):(1'h0)] wire89;
  wire [(5'h11):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire67;
  wire signed [(3'h6):(1'h0)] wire66;
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg97 = (1'h0);
  reg [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg93 = (1'h0);
  reg [(4'hf):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(4'h9):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(3'h4):(1'h0)] reg84 = (1'h0);
  reg [(4'h8):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(3'h6):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg77 = (1'h0);
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire95,
                 wire90,
                 wire89,
                 wire88,
                 wire67,
                 wire66,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
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
                 (1'h0)};
  assign wire66 = wire65[(3'h7):(3'h6)];
  assign wire67 = $unsigned(wire65);
  always
    @(posedge clk) begin
      reg68 <= (|wire64);
      if (wire64)
        begin
          if ((~^{((|$unsigned(reg68)) ? $signed(wire67) : $signed(wire67)),
              ($signed($unsigned(wire66)) > {(~(8'h9c)),
                  (wire65 ? (7'h40) : wire63)})}))
            begin
              reg69 <= {wire63};
            end
          else
            begin
              reg69 <= (~&$signed(($unsigned($signed(wire67)) ?
                  $unsigned(wire63) : wire64[(5'h11):(5'h11)])));
              reg70 <= (reg69[(2'h2):(1'h0)] | $unsigned(($signed((wire63 || reg69)) ?
                  $signed($signed(wire63)) : ((^~(8'hbb)) ?
                      (reg69 ? wire66 : reg68) : $signed(wire63)))));
              reg71 <= $unsigned($unsigned(wire67));
              reg72 <= (reg71 ?
                  (($unsigned((|wire64)) >>> $unsigned((wire66 ?
                      wire64 : wire64))) + wire64) : (((reg68 ?
                          wire62[(4'hc):(4'hc)] : (wire67 ?
                              reg71 : wire64)) < reg70) ?
                      reg70[(1'h0):(1'h0)] : (reg70[(3'h5):(1'h0)] ?
                          ($signed(wire64) != {wire65}) : (+wire65))));
            end
          reg73 <= $signed((reg71 - wire63[(1'h1):(1'h1)]));
          reg74 <= (((+((wire63 ^~ wire65) ?
                  wire67 : (reg73 <= reg68))) | reg70) ?
              wire64 : wire67[(1'h1):(1'h1)]);
          reg75 <= reg69;
          if ({$unsigned({$signed({wire64, reg72}), (!(!wire65))}),
              $signed((($signed(wire63) <<< (wire66 ? reg68 : reg71)) ?
                  wire65[(4'hb):(3'h7)] : (8'ha1)))})
            begin
              reg76 <= $unsigned(wire66);
              reg77 <= $unsigned((($unsigned({(8'hb0)}) >> reg73[(2'h2):(1'h1)]) ?
                  reg73 : reg76));
              reg78 <= $signed({(~|(reg69 ?
                      (reg71 ? wire63 : wire67) : $signed(reg72)))});
            end
          else
            begin
              reg76 <= {(+$signed(reg77)), reg70[(2'h2):(1'h0)]};
              reg77 <= reg70;
            end
        end
      else
        begin
          if ($unsigned($signed($unsigned(wire63))))
            begin
              reg69 <= reg75;
              reg70 <= {(wire63[(4'hd):(4'hd)] > (~|$unsigned({wire64}))),
                  {reg77}};
              reg71 <= ((^~{reg77[(3'h6):(2'h3)], reg72[(2'h2):(1'h1)]}) ?
                  ($unsigned($unsigned($unsigned(wire66))) ?
                      (reg73 >> (!$unsigned((8'ha4)))) : $unsigned({(reg73 ?
                              reg75 : (8'ha6))})) : ($signed(reg72[(3'h4):(1'h0)]) ?
                      (8'hbb) : {wire67,
                          ($signed(reg71) ?
                              reg76[(4'ha):(1'h1)] : $signed(reg68))}));
              reg72 <= (8'hac);
              reg73 <= reg68;
            end
          else
            begin
              reg69 <= ((8'hb6) ? (|wire65) : $signed(reg68[(1'h1):(1'h1)]));
              reg70 <= $signed($signed(((-(!reg78)) >= {(reg74 ?
                      wire67 : reg68),
                  wire64[(4'hd):(4'h8)]})));
              reg71 <= ((wire64[(4'hb):(3'h5)] >>> $unsigned((((8'hac) >> (8'hbb)) ?
                      (+reg77) : (^~reg71)))) ?
                  reg72 : ($unsigned($signed(reg69[(3'h4):(2'h2)])) < (reg68 ?
                      ($unsigned(reg77) ?
                          reg74 : (8'ha5)) : $unsigned(reg77))));
              reg72 <= (reg68 ?
                  {($signed((reg77 ? wire63 : wire67)) ?
                          ((^(8'hbf)) ~^ wire64[(5'h10):(2'h2)]) : ({reg74} - {reg78,
                              reg78})),
                      reg76} : $unsigned($unsigned(($unsigned(reg77) == $unsigned(reg73)))));
              reg73 <= $signed(wire66[(2'h2):(1'h1)]);
            end
          reg74 <= (^~reg73);
          reg75 <= {$signed(($signed($signed(wire63)) ?
                  (+((8'hbc) ? (8'ha1) : reg68)) : $unsigned(reg75)))};
          if (reg74[(2'h2):(1'h1)])
            begin
              reg76 <= ((~^(reg71[(1'h1):(1'h0)] + {(8'hab)})) > $unsigned(wire64));
              reg77 <= reg78[(4'hd):(1'h1)];
              reg78 <= {$signed(wire62[(5'h13):(5'h12)]), reg78};
              reg79 <= wire67[(4'hc):(1'h1)];
            end
          else
            begin
              reg76 <= $unsigned((~&$signed(($signed(wire63) ?
                  reg79[(2'h2):(1'h1)] : $unsigned(reg75)))));
            end
          if ($signed($unsigned(wire65)))
            begin
              reg80 <= ($signed($unsigned({$signed((8'hbf))})) ?
                  {(((reg70 && reg75) ?
                          (wire67 ?
                              (7'h43) : (7'h43)) : (reg78 * reg70)) - {reg79,
                          $signed(reg73)}),
                      (reg73 - wire63[(4'ha):(4'ha)])} : (reg76[(4'ha):(4'h9)] >>> $unsigned(($unsigned(reg73) ?
                      ((8'hb5) ? reg72 : reg79) : $unsigned(wire63)))));
            end
          else
            begin
              reg80 <= {($signed(reg76[(4'hb):(3'h5)]) ?
                      (&(~|(reg73 ?
                          reg79 : reg76))) : ((~&(^~reg70)) ^ ((wire63 ?
                          (7'h44) : wire66) | (7'h40)))),
                  wire63};
            end
        end
      if (($signed(reg73) ?
          $unsigned($unsigned((|(wire67 && reg69)))) : ($unsigned($signed($signed(reg76))) | ((&reg68[(1'h1):(1'h0)]) ?
              $unsigned($signed(wire64)) : $unsigned((&(8'hb7)))))))
        begin
          if (((~&((reg74[(2'h3):(2'h3)] - (reg78 >> (8'ha9))) ?
                  {((8'hbb) ? reg75 : reg73)} : reg78)) ?
              $signed({((wire66 & reg80) ? reg73[(4'h9):(4'h9)] : {wire66}),
                  $signed($unsigned(reg68))}) : (~&reg70)))
            begin
              reg81 <= {$signed(wire62),
                  $signed($unsigned(reg76[(4'h8):(3'h4)]))};
              reg82 <= {reg81};
              reg83 <= $signed((^~(^~(~|(reg74 ? (8'hae) : reg69)))));
              reg84 <= reg79;
              reg85 <= {(($signed(reg76[(3'h7):(3'h4)]) >= (8'hb5)) > reg75),
                  $unsigned($unsigned((reg76[(2'h2):(1'h1)] > wire64)))};
            end
          else
            begin
              reg81 <= $signed($signed(reg80));
              reg82 <= (((~|(|{reg77})) < $unsigned($unsigned(reg75))) * $unsigned((reg77 ?
                  wire66[(3'h4):(1'h0)] : $unsigned(reg76))));
              reg83 <= reg77;
              reg84 <= $signed({reg81});
            end
        end
      else
        begin
          reg81 <= (!$unsigned({reg77, reg76[(4'hb):(2'h2)]}));
          reg82 <= wire66[(2'h3):(2'h3)];
          reg83 <= (|$unsigned({reg81}));
        end
      reg86 <= ((reg76 ?
              $signed(((reg71 ?
                  wire63 : reg70) ~^ (reg79 ~^ wire63))) : (wire65 ?
                  wire67[(4'hb):(3'h7)] : ($signed(reg77) ?
                      $signed((7'h40)) : $unsigned(reg74)))) ?
          reg79 : {(^wire67[(3'h4):(1'h0)]), reg73});
      reg87 <= $unsigned({{$unsigned((|reg77))}});
    end
  assign wire88 = reg77;
  assign wire89 = wire62[(4'hb):(4'h9)];
  assign wire90 = ((reg78[(4'he):(1'h1)] != $signed($signed($unsigned(wire65)))) <<< wire67);
  always
    @(posedge clk) begin
      reg91 <= {$signed(wire89[(3'h4):(2'h2)]),
          $unsigned($unsigned(reg78[(5'h12):(1'h1)]))};
      reg92 <= $unsigned((reg71 ?
          ({(reg74 > reg80)} ? reg72 : wire67) : wire66[(3'h4):(3'h4)]));
      reg93 <= (8'ha8);
      reg94 <= ((reg74[(2'h3):(1'h0)] & $signed((~^$unsigned(reg81)))) || ((((wire64 ?
              (8'ha7) : reg74) ?
          (&wire89) : (wire66 ? wire66 : reg82)) - $signed((reg93 ?
          reg84 : (8'ha2)))) || (&((wire65 ? reg81 : reg68) ^ (^~reg77)))));
    end
  assign wire95 = $unsigned(wire88);
  always
    @(posedge clk) begin
      reg96 <= reg85;
      reg97 <= {$signed(wire67), (^$signed(reg92))};
      reg98 <= reg83;
      reg99 <= (^~reg69[(1'h1):(1'h1)]);
    end
  assign wire100 = {$unsigned(wire66),
                       $signed((($unsigned(reg82) <= (wire63 <<< (8'hba))) ?
                           (~|$unsigned(reg83)) : (~$unsigned(reg80))))};
  assign wire101 = (!reg86);
  assign wire102 = (~&$unsigned({($signed(reg85) != (reg75 ?
                           (8'hb2) : wire100))}));
  assign wire103 = $unsigned({$signed((~&$signed(reg99))),
                       {(~|$signed(wire88))}});
  assign wire104 = $unsigned(((reg92[(4'hd):(3'h6)] ?
                           ((^wire102) ? {reg86, wire63} : (-reg99)) : (reg70 ?
                               (^~reg69) : reg80)) ?
                       wire89[(2'h3):(1'h0)] : wire62));
  assign wire105 = reg79;
endmodule

module module16
#(parameter param54 = (+(((((8'hb4) >> (8'hb8)) & ((8'hb8) ? (8'hbb) : (7'h41))) ? (-{(8'hb3), (8'ha3)}) : ((~(7'h43)) - ((8'ha4) ? (8'hba) : (8'hb7)))) + ((~|(!(7'h42))) * ((-(8'hb7)) >= {(8'hae), (8'haf)})))), 
parameter param55 = (+param54))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire21;
  input wire signed [(5'h13):(1'h0)] wire20;
  input wire [(5'h12):(1'h0)] wire19;
  input wire [(4'hf):(1'h0)] wire18;
  input wire [(5'h10):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  wire signed [(2'h2):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire22;
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire43,
                 wire42,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire23,
                 wire22,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
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
  assign wire22 = wire20[(3'h6):(2'h3)];
  assign wire23 = (wire17 ^~ $signed({$signed({wire22, wire21}),
                      ((wire20 < wire17) ? wire17 : (wire17 >= wire20))}));
  always
    @(posedge clk) begin
      if (wire22[(5'h11):(5'h11)])
        begin
          reg24 <= (wire19[(3'h6):(3'h6)] <= wire21[(4'h9):(4'h9)]);
        end
      else
        begin
          reg24 <= (8'h9d);
          reg25 <= $signed(($unsigned(((&wire20) ?
                  $unsigned((8'ha6)) : wire19)) ?
              {($signed(wire21) ?
                      wire17 : {wire17, wire23})} : {$signed((reg24 ?
                      (8'hb2) : wire22)),
                  $unsigned(wire22)}));
          reg26 <= ((reg25 ?
              $signed(wire17) : reg25[(4'hc):(3'h4)]) > (^(reg24 ?
              $signed((^~reg24)) : {reg25})));
          reg27 <= reg25[(4'hc):(2'h2)];
          reg28 <= wire18[(3'h5):(2'h2)];
        end
      reg29 <= $signed($signed($unsigned((reg26 >= ((8'hab) >= wire21)))));
      reg30 <= ($signed(reg28) >>> (^(8'hb2)));
      reg31 <= ((&{$unsigned(wire19[(1'h0):(1'h0)]),
          wire23[(2'h2):(2'h2)]}) << {$unsigned((&$signed(reg25))),
          wire17[(4'hf):(3'h4)]});
      reg32 <= {reg29};
    end
  assign wire33 = (8'hb9);
  assign wire34 = wire17[(3'h5):(2'h3)];
  assign wire35 = wire21[(2'h3):(2'h3)];
  assign wire36 = $unsigned(wire19);
  always
    @(posedge clk) begin
      reg37 <= $signed($signed((-$unsigned($unsigned(reg27)))));
      reg38 <= wire20[(3'h6):(2'h2)];
      reg39 <= wire17[(4'ha):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg40 <= {wire20[(2'h2):(2'h2)],
          (wire22[(4'hb):(3'h5)] && (reg27 ?
              reg30[(2'h2):(2'h2)] : $signed($signed(reg29))))};
      reg41 <= (~&$signed(($unsigned(reg26) > (~|$signed(wire17)))));
    end
  assign wire42 = (reg31 ^~ wire22[(4'h9):(4'h8)]);
  assign wire43 = {({(-reg24), {$unsigned(reg29)}} & ({{reg40, reg40}, wire19} ?
                          reg39[(3'h5):(3'h5)] : $signed(wire20))),
                      $signed({(~&(reg38 | wire21)),
                          ((reg30 != wire20) ?
                              $signed(reg31) : (wire18 ~^ (8'ha6)))})};
  always
    @(posedge clk) begin
      reg44 <= reg30[(3'h4):(2'h2)];
      if ({(reg41 ?
              $unsigned((!(^~(7'h42)))) : (reg27[(3'h5):(3'h5)] ?
                  (wire19[(5'h10):(4'h8)] <<< reg26) : reg41))})
        begin
          reg45 <= wire35[(4'hb):(4'h9)];
          reg46 <= (wire22 | reg28[(2'h2):(2'h2)]);
        end
      else
        begin
          reg45 <= (|(8'hae));
          reg46 <= wire42;
        end
      reg47 <= (((~reg24) ^~ $signed((reg39[(2'h3):(2'h2)] ?
          (^reg27) : $unsigned(reg38)))) ^ (wire18[(3'h6):(1'h1)] ?
          wire34[(2'h2):(1'h1)] : {{(wire33 ? wire42 : reg31)}}));
      reg48 <= reg30;
      reg49 <= reg45;
    end
  assign wire50 = ((~|reg26[(1'h1):(1'h0)]) ?
                      (wire20 >= reg28[(1'h0):(1'h0)]) : wire35);
  assign wire51 = $unsigned((~wire17[(4'hd):(4'ha)]));
  assign wire52 = (!($unsigned((+$signed(reg37))) >= $signed($unsigned(((8'ha1) ~^ reg49)))));
  assign wire53 = wire22;
endmodule
