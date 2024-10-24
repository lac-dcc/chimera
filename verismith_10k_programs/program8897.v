module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  wire signed [(3'h7):(1'h0)] wire237;
  wire [(5'h15):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire48;
  assign y = {wire237,
                 wire52,
                 wire51,
                 wire50,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire48,
                 (1'h0)};
  assign wire4 = (&wire3);
  assign wire5 = $signed((wire0 || {($unsigned(wire1) ?
                         (~^wire1) : $unsigned(wire0)),
                     wire4[(3'h4):(3'h4)]}));
  assign wire6 = (8'hb2);
  assign wire7 = $unsigned(wire6[(2'h2):(1'h1)]);
  module8 #() modinst49 (wire48, clk, wire0, wire6, wire7, wire5, wire4);
  assign wire50 = ({wire3[(1'h0):(1'h0)]} ?
                      wire1 : ($signed((&wire6)) ?
                          ($unsigned(wire4[(3'h7):(3'h4)]) ?
                              ((wire2 ?
                                  (8'hb3) : wire7) && (wire3 & wire1)) : (wire3 + (^wire1))) : (~^$signed($unsigned(wire3)))));
  assign wire51 = wire4[(4'he):(3'h5)];
  assign wire52 = $signed({wire1, (8'ha0)});
  module53 #() modinst238 (wire237, clk, wire7, wire5, wire50, wire3);
endmodule

module module53  (y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'h223):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire57;
  input wire [(3'h4):(1'h0)] wire56;
  input wire signed [(5'h13):(1'h0)] wire55;
  input wire signed [(2'h3):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire236;
  wire [(4'hb):(1'h0)] wire230;
  wire signed [(3'h4):(1'h0)] wire229;
  wire signed [(5'h13):(1'h0)] wire228;
  wire [(4'hc):(1'h0)] wire226;
  wire [(5'h13):(1'h0)] wire161;
  wire [(3'h5):(1'h0)] wire160;
  wire signed [(5'h10):(1'h0)] wire159;
  wire [(4'hb):(1'h0)] wire158;
  wire signed [(5'h10):(1'h0)] wire129;
  wire signed [(5'h11):(1'h0)] wire89;
  wire signed [(5'h11):(1'h0)] wire87;
  wire [(5'h15):(1'h0)] wire60;
  wire signed [(5'h12):(1'h0)] wire59;
  reg signed [(4'hd):(1'h0)] reg235 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg234 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg233 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg232 = (1'h0);
  reg [(2'h2):(1'h0)] reg231 = (1'h0);
  reg [(3'h6):(1'h0)] reg157 = (1'h0);
  reg [(4'h8):(1'h0)] reg156 = (1'h0);
  reg [(5'h14):(1'h0)] reg155 = (1'h0);
  reg [(4'h8):(1'h0)] reg154 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg153 = (1'h0);
  reg [(4'h8):(1'h0)] reg152 = (1'h0);
  reg [(4'he):(1'h0)] reg151 = (1'h0);
  reg signed [(4'he):(1'h0)] reg150 = (1'h0);
  reg [(4'h8):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg148 = (1'h0);
  reg [(5'h10):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg146 = (1'h0);
  reg [(5'h11):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg144 = (1'h0);
  reg [(4'h9):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg141 = (1'h0);
  reg [(4'h9):(1'h0)] reg140 = (1'h0);
  reg [(3'h4):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg137 = (1'h0);
  reg [(3'h4):(1'h0)] reg136 = (1'h0);
  reg [(4'he):(1'h0)] reg135 = (1'h0);
  reg [(4'hc):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg132 = (1'h0);
  reg [(4'ha):(1'h0)] reg131 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  assign y = {wire236,
                 wire230,
                 wire229,
                 wire228,
                 wire226,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire129,
                 wire89,
                 wire87,
                 wire60,
                 wire59,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
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
                 reg58,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg58 <= $unsigned((wire56[(1'h0):(1'h0)] ^ wire54[(1'h0):(1'h0)]));
    end
  assign wire59 = $unsigned({{reg58[(2'h2):(1'h1)]},
                      $signed(($signed(reg58) ?
                          (wire57 ? wire55 : wire57) : (wire55 >= wire55)))});
  assign wire60 = wire59[(1'h0):(1'h0)];
  module61 #() modinst88 (wire87, clk, wire60, wire59, wire55, reg58, wire57);
  assign wire89 = $unsigned(wire56);
  module90 #() modinst130 (wire129, clk, wire59, wire57, wire60, reg58, wire89);
  always
    @(posedge clk) begin
      if ($unsigned(wire59))
        begin
          reg131 <= {($unsigned(wire56) ?
                  ((wire54[(2'h2):(1'h1)] - (-wire60)) & reg58[(3'h5):(1'h0)]) : $signed(wire57[(4'hb):(1'h1)]))};
          if ({wire56, reg58})
            begin
              reg132 <= ((~(wire57 ?
                      $signed(wire129) : wire57[(2'h2):(2'h2)])) ?
                  {(~&(8'hb5))} : $unsigned($signed($signed({wire129,
                      wire129}))));
            end
          else
            begin
              reg132 <= (~{$unsigned($signed(wire54))});
              reg133 <= $signed(reg58);
              reg134 <= (~^(^~((^~$signed(wire59)) * wire54)));
            end
          reg135 <= $signed($unsigned(reg134[(2'h2):(2'h2)]));
          reg136 <= ($signed($unsigned(((reg131 - wire57) ?
                  (wire55 || reg134) : $unsigned(reg134)))) ?
              (^({(reg134 ? reg132 : wire57), $unsigned(wire87)} ?
                  $unsigned((|wire54)) : $unsigned(wire54))) : (wire54[(1'h0):(1'h0)] ?
                  $signed(($signed(wire89) ?
                      (~reg134) : (reg131 == wire56))) : reg131));
          if (($signed((((+reg58) >= (+wire89)) ? wire57 : wire60)) ?
              (8'hac) : reg58))
            begin
              reg137 <= $unsigned($signed(reg136));
              reg138 <= {(+$signed({((8'h9f) ? wire59 : wire57), {reg136}})),
                  (^{wire87})};
              reg139 <= ((wire59[(1'h1):(1'h0)] ?
                  wire56[(2'h3):(2'h3)] : (($unsigned(wire57) ?
                          {wire54, wire59} : $unsigned(reg58)) ?
                      reg138 : reg135[(4'h9):(2'h2)])) ^ reg138[(1'h0):(1'h0)]);
              reg140 <= $signed($unsigned(wire59));
              reg141 <= (~|(($signed((wire59 <= wire54)) ^~ ((8'hb1) + reg140[(2'h2):(2'h2)])) ?
                  $unsigned(reg140) : $unsigned(reg58)));
            end
          else
            begin
              reg137 <= $signed($signed($signed(($signed(reg140) ?
                  $unsigned(reg135) : $unsigned(wire57)))));
            end
        end
      else
        begin
          if (({($signed((wire55 ?
                  wire87 : (8'ha8))) * (~reg137[(1'h1):(1'h0)])),
              $unsigned(($signed(reg132) ?
                  $unsigned(wire129) : {reg135,
                      (8'ha1)}))} > {$unsigned((|(wire55 & wire54))),
              $signed((+(reg131 <= reg136)))}))
            begin
              reg131 <= reg137;
            end
          else
            begin
              reg131 <= $signed($signed($unsigned(((reg138 ?
                  reg137 : reg136) != wire55))));
              reg132 <= reg136;
              reg133 <= reg135[(4'h8):(1'h1)];
              reg134 <= $signed((^(((reg135 ?
                  reg132 : reg58) ^ $signed(wire55)) && $signed(((8'hba) ^ reg134)))));
            end
          reg135 <= $signed(wire60);
          if (wire54)
            begin
              reg136 <= {(wire59[(2'h2):(1'h1)] >= {$unsigned($signed((8'hbf)))}),
                  (reg131 ?
                      reg137[(3'h4):(1'h1)] : (((reg139 != reg134) <<< reg133) ?
                          (wire54 ?
                              ((8'hb2) ?
                                  reg140 : wire56) : $unsigned(reg58)) : ((~^reg132) ?
                              reg135[(1'h0):(1'h0)] : (reg136 ?
                                  wire87 : reg137))))};
              reg137 <= ($signed($unsigned({(reg140 ?
                      reg133 : reg141)})) == (wire56 ?
                  (~^reg133) : $signed(((reg135 && (8'hb4)) < (reg138 ?
                      wire59 : (8'h9d))))));
              reg138 <= wire89;
              reg139 <= ({(wire87 ?
                      $unsigned(wire54) : ((|wire55) - (reg138 & reg133)))} == reg134);
            end
          else
            begin
              reg136 <= reg136[(1'h0):(1'h0)];
              reg137 <= reg132[(3'h5):(3'h5)];
              reg138 <= wire129[(2'h2):(2'h2)];
              reg139 <= $unsigned(((^(&(wire89 ?
                  wire59 : (7'h43)))) ^~ (&((8'hbb) ?
                  ((7'h41) != wire59) : (reg134 <= reg138)))));
              reg140 <= $signed((($signed((~^reg141)) > (!wire54)) <<< $signed(((reg135 && reg58) ?
                  ((8'ha7) ? (8'hac) : (8'haa)) : (wire87 ?
                      reg134 : reg135)))));
            end
        end
      reg142 <= $signed((!reg141[(2'h2):(1'h0)]));
      reg143 <= wire57[(4'ha):(4'ha)];
      if ($unsigned($signed(reg141[(2'h2):(1'h1)])))
        begin
          if ((8'hb3))
            begin
              reg144 <= reg142[(4'he):(2'h3)];
              reg145 <= ($signed((reg144 & reg144[(2'h3):(2'h2)])) ?
                  ((~^reg139[(3'h4):(3'h4)]) ?
                      $signed(wire55[(4'he):(2'h2)]) : $unsigned($signed({reg143,
                          reg140}))) : {reg144,
                      {$unsigned((wire60 | wire59))}});
              reg146 <= ((wire129 ? reg140 : $signed($signed(reg142))) ?
                  ((reg137[(3'h5):(3'h4)] ?
                          (reg134[(3'h4):(2'h3)] && (^wire55)) : {(reg132 | reg145),
                              (+reg143)}) ?
                      (~$signed(reg142[(4'h8):(4'h8)])) : ((wire59 ?
                          {wire89, reg137} : wire60) ^ $unsigned((reg142 ?
                          reg58 : reg133)))) : wire87);
            end
          else
            begin
              reg144 <= $signed({($signed((reg58 ? reg132 : (8'ha2))) ?
                      (8'ha1) : (wire54[(1'h0):(1'h0)] ~^ $unsigned(wire60)))});
              reg145 <= $signed(wire89[(3'h4):(3'h4)]);
              reg146 <= ($signed(wire87) == {$unsigned((~^$unsigned(reg146))),
                  {{(&reg135)}}});
              reg147 <= reg133[(4'ha):(2'h2)];
              reg148 <= (|reg143);
            end
          reg149 <= wire54;
          reg150 <= (~^(wire55 ?
              ((-{reg139}) ?
                  ({wire60,
                      reg58} & reg131[(4'ha):(2'h2)]) : (~^reg136[(1'h0):(1'h0)])) : ((~^(reg136 | (7'h41))) << {wire59[(4'h9):(3'h7)]})));
          if ((reg138 + $unsigned(wire56)))
            begin
              reg151 <= $unsigned($signed((&$unsigned((^reg136)))));
            end
          else
            begin
              reg151 <= $unsigned(reg146);
              reg152 <= wire54;
              reg153 <= (&($signed(($signed(reg149) < reg147)) ?
                  reg134 : reg148));
              reg154 <= $signed(wire89);
              reg155 <= reg143;
            end
          reg156 <= {wire55[(2'h3):(1'h0)]};
        end
      else
        begin
          if (wire55[(4'hd):(4'h9)])
            begin
              reg144 <= reg135;
              reg145 <= wire129;
            end
          else
            begin
              reg144 <= $signed((8'hb4));
            end
          reg146 <= (reg133[(4'he):(1'h1)] ?
              $signed($unsigned(((&wire55) ?
                  (reg154 == reg152) : (+reg150)))) : (reg140 ?
                  reg133[(4'hd):(3'h4)] : $unsigned((^$signed(wire60)))));
          reg147 <= ($signed(reg151[(4'h8):(3'h6)]) < $signed(wire54));
        end
      reg157 <= $unsigned(reg132[(3'h4):(2'h3)]);
    end
  assign wire158 = reg156;
  assign wire159 = reg140;
  assign wire160 = $unsigned($signed(reg140));
  assign wire161 = (-{reg157[(2'h3):(2'h3)]});
  module162 #() modinst227 (.wire163(wire57), .y(wire226), .wire166(reg139), .clk(clk), .wire164(reg155), .wire165(wire129));
  assign wire228 = ({$unsigned($signed((~^reg134)))} ?
                       ((reg154[(1'h1):(1'h1)] == $signed($unsigned(reg137))) ^~ wire89[(3'h4):(3'h4)]) : {reg156[(3'h4):(1'h1)],
                           reg147});
  assign wire229 = $signed(wire55[(4'h8):(4'h8)]);
  assign wire230 = $signed(((wire158 ?
                           wire54 : ((wire158 ?
                               reg157 : (8'hb3)) >>> (reg136 <= reg138))) ?
                       reg142[(3'h4):(1'h0)] : $unsigned(wire60[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg231 <= $unsigned({$signed(((wire129 ^ reg152) << (+reg145)))});
      reg232 <= ((reg132[(3'h4):(3'h4)] ?
              $signed((~|(&wire54))) : $signed(reg154)) ?
          (!{((reg131 + wire158) ^~ $unsigned(reg140)),
              reg139}) : $signed($unsigned({$unsigned(reg157)})));
      if ({reg58, $unsigned(((~^wire228) || reg232[(2'h3):(2'h3)]))})
        begin
          reg233 <= $unsigned($unsigned(($signed(reg143[(4'h9):(3'h4)]) && $unsigned(wire228))));
          reg234 <= ({reg149[(2'h2):(1'h1)]} == (^{$unsigned(reg147[(3'h7):(1'h1)])}));
          reg235 <= {((~$unsigned($unsigned(reg157))) ?
                  $signed($unsigned((reg146 == wire55))) : ($signed((&wire129)) >= $signed((8'hb9))))};
        end
      else
        begin
          reg233 <= reg141[(1'h0):(1'h0)];
          reg234 <= (wire87 ~^ (reg133[(4'he):(3'h4)] ?
              ($signed($unsigned(reg231)) ?
                  {reg146[(4'hc):(2'h3)], wire56[(2'h2):(2'h2)]} : (((8'hbc) ?
                      wire60 : reg132) > $signed(reg137))) : ((reg145 ?
                      ((8'ha5) & (8'ha4)) : wire129) ?
                  $signed((wire89 <<< wire56)) : $unsigned($unsigned(reg232)))));
          reg235 <= $unsigned($signed(({(reg141 || reg231), reg235} ?
              reg132[(2'h2):(1'h0)] : ((~reg145) >> (~^reg235)))));
        end
    end
  assign wire236 = reg149[(3'h7):(3'h7)];
endmodule

module module8
#(parameter param46 = ({{(|(7'h42)), (^~{(7'h44)})}, (((~|(8'hae)) ? ((8'hb3) > (8'had)) : ((8'h9e) ? (8'ha7) : (7'h43))) > (((8'haf) + (7'h43)) >> ((8'hac) ^~ (8'hb7))))} ? ((((^(8'hac)) ? ((8'h9d) ? (8'hb4) : (8'ha9)) : ((8'hae) > (8'hba))) ^~ (8'hb7)) ? (({(7'h40), (8'hb4)} * (!(8'hb7))) >>> {((8'hac) ? (8'hb7) : (8'ha6))}) : ({(|(8'hb0)), ((8'hb5) | (8'hbc))} >= (((7'h43) ? (8'hb6) : (7'h43)) ? ((8'hae) + (8'hbd)) : ((8'hbb) ? (8'hb5) : (8'hbb))))) : (({{(8'hae), (8'hb1)}, {(8'ha3)}} ? (((7'h40) >= (8'hab)) * (+(8'hac))) : (&((8'hb9) ^~ (8'hab)))) ? (^~({(8'haa)} == ((8'ha0) ? (8'hbb) : (8'hb5)))) : (((+(8'ha9)) ? {(8'h9d)} : {(8'h9f), (8'ha5)}) * ((^~(8'hb2)) ? {(8'ha2)} : ((8'hb2) ? (8'ha4) : (8'haf)))))), 
parameter param47 = (param46 ? (-(((param46 << param46) != {param46}) >>> (((8'haa) << param46) * ((7'h41) ? param46 : param46)))) : ({param46} ? {((param46 ? param46 : param46) ? (param46 ? param46 : param46) : (8'ha9))} : (~|param46))))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire13;
  input wire signed [(5'h14):(1'h0)] wire12;
  input wire signed [(4'ha):(1'h0)] wire11;
  input wire signed [(3'h6):(1'h0)] wire10;
  input wire signed [(4'ha):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire17;
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  assign y = {wire45,
                 wire43,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire17,
                 reg20,
                 reg19,
                 reg18,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= (!(wire10 || wire12[(5'h10):(3'h6)]));
      reg15 <= wire10[(1'h0):(1'h0)];
      reg16 <= (^($unsigned(wire12) ?
          $unsigned(($signed(wire12) ?
              (reg15 ? wire13 : reg15) : reg15)) : (($signed(wire13) ?
                  $signed(reg15) : reg15[(2'h2):(1'h1)]) ?
              ({wire13} >>> wire12) : ((~^wire10) && reg14))));
    end
  assign wire17 = wire10;
  always
    @(posedge clk) begin
      reg18 <= $unsigned(wire17[(4'h8):(4'h8)]);
      reg19 <= ($unsigned(reg15[(2'h3):(1'h0)]) ?
          (reg16 ?
              reg16 : (~^($unsigned(wire9) >= $signed(reg18)))) : ((-($unsigned(wire17) ?
              $unsigned((7'h41)) : (&reg15))) ~^ $unsigned(((wire11 * wire9) != $signed(reg15)))));
      reg20 <= ($unsigned((wire11[(3'h4):(1'h0)] > reg19)) - ({(~|$unsigned(reg16))} ?
          wire13 : {reg16}));
    end
  assign wire21 = (8'hb9);
  assign wire22 = reg15[(3'h4):(1'h1)];
  assign wire23 = $signed((8'ha8));
  assign wire24 = (((reg19[(2'h3):(1'h1)] < reg18) ?
                      reg19 : (|((reg16 ?
                          wire23 : wire13) << $unsigned((8'ha5))))) & reg14);
  assign wire25 = {$signed(wire21)};
  assign wire26 = reg15;
  module27 #() modinst44 (wire43, clk, wire11, wire22, wire26, wire13);
  assign wire45 = (~{(~|reg15),
                      (($signed(reg16) & $signed(wire10)) ?
                          (8'hbc) : (|(reg16 ? wire17 : wire11)))});
endmodule

module module27
#(parameter param41 = {{(~(^~((8'hae) ? (8'hab) : (8'hb8))))}}, 
parameter param42 = param41)
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire31;
  input wire [(4'he):(1'h0)] wire30;
  input wire signed [(4'hc):(1'h0)] wire29;
  input wire [(4'h8):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire40;
  wire [(4'h8):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire35;
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg32 <= wire30[(3'h4):(3'h4)];
      reg33 <= (wire28 & ($unsigned(wire29) + reg32));
      reg34 <= {wire31,
          $signed(($unsigned(reg32[(3'h5):(2'h2)]) >>> $signed(wire28[(2'h3):(2'h3)])))};
    end
  assign wire35 = ($unsigned({reg34[(1'h0):(1'h0)],
                          ((|reg33) ?
                              (wire30 <= wire31) : $unsigned(wire30))}) ?
                      $signed((^({wire29, wire29} ?
                          {reg34, reg34} : ((8'ha6) ?
                              wire31 : wire30)))) : (|((~(~reg32)) | ({wire29,
                          reg32} || ((8'hbb) * wire28)))));
  assign wire36 = ((({$signed(wire29), (wire29 ? wire35 : (8'hb2))} ?
                          reg32[(2'h3):(2'h3)] : wire29[(3'h5):(2'h2)]) != reg33) ?
                      $unsigned((&(+wire30[(3'h6):(2'h3)]))) : (^~$unsigned((&(reg33 ?
                          wire35 : reg34)))));
  assign wire37 = (8'ha4);
  assign wire38 = ((wire35[(3'h5):(3'h5)] ?
                          wire30[(4'he):(4'ha)] : (&(reg34 - $unsigned(wire30)))) ?
                      ($unsigned(reg33[(2'h2):(2'h2)]) || ($unsigned($unsigned(wire30)) ^ (wire37 ?
                          $unsigned(reg33) : (wire36 | wire31)))) : reg33);
  assign wire39 = ((reg32[(4'ha):(3'h6)] >= wire37) * (((wire28[(1'h1):(1'h0)] ?
                      (reg33 ? wire35 : wire35) : (^wire38)) <<< {wire31,
                      (reg32 * reg32)}) < ((^$signed(wire28)) ?
                      (~$signed(reg32)) : reg32[(3'h4):(1'h0)])));
  assign wire40 = (-reg34[(2'h2):(1'h0)]);
endmodule

module module162  (y, clk, wire166, wire165, wire164, wire163);
  output wire [(32'h2c3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire166;
  input wire [(5'h10):(1'h0)] wire165;
  input wire signed [(2'h2):(1'h0)] wire164;
  input wire [(4'h9):(1'h0)] wire163;
  wire [(4'hf):(1'h0)] wire225;
  wire [(4'hc):(1'h0)] wire219;
  wire [(5'h13):(1'h0)] wire218;
  wire signed [(4'hf):(1'h0)] wire217;
  wire signed [(5'h15):(1'h0)] wire216;
  wire [(2'h2):(1'h0)] wire215;
  wire [(4'hb):(1'h0)] wire214;
  wire signed [(3'h7):(1'h0)] wire210;
  wire [(4'hb):(1'h0)] wire209;
  wire [(5'h14):(1'h0)] wire208;
  wire signed [(5'h15):(1'h0)] wire207;
  wire signed [(2'h2):(1'h0)] wire195;
  wire [(3'h4):(1'h0)] wire194;
  wire signed [(5'h11):(1'h0)] wire193;
  wire [(4'ha):(1'h0)] wire167;
  reg signed [(4'hb):(1'h0)] reg224 = (1'h0);
  reg signed [(4'he):(1'h0)] reg223 = (1'h0);
  reg [(2'h2):(1'h0)] reg222 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg221 = (1'h0);
  reg [(4'hb):(1'h0)] reg220 = (1'h0);
  reg [(5'h12):(1'h0)] reg213 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg212 = (1'h0);
  reg [(5'h15):(1'h0)] reg211 = (1'h0);
  reg [(4'hb):(1'h0)] reg206 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg205 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg203 = (1'h0);
  reg [(4'h9):(1'h0)] reg202 = (1'h0);
  reg [(5'h15):(1'h0)] reg201 = (1'h0);
  reg [(4'he):(1'h0)] reg200 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg199 = (1'h0);
  reg [(4'hc):(1'h0)] reg198 = (1'h0);
  reg [(2'h2):(1'h0)] reg197 = (1'h0);
  reg [(5'h13):(1'h0)] reg196 = (1'h0);
  reg [(3'h6):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg191 = (1'h0);
  reg [(4'hc):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg189 = (1'h0);
  reg [(3'h5):(1'h0)] reg188 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg186 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg185 = (1'h0);
  reg [(4'h9):(1'h0)] reg184 = (1'h0);
  reg [(4'h9):(1'h0)] reg183 = (1'h0);
  reg [(4'ha):(1'h0)] reg182 = (1'h0);
  reg [(4'hc):(1'h0)] reg181 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg180 = (1'h0);
  reg [(5'h11):(1'h0)] reg179 = (1'h0);
  reg [(5'h11):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg177 = (1'h0);
  reg [(5'h14):(1'h0)] reg176 = (1'h0);
  reg [(4'hd):(1'h0)] reg175 = (1'h0);
  reg [(5'h12):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg173 = (1'h0);
  reg [(3'h5):(1'h0)] reg172 = (1'h0);
  reg [(3'h7):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg170 = (1'h0);
  reg [(4'hb):(1'h0)] reg169 = (1'h0);
  reg [(4'hf):(1'h0)] reg168 = (1'h0);
  assign y = {wire225,
                 wire219,
                 wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire195,
                 wire194,
                 wire193,
                 wire167,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg213,
                 reg212,
                 reg211,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 (1'h0)};
  assign wire167 = $unsigned((((-(8'ha5)) ?
                           wire164 : ((wire163 ?
                               wire163 : wire166) <<< wire165)) ?
                       ((~^((8'hae) ?
                           wire163 : wire164)) || $signed($unsigned(wire165))) : wire166[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg168 <= ({$signed({{wire166}, wire167[(3'h7):(3'h7)]}),
          {(!wire167), wire163}} - $unsigned((8'ha9)));
      if ((({$unsigned(wire166)} && (wire163[(4'h8):(3'h4)] ?
          wire167 : (wire167[(4'ha):(1'h1)] ?
              $signed(wire167) : $signed((8'hab))))) != (~^((~^(reg168 ?
              (8'hb3) : reg168)) ?
          ($unsigned(wire166) * wire166[(2'h3):(1'h0)]) : reg168))))
        begin
          reg169 <= wire165;
        end
      else
        begin
          reg169 <= ($signed(wire164) ?
              wire163 : $unsigned($unsigned(wire167[(2'h3):(2'h2)])));
          reg170 <= (-(~(|$unsigned((~^(8'haa))))));
          reg171 <= $unsigned($signed($unsigned(reg168[(2'h3):(1'h1)])));
        end
      if ({(&($signed((^~wire164)) ?
              $signed($unsigned((8'hba))) : (reg171 ? wire166 : reg169))),
          $unsigned((({(8'h9d), wire166} ?
              (wire164 && reg170) : wire166) ~^ wire167))})
        begin
          if ((~^(+$signed(({wire167} ?
              (reg168 < wire163) : ((8'h9f) >= wire165))))))
            begin
              reg172 <= ((~^$signed(wire167)) ? (-reg169) : wire165);
              reg173 <= {$signed($unsigned(reg171[(3'h4):(1'h0)]))};
            end
          else
            begin
              reg172 <= (!$unsigned(($unsigned(reg170) ?
                  wire167[(3'h6):(3'h4)] : (8'ha9))));
              reg173 <= ((8'hbb) ?
                  reg171 : ($signed((|(+reg172))) ?
                      reg168 : ((-(&(8'h9f))) ?
                          $signed({(8'hb5)}) : ((8'hac) ?
                              (wire165 ? reg168 : wire166) : reg170))));
              reg174 <= {reg169[(2'h2):(1'h1)],
                  {reg170, (&reg172[(1'h0):(1'h0)])}};
              reg175 <= reg174;
              reg176 <= (!(reg169 ^~ ({$signed(reg168), (~^reg174)} ?
                  ((reg175 ?
                      reg174 : reg175) >= wire163) : (|$signed(reg168)))));
            end
          reg177 <= (wire164 && (~&{($signed(wire163) - $unsigned((7'h44))),
              wire164}));
          reg178 <= $unsigned((($signed((-(8'hb1))) ~^ $signed($unsigned((7'h43)))) <= $unsigned(((!wire165) ?
              wire165 : (reg176 ? reg175 : reg175)))));
          reg179 <= (wire167 ^~ (^reg171));
        end
      else
        begin
          reg172 <= ((8'hbc) && ((~$signed(reg172)) ?
              reg172[(2'h3):(1'h0)] : ((!{reg170,
                  reg171}) < $signed((wire167 * wire167)))));
          reg173 <= {reg174, $signed((^$unsigned((~(8'ha9)))))};
          if (reg177)
            begin
              reg174 <= ($signed({(~&$signed(reg176))}) || $unsigned((((wire163 ?
                      wire167 : (7'h43)) != wire164) ?
                  (~(&reg178)) : (reg177[(3'h7):(2'h2)] ?
                      $signed(reg179) : $signed(reg168)))));
              reg175 <= $unsigned(reg171);
              reg176 <= reg178;
              reg177 <= $unsigned({((((8'ha1) - reg168) ?
                      {(8'hab),
                          reg169} : reg173[(4'h9):(3'h6)]) > (reg174 >>> (reg175 ?
                      wire165 : wire166))),
                  reg179[(4'h9):(2'h3)]});
              reg178 <= {reg172, wire164[(2'h2):(1'h0)]};
            end
          else
            begin
              reg174 <= (^reg175[(1'h0):(1'h0)]);
              reg175 <= wire164[(1'h0):(1'h0)];
              reg176 <= (^~reg173);
              reg177 <= reg176[(4'he):(4'hc)];
            end
        end
      reg180 <= {$unsigned((wire164[(1'h1):(1'h1)] <<< reg175))};
      if (reg174[(2'h2):(1'h0)])
        begin
          if ($signed($signed(reg174[(3'h6):(2'h2)])))
            begin
              reg181 <= $unsigned((^~$unsigned($signed(reg180[(2'h3):(2'h3)]))));
              reg182 <= reg177;
            end
          else
            begin
              reg181 <= $signed({reg181});
            end
          if ($unsigned($unsigned((($unsigned(reg174) ?
              reg174 : $unsigned(wire167)) || ((wire163 <= (8'haa)) * reg179[(4'hc):(4'ha)])))))
            begin
              reg183 <= (wire167[(3'h5):(3'h4)] ?
                  reg168 : (reg173 ?
                      (wire164[(2'h2):(1'h1)] >= $unsigned({reg180})) : ($signed($unsigned(reg182)) ?
                          $unsigned(reg178) : (reg170[(1'h0):(1'h0)] ?
                              (reg178 ? reg175 : wire164) : {reg171,
                                  wire164}))));
              reg184 <= {((~^({wire163, (8'hb9)} ?
                      (wire163 ~^ reg175) : (^~reg174))) || reg182),
                  (&reg176)};
              reg185 <= wire164;
              reg186 <= reg178;
            end
          else
            begin
              reg183 <= {(^~$unsigned((wire164[(1'h0):(1'h0)] ?
                      $signed(wire164) : (&wire163)))),
                  (|(($unsigned((8'ha8)) ?
                      (reg185 <<< reg179) : (reg180 | reg180)) < reg183[(3'h5):(3'h5)]))};
              reg184 <= $signed((reg170 + (((^~reg181) ?
                  $signed(reg170) : $unsigned((8'haa))) | reg174)));
            end
          reg187 <= wire163;
          if (reg182[(3'h4):(2'h3)])
            begin
              reg188 <= (wire166 ?
                  reg174[(3'h4):(3'h4)] : $unsigned((((wire165 ^ reg182) ?
                          (reg181 >>> reg184) : (8'hbc)) ?
                      reg183 : ((^~wire164) ? reg168 : (~^wire164)))));
              reg189 <= reg187;
              reg190 <= $unsigned((wire165 || {(((7'h40) ? reg177 : (8'ha5)) ?
                      (wire167 ? reg189 : (8'hba)) : (+reg185))}));
              reg191 <= reg176;
            end
          else
            begin
              reg188 <= (&($signed($unsigned(((8'hb7) ?
                  reg181 : reg185))) >>> reg183));
              reg189 <= (~|({(reg180[(1'h1):(1'h0)] ~^ reg190)} ?
                  reg175 : $signed(reg186[(4'hc):(2'h2)])));
              reg190 <= reg178[(3'h4):(3'h4)];
              reg191 <= $unsigned(((^wire167) ?
                  $unsigned(reg176) : ({reg191[(4'hb):(3'h5)], (~(8'ha5))} ?
                      ((reg187 ? reg189 : reg182) ?
                          {(7'h43), reg172} : $signed(reg179)) : {reg185,
                          $unsigned(reg186)})));
              reg192 <= (wire166[(3'h4):(1'h0)] ?
                  (!((+(8'ha8)) ? reg190 : $unsigned(reg171))) : reg169);
            end
        end
      else
        begin
          reg181 <= $signed($unsigned($signed($signed($signed(reg172)))));
          reg182 <= (reg179[(2'h2):(1'h1)] ?
              reg188[(3'h4):(1'h1)] : reg190[(3'h5):(3'h4)]);
        end
    end
  assign wire193 = ((^~$signed({reg175})) ~^ $unsigned({(8'hbd)}));
  assign wire194 = ({($unsigned({reg185}) << reg182[(3'h7):(3'h4)]),
                       (reg181[(3'h6):(3'h5)] + {(reg183 ? reg179 : (8'haa)),
                           (~|reg186)})} ^~ (+(reg183[(1'h0):(1'h0)] ?
                       ((reg180 & reg190) > reg189[(2'h3):(1'h1)]) : $unsigned((reg182 ?
                           (8'ha6) : wire193)))));
  assign wire195 = ((&reg185[(3'h6):(1'h1)]) < reg175[(4'h8):(3'h6)]);
  always
    @(posedge clk) begin
      reg196 <= $signed(wire164);
    end
  always
    @(posedge clk) begin
      if ($unsigned($signed((~|reg176))))
        begin
          reg197 <= $signed((reg189 ?
              reg180 : {$signed($signed(reg169)), $signed($unsigned(reg172))}));
        end
      else
        begin
          if ($signed($unsigned(((8'h9f) ?
              reg178 : (((8'ha5) & reg169) >>> {(7'h41)})))))
            begin
              reg197 <= reg180;
              reg198 <= ($unsigned(reg175) ?
                  (~(8'h9d)) : reg169[(2'h3):(1'h0)]);
              reg199 <= ((reg189 ?
                      reg188[(1'h0):(1'h0)] : {reg186,
                          ((wire193 >> (8'hb0)) ?
                              {(8'hb5)} : $unsigned((8'hb8)))}) ?
                  reg171[(3'h6):(2'h2)] : $signed(reg180));
              reg200 <= ((({((8'hb5) ?
                              reg173 : reg173)} >> reg191[(3'h5):(2'h3)]) ?
                      {reg196[(4'hf):(1'h0)],
                          (!reg190[(3'h6):(2'h2)])} : $unsigned($signed({reg189}))) ?
                  {{wire163[(2'h3):(1'h0)]}} : (8'hbb));
            end
          else
            begin
              reg197 <= ($unsigned(wire195[(2'h2):(1'h0)]) & reg186[(1'h1):(1'h1)]);
              reg198 <= {(reg198 << {$signed(wire193[(1'h1):(1'h1)]),
                      (reg176 ?
                          {reg170, reg183} : (reg174 ? wire163 : reg177))}),
                  reg200[(1'h0):(1'h0)]};
              reg199 <= reg176[(3'h7):(3'h5)];
            end
          reg201 <= $signed((^~reg187));
        end
      if (reg174[(4'ha):(3'h4)])
        begin
          reg202 <= {(&{$unsigned(reg181[(3'h5):(1'h1)])})};
          reg203 <= $unsigned((reg179 ~^ (reg197 | (!wire164))));
        end
      else
        begin
          if ($unsigned({$signed(wire194)}))
            begin
              reg202 <= $unsigned((wire193 - $signed((reg173[(1'h1):(1'h0)] ?
                  reg181 : reg183[(4'h8):(1'h0)]))));
              reg203 <= wire193;
            end
          else
            begin
              reg202 <= (wire194[(1'h1):(1'h0)] ?
                  wire167[(3'h5):(3'h4)] : {wire164[(1'h0):(1'h0)],
                      (~&reg191)});
              reg203 <= ((-$unsigned(((8'hb0) ?
                  (8'hb5) : (reg182 & reg179)))) - {{$unsigned($unsigned(reg185))}});
            end
          reg204 <= {$unsigned(reg192),
              $signed((wire165[(3'h6):(2'h3)] << $unsigned({wire195,
                  reg182})))};
          reg205 <= ((8'had) << $signed($signed(reg181[(4'h8):(1'h0)])));
          reg206 <= (^~$signed($signed(((wire193 >> (8'haa)) ?
              reg181 : {wire165}))));
        end
    end
  assign wire207 = (^~((8'ha5) ?
                       (reg186[(2'h2):(1'h1)] != (!$signed(reg171))) : {wire164,
                           (reg185 * wire167)}));
  assign wire208 = ($signed(reg184[(3'h6):(3'h4)]) || wire167[(2'h3):(1'h1)]);
  assign wire209 = reg196;
  assign wire210 = (($signed($signed($signed(reg189))) | $unsigned((reg198[(4'h8):(4'h8)] ?
                           (reg180 > reg184) : reg188[(1'h1):(1'h0)]))) ?
                       $unsigned($signed($unsigned(reg184[(2'h2):(1'h1)]))) : ($unsigned(($signed(reg181) == wire165)) & ($signed(wire194[(3'h4):(2'h2)]) ^ (+(&wire195)))));
  always
    @(posedge clk) begin
      reg211 <= $unsigned($unsigned((^~(&reg179[(4'hd):(2'h3)]))));
      reg212 <= ($signed($signed(((!reg199) >>> (wire193 <= reg189)))) ?
          (8'hb3) : $unsigned((((-reg197) < (~&reg176)) ?
              (^~$signed(reg184)) : reg177)));
      reg213 <= (^~reg181);
    end
  assign wire214 = {wire208};
  assign wire215 = (&$signed($signed(((wire214 >= reg172) ?
                       (wire210 ^ reg202) : wire195[(1'h0):(1'h0)]))));
  assign wire216 = {reg183, $signed($signed(reg184[(1'h1):(1'h0)]))};
  assign wire217 = reg174[(3'h5):(3'h5)];
  assign wire218 = (^~reg191[(1'h1):(1'h0)]);
  assign wire219 = (^{$signed(reg184)});
  always
    @(posedge clk) begin
      reg220 <= $unsigned((~^((^~reg213) <= $unsigned((~reg185)))));
      if (((~&($signed({wire193, reg191}) ?
              (~&$unsigned(reg182)) : reg199[(3'h5):(2'h2)])) ?
          (8'ha5) : {(((~&(8'hba)) ?
                  wire163 : (wire216 >>> (8'ha8))) ~^ $signed($unsigned(wire195)))}))
        begin
          if (reg180)
            begin
              reg221 <= $signed($signed($signed($unsigned($signed(reg203)))));
              reg222 <= $signed({reg197[(1'h0):(1'h0)]});
              reg223 <= $signed((wire165[(5'h10):(4'hf)] || reg175));
            end
          else
            begin
              reg221 <= reg222[(1'h0):(1'h0)];
              reg222 <= wire193;
              reg223 <= reg190[(4'h9):(3'h6)];
            end
          reg224 <= {$unsigned($signed({(!reg204)})),
              (($signed($signed((8'hae))) ~^ ((reg182 + reg200) ?
                  $signed(wire219) : (|wire166))) ^ reg188)};
        end
      else
        begin
          reg221 <= $signed({$signed((8'hbe)), wire193});
          reg222 <= ({($signed((!wire216)) == reg187),
                  $unsigned((^~(reg186 ? (8'hb5) : reg201)))} ?
              {($signed(reg189[(3'h5):(2'h3)]) ?
                      ((reg204 ^ (8'hb1)) ?
                          (reg182 ?
                              wire163 : reg197) : reg168[(4'hd):(3'h7)]) : reg187)} : reg189);
          reg223 <= $unsigned($unsigned(reg212));
        end
    end
  assign wire225 = ({(reg203[(3'h6):(1'h1)] ?
                               reg201 : $signed($signed(reg224)))} ?
                       $unsigned((8'ha1)) : $signed($unsigned($signed((-(8'hb2))))));
endmodule

module module90
#(parameter param127 = (({(((8'hbc) != (8'ha8)) ? ((7'h42) ? (8'h9d) : (8'hb9)) : (8'hbe))} ? (8'ha0) : {(-((8'ha3) >= (8'ha4)))}) ? ((+(((8'ha4) ? (8'hbc) : (8'ha8)) ? (|(8'h9d)) : ((7'h41) && (8'hb1)))) >= ((&((8'hba) ? (8'hb3) : (8'hba))) ? (((8'hb7) * (8'hbe)) ? (&(8'hb8)) : (&(7'h43))) : {{(8'ha5), (8'ha0)}})) : {(~&(((8'ha8) >> (7'h42)) >= (&(8'hae)))), (8'hb5)}), 
parameter param128 = {param127})
(y, clk, wire95, wire94, wire93, wire92, wire91);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire95;
  input wire signed [(5'h12):(1'h0)] wire94;
  input wire signed [(5'h15):(1'h0)] wire93;
  input wire signed [(5'h10):(1'h0)] wire92;
  input wire [(4'ha):(1'h0)] wire91;
  wire [(2'h2):(1'h0)] wire126;
  wire [(2'h2):(1'h0)] wire125;
  wire [(4'he):(1'h0)] wire124;
  wire signed [(3'h4):(1'h0)] wire113;
  wire [(2'h2):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire111;
  wire [(5'h12):(1'h0)] wire110;
  wire [(5'h13):(1'h0)] wire109;
  wire signed [(4'he):(1'h0)] wire108;
  wire [(5'h11):(1'h0)] wire107;
  wire signed [(4'hb):(1'h0)] wire101;
  wire [(5'h12):(1'h0)] wire100;
  wire [(3'h7):(1'h0)] wire99;
  wire [(5'h10):(1'h0)] wire98;
  wire signed [(3'h6):(1'h0)] wire97;
  wire [(2'h2):(1'h0)] wire96;
  reg signed [(4'hc):(1'h0)] reg123 = (1'h0);
  reg [(5'h11):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg [(2'h3):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg103 = (1'h0);
  reg [(5'h14):(1'h0)] reg102 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire124,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
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
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  assign wire96 = (+$unsigned(wire94[(1'h0):(1'h0)]));
  assign wire97 = wire92[(4'hd):(3'h6)];
  assign wire98 = wire91[(3'h5):(3'h4)];
  assign wire99 = wire96[(1'h0):(1'h0)];
  assign wire100 = wire91;
  assign wire101 = (!$unsigned($unsigned({(-wire95)})));
  always
    @(posedge clk) begin
      reg102 <= ($unsigned($signed((~$unsigned(wire95)))) ?
          {wire95[(3'h4):(3'h4)]} : wire94[(4'he):(4'hb)]);
      reg103 <= ($signed(wire97[(1'h1):(1'h1)]) * wire97);
      reg104 <= $signed({(wire94 ? $unsigned(wire98[(4'hf):(4'h8)]) : reg102),
          wire96});
      reg105 <= (((8'haa) ?
          (wire94[(5'h11):(5'h10)] ~^ (|(|wire97))) : $unsigned($unsigned($signed(wire95)))) <<< {(($signed(wire99) + reg102) ?
              $signed($unsigned(wire92)) : (-$unsigned(wire101))),
          $unsigned(wire94)});
      reg106 <= {wire99, wire96[(1'h0):(1'h0)]};
    end
  assign wire107 = (7'h42);
  assign wire108 = $signed((($unsigned($signed(reg105)) ?
                       $signed((wire101 ?
                           wire101 : wire91)) : wire107) < reg103));
  assign wire109 = wire91;
  assign wire110 = (wire93[(5'h15):(4'h9)] | (wire92 ?
                       (|{$unsigned(reg104),
                           $unsigned(wire94)}) : $unsigned((wire97[(2'h3):(1'h0)] >= $unsigned(wire96)))));
  assign wire111 = ($signed(($unsigned((reg103 >> wire98)) ?
                           $unsigned(((8'hb9) ?
                               wire92 : reg106)) : ((wire91 || wire93) ?
                               $unsigned((8'hb6)) : {(8'hb4), wire99}))) ?
                       ({(~|(7'h43)), $unsigned((wire91 ? wire91 : wire110))} ?
                           $signed(({wire93} ?
                               ((8'ha2) ?
                                   reg104 : (8'hb2)) : wire93)) : (+((wire98 ?
                               (8'hab) : wire109) > (reg106 << wire100)))) : $unsigned(wire110));
  assign wire112 = ((8'ha5) ?
                       $signed($signed($signed((^wire91)))) : (((&$unsigned(wire93)) + wire98[(5'h10):(3'h6)]) >>> $signed($signed(wire95[(4'hf):(4'hb)]))));
  assign wire113 = $signed($unsigned(wire98));
  always
    @(posedge clk) begin
      reg114 <= wire107[(4'hb):(3'h7)];
      reg115 <= ({$signed(wire110[(3'h6):(2'h2)])} ?
          wire109[(3'h7):(2'h3)] : $unsigned(wire91));
    end
  always
    @(posedge clk) begin
      reg116 <= ($signed(wire94[(4'hb):(3'h7)]) == $signed(((wire112[(2'h2):(2'h2)] + wire110) ?
          wire100 : $signed((wire111 | wire107)))));
      if (wire112[(1'h0):(1'h0)])
        begin
          if ($signed((|{(~^(8'hbe))})))
            begin
              reg117 <= reg102[(3'h4):(2'h3)];
              reg118 <= {$signed(wire91[(1'h1):(1'h1)]), $signed(wire112)};
              reg119 <= reg117[(4'h8):(2'h2)];
              reg120 <= wire92;
            end
          else
            begin
              reg117 <= ($signed((~&((wire93 ? wire113 : reg105) ?
                      (wire96 ? wire108 : wire110) : (wire97 - wire99)))) ?
                  ($signed({reg105, $signed(wire95)}) ?
                      (wire110 ?
                          reg116[(4'hb):(3'h7)] : ((8'hac) + $unsigned(reg103))) : (+wire97[(3'h6):(3'h4)])) : (~|wire109));
              reg118 <= (&$signed($unsigned($unsigned({reg106, wire93}))));
            end
          reg121 <= $signed(wire93[(4'hf):(3'h5)]);
        end
      else
        begin
          if (reg118[(2'h2):(1'h0)])
            begin
              reg117 <= (~&$unsigned({(8'hb6),
                  (reg103[(3'h7):(2'h2)] ?
                      wire96[(1'h0):(1'h0)] : $unsigned(wire112))}));
            end
          else
            begin
              reg117 <= $signed(((~&reg116[(4'hb):(3'h5)]) >> $unsigned($signed($unsigned(wire94)))));
              reg118 <= (!reg120[(3'h5):(3'h5)]);
              reg119 <= wire97[(1'h0):(1'h0)];
              reg120 <= ($signed($signed($unsigned(wire96))) ?
                  $signed((~$signed($unsigned(wire109)))) : $signed($unsigned((!{wire110}))));
              reg121 <= $signed($unsigned($signed((-(-wire107)))));
            end
          reg122 <= $signed($unsigned(wire95));
        end
      reg123 <= wire100[(1'h0):(1'h0)];
    end
  assign wire124 = (reg122[(3'h6):(1'h1)] == (wire108 | ($signed($signed(wire101)) >> (8'hbd))));
  assign wire125 = (((~((wire98 << reg117) ?
                       (reg118 ?
                           wire101 : (7'h40)) : $unsigned(wire107))) >= $signed((!(wire97 >> wire112)))) != (~$unsigned($signed($unsigned(reg115)))));
  assign wire126 = {(wire124[(3'h5):(1'h0)] ?
                           reg104 : {(+(wire107 ? reg120 : wire110)),
                               ({wire91} ? wire124 : {wire110, (8'hab)})}),
                       wire95};
endmodule

module module61
#(parameter param85 = ((-((~&(|(8'hab))) ? (!((8'ha4) ? (8'hbf) : (8'hb9))) : (^((8'ha8) | (8'hb9))))) ? ((~^((8'hb3) ? {(8'ha7)} : (~&(8'ha8)))) ? ((^~{(8'hb5), (8'hb3)}) ? (^(^(8'ha8))) : (|(^~(7'h44)))) : (~^(~&((7'h40) ~^ (8'ha1))))) : ((^(((8'hbe) ? (8'hb7) : (8'hbf)) ? {(8'ha4)} : ((7'h41) ? (8'hb8) : (8'ha8)))) & ((+(~|(8'h9c))) ? (((8'hb9) ? (7'h40) : (8'ha7)) ? (|(8'hbd)) : (8'hb5)) : (|{(8'hbc)})))), 
parameter param86 = param85)
(y, clk, wire66, wire65, wire64, wire63, wire62);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire66;
  input wire signed [(5'h12):(1'h0)] wire65;
  input wire [(4'hc):(1'h0)] wire64;
  input wire signed [(4'h8):(1'h0)] wire63;
  input wire signed [(5'h11):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire84;
  wire signed [(4'hc):(1'h0)] wire83;
  wire [(4'he):(1'h0)] wire82;
  wire signed [(3'h6):(1'h0)] wire81;
  wire signed [(5'h11):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire79;
  wire signed [(3'h7):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire77;
  wire [(5'h13):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire74;
  wire [(4'hb):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  reg signed [(2'h2):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg70 = (1'h0);
  reg [(4'h9):(1'h0)] reg69 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire75,
                 wire74,
                 wire73,
                 wire68,
                 wire67,
                 reg76,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 (1'h0)};
  assign wire67 = wire63[(2'h3):(1'h0)];
  assign wire68 = ((&wire62[(1'h0):(1'h0)]) & ((wire67 ^ $signed((~^wire64))) ?
                      (wire66[(1'h1):(1'h1)] ?
                          wire64[(1'h0):(1'h0)] : wire66[(1'h0):(1'h0)]) : wire65[(5'h12):(4'ha)]));
  always
    @(posedge clk) begin
      reg69 <= (~|$signed(wire67[(5'h12):(2'h2)]));
      reg70 <= ($signed(((-(wire65 ^ wire64)) ?
          ({wire63} + $unsigned(wire68)) : {(-(8'hbb)),
              wire67[(2'h2):(1'h1)]})) && (7'h42));
      reg71 <= ($unsigned(($unsigned((wire65 & wire68)) << {(wire67 ^ wire65)})) | ((((^reg70) ^ (wire64 || reg69)) ?
          $signed((wire64 || wire68)) : (wire65 & (wire67 && wire67))) | $signed((~|$signed(wire66)))));
      reg72 <= wire68;
    end
  assign wire73 = reg71[(1'h0):(1'h0)];
  assign wire74 = reg72;
  assign wire75 = wire64;
  always
    @(posedge clk) begin
      reg76 <= $unsigned({$signed(wire68),
          ((((8'ha0) ?
              wire66 : reg69) & wire68[(5'h11):(4'h9)]) & ((wire66 <= wire73) && ((8'hac) ?
              wire73 : reg69)))});
    end
  assign wire77 = (({$unsigned((~&reg69)),
                      ($signed(wire62) + wire65[(2'h3):(1'h1)])} + {((wire62 ?
                          reg70 : wire68) << wire73[(1'h1):(1'h0)])}) >= $signed({$unsigned($unsigned(reg70))}));
  assign wire78 = ($signed(($signed(wire68) <<< ((wire65 * (8'hb0)) ?
                      (^~(8'hb2)) : wire68))) & $unsigned({reg71[(1'h0):(1'h0)],
                      $unsigned((reg72 ? reg71 : (8'ha0)))}));
  assign wire79 = $signed((^~{(-(reg71 ? (7'h43) : (8'hb6))),
                      ((~&wire74) ~^ wire63)}));
  assign wire80 = {$unsigned(wire79)};
  assign wire81 = (($unsigned(((~&reg71) ? wire77[(4'hf):(4'he)] : wire80)) ?
                          (~&(((8'h9d) ? wire68 : (8'ha9)) ?
                              {wire80} : $unsigned(wire79))) : (!wire78)) ?
                      ((wire64[(2'h3):(2'h3)] ^ $unsigned((-(8'hb5)))) >>> {wire68[(3'h5):(1'h0)],
                          $unsigned(wire75[(4'hf):(4'hd)])}) : (8'ha7));
  assign wire82 = wire80;
  assign wire83 = $signed({(|({(8'h9f), wire75} ?
                          wire78[(3'h7):(2'h3)] : (wire78 ? wire62 : wire68))),
                      (wire77 || $signed(reg72))});
  assign wire84 = $signed($signed(wire63[(3'h5):(1'h0)]));
endmodule
