module top
#(parameter param214 = (({(((8'hb5) ? (8'hb7) : (7'h42)) ? ((7'h44) ? (8'ha3) : (8'hac)) : (~&(8'ha4)))} * ((((8'ha9) ? (8'hae) : (8'hb9)) ? ((8'hae) <= (8'hba)) : ((8'ha5) ? (8'hb2) : (8'h9f))) & {((7'h43) && (7'h43))})) & ({(((8'hac) << (8'ha0)) < ((8'ha3) && (8'hb2))), {((8'hbb) ? (8'ha8) : (7'h42))}} ^ (!(^~{(8'hba)})))), 
parameter param215 = param214)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h20a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire213;
  wire signed [(3'h4):(1'h0)] wire212;
  wire signed [(5'h11):(1'h0)] wire211;
  wire [(4'h8):(1'h0)] wire210;
  wire [(2'h3):(1'h0)] wire121;
  wire signed [(3'h6):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire123;
  wire signed [(4'h8):(1'h0)] wire124;
  wire signed [(4'hd):(1'h0)] wire125;
  wire signed [(3'h6):(1'h0)] wire126;
  wire signed [(4'he):(1'h0)] wire205;
  wire signed [(3'h7):(1'h0)] wire207;
  wire [(4'h9):(1'h0)] wire208;
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(4'hc):(1'h0)] reg128 = (1'h0);
  reg [(4'h9):(1'h0)] reg129 = (1'h0);
  assign y = {wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire121,
                 wire34,
                 wire33,
                 wire32,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire123,
                 wire124,
                 wire125,
                 wire126,
                 wire205,
                 wire207,
                 wire208,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
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
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg127,
                 reg128,
                 reg129,
                 (1'h0)};
  assign wire4 = wire3[(5'h10):(4'ha)];
  assign wire5 = wire4;
  assign wire6 = wire1;
  assign wire7 = wire6[(1'h0):(1'h0)];
  assign wire8 = wire2[(5'h12):(2'h3)];
  always
    @(posedge clk) begin
      reg9 <= $signed((wire1[(2'h3):(1'h0)] * (wire3[(5'h10):(3'h5)] ?
          ((wire3 ? wire0 : wire0) >> wire0) : $signed($signed(wire3)))));
      if ($unsigned(wire2))
        begin
          if (((~wire6[(2'h2):(2'h2)]) ?
              (reg9[(3'h5):(3'h4)] == ($signed($signed(wire6)) && $unsigned({wire4}))) : {$signed((wire0[(4'h9):(4'h9)] ?
                      $unsigned(wire4) : (wire6 || wire1)))}))
            begin
              reg10 <= (((8'ha2) ? wire6[(1'h0):(1'h0)] : $unsigned(wire1)) ?
                  $signed((((^~wire0) ?
                          wire5[(3'h5):(3'h4)] : $unsigned(wire6)) ?
                      (~&(~&wire5)) : ($unsigned((8'hbe)) || wire6))) : wire7);
              reg11 <= $signed({wire6[(2'h3):(1'h0)],
                  (({reg10} > (wire2 ?
                      wire7 : wire1)) ^ $signed((reg10 * wire6)))});
              reg12 <= wire7;
              reg13 <= wire1;
            end
          else
            begin
              reg10 <= wire2[(4'h8):(4'h8)];
              reg11 <= $unsigned(wire2[(5'h12):(4'hf)]);
              reg12 <= reg12;
            end
        end
      else
        begin
          reg10 <= reg10;
          reg11 <= $signed((8'ha4));
          reg12 <= $unsigned(((~&(~&(reg12 << wire0))) ?
              wire1 : reg10[(3'h6):(3'h4)]));
          reg13 <= $unsigned((~|(&(~$signed(wire6)))));
          reg14 <= wire7;
        end
      reg15 <= $unsigned((reg10[(4'ha):(1'h0)] ?
          (wire5[(3'h4):(2'h2)] * ((wire1 < (8'hbe)) ^ wire1[(3'h4):(2'h3)])) : {($unsigned(reg11) ?
                  wire8 : (reg10 ? wire6 : wire4)),
              wire6[(1'h1):(1'h1)]}));
      if ($signed((wire5[(2'h3):(2'h3)] && {(|reg14[(5'h11):(4'hf)]),
          (^(reg11 ? reg12 : wire7))})))
        begin
          reg16 <= $unsigned((reg15 || (+$unsigned((|reg15)))));
          if ($unsigned(reg15))
            begin
              reg17 <= {((((reg15 ? reg15 : wire4) ?
                          $unsigned(reg9) : $signed(wire8)) ?
                      $signed($unsigned(wire4)) : $unsigned(wire2)) && $signed((!(wire0 | wire6)))),
                  reg16};
              reg18 <= $unsigned(wire6);
              reg19 <= reg15[(1'h1):(1'h0)];
              reg20 <= $unsigned((-$unsigned(wire3)));
              reg21 <= ($signed(({(~^wire7)} >> ((^wire3) ?
                  {wire1} : (reg17 >>> reg10)))) >> reg18[(3'h6):(1'h1)]);
            end
          else
            begin
              reg17 <= (+$signed($signed(((wire6 >= (8'haf)) ?
                  {wire4} : $unsigned(wire7)))));
              reg18 <= wire4[(3'h6):(3'h5)];
              reg19 <= $signed($signed($unsigned(((reg21 ? (8'ha7) : reg20) ?
                  $signed(reg11) : $signed(reg19)))));
              reg20 <= $signed((&$signed(reg19)));
            end
        end
      else
        begin
          reg16 <= ($signed((reg10[(3'h7):(3'h6)] ?
              wire6 : ((~&reg16) ?
                  (-wire7) : $unsigned(reg16)))) <<< (!{(+(!wire5)),
              $signed($signed(wire2))}));
        end
      if ((^~reg11[(1'h0):(1'h0)]))
        begin
          reg22 <= {($unsigned(wire6) ^ (((-reg14) ?
                      $signed(reg17) : (~^(8'hb1))) ?
                  ((reg9 && reg15) >>> (reg21 ^~ (8'hb2))) : (reg19 <= ((8'hb1) - (8'hb2)))))};
        end
      else
        begin
          reg22 <= reg10;
          reg23 <= (($signed($unsigned($unsigned(reg9))) >= $signed(wire5)) == ((~&$signed(wire0)) && $unsigned(wire7[(4'hb):(3'h5)])));
          reg24 <= ($unsigned(wire3[(4'hc):(4'hb)]) ?
              (~{$unsigned({(8'hbb)})}) : wire3[(4'hd):(4'h8)]);
        end
    end
  always
    @(posedge clk) begin
      if ((^(8'ha4)))
        begin
          reg25 <= $signed($signed(reg14));
          reg26 <= $signed(($unsigned(($signed(reg12) ?
                  reg22 : (reg10 && wire5))) ?
              (~&(|(reg23 ? reg19 : reg9))) : $signed({$signed((8'ha4)),
                  $signed(reg16)})));
          reg27 <= (^~$signed((^$unsigned($signed((7'h40))))));
          reg28 <= reg17;
        end
      else
        begin
          reg25 <= reg26[(4'ha):(3'h5)];
        end
      reg29 <= (-reg27);
      if ((($signed({wire1}) ^ $unsigned(((reg26 ^~ reg15) >>> (reg29 > reg21)))) + reg10[(4'h9):(3'h7)]))
        begin
          reg30 <= $signed(wire5);
        end
      else
        begin
          reg30 <= ((8'ha5) >= $unsigned($unsigned($unsigned($unsigned(reg27)))));
          reg31 <= (($signed($signed($unsigned(reg25))) ?
                  wire4 : wire5[(3'h5):(2'h2)]) ?
              wire2[(1'h0):(1'h0)] : reg14);
        end
    end
  assign wire32 = (~^((8'ha1) || reg29));
  assign wire33 = (-(8'hbb));
  assign wire34 = (~|$unsigned((^(~(reg24 ? (8'hb8) : wire5)))));
  module35 #() modinst122 (wire121, clk, reg15, reg27, wire0, reg30, reg26);
  assign wire123 = ({(~^(|$signed(reg21)))} ?
                       (~reg28) : $unsigned($unsigned($signed(wire33[(1'h1):(1'h1)]))));
  assign wire124 = $unsigned(wire34[(1'h1):(1'h0)]);
  assign wire125 = (|wire32[(1'h1):(1'h0)]);
  assign wire126 = reg22;
  always
    @(posedge clk) begin
      reg127 <= ({($unsigned((~reg31)) ^ (&(wire33 ? reg10 : reg14)))} ?
          $unsigned(reg10) : (wire123[(3'h5):(2'h3)] ? wire125 : reg12));
      reg128 <= (~^((reg12 == (~|reg9[(4'ha):(2'h2)])) ^ $signed(($signed((8'hbd)) - $signed(reg11)))));
      reg129 <= (~^$signed($unsigned((!(~&reg31)))));
    end
  module130 #() modinst206 (.y(wire205), .wire135(reg24), .clk(clk), .wire134(reg28), .wire132(reg127), .wire131(reg12), .wire133(reg14));
  assign wire207 = {reg28};
  module35 #() modinst209 (wire208, clk, reg13, reg26, wire125, wire123, wire32);
  assign wire210 = $unsigned($unsigned((-wire125[(3'h6):(2'h3)])));
  assign wire211 = $unsigned(wire34);
  assign wire212 = $signed(($unsigned((8'hbe)) ?
                       $signed($unsigned((reg26 ?
                           wire208 : wire4))) : ($unsigned((~&wire121)) ?
                           $signed({reg28}) : (^~$signed((8'hb0))))));
  assign wire213 = reg128;
endmodule

module module130
#(parameter param203 = ((~(~(8'ha9))) ? (({((8'h9c) ? (8'hb3) : (7'h42))} ^~ (|(8'hae))) > (((^(8'hbc)) ? ((8'hb9) ? (8'ha9) : (8'haf)) : ((8'h9e) ? (8'h9d) : (8'hbe))) ^ (((8'haf) ? (8'hae) : (7'h41)) <<< {(8'hb0), (8'ha0)}))) : (8'hb7)), 
parameter param204 = (|(((param203 > (param203 & param203)) ? {{param203, param203}, (param203 ? param203 : (8'haf))} : (8'hbb)) >> (~|param203))))
(y, clk, wire131, wire132, wire133, wire134, wire135);
  output wire [(32'h1ad):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire131;
  input wire signed [(5'h12):(1'h0)] wire132;
  input wire signed [(5'h13):(1'h0)] wire133;
  input wire signed [(5'h10):(1'h0)] wire134;
  input wire [(4'h9):(1'h0)] wire135;
  wire [(5'h12):(1'h0)] wire202;
  wire [(5'h12):(1'h0)] wire201;
  wire signed [(2'h2):(1'h0)] wire191;
  wire signed [(5'h14):(1'h0)] wire190;
  wire signed [(2'h2):(1'h0)] wire189;
  wire [(5'h10):(1'h0)] wire188;
  wire [(3'h4):(1'h0)] wire187;
  wire [(2'h3):(1'h0)] wire186;
  wire signed [(4'ha):(1'h0)] wire185;
  wire signed [(4'ha):(1'h0)] wire184;
  wire [(3'h5):(1'h0)] wire147;
  wire signed [(5'h10):(1'h0)] wire168;
  wire [(4'he):(1'h0)] wire182;
  reg [(3'h5):(1'h0)] reg200 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg198 = (1'h0);
  reg [(4'he):(1'h0)] reg197 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg194 = (1'h0);
  reg [(5'h15):(1'h0)] reg193 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg192 = (1'h0);
  reg [(4'h8):(1'h0)] reg153 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg151 = (1'h0);
  reg [(4'hc):(1'h0)] reg150 = (1'h0);
  reg [(2'h3):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg145 = (1'h0);
  reg [(3'h7):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg139 = (1'h0);
  reg [(4'hf):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg136 = (1'h0);
  assign y = {wire202,
                 wire201,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire147,
                 wire168,
                 wire182,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned((wire135[(4'h8):(2'h2)] ?
          (-((~wire134) < (wire132 ?
              wire133 : wire134))) : wire134[(3'h5):(1'h0)])))
        begin
          reg136 <= {$unsigned((~|$unsigned($unsigned(wire135)))), wire134};
        end
      else
        begin
          if ((~|($unsigned(wire133[(5'h12):(4'hc)]) >> reg136[(4'hc):(2'h2)])))
            begin
              reg136 <= ((wire134 ? $signed(wire132) : (reg136 || (+wire133))) ?
                  (&$unsigned((~^$unsigned(wire133)))) : $signed((^wire131)));
              reg137 <= reg136[(3'h4):(2'h2)];
              reg138 <= reg137;
            end
          else
            begin
              reg136 <= reg138[(4'hb):(3'h4)];
            end
          reg139 <= (+(~^$signed({$unsigned(reg136), (wire132 <= wire131)})));
        end
      reg140 <= ($unsigned((~wire135)) ? reg138 : reg139[(3'h5):(2'h3)]);
      if ((8'hb8))
        begin
          reg141 <= $signed(((($signed((8'hb6)) ^ $unsigned(wire135)) ?
                  wire135[(1'h1):(1'h1)] : reg136) ?
              wire131[(4'h9):(1'h1)] : $signed(((8'ha6) || reg138))));
          reg142 <= ((reg138 ?
                  $unsigned((|wire131[(1'h0):(1'h0)])) : $unsigned($unsigned(wire135[(3'h7):(2'h3)]))) ?
              (^~($unsigned((+(8'hb6))) ?
                  reg141 : (reg136 + ((8'hbe) ?
                      wire134 : wire132)))) : {{wire135}});
          reg143 <= (($signed($unsigned($signed((8'ha6)))) + $unsigned((+(^wire133)))) ?
              ((^~$signed($unsigned(reg142))) ?
                  (reg141 ?
                      ($signed(wire135) ?
                          reg138 : (^reg136)) : $signed((reg136 == reg137))) : $signed(reg138[(4'ha):(3'h5)])) : ({($signed(reg138) - {reg142,
                          reg136}),
                      reg137} ?
                  wire132 : reg137));
          reg144 <= $unsigned($signed(((wire134 - (!(8'hbd))) ?
              $signed(reg137) : $signed((reg137 ? reg140 : wire133)))));
          reg145 <= {reg143[(3'h6):(3'h4)], $signed($unsigned(reg143))};
        end
      else
        begin
          reg141 <= reg139;
          reg142 <= (~&reg143);
          if (({(reg140 ?
                  (reg143[(3'h6):(1'h0)] ?
                      (wire131 ?
                          wire132 : wire132) : reg145) : (8'hbe))} <<< reg141))
            begin
              reg143 <= ($unsigned((|wire133[(4'hc):(2'h3)])) && ((wire134 ?
                      reg142 : reg145[(3'h4):(1'h0)]) ?
                  {reg142[(4'he):(4'ha)]} : $unsigned((^~$unsigned(wire133)))));
            end
          else
            begin
              reg143 <= (&reg143[(1'h1):(1'h1)]);
            end
          reg144 <= reg144[(3'h6):(2'h3)];
          reg145 <= ((reg140[(3'h5):(1'h0)] ?
                  ((+$unsigned((8'ha0))) ?
                      ($signed((8'hb6)) | reg138[(4'hd):(2'h2)]) : {(-(8'hb3))}) : ((reg141[(4'hb):(3'h5)] | {reg137}) >>> wire132[(2'h2):(1'h1)])) ?
              wire134[(3'h6):(3'h4)] : (reg141[(3'h4):(3'h4)] ?
                  (~^$unsigned(reg136[(4'h9):(1'h0)])) : ($unsigned($signed((8'hac))) ?
                      {wire135, $unsigned(reg136)} : (&{reg136}))));
        end
      reg146 <= (+(~^$signed({((8'haf) ? reg144 : reg137),
          ((8'hb0) ? (8'h9d) : reg138)})));
    end
  assign wire147 = reg144;
  always
    @(posedge clk) begin
      if (({{wire133}, wire147[(3'h4):(2'h2)]} ~^ (+((+(8'hb6)) << reg146))))
        begin
          reg148 <= reg143[(1'h0):(1'h0)];
          reg149 <= ($unsigned($unsigned(reg143[(3'h5):(3'h4)])) ?
              (^wire135[(1'h0):(1'h0)]) : reg143);
        end
      else
        begin
          reg148 <= reg138[(2'h3):(1'h0)];
        end
      reg150 <= reg136[(5'h12):(4'h9)];
      reg151 <= reg139[(1'h0):(1'h0)];
      reg152 <= $unsigned((!$signed(((reg145 >> (8'hab)) || (reg137 ?
          (7'h44) : wire147)))));
      reg153 <= wire133;
    end
  module154 #() modinst169 (wire168, clk, reg152, wire131, reg141, wire133);
  module170 #() modinst183 (wire182, clk, reg136, reg150, wire132, wire131, wire134);
  assign wire184 = $signed($signed(reg136[(4'hc):(3'h5)]));
  assign wire185 = {$unsigned({$unsigned((reg149 != reg148)),
                           (~$signed(reg141))})};
  assign wire186 = (reg152 ?
                       $unsigned(($unsigned(wire131[(2'h3):(1'h0)]) | $signed((wire182 ~^ wire184)))) : $signed(($unsigned(wire132) ?
                           reg151[(3'h4):(1'h0)] : $unsigned((8'h9e)))));
  assign wire187 = {((reg149 ?
                           reg138[(1'h0):(1'h0)] : ((wire134 <= wire134) ?
                               ((8'hb9) > wire133) : reg142)) & (+($signed(reg151) ?
                           $signed(reg149) : $unsigned(reg144)))),
                       ((reg138[(4'hc):(1'h0)] - (&(wire184 * wire184))) & $unsigned(wire147[(3'h5):(3'h5)]))};
  assign wire188 = (8'haa);
  assign wire189 = {(!$unsigned(wire147[(1'h0):(1'h0)]))};
  assign wire190 = (((wire135 == $signed($signed(reg148))) ^~ (wire135 ?
                       wire187 : reg146[(2'h2):(2'h2)])) << (^~(~&((~&(7'h42)) ?
                       reg138 : (reg148 * (8'ha6))))));
  assign wire191 = $signed($signed(reg137[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg192 <= (-wire186[(2'h3):(2'h3)]);
      if (reg143[(2'h2):(2'h2)])
        begin
          reg193 <= ($signed((^$unsigned($unsigned(reg141)))) && ($signed(wire184) ~^ reg149[(1'h0):(1'h0)]));
          if ($unsigned(reg193))
            begin
              reg194 <= (-($signed(wire188) > ($unsigned((~^reg141)) ?
                  (^~(reg149 >>> wire168)) : ((-wire147) ?
                      $unsigned(wire135) : (wire135 ? wire186 : wire182)))));
            end
          else
            begin
              reg194 <= $unsigned(wire187);
              reg195 <= (+(reg140 << $unsigned(((8'hb2) ?
                  wire134 : (|reg148)))));
            end
          if ((-($signed((((8'ha3) ?
              wire184 : reg195) + wire191[(2'h2):(1'h1)])) >= $signed((&((8'ha9) ?
              wire189 : wire185))))))
            begin
              reg196 <= wire189[(1'h1):(1'h1)];
            end
          else
            begin
              reg196 <= $signed(((|(8'ha2)) ^ $signed({{wire185}, reg141})));
              reg197 <= reg151;
              reg198 <= $unsigned(((8'hab) <= (+$unsigned(((8'h9f) >>> reg138)))));
              reg199 <= ({reg149[(2'h3):(1'h1)]} ?
                  ((~^$signed($signed(reg152))) ?
                      reg153 : (-{(reg194 ? wire134 : wire189),
                          $signed(wire187)})) : (8'h9d));
            end
        end
      else
        begin
          reg193 <= (~wire184);
          reg194 <= reg149;
          reg195 <= $signed({reg193[(4'h8):(2'h3)],
              $signed($unsigned(((7'h41) * wire168)))});
          reg196 <= (wire135[(3'h7):(1'h0)] != (wire134[(1'h0):(1'h0)] ?
              ($signed($unsigned((8'hb5))) ?
                  $unsigned($unsigned(wire189)) : ($unsigned((8'hb6)) ?
                      wire184[(3'h6):(1'h0)] : ((8'haa) || reg193))) : $unsigned(wire132)));
        end
      reg200 <= ($signed($signed((~&(reg145 < reg153)))) ?
          (8'h9f) : (($unsigned((~^reg137)) > (~|(~(8'hb8)))) ?
              $unsigned({$unsigned(wire133)}) : reg136));
    end
  assign wire201 = (($unsigned(reg151) ?
                           $signed(wire131[(4'h8):(1'h1)]) : $signed(wire133[(4'h8):(3'h6)])) ?
                       reg143[(2'h2):(1'h0)] : wire191[(1'h1):(1'h0)]);
  assign wire202 = $signed({$signed($unsigned((wire131 ? wire182 : reg192)))});
endmodule

module module35
#(parameter param119 = ((|({((8'ha4) ^~ (7'h40))} ? (!{(8'hb5)}) : {((7'h40) >>> (8'hbb)), ((7'h40) ? (8'ha1) : (8'hb4))})) ? {(&(8'haa)), (((-(8'hbd)) * ((7'h43) ? (8'hb5) : (8'haa))) ? (((8'hbf) ? (7'h43) : (8'hbe)) || ((8'hab) <= (8'ha7))) : {((8'hb1) ? (8'haf) : (8'hb2))})} : {{((~^(8'ha1)) ? ((8'hb3) ? (8'hb2) : (8'hb0)) : (~^(8'ha5))), (((8'hb7) ? (7'h42) : (8'ha0)) != (&(8'ha1)))}}), 
parameter param120 = (^(^~param119)))
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire40;
  input wire signed [(4'hb):(1'h0)] wire39;
  input wire [(4'hd):(1'h0)] wire38;
  input wire signed [(5'h14):(1'h0)] wire37;
  input wire signed [(3'h7):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire118;
  wire signed [(4'h9):(1'h0)] wire117;
  wire signed [(5'h10):(1'h0)] wire116;
  wire [(4'h9):(1'h0)] wire114;
  wire [(2'h2):(1'h0)] wire81;
  wire signed [(3'h4):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire75;
  wire signed [(5'h13):(1'h0)] wire74;
  wire signed [(3'h4):(1'h0)] wire72;
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire114,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire72,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg41 <= wire40;
      if ($signed((~&wire37)))
        begin
          reg42 <= (($signed(((!wire39) > {wire38})) ?
              (^$signed((wire39 ?
                  wire39 : reg41))) : ((wire37 ~^ wire38[(3'h4):(1'h0)]) ?
                  $unsigned($signed(wire40)) : $unsigned(wire36[(1'h1):(1'h0)]))) >= wire38);
        end
      else
        begin
          if (($unsigned(wire40) && wire40))
            begin
              reg42 <= ((((8'ha2) ?
                      (((8'hb6) ^ wire36) * wire36[(3'h6):(3'h6)]) : ($signed(reg42) ?
                          $signed(wire38) : (reg41 ?
                              wire37 : wire38))) ^~ (wire39[(2'h3):(2'h3)] ?
                      $signed((7'h42)) : (((8'hb3) >>> wire37) <= (7'h40)))) ?
                  wire36 : wire40);
              reg43 <= reg42[(4'h9):(4'h9)];
              reg44 <= (+(((~|$unsigned(wire37)) & $unsigned(wire37)) >>> reg43[(2'h2):(1'h0)]));
              reg45 <= reg41[(2'h2):(1'h1)];
              reg46 <= ($unsigned(reg43) >= reg45[(3'h5):(1'h1)]);
            end
          else
            begin
              reg42 <= (($signed($signed({(8'h9d), reg43})) ?
                  (8'ha4) : reg44) | wire38);
              reg43 <= $unsigned(((8'hbc) ? reg44[(1'h0):(1'h0)] : reg44));
              reg44 <= ((reg42[(3'h5):(1'h0)] >> ((-$signed(reg44)) < {$unsigned(wire38),
                      (!wire38)})) ?
                  {$unsigned(($signed((8'ha4)) ?
                          reg46 : (reg45 ? (8'hbc) : reg46))),
                      $unsigned((^$signed(reg43)))} : (((+(+reg41)) ~^ {(reg42 ?
                          wire37 : (8'ha6)),
                      (wire39 | reg42)}) ~^ reg43));
            end
          if (($signed({$signed((wire40 | reg44))}) != $unsigned($unsigned(wire40))))
            begin
              reg47 <= (reg43 ?
                  ($signed($unsigned((8'ha4))) ?
                      (((~&reg43) ?
                          $unsigned(reg43) : ((8'ha7) ?
                              reg44 : reg41)) << reg45[(3'h7):(3'h4)]) : ($unsigned(reg46) - (^~$unsigned(reg43)))) : (({{reg46}} < $signed(((8'hbd) ?
                      reg45 : (8'h9f)))) >> reg44));
              reg48 <= $unsigned(reg44);
              reg49 <= (+(|(&{$unsigned(wire37)})));
            end
          else
            begin
              reg47 <= reg41;
              reg48 <= (+$unsigned(reg42));
              reg49 <= (reg44[(3'h7):(3'h7)] ?
                  ($unsigned(((reg46 - wire39) && ((8'hb1) ?
                      reg44 : reg48))) != ((~^$unsigned(wire37)) ^~ $signed((reg46 ?
                      reg41 : wire36)))) : {reg47[(2'h3):(1'h0)]});
            end
          reg50 <= reg45;
          if (reg48)
            begin
              reg51 <= ((reg45 ?
                      $signed(reg48) : ({(reg43 <<< reg48)} ?
                          (~&(reg41 ? reg44 : reg45)) : reg46)) ?
                  $unsigned((reg43[(3'h5):(1'h1)] && (+{reg46,
                      wire37}))) : (($signed((~&reg42)) + ($unsigned((8'hbd)) ?
                          (reg44 ? reg42 : (8'hbf)) : reg41[(4'h8):(2'h2)])) ?
                      reg47 : ({wire36[(2'h2):(2'h2)]} ?
                          $unsigned(reg50[(4'h8):(1'h1)]) : {(wire38 ?
                                  wire40 : reg48)})));
              reg52 <= reg48[(2'h3):(2'h3)];
            end
          else
            begin
              reg51 <= $signed((&(^~reg45)));
            end
        end
      reg53 <= ((-{wire36, reg52}) ?
          (^~(+$signed({reg44}))) : $signed((~^(+wire37[(2'h3):(2'h2)]))));
    end
  module54 #() modinst73 (wire72, clk, reg49, wire39, wire40, reg44);
  assign wire74 = (|((+$unsigned(wire38)) ? wire72 : reg47[(1'h0):(1'h0)]));
  assign wire75 = (+(8'ha1));
  assign wire76 = (reg42[(4'h8):(1'h1)] || ($signed(($unsigned(reg42) ?
                          $signed(reg41) : wire72)) ?
                      (&((reg50 <= wire39) <= wire74[(3'h6):(3'h4)])) : $signed($unsigned((reg48 > wire37)))));
  assign wire77 = {$signed(($unsigned(((7'h41) ? wire74 : reg51)) ?
                          {wire72,
                              (reg48 ?
                                  wire76 : reg44)} : ((reg49 >>> reg50) <<< (^~reg45)))),
                      (-(^~(~&$unsigned(reg53))))};
  assign wire78 = $signed({((wire72[(3'h4):(2'h2)] >> $unsigned(wire75)) ?
                          $signed($signed(wire76)) : {(reg52 ?
                                  wire39 : reg41)})});
  assign wire79 = ($signed(reg49[(5'h15):(4'h9)]) ~^ reg49[(3'h5):(3'h5)]);
  assign wire80 = $signed(reg46[(5'h10):(4'hd)]);
  assign wire81 = ($signed((~|{(reg53 ? (8'hb6) : reg50),
                          reg45[(1'h1):(1'h0)]})) ?
                      (wire40[(1'h0):(1'h0)] ?
                          (($signed(wire72) ? $unsigned((8'ha9)) : reg42) ?
                              $unsigned((8'hbd)) : reg48) : ($unsigned($signed(reg52)) < (|(+wire72)))) : $signed($unsigned(($signed(reg53) ?
                          $unsigned(wire78) : $signed(reg53)))));
  module82 #() modinst115 (.wire85(reg42), .wire86(wire75), .y(wire114), .clk(clk), .wire83(wire74), .wire84(reg41), .wire87(reg47));
  assign wire116 = (wire37[(4'h8):(1'h1)] - wire39[(4'h9):(3'h7)]);
  assign wire117 = $signed(($unsigned(wire75[(1'h1):(1'h1)]) ^ $signed(((wire114 >> wire77) ?
                       wire77 : {reg52, reg43}))));
  assign wire118 = $signed(wire40);
endmodule

module module82  (y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire87;
  input wire [(4'h9):(1'h0)] wire86;
  input wire [(5'h15):(1'h0)] wire85;
  input wire signed [(2'h2):(1'h0)] wire84;
  input wire signed [(5'h13):(1'h0)] wire83;
  wire [(4'he):(1'h0)] wire113;
  wire [(3'h7):(1'h0)] wire112;
  wire signed [(5'h13):(1'h0)] wire111;
  wire signed [(4'hd):(1'h0)] wire110;
  wire signed [(5'h14):(1'h0)] wire109;
  wire [(5'h10):(1'h0)] wire107;
  wire signed [(4'h8):(1'h0)] wire106;
  wire signed [(3'h4):(1'h0)] wire93;
  wire signed [(5'h12):(1'h0)] wire92;
  wire signed [(5'h14):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire90;
  wire [(5'h13):(1'h0)] wire89;
  wire signed [(3'h7):(1'h0)] wire88;
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(4'hf):(1'h0)] reg105 = (1'h0);
  reg [(5'h11):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(4'ha):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg94 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire107,
                 wire106,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 reg108,
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
                 (1'h0)};
  assign wire88 = wire87;
  assign wire89 = (wire84 ?
                      wire86 : (((wire87 ?
                              $unsigned(wire88) : $unsigned(wire88)) + (wire87 ^~ wire88)) ?
                          wire86[(1'h1):(1'h0)] : $signed((wire85 ?
                              (^~wire83) : wire83))));
  assign wire90 = $signed((~|{(~^(wire87 ? (8'hbd) : wire84)),
                      wire88[(1'h1):(1'h0)]}));
  assign wire91 = $unsigned({$signed((wire90[(5'h10):(3'h6)] ?
                          (~^wire88) : (^~wire87)))});
  assign wire92 = ($unsigned((({wire90, wire84} + $unsigned(wire89)) ?
                      ((wire88 ?
                          wire87 : wire88) <<< $unsigned(wire83)) : (wire83[(5'h13):(3'h4)] ?
                          {(8'hb7)} : ((8'hba) ^ wire85)))) >> wire89);
  assign wire93 = ($unsigned((8'hac)) ?
                      (7'h40) : $signed((($unsigned(wire86) + (^wire91)) * {(7'h42)})));
  always
    @(posedge clk) begin
      reg94 <= ((!wire88) > (~&$signed(((wire91 | wire92) >> ((8'hbf) ?
          wire89 : wire85)))));
      if (wire90)
        begin
          reg95 <= (+$unsigned((((wire92 ?
              wire93 : wire87) ^~ (8'haf)) <<< (^~{wire90, wire91}))));
          if (wire89)
            begin
              reg96 <= wire84;
              reg97 <= reg95;
              reg98 <= (($signed(reg95) << $unsigned((^wire90))) ~^ (wire85[(4'h9):(3'h6)] ?
                  (-reg97) : wire91[(3'h7):(3'h6)]));
              reg99 <= wire87[(2'h2):(2'h2)];
              reg100 <= wire84;
            end
          else
            begin
              reg96 <= $unsigned(wire92);
            end
          reg101 <= ((reg95 >= (~$signed({wire90,
              wire83}))) || wire86[(3'h5):(2'h2)]);
          if ($unsigned($signed(($signed($signed(reg94)) == reg97[(1'h0):(1'h0)]))))
            begin
              reg102 <= (-((~$signed((8'h9f))) == {(~&(reg98 ?
                      reg97 : wire86))}));
              reg103 <= (reg102 ? reg102 : wire90[(5'h10):(5'h10)]);
              reg104 <= (~&(reg99[(5'h10):(1'h0)] > ($signed(reg101[(3'h6):(2'h2)]) ^~ $unsigned(wire85[(4'he):(1'h1)]))));
            end
          else
            begin
              reg102 <= $signed($signed(wire86[(1'h0):(1'h0)]));
              reg103 <= $unsigned(wire90);
            end
          reg105 <= reg94[(3'h4):(3'h4)];
        end
      else
        begin
          reg95 <= (((reg95 ? (-$unsigned(reg103)) : $unsigned((~|reg104))) ?
              (|(|{wire88})) : ({reg105, (~&reg96)} ?
                  reg98[(3'h7):(3'h7)] : ($unsigned(reg98) ?
                      (reg100 >>> reg94) : (wire93 & (8'ha4))))) ~^ (~&(-(reg102 | reg96))));
        end
    end
  assign wire106 = (8'haf);
  assign wire107 = ((reg99 || $signed($unsigned((~&wire93)))) ?
                       ((~wire85[(4'hb):(1'h1)]) ?
                           $signed(((|wire87) ~^ (wire86 ?
                               reg95 : wire106))) : $unsigned(wire91[(4'ha):(2'h3)])) : (~reg102[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg108 <= ($unsigned($signed($unsigned(wire90))) ?
          $unsigned((reg104 * reg102)) : ($unsigned($unsigned((wire93 || wire83))) ?
              {(wire85[(2'h3):(1'h1)] ?
                      wire87[(1'h1):(1'h0)] : (reg104 ? reg102 : reg97)),
                  (~&((7'h41) >= wire86))} : $unsigned(reg94)));
    end
  assign wire109 = ($unsigned((wire84[(1'h0):(1'h0)] == wire86)) - wire107[(5'h10):(3'h7)]);
  assign wire110 = (((^$unsigned((reg99 <= wire107))) < ((8'hbc) ?
                       (|reg96[(1'h0):(1'h0)]) : reg99)) > (!((reg99[(4'hd):(3'h5)] <= $unsigned(wire92)) ?
                       $signed((-wire106)) : wire106)));
  assign wire111 = ((~|$signed(wire109[(4'hc):(3'h6)])) ?
                       $unsigned((~(wire84 && wire86[(1'h0):(1'h0)]))) : ((reg104[(4'h9):(2'h2)] >> (((8'haa) || wire91) & wire91[(4'ha):(3'h6)])) <= $signed(($unsigned(wire90) <= wire83[(4'hf):(1'h1)]))));
  assign wire112 = $unsigned(wire89[(5'h11):(3'h4)]);
  assign wire113 = (8'hba);
endmodule

module module54  (y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire58;
  input wire [(4'hb):(1'h0)] wire57;
  input wire [(4'ha):(1'h0)] wire56;
  input wire signed [(5'h10):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire71;
  wire signed [(3'h4):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire69;
  wire [(5'h10):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire59;
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(3'h7):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire59,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 (1'h0)};
  assign wire59 = wire57[(3'h6):(3'h5)];
  always
    @(posedge clk) begin
      if ((wire55[(3'h5):(1'h0)] ?
          $signed(($unsigned((~wire57)) || (~$signed((8'h9d))))) : wire55))
        begin
          if (((^((wire58[(4'hf):(4'hf)] ~^ (wire57 ~^ wire55)) ?
                  {wire57, $signed(wire58)} : (wire57 ^~ wire56))) ?
              $unsigned((wire56[(4'h8):(3'h6)] >> (+$unsigned(wire56)))) : wire57[(3'h7):(1'h0)]))
            begin
              reg60 <= ((wire57 & (wire57 ?
                      (((8'haa) ?
                          wire59 : wire55) << $unsigned((8'hba))) : (wire59[(2'h3):(2'h2)] + wire59))) ?
                  (wire58[(2'h2):(1'h0)] + wire59[(4'h8):(2'h2)]) : $unsigned({$unsigned({wire56}),
                      (wire57 ? wire55[(4'h9):(2'h3)] : $unsigned(wire56))}));
            end
          else
            begin
              reg60 <= (-reg60);
              reg61 <= (wire59 ? $unsigned($unsigned(wire56)) : $signed(reg60));
              reg62 <= $unsigned((((&wire57[(3'h7):(3'h6)]) - ((wire55 >= (8'h9c)) ?
                      ((8'ha5) | wire55) : wire56)) ?
                  ((!{reg60}) <<< {$unsigned(wire58),
                      $signed(wire58)}) : $unsigned(wire58)));
              reg63 <= reg62;
              reg64 <= (~|$unsigned((~|$unsigned($unsigned(reg61)))));
            end
          reg65 <= (wire59[(2'h2):(1'h1)] ? reg62[(1'h0):(1'h0)] : wire55);
        end
      else
        begin
          reg60 <= (reg64[(3'h6):(1'h1)] <<< $unsigned(($signed((wire59 != reg65)) || reg61[(1'h0):(1'h0)])));
          reg61 <= {reg63[(3'h5):(2'h3)]};
          reg62 <= reg65[(4'hc):(1'h1)];
        end
      if (($unsigned($unsigned(wire58)) > {$signed($signed({wire56, reg61})),
          (8'hb1)}))
        begin
          reg66 <= reg61;
          reg67 <= $unsigned((-$unsigned({reg62, reg66})));
        end
      else
        begin
          reg66 <= reg60;
          reg67 <= (8'hb9);
        end
    end
  assign wire68 = reg61[(1'h1):(1'h0)];
  assign wire69 = ($unsigned($signed(reg63)) <<< ($unsigned(({(8'h9e),
                      reg62} >> (reg65 ?
                      reg62 : reg60))) >>> $unsigned((|(~&reg66)))));
  assign wire70 = ((^~wire55) ?
                      $signed(reg67) : $signed((~((^~reg62) > $signed(wire68)))));
  assign wire71 = $unsigned($signed(($signed(((8'hb8) ^ reg63)) ?
                      $signed({reg64, wire68}) : wire58)));
endmodule

module module170
#(parameter param181 = {(~&(-({(8'hb6)} << ((8'hb0) >>> (8'hb6))))), (((^{(8'ha2)}) ^~ ((!(8'hb7)) >> (8'hb7))) > (|(((7'h44) > (8'ha5)) ^~ ((8'hba) ? (8'ha4) : (7'h44)))))})
(y, clk, wire175, wire174, wire173, wire172, wire171);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire175;
  input wire signed [(3'h5):(1'h0)] wire174;
  input wire signed [(4'he):(1'h0)] wire173;
  input wire [(4'hd):(1'h0)] wire172;
  input wire [(4'he):(1'h0)] wire171;
  wire signed [(5'h15):(1'h0)] wire180;
  wire [(4'h9):(1'h0)] wire179;
  wire signed [(3'h7):(1'h0)] wire178;
  wire signed [(5'h11):(1'h0)] wire177;
  wire signed [(2'h3):(1'h0)] wire176;
  assign y = {wire180, wire179, wire178, wire177, wire176, (1'h0)};
  assign wire176 = ($signed(wire175) ?
                       $signed(wire173) : {$unsigned((!(wire171 ?
                               (8'ha2) : wire175))),
                           $signed(wire174)});
  assign wire177 = wire172[(3'h4):(3'h4)];
  assign wire178 = (~|$signed((~^wire171)));
  assign wire179 = $signed(wire175);
  assign wire180 = (8'hb3);
endmodule

module module154
#(parameter param167 = (^(+{((-(7'h43)) ? ((8'hb8) + (8'ha8)) : {(8'h9f), (8'hb3)})})))
(y, clk, wire158, wire157, wire156, wire155);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire158;
  input wire [(5'h11):(1'h0)] wire157;
  input wire [(3'h5):(1'h0)] wire156;
  input wire signed [(5'h13):(1'h0)] wire155;
  wire [(5'h15):(1'h0)] wire166;
  wire signed [(4'he):(1'h0)] wire165;
  wire signed [(3'h7):(1'h0)] wire164;
  wire [(4'hc):(1'h0)] wire163;
  wire [(4'h8):(1'h0)] wire162;
  wire [(3'h7):(1'h0)] wire161;
  wire [(4'hf):(1'h0)] wire160;
  wire [(5'h10):(1'h0)] wire159;
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 (1'h0)};
  assign wire159 = {wire155};
  assign wire160 = (!(((+$unsigned(wire156)) << {wire155[(4'he):(3'h4)]}) && wire157[(4'hd):(4'ha)]));
  assign wire161 = wire159;
  assign wire162 = $signed(wire155);
  assign wire163 = $signed(wire161[(3'h4):(1'h1)]);
  assign wire164 = (~(wire158 ? wire160 : $signed(wire162)));
  assign wire165 = $unsigned((!{(wire162[(1'h1):(1'h0)] ~^ {wire164, wire156}),
                       $unsigned(wire162)}));
  assign wire166 = wire165[(4'he):(2'h2)];
endmodule
