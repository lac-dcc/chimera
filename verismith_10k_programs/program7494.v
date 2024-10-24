module top
#(parameter param179 = ({(-{{(8'had), (7'h43)}, ((8'haa) ? (8'h9d) : (8'ha3))}), (+(~((8'ha5) ? (8'ha7) : (8'hb5))))} < (^~(({(8'hb1)} ^ ((7'h40) | (8'ha4))) ? (~&(~|(8'ha8))) : ((~^(8'haa)) > (-(8'ha3)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire178;
  wire signed [(3'h4):(1'h0)] wire35;
  wire signed [(5'h10):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire49;
  wire [(2'h2):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire176;
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  assign y = {wire178,
                 wire35,
                 wire4,
                 wire37,
                 wire49,
                 wire50,
                 wire176,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 (1'h0)};
  assign wire4 = (^~(~^$signed((~&$unsigned(wire0)))));
  module5 #() modinst36 (wire35, clk, wire0, wire4, wire2, wire1, wire3);
  assign wire37 = (~|$unsigned(($unsigned($signed(wire1)) && ((+(7'h44)) < ((8'hb8) ?
                      wire0 : wire3)))));
  always
    @(posedge clk) begin
      reg38 <= (~^$signed(wire37));
      if ({wire4})
        begin
          if (((({(wire37 == wire2),
                      {wire1}} || $signed(wire35[(2'h3):(2'h3)])) ?
                  ({$signed(wire37), (wire1 == wire35)} ?
                      ($signed((8'ha4)) ?
                          $signed(wire1) : (wire37 ?
                              wire2 : (8'ha5))) : wire3[(3'h7):(2'h2)]) : (wire0[(1'h1):(1'h1)] ?
                      wire4 : (~^reg38))) ?
              $unsigned($unsigned(wire1)) : wire0))
            begin
              reg39 <= wire35[(2'h3):(2'h3)];
              reg40 <= $unsigned($unsigned(((~&$unsigned(wire37)) ^ $unsigned(wire35))));
              reg41 <= $signed((($unsigned((wire37 && (8'ha7))) ?
                      $signed($signed(wire2)) : $signed($signed(wire37))) ?
                  wire35 : {wire35, wire2[(2'h3):(2'h3)]}));
            end
          else
            begin
              reg39 <= wire1[(3'h7):(1'h1)];
              reg40 <= ((reg38 ?
                  (~^$unsigned((~&(7'h42)))) : (8'h9d)) & $unsigned($unsigned({reg40,
                  $signed((8'hb8))})));
            end
          reg42 <= reg41[(2'h2):(2'h2)];
          reg43 <= (+((((reg42 ?
              reg42 : (8'hb7)) >> wire37) < $signed((&reg41))) == reg39[(2'h3):(1'h1)]));
        end
      else
        begin
          if ($signed({reg40[(2'h3):(1'h0)]}))
            begin
              reg39 <= ($signed(wire3[(2'h3):(2'h2)]) ^ $unsigned(reg41[(2'h3):(2'h2)]));
              reg40 <= $unsigned(((($signed(wire3) ?
                      (reg41 | wire1) : (wire2 ~^ (7'h43))) + $signed((reg43 <= wire3))) ?
                  (&reg43[(2'h2):(2'h2)]) : $unsigned($unsigned((|(8'ha3))))));
            end
          else
            begin
              reg39 <= wire35;
            end
          if ((((reg39[(4'h9):(3'h5)] ?
              $unsigned($signed((8'hae))) : (-$unsigned(reg42))) | (({wire37} >= (~^(8'hb3))) < $signed(reg39))) << $signed($signed(($signed(reg41) ?
              wire1 : (-reg41))))))
            begin
              reg41 <= (((wire3 ?
                      ((reg38 ? (8'ha4) : (8'hb3)) ?
                          ((8'ha6) >= wire3) : reg43[(3'h4):(3'h4)]) : (wire1 | $signed(reg38))) ~^ {($unsigned(reg38) ?
                          $signed(wire4) : (wire3 | (8'hb4)))}) ?
                  reg39 : wire1[(3'h6):(3'h5)]);
              reg42 <= (~^((8'hb3) | (^$unsigned($signed(wire4)))));
              reg43 <= ((~|(reg39 ?
                      (~|$signed(wire4)) : $unsigned({wire35, wire35}))) ?
                  ($unsigned(($signed((8'hb0)) ^~ wire2[(1'h0):(1'h0)])) >>> (wire0[(2'h3):(1'h1)] ?
                      $signed((8'hb7)) : (~|(~reg43)))) : wire1);
              reg44 <= wire37[(3'h5):(2'h2)];
              reg45 <= reg40;
            end
          else
            begin
              reg41 <= (reg42 ? wire3[(5'h11):(4'he)] : reg41);
              reg42 <= reg39[(4'hc):(1'h0)];
            end
          reg46 <= {(wire1 != $signed(((~&wire2) & (wire3 ? reg42 : reg42))))};
          reg47 <= (reg41[(3'h4):(1'h1)] ?
              ($unsigned($signed($unsigned(reg44))) == (~&(7'h43))) : $unsigned({wire0}));
        end
      reg48 <= ($signed($unsigned(wire2[(3'h5):(3'h5)])) ?
          {$unsigned((reg39[(2'h3):(2'h2)] ?
                  (reg42 <= wire1) : (reg41 ?
                      (8'ha2) : (8'hb3))))} : {($unsigned(wire2[(3'h5):(3'h5)]) + {(reg46 >>> wire4),
                  $unsigned(wire4)})});
    end
  assign wire49 = $unsigned((reg42[(2'h2):(1'h1)] != wire2[(2'h3):(1'h1)]));
  assign wire50 = $unsigned((~|(wire4[(4'h9):(1'h0)] ?
                      $signed((8'haa)) : wire0)));
  module51 #() modinst177 (.clk(clk), .wire53(reg38), .wire55(wire37), .wire52(wire3), .wire54(wire2), .y(wire176));
  assign wire178 = $signed($signed(((&reg44) ?
                       (wire4[(4'hb):(3'h6)] ?
                           wire4 : $signed(reg47)) : (8'haf))));
endmodule

module module51  (y, clk, wire52, wire53, wire54, wire55);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire52;
  input wire [(4'hf):(1'h0)] wire53;
  input wire signed [(5'h14):(1'h0)] wire54;
  input wire [(4'hb):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire175;
  wire signed [(4'hc):(1'h0)] wire174;
  wire signed [(3'h4):(1'h0)] wire173;
  wire [(4'hd):(1'h0)] wire172;
  wire signed [(4'hd):(1'h0)] wire171;
  wire [(2'h3):(1'h0)] wire170;
  wire [(4'hc):(1'h0)] wire168;
  wire signed [(5'h10):(1'h0)] wire128;
  wire [(5'h10):(1'h0)] wire95;
  wire signed [(3'h7):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire60;
  wire [(5'h10):(1'h0)] wire61;
  wire signed [(2'h3):(1'h0)] wire93;
  wire signed [(4'he):(1'h0)] wire130;
  wire [(5'h12):(1'h0)] wire131;
  wire [(5'h14):(1'h0)] wire132;
  wire signed [(5'h12):(1'h0)] wire133;
  wire signed [(5'h13):(1'h0)] wire166;
  reg [(3'h6):(1'h0)] reg169 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire168,
                 wire128,
                 wire95,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire60,
                 wire61,
                 wire93,
                 wire130,
                 wire131,
                 wire132,
                 wire133,
                 wire166,
                 reg169,
                 (1'h0)};
  assign wire56 = $signed((+(&(&wire53))));
  assign wire57 = (((+$signed($signed((8'hac)))) ?
                          $unsigned((!(wire53 ? (8'hb4) : wire53))) : (wire53 ?
                              $signed(wire54[(3'h6):(1'h0)]) : (~^$unsigned(wire54)))) ?
                      $unsigned((wire55 > ($signed(wire54) * (wire54 ?
                          wire54 : wire54)))) : wire53);
  assign wire58 = wire52;
  assign wire59 = ((~&($unsigned($unsigned(wire57)) == (&(wire54 ?
                          wire53 : wire54)))) ?
                      {wire56[(3'h4):(2'h3)],
                          (wire53[(3'h7):(3'h5)] ?
                              {$signed(wire56),
                                  ((8'ha3) ? wire56 : (8'hbf))} : ((&wire55) ?
                                  $unsigned(wire54) : $signed(wire58)))} : $unsigned($signed((((8'h9e) ?
                          wire55 : (8'ha7)) * $unsigned((7'h44))))));
  assign wire60 = {$unsigned({wire58, wire58[(2'h2):(2'h2)]})};
  assign wire61 = wire57[(2'h3):(1'h0)];
  module62 #() modinst94 (wire93, clk, wire54, wire53, wire57, wire55, wire56);
  assign wire95 = wire56;
  module96 #() modinst129 (.wire98(wire52), .y(wire128), .wire99(wire59), .wire101(wire95), .wire97(wire61), .wire100(wire54), .clk(clk));
  assign wire130 = ((^$unsigned($signed($unsigned(wire56)))) ?
                       ((^(|(wire54 * wire58))) ?
                           ((|wire58) ?
                               wire95 : {$unsigned(wire128),
                                   (-wire95)}) : wire59) : $unsigned((~|{$signed(wire55)})));
  assign wire131 = (wire58[(2'h3):(1'h0)] ?
                       ((!{(wire55 ?
                               wire61 : wire95)}) >= $unsigned({$signed(wire93),
                           wire61})) : (8'hbb));
  assign wire132 = (!wire56);
  assign wire133 = (^$unsigned($signed($signed((wire57 && (8'hb0))))));
  module134 #() modinst167 (.wire136(wire95), .wire139(wire131), .wire135(wire52), .y(wire166), .wire137(wire133), .clk(clk), .wire138(wire58));
  assign wire168 = $signed(wire132);
  always
    @(posedge clk) begin
      reg169 <= {wire95};
    end
  assign wire170 = $signed((($signed((^wire52)) <= wire166) | $unsigned($signed({wire57,
                       wire166}))));
  assign wire171 = wire132;
  assign wire172 = $signed($signed($unsigned($unsigned((~&wire56)))));
  assign wire173 = $unsigned(reg169);
  assign wire174 = $signed((wire52 ?
                       {$signed((wire60 ? (8'h9c) : wire58)),
                           wire170[(1'h1):(1'h0)]} : (($unsigned((8'hae)) ?
                               wire131[(3'h7):(1'h0)] : (wire58 >= wire52)) ?
                           wire60[(3'h4):(1'h0)] : {$signed(wire170),
                               (wire54 <= wire54)})));
  assign wire175 = reg169;
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire [(4'h9):(1'h0)] wire9;
  input wire [(2'h2):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire30;
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= wire10[(3'h5):(1'h1)];
      reg12 <= wire10;
      if ($signed($unsigned($unsigned(wire10))))
        begin
          if (wire6[(4'h8):(3'h4)])
            begin
              reg13 <= wire6;
            end
          else
            begin
              reg13 <= (!(~&(8'had)));
              reg14 <= $signed((!$signed($unsigned((!wire10)))));
              reg15 <= wire9[(3'h6):(3'h5)];
            end
          if ({$unsigned((&({reg15, wire9} ?
                  (reg13 << wire8) : $signed(wire10)))),
              $unsigned((8'haa))})
            begin
              reg16 <= (reg13[(4'h8):(3'h5)] + $signed(($unsigned($unsigned(wire7)) ?
                  ($signed(wire7) ^ (reg14 ?
                      wire9 : reg12)) : ($unsigned(wire8) ?
                      reg13[(1'h1):(1'h0)] : ((7'h44) ? wire10 : wire7)))));
              reg17 <= (reg15[(3'h6):(2'h2)] || (((^$unsigned(reg14)) ?
                  wire8 : $signed($unsigned(reg14))) || {((8'h9d) ?
                      (|reg14) : wire7[(5'h12):(4'he)]),
                  (reg11[(2'h2):(2'h2)] ? $signed(wire7) : (^~reg14))}));
              reg18 <= reg15;
              reg19 <= (|$unsigned({$signed(reg13[(2'h2):(1'h1)]),
                  (^(&wire7))}));
              reg20 <= {$unsigned(wire6),
                  (($signed($signed(wire6)) != (reg19[(3'h4):(1'h0)] * $signed((8'hb7)))) ?
                      (~^({(8'hbe)} ?
                          reg16[(1'h0):(1'h0)] : (reg16 && reg12))) : $signed((wire8 >> reg17)))};
            end
          else
            begin
              reg16 <= reg19;
            end
          if ($unsigned((reg13 ?
              (+wire10) : ($signed($unsigned((8'hb7))) >= $signed($signed(wire9))))))
            begin
              reg21 <= $unsigned((|(~&(-(reg12 < reg17)))));
              reg22 <= $signed((reg12 <= reg12[(3'h4):(1'h1)]));
              reg23 <= $signed((-$signed($unsigned((|wire6)))));
              reg24 <= ($signed((~&reg22[(4'ha):(2'h2)])) ?
                  reg12[(4'hc):(4'h8)] : ((reg23[(3'h6):(3'h4)] ?
                      wire9[(1'h0):(1'h0)] : ((-(8'ha3)) > reg14[(2'h2):(1'h1)])) >= wire10));
              reg25 <= ((~&($unsigned(reg17) | reg22)) <= ((reg20 ^~ $unsigned({reg21})) ?
                  wire8[(1'h0):(1'h0)] : (^~$unsigned((reg20 ?
                      (8'hb8) : reg19)))));
            end
          else
            begin
              reg21 <= {$unsigned(((reg24[(2'h2):(2'h2)] >= (+wire10)) <= $signed((reg22 ~^ wire7))))};
            end
          reg26 <= (($signed(((reg18 ~^ (8'ha8)) ?
                  (!reg19) : (^reg15))) << $signed($unsigned((8'ha4)))) ?
              reg22 : $unsigned(reg20));
        end
      else
        begin
          reg13 <= (($unsigned((((8'ha6) ? wire6 : reg23) ?
                  (reg26 ? reg20 : reg26) : {reg19})) ?
              $signed(reg15) : $unsigned(((reg16 ^ reg18) + reg26[(2'h2):(2'h2)]))) ^~ $signed($signed((reg15[(3'h7):(2'h3)] * $signed(wire7)))));
          reg14 <= reg19;
          reg15 <= (!reg16[(1'h1):(1'h1)]);
          reg16 <= $signed((~^reg22));
          if ((reg13[(4'hc):(3'h7)] ?
              ($unsigned($unsigned((reg19 ? wire6 : reg24))) ?
                  (reg14 ?
                      (!reg15[(3'h5):(1'h0)]) : wire10[(4'h8):(4'h8)]) : reg17[(1'h0):(1'h0)]) : reg14))
            begin
              reg17 <= (^(($unsigned((reg14 && reg21)) >> reg21[(3'h5):(2'h2)]) ?
                  reg13[(4'h9):(4'h9)] : ((+reg13[(4'hb):(2'h3)]) ?
                      (^reg18[(4'ha):(3'h6)]) : {$signed((8'ha7))})));
              reg18 <= (^~{reg24[(1'h0):(1'h0)],
                  (+($signed(reg19) ?
                      (reg24 && reg19) : reg25[(2'h3):(1'h0)]))});
              reg19 <= $unsigned(($unsigned(wire6[(5'h12):(4'he)]) ^~ reg26));
              reg20 <= wire7;
            end
          else
            begin
              reg17 <= (reg18[(4'h9):(3'h5)] == (({{reg22}} ?
                      ((reg19 || reg17) ?
                          wire6 : $unsigned(wire6)) : $unsigned({reg11})) ?
                  $unsigned({$unsigned(reg23)}) : $signed(((~^reg24) >> wire6[(3'h4):(1'h1)]))));
            end
        end
      if (($signed({$signed($signed(reg23)), reg16}) ?
          $unsigned(reg19) : reg22[(3'h5):(1'h1)]))
        begin
          reg27 <= wire9[(3'h6):(1'h1)];
          reg28 <= {(~{(^(wire10 ^~ reg24)), wire8}),
              ($signed(($signed(reg17) & ((7'h43) <= reg26))) ?
                  {reg27[(2'h3):(1'h1)],
                      ($signed(reg12) + $signed(reg11))} : $unsigned($unsigned(reg17[(4'hb):(3'h6)])))};
        end
      else
        begin
          reg27 <= wire7;
        end
      reg29 <= (reg25[(3'h7):(3'h6)] ?
          (reg20[(4'hd):(2'h3)] ?
              ((reg19[(4'h9):(1'h0)] ? (^~wire9) : $unsigned(reg11)) ?
                  (~$unsigned(reg22)) : wire7[(4'he):(3'h4)]) : reg17[(4'h9):(4'h8)]) : reg25);
    end
  assign wire30 = ({$unsigned(reg20[(1'h1):(1'h1)])} ?
                      reg23 : (~&$unsigned((reg11 - $unsigned(reg23)))));
  assign wire31 = {reg13,
                      (~$unsigned(((!wire6) ?
                          {reg28} : reg26[(1'h0):(1'h0)])))};
  assign wire32 = wire31[(5'h10):(4'hb)];
  assign wire33 = ({reg13,
                      $signed(($unsigned(reg24) >= reg26[(2'h2):(1'h0)]))} | $signed((^~reg25[(3'h7):(3'h4)])));
  assign wire34 = $signed((wire33 ^~ $signed($signed((-reg14)))));
endmodule

module module134
#(parameter param165 = (~&(((((7'h40) ? (8'hae) : (7'h42)) >= {(8'hb3)}) ? {(~(8'ha8))} : (((8'hba) ? (8'ha2) : (7'h40)) && {(8'h9e)})) >= ({(|(8'ha7))} * (&(8'h9d))))))
(y, clk, wire139, wire138, wire137, wire136, wire135);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire139;
  input wire [(4'hc):(1'h0)] wire138;
  input wire [(5'h10):(1'h0)] wire137;
  input wire signed [(4'h8):(1'h0)] wire136;
  input wire signed [(5'h15):(1'h0)] wire135;
  wire signed [(5'h14):(1'h0)] wire157;
  wire signed [(2'h2):(1'h0)] wire156;
  wire [(5'h14):(1'h0)] wire155;
  wire signed [(3'h4):(1'h0)] wire154;
  wire [(3'h7):(1'h0)] wire153;
  wire [(4'h9):(1'h0)] wire152;
  wire signed [(4'he):(1'h0)] wire151;
  wire signed [(5'h15):(1'h0)] wire150;
  wire [(3'h4):(1'h0)] wire149;
  wire signed [(5'h15):(1'h0)] wire148;
  wire [(4'hd):(1'h0)] wire147;
  wire signed [(3'h5):(1'h0)] wire146;
  wire [(4'h9):(1'h0)] wire145;
  wire signed [(2'h2):(1'h0)] wire144;
  wire signed [(3'h7):(1'h0)] wire143;
  wire signed [(4'hd):(1'h0)] wire142;
  wire signed [(4'hc):(1'h0)] wire141;
  wire [(5'h11):(1'h0)] wire140;
  reg signed [(5'h12):(1'h0)] reg164 = (1'h0);
  reg [(5'h12):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg162 = (1'h0);
  reg [(2'h3):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg158 = (1'h0);
  assign y = {wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 (1'h0)};
  assign wire140 = (($unsigned((^~$signed(wire136))) || ((~&((8'h9d) >> wire138)) ^ ((wire138 == (8'hab)) ?
                           wire139[(4'h9):(1'h0)] : (wire136 ?
                               wire135 : wire139)))) ?
                       ((8'ha5) ?
                           (8'hb9) : wire137) : (wire139 - (wire137[(1'h1):(1'h0)] || $unsigned($unsigned((8'hab))))));
  assign wire141 = $signed($signed(({wire136[(4'h8):(1'h1)],
                           wire137[(2'h2):(1'h0)]} ?
                       (^{wire135}) : wire139)));
  assign wire142 = $unsigned(wire137);
  assign wire143 = (+$unsigned((((wire136 ? wire137 : (8'hae)) ?
                           $signed((8'ha9)) : wire137[(4'hc):(4'hb)]) ?
                       (-wire135) : $unsigned(wire138[(3'h4):(2'h3)]))));
  assign wire144 = ((^~($signed((wire140 ? wire140 : wire143)) ?
                       $signed($unsigned(wire135)) : ((8'hb8) ?
                           (8'hbf) : (wire136 >= wire138)))) <= $signed((^wire140)));
  assign wire145 = ((+(^wire139)) ? wire142 : wire141);
  assign wire146 = wire137;
  assign wire147 = (~{{$unsigned(wire140[(5'h10):(2'h3)]),
                           ({wire145, (8'ha3)} ?
                               (wire136 ? wire141 : (7'h41)) : (-wire139))},
                       (~|($signed(wire137) && $signed(wire135)))});
  assign wire148 = $unsigned((~^wire144[(2'h2):(2'h2)]));
  assign wire149 = wire145;
  assign wire150 = wire147[(4'hc):(4'hb)];
  assign wire151 = $signed(($signed($signed((wire143 == wire146))) < {{((8'hbb) ?
                               wire140 : wire147),
                           $signed(wire142)},
                       ($signed(wire145) ? (+wire135) : $unsigned(wire147))}));
  assign wire152 = ({($unsigned((wire138 ? wire136 : (7'h43))) ?
                           (wire148[(3'h6):(3'h4)] ?
                               wire143 : $unsigned((8'ha7))) : (~{wire147,
                               wire147}))} <<< (wire141[(3'h7):(1'h1)] ~^ ($unsigned(((8'hb0) ?
                           wire142 : (8'hbb))) ?
                       wire145[(2'h3):(2'h2)] : (~|(wire144 ?
                           wire143 : (8'hba))))));
  assign wire153 = wire152[(1'h0):(1'h0)];
  assign wire154 = $signed($signed({(!wire144[(1'h0):(1'h0)])}));
  assign wire155 = $signed(wire143);
  assign wire156 = ((^~wire154[(1'h1):(1'h0)]) | {wire155});
  assign wire157 = wire140;
  always
    @(posedge clk) begin
      reg158 <= ({{($signed((8'ha2)) ^~ (wire141 ? wire139 : wire157)),
                  ((wire142 ? wire155 : wire140) ? (~&(8'hac)) : wire156)},
              $signed((wire142 ?
                  (wire150 ? (8'hb8) : wire150) : (wire157 * wire136)))} ?
          (($signed($signed(wire145)) || (~&(^~wire155))) ?
              wire138[(3'h5):(2'h3)] : (~^((wire156 >> (8'ha5)) ^ $unsigned(wire143)))) : (|$signed((^(wire147 * wire137)))));
      reg159 <= (wire152[(2'h2):(1'h1)] ?
          wire140 : $unsigned(wire157[(4'h9):(1'h1)]));
      if ($signed(wire157))
        begin
          reg160 <= ($unsigned(((^(-(8'haf))) ?
              (~&$signed(wire149)) : ($unsigned(wire135) ?
                  {(8'haf)} : (wire137 > wire143)))) ^~ ((wire141 ?
              wire145 : wire139) ^~ $signed((|$signed((8'ha3))))));
          if ({wire147[(3'h5):(1'h0)],
              (~(({(8'hb2)} ^~ (wire136 <= wire149)) ?
                  (7'h44) : $unsigned($signed(wire136))))})
            begin
              reg161 <= $unsigned((^~wire154[(1'h0):(1'h0)]));
            end
          else
            begin
              reg161 <= wire144[(1'h0):(1'h0)];
            end
          reg162 <= $unsigned(((^~(~&$signed((8'hb6)))) ?
              wire157[(4'h8):(2'h3)] : $signed($signed((8'hba)))));
        end
      else
        begin
          reg160 <= (~wire139[(4'hf):(4'ha)]);
        end
      reg163 <= wire155[(3'h4):(1'h1)];
      reg164 <= ({wire145,
          ($signed($unsigned(wire140)) ?
              $signed({wire146,
                  (8'hae)}) : wire153[(1'h0):(1'h0)])} ~^ {(((wire150 ?
                      wire151 : wire145) ?
                  $signed((8'h9c)) : reg158[(5'h14):(3'h7)]) ?
              ((8'hb3) | $unsigned(wire157)) : $unsigned($unsigned(wire146)))});
    end
endmodule

module module96
#(parameter param127 = ((+(^~(((8'hb2) <<< (8'hab)) ? ((8'hb0) ~^ (8'hb3)) : (+(8'hba))))) ? (~&((^((8'h9e) - (8'ha0))) << (8'hb8))) : ({({(8'hbf), (8'hbc)} + ((8'ha7) ~^ (8'hbc)))} ? ((~^(~|(8'hb0))) && (&((8'had) ~^ (8'ha4)))) : (((^~(7'h42)) & ((8'hb7) * (8'ha4))) ? (|((8'h9d) ? (8'hbb) : (8'had))) : {{(8'hb2)}}))))
(y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire101;
  input wire signed [(5'h14):(1'h0)] wire100;
  input wire signed [(3'h6):(1'h0)] wire99;
  input wire [(4'hf):(1'h0)] wire98;
  input wire [(4'hb):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire126;
  wire [(5'h12):(1'h0)] wire125;
  wire [(5'h12):(1'h0)] wire124;
  wire [(5'h15):(1'h0)] wire118;
  wire [(5'h10):(1'h0)] wire106;
  wire signed [(3'h6):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire102;
  reg [(4'hd):(1'h0)] reg123 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(3'h4):(1'h0)] reg120 = (1'h0);
  reg [(4'ha):(1'h0)] reg119 = (1'h0);
  reg [(5'h11):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg116 = (1'h0);
  reg [(5'h13):(1'h0)] reg115 = (1'h0);
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  reg [(5'h10):(1'h0)] reg113 = (1'h0);
  reg [(3'h4):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg109 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg104 = (1'h0);
  reg [(4'h9):(1'h0)] reg103 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire124,
                 wire118,
                 wire106,
                 wire105,
                 wire102,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire102 = wire99[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg103 <= (8'hb7);
      reg104 <= wire97[(2'h3):(2'h3)];
    end
  assign wire105 = {reg103};
  assign wire106 = (-(|((wire101[(1'h1):(1'h1)] ?
                       wire100 : (wire99 ?
                           wire99 : wire100)) >>> $unsigned(wire105[(3'h6):(3'h6)]))));
  always
    @(posedge clk) begin
      reg107 <= (~|wire99);
      reg108 <= $unsigned(($unsigned($signed($unsigned(wire106))) ?
          ((wire100[(4'ha):(2'h3)] + wire99) ~^ (^~wire98[(3'h5):(1'h0)])) : reg107[(3'h4):(1'h1)]));
      if ((reg108[(5'h11):(2'h2)] < ($signed(((wire102 == (8'hb9)) ?
          wire100 : (|reg104))) <= wire97)))
        begin
          if (($unsigned({reg107[(2'h2):(1'h1)], wire105[(1'h0):(1'h0)]}) ?
              ((~|$signed($signed(wire97))) ?
                  (({(8'hbc), (8'ha9)} >= (wire97 ? wire99 : reg103)) ?
                      wire98 : reg108[(4'hc):(4'ha)]) : $signed((^(reg108 ?
                      wire98 : wire97)))) : wire106[(4'hc):(3'h5)]))
            begin
              reg109 <= (~&$signed(wire99[(2'h2):(1'h0)]));
              reg110 <= (~^wire99);
            end
          else
            begin
              reg109 <= $unsigned((reg110 ?
                  $unsigned((~^reg110[(2'h2):(2'h2)])) : (8'ha9)));
              reg110 <= $unsigned($signed((wire102[(2'h3):(1'h0)] ^~ $signed((+reg109)))));
            end
          reg111 <= reg107[(1'h0):(1'h0)];
          reg112 <= (~|(wire99[(3'h4):(1'h1)] ?
              (($signed(reg109) ?
                  (!wire97) : $unsigned(reg108)) > $unsigned((~wire100))) : ((reg111 ?
                  (8'hb0) : (reg110 == (8'hb1))) > (((8'hab) ~^ reg103) * $signed(reg104)))));
          if ($unsigned({$signed((&$unsigned((8'had))))}))
            begin
              reg113 <= wire98;
              reg114 <= $signed($unsigned((8'hb4)));
              reg115 <= reg114;
            end
          else
            begin
              reg113 <= $unsigned(((wire100[(4'h9):(2'h3)] ?
                  (wire105[(1'h0):(1'h0)] != {reg109,
                      wire100}) : $signed((reg108 || wire105))) ^ wire99[(3'h6):(2'h3)]));
              reg114 <= (~reg104);
              reg115 <= ((8'haf) >> (wire97 - ($signed({reg115,
                  (8'ha2)}) < (wire102 ? (~reg110) : (wire106 - wire105)))));
            end
        end
      else
        begin
          reg109 <= (reg114 != $unsigned(reg112[(2'h2):(2'h2)]));
          reg110 <= wire101;
        end
      reg116 <= {($unsigned($signed((reg109 ^ reg103))) && ((&(wire100 == (8'hae))) <<< {$unsigned(reg114)})),
          ((((reg107 + wire97) ? {reg113, reg112} : reg113[(3'h5):(1'h0)]) ?
                  $signed($unsigned(reg115)) : (-reg103)) ?
              $signed($signed($unsigned(reg110))) : reg111[(2'h3):(1'h0)])};
      reg117 <= {(&$signed(($unsigned(reg116) == reg104[(4'hc):(3'h5)]))),
          {wire106[(4'hb):(3'h5)]}};
    end
  assign wire118 = $unsigned(reg111[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg119 <= wire99[(3'h4):(2'h3)];
      reg120 <= {{$signed((~(8'ha1)))}, reg110[(2'h3):(1'h0)]};
      reg121 <= reg120[(3'h4):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg122 <= (8'hbd);
      reg123 <= (8'ha8);
    end
  assign wire124 = (reg108 || $signed(((reg109[(1'h1):(1'h0)] ^~ (^~reg103)) >>> reg119[(3'h7):(3'h4)])));
  assign wire125 = wire99[(3'h5):(2'h3)];
  assign wire126 = reg112[(3'h4):(2'h3)];
endmodule

module module62  (y, clk, wire67, wire66, wire65, wire64, wire63);
  output wire [(32'h118):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire67;
  input wire signed [(4'h9):(1'h0)] wire66;
  input wire [(5'h12):(1'h0)] wire65;
  input wire signed [(3'h5):(1'h0)] wire64;
  input wire signed [(3'h7):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire92;
  wire [(5'h12):(1'h0)] wire91;
  wire [(4'hd):(1'h0)] wire90;
  wire signed [(4'hb):(1'h0)] wire89;
  wire [(5'h14):(1'h0)] wire72;
  wire [(5'h15):(1'h0)] wire71;
  wire [(2'h3):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire68;
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg [(4'hb):(1'h0)] reg87 = (1'h0);
  reg [(3'h6):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg78 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
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
                 (1'h0)};
  assign wire68 = wire65;
  assign wire69 = wire65[(4'h8):(3'h5)];
  assign wire70 = (^(!wire68));
  assign wire71 = ($unsigned(($unsigned($signed(wire65)) || wire67[(3'h4):(2'h2)])) ^~ ($unsigned((7'h44)) >= $unsigned((!wire70))));
  assign wire72 = wire65;
  always
    @(posedge clk) begin
      reg73 <= wire70[(1'h0):(1'h0)];
      reg74 <= {$unsigned(((wire66 ? $signed(wire68) : wire69[(4'h9):(1'h1)]) ?
              ((wire71 ?
                  reg73 : wire68) < wire71[(2'h3):(1'h1)]) : (!(wire66 ^~ (8'hb9))))),
          wire69[(4'he):(3'h5)]};
      reg75 <= wire63;
    end
  always
    @(posedge clk) begin
      reg76 <= $unsigned((&(7'h44)));
      reg77 <= $signed(wire69);
      reg78 <= (~^{((wire69[(5'h14):(5'h11)] > wire63) - (((8'hbd) ?
                  wire70 : reg74) ?
              (reg76 ? wire72 : wire64) : (reg77 ? (8'had) : reg74)))});
      reg79 <= wire69[(4'hd):(1'h0)];
      if ($signed((~^$signed(reg74))))
        begin
          if (($signed(wire69) ?
              (-$unsigned($unsigned($signed(wire67)))) : wire70[(2'h3):(2'h2)]))
            begin
              reg80 <= $signed($unsigned((reg79[(3'h6):(2'h2)] ?
                  reg73[(2'h2):(2'h2)] : reg75)));
            end
          else
            begin
              reg80 <= (reg78 - wire71);
              reg81 <= wire64[(3'h5):(1'h0)];
            end
          if (reg73[(3'h6):(3'h6)])
            begin
              reg82 <= (~reg77);
              reg83 <= ($signed((wire70 ? wire65 : wire65)) ?
                  wire69 : (|((|$signed((7'h41))) <<< reg78)));
            end
          else
            begin
              reg82 <= reg78;
              reg83 <= reg78[(2'h2):(1'h0)];
              reg84 <= wire63[(3'h4):(1'h1)];
              reg85 <= reg79[(2'h2):(1'h1)];
              reg86 <= {$signed($unsigned(wire63[(1'h1):(1'h0)])),
                  $signed(((((8'hab) ? reg84 : reg85) && (reg85 ?
                          wire63 : (7'h43))) ?
                      $unsigned((reg81 >= reg83)) : (wire67 != reg80)))};
            end
          reg87 <= $signed($unsigned({$signed($signed(reg74))}));
          reg88 <= $signed(reg85[(4'hc):(2'h2)]);
        end
      else
        begin
          reg80 <= ($unsigned($unsigned(((reg80 ? (8'hba) : wire70) ?
                  $signed((8'hb6)) : (wire68 ? wire64 : reg75)))) ?
              $unsigned((reg80[(2'h2):(2'h2)] ?
                  $signed(reg82[(1'h0):(1'h0)]) : ((|wire65) ?
                      (8'hbe) : $signed(reg78)))) : (reg75 ~^ reg85));
          reg81 <= $signed(wire71[(5'h15):(4'he)]);
          reg82 <= (-(-((^~wire66) ?
              wire66 : (wire64[(3'h4):(2'h2)] | (wire72 * reg84)))));
          reg83 <= wire67[(2'h2):(1'h1)];
        end
    end
  assign wire89 = wire72;
  assign wire90 = {wire71, ($signed($unsigned(wire68)) & reg80[(4'hd):(3'h4)])};
  assign wire91 = reg78;
  assign wire92 = $unsigned($signed($signed(((wire90 && reg82) ?
                      (reg75 ? reg82 : reg76) : $unsigned(wire63)))));
endmodule
