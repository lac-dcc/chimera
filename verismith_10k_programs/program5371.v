module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire119;
  wire signed [(4'hc):(1'h0)] wire118;
  wire [(5'h10):(1'h0)] wire112;
  wire [(5'h11):(1'h0)] wire111;
  wire [(4'hc):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire108;
  wire signed [(4'hb):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg115 = (1'h0);
  reg [(2'h2):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg113 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire112,
                 wire111,
                 wire110,
                 wire108,
                 wire5,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 (1'h0)};
  assign wire5 = wire2;
  module6 #() modinst109 (.clk(clk), .wire8(wire0), .wire7(wire4), .wire9(wire3), .wire10(wire5), .y(wire108));
  assign wire110 = ($unsigned($unsigned((^~((8'h9d) >> wire3)))) >> (wire3 ?
                       wire1 : wire0[(3'h7):(1'h1)]));
  assign wire111 = {{(!($signed(wire3) ^~ (wire108 != wire0)))}, wire110};
  assign wire112 = (wire4[(2'h3):(1'h0)] || wire1[(3'h4):(2'h2)]);
  always
    @(posedge clk) begin
      if ((-(wire110[(3'h6):(2'h3)] ?
          $signed({(!wire108)}) : (($unsigned(wire111) * {wire4, wire112}) ?
              {(wire112 - wire1),
                  ((8'hb6) * (8'hbd))} : ((wire0 != wire110) ^ ((8'ha6) && wire108))))))
        begin
          reg113 <= ($signed($signed($signed($signed(wire111)))) ?
              ((wire108[(3'h6):(1'h1)] * $unsigned(((8'hbe) ?
                      wire111 : wire0))) ?
                  wire108[(3'h7):(3'h4)] : (~wire111)) : {($unsigned(wire3[(4'hb):(2'h3)]) ?
                      {wire1[(1'h0):(1'h0)]} : ((wire2 ?
                          wire112 : wire110) >> wire0[(1'h1):(1'h0)]))});
          reg114 <= $unsigned(wire3[(4'ha):(3'h4)]);
        end
      else
        begin
          reg113 <= {(~reg113[(1'h1):(1'h1)])};
        end
      reg115 <= wire110;
      reg116 <= (8'hac);
      reg117 <= ($signed(($signed((8'hb1)) || $signed(wire1[(3'h5):(3'h5)]))) >> wire5[(2'h2):(2'h2)]);
    end
  assign wire118 = $signed((($signed((-wire0)) ?
                       ({reg117} ?
                           (wire5 ?
                               wire111 : wire1) : (8'ha1)) : reg114[(1'h0):(1'h0)]) > ((8'ha5) > $signed($signed(wire3)))));
  assign wire119 = $unsigned(wire110[(4'h8):(2'h2)]);
endmodule

module module6
#(parameter param106 = (-(({(8'hb3)} == ((|(8'hac)) & ((8'had) ? (8'ha9) : (8'hbb)))) ~^ {((^(8'haf)) || {(8'ha7), (8'hbd)})})), 
parameter param107 = (&{param106, (({param106, param106} ? (param106 ~^ param106) : param106) ? (param106 != {param106, param106}) : {(~&param106)})}))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire signed [(4'ha):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire [(3'h7):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire105;
  wire [(5'h12):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  wire [(4'hf):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire71;
  wire signed [(3'h7):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire55;
  wire signed [(3'h6):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire100;
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire71,
                 wire57,
                 wire56,
                 wire55,
                 wire52,
                 wire51,
                 wire11,
                 wire49,
                 wire100,
                 reg75,
                 reg74,
                 reg73,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire11 = {wire7[(4'h8):(3'h5)],
                      $unsigned($signed(wire8[(2'h2):(1'h0)]))};
  module12 #() modinst50 (wire49, clk, wire8, wire10, wire7, wire9, wire11);
  assign wire51 = {wire10};
  assign wire52 = wire11[(4'hf):(4'hb)];
  always
    @(posedge clk) begin
      reg53 <= ($unsigned((~^$unsigned((wire9 ?
          wire11 : wire9)))) >= {$unsigned(wire10[(3'h6):(1'h1)])});
      reg54 <= (wire51 ?
          ((((-wire49) < $signed(wire9)) ^~ wire51) | (((7'h43) ?
                  $signed(wire52) : wire49) ?
              (&$unsigned(wire52)) : wire49[(1'h1):(1'h1)])) : (wire7[(4'hc):(3'h4)] ?
              $unsigned($signed(wire9[(4'hd):(4'h9)])) : wire52[(3'h4):(1'h0)]));
    end
  assign wire55 = (wire51 + {(&wire51), wire51});
  assign wire56 = wire7[(4'h8):(4'h8)];
  assign wire57 = wire9;
  module58 #() modinst72 (.y(wire71), .wire61(wire57), .wire63(wire10), .clk(clk), .wire59(wire56), .wire62(wire51), .wire60(wire7));
  always
    @(posedge clk) begin
      reg73 <= {wire11[(2'h2):(1'h0)],
          (($unsigned(reg54) >>> $signed((wire55 & wire10))) ?
              ((^~$signed((7'h40))) ?
                  $signed($unsigned(reg54)) : $signed($unsigned(wire55))) : wire49)};
      reg74 <= $unsigned(wire7);
      reg75 <= {$signed(wire51[(4'hf):(4'ha)])};
    end
  module76 #() modinst101 (.y(wire100), .wire81(reg74), .wire80(wire71), .clk(clk), .wire77(wire57), .wire79(wire56), .wire78(reg54));
  assign wire102 = $unsigned(($unsigned((wire9[(3'h7):(3'h7)] ?
                       (!wire8) : $signed(reg73))) > (wire9[(5'h13):(5'h11)] ?
                       (8'ha1) : (7'h43))));
  assign wire103 = (wire11 ?
                       {($unsigned((!reg74)) ?
                               wire7[(3'h6):(1'h0)] : (((8'hb1) ?
                                       wire11 : wire9) ?
                                   (~^wire51) : $signed(wire9))),
                           (+((~wire71) ? wire71 : (8'hba)))} : (8'h9f));
  assign wire104 = {$unsigned((((reg73 ? wire52 : wire51) < $signed(wire51)) ?
                           wire8 : wire52))};
  assign wire105 = reg75[(1'h0):(1'h0)];
endmodule

module module76
#(parameter param99 = ({(({(8'ha0)} ? {(7'h42)} : {(8'hbc)}) ? {((8'h9e) ? (7'h40) : (8'hbd))} : (((7'h41) << (8'hbd)) == ((8'hb3) << (8'ha2))))} ? ((&{((8'hb1) ~^ (7'h43))}) ? {(((8'ha6) ? (8'h9d) : (8'hb0)) ? (^(8'hbb)) : {(8'hba), (8'hb1)}), (&(~(8'had)))} : {(((8'hb0) ? (8'h9d) : (8'hb9)) || {(8'hb6), (8'hae)})}) : (((&((8'hb2) ? (8'hb5) : (8'hbc))) ? (!((8'hba) <= (8'hbc))) : ((~&(7'h43)) <= (8'ha7))) ? (((~&(8'hb8)) && ((8'ha7) != (8'ha1))) && (((8'hbc) ^ (7'h44)) < ((8'hb9) - (8'ha0)))) : ((((8'ha3) ? (8'hb9) : (8'ha7)) ? {(8'ha4)} : ((8'hb9) ? (8'hbd) : (7'h41))) < {((8'hb3) ? (8'hb4) : (8'hbb))}))))
(y, clk, wire81, wire80, wire79, wire78, wire77);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire81;
  input wire signed [(5'h12):(1'h0)] wire80;
  input wire [(4'ha):(1'h0)] wire79;
  input wire [(4'h8):(1'h0)] wire78;
  input wire [(2'h2):(1'h0)] wire77;
  wire signed [(2'h2):(1'h0)] wire98;
  wire [(5'h15):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire83;
  wire signed [(4'ha):(1'h0)] wire82;
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  reg [(3'h6):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire83,
                 wire82,
                 reg96,
                 reg95,
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
  assign wire82 = $signed($signed((($signed(wire79) ?
                          (wire78 ? wire80 : wire79) : $unsigned(wire79)) ?
                      (8'hb1) : {(wire81 <= wire81)})));
  assign wire83 = wire77;
  always
    @(posedge clk) begin
      reg84 <= wire81;
      if (wire77[(1'h1):(1'h1)])
        begin
          reg85 <= {wire78, (8'ha3)};
          if (((wire82[(1'h0):(1'h0)] + $signed($signed({wire82}))) <<< ($signed(wire78[(2'h2):(2'h2)]) == (^~((wire83 ?
                  wire82 : wire81) ?
              (^wire81) : (wire83 ? wire83 : (8'ha6)))))))
            begin
              reg86 <= $signed((~^$unsigned(wire82)));
              reg87 <= $signed($signed($unsigned((|wire81))));
              reg88 <= {wire83[(4'h8):(1'h0)]};
              reg89 <= (reg88 != wire82[(1'h0):(1'h0)]);
            end
          else
            begin
              reg86 <= (8'hb4);
              reg87 <= $signed(((-(|reg86)) ?
                  ({reg88} ?
                      $unsigned((wire78 ? wire78 : wire83)) : reg84) : wire80));
              reg88 <= (wire82 ?
                  $signed(({(~wire77)} ?
                      ((wire81 | reg89) ~^ $unsigned(wire82)) : (~|reg89))) : wire81);
              reg89 <= {(^~reg86[(3'h6):(3'h6)])};
            end
          reg90 <= $unsigned($signed(reg87[(4'hc):(4'ha)]));
          reg91 <= $unsigned(reg84);
        end
      else
        begin
          if ((~^(((~&((8'hb6) ? reg88 : wire78)) | ($signed(wire77) ?
                  (~|reg85) : reg87)) ?
              {(^(^reg88))} : (+$signed(wire81)))))
            begin
              reg85 <= ((+$signed((^~$signed(reg87)))) && $signed({{wire82[(2'h3):(2'h3)],
                      reg85[(4'hb):(4'h9)]},
                  ((reg87 + wire77) ?
                      $signed(reg87) : wire81[(4'h9):(3'h4)])}));
              reg86 <= $signed((-$unsigned((((8'hba) >>> wire83) >= reg85[(4'ha):(4'h8)]))));
              reg87 <= $signed($signed((((wire83 ? wire77 : reg89) - reg88) ?
                  (reg90[(1'h0):(1'h0)] ?
                      (reg88 ?
                          reg86 : reg88) : reg85[(4'hd):(3'h4)]) : ((reg86 ?
                      wire78 : reg90) != (wire79 ? wire78 : (8'hb6))))));
              reg88 <= wire81;
            end
          else
            begin
              reg85 <= ({wire79, $signed($unsigned((wire78 >>> (8'hb0))))} ?
                  wire77 : (^$unsigned($signed(wire82[(4'ha):(2'h2)]))));
              reg86 <= (~|reg89[(2'h3):(1'h1)]);
              reg87 <= (!($unsigned((((8'hb6) >> reg91) ?
                      reg84[(4'ha):(2'h3)] : $unsigned(reg85))) ?
                  reg86[(3'h7):(3'h7)] : $signed(wire81[(4'h8):(1'h0)])));
              reg88 <= (($signed($unsigned(wire78[(3'h4):(1'h0)])) ?
                      wire82 : wire77[(1'h0):(1'h0)]) ?
                  $unsigned(wire78) : (wire78[(3'h4):(3'h4)] ?
                      wire77 : (&wire81[(4'ha):(2'h3)])));
              reg89 <= ((($unsigned($unsigned(reg86)) ?
                  ((wire78 - wire83) ?
                      (+wire81) : $unsigned(wire77)) : (^~(~reg85))) & reg85) && wire81);
            end
          reg90 <= (+($unsigned(wire83) ^ (($signed(reg87) ?
                  (wire83 < wire81) : $signed(wire80)) ?
              reg84[(4'he):(4'h9)] : $signed($unsigned(reg85)))));
          if (wire82[(3'h6):(3'h4)])
            begin
              reg91 <= (~&{(reg87[(2'h3):(2'h2)] > reg84[(4'h8):(3'h6)]),
                  reg88});
              reg92 <= (($signed(wire79[(3'h4):(1'h0)]) >> reg91) ?
                  (|$unsigned({$signed(wire82)})) : $unsigned({(reg91[(3'h5):(2'h2)] + $unsigned((8'h9c)))}));
              reg93 <= (&(reg92[(2'h3):(2'h2)] ?
                  {$signed((reg89 != (8'ha3))),
                      reg91[(3'h7):(3'h7)]} : $unsigned($unsigned(wire83[(2'h2):(1'h0)]))));
            end
          else
            begin
              reg91 <= reg90[(3'h5):(2'h3)];
              reg92 <= (~reg84[(2'h3):(1'h1)]);
              reg93 <= reg86[(3'h4):(1'h0)];
            end
          reg94 <= reg86[(4'h9):(4'h9)];
          reg95 <= (8'ha0);
        end
      reg96 <= {$unsigned(reg94), (+$unsigned($unsigned((reg86 ^~ wire77))))};
    end
  assign wire97 = (+(^~(-reg94)));
  assign wire98 = $signed($signed($unsigned($unsigned($signed(wire82)))));
endmodule

module module58  (y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire63;
  input wire [(5'h14):(1'h0)] wire62;
  input wire signed [(3'h7):(1'h0)] wire61;
  input wire signed [(3'h6):(1'h0)] wire60;
  input wire [(4'hd):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire69;
  wire signed [(4'ha):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire64;
  assign y = {wire70, wire69, wire68, wire67, wire66, wire65, wire64, (1'h0)};
  assign wire64 = {{(wire61[(2'h3):(2'h3)] ?
                              ($signed(wire63) ?
                                  wire61 : (8'ha9)) : $unsigned(wire63)),
                          (~(8'ha6))},
                      wire60};
  assign wire65 = wire64[(2'h3):(1'h0)];
  assign wire66 = ((wire65[(1'h0):(1'h0)] ?
                      $unsigned($signed((wire62 == (8'had)))) : ({(wire62 ^~ wire61),
                          (~|wire63)} != $unsigned((wire64 ~^ wire64)))) <<< ((&(wire62[(4'h9):(3'h7)] > wire64)) ?
                      (($signed(wire62) != $unsigned(wire59)) == $signed($signed(wire61))) : {((~^wire62) && (wire60 && (8'ha7))),
                          ($unsigned((8'hba)) <= wire59)}));
  assign wire67 = $signed((wire62 << (((-wire63) && (^~wire66)) >> ($signed(wire66) && wire62[(3'h5):(2'h2)]))));
  assign wire68 = (({wire65[(3'h5):(2'h3)]} ?
                          (!(8'hb1)) : $signed(wire59[(4'h8):(3'h7)])) ?
                      (wire59 + (~|((~&(8'ha9)) ?
                          $unsigned(wire66) : wire63))) : (~wire66));
  assign wire69 = $signed((~&(wire59 ?
                      $unsigned($signed((7'h44))) : (!(wire66 * wire66)))));
  assign wire70 = (wire69[(2'h2):(2'h2)] + $unsigned(wire61[(1'h0):(1'h0)]));
endmodule

module module12
#(parameter param48 = (!((((+(8'haf)) ? (!(8'ha2)) : ((8'ha9) ^ (8'ha3))) ? {(~&(8'h9d))} : ({(8'hbd), (7'h42)} ? ((8'hb3) ? (8'hb8) : (8'ha6)) : ((8'had) ? (8'ha0) : (8'ha5)))) ? ((((8'ha4) ? (8'hab) : (8'h9c)) ? ((8'ha3) ? (7'h44) : (8'ha0)) : {(8'h9d), (8'ha8)}) < (&(8'ha5))) : (((8'ha2) ? ((8'h9e) <<< (7'h44)) : {(8'ha5), (8'hb7)}) || ({(8'ha0), (8'haf)} ? {(8'ha5), (8'ha6)} : ((8'ha0) + (8'ha5)))))))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire17;
  input wire signed [(3'h6):(1'h0)] wire16;
  input wire signed [(3'h5):(1'h0)] wire15;
  input wire [(5'h13):(1'h0)] wire14;
  input wire [(4'hf):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire18;
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
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
                 wire18,
                 reg41,
                 reg40,
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
                 (1'h0)};
  assign wire18 = {$signed(wire17)};
  assign wire19 = (-((wire18 + (wire14 << (wire18 >= wire18))) & ($signed(wire16[(3'h5):(2'h3)]) != (wire15 ?
                      (wire18 ^~ wire16) : wire18))));
  assign wire20 = (^wire13[(3'h7):(3'h4)]);
  assign wire21 = (^~$signed($signed($unsigned(((8'h9f) ? wire18 : (8'hae))))));
  assign wire22 = wire21;
  assign wire23 = wire19[(2'h2):(1'h1)];
  assign wire24 = wire21;
  assign wire25 = ($unsigned((~(wire14 ?
                      (wire18 ?
                          (8'hae) : wire24) : $unsigned(wire20)))) - wire16[(2'h2):(2'h2)]);
  assign wire26 = wire14[(4'hb):(4'ha)];
  assign wire27 = (-$unsigned($signed($signed(wire21))));
  assign wire28 = (($unsigned(wire20) ?
                          $signed({$unsigned(wire25),
                              $signed(wire25)}) : (~wire15[(1'h0):(1'h0)])) ?
                      (8'ha3) : wire16[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire20)
        begin
          reg29 <= (8'ha6);
          reg30 <= wire16;
          if ($signed({((&$signed((8'hae))) || $unsigned((wire28 ?
                  wire22 : wire19))),
              (+({wire20, wire23} <= (wire13 || wire21)))}))
            begin
              reg31 <= $signed($signed((7'h40)));
              reg32 <= (!{(&$signed($signed(reg29))), $signed({(+wire23)})});
              reg33 <= wire18;
              reg34 <= $unsigned((^({wire21[(1'h0):(1'h0)],
                  (+reg29)} * ($unsigned(reg31) ?
                  $signed(reg30) : {wire16, wire24}))));
              reg35 <= (reg32[(4'hb):(3'h6)] ?
                  $signed({(wire17[(1'h1):(1'h1)] >>> $unsigned(wire21)),
                      wire21}) : wire26[(1'h1):(1'h1)]);
            end
          else
            begin
              reg31 <= $signed({$unsigned($unsigned($unsigned(wire27)))});
              reg32 <= {$signed($signed($unsigned((wire16 + (8'had)))))};
              reg33 <= wire21;
              reg34 <= {$signed($unsigned(((wire22 & wire22) ?
                      $signed(wire27) : $unsigned(wire19)))),
                  wire25[(4'h9):(3'h5)]};
            end
        end
      else
        begin
          reg29 <= $signed(reg33);
        end
      reg36 <= {wire17[(3'h5):(1'h0)]};
      reg37 <= $unsigned({(|(~^{(8'ha7), wire22})), (&wire17[(3'h7):(2'h2)])});
      if ($signed((({(reg37 * reg34), wire26} ?
          (reg36 ?
              (wire14 ?
                  (8'ha2) : wire23) : (|wire17)) : reg36) >> $signed(wire22[(2'h2):(2'h2)]))))
        begin
          reg38 <= $signed(reg36);
        end
      else
        begin
          reg38 <= (reg30[(2'h2):(1'h0)] >> (|(wire19 ?
              ((reg38 >> wire22) ?
                  {(8'hae),
                      wire24} : $unsigned(wire23)) : (-$unsigned(reg30)))));
          reg39 <= {$unsigned(((8'h9d) ?
                  $signed(((8'haa) != wire19)) : wire16))};
          reg40 <= reg30[(3'h4):(2'h3)];
        end
      reg41 <= wire28[(3'h4):(2'h3)];
    end
  assign wire42 = $unsigned(reg31);
  assign wire43 = (+$unsigned((~^wire23)));
  assign wire44 = wire28;
  assign wire45 = reg30[(2'h3):(2'h3)];
  assign wire46 = ($unsigned({$signed($signed(wire21))}) ?
                      wire45[(5'h12):(4'hc)] : $signed((reg39[(1'h0):(1'h0)] ^ ($signed(reg33) != {wire16,
                          wire43}))));
  assign wire47 = reg37;
endmodule
