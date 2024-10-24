module top
#(parameter param156 = (({(((8'hbd) <<< (8'hb0)) ? ((8'hb0) + (8'ha1)) : ((8'hbe) ^ (8'hae)))} << {(((7'h40) ? (8'hbf) : (8'had)) >= ((8'haf) > (7'h44)))}) ~^ ((({(8'hb1)} ? ((8'hbc) == (8'ha5)) : {(8'hae), (8'ha1)}) ^~ ((~&(8'hbc)) ? ((8'h9d) ? (8'haf) : (8'hba)) : ((8'ha7) ? (8'hab) : (8'ha4)))) | ((((8'h9f) >> (8'hbb)) > (~^(8'hbb))) ? (((8'hba) >= (8'haa)) ? ((8'h9c) && (7'h42)) : {(7'h43), (7'h42)}) : {((8'h9e) <= (8'ha7))}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h231):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  wire signed [(4'hb):(1'h0)] wire155;
  wire [(5'h14):(1'h0)] wire154;
  wire [(2'h2):(1'h0)] wire153;
  wire [(3'h7):(1'h0)] wire152;
  wire signed [(5'h14):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire109;
  reg [(4'he):(1'h0)] reg151 = (1'h0);
  reg [(5'h11):(1'h0)] reg150 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg149 = (1'h0);
  reg [(2'h3):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg147 = (1'h0);
  reg [(3'h4):(1'h0)] reg146 = (1'h0);
  reg [(5'h10):(1'h0)] reg145 = (1'h0);
  reg [(4'h8):(1'h0)] reg144 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg141 = (1'h0);
  reg [(4'hf):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg137 = (1'h0);
  reg [(4'hf):(1'h0)] reg136 = (1'h0);
  reg [(4'h9):(1'h0)] reg135 = (1'h0);
  reg [(4'he):(1'h0)] reg134 = (1'h0);
  reg [(4'hd):(1'h0)] reg133 = (1'h0);
  reg [(3'h6):(1'h0)] reg132 = (1'h0);
  reg [(5'h11):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg130 = (1'h0);
  reg [(4'h8):(1'h0)] reg129 = (1'h0);
  reg [(5'h12):(1'h0)] reg128 = (1'h0);
  reg [(5'h13):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg126 = (1'h0);
  reg [(3'h7):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg124 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg [(4'hd):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg119 = (1'h0);
  reg [(4'hb):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg117 = (1'h0);
  reg signed [(4'he):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg115 = (1'h0);
  reg [(4'h8):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg111 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire109,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
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
                 (1'h0)};
  assign wire4 = $unsigned($unsigned($unsigned((+(wire2 ? wire0 : (8'hb2))))));
  assign wire5 = {(((&(wire1 ? wire3 : (8'hab))) ?
                         $unsigned((+wire2)) : $signed((~|wire3))) <= ($unsigned($signed(wire3)) ?
                         {wire3[(4'ha):(2'h2)]} : wire3))};
  assign wire6 = $unsigned(((~((wire1 | wire3) + $signed(wire5))) ?
                     wire5[(2'h2):(1'h1)] : {wire0}));
  assign wire7 = ((-(~($signed(wire6) ?
                     (-(7'h42)) : $signed(wire4)))) << wire5);
  module8 #() modinst110 (wire109, clk, wire7, wire4, wire3, wire5, wire1);
  always
    @(posedge clk) begin
      reg111 <= (+($signed($signed($signed(wire7))) ?
          wire2[(4'h9):(3'h7)] : $unsigned($unsigned($unsigned(wire2)))));
      reg112 <= wire109[(1'h0):(1'h0)];
      if (($signed(wire109[(1'h1):(1'h1)]) - wire2))
        begin
          reg113 <= $signed((^(wire4[(4'h9):(1'h1)] != (((7'h40) != wire0) == wire5[(4'h9):(4'h9)]))));
          reg114 <= $unsigned({wire109});
        end
      else
        begin
          if ((reg113 ^~ wire0[(1'h1):(1'h1)]))
            begin
              reg113 <= (wire2 & $signed(($unsigned($signed(wire7)) ?
                  wire0[(2'h3):(2'h2)] : (^$signed(wire4)))));
              reg114 <= (!wire109);
              reg115 <= wire1;
              reg116 <= (({$unsigned($signed(wire1)),
                          ((wire1 ? reg113 : reg112) ?
                              reg113[(2'h3):(1'h0)] : ((8'h9e) ?
                                  wire3 : wire109))} ?
                      ($unsigned((~&wire4)) ?
                          wire5[(4'h8):(4'h8)] : (~|reg114[(3'h4):(1'h0)])) : $unsigned((^~$signed(reg114)))) ?
                  (|(wire6 + (8'hbf))) : (wire109[(2'h2):(1'h1)] ?
                      (($unsigned(wire5) ~^ (wire7 ?
                          wire0 : wire3)) ^~ $signed((wire4 <<< wire0))) : wire7[(1'h1):(1'h0)]));
            end
          else
            begin
              reg113 <= $signed($unsigned($unsigned($unsigned((!wire3)))));
              reg114 <= $signed(reg112[(4'h9):(3'h7)]);
              reg115 <= (^~$unsigned(wire3));
            end
          reg117 <= ((~^{wire4[(4'hb):(4'h8)]}) << $unsigned($unsigned(reg112[(3'h6):(1'h1)])));
          reg118 <= $signed(reg114[(1'h0):(1'h0)]);
          reg119 <= $unsigned((^~reg112));
          reg120 <= reg115;
        end
      reg121 <= {$unsigned((wire1 >>> (&(~&(8'hb0)))))};
      reg122 <= ((!(reg121[(2'h2):(2'h2)] != (~&(wire4 & reg114)))) ?
          ({($unsigned((8'hbf)) && (8'had)),
              {(^~wire3),
                  reg119}} ^ wire0) : ($unsigned(reg118[(1'h0):(1'h0)]) | $unsigned($signed(wire6[(5'h11):(3'h6)]))));
    end
  always
    @(posedge clk) begin
      if ($signed(wire6[(1'h0):(1'h0)]))
        begin
          if (reg113)
            begin
              reg123 <= reg113[(3'h4):(2'h2)];
            end
          else
            begin
              reg123 <= $unsigned(($signed(wire4[(5'h14):(3'h5)]) ?
                  ((^reg121[(3'h5):(3'h5)]) || (wire7 ?
                      $unsigned(reg123) : (reg118 >> (8'hba)))) : wire2));
              reg124 <= $unsigned($unsigned((reg114 - (reg112[(4'hd):(2'h3)] ~^ $signed(wire109)))));
              reg125 <= $unsigned($signed({((reg123 & wire109) ?
                      (wire1 ? reg111 : (8'h9f)) : (-reg124)),
                  $signed((reg122 ? reg116 : reg122))}));
              reg126 <= reg113[(2'h2):(1'h0)];
            end
        end
      else
        begin
          reg123 <= reg126[(3'h7):(3'h5)];
          reg124 <= $unsigned(($unsigned(reg118[(3'h6):(2'h3)]) <<< (!$unsigned((reg119 <<< reg124)))));
          reg125 <= wire6[(2'h2):(1'h0)];
          if (reg119)
            begin
              reg126 <= ($unsigned($signed((!reg116))) ?
                  $signed($unsigned((~^(wire0 ?
                      reg125 : wire2)))) : $signed(($signed($unsigned(wire3)) ^~ $unsigned($unsigned(wire2)))));
              reg127 <= ((|{{(reg121 << wire3)},
                  $unsigned((~^wire5))}) < $unsigned(($unsigned($unsigned(reg116)) | (8'hae))));
              reg128 <= (~&(($signed(reg126) | $unsigned($signed(reg125))) ^~ (~&(8'hb0))));
            end
          else
            begin
              reg126 <= reg115;
              reg127 <= {{$unsigned({((8'hbe) ? reg124 : wire109)})},
                  (&(8'hab))};
              reg128 <= $signed((reg123 ^~ reg118));
            end
          reg129 <= {$signed({$unsigned((reg113 >> reg122))})};
        end
      if (reg127[(1'h0):(1'h0)])
        begin
          if ((~|reg121[(3'h4):(2'h2)]))
            begin
              reg130 <= (8'hb4);
              reg131 <= (($signed((~&((8'h9f) ? reg127 : reg128))) ?
                  ((reg111[(3'h4):(2'h2)] >= reg119[(1'h1):(1'h0)]) ?
                      {(^wire2),
                          {reg118}} : $unsigned(reg115[(3'h5):(3'h4)])) : (~|reg118)) ^ (reg123 ?
                  $unsigned(reg121) : $signed(wire3[(3'h5):(3'h5)])));
            end
          else
            begin
              reg130 <= ($signed(($unsigned($unsigned((8'ha8))) ^~ wire6)) ?
                  reg111 : $unsigned($unsigned(((^~wire4) * $signed(reg118)))));
            end
        end
      else
        begin
          if ($unsigned(((~^{(~^reg128),
              ((8'hae) ?
                  (8'haa) : (8'hb8))}) + $signed($signed(wire5[(5'h10):(4'ha)])))))
            begin
              reg130 <= (((reg113[(2'h2):(1'h0)] << $signed((&reg121))) <<< ({(|reg116),
                  (8'hb6)} >>> (^(!reg127)))) >= ((^wire1[(2'h3):(1'h1)]) ?
                  $signed((8'haf)) : wire1));
              reg131 <= ((reg123[(4'h9):(2'h3)] <<< ((^reg111) >= $signed($unsigned(reg125)))) ?
                  ($unsigned(reg127[(1'h0):(1'h0)]) ?
                      wire3 : (reg129[(2'h2):(1'h1)] - ($signed((7'h41)) - reg121[(2'h3):(2'h3)]))) : (reg119[(3'h4):(1'h0)] ?
                      ({(7'h41), reg119} ?
                          (~|reg127[(4'hb):(4'ha)]) : $signed((reg129 == reg124))) : (((reg129 ?
                              reg122 : wire109) ?
                          (^~reg115) : ((8'hb2) ?
                              reg126 : reg124)) <= $unsigned($signed(reg119)))));
              reg132 <= reg130;
              reg133 <= reg112[(1'h0):(1'h0)];
              reg134 <= (reg114 ?
                  (+$unsigned(($signed(reg118) ?
                      $unsigned(reg126) : (-reg117)))) : $signed({((8'hb7) | (reg130 ?
                          reg123 : reg112)),
                      ($signed(wire5) & (reg130 | reg119))}));
            end
          else
            begin
              reg130 <= (reg115 && wire109[(2'h3):(1'h0)]);
            end
          reg135 <= (($unsigned(reg113) ? reg111 : wire3) ?
              $unsigned($unsigned(($unsigned(reg128) ?
                  $signed(reg116) : ((8'ha3) ?
                      wire5 : reg125)))) : (|wire7[(3'h7):(2'h3)]));
        end
      if ($signed({{$unsigned((reg111 >= reg112))}}))
        begin
          reg136 <= $unsigned(((-(|reg133)) ? (8'hb9) : $unsigned(reg135)));
          if ($unsigned(((reg112 | $unsigned(reg113)) ?
              reg132[(3'h4):(2'h3)] : {reg131})))
            begin
              reg137 <= $signed((!(8'hb0)));
              reg138 <= (reg128[(4'h9):(4'h8)] >= (^$unsigned($signed(((8'had) + reg118)))));
              reg139 <= $unsigned($unsigned({wire2}));
            end
          else
            begin
              reg137 <= (reg133 ?
                  (^~($unsigned($unsigned(reg126)) ?
                      (|(reg139 >>> (8'hac))) : ({reg131,
                          wire0} || (8'h9d)))) : ($signed(reg124) == $unsigned({$signed(reg128),
                      reg122[(4'ha):(1'h1)]})));
              reg138 <= reg123;
              reg139 <= reg128;
            end
          reg140 <= (((wire5 * (~|$signed(reg137))) ?
              reg122 : (^~((reg111 ?
                  reg121 : reg132) - reg129))) ^ $signed(reg128[(4'he):(1'h1)]));
        end
      else
        begin
          if ($signed($signed(reg134)))
            begin
              reg136 <= (wire5[(4'hb):(1'h0)] ^~ (reg121 ?
                  (+$signed(reg128)) : $signed((~^(reg134 ?
                      (8'haf) : reg134)))));
              reg137 <= reg135;
              reg138 <= reg115[(3'h4):(1'h0)];
            end
          else
            begin
              reg136 <= reg134;
            end
          reg139 <= ((reg116[(4'ha):(2'h3)] <= reg129[(3'h7):(2'h3)]) < ((((reg137 >>> reg129) ?
                      (8'hb1) : $signed(reg134)) ?
                  (reg127[(4'hd):(4'h9)] <= {reg123}) : reg122) ?
              $unsigned($signed((reg134 ?
                  reg140 : wire2))) : reg130[(1'h1):(1'h0)]));
          if (wire7[(4'ha):(3'h4)])
            begin
              reg140 <= $unsigned((($signed($unsigned(reg139)) ?
                      reg113 : (~^{wire6, reg117})) ?
                  (|reg121) : $signed(reg137)));
              reg141 <= ($signed(reg133[(2'h3):(2'h3)]) ?
                  (8'hac) : {reg119[(3'h4):(2'h3)]});
              reg142 <= $unsigned((wire1 ?
                  ({reg112[(2'h2):(2'h2)],
                      (reg122 ? reg130 : (7'h44))} + (wire3[(4'h9):(3'h4)] ?
                      $signed(reg124) : (^reg139))) : $unsigned(({reg136} * $unsigned(wire1)))));
              reg143 <= reg116[(4'hd):(2'h2)];
              reg144 <= {(~reg127[(3'h5):(3'h4)]),
                  (((8'hb4) ?
                          (reg117 ~^ $unsigned(reg120)) : $unsigned(reg123[(2'h2):(1'h1)])) ?
                      (reg137 * {(reg138 <<< (8'hbf)),
                          $signed((8'hac))}) : $signed(reg111))};
            end
          else
            begin
              reg140 <= (reg112[(3'h6):(2'h2)] ? reg119 : (8'hb8));
              reg141 <= {((reg133 - ((wire2 < reg129) && (reg123 ^ (8'h9f)))) ?
                      (reg142[(3'h4):(1'h0)] ?
                          ($unsigned(reg113) >> reg122[(3'h6):(3'h4)]) : ((~reg135) ?
                              $signed(reg134) : $signed(reg137))) : reg140),
                  $signed((|(~|((8'h9f) != (8'hb2)))))};
              reg142 <= (|(~^$unsigned(reg141)));
            end
          if ($unsigned(reg127[(4'he):(4'ha)]))
            begin
              reg145 <= ((($signed($unsigned((8'ha8))) ?
                      $unsigned(wire109) : reg126[(4'h9):(3'h4)]) <<< reg137[(1'h0):(1'h0)]) ?
                  (~wire2) : $signed((reg122 <<< reg137[(1'h1):(1'h1)])));
              reg146 <= ($unsigned(reg135) <= (^$unsigned($signed((+reg143)))));
              reg147 <= $unsigned((~&reg140[(2'h2):(1'h1)]));
              reg148 <= ($unsigned($unsigned(((wire109 >> reg145) >= (reg117 >> reg139)))) ?
                  ((~^{$signed(reg126)}) <<< (-$signed(reg126[(4'ha):(4'h9)]))) : ((reg123[(2'h2):(1'h0)] ?
                      (8'hb3) : $signed(reg127)) | ($signed($signed(reg141)) ?
                      (|reg140[(4'hb):(3'h4)]) : ($unsigned(reg142) ?
                          {reg136} : (!wire7)))));
              reg149 <= $signed((~^$signed(($unsigned(reg145) << $unsigned(reg124)))));
            end
          else
            begin
              reg145 <= (~reg123[(3'h5):(3'h5)]);
              reg146 <= reg137[(1'h0):(1'h0)];
              reg147 <= (reg123 + (~&reg145[(4'hc):(1'h1)]));
              reg148 <= (^~$unsigned((+{(~reg133)})));
            end
        end
      reg150 <= {wire7[(3'h4):(1'h1)],
          ({((reg135 < (8'hb6)) == (reg134 ? reg143 : (7'h43)))} >>> reg148)};
      reg151 <= reg114;
    end
  assign wire152 = $unsigned(({(^reg145)} ?
                       ($signed((reg131 ?
                           reg141 : reg144)) - $unsigned((-reg120))) : $signed((!reg146[(1'h1):(1'h1)]))));
  assign wire153 = (reg136 < (~|(&((~^(8'ha6)) ? $unsigned(reg145) : reg143))));
  assign wire154 = ((~$signed(reg112)) << reg151);
  assign wire155 = reg143;
endmodule

module module8
#(parameter param107 = {((~&((~|(7'h43)) ^~ {(8'hbb)})) ? ((-(~|(8'haf))) <= (((8'ha0) << (8'hbd)) != (~^(7'h42)))) : ((~(!(8'hb4))) ? (^~((7'h40) >>> (8'hb6))) : (~|((8'h9c) >>> (8'hb7)))))}, 
parameter param108 = {(((7'h44) ? ({param107, param107} ? (+param107) : (param107 ? param107 : param107)) : {(|(8'hbf)), {param107}}) >= (^~{{param107, param107}})), param107})
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire12;
  input wire signed [(2'h3):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire signed [(4'ha):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire106;
  wire [(5'h11):(1'h0)] wire105;
  wire [(4'he):(1'h0)] wire89;
  wire [(4'h9):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire14;
  reg signed [(3'h7):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg97 = (1'h0);
  reg [(4'h8):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg93 = (1'h0);
  reg [(5'h10):(1'h0)] reg92 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire89,
                 wire15,
                 wire14,
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
                 (1'h0)};
  assign wire14 = wire9;
  assign wire15 = $unsigned({(wire12[(4'ha):(1'h0)] > $unsigned($unsigned(wire11))),
                      wire12[(4'hf):(1'h1)]});
  module16 #() modinst90 (wire89, clk, wire11, wire10, wire15, wire9);
  always
    @(posedge clk) begin
      reg91 <= $unsigned((+wire10[(4'hb):(1'h0)]));
      if ($unsigned(($unsigned(wire11) ?
          (!wire11[(2'h3):(1'h1)]) : (^~(!wire13[(4'h9):(2'h3)])))))
        begin
          reg92 <= (!$unsigned(($unsigned($unsigned(wire12)) ?
              (8'haf) : ($signed(wire13) | wire89))));
          if ($signed(wire89[(1'h0):(1'h0)]))
            begin
              reg93 <= wire10[(2'h2):(2'h2)];
              reg94 <= wire11;
              reg95 <= (reg92[(2'h2):(1'h1)] ? wire11 : wire89);
              reg96 <= {wire9[(2'h2):(1'h1)]};
              reg97 <= $signed((reg93 == wire9));
            end
          else
            begin
              reg93 <= {{$unsigned(wire89)},
                  ($unsigned((-(!wire12))) <= wire13[(4'ha):(1'h1)])};
              reg94 <= $signed((~|wire9[(3'h7):(3'h4)]));
            end
          reg98 <= (reg93 ?
              wire11[(1'h1):(1'h0)] : $signed({(~^(wire12 ^~ reg97)),
                  reg96[(1'h1):(1'h0)]}));
          reg99 <= {wire10};
          if (wire10[(3'h5):(1'h1)])
            begin
              reg100 <= wire10[(3'h7):(3'h4)];
              reg101 <= wire10[(4'ha):(3'h6)];
              reg102 <= ({$signed(((wire11 ? reg96 : wire12) | (~|reg91))),
                  wire11} != {((wire11 * {wire15}) ?
                      {(wire15 ^~ reg99),
                          reg98[(4'ha):(4'h9)]} : ($unsigned(wire14) <= reg99))});
              reg103 <= wire12;
            end
          else
            begin
              reg100 <= $signed({(^$unsigned($unsigned(reg92))), (!wire15)});
              reg101 <= $unsigned(reg98);
              reg102 <= (wire15 ?
                  (~|(reg96[(4'h8):(4'h8)] ?
                      $unsigned(reg101) : {reg102[(1'h1):(1'h0)],
                          (~reg95)})) : wire11);
              reg103 <= {reg93[(3'h5):(2'h3)], {(8'ha3)}};
            end
        end
      else
        begin
          reg92 <= reg99[(3'h6):(1'h0)];
          if (reg102[(1'h0):(1'h0)])
            begin
              reg93 <= reg99;
              reg94 <= ((~^(^($unsigned(reg98) * $unsigned(reg98)))) ?
                  {($unsigned($unsigned((8'hab))) ?
                          (-(^wire15)) : {reg96, (reg101 ~^ reg96)}),
                      (($signed(reg100) <= (reg103 + reg99)) ?
                          reg99[(3'h7):(2'h3)] : $unsigned($unsigned(reg98)))} : ({($signed(reg103) != (~&(8'hac)))} != (8'ha2)));
              reg95 <= (+({$signed($unsigned(reg99))} << (wire10[(2'h2):(1'h0)] - wire11[(1'h1):(1'h0)])));
              reg96 <= {$signed($unsigned($unsigned(((8'h9c) | reg99)))),
                  reg96};
              reg97 <= (^(($unsigned($signed(reg96)) >> $unsigned(reg98[(4'hc):(3'h7)])) > (+wire12)));
            end
          else
            begin
              reg93 <= reg97;
              reg94 <= reg91;
              reg95 <= wire10[(1'h1):(1'h0)];
            end
          reg98 <= wire10;
          reg99 <= ($unsigned((|wire10[(4'hf):(4'he)])) & (~&reg94));
          reg100 <= $signed($unsigned(reg102[(1'h1):(1'h1)]));
        end
      reg104 <= reg97;
    end
  assign wire105 = ($unsigned($unsigned((!reg100[(5'h11):(4'h8)]))) ?
                       ((reg91 | $unsigned($unsigned(reg91))) ?
                           ($signed(reg101) ?
                               $signed($unsigned(reg98)) : (reg93[(1'h0):(1'h0)] ?
                                   (!reg101) : (~reg91))) : wire15[(1'h0):(1'h0)]) : ($unsigned(reg94[(4'he):(4'h9)]) > (-reg102[(1'h1):(1'h0)])));
  assign wire106 = $signed($unsigned($unsigned(((reg100 ?
                       reg103 : (8'ha0)) != (+wire10)))));
endmodule

module module16
#(parameter param87 = (~|(((((8'had) - (8'hb4)) & ((7'h43) ? (7'h43) : (8'hb6))) < (^((7'h42) ? (8'hac) : (8'hb6)))) ? ((+(~&(8'had))) ? (~^(~|(8'hbc))) : (((8'haf) | (8'ha5)) ? (&(8'ha3)) : (8'hbd))) : (~^(!{(8'ha5)})))), 
parameter param88 = (param87 + ({{(param87 ? param87 : param87)}} ^ (param87 ? param87 : param87))))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h2f8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire20;
  input wire signed [(4'ha):(1'h0)] wire19;
  input wire [(4'h9):(1'h0)] wire18;
  input wire [(4'ha):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire86;
  wire [(3'h5):(1'h0)] wire69;
  wire signed [(5'h15):(1'h0)] wire68;
  wire signed [(5'h14):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire46;
  wire signed [(3'h7):(1'h0)] wire45;
  wire [(5'h11):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire21;
  reg signed [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  assign y = {wire86,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
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
                 reg71,
                 reg70,
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
                 reg49,
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
                 (1'h0)};
  assign wire21 = $signed({wire17[(4'h8):(4'h8)], wire20});
  assign wire22 = {($signed(((wire20 ? wire21 : wire17) == (8'hb3))) ?
                          wire17[(3'h6):(3'h5)] : ((-$unsigned(wire19)) << $unsigned({wire18,
                              (8'hb9)}))),
                      ((wire20[(1'h0):(1'h0)] ?
                              (wire21[(4'ha):(2'h3)] ?
                                  ((8'hb7) >= wire20) : (wire18 ?
                                      wire19 : wire21)) : (~&(~wire20))) ?
                          wire18 : wire17[(4'ha):(3'h6)])};
  assign wire23 = wire20;
  assign wire24 = (~^{$unsigned(wire21[(2'h3):(2'h2)]),
                      $unsigned($signed((^wire19)))});
  assign wire25 = (+(wire17[(3'h6):(2'h2)] >> ($signed((~wire21)) ?
                      {(wire20 != wire22), {wire22}} : ((wire17 + wire19) ?
                          (wire24 >> wire18) : wire22))));
  assign wire26 = wire17;
  always
    @(posedge clk) begin
      reg27 <= $signed(wire24);
      if (wire26)
        begin
          reg28 <= (($signed({(wire25 > wire20)}) << (wire21 ~^ wire17[(3'h7):(2'h3)])) >> {((~{(7'h40),
                      wire18}) ?
                  ((~&wire25) ? (~wire26) : wire17[(1'h1):(1'h0)]) : {wire26,
                      $signed(wire22)}),
              (~|($signed(wire25) & (^wire24)))});
          reg29 <= ({((wire18[(2'h3):(1'h1)] ?
                      wire17[(4'h8):(3'h5)] : reg27[(4'hc):(3'h6)]) ?
                  (!((8'ha6) < (8'ha8))) : ((reg28 ?
                      wire18 : wire20) - wire26[(3'h6):(3'h4)]))} != (~&$unsigned(($unsigned(wire21) ?
              wire21 : reg27))));
        end
      else
        begin
          if (wire17)
            begin
              reg28 <= {(((|{reg29}) ?
                          wire19[(3'h7):(3'h5)] : ($signed(wire26) * $unsigned(wire18))) ?
                      $signed($signed((reg28 ?
                          reg29 : wire18))) : $unsigned({{wire19}, wire23})),
                  (wire21 ?
                      wire17 : $signed(((!(8'hb4)) ~^ reg29[(3'h5):(3'h5)])))};
              reg29 <= $signed(wire17);
              reg30 <= wire19;
            end
          else
            begin
              reg28 <= $unsigned(wire20[(2'h2):(1'h0)]);
              reg29 <= $unsigned(reg28);
              reg30 <= $unsigned((8'hb4));
              reg31 <= (^$unsigned((wire24 ?
                  $unsigned({wire19, wire22}) : $signed((wire17 > reg28)))));
            end
        end
      reg32 <= $unsigned((-({$signed(reg28)} ?
          ($unsigned(reg29) ? (reg28 ? wire22 : wire20) : wire22) : (wire20 ?
              reg28 : (wire25 ? (8'hb3) : wire26)))));
      if ((~^reg30[(1'h1):(1'h1)]))
        begin
          reg33 <= $unsigned(wire23[(4'h8):(3'h4)]);
          reg34 <= $unsigned(wire24);
          if (wire24[(1'h1):(1'h0)])
            begin
              reg35 <= $signed(reg27);
            end
          else
            begin
              reg35 <= reg30;
              reg36 <= wire21;
            end
          reg37 <= (-(-{reg28[(1'h0):(1'h0)]}));
        end
      else
        begin
          if (wire25)
            begin
              reg33 <= {$unsigned((wire18[(1'h1):(1'h0)] + (+$unsigned(wire18))))};
              reg34 <= wire17;
              reg35 <= (reg36 >>> {($unsigned((|reg30)) + reg36),
                  (wire18[(1'h0):(1'h0)] ?
                      (~&$unsigned(wire25)) : ($unsigned(reg34) ?
                          {reg34, reg34} : $unsigned(wire18)))});
              reg36 <= (&reg28[(1'h0):(1'h0)]);
            end
          else
            begin
              reg33 <= reg29;
              reg34 <= (~^((~reg27[(2'h2):(2'h2)]) + reg36));
              reg35 <= (($unsigned($unsigned({reg36, reg28})) ?
                  (({reg36, reg29} + $unsigned(wire25)) ?
                      (~wire19) : ((^~wire17) ?
                          (8'h9f) : (wire26 >> reg27))) : (~|reg34)) <= $unsigned($signed(wire17)));
              reg36 <= ({((~$unsigned(reg36)) >= (~^$unsigned(reg29)))} ?
                  (reg36[(4'h9):(3'h6)] & (^$signed(reg27))) : {(wire22[(2'h2):(2'h2)] ^ ($unsigned(wire21) == (+wire23)))});
            end
          reg37 <= (!reg27);
          if (({$unsigned(reg37), (~|reg30)} ?
              (($unsigned($signed(wire21)) ?
                  ((!wire19) << reg29[(1'h1):(1'h1)]) : $signed($signed((8'h9f)))) && reg33[(3'h4):(2'h3)]) : ((((wire24 ?
                      wire25 : reg34) ?
                  (reg28 >= reg32) : (reg37 ^ (8'hb4))) + ($unsigned(reg35) < wire24[(1'h0):(1'h0)])) >= (reg30 ?
                  $signed($signed(reg32)) : ({wire23} ?
                      $signed(wire26) : (~|wire20))))))
            begin
              reg38 <= $signed({(~^reg29[(3'h5):(2'h3)])});
              reg39 <= ($signed((~|reg34[(3'h7):(3'h5)])) == $unsigned({$unsigned({reg34})}));
              reg40 <= $unsigned(($signed($signed(wire23[(4'ha):(3'h5)])) && ((^~$signed(wire20)) ?
                  $unsigned((reg39 && wire25)) : wire25[(4'hf):(3'h4)])));
              reg41 <= $signed($signed($signed((~(+reg33)))));
              reg42 <= (8'hbb);
            end
          else
            begin
              reg38 <= (-$signed(wire19));
              reg39 <= $unsigned(reg35[(3'h5):(3'h4)]);
              reg40 <= ({(reg41 ?
                      (|$signed(wire25)) : ((~^reg41) < reg27[(4'h9):(3'h6)])),
                  $unsigned((reg36 ?
                      reg27[(4'h8):(3'h6)] : reg40))} ~^ reg32[(5'h13):(3'h5)]);
              reg41 <= $signed(((wire22[(3'h4):(2'h2)] ?
                      wire20 : $unsigned($signed(reg28))) ?
                  $unsigned($signed($unsigned((8'ha7)))) : $signed($unsigned(wire25[(1'h0):(1'h0)]))));
              reg42 <= reg42[(2'h2):(1'h1)];
            end
        end
    end
  assign wire43 = wire20[(1'h1):(1'h0)];
  assign wire44 = $signed(({({(8'hb5), reg31} ?
                          ((8'hb8) - reg31) : $unsigned((8'hb2)))} <= (8'hb2)));
  assign wire45 = $signed(($signed((~&$unsigned(wire26))) <= ($unsigned({(8'hb6)}) ?
                      reg42 : $signed($unsigned(reg27)))));
  assign wire46 = $signed(((!$unsigned($unsigned(reg37))) ^~ (!(reg42 ?
                      (reg42 ? wire19 : wire24) : (wire22 ? reg27 : reg29)))));
  assign wire47 = ($signed(((wire46[(1'h0):(1'h0)] ?
                          (+wire21) : ((8'ha9) ? wire20 : wire22)) ?
                      wire43[(4'hd):(4'hc)] : $signed($signed(wire23)))) << reg34[(2'h3):(1'h1)]);
  assign wire48 = wire21;
  always
    @(posedge clk) begin
      reg49 <= reg34;
      if ($signed((wire17 ?
          reg35[(3'h4):(1'h1)] : ($signed(((8'ha0) ?
              reg27 : reg30)) >>> wire17[(1'h1):(1'h1)]))))
        begin
          reg50 <= $signed($unsigned($unsigned(reg36[(3'h7):(3'h4)])));
        end
      else
        begin
          reg50 <= {$signed((reg50 * ((~(8'h9c)) ?
                  (wire43 ? (8'ha3) : wire25) : (~^reg39)))),
              reg50[(1'h0):(1'h0)]};
          if ((!(reg30 * {{$signed(reg40)},
              ((reg42 ? reg49 : reg36) <= {reg34})})))
            begin
              reg51 <= (~((wire20[(1'h1):(1'h0)] ?
                  ((reg38 | (8'hb3)) != $unsigned(reg40)) : $signed((!wire43))) ^~ $unsigned((~&(|reg32)))));
            end
          else
            begin
              reg51 <= {$signed((wire18 ?
                      ((wire20 ?
                          wire26 : wire26) && $unsigned((8'h9f))) : $unsigned($unsigned(reg35))))};
              reg52 <= $unsigned($signed(reg41[(3'h4):(3'h4)]));
              reg53 <= (~((^~{$signed(wire20), (reg37 && wire26)}) ?
                  reg52 : $signed($unsigned(reg35))));
            end
        end
      reg54 <= $signed(($unsigned(reg50) && (reg36 ?
          $unsigned(wire19) : (((8'h9d) ? wire24 : reg53) ?
              $signed(wire22) : wire25))));
      if ({(((|{wire48}) ?
              $signed((reg35 ?
                  wire44 : reg33)) : (((8'hb5) << reg54) >= wire43)) * (8'ha1))})
        begin
          if ($unsigned((8'ha0)))
            begin
              reg55 <= ((((8'ha3) ?
                  reg52[(4'hb):(4'hb)] : ($signed(reg41) ^ (reg30 ?
                      (8'hb2) : reg36))) << $unsigned(reg36)) >>> ((((reg52 == (7'h42)) ?
                          wire23 : $unsigned(reg36)) ?
                      wire21 : (7'h44)) ?
                  {reg35[(1'h0):(1'h0)]} : reg36));
              reg56 <= (wire26[(5'h11):(3'h4)] ?
                  $signed((^$signed((wire18 ?
                      reg35 : wire43)))) : reg39[(2'h2):(1'h0)]);
              reg57 <= wire19[(4'h9):(1'h1)];
              reg58 <= ($unsigned((wire46[(2'h3):(1'h1)] >> ((reg31 ?
                          reg29 : wire48) ?
                      (reg41 ? (8'ha0) : wire17) : $unsigned(wire46)))) ?
                  ($signed($unsigned(reg57[(1'h1):(1'h1)])) ?
                      reg37[(4'hf):(4'hb)] : ({wire22[(2'h2):(1'h0)],
                          reg52[(2'h2):(1'h1)]} ~^ (-(~|wire47)))) : wire18);
              reg59 <= $unsigned(((+(8'had)) ?
                  (^(&(reg36 ? reg56 : wire19))) : $signed($unsigned(((8'hba) ?
                      (8'hb6) : reg35)))));
            end
          else
            begin
              reg55 <= wire47;
              reg56 <= $signed($unsigned($unsigned($unsigned(((8'ha1) + wire17)))));
              reg57 <= reg50;
              reg58 <= ($unsigned($unsigned(reg58)) ?
                  {$signed(reg49[(3'h5):(2'h2)])} : $signed(($unsigned(reg37[(5'h10):(4'hd)]) != reg53[(1'h0):(1'h0)])));
            end
          reg60 <= (|wire20[(1'h0):(1'h0)]);
          if ((wire17[(3'h4):(2'h3)] ? wire25 : wire46[(1'h0):(1'h0)]))
            begin
              reg61 <= (~|(reg56 ?
                  wire22 : (&((reg58 ? wire24 : (8'hb9)) * (~&wire23)))));
              reg62 <= ((~&(reg56[(1'h1):(1'h0)] & reg51[(2'h3):(1'h0)])) >> (|reg52[(2'h2):(2'h2)]));
              reg63 <= $signed(($signed((~|$unsigned(reg50))) ^ wire47[(3'h7):(3'h4)]));
            end
          else
            begin
              reg61 <= (reg31[(5'h10):(5'h10)] ?
                  reg39 : (&(((7'h41) ?
                      (reg39 == wire45) : wire17) | reg30[(1'h0):(1'h0)])));
              reg62 <= ({$signed($signed({reg50}))} && $unsigned($signed((wire21 ?
                  (!reg29) : (reg31 != (8'hb4))))));
              reg63 <= $signed($unsigned((reg53 ? $signed(reg31) : wire47)));
              reg64 <= (|$unsigned(reg37[(3'h5):(2'h3)]));
            end
        end
      else
        begin
          reg55 <= ((|reg33) << reg53[(2'h3):(1'h0)]);
          reg56 <= (|(!($signed({reg63, reg57}) ?
              (^wire18[(2'h2):(2'h2)]) : (~&reg61[(3'h6):(2'h3)]))));
          reg57 <= wire48;
          reg58 <= (8'ha7);
        end
      reg65 <= wire48;
    end
  assign wire66 = $signed((|(^reg65)));
  assign wire67 = $unsigned((&$unsigned(((+reg62) ? (~reg42) : reg56))));
  assign wire68 = ((reg32[(5'h14):(4'hf)] != ({wire25,
                          (reg49 ~^ reg62)} && (~|$unsigned(reg34)))) ?
                      ($signed(((&wire67) == {(8'h9c), reg31})) ?
                          reg64[(3'h6):(3'h6)] : (reg61[(2'h2):(1'h0)] >> (wire19 + reg51))) : ((~$signed((~^wire45))) ?
                          ($unsigned((reg42 ? reg39 : reg64)) ?
                              reg34[(3'h7):(2'h3)] : wire20[(1'h1):(1'h1)]) : ((~&(7'h42)) ?
                              (wire45 | reg42[(3'h4):(2'h2)]) : $unsigned(wire44[(4'hf):(4'h8)]))));
  assign wire69 = ((^reg60) == $unsigned($signed($signed($signed(reg58)))));
  always
    @(posedge clk) begin
      if (wire21[(3'h6):(2'h2)])
        begin
          reg70 <= ($signed($signed(((wire23 ?
                  reg53 : wire68) & (wire45 && reg33)))) ?
              $unsigned({$signed(reg27[(1'h1):(1'h0)])}) : wire17[(1'h1):(1'h0)]);
          reg71 <= ((((((8'ha7) ~^ wire25) & reg30) ?
              $unsigned((reg54 << reg58)) : ((-(8'hb9)) ?
                  {reg33, wire24} : $unsigned(wire43))) ~^ (~|{$unsigned(reg49),
              (reg65 >> (8'hbd))})) | ((8'hbb) >>> reg41));
          reg72 <= (reg27 ?
              ((((8'ha1) ?
                  {wire47,
                      reg53} : $unsigned(reg55)) != (reg71[(2'h3):(2'h2)] ^~ $unsigned(reg41))) & ((+(!reg53)) & $unsigned((^~reg30)))) : $unsigned(wire68[(3'h7):(3'h6)]));
          if (reg55)
            begin
              reg73 <= reg50;
              reg74 <= {reg70, $signed(reg52[(4'he):(4'ha)])};
              reg75 <= reg50[(2'h3):(2'h2)];
            end
          else
            begin
              reg73 <= $signed(($signed(({wire45, reg27} ?
                      $unsigned(reg58) : (reg70 != reg58))) ?
                  ($unsigned((^~reg29)) ^ $signed(reg59[(4'h8):(2'h3)])) : reg42[(1'h0):(1'h0)]));
              reg74 <= (reg72[(3'h6):(2'h3)] + wire25[(4'hb):(4'ha)]);
            end
        end
      else
        begin
          reg70 <= reg73;
        end
      if ($unsigned(($signed(reg75[(4'h9):(1'h1)]) ?
          {reg42[(1'h1):(1'h1)]} : (($signed(reg58) ?
                  $signed((8'hbb)) : {reg42, wire20}) ?
              (reg54 << (-reg58)) : ((~^(8'ha5)) ?
                  (wire25 >>> reg39) : $unsigned(reg65))))))
        begin
          reg76 <= {$unsigned(reg64),
              ((($unsigned(reg39) ? reg35 : reg61[(3'h5):(3'h4)]) ?
                  (|(^~wire20)) : wire48) + reg58[(3'h5):(3'h4)])};
          if (wire46)
            begin
              reg77 <= wire46;
              reg78 <= $signed(wire19[(1'h1):(1'h0)]);
              reg79 <= reg37[(1'h1):(1'h1)];
            end
          else
            begin
              reg77 <= reg57;
              reg78 <= ($unsigned($signed($signed((reg57 >= (8'hac))))) == (-$signed(((|(8'h9f)) ?
                  (reg63 ? reg55 : reg53) : reg71))));
              reg79 <= ($unsigned(({$unsigned(wire19)} ?
                      $unsigned((reg57 ?
                          reg51 : reg63)) : $unsigned($signed(reg70)))) ?
                  reg74[(1'h1):(1'h0)] : $signed((+(8'hb2))));
              reg80 <= wire26;
            end
          reg81 <= $signed(reg78[(3'h5):(3'h4)]);
          reg82 <= $signed((~|($signed(reg79) >> (&$unsigned((8'ha5))))));
        end
      else
        begin
          if (reg42[(2'h3):(2'h2)])
            begin
              reg76 <= (8'hbc);
              reg77 <= (8'hbb);
            end
          else
            begin
              reg76 <= ($signed((((!(8'h9f)) ^ (reg55 & reg50)) >> (^~reg82))) ?
                  reg62[(1'h1):(1'h1)] : ((reg54[(1'h0):(1'h0)] ?
                          ($unsigned(reg56) >>> ((8'hb2) ?
                              reg49 : wire67)) : $unsigned(wire19[(4'h8):(3'h4)])) ?
                      {wire21[(4'hf):(4'hc)], reg33} : (-wire66)));
              reg77 <= reg27;
              reg78 <= $signed((^~$signed((wire25[(4'ha):(3'h7)] ?
                  $signed(reg61) : {reg50, reg56}))));
            end
          reg79 <= $signed(reg39[(4'ha):(3'h7)]);
        end
      reg83 <= (~|{reg42,
          (reg59 ? ((!wire67) + reg50[(1'h0):(1'h0)]) : reg33)});
      reg84 <= wire67;
      reg85 <= (|$unsigned(($unsigned(reg72[(3'h4):(3'h4)]) ~^ {$signed(reg74)})));
    end
  assign wire86 = ({{wire19[(4'ha):(4'h9)]},
                          (|((wire46 ? reg65 : reg38) > (reg84 | wire66)))} ?
                      $unsigned($signed(((wire26 ? reg30 : wire26) + (wire24 ?
                          reg72 : reg82)))) : ((reg54 != ((8'ha7) | (8'hb4))) ?
                          (~&$signed(wire17[(1'h0):(1'h0)])) : ((^reg54) << ((reg38 ?
                              wire43 : reg74) >> (~&wire67)))));
endmodule
