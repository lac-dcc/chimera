module top
#(parameter param151 = (~{(({(8'hb4), (8'ha9)} <<< (~^(8'haa))) ~^ ((!(8'hb9)) >= ((8'ha5) ? (8'hb4) : (8'hb6))))}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1f0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire3;
  wire [(4'ha):(1'h0)] wire150;
  wire signed [(2'h2):(1'h0)] wire137;
  wire [(4'ha):(1'h0)] wire136;
  wire [(4'hf):(1'h0)] wire135;
  wire [(2'h3):(1'h0)] wire134;
  wire signed [(5'h15):(1'h0)] wire133;
  wire signed [(2'h2):(1'h0)] wire132;
  wire [(4'h9):(1'h0)] wire131;
  wire signed [(4'hf):(1'h0)] wire130;
  wire signed [(4'hb):(1'h0)] wire129;
  wire [(4'he):(1'h0)] wire128;
  wire signed [(3'h6):(1'h0)] wire127;
  wire [(5'h11):(1'h0)] wire126;
  wire signed [(5'h15):(1'h0)] wire117;
  wire [(4'ha):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire114;
  reg [(5'h12):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg148 = (1'h0);
  reg [(5'h12):(1'h0)] reg147 = (1'h0);
  reg [(3'h6):(1'h0)] reg146 = (1'h0);
  reg [(2'h3):(1'h0)] reg145 = (1'h0);
  reg signed [(4'he):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg143 = (1'h0);
  reg [(4'hf):(1'h0)] reg142 = (1'h0);
  reg [(4'hc):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg140 = (1'h0);
  reg [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(4'h9):(1'h0)] reg138 = (1'h0);
  reg [(5'h13):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg124 = (1'h0);
  reg [(3'h7):(1'h0)] reg123 = (1'h0);
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg [(4'hf):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg119 = (1'h0);
  reg [(5'h10):(1'h0)] reg118 = (1'h0);
  assign y = {wire150,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire117,
                 wire116,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire114,
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
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  assign wire4 = (~&(&wire1[(1'h0):(1'h0)]));
  assign wire5 = $unsigned($signed(({wire4[(3'h5):(2'h2)],
                         (wire0 ? (8'h9e) : (8'hb4))} ?
                     {$unsigned((8'ha8))} : ($signed((8'h9e)) >= wire3[(1'h1):(1'h0)]))));
  assign wire6 = ($unsigned($signed(($signed(wire3) ?
                     wire0 : (~|wire2)))) ~^ {wire2});
  assign wire7 = $signed(wire3[(1'h0):(1'h0)]);
  module8 #() modinst115 (wire114, clk, wire2, wire7, wire5, wire1, wire6);
  assign wire116 = {$signed($signed((~|(wire0 ? wire3 : wire114))))};
  assign wire117 = $signed(wire5[(5'h10):(4'ha)]);
  always
    @(posedge clk) begin
      reg118 <= (|(wire114[(4'h8):(2'h2)] ?
          ((wire117[(5'h10):(5'h10)] ?
                  (wire117 ? wire7 : wire116) : $signed(wire1)) ?
              wire6[(2'h2):(2'h2)] : wire6) : ($unsigned((wire114 * wire3)) || wire114[(3'h4):(2'h3)])));
      reg119 <= (~(($unsigned({wire1,
              (8'had)}) || $signed(wire2[(3'h5):(2'h3)])) ?
          $signed((&wire114[(4'h8):(1'h0)])) : wire116[(2'h2):(1'h1)]));
      reg120 <= $signed(reg118);
      reg121 <= ((^($unsigned($signed(wire6)) ?
          $unsigned(wire7[(3'h4):(1'h0)]) : $unsigned((8'h9e)))) >> (wire3 || reg119[(1'h0):(1'h0)]));
      if ((8'hb7))
        begin
          reg122 <= (-$signed((^~$unsigned((wire7 * wire2)))));
        end
      else
        begin
          reg122 <= $signed(({(|(^~wire7)),
              {wire3[(1'h0):(1'h0)],
                  reg120}} * $signed(wire117[(4'hc):(4'h9)])));
          reg123 <= (wire4 ?
              (~|$unsigned($unsigned($unsigned((8'haf))))) : (~^wire1));
          reg124 <= wire7;
          reg125 <= $signed(((reg124[(2'h3):(2'h3)] ?
              ($signed(reg122) < wire6[(3'h5):(1'h0)]) : {(wire6 ?
                      wire1 : wire4)}) ^ $signed($signed((~&reg119)))));
        end
    end
  assign wire126 = wire3[(2'h3):(2'h3)];
  assign wire127 = ((reg119[(1'h0):(1'h0)] + wire2[(3'h4):(1'h1)]) ?
                       {$unsigned(wire4),
                           (~&$unsigned((~|reg121)))} : $unsigned($unsigned(($signed((7'h41)) | reg121[(2'h2):(2'h2)]))));
  assign wire128 = ($unsigned($unsigned(reg124)) - {(wire116 ?
                           (wire126 ? {wire117} : $unsigned(reg121)) : wire1)});
  assign wire129 = $unsigned((wire7[(4'he):(1'h1)] ?
                       ($signed((8'hba)) ?
                           wire6[(2'h3):(1'h1)] : ((wire128 & (8'hbc)) > {wire0})) : $signed($unsigned((wire0 ?
                           reg122 : wire0)))));
  assign wire130 = $signed(wire2[(5'h14):(2'h2)]);
  assign wire131 = $signed({($unsigned(wire116) ?
                           ((reg123 ?
                               (8'ha8) : wire7) >> $signed(wire117)) : (+$unsigned(reg123)))});
  assign wire132 = reg124;
  assign wire133 = wire3;
  assign wire134 = wire131[(1'h1):(1'h1)];
  assign wire135 = ((~^(^~($unsigned(wire128) ?
                           reg122 : reg119[(2'h3):(1'h0)]))) ?
                       $signed(reg121[(5'h11):(4'hb)]) : wire117[(4'hc):(1'h1)]);
  assign wire136 = {(reg119[(1'h0):(1'h0)] << {(8'hbd)}),
                       (reg125 ?
                           ($unsigned($signed(wire7)) ?
                               $signed({wire2}) : ($unsigned(wire127) >> (wire135 ^~ (8'ha1)))) : $unsigned($signed($unsigned((8'hb4)))))};
  assign wire137 = {wire134[(2'h2):(1'h0)]};
  always
    @(posedge clk) begin
      reg138 <= (((+$unsigned((+(8'ha1)))) ~^ ((reg124 | (~&wire4)) ?
              ((wire134 ?
                  reg119 : reg125) | reg118[(4'hd):(4'h9)]) : wire128)) ?
          wire6 : {(8'ha2),
              (($unsigned(wire126) <<< reg120) - reg124[(3'h5):(3'h5)])});
      reg139 <= reg138[(2'h2):(1'h1)];
      if ((wire133[(4'hb):(2'h3)] ?
          ((~|((wire133 ? wire127 : reg124) ?
              $signed((8'hb9)) : ((8'hb7) | reg118))) == reg119[(1'h0):(1'h0)]) : ((!((|wire5) ?
                  wire135 : (&wire4))) ?
              ((~^(~&(8'h9d))) >>> (((8'hba) ?
                  (8'hb1) : wire135) != $unsigned(reg120))) : wire1[(3'h6):(3'h6)])))
        begin
          if ((reg124 * $signed(wire117)))
            begin
              reg140 <= reg123[(3'h4):(3'h4)];
              reg141 <= $unsigned(($signed(wire127[(3'h6):(2'h2)]) + (|wire133)));
            end
          else
            begin
              reg140 <= (~{((wire130 ^~ (wire137 ?
                      reg140 : wire129)) || (^~reg120[(4'hd):(1'h0)]))});
              reg141 <= (&$unsigned($unsigned(((reg121 ?
                  wire7 : wire134) <<< wire137))));
            end
          reg142 <= (~^($signed($unsigned((~|reg124))) ?
              reg123 : $signed((!$signed(wire2)))));
          if ((({wire7, ({wire6, reg122} && $unsigned(wire1))} ?
              (((reg138 ? wire132 : wire116) < (|reg122)) ?
                  ((wire133 * reg138) ?
                      (~(8'h9c)) : (reg122 ?
                          wire116 : wire0)) : $unsigned(reg119)) : $unsigned($signed(wire128))) + ($signed(($unsigned(wire127) >> $signed(wire128))) ?
              (($unsigned((8'ha2)) ?
                  (|wire6) : $signed(wire129)) == (wire131[(3'h5):(2'h3)] ?
                  (reg122 != wire0) : $unsigned(reg121))) : ((reg120[(1'h1):(1'h1)] <= wire5[(3'h5):(3'h4)]) ~^ $unsigned(wire134[(2'h2):(2'h2)])))))
            begin
              reg143 <= (wire3 + wire133[(3'h7):(2'h3)]);
              reg144 <= ($signed((wire134[(2'h3):(2'h2)] ?
                  ({(8'hba),
                      reg121} << (wire128 << reg121)) : wire3)) << wire137);
              reg145 <= $unsigned($signed(wire129));
              reg146 <= $unsigned((~&$signed($signed($unsigned((8'hab))))));
            end
          else
            begin
              reg143 <= $signed((!(wire6[(3'h5):(2'h2)] <<< ($signed((8'hb2)) & (wire4 ?
                  reg140 : reg143)))));
              reg144 <= wire126[(4'h8):(1'h1)];
            end
          reg147 <= $unsigned($signed(reg118));
          if (wire130)
            begin
              reg148 <= (|wire132);
            end
          else
            begin
              reg148 <= (&((((8'hab) & $signed(wire129)) ?
                  reg123 : (|$unsigned(reg146))) <= wire6[(3'h5):(3'h5)]));
              reg149 <= ($unsigned(($signed({wire127,
                      wire116}) && $unsigned((-reg120)))) ?
                  $signed((^(|{wire128,
                      wire6}))) : (!$unsigned((wire4[(3'h5):(1'h0)] ?
                      wire117 : wire136))));
            end
        end
      else
        begin
          reg140 <= reg118;
          if ($signed((8'hae)))
            begin
              reg141 <= ($unsigned(wire136[(4'h9):(3'h6)]) ?
                  (wire0[(3'h4):(3'h4)] <= ($unsigned((wire3 || wire130)) ^~ $signed(wire5))) : (($unsigned($unsigned(reg144)) != $unsigned({wire134,
                          wire3})) ?
                      (^~wire4[(3'h7):(1'h0)]) : reg140));
            end
          else
            begin
              reg141 <= reg140;
              reg142 <= {(&$signed(($signed(wire133) ?
                      $unsigned((8'ha2)) : (^reg140))))};
              reg143 <= ($unsigned(reg146[(1'h0):(1'h0)]) << reg146[(1'h1):(1'h1)]);
              reg144 <= {(~&(8'ha8)),
                  (&($signed($unsigned(wire6)) << wire133))};
            end
          reg145 <= wire2;
          reg146 <= $signed((wire6 ?
              {(wire3 ? $signed(wire137) : (8'hbe))} : $signed((^(reg139 ?
                  reg122 : reg140)))));
          reg147 <= $signed($unsigned(wire129));
        end
    end
  assign wire150 = reg140[(1'h0):(1'h0)];
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h252):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire11;
  input wire [(4'hb):(1'h0)] wire12;
  input wire [(2'h2):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire86;
  wire [(3'h5):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire38;
  wire [(2'h3):(1'h0)] wire53;
  reg [(2'h3):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg112 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg110 = (1'h0);
  reg [(4'hf):(1'h0)] reg109 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg107 = (1'h0);
  reg [(3'h4):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg105 = (1'h0);
  reg [(4'hc):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(5'h14):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg [(4'h9):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(5'h12):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  assign y = {wire86,
                 wire25,
                 wire38,
                 wire53,
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
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= $signed(wire13[(2'h2):(1'h0)]);
      if ($signed(reg14[(4'h9):(1'h1)]))
        begin
          if ($unsigned($unsigned((-(8'haa)))))
            begin
              reg15 <= ({(~&wire10), $unsigned(wire11)} ?
                  wire13[(1'h0):(1'h0)] : reg14);
              reg16 <= {wire11[(4'hd):(2'h2)]};
              reg17 <= wire9;
            end
          else
            begin
              reg15 <= reg15;
              reg16 <= {$signed((^~((8'hbd) ?
                      (wire11 ? (8'hae) : wire10) : ((8'haa) ?
                          wire13 : reg16))))};
              reg17 <= (~&{$signed((-(wire13 ? wire9 : reg16))),
                  (wire10 | reg17[(5'h10):(5'h10)])});
              reg18 <= wire9[(5'h12):(1'h0)];
              reg19 <= ($unsigned(wire12[(3'h5):(3'h4)]) ^~ (wire11[(1'h0):(1'h0)] ^~ (8'ha9)));
            end
          reg20 <= wire9;
        end
      else
        begin
          if (({((reg14[(4'hb):(3'h6)] == $unsigned((8'hbf))) ~^ (~^(&reg20)))} <<< reg16))
            begin
              reg15 <= wire13[(1'h1):(1'h1)];
              reg16 <= (~&((8'hbf) >= reg20[(2'h3):(2'h3)]));
              reg17 <= ({(~^$unsigned((~&reg15))),
                  reg15[(1'h0):(1'h0)]} | ($unsigned(reg16) ?
                  (wire13[(2'h2):(1'h1)] <= (wire10 == $signed(wire9))) : $unsigned((&reg16))));
            end
          else
            begin
              reg15 <= reg18[(4'hb):(4'h8)];
            end
          reg18 <= (8'hb0);
          if ($unsigned(wire9[(2'h3):(2'h2)]))
            begin
              reg19 <= (wire9 ?
                  {({{(8'ha4), wire10}, {wire9}} ?
                          ($signed(wire9) ^ (^wire9)) : wire11)} : $signed({((^~wire10) ?
                          $unsigned(wire12) : (wire9 ? wire12 : reg15)),
                      $signed((+(8'hbd)))}));
              reg20 <= reg19[(4'h8):(4'h8)];
            end
          else
            begin
              reg19 <= $signed($unsigned({(~&wire10[(4'hb):(2'h3)]),
                  (~|$unsigned(wire13))}));
              reg20 <= wire11;
              reg21 <= $signed($unsigned((|(!reg18[(1'h0):(1'h0)]))));
            end
          reg22 <= (|wire10);
        end
      reg23 <= (reg21[(2'h2):(2'h2)] ?
          (~$signed(reg17)) : {{(wire12[(2'h3):(1'h0)] ?
                      ((8'hb4) ? reg17 : reg21) : reg14),
                  (~{wire10})},
              ((wire10 || $unsigned(reg18)) && (|reg14[(1'h0):(1'h0)]))});
      reg24 <= ((reg16[(2'h2):(1'h1)] ~^ (8'hb5)) ?
          (+($signed({wire13}) | {(!reg23), (&(8'hb4))})) : reg20);
    end
  assign wire25 = ((^~reg23) ?
                      (wire13 ?
                          reg21[(3'h6):(3'h6)] : ((reg17 < (~reg15)) || wire13)) : $unsigned((|reg22[(2'h3):(1'h0)])));
  always
    @(posedge clk) begin
      if ($unsigned($signed((($unsigned((8'haf)) ?
              ((8'hb1) ? reg20 : (8'h9c)) : (wire12 ^ reg15)) ?
          $unsigned((reg18 + (8'hb7))) : reg20))))
        begin
          reg26 <= $unsigned(reg19[(2'h2):(2'h2)]);
          reg27 <= (8'ha7);
          if (($signed({(!(reg14 ? reg21 : reg15)),
              ((reg17 > reg18) ?
                  (reg18 ? (7'h44) : wire10) : ((8'hb4) ?
                      reg21 : reg23))}) & (+(((reg22 ? reg23 : reg21) ?
                  reg26 : (wire12 ? reg15 : wire25)) ?
              (8'hbd) : ($signed(reg22) * $signed(wire13))))))
            begin
              reg28 <= (^~($signed($signed($unsigned(wire13))) | {reg23[(3'h4):(2'h3)],
                  $signed({reg16})}));
            end
          else
            begin
              reg28 <= reg24[(4'ha):(3'h6)];
              reg29 <= reg27[(3'h5):(1'h1)];
              reg30 <= (~wire9[(5'h13):(4'hb)]);
            end
        end
      else
        begin
          reg26 <= reg20;
          if ($unsigned({reg16[(4'hd):(3'h5)], (|(7'h44))}))
            begin
              reg27 <= (reg17[(2'h3):(1'h0)] ?
                  reg17 : (reg19[(4'ha):(3'h5)] << reg18[(3'h5):(3'h5)]));
              reg28 <= (((((wire9 ? reg19 : reg15) && (+(8'hbb))) ?
                      $unsigned((reg19 ?
                          wire11 : (8'hbf))) : reg16[(3'h7):(3'h5)]) ?
                  ((^~{reg17}) && (-reg14)) : (((reg20 && reg20) ?
                          ((8'ha6) ? wire13 : reg20) : (8'hb1)) ?
                      $unsigned(reg30[(3'h5):(2'h3)]) : reg20[(3'h5):(1'h0)])) & wire13[(2'h2):(1'h1)]);
              reg29 <= reg14[(1'h0):(1'h0)];
              reg30 <= wire9;
            end
          else
            begin
              reg27 <= wire13;
              reg28 <= (|$signed((|(&(wire12 ? reg29 : reg19)))));
              reg29 <= (&reg18);
              reg30 <= (~&($unsigned({{reg18}}) >= ($unsigned((~(8'ha7))) ~^ $signed((wire10 ?
                  (7'h44) : reg28)))));
              reg31 <= $unsigned((^(|reg15)));
            end
          if ((&(|(7'h44))))
            begin
              reg32 <= reg30[(1'h0):(1'h0)];
              reg33 <= $unsigned($signed($unsigned(((reg21 << wire25) || wire25))));
              reg34 <= (^(reg29[(3'h6):(2'h3)] != reg30[(1'h1):(1'h0)]));
              reg35 <= reg18[(4'he):(3'h4)];
            end
          else
            begin
              reg32 <= ($unsigned(wire11) <<< $unsigned({((reg31 ?
                          wire11 : reg14) ?
                      $signed(reg35) : $unsigned(reg30)),
                  $unsigned((8'hb5))}));
            end
          reg36 <= reg21[(4'hb):(4'h8)];
        end
      reg37 <= reg32[(3'h4):(2'h3)];
    end
  assign wire38 = ($unsigned($signed((~|(~&wire12)))) || (^~reg32[(3'h4):(1'h0)]));
  module39 #() modinst54 (.wire44(reg28), .wire42(reg22), .y(wire53), .wire43(wire38), .clk(clk), .wire41(reg18), .wire40(reg20));
  module55 #() modinst87 (.wire60(reg19), .clk(clk), .wire57(reg37), .y(wire86), .wire56(reg16), .wire59(wire10), .wire58(wire11));
  always
    @(posedge clk) begin
      reg88 <= wire10;
      reg89 <= reg14[(2'h3):(2'h3)];
      if (wire25[(2'h2):(1'h1)])
        begin
          reg90 <= $signed($unsigned(($unsigned($unsigned(reg20)) ?
              $signed(wire25) : reg88)));
          reg91 <= ((reg34[(2'h2):(2'h2)] ?
              reg21[(4'h9):(3'h7)] : reg33[(4'h9):(3'h7)]) || ({wire86[(4'h8):(2'h2)]} ?
              ($signed((reg34 != (7'h42))) | reg15) : (8'ha7)));
          if ({($signed($signed(reg89[(5'h13):(5'h12)])) + $signed((((8'ha4) ~^ reg19) ?
                  (reg27 ? reg23 : (8'hbc)) : reg33)))})
            begin
              reg92 <= (reg91 <= reg17);
            end
          else
            begin
              reg92 <= reg23;
              reg93 <= ((&$signed(($signed(reg32) ? (+reg29) : {reg27}))) ?
                  (!{reg33}) : (-reg89[(3'h6):(1'h0)]));
            end
          reg94 <= ($signed((reg31[(3'h4):(3'h4)] ?
              $unsigned((reg93 ?
                  reg16 : reg27)) : $unsigned(reg33))) - (+(^reg93[(2'h3):(2'h3)])));
          reg95 <= reg19[(4'he):(4'hc)];
        end
      else
        begin
          if (((($unsigned(reg27[(4'h8):(3'h7)]) ?
                  reg95[(3'h6):(3'h6)] : (reg29 ?
                      (reg27 ?
                          reg26 : wire53) : (^reg24))) & (reg19[(4'hd):(3'h6)] && wire53)) ?
              wire25[(3'h4):(2'h3)] : reg22[(3'h7):(1'h1)]))
            begin
              reg90 <= reg22;
              reg91 <= reg34[(3'h4):(1'h0)];
              reg92 <= ($signed($unsigned((((8'hb7) ? wire9 : wire11) ?
                      ((8'hb4) ~^ reg31) : {wire12}))) ?
                  reg24 : ({((wire12 ? reg18 : reg18) ?
                              ((8'h9e) ^ reg22) : $unsigned(wire12))} ?
                      $signed({wire38[(4'hb):(3'h5)]}) : ((&wire13[(1'h1):(1'h1)]) ?
                          reg88 : reg19[(4'he):(1'h1)])));
            end
          else
            begin
              reg90 <= wire11;
              reg91 <= reg22;
              reg92 <= {$signed($signed((&(!reg33)))), reg29};
            end
          if ((~^$unsigned($unsigned((~^(wire12 >>> reg91))))))
            begin
              reg93 <= reg95[(1'h0):(1'h0)];
            end
          else
            begin
              reg93 <= reg22[(4'hb):(3'h5)];
              reg94 <= $unsigned($unsigned(($unsigned(reg14[(4'h9):(4'h8)]) >>> ($unsigned(reg88) && (8'ha6)))));
              reg95 <= ((reg21[(2'h2):(2'h2)] << wire38[(4'he):(1'h0)]) ?
                  reg94[(3'h4):(2'h2)] : reg14[(3'h4):(2'h2)]);
              reg96 <= ((({{wire25, reg16}} ?
                  reg34[(1'h0):(1'h0)] : reg21) * $signed((^~$signed(reg92)))) | reg34[(2'h2):(1'h0)]);
              reg97 <= $signed((reg27 ?
                  $unsigned(($unsigned(reg37) <<< $signed(reg89))) : {reg18,
                      $unsigned(reg93)}));
            end
          reg98 <= wire53;
          reg99 <= reg31;
        end
      if ((!wire11[(5'h11):(4'hf)]))
        begin
          reg100 <= $unsigned((!reg97[(3'h7):(1'h1)]));
          reg101 <= $signed(reg31);
          reg102 <= $signed((^~{$signed($signed(reg90))}));
          reg103 <= reg96[(1'h1):(1'h1)];
          reg104 <= reg90[(1'h0):(1'h0)];
        end
      else
        begin
          reg100 <= ($unsigned((!(+(!reg89)))) ?
              (~&$signed({((7'h41) ? wire10 : (8'ha9))})) : reg88);
          reg101 <= reg15[(3'h6):(2'h2)];
          reg102 <= (^((7'h41) ?
              ((8'ha7) ?
                  {(wire25 >>> reg103),
                      reg100[(1'h1):(1'h1)]} : $signed((reg22 ?
                      reg28 : reg30))) : reg97[(4'h8):(3'h6)]));
        end
      if (((7'h40) | (((+$unsigned(reg88)) ?
          $signed((^reg31)) : ((reg33 ? (8'hb0) : reg102) ?
              (&reg32) : $signed((8'ha9)))) ^ wire53)))
        begin
          if (($signed($signed((8'hb0))) ?
              reg17[(5'h14):(5'h11)] : $unsigned(reg103)))
            begin
              reg105 <= $signed(($signed((^~(reg104 != wire38))) < (+reg93)));
              reg106 <= ((7'h43) ?
                  reg21 : {$signed(($signed(reg102) ?
                          (reg101 ? reg90 : reg92) : (!wire10))),
                      ($signed((reg16 - reg27)) & (reg17[(1'h1):(1'h1)] ?
                          {reg94} : (reg34 ? reg29 : reg37)))});
              reg107 <= ((8'hb0) - $signed((~reg21[(4'h8):(1'h1)])));
              reg108 <= reg95;
              reg109 <= ({(((reg96 ?
                          reg20 : (8'hb1)) + (reg26 == reg26)) < $unsigned({wire86,
                          reg17}))} ?
                  $signed(($unsigned($unsigned(reg92)) ?
                      ((reg23 ? reg15 : wire13) ?
                          $signed(reg22) : {reg19}) : ((reg37 | reg27) << reg32[(1'h1):(1'h1)]))) : $signed(reg20));
            end
          else
            begin
              reg105 <= (reg17[(1'h0):(1'h0)] >= {$unsigned($unsigned((reg96 ?
                      reg106 : (8'hb0)))),
                  (^({reg93} ? (^reg24) : (~|reg26)))});
            end
          reg110 <= $signed({$signed($signed($signed(reg105)))});
          reg111 <= ($signed((((reg106 != reg30) >> (&reg27)) ?
                  $signed((reg91 ?
                      reg90 : reg16)) : $unsigned(reg103[(3'h5):(2'h2)]))) ?
              {$unsigned(((^~reg37) + {reg97, reg14})),
                  reg14[(4'h9):(2'h2)]} : ($unsigned(({(8'had)} ^~ {wire11,
                      reg96})) ?
                  (reg21[(3'h6):(3'h4)] | $unsigned((reg102 ?
                      reg29 : reg37))) : reg22[(2'h2):(1'h1)]));
        end
      else
        begin
          reg105 <= $signed({{reg97, reg91[(1'h1):(1'h0)]},
              wire53[(1'h1):(1'h0)]});
          reg106 <= reg30[(3'h5):(3'h4)];
          reg107 <= {reg108};
          if ($unsigned($unsigned((reg103[(4'hd):(4'hd)] ?
              $unsigned(reg101[(3'h4):(2'h3)]) : $signed(wire13)))))
            begin
              reg108 <= (^~$signed((((reg35 ? (8'hbc) : reg111) ?
                  (reg19 << wire10) : $signed(reg88)) ^ ((^~reg97) >>> (~reg98)))));
              reg109 <= reg104[(1'h1):(1'h1)];
              reg110 <= $signed(reg100[(1'h0):(1'h0)]);
              reg111 <= reg109[(4'hb):(4'ha)];
            end
          else
            begin
              reg108 <= (!$signed(reg109));
              reg109 <= reg107[(3'h7):(1'h0)];
              reg110 <= $signed(($unsigned($unsigned($unsigned(reg18))) >>> (~|$signed(reg102))));
              reg111 <= (reg30[(3'h5):(2'h2)] && {reg35[(3'h5):(2'h2)],
                  $unsigned(((~&(8'hb7)) ? (~^reg33) : (&wire12)))});
              reg112 <= $unsigned($unsigned(({{reg100, reg14},
                  reg29} ^ (wire12 && $signed((8'ha1))))));
            end
          reg113 <= ($signed($signed((wire86 ?
                  $unsigned(wire13) : (reg21 ~^ reg29)))) ?
              ($signed(reg109) ?
                  wire13 : $unsigned(($unsigned(reg105) << {reg103,
                      reg96}))) : $unsigned((reg112 ?
                  reg15[(3'h7):(3'h4)] : $unsigned((reg36 <= wire53)))));
        end
    end
endmodule

module module55
#(parameter param85 = (((+(^~{(8'ha3)})) == (({(8'hb1)} ? (^(8'h9e)) : {(8'ha8)}) >>> (~&(~|(7'h43))))) ? (-((^~(^~(8'ha1))) ? {((7'h40) * (8'ha2)), ((8'ha4) ? (8'hb3) : (8'hb4))} : (~&(^(8'hb2))))) : (&(((+(8'hb4)) ? ((8'had) ? (7'h43) : (8'ha6)) : ((8'hb0) ^ (8'hb1))) <<< (((8'hb6) < (7'h44)) ? ((8'hba) || (8'hb9)) : ((8'haf) ? (7'h41) : (8'h9e)))))))
(y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire60;
  input wire signed [(3'h5):(1'h0)] wire59;
  input wire [(2'h3):(1'h0)] wire58;
  input wire signed [(4'h8):(1'h0)] wire57;
  input wire signed [(4'hd):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire83;
  wire signed [(5'h10):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire81;
  wire signed [(3'h4):(1'h0)] wire80;
  wire signed [(4'ha):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire78;
  wire signed [(5'h13):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire75;
  wire signed [(5'h10):(1'h0)] wire74;
  wire [(4'h9):(1'h0)] wire73;
  wire [(4'ha):(1'h0)] wire72;
  wire signed [(2'h2):(1'h0)] wire66;
  wire [(2'h3):(1'h0)] wire65;
  wire signed [(4'he):(1'h0)] wire64;
  wire [(2'h3):(1'h0)] wire63;
  wire [(5'h14):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire61;
  reg [(4'hb):(1'h0)] reg71 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire61 = $signed((($signed(wire60[(2'h2):(1'h0)]) + (wire57 ?
                      wire57[(3'h7):(3'h5)] : ((8'haf) ?
                          wire57 : wire60))) ^ $unsigned({(wire59 ?
                          wire56 : (8'ha9))})));
  assign wire62 = (+wire60[(3'h5):(2'h3)]);
  assign wire63 = $unsigned((~wire60));
  assign wire64 = wire62[(5'h12):(5'h10)];
  assign wire65 = {wire60,
                      $signed((wire63 ?
                          ((~&wire63) ?
                              (wire57 * wire59) : $signed(wire60)) : {(wire56 > wire58)}))};
  assign wire66 = ($signed({wire62[(4'h8):(2'h3)], (~&wire60)}) ?
                      wire56 : wire58);
  always
    @(posedge clk) begin
      reg67 <= wire61;
      reg68 <= ($signed(((~|wire61[(3'h5):(3'h4)]) == (-(8'ha9)))) | {(($unsigned(wire58) + (wire63 ?
                  wire64 : wire57)) ?
              ($unsigned(wire57) ? reg67 : {wire64}) : $signed(wire62)),
          wire60});
      reg69 <= wire65;
      reg70 <= (&(-(((wire65 ? (8'h9f) : reg68) ? (~^wire60) : (-wire62)) ?
          $signed((wire64 ?
              (8'ha3) : wire56)) : $unsigned($unsigned((8'hb3))))));
      reg71 <= wire59;
    end
  assign wire72 = (($unsigned(wire57[(4'h8):(3'h7)]) ?
                          ((~&(wire59 | reg67)) >>> (wire58 ?
                              (~|wire57) : $signed(reg71))) : (~^(wire60 ~^ reg71))) ?
                      ($signed((wire61[(2'h2):(2'h2)] ?
                              (wire56 >>> (8'hb5)) : $signed(wire57))) ?
                          wire64[(3'h7):(1'h1)] : ({wire62[(2'h3):(2'h2)],
                                  (wire61 + reg70)} ?
                              $signed(wire61) : {(|reg67),
                                  $signed(wire57)})) : (|({$signed(wire64)} + reg67)));
  assign wire73 = $signed((wire61[(3'h7):(2'h3)] ?
                      $signed((wire66 + (|(8'hb4)))) : $signed($unsigned(reg69))));
  assign wire74 = (((wire64[(4'h9):(1'h1)] >>> wire58) ?
                      {reg71[(4'h9):(2'h2)]} : wire65) >>> {(~^wire73)});
  assign wire75 = wire66;
  assign wire76 = ((^(($signed((8'h9c)) ? $signed((8'hb3)) : (8'hab)) ?
                      reg68 : wire62)) ~^ (~|($signed({reg67}) > $unsigned((wire64 ?
                      wire56 : reg67)))));
  assign wire77 = wire59;
  assign wire78 = $unsigned(wire75[(3'h6):(2'h3)]);
  assign wire79 = (~^($signed(wire78[(2'h2):(2'h2)]) | $signed(((|wire63) <= wire57[(1'h0):(1'h0)]))));
  assign wire80 = ($signed($unsigned($unsigned($unsigned(wire63)))) ^ (!($signed((wire79 ?
                          reg71 : wire65)) ?
                      (^~(wire75 ?
                          reg68 : (8'h9d))) : $signed($unsigned(wire78)))));
  assign wire81 = $unsigned(wire66[(2'h2):(2'h2)]);
  assign wire82 = ($unsigned(wire78) - $signed($signed($unsigned(wire66))));
  assign wire83 = $unsigned($unsigned({((!wire57) ?
                          (&wire81) : ((8'h9d) ? wire79 : reg69))}));
  assign wire84 = reg68[(1'h0):(1'h0)];
endmodule

module module39
#(parameter param51 = (8'hb1), 
parameter param52 = ({({(param51 ? (8'ha2) : param51)} - (param51 ? param51 : (param51 ~^ param51))), ((~^(-param51)) ? param51 : ((&param51) ? param51 : param51))} ? (-((8'ha7) ? ((param51 ? param51 : param51) > (param51 ? (8'ha8) : (8'h9d))) : {(^~param51)})) : (!((~&((8'hb0) & param51)) << {(param51 ? param51 : (8'hb0))}))))
(y, clk, wire44, wire43, wire42, wire41, wire40);
  output wire [(32'h23):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire44;
  input wire [(4'he):(1'h0)] wire43;
  input wire signed [(2'h3):(1'h0)] wire42;
  input wire [(4'he):(1'h0)] wire41;
  input wire [(4'h8):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire50;
  wire [(3'h5):(1'h0)] wire49;
  wire signed [(3'h6):(1'h0)] wire48;
  wire [(4'h9):(1'h0)] wire47;
  wire [(3'h4):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire45;
  assign y = {wire50, wire49, wire48, wire47, wire46, wire45, (1'h0)};
  assign wire45 = (~(|(^$unsigned(((8'hac) ^ wire43)))));
  assign wire46 = (^~((^~wire43) ?
                      ((^~(wire40 != wire41)) >> $unsigned((wire42 << wire41))) : wire40[(4'h8):(2'h3)]));
  assign wire47 = (wire41 ?
                      $signed($signed(((wire43 ?
                          wire43 : (7'h40)) ^~ $unsigned(wire44)))) : (wire42 ?
                          $unsigned($unsigned(wire44[(5'h10):(1'h0)])) : wire46));
  assign wire48 = ((wire42 ?
                      (~|$unsigned((~^wire46))) : {($signed(wire47) ?
                              wire42[(2'h2):(2'h2)] : $signed(wire42)),
                          $unsigned(wire47)}) > wire42);
  assign wire49 = ($unsigned(($signed($signed(wire41)) ?
                          (wire43[(4'he):(4'h8)] | {wire43,
                              wire47}) : (~^(^~wire41)))) ?
                      (^(($signed(wire47) ?
                          $unsigned(wire40) : ((7'h44) >> wire40)) - $signed((wire47 ?
                          (8'hb3) : wire48)))) : (^$signed((+wire43[(3'h5):(3'h5)]))));
  assign wire50 = (($unsigned(((wire44 ?
                      wire49 : wire48) << wire45[(2'h3):(1'h1)])) & (-$signed(wire48[(3'h4):(2'h2)]))) ~^ ((wire44 ?
                      $unsigned($unsigned(wire40)) : $unsigned($unsigned(wire45))) ^~ wire49[(1'h1):(1'h1)]));
endmodule
