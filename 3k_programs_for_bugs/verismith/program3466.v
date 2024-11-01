module top
#(parameter param161 = ((8'hb6) ? {(((~^(7'h41)) ? ((8'ha3) * (7'h43)) : (+(8'ha5))) > (8'hb9))} : ((!(-{(8'ha4), (8'ha4)})) ? {(((8'h9e) ? (8'h9f) : (8'h9d)) ? {(8'ha8), (8'hb9)} : ((8'ha2) | (8'h9c))), (((8'ha5) ? (8'haf) : (8'hbf)) - ((8'h9e) != (7'h44)))} : ((&(~&(8'hbb))) ? ({(8'haf), (8'hbd)} ? ((8'hb8) ? (8'hac) : (8'ha4)) : (^(8'h9d))) : {((7'h40) ? (8'hbf) : (8'h9c))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire159;
  wire [(5'h10):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  reg [(4'h8):(1'h0)] reg4 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  assign y = {wire159,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($signed((wire3 & $unsigned($signed((8'hb2))))) ?
          (~&(8'hb0)) : $unsigned(wire1[(5'h14):(4'hf)])))
        begin
          reg4 <= (^$unsigned(wire0));
          reg5 <= (wire0 == ($unsigned($unsigned(wire3[(4'hc):(4'hc)])) >= ($signed(wire0) ?
              $signed((wire1 ?
                  reg4 : (8'hb5))) : $unsigned(wire3[(2'h2):(2'h2)]))));
          reg6 <= $unsigned((+$unsigned((reg5[(1'h1):(1'h0)] ?
              (reg4 >= wire2) : wire3))));
        end
      else
        begin
          if ($signed(((reg4 - ((wire3 ? reg5 : reg5) ?
              $unsigned(reg6) : $unsigned((8'ha6)))) > (($unsigned(wire3) + reg5) != $unsigned({reg6,
              wire1})))))
            begin
              reg4 <= (-{$signed(((reg4 ? reg5 : reg6) * (8'hb8))),
                  ({$signed((8'h9e))} ? reg6 : wire2)});
              reg5 <= reg6;
              reg6 <= reg6;
            end
          else
            begin
              reg4 <= {wire3};
              reg5 <= {((~|(&$signed(wire2))) && {($signed(wire3) <<< (+(7'h43)))}),
                  (($unsigned($signed(wire1)) & wire1[(5'h10):(4'ha)]) * (7'h40))};
            end
          if ((+(reg5 ?
              ((wire0 ? (wire1 == reg5) : $signed(wire1)) ?
                  (!$signed(reg5)) : $unsigned((wire3 >= reg6))) : (($signed(reg6) + ((7'h42) ?
                  wire1 : (8'ha4))) ~^ $signed({wire3})))))
            begin
              reg7 <= (8'ha1);
            end
          else
            begin
              reg7 <= $signed((8'hba));
            end
          reg8 <= $signed($signed($signed(((wire1 ? wire2 : reg7) ?
              (~|wire2) : $signed(reg7)))));
        end
      reg9 <= (!($unsigned($unsigned({reg7,
          (8'h9f)})) << $signed((^~(^~reg4)))));
    end
  assign wire10 = $unsigned(((reg4 ?
                          (~^(wire2 ? reg8 : reg6)) : $unsigned(reg8)) ?
                      $signed($unsigned((8'h9c))) : {$signed($unsigned(wire1)),
                          (reg6 * (wire2 ? reg8 : reg8))}));
  assign wire11 = $signed((+$signed($signed((reg7 ? wire0 : reg7)))));
  assign wire12 = {($unsigned($signed(wire2[(3'h4):(2'h3)])) ?
                          $signed(wire10[(2'h3):(1'h1)]) : $signed(((~reg6) * wire3)))};
  assign wire13 = $unsigned(reg9[(1'h1):(1'h0)]);
  module14 #() modinst160 (.wire16(wire10), .y(wire159), .wire18(wire11), .clk(clk), .wire15(reg8), .wire17(wire12), .wire19(wire1));
endmodule

module module14
#(parameter param157 = {{{(((8'ha0) <= (7'h44)) ? ((8'ha2) ? (8'ha0) : (8'hba)) : ((8'h9e) == (8'ha4)))}}}, 
parameter param158 = (param157 ? (+param157) : {{{(param157 ~^ param157), {param157}}}}))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h21d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire18;
  input wire signed [(5'h15):(1'h0)] wire17;
  input wire [(5'h11):(1'h0)] wire16;
  input wire [(4'he):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire156;
  wire [(3'h5):(1'h0)] wire155;
  wire [(5'h14):(1'h0)] wire154;
  wire signed [(4'hd):(1'h0)] wire153;
  wire [(5'h12):(1'h0)] wire152;
  wire [(3'h6):(1'h0)] wire132;
  wire [(3'h5):(1'h0)] wire131;
  wire signed [(5'h10):(1'h0)] wire121;
  wire [(4'h9):(1'h0)] wire120;
  wire signed [(5'h13):(1'h0)] wire119;
  wire [(5'h11):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire86;
  wire [(4'h8):(1'h0)] wire85;
  wire signed [(5'h14):(1'h0)] wire83;
  wire [(4'h9):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire20;
  reg signed [(4'hf):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg150 = (1'h0);
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg148 = (1'h0);
  reg [(3'h6):(1'h0)] reg147 = (1'h0);
  reg [(4'he):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg145 = (1'h0);
  reg [(2'h2):(1'h0)] reg144 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg143 = (1'h0);
  reg [(5'h14):(1'h0)] reg142 = (1'h0);
  reg signed [(4'he):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg140 = (1'h0);
  reg [(3'h6):(1'h0)] reg139 = (1'h0);
  reg [(5'h12):(1'h0)] reg138 = (1'h0);
  reg [(4'h9):(1'h0)] reg137 = (1'h0);
  reg [(3'h7):(1'h0)] reg136 = (1'h0);
  reg [(3'h7):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg134 = (1'h0);
  reg [(5'h11):(1'h0)] reg133 = (1'h0);
  reg [(5'h14):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg128 = (1'h0);
  reg [(4'hf):(1'h0)] reg127 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg125 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg124 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg [(5'h11):(1'h0)] reg122 = (1'h0);
  assign y = {wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire132,
                 wire131,
                 wire121,
                 wire120,
                 wire119,
                 wire117,
                 wire86,
                 wire85,
                 wire83,
                 wire21,
                 wire20,
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
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 (1'h0)};
  assign wire20 = ((-$signed(((wire15 ~^ wire16) ?
                      wire15 : (+(8'ha7))))) > (~^$unsigned($signed((wire15 >= wire19)))));
  assign wire21 = ((wire18 >> wire18) ?
                      (~(wire15 ?
                          ($unsigned(wire19) ?
                              $unsigned(wire18) : (wire17 ?
                                  wire16 : wire15)) : $unsigned(((8'hae) ?
                              (8'hb2) : wire16)))) : (&$unsigned(((wire15 | wire18) ?
                          ((8'hbc) ? wire16 : wire19) : wire18))));
  module22 #() modinst84 (.wire23(wire17), .clk(clk), .wire24(wire16), .wire26(wire19), .y(wire83), .wire25(wire20));
  assign wire85 = $signed(((!wire19) > (8'hac)));
  assign wire86 = wire18[(3'h4):(2'h2)];
  module87 #() modinst118 (wire117, clk, wire86, wire15, wire16, wire19);
  assign wire119 = (8'h9e);
  assign wire120 = wire15[(1'h1):(1'h0)];
  assign wire121 = $unsigned((&(wire17 + (+$signed((8'hba))))));
  always
    @(posedge clk) begin
      reg122 <= wire17;
      reg123 <= $signed(($signed((wire83[(1'h1):(1'h1)] ?
              wire86[(3'h6):(2'h3)] : (|wire86))) ?
          (wire83 ?
              wire85 : $signed(wire86)) : ((&wire117[(4'hc):(4'ha)]) == $unsigned((|(8'hb9))))));
      reg124 <= $signed($signed($signed($unsigned($unsigned(wire83)))));
      if ((!$unsigned(reg123)))
        begin
          if ((~&wire117))
            begin
              reg125 <= ((&$unsigned($unsigned($unsigned(wire121)))) ?
                  wire20 : ({{((8'hae) + wire18)},
                      $unsigned({wire19})} - $unsigned(wire15)));
            end
          else
            begin
              reg125 <= $unsigned(reg124);
              reg126 <= ($signed($signed($unsigned((reg122 ?
                      wire117 : wire120)))) ?
                  ({$signed(wire117[(4'hd):(2'h3)])} ?
                      $signed(((wire15 >>> reg124) ?
                          wire15[(4'h9):(4'h8)] : $unsigned(wire86))) : $unsigned((8'hb5))) : $unsigned($signed((((8'hb1) & wire119) ?
                      reg123[(1'h0):(1'h0)] : wire18[(3'h6):(2'h3)]))));
              reg127 <= (~&reg124);
            end
          reg128 <= $signed($unsigned(($signed(((8'h9f) != wire18)) ?
              ((8'ha6) ?
                  (wire117 != reg124) : (wire121 < wire21)) : ($unsigned(wire16) ?
                  $unsigned(reg127) : {reg123, reg123}))));
          if ($unsigned($signed((($unsigned(wire119) ^~ wire16) - reg125[(3'h6):(3'h5)]))))
            begin
              reg129 <= wire119;
              reg130 <= (((((wire120 >= wire18) >> (^~wire119)) ?
                      (~|(reg123 >> wire83)) : ({wire15} & (+reg124))) ^~ wire85) ?
                  wire17[(3'h4):(1'h1)] : wire16);
            end
          else
            begin
              reg129 <= $unsigned($unsigned(wire20[(4'h9):(3'h6)]));
            end
        end
      else
        begin
          if ((~({({(8'hbd), wire83} >> wire86[(4'hd):(4'hc)]),
                  (reg122[(3'h7):(3'h5)] > (&wire21))} ?
              (|$signed(reg125)) : wire121[(2'h3):(1'h1)])))
            begin
              reg125 <= (7'h43);
              reg126 <= $unsigned((|(wire21 ? wire117 : (^{reg126, wire117}))));
              reg127 <= ($signed(($unsigned($signed((8'hb9))) ?
                      (+$signed(reg126)) : wire17)) ?
                  ({wire119[(1'h1):(1'h1)]} ^ (reg123[(2'h3):(2'h3)] >= ($unsigned(reg124) ?
                      {reg129} : wire20))) : ({(-wire21[(1'h0):(1'h0)]),
                      ($unsigned(reg128) == (~|wire20))} >> reg130));
              reg128 <= (&((($unsigned(reg127) > reg126[(4'hb):(3'h7)]) ?
                      {((8'ha7) ^ wire20), wire16} : reg122[(4'hd):(2'h2)]) ?
                  (|($signed(wire20) ?
                      (wire20 + (8'hb3)) : $unsigned(reg122))) : reg129));
            end
          else
            begin
              reg125 <= wire83;
              reg126 <= $signed($signed((reg128 & $unsigned((wire86 - (8'hb2))))));
              reg127 <= (($unsigned(((^reg123) ?
                      (wire120 | wire18) : (-wire121))) >>> wire83[(5'h13):(5'h12)]) ?
                  $signed((wire85[(2'h2):(1'h0)] != reg125[(3'h6):(1'h0)])) : $unsigned((reg129 ?
                      wire119[(4'hb):(2'h2)] : $unsigned((8'hb6)))));
            end
        end
    end
  assign wire131 = ($signed((reg124 ?
                           $unsigned((^wire15)) : {{reg125, wire120},
                               {(8'hb3), wire20}})) ?
                       wire18[(4'ha):(3'h6)] : ({reg125[(1'h0):(1'h0)],
                               (^(reg127 || (8'hbb)))} ?
                           ((8'had) + $unsigned((wire83 ?
                               wire85 : (8'ha3)))) : {wire21,
                               ($unsigned(wire17) ?
                                   $unsigned(wire16) : (|wire120))}));
  assign wire132 = wire86[(4'h9):(3'h5)];
  always
    @(posedge clk) begin
      reg133 <= (~&{reg130});
      reg134 <= (~&wire120[(3'h4):(1'h0)]);
      reg135 <= $unsigned(wire18[(4'h8):(4'h8)]);
      reg136 <= wire131;
      reg137 <= $signed(($signed(wire131) ?
          $signed(((8'hb8) - (reg130 ?
              wire132 : wire121))) : (($signed(wire83) ?
              $signed(wire83) : $signed(wire131)) ^ wire18[(4'h9):(4'h8)])));
    end
  always
    @(posedge clk) begin
      reg138 <= {{(wire16[(3'h6):(2'h2)] ?
                  $signed($unsigned(wire18)) : wire18[(1'h1):(1'h1)])}};
      reg139 <= {((~((7'h41) ? wire83 : {reg128, wire21})) < (reg135 ?
              $signed(reg123[(1'h0):(1'h0)]) : (~&$unsigned((8'ha2))))),
          ((^~wire121) + (+(7'h42)))};
      reg140 <= wire16;
    end
  always
    @(posedge clk) begin
      reg141 <= wire117;
      reg142 <= wire15;
      if (($signed((reg123 ?
          wire120 : {$unsigned(wire83)})) + ((~$signed($signed(wire120))) <= reg122)))
        begin
          if ((-(reg128 ?
              {($signed(reg136) ?
                      (!reg124) : {wire131,
                          wire20})} : (~&(!wire119[(4'hd):(1'h1)])))))
            begin
              reg143 <= $unsigned((reg126[(4'h9):(3'h6)] || reg123[(1'h1):(1'h0)]));
              reg144 <= {((+wire117) == ($signed({(8'hbe), reg123}) ?
                      $unsigned((^wire120)) : wire131[(2'h3):(1'h1)]))};
              reg145 <= (~|wire83[(4'he):(1'h1)]);
              reg146 <= (($unsigned($unsigned(wire85[(3'h6):(3'h6)])) & (reg133 ?
                  ($unsigned(reg134) >= (reg142 ?
                      wire17 : wire85)) : ($unsigned((8'h9e)) ?
                      {(8'hb0),
                          (8'hb4)} : reg136))) == (!$signed(($signed(wire83) ?
                  ((8'h9d) ? reg130 : (7'h44)) : $unsigned(wire85)))));
              reg147 <= $signed({$unsigned(($signed(wire20) < $signed(wire131))),
                  (((|reg134) ? $signed(wire16) : (wire16 <= wire15)) ?
                      (8'hb8) : {wire117, (reg139 ? reg137 : reg134)})});
            end
          else
            begin
              reg143 <= ($signed((&reg135[(3'h7):(2'h2)])) ?
                  ($signed(wire83[(1'h0):(1'h0)]) ?
                      wire85[(3'h4):(3'h4)] : $signed((reg133 ?
                          wire131 : wire16))) : {reg147});
              reg144 <= $unsigned((7'h41));
              reg145 <= wire16[(2'h2):(1'h1)];
            end
          reg148 <= wire16;
          reg149 <= ({reg143[(1'h1):(1'h0)]} >> $unsigned($unsigned($signed($signed(reg145)))));
        end
      else
        begin
          reg143 <= (^((((reg146 * wire17) > wire16) - $unsigned((~|(8'hba)))) ?
              (({reg130, wire121} ? reg123 : (wire85 * wire117)) ?
                  wire117[(5'h11):(2'h3)] : wire121[(4'hd):(2'h2)]) : $unsigned($signed((wire21 ?
                  reg135 : reg122)))));
          reg144 <= ($signed($unsigned($signed((reg126 ? reg146 : reg145)))) ?
              ((&reg133[(4'ha):(4'h8)]) ~^ reg135[(2'h3):(1'h1)]) : $unsigned(wire19));
          reg145 <= $unsigned(((($unsigned(reg146) != (^wire119)) ?
                  reg125[(3'h5):(1'h0)] : ((reg148 || (8'hb0)) ?
                      {reg136, wire21} : reg123[(1'h0):(1'h0)])) ?
              (wire17[(5'h12):(2'h3)] >> $signed((8'h9e))) : (~reg126)));
          if (reg142[(4'hf):(3'h6)])
            begin
              reg146 <= (-$unsigned(wire15[(4'hd):(4'h8)]));
              reg147 <= (($unsigned({reg146, reg149[(4'h8):(3'h6)]}) ?
                  $unsigned(reg133[(1'h0):(1'h0)]) : $unsigned($signed(reg133[(3'h4):(2'h2)]))) ^~ reg144[(2'h2):(1'h1)]);
              reg148 <= $signed((~|($unsigned(reg147) > reg139)));
              reg149 <= reg123[(1'h0):(1'h0)];
              reg150 <= (~^$signed(reg126[(3'h5):(2'h2)]));
            end
          else
            begin
              reg146 <= ((wire119[(4'hb):(3'h5)] ^ reg135[(3'h6):(3'h5)]) ?
                  wire16 : reg144);
              reg147 <= $unsigned(reg129);
            end
        end
      reg151 <= (^~({wire16,
          (reg136[(3'h7):(1'h0)] ?
              $unsigned(wire15) : (~|wire21))} - ((((8'hbc) ?
          wire17 : reg145) - {reg142, (8'ha1)}) >>> {$unsigned(wire131)})));
    end
  assign wire152 = wire121[(2'h2):(2'h2)];
  assign wire153 = $unsigned(wire121[(3'h7):(1'h1)]);
  assign wire154 = $unsigned(((-(~&{(8'ha3), reg128})) ?
                       reg138 : $signed(wire152)));
  assign wire155 = (~&((($signed(wire117) > (wire121 ?
                       wire20 : reg123)) >>> (+((8'hb4) ?
                       wire17 : reg133))) != {reg128[(4'h9):(4'h9)],
                       {$signed(reg149)}}));
  assign wire156 = (($signed((reg148[(2'h3):(2'h2)] ?
                           (reg129 ?
                               reg145 : reg139) : reg142)) ^ ($unsigned($unsigned((8'hb7))) & ((8'ha4) >= reg129[(3'h5):(1'h1)]))) ?
                       ($signed((~|(wire19 & reg141))) << reg151) : {reg124,
                           reg150[(4'h8):(1'h0)]});
endmodule

module module87
#(parameter param115 = ({(({(7'h44)} ? (~(8'hb6)) : {(8'hbe), (8'hb4)}) ? (((8'haa) ? (8'ha9) : (8'hb3)) ^~ (^~(7'h40))) : (~(|(7'h41)))), (8'ha9)} ? (((~&(~^(8'ha1))) ? (&((7'h44) ? (8'haa) : (8'haf))) : {((8'h9d) <<< (7'h44)), ((8'ha3) > (8'h9e))}) + (8'haf)) : (^(-(~&{(8'ha2), (8'hbf)})))), 
parameter param116 = ({((&param115) ? param115 : (^~(param115 ? param115 : param115))), (7'h43)} < ((((~(8'hae)) ? (~&param115) : (|param115)) ? ((param115 ~^ param115) ? (8'hbe) : (|param115)) : (-(~&param115))) <= (|param115))))
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire91;
  input wire signed [(4'he):(1'h0)] wire90;
  input wire [(5'h11):(1'h0)] wire89;
  input wire [(5'h11):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire114;
  wire signed [(3'h6):(1'h0)] wire113;
  wire [(4'h8):(1'h0)] wire112;
  wire signed [(5'h12):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire97;
  wire signed [(4'h8):(1'h0)] wire96;
  wire [(5'h10):(1'h0)] wire95;
  wire [(2'h2):(1'h0)] wire94;
  wire [(4'hb):(1'h0)] wire93;
  wire [(4'hb):(1'h0)] wire92;
  reg [(5'h11):(1'h0)] reg110 = (1'h0);
  reg [(3'h4):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg98 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
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
                 (1'h0)};
  assign wire92 = wire90[(2'h3):(2'h3)];
  assign wire93 = (wire91 > wire91[(1'h1):(1'h0)]);
  assign wire94 = {$signed((~($unsigned((8'hab)) << wire91))),
                      wire90[(3'h4):(1'h1)]};
  assign wire95 = wire94;
  assign wire96 = $signed((8'h9d));
  assign wire97 = wire94[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg98 <= {(^~{(~|(~^wire93))}),
          ({wire90[(4'ha):(3'h5)]} * ($unsigned($signed(wire95)) ?
              wire92 : (!(~^wire93))))};
      if ((wire96 ~^ (^wire95)))
        begin
          if ((~|((($unsigned(wire96) ? (~&wire94) : $unsigned((8'hb7))) ?
                  $signed($unsigned(wire96)) : ((wire94 ?
                      reg98 : wire91) >> (~wire95))) ?
              (wire88 > wire96) : wire97[(1'h0):(1'h0)])))
            begin
              reg99 <= wire96;
              reg100 <= ((8'hb9) ?
                  ((7'h44) ?
                      (~$signed($unsigned(reg98))) : wire88[(1'h0):(1'h0)]) : $unsigned({wire90[(3'h4):(2'h2)],
                      wire95[(4'h8):(3'h5)]}));
            end
          else
            begin
              reg99 <= wire88[(3'h4):(2'h2)];
              reg100 <= $signed((+wire97));
              reg101 <= $unsigned({$signed(((~|reg100) ?
                      $signed(wire96) : $unsigned(wire88))),
                  wire95});
              reg102 <= (~^((-$signed((~|wire96))) ^ wire94[(2'h2):(1'h1)]));
              reg103 <= wire88[(4'he):(3'h4)];
            end
          reg104 <= $unsigned(reg99[(4'h8):(1'h1)]);
          reg105 <= ($signed($signed($unsigned({reg101, reg100}))) ?
              ((({reg99} ? (~|reg103) : (reg99 >>> reg102)) ?
                      $signed({reg100, reg101}) : reg102[(3'h4):(1'h1)]) ?
                  wire91 : $unsigned(wire91)) : wire93);
          if ((~&(wire88 ~^ $unsigned(($signed(reg103) ^ (reg104 ?
              (8'hb3) : wire90))))))
            begin
              reg106 <= (~&(!(-((wire89 ? reg105 : reg104) ?
                  (reg100 | wire95) : (wire91 ? reg101 : reg100)))));
              reg107 <= reg98[(4'hc):(4'ha)];
            end
          else
            begin
              reg106 <= $signed($unsigned({$signed($unsigned((8'hbd))),
                  reg103}));
              reg107 <= (wire94 > {($unsigned((wire88 ?
                      wire93 : (8'h9f))) < $signed((reg106 && reg106))),
                  $unsigned($unsigned($signed((8'hb2))))});
              reg108 <= (~|{$unsigned((|(reg103 ? reg107 : (8'hb9))))});
            end
          reg109 <= (reg107[(4'he):(4'ha)] != $unsigned($unsigned((~^wire90[(4'hb):(1'h1)]))));
        end
      else
        begin
          reg99 <= wire95;
        end
      reg110 <= ((wire97 ?
          $unsigned({((8'hbb) ?
                  reg100 : (8'hb0))}) : $signed(reg107[(4'hb):(2'h3)])) | reg105[(2'h3):(2'h3)]);
    end
  assign wire111 = ($unsigned({((reg102 == wire93) ~^ $unsigned((8'hab)))}) | $unsigned(($unsigned(reg100) ?
                       reg108[(5'h12):(1'h0)] : $signed(((8'haf) ?
                           reg108 : reg109)))));
  assign wire112 = $unsigned(((+$signed((reg107 ?
                       reg101 : wire90))) == ({wire95} & (&reg99))));
  assign wire113 = ((wire96 ?
                       (wire88 ?
                           ($unsigned(reg99) > reg109[(2'h2):(1'h1)]) : $signed(reg106)) : wire111) ~^ ($signed(reg105) ?
                       (~|{reg110}) : $unsigned({{reg98, reg103}})));
  assign wire114 = (wire96[(1'h0):(1'h0)] <<< ((wire91[(3'h4):(3'h4)] ?
                       ($signed(wire95) ?
                           {wire96,
                               reg102} : wire93[(4'hb):(3'h7)]) : wire97[(3'h6):(3'h4)]) * (wire90 ?
                       (|reg102[(1'h0):(1'h0)]) : ({(8'ha9)} && reg103))));
endmodule

module module22
#(parameter param82 = ((~^((~&((8'haf) ? (8'hbe) : (8'h9d))) >> {(+(8'ha0)), (|(8'h9d))})) ? (~|((((8'h9f) < (8'hb0)) ? ((8'hbb) ~^ (8'had)) : (~(8'hbb))) ^ ((&(8'ha4)) == ((8'ha9) * (8'hbc))))) : (^~({((8'hac) <<< (8'hb2))} <= (8'ha1)))))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h2c7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire26;
  input wire [(5'h12):(1'h0)] wire25;
  input wire [(4'he):(1'h0)] wire24;
  input wire [(4'hf):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire81;
  wire signed [(4'hb):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire79;
  wire signed [(5'h11):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire77;
  wire [(3'h6):(1'h0)] wire76;
  wire signed [(3'h4):(1'h0)] wire75;
  wire [(5'h10):(1'h0)] wire74;
  wire signed [(4'he):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire72;
  wire [(4'hb):(1'h0)] wire63;
  wire signed [(5'h14):(1'h0)] wire62;
  wire [(5'h12):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire60;
  wire [(4'h9):(1'h0)] wire59;
  wire signed [(4'ha):(1'h0)] wire58;
  wire signed [(3'h6):(1'h0)] wire57;
  wire [(3'h5):(1'h0)] wire27;
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire27,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
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
                 (1'h0)};
  assign wire27 = wire26;
  always
    @(posedge clk) begin
      if (wire27[(3'h5):(3'h5)])
        begin
          reg28 <= ({wire26[(2'h3):(1'h1)]} == $signed({{(8'ha2)}}));
          reg29 <= $signed($signed(wire24[(3'h4):(2'h2)]));
        end
      else
        begin
          reg28 <= $signed((+$signed($signed($signed(wire27)))));
          reg29 <= wire23[(4'ha):(1'h0)];
          reg30 <= (~^$unsigned(((wire24 ?
              (8'ha3) : (+reg29)) & {$signed((8'hbf))})));
          reg31 <= {$unsigned($signed((8'ha3)))};
          if (wire24[(3'h4):(1'h1)])
            begin
              reg32 <= reg29[(4'hc):(2'h2)];
              reg33 <= $unsigned(($signed(({reg31,
                  reg29} != $signed(wire23))) <<< $unsigned(((~^wire23) * (reg32 >>> (7'h41))))));
              reg34 <= wire23;
              reg35 <= {$unsigned(wire26[(3'h4):(2'h3)])};
              reg36 <= reg32;
            end
          else
            begin
              reg32 <= wire25;
              reg33 <= (^reg32);
              reg34 <= $signed(($unsigned({wire25[(2'h3):(1'h1)],
                      $signed(reg28)}) ?
                  $signed(wire25[(1'h0):(1'h0)]) : (|(^~reg30))));
              reg35 <= $unsigned($unsigned((((~&reg36) ?
                  $signed(wire26) : (wire27 ?
                      reg29 : (8'hac))) && $unsigned($signed(reg28)))));
              reg36 <= ((~|((8'hb4) ? $signed((-reg33)) : reg30)) ?
                  reg33[(3'h7):(3'h6)] : reg29);
            end
        end
      if ((($unsigned((wire26[(3'h4):(1'h0)] == (reg32 ^~ reg35))) ?
          (^((reg28 ?
              (7'h40) : reg36) - $unsigned(reg35))) : $unsigned($unsigned($signed(reg35)))) >>> (($unsigned((reg32 <= wire23)) ?
              $signed(reg35[(4'h9):(1'h1)]) : ($signed(wire24) - $unsigned(reg31))) ?
          ((|reg31[(3'h5):(1'h0)]) ?
              (-(!reg36)) : $unsigned({(7'h42)})) : (((8'h9d) ?
              (wire25 > reg36) : (reg36 < reg32)) ~^ $signed($unsigned(reg32))))))
        begin
          if (wire27[(1'h1):(1'h1)])
            begin
              reg37 <= reg28;
              reg38 <= ((wire24 > (8'hb6)) ?
                  wire25 : ($unsigned((reg37[(3'h5):(3'h5)] ?
                      reg30 : reg31)) * $signed(($unsigned(wire25) ~^ (reg37 ?
                      reg31 : (7'h42))))));
            end
          else
            begin
              reg37 <= $unsigned((-$unsigned((reg33[(2'h3):(2'h3)] ?
                  wire26 : $unsigned(reg30)))));
              reg38 <= wire23;
              reg39 <= {$unsigned((+(-$unsigned(reg31)))),
                  {(~|$signed((wire24 <<< wire26))),
                      $signed(((8'hb4) + (!reg36)))}};
            end
        end
      else
        begin
          reg37 <= $signed(reg32);
          if (reg33[(2'h3):(2'h3)])
            begin
              reg38 <= ($unsigned((&$signed((reg30 ?
                  reg38 : reg38)))) & (reg33 ?
                  ($signed(reg33) + reg30) : reg30));
              reg39 <= wire25[(3'h6):(2'h2)];
            end
          else
            begin
              reg38 <= reg33[(3'h7):(3'h7)];
              reg39 <= reg29;
              reg40 <= reg31;
              reg41 <= (((reg32 >>> wire23[(3'h5):(1'h0)]) ^ reg28[(4'h9):(1'h0)]) | (~reg39));
              reg42 <= (($signed(wire27[(2'h2):(1'h1)]) ?
                  $unsigned($unsigned({wire27})) : ((~reg39[(1'h0):(1'h0)]) > (reg31 ?
                      $signed(reg35) : {reg38,
                          reg40}))) >>> (~&$unsigned(((reg39 ^~ reg40) >>> reg38[(4'hf):(1'h0)]))));
            end
          reg43 <= (-(reg36[(1'h1):(1'h0)] >>> reg29[(4'hc):(4'hb)]));
          reg44 <= $signed(($signed($signed((reg31 ? wire23 : reg38))) ?
              (^~($signed(reg29) ?
                  reg33[(3'h7):(3'h6)] : reg40[(4'hd):(1'h1)])) : $signed((~wire23))));
          reg45 <= (-(!wire26));
        end
      reg46 <= (+{(((!reg43) ? $signed(reg45) : {reg43}) + (^$signed(reg45)))});
      if ((-(reg33 == ((&$signed((8'hac))) << reg35))))
        begin
          if (wire24)
            begin
              reg47 <= reg37;
              reg48 <= (reg39 < $unsigned((8'hbf)));
            end
          else
            begin
              reg47 <= ($signed($unsigned(reg39)) ?
                  $unsigned(((!(reg39 ? wire24 : (8'ha6))) ?
                      ((-reg44) ?
                          reg28 : (^~reg44)) : (~|(~|reg36)))) : ((~^(8'hbd)) == (8'h9c)));
              reg48 <= wire24;
              reg49 <= reg36[(3'h6):(3'h6)];
              reg50 <= $unsigned(((({wire27,
                      reg31} | reg42[(4'hb):(2'h3)]) <= $signed(((7'h41) ?
                      reg30 : reg34))) ?
                  $signed(wire23) : $unsigned(reg44[(2'h3):(1'h0)])));
              reg51 <= reg36;
            end
          reg52 <= ($signed($signed($signed((reg51 != (8'hae))))) - $signed(({reg38,
              (reg41 >= reg38)} >> $signed((reg28 > (7'h40))))));
          if ($unsigned($signed((^~($unsigned(wire26) != ((8'hab) * wire24))))))
            begin
              reg53 <= (({reg30} ~^ wire26) + {reg35});
              reg54 <= wire26;
              reg55 <= $unsigned((^$unsigned((+(^~reg46)))));
            end
          else
            begin
              reg53 <= (^(~|$signed(wire23[(4'ha):(3'h5)])));
              reg54 <= $unsigned($signed(reg52));
              reg55 <= reg48;
              reg56 <= $unsigned((-reg45[(2'h3):(1'h0)]));
            end
        end
      else
        begin
          reg47 <= $unsigned(reg39[(4'hf):(1'h0)]);
          if (($signed(reg51) >>> (^~reg32[(1'h1):(1'h1)])))
            begin
              reg48 <= {$signed((wire27 >>> wire26[(3'h6):(3'h5)])),
                  ((reg42[(4'hc):(1'h0)] >> reg41[(4'h8):(3'h4)]) < $unsigned(reg37[(3'h6):(3'h4)]))};
              reg49 <= (8'hb0);
              reg50 <= (!$signed($signed($signed((reg51 == (8'ha3))))));
            end
          else
            begin
              reg48 <= (($signed((+$signed(reg46))) ~^ (wire24 ?
                  reg48 : reg43[(5'h10):(4'h8)])) | $signed(reg47));
            end
          if ({$unsigned(reg47),
              {$signed(reg38), ((7'h43) < reg42[(4'ha):(3'h5)])}})
            begin
              reg51 <= $signed(reg43);
            end
          else
            begin
              reg51 <= $unsigned({reg55[(4'h8):(3'h5)], wire26[(3'h6):(2'h2)]});
              reg52 <= (^~$unsigned((!reg53[(3'h6):(3'h6)])));
            end
        end
    end
  assign wire57 = reg37;
  assign wire58 = {reg52[(3'h4):(1'h1)]};
  assign wire59 = $signed(({{$signed(reg51), $signed(reg54)}} ?
                      $signed($signed(reg50[(3'h7):(2'h3)])) : $signed(reg36)));
  assign wire60 = reg43[(4'hd):(4'hc)];
  assign wire61 = (reg29 || (|$signed(($unsigned(wire59) << reg45[(4'h8):(1'h0)]))));
  assign wire62 = reg38;
  assign wire63 = wire24[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg64 <= {$signed(((7'h41) ?
              ((8'hac) ?
                  (wire61 ?
                      wire63 : (7'h41)) : (^reg34)) : {reg33[(1'h1):(1'h1)]})),
          (reg48[(4'ha):(3'h7)] == ((+(-(8'haf))) ?
              $signed((wire61 ? reg55 : reg34)) : (8'hb1)))};
      if (reg49)
        begin
          reg65 <= $unsigned(wire26[(2'h3):(2'h2)]);
          if ((8'haf))
            begin
              reg66 <= reg47[(1'h0):(1'h0)];
              reg67 <= (-(($unsigned(wire23[(4'hd):(3'h6)]) ?
                  reg45[(2'h3):(1'h0)] : ($unsigned(reg39) <<< {reg33})) ~^ (~&$unsigned(wire57))));
              reg68 <= reg48[(3'h4):(1'h0)];
            end
          else
            begin
              reg66 <= (reg54 <= reg35);
              reg67 <= (|$signed((!wire25[(4'h9):(2'h2)])));
            end
          reg69 <= $unsigned(((&reg41[(1'h1):(1'h0)]) >> $signed({(^reg30)})));
          reg70 <= $unsigned($signed((^reg44[(4'h8):(2'h2)])));
          reg71 <= {(8'haf)};
        end
      else
        begin
          reg65 <= (|(~$unsigned((reg66[(3'h4):(2'h2)] ?
              (reg37 <<< wire26) : (reg70 ? (8'hb6) : (8'hb6))))));
          reg66 <= wire59;
          reg67 <= $unsigned(((~&(|$signed(wire61))) ?
              ({$unsigned(reg56), reg70[(1'h1):(1'h0)]} ?
                  ((-reg35) ? $unsigned(wire24) : (reg42 & reg38)) : ((8'ha9) ?
                      (reg50 ? reg64 : reg28) : (!reg54))) : (reg52 < (reg70 ?
                  ((8'h9c) ^ reg34) : (~&reg31)))));
          reg68 <= ((7'h44) ? $signed(wire25) : reg48);
          reg69 <= (+(+{(+(^~reg47))}));
        end
    end
  assign wire72 = $unsigned((($unsigned(reg54[(3'h7):(3'h6)]) ^ reg41[(3'h5):(1'h1)]) ?
                      $signed({$signed((8'ha6)),
                          ((8'hbe) >= reg68)}) : $unsigned(wire23)));
  assign wire73 = $unsigned(reg65);
  assign wire74 = reg39;
  assign wire75 = $unsigned(reg50);
  assign wire76 = reg33;
  assign wire77 = $signed((-(+wire25)));
  assign wire78 = (((wire24 * (reg54 ?
                          (|(8'ha3)) : (^~(8'ha2)))) ^ (^(wire62[(2'h3):(1'h0)] ?
                          (reg47 & (8'hbd)) : reg40))) ?
                      wire76[(2'h2):(2'h2)] : (~^(((~^reg64) ^~ wire26[(2'h3):(1'h1)]) ?
                          {(~reg41), {reg64, reg36}} : reg64[(2'h3):(1'h1)])));
  assign wire79 = reg55[(2'h3):(1'h0)];
  assign wire80 = reg43[(1'h0):(1'h0)];
  assign wire81 = {$unsigned(wire60[(2'h2):(1'h0)]), (8'hb4)};
endmodule
