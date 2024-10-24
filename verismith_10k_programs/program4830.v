module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire114;
  wire signed [(5'h15):(1'h0)] wire112;
  wire signed [(5'h12):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg5 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire114,
                 wire112,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire4,
                 reg5,
                 reg6,
                 (1'h0)};
  assign wire4 = $signed((^~(~&$unsigned((wire0 ? wire1 : wire0)))));
  always
    @(posedge clk) begin
      reg5 <= (~|$unsigned({$signed($unsigned((8'hbb)))}));
      reg6 <= ($signed((&wire1[(3'h7):(1'h0)])) ?
          (wire2 ? (~|wire1[(3'h7):(3'h4)]) : wire3) : ($unsigned(wire0) ?
              (wire1 || $unsigned({wire3,
                  (8'h9c)})) : $signed($unsigned(wire0))));
    end
  assign wire7 = ($signed(((wire3[(3'h4):(3'h4)] && $signed(wire4)) ?
                     wire1 : reg6[(1'h0):(1'h0)])) & reg6[(1'h1):(1'h1)]);
  assign wire8 = reg6;
  assign wire9 = (($unsigned(wire8[(4'hf):(4'h9)]) ?
                     $unsigned(reg5) : (|wire8[(4'hb):(1'h0)])) == ($unsigned(wire4[(4'hf):(4'ha)]) << ((-(wire1 && reg5)) || (!reg6[(4'h9):(2'h2)]))));
  assign wire10 = wire1[(3'h4):(1'h0)];
  assign wire11 = (($signed($signed($signed((8'haa)))) - ((wire10[(3'h5):(3'h4)] ?
                          $signed(wire4) : {wire0}) ?
                      (8'haf) : ($unsigned(wire1) ?
                          wire2[(3'h5):(1'h1)] : {wire8}))) && (^~wire3));
  assign wire12 = (!(~&$unsigned($signed($unsigned((7'h44))))));
  assign wire13 = (|(wire11 == {((wire10 ? wire10 : wire10) ?
                          wire3[(5'h11):(5'h11)] : $signed(wire4)),
                      $unsigned(wire11[(3'h5):(3'h5)])}));
  module14 #() modinst113 (.wire18(wire9), .wire15(wire2), .clk(clk), .wire16(reg5), .y(wire112), .wire17(wire4), .wire19(wire10));
  assign wire114 = (+(~|{((8'hb3) ?
                           (wire2 ? (8'had) : wire13) : $unsigned(wire2))}));
endmodule

module module14
#(parameter param110 = {{((+(|(8'ha9))) ? ({(8'hbf)} ? (~&(8'hbd)) : (~|(8'hbc))) : (~&((8'hac) + (8'had)))), (&{((8'hae) + (7'h41))})}, ({(8'ha7), {{(8'had), (8'ha5)}}} ^ ((((8'hb4) << (8'haa)) || ((8'hbd) ? (8'ha0) : (8'haa))) >> (8'hac)))}, 
parameter param111 = (&(~(((^~param110) ? param110 : (param110 ~^ param110)) <= ((param110 | param110) ? param110 : (&(8'hb4)))))))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire19;
  input wire signed [(5'h12):(1'h0)] wire18;
  input wire [(3'h5):(1'h0)] wire17;
  input wire [(4'h8):(1'h0)] wire16;
  input wire signed [(5'h11):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire109;
  wire [(3'h5):(1'h0)] wire108;
  wire [(2'h2):(1'h0)] wire107;
  wire [(4'hd):(1'h0)] wire106;
  wire signed [(3'h6):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire54;
  wire signed [(4'ha):(1'h0)] wire66;
  wire signed [(4'hb):(1'h0)] wire67;
  wire [(5'h13):(1'h0)] wire68;
  wire signed [(3'h5):(1'h0)] wire104;
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire49,
                 wire22,
                 wire21,
                 wire20,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire66,
                 wire67,
                 wire68,
                 wire104,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 (1'h0)};
  assign wire20 = (wire17 ?
                      $signed(((wire18 >> wire17) ?
                          $unsigned(((8'hb1) * wire16)) : wire17[(1'h1):(1'h1)])) : wire18);
  assign wire21 = wire16[(1'h1):(1'h0)];
  assign wire22 = wire15;
  module23 #() modinst50 (.wire27(wire20), .y(wire49), .wire25(wire17), .wire28(wire21), .wire24(wire15), .clk(clk), .wire26(wire18));
  assign wire51 = wire19[(2'h3):(2'h2)];
  assign wire52 = (~^$unsigned(wire21[(3'h4):(1'h0)]));
  assign wire53 = $signed((({$unsigned(wire17)} >= ((wire19 | wire18) > {wire21})) && $unsigned($unsigned($unsigned(wire49)))));
  assign wire54 = {wire21[(1'h0):(1'h0)],
                      $signed((+((wire22 ? (8'hb8) : wire53) ?
                          (|(8'ha6)) : $signed(wire22))))};
  always
    @(posedge clk) begin
      reg55 <= (~^(-wire53));
      reg56 <= $signed({(8'hb8)});
      reg57 <= (8'ha5);
      reg58 <= {$signed((+$signed($unsigned(wire53)))),
          (($unsigned(reg57[(3'h4):(3'h4)]) ?
                  $unsigned((wire21 ~^ (8'had))) : wire15) ?
              wire17 : $signed(((wire54 >= wire21) || (8'ha0))))};
      if ($unsigned($unsigned(reg55)))
        begin
          reg59 <= (wire54[(4'h8):(1'h1)] >>> (((&(wire21 >> wire17)) ?
                  ((wire22 ? wire19 : wire52) ?
                      (wire51 ?
                          wire15 : wire19) : wire49[(2'h2):(2'h2)]) : wire18) ?
              {(8'ha7)} : (~|(reg58 ? ((8'haa) ? wire19 : wire15) : wire49))));
          reg60 <= ((wire20 && (!{wire21[(4'hf):(4'he)]})) >> ($signed(reg55) >>> wire16[(1'h0):(1'h0)]));
        end
      else
        begin
          if ({$unsigned(wire53[(1'h1):(1'h1)]), wire52})
            begin
              reg59 <= $unsigned(wire53[(3'h4):(3'h4)]);
            end
          else
            begin
              reg59 <= (($signed(wire17) ?
                      (((wire49 < wire54) ?
                          wire15[(4'hb):(4'hb)] : (wire54 || reg60)) ~^ ((wire15 != (8'hb8)) ?
                          wire54[(1'h1):(1'h0)] : {wire53,
                              wire51})) : ($signed((reg59 ?
                          (8'hb2) : (7'h40))) >> ({wire51, wire54} && (reg56 ?
                          reg58 : wire16)))) ?
                  wire17 : (($signed((^wire20)) & (+$signed(reg56))) ?
                      $signed(((reg59 ? (8'h9c) : reg55) ?
                          $unsigned(reg58) : {reg57})) : ((wire15 ?
                          $signed((8'ha2)) : $unsigned(wire22)) && $signed(((8'ha8) > wire17)))));
              reg60 <= {wire16[(2'h3):(2'h2)],
                  {$unsigned((reg57 ? ((8'ha3) * wire20) : ((8'h9c) ^ reg58))),
                      (((^~wire54) ? (|wire22) : $unsigned(wire21)) ?
                          ($unsigned((8'hbe)) ?
                              ((8'hb6) >= reg57) : $unsigned(wire54)) : (!reg59[(2'h2):(1'h0)]))}};
              reg61 <= wire49[(3'h5):(3'h5)];
            end
          reg62 <= (^wire20);
          reg63 <= wire53[(2'h3):(2'h2)];
          reg64 <= wire19;
          reg65 <= wire49[(3'h6):(1'h1)];
        end
    end
  assign wire66 = (~$signed((8'hac)));
  assign wire67 = reg60;
  assign wire68 = (^~$signed((~((reg64 ? wire54 : reg59) | $unsigned(reg59)))));
  module69 #() modinst105 (.wire71(wire22), .clk(clk), .y(wire104), .wire70(wire52), .wire72(wire16), .wire73(reg58));
  assign wire106 = $unsigned(wire54[(4'h9):(3'h7)]);
  assign wire107 = $unsigned($unsigned(reg65[(4'h8):(3'h5)]));
  assign wire108 = wire51[(2'h2):(1'h0)];
  assign wire109 = wire108;
endmodule

module module69  (y, clk, wire73, wire72, wire71, wire70);
  output wire [(32'h1b7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire73;
  input wire signed [(3'h5):(1'h0)] wire72;
  input wire [(5'h10):(1'h0)] wire71;
  input wire [(2'h3):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire signed [(3'h6):(1'h0)] wire77;
  wire [(3'h7):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire75;
  wire signed [(5'h10):(1'h0)] wire74;
  reg signed [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(5'h12):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(4'hd):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg [(5'h12):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg78 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 reg103,
                 reg102,
                 reg101,
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
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire74 = ((!$unsigned((8'hb1))) - (wire71[(4'h9):(3'h6)] >> $signed(wire73[(3'h7):(1'h1)])));
  assign wire75 = $unsigned((^$signed(((^wire70) > wire70[(1'h1):(1'h1)]))));
  assign wire76 = (wire74 & {wire72[(1'h0):(1'h0)]});
  assign wire77 = (8'ha3);
  always
    @(posedge clk) begin
      if (wire70[(2'h2):(1'h1)])
        begin
          reg78 <= wire76;
          reg79 <= wire75;
        end
      else
        begin
          reg78 <= wire74[(4'hd):(1'h1)];
          if (wire77)
            begin
              reg79 <= (&{(~$unsigned(wire73[(4'ha):(1'h0)])), (7'h43)});
              reg80 <= (&wire75);
              reg81 <= $signed(wire72[(2'h2):(1'h1)]);
              reg82 <= wire75[(3'h5):(3'h5)];
              reg83 <= ((!reg81[(3'h7):(1'h1)]) && $unsigned((+{reg82})));
            end
          else
            begin
              reg79 <= ((wire73 ?
                      (reg82 ?
                          $unsigned(wire75[(4'h9):(3'h7)]) : (7'h43)) : (~|wire76[(1'h0):(1'h0)])) ?
                  ((({reg81} > (wire76 & reg80)) | ($signed(reg82) < wire75)) <<< $unsigned($signed((~&reg79)))) : ($signed((-(reg80 < wire76))) == $unsigned(($signed((8'h9d)) ?
                      reg82[(5'h12):(4'h8)] : $signed(wire71)))));
              reg80 <= (+((!((^reg81) ? (-reg81) : reg78[(4'he):(3'h5)])) ?
                  reg80[(4'hc):(4'hc)] : (reg83[(2'h2):(1'h0)] ?
                      ((!wire76) >>> $unsigned((8'hb0))) : ((~^(8'hb8)) >>> {wire72}))));
              reg81 <= (~|{wire77[(1'h1):(1'h1)]});
              reg82 <= $signed((reg83 ?
                  $unsigned((~|((8'hb5) ?
                      wire70 : wire76))) : $signed(((wire74 >>> wire74) < reg78[(4'h9):(4'h8)]))));
              reg83 <= wire71[(4'hb):(1'h1)];
            end
        end
      reg84 <= $unsigned({{(reg80 ? wire74[(4'h8):(3'h4)] : (reg83 > reg79))}});
    end
  assign wire85 = $unsigned(($signed({$unsigned(reg78),
                      (reg80 ?
                          reg80 : wire76)}) && $unsigned($unsigned(reg83))));
  assign wire86 = ((!(($unsigned(reg82) + reg78[(4'h9):(3'h4)]) >= {{(8'ha1),
                              wire71},
                          (wire76 >= (8'ha8))})) ?
                      {wire85[(5'h13):(3'h5)]} : $signed($signed({(wire72 ^ (8'ha4))})));
  always
    @(posedge clk) begin
      reg87 <= ((-((&(reg82 ^~ reg82)) >= reg78[(4'ha):(1'h0)])) ?
          wire76[(3'h7):(3'h4)] : reg80);
      reg88 <= ((~&wire77) ?
          ($signed((-$unsigned(wire86))) ?
              $signed($unsigned((reg83 ?
                  (8'h9c) : wire86))) : $signed($unsigned((~^(8'ha6))))) : (8'ha2));
    end
  always
    @(posedge clk) begin
      reg89 <= $unsigned({(($unsigned(wire70) ~^ $unsigned(wire75)) > reg81)});
      if ((((($signed(wire74) <<< $unsigned(reg84)) != reg89) ?
          $signed($signed(wire74)) : reg87[(2'h3):(1'h0)]) ^ $unsigned(reg87)))
        begin
          reg90 <= ({{(~|reg82[(3'h6):(3'h6)]),
                      ((~wire73) ? reg84[(4'hb):(4'ha)] : (|wire73))},
                  $unsigned((+((7'h41) << reg84)))} ?
              (((~^((8'ha3) ?
                  reg87 : wire86)) & (~^(|reg89))) != (wire71[(4'hf):(4'hb)] >= (wire72 ?
                  $unsigned((8'hbe)) : (!(8'hb2))))) : (reg89[(4'he):(3'h4)] ?
                  $signed($unsigned((|reg87))) : $unsigned(reg81)));
          if (wire85[(4'hd):(3'h6)])
            begin
              reg91 <= $unsigned($signed({(&$unsigned(reg89)), reg81}));
            end
          else
            begin
              reg91 <= $signed((wire85 ? wire85 : wire72));
              reg92 <= wire72[(3'h5):(3'h5)];
              reg93 <= wire71;
              reg94 <= reg92;
              reg95 <= ((~^$signed($signed((wire74 == reg80)))) ^ (~($unsigned(wire85) > {{(8'haa),
                      reg89},
                  wire71})));
            end
          reg96 <= wire75;
          if ($unsigned($signed($signed(reg90))))
            begin
              reg97 <= (~|(((~(~|reg94)) == $unsigned(reg96)) ?
                  reg82 : (-reg84)));
              reg98 <= (((+wire77) + (reg97 ?
                      (((7'h40) ~^ wire70) >> (reg84 <= wire72)) : (reg96[(4'ha):(3'h7)] == (reg93 << reg88)))) ?
                  (((reg91 ?
                      (wire73 ?
                          reg80 : wire73) : {reg79}) ^ reg81) && wire86) : (+wire71));
            end
          else
            begin
              reg97 <= (reg78[(4'he):(3'h7)] & $unsigned(reg98[(3'h4):(3'h4)]));
            end
          reg99 <= reg78;
        end
      else
        begin
          if ($unsigned(wire70[(1'h1):(1'h1)]))
            begin
              reg90 <= reg95[(4'hc):(4'hc)];
              reg91 <= reg89;
            end
          else
            begin
              reg90 <= {{(^~{reg80[(2'h2):(1'h1)]})}, (7'h40)};
              reg91 <= (&(7'h40));
              reg92 <= (((reg83[(1'h0):(1'h0)] + ((^~reg96) ^~ (~wire70))) - $unsigned(((reg95 ?
                          wire74 : reg89) ?
                      (~^reg93) : (!reg89)))) ?
                  $unsigned(reg99) : reg82);
              reg93 <= {reg89[(3'h6):(2'h2)],
                  ((~((~wire73) ? (wire76 ? wire74 : wire71) : wire86)) ?
                      ({(~wire74),
                          $signed(reg81)} ^~ $signed($unsigned(reg79))) : reg99)};
            end
        end
    end
  always
    @(posedge clk) begin
      if ((7'h42))
        begin
          if ($signed($unsigned($unsigned(({reg84, reg90} <= {reg78})))))
            begin
              reg100 <= wire71[(4'he):(4'he)];
              reg101 <= reg83;
              reg102 <= (((|($unsigned(reg80) ?
                      (reg100 ? reg84 : (7'h43)) : (reg98 ?
                          (8'hab) : reg90))) ^ wire72[(1'h1):(1'h0)]) ?
                  (&$unsigned(reg81)) : (!$unsigned(reg79[(4'hb):(3'h7)])));
              reg103 <= $signed((reg91 ?
                  (reg79 ?
                      ($unsigned(reg94) || (wire86 ?
                          reg100 : reg93)) : wire85) : (reg90[(4'he):(4'ha)] ?
                      $signed((~&wire86)) : $unsigned({wire86, reg101}))));
            end
          else
            begin
              reg100 <= (reg97 >= (~$unsigned((reg100 <= ((8'ha9) ^ wire77)))));
              reg101 <= $unsigned($signed({(^((7'h44) ? reg89 : reg79)),
                  $unsigned(reg88)}));
              reg102 <= (reg99[(2'h3):(1'h1)] <= reg95[(3'h5):(3'h4)]);
            end
        end
      else
        begin
          reg100 <= reg98;
          reg101 <= (8'ha4);
          reg102 <= $signed(($signed((-reg81[(1'h0):(1'h0)])) ?
              $signed($unsigned({reg83})) : (wire71 ?
                  ($signed(reg79) & $unsigned(wire73)) : $signed($signed(wire77)))));
          reg103 <= (|(~|$unsigned($signed(reg79[(3'h7):(2'h3)]))));
        end
    end
endmodule

module module23
#(parameter param47 = ((~|((((8'hae) && (7'h40)) ? ((7'h42) ? (8'ha1) : (8'hae)) : ((8'hb8) || (8'ha1))) ? ((~&(8'hac)) ? ((8'ha2) ^~ (8'hb9)) : ((8'hb8) ? (8'h9c) : (8'hab))) : {((7'h44) ? (7'h43) : (8'hbb))})) ? (((&((8'hb8) != (8'ha1))) + (~&((8'ha0) ? (8'haa) : (8'ha2)))) ? (({(8'hb5)} ^ ((8'h9f) ? (8'hab) : (8'haf))) ? ((|(8'hb4)) <<< ((8'hb9) > (7'h42))) : (!(&(8'hb6)))) : (!(~&(~|(7'h43))))) : ((({(8'hb9)} & ((7'h40) >>> (8'ha7))) * (&((8'hac) ~^ (8'hab)))) ? (7'h42) : ((^((8'ha6) <<< (8'h9c))) < ({(8'hbd)} ? {(8'hbe), (7'h40)} : (~(8'hb9)))))), 
parameter param48 = (({{{param47, (8'hbd)}}, ((^param47) < (param47 ? param47 : (8'ha1)))} ? (((param47 - (7'h41)) | (param47 ? (8'h9c) : param47)) ? (8'hae) : (+{param47, param47})) : (8'h9c)) ~^ {param47}))
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire28;
  input wire signed [(4'hf):(1'h0)] wire27;
  input wire signed [(5'h12):(1'h0)] wire26;
  input wire signed [(3'h4):(1'h0)] wire25;
  input wire signed [(4'h9):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire29;
  reg [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  assign y = {wire46,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire29,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire29 = (8'hbb);
  always
    @(posedge clk) begin
      reg30 <= $unsigned(wire27);
      reg31 <= {(^~$unsigned((&(wire24 ? wire29 : wire24))))};
      reg32 <= wire25;
      reg33 <= wire28[(1'h1):(1'h0)];
      reg34 <= wire28[(1'h1):(1'h0)];
    end
  assign wire35 = $signed(((reg32[(2'h3):(1'h0)] != ((reg30 ?
                      reg33 : wire27) == $signed(wire29))) + $unsigned(reg33)));
  assign wire36 = $signed($unsigned(($signed(wire26) > {(wire24 ?
                          reg31 : wire29),
                      $signed(wire26)})));
  assign wire37 = $signed(wire26);
  assign wire38 = (({{$unsigned(wire28), (reg32 ? (8'h9f) : wire26)}} ?
                          wire35[(4'ha):(1'h1)] : wire25) ?
                      $signed(((~^$unsigned(wire27)) ?
                          reg31 : $unsigned((&(8'hab))))) : $signed($signed($signed(wire25[(1'h0):(1'h0)]))));
  assign wire39 = wire37;
  assign wire40 = {(8'ha2), $unsigned(reg32)};
  assign wire41 = $unsigned(wire35);
  always
    @(posedge clk) begin
      reg42 <= wire28[(2'h2):(1'h1)];
      reg43 <= (reg33 ?
          (!(^$signed((|(8'hbe))))) : {((|$unsigned(wire41)) >>> $unsigned(reg33[(2'h2):(1'h0)])),
              (!((^~reg33) | (reg33 ^~ reg34)))});
      reg44 <= $unsigned($signed((8'ha2)));
      reg45 <= {(($signed((8'hb7)) ?
              ((reg43 > reg30) != $unsigned(reg32)) : ({wire38,
                  reg32} * $signed(wire39))) << {$signed(wire29[(2'h2):(1'h1)]),
              $unsigned((+wire40))}),
          wire39[(3'h4):(2'h3)]};
    end
  assign wire46 = $unsigned(((&{(!wire41), wire40[(1'h0):(1'h0)]}) ?
                      $unsigned((!$unsigned(wire28))) : {($unsigned(wire36) ?
                              wire25[(2'h3):(2'h3)] : $unsigned((8'hb4)))}));
endmodule
