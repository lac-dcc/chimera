module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire signed [(4'ha):(1'h0)] wire178;
  wire [(4'hd):(1'h0)] wire177;
  wire signed [(5'h13):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire175;
  wire signed [(4'ha):(1'h0)] wire180;
  wire signed [(4'h8):(1'h0)] wire181;
  assign y = {wire178, wire177, wire4, wire175, wire180, wire181, (1'h0)};
  assign wire4 = ($unsigned({$unsigned(wire2[(4'h9):(3'h4)])}) * (~^$unsigned(wire2)));
  module5 #() modinst176 (wire175, clk, wire1, wire3, wire2, wire4, wire0);
  assign wire177 = (^~(({$unsigned((8'ha8)), wire2[(2'h2):(1'h0)]} ?
                       (wire4[(4'h8):(1'h1)] ?
                           wire3[(3'h7):(2'h2)] : wire3[(4'h9):(1'h1)]) : (~|wire2)) ^~ $signed(((wire2 ?
                       wire2 : (8'hb2)) <= wire175[(4'h9):(2'h3)]))));
  module13 #() modinst179 (wire178, clk, wire1, wire177, wire3, wire175, wire2);
  assign wire180 = wire3[(4'hf):(3'h6)];
  module13 #() modinst182 (.y(wire181), .wire18(wire4), .wire16(wire1), .wire15(wire175), .wire14(wire178), .clk(clk), .wire17(wire0));
endmodule

module module5
#(parameter param173 = (-(({((8'hbc) ? (8'hb7) : (7'h40)), (^~(8'had))} && (((8'hb5) ? (7'h44) : (8'ha2)) ? (~(8'hba)) : (~^(8'ha7)))) < {((+(8'hbd)) ? (^~(8'h9c)) : {(8'had), (8'ha8)})})), 
parameter param174 = ((param173 ? param173 : param173) ? {param173, (param173 != ((param173 * (8'ha0)) ? {param173} : (^param173)))} : {(~param173), (!(+(^(8'hb7))))}))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h1fb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire172;
  wire signed [(5'h15):(1'h0)] wire149;
  wire [(5'h14):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire53;
  wire signed [(3'h6):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire79;
  wire signed [(3'h6):(1'h0)] wire80;
  wire [(4'ha):(1'h0)] wire111;
  wire signed [(5'h13):(1'h0)] wire133;
  wire [(5'h15):(1'h0)] wire147;
  wire signed [(4'hb):(1'h0)] wire151;
  wire signed [(4'ha):(1'h0)] wire152;
  wire [(5'h10):(1'h0)] wire153;
  wire [(4'h9):(1'h0)] wire170;
  reg signed [(5'h11):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg168 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg166 = (1'h0);
  reg [(4'ha):(1'h0)] reg165 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg164 = (1'h0);
  reg [(2'h3):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg160 = (1'h0);
  reg [(4'hf):(1'h0)] reg159 = (1'h0);
  reg [(4'h8):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg157 = (1'h0);
  reg [(4'he):(1'h0)] reg156 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg155 = (1'h0);
  reg [(2'h2):(1'h0)] reg154 = (1'h0);
  reg [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  assign y = {wire172,
                 wire149,
                 wire51,
                 wire12,
                 wire11,
                 wire53,
                 wire58,
                 wire76,
                 wire78,
                 wire79,
                 wire80,
                 wire111,
                 wire133,
                 wire147,
                 wire151,
                 wire152,
                 wire153,
                 wire170,
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
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 (1'h0)};
  assign wire11 = (~|(({(wire6 ? (8'hb2) : wire10), (+wire7)} ?
                      {$unsigned(wire9)} : wire7[(4'ha):(3'h6)]) && (8'hb1)));
  assign wire12 = $signed((wire7 != (~^$signed((wire10 != wire11)))));
  module13 #() modinst52 (wire51, clk, wire6, wire12, wire10, wire9, wire11);
  assign wire53 = wire12;
  always
    @(posedge clk) begin
      reg54 <= wire12[(4'h8):(2'h3)];
      reg55 <= wire12[(3'h6):(1'h0)];
      reg56 <= $signed(wire7[(3'h6):(3'h6)]);
      reg57 <= (~{(wire53 >= wire12[(4'hb):(4'hb)])});
    end
  assign wire58 = ((wire7 ?
                          ((~(&wire9)) ?
                              {{wire9}} : {(wire12 != wire8),
                                  (-reg57)}) : (8'ha9)) ?
                      $unsigned(($signed((~wire8)) + $unsigned((wire7 ?
                          wire6 : reg56)))) : reg55[(2'h2):(1'h1)]);
  module59 #() modinst77 (.clk(clk), .wire61(reg55), .wire62(wire8), .y(wire76), .wire63(wire11), .wire60(reg54));
  assign wire78 = reg54[(4'h8):(1'h0)];
  assign wire79 = {wire12[(4'hc):(3'h7)],
                      $signed(($signed(wire58) > ((wire7 && reg55) ?
                          wire76[(2'h2):(1'h1)] : wire76)))};
  assign wire80 = {wire11, $signed($signed(reg54))};
  module81 #() modinst112 (wire111, clk, reg54, wire51, reg57, reg55, wire10);
  module113 #() modinst134 (.wire117(wire9), .clk(clk), .y(wire133), .wire114(wire7), .wire116(wire8), .wire115(wire12));
  module135 #() modinst148 (.y(wire147), .clk(clk), .wire139(wire8), .wire137(wire79), .wire136(reg56), .wire138(wire76));
  module135 #() modinst150 (.wire137(wire58), .wire139(reg57), .wire136(wire147), .wire138(wire53), .y(wire149), .clk(clk));
  assign wire151 = (($signed(wire11) ?
                           wire147 : ($signed((-wire78)) <<< (+wire78[(3'h5):(3'h5)]))) ?
                       {wire80} : $signed(((&$unsigned(wire80)) ?
                           {$unsigned(wire10)} : ((8'ha4) ?
                               reg56[(5'h10):(2'h2)] : wire8))));
  assign wire152 = ($unsigned(reg57[(3'h7):(3'h7)]) ?
                       wire80[(3'h5):(1'h1)] : (^~(~&($unsigned(wire6) << (^(8'hbe))))));
  assign wire153 = $signed({wire80[(2'h3):(2'h2)],
                       {$unsigned($unsigned(reg57)), (^$unsigned(wire149))}});
  always
    @(posedge clk) begin
      reg154 <= reg54;
      reg155 <= ((^~(wire80 ?
              wire78 : {(reg56 + wire111), (wire9 ? wire153 : wire11)})) ?
          wire7 : (((wire133 ?
                  wire76[(4'hc):(1'h0)] : reg56[(4'ha):(3'h5)]) ^~ ({wire6,
                  (8'ha8)} != (reg55 ? wire6 : wire149))) ?
              (^(&{reg154, (7'h40)})) : (-(-(~wire10)))));
      reg156 <= $signed(wire149[(5'h12):(5'h12)]);
      reg157 <= ($unsigned($unsigned($signed(wire9))) >> ((($unsigned(wire6) ?
              {reg154, reg155} : $signed((8'ha6))) * (^wire9[(3'h6):(3'h4)])) ?
          $unsigned({reg56, $unsigned((8'hac))}) : $unsigned({(wire80 ?
                  wire147 : wire6),
              {(8'hab)}})));
      if ((^~(^{{wire8[(4'h9):(1'h0)], wire58[(1'h0):(1'h0)]},
          wire153[(2'h3):(1'h0)]})))
        begin
          if (wire80)
            begin
              reg158 <= wire6[(2'h3):(1'h0)];
              reg159 <= $unsigned((wire151 ? $signed(reg54) : reg54));
              reg160 <= {(wire111 | (wire51[(2'h2):(1'h1)] >>> $signed((-wire76)))),
                  (wire149[(1'h1):(1'h1)] * (wire78[(1'h0):(1'h0)] ?
                      {reg55[(1'h1):(1'h0)]} : (8'ha1)))};
            end
          else
            begin
              reg158 <= reg158;
              reg159 <= $unsigned((reg156[(4'hc):(4'ha)] - reg160));
              reg160 <= (~^wire147);
              reg161 <= (((wire152 > (+$signed(reg57))) ?
                  (&$unsigned(reg157[(4'hb):(1'h0)])) : $signed((+wire111))) | ((($signed(reg159) && $signed(reg55)) >>> (+{reg57,
                  wire12})) || $signed((~|((8'hb4) ? wire149 : reg157)))));
              reg162 <= ((($unsigned($unsigned((8'ha8))) ^~ $unsigned((~|wire9))) >> wire79) * (-$unsigned(wire80[(3'h6):(3'h6)])));
            end
          reg163 <= (^~(-{((!(8'hb8)) > (reg158 ? reg157 : wire8))}));
          reg164 <= $signed(reg160);
          if (reg154[(1'h0):(1'h0)])
            begin
              reg165 <= ($signed(reg163[(1'h1):(1'h0)]) ^ $signed(($signed(wire11[(2'h3):(1'h1)]) <<< {(wire147 & reg164),
                  (!wire80)})));
              reg166 <= wire133[(4'hc):(4'ha)];
              reg167 <= reg160[(4'ha):(2'h2)];
              reg168 <= $unsigned(reg158);
            end
          else
            begin
              reg165 <= wire58[(1'h0):(1'h0)];
              reg166 <= (reg164 | ($signed($unsigned($unsigned((8'hae)))) != ($signed($signed(reg157)) > reg163)));
              reg167 <= ($signed(((+(^~(8'hac))) ?
                  $unsigned(wire58[(1'h1):(1'h1)]) : $unsigned($signed(reg54)))) ^~ (&(((|reg54) ?
                      $signed((8'hbe)) : $signed(reg57)) ?
                  wire58 : $unsigned(wire11))));
              reg168 <= $unsigned(((+$signed((wire153 >= wire11))) ?
                  $unsigned(reg164) : ($unsigned(((8'hba) ? wire6 : wire53)) ?
                      reg166 : {wire11[(5'h15):(4'hf)]})));
            end
        end
      else
        begin
          reg158 <= {wire58,
              ($unsigned($unsigned($signed(wire76))) >> $unsigned((wire76[(4'ha):(3'h6)] << {wire6})))};
        end
    end
  always
    @(posedge clk) begin
      reg169 <= (8'hbc);
    end
  module13 #() modinst171 (wire170, clk, reg167, wire12, wire76, reg165, wire151);
  assign wire172 = wire9;
endmodule

module module135
#(parameter param146 = (+(~^{(|{(8'ha0), (8'ha4)})})))
(y, clk, wire139, wire138, wire137, wire136);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire139;
  input wire [(4'hd):(1'h0)] wire138;
  input wire [(3'h6):(1'h0)] wire137;
  input wire [(5'h15):(1'h0)] wire136;
  wire [(2'h2):(1'h0)] wire145;
  wire signed [(4'hb):(1'h0)] wire144;
  wire [(4'hd):(1'h0)] wire143;
  wire [(4'ha):(1'h0)] wire142;
  wire [(3'h5):(1'h0)] wire141;
  wire signed [(5'h11):(1'h0)] wire140;
  assign y = {wire145, wire144, wire143, wire142, wire141, wire140, (1'h0)};
  assign wire140 = (^({{$unsigned(wire137), (wire138 == (8'hb4))},
                           (^~(wire136 < wire139))} ?
                       $signed(wire137[(2'h3):(1'h1)]) : wire136[(5'h11):(4'hc)]));
  assign wire141 = $signed((($unsigned((wire140 ?
                           (8'ha6) : wire140)) > wire140[(1'h1):(1'h0)]) ?
                       (((wire140 ? (8'h9e) : wire139) == wire138) ?
                           (!(wire139 || wire137)) : (((8'ha1) ?
                                   wire138 : wire137) ?
                               ((7'h44) >= wire136) : wire139[(1'h0):(1'h0)])) : (((&wire139) ?
                               $unsigned(wire138) : {wire136}) ?
                           ($signed(wire137) ?
                               $unsigned(wire136) : (wire138 <= (8'hb1))) : (((8'ha5) ?
                                   wire139 : wire136) ?
                               (|wire139) : $unsigned((8'haf))))));
  assign wire142 = wire137[(1'h1):(1'h1)];
  assign wire143 = (~|{wire138[(3'h6):(1'h0)]});
  assign wire144 = $unsigned($signed((({wire138} <<< wire143[(1'h1):(1'h0)]) ?
                       $unsigned(wire140) : ((8'h9c) ?
                           ((8'hb7) ?
                               wire142 : wire142) : $unsigned((8'ha5))))));
  assign wire145 = (wire136[(3'h6):(1'h0)] >> wire140[(3'h6):(3'h6)]);
endmodule

module module113  (y, clk, wire117, wire116, wire115, wire114);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire117;
  input wire signed [(3'h5):(1'h0)] wire116;
  input wire signed [(5'h12):(1'h0)] wire115;
  input wire signed [(5'h13):(1'h0)] wire114;
  wire [(3'h7):(1'h0)] wire132;
  wire signed [(3'h6):(1'h0)] wire131;
  wire signed [(3'h4):(1'h0)] wire130;
  wire [(5'h15):(1'h0)] wire129;
  wire [(4'ha):(1'h0)] wire128;
  wire signed [(3'h7):(1'h0)] wire127;
  wire signed [(5'h11):(1'h0)] wire126;
  wire [(2'h2):(1'h0)] wire124;
  wire [(5'h11):(1'h0)] wire123;
  wire [(2'h2):(1'h0)] wire122;
  wire signed [(5'h15):(1'h0)] wire121;
  wire [(4'hb):(1'h0)] wire120;
  wire [(5'h12):(1'h0)] wire119;
  wire signed [(4'hd):(1'h0)] wire118;
  reg signed [(3'h7):(1'h0)] reg125 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 reg125,
                 (1'h0)};
  assign wire118 = $signed(wire115[(4'hb):(2'h2)]);
  assign wire119 = wire118[(4'hc):(3'h4)];
  assign wire120 = $unsigned($signed(($unsigned($signed(wire119)) + wire118)));
  assign wire121 = $unsigned(wire114[(4'h9):(3'h4)]);
  assign wire122 = (wire121[(5'h11):(4'hf)] ?
                       (wire119 ?
                           wire117[(3'h6):(3'h5)] : (8'hbe)) : $signed($unsigned(wire116)));
  assign wire123 = ($unsigned(((~|{wire120, wire122}) ?
                           $unsigned(wire122[(2'h2):(1'h0)]) : $signed(wire117[(3'h6):(3'h4)]))) ?
                       (+$unsigned(wire121[(4'hb):(4'ha)])) : wire120);
  assign wire124 = wire120;
  always
    @(posedge clk) begin
      reg125 <= {{wire120}};
    end
  assign wire126 = $unsigned(wire114[(4'hb):(1'h1)]);
  assign wire127 = wire117[(4'ha):(2'h3)];
  assign wire128 = wire127[(3'h5):(1'h1)];
  assign wire129 = $signed($signed(($unsigned(wire126[(3'h6):(3'h6)]) + (|$signed((8'hb4))))));
  assign wire130 = $signed((^(($signed(wire114) >= wire118[(3'h4):(2'h3)]) ?
                       $signed($signed(wire123)) : $unsigned((~&wire120)))));
  assign wire131 = wire127;
  assign wire132 = $unsigned((-({$unsigned(wire122)} || wire116)));
endmodule

module module81
#(parameter param110 = {((~|(+((8'haf) >> (7'h40)))) ? ((~|(~^(8'hbf))) <<< (((8'hbe) ? (8'ha6) : (8'hb0)) ? ((8'haf) <<< (8'h9f)) : {(8'h9e)})) : {(((8'ha5) || (8'ha9)) + (~^(8'ha4))), ((+(8'had)) == ((8'h9c) || (8'hb6)))}), ((~&(~&((8'hbd) << (8'ha9)))) ? (&(((8'hb1) * (7'h40)) >= (-(8'hae)))) : (^({(8'ha0)} ^ ((8'ha8) ? (8'h9c) : (8'ha4)))))})
(y, clk, wire86, wire85, wire84, wire83, wire82);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire86;
  input wire [(5'h10):(1'h0)] wire85;
  input wire signed [(4'hb):(1'h0)] wire84;
  input wire signed [(4'hc):(1'h0)] wire83;
  input wire [(5'h15):(1'h0)] wire82;
  wire signed [(5'h10):(1'h0)] wire109;
  wire signed [(5'h11):(1'h0)] wire107;
  wire [(3'h7):(1'h0)] wire106;
  wire signed [(3'h6):(1'h0)] wire105;
  wire signed [(4'hb):(1'h0)] wire104;
  wire [(4'hb):(1'h0)] wire103;
  wire [(3'h7):(1'h0)] wire102;
  wire [(5'h13):(1'h0)] wire101;
  wire [(5'h14):(1'h0)] wire100;
  wire signed [(5'h14):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire94;
  wire [(4'ha):(1'h0)] wire93;
  wire signed [(2'h3):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire87;
  reg signed [(4'hb):(1'h0)] reg108 = (1'h0);
  reg [(5'h14):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(5'h14):(1'h0)] reg89 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  assign y = {wire109,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire87,
                 reg108,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire87 = ({($unsigned((wire83 ? wire86 : wire85)) ?
                              wire86 : wire84[(4'h9):(1'h0)])} ?
                      ($signed($unsigned({wire83})) >>> wire86) : wire83);
  always
    @(posedge clk) begin
      reg88 <= wire86[(3'h7):(1'h1)];
      reg89 <= (8'hb5);
      reg90 <= wire86[(4'h9):(2'h2)];
      reg91 <= reg88;
    end
  assign wire92 = (&(reg88[(4'h9):(3'h6)] ?
                      {((wire85 >>> reg89) > (^reg91)),
                          ((wire85 ?
                              wire85 : wire87) > $signed(wire85))} : ($signed(wire86) ?
                          wire86 : (~&{reg90}))));
  assign wire93 = (~&($unsigned({{wire85,
                          wire92}}) + {$unsigned($unsigned((8'hb6)))}));
  assign wire94 = $unsigned(wire92);
  assign wire95 = ((wire85 ? wire84 : (^$unsigned((wire85 != wire82)))) ?
                      (8'haa) : (~^wire86[(3'h5):(1'h1)]));
  always
    @(posedge clk) begin
      reg96 <= wire94;
      reg97 <= ((|(~&{((8'h9d) + wire85)})) ^~ {{wire94[(4'hf):(4'hd)],
              reg91[(1'h0):(1'h0)]},
          $unsigned((!reg90[(5'h10):(3'h7)]))});
      reg98 <= reg96[(4'hd):(3'h6)];
      reg99 <= $signed(((-((wire92 ? wire95 : wire94) & ((8'hb9) ?
              wire92 : wire92))) ?
          wire95[(4'hd):(1'h0)] : (|{reg97[(4'h8):(3'h4)],
              (wire92 != reg91)})));
    end
  assign wire100 = $unsigned(wire83);
  assign wire101 = (((~|({reg89, wire87} >>> $unsigned(wire100))) ^~ (({reg91} ?
                       wire87 : $unsigned(wire93)) && $signed((wire95 ?
                       reg88 : (8'h9c))))) ~^ $unsigned($unsigned($signed((~reg89)))));
  assign wire102 = (reg88 ? wire85 : reg90[(4'hd):(3'h4)]);
  assign wire103 = $unsigned((7'h42));
  assign wire104 = $signed({wire102[(2'h2):(2'h2)]});
  assign wire105 = $unsigned($unsigned($signed($unsigned({wire94}))));
  assign wire106 = wire83;
  assign wire107 = (($unsigned((reg89 <<< (reg89 ?
                       wire86 : (7'h42)))) + $unsigned($unsigned(wire105[(1'h0):(1'h0)]))) && (({(reg89 ?
                               wire102 : wire106),
                           reg90} <<< $unsigned(wire100[(1'h1):(1'h0)])) ?
                       ({$signed(wire86),
                           wire85} ^~ ($signed(reg91) << {reg91})) : wire85));
  always
    @(posedge clk) begin
      reg108 <= $signed(reg99);
    end
  assign wire109 = (~reg90[(4'hf):(4'h9)]);
endmodule

module module59
#(parameter param74 = (((((|(8'ha7)) ? ((8'ha3) + (8'hb7)) : ((8'h9e) ? (8'hb2) : (8'had))) && ((&(8'hb2)) - ((8'hb3) ^ (8'ha0)))) < ((~|((8'hb3) ? (8'hb9) : (8'ha5))) == (((8'ha4) ? (8'h9d) : (8'hac)) ? ((8'ha5) ? (7'h42) : (8'ha1)) : (&(8'hb0))))) ? ((~(~(^~(8'hac)))) ? (|(((8'ha0) && (8'ha3)) << ((8'hb7) ? (8'hb0) : (8'hbf)))) : (({(8'hbf), (8'haa)} ? ((8'hae) ? (8'ha8) : (8'hb7)) : (8'ha7)) ^~ (((8'ha4) ? (8'hba) : (8'hab)) ? ((7'h43) << (8'hac)) : {(8'ha9)}))) : ((((^(8'hb7)) <<< ((8'hb0) ? (8'hb1) : (8'ha8))) ? (((8'hb3) ? (8'hbf) : (8'hbe)) ? ((8'ha9) ? (8'haf) : (8'hb3)) : (|(8'ha2))) : (((8'hb8) ? (8'hbf) : (8'hb0)) < (|(8'hb5)))) ? {((~&(8'had)) ^~ (~&(8'hb1))), (~^((8'h9c) ? (8'hb6) : (8'hb7)))} : ((~|((8'hbd) ? (8'h9f) : (8'hb0))) <= ({(8'hb2)} <= ((8'ha2) ? (8'ha4) : (7'h42)))))), 
parameter param75 = (!param74))
(y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire63;
  input wire [(4'hb):(1'h0)] wire62;
  input wire [(5'h14):(1'h0)] wire61;
  input wire signed [(3'h4):(1'h0)] wire60;
  wire signed [(4'ha):(1'h0)] wire73;
  wire signed [(5'h14):(1'h0)] wire72;
  wire signed [(4'ha):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire64;
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(4'h8):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire64,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire64 = ((wire63[(3'h5):(2'h3)] <<< (~&{(+wire63)})) & wire63);
  always
    @(posedge clk) begin
      reg65 <= ({wire63[(4'h8):(1'h0)]} ?
          (|(wire63[(2'h3):(2'h2)] ?
              {(wire64 ? wire63 : wire60), $signed(wire60)} : ({(8'ha8),
                  wire62} + wire64))) : $signed(($unsigned(wire62[(3'h5):(1'h0)]) + ((!wire62) < {(8'hb5)}))));
      reg66 <= (wire63[(3'h7):(3'h5)] ?
          $signed(wire64[(2'h3):(2'h3)]) : wire62[(3'h5):(2'h3)]);
      reg67 <= ({$unsigned(((reg66 << wire60) ?
              (reg66 ? reg66 : wire63) : wire64[(4'ha):(4'h8)])),
          (!$unsigned($unsigned(wire62)))} < {(^($signed(reg65) ?
              (reg65 >= wire62) : {wire64, reg65})),
          (reg66[(2'h2):(1'h0)] != $signed((wire61 ? wire62 : (8'hb5))))});
      reg68 <= reg65[(4'hc):(2'h2)];
    end
  assign wire69 = (&(reg67[(2'h2):(2'h2)] ?
                      (($signed(reg65) << $unsigned(reg65)) ?
                          wire63[(3'h6):(3'h4)] : $signed($signed(wire64))) : (reg65 < (~|(wire61 ^ reg67)))));
  assign wire70 = ($unsigned({((reg68 ? (8'h9d) : (7'h41)) ?
                          (~|wire64) : (wire69 ?
                              wire61 : wire61))}) != $signed((&wire63[(3'h6):(1'h0)])));
  assign wire71 = ($unsigned($signed(((|wire64) == (wire61 ?
                      wire62 : reg67)))) == ($unsigned($unsigned($unsigned(reg67))) ?
                      (!((wire60 || reg65) << $signed(wire63))) : ($unsigned($signed(wire70)) ^ (wire63 >> wire62))));
  assign wire72 = (($signed(wire71[(4'ha):(3'h7)]) ?
                          reg65 : ($signed($signed(wire69)) ?
                              wire64 : (wire70 ?
                                  (~^(8'hbf)) : (wire60 ? reg68 : wire60)))) ?
                      (&$unsigned(wire69)) : $unsigned(reg65));
  assign wire73 = wire63[(3'h7):(3'h6)];
endmodule

module module13
#(parameter param49 = (8'hab), 
parameter param50 = param49)
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h16e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire18;
  input wire [(4'hd):(1'h0)] wire17;
  input wire signed [(3'h6):(1'h0)] wire16;
  input wire signed [(4'ha):(1'h0)] wire15;
  input wire signed [(4'h9):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire26;
  wire [(3'h4):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  wire signed [(2'h3):(1'h0)] wire19;
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire19 = $signed($signed($unsigned((^(~|wire16)))));
  assign wire20 = $unsigned(wire16);
  assign wire21 = wire18[(1'h0):(1'h0)];
  assign wire22 = wire19[(2'h3):(1'h1)];
  assign wire23 = $signed(wire21[(2'h3):(2'h3)]);
  assign wire24 = wire22[(4'ha):(2'h3)];
  assign wire25 = wire14[(4'h9):(4'h8)];
  assign wire26 = $signed((({((8'hb7) ^ wire16), $unsigned(wire20)} ?
                      wire21 : (~&{wire25, (8'hb4)})) + wire23[(4'ha):(2'h3)]));
  assign wire27 = ((wire23[(3'h5):(2'h2)] ?
                      $signed(((8'hb5) * $signed(wire24))) : (+wire15[(3'h5):(3'h4)])) || ($signed(wire24) >> {(wire25[(1'h0):(1'h0)] ?
                          wire24[(4'ha):(3'h4)] : (7'h40)),
                      (^~(wire26 * wire24))}));
  assign wire28 = (!(wire16 ?
                      (~wire27[(2'h2):(2'h2)]) : wire17[(3'h6):(2'h2)]));
  always
    @(posedge clk) begin
      reg29 <= {$signed($unsigned(wire23[(5'h14):(4'ha)])),
          (($signed($signed((8'hbd))) ~^ wire17[(3'h6):(1'h0)]) << $signed((~|(~&wire25))))};
      if (wire24)
        begin
          reg30 <= wire15;
        end
      else
        begin
          reg30 <= ($unsigned($unsigned((^~reg30[(1'h1):(1'h1)]))) < $signed($signed((~^wire27))));
          reg31 <= (^~$unsigned($signed(((wire23 == wire27) ?
              $unsigned(wire23) : (wire22 >> (8'h9d))))));
        end
    end
  assign wire32 = (~^(|$unsigned((8'ha9))));
  assign wire33 = (8'hbc);
  assign wire34 = wire20;
  assign wire35 = {($unsigned($signed($unsigned(reg31))) ?
                          ({((8'hbf) ? wire21 : wire23), $unsigned((8'hbc))} ?
                              (7'h41) : (wire26[(1'h1):(1'h1)] ?
                                  {wire17,
                                      wire32} : $signed(wire33))) : wire15[(4'h9):(4'h8)]),
                      ({wire16[(3'h4):(2'h3)],
                          $unsigned((wire28 ?
                              (8'ha1) : wire26))} & $signed((8'haa)))};
  always
    @(posedge clk) begin
      if (wire20)
        begin
          if ($signed(wire33[(2'h2):(1'h0)]))
            begin
              reg36 <= (8'hb1);
              reg37 <= $signed(((+(|(wire25 ^ wire18))) >>> {wire35[(3'h5):(1'h1)]}));
              reg38 <= {wire18};
              reg39 <= (wire22 ?
                  (wire16 ?
                      (reg29[(4'hd):(4'h8)] ?
                          ($signed(wire19) ?
                              $signed((8'hb9)) : {wire28}) : wire17[(2'h3):(1'h1)]) : (^(~|(wire26 ?
                          wire14 : wire28)))) : (~wire19[(2'h2):(1'h0)]));
              reg40 <= (^~(({(wire15 ? reg37 : wire27),
                      wire33[(1'h1):(1'h0)]} == $signed((reg36 ?
                      reg37 : wire26))) ?
                  $signed(wire18[(3'h4):(2'h2)]) : ($signed((&wire27)) | $unsigned({reg38,
                      (8'hb7)}))));
            end
          else
            begin
              reg36 <= ({wire15[(2'h2):(2'h2)]} ?
                  $unsigned(wire21[(1'h0):(1'h0)]) : $signed(wire18[(3'h4):(2'h3)]));
              reg37 <= reg37;
              reg38 <= {(wire35 | (((!wire25) ? reg36 : {(7'h42)}) ?
                      wire25[(2'h3):(2'h3)] : $unsigned({wire32}))),
                  (+(+wire26[(4'h8):(3'h4)]))};
            end
          reg41 <= ((reg40[(3'h7):(2'h3)] ?
                  ($unsigned(wire18) ?
                      wire21 : $signed(wire22[(4'hc):(3'h5)])) : (8'hbc)) ?
              ((wire35[(2'h3):(1'h1)] >>> reg40) ^ wire16) : wire23[(5'h10):(2'h3)]);
        end
      else
        begin
          if (reg38[(5'h15):(4'h9)])
            begin
              reg36 <= $signed(wire33);
              reg37 <= (^~(($unsigned(reg37) || {((7'h43) || wire24)}) ~^ wire33[(1'h0):(1'h0)]));
              reg38 <= {$signed(($signed(wire15) > reg31)),
                  $unsigned((($signed(wire22) != $signed(reg37)) ?
                      ($signed(wire18) < (reg38 ?
                          wire32 : wire26)) : (^$unsigned(wire16))))};
              reg39 <= {(&$unsigned((~^reg30[(2'h2):(2'h2)])))};
              reg40 <= (($signed(reg31[(4'hd):(2'h3)]) ?
                  {reg29[(3'h5):(2'h2)], wire22} : (($unsigned((8'ha5)) ?
                      {reg36,
                          reg29} : (wire33 <<< wire32)) ^ wire27[(2'h2):(1'h1)])) <<< $unsigned((-(wire20 ?
                  wire33 : wire15[(3'h5):(3'h5)]))));
            end
          else
            begin
              reg36 <= (reg36 ^~ (+($signed($unsigned(wire22)) ?
                  ($unsigned(wire23) ?
                      (reg38 || reg39) : (^wire28)) : wire24)));
              reg37 <= $signed({wire35});
              reg38 <= (^~($signed($signed($unsigned(wire22))) <<< wire15[(4'ha):(4'h9)]));
              reg39 <= reg30;
            end
          if ({(($signed((wire26 || reg30)) != (((8'hb8) * (8'hb3)) ?
                      (~reg39) : $signed(wire28))) ?
                  wire22 : $signed((((8'hbe) > reg38) | $signed(wire26))))})
            begin
              reg41 <= wire23;
            end
          else
            begin
              reg41 <= $signed(({wire16,
                  $unsigned(wire34[(3'h4):(2'h2)])} + $unsigned((reg30[(3'h7):(3'h5)] ?
                  $unsigned((8'haf)) : ((8'ha0) + wire15)))));
              reg42 <= ((($unsigned($unsigned((8'ha5))) ?
                          wire23 : $unsigned(reg40[(4'h9):(3'h7)])) ?
                      $signed($signed((reg36 || wire26))) : {(&(~|wire24)),
                          $unsigned((wire20 ? (8'hb8) : wire21))}) ?
                  wire27 : ($unsigned((~|(7'h43))) ?
                      wire21[(2'h2):(1'h1)] : (&wire22[(3'h6):(1'h0)])));
              reg43 <= $signed((($unsigned((~&reg38)) + wire28[(2'h3):(2'h2)]) ?
                  ({{wire23}, $unsigned(wire22)} ?
                      $signed(reg42) : ((wire14 ?
                          (8'ha0) : reg42) >> $signed(wire18))) : {$signed($unsigned(wire32))}));
              reg44 <= (^~$signed(wire25[(2'h3):(1'h1)]));
              reg45 <= (^wire15);
            end
        end
    end
  assign wire46 = wire23;
  assign wire47 = reg29[(3'h6):(3'h5)];
  assign wire48 = reg44;
endmodule
