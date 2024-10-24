module top
#(parameter param157 = (({{((8'hbe) ? (8'hae) : (8'hb3)), (~|(8'h9f))}, ((~|(8'hba)) - ((8'hb9) && (8'hb1)))} ~^ (~^(((8'hb9) ? (8'hb6) : (8'hbf)) ? ((8'hb4) | (8'ha4)) : (~(7'h40))))) ? (~|(({(7'h44)} ? (^(8'ha2)) : (~&(8'hbb))) & (((8'ha4) >> (8'hbb)) ? ((8'hb8) ? (7'h42) : (8'hbd)) : ((8'hb2) ? (8'hab) : (8'h9f))))) : ({(~|((8'hab) ? (8'hb3) : (8'ha7))), (((8'hb0) ? (8'haa) : (8'hbc)) ~^ ((8'hb0) ^~ (8'had)))} ? ((&((8'hb8) ? (8'hb0) : (8'hb0))) >>> (~^((8'hae) ? (8'ha3) : (8'ha2)))) : ((&{(8'hba)}) == (~&(-(8'hb1)))))), 
parameter param158 = param157)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  wire signed [(5'h10):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire143;
  wire [(5'h11):(1'h0)] wire145;
  wire [(5'h14):(1'h0)] wire146;
  wire signed [(5'h12):(1'h0)] wire147;
  wire signed [(4'ha):(1'h0)] wire149;
  wire signed [(5'h12):(1'h0)] wire150;
  wire [(5'h13):(1'h0)] wire152;
  wire [(3'h6):(1'h0)] wire154;
  wire signed [(5'h13):(1'h0)] wire155;
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg148 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire143,
                 wire145,
                 wire146,
                 wire147,
                 wire149,
                 wire150,
                 wire152,
                 wire154,
                 wire155,
                 reg9,
                 reg8,
                 reg148,
                 (1'h0)};
  assign wire4 = ($signed($signed(wire3)) ?
                     ($unsigned(({wire3,
                         wire3} ^ wire2[(1'h1):(1'h1)])) && {wire1[(4'hb):(2'h3)],
                         {(~wire2)}}) : $signed(((^~{wire2, (8'h9e)}) ?
                         (wire2 ~^ (wire1 ?
                             wire0 : wire1)) : $signed((|wire0)))));
  assign wire5 = ($signed(wire1) < (~&{$signed($unsigned(wire3)), (&(8'hbc))}));
  assign wire6 = wire5;
  assign wire7 = $unsigned((~{$signed($signed(wire2)),
                     (wire1[(5'h11):(3'h7)] ?
                         (wire0 >= wire2) : (wire4 ? wire3 : wire0))}));
  always
    @(posedge clk) begin
      reg8 <= $signed((wire4[(4'hc):(4'hb)] ?
          $unsigned($signed($signed(wire4))) : $unsigned((~(~wire2)))));
      reg9 <= $signed((+((+(wire3 < wire2)) ?
          $signed({wire5, wire3}) : wire3)));
    end
  assign wire10 = (&wire7[(4'h8):(4'h8)]);
  assign wire11 = wire4;
  assign wire12 = $signed($unsigned($signed(wire11[(4'he):(4'hc)])));
  assign wire13 = (wire4 ~^ (&(^~(((8'h9d) ? reg9 : (8'had)) ?
                      (~^wire1) : (wire2 >>> wire2)))));
  assign wire14 = reg9;
  module15 #() modinst144 (.y(wire143), .wire19(reg9), .clk(clk), .wire17(wire5), .wire18(wire1), .wire20(wire14), .wire16(wire11));
  assign wire145 = $unsigned($unsigned(wire7));
  assign wire146 = wire7;
  assign wire147 = wire5;
  always
    @(posedge clk) begin
      reg148 <= (wire14 ? {$unsigned((wire1 < wire147))} : (-wire145));
    end
  assign wire149 = wire147;
  module56 #() modinst151 (wire150, clk, reg8, wire12, wire14, wire145, wire4);
  module35 #() modinst153 (.wire36(wire145), .wire37(wire143), .clk(clk), .wire39(wire6), .wire38(wire0), .y(wire152));
  assign wire154 = (!$unsigned($unsigned((|(|wire147)))));
  module56 #() modinst156 (.y(wire155), .wire57(wire12), .wire61(wire0), .wire60(wire13), .wire58(wire152), .clk(clk), .wire59(wire146));
endmodule

module module15  (y, clk, wire16, wire17, wire18, wire19, wire20);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire16;
  input wire signed [(5'h14):(1'h0)] wire17;
  input wire [(3'h5):(1'h0)] wire18;
  input wire signed [(4'hc):(1'h0)] wire19;
  input wire [(3'h7):(1'h0)] wire20;
  wire signed [(4'h8):(1'h0)] wire142;
  wire [(4'h9):(1'h0)] wire141;
  wire signed [(4'ha):(1'h0)] wire139;
  wire signed [(5'h14):(1'h0)] wire94;
  wire signed [(5'h13):(1'h0)] wire55;
  wire signed [(4'h8):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire108;
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire139,
                 wire94,
                 wire55,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire53,
                 wire108,
                 reg21,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg21 <= (wire18[(2'h2):(1'h0)] ?
          (~&wire16) : (($signed((wire20 ?
                  wire19 : (7'h42))) & $unsigned(wire18[(1'h1):(1'h0)])) ?
              $unsigned($signed((8'haa))) : (((wire17 ^ wire18) >> $signed(wire20)) ?
                  (|(^~wire16)) : $signed((^~wire16)))));
    end
  assign wire22 = wire19[(2'h3):(2'h3)];
  assign wire23 = ($signed(wire19[(3'h6):(3'h6)]) & wire22);
  assign wire24 = reg21;
  assign wire25 = $signed(wire16[(1'h1):(1'h0)]);
  assign wire26 = wire20;
  always
    @(posedge clk) begin
      if ((^(wire18 >= $signed(wire26))))
        begin
          reg27 <= (wire20 ? wire23[(3'h7):(1'h0)] : wire22);
          reg28 <= (8'hb1);
          reg29 <= (!(&wire16[(3'h4):(3'h4)]));
          reg30 <= (~&wire20[(2'h3):(2'h2)]);
        end
      else
        begin
          reg27 <= wire18;
          if (wire23)
            begin
              reg28 <= $signed(wire16[(2'h3):(1'h0)]);
              reg29 <= wire18;
            end
          else
            begin
              reg28 <= {$unsigned($unsigned(((wire23 ? reg28 : reg30) ?
                      reg29[(4'h8):(3'h7)] : (7'h41)))),
                  ((^reg28) & {$unsigned((wire23 ? wire22 : reg30)),
                      reg27[(4'he):(2'h3)]})};
              reg29 <= $unsigned($unsigned(($unsigned(wire26[(5'h10):(4'hb)]) ?
                  (+{(8'ha0)}) : wire17)));
              reg30 <= $signed(wire20[(1'h0):(1'h0)]);
            end
          reg31 <= $unsigned((wire18 + reg28[(4'hb):(4'hb)]));
        end
      reg32 <= $signed(reg29);
      reg33 <= ((wire25 ?
              $unsigned(((^wire22) <<< reg31)) : {({reg30, reg28} ?
                      wire26[(2'h3):(2'h3)] : $unsigned(wire17)),
                  wire25}) ?
          (8'ha4) : (~&$unsigned((wire20[(3'h6):(3'h6)] ^~ (reg29 ?
              reg29 : wire19)))));
      reg34 <= (8'hac);
    end
  module35 #() modinst54 (.wire36(reg21), .clk(clk), .wire39(reg27), .y(wire53), .wire38(reg30), .wire37(wire17));
  assign wire55 = wire17[(3'h5):(2'h2)];
  module56 #() modinst95 (wire94, clk, reg32, wire16, wire17, wire53, reg33);
  module96 #() modinst109 (wire108, clk, wire26, wire55, reg33, wire94);
  module110 #() modinst140 (.clk(clk), .wire114(reg28), .wire115(wire55), .wire111(wire26), .wire112(wire23), .wire113(wire24), .y(wire139));
  assign wire141 = {(8'ha7)};
  assign wire142 = $unsigned(wire20[(2'h2):(1'h1)]);
endmodule

module module110
#(parameter param138 = (~|(((~|(~^(8'ha7))) * {((8'hac) ? (7'h42) : (8'hb2)), ((7'h44) | (7'h40))}) >> (({(8'hb5)} ? ((8'hba) * (8'hbe)) : (^~(8'hbf))) * ((!(8'hb6)) ? ((8'h9e) ^~ (8'had)) : ((8'ha5) & (8'hb4)))))))
(y, clk, wire115, wire114, wire113, wire112, wire111);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire115;
  input wire [(5'h10):(1'h0)] wire114;
  input wire signed [(4'he):(1'h0)] wire113;
  input wire [(2'h2):(1'h0)] wire112;
  input wire [(4'h9):(1'h0)] wire111;
  wire [(3'h4):(1'h0)] wire137;
  wire [(3'h5):(1'h0)] wire136;
  wire [(2'h3):(1'h0)] wire128;
  wire [(2'h2):(1'h0)] wire127;
  wire [(2'h3):(1'h0)] wire126;
  wire signed [(2'h3):(1'h0)] wire125;
  wire signed [(4'he):(1'h0)] wire124;
  wire signed [(3'h4):(1'h0)] wire123;
  wire signed [(5'h15):(1'h0)] wire122;
  wire [(4'he):(1'h0)] wire121;
  wire [(4'hb):(1'h0)] wire120;
  wire signed [(5'h10):(1'h0)] wire119;
  wire [(2'h3):(1'h0)] wire116;
  reg signed [(5'h14):(1'h0)] reg135 = (1'h0);
  reg [(2'h3):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg133 = (1'h0);
  reg [(4'hd):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg130 = (1'h0);
  reg [(4'hd):(1'h0)] reg129 = (1'h0);
  reg [(4'h8):(1'h0)] reg118 = (1'h0);
  reg [(5'h15):(1'h0)] reg117 = (1'h0);
  assign y = {wire137,
                 wire136,
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
                 wire116,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg118,
                 reg117,
                 (1'h0)};
  assign wire116 = (~&((wire114[(5'h10):(4'hc)] != $unsigned((wire113 ^~ (7'h40)))) == (((-wire114) << (~|(8'hae))) ?
                       $unsigned((~wire112)) : {(wire111 ?
                               wire113 : wire115)})));
  always
    @(posedge clk) begin
      reg117 <= $unsigned(wire115[(3'h7):(3'h4)]);
    end
  always
    @(posedge clk) begin
      reg118 <= $unsigned(({((7'h42) ?
                  $unsigned(wire114) : wire113[(4'hc):(3'h6)])} ?
          $unsigned(((wire114 <<< wire116) ^~ wire111)) : wire112));
    end
  assign wire119 = ((reg118[(3'h4):(2'h2)] ?
                           wire113 : ((wire116 || {(8'hb5)}) ?
                               $unsigned((8'hb9)) : (8'hb3))) ?
                       (wire116 > {$signed(((8'haf) ? (8'hbf) : wire112)),
                           $unsigned(reg118)}) : (($unsigned((wire114 ?
                           wire115 : (8'hb6))) << wire111) && $unsigned($unsigned($unsigned(wire115)))));
  assign wire120 = (((7'h44) == (^~$unsigned(wire112[(1'h0):(1'h0)]))) + ((|($unsigned(wire112) | ((8'hb8) ?
                       wire113 : wire119))) >> $unsigned($signed(wire111[(3'h7):(3'h6)]))));
  assign wire121 = wire120;
  assign wire122 = wire112[(1'h1):(1'h0)];
  assign wire123 = (8'hb3);
  assign wire124 = {{wire120, $unsigned($unsigned((wire113 * wire120)))},
                       (wire116 * (-$signed($unsigned(wire120))))};
  assign wire125 = {wire122};
  assign wire126 = wire125;
  assign wire127 = wire126[(1'h0):(1'h0)];
  assign wire128 = ({wire121} ^ $unsigned($signed(wire122)));
  always
    @(posedge clk) begin
      if ({($unsigned(wire112) || $unsigned((wire119[(4'h9):(4'h9)] ?
              wire127[(1'h0):(1'h0)] : (^wire119)))),
          ({reg118, (~|$unsigned(wire123))} ?
              (wire122 <<< ($signed(wire122) ?
                  wire125[(1'h0):(1'h0)] : (^wire114))) : (wire112[(1'h0):(1'h0)] ?
                  $signed((wire124 & (8'ha6))) : $unsigned((wire128 == (8'ha5)))))})
        begin
          reg129 <= $signed($signed($unsigned($signed((!wire113)))));
          if ($signed((8'ha4)))
            begin
              reg130 <= ($signed($unsigned(wire125)) != (~$signed((+(wire119 == (8'ha3))))));
              reg131 <= wire126;
              reg132 <= $unsigned($unsigned((($signed(wire124) ~^ $signed(wire119)) || (~(!wire113)))));
              reg133 <= $signed({reg117[(3'h6):(1'h0)],
                  {(8'ha0), $unsigned($unsigned(wire121))}});
            end
          else
            begin
              reg130 <= {$unsigned(wire111)};
              reg131 <= ($unsigned((wire119 ?
                      {$signed(reg129),
                          wire120[(3'h6):(3'h6)]} : $unsigned((wire116 >> wire128)))) ?
                  (!({reg117} ^ reg117)) : (-({((8'hb8) ?
                          wire111 : wire121)} >>> (^(wire126 ?
                      reg131 : wire112)))));
              reg132 <= $signed($unsigned((8'hbf)));
              reg133 <= $signed(($unsigned(((wire120 ?
                  wire114 : reg117) >> {wire113,
                  (8'ha0)})) <= ($unsigned((reg133 ? (7'h41) : (8'hbf))) ?
                  $unsigned((!reg130)) : (~^wire114))));
              reg134 <= (8'ha0);
            end
          reg135 <= $unsigned(((($signed(wire128) == wire115[(3'h6):(3'h5)]) ?
                  wire115 : ((^wire120) < (reg129 >> wire112))) ?
              (~&(wire114 < wire128)) : ($unsigned($unsigned(reg131)) & (~^reg117[(4'hd):(3'h7)]))));
        end
      else
        begin
          reg129 <= wire111[(4'h9):(3'h5)];
        end
    end
  assign wire136 = {wire121};
  assign wire137 = (^{((wire126 << (wire124 ? wire124 : reg131)) ?
                           reg134[(1'h0):(1'h0)] : $unsigned((reg134 == wire116)))});
endmodule

module module96
#(parameter param106 = {((+({(8'hb9)} ? ((8'had) ? (8'hb2) : (8'h9e)) : ((8'h9e) & (8'hbb)))) ? {((^~(8'hba)) == (^~(8'hbe))), (&(~(8'hba)))} : ((|((8'ha4) > (8'hb5))) ? (~^(!(8'ha3))) : (8'ha3))), {({((8'ha7) <= (8'ha4)), ((8'haa) + (8'ha1))} * ((8'ha2) ^~ {(8'ha8), (8'hab)})), ((((8'h9e) ? (8'hba) : (7'h41)) <<< (~^(8'ha7))) << (((7'h44) ? (8'hae) : (7'h41)) || (~&(7'h42))))}}, 
parameter param107 = ((param106 && (param106 == (((8'h9c) ? (8'haa) : param106) ? (param106 <= param106) : (param106 << param106)))) >>> param106))
(y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'h26):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire100;
  input wire signed [(5'h13):(1'h0)] wire99;
  input wire signed [(4'h8):(1'h0)] wire98;
  input wire [(5'h14):(1'h0)] wire97;
  wire signed [(2'h3):(1'h0)] wire104;
  wire signed [(4'h9):(1'h0)] wire103;
  wire signed [(5'h12):(1'h0)] wire102;
  wire [(3'h5):(1'h0)] wire101;
  reg [(2'h2):(1'h0)] reg105 = (1'h0);
  assign y = {wire104, wire103, wire102, wire101, reg105, (1'h0)};
  assign wire101 = wire97[(4'ha):(3'h4)];
  assign wire102 = $signed((wire97[(3'h5):(3'h4)] >= $unsigned($signed((wire98 ?
                       wire97 : wire99)))));
  assign wire103 = $signed(wire97[(3'h5):(1'h0)]);
  assign wire104 = $signed(wire98);
  always
    @(posedge clk) begin
      reg105 <= ((((-$signed((7'h41))) ?
              ((wire104 - wire99) ?
                  {(8'ha0),
                      wire100} : (^~wire97)) : $signed((wire97 || wire103))) ?
          (+$signed((wire99 ?
              (8'ha7) : wire104))) : $signed(wire103[(3'h5):(1'h0)])) + $unsigned($signed($unsigned(wire102))));
    end
endmodule

module module56
#(parameter param92 = {{((!{(8'ha3)}) || (((8'had) ? (8'hb4) : (8'had)) != ((7'h44) ? (8'ha8) : (8'h9d)))), (^~(((8'hba) >> (8'hb6)) ? ((8'ha5) ? (8'h9d) : (8'ha8)) : ((8'hb5) ? (8'ha3) : (7'h40))))}, {((^((8'hac) && (8'hb1))) ? ((-(8'hb9)) ? ((8'haa) ? (8'hb5) : (8'ha4)) : ((8'ha3) || (8'hae))) : (8'hb3)), (~|(-{(8'hb0)}))}}, 
parameter param93 = param92)
(y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire61;
  input wire signed [(4'hc):(1'h0)] wire60;
  input wire [(5'h14):(1'h0)] wire59;
  input wire signed [(2'h3):(1'h0)] wire58;
  input wire signed [(3'h5):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire91;
  wire signed [(4'h8):(1'h0)] wire87;
  wire signed [(3'h4):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire84;
  wire [(5'h10):(1'h0)] wire83;
  wire signed [(2'h2):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire73;
  wire [(5'h14):(1'h0)] wire72;
  wire [(5'h10):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire69;
  wire [(3'h7):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire67;
  wire [(4'h8):(1'h0)] wire65;
  wire signed [(3'h5):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire62;
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg89 = (1'h0);
  reg [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(5'h12):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  assign y = {wire91,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 reg90,
                 reg89,
                 reg88,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg66,
                 (1'h0)};
  assign wire62 = $unsigned($unsigned(wire58));
  assign wire63 = (((wire57 && wire57) <= $unsigned($unsigned((wire61 | wire61)))) ?
                      {(~&wire57[(1'h1):(1'h0)]),
                          $signed($unsigned(wire58[(2'h3):(2'h2)]))} : $signed({wire60}));
  assign wire64 = $unsigned(wire63);
  assign wire65 = (~|wire61);
  always
    @(posedge clk) begin
      reg66 <= ($signed($unsigned((wire57[(3'h5):(2'h2)] >>> wire58))) == $unsigned((($signed(wire65) < (wire63 ?
          wire65 : wire65)) - $unsigned({wire58}))));
    end
  assign wire67 = ($signed($unsigned(($signed(reg66) > $signed(wire61)))) ?
                      ((+wire60[(3'h5):(1'h1)]) ?
                          (({wire61,
                              wire65} || (wire59 == wire64)) * $unsigned($signed(wire64))) : $signed({wire57})) : ((({wire60,
                                  wire60} ?
                              {(8'hab)} : (~(8'ha8))) <<< ((!(7'h40)) ?
                              (&wire64) : $unsigned(wire58))) ?
                          wire62[(4'h9):(1'h0)] : wire61));
  assign wire68 = {$signed($signed(((wire62 ?
                          wire67 : (8'hb4)) != (~(8'ha3))))),
                      $unsigned(reg66[(3'h4):(2'h2)])};
  assign wire69 = (wire60[(2'h3):(2'h3)] ?
                      $signed(wire57[(2'h3):(2'h3)]) : ($signed({$signed(wire60)}) ?
                          wire60[(3'h7):(2'h3)] : wire62[(1'h0):(1'h0)]));
  assign wire70 = $unsigned(wire57);
  assign wire71 = $signed(wire67);
  assign wire72 = (8'hb0);
  assign wire73 = $signed((7'h41));
  assign wire74 = (~(wire61[(3'h6):(3'h6)] ?
                      (wire69 ?
                          ((wire73 ? wire57 : wire65) ?
                              wire64 : {wire59}) : (wire67[(1'h1):(1'h0)] ?
                              $unsigned((8'hbd)) : (wire68 ?
                                  wire70 : (7'h40)))) : $signed(wire67[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg75 <= wire69[(4'hb):(4'h9)];
      reg76 <= reg75;
      reg77 <= ({(wire72 ? wire73 : $signed((wire69 || wire72))),
          ($signed($signed((8'hbf))) >= {wire62[(4'hf):(1'h0)],
              $signed(wire68)})} && reg76);
      if ((!wire72[(4'hf):(4'hd)]))
        begin
          reg78 <= wire65;
        end
      else
        begin
          reg78 <= ({(~^($signed(wire68) >= (~^(7'h44)))),
                  $signed(($signed(reg76) ? (8'h9d) : (reg76 != wire71)))} ?
              (((reg77 ~^ wire68) ?
                      $signed(((8'h9c) ~^ wire68)) : $signed($unsigned(wire68))) ?
                  (wire73[(3'h4):(1'h0)] ?
                      wire72 : $signed((wire61 ^ wire58))) : (&({wire61,
                          wire62} ?
                      {(8'hb9),
                          wire57} : $unsigned(wire72)))) : ((~^$unsigned((^wire57))) >= $signed((wire62[(1'h1):(1'h0)] - wire59))));
          reg79 <= wire57;
          reg80 <= wire57[(1'h0):(1'h0)];
        end
      reg81 <= reg66[(3'h5):(1'h0)];
    end
  assign wire82 = reg80[(3'h7):(1'h0)];
  assign wire83 = $unsigned(($unsigned((8'hac)) ?
                      wire73[(4'hf):(3'h4)] : wire72[(4'hc):(2'h2)]));
  assign wire84 = ($unsigned(wire73[(2'h2):(1'h1)]) ?
                      $unsigned($unsigned($signed(reg78))) : ((({wire62,
                                  reg78} ?
                              $unsigned(wire64) : ((8'ha4) ?
                                  (8'ha4) : wire73)) ?
                          {$unsigned(wire60),
                              $unsigned(reg75)} : wire74) || (~&(~^(reg77 && wire74)))));
  assign wire85 = $unsigned((~$signed((~$unsigned(reg66)))));
  assign wire86 = $unsigned((8'ha5));
  assign wire87 = (~$unsigned(wire65));
  always
    @(posedge clk) begin
      reg88 <= (wire74 && reg81);
      reg89 <= (!((((^wire84) ?
          (-wire72) : wire67[(3'h7):(2'h2)]) ^~ wire62) ~^ (((8'ha7) << ((8'haf) != wire59)) > $unsigned($signed(wire83)))));
      reg90 <= $signed({wire63[(4'h8):(3'h4)]});
    end
  assign wire91 = $unsigned((($unsigned(wire71) ^ (~^{reg76})) | $unsigned(($signed(wire65) ?
                      {reg89, (7'h41)} : {wire57, wire73}))));
endmodule

module module35  (y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire39;
  input wire [(5'h11):(1'h0)] wire38;
  input wire [(4'ha):(1'h0)] wire37;
  input wire [(5'h11):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire52;
  wire [(5'h10):(1'h0)] wire51;
  wire signed [(4'h9):(1'h0)] wire43;
  wire [(4'hc):(1'h0)] wire40;
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire43,
                 wire40,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire40 = wire38[(3'h7):(3'h6)];
  always
    @(posedge clk) begin
      reg41 <= $signed(wire40);
      reg42 <= $signed({(wire39 ?
              (wire38 == $signed(wire37)) : (|((8'hbd) >> wire36)))});
    end
  assign wire43 = (~|((+($unsigned(wire39) ^ wire37[(2'h3):(1'h0)])) || $signed(((&wire38) ?
                      (wire37 ? reg42 : wire36) : $unsigned(wire36)))));
  always
    @(posedge clk) begin
      if (wire43[(2'h3):(1'h0)])
        begin
          reg44 <= ((|(-wire36[(5'h10):(3'h7)])) >= $unsigned(wire38[(5'h10):(5'h10)]));
        end
      else
        begin
          reg44 <= (((~|($signed(wire43) ? wire40 : wire37)) ?
              reg42[(2'h3):(2'h2)] : reg42) | ((~$signed((wire43 ^ wire39))) ?
              wire36[(4'hd):(4'hd)] : $unsigned($unsigned((wire43 >>> reg41)))));
          reg45 <= ((^~$signed({(wire38 >> reg42), $signed(reg41)})) ?
              (~{$unsigned(reg44)}) : wire38[(4'ha):(4'h8)]);
          if ((reg45 + ((|reg41[(2'h3):(2'h3)]) ?
              (^(^~wire38[(5'h11):(4'hb)])) : $signed(wire38[(2'h3):(2'h3)]))))
            begin
              reg46 <= reg42;
              reg47 <= $signed($signed($signed(wire38)));
              reg48 <= $signed($signed({$unsigned((reg46 ? wire39 : wire43))}));
            end
          else
            begin
              reg46 <= (({(^~wire43[(3'h4):(3'h4)]),
                      ($unsigned(wire38) ?
                          ((8'ha2) ? reg46 : (8'haf)) : $unsigned(wire38))} ?
                  $unsigned({(wire40 >> wire36)}) : ($unsigned($signed(wire40)) * $signed(wire43))) * (($signed((reg42 | (8'hb8))) && (&(wire39 ?
                      wire43 : reg48))) ?
                  (reg44[(2'h3):(2'h2)] < (wire39[(3'h4):(1'h1)] ^ (wire36 ?
                      reg47 : reg44))) : (7'h40)));
            end
        end
      reg49 <= (~wire38);
    end
  always
    @(posedge clk) begin
      reg50 <= $signed((({(~^reg45)} & reg49) ?
          (|$signed($unsigned(reg44))) : $signed($signed({wire37, reg49}))));
    end
  assign wire51 = ((^$unsigned($signed($signed(wire43)))) ?
                      $signed(((~&(reg41 ?
                          wire40 : reg46)) ^ (+(8'hbd)))) : (~|$signed({(|reg41),
                          reg49})));
  assign wire52 = $signed($signed(reg47[(4'hc):(2'h3)]));
endmodule
