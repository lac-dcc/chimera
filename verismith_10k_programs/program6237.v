module top
#(parameter param197 = (-(^((^~(&(8'h9f))) ^ {(~&(8'hb6)), ((7'h42) <<< (8'hac))}))), 
parameter param198 = param197)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire196;
  wire [(3'h6):(1'h0)] wire195;
  wire [(5'h12):(1'h0)] wire194;
  wire [(4'hb):(1'h0)] wire193;
  wire signed [(4'h9):(1'h0)] wire192;
  wire [(5'h14):(1'h0)] wire191;
  wire [(4'hb):(1'h0)] wire190;
  wire [(5'h13):(1'h0)] wire187;
  wire signed [(2'h2):(1'h0)] wire186;
  wire [(4'hb):(1'h0)] wire185;
  wire [(4'h9):(1'h0)] wire184;
  wire signed [(4'hf):(1'h0)] wire183;
  wire [(4'h9):(1'h0)] wire182;
  wire [(3'h5):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire180;
  reg [(3'h5):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg188 = (1'h0);
  assign y = {wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire4,
                 wire5,
                 wire180,
                 reg189,
                 reg188,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = ((({(wire3 ^~ wire1), $unsigned(wire1)} ?
                     $signed((wire3 ? wire0 : wire4)) : ((wire2 <= wire2) ?
                         $unsigned(wire2) : (~&(8'h9f)))) >> wire3) ~^ wire1);
  module6 #() modinst181 (wire180, clk, wire1, wire0, wire3, wire2, wire5);
  assign wire182 = $signed({$unsigned(wire2)});
  assign wire183 = wire1[(2'h3):(2'h2)];
  assign wire184 = (~^wire3[(5'h10):(3'h7)]);
  assign wire185 = (&(wire183[(2'h3):(2'h3)] & $signed(((|wire180) != (8'hb9)))));
  assign wire186 = wire3;
  assign wire187 = $signed({$unsigned((^$signed(wire4))), $unsigned(wire2)});
  always
    @(posedge clk) begin
      reg188 <= $signed($unsigned((&$unsigned(wire184[(2'h3):(1'h1)]))));
      reg189 <= {(~^wire0), $signed((8'haa))};
    end
  assign wire190 = $unsigned((({$signed(wire186)} ?
                           wire183[(2'h2):(1'h1)] : ($signed(wire4) <= {reg188,
                               wire4})) ?
                       {reg189[(2'h2):(1'h1)],
                           ($unsigned(wire187) * {wire3})} : ($signed(((8'hb1) >= wire5)) <= wire4[(1'h1):(1'h1)])));
  assign wire191 = wire3;
  assign wire192 = (^~{$signed(wire191[(5'h13):(4'hd)]),
                       $unsigned(($unsigned(reg188) ?
                           wire2 : wire185[(2'h3):(2'h2)]))});
  assign wire193 = (reg188[(4'hc):(1'h0)] ?
                       wire187[(5'h12):(4'hf)] : {(8'hb9)});
  assign wire194 = $signed(wire4[(1'h0):(1'h0)]);
  assign wire195 = (+{$unsigned((wire183 ? (|(8'hbd)) : wire182)),
                       $signed($signed((reg189 ? (8'hbe) : wire185)))});
  assign wire196 = wire182[(3'h6):(3'h4)];
endmodule

module module6
#(parameter param178 = (~&(8'hb6)), 
parameter param179 = (7'h42))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire signed [(4'hc):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire177;
  wire [(4'hc):(1'h0)] wire175;
  wire [(4'hf):(1'h0)] wire148;
  wire [(4'hc):(1'h0)] wire146;
  wire [(5'h15):(1'h0)] wire101;
  wire signed [(4'hd):(1'h0)] wire92;
  wire [(5'h15):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire41;
  wire [(4'hf):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire69;
  wire [(5'h12):(1'h0)] wire90;
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg100 = (1'h0);
  assign y = {wire177,
                 wire175,
                 wire148,
                 wire146,
                 wire101,
                 wire92,
                 wire66,
                 wire41,
                 wire39,
                 wire12,
                 wire68,
                 wire69,
                 wire90,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 (1'h0)};
  assign wire12 = (8'ha5);
  module13 #() modinst40 (.y(wire39), .wire14(wire10), .wire17(wire7), .wire15(wire9), .clk(clk), .wire16(wire8));
  assign wire41 = wire10;
  module42 #() modinst67 (.wire46(wire41), .wire47(wire8), .wire44(wire10), .clk(clk), .y(wire66), .wire45(wire9), .wire43(wire7));
  assign wire68 = $unsigned(($signed($signed($unsigned((8'ha9)))) ?
                      wire66[(4'hb):(4'h9)] : {$signed(wire12[(2'h3):(2'h3)]),
                          $signed(((8'ha9) != wire8))}));
  assign wire69 = wire8;
  module70 #() modinst91 (.wire72(wire68), .wire73(wire66), .wire74(wire11), .wire75(wire7), .wire71(wire39), .y(wire90), .clk(clk));
  assign wire92 = wire11;
  always
    @(posedge clk) begin
      reg93 <= wire8;
      reg94 <= {(^~wire92[(1'h1):(1'h0)])};
      if ($unsigned(wire10[(2'h2):(1'h1)]))
        begin
          reg95 <= $signed($unsigned(wire69[(3'h7):(2'h2)]));
          reg96 <= (^~(8'hbb));
          reg97 <= reg93[(2'h2):(2'h2)];
          reg98 <= (!$signed(reg97[(3'h4):(3'h4)]));
          reg99 <= wire69;
        end
      else
        begin
          reg95 <= (($signed(wire9) & ((8'hb5) >= {(-(8'ha3))})) >= wire66[(4'hd):(3'h4)]);
        end
      reg100 <= wire9;
    end
  assign wire101 = reg95;
  module102 #() modinst147 (wire146, clk, reg94, wire8, wire92, reg97);
  assign wire148 = {((wire39[(4'ha):(2'h3)] >>> (~|(~wire68))) || {$unsigned(wire90[(4'hd):(3'h7)])})};
  module149 #() modinst176 (.wire150(reg94), .wire154(wire8), .clk(clk), .wire152(wire148), .wire151(reg99), .y(wire175), .wire153(reg98));
  assign wire177 = ((^~{(wire68 ? reg95[(5'h11):(4'ha)] : wire66),
                       $signed(reg95[(1'h1):(1'h0)])}) <<< ($unsigned($signed((|(8'ha6)))) && (reg94[(3'h7):(2'h3)] ?
                       $unsigned((wire175 ? wire92 : reg96)) : wire8)));
endmodule

module module149
#(parameter param174 = (-(((~&((7'h44) ? (7'h41) : (8'hba))) ? (+((8'ha5) ? (8'hab) : (8'ha9))) : ((|(8'hb5)) < (~(8'ha8)))) ? (((^(8'hb6)) ? (^~(8'h9e)) : {(8'haa), (7'h44)}) >= ({(7'h40)} || ((8'hbf) ? (8'hbb) : (8'hb5)))) : {(~&((8'ha2) ? (8'hbe) : (8'hb1))), (((8'h9f) ~^ (8'ha0)) > ((7'h44) ? (8'h9d) : (8'h9c)))})))
(y, clk, wire154, wire153, wire152, wire151, wire150);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire154;
  input wire [(5'h11):(1'h0)] wire153;
  input wire signed [(4'he):(1'h0)] wire152;
  input wire signed [(3'h7):(1'h0)] wire151;
  input wire [(4'hc):(1'h0)] wire150;
  wire signed [(4'ha):(1'h0)] wire173;
  wire [(4'he):(1'h0)] wire172;
  wire signed [(4'ha):(1'h0)] wire171;
  wire [(4'h8):(1'h0)] wire170;
  wire signed [(5'h11):(1'h0)] wire169;
  wire signed [(5'h15):(1'h0)] wire167;
  wire [(4'he):(1'h0)] wire166;
  wire signed [(2'h3):(1'h0)] wire165;
  wire [(4'h8):(1'h0)] wire164;
  wire signed [(4'h8):(1'h0)] wire163;
  wire signed [(4'hf):(1'h0)] wire162;
  wire [(5'h14):(1'h0)] wire161;
  wire [(5'h12):(1'h0)] wire160;
  wire signed [(3'h6):(1'h0)] wire159;
  wire [(4'h9):(1'h0)] wire158;
  wire signed [(4'hc):(1'h0)] wire156;
  wire signed [(4'h9):(1'h0)] wire155;
  reg [(5'h15):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg157 = (1'h0);
  assign y = {wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire156,
                 wire155,
                 reg168,
                 reg157,
                 (1'h0)};
  assign wire155 = $signed($unsigned((~^(~|{wire154, wire150}))));
  assign wire156 = {wire154[(2'h2):(1'h0)], wire152[(4'hb):(1'h0)]};
  always
    @(posedge clk) begin
      reg157 <= $signed(wire152[(3'h5):(1'h0)]);
    end
  assign wire158 = reg157;
  assign wire159 = wire153;
  assign wire160 = ($unsigned(((&wire158[(3'h7):(3'h7)]) ?
                       wire151 : wire156[(3'h6):(3'h5)])) - $unsigned(reg157[(2'h3):(1'h0)]));
  assign wire161 = (~^$unsigned((((wire154 ? wire158 : wire153) ?
                       (wire156 ~^ wire159) : (wire153 ?
                           wire153 : wire153)) - wire159[(3'h6):(3'h6)])));
  assign wire162 = ($unsigned(($unsigned(wire151[(1'h1):(1'h0)]) > $signed(wire159))) ?
                       wire156[(4'ha):(1'h0)] : $signed((|($unsigned(wire154) <<< $signed(wire160)))));
  assign wire163 = ((~(!$unsigned(wire152))) ?
                       wire153 : $signed($unsigned($unsigned($unsigned(wire162)))));
  assign wire164 = wire152;
  assign wire165 = $signed($signed(wire164[(1'h1):(1'h1)]));
  assign wire166 = (+(^~$unsigned(wire151[(3'h5):(3'h4)])));
  assign wire167 = $unsigned((|wire150[(3'h6):(2'h3)]));
  always
    @(posedge clk) begin
      reg168 <= ((!$signed($signed(wire164))) > wire151);
    end
  assign wire169 = wire166[(4'he):(4'h8)];
  assign wire170 = $unsigned((^$unsigned($signed($unsigned(wire162)))));
  assign wire171 = wire167[(4'h9):(3'h7)];
  assign wire172 = (({wire169[(2'h3):(2'h3)]} ?
                       $signed($signed((^wire165))) : (wire165[(2'h3):(1'h1)] >= ($unsigned(wire171) > {wire159,
                           wire159}))) >>> ((|$unsigned(wire169)) ~^ (&$unsigned($unsigned(wire158)))));
  assign wire173 = wire159;
endmodule

module module102  (y, clk, wire106, wire105, wire104, wire103);
  output wire [(32'h1c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire106;
  input wire [(4'hb):(1'h0)] wire105;
  input wire signed [(2'h2):(1'h0)] wire104;
  input wire signed [(5'h13):(1'h0)] wire103;
  wire [(3'h5):(1'h0)] wire145;
  wire [(3'h6):(1'h0)] wire143;
  wire [(5'h13):(1'h0)] wire142;
  wire signed [(4'ha):(1'h0)] wire131;
  wire [(3'h6):(1'h0)] wire130;
  wire [(2'h3):(1'h0)] wire129;
  wire [(4'ha):(1'h0)] wire128;
  wire signed [(4'hb):(1'h0)] wire127;
  wire signed [(4'hc):(1'h0)] wire126;
  wire [(5'h14):(1'h0)] wire125;
  wire signed [(4'he):(1'h0)] wire110;
  wire [(4'hf):(1'h0)] wire109;
  wire signed [(5'h15):(1'h0)] wire108;
  wire [(3'h5):(1'h0)] wire107;
  reg [(4'h9):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg141 = (1'h0);
  reg [(5'h13):(1'h0)] reg140 = (1'h0);
  reg signed [(4'he):(1'h0)] reg139 = (1'h0);
  reg signed [(4'he):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg136 = (1'h0);
  reg [(3'h5):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg133 = (1'h0);
  reg [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg124 = (1'h0);
  reg signed [(4'he):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg [(3'h5):(1'h0)] reg121 = (1'h0);
  reg [(5'h11):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg118 = (1'h0);
  reg [(4'hb):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(4'ha):(1'h0)] reg113 = (1'h0);
  reg [(5'h14):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg111 = (1'h0);
  assign y = {wire145,
                 wire143,
                 wire142,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 reg144,
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
                 reg111,
                 (1'h0)};
  assign wire107 = $signed(wire104[(2'h2):(2'h2)]);
  assign wire108 = wire103[(4'h9):(3'h4)];
  assign wire109 = (&$signed(wire104[(2'h2):(2'h2)]));
  assign wire110 = $unsigned(wire104);
  always
    @(posedge clk) begin
      if (wire105[(2'h3):(2'h2)])
        begin
          reg111 <= wire105[(4'ha):(1'h1)];
        end
      else
        begin
          if ($signed((~|((~|(wire105 ? reg111 : wire109)) ?
              $signed({(8'h9d)}) : (~^(wire107 ? wire105 : wire104))))))
            begin
              reg111 <= (^~(^~$signed((+(-wire108)))));
              reg112 <= $unsigned((~^$unsigned($signed((wire107 < wire105)))));
            end
          else
            begin
              reg111 <= wire104;
            end
          if ($unsigned((^~$unsigned(reg111[(3'h7):(3'h7)]))))
            begin
              reg113 <= (((reg112[(3'h6):(1'h1)] - wire105[(3'h4):(2'h3)]) ?
                  ({wire108[(3'h5):(1'h1)], wire109} ?
                      ((wire108 && wire104) && {wire109,
                          wire107}) : wire110[(4'h8):(4'h8)]) : (((!reg112) ^ (reg112 - wire103)) != (~|$signed(wire103)))) + $unsigned((^($signed(wire110) >>> reg112[(4'h9):(3'h6)]))));
              reg114 <= $unsigned(wire108[(4'hc):(4'hc)]);
            end
          else
            begin
              reg113 <= (~{(((~|wire106) ? wire110 : (reg114 >> wire108)) ?
                      $unsigned((wire104 <<< reg113)) : reg114[(1'h0):(1'h0)]),
                  wire109});
              reg114 <= reg111[(3'h6):(1'h1)];
              reg115 <= (wire106[(4'he):(4'h8)] << (~{($signed((7'h41)) - {wire108})}));
              reg116 <= ($signed(wire109[(1'h0):(1'h0)]) ^~ ((8'h9c) > ({$unsigned(wire107),
                  ((8'hb3) ? wire107 : wire107)} <<< {(~|wire105)})));
            end
        end
      reg117 <= $unsigned((wire109 ?
          (^~((wire109 > reg111) ?
              (!wire104) : wire105[(2'h3):(2'h2)])) : $unsigned(wire109)));
      reg118 <= ($signed((~&reg117)) + $signed($signed($signed($signed(wire108)))));
      reg119 <= (!reg113[(3'h6):(2'h2)]);
      if ($signed((-(reg116 - ($signed(wire104) >> $signed(reg117))))))
        begin
          reg120 <= wire107;
          reg121 <= $unsigned((~|{(!wire109)}));
        end
      else
        begin
          if ($signed((|($unsigned($signed(wire106)) ?
              $signed($signed((8'hb0))) : {(reg117 ? wire103 : wire108),
                  (~^(8'had))}))))
            begin
              reg120 <= ($unsigned(((wire105[(2'h2):(2'h2)] ?
                      {reg116} : (^~wire105)) ?
                  (((7'h43) ^~ reg119) < (reg116 ?
                      wire103 : wire108)) : $unsigned(wire105[(3'h6):(2'h3)]))) < $signed(reg113[(4'h8):(1'h1)]));
              reg121 <= $unsigned((~^reg117));
            end
          else
            begin
              reg120 <= {$unsigned($unsigned((^reg116))),
                  ((reg111 ^~ wire110) ?
                      (wire106 >= $unsigned(wire108[(5'h13):(4'h8)])) : (wire106[(4'hc):(4'ha)] || (((8'hae) ?
                          reg116 : reg119) >= $unsigned(reg114))))};
              reg121 <= (&$signed(($signed(reg116[(3'h4):(2'h3)]) ^~ ($signed(wire107) << (reg120 - reg115)))));
            end
          reg122 <= $unsigned(($unsigned(reg113[(3'h7):(3'h6)]) ?
              (wire109[(3'h6):(3'h4)] ?
                  $signed($unsigned(wire108)) : wire104) : (^(reg120[(1'h0):(1'h0)] && (8'ha2)))));
          reg123 <= wire104[(1'h1):(1'h1)];
          reg124 <= $unsigned(((($signed(reg119) ~^ reg116[(3'h4):(2'h3)]) == ((reg114 ?
                      (7'h41) : (8'ha9)) ?
                  wire110[(4'h9):(3'h6)] : reg115[(3'h5):(1'h0)])) ?
              ($signed($signed(reg119)) & reg113) : ($unsigned((reg120 - reg114)) << ((~reg114) ?
                  $unsigned(wire108) : {reg113, wire109}))));
        end
    end
  assign wire125 = (8'hbc);
  assign wire126 = reg122[(4'h8):(3'h5)];
  assign wire127 = reg123[(1'h0):(1'h0)];
  assign wire128 = $unsigned({$signed($signed((^wire125)))});
  assign wire129 = (reg117[(3'h5):(1'h0)] ^~ (($unsigned($signed(wire110)) ?
                       $unsigned($signed(reg113)) : $unsigned($signed(wire103))) ^~ ({$unsigned(reg113)} != reg123[(3'h6):(1'h0)])));
  assign wire130 = $unsigned(wire109);
  assign wire131 = reg120;
  always
    @(posedge clk) begin
      reg132 <= $unsigned(wire130[(3'h6):(1'h1)]);
      reg133 <= $unsigned(wire107[(3'h5):(1'h0)]);
      reg134 <= wire127;
      if ((!$unsigned({$signed(reg124), wire129})))
        begin
          reg135 <= (~reg117[(4'ha):(4'h8)]);
        end
      else
        begin
          reg135 <= ({$unsigned($signed((~^wire109))),
              reg120} <= ($signed((+(reg124 == (8'hbf)))) ^~ $unsigned((+(reg119 >> wire110)))));
          if ((&wire128))
            begin
              reg136 <= reg112[(5'h14):(3'h7)];
              reg137 <= $unsigned((reg120 ?
                  $signed(((wire130 ?
                      wire104 : wire107) <= (reg117 & reg133))) : $signed(wire109)));
              reg138 <= $signed(($unsigned(reg136[(3'h6):(2'h2)]) ?
                  (8'hb0) : (~|((wire105 ? (8'h9e) : (8'ha5)) | wire130))));
            end
          else
            begin
              reg136 <= (8'hab);
              reg137 <= (8'hac);
              reg138 <= reg118;
              reg139 <= (-(wire110[(3'h4):(1'h0)] ?
                  (+{{wire125},
                      $signed(wire126)}) : $unsigned($signed(wire130))));
              reg140 <= $unsigned($signed($unsigned($unsigned(reg114[(5'h13):(5'h10)]))));
            end
        end
      reg141 <= {({(~|(~^reg119)),
              $signed((reg114 ? reg117 : reg112))} < {((&reg119) ?
                  (reg118 ^ reg111) : wire104)}),
          ($unsigned(reg140[(2'h2):(1'h1)]) >> ($signed(wire107[(3'h5):(1'h1)]) ?
              $signed($unsigned((8'ha3))) : $signed((reg119 ?
                  reg120 : reg118))))};
    end
  assign wire142 = $signed({$unsigned(((reg114 ?
                           (8'hb0) : reg115) ^ $unsigned((8'ha5)))),
                       $signed({reg119[(3'h5):(3'h5)]})});
  assign wire143 = $unsigned(((~&reg114[(1'h0):(1'h0)]) ?
                       (+(+(8'ha9))) : reg118));
  always
    @(posedge clk) begin
      reg144 <= (((-{((8'hb2) ? wire142 : reg120),
              $signed((7'h40))}) & $signed(reg123[(1'h1):(1'h1)])) ?
          $signed(wire143) : reg115[(2'h3):(2'h2)]);
    end
  assign wire145 = $unsigned({reg112});
endmodule

module module70
#(parameter param89 = {(^~((^~(+(8'h9c))) >= (((8'haa) ? (7'h43) : (8'ha9)) ? (~&(8'hb0)) : ((8'hb7) ? (7'h41) : (8'hb6))))), (^{(^((7'h40) && (8'h9d))), {{(8'hb1), (8'hbe)}}})})
(y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire75;
  input wire signed [(5'h10):(1'h0)] wire74;
  input wire signed [(5'h11):(1'h0)] wire73;
  input wire signed [(4'he):(1'h0)] wire72;
  input wire [(4'hf):(1'h0)] wire71;
  wire [(3'h6):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire86;
  wire signed [(4'hc):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire76;
  reg [(4'hd):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire76,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire76 = wire74;
  always
    @(posedge clk) begin
      reg77 <= wire73[(5'h10):(3'h5)];
      if (((~|(wire74 ~^ $signed(wire71))) ?
          $signed(wire75[(2'h3):(2'h3)]) : wire71))
        begin
          reg78 <= (-(wire71[(1'h0):(1'h0)] >>> $signed(wire76)));
          if ((-((wire73 ^ $unsigned((wire75 ^~ wire74))) ~^ wire73)))
            begin
              reg79 <= reg77[(1'h0):(1'h0)];
              reg80 <= wire71[(4'hc):(4'ha)];
              reg81 <= {(&((wire72[(3'h6):(1'h1)] ?
                      ((8'ha4) ?
                          wire72 : reg80) : (reg77 * wire76)) != (~&reg78[(3'h5):(2'h3)])))};
            end
          else
            begin
              reg79 <= $unsigned($signed(($unsigned({wire75}) != reg80[(1'h0):(1'h0)])));
              reg80 <= {{($signed({wire71}) ?
                          $unsigned($signed(reg81)) : ((wire74 ?
                              reg81 : wire72) || (reg79 ? wire71 : wire73)))},
                  $signed($signed((|(wire73 ~^ wire76))))};
              reg81 <= $unsigned(($signed(reg81) ?
                  (wire76 ~^ ((&(8'h9e)) ?
                      ((8'hb5) ?
                          wire73 : reg78) : $signed(reg81))) : $unsigned((wire73[(4'he):(3'h7)] && (~^reg79)))));
              reg82 <= ($signed((^~((wire73 >> reg77) ? wire72 : {reg79}))) ?
                  ((~&$signed((~^wire72))) ?
                      (-{$signed(reg80)}) : (reg79 > $unsigned({reg81,
                          wire76}))) : ((reg80[(4'hc):(3'h6)] << wire72) ?
                      ($unsigned($unsigned(reg77)) ?
                          ($signed(wire76) ?
                              {wire75,
                                  reg79} : $unsigned(reg79)) : (8'ha5)) : reg80[(3'h7):(1'h0)]));
              reg83 <= {(~|$signed($unsigned(reg82[(2'h3):(1'h1)])))};
            end
          if (({{{$unsigned(wire73)}}} ?
              reg83[(4'hc):(4'h9)] : $signed(($signed((reg77 | (8'haf))) > $signed(wire75)))))
            begin
              reg84 <= (8'hb5);
            end
          else
            begin
              reg84 <= (^({((wire71 ? reg80 : wire76) ?
                          $unsigned(wire75) : {wire75, wire73})} ?
                  wire75 : wire72[(3'h4):(1'h0)]));
            end
        end
      else
        begin
          reg78 <= {{$unsigned($unsigned({wire71, wire76}))}};
          reg79 <= ({(wire76[(1'h0):(1'h0)] ? (^~reg82) : wire73)} | reg82);
        end
    end
  assign wire85 = ($signed((|(^{wire75, reg79}))) ?
                      wire75 : ($signed($unsigned({reg77, (8'ha3)})) ?
                          (((reg81 >>> wire74) ?
                              (8'ha7) : (~|reg80)) - (7'h40)) : reg77[(1'h1):(1'h0)]));
  assign wire86 = ((8'hb1) <= $signed(({(8'had),
                      $unsigned(wire74)} | $unsigned($signed(reg79)))));
  assign wire87 = wire86[(3'h7):(2'h3)];
  assign wire88 = $unsigned($signed(reg84[(4'h9):(4'h8)]));
endmodule

module module42  (y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire47;
  input wire [(3'h6):(1'h0)] wire46;
  input wire signed [(5'h13):(1'h0)] wire45;
  input wire [(5'h11):(1'h0)] wire44;
  input wire [(3'h5):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire65;
  wire signed [(3'h4):(1'h0)] wire64;
  wire signed [(4'hc):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire48;
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
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
                 (1'h0)};
  assign wire48 = $signed(wire46);
  assign wire49 = (|{(8'hb4)});
  assign wire50 = wire46[(3'h5):(2'h3)];
  assign wire51 = wire50;
  assign wire52 = $signed((wire45[(2'h3):(2'h3)] ~^ wire51[(4'hd):(4'hb)]));
  always
    @(posedge clk) begin
      reg53 <= $unsigned(($unsigned(wire49) ^ {wire52[(1'h1):(1'h1)]}));
      if (wire50)
        begin
          reg54 <= wire43;
          reg55 <= ((!(wire52 - wire52[(3'h5):(1'h0)])) ?
              (($signed((wire47 ? wire46 : reg53)) <<< (wire49 ?
                      $unsigned(reg54) : wire45)) ?
                  {(&{wire43}),
                      {wire51[(4'ha):(4'h8)]}} : wire51) : (wire43[(2'h3):(2'h2)] <= wire50[(4'he):(3'h4)]));
          reg56 <= ((($unsigned($signed(reg53)) * wire52) ?
                  (!$unsigned(wire47)) : ((~|$signed(wire49)) >>> reg54)) ?
              ((wire47[(1'h0):(1'h0)] ?
                  {$signed(wire50),
                      $unsigned(wire45)} : ($signed(wire51) || $unsigned((8'hb2)))) <<< reg54[(5'h10):(4'hd)]) : $unsigned(wire46));
        end
      else
        begin
          if (wire52[(4'ha):(4'ha)])
            begin
              reg54 <= wire49;
              reg55 <= wire50[(4'hb):(1'h0)];
              reg56 <= $signed((($signed($signed(reg56)) || (reg54 ^~ (wire49 ?
                      wire50 : wire52))) ?
                  (~&$unsigned((~&reg56))) : (&reg55)));
              reg57 <= $unsigned({wire46});
            end
          else
            begin
              reg54 <= wire49[(4'h8):(2'h3)];
              reg55 <= ($signed(wire47[(2'h2):(2'h2)]) <= wire47[(3'h5):(2'h2)]);
              reg56 <= reg53[(4'hf):(1'h1)];
              reg57 <= (8'haa);
              reg58 <= $signed((~&$unsigned(wire47[(3'h4):(1'h0)])));
            end
          reg59 <= wire43[(2'h2):(1'h1)];
          reg60 <= {{({(&reg56)} ?
                      (&(reg53 ? wire44 : reg55)) : ((8'hbe) >>> (wire47 ?
                          wire52 : wire48))),
                  $signed(((wire44 ? wire46 : (8'ha8)) ? {wire45} : wire45))},
              ($unsigned((reg58 ?
                  (reg58 < wire47) : {wire45})) >> (~(-wire48)))};
          reg61 <= wire46;
          reg62 <= wire52[(4'hc):(3'h7)];
        end
      reg63 <= (8'hb6);
    end
  assign wire64 = {(&reg59)};
  assign wire65 = $signed(({wire64} ?
                      (+wire64[(2'h2):(2'h2)]) : reg57[(3'h4):(1'h0)]));
endmodule

module module13
#(parameter param38 = ({(((!(8'hbf)) ? ((7'h43) ? (8'hbf) : (8'h9e)) : (^~(8'h9c))) - (((7'h42) ? (7'h42) : (7'h40)) <= ((8'hb6) ^~ (8'hb4))))} >= ((^~(((8'haa) ? (8'hb5) : (8'hb6)) ? ((8'hab) ? (8'hbc) : (8'hb3)) : {(8'hac)})) ? (~|(((7'h42) ? (7'h42) : (8'hb2)) ? ((8'hbe) && (8'ha4)) : {(8'ha8), (8'h9d)})) : (|(~^(^(8'hb3)))))))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire17;
  input wire [(4'hf):(1'h0)] wire16;
  input wire [(4'h9):(1'h0)] wire15;
  input wire [(5'h11):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire37;
  wire signed [(4'h9):(1'h0)] wire34;
  wire [(3'h7):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire31;
  wire signed [(4'ha):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire27;
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  assign y = {wire37,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 reg36,
                 reg35,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg18 <= $unsigned(($unsigned(({(8'hab)} ~^ wire17)) ?
          ($signed((wire16 ?
              wire15 : wire14)) ^~ wire16[(4'h8):(3'h6)]) : wire15[(3'h7):(3'h7)]));
      reg19 <= (7'h42);
    end
  always
    @(posedge clk) begin
      reg20 <= reg19;
      reg21 <= (~&((((~wire17) * (+(8'h9c))) >>> $unsigned(wire17[(1'h0):(1'h0)])) ?
          wire17 : $unsigned(((8'hb5) ? (!reg19) : reg20))));
      if (reg19[(2'h2):(2'h2)])
        begin
          reg22 <= ($signed(wire17[(1'h0):(1'h0)]) ?
              {{$signed((8'hae)), (reg19[(2'h2):(2'h2)] <= $unsigned(reg20))},
                  $signed((reg19 ?
                      (wire17 ^ reg19) : wire17[(1'h1):(1'h1)]))} : $unsigned(reg19));
          reg23 <= reg22[(4'hc):(1'h1)];
          reg24 <= $signed($signed((|$signed($unsigned(reg22)))));
        end
      else
        begin
          reg22 <= $unsigned($unsigned($unsigned({reg20[(2'h2):(2'h2)],
              (&wire16)})));
        end
      reg25 <= ($unsigned(((reg23[(3'h4):(3'h4)] | (&reg23)) < wire17)) ?
          wire17 : ((reg21[(1'h1):(1'h1)] + {(reg19 ? reg24 : reg23),
              $signed(wire17)}) >= ((^~(~&reg20)) ?
              (~^reg20[(3'h4):(1'h1)]) : $signed($signed(reg20)))));
      reg26 <= $unsigned({($signed(reg20[(3'h4):(1'h0)]) ?
              $unsigned(reg23) : $unsigned($signed(wire17))),
          reg24[(1'h0):(1'h0)]});
    end
  assign wire27 = {reg26,
                      ($signed(((reg23 ? reg25 : wire14) ?
                              $unsigned(reg20) : (reg19 ? wire17 : (8'had)))) ?
                          $unsigned($signed(reg18)) : $signed($unsigned($unsigned(reg22))))};
  assign wire28 = $unsigned((wire14[(4'ha):(4'h9)] ?
                      (8'haa) : $unsigned(wire15)));
  assign wire29 = (~|wire15[(1'h0):(1'h0)]);
  assign wire30 = wire29[(2'h3):(1'h0)];
  assign wire31 = (~&($signed({(~&reg26)}) ^~ ((~^(wire17 >>> wire16)) ^ ((reg22 ~^ wire27) | (reg23 <= wire27)))));
  assign wire32 = (!$unsigned((~|wire16)));
  assign wire33 = wire31;
  assign wire34 = reg24;
  always
    @(posedge clk) begin
      reg35 <= wire32;
      reg36 <= $signed($signed((reg20[(1'h0):(1'h0)] <<< wire27[(1'h1):(1'h0)])));
    end
  assign wire37 = $signed(($unsigned(reg26) & $signed($signed(reg22[(5'h15):(5'h13)]))));
endmodule
