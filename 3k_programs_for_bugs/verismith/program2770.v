module top
#(parameter param179 = ((({(&(8'ha7)), ((8'hbf) >> (8'hb4))} ? {{(8'ha5), (8'hbf)}} : (((8'h9f) ? (7'h42) : (8'ha2)) <= (^(8'h9f)))) <= ((^~((8'hb9) + (8'ha1))) ? (((8'hae) ? (8'hb9) : (8'hbb)) ? (8'haa) : (8'ha9)) : (((8'ha0) + (8'hbc)) ? ((8'haf) ? (8'hb2) : (8'hbf)) : {(8'h9f)}))) < {({(~&(8'hb5)), ((8'h9d) ? (8'hac) : (8'hb2))} ? (^((8'hb1) ? (8'ha8) : (8'hbe))) : (((8'ha6) ~^ (8'hbc)) << ((7'h41) ? (7'h42) : (8'haf)))), (((~(8'ha4)) ? ((8'hb5) != (8'hb7)) : ((8'hbc) != (8'hb5))) ? {((8'hba) ? (8'ha8) : (8'h9d)), {(8'hb5), (8'h9d)}} : {((8'haf) + (7'h42)), ((8'hbb) ? (8'haa) : (8'hba))})}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire178;
  wire signed [(4'ha):(1'h0)] wire174;
  wire signed [(4'hf):(1'h0)] wire173;
  wire signed [(5'h13):(1'h0)] wire172;
  wire [(5'h14):(1'h0)] wire165;
  wire signed [(3'h6):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg177 = (1'h0);
  reg [(5'h10):(1'h0)] reg176 = (1'h0);
  reg [(4'hd):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg167 = (1'h0);
  assign y = {wire178,
                 wire174,
                 wire173,
                 wire172,
                 wire165,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg177,
                 reg176,
                 reg175,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 (1'h0)};
  assign wire4 = {(wire2[(3'h6):(3'h4)] ?
                         $signed($unsigned((^wire3))) : $signed((((8'hb0) ?
                             wire0 : wire3) == $signed(wire3)))),
                     ($signed(wire3) ? wire1 : wire2[(3'h4):(1'h1)])};
  assign wire5 = $unsigned(({$unsigned((~wire4))} ?
                     {wire0,
                         $unsigned((wire1 & (8'ha6)))} : $signed($unsigned(wire4[(2'h2):(1'h0)]))));
  assign wire6 = wire5;
  assign wire7 = (|wire2);
  assign wire8 = ({{($unsigned(wire7) <= (wire7 >= wire6)),
                         $unsigned((wire7 ?
                             wire4 : wire2))}} & $signed(($signed($signed(wire1)) << $signed(wire6))));
  assign wire9 = (wire3[(2'h3):(1'h0)] << $signed(wire7[(1'h0):(1'h0)]));
  assign wire10 = wire5[(5'h14):(2'h2)];
  module11 #() modinst166 (wire165, clk, wire7, wire2, wire6, wire1);
  always
    @(posedge clk) begin
      reg167 <= $signed((8'ha3));
      reg168 <= $unsigned({wire165[(5'h10):(3'h6)]});
      reg169 <= (^wire9[(3'h4):(3'h4)]);
      reg170 <= $unsigned((wire3[(2'h3):(1'h1)] || (&$signed({wire6,
          wire165}))));
      reg171 <= (wire2[(4'he):(2'h3)] >= (^$signed($unsigned($unsigned(wire10)))));
    end
  assign wire172 = reg171[(1'h1):(1'h1)];
  assign wire173 = $signed((wire10 < (wire8[(4'hf):(4'h9)] < $unsigned($unsigned(reg170)))));
  assign wire174 = $unsigned(wire172);
  always
    @(posedge clk) begin
      reg175 <= wire3;
      reg176 <= wire2[(4'hb):(3'h6)];
      reg177 <= $unsigned(wire1);
    end
  assign wire178 = $unsigned(reg168);
endmodule

module module11
#(parameter param163 = (((((!(8'hbd)) == (~&(8'h9c))) - (|((8'h9f) ? (8'hb5) : (8'ha8)))) ? ((~&((8'hb7) ? (8'h9d) : (8'ha0))) + (~((8'hb0) - (8'hb4)))) : ((~&{(7'h44)}) ? ({(8'had), (8'ha0)} << (-(8'ha0))) : ({(8'ha5), (7'h40)} ? ((8'hb3) ? (8'hb1) : (8'ha8)) : {(8'hb9)}))) >> ({{(^~(8'hb0))}} ? (((^(8'h9d)) ? ((8'ha3) ? (8'ha7) : (8'hb5)) : ((8'ha1) - (8'hbe))) ? (!((8'h9e) >>> (7'h43))) : (~(^~(8'ha7)))) : (!{{(8'haf), (8'h9f)}, (~(8'ha2))}))), 
parameter param164 = ({((^(^~param163)) ? (param163 ? ((8'hba) ~^ param163) : (param163 || param163)) : (~^(param163 <<< param163)))} ? ((+(~param163)) ? (param163 ~^ (|((8'ha9) ? param163 : param163))) : ((~&(param163 <<< param163)) ? (~^(8'hb2)) : param163)) : {((|(~|param163)) << (^~(~|param163))), ((&param163) ? (&(param163 ? param163 : param163)) : ((param163 ? param163 : param163) ? (~param163) : (param163 <= param163)))}))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'hfb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire15;
  input wire signed [(5'h15):(1'h0)] wire14;
  input wire signed [(5'h12):(1'h0)] wire13;
  input wire [(5'h12):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire161;
  wire [(3'h7):(1'h0)] wire144;
  wire signed [(4'hc):(1'h0)] wire143;
  wire signed [(4'he):(1'h0)] wire142;
  wire [(4'hc):(1'h0)] wire141;
  wire [(3'h7):(1'h0)] wire140;
  wire signed [(5'h10):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire72;
  wire signed [(5'h12):(1'h0)] wire108;
  wire [(4'hc):(1'h0)] wire110;
  wire signed [(3'h6):(1'h0)] wire111;
  wire signed [(4'hc):(1'h0)] wire112;
  wire [(3'h7):(1'h0)] wire113;
  wire [(3'h6):(1'h0)] wire114;
  wire [(5'h11):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire138;
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  assign y = {wire161,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire70,
                 wire19,
                 wire16,
                 wire72,
                 wire108,
                 wire110,
                 wire111,
                 wire112,
                 wire113,
                 wire114,
                 wire115,
                 wire138,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire16 = $signed(wire15[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg17 <= (-(&{{wire13[(3'h7):(3'h5)]}}));
      reg18 <= (~^((+wire15[(3'h6):(3'h5)]) ?
          ((~|$signed(wire15)) ?
              ((wire13 <<< wire12) & (wire12 - wire12)) : ((wire13 ?
                  wire12 : wire12) <<< (wire14 ?
                  reg17 : wire12))) : $unsigned($unsigned($signed(wire16)))));
    end
  assign wire19 = wire15[(2'h2):(1'h1)];
  module20 #() modinst71 (.wire23(wire15), .wire24(reg17), .clk(clk), .wire21(wire19), .y(wire70), .wire25(wire12), .wire22(reg18));
  assign wire72 = $unsigned((-($signed({(8'ha4)}) * $unsigned((|wire12)))));
  module73 #() modinst109 (.y(wire108), .wire78(reg18), .wire75(wire14), .clk(clk), .wire77(wire13), .wire74(wire72), .wire76(wire12));
  assign wire110 = wire16;
  assign wire111 = $signed((wire110 ?
                       $unsigned($unsigned((reg17 ?
                           wire13 : wire108))) : (~(~wire13[(5'h12):(4'ha)]))));
  assign wire112 = wire12;
  assign wire113 = $signed(((7'h40) >= $unsigned(wire110)));
  assign wire114 = wire70[(4'he):(4'ha)];
  assign wire115 = ($unsigned(((~{wire113}) ?
                           wire16[(2'h3):(2'h3)] : $unsigned(((8'hb8) ?
                               wire15 : wire15)))) ?
                       $unsigned(($signed((wire113 ? wire113 : wire110)) ?
                           (reg18 ~^ wire72[(2'h2):(2'h2)]) : {wire12[(3'h4):(2'h3)],
                               {wire70, wire108}})) : wire16);
  module116 #() modinst139 (wire138, clk, wire12, reg17, wire13, wire19);
  assign wire140 = {$unsigned({wire70[(1'h1):(1'h0)]}),
                       $signed(wire114[(1'h1):(1'h0)])};
  assign wire141 = ($unsigned($signed(((8'h9d) ?
                       (~|(8'h9f)) : $unsigned(wire72)))) == $signed(($unsigned((wire72 ?
                           wire72 : wire138)) ?
                       ({(8'hbc), wire140} ?
                           wire15 : (wire113 ?
                               wire138 : wire19)) : {$signed(wire140)})));
  assign wire142 = (~$unsigned($signed(wire112)));
  assign wire143 = reg18[(5'h13):(3'h4)];
  assign wire144 = {$signed((wire112 ?
                           $unsigned(wire112) : {wire112[(4'hc):(4'hc)],
                               (!reg18)}))};
  module145 #() modinst162 (.wire148(wire13), .wire147(wire108), .clk(clk), .y(wire161), .wire146(wire16), .wire149(wire142));
endmodule

module module145
#(parameter param159 = (&((~^{{(8'ha2)}}) ^ (~|(((8'ha7) * (8'hbf)) >= ((8'ha9) ? (8'hb2) : (8'h9f)))))), 
parameter param160 = param159)
(y, clk, wire149, wire148, wire147, wire146);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire149;
  input wire signed [(4'ha):(1'h0)] wire148;
  input wire [(5'h12):(1'h0)] wire147;
  input wire signed [(3'h7):(1'h0)] wire146;
  wire [(5'h11):(1'h0)] wire158;
  wire [(3'h6):(1'h0)] wire157;
  wire [(5'h10):(1'h0)] wire156;
  wire [(4'hb):(1'h0)] wire155;
  wire signed [(5'h10):(1'h0)] wire154;
  wire signed [(3'h5):(1'h0)] wire153;
  wire [(5'h13):(1'h0)] wire152;
  wire [(4'hc):(1'h0)] wire151;
  wire signed [(4'hd):(1'h0)] wire150;
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 (1'h0)};
  assign wire150 = {({$signed(wire146[(1'h1):(1'h0)]),
                           (^~(wire148 ?
                               wire148 : wire147))} | wire147[(4'hf):(4'hb)])};
  assign wire151 = $signed((wire146[(3'h5):(3'h4)] ?
                       {$signed(((8'hbd) + wire147))} : wire147[(3'h5):(1'h0)]));
  assign wire152 = (^~wire149[(2'h2):(1'h0)]);
  assign wire153 = (wire150[(1'h0):(1'h0)] ?
                       ($signed($unsigned((~|wire149))) ?
                           wire148 : ({$unsigned((8'hb8)),
                                   (wire151 < (8'ha4))} ?
                               {(wire150 ? wire148 : (8'hb9)),
                                   (wire149 & wire146)} : $unsigned(wire148))) : (!$signed(wire148[(2'h3):(1'h0)])));
  assign wire154 = $signed((wire153 ?
                       $unsigned((|$unsigned(wire153))) : $signed((8'haa))));
  assign wire155 = (8'hb3);
  assign wire156 = wire152[(4'hd):(3'h7)];
  assign wire157 = (wire148 != ((&{wire146[(2'h3):(2'h2)]}) >= $signed((((8'h9f) ?
                           wire147 : wire151) ?
                       (wire155 == wire152) : $unsigned(wire155)))));
  assign wire158 = $unsigned(wire149[(3'h4):(3'h4)]);
endmodule

module module116
#(parameter param137 = (8'hbd))
(y, clk, wire120, wire119, wire118, wire117);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire120;
  input wire signed [(4'hd):(1'h0)] wire119;
  input wire [(5'h11):(1'h0)] wire118;
  input wire [(4'hf):(1'h0)] wire117;
  wire signed [(5'h12):(1'h0)] wire136;
  wire signed [(3'h4):(1'h0)] wire135;
  wire [(3'h5):(1'h0)] wire134;
  wire signed [(5'h14):(1'h0)] wire124;
  wire signed [(5'h11):(1'h0)] wire123;
  wire signed [(5'h10):(1'h0)] wire122;
  wire [(3'h7):(1'h0)] wire121;
  reg [(4'hd):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg132 = (1'h0);
  reg [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg129 = (1'h0);
  reg [(2'h2):(1'h0)] reg128 = (1'h0);
  reg [(5'h12):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg125 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire134,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 (1'h0)};
  assign wire121 = (wire117 ?
                       ($unsigned((wire119 ?
                               $signed(wire118) : $signed(wire118))) ?
                           wire120[(4'hb):(3'h5)] : (+(8'hbd))) : $signed(wire118[(5'h10):(1'h0)]));
  assign wire122 = ({$signed($unsigned({wire121}))} ?
                       wire119[(2'h2):(1'h0)] : wire118);
  assign wire123 = wire121[(1'h0):(1'h0)];
  assign wire124 = $signed(wire122);
  always
    @(posedge clk) begin
      if (($signed(({{wire123, wire120}} - $signed((^~wire117)))) >= wire122))
        begin
          if ($signed((($signed(wire122) - wire118[(3'h6):(3'h6)]) & (+wire120))))
            begin
              reg125 <= $signed($signed({($signed(wire122) >= $signed(wire117))}));
              reg126 <= reg125;
              reg127 <= $signed((wire121[(1'h0):(1'h0)] ? reg125 : (^reg125)));
              reg128 <= (!$signed((~|((+wire120) >> wire121))));
              reg129 <= (8'hb8);
            end
          else
            begin
              reg125 <= $signed($unsigned(wire124[(5'h12):(4'hb)]));
            end
          reg130 <= wire119;
          reg131 <= ($unsigned($signed({{wire121}})) ?
              ({($signed(wire117) < (~|reg128))} ?
                  $unsigned(($signed(reg129) ?
                      $unsigned((8'haa)) : reg126)) : (!{((8'h9d) >= reg130)})) : $signed((($unsigned(wire120) == (wire118 || wire120)) | wire123)));
          reg132 <= wire123[(4'he):(3'h7)];
        end
      else
        begin
          reg125 <= (7'h42);
          reg126 <= $signed($unsigned($signed($unsigned($unsigned(wire119)))));
        end
      reg133 <= $signed({(wire118[(3'h5):(2'h3)] ?
              wire117 : {(wire121 ? wire118 : reg131)}),
          $signed((wire118 ? reg130[(4'hf):(4'hf)] : $signed(wire120)))});
    end
  assign wire134 = reg126;
  assign wire135 = wire118;
  assign wire136 = (-(8'ha6));
endmodule

module module73
#(parameter param106 = (((~&{((8'hba) ? (8'hbf) : (8'ha2))}) ? ((^~(^(8'ha3))) & ((~^(8'h9d)) != ((8'ha9) ? (8'ha4) : (7'h44)))) : (-{((8'h9e) ? (7'h40) : (8'hbb))})) ? ({({(7'h42), (7'h44)} ? ((8'hb8) >= (7'h41)) : ((8'hbf) <= (8'ha9))), (~|(|(8'h9c)))} ^ ((((8'had) > (8'haa)) | ((8'hb1) <= (8'hbe))) << ((-(8'ha6)) & ((8'hb4) >> (8'hb8))))) : (((((8'h9c) ? (7'h44) : (8'ha1)) ? {(8'h9e)} : ((8'ha6) >= (8'haf))) ? (|(^~(8'h9d))) : (-((8'ha9) * (8'hb2)))) > (^((&(8'hbf)) ? {(8'h9d), (8'hb9)} : {(8'ha2), (8'h9d)})))), 
parameter param107 = ((8'had) << ((((param106 ~^ param106) ? param106 : (param106 < param106)) < (&(~&param106))) ~^ {(~(param106 >= param106))})))
(y, clk, wire78, wire77, wire76, wire75, wire74);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire78;
  input wire [(5'h12):(1'h0)] wire77;
  input wire signed [(4'hc):(1'h0)] wire76;
  input wire signed [(5'h15):(1'h0)] wire75;
  input wire [(5'h15):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire105;
  wire signed [(4'h8):(1'h0)] wire104;
  wire signed [(4'h8):(1'h0)] wire103;
  wire [(5'h11):(1'h0)] wire102;
  wire [(4'hd):(1'h0)] wire101;
  wire [(4'ha):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire99;
  wire signed [(4'he):(1'h0)] wire94;
  wire signed [(5'h15):(1'h0)] wire93;
  wire signed [(2'h3):(1'h0)] wire92;
  wire [(3'h5):(1'h0)] wire91;
  wire signed [(5'h10):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire86;
  wire [(4'h8):(1'h0)] wire85;
  wire signed [(4'he):(1'h0)] wire84;
  wire [(2'h3):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire81;
  wire signed [(5'h12):(1'h0)] wire80;
  wire [(4'h9):(1'h0)] wire79;
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg88 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire79 = wire76;
  assign wire80 = (-{(+(-(wire76 == wire76)))});
  assign wire81 = (wire75 & wire77[(5'h10):(3'h4)]);
  assign wire82 = wire80[(4'ha):(4'h8)];
  assign wire83 = ($unsigned(wire77) ?
                      $unsigned($signed($signed({wire77,
                          wire78}))) : (~^(~wire81)));
  assign wire84 = $signed(wire76);
  assign wire85 = wire80[(4'ha):(3'h5)];
  assign wire86 = ({$signed({$signed(wire80)})} ?
                      $unsigned({(wire76[(2'h3):(1'h0)] ?
                              (wire75 - wire79) : $signed((8'hba)))}) : ($signed((wire82[(4'h8):(3'h4)] < (wire82 ?
                          wire84 : wire85))) >= $unsigned($signed(wire84))));
  assign wire87 = (wire82[(4'hc):(3'h5)] ? $unsigned(wire85) : (~^wire76));
  always
    @(posedge clk) begin
      reg88 <= $signed($unsigned(wire85[(3'h7):(1'h1)]));
      reg89 <= wire86[(4'hc):(1'h0)];
    end
  assign wire90 = $signed(wire87[(4'hf):(4'hc)]);
  assign wire91 = (~$signed(wire74[(3'h4):(1'h1)]));
  assign wire92 = (^(~&wire78));
  assign wire93 = wire78;
  assign wire94 = ({wire76} ? wire78 : wire85);
  always
    @(posedge clk) begin
      reg95 <= (($unsigned(({(8'haa)} + $signed(wire84))) == wire85[(3'h5):(2'h2)]) ?
          $signed((^((wire85 * (8'hbf)) ^ {wire80}))) : wire75);
      reg96 <= wire94[(4'ha):(4'h9)];
      reg97 <= ({(~|(7'h40))} ?
          $unsigned($unsigned(wire77)) : $signed(wire78[(1'h1):(1'h1)]));
      reg98 <= ((($signed(reg96[(4'hb):(3'h5)]) ?
          reg88 : $signed(wire91)) * $unsigned(wire77[(5'h10):(1'h1)])) >>> {((~&wire81[(2'h3):(1'h1)]) ?
              $signed((reg95 ? wire93 : wire84)) : $unsigned(wire85)),
          wire81});
    end
  assign wire99 = ($unsigned($unsigned(wire93)) ?
                      (^~(($unsigned(reg98) && reg98[(3'h4):(1'h1)]) ?
                          wire94[(1'h1):(1'h0)] : ((wire74 ?
                              wire79 : wire77) | $signed((8'hb8))))) : ((wire81 ~^ (^reg96)) == {wire94,
                          ((reg96 ? (7'h41) : reg95) >= ((8'ha6) ?
                              (7'h43) : wire90))}));
  assign wire100 = {(($signed((wire82 ?
                           wire77 : reg88)) ^ (+$unsigned(wire93))) != $unsigned(wire77)),
                       (|$signed(wire74))};
  assign wire101 = wire83;
  assign wire102 = $signed((~$unsigned((~^(-(8'haa))))));
  assign wire103 = wire78[(1'h0):(1'h0)];
  assign wire104 = wire85[(1'h1):(1'h0)];
  assign wire105 = (&$signed((8'h9e)));
endmodule

module module20
#(parameter param69 = ((!((((8'ha6) ? (8'ha8) : (8'hbd)) > ((8'hb6) * (7'h44))) ? ((-(8'hb4)) ? (&(8'hb4)) : {(8'ha8)}) : ({(8'ha5)} ? ((8'hb1) == (8'ha8)) : ((8'hb0) != (8'hbf))))) ? (({(-(8'h9e)), {(8'h9e), (8'ha1)}} + (((7'h41) <<< (7'h42)) - {(8'haa)})) ? (+(^~((8'hb6) & (8'ha5)))) : ((((8'had) ? (7'h41) : (8'ha8)) - (7'h43)) ? ((~&(8'ha7)) == ((8'h9c) <<< (8'hac))) : {{(8'hb8), (8'hbf)}, ((8'hb0) ? (8'hbd) : (7'h44))})) : ((-{((8'hbd) ? (8'hac) : (8'h9d))}) ? ((^~(8'ha1)) ? (((8'hb4) ? (8'ha6) : (8'h9f)) == ((8'ha8) ? (8'ha7) : (8'ha2))) : {((8'hb1) <<< (8'hbb)), (~(8'hb1))}) : (~((~(8'hb4)) ~^ (~|(8'hbf)))))))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h1da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire25;
  input wire [(2'h3):(1'h0)] wire24;
  input wire signed [(4'h8):(1'h0)] wire23;
  input wire [(4'he):(1'h0)] wire22;
  input wire [(3'h7):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire26;
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire42,
                 wire41,
                 wire40,
                 wire27,
                 wire26,
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
                 reg55,
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
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire26 = (({$unsigned((wire22 ~^ wire25)), wire21[(2'h3):(2'h3)]} ?
                      ((~^$unsigned(wire21)) ?
                          wire22[(2'h2):(2'h2)] : wire22) : (($signed((8'h9c)) - (~|wire24)) && $unsigned((wire23 ?
                          wire22 : wire24)))) << ((($signed((8'h9d)) ?
                              (wire21 << (8'hb4)) : wire25) ?
                          (!$signed(wire24)) : $unsigned(((8'hb3) ?
                              wire22 : wire21))) ?
                      (((wire23 < wire22) != {wire22}) ?
                          ({wire25,
                              wire22} && wire21[(2'h2):(1'h0)]) : wire24[(2'h3):(1'h1)]) : wire25));
  assign wire27 = wire21[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg28 <= wire27;
      reg29 <= wire25[(1'h0):(1'h0)];
      if ($unsigned((wire27 << (&$unsigned({wire25, (8'ha7)})))))
        begin
          if ((&$unsigned($unsigned(reg29))))
            begin
              reg30 <= ($unsigned($signed(reg29)) ?
                  $unsigned(({$unsigned(wire22), $unsigned(wire24)} ?
                      ((reg28 < wire25) ?
                          $unsigned(reg28) : $signed(wire22)) : reg29[(1'h1):(1'h1)])) : (+($signed({wire21,
                          wire21}) ?
                      reg29[(4'h9):(3'h4)] : wire26)));
            end
          else
            begin
              reg30 <= ({wire22[(4'hc):(4'h9)]} ?
                  (wire25 >>> $signed(($signed(wire27) ?
                      wire24[(1'h1):(1'h0)] : wire21))) : ((|(reg28[(4'h9):(1'h1)] ?
                          ((8'hb4) ? wire24 : reg28) : $signed(wire25))) ?
                      (^~$signed((!wire25))) : (~|{(wire23 ? reg30 : reg28),
                          wire27[(3'h5):(3'h5)]})));
            end
          reg31 <= (wire21[(2'h2):(2'h2)] ?
              $unsigned((($unsigned((8'hb2)) == $unsigned((8'hbc))) ?
                  wire21[(1'h1):(1'h0)] : ($signed(reg29) ?
                      wire23 : $unsigned(wire23)))) : (~&{$signed(wire25)}));
          if (wire22)
            begin
              reg32 <= (^(wire26[(1'h0):(1'h0)] ?
                  ((~|(wire21 > reg28)) ?
                      $signed((|wire23)) : $unsigned((!wire24))) : (|$signed($signed(reg28)))));
              reg33 <= wire24[(2'h3):(2'h3)];
              reg34 <= (($signed($signed((wire24 || reg29))) ^~ (~|reg29[(2'h2):(2'h2)])) > reg31[(3'h5):(2'h2)]);
              reg35 <= (8'haa);
            end
          else
            begin
              reg32 <= ((~^{{(reg29 ^ (8'hba))}}) ~^ reg33[(1'h0):(1'h0)]);
              reg33 <= $unsigned($signed((!reg28[(1'h1):(1'h0)])));
              reg34 <= ((^~(~&{(reg34 ? (8'h9c) : (8'h9c)),
                      (reg28 ? wire24 : (8'ha9))})) ?
                  $unsigned(($unsigned((reg29 <<< reg34)) ?
                      (reg31 ?
                          $unsigned(wire25) : $signed((8'h9c))) : reg33[(2'h2):(1'h1)])) : $signed(wire22[(4'h9):(1'h1)]));
              reg35 <= (|{{$unsigned((wire26 ? reg35 : wire22)), reg35}});
            end
          reg36 <= ((wire21[(3'h4):(2'h3)] ?
                  $signed(($signed(reg32) ?
                      {reg28, wire22} : (wire23 ?
                          wire23 : wire27))) : $unsigned($unsigned($signed(wire26)))) ?
              reg30[(4'ha):(1'h1)] : (8'ha1));
          reg37 <= $unsigned(reg28);
        end
      else
        begin
          reg30 <= wire26;
          reg31 <= ((~reg37[(1'h0):(1'h0)]) ?
              $unsigned($unsigned(reg33[(1'h1):(1'h0)])) : reg37[(2'h3):(1'h0)]);
          if ((&(((reg33[(2'h2):(2'h2)] ?
              {wire23, (8'ha6)} : (!wire22)) ~^ ($unsigned(wire25) ?
              $unsigned(reg29) : $unsigned(wire25))) | $unsigned(reg35[(2'h3):(1'h0)]))))
            begin
              reg32 <= ($unsigned((((wire23 <= wire21) ?
                  $unsigned(reg29) : $signed((8'hb1))) & (!(8'h9f)))) | reg35[(4'hb):(4'hb)]);
              reg33 <= {(|$signed(((!reg36) ?
                      ((8'hb2) ? wire24 : wire25) : ((8'hb7) ~^ reg36)))),
                  wire24[(2'h2):(2'h2)]};
              reg34 <= ($unsigned(((&(reg32 <<< (8'hae))) ?
                      (^~reg29[(4'h9):(1'h0)]) : wire25[(1'h1):(1'h0)])) ?
                  {wire22,
                      (reg36[(2'h2):(1'h1)] ?
                          (&$unsigned(wire26)) : ((8'had) <= (+wire24)))} : reg35);
              reg35 <= $unsigned(wire24[(2'h2):(1'h1)]);
              reg36 <= (($signed(reg31[(2'h3):(2'h3)]) | $signed($unsigned(reg37))) >> $unsigned(({(~&reg28)} ?
                  (~(wire27 * wire23)) : $signed($signed(wire22)))));
            end
          else
            begin
              reg32 <= reg31;
              reg33 <= $unsigned({$signed(reg35)});
              reg34 <= {(($unsigned((|reg33)) ?
                          $signed($unsigned(wire21)) : (~^(7'h44))) ?
                      wire25[(2'h3):(2'h3)] : ($signed((|reg32)) ?
                          $signed((reg32 << (8'hb0))) : ($unsigned(wire27) ?
                              (reg34 ? reg28 : reg31) : reg36)))};
              reg35 <= (((+(^~{reg36})) ?
                  wire23[(2'h2):(1'h1)] : (7'h44)) ~^ (~^$unsigned(({wire27} ?
                  (reg28 >> reg36) : (wire25 >= reg34)))));
              reg36 <= reg29;
            end
          reg37 <= $unsigned($signed($signed((reg31 ~^ (wire22 ?
              reg33 : (8'ha8))))));
          reg38 <= $signed($signed($signed(wire22[(4'ha):(4'h9)])));
        end
      reg39 <= reg33;
    end
  assign wire40 = reg34[(1'h0):(1'h0)];
  assign wire41 = $unsigned((wire21 ?
                      {(reg28[(4'he):(4'he)] >>> wire24[(1'h1):(1'h1)]),
                          reg29[(3'h5):(1'h1)]} : wire24));
  assign wire42 = (^($unsigned(wire26) | ({(~^reg31)} ?
                      {$signed(reg38), reg39[(4'ha):(4'h8)]} : ((~&reg32) ?
                          $signed((8'hbc)) : $signed(reg31)))));
  always
    @(posedge clk) begin
      reg43 <= (wire23 ?
          $unsigned(reg29[(2'h2):(1'h1)]) : $unsigned(reg37[(2'h2):(2'h2)]));
      reg44 <= $signed($unsigned(wire27));
      reg45 <= (reg34[(2'h2):(1'h1)] == ((!reg31[(3'h7):(3'h4)]) ?
          {$signed(((7'h40) & reg33)),
              (((8'hbe) ? reg38 : wire41) ?
                  $unsigned(wire23) : ((8'h9d) >= (8'ha2)))} : wire21));
    end
  always
    @(posedge clk) begin
      if ((-$unsigned((^$unsigned(reg38[(3'h7):(3'h5)])))))
        begin
          if (($signed((($unsigned(reg39) ?
                  {reg32} : ((8'hb2) && reg32)) >>> {reg35[(5'h10):(4'hb)]})) ?
              ($unsigned($signed($signed(wire22))) ?
                  wire25 : ({(reg44 && reg43)} ?
                      ((&wire24) ?
                          $signed(wire21) : (wire21 ~^ wire27)) : $signed((reg35 ?
                          reg36 : wire27)))) : reg44))
            begin
              reg46 <= {reg39};
              reg47 <= ({reg33,
                  $signed($unsigned((~&wire41)))} <= wire22[(3'h5):(1'h0)]);
            end
          else
            begin
              reg46 <= (8'ha1);
              reg47 <= $unsigned((^(reg32[(4'hf):(4'ha)] <= ((-reg32) ^ reg37[(3'h6):(3'h4)]))));
              reg48 <= reg28[(1'h0):(1'h0)];
            end
          reg49 <= (^((reg45[(3'h5):(3'h5)] ?
                  (wire25[(4'h9):(3'h7)] ?
                      ((8'ha7) ^ wire40) : $signed(wire23)) : {reg45}) ?
              $unsigned(reg44) : ((^(wire42 ? reg45 : wire23)) ?
                  ((reg36 ? wire27 : reg36) ?
                      reg38[(4'h8):(3'h6)] : (reg38 <<< (8'ha2))) : reg47)));
        end
      else
        begin
          reg46 <= $unsigned($unsigned(($unsigned({reg29, reg31}) == reg45)));
          if (((reg49 && $signed(wire21[(1'h0):(1'h0)])) & ($signed($signed(reg48[(4'h8):(1'h0)])) ?
              $signed(((wire26 ?
                  wire40 : wire40) || $unsigned(reg28))) : (~^$unsigned($signed(reg45))))))
            begin
              reg47 <= {(+wire22[(2'h2):(1'h1)])};
              reg48 <= $signed(reg29);
              reg49 <= $unsigned((($unsigned((~reg36)) <= ((8'hb5) | (&reg39))) <<< reg30[(3'h5):(2'h3)]));
            end
          else
            begin
              reg47 <= reg47[(4'hd):(4'h8)];
              reg48 <= (|(($signed((wire24 ?
                  wire22 : reg35)) != (-(~reg43))) < reg49));
              reg49 <= (!$signed($signed(((reg39 ? (7'h40) : wire26) ?
                  $signed(wire41) : reg29[(2'h3):(1'h1)]))));
              reg50 <= (reg28 ?
                  $signed((^{$signed(reg37),
                      $unsigned((7'h42))})) : reg36[(4'ha):(3'h6)]);
            end
          reg51 <= $unsigned(((^~($unsigned(reg29) ?
              $signed(wire27) : $signed(wire21))) & (|(~&(~&wire23)))));
        end
      if (wire25[(1'h1):(1'h0)])
        begin
          if ($unsigned(((8'hb0) <= $unsigned({$signed(reg33),
              $unsigned((8'hb1))}))))
            begin
              reg52 <= reg47[(4'ha):(3'h7)];
            end
          else
            begin
              reg52 <= $unsigned(reg43);
              reg53 <= (($signed(reg51[(1'h1):(1'h0)]) ?
                      reg34 : (wire25 | ($unsigned(reg36) ?
                          reg39[(4'h9):(1'h1)] : (~|(8'hbf))))) ?
                  wire40[(2'h2):(2'h2)] : ($signed({$signed((8'h9e))}) ?
                      (^~reg28) : ((|reg31[(1'h1):(1'h1)]) ?
                          reg30[(3'h5):(3'h4)] : (^~(~reg43)))));
              reg54 <= (wire25[(2'h3):(1'h0)] ?
                  reg49 : (wire23[(3'h5):(3'h5)] || (~^(~$unsigned(reg44)))));
              reg55 <= (wire22[(3'h7):(3'h6)] >> $unsigned(reg38));
            end
          if (reg29)
            begin
              reg56 <= (^reg44[(4'h8):(4'h8)]);
              reg57 <= ((^~reg29[(4'ha):(4'ha)]) ?
                  reg34[(1'h0):(1'h0)] : $signed(((^$unsigned(reg38)) ?
                      ((~|reg37) ?
                          (|wire24) : reg45) : $signed(reg44[(4'hb):(4'hb)]))));
            end
          else
            begin
              reg56 <= $unsigned(((!($signed((8'h9e)) < (wire27 ?
                  reg34 : reg47))) || ((reg34 ?
                      wire40[(2'h2):(1'h1)] : (^reg39)) ?
                  ($unsigned(reg48) > $signed(reg44)) : $signed(wire41[(4'ha):(4'h9)]))));
              reg57 <= (^~(&$unsigned((!(^wire22)))));
              reg58 <= $unsigned({reg32});
              reg59 <= (!reg53[(3'h4):(3'h4)]);
              reg60 <= reg54[(3'h5):(3'h4)];
            end
          if (wire21[(2'h3):(1'h1)])
            begin
              reg61 <= (reg53 ?
                  {(!$unsigned({reg49}))} : $signed(reg54[(1'h0):(1'h0)]));
              reg62 <= reg43;
            end
          else
            begin
              reg61 <= (($unsigned(($signed(reg39) <= reg54)) ?
                  {{(~^reg60),
                          $signed((7'h43))}} : ($signed((reg51 * reg52)) | ($unsigned(reg55) ?
                      (wire26 - (8'hbf)) : (~^reg33)))) >> (reg35[(3'h5):(2'h3)] ^ $signed(($signed(reg49) ?
                  (reg34 ^ reg37) : (-wire22)))));
            end
          reg63 <= ($unsigned($unsigned((reg39 ? reg31 : $signed((8'hae))))) ?
              {($unsigned($signed((8'haf))) | (wire22 | $signed(reg35)))} : reg35[(3'h4):(1'h1)]);
          reg64 <= $unsigned({$signed($signed((^~reg51))),
              $signed((~$signed(reg61)))});
        end
      else
        begin
          reg52 <= $signed(reg46[(3'h7):(1'h1)]);
          reg53 <= reg47;
          reg54 <= wire22[(2'h3):(2'h2)];
        end
      reg65 <= $signed($unsigned($unsigned(((~|reg52) ?
          (reg36 < wire41) : $signed(reg36)))));
      reg66 <= (~&reg58);
    end
  assign wire67 = reg54[(3'h6):(1'h0)];
  assign wire68 = reg39[(1'h0):(1'h0)];
endmodule
