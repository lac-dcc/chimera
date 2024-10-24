module top
#(parameter param174 = (+(~&(!{((8'hb4) || (7'h43))}))), 
parameter param175 = param174)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire173;
  wire [(2'h2):(1'h0)] wire172;
  wire [(4'hd):(1'h0)] wire171;
  wire [(5'h15):(1'h0)] wire164;
  reg [(3'h6):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg168 = (1'h0);
  reg [(4'h8):(1'h0)] reg167 = (1'h0);
  reg [(4'h9):(1'h0)] reg166 = (1'h0);
  assign y = {wire173,
                 wire172,
                 wire171,
                 wire164,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 (1'h0)};
  module5 #() modinst165 (wire164, clk, wire4, wire1, wire0, wire3, wire2);
  always
    @(posedge clk) begin
      reg166 <= (({($unsigned(wire0) ? {(8'hb2)} : $unsigned(wire1))} ?
              (wire1[(2'h3):(1'h0)] > (^~wire3[(1'h1):(1'h0)])) : (~|(wire3 ?
                  wire2 : $unsigned(wire4)))) ?
          $signed(wire3) : ((((wire2 && wire2) ?
              wire0 : wire3) ^~ (~|(wire3 == wire2))) >> wire4));
      reg167 <= ($signed(wire164) ?
          wire0 : (((8'ha6) != $unsigned($unsigned(wire164))) <<< wire2));
      reg168 <= wire2[(2'h3):(2'h2)];
      reg169 <= ($unsigned($unsigned((8'h9c))) + $unsigned($unsigned($signed($signed(reg167)))));
      reg170 <= wire3[(4'ha):(1'h0)];
    end
  assign wire171 = $unsigned($signed(((&$signed(wire2)) ?
                       ($unsigned(reg166) >> $unsigned((8'h9e))) : ((wire4 | reg167) ?
                           wire4 : {wire1, wire1}))));
  assign wire172 = {($unsigned(reg167[(3'h6):(2'h3)]) ?
                           (reg168 >= wire171[(3'h7):(3'h6)]) : (((^~reg170) ?
                               (|reg170) : $unsigned(reg169)) | $unsigned((!(8'hbc))))),
                       $unsigned((~$unsigned((wire164 > wire1))))};
  assign wire173 = (~wire171);
endmodule

module module5
#(parameter param162 = ((((8'hb0) && ((&(8'ha4)) ? ((8'hab) ? (8'hb5) : (8'hb3)) : (~|(8'hb8)))) & (({(8'hbd)} != ((8'hb8) ? (7'h44) : (8'hbd))) ^ ((~(8'ha2)) ? {(8'hac)} : ((7'h40) ? (7'h44) : (7'h40))))) ^~ ((^(((8'hbe) - (8'had)) <= ((8'h9c) * (8'ha1)))) ? (((~|(8'ha3)) ^~ ((8'hbb) ^~ (8'h9d))) ? (((7'h41) ? (8'ha9) : (8'h9c)) ^ {(8'ha4), (8'hbd)}) : (((7'h41) ? (8'ha1) : (8'hbe)) ^~ ((8'hb6) | (8'hac)))) : {(&((8'hba) ? (8'h9f) : (7'h43)))})), 
parameter param163 = (~^(param162 ? (+(~|(~&(8'hba)))) : param162)))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire6;
  input wire [(5'h15):(1'h0)] wire7;
  input wire [(4'h9):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire161;
  wire signed [(3'h6):(1'h0)] wire160;
  wire signed [(4'hd):(1'h0)] wire159;
  wire signed [(2'h3):(1'h0)] wire158;
  wire signed [(4'hf):(1'h0)] wire157;
  wire signed [(4'hb):(1'h0)] wire156;
  wire signed [(5'h11):(1'h0)] wire154;
  wire [(2'h3):(1'h0)] wire104;
  wire [(5'h10):(1'h0)] wire103;
  wire signed [(3'h6):(1'h0)] wire102;
  wire [(4'hd):(1'h0)] wire101;
  wire signed [(4'hb):(1'h0)] wire99;
  wire [(2'h2):(1'h0)] wire98;
  wire signed [(2'h3):(1'h0)] wire97;
  wire [(4'he):(1'h0)] wire95;
  wire signed [(5'h13):(1'h0)] wire76;
  wire [(4'hb):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire74;
  reg signed [(4'hd):(1'h0)] reg100 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire154,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire76,
                 wire11,
                 wire35,
                 wire74,
                 reg100,
                 (1'h0)};
  assign wire11 = (-$signed({((wire8 || wire8) ?
                          (wire7 ? wire10 : wire9) : (wire9 ?
                              wire9 : wire9))}));
  module12 #() modinst36 (.wire16(wire7), .wire14(wire9), .clk(clk), .wire13(wire8), .wire15(wire10), .y(wire35));
  module37 #() modinst75 (wire74, clk, wire9, wire8, wire35, wire7, wire10);
  assign wire76 = (+wire10);
  module77 #() modinst96 (.clk(clk), .wire80(wire10), .wire78(wire35), .y(wire95), .wire81(wire9), .wire79(wire6));
  assign wire97 = $unsigned(((~^$unsigned(wire8)) ?
                      (8'ha2) : {(wire74[(1'h1):(1'h1)] ?
                              (wire95 ? wire9 : wire76) : $signed(wire76)),
                          $unsigned((&wire35))}));
  assign wire98 = ((($unsigned((wire8 ? wire97 : wire6)) >> (wire9 ?
                      wire6[(5'h12):(4'hf)] : wire10)) != $signed(((wire35 ?
                          wire7 : wire10) ?
                      $signed(wire35) : $signed(wire35)))) << $unsigned($signed((|$unsigned(wire74)))));
  assign wire99 = $signed(wire97[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg100 <= ((wire9[(5'h11):(4'hf)] ?
              $unsigned(wire10) : ((wire6 << $unsigned(wire76)) ?
                  ((^~wire74) & (~wire35)) : ($signed(wire9) < (wire8 ~^ wire97)))) ?
          (~^((|(!wire11)) * wire8)) : (({$unsigned(wire95),
              wire11} >> wire98) || ({$signed(wire99),
              (~^(7'h44))} + $signed($unsigned(wire6)))));
    end
  assign wire101 = wire9[(1'h1):(1'h1)];
  assign wire102 = wire35[(2'h2):(1'h0)];
  assign wire103 = $unsigned(wire101);
  assign wire104 = {$unsigned(((+(wire102 ?
                           wire101 : wire9)) <= $unsigned((~reg100))))};
  module105 #() modinst155 (wire154, clk, wire7, wire35, wire99, reg100, wire8);
  assign wire156 = $signed((($unsigned({(8'ha5),
                       wire76}) * wire98[(1'h0):(1'h0)]) - {(~^wire11),
                       ((wire74 ? wire98 : wire35) ?
                           (+(8'hb5)) : (wire9 ? wire76 : wire9))}));
  assign wire157 = (($signed((!(^~wire76))) == {$unsigned((wire101 ?
                           wire104 : wire76)),
                       wire104[(1'h0):(1'h0)]}) && {$signed((-(+wire95))),
                       wire10[(4'hb):(3'h4)]});
  assign wire158 = ($signed($unsigned(wire98[(1'h1):(1'h1)])) - ($signed($unsigned((wire102 == (8'ha7)))) + (!(~^(~|wire102)))));
  assign wire159 = $unsigned({$unsigned(wire154[(4'hb):(1'h1)])});
  assign wire160 = ($signed({$signed($unsigned(wire102)),
                       {$signed(wire97),
                           wire76}}) <= ($unsigned($signed($signed(wire156))) && (!((wire7 << wire157) ?
                       (wire101 ? (8'hae) : (8'hb6)) : (wire101 ?
                           wire74 : wire154)))));
  assign wire161 = (({wire157} ^ (($unsigned(wire158) <<< (wire102 ?
                           wire101 : wire99)) != (wire103 ? wire9 : wire154))) ?
                       {$unsigned((&(wire76 ?
                               wire159 : wire154)))} : (wire101[(4'h9):(3'h6)] == {{$signed((8'haf))},
                           $unsigned(((8'h9e) <<< wire160))}));
endmodule

module module105  (y, clk, wire110, wire109, wire108, wire107, wire106);
  output wire [(32'h1e2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire110;
  input wire signed [(2'h3):(1'h0)] wire109;
  input wire [(4'hb):(1'h0)] wire108;
  input wire [(3'h4):(1'h0)] wire107;
  input wire [(3'h7):(1'h0)] wire106;
  wire [(5'h11):(1'h0)] wire153;
  wire [(5'h13):(1'h0)] wire152;
  wire [(2'h3):(1'h0)] wire151;
  wire [(5'h13):(1'h0)] wire150;
  wire [(4'hf):(1'h0)] wire149;
  wire signed [(3'h7):(1'h0)] wire148;
  wire signed [(4'hf):(1'h0)] wire147;
  wire signed [(3'h4):(1'h0)] wire142;
  wire signed [(4'hb):(1'h0)] wire141;
  wire [(2'h2):(1'h0)] wire120;
  wire signed [(3'h6):(1'h0)] wire119;
  wire signed [(5'h10):(1'h0)] wire118;
  wire [(5'h10):(1'h0)] wire117;
  wire signed [(2'h3):(1'h0)] wire116;
  wire [(3'h5):(1'h0)] wire115;
  wire signed [(5'h10):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire113;
  wire [(4'hf):(1'h0)] wire112;
  wire signed [(5'h15):(1'h0)] wire111;
  reg [(4'h8):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg145 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg144 = (1'h0);
  reg [(3'h6):(1'h0)] reg143 = (1'h0);
  reg [(5'h14):(1'h0)] reg140 = (1'h0);
  reg [(4'ha):(1'h0)] reg139 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg138 = (1'h0);
  reg [(3'h6):(1'h0)] reg137 = (1'h0);
  reg [(4'hc):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg135 = (1'h0);
  reg [(4'hd):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg132 = (1'h0);
  reg [(4'hc):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg130 = (1'h0);
  reg [(4'ha):(1'h0)] reg129 = (1'h0);
  reg [(4'hc):(1'h0)] reg128 = (1'h0);
  reg [(4'hb):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg126 = (1'h0);
  reg [(4'he):(1'h0)] reg125 = (1'h0);
  reg [(4'hc):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg123 = (1'h0);
  reg [(5'h15):(1'h0)] reg122 = (1'h0);
  reg [(4'hd):(1'h0)] reg121 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire142,
                 wire141,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg140,
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
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 (1'h0)};
  assign wire111 = wire109;
  assign wire112 = wire106;
  assign wire113 = $signed(((~$unsigned({(8'hb9),
                       (8'hb8)})) > $signed(wire111)));
  assign wire114 = $signed(($signed(((~|(8'ha2)) ^~ wire106)) >>> wire111[(5'h10):(1'h1)]));
  assign wire115 = wire110;
  assign wire116 = (~^wire111);
  assign wire117 = $unsigned(($signed($unsigned((wire115 ?
                       wire113 : wire113))) > wire107));
  assign wire118 = wire106;
  assign wire119 = wire111[(5'h13):(3'h6)];
  assign wire120 = (((&$unsigned(wire116)) ?
                       (+((~^wire106) < (+wire106))) : (!$unsigned($unsigned((8'ha8))))) & ((&((8'hbc) - $signed(wire115))) ?
                       wire115[(2'h2):(2'h2)] : $unsigned(({(8'hbc), wire110} ?
                           wire107 : wire116))));
  always
    @(posedge clk) begin
      reg121 <= (^~wire106[(2'h2):(1'h1)]);
      if ((~&(8'hb9)))
        begin
          reg122 <= $signed(((($signed(wire112) ?
                  $unsigned(wire106) : $signed((8'ha0))) ?
              ($unsigned(wire106) ~^ $unsigned(wire111)) : $unsigned((wire111 ?
                  wire115 : wire114))) >= $unsigned($signed(reg121[(4'h9):(3'h5)]))));
          reg123 <= ($unsigned($signed({((8'ha5) ? wire110 : (8'ha5))})) ?
              ({(^wire119), wire118[(3'h7):(3'h7)]} ?
                  wire111[(4'ha):(4'ha)] : ($signed(wire106) ?
                      (reg121[(3'h5):(3'h5)] ?
                          (wire113 ?
                              wire108 : wire114) : $signed((8'hb3))) : ($signed(reg121) >> wire114[(2'h2):(1'h0)]))) : ($signed($unsigned({reg121})) < $signed((~$unsigned(wire120)))));
          reg124 <= {(~{(+wire107)}),
              ((((wire117 ^ (8'h9d)) ? $unsigned(wire117) : wire117) ?
                  wire111 : wire118[(2'h3):(2'h3)]) >= ($unsigned((~|wire106)) != wire117[(5'h10):(4'hb)]))};
          if (((8'hb1) ? {wire116[(1'h0):(1'h0)]} : wire106))
            begin
              reg125 <= ((~|reg122[(5'h10):(4'hf)]) ?
                  ($signed(wire120[(1'h0):(1'h0)]) || wire117) : ({$signed($signed(wire118))} & $signed({$unsigned(wire115)})));
            end
          else
            begin
              reg125 <= wire118[(3'h5):(1'h0)];
              reg126 <= {reg124};
              reg127 <= ((~&(~|reg125[(4'hb):(3'h6)])) ?
                  ($signed(wire112[(4'h8):(1'h0)]) ~^ wire109[(1'h0):(1'h0)]) : (wire118[(4'he):(2'h2)] ?
                      $signed(wire109[(1'h0):(1'h0)]) : (^~wire107)));
              reg128 <= reg125;
            end
          reg129 <= wire106[(2'h3):(1'h0)];
        end
      else
        begin
          reg122 <= $signed(reg125[(4'h8):(1'h1)]);
          reg123 <= reg129[(2'h3):(1'h0)];
        end
      if ($signed(reg127))
        begin
          if (wire114)
            begin
              reg130 <= wire107;
            end
          else
            begin
              reg130 <= (~&(-wire109));
            end
          reg131 <= wire115;
          if (reg123)
            begin
              reg132 <= ($signed(reg129[(2'h2):(1'h0)]) ?
                  reg122[(4'hb):(3'h6)] : $signed((&{(reg129 >= wire115),
                      $unsigned(wire113)})));
              reg133 <= (8'hb6);
              reg134 <= $signed($unsigned(wire106[(1'h0):(1'h0)]));
              reg135 <= (~|$signed((wire116[(1'h0):(1'h0)] == wire118)));
              reg136 <= $unsigned((wire111 ?
                  reg124 : (((reg128 << (7'h43)) >>> $unsigned(wire115)) <= ({(8'ha2),
                          reg134} ?
                      wire115 : (~reg131)))));
            end
          else
            begin
              reg132 <= (wire106[(2'h3):(1'h0)] > wire107);
              reg133 <= ((&$unsigned(wire107[(1'h0):(1'h0)])) ?
                  wire110[(5'h14):(4'hf)] : reg134[(2'h2):(1'h1)]);
              reg134 <= reg127;
              reg135 <= $signed(reg125);
              reg136 <= $unsigned(((wire106 != wire111) ?
                  (-wire112[(4'he):(3'h5)]) : reg127[(2'h3):(1'h0)]));
            end
          reg137 <= wire114[(4'h9):(1'h1)];
        end
      else
        begin
          reg130 <= {wire110, $signed((^$unsigned($signed(wire117))))};
          if ((~|reg130[(3'h4):(2'h3)]))
            begin
              reg131 <= (8'hb2);
              reg132 <= ($unsigned((^~{(~|reg135)})) >> wire113[(2'h3):(1'h1)]);
              reg133 <= wire113[(1'h0):(1'h0)];
            end
          else
            begin
              reg131 <= wire120;
              reg132 <= wire116[(1'h1):(1'h1)];
              reg133 <= {(~|((~$signed(wire106)) != {(wire116 == reg133),
                      $signed(reg126)})),
                  ({$unsigned((wire117 - reg125)),
                          $unsigned((reg131 ? reg124 : (8'hbf)))} ?
                      wire106[(3'h4):(3'h4)] : $signed(wire106))};
              reg134 <= $unsigned((|(wire116[(1'h0):(1'h0)] | ($unsigned(wire113) ?
                  (reg131 == reg132) : $unsigned(wire111)))));
              reg135 <= reg127[(4'h8):(3'h7)];
            end
          if (reg131[(3'h7):(3'h7)])
            begin
              reg136 <= (8'hbb);
              reg137 <= $unsigned((($unsigned(wire111) ?
                      ((reg131 ?
                          wire109 : wire111) >= reg122[(2'h2):(1'h0)]) : $signed(reg135[(3'h6):(3'h6)])) ?
                  $signed((reg135[(2'h3):(2'h2)] <= (wire110 <= wire120))) : $unsigned(reg125[(3'h7):(3'h6)])));
              reg138 <= (8'hb6);
              reg139 <= {{reg135[(3'h4):(1'h0)]},
                  ($unsigned(reg130) ?
                      {((8'hb6) ?
                              {reg129} : (reg127 ?
                                  (7'h42) : wire107))} : $signed((~^(!(7'h40)))))};
              reg140 <= wire118;
            end
          else
            begin
              reg136 <= (($unsigned(reg132[(4'hb):(1'h1)]) == $unsigned((^~reg137[(3'h5):(1'h0)]))) ?
                  (((~&$signed(reg126)) ? reg122 : wire117) ?
                      $signed(({reg134, (7'h42)} ?
                          (wire109 ?
                              reg128 : reg126) : (|reg140))) : (&{(wire113 ?
                              reg124 : reg122),
                          (wire112 & reg137)})) : reg126);
              reg137 <= reg131[(1'h0):(1'h0)];
            end
        end
    end
  assign wire141 = (((8'ha9) ?
                       {wire108,
                           (&((8'ha0) ?
                               reg140 : (8'ha0)))} : ($signed((wire110 ?
                               wire106 : reg122)) ?
                           (~(wire115 ?
                               (8'h9f) : reg122)) : (!$signed(reg135)))) - reg139[(1'h0):(1'h0)]);
  assign wire142 = $unsigned(({{wire119[(2'h3):(2'h2)]}} ?
                       ((8'h9c) > ({reg122} ?
                           (reg139 ^ (8'hae)) : $unsigned(wire117))) : {$unsigned((wire118 <= (8'hb2)))}));
  always
    @(posedge clk) begin
      reg143 <= reg121;
      reg144 <= $unsigned(reg126[(3'h5):(2'h2)]);
      reg145 <= reg143[(2'h3):(2'h2)];
      reg146 <= reg131[(4'hb):(2'h3)];
    end
  assign wire147 = (~reg146);
  assign wire148 = (^~(8'hb1));
  assign wire149 = reg137[(3'h6):(2'h3)];
  assign wire150 = $signed(((^((^wire111) << reg146)) || (~&{(8'ha4)})));
  assign wire151 = (reg126[(5'h12):(4'hf)] ?
                       $unsigned(reg131[(4'hb):(3'h7)]) : wire120);
  assign wire152 = wire116;
  assign wire153 = wire110;
endmodule

module module77
#(parameter param93 = (({(((8'hbc) >= (7'h43)) | (&(8'hb8))), ({(8'hac), (8'h9f)} ? ((7'h44) ^~ (8'ha9)) : (~(8'ha3)))} | {((!(8'ha5)) <= ((8'hb6) >>> (8'hb5)))}) < (!((^~(!(8'hb6))) <= (~&((8'haf) ? (8'haf) : (8'ha1)))))), 
parameter param94 = (((~^(param93 ? {param93} : (param93 ? param93 : param93))) + (((^param93) ? ((8'h9c) ? (8'hb8) : param93) : (param93 ? param93 : param93)) * (-(param93 ? param93 : (8'hb4))))) >>> (-param93)))
(y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire81;
  input wire signed [(4'hd):(1'h0)] wire80;
  input wire signed [(4'hc):(1'h0)] wire79;
  input wire signed [(5'h10):(1'h0)] wire78;
  wire [(3'h5):(1'h0)] wire92;
  wire [(5'h12):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire85;
  wire signed [(4'he):(1'h0)] wire84;
  wire [(5'h14):(1'h0)] wire83;
  wire [(2'h2):(1'h0)] wire82;
  reg signed [(5'h11):(1'h0)] reg91 = (1'h0);
  reg [(4'hb):(1'h0)] reg90 = (1'h0);
  reg [(4'h8):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg88 = (1'h0);
  reg [(4'h9):(1'h0)] reg87 = (1'h0);
  assign y = {wire92,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 (1'h0)};
  assign wire82 = (^~(&$unsigned(wire80[(4'hd):(2'h3)])));
  assign wire83 = (+$signed(((((8'hbd) ? wire82 : (8'hac)) ?
                          $signed(wire80) : (wire78 & wire80)) ?
                      {wire82[(1'h0):(1'h0)], (wire81 >> wire81)} : {wire81,
                          (8'hb7)})));
  assign wire84 = wire78[(3'h5):(3'h5)];
  assign wire85 = (~^wire78[(2'h2):(2'h2)]);
  assign wire86 = ($signed((~&((wire83 ?
                      (8'h9f) : wire84) ^~ (wire84 <<< wire83)))) - {wire78[(1'h0):(1'h0)]});
  always
    @(posedge clk) begin
      reg87 <= $unsigned((((~wire80[(3'h5):(1'h0)]) ?
              wire78 : (~&(wire82 ? wire81 : (8'hb6)))) ?
          wire78[(3'h5):(2'h3)] : (wire85[(1'h0):(1'h0)] ?
              $unsigned($signed(wire78)) : wire86[(4'hd):(4'hd)])));
      reg88 <= $signed(((-$unsigned((~|wire82))) & ($signed($unsigned(wire85)) + (~|wire82[(2'h2):(1'h1)]))));
      reg89 <= $signed({$signed((~^(~&(8'hab)))), $unsigned(reg87)});
      reg90 <= reg89[(2'h2):(2'h2)];
      reg91 <= wire80;
    end
  assign wire92 = reg88[(2'h2):(2'h2)];
endmodule

module module37  (y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire42;
  input wire signed [(3'h7):(1'h0)] wire41;
  input wire [(2'h3):(1'h0)] wire40;
  input wire signed [(2'h3):(1'h0)] wire39;
  input wire [(2'h3):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire73;
  wire signed [(3'h4):(1'h0)] wire72;
  wire signed [(5'h14):(1'h0)] wire71;
  wire [(5'h11):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  wire [(4'hf):(1'h0)] wire66;
  wire signed [(4'hf):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire64;
  wire [(4'hd):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire61;
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  assign y = {wire73,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg43 <= (~^wire39[(1'h1):(1'h0)]);
      reg44 <= (wire42[(5'h11):(4'h9)] ? wire41[(2'h3):(1'h0)] : wire39);
      reg45 <= wire40[(1'h1):(1'h0)];
      if ({$signed(((8'ha6) <<< {$unsigned(wire41), ((8'hb3) + reg45)})),
          (wire42[(4'hb):(2'h3)] ?
              (+wire41) : (wire38[(1'h0):(1'h0)] < $signed(wire39[(2'h2):(2'h2)])))})
        begin
          if (($unsigned(((-reg43) ?
              reg43 : wire39[(1'h0):(1'h0)])) <<< $signed((8'ha9))))
            begin
              reg46 <= wire39[(2'h3):(1'h0)];
              reg47 <= $unsigned(wire40[(1'h0):(1'h0)]);
              reg48 <= reg43;
              reg49 <= (7'h42);
              reg50 <= wire42;
            end
          else
            begin
              reg46 <= (wire40 ?
                  (wire40 ^~ reg48[(3'h4):(1'h0)]) : (wire42 * $unsigned({((8'h9f) ?
                          wire41 : wire42)})));
              reg47 <= $unsigned(reg45[(1'h1):(1'h1)]);
              reg48 <= $signed(reg46[(1'h1):(1'h0)]);
            end
          if (($unsigned((((8'ha9) ?
                  (&(8'hbd)) : (reg44 ? wire38 : reg48)) + reg43)) ?
              (((8'h9e) || $unsigned($signed(wire40))) ?
                  (&$unsigned($signed(wire38))) : reg48) : $signed(($unsigned(wire38[(1'h1):(1'h1)]) >= $unsigned(((8'hb5) || reg45))))))
            begin
              reg51 <= reg47;
              reg52 <= (&$signed($unsigned((reg45 ? reg45 : reg43))));
              reg53 <= reg49[(1'h1):(1'h1)];
            end
          else
            begin
              reg51 <= reg49;
              reg52 <= (^~wire40);
              reg53 <= {wire42};
              reg54 <= {(!{$signed($unsigned(reg47)), reg52[(3'h6):(3'h5)]}),
                  ($unsigned($unsigned((wire41 ? reg53 : reg45))) ?
                      $unsigned(wire42[(4'hc):(4'ha)]) : $unsigned((~^(^(8'ha6)))))};
            end
          if ({(({$unsigned(reg43), (reg52 ^ wire42)} ?
                      $signed(reg53) : {(+reg53)}) ?
                  $signed(((reg49 ? wire40 : (8'hbb)) ?
                      reg54[(4'h9):(3'h6)] : (wire38 && reg47))) : $unsigned($signed($unsigned(wire40))))})
            begin
              reg55 <= wire41[(1'h0):(1'h0)];
              reg56 <= $signed(reg45);
              reg57 <= (~^($signed(reg50[(1'h0):(1'h0)]) || (reg56[(4'he):(4'ha)] ?
                  $unsigned(reg55) : reg56)));
              reg58 <= wire42;
              reg59 <= reg48[(2'h3):(2'h2)];
            end
          else
            begin
              reg55 <= (reg44[(3'h5):(1'h1)] - {{(reg58[(3'h5):(1'h0)] ?
                          (|reg50) : $unsigned((8'ha7)))}});
            end
        end
      else
        begin
          reg46 <= $unsigned((^$unsigned(reg54[(3'h5):(2'h3)])));
          reg47 <= ((wire38 ?
                  $signed($signed($signed(reg47))) : (!({(8'hb5)} ?
                      (!(8'h9e)) : reg56[(4'hc):(4'hc)]))) ?
              (($signed((reg54 ? (7'h40) : reg55)) ~^ ($signed(reg49) ?
                      reg44[(3'h7):(1'h1)] : {reg50, reg45})) ?
                  (reg52 <= $unsigned((^(8'hb5)))) : ($signed($signed(reg59)) <= (~wire39[(1'h1):(1'h0)]))) : ($signed($signed((&reg48))) ?
                  {(reg45[(3'h6):(1'h1)] >>> reg58),
                      $signed((reg48 << reg51))} : $unsigned(($unsigned(reg58) ?
                      $unsigned(reg54) : wire41[(2'h3):(1'h0)]))));
        end
      reg60 <= (reg59 < ($signed(reg58[(1'h0):(1'h0)]) | (+reg53)));
    end
  assign wire61 = $unsigned(((+($unsigned(reg55) ?
                          $unsigned(wire40) : $unsigned(reg45))) ?
                      (reg58 & (reg57 ?
                          (reg56 ?
                              wire42 : reg47) : $signed(reg51))) : $signed(reg54)));
  assign wire62 = $signed($unsigned($unsigned(reg53)));
  assign wire63 = (!((wire38 > $signed($signed(reg49))) * (($unsigned(reg51) ~^ wire42) * reg52)));
  assign wire64 = ($unsigned((^($signed((8'h9f)) ?
                      (reg55 || reg55) : {reg59,
                          reg44}))) ^~ $unsigned((7'h41)));
  assign wire65 = (reg58 ?
                      {($signed((reg56 ? reg50 : reg57)) >>> (&reg47)),
                          reg54} : reg58);
  assign wire66 = ($signed((8'hbf)) ?
                      (+$signed((wire39 ?
                          (wire63 ?
                              reg45 : wire40) : (~^reg53)))) : (($unsigned(wire65) <= wire38) > (({reg48,
                              reg48} ~^ $signed((7'h43))) ?
                          $signed({reg44, (8'hac)}) : reg53[(2'h3):(2'h3)])));
  assign wire67 = ($unsigned($unsigned({$signed(reg50)})) ?
                      ((wire61[(4'he):(1'h1)] ?
                          (^~reg52[(2'h3):(2'h2)]) : $signed((wire61 ?
                              reg57 : reg57))) != {(^~$unsigned(reg43))}) : ($signed(($signed((8'ha1)) & (reg59 ?
                              (8'hbb) : wire63))) ?
                          (+wire38) : (~|wire40)));
  assign wire68 = reg57[(2'h2):(1'h0)];
  assign wire69 = (reg55 * (|($unsigned((wire61 ? reg44 : wire40)) | {(8'hba),
                      (-reg52)})));
  assign wire70 = (reg55[(3'h5):(3'h5)] <<< wire65);
  assign wire71 = $unsigned((7'h43));
  assign wire72 = (8'h9f);
  assign wire73 = reg57;
endmodule

module module12
#(parameter param34 = ((-(8'ha9)) ^~ ((({(8'hbd), (8'hb2)} ? ((8'hb5) + (8'ha3)) : (-(8'hb7))) | ((~|(8'hb8)) | {(8'hb0), (8'hb5)})) > ((+((8'h9e) ? (8'h9d) : (8'had))) & (((8'hab) ? (8'ha9) : (8'hb6)) ? (~^(8'hbc)) : {(8'hae), (8'hb9)})))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire16;
  input wire [(4'h9):(1'h0)] wire15;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire [(2'h2):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire33;
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  assign y = {wire33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= wire13;
    end
  always
    @(posedge clk) begin
      reg18 <= $signed({$unsigned(((reg17 ? wire13 : (8'ha4)) ?
              (reg17 == wire14) : {(8'haa)}))});
      if ($unsigned(($unsigned(wire13) ?
          (($signed(wire15) ?
              (!reg18) : $signed(wire16)) ~^ {(reg18 ^~ (8'hb3)),
              ((7'h42) && wire13)}) : reg18)))
        begin
          reg19 <= (wire13[(2'h2):(1'h0)] + ($unsigned($unsigned($signed(reg18))) >= $unsigned($signed($unsigned(reg17)))));
          reg20 <= wire16;
        end
      else
        begin
          reg19 <= ($signed(wire15) ?
              (&(~^$unsigned({(8'hae)}))) : ((!(((8'hb1) ?
                      reg18 : wire14) >> wire16)) ?
                  reg17[(1'h1):(1'h1)] : $unsigned($unsigned($signed(reg19)))));
        end
      reg21 <= {(8'haf)};
      reg22 <= ((((reg19 >>> $signed(reg19)) ?
                  ((^~reg20) ? (wire15 < (8'ha4)) : (^~reg20)) : {(reg20 ?
                          reg18 : reg21),
                      $signed(reg21)}) ?
              (|((wire13 ? reg18 : (7'h41)) ? wire15 : (~|wire16))) : reg20) ?
          wire14 : wire13);
      reg23 <= $unsigned(($signed(wire14) ?
          (^~((wire16 + wire14) ?
              {wire13} : (reg19 < reg21))) : $signed($signed((reg18 ?
              wire15 : reg20)))));
    end
  always
    @(posedge clk) begin
      reg24 <= wire15[(3'h6):(1'h1)];
      reg25 <= reg18;
      reg26 <= {$unsigned(wire14)};
      reg27 <= {$unsigned(($signed({reg19, wire15}) ?
              reg26 : {reg20[(1'h1):(1'h1)], $signed(reg20)})),
          reg17[(3'h6):(2'h2)]};
      if (reg18)
        begin
          reg28 <= {reg25};
          reg29 <= (~|reg26);
          reg30 <= (~&$unsigned(((8'h9f) != $unsigned($signed(reg29)))));
        end
      else
        begin
          reg28 <= (+reg27[(2'h2):(2'h2)]);
          reg29 <= reg30;
          if (wire15[(3'h4):(2'h2)])
            begin
              reg30 <= $unsigned(($signed({((8'h9d) << reg21),
                      $unsigned(reg21)}) ?
                  $unsigned(reg21[(1'h0):(1'h0)]) : {reg17[(1'h0):(1'h0)]}));
            end
          else
            begin
              reg30 <= $unsigned(reg22);
              reg31 <= ((reg28[(2'h3):(1'h0)] ?
                      $unsigned((+$signed(reg29))) : reg20[(1'h1):(1'h0)]) ?
                  ((~(~&reg27)) < {$signed(((8'ha2) <<< reg20))}) : reg20);
            end
          reg32 <= (&$unsigned({$unsigned((reg18 < wire13))}));
        end
    end
  assign wire33 = $signed(reg24);
endmodule
