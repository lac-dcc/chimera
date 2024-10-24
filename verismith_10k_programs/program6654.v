module top
#(parameter param175 = {(({(~^(8'hb0)), ((8'hb8) ? (8'ha0) : (8'hbd))} ? (((8'had) <= (8'hb7)) != ((8'had) ? (8'hb6) : (8'ha9))) : {(7'h42), (8'ha5)}) ? (~^(^(^~(8'hae)))) : ((^~((8'hbe) || (8'hae))) ? (((8'hbf) ? (8'ha3) : (8'hbd)) >= ((8'haf) ? (8'haf) : (8'haf))) : {(8'hbc)})), (((((8'h9e) * (8'hbb)) >= ((7'h43) <<< (7'h42))) >= (~|((8'haa) << (8'hae)))) && (({(8'h9c)} ? (7'h44) : ((8'hba) ? (8'h9f) : (8'ha2))) - (((8'hb6) ? (8'hab) : (8'h9f)) ? ((8'h9c) ? (8'hbd) : (8'h9c)) : ((7'h41) ? (7'h43) : (8'hb3)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire174;
  wire signed [(4'h8):(1'h0)] wire166;
  wire [(4'hf):(1'h0)] wire165;
  wire signed [(4'he):(1'h0)] wire164;
  wire [(2'h3):(1'h0)] wire162;
  wire [(3'h4):(1'h0)] wire161;
  wire signed [(5'h12):(1'h0)] wire112;
  wire signed [(5'h10):(1'h0)] wire114;
  wire signed [(5'h10):(1'h0)] wire159;
  reg signed [(3'h7):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg172 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg171 = (1'h0);
  reg [(4'hd):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg169 = (1'h0);
  reg [(5'h15):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg167 = (1'h0);
  assign y = {wire174,
                 wire166,
                 wire165,
                 wire164,
                 wire162,
                 wire161,
                 wire112,
                 wire114,
                 wire159,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 (1'h0)};
  module5 #() modinst113 (.wire8(wire4), .wire7(wire2), .wire10(wire3), .wire9(wire1), .wire6(wire0), .clk(clk), .y(wire112));
  assign wire114 = $signed(((&wire4) ^ $unsigned((&wire1))));
  module115 #() modinst160 (.wire118(wire2), .wire117(wire4), .clk(clk), .wire119(wire1), .wire120(wire112), .wire116(wire0), .y(wire159));
  assign wire161 = (&((~($unsigned(wire3) ?
                       {wire112} : wire4[(1'h1):(1'h0)])) > $unsigned($signed((wire114 ?
                       wire114 : wire3)))));
  module137 #() modinst163 (wire162, clk, wire159, wire2, wire3, wire1);
  assign wire164 = {wire1, wire1};
  assign wire165 = (~^(8'ha0));
  assign wire166 = $unsigned(wire2);
  always
    @(posedge clk) begin
      reg167 <= wire159[(3'h6):(1'h0)];
      if (reg167)
        begin
          reg168 <= wire3[(5'h11):(4'he)];
          reg169 <= wire112;
          reg170 <= {$signed(wire2)};
          reg171 <= wire165[(3'h7):(1'h1)];
        end
      else
        begin
          reg168 <= $unsigned(wire165[(1'h1):(1'h0)]);
          reg169 <= $unsigned(((^~(|(&(7'h40)))) ?
              $unsigned($unsigned(reg169)) : wire162[(2'h2):(1'h1)]));
          reg170 <= ((reg171 <<< wire114) < $unsigned(wire114));
          reg171 <= wire161[(1'h0):(1'h0)];
        end
      reg172 <= wire0;
      reg173 <= wire166[(3'h7):(3'h7)];
    end
  assign wire174 = wire0;
endmodule

module module115
#(parameter param157 = {({((|(8'hbb)) << {(8'hbf), (8'ha6)})} ? ({(~(8'ha8))} & (((7'h40) ? (8'hb1) : (8'hb4)) ? (&(8'hba)) : (~^(8'hb4)))) : ((((8'hb0) | (8'hbc)) == ((8'hbb) ? (8'hb5) : (8'ha4))) ? ((8'hb8) ? (!(8'h9c)) : ((7'h41) > (8'ha3))) : {{(7'h43), (8'hb0)}, (~(8'haa))})), ((-((8'hba) == {(8'hab)})) ^~ {(((8'hba) ? (8'hb4) : (8'hbf)) | ((8'haf) ~^ (8'ha0))), (((8'hb4) ? (8'hb4) : (8'hb0)) ? {(8'ha3), (8'ha6)} : (~(8'h9c)))})}, 
parameter param158 = ((^~((|(param157 ? param157 : param157)) ? ((+param157) ? {param157, param157} : ((8'hbf) + (7'h44))) : (^~(param157 + param157)))) ^ param157))
(y, clk, wire120, wire119, wire118, wire117, wire116);
  output wire [(32'hfb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire120;
  input wire signed [(5'h13):(1'h0)] wire119;
  input wire signed [(4'h9):(1'h0)] wire118;
  input wire [(3'h7):(1'h0)] wire117;
  input wire [(4'he):(1'h0)] wire116;
  wire [(2'h3):(1'h0)] wire156;
  wire [(4'ha):(1'h0)] wire155;
  wire signed [(4'hd):(1'h0)] wire154;
  wire signed [(5'h14):(1'h0)] wire152;
  wire signed [(5'h13):(1'h0)] wire131;
  wire signed [(3'h4):(1'h0)] wire130;
  wire signed [(4'hb):(1'h0)] wire129;
  wire [(4'hc):(1'h0)] wire128;
  wire [(3'h6):(1'h0)] wire127;
  wire [(5'h12):(1'h0)] wire126;
  wire signed [(4'ha):(1'h0)] wire125;
  wire [(5'h13):(1'h0)] wire124;
  wire [(4'hf):(1'h0)] wire123;
  wire signed [(4'hb):(1'h0)] wire122;
  wire signed [(5'h15):(1'h0)] wire121;
  reg signed [(5'h10):(1'h0)] reg136 = (1'h0);
  reg [(2'h3):(1'h0)] reg135 = (1'h0);
  reg [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(4'hd):(1'h0)] reg133 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg132 = (1'h0);
  assign y = {wire156,
                 wire155,
                 wire154,
                 wire152,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 (1'h0)};
  assign wire121 = wire116;
  assign wire122 = {(~$signed((^((8'h9d) ^ wire119)))), wire118};
  assign wire123 = (wire122 & (($unsigned(wire119) <<< (-(wire119 ?
                           wire121 : wire117))) ?
                       {(((8'hae) < (8'hae)) != $signed((8'haa)))} : (|(wire121 ?
                           wire116 : (wire121 ? wire121 : (7'h41))))));
  assign wire124 = wire119;
  assign wire125 = wire117[(3'h6):(2'h2)];
  assign wire126 = wire119[(5'h11):(4'hd)];
  assign wire127 = (wire125 ?
                       (($signed((wire117 ?
                               wire119 : wire120)) ^~ wire119[(1'h0):(1'h0)]) ?
                           (~|((wire123 <<< wire121) << (&wire118))) : (&($signed((8'hba)) ~^ (&wire119)))) : wire126);
  assign wire128 = $signed((^~{$signed((wire122 ? wire123 : (8'ha6)))}));
  assign wire129 = wire118[(3'h5):(3'h4)];
  assign wire130 = $signed((wire118[(4'h8):(3'h7)] ?
                       $unsigned(wire116[(4'ha):(2'h2)]) : wire125[(1'h1):(1'h1)]));
  assign wire131 = $signed(wire127);
  always
    @(posedge clk) begin
      if ($signed((^(~|((wire118 ? wire118 : wire129) ?
          (&wire124) : wire131[(3'h4):(1'h1)])))))
        begin
          reg132 <= wire131;
          if (wire119)
            begin
              reg133 <= {wire122};
            end
          else
            begin
              reg133 <= $signed($signed($unsigned($signed((^~wire121)))));
              reg134 <= ({wire119[(2'h3):(1'h0)],
                      $signed(($signed(wire117) && {(8'hb6), wire129}))} ?
                  wire116[(1'h1):(1'h0)] : (~^($signed(wire125[(3'h7):(3'h7)]) >= $unsigned($signed(wire131)))));
            end
          reg135 <= (($signed((8'ha4)) ?
              $unsigned({wire125,
                  (wire130 ~^ wire131)}) : wire126[(1'h0):(1'h0)]) <= ($signed((wire131[(1'h0):(1'h0)] ?
                  $unsigned(reg132) : wire126)) ?
              (wire131 ?
                  wire117[(1'h1):(1'h1)] : ({wire122,
                      wire129} >= wire123[(4'h8):(4'h8)])) : $signed(({wire121,
                      wire130} ?
                  (-wire128) : (&wire121)))));
          reg136 <= $unsigned($signed($signed(wire128)));
        end
      else
        begin
          reg132 <= $signed((wire129 ?
              ($signed($signed(wire127)) ~^ (-{wire126})) : wire119));
          reg133 <= (|$unsigned(wire117));
          reg134 <= ((($signed({wire124}) ? wire129 : wire128[(4'h8):(1'h0)]) ?
                  (wire123 ?
                      (wire127 ? (wire130 || reg135) : wire122) : ((wire124 ?
                          (8'h9e) : wire122) ~^ ((8'ha3) ?
                          wire122 : wire127))) : $unsigned(wire129)) ?
              {(+((wire130 << wire118) ?
                      (wire131 != wire117) : wire118))} : $unsigned($unsigned($unsigned($signed(reg134)))));
        end
    end
  module137 #() modinst153 (.wire140(reg132), .wire141(reg134), .wire139(wire131), .y(wire152), .wire138(wire116), .clk(clk));
  assign wire154 = $unsigned(($unsigned((~(~wire120))) && ({wire120} <= {wire125,
                       $signed((8'hb8))})));
  assign wire155 = $signed($signed($signed($unsigned(reg133))));
  assign wire156 = $signed((reg132 ?
                       $signed((^wire122[(3'h7):(2'h3)])) : $signed(reg135[(2'h3):(2'h2)])));
endmodule

module module5
#(parameter param111 = (~&({((~(8'ha4)) ? {(8'hbe), (8'had)} : ((8'h9d) == (8'had))), (~^((8'hab) ? (8'hb5) : (8'hb5)))} ? ((~|{(8'hb5), (8'haa)}) + (8'hbc)) : ((~((7'h41) - (8'hb4))) ? (((8'hbb) >= (8'ha6)) ? (~^(8'hb4)) : ((8'hb3) ? (8'hb9) : (8'h9e))) : (((8'hb6) ? (7'h40) : (8'h9f)) ? ((8'had) - (7'h41)) : ((7'h41) * (8'ha5)))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire10;
  input wire [(4'hf):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire110;
  wire signed [(3'h5):(1'h0)] wire104;
  wire signed [(4'hf):(1'h0)] wire103;
  wire [(3'h7):(1'h0)] wire101;
  wire signed [(2'h2):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire45;
  wire [(3'h7):(1'h0)] wire62;
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(4'h9):(1'h0)] reg108 = (1'h0);
  reg [(4'hb):(1'h0)] reg107 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg105 = (1'h0);
  assign y = {wire110,
                 wire104,
                 wire103,
                 wire101,
                 wire43,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire45,
                 wire62,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 (1'h0)};
  assign wire11 = $signed($unsigned((~^wire6[(3'h5):(2'h3)])));
  assign wire12 = (wire7[(1'h0):(1'h0)] ? wire11 : (~&{$signed((^~wire7))}));
  assign wire13 = wire6[(2'h2):(2'h2)];
  assign wire14 = {wire9, ({wire8} >>> wire6[(1'h1):(1'h0)])};
  assign wire15 = (wire10[(1'h0):(1'h0)] ?
                      $unsigned($signed($unsigned({wire6}))) : $unsigned((|wire11[(3'h7):(3'h7)])));
  assign wire16 = (wire7 ?
                      ($unsigned(wire11[(2'h3):(2'h2)]) > $signed(wire12)) : wire12[(3'h5):(2'h2)]);
  module17 #() modinst44 (wire43, clk, wire6, wire15, wire7, wire9, wire13);
  assign wire45 = $signed(($unsigned(wire16) ?
                      wire6[(4'he):(3'h7)] : wire11[(1'h0):(1'h0)]));
  module46 #() modinst63 (.wire50(wire13), .wire48(wire10), .wire47(wire8), .wire51(wire6), .clk(clk), .y(wire62), .wire49(wire12));
  module64 #() modinst102 (.clk(clk), .wire67(wire9), .wire68(wire16), .y(wire101), .wire66(wire8), .wire65(wire10));
  assign wire103 = (|wire16);
  assign wire104 = ({wire101[(1'h1):(1'h1)], wire14} ?
                       $unsigned(wire9[(1'h1):(1'h0)]) : $signed((wire101[(2'h3):(1'h1)] ?
                           (-$signed(wire10)) : (|(~|wire43)))));
  always
    @(posedge clk) begin
      reg105 <= ({$unsigned($signed(wire15[(4'hb):(3'h5)])),
              wire101[(1'h1):(1'h0)]} ?
          wire12[(4'hb):(4'h9)] : $unsigned($unsigned({wire15,
              (wire15 ^~ (8'ha5))})));
      reg106 <= {$unsigned((($signed(wire11) << (wire10 ?
              wire103 : (8'ha3))) < wire16[(2'h2):(1'h0)])),
          $signed((^(^reg105[(4'ha):(4'h9)])))};
      reg107 <= $signed(wire12);
      if ({wire104, (8'hb0)})
        begin
          reg108 <= $unsigned((|wire103));
        end
      else
        begin
          reg108 <= wire6[(4'hb):(2'h2)];
        end
      reg109 <= wire43[(1'h0):(1'h0)];
    end
  assign wire110 = wire10[(1'h1):(1'h0)];
endmodule

module module64
#(parameter param100 = (({({(8'hb3), (8'haf)} ? {(8'hb4), (8'hb1)} : ((8'hae) != (8'ha5)))} ^~ {(((8'ha4) ? (8'hbc) : (8'h9e)) <= ((8'hbc) >> (8'ha2)))}) ? (((-(~^(8'haa))) >>> (-((8'hbd) ? (8'hb4) : (7'h41)))) - {(^~(~&(8'ha6))), ((~&(8'hb9)) ? ((8'hbc) ? (8'hb8) : (7'h40)) : ((8'hb2) < (8'hbc)))}) : (+((((8'hb5) && (8'h9f)) ? ((8'ha5) ? (8'h9d) : (8'hb1)) : (^~(8'ha2))) ? (((8'ha7) ? (7'h43) : (7'h43)) ? {(8'haf), (7'h42)} : (~&(8'hb2))) : (~&(^~(8'hb8)))))))
(y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire68;
  input wire signed [(3'h7):(1'h0)] wire67;
  input wire signed [(4'hc):(1'h0)] wire66;
  input wire [(2'h2):(1'h0)] wire65;
  wire [(5'h12):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire97;
  wire signed [(2'h2):(1'h0)] wire96;
  wire signed [(4'ha):(1'h0)] wire95;
  wire [(4'h9):(1'h0)] wire84;
  wire signed [(2'h3):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire76;
  wire [(5'h11):(1'h0)] wire75;
  wire signed [(2'h3):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire69;
  reg signed [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg [(4'hd):(1'h0)] reg91 = (1'h0);
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire84,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
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
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire69 = wire68[(2'h2):(1'h0)];
  assign wire70 = $signed({wire68, wire67[(3'h4):(3'h4)]});
  assign wire71 = (((-$unsigned((~|wire68))) ?
                          (~|wire68) : {(wire67 << $signed(wire70)), wire68}) ?
                      $signed((~(!$unsigned(wire70)))) : (~|wire70[(1'h0):(1'h0)]));
  assign wire72 = ((&wire70) ? wire67 : wire65);
  assign wire73 = (^~(wire71[(4'hc):(4'h9)] ^~ wire70));
  assign wire74 = ($unsigned(($unsigned((wire67 ? wire68 : wire67)) ?
                          (~$signed((8'hb2))) : (&{wire73}))) ?
                      $signed({(wire66[(1'h0):(1'h0)] == (wire65 ?
                              wire72 : (8'ha7)))}) : ($signed(wire65) ~^ wire65));
  assign wire75 = {((((wire69 | wire66) >> $unsigned(wire74)) ?
                              wire72[(4'h9):(3'h6)] : $signed((wire65 ?
                                  (8'hbf) : wire71))) ?
                          $signed($unsigned((-wire68))) : $signed($unsigned((~&wire66)))),
                      $unsigned((wire67[(3'h7):(2'h3)] ?
                          (wire69[(2'h2):(1'h0)] && $signed(wire73)) : wire73))};
  assign wire76 = $signed(wire66);
  assign wire77 = (^~(wire75 ? $signed(wire74[(1'h1):(1'h0)]) : (!wire72)));
  assign wire78 = ((~&(&wire68)) ?
                      ({{(|(8'hb5))}} ?
                          ($signed((wire75 ? wire73 : (8'hba))) ?
                              $signed(wire72) : wire77) : wire69[(3'h5):(3'h5)]) : (+{(~|$signed(wire68))}));
  always
    @(posedge clk) begin
      reg79 <= wire68;
      reg80 <= ($unsigned((($signed((7'h44)) ?
          (wire72 >> (8'haa)) : $signed(wire70)) && wire73[(4'ha):(1'h1)])) << $unsigned(wire72[(4'h8):(2'h2)]));
      reg81 <= (wire74 ?
          (^~(^~$unsigned($unsigned(reg79)))) : wire65[(2'h2):(1'h0)]);
      reg82 <= (~|{(((-wire76) * (^reg81)) << wire76[(3'h4):(2'h2)])});
      reg83 <= wire66;
    end
  assign wire84 = (~^(&wire67[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      if (($signed(($unsigned($unsigned(wire67)) ?
              ($unsigned(reg81) < $signed(wire69)) : ((wire76 ?
                  wire67 : (8'ha2)) || $unsigned(wire74)))) ?
          ($unsigned($unsigned($signed(wire77))) ?
              wire68 : (~reg83)) : wire84[(4'h9):(2'h2)]))
        begin
          reg85 <= $unsigned({((wire69[(3'h6):(1'h1)] * wire76) ?
                  reg79 : (reg79 ? (+wire76) : (&wire70))),
              $unsigned($unsigned(wire69[(3'h5):(2'h2)]))});
          reg86 <= {reg80};
          reg87 <= {{(reg79[(4'hb):(1'h0)] > {$signed(wire65)})}};
          reg88 <= $unsigned((wire76[(2'h3):(1'h1)] == (+wire84)));
          reg89 <= (((~|(((8'hbb) - reg81) ?
                  $unsigned(wire78) : $unsigned(wire75))) ?
              {((wire74 >= wire74) ^~ (wire72 ~^ reg87))} : $unsigned($unsigned((^wire75)))) | ($signed((-$unsigned(wire73))) ?
              reg80[(4'hc):(1'h1)] : ((~|$signed(reg82)) ?
                  wire70[(1'h0):(1'h0)] : $unsigned(((8'ha2) && wire67)))));
        end
      else
        begin
          reg85 <= wire70[(2'h3):(2'h2)];
          reg86 <= wire84;
        end
      reg90 <= reg79[(4'h9):(1'h1)];
      reg91 <= wire74;
    end
  always
    @(posedge clk) begin
      reg92 <= wire70[(1'h0):(1'h0)];
      reg93 <= wire67[(3'h7):(2'h3)];
      reg94 <= ($unsigned(reg85) ?
          $unsigned({(8'had)}) : wire73[(4'h8):(3'h7)]);
    end
  assign wire95 = (reg87[(2'h3):(1'h1)] << (+reg82[(4'h9):(1'h0)]));
  assign wire96 = $unsigned($signed(reg89));
  assign wire97 = $signed($signed($unsigned(((reg82 ? reg91 : reg90) ?
                      $unsigned((7'h41)) : (wire68 ? wire76 : reg93)))));
  assign wire98 = (reg92 ?
                      $unsigned(wire67) : ((~^$unsigned((reg79 ?
                          reg83 : wire77))) <= (wire67[(2'h3):(2'h2)] ?
                          ((wire65 ?
                              reg92 : wire96) ^ wire71[(4'hb):(2'h3)]) : $signed($signed(wire72)))));
  assign wire99 = reg81[(4'h8):(3'h4)];
endmodule

module module46
#(parameter param60 = ((|(-{((8'hb0) >>> (8'hb4)), ((8'hbe) ? (8'hb1) : (8'ha9))})) >> (((!(~|(8'ha0))) & (((8'h9f) ? (8'hb7) : (8'hae)) ? ((8'ha3) ? (8'hb2) : (8'h9d)) : ((7'h40) ? (8'hb2) : (8'haf)))) <<< (({(8'hb9), (8'ha1)} ? ((8'h9d) ^ (8'ha0)) : ((8'hb6) ? (8'hb7) : (8'ha3))) ? ({(8'hb7)} || (&(8'hae))) : (~^((7'h43) ? (8'hb1) : (8'had)))))), 
parameter param61 = (~^{(^~((param60 ? param60 : param60) ? param60 : param60)), (+{((8'hb9) == param60)})}))
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire51;
  input wire signed [(5'h12):(1'h0)] wire50;
  input wire [(5'h13):(1'h0)] wire49;
  input wire [(4'hc):(1'h0)] wire48;
  input wire [(4'h9):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire56;
  wire [(4'hf):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire54;
  wire [(4'hb):(1'h0)] wire53;
  wire [(4'ha):(1'h0)] wire52;
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 (1'h0)};
  assign wire52 = {wire48[(4'ha):(3'h4)]};
  assign wire53 = (|((&(wire47 & wire48)) ?
                      (&$unsigned({wire52, wire47})) : wire52[(1'h0):(1'h0)]));
  assign wire54 = (~|($signed(((wire50 >= wire50) ?
                          (wire51 ? (8'h9d) : wire49) : wire48)) ?
                      {({(8'hab), wire48} ~^ $unsigned(wire49)),
                          {(&wire53)}} : $signed(wire50[(3'h5):(3'h4)])));
  assign wire55 = wire48[(2'h3):(1'h1)];
  assign wire56 = $signed($signed(wire53));
  assign wire57 = $signed(wire48[(1'h1):(1'h1)]);
  assign wire58 = $unsigned($signed(wire48[(3'h5):(2'h2)]));
  assign wire59 = wire52;
endmodule

module module17
#(parameter param41 = (+((-{((8'ha9) ? (8'hb6) : (8'haf))}) & ((+((8'hab) > (8'haf))) + {(-(8'h9e))}))), 
parameter param42 = param41)
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire22;
  input wire signed [(4'hc):(1'h0)] wire21;
  input wire [(5'h11):(1'h0)] wire20;
  input wire [(4'he):(1'h0)] wire19;
  input wire [(4'hb):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire35;
  wire signed [(5'h10):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire23 = $signed(wire21);
  assign wire24 = $unsigned(wire19);
  assign wire25 = {(~|wire23),
                      (($signed((^wire21)) ?
                              $unsigned((wire20 << wire18)) : (!$signed((7'h40)))) ?
                          {{wire23[(5'h11):(1'h1)]}} : (wire20[(3'h5):(3'h4)] ?
                              {$unsigned(wire19)} : (~&(8'haf))))};
  assign wire26 = (wire19 ?
                      wire23 : (wire24 ?
                          (wire23 >>> wire20[(4'hb):(2'h3)]) : {(|(wire25 | wire22))}));
  assign wire27 = $unsigned(wire26[(4'hb):(1'h0)]);
  always
    @(posedge clk) begin
      reg28 <= wire21;
      reg29 <= ($unsigned((reg28 * wire27)) || ($signed(((~&wire25) >> (8'hae))) >= $signed($signed($signed((8'hb6))))));
      reg30 <= (-$signed((&((wire26 - wire19) * (wire25 ? wire23 : wire18)))));
    end
  assign wire31 = wire25[(3'h5):(3'h5)];
  assign wire32 = wire23[(4'ha):(2'h2)];
  assign wire33 = (reg30[(1'h1):(1'h1)] * $unsigned((!((wire21 <<< wire22) ?
                      reg30 : reg28))));
  assign wire34 = reg28;
  assign wire35 = {(wire34 ^~ wire27), (!$signed($signed($signed(wire21))))};
  assign wire36 = (~^reg29);
  assign wire37 = wire27[(2'h3):(2'h3)];
  assign wire38 = reg29[(3'h4):(1'h1)];
  assign wire39 = (-(8'hbf));
  assign wire40 = $signed((wire19[(2'h2):(1'h1)] | wire34));
endmodule

module module137
#(parameter param151 = (^~(!{(((8'hb8) ? (8'hbb) : (7'h42)) * {(8'ha5)}), (((8'haf) ? (8'hbd) : (8'ha6)) ? (^(8'hbc)) : {(8'hb2)})})))
(y, clk, wire141, wire140, wire139, wire138);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire141;
  input wire [(4'ha):(1'h0)] wire140;
  input wire signed [(5'h13):(1'h0)] wire139;
  input wire signed [(4'he):(1'h0)] wire138;
  wire signed [(5'h12):(1'h0)] wire150;
  wire signed [(4'ha):(1'h0)] wire149;
  wire signed [(5'h11):(1'h0)] wire148;
  wire signed [(4'h8):(1'h0)] wire147;
  wire signed [(4'hd):(1'h0)] wire146;
  wire signed [(4'hc):(1'h0)] wire145;
  wire signed [(3'h7):(1'h0)] wire144;
  wire [(4'ha):(1'h0)] wire143;
  wire signed [(3'h6):(1'h0)] wire142;
  assign y = {wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 (1'h0)};
  assign wire142 = ((~|(~&$unsigned((-wire140)))) - $unsigned((^~(~(wire138 ?
                       wire139 : wire141)))));
  assign wire143 = (($unsigned(($signed(wire138) ? (^~wire139) : wire142)) ?
                       $unsigned({(wire141 ?
                               wire141 : wire140)}) : $signed($signed(wire140))) ^ {wire138[(1'h0):(1'h0)],
                       (~|$signed($unsigned(wire140)))});
  assign wire144 = wire143[(1'h1):(1'h0)];
  assign wire145 = (wire140[(2'h2):(1'h0)] ? wire141 : (8'hb6));
  assign wire146 = (&wire139);
  assign wire147 = ($signed((^~wire143)) ?
                       $signed((wire139 ^~ wire146[(2'h2):(1'h0)])) : {wire141});
  assign wire148 = wire142[(2'h2):(1'h0)];
  assign wire149 = (~^$unsigned(wire146));
  assign wire150 = (((wire149[(3'h7):(3'h7)] < $signed(wire144[(3'h5):(1'h0)])) >= wire147) ?
                       wire147 : (wire148[(2'h3):(1'h0)] ?
                           wire143 : $signed($signed((^~wire139)))));
endmodule
