module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire127;
  wire [(4'h8):(1'h0)] wire123;
  wire signed [(4'hd):(1'h0)] wire122;
  wire signed [(4'hd):(1'h0)] wire121;
  wire signed [(2'h2):(1'h0)] wire120;
  wire [(3'h6):(1'h0)] wire114;
  wire signed [(4'hc):(1'h0)] wire113;
  wire signed [(5'h11):(1'h0)] wire112;
  wire signed [(4'he):(1'h0)] wire111;
  wire signed [(4'he):(1'h0)] wire110;
  wire [(4'h8):(1'h0)] wire109;
  wire [(5'h15):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire70;
  wire [(5'h15):(1'h0)] wire72;
  wire signed [(4'hb):(1'h0)] wire107;
  reg signed [(5'h14):(1'h0)] reg126 = (1'h0);
  reg [(3'h6):(1'h0)] reg125 = (1'h0);
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  reg [(4'h8):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg118 = (1'h0);
  reg [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(5'h10):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg115 = (1'h0);
  assign y = {wire127,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire5,
                 wire6,
                 wire70,
                 wire72,
                 wire107,
                 reg126,
                 reg125,
                 reg124,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 (1'h0)};
  assign wire5 = (8'h9e);
  assign wire6 = (wire1[(3'h7):(3'h6)] ?
                     wire3[(3'h5):(1'h0)] : $unsigned(((8'hb5) >= ((+wire3) ?
                         wire5 : wire5[(1'h0):(1'h0)]))));
  module7 #() modinst71 (wire70, clk, wire0, wire5, wire2, wire1);
  assign wire72 = ($signed($unsigned($unsigned($unsigned(wire4)))) >> wire70);
  module73 #() modinst108 (wire107, clk, wire2, wire72, wire0, wire70, wire1);
  assign wire109 = {{(|$signed($unsigned(wire4))),
                           (((wire72 ^~ wire72) * {wire3}) >> ($unsigned(wire70) & $signed(wire3)))},
                       $unsigned($unsigned(($unsigned((8'hbd)) - $signed(wire4))))};
  assign wire110 = wire0;
  assign wire111 = (&$unsigned((wire6 && {wire107})));
  assign wire112 = (wire109 << (wire5 ?
                       $unsigned($unsigned((wire109 ?
                           (8'hab) : wire0))) : $signed($unsigned($unsigned(wire107)))));
  assign wire113 = $unsigned({wire0[(5'h11):(1'h1)]});
  assign wire114 = wire107;
  always
    @(posedge clk) begin
      if ({wire72, ((8'hb3) ? wire107 : (^(~&$unsigned(wire112))))})
        begin
          reg115 <= $signed((~^wire4));
          reg116 <= $unsigned(wire107[(4'hb):(4'hb)]);
          reg117 <= wire109;
        end
      else
        begin
          reg115 <= $unsigned($unsigned((({wire4,
              wire112} >= $unsigned(wire72)) == $signed({(8'hab)}))));
          reg116 <= ((wire3[(3'h5):(2'h3)] >= wire111[(4'he):(3'h5)]) ?
              $unsigned((wire6 ?
                  ((wire113 == wire3) ?
                      $signed(wire70) : $signed(wire2)) : (!(|(8'ha7))))) : wire112[(1'h0):(1'h0)]);
          reg117 <= ((^~wire6) ?
              ((($signed(wire114) > wire113[(3'h5):(1'h1)]) ?
                  wire6 : ((wire5 ?
                      wire0 : wire113) > wire5[(4'h8):(3'h5)])) <<< wire111[(2'h3):(2'h3)]) : ((($unsigned(wire0) ?
                      (~^wire70) : wire1[(4'h8):(3'h7)]) < {{wire1},
                      (^~wire72)}) ?
                  $signed($signed(wire6[(3'h4):(1'h1)])) : {wire113[(2'h3):(1'h0)]}));
        end
      reg118 <= (~(~&wire70[(3'h5):(1'h1)]));
      reg119 <= wire2[(4'he):(3'h7)];
    end
  assign wire120 = $unsigned((wire6 ?
                       $signed($unsigned(((8'h9d) ^ wire72))) : wire112));
  assign wire121 = $signed($signed(($signed(reg119[(1'h1):(1'h0)]) + ($signed((8'h9c)) << wire1))));
  assign wire122 = {wire114[(1'h0):(1'h0)],
                       $unsigned((((wire112 ? wire70 : wire113) ?
                           (!wire109) : $unsigned(wire2)) ~^ ($signed(reg119) != (|wire120))))};
  assign wire123 = $signed((7'h40));
  always
    @(posedge clk) begin
      reg124 <= $signed(reg118[(1'h1):(1'h1)]);
      reg125 <= $signed((+$unsigned(wire107[(1'h0):(1'h0)])));
      reg126 <= $unsigned($signed((|$unsigned(wire72[(5'h12):(4'h8)]))));
    end
  assign wire127 = $signed($unsigned((8'hac)));
endmodule

module module73  (y, clk, wire78, wire77, wire76, wire75, wire74);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire78;
  input wire [(3'h5):(1'h0)] wire77;
  input wire [(5'h15):(1'h0)] wire76;
  input wire signed [(2'h2):(1'h0)] wire75;
  input wire signed [(3'h5):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire106;
  wire signed [(2'h2):(1'h0)] wire105;
  wire signed [(4'ha):(1'h0)] wire104;
  wire [(2'h2):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire102;
  wire signed [(4'he):(1'h0)] wire101;
  wire [(5'h13):(1'h0)] wire79;
  reg signed [(4'hc):(1'h0)] reg100 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(5'h12):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg [(2'h2):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(4'h8):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(5'h12):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg [(3'h5):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  reg [(4'hb):(1'h0)] reg83 = (1'h0);
  reg [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire79,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
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
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 (1'h0)};
  assign wire79 = (^(~(~^({wire76} ?
                      {wire76, wire77} : wire77[(3'h5):(3'h4)]))));
  always
    @(posedge clk) begin
      reg80 <= ($signed((wire77 >> wire78[(3'h4):(2'h3)])) ~^ $unsigned(((^((8'ha0) <= wire78)) ?
          $signed((^(8'hab))) : $unsigned(wire79[(3'h7):(1'h1)]))));
      if ({{wire74[(1'h0):(1'h0)]}, $signed(wire78)})
        begin
          reg81 <= wire75[(1'h1):(1'h0)];
          if ({((^wire76[(4'h8):(1'h1)]) ?
                  (+($unsigned(wire77) ?
                      (wire74 ^ (8'hbc)) : $unsigned(wire77))) : wire79)})
            begin
              reg82 <= wire79[(3'h4):(1'h1)];
              reg83 <= wire76[(3'h6):(3'h6)];
              reg84 <= wire78[(1'h1):(1'h1)];
            end
          else
            begin
              reg82 <= (($unsigned($signed((wire77 ?
                  wire75 : reg81))) - ({(~^reg83), $signed(reg81)} ?
                  $unsigned({reg83,
                      wire76}) : wire79[(5'h13):(4'hb)])) != (8'hbe));
              reg83 <= wire78;
            end
          reg85 <= (reg81[(3'h6):(3'h4)] ?
              (($unsigned((|wire74)) ?
                      (~^reg84[(4'h8):(4'h8)]) : wire75[(1'h0):(1'h0)]) ?
                  ((^~$unsigned(wire77)) ?
                      (-$unsigned((8'h9c))) : ((8'hb2) ?
                          (wire76 <= reg83) : (^(8'hb3)))) : (((^wire75) <<< (^wire77)) ?
                      $unsigned({wire79}) : (^~$signed(reg80)))) : wire76);
        end
      else
        begin
          reg81 <= (+(($signed((wire75 > wire78)) ?
              (&wire77) : reg84) || $unsigned(wire77[(1'h0):(1'h0)])));
        end
      reg86 <= {wire74};
      reg87 <= $signed((8'hbb));
      if ($unsigned(($unsigned(($unsigned(reg81) ?
              (!wire75) : $unsigned(wire75))) ?
          (reg82[(1'h0):(1'h0)] ?
              $signed((^reg86)) : wire78) : ($signed((wire77 ?
              (8'hab) : (8'ha2))) << $unsigned(reg82[(3'h6):(3'h4)])))))
        begin
          if ($signed({reg84, wire77}))
            begin
              reg88 <= $signed(reg84);
              reg89 <= $signed(reg87);
              reg90 <= (^(wire76[(5'h10):(4'hd)] & (&reg85)));
              reg91 <= reg87;
            end
          else
            begin
              reg88 <= reg90[(3'h4):(1'h0)];
              reg89 <= reg81;
              reg90 <= (reg82 ?
                  (8'hae) : (wire75[(1'h0):(1'h0)] >> ($unsigned(reg90) | ((reg85 ?
                          wire78 : reg87) ?
                      reg89 : reg80))));
            end
          if (({$unsigned((~|(reg87 ?
                  reg89 : reg82)))} >> ((reg85[(3'h4):(2'h3)] << ({(8'ha8)} == reg83[(4'hb):(3'h7)])) <<< $unsigned(($unsigned(reg87) <<< (wire78 ?
              reg85 : (8'ha1)))))))
            begin
              reg92 <= $signed(wire75);
              reg93 <= reg81;
              reg94 <= (^$unsigned((~^$unsigned(reg83))));
            end
          else
            begin
              reg92 <= $unsigned((+reg89[(2'h2):(1'h1)]));
              reg93 <= (((($signed((7'h44)) ? (reg84 == wire77) : (~&wire76)) ?
                          ((&reg87) | wire74[(2'h3):(2'h2)]) : $signed(reg84)) ?
                      ($signed((reg93 || wire79)) ?
                          reg85 : reg80[(2'h2):(1'h1)]) : reg89) ?
                  reg84 : (reg81 >>> ($unsigned((7'h42)) || wire75[(1'h1):(1'h0)])));
              reg94 <= ((reg81[(3'h6):(3'h6)] | $unsigned({{wire74,
                      reg83}})) < {$unsigned($signed((~|(8'hae))))});
            end
          if ({($unsigned($unsigned((&reg84))) ^ (reg94[(3'h7):(3'h5)] ?
                  $signed($unsigned(wire76)) : wire76))})
            begin
              reg95 <= ($unsigned({{(wire75 || reg86), reg84}}) ?
                  reg88[(3'h4):(2'h2)] : (reg90[(3'h5):(2'h3)] ?
                      reg85 : reg86));
              reg96 <= $signed($signed(((|reg81[(1'h1):(1'h1)]) ?
                  reg86 : wire74[(1'h0):(1'h0)])));
              reg97 <= $signed(((8'hbd) ?
                  reg91 : $unsigned(wire78[(2'h3):(1'h1)])));
              reg98 <= ({reg91} ?
                  $signed($unsigned(((^~reg90) && {reg89}))) : $unsigned({reg90}));
              reg99 <= $unsigned(wire75);
            end
          else
            begin
              reg95 <= (((reg86[(4'hd):(3'h7)] ?
                          $signed((^wire75)) : $signed((|reg99))) ?
                      (8'ha3) : (reg82 ~^ ($unsigned((8'had)) <= (~^reg98)))) ?
                  wire74 : reg87);
              reg96 <= $unsigned(reg88[(5'h10):(4'h9)]);
              reg97 <= ((wire76[(3'h7):(2'h2)] ?
                      (~^(&((8'hb7) - wire78))) : $unsigned(($unsigned(reg88) ~^ wire74[(1'h1):(1'h1)]))) ?
                  ((reg84 ?
                      (((8'ha3) ?
                          reg90 : reg82) >> $unsigned(reg99)) : $unsigned((|reg86))) ~^ ($signed((reg96 + reg89)) >>> reg85[(1'h0):(1'h0)])) : reg90);
              reg98 <= $signed(reg82[(5'h10):(4'hc)]);
              reg99 <= $unsigned((~$signed((reg98 + $unsigned(reg93)))));
            end
          reg100 <= (reg89 >> (((~^$signed(wire75)) * $unsigned(reg92)) + (8'haf)));
        end
      else
        begin
          reg88 <= $signed(reg88[(2'h3):(1'h1)]);
          reg89 <= $unsigned({$unsigned(($signed(reg97) ?
                  $unsigned(reg82) : reg81[(3'h5):(2'h3)]))});
        end
    end
  assign wire101 = ($unsigned(reg89) ?
                       ($signed($unsigned(wire79)) ?
                           $unsigned({(reg86 ?
                                   reg85 : (8'hb5))}) : wire78[(3'h4):(3'h4)]) : $signed($unsigned((8'hbb))));
  assign wire102 = $unsigned($signed($signed(((reg90 >> reg94) >>> {reg95,
                       reg84}))));
  assign wire103 = $signed((~^({reg90[(2'h3):(2'h2)]} ~^ $signed((wire75 < (8'hbc))))));
  assign wire104 = {({{$signed(wire79)}} ^~ $unsigned($unsigned(reg94[(1'h0):(1'h0)])))};
  assign wire105 = reg99[(4'ha):(3'h6)];
  assign wire106 = (|($unsigned((!{reg95, reg82})) | $unsigned({(^~reg93),
                       $unsigned(wire76)})));
endmodule

module module7  (y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire68;
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  assign y = {wire12,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire38,
                 wire40,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire68,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire12 = $unsigned(wire9[(4'hc):(2'h2)]);
  always
    @(posedge clk) begin
      reg13 <= (8'hae);
      reg14 <= $unsigned($signed($signed({(wire11 ? wire12 : (8'hb5)),
          wire10})));
      reg15 <= wire12;
      reg16 <= wire9[(5'h10):(5'h10)];
    end
  assign wire17 = (&$signed(reg15));
  assign wire18 = $signed(wire17);
  assign wire19 = $unsigned(($unsigned(reg14[(3'h4):(1'h1)]) ~^ ($signed($signed(wire11)) ?
                      $unsigned(reg16[(4'hb):(3'h5)]) : (((8'ha7) - wire8) | {(8'hae)}))));
  assign wire20 = (~|(~|$signed($unsigned($unsigned(wire18)))));
  assign wire21 = $unsigned((^$signed($unsigned((~^wire8)))));
  module22 #() modinst39 (.wire24(reg13), .y(wire38), .clk(clk), .wire23(wire19), .wire25(wire8), .wire26(wire10), .wire27(wire12));
  assign wire40 = wire8[(3'h4):(3'h4)];
  assign wire41 = ($unsigned(reg13) <<< {(~|$unsigned(wire17[(3'h4):(1'h1)])),
                      wire9});
  assign wire42 = (^$unsigned(wire9[(4'hc):(4'hc)]));
  assign wire43 = $unsigned(((wire41[(2'h2):(1'h1)] >= wire42[(2'h2):(2'h2)]) ?
                      ((~^$signed(wire10)) ?
                          (!(8'hb8)) : $signed((!wire8))) : (($signed(reg16) ^~ (reg14 == wire12)) != $signed(((8'hac) >= wire40)))));
  assign wire44 = wire12[(4'h9):(1'h1)];
  module45 #() modinst69 (wire68, clk, wire18, wire43, wire40, reg13);
endmodule

module module45
#(parameter param66 = (!{((|{(7'h41)}) ? (((8'hb7) ? (8'hb1) : (8'hab)) ? (+(8'hb0)) : ((8'hb9) ? (8'haa) : (8'hb3))) : ({(8'hbb)} ? (-(8'ha6)) : ((8'hbe) ? (8'h9c) : (8'hb0))))}), 
parameter param67 = (~&{param66}))
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire49;
  input wire [(5'h13):(1'h0)] wire48;
  input wire signed [(4'hc):(1'h0)] wire47;
  input wire signed [(4'ha):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire65;
  wire [(2'h3):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire63;
  wire [(4'ha):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire56;
  wire [(3'h4):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire51;
  wire [(3'h4):(1'h0)] wire50;
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire50 = $unsigned($signed($unsigned((wire46 ?
                      (|wire49) : (wire46 || wire46)))));
  assign wire51 = $signed({wire48});
  assign wire52 = (^(~wire51));
  assign wire53 = $unsigned(wire52);
  assign wire54 = $signed(wire46[(4'h8):(4'h8)]);
  assign wire55 = (wire50 ?
                      $signed((!(8'hbe))) : ((~^wire51) || wire52[(2'h3):(2'h2)]));
  assign wire56 = (wire46[(1'h0):(1'h0)] ?
                      (wire55 ^ wire55[(2'h2):(2'h2)]) : (^wire54[(2'h3):(2'h2)]));
  assign wire57 = $unsigned($signed($signed(wire46[(3'h6):(3'h5)])));
  always
    @(posedge clk) begin
      reg58 <= {(wire46 ? wire57 : wire54[(1'h1):(1'h1)]),
          $signed((((wire56 ? wire53 : wire55) ?
              wire54 : (wire53 ?
                  wire46 : wire50)) >= $unsigned((wire53 || wire54))))};
      reg59 <= ({{$signed({wire47})}} ? wire56 : $signed((!wire49)));
      reg60 <= wire49;
    end
  assign wire61 = ((~|$signed(({wire47, (7'h44)} ?
                      reg60 : (wire56 < wire52)))) <= (^~$unsigned((7'h44))));
  assign wire62 = $unsigned((wire54 ?
                      reg58[(3'h7):(3'h6)] : $unsigned($unsigned((!reg60)))));
  assign wire63 = ($unsigned((8'hb4)) * $signed((~&wire51[(3'h5):(2'h3)])));
  assign wire64 = reg58;
  assign wire65 = ($unsigned(wire56) ? reg58 : (~&(!(~&(~^wire56)))));
endmodule

module module22
#(parameter param36 = ((^((((8'h9e) ~^ (8'hb9)) ? ((8'ha6) ? (8'ha4) : (8'ha8)) : ((8'ha3) ? (8'hb0) : (8'haa))) ? (((8'had) ? (7'h41) : (8'hb5)) != {(8'hb1)}) : (8'ha0))) ^ ((((8'ha9) ? ((8'ha7) ? (8'hab) : (8'hb6)) : {(8'hb5)}) <<< (((8'hbf) != (8'hb2)) ? ((8'haa) ? (8'haf) : (8'haf)) : (8'ha2))) << {(8'ha2)})), 
parameter param37 = (~&(8'hab)))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire27;
  input wire [(2'h2):(1'h0)] wire26;
  input wire [(3'h6):(1'h0)] wire25;
  input wire [(4'h9):(1'h0)] wire24;
  input wire signed [(5'h12):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire28;
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 (1'h0)};
  assign wire28 = $signed(($unsigned(($unsigned(wire23) != {wire26})) ?
                      $unsigned($signed((~wire27))) : $unsigned((|$unsigned(wire24)))));
  assign wire29 = wire25;
  assign wire30 = $signed(wire29);
  assign wire31 = ((wire24 << wire27[(4'he):(4'he)]) || wire24[(1'h1):(1'h1)]);
  assign wire32 = {wire29, wire28};
  assign wire33 = {wire26[(1'h0):(1'h0)], (wire27 | wire32[(5'h10):(4'h8)])};
  assign wire34 = wire25[(3'h4):(2'h3)];
  assign wire35 = (~&wire31);
endmodule
