module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire178;
  wire signed [(3'h7):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  assign y = {wire178,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $signed($signed($unsigned($signed($unsigned(wire0)))));
  assign wire6 = wire3[(1'h0):(1'h0)];
  assign wire7 = {$unsigned(wire5)};
  assign wire8 = (({wire1[(4'hc):(1'h1)]} ?
                     (wire6[(4'hb):(3'h5)] ?
                         wire6[(5'h10):(4'ha)] : wire1) : wire2[(2'h2):(1'h1)]) == {(~&($unsigned(wire0) ?
                         (wire3 ? wire7 : wire5) : (-wire1)))});
  assign wire9 = (~&wire6[(1'h1):(1'h1)]);
  assign wire10 = {{wire8, {$signed(((8'hb9) ? wire3 : wire9))}}};
  assign wire11 = wire6;
  assign wire12 = (^~(!wire5[(1'h1):(1'h0)]));
  assign wire13 = $signed($unsigned($signed((!{wire4}))));
  assign wire14 = $signed(wire3[(4'hb):(1'h0)]);
  assign wire15 = $signed(wire11[(2'h2):(1'h1)]);
  module16 #() modinst179 (.clk(clk), .wire17(wire5), .wire18(wire0), .wire19(wire6), .y(wire178), .wire20(wire1));
endmodule

module module16
#(parameter param176 = (|(({{(7'h42), (7'h41)}} ? {((8'hb1) ? (8'ha7) : (7'h41))} : (((8'ha8) ? (8'hbe) : (8'ha1)) >>> ((7'h43) && (7'h44)))) ? (^~(8'hb5)) : ((~^((8'hbe) | (8'haa))) ? (-((8'ha8) >= (7'h41))) : (7'h42)))), 
parameter param177 = {{{param176, (param176 ? param176 : param176)}, (^((param176 >= param176) ? (|param176) : (param176 ? param176 : param176)))}})
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h197):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire20;
  input wire signed [(5'h11):(1'h0)] wire19;
  input wire [(5'h15):(1'h0)] wire18;
  input wire [(5'h13):(1'h0)] wire17;
  wire signed [(3'h6):(1'h0)] wire109;
  wire [(4'hb):(1'h0)] wire80;
  wire signed [(5'h14):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire111;
  wire [(4'he):(1'h0)] wire112;
  wire [(2'h3):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire124;
  wire [(4'h8):(1'h0)] wire125;
  wire signed [(5'h12):(1'h0)] wire126;
  wire signed [(4'hd):(1'h0)] wire164;
  reg [(5'h10):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg168 = (1'h0);
  reg [(4'h9):(1'h0)] reg167 = (1'h0);
  reg [(4'he):(1'h0)] reg166 = (1'h0);
  reg [(5'h11):(1'h0)] reg123 = (1'h0);
  reg [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg121 = (1'h0);
  reg [(4'ha):(1'h0)] reg120 = (1'h0);
  reg [(3'h6):(1'h0)] reg119 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg118 = (1'h0);
  reg [(3'h7):(1'h0)] reg117 = (1'h0);
  reg [(5'h11):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg115 = (1'h0);
  reg [(4'hf):(1'h0)] reg114 = (1'h0);
  assign y = {wire109,
                 wire80,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire111,
                 wire112,
                 wire113,
                 wire124,
                 wire125,
                 wire126,
                 wire164,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
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
                 (1'h0)};
  assign wire21 = wire19;
  assign wire22 = $signed(wire20);
  assign wire23 = ($unsigned(((((8'hb4) ^ wire19) ?
                          wire22 : (wire21 < wire18)) ?
                      $unsigned((wire18 - wire20)) : $unsigned($unsigned(wire22)))) >>> (~&(+((wire20 ?
                      wire20 : wire20) ^ $unsigned(wire21)))));
  assign wire24 = ($unsigned((((wire21 & wire21) * {wire23}) ?
                      $signed($unsigned(wire19)) : $unsigned(wire20[(4'he):(1'h1)]))) + (wire22[(1'h0):(1'h0)] >>> wire21[(1'h0):(1'h0)]));
  module25 #() modinst81 (.wire27(wire22), .wire28(wire19), .clk(clk), .wire29(wire18), .y(wire80), .wire26(wire17));
  module82 #() modinst110 (wire109, clk, wire17, wire20, wire23, wire19, wire18);
  assign wire111 = (8'hba);
  assign wire112 = {($signed(($signed(wire23) ?
                           (wire21 ?
                               wire19 : wire19) : (+wire22))) >> {{{wire24},
                               (|(8'ha1))},
                           {$signed(wire21)}})};
  assign wire113 = (~&$unsigned($signed((wire23 >> ((8'hbc) ?
                       wire21 : wire19)))));
  always
    @(posedge clk) begin
      if ((|($unsigned($unsigned($unsigned(wire17))) ~^ {$unsigned($unsigned(wire80)),
          $unsigned(wire19)})))
        begin
          reg114 <= wire109;
          if ($unsigned(($unsigned(wire111) ~^ (!(reg114 > wire20)))))
            begin
              reg115 <= (wire20 ?
                  ($signed($unsigned((wire112 ? (8'hb3) : wire112))) ?
                      $unsigned($signed((wire109 >>> wire20))) : (!(-$unsigned(wire17)))) : $unsigned(($unsigned((wire80 ?
                      wire21 : wire24)) < (^(wire112 < wire24)))));
              reg116 <= (wire18 ^~ $signed(((^~$signed((7'h40))) == $signed($signed(wire111)))));
              reg117 <= wire19[(4'hc):(3'h6)];
              reg118 <= wire109;
              reg119 <= $signed(reg115);
            end
          else
            begin
              reg115 <= (+$signed($unsigned({{reg116},
                  wire109[(1'h0):(1'h0)]})));
              reg116 <= wire17[(3'h7):(1'h1)];
              reg117 <= ((((((7'h41) ? reg115 : (8'ha1)) && wire21) ?
                      (reg114[(4'ha):(2'h2)] || $signed(wire111)) : $signed((8'hbd))) <<< (reg116[(1'h1):(1'h1)] && ({wire109} ?
                      (8'haf) : {reg118}))) ?
                  $unsigned((wire113[(1'h1):(1'h1)] ?
                      (wire109 ~^ reg118) : wire17[(5'h12):(3'h6)])) : $unsigned((8'hb2)));
              reg118 <= {(~((wire109[(2'h2):(1'h1)] ^~ {(8'hbf)}) >= (^~(wire22 & reg118))))};
            end
          reg120 <= wire109[(1'h0):(1'h0)];
          reg121 <= ($unsigned($unsigned(((reg115 != (7'h40)) < wire20))) ^~ $unsigned($unsigned((8'hbc))));
          reg122 <= ({($unsigned(wire21[(1'h1):(1'h1)]) || $signed((wire20 ?
                  reg117 : wire19))),
              (&((~^wire113) || (|(8'ha8))))} | wire80);
        end
      else
        begin
          reg114 <= (!$unsigned($signed((!{(8'hb6)}))));
          reg115 <= ($unsigned((|$signed((reg122 && (8'hbb))))) ?
              reg118[(4'h9):(4'h9)] : (8'hae));
          reg116 <= ({$unsigned(wire21)} ?
              {(((8'had) ?
                      (wire22 <= (8'hbc)) : reg120[(1'h1):(1'h0)]) ^ wire18)} : ((!$unsigned((|reg114))) - wire24));
          reg117 <= $signed($unsigned(({(wire23 << reg116)} & (^$unsigned(wire20)))));
          reg118 <= $signed($unsigned($signed($signed((wire17 <<< wire17)))));
        end
      reg123 <= ({wire19} + reg115[(1'h0):(1'h0)]);
    end
  assign wire124 = (-(~|$signed($unsigned($signed(reg116)))));
  assign wire125 = reg117;
  assign wire126 = reg123;
  module127 #() modinst165 (.y(wire164), .wire132(wire124), .wire130(wire20), .wire129(wire24), .wire128(wire18), .wire131(wire111), .clk(clk));
  always
    @(posedge clk) begin
      reg166 <= (((~(reg116 + (&wire21))) + reg114) ?
          (reg119[(3'h4):(3'h4)] ?
              wire22[(4'he):(2'h2)] : ($unsigned($signed(reg120)) ?
                  (^wire23) : reg115)) : $unsigned(($signed((wire113 | wire17)) ?
              $signed(((8'ha9) ^~ wire19)) : ($signed(reg116) ^~ $unsigned((8'hb3))))));
      reg167 <= (&(wire111[(3'h6):(2'h2)] | $signed((8'hac))));
      reg168 <= wire112;
      if (reg116)
        begin
          if ($signed(($unsigned($signed(reg117[(3'h7):(3'h7)])) ?
              wire164 : reg120[(4'h9):(4'h9)])))
            begin
              reg169 <= (8'hb7);
              reg170 <= $signed($unsigned(($unsigned((wire18 ?
                      reg118 : (8'hb7))) ?
                  wire21[(1'h1):(1'h1)] : {((8'haf) > wire164),
                      reg167[(3'h7):(2'h3)]})));
              reg171 <= $unsigned((({wire22[(4'hb):(1'h0)]} ?
                  ({wire111} ?
                      $unsigned(wire109) : (reg122 ?
                          reg123 : wire164)) : ($signed((8'ha4)) ?
                      (!reg169) : wire22)) < reg120[(1'h0):(1'h0)]));
            end
          else
            begin
              reg169 <= $signed($signed($signed(reg166[(4'hd):(1'h0)])));
              reg170 <= (&wire124);
            end
          reg172 <= (((&reg168[(3'h4):(3'h4)]) - (wire125 ^ wire109[(2'h3):(1'h0)])) ?
              reg166 : wire21);
        end
      else
        begin
          if (($unsigned({((wire80 ? reg166 : reg115) ?
                      (reg117 - wire24) : reg123)}) ?
              (+reg121) : $unsigned($signed(($signed(reg167) ?
                  {wire22} : $signed(wire21))))))
            begin
              reg169 <= ((wire113[(2'h3):(1'h1)] ?
                  (~^$signed(wire24)) : $unsigned($signed($unsigned(reg171)))) != (wire24[(4'hf):(4'ha)] ~^ (|reg166[(4'hc):(3'h4)])));
            end
          else
            begin
              reg169 <= reg114;
              reg170 <= wire111;
              reg171 <= wire124[(1'h1):(1'h0)];
            end
          reg172 <= (wire20 ? $unsigned(wire124) : wire18[(5'h13):(4'hd)]);
          reg173 <= wire164;
          reg174 <= reg167;
          reg175 <= reg116;
        end
    end
endmodule

module module127
#(parameter param163 = ((~|{{((8'h9f) < (7'h44)), {(8'ha5), (8'ha5)}}}) ? (8'hbb) : (8'h9e)))
(y, clk, wire132, wire131, wire130, wire129, wire128);
  output wire [(32'h166):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire132;
  input wire [(4'ha):(1'h0)] wire131;
  input wire [(4'hd):(1'h0)] wire130;
  input wire signed [(4'hd):(1'h0)] wire129;
  input wire [(5'h15):(1'h0)] wire128;
  wire [(4'h8):(1'h0)] wire162;
  wire [(2'h2):(1'h0)] wire161;
  wire [(4'hd):(1'h0)] wire160;
  wire [(5'h14):(1'h0)] wire159;
  wire signed [(5'h10):(1'h0)] wire158;
  wire signed [(4'he):(1'h0)] wire145;
  wire signed [(4'he):(1'h0)] wire144;
  wire signed [(4'ha):(1'h0)] wire143;
  wire signed [(3'h7):(1'h0)] wire142;
  wire [(4'hd):(1'h0)] wire141;
  wire [(5'h11):(1'h0)] wire140;
  wire signed [(5'h15):(1'h0)] wire139;
  wire [(4'h8):(1'h0)] wire138;
  wire [(3'h7):(1'h0)] wire135;
  reg signed [(4'hd):(1'h0)] reg157 = (1'h0);
  reg [(2'h2):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg155 = (1'h0);
  reg [(5'h14):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg151 = (1'h0);
  reg [(4'h8):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg148 = (1'h0);
  reg [(4'h8):(1'h0)] reg147 = (1'h0);
  reg [(4'he):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg137 = (1'h0);
  reg [(5'h14):(1'h0)] reg136 = (1'h0);
  reg [(5'h11):(1'h0)] reg134 = (1'h0);
  reg signed [(4'he):(1'h0)] reg133 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire135,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg137,
                 reg136,
                 reg134,
                 reg133,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg133 <= ((wire130[(4'hc):(4'h9)] ?
          (((7'h40) | (~wire130)) * ($signed(wire128) == (&wire131))) : $unsigned($signed(wire131))) && (|$unsigned(($signed(wire130) ?
          wire129[(4'hb):(4'hb)] : (wire130 >= wire132)))));
      reg134 <= $unsigned(wire129);
    end
  assign wire135 = wire129;
  always
    @(posedge clk) begin
      reg136 <= ((^~($signed({reg133,
          reg133}) == wire131)) << (~|wire129[(4'hd):(1'h0)]));
      reg137 <= wire132;
    end
  assign wire138 = ((!(!{reg137[(3'h4):(1'h0)],
                           (reg136 ? wire135 : (8'ha1))})) ?
                       (8'ha1) : $unsigned($signed(((reg137 + (8'hb6)) ?
                           {(7'h40)} : reg133[(4'h8):(3'h5)]))));
  assign wire139 = $unsigned(({$unsigned($unsigned(wire128)),
                       {(wire129 ? reg137 : wire135),
                           (reg134 ?
                               wire132 : reg137)}} || $unsigned($signed(wire129))));
  assign wire140 = ($unsigned(reg134) ?
                       {$unsigned(reg134[(4'ha):(3'h5)]),
                           $unsigned($signed(reg133))} : wire129);
  assign wire141 = ((&$unsigned((^~$signed((8'hb8))))) ?
                       $signed($signed({{wire130, wire130},
                           (wire128 >>> reg137)})) : (8'h9d));
  assign wire142 = $signed($signed($unsigned((8'ha0))));
  assign wire143 = wire139[(4'hf):(4'h8)];
  assign wire144 = ($unsigned(reg137) ?
                       ((~&$signed((reg136 != reg133))) ?
                           $unsigned(reg134[(4'he):(3'h7)]) : wire139[(1'h1):(1'h1)]) : $signed($signed((|(wire138 <<< wire130)))));
  assign wire145 = $signed(wire142);
  always
    @(posedge clk) begin
      if ((8'h9c))
        begin
          if ((!$unsigned(wire140[(4'he):(4'ha)])))
            begin
              reg146 <= ($unsigned((wire142 > reg134[(1'h1):(1'h1)])) < (~&($signed((wire131 ?
                  wire130 : wire132)) ^ $signed(wire142))));
              reg147 <= wire135[(1'h0):(1'h0)];
              reg148 <= (($unsigned($signed($signed(wire131))) ?
                      (~^wire142[(1'h0):(1'h0)]) : reg133[(4'he):(3'h5)]) ?
                  $unsigned({(!$signed(reg146)),
                      ($signed(wire129) * (wire139 ?
                          reg134 : reg136))}) : wire145);
              reg149 <= $unsigned(wire131);
            end
          else
            begin
              reg146 <= wire139[(4'h8):(2'h2)];
              reg147 <= ({wire138,
                      ($signed(reg134[(3'h4):(1'h0)]) << $unsigned($signed(wire131)))} ?
                  wire142 : (($signed($unsigned(reg134)) ?
                      (~^{wire139,
                          wire141}) : {(7'h41)}) * reg133[(4'hc):(1'h0)]));
              reg148 <= {$signed(($unsigned(reg137) ?
                      wire140 : (reg147 ~^ wire128[(4'he):(3'h7)])))};
              reg149 <= $signed($unsigned($signed($unsigned((7'h43)))));
            end
          reg150 <= ((8'had) ?
              $unsigned((+($unsigned(reg148) ?
                  (reg148 | (7'h44)) : wire145))) : (!($signed($unsigned(wire132)) & wire132)));
          if (($unsigned($signed(((wire135 && reg147) | $unsigned(wire145)))) ?
              (~^(~|(reg146[(3'h7):(1'h1)] ~^ reg150))) : (|((!(!reg133)) ?
                  (8'hb1) : wire129[(3'h6):(1'h1)]))))
            begin
              reg151 <= (!$unsigned((^~reg150[(1'h1):(1'h0)])));
              reg152 <= $unsigned((~&($unsigned($unsigned(reg147)) ?
                  {$unsigned(wire141)} : $signed($signed(reg147)))));
              reg153 <= wire142[(3'h7):(2'h3)];
              reg154 <= {({((reg152 ?
                          wire132 : wire135) & (&reg151))} <= wire129[(3'h5):(2'h3)])};
              reg155 <= ($unsigned(($signed({reg153}) ?
                      {(8'h9c), (|wire135)} : reg146[(4'hd):(4'h9)])) ?
                  $unsigned((~&(reg150[(3'h4):(1'h0)] ?
                      $unsigned(reg150) : (wire131 ?
                          wire139 : wire130)))) : ($signed($signed($unsigned(wire144))) != $unsigned(({wire135} ?
                      wire132 : (+(8'hb0))))));
            end
          else
            begin
              reg151 <= wire144;
              reg152 <= $signed((wire129 << $signed($signed($unsigned(wire132)))));
            end
          reg156 <= reg137[(5'h10):(2'h2)];
        end
      else
        begin
          if ($unsigned($unsigned((({(8'hb4)} == (wire130 - reg136)) >= reg136))))
            begin
              reg146 <= $signed($signed(((wire132 ?
                  $unsigned(reg137) : reg146) != wire145)));
              reg147 <= (reg133[(2'h2):(2'h2)] != $unsigned(wire132[(3'h5):(3'h4)]));
            end
          else
            begin
              reg146 <= $signed({{(^reg153[(4'hb):(4'hb)])}});
            end
        end
      reg157 <= reg148[(1'h0):(1'h0)];
    end
  assign wire158 = ($unsigned(((~&(8'hac)) >= $unsigned(wire145))) ?
                       $signed((($signed(reg133) ^ {reg146}) ^ $signed($signed(reg146)))) : (reg136 != {reg155[(3'h4):(1'h1)]}));
  assign wire159 = $unsigned((($signed($unsigned(reg157)) ?
                           ({(8'ha3)} ?
                               reg153[(1'h1):(1'h1)] : $unsigned((8'hb8))) : ($signed((8'ha5)) & wire131[(3'h4):(1'h1)])) ?
                       reg149[(3'h5):(1'h0)] : reg136));
  assign wire160 = (reg152 | reg137[(3'h5):(1'h1)]);
  assign wire161 = $signed(($unsigned(reg157[(1'h0):(1'h0)]) ^~ wire138));
  assign wire162 = $unsigned(($unsigned($unsigned(wire135)) ?
                       (~($signed(reg134) >> (reg133 ?
                           reg136 : reg156))) : wire139));
endmodule

module module82  (y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire87;
  input wire signed [(4'h8):(1'h0)] wire86;
  input wire [(2'h2):(1'h0)] wire85;
  input wire [(4'hd):(1'h0)] wire84;
  input wire signed [(3'h7):(1'h0)] wire83;
  wire [(5'h10):(1'h0)] wire108;
  wire signed [(4'hb):(1'h0)] wire107;
  wire [(5'h14):(1'h0)] wire106;
  wire signed [(4'hc):(1'h0)] wire105;
  wire signed [(3'h7):(1'h0)] wire104;
  wire [(5'h10):(1'h0)] wire103;
  wire signed [(5'h11):(1'h0)] wire102;
  wire [(5'h15):(1'h0)] wire101;
  wire [(4'he):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire89;
  wire [(3'h6):(1'h0)] wire88;
  reg signed [(5'h11):(1'h0)] reg100 = (1'h0);
  reg [(4'h8):(1'h0)] reg99 = (1'h0);
  reg [(4'h8):(1'h0)] reg98 = (1'h0);
  reg [(3'h5):(1'h0)] reg97 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  reg [(2'h3):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire90,
                 wire89,
                 wire88,
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
  assign wire88 = ($unsigned(wire85) >> $unsigned((((wire83 ?
                      wire84 : wire84) - (-wire86)) | wire86)));
  assign wire89 = ((($unsigned($unsigned((7'h44))) ?
                              wire86 : $unsigned((wire83 + wire88))) ?
                          (^~$unsigned((^~wire83))) : {wire84}) ?
                      (wire83[(1'h0):(1'h0)] ?
                          $unsigned($signed((!wire84))) : wire83[(3'h6):(1'h1)]) : (~&wire87[(3'h5):(1'h1)]));
  assign wire90 = ({{{$unsigned(wire88), wire86}}} & wire85[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if ($unsigned((wire89[(3'h5):(1'h1)] ? wire89[(4'he):(3'h7)] : wire90)))
        begin
          reg91 <= wire84[(4'h8):(1'h1)];
          reg92 <= ($signed(wire83[(3'h7):(2'h2)]) ?
              {(wire89 != $unsigned({(8'hac)}))} : $unsigned((wire90[(3'h4):(1'h0)] ?
                  (reg91[(4'hf):(1'h0)] ?
                      wire86[(1'h1):(1'h1)] : (+wire86)) : ($unsigned(reg91) || wire85[(2'h2):(2'h2)]))));
        end
      else
        begin
          reg91 <= (wire85[(1'h0):(1'h0)] <= $unsigned((&{wire86,
              (wire90 >> wire87)})));
        end
      if ($signed(wire88))
        begin
          if ($signed(wire87[(5'h12):(4'ha)]))
            begin
              reg93 <= $signed(wire90);
              reg94 <= $unsigned(reg92[(2'h3):(1'h0)]);
              reg95 <= $signed($unsigned($signed({reg93})));
            end
          else
            begin
              reg93 <= $unsigned($signed(wire89[(3'h7):(3'h6)]));
              reg94 <= wire88[(3'h6):(3'h6)];
              reg95 <= (7'h44);
              reg96 <= (^~wire83[(1'h1):(1'h0)]);
            end
          reg97 <= $unsigned($signed(($unsigned(wire83) ?
              wire88 : (^~(wire87 <= reg92)))));
          reg98 <= $signed($unsigned((~&wire90)));
          reg99 <= (8'hbf);
        end
      else
        begin
          reg93 <= ($unsigned((~|$unsigned($signed(wire90)))) << ($signed(((-reg99) ?
                  ((7'h40) ? wire87 : reg99) : $unsigned(wire90))) ?
              (($signed((8'ha3)) ?
                  reg95[(3'h6):(1'h0)] : {wire88}) - (|(~&wire83))) : ($unsigned((~|reg92)) ?
                  wire86[(1'h0):(1'h0)] : wire88)));
          reg94 <= {{(~&(~|wire87[(5'h10):(4'he)])), wire89[(4'hc):(3'h5)]}};
          reg95 <= $signed(reg96[(2'h2):(1'h0)]);
          reg96 <= (((&((wire84 ? wire89 : reg95) <= {wire86, reg99})) ?
                  ((~&wire87) ?
                      {(&(8'hb4))} : $signed($unsigned(wire85))) : reg91[(4'h8):(1'h1)]) ?
              reg99[(4'h8):(1'h0)] : (((^{wire90}) | wire89) & wire88[(1'h0):(1'h0)]));
        end
      reg100 <= reg94;
    end
  assign wire101 = reg95[(2'h3):(2'h3)];
  assign wire102 = reg100[(4'h9):(3'h5)];
  assign wire103 = (~^$signed($unsigned({wire85[(2'h2):(1'h0)]})));
  assign wire104 = $unsigned($signed(((~(wire83 ?
                       wire83 : (8'hb8))) >= $signed((~|wire88)))));
  assign wire105 = wire88;
  assign wire106 = ($unsigned((^~(8'h9c))) & (^reg97[(1'h1):(1'h1)]));
  assign wire107 = (($unsigned($unsigned((wire83 ?
                           wire88 : wire87))) != (+(~^$signed(reg91)))) ?
                       $signed(((wire83[(1'h1):(1'h0)] ?
                               $unsigned(wire85) : (~wire87)) ?
                           wire85[(2'h2):(1'h0)] : (|$unsigned(wire106)))) : reg93[(5'h11):(4'hb)]);
  assign wire108 = $unsigned(reg99);
endmodule

module module25  (y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h227):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire29;
  input wire signed [(5'h11):(1'h0)] wire28;
  input wire signed [(5'h13):(1'h0)] wire27;
  input wire signed [(4'hb):(1'h0)] wire26;
  wire [(3'h4):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire70;
  wire signed [(4'h8):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire66;
  wire signed [(2'h2):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire30;
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire45,
                 wire44,
                 wire43,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
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
                 reg48,
                 reg47,
                 reg46,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire30 = ((((~&(-(8'h9f))) < (wire26[(3'h7):(3'h6)] == (~&wire27))) ^~ (($signed(wire28) ?
                          (wire26 < wire27) : (wire27 ?
                              wire26 : wire27)) | wire26[(3'h4):(1'h1)])) ?
                      wire26[(2'h2):(1'h0)] : $signed(wire27));
  assign wire31 = $unsigned($signed($signed((~&$signed(wire28)))));
  assign wire32 = (-wire26[(3'h6):(3'h4)]);
  assign wire33 = ($unsigned(wire27) ^~ wire26[(3'h7):(1'h0)]);
  always
    @(posedge clk) begin
      reg34 <= (+$signed(wire32));
      if ({$signed($signed(reg34[(2'h3):(2'h3)])), $signed((8'hb4))})
        begin
          reg35 <= $signed((((wire29[(4'h8):(2'h3)] ?
                      wire30[(1'h1):(1'h1)] : wire27) ?
                  reg34 : {wire27}) ?
              (7'h43) : ((~|(wire30 ? wire32 : wire30)) ?
                  wire33[(4'h8):(2'h2)] : wire31)));
        end
      else
        begin
          reg35 <= ((^~wire30[(2'h3):(1'h0)]) - (!($signed($signed(wire33)) + reg35)));
        end
      if (((^~$signed((8'ha4))) >> (~&$unsigned(wire33[(5'h14):(4'ha)]))))
        begin
          if ({wire30[(1'h1):(1'h0)],
              ({wire27[(3'h7):(3'h7)]} ?
                  {reg34[(3'h6):(3'h5)]} : ($unsigned(wire29) + reg35[(1'h1):(1'h1)]))})
            begin
              reg36 <= $signed((($signed((|reg34)) ?
                      $signed({wire32}) : $signed(reg34)) ?
                  (wire31[(2'h2):(2'h2)] ?
                      ($signed(wire26) ?
                          (|(7'h41)) : $unsigned(reg34)) : $unsigned(wire33)) : $unsigned((8'hb0))));
              reg37 <= ($signed(wire28[(3'h4):(1'h0)]) ?
                  ($unsigned(wire32[(1'h0):(1'h0)]) ?
                      (wire32[(4'hc):(4'hc)] ?
                          $unsigned({wire28,
                              wire27}) : $signed(wire26)) : wire33[(1'h0):(1'h0)]) : wire30);
              reg38 <= (($signed(wire26) ^ reg34) >> (reg34 ?
                  (((wire30 >> wire28) && (wire29 ? reg34 : (8'ha5))) ?
                      ((reg37 ?
                          reg36 : reg37) || $unsigned(wire27)) : $signed(reg37[(1'h0):(1'h0)])) : {reg37[(3'h5):(2'h3)],
                      (~&wire31[(3'h7):(2'h3)])}));
            end
          else
            begin
              reg36 <= $unsigned($signed($signed(wire26)));
              reg37 <= reg35;
              reg38 <= $signed($unsigned((^~{$signed(wire28)})));
              reg39 <= wire26;
              reg40 <= $unsigned((|($unsigned(((8'hae) ?
                  reg34 : reg36)) < $signed($unsigned(reg35)))));
            end
          reg41 <= (-$unsigned({$unsigned({reg37}), (^~reg34)}));
          reg42 <= (~^reg37[(1'h0):(1'h0)]);
        end
      else
        begin
          reg36 <= reg41;
        end
    end
  assign wire43 = ((($signed((|reg40)) ? reg40 : $signed((~^reg37))) ?
                          wire32 : $signed(((|reg41) << $signed((8'hb4))))) ?
                      (!$unsigned({(reg37 ~^ (8'hbc)),
                          (wire32 ?
                              (8'haa) : wire27)})) : $unsigned($unsigned(((~|(7'h42)) ?
                          $signed(reg35) : $unsigned(wire30)))));
  assign wire44 = (!({$signed((wire29 <<< reg41))} ? reg36 : reg35));
  assign wire45 = {wire28};
  always
    @(posedge clk) begin
      if (reg36)
        begin
          if (({wire45, $signed((^~(wire29 ~^ reg37)))} ?
              $unsigned($unsigned((7'h44))) : ((!wire27[(2'h3):(1'h0)]) > $unsigned(wire29))))
            begin
              reg46 <= ((~&$unsigned($signed(wire44[(2'h3):(2'h2)]))) ?
                  $unsigned((|(|(reg42 >>> wire27)))) : reg35);
              reg47 <= ($unsigned($unsigned((~^$signed(wire30)))) ?
                  {reg35} : {{(reg38[(3'h4):(1'h1)] - (reg34 < wire29)),
                          wire32},
                      ({(reg41 ? wire26 : (8'ha3)),
                          wire33} - reg34[(2'h2):(1'h0)])});
              reg48 <= (reg34[(4'he):(4'ha)] ?
                  (~^$signed((^~$signed(wire27)))) : $signed($unsigned($unsigned((~^wire31)))));
              reg49 <= (((((reg42 - wire28) ?
                      wire31[(3'h6):(1'h0)] : (!wire29)) ?
                  {reg35} : (~^(+wire33))) << wire30[(1'h0):(1'h0)]) >> (wire43 * (7'h43)));
            end
          else
            begin
              reg46 <= reg49;
              reg47 <= (reg47[(2'h2):(2'h2)] <<< reg47[(3'h7):(3'h4)]);
              reg48 <= $unsigned(($signed((^(reg40 ? reg47 : (8'ha4)))) ?
                  $unsigned((reg38 + (wire29 - wire31))) : $signed(($unsigned(reg34) ?
                      (!(8'hb1)) : reg38))));
            end
          if ({({($signed((8'hae)) < wire31)} > $unsigned((^~$signed(wire33))))})
            begin
              reg50 <= (reg46[(3'h5):(2'h2)] << wire29[(3'h6):(3'h4)]);
              reg51 <= {wire43};
              reg52 <= wire28;
              reg53 <= (8'hbf);
            end
          else
            begin
              reg50 <= ((~|reg36) + ((~&((~|reg36) ^ (8'hbd))) ?
                  (8'hb3) : ((~^$unsigned((8'hbe))) >>> (!(&reg40)))));
            end
          if ((~^reg50))
            begin
              reg54 <= $signed($unsigned((((wire30 ? (8'ha2) : reg35) ?
                  (reg42 >= reg42) : wire44) * (reg36[(1'h1):(1'h1)] & $unsigned(reg42)))));
            end
          else
            begin
              reg54 <= (((~&({reg41, wire30} ? reg52 : reg38[(3'h7):(3'h7)])) ?
                  reg35[(2'h2):(2'h2)] : wire29[(4'hb):(4'h8)]) >= $signed((-reg39)));
              reg55 <= (reg42[(4'ha):(1'h0)] & {reg37[(1'h1):(1'h0)],
                  $unsigned(wire45)});
            end
        end
      else
        begin
          reg46 <= (~&(~$unsigned($unsigned(reg48[(3'h5):(1'h1)]))));
          reg47 <= reg38;
          if ($unsigned({reg53, $signed(wire32[(4'hd):(4'hb)])}))
            begin
              reg48 <= ($unsigned($signed($signed((~^reg42)))) ?
                  $signed(wire45) : $unsigned((~(reg50[(2'h2):(1'h0)] ?
                      reg36 : (~&wire32)))));
              reg49 <= (^$unsigned(($signed((wire29 << reg53)) >= (|(wire43 ?
                  (8'ha7) : reg55)))));
              reg50 <= reg47;
              reg51 <= ((((~^(reg50 ? reg34 : wire31)) ?
                      ($unsigned((8'ha2)) ?
                          $signed(reg49) : $unsigned(reg40)) : reg54) >= ({wire29} ?
                      ($unsigned(wire27) ?
                          $unsigned(wire28) : reg34[(4'hc):(3'h5)]) : (+reg51[(3'h4):(2'h3)]))) ?
                  wire44[(1'h1):(1'h1)] : reg40);
              reg52 <= wire45[(4'h8):(4'h8)];
            end
          else
            begin
              reg48 <= $unsigned($signed($signed({$signed((8'h9d))})));
            end
          reg53 <= {((wire33 != ((-reg52) ?
                      ((8'hba) ? reg37 : reg48) : (~&reg48))) ?
                  (((reg53 <<< reg55) ? reg47 : (^~reg55)) ?
                      $unsigned((~^(8'hbb))) : (((8'ha7) ? reg34 : reg53) ?
                          $unsigned(reg36) : $unsigned(wire44))) : {{{wire28},
                          $unsigned(wire28)},
                      $signed($unsigned(reg38))}),
              (~$signed(wire32[(2'h3):(2'h2)]))};
          if ($signed(reg38[(3'h5):(2'h2)]))
            begin
              reg54 <= (wire26[(1'h0):(1'h0)] ?
                  $unsigned((wire43 >>> reg51)) : wire45);
              reg55 <= $unsigned(reg54);
            end
          else
            begin
              reg54 <= (reg39[(2'h3):(2'h3)] <= wire30);
              reg55 <= $unsigned((~&wire30[(1'h0):(1'h0)]));
              reg56 <= {($signed($signed(wire28[(5'h11):(4'hf)])) || (($signed((8'ha6)) ^~ reg35) ?
                      {$unsigned(reg55), (reg38 >> reg55)} : (+(reg49 ?
                          wire27 : (8'haf)))))};
              reg57 <= reg40[(4'ha):(4'h9)];
              reg58 <= {(wire29[(4'he):(3'h7)] ?
                      ({(7'h44)} ?
                          $unsigned((reg42 ? reg51 : wire29)) : (reg46 ?
                              $unsigned((8'hb3)) : (reg48 ?
                                  reg34 : (8'h9e)))) : $signed({(^~reg52),
                          reg52})),
                  reg46};
            end
        end
      reg59 <= ($signed((wire45[(4'h9):(3'h6)] || $signed(((8'ha0) ?
          (8'hbb) : reg54)))) > ((wire26[(3'h5):(1'h1)] >= wire33) ?
          ((~|$signed(reg49)) ?
              (wire31[(1'h1):(1'h0)] != $unsigned(reg46)) : {wire27}) : $unsigned($signed(wire33))));
      if ((($unsigned(((reg37 ? reg46 : reg55) * $unsigned(wire44))) ?
          (!($signed(reg46) ?
              reg40 : reg38[(2'h2):(2'h2)])) : reg57) <<< $signed($signed(reg42))))
        begin
          reg60 <= $signed(($unsigned((&(|(8'ha7)))) & $unsigned({{reg37}})));
          reg61 <= (|wire43);
          reg62 <= $signed(($unsigned($signed((wire29 ? wire29 : (8'hbd)))) ?
              {$signed({reg58})} : (|(^$signed(reg52)))));
          reg63 <= wire45[(2'h2):(1'h0)];
        end
      else
        begin
          reg60 <= $signed({wire31[(1'h0):(1'h0)]});
        end
      reg64 <= wire29;
    end
  assign wire65 = (((8'hb2) ?
                      reg61 : $unsigned($unsigned(reg51[(4'hf):(4'h8)]))) > reg63);
  assign wire66 = $unsigned($unsigned((8'haf)));
  assign wire67 = (&wire45);
  assign wire68 = wire65;
  assign wire69 = (reg63 < ($unsigned(wire33) << (^($unsigned(reg60) ?
                      {reg46} : {reg58, reg42}))));
  assign wire70 = {(wire43[(4'h9):(3'h6)] < $signed({(reg35 ~^ reg49)})),
                      $unsigned(wire65[(2'h2):(1'h0)])};
  assign wire71 = $unsigned(((reg49[(1'h1):(1'h0)] > {(8'ha7), wire30}) ?
                      reg48[(4'hb):(4'hb)] : $unsigned(($signed(reg58) ?
                          reg46 : reg63))));
  assign wire72 = wire30;
  assign wire73 = wire43;
  always
    @(posedge clk) begin
      reg74 <= $unsigned($unsigned({$unsigned((wire33 ? (8'haf) : wire69))}));
    end
  always
    @(posedge clk) begin
      reg75 <= (7'h44);
      reg76 <= (~(^~$signed({$signed(wire45)})));
      reg77 <= reg75;
      reg78 <= $unsigned(wire70);
      reg79 <= reg54[(4'h8):(3'h6)];
    end
endmodule
