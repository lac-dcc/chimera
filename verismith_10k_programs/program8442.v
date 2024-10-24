module top
#(parameter param167 = (~|((|((8'hb5) || {(8'hb7)})) || ({{(8'hae)}} << (((8'hb5) < (8'hb1)) ? {(8'hb8)} : {(8'hac), (8'hba)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire166;
  wire [(5'h12):(1'h0)] wire165;
  wire signed [(3'h4):(1'h0)] wire164;
  wire signed [(4'hb):(1'h0)] wire163;
  wire [(5'h12):(1'h0)] wire159;
  wire signed [(4'ha):(1'h0)] wire158;
  wire [(2'h2):(1'h0)] wire157;
  wire [(5'h10):(1'h0)] wire156;
  wire [(5'h15):(1'h0)] wire149;
  reg [(3'h4):(1'h0)] reg162 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg160 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg155 = (1'h0);
  reg [(5'h15):(1'h0)] reg154 = (1'h0);
  reg [(5'h14):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg152 = (1'h0);
  reg [(4'hf):(1'h0)] reg151 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire149,
                 reg162,
                 reg161,
                 reg160,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 (1'h0)};
  module5 #() modinst150 (.clk(clk), .y(wire149), .wire6(wire4), .wire7(wire0), .wire9(wire2), .wire8(wire3));
  always
    @(posedge clk) begin
      if (wire1)
        begin
          if ((~(wire4[(1'h1):(1'h1)] ?
              ((wire1[(2'h2):(1'h1)] <<< (wire4 ?
                  wire4 : (8'ha9))) || (~(wire3 ^~ wire4))) : wire3)))
            begin
              reg151 <= wire4[(4'h9):(3'h7)];
              reg152 <= $unsigned(($signed($signed((wire0 ?
                      (8'hac) : wire149))) ?
                  (wire1[(4'h8):(3'h5)] ?
                      $unsigned($signed(wire3)) : (wire4 ?
                          (wire2 ?
                              wire0 : (8'hbb)) : (wire2 | reg151))) : wire0[(4'hc):(4'hb)]));
              reg153 <= $unsigned($unsigned($signed((+(reg151 ?
                  wire149 : (8'hbc))))));
            end
          else
            begin
              reg151 <= ({reg152[(3'h6):(1'h0)],
                  $unsigned((|(+wire2)))} >>> wire149);
              reg152 <= $unsigned($unsigned((~&(~^(wire1 == wire149)))));
              reg153 <= {(&(+(^wire149))), wire149};
              reg154 <= wire4;
              reg155 <= $signed(wire1[(1'h1):(1'h0)]);
            end
        end
      else
        begin
          reg151 <= $signed(reg152[(4'ha):(1'h1)]);
          reg152 <= $unsigned(($unsigned(((wire149 ? reg152 : reg153) ?
                  ((8'h9e) ? reg155 : wire0) : wire0)) ?
              {$unsigned((~^reg152)),
                  {$unsigned(wire149),
                      (wire2 <<< wire2)}} : (~^{$unsigned(reg155)})));
          reg153 <= ((7'h44) ? reg153 : $signed(wire3));
          reg154 <= (8'ha3);
        end
    end
  assign wire156 = $signed(((((wire0 <<< wire1) ? reg152 : ((8'h9d) - wire3)) ?
                       $unsigned((^~reg153)) : wire149[(3'h7):(3'h4)]) < (8'hb2)));
  assign wire157 = (8'h9e);
  assign wire158 = (+(~$unsigned(wire157)));
  assign wire159 = ((($unsigned((-wire3)) >>> (((8'hb5) ? reg151 : wire3) ?
                           $signed((8'had)) : (!wire157))) | reg152) ?
                       ((7'h44) ?
                           $unsigned((+$unsigned((8'hb0)))) : reg152[(3'h4):(3'h4)]) : reg153[(4'hf):(4'hd)]);
  always
    @(posedge clk) begin
      reg160 <= (~&wire3[(3'h7):(2'h3)]);
      reg161 <= reg153;
      reg162 <= wire156;
    end
  assign wire163 = ({((~^wire156[(4'h9):(4'h8)]) ?
                           wire159[(4'hf):(4'hb)] : reg153[(3'h7):(3'h4)]),
                       reg151} >> wire157);
  assign wire164 = {(wire157[(1'h0):(1'h0)] ?
                           (wire1[(1'h0):(1'h0)] - (8'ha0)) : {((~&reg154) >= {reg162,
                                   reg151})})};
  assign wire165 = $signed((((-$signed(wire158)) <= reg162) ?
                       ((|(reg153 ?
                           wire158 : wire163)) * wire163[(4'h8):(3'h4)]) : wire0));
  assign wire166 = (((((wire164 ? wire2 : (8'hba)) ?
                       (wire149 && (8'ha6)) : (~^reg160)) & ($unsigned(reg162) || $signed(reg153))) || ((^~reg151) ?
                       $unsigned($unsigned(wire149)) : reg153[(3'h4):(2'h2)])) << ({($signed(wire149) ?
                           (wire3 ? (8'hb9) : reg153) : (reg151 < wire165)),
                       (|(wire1 < wire164))} ~^ wire164[(2'h2):(1'h1)]));
endmodule

module module5
#(parameter param147 = ((((((7'h42) ? (8'hb8) : (8'hac)) - {(8'ha2), (8'hab)}) ? ((^~(8'hb7)) == ((8'hb7) ? (8'hbe) : (7'h42))) : ((^~(8'ha7)) ? ((8'haa) ? (8'haa) : (8'hb2)) : {(7'h40)})) ? ((-((8'hb9) == (8'ha0))) >= (+((7'h44) >> (8'hb5)))) : ((((8'ha2) == (8'hb7)) ? (^(8'hb9)) : (^~(8'hb7))) | (((8'h9f) > (8'haf)) <<< {(8'ha2), (8'hb3)}))) <<< (((((8'hac) ? (8'hba) : (8'hbc)) ? {(8'h9e)} : ((8'ha9) ? (8'hb9) : (8'hbf))) - (^~(&(8'ha6)))) ? (((-(8'hb3)) ? ((8'haf) <<< (8'hb0)) : ((8'hba) ? (8'ha2) : (7'h43))) ? (((8'hb4) ? (8'hac) : (8'ha9)) << ((8'hbe) <<< (8'hb7))) : (((7'h43) ^ (7'h40)) < ((8'hb0) * (8'hb1)))) : (|(~|((8'hb2) & (7'h41)))))), 
parameter param148 = param147)
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire146;
  wire [(4'ha):(1'h0)] wire107;
  wire signed [(4'h9):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire109;
  wire [(4'hd):(1'h0)] wire144;
  assign y = {wire146,
                 wire107,
                 wire64,
                 wire62,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire109,
                 wire144,
                 (1'h0)};
  assign wire10 = wire6;
  assign wire11 = $signed($signed(wire8[(2'h2):(1'h1)]));
  assign wire12 = $signed(((!wire6[(4'h9):(2'h2)]) ?
                      ($signed({wire11}) ?
                          (|$signed(wire8)) : (^~(~&wire10))) : wire7));
  assign wire13 = $signed(((~((wire9 ?
                      wire6 : wire12) | $signed(wire12))) == ($signed(wire6[(3'h4):(1'h0)]) > $unsigned((8'hab)))));
  assign wire14 = $signed({{wire7[(3'h7):(3'h7)],
                          {$unsigned(wire7), $signed(wire12)}}});
  assign wire15 = {$unsigned((~|wire13))};
  module16 #() modinst63 (.clk(clk), .wire19(wire12), .wire17(wire9), .wire20(wire8), .y(wire62), .wire18(wire10));
  assign wire64 = {(~(~&({wire62, wire6} & (wire7 ? wire8 : (8'hba))))),
                      wire15};
  module65 #() modinst108 (.clk(clk), .y(wire107), .wire66(wire13), .wire70(wire6), .wire69(wire14), .wire67(wire11), .wire68(wire7));
  assign wire109 = (($signed((~&(wire8 <= wire12))) ?
                           wire13 : wire11[(4'h9):(3'h7)]) ?
                       $unsigned((wire7[(3'h5):(2'h3)] ?
                           wire13 : ({wire7, (8'hb7)} ?
                               (wire10 ?
                                   wire10 : wire62) : wire11))) : wire13[(5'h15):(1'h1)]);
  module110 #() modinst145 (wire144, clk, wire109, wire107, wire9, wire14, wire62);
  assign wire146 = (wire144 ? (~^(-(~|(wire11 ? wire13 : wire14)))) : (8'hbd));
endmodule

module module110
#(parameter param143 = ((~(~^(((7'h44) ? (8'hb1) : (7'h42)) ? {(8'hb8)} : ((8'ha3) >> (8'hac))))) ? ((8'hbe) <= (({(8'ha5)} ? ((7'h42) ? (8'hb9) : (8'hb2)) : (^~(8'haf))) ? (((7'h42) || (8'ha3)) ? (~&(8'ha9)) : ((8'hb4) ? (8'hbb) : (8'hbb))) : ({(8'h9f)} != {(8'hbd), (8'haf)}))) : {((^~((7'h40) ? (8'hbc) : (8'hb5))) <<< (((8'hbb) == (8'h9e)) ? (~&(7'h43)) : ((8'hbb) ? (8'hbb) : (8'hae))))}))
(y, clk, wire115, wire114, wire113, wire112, wire111);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire115;
  input wire [(4'h9):(1'h0)] wire114;
  input wire signed [(3'h4):(1'h0)] wire113;
  input wire signed [(3'h4):(1'h0)] wire112;
  input wire signed [(5'h10):(1'h0)] wire111;
  wire signed [(3'h5):(1'h0)] wire142;
  wire [(3'h7):(1'h0)] wire141;
  wire [(2'h2):(1'h0)] wire140;
  wire [(2'h2):(1'h0)] wire127;
  wire signed [(3'h6):(1'h0)] wire126;
  wire signed [(5'h15):(1'h0)] wire125;
  wire signed [(3'h5):(1'h0)] wire124;
  wire signed [(4'hb):(1'h0)] wire123;
  wire signed [(5'h13):(1'h0)] wire122;
  wire [(2'h3):(1'h0)] wire121;
  wire [(5'h15):(1'h0)] wire120;
  wire signed [(5'h13):(1'h0)] wire119;
  wire [(4'h9):(1'h0)] wire118;
  wire signed [(5'h13):(1'h0)] wire117;
  wire [(4'hc):(1'h0)] wire116;
  reg signed [(4'hc):(1'h0)] reg139 = (1'h0);
  reg [(4'ha):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg137 = (1'h0);
  reg [(4'ha):(1'h0)] reg136 = (1'h0);
  reg [(4'h9):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg131 = (1'h0);
  reg [(2'h2):(1'h0)] reg130 = (1'h0);
  reg [(3'h5):(1'h0)] reg129 = (1'h0);
  reg [(4'hc):(1'h0)] reg128 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire127,
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
                 (1'h0)};
  assign wire116 = wire111[(2'h2):(2'h2)];
  assign wire117 = $unsigned((~({{wire112, wire113}, (!wire116)} ?
                       $signed(wire113) : (~|(~wire113)))));
  assign wire118 = $signed(($unsigned(wire117) ?
                       wire112 : ($unsigned({wire115, wire114}) ?
                           $unsigned($signed((8'ha4))) : wire115)));
  assign wire119 = wire114[(1'h0):(1'h0)];
  assign wire120 = $signed(wire112);
  assign wire121 = (~&$signed(({(wire115 ? wire118 : wire116),
                       {wire114, wire114}} >= ((wire114 < (8'ha8)) ?
                       wire119 : $signed(wire112)))));
  assign wire122 = wire121[(1'h1):(1'h1)];
  assign wire123 = ($unsigned({{(~&(8'hab)),
                           (!(8'hbe))}}) | $unsigned($unsigned((!wire111))));
  assign wire124 = wire118[(3'h6):(1'h1)];
  assign wire125 = (^~(($signed((~^wire116)) && (^~$unsigned((8'hae)))) | (wire120 ?
                       (-wire116[(4'h8):(4'h8)]) : (&wire121[(1'h0):(1'h0)]))));
  assign wire126 = (((|wire111[(2'h2):(1'h0)]) - $unsigned($signed((wire120 && wire121)))) ~^ ((~&($unsigned((8'hb9)) ?
                           {wire113} : $signed(wire115))) ?
                       ($signed((wire120 ?
                           wire123 : wire125)) || $signed(wire112[(3'h4):(3'h4)])) : (8'h9d)));
  assign wire127 = (^~(((-wire125) ^~ ($unsigned(wire112) ?
                       wire113[(2'h3):(2'h3)] : (wire123 >> wire120))) + ($unsigned((8'ha6)) || (wire115 >> $signed(wire112)))));
  always
    @(posedge clk) begin
      if ((~&(^wire112[(3'h4):(2'h2)])))
        begin
          reg128 <= wire118;
          reg129 <= wire111;
          reg130 <= wire126[(3'h6):(3'h6)];
        end
      else
        begin
          if ($signed({({$signed(wire127), (wire113 + reg129)} ^ reg130),
              {wire125, wire111}}))
            begin
              reg128 <= $signed($signed(wire125[(4'h8):(3'h7)]));
              reg129 <= wire121[(1'h0):(1'h0)];
            end
          else
            begin
              reg128 <= ((wire117 ?
                  wire121[(2'h3):(1'h1)] : (8'ha9)) ^ ((8'hbc) ^ wire127[(1'h0):(1'h0)]));
              reg129 <= ((+(($unsigned(wire118) >>> (wire122 ?
                          wire123 : reg129)) ?
                      $unsigned(wire114[(3'h7):(2'h3)]) : ($signed(wire115) ?
                          (wire118 ? (8'h9c) : (7'h42)) : (reg130 ?
                              wire118 : wire114)))) ?
                  wire118[(3'h4):(2'h3)] : wire122[(4'hd):(3'h4)]);
              reg130 <= (~&$unsigned(wire112));
            end
          reg131 <= $unsigned(($unsigned(({wire111} ?
              $signed(wire112) : (wire125 * reg128))) > wire115));
          reg132 <= $signed(reg131);
          reg133 <= ($signed((wire124[(2'h3):(2'h3)] ?
                  ($unsigned(wire111) ^ (~&wire127)) : wire114)) ?
              $signed(wire118[(1'h0):(1'h0)]) : wire115[(3'h5):(3'h4)]);
          if (reg133)
            begin
              reg134 <= ((^~reg129) ? wire126 : (~&(8'hb9)));
              reg135 <= ({(wire127 >= $unsigned((wire123 ? wire125 : wire112))),
                  reg128} == (wire126 - wire123[(3'h6):(1'h0)]));
            end
          else
            begin
              reg134 <= wire127;
              reg135 <= ($signed((~^{(wire121 ? wire121 : (8'hb3))})) ?
                  wire121[(1'h0):(1'h0)] : (|{($signed(reg128) ?
                          $unsigned(reg128) : {(8'hb6), wire111}),
                      $unsigned(wire127[(1'h0):(1'h0)])}));
              reg136 <= $signed($signed({wire116}));
            end
        end
      reg137 <= $unsigned(wire117[(2'h3):(2'h2)]);
      reg138 <= (reg135[(3'h6):(3'h6)] - $signed($signed($signed($signed(wire117)))));
      reg139 <= wire119;
    end
  assign wire140 = (8'had);
  assign wire141 = (8'hab);
  assign wire142 = $signed($signed({$unsigned($signed(wire140)),
                       ($unsigned((7'h42)) ?
                           {(7'h44), wire121} : {wire127, wire112})}));
endmodule

module module65  (y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire70;
  input wire signed [(2'h3):(1'h0)] wire69;
  input wire signed [(4'he):(1'h0)] wire68;
  input wire signed [(4'hc):(1'h0)] wire67;
  input wire [(4'hb):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire106;
  wire signed [(4'h8):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire98;
  wire [(3'h6):(1'h0)] wire97;
  wire signed [(3'h7):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire95;
  wire [(5'h14):(1'h0)] wire89;
  wire [(5'h15):(1'h0)] wire88;
  wire [(5'h15):(1'h0)] wire87;
  wire signed [(3'h5):(1'h0)] wire86;
  wire signed [(4'ha):(1'h0)] wire85;
  wire signed [(4'hb):(1'h0)] wire73;
  wire signed [(5'h13):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire71;
  reg signed [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg103 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  reg [(4'ha):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(2'h2):(1'h0)] reg83 = (1'h0);
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  assign y = {wire106,
                 wire104,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire73,
                 wire72,
                 wire71,
                 reg105,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
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
  assign wire71 = $signed(wire70[(3'h5):(2'h3)]);
  assign wire72 = ({wire66[(4'h8):(3'h4)],
                      (^wire66)} >> (wire68[(2'h2):(1'h0)] < $unsigned($unsigned({wire67,
                      wire67}))));
  assign wire73 = $unsigned($unsigned(wire70[(4'hd):(4'hd)]));
  always
    @(posedge clk) begin
      reg74 <= wire67;
      reg75 <= ({(~($signed((8'hb3)) ? wire73 : (~|wire66))),
              wire73[(4'hb):(1'h1)]} ?
          $unsigned((~|($signed(wire70) ^ (wire68 ?
              (8'hb2) : wire71)))) : (~^((wire71[(4'hd):(1'h0)] < wire71[(1'h1):(1'h0)]) ~^ {((8'ha2) ?
                  (8'ha6) : wire72),
              (|wire69)})));
      reg76 <= $unsigned(wire70[(4'h8):(1'h1)]);
      if (($signed((-$signed((+reg76)))) ?
          (($signed({reg74}) ?
              $signed($signed(wire72)) : ({wire69, wire69} ?
                  reg76 : $signed((8'haf)))) & $unsigned($unsigned({reg75,
              wire72}))) : {{((~&reg76) < (~|wire69)), wire72[(1'h0):(1'h0)]}}))
        begin
          reg77 <= $signed((wire72 <= wire72[(2'h3):(2'h3)]));
          reg78 <= $signed(wire73);
        end
      else
        begin
          if (reg74[(1'h0):(1'h0)])
            begin
              reg77 <= $signed({((+$signed((8'hb5))) ?
                      wire69[(2'h3):(1'h0)] : $unsigned((wire66 ?
                          reg77 : reg77)))});
              reg78 <= reg77[(2'h2):(2'h2)];
              reg79 <= (-$unsigned(wire67[(4'h9):(3'h7)]));
              reg80 <= (|$signed(({{reg78}} && reg77[(1'h1):(1'h0)])));
              reg81 <= $unsigned(wire70);
            end
          else
            begin
              reg77 <= (reg75 ?
                  $unsigned(wire73) : $signed($signed((~&$signed((8'hba))))));
              reg78 <= {(~&reg77),
                  (|((~|reg77[(2'h2):(1'h1)]) >> {wire72[(1'h0):(1'h0)]}))};
              reg79 <= $unsigned($unsigned(((^(^~(8'h9c))) ?
                  (+(|wire73)) : wire67[(3'h4):(2'h2)])));
              reg80 <= (wire67 != ({$signed($signed(wire71)),
                  (!{reg79})} < (&($signed(wire68) || $signed(reg78)))));
            end
          reg82 <= $signed(reg74[(2'h2):(1'h1)]);
          reg83 <= (reg77[(2'h2):(2'h2)] >> (($unsigned((-(8'h9c))) >>> (8'ha8)) ?
              (wire71 || $signed(wire72)) : $signed(((wire67 ?
                  (8'ha5) : (8'hac)) <<< $signed((8'hb5))))));
        end
      reg84 <= ((((^~$unsigned(wire68)) || $signed($unsigned(reg78))) ?
              {((8'had) > wire69),
                  $signed((wire72 ?
                      (8'ha3) : wire73))} : $signed((reg74[(3'h4):(3'h4)] ^~ (reg76 && wire66)))) ?
          $unsigned({wire68, {((8'ha6) ? reg74 : wire66)}}) : (8'hb7));
    end
  assign wire85 = {reg76[(1'h0):(1'h0)]};
  assign wire86 = (wire85[(3'h4):(1'h1)] ~^ wire85[(4'h9):(3'h7)]);
  assign wire87 = wire85[(3'h7):(3'h7)];
  assign wire88 = wire68;
  assign wire89 = $signed((~&$unsigned(({wire85, wire68} ?
                      (8'hb8) : (wire69 ? reg76 : reg82)))));
  always
    @(posedge clk) begin
      reg90 <= ((&reg77[(1'h1):(1'h1)]) ?
          ((wire71 >>> {(wire69 >> wire71), ((8'h9c) <<< reg75)}) || {(|reg74),
              wire68[(4'h9):(4'h9)]}) : ((8'hbe) ?
              (|wire87[(4'he):(2'h3)]) : $unsigned(((~^reg83) ?
                  reg84 : (wire87 ? wire87 : (8'ha6))))));
      reg91 <= (+(^~wire87));
      reg92 <= $unsigned(reg78);
      reg93 <= $unsigned($unsigned(reg84));
      reg94 <= wire87[(3'h4):(3'h4)];
    end
  assign wire95 = (^(~^wire88));
  assign wire96 = ($unsigned(($unsigned(reg77[(1'h1):(1'h1)]) ?
                          (|(~wire69)) : reg82)) ?
                      (wire95[(4'h9):(3'h7)] ?
                          (~{$signed((8'ha3)),
                              $unsigned(wire69)}) : {$signed(wire73),
                              wire72[(4'hd):(4'ha)]}) : ($unsigned(((reg79 ?
                                  reg80 : reg80) ?
                              (wire68 ? wire70 : wire72) : $signed(reg78))) ?
                          $unsigned((^~$unsigned((8'hb4)))) : $unsigned((^~(reg83 ?
                              wire73 : wire88)))));
  assign wire97 = {$unsigned((~^$unsigned(reg82))), wire95[(2'h2):(1'h1)]};
  assign wire98 = $unsigned($unsigned(wire95[(4'h8):(1'h0)]));
  always
    @(posedge clk) begin
      reg99 <= wire87;
      reg100 <= {((((reg94 <<< (7'h42)) >> $unsigned((8'h9f))) >= {(reg91 < (8'hb6)),
              wire67[(4'h9):(1'h0)]}) && reg76),
          wire85[(2'h2):(1'h1)]};
      if ((+(^~reg78)))
        begin
          if (wire68)
            begin
              reg101 <= $signed(($signed(reg100) ?
                  (|{reg74[(2'h2):(2'h2)],
                      $signed(wire86)}) : reg100[(4'h8):(4'h8)]));
              reg102 <= {wire95[(3'h4):(2'h2)]};
            end
          else
            begin
              reg101 <= reg79;
            end
          reg103 <= (^~wire69[(1'h0):(1'h0)]);
        end
      else
        begin
          reg101 <= reg91;
          if ($signed(reg90))
            begin
              reg102 <= ($unsigned(wire96) ?
                  (~^$unsigned(wire95[(1'h0):(1'h0)])) : $signed(((^((8'hbd) ?
                          wire66 : wire86)) ?
                      ((8'hb1) ? (+reg74) : (~reg77)) : ((reg94 << wire66) ?
                          wire85 : $unsigned(wire71)))));
              reg103 <= (wire96[(2'h2):(2'h2)] ~^ reg75[(3'h5):(1'h0)]);
            end
          else
            begin
              reg102 <= (~^$signed($unsigned((wire98[(2'h2):(2'h2)] ?
                  $signed(reg99) : $unsigned(reg103)))));
            end
        end
    end
  assign wire104 = $signed(reg92);
  always
    @(posedge clk) begin
      reg105 <= (((~|({reg82} ?
              $signed((8'hba)) : (!(8'hb3)))) != $unsigned(reg83[(2'h2):(2'h2)])) ?
          $unsigned($unsigned(({reg80, reg76} < {wire71,
              reg90}))) : reg82[(1'h1):(1'h0)]);
    end
  assign wire106 = $signed($unsigned(reg101));
endmodule

module module16
#(parameter param60 = (^(8'hb7)), 
parameter param61 = param60)
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h16c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire20;
  input wire [(3'h6):(1'h0)] wire19;
  input wire signed [(4'hc):(1'h0)] wire18;
  input wire [(3'h4):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire59;
  wire [(3'h5):(1'h0)] wire58;
  wire [(2'h3):(1'h0)] wire57;
  wire signed [(2'h2):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire55;
  wire signed [(4'h8):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire39;
  wire [(4'h8):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire21;
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire41,
                 wire40,
                 wire39,
                 wire37,
                 wire36,
                 wire35,
                 wire29,
                 wire21,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg38,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire21 = (({$unsigned({wire20}), (^~wire17)} ?
                      (7'h44) : $signed(wire20)) && wire18);
  always
    @(posedge clk) begin
      if (($signed($signed($unsigned($signed(wire18)))) ?
          (^~(wire18[(2'h3):(1'h0)] < ((wire19 ? wire20 : wire19) ^~ (wire20 ?
              wire18 : wire21)))) : $signed(($unsigned(wire21[(4'hb):(4'ha)]) ?
              {wire18[(4'h9):(3'h7)]} : (wire17[(2'h3):(1'h0)] ^~ {wire18})))))
        begin
          reg22 <= $signed($unsigned(wire19));
        end
      else
        begin
          reg22 <= (~|$signed((^((wire18 ?
              wire18 : wire21) ^ $unsigned(wire17)))));
          reg23 <= wire19;
          reg24 <= wire21[(4'ha):(3'h6)];
        end
      reg25 <= wire17[(1'h0):(1'h0)];
      reg26 <= ({(|wire19),
          (((wire20 * reg23) ? (&wire18) : wire21[(4'hc):(4'hb)]) ?
              $unsigned(((8'hb1) ? reg23 : reg23)) : $signed({wire17,
                  (7'h44)}))} | ((wire21 >>> ({reg24, wire21} ?
              $signed(reg25) : wire18)) ?
          (8'ha1) : reg24));
      reg27 <= wire19;
      reg28 <= wire19;
    end
  assign wire29 = (reg27 > ((+({wire19} >> wire19[(2'h3):(1'h1)])) << reg28));
  always
    @(posedge clk) begin
      if (((+$signed(((~&(8'hbd)) ? reg28 : (^~wire17)))) ?
          wire21 : $unsigned(((-(&wire18)) ?
              $unsigned((wire19 ~^ (8'had))) : ($unsigned((8'hba)) + $signed(wire18))))))
        begin
          reg30 <= (~^(~|$unsigned((8'h9f))));
          reg31 <= $signed($signed($signed($signed((8'ha4)))));
        end
      else
        begin
          reg30 <= $unsigned({(8'h9c)});
          reg31 <= (|reg28);
          reg32 <= (wire19 ? wire17 : (&reg25[(2'h3):(2'h2)]));
          reg33 <= wire18[(3'h4):(1'h0)];
        end
      reg34 <= (({((reg22 ? reg23 : wire19) | $signed(wire20))} ?
          (~($unsigned(reg23) ^~ (reg22 & reg23))) : (((wire21 || (8'ha0)) ?
              $signed(wire29) : ((8'ha7) ?
                  (8'haf) : reg32)) >> (~&(wire17 & (8'ha9))))) >> reg23);
    end
  assign wire35 = reg31[(4'hc):(4'h8)];
  assign wire36 = (($signed(wire29[(1'h0):(1'h0)]) ?
                      $signed(reg27[(3'h7):(3'h6)]) : (!reg30)) * (reg28[(2'h2):(1'h1)] ?
                      reg31 : $unsigned(wire20[(4'h9):(2'h2)])));
  assign wire37 = $signed((~|reg24[(4'hf):(1'h1)]));
  always
    @(posedge clk) begin
      reg38 <= $unsigned(reg26[(1'h0):(1'h0)]);
    end
  assign wire39 = reg22;
  assign wire40 = (wire18[(1'h0):(1'h0)] ^~ ($unsigned(((^(8'hba)) << reg38)) ?
                      $signed($unsigned($signed(reg31))) : {wire36,
                          (|$signed((8'ha8)))}));
  assign wire41 = $unsigned(wire21);
  always
    @(posedge clk) begin
      reg42 <= $signed($signed($unsigned(((reg24 ^ wire18) == (wire36 & (8'ha7))))));
      reg43 <= $signed(((~^{wire20[(3'h5):(3'h4)],
          (wire21 ? reg42 : reg24)}) >> reg31));
      if ((^~wire39[(4'hf):(4'ha)]))
        begin
          reg44 <= (-{reg32,
              ((~|wire40[(4'h8):(1'h0)]) ?
                  {((8'hbc) || reg32), (8'h9e)} : reg26[(1'h0):(1'h0)])});
          reg45 <= wire39;
          reg46 <= $signed({{$unsigned((&wire20))},
              $signed({reg30[(3'h7):(3'h7)], $signed((8'hbd))})});
          reg47 <= {(8'haa)};
        end
      else
        begin
          reg44 <= reg38[(4'ha):(4'ha)];
          reg45 <= (-reg24[(4'h9):(4'h9)]);
          reg46 <= (~|(!reg30));
        end
      if (($unsigned($unsigned(reg42)) != (((((8'hbd) == reg47) ?
                  (wire39 ? (8'hb5) : reg26) : (wire19 ~^ (8'hb7))) ?
              (^$unsigned(reg26)) : reg30[(3'h7):(3'h5)]) ?
          (^~reg22) : $unsigned((|((8'h9c) * reg23))))))
        begin
          reg48 <= $signed({(8'had)});
          reg49 <= ({(+wire36)} | $signed((8'hb3)));
        end
      else
        begin
          reg48 <= (8'hbe);
          if (($unsigned(wire40) ?
              $unsigned((reg32[(5'h12):(4'hb)] ?
                  reg32 : $unsigned((~wire40)))) : $signed($signed($unsigned((reg30 ?
                  (8'ha8) : reg32))))))
            begin
              reg49 <= ((-$unsigned({$signed(reg47)})) ?
                  $unsigned($signed($unsigned((~^reg22)))) : wire17);
              reg50 <= (^reg43[(2'h2):(1'h1)]);
              reg51 <= $unsigned(((((reg32 ?
                          wire17 : (7'h40)) <= $signed(reg30)) ?
                      wire17 : reg46[(4'hc):(4'ha)]) ?
                  ({reg31[(4'hc):(4'ha)],
                      $unsigned(reg30)} >>> $unsigned(reg38[(4'hd):(4'ha)])) : (~|$unsigned(wire37[(2'h3):(1'h1)]))));
              reg52 <= wire29[(4'hf):(1'h0)];
              reg53 <= ($signed((!wire36[(1'h1):(1'h1)])) ?
                  (8'hae) : wire36[(3'h5):(3'h5)]);
            end
          else
            begin
              reg49 <= (reg28 ^~ ((8'h9f) ? reg32 : wire36));
            end
          reg54 <= (~|$signed((reg33 ? reg31 : $signed($unsigned(reg52)))));
        end
    end
  assign wire55 = {(|(|($unsigned(reg46) | (wire29 & reg46)))),
                      (($signed(reg28[(2'h2):(1'h0)]) && reg38[(2'h3):(1'h0)]) + $signed({$unsigned(reg51)}))};
  assign wire56 = {(wire39 ? (-reg31) : (+(|((7'h42) ? reg34 : wire21)))),
                      (+(~&(reg53[(4'hc):(2'h2)] ?
                          (wire37 * (8'ha7)) : reg44)))};
  assign wire57 = $unsigned(((({reg47} ? (+reg23) : $signed(reg32)) ?
                      $unsigned(wire18[(4'hc):(2'h3)]) : {(~|wire41),
                          (wire41 << reg25)}) != ((!(^reg31)) ?
                      ($signed((8'h9c)) ?
                          ((8'hb3) ? reg24 : reg23) : reg25) : reg51)));
  assign wire58 = ((|($unsigned((|wire18)) ?
                          reg23[(2'h2):(2'h2)] : $signed(wire55))) ?
                      reg34 : reg27[(3'h7):(2'h3)]);
  assign wire59 = reg43;
endmodule
