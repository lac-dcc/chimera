module top
#(parameter param166 = {{((((8'hb7) <= (8'ha8)) ? {(8'ha0), (8'h9f)} : (~|(8'ha4))) != (-(!(8'hb3))))}, (((~|((8'hbb) ? (8'had) : (8'hb4))) >>> (~&(&(7'h41)))) ? {(^~(8'hb5))} : (((~(8'ha2)) ? ((8'h9e) ? (8'h9e) : (8'hac)) : ((8'h9f) && (7'h44))) <= (8'hb5)))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire165;
  wire [(4'h9):(1'h0)] wire163;
  wire [(2'h2):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire151;
  assign y = {wire165,
                 wire163,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire151,
                 (1'h0)};
  assign wire4 = $signed(({($signed((8'hab)) ^ (-(8'ha2))),
                         ((wire2 <<< wire2) | (^~(8'hae)))} ?
                     wire2[(4'h9):(3'h4)] : wire0));
  assign wire5 = $unsigned($signed(({(~^(8'hb3))} ?
                     $signed($signed(wire2)) : $signed((wire3 | wire0)))));
  assign wire6 = (wire3 ? wire2 : (!{(&wire2)}));
  assign wire7 = ({wire5[(3'h7):(3'h6)], $signed((~(~|wire1)))} ~^ wire6);
  assign wire8 = wire5;
  assign wire9 = wire7;
  assign wire10 = $unsigned((^($unsigned((wire3 != wire7)) >= $signed($signed(wire4)))));
  assign wire11 = $signed($unsigned(wire4[(1'h1):(1'h1)]));
  module12 #() modinst152 (.wire17(wire11), .wire13(wire3), .clk(clk), .wire15(wire8), .wire14(wire7), .wire16(wire6), .y(wire151));
  module153 #() modinst164 (.y(wire163), .wire155(wire6), .wire154(wire0), .wire157(wire1), .wire156(wire9), .clk(clk));
  assign wire165 = wire5[(2'h3):(2'h3)];
endmodule

module module153
#(parameter param162 = ((((^~((8'had) ~^ (8'hbc))) ? ((~^(8'h9c)) >>> (!(8'h9c))) : (8'ha2)) + ((!((8'hbd) != (7'h43))) | (~(|(8'hb3))))) <<< ((((~&(8'hbf)) ? ((8'ha9) <<< (8'h9e)) : ((8'hbb) ? (8'hb3) : (8'hb3))) | (((8'ha5) > (8'hae)) | ((8'h9d) != (8'hb3)))) ? (^(|((8'ha2) ? (8'hb7) : (8'hb6)))) : (((8'hbc) <<< (~(8'hba))) >>> (|((8'hb1) ? (8'h9f) : (7'h41)))))))
(y, clk, wire157, wire156, wire155, wire154);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire157;
  input wire signed [(3'h7):(1'h0)] wire156;
  input wire signed [(5'h13):(1'h0)] wire155;
  input wire [(4'hb):(1'h0)] wire154;
  wire [(5'h12):(1'h0)] wire161;
  wire signed [(4'hf):(1'h0)] wire160;
  wire signed [(4'ha):(1'h0)] wire159;
  wire signed [(4'hd):(1'h0)] wire158;
  assign y = {wire161, wire160, wire159, wire158, (1'h0)};
  assign wire158 = wire155[(4'hf):(4'he)];
  assign wire159 = $signed($unsigned(($unsigned(wire155[(5'h10):(4'he)]) << (wire154 & (wire156 ^~ (8'haa))))));
  assign wire160 = (($signed($unsigned({(8'ha8),
                       (7'h43)})) ^ wire155[(4'he):(1'h1)]) - {(8'ha4),
                       (-(wire158[(4'hb):(4'ha)] ?
                           (wire157 || wire159) : (^wire158)))});
  assign wire161 = {wire159[(4'h8):(3'h7)]};
endmodule

module module12
#(parameter param150 = ((~&(({(8'hb6)} & ((8'haa) >>> (8'ha1))) < (((8'hbb) << (7'h44)) ? (^~(8'hbb)) : (~|(8'ha9))))) ? (((~(8'hb8)) ? ({(8'ha8)} & ((8'hbf) ? (8'hbf) : (8'ha5))) : (|{(8'ha3)})) ? ((8'hb0) ? ((&(8'hb1)) ? ((8'hb4) & (8'hb7)) : {(7'h43)}) : (8'hb0)) : ({((8'hbe) == (8'h9c)), ((8'ha5) <= (8'hb7))} ? ((-(8'hb9)) >= ((8'hb4) == (8'hbf))) : ({(8'hba), (8'hbf)} | ((8'hac) <<< (8'ha7))))) : {(+{((8'hb0) ? (8'hb7) : (8'hb8)), (^~(8'haa))})}))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire17;
  input wire [(5'h14):(1'h0)] wire16;
  input wire signed [(4'hb):(1'h0)] wire15;
  input wire signed [(4'hc):(1'h0)] wire14;
  input wire [(4'hb):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire149;
  wire signed [(3'h4):(1'h0)] wire146;
  wire signed [(3'h7):(1'h0)] wire144;
  wire [(5'h11):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire63;
  wire [(5'h12):(1'h0)] wire64;
  wire signed [(4'h9):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire66;
  wire [(2'h3):(1'h0)] wire109;
  reg [(5'h10):(1'h0)] reg148 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg147 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  assign y = {wire149,
                 wire146,
                 wire144,
                 wire61,
                 wire22,
                 wire18,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire109,
                 reg148,
                 reg147,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire18 = ($signed({(!((8'ha0) * (8'hb0))),
                      wire15[(2'h2):(1'h0)]}) || $unsigned(({$signed(wire17)} ?
                      ($signed((8'ha2)) ?
                          wire17[(1'h0):(1'h0)] : (~|wire13)) : {(wire15 >= wire14)})));
  always
    @(posedge clk) begin
      reg19 <= {$unsigned($unsigned(wire15[(1'h1):(1'h1)]))};
      reg20 <= ($unsigned((wire18 & $unsigned({wire14, (8'h9d)}))) >= {(7'h42),
          reg19[(4'h9):(1'h0)]});
      reg21 <= (({$signed(wire16[(2'h3):(1'h1)])} ^ (reg20[(2'h3):(2'h2)] ?
              $signed((reg19 <<< wire15)) : (~reg20[(4'h8):(3'h7)]))) ?
          $unsigned(reg20) : {wire15[(2'h2):(1'h1)]});
    end
  assign wire22 = wire18;
  module23 #() modinst62 (wire61, clk, wire22, reg21, wire16, reg20, wire14);
  assign wire63 = $signed($signed({reg20, wire16}));
  assign wire64 = wire13;
  assign wire65 = $unsigned(wire61[(4'hf):(4'h8)]);
  assign wire66 = $unsigned($signed((|((reg21 != reg19) ?
                      (wire15 ? reg21 : wire14) : (wire13 ?
                          wire14 : wire13)))));
  module67 #() modinst110 (.wire70(reg21), .wire71(wire16), .y(wire109), .wire69(wire66), .wire68(wire63), .clk(clk));
  module111 #() modinst145 (wire144, clk, wire13, wire64, wire65, wire22);
  assign wire146 = $unsigned((~(-wire65[(3'h7):(1'h1)])));
  always
    @(posedge clk) begin
      reg147 <= (reg20[(5'h13):(4'hb)] * reg19);
      if ($unsigned($signed((({wire16, reg20} ?
          wire14 : (wire63 ? (8'hbb) : wire17)) > $unsigned(((8'h9f) ?
          wire146 : wire13))))))
        begin
          reg148 <= ((wire144[(2'h2):(2'h2)] ?
              wire61[(2'h2):(1'h1)] : {$unsigned((wire13 ? wire66 : wire22)),
                  $unsigned($signed(wire64))}) || $unsigned(wire144));
        end
      else
        begin
          reg148 <= ({(wire17 ?
                  $unsigned((wire13 ? wire13 : wire109)) : (~|(~&wire66))),
              $signed((((8'hac) ?
                  reg19 : reg148) - $unsigned(wire144)))} || ({$unsigned((wire109 <= wire66)),
              $signed($signed((8'hb5)))} < (8'hbb)));
        end
    end
  assign wire149 = $unsigned((((wire13[(3'h6):(3'h6)] ?
                           {wire15, reg21} : {(8'haa), wire22}) ?
                       {wire13} : ($signed((8'ha4)) ?
                           $signed(wire16) : reg148[(4'hd):(2'h2)])) > reg19[(2'h2):(1'h1)]));
endmodule

module module111  (y, clk, wire115, wire114, wire113, wire112);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire115;
  input wire [(5'h10):(1'h0)] wire114;
  input wire signed [(4'h9):(1'h0)] wire113;
  input wire [(5'h14):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire143;
  wire signed [(4'h9):(1'h0)] wire117;
  wire [(4'he):(1'h0)] wire116;
  reg [(2'h2):(1'h0)] reg142 = (1'h0);
  reg [(4'hb):(1'h0)] reg141 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg139 = (1'h0);
  reg [(3'h7):(1'h0)] reg138 = (1'h0);
  reg [(4'h8):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg136 = (1'h0);
  reg [(4'ha):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg134 = (1'h0);
  reg [(2'h3):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg132 = (1'h0);
  reg [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg130 = (1'h0);
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg128 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg126 = (1'h0);
  reg [(5'h11):(1'h0)] reg125 = (1'h0);
  reg [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg123 = (1'h0);
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg121 = (1'h0);
  reg [(4'he):(1'h0)] reg120 = (1'h0);
  reg [(5'h12):(1'h0)] reg119 = (1'h0);
  reg [(3'h6):(1'h0)] reg118 = (1'h0);
  assign y = {wire143,
                 wire117,
                 wire116,
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
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  assign wire116 = $signed((($unsigned(wire113[(4'h8):(3'h7)]) ?
                           (((8'h9f) | wire112) ~^ (wire112 ?
                               wire113 : wire113)) : ((^wire115) ?
                               (+wire115) : {wire113, wire112})) ?
                       (|$signed((^wire113))) : wire112));
  assign wire117 = $signed((-((&$signed(wire112)) <<< {$unsigned(wire113)})));
  always
    @(posedge clk) begin
      reg118 <= (~^wire112[(4'hb):(3'h6)]);
      if ((wire115[(2'h2):(1'h0)] ?
          $unsigned(($unsigned(wire116) ?
              (~|(wire117 ?
                  wire115 : wire114)) : wire117)) : $unsigned($unsigned((~|$signed(wire116))))))
        begin
          reg119 <= wire112[(3'h4):(2'h2)];
          reg120 <= $unsigned(wire116[(1'h0):(1'h0)]);
        end
      else
        begin
          if ((8'ha3))
            begin
              reg119 <= $signed($signed((~&{(+wire113)})));
            end
          else
            begin
              reg119 <= (^~$signed(reg120[(1'h1):(1'h0)]));
              reg120 <= (~&($signed($signed(wire113)) ?
                  $signed({$unsigned(wire115),
                      wire114[(4'hd):(3'h6)]}) : reg118));
              reg121 <= (((+$signed(wire115[(1'h0):(1'h0)])) ?
                      {{((8'haf) ? (8'hab) : (8'ha7))},
                          (&wire113[(2'h3):(1'h1)])} : (reg118 || reg118)) ?
                  (^$unsigned(((|wire113) && (reg119 ?
                      wire116 : reg118)))) : ($signed($signed((wire116 ?
                      wire116 : (8'hbb)))) <= $signed((~&$signed(reg120)))));
              reg122 <= (8'ha4);
              reg123 <= $signed($signed((7'h43)));
            end
          if (({($unsigned($unsigned(reg119)) ?
                      wire114[(4'ha):(2'h2)] : $unsigned((wire114 < reg118)))} ?
              wire116[(1'h0):(1'h0)] : $unsigned(reg119[(3'h7):(1'h0)])))
            begin
              reg124 <= $unsigned($signed($signed($unsigned($unsigned(wire112)))));
              reg125 <= $signed((((!$unsigned(reg120)) ?
                  wire113[(3'h4):(2'h2)] : wire114) ^~ (8'hb0)));
              reg126 <= (wire117 <<< {reg125[(4'h9):(2'h3)]});
            end
          else
            begin
              reg124 <= (~(~$signed($signed(reg126[(3'h4):(2'h3)]))));
            end
          reg127 <= (~^(($unsigned(wire113) < (reg120[(4'ha):(2'h3)] > wire112[(3'h4):(3'h4)])) ?
              (wire115 ?
                  ($unsigned(reg123) ?
                      (wire116 ?
                          reg124 : reg121) : reg124) : ($signed(reg119) >= (&wire114))) : $signed((wire113[(2'h2):(1'h0)] >= wire112[(4'hc):(3'h6)]))));
          if ((reg127 ?
              reg125[(3'h4):(3'h4)] : (+$signed(($signed(reg122) ^~ wire116[(4'h9):(4'h9)])))))
            begin
              reg128 <= $signed((8'h9e));
            end
          else
            begin
              reg128 <= (~$signed(((+reg127[(3'h4):(3'h4)]) == (~&reg125))));
              reg129 <= ((reg123 ?
                  reg119[(5'h10):(4'hd)] : (wire114[(4'h9):(3'h6)] ?
                      $signed($unsigned(reg118)) : $unsigned((reg128 <= wire114)))) == $unsigned((({wire114} ?
                      $unsigned(reg127) : $signed(reg121)) ?
                  $signed((^reg128)) : ((reg120 == reg127) ?
                      (reg127 ? reg122 : reg120) : $signed(reg122)))));
              reg130 <= reg124[(1'h0):(1'h0)];
              reg131 <= $unsigned(($signed(reg126[(3'h5):(2'h2)]) - ($unsigned((&wire117)) && (((8'ha2) ?
                      reg127 : wire115) ?
                  ((8'h9d) != (8'hae)) : (wire113 ? reg125 : reg121)))));
              reg132 <= $signed(($unsigned(($signed((8'had)) ?
                      (~^reg121) : wire115[(3'h6):(1'h0)])) ?
                  (-wire115[(2'h3):(2'h2)]) : wire113));
            end
        end
      if ((-$unsigned((8'hbf))))
        begin
          reg133 <= ((~^reg132) ^ $signed($signed(($signed(reg119) >> $signed(reg132)))));
          reg134 <= $signed($signed($signed((wire113 ?
              (reg132 ? reg122 : reg130) : $unsigned(reg123)))));
        end
      else
        begin
          reg133 <= (!$unsigned(((((8'hbc) ^~ wire115) ?
                  reg123[(2'h2):(1'h0)] : (reg131 && wire112)) ?
              reg127 : {(~|wire113), ((8'ha7) ? (8'hbd) : reg120)})));
          if ($signed({wire113}))
            begin
              reg134 <= $signed({(((&(8'hbe)) == $unsigned((8'hb5))) ?
                      $unsigned($unsigned(reg123)) : ($unsigned(reg124) ?
                          (&wire116) : (wire117 >= wire114)))});
              reg135 <= (^~(8'ha3));
              reg136 <= (reg133[(2'h3):(2'h3)] ?
                  ((((reg132 ^ (8'hb5)) ?
                          (reg123 < reg134) : (reg118 ? wire113 : reg122)) ?
                      ((reg127 ?
                          reg127 : reg133) >> $signed(reg135)) : (~&{reg119,
                          reg128})) >= reg128[(3'h4):(2'h2)]) : (reg119[(4'hf):(4'h8)] > reg121[(2'h2):(1'h0)]));
            end
          else
            begin
              reg134 <= $unsigned(reg124[(4'hc):(4'ha)]);
            end
          if (reg133[(1'h1):(1'h1)])
            begin
              reg137 <= {wire116[(1'h0):(1'h0)], reg133[(1'h1):(1'h1)]};
              reg138 <= reg120;
              reg139 <= $signed(($unsigned(((reg132 + (8'hac)) > (|reg120))) ?
                  reg118[(3'h4):(2'h2)] : $unsigned($unsigned((~&reg120)))));
            end
          else
            begin
              reg137 <= reg129[(4'he):(4'h9)];
              reg138 <= (($signed((8'hb4)) ?
                      wire117[(1'h1):(1'h1)] : (reg125 ^ (reg126 ?
                          (reg123 ? reg124 : reg123) : $unsigned(reg131)))) ?
                  reg128[(5'h12):(1'h0)] : $signed((wire113[(3'h6):(1'h1)] | reg128)));
              reg139 <= ($unsigned((reg126[(3'h5):(3'h5)] ?
                  $signed($unsigned(reg131)) : reg135[(1'h1):(1'h1)])) <= reg119[(2'h3):(2'h3)]);
              reg140 <= reg134[(2'h3):(1'h0)];
            end
          reg141 <= (|$signed($unsigned($signed($signed(reg126)))));
        end
      reg142 <= reg128[(4'hc):(4'ha)];
    end
  assign wire143 = (-(~|$unsigned($signed({reg138, reg118}))));
endmodule

module module67
#(parameter param107 = ((~|{((-(7'h44)) ? (^(8'hb8)) : (|(8'hbd)))}) ? {((+((8'hba) <<< (8'hb8))) ? (((8'ha2) ? (8'haa) : (8'hb4)) ^ ((8'h9c) && (8'hb1))) : (8'hb8)), ((7'h42) ? (~&((8'hba) ? (8'hb4) : (8'hb9))) : ({(8'haf)} ? ((8'h9c) * (8'ha5)) : (^(7'h41))))} : (((~^((8'hb2) ? (8'ha8) : (8'hb9))) ? ({(8'haf)} || ((8'hb5) * (8'h9e))) : (&((8'hbe) ? (7'h43) : (8'hb9)))) >> ((((8'hba) + (8'ha8)) && (8'ha5)) ? {((8'hba) ^ (8'ha0)), {(8'haa), (8'h9c)}} : ((~(8'ha9)) << ((8'had) << (8'hac)))))), 
parameter param108 = param107)
(y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'h1cb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire71;
  input wire signed [(3'h5):(1'h0)] wire70;
  input wire [(4'hd):(1'h0)] wire69;
  input wire signed [(3'h5):(1'h0)] wire68;
  wire [(3'h5):(1'h0)] wire106;
  wire signed [(5'h11):(1'h0)] wire105;
  wire signed [(5'h14):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  wire signed [(5'h11):(1'h0)] wire102;
  wire [(5'h13):(1'h0)] wire101;
  wire [(5'h13):(1'h0)] wire100;
  wire [(4'hb):(1'h0)] wire99;
  wire signed [(5'h15):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire97;
  wire signed [(5'h13):(1'h0)] wire96;
  wire [(2'h3):(1'h0)] wire95;
  wire [(2'h3):(1'h0)] wire94;
  wire [(4'hd):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire92;
  wire signed [(3'h6):(1'h0)] wire91;
  wire [(4'hb):(1'h0)] wire90;
  wire signed [(2'h3):(1'h0)] wire89;
  wire [(2'h3):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire73;
  wire [(4'hc):(1'h0)] wire72;
  reg [(4'hb):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg [(3'h6):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg [(5'h14):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg74 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire73,
                 wire72,
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
                 (1'h0)};
  assign wire72 = wire70;
  assign wire73 = $signed((8'hb0));
  always
    @(posedge clk) begin
      if (({(&$signed((wire71 ? wire69 : wire73)))} != {wire72,
          $unsigned({{wire73}})}))
        begin
          reg74 <= wire68[(2'h2):(2'h2)];
          reg75 <= ({wire73[(4'hf):(4'h9)]} ?
              (wire73[(4'hf):(3'h5)] && wire69[(3'h5):(3'h4)]) : wire68[(1'h0):(1'h0)]);
          reg76 <= ({wire71, wire72} >>> $unsigned((((-reg74) ?
              ((8'hbc) || wire73) : (-wire69)) != (~|$signed((8'hac))))));
        end
      else
        begin
          if ($unsigned(((!((wire70 ? reg76 : (8'hab)) ?
                  (wire71 == wire73) : $signed(reg74))) ?
              $signed((reg75[(2'h2):(1'h0)] ?
                  (~&(8'had)) : (wire69 ?
                      wire68 : reg74))) : (~|(wire73 & (reg75 ?
                  wire70 : wire73))))))
            begin
              reg74 <= wire68;
            end
          else
            begin
              reg74 <= (((&wire72) ?
                  ((((8'hb1) ? wire72 : wire71) ?
                      {reg75,
                          (7'h43)} : wire70) || reg75) : wire73) | (^($signed({reg74,
                      reg75}) ?
                  {(&wire68),
                      $signed(reg75)} : $unsigned(wire69[(2'h3):(2'h2)]))));
              reg75 <= $unsigned($signed((reg75[(4'hb):(4'h8)] ?
                  $signed((wire73 != wire73)) : $signed($unsigned((8'hab))))));
              reg76 <= $signed(reg76[(3'h5):(2'h2)]);
              reg77 <= $signed(((wire70 * (8'hbd)) >>> (~&reg76[(4'h9):(3'h5)])));
            end
          reg78 <= {$signed($unsigned({(wire69 ? wire73 : reg77)})),
              ($unsigned((^(&wire68))) >> (reg76[(3'h4):(2'h2)] <<< (^wire70[(3'h4):(2'h3)])))};
        end
      if (reg77[(2'h2):(1'h0)])
        begin
          reg79 <= (reg76[(3'h4):(1'h0)] * (wire69 >>> wire73[(3'h5):(3'h4)]));
        end
      else
        begin
          reg79 <= ($unsigned({{$signed(wire71), (reg78 ? wire68 : reg75)}}) ?
              (8'ha4) : (($unsigned({wire72, reg78}) ?
                  reg77 : wire70) >>> (({reg75,
                  reg76} < (reg76 & reg76)) | ((wire69 | wire69) ^~ (|reg76)))));
          if ((~^$unsigned($signed($unsigned(wire73)))))
            begin
              reg80 <= ((8'ha2) <= (reg76[(4'ha):(1'h1)] ?
                  $signed(wire73[(4'hb):(4'h8)]) : (wire68 ?
                      ((+reg76) ?
                          (^~reg76) : reg78[(3'h4):(2'h3)]) : wire72[(1'h0):(1'h0)])));
              reg81 <= wire71[(1'h0):(1'h0)];
              reg82 <= (|(wire70 ? (^~$signed((wire68 + wire71))) : reg76));
            end
          else
            begin
              reg80 <= (-reg81);
              reg81 <= ((&(|(wire69 ?
                  (wire73 ~^ wire69) : (wire70 ? (8'ha9) : reg79)))) || reg78);
              reg82 <= $signed($signed((|$unsigned(reg74))));
            end
          reg83 <= $signed(wire73);
          if ($unsigned((reg74[(1'h0):(1'h0)] ^~ {reg82[(1'h1):(1'h1)],
              $signed($signed(reg83))})))
            begin
              reg84 <= (|$unsigned(wire73));
              reg85 <= {(reg74 > (-wire69))};
              reg86 <= (((((~^reg80) >>> $signed(reg80)) != $unsigned(reg78)) ?
                      $signed(wire71[(5'h11):(4'hc)]) : $signed(reg76[(4'he):(2'h3)])) ?
                  $signed({reg79[(1'h0):(1'h0)],
                      ({(8'ha3)} ?
                          {wire69} : ((8'ha6) | reg74))}) : reg81[(3'h5):(2'h2)]);
            end
          else
            begin
              reg84 <= $signed((&wire72));
              reg85 <= $unsigned((wire72[(2'h2):(1'h1)] != (~&$unsigned((wire71 != reg82)))));
              reg86 <= $unsigned($signed(reg81[(3'h6):(2'h2)]));
              reg87 <= ($unsigned(((wire70[(2'h2):(1'h1)] & $unsigned(reg79)) + ((~(8'h9e)) ?
                      (8'haa) : (reg74 == reg77)))) ?
                  reg78[(2'h3):(2'h2)] : (reg80 <<< $signed({(reg76 ?
                          reg82 : reg75),
                      $unsigned(reg82)})));
            end
        end
    end
  assign wire88 = $unsigned(reg78);
  assign wire89 = reg81;
  assign wire90 = ($signed($unsigned(($unsigned(reg78) && $unsigned((8'hbc))))) ?
                      $unsigned((wire89[(1'h0):(1'h0)] || $unsigned((reg83 ?
                          wire72 : (8'hbc))))) : (|(((reg78 ?
                              reg79 : wire71) && {reg75, wire71}) ?
                          ($signed(wire71) ?
                              reg87[(1'h0):(1'h0)] : (!wire69)) : ($signed(reg75) ?
                              reg81 : (~^reg87)))));
  assign wire91 = wire70[(2'h3):(2'h3)];
  assign wire92 = ((|$signed((|(reg85 && wire90)))) ?
                      reg87 : wire70[(1'h0):(1'h0)]);
  assign wire93 = $signed((((!((8'hb6) ? (8'hba) : wire68)) != $signed((wire92 ?
                      reg81 : (8'hb9)))) && wire90[(2'h3):(2'h3)]));
  assign wire94 = reg75[(4'h9):(2'h2)];
  assign wire95 = ((~^($unsigned((wire93 ? wire68 : reg78)) ?
                      (~|(reg79 >>> reg83)) : wire89)) == (wire70 >>> reg76[(4'h9):(4'h9)]));
  assign wire96 = (^~(($unsigned($unsigned((8'h9e))) ?
                      $unsigned((!(8'hac))) : reg77[(3'h6):(3'h4)]) ~^ ($unsigned((reg80 ?
                          wire90 : reg75)) ?
                      $unsigned((!(8'hba))) : $unsigned(reg76))));
  assign wire97 = ((($signed(wire69[(1'h1):(1'h0)]) ?
                          wire96[(5'h12):(4'h9)] : $unsigned($unsigned(reg77))) ?
                      ((&(wire93 >= wire69)) ?
                          reg86[(4'hc):(1'h1)] : (-((8'hb0) ?
                              wire95 : wire88))) : ({reg80} ?
                          reg75 : ({reg87,
                              wire88} - $unsigned(wire73)))) & {wire90[(1'h0):(1'h0)]});
  assign wire98 = (({$unsigned((wire73 ? reg75 : wire89)),
                          $unsigned($unsigned(reg79))} ?
                      wire91 : $signed((reg74 >> wire71))) + reg81[(3'h6):(1'h0)]);
  assign wire99 = (wire98[(4'hb):(3'h4)] <<< ($signed(($signed(wire69) ?
                      {wire97} : reg86)) < $unsigned($unsigned(wire90[(3'h4):(2'h2)]))));
  assign wire100 = wire94;
  assign wire101 = (|$unsigned((|$unsigned($signed(reg77)))));
  assign wire102 = $unsigned((((-{reg77, wire95}) ?
                       $signed(reg81[(1'h1):(1'h0)]) : ($unsigned(wire88) ~^ $unsigned((8'hbb)))) >> $signed(wire89[(1'h1):(1'h1)])));
  assign wire103 = {(-(~&wire95))};
  assign wire104 = (~$unsigned((^~(!$signed(reg87)))));
  assign wire105 = ((7'h42) ~^ $unsigned($unsigned(reg78)));
  assign wire106 = (^$signed((-reg77)));
endmodule

module module23
#(parameter param60 = (-(|((((8'hb3) <<< (7'h42)) == ((8'ha3) < (8'h9c))) ? ((-(8'ha5)) == ((8'h9e) | (8'hac))) : (~|(!(8'hb3)))))))
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h172):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire28;
  input wire [(4'he):(1'h0)] wire27;
  input wire signed [(3'h4):(1'h0)] wire26;
  input wire signed [(5'h15):(1'h0)] wire25;
  input wire signed [(4'hc):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire47;
  wire signed [(3'h5):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire30;
  wire signed [(5'h13):(1'h0)] wire29;
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
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
                 (1'h0)};
  assign wire29 = wire26;
  assign wire30 = wire25[(4'h8):(3'h5)];
  assign wire31 = (($signed(wire29[(4'hc):(3'h6)]) ?
                          $unsigned((-(wire27 ?
                              wire28 : wire29))) : {$unsigned((wire27 ?
                                  wire29 : (8'h9c))),
                              wire24}) ?
                      $unsigned(wire26[(3'h4):(3'h4)]) : wire30);
  assign wire32 = wire31[(1'h0):(1'h0)];
  assign wire33 = (^~(-(wire32[(3'h5):(3'h4)] | (~|wire30))));
  always
    @(posedge clk) begin
      reg34 <= (+((wire24 ?
          {wire31,
              wire27[(2'h2):(2'h2)]} : $unsigned(((8'hb3) + wire24))) >= $signed(wire33)));
      if (wire31)
        begin
          reg35 <= wire29;
          reg36 <= (&$signed(wire32));
          reg37 <= (~^{reg36, wire30});
        end
      else
        begin
          reg35 <= ((~^{{$signed(reg35), reg34[(1'h1):(1'h1)]}, wire28}) ?
              $signed($unsigned(reg37)) : wire33);
          reg36 <= wire26;
          reg37 <= $signed(wire24[(3'h4):(2'h2)]);
          if ($signed($unsigned((wire31 ^~ wire33[(3'h5):(1'h1)]))))
            begin
              reg38 <= (((+reg34[(1'h1):(1'h1)]) ?
                      $signed(wire25[(4'hc):(1'h1)]) : wire25) ?
                  $unsigned(reg36) : {$unsigned($unsigned((^~(7'h41)))),
                      wire25});
            end
          else
            begin
              reg38 <= $signed(($signed($unsigned((wire31 ? reg35 : wire32))) ?
                  wire32 : $unsigned((^(reg36 ? reg34 : (8'hac))))));
            end
        end
      reg39 <= (({(((8'hb4) ? reg35 : reg38) ?
              {(8'hba)} : wire31[(1'h0):(1'h0)]),
          ((wire29 ^ (8'ha2)) ?
              wire30[(4'hd):(4'ha)] : $signed((8'ha1)))} + $signed({$signed(wire32)})) < (&$signed($signed((reg36 >>> wire33)))));
      if (reg37[(3'h4):(1'h1)])
        begin
          reg40 <= ($unsigned($signed($unsigned(reg37))) ^~ (wire26 ?
              (wire31[(5'h10):(3'h5)] && {(reg38 ?
                      wire24 : wire33)}) : ($signed({wire26,
                  wire25}) || ({reg35} ? (reg39 - reg36) : {wire29, wire30}))));
          reg41 <= (~|wire26);
        end
      else
        begin
          reg40 <= reg36;
          reg41 <= (^~$signed(wire30));
          reg42 <= (-$signed(($unsigned((8'hbc)) ?
              (+{wire28}) : $signed((!reg41)))));
        end
      reg43 <= ((|$unsigned($signed($unsigned(reg39)))) > ((~&{(wire33 ?
                  reg34 : reg36)}) ?
          (~|({reg37, reg37} >> reg34)) : (-$unsigned((!(8'hb2))))));
    end
  assign wire44 = (-$unsigned($unsigned({$signed(reg36)})));
  assign wire45 = (^~$signed(reg35));
  assign wire46 = $unsigned((&$signed(($signed(wire28) >> (reg41 * wire27)))));
  assign wire47 = (wire30[(4'h8):(4'h8)] ?
                      ((wire33[(2'h3):(1'h0)] ^~ $unsigned($unsigned(wire44))) ?
                          wire45 : $signed($signed((&reg41)))) : (&$unsigned(reg42)));
  assign wire48 = $unsigned(($signed(wire27) ?
                      {(~$signed(wire46)),
                          ({wire46} || {reg41,
                              wire24})} : $unsigned((+reg40[(5'h14):(5'h13)]))));
  always
    @(posedge clk) begin
      if ($signed((wire45 - $signed($signed(wire48)))))
        begin
          reg49 <= $signed($signed(reg43[(3'h4):(2'h2)]));
          reg50 <= wire28[(3'h6):(2'h2)];
          reg51 <= (reg42 - (^~(~$signed(wire28[(3'h4):(3'h4)]))));
          reg52 <= (!reg42[(2'h3):(2'h2)]);
        end
      else
        begin
          reg49 <= ($unsigned(wire44[(4'hd):(1'h1)]) ?
              (((reg40[(4'ha):(2'h3)] ? wire46 : ((7'h41) ? reg43 : wire44)) ?
                  {$signed((8'hbe))} : $unsigned($signed(wire26))) <= $signed(((-wire25) <<< $signed((8'hba))))) : (~&$unsigned($signed((wire29 >>> wire24)))));
          reg50 <= $unsigned((reg38[(3'h6):(3'h6)] ?
              (~&reg52) : ((reg51[(1'h1):(1'h1)] != reg41) ?
                  $unsigned(wire33) : (reg51 || (-reg35)))));
          reg51 <= $unsigned(((~&$signed(reg49[(5'h12):(4'ha)])) < (wire44 ?
              $unsigned(wire30[(4'h8):(2'h2)]) : $unsigned(wire29))));
          reg52 <= $unsigned(((((reg41 ? reg34 : wire28) ?
                  (!reg49) : (wire46 && wire44)) ?
              wire29 : $signed($unsigned(reg41))) || ($signed((wire45 ?
              wire48 : wire28)) == $signed(wire45))));
        end
      reg53 <= ((|reg41[(1'h0):(1'h0)]) >> {((-(-reg38)) ?
              wire48 : (~^((8'hb0) ? wire46 : wire31))),
          $signed(wire32[(1'h1):(1'h1)])});
      reg54 <= (!(((~&wire27) ? $unsigned(reg35) : $signed($unsigned(wire46))) ?
          wire33[(3'h4):(2'h3)] : $signed(((reg34 << reg36) ?
              wire26 : ((8'hb7) && reg37)))));
      reg55 <= $unsigned((~^(^~wire46)));
    end
  assign wire56 = reg34[(3'h6):(1'h1)];
  assign wire57 = reg55[(3'h4):(1'h0)];
  assign wire58 = (!{$signed({$signed(reg53)})});
  assign wire59 = ($unsigned((7'h41)) <= (~^((~reg36[(4'h8):(3'h4)]) ?
                      $signed((reg34 ?
                          reg42 : wire57)) : (~&$unsigned(reg39)))));
endmodule
