module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire114;
  wire [(4'hb):(1'h0)] wire61;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire63;
  wire signed [(4'hd):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire108;
  reg [(4'hc):(1'h0)] reg113 = (1'h0);
  reg signed [(4'he):(1'h0)] reg112 = (1'h0);
  reg [(3'h5):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg110 = (1'h0);
  assign y = {wire114,
                 wire61,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire63,
                 wire64,
                 wire108,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 (1'h0)};
  assign wire4 = $unsigned(wire2);
  assign wire5 = wire3;
  assign wire6 = ($signed((wire4[(2'h2):(1'h1)] | wire1)) ?
                     $unsigned((((wire0 <= wire5) > (wire0 ?
                         wire2 : (8'ha8))) - ((wire0 < wire1) <= (wire4 ?
                         (8'ha9) : wire3)))) : $unsigned($signed($signed((wire0 >>> (8'hac))))));
  assign wire7 = $unsigned(wire2);
  assign wire8 = wire5;
  assign wire9 = $signed($signed((($unsigned(wire7) ^~ (-wire7)) << ({wire6,
                     wire6} == $signed((8'hb2))))));
  assign wire10 = $signed(wire9);
  assign wire11 = wire0;
  module12 #() modinst62 (.clk(clk), .wire14(wire7), .wire15(wire8), .wire13(wire5), .wire17(wire2), .y(wire61), .wire16(wire6));
  assign wire63 = ($unsigned(wire5[(4'hc):(4'h9)]) ?
                      ((|{{wire61, wire3}, wire9}) ?
                          wire5 : (-($signed((8'h9e)) < $unsigned(wire3)))) : (~&wire0));
  assign wire64 = (^(wire61 * ($unsigned((wire11 >= wire9)) >= wire10[(3'h5):(3'h5)])));
  module65 #() modinst109 (wire108, clk, wire10, wire8, wire3, wire5, wire9);
  always
    @(posedge clk) begin
      reg110 <= wire10[(1'h1):(1'h1)];
      reg111 <= wire3;
      reg112 <= wire0[(4'h9):(3'h5)];
      reg113 <= {wire63,
          (((wire64 ? $unsigned(wire8) : wire108[(2'h2):(2'h2)]) & {wire63,
              (&wire6)}) & $unsigned(((reg112 > wire4) ^ (|wire0))))};
    end
  assign wire114 = $signed($signed(wire3));
endmodule

module module65  (y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h19a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire70;
  input wire signed [(4'hf):(1'h0)] wire69;
  input wire signed [(4'hb):(1'h0)] wire68;
  input wire [(3'h4):(1'h0)] wire67;
  input wire signed [(4'h8):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire106;
  wire signed [(4'hd):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire104;
  wire [(5'h12):(1'h0)] wire103;
  wire [(3'h4):(1'h0)] wire102;
  wire [(5'h10):(1'h0)] wire101;
  wire signed [(5'h13):(1'h0)] wire100;
  wire [(2'h2):(1'h0)] wire99;
  wire [(3'h7):(1'h0)] wire98;
  wire [(3'h4):(1'h0)] wire85;
  wire signed [(5'h15):(1'h0)] wire74;
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(5'h11):(1'h0)] reg92 = (1'h0);
  reg [(4'he):(1'h0)] reg91 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(3'h5):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire85,
                 wire74,
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
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg71 <= $signed($unsigned(wire70));
      reg72 <= $unsigned((~^({(&reg71),
          $unsigned(reg71)} >= wire69[(3'h6):(2'h3)])));
      reg73 <= reg71;
    end
  assign wire74 = (&wire70);
  always
    @(posedge clk) begin
      if ($signed({wire66[(2'h3):(1'h0)]}))
        begin
          reg75 <= {wire74[(4'he):(4'hb)],
              ((wire69[(4'hf):(4'hf)] ?
                      ((wire70 ? (8'ha3) : wire70) ?
                          {reg71, (8'hb5)} : wire66) : wire69) ?
                  reg73[(4'h8):(3'h6)] : reg73[(1'h0):(1'h0)])};
          reg76 <= $unsigned($unsigned(wire70[(4'hb):(4'h9)]));
        end
      else
        begin
          if (reg73[(5'h12):(2'h3)])
            begin
              reg75 <= $unsigned(($signed({$unsigned(reg71),
                  $signed((8'hbc))}) - (~|$unsigned((+reg72)))));
              reg76 <= $signed((~((reg73[(4'h8):(4'h8)] ?
                  {reg73,
                      wire74} : wire70[(4'h9):(3'h6)]) <= ($signed(reg75) | $signed(reg73)))));
            end
          else
            begin
              reg75 <= (^~reg76[(2'h2):(2'h2)]);
              reg76 <= reg75[(2'h3):(2'h2)];
              reg77 <= (+$unsigned(wire69[(3'h5):(2'h2)]));
            end
        end
    end
  always
    @(posedge clk) begin
      if (wire68)
        begin
          if (reg77)
            begin
              reg78 <= wire66[(3'h7):(2'h2)];
              reg79 <= {{$unsigned(((wire67 ? (8'hbd) : wire70) ?
                          (wire66 ^ wire69) : ((8'hbc) >> wire66))),
                      (~|($unsigned(reg77) ?
                          $unsigned(reg71) : $unsigned(wire66)))}};
              reg80 <= ($unsigned($signed((-reg75))) + ((&$signed($unsigned(reg79))) < (8'hb9)));
              reg81 <= {($unsigned(($unsigned(wire74) - {wire68})) ?
                      $signed(((wire70 >>> (8'ha9)) < {reg75,
                          reg78})) : ((&(wire74 ? reg71 : reg73)) ?
                          (~&$signed(reg73)) : {$signed(reg76)})),
                  (reg72 && wire74)};
              reg82 <= (+reg75);
            end
          else
            begin
              reg78 <= (wire74 ?
                  (&(~^((reg73 ?
                      wire68 : reg76) <<< reg80[(4'hc):(2'h3)]))) : wire74);
              reg79 <= (~&((-$unsigned($signed(wire69))) ?
                  $unsigned(reg73[(4'hf):(2'h3)]) : ((reg79[(4'h9):(3'h6)] ?
                      reg78 : wire69[(3'h4):(2'h3)]) ^~ reg78)));
              reg80 <= ($unsigned(wire68) == reg71[(4'ha):(3'h5)]);
              reg81 <= $signed($signed((~&$signed((wire67 ?
                  wire67 : wire74)))));
              reg82 <= (^~(~|($unsigned((wire70 && reg71)) ?
                  ({wire66} ?
                      (^reg80) : reg80[(3'h7):(2'h2)]) : ($unsigned(wire74) ?
                      $unsigned((8'hab)) : (wire69 <= reg81)))));
            end
          reg83 <= (~|((reg80[(5'h11):(3'h6)] - $unsigned((reg77 >>> (8'hb9)))) ?
              ($unsigned((reg78 < (8'hb6))) || $signed(((8'hb5) ?
                  (8'haa) : wire74))) : $unsigned(reg81)));
          reg84 <= reg76;
        end
      else
        begin
          reg78 <= reg72[(2'h3):(1'h0)];
          reg79 <= (reg84[(2'h2):(2'h2)] ?
              (~^((((8'ha8) ? wire74 : wire74) ?
                      reg73[(4'hd):(2'h2)] : $signed(reg81)) ?
                  $signed({wire67}) : (8'hb2))) : reg71[(4'h9):(1'h1)]);
          reg80 <= (($signed((|(reg72 - wire69))) ?
                  $signed($signed($signed((8'h9f)))) : {($signed((8'hb6)) < reg80[(5'h12):(4'hb)])}) ?
              wire74 : (((reg82 ? (8'haf) : (&reg76)) ?
                      reg71 : (reg71 ? (reg73 > wire67) : reg78)) ?
                  {$signed($signed((7'h44)))} : reg84));
        end
    end
  assign wire85 = reg75[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg86 <= $signed({$unsigned($unsigned(reg80)), $signed((7'h40))});
      reg87 <= wire66;
      if (({reg82[(4'he):(1'h0)],
          reg73[(4'h9):(3'h5)]} * ($signed($signed($signed(wire68))) ^ wire74)))
        begin
          reg88 <= reg80;
          reg89 <= wire68[(1'h0):(1'h0)];
          reg90 <= (^~$unsigned($signed($unsigned($signed(wire85)))));
        end
      else
        begin
          reg88 <= $unsigned(((!(8'hac)) ?
              {{$signed(reg76), $signed(wire69)}} : {reg72[(3'h4):(2'h2)],
                  (+(reg83 && reg84))}));
          if (reg90)
            begin
              reg89 <= reg87;
              reg90 <= reg89[(1'h1):(1'h1)];
              reg91 <= reg78;
              reg92 <= reg90[(3'h6):(1'h1)];
              reg93 <= $signed((~reg84));
            end
          else
            begin
              reg89 <= {$signed((reg76 ? (^((8'ha8) ^ reg82)) : reg88)),
                  $signed(reg89[(3'h5):(3'h4)])};
              reg90 <= ((((~&(reg88 >>> reg76)) ^~ ((&wire67) ?
                  $unsigned(reg80) : reg81[(1'h1):(1'h0)])) - (8'haa)) <<< (reg80[(4'ha):(3'h6)] != ({(reg79 | reg81),
                      $signed(reg90)} ?
                  (8'ha0) : ((~^wire70) ?
                      $signed(reg72) : reg86[(3'h4):(1'h0)]))));
            end
          reg94 <= $unsigned(((~|((~wire69) - reg93)) & $signed((~|(!(8'hb3))))));
          reg95 <= ((reg72[(2'h3):(2'h2)] ?
                  (((~^reg93) ? $signed(reg80) : wire67) ?
                      (~|(~reg78)) : (|(reg71 != (8'ha7)))) : $unsigned(reg77[(1'h0):(1'h0)])) ?
              reg89[(3'h5):(1'h0)] : reg83);
          reg96 <= (reg93 ~^ $unsigned({reg91[(3'h5):(3'h5)]}));
        end
      reg97 <= ($unsigned((reg80[(1'h1):(1'h0)] < $unsigned(reg87[(1'h1):(1'h0)]))) ?
          (($signed($unsigned(wire67)) ?
              {(!reg93),
                  (reg96 ?
                      reg91 : reg90)} : (+{reg72})) < $unsigned(reg96[(4'h8):(3'h5)])) : $signed((~&reg83)));
    end
  assign wire98 = $signed(((reg84 ~^ ((reg76 != reg82) << (reg92 | (8'hb1)))) <= wire66[(4'h8):(2'h2)]));
  assign wire99 = reg81[(3'h5):(1'h0)];
  assign wire100 = (reg86[(3'h7):(3'h6)] * {reg82[(3'h6):(3'h6)]});
  assign wire101 = $signed($signed(($signed(wire66[(4'h8):(3'h6)]) || wire85)));
  assign wire102 = wire69[(4'hb):(3'h7)];
  assign wire103 = (8'ha3);
  assign wire104 = {(!reg75)};
  assign wire105 = (reg89 <<< $signed({(^~reg83[(2'h2):(2'h2)]),
                       (reg83 > reg76)}));
  assign wire106 = reg71;
  assign wire107 = ((~|$signed($unsigned((wire100 >>> reg92)))) ?
                       wire74 : $unsigned($signed((reg78[(1'h1):(1'h1)] ?
                           $signed(wire99) : $signed(wire69)))));
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire17;
  input wire signed [(5'h15):(1'h0)] wire16;
  input wire [(4'h8):(1'h0)] wire15;
  input wire signed [(4'ha):(1'h0)] wire14;
  input wire [(3'h5):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  assign y = {wire60,
                 wire58,
                 wire34,
                 wire33,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg18 <= wire15[(3'h7):(1'h0)];
      if ($signed($unsigned(reg18[(4'hf):(4'h8)])))
        begin
          reg19 <= (wire17[(3'h4):(1'h0)] ?
              ($unsigned(wire14[(2'h3):(2'h3)]) ?
                  $unsigned((-$unsigned((7'h40)))) : $unsigned(($signed(wire14) ~^ (wire13 ?
                      wire14 : wire14)))) : $signed($unsigned({(8'ha4),
                  (^~wire15)})));
          reg20 <= $signed($unsigned(reg18));
          reg21 <= reg19;
          reg22 <= reg21;
        end
      else
        begin
          if ((7'h44))
            begin
              reg19 <= ($signed(wire13[(1'h0):(1'h0)]) & ((~|wire16[(2'h2):(2'h2)]) ?
                  {$unsigned($signed(wire16))} : {$signed($unsigned((8'ha3)))}));
              reg20 <= (~&($unsigned(((reg19 == reg18) <= (reg20 ?
                      (8'ha1) : reg18))) ?
                  ({$signed((8'hb9))} ?
                      {reg19,
                          $signed(wire17)} : $unsigned(wire13[(1'h1):(1'h1)])) : ((!reg21[(1'h1):(1'h0)]) <<< wire14)));
              reg21 <= ((8'ha7) ?
                  ((((+wire14) - reg19) ?
                      $signed((reg20 ? reg20 : reg22)) : {reg21[(1'h1):(1'h0)],
                          reg22}) < ((|(8'hb0)) < {(wire15 > reg19),
                      reg19})) : (+($unsigned(wire15) - ((wire15 ?
                          reg19 : wire15) ?
                      (~^reg22) : wire16))));
              reg22 <= (~|$signed($signed((~$signed(reg20)))));
              reg23 <= (&reg21[(4'ha):(4'h8)]);
            end
          else
            begin
              reg19 <= $signed(reg19);
              reg20 <= $unsigned(wire17);
              reg21 <= $unsigned((wire17[(3'h6):(2'h2)] ^~ reg19));
            end
          reg24 <= {(-($signed($unsigned(reg22)) ?
                  (~(~|wire17)) : (~^(+reg18)))),
              $unsigned(((wire15 >>> reg23[(2'h2):(1'h0)]) <= ((!wire15) ?
                  {reg20} : reg19)))};
          reg25 <= (~|(^~(!(~reg22[(4'h9):(3'h6)]))));
          if (reg24[(2'h2):(2'h2)])
            begin
              reg26 <= reg25;
              reg27 <= (^~reg18);
            end
          else
            begin
              reg26 <= ({($signed(wire17[(1'h0):(1'h0)]) & reg18)} + (!{wire15[(3'h7):(3'h7)],
                  reg23[(2'h3):(2'h3)]}));
              reg27 <= wire17;
              reg28 <= reg23[(2'h3):(1'h1)];
            end
          reg29 <= $unsigned($signed(($unsigned($unsigned(reg26)) ?
              reg25 : ($unsigned(reg24) != $signed(reg27)))));
        end
      reg30 <= ({({(reg22 ? (8'ha9) : reg26)} >> (~|(-wire17))), {wire16}} ?
          ((((&(8'h9c)) ?
              reg25[(3'h6):(2'h3)] : (wire17 <<< reg29)) | ($signed(reg26) > $signed((8'hb9)))) && (7'h41)) : $unsigned((^~($unsigned(wire16) > $signed((8'ha3))))));
      reg31 <= (~&(wire14[(2'h3):(1'h1)] ?
          reg24[(2'h3):(1'h1)] : (($signed(wire16) ?
              $unsigned(wire13) : (wire15 >>> reg28)) ^ wire14)));
    end
  always
    @(posedge clk) begin
      reg32 <= {$signed(reg21[(5'h10):(4'ha)]),
          ({{$unsigned(reg20), $unsigned(reg27)}} ^ {{$signed(reg21)},
              $unsigned((reg31 != reg23))})};
    end
  assign wire33 = (!((((reg25 ? reg25 : reg25) ? $signed(reg27) : wire14) ?
                      {(wire17 >= (8'hb6))} : (^~(!reg24))) | $signed(wire16)));
  assign wire34 = reg31;
  module35 #() modinst59 (.wire40(reg23), .y(wire58), .wire39(wire14), .wire37(reg26), .wire36(reg18), .clk(clk), .wire38(wire16));
  assign wire60 = (({(8'h9e),
                          wire15[(4'h8):(3'h6)]} - ($signed($unsigned(reg20)) || ((~|reg24) & wire58[(1'h1):(1'h1)]))) ?
                      wire34 : $signed((^reg29[(1'h1):(1'h0)])));
endmodule

module module35
#(parameter param57 = (~&({(((8'hbe) ? (8'ha2) : (8'haf)) ? ((8'hae) >>> (7'h43)) : (^(8'ha3)))} ? ((!((8'hb2) ? (8'hb4) : (8'ha3))) >> (~|((8'hb4) ? (8'had) : (8'hbe)))) : (~^(~{(8'ha9), (7'h43)})))))
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire40;
  input wire [(4'ha):(1'h0)] wire39;
  input wire signed [(3'h7):(1'h0)] wire38;
  input wire [(5'h11):(1'h0)] wire37;
  input wire [(5'h15):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire56;
  wire [(4'hf):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire52;
  wire signed [(3'h5):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire50;
  wire [(3'h6):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire45;
  wire signed [(3'h4):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire41;
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 (1'h0)};
  assign wire41 = (~|wire39);
  assign wire42 = (wire40 != ($signed(((wire37 ? wire40 : wire40) + (wire38 ?
                          wire37 : wire40))) ?
                      {$unsigned($signed(wire37))} : (^wire40[(3'h5):(3'h4)])));
  assign wire43 = $signed((+(8'hb5)));
  assign wire44 = wire43;
  assign wire45 = wire37;
  assign wire46 = $signed({wire38});
  assign wire47 = $unsigned($signed({wire46[(3'h6):(1'h1)],
                      ((~^wire42) * (wire45 <<< wire44))}));
  assign wire48 = {(~|$unsigned(($unsigned(wire36) ?
                          (+wire46) : (wire43 <= wire42))))};
  assign wire49 = (($unsigned(wire44[(1'h0):(1'h0)]) >= $signed(wire38[(2'h2):(1'h0)])) * wire46[(4'hf):(3'h7)]);
  assign wire50 = (^~(wire45[(4'h9):(4'h9)] & wire39[(3'h4):(3'h4)]));
  assign wire51 = (wire49[(3'h4):(2'h2)] + ((($unsigned(wire40) ~^ (wire40 | wire49)) << (^wire41)) ?
                      wire41 : (wire42[(2'h2):(1'h0)] ?
                          {wire36[(5'h11):(4'hb)],
                              (wire47 * wire36)} : $unsigned($signed(wire38)))));
  assign wire52 = wire37[(3'h6):(2'h2)];
  assign wire53 = $unsigned($unsigned($unsigned((wire49 ?
                      (wire37 - (8'had)) : $signed(wire37)))));
  assign wire54 = ($signed($unsigned($signed((&wire40)))) ?
                      ((wire40[(4'ha):(3'h5)] | $signed($signed(wire48))) ~^ $signed(((~|wire36) ^~ (wire50 ?
                          (7'h44) : wire48)))) : (&wire39[(2'h2):(1'h0)]));
  assign wire55 = $signed($signed($unsigned(((wire36 ~^ wire50) ?
                      wire43[(4'ha):(4'ha)] : (~|wire52)))));
  assign wire56 = wire52;
endmodule
