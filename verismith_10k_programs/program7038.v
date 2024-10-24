module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire144;
  wire [(5'h14):(1'h0)] wire143;
  wire signed [(5'h14):(1'h0)] wire128;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire109;
  wire [(3'h4):(1'h0)] wire130;
  wire [(4'he):(1'h0)] wire131;
  wire signed [(3'h4):(1'h0)] wire132;
  wire [(4'hb):(1'h0)] wire133;
  wire signed [(2'h2):(1'h0)] wire134;
  wire [(5'h14):(1'h0)] wire135;
  wire signed [(5'h14):(1'h0)] wire136;
  wire signed [(3'h6):(1'h0)] wire141;
  reg [(4'he):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg138 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire128,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire109,
                 wire130,
                 wire131,
                 wire132,
                 wire133,
                 wire134,
                 wire135,
                 wire136,
                 wire141,
                 reg140,
                 reg139,
                 reg138,
                 reg111,
                 (1'h0)};
  assign wire5 = ($unsigned(wire1[(3'h7):(1'h0)]) < $unsigned($signed($signed(wire3[(3'h7):(3'h5)]))));
  assign wire6 = $signed(wire3[(1'h1):(1'h0)]);
  assign wire7 = wire2[(5'h10):(3'h4)];
  assign wire8 = wire3[(1'h0):(1'h0)];
  assign wire9 = ({(^wire5),
                     wire8} || $unsigned(((wire7[(1'h0):(1'h0)] >>> (~wire6)) ?
                     $signed(wire4[(1'h1):(1'h0)]) : $unsigned((wire4 || wire0)))));
  module10 #() modinst110 (wire109, clk, wire3, wire8, wire9, wire2, wire4);
  always
    @(posedge clk) begin
      reg111 <= (^~wire5[(1'h0):(1'h0)]);
    end
  module112 #() modinst129 (wire128, clk, wire4, wire9, wire5, wire6, wire1);
  assign wire130 = $signed((~$signed(wire109[(2'h3):(1'h1)])));
  assign wire131 = (wire4 ?
                       (+({$unsigned((8'ha6))} ^~ ((|wire5) < (wire6 ~^ wire128)))) : {$signed((wire6[(2'h2):(1'h0)] || $signed(wire9)))});
  assign wire132 = $unsigned((wire8 ^~ (^wire128[(4'hb):(3'h6)])));
  assign wire133 = wire3[(2'h2):(1'h0)];
  assign wire134 = {reg111, (^~(~&wire1))};
  assign wire135 = $unsigned(wire130);
  module20 #() modinst137 (.y(wire136), .wire22(wire131), .wire21(reg111), .clk(clk), .wire25(wire135), .wire24(wire6), .wire23(wire5));
  always
    @(posedge clk) begin
      reg138 <= $signed(($signed(((wire8 >>> wire2) ?
          $signed(wire132) : (~&wire0))) >> (wire134 >= ($signed(wire130) + wire9))));
      reg139 <= (~^reg111[(5'h15):(4'he)]);
      reg140 <= {reg111};
    end
  module20 #() modinst142 (wire141, clk, reg111, wire6, wire133, wire3, reg138);
  assign wire143 = $signed(wire5);
  assign wire144 = wire6;
endmodule

module module112
#(parameter param126 = ((^((((8'hab) ? (8'hba) : (7'h43)) ? ((8'h9d) ? (8'hba) : (8'hbc)) : (-(7'h44))) || (!((8'hb2) ? (7'h41) : (8'hbb))))) >= (&{{((8'hbe) >= (8'hb4)), (^~(7'h44))}, (((8'hbf) ? (8'hb1) : (8'hb0)) ? ((8'ha5) ~^ (8'hb6)) : ((8'hac) ? (8'hb3) : (8'had)))})), 
parameter param127 = ((-({(param126 != param126)} ^~ (7'h43))) ^ (+(8'hb7))))
(y, clk, wire117, wire116, wire115, wire114, wire113);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire117;
  input wire [(4'hf):(1'h0)] wire116;
  input wire [(2'h3):(1'h0)] wire115;
  input wire signed [(3'h7):(1'h0)] wire114;
  input wire signed [(5'h10):(1'h0)] wire113;
  wire signed [(4'h8):(1'h0)] wire125;
  wire [(4'ha):(1'h0)] wire124;
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg122 = (1'h0);
  reg [(5'h14):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg119 = (1'h0);
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  assign y = {wire125,
                 wire124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg118 <= wire113[(3'h4):(1'h0)];
      reg119 <= ($signed(wire116[(4'hb):(3'h7)]) ?
          (((|(^~wire116)) == (~^wire113)) ^ {({wire115,
                  wire116} >= (+wire116)),
              (&$signed(wire114))}) : $unsigned(wire114[(2'h3):(2'h2)]));
      reg120 <= $unsigned(wire114[(1'h1):(1'h1)]);
      reg121 <= ($unsigned(($signed(wire117) != reg120)) <= ($signed((^(~&wire114))) >> (~|({reg119} | (reg118 ?
          reg120 : wire114)))));
    end
  always
    @(posedge clk) begin
      reg122 <= reg119;
      reg123 <= wire115[(2'h3):(2'h2)];
    end
  assign wire124 = $signed(wire115[(1'h1):(1'h1)]);
  assign wire125 = $unsigned(((reg123 ?
                           (7'h43) : $unsigned(reg122[(3'h6):(3'h5)])) ?
                       reg122 : reg119));
endmodule

module module10
#(parameter param107 = (-({(((8'ha2) ? (8'hbd) : (8'ha7)) ? (&(8'ha2)) : ((8'ha8) >> (7'h41))), {(&(8'hb7)), ((8'h9c) ? (7'h43) : (8'hba))}} ^~ (8'hb8))), 
parameter param108 = ({(param107 ^~ (param107 >= (~|param107)))} ^ (8'had)))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire15;
  input wire signed [(4'hc):(1'h0)] wire14;
  input wire [(4'hc):(1'h0)] wire13;
  input wire [(4'he):(1'h0)] wire12;
  input wire signed [(3'h7):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire106;
  wire [(5'h14):(1'h0)] wire105;
  wire [(4'hf):(1'h0)] wire104;
  wire signed [(4'h9):(1'h0)] wire103;
  wire signed [(4'hc):(1'h0)] wire102;
  wire signed [(4'he):(1'h0)] wire101;
  wire signed [(5'h15):(1'h0)] wire99;
  wire [(3'h7):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire77;
  wire signed [(3'h4):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(4'he):(1'h0)] wire42;
  wire [(3'h6):(1'h0)] wire73;
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire99,
                 wire78,
                 wire77,
                 wire75,
                 wire39,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire41,
                 wire42,
                 wire73,
                 reg76,
                 (1'h0)};
  assign wire16 = (wire15 < wire12);
  assign wire17 = $unsigned((~&(^wire11)));
  assign wire18 = $unsigned((+{wire13}));
  assign wire19 = (wire17[(4'ha):(3'h5)] > wire13[(2'h3):(2'h3)]);
  module20 #() modinst40 (.wire21(wire18), .clk(clk), .y(wire39), .wire25(wire12), .wire24(wire13), .wire23(wire11), .wire22(wire16));
  assign wire41 = $unsigned((+(wire13 & wire11[(1'h1):(1'h0)])));
  assign wire42 = wire15;
  module43 #() modinst74 (wire73, clk, wire42, wire11, wire12, wire13, wire17);
  assign wire75 = (({(-wire18)} ?
                          wire16[(4'h9):(4'h9)] : ((~$signed(wire14)) < {(&wire73),
                              $unsigned((8'had))})) ?
                      wire12[(4'h9):(1'h1)] : $signed($unsigned({(wire14 ^~ wire11),
                          (wire14 ? (8'hb4) : wire42)})));
  always
    @(posedge clk) begin
      reg76 <= {((~&(wire16 ? wire15 : $signed(wire19))) ?
              $unsigned(wire42[(2'h2):(1'h1)]) : wire11[(1'h1):(1'h0)])};
    end
  assign wire77 = ($signed($signed($unsigned({wire11, wire12}))) ?
                      ((($signed(wire42) ?
                              {wire41} : wire15) == (&wire39[(5'h11):(3'h6)])) ?
                          $signed($signed(wire73[(1'h0):(1'h0)])) : wire42) : $signed(((8'hae) ?
                          ($unsigned(wire12) ?
                              $signed((7'h44)) : (^~wire18)) : wire15)));
  assign wire78 = ((reg76[(4'hd):(3'h5)] ?
                          wire13[(3'h4):(1'h0)] : $signed($unsigned({wire42}))) ?
                      (8'h9d) : ((^($unsigned(wire12) ?
                          (wire12 ?
                              wire18 : wire39) : $unsigned(wire41))) ~^ ((-wire13[(4'ha):(3'h7)]) <<< {$signed(wire17),
                          $signed(wire11)})));
  module79 #() modinst100 (wire99, clk, wire14, wire11, wire41, wire17);
  assign wire101 = {({$unsigned(wire41[(2'h3):(1'h0)]),
                           ($signed(wire18) >>> (wire41 ?
                               (8'ha6) : wire19))} > (~&wire78)),
                       (wire13[(2'h3):(2'h3)] || {$signed($signed((8'ha9))),
                           (wire15[(4'ha):(2'h2)] >>> (~|wire19))})};
  assign wire102 = (wire11 & (($signed((wire17 ^~ wire13)) ?
                       $signed($unsigned((7'h42))) : ($unsigned(wire78) ?
                           $signed((8'haf)) : wire18)) & ({(wire42 != wire75)} ?
                       {(wire42 ? wire41 : wire18),
                           (8'ha8)} : {$signed(wire75)})));
  assign wire103 = wire39;
  assign wire104 = $unsigned(wire14[(3'h6):(2'h2)]);
  assign wire105 = reg76;
  assign wire106 = ($unsigned($unsigned(wire12[(4'he):(4'hb)])) ?
                       wire75[(3'h4):(3'h4)] : ((wire41 ?
                           wire73 : $unsigned($signed((8'h9e)))) * (8'hb7)));
endmodule

module module79  (y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire83;
  input wire signed [(2'h2):(1'h0)] wire82;
  input wire signed [(5'h11):(1'h0)] wire81;
  input wire [(5'h11):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire98;
  wire signed [(4'he):(1'h0)] wire97;
  wire signed [(2'h3):(1'h0)] wire96;
  wire [(5'h10):(1'h0)] wire95;
  wire signed [(5'h13):(1'h0)] wire94;
  wire signed [(5'h10):(1'h0)] wire93;
  wire [(4'hd):(1'h0)] wire92;
  wire [(4'he):(1'h0)] wire91;
  wire signed [(3'h4):(1'h0)] wire90;
  wire signed [(4'h9):(1'h0)] wire89;
  wire signed [(4'hd):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire87;
  wire [(5'h14):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire84;
  assign y = {wire98,
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
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 (1'h0)};
  assign wire84 = wire82[(2'h2):(1'h0)];
  assign wire85 = wire80[(3'h5):(2'h3)];
  assign wire86 = wire81;
  assign wire87 = (^wire84);
  assign wire88 = wire82[(2'h2):(1'h0)];
  assign wire89 = (+$unsigned($signed(wire88[(2'h3):(2'h2)])));
  assign wire90 = $signed({($signed(wire80) || ($unsigned(wire83) >>> {wire88}))});
  assign wire91 = ({wire88[(3'h5):(3'h4)],
                      wire80[(4'hb):(1'h1)]} || $unsigned(wire86[(3'h4):(3'h4)]));
  assign wire92 = ($signed(wire85) * (8'hb7));
  assign wire93 = wire92;
  assign wire94 = ($unsigned(wire80[(2'h2):(2'h2)]) + wire91);
  assign wire95 = ($unsigned((&$unsigned($unsigned(wire83)))) | wire82[(2'h2):(2'h2)]);
  assign wire96 = ((wire90[(2'h2):(1'h0)] == $unsigned($unsigned(wire84))) ^~ (&(wire90 ?
                      wire85[(2'h2):(1'h1)] : (7'h41))));
  assign wire97 = ((wire89[(3'h5):(3'h4)] ?
                          $unsigned((wire96 ?
                              ((8'ha4) != (8'hbb)) : wire95)) : $signed(wire90[(1'h1):(1'h1)])) ?
                      wire83 : (wire80[(3'h5):(2'h2)] ~^ $unsigned($signed((+wire89)))));
  assign wire98 = $signed(wire94);
endmodule

module module43
#(parameter param71 = {(~|((((8'hbd) << (8'hb9)) + (~&(8'hac))) >> ((^~(8'hbb)) ? ((8'ha8) ? (8'h9f) : (8'haf)) : {(8'hb4), (7'h43)})))}, 
parameter param72 = (+(((7'h44) ? {(param71 ? param71 : param71)} : (~&(param71 + (7'h40)))) < param71)))
(y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire48;
  input wire [(3'h7):(1'h0)] wire47;
  input wire signed [(4'h9):(1'h0)] wire46;
  input wire signed [(3'h6):(1'h0)] wire45;
  input wire [(3'h7):(1'h0)] wire44;
  wire signed [(5'h12):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire54;
  wire [(5'h11):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire52;
  wire signed [(3'h5):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire49;
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  assign y = {wire70,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire49 = wire45[(2'h2):(1'h0)];
  assign wire50 = (~^(8'had));
  assign wire51 = {($signed(wire47[(3'h6):(2'h2)]) ?
                          $signed($signed($signed(wire44))) : wire45[(1'h1):(1'h0)]),
                      ({{((8'ha5) >= wire50)}, $unsigned(wire44)} | wire49)};
  assign wire52 = wire48;
  assign wire53 = (({((wire45 ? wire50 : wire46) ? $unsigned((8'hbf)) : wire47),
                          $signed($unsigned(wire44))} >> $unsigned({wire50[(3'h7):(3'h5)],
                          $signed(wire44)})) ?
                      wire50 : (wire49 <= wire46));
  assign wire54 = $signed((^~(~|$signed($signed(wire45)))));
  assign wire55 = ($unsigned(wire48) >> $unsigned($unsigned($unsigned((wire45 ?
                      wire54 : wire52)))));
  always
    @(posedge clk) begin
      if ($unsigned(((^$signed((wire54 ? wire54 : wire53))) == wire54)))
        begin
          reg56 <= {wire47[(3'h6):(2'h2)], {(-wire50[(3'h5):(1'h1)])}};
          if ({($unsigned((8'hbd)) ?
                  (-wire49[(4'ha):(3'h6)]) : (~^$signed(wire53))),
              (~&wire47)})
            begin
              reg57 <= {$signed($unsigned(wire54[(4'he):(4'hc)]))};
              reg58 <= (~&{(!wire54)});
              reg59 <= (8'ha0);
            end
          else
            begin
              reg57 <= (-{(^$unsigned(reg59[(4'hd):(4'ha)])),
                  (($signed(wire44) && reg57[(4'h8):(3'h6)]) ?
                      ($unsigned(wire46) ?
                          (wire54 ? wire55 : wire53) : wire44) : reg56)});
              reg58 <= {(~reg56),
                  ((8'hb1) ?
                      (($unsigned(reg56) || (wire51 ?
                          wire47 : reg58)) < $signed($unsigned(reg56))) : ($signed((wire44 ?
                          wire54 : wire50)) >>> reg58))};
              reg59 <= wire46;
            end
          reg60 <= (8'hae);
          if ($signed((^(^(&{wire44})))))
            begin
              reg61 <= ({(wire48 * $signed((8'h9c)))} > $unsigned(wire46));
              reg62 <= ($unsigned({{wire48[(1'h0):(1'h0)]},
                  {{wire51}}}) | {(-$unsigned(reg59))});
              reg63 <= $unsigned({$signed(wire47[(3'h6):(3'h6)]), reg59});
            end
          else
            begin
              reg61 <= wire49[(4'ha):(4'h8)];
            end
          reg64 <= (wire50 ? (^(|wire48)) : reg56[(1'h1):(1'h0)]);
        end
      else
        begin
          if (((wire53 <= (-($unsigned(wire47) ?
                  $unsigned(reg62) : {wire54}))) ?
              (8'hbd) : wire45))
            begin
              reg56 <= ((~&reg64) ?
                  $signed(wire47[(3'h6):(2'h3)]) : {$signed(wire55), (8'h9c)});
              reg57 <= (wire53[(4'ha):(3'h6)] ?
                  (wire50 == {{(^~reg64)}}) : wire53[(4'hd):(4'hb)]);
            end
          else
            begin
              reg56 <= (!(-wire48));
              reg57 <= $unsigned(wire55[(3'h6):(1'h1)]);
              reg58 <= wire48[(4'hd):(2'h2)];
              reg59 <= wire47;
            end
        end
      reg65 <= ($unsigned($unsigned(wire55)) ?
          $unsigned(reg57[(4'hc):(2'h2)]) : $signed($signed(wire53[(4'h9):(3'h5)])));
      reg66 <= wire50;
      reg67 <= reg59;
    end
  always
    @(posedge clk) begin
      reg68 <= wire45[(1'h1):(1'h0)];
      reg69 <= ($signed($unsigned(reg59[(4'hf):(4'ha)])) ~^ $unsigned((7'h43)));
    end
  assign wire70 = ($unsigned($signed((reg67 <<< {reg60,
                      wire44}))) <= $signed({(~&$unsigned(wire48))}));
endmodule

module module20
#(parameter param37 = ((+(~&((^(8'h9d)) >>> ((8'ha2) ? (8'hb3) : (7'h40))))) ? (((7'h40) ? (((8'hb0) && (8'ha0)) || ((8'hb7) ~^ (8'haa))) : (|((8'ha1) * (8'haa)))) ? (^((!(8'haf)) | {(8'hb0)})) : {(&((8'ha8) <<< (8'hbd))), (((8'haf) * (8'hb2)) ? ((7'h42) ? (8'hb2) : (8'hb2)) : (~^(8'hbd)))}) : {((((8'ha2) <= (8'ha7)) ? ((8'hb0) & (8'ha2)) : (~&(8'ha0))) ? (((8'hbe) <<< (8'hbf)) >> ((8'hb4) < (8'hbe))) : (((7'h42) ? (8'hac) : (8'ha9)) != ((8'hb7) ? (8'h9d) : (8'ha2)))), ({((8'h9f) && (8'haf)), {(8'h9f)}} ? (-((8'ha4) ? (8'ha7) : (8'h9f))) : (((8'h9e) ? (8'ha5) : (7'h40)) ? (~^(8'hb9)) : (~&(7'h44))))}), 
parameter param38 = param37)
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire25;
  input wire signed [(4'hc):(1'h0)] wire24;
  input wire [(3'h5):(1'h0)] wire23;
  input wire signed [(4'ha):(1'h0)] wire22;
  input wire signed [(5'h15):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire26;
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire26 = (~&wire23[(1'h0):(1'h0)]);
  assign wire27 = wire25;
  assign wire28 = wire22[(1'h1):(1'h1)];
  assign wire29 = ((~&(wire22[(4'ha):(2'h2)] ?
                          (~^$signed(wire21)) : $signed(wire24[(4'hb):(3'h5)]))) ?
                      wire28[(2'h3):(2'h2)] : (wire26[(1'h0):(1'h0)] >> $signed(((~^wire21) ?
                          $unsigned(wire24) : wire23[(2'h3):(1'h1)]))));
  always
    @(posedge clk) begin
      reg30 <= ((((wire28[(3'h7):(3'h4)] + wire24) ?
              wire28[(1'h0):(1'h0)] : (wire25 ?
                  wire25[(2'h2):(1'h1)] : (~^(8'hbf)))) || ((|wire22[(4'ha):(4'h9)]) ?
              $signed((-(7'h43))) : $unsigned($unsigned((8'hb0))))) ?
          ($signed($signed($unsigned(wire23))) - (!wire22[(1'h0):(1'h0)])) : $unsigned((wire22 - {wire21[(4'hb):(3'h4)],
              $unsigned((7'h41))})));
      reg31 <= (wire24 >>> (wire28 ?
          ($unsigned($signed(wire27)) > ((wire29 ?
              wire26 : (8'ha5)) << wire27[(3'h6):(2'h3)])) : $signed(wire27[(3'h6):(3'h5)])));
    end
  assign wire32 = ((wire25 >>> (($unsigned(wire24) ?
                          (wire23 | (8'haa)) : (reg31 >= (8'ha1))) < reg30)) ?
                      wire29[(3'h4):(3'h4)] : ($unsigned($signed(reg31)) >= wire25[(3'h4):(1'h0)]));
  assign wire33 = wire24[(4'ha):(3'h4)];
  assign wire34 = wire26;
  assign wire35 = (wire23 ?
                      (8'hba) : (({{(8'ha6), wire34}} ?
                              (|$unsigned(wire25)) : ((wire29 ?
                                  wire27 : (8'hbd)) & wire24)) ?
                          wire22 : {wire33[(3'h5):(2'h3)],
                              $signed($unsigned(wire23))}));
  assign wire36 = wire25;
endmodule
