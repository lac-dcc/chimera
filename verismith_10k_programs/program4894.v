module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire3;
  wire signed [(5'h15):(1'h0)] wire156;
  wire [(2'h2):(1'h0)] wire155;
  wire signed [(3'h6):(1'h0)] wire154;
  wire [(5'h10):(1'h0)] wire153;
  wire signed [(3'h4):(1'h0)] wire152;
  wire signed [(4'ha):(1'h0)] wire151;
  wire signed [(5'h13):(1'h0)] wire150;
  wire [(2'h2):(1'h0)] wire149;
  wire signed [(5'h14):(1'h0)] wire148;
  wire [(5'h14):(1'h0)] wire147;
  wire [(2'h2):(1'h0)] wire146;
  wire signed [(5'h11):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire144;
  assign y = {wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire4,
                 wire5,
                 wire144,
                 (1'h0)};
  assign wire4 = (+(8'hbc));
  assign wire5 = $signed(wire2);
  module6 #() modinst145 (.wire10(wire1), .wire8(wire2), .y(wire144), .clk(clk), .wire11(wire5), .wire7(wire3), .wire9(wire4));
  assign wire146 = wire4;
  assign wire147 = wire146[(1'h1):(1'h1)];
  assign wire148 = (((((wire144 << wire4) ?
                           {(8'hb3),
                               wire144} : $unsigned(wire146)) & ({wire146} == wire144[(1'h1):(1'h1)])) ?
                       wire144 : (($unsigned(wire5) ?
                           wire2 : (wire0 ?
                               wire146 : wire146)) && wire5[(4'hc):(4'h9)])) ^ ((({wire4} ?
                           $signed(wire5) : $unsigned(wire1)) ?
                       $unsigned((~^wire4)) : (+(8'hb7))) + ($signed($unsigned(wire5)) ?
                       wire1[(3'h5):(2'h3)] : $unsigned($unsigned(wire3)))));
  assign wire149 = (wire148[(5'h14):(4'hf)] || ((wire146[(2'h2):(1'h0)] == wire5[(1'h0):(1'h0)]) > wire3[(3'h5):(2'h2)]));
  assign wire150 = $unsigned(wire1[(3'h4):(3'h4)]);
  assign wire151 = (wire146 << $unsigned(wire149));
  assign wire152 = ($signed($signed(($unsigned(wire146) ?
                           wire149[(1'h1):(1'h1)] : (wire149 >= (7'h42))))) ?
                       (~|$unsigned(wire151)) : $signed({$signed({wire149})}));
  assign wire153 = $signed((wire148 || wire147));
  assign wire154 = ($unsigned((|(|$signed((8'had))))) ?
                       $unsigned(wire148[(4'ha):(4'ha)]) : $unsigned(($unsigned((wire144 ?
                           wire3 : wire149)) && ($unsigned(wire147) ?
                           wire5[(4'h9):(4'h9)] : wire151[(3'h5):(3'h5)]))));
  assign wire155 = wire3[(3'h5):(3'h5)];
  assign wire156 = ($signed($signed({(^wire148)})) ^ $unsigned($unsigned($signed((8'hba)))));
endmodule

module module6
#(parameter param142 = (((|((~^(8'haa)) + ((8'h9f) ? (7'h41) : (8'h9d)))) ? (~|{{(8'hbf), (8'h9f)}, (!(7'h41))}) : (-{((7'h43) ? (8'ha5) : (8'ha7))})) ^~ (8'ha1)), 
parameter param143 = (param142 ^~ param142))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h18a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire8;
  input wire [(3'h6):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire141;
  wire signed [(5'h15):(1'h0)] wire140;
  wire [(3'h4):(1'h0)] wire139;
  wire [(2'h3):(1'h0)] wire138;
  wire [(4'h8):(1'h0)] wire137;
  wire signed [(5'h14):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire65;
  wire signed [(5'h10):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire67;
  wire [(5'h10):(1'h0)] wire79;
  wire signed [(5'h13):(1'h0)] wire80;
  wire signed [(5'h14):(1'h0)] wire81;
  wire [(3'h7):(1'h0)] wire135;
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(4'h9):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(5'h15):(1'h0)] reg68 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire60,
                 wire62,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire67,
                 wire79,
                 wire80,
                 wire81,
                 wire135,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  module12 #() modinst61 (wire60, clk, wire8, wire10, wire7, wire9, wire11);
  assign wire62 = wire9[(4'he):(2'h2)];
  assign wire63 = (+$signed(wire8));
  assign wire64 = (wire9[(4'h8):(1'h0)] > $signed($signed((^(~|wire10)))));
  assign wire65 = ((~(+(8'ha3))) ?
                      $unsigned(((&$signed(wire10)) <<< wire8)) : wire60[(5'h10):(3'h6)]);
  assign wire66 = ($signed(($signed((wire60 ?
                          wire10 : wire64)) + ($signed((8'ha4)) ?
                          {wire8, wire11} : $signed(wire8)))) ?
                      wire10 : wire11);
  assign wire67 = (!((wire66[(4'hc):(4'hb)] ?
                      wire11 : (^~wire65)) || {$signed((wire7 >>> wire66)),
                      (^~(8'had))}));
  always
    @(posedge clk) begin
      reg68 <= (~wire66[(4'hf):(3'h7)]);
      if ($unsigned({$unsigned($signed(((8'h9e) ? wire67 : reg68))),
          wire64[(4'h8):(1'h1)]}))
        begin
          reg69 <= wire10;
        end
      else
        begin
          reg69 <= (^~($unsigned($unsigned($signed(wire8))) ?
              wire62 : {({wire66, wire64} ? wire10 : $unsigned(wire65))}));
          if ({((8'ha9) ?
                  (wire7[(1'h0):(1'h0)] ?
                      wire64 : (wire11 ?
                          wire63[(3'h5):(3'h4)] : (&wire64))) : reg69[(1'h0):(1'h0)])})
            begin
              reg70 <= (wire9 ?
                  $unsigned({(wire66[(5'h10):(4'hb)] ?
                          (8'ha5) : $unsigned((8'hb5))),
                      (~reg69)}) : $signed(((|$signed(wire63)) - $signed($signed(wire65)))));
            end
          else
            begin
              reg70 <= $unsigned((&((~(^wire63)) ?
                  ((wire62 ?
                      wire10 : reg69) << wire7) : $unsigned(wire66[(4'h9):(3'h6)]))));
              reg71 <= $signed($signed(wire10[(1'h1):(1'h0)]));
              reg72 <= $signed($unsigned($signed($unsigned(wire11))));
              reg73 <= (~&(wire11[(4'ha):(3'h5)] ~^ reg70[(3'h7):(3'h6)]));
            end
          if ((~^($signed($signed((wire63 ? reg73 : wire67))) + wire8)))
            begin
              reg74 <= (((wire65[(4'hb):(3'h6)] | $signed(wire65[(2'h3):(1'h0)])) ?
                  ((~|wire9) || reg73) : ($unsigned($signed(reg73)) && $unsigned($signed(wire8)))) & (~|(!$unsigned({wire8}))));
              reg75 <= $unsigned((reg72 ?
                  (8'hae) : ({wire11[(4'h9):(2'h2)]} - (^(&wire65)))));
              reg76 <= (&wire66[(3'h7):(3'h5)]);
              reg77 <= wire66[(1'h1):(1'h0)];
            end
          else
            begin
              reg74 <= (wire7[(3'h5):(1'h1)] ? wire9[(4'hf):(4'ha)] : (~wire7));
              reg75 <= wire63[(2'h2):(2'h2)];
            end
          reg78 <= (&wire60[(4'h8):(3'h6)]);
        end
    end
  assign wire79 = reg69;
  assign wire80 = {$signed({wire62, {$unsigned(reg76), $signed((8'hb3))}})};
  assign wire81 = ($signed((|$unsigned(((8'ha3) | reg68)))) ?
                      (^$unsigned(reg75[(4'he):(4'h9)])) : (wire62[(2'h3):(1'h1)] & ($unsigned((&(8'hae))) ?
                          (reg74 * $signed(wire66)) : {{wire62, reg72}})));
  module82 #() modinst136 (wire135, clk, reg68, reg72, reg75, reg70, wire62);
  assign wire137 = (-$signed((^reg78[(1'h0):(1'h0)])));
  assign wire138 = wire66[(4'hc):(4'h8)];
  assign wire139 = {$unsigned($unsigned((wire137 >>> (~&wire11))))};
  assign wire140 = (&wire137);
  assign wire141 = reg76;
endmodule

module module82  (y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'h1e2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire87;
  input wire [(5'h10):(1'h0)] wire86;
  input wire [(3'h5):(1'h0)] wire85;
  input wire signed [(4'ha):(1'h0)] wire84;
  input wire [(5'h15):(1'h0)] wire83;
  wire signed [(4'he):(1'h0)] wire134;
  wire signed [(2'h2):(1'h0)] wire133;
  wire signed [(4'hb):(1'h0)] wire120;
  wire [(5'h10):(1'h0)] wire119;
  wire signed [(3'h5):(1'h0)] wire118;
  wire [(4'hc):(1'h0)] wire117;
  wire signed [(3'h6):(1'h0)] wire116;
  wire signed [(2'h2):(1'h0)] wire115;
  wire [(4'h9):(1'h0)] wire113;
  wire signed [(3'h5):(1'h0)] wire88;
  reg signed [(3'h4):(1'h0)] reg132 = (1'h0);
  reg [(2'h2):(1'h0)] reg131 = (1'h0);
  reg [(5'h13):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg128 = (1'h0);
  reg [(4'hb):(1'h0)] reg127 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg126 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg125 = (1'h0);
  reg [(4'h8):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg123 = (1'h0);
  reg [(4'hd):(1'h0)] reg122 = (1'h0);
  reg [(4'hb):(1'h0)] reg121 = (1'h0);
  reg [(2'h3):(1'h0)] reg114 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg [(5'h11):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg110 = (1'h0);
  reg [(4'hd):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(3'h5):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg102 = (1'h0);
  reg [(2'h3):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(3'h5):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg97 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(2'h3):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire113,
                 wire88,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg114,
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
                 (1'h0)};
  assign wire88 = ((({$unsigned(wire85)} || (8'hbe)) ?
                      $unsigned((!wire85[(1'h0):(1'h0)])) : $unsigned(($signed(wire86) ?
                          (wire83 ? wire83 : wire86) : (-wire85)))) <= wire86);
  always
    @(posedge clk) begin
      reg89 <= {$signed(wire83[(5'h11):(4'h8)])};
    end
  always
    @(posedge clk) begin
      reg90 <= $unsigned($unsigned(wire88[(1'h0):(1'h0)]));
      if ($signed((wire86[(3'h5):(3'h5)] != wire88)))
        begin
          reg91 <= {wire87};
          reg92 <= (+$signed($signed($signed(reg89[(5'h11):(4'h8)]))));
          reg93 <= wire84;
        end
      else
        begin
          if ($unsigned($signed((($signed(reg91) ?
              reg89 : $signed(reg92)) >> ($signed(reg90) ?
              {(8'had), wire85} : (wire84 || wire85))))))
            begin
              reg91 <= reg90[(1'h1):(1'h1)];
              reg92 <= (wire87[(4'ha):(3'h5)] >= $unsigned(wire83[(2'h2):(2'h2)]));
              reg93 <= ({(~((reg92 ? wire87 : wire87) * (wire85 ?
                      (8'h9e) : reg90))),
                  (((reg91 ? wire84 : wire88) ? {wire88} : {wire86}) ?
                      $signed(reg92) : (wire84 ?
                          (~wire87) : $unsigned(reg93)))} > reg89);
              reg94 <= wire88;
            end
          else
            begin
              reg91 <= (($unsigned(reg93) ^~ wire84[(3'h4):(3'h4)]) ?
                  reg90[(1'h0):(1'h0)] : wire85);
              reg92 <= $signed((~^((wire84 != $signed(reg89)) <= (wire83[(4'h8):(2'h2)] | (reg93 + reg89)))));
              reg93 <= $signed(($unsigned({(reg92 ?
                      reg92 : reg94)}) | $signed(($signed((8'ha3)) >>> reg92))));
            end
          if ($signed(($unsigned(wire88[(2'h2):(1'h1)]) ?
              wire88 : {$unsigned($unsigned(wire88)),
                  {wire86[(1'h0):(1'h0)], (reg91 <= wire85)}})))
            begin
              reg95 <= {reg90, reg92};
              reg96 <= wire83;
              reg97 <= reg96[(2'h3):(1'h1)];
              reg98 <= reg96[(3'h5):(2'h3)];
              reg99 <= reg95[(2'h3):(2'h2)];
            end
          else
            begin
              reg95 <= ((!wire87[(1'h1):(1'h1)]) ?
                  wire88[(2'h3):(1'h0)] : reg97);
              reg96 <= wire87;
              reg97 <= ((wire84 ^~ (({reg90, reg97} || (|wire86)) ?
                  {wire84} : ($signed(reg97) ?
                      (reg93 ?
                          reg89 : reg95) : ((8'haf) >= wire83)))) != (wire85 ?
                  (reg96 ^~ {$unsigned((8'hbe))}) : (&($unsigned((7'h41)) ?
                      (+wire85) : $signed(reg92)))));
              reg98 <= ((8'hae) >> ($unsigned((wire87 ?
                  $unsigned(reg95) : $unsigned(reg96))) & reg89[(5'h11):(4'h9)]));
              reg99 <= wire88[(2'h3):(1'h0)];
            end
          if (($signed(reg97) ^~ reg96[(1'h1):(1'h0)]))
            begin
              reg100 <= reg94;
              reg101 <= (~reg90[(2'h2):(1'h1)]);
              reg102 <= (~|($unsigned(($unsigned(reg90) ?
                      $unsigned(reg91) : (reg100 ? (8'ha4) : wire86))) ?
                  $unsigned((!(^reg100))) : (&(-(~^(7'h42))))));
            end
          else
            begin
              reg100 <= ((~&(~&(|reg102))) ?
                  ({(reg93[(1'h1):(1'h1)] <<< {wire86, wire84}),
                      reg102[(4'he):(1'h0)]} <<< $signed(reg97)) : ((^$signed((wire86 ?
                      reg94 : (7'h44)))) << (&$signed(reg101[(2'h2):(2'h2)]))));
              reg101 <= (reg92[(5'h10):(4'hb)] ?
                  $signed({reg94[(2'h3):(1'h0)],
                      (reg89[(5'h11):(1'h0)] && (^reg94))}) : reg92[(2'h3):(1'h0)]);
            end
          reg103 <= reg94[(2'h3):(2'h2)];
        end
      reg104 <= reg92[(3'h6):(1'h0)];
      if (wire83)
        begin
          if ((reg89 ?
              reg91 : (((reg93 ? wire88 : (wire83 ? reg90 : reg94)) << ((reg90 ?
                      (8'hb7) : reg96) ?
                  (reg102 <<< (8'hb4)) : (reg95 ?
                      reg98 : reg90))) && (reg102 & wire84))))
            begin
              reg105 <= (reg92 < reg98);
              reg106 <= wire87[(1'h0):(1'h0)];
              reg107 <= $signed({(|((+reg100) ?
                      $unsigned((8'hb6)) : (wire84 >>> reg94)))});
              reg108 <= (~^$signed(reg95));
              reg109 <= reg105;
            end
          else
            begin
              reg105 <= (wire83[(4'he):(4'h9)] >> $signed(($unsigned((reg100 ?
                      (8'haf) : wire88)) ?
                  ($unsigned(reg109) ^~ (reg107 ? reg92 : reg94)) : reg103)));
              reg106 <= reg106[(4'hc):(4'hc)];
            end
          reg110 <= (-$signed(reg98[(2'h2):(1'h0)]));
          reg111 <= reg91[(1'h0):(1'h0)];
          reg112 <= {($unsigned((wire85 * (^(8'hab)))) ?
                  reg90 : (reg109 >> ((^reg96) ?
                      (!reg102) : (reg96 && reg108)))),
              $unsigned({$unsigned(reg109)})};
        end
      else
        begin
          if ($signed($signed({$unsigned(reg100[(4'ha):(2'h3)]),
              (reg106[(3'h6):(3'h6)] ? (-reg91) : (&reg94))})))
            begin
              reg105 <= (wire88 != (wire88[(3'h4):(1'h1)] ?
                  {$unsigned(reg109), wire86} : wire84[(1'h1):(1'h0)]));
              reg106 <= ((~|reg89) ^ $signed((&$signed((reg91 ?
                  reg94 : reg103)))));
            end
          else
            begin
              reg105 <= reg99[(3'h4):(2'h3)];
              reg106 <= (|reg90[(2'h2):(1'h1)]);
            end
        end
    end
  assign wire113 = {reg98, reg100};
  always
    @(posedge clk) begin
      reg114 <= ((($signed($signed((8'h9f))) ?
          (~^(~^reg93)) : $signed($signed((7'h43)))) <<< ((reg90 ?
              $unsigned(reg109) : (~&reg109)) ?
          reg90[(1'h0):(1'h0)] : ($unsigned(reg101) + wire88[(3'h4):(1'h1)]))) >> ((~|$signed((8'haa))) * reg91[(3'h4):(3'h4)]));
    end
  assign wire115 = ((wire86 << wire83[(4'he):(4'h9)]) ^ reg111);
  assign wire116 = {$unsigned(reg89[(4'hb):(1'h0)]),
                       (&{$unsigned((^reg105)),
                           $signed(((8'hac) ? (8'ha8) : reg98))})};
  assign wire117 = {(^~reg89[(4'h9):(2'h2)])};
  assign wire118 = (($unsigned($unsigned(((8'hba) ? reg95 : reg114))) ?
                       wire113[(1'h0):(1'h0)] : (($unsigned(reg104) != (-reg89)) & $unsigned($signed(wire87)))) > (wire86[(2'h3):(2'h2)] == reg93));
  assign wire119 = $unsigned(reg95[(3'h4):(2'h3)]);
  assign wire120 = (reg93[(3'h4):(2'h2)] ?
                       $signed($signed((&reg111[(2'h3):(1'h1)]))) : ((^~reg92) ?
                           ({$signed(wire116)} ?
                               (&reg101) : wire119) : $signed((|{reg106}))));
  always
    @(posedge clk) begin
      reg121 <= reg114[(2'h3):(2'h2)];
      if ($signed(((reg110 ^ (|(&(8'hbe)))) ?
          ((^reg96[(3'h6):(2'h2)]) * {((7'h44) ^ wire86)}) : ((&$signed(reg99)) != $unsigned(reg111)))))
        begin
          reg122 <= $unsigned((8'ha8));
          if ($unsigned($unsigned(reg99[(3'h5):(2'h2)])))
            begin
              reg123 <= ({$unsigned(({(8'hbb), wire85} ? (~^reg89) : reg103)),
                      (+reg89)} ?
                  $signed(((^~wire83[(5'h15):(5'h15)]) << {(reg111 ^ reg114)})) : reg97);
              reg124 <= wire86;
              reg125 <= {$unsigned(((+((8'hb0) != (7'h40))) ~^ $unsigned(((8'hab) ?
                      (8'ha2) : wire83))))};
              reg126 <= (^~$unsigned(reg98));
            end
          else
            begin
              reg123 <= (wire85 * ($signed($signed(reg107[(1'h1):(1'h1)])) ?
                  $unsigned($signed((reg98 | reg105))) : (reg97[(4'h8):(2'h2)] ?
                      ((reg125 != reg99) * reg126) : $signed(reg108[(1'h1):(1'h0)]))));
              reg124 <= $signed(reg122[(2'h3):(1'h1)]);
              reg125 <= reg102[(4'he):(4'h8)];
              reg126 <= (((((~&reg106) ?
                      wire116[(2'h3):(2'h2)] : $unsigned((8'hb3))) ^~ $signed($unsigned(reg92))) << (($signed(wire113) ?
                      (reg90 ?
                          wire117 : (8'ha0)) : reg102) == (+((8'hb3) == wire88)))) ?
                  (|(({(8'h9c), wire88} && (wire113 ?
                      reg123 : reg101)) <= (~^((8'had) ?
                      wire87 : (8'ha8))))) : ({{wire84[(3'h4):(1'h0)]},
                          reg108[(1'h0):(1'h0)]} ?
                      $signed(wire118) : (|(&{reg103}))));
            end
          if ($unsigned(reg99[(3'h4):(2'h3)]))
            begin
              reg127 <= (reg90 ^ (8'ha9));
            end
          else
            begin
              reg127 <= $unsigned(wire119);
              reg128 <= $signed($unsigned((-((~|reg104) != (reg114 ?
                  reg106 : reg100)))));
              reg129 <= $unsigned(reg101[(1'h1):(1'h1)]);
              reg130 <= $signed($unsigned((~^reg100[(4'he):(4'ha)])));
              reg131 <= $unsigned(reg92[(4'h9):(3'h6)]);
            end
          reg132 <= ((~^((~|reg102[(5'h13):(3'h4)]) | $unsigned(reg126[(2'h3):(1'h1)]))) ?
              wire116 : $unsigned($unsigned(reg105[(1'h1):(1'h0)])));
        end
      else
        begin
          reg122 <= (+((~&reg132[(1'h1):(1'h1)]) * $signed({(wire86 + reg93)})));
          if ($unsigned((reg129[(5'h15):(4'ha)] >> reg122)))
            begin
              reg123 <= $unsigned((~&(|$unsigned($unsigned(wire87)))));
              reg124 <= $unsigned((($signed((~^reg100)) ^~ $signed((reg109 ?
                  reg125 : (8'hb9)))) >>> $signed(wire113[(1'h1):(1'h0)])));
            end
          else
            begin
              reg123 <= (reg108[(2'h3):(2'h3)] <<< wire88);
              reg124 <= $signed($unsigned(wire116[(1'h1):(1'h0)]));
              reg125 <= (wire118 ?
                  ($signed($signed(reg126)) ?
                      reg121[(3'h7):(2'h2)] : ($unsigned($unsigned((8'ha5))) ?
                          (8'hbc) : (!(reg127 ?
                              reg125 : wire83)))) : ($unsigned($signed(reg90[(1'h1):(1'h0)])) ?
                      $signed($unsigned(reg100[(5'h11):(4'h9)])) : $signed({(8'hb5)})));
              reg126 <= (~^$signed(reg125[(3'h7):(3'h5)]));
              reg127 <= ($unsigned((-(8'hac))) ?
                  $signed(wire85[(3'h5):(3'h5)]) : $signed($unsigned(wire87[(2'h3):(1'h1)])));
            end
        end
    end
  assign wire133 = ((-reg103) >= (8'had));
  assign wire134 = wire120[(3'h7):(3'h6)];
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h1b7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire17;
  input wire signed [(5'h12):(1'h0)] wire16;
  input wire [(3'h4):(1'h0)] wire15;
  input wire [(3'h6):(1'h0)] wire14;
  input wire [(4'he):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire59;
  wire signed [(2'h2):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire45;
  wire signed [(3'h4):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  reg signed [(4'hc):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  assign y = {wire59,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg42,
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
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire18 = wire14;
  assign wire19 = $unsigned((wire13 == ({wire14} ?
                      ((|wire17) ?
                          $unsigned(wire18) : (wire18 < wire18)) : $unsigned(wire17[(2'h3):(2'h3)]))));
  assign wire20 = {{$unsigned((wire15[(1'h0):(1'h0)] ?
                              (-wire15) : wire14[(3'h5):(2'h2)])),
                          (($unsigned(wire16) < (wire17 ? wire17 : wire16)) ?
                              $signed(wire17) : ((wire15 ~^ wire14) ?
                                  wire16 : wire14))},
                      $unsigned(wire17[(1'h0):(1'h0)])};
  assign wire21 = wire16[(4'ha):(2'h3)];
  assign wire22 = wire19;
  assign wire23 = (~&(wire15[(2'h3):(2'h2)] ?
                      (($signed((8'hb7)) <<< $signed(wire16)) - $signed((wire21 << wire15))) : (~|$signed((~wire21)))));
  assign wire24 = (({$unsigned(wire20[(3'h4):(1'h0)])} ?
                          (((wire13 ? wire17 : wire15) ?
                                  {wire15, wire13} : wire22[(4'hf):(4'hf)]) ?
                              ($unsigned(wire13) >> (|wire18)) : $signed(wire17[(1'h0):(1'h0)])) : (~$unsigned((8'h9f)))) ?
                      (wire15[(3'h4):(3'h4)] ?
                          (^((|wire23) + $signed(wire16))) : wire17[(3'h4):(1'h1)]) : wire16[(4'hf):(4'ha)]);
  always
    @(posedge clk) begin
      if ((^wire22))
        begin
          if (($signed(wire17[(2'h2):(2'h2)]) ?
              wire14 : ($unsigned({wire18}) != (wire21[(4'h8):(4'h8)] ?
                  (~&$signed(wire15)) : $signed((wire13 ? wire23 : wire22))))))
            begin
              reg25 <= wire19[(3'h7):(2'h2)];
              reg26 <= wire16;
              reg27 <= (!$unsigned({$signed((~(8'hb9))),
                  wire21[(4'h9):(4'h8)]}));
            end
          else
            begin
              reg25 <= $unsigned((reg26[(1'h0):(1'h0)] ?
                  (wire13[(3'h6):(3'h6)] <= reg25) : $signed(((wire22 ?
                      wire23 : wire21) == wire19))));
              reg26 <= $unsigned(($signed($signed((wire15 << wire14))) ?
                  reg26 : wire17[(4'h8):(3'h5)]));
              reg27 <= reg25;
              reg28 <= ({wire23[(1'h0):(1'h0)]} ?
                  ($signed(($signed(wire17) ?
                      (wire22 < wire24) : {wire21,
                          (7'h41)})) > wire22) : wire21);
            end
          reg29 <= wire24;
          reg30 <= $unsigned($unsigned({$signed((wire17 ? wire14 : wire19)),
              wire23}));
        end
      else
        begin
          if ((8'h9c))
            begin
              reg25 <= reg27;
              reg26 <= {{{wire19, (((8'hb7) ~^ reg30) <<< {wire23, wire18})},
                      $unsigned(({wire22} >= $signed(wire23)))},
                  ($unsigned($unsigned((wire19 >> (8'ha7)))) != (((!wire13) ?
                          (wire13 || wire17) : $unsigned(wire24)) ?
                      reg25 : ((wire22 << reg27) | {reg25})))};
              reg27 <= reg27[(4'hb):(4'h9)];
              reg28 <= (-(wire18[(4'hb):(4'h9)] ?
                  $unsigned((reg29 ?
                      (reg30 ?
                          wire22 : wire13) : (|wire19))) : $signed(($unsigned(wire13) | reg30[(4'h9):(3'h6)]))));
              reg29 <= $unsigned($signed((!{$signed(wire18)})));
            end
          else
            begin
              reg25 <= $signed($unsigned(($unsigned({wire19}) << reg26)));
              reg26 <= ((wire23[(4'hf):(4'he)] >> ($unsigned(reg25) ?
                  wire13 : (8'h9e))) <= ($unsigned((^(wire21 && (8'hb9)))) ~^ $signed(wire18)));
              reg27 <= wire21;
            end
          reg30 <= $signed((((8'hab) ~^ (^$signed(wire16))) ?
              $signed(reg26) : ($signed(((8'ha0) ? wire16 : reg27)) ?
                  wire14[(1'h1):(1'h0)] : ((wire16 == wire20) ^~ (reg28 ^~ wire23)))));
        end
      reg31 <= wire23;
      reg32 <= ((((reg29[(1'h0):(1'h0)] >= (~^wire23)) ?
              wire15[(3'h4):(2'h3)] : wire16) ?
          $signed({{wire23}, wire17}) : $unsigned({{wire23, (8'hb2)},
              (|wire24)})) ^ $unsigned((~{(wire17 ? wire20 : wire18),
          wire17[(1'h1):(1'h0)]})));
      reg33 <= wire20[(2'h2):(1'h1)];
    end
  always
    @(posedge clk) begin
      if ($signed(((&((wire13 ?
          wire19 : wire21) + $unsigned(reg33))) ~^ (^(+wire15)))))
        begin
          reg34 <= $signed({$unsigned(reg27[(5'h11):(3'h6)])});
        end
      else
        begin
          reg34 <= wire22;
        end
      if ($signed(reg32))
        begin
          reg35 <= $signed($unsigned((8'ha4)));
          if ((8'ha5))
            begin
              reg36 <= ((reg28 ?
                  ($unsigned($signed(reg25)) ?
                      ({reg29} | $unsigned(reg26)) : $unsigned($signed(wire20))) : (+(wire14[(2'h3):(2'h3)] ?
                      $unsigned((8'ha9)) : (wire13 <<< reg34)))) >>> (8'hae));
              reg37 <= ((~^{($unsigned(wire19) ?
                          reg28[(1'h0):(1'h0)] : $unsigned(wire13)),
                      {wire22, (reg34 ? wire15 : reg30)}}) ?
                  wire14 : $signed((wire23 ?
                      $unsigned({reg32, reg28}) : ((wire21 <<< reg26) ?
                          $signed(reg34) : (-reg27)))));
              reg38 <= reg26;
            end
          else
            begin
              reg36 <= reg30[(4'h9):(3'h6)];
              reg37 <= {reg27, $signed((~|{(8'haa)}))};
              reg38 <= $signed({$unsigned(($signed((8'ha0)) ?
                      (reg30 && wire14) : $unsigned(wire14)))});
              reg39 <= ($signed($unsigned($unsigned(reg25[(2'h2):(1'h1)]))) ?
                  reg26 : $unsigned((reg29[(2'h3):(2'h3)] ^~ ((!wire19) - (reg33 ?
                      reg38 : reg38)))));
              reg40 <= (((^~($unsigned(wire13) ?
                  (~|(8'ha2)) : $signed(wire15))) ~^ reg34[(3'h5):(2'h2)]) ^~ reg37);
            end
        end
      else
        begin
          reg35 <= wire16;
          reg36 <= (~|wire16);
        end
    end
  always
    @(posedge clk) begin
      reg41 <= {$unsigned((+($signed(reg29) ? wire15 : (8'haf)))), wire23};
      reg42 <= (~^$signed(reg40[(4'hd):(4'hb)]));
    end
  assign wire43 = (($signed(((8'ha4) + reg31)) ?
                          $signed($unsigned((~^reg42))) : {{(~(8'ha0)),
                                  (~reg34)}}) ?
                      {$unsigned(wire24[(2'h3):(2'h3)])} : wire21[(2'h2):(1'h0)]);
  assign wire44 = $signed((!(((+wire15) <= (|reg27)) ?
                      ((wire21 || wire15) ?
                          wire18 : wire16) : (reg27[(3'h4):(1'h1)] > reg34[(1'h0):(1'h0)]))));
  assign wire45 = reg29[(2'h3):(2'h3)];
  assign wire46 = ((!$signed((reg26 ? wire21 : ((8'ha7) <<< reg33)))) + wire16);
  assign wire47 = (~^(8'hb7));
  assign wire48 = $signed((((^~wire23) ? (8'hbc) : wire44) ?
                      $signed((^~$unsigned(wire43))) : ((reg42 ?
                              $signed(wire15) : $signed(reg41)) ?
                          wire15 : (!(&reg27)))));
  assign wire49 = (^$unsigned((((reg27 ?
                      (8'ha2) : reg42) ^ reg32[(2'h3):(2'h2)]) == ((~reg35) | (~reg40)))));
  assign wire50 = ({$signed((8'ha7)),
                      {reg34[(1'h0):(1'h0)],
                          ($unsigned((7'h42)) ?
                              reg32 : wire47[(1'h0):(1'h0)])}} ^ wire14);
  always
    @(posedge clk) begin
      reg51 <= reg38;
      reg52 <= $signed({$signed({$unsigned((8'hb8)), reg25[(1'h0):(1'h0)]})});
      reg53 <= (({(-wire14),
              ((wire14 && (8'h9e)) ?
                  reg39 : (8'ha1))} ^ $unsigned(($signed(reg51) ?
              reg29 : (+reg37)))) ?
          $unsigned($unsigned(((+reg31) || ((8'hae) && (8'h9c))))) : (wire23[(4'hc):(3'h5)] << $signed(($unsigned(reg35) ?
              ((8'ha7) != wire19) : $unsigned(reg36)))));
      if ((wire23[(4'he):(3'h4)] ^~ (wire43 ?
          $unsigned($unsigned((wire47 ? reg42 : (8'h9c)))) : wire14)))
        begin
          reg54 <= ($signed(wire13[(4'h8):(1'h0)]) ~^ ((&$signed((reg52 ?
              wire13 : wire48))) < {((8'had) ?
                  (reg32 ? (8'hbf) : (8'had)) : reg30),
              $unsigned((wire49 ? (8'hba) : reg32))}));
          if ($signed(reg39[(3'h7):(2'h3)]))
            begin
              reg55 <= (wire48 ?
                  $signed({wire20[(3'h4):(2'h3)]}) : (~(((reg31 ?
                          (8'hb0) : reg51) ?
                      reg29[(2'h3):(2'h3)] : $signed(wire46)) - ($unsigned(wire48) ?
                      $unsigned(wire17) : (|wire13)))));
              reg56 <= (^wire14[(3'h4):(1'h0)]);
            end
          else
            begin
              reg55 <= {wire45};
              reg56 <= reg52;
              reg57 <= wire43[(3'h6):(3'h5)];
              reg58 <= $signed(reg56);
            end
        end
      else
        begin
          reg54 <= (8'hbf);
          reg55 <= ({reg28[(3'h5):(3'h5)],
              (~|({(8'hb9)} && $unsigned(reg58)))} == ($signed($signed((reg26 ?
              reg38 : wire20))) <= $unsigned($unsigned(reg28[(1'h0):(1'h0)]))));
          reg56 <= $unsigned(reg54[(4'h9):(2'h2)]);
        end
    end
  assign wire59 = $unsigned(reg38[(2'h2):(2'h2)]);
endmodule
