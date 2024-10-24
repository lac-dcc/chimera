module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire91;
  wire signed [(4'he):(1'h0)] wire92;
  wire [(4'ha):(1'h0)] wire93;
  wire [(3'h5):(1'h0)] wire140;
  assign y = {wire4, wire89, wire91, wire92, wire93, wire140, (1'h0)};
  assign wire4 = (&wire2);
  module5 #() modinst90 (.wire6(wire2), .y(wire89), .clk(clk), .wire7(wire3), .wire9(wire1), .wire8(wire0));
  assign wire91 = ((|($unsigned($unsigned(wire89)) ?
                          ((wire3 ? wire89 : wire3) ?
                              (wire1 ? (8'ha8) : wire2) : ((8'ha8) ?
                                  (8'ha7) : wire1)) : ($unsigned((8'hb0)) << (wire89 ?
                              wire1 : wire2)))) ?
                      wire2[(4'h8):(3'h5)] : (^$unsigned($unsigned((wire2 <<< wire0)))));
  assign wire92 = $signed($signed(wire1[(4'h9):(2'h2)]));
  assign wire93 = (^~((($signed(wire92) || wire91[(4'hb):(1'h0)]) >= (+wire89[(5'h13):(3'h5)])) ^ $signed(wire91[(3'h6):(2'h3)])));
  module94 #() modinst141 (wire140, clk, wire92, wire0, wire89, wire1, wire3);
endmodule

module module94
#(parameter param138 = ({{(((8'hbb) ? (8'ha3) : (8'hab)) ? ((8'hbb) ? (8'h9e) : (8'hac)) : ((8'hb0) <= (8'hb4))), ((8'hae) ? ((8'hb9) << (8'hae)) : ((8'hb7) ? (8'hb2) : (8'hb5)))}, (~|{((8'ha9) ? (8'hb3) : (8'ha9)), ((7'h41) ? (8'hb2) : (8'hbe))})} + ((!((+(8'ha3)) ? {(8'hbe), (8'ha1)} : {(8'had)})) ~^ (^~(|(~&(8'ha2)))))), 
parameter param139 = ((~|param138) ? ((({param138} >= (~param138)) ? (&(param138 << param138)) : ((param138 ? param138 : param138) + (param138 == param138))) ? param138 : param138) : (param138 ? (param138 ? (((8'ha3) ? param138 : param138) ? (param138 ? param138 : param138) : (~|param138)) : {(param138 ? param138 : param138)}) : (8'hb5))))
(y, clk, wire99, wire98, wire97, wire96, wire95);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire99;
  input wire [(4'h9):(1'h0)] wire98;
  input wire [(5'h15):(1'h0)] wire97;
  input wire signed [(3'h5):(1'h0)] wire96;
  input wire [(4'ha):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire137;
  wire signed [(4'h9):(1'h0)] wire134;
  wire [(3'h6):(1'h0)] wire133;
  wire [(5'h11):(1'h0)] wire131;
  wire [(5'h13):(1'h0)] wire108;
  reg [(4'h8):(1'h0)] reg136 = (1'h0);
  reg [(5'h11):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg103 = (1'h0);
  reg [(5'h15):(1'h0)] reg104 = (1'h0);
  reg [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(4'he):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg107 = (1'h0);
  assign y = {wire137,
                 wire134,
                 wire133,
                 wire131,
                 wire108,
                 reg136,
                 reg135,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg100 <= (wire99 <<< wire98);
      if (($unsigned(reg100[(5'h15):(5'h15)]) ? wire95[(2'h2):(1'h1)] : wire99))
        begin
          if ($unsigned((8'haf)))
            begin
              reg101 <= ($unsigned(wire96) <<< $signed((wire97[(5'h12):(5'h11)] < ((8'ha8) * (wire97 == wire99)))));
              reg102 <= {(^~(&$unsigned(wire97[(1'h1):(1'h1)])))};
              reg103 <= (wire96[(3'h5):(2'h3)] >= $signed(wire98));
            end
          else
            begin
              reg101 <= $unsigned({(~|$signed((8'hbd)))});
              reg102 <= $signed(wire95);
              reg103 <= (($unsigned(reg103[(2'h2):(1'h0)]) >> ((!wire98) ?
                      ((reg102 << wire99) - $signed(wire98)) : (~|$unsigned((8'h9d))))) ?
                  wire99 : reg102[(2'h3):(1'h0)]);
              reg104 <= $unsigned(({{wire95,
                      wire99}} || $unsigned($unsigned((wire99 ?
                  wire95 : reg103)))));
            end
        end
      else
        begin
          reg101 <= (8'hb4);
        end
      reg105 <= ((&reg100) && (reg100 ? wire97[(4'hc):(3'h6)] : reg103));
      reg106 <= $signed(wire99[(2'h2):(1'h1)]);
      reg107 <= reg100[(4'h9):(4'h8)];
    end
  assign wire108 = reg100[(1'h1):(1'h0)];
  module109 #() modinst132 (.wire114(reg103), .wire113(reg104), .y(wire131), .wire110(reg102), .clk(clk), .wire111(wire95), .wire112(wire97));
  assign wire133 = ($unsigned({wire99, reg101}) ?
                       (~^wire97) : (wire131 ?
                           {(((8'ha8) <<< reg104) ?
                                   (reg100 ? reg103 : (8'hb5)) : wire131),
                               $signed((~|wire96))} : reg100[(5'h10):(1'h0)]));
  assign wire134 = {wire131};
  always
    @(posedge clk) begin
      reg135 <= (~^($unsigned($unsigned(reg105[(4'hd):(3'h6)])) < (^~$unsigned((reg106 ?
          reg101 : wire96)))));
      reg136 <= reg135[(3'h5):(1'h0)];
    end
  assign wire137 = $unsigned(reg101[(3'h7):(3'h7)]);
endmodule

module module5
#(parameter param88 = {((((8'hb6) != ((8'hb3) >>> (8'h9e))) ? ((^(8'ha9)) >> (!(8'ha7))) : ({(8'hb6), (8'hae)} ? ((8'hb9) ? (8'hbd) : (8'hab)) : ((7'h41) == (8'hb3)))) ? (({(8'ha8), (7'h44)} << (8'hb3)) ? (~&((8'hbf) ? (8'hb6) : (8'hae))) : (!((8'ha1) ? (7'h42) : (8'had)))) : (({(8'hb4), (8'ha5)} << (8'h9c)) ? (8'ha0) : (8'ha9))), (~&(({(8'hbb), (8'ha2)} + {(8'hb9), (8'hb3)}) ^ (^~{(8'had)})))})
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire6;
  input wire signed [(5'h10):(1'h0)] wire7;
  input wire signed [(4'ha):(1'h0)] wire8;
  input wire signed [(4'hd):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire87;
  wire signed [(4'ha):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire84;
  wire [(4'he):(1'h0)] wire83;
  wire signed [(5'h13):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire53;
  wire [(4'h8):(1'h0)] wire54;
  wire [(5'h10):(1'h0)] wire81;
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire10,
                 wire11,
                 wire12,
                 wire23,
                 wire51,
                 wire53,
                 wire54,
                 wire81,
                 (1'h0)};
  assign wire10 = (~^((wire6 ?
                      ((!wire8) ?
                          (wire7 && (7'h41)) : $unsigned(wire8)) : wire8[(2'h2):(1'h1)]) == wire6));
  assign wire11 = ((~|($unsigned($signed((8'hbb))) ?
                          {wire10, (8'hbc)} : ($unsigned(wire8) ?
                              (wire7 <<< wire8) : wire6))) ?
                      (wire7[(2'h3):(1'h0)] ?
                          wire9[(1'h1):(1'h1)] : (wire9 ?
                              wire9[(3'h5):(3'h4)] : (8'hb2))) : (wire9 ?
                          $signed(wire7[(1'h0):(1'h0)]) : (((~|wire7) << wire8[(2'h2):(1'h1)]) ?
                              $signed((wire7 << wire7)) : (((8'hbb) | wire10) ~^ $unsigned(wire8)))));
  assign wire12 = wire10;
  module13 #() modinst24 (wire23, clk, wire7, wire6, wire8, wire10);
  module25 #() modinst52 (.wire26(wire9), .wire28(wire7), .wire27(wire10), .wire29(wire11), .y(wire51), .clk(clk));
  assign wire53 = $signed(wire10[(4'he):(3'h5)]);
  assign wire54 = (wire23[(3'h7):(2'h2)] == ($unsigned((-wire6[(1'h1):(1'h1)])) * (|$unsigned((&wire53)))));
  module55 #() modinst82 (wire81, clk, wire51, wire11, wire54, wire7, wire6);
  assign wire83 = $unsigned(wire23);
  assign wire84 = (^($unsigned((8'ha9)) ?
                      (|(+{wire9})) : wire53[(4'h9):(1'h1)]));
  assign wire85 = (($signed((8'hae)) | (~&$unsigned((wire54 ?
                      wire10 : (7'h40))))) << $signed((&wire11[(1'h0):(1'h0)])));
  assign wire86 = ((&(8'hb6)) ? wire23[(1'h1):(1'h0)] : wire83[(2'h3):(1'h0)]);
  assign wire87 = $unsigned(((~$unsigned(wire85)) ?
                      $signed((wire83 & (8'ha3))) : $unsigned((!{wire86,
                          wire51}))));
endmodule

module module55  (y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire60;
  input wire [(5'h12):(1'h0)] wire59;
  input wire [(4'h8):(1'h0)] wire58;
  input wire signed [(4'h8):(1'h0)] wire57;
  input wire signed [(4'hc):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire80;
  wire [(5'h13):(1'h0)] wire79;
  wire [(5'h10):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire77;
  wire signed [(5'h13):(1'h0)] wire76;
  wire [(2'h3):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire73;
  wire signed [(4'hf):(1'h0)] wire72;
  wire [(3'h6):(1'h0)] wire71;
  wire signed [(3'h5):(1'h0)] wire70;
  wire [(2'h2):(1'h0)] wire69;
  wire signed [(3'h7):(1'h0)] wire68;
  wire [(5'h10):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire61;
  assign y = {wire80,
                 wire79,
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
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 (1'h0)};
  assign wire61 = wire56;
  assign wire62 = $unsigned(wire58);
  assign wire63 = (|wire59);
  assign wire64 = ($signed($unsigned($signed($unsigned((8'h9d))))) ?
                      $unsigned(wire62) : $signed((wire62[(1'h0):(1'h0)] != ((wire58 - wire62) ?
                          (8'h9c) : $signed(wire57)))));
  assign wire65 = (({(wire56 <= wire61[(4'hb):(2'h2)]),
                              $unsigned($unsigned(wire64))} ?
                          ((+{wire60}) ?
                              {(~wire58)} : $unsigned(wire63[(1'h0):(1'h0)])) : ({(wire60 ?
                                      wire56 : wire60),
                                  wire62} ?
                              $signed((8'ha0)) : (wire56[(4'hb):(1'h0)] * wire63))) ?
                      (((~^wire60) || (wire62[(1'h0):(1'h0)] < ((7'h43) >>> wire63))) >> $unsigned($unsigned($unsigned((8'hbc))))) : {$unsigned((8'hb4))});
  assign wire66 = ((~|wire58) >= {(wire59[(3'h4):(1'h1)] ?
                          wire56 : ((wire62 > wire59) || (~&(8'hb7))))});
  assign wire67 = (&wire65);
  assign wire68 = (wire60 ?
                      {$signed({((8'hb8) ? wire61 : wire61),
                              $unsigned((8'haa))}),
                          (wire60[(5'h12):(2'h2)] ?
                              $signed(wire58[(3'h4):(1'h1)]) : $signed((!wire62)))} : $unsigned(($unsigned(wire62) ?
                          (~((8'hb7) ? wire64 : wire57)) : ((wire60 ?
                                  wire62 : wire65) ?
                              wire63 : {wire65}))));
  assign wire69 = $signed((wire67 ?
                      (wire65 ?
                          (8'hb4) : $unsigned((wire60 ?
                              wire59 : wire61))) : {(((8'ha5) + wire56) ?
                              (8'hbf) : (wire62 ? wire61 : wire62))}));
  assign wire70 = (wire61 * wire56[(4'ha):(3'h5)]);
  assign wire71 = wire69;
  assign wire72 = ($signed(($signed((wire58 != wire61)) ?
                          ((!wire63) ?
                              $signed(wire66) : (8'hbe)) : ($unsigned(wire70) ?
                              $signed(wire66) : {wire68, wire70}))) ?
                      ({$unsigned((wire60 ?
                              wire68 : wire57))} <= $unsigned((wire60[(4'he):(4'hc)] >> wire69[(2'h2):(1'h0)]))) : wire59[(4'hf):(4'he)]);
  assign wire73 = $signed((+$signed((+wire69))));
  assign wire74 = wire66;
  assign wire75 = ((~&($unsigned({wire65,
                          wire71}) >> $unsigned($signed((8'hac))))) ?
                      wire64[(2'h2):(1'h0)] : $unsigned($unsigned(wire66)));
  assign wire76 = wire58[(3'h7):(1'h1)];
  assign wire77 = $signed((8'hba));
  assign wire78 = wire76;
  assign wire79 = ((wire62[(1'h0):(1'h0)] ? wire68[(1'h1):(1'h0)] : wire69) ?
                      {wire57} : wire70);
  assign wire80 = wire64[(3'h7):(1'h1)];
endmodule

module module25
#(parameter param49 = ((^~(~({(8'ha8), (7'h43)} ? ((8'ha1) ? (8'hac) : (8'hb0)) : (!(8'ha4))))) ^ (&(^~((~|(8'ha9)) < (~(8'hbd)))))), 
parameter param50 = param49)
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire29;
  input wire signed [(5'h10):(1'h0)] wire28;
  input wire signed [(5'h13):(1'h0)] wire27;
  input wire signed [(4'hc):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire46;
  wire [(5'h10):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire35;
  wire signed [(5'h10):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire30 = $unsigned(wire26);
  assign wire31 = $unsigned($signed(wire28[(4'hf):(2'h3)]));
  assign wire32 = $unsigned({($signed($signed(wire30)) ? {wire31} : wire30)});
  assign wire33 = wire30[(1'h0):(1'h0)];
  assign wire34 = wire27[(4'ha):(4'ha)];
  assign wire35 = wire31[(2'h2):(2'h2)];
  assign wire36 = {({$signed(((8'hb7) == wire28)), wire32[(3'h6):(1'h1)]} ?
                          wire30[(3'h4):(2'h2)] : $unsigned((wire27 * ((8'ha0) && (8'ha1)))))};
  assign wire37 = ($signed($signed(wire32[(1'h1):(1'h0)])) ?
                      ($signed($unsigned(wire27[(3'h6):(3'h6)])) ?
                          {{((8'haa) ?
                                      wire36 : wire35)}} : (-$signed(wire36[(1'h0):(1'h0)]))) : wire33);
  assign wire38 = wire30;
  assign wire39 = (8'hbc);
  assign wire40 = wire30;
  assign wire41 = wire30;
  always
    @(posedge clk) begin
      reg42 <= (~^(~^{wire35}));
      reg43 <= wire38[(4'h8):(3'h5)];
    end
  assign wire44 = wire29[(2'h2):(2'h2)];
  assign wire45 = wire35;
  assign wire46 = wire41;
  assign wire47 = $signed($unsigned({((wire28 << wire37) ?
                          (wire35 ^ (8'hab)) : $unsigned((8'hba)))}));
  assign wire48 = $signed(wire35);
endmodule

module module13
#(parameter param22 = ((~|(^~(((8'hab) & (8'hb1)) << ((7'h41) == (8'hbd))))) ? ((({(7'h42)} ? (+(8'ha5)) : ((8'hb1) ? (8'ha6) : (8'hbf))) * (((8'ha8) - (8'ha2)) ? ((8'hae) ? (8'hb0) : (8'hae)) : {(8'hbb), (7'h42)})) || ((!(-(8'hb3))) ? ({(8'hb8), (8'haa)} >= (~&(8'ha7))) : (((8'hb8) ? (8'hb8) : (8'ha0)) ? (^(8'hb6)) : {(8'hba), (8'haa)}))) : (8'h9d)))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire17;
  input wire signed [(5'h12):(1'h0)] wire16;
  input wire [(4'ha):(1'h0)] wire15;
  input wire [(2'h2):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  assign y = {wire21, wire20, wire19, wire18, (1'h0)};
  assign wire18 = $unsigned((8'hbc));
  assign wire19 = ({$unsigned(((wire16 ?
                              wire18 : wire15) - $unsigned((7'h44))))} ?
                      wire17[(2'h2):(1'h1)] : $signed({(wire14 ~^ $unsigned(wire15)),
                          ((+wire16) ? $signed(wire15) : (8'hbe))}));
  assign wire20 = (+((wire15[(4'h8):(3'h4)] ?
                          (((8'haa) != wire16) ?
                              (~(8'ha6)) : wire14[(1'h0):(1'h0)]) : wire17) ?
                      ($signed(wire19[(3'h6):(2'h3)]) ?
                          wire16[(1'h0):(1'h0)] : (((8'haa) > wire14) ~^ (wire16 - wire17))) : ({(^~wire18)} ?
                          wire16[(1'h0):(1'h0)] : {(wire15 ? (8'ha7) : wire18),
                              wire16})));
  assign wire21 = $unsigned(((^~wire17[(3'h5):(3'h5)]) ?
                      wire18 : $signed($unsigned({(8'hbd), wire20}))));
endmodule

module module109  (y, clk, wire114, wire113, wire112, wire111, wire110);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire114;
  input wire [(5'h15):(1'h0)] wire113;
  input wire [(4'hd):(1'h0)] wire112;
  input wire [(3'h4):(1'h0)] wire111;
  input wire [(3'h6):(1'h0)] wire110;
  wire signed [(5'h10):(1'h0)] wire130;
  wire [(2'h3):(1'h0)] wire126;
  wire [(5'h10):(1'h0)] wire125;
  wire [(4'hc):(1'h0)] wire124;
  wire [(4'hb):(1'h0)] wire123;
  wire [(4'hf):(1'h0)] wire122;
  wire [(3'h4):(1'h0)] wire121;
  wire signed [(5'h10):(1'h0)] wire120;
  wire [(5'h11):(1'h0)] wire119;
  wire [(3'h7):(1'h0)] wire117;
  wire signed [(2'h2):(1'h0)] wire116;
  wire signed [(3'h5):(1'h0)] wire115;
  reg [(3'h7):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  assign y = {wire130,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire117,
                 wire116,
                 wire115,
                 reg129,
                 reg128,
                 reg127,
                 reg118,
                 (1'h0)};
  assign wire115 = ($signed(wire110) < $signed(wire112));
  assign wire116 = {$unsigned({$unsigned($signed((8'ha1)))})};
  assign wire117 = {($unsigned(wire112) ? wire112 : wire113),
                       $signed($signed(wire114))};
  always
    @(posedge clk) begin
      reg118 <= {$signed(wire114[(3'h6):(3'h4)]),
          ($signed((+{wire114})) ?
              $unsigned((!(~&wire112))) : wire113[(2'h3):(2'h3)])};
    end
  assign wire119 = $signed($signed($unsigned($unsigned((8'ha0)))));
  assign wire120 = wire119[(5'h11):(3'h4)];
  assign wire121 = $signed($signed($unsigned(wire120[(3'h6):(3'h5)])));
  assign wire122 = $unsigned(((~($unsigned(wire114) ?
                       (~|(8'hb7)) : $unsigned(wire116))) ^~ $signed(wire120[(3'h6):(3'h5)])));
  assign wire123 = ($unsigned(wire112[(3'h5):(3'h4)]) ?
                       (^~({(&wire117)} ^~ wire115)) : (8'hb7));
  assign wire124 = (&(($unsigned($signed(wire116)) ^ (wire123[(4'h8):(4'h8)] ?
                       (wire116 ? wire122 : wire117) : ((8'ha1) ?
                           reg118 : wire115))) < {$unsigned((wire123 << wire119))}));
  assign wire125 = (&$signed({$signed((wire116 * wire121))}));
  assign wire126 = $signed(wire116);
  always
    @(posedge clk) begin
      reg127 <= ($signed(((+wire112[(2'h3):(1'h0)]) ?
          $signed((~|wire116)) : $unsigned(wire112[(4'hd):(2'h3)]))) >= $unsigned((wire121[(1'h0):(1'h0)] ?
          wire125 : $signed(((8'hbe) ? wire116 : wire115)))));
      reg128 <= (~(~&wire110));
      reg129 <= wire122;
    end
  assign wire130 = (~&($unsigned(($signed(wire122) ?
                           (wire110 ~^ reg128) : $unsigned(reg127))) ?
                       $unsigned((^(wire115 ?
                           reg118 : wire119))) : (((wire123 ^~ wire111) ?
                           {wire116, wire110} : {wire111,
                               (8'hbc)}) & wire125)));
endmodule
