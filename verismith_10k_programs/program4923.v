module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire211;
  wire signed [(5'h10):(1'h0)] wire209;
  wire signed [(5'h12):(1'h0)] wire207;
  wire [(5'h14):(1'h0)] wire206;
  wire [(3'h4):(1'h0)] wire205;
  wire [(3'h4):(1'h0)] wire202;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire198;
  wire [(4'hb):(1'h0)] wire200;
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg [(3'h7):(1'h0)] reg203 = (1'h0);
  reg [(4'hb):(1'h0)] reg204 = (1'h0);
  reg [(3'h4):(1'h0)] reg208 = (1'h0);
  assign y = {wire211,
                 wire209,
                 wire207,
                 wire206,
                 wire205,
                 wire202,
                 wire5,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire198,
                 wire200,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg7,
                 reg6,
                 reg203,
                 reg204,
                 reg208,
                 (1'h0)};
  assign wire5 = wire3[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg6 <= (wire1 > (+$signed(((7'h43) ?
          {wire3, wire2} : (wire1 ^ wire0)))));
      reg7 <= wire4;
    end
  assign wire8 = reg6[(3'h5):(2'h3)];
  assign wire9 = reg7;
  assign wire10 = (-{wire9[(3'h5):(3'h4)],
                      {((^~(8'ha2)) ? wire8[(4'h9):(2'h2)] : wire3)}});
  assign wire11 = $unsigned(wire5[(3'h5):(1'h0)]);
  assign wire12 = $unsigned($unsigned((!((wire9 >= wire0) ?
                      $signed(wire1) : wire11[(4'h9):(4'h8)]))));
  assign wire13 = wire5;
  assign wire14 = $unsigned($signed((^wire5)));
  assign wire15 = (~&$unsigned($signed((8'hbd))));
  always
    @(posedge clk) begin
      if ({$unsigned(wire0[(2'h2):(1'h0)])})
        begin
          if ((8'hb7))
            begin
              reg16 <= (!$signed((~|$signed($unsigned(wire8)))));
              reg17 <= wire15[(1'h0):(1'h0)];
              reg18 <= $unsigned((+(wire2 - $signed(reg7))));
            end
          else
            begin
              reg16 <= wire14[(4'hb):(2'h3)];
              reg17 <= ($signed(($unsigned(reg17[(4'h9):(2'h3)]) - wire3)) << $signed((~^$signed({wire1,
                  wire4}))));
            end
          reg19 <= (!$signed(($signed(reg18[(3'h6):(3'h4)]) ?
              (^~$unsigned((8'hba))) : reg17[(2'h2):(1'h1)])));
        end
      else
        begin
          if (({(|reg18),
              ((~|$unsigned(wire10)) ?
                  ($unsigned(wire4) ?
                      (wire3 ?
                          wire10 : wire2) : (reg16 != wire12)) : $signed($signed(wire4)))} * reg6[(2'h3):(1'h1)]))
            begin
              reg16 <= ((reg6 ?
                  (&(-wire14)) : $unsigned(($unsigned((8'had)) == (wire4 * (8'ha6))))) ~^ $signed((&((reg19 ?
                  wire5 : wire3) <= (wire1 ? (8'ha1) : (8'ha7))))));
              reg17 <= (reg17 ?
                  $signed(reg17[(3'h6):(3'h4)]) : ((!wire1[(4'hd):(4'ha)]) || wire10[(2'h3):(2'h3)]));
              reg18 <= (&(8'h9d));
            end
          else
            begin
              reg16 <= $unsigned($unsigned((reg16[(4'hf):(3'h7)] ?
                  (~|$unsigned(wire14)) : (|reg7))));
            end
        end
      reg20 <= (+$unsigned(((((8'hae) ?
          wire8 : wire12) + $signed(reg7)) ^~ ((reg18 ? (8'hb3) : reg16) ?
          (wire15 ? wire11 : reg7) : (8'hba)))));
      if ({wire2})
        begin
          if ($unsigned(wire10))
            begin
              reg21 <= {($signed(((reg19 < wire11) ?
                          (wire3 ? (7'h43) : wire2) : (+(8'haf)))) ?
                      (~^((reg7 || wire12) ?
                          (wire10 <= wire11) : (wire13 ~^ wire3))) : (-$unsigned((+wire8))))};
              reg22 <= $unsigned(wire4[(3'h6):(1'h0)]);
              reg23 <= wire13[(2'h3):(2'h2)];
              reg24 <= ($unsigned($unsigned($unsigned({wire15, (7'h40)}))) ?
                  (~|wire9) : ($signed((8'ha2)) & ($signed($signed(wire8)) < wire1)));
              reg25 <= reg16[(3'h4):(1'h0)];
            end
          else
            begin
              reg21 <= wire4[(4'h8):(3'h4)];
              reg22 <= $signed(reg20[(2'h2):(1'h1)]);
              reg23 <= reg16[(4'h9):(3'h7)];
            end
          reg26 <= (!($unsigned((wire13 ?
              $signed(reg23) : $unsigned(reg23))) == wire1));
          reg27 <= (reg19[(1'h0):(1'h0)] ~^ ((^~(~|{(8'hbb), wire2})) ?
              wire8[(5'h10):(2'h3)] : ($signed(reg16) * (&(reg25 <= wire9)))));
        end
      else
        begin
          reg21 <= reg21;
          reg22 <= (~|$signed($unsigned(reg19)));
          reg23 <= $unsigned(((reg23 ?
                  $unsigned($unsigned(reg19)) : $unsigned((wire13 ?
                      (8'ha0) : reg27))) ?
              {{(|(8'ha8)), (reg21 ~^ wire8)},
                  ({wire9,
                      wire9} == (wire0 == reg18))} : wire8[(4'h9):(1'h0)]));
          reg24 <= {($signed(reg19[(2'h2):(2'h2)]) & $signed((!{wire4,
                  reg27}))),
              ($unsigned(reg23[(1'h0):(1'h0)]) * $signed((wire8 ?
                  (^~reg22) : (|wire14))))};
        end
    end
  module28 #() modinst199 (.wire30(wire12), .y(wire198), .wire31(wire9), .wire32(wire14), .wire33(reg20), .wire29(wire1), .clk(clk));
  module34 #() modinst201 (wire200, clk, wire15, wire2, reg20, reg17, wire3);
  assign wire202 = $unsigned($unsigned({(8'hb5), $unsigned($signed((8'hb6)))}));
  always
    @(posedge clk) begin
      reg203 <= {$unsigned((~&(^$unsigned(reg24)))), reg24[(1'h0):(1'h0)]};
      reg204 <= (($unsigned($unsigned(wire14[(4'h9):(3'h6)])) ?
          (~&{$unsigned(wire8),
              {wire11, wire1}}) : ($signed(((8'hb2) ^ reg17)) ~^ ((+wire13) ?
              {wire5, wire13} : (wire200 ?
                  wire10 : reg21)))) >>> ((+(~&wire15)) + wire10));
    end
  assign wire205 = (8'hbd);
  assign wire206 = $signed(reg23);
  assign wire207 = {((~&$signed($unsigned(reg204))) ~^ (((reg204 == wire14) > (reg21 ?
                           wire3 : wire202)) ^~ (reg24 != (reg26 >> reg17)))),
                       (reg16 && wire2[(3'h6):(3'h5)])};
  always
    @(posedge clk) begin
      reg208 <= (($unsigned({(~|wire3)}) ?
              $signed((((8'hb7) ?
                  wire3 : wire198) ^~ (+reg7))) : $signed(wire14[(3'h6):(1'h1)])) ?
          (reg23 ?
              (7'h44) : (reg203 | $unsigned((wire4 ?
                  wire10 : wire5)))) : reg16);
    end
  module34 #() modinst210 (.wire39(wire10), .wire37(reg24), .y(wire209), .clk(clk), .wire38(wire5), .wire36(wire9), .wire35(wire1));
  assign wire211 = reg25[(2'h3):(2'h3)];
endmodule

module module28
#(parameter param196 = {(((|(~(8'hbf))) ? (((8'hb7) < (8'hb1)) ? {(8'ha3), (8'haf)} : (~|(8'haa))) : ({(8'hac)} ? ((7'h44) != (8'hbe)) : ((8'ha8) ? (8'hbc) : (8'ha0)))) ? ((8'hb5) >> {((8'hb0) ? (8'hb7) : (8'hb8)), (~|(8'ha7))}) : (!(((8'ha8) ? (7'h42) : (7'h42)) & (8'hab)))), {{{(~&(8'h9e))}, {(~^(7'h44)), ((8'hb5) ~^ (8'hbd))}}}}, 
parameter param197 = ((param196 ? (param196 ? (-(param196 ? (8'hbf) : (8'had))) : (param196 - param196)) : (+param196)) ? param196 : (8'hae)))
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h279):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire33;
  input wire [(4'hb):(1'h0)] wire32;
  input wire signed [(5'h14):(1'h0)] wire31;
  input wire [(5'h10):(1'h0)] wire30;
  input wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire195;
  wire signed [(5'h13):(1'h0)] wire194;
  wire signed [(4'ha):(1'h0)] wire169;
  wire signed [(5'h14):(1'h0)] wire158;
  wire signed [(4'h8):(1'h0)] wire157;
  wire [(5'h12):(1'h0)] wire136;
  wire [(3'h4):(1'h0)] wire135;
  wire signed [(2'h3):(1'h0)] wire134;
  wire signed [(5'h12):(1'h0)] wire121;
  wire signed [(5'h12):(1'h0)] wire97;
  wire [(3'h7):(1'h0)] wire99;
  wire [(5'h13):(1'h0)] wire100;
  wire [(4'ha):(1'h0)] wire101;
  wire [(3'h6):(1'h0)] wire119;
  wire signed [(5'h10):(1'h0)] wire171;
  wire [(5'h15):(1'h0)] wire172;
  wire signed [(3'h7):(1'h0)] wire173;
  wire signed [(3'h5):(1'h0)] wire192;
  reg signed [(5'h11):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg124 = (1'h0);
  reg [(4'h8):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg129 = (1'h0);
  reg [(3'h7):(1'h0)] reg130 = (1'h0);
  reg [(3'h5):(1'h0)] reg131 = (1'h0);
  reg [(4'hc):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg133 = (1'h0);
  reg [(5'h11):(1'h0)] reg137 = (1'h0);
  reg [(3'h5):(1'h0)] reg138 = (1'h0);
  reg [(5'h15):(1'h0)] reg139 = (1'h0);
  reg [(5'h14):(1'h0)] reg140 = (1'h0);
  reg [(5'h13):(1'h0)] reg141 = (1'h0);
  reg [(4'h8):(1'h0)] reg142 = (1'h0);
  reg [(4'ha):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg144 = (1'h0);
  reg signed [(4'he):(1'h0)] reg145 = (1'h0);
  reg [(3'h5):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg152 = (1'h0);
  reg [(2'h3):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg154 = (1'h0);
  reg [(4'ha):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg156 = (1'h0);
  assign y = {wire195,
                 wire194,
                 wire169,
                 wire158,
                 wire157,
                 wire136,
                 wire135,
                 wire134,
                 wire121,
                 wire97,
                 wire99,
                 wire100,
                 wire101,
                 wire119,
                 wire171,
                 wire172,
                 wire173,
                 wire192,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 reg133,
                 reg137,
                 reg138,
                 reg139,
                 reg140,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 reg156,
                 (1'h0)};
  module34 #() modinst98 (wire97, clk, wire32, wire30, wire31, wire33, wire29);
  assign wire99 = (((~|{wire97[(1'h0):(1'h0)],
                          wire32[(4'h8):(3'h4)]}) || ((~|wire30[(4'h9):(3'h4)]) ?
                          wire31 : ((wire31 ?
                              wire33 : wire97) >>> $unsigned(wire29)))) ?
                      wire32[(4'ha):(2'h2)] : {(((|wire32) ^ $unsigned(wire29)) >>> (^(wire29 ?
                              wire30 : wire29))),
                          wire30});
  assign wire100 = wire31[(4'hf):(3'h7)];
  assign wire101 = (wire32[(2'h2):(2'h2)] ?
                       wire33[(1'h1):(1'h1)] : {(wire30[(4'h9):(2'h2)] >= $signed($signed(wire31)))});
  module102 #() modinst120 (.wire107(wire31), .y(wire119), .clk(clk), .wire104(wire97), .wire106(wire32), .wire103(wire101), .wire105(wire30));
  assign wire121 = {($unsigned($signed($signed(wire100))) ^ (~wire30[(1'h1):(1'h1)]))};
  always
    @(posedge clk) begin
      reg122 <= $signed(wire99);
      if ((~&{$signed($signed(wire31[(5'h13):(2'h2)]))}))
        begin
          reg123 <= {(~{((&wire31) ? $unsigned(wire100) : wire100),
                  (~&wire100[(3'h7):(3'h5)])})};
          if (wire31)
            begin
              reg124 <= (wire97 ?
                  $signed({wire99}) : $signed($signed((~$unsigned(wire29)))));
              reg125 <= $signed($unsigned((($signed(wire99) ^~ $unsigned((8'ha4))) ~^ (((8'hbd) ^~ wire97) ?
                  $signed(wire99) : (wire29 ? wire99 : (8'ha5))))));
              reg126 <= (^wire101[(4'h8):(3'h6)]);
              reg127 <= reg123;
              reg128 <= (({($unsigned(wire29) - $signed(reg126)),
                      $unsigned(wire30[(3'h5):(2'h2)])} & reg126) ?
                  wire121 : wire97);
            end
          else
            begin
              reg124 <= $unsigned($unsigned((~|$unsigned(reg125))));
              reg125 <= (($signed(reg128) ? wire101 : $signed(reg122)) ?
                  (8'hb9) : {wire33,
                      $unsigned($signed(reg123[(1'h1):(1'h0)]))});
              reg126 <= (reg127[(4'he):(4'h8)] < $signed({$unsigned($signed(wire31))}));
              reg127 <= reg123[(1'h0):(1'h0)];
            end
          reg129 <= ((~$signed($unsigned(reg123[(1'h1):(1'h1)]))) == reg126);
          if (($unsigned($signed($signed($signed(wire121)))) ?
              $signed(($unsigned((reg126 ?
                  wire100 : reg126)) == reg129[(2'h3):(2'h3)])) : (wire33[(4'hd):(3'h5)] ?
                  reg127[(4'h9):(1'h1)] : wire101)))
            begin
              reg130 <= (8'ha7);
            end
          else
            begin
              reg130 <= wire101;
              reg131 <= $signed(reg127);
              reg132 <= ((wire99[(2'h3):(1'h0)] ?
                      ($signed((~&reg125)) ^~ reg130) : reg126) ?
                  $unsigned(reg122[(1'h1):(1'h1)]) : reg131);
            end
        end
      else
        begin
          reg123 <= (reg122[(4'h8):(3'h4)] | (-wire121[(4'h8):(3'h4)]));
        end
      reg133 <= (reg131[(3'h4):(2'h3)] ?
          $unsigned($signed((|$signed(reg123)))) : $unsigned((+((reg131 | (8'hbc)) != (reg130 ?
              (7'h43) : wire100)))));
    end
  assign wire134 = $signed(reg133);
  assign wire135 = $signed($unsigned((($signed(reg123) >> (wire134 <= wire33)) ?
                       $signed($unsigned(reg126)) : (&(reg126 ?
                           (8'hb4) : reg123)))));
  assign wire136 = (~&((wire29[(3'h4):(2'h2)] >> wire32[(3'h4):(1'h0)]) == (~|$unsigned((^reg128)))));
  always
    @(posedge clk) begin
      reg137 <= (8'ha8);
      if (wire31)
        begin
          if ((8'hb9))
            begin
              reg138 <= ((((~&{wire101}) ~^ ($unsigned(wire100) ?
                          {wire33} : $unsigned(reg132))) ?
                      reg133 : {(-reg127[(1'h1):(1'h0)])}) ?
                  {({reg129, $unsigned(wire99)} & ($signed(wire29) ?
                          $unsigned(reg133) : $unsigned(wire31)))} : wire32);
              reg139 <= {$unsigned($unsigned(wire97))};
              reg140 <= (^(((^~(reg139 ? reg137 : wire31)) ?
                  $signed((8'hb9)) : reg138) ~^ (((wire119 ? wire33 : (8'ha9)) ?
                  (reg131 ? wire99 : wire101) : (wire136 ?
                      reg131 : (8'haa))) ^~ reg124)));
            end
          else
            begin
              reg138 <= ((~&{$signed((|reg133)),
                  reg126}) >> reg132[(3'h7):(3'h4)]);
            end
          reg141 <= {reg127[(2'h2):(2'h2)], (8'hb8)};
          reg142 <= ($unsigned((8'ha1)) ?
              $signed(reg139[(2'h2):(1'h0)]) : (wire99 <<< ((reg131 >> {reg140}) || wire100)));
          reg143 <= (8'haf);
          reg144 <= $unsigned((((-$unsigned(reg130)) << wire32[(3'h6):(2'h2)]) ?
              $signed($unsigned({reg132})) : wire32[(4'h8):(1'h0)]));
        end
      else
        begin
          reg138 <= ($signed((((~&wire33) * {reg142}) ^~ {reg139,
                  $signed(reg138)})) ?
              $signed(((reg126[(4'hc):(4'hb)] ^~ {wire135,
                  wire29}) == (8'hb6))) : $unsigned((-reg133)));
          reg139 <= ($signed(wire119[(1'h1):(1'h0)]) ?
              (($unsigned((~^reg130)) ?
                  $unsigned(wire134) : (reg133 ?
                      $signed(reg130) : (wire97 + wire32))) ^ $unsigned($signed((reg139 ?
                  reg141 : wire30)))) : (+$unsigned($unsigned(wire33[(2'h3):(2'h3)]))));
          reg140 <= $signed({(wire32[(2'h2):(2'h2)] ?
                  ((wire97 ? (8'hbb) : reg127) ?
                      $unsigned((8'ha7)) : $unsigned(reg129)) : (reg132 ?
                      $signed(wire136) : (^~reg142)))});
        end
      if (reg132)
        begin
          if (((^~wire30[(4'h9):(4'h8)]) ?
              wire32 : (reg124 <<< $unsigned($unsigned($unsigned(wire121))))))
            begin
              reg145 <= reg131[(1'h0):(1'h0)];
              reg146 <= reg127[(3'h4):(3'h4)];
              reg147 <= ((reg139 ?
                      ((^~(+(8'hbe))) ?
                          (~&reg141) : $signed((^~wire30))) : (^(reg143 >= $unsigned(wire135)))) ?
                  ($signed($signed($signed((8'hba)))) >= ((^((7'h43) ?
                          reg122 : reg130)) ?
                      ({reg124,
                          wire119} << {reg132}) : ($signed(reg125) && $signed(reg131)))) : {($unsigned($unsigned(reg131)) - $unsigned(wire99[(2'h2):(1'h0)])),
                      (reg122[(4'ha):(3'h5)] > wire119)});
              reg148 <= (($unsigned($unsigned($signed(reg130))) ?
                  (&{(reg126 ?
                          reg140 : reg131)}) : $signed(reg131)) >>> $signed($unsigned((~$signed(reg139)))));
              reg149 <= (~wire119[(2'h3):(1'h0)]);
            end
          else
            begin
              reg145 <= ($signed(((~|(reg122 * (8'hb6))) >= wire32)) ?
                  (^~$unsigned(reg145[(4'he):(4'h9)])) : (|(((^~reg127) > (wire30 | reg129)) ?
                      $unsigned($signed((8'ha3))) : $signed((wire136 ~^ reg128)))));
              reg146 <= wire31;
              reg147 <= (wire100 != {reg125[(1'h1):(1'h0)],
                  (reg137 ~^ reg146[(3'h5):(3'h4)])});
            end
          if ($unsigned(reg126[(2'h3):(2'h3)]))
            begin
              reg150 <= ($unsigned((((wire30 | wire33) >> reg147[(1'h0):(1'h0)]) != (~|((8'ha7) != reg146)))) ^~ {(((wire31 ^ reg125) > $signed(reg124)) ?
                      $unsigned(((8'hb1) && reg132)) : $unsigned($signed(reg145)))});
              reg151 <= (~&$unsigned((|reg128)));
              reg152 <= $signed((reg149[(5'h12):(2'h2)] ?
                  $signed(reg144) : (wire136[(5'h12):(2'h3)] ?
                      (&(wire134 != wire97)) : wire99[(1'h1):(1'h1)])));
              reg153 <= {(reg124[(4'hf):(3'h5)] ?
                      ((reg152[(5'h12):(5'h12)] - (wire31 ?
                          reg126 : reg132)) >> {(reg144 < wire31),
                          ((8'h9c) ^ wire97)}) : $signed(($signed(reg150) < $signed(wire30))))};
            end
          else
            begin
              reg150 <= (~|{$signed($unsigned((~&reg139)))});
              reg151 <= (~reg148);
              reg152 <= ($signed(reg153[(2'h3):(1'h0)]) >= $signed({wire134[(1'h1):(1'h0)],
                  ((!reg153) ? (wire29 ? reg149 : (7'h42)) : (^~wire100))}));
              reg153 <= $unsigned($signed((reg124 && $signed(((8'hb3) ?
                  reg130 : (8'ha7))))));
            end
          reg154 <= (reg143 + {(reg127[(4'h9):(1'h1)] > {(reg144 >> reg142)})});
        end
      else
        begin
          if ($unsigned(reg130[(1'h0):(1'h0)]))
            begin
              reg145 <= (((~^$signed(reg130[(3'h5):(1'h0)])) ?
                  wire135[(3'h4):(1'h0)] : (~&$unsigned($unsigned(reg127)))) > $unsigned((~(8'h9f))));
              reg146 <= $unsigned({($unsigned($unsigned((8'haa))) != reg146),
                  (reg126 ? $unsigned((8'h9c)) : wire100[(3'h7):(3'h4)])});
              reg147 <= wire136;
              reg148 <= $unsigned($signed(((reg137 ?
                  (reg123 && reg133) : (reg122 ?
                      wire135 : reg145)) ^~ reg127[(3'h6):(2'h2)])));
            end
          else
            begin
              reg145 <= (+(~|(&reg142[(1'h0):(1'h0)])));
            end
          reg149 <= {(!$unsigned(reg153)), {wire119[(1'h1):(1'h0)], reg142}};
        end
      reg155 <= (+(~|({wire31} ?
          (reg144[(1'h1):(1'h1)] ?
              $signed(reg123) : wire135[(1'h0):(1'h0)]) : (8'hab))));
      reg156 <= (reg147[(3'h5):(1'h0)] <= (8'haa));
    end
  assign wire157 = reg132;
  assign wire158 = (wire97 && reg128);
  module159 #() modinst170 (.wire161(reg122), .wire162(wire29), .wire163(reg147), .y(wire169), .clk(clk), .wire160(reg143));
  assign wire171 = reg127;
  assign wire172 = (!$signed({((reg141 & wire135) >> $signed(wire29)),
                       $unsigned(((8'hb4) ? reg142 : wire100))}));
  assign wire173 = (^~(wire97 ? reg153 : reg140[(5'h10):(4'hc)]));
  module174 #() modinst193 (.wire177(reg137), .wire175(reg151), .wire178(reg133), .clk(clk), .wire176(wire158), .wire179(reg156), .y(wire192));
  assign wire194 = reg148[(4'he):(4'he)];
  assign wire195 = $unsigned(($signed((-$signed(wire121))) ?
                       $signed(reg153[(2'h2):(1'h1)]) : (~$unsigned((-reg125)))));
endmodule

module module174
#(parameter param190 = ((8'hb4) << ({(^~(&(8'hbf)))} - {((&(8'hb3)) & ((8'hac) ? (8'hbf) : (8'ha1)))})), 
parameter param191 = (({((8'hbb) * (param190 ? param190 : param190)), (^~(param190 > param190))} ? param190 : ((((8'ha0) * param190) ? {param190} : ((8'haa) ? param190 : param190)) ^~ ((^param190) < param190))) ? (({(+param190)} <<< ({param190} > (~|(8'ha1)))) | param190) : param190))
(y, clk, wire179, wire178, wire177, wire176, wire175);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire179;
  input wire signed [(4'hd):(1'h0)] wire178;
  input wire [(5'h11):(1'h0)] wire177;
  input wire [(2'h2):(1'h0)] wire176;
  input wire [(3'h5):(1'h0)] wire175;
  wire signed [(5'h11):(1'h0)] wire189;
  wire [(3'h6):(1'h0)] wire188;
  wire signed [(4'hf):(1'h0)] wire187;
  wire signed [(2'h3):(1'h0)] wire186;
  wire [(5'h12):(1'h0)] wire185;
  wire signed [(4'hd):(1'h0)] wire184;
  wire [(5'h14):(1'h0)] wire183;
  wire signed [(4'h8):(1'h0)] wire180;
  reg signed [(3'h6):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg181 = (1'h0);
  assign y = {wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire180,
                 reg182,
                 reg181,
                 (1'h0)};
  assign wire180 = ((wire175 == wire176) && wire176[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg181 <= (~^({(&$unsigned((8'ha7)))} > ($signed(((8'haf) == wire176)) ?
          ((wire175 ? wire176 : wire178) ?
              $unsigned(wire176) : (~wire177)) : (wire176 ?
              wire178[(2'h2):(2'h2)] : $signed((8'ha7))))));
      reg182 <= reg181[(4'hb):(1'h1)];
    end
  assign wire183 = (-(wire177 << reg181[(4'hb):(3'h5)]));
  assign wire184 = ($signed({(7'h44),
                           ($signed((8'ha1)) - reg181[(2'h2):(2'h2)])}) ?
                       (&reg181) : ({(reg181[(1'h1):(1'h0)] && reg182),
                               (~&wire178[(3'h5):(1'h1)])} ?
                           (~^($signed(reg181) ?
                               (wire175 >= wire180) : reg181[(3'h7):(3'h6)])) : wire175[(2'h3):(1'h1)]));
  assign wire185 = {({wire179[(4'h8):(3'h6)]} ? reg182 : reg182),
                       reg182[(3'h6):(3'h4)]};
  assign wire186 = ({$signed(wire179)} > (-$unsigned($unsigned($signed(wire183)))));
  assign wire187 = ($unsigned((wire177 ? (&wire178) : wire176)) ?
                       (8'h9c) : wire179);
  assign wire188 = ({wire176} ?
                       ((^(wire183[(5'h13):(2'h3)] != $unsigned((8'hba)))) ?
                           $unsigned((reg182[(3'h4):(3'h4)] + wire187[(3'h6):(2'h3)])) : $signed(((wire185 ?
                                   wire187 : wire183) ?
                               $unsigned(reg181) : (wire184 ?
                                   (8'ha7) : wire175)))) : $unsigned($unsigned((((8'ha7) ?
                               wire178 : wire186) ?
                           $unsigned(wire185) : (~&wire180)))));
  assign wire189 = {$signed($signed((8'hba))),
                       (wire188[(1'h1):(1'h1)] ?
                           $unsigned($signed({(8'had)})) : reg182[(1'h0):(1'h0)])};
endmodule

module module159  (y, clk, wire163, wire162, wire161, wire160);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire163;
  input wire signed [(4'h9):(1'h0)] wire162;
  input wire signed [(4'hb):(1'h0)] wire161;
  input wire signed [(4'ha):(1'h0)] wire160;
  wire signed [(5'h11):(1'h0)] wire168;
  wire signed [(5'h10):(1'h0)] wire167;
  wire signed [(3'h4):(1'h0)] wire166;
  wire signed [(4'he):(1'h0)] wire165;
  wire [(5'h14):(1'h0)] wire164;
  assign y = {wire168, wire167, wire166, wire165, wire164, (1'h0)};
  assign wire164 = $unsigned($signed($unsigned($signed({(8'hae)}))));
  assign wire165 = ((~$signed((wire161[(2'h2):(2'h2)] >> (wire163 ?
                           wire162 : (7'h41))))) ?
                       $signed($unsigned((8'hbf))) : wire160);
  assign wire166 = (~wire165[(4'hb):(4'hb)]);
  assign wire167 = {wire162};
  assign wire168 = ((^~{$unsigned($unsigned(wire166))}) ?
                       (wire160[(3'h5):(1'h1)] ?
                           ((wire161 ?
                               $unsigned(wire161) : (wire164 >> wire166)) ^ {{wire160},
                               (^~(8'hb8))}) : $signed(wire166)) : {wire163[(3'h5):(2'h3)]});
endmodule

module module102
#(parameter param117 = (8'had), 
parameter param118 = (~^{(|(+param117))}))
(y, clk, wire107, wire106, wire105, wire104, wire103);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire107;
  input wire [(4'h9):(1'h0)] wire106;
  input wire [(4'h8):(1'h0)] wire105;
  input wire [(5'h12):(1'h0)] wire104;
  input wire [(4'ha):(1'h0)] wire103;
  wire signed [(4'hf):(1'h0)] wire116;
  wire [(4'he):(1'h0)] wire115;
  wire signed [(4'ha):(1'h0)] wire114;
  wire signed [(5'h13):(1'h0)] wire113;
  wire [(5'h11):(1'h0)] wire112;
  wire [(4'hc):(1'h0)] wire111;
  wire signed [(4'hb):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire109;
  wire signed [(4'h8):(1'h0)] wire108;
  assign y = {wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 (1'h0)};
  assign wire108 = $signed((-$signed($signed((wire105 >> wire106)))));
  assign wire109 = $unsigned((wire103[(3'h4):(1'h1)] == (wire104 ^~ $unsigned($unsigned(wire106)))));
  assign wire110 = wire103;
  assign wire111 = ({(8'hb5),
                       (~$signed(((8'hb6) ~^ wire103)))} <= (~&$signed($signed($signed(wire105)))));
  assign wire112 = ((wire109[(4'h8):(3'h6)] ?
                       wire111 : $signed((^(wire108 | wire108)))) >> wire106);
  assign wire113 = $signed((!wire109[(4'h8):(2'h2)]));
  assign wire114 = (~wire104);
  assign wire115 = ((8'hae) >>> ((~^$signed({wire106,
                       wire108})) * (~^($unsigned(wire111) ^~ (!wire105)))));
  assign wire116 = (8'hab);
endmodule

module module34  (y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h270):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire39;
  input wire signed [(5'h10):(1'h0)] wire38;
  input wire signed [(5'h11):(1'h0)] wire37;
  input wire [(4'h8):(1'h0)] wire36;
  input wire [(4'hf):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire96;
  wire [(3'h6):(1'h0)] wire95;
  wire signed [(4'hb):(1'h0)] wire94;
  wire signed [(5'h14):(1'h0)] wire93;
  wire signed [(3'h7):(1'h0)] wire92;
  wire signed [(3'h7):(1'h0)] wire91;
  wire [(4'hf):(1'h0)] wire90;
  wire [(5'h10):(1'h0)] wire89;
  wire [(4'hd):(1'h0)] wire67;
  wire [(2'h3):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire63;
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  reg [(3'h5):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 reg88,
                 reg87,
                 reg86,
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
                 reg69,
                 reg68,
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
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire37)
        begin
          reg40 <= $unsigned(((|({(8'ha7), wire35} ?
                  ((8'ha8) ? wire35 : wire39) : {wire38})) ?
              (wire38[(4'h9):(2'h3)] || wire39[(3'h4):(2'h3)]) : $signed(((wire39 ?
                  wire38 : wire37) - $signed(wire39)))));
          reg41 <= (!(wire35 < {((reg40 < wire38) - (!wire38))}));
          reg42 <= ($signed(((wire38[(1'h0):(1'h0)] >> reg41[(3'h4):(1'h0)]) ?
              reg40 : ({reg41, wire35} ?
                  (wire37 ?
                      wire35 : (8'hb6)) : $signed(reg41)))) | ($unsigned(((~|wire37) ?
                  (8'hab) : (wire39 & wire38))) ?
              reg40[(3'h5):(3'h5)] : reg40));
        end
      else
        begin
          if ((($unsigned($unsigned((wire39 ? reg42 : wire36))) ?
              {wire35} : wire36[(3'h6):(2'h2)]) != $unsigned(reg41)))
            begin
              reg40 <= ((7'h43) ?
                  {$unsigned(((reg41 | reg40) ~^ wire37)),
                      (wire37[(2'h3):(1'h1)] ?
                          ((wire37 ? reg42 : wire36) ?
                              (wire37 ? (8'ha1) : wire37) : ((7'h44) ?
                                  reg42 : wire39)) : $unsigned({(8'ha5)}))} : $signed(reg42));
              reg41 <= $unsigned($signed($unsigned($unsigned($unsigned(wire37)))));
              reg42 <= wire37[(4'hb):(1'h1)];
              reg43 <= (8'ha8);
            end
          else
            begin
              reg40 <= $unsigned($signed((8'ha7)));
              reg41 <= ($unsigned($unsigned($signed((wire35 - (8'ha9))))) ?
                  (7'h41) : (7'h42));
              reg42 <= wire35[(4'hb):(1'h0)];
              reg43 <= (({reg40[(3'h7):(3'h7)], (8'hbb)} ?
                  wire35[(3'h7):(1'h1)] : (|$signed($signed(wire36)))) ^~ (reg40[(3'h4):(3'h4)] ?
                  ({(wire38 > wire36),
                      wire35} ^ $unsigned($signed(wire37))) : $signed(reg40)));
              reg44 <= wire35[(4'ha):(2'h3)];
            end
          reg45 <= (~^($unsigned(wire38) & ((reg44 ?
              (reg40 ?
                  wire35 : reg44) : wire37[(1'h0):(1'h0)]) >>> {$signed(reg44)})));
          reg46 <= (($signed((~{(7'h41)})) & ((-(8'h9f)) != $unsigned((8'hb9)))) ?
              (^{$unsigned({(8'h9e)})}) : $signed((((reg42 ? reg45 : reg40) ?
                      reg40 : reg42[(3'h5):(1'h1)]) ?
                  reg40[(2'h2):(2'h2)] : $unsigned(((8'hbe) <<< wire38)))));
          if (($unsigned(reg42[(2'h3):(1'h1)]) >>> (reg40[(2'h2):(2'h2)] ?
              $unsigned(wire38[(4'ha):(1'h0)]) : (-$signed(((8'haa) ?
                  reg46 : reg41))))))
            begin
              reg47 <= reg45;
              reg48 <= $signed((|$unsigned($unsigned((reg40 ?
                  reg46 : wire37)))));
              reg49 <= $signed(wire36);
              reg50 <= reg40;
            end
          else
            begin
              reg47 <= $unsigned(reg43[(2'h2):(1'h1)]);
              reg48 <= $unsigned(($unsigned(((reg41 ? reg49 : wire37) ?
                  $signed(reg41) : {(8'hbc)})) != $signed(reg45[(4'h9):(4'h8)])));
              reg49 <= reg41[(3'h6):(3'h5)];
              reg50 <= $signed($unsigned((-reg50)));
              reg51 <= (+$unsigned($signed(reg48[(1'h0):(1'h0)])));
            end
          if (wire36)
            begin
              reg52 <= $signed({reg49[(4'ha):(2'h2)],
                  (((reg43 ? reg43 : (8'hb8)) ?
                      (8'h9e) : (wire38 ? reg40 : reg50)) <= wire36)});
              reg53 <= (reg42[(1'h1):(1'h1)] >> $signed(reg42));
            end
          else
            begin
              reg52 <= wire35[(2'h3):(2'h3)];
            end
        end
      reg54 <= reg44;
      if (($unsigned((&(8'hb3))) - $signed($signed($unsigned($unsigned(reg48))))))
        begin
          reg55 <= {$unsigned(reg40[(1'h1):(1'h0)])};
          if (reg53[(3'h6):(1'h0)])
            begin
              reg56 <= $unsigned($unsigned(($unsigned({reg44,
                  reg40}) > reg43)));
              reg57 <= $unsigned((^$signed((wire35 ?
                  reg43 : (wire36 ? (7'h43) : reg54)))));
              reg58 <= (!(^(~^reg53[(3'h6):(2'h2)])));
              reg59 <= {($signed((~&$unsigned(wire35))) > {$signed(reg46[(4'ha):(1'h1)])})};
            end
          else
            begin
              reg56 <= $signed($signed($unsigned(($signed(reg54) ?
                  $signed(wire37) : {reg46}))));
            end
          if ({reg53, $unsigned($unsigned((-reg55[(1'h1):(1'h0)])))})
            begin
              reg60 <= (reg58 != ((|$unsigned(reg59)) && (reg48 ?
                  $signed(wire36) : $signed($unsigned(reg59)))));
              reg61 <= ($signed((^{wire39, $signed((8'hb9))})) ?
                  (^~reg42) : reg43[(3'h7):(3'h5)]);
              reg62 <= ((^reg43[(4'h8):(3'h7)]) ?
                  (((~^$signed((8'hae))) + ((wire35 << reg50) - wire37)) <= ((reg59 ?
                      ((8'hb2) ?
                          reg55 : reg45) : (~(8'ha4))) * $signed((8'h9f)))) : ((((wire38 ?
                      wire37 : reg50) || (|reg50)) || (~^(+reg45))) ^ {(^(!wire39)),
                      $signed({reg58, (8'h9c)})}));
            end
          else
            begin
              reg60 <= ({((&wire39[(3'h5):(2'h2)]) ?
                          ((reg54 >> reg59) < (reg58 < wire38)) : reg56[(2'h3):(2'h2)])} ?
                  $signed(($unsigned((!reg46)) ?
                      ((^wire36) < (+reg60)) : ((|reg56) == reg55))) : (^~reg50[(4'hc):(3'h7)]));
              reg61 <= ($unsigned((^~$signed((!reg50)))) + $unsigned(($unsigned((reg53 ?
                      reg42 : reg62)) ?
                  {$unsigned(reg55), reg41} : wire39[(3'h6):(1'h0)])));
              reg62 <= (-(reg59 & reg51));
            end
        end
      else
        begin
          reg55 <= (&(^~((-reg56) ?
              (^(reg60 & wire37)) : ($signed(reg50) ?
                  reg56[(2'h2):(2'h2)] : $signed((8'hae))))));
          reg56 <= (((~|reg61) | (^((reg57 == reg41) ?
                  (-reg45) : $signed(reg48)))) ?
              $signed({{(7'h42)}}) : $signed(reg51[(4'ha):(2'h2)]));
          reg57 <= reg48[(5'h13):(4'he)];
          if (($unsigned((!(reg58 ? $signed((8'ha7)) : $unsigned(reg40)))) ?
              ($unsigned(wire35[(3'h7):(1'h0)]) <= (($unsigned(wire37) - $signed(reg58)) ?
                  (reg53 >>> {reg52}) : (!$signed(reg43)))) : (wire36[(3'h6):(2'h2)] ?
                  reg61 : wire39[(3'h4):(1'h0)])))
            begin
              reg58 <= (+((($signed(wire35) ?
                      reg45[(3'h5):(3'h4)] : (~&reg54)) >= (+reg59)) ?
                  $unsigned(reg42) : (~|reg40)));
              reg59 <= {(reg41 ? wire38[(4'hf):(4'h8)] : (8'ha2))};
              reg60 <= (^~$unsigned($signed(reg51[(3'h5):(3'h5)])));
              reg61 <= (-reg55[(2'h2):(1'h0)]);
              reg62 <= $unsigned(reg57[(3'h4):(3'h4)]);
            end
          else
            begin
              reg58 <= ($unsigned(reg42[(3'h7):(3'h7)]) >> (+$unsigned({reg42,
                  reg51[(3'h6):(2'h2)]})));
              reg59 <= $signed({(reg50[(3'h7):(3'h7)] ?
                      reg54[(2'h2):(2'h2)] : reg40[(3'h7):(2'h3)])});
            end
        end
    end
  assign wire63 = $unsigned((!$signed(reg60)));
  assign wire64 = $unsigned(reg62[(4'h8):(2'h2)]);
  assign wire65 = (reg48[(3'h6):(3'h4)] - {$unsigned(((^reg43) + (reg61 ?
                          reg42 : wire39))),
                      (!$unsigned((reg59 ? reg42 : reg42)))});
  assign wire66 = $signed($signed(reg40[(2'h2):(2'h2)]));
  assign wire67 = reg62;
  always
    @(posedge clk) begin
      reg68 <= (~&(wire37[(4'he):(3'h7)] ^~ ((~wire64) ^~ $signed({reg52,
          (8'ha8)}))));
      reg69 <= {(wire36[(1'h0):(1'h0)] ?
              reg53[(4'hb):(3'h5)] : reg40[(2'h3):(2'h2)])};
      reg70 <= reg47[(2'h3):(1'h1)];
      if ({(^(reg46 ?
              ((reg61 ? wire35 : reg50) ?
                  {wire39} : $unsigned(wire65)) : (!(~^reg43))))})
        begin
          reg71 <= {$signed($signed($signed((reg41 > (7'h41)))))};
          if ($signed(($unsigned($unsigned((~^(8'ha1)))) == $unsigned((^reg50[(4'hb):(4'h9)])))))
            begin
              reg72 <= ((~&(((^reg70) ^ $unsigned(reg55)) >> (reg69 ?
                      $unsigned((8'h9e)) : reg47[(4'hb):(3'h7)]))) ?
                  {(|(|reg60)),
                      $unsigned($unsigned((~&reg41)))} : ($unsigned({(reg60 >> wire36),
                      (-reg52)}) >= ($unsigned((~reg69)) ?
                      (|$unsigned(reg71)) : (!(wire36 < reg42)))));
              reg73 <= (~&{reg43,
                  $signed({$unsigned(wire67), {reg42, (8'ha4)}})});
            end
          else
            begin
              reg72 <= (^(reg57 != (((8'hbe) - $unsigned(reg45)) ?
                  $signed((~&reg56)) : (-reg46))));
              reg73 <= $unsigned(reg62);
              reg74 <= ({($unsigned((reg55 ? reg47 : reg68)) ?
                      reg57[(4'h9):(3'h7)] : {(wire39 ? reg62 : (8'hbd)),
                          $signed(reg70)}),
                  reg49[(3'h5):(3'h5)]} ~^ reg53);
              reg75 <= $unsigned((~&$unsigned($signed((~^reg61)))));
              reg76 <= {wire64, reg49};
            end
          reg77 <= $unsigned((^wire39[(4'h8):(1'h1)]));
          reg78 <= $signed({$signed((^(reg40 ? (7'h43) : reg76)))});
          reg79 <= $signed((reg77 == $unsigned(wire37[(4'h8):(3'h4)])));
        end
      else
        begin
          reg71 <= (+(~^(($unsigned(wire65) ?
                  (reg70 ^~ wire67) : $signed(reg56)) ?
              reg51[(3'h4):(1'h1)] : reg68[(4'ha):(2'h3)])));
          reg72 <= ((wire64 ?
              $signed((!(reg50 > reg47))) : (|$signed($unsigned((7'h40))))) << (!(($unsigned(reg54) ?
                  (-(8'hb7)) : $signed(reg45)) ?
              $unsigned((~&reg47)) : (|wire39))));
          reg73 <= {(^$signed(({wire39, reg56} >>> reg44[(2'h3):(1'h1)]))),
              reg70[(3'h5):(2'h2)]};
        end
      if (reg79[(5'h14):(2'h2)])
        begin
          reg80 <= ($signed($signed($signed(((8'ha1) ? reg73 : reg45)))) ?
              reg70 : (&($unsigned(wire64[(4'h9):(3'h7)]) ?
                  (reg74 ?
                      reg48 : $unsigned(reg50)) : $unsigned((reg70 < (8'ha0))))));
          if ((|(+(~|$unsigned($signed((8'hbb)))))))
            begin
              reg81 <= ((~&$signed($signed(reg55))) < $signed(reg76[(1'h1):(1'h1)]));
              reg82 <= reg51[(3'h4):(2'h3)];
            end
          else
            begin
              reg81 <= (-$signed((((reg43 & reg68) >= $signed((8'hb3))) ?
                  {$unsigned(reg69)} : ((wire39 & reg56) ?
                      reg58[(4'hc):(3'h7)] : (reg42 <<< reg43)))));
              reg82 <= $signed($unsigned($signed(($unsigned(reg82) ?
                  {wire35} : (wire64 ? reg81 : reg72)))));
              reg83 <= wire35[(4'h9):(3'h5)];
              reg84 <= (+reg72);
            end
        end
      else
        begin
          reg80 <= ((~|($unsigned(reg83) - {(reg56 >= reg73)})) << (reg57[(1'h1):(1'h0)] ?
              reg80 : $unsigned(($signed((8'ha5)) >>> (reg80 >> reg57)))));
          if ((!($unsigned((!(reg43 ? (8'ha1) : reg52))) ?
              $unsigned(($unsigned(reg75) <= (reg76 < (8'h9c)))) : $signed($signed((wire66 ?
                  reg47 : reg55))))))
            begin
              reg81 <= $unsigned(wire67[(4'hb):(1'h1)]);
            end
          else
            begin
              reg81 <= $signed({(~&reg48), ((8'h9d) << reg55)});
              reg82 <= {($signed((&(8'hab))) + $signed($signed(wire37[(4'h9):(4'h8)])))};
              reg83 <= $unsigned($signed((!reg82)));
              reg84 <= wire39;
              reg85 <= $signed({(reg74 >>> $signed(reg59)),
                  (-(&$signed(reg44)))});
            end
          reg86 <= wire63[(3'h7):(2'h3)];
          reg87 <= $unsigned((($unsigned($unsigned(reg44)) ?
                  reg71[(3'h6):(3'h5)] : {$signed(reg56)}) ?
              (8'hb4) : $signed(($unsigned(wire36) ?
                  wire37 : (reg47 * reg80)))));
          reg88 <= $signed((~^reg51[(4'hc):(4'ha)]));
        end
    end
  assign wire89 = (~$signed((($unsigned(reg76) ? reg62 : reg42) <<< reg76)));
  assign wire90 = $unsigned($unsigned(((~^(^wire64)) <= wire63[(2'h2):(1'h1)])));
  assign wire91 = (|$unsigned($unsigned((~|$signed(reg85)))));
  assign wire92 = $unsigned(reg59[(1'h1):(1'h0)]);
  assign wire93 = wire90;
  assign wire94 = (((-$signed($unsigned(wire39))) ?
                          reg85 : $unsigned($unsigned((reg76 - (8'hac))))) ?
                      $unsigned({reg79,
                          $unsigned((reg76 && wire65))}) : reg88[(2'h3):(1'h1)]);
  assign wire95 = (8'had);
  assign wire96 = (reg77 < $unsigned((wire66[(1'h1):(1'h1)] ?
                      $signed(reg51) : $signed((^(8'hb2))))));
endmodule
