module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire99;
  wire signed [(5'h14):(1'h0)] wire98;
  wire [(3'h6):(1'h0)] wire97;
  wire [(2'h3):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire86;
  reg [(2'h2):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  reg [(5'h10):(1'h0)] reg89 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire88,
                 wire86,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 (1'h0)};
  module4 #() modinst87 (.wire9((8'hb4)), .wire6(wire0), .clk(clk), .wire8(wire2), .y(wire86), .wire7(wire3), .wire5(wire1));
  assign wire88 = (&$unsigned($signed(wire1[(2'h3):(1'h1)])));
  always
    @(posedge clk) begin
      reg89 <= $unsigned(($signed({((8'hb0) ? (8'hbe) : wire1)}) ?
          {(-wire86[(5'h10):(5'h10)]),
              {wire86[(4'he):(1'h0)], $signed(wire1)}} : wire3));
      reg90 <= ((&wire1[(4'hb):(4'hb)]) ?
          $unsigned($signed(($unsigned(wire3) ?
              {reg89, wire0} : (-wire3)))) : $signed({wire0, (8'hbd)}));
      reg91 <= ($signed(reg90[(3'h4):(3'h4)]) > wire86[(2'h2):(1'h1)]);
      reg92 <= $unsigned(reg89[(3'h7):(1'h1)]);
      if ($unsigned($signed(wire88)))
        begin
          reg93 <= wire2;
          if (wire3[(2'h2):(2'h2)])
            begin
              reg94 <= wire1[(4'hd):(3'h6)];
              reg95 <= wire88[(1'h1):(1'h0)];
              reg96 <= {((wire1 >= ($unsigned(reg94) ^~ $signed(reg90))) != (((wire3 >= wire0) ?
                      wire86[(4'hd):(4'hb)] : wire3) << (~|reg91))),
                  reg89[(3'h4):(2'h3)]};
            end
          else
            begin
              reg94 <= (((~|($signed(reg91) - wire1[(3'h5):(1'h1)])) == (~|({(8'hbe)} + wire3[(4'hc):(1'h1)]))) ~^ $unsigned($unsigned($signed(reg94[(3'h5):(1'h0)]))));
            end
        end
      else
        begin
          if ($unsigned({$signed(wire1)}))
            begin
              reg93 <= ({reg91, $signed(({reg95} > (+wire3)))} ?
                  (&$unsigned(reg94)) : (8'ha0));
              reg94 <= $signed($unsigned((~|$signed(((8'h9e) ?
                  reg96 : reg96)))));
              reg95 <= ($signed(($unsigned(reg90[(2'h2):(2'h2)]) ?
                  (~^wire1) : {(wire3 ? (8'h9e) : reg96),
                      (~^wire88)})) * ((-$signed((~^(8'ha4)))) & {((reg93 ?
                          reg93 : reg96) ?
                      $signed(wire2) : {reg92}),
                  reg96}));
              reg96 <= ($signed($signed(((~|reg95) ?
                  (reg95 ?
                      wire3 : wire1) : (reg93 && reg94)))) ~^ (wire1 & $unsigned($unsigned((|(8'hb7))))));
            end
          else
            begin
              reg93 <= reg92[(4'hd):(3'h7)];
              reg94 <= (reg91 >>> $signed(wire1));
              reg95 <= (($signed(reg89[(4'hf):(4'ha)]) ?
                      (((~reg93) ?
                          $signed((8'hb0)) : $unsigned(reg89)) & $signed(reg89[(3'h4):(1'h0)])) : wire1) ?
                  (~|$signed($unsigned(reg95[(1'h0):(1'h0)]))) : ({{(wire0 + wire2),
                              {reg92, wire86}},
                          $unsigned($unsigned(reg92))} ?
                      $unsigned((+wire86[(3'h5):(2'h3)])) : (8'ha7)));
              reg96 <= (reg90 >>> (^~{($signed(reg93) == wire1[(4'hc):(4'hc)])}));
            end
        end
    end
  assign wire97 = $unsigned(reg96[(2'h2):(1'h1)]);
  assign wire98 = wire86;
  assign wire99 = $unsigned(((~($signed(reg94) || $unsigned(wire2))) <<< $signed((~^$signed(wire98)))));
endmodule

module module4
#(parameter param85 = ((((((8'h9c) ? (8'hb8) : (7'h42)) >>> ((8'hb5) > (7'h41))) && (~&((8'ha6) <<< (8'hae)))) * ((((7'h43) ^~ (8'haf)) ? (8'h9e) : ((8'ha6) ? (8'ha7) : (7'h41))) ? (((8'ha9) ? (8'hb6) : (8'hbd)) ^~ ((8'hac) >>> (8'haf))) : (((7'h44) << (8'hbc)) < (^(8'ha5))))) <<< (^~((~((8'had) ? (7'h41) : (8'ha2))) ~^ (|(^~(8'ha6)))))))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire5;
  input wire [(4'hd):(1'h0)] wire6;
  input wire signed [(4'hc):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire84;
  wire signed [(5'h13):(1'h0)] wire83;
  wire [(5'h12):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire80;
  assign y = {wire84, wire83, wire82, wire80, (1'h0)};
  module10 #() modinst81 (wire80, clk, wire6, wire8, wire9, wire5, wire7);
  assign wire82 = (^wire8);
  assign wire83 = $signed((+$signed($signed($unsigned((8'h9c))))));
  assign wire84 = $unsigned((!(-$unsigned(((8'h9c) + (8'hac))))));
endmodule

module module10
#(parameter param79 = {(((((8'hb3) < (8'hb7)) == {(8'hb2), (8'hba)}) ? {((8'hba) & (8'hbe))} : (((8'hbd) >= (8'ha7)) ? ((8'hb3) ? (8'hbd) : (8'hab)) : (^(8'hae)))) ? ((((8'hba) ~^ (7'h41)) ? {(8'hb0)} : (+(8'hb9))) << ((|(8'hb8)) ? (^~(8'h9c)) : ((8'ha0) | (8'ha6)))) : {{(8'had)}, (~|((8'ha5) != (8'hab)))}), {({((7'h42) ? (8'hb8) : (8'hba))} ? {(~|(8'hbb)), ((8'hb5) ? (8'hb7) : (8'hb5))} : (((8'had) > (8'hb7)) << ((8'hb8) & (8'hbc))))}})
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h298):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire15;
  input wire signed [(4'he):(1'h0)] wire14;
  input wire signed [(4'he):(1'h0)] wire13;
  input wire [(4'hc):(1'h0)] wire12;
  input wire signed [(3'h7):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire45;
  wire [(5'h11):(1'h0)] wire44;
  wire [(4'hc):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire17;
  wire [(4'hb):(1'h0)] wire16;
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire21,
                 wire20,
                 wire19,
                 wire17,
                 wire16,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg68,
                 reg67,
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
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg18,
                 (1'h0)};
  assign wire16 = wire12;
  assign wire17 = (8'ha5);
  always
    @(posedge clk) begin
      reg18 <= ($signed(($signed((~&wire12)) & ($unsigned(wire12) & (wire13 <<< wire14)))) ^ ((^~wire16) - (+wire11)));
    end
  assign wire19 = (wire12[(4'h8):(3'h5)] ?
                      (8'hbb) : (((((8'hb8) + wire13) ^~ wire15) & ({(8'hb6)} ?
                              (wire16 & wire11) : $signed(wire12))) ?
                          (wire13[(4'ha):(4'ha)] ?
                              $unsigned(wire14[(4'hb):(1'h1)]) : $unsigned($signed(wire15))) : {wire11}));
  assign wire20 = wire15;
  assign wire21 = ((&wire13) < $unsigned(wire16[(4'h9):(1'h1)]));
  always
    @(posedge clk) begin
      reg22 <= wire17;
      if (reg22)
        begin
          reg23 <= ({(wire15[(3'h4):(1'h1)] ?
                      (wire20 <<< $signed(wire14)) : wire17)} ?
              $unsigned($unsigned(((wire21 ?
                  wire15 : wire17) >>> wire12))) : ($signed($unsigned($unsigned(reg18))) <= (!{(wire21 ?
                      wire19 : reg22)})));
          reg24 <= $signed((!{$unsigned(wire14[(4'h9):(1'h0)]),
              wire13[(4'ha):(3'h7)]}));
        end
      else
        begin
          reg23 <= (reg18[(2'h3):(2'h2)] == ($signed(reg22) ?
              ((!(^~reg24)) ?
                  ({wire15,
                      wire21} != wire14) : wire19) : ($signed($unsigned(wire19)) ?
                  ((reg24 && wire16) ?
                      $signed(wire16) : (wire20 && wire19)) : ((wire15 != (8'hb7)) <<< ((8'hbb) | wire13)))));
          reg24 <= wire20;
          reg25 <= wire15[(2'h2):(1'h0)];
        end
      if ($signed($unsigned(wire11[(3'h4):(2'h2)])))
        begin
          reg26 <= $unsigned(wire16[(2'h2):(1'h0)]);
          reg27 <= $unsigned((|{{wire20[(4'h9):(3'h6)]},
              $unsigned((wire15 ^~ wire21))}));
          reg28 <= ((($signed((~wire21)) ?
                  wire19 : (~^$unsigned(reg27))) != $unsigned($unsigned(wire11))) ?
              $signed($signed(($unsigned((8'hba)) == $signed(wire20)))) : $signed({(8'ha4),
                  $signed($signed(reg23))}));
          reg29 <= (+$signed((wire20[(4'hb):(4'hb)] ?
              reg22[(4'hc):(4'ha)] : {(reg25 ? wire16 : reg26),
                  (reg24 ? (8'ha6) : reg18)})));
        end
      else
        begin
          reg26 <= ((((^~{reg29}) ? (8'hae) : reg23) ?
              $unsigned(wire13[(4'hb):(1'h1)]) : (wire13 ^ wire15)) && $signed($unsigned(wire13[(2'h2):(1'h0)])));
          reg27 <= (~^$unsigned(wire12[(2'h3):(2'h2)]));
          if ({(|$unsigned(($unsigned((7'h43)) < (|wire21))))})
            begin
              reg28 <= $unsigned(wire15[(1'h1):(1'h1)]);
              reg29 <= $signed($unsigned(((8'ha6) ?
                  ($unsigned(reg22) & ((8'hbf) ?
                      wire19 : reg22)) : ((reg25 >> (7'h40)) == $signed(reg26)))));
            end
          else
            begin
              reg28 <= {(wire17[(1'h1):(1'h1)] ?
                      {{{reg27, wire11}},
                          reg23[(4'hf):(4'hf)]} : $unsigned($unsigned((reg18 ?
                          (8'ha7) : reg22))))};
              reg29 <= reg29[(3'h7):(3'h5)];
              reg30 <= ($signed(reg23) << (~{$signed(wire19[(1'h0):(1'h0)])}));
              reg31 <= {wire13};
              reg32 <= $unsigned($signed(reg31[(2'h3):(2'h3)]));
            end
          reg33 <= $unsigned($unsigned(wire20));
          if (wire17[(1'h1):(1'h0)])
            begin
              reg34 <= {{(({wire21, wire20} ?
                          {(8'ha1),
                              reg27} : (^(8'hb3))) ^~ (reg33[(3'h7):(1'h0)] <<< wire16[(4'h8):(1'h1)])),
                      {({reg30} & wire11)}}};
              reg35 <= (~|$signed(wire13));
              reg36 <= $signed(wire12);
              reg37 <= (&$signed($signed($signed($signed(reg36)))));
              reg38 <= ($unsigned($signed((&(reg32 ? (8'ha4) : (8'hba))))) ?
                  {wire16} : {(((wire20 ? (8'ha7) : reg25) ?
                              (wire21 ? reg26 : reg29) : wire12) ?
                          ($signed(reg31) & wire12[(3'h5):(1'h0)]) : ((reg26 ?
                                  reg33 : reg35) ?
                              $unsigned((8'h9c)) : (reg31 ? reg35 : wire21))),
                      (~^(+(reg25 ? reg30 : wire20)))});
            end
          else
            begin
              reg34 <= $signed(reg18[(3'h4):(1'h0)]);
              reg35 <= reg33[(1'h1):(1'h0)];
              reg36 <= reg32[(2'h3):(2'h2)];
            end
        end
      reg39 <= ($signed(reg22[(4'hf):(1'h1)]) ?
          (-wire15[(2'h3):(2'h3)]) : (($unsigned({reg24, (8'hbe)}) ?
              reg37[(4'hb):(3'h5)] : (8'ha5)) == ((wire17[(2'h2):(1'h0)] && (reg28 ?
                  reg23 : wire19)) ?
              ($unsigned((8'ha4)) ?
                  (8'ha3) : wire19[(4'hd):(3'h4)]) : $unsigned({wire15}))));
      reg40 <= $signed((+($signed((wire19 ? reg32 : reg34)) ?
          reg34 : $unsigned({reg30, wire20}))));
    end
  assign wire41 = (reg39 ? wire20[(3'h7):(2'h2)] : (8'hbb));
  assign wire42 = reg18[(3'h4):(1'h1)];
  assign wire43 = (reg31 ?
                      ($signed(((reg32 < reg32) > wire21)) + {$signed($unsigned(reg23)),
                          ($signed((8'hb0)) ?
                              wire13[(2'h2):(1'h1)] : $signed(reg25))}) : ($unsigned(reg39[(2'h2):(1'h0)]) >> $signed(($unsigned(reg39) || (reg37 ?
                          wire14 : reg30)))));
  assign wire44 = reg37;
  assign wire45 = $unsigned({((~(wire13 ? wire43 : wire11)) ?
                          $unsigned((8'hb2)) : reg29[(1'h1):(1'h1)]),
                      ($unsigned((reg32 ? wire43 : wire16)) ?
                          $signed($signed(reg38)) : ($signed((8'ha7)) ?
                              reg31 : $signed(reg25)))});
  assign wire46 = $signed($unsigned((^wire45)));
  assign wire47 = ({(reg36 >= $signed((reg32 + wire45))),
                          ($unsigned($unsigned((8'ha4))) + $unsigned($unsigned(wire16)))} ?
                      ($signed({{wire42, reg26}, $signed(reg39)}) ?
                          $unsigned((reg34 == wire17)) : (wire19[(4'h9):(1'h1)] ?
                              {$signed(wire19),
                                  {reg25, wire21}} : {$unsigned(reg26),
                                  $signed(reg40)})) : {($unsigned($signed(reg38)) >> $signed((7'h40))),
                          $signed((-{wire16}))});
  assign wire48 = {(-wire44),
                      $unsigned((wire41[(2'h3):(1'h1)] ?
                          $signed(wire11[(3'h4):(2'h3)]) : $unsigned($signed(wire14))))};
  assign wire49 = {(-reg39[(2'h3):(2'h2)]), wire17};
  always
    @(posedge clk) begin
      if ($signed((8'ha6)))
        begin
          if (reg28)
            begin
              reg50 <= ((reg22 * $unsigned({(^~reg24)})) ?
                  wire44[(4'h8):(2'h2)] : {(reg30 & $unsigned(reg33[(3'h4):(2'h3)]))});
              reg51 <= (!{$unsigned(((!wire47) ?
                      $signed(wire47) : (wire44 * reg28)))});
            end
          else
            begin
              reg50 <= ($signed($signed($signed((wire14 ? reg23 : wire19)))) ?
                  (^(reg37[(3'h6):(1'h0)] || wire20[(4'he):(3'h6)])) : (~($unsigned({wire14}) == ({wire41,
                      wire49} ~^ (wire43 <= wire44)))));
              reg51 <= ((7'h44) * reg39[(2'h3):(2'h2)]);
            end
          if (wire11[(3'h7):(1'h0)])
            begin
              reg52 <= reg24;
            end
          else
            begin
              reg52 <= (^~(reg30 ? wire16 : $unsigned($signed((~^reg52)))));
            end
          if ({(reg22 ?
                  (8'hb1) : $signed((wire49[(4'h8):(2'h2)] - (wire19 ?
                      wire44 : reg31)))),
              reg29[(3'h5):(1'h1)]})
            begin
              reg53 <= reg31[(3'h5):(3'h5)];
              reg54 <= $signed($unsigned($unsigned((~|wire49[(3'h4):(2'h3)]))));
              reg55 <= $signed(reg31[(1'h0):(1'h0)]);
              reg56 <= (~$unsigned((reg36 ^ {$unsigned(wire42),
                  (wire19 ? wire45 : wire46)})));
            end
          else
            begin
              reg53 <= (-($signed((reg52 || $signed(reg30))) ?
                  ((&(^~(8'hac))) <= $signed(reg38)) : reg28));
              reg54 <= (~($unsigned((8'h9d)) || (wire42 & $unsigned((-(8'hb0))))));
            end
          reg57 <= {(~^((&(~&wire16)) ? reg34 : (7'h44)))};
          if (({(((7'h42) + reg52) * ((~&(8'ha6)) * {wire48,
                  (8'ha2)}))} - $unsigned(($signed((~|wire16)) ?
              $unsigned($signed(wire12)) : $signed({reg27, reg39})))))
            begin
              reg58 <= $unsigned((wire14 ?
                  ($unsigned($signed(reg29)) * reg57) : ((^~$unsigned((8'hb2))) ?
                      {{reg22},
                          $signed(reg57)} : $unsigned($unsigned(wire12)))));
            end
          else
            begin
              reg58 <= ((~&wire48[(4'h8):(3'h6)]) ?
                  reg22[(1'h0):(1'h0)] : reg29);
              reg59 <= (reg54 ?
                  (&wire43) : $unsigned($signed($unsigned((reg25 ?
                      reg22 : wire43)))));
            end
        end
      else
        begin
          reg50 <= $unsigned(reg36[(2'h2):(1'h1)]);
        end
      if (wire17[(1'h0):(1'h0)])
        begin
          reg60 <= reg23[(2'h2):(2'h2)];
          reg61 <= (({($unsigned((8'ha5)) <= wire43)} == ((~|wire49[(2'h2):(2'h2)]) << {(reg29 != reg55)})) ?
              (~^(reg29 > (+$unsigned(reg36)))) : (~|((8'h9e) > reg27)));
        end
      else
        begin
          reg60 <= (wire44[(3'h6):(3'h6)] ?
              ($signed(reg60[(3'h4):(2'h3)]) ?
                  ((~^$unsigned(reg26)) ~^ (reg52[(2'h2):(1'h1)] ?
                      (reg56 << reg55) : $unsigned((8'h9d)))) : reg50) : reg53);
          if ({$unsigned(wire16[(1'h0):(1'h0)])})
            begin
              reg61 <= $unsigned({$signed({$unsigned(reg30), {reg39, reg32}}),
                  (wire15 * wire49)});
              reg62 <= $unsigned((|$signed(($unsigned(wire11) == $signed(reg34)))));
              reg63 <= (^~reg40);
            end
          else
            begin
              reg61 <= (reg23[(4'hf):(4'hb)] | reg31[(3'h5):(3'h5)]);
              reg62 <= reg59;
              reg63 <= ((reg18 ?
                      $signed(((reg29 & reg33) ^~ {(8'h9d),
                          reg22})) : $unsigned($signed($unsigned((8'ha4))))) ?
                  (($signed({reg37}) <= $signed($unsigned((8'hbf)))) | ({reg39,
                          (reg23 ? reg53 : reg50)} ?
                      reg23 : wire12[(3'h7):(3'h7)])) : (((~(reg52 + reg22)) <= $signed((wire19 ?
                      wire41 : (8'hbd)))) <<< (^(wire19 & (reg28 ?
                      (8'ha1) : reg40)))));
              reg64 <= $signed((wire42 & ((~&reg60) == (~|wire19[(5'h11):(4'ha)]))));
              reg65 <= ((reg51[(4'hc):(1'h0)] ?
                      reg63 : ({$signed(wire20)} && reg64[(1'h0):(1'h0)])) ?
                  {reg37[(5'h11):(5'h11)],
                      reg55[(4'hd):(4'ha)]} : reg38[(3'h5):(2'h3)]);
            end
          reg66 <= $unsigned(reg51[(4'hd):(2'h3)]);
        end
      reg67 <= wire43[(2'h3):(2'h2)];
      reg68 <= ($unsigned((^~(|((8'had) - wire46)))) - (((8'hb5) ?
              $signed(reg50) : $unsigned((|(8'hbd)))) ?
          ($unsigned((7'h44)) >>> (~^$unsigned(wire19))) : wire19));
    end
  assign wire69 = $unsigned(wire41[(3'h6):(2'h2)]);
  assign wire70 = ((|{($unsigned(reg65) > (^~reg39))}) <<< $unsigned($unsigned($signed($unsigned(reg52)))));
  always
    @(posedge clk) begin
      reg71 <= ($signed(($signed(reg36[(4'hd):(2'h3)]) ?
              ($unsigned((8'ha8)) ? (|reg40) : reg26) : (^(reg53 ?
                  reg29 : (8'h9d))))) ?
          $signed({((~reg67) ?
                  $unsigned((8'hae)) : (wire12 ?
                      reg38 : reg24))}) : (($unsigned(reg33[(1'h1):(1'h0)]) ?
              wire44[(3'h4):(2'h3)] : (+$unsigned(reg50))) >> wire21[(3'h5):(1'h0)]));
      if (reg66[(2'h3):(1'h0)])
        begin
          reg72 <= ($unsigned(({(reg67 ? reg35 : reg31), (wire44 >>> reg63)} ?
                  ((reg68 ?
                      reg22 : (8'h9e)) << reg30[(4'hb):(1'h0)]) : {reg25})) ?
              (wire17[(1'h1):(1'h1)] >= $unsigned((!$unsigned(reg37)))) : (reg38 << (~((reg51 << reg62) ?
                  ((8'ha3) || wire17) : $signed(wire42)))));
          if ($signed(reg54[(1'h0):(1'h0)]))
            begin
              reg73 <= $signed(reg61);
              reg74 <= $signed(($signed(wire17[(1'h0):(1'h0)]) << ((reg40[(1'h0):(1'h0)] != wire49) && reg68[(2'h2):(1'h0)])));
              reg75 <= (({($unsigned((8'hb8)) ^ {wire69,
                          wire46})} | $unsigned($unsigned(wire42))) ?
                  wire14[(4'he):(4'h9)] : ((^$unsigned(((8'ha9) ?
                      reg31 : wire13))) >= ((!wire14) + (~^$signed(reg56)))));
            end
          else
            begin
              reg73 <= ((+($signed((reg25 + wire69)) ?
                      {reg71} : reg63[(4'h8):(2'h3)])) ?
                  wire12[(4'h8):(1'h0)] : reg74[(5'h10):(1'h1)]);
              reg74 <= reg26;
              reg75 <= ((reg24 ^ $unsigned(reg22)) & reg56[(5'h12):(3'h7)]);
              reg76 <= $unsigned($unsigned((($signed(wire41) <= $signed(reg71)) & reg58[(3'h5):(1'h0)])));
            end
          reg77 <= {((^$unsigned({reg56})) ?
                  $unsigned(($signed((8'hb8)) ?
                      (~|reg26) : (wire44 - wire15))) : reg23),
              $signed(reg36)};
          reg78 <= {(!((((8'hb9) ? wire70 : reg32) || (wire17 <= wire20)) ?
                  ({reg32, reg33} ?
                      (~^wire12) : (reg65 >> wire17)) : reg30[(2'h3):(2'h2)])),
              $unsigned((wire12[(3'h7):(3'h7)] ?
                  ($unsigned(reg52) ?
                      $unsigned(reg61) : (~&(8'hbe))) : (reg67[(1'h0):(1'h0)] > (reg57 ?
                      wire19 : wire70))))};
        end
      else
        begin
          reg72 <= (wire11[(1'h0):(1'h0)] ?
              reg39[(1'h0):(1'h0)] : $signed(wire70[(4'h9):(2'h2)]));
          reg73 <= $unsigned((^$signed(($unsigned((8'hae)) ?
              (8'hab) : $unsigned(wire46)))));
          reg74 <= (|wire48);
          if (((|(((wire11 || reg32) ?
                  (wire70 ? (8'hb2) : wire69) : (wire17 << reg51)) ?
              {$signed(wire16)} : ({wire15} && $unsigned(reg58)))) ^~ {(^reg57)}))
            begin
              reg75 <= $unsigned($signed((reg56 < (+reg40))));
              reg76 <= wire13;
              reg77 <= reg23;
            end
          else
            begin
              reg75 <= ((^~reg26[(4'hc):(4'h8)]) ?
                  reg76 : reg77[(2'h3):(2'h3)]);
              reg76 <= ($unsigned(reg71) || (((~^$signed(reg25)) <<< wire49) ~^ {reg68[(2'h3):(2'h2)],
                  wire21}));
              reg77 <= (reg62[(1'h0):(1'h0)] ?
                  $unsigned((wire43 ?
                      (~$unsigned(reg68)) : (((8'hae) <<< wire42) ^~ (wire69 >= reg61)))) : $unsigned(($signed((reg25 ?
                          wire13 : (8'ha7))) ?
                      $signed(reg56) : reg22[(2'h3):(2'h2)])));
              reg78 <= (reg56 >= reg72[(1'h1):(1'h1)]);
            end
        end
    end
endmodule
