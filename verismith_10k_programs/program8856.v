module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire244;
  wire [(4'he):(1'h0)] wire243;
  wire [(3'h5):(1'h0)] wire242;
  wire signed [(4'hb):(1'h0)] wire241;
  wire [(4'hd):(1'h0)] wire240;
  wire signed [(4'hb):(1'h0)] wire238;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire125;
  reg signed [(5'h15):(1'h0)] reg133 = (1'h0);
  reg [(2'h2):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg131 = (1'h0);
  reg [(2'h2):(1'h0)] reg130 = (1'h0);
  reg signed [(4'he):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg [(2'h3):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire244,
                 wire243,
                 wire242,
                 wire241,
                 wire240,
                 wire238,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire125,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed($unsigned($unsigned((+(-wire0)))));
    end
  assign wire6 = reg5[(4'h8):(1'h0)];
  assign wire7 = (&(~|$signed($unsigned($signed(wire0)))));
  assign wire8 = (&(^((reg5 & (wire1 <<< wire0)) && wire2[(3'h7):(1'h0)])));
  assign wire9 = (~&{wire4[(4'h9):(1'h0)], (~|{wire8, (~&wire4)})});
  module10 #() modinst126 (.wire13(wire1), .wire15(wire7), .y(wire125), .wire12(wire3), .wire14(wire2), .wire11(wire9), .clk(clk));
  always
    @(posedge clk) begin
      reg127 <= $unsigned($signed((^~((wire9 & wire9) ? wire3 : wire7))));
      if ((&$unsigned($unsigned((~|(wire0 + (7'h40)))))))
        begin
          reg128 <= $signed(reg127);
          reg129 <= wire1;
          reg130 <= (-{(^~(^(wire0 | (8'hb9)))),
              $unsigned({{reg127, wire0}, wire2[(4'hc):(4'hc)]})});
        end
      else
        begin
          reg128 <= ((~|wire8[(1'h1):(1'h0)]) ?
              (&$signed(($signed(wire125) ?
                  (wire7 * reg130) : (|wire4)))) : $signed($signed(($signed(wire125) >> wire6))));
          reg129 <= $unsigned((8'hba));
          reg130 <= {{wire3, wire6}};
        end
      reg131 <= wire9;
      reg132 <= ($signed((8'ha2)) ?
          reg131 : $signed($signed(wire0[(3'h6):(2'h3)])));
      reg133 <= wire4;
    end
  module134 #() modinst239 (wire238, clk, reg5, wire9, wire8, reg131);
  assign wire240 = $unsigned($signed(wire238));
  assign wire241 = ((^~(|wire7)) && reg130);
  assign wire242 = ((wire8 ?
                           $signed(((wire3 ? reg5 : (8'hac)) ?
                               (!reg128) : $signed(wire2))) : ($unsigned(((8'hb5) * reg5)) || (~{wire7}))) ?
                       (((!wire2[(4'hb):(2'h3)]) ?
                           reg128 : ((^(8'ha3)) & $signed((8'hbe)))) & $unsigned(($unsigned((8'hb3)) >> (wire2 & wire8)))) : reg5[(4'hf):(4'hd)]);
  assign wire243 = $unsigned($signed((+({(8'hab)} ?
                       $signed(reg130) : wire125[(3'h5):(1'h0)]))));
  assign wire244 = $unsigned((^~(&(wire6 ? wire1 : wire240))));
endmodule

module module134
#(parameter param237 = {(((&((8'ha2) ? (8'hbf) : (8'hac))) ^~ ({(8'hbd)} ? (8'ha1) : {(8'hab)})) - ((~&(&(8'ha0))) ? (((8'hb0) ? (8'ha3) : (8'hb8)) ? ((8'had) <<< (8'haa)) : (!(8'h9e))) : (-{(8'ha5)}))), ({((!(8'haf)) - ((8'hbd) ? (8'ha2) : (7'h41)))} ? {(8'hb7)} : (&(|((8'hbc) & (8'h9d)))))})
(y, clk, wire138, wire137, wire136, wire135);
  output wire [(32'hf7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire138;
  input wire [(4'ha):(1'h0)] wire137;
  input wire signed [(4'h8):(1'h0)] wire136;
  input wire [(4'hc):(1'h0)] wire135;
  wire [(2'h2):(1'h0)] wire235;
  wire [(5'h11):(1'h0)] wire217;
  wire [(4'hc):(1'h0)] wire199;
  wire [(5'h13):(1'h0)] wire183;
  wire [(3'h4):(1'h0)] wire181;
  wire signed [(5'h13):(1'h0)] wire150;
  wire signed [(4'hc):(1'h0)] wire149;
  wire [(5'h13):(1'h0)] wire148;
  wire [(5'h14):(1'h0)] wire147;
  wire [(5'h12):(1'h0)] wire146;
  wire signed [(3'h5):(1'h0)] wire145;
  wire signed [(5'h14):(1'h0)] wire144;
  wire signed [(5'h13):(1'h0)] wire143;
  wire [(3'h4):(1'h0)] wire142;
  wire signed [(5'h14):(1'h0)] wire141;
  wire [(2'h3):(1'h0)] wire140;
  wire [(2'h3):(1'h0)] wire139;
  wire [(3'h6):(1'h0)] wire201;
  wire [(4'h9):(1'h0)] wire202;
  wire [(4'hf):(1'h0)] wire215;
  assign y = {wire235,
                 wire217,
                 wire199,
                 wire183,
                 wire181,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire201,
                 wire202,
                 wire215,
                 (1'h0)};
  assign wire139 = ($unsigned($signed(((~|wire138) ^~ (+(8'ha8))))) ?
                       $unsigned((wire135[(3'h6):(1'h0)] ?
                           ((&wire138) ?
                               (8'h9c) : (wire135 | (8'haa))) : ((&wire135) <<< (wire135 >= wire138)))) : $unsigned($unsigned((~|$signed(wire138)))));
  assign wire140 = wire139;
  assign wire141 = (8'hb1);
  assign wire142 = (wire140 & $signed($unsigned($unsigned((&(8'ha3))))));
  assign wire143 = ($signed((wire136 ?
                       $signed((8'ha4)) : $unsigned(wire141))) ^ wire137);
  assign wire144 = wire137;
  assign wire145 = $unsigned((^~$signed((~(wire141 >> wire137)))));
  assign wire146 = (~|{(wire135 != wire135[(2'h3):(2'h2)])});
  assign wire147 = (~&(-(((wire139 ?
                       wire137 : wire141) ^ (wire136 >= wire140)) ^~ $unsigned($unsigned(wire144)))));
  assign wire148 = ((^~$signed({$signed(wire146), wire146})) ^ (((8'hb2) ?
                       wire143 : wire139) <= $unsigned(wire138[(3'h6):(2'h2)])));
  assign wire149 = (~&wire144[(4'hc):(1'h1)]);
  assign wire150 = $signed(wire135);
  module151 #() modinst182 (.wire154(wire147), .wire152(wire150), .wire155(wire144), .clk(clk), .wire153(wire138), .y(wire181));
  assign wire183 = (~wire141[(1'h0):(1'h0)]);
  module184 #() modinst200 (.wire185(wire135), .clk(clk), .wire188(wire146), .wire187(wire148), .y(wire199), .wire186(wire143), .wire189(wire183));
  assign wire201 = ($signed($signed(wire139)) ?
                       wire135 : $signed((($signed(wire135) ?
                               $unsigned(wire143) : $signed(wire181)) ?
                           $signed((-wire141)) : (&(~wire138)))));
  assign wire202 = (wire142[(1'h0):(1'h0)] ?
                       wire148[(1'h0):(1'h0)] : ((!(8'hb0)) ?
                           wire199 : $signed($unsigned({(8'hb5)}))));
  module203 #() modinst216 (.wire204(wire183), .wire206(wire149), .y(wire215), .wire207(wire199), .clk(clk), .wire208(wire135), .wire205(wire202));
  assign wire217 = wire181[(1'h0):(1'h0)];
  module218 #() modinst236 (wire235, clk, wire217, wire147, wire201, wire139);
endmodule

module module10
#(parameter param123 = ((8'ha6) ? ({{((8'hb7) & (7'h41)), {(8'h9c)}}} - (({(8'hbe)} ? (8'h9d) : ((8'hb9) ? (8'ha5) : (7'h44))) ? (((8'had) ? (8'hac) : (8'hb1)) ~^ (!(7'h44))) : (&((8'hb3) * (8'ha8))))) : {(~&((^(8'ha8)) - ((8'h9d) ? (8'hac) : (8'h9d))))}), 
parameter param124 = (+{param123, (-(param123 ? param123 : (!param123)))}))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h1c5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire15;
  input wire signed [(5'h11):(1'h0)] wire14;
  input wire [(5'h12):(1'h0)] wire13;
  input wire signed [(5'h14):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire122;
  wire signed [(3'h5):(1'h0)] wire121;
  wire signed [(4'hc):(1'h0)] wire120;
  wire [(2'h3):(1'h0)] wire114;
  wire [(5'h12):(1'h0)] wire95;
  wire signed [(4'he):(1'h0)] wire94;
  wire signed [(4'h9):(1'h0)] wire93;
  wire signed [(5'h11):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire91;
  reg signed [(4'h9):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg117 = (1'h0);
  reg [(5'h13):(1'h0)] reg116 = (1'h0);
  reg [(3'h7):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg112 = (1'h0);
  reg [(4'he):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg106 = (1'h0);
  reg [(4'ha):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(2'h2):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(2'h2):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(4'h8):(1'h0)] reg97 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire114,
                 wire95,
                 wire94,
                 wire93,
                 wire72,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire74,
                 wire91,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg113,
                 reg112,
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
                 (1'h0)};
  assign wire16 = $signed($unsigned({{(wire12 ? wire15 : (8'ha8)),
                          wire14[(4'hb):(3'h6)]}}));
  assign wire17 = (wire12[(3'h7):(1'h0)] ~^ (~^$signed((^~$unsigned(wire16)))));
  assign wire18 = wire14;
  assign wire19 = wire17[(3'h4):(1'h0)];
  assign wire20 = (!(^wire16[(1'h1):(1'h1)]));
  assign wire21 = (((8'ha3) ~^ wire16[(1'h0):(1'h0)]) ?
                      (wire19[(5'h11):(4'hc)] > (~&(wire19 ?
                          (wire20 ? (8'ha3) : wire14) : (~wire19)))) : (8'ha7));
  assign wire22 = (~^wire11);
  module23 #() modinst73 (.wire26(wire13), .wire24(wire14), .clk(clk), .wire25(wire16), .wire28(wire18), .y(wire72), .wire27(wire22));
  assign wire74 = ((^(~|{$unsigned(wire21)})) ? wire16[(2'h2):(1'h0)] : wire19);
  module75 #() modinst92 (.wire79(wire20), .y(wire91), .wire77(wire19), .wire78(wire11), .clk(clk), .wire76(wire72), .wire80(wire12));
  assign wire93 = $signed(wire16);
  assign wire94 = wire72;
  assign wire95 = wire12[(5'h13):(1'h0)];
  always
    @(posedge clk) begin
      reg96 <= (|wire95);
      reg97 <= (~|{(($unsigned(wire94) < (wire17 ? wire14 : wire15)) ?
              ($signed(wire16) ?
                  (wire12 ?
                      (8'haa) : wire14) : wire74[(4'h8):(3'h4)]) : wire19[(4'h8):(1'h0)])});
      reg98 <= $signed($unsigned(wire20[(2'h3):(2'h3)]));
      reg99 <= {((~^{(8'hac), (8'ha5)}) | (-$signed($unsigned(wire22))))};
    end
  always
    @(posedge clk) begin
      if (($signed(((wire14 ?
                  wire93[(3'h5):(1'h1)] : (wire11 ? wire12 : wire19)) ?
              (!{wire11, wire16}) : ((|(8'ha3)) + wire72[(2'h3):(1'h0)]))) ?
          $signed(($unsigned((reg96 ? wire93 : reg97)) ?
              ((wire15 ?
                  reg98 : wire94) || wire15) : $unsigned(reg99[(2'h2):(1'h0)]))) : wire12))
        begin
          reg100 <= reg98;
          if (wire95)
            begin
              reg101 <= ((^reg98) << (8'h9e));
              reg102 <= $signed((wire16 ?
                  (8'h9e) : (wire16[(3'h5):(3'h5)] ?
                      (^~$signed(reg100)) : $signed((wire11 ?
                          wire72 : wire20)))));
              reg103 <= {($signed((~&(wire12 ? (8'hb2) : wire95))) ?
                      wire72 : $unsigned({wire13[(1'h0):(1'h0)]})),
                  ($unsigned(reg99[(3'h5):(1'h1)]) * ($unsigned(wire74) ?
                      {wire95} : (8'h9d)))};
            end
          else
            begin
              reg101 <= wire18;
              reg102 <= wire15[(2'h3):(1'h0)];
              reg103 <= ($signed($unsigned((!{wire18}))) ?
                  $signed(wire14[(4'h9):(1'h1)]) : reg102[(2'h2):(1'h0)]);
              reg104 <= reg97[(2'h3):(2'h3)];
              reg105 <= (((wire95[(3'h4):(3'h4)] >= $unsigned((7'h42))) ?
                  (wire12[(4'hb):(3'h5)] ?
                      (^wire17) : (reg101[(4'hd):(4'h9)] || (~^wire14))) : ((wire74 >= (wire74 | (8'hae))) ?
                      wire13 : (^(+wire21)))) ~^ reg98);
            end
          reg106 <= (8'h9d);
        end
      else
        begin
          reg100 <= $unsigned(((((^wire16) ?
                      (reg104 - wire74) : reg100[(1'h1):(1'h1)]) ?
                  ($signed(wire11) ?
                      $unsigned(wire12) : (8'haf)) : {$signed(wire22),
                      $unsigned(wire14)}) ?
              {((wire18 ~^ wire93) < wire93[(2'h2):(2'h2)])} : (+(-$unsigned(reg98)))));
          reg101 <= reg103[(1'h0):(1'h0)];
        end
      reg107 <= ($unsigned(reg98) * ($unsigned($signed((^reg103))) ?
          reg105[(4'h9):(2'h3)] : {((reg98 ? reg96 : reg105) >> {reg103,
                  wire94}),
              $unsigned(wire11)}));
      if ((((((~^reg96) <= $signed((8'hb1))) ?
          $unsigned($signed(reg98)) : ((8'hbd) ?
              (wire21 ?
                  reg96 : (8'ha4)) : $unsigned(reg102))) == wire21) >= $signed((!($signed(reg98) ?
          {wire20} : wire15)))))
        begin
          reg108 <= (reg105[(3'h7):(1'h1)] + $signed({wire18[(1'h0):(1'h0)]}));
          if ((~|reg108[(2'h2):(2'h2)]))
            begin
              reg109 <= ($unsigned(({(~&reg107),
                  wire91} >>> (7'h43))) < {(~|$signed((|reg102)))});
              reg110 <= $unsigned($signed(wire12));
              reg111 <= wire72;
              reg112 <= $unsigned(((~&wire19[(4'hc):(4'h8)]) > $unsigned($unsigned((reg98 != wire15)))));
              reg113 <= (+wire14[(4'hb):(3'h5)]);
            end
          else
            begin
              reg109 <= wire17;
              reg110 <= $signed({reg113, reg98});
              reg111 <= (8'hab);
              reg112 <= $unsigned(wire12);
            end
        end
      else
        begin
          reg108 <= $unsigned(wire12[(5'h12):(4'hc)]);
          reg109 <= wire18[(1'h1):(1'h0)];
          reg110 <= (&(((&reg110) && ({wire72, wire16} ?
                  wire94 : (reg98 <= (8'hb8)))) ?
              $signed(reg103) : (~|wire12[(2'h2):(1'h1)])));
          reg111 <= (^~$signed(reg105[(3'h6):(2'h3)]));
          reg112 <= {$signed($signed(wire94[(4'hd):(3'h6)]))};
        end
    end
  assign wire114 = $signed($signed(($unsigned((~|wire94)) ?
                       (~(wire17 ? wire13 : wire72)) : (wire72 ?
                           reg108[(2'h3):(1'h1)] : $signed((8'ha1))))));
  always
    @(posedge clk) begin
      reg115 <= wire91;
      reg116 <= wire114;
      reg117 <= (^$unsigned(reg115));
      reg118 <= (($unsigned(reg105) || ($unsigned(reg104[(1'h1):(1'h0)]) ?
          $signed(wire11[(4'hd):(4'ha)]) : $unsigned(reg105[(4'h9):(2'h2)]))) >> $unsigned(((8'had) || wire95[(4'hf):(3'h6)])));
      reg119 <= {(wire16[(1'h1):(1'h0)] >= {((reg106 ? wire20 : (8'hab)) ?
                  (~^reg97) : wire93[(3'h4):(1'h0)]),
              (~|$signed(reg99))})};
    end
  assign wire120 = $signed($unsigned((&$signed($signed(reg118)))));
  assign wire121 = $signed({reg118,
                       (((&reg105) ? (wire94 ? wire120 : reg107) : (|wire72)) ?
                           $signed((wire74 ~^ reg116)) : $unsigned(reg100[(1'h1):(1'h1)]))});
  assign wire122 = (+reg98[(4'h9):(3'h5)]);
endmodule

module module75  (y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire80;
  input wire signed [(3'h7):(1'h0)] wire79;
  input wire signed [(4'hd):(1'h0)] wire78;
  input wire signed [(5'h10):(1'h0)] wire77;
  input wire signed [(4'hb):(1'h0)] wire76;
  wire [(2'h2):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire89;
  wire [(5'h14):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire [(5'h14):(1'h0)] wire84;
  wire signed [(3'h5):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire82;
  wire signed [(5'h13):(1'h0)] wire81;
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 (1'h0)};
  assign wire81 = wire79[(1'h1):(1'h1)];
  assign wire82 = (^~((8'hac) ~^ $signed(($signed(wire78) ?
                      (wire76 ~^ wire76) : (wire79 ^~ wire79)))));
  assign wire83 = wire82;
  assign wire84 = (&wire79);
  assign wire85 = $unsigned($signed(wire76));
  assign wire86 = {(&(((wire85 < wire82) + (&wire84)) ?
                          ($signed(wire84) ?
                              wire78 : (wire78 + wire76)) : {wire82})),
                      (8'hbb)};
  assign wire87 = ($signed(wire79[(2'h2):(1'h1)]) | {wire79});
  assign wire88 = (^~wire82);
  assign wire89 = ((^~wire84) ?
                      ($signed($signed((wire79 ? wire86 : (8'hb4)))) ?
                          ((wire77[(5'h10):(1'h1)] ?
                                  wire76 : $unsigned((8'hbe))) ?
                              $signed(wire83) : $unsigned((wire86 ?
                                  wire88 : wire87))) : wire87[(4'hc):(4'ha)]) : (wire85[(3'h7):(2'h2)] * wire83[(1'h0):(1'h0)]));
  assign wire90 = wire84[(3'h5):(3'h5)];
endmodule

module module23  (y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h1db):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire28;
  input wire [(5'h15):(1'h0)] wire27;
  input wire signed [(5'h12):(1'h0)] wire26;
  input wire signed [(3'h7):(1'h0)] wire25;
  input wire [(5'h11):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire70;
  wire signed [(3'h7):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire30;
  wire signed [(4'h9):(1'h0)] wire29;
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire49,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire31,
                 wire30,
                 wire29,
                 reg63,
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
                 reg51,
                 reg50,
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
                 reg32,
                 (1'h0)};
  assign wire29 = $signed($unsigned((|wire25[(2'h3):(1'h0)])));
  assign wire30 = wire24[(2'h3):(1'h0)];
  assign wire31 = ((~wire30[(3'h4):(1'h0)]) ?
                      ($unsigned((~^$signed(wire27))) >= (wire29[(3'h6):(1'h0)] ?
                          $signed(wire27[(2'h3):(2'h3)]) : (wire30 < ((8'hac) ?
                              (7'h43) : wire30)))) : (wire25 ?
                          $unsigned(wire30[(1'h1):(1'h0)]) : $signed(($unsigned(wire25) | {wire26,
                              wire29}))));
  always
    @(posedge clk) begin
      reg32 <= {wire29[(2'h2):(1'h0)]};
    end
  assign wire33 = ((wire28[(5'h11):(4'he)] ?
                      {{wire29, (wire26 ? (8'hbe) : (8'hb9))},
                          wire26} : ((wire30[(2'h2):(2'h2)] | wire30) ?
                          ({wire25} ?
                              wire28[(2'h2):(2'h2)] : (^~reg32)) : (^~(~&(8'had))))) + wire28[(3'h5):(1'h1)]);
  assign wire34 = $unsigned(wire29[(2'h3):(2'h3)]);
  assign wire35 = (wire27[(2'h2):(1'h0)] + (~|({wire26[(4'hd):(4'hc)]} ^ (wire27 ?
                      wire27[(4'hb):(2'h3)] : $signed((8'h9d))))));
  assign wire36 = $signed((((~&((8'ha8) + (8'hbe))) ?
                      $signed(wire29) : $unsigned($signed(wire31))) ~^ reg32));
  assign wire37 = wire29[(3'h7):(3'h5)];
  always
    @(posedge clk) begin
      if (wire34[(4'ha):(2'h3)])
        begin
          reg38 <= $signed($signed(wire27[(4'ha):(2'h2)]));
          if (wire34)
            begin
              reg39 <= (($signed({wire26[(4'ha):(2'h2)]}) <<< $unsigned((&(wire25 >= wire27)))) ?
                  ((wire29[(3'h4):(3'h4)] > ((wire37 | wire25) ?
                      wire35 : (wire27 ?
                          wire28 : wire30))) > ($unsigned((wire37 ^ wire36)) ?
                      {((8'h9f) ? wire35 : (8'hb1)),
                          wire37} : $unsigned((wire37 <= wire28)))) : $unsigned((wire24 ^~ wire34[(1'h1):(1'h0)])));
              reg40 <= (($signed($signed(wire26)) != $signed((&(^wire36)))) ^ $unsigned((~|wire31[(1'h1):(1'h0)])));
            end
          else
            begin
              reg39 <= wire36;
            end
          if ($unsigned((8'hb4)))
            begin
              reg41 <= $unsigned(wire31[(3'h7):(2'h2)]);
              reg42 <= wire35;
            end
          else
            begin
              reg41 <= (^~({((~|wire30) | wire36[(3'h5):(3'h4)]),
                      ($unsigned(wire34) ?
                          (8'hb3) : (reg39 ? wire30 : reg42))} ?
                  {(wire24 < {wire34})} : wire34[(1'h1):(1'h1)]));
              reg42 <= $unsigned(((wire37[(4'hf):(3'h6)] << wire26[(1'h0):(1'h0)]) < {$unsigned((~^wire34)),
                  (wire31 | reg39[(3'h4):(1'h0)])}));
              reg43 <= ($unsigned(wire24) < reg32[(2'h2):(1'h0)]);
              reg44 <= (~^(((~((8'hb9) ^ (8'haa))) <<< ($unsigned((8'had)) ?
                      {(8'hb5)} : wire31[(1'h0):(1'h0)])) ?
                  reg39[(3'h4):(1'h1)] : (((reg38 ?
                      wire34 : wire26) <<< (wire26 ?
                      (8'ha3) : reg41)) || ((wire37 ? wire36 : wire36) ?
                      wire34 : wire34[(3'h4):(1'h0)]))));
              reg45 <= $signed($unsigned((reg39[(3'h6):(3'h4)] ?
                  reg41 : ((wire37 + wire24) ? (8'ha8) : $signed((8'hb2))))));
            end
        end
      else
        begin
          if (($unsigned((+{(reg39 ?
                  reg45 : wire27)})) && reg38[(1'h0):(1'h0)]))
            begin
              reg38 <= $signed((~^{wire30[(2'h2):(1'h0)]}));
            end
          else
            begin
              reg38 <= reg32;
            end
          reg39 <= (~|$signed(wire24[(4'h9):(4'h9)]));
          if ((($signed($unsigned((|reg38))) ?
              ((^(&reg39)) == (((8'hb4) ? wire27 : wire28) ?
                  (wire27 - (8'hbc)) : {wire25})) : $signed(wire28[(1'h1):(1'h1)])) < ((&({wire37,
                  reg39} < reg39)) ?
              reg43 : {$signed((wire33 ^~ (8'hab))), (~$signed(reg43))})))
            begin
              reg40 <= (-wire26);
              reg41 <= (~&(($signed((wire31 ?
                  wire34 : (8'haa))) << wire24) <<< reg43[(2'h2):(1'h1)]));
              reg42 <= (~^(reg45[(3'h7):(2'h3)] == wire34));
            end
          else
            begin
              reg40 <= $unsigned((8'hbb));
              reg41 <= ((~($signed($signed(wire37)) != {(~^reg32),
                  (wire30 ? wire37 : wire25)})) ^ (8'h9d));
            end
          reg43 <= wire33[(3'h4):(2'h3)];
        end
      reg46 <= (reg44 ?
          $unsigned(reg42) : (~^$unsigned($signed($unsigned(reg42)))));
      reg47 <= (!$signed($unsigned({(+wire28), wire31[(1'h1):(1'h0)]})));
      reg48 <= (reg45 + (-(8'hb5)));
    end
  assign wire49 = reg38;
  always
    @(posedge clk) begin
      reg50 <= (~|$signed(((+wire25[(2'h3):(2'h3)]) ?
          reg39[(4'ha):(1'h1)] : ((wire31 <<< wire31) ?
              (reg47 ? reg43 : wire28) : (~|wire29)))));
      reg51 <= {(8'hbf)};
      reg52 <= ($unsigned((+wire29[(1'h1):(1'h1)])) ^ ($signed(reg40) ~^ $signed(((~&(7'h42)) > (~&wire37)))));
      reg53 <= $unsigned((^$unsigned($signed($signed(wire35)))));
    end
  always
    @(posedge clk) begin
      reg54 <= reg32;
      if ($signed($unsigned(($signed(reg48) ?
          reg50[(2'h3):(2'h2)] : (|wire24[(2'h3):(1'h1)])))))
        begin
          reg55 <= reg44[(1'h0):(1'h0)];
        end
      else
        begin
          reg55 <= (8'hb7);
          reg56 <= $signed(((^$signed($signed(reg42))) ?
              reg39[(4'h9):(1'h1)] : $unsigned(reg43[(2'h2):(1'h0)])));
          reg57 <= reg38;
          reg58 <= reg52[(4'ha):(2'h2)];
          if ((reg40 <= {$signed(reg44[(1'h1):(1'h0)])}))
            begin
              reg59 <= $signed((~((!reg54) ?
                  (reg58 != (~wire36)) : $unsigned((reg57 & reg55)))));
              reg60 <= (reg38 - (($unsigned((reg47 ? reg45 : wire25)) ?
                  $signed($unsigned(reg59)) : reg46) << ($signed((wire35 >= (8'hbe))) >>> (7'h44))));
              reg61 <= (~&$unsigned(($unsigned({wire30,
                  reg58}) && (&(wire33 * wire26)))));
              reg62 <= (&(reg32[(1'h1):(1'h1)] ?
                  $signed((!{wire29})) : $signed((wire37[(4'hd):(4'hc)] * $unsigned(reg48)))));
            end
          else
            begin
              reg59 <= reg41[(4'ha):(4'h9)];
              reg60 <= reg57;
            end
        end
      reg63 <= $signed(reg51[(4'hc):(1'h1)]);
    end
  assign wire64 = {reg41};
  assign wire65 = reg52;
  assign wire66 = (^{$unsigned($unsigned({wire37})), (|wire49)});
  assign wire67 = {reg39,
                      ($signed($unsigned(((7'h42) == reg54))) ?
                          ($signed({reg60}) ?
                              (wire66[(1'h1):(1'h0)] ?
                                  (~&wire36) : (~^reg41)) : (wire35[(4'hb):(4'h8)] != (wire24 * wire29))) : ($unsigned({reg42}) ?
                              (8'ha1) : (~|$signed(wire29))))};
  assign wire68 = reg48;
  assign wire69 = ((^$unsigned($signed($signed(reg47)))) ?
                      ((wire64[(2'h2):(2'h2)] ?
                              ((wire27 ? reg38 : wire35) ?
                                  (wire29 ^ (7'h44)) : wire31[(3'h6):(1'h0)]) : reg51) ?
                          reg43[(2'h3):(2'h2)] : {reg62}) : (((~(reg38 << wire37)) << reg40) ?
                          reg58 : (((reg45 <<< reg48) << (^wire65)) ?
                              $unsigned((reg54 <= reg38)) : $unsigned($unsigned((8'hab))))));
  assign wire70 = (wire31 ?
                      $signed($signed($signed($signed(reg47)))) : (wire64[(2'h3):(2'h2)] || (~^wire36[(3'h6):(3'h5)])));
  assign wire71 = (+reg32[(1'h0):(1'h0)]);
endmodule

module module218  (y, clk, wire222, wire221, wire220, wire219);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire222;
  input wire signed [(5'h14):(1'h0)] wire221;
  input wire signed [(3'h6):(1'h0)] wire220;
  input wire [(2'h2):(1'h0)] wire219;
  wire [(4'h9):(1'h0)] wire234;
  wire signed [(4'hb):(1'h0)] wire233;
  wire signed [(5'h14):(1'h0)] wire232;
  wire signed [(4'h9):(1'h0)] wire231;
  wire [(2'h3):(1'h0)] wire230;
  wire [(3'h4):(1'h0)] wire229;
  wire signed [(5'h10):(1'h0)] wire228;
  wire signed [(5'h12):(1'h0)] wire225;
  wire [(2'h3):(1'h0)] wire224;
  wire [(4'hf):(1'h0)] wire223;
  reg signed [(4'hd):(1'h0)] reg227 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg226 = (1'h0);
  assign y = {wire234,
                 wire233,
                 wire232,
                 wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire225,
                 wire224,
                 wire223,
                 reg227,
                 reg226,
                 (1'h0)};
  assign wire223 = ($signed(wire221) <= (wire220[(2'h3):(2'h2)] ?
                       (7'h42) : $unsigned(((wire219 ?
                           wire220 : wire222) >= wire220))));
  assign wire224 = ((+(wire223 ^~ ($signed(wire220) ?
                           $unsigned(wire219) : ((8'ha5) ?
                               wire223 : wire223)))) ?
                       $signed($signed(wire222[(2'h3):(1'h1)])) : wire219[(2'h2):(2'h2)]);
  assign wire225 = $signed((wire221[(2'h2):(2'h2)] < (&$unsigned(wire220))));
  always
    @(posedge clk) begin
      reg226 <= {$signed((&(8'hb5)))};
      reg227 <= $signed((($signed(wire225) - wire222[(4'h9):(1'h0)]) ?
          wire222[(3'h7):(1'h1)] : (((~wire224) | wire221[(4'hd):(4'hb)]) ?
              ($signed(wire223) > reg226) : {(wire221 << wire219)})));
    end
  assign wire228 = ({$signed(reg226)} ^ (~&{(8'ha6)}));
  assign wire229 = wire222;
  assign wire230 = (~|{$unsigned(((8'ha8) ?
                           (wire221 ^ wire220) : wire219[(2'h2):(1'h0)]))});
  assign wire231 = $signed($unsigned({({wire221, wire223} ?
                           (&wire220) : wire220)}));
  assign wire232 = (8'hb3);
  assign wire233 = wire221[(5'h13):(2'h2)];
  assign wire234 = (wire223[(1'h0):(1'h0)] < $signed((~&(~^(wire225 ?
                       wire233 : wire231)))));
endmodule

module module203
#(parameter param214 = (({((!(8'h9e)) < (~(8'hbd)))} ? ((((8'hae) ? (8'hac) : (7'h40)) ? (~(8'ha8)) : ((8'hb9) ? (8'ha6) : (8'hb3))) * (8'ha4)) : ((+(~|(8'hb4))) | (((8'hb5) ? (8'hb6) : (7'h41)) <<< ((8'hb7) == (8'hb5))))) >>> (&(&((8'hb4) ? ((8'hb1) ? (8'ha1) : (7'h40)) : (^~(7'h40)))))))
(y, clk, wire208, wire207, wire206, wire205, wire204);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire208;
  input wire signed [(4'hc):(1'h0)] wire207;
  input wire signed [(4'hc):(1'h0)] wire206;
  input wire signed [(2'h2):(1'h0)] wire205;
  input wire signed [(5'h13):(1'h0)] wire204;
  wire signed [(5'h12):(1'h0)] wire213;
  wire signed [(2'h3):(1'h0)] wire212;
  wire [(4'hf):(1'h0)] wire211;
  wire signed [(4'ha):(1'h0)] wire210;
  wire signed [(4'hd):(1'h0)] wire209;
  assign y = {wire213, wire212, wire211, wire210, wire209, (1'h0)};
  assign wire209 = $unsigned((wire206[(4'hb):(3'h4)] << ((~^wire206) ?
                       ((wire206 || wire207) ?
                           wire206 : $signed(wire206)) : wire204[(5'h13):(1'h1)])));
  assign wire210 = wire207;
  assign wire211 = $signed($signed(((~&wire209[(2'h2):(1'h0)]) >> wire206)));
  assign wire212 = (7'h42);
  assign wire213 = wire207;
endmodule

module module184  (y, clk, wire189, wire188, wire187, wire186, wire185);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire189;
  input wire [(5'h12):(1'h0)] wire188;
  input wire [(4'h9):(1'h0)] wire187;
  input wire signed [(2'h2):(1'h0)] wire186;
  input wire signed [(3'h5):(1'h0)] wire185;
  wire [(2'h2):(1'h0)] wire198;
  wire signed [(5'h10):(1'h0)] wire197;
  wire [(5'h10):(1'h0)] wire196;
  wire signed [(2'h3):(1'h0)] wire195;
  wire signed [(4'hd):(1'h0)] wire194;
  wire signed [(4'hd):(1'h0)] wire193;
  wire signed [(3'h4):(1'h0)] wire192;
  wire [(5'h12):(1'h0)] wire191;
  wire signed [(4'hb):(1'h0)] wire190;
  assign y = {wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 (1'h0)};
  assign wire190 = (!{wire187[(4'h8):(4'h8)],
                       {((wire185 > (8'hae)) ? $unsigned(wire186) : wire185),
                           (wire186 | $signed(wire187))}});
  assign wire191 = $signed(wire188[(2'h3):(2'h3)]);
  assign wire192 = wire186;
  assign wire193 = ({wire187[(1'h0):(1'h0)],
                           $unsigned(((wire189 ? wire191 : (8'h9d)) ?
                               $unsigned((8'ha2)) : wire192[(3'h4):(3'h4)]))} ?
                       (^~$unsigned((!(-wire187)))) : $signed(($unsigned($signed(wire190)) == wire185)));
  assign wire194 = ((~|(8'ha5)) * ({wire186[(2'h2):(1'h0)]} - (~|$signed((wire189 >= wire191)))));
  assign wire195 = (~|$signed((^~wire186)));
  assign wire196 = wire190[(4'hb):(4'h9)];
  assign wire197 = (+((^wire194) & wire188));
  assign wire198 = $signed((wire186 ^~ $unsigned(((wire187 < wire187) | wire186))));
endmodule

module module151  (y, clk, wire155, wire154, wire153, wire152);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire155;
  input wire [(4'hd):(1'h0)] wire154;
  input wire [(4'hf):(1'h0)] wire153;
  input wire [(5'h13):(1'h0)] wire152;
  wire [(3'h6):(1'h0)] wire180;
  wire signed [(2'h3):(1'h0)] wire179;
  wire [(2'h3):(1'h0)] wire178;
  wire signed [(3'h6):(1'h0)] wire177;
  wire [(4'hd):(1'h0)] wire159;
  wire [(3'h4):(1'h0)] wire158;
  wire signed [(5'h14):(1'h0)] wire157;
  wire [(3'h5):(1'h0)] wire156;
  reg signed [(4'ha):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg174 = (1'h0);
  reg [(3'h5):(1'h0)] reg173 = (1'h0);
  reg [(5'h11):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg170 = (1'h0);
  reg [(3'h7):(1'h0)] reg169 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg168 = (1'h0);
  reg [(4'h8):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg164 = (1'h0);
  reg [(2'h2):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg162 = (1'h0);
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg [(4'he):(1'h0)] reg160 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 (1'h0)};
  assign wire156 = wire152;
  assign wire157 = $unsigned({wire156, (^~wire156)});
  assign wire158 = $unsigned(wire155);
  assign wire159 = wire154;
  always
    @(posedge clk) begin
      reg160 <= ($unsigned($signed($signed(wire152[(4'hd):(3'h6)]))) & wire155[(1'h1):(1'h1)]);
      reg161 <= {{$signed((8'ha2)), wire158}, wire158};
      if ((^($unsigned(($signed(wire159) ?
          wire155 : (~|(7'h43)))) + (reg160[(4'h9):(2'h3)] >= {wire159}))))
        begin
          reg162 <= $signed($unsigned((~&({wire159, wire156} < (&wire153)))));
          reg163 <= $unsigned($unsigned(($unsigned($signed(wire154)) ?
              wire152 : wire155)));
          if ($unsigned(reg162))
            begin
              reg164 <= $unsigned({(((wire154 ? wire152 : wire155) >= (8'h9c)) ?
                      (wire159[(3'h5):(2'h2)] >> wire156) : wire158[(2'h3):(2'h3)])});
            end
          else
            begin
              reg164 <= ((^~$signed(wire155)) ^ wire159);
            end
          if ($unsigned(wire157))
            begin
              reg165 <= ((^~wire159[(3'h5):(2'h3)]) && $signed(wire159));
              reg166 <= wire158[(1'h0):(1'h0)];
              reg167 <= (({$signed((reg161 > reg166))} - {((wire158 >>> (8'ha5)) ?
                          reg166[(4'hb):(2'h3)] : (^wire154))}) ?
                  $unsigned(wire156) : $unsigned({$signed(((8'hb0) ^ reg160)),
                      $unsigned(wire156[(3'h5):(1'h0)])}));
            end
          else
            begin
              reg165 <= (8'had);
              reg166 <= $signed((8'h9f));
              reg167 <= $signed((reg165[(2'h2):(1'h1)] ?
                  ((wire158 ~^ (|reg166)) ?
                      (!(7'h40)) : $signed($unsigned((7'h42)))) : (reg166[(3'h5):(3'h4)] || reg162)));
              reg168 <= $signed(wire157[(4'he):(3'h6)]);
              reg169 <= ($unsigned(wire157) ?
                  wire157 : (wire153[(4'ha):(1'h1)] ?
                      reg164[(4'hc):(4'h9)] : wire153[(4'h9):(4'h9)]));
            end
        end
      else
        begin
          reg162 <= $signed({$unsigned(((~reg167) != {wire155}))});
          reg163 <= $signed(reg166[(4'hc):(4'h8)]);
          reg164 <= (reg160 ?
              wire159[(2'h3):(1'h0)] : (reg160 ?
                  ((~^(reg169 | reg164)) < reg166) : ($unsigned((wire157 - reg169)) ?
                      wire154 : ((reg166 >> wire154) ?
                          $signed(wire159) : {reg160, reg168}))));
          reg165 <= reg164;
        end
      reg170 <= (-$unsigned($signed($signed(wire159[(3'h5):(2'h2)]))));
      reg171 <= ((wire154 || ($unsigned(reg160[(1'h1):(1'h1)]) <<< (+(8'hbb)))) != $unsigned($signed({{reg166}})));
    end
  always
    @(posedge clk) begin
      reg172 <= wire159;
      reg173 <= reg161;
      reg174 <= reg161[(3'h6):(2'h2)];
      reg175 <= (^~wire154[(3'h5):(3'h5)]);
      reg176 <= ((~|$signed($signed((wire156 ? wire154 : wire156)))) ?
          $unsigned((~|($signed(reg172) && reg168[(1'h0):(1'h0)]))) : (~&$unsigned($signed($unsigned((8'ha5))))));
    end
  assign wire177 = ({(&$unsigned((+reg176)))} ^ (~|$unsigned(reg174)));
  assign wire178 = (wire159[(4'h9):(3'h5)] >= (~$unsigned((^~$unsigned(reg167)))));
  assign wire179 = {reg169};
  assign wire180 = wire179[(2'h3):(1'h1)];
endmodule
