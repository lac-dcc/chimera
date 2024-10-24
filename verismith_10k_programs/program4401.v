module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h2a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire121;
  wire [(5'h10):(1'h0)] wire120;
  wire signed [(5'h11):(1'h0)] wire83;
  wire signed [(3'h6):(1'h0)] wire82;
  wire signed [(3'h7):(1'h0)] wire81;
  wire signed [(3'h6):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire78;
  reg signed [(4'he):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg127 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg126 = (1'h0);
  reg [(4'hf):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg123 = (1'h0);
  reg [(5'h12):(1'h0)] reg122 = (1'h0);
  reg [(4'ha):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg117 = (1'h0);
  reg [(3'h4):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg115 = (1'h0);
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(3'h7):(1'h0)] reg113 = (1'h0);
  reg [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg110 = (1'h0);
  reg [(5'h15):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg [(4'h8):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg103 = (1'h0);
  reg [(4'hb):(1'h0)] reg102 = (1'h0);
  reg [(4'hc):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg99 = (1'h0);
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg97 = (1'h0);
  reg [(3'h6):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg [(5'h11):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg [(3'h5):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire78,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
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
                 (1'h0)};
  assign wire5 = $signed($unsigned((~&(|$signed(wire2)))));
  assign wire6 = $signed((|wire4[(1'h0):(1'h0)]));
  assign wire7 = {(wire2 ?
                         wire0[(4'he):(4'ha)] : $unsigned((((8'h9e) <<< wire4) ?
                             $signed(wire2) : wire4[(2'h3):(2'h2)])))};
  assign wire8 = (~&(~|wire3[(2'h3):(1'h0)]));
  assign wire9 = $signed(wire6[(1'h1):(1'h1)]);
  module10 #() modinst79 (.y(wire78), .wire14(wire6), .wire11(wire9), .wire15(wire2), .clk(clk), .wire13(wire3), .wire12(wire0));
  assign wire80 = (|{($unsigned((wire2 ?
                          wire2 : wire1)) - wire7[(1'h0):(1'h0)]),
                      $signed($signed({wire2, wire1}))});
  assign wire81 = wire7;
  assign wire82 = ($signed((&(^~(8'ha7)))) <= (($signed((wire0 || wire81)) >>> {(wire80 && (8'hb3)),
                      $unsigned(wire78)}) ~^ (wire2[(2'h2):(1'h0)] ?
                      ($signed(wire80) ?
                          (wire9 ^ wire6) : $unsigned(wire2)) : ($signed(wire7) ?
                          wire2 : (wire3 ? wire9 : wire9)))));
  assign wire83 = ((wire9[(5'h10):(1'h1)] != wire0[(2'h3):(2'h2)]) << wire5);
  always
    @(posedge clk) begin
      if ($signed(wire7[(1'h0):(1'h0)]))
        begin
          reg84 <= wire4;
          reg85 <= {($signed(((&wire9) ^ (wire2 ? wire1 : (8'hbd)))) ?
                  wire83 : $signed((wire78[(1'h1):(1'h0)] ?
                      wire81 : $unsigned(wire7)))),
              (($signed((reg84 ? wire81 : reg84)) + {(wire2 ? wire7 : wire7),
                  $signed(wire82)}) > reg84[(3'h5):(3'h4)])};
          reg86 <= (wire3 >> (^~wire80[(1'h0):(1'h0)]));
          reg87 <= wire81;
          reg88 <= wire80[(1'h1):(1'h0)];
        end
      else
        begin
          if (wire7[(1'h1):(1'h0)])
            begin
              reg84 <= wire78;
              reg85 <= $signed($signed((((reg84 ?
                  wire80 : wire3) ^~ (wire3 | wire8)) >>> (^(wire78 | wire6)))));
              reg86 <= (($unsigned((~|$unsigned(wire2))) | ({reg84[(2'h3):(1'h0)],
                  $unsigned(wire81)} == (wire3[(3'h5):(2'h2)] == wire83[(5'h10):(5'h10)]))) > ((((wire81 && wire4) >> $unsigned(wire78)) + $unsigned(wire80)) ?
                  $unsigned((|$unsigned((8'hae)))) : wire2));
              reg87 <= (~^(((8'haf) ~^ wire8[(2'h3):(1'h1)]) - (((wire8 ?
                      wire0 : wire8) ^ ((8'hbe) ? wire83 : wire83)) ?
                  $signed(((8'hbc) || wire6)) : $signed((wire6 ?
                      (8'had) : (8'hb8))))));
              reg88 <= wire7;
            end
          else
            begin
              reg84 <= $signed(($unsigned((wire2[(1'h1):(1'h1)] ?
                      (reg88 ? wire80 : wire78) : wire2[(1'h0):(1'h0)])) ?
                  $signed($unsigned(wire78[(2'h2):(1'h0)])) : reg84[(3'h5):(2'h2)]));
              reg85 <= reg84[(3'h4):(3'h4)];
              reg86 <= ($signed(((wire82 ? (wire5 ? wire6 : reg88) : (8'h9f)) ?
                  ({wire3} ?
                      $unsigned(wire6) : wire5[(5'h10):(4'hc)]) : $unsigned((reg87 + (8'hbf))))) ^ $signed({(wire81[(1'h1):(1'h0)] ?
                      (wire78 > reg85) : (8'hb4))}));
            end
          reg89 <= (^~(^reg84));
        end
    end
  always
    @(posedge clk) begin
      reg90 <= (~&wire0);
      if ($signed($signed(((reg84[(3'h4):(3'h4)] | (reg88 << (7'h43))) ~^ $signed((wire78 ?
          (8'hba) : wire0))))))
        begin
          if ((reg89[(4'h8):(1'h1)] != ((8'h9d) ?
              reg86 : (reg87[(1'h1):(1'h1)] < wire83[(4'ha):(3'h7)]))))
            begin
              reg91 <= ((((|$signed(wire1)) ?
                          wire82 : (reg85[(1'h0):(1'h0)] >> $signed(wire7))) ?
                      $unsigned(wire5) : $unsigned(wire78)) ?
                  ($signed((~(wire78 ?
                      reg90 : reg90))) > $unsigned(($signed(reg87) && {reg90}))) : $unsigned((^wire6)));
            end
          else
            begin
              reg91 <= wire0;
              reg92 <= $unsigned(($signed((wire78[(4'ha):(3'h4)] * (8'ha6))) ?
                  (wire7 ~^ (reg85 ?
                      $unsigned(wire81) : (wire83 != wire82))) : (~&(reg85 << (wire0 & wire83)))));
            end
          reg93 <= $signed(reg91);
          if (reg89)
            begin
              reg94 <= $unsigned((~|$unsigned((^~wire80[(3'h6):(3'h5)]))));
            end
          else
            begin
              reg94 <= (-reg85);
              reg95 <= {(wire0 ?
                      reg84[(3'h4):(2'h2)] : (((reg85 << reg90) ?
                              wire2 : (wire7 ? wire78 : wire81)) ?
                          reg93[(1'h1):(1'h1)] : {wire80, (+wire80)})),
                  {$signed((|$unsigned(reg84)))}};
              reg96 <= ({reg89} ?
                  reg90[(2'h3):(1'h1)] : (wire81 + {$unsigned(wire0[(3'h5):(3'h5)])}));
              reg97 <= reg87;
            end
          if (wire3)
            begin
              reg98 <= (({{(wire82 + reg92), $unsigned(reg90)},
                      {wire6[(2'h3):(2'h3)]}} >>> $unsigned($signed((8'ha6)))) ?
                  (reg88[(1'h0):(1'h0)] ?
                      $signed($signed((wire5 >= reg92))) : {($signed(reg89) ?
                              wire6 : wire80)}) : wire2);
            end
          else
            begin
              reg98 <= ($unsigned(((^~wire9[(3'h4):(1'h1)]) + (reg97[(3'h4):(3'h4)] ?
                      $unsigned(wire8) : wire1[(2'h2):(2'h2)]))) ?
                  (!reg91) : wire78[(4'hc):(3'h5)]);
              reg99 <= $signed((~^wire81));
              reg100 <= wire5[(3'h6):(3'h5)];
              reg101 <= (~|wire0);
              reg102 <= wire6[(5'h14):(4'hb)];
            end
        end
      else
        begin
          reg91 <= (~(wire6 ?
              reg88[(2'h3):(1'h0)] : $unsigned($unsigned((wire6 ?
                  (8'hac) : wire3)))));
          reg92 <= wire81;
        end
      reg103 <= (~reg88[(1'h1):(1'h1)]);
      if (((reg84[(1'h0):(1'h0)] <<< reg89[(5'h13):(2'h3)]) ^~ {wire3,
          $unsigned((8'hbf))}))
        begin
          reg104 <= $unsigned((7'h40));
          reg105 <= $signed((wire81[(2'h3):(1'h0)] >> ($unsigned($unsigned(reg98)) ?
              $unsigned((8'ha4)) : $signed($signed(reg99)))));
          reg106 <= (($unsigned($unsigned((wire78 ?
                  (8'h9f) : reg103))) << (~&reg87[(2'h3):(1'h1)])) ?
              $signed($signed($unsigned((reg99 >= wire9)))) : ($unsigned(reg104) <= reg84));
          reg107 <= $unsigned($unsigned((wire0[(4'hd):(3'h5)] >= ((~reg87) >> (+(8'hb5))))));
          reg108 <= ({wire82} ?
              (+reg85[(1'h0):(1'h0)]) : $signed($unsigned(wire82[(1'h1):(1'h0)])));
        end
      else
        begin
          reg104 <= wire4[(3'h5):(3'h4)];
        end
      reg109 <= (^~wire5[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg110 <= {((wire6[(5'h12):(5'h11)] ?
                  $unsigned((reg88 >> reg89)) : reg108) ?
              (((reg109 ? (8'ha6) : reg106) ?
                  wire80 : (-reg97)) <= wire1) : (wire78[(4'h9):(2'h2)] << $unsigned($unsigned(reg86))))};
      if ((^~($signed({(8'ha6), $unsigned(reg100)}) ?
          wire2[(5'h13):(3'h7)] : $signed((reg86[(3'h4):(3'h4)] ?
              (|reg93) : ((8'hb0) ? (8'ha6) : reg106))))))
        begin
          reg111 <= reg99[(4'hc):(4'h8)];
          reg112 <= $unsigned(reg89[(4'he):(4'he)]);
          reg113 <= (~&(reg97[(3'h4):(1'h0)] != ({$unsigned(reg99),
              $signed(wire7)} ^~ (|$signed(reg95)))));
          reg114 <= ($signed((8'hb1)) ?
              (!$signed((reg89 ?
                  $unsigned(wire5) : (reg113 > (8'ha6))))) : {$unsigned(($signed(wire81) ?
                      $unsigned(wire83) : (reg103 != reg103)))});
          reg115 <= reg98[(1'h0):(1'h0)];
        end
      else
        begin
          reg111 <= $signed($signed(($signed((-reg108)) || ((~|reg91) >= ((8'haa) ?
              wire3 : wire82)))));
          reg112 <= $signed($signed((~|$unsigned((wire7 & wire81)))));
          reg113 <= wire9[(2'h3):(1'h0)];
          if ($signed(wire83[(5'h11):(5'h11)]))
            begin
              reg114 <= $unsigned({wire81[(1'h1):(1'h0)], wire3});
              reg115 <= wire81;
            end
          else
            begin
              reg114 <= (&(|$signed($unsigned($unsigned(reg115)))));
              reg115 <= wire5[(4'hc):(1'h0)];
              reg116 <= ($unsigned($unsigned(($signed(reg112) <<< reg86))) | ($signed((^(reg102 != (8'hb0)))) ?
                  (wire3[(3'h7):(3'h7)] ?
                      $unsigned(wire82[(1'h1):(1'h1)]) : $unsigned($signed(reg88))) : (~&$unsigned((wire83 & wire8)))));
            end
        end
      reg117 <= $signed({(|$signed($unsigned(reg88)))});
      reg118 <= $unsigned(wire4);
      reg119 <= $signed((+reg118[(3'h4):(1'h1)]));
    end
  assign wire120 = ({(~|$signed(reg93[(4'h8):(3'h7)])),
                       (reg110[(1'h0):(1'h0)] <<< $unsigned((reg117 ?
                           wire83 : reg118)))} > ((reg91[(4'hb):(3'h6)] <= $unsigned(reg88[(2'h2):(1'h1)])) ?
                       reg107[(3'h4):(2'h2)] : (8'hbd)));
  assign wire121 = ($unsigned((wire8[(1'h0):(1'h0)] >>> ({reg96,
                           reg111} < wire120[(3'h5):(1'h0)]))) ?
                       ($unsigned(reg109[(3'h6):(3'h4)]) ?
                           $unsigned((reg89 ?
                               (reg87 || (8'hb3)) : wire81[(3'h4):(2'h2)])) : reg94[(4'hf):(3'h4)]) : $unsigned((wire2 != reg99[(4'hb):(4'h9)])));
  always
    @(posedge clk) begin
      reg122 <= reg119;
      reg123 <= wire4;
      if ($unsigned((&$unsigned(({wire83} ? (8'hae) : wire8[(3'h6):(2'h3)])))))
        begin
          reg124 <= $signed(($unsigned(((~&reg108) ^~ ((8'h9f) < (8'hb8)))) ?
              reg108[(2'h3):(1'h1)] : ({(reg107 ? (8'ha0) : reg106)} ?
                  ((~^reg111) * $unsigned(wire121)) : $signed((8'ha6)))));
          if ({reg103, $signed((reg109[(2'h2):(2'h2)] >> reg86))})
            begin
              reg125 <= wire8[(2'h3):(2'h3)];
              reg126 <= $unsigned($unsigned((-wire82[(3'h4):(2'h3)])));
            end
          else
            begin
              reg125 <= (8'hb1);
            end
          reg127 <= (+{reg101[(1'h1):(1'h1)]});
          reg128 <= reg91;
          reg129 <= (~&reg89[(4'hd):(2'h3)]);
        end
      else
        begin
          reg124 <= ($signed((~&reg108)) ?
              (reg105 || ((~&(|reg104)) ?
                  (8'hb1) : (7'h43))) : {((^~wire78) >> reg93),
                  wire2[(4'h8):(3'h5)]});
          reg125 <= wire0[(3'h7):(2'h3)];
        end
    end
endmodule

module module10
#(parameter param77 = (-((((~^(8'hb3)) + (~(8'hbe))) ? (((7'h42) ? (8'ha6) : (8'ha6)) ? ((8'ha2) | (8'ha3)) : {(8'hae), (8'hb1)}) : {{(8'ha9)}, {(8'hb1)}}) ? ({{(8'hb2), (8'h9d)}} * {((8'hb2) ^ (8'hb4))}) : (^(&{(8'ha3), (7'h40)})))))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire15;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire signed [(4'hc):(1'h0)] wire13;
  input wire signed [(3'h7):(1'h0)] wire12;
  input wire signed [(5'h12):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire76;
  wire signed [(5'h10):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire23;
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire73,
                 wire23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed($signed(wire13[(3'h5):(2'h2)])))
        begin
          reg16 <= $unsigned($unsigned(wire11));
          reg17 <= $signed(wire14[(2'h3):(1'h0)]);
          reg18 <= wire11[(4'hf):(3'h6)];
        end
      else
        begin
          reg16 <= ($unsigned((^~(reg17[(4'h8):(3'h7)] ?
                  wire15 : $signed(wire11)))) ?
              (^(wire14 <<< wire11[(3'h5):(3'h4)])) : (+{(7'h41)}));
          reg17 <= reg17;
          reg18 <= (wire13[(4'h8):(3'h4)] <<< {(wire14[(3'h4):(1'h0)] <<< (~wire13[(1'h0):(1'h0)]))});
          reg19 <= (~wire13);
          if ($unsigned(reg18[(4'hb):(3'h7)]))
            begin
              reg20 <= wire11;
            end
          else
            begin
              reg20 <= $signed(reg20[(3'h4):(1'h1)]);
              reg21 <= $signed((^reg19[(4'h9):(3'h6)]));
            end
        end
      reg22 <= reg20[(2'h2):(1'h0)];
    end
  assign wire23 = ({reg17, (^~(+reg17[(2'h3):(2'h2)]))} ?
                      wire11 : $unsigned({(|(8'ha9))}));
  module24 #() modinst74 (wire73, clk, wire13, reg17, reg16, wire23);
  assign wire75 = wire14[(3'h6):(2'h2)];
  assign wire76 = $signed((^wire13));
endmodule

module module24  (y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'h1d0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire28;
  input wire signed [(3'h6):(1'h0)] wire27;
  input wire signed [(3'h5):(1'h0)] wire26;
  input wire [(3'h5):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire71;
  wire signed [(2'h3):(1'h0)] wire70;
  wire signed [(3'h4):(1'h0)] wire69;
  wire signed [(5'h15):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire53;
  wire [(3'h5):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire29;
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire54,
                 wire53,
                 wire45,
                 wire44,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
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
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire29 = wire28;
  assign wire30 = wire27;
  assign wire31 = $unsigned($signed($signed($unsigned((^wire30)))));
  assign wire32 = wire25;
  assign wire33 = {wire32[(2'h2):(2'h2)], wire26};
  assign wire34 = $signed((^~wire31[(5'h14):(4'h8)]));
  assign wire35 = ((wire30[(2'h3):(1'h1)] ?
                          (wire33[(3'h5):(1'h1)] ^~ {wire28}) : {(wire26[(1'h0):(1'h0)] >>> (wire33 ?
                                  wire32 : wire30))}) ?
                      ((-wire25[(1'h0):(1'h0)]) ?
                          $unsigned(wire33) : {wire30[(4'h8):(4'h8)],
                              $signed($signed(wire26))}) : $signed($unsigned(wire31[(4'he):(4'ha)])));
  assign wire36 = (8'hab);
  assign wire37 = (~^(($unsigned(wire25) == wire35[(4'hb):(3'h7)]) ?
                      {$signed($signed(wire25)), {(~wire26)}} : wire25));
  assign wire38 = $unsigned(($signed($unsigned(wire37)) == wire35));
  assign wire39 = (!wire38);
  always
    @(posedge clk) begin
      reg40 <= (wire32[(1'h1):(1'h0)] ?
          (((((8'h9d) ? wire25 : wire33) ? $signed(wire39) : {wire33}) ?
                  ($signed(wire29) ~^ (8'hae)) : ($unsigned(wire31) <= (wire25 ?
                      wire27 : wire33))) ?
              (wire39 ^~ wire31) : wire27) : {(wire35 ?
                  ($signed(wire26) ?
                      (&wire29) : (^(8'hb4))) : wire31[(2'h3):(1'h0)]),
              wire29});
      reg41 <= $signed($unsigned((7'h41)));
      reg42 <= (wire29 ~^ ((wire31 <= reg40[(3'h4):(1'h1)]) != $unsigned((wire32 ?
          (wire35 & wire33) : $unsigned(wire33)))));
      reg43 <= $unsigned((+{wire38, ((&wire35) >>> wire38[(1'h0):(1'h0)])}));
    end
  assign wire44 = (wire34 <= ($unsigned($signed(wire32)) ~^ wire34));
  assign wire45 = (|wire36);
  always
    @(posedge clk) begin
      reg46 <= (^~wire44[(2'h2):(1'h0)]);
      if ($unsigned(($unsigned((8'hb5)) > (^$unsigned((-wire30))))))
        begin
          reg47 <= wire35;
          reg48 <= reg40[(4'h9):(4'h9)];
        end
      else
        begin
          reg47 <= $signed(wire38);
          reg48 <= $unsigned(($signed(wire44) ?
              wire38[(3'h5):(1'h1)] : ((&wire32) ? {(^wire38)} : wire38)));
          reg49 <= $signed((&{reg41}));
          reg50 <= (~^reg49[(5'h11):(4'he)]);
        end
      reg51 <= $unsigned(({($unsigned(wire35) >>> (wire27 ?
                  (7'h41) : wire31))} ?
          reg47[(1'h0):(1'h0)] : (((wire31 != wire33) > (wire27 & (8'ha0))) >= $unsigned(reg42[(1'h1):(1'h0)]))));
      reg52 <= wire29;
    end
  assign wire53 = reg46;
  assign wire54 = reg46;
  always
    @(posedge clk) begin
      if (((~wire44[(3'h4):(2'h3)]) < wire27[(3'h5):(3'h4)]))
        begin
          reg55 <= (wire32[(1'h1):(1'h1)] ?
              ({$signed($unsigned(reg41)), (~|{wire30, wire45})} ?
                  (((^~wire29) ?
                      $unsigned(reg51) : wire25) >>> ($unsigned(wire26) ?
                      $unsigned(reg40) : $unsigned(wire44))) : $unsigned(((~&wire31) ?
                      (|wire45) : reg49[(3'h4):(2'h2)]))) : ((-((wire26 ?
                      (8'hb5) : (8'hae)) ?
                  ((8'hab) & wire32) : wire45[(3'h4):(1'h1)])) >>> $signed(reg41[(3'h4):(2'h3)])));
        end
      else
        begin
          if (wire34[(1'h0):(1'h0)])
            begin
              reg55 <= (wire32 || wire28);
            end
          else
            begin
              reg55 <= ((~(8'hb2)) ?
                  $signed($unsigned(($unsigned(wire44) && (-(8'hb0))))) : ((8'hba) ~^ (|reg55)));
              reg56 <= (!(({$signed(wire32)} ?
                  {$unsigned(wire32),
                      $signed(wire27)} : (~|reg40)) | ($signed($unsigned(wire25)) == wire29[(3'h7):(3'h4)])));
              reg57 <= wire26[(3'h5):(3'h5)];
              reg58 <= ({wire30[(4'h9):(3'h5)], reg55} ~^ ((reg41 ?
                  ($signed(reg42) ^ reg57) : (&wire39)) - wire44));
              reg59 <= wire27[(1'h0):(1'h0)];
            end
          reg60 <= wire44[(3'h6):(1'h1)];
        end
      reg61 <= wire31[(1'h0):(1'h0)];
      if (wire37)
        begin
          if (reg61[(1'h0):(1'h0)])
            begin
              reg62 <= $unsigned({$signed(((~&wire27) >> reg58)),
                  reg47[(3'h7):(3'h7)]});
              reg63 <= (8'h9f);
            end
          else
            begin
              reg62 <= {(wire32[(3'h7):(3'h4)] <<< reg52[(2'h2):(2'h2)])};
              reg63 <= (^((8'haf) || (reg41[(3'h6):(3'h6)] || ((^~reg50) ?
                  ((8'ha2) ? reg62 : (8'ha7)) : reg46))));
              reg64 <= {(wire36[(2'h2):(1'h1)] ?
                      $unsigned($signed(reg58)) : (reg48[(4'hb):(3'h6)] ?
                          $signed((~|wire33)) : $signed(wire39)))};
              reg65 <= wire45[(2'h2):(1'h1)];
            end
          reg66 <= $signed(reg48);
          reg67 <= ($unsigned((~$signed((reg64 ? wire53 : reg60)))) ?
              ($signed(wire39) ?
                  (8'hb9) : (($signed((8'ha6)) >>> $signed((8'hb8))) && wire39)) : (reg64 ?
                  reg60 : reg63));
        end
      else
        begin
          reg62 <= (wire37 ?
              ((8'hbe) ? wire28 : reg43[(3'h4):(3'h4)]) : wire36);
          reg63 <= $signed((~^wire26[(3'h5):(2'h2)]));
          reg64 <= (+$signed((wire54[(1'h0):(1'h0)] ?
              (wire39[(3'h7):(2'h3)] >> (reg50 <<< (7'h42))) : reg60)));
        end
      reg68 <= reg57[(1'h1):(1'h0)];
    end
  assign wire69 = (8'h9f);
  assign wire70 = $signed((((reg62 ? $unsigned(reg40) : wire39[(4'h8):(3'h6)]) ?
                      ((wire69 & wire31) ?
                          $unsigned(wire39) : $unsigned(wire69)) : {$signed((8'hb1)),
                          wire33}) ~^ (wire36[(2'h3):(2'h2)] >> (wire32[(1'h0):(1'h0)] ?
                      $signed(reg41) : {wire69, reg51}))));
  assign wire71 = wire32[(1'h0):(1'h0)];
  assign wire72 = $unsigned(reg68[(1'h0):(1'h0)]);
endmodule
