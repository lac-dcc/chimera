module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire132;
  wire [(3'h7):(1'h0)] wire130;
  wire [(4'hd):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  assign y = {wire132,
                 wire130,
                 wire63,
                 wire14,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire5 = ($signed((wire2 * wire1[(3'h7):(2'h3)])) | (wire0[(1'h1):(1'h1)] & (^$signed(wire1))));
  assign wire6 = (^~wire2[(4'h8):(2'h2)]);
  assign wire7 = (&$signed(wire1));
  assign wire8 = (wire4[(4'hb):(2'h3)] ?
                     ($unsigned($signed((~^wire6))) ^ (-$unsigned((8'hba)))) : $signed({(7'h40)}));
  always
    @(posedge clk) begin
      reg9 <= $signed($signed(wire7[(4'hb):(3'h7)]));
      reg10 <= (|(~^wire3[(1'h1):(1'h0)]));
      if ((((($signed(wire8) ? (8'h9d) : wire1[(4'h9):(1'h0)]) ?
          $unsigned({wire4}) : (wire7[(4'h9):(2'h2)] ?
              (~&wire4) : $signed(wire5))) + {((^wire1) ?
              (~&(8'h9c)) : {wire4}),
          (~|(reg10 ? wire7 : wire4))}) ^ ((8'hbe) ?
          $signed($signed(reg10[(2'h2):(2'h2)])) : $signed(((wire3 || wire5) ?
              $unsigned(wire1) : ((8'hbb) ? (8'hba) : wire3))))))
        begin
          reg11 <= (|{$unsigned({{(8'hb8)}}),
              ((!(~&reg10)) ? wire8[(1'h1):(1'h1)] : wire3[(4'hb):(3'h6)])});
          reg12 <= ($signed($unsigned(wire7[(3'h6):(2'h2)])) ?
              (8'hb9) : ((^~($unsigned(wire3) ? wire2 : $signed(wire5))) ?
                  (((wire7 > (8'hb7)) * {wire6}) ?
                      reg10[(2'h2):(1'h1)] : $signed($unsigned(wire4))) : wire2[(3'h5):(1'h1)]));
          reg13 <= (8'hb4);
        end
      else
        begin
          if (reg11)
            begin
              reg11 <= $unsigned(wire3);
              reg12 <= wire3[(2'h2):(1'h0)];
              reg13 <= wire4;
            end
          else
            begin
              reg11 <= {$unsigned((wire4[(4'hc):(3'h7)] ?
                      $unsigned((wire1 > wire8)) : (|wire6)))};
            end
        end
    end
  assign wire14 = $unsigned((wire5[(1'h1):(1'h0)] ?
                      ($signed(reg9) ?
                          (+$unsigned(wire2)) : $signed({wire5,
                              reg13})) : (((~|wire0) != (+reg10)) ?
                          (wire3 <<< $signed((8'ha2))) : (+reg11[(1'h0):(1'h0)]))));
  module15 #() modinst64 (.clk(clk), .wire16(wire6), .wire19(wire2), .wire17(wire4), .wire18(wire5), .y(wire63));
  module65 #() modinst131 (.y(wire130), .wire69(reg11), .wire70(wire0), .wire68(wire1), .clk(clk), .wire67(wire7), .wire66(wire2));
  assign wire132 = $unsigned($signed($signed($unsigned(wire63[(3'h4):(3'h4)]))));
endmodule

module module65
#(parameter param129 = ((8'hbc) ? (+((((8'hb6) ? (7'h43) : (8'ha4)) && ((7'h41) ? (8'hbf) : (7'h40))) == (8'h9d))) : (((~&(|(8'hb1))) == (((8'ha0) >> (7'h40)) - {(8'hb5), (8'ha8)})) == ((~((8'h9f) ? (8'hb0) : (8'h9e))) || (((8'ha4) ? (8'ha7) : (8'hbc)) >>> (^(8'hac)))))))
(y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h1b2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire70;
  input wire signed [(3'h5):(1'h0)] wire69;
  input wire signed [(3'h5):(1'h0)] wire68;
  input wire signed [(3'h5):(1'h0)] wire67;
  input wire signed [(3'h6):(1'h0)] wire66;
  wire [(2'h2):(1'h0)] wire128;
  wire [(4'hc):(1'h0)] wire127;
  wire signed [(4'hd):(1'h0)] wire126;
  wire [(3'h6):(1'h0)] wire122;
  wire [(3'h4):(1'h0)] wire121;
  wire signed [(4'h9):(1'h0)] wire120;
  wire signed [(5'h15):(1'h0)] wire119;
  wire [(3'h6):(1'h0)] wire112;
  wire signed [(4'hc):(1'h0)] wire111;
  wire [(5'h11):(1'h0)] wire109;
  wire signed [(5'h14):(1'h0)] wire89;
  wire [(4'h9):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire71;
  reg signed [(5'h10):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg124 = (1'h0);
  reg [(4'hb):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg118 = (1'h0);
  reg [(4'hd):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg [(5'h12):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire112,
                 wire111,
                 wire109,
                 wire89,
                 wire88,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 reg125,
                 reg124,
                 reg123,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 (1'h0)};
  assign wire71 = (wire69[(1'h0):(1'h0)] ?
                      ((^(|(8'hb7))) ?
                          wire69[(3'h4):(3'h4)] : $unsigned(($unsigned(wire70) >> wire69))) : $unsigned((wire69[(2'h3):(1'h0)] >>> $signed((7'h42)))));
  assign wire72 = (&wire71[(5'h12):(2'h3)]);
  assign wire73 = (wire69[(1'h0):(1'h0)] ?
                      {wire69[(1'h1):(1'h1)]} : wire71[(5'h12):(4'hb)]);
  assign wire74 = wire66;
  always
    @(posedge clk) begin
      if ($signed(wire73))
        begin
          if ($signed(({wire67, wire73} ?
              $signed(wire68[(3'h4):(3'h4)]) : wire71)))
            begin
              reg75 <= ($signed(wire73[(3'h4):(1'h1)]) ~^ (~^wire71));
            end
          else
            begin
              reg75 <= ((((^{(8'hb9), wire72}) ?
                  wire69 : $unsigned((+wire71))) >>> $unsigned((wire70 ?
                  $signed(wire69) : $unsigned(wire72)))) >= $signed($signed(($unsigned(reg75) && (wire67 ?
                  wire72 : (8'had))))));
              reg76 <= $unsigned($signed((wire66 | $unsigned((wire66 >> wire69)))));
              reg77 <= $unsigned(wire66[(2'h2):(1'h1)]);
              reg78 <= wire66[(3'h5):(1'h0)];
              reg79 <= ($unsigned(($signed((wire73 ? wire74 : wire69)) ?
                      (wire73[(4'hc):(3'h7)] ?
                          $unsigned(wire69) : $unsigned(reg77)) : ((wire73 * wire70) ?
                          (^wire66) : wire71))) ?
                  wire70[(4'h8):(1'h0)] : ($unsigned(wire74) ?
                      {(^~(~^reg78))} : (~({wire66} ?
                          $signed(wire70) : (wire74 ? wire68 : wire70)))));
            end
          if (wire73[(4'hb):(1'h0)])
            begin
              reg80 <= (($signed((~(-reg79))) ?
                      ($signed((wire73 & wire72)) * {(^reg79),
                          (wire70 ?
                              wire73 : wire67)}) : wire74[(4'hb):(3'h6)]) ?
                  ($signed({wire71}) ?
                      {({wire74} ?
                              ((7'h41) == reg79) : (^~reg77))} : (($signed(reg79) * $signed(reg78)) ?
                          $unsigned($signed(wire73)) : wire68[(2'h3):(1'h0)])) : ($unsigned($unsigned(reg78[(1'h1):(1'h1)])) ?
                      reg79[(3'h5):(1'h0)] : ((~{reg79}) <= ((~&wire72) >> {wire71,
                          wire68}))));
              reg81 <= (|wire67);
              reg82 <= {(&(~&(reg81 > wire66)))};
            end
          else
            begin
              reg80 <= ((+$signed((+(wire67 ? reg75 : wire73)))) ?
                  ($signed((^~(reg82 ? (7'h42) : wire68))) ?
                      $signed($signed($signed(reg79))) : reg80) : {$signed((|reg82)),
                      wire69});
              reg81 <= reg75[(1'h0):(1'h0)];
              reg82 <= (($unsigned(((^(7'h42)) ~^ $unsigned(wire69))) < $signed((wire68 ^~ (&reg76)))) ?
                  (^(reg80[(3'h4):(1'h0)] > $unsigned((^~wire70)))) : $signed((($signed(wire68) * (reg78 ?
                          reg82 : wire71)) ?
                      ((|wire70) ?
                          reg82[(4'h8):(3'h7)] : ((8'hbf) != reg76)) : reg77[(5'h10):(4'h8)])));
            end
        end
      else
        begin
          reg75 <= (reg75[(2'h3):(1'h0)] ?
              (~$unsigned((&((8'ha3) == wire70)))) : (8'h9d));
          reg76 <= $signed((({$unsigned(wire69)} ?
              $unsigned($signed(reg82)) : {$unsigned((8'hbb))}) || reg77[(2'h3):(2'h3)]));
          reg77 <= {(+reg79)};
          reg78 <= $signed((reg80[(4'hf):(1'h0)] ^~ (!$unsigned($signed(wire68)))));
        end
      if (wire74[(1'h1):(1'h0)])
        begin
          reg83 <= (^~reg79);
        end
      else
        begin
          reg83 <= (!(8'hb2));
          reg84 <= reg83;
          reg85 <= $signed($signed(($unsigned($signed(wire70)) * $signed((8'ha3)))));
          reg86 <= $signed((reg85[(2'h2):(2'h2)] ?
              (|$signed((~^wire72))) : ($signed({reg81}) <<< (|{reg82}))));
        end
      reg87 <= (&(~&wire70[(3'h6):(3'h5)]));
    end
  assign wire88 = {((reg85 ?
                          (-reg81) : $unsigned((~^wire70))) + ($unsigned($unsigned((8'hb4))) ^~ $signed($unsigned(reg79))))};
  assign wire89 = $unsigned(wire70);
  module90 #() modinst110 (.wire93(wire71), .wire92(reg77), .clk(clk), .y(wire109), .wire95(reg83), .wire94(reg82), .wire91(wire66));
  assign wire111 = {$signed((wire109[(3'h6):(1'h1)] >= {{reg82},
                           ((8'h9d) ^~ reg78)}))};
  assign wire112 = reg78;
  always
    @(posedge clk) begin
      reg113 <= wire109;
      if ((-({($signed(wire112) ^~ $unsigned(reg77))} ?
          $signed(wire66) : wire70[(1'h0):(1'h0)])))
        begin
          reg114 <= wire69[(1'h1):(1'h1)];
          reg115 <= (reg114[(2'h3):(2'h2)] || $signed($signed(wire72[(1'h1):(1'h1)])));
        end
      else
        begin
          reg114 <= ({wire68[(3'h4):(2'h3)], ((7'h40) | reg85)} ?
              $signed({(8'hb1),
                  reg84[(3'h6):(1'h0)]}) : $signed($unsigned(reg115)));
        end
      reg116 <= {(!{$signed($signed(wire66)), wire66}),
          $signed(($signed({wire70}) ?
              ($signed(reg82) | (reg86 ~^ (8'ha5))) : ($signed(reg114) ?
                  wire112 : (~^wire112))))};
      reg117 <= reg84;
      reg118 <= ({$signed($unsigned($unsigned(wire88))),
          wire88[(1'h1):(1'h1)]} >>> wire66[(3'h6):(3'h4)]);
    end
  assign wire119 = $unsigned($unsigned($signed(reg114[(1'h1):(1'h1)])));
  assign wire120 = $unsigned($signed((|$signed($signed(reg76)))));
  assign wire121 = wire74;
  assign wire122 = $signed($signed(reg85));
  always
    @(posedge clk) begin
      reg123 <= $signed(reg79[(5'h12):(5'h11)]);
      reg124 <= ({($unsigned({wire74, wire70}) ?
                  {(reg113 <= (7'h41)), $signed(reg78)} : {$signed(reg80)}),
              (($unsigned(reg80) ?
                  {wire120,
                      wire74} : reg75) <<< $signed(reg85[(2'h2):(2'h2)]))} ?
          wire74 : (wire112 != {$signed({reg114, (8'hb9)})}));
      reg125 <= $signed((-$signed($unsigned(reg81))));
    end
  assign wire126 = wire119;
  assign wire127 = wire120[(3'h4):(1'h1)];
  assign wire128 = $signed(reg75);
endmodule

module module15
#(parameter param62 = {(-(({(8'ha3)} ? {(8'ha4)} : (&(8'hb6))) ? (!(8'h9c)) : (~&((8'ha4) || (8'h9d)))))})
(y, clk, wire16, wire17, wire18, wire19);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire16;
  input wire [(3'h6):(1'h0)] wire17;
  input wire [(3'h5):(1'h0)] wire18;
  input wire [(4'hb):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire61;
  wire [(5'h11):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire24;
  wire signed [(4'hd):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire58;
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire30,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire58,
                 reg27,
                 reg28,
                 reg29,
                 reg31,
                 (1'h0)};
  assign wire20 = ($signed($unsigned({(wire18 & (7'h41))})) ?
                      $unsigned((wire18[(1'h1):(1'h0)] != wire19)) : (($unsigned(wire17[(3'h5):(2'h3)]) == (-(wire18 || wire19))) ?
                          $unsigned({wire17[(1'h1):(1'h1)],
                              wire18[(1'h0):(1'h0)]}) : ({$unsigned(wire17),
                                  ((8'hb8) * (8'hbd))} ?
                              wire16[(2'h2):(2'h2)] : ({wire17} ?
                                  (~wire16) : (~&wire19)))));
  assign wire21 = $signed(({$signed(((8'hbb) ? wire18 : wire20)),
                          wire18[(2'h2):(2'h2)]} ?
                      (((~wire19) | (wire16 ?
                          wire19 : wire19)) - $unsigned(wire18[(1'h1):(1'h0)])) : $signed((-wire20[(2'h2):(2'h2)]))));
  assign wire22 = ((!(^{wire19[(1'h1):(1'h1)],
                      {wire20}})) >> $signed((~$unsigned(wire20[(1'h1):(1'h0)]))));
  assign wire23 = $signed($unsigned(wire19));
  assign wire24 = {wire23[(2'h3):(2'h2)], wire17[(1'h0):(1'h0)]};
  assign wire25 = (^~{wire17[(3'h6):(3'h5)], wire24});
  assign wire26 = (((8'hb6) >>> ((8'hbe) ?
                      wire19 : $signed(wire20[(2'h2):(1'h0)]))) > $signed((wire19 * $signed($unsigned(wire18)))));
  always
    @(posedge clk) begin
      reg27 <= $unsigned((~|wire16));
      reg28 <= wire22[(1'h0):(1'h0)];
      reg29 <= ($signed(wire16) ? wire24[(2'h2):(1'h1)] : wire22);
    end
  assign wire30 = {{(-$signed($signed(wire18))), wire23[(3'h5):(1'h1)]},
                      $unsigned(((wire16[(3'h4):(3'h4)] ?
                          $unsigned(wire18) : (wire17 ?
                              wire22 : reg29)) | (wire24 ~^ (&reg27))))};
  always
    @(posedge clk) begin
      reg31 <= {{(^~$unsigned((~|wire19)))}};
    end
  assign wire32 = $unsigned({wire18[(3'h4):(1'h1)],
                      ($signed((~&(8'ha8))) ?
                          {wire16,
                              $signed(wire17)} : $unsigned((reg27 >= wire20)))});
  assign wire33 = wire25;
  assign wire34 = {reg29[(1'h1):(1'h1)],
                      $signed($unsigned({wire22[(3'h5):(3'h4)], wire22}))};
  assign wire35 = wire32;
  module36 #() modinst59 (.clk(clk), .wire39(wire25), .wire37(wire19), .wire40(wire16), .y(wire58), .wire38(reg27));
  assign wire60 = ($unsigned(((~&((8'ha7) ^ reg27)) - wire35[(4'hb):(4'h9)])) ?
                      $unsigned($signed(wire26[(4'hc):(3'h5)])) : {reg27});
  assign wire61 = ((((^reg31) <<< (wire23[(3'h4):(1'h0)] ?
                          {(8'ha5), wire60} : (&reg28))) ?
                      wire24[(3'h5):(1'h1)] : wire35[(4'hf):(4'he)]) & ({wire23} ^ (({wire58} ?
                      $signed(reg27) : $signed(wire16)) >= $unsigned((~&wire58)))));
endmodule

module module36  (y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire40;
  input wire [(4'hd):(1'h0)] wire39;
  input wire [(4'hc):(1'h0)] wire38;
  input wire signed [(3'h6):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  wire signed [(4'hb):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire54;
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
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
                 reg42,
                 reg41,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg41 <= ($signed({{(wire40 > wire39)}, (|(~^wire37))}) ?
          $unsigned(wire40[(3'h4):(1'h0)]) : ($signed(wire40[(1'h1):(1'h0)]) ?
              (($signed(wire39) - (wire37 & wire40)) << $unsigned(wire40)) : (wire38[(2'h3):(1'h0)] ?
                  $signed(wire37[(3'h4):(1'h0)]) : $signed(wire38[(3'h6):(2'h3)]))));
      reg42 <= {wire37[(2'h2):(1'h0)],
          $unsigned(((~wire39[(4'hc):(4'hb)]) ?
              reg41 : (((8'ha5) ? wire39 : reg41) ^~ reg41)))};
      reg43 <= $signed(wire37);
      reg44 <= (8'ha9);
      reg45 <= ($unsigned($unsigned({(reg43 << (8'hb9))})) ?
          wire37 : $unsigned($unsigned((7'h43))));
    end
  always
    @(posedge clk) begin
      reg46 <= $unsigned((~|$unsigned($unsigned(reg43[(3'h6):(3'h4)]))));
      if ((^$unsigned((reg45[(4'hb):(4'h8)] ?
          $unsigned($unsigned(reg42)) : reg46))))
        begin
          reg47 <= ($signed(reg45[(4'h8):(1'h1)]) >>> $signed((~&wire40)));
        end
      else
        begin
          if ((~&{$signed({$signed(wire40), $unsigned(wire38)}),
              $signed($unsigned(wire37))}))
            begin
              reg47 <= {(+(^($unsigned(reg42) ? reg47 : reg45))),
                  {((~^$signed(reg47)) ?
                          $unsigned({reg47}) : {$unsigned((8'hb4))})}};
              reg48 <= reg46;
              reg49 <= ({$signed({(~reg47)})} > $signed(($signed(reg47[(4'hb):(2'h3)]) ?
                  ($unsigned((7'h42)) - {reg43,
                      reg46}) : wire37[(1'h0):(1'h0)])));
              reg50 <= {$unsigned({(reg41[(2'h3):(2'h2)] ^~ (reg48 ?
                          reg42 : reg46)),
                      (reg44[(3'h7):(3'h7)] > (reg48 ? reg48 : (8'ha2)))}),
                  (8'hac)};
            end
          else
            begin
              reg47 <= reg46[(2'h2):(2'h2)];
              reg48 <= {(reg46 | $unsigned((+(reg46 ? (8'haf) : reg46))))};
              reg49 <= (($signed(wire39) != reg41) ? reg49 : (^~wire40));
              reg50 <= wire38[(1'h1):(1'h1)];
            end
          reg51 <= reg43;
          reg52 <= reg43[(3'h6):(1'h0)];
          reg53 <= {reg47};
        end
    end
  assign wire54 = (!(reg44[(1'h0):(1'h0)] ? reg53 : reg42));
  assign wire55 = (8'hb0);
  assign wire56 = {wire39[(4'h9):(1'h0)],
                      ($signed(((wire37 >>> reg42) >>> $signed((8'haa)))) ?
                          $unsigned(reg42) : (8'h9c))};
  assign wire57 = $unsigned((wire56[(3'h5):(3'h5)] ?
                      $signed((^wire38[(1'h1):(1'h0)])) : ({{reg53,
                              (8'ha5)}} & ($unsigned(reg48) ?
                          $unsigned(reg47) : $unsigned(wire56)))));
endmodule

module module90  (y, clk, wire95, wire94, wire93, wire92, wire91);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire95;
  input wire [(3'h7):(1'h0)] wire94;
  input wire signed [(4'h8):(1'h0)] wire93;
  input wire signed [(2'h3):(1'h0)] wire92;
  input wire signed [(3'h6):(1'h0)] wire91;
  wire [(4'hf):(1'h0)] wire108;
  wire [(5'h14):(1'h0)] wire107;
  wire [(3'h6):(1'h0)] wire106;
  wire signed [(3'h4):(1'h0)] wire105;
  reg [(4'h8):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg102 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg96 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
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
  always
    @(posedge clk) begin
      if (wire93)
        begin
          reg96 <= $signed($unsigned($unsigned((~wire94))));
          reg97 <= ({{(+((8'hb2) ? reg96 : wire94))}} ? {(+(8'hb7))} : wire91);
        end
      else
        begin
          if ({$signed(wire93[(4'h8):(2'h2)])})
            begin
              reg96 <= $unsigned(wire91[(2'h2):(1'h0)]);
              reg97 <= (wire95[(4'ha):(3'h4)] && wire92);
              reg98 <= (($signed($unsigned($unsigned(wire91))) ?
                      (reg97[(4'h9):(1'h1)] & $unsigned($signed(wire94))) : $unsigned({$unsigned(wire92)})) ?
                  (8'hb4) : ($unsigned({reg96[(2'h3):(1'h1)]}) >>> $signed($signed((~|wire95)))));
              reg99 <= {(~|wire95)};
              reg100 <= reg96;
            end
          else
            begin
              reg96 <= wire93[(4'h8):(3'h7)];
              reg97 <= (|reg96[(3'h7):(1'h0)]);
            end
          reg101 <= {($unsigned((~(wire91 ? reg97 : (8'hb9)))) ?
                  $signed($signed((reg99 ?
                      reg100 : reg96))) : $signed(wire94[(2'h3):(2'h3)]))};
          reg102 <= (reg101[(1'h0):(1'h0)] >= $signed(wire94[(1'h1):(1'h1)]));
          reg103 <= (~reg101);
        end
      reg104 <= $signed($signed($signed((^~{(8'hab), reg96}))));
    end
  assign wire105 = ($unsigned($unsigned($unsigned(reg99))) ?
                       ((~^{reg103, wire95[(5'h10):(4'hd)]}) ?
                           wire95[(3'h6):(3'h6)] : reg99[(4'hb):(3'h4)]) : $unsigned(((+(reg98 ?
                               reg104 : reg98)) ?
                           (reg104 << (^~reg97)) : (reg104 && ((8'had) * reg101)))));
  assign wire106 = $signed({{$signed($signed(reg101))}});
  assign wire107 = $unsigned((({(!reg96)} ? wire95 : wire94) * ({(^~reg99),
                           $unsigned((8'hbe))} ?
                       $unsigned({(8'ha9), reg103}) : (wire106 ?
                           $unsigned(reg104) : wire93))));
  assign wire108 = (7'h42);
endmodule
