module top
#(parameter param157 = ((({{(8'hba), (8'ha5)}, ((8'hb9) && (8'hb6))} ^~ ({(8'hac)} * (~(7'h40)))) != {(((8'hab) ? (8'ha9) : (8'ha1)) > ((7'h43) ? (8'h9e) : (8'hbb)))}) <= (-((!((8'hb0) ? (8'ha9) : (8'haa))) ? (((8'h9c) == (8'ha3)) ? ((8'ha6) ? (8'ha3) : (7'h43)) : ((7'h43) ? (8'haf) : (8'hbe))) : (8'hab)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h129):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire128;
  wire signed [(5'h12):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire65;
  wire [(2'h3):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire130;
  wire [(4'ha):(1'h0)] wire145;
  wire signed [(2'h2):(1'h0)] wire151;
  wire signed [(2'h3):(1'h0)] wire152;
  wire [(4'hc):(1'h0)] wire153;
  reg signed [(5'h12):(1'h0)] reg156 = (1'h0);
  reg [(4'hd):(1'h0)] reg155 = (1'h0);
  reg [(4'h8):(1'h0)] reg150 = (1'h0);
  reg [(4'ha):(1'h0)] reg149 = (1'h0);
  reg [(3'h5):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg147 = (1'h0);
  reg [(2'h3):(1'h0)] reg4 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg131 = (1'h0);
  assign y = {wire128,
                 wire68,
                 wire67,
                 wire65,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire130,
                 wire145,
                 wire151,
                 wire152,
                 wire153,
                 reg156,
                 reg155,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg4,
                 reg5,
                 reg6,
                 reg131,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ({$unsigned((wire2 ? wire3[(4'hf):(3'h6)] : wire1))})
        begin
          reg4 <= (~|$unsigned(((-(wire1 >>> wire0)) ?
              $signed(wire3) : $unsigned(wire2))));
          reg5 <= wire2[(3'h6):(3'h6)];
        end
      else
        begin
          reg4 <= {$signed((reg5[(5'h13):(4'hb)] ?
                  reg4[(2'h2):(1'h1)] : (^$unsigned(wire0))))};
          reg5 <= $unsigned({reg4[(2'h3):(1'h0)]});
        end
      reg6 <= ((~|wire0[(4'ha):(2'h2)]) ?
          wire2 : $unsigned((($signed(reg4) ?
                  {wire2, wire3} : $signed((7'h42))) ?
              {reg5} : reg5[(1'h1):(1'h0)])));
    end
  assign wire7 = ((~^$unsigned(wire2)) == (-reg6[(1'h0):(1'h0)]));
  assign wire8 = $signed({{wire0[(4'ha):(4'h8)],
                         ((|reg4) ?
                             wire7[(4'h8):(2'h2)] : (wire1 ? reg4 : wire1))},
                     wire7});
  assign wire9 = wire3[(4'hc):(4'hc)];
  assign wire10 = reg6;
  assign wire11 = $unsigned((8'ha6));
  module12 #() modinst66 (.clk(clk), .wire15(wire7), .y(wire65), .wire17(wire11), .wire13(reg6), .wire16(wire8), .wire14(wire2));
  assign wire67 = $unsigned({$signed({{wire3}})});
  assign wire68 = $unsigned($signed((((8'hbf) ? (8'haf) : wire2) ?
                      ((reg4 == (8'hb8)) ?
                          {wire67,
                              (8'ha0)} : ((8'haa) > wire67)) : wire2[(1'h0):(1'h0)])));
  module69 #() modinst129 (wire128, clk, wire68, reg6, wire2, wire3);
  assign wire130 = $signed($unsigned($unsigned({wire7, wire0[(4'h8):(4'h8)]})));
  always
    @(posedge clk) begin
      reg131 <= ((&$unsigned($unsigned((8'hb4)))) ? wire67 : wire3);
    end
  module132 #() modinst146 (.wire133(wire7), .clk(clk), .wire135(reg6), .wire134(wire0), .wire137(wire2), .wire136(wire10), .y(wire145));
  always
    @(posedge clk) begin
      reg147 <= wire1;
      reg148 <= $unsigned((!$unsigned({(8'hbc), (reg4 <<< wire11)})));
      reg149 <= $unsigned(wire9);
      reg150 <= {{(wire68[(3'h4):(1'h1)] >>> reg148[(1'h0):(1'h0)])}};
    end
  assign wire151 = {$signed(wire0[(5'h14):(3'h5)]),
                       (reg5 ~^ $unsigned($unsigned((8'hac))))};
  assign wire152 = (8'hb6);
  module75 #() modinst154 (wire153, clk, wire130, wire0, wire68, reg150, reg147);
  always
    @(posedge clk) begin
      reg155 <= (wire65 ?
          $unsigned({wire145[(3'h5):(2'h3)],
              (reg6[(3'h5):(3'h4)] ?
                  (wire153 || reg147) : wire0)}) : $unsigned({($unsigned(wire151) ?
                  $signed((8'hb4)) : $unsigned(wire151))}));
      reg156 <= $unsigned((wire3 ?
          (wire7[(4'h9):(3'h5)] && $signed(wire67[(4'he):(2'h2)])) : (!(~wire0[(2'h2):(2'h2)]))));
    end
endmodule

module module132
#(parameter param144 = (!(|(8'hae))))
(y, clk, wire137, wire136, wire135, wire134, wire133);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire137;
  input wire signed [(2'h2):(1'h0)] wire136;
  input wire signed [(3'h4):(1'h0)] wire135;
  input wire signed [(5'h15):(1'h0)] wire134;
  input wire [(4'h8):(1'h0)] wire133;
  wire signed [(2'h3):(1'h0)] wire143;
  wire [(5'h14):(1'h0)] wire141;
  wire [(4'hf):(1'h0)] wire140;
  wire [(5'h10):(1'h0)] wire139;
  wire [(5'h11):(1'h0)] wire138;
  reg [(3'h5):(1'h0)] reg142 = (1'h0);
  assign y = {wire143, wire141, wire140, wire139, wire138, reg142, (1'h0)};
  assign wire138 = wire134[(3'h4):(1'h1)];
  assign wire139 = wire135;
  assign wire140 = (((wire136[(1'h0):(1'h0)] ?
                       (wire139 - $unsigned(wire133)) : wire134) * $unsigned(((wire139 ^ wire135) <= ((8'hb0) > (8'hb2))))) << (wire139[(4'hb):(4'hb)] || (^~wire134[(5'h15):(5'h12)])));
  assign wire141 = $signed({wire140});
  always
    @(posedge clk) begin
      reg142 <= wire138;
    end
  assign wire143 = (|{(wire134 - {$unsigned(wire135), (wire135 >= wire138)})});
endmodule

module module69  (y, clk, wire70, wire71, wire72, wire73);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire70;
  input wire [(3'h6):(1'h0)] wire71;
  input wire [(5'h15):(1'h0)] wire72;
  input wire signed [(5'h12):(1'h0)] wire73;
  wire signed [(3'h6):(1'h0)] wire127;
  wire [(4'h9):(1'h0)] wire126;
  wire [(2'h2):(1'h0)] wire125;
  wire [(5'h13):(1'h0)] wire74;
  wire [(4'hc):(1'h0)] wire123;
  assign y = {wire127, wire126, wire125, wire74, wire123, (1'h0)};
  assign wire74 = {wire70[(4'hd):(1'h0)], (8'ha2)};
  module75 #() modinst124 (wire123, clk, wire71, wire72, wire73, wire74, wire70);
  assign wire125 = {$signed(wire71)};
  assign wire126 = (($signed((wire71 | wire125)) ?
                       {wire72[(3'h7):(2'h3)],
                           wire71[(3'h5):(2'h2)]} : wire70[(4'hb):(1'h0)]) >= ({$signed((wire125 ?
                               wire74 : wire123)),
                           (^~{wire123})} ?
                       $signed($unsigned((wire123 >= wire71))) : (~^$unsigned((8'ha2)))));
  assign wire127 = wire125[(2'h2):(1'h0)];
endmodule

module module12  (y, clk, wire13, wire14, wire15, wire16, wire17);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire13;
  input wire [(5'h12):(1'h0)] wire14;
  input wire [(5'h14):(1'h0)] wire15;
  input wire signed [(3'h6):(1'h0)] wire16;
  input wire [(2'h2):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire60;
  wire signed [(3'h5):(1'h0)] wire59;
  wire [(2'h3):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire57;
  wire [(4'hd):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire53;
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  assign y = {wire64,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire53,
                 reg63,
                 reg62,
                 reg61,
                 reg28,
                 reg29,
                 (1'h0)};
  assign wire18 = (wire15[(5'h13):(4'h9)] <= $unsigned((8'hab)));
  assign wire19 = wire13[(4'h8):(3'h6)];
  assign wire20 = $signed((^($signed((^(8'hbb))) ?
                      wire16[(3'h6):(1'h0)] : (wire14 == wire17[(2'h2):(1'h0)]))));
  assign wire21 = wire20;
  assign wire22 = $signed(wire16);
  assign wire23 = wire19[(1'h0):(1'h0)];
  assign wire24 = wire13[(4'hd):(4'hc)];
  assign wire25 = $signed($unsigned($unsigned($signed((wire23 != (8'hab))))));
  assign wire26 = wire13;
  assign wire27 = ((~^(~&wire22[(4'h9):(3'h5)])) ?
                      ((($unsigned(wire24) >= wire24[(5'h14):(5'h11)]) ~^ ((wire19 ?
                                  wire17 : wire20) ?
                              (wire15 ? (8'had) : wire23) : (wire21 ?
                                  wire22 : wire14))) ?
                          {$signed($signed(wire24))} : wire15) : $unsigned(wire20[(3'h6):(1'h1)]));
  always
    @(posedge clk) begin
      reg28 <= {$signed(($signed(wire23[(2'h3):(2'h3)]) ?
              ($signed(wire14) ?
                  (wire26 == (8'ha5)) : (~wire24)) : wire14[(5'h11):(3'h6)]))};
      reg29 <= wire24;
    end
  module30 #() modinst54 (wire53, clk, wire22, wire15, wire18, reg28);
  assign wire55 = {(((&$unsigned((8'had))) <<< (wire27 && (-wire26))) ?
                          (wire26 <= (+(wire13 == (8'h9d)))) : ($signed($signed(wire53)) ?
                              wire27[(3'h7):(3'h6)] : wire19[(1'h0):(1'h0)])),
                      {$unsigned(wire16[(2'h3):(1'h1)]), wire22}};
  assign wire56 = (wire18[(4'h8):(1'h0)] & ($signed({$signed(wire16),
                      reg29}) - $unsigned(wire16[(1'h0):(1'h0)])));
  assign wire57 = $signed($signed({wire25, {wire27}}));
  assign wire58 = ($signed(wire21) && $unsigned(((!wire13) >= wire27)));
  assign wire59 = ({wire27, $unsigned(wire23[(3'h6):(2'h2)])} == (8'hbf));
  assign wire60 = (^(^($unsigned((&wire14)) <= ((~&(8'h9d)) ?
                      wire19[(3'h4):(2'h3)] : $signed((8'ha9))))));
  always
    @(posedge clk) begin
      reg61 <= (wire15[(4'ha):(4'h9)] + ((wire27 ?
              ((wire56 << wire17) != {(8'ha9), wire19}) : wire23) ?
          $signed(((wire14 ? wire20 : wire60) ?
              (~&wire53) : (7'h40))) : (8'hbc)));
      reg62 <= ({wire21[(3'h4):(3'h4)],
          ($unsigned({wire58}) ? (~$signed(wire24)) : wire22)} * wire14);
      reg63 <= ($unsigned(($signed((-wire60)) ^ {(wire15 - wire23),
              (^reg29)})) ?
          wire16 : $unsigned((~&(&wire20[(1'h0):(1'h0)]))));
    end
  assign wire64 = {($signed((~|wire56[(4'hc):(3'h5)])) | $signed($unsigned($signed(wire23))))};
endmodule

module module30  (y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire34;
  input wire [(5'h12):(1'h0)] wire33;
  input wire [(5'h11):(1'h0)] wire32;
  input wire [(4'hd):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire52;
  wire signed [(5'h12):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire39;
  wire [(5'h12):(1'h0)] wire38;
  wire signed [(5'h14):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire35;
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg50,
                 (1'h0)};
  assign wire35 = wire32;
  assign wire36 = $signed(($signed(wire31) ?
                      ((^~wire35[(4'he):(3'h6)]) ?
                          ($unsigned(wire31) ?
                              (wire34 ?
                                  wire32 : wire33) : $unsigned(wire31)) : wire33[(4'hc):(3'h4)]) : wire32));
  assign wire37 = $unsigned((^{$signed(wire34),
                      {(^wire32), wire35[(4'hf):(1'h1)]}}));
  assign wire38 = wire34[(4'hb):(3'h7)];
  assign wire39 = (~($signed($unsigned((&(8'h9e)))) >>> wire34[(4'h9):(3'h4)]));
  assign wire40 = wire35;
  assign wire41 = (wire39[(3'h5):(1'h1)] ^~ (&(~wire32[(5'h11):(4'h9)])));
  assign wire42 = (~&wire35[(2'h3):(1'h0)]);
  assign wire43 = wire32;
  assign wire44 = wire32[(4'he):(2'h2)];
  assign wire45 = wire37[(5'h12):(4'hc)];
  assign wire46 = wire36[(4'hb):(4'h8)];
  assign wire47 = (~^(^~($unsigned(wire32) > (!(wire37 ? wire35 : wire32)))));
  assign wire48 = wire36[(2'h3):(1'h0)];
  assign wire49 = wire34[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg50 <= (^($signed(wire31) && (~$signed((wire47 << wire40)))));
    end
  assign wire51 = $unsigned(({$unsigned($signed(wire45))} ?
                      wire36 : {$unsigned((!wire36))}));
  assign wire52 = $unsigned({(8'hb0),
                      {((wire49 ? wire43 : wire40) ?
                              (wire46 ?
                                  (8'ha7) : wire45) : wire43[(4'h8):(4'h8)])}});
endmodule

module module75  (y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'h1e1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire80;
  input wire signed [(5'h15):(1'h0)] wire79;
  input wire signed [(4'hd):(1'h0)] wire78;
  input wire signed [(2'h3):(1'h0)] wire77;
  input wire [(3'h6):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire122;
  wire signed [(5'h13):(1'h0)] wire109;
  wire [(3'h7):(1'h0)] wire108;
  wire [(5'h13):(1'h0)] wire107;
  wire [(5'h13):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire105;
  wire [(4'he):(1'h0)] wire96;
  wire signed [(5'h14):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire81;
  reg signed [(4'hf):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg119 = (1'h0);
  reg [(5'h14):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg115 = (1'h0);
  reg [(4'hf):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(3'h7):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg101 = (1'h0);
  reg [(3'h6):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg99 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  reg [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg92 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(3'h4):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg82 = (1'h0);
  assign y = {wire122,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire96,
                 wire95,
                 wire81,
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
                 reg110,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
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
                 (1'h0)};
  assign wire81 = wire76[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      if (wire76)
        begin
          if (((~|(wire76 && wire81)) == wire78))
            begin
              reg82 <= $signed($signed($unsigned($signed(wire77))));
              reg83 <= wire78[(2'h3):(2'h2)];
              reg84 <= ($signed($unsigned(wire78[(4'hd):(3'h7)])) ?
                  (~&$signed($unsigned((wire80 < wire80)))) : $signed((!wire76)));
            end
          else
            begin
              reg82 <= $signed(wire77);
            end
          if (wire81[(1'h0):(1'h0)])
            begin
              reg85 <= $unsigned((wire76 < wire78));
              reg86 <= $signed((($signed(((8'hb1) ~^ (8'ha7))) ?
                  $unsigned($unsigned(reg85)) : reg82) <= {((+wire79) >= (wire81 ?
                      reg84 : wire76))}));
            end
          else
            begin
              reg85 <= (^~{wire80});
              reg86 <= $signed(wire76[(1'h0):(1'h0)]);
              reg87 <= reg83;
              reg88 <= wire78[(4'h9):(2'h2)];
            end
          if ({wire78[(4'hd):(1'h1)]})
            begin
              reg89 <= (wire76 ?
                  reg84[(3'h5):(1'h1)] : $signed($signed((((8'ha0) ?
                      (8'h9c) : (8'had)) * wire78))));
              reg90 <= reg82;
              reg91 <= (($unsigned(({reg90,
                      reg82} - (reg85 ^ reg84))) - (({wire80} || (reg89 | wire79)) ?
                      reg88 : wire78)) ?
                  {$unsigned((reg90 ? wire77[(2'h3):(1'h0)] : reg85)),
                      (((^reg88) - $unsigned((7'h42))) != $signed((8'ha6)))} : {reg85});
              reg92 <= ((+($signed((reg85 & reg83)) - ((8'hbc) >>> (&reg84)))) - reg88[(4'ha):(3'h4)]);
            end
          else
            begin
              reg89 <= (wire80[(3'h4):(3'h4)] ?
                  reg88[(4'h9):(1'h0)] : $unsigned($signed($unsigned($unsigned(wire78)))));
            end
        end
      else
        begin
          reg82 <= (8'hbc);
          if (($signed((((reg90 ? reg90 : reg85) == wire79[(5'h12):(4'he)]) ?
                  (reg83 <<< (-reg91)) : ($signed(reg89) ?
                      (wire78 ? reg92 : reg92) : {(8'ha9), wire80}))) ?
              (reg90[(4'h9):(4'h9)] ~^ reg91[(3'h7):(3'h6)]) : (^~reg84[(1'h0):(1'h0)])))
            begin
              reg83 <= (~^wire79);
            end
          else
            begin
              reg83 <= (|$unsigned(reg82[(3'h5):(3'h4)]));
              reg84 <= reg90;
              reg85 <= ((~&reg82) < $unsigned((wire77[(2'h3):(1'h1)] ?
                  $unsigned((wire77 ?
                      wire78 : (8'hb0))) : (((8'hbb) <<< (8'h9d)) && (wire76 ?
                      reg87 : reg90)))));
              reg86 <= ((&(!$unsigned(wire80[(3'h5):(2'h3)]))) ?
                  (reg89 ?
                      $unsigned($unsigned($signed(reg85))) : $unsigned(reg85)) : (~{(!$unsigned(reg87)),
                      {(reg85 == wire80)}}));
              reg87 <= reg89[(2'h2):(2'h2)];
            end
        end
      reg93 <= $unsigned($signed(reg87[(3'h5):(2'h3)]));
      reg94 <= reg82[(2'h3):(2'h3)];
    end
  assign wire95 = $signed(reg93[(1'h1):(1'h0)]);
  assign wire96 = (($unsigned($signed((reg84 ^ (8'ha8)))) - (reg82 < $signed($unsigned(reg87)))) ?
                      (($unsigned($unsigned(reg82)) + ($unsigned((7'h44)) && {reg82})) ?
                          {wire76} : reg84[(4'h9):(3'h7)]) : (8'ha6));
  always
    @(posedge clk) begin
      if (reg94[(2'h3):(2'h3)])
        begin
          if (((7'h41) ?
              $signed($signed(($unsigned(reg94) ?
                  $signed((8'ha7)) : wire81))) : $signed(reg93[(3'h6):(3'h5)])))
            begin
              reg97 <= (reg90[(3'h7):(3'h5)] - reg84);
              reg98 <= wire77[(2'h3):(2'h2)];
              reg99 <= (~^wire76[(3'h4):(3'h4)]);
            end
          else
            begin
              reg97 <= {({wire96[(3'h6):(3'h6)]} ?
                      $unsigned(wire76) : reg85[(2'h2):(1'h1)])};
            end
          reg100 <= {$unsigned($unsigned(wire95[(4'h9):(2'h3)])), wire77};
          reg101 <= ({(~wire78[(4'hd):(4'h8)]),
              ($unsigned({(8'ha5),
                  reg88}) << (^reg100[(1'h1):(1'h0)]))} >= $signed(reg93));
          reg102 <= $signed((&{((&reg100) >= reg99),
              ((!wire77) ? $unsigned(reg93) : wire77[(1'h0):(1'h0)])}));
          reg103 <= reg90;
        end
      else
        begin
          reg97 <= $signed($unsigned(($unsigned($unsigned(reg91)) ^~ $unsigned((reg85 ?
              wire76 : reg87)))));
          reg98 <= ((|(wire79[(4'hc):(4'h9)] ?
              (-(8'ha1)) : reg100)) <= reg87[(3'h5):(2'h3)]);
          reg99 <= reg103[(2'h3):(2'h2)];
          reg100 <= ($unsigned(((-(8'haa)) + ($signed((7'h41)) ^~ (~reg82)))) ^~ wire95);
        end
      reg104 <= $unsigned(((reg94[(1'h1):(1'h0)] ?
              $signed({reg101, wire80}) : $unsigned($signed(reg87))) ?
          wire95 : {$unsigned((|reg100)), (8'hb9)}));
    end
  assign wire105 = {((wire95 ~^ reg101) >>> $signed({$signed(reg87),
                           {reg102}}))};
  assign wire106 = reg82;
  assign wire107 = (reg104[(3'h4):(1'h1)] * $unsigned($unsigned(wire77)));
  assign wire108 = {(wire80[(1'h0):(1'h0)] > wire78)};
  assign wire109 = reg91[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg110 <= (+{reg103[(2'h3):(2'h3)]});
      if ($signed((^$unsigned(reg97))))
        begin
          reg111 <= (!(reg98[(4'hf):(4'he)] ?
              reg82[(1'h0):(1'h0)] : $unsigned((+{wire106, reg110}))));
          reg112 <= reg97[(4'hd):(2'h2)];
          reg113 <= ($unsigned((!$signed($unsigned(reg102)))) ?
              ((($signed(reg99) ? wire77[(2'h2):(1'h0)] : $unsigned(wire107)) ?
                      ((reg99 ? reg111 : reg92) ?
                          $signed(wire81) : ((8'hb9) ?
                              reg84 : wire106)) : wire81[(4'ha):(3'h5)]) ?
                  $signed(wire105[(4'ha):(4'h8)]) : (8'hbc)) : reg92);
          reg114 <= (-(wire108 ?
              $unsigned(wire95) : $signed(((reg100 ? reg84 : reg92) ?
                  (-reg97) : wire81))));
          reg115 <= reg90;
        end
      else
        begin
          if ($signed((($unsigned(((8'ha8) ? wire107 : reg85)) ?
              {$signed(wire106),
                  (-reg99)} : reg85[(3'h5):(1'h1)]) <<< $unsigned(reg113[(1'h1):(1'h1)]))))
            begin
              reg111 <= ($unsigned((reg99 ?
                      (7'h40) : (wire78 >>> $signed((8'ha0))))) ?
                  (wire105[(3'h7):(2'h2)] ?
                      {reg88[(4'h9):(2'h3)]} : $signed({(reg104 != reg113),
                          {reg104}})) : reg114[(3'h4):(3'h4)]);
              reg112 <= $unsigned(($unsigned($signed((wire107 ?
                  reg89 : wire108))) ~^ ($unsigned(reg83) ?
                  (|(wire76 ? reg103 : (8'ha9))) : wire105)));
              reg113 <= wire109[(4'hd):(3'h6)];
              reg114 <= reg90[(4'hb):(2'h3)];
            end
          else
            begin
              reg111 <= wire81[(4'hc):(3'h7)];
            end
          if ((~|reg115[(3'h5):(3'h4)]))
            begin
              reg115 <= (~(reg111[(3'h6):(2'h3)] * $signed(reg85)));
              reg116 <= $signed((wire79 ?
                  ($unsigned(((7'h44) <= reg93)) > (~&((8'h9c) ^ reg87))) : ((~&reg113) <<< $signed($signed(reg88)))));
              reg117 <= ((&(wire77 | ((wire78 ?
                  wire95 : wire79) ^~ reg115[(1'h0):(1'h0)]))) >>> {($unsigned((wire108 - reg103)) || (|reg102))});
              reg118 <= $signed($signed(wire79));
            end
          else
            begin
              reg115 <= (|(~&$unsigned($unsigned($signed(wire81)))));
              reg116 <= $signed($unsigned(wire106));
            end
        end
      reg119 <= reg86[(1'h1):(1'h1)];
      reg120 <= reg102;
      reg121 <= (($unsigned(wire80[(3'h6):(3'h5)]) >>> ({$unsigned(wire105)} ?
              (^~(wire79 << reg87)) : ({reg104, reg101} ~^ (reg91 ?
                  reg86 : reg99)))) ?
          ((!(^(~(8'ha2)))) ?
              ($signed($signed(wire107)) ?
                  {$unsigned((8'hbc))} : reg113) : ($unsigned($unsigned((7'h41))) > $signed((wire81 - reg83)))) : reg89);
    end
  assign wire122 = reg112[(1'h0):(1'h0)];
endmodule
