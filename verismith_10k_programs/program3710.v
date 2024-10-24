module top
#(parameter param154 = ((((8'hbe) + (~^((8'ha1) && (8'hbf)))) ~^ {(((8'hb6) ? (8'hb4) : (8'hab)) << ((8'haf) ? (8'haf) : (8'ha3)))}) ? (((~^(8'ha6)) == (-((8'hb6) ? (8'hb1) : (8'ha1)))) ? (^~(&((8'hb2) - (8'hbb)))) : (|(-((8'haa) || (8'hb5))))) : (-(~^{(8'ha9)}))), 
parameter param155 = {(^((7'h42) ^ (8'h9e))), (|param154)})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire153;
  wire [(3'h7):(1'h0)] wire152;
  wire [(4'hd):(1'h0)] wire151;
  wire [(4'ha):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire82;
  wire signed [(4'ha):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire85;
  wire [(4'hb):(1'h0)] wire86;
  wire [(4'he):(1'h0)] wire87;
  wire [(5'h12):(1'h0)] wire149;
  assign y = {wire153,
                 wire152,
                 wire151,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire82,
                 wire84,
                 wire85,
                 wire86,
                 wire87,
                 wire149,
                 (1'h0)};
  assign wire5 = (&$signed($signed((wire4[(3'h7):(2'h2)] ?
                     $signed(wire2) : wire3[(4'hf):(4'h9)]))));
  assign wire6 = wire2;
  assign wire7 = (8'h9e);
  assign wire8 = wire4[(2'h2):(2'h2)];
  assign wire9 = (((~($signed(wire5) ? $unsigned(wire8) : (8'h9c))) ?
                         $unsigned($unsigned(wire7)) : ((|wire2[(4'he):(1'h1)]) ?
                             wire1[(3'h7):(3'h5)] : ((8'hb1) ?
                                 (~(8'hb8)) : wire0))) ?
                     ((8'hbf) ^~ (~^$unsigned($unsigned(wire3)))) : ($unsigned(((wire0 ?
                             wire2 : wire1) ?
                         $signed(wire7) : wire1[(3'h7):(1'h1)])) ^ (-(!((8'hab) ?
                         wire4 : wire1)))));
  module10 #() modinst83 (.clk(clk), .wire13(wire0), .y(wire82), .wire12(wire8), .wire11(wire5), .wire14(wire9));
  assign wire84 = (~&wire2[(3'h4):(1'h1)]);
  assign wire85 = ((($signed(wire82) < ($signed(wire7) >= ((8'ha7) && wire4))) ?
                      $unsigned({wire2[(4'hb):(4'ha)],
                          $signed(wire6)}) : wire9) >>> wire9[(1'h1):(1'h0)]);
  assign wire86 = $signed($unsigned(($signed($unsigned(wire84)) ?
                      wire3 : $unsigned(((8'ha8) ? wire7 : wire85)))));
  assign wire87 = $unsigned(wire84);
  module88 #() modinst150 (wire149, clk, wire1, wire2, wire8, wire85, wire0);
  assign wire151 = (~^(~$unsigned(wire9)));
  assign wire152 = wire85[(5'h11):(4'h9)];
  assign wire153 = $unsigned({((wire87[(4'h8):(3'h4)] || {wire86, wire3}) ?
                           {(wire151 ?
                                   (8'hb7) : (7'h43))} : $signed((8'hb1)))});
endmodule

module module88
#(parameter param147 = ((8'hb0) != (((((8'had) ? (8'h9e) : (8'hbf)) ? ((8'ha4) ? (8'ha8) : (8'ha6)) : (~(7'h42))) ? (+(-(8'h9f))) : (((8'hb3) ? (8'hbd) : (7'h44)) ? ((8'h9d) ? (8'hb9) : (7'h41)) : ((8'ha0) ^~ (8'hba)))) ? ((~&((8'hb2) ? (7'h40) : (8'hb7))) ? (((8'h9f) ~^ (8'ha1)) >> ((8'hb6) ? (8'h9f) : (8'ha4))) : (((8'h9c) == (7'h40)) >>> ((8'hac) ? (8'hbd) : (8'hbe)))) : (((~(8'had)) < ((8'hb3) ? (8'hb4) : (8'hb6))) <<< (((8'h9c) ? (8'hbb) : (8'hb4)) >> (+(8'ha5)))))), 
parameter param148 = ((~((~param147) >>> (param147 <<< (~&param147)))) ? (((|(~param147)) == ((!param147) < param147)) ? (param147 ? ((param147 ? param147 : param147) << ((8'h9f) ? param147 : param147)) : {(~&param147), param147}) : (param147 ? param147 : ({param147, param147} || (param147 ? (8'ha1) : param147)))) : (param147 ? param147 : (~|(^~{(8'hb7), param147})))))
(y, clk, wire93, wire92, wire91, wire90, wire89);
  output wire [(32'h27f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire93;
  input wire [(5'h13):(1'h0)] wire92;
  input wire signed [(4'hf):(1'h0)] wire91;
  input wire signed [(5'h12):(1'h0)] wire90;
  input wire signed [(4'h9):(1'h0)] wire89;
  wire [(2'h2):(1'h0)] wire139;
  wire [(3'h4):(1'h0)] wire138;
  wire [(4'ha):(1'h0)] wire137;
  wire signed [(5'h15):(1'h0)] wire136;
  wire [(3'h6):(1'h0)] wire135;
  wire [(5'h11):(1'h0)] wire134;
  wire signed [(4'hc):(1'h0)] wire133;
  wire signed [(5'h15):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire105;
  wire signed [(5'h14):(1'h0)] wire96;
  wire [(3'h6):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire94;
  reg signed [(3'h6):(1'h0)] reg146 = (1'h0);
  reg [(5'h14):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg144 = (1'h0);
  reg [(3'h5):(1'h0)] reg143 = (1'h0);
  reg [(2'h2):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg141 = (1'h0);
  reg [(5'h15):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg [(4'hb):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg128 = (1'h0);
  reg [(2'h3):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg123 = (1'h0);
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg [(4'h9):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg119 = (1'h0);
  reg [(4'hf):(1'h0)] reg118 = (1'h0);
  reg [(5'h14):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg116 = (1'h0);
  reg [(3'h7):(1'h0)] reg115 = (1'h0);
  reg [(5'h13):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg112 = (1'h0);
  reg signed [(4'he):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg110 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg107 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg102 = (1'h0);
  reg [(5'h15):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg100 = (1'h0);
  reg [(5'h12):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg98 = (1'h0);
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire106,
                 wire105,
                 wire96,
                 wire95,
                 wire94,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
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
                 reg120,
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
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire94 = {((!((wire90 | wire90) & (wire89 >= wire91))) ?
                          (7'h44) : (^~$unsigned((wire91 <<< wire92))))};
  assign wire95 = wire92[(3'h6):(3'h4)];
  assign wire96 = $unsigned($unsigned($unsigned(wire89[(3'h4):(2'h2)])));
  always
    @(posedge clk) begin
      if (wire91[(3'h6):(2'h2)])
        begin
          reg97 <= (~^wire94);
          reg98 <= $unsigned(wire91[(2'h2):(2'h2)]);
          if (wire96[(2'h2):(1'h1)])
            begin
              reg99 <= wire89[(1'h0):(1'h0)];
              reg100 <= {($unsigned({wire92}) ?
                      $unsigned($unsigned((wire96 ^ wire90))) : (-($unsigned(wire91) ^ $unsigned(reg98))))};
              reg101 <= reg97[(4'h8):(3'h5)];
              reg102 <= $unsigned($unsigned(($signed(((7'h43) * wire93)) ~^ {(+wire92),
                  ((8'hac) >= (8'h9d))})));
            end
          else
            begin
              reg99 <= wire95;
              reg100 <= $unsigned($signed((^~{$signed(reg98)})));
              reg101 <= wire92[(3'h7):(3'h4)];
              reg102 <= $unsigned((wire94[(2'h2):(1'h1)] & $signed({(^~wire94)})));
            end
          reg103 <= (|wire96[(5'h13):(2'h2)]);
        end
      else
        begin
          if (reg100)
            begin
              reg97 <= wire91;
            end
          else
            begin
              reg97 <= {(^(~|wire91[(4'hf):(4'he)]))};
              reg98 <= {$signed(wire94)};
              reg99 <= reg98;
              reg100 <= (&$unsigned({$unsigned($unsigned(wire91)),
                  (^$signed(reg103))}));
            end
          if ((($signed({reg102[(1'h1):(1'h1)], {(8'hbd), (8'ha9)}}) ?
                  $signed($unsigned((wire93 <= wire90))) : reg98[(1'h0):(1'h0)]) ?
              ($signed($unsigned($signed(reg97))) == (($signed(reg97) ?
                  reg100 : (reg99 - (8'hbf))) != wire93[(3'h6):(3'h6)])) : (((7'h41) && {$signed(wire90),
                  (reg101 ? wire93 : wire93)}) <<< wire96)))
            begin
              reg101 <= ($signed((-reg101[(5'h13):(3'h5)])) ?
                  reg97 : (wire95 ?
                      wire93[(4'hd):(3'h4)] : (((wire91 ? wire90 : wire95) ?
                          $signed((8'ha7)) : $unsigned((8'hb7))) && {reg100,
                          (~&(8'hb5))})));
              reg102 <= (~|reg102);
              reg103 <= (((reg99 ?
                          $signed($signed(reg101)) : {wire92[(4'h9):(3'h5)],
                              (reg101 ? (8'hb9) : wire93)}) ?
                      ({(reg99 ? wire93 : reg98),
                          reg99} ~^ $unsigned(reg103)) : ((-$unsigned(reg102)) != ({wire89} || (^reg103)))) ?
                  wire92 : (~(+reg100[(4'h8):(3'h4)])));
            end
          else
            begin
              reg101 <= ((8'hb3) ?
                  (~$unsigned({reg100[(4'ha):(1'h1)],
                      (-wire96)})) : $signed($unsigned(reg103)));
              reg102 <= $unsigned($unsigned((reg99[(4'hc):(2'h3)] + $unsigned(wire96[(2'h3):(1'h0)]))));
              reg103 <= $signed(wire96);
            end
        end
      reg104 <= wire92;
    end
  assign wire105 = wire96;
  assign wire106 = $signed($signed(((wire93[(3'h7):(1'h0)] + {(8'h9c),
                       reg97}) << $unsigned((wire96 >> wire93)))));
  always
    @(posedge clk) begin
      reg107 <= ($signed(((-$signed(wire95)) >> (reg99 + {wire91}))) ?
          reg100[(2'h2):(2'h2)] : (~|$unsigned($unsigned((~^wire94)))));
      reg108 <= $signed($unsigned((+wire93[(4'hb):(4'h9)])));
      reg109 <= $signed((!wire89[(3'h6):(2'h2)]));
      reg110 <= reg109[(1'h1):(1'h1)];
      reg111 <= $signed(reg99[(4'hc):(1'h1)]);
    end
  always
    @(posedge clk) begin
      if ({{reg102}, $unsigned((wire90 ^~ wire91))})
        begin
          reg112 <= {(8'hb5)};
          reg113 <= (8'ha3);
          if ({wire96})
            begin
              reg114 <= $signed($signed((!wire93)));
              reg115 <= ($signed(reg97) ?
                  (!(((^~wire95) ?
                      {(8'ha5),
                          (8'hba)} : (|wire90)) && (~|wire91[(1'h0):(1'h0)]))) : reg109[(5'h10):(4'hc)]);
            end
          else
            begin
              reg114 <= ((wire89 ?
                  wire106[(1'h1):(1'h1)] : reg102[(1'h1):(1'h1)]) ^ $unsigned({$unsigned((reg103 ?
                      reg108 : (8'ha8))),
                  $signed((+reg104))}));
            end
          reg116 <= reg113[(4'ha):(4'h9)];
        end
      else
        begin
          reg112 <= $signed($unsigned((^reg109)));
        end
      if ((&wire94[(1'h1):(1'h1)]))
        begin
          if (((({$signed(reg111)} ?
                  $unsigned((reg99 ? wire105 : wire106)) : reg107) ?
              reg116[(2'h2):(1'h1)] : wire90[(1'h1):(1'h0)]) | wire90[(4'hb):(2'h2)]))
            begin
              reg117 <= reg115[(3'h4):(3'h4)];
              reg118 <= $unsigned(wire95[(3'h5):(1'h0)]);
              reg119 <= ((reg102[(3'h4):(1'h0)] ?
                      (reg104[(2'h3):(2'h2)] - (~(~^reg108))) : wire96[(4'hd):(2'h2)]) ?
                  {(|(~^$signed(reg116))),
                      $signed(((reg97 <<< reg114) > $unsigned(reg114)))} : (-$signed((wire93 ?
                      (wire95 ? reg101 : reg118) : (^~wire91)))));
              reg120 <= (|(!({reg108[(2'h2):(1'h0)],
                  wire89[(2'h3):(1'h1)]} << wire96[(2'h2):(2'h2)])));
            end
          else
            begin
              reg117 <= $signed(reg113);
            end
          reg121 <= $signed($unsigned(reg120[(1'h0):(1'h0)]));
          if (((~^(((~|wire90) ? (reg103 && wire91) : reg102[(3'h7):(2'h2)]) ?
                  wire94 : {wire90})) ?
              $unsigned(({reg115, $unsigned(reg104)} & reg101)) : reg97))
            begin
              reg122 <= $unsigned((~|(reg97[(4'hd):(4'hd)] ?
                  ($signed(wire95) * $signed(reg111)) : ((wire96 + reg101) << (reg112 ?
                      reg102 : wire89)))));
              reg123 <= ((^$unsigned($unsigned($signed(reg108)))) ?
                  $signed(reg115[(2'h3):(2'h2)]) : ($signed(wire94) << {((reg120 << (8'ha4)) ?
                          reg118 : reg107),
                      $unsigned(reg103[(2'h3):(1'h0)])}));
              reg124 <= wire105[(1'h0):(1'h0)];
              reg125 <= (reg102 ?
                  $unsigned($unsigned($signed(reg97))) : reg124);
            end
          else
            begin
              reg122 <= (-$unsigned(wire92[(3'h7):(3'h4)]));
              reg123 <= (^(reg104 > wire94));
            end
          reg126 <= (!(7'h41));
          reg127 <= $signed(reg99);
        end
      else
        begin
          if (reg107[(4'h9):(3'h5)])
            begin
              reg117 <= $unsigned(wire93[(3'h5):(1'h1)]);
              reg118 <= (reg114[(3'h5):(1'h1)] >> wire89[(4'h9):(1'h0)]);
              reg119 <= ($unsigned(((^reg126[(4'ha):(4'ha)]) ?
                  reg102 : $signed($signed(reg116)))) << ((((8'hae) == reg113[(4'hb):(4'h8)]) ?
                      ($unsigned(reg109) | reg118) : $unsigned(wire89[(1'h1):(1'h1)])) ?
                  $unsigned(((+wire91) && $signed(reg103))) : $signed(($unsigned(reg114) ?
                      $signed(reg117) : reg126))));
              reg120 <= (($signed(reg109[(1'h0):(1'h0)]) ?
                  (($unsigned((8'hba)) <<< $unsigned(wire93)) > $signed($signed((8'ha8)))) : ($unsigned($unsigned((8'h9c))) ?
                      (wire95[(2'h2):(1'h0)] ?
                          (~^reg111) : reg102[(1'h0):(1'h0)]) : ($signed(reg120) ?
                          $signed(reg109) : wire90[(4'hb):(4'h8)]))) ^ {(wire92[(1'h0):(1'h0)] ?
                      $signed({reg107, reg97}) : wire96[(3'h4):(1'h1)]),
                  wire105[(2'h2):(1'h1)]});
              reg121 <= ((reg125 <<< ((+(reg111 ? reg107 : reg98)) ?
                  (wire95 ?
                      wire95 : reg118[(3'h7):(2'h2)]) : (&$unsigned(reg107)))) >> ((wire105[(2'h2):(1'h0)] ?
                  {((8'hae) ? wire96 : reg115)} : (~^(reg101 ?
                      reg114 : reg109))) >= $unsigned(reg116[(2'h2):(1'h1)])));
            end
          else
            begin
              reg117 <= (reg100 < $signed((({wire93, reg100} ?
                      reg99[(4'h9):(2'h2)] : $signed(reg113)) ?
                  reg126 : reg123[(3'h5):(1'h1)])));
            end
        end
      reg128 <= $signed(reg126[(5'h11):(5'h11)]);
    end
  always
    @(posedge clk) begin
      reg129 <= ($signed(reg112) ?
          (~reg123) : {wire94[(4'hd):(4'hb)],
              (reg111 ? reg116[(3'h6):(3'h6)] : reg112[(4'ha):(4'h9)])});
      reg130 <= ((reg108[(4'h9):(4'h8)] ?
          $unsigned($unsigned($signed(reg126))) : reg108) ~^ ($signed((!{reg126,
          wire89})) * ($unsigned($signed(reg104)) >> ((8'hb7) << ((8'h9c) > reg122)))));
      reg131 <= reg116[(3'h5):(2'h2)];
      reg132 <= ((~|$signed(reg130[(4'hc):(3'h7)])) | reg110[(4'hd):(3'h7)]);
    end
  assign wire133 = reg109[(2'h3):(1'h1)];
  assign wire134 = (+reg115[(2'h3):(1'h1)]);
  assign wire135 = $signed($unsigned(reg117[(4'h9):(2'h2)]));
  assign wire136 = ({($unsigned(((8'hb7) ?
                               reg112 : (8'hbe))) ^~ $signed(reg113[(3'h6):(2'h2)]))} ?
                       $signed(wire94) : wire94);
  assign wire137 = $signed($signed({$signed({reg126, reg102}),
                       $signed(reg123[(5'h12):(1'h0)])}));
  assign wire138 = reg102;
  assign wire139 = $signed(((8'haa) ^~ $signed($signed((wire138 ?
                       wire90 : reg125)))));
  always
    @(posedge clk) begin
      if ($signed($signed($unsigned((reg100 * ((8'hb7) < reg103))))))
        begin
          if (($unsigned((reg101 ?
                  $unsigned($unsigned((8'h9f))) : $unsigned($signed(reg118)))) ?
              (!(((reg130 ?
                  wire96 : reg121) >= (~&(8'hae))) >> ($signed(reg118) ?
                  {(8'hb9), (8'had)} : {wire91,
                      reg117}))) : (-reg124[(3'h4):(1'h0)])))
            begin
              reg140 <= (($unsigned({(wire93 ? reg129 : (8'ha5)),
                  $signed(wire135)}) >= $signed($unsigned($unsigned(reg98)))) << $unsigned($signed(($unsigned(wire139) << reg117[(4'ha):(4'h9)]))));
              reg141 <= ($signed((-$unsigned($unsigned(reg119)))) > reg103);
            end
          else
            begin
              reg140 <= reg128;
              reg141 <= (&reg117[(5'h14):(5'h13)]);
              reg142 <= (reg108 ?
                  {(reg112 ?
                          $signed((reg131 ?
                              wire96 : wire137)) : wire136[(3'h7):(1'h1)]),
                      wire92[(5'h11):(4'hb)]} : wire94[(2'h3):(1'h1)]);
              reg143 <= $unsigned(reg104);
            end
          reg144 <= reg117[(1'h1):(1'h1)];
          reg145 <= reg104[(1'h1):(1'h0)];
        end
      else
        begin
          reg140 <= reg107[(4'ha):(2'h3)];
          reg141 <= {$signed(({$signed(reg132)} ?
                  $unsigned({(7'h44),
                      wire106}) : (reg99[(4'he):(4'h9)] < (|reg113))))};
        end
      reg146 <= reg142[(1'h0):(1'h0)];
    end
endmodule

module module10
#(parameter param80 = (((+(((8'hb5) ^ (8'ha0)) ? (~^(7'h40)) : ((8'haf) ? (8'hbb) : (7'h43)))) ? {((~(8'ha6)) == (&(8'haf)))} : ((((8'hbc) ? (7'h44) : (8'h9d)) ? ((7'h42) << (8'h9d)) : (|(8'hbd))) ? (|((8'haa) ? (8'hb9) : (8'hb2))) : (8'hb1))) ? (((((7'h41) ^ (8'ha1)) ? ((8'hac) | (8'hb6)) : {(8'hbd)}) * ((8'hb4) | {(8'h9f), (8'hbb)})) - (^{((7'h41) < (8'hb7)), ((7'h41) ? (8'hbd) : (8'hbf))})) : {(!(((8'h9e) | (8'ha6)) != (-(8'hb1)))), (~&{((8'hab) ? (8'ha7) : (8'hb5))})}), 
parameter param81 = (~^param80))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire14;
  input wire signed [(3'h5):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire12;
  input wire signed [(3'h7):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire15;
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  assign y = {wire78,
                 wire34,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
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
                 reg33,
                 (1'h0)};
  assign wire15 = $signed(wire11[(2'h2):(2'h2)]);
  assign wire16 = wire13[(3'h4):(1'h0)];
  assign wire17 = ($signed($unsigned($unsigned(wire11))) ^~ wire15[(1'h1):(1'h1)]);
  assign wire18 = ((~wire11) ?
                      ($signed(wire16[(4'ha):(3'h5)]) | ($signed({wire11}) ?
                          $unsigned((wire13 ?
                              wire16 : wire16)) : $signed((^wire15)))) : (($signed({wire17,
                          wire17}) > $unsigned({(8'h9d), wire12})) >= {(wire13 ?
                              wire12 : (wire13 ? wire13 : wire15))}));
  always
    @(posedge clk) begin
      reg19 <= $signed(wire14[(2'h2):(2'h2)]);
      reg20 <= (|$unsigned(reg19));
      if (wire14[(1'h0):(1'h0)])
        begin
          reg21 <= $unsigned(wire12);
          reg22 <= ($signed($unsigned((~&(wire14 <= wire14)))) ?
              (8'hb6) : $signed($signed(($signed(reg21) ?
                  wire11 : $signed(wire13)))));
          if ((reg20[(1'h0):(1'h0)] ^~ (^~reg22[(4'hb):(4'ha)])))
            begin
              reg23 <= {reg22,
                  ($signed((8'hb2)) ?
                      ((^~(^wire18)) - reg21) : (~reg22[(5'h10):(4'h9)]))};
              reg24 <= $signed(reg23);
            end
          else
            begin
              reg23 <= (reg19[(3'h6):(1'h0)] ?
                  reg21[(5'h10):(4'he)] : (^($unsigned(reg22[(1'h0):(1'h0)]) ?
                      wire12[(4'hf):(3'h5)] : $signed({reg24, (8'h9e)}))));
              reg24 <= {((wire15[(3'h6):(2'h3)] + ((reg24 * wire14) ?
                      wire18 : $unsigned((8'ha7)))) + wire13[(3'h4):(1'h0)])};
              reg25 <= ($signed($unsigned(($signed(reg22) ?
                  (reg19 | wire12) : (wire18 | wire12)))) ^ ((wire13[(2'h3):(1'h1)] >> $unsigned((~|wire15))) ?
                  $signed((((8'ha7) ? wire15 : reg21) ?
                      (8'h9c) : $signed((7'h44)))) : reg21[(2'h2):(1'h1)]));
              reg26 <= $unsigned(wire16);
              reg27 <= wire16;
            end
          if (wire15)
            begin
              reg28 <= $unsigned(reg26);
              reg29 <= ((|(|(+((7'h41) ? wire12 : (8'hbd))))) ?
                  reg19[(2'h3):(2'h3)] : $signed((^(~|(&reg19)))));
              reg30 <= (~|wire11[(3'h4):(2'h2)]);
              reg31 <= (($signed(reg30) != $unsigned($signed((8'hb6)))) ^~ $unsigned(((|reg25[(3'h5):(1'h1)]) && {$signed(wire14)})));
              reg32 <= ($signed((8'h9e)) ?
                  ((wire18 ^ (7'h42)) >= $unsigned(($signed(wire16) ^ reg22))) : {($signed($unsigned((8'ha3))) * (reg30[(1'h0):(1'h0)] ?
                          wire13[(2'h2):(2'h2)] : (8'ha9))),
                      wire11[(1'h1):(1'h1)]});
            end
          else
            begin
              reg28 <= (&$unsigned(wire15));
              reg29 <= ($unsigned($signed(reg26[(3'h4):(1'h0)])) ^ wire13);
              reg30 <= $signed($unsigned($unsigned({reg28[(3'h6):(2'h2)]})));
            end
        end
      else
        begin
          reg21 <= $unsigned($unsigned((($unsigned((8'ha1)) ? reg23 : {reg29}) ?
              $unsigned((reg30 ? (8'hb0) : wire13)) : {(reg31 ?
                      (8'hb6) : reg19)})));
          reg22 <= {(wire11 & (&reg24)), $signed(reg29)};
          reg23 <= ((wire12[(1'h1):(1'h1)] + reg21[(5'h10):(4'hb)]) ?
              (wire13[(3'h5):(2'h3)] >>> reg19) : reg30);
        end
      reg33 <= $signed(((|(~$unsigned(reg25))) ?
          ($signed(((8'hb9) << reg19)) ~^ (wire17 <<< {wire12,
              (7'h40)})) : ({(wire17 ?
                  wire14 : reg20)} < ($signed(wire15) < (^reg26)))));
    end
  assign wire34 = (($unsigned(reg33) + $signed($signed(reg21[(4'h8):(4'h8)]))) >= $unsigned($signed({(wire11 ?
                          (8'ha0) : reg33),
                      $signed(reg27)})));
  module35 #() modinst79 (.wire40(wire12), .clk(clk), .wire37(reg31), .wire39(wire16), .wire36(reg25), .wire38(reg19), .y(wire78));
endmodule

module module35
#(parameter param77 = {(|({((8'h9c) >= (8'haf))} ? {{(8'hb1)}, {(8'hab)}} : ({(8'hb8)} >>> ((7'h44) ? (8'hb3) : (8'ha1))))), ((~&(+(8'ha8))) ~^ {(|((8'ha8) | (8'hb6))), {((8'hb8) ? (8'hbc) : (8'hbd)), ((8'hae) == (8'hbc))}})})
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h183):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire40;
  input wire signed [(4'hc):(1'h0)] wire39;
  input wire [(2'h3):(1'h0)] wire38;
  input wire [(4'ha):(1'h0)] wire37;
  input wire signed [(3'h5):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire75;
  wire [(4'hf):(1'h0)] wire74;
  wire [(4'ha):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire72;
  wire signed [(3'h6):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire70;
  wire [(2'h2):(1'h0)] wire69;
  wire signed [(3'h7):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire65;
  wire signed [(3'h4):(1'h0)] wire64;
  wire signed [(2'h3):(1'h0)] wire63;
  wire signed [(5'h14):(1'h0)] wire62;
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
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
      if ($signed($unsigned(wire38[(2'h2):(1'h1)])))
        begin
          reg41 <= ($signed((($signed(wire38) ?
                  $signed(wire39) : (wire40 ?
                      wire40 : wire39)) || {$signed(wire40),
                  wire39[(2'h2):(1'h0)]})) ?
              {wire40} : $signed({$signed((wire36 ? wire40 : (7'h44)))}));
          reg42 <= {({(wire39[(1'h1):(1'h0)] > wire39[(4'hb):(2'h3)])} ?
                  (~^wire39[(3'h4):(2'h3)]) : (^(~wire40))),
              wire40};
          if ($unsigned(wire39))
            begin
              reg43 <= (((~|reg41[(5'h11):(3'h7)]) & ({reg41[(2'h2):(1'h0)]} ^ $signed(wire37))) & reg41);
              reg44 <= reg42[(4'ha):(4'h9)];
              reg45 <= $signed((|$unsigned($unsigned(wire37))));
            end
          else
            begin
              reg43 <= ((~$signed(reg42[(3'h4):(3'h4)])) ?
                  reg42 : ($signed(wire37[(4'h8):(3'h5)]) ?
                      (7'h44) : ((8'had) << ($signed(reg44) != $unsigned(wire36)))));
              reg44 <= ((reg41[(5'h12):(4'he)] ?
                  $unsigned((~^(wire36 || reg42))) : {$signed(reg42[(4'hc):(4'hb)]),
                      $signed((|wire39))}) ^~ $signed(reg42));
              reg45 <= $unsigned($signed((~|$unsigned($unsigned(wire39)))));
            end
          if (wire40)
            begin
              reg46 <= wire38[(2'h3):(1'h0)];
              reg47 <= $unsigned($signed((8'ha0)));
              reg48 <= reg46[(4'hf):(3'h5)];
            end
          else
            begin
              reg46 <= ({$unsigned(reg46), (^~wire40)} && reg43[(2'h3):(2'h3)]);
              reg47 <= reg46;
              reg48 <= (((8'h9d) ?
                  (((reg47 ? wire36 : reg43) ?
                      (8'hb7) : (reg47 ?
                          (8'hb7) : (8'hb9))) ^ (|$signed((8'ha0)))) : reg42) ^ $signed((+$unsigned((wire36 ?
                  reg42 : reg43)))));
            end
        end
      else
        begin
          reg41 <= wire39[(3'h7):(1'h1)];
          reg42 <= $unsigned((((|wire40) ?
                  $unsigned(reg47) : ((reg44 ? reg44 : reg44) ?
                      (reg48 >= reg42) : (reg42 ? reg44 : reg42))) ?
              ($signed($unsigned(reg46)) ?
                  wire36 : $unsigned({reg44})) : ((^reg45) || ($unsigned(wire39) ~^ (8'h9f)))));
          reg43 <= $unsigned(wire36[(1'h0):(1'h0)]);
        end
      reg49 <= wire40[(5'h14):(4'hf)];
    end
  always
    @(posedge clk) begin
      reg50 <= reg43[(4'hb):(3'h7)];
      reg51 <= $unsigned(wire36);
      reg52 <= ($unsigned((~$signed((reg43 ? wire38 : reg43)))) ?
          reg48[(3'h4):(2'h3)] : ((($signed(wire39) * $unsigned(wire39)) | $signed(reg50[(2'h2):(1'h1)])) ?
              wire37[(4'h9):(2'h2)] : (+$signed((^~wire39)))));
      if ((~$unsigned(((reg50[(2'h2):(2'h2)] || (wire39 ?
          reg41 : reg42)) && (+$signed(reg42))))))
        begin
          if ((($signed($signed((reg44 ? wire37 : wire38))) ?
              ($signed($signed(wire37)) ?
                  reg44 : reg47) : (wire40[(4'hd):(4'hb)] ?
                  ($signed(reg47) ?
                      (-reg42) : reg48[(2'h3):(1'h1)]) : ($unsigned(reg52) + {reg50}))) * $unsigned($signed((+{wire36})))))
            begin
              reg53 <= reg43;
              reg54 <= reg50;
              reg55 <= {wire40[(5'h11):(4'hd)],
                  ($unsigned($unsigned((8'hb7))) ^~ ((~|(-wire39)) ?
                      ((8'hb2) || (8'hb0)) : reg51[(1'h0):(1'h0)]))};
            end
          else
            begin
              reg53 <= wire40;
              reg54 <= {(+{($unsigned(wire40) & wire40[(5'h10):(4'hd)]),
                      (-$signed(reg46))}),
                  {reg51}};
              reg55 <= ((~|(~|reg54)) + $unsigned((8'hae)));
              reg56 <= (!($signed($unsigned($unsigned(wire39))) - $unsigned(((reg42 ?
                      reg51 : reg52) ?
                  (~|reg44) : $signed(reg41)))));
            end
          reg57 <= reg42;
        end
      else
        begin
          reg53 <= ((reg57 ? wire39 : (&$unsigned((&reg53)))) ?
              $unsigned(reg47) : ((reg49[(3'h7):(3'h5)] ?
                      $unsigned($signed((8'ha1))) : reg45) ?
                  (|reg56[(4'h9):(2'h3)]) : {reg48[(3'h5):(3'h5)]}));
          reg54 <= reg54[(3'h4):(2'h2)];
        end
      if (reg43)
        begin
          if (($signed((8'hba)) ?
              (({reg48} > reg56) && reg52) : (wire40 ?
                  $unsigned(reg50) : wire36)))
            begin
              reg58 <= $unsigned(((&$unsigned((8'hab))) == reg46));
              reg59 <= ((8'hb9) + ((~$unsigned((wire39 ? reg45 : (8'ha3)))) ?
                  (^(+reg58[(5'h12):(3'h6)])) : ((~reg46[(4'h8):(4'h8)]) ?
                      $signed(((8'ha0) && wire40)) : (reg54 || (wire38 ?
                          reg54 : reg53)))));
            end
          else
            begin
              reg58 <= reg50[(2'h2):(1'h0)];
              reg59 <= $signed($unsigned({reg48}));
              reg60 <= (-{(!{(wire37 ? reg49 : reg56), wire37})});
              reg61 <= ((~^{(|(!reg53))}) | $signed((&$signed((reg56 ?
                  reg44 : (8'hb4))))));
            end
        end
      else
        begin
          reg58 <= (~^$unsigned(($unsigned((reg46 ? reg57 : reg47)) ?
              reg46[(3'h7):(3'h7)] : ($unsigned((8'hb9)) | (reg57 ?
                  wire40 : wire36)))));
          reg59 <= (&{reg41[(2'h2):(1'h0)], reg41[(4'hb):(4'h9)]});
          reg60 <= ($unsigned($unsigned((!$signed(reg53)))) ?
              {(8'hb6)} : (((-$unsigned(wire36)) ?
                  ($unsigned(wire36) ?
                      (wire39 ? reg48 : reg49) : (reg55 ?
                          reg50 : reg60)) : $unsigned(reg51[(4'h9):(3'h6)])) ^ (((^reg61) ?
                      {reg42, (8'hb2)} : $signed(reg44)) ?
                  $signed(((8'h9c) ? wire38 : reg58)) : reg45[(3'h5):(1'h1)])));
          reg61 <= (8'hae);
        end
    end
  assign wire62 = reg46;
  assign wire63 = (((|((~|reg43) ? reg53 : (reg57 ? wire62 : wire37))) ?
                      (reg60[(4'hf):(3'h7)] ?
                          {$signed(wire36),
                              {reg45,
                                  reg50}} : reg60) : ((8'had) <= $unsigned($unsigned(reg55)))) || (~&$unsigned((~(wire37 ^ reg44)))));
  assign wire64 = ((^{reg48[(4'hc):(1'h1)], wire62}) ^~ $unsigned(reg47));
  assign wire65 = wire62;
  assign wire66 = $signed(reg52[(5'h11):(2'h2)]);
  assign wire67 = {((8'ha1) ? reg53[(2'h3):(2'h3)] : $unsigned(reg52))};
  assign wire68 = reg44[(3'h5):(2'h3)];
  assign wire69 = $signed(reg49[(3'h4):(1'h1)]);
  assign wire70 = ($signed((reg43 ?
                      reg45 : {$signed((8'ha8))})) >>> wire68[(2'h2):(1'h0)]);
  assign wire71 = $unsigned($signed(reg43[(3'h5):(3'h5)]));
  assign wire72 = (~|reg46);
  assign wire73 = (reg44[(4'hb):(3'h4)] + $signed({$signed(reg53)}));
  assign wire74 = $unsigned(wire70);
  assign wire75 = reg47;
  assign wire76 = (($unsigned(wire74[(4'hf):(2'h3)]) ?
                      (~|({(8'hbb), wire38} ?
                          $unsigned(reg55) : $unsigned(reg46))) : reg47) * (($unsigned(((8'hb0) ?
                      reg56 : (8'hbc))) <<< (~^reg53[(2'h3):(2'h3)])) ~^ $unsigned(wire75)));
endmodule
