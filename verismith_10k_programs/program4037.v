module top
#(parameter param177 = ({(!(8'hb6)), ((|((8'hbe) ? (8'ha6) : (8'ha0))) ? (^~(~^(8'h9c))) : ((8'ha8) ? ((8'hbf) ? (7'h44) : (8'h9f)) : ((8'ha5) >> (8'hb8))))} > ((((|(8'ha9)) * ((8'h9e) != (8'hbc))) != {((8'hb8) ? (8'ha5) : (8'ha6)), (^(8'hae))}) & (8'h9f))), 
parameter param178 = (param177 ? param177 : (param177 ? ((param177 || (8'h9f)) ? (param177 >>> {param177}) : ((param177 ^~ param177) == ((8'hbd) ? param177 : param177))) : (param177 ? param177 : {(param177 <<< param177)}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1e6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire176;
  wire [(4'ha):(1'h0)] wire175;
  wire signed [(4'hf):(1'h0)] wire174;
  wire [(4'hc):(1'h0)] wire167;
  wire [(4'hc):(1'h0)] wire166;
  wire [(3'h5):(1'h0)] wire164;
  wire [(3'h4):(1'h0)] wire53;
  wire signed [(4'he):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire5;
  reg [(4'hd):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg172 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg171 = (1'h0);
  reg [(4'hd):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg169 = (1'h0);
  reg [(4'ha):(1'h0)] reg168 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  assign y = {wire176,
                 wire175,
                 wire174,
                 wire167,
                 wire166,
                 wire164,
                 wire53,
                 wire52,
                 wire51,
                 wire49,
                 wire5,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
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
                 (1'h0)};
  assign wire5 = {$unsigned($unsigned((~&wire0))),
                     ((wire1[(1'h0):(1'h0)] ?
                         ({(8'ha1), wire4} ?
                             (wire2 ? wire1 : wire4) : (wire4 ?
                                 wire3 : wire4)) : (^wire0)) >= $signed((wire4[(3'h6):(2'h3)] >>> {wire1})))};
  always
    @(posedge clk) begin
      reg6 <= $signed({(+{$unsigned((8'hae)), $signed(wire3)}),
          wire2[(3'h7):(1'h0)]});
      if (wire0[(5'h11):(1'h1)])
        begin
          reg7 <= wire0;
          reg8 <= ((~^(wire0 ?
                  $unsigned((wire1 ? (8'ha9) : wire3)) : (^(reg7 || reg7)))) ?
              ((wire0[(3'h5):(3'h5)] ?
                  (~wire3) : (&(~&wire1))) > $signed((^~(-wire2)))) : $signed(((&wire4) ?
                  wire2[(4'hc):(1'h1)] : wire5[(5'h11):(2'h2)])));
        end
      else
        begin
          reg7 <= reg6[(2'h2):(1'h0)];
          if ($signed({(~$unsigned($unsigned(wire5)))}))
            begin
              reg8 <= (reg6 > ($signed($signed(reg7[(2'h3):(1'h0)])) ^~ $signed((reg8[(1'h1):(1'h1)] ^ $signed(wire5)))));
              reg9 <= $signed((~wire3[(4'h8):(1'h1)]));
              reg10 <= (wire5 ?
                  (8'ha6) : (wire0 ?
                      {{$unsigned(wire4), {wire1, reg9}}} : wire3));
              reg11 <= (($unsigned($unsigned(reg7)) ?
                  $signed((~^(wire4 ? reg6 : wire1))) : ((~&$signed((8'ha4))) ?
                      $signed({wire0,
                          (8'had)}) : $signed(reg8[(2'h2):(2'h2)]))) + reg6);
            end
          else
            begin
              reg8 <= (!(~|$signed(reg7)));
              reg9 <= $signed(wire4[(3'h5):(2'h2)]);
              reg10 <= reg10[(3'h7):(1'h1)];
              reg11 <= reg10[(2'h2):(1'h0)];
            end
          if ((-(7'h43)))
            begin
              reg12 <= reg11[(2'h3):(1'h1)];
              reg13 <= reg8;
              reg14 <= (wire3[(3'h4):(3'h4)] >= {(!reg11[(3'h4):(3'h4)])});
              reg15 <= (~{{$unsigned((^~reg11)), (~^$unsigned(reg14))},
                  $unsigned(reg9)});
              reg16 <= reg7[(2'h3):(1'h1)];
            end
          else
            begin
              reg12 <= $unsigned($unsigned(({(reg14 + wire3)} ?
                  $unsigned(reg16[(3'h5):(2'h2)]) : (&reg10))));
              reg13 <= {(({reg13[(2'h2):(1'h0)]} < (|$unsigned(reg16))) && $signed(reg16[(2'h2):(2'h2)]))};
              reg14 <= wire4;
            end
          reg17 <= reg7[(3'h4):(2'h3)];
          reg18 <= (wire4 ~^ {((reg6 ?
                  (~^reg12) : ((8'ha8) ?
                      (8'had) : (8'ha5))) & (wire1[(1'h0):(1'h0)] ?
                  reg11 : $signed(reg15))),
              (wire1 ?
                  $signed({reg9}) : ({(8'hbd)} ?
                      (reg12 ? wire0 : reg13) : $unsigned(wire5)))});
        end
      if (({reg6[(1'h0):(1'h0)]} < ($unsigned($unsigned($signed(wire2))) ^~ $signed(reg8))))
        begin
          if (reg9[(4'hc):(4'hc)])
            begin
              reg19 <= (((~&wire3[(3'h5):(3'h4)]) ? wire5 : (~reg16)) ?
                  wire4 : ($signed(((reg15 ?
                      wire0 : reg10) >= $unsigned((8'ha6)))) > reg14));
            end
          else
            begin
              reg19 <= $unsigned({$unsigned({(~^(8'h9e)),
                      reg15[(2'h2):(1'h0)]})});
              reg20 <= (($signed((^~(reg11 & reg13))) <<< (7'h44)) + reg15[(3'h6):(2'h2)]);
              reg21 <= reg6[(2'h2):(1'h1)];
              reg22 <= $unsigned((-reg21));
            end
          if ((!reg21))
            begin
              reg23 <= reg13[(2'h2):(1'h1)];
              reg24 <= (7'h43);
              reg25 <= ($unsigned(reg10[(3'h7):(3'h5)]) > $unsigned($signed($unsigned((reg15 ?
                  (8'hb3) : reg19)))));
              reg26 <= wire3[(2'h2):(2'h2)];
              reg27 <= $unsigned(wire2);
            end
          else
            begin
              reg23 <= wire1[(3'h7):(3'h6)];
            end
          reg28 <= $unsigned(wire5);
          reg29 <= $signed(reg6[(3'h4):(3'h4)]);
          reg30 <= {{(($signed(reg6) ?
                          (reg6 ? (7'h42) : wire2) : (reg25 ?
                              (8'haf) : reg29)) ?
                      $signed($unsigned(reg14)) : ((wire5 ?
                          reg17 : reg25) == reg17)),
                  ((&(reg14 ? reg16 : reg7)) ?
                      reg15[(4'ha):(2'h3)] : $unsigned((&wire1)))},
              reg13};
        end
      else
        begin
          reg19 <= $signed($signed(reg7));
        end
      reg31 <= reg14[(2'h3):(1'h0)];
    end
  module32 #() modinst50 (wire49, clk, reg13, reg12, reg29, reg31);
  assign wire51 = reg7;
  assign wire52 = $signed({$signed(($unsigned(reg23) << reg20))});
  assign wire53 = $signed($unsigned($signed(({reg30} ?
                      {wire4, (8'hb9)} : {reg30}))));
  module54 #() modinst165 (.wire56(wire51), .wire58(reg20), .wire59(wire1), .y(wire164), .clk(clk), .wire55(reg27), .wire57(reg26));
  assign wire166 = $signed({reg24[(2'h2):(1'h0)],
                       (({wire4, reg8} ?
                           $signed(wire164) : ((7'h44) <<< reg25)) | reg16[(1'h0):(1'h0)])});
  assign wire167 = $signed(($unsigned(($signed(reg16) ?
                           $unsigned(reg8) : (reg27 * reg14))) ?
                       $signed(reg6) : $signed(wire49)));
  always
    @(posedge clk) begin
      reg168 <= wire49;
    end
  always
    @(posedge clk) begin
      if ({(^~(wire167 && $signed(reg6[(3'h5):(1'h1)])))})
        begin
          reg169 <= ((~^reg15[(5'h14):(4'hf)]) ?
              (^$signed(($signed(reg12) << wire3[(3'h6):(1'h1)]))) : (reg15 > (~^($unsigned(wire51) ?
                  wire52[(4'hc):(3'h4)] : (reg15 || reg21)))));
        end
      else
        begin
          reg169 <= wire52;
          if ($unsigned((!($unsigned((reg19 ?
              reg14 : (8'hab))) + $unsigned((8'hb4))))))
            begin
              reg170 <= $signed(reg22[(1'h0):(1'h0)]);
            end
          else
            begin
              reg170 <= (~^($unsigned(($unsigned(reg17) && wire164)) ?
                  $signed(((^~reg13) ?
                      $unsigned(reg29) : wire49)) : $unsigned($unsigned($signed(wire167)))));
            end
          if ($signed(wire53))
            begin
              reg171 <= $unsigned($unsigned($signed($signed((8'hb2)))));
            end
          else
            begin
              reg171 <= wire167;
              reg172 <= (((~^((reg17 > wire0) >> (-reg6))) << reg19) ?
                  $signed((reg170[(3'h4):(3'h4)] >> $unsigned($signed((8'ha0))))) : $signed((reg13[(1'h1):(1'h0)] | $signed(reg22[(3'h7):(3'h6)]))));
            end
        end
      reg173 <= (|(~^$unsigned(reg26[(3'h4):(1'h1)])));
    end
  assign wire174 = ((-$signed(reg15[(4'hd):(4'ha)])) ?
                       (reg7 ?
                           $unsigned($unsigned($signed(reg27))) : $unsigned(((~^reg31) ?
                               wire1 : (reg31 >>> reg29)))) : (($unsigned($signed(wire4)) ?
                               {wire3[(1'h1):(1'h1)],
                                   (^~reg30)} : $signed((reg14 >> reg168))) ?
                           (8'hb7) : {wire3}));
  assign wire175 = {{reg16[(3'h5):(3'h5)],
                           {$signed((reg31 ? reg14 : wire2)),
                               $unsigned(reg168[(3'h5):(3'h5)])}},
                       reg11};
  assign wire176 = $signed((&reg168[(4'h8):(3'h7)]));
endmodule

module module54  (y, clk, wire55, wire56, wire57, wire58, wire59);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire55;
  input wire [(5'h15):(1'h0)] wire56;
  input wire signed [(5'h14):(1'h0)] wire57;
  input wire [(4'hc):(1'h0)] wire58;
  input wire signed [(4'hb):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire163;
  wire signed [(4'hf):(1'h0)] wire161;
  wire [(2'h3):(1'h0)] wire129;
  wire [(4'hb):(1'h0)] wire128;
  wire [(5'h15):(1'h0)] wire127;
  wire signed [(2'h3):(1'h0)] wire60;
  wire [(5'h10):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire62;
  wire signed [(5'h14):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire64;
  wire signed [(5'h11):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire66;
  wire signed [(5'h11):(1'h0)] wire67;
  wire [(4'h9):(1'h0)] wire125;
  assign y = {wire163,
                 wire161,
                 wire129,
                 wire128,
                 wire127,
                 wire60,
                 wire61,
                 wire62,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire67,
                 wire125,
                 (1'h0)};
  assign wire60 = (~|wire56);
  assign wire61 = $signed(((&wire59) ?
                      ($signed((8'hb3)) ?
                          (~&{wire58}) : $unsigned((wire55 ^~ wire59))) : $signed($signed(wire55[(2'h2):(2'h2)]))));
  assign wire62 = $signed($signed(($unsigned($unsigned(wire60)) ?
                      $unsigned(wire59[(1'h0):(1'h0)]) : (^wire55[(1'h1):(1'h0)]))));
  assign wire63 = wire59[(4'h8):(2'h2)];
  assign wire64 = {$signed((wire63 ? (-{wire60}) : ((~|wire58) - wire58)))};
  assign wire65 = $signed((^~wire59[(2'h2):(1'h0)]));
  assign wire66 = (($unsigned(($unsigned(wire58) ?
                              $signed(wire59) : (wire61 ? (8'hb8) : (7'h43)))) ?
                          (wire63[(4'hc):(3'h4)] ?
                              $signed($signed(wire58)) : $unsigned((wire62 || wire60))) : (({wire60} | {(8'hb0),
                                  wire63}) ?
                              (wire60 ?
                                  $signed((8'hbc)) : $signed(wire60)) : (-{wire62}))) ?
                      wire56 : ((-({wire63, wire64} ? (8'hb7) : {wire61})) ?
                          {wire58[(1'h0):(1'h0)],
                              ((!wire62) >>> wire64[(3'h7):(3'h5)])} : (~($signed(wire64) - $unsigned(wire58)))));
  assign wire67 = wire59[(3'h6):(2'h3)];
  module68 #() modinst126 (wire125, clk, wire63, wire65, wire58, wire55, wire64);
  assign wire127 = $signed((&(wire67 <<< ((~|(8'hb2)) >>> $unsigned(wire62)))));
  assign wire128 = (({(^~wire55[(3'h4):(3'h4)]),
                               (((8'ha8) ? wire57 : wire125) ?
                                   (wire58 ?
                                       wire65 : wire57) : wire127[(2'h2):(1'h1)])} ?
                           wire125 : $signed(((&wire62) || wire56[(2'h2):(2'h2)]))) ?
                       $signed({$signed($unsigned(wire55))}) : wire60);
  assign wire129 = {$unsigned((~^$signed($signed(wire61)))),
                       wire66[(3'h5):(1'h0)]};
  module130 #() modinst162 (.y(wire161), .wire134(wire61), .wire131(wire59), .wire133(wire65), .clk(clk), .wire132(wire67));
  assign wire163 = (&wire63[(3'h5):(1'h0)]);
endmodule

module module32
#(parameter param48 = (|{{(|((7'h44) | (8'haf))), (((8'ha8) ? (8'hb5) : (8'hac)) > ((8'hb3) ~^ (8'hac)))}}))
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire36;
  input wire signed [(5'h12):(1'h0)] wire35;
  input wire signed [(2'h3):(1'h0)] wire34;
  input wire signed [(3'h6):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire37;
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
                 (1'h0)};
  assign wire37 = wire36[(1'h0):(1'h0)];
  assign wire38 = ((~|$unsigned(wire37[(1'h0):(1'h0)])) ?
                      $unsigned(wire35[(1'h1):(1'h1)]) : $signed(wire33[(1'h1):(1'h1)]));
  assign wire39 = (^(-$signed((~|$signed(wire35)))));
  assign wire40 = (!(^(wire34 ? (^~(!wire38)) : wire35)));
  assign wire41 = wire33;
  assign wire42 = {wire41[(3'h4):(2'h3)],
                      ((($unsigned(wire39) > {wire36,
                          wire38}) >= wire34[(1'h0):(1'h0)]) * wire36)};
  assign wire43 = $unsigned($unsigned((($unsigned((8'hac)) && wire39[(2'h2):(2'h2)]) <= ((~&wire42) ?
                      wire42 : $signed(wire33)))));
  assign wire44 = $unsigned((8'hab));
  assign wire45 = ((!$unsigned(({wire34} ?
                      wire40[(1'h1):(1'h1)] : $unsigned(wire40)))) ^ ((((~&wire39) >>> (|(8'h9c))) & wire41) ?
                      wire38 : wire35[(4'h8):(1'h0)]));
  assign wire46 = ($signed(($unsigned((wire34 < (8'hab))) ?
                          wire34[(2'h3):(2'h3)] : ({wire43} >= {wire35,
                              wire36}))) ?
                      (&$signed($unsigned(wire43[(4'hb):(3'h5)]))) : wire37);
  assign wire47 = (wire46[(3'h5):(1'h1)] ?
                      $signed($unsigned((8'ha4))) : (({wire45[(4'h9):(2'h2)],
                              $signed(wire45)} <<< $unsigned($unsigned(wire40))) ?
                          wire39 : ({wire42[(4'he):(4'he)], (+wire38)} ?
                              ((wire35 ? wire36 : wire33) ?
                                  (+wire38) : $signed(wire41)) : $signed((~|(8'hbc))))));
endmodule

module module130
#(parameter param159 = (-((+{((8'hb4) <<< (8'hbe))}) ~^ (({(8'ha8)} ~^ {(8'hac), (7'h42)}) || (((8'hb6) << (7'h43)) ^~ ((8'ha6) & (8'hb0)))))), 
parameter param160 = (8'hb2))
(y, clk, wire134, wire133, wire132, wire131);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire134;
  input wire [(2'h2):(1'h0)] wire133;
  input wire [(3'h5):(1'h0)] wire132;
  input wire signed [(3'h5):(1'h0)] wire131;
  wire signed [(5'h14):(1'h0)] wire158;
  wire signed [(2'h3):(1'h0)] wire157;
  wire [(5'h12):(1'h0)] wire141;
  wire [(4'hd):(1'h0)] wire140;
  wire signed [(4'he):(1'h0)] wire136;
  wire [(4'ha):(1'h0)] wire135;
  reg signed [(5'h10):(1'h0)] reg156 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg155 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg154 = (1'h0);
  reg [(5'h14):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg151 = (1'h0);
  reg [(5'h11):(1'h0)] reg150 = (1'h0);
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  reg [(4'hb):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg144 = (1'h0);
  reg [(5'h11):(1'h0)] reg143 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg142 = (1'h0);
  reg signed [(4'he):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg138 = (1'h0);
  reg [(5'h15):(1'h0)] reg137 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire141,
                 wire140,
                 wire136,
                 wire135,
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
                 reg139,
                 reg138,
                 reg137,
                 (1'h0)};
  assign wire135 = ({((8'hbd) == $signed($signed((8'h9f))))} ?
                       wire132 : $unsigned({$unsigned($unsigned(wire133)),
                           ((^~wire134) ? wire134 : (wire131 ^~ wire131))}));
  assign wire136 = (wire135 && {$signed(wire135[(2'h3):(1'h0)]),
                       {wire133[(2'h2):(1'h1)]}});
  always
    @(posedge clk) begin
      reg137 <= (8'ha3);
      reg138 <= $unsigned(((({reg137, reg137} ? reg137 : $signed(reg137)) ?
              (-(wire134 ? (8'ha3) : (8'ha7))) : (~^(wire133 || wire133))) ?
          $signed(reg137[(5'h11):(3'h4)]) : $signed($signed($unsigned(wire135)))));
      reg139 <= reg137[(3'h6):(1'h0)];
    end
  assign wire140 = reg137;
  assign wire141 = (&$unsigned($unsigned($unsigned((reg138 >= wire136)))));
  always
    @(posedge clk) begin
      reg142 <= {{(^~wire131[(3'h5):(1'h0)]), $unsigned($signed((^~wire141)))}};
      if ($signed((wire134[(2'h2):(1'h0)] >> $unsigned($signed($signed(wire136))))))
        begin
          if ($unsigned((-($unsigned($signed((7'h41))) ?
              $signed((reg139 ? wire134 : wire134)) : wire132))))
            begin
              reg143 <= $signed({reg142[(1'h1):(1'h1)],
                  $unsigned(((8'ha2) ?
                      {reg139, wire131} : reg139[(1'h1):(1'h0)]))});
              reg144 <= ($signed($unsigned($unsigned(wire134))) ?
                  wire140[(3'h6):(3'h4)] : wire141[(3'h4):(1'h1)]);
              reg145 <= $unsigned($unsigned(reg143[(1'h1):(1'h0)]));
              reg146 <= wire136;
            end
          else
            begin
              reg143 <= $signed((~&reg138[(4'h9):(3'h7)]));
              reg144 <= $unsigned(reg143);
              reg145 <= (|reg142[(2'h3):(1'h0)]);
            end
          if ($unsigned(wire132[(1'h1):(1'h0)]))
            begin
              reg147 <= (~^$unsigned((8'ha9)));
              reg148 <= ((($signed($signed(wire133)) > (((8'hb7) >>> wire135) * (wire136 ?
                      wire131 : reg144))) == reg142) ?
                  reg138 : $unsigned({((&reg139) ?
                          {wire136, wire132} : $unsigned(reg145))}));
              reg149 <= ($signed(($unsigned(wire135) ?
                  wire135 : (8'hab))) > reg138);
              reg150 <= ((^~(-$unsigned($signed(reg146)))) ?
                  (reg142[(1'h1):(1'h0)] + $unsigned($signed((8'h9f)))) : (~^(wire132[(1'h0):(1'h0)] ^~ {(reg137 ?
                          reg145 : wire140),
                      reg143})));
            end
          else
            begin
              reg147 <= {((~&($signed(reg138) ?
                          (reg146 ? (8'hbd) : reg148) : (reg146 - wire132))) ?
                      (-{$unsigned((8'hb2))}) : ({(8'hba),
                              wire133[(1'h0):(1'h0)]} ?
                          ($unsigned(wire134) >>> (^~(8'ha0))) : ((reg146 ~^ reg147) ?
                              (wire132 & wire131) : {reg145, (8'hb0)}))),
                  ((wire135 ?
                      $unsigned($unsigned((8'h9f))) : wire132) - {$signed((7'h41))})};
              reg148 <= (~$signed((!reg149[(2'h2):(1'h1)])));
            end
        end
      else
        begin
          reg143 <= reg142;
        end
      if ($unsigned(wire135))
        begin
          reg151 <= wire140[(4'hd):(4'h9)];
          reg152 <= ((reg148[(3'h7):(2'h3)] | $unsigned($unsigned(wire134[(1'h1):(1'h0)]))) ?
              ($unsigned((&(~&reg144))) ?
                  ({{reg148, reg144}} << {(|wire135),
                      $signed(reg151)}) : $signed(($signed(reg150) + $unsigned(wire141)))) : (7'h40));
          reg153 <= (reg137[(4'hf):(4'hf)] == $unsigned((!{(~&reg139),
              (wire141 - wire141)})));
          reg154 <= ($signed($signed($signed((wire136 | reg143)))) ^ wire133);
          reg155 <= $unsigned(reg146[(4'h8):(1'h0)]);
        end
      else
        begin
          if (((~|(7'h43)) & $signed($signed((~|wire140)))))
            begin
              reg151 <= $unsigned(reg151);
              reg152 <= reg152;
              reg153 <= (reg153[(4'hc):(4'h8)] ^~ (({wire141, wire133} ?
                  $signed((!reg149)) : $signed($unsigned(reg155))) || (-(reg147[(4'hf):(4'h8)] ~^ (wire141 >= reg153)))));
            end
          else
            begin
              reg151 <= ({$unsigned((reg144[(3'h5):(1'h0)] == wire136[(4'hd):(3'h7)]))} & reg138[(4'h8):(2'h2)]);
              reg152 <= (reg152 ?
                  $unsigned(reg143[(4'hb):(3'h6)]) : (+((reg144 ?
                          (^wire135) : wire131) ?
                      $unsigned($signed(wire133)) : reg142[(2'h2):(2'h2)])));
              reg153 <= $signed((~^reg154[(1'h1):(1'h1)]));
              reg154 <= $signed(reg151);
              reg155 <= ((wire132 ?
                      (-((reg139 ? reg142 : (8'ha3)) ?
                          wire135[(3'h5):(1'h0)] : $unsigned(wire140))) : (wire132 * reg149[(3'h7):(2'h3)])) ?
                  $unsigned((reg142[(2'h3):(2'h2)] == $signed((8'ha3)))) : (reg142[(2'h3):(2'h2)] == $unsigned({$unsigned(reg145),
                      {reg152, wire131}})));
            end
        end
      reg156 <= (&$signed(wire136[(2'h2):(1'h1)]));
    end
  assign wire157 = {reg146[(4'ha):(2'h2)],
                       $signed((reg152 ?
                           $signed((reg139 ^~ reg147)) : ($unsigned((8'hb3)) ?
                               (reg146 & reg152) : $signed(reg147))))};
  assign wire158 = (({reg143[(5'h10):(2'h3)], reg153[(3'h5):(2'h2)]} ?
                       (+(((8'hb0) >>> (8'ha7)) ?
                           (reg156 > (8'hb2)) : (reg154 ?
                               reg155 : reg137))) : reg148[(4'ha):(2'h3)]) == (!$signed((^~{reg144}))));
endmodule

module module68
#(parameter param123 = {(8'h9f)}, 
parameter param124 = param123)
(y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h21b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire73;
  input wire [(3'h7):(1'h0)] wire72;
  input wire [(4'hc):(1'h0)] wire71;
  input wire signed [(3'h7):(1'h0)] wire70;
  input wire signed [(3'h4):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire122;
  wire signed [(4'hf):(1'h0)] wire121;
  wire [(4'ha):(1'h0)] wire120;
  wire signed [(3'h5):(1'h0)] wire111;
  wire signed [(3'h7):(1'h0)] wire110;
  wire signed [(4'hc):(1'h0)] wire109;
  wire [(3'h4):(1'h0)] wire108;
  wire signed [(5'h15):(1'h0)] wire107;
  wire signed [(5'h13):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire88;
  wire [(4'ha):(1'h0)] wire87;
  wire [(4'ha):(1'h0)] wire74;
  reg signed [(5'h12):(1'h0)] reg119 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg117 = (1'h0);
  reg [(5'h10):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg114 = (1'h0);
  reg [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg [(3'h7):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg [(2'h3):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg97 = (1'h0);
  reg [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(4'hc):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg82 = (1'h0);
  reg [(3'h5):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire89,
                 wire88,
                 wire87,
                 wire74,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
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
                 (1'h0)};
  assign wire74 = (^~wire71[(3'h7):(3'h5)]);
  always
    @(posedge clk) begin
      reg75 <= wire70[(1'h0):(1'h0)];
      reg76 <= $signed($unsigned((!reg75)));
      reg77 <= reg75;
      reg78 <= ($unsigned((^~(wire71 * (~&reg75)))) ?
          wire69 : $unsigned((~$signed($unsigned((8'hb9))))));
      if ((!(((~&wire71[(4'hc):(2'h3)]) ? wire74[(3'h7):(3'h5)] : (8'hb0)) ?
          ((~$unsigned(reg75)) & {reg76[(3'h5):(2'h3)],
              $signed(reg75)}) : $signed($unsigned($signed(wire71))))))
        begin
          if ($signed((-wire74)))
            begin
              reg79 <= $signed((wire71[(4'h8):(3'h5)] ?
                  $signed({(reg77 ? reg75 : wire71),
                      reg78[(1'h1):(1'h1)]}) : (~&$unsigned((&reg77)))));
              reg80 <= (^~((wire70 ~^ reg78[(1'h0):(1'h0)]) ?
                  ((wire72[(3'h6):(2'h3)] ~^ wire69) ?
                      reg78 : (~^(wire73 < wire70))) : reg77[(5'h12):(3'h4)]));
              reg81 <= ({wire69} - (~(!(8'hb9))));
            end
          else
            begin
              reg79 <= wire70;
              reg80 <= $unsigned(reg77);
              reg81 <= (~^(~&reg78));
              reg82 <= (~^((+$unsigned((^~wire74))) ?
                  {$unsigned($unsigned(wire73))} : (|(~^wire74))));
            end
          reg83 <= {wire69, $signed(wire73)};
          reg84 <= (~&wire74);
          reg85 <= reg83;
          reg86 <= (wire72[(1'h1):(1'h1)] ?
              reg83 : {(~^{reg81, $signed(wire74)}),
                  (($unsigned(wire71) ^ $signed(reg81)) ?
                      $signed((8'hab)) : (reg83 ?
                          reg81[(3'h5):(1'h0)] : (reg84 ~^ wire72)))});
        end
      else
        begin
          if ($unsigned(({reg78[(2'h2):(1'h1)], reg78[(1'h0):(1'h0)]} ?
              $unsigned($signed($signed((8'hb6)))) : ((-reg79[(5'h10):(3'h5)]) < $unsigned($unsigned(wire73))))))
            begin
              reg79 <= (^(~&(reg77[(1'h1):(1'h1)] <= ((wire70 ?
                  reg79 : reg82) > reg83[(3'h5):(3'h5)]))));
              reg80 <= reg80[(2'h2):(1'h1)];
            end
          else
            begin
              reg79 <= $unsigned(((~&(reg83[(1'h1):(1'h0)] ?
                      (reg76 >> reg75) : (&(8'hb5)))) ?
                  ($unsigned(wire70) ?
                      wire72 : $signed(((8'ha9) * wire69))) : reg84[(2'h2):(1'h1)]));
              reg80 <= (((reg75 ^~ $unsigned(reg77[(5'h12):(1'h0)])) ?
                  (~^((reg85 ? reg83 : reg81) ?
                      $signed(reg77) : $unsigned((8'had)))) : wire74) != (8'hab));
            end
          reg81 <= $signed(wire74[(1'h1):(1'h0)]);
          reg82 <= reg77[(5'h13):(4'hf)];
        end
    end
  assign wire87 = (|((~&$unsigned((reg85 ~^ reg81))) ?
                      {wire72,
                          ($unsigned(reg79) <= $signed(wire71))} : reg78[(1'h1):(1'h1)]));
  assign wire88 = (wire74[(4'h8):(2'h3)] ? {(~&reg80)} : $unsigned(reg79));
  assign wire89 = (reg83 >= (8'hbb));
  always
    @(posedge clk) begin
      reg90 <= reg80[(3'h5):(3'h4)];
      if ({reg77[(3'h7):(2'h2)]})
        begin
          if ($signed({wire69[(1'h1):(1'h0)]}))
            begin
              reg91 <= $unsigned((reg81 <= (~&$signed((^wire88)))));
              reg92 <= wire87;
            end
          else
            begin
              reg91 <= reg82;
              reg92 <= $unsigned($signed(($signed(wire69) ~^ ((reg76 ?
                      (8'haa) : reg82) ?
                  wire69[(2'h3):(2'h3)] : (reg77 ? wire71 : reg75)))));
              reg93 <= (reg78 && ($unsigned(({reg90} ?
                  {reg78} : (|reg80))) && (~|{$unsigned(wire89)})));
              reg94 <= ({reg75[(3'h4):(1'h1)]} && reg86);
            end
          reg95 <= $signed(((((&wire72) ^ (reg94 || (8'hae))) < (~$unsigned(wire72))) && reg78));
          reg96 <= (8'hae);
          reg97 <= (~&reg92[(2'h2):(1'h0)]);
        end
      else
        begin
          if (reg86[(1'h0):(1'h0)])
            begin
              reg91 <= (reg85[(1'h0):(1'h0)] && ($unsigned(reg80) ?
                  (wire69[(1'h1):(1'h0)] ?
                      (~&(reg97 != (8'ha0))) : {(!reg75)}) : reg79[(4'h9):(3'h4)]));
              reg92 <= reg77[(4'hf):(4'he)];
              reg93 <= (((wire71 ?
                  (~^$signed(wire70)) : wire69[(3'h4):(3'h4)]) ~^ {reg81,
                  wire69[(2'h2):(1'h0)]}) || (wire88[(4'he):(4'hb)] ?
                  {$signed(wire73[(2'h2):(1'h1)])} : (|($unsigned(reg81) ?
                      ((8'ha8) & reg77) : wire88))));
              reg94 <= (reg81[(1'h0):(1'h0)] ?
                  ({((reg96 ? reg77 : (8'hb1)) <<< (wire69 ? (8'hb0) : reg94)),
                          {reg84[(4'he):(3'h5)]}} ?
                      (|$unsigned($unsigned(reg92))) : ((+$unsigned(reg83)) ?
                          ($unsigned(wire88) < $unsigned(reg95)) : ((reg93 ?
                                  reg96 : reg78) ?
                              wire72[(3'h6):(3'h5)] : {reg92,
                                  wire89}))) : {(-(reg94[(3'h6):(1'h1)] ?
                          $signed((8'hb4)) : (|reg95))),
                      {{reg83[(2'h3):(2'h2)], (wire73 >> wire72)},
                          (^~{reg75})}});
            end
          else
            begin
              reg91 <= ((~reg75[(2'h3):(2'h2)]) ? reg91 : (8'hbe));
              reg92 <= $signed(({reg95[(2'h3):(1'h0)]} ~^ ($unsigned((!wire88)) <<< (((8'ha3) * wire74) ?
                  (reg83 != wire71) : (~reg86)))));
              reg93 <= (8'hb8);
              reg94 <= $unsigned($unsigned(reg94[(3'h5):(2'h2)]));
              reg95 <= (^(!(^$unsigned(wire88))));
            end
          if (((((reg83[(3'h6):(3'h5)] & reg81[(1'h1):(1'h1)]) ^~ (+{wire74,
                  (8'ha4)})) ?
              (reg86 ?
                  reg84 : ((&reg82) ?
                      (wire69 | reg76) : reg86[(4'h9):(3'h6)])) : reg81) & wire72[(2'h3):(1'h0)]))
            begin
              reg96 <= reg81[(1'h0):(1'h0)];
              reg97 <= ({reg83[(4'ha):(3'h7)]} ?
                  $signed($signed(((wire87 == reg96) || reg94[(1'h1):(1'h1)]))) : (wire74[(3'h5):(2'h3)] ?
                      (reg82[(3'h4):(1'h0)] ?
                          (!(~&reg81)) : reg91) : ($signed((~^(8'hba))) < {$unsigned(wire69)})));
            end
          else
            begin
              reg96 <= wire74;
            end
          if ((({(reg76 ?
                  (wire74 ?
                      reg91 : reg93) : $unsigned(reg83))} >>> $unsigned(reg78)) ^~ reg78))
            begin
              reg98 <= {$unsigned((^wire89[(5'h10):(4'h9)]))};
              reg99 <= reg81[(3'h4):(3'h4)];
            end
          else
            begin
              reg98 <= {({reg96[(3'h5):(1'h1)],
                      ({wire74, reg97} ? wire71 : $signed(reg99))} <= wire69),
                  $signed({($unsigned(wire89) ?
                          {(8'had), reg90} : $signed(wire88)),
                      reg82[(1'h0):(1'h0)]})};
            end
          reg100 <= $unsigned($signed({$signed($unsigned((8'hac))),
              (reg90[(1'h1):(1'h1)] >> $signed(reg81))}));
          reg101 <= wire74;
        end
      reg102 <= reg85[(2'h2):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg103 <= ((|(wire88 ?
          ((reg79 & reg78) && reg97[(3'h4):(3'h4)]) : (~|reg93))) ^~ $signed(reg75[(3'h6):(2'h2)]));
      if ($signed((($unsigned($signed(reg84)) - ($unsigned(reg75) ?
          $unsigned(wire70) : (reg78 ?
              reg79 : reg79))) ^~ reg79[(4'hd):(1'h0)])))
        begin
          reg104 <= ((reg100[(4'h9):(3'h7)] ?
              (!(+(reg97 ?
                  wire71 : wire72))) : reg96[(4'hb):(2'h2)]) + (&wire73));
        end
      else
        begin
          reg104 <= (|{$signed(($unsigned(reg94) ?
                  {wire89, reg75} : wire88[(3'h6):(3'h6)]))});
          reg105 <= reg104[(4'hd):(4'h9)];
          reg106 <= reg105[(1'h0):(1'h0)];
        end
    end
  assign wire107 = (-(8'hbf));
  assign wire108 = reg82;
  assign wire109 = reg92;
  assign wire110 = (|$signed($signed($unsigned((wire88 ^~ (8'ha5))))));
  assign wire111 = ({reg77[(5'h10):(1'h1)],
                       (|(-((8'h9c) && (8'ha3))))} != ((!reg99[(2'h2):(1'h0)]) ^~ reg96[(4'hb):(1'h0)]));
  always
    @(posedge clk) begin
      if (wire109)
        begin
          reg112 <= (~|$signed(wire71));
          reg113 <= wire73;
          if ($signed({(^~reg85[(4'hb):(1'h1)]),
              {((reg96 ? (8'hb2) : (7'h41)) * (wire111 ? (8'hbb) : wire88)),
                  (reg82[(2'h2):(1'h1)] == reg83)}}))
            begin
              reg114 <= $unsigned(((^{(reg92 ? (7'h40) : reg96),
                      (wire109 << wire74)}) ?
                  (reg77 ?
                      (|$signed(reg79)) : $unsigned(((8'hb7) ^~ wire70))) : reg112));
            end
          else
            begin
              reg114 <= (reg98 ?
                  (~$unsigned($signed(wire87))) : ($unsigned(($unsigned(reg93) + $signed((8'hb7)))) ?
                      $unsigned(reg84[(2'h3):(2'h2)]) : ((reg77[(3'h4):(2'h3)] ?
                          $unsigned(reg103) : $unsigned(reg91)) >= reg78[(1'h1):(1'h0)])));
              reg115 <= ($signed((|(!(&wire107)))) << (+reg101));
              reg116 <= (8'hbd);
              reg117 <= ($signed((wire72[(3'h6):(2'h3)] ?
                      wire88[(4'ha):(3'h6)] : reg75)) ?
                  ((~(~&{(8'hbd)})) - wire70[(3'h7):(1'h1)]) : $unsigned(wire88[(4'hb):(3'h7)]));
            end
          reg118 <= $signed(({$unsigned((~|reg80))} ^~ reg117));
        end
      else
        begin
          if ((-$signed(($signed($signed(wire73)) ?
              (reg85[(4'hf):(4'h9)] ?
                  (reg77 ? reg112 : reg117) : (reg79 ?
                      reg115 : reg83)) : wire111[(1'h0):(1'h0)]))))
            begin
              reg112 <= reg91[(4'h9):(1'h1)];
            end
          else
            begin
              reg112 <= reg85[(3'h5):(2'h2)];
              reg113 <= reg113[(2'h2):(1'h0)];
              reg114 <= reg100;
              reg115 <= (+$signed($signed(((-reg77) * (8'hb9)))));
            end
          reg116 <= (((|($signed(reg113) <<< (8'hbd))) ?
                  (~^(&reg112[(2'h3):(1'h0)])) : $unsigned($unsigned(wire71[(1'h0):(1'h0)]))) ?
              {{(~&reg91[(4'h8):(2'h3)]), ((~|reg82) - reg117)},
                  $signed($unsigned(reg83))} : $signed(reg104));
          reg117 <= (reg75[(2'h2):(1'h0)] ?
              $unsigned(wire111) : ($signed({$signed(wire70)}) ?
                  wire89[(1'h1):(1'h1)] : wire74));
          reg118 <= (reg91[(1'h0):(1'h0)] ? $unsigned((8'ha7)) : wire87);
          reg119 <= reg75;
        end
    end
  assign wire120 = ($unsigned(reg90) < ((wire71[(3'h6):(3'h5)] > reg79) ?
                       ((((8'hb7) ? reg98 : wire108) ?
                           $signed(reg83) : $signed(reg98)) > ((|reg76) ?
                           $unsigned(reg92) : (wire72 | (8'hae)))) : (reg78[(3'h4):(2'h3)] == $unsigned((reg75 >> (8'hb7))))));
  assign wire121 = $unsigned($unsigned($unsigned($signed((wire70 && reg119)))));
  assign wire122 = (wire74 ^ $signed($signed(reg78)));
endmodule
