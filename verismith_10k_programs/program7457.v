module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire185;
  wire signed [(2'h3):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire5;
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  assign y = {wire185,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 (1'h0)};
  assign wire5 = wire3[(4'hb):(1'h1)];
  always
    @(posedge clk) begin
      if ({wire5[(3'h4):(1'h0)]})
        begin
          reg6 <= $unsigned(($unsigned(((wire2 ^ wire0) ?
              $signed(wire5) : wire0)) & wire2[(1'h1):(1'h1)]));
          if (wire2)
            begin
              reg7 <= $signed({$unsigned(wire1[(1'h1):(1'h0)]),
                  wire3[(1'h0):(1'h0)]});
            end
          else
            begin
              reg7 <= (~^($signed(($unsigned(reg7) != wire5[(1'h1):(1'h0)])) >>> ({$signed(wire4),
                      (reg6 ? wire3 : wire2)} ?
                  reg6 : (8'hb3))));
              reg8 <= wire4[(1'h1):(1'h1)];
              reg9 <= $unsigned((wire5 >= wire2));
            end
          if ($signed($signed($unsigned((~&(~reg9))))))
            begin
              reg10 <= wire4;
            end
          else
            begin
              reg10 <= $unsigned((|$unsigned((8'hbb))));
              reg11 <= reg7[(1'h1):(1'h0)];
            end
          reg12 <= (8'hbf);
        end
      else
        begin
          reg6 <= wire3;
          if ($unsigned((!(~&$unsigned((wire3 ? wire2 : wire2))))))
            begin
              reg7 <= $signed($signed((wire3 ? wire3 : {$signed(wire2)})));
              reg8 <= $signed((8'h9f));
              reg9 <= reg9;
              reg10 <= (8'ha1);
            end
          else
            begin
              reg7 <= $signed($signed(((~&(reg9 ? wire2 : wire2)) ?
                  $signed($unsigned(wire5)) : $unsigned(((8'ha6) ^ (8'h9e))))));
              reg8 <= $signed(reg7[(3'h5):(2'h3)]);
            end
        end
      reg13 <= (reg12 * ($signed(((+reg9) < wire0[(2'h2):(2'h2)])) ^ wire0[(3'h5):(1'h0)]));
      reg14 <= (((($signed(wire2) != (wire4 ~^ (8'hbe))) >= ($unsigned(wire1) - (~reg8))) == ((-$unsigned(reg7)) ?
          ($unsigned(wire2) >>> (+reg11)) : ({(8'hb5),
              wire4} << $unsigned(reg13)))) >>> (+$unsigned($signed((wire3 <<< reg8)))));
      reg15 <= wire3;
    end
  assign wire16 = (!(($signed($signed(reg13)) ?
                          reg11[(2'h3):(1'h1)] : $unsigned((reg11 * reg7))) ?
                      reg10[(3'h7):(3'h4)] : $unsigned($signed({reg15}))));
  assign wire17 = (8'hbc);
  assign wire18 = ($signed({($signed(reg12) < (-reg13))}) ^ reg8[(3'h5):(2'h3)]);
  assign wire19 = (|({wire3} ?
                      $signed(wire17[(2'h2):(2'h2)]) : (~|$signed(wire16[(1'h0):(1'h0)]))));
  module20 #() modinst186 (.clk(clk), .wire21(reg6), .wire24(wire16), .wire25(reg11), .wire23(reg13), .wire22(wire0), .y(wire185));
endmodule

module module20  (y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h18c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire25;
  input wire signed [(3'h6):(1'h0)] wire24;
  input wire [(5'h11):(1'h0)] wire23;
  input wire signed [(5'h11):(1'h0)] wire22;
  input wire [(5'h15):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire184;
  wire signed [(4'h8):(1'h0)] wire182;
  wire signed [(4'ha):(1'h0)] wire169;
  wire [(3'h4):(1'h0)] wire168;
  wire signed [(4'ha):(1'h0)] wire167;
  wire [(5'h15):(1'h0)] wire166;
  wire signed [(2'h2):(1'h0)] wire165;
  wire signed [(2'h3):(1'h0)] wire164;
  wire [(5'h14):(1'h0)] wire163;
  wire signed [(3'h5):(1'h0)] wire161;
  wire [(5'h13):(1'h0)] wire139;
  wire [(5'h15):(1'h0)] wire137;
  wire [(5'h14):(1'h0)] wire136;
  wire [(4'hc):(1'h0)] wire135;
  wire signed [(4'hd):(1'h0)] wire71;
  wire signed [(5'h11):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire73;
  wire signed [(2'h2):(1'h0)] wire122;
  reg signed [(5'h14):(1'h0)] reg138 = (1'h0);
  reg [(5'h15):(1'h0)] reg134 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg131 = (1'h0);
  reg [(4'h9):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg129 = (1'h0);
  reg [(3'h5):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg127 = (1'h0);
  reg [(5'h14):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg125 = (1'h0);
  reg [(5'h13):(1'h0)] reg124 = (1'h0);
  assign y = {wire184,
                 wire182,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire161,
                 wire139,
                 wire137,
                 wire136,
                 wire135,
                 wire71,
                 wire50,
                 wire73,
                 wire122,
                 reg138,
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
                 (1'h0)};
  module26 #() modinst51 (.wire28(wire25), .wire29(wire22), .y(wire50), .clk(clk), .wire30(wire21), .wire27(wire23));
  module52 #() modinst72 (wire71, clk, wire22, wire23, wire25, wire24, wire21);
  assign wire73 = wire22[(4'ha):(4'h8)];
  module74 #() modinst123 (.wire75(wire50), .wire78(wire21), .clk(clk), .wire79(wire23), .wire76(wire25), .y(wire122), .wire77(wire73));
  always
    @(posedge clk) begin
      reg124 <= {(8'ha0)};
      reg125 <= (((wire24[(2'h3):(2'h3)] ?
                  (((8'hbd) >>> wire71) > $unsigned(wire23)) : $signed(((8'hb8) * wire25))) ?
              (^~(~&$signed(wire73))) : $unsigned(wire25[(3'h7):(3'h5)])) ?
          $signed((($unsigned(wire25) & (wire73 ?
              wire22 : (8'hbc))) + ((reg124 ? wire22 : wire24) ?
              $unsigned((8'ha6)) : $unsigned(reg124)))) : (~^$signed({(~&wire23),
              (wire21 << wire21)})));
      if (wire50[(1'h1):(1'h1)])
        begin
          reg126 <= ((+(wire22[(5'h11):(5'h11)] ?
              wire71 : wire73[(5'h10):(4'hc)])) ^ (wire21 | $signed(wire21)));
          if (($unsigned(((((8'hb7) * wire73) ?
                  (~^wire122) : (~&wire22)) > wire25)) ?
              $unsigned({$unsigned((8'had))}) : (8'ha4)))
            begin
              reg127 <= (reg126 != $unsigned((((wire25 >= wire23) ?
                  (~^(8'hba)) : (^~wire23)) - wire122)));
              reg128 <= wire25[(4'ha):(2'h2)];
              reg129 <= (wire50[(4'hd):(2'h3)] >= $unsigned((reg128[(3'h5):(3'h5)] >>> ((+reg126) ?
                  $unsigned((8'hb0)) : wire25))));
            end
          else
            begin
              reg127 <= wire50;
              reg128 <= reg128;
              reg129 <= $signed($signed($unsigned((wire22[(3'h5):(3'h5)] > {wire22,
                  wire50}))));
              reg130 <= (&$unsigned((~|reg129)));
              reg131 <= $signed(reg126[(5'h10):(1'h0)]);
            end
          reg132 <= (+wire23);
        end
      else
        begin
          reg126 <= (|(^~(~&$signed(wire122))));
          reg127 <= $signed((reg131[(1'h1):(1'h0)] >> (-((reg126 ?
                  reg132 : reg130) ?
              $signed(wire71) : $signed(wire73)))));
          reg128 <= $unsigned(($signed((reg129 > (~^wire122))) ?
              (^{(reg132 & wire122), $signed(wire122)}) : $signed(reg129)));
          if ($signed(wire21))
            begin
              reg129 <= wire24;
              reg130 <= reg125[(1'h0):(1'h0)];
              reg131 <= $unsigned($unsigned((reg127 ?
                  ((reg132 ?
                      reg132 : reg126) && $unsigned(wire24)) : $signed((reg129 ?
                      (8'hbc) : wire71)))));
            end
          else
            begin
              reg129 <= $signed((^(reg129[(3'h4):(2'h2)] != (^wire21))));
              reg130 <= $signed((~$signed((+(wire21 >> wire22)))));
              reg131 <= $unsigned((^~wire50));
            end
        end
      reg133 <= reg124;
      reg134 <= wire24[(2'h2):(1'h0)];
    end
  assign wire135 = {wire23,
                       (reg125 ?
                           wire71 : ((^~(~^wire22)) > ((reg127 ~^ wire122) >= (|(8'hb0)))))};
  assign wire136 = reg131[(2'h3):(1'h1)];
  assign wire137 = wire73[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg138 <= (wire22 ? $signed(reg129) : $unsigned(reg124));
    end
  assign wire139 = $signed({$unsigned(reg127[(3'h4):(1'h1)])});
  module140 #() modinst162 (.wire143(reg124), .y(wire161), .wire141(wire25), .clk(clk), .wire142(wire23), .wire144(reg132));
  assign wire163 = ((~|(~&((wire135 ? reg132 : wire21) ?
                       (^reg131) : $unsigned((8'ha5))))) - $signed((~&$unsigned(wire50))));
  assign wire164 = wire23[(4'hf):(4'ha)];
  assign wire165 = (~{wire24[(3'h5):(3'h4)],
                       $unsigned((wire21[(3'h5):(2'h2)] == wire139))});
  assign wire166 = ((|$signed((^$unsigned(reg124)))) == (!wire163));
  assign wire167 = $signed(wire122);
  assign wire168 = wire163;
  assign wire169 = $unsigned(wire136);
  module170 #() modinst183 (wire182, clk, wire169, reg134, reg124, wire136);
  assign wire184 = {$signed((wire169 ?
                           (~(wire182 ?
                               (8'hae) : reg134)) : reg133[(3'h7):(3'h4)])),
                       {wire22[(4'h9):(1'h0)]}};
endmodule

module module170
#(parameter param180 = (({{{(8'hbd)}, (+(8'ha3))}} | (-(+((8'ha2) ? (8'hb9) : (8'hbc))))) ? (&((((8'h9e) || (8'h9e)) ? ((8'hb2) ? (8'h9f) : (8'hbe)) : ((7'h43) ? (8'ha7) : (8'h9f))) ? (((8'hbf) ? (8'hb8) : (8'hb6)) ? ((8'hbb) >> (8'hb3)) : {(8'hab), (8'ha2)}) : (~^((8'hb1) ? (8'ha1) : (8'ha7))))) : (((((8'ha3) ? (8'h9f) : (8'hbf)) < (~&(8'h9d))) | (((8'ha4) ? (8'hbd) : (7'h44)) ? (^(8'ha4)) : ((8'h9f) ? (8'had) : (8'hb8)))) >>> (8'hbb))), 
parameter param181 = (((param180 >= ({param180} ? (!param180) : {(8'h9c)})) ? {param180} : {(param180 * ((8'haf) + param180)), ((param180 ? param180 : param180) ? param180 : {param180, param180})}) ? (param180 + (+{(+param180)})) : (((((8'hb7) == param180) >>> (param180 ? (8'h9e) : (8'ha6))) ? (8'hbd) : (&param180)) ? (^~(&{param180, param180})) : (~|(-param180)))))
(y, clk, wire174, wire173, wire172, wire171);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire174;
  input wire [(5'h15):(1'h0)] wire173;
  input wire [(5'h13):(1'h0)] wire172;
  input wire [(3'h7):(1'h0)] wire171;
  wire signed [(2'h3):(1'h0)] wire179;
  wire [(5'h12):(1'h0)] wire178;
  wire [(4'he):(1'h0)] wire177;
  wire signed [(3'h4):(1'h0)] wire176;
  wire [(5'h14):(1'h0)] wire175;
  assign y = {wire179, wire178, wire177, wire176, wire175, (1'h0)};
  assign wire175 = wire173[(1'h0):(1'h0)];
  assign wire176 = wire171;
  assign wire177 = ((&{(-$unsigned(wire175)), wire176}) ?
                       (~&($unsigned(wire171) ?
                           $signed($signed((7'h44))) : (^(wire172 ^~ (8'hab))))) : wire172[(5'h12):(4'hd)]);
  assign wire178 = wire176;
  assign wire179 = (wire175 == $signed($signed(($signed((8'hb7)) ?
                       $unsigned(wire171) : (~wire173)))));
endmodule

module module140
#(parameter param159 = {(((~&(&(8'hbd))) ? {((8'haa) ? (8'had) : (8'hb2)), ((7'h42) ? (8'ha1) : (8'hb1))} : {((8'ha7) ? (8'hbc) : (8'haa)), ((8'ha4) ? (8'ha6) : (8'hba))}) | ((&((8'hb0) >>> (8'hac))) != (&((8'ha2) == (8'hae)))))}, 
parameter param160 = (&(-{param159, (&(+(8'h9f)))})))
(y, clk, wire144, wire143, wire142, wire141);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire144;
  input wire signed [(5'h11):(1'h0)] wire143;
  input wire [(4'hb):(1'h0)] wire142;
  input wire signed [(3'h5):(1'h0)] wire141;
  wire signed [(4'hb):(1'h0)] wire158;
  wire [(5'h13):(1'h0)] wire151;
  wire signed [(4'hf):(1'h0)] wire150;
  wire signed [(5'h14):(1'h0)] wire149;
  wire signed [(5'h15):(1'h0)] wire145;
  reg [(4'hb):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg155 = (1'h0);
  reg [(4'hf):(1'h0)] reg154 = (1'h0);
  reg [(5'h11):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg152 = (1'h0);
  reg [(2'h2):(1'h0)] reg148 = (1'h0);
  reg [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(3'h7):(1'h0)] reg146 = (1'h0);
  assign y = {wire158,
                 wire151,
                 wire150,
                 wire149,
                 wire145,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg148,
                 reg147,
                 reg146,
                 (1'h0)};
  assign wire145 = $unsigned(wire143);
  always
    @(posedge clk) begin
      reg146 <= $signed($signed($unsigned(wire141[(3'h5):(1'h1)])));
      reg147 <= $unsigned((!$signed(($signed((8'ha4)) ^~ $signed(reg146)))));
      reg148 <= $signed((!$unsigned(wire142[(3'h4):(1'h1)])));
    end
  assign wire149 = (8'h9e);
  assign wire150 = $signed($unsigned((&((reg148 < reg148) <= (7'h44)))));
  assign wire151 = (reg148 ?
                       (wire150 >>> wire149[(4'hb):(4'ha)]) : wire142[(3'h7):(3'h5)]);
  always
    @(posedge clk) begin
      if (((^reg147) <= (($unsigned((reg146 ?
              (8'hbb) : (8'ha8))) - ((reg147 | reg146) ?
              ((8'hb1) ? wire142 : wire143) : (wire141 ? wire151 : reg146))) ?
          ($signed($signed(wire143)) ?
              $signed((reg146 ?
                  wire141 : wire141)) : $unsigned($signed((8'hbd)))) : $unsigned(wire141[(2'h2):(1'h0)]))))
        begin
          reg152 <= (reg148[(2'h2):(1'h0)] ?
              $signed((~^((wire144 || wire150) ?
                  wire149[(4'ha):(3'h4)] : (^~wire142)))) : ($unsigned({{wire142,
                          wire141},
                      (wire143 > reg147)}) ?
                  {wire142} : $unsigned((wire141[(1'h0):(1'h0)] <<< (reg147 ?
                      reg148 : wire142)))));
          reg153 <= $signed($unsigned($unsigned(((wire144 > wire144) || (reg146 - wire151)))));
          if ($signed((~(~^$unsigned(reg148)))))
            begin
              reg154 <= reg153;
              reg155 <= ($signed({(((8'ha4) ?
                      wire143 : wire143) << (reg146 - wire141))}) >= ((-$unsigned((&reg154))) ?
                  wire151[(4'h8):(3'h5)] : (~$signed($unsigned(wire144)))));
            end
          else
            begin
              reg154 <= wire149[(5'h10):(3'h5)];
              reg155 <= ($signed(wire144[(3'h7):(3'h5)]) ?
                  $unsigned({(wire149[(2'h2):(1'h1)] ^~ (&reg153)),
                      (~|(wire144 ? wire144 : reg152))}) : ({reg154} ?
                      wire141 : {(~&$unsigned(wire145)), $signed(reg155)}));
              reg156 <= $unsigned({$signed(wire151[(4'hd):(2'h3)]),
                  $unsigned($unsigned((reg155 - wire149)))});
              reg157 <= ($signed({{((8'ha1) ^ wire141)}}) != (((8'hb2) != reg155) ?
                  ($signed($unsigned((8'hb3))) << {((8'ha1) | wire145),
                      (reg153 ^~ reg152)}) : $unsigned(wire149)));
            end
        end
      else
        begin
          reg152 <= (+(^reg156[(3'h4):(1'h0)]));
          reg153 <= wire150;
        end
    end
  assign wire158 = reg154;
endmodule

module module74  (y, clk, wire79, wire78, wire77, wire76, wire75);
  output wire [(32'h1c3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire79;
  input wire [(5'h10):(1'h0)] wire78;
  input wire [(5'h14):(1'h0)] wire77;
  input wire signed [(2'h2):(1'h0)] wire76;
  input wire signed [(5'h11):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire121;
  wire signed [(5'h15):(1'h0)] wire120;
  wire [(5'h13):(1'h0)] wire119;
  wire [(4'hb):(1'h0)] wire118;
  wire signed [(4'h9):(1'h0)] wire117;
  wire signed [(4'he):(1'h0)] wire110;
  wire signed [(2'h2):(1'h0)] wire109;
  wire [(4'ha):(1'h0)] wire108;
  wire signed [(3'h4):(1'h0)] wire96;
  wire signed [(4'hb):(1'h0)] wire95;
  wire [(3'h6):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire80;
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg112 = (1'h0);
  reg signed [(4'he):(1'h0)] reg111 = (1'h0);
  reg [(3'h6):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg106 = (1'h0);
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  reg [(3'h7):(1'h0)] reg104 = (1'h0);
  reg [(3'h4):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg [(2'h3):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg100 = (1'h0);
  reg [(3'h4):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg94 = (1'h0);
  reg [(4'hd):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(5'h11):(1'h0)] reg91 = (1'h0);
  reg [(3'h7):(1'h0)] reg90 = (1'h0);
  reg [(3'h4):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg82 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire110,
                 wire109,
                 wire108,
                 wire96,
                 wire95,
                 wire81,
                 wire80,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
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
                 (1'h0)};
  assign wire80 = $signed((($unsigned($unsigned(wire75)) > (wire76 ?
                          {(8'ha1)} : wire75[(3'h5):(1'h1)])) ?
                      wire76[(2'h2):(2'h2)] : (wire77 || wire79[(5'h10):(4'hb)])));
  assign wire81 = ((wire77[(2'h2):(1'h0)] ^~ ($signed({wire76}) ?
                          wire75 : (((8'ha8) & wire76) || {wire78}))) ?
                      ($signed({wire80[(4'he):(3'h7)], (wire76 << wire78)}) ?
                          $unsigned((~|wire76[(1'h1):(1'h0)])) : $unsigned({$signed(wire80)})) : $signed({wire80[(3'h5):(2'h2)],
                          (!wire80[(3'h7):(3'h4)])}));
  always
    @(posedge clk) begin
      if ((^(&$signed(wire81[(3'h6):(1'h1)]))))
        begin
          if ($unsigned($unsigned((wire77[(1'h1):(1'h1)] ?
              {$signed(wire78), wire75} : {wire75}))))
            begin
              reg82 <= (($signed({(wire76 | wire80)}) < (^(~$signed(wire75)))) ?
                  $signed((wire81[(1'h1):(1'h0)] <= ((wire76 == wire78) < ((8'ha8) << wire76)))) : wire77[(4'hd):(4'hb)]);
              reg83 <= ($unsigned((($unsigned(wire81) >= (wire79 ?
                      reg82 : wire81)) ?
                  (~&(wire75 ?
                      reg82 : wire78)) : (^$unsigned((7'h44))))) << (!$unsigned(wire78[(3'h6):(1'h1)])));
              reg84 <= (wire75[(4'hf):(4'h8)] ~^ ($signed($unsigned((^wire76))) ?
                  (8'haf) : reg83));
              reg85 <= wire75[(5'h11):(4'ha)];
              reg86 <= (reg83[(4'he):(3'h4)] ?
                  ($signed((!wire76[(2'h2):(1'h1)])) >> $signed($signed((wire79 ^ reg84)))) : ({($signed(wire80) <= wire78[(4'he):(3'h4)]),
                          (wire75 ? reg85 : reg85[(2'h3):(1'h1)])} ?
                      (~|($signed(reg83) - ((8'ha7) ?
                          (8'had) : wire80))) : ($signed((reg85 <<< wire77)) ?
                          (wire76 ?
                              (reg84 ?
                                  reg83 : (8'hb7)) : (^~(8'hb4))) : (reg83 ?
                              {wire77, wire78} : $unsigned(wire79)))));
            end
          else
            begin
              reg82 <= $unsigned($unsigned((^~wire78)));
              reg83 <= {$unsigned($signed(($unsigned(reg82) >> (wire76 ?
                      reg83 : (8'haf)))))};
              reg84 <= $unsigned(reg83);
              reg85 <= (8'hb3);
            end
        end
      else
        begin
          if (reg85[(2'h2):(2'h2)])
            begin
              reg82 <= (($signed((~&(8'ha9))) ^ ($signed((wire80 ?
                      reg85 : reg83)) ?
                  (^(wire79 > wire75)) : (((8'hb0) < reg83) - reg83[(4'ha):(1'h0)]))) | ((8'h9e) ?
                  ($unsigned($signed(reg82)) ?
                      (~&$unsigned((8'ha7))) : (8'ha4)) : $unsigned(((reg82 ?
                      reg83 : (8'hb7)) ^ (&(7'h44))))));
            end
          else
            begin
              reg82 <= (+{{$unsigned((+reg83))}});
              reg83 <= wire76;
              reg84 <= (^$unsigned({$signed($signed(reg85)), wire75}));
              reg85 <= (^(~wire76[(2'h2):(1'h0)]));
            end
          if (wire79)
            begin
              reg86 <= ((8'hac) < (wire81[(3'h6):(2'h3)] >> $signed((reg85[(1'h1):(1'h0)] ?
                  (8'had) : (~wire78)))));
              reg87 <= reg83[(3'h5):(3'h5)];
              reg88 <= reg82;
              reg89 <= (8'hab);
              reg90 <= $unsigned({reg89[(1'h1):(1'h1)],
                  ($unsigned(reg84[(4'ha):(4'h9)]) ?
                      ((wire76 | (8'hb6)) ~^ (&wire76)) : reg89)});
            end
          else
            begin
              reg86 <= $signed(wire79[(2'h2):(1'h1)]);
              reg87 <= (((wire81 ?
                      reg83[(4'h9):(2'h3)] : (~&((8'ha8) ?
                          (8'had) : reg86))) & reg88[(3'h5):(1'h1)]) ?
                  reg89 : wire76);
              reg88 <= $signed((reg89[(2'h3):(2'h3)] ?
                  (wire78 ?
                      ((reg87 <= reg82) ?
                          $unsigned(reg82) : (wire77 ?
                              wire77 : (8'ha1))) : (!$unsigned(wire79))) : (!reg83)));
              reg89 <= $signed(((($signed(wire81) ? (-wire77) : reg82) ?
                      $signed(((8'hb6) >> (8'hb4))) : $unsigned(reg89)) ?
                  $signed(wire75[(2'h2):(2'h2)]) : reg84));
            end
          reg91 <= $unsigned(((+($unsigned((8'h9e)) & {reg90})) > $signed((wire80 ?
              (reg87 & reg86) : (^~wire80)))));
        end
      reg92 <= ({wire76[(1'h1):(1'h1)]} ?
          reg83 : $unsigned(wire76[(1'h1):(1'h1)]));
      reg93 <= (+$signed($unsigned($signed(reg85[(3'h5):(1'h1)]))));
      reg94 <= $unsigned($signed($unsigned(reg92[(2'h2):(2'h2)])));
    end
  assign wire95 = reg82;
  assign wire96 = (reg88 == reg85);
  always
    @(posedge clk) begin
      reg97 <= reg88[(4'ha):(3'h7)];
      reg98 <= reg82;
      reg99 <= $signed($signed(((!(reg87 ? wire77 : reg89)) ?
          wire79[(4'h9):(3'h7)] : ($signed(wire77) >> reg90))));
      reg100 <= ({reg85} ?
          reg97[(3'h6):(1'h1)] : (((reg94 ?
                  $unsigned(reg90) : $unsigned(wire95)) ?
              $unsigned($signed(wire75)) : reg94) && $signed($unsigned($signed(reg87)))));
    end
  always
    @(posedge clk) begin
      reg101 <= wire76[(1'h0):(1'h0)];
      reg102 <= wire96[(2'h3):(2'h3)];
      if ($unsigned(({(~reg85), ($unsigned(reg87) <= reg84[(4'ha):(3'h6)])} ?
          $signed(reg98[(1'h0):(1'h0)]) : ((~&(reg102 >>> wire95)) & wire96[(2'h2):(1'h1)]))))
        begin
          if ($signed($signed($signed((reg94 >= wire80[(5'h12):(3'h5)])))))
            begin
              reg103 <= ($signed((&reg102[(4'h9):(4'h9)])) ?
                  wire81 : reg94[(5'h14):(3'h4)]);
              reg104 <= (&(reg91 ^ (~^wire80[(4'hc):(2'h2)])));
              reg105 <= ((reg103 < $signed(reg99)) ~^ ($unsigned((!(^~(8'hb4)))) ?
                  {{reg84[(3'h5):(1'h0)]}} : $unsigned($signed(wire75))));
              reg106 <= ($unsigned((^~$unsigned($signed(reg92)))) ^~ $signed(reg105));
              reg107 <= reg91;
            end
          else
            begin
              reg103 <= ($unsigned((((7'h44) - reg105) + $signed(reg105))) | (reg107[(2'h2):(1'h1)] ?
                  {(8'hb8)} : wire96[(3'h4):(1'h0)]));
              reg104 <= $signed({wire76[(2'h2):(2'h2)]});
            end
        end
      else
        begin
          reg103 <= $unsigned((~wire78[(4'hb):(3'h6)]));
        end
    end
  assign wire108 = wire75;
  assign wire109 = reg89;
  assign wire110 = $signed($signed($signed(({reg86} || (^wire108)))));
  always
    @(posedge clk) begin
      reg111 <= $signed(((7'h44) - reg98));
      reg112 <= (&(&$unsigned(((&(8'h9c)) ? reg92 : (reg102 > (8'hbe))))));
      reg113 <= $unsigned(((+((~^reg83) ?
          reg106[(3'h6):(3'h5)] : ((8'ha7) ?
              reg101 : wire110))) <<< $signed((!reg98))));
      if ($unsigned(reg99[(1'h1):(1'h1)]))
        begin
          reg114 <= $signed(wire109[(1'h0):(1'h0)]);
          reg115 <= (((reg92[(1'h0):(1'h0)] ?
                  wire80[(4'hb):(2'h2)] : (|(reg93 && wire109))) * reg114[(3'h4):(2'h3)]) ?
              (^~(8'hb8)) : ((!wire77) ? (-(~reg100)) : reg91[(4'hd):(1'h0)]));
        end
      else
        begin
          reg114 <= $unsigned((8'hb6));
          reg115 <= {($unsigned(wire77[(4'hc):(1'h1)]) >>> wire80),
              {wire110[(4'hc):(3'h4)]}};
        end
      reg116 <= reg114[(3'h4):(1'h0)];
    end
  assign wire117 = (8'h9f);
  assign wire118 = {wire81};
  assign wire119 = reg89;
  assign wire120 = $signed(reg85[(4'h9):(1'h1)]);
  assign wire121 = (wire78 && ((!wire80) ?
                       (($signed(wire108) >>> (-wire77)) ?
                           $unsigned($unsigned(reg106)) : ((reg111 ~^ wire80) >>> {reg87})) : $unsigned(({reg85,
                               reg115} ?
                           (wire77 ? wire95 : reg82) : {reg115, reg114}))));
endmodule

module module52
#(parameter param70 = ({(~{((8'ha7) ? (8'ha1) : (8'hbb)), ((8'ha9) | (8'had))})} && (|(8'hb3))))
(y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire57;
  input wire [(2'h3):(1'h0)] wire56;
  input wire [(3'h7):(1'h0)] wire55;
  input wire signed [(3'h5):(1'h0)] wire54;
  input wire signed [(4'hd):(1'h0)] wire53;
  wire signed [(5'h15):(1'h0)] wire69;
  wire signed [(5'h15):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire signed [(2'h2):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire63;
  wire signed [(2'h3):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire61;
  wire [(3'h5):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire58;
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 (1'h0)};
  assign wire58 = $unsigned(wire53[(1'h1):(1'h1)]);
  assign wire59 = (~&{$unsigned($unsigned((wire53 ? wire55 : wire54))),
                      wire53});
  assign wire60 = (((~|$signed(wire58[(4'h9):(3'h6)])) << $unsigned({wire53})) <= $unsigned({{$unsigned(wire55),
                          (wire55 ? wire54 : wire54)}}));
  assign wire61 = wire53;
  assign wire62 = (wire59 ?
                      wire54[(3'h4):(1'h0)] : $signed($signed((+(wire59 ?
                          wire59 : wire54)))));
  assign wire63 = wire60;
  assign wire64 = $signed(wire60[(3'h4):(2'h2)]);
  assign wire65 = {$unsigned(wire57[(4'ha):(4'ha)])};
  assign wire66 = {wire61[(3'h6):(2'h3)],
                      ($unsigned($signed($unsigned(wire65))) ?
                          (~^wire62[(2'h3):(2'h3)]) : (($unsigned(wire63) ?
                                  $unsigned(wire60) : $unsigned(wire65)) ?
                              $signed($signed(wire56)) : (~&wire61)))};
  assign wire67 = (~^$signed({wire64}));
  assign wire68 = wire65[(2'h2):(2'h2)];
  assign wire69 = $unsigned((~$signed(wire58)));
endmodule

module module26
#(parameter param48 = ((((((8'hb8) ? (7'h42) : (7'h40)) - ((8'hb8) && (7'h44))) < ({(8'h9c), (8'hb3)} ? ((8'hb1) ? (7'h44) : (8'h9c)) : ((8'had) ? (8'hb5) : (8'hb0)))) ? ((((8'hbb) ? (8'ha9) : (7'h43)) ? ((8'had) ? (8'hb2) : (8'ha6)) : ((8'ha3) < (8'hb6))) >>> ({(8'hbc)} && ((8'ha5) != (8'hb3)))) : {((!(8'hbd)) ? ((7'h40) <<< (8'hb3)) : ((8'hac) > (8'ha8)))}) << (&((~^((8'h9e) >= (8'hb8))) ^~ (&((8'ha5) ? (8'hbe) : (8'hac)))))), 
parameter param49 = (({((param48 != param48) <<< ((7'h40) ^~ (8'ha6))), param48} >> param48) ? param48 : (((((8'hb0) ? (7'h43) : (8'hb6)) | ((8'hae) ? param48 : param48)) ? ((~^(8'ha2)) ? (param48 + param48) : (param48 ? param48 : param48)) : {param48}) ? (((7'h41) ? {param48} : (param48 & param48)) == {(param48 ? param48 : param48), (param48 ? param48 : param48)}) : param48)))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire30;
  input wire [(4'he):(1'h0)] wire29;
  input wire [(4'hc):(1'h0)] wire28;
  input wire [(4'h9):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire46;
  wire signed [(4'h9):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  wire [(4'hc):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire40;
  wire [(4'h8):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 (1'h0)};
  assign wire31 = {(|wire27)};
  assign wire32 = $signed(wire30[(2'h2):(1'h0)]);
  assign wire33 = (wire29 >= wire32);
  assign wire34 = (&$unsigned(wire30[(4'h9):(3'h5)]));
  assign wire35 = wire30[(3'h7):(1'h0)];
  assign wire36 = (~&$unsigned($unsigned($unsigned((wire28 ?
                      wire28 : wire32)))));
  assign wire37 = $signed($signed(($signed((^wire27)) ?
                      ($signed(wire31) << (^~wire33)) : ((wire36 ?
                          wire28 : wire27) || (wire29 ^ wire32)))));
  assign wire38 = (wire27 >> ({wire30[(3'h6):(3'h5)]} == $signed(($signed(wire33) ?
                      {wire35} : wire32[(5'h11):(4'h8)]))));
  assign wire39 = $signed(wire34);
  assign wire40 = wire37;
  assign wire41 = (-(8'ha3));
  assign wire42 = (((((wire40 ? wire39 : wire39) ?
                          wire40 : (wire40 != wire27)) > {((8'ha0) ?
                              wire35 : wire36),
                          (~wire40)}) ~^ wire31) ?
                      ((&(8'hae)) | $signed(wire36)) : (~($unsigned(wire35[(1'h0):(1'h0)]) < $signed($unsigned(wire38)))));
  assign wire43 = $signed(wire36);
  assign wire44 = $unsigned(((wire41[(4'h8):(3'h7)] ~^ ((wire32 ?
                      wire40 : wire39) != {wire31})) > $unsigned(($unsigned(wire34) ?
                      wire27 : wire42))));
  assign wire45 = (~(((^~$signed(wire32)) ?
                      (!wire29) : $signed($signed(wire34))) < wire40[(1'h1):(1'h0)]));
  assign wire46 = $unsigned($unsigned(((8'ha6) < wire35[(5'h11):(5'h10)])));
  assign wire47 = ((wire29 ?
                      {wire35} : (wire29[(4'hc):(3'h6)] - wire43)) == $signed((8'h9e)));
endmodule
