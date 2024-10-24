module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire149;
  wire signed [(2'h3):(1'h0)] wire148;
  wire signed [(5'h14):(1'h0)] wire147;
  wire [(3'h6):(1'h0)] wire146;
  wire signed [(2'h2):(1'h0)] wire145;
  wire [(5'h11):(1'h0)] wire133;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire135;
  wire [(5'h12):(1'h0)] wire136;
  wire signed [(5'h10):(1'h0)] wire137;
  wire signed [(2'h3):(1'h0)] wire138;
  wire signed [(4'he):(1'h0)] wire139;
  wire [(4'hf):(1'h0)] wire140;
  wire [(5'h15):(1'h0)] wire141;
  wire signed [(3'h5):(1'h0)] wire142;
  wire [(3'h5):(1'h0)] wire143;
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire133,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire135,
                 wire136,
                 wire137,
                 wire138,
                 wire139,
                 wire140,
                 wire141,
                 wire142,
                 wire143,
                 (1'h0)};
  assign wire4 = (((+wire1[(1'h0):(1'h0)]) & wire1[(2'h2):(1'h1)]) ?
                     {wire2[(1'h1):(1'h1)]} : ((wire3 ?
                         (wire2[(2'h3):(1'h1)] ?
                             wire2[(3'h4):(2'h3)] : $signed(wire0)) : wire3[(1'h0):(1'h0)]) ~^ ($signed(wire0[(4'h8):(2'h3)]) & (~&wire1))));
  assign wire5 = (^~$signed({((+(8'ha7)) > $signed((8'haa))),
                     (~|(~&(8'hb2)))}));
  assign wire6 = wire4[(4'h8):(4'h8)];
  assign wire7 = wire1[(1'h1):(1'h0)];
  module8 #() modinst134 (.wire9(wire5), .wire13(wire4), .clk(clk), .wire10(wire2), .wire11(wire1), .y(wire133), .wire12(wire7));
  assign wire135 = wire5;
  assign wire136 = (-{wire7[(5'h12):(4'ha)],
                       ((wire133 ? $signed(wire1) : wire0[(1'h0):(1'h0)]) ?
                           ((wire3 ? wire2 : wire135) ?
                               $signed(wire2) : (wire6 ?
                                   wire1 : wire3)) : wire3)});
  assign wire137 = $unsigned(wire7[(4'he):(2'h3)]);
  assign wire138 = wire5[(4'h8):(1'h1)];
  assign wire139 = $signed((&((wire1[(5'h15):(4'hc)] ?
                       (wire138 ? wire135 : wire137) : {wire4,
                           (7'h40)}) ^ $signed($unsigned(wire136)))));
  assign wire140 = ($unsigned($signed(($signed(wire6) & wire139))) < (!(wire6 == wire133[(3'h5):(3'h5)])));
  assign wire141 = (-(^~($unsigned((wire4 == wire2)) ?
                       $signed(wire7[(4'hf):(4'h9)]) : $signed((wire5 ?
                           wire138 : wire140)))));
  assign wire142 = ((~|$signed(wire7[(5'h13):(4'h9)])) >= wire138[(2'h3):(2'h3)]);
  module92 #() modinst144 (.wire93(wire140), .wire94(wire141), .wire95(wire7), .y(wire143), .wire96(wire137), .clk(clk), .wire97(wire2));
  assign wire145 = $signed(wire143[(2'h3):(2'h3)]);
  assign wire146 = $signed((~&wire3[(3'h4):(2'h2)]));
  assign wire147 = (8'ha4);
  assign wire148 = $signed(($signed($unsigned($signed(wire147))) >= (wire3 ?
                       $unsigned($unsigned(wire3)) : $signed((wire136 ?
                           wire133 : wire146)))));
  assign wire149 = (&$unsigned($unsigned($unsigned($signed(wire4)))));
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire signed [(4'hd):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire132;
  wire signed [(3'h5):(1'h0)] wire131;
  wire signed [(4'h8):(1'h0)] wire130;
  wire signed [(5'h11):(1'h0)] wire129;
  wire signed [(5'h10):(1'h0)] wire127;
  wire [(4'h8):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  wire [(5'h10):(1'h0)] wire89;
  wire signed [(5'h10):(1'h0)] wire87;
  wire signed [(2'h3):(1'h0)] wire86;
  wire [(3'h6):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire83;
  wire signed [(5'h11):(1'h0)] wire70;
  wire signed [(3'h7):(1'h0)] wire68;
  wire [(3'h5):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire16;
  wire signed [(4'hb):(1'h0)] wire40;
  reg [(3'h5):(1'h0)] reg88 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire127,
                 wire91,
                 wire90,
                 wire89,
                 wire87,
                 wire86,
                 wire85,
                 wire83,
                 wire70,
                 wire68,
                 wire42,
                 wire14,
                 wire15,
                 wire16,
                 wire40,
                 reg88,
                 (1'h0)};
  assign wire14 = (+((~&wire10) >= ($signed($unsigned(wire11)) > (&(wire12 != wire13)))));
  assign wire15 = (((~^wire13[(3'h6):(1'h1)]) > $unsigned($signed($unsigned(wire9)))) ^ (-wire9[(1'h1):(1'h1)]));
  assign wire16 = (~&wire14[(3'h6):(1'h0)]);
  module17 #() modinst41 (.clk(clk), .wire18(wire13), .wire20(wire15), .wire21(wire16), .wire22(wire11), .y(wire40), .wire19(wire12));
  assign wire42 = $signed((!(&(wire9 && wire12[(3'h5):(3'h5)]))));
  module43 #() modinst69 (wire68, clk, wire15, wire10, wire13, wire40);
  assign wire70 = wire9[(2'h2):(2'h2)];
  module71 #() modinst84 (.wire75(wire15), .y(wire83), .wire73(wire70), .wire72(wire10), .wire74(wire9), .clk(clk));
  assign wire85 = $signed(wire11[(1'h0):(1'h0)]);
  assign wire86 = (-($signed((((8'h9e) ?
                      wire13 : wire11) > {wire9})) ^~ wire14[(4'he):(4'h8)]));
  assign wire87 = wire10[(4'hd):(3'h6)];
  always
    @(posedge clk) begin
      reg88 <= wire9;
    end
  assign wire89 = ($unsigned(wire42) ?
                      ((($unsigned((7'h40)) ? {reg88} : wire86) ?
                          $unsigned(wire13) : wire10) != ($unsigned((wire40 == wire14)) <<< wire87)) : $unsigned((wire87 ?
                          wire86 : $unsigned((wire15 ? wire15 : wire11)))));
  assign wire90 = ($unsigned((8'h9f)) ?
                      $unsigned(wire40) : (&$signed(($signed(wire68) >= $signed((8'ha6))))));
  assign wire91 = $signed(((-(8'hb7)) <<< {(8'ha4), wire40}));
  module92 #() modinst128 (wire127, clk, reg88, wire87, wire86, wire11, wire12);
  assign wire129 = wire127;
  assign wire130 = wire16;
  assign wire131 = wire9;
  assign wire132 = reg88[(2'h3):(1'h0)];
endmodule

module module92
#(parameter param125 = ((8'ha4) ? (~^({(~(8'hac)), (&(8'ha7))} <= {(^(8'ha7)), ((8'haa) ^ (8'hbe))})) : ({(^~{(8'haf), (8'hbd)})} && (((!(8'ha5)) >>> ((8'hb6) ? (8'ha6) : (8'haa))) - (~&(+(8'hb0)))))), 
parameter param126 = param125)
(y, clk, wire97, wire96, wire95, wire94, wire93);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire97;
  input wire [(5'h10):(1'h0)] wire96;
  input wire [(2'h3):(1'h0)] wire95;
  input wire [(5'h15):(1'h0)] wire94;
  input wire [(4'h9):(1'h0)] wire93;
  wire signed [(3'h4):(1'h0)] wire124;
  wire signed [(4'he):(1'h0)] wire119;
  wire signed [(3'h5):(1'h0)] wire118;
  wire signed [(5'h13):(1'h0)] wire117;
  wire signed [(5'h10):(1'h0)] wire116;
  wire signed [(5'h11):(1'h0)] wire113;
  wire signed [(3'h4):(1'h0)] wire112;
  wire signed [(4'hb):(1'h0)] wire111;
  wire [(2'h3):(1'h0)] wire110;
  wire [(4'hd):(1'h0)] wire109;
  wire [(4'hf):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire107;
  wire [(4'hb):(1'h0)] wire106;
  wire [(5'h11):(1'h0)] wire105;
  wire signed [(5'h10):(1'h0)] wire104;
  wire signed [(3'h5):(1'h0)] wire103;
  wire [(4'h8):(1'h0)] wire102;
  wire signed [(4'hf):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire100;
  wire signed [(4'ha):(1'h0)] wire99;
  wire signed [(5'h14):(1'h0)] wire98;
  reg [(4'h8):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg121 = (1'h0);
  reg [(2'h2):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg115 = (1'h0);
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  assign y = {wire124,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg115,
                 reg114,
                 (1'h0)};
  assign wire98 = $unsigned($unsigned(wire96[(2'h3):(1'h1)]));
  assign wire99 = wire98;
  assign wire100 = (8'h9f);
  assign wire101 = {(~&wire96[(1'h1):(1'h0)]),
                       (wire96[(4'ha):(1'h1)] ^ (~$unsigned($signed(wire98))))};
  assign wire102 = wire95;
  assign wire103 = $signed($unsigned(wire95[(1'h1):(1'h0)]));
  assign wire104 = $signed($unsigned(wire102));
  assign wire105 = $signed($signed($unsigned(wire102)));
  assign wire106 = wire101;
  assign wire107 = $signed($unsigned((((wire102 && wire104) ?
                           $signed((8'hb1)) : (wire99 & wire100)) ?
                       {(wire101 ? wire105 : wire99),
                           ((8'hb2) | wire95)} : $signed({wire100}))));
  assign wire108 = wire103[(3'h5):(3'h5)];
  assign wire109 = wire102;
  assign wire110 = wire102[(3'h5):(2'h3)];
  assign wire111 = wire110;
  assign wire112 = (($signed($unsigned((wire104 ? wire111 : wire109))) ?
                           ((~&$signed(wire99)) ~^ (8'ha8)) : (wire103[(1'h1):(1'h0)] >>> $unsigned($signed((8'h9d))))) ?
                       (wire109 ~^ (8'ha5)) : wire99);
  assign wire113 = ((+(($unsigned(wire104) ~^ $signed(wire111)) ?
                           $signed($signed(wire93)) : $signed(wire95[(2'h2):(1'h1)]))) ?
                       $unsigned(wire102) : wire97[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg114 <= {$unsigned(wire110), wire108[(3'h5):(1'h0)]};
      reg115 <= wire105;
    end
  assign wire116 = {wire112, (~&(^~$signed($unsigned(wire109))))};
  assign wire117 = $unsigned({(-(wire97[(2'h2):(1'h0)] ^~ (wire104 >> (8'hb1)))),
                       wire116});
  assign wire118 = (wire109[(2'h2):(2'h2)] ?
                       wire108[(4'hd):(3'h5)] : $signed((^~{wire106[(4'ha):(2'h3)],
                           (8'hb7)})));
  assign wire119 = (&(({(-wire96)} << $unsigned($unsigned(wire94))) ?
                       $unsigned(wire97) : ((^wire99) <= $unsigned((~|(8'hb9))))));
  always
    @(posedge clk) begin
      reg120 <= (($signed($unsigned(((7'h40) ?
              wire112 : wire116))) ^~ wire100) ?
          wire108 : wire96[(3'h5):(1'h0)]);
      reg121 <= {(&(wire108 ?
              ((reg115 ? wire94 : wire100) ?
                  wire116[(4'hd):(3'h5)] : reg115[(2'h2):(1'h1)]) : wire97)),
          ($unsigned($unsigned((reg114 ^~ wire108))) > wire109[(4'hc):(3'h5)])};
      reg122 <= wire98[(2'h3):(1'h1)];
      reg123 <= $unsigned({$signed($signed($signed(wire93))),
          (($signed(wire93) ? (^~(7'h42)) : (^reg120)) == ((!wire116) ?
              {(8'ha9), wire112} : $unsigned(wire94)))});
    end
  assign wire124 = $signed($unsigned({$unsigned(wire111[(1'h0):(1'h0)]),
                       (-wire103)}));
endmodule

module module71  (y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire75;
  input wire signed [(4'hd):(1'h0)] wire74;
  input wire signed [(5'h11):(1'h0)] wire73;
  input wire signed [(5'h14):(1'h0)] wire72;
  wire [(4'hd):(1'h0)] wire82;
  wire [(4'hc):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire80;
  wire signed [(5'h15):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire78;
  wire signed [(4'he):(1'h0)] wire77;
  wire [(2'h3):(1'h0)] wire76;
  assign y = {wire82, wire81, wire80, wire79, wire78, wire77, wire76, (1'h0)};
  assign wire76 = wire73;
  assign wire77 = wire76[(1'h0):(1'h0)];
  assign wire78 = (wire75[(1'h1):(1'h1)] - (($unsigned((|wire72)) & (8'hae)) | wire74[(1'h0):(1'h0)]));
  assign wire79 = $unsigned(wire72);
  assign wire80 = ((~|$signed((wire78 ? (wire75 >= wire78) : wire78))) ?
                      $unsigned($signed(((wire75 ? wire79 : wire77) ?
                          (~^wire78) : wire78[(1'h1):(1'h0)]))) : $unsigned(wire74));
  assign wire81 = (8'hbd);
  assign wire82 = {((wire75[(4'he):(4'hb)] ? $signed((&wire78)) : wire80) ?
                          (~&(~^wire75[(1'h0):(1'h0)])) : (-((!wire72) >> wire73[(4'he):(1'h1)]))),
                      (7'h44)};
endmodule

module module43
#(parameter param66 = (8'hb6), 
parameter param67 = (~&param66))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire47;
  input wire signed [(4'hd):(1'h0)] wire46;
  input wire signed [(4'hd):(1'h0)] wire45;
  input wire signed [(4'hb):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire50;
  wire signed [(3'h7):(1'h0)] wire49;
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire51,
                 wire50,
                 wire49,
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
                 reg52,
                 reg48,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg48 <= (~&wire44);
    end
  assign wire49 = $unsigned(($signed((~wire46)) + (wire47 <<< (7'h40))));
  assign wire50 = $unsigned(((+(wire49[(3'h4):(2'h2)] ?
                          (wire44 ? (8'h9e) : wire46) : (wire45 << wire46))) ?
                      $signed((reg48 ?
                          (wire45 ?
                              (8'hb8) : wire47) : wire49)) : $signed($signed((wire46 ?
                          reg48 : wire45)))));
  assign wire51 = wire44[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg52 <= (~&($signed(wire47) ?
          $signed($signed((wire45 >> wire47))) : ((wire47 ?
              $unsigned(wire51) : $unsigned(wire51)) + ((reg48 ?
                  wire45 : wire46) ?
              (reg48 ? wire47 : wire45) : wire45[(3'h7):(3'h6)]))));
      reg53 <= ({wire46[(4'hb):(3'h6)]} ?
          wire51[(1'h0):(1'h0)] : {(~&{(wire51 ? wire45 : wire44)})});
      if ($signed($unsigned(wire44[(3'h6):(3'h5)])))
        begin
          if ($unsigned((($unsigned($signed(wire50)) || (wire49 ?
              wire47[(2'h3):(2'h2)] : wire47[(2'h2):(1'h0)])) * reg48[(2'h2):(2'h2)])))
            begin
              reg54 <= {$unsigned(((^$signed(wire45)) ^~ (wire44[(3'h7):(2'h3)] ?
                      wire50 : wire49)))};
              reg55 <= wire45;
              reg56 <= $unsigned(wire45);
              reg57 <= reg53;
            end
          else
            begin
              reg54 <= wire47;
            end
          reg58 <= reg57;
          reg59 <= {($unsigned({wire49[(3'h7):(2'h2)]}) >>> $signed((^{reg53})))};
          reg60 <= ((reg55 && wire46) >> (((&(reg58 ?
                  reg59 : reg53)) ^ (7'h43)) ?
              reg53 : ($signed($signed(reg54)) ?
                  ($signed(wire49) ? (!reg58) : (reg52 - wire49)) : reg48)));
        end
      else
        begin
          reg54 <= $unsigned(reg54[(4'hc):(4'hc)]);
          if ({$signed($unsigned((^~{reg55}))),
              $unsigned((^~wire49[(1'h0):(1'h0)]))})
            begin
              reg55 <= ($signed((wire47 ?
                      {reg59[(3'h5):(3'h4)]} : reg52[(3'h4):(2'h3)])) ?
                  wire46[(3'h6):(3'h5)] : reg58);
              reg56 <= (~^(~&$unsigned($unsigned((~^wire45)))));
              reg57 <= wire50;
              reg58 <= wire49[(2'h2):(2'h2)];
            end
          else
            begin
              reg55 <= $signed(($signed(($unsigned(reg48) ?
                      (reg48 ? reg48 : reg53) : (~^wire46))) ?
                  $signed(reg54) : ($unsigned(((8'hb3) ? wire44 : reg55)) ?
                      reg52[(5'h11):(5'h10)] : (8'had))));
              reg56 <= (reg60 ? reg54 : reg59[(2'h3):(1'h1)]);
              reg57 <= (^~(+$unsigned(((wire50 ? wire47 : wire46) ?
                  reg48[(2'h3):(1'h1)] : {wire45}))));
              reg58 <= (wire47[(2'h3):(2'h3)] >= $unsigned(wire45));
              reg59 <= (((~|(~|reg54[(4'hb):(3'h6)])) ?
                  $signed((~^$unsigned(wire51))) : $unsigned(wire49[(3'h5):(3'h5)])) + {(^~$signed($unsigned(reg58)))});
            end
          reg60 <= reg54[(3'h4):(2'h2)];
        end
      reg61 <= $signed(reg48[(1'h0):(1'h0)]);
      reg62 <= ($signed((^(~$unsigned(reg61)))) ?
          {($signed($unsigned(reg58)) ?
                  $signed((&reg52)) : {(wire49 + reg56), (~|(7'h40))}),
              {(~|(^~reg57))}} : (wire44[(3'h5):(2'h3)] ?
              reg48[(2'h3):(1'h1)] : wire46[(2'h3):(2'h3)]));
    end
  assign wire63 = reg61[(3'h7):(2'h3)];
  assign wire64 = ($unsigned(wire45) ?
                      reg48[(2'h2):(1'h1)] : ({wire44[(1'h0):(1'h0)],
                              (~|$unsigned(reg60))} ?
                          $signed($signed((reg53 ?
                              reg55 : wire45))) : (~(~|(~|reg62)))));
  assign wire65 = ($unsigned((((reg61 >>> wire50) < $signed(wire64)) >= ($unsigned(wire50) >= (~wire50)))) ?
                      (reg56 <= wire49[(3'h7):(3'h5)]) : reg62[(4'hc):(4'ha)]);
endmodule

module module17  (y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire22;
  input wire [(4'ha):(1'h0)] wire21;
  input wire signed [(4'h9):(1'h0)] wire20;
  input wire signed [(5'h15):(1'h0)] wire19;
  input wire signed [(4'h9):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg37,
                 reg36,
                 reg31,
                 (1'h0)};
  assign wire23 = (~wire18[(3'h4):(1'h1)]);
  assign wire24 = (wire20 ? wire21[(3'h6):(2'h2)] : wire22[(2'h2):(1'h0)]);
  assign wire25 = ((($signed((+wire18)) ?
                          wire21[(4'ha):(3'h5)] : (((8'ha8) > wire24) ?
                              (&(8'h9e)) : wire18[(2'h2):(1'h1)])) ?
                      wire18 : $unsigned({(-wire24),
                          wire21})) == (~|($signed($signed(wire19)) ?
                      ((wire20 ? (8'hb1) : wire22) ?
                          (&wire23) : (wire18 ? wire20 : wire23)) : {wire19})));
  assign wire26 = $signed({(~&(+$signed(wire23))), wire19[(4'hd):(3'h7)]});
  assign wire27 = {wire19};
  assign wire28 = wire21[(3'h6):(3'h4)];
  assign wire29 = (!(~&$signed(wire20)));
  assign wire30 = {$signed($signed((&wire26[(3'h7):(3'h5)])))};
  always
    @(posedge clk) begin
      reg31 <= wire21[(4'h8):(2'h2)];
    end
  assign wire32 = wire24[(2'h2):(2'h2)];
  assign wire33 = ((8'ha9) ? reg31 : (~^(-{wire18[(4'h9):(1'h1)]})));
  assign wire34 = wire20[(2'h3):(1'h0)];
  assign wire35 = $unsigned(({wire24[(2'h2):(2'h2)]} ?
                      $signed(wire28[(3'h4):(2'h3)]) : ($unsigned(wire24[(2'h3):(1'h0)]) ?
                          (wire18 ?
                              $unsigned(wire24) : wire21) : wire29[(2'h2):(2'h2)])));
  always
    @(posedge clk) begin
      reg36 <= (^{(+wire28[(3'h4):(2'h2)])});
      reg37 <= (|wire30);
    end
  assign wire38 = $signed((wire20[(1'h0):(1'h0)] * reg31));
  assign wire39 = wire22;
endmodule
