module top
#(parameter param226 = (^{(^(((7'h43) >> (8'hb2)) ? ((8'ha5) * (8'h9e)) : {(8'hba)}))}), 
parameter param227 = (~(^(!(param226 - {param226})))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h292):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire225;
  wire [(5'h11):(1'h0)] wire220;
  wire signed [(3'h7):(1'h0)] wire219;
  wire [(4'ha):(1'h0)] wire218;
  wire [(4'h9):(1'h0)] wire200;
  wire signed [(5'h14):(1'h0)] wire199;
  wire signed [(4'h9):(1'h0)] wire198;
  wire signed [(3'h5):(1'h0)] wire197;
  wire signed [(4'he):(1'h0)] wire196;
  wire signed [(4'he):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire194;
  reg signed [(5'h13):(1'h0)] reg224 = (1'h0);
  reg [(3'h4):(1'h0)] reg223 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg222 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg221 = (1'h0);
  reg [(5'h12):(1'h0)] reg217 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg216 = (1'h0);
  reg [(4'he):(1'h0)] reg215 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg214 = (1'h0);
  reg [(3'h6):(1'h0)] reg213 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg212 = (1'h0);
  reg [(3'h5):(1'h0)] reg211 = (1'h0);
  reg [(4'h8):(1'h0)] reg210 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg209 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg208 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg207 = (1'h0);
  reg [(4'hb):(1'h0)] reg206 = (1'h0);
  reg [(4'hc):(1'h0)] reg205 = (1'h0);
  reg [(5'h12):(1'h0)] reg204 = (1'h0);
  reg [(4'hc):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg202 = (1'h0);
  reg [(3'h7):(1'h0)] reg201 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  assign y = {wire225,
                 wire220,
                 wire219,
                 wire218,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire194,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
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
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = (~(~^(~(wire3[(2'h3):(2'h3)] ^ (wire0 && wire4)))));
  assign wire6 = (|($signed((~^$unsigned((8'hb2)))) <<< $signed(((wire4 <<< wire0) & (wire5 ?
                     wire1 : (8'ha8))))));
  assign wire7 = ((^wire2) ?
                     ((^(8'had)) ?
                         $signed(wire6[(3'h4):(2'h3)]) : $signed(wire3)) : wire4[(2'h3):(1'h0)]);
  assign wire8 = wire3;
  always
    @(posedge clk) begin
      reg9 <= $unsigned((wire2[(2'h2):(2'h2)] ?
          wire0[(4'hb):(1'h0)] : $unsigned(((~wire5) | wire6[(3'h5):(1'h0)]))));
      reg10 <= ((~&(((wire6 ?
              wire0 : wire6) > (&wire4)) && wire2[(2'h3):(2'h3)])) ?
          ((~^wire5) ?
              ((8'hb8) ^ reg9) : ((~^(wire5 < wire1)) ?
                  ((wire8 + wire8) ?
                      wire1[(5'h10):(4'hb)] : (!wire3)) : wire4)) : wire3[(4'h8):(2'h2)]);
      if ($unsigned($unsigned({wire6})))
        begin
          reg11 <= reg9[(2'h3):(1'h0)];
          if (wire8)
            begin
              reg12 <= $signed(wire4);
              reg13 <= $unsigned(({(wire1[(3'h5):(3'h5)] || (wire1 ^~ wire2)),
                  (~|(-wire8))} ^ {(~&wire3),
                  ((wire2 ? reg10 : wire2) ?
                      ((8'hba) || wire1) : $signed(reg10))}));
              reg14 <= ((&$signed(reg10)) >= (|{wire0}));
              reg15 <= reg11;
              reg16 <= (~|reg14);
            end
          else
            begin
              reg12 <= wire7;
              reg13 <= (reg10 != $signed({wire8, $unsigned((-wire5))}));
              reg14 <= {($signed(wire3) * $unsigned(((reg14 < wire8) ?
                      (~^(8'hbc)) : $signed(wire1)))),
                  wire7};
            end
          reg17 <= ({{(8'hb2)}} ?
              $unsigned(($signed((wire2 ? wire1 : reg9)) ?
                  (~|((8'h9c) <<< (8'hb5))) : wire4)) : wire1);
        end
      else
        begin
          if ((&{wire3, $signed(reg11)}))
            begin
              reg11 <= wire6[(4'hf):(4'h8)];
            end
          else
            begin
              reg11 <= $signed($signed(wire3));
              reg12 <= wire8[(4'h8):(4'h8)];
              reg13 <= (~^wire6);
              reg14 <= {$unsigned(wire7)};
              reg15 <= $signed(((wire3 ?
                      reg15[(1'h0):(1'h0)] : (~&$unsigned(wire8))) ?
                  ((reg11[(4'h8):(1'h0)] * $signed(wire4)) ?
                      $signed($unsigned(reg17)) : $signed(reg13)) : reg12));
            end
          if ((-wire0[(3'h6):(3'h4)]))
            begin
              reg16 <= (|(~(({reg14, wire2} != (^~wire6)) ^~ ($signed((8'ha4)) ?
                  reg15 : {(8'ha5), reg14}))));
              reg17 <= $signed(($unsigned($unsigned($signed(reg17))) ?
                  (((^wire3) ? $signed(wire6) : (reg15 ? (8'ha3) : reg17)) ?
                      $unsigned(wire0) : ($unsigned(wire1) & wire8)) : (($unsigned(wire1) >> (reg9 == wire8)) << wire3)));
            end
          else
            begin
              reg16 <= $signed((~&wire0[(3'h4):(1'h0)]));
              reg17 <= reg13;
            end
          reg18 <= $unsigned(reg17);
          if (wire7)
            begin
              reg19 <= $signed((^~reg13[(2'h2):(1'h1)]));
              reg20 <= ((~^wire1[(2'h2):(1'h0)]) <<< $unsigned(reg16));
              reg21 <= wire8[(4'hb):(4'h9)];
              reg22 <= (~|(~(8'h9f)));
            end
          else
            begin
              reg19 <= $signed($signed({{reg20[(4'hb):(3'h5)],
                      wire4[(3'h6):(2'h2)]}}));
            end
        end
      reg23 <= $signed(($unsigned({(8'had), (wire1 + wire2)}) ?
          (($signed(reg15) <<< reg17[(2'h3):(2'h3)]) < ((wire6 + reg17) ?
              $signed(reg22) : $unsigned(reg16))) : (8'hbe)));
      if ((reg20 ? $signed((~|reg20)) : wire4))
        begin
          reg24 <= reg19[(4'hd):(3'h4)];
          reg25 <= {{$signed($signed((reg13 ? reg17 : (8'ha0)))), wire8},
              $signed(wire0)};
          if ((((!(8'ha6)) ?
                  (((reg14 ? (8'hbe) : (8'hba)) || (reg19 ?
                      wire3 : reg22)) ~^ $unsigned(wire0)) : $unsigned((8'h9f))) ?
              (reg13 - $unsigned($unsigned(reg23[(3'h5):(3'h5)]))) : ((wire8 <= ($unsigned((7'h42)) || {reg24})) ?
                  (({reg12} && ((7'h43) - reg9)) ?
                      (-(~|reg25)) : {$signed(reg9)}) : wire6)))
            begin
              reg26 <= ($signed(reg15[(2'h3):(1'h0)]) ?
                  wire0[(3'h5):(2'h3)] : reg14);
              reg27 <= reg13[(1'h1):(1'h1)];
              reg28 <= {reg21[(2'h2):(1'h0)]};
            end
          else
            begin
              reg26 <= reg17;
              reg27 <= {((^$unsigned((7'h42))) >= {(&$unsigned(reg17))}),
                  (^wire8)};
            end
        end
      else
        begin
          reg24 <= $signed({(8'ha9)});
          if ($unsigned($signed((~|{(wire3 > reg28), $unsigned(reg22)}))))
            begin
              reg25 <= reg12[(4'hf):(4'hd)];
            end
          else
            begin
              reg25 <= wire0;
              reg26 <= (-(((|wire1[(5'h13):(3'h5)]) ?
                      (((8'h9e) <<< reg20) ?
                          {reg12} : (reg28 & (8'hb4))) : {((8'ha3) ~^ wire2),
                          $signed((8'ha9))}) ?
                  $signed((^~(wire0 ?
                      (8'ha2) : reg16))) : wire5[(3'h7):(2'h2)]));
            end
        end
    end
  always
    @(posedge clk) begin
      reg29 <= ($unsigned((reg23[(2'h3):(1'h0)] ?
              reg26 : ($signed(wire7) ?
                  reg13[(3'h5):(1'h0)] : $signed(reg28)))) ?
          (~^$unsigned($unsigned(wire5))) : reg18);
      reg30 <= reg12;
    end
  module31 #() modinst195 (wire194, clk, reg10, reg15, reg27, reg16, wire3);
  assign wire196 = reg27;
  assign wire197 = (wire8 ?
                       reg13 : (~|(((8'haa) + reg12) ?
                           $unsigned($signed((8'hb3))) : ((reg11 ^~ reg16) ?
                               reg23 : $unsigned(wire8)))));
  assign wire198 = {({(~reg14[(1'h0):(1'h0)]),
                           $unsigned(reg22[(1'h1):(1'h0)])} & $unsigned((wire3[(4'h8):(3'h4)] != reg11)))};
  assign wire199 = {$unsigned($signed(($signed((8'h9e)) ?
                           {(8'ha5)} : $signed(reg19)))),
                       wire5};
  assign wire200 = (8'hb2);
  always
    @(posedge clk) begin
      reg201 <= {$unsigned(reg21),
          $unsigned((|((reg27 ? wire199 : reg13) ?
              ((8'ha3) >> (8'hbe)) : {reg18, reg30})))};
      reg202 <= reg17[(3'h7):(2'h3)];
      if (({reg29} ?
          $unsigned({wire3}) : (reg26[(3'h4):(2'h3)] >= (|(~^reg29[(4'h8):(4'h8)])))))
        begin
          if (wire6)
            begin
              reg203 <= $signed((reg26[(2'h2):(2'h2)] >>> {$signed($unsigned(reg24))}));
              reg204 <= {$signed((~(reg19 >> {reg27})))};
              reg205 <= ({(^~((+reg10) && wire5))} && $unsigned(reg30[(3'h5):(3'h4)]));
              reg206 <= {reg28, reg205};
            end
          else
            begin
              reg203 <= $signed((reg12[(3'h5):(2'h2)] ? reg28 : wire1));
              reg204 <= (&$unsigned($unsigned((!(reg26 || (8'hb1))))));
              reg205 <= (wire0[(4'hc):(3'h6)] <= reg204);
              reg206 <= (~^(~|{$signed({reg201, (8'ha1)}),
                  $signed(wire4[(1'h1):(1'h0)])}));
              reg207 <= reg17[(3'h4):(1'h0)];
            end
          reg208 <= reg15;
          reg209 <= wire3;
          if (($unsigned((reg15[(3'h5):(2'h3)] || $signed(((8'hb4) + (8'h9c))))) & $signed((wire200[(1'h1):(1'h0)] > ($signed(reg22) ?
              (reg202 ? wire6 : reg203) : {reg20})))))
            begin
              reg210 <= (wire3[(4'he):(3'h6)] ~^ (~&(($signed(wire7) ?
                  (reg13 ? reg209 : wire198) : {(8'ha4)}) >= (^(~&reg22)))));
            end
          else
            begin
              reg210 <= $unsigned(({((^wire0) ^ (reg29 ? wire4 : wire196)),
                  reg13[(3'h4):(1'h1)]} != ($unsigned((wire197 ?
                  reg204 : reg23)) >>> $unsigned(wire2))));
              reg211 <= $unsigned($signed((reg17 > reg15[(3'h4):(2'h3)])));
              reg212 <= ($unsigned($signed($signed(wire0))) ?
                  reg18 : $signed((({wire2} ?
                          {wire8, reg18} : ((8'hb3) ? wire196 : reg11)) ?
                      reg201[(2'h2):(1'h1)] : (!$signed(reg13)))));
            end
          if (reg10[(1'h0):(1'h0)])
            begin
              reg213 <= ((reg14 ?
                  $signed((((8'hb7) >>> wire200) ?
                      wire197 : (wire194 ?
                          (8'ha7) : (8'hb4)))) : $unsigned(((|reg23) ?
                      $unsigned(reg24) : reg209[(1'h1):(1'h1)]))) || $unsigned((wire8 << wire6[(3'h6):(2'h3)])));
              reg214 <= (^~reg213[(3'h4):(1'h1)]);
              reg215 <= (^~reg22[(1'h0):(1'h0)]);
              reg216 <= (reg209[(4'h8):(1'h0)] == reg204[(4'ha):(3'h6)]);
              reg217 <= (~|{wire198,
                  {$signed((8'h9f)),
                      (((8'haf) ? wire196 : reg11) ?
                          reg211[(1'h0):(1'h0)] : (~(8'haa)))}});
            end
          else
            begin
              reg213 <= $unsigned((reg29[(4'h9):(4'h9)] <<< reg23[(2'h3):(1'h1)]));
              reg214 <= reg201;
            end
        end
      else
        begin
          if ($signed($signed($signed((8'hb2)))))
            begin
              reg203 <= {(|$signed((~^$unsigned(reg16))))};
            end
          else
            begin
              reg203 <= {($unsigned($signed(((7'h43) ?
                      reg30 : reg201))) != $unsigned(($signed(reg24) ^~ $signed(reg206))))};
            end
          reg204 <= reg11[(4'h9):(4'h8)];
        end
    end
  assign wire218 = $signed($signed(wire199));
  assign wire219 = $unsigned((wire1 ?
                       (^~(reg215 ?
                           reg21 : reg27)) : $unsigned($unsigned(((8'hbb) <= (8'hb7))))));
  assign wire220 = (7'h40);
  always
    @(posedge clk) begin
      reg221 <= reg203;
      reg222 <= (((reg213 ? $unsigned($unsigned(wire199)) : reg202) ?
              (&reg15[(1'h1):(1'h1)]) : $signed(($signed((7'h43)) <<< reg206))) ?
          (wire6[(1'h1):(1'h0)] >> $signed(wire7)) : reg22);
      reg223 <= (reg222 >> ($unsigned(((reg15 ? reg17 : reg9) ?
          {(8'hb6)} : ((8'hbc) ^ reg29))) ^~ $unsigned((wire1[(5'h15):(2'h3)] != (~|reg22)))));
      reg224 <= ((-((reg19 ~^ (~^reg17)) ?
          reg205 : reg214[(1'h0):(1'h0)])) ^ (&(((8'ha9) != {reg210}) >= ($signed(reg22) && $signed(wire199)))));
    end
  assign wire225 = (~&$signed($unsigned($signed((reg223 << reg27)))));
endmodule

module module31
#(parameter param192 = ((~((^~(^~(8'hb6))) < {((8'hb5) > (8'hab)), (|(7'h41))})) ? (^~{(((8'hba) == (8'hb4)) ? ((7'h40) ? (8'ha5) : (8'h9d)) : (8'h9e))}) : ((((+(8'haa)) - (-(8'hb5))) ? (((8'ha3) <<< (8'hab)) ? ((8'ha7) > (8'ha5)) : (~&(8'hbc))) : (+((8'haa) ? (8'ha2) : (7'h40)))) | {(!(~|(8'ha6))), {{(8'ha4)}}})), 
parameter param193 = param192)
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire36;
  input wire signed [(2'h3):(1'h0)] wire35;
  input wire signed [(4'hc):(1'h0)] wire34;
  input wire [(4'hb):(1'h0)] wire33;
  input wire signed [(5'h12):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire190;
  wire signed [(4'ha):(1'h0)] wire189;
  wire [(4'hc):(1'h0)] wire188;
  wire signed [(5'h15):(1'h0)] wire73;
  wire [(5'h11):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire78;
  wire [(4'hc):(1'h0)] wire79;
  wire [(4'hf):(1'h0)] wire101;
  wire [(4'hb):(1'h0)] wire104;
  wire [(3'h4):(1'h0)] wire105;
  wire signed [(5'h11):(1'h0)] wire186;
  reg [(5'h12):(1'h0)] reg191 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  assign y = {wire190,
                 wire189,
                 wire188,
                 wire73,
                 wire75,
                 wire76,
                 wire77,
                 wire78,
                 wire79,
                 wire101,
                 wire104,
                 wire105,
                 wire186,
                 reg191,
                 reg103,
                 (1'h0)};
  module37 #() modinst74 (.wire38(wire36), .clk(clk), .wire42(wire32), .wire41(wire33), .y(wire73), .wire39(wire35), .wire40(wire34));
  assign wire75 = wire32[(4'hc):(4'h9)];
  assign wire76 = (^~wire33);
  assign wire77 = {({((!wire33) > $signed(wire32))} ?
                          ((~|(~|wire73)) ?
                              (|{(8'hb0),
                                  wire36}) : $unsigned($signed(wire34))) : wire35[(2'h2):(1'h1)])};
  assign wire78 = wire73[(5'h13):(2'h3)];
  assign wire79 = (-{(^($unsigned(wire76) && (~&wire75)))});
  module80 #() modinst102 (wire101, clk, wire33, wire73, wire35, wire76);
  always
    @(posedge clk) begin
      reg103 <= $unsigned(((~^wire35) + wire79[(4'h9):(3'h6)]));
    end
  assign wire104 = wire77;
  assign wire105 = wire76[(3'h7):(1'h0)];
  module106 #() modinst187 (.wire108(wire33), .clk(clk), .wire109(wire77), .wire107(wire73), .wire110(wire76), .y(wire186), .wire111(wire32));
  assign wire188 = $signed({wire186, $unsigned(wire78)});
  assign wire189 = (wire76[(2'h2):(1'h0)] ? wire186[(3'h6):(3'h5)] : wire104);
  assign wire190 = wire36[(4'ha):(1'h1)];
  always
    @(posedge clk) begin
      reg191 <= ($unsigned((+({wire35} ?
          (wire189 ? wire190 : wire186) : (reg103 ?
              wire186 : (8'hab))))) != wire186[(4'hc):(1'h1)]);
    end
endmodule

module module106
#(parameter param184 = ((8'hb6) && (~(((&(8'hb4)) ? {(8'hb5), (8'h9d)} : (^~(8'h9e))) ? (((8'ha9) - (8'hbd)) ? (8'hb1) : ((8'hb1) ? (7'h41) : (8'ha5))) : ({(8'hbe), (8'hb6)} ? ((8'h9c) ? (8'hab) : (8'haf)) : ((8'hba) != (8'hb9)))))), 
parameter param185 = ((param184 ? (param184 | (^(&param184))) : ((^(param184 >>> param184)) ? (~&(|param184)) : ((param184 ? (8'h9d) : (8'hb9)) < (param184 ? param184 : (8'ha8))))) ? (param184 ? (param184 >= (-(param184 ~^ param184))) : param184) : param184))
(y, clk, wire111, wire110, wire109, wire108, wire107);
  output wire [(32'h323):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire111;
  input wire signed [(4'h9):(1'h0)] wire110;
  input wire signed [(5'h10):(1'h0)] wire109;
  input wire signed [(3'h7):(1'h0)] wire108;
  input wire [(5'h13):(1'h0)] wire107;
  wire signed [(2'h3):(1'h0)] wire183;
  wire [(5'h10):(1'h0)] wire182;
  wire signed [(3'h6):(1'h0)] wire181;
  wire signed [(4'h9):(1'h0)] wire180;
  wire signed [(2'h3):(1'h0)] wire171;
  wire signed [(4'he):(1'h0)] wire170;
  wire signed [(4'h9):(1'h0)] wire169;
  wire [(2'h3):(1'h0)] wire168;
  wire [(5'h11):(1'h0)] wire166;
  wire [(2'h3):(1'h0)] wire128;
  wire [(3'h6):(1'h0)] wire127;
  wire [(3'h5):(1'h0)] wire116;
  wire [(5'h15):(1'h0)] wire115;
  wire [(2'h3):(1'h0)] wire114;
  wire [(4'hf):(1'h0)] wire113;
  wire signed [(3'h6):(1'h0)] wire112;
  reg signed [(5'h13):(1'h0)] reg179 = (1'h0);
  reg [(5'h13):(1'h0)] reg178 = (1'h0);
  reg [(4'he):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg176 = (1'h0);
  reg [(2'h3):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg174 = (1'h0);
  reg [(3'h5):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg167 = (1'h0);
  reg [(4'h8):(1'h0)] reg165 = (1'h0);
  reg [(4'hb):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg163 = (1'h0);
  reg [(5'h13):(1'h0)] reg162 = (1'h0);
  reg signed [(4'he):(1'h0)] reg161 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg159 = (1'h0);
  reg [(5'h13):(1'h0)] reg158 = (1'h0);
  reg [(5'h12):(1'h0)] reg157 = (1'h0);
  reg [(5'h11):(1'h0)] reg156 = (1'h0);
  reg [(3'h7):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg154 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg153 = (1'h0);
  reg [(4'hd):(1'h0)] reg152 = (1'h0);
  reg [(5'h12):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg150 = (1'h0);
  reg [(5'h11):(1'h0)] reg149 = (1'h0);
  reg [(4'hb):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg147 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg146 = (1'h0);
  reg [(2'h3):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg140 = (1'h0);
  reg [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(4'hd):(1'h0)] reg138 = (1'h0);
  reg signed [(4'he):(1'h0)] reg137 = (1'h0);
  reg signed [(4'he):(1'h0)] reg136 = (1'h0);
  reg signed [(4'he):(1'h0)] reg135 = (1'h0);
  reg [(5'h13):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg131 = (1'h0);
  reg [(5'h13):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg126 = (1'h0);
  reg [(4'ha):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg124 = (1'h0);
  reg [(5'h12):(1'h0)] reg123 = (1'h0);
  reg [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg121 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg120 = (1'h0);
  reg [(4'he):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg118 = (1'h0);
  reg [(2'h3):(1'h0)] reg117 = (1'h0);
  assign y = {wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire166,
                 wire128,
                 wire127,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg167,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
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
                 reg130,
                 reg129,
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
                 (1'h0)};
  assign wire112 = (|$unsigned((~^{{wire110, wire108}})));
  assign wire113 = (+$signed(((^(^~wire109)) ?
                       ((&wire110) ?
                           (!wire107) : (wire110 == wire107)) : $unsigned((8'hae)))));
  assign wire114 = wire112;
  assign wire115 = ($unsigned(wire114[(1'h0):(1'h0)]) || wire112[(2'h3):(2'h3)]);
  assign wire116 = ($signed(($unsigned($signed((7'h41))) ?
                           (wire108 >>> (8'h9f)) : wire114)) ?
                       ($unsigned((wire109[(2'h3):(2'h3)] > (~^wire115))) || $signed((^~wire113))) : ($unsigned({wire108,
                               (wire110 != wire111)}) ?
                           $signed($unsigned((wire111 ?
                               (8'hbc) : wire110))) : wire109));
  always
    @(posedge clk) begin
      reg117 <= ((+(wire109[(4'hc):(4'hb)] ?
              ((~^wire110) ?
                  (wire114 ?
                      wire111 : (8'h9e)) : {wire112}) : {$signed(wire115)})) ?
          $unsigned({wire108[(2'h3):(1'h1)],
              $unsigned((wire109 + wire110))}) : wire112);
      reg118 <= (wire108 ?
          (wire112[(1'h1):(1'h0)] > wire108) : $unsigned($signed($signed($unsigned(wire111)))));
    end
  always
    @(posedge clk) begin
      if (wire116[(1'h0):(1'h0)])
        begin
          reg119 <= $signed(($signed($signed((8'hb0))) ?
              ((-wire110) & (&$signed(wire113))) : ($signed((8'ha8)) | $unsigned($unsigned(reg118)))));
          reg120 <= ($unsigned((reg118[(3'h4):(3'h4)] <= $unsigned((wire108 >> wire110)))) ?
              reg119 : (^~wire113));
          if (wire111)
            begin
              reg121 <= $unsigned($unsigned($signed($signed((~^reg119)))));
              reg122 <= (~^($unsigned(((-wire107) ^~ (reg120 + reg117))) ?
                  $unsigned((&wire110[(2'h2):(1'h1)])) : $unsigned(($signed(reg119) ~^ {wire116,
                      (7'h40)}))));
              reg123 <= reg121[(3'h5):(3'h4)];
              reg124 <= (+wire111);
              reg125 <= $signed({(!$unsigned((|wire114))),
                  reg122[(3'h4):(2'h3)]});
            end
          else
            begin
              reg121 <= ({$signed({(wire108 ? reg123 : reg124),
                          $unsigned(reg119)})} ?
                  $signed($unsigned($unsigned($unsigned(wire115)))) : ($signed(((^~wire109) ?
                          (reg122 ? reg119 : reg117) : $unsigned(wire108))) ?
                      $unsigned(($unsigned(wire108) == (+wire111))) : reg120[(1'h1):(1'h0)]));
              reg122 <= $signed($unsigned($unsigned(reg123[(3'h6):(3'h6)])));
            end
        end
      else
        begin
          reg119 <= wire110;
          reg120 <= $signed($signed((wire110 ?
              {wire109, (wire110 - reg124)} : ($unsigned(wire115) ?
                  ((8'ha0) - reg117) : $unsigned(wire111)))));
          reg121 <= reg120;
          reg122 <= (reg122[(4'hb):(4'h8)] ?
              $unsigned(wire112) : (!(~|($signed(reg122) ?
                  wire108[(1'h0):(1'h0)] : (wire115 ? (8'hbd) : wire108)))));
        end
      reg126 <= $unsigned(reg120);
    end
  assign wire127 = reg117;
  assign wire128 = ($unsigned((8'hae)) || reg120);
  always
    @(posedge clk) begin
      reg129 <= wire107;
      if ((^~(~|reg126[(3'h7):(1'h0)])))
        begin
          reg130 <= reg117[(2'h2):(1'h1)];
          reg131 <= (wire127[(2'h2):(1'h0)] != $unsigned(reg117));
          reg132 <= (8'hab);
        end
      else
        begin
          if (reg126[(3'h4):(1'h0)])
            begin
              reg130 <= (wire112 ^ ((8'had) | $unsigned(reg118)));
              reg131 <= (~|$signed((wire113[(3'h6):(3'h5)] ?
                  (|(reg119 ? wire110 : reg129)) : (reg132[(1'h0):(1'h0)] ?
                      ((8'hba) ^~ reg118) : (-(8'ha1))))));
              reg132 <= reg132;
              reg133 <= ((reg131 <<< (8'ha8)) ?
                  reg120[(4'ha):(2'h2)] : $signed((reg129 ~^ (8'ha7))));
              reg134 <= $unsigned(((((reg123 ^ wire107) ?
                      (wire110 ? (7'h41) : reg133) : $unsigned(wire107)) ?
                  (8'hb8) : wire114[(1'h0):(1'h0)]) && reg132));
            end
          else
            begin
              reg130 <= (~^(~|(({reg120,
                  wire111} || wire127[(2'h3):(1'h1)]) ~^ reg126)));
              reg131 <= wire107[(2'h2):(1'h1)];
              reg132 <= reg126;
              reg133 <= (reg133 && (($unsigned({wire108}) ?
                  $unsigned(((8'hae) ^ wire107)) : $signed((^~reg133))) * $signed(reg131[(1'h0):(1'h0)])));
            end
          reg135 <= $signed(({reg118} ?
              (((reg132 | reg121) - $unsigned(reg126)) ?
                  reg121[(3'h7):(3'h7)] : reg120[(4'ha):(1'h0)]) : wire114));
          reg136 <= wire116;
        end
      if (reg121[(3'h4):(1'h0)])
        begin
          reg137 <= {{$unsigned($unsigned((wire127 && (8'ha6)))),
                  (reg135[(4'h8):(3'h5)] ~^ (|(reg121 ? wire107 : wire114)))}};
          reg138 <= {((~^(8'hbe)) == ((!reg121[(3'h4):(1'h0)]) && (~&reg120))),
              $unsigned(reg126[(3'h5):(2'h3)])};
        end
      else
        begin
          if ((reg133 ?
              (&wire112[(1'h0):(1'h0)]) : $unsigned(reg124[(4'ha):(4'ha)])))
            begin
              reg137 <= (^~reg133[(2'h2):(1'h0)]);
              reg138 <= (&(~&((~&$unsigned(reg129)) < reg138[(4'hd):(4'hb)])));
              reg139 <= {wire108,
                  $signed($unsigned(($unsigned(wire107) ?
                      (-reg120) : (reg120 ? (8'ha3) : reg132))))};
            end
          else
            begin
              reg137 <= reg135[(4'hd):(2'h3)];
              reg138 <= wire107;
              reg139 <= reg135[(1'h0):(1'h0)];
              reg140 <= wire113[(3'h4):(2'h2)];
            end
          reg141 <= (~$signed(wire109));
          reg142 <= ($signed((wire107 + ($unsigned(reg123) ?
              {reg121, wire114} : (~^reg135)))) | $signed(reg130));
        end
    end
  always
    @(posedge clk) begin
      if (reg122)
        begin
          reg143 <= reg140[(4'hf):(2'h3)];
          reg144 <= (8'hb7);
          reg145 <= $unsigned($unsigned(reg130[(4'hc):(4'h9)]));
          reg146 <= ($signed(((wire110 ?
              reg120[(4'h9):(3'h4)] : (wire107 >= reg136)) + {(~wire111),
              reg137[(4'ha):(4'h8)]})) << (~&($unsigned((reg123 ?
                  reg119 : (7'h42))) ?
              $unsigned(reg144[(1'h1):(1'h1)]) : $unsigned((~|reg132)))));
          reg147 <= $signed($signed((($unsigned(wire107) ?
              (^reg142) : reg131[(2'h3):(1'h0)]) ~^ {$unsigned(reg123)})));
        end
      else
        begin
          if ({$signed($unsigned(wire112)), (8'hac)})
            begin
              reg143 <= $unsigned(reg122[(4'he):(4'hc)]);
            end
          else
            begin
              reg143 <= wire108[(3'h6):(2'h2)];
              reg144 <= reg138[(4'hd):(2'h3)];
              reg145 <= reg134;
              reg146 <= $unsigned((($unsigned((reg136 ? (8'ha2) : (8'h9c))) ?
                  ({wire116} ?
                      (reg133 ? reg134 : wire110) : (wire113 ?
                          reg129 : reg129)) : (^~$signed((8'ha8)))) + $unsigned((((8'h9f) ?
                      (8'haa) : wire128) ?
                  (8'hb9) : (-reg147)))));
              reg147 <= $unsigned($signed((8'hbf)));
            end
          reg148 <= (8'hb9);
          reg149 <= $signed(({$unsigned(reg124[(4'h9):(1'h1)]),
              $unsigned(wire116)} <<< reg120[(3'h4):(1'h1)]));
          reg150 <= (~wire128[(1'h0):(1'h0)]);
          reg151 <= $unsigned($unsigned(reg137));
        end
      reg152 <= {reg130,
          (reg118 & ((~(~|reg126)) ?
              ((reg122 ^~ wire111) ?
                  $signed(reg123) : {wire107,
                      reg139}) : $unsigned((reg141 > reg135))))};
    end
  always
    @(posedge clk) begin
      reg153 <= reg145[(2'h3):(2'h2)];
      reg154 <= $signed(reg148);
      reg155 <= $unsigned($unsigned(({reg119[(4'hb):(2'h2)],
              reg126[(3'h6):(1'h1)]} ?
          (reg149[(2'h3):(2'h2)] > $unsigned(wire111)) : {(^~reg126)})));
      if ($unsigned({((reg121 ? ((8'hae) <<< reg124) : reg118) ?
              ((reg140 >>> reg129) ?
                  (reg148 ? reg120 : wire110) : $unsigned(reg122)) : wire108),
          {$unsigned((~&reg119))}}))
        begin
          reg156 <= (reg133[(1'h1):(1'h1)] ?
              reg138[(1'h0):(1'h0)] : reg149[(5'h11):(5'h11)]);
          if ({$signed((~$unsigned($unsigned(reg154))))})
            begin
              reg157 <= $unsigned(reg137[(3'h7):(1'h0)]);
              reg158 <= {(reg153[(4'h9):(1'h1)] + (reg137 + (^((8'hb8) ?
                      wire109 : reg136)))),
                  (reg145[(2'h3):(1'h1)] ?
                      $unsigned((-(8'h9d))) : ((&(!wire128)) ?
                          (^wire116) : wire109[(5'h10):(1'h0)]))};
              reg159 <= reg134;
              reg160 <= ((~&$unsigned((~|wire108[(1'h1):(1'h1)]))) ?
                  reg154[(5'h15):(4'hd)] : reg135[(4'hb):(4'h8)]);
              reg161 <= reg124[(2'h3):(1'h0)];
            end
          else
            begin
              reg157 <= (^~$signed((reg154 | ($unsigned(reg149) ?
                  (wire115 ? reg142 : wire114) : {wire116, (8'h9f)}))));
              reg158 <= $signed($unsigned(wire113));
              reg159 <= (wire107 ?
                  (-(wire116 < (((8'hbc) ? reg145 : wire113) ?
                      (wire108 ? reg156 : reg146) : (reg159 ?
                          reg130 : wire108)))) : wire114);
              reg160 <= $unsigned({(wire109[(1'h0):(1'h0)] + (+(reg136 ~^ reg138)))});
              reg161 <= reg148;
            end
          if ($signed({reg121}))
            begin
              reg162 <= ({({(reg137 <<< reg148), (+(8'hbb))} - ((reg151 ?
                          reg160 : wire128) ^ $signed(reg155))),
                      (^{reg120})} ?
                  wire116[(3'h4):(2'h3)] : $signed(($signed($unsigned(reg149)) ?
                      $unsigned($unsigned(wire111)) : ((wire108 >= reg143) ?
                          reg149 : reg124[(4'ha):(2'h3)]))));
            end
          else
            begin
              reg162 <= $unsigned((^~reg159[(1'h1):(1'h1)]));
              reg163 <= $signed($unsigned($signed(wire127[(2'h3):(2'h3)])));
              reg164 <= reg146[(1'h0):(1'h0)];
              reg165 <= (({((reg153 ? wire108 : reg118) ?
                          $signed(reg163) : ((8'hbe) & (8'ha5)))} ?
                  (|$unsigned((reg135 || reg160))) : $signed((^~(wire116 - wire107)))) <<< $signed((~&((wire114 >= wire115) ~^ (reg120 ?
                  reg160 : (8'hb2))))));
            end
        end
      else
        begin
          reg156 <= reg165[(1'h1):(1'h1)];
        end
    end
  assign wire166 = (reg117[(2'h3):(2'h3)] >>> (8'hb0));
  always
    @(posedge clk) begin
      reg167 <= $signed($unsigned($unsigned($unsigned((reg146 <= reg146)))));
    end
  assign wire168 = (~(|wire110[(3'h5):(3'h4)]));
  assign wire169 = reg153;
  assign wire170 = {($signed($unsigned((reg122 ?
                           reg120 : reg161))) <= reg148[(4'h9):(3'h7)])};
  assign wire171 = reg119[(4'ha):(1'h1)];
  always
    @(posedge clk) begin
      if ((({{$signed(reg130)}, $signed({reg121, reg133})} ?
              reg122[(5'h10):(1'h1)] : ($unsigned((reg117 ?
                  wire112 : reg133)) || (~|(reg153 >> reg150)))) ?
          {($signed($signed(wire112)) ? (|(^reg159)) : (+(reg152 + (8'ha3)))),
              $signed(reg118[(1'h1):(1'h0)])} : reg134[(4'he):(1'h0)]))
        begin
          if (wire166[(1'h0):(1'h0)])
            begin
              reg172 <= (^~$signed($signed(wire128[(1'h1):(1'h1)])));
            end
          else
            begin
              reg172 <= $unsigned((($unsigned($signed(reg132)) ~^ $unsigned($unsigned(reg120))) >> reg148));
              reg173 <= reg165[(3'h5):(3'h5)];
              reg174 <= reg152;
              reg175 <= $unsigned((((reg117 ?
                          {(8'ha7), reg142} : $unsigned(wire112)) ?
                      $signed((reg167 > reg157)) : (reg130 >= (+(8'hb7)))) ?
                  ((reg138[(4'hd):(3'h5)] >= ((8'hbb) != wire128)) ?
                      reg117[(2'h3):(2'h3)] : (-(reg135 | reg126))) : $unsigned(wire168)));
            end
          reg176 <= (~|((($signed(wire115) <<< $unsigned(reg143)) <= wire109) > $unsigned(reg149[(4'he):(4'hb)])));
          reg177 <= reg164[(2'h2):(1'h0)];
        end
      else
        begin
          if ((reg134[(5'h12):(1'h1)] || (!wire114[(2'h2):(2'h2)])))
            begin
              reg172 <= ({(((^~reg176) ?
                      reg165 : $signed(reg174)) >= ((^~(8'hbe)) ~^ reg146)),
                  ($unsigned($signed((8'hbe))) >= ({reg150, wire128} ?
                      (reg152 ^ wire169) : reg143[(1'h0):(1'h0)]))} * $unsigned((~|(reg164 ?
                  (reg147 ? reg160 : reg175) : reg162))));
            end
          else
            begin
              reg172 <= {({$unsigned($unsigned((7'h40)))} & {(7'h40)})};
              reg173 <= wire114;
            end
          if (((((~reg160[(1'h0):(1'h0)]) ?
              reg130[(3'h4):(3'h4)] : wire110) >>> ((reg136 ?
                  $signed(reg149) : reg157) ?
              reg177 : {(-wire113)})) + $unsigned(wire170[(4'ha):(4'ha)])))
            begin
              reg174 <= {((reg129[(3'h5):(3'h5)] ?
                          $unsigned((8'ha0)) : $signed(reg161)) ?
                      reg172[(2'h3):(1'h1)] : $unsigned($signed(reg157)))};
              reg175 <= {$unsigned(reg152[(4'hd):(2'h3)])};
              reg176 <= ((($signed($signed(wire171)) != $unsigned($signed((8'h9e)))) ?
                  (reg119[(4'he):(4'hb)] >> ((^wire107) ?
                      reg132 : $signed(reg125))) : (|$signed((reg176 * reg120)))) >>> reg152[(3'h7):(1'h0)]);
              reg177 <= ({wire166[(4'he):(4'h8)]} ?
                  $unsigned({$signed($signed(reg140))}) : (~|(|((&wire115) <<< reg133[(2'h2):(1'h0)]))));
            end
          else
            begin
              reg174 <= reg132;
              reg175 <= ((~|$unsigned(((~|(7'h41)) >= (+reg125)))) ?
                  wire128[(1'h0):(1'h0)] : {($signed((~reg141)) == (reg159 & reg126[(3'h5):(3'h4)]))});
            end
          reg178 <= (-(reg159 ^~ $unsigned((&((8'ha9) ? reg155 : reg134)))));
          reg179 <= wire113;
        end
    end
  assign wire180 = ($signed({reg121}) >> {(wire168 <<< ($signed((8'hb7)) <= reg141))});
  assign wire181 = reg130[(5'h10):(3'h5)];
  assign wire182 = reg161[(3'h7):(3'h5)];
  assign wire183 = $unsigned(reg137);
endmodule

module module80
#(parameter param100 = (!((~(^((8'hbf) + (8'ha9)))) ? ((((8'ha5) ? (7'h44) : (8'hbb)) ? ((7'h43) <<< (8'haf)) : ((8'hae) ? (8'hbb) : (8'hba))) ? ((8'hb7) >= ((8'hb0) ? (7'h44) : (8'h9e))) : ({(8'ha4), (8'haa)} ? ((8'hb1) <= (8'had)) : (^~(8'had)))) : (!(((8'ha5) ? (8'ha8) : (8'hab)) ? (8'hb6) : {(8'ha1), (8'hb8)})))))
(y, clk, wire84, wire83, wire82, wire81);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire84;
  input wire [(4'hb):(1'h0)] wire83;
  input wire [(2'h3):(1'h0)] wire82;
  input wire [(3'h7):(1'h0)] wire81;
  wire [(2'h3):(1'h0)] wire99;
  wire signed [(2'h2):(1'h0)] wire94;
  wire signed [(3'h4):(1'h0)] wire93;
  wire [(3'h4):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire91;
  wire signed [(3'h4):(1'h0)] wire90;
  wire signed [(3'h7):(1'h0)] wire89;
  wire signed [(4'h9):(1'h0)] wire88;
  wire signed [(4'hf):(1'h0)] wire87;
  wire signed [(4'hf):(1'h0)] wire86;
  wire [(4'h8):(1'h0)] wire85;
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  assign y = {wire99,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 (1'h0)};
  assign wire85 = wire84[(4'h8):(4'h8)];
  assign wire86 = wire84;
  assign wire87 = wire84[(4'hb):(2'h3)];
  assign wire88 = (~wire82[(2'h2):(1'h1)]);
  assign wire89 = (8'hb8);
  assign wire90 = $signed(wire82[(2'h3):(2'h3)]);
  assign wire91 = wire88;
  assign wire92 = wire87;
  assign wire93 = wire87[(2'h3):(1'h0)];
  assign wire94 = {{(~$signed($unsigned(wire91))), wire83[(2'h3):(1'h1)]},
                      wire81[(3'h6):(2'h3)]};
  always
    @(posedge clk) begin
      reg95 <= {(wire94 ?
              (-$signed($unsigned(wire87))) : $signed($unsigned($unsigned(wire86))))};
      reg96 <= (wire85 || $signed((8'hab)));
      reg97 <= wire81;
      reg98 <= ((|((wire82 >> wire84[(2'h3):(2'h2)]) ?
          $signed(((8'hbd) ?
              wire92 : (8'h9c))) : reg97[(3'h4):(3'h4)])) <= (($unsigned(wire91) ?
          ((|wire92) ?
              $signed(reg96) : (wire89 <= wire87)) : (-$signed(wire92))) & (-$unsigned($signed(wire81)))));
    end
  assign wire99 = $signed($unsigned(wire86));
endmodule

module module37
#(parameter param72 = (((8'hb6) ? ((((8'ha9) ^ (8'hb8)) ? ((8'hb8) ? (8'ha7) : (8'ha2)) : ((8'ha5) ? (7'h41) : (8'h9d))) ? {((8'ha0) ? (8'h9d) : (8'hba))} : (((8'h9f) > (8'h9c)) == ((7'h43) ? (8'hae) : (8'hb9)))) : ({(!(7'h43)), (^~(7'h42))} ? (((8'hbb) < (8'hb8)) ? (8'ha1) : ((8'hb9) ? (8'hbd) : (8'ha0))) : ((-(7'h42)) ^~ ((8'hb2) ? (8'hbf) : (8'h9f))))) <= ({({(8'hb8)} >= ((8'hb7) ? (8'hb7) : (8'hb7))), {(^~(8'hb3))}} ? {(((8'h9e) || (8'hb4)) ? (8'ha9) : ((8'h9c) ? (7'h41) : (8'ha0))), (((8'ha4) ~^ (8'haf)) >> ((8'hb4) ? (7'h44) : (8'ha8)))} : (8'haf))))
(y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire42;
  input wire [(4'h8):(1'h0)] wire41;
  input wire [(4'hc):(1'h0)] wire40;
  input wire signed [(2'h3):(1'h0)] wire39;
  input wire signed [(5'h11):(1'h0)] wire38;
  wire signed [(5'h14):(1'h0)] wire65;
  wire signed [(2'h2):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire43;
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  assign y = {wire65,
                 wire59,
                 wire58,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
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
                 (1'h0)};
  assign wire43 = $signed(wire42[(4'ha):(3'h4)]);
  assign wire44 = wire40;
  assign wire45 = {{(~|wire43)}, wire39};
  assign wire46 = $signed(wire40[(4'hb):(2'h2)]);
  always
    @(posedge clk) begin
      reg47 <= {(8'ha4)};
      if ({(!(+$unsigned($unsigned(wire42)))), wire46[(1'h1):(1'h0)]})
        begin
          reg48 <= wire43[(5'h15):(2'h2)];
          if ((!(&(~&wire43))))
            begin
              reg49 <= $unsigned(wire40);
              reg50 <= wire45;
              reg51 <= (wire38 << $signed(wire46));
            end
          else
            begin
              reg49 <= (!reg49);
            end
          reg52 <= (~&$signed((|reg47)));
          reg53 <= ((reg50[(4'h9):(2'h2)] >>> $unsigned($unsigned({reg48,
              reg52}))) * (wire44 ?
              (((7'h41) | $unsigned(wire41)) ?
                  ((reg50 ? wire45 : wire40) ?
                      (wire43 ? (8'hba) : reg47) : (wire41 ?
                          wire45 : wire42)) : {reg50}) : (~wire46)));
          if (reg48)
            begin
              reg54 <= reg49[(3'h7):(1'h1)];
              reg55 <= reg54;
              reg56 <= ($unsigned(((&(wire46 * wire38)) - (!(wire40 + (8'hab))))) ^~ reg50);
            end
          else
            begin
              reg54 <= ($unsigned(wire42) | ((~$signed({reg55,
                  wire38})) >> reg49[(5'h11):(4'h8)]));
            end
        end
      else
        begin
          reg48 <= reg54[(2'h3):(2'h2)];
          reg49 <= (-(($unsigned((reg54 + wire41)) ~^ wire40) >> {$signed((^(8'hbf)))}));
          reg50 <= (((~|(~&reg51)) ?
                  (~^{{reg53}, reg54[(2'h3):(2'h3)]}) : (&(~&$signed(reg56)))) ?
              (^~reg49[(1'h1):(1'h1)]) : reg48);
          reg51 <= (reg48[(4'ha):(2'h3)] ?
              $signed($signed((8'hbc))) : $unsigned(($signed((reg53 ?
                  reg51 : reg52)) & ((~|reg49) ?
                  $signed((8'ha4)) : (wire41 ? reg51 : wire41)))));
        end
      reg57 <= {$signed(reg49), wire44[(2'h2):(1'h1)]};
    end
  assign wire58 = ((~^$signed(reg50)) ?
                      (wire38[(1'h0):(1'h0)] <<< wire46) : reg55[(3'h6):(2'h2)]);
  assign wire59 = (~&$signed($signed(({reg47} ?
                      (!wire46) : reg56[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      if (((!wire44) >>> (!$signed(wire38))))
        begin
          reg60 <= {(reg51[(4'he):(2'h3)] ^ (wire42 ?
                  {$unsigned(reg53)} : $unsigned({wire41, (8'h9c)})))};
        end
      else
        begin
          if (reg60)
            begin
              reg60 <= $unsigned(((-(~|(reg60 ? reg52 : wire40))) ?
                  reg53[(3'h5):(3'h4)] : (+$unsigned((wire58 ?
                      (8'ha4) : wire39)))));
              reg61 <= $signed(wire45);
              reg62 <= reg52[(4'h8):(1'h1)];
              reg63 <= (-($signed({$signed(wire42), $unsigned(wire40)}) ?
                  (((~&wire40) >>> (wire40 < reg52)) ?
                      wire38[(3'h4):(3'h4)] : ((&(8'hb4)) > wire44[(2'h2):(1'h1)])) : {($unsigned((8'h9f)) ?
                          (reg61 ? reg61 : wire59) : wire58[(1'h0):(1'h0)])}));
            end
          else
            begin
              reg60 <= ($signed({$unsigned($signed(wire46)),
                  $unsigned((reg61 ? reg50 : (7'h43)))}) >>> wire39);
              reg61 <= $signed($signed((($unsigned(reg56) ?
                  reg57 : (^reg51)) >>> wire38)));
            end
          reg64 <= ((+(reg54 > reg53[(3'h6):(3'h4)])) || (($unsigned(wire44) == $unsigned(reg54)) ?
              (+((-reg61) ?
                  (reg52 && reg50) : {reg48})) : $unsigned(wire41[(2'h2):(1'h0)])));
        end
    end
  assign wire65 = (({$unsigned(reg56), reg64[(1'h0):(1'h0)]} ?
                      (+(~^$signed(wire42))) : $signed($signed((reg54 <= wire38)))) < $signed(((~^wire43) ?
                      $unsigned((reg64 | reg50)) : ((wire59 != reg61) >= (reg56 < reg64)))));
  always
    @(posedge clk) begin
      reg66 <= (((|$signed((reg57 ^ reg54))) | ($signed(((8'hac) == reg61)) ?
          (-$signed(reg53)) : {wire58})) >>> $unsigned(((|(!wire41)) || wire41[(3'h5):(1'h0)])));
      if ($signed(($signed($unsigned(wire58)) ?
          (~^(~&$unsigned((8'hb5)))) : (^$unsigned((^~reg54))))))
        begin
          reg67 <= (|$signed($signed($signed(wire58[(3'h4):(3'h4)]))));
          reg68 <= ({$signed((reg51 > (~&reg52))),
              $unsigned($unsigned(wire40))} | $unsigned($signed(((~reg56) & $unsigned(reg62)))));
        end
      else
        begin
          reg67 <= {$unsigned(($unsigned((reg52 ^~ reg62)) ?
                  wire45[(2'h2):(1'h1)] : $unsigned({wire38})))};
          reg68 <= wire44;
        end
      reg69 <= wire45[(4'hb):(1'h0)];
      reg70 <= (~^(^(~$unsigned($unsigned(reg67)))));
      reg71 <= (8'hbc);
    end
endmodule
