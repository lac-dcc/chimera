module top
#(parameter param164 = (+(({((8'ha1) ^~ (8'ha7)), (+(8'ha4))} ? (!{(7'h44)}) : ((8'h9d) > (~&(8'hb5)))) & (((~|(8'hb5)) ~^ (^(7'h44))) ? (((7'h44) ? (8'haf) : (8'hbe)) ? ((8'hb8) ? (8'haf) : (8'hb6)) : {(7'h42)}) : (^(!(8'ha1)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1cf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire163;
  wire [(2'h3):(1'h0)] wire162;
  wire [(5'h14):(1'h0)] wire161;
  wire signed [(5'h15):(1'h0)] wire160;
  wire signed [(5'h14):(1'h0)] wire159;
  wire [(5'h11):(1'h0)] wire158;
  wire signed [(4'hd):(1'h0)] wire157;
  wire signed [(4'hc):(1'h0)] wire155;
  wire signed [(4'h9):(1'h0)] wire154;
  wire signed [(4'hc):(1'h0)] wire153;
  wire [(5'h15):(1'h0)] wire135;
  wire signed [(4'h9):(1'h0)] wire134;
  wire [(4'h8):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire132;
  reg [(5'h13):(1'h0)] reg156 = (1'h0);
  reg [(4'hf):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg150 = (1'h0);
  reg [(3'h6):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg148 = (1'h0);
  reg [(5'h14):(1'h0)] reg147 = (1'h0);
  reg [(5'h13):(1'h0)] reg146 = (1'h0);
  reg [(2'h3):(1'h0)] reg145 = (1'h0);
  reg [(2'h3):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg143 = (1'h0);
  reg [(4'he):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg140 = (1'h0);
  reg [(2'h2):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg138 = (1'h0);
  reg [(4'h8):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg136 = (1'h0);
  reg [(5'h11):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire155,
                 wire154,
                 wire153,
                 wire135,
                 wire134,
                 wire46,
                 wire6,
                 wire5,
                 wire132,
                 reg156,
                 reg152,
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
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 (1'h0)};
  assign wire5 = wire1[(4'h8):(3'h7)];
  assign wire6 = $unsigned((~|$signed(($signed(wire0) ?
                     (&wire4) : $signed(wire1)))));
  module7 #() modinst47 (.wire10(wire0), .clk(clk), .wire8(wire4), .wire12(wire5), .wire11(wire3), .y(wire46), .wire9(wire6));
  always
    @(posedge clk) begin
      reg48 <= $signed({$unsigned($unsigned($signed(wire1)))});
      reg49 <= ($unsigned($signed({{wire0},
          $signed(wire1)})) ~^ (($unsigned({wire3, reg48}) + (^(-wire5))) ?
          $signed((((8'hac) - wire46) ~^ (+wire3))) : $unsigned(($signed(wire1) ?
              {(8'ha7)} : (wire6 * reg48)))));
    end
  always
    @(posedge clk) begin
      if ((~^(^$unsigned($signed(wire46[(2'h3):(2'h2)])))))
        begin
          reg50 <= ((~|$unsigned((~^(~|wire6)))) + $unsigned($signed($unsigned((~wire6)))));
          reg51 <= $signed($signed((8'ha9)));
        end
      else
        begin
          reg50 <= $unsigned(wire5);
        end
    end
  module52 #() modinst133 (.wire54(reg50), .wire56(wire2), .wire55(wire3), .clk(clk), .y(wire132), .wire53(wire0));
  assign wire134 = $unsigned(($signed($unsigned(wire0[(4'h8):(3'h7)])) >= (~|(^~$signed((8'hbc))))));
  assign wire135 = $unsigned((wire46 > $unsigned(wire4[(4'hd):(2'h2)])));
  always
    @(posedge clk) begin
      reg136 <= (($signed(((&wire3) ?
              $signed(wire2) : wire6)) || {((8'ha4) ~^ wire1)}) ?
          $signed($unsigned((wire3[(1'h0):(1'h0)] ?
              {wire132, wire1} : $signed(wire3)))) : ({((&reg49) ?
                      wire0 : {wire5}),
                  $unsigned((wire134 ? wire3 : reg49))} ?
              (&reg48[(4'ha):(3'h7)]) : (-(wire0[(2'h2):(1'h1)] ?
                  $signed(reg51) : wire5))));
      reg137 <= wire0;
      reg138 <= ({((~&(8'ha7)) ~^ (|$unsigned(wire132)))} != (~|$signed(reg48[(2'h3):(2'h2)])));
      if ((8'hba))
        begin
          reg139 <= $signed((wire6 ^~ (~^(8'hb8))));
          reg140 <= ((&(wire4 ?
              $unsigned((wire4 ?
                  reg48 : wire132)) : $unsigned((8'h9c)))) >>> wire4[(4'hf):(4'he)]);
          if (reg136)
            begin
              reg141 <= ((wire6 * wire135[(4'hc):(4'h8)]) * ((~^$unsigned((reg139 ^~ reg50))) - ($unsigned((8'hb1)) > {reg140[(2'h2):(1'h0)]})));
              reg142 <= wire0;
              reg143 <= (~&((&$unsigned($unsigned(reg139))) ?
                  $unsigned($signed($signed((8'ha4)))) : (($unsigned(reg139) ?
                      {wire6} : wire1[(5'h14):(3'h5)]) <<< ((wire6 ?
                      wire3 : (8'hb4)) >= {(8'ha1), reg139}))));
              reg144 <= ((wire5[(3'h5):(1'h1)] && ($unsigned(reg139) <= ((reg51 ?
                      reg49 : (8'haf)) ?
                  $signed(wire1) : $unsigned(reg50)))) | (wire132 ?
                  ($unsigned($unsigned((8'ha9))) << ($signed(wire1) && $signed(wire1))) : wire46));
            end
          else
            begin
              reg141 <= $signed((^~wire5));
              reg142 <= ($signed((|wire132)) - $unsigned(wire0));
              reg143 <= (-((8'hb0) ?
                  ($signed(wire0) ?
                      (7'h40) : $signed((wire1 & (7'h44)))) : reg144));
              reg144 <= (($unsigned($signed((reg142 * reg137))) ?
                  wire6 : (~^$unsigned($signed(reg143)))) << $signed({wire4[(4'hd):(3'h5)]}));
              reg145 <= reg142[(4'he):(3'h6)];
            end
          reg146 <= $unsigned(wire1[(3'h5):(2'h3)]);
          if (wire4)
            begin
              reg147 <= (reg51[(4'hc):(2'h2)] ?
                  (~^wire1[(4'hd):(1'h0)]) : {$signed(((wire5 ?
                          reg49 : reg146) >>> {reg140}))});
            end
          else
            begin
              reg147 <= reg139[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg139 <= (|$signed(reg146));
          reg140 <= (+wire46);
        end
      if (reg144[(2'h3):(2'h3)])
        begin
          reg148 <= ({reg145} ?
              (($signed($signed(wire1)) != $unsigned(wire3[(5'h10):(4'he)])) ~^ reg136) : (wire6 & ($unsigned($signed(reg50)) ?
                  $unsigned($signed(wire46)) : reg141)));
          if (reg51[(4'hb):(1'h0)])
            begin
              reg149 <= (~^reg141[(2'h2):(1'h1)]);
            end
          else
            begin
              reg149 <= $unsigned(($unsigned((|(^~wire2))) > wire4[(4'hb):(3'h6)]));
              reg150 <= wire1;
              reg151 <= (8'hb4);
            end
          reg152 <= reg151[(3'h7):(3'h5)];
        end
      else
        begin
          reg148 <= $unsigned(($unsigned($signed((~|reg141))) ?
              (~&$signed($signed(reg147))) : ((wire6 == (&(8'hb3))) ?
                  $unsigned((reg49 * (7'h43))) : ($unsigned(wire3) ?
                      (reg138 ? (8'hb1) : wire1) : $unsigned(reg151)))));
          reg149 <= reg50;
        end
    end
  assign wire153 = $unsigned((~^$signed(reg51[(4'hc):(4'hc)])));
  assign wire154 = (((~&wire2[(2'h2):(2'h2)]) > reg148) ?
                       $unsigned(reg48) : $unsigned((((wire0 || reg152) | $signed(wire46)) ?
                           (8'hbc) : ((wire132 ?
                               (8'hbb) : wire134) < $signed(wire132)))));
  assign wire155 = wire6[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg156 <= wire135;
    end
  assign wire157 = (&reg138[(1'h0):(1'h0)]);
  assign wire158 = reg140[(2'h3):(2'h3)];
  assign wire159 = (&reg139);
  assign wire160 = $signed(wire1);
  assign wire161 = wire1[(3'h4):(1'h0)];
  assign wire162 = (^~$signed((8'haf)));
  assign wire163 = ($unsigned($unsigned(wire159)) ?
                       wire3 : {((~(reg49 ^~ reg139)) > {(wire162 > reg138),
                               (8'hb2)})});
endmodule

module module52
#(parameter param130 = (~&(((((8'hb7) ? (8'ha0) : (8'h9c)) < (8'hab)) <<< (((8'hb8) >>> (8'ha6)) ^ ((8'ha6) ~^ (8'hb8)))) - ((^~((8'hb5) ? (7'h40) : (8'ha8))) ? (((8'h9c) ? (8'h9d) : (7'h42)) ? (8'h9f) : ((8'hae) >>> (8'hac))) : (-(^(8'hbe)))))), 
parameter param131 = ((((param130 ? (param130 && param130) : (~|(8'hb1))) ? ((8'ha2) ^~ (~&param130)) : param130) | (((param130 ^~ param130) + (param130 ? param130 : param130)) <<< ((param130 ? param130 : param130) < {param130, param130}))) ? param130 : {(((param130 ? param130 : param130) <<< param130) * {param130})}))
(y, clk, wire53, wire54, wire55, wire56);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire53;
  input wire signed [(5'h14):(1'h0)] wire54;
  input wire signed [(4'hc):(1'h0)] wire55;
  input wire [(3'h7):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire129;
  wire [(4'h9):(1'h0)] wire128;
  wire signed [(5'h11):(1'h0)] wire58;
  wire [(3'h4):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire61;
  wire [(5'h15):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire126;
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  assign y = {wire129,
                 wire128,
                 wire58,
                 wire59,
                 wire61,
                 wire68,
                 wire126,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg60,
                 reg57,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg57 <= $unsigned(($unsigned((^(wire56 ? wire54 : wire55))) ?
          $signed($signed($unsigned(wire53))) : (^~($unsigned(wire56) ?
              (-wire55) : wire53))));
    end
  assign wire58 = wire56[(3'h5):(2'h2)];
  assign wire59 = wire55;
  always
    @(posedge clk) begin
      reg60 <= {wire53};
    end
  assign wire61 = $signed(wire53);
  always
    @(posedge clk) begin
      reg62 <= wire55;
      reg63 <= $signed({((reg62 >>> reg57[(4'h9):(3'h7)]) ?
              ($unsigned(reg57) ?
                  wire58[(2'h2):(1'h0)] : {wire58,
                      wire56}) : $unsigned(((8'hbd) ? reg62 : (8'ha8))))});
      if ($signed(wire53))
        begin
          reg64 <= ((+((reg57 ?
              (~|wire59) : wire53[(1'h0):(1'h0)]) == (wire54[(4'hd):(4'ha)] <<< {wire59}))) || wire56);
          reg65 <= ((^~wire58[(1'h1):(1'h1)]) < ({((wire59 ? wire55 : wire56) ?
                      wire58[(2'h2):(1'h0)] : wire61)} ?
              $signed(wire53[(2'h2):(2'h2)]) : {$unsigned(reg60[(1'h0):(1'h0)])}));
          reg66 <= {wire59, (!(wire55 ? wire59 : wire61[(4'h8):(2'h3)]))};
        end
      else
        begin
          reg64 <= wire58;
          reg65 <= ({$unsigned({(reg60 | reg57)})} ?
              (-$signed(wire56[(3'h5):(3'h5)])) : wire55[(2'h2):(1'h0)]);
        end
      reg67 <= reg65;
    end
  assign wire68 = reg57;
  module69 #() modinst127 (.clk(clk), .wire71(wire68), .y(wire126), .wire72(wire58), .wire74(reg63), .wire73(reg57), .wire70(wire53));
  assign wire128 = (reg67 ?
                       {{wire68,
                               (|(wire58 >> wire55))}} : $unsigned($signed(wire59[(1'h0):(1'h0)])));
  assign wire129 = $signed((8'hb4));
endmodule

module module7
#(parameter param44 = {{({((8'hbf) ? (7'h42) : (8'ha2)), {(8'hac)}} ? (((8'haf) - (8'ha4)) ? ((8'hb1) >= (8'hb3)) : (&(8'hbe))) : (((7'h42) * (8'hba)) ? (^(8'hae)) : ((8'hb2) & (8'hae))))}}, 
parameter param45 = param44)
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire12;
  input wire signed [(4'hd):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire10;
  input wire signed [(2'h3):(1'h0)] wire9;
  input wire [(3'h5):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire43;
  wire signed [(5'h14):(1'h0)] wire42;
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  assign y = {wire43,
                 wire42,
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
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg13 <= wire8[(1'h1):(1'h0)];
      reg14 <= $signed({({(8'ha6), (|reg13)} ?
              (+(!wire11)) : ((wire12 + wire12) >> wire9)),
          wire9});
      reg15 <= $unsigned($unsigned(reg13[(1'h0):(1'h0)]));
      reg16 <= $signed({((^~{wire11, reg15}) ?
              {wire9[(2'h3):(2'h3)],
                  $unsigned((8'hbf))} : $unsigned(reg13[(1'h0):(1'h0)])),
          reg14[(2'h2):(1'h0)]});
    end
  always
    @(posedge clk) begin
      reg17 <= wire11[(3'h7):(3'h7)];
      if (((($unsigned(wire12[(3'h5):(1'h0)]) ^~ reg14) ?
          (^reg13) : (-$unsigned((~(8'hab))))) && $signed((reg15 ^ $signed((!(8'hb5)))))))
        begin
          reg18 <= ($signed(((8'had) * (reg16 >= (reg15 - reg13)))) ^~ wire9[(1'h0):(1'h0)]);
          reg19 <= ((~|(&$signed(wire9))) && $unsigned((^~$signed(((8'ha6) ?
              reg14 : wire11)))));
          reg20 <= (((!(!(~&reg16))) + $unsigned($unsigned($unsigned(reg15)))) ?
              ($unsigned(reg13[(1'h0):(1'h0)]) ?
                  $unsigned(wire11) : $unsigned((~^wire8[(1'h1):(1'h0)]))) : reg16);
          reg21 <= $signed($signed($signed((-(^~wire8)))));
          reg22 <= reg21;
        end
      else
        begin
          reg18 <= ({(~&(~&$signed(reg18))),
              ($unsigned($unsigned(wire9)) ?
                  $signed({reg17, wire10}) : {(~|wire9),
                      (reg16 ? (8'ha6) : reg13)})} ^ (({wire8[(1'h0):(1'h0)]} ?
              ($signed(reg15) ?
                  (reg20 & wire11) : (wire11 ? reg17 : (8'ha6))) : (^((8'h9d) ?
                  reg22 : reg21))) - reg17[(2'h2):(1'h1)]));
          if (wire10[(3'h6):(1'h1)])
            begin
              reg19 <= $signed(reg21[(1'h1):(1'h0)]);
              reg20 <= (^~reg15);
              reg21 <= (wire9[(2'h2):(2'h2)] ?
                  (^~(~|(&wire12[(4'hd):(1'h0)]))) : $unsigned((reg14[(2'h3):(1'h1)] | $unsigned((reg13 ?
                      reg19 : reg19)))));
              reg22 <= (^{$signed($unsigned($unsigned(reg19))), wire12});
            end
          else
            begin
              reg19 <= reg17[(1'h1):(1'h1)];
              reg20 <= $signed($unsigned((~&$unsigned((reg19 | reg18)))));
              reg21 <= {((|($unsigned(reg17) >>> ((8'h9c) ~^ reg15))) >>> $signed($signed(wire8)))};
            end
          reg23 <= reg15[(3'h7):(3'h7)];
        end
      if (((($signed((reg14 ^ reg18)) - $signed($signed(reg15))) ?
          ($unsigned((reg15 >>> reg15)) ?
              reg21 : $unsigned(((8'hb4) ? wire9 : wire9))) : ($signed((wire8 ?
                  (8'ha7) : reg20)) ?
              (!$unsigned(reg17)) : {(wire8 == (8'ha2)),
                  (reg14 < (8'ha7))})) != {$unsigned(((reg17 ?
              reg13 : reg16) != (wire12 ? wire12 : reg15)))}))
        begin
          if ($signed((reg13[(2'h3):(1'h1)] * $unsigned((reg17 + (reg18 ?
              wire12 : (8'hbe)))))))
            begin
              reg24 <= $signed({$signed($unsigned($signed(wire9))),
                  reg23[(2'h2):(1'h0)]});
              reg25 <= {(($unsigned((reg24 & (8'had))) ?
                          reg21[(2'h2):(1'h1)] : {(wire12 ? wire12 : reg19),
                              reg18}) ?
                      (((7'h40) ? $signed(reg21) : reg22[(2'h3):(1'h1)]) ?
                          {$unsigned((8'hab))} : {(!(7'h40)),
                              {wire10,
                                  (8'haa)}}) : (reg24[(3'h6):(2'h2)] | (~$unsigned((8'ha1))))),
                  $unsigned((&(reg18 ?
                      (reg19 ? reg18 : reg24) : ((8'hb3) ? reg18 : reg13))))};
              reg26 <= (8'hbe);
              reg27 <= (wire12[(4'hf):(3'h6)] == (reg16[(4'ha):(2'h2)] ?
                  reg13[(1'h0):(1'h0)] : wire10));
            end
          else
            begin
              reg24 <= $unsigned(reg16[(3'h7):(2'h2)]);
              reg25 <= ($signed((reg24[(5'h14):(2'h2)] ?
                  $unsigned((|reg17)) : reg19[(4'hc):(2'h3)])) - reg22);
              reg26 <= $unsigned(reg21);
              reg27 <= ($unsigned(({reg24} ?
                      $signed($unsigned(reg27)) : (-$signed(wire12)))) ?
                  reg27[(3'h7):(2'h2)] : (^~reg27[(4'hb):(3'h6)]));
            end
          if ((~reg23))
            begin
              reg28 <= ($signed($unsigned(reg23[(1'h1):(1'h1)])) ?
                  reg24[(3'h5):(3'h4)] : $unsigned(((reg15 ?
                          (reg13 ? (8'haa) : reg14) : $unsigned(reg26)) ?
                      $unsigned((reg21 ? reg24 : reg14)) : $unsigned((reg23 ?
                          reg24 : wire10)))));
              reg29 <= (8'ha1);
            end
          else
            begin
              reg28 <= (reg29[(5'h10):(1'h1)] ?
                  $unsigned($unsigned(wire12)) : (+$unsigned((-(~reg19)))));
              reg29 <= (({(~&$signed(reg28))} ?
                  {wire11[(4'h9):(3'h5)],
                      (8'ha7)} : $signed((reg23 == reg26[(3'h5):(3'h5)]))) << {(reg18 <= $unsigned(reg29))});
            end
        end
      else
        begin
          reg24 <= {$unsigned((8'hbe)), (wire9 >>> wire8[(1'h1):(1'h1)])};
          if ((((((8'hb5) >= (^wire12)) ?
                  ({reg15,
                      (8'hb1)} - reg16[(3'h6):(1'h0)]) : $unsigned((^~(8'h9e)))) >> (reg21[(2'h3):(1'h0)] - $unsigned((wire9 ?
                  wire10 : reg26)))) ?
              reg13[(1'h1):(1'h0)] : {((reg13 | $signed(reg15)) ?
                      $unsigned(reg15) : (reg13 ?
                          {reg19} : $unsigned(wire9)))}))
            begin
              reg25 <= (reg27[(3'h7):(3'h6)] ?
                  (wire10[(3'h4):(2'h2)] ?
                      {(~|((7'h40) - reg21)),
                          wire8[(3'h5):(1'h0)]} : (^($unsigned(reg18) <<< ((8'ha5) * reg27)))) : wire10);
              reg26 <= reg16;
              reg27 <= ($signed(wire11) ?
                  reg22[(2'h3):(1'h0)] : (!$signed($unsigned(((8'ha0) | reg25)))));
              reg28 <= $signed(wire10);
            end
          else
            begin
              reg25 <= wire12[(4'hb):(4'ha)];
              reg26 <= {wire10};
              reg27 <= (8'hb4);
              reg28 <= {$signed((reg15[(2'h3):(1'h0)] ?
                      ($signed(reg25) ?
                          (reg24 >> reg24) : {reg19,
                              reg15}) : ($unsigned(reg13) ^ reg21))),
                  (reg27[(5'h13):(3'h5)] ?
                      ($unsigned(reg23[(2'h3):(1'h0)]) ^~ {reg24}) : (8'hb8))};
              reg29 <= reg22;
            end
          if ((reg14[(2'h2):(1'h1)] | $unsigned((^$signed((reg15 > reg17))))))
            begin
              reg30 <= (reg18[(2'h2):(1'h0)] && {$unsigned(($unsigned((8'hac)) >= $unsigned(reg21)))});
            end
          else
            begin
              reg30 <= (~^{($signed((reg28 != reg21)) ?
                      {reg13[(1'h0):(1'h0)], (&reg23)} : (&$unsigned(reg15)))});
              reg31 <= ({reg23} ?
                  reg20[(3'h6):(1'h1)] : $signed(reg20[(1'h1):(1'h1)]));
              reg32 <= (reg27 ?
                  (8'hbf) : (wire9[(1'h0):(1'h0)] ?
                      $signed($unsigned($signed(reg26))) : ((reg19 ?
                              reg20 : (reg22 ? (8'hae) : reg15)) ?
                          $signed($unsigned(wire9)) : ($unsigned(reg27) != (~^reg13)))));
              reg33 <= $unsigned($signed($unsigned((reg17[(1'h0):(1'h0)] ~^ (reg31 ^~ reg24)))));
              reg34 <= (((reg20[(2'h3):(2'h2)] ?
                      reg17 : (~^((8'ha7) + reg18))) ?
                  reg27 : reg32[(2'h3):(1'h0)]) && $signed(((|$unsigned(wire12)) ?
                  {(8'hb5)} : $unsigned((reg25 ? (8'h9e) : reg13)))));
            end
          if ($signed(reg21[(2'h3):(1'h1)]))
            begin
              reg35 <= (($signed($signed($signed(wire12))) != $unsigned(reg31[(3'h5):(1'h1)])) ?
                  reg33[(2'h3):(1'h0)] : $signed($unsigned($unsigned((~|reg34)))));
              reg36 <= (~|$unsigned((!$signed(reg33))));
              reg37 <= {$unsigned($unsigned((reg18 ? reg22 : {reg31, reg29})))};
              reg38 <= ({((~|(8'ha0)) ?
                          $unsigned($unsigned((8'hb3))) : ((8'hb5) ?
                              reg16 : $signed(reg28))),
                      $unsigned(reg37)} ?
                  reg23[(4'ha):(2'h3)] : (reg19 >>> (+({reg13,
                      reg23} <<< {wire8, wire11}))));
              reg39 <= (^~{reg34});
            end
          else
            begin
              reg35 <= $signed(reg20[(2'h3):(2'h3)]);
              reg36 <= {reg25[(3'h6):(3'h6)],
                  $signed((~&$signed(((8'hbe) ? reg32 : reg38))))};
            end
          reg40 <= (!$unsigned((((reg21 ? wire12 : wire10) ?
                  reg38[(3'h7):(3'h4)] : ((8'ha6) + reg28)) ?
              reg27 : $unsigned((!reg24)))));
        end
      reg41 <= $unsigned(reg33);
    end
  assign wire42 = (({reg14} - reg33[(1'h1):(1'h1)]) ?
                      {(reg22[(1'h1):(1'h0)] * {reg27})} : (reg33 ?
                          $signed(reg19) : reg37));
  assign wire43 = wire9[(2'h2):(1'h1)];
endmodule

module module69
#(parameter param125 = (~&(&((|(-(8'ha7))) ? ((8'had) < (!(8'hb7))) : ((!(8'h9e)) ^~ ((8'hb8) < (8'hac)))))))
(y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'h243):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire74;
  input wire [(5'h11):(1'h0)] wire73;
  input wire signed [(5'h11):(1'h0)] wire72;
  input wire signed [(5'h15):(1'h0)] wire71;
  input wire [(4'hf):(1'h0)] wire70;
  wire [(4'hc):(1'h0)] wire124;
  wire [(3'h7):(1'h0)] wire123;
  wire [(2'h3):(1'h0)] wire122;
  wire signed [(3'h7):(1'h0)] wire121;
  wire [(3'h7):(1'h0)] wire119;
  wire signed [(2'h2):(1'h0)] wire118;
  wire [(5'h10):(1'h0)] wire117;
  wire [(5'h13):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire115;
  wire signed [(4'he):(1'h0)] wire114;
  wire signed [(4'h9):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire77;
  wire signed [(5'h11):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire75;
  reg signed [(5'h12):(1'h0)] reg120 = (1'h0);
  reg [(5'h10):(1'h0)] reg113 = (1'h0);
  reg [(5'h10):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(2'h3):(1'h0)] reg109 = (1'h0);
  reg [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg107 = (1'h0);
  reg [(4'hd):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg105 = (1'h0);
  reg [(2'h2):(1'h0)] reg104 = (1'h0);
  reg [(3'h7):(1'h0)] reg103 = (1'h0);
  reg [(3'h7):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg101 = (1'h0);
  reg [(5'h14):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(5'h15):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg [(5'h13):(1'h0)] reg95 = (1'h0);
  reg [(5'h15):(1'h0)] reg94 = (1'h0);
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(4'hb):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(3'h6):(1'h0)] reg85 = (1'h0);
  reg [(5'h14):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg78 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire84,
                 wire82,
                 wire77,
                 wire76,
                 wire75,
                 reg120,
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
                 reg83,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire75 = $unsigned(wire74[(4'h9):(1'h0)]);
  assign wire76 = wire70[(4'hc):(2'h3)];
  assign wire77 = wire72[(5'h11):(5'h10)];
  always
    @(posedge clk) begin
      reg78 <= wire76[(4'hf):(1'h1)];
      reg79 <= wire77;
      reg80 <= (wire74 ? wire77[(4'hd):(4'hd)] : wire75);
      reg81 <= (|$signed($signed(reg78[(3'h6):(3'h5)])));
    end
  assign wire82 = reg81[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg83 <= wire76[(1'h0):(1'h0)];
    end
  assign wire84 = wire74;
  always
    @(posedge clk) begin
      reg85 <= $unsigned($unsigned(wire76));
      if ($unsigned(wire70))
        begin
          if ($signed((($signed((~&wire82)) & $signed(reg78[(3'h5):(2'h3)])) ?
              (reg80[(4'h8):(2'h3)] ^ $unsigned((wire75 ^~ reg79))) : (wire70[(4'h9):(3'h7)] ?
                  {$unsigned(wire70)} : ((~wire70) ?
                      (^~wire70) : $unsigned(wire73))))))
            begin
              reg86 <= ({(($signed((8'hbe)) ?
                      (reg78 ?
                          reg78 : wire73) : (reg83 < reg81)) != (+(~^wire73)))} << (&($unsigned((wire72 ?
                  wire75 : reg80)) ^ reg79)));
              reg87 <= reg80;
              reg88 <= reg83[(4'h8):(3'h4)];
              reg89 <= reg85;
              reg90 <= $signed($signed(reg79[(3'h4):(1'h1)]));
            end
          else
            begin
              reg86 <= $unsigned($unsigned(wire71));
              reg87 <= $unsigned({(~^reg85[(1'h1):(1'h0)])});
              reg88 <= (|wire73[(4'hc):(2'h2)]);
            end
          reg91 <= $signed((-{(~^$unsigned(wire75))}));
          if ($unsigned(((($signed(reg83) >>> $unsigned(reg80)) ?
              ({wire76} > $unsigned((8'hac))) : wire76[(4'ha):(3'h5)]) | (~|($unsigned(wire73) < (~^reg89))))))
            begin
              reg92 <= $signed(wire70);
              reg93 <= ($unsigned($signed(reg90)) ? wire75 : reg81);
              reg94 <= reg88[(2'h3):(2'h3)];
              reg95 <= (^(8'hac));
            end
          else
            begin
              reg92 <= ({$unsigned(wire75), (-(7'h42))} ?
                  $unsigned(($unsigned((-reg81)) ?
                      (^reg85[(3'h4):(1'h0)]) : ((reg87 ?
                          (8'hb1) : reg93) >= $unsigned(reg91)))) : reg80[(1'h0):(1'h0)]);
            end
          if ((8'ha1))
            begin
              reg96 <= $unsigned($unsigned($unsigned(((wire76 <<< reg95) ?
                  (wire71 ? reg80 : reg91) : reg92))));
              reg97 <= (+(~^{{(-reg86), (wire82 * reg95)}}));
              reg98 <= ($signed((!reg93)) ^ $signed(((^wire77) ?
                  reg92[(1'h1):(1'h0)] : reg81[(2'h3):(1'h1)])));
              reg99 <= (wire72 ?
                  {$unsigned({{wire74, reg94}, reg85[(1'h1):(1'h0)]}),
                      $unsigned(reg78)} : $signed((8'h9e)));
            end
          else
            begin
              reg96 <= (8'h9e);
              reg97 <= wire71[(4'ha):(1'h1)];
              reg98 <= wire70[(4'h8):(1'h0)];
              reg99 <= $unsigned(((($signed(wire82) ^~ (|wire72)) ?
                      $unsigned($signed(reg97)) : $unsigned((8'hb9))) ?
                  reg99[(5'h12):(1'h1)] : $signed((+$unsigned(reg80)))));
            end
        end
      else
        begin
          reg86 <= $unsigned(wire73[(3'h7):(3'h7)]);
          reg87 <= (reg88 >= wire77[(3'h4):(3'h4)]);
          reg88 <= (~|{{($signed((8'h9c)) ?
                      $signed(reg97) : (wire70 == wire84))},
              reg94});
        end
      if ({{reg92,
              {{(reg85 << reg92), (&reg93)},
                  $unsigned((reg79 ? reg78 : reg78))}}})
        begin
          reg100 <= $unsigned($signed($signed({(reg79 >= reg91)})));
        end
      else
        begin
          if (({$unsigned(reg79),
                  $unsigned($unsigned(((8'hb0) ? reg79 : wire84)))} ?
              (^~((+$unsigned(reg91)) ?
                  reg98 : {(wire74 ? reg98 : reg87),
                      wire77[(5'h11):(1'h1)]})) : (reg88[(4'h9):(4'h8)] ^ (8'h9e))))
            begin
              reg100 <= $unsigned($signed($signed((^~(reg95 ?
                  wire84 : reg87)))));
              reg101 <= (wire76 ?
                  $unsigned(reg92) : {(reg80 ^~ reg98[(5'h13):(4'ha)]),
                      reg86[(2'h3):(2'h2)]});
            end
          else
            begin
              reg100 <= (~&((~&((reg90 ? wire74 : wire77) ?
                  (reg83 + (8'hae)) : $signed(reg90))) + reg97));
              reg101 <= $signed((&reg99));
              reg102 <= (8'ha8);
              reg103 <= ((reg100 >> wire71) ?
                  (((wire84 <<< ((8'ha6) ?
                      reg90 : reg83)) ^ reg100) >= (((reg96 ?
                              wire76 : (8'hb2)) ?
                          reg98 : $signed(reg92)) ?
                      (reg91 ?
                          wire75[(3'h5):(2'h2)] : (reg92 ?
                              wire72 : reg89)) : $unsigned($unsigned(reg78)))) : (|$unsigned({$unsigned(wire70),
                      (^~wire75)})));
              reg104 <= reg98;
            end
          reg105 <= reg83;
          reg106 <= reg97;
          reg107 <= $signed($signed((wire73 >>> wire77[(3'h7):(3'h4)])));
          if ((((&$unsigned($signed(wire75))) ?
                  (((reg83 <= reg79) ~^ reg100) < ($signed(reg106) ?
                      (wire73 - reg90) : (~&reg102))) : $signed({reg88})) ?
              $signed(($unsigned((reg85 ? (8'hab) : wire82)) ?
                  reg83[(4'hf):(4'h8)] : ($unsigned(reg89) ^~ (wire82 ?
                      reg90 : reg106)))) : reg93[(4'hb):(4'ha)]))
            begin
              reg108 <= reg101;
              reg109 <= (~((-((reg103 | (8'hb8)) ?
                      (wire72 >= reg99) : (+wire74))) ?
                  reg83[(1'h1):(1'h1)] : (^~{(~|(8'hb3)), reg100})));
              reg110 <= (reg104 && ($signed(wire77) >> wire74[(4'hc):(3'h7)]));
            end
          else
            begin
              reg108 <= $unsigned(((~&(-(reg79 ?
                  reg92 : wire70))) >= (reg96 != $signed((reg98 >= reg102)))));
              reg109 <= (wire72[(1'h1):(1'h1)] >= $signed($unsigned(($unsigned(reg103) ?
                  reg104[(1'h0):(1'h0)] : (reg78 ^ reg78)))));
              reg110 <= ({$signed($unsigned((reg100 | reg93))),
                  $unsigned({(reg109 ?
                          reg110 : (8'had))})} ^~ $signed(reg99[(5'h12):(3'h6)]));
            end
        end
      reg111 <= reg109;
    end
  always
    @(posedge clk) begin
      reg112 <= reg104[(1'h1):(1'h1)];
      reg113 <= $unsigned(wire77);
    end
  assign wire114 = reg90[(4'hb):(4'h9)];
  assign wire115 = (!reg97[(2'h2):(1'h1)]);
  assign wire116 = wire84;
  assign wire117 = $unsigned(wire82);
  assign wire118 = (^reg101);
  assign wire119 = ($signed(($unsigned($unsigned(reg110)) << (!$signed(reg100)))) != (wire76[(4'h9):(2'h3)] ?
                       $signed(($unsigned(wire71) ?
                           reg104[(1'h0):(1'h0)] : (^(8'hbd)))) : reg107));
  always
    @(posedge clk) begin
      reg120 <= wire72;
    end
  assign wire121 = (reg102 >= ($signed(((^reg108) * (^~reg90))) >= $signed($unsigned($unsigned(wire76)))));
  assign wire122 = $signed(reg96[(3'h5):(2'h2)]);
  assign wire123 = (reg110[(3'h6):(3'h5)] ~^ (reg120[(4'hc):(4'ha)] * reg86[(1'h0):(1'h0)]));
  assign wire124 = reg108;
endmodule
