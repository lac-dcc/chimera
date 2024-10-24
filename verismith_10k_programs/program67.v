module top
#(parameter param123 = (-(+({(~&(7'h43))} | {(8'h9c)}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire signed [(5'h10):(1'h0)] wire120;
  wire signed [(5'h11):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire118;
  wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire116;
  reg signed [(5'h14):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire116,
                 reg122,
                 reg121,
                 (1'h0)};
  assign wire4 = wire2[(4'h9):(4'h9)];
  assign wire5 = wire1[(3'h7):(2'h2)];
  assign wire6 = $signed($unsigned(wire1[(3'h6):(1'h1)]));
  assign wire7 = ((wire0[(3'h4):(3'h4)] ?
                         {wire1[(2'h2):(1'h0)]} : wire2[(3'h7):(3'h4)]) ?
                     ((8'hb7) * (wire0[(1'h1):(1'h0)] <<< wire5[(4'h8):(2'h3)])) : {(($signed(wire4) ?
                             (!wire3) : $unsigned(wire1)) & wire3[(5'h15):(4'hd)]),
                         wire3[(5'h10):(4'hf)]});
  assign wire8 = $signed($signed((wire0[(3'h5):(1'h0)] == wire6)));
  assign wire9 = $unsigned((wire4 ? wire7 : {wire5[(5'h10):(1'h1)]}));
  assign wire10 = wire8[(1'h1):(1'h0)];
  assign wire11 = (((~|(8'hae)) ?
                      wire6[(1'h1):(1'h0)] : ($unsigned($unsigned(wire10)) ?
                          wire7 : wire7)) == wire6);
  assign wire12 = wire10[(1'h1):(1'h0)];
  assign wire13 = (wire7[(1'h0):(1'h0)] ?
                      ((8'h9e) ?
                          (8'hb0) : (wire9[(3'h7):(3'h6)] ?
                              wire4 : {$unsigned(wire8),
                                  wire5[(4'ha):(3'h6)]})) : $unsigned((((7'h42) ?
                          (wire0 ?
                              wire8 : (8'hb3)) : $signed(wire2)) & wire9)));
  assign wire14 = {{wire0[(1'h1):(1'h0)]}, (~&wire0[(1'h1):(1'h1)])};
  assign wire15 = {(($unsigned(wire11[(3'h5):(3'h4)]) ?
                          wire0 : (~^$unsigned(wire3))) >>> $signed($unsigned({wire14,
                          wire14})))};
  module16 #() modinst117 (wire116, clk, wire2, wire14, wire5, wire11, wire6);
  assign wire118 = wire14[(3'h6):(1'h1)];
  assign wire119 = (8'hb0);
  assign wire120 = wire119;
  always
    @(posedge clk) begin
      reg121 <= $signed($signed($unsigned((wire116 && (wire5 ?
          wire14 : (8'hbd))))));
      reg122 <= $signed(wire15[(2'h3):(1'h0)]);
    end
endmodule

module module16
#(parameter param114 = ((-(~(~{(8'hb4), (8'hbc)}))) ? {(8'hae)} : (~^((((7'h41) ? (8'hb2) : (8'ha5)) ? ((8'hb4) >> (8'haf)) : ((8'hab) ? (8'ha8) : (7'h44))) ? (((7'h40) + (8'h9d)) ? ((8'ha3) ? (8'hac) : (8'hb3)) : (^(8'hae))) : (+{(8'h9c), (8'hbf)})))), 
parameter param115 = param114)
(y, clk, wire17, wire18, wire19, wire20, wire21);
  output wire [(32'h266):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire17;
  input wire signed [(5'h12):(1'h0)] wire18;
  input wire [(4'ha):(1'h0)] wire19;
  input wire signed [(3'h6):(1'h0)] wire20;
  input wire [(3'h5):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire113;
  wire [(4'hc):(1'h0)] wire112;
  wire signed [(4'h8):(1'h0)] wire111;
  wire signed [(4'hb):(1'h0)] wire110;
  wire [(5'h12):(1'h0)] wire92;
  wire [(5'h10):(1'h0)] wire91;
  wire [(5'h15):(1'h0)] wire90;
  wire signed [(4'he):(1'h0)] wire89;
  wire signed [(5'h11):(1'h0)] wire88;
  wire [(4'ha):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire86;
  wire [(4'hf):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire69;
  reg [(5'h15):(1'h0)] reg109 = (1'h0);
  reg [(4'hd):(1'h0)] reg108 = (1'h0);
  reg [(2'h2):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg105 = (1'h0);
  reg [(3'h6):(1'h0)] reg104 = (1'h0);
  reg [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg102 = (1'h0);
  reg [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg96 = (1'h0);
  reg [(2'h2):(1'h0)] reg95 = (1'h0);
  reg [(5'h13):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg [(5'h15):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire74,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire69,
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
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  assign wire22 = (wire19[(1'h0):(1'h0)] ?
                      (wire19[(3'h4):(1'h1)] ?
                          {(8'hbc),
                              (wire20 == $unsigned((8'hbb)))} : $signed((~&$unsigned(wire17)))) : $signed(wire17[(2'h2):(1'h1)]));
  assign wire23 = $unsigned($signed(({wire22[(4'h9):(1'h0)], (8'hae)} ?
                      (|wire19) : (|(8'ha9)))));
  assign wire24 = (($signed(wire19[(3'h7):(1'h0)]) | $signed($unsigned($unsigned(wire22)))) > $signed($unsigned(wire22)));
  assign wire25 = wire20;
  assign wire26 = wire18[(4'he):(4'ha)];
  module27 #() modinst70 (.wire31(wire19), .wire32(wire22), .y(wire69), .wire28(wire23), .clk(clk), .wire30(wire25), .wire29(wire24));
  always
    @(posedge clk) begin
      reg71 <= $unsigned(($unsigned(wire22) && $signed(wire17)));
      reg72 <= wire23[(4'hc):(4'hb)];
      reg73 <= reg72[(4'hc):(4'h8)];
    end
  assign wire74 = (~(((8'h9c) ? $signed((-wire22)) : {wire24, (~|reg73)}) ?
                      (+reg71[(1'h0):(1'h0)]) : reg71[(3'h5):(3'h5)]));
  always
    @(posedge clk) begin
      reg75 <= (~$signed({(8'h9c), $unsigned(((8'haa) ? (8'h9e) : wire23))}));
      if ($signed($unsigned(wire25)))
        begin
          reg76 <= $unsigned($signed((~^wire23)));
          reg77 <= $signed((~^$signed({reg71[(2'h3):(1'h0)]})));
        end
      else
        begin
          reg76 <= (wire21 | (reg73[(4'ha):(3'h5)] ?
              ($signed(wire19[(4'h8):(3'h7)]) <<< $unsigned(wire17)) : ($unsigned(reg76) >= $signed(wire26))));
          reg77 <= (+$signed(wire26[(3'h5):(3'h5)]));
          if ((!$signed(((~((8'hb7) ? wire26 : reg71)) & ({reg71} ?
              (wire24 ? wire22 : (8'hae)) : ((8'had) ? wire74 : (8'hae)))))))
            begin
              reg78 <= $unsigned(((&{reg71[(3'h4):(1'h0)]}) | $unsigned(wire23[(3'h6):(3'h5)])));
              reg79 <= $signed(((-$signed((reg78 + reg71))) ?
                  $unsigned(wire18[(5'h12):(5'h11)]) : wire69[(4'hb):(3'h7)]));
              reg80 <= (|((wire17[(3'h4):(1'h0)] ?
                      $signed((!wire74)) : ($unsigned((7'h42)) ?
                          wire21[(1'h1):(1'h1)] : wire23)) ?
                  ({(wire21 | reg79)} | wire22[(3'h6):(3'h6)]) : $unsigned($unsigned($unsigned((8'h9d))))));
              reg81 <= (8'h9f);
              reg82 <= $unsigned($signed($unsigned({wire20[(2'h3):(2'h2)]})));
            end
          else
            begin
              reg78 <= reg76[(3'h4):(1'h0)];
            end
          reg83 <= (-(reg82 | wire22[(4'h8):(3'h5)]));
        end
      reg84 <= $unsigned($unsigned((&(wire17[(3'h5):(3'h5)] ?
          reg81[(2'h3):(2'h2)] : {wire20, (8'hba)}))));
      reg85 <= reg79;
    end
  assign wire86 = $unsigned((((wire20 != reg71) || (^~(+wire21))) ?
                      (7'h40) : (+$signed($unsigned(reg81)))));
  assign wire87 = $unsigned((8'hb4));
  assign wire88 = {reg71};
  assign wire89 = wire24[(4'ha):(3'h5)];
  assign wire90 = ($unsigned($signed($signed((wire89 ?
                      reg73 : (7'h40))))) && wire19);
  assign wire91 = {$unsigned((8'hb7))};
  assign wire92 = wire89[(4'hc):(4'h9)];
  always
    @(posedge clk) begin
      if ($signed($unsigned({((wire25 >> wire21) ?
              $unsigned(reg71) : $unsigned((8'hb3)))})))
        begin
          reg93 <= wire20;
          reg94 <= (~$signed(($unsigned(reg72) ? $signed((7'h43)) : wire17)));
          reg95 <= reg75[(4'hc):(4'h8)];
          reg96 <= reg84[(1'h1):(1'h1)];
          reg97 <= $unsigned((8'ha2));
        end
      else
        begin
          reg93 <= ((reg79[(1'h0):(1'h0)] ?
                  wire87 : $unsigned($unsigned($signed(wire92)))) ?
              (reg73 ?
                  {$signed((wire25 ?
                          reg83 : reg95))} : wire87[(2'h3):(2'h3)]) : $unsigned((!reg79[(2'h3):(1'h0)])));
          reg94 <= $unsigned((wire17 ?
              (!(^~wire87)) : (^($unsigned(reg95) >= reg76[(5'h11):(4'h9)]))));
          reg95 <= {wire18};
        end
      if ($unsigned((8'ha8)))
        begin
          reg98 <= (reg77 ?
              wire92 : $unsigned((((wire86 ? wire24 : wire25) ?
                      (^wire69) : $unsigned(reg75)) ?
                  $unsigned(wire87) : $signed(reg76))));
          if ($signed($unsigned((~^({wire26, wire17} ?
              $unsigned(wire23) : $signed(reg94))))))
            begin
              reg99 <= (|(($signed($signed((7'h41))) || wire21[(3'h4):(2'h2)]) ?
                  (wire21[(1'h1):(1'h0)] * ((~|(8'haf)) <= $signed(reg71))) : wire23));
              reg100 <= ($unsigned(((!reg99) ?
                  $signed((reg82 == wire25)) : reg99)) ^ $unsigned(wire91));
              reg101 <= $signed(reg84);
            end
          else
            begin
              reg99 <= (reg82 ^ $signed($unsigned($unsigned((reg95 ?
                  (8'ha3) : reg82)))));
              reg100 <= $unsigned((reg71 ?
                  (reg83[(3'h7):(3'h6)] ?
                      reg73[(4'hf):(4'hf)] : {$signed(reg79),
                          wire91[(4'h9):(3'h5)]}) : reg99[(4'hd):(4'hb)]));
              reg101 <= ($unsigned($signed(reg82[(3'h5):(2'h3)])) >= (8'hbc));
              reg102 <= wire74;
            end
          if ($unsigned({(($unsigned(wire69) ?
                  $signed(reg101) : $signed((8'ha6))) ~^ (^(wire90 + reg73)))}))
            begin
              reg103 <= (&({((~|wire87) >> reg71),
                      {(!wire25), ((7'h42) | wire86)}} ?
                  $signed(reg101[(1'h0):(1'h0)]) : (^$signed((reg71 >= wire17)))));
              reg104 <= ($unsigned((reg80[(2'h2):(2'h2)] ?
                      $signed((8'hbc)) : $signed((wire20 < reg93)))) ?
                  ((|{$unsigned(reg80)}) ?
                      wire26 : (8'haa)) : {reg84[(1'h0):(1'h0)],
                      ((^(reg81 ? (8'hb2) : wire90)) ?
                          ((wire19 ?
                              reg77 : wire19) ^~ $signed(wire21)) : $unsigned((~^wire18)))});
              reg105 <= $signed($signed(wire22[(3'h7):(1'h1)]));
            end
          else
            begin
              reg103 <= wire22;
              reg104 <= (8'ha9);
              reg105 <= $signed((&$unsigned(reg93)));
            end
          if ((((reg71[(3'h5):(3'h5)] > ($unsigned(reg79) > (wire17 >= (8'hbb)))) ?
                  (~$signed({wire26})) : reg81) ?
              ($unsigned((reg72 >>> $unsigned(wire19))) ?
                  $unsigned(wire17) : $unsigned($signed((reg96 != (8'hb6))))) : $unsigned((&$unsigned((reg71 & wire18))))))
            begin
              reg106 <= wire74;
              reg107 <= $signed((reg93[(3'h7):(1'h1)] ?
                  $signed((8'hb2)) : $unsigned((~{reg71}))));
              reg108 <= wire89;
            end
          else
            begin
              reg106 <= reg100[(5'h11):(4'hb)];
              reg107 <= reg95;
            end
          reg109 <= (^(~&(((reg99 << reg104) - (wire92 ? reg78 : reg77)) ?
              ((8'ha0) > $signed((8'hb3))) : $unsigned((wire86 ?
                  wire74 : reg94)))));
        end
      else
        begin
          if ({$unsigned(($signed(((8'ha9) ? wire74 : wire92)) ?
                  (&$signed((8'hab))) : $signed(reg93))),
              reg98[(1'h0):(1'h0)]})
            begin
              reg98 <= ($signed(((reg76 ?
                  (^~(7'h43)) : $signed(reg104)) <<< wire88[(1'h1):(1'h0)])) ~^ (($unsigned(reg84[(2'h2):(1'h1)]) == $signed(reg79[(3'h5):(3'h4)])) << (wire69 ?
                  $signed((wire25 ?
                      wire22 : wire22)) : $unsigned($signed(reg100)))));
              reg99 <= $unsigned((!(^~($unsigned(reg99) ^ $unsigned((7'h44))))));
            end
          else
            begin
              reg98 <= (({$signed((|reg85)),
                          ((reg77 << reg75) ^ (reg79 & wire90))} ?
                      ($unsigned(wire19) & (!$signed(reg101))) : $signed(wire74)) ?
                  ((((+reg103) > $unsigned(reg100)) - ((|wire25) ?
                      (~&reg76) : reg81[(2'h3):(1'h0)])) ~^ (7'h41)) : {wire88[(3'h4):(2'h2)],
                      $signed((~&$unsigned((8'ha0))))});
              reg99 <= {reg71, reg104[(3'h4):(2'h2)]};
              reg100 <= {reg85[(3'h7):(3'h4)],
                  ($signed((wire18[(4'h9):(1'h0)] - reg93)) ?
                      $signed({$signed((8'hbd)), $unsigned(wire69)}) : reg97)};
              reg101 <= ((({(wire21 ? (8'ha3) : wire21)} ?
                  (wire90 ?
                      wire22[(4'ha):(3'h4)] : ((8'hbe) != reg100)) : reg98[(4'h9):(1'h0)]) >= (~^{wire92[(4'hb):(4'ha)]})) || reg85);
              reg102 <= (((8'had) ?
                  ($unsigned((~&reg107)) <= reg93) : ((reg72[(4'hc):(4'ha)] | $unsigned(reg79)) <<< reg79[(2'h2):(1'h1)])) <= reg76);
            end
          reg103 <= {$unsigned($unsigned($unsigned(wire86)))};
          if (($signed(({$signed(reg100)} ?
              (|{wire88, reg109}) : {((7'h44) ?
                      (8'had) : reg93)})) & $unsigned(({wire21[(3'h4):(1'h0)],
                  $unsigned(reg97)} ?
              reg101[(3'h7):(1'h1)] : reg79))))
            begin
              reg104 <= $signed(wire17[(2'h2):(2'h2)]);
              reg105 <= $unsigned(reg100);
              reg106 <= $signed($unsigned(reg93));
            end
          else
            begin
              reg104 <= $signed($unsigned(((+reg73[(4'hc):(4'h9)]) ?
                  (8'ha5) : (~&reg77))));
            end
          reg107 <= reg100;
          reg108 <= (reg82[(3'h6):(3'h5)] ?
              $unsigned(($unsigned((&wire20)) ?
                  (|$unsigned(reg102)) : $signed($signed(reg78)))) : $unsigned(($unsigned(reg99[(4'ha):(3'h6)]) >= wire74[(2'h2):(1'h0)])));
        end
    end
  assign wire110 = ((-$unsigned(reg98)) ?
                       $signed({($unsigned(reg85) ?
                               $signed(reg96) : $unsigned(wire87)),
                           ((~wire18) ^ reg103)}) : (reg75 != reg106[(3'h6):(3'h4)]));
  assign wire111 = reg76[(1'h0):(1'h0)];
  assign wire112 = reg105;
  assign wire113 = reg99[(4'h9):(4'h9)];
endmodule

module module27
#(parameter param68 = {((((|(8'hae)) ? ((8'had) ? (8'hab) : (8'ha4)) : ((8'h9e) ? (8'ha0) : (8'hbe))) ? (((8'ha5) ? (8'hb1) : (8'hb2)) ? {(8'ha3)} : ((8'h9d) ? (8'haf) : (8'hbd))) : ({(8'ha3), (8'hb3)} ? ((8'hbd) <= (8'ha7)) : ((8'hb7) <<< (8'hab)))) & (&(!(~|(8'hb3))))), (7'h44)})
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire32;
  input wire [(4'h8):(1'h0)] wire31;
  input wire signed [(5'h15):(1'h0)] wire30;
  input wire signed [(3'h7):(1'h0)] wire29;
  input wire [(4'h9):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire66;
  wire signed [(4'h9):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire56;
  wire [(3'h6):(1'h0)] wire55;
  wire signed [(3'h6):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire51;
  wire signed [(3'h5):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire46;
  wire signed [(2'h3):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire43;
  wire [(4'h9):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire33;
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire57,
                 wire56,
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
                 wire33,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire33 = wire30[(5'h12):(2'h2)];
  always
    @(posedge clk) begin
      reg34 <= wire31[(3'h7):(3'h7)];
      if (wire30[(2'h2):(1'h0)])
        begin
          reg35 <= (reg34 ? wire33[(3'h5):(3'h5)] : wire28);
          reg36 <= $signed((($signed((8'hbc)) == (~(8'hbf))) & ((^wire29[(3'h7):(1'h1)]) ?
              (wire31[(3'h4):(2'h3)] <= (wire28 ?
                  wire31 : wire31)) : {wire31[(3'h6):(3'h5)],
                  wire31[(1'h1):(1'h1)]})));
          reg37 <= ((($signed((wire30 ? wire31 : wire32)) <= (^{reg36,
                      (8'ha7)})) ?
                  ((+reg35[(3'h4):(2'h3)]) < wire30[(2'h3):(1'h1)]) : wire29[(2'h3):(1'h1)]) ?
              $unsigned($signed((8'haa))) : $signed((($signed(reg35) ?
                      (+wire29) : (^reg34)) ?
                  wire33 : (~^reg36[(3'h7):(2'h3)]))));
        end
      else
        begin
          if ($signed($unsigned(((+$unsigned(wire28)) ?
              ($signed(wire28) >= {(8'hab), reg37}) : $unsigned((reg37 ?
                  reg35 : reg35))))))
            begin
              reg35 <= (wire30 ?
                  (+$unsigned((-(wire31 != wire31)))) : $signed($unsigned($signed((~&wire28)))));
              reg36 <= wire32;
              reg37 <= $unsigned(({((reg37 ? wire29 : wire29) ?
                          (8'h9c) : (wire28 << wire32))} ?
                  $signed(($unsigned(wire30) ?
                      $unsigned(wire29) : $signed(wire28))) : reg37[(1'h1):(1'h0)]));
              reg38 <= $unsigned(wire33[(4'h8):(3'h4)]);
            end
          else
            begin
              reg35 <= wire33;
            end
          reg39 <= wire28[(1'h1):(1'h1)];
          reg40 <= ($signed((reg37 ?
                  $signed((reg35 ? (8'ha2) : (8'haf))) : $unsigned(wire30))) ?
              ((8'hb7) & (~reg37[(2'h2):(1'h0)])) : ($unsigned($unsigned((reg37 ?
                  wire29 : wire28))) & (~&reg35[(5'h12):(5'h12)])));
        end
      reg41 <= (((($unsigned(wire31) ^ (reg34 ?
              reg34 : reg35)) != $signed((wire32 ?
              (7'h42) : wire30))) ^~ ($unsigned((reg39 ?
              reg38 : reg35)) > $signed({wire28, reg40}))) ?
          reg39 : $signed({((reg35 >= (7'h44)) ?
                  $signed((8'ha9)) : $unsigned((8'hab)))}));
    end
  assign wire42 = (~^$signed($signed(reg39)));
  assign wire43 = wire31[(2'h3):(1'h1)];
  assign wire44 = (-(reg36[(3'h5):(2'h3)] ?
                      (+$signed(reg37)) : $unsigned(reg41)));
  assign wire45 = ((-wire31) <= ($unsigned($unsigned(reg38)) | $signed(wire43)));
  assign wire46 = (8'had);
  assign wire47 = reg36;
  assign wire48 = $signed(reg34);
  assign wire49 = ((wire45 >= $signed($unsigned(wire33))) ?
                      (reg36 ? (8'ha6) : (7'h40)) : $unsigned({(wire30 ?
                              $signed(wire30) : (reg36 ? (8'ha2) : reg40))}));
  assign wire50 = (!((~$unsigned((wire31 && wire44))) | $unsigned($signed($unsigned(reg37)))));
  assign wire51 = wire29;
  assign wire52 = $unsigned((!reg41));
  assign wire53 = wire48;
  assign wire54 = $unsigned({wire46[(1'h0):(1'h0)],
                      {{reg35},
                          (wire49[(2'h2):(1'h0)] ?
                              $signed(wire47) : (wire30 && reg40))}});
  assign wire55 = (reg34 ? {(-wire33)} : reg40);
  assign wire56 = $unsigned(wire33[(4'h9):(3'h6)]);
  assign wire57 = $unsigned($signed((wire47[(2'h3):(2'h2)] ?
                      (wire29 ?
                          (^~wire47) : (wire53 ? reg36 : wire44)) : wire45)));
  always
    @(posedge clk) begin
      if ((($signed(((!wire30) <= wire33)) ~^ $unsigned($unsigned($signed(wire33)))) - $signed($signed(reg35))))
        begin
          reg58 <= wire43[(4'h9):(3'h7)];
          reg59 <= $signed((wire44 ?
              {$signed((wire52 >>> reg34)),
                  reg41[(1'h0):(1'h0)]} : wire55[(1'h0):(1'h0)]));
          if ((reg58 >= (wire28 ~^ ((8'hb5) ?
              ((~&(8'ha2)) && {reg37}) : ($signed(reg40) ?
                  $unsigned(wire46) : (-wire49))))))
            begin
              reg60 <= ({{reg35[(3'h5):(3'h4)]}} ?
                  (wire55[(2'h2):(1'h1)] && (8'haa)) : (~&(((wire44 <= (8'hae)) ?
                      (wire49 > reg35) : (reg58 ?
                          wire47 : (8'ha9))) ^ (~|$signed(wire56)))));
              reg61 <= (reg35 ?
                  (~|(reg37[(1'h0):(1'h0)] ?
                      $unsigned(((8'hba) ?
                          wire50 : wire53)) : $unsigned((wire55 * wire29)))) : (wire33[(2'h3):(1'h0)] ?
                      (^(|reg58)) : $unsigned($unsigned(wire31[(3'h4):(2'h3)]))));
            end
          else
            begin
              reg60 <= wire52;
              reg61 <= ((&(reg36[(4'hf):(4'he)] ?
                  (~{(8'hb0)}) : (wire30[(4'h9):(4'h9)] ?
                      (reg34 < wire49) : (|reg34)))) > (~wire53[(2'h2):(1'h1)]));
              reg62 <= ((~^(((wire56 ?
                  (8'h9e) : wire53) << (reg36 || (8'h9e))) > $signed((+wire52)))) >> wire49);
              reg63 <= $signed(($signed(wire44) << $signed(reg40)));
              reg64 <= reg36[(2'h3):(2'h3)];
            end
          reg65 <= $unsigned((reg38[(4'ha):(3'h4)] > wire44[(4'hb):(3'h4)]));
        end
      else
        begin
          if ((8'h9c))
            begin
              reg58 <= ((+$signed({wire51, (~reg35)})) - (8'hb2));
              reg59 <= wire47[(4'hf):(4'hc)];
              reg60 <= {wire53[(1'h0):(1'h0)]};
              reg61 <= (($unsigned({{reg60, reg34}}) ?
                  (+wire52[(3'h6):(3'h6)]) : (wire56[(3'h6):(3'h6)] == ($signed(wire29) ?
                      reg61[(2'h2):(2'h2)] : wire31[(2'h3):(2'h3)]))) > ($signed({(reg38 ?
                          wire33 : (8'ha1)),
                      $signed(wire55)}) ?
                  (wire32[(3'h6):(2'h2)] >> wire43[(3'h6):(2'h2)]) : (~^(8'ha2))));
            end
          else
            begin
              reg58 <= wire42[(2'h2):(1'h1)];
              reg59 <= $signed(reg65);
              reg60 <= (~|((^~(8'hbd)) ?
                  (^((~&wire48) ?
                      $signed(wire54) : (wire50 ?
                          reg63 : wire31))) : (({reg62} == wire45) ?
                      (reg36[(5'h10):(4'h9)] <= reg35[(1'h0):(1'h0)]) : wire57)));
              reg61 <= {{{wire53}, wire54[(2'h3):(2'h2)]}};
              reg62 <= (($unsigned((~&(wire55 <= (8'ha2)))) ?
                      {(reg36 | reg58[(1'h1):(1'h1)])} : $signed(((reg60 ?
                          wire54 : reg39) || $signed(wire48)))) ?
                  (wire57 & {($signed(wire56) ?
                          $signed(wire52) : $signed(wire43))}) : wire30);
            end
          reg63 <= $signed($signed($signed(reg58[(2'h3):(1'h1)])));
          reg64 <= wire31[(3'h5):(2'h2)];
          reg65 <= reg65;
        end
    end
  assign wire66 = $unsigned($signed((wire46 + $signed($signed(reg34)))));
  assign wire67 = $signed(wire45);
endmodule
