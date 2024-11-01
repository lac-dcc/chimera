module top
#(parameter param142 = (|(~&{(((8'had) >= (8'ha8)) ? ((8'hb4) ? (8'hb8) : (7'h43)) : {(8'hac), (8'ha3)}), (((8'ha8) <= (8'h9d)) ? (^~(8'hbe)) : (~(8'hbb)))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire141;
  wire [(4'hc):(1'h0)] wire140;
  wire signed [(3'h4):(1'h0)] wire139;
  wire [(5'h12):(1'h0)] wire138;
  wire [(5'h12):(1'h0)] wire137;
  wire signed [(5'h11):(1'h0)] wire136;
  wire [(5'h10):(1'h0)] wire134;
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire134,
                 (1'h0)};
  module5 #() modinst135 (wire134, clk, wire4, wire0, wire3, wire2, wire1);
  assign wire136 = ((((+(wire2 <<< wire2)) ?
                               wire1[(4'ha):(4'h8)] : wire134[(4'hb):(1'h1)]) ?
                           $signed(wire1[(5'h10):(4'hb)]) : $unsigned(wire1[(1'h0):(1'h0)])) ?
                       {(~|{(wire3 ?
                                   (8'hb3) : (8'h9c))})} : $unsigned((|(!$unsigned(wire0)))));
  assign wire137 = ((8'hb2) & wire4[(3'h4):(1'h0)]);
  assign wire138 = (^wire0);
  assign wire139 = wire137[(2'h3):(2'h3)];
  assign wire140 = (-({$signed(wire2[(2'h2):(1'h1)])} ?
                       {({wire136} << wire0),
                           wire1[(4'hf):(3'h6)]} : wire2[(2'h2):(2'h2)]));
  assign wire141 = (wire134 ?
                       $unsigned(($signed((wire2 ? wire134 : wire1)) ?
                           wire1 : (-$signed(wire4)))) : wire4);
endmodule

module module5
#(parameter param132 = (7'h43), 
parameter param133 = {param132, (((8'hbd) << ((8'hb5) + ((8'hb7) ^ param132))) ? (((param132 | param132) | (param132 ? param132 : param132)) ? param132 : ((~^param132) ~^ {param132, (8'hb6)})) : {(8'hb6), (((8'haf) * param132) * (&param132))})})
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire6;
  input wire [(5'h14):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire131;
  wire [(5'h15):(1'h0)] wire130;
  wire signed [(3'h6):(1'h0)] wire129;
  wire [(5'h14):(1'h0)] wire128;
  wire signed [(5'h13):(1'h0)] wire126;
  wire signed [(3'h5):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire52;
  wire signed [(5'h10):(1'h0)] wire77;
  wire signed [(5'h12):(1'h0)] wire124;
  reg signed [(3'h5):(1'h0)] reg127 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire126,
                 wire50,
                 wire52,
                 wire77,
                 wire124,
                 reg127,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= ((&($signed((^wire7)) ?
              $signed((!wire7)) : ((wire9 & wire6) ?
                  (wire6 <<< wire7) : wire10[(1'h0):(1'h0)]))) ?
          wire10[(2'h2):(1'h0)] : $signed($unsigned($unsigned(((8'haf) > (8'haa))))));
    end
  module12 #() modinst51 (.wire13(wire9), .wire14(reg11), .wire15(wire8), .wire17(wire6), .clk(clk), .wire16(wire10), .y(wire50));
  assign wire52 = ((((wire50 ?
                              wire6 : wire50[(2'h3):(2'h2)]) > $signed((reg11 - wire10))) ?
                          wire8 : (!(wire50 <= (wire8 ? (8'ha0) : reg11)))) ?
                      ($unsigned($unsigned(wire9[(2'h2):(1'h1)])) ?
                          wire50[(1'h0):(1'h0)] : wire50[(2'h3):(2'h2)]) : {{(wire9 ?
                                  $unsigned((8'hbd)) : (wire10 << wire6)),
                              wire6[(2'h2):(1'h1)]}});
  module53 #() modinst78 (wire77, clk, wire9, wire50, wire52, wire8);
  module79 #() modinst125 (wire124, clk, wire9, reg11, wire77, wire7);
  assign wire126 = (~|$unsigned(wire8[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg127 <= wire77;
    end
  assign wire128 = ((wire126[(5'h10):(4'hd)] ?
                           {((~&wire77) ?
                                   $signed(wire9) : (reg11 ?
                                       wire126 : (7'h40)))} : (+wire9)) ?
                       (^~(+$signed(reg11[(3'h7):(3'h6)]))) : $unsigned({{(~&wire10),
                               (wire50 ? (8'hba) : wire52)}}));
  assign wire129 = $unsigned((+wire9[(4'h8):(2'h3)]));
  assign wire130 = reg11[(2'h3):(2'h2)];
  assign wire131 = $unsigned($signed((-(&wire8))));
endmodule

module module79  (y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'h1b9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire83;
  input wire [(3'h7):(1'h0)] wire82;
  input wire [(5'h10):(1'h0)] wire81;
  input wire signed [(5'h10):(1'h0)] wire80;
  wire [(5'h10):(1'h0)] wire123;
  wire signed [(3'h6):(1'h0)] wire114;
  wire [(4'hc):(1'h0)] wire113;
  wire signed [(5'h15):(1'h0)] wire112;
  wire [(5'h15):(1'h0)] wire111;
  wire [(3'h4):(1'h0)] wire96;
  wire [(3'h6):(1'h0)] wire95;
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg [(5'h13):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg119 = (1'h0);
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg117 = (1'h0);
  reg [(3'h5):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg110 = (1'h0);
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  reg [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg107 = (1'h0);
  reg [(5'h14):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  reg [(5'h14):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg101 = (1'h0);
  reg [(5'h14):(1'h0)] reg100 = (1'h0);
  reg [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(3'h4):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(4'h9):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(4'h8):(1'h0)] reg84 = (1'h0);
  assign y = {wire123,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire96,
                 wire95,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire82[(2'h2):(1'h1)])
        begin
          reg84 <= $unsigned(((wire83[(1'h1):(1'h0)] <= ((wire82 ?
                  wire82 : wire81) ?
              wire83 : $signed(wire82))) & (((~wire81) ?
                  (~^wire83) : (wire80 >= wire83)) ?
              (wire83 >= $unsigned(wire81)) : {$unsigned(wire82),
                  (^~wire81)})));
          reg85 <= $signed(wire80);
          reg86 <= wire80;
          reg87 <= wire80[(4'hb):(3'h5)];
          if (reg85[(2'h2):(1'h0)])
            begin
              reg88 <= ($unsigned($unsigned($unsigned((+wire81)))) >>> $unsigned(({reg85[(2'h2):(1'h0)],
                      $signed(wire83)} ?
                  (~|(&wire80)) : $unsigned((|reg87)))));
              reg89 <= ((~$signed((wire83 << {reg85}))) <= (^$unsigned((^~(&reg85)))));
              reg90 <= $signed((reg85 ?
                  reg85[(2'h3):(1'h0)] : wire82[(3'h5):(1'h0)]));
            end
          else
            begin
              reg88 <= $unsigned({wire80,
                  ($signed((reg84 ? wire80 : reg85)) ?
                      $signed(reg89) : wire82)});
              reg89 <= {wire81,
                  $unsigned((reg87 ?
                      ((reg90 ? reg86 : reg85) ?
                          $signed(wire81) : (^~reg84)) : reg84))};
              reg90 <= {($signed(((reg88 != wire83) < (~reg90))) <= wire80)};
              reg91 <= reg87;
              reg92 <= ($signed(($unsigned($unsigned(wire83)) ?
                  ($signed((8'ha9)) ?
                      $signed(reg87) : $unsigned(reg88)) : $unsigned(reg87))) >> reg90[(3'h6):(2'h3)]);
            end
        end
      else
        begin
          reg84 <= $signed($signed($signed($unsigned((reg84 ?
              reg86 : reg84)))));
          reg85 <= (!$unsigned((7'h44)));
          reg86 <= ($signed(wire80) ?
              (^reg86[(1'h1):(1'h0)]) : ((~($signed(wire83) ?
                  $unsigned(reg90) : ((8'haf) ^~ reg88))) >> wire81[(3'h4):(1'h0)]));
        end
      reg93 <= wire80;
      reg94 <= {(8'hac)};
    end
  assign wire95 = (reg92 ? (~^wire83) : reg94[(1'h1):(1'h1)]);
  assign wire96 = (&(&$signed(($unsigned(reg94) < reg89[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg97 <= ($unsigned((!reg92[(1'h0):(1'h0)])) << $signed(reg94));
      reg98 <= (~&($unsigned((~$signed(wire83))) ?
          $unsigned(({reg89} ?
              (8'hb6) : $unsigned(wire96))) : $unsigned((wire82 | ((8'hbf) != reg94)))));
      reg99 <= reg85;
      reg100 <= (((8'hab) - $unsigned($signed((~reg92)))) ?
          ((^~(~(reg98 >= wire95))) >> reg99[(2'h2):(1'h0)]) : $signed((reg97[(3'h6):(3'h6)] * $signed($unsigned(reg93)))));
      reg101 <= wire80;
    end
  always
    @(posedge clk) begin
      if (($signed(reg87[(3'h7):(3'h5)]) + ({$unsigned(reg93), wire96} ?
          $signed(($signed(reg100) ? $unsigned(reg87) : wire82)) : (^{(+reg89),
              $signed(reg90)}))))
        begin
          reg102 <= $signed((&$signed(reg90)));
          reg103 <= (|$unsigned($unsigned((-(+reg88)))));
          reg104 <= (|$unsigned((((reg99 | reg87) ?
                  reg87[(3'h6):(2'h3)] : $signed((7'h44))) ?
              (|reg98[(2'h2):(1'h1)]) : (8'hb4))));
          reg105 <= $unsigned({(~(&$signed(reg94))), reg97});
        end
      else
        begin
          reg102 <= (wire83[(3'h4):(2'h2)] | $unsigned($signed((reg98 * $signed(reg100)))));
          reg103 <= $signed(reg105);
          if (reg103)
            begin
              reg104 <= (^~$signed(reg89[(1'h0):(1'h0)]));
            end
          else
            begin
              reg104 <= reg87;
              reg105 <= $unsigned((~|reg88[(2'h3):(2'h3)]));
              reg106 <= (((reg84[(4'h8):(4'h8)] ?
                  $unsigned(reg87) : reg86[(4'h8):(1'h1)]) <<< (8'hbd)) >>> $unsigned($unsigned(((reg101 ?
                      reg86 : (8'hab)) ?
                  $unsigned(reg102) : $unsigned(wire95)))));
              reg107 <= ($unsigned($unsigned($unsigned((reg103 ?
                  reg97 : (8'ha3))))) * $unsigned($unsigned(reg105)));
            end
        end
      if ((reg103 ? wire96[(2'h2):(1'h1)] : {{reg104, wire95[(3'h6):(1'h1)]}}))
        begin
          reg108 <= reg92;
          reg109 <= (reg108[(3'h6):(3'h5)] ?
              $signed((~^$signed(reg99))) : $unsigned(reg86));
        end
      else
        begin
          reg108 <= $unsigned({(|reg92[(2'h2):(2'h2)]), (&(~&{reg104}))});
        end
      reg110 <= $signed($unsigned((wire81[(1'h1):(1'h0)] << reg106[(1'h1):(1'h1)])));
    end
  assign wire111 = reg91[(1'h0):(1'h0)];
  assign wire112 = reg106[(4'hb):(3'h7)];
  assign wire113 = (reg99[(4'hd):(4'hc)] >> (|(reg102 ^ $signed($unsigned((8'hb2))))));
  assign wire114 = reg106;
  always
    @(posedge clk) begin
      if (reg103[(2'h3):(1'h1)])
        begin
          reg115 <= $signed(wire81);
          if ($signed($signed($unsigned($unsigned(reg98[(3'h4):(2'h2)])))))
            begin
              reg116 <= (|reg100);
              reg117 <= (wire83[(2'h2):(1'h0)] >>> (^~(^reg116)));
              reg118 <= $signed(reg94);
            end
          else
            begin
              reg116 <= $signed(((-{(reg115 ? reg117 : reg104), (8'ha5)}) ?
                  reg91[(3'h6):(3'h4)] : reg85[(2'h2):(1'h0)]));
              reg117 <= $signed($unsigned(wire112[(4'ha):(2'h2)]));
              reg118 <= reg97[(2'h2):(2'h2)];
            end
          reg119 <= (~reg84[(4'h8):(1'h0)]);
        end
      else
        begin
          reg115 <= {(+wire114[(2'h2):(2'h2)]),
              (~^(~&($signed((8'ha5)) ?
                  reg87[(1'h0):(1'h0)] : ((8'h9d) ? wire81 : reg106))))};
        end
      if ((^~reg108[(3'h7):(3'h4)]))
        begin
          reg120 <= reg88[(2'h3):(2'h2)];
        end
      else
        begin
          if (reg104)
            begin
              reg120 <= reg115;
            end
          else
            begin
              reg120 <= wire96;
            end
        end
      reg121 <= $unsigned($signed($signed(wire113[(1'h0):(1'h0)])));
      reg122 <= $unsigned((wire95[(3'h5):(2'h2)] ^ reg109[(3'h6):(3'h4)]));
    end
  assign wire123 = $unsigned($signed((reg117[(3'h6):(3'h6)] ?
                       reg109[(2'h3):(1'h0)] : $unsigned(reg94))));
endmodule

module module53
#(parameter param75 = ((!((&(!(7'h42))) ? (((8'ha4) ? (8'hb6) : (8'h9d)) > (~^(8'hbc))) : (((8'hbb) <= (8'h9c)) ? ((7'h42) ? (8'hb4) : (8'hbe)) : ((7'h42) ? (8'hb7) : (8'hbd))))) ? ((-(~((8'had) ? (7'h44) : (8'hb6)))) >> ({((8'ha7) <<< (8'h9d))} - ((&(8'hae)) < (+(8'hbf))))) : (((~&(~^(8'hb6))) ? {{(8'h9f), (8'hb1)}, ((8'ha1) > (8'ha1))} : {(~^(8'h9e)), ((8'ha4) ? (8'h9f) : (8'h9e))}) ^ (8'ha3))), 
parameter param76 = ({((~^(~param75)) == (((8'hbe) | param75) ? param75 : ((7'h41) ? param75 : (8'hab)))), (param75 >>> {((8'hbf) ? param75 : param75)})} ? param75 : ({(((8'hac) ? param75 : param75) << (param75 <<< param75))} ? (~&(~|((8'ha9) ? param75 : param75))) : (8'hbc))))
(y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire57;
  input wire signed [(3'h5):(1'h0)] wire56;
  input wire [(5'h11):(1'h0)] wire55;
  input wire signed [(5'h11):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire74;
  wire [(3'h6):(1'h0)] wire73;
  wire signed [(5'h14):(1'h0)] wire72;
  wire signed [(4'ha):(1'h0)] wire71;
  wire [(4'he):(1'h0)] wire69;
  wire [(4'ha):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  wire signed [(4'hb):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire60;
  wire [(5'h13):(1'h0)] wire59;
  wire [(2'h3):(1'h0)] wire58;
  reg signed [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
                 wire68,
                 wire67,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 reg70,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire58 = wire54;
  assign wire59 = $signed((!{{(wire54 ^~ wire56), wire57[(4'h8):(3'h6)]}}));
  assign wire60 = (!$signed((wire54 ? wire54[(5'h11):(3'h5)] : wire54)));
  assign wire61 = (~&($signed(wire60[(3'h6):(3'h6)]) ~^ ($unsigned((wire55 - wire60)) ?
                      (-(wire57 || wire54)) : ((wire60 < wire55) > (^wire55)))));
  always
    @(posedge clk) begin
      reg62 <= wire54[(3'h6):(3'h6)];
      reg63 <= $signed($signed((wire61[(3'h5):(2'h2)] ?
          (&(wire54 ? wire54 : (7'h42))) : ((8'hac) ?
              $unsigned(wire61) : (wire59 ? wire60 : wire57)))));
      reg64 <= (~^((~$signed(wire59[(3'h6):(2'h3)])) ?
          $signed((~&$unsigned(wire60))) : $signed((wire56 ?
              (!wire61) : $signed(wire60)))));
      reg65 <= ((reg64 ?
          ($unsigned($unsigned(wire54)) ^~ (reg64[(2'h3):(2'h2)] | (wire55 ?
              wire58 : reg62))) : wire61[(4'ha):(2'h3)]) >> wire55);
      reg66 <= (+reg65[(4'ha):(1'h1)]);
    end
  assign wire67 = (wire59[(4'hd):(4'hb)] ?
                      $unsigned((8'hac)) : $signed({{$signed(wire56),
                              (reg63 ? reg62 : reg66)},
                          wire56[(3'h4):(3'h4)]}));
  assign wire68 = reg66;
  assign wire69 = ({({wire60[(3'h6):(2'h3)]} * $unsigned({wire56})),
                      {($signed(wire67) ?
                              wire58[(2'h3):(2'h3)] : wire61)}} && wire67[(4'h9):(1'h1)]);
  always
    @(posedge clk) begin
      reg70 <= (((($signed(wire61) << wire68[(4'ha):(3'h4)]) >= $signed(wire59[(4'hb):(3'h6)])) >>> (~(((8'h9d) > wire55) ?
              {reg63, wire68} : $unsigned((8'h9c))))) ?
          $unsigned({$unsigned($unsigned(reg65))}) : wire69);
    end
  assign wire71 = (reg62 ?
                      (wire69[(3'h5):(2'h3)] ^ (($signed(wire68) ^~ wire59) ?
                          $unsigned({reg70}) : $signed($signed(wire68)))) : (reg70[(5'h11):(3'h4)] << $unsigned(wire55[(4'hf):(4'hf)])));
  assign wire72 = ((8'hbe) >> wire59[(4'ha):(3'h5)]);
  assign wire73 = ($unsigned(reg63[(2'h2):(1'h0)]) ?
                      {$unsigned(((!reg66) ? wire69 : (reg63 <= reg70))),
                          (((wire56 ? reg63 : (7'h42)) ?
                              reg62 : $signed(wire57)) ~^ (~|(~^(8'ha9))))} : $unsigned(wire55));
  assign wire74 = reg65;
endmodule

module module12
#(parameter param49 = {(~&{(((8'ha9) ? (8'ha5) : (8'haa)) ? (8'ha7) : {(7'h42), (8'haa)})}), (|{(-(8'had)), ({(8'hb1), (8'ha3)} ? ((8'ha4) - (8'haf)) : (~|(8'h9e)))})})
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire17;
  input wire signed [(5'h12):(1'h0)] wire16;
  input wire [(2'h3):(1'h0)] wire15;
  input wire [(3'h4):(1'h0)] wire14;
  input wire signed [(2'h2):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  wire signed [(3'h4):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire34;
  wire [(3'h7):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire18;
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  assign y = {wire48,
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
                 wire34,
                 wire33,
                 wire18,
                 reg37,
                 reg36,
                 reg35,
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
                 (1'h0)};
  assign wire18 = (!$signed({wire16}));
  always
    @(posedge clk) begin
      reg19 <= ((~|wire15) || ((wire16 ^ (-{wire18})) ?
          wire14 : $signed((~^(~|wire17)))));
      if (($unsigned(wire18) >= (^~wire16[(4'h9):(3'h4)])))
        begin
          reg20 <= $signed(wire13[(1'h0):(1'h0)]);
        end
      else
        begin
          reg20 <= $unsigned($signed((~^$unsigned((+wire14)))));
        end
      reg21 <= {wire18};
      if ($unsigned((+$unsigned(((reg19 <= reg20) ?
          {wire18, reg19} : (wire16 ? (8'had) : wire18))))))
        begin
          reg22 <= {$signed($signed($signed($signed((8'haa))))),
              (|(^reg21[(3'h7):(2'h2)]))};
          reg23 <= wire17;
          if (reg21)
            begin
              reg24 <= ($signed((reg23[(1'h0):(1'h0)] >>> (-((8'hbf) ?
                      wire14 : wire18)))) ?
                  ($unsigned((reg22 ?
                      reg20 : (reg22 ?
                          (8'ha7) : (7'h42)))) ~^ $signed((reg20[(1'h0):(1'h0)] ?
                      (!reg23) : (wire17 ?
                          wire15 : reg20)))) : (~^({reg23[(1'h1):(1'h0)]} ?
                      ($unsigned(wire17) > reg21) : ($signed(wire15) >= $signed(reg21)))));
            end
          else
            begin
              reg24 <= {($unsigned(reg22[(1'h1):(1'h1)]) ?
                      wire16 : $signed($signed($unsigned(wire17)))),
                  (&(((reg21 < wire18) & wire14) ?
                      wire13[(1'h1):(1'h0)] : ($signed(reg23) < (reg24 ^ (8'h9f)))))};
              reg25 <= $signed($signed($unsigned(($unsigned(reg24) ?
                  (reg21 >> reg24) : (wire18 ? wire14 : reg21)))));
              reg26 <= reg25;
              reg27 <= ((~^(((!wire14) && wire14[(2'h3):(2'h2)]) ?
                  reg26 : $unsigned($signed(reg21)))) != $unsigned($unsigned($signed((reg22 ?
                  reg21 : reg25)))));
            end
          if (reg24[(4'hc):(1'h0)])
            begin
              reg28 <= $signed(reg22);
              reg29 <= {(reg24 ?
                      $unsigned((~|(+wire14))) : reg27[(2'h3):(1'h0)])};
              reg30 <= $signed((-{wire15}));
              reg31 <= wire14;
              reg32 <= reg28[(3'h4):(2'h3)];
            end
          else
            begin
              reg28 <= $signed(((8'haf) ?
                  $unsigned(reg26[(2'h2):(2'h2)]) : wire16));
              reg29 <= $signed({(&(~|$signed(reg29)))});
            end
        end
      else
        begin
          reg22 <= $unsigned((wire17 <<< $unsigned(reg30)));
          if (wire14)
            begin
              reg23 <= ((^~(-(~&{reg21, reg24}))) ?
                  $unsigned(reg21) : $signed(wire17[(3'h7):(3'h4)]));
              reg24 <= $signed(reg22[(1'h1):(1'h0)]);
              reg25 <= {$unsigned((~&reg25[(3'h7):(3'h5)])),
                  ($signed($unsigned((^~wire15))) ?
                      (+reg27[(2'h3):(2'h2)]) : (reg20 >>> (reg20 ?
                          wire16 : ((8'hbe) <= wire13))))};
            end
          else
            begin
              reg23 <= (-(7'h42));
            end
          if (({$unsigned((((8'hbd) ?
                  reg32 : reg30) <= ((8'hbc) * reg29)))} || wire14[(1'h0):(1'h0)]))
            begin
              reg26 <= {$signed(($signed($signed(wire14)) ?
                      (~|{reg26}) : (+(~wire18)))),
                  reg19[(3'h4):(2'h3)]};
            end
          else
            begin
              reg26 <= reg21;
              reg27 <= reg22;
            end
          reg28 <= $signed({{$unsigned($signed(reg26))},
              ((8'ha7) ?
                  $unsigned($signed(reg24)) : ($signed((8'hb3)) ?
                      (wire17 ? wire15 : reg29) : $unsigned(reg30)))});
        end
    end
  assign wire33 = (^{{(7'h44)}, reg29[(3'h4):(3'h4)]});
  assign wire34 = (reg25[(4'hd):(3'h7)] ? reg24 : (^reg23));
  always
    @(posedge clk) begin
      reg35 <= reg32;
      reg36 <= (reg29[(1'h0):(1'h0)] ?
          (~^(-reg24[(4'ha):(4'h8)])) : $unsigned((($signed(wire14) * reg20) ?
              reg23 : $signed($unsigned((8'hba))))));
      reg37 <= $unsigned({reg25[(1'h1):(1'h0)]});
    end
  assign wire38 = (reg31[(1'h1):(1'h0)] < reg22);
  assign wire39 = $signed($unsigned($unsigned(reg28)));
  assign wire40 = {(~|$signed(wire18)), reg28};
  assign wire41 = (~^$unsigned($unsigned(wire17[(3'h6):(1'h1)])));
  assign wire42 = ((((wire13 + wire33[(2'h3):(2'h3)]) ~^ (((8'hb8) == wire14) ?
                              (reg28 ?
                                  reg29 : reg25) : wire17[(1'h0):(1'h0)])) ?
                          (&(-(wire34 ? reg28 : wire34))) : (~wire39)) ?
                      wire14 : (8'hac));
  assign wire43 = (!{reg23});
  assign wire44 = wire34[(3'h4):(1'h1)];
  assign wire45 = wire40[(2'h3):(1'h1)];
  assign wire46 = $signed(reg22);
  assign wire47 = {wire13, (~reg28[(2'h2):(1'h0)])};
  assign wire48 = ($unsigned((reg32[(3'h7):(1'h1)] - $unsigned({reg25,
                          reg20}))) ?
                      ({$unsigned(wire44), wire41} >> wire34) : wire43);
endmodule
