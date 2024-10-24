module top
#(parameter param171 = (-(~|(~^{((8'hbc) >>> (8'h9e)), ((8'ha6) ? (8'hbc) : (8'ha0))}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire170;
  wire [(4'h8):(1'h0)] wire169;
  wire [(4'hb):(1'h0)] wire168;
  wire signed [(2'h2):(1'h0)] wire167;
  wire [(3'h5):(1'h0)] wire166;
  wire [(4'hf):(1'h0)] wire165;
  wire [(3'h7):(1'h0)] wire164;
  wire [(5'h11):(1'h0)] wire163;
  wire signed [(4'hd):(1'h0)] wire162;
  wire [(4'h9):(1'h0)] wire161;
  wire [(4'hf):(1'h0)] wire159;
  wire [(4'ha):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire157;
  assign y = {wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire159,
                 wire5,
                 wire6,
                 wire7,
                 wire157,
                 (1'h0)};
  assign wire5 = {{{wire0},
                         ((wire4[(3'h5):(1'h0)] + $unsigned(wire3)) ?
                             (^wire3) : wire1[(3'h6):(3'h5)])}};
  assign wire6 = wire2[(4'hd):(4'hc)];
  assign wire7 = (wire0[(3'h4):(1'h1)] != $signed((^~$unsigned($unsigned((8'hb4))))));
  module8 #() modinst158 (.wire13(wire6), .wire12(wire1), .wire11(wire5), .y(wire157), .wire9(wire0), .wire10(wire7), .clk(clk));
  module65 #() modinst160 (.clk(clk), .wire67(wire5), .wire69(wire0), .wire68(wire6), .y(wire159), .wire66(wire2));
  assign wire161 = {$unsigned($unsigned({wire3[(4'h9):(3'h5)],
                           wire7[(4'hf):(1'h0)]})),
                       wire6[(4'he):(4'he)]};
  assign wire162 = ($unsigned((wire6 ?
                       $signed((!wire3)) : $signed((wire159 & wire4)))) == wire5[(1'h1):(1'h0)]);
  assign wire163 = (~|(~$signed((-wire7))));
  assign wire164 = wire161;
  assign wire165 = $signed((($signed($unsigned((8'hab))) <= wire7[(4'h8):(1'h0)]) & wire159));
  assign wire166 = wire0;
  assign wire167 = $unsigned(wire163[(3'h6):(2'h2)]);
  assign wire168 = (&(~^$signed(wire6)));
  assign wire169 = wire159;
  assign wire170 = (8'ha9);
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire signed [(4'h9):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire12;
  input wire [(4'he):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire156;
  wire signed [(4'hf):(1'h0)] wire96;
  wire [(4'hd):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire61;
  wire signed [(3'h5):(1'h0)] wire98;
  wire signed [(2'h3):(1'h0)] wire100;
  wire signed [(4'h8):(1'h0)] wire103;
  wire [(4'hf):(1'h0)] wire104;
  wire [(4'hc):(1'h0)] wire105;
  wire signed [(4'he):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire108;
  wire [(4'h9):(1'h0)] wire109;
  wire [(4'hd):(1'h0)] wire110;
  wire [(5'h12):(1'h0)] wire111;
  wire [(5'h15):(1'h0)] wire112;
  wire [(5'h15):(1'h0)] wire138;
  wire signed [(5'h12):(1'h0)] wire140;
  wire [(4'hf):(1'h0)] wire154;
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  reg [(4'hb):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  assign y = {wire156,
                 wire96,
                 wire14,
                 wire15,
                 wire61,
                 wire98,
                 wire100,
                 wire103,
                 wire104,
                 wire105,
                 wire106,
                 wire107,
                 wire108,
                 wire109,
                 wire110,
                 wire111,
                 wire112,
                 wire138,
                 wire140,
                 wire154,
                 reg64,
                 reg63,
                 reg99,
                 reg101,
                 reg102,
                 (1'h0)};
  assign wire14 = (wire11[(2'h3):(2'h2)] && $signed($unsigned(wire13)));
  assign wire15 = wire13;
  module16 #() modinst62 (wire61, clk, wire11, wire14, wire9, wire12, wire15);
  always
    @(posedge clk) begin
      reg63 <= $signed($unsigned($signed($signed({wire61}))));
      reg64 <= wire10[(3'h6):(3'h5)];
    end
  module65 #() modinst97 (wire96, clk, wire10, reg63, wire14, wire13);
  assign wire98 = wire11;
  always
    @(posedge clk) begin
      reg99 <= {$unsigned((~^(~&(reg63 || wire96))))};
    end
  assign wire100 = {((!((reg64 ? wire10 : wire96) ?
                           (wire61 ? wire15 : wire98) : (reg99 ?
                               reg63 : wire61))) ^~ $signed(wire96[(1'h1):(1'h0)]))};
  always
    @(posedge clk) begin
      reg101 <= (-(8'ha4));
      reg102 <= wire9[(3'h7):(3'h7)];
    end
  assign wire103 = {wire14,
                       ((((~&reg102) * $unsigned(wire10)) != (wire9 <<< (wire61 <= wire13))) ?
                           (((^wire96) ?
                               (wire96 >= (8'h9d)) : (wire11 ?
                                   wire61 : reg64)) || $unsigned((7'h44))) : (8'hac))};
  assign wire104 = (($signed({((8'ha5) ? reg99 : wire98),
                       $unsigned(wire9)}) <= (!$signed($signed(reg63)))) * $signed(wire96[(4'h9):(1'h1)]));
  assign wire105 = (8'hb2);
  assign wire106 = (wire100[(2'h3):(1'h1)] ?
                       reg64 : $unsigned($signed($signed($signed(reg101)))));
  assign wire107 = $signed(($unsigned($unsigned(reg64)) ?
                       $signed($unsigned($signed(reg64))) : $unsigned(wire15)));
  assign wire108 = (~&((~|wire11) >> (($unsigned(wire11) ?
                       wire9 : (wire107 ?
                           reg101 : (8'hba))) <<< wire96[(2'h3):(2'h3)])));
  assign wire109 = (wire108[(2'h2):(1'h0)] ?
                       wire12[(2'h3):(2'h2)] : $unsigned($signed($unsigned((wire10 ?
                           wire103 : wire11)))));
  assign wire110 = wire9;
  assign wire111 = wire98;
  assign wire112 = (($unsigned(wire10[(4'h8):(3'h4)]) ?
                       (wire11 ?
                           ((wire61 <= wire10) ^~ $unsigned(wire111)) : ($signed(wire98) ^ wire10[(4'hc):(3'h7)])) : {wire96,
                           $unsigned((8'hba))}) | wire107);
  module113 #() modinst139 (wire138, clk, wire15, wire106, wire12, wire10);
  assign wire140 = (&$unsigned(wire10));
  module141 #() modinst155 (.wire143(reg101), .wire145(wire112), .y(wire154), .clk(clk), .wire144(wire61), .wire142(wire98));
  assign wire156 = (~&wire108[(3'h4):(1'h1)]);
endmodule

module module141
#(parameter param152 = (|(~^((((8'had) ? (7'h42) : (8'haa)) <<< (^~(8'ha4))) ? ((~(8'hac)) ? ((7'h43) != (8'hb4)) : (~(8'hb8))) : (^~((8'hb4) ? (8'hae) : (8'hb7)))))), 
parameter param153 = (((({param152} ? {param152, param152} : (param152 * param152)) ? (^~param152) : ((param152 ? param152 : param152) ? {param152, (7'h42)} : (^param152))) <<< (8'hb5)) ? ((^param152) ? {(~|param152)} : param152) : (param152 ? (8'hbd) : (+(+param152)))))
(y, clk, wire145, wire144, wire143, wire142);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire145;
  input wire signed [(5'h12):(1'h0)] wire144;
  input wire [(4'h8):(1'h0)] wire143;
  input wire signed [(3'h5):(1'h0)] wire142;
  wire [(5'h10):(1'h0)] wire151;
  wire [(5'h14):(1'h0)] wire150;
  wire signed [(5'h11):(1'h0)] wire149;
  wire signed [(4'he):(1'h0)] wire148;
  wire [(3'h4):(1'h0)] wire147;
  wire signed [(3'h6):(1'h0)] wire146;
  assign y = {wire151, wire150, wire149, wire148, wire147, wire146, (1'h0)};
  assign wire146 = wire143;
  assign wire147 = wire145[(1'h0):(1'h0)];
  assign wire148 = wire147;
  assign wire149 = wire144;
  assign wire150 = $signed((wire145[(4'he):(2'h2)] ?
                       {wire144[(3'h6):(3'h4)],
                           (((8'h9f) ? wire143 : wire142) ?
                               (+wire146) : wire148[(1'h1):(1'h0)])} : wire146));
  assign wire151 = wire150[(4'hf):(4'hc)];
endmodule

module module113
#(parameter param136 = ((+({(^(8'haa)), ((8'ha2) <<< (8'hae))} ? (((8'ha5) <= (8'hb2)) <<< ((8'hbe) >= (8'ha4))) : ((!(8'ha0)) >= ((8'hac) >>> (7'h42))))) ? ((({(7'h42)} - ((8'ha0) * (8'had))) ? {((7'h44) ^~ (8'hb2)), (~|(8'h9d))} : ({(8'ha2)} ? ((8'hb3) <= (7'h42)) : ((8'hbe) ? (8'hab) : (8'hbb)))) ? ({((7'h42) - (8'hb8))} + (~^((8'hb7) ? (8'hb6) : (7'h41)))) : (((^(8'ha2)) <<< (~^(8'hb1))) || {((8'hb4) ? (8'hb8) : (8'ha7))})) : ({(((8'h9d) ? (8'ha7) : (8'hb0)) >= (-(8'ha2))), (((8'hb6) ? (8'hab) : (8'h9c)) & ((8'hbf) ~^ (8'ha9)))} ? (&((&(8'hb9)) || {(8'ha2), (8'hbd)})) : (+(~|((8'ha8) ? (8'ha6) : (8'ha8)))))), 
parameter param137 = (8'hb3))
(y, clk, wire117, wire116, wire115, wire114);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire117;
  input wire signed [(4'h9):(1'h0)] wire116;
  input wire signed [(5'h12):(1'h0)] wire115;
  input wire signed [(2'h2):(1'h0)] wire114;
  wire signed [(5'h10):(1'h0)] wire135;
  wire signed [(5'h15):(1'h0)] wire134;
  wire signed [(2'h3):(1'h0)] wire133;
  wire signed [(5'h14):(1'h0)] wire132;
  wire signed [(4'hf):(1'h0)] wire131;
  wire signed [(3'h4):(1'h0)] wire130;
  wire [(4'hc):(1'h0)] wire129;
  wire [(4'ha):(1'h0)] wire128;
  wire signed [(5'h13):(1'h0)] wire127;
  wire signed [(3'h7):(1'h0)] wire126;
  wire [(5'h14):(1'h0)] wire125;
  wire [(3'h7):(1'h0)] wire124;
  wire signed [(3'h6):(1'h0)] wire123;
  wire signed [(4'hb):(1'h0)] wire122;
  wire [(4'hd):(1'h0)] wire121;
  wire [(5'h15):(1'h0)] wire120;
  wire signed [(5'h11):(1'h0)] wire119;
  wire [(5'h12):(1'h0)] wire118;
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire132,
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
                 wire120,
                 wire119,
                 wire118,
                 (1'h0)};
  assign wire118 = wire116;
  assign wire119 = (($unsigned(({wire114, (8'hb0)} ?
                       $unsigned(wire117) : $signed((8'hb2)))) ^ wire117) >>> ($signed(wire117[(3'h4):(2'h3)]) < ($unsigned({wire117}) << wire114)));
  assign wire120 = ($unsigned(wire114) ? wire118 : (wire114 * wire118));
  assign wire121 = (wire117 ?
                       $unsigned(wire115[(4'hf):(3'h6)]) : {wire118,
                           ((wire115 ?
                               wire119 : $unsigned(wire118)) + wire117)});
  assign wire122 = wire116;
  assign wire123 = $signed(($unsigned((~(wire119 < wire121))) ?
                       $signed(({wire116, wire121} ?
                           $unsigned(wire120) : (wire114 ?
                               wire115 : wire116))) : wire118[(2'h3):(2'h2)]));
  assign wire124 = (~&(^~{(!wire120[(3'h7):(3'h4)]), (&$signed(wire118))}));
  assign wire125 = $signed(wire120);
  assign wire126 = wire116[(2'h2):(2'h2)];
  assign wire127 = $unsigned($signed(($signed((wire125 <= wire121)) ?
                       wire117 : (^~wire119[(2'h3):(1'h1)]))));
  assign wire128 = (wire125[(3'h7):(1'h1)] ?
                       $signed(wire116) : {(($signed(wire126) >>> (|wire125)) ^ $signed((wire120 ?
                               wire125 : wire118))),
                           wire120});
  assign wire129 = {wire127[(3'h5):(1'h0)]};
  assign wire130 = (~&$unsigned((+({(8'hbf)} ?
                       (wire121 >>> (7'h43)) : (8'ha3)))));
  assign wire131 = ($signed(wire114[(2'h2):(1'h1)]) ?
                       $unsigned(wire118) : {({(wire118 & wire119)} ?
                               ($unsigned(wire114) > $signed(wire115)) : (^(~|wire122))),
                           (~^wire129)});
  assign wire132 = (($signed(wire127) >> wire117[(1'h1):(1'h0)]) ?
                       wire121 : $signed(($signed(wire125[(3'h6):(3'h5)]) ?
                           wire128[(3'h4):(3'h4)] : wire114[(1'h1):(1'h0)])));
  assign wire133 = wire114;
  assign wire134 = {($unsigned($unsigned((wire129 >>> wire126))) == ((^(~^wire127)) ?
                           $signed((wire126 << wire119)) : $unsigned({wire133}))),
                       wire119};
  assign wire135 = (8'hb1);
endmodule

module module65  (y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire69;
  input wire [(5'h15):(1'h0)] wire68;
  input wire [(2'h2):(1'h0)] wire67;
  input wire signed [(4'h9):(1'h0)] wire66;
  wire [(4'hb):(1'h0)] wire75;
  wire signed [(3'h4):(1'h0)] wire74;
  wire [(4'hb):(1'h0)] wire73;
  wire signed [(2'h2):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire70;
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg [(5'h13):(1'h0)] reg91 = (1'h0);
  reg [(2'h3):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg88 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(5'h13):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg84 = (1'h0);
  reg [(3'h4):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(4'he):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 reg95,
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
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire70 = $unsigned(wire67);
  assign wire71 = $unsigned(($signed({(wire66 ? (8'hba) : wire66),
                      (~^(8'h9e))}) ~^ ((wire70 <= (wire70 ^~ (8'hb4))) ^~ wire70[(3'h6):(1'h0)])));
  assign wire72 = ((|wire69[(4'ha):(3'h4)]) ? wire71 : (~^wire68));
  assign wire73 = wire68[(5'h15):(4'h8)];
  assign wire74 = {wire70[(4'hf):(2'h3)],
                      (wire68[(4'hd):(4'hc)] && $unsigned($unsigned($unsigned(wire66))))};
  assign wire75 = $signed({wire70[(5'h12):(5'h11)]});
  always
    @(posedge clk) begin
      reg76 <= (^~((8'ha0) ?
          $unsigned(wire69[(4'h8):(3'h4)]) : (&(|(+wire66)))));
      reg77 <= $signed(($signed(wire73[(3'h4):(1'h0)]) & $unsigned(wire67[(1'h1):(1'h0)])));
      reg78 <= {((^~(wire73 - (reg77 >> wire67))) ?
              ($unsigned(wire67) <<< (8'hb9)) : ($signed($signed((8'hb8))) <= wire70))};
    end
  always
    @(posedge clk) begin
      reg79 <= reg76[(4'hd):(4'hd)];
      if (((-wire70[(4'he):(3'h5)]) ?
          wire74[(3'h4):(1'h0)] : (reg79[(1'h0):(1'h0)] ?
              ({$unsigned(wire70), $unsigned(reg77)} == $unsigned((wire66 ?
                  (8'had) : wire75))) : (($signed(wire73) ?
                  ((8'hb8) ?
                      (8'hbe) : wire67) : wire70[(4'ha):(2'h3)]) ^ (8'hb2)))))
        begin
          reg80 <= wire74[(2'h3):(2'h3)];
          if (reg76[(4'hb):(4'hb)])
            begin
              reg81 <= (wire74 ?
                  $signed($unsigned($unsigned((reg78 - reg80)))) : wire68);
              reg82 <= (~&{((~|wire73[(4'hb):(4'ha)]) ?
                      (&reg76[(3'h5):(1'h0)]) : (wire73[(4'h8):(1'h0)] + wire69[(1'h1):(1'h0)]))});
              reg83 <= ($unsigned($unsigned($unsigned((reg77 > wire67)))) << $signed($signed((!(~&wire75)))));
              reg84 <= reg83[(1'h0):(1'h0)];
              reg85 <= ((($unsigned((wire74 ?
                  wire71 : wire69)) ^ wire73[(4'ha):(4'h9)]) != (($unsigned(wire67) ^ (^~wire69)) ?
                  (reg77 << (wire71 ?
                      wire71 : wire69)) : $signed($unsigned(wire71)))) || (wire72 ?
                  (reg83 ?
                      ({wire75} ?
                          (wire73 ^ wire70) : $unsigned(reg83)) : $unsigned(((8'hab) ?
                          reg81 : wire70))) : (($signed(reg80) != (&reg82)) ?
                      reg80[(1'h0):(1'h0)] : reg81)));
            end
          else
            begin
              reg81 <= (~^$unsigned(wire71));
              reg82 <= (~|{(reg77 <<< (+((8'hb9) ? wire66 : wire66)))});
              reg83 <= reg79[(3'h4):(2'h2)];
              reg84 <= $unsigned(wire67);
              reg85 <= $signed(reg78);
            end
        end
      else
        begin
          if ($unsigned($signed((^~({reg78} ~^ $signed(reg81))))))
            begin
              reg80 <= wire74;
              reg81 <= (~^wire75[(3'h7):(3'h5)]);
              reg82 <= $unsigned((!{(reg85[(4'h8):(2'h2)] & reg81), wire69}));
              reg83 <= reg85[(4'he):(2'h2)];
              reg84 <= $unsigned($signed($signed(wire73[(1'h0):(1'h0)])));
            end
          else
            begin
              reg80 <= (!(8'ha9));
              reg81 <= $unsigned((~(((wire70 & wire66) ?
                  $unsigned(wire68) : (wire68 + reg84)) * reg81[(2'h3):(1'h1)])));
            end
          reg85 <= $signed(((($signed(reg85) ?
              (wire73 ?
                  wire67 : (8'had)) : wire70) >>> reg76) || {$signed(reg80[(2'h2):(2'h2)])}));
          if (({$unsigned(((reg82 >= wire75) <<< (reg82 + reg77)))} > ({$signed(wire75),
              $signed($unsigned(wire71))} >> $unsigned(((reg84 >= (8'ha0)) && (7'h44))))))
            begin
              reg86 <= ($unsigned((wire67 <<< reg85[(3'h4):(1'h1)])) > $signed(((~|{(8'hb3),
                  wire73}) | (-(|wire74)))));
              reg87 <= {$unsigned(wire69[(3'h7):(3'h7)]), reg85};
              reg88 <= $unsigned(((({reg81,
                      reg77} | ((8'hb0) - (8'hba))) > $unsigned($unsigned((8'hb7)))) ?
                  (wire74 ?
                      $signed((8'hac)) : wire67[(2'h2):(1'h1)]) : ((wire70[(4'h9):(3'h7)] ~^ (wire70 != reg83)) ?
                      reg85 : reg77[(4'h9):(3'h7)])));
              reg89 <= $unsigned((+reg76));
              reg90 <= wire69;
            end
          else
            begin
              reg86 <= $unsigned(({$signed($unsigned(reg89)),
                      $signed($signed(reg89))} ?
                  (|reg83[(2'h3):(2'h3)]) : {reg86}));
            end
          reg91 <= ($signed($signed(((^wire73) ?
              reg90[(2'h2):(1'h0)] : reg76[(4'h8):(2'h2)]))) ^~ wire74[(3'h4):(1'h0)]);
          reg92 <= (reg77 > (+$unsigned($signed((reg77 ? reg91 : (8'hae))))));
        end
      reg93 <= (wire66[(3'h7):(3'h6)] & wire73);
      reg94 <= reg89;
      reg95 <= (^~((reg88 == $signed((wire69 * reg91))) ?
          $signed((~|reg91)) : ((wire68[(5'h12):(3'h5)] > (~&(8'h9e))) ?
              ({wire70,
                  reg89} - reg81[(3'h4):(1'h0)]) : {wire73[(1'h1):(1'h0)]})));
    end
endmodule

module module16
#(parameter param59 = ((|(~(((8'hb6) ? (8'ha8) : (7'h41)) ? ((8'hb2) >= (8'hbc)) : (&(8'ha0))))) ? ({(-((8'hb6) || (8'h9f))), {(~^(8'hac)), (+(8'ha7))}} ? (!(^((8'hb2) ? (8'hb3) : (8'haa)))) : (|((&(8'ha0)) == (-(8'hb0))))) : (|(^((7'h40) ? ((8'ha2) ? (8'ha6) : (8'hac)) : ((8'h9d) ? (8'ha6) : (8'hba)))))), 
parameter param60 = (~^((({param59} && (~^param59)) > ((param59 - (8'haa)) ? param59 : (param59 ^~ param59))) ? param59 : ((-(param59 ? param59 : param59)) == ((^param59) ^~ param59)))))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h1c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire21;
  input wire signed [(4'hd):(1'h0)] wire20;
  input wire signed [(4'h8):(1'h0)] wire19;
  input wire signed [(4'h8):(1'h0)] wire18;
  input wire [(4'ha):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire56;
  wire [(4'hf):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire31;
  wire signed [(2'h2):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire22;
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire37,
                 wire36,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg35,
                 reg26,
                 (1'h0)};
  assign wire22 = ($signed(($unsigned($signed(wire17)) & wire19[(1'h1):(1'h1)])) ?
                      (&($signed((~|wire21)) == ((wire18 ? wire19 : wire19) ?
                          (wire19 > wire17) : (wire17 ?
                              (8'hb7) : wire17)))) : (~wire19));
  assign wire23 = $unsigned($signed($unsigned((~&wire19))));
  assign wire24 = $signed((~|wire20[(2'h3):(2'h2)]));
  assign wire25 = wire21[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg26 <= wire25[(1'h1):(1'h1)];
    end
  assign wire27 = wire18;
  assign wire28 = wire19[(3'h4):(2'h3)];
  assign wire29 = reg26;
  assign wire30 = {(wire19 ^ (((|wire22) ?
                          (wire21 ?
                              (8'ha1) : wire24) : wire27) >>> $unsigned((~wire29))))};
  assign wire31 = $unsigned((wire28[(5'h14):(2'h2)] ^~ reg26[(3'h5):(3'h5)]));
  assign wire32 = wire18[(2'h2):(1'h0)];
  assign wire33 = ($unsigned($unsigned(((~^wire21) ^ $unsigned(wire24)))) <<< {wire28[(5'h10):(4'h8)],
                      $unsigned($signed($unsigned(wire23)))});
  assign wire34 = (&$unsigned((((&wire25) ?
                      {(8'hb6), wire20} : (wire19 ?
                          wire31 : wire22)) ^~ wire25)));
  always
    @(posedge clk) begin
      reg35 <= (^(wire28[(2'h3):(1'h1)] ?
          (((wire22 ? wire27 : wire28) ? wire28 : wire32) ?
              $unsigned(wire29[(1'h1):(1'h1)]) : wire34[(2'h2):(1'h1)]) : ({(^~wire18)} ?
              ($unsigned((8'hbc)) ?
                  $unsigned((8'ha3)) : wire24) : $unsigned((~^wire34)))));
    end
  assign wire36 = wire20[(2'h2):(1'h1)];
  assign wire37 = reg26[(4'h8):(1'h1)];
  always
    @(posedge clk) begin
      reg38 <= wire20;
      if ({(+wire24), reg26})
        begin
          reg39 <= wire20;
          reg40 <= (wire37[(4'h8):(2'h2)] ?
              $unsigned($unsigned($unsigned($unsigned((8'ha6))))) : ((7'h44) ?
                  wire21[(3'h5):(2'h3)] : $unsigned($unsigned($signed(wire21)))));
        end
      else
        begin
          if (({$signed($unsigned((8'had)))} > wire18))
            begin
              reg39 <= (+wire17);
              reg40 <= (!$signed(wire18));
              reg41 <= (~&(wire27[(3'h6):(1'h1)] ?
                  $unsigned(wire18) : ($unsigned(wire22) && (^~$unsigned(wire18)))));
            end
          else
            begin
              reg39 <= (wire33 ?
                  reg39[(3'h6):(1'h1)] : {{$signed($unsigned((8'hb9))),
                          (~(-wire37))},
                      (^~wire22)});
              reg40 <= ({((-$unsigned(reg38)) ^~ wire36),
                      $signed(($unsigned(reg41) ?
                          (wire36 | wire22) : (reg40 >= reg39)))} ?
                  ($signed((((8'ha6) <= wire25) ?
                      wire34[(3'h5):(3'h5)] : $signed(wire20))) * $signed({$signed(wire18)})) : wire31);
              reg41 <= $unsigned(wire18);
              reg42 <= $signed((~^({$signed(wire36), wire37} ?
                  (wire22[(1'h1):(1'h0)] ?
                      $unsigned(reg38) : wire22[(2'h3):(1'h0)]) : ((^reg35) ^ $signed(reg39)))));
            end
          reg43 <= {wire34, $unsigned((!wire21[(2'h3):(1'h0)]))};
          reg44 <= reg38[(2'h3):(2'h3)];
          reg45 <= (7'h43);
        end
      if ($unsigned((wire27 < wire19[(4'h8):(4'h8)])))
        begin
          reg46 <= wire20;
          if ($unsigned($unsigned((({wire17, (8'ha2)} ?
                  wire20[(2'h3):(1'h1)] : ((8'ha3) ? (8'ha1) : (8'hba))) ?
              $unsigned(wire33) : (8'ha0)))))
            begin
              reg47 <= {wire17[(3'h4):(2'h3)]};
              reg48 <= reg43[(1'h0):(1'h0)];
              reg49 <= {(8'hb1)};
              reg50 <= $signed((8'hbe));
              reg51 <= ($unsigned(reg46[(3'h5):(1'h1)]) ?
                  $signed($signed(((!reg41) - $unsigned(wire25)))) : wire30);
            end
          else
            begin
              reg47 <= {($signed((wire20 <= $unsigned(reg40))) ?
                      (8'ha3) : reg44)};
            end
          reg52 <= ($unsigned(((wire23[(3'h5):(2'h2)] ?
                      (wire22 == wire18) : reg38) ?
                  (~&$signed(reg42)) : ($unsigned(reg43) ?
                      $unsigned(wire22) : reg43))) ?
              wire19[(1'h1):(1'h0)] : wire36);
        end
      else
        begin
          if ((+$unsigned((reg47 | ((~|reg49) <= $unsigned(wire21))))))
            begin
              reg46 <= reg41;
              reg47 <= wire20;
              reg48 <= (^~(($unsigned($signed(reg41)) || {reg41[(3'h5):(3'h4)]}) ?
                  {(wire27 + (^~wire36))} : $unsigned((^(|wire31)))));
              reg49 <= ((({(reg50 <<< reg41), $signed(wire22)} ?
                  ({wire22} && $unsigned(wire24)) : wire23[(5'h10):(4'h8)]) ^ $unsigned(reg38)) ^ (~|(wire37 ?
                  $signed((+(8'hb9))) : ((-reg51) ^~ wire20))));
            end
          else
            begin
              reg46 <= (($signed(wire31) ?
                      $unsigned(((reg39 ^ wire27) ?
                          {wire27} : {(8'hae), (8'ha9)})) : {wire37}) ?
                  (~&((wire22[(3'h6):(1'h1)] ?
                          {wire20, wire34} : (reg52 ? reg51 : (8'hb2))) ?
                      {(reg49 ? wire37 : wire22),
                          wire20} : wire33)) : (~|wire17));
              reg47 <= wire27;
              reg48 <= ((|((8'h9d) ?
                      wire21[(3'h6):(2'h3)] : ({wire37} ^ $unsigned((8'h9c))))) ?
                  ($unsigned((-{wire36})) ?
                      $signed({{wire27},
                          (wire24 ?
                              reg51 : wire37)}) : wire21) : (+($unsigned(((8'h9e) & (7'h42))) ?
                      $unsigned((~^(8'h9d))) : $signed((|wire37)))));
            end
        end
    end
  assign wire53 = reg45[(1'h0):(1'h0)];
  assign wire54 = wire36[(4'h8):(1'h1)];
  assign wire55 = ((|$signed({wire54,
                      (wire36 <<< reg40)})) ^ (($signed($signed(reg42)) ^~ reg52) ?
                      reg45 : {$unsigned($unsigned(wire30)), {(&reg26)}}));
  assign wire56 = $signed($signed(wire54));
  assign wire57 = wire25[(1'h0):(1'h0)];
  assign wire58 = reg52[(2'h3):(2'h2)];
endmodule
