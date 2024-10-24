module top
#(parameter param156 = (^~((((~(8'ha6)) & (~|(8'ha6))) ? (((7'h42) & (8'haf)) ? ((8'hba) ? (8'hb2) : (8'ha9)) : (+(8'ha8))) : (((8'haa) ^~ (8'ha2)) + (~(8'ha6)))) - ((((7'h40) != (8'hac)) != (&(8'hbe))) ? ({(8'hba)} & ((8'ha1) ? (8'hb6) : (8'haf))) : {(~(8'hbb)), ((7'h44) ? (8'hbb) : (8'h9f))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire155;
  wire signed [(3'h6):(1'h0)] wire154;
  wire [(5'h12):(1'h0)] wire153;
  wire [(5'h13):(1'h0)] wire151;
  assign y = {wire155, wire154, wire153, wire151, (1'h0)};
  module5 #() modinst152 (wire151, clk, wire3, wire4, wire0, wire1);
  assign wire153 = ((~&$unsigned($unsigned((+wire4)))) == $unsigned(((((8'hbd) == wire4) < wire3) ?
                       (((8'hac) > wire3) >> wire3[(3'h7):(3'h6)]) : ((|(8'hab)) > $signed(wire2)))));
  assign wire154 = $unsigned((8'had));
  assign wire155 = {$signed(wire154), $signed(wire151)};
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire6;
  input wire [(5'h15):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(2'h3):(1'h0)] wire60;
  wire [(3'h7):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire130;
  reg signed [(5'h13):(1'h0)] reg150 = (1'h0);
  reg [(5'h10):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg148 = (1'h0);
  reg [(3'h6):(1'h0)] reg147 = (1'h0);
  reg [(4'hf):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg145 = (1'h0);
  reg [(4'hd):(1'h0)] reg144 = (1'h0);
  reg [(5'h14):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg141 = (1'h0);
  reg [(4'hd):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg139 = (1'h0);
  reg [(4'ha):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg137 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg134 = (1'h0);
  reg [(3'h5):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg132 = (1'h0);
  assign y = {wire58,
                 wire60,
                 wire61,
                 wire62,
                 wire130,
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
  module10 #() modinst59 (wire58, clk, wire8, wire9, wire6, wire7);
  assign wire60 = $unsigned(wire9[(4'h9):(4'h8)]);
  assign wire61 = $unsigned($signed(wire8));
  assign wire62 = $signed((8'hbc));
  module63 #() modinst131 (.clk(clk), .wire68(wire61), .wire67(wire6), .wire64(wire8), .wire65(wire62), .y(wire130), .wire66(wire7));
  always
    @(posedge clk) begin
      if ($signed(((~(~(wire130 ? wire61 : wire61))) ?
          wire62[(4'h9):(1'h0)] : ((7'h42) ?
              $unsigned({wire58, wire7}) : (~|(-wire9))))))
        begin
          reg132 <= wire130;
          if (reg132[(3'h6):(3'h6)])
            begin
              reg133 <= wire6[(2'h2):(1'h0)];
              reg134 <= (^wire58);
            end
          else
            begin
              reg133 <= reg132[(2'h3):(2'h3)];
              reg134 <= ($unsigned((8'hb3)) == ($signed($unsigned($signed((8'haa)))) ?
                  (wire8[(4'hb):(4'h8)] ?
                      (|(reg134 << wire130)) : {wire130[(1'h0):(1'h0)]}) : wire7));
              reg135 <= ((wire62 ?
                      (~|{wire8[(4'hd):(4'hd)], $unsigned(wire60)}) : wire7) ?
                  (8'hbe) : $unsigned((wire58 < ($signed(wire7) <<< wire130[(1'h1):(1'h0)]))));
            end
          reg136 <= $unsigned({({$signed(wire8)} ?
                  ($signed(wire7) ?
                      $unsigned(wire61) : {wire62}) : wire61[(3'h4):(2'h3)]),
              ({{wire8, wire58}} ? (^reg135) : wire58[(4'he):(4'h8)])});
          reg137 <= $unsigned($signed((wire62[(2'h2):(2'h2)] ?
              (wire130[(2'h2):(1'h0)] ?
                  $signed(reg135) : (^wire130)) : ((-(8'hb5)) ?
                  $signed(wire61) : (reg134 ? wire61 : wire60)))));
          reg138 <= reg135[(3'h4):(2'h2)];
        end
      else
        begin
          reg132 <= (wire62 ?
              (8'hb3) : $signed($signed(({wire130,
                  reg138} ~^ (reg135 < reg138)))));
          reg133 <= $unsigned(wire7);
          reg134 <= (wire7 ^~ reg135[(2'h2):(1'h0)]);
        end
      reg139 <= $signed(wire60[(2'h2):(1'h0)]);
      reg140 <= {((reg139[(3'h6):(3'h6)] && $unsigned(((8'hb3) || (8'h9f)))) ?
              (^((wire61 >> wire130) * $unsigned((8'ha0)))) : (wire60 ?
                  ((8'hbd) ?
                      $unsigned(wire130) : (wire61 * wire61)) : (8'ha0))),
          reg135[(3'h7):(3'h5)]};
      if ($signed(reg136[(4'h8):(3'h7)]))
        begin
          if ($signed((-$unsigned($unsigned(wire62)))))
            begin
              reg141 <= wire62;
              reg142 <= wire130[(3'h7):(3'h6)];
            end
          else
            begin
              reg141 <= $unsigned($signed(reg132));
              reg142 <= reg140;
              reg143 <= (~|wire7);
              reg144 <= $unsigned(($unsigned((8'ha4)) ?
                  $unsigned((&(reg140 ?
                      wire62 : wire61))) : $unsigned($signed((wire61 ?
                      reg134 : (8'ha7))))));
            end
          reg145 <= (($unsigned($unsigned(reg140[(3'h5):(1'h1)])) ?
              (($unsigned(wire9) && (wire58 ^ wire8)) ?
                  (~$signed(wire9)) : wire61[(2'h2):(2'h2)]) : $unsigned({(~wire6),
                  $unsigned(wire130)})) << $unsigned((~|(&(reg132 + (8'hb2))))));
          if ($signed(reg140))
            begin
              reg146 <= (+(wire8 - ($signed(((8'hb8) || (8'ha4))) ?
                  ($unsigned(wire60) ?
                      ((8'hb0) ^~ wire8) : reg136[(2'h3):(2'h2)]) : $unsigned((^~(8'hbf))))));
              reg147 <= (8'hb3);
              reg148 <= reg138;
              reg149 <= $signed($signed(wire6));
            end
          else
            begin
              reg146 <= $signed((($unsigned($unsigned(reg137)) <<< (~&wire62)) ?
                  $unsigned(((wire130 + (7'h41)) ?
                      (reg141 ?
                          reg148 : (8'hab)) : $signed((8'h9e)))) : reg133[(1'h1):(1'h1)]));
              reg147 <= (+reg132[(4'h8):(3'h4)]);
            end
          reg150 <= ({reg135[(3'h5):(2'h2)], $signed(reg145)} + reg145);
        end
      else
        begin
          if ((-(+reg132)))
            begin
              reg141 <= wire58[(4'hd):(4'h8)];
              reg142 <= $signed(reg140);
              reg143 <= wire130;
              reg144 <= ($unsigned((!reg136)) ?
                  {(+reg140[(2'h3):(1'h1)])} : $signed(wire8[(5'h12):(4'h9)]));
              reg145 <= $signed(reg138);
            end
          else
            begin
              reg141 <= (reg141 ?
                  (!(((reg143 || reg145) ?
                      $unsigned((8'ha6)) : ((8'had) ?
                          reg139 : wire7)) - wire61)) : reg147[(1'h1):(1'h0)]);
              reg142 <= $unsigned(wire62);
              reg143 <= reg150[(5'h10):(3'h6)];
              reg144 <= (($signed($signed($unsigned(reg140))) ?
                  reg140[(4'h9):(3'h4)] : $unsigned((&(8'hb0)))) - ({$signed((reg135 ?
                          wire8 : wire62)),
                      (&(reg135 < reg148))} ?
                  $unsigned(reg133) : reg144[(4'hd):(3'h6)]));
            end
          reg146 <= (~&((((reg132 >>> wire58) | reg147) ?
                  $unsigned(reg149) : reg132) ?
              $unsigned($unsigned(reg141[(3'h5):(2'h3)])) : $unsigned(($unsigned((8'hb9)) ?
                  $signed(reg139) : (^~reg134)))));
          reg147 <= reg136;
          reg148 <= $signed($signed($signed(reg145)));
        end
    end
endmodule

module module63
#(parameter param129 = ((+{((|(8'ha3)) ? ((7'h41) ? (8'hbe) : (8'hb9)) : ((8'hbf) ? (8'h9e) : (8'hb6)))}) ? (({((7'h40) != (8'ha6)), (&(8'haa))} || (((8'h9f) << (8'hbc)) ? ((8'hbc) ? (8'hb9) : (8'hb7)) : (~(8'hb9)))) ? ((|((8'hb8) ? (8'hb9) : (8'hb9))) ? (&((8'hba) ? (8'haf) : (8'had))) : (8'hb3)) : (^~{((8'ha3) ^~ (8'h9d)), ((8'hb9) ? (8'hbc) : (8'ha3))})) : ((~|{(8'ha4)}) > {{(^~(7'h41)), ((8'hb3) ? (8'hb8) : (7'h44))}})))
(y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'h2db):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire68;
  input wire [(5'h14):(1'h0)] wire67;
  input wire [(4'hb):(1'h0)] wire66;
  input wire [(4'h8):(1'h0)] wire65;
  input wire signed [(2'h3):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire128;
  wire signed [(4'ha):(1'h0)] wire127;
  wire [(4'ha):(1'h0)] wire126;
  wire [(5'h15):(1'h0)] wire125;
  wire [(4'h8):(1'h0)] wire112;
  wire signed [(5'h15):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire89;
  wire [(5'h12):(1'h0)] wire77;
  wire signed [(3'h7):(1'h0)] wire74;
  wire [(4'h8):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire72;
  wire [(3'h5):(1'h0)] wire71;
  wire [(4'ha):(1'h0)] wire70;
  wire signed [(3'h4):(1'h0)] wire69;
  reg signed [(4'hd):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg122 = (1'h0);
  reg [(5'h13):(1'h0)] reg121 = (1'h0);
  reg [(5'h14):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg113 = (1'h0);
  reg [(5'h12):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(4'hd):(1'h0)] reg106 = (1'h0);
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg103 = (1'h0);
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  reg [(4'h8):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg91 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(4'h8):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg85 = (1'h0);
  reg [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(4'ha):(1'h0)] reg75 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire112,
                 wire90,
                 wire89,
                 wire77,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
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
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg88,
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
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire69 = (~|$unsigned((wire64 >> $signed($signed(wire67)))));
  assign wire70 = (({$unsigned(((8'ha5) ?
                          wire67 : (8'hb9)))} || (8'hbb)) <<< (wire66[(3'h7):(2'h2)] ?
                      wire67[(1'h1):(1'h1)] : (~|$unsigned(wire68))));
  assign wire71 = {{{wire70}, (^wire64[(1'h1):(1'h1)])}, (7'h41)};
  assign wire72 = $signed(($unsigned($signed($signed(wire70))) ?
                      (~(wire69 ^~ (wire65 >= wire68))) : {$signed($signed(wire70))}));
  assign wire73 = (wire72 << (8'ha3));
  assign wire74 = (wire72[(5'h15):(4'h9)] >= $unsigned($unsigned(wire71[(2'h2):(2'h2)])));
  always
    @(posedge clk) begin
      reg75 <= $signed(((!$signed(wire71)) == $unsigned(wire64)));
      reg76 <= (wire64 == wire67[(4'hb):(4'ha)]);
    end
  assign wire77 = $unsigned($signed($signed(wire71[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      reg78 <= wire66[(3'h7):(1'h1)];
      reg79 <= $unsigned({$unsigned($unsigned(wire66[(2'h2):(1'h1)])),
          ({wire68} ?
              reg78 : (((8'had) ? wire70 : wire72) ?
                  (~reg75) : $unsigned(wire64)))});
      reg80 <= (((wire70 * $unsigned(wire71)) == (reg75[(1'h0):(1'h0)] ?
              ($signed((7'h40)) <<< (!wire68)) : (wire68 >>> $signed(reg78)))) ?
          $unsigned($signed({(^wire70)})) : ($unsigned((7'h43)) ?
              wire73[(3'h7):(3'h5)] : ($signed(wire67[(4'ha):(3'h7)]) > $signed((wire67 ?
                  (8'h9f) : (8'hbe))))));
      if ({$unsigned(({(~&wire70),
              wire70[(1'h1):(1'h0)]} >>> ($unsigned(wire64) >= $unsigned(reg78))))})
        begin
          reg81 <= (~&{$signed((8'hb4)),
              $signed(({(8'hb7)} ^~ $unsigned(reg78)))});
        end
      else
        begin
          if (wire67)
            begin
              reg81 <= (~&(reg81[(4'h8):(2'h2)] ?
                  $signed(((wire66 <<< wire65) ?
                      $signed(reg76) : $signed(wire66))) : wire71[(3'h5):(2'h2)]));
            end
          else
            begin
              reg81 <= $signed($unsigned(wire64));
            end
          if ({{($signed((^~(8'hbd))) ? (~^reg80[(3'h7):(2'h3)]) : wire74)}})
            begin
              reg82 <= reg78[(4'h9):(3'h4)];
              reg83 <= {$unsigned(({wire77,
                      wire74[(2'h2):(2'h2)]} + ($unsigned((7'h44)) ?
                      $signed(reg76) : reg80[(2'h3):(1'h1)])))};
              reg84 <= {(((wire71[(1'h1):(1'h1)] > (|reg80)) - ($signed(wire72) ^ $unsigned(reg81))) ?
                      (!$signed(wire77[(4'hf):(4'h9)])) : {{$signed(wire71)}})};
              reg85 <= wire74[(2'h3):(2'h3)];
            end
          else
            begin
              reg82 <= ((~^$unsigned({(wire71 == wire67)})) ^~ {$signed($unsigned((~&wire70)))});
              reg83 <= $unsigned($unsigned($signed((~$unsigned(reg81)))));
            end
        end
    end
  always
    @(posedge clk) begin
      if ((~|reg76[(3'h7):(3'h6)]))
        begin
          reg86 <= ((reg85 ? wire72 : reg83) >>> reg83[(4'ha):(1'h1)]);
        end
      else
        begin
          reg86 <= ({($signed($unsigned(wire67)) ?
                  wire77 : $unsigned({wire69,
                      wire71}))} == wire73[(2'h3):(1'h1)]);
        end
      reg87 <= (reg85[(4'hf):(3'h4)] ?
          (8'hbb) : $unsigned({($signed(wire72) <<< {wire64, reg80}),
              $unsigned($unsigned(reg82))}));
      reg88 <= (wire72[(5'h10):(2'h3)] ?
          ((&reg75) <= $unsigned(wire68)) : wire68[(2'h3):(1'h1)]);
    end
  assign wire89 = {($signed(wire65[(3'h6):(1'h1)]) ?
                          (reg84[(1'h0):(1'h0)] && (~^{reg82,
                              wire66})) : ((-wire67) ?
                              $unsigned($signed(wire70)) : $signed(((8'hbf) | reg79)))),
                      (((^~$signed(wire72)) <<< $signed($signed(reg83))) * ((^~wire65) + {$signed((8'ha1)),
                          $signed((8'had))}))};
  assign wire90 = ((((~^(reg81 == wire67)) ?
                      $unsigned(wire69[(2'h3):(2'h2)]) : $unsigned((7'h43))) && ((wire77 >>> wire73[(3'h5):(3'h4)]) < ($signed(reg76) && wire71))) >>> $signed(((~^(wire67 >> reg85)) == {(reg75 != wire69),
                      reg83[(1'h1):(1'h1)]})));
  always
    @(posedge clk) begin
      if ($signed(wire77))
        begin
          if ({$unsigned((({wire72, wire65} ? (!reg87) : reg80[(4'h8):(1'h1)]) ?
                  wire73[(1'h1):(1'h1)] : ((~reg78) < (wire89 ?
                      (8'ha1) : reg78)))),
              (({reg79[(2'h2):(1'h0)]} ? $signed((reg85 != reg76)) : {reg87}) ?
                  $unsigned(((!reg81) & (&(8'hab)))) : $unsigned($unsigned(wire77[(5'h11):(4'hd)])))})
            begin
              reg91 <= $unsigned(((((8'ha5) || (wire64 ?
                      reg84 : (8'ha2))) - reg86[(2'h2):(2'h2)]) ?
                  $unsigned((~&$signed(reg83))) : reg88[(3'h4):(3'h4)]));
              reg92 <= wire72;
              reg93 <= {({wire77} && (+(reg86 != {wire67})))};
              reg94 <= (~|$unsigned($signed((7'h40))));
            end
          else
            begin
              reg91 <= (~($unsigned($signed((&reg84))) ?
                  wire67 : (reg75[(1'h1):(1'h0)] ^ ((+reg80) ?
                      $unsigned(wire74) : wire89[(4'hc):(3'h4)]))));
            end
          reg95 <= $signed(($unsigned((reg83[(4'hb):(3'h7)] ?
                  (wire65 >> wire89) : (^~(7'h43)))) ?
              ({$unsigned(reg86), (reg93 == reg75)} ?
                  (reg94[(3'h4):(1'h1)] ?
                      $unsigned(reg75) : (8'hab)) : (&reg91[(3'h5):(1'h1)])) : (~&(^~$signed(wire67)))));
          if (reg79)
            begin
              reg96 <= reg84[(1'h0):(1'h0)];
              reg97 <= wire68[(3'h4):(2'h2)];
            end
          else
            begin
              reg96 <= (reg82[(3'h4):(2'h2)] + wire65);
              reg97 <= {$signed((($unsigned((8'hbc)) ?
                          $unsigned(wire74) : wire74[(1'h0):(1'h0)]) ?
                      (7'h44) : $signed((reg75 ? wire69 : wire73))))};
              reg98 <= (8'ha4);
              reg99 <= wire77[(4'hd):(3'h5)];
              reg100 <= reg76[(4'ha):(3'h5)];
            end
          reg101 <= $unsigned({wire70});
        end
      else
        begin
          reg91 <= ($signed(({wire70, ((8'ha8) ? (8'hba) : (8'h9e))} ?
                  reg92[(3'h4):(3'h4)] : ($signed(reg88) ?
                      ((8'hba) && reg76) : {reg83}))) ?
              reg84 : (~&(~&((reg85 ? reg94 : reg83) ?
                  $unsigned(wire72) : $signed(wire70)))));
        end
      reg102 <= wire66;
      if (($signed(wire67[(4'h8):(1'h0)]) + (({$unsigned(wire89)} ?
              reg91 : $signed((reg94 ? reg76 : reg97))) ?
          (|(&(&wire72))) : reg102)))
        begin
          reg103 <= $unsigned(reg82[(3'h5):(3'h5)]);
          reg104 <= reg101[(4'ha):(4'h8)];
        end
      else
        begin
          reg103 <= reg83;
          reg104 <= wire90;
          if (reg95)
            begin
              reg105 <= ((!(((reg94 ? reg76 : reg85) ?
                      (wire89 ? reg86 : wire69) : (wire74 ? reg82 : (7'h40))) ?
                  (reg96[(1'h0):(1'h0)] && {wire66}) : ((reg76 ?
                      (8'hb2) : reg93) & reg100))) >= $signed($signed((-(reg101 > (8'hab))))));
              reg106 <= wire66;
              reg107 <= $signed((reg84 != $signed($signed((&(8'ha5))))));
            end
          else
            begin
              reg105 <= ($signed(((~reg82[(3'h5):(1'h0)]) ?
                  ({wire90,
                      wire67} ^~ (&wire66)) : (wire64 <<< wire66[(4'h9):(3'h6)]))) || (wire64 <<< (~(&(|reg94)))));
              reg106 <= (({$signed(reg83[(4'ha):(1'h0)]),
                  $unsigned((reg99 ?
                      wire65 : reg85))} ^~ (reg81 <= $signed(reg102[(1'h1):(1'h1)]))) == $signed($signed(reg83)));
              reg107 <= (8'hb6);
            end
        end
      if ($signed(reg107[(2'h3):(2'h3)]))
        begin
          reg108 <= ($unsigned({((reg88 - reg84) ? (reg97 * wire69) : (8'hb0)),
              $unsigned((reg99 == reg99))}) || ($signed(reg102[(1'h0):(1'h0)]) >> (((wire73 ?
                      wire66 : (7'h40)) ?
                  reg102[(1'h1):(1'h0)] : (~&reg98)) ?
              $signed($unsigned(reg93)) : (^~(reg102 ? reg79 : wire67)))));
          reg109 <= (+$signed(((!$unsigned((8'hb8))) ?
              wire77[(3'h6):(3'h6)] : (reg107 & (^~reg75)))));
          reg110 <= (+{$signed($unsigned(reg95))});
        end
      else
        begin
          if ((((((~^wire69) ? (wire77 ? reg76 : wire68) : reg81) ?
                  reg80[(2'h3):(2'h3)] : ($signed((8'hbd)) ?
                      $unsigned(wire90) : $unsigned(reg78))) ?
              (($signed(reg81) ?
                  (wire73 > reg85) : (&wire70)) >> (!(~reg78))) : (((reg99 ?
                  reg78 : reg100) * (-reg103)) + $unsigned(reg102[(3'h7):(1'h1)]))) < (reg105[(4'h9):(4'h8)] <= $unsigned({(-reg97)}))))
            begin
              reg108 <= reg96[(3'h6):(1'h1)];
              reg109 <= (8'hbb);
              reg110 <= reg99[(3'h7):(1'h0)];
              reg111 <= (((reg83 >>> reg80[(1'h1):(1'h1)]) ?
                  wire70[(3'h4):(1'h1)] : $signed(((wire70 & reg110) != ((8'ha6) ?
                      wire68 : wire72)))) & $unsigned(($signed((~|reg94)) ?
                  (~(reg99 ? reg85 : wire68)) : $unsigned($signed(reg98)))));
            end
          else
            begin
              reg108 <= {(($unsigned(wire74) >= $signed(reg83[(4'he):(4'hb)])) ?
                      (^~wire69[(2'h2):(1'h1)]) : wire66),
                  ((~wire65[(1'h1):(1'h1)]) < reg93)};
              reg109 <= ((~($unsigned((|reg99)) | $unsigned(reg75))) << $signed($unsigned(reg76)));
              reg110 <= ($unsigned({wire77}) != (~^(({reg79,
                      reg78} - reg104[(3'h7):(1'h1)]) ?
                  $unsigned($signed(reg91)) : (reg102[(3'h7):(1'h1)] ?
                      (8'ha1) : (wire90 ^ (8'hb2))))));
              reg111 <= (({((^~reg79) ^~ {reg91, (8'hbb)}),
                  reg96[(1'h0):(1'h0)]} >>> (!(^{wire77}))) ^~ reg92);
            end
        end
    end
  assign wire112 = ($signed($unsigned((&$unsigned((8'hb0))))) ?
                       ($unsigned(wire90[(3'h7):(3'h7)]) == $unsigned((~&wire70))) : ($signed((!$signed(wire73))) ?
                           ({$unsigned(reg98),
                               $unsigned(reg110)} == $signed({(8'ha7)})) : $signed(wire69)));
  always
    @(posedge clk) begin
      if (wire73[(3'h4):(2'h3)])
        begin
          if ($unsigned(wire73))
            begin
              reg113 <= ({((((8'hb7) ? reg87 : wire69) ?
                      $signed(wire71) : (wire64 ?
                          reg75 : (8'hb3))) & wire73)} >>> $unsigned($signed((&(~&wire77)))));
            end
          else
            begin
              reg113 <= {reg92, {wire72[(2'h3):(2'h3)]}};
              reg114 <= (((&(~^((8'hb5) ? reg99 : reg79))) ?
                  (($unsigned(wire73) * $signed(reg92)) != $unsigned(reg80[(3'h6):(3'h4)])) : ({(wire89 ?
                          reg78 : reg110)} >> $signed(reg75[(1'h1):(1'h1)]))) | $signed({$unsigned(reg94)}));
            end
        end
      else
        begin
          reg113 <= ((((reg106[(1'h1):(1'h1)] ?
                      (-reg78) : reg93) * wire77[(4'hc):(3'h5)]) ?
                  (+((+reg75) << $unsigned(reg83))) : ($signed((reg114 > wire74)) ?
                      ((reg97 < reg75) >= (~reg92)) : {{reg109, reg88}})) ?
              reg75[(2'h2):(2'h2)] : reg114);
        end
      if ({wire90[(4'h9):(4'h9)]})
        begin
          reg115 <= ({(&(|$signed(reg94)))} ?
              (|(&(reg107[(3'h5):(1'h1)] ?
                  reg103 : $unsigned(reg107)))) : $unsigned($signed({$unsigned(reg103)})));
          reg116 <= $signed(reg78);
          reg117 <= (&(^~$unsigned(($unsigned((8'ha6)) >>> (reg106 - (8'ha1))))));
          reg118 <= $signed($unsigned($unsigned($unsigned($unsigned(reg79)))));
        end
      else
        begin
          if ($signed(wire70))
            begin
              reg115 <= wire72[(4'hc):(4'h9)];
              reg116 <= (~{wire89[(3'h7):(3'h4)]});
              reg117 <= reg109[(3'h6):(3'h5)];
            end
          else
            begin
              reg115 <= ((reg93[(4'ha):(3'h6)] ?
                  $unsigned($unsigned((reg116 | reg76))) : $unsigned(reg82[(3'h6):(2'h3)])) < (^(!$signed($unsigned(reg100)))));
              reg116 <= ((!($unsigned($signed(reg79)) < ((^wire90) && (wire66 ?
                  reg101 : reg117)))) - wire90[(5'h12):(3'h4)]);
              reg117 <= ({(8'h9f)} != ((|$signed($unsigned(wire72))) ?
                  {reg88,
                      reg118[(1'h0):(1'h0)]} : $unsigned((|reg76[(3'h5):(3'h4)]))));
            end
          if ($unsigned(((~&((reg86 ?
              reg105 : wire112) * (reg105 < (8'hb8)))) + wire112)))
            begin
              reg118 <= (((wire67 ?
                      {$signed(reg96),
                          ((8'ha5) * reg86)} : reg87[(4'h8):(1'h0)]) ?
                  reg111[(4'hb):(3'h7)] : (^~(^(~reg82)))) ~^ (7'h42));
              reg119 <= $unsigned(wire69[(1'h1):(1'h1)]);
              reg120 <= reg110[(3'h4):(2'h3)];
              reg121 <= ((^{(((7'h40) || reg100) != {reg98})}) ~^ reg103[(4'ha):(3'h4)]);
              reg122 <= ($unsigned(($signed($signed(reg117)) << ($signed((8'ha5)) >> (wire74 || wire64)))) ?
                  $unsigned($signed((reg100[(1'h1):(1'h0)] ?
                      (reg93 + (7'h43)) : reg109[(4'hd):(1'h1)]))) : (^$unsigned(reg101[(4'h8):(3'h5)])));
            end
          else
            begin
              reg118 <= wire73;
              reg119 <= (~&($unsigned(($signed(reg79) + reg121[(1'h1):(1'h1)])) == {(+(wire112 == wire77)),
                  ((reg91 * reg114) ? (reg92 || reg101) : {wire72})}));
              reg120 <= reg79[(2'h2):(1'h0)];
              reg121 <= reg91;
            end
          reg123 <= (((((wire67 ? reg103 : wire64) == {reg103, reg116}) ?
                      $unsigned((reg116 + reg101)) : $signed($unsigned(reg93))) ?
                  ($signed($unsigned(reg116)) <= ($unsigned(wire64) >> reg117)) : reg120[(1'h1):(1'h1)]) ?
              {$signed((^$signed((8'ha2)))),
                  (~^(~&$signed(wire112)))} : wire64);
          reg124 <= reg100;
        end
    end
  assign wire125 = reg121[(3'h7):(1'h0)];
  assign wire126 = $signed(wire112);
  assign wire127 = $signed((($unsigned((reg80 ?
                       wire77 : reg100)) * (((8'ha5) << reg92) > reg120)) & ((~|(reg105 ?
                       reg79 : reg83)) <<< (|(8'hb1)))));
  assign wire128 = wire67[(3'h6):(3'h5)];
endmodule

module module10
#(parameter param57 = (|((({(7'h44)} | {(8'ha5), (8'h9f)}) ? (^(8'h9d)) : (^((7'h40) + (8'ha1)))) ? (~^((~(7'h44)) <<< ((8'ha8) ? (8'hb2) : (8'ha3)))) : ((~((8'ha8) ? (8'hbf) : (8'hac))) == (&((8'hbc) ? (8'hb9) : (7'h42)))))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire14;
  input wire signed [(5'h11):(1'h0)] wire13;
  input wire [(3'h6):(1'h0)] wire12;
  input wire signed [(5'h15):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire46;
  wire signed [(4'he):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire42;
  wire signed [(3'h5):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  assign y = {wire46,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire38,
                 wire37,
                 wire36,
                 wire19,
                 wire16,
                 wire15,
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
                 reg45,
                 reg44,
                 reg39,
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
                 reg20,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire15 = wire13;
  assign wire16 = $unsigned(wire15);
  always
    @(posedge clk) begin
      reg17 <= $unsigned((!wire15[(4'ha):(4'h9)]));
      reg18 <= $unsigned(($unsigned((|(wire15 ?
          (7'h44) : wire12))) >>> ((((8'hb6) > wire15) ^ (~^wire13)) ^~ (^~wire15))));
    end
  assign wire19 = ((~^$signed($unsigned(wire11[(2'h2):(1'h0)]))) ?
                      wire13[(4'h9):(4'h8)] : wire13[(4'hd):(3'h7)]);
  always
    @(posedge clk) begin
      reg20 <= $signed(((((wire15 ? wire11 : wire14) + (|reg18)) ?
              (wire12[(1'h0):(1'h0)] ?
                  (wire19 == wire19) : wire15[(4'hc):(3'h7)]) : $unsigned((wire15 ?
                  reg17 : wire13))) ?
          wire12 : ((~wire11) & wire12[(3'h6):(3'h5)])));
      reg21 <= $signed((&$signed($unsigned(wire12))));
      reg22 <= $signed($signed($unsigned(($signed(reg21) ?
          $signed(wire19) : $signed(wire15)))));
      reg23 <= $signed(reg21[(3'h4):(1'h0)]);
      if (wire11[(3'h4):(1'h1)])
        begin
          if (reg18)
            begin
              reg24 <= $unsigned(((~|$unsigned((reg21 && wire12))) > ($signed((wire11 ?
                      reg22 : wire11)) ?
                  $unsigned(reg22[(1'h1):(1'h1)]) : ((reg23 ?
                      wire11 : wire15) != (reg18 ? wire16 : reg17)))));
              reg25 <= wire19[(4'hc):(4'hc)];
            end
          else
            begin
              reg24 <= $signed($signed((|$unsigned($signed(reg24)))));
              reg25 <= ((~reg20) ~^ ($unsigned($unsigned((+reg18))) * $unsigned(((wire13 < reg25) ?
                  (8'h9e) : (-reg21)))));
              reg26 <= $unsigned($signed(reg24));
              reg27 <= $unsigned($signed((wire19[(3'h5):(3'h5)] >= $signed((reg24 ?
                  reg24 : reg17)))));
              reg28 <= wire13[(4'hf):(4'hd)];
            end
          reg29 <= {($unsigned(($unsigned(reg28) ^ {reg21})) ?
                  {((~reg20) - (reg28 ?
                          wire15 : reg20))} : $signed($unsigned((reg27 ?
                      reg17 : wire19)))),
              $unsigned(reg25)};
          if ((-(~&$signed(($unsigned(wire15) == (wire19 ? reg24 : reg26))))))
            begin
              reg30 <= ($unsigned(reg17) ?
                  {({reg23, $signed(wire19)} ?
                          reg18[(1'h1):(1'h1)] : $unsigned($signed(reg27)))} : (^~(((wire13 >>> reg22) >> (reg20 <= wire12)) ?
                      ($unsigned(wire14) >>> wire11[(2'h3):(1'h0)]) : (wire12 ?
                          reg26 : (wire16 ? reg21 : reg24)))));
              reg31 <= (reg30[(2'h3):(1'h1)] == wire11);
              reg32 <= wire16[(1'h0):(1'h0)];
              reg33 <= $signed($signed(($unsigned($unsigned(reg22)) <<< {$signed(reg29),
                  $unsigned(reg30)})));
              reg34 <= $unsigned(reg33[(4'h8):(3'h5)]);
            end
          else
            begin
              reg30 <= wire16;
              reg31 <= {$signed(reg20[(2'h3):(1'h0)]),
                  (+($signed({wire16, wire16}) ?
                      ($unsigned(reg33) ?
                          (reg32 * reg34) : (wire16 - reg28)) : ($unsigned(reg23) ?
                          reg34 : reg30)))};
            end
          reg35 <= (reg32[(1'h0):(1'h0)] ?
              $signed({(reg17[(3'h6):(2'h3)] <<< $unsigned(reg28))}) : reg22[(1'h1):(1'h0)]);
        end
      else
        begin
          if ((^$unsigned(reg26)))
            begin
              reg24 <= $unsigned(reg33[(1'h0):(1'h0)]);
              reg25 <= (reg21[(2'h3):(1'h1)] >= reg22[(1'h1):(1'h0)]);
              reg26 <= ({reg18[(1'h0):(1'h0)], (8'h9d)} ?
                  $unsigned($unsigned((reg18 || $signed(wire11)))) : $signed($signed((reg21[(4'hd):(1'h0)] < (wire19 ?
                      (8'hb2) : reg17)))));
              reg27 <= reg29;
            end
          else
            begin
              reg24 <= ($signed(reg35[(1'h0):(1'h0)]) >= ($signed($unsigned($unsigned(wire12))) ?
                  reg34[(1'h0):(1'h0)] : reg18));
              reg25 <= ($signed(($signed({reg35}) <<< ($unsigned(reg22) ?
                  $unsigned(wire14) : reg33))) & (((^~$signed(reg26)) ?
                  {(8'hb7), reg35} : (~reg27[(2'h2):(1'h0)])) | (((wire14 ?
                  reg34 : (8'ha2)) & (reg24 <= reg18)) >>> reg32)));
              reg26 <= (!(($unsigned(reg26) * (^(reg33 ? reg30 : reg27))) ?
                  ((7'h44) < ($unsigned((8'hb0)) > (reg35 >>> (8'hbf)))) : $unsigned({wire12})));
            end
          reg28 <= $signed(((($signed(reg21) ~^ (reg30 ~^ reg18)) ?
              {(reg33 ? wire13 : reg30),
                  (8'hb8)} : $signed((reg26 & reg17))) > {((reg32 & reg33) ?
                  $unsigned((7'h41)) : wire11[(4'h9):(2'h2)])}));
          if ((reg21[(4'h8):(3'h5)] * ($unsigned($unsigned((reg18 ?
              reg35 : reg27))) + reg26[(4'hb):(4'ha)])))
            begin
              reg29 <= reg20;
              reg30 <= $unsigned(reg25[(4'h8):(1'h0)]);
            end
          else
            begin
              reg29 <= reg18[(3'h7):(3'h5)];
              reg30 <= (reg22[(1'h1):(1'h0)] ?
                  reg23[(2'h3):(1'h1)] : (&(($unsigned(wire12) ?
                      ((8'hac) >= reg35) : {reg24,
                          reg25}) < ($unsigned(wire13) > (reg35 ?
                      (8'hbd) : (8'had))))));
              reg31 <= reg24[(1'h1):(1'h1)];
              reg32 <= ((((^reg31[(1'h1):(1'h0)]) ?
                          $signed((^~(8'hae))) : reg33) ?
                      reg35[(1'h0):(1'h0)] : {(reg32[(1'h0):(1'h0)] >> reg26),
                          (^~$signed((8'ha0)))}) ?
                  (((!reg31) >> $unsigned((wire19 == reg20))) <<< reg17) : (+$unsigned((!(~&reg20)))));
            end
          if ((~|$signed($signed({((8'hb2) ? reg20 : (8'ha0))}))))
            begin
              reg33 <= ($unsigned((reg29[(4'h9):(3'h4)] ?
                  reg23[(3'h4):(2'h3)] : (^~reg25[(3'h5):(3'h5)]))) >> $signed(((8'hba) >= $unsigned((reg34 << reg21)))));
              reg34 <= {$signed(({$signed(reg33),
                      wire15} < ($unsigned(reg32) <<< $unsigned(reg35)))),
                  (-wire13[(3'h5):(3'h4)])};
              reg35 <= (((!$unsigned((wire15 ? reg29 : reg29))) ?
                      wire16 : reg24) ?
                  {(reg20 ? reg21[(4'he):(4'hb)] : (!(wire13 ^~ reg18))),
                      (reg34 ?
                          reg22 : (reg21[(2'h2):(1'h1)] ?
                              (reg25 ?
                                  (8'haa) : reg30) : $signed((8'h9d))))} : reg21[(4'h8):(3'h4)]);
            end
          else
            begin
              reg33 <= wire12;
              reg34 <= $signed($signed(reg32));
              reg35 <= ($unsigned((8'ha6)) ?
                  $signed((((wire13 + reg24) | ((8'hbd) ?
                      (8'ha3) : wire12)) >= ($unsigned(wire14) ?
                      reg27[(1'h0):(1'h0)] : (+wire13)))) : ($signed(wire12[(2'h3):(2'h2)]) ?
                      wire15[(1'h1):(1'h1)] : $signed($unsigned((reg35 ^ reg33)))));
            end
        end
    end
  assign wire36 = $unsigned($signed({reg34[(5'h10):(1'h1)],
                      (reg17 ^~ (wire11 ? (8'ha2) : wire19))}));
  assign wire37 = {{wire36[(5'h11):(3'h4)]}};
  assign wire38 = $unsigned({(~&$unsigned(reg20[(3'h7):(3'h6)])),
                      ((^~(!(8'hbb))) ~^ ({(7'h41), wire11} ?
                          reg31 : (&wire15)))});
  always
    @(posedge clk) begin
      reg39 <= (8'hba);
    end
  assign wire40 = $unsigned({$signed({(!wire37)})});
  assign wire41 = wire16;
  assign wire42 = $signed(reg34);
  assign wire43 = ($signed(wire16[(4'he):(4'ha)]) ?
                      reg39 : ((8'haa) >>> wire36));
  always
    @(posedge clk) begin
      reg44 <= ($unsigned((~|reg30)) ?
          ((wire16 == $signed((wire37 * reg32))) ?
              ($signed($unsigned(wire13)) <<< (8'ha9)) : reg18[(1'h1):(1'h1)]) : reg22[(1'h0):(1'h0)]);
      reg45 <= wire16[(3'h4):(2'h3)];
    end
  assign wire46 = {$signed($signed((wire12[(2'h3):(2'h2)] >> (reg24 ?
                          reg27 : (8'hae)))))};
  always
    @(posedge clk) begin
      reg47 <= (~(&reg24[(3'h5):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg48 <= $signed((~^(8'ha8)));
      reg49 <= reg20[(4'h8):(3'h6)];
      reg50 <= ({(reg18[(1'h1):(1'h0)] <<< ($signed(wire41) ?
              (~|reg29) : {reg24, (8'hb1)}))} + ({($unsigned(wire16) ?
              $unsigned(wire13) : reg48),
          $unsigned((reg31 + reg20))} && (&wire11)));
      reg51 <= (8'h9d);
      if ((reg34 ?
          ($unsigned(wire12[(2'h3):(1'h0)]) == (8'haf)) : $unsigned(wire15)))
        begin
          reg52 <= $unsigned((reg28 >> (reg29[(3'h5):(2'h3)] ^~ $unsigned((&wire42)))));
        end
      else
        begin
          if (reg20[(2'h2):(1'h0)])
            begin
              reg52 <= (8'ha6);
              reg53 <= $signed(reg24[(4'ha):(3'h5)]);
              reg54 <= ($unsigned($signed(reg39)) ?
                  $unsigned($unsigned(wire46[(2'h3):(2'h2)])) : reg48[(2'h3):(1'h1)]);
              reg55 <= $signed((~|wire37));
              reg56 <= $unsigned((($signed((reg32 ?
                  reg22 : reg33)) ^~ reg48[(3'h5):(2'h3)]) > (-(~|$signed(wire38)))));
            end
          else
            begin
              reg52 <= ($signed({$unsigned((reg52 ? reg24 : (8'haf)))}) ?
                  ($unsigned(($signed(wire46) ?
                      (reg24 ?
                          reg48 : (8'ha8)) : $signed(wire38))) || (~&reg51)) : reg33);
              reg53 <= ((reg25 == $unsigned($unsigned(wire13[(4'hd):(1'h1)]))) == ($signed((!$unsigned(reg29))) ?
                  reg48 : reg17));
            end
        end
    end
endmodule
