module top
#(parameter param182 = (-((7'h43) ? (|({(8'hbf)} ? {(8'hba), (8'hb2)} : (^~(8'h9d)))) : (((&(8'ha9)) * ((8'hb5) + (8'had))) ? ((-(7'h40)) > ((8'hb3) ? (7'h42) : (8'hbb))) : (~((8'hbc) >= (8'ha7)))))), 
parameter param183 = ((-({{param182, param182}, param182} ? (param182 >>> (param182 == param182)) : (8'haf))) ? ((((param182 ? param182 : param182) ? param182 : (param182 ^ (8'hb3))) < ((param182 || param182) + (~&param182))) > ((8'hb0) ? (8'ha4) : (param182 ? {param182, param182} : (param182 ? param182 : (8'h9f))))) : (((param182 ? {param182} : (param182 <= (8'hb8))) ? (param182 ? (|param182) : {(8'ha4), param182}) : ((param182 <= param182) ? {param182, param182} : (param182 ? param182 : param182))) & (|(~|{param182, param182})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire181;
  wire [(5'h13):(1'h0)] wire180;
  wire signed [(4'ha):(1'h0)] wire179;
  wire signed [(3'h7):(1'h0)] wire178;
  wire [(4'h8):(1'h0)] wire177;
  wire [(5'h11):(1'h0)] wire176;
  wire signed [(4'he):(1'h0)] wire175;
  wire [(4'he):(1'h0)] wire173;
  wire [(4'hc):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  assign y = {wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire173,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg14,
                 (1'h0)};
  assign wire5 = wire0[(4'ha):(4'h8)];
  assign wire6 = ($signed((8'hb5)) - (wire0 != wire0[(4'h9):(3'h7)]));
  assign wire7 = wire0;
  assign wire8 = {{(^~(((8'h9d) || wire5) ? wire3[(2'h3):(1'h1)] : (^~wire5))),
                         ((wire1[(2'h3):(1'h0)] > (~wire0)) | (((8'hb1) && wire1) < (wire6 && wire5)))}};
  assign wire9 = wire8[(1'h1):(1'h1)];
  assign wire10 = $unsigned(($signed((&$unsigned(wire7))) == $signed(wire7)));
  assign wire11 = $signed(wire7);
  assign wire12 = wire5;
  assign wire13 = $unsigned(wire11[(4'h9):(3'h7)]);
  always
    @(posedge clk) begin
      reg14 <= (wire8 ? $signed((-$signed($signed(wire1)))) : wire13);
    end
  module15 #() modinst174 (.wire18(wire12), .wire17(wire5), .wire19(wire0), .y(wire173), .clk(clk), .wire20(reg14), .wire16(wire4));
  assign wire175 = (^(^(wire8[(2'h3):(1'h0)] ? {(~^wire173)} : (^(+wire1)))));
  assign wire176 = $signed($unsigned((($signed(wire4) || wire6[(2'h2):(2'h2)]) + $signed({(8'hb4)}))));
  assign wire177 = ((wire7 << (8'hb0)) ?
                       (!$signed(wire11[(5'h11):(3'h5)])) : ((&$signed($signed(wire1))) ~^ reg14));
  assign wire178 = (wire4[(1'h1):(1'h0)] ^~ {$unsigned(wire0[(4'he):(3'h6)])});
  assign wire179 = $signed((~&$signed(reg14)));
  assign wire180 = $unsigned(wire12[(1'h0):(1'h0)]);
  assign wire181 = $signed((~|($unsigned($unsigned((8'ha4))) & $signed($signed(wire1)))));
endmodule

module module15
#(parameter param172 = ((((((7'h42) && (8'ha2)) <<< ((8'hac) ? (8'ha8) : (8'hba))) ? (((8'hac) >> (8'hbb)) ? {(8'hba), (8'ha6)} : (+(7'h43))) : (((8'had) ? (8'hb8) : (7'h44)) ? ((8'hb1) >> (8'ha3)) : {(8'ha2), (8'hb7)})) | ((!((8'h9d) ? (8'hb3) : (8'hb3))) ^ (~((8'h9d) << (8'hba))))) ? ((((|(8'hbf)) ~^ ((8'hb5) ? (8'hbb) : (8'haa))) ^~ (((8'ha0) ? (8'ha0) : (8'had)) ? ((8'ha6) | (8'hb3)) : (-(7'h41)))) ? (|(((8'hb4) - (8'ha2)) ? (-(8'hb5)) : ((8'hb3) <= (7'h42)))) : ((+((8'hba) ? (8'hbf) : (8'hbc))) != (((8'hb3) < (7'h41)) * ((8'hb5) ? (8'hb8) : (8'ha0))))) : (^((((8'hbc) || (7'h43)) ? ((8'haa) != (8'ha5)) : (~&(8'ha2))) ? (~&(~|(8'ha3))) : {(^~(8'hbf)), (|(8'hb3))}))))
(y, clk, wire16, wire17, wire18, wire19, wire20);
  output wire [(32'h314):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire16;
  input wire signed [(4'he):(1'h0)] wire17;
  input wire signed [(2'h2):(1'h0)] wire18;
  input wire signed [(4'he):(1'h0)] wire19;
  input wire [(5'h12):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire156;
  wire signed [(4'hd):(1'h0)] wire155;
  wire [(2'h2):(1'h0)] wire153;
  wire [(4'hb):(1'h0)] wire140;
  wire [(4'hc):(1'h0)] wire138;
  wire [(3'h4):(1'h0)] wire71;
  wire signed [(3'h7):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire63;
  reg [(5'h12):(1'h0)] reg171 = (1'h0);
  reg [(3'h6):(1'h0)] reg170 = (1'h0);
  reg [(4'hb):(1'h0)] reg169 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg168 = (1'h0);
  reg [(4'h8):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg166 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg165 = (1'h0);
  reg [(4'h8):(1'h0)] reg164 = (1'h0);
  reg [(2'h2):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg162 = (1'h0);
  reg [(4'hf):(1'h0)] reg161 = (1'h0);
  reg signed [(4'he):(1'h0)] reg160 = (1'h0);
  reg [(4'hb):(1'h0)] reg159 = (1'h0);
  reg [(5'h15):(1'h0)] reg158 = (1'h0);
  reg [(4'hf):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg [(5'h11):(1'h0)] reg107 = (1'h0);
  reg [(3'h4):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg [(4'hb):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  assign y = {wire156,
                 wire155,
                 wire153,
                 wire140,
                 wire138,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire21,
                 wire22,
                 wire63,
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
                 reg159,
                 reg158,
                 reg157,
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
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire21 = wire17[(3'h6):(3'h4)];
  assign wire22 = $unsigned(wire16[(2'h2):(1'h0)]);
  module23 #() modinst64 (.wire26(wire22), .wire28(wire21), .clk(clk), .wire25(wire19), .y(wire63), .wire27(wire17), .wire24(wire16));
  assign wire65 = $unsigned(wire20[(5'h10):(4'h9)]);
  assign wire66 = wire18[(1'h1):(1'h0)];
  assign wire67 = ((-$signed($unsigned(wire21[(4'hd):(2'h3)]))) ?
                      (|(((wire19 ? wire22 : wire66) ?
                          $unsigned(wire22) : (wire17 >= wire66)) <= {wire19})) : $unsigned($unsigned($unsigned(wire65[(3'h4):(1'h0)]))));
  assign wire68 = (($signed(((wire16 * wire19) ?
                          $unsigned((8'hbc)) : (wire18 ?
                              wire67 : wire63))) & wire21) ?
                      ($signed((~&(wire67 ^ (8'h9e)))) * (~|(~|wire18))) : {{$unsigned({wire20})}});
  assign wire69 = wire18;
  assign wire70 = {wire63[(2'h3):(2'h2)]};
  assign wire71 = {$signed(({$signed(wire67),
                          (|(8'hb0))} ^~ (!wire63[(2'h3):(1'h1)]))),
                      $unsigned(($signed((8'hb8)) ^~ (wire63 ?
                          wire65 : $unsigned(wire68))))};
  always
    @(posedge clk) begin
      reg72 <= $signed(wire18[(2'h2):(2'h2)]);
      if ((+(|{((wire17 ? wire20 : (8'h9f)) != wire71)})))
        begin
          if (($unsigned(($signed(wire19[(3'h7):(2'h2)]) > wire19)) <= $signed(((~|(wire21 - wire21)) - (8'h9c)))))
            begin
              reg73 <= $unsigned({$signed($unsigned((wire71 ~^ wire66)))});
              reg74 <= (~|{$signed((+(+wire18))),
                  (~({wire22, (8'hac)} <= {wire20, wire71}))});
              reg75 <= $unsigned((&wire63[(1'h1):(1'h0)]));
            end
          else
            begin
              reg73 <= $unsigned($unsigned({$unsigned((8'ha0))}));
              reg74 <= (!wire66[(3'h6):(3'h6)]);
            end
          if ($unsigned(wire16[(3'h4):(1'h1)]))
            begin
              reg76 <= ((~^{($unsigned(reg73) & $signed((8'ha6))),
                  ($unsigned(wire16) ~^ (reg74 != wire66))}) > (|$signed($signed(reg74[(4'hc):(3'h4)]))));
            end
          else
            begin
              reg76 <= reg75;
              reg77 <= wire67;
            end
          reg78 <= (wire63 ? (8'ha1) : wire19);
        end
      else
        begin
          reg73 <= wire69;
          reg74 <= $signed($unsigned(((+$signed(wire18)) ?
              (^wire68[(4'ha):(2'h2)]) : $signed(((8'ha0) ?
                  wire65 : wire69)))));
          if ($unsigned((^~wire63[(2'h2):(2'h2)])))
            begin
              reg75 <= ((($unsigned($signed(reg73)) ?
                      ((wire65 ?
                          (7'h43) : wire22) | $signed(wire19)) : ((reg76 ?
                          wire71 : wire70) & reg73)) ?
                  wire18 : ($signed({reg74}) ?
                      {(wire67 ?
                              wire16 : wire66)} : wire71)) || $signed((|{{reg78},
                  (^~wire19)})));
              reg76 <= ({wire65,
                      {(+((8'hb8) ? wire67 : reg74)),
                          ((wire16 && wire18) ?
                              wire16[(1'h1):(1'h0)] : wire22[(2'h2):(1'h1)])}} ?
                  reg78 : (~&(^~{{(8'had), wire66}})));
              reg77 <= ((^~($signed(wire63[(1'h1):(1'h1)]) ?
                      $signed((wire67 & wire66)) : ($unsigned(wire20) << $signed(wire21)))) ?
                  (|$signed(($signed(reg74) >= reg72))) : wire69);
            end
          else
            begin
              reg75 <= wire66;
              reg76 <= $signed((reg76 ?
                  wire22[(4'h8):(1'h1)] : $unsigned((-(wire21 * wire19)))));
              reg77 <= reg74[(3'h5):(1'h0)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg79 <= $unsigned((!wire67));
      reg80 <= {wire67[(2'h2):(2'h2)], wire19};
      reg81 <= (({(^~reg76[(4'hb):(2'h2)]), ($signed(wire16) <<< {reg80})} ?
              (|$signed((+wire69))) : ($signed($signed(wire17)) ?
                  $signed($signed(wire67)) : {(reg79 != (8'h9f)),
                      $unsigned(reg75)})) ?
          {wire19[(1'h1):(1'h0)],
              (|$unsigned((wire66 ? wire19 : wire71)))} : ($unsigned(((wire67 ?
                  reg72 : reg77) ?
              ((8'hbd) ?
                  reg80 : wire69) : (wire70 > reg75))) ^ (&reg74[(3'h4):(3'h4)])));
    end
  always
    @(posedge clk) begin
      reg82 <= ($unsigned({$unsigned((wire69 & (8'ha0))),
          {wire17[(4'ha):(3'h6)], (wire18 | wire71)}}) > reg81[(2'h3):(2'h3)]);
      reg83 <= reg78;
    end
  always
    @(posedge clk) begin
      if ($signed({wire68}))
        begin
          reg84 <= wire68;
          reg85 <= wire67;
          reg86 <= $signed(reg77);
          if ($unsigned(wire21[(2'h2):(1'h1)]))
            begin
              reg87 <= (wire66[(2'h2):(1'h1)] - (-reg74));
              reg88 <= reg82;
            end
          else
            begin
              reg87 <= (!$unsigned((^(7'h42))));
              reg88 <= reg81[(2'h2):(1'h0)];
            end
          reg89 <= (~&((reg87[(4'he):(2'h3)] ~^ {reg82}) ?
              (&$signed((reg79 == wire16))) : $unsigned({reg77})));
        end
      else
        begin
          if ({{$signed((~{reg74}))}})
            begin
              reg84 <= {reg82[(4'h8):(3'h4)]};
              reg85 <= wire16;
            end
          else
            begin
              reg84 <= wire16[(4'h8):(3'h4)];
            end
          reg86 <= {wire18[(2'h2):(1'h1)],
              $signed($unsigned((~&(reg82 ^~ wire20))))};
          reg87 <= ({$signed(wire70)} ?
              ((8'hb3) ?
                  (wire21[(2'h3):(2'h3)] ?
                      $signed((-wire71)) : {reg87,
                          $unsigned(wire65)}) : (~|wire71[(2'h2):(1'h0)])) : (($signed({(8'ha8),
                          reg76}) ?
                      $signed({reg87, wire21}) : reg73) ?
                  $unsigned($signed((reg82 ?
                      reg84 : reg82))) : ($unsigned(reg73[(4'h8):(2'h2)]) >> {$signed(reg75)})));
        end
      reg90 <= (^wire17[(4'h9):(1'h1)]);
      if ($signed((($unsigned((wire19 ^ wire70)) ?
          ($signed(reg86) ?
              $signed(wire67) : wire22[(3'h5):(3'h5)]) : ((wire21 ^~ (8'hab)) <= wire21)) >= (+reg88[(2'h3):(1'h1)]))))
        begin
          if ((~|reg87[(4'hb):(4'hb)]))
            begin
              reg91 <= reg86[(4'ha):(3'h6)];
              reg92 <= reg76;
            end
          else
            begin
              reg91 <= (~($signed((wire19 ?
                      wire16[(3'h6):(3'h5)] : $signed((8'hbf)))) ?
                  (reg89[(4'h8):(1'h0)] >> wire22[(3'h4):(1'h1)]) : ($unsigned($unsigned(reg89)) <= (!$unsigned((8'hb6))))));
              reg92 <= wire67[(2'h2):(1'h0)];
              reg93 <= {reg80,
                  $signed({{reg78}, (|(reg92 ? reg87 : (8'hbd)))})};
              reg94 <= $signed($unsigned($signed((~|(reg79 || (8'ha5))))));
              reg95 <= {$unsigned($signed((~^(reg84 * reg76))))};
            end
          if ($unsigned((reg74 >> {($signed(wire19) & {reg86, (8'ha8)}),
              (~&$unsigned((8'hb7)))})))
            begin
              reg96 <= {{(^reg82), (~^($unsigned(wire17) * {reg76}))},
                  $unsigned(reg88)};
              reg97 <= (|$signed((^($signed((8'had)) ?
                  wire22 : $signed(reg79)))));
              reg98 <= reg87;
              reg99 <= (!((+$signed((wire66 >>> reg78))) ?
                  $unsigned(reg85) : (reg81 ?
                      ({wire17, reg82} ? reg80 : (~(7'h41))) : reg96)));
            end
          else
            begin
              reg96 <= reg72[(1'h1):(1'h1)];
              reg97 <= (~reg75);
              reg98 <= ((wire20 ?
                  $unsigned(wire70) : {(~&$unsigned(reg72))}) <= (+reg96));
            end
          reg100 <= (reg82 + reg85);
          reg101 <= $unsigned($signed(reg77[(1'h1):(1'h1)]));
          reg102 <= ({wire21, reg89[(3'h5):(3'h4)]} << (8'ha1));
        end
      else
        begin
          reg91 <= {reg72};
          reg92 <= reg76[(5'h13):(4'h9)];
        end
      if (((8'ha1) > (($signed(((8'h9d) << reg98)) > (reg91[(4'ha):(3'h5)] ?
              ((8'hbd) & reg72) : wire22)) ?
          wire18[(1'h1):(1'h1)] : reg101)))
        begin
          if ((reg86[(1'h0):(1'h0)] ?
              $unsigned(reg78) : $unsigned(reg86[(2'h2):(1'h0)])))
            begin
              reg103 <= $signed(reg99[(2'h2):(2'h2)]);
              reg104 <= (7'h44);
            end
          else
            begin
              reg103 <= $unsigned(($unsigned((!{wire63})) + $unsigned((^(~wire67)))));
              reg104 <= ((~(reg82 ~^ wire68)) ?
                  $signed(reg94[(4'hc):(2'h2)]) : reg87);
              reg105 <= (wire71[(2'h2):(1'h0)] <<< ($unsigned((wire69[(2'h3):(2'h3)] + $unsigned(wire70))) ?
                  reg80 : (((8'h9f) >= (^reg85)) || wire67)));
              reg106 <= $unsigned(((&$signed(wire18)) ~^ (&wire21)));
              reg107 <= $unsigned(wire63);
            end
          reg108 <= (~&(wire19 <<< (+((wire69 & reg91) ?
              (~^wire63) : wire19))));
          if (reg102)
            begin
              reg109 <= reg94;
            end
          else
            begin
              reg109 <= reg100;
              reg110 <= (~wire17);
            end
        end
      else
        begin
          if (($signed(reg110) ?
              (((~^(reg103 != reg88)) ^ ((reg100 || (8'hb6)) ?
                      $unsigned(reg102) : $signed((8'ha1)))) ?
                  (~|(wire18[(2'h2):(1'h1)] <<< (+reg73))) : reg99) : $signed(((^(wire21 * reg98)) ?
                  reg106 : $unsigned(((8'h9c) ? wire68 : reg108))))))
            begin
              reg103 <= $signed($unsigned(((reg73 ^~ (wire17 <= reg93)) ?
                  (&(|reg74)) : (^~(~^reg82)))));
              reg104 <= (&reg72[(2'h2):(1'h0)]);
              reg105 <= reg86;
            end
          else
            begin
              reg103 <= ($unsigned($unsigned($signed(wire21))) << (!(~^wire20)));
              reg104 <= ((~^$unsigned(reg78)) ?
                  $unsigned((($unsigned(reg82) < {wire66}) < $unsigned(reg73[(1'h1):(1'h0)]))) : ($unsigned($signed(reg88[(5'h12):(3'h4)])) ?
                      wire70 : reg79));
            end
          if ((^~((!(((8'ha0) ? (8'haf) : reg109) ?
                  $signed((8'h9d)) : (reg78 ^ (8'ha6)))) ?
              reg92[(3'h5):(3'h4)] : $unsigned((+(reg104 <= reg109))))))
            begin
              reg106 <= ($unsigned(reg110[(4'hc):(4'ha)]) <<< $signed({(reg98 ^~ $unsigned(reg78)),
                  ($signed(wire69) ? (!reg105) : $signed(reg87))}));
              reg107 <= $unsigned(wire20);
              reg108 <= (($signed(({reg72} <<< (8'hb0))) & (^{reg98,
                  (reg104 ?
                      reg99 : reg99)})) ~^ $signed($unsigned((reg101[(4'ha):(3'h5)] != $unsigned(reg98)))));
              reg109 <= $signed({reg97[(2'h2):(2'h2)],
                  $signed((wire71[(2'h3):(1'h1)] >> (reg110 && reg88)))});
            end
          else
            begin
              reg106 <= reg72[(1'h1):(1'h1)];
              reg107 <= (+(8'hb7));
              reg108 <= $signed((+$signed(reg90[(3'h5):(2'h2)])));
              reg109 <= $signed({reg95});
            end
          reg110 <= $unsigned((reg98[(4'hd):(1'h0)] ?
              {reg97[(3'h6):(2'h2)]} : reg92));
        end
      reg111 <= (^~$signed((^~{((8'hac) ? reg84 : wire65)})));
    end
  module112 #() modinst139 (.wire117(reg102), .y(wire138), .wire114(reg101), .wire113(reg94), .wire115(reg111), .clk(clk), .wire116(reg90));
  assign wire140 = $signed(reg91[(1'h1):(1'h0)]);
  module141 #() modinst154 (.wire145(reg83), .wire144(wire66), .y(wire153), .clk(clk), .wire143(reg110), .wire146(wire70), .wire142(reg104));
  assign wire155 = (8'hb4);
  assign wire156 = $signed(({reg89, $signed((wire71 <<< wire68))} ?
                       (^~reg74) : reg106[(3'h4):(2'h2)]));
  always
    @(posedge clk) begin
      if ($signed(($signed(reg84) ?
          (+$unsigned($signed(reg92))) : $signed($unsigned((reg87 - reg73))))))
        begin
          reg157 <= {$unsigned($signed({(wire140 ? (7'h43) : wire138),
                  $signed(reg73)})),
              $signed(wire65)};
          reg158 <= reg108[(3'h4):(2'h2)];
        end
      else
        begin
          reg157 <= (~|(~&(((reg110 ? reg89 : reg81) < (wire16 ?
                  reg101 : reg75)) ?
              reg108 : ((reg95 + reg81) ?
                  $unsigned(reg103) : $unsigned(reg105)))));
          reg158 <= ((reg84[(2'h3):(1'h1)] ?
              (reg158[(5'h13):(4'h9)] ?
                  (8'hb5) : ($signed(reg86) ^~ {reg72,
                      (7'h43)})) : (!$unsigned(wire21))) & reg107[(3'h5):(2'h3)]);
        end
      if ({reg98[(4'hb):(2'h2)]})
        begin
          reg159 <= ((^~reg100) ~^ {$unsigned((^~reg103)), reg84});
          if ($signed((^reg83)))
            begin
              reg160 <= (8'ha6);
              reg161 <= (((reg95[(2'h2):(1'h0)] ?
                      $signed((~^(8'h9f))) : reg82[(4'hc):(4'ha)]) ?
                  wire68 : $signed((^$unsigned(wire153)))) >>> wire68[(3'h4):(1'h1)]);
              reg162 <= ((wire16[(4'ha):(4'h8)] ? reg74 : $unsigned(wire67)) ?
                  ((((reg96 * reg83) <<< (|reg78)) <<< $unsigned(reg95)) <<< $unsigned((|(^reg157)))) : reg85[(3'h5):(3'h4)]);
              reg163 <= (8'hb9);
            end
          else
            begin
              reg160 <= $signed(reg75[(2'h2):(2'h2)]);
              reg161 <= reg107[(3'h5):(3'h4)];
            end
          reg164 <= reg107[(4'ha):(4'h8)];
        end
      else
        begin
          reg159 <= wire66[(3'h7):(1'h0)];
          reg160 <= ($unsigned($signed((-wire156[(4'ha):(4'ha)]))) ?
              wire155[(4'hd):(4'hc)] : (((~^reg101) ?
                  reg85 : (~&(reg161 && reg103))) <<< wire16[(4'h9):(1'h1)]));
          reg161 <= (~$unsigned($signed((8'h9c))));
          if (($signed(({reg79[(1'h1):(1'h1)], $unsigned(reg158)} <= {((8'ha0) ?
                  reg83 : wire155)})) == ((^((reg92 > (8'haa)) != reg72[(1'h0):(1'h0)])) + $unsigned((reg80[(2'h2):(2'h2)] ?
              (reg164 ? (8'hb9) : reg164) : reg158[(5'h14):(1'h0)])))))
            begin
              reg162 <= (-$signed(reg83));
            end
          else
            begin
              reg162 <= wire138[(2'h2):(1'h0)];
              reg163 <= ((reg96 ? reg78[(1'h1):(1'h0)] : reg160) ?
                  (reg100[(4'hf):(4'hc)] ?
                      {($unsigned(reg95) <<< (reg95 <= reg103)),
                          $signed((~^reg100))} : $unsigned(wire67)) : ((~^reg88[(4'hb):(4'ha)]) ?
                      reg85[(2'h2):(2'h2)] : ((^reg83) ?
                          {$unsigned(wire19),
                              (reg99 ? (8'hb7) : wire65)} : {$unsigned(wire16),
                              $unsigned(reg91)})));
              reg164 <= wire21;
              reg165 <= $signed($signed($signed(reg76)));
            end
          reg166 <= (((~^(wire21[(2'h3):(1'h0)] ?
              (&wire65) : (~|reg77))) != ($signed($signed(reg105)) >>> {$signed(reg83)})) & reg158);
        end
      reg167 <= ({$unsigned((^wire21)),
              $signed(($signed(reg162) >> (reg106 * wire65)))} ?
          (^reg87) : (~&wire65[(4'hc):(4'hc)]));
    end
  always
    @(posedge clk) begin
      reg168 <= $unsigned(reg159);
      reg169 <= reg84[(1'h1):(1'h0)];
      reg170 <= (reg92 ? wire17[(2'h2):(1'h1)] : reg90[(5'h10):(1'h1)]);
      reg171 <= $unsigned({(reg167 <<< $signed($signed((7'h42))))});
    end
endmodule

module module141  (y, clk, wire146, wire145, wire144, wire143, wire142);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire146;
  input wire signed [(3'h6):(1'h0)] wire145;
  input wire signed [(4'ha):(1'h0)] wire144;
  input wire [(4'hb):(1'h0)] wire143;
  input wire signed [(4'hd):(1'h0)] wire142;
  wire [(3'h4):(1'h0)] wire150;
  wire signed [(5'h14):(1'h0)] wire149;
  wire signed [(3'h7):(1'h0)] wire148;
  wire [(4'h8):(1'h0)] wire147;
  reg signed [(5'h11):(1'h0)] reg152 = (1'h0);
  reg [(4'ha):(1'h0)] reg151 = (1'h0);
  assign y = {wire150, wire149, wire148, wire147, reg152, reg151, (1'h0)};
  assign wire147 = wire144[(1'h0):(1'h0)];
  assign wire148 = ($unsigned($unsigned($signed($signed(wire143)))) ^~ wire143[(4'hb):(3'h6)]);
  assign wire149 = ((((wire146[(3'h7):(2'h3)] ?
                           {(8'hb5)} : (wire145 + wire142)) | ((wire146 ?
                           wire142 : wire146) || wire147[(3'h4):(2'h2)])) && wire143) ?
                       (|$unsigned((+{wire142}))) : ($unsigned($signed($signed(wire142))) != {((wire145 ?
                               wire147 : (8'hb3)) && wire144[(4'h9):(3'h4)]),
                           ((wire143 >= wire146) ?
                               wire144 : wire146[(3'h4):(2'h2)])}));
  assign wire150 = (({wire148, (^wire149[(3'h4):(3'h4)])} ?
                       wire142 : $signed(wire148)) << $signed($unsigned((^{(8'hb8)}))));
  always
    @(posedge clk) begin
      reg151 <= $unsigned(wire146);
      reg152 <= ((^($unsigned($unsigned((8'hbd))) << $unsigned(wire148[(1'h0):(1'h0)]))) ?
          {(((wire144 + wire143) ~^ (wire143 ? wire143 : wire146)) ?
                  ((wire147 <<< (8'ha8)) ?
                      $signed(wire149) : (7'h41)) : $unsigned((wire146 ?
                      wire148 : (8'ha1)))),
              wire146[(3'h6):(1'h1)]} : (+$signed(((wire142 > wire142) - (wire144 >>> wire143)))));
    end
endmodule

module module112
#(parameter param136 = ((~&(~^({(7'h41), (8'h9f)} <= ((8'had) ~^ (8'hae))))) ? (((((8'ha1) ? (8'hbe) : (8'ha9)) >>> ((8'h9e) & (8'ha6))) > (~|(~(8'hb4)))) ^ ((|(-(8'ha0))) ? (8'haf) : {{(8'h9e), (8'hb1)}})) : (-(|(((8'h9c) - (8'ha4)) ? {(8'hbd), (8'hbc)} : ((8'ha6) ? (8'h9d) : (8'hbe)))))), 
parameter param137 = (((param136 ? param136 : (~&(^~(8'hba)))) ? (^~({(8'hb7), param136} ? (~^param136) : (~param136))) : ((~&(param136 ? (7'h43) : param136)) ? param136 : (((8'ha9) ? (8'hbb) : param136) ? (param136 ? param136 : param136) : {param136, param136}))) ? (&(|({param136} | param136))) : {param136}))
(y, clk, wire117, wire116, wire115, wire114, wire113);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire117;
  input wire [(4'he):(1'h0)] wire116;
  input wire [(5'h10):(1'h0)] wire115;
  input wire [(3'h5):(1'h0)] wire114;
  input wire [(4'h9):(1'h0)] wire113;
  wire signed [(4'ha):(1'h0)] wire135;
  wire [(4'hb):(1'h0)] wire134;
  wire [(5'h15):(1'h0)] wire133;
  wire [(5'h14):(1'h0)] wire132;
  wire [(5'h14):(1'h0)] wire131;
  wire [(5'h13):(1'h0)] wire130;
  wire signed [(4'hb):(1'h0)] wire129;
  wire [(3'h6):(1'h0)] wire128;
  wire signed [(3'h6):(1'h0)] wire127;
  wire signed [(4'hd):(1'h0)] wire120;
  wire [(4'hc):(1'h0)] wire119;
  wire [(5'h10):(1'h0)] wire118;
  reg signed [(4'hc):(1'h0)] reg126 = (1'h0);
  reg [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg122 = (1'h0);
  reg [(3'h6):(1'h0)] reg121 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire120,
                 wire119,
                 wire118,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 (1'h0)};
  assign wire118 = $unsigned((($unsigned($signed(wire113)) ?
                       ((8'hb2) ?
                           $signed(wire114) : $unsigned(wire115)) : wire115) && (wire113[(4'h9):(3'h4)] ?
                       $signed((wire117 ? wire115 : wire116)) : wire116)));
  assign wire119 = (~&(-(wire115[(5'h10):(2'h3)] > $signed((+wire113)))));
  assign wire120 = (|wire116);
  always
    @(posedge clk) begin
      reg121 <= {$signed((((~wire120) ?
              (wire114 ?
                  wire113 : (8'ha7)) : (wire114 <= wire117)) | wire115[(4'he):(4'hc)])),
          $unsigned((8'h9d))};
      reg122 <= wire118;
    end
  always
    @(posedge clk) begin
      if (wire120[(4'hb):(4'h8)])
        begin
          reg123 <= ($signed($signed(wire120[(4'hd):(3'h7)])) | $signed(({(|reg122),
              wire120} >> $signed((^~wire118)))));
        end
      else
        begin
          reg123 <= wire117[(2'h2):(1'h1)];
          reg124 <= wire115;
          reg125 <= $unsigned($signed(wire116[(3'h6):(1'h1)]));
          reg126 <= wire119[(3'h5):(3'h5)];
        end
    end
  assign wire127 = $signed((8'ha0));
  assign wire128 = $unsigned(wire117[(1'h0):(1'h0)]);
  assign wire129 = wire119[(4'hc):(4'hb)];
  assign wire130 = $signed((wire114[(2'h2):(1'h0)] ?
                       $unsigned((wire120[(3'h7):(3'h5)] ?
                           ((8'ha4) <= wire115) : $unsigned((8'hb7)))) : reg125));
  assign wire131 = (($unsigned($unsigned(wire127)) ?
                           wire127 : {((wire116 ? reg122 : reg123) ?
                                   $unsigned(reg123) : wire127[(3'h5):(2'h2)]),
                               wire120[(4'hd):(3'h4)]}) ?
                       (reg126 <= wire127[(2'h2):(1'h1)]) : $unsigned($unsigned(((-wire118) ?
                           (wire118 << wire118) : wire118[(4'hf):(2'h3)]))));
  assign wire132 = (~^{$unsigned(($signed(wire128) ?
                           (8'haf) : (wire129 ? wire129 : wire115))),
                       $unsigned(reg124[(3'h5):(3'h5)])});
  assign wire133 = {($signed((((8'ha1) ? wire120 : (8'hbc)) ?
                               $unsigned(wire129) : (+wire118))) ?
                           (-((^~wire130) ?
                               wire118 : $unsigned(wire118))) : $signed(((^(8'ha3)) ?
                               $unsigned(wire114) : wire128)))};
  assign wire134 = (+$signed($signed(((wire129 ? wire120 : wire115) > (wire129 ?
                       wire115 : wire114)))));
  assign wire135 = (~^(8'hb3));
endmodule

module module23
#(parameter param61 = {(({((8'ha6) ? (8'hb7) : (8'hbc)), ((8'hac) ? (8'hb0) : (8'haa))} ? ({(8'hae), (8'ha3)} ? ((8'hb7) ? (8'ha7) : (7'h43)) : {(8'ha8), (8'h9f)}) : (((8'had) ? (8'had) : (8'ha9)) ? (+(8'hac)) : (|(8'hac)))) == ((~^((8'hbe) + (8'hbc))) * (!(8'hbb))))}, 
parameter param62 = (8'ha5))
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire28;
  input wire signed [(4'h9):(1'h0)] wire27;
  input wire signed [(4'hf):(1'h0)] wire26;
  input wire signed [(3'h5):(1'h0)] wire25;
  input wire signed [(4'hf):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire60;
  wire signed [(5'h15):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire42;
  wire [(3'h5):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire29;
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  assign y = {wire60,
                 wire56,
                 wire55,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg59,
                 reg58,
                 reg57,
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
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire29 = (wire25[(2'h3):(2'h2)] < $signed(wire27[(3'h7):(3'h6)]));
  assign wire30 = wire26[(4'he):(1'h1)];
  assign wire31 = $signed($unsigned((~|{wire25})));
  assign wire32 = $unsigned(((|wire30[(3'h6):(1'h1)]) ?
                      {$unsigned(wire30)} : wire29[(1'h0):(1'h0)]));
  assign wire33 = ((~|(~&$unsigned(wire25[(1'h1):(1'h0)]))) ?
                      {$unsigned(wire29[(1'h0):(1'h0)])} : (|wire27));
  assign wire34 = $signed(wire28[(5'h14):(4'ha)]);
  always
    @(posedge clk) begin
      reg35 <= $signed($unsigned(wire25[(1'h1):(1'h0)]));
      if ((wire26[(4'hf):(4'he)] ?
          (|({wire27[(3'h6):(3'h4)]} ?
              ((wire31 >> wire27) + $signed(wire28)) : wire32)) : (8'haa)))
        begin
          reg36 <= (+$signed(wire27));
        end
      else
        begin
          if (wire27)
            begin
              reg36 <= ((~wire24) ?
                  $unsigned(({$unsigned(wire31)} >>> $unsigned($unsigned(wire32)))) : $unsigned((($unsigned(wire27) ?
                      $signed((8'had)) : wire27[(3'h7):(3'h7)]) & $signed((wire31 > (8'h9c))))));
              reg37 <= wire32;
              reg38 <= (8'hac);
            end
          else
            begin
              reg36 <= wire27;
              reg37 <= (reg38[(3'h7):(2'h3)] <<< ($unsigned((((8'hb6) ^ reg38) ?
                      (&reg37) : (wire33 ? (7'h41) : wire33))) ?
                  (^wire33) : $unsigned($unsigned((wire33 <<< (7'h41))))));
              reg38 <= ($unsigned($unsigned(reg35)) ?
                  $unsigned($unsigned((~|(reg38 < reg38)))) : $unsigned((~&((wire28 || wire30) ?
                      (|(8'hb8)) : wire33[(2'h2):(2'h2)]))));
            end
        end
      reg39 <= ($signed((reg37 ?
              $signed($unsigned(reg35)) : $unsigned((wire25 >> reg35)))) ?
          {$unsigned((^~wire26[(4'hc):(4'hc)])),
              $unsigned($unsigned((reg38 ?
                  wire33 : wire26)))} : ($signed($unsigned((~^reg37))) ?
              ({{wire24, wire34}, $unsigned((8'hbf))} > ($unsigned((8'h9f)) ?
                  wire27[(4'h9):(2'h2)] : $signed(wire29))) : $unsigned($unsigned(wire34))));
      reg40 <= (~^$signed((8'ha2)));
    end
  assign wire41 = (8'hba);
  assign wire42 = {(8'hbc)};
  assign wire43 = ((~&(reg39[(4'hc):(3'h6)] << (!(wire29 ?
                          (8'hbc) : wire31)))) ?
                      (!(~^$signed(reg35))) : ((|(wire27[(4'h9):(4'h8)] ~^ (wire34 | wire34))) + (wire29 ^ wire28[(4'ha):(3'h4)])));
  assign wire44 = wire25;
  always
    @(posedge clk) begin
      reg45 <= wire33[(3'h4):(2'h2)];
      reg46 <= wire32;
      if (((~{{$signed(wire44), ((8'hbe) * (8'hbf))}, reg46[(3'h5):(2'h2)]}) ?
          (~|wire27[(3'h5):(3'h5)]) : (wire24 || $signed((wire44[(4'hc):(4'h8)] ?
              wire31[(4'hc):(4'h8)] : reg40[(4'hd):(3'h4)])))))
        begin
          if ($unsigned((+(!{(wire32 ? reg35 : wire41), (wire28 || reg46)}))))
            begin
              reg47 <= reg45[(2'h2):(1'h1)];
              reg48 <= ((reg40[(3'h5):(2'h3)] ?
                      ($unsigned($unsigned(reg40)) != reg36) : wire24) ?
                  wire29 : (-(reg35 ?
                      (-$signed(wire33)) : $signed({wire26, reg45}))));
              reg49 <= ((wire43[(2'h2):(2'h2)] ?
                      $signed($signed((!wire26))) : $signed($unsigned(((8'ha6) != wire42)))) ?
                  $signed(((+wire43) < wire33[(2'h2):(1'h0)])) : {(wire33[(4'h9):(1'h0)] <= reg40)});
              reg50 <= ((&{((-wire30) + $unsigned(wire42))}) ?
                  (($signed({wire27}) ?
                      (((8'ha5) | wire26) ?
                          (wire41 ?
                              wire43 : wire32) : $signed(reg49)) : $signed(wire32)) | ($signed($signed(reg49)) ?
                      reg37[(4'hd):(4'hb)] : ($signed(reg39) ?
                          wire26 : reg36[(3'h4):(1'h0)]))) : (^wire31));
              reg51 <= $signed(wire33[(1'h0):(1'h0)]);
            end
          else
            begin
              reg47 <= (($unsigned((reg50 ? (+reg37) : (~|wire33))) ?
                  (8'hb8) : $unsigned((7'h42))) != ($signed($unsigned({reg46,
                      wire24})) ?
                  $signed({wire33}) : ((wire24[(4'ha):(4'h9)] ?
                          (wire32 ? reg39 : reg45) : wire27) ?
                      ((wire33 | wire30) ?
                          (wire25 ?
                              reg39 : (8'hb3)) : $unsigned(reg50)) : (~^(~&(8'hbd))))));
              reg48 <= reg35[(3'h4):(2'h3)];
              reg49 <= $unsigned($signed({reg51, (+{reg38, wire43})}));
            end
          reg52 <= $unsigned((!(((~|reg37) ?
              wire30[(4'h9):(3'h7)] : {wire26}) ^~ ((7'h41) ?
              $unsigned(reg51) : ((8'hbb) ? wire31 : reg47)))));
          reg53 <= $unsigned(wire30[(3'h5):(3'h5)]);
          reg54 <= wire44[(4'hc):(4'h8)];
        end
      else
        begin
          if ({$unsigned(reg35[(5'h14):(3'h6)])})
            begin
              reg47 <= {$signed(wire41),
                  (($unsigned((8'ha9)) * (^~reg39)) ? reg45 : (~^reg47))};
              reg48 <= $signed((((((7'h41) ? (8'hba) : reg35) ?
                  reg50 : (reg38 - reg50)) + {(reg45 ?
                      wire29 : wire29)}) ^ ({(~|reg37)} ?
                  $signed({reg49}) : {reg50, (reg49 ? wire26 : reg39)})));
            end
          else
            begin
              reg47 <= ($unsigned(wire27[(1'h0):(1'h0)]) ?
                  ($signed((^wire42[(3'h5):(2'h2)])) * (~^reg36)) : (^wire32[(2'h2):(1'h1)]));
            end
          reg49 <= (~$signed($unsigned(wire43)));
          reg50 <= (8'hb1);
          reg51 <= (~|$unsigned((wire28 & wire32[(1'h0):(1'h0)])));
        end
    end
  assign wire55 = wire24[(3'h6):(2'h2)];
  assign wire56 = wire24[(4'hd):(3'h4)];
  always
    @(posedge clk) begin
      reg57 <= reg45;
      reg58 <= (reg50[(1'h0):(1'h0)] >= wire24[(4'h8):(1'h1)]);
      reg59 <= {(({$unsigned(reg52), reg36} ?
              wire43[(3'h5):(3'h4)] : {(^~reg45)}) ^ wire42[(1'h0):(1'h0)]),
          $signed($unsigned(reg52))};
    end
  assign wire60 = reg48[(1'h1):(1'h1)];
endmodule
