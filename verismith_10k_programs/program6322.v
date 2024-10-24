module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire184;
  wire signed [(4'hf):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire36;
  wire signed [(3'h5):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire178;
  wire [(4'hd):(1'h0)] wire180;
  wire signed [(5'h13):(1'h0)] wire181;
  wire [(3'h4):(1'h0)] wire182;
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  assign y = {wire184,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire34,
                 wire36,
                 wire37,
                 wire38,
                 wire178,
                 wire180,
                 wire181,
                 wire182,
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
                 (1'h0)};
  assign wire4 = (~|($unsigned($unsigned($signed(wire2))) ?
                     $signed((&(wire1 ^ wire1))) : ((wire2 ?
                         ((8'h9d) ^ wire3) : wire2[(1'h0):(1'h0)]) << wire2)));
  assign wire5 = wire4;
  assign wire6 = {wire5[(2'h3):(2'h3)], $unsigned(wire0)};
  assign wire7 = $unsigned((^wire1[(4'hb):(4'hb)]));
  assign wire8 = (~(wire5 & $unsigned((wire6[(1'h1):(1'h1)] < {wire5}))));
  assign wire9 = (8'ha7);
  assign wire10 = $unsigned(wire9);
  always
    @(posedge clk) begin
      reg11 <= (^~(~&$signed((^$signed(wire9)))));
      reg12 <= $unsigned(wire2[(2'h3):(2'h3)]);
      reg13 <= wire9;
      if (reg12[(4'hc):(1'h1)])
        begin
          if ((|$signed(wire9[(1'h0):(1'h0)])))
            begin
              reg14 <= reg11[(4'hb):(4'h8)];
              reg15 <= wire10;
              reg16 <= $signed(($unsigned($signed($unsigned(reg14))) | wire9[(1'h0):(1'h0)]));
              reg17 <= (~|$signed($signed(wire3[(3'h7):(3'h4)])));
            end
          else
            begin
              reg14 <= wire3[(1'h0):(1'h0)];
              reg15 <= (|wire10[(1'h1):(1'h1)]);
            end
          reg18 <= (wire5[(3'h5):(2'h2)] ^ reg12[(1'h0):(1'h0)]);
          reg19 <= $unsigned((!(&wire10[(1'h1):(1'h0)])));
        end
      else
        begin
          reg14 <= (~^(|{(~^(^reg19))}));
          if (((!(((wire4 ~^ reg13) + $unsigned(reg14)) ?
              (reg13 >= wire2[(4'hb):(2'h2)]) : $unsigned($unsigned(reg11)))) ^~ (+reg19)))
            begin
              reg15 <= {{$signed((^{reg12})), reg15},
                  {$signed(reg11[(4'hb):(2'h3)])}};
              reg16 <= (8'hb7);
            end
          else
            begin
              reg15 <= (-(wire9 | $unsigned(wire10)));
              reg16 <= wire0;
            end
        end
      reg20 <= $unsigned($unsigned((&{$signed(reg11), reg13})));
    end
  module21 #() modinst35 (wire34, clk, wire5, wire10, wire0, wire7);
  assign wire36 = $signed((({$signed(reg17)} ?
                          ((reg15 & wire5) ?
                              (~&reg13) : (reg14 ?
                                  reg16 : reg13)) : $unsigned(reg13[(4'h9):(2'h2)])) ?
                      (($unsigned(reg16) >>> $unsigned((8'hb4))) ?
                          wire7[(3'h4):(3'h4)] : ((wire3 >> wire3) ?
                              ((8'haf) ? reg20 : wire2) : {reg19,
                                  reg16})) : (&(~|wire4))));
  assign wire37 = (($unsigned((|wire9[(1'h1):(1'h1)])) & wire2[(4'h8):(3'h6)]) != wire4[(4'hf):(4'hf)]);
  assign wire38 = $signed((reg15 ?
                      {{wire6,
                              (wire6 - reg12)}} : (!$unsigned((wire34 << wire4)))));
  module39 #() modinst179 (wire178, clk, wire10, reg19, wire36, reg13);
  assign wire180 = $unsigned(((~^$unsigned((wire2 <= reg18))) ?
                       {reg13} : (~{$signed(wire10), (|reg11)})));
  assign wire181 = wire34[(4'hd):(4'hd)];
  module141 #() modinst183 (wire182, clk, wire36, reg12, wire6, wire37);
  assign wire184 = wire3;
endmodule

module module39
#(parameter param176 = (|(((^((8'hb8) ^~ (8'ha5))) ? ((8'hae) ? (+(8'hb9)) : (|(8'hb1))) : {(|(8'ha4))}) * (&(-{(8'ha8), (7'h40)})))), 
parameter param177 = param176)
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire43;
  input wire [(4'h9):(1'h0)] wire42;
  input wire [(5'h15):(1'h0)] wire41;
  input wire [(4'hd):(1'h0)] wire40;
  wire signed [(4'hf):(1'h0)] wire175;
  wire [(3'h6):(1'h0)] wire174;
  wire [(3'h4):(1'h0)] wire172;
  wire [(5'h12):(1'h0)] wire140;
  wire [(5'h14):(1'h0)] wire139;
  wire signed [(5'h13):(1'h0)] wire98;
  wire signed [(5'h15):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire105;
  wire [(5'h13):(1'h0)] wire114;
  wire [(4'hc):(1'h0)] wire115;
  wire [(3'h6):(1'h0)] wire137;
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg110 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg106 = (1'h0);
  reg [(4'ha):(1'h0)] reg104 = (1'h0);
  reg [(4'ha):(1'h0)] reg103 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg102 = (1'h0);
  reg [(3'h6):(1'h0)] reg101 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire172,
                 wire140,
                 wire139,
                 wire98,
                 wire72,
                 wire44,
                 wire105,
                 wire114,
                 wire115,
                 wire137,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  assign wire44 = $signed({(^(~(~|wire43)))});
  module45 #() modinst73 (wire72, clk, wire42, wire41, wire43, wire40);
  module74 #() modinst99 (wire98, clk, wire40, wire44, wire42, wire72, wire43);
  always
    @(posedge clk) begin
      reg100 <= $unsigned($unsigned((~|((~^wire72) ~^ {wire40}))));
      reg101 <= (^$unsigned($signed((~|$signed(wire41)))));
      if ({wire41[(5'h15):(4'hd)]})
        begin
          reg102 <= $signed(wire42);
          reg103 <= reg100[(3'h5):(3'h4)];
        end
      else
        begin
          reg102 <= {reg101[(2'h2):(2'h2)], (~(8'ha0))};
          reg103 <= (-reg100[(1'h1):(1'h0)]);
        end
      if (($signed(reg102[(3'h4):(2'h3)]) * wire72[(1'h1):(1'h1)]))
        begin
          reg104 <= wire43[(1'h0):(1'h0)];
        end
      else
        begin
          reg104 <= $unsigned($signed((wire44 || ((reg100 - reg104) ?
              $unsigned(reg100) : (wire44 || (8'ha2))))));
        end
    end
  assign wire105 = $unsigned(wire72);
  always
    @(posedge clk) begin
      if (((~{wire98[(5'h10):(2'h2)], wire44}) ?
          (reg101[(1'h1):(1'h1)] ?
              ($unsigned(wire43) < (&wire105[(2'h3):(1'h0)])) : (&reg100)) : wire40[(1'h1):(1'h1)]))
        begin
          if (wire44[(4'h9):(3'h5)])
            begin
              reg106 <= reg101[(1'h1):(1'h0)];
              reg107 <= $signed({wire44, wire105});
              reg108 <= {(((~^wire42[(3'h6):(3'h6)]) ?
                          {(~|reg100)} : $unsigned($signed(reg103))) ?
                      $unsigned(wire42) : ($signed($signed(wire98)) << (~^wire43[(3'h6):(3'h4)]))),
                  $signed($unsigned(wire41[(4'h8):(3'h7)]))};
              reg109 <= $signed(((^~wire44) ?
                  $signed(wire105[(4'hb):(2'h2)]) : reg107[(2'h3):(2'h2)]));
              reg110 <= $signed(({(8'hba),
                  $signed($unsigned((8'hb7)))} ^ ((reg106 ?
                      (wire42 ? reg101 : wire105) : (reg107 ?
                          wire98 : wire105)) ?
                  ((wire42 || wire105) ? (~&reg100) : (7'h43)) : ((wire41 ?
                      wire40 : wire41) & (wire72 ? wire42 : (8'h9e))))));
            end
          else
            begin
              reg106 <= ((({(reg106 < reg101),
                      (wire42 >= wire40)} <= reg109[(4'h8):(3'h7)]) >>> ((~^$unsigned(reg103)) ?
                      ((^~wire98) ~^ (reg101 || reg106)) : $unsigned(wire41))) ?
                  ((wire105 < (8'hb8)) ?
                      reg104[(1'h0):(1'h0)] : ((~|$signed(reg102)) != ((reg102 ?
                          reg103 : reg102) >> $signed(wire41)))) : ((^($signed((8'ha0)) ?
                      $signed(wire41) : (wire44 << reg108))) * ({$unsigned((8'h9f)),
                      wire43} < {((8'hb9) != wire98), $unsigned(reg101)})));
              reg107 <= (8'h9e);
              reg108 <= reg101[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg106 <= reg110[(1'h1):(1'h1)];
          reg107 <= $unsigned(($signed($signed((!wire40))) ^ $signed($unsigned({reg110}))));
          reg108 <= reg102[(4'h9):(4'h9)];
          reg109 <= (((wire40[(3'h5):(2'h3)] >> (((8'ha0) << wire72) ?
                      $signed(reg104) : wire42[(2'h3):(1'h1)])) ?
                  (~|(~$unsigned(wire41))) : $signed($unsigned((-wire98)))) ?
              (-(wire72 << $unsigned((~^wire40)))) : $signed(reg107[(4'he):(3'h7)]));
        end
      reg111 <= $unsigned({({(&reg100), $signed(reg103)} ?
              wire42[(3'h6):(3'h4)] : (reg110[(3'h6):(1'h1)] ?
                  (reg109 ? wire41 : wire44) : reg101[(1'h1):(1'h0)]))});
      reg112 <= (wire42[(3'h7):(1'h0)] + (((reg104[(3'h7):(2'h2)] <= (^~(7'h42))) ?
              (reg107[(5'h13):(3'h7)] != (wire41 <<< (8'ha2))) : ({reg100} && $unsigned((8'ha5)))) ?
          $signed($unsigned(wire105)) : wire40[(4'hd):(3'h5)]));
      reg113 <= $signed($unsigned($signed({$signed(wire105), wire72})));
    end
  assign wire114 = (!$signed({(wire98 < (reg107 || reg104)), reg103}));
  assign wire115 = {reg110};
  module116 #() modinst138 (.y(wire137), .clk(clk), .wire119(wire114), .wire121(reg111), .wire117(wire43), .wire118(reg101), .wire120(wire115));
  assign wire139 = $unsigned((wire44 ?
                       wire41[(4'hd):(4'h8)] : $unsigned(reg107)));
  assign wire140 = $unsigned((~^$unsigned($unsigned(((8'ha5) ?
                       reg102 : reg100)))));
  module141 #() modinst173 (wire172, clk, reg100, wire43, wire114, reg108);
  assign wire174 = reg111[(2'h2):(1'h1)];
  assign wire175 = {((8'ha5) ? (8'hba) : reg107[(3'h6):(3'h5)])};
endmodule

module module21
#(parameter param33 = ({((((8'hb4) ^ (8'h9e)) | (^(8'ha2))) - (((7'h44) >>> (8'ha5)) ? ((8'ha7) ? (8'haa) : (8'hb0)) : (~(8'ha5))))} - (~|{({(8'ha9)} ? {(8'hb2), (8'hb0)} : ((8'hb6) ? (8'hbb) : (8'h9c)))})))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire25;
  input wire signed [(4'hb):(1'h0)] wire24;
  input wire [(5'h13):(1'h0)] wire23;
  input wire signed [(4'hf):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire [(2'h3):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire26;
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  assign y = {wire32, wire31, wire27, wire26, reg30, reg29, reg28, (1'h0)};
  assign wire26 = $signed((~&(|$signed((wire22 + wire24)))));
  assign wire27 = wire23;
  always
    @(posedge clk) begin
      reg28 <= $signed(((($unsigned(wire27) ?
              (wire22 ?
                  wire27 : wire26) : (^~wire22)) ^~ wire26[(4'ha):(1'h0)]) ?
          ((~^wire27[(2'h3):(2'h2)]) ~^ {wire27,
              $signed(wire23)}) : (((wire24 >>> (8'ha8)) ?
                  $signed(wire26) : {wire24}) ?
              {(wire23 ? wire25 : (8'hbe)),
                  wire25} : $unsigned(wire27[(2'h3):(2'h2)]))));
      reg29 <= wire26;
      reg30 <= reg28;
    end
  assign wire31 = (~&reg30[(1'h0):(1'h0)]);
  assign wire32 = $unsigned(wire24[(3'h5):(1'h0)]);
endmodule

module module141
#(parameter param170 = {{(({(8'hbe)} * {(8'hb3), (8'hb8)}) ? ((~&(8'hb7)) && {(8'ha9), (8'hb0)}) : (+(|(8'hb2)))), (({(8'haa)} ? ((8'hb9) ? (8'hb1) : (8'hbb)) : ((7'h41) ? (8'h9c) : (8'ha3))) ? ({(8'hbe)} ? (+(8'ha8)) : (-(8'haa))) : (((7'h41) << (8'hbd)) ^~ (^~(8'hbe))))}, ((({(8'hb7)} ^ ((8'hb3) ? (7'h40) : (8'had))) * (((8'h9c) || (8'hb2)) && {(7'h42)})) < (!(((8'hb0) ? (8'hb1) : (8'hbc)) < ((8'ha0) ? (8'hae) : (8'hac)))))}, 
parameter param171 = param170)
(y, clk, wire145, wire144, wire143, wire142);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire145;
  input wire [(4'hc):(1'h0)] wire144;
  input wire [(4'h8):(1'h0)] wire143;
  input wire signed [(3'h5):(1'h0)] wire142;
  wire signed [(5'h12):(1'h0)] wire162;
  wire [(4'he):(1'h0)] wire161;
  wire [(3'h5):(1'h0)] wire160;
  wire [(2'h2):(1'h0)] wire159;
  wire [(5'h11):(1'h0)] wire158;
  wire signed [(5'h15):(1'h0)] wire157;
  wire signed [(5'h11):(1'h0)] wire156;
  wire signed [(5'h14):(1'h0)] wire155;
  wire signed [(4'h8):(1'h0)] wire154;
  wire [(4'h8):(1'h0)] wire153;
  wire signed [(5'h10):(1'h0)] wire152;
  wire signed [(5'h12):(1'h0)] wire151;
  wire signed [(5'h10):(1'h0)] wire150;
  wire [(2'h3):(1'h0)] wire149;
  wire [(3'h5):(1'h0)] wire148;
  wire signed [(5'h14):(1'h0)] wire147;
  wire [(4'hb):(1'h0)] wire146;
  reg signed [(5'h11):(1'h0)] reg169 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg168 = (1'h0);
  reg [(4'hc):(1'h0)] reg167 = (1'h0);
  reg signed [(4'he):(1'h0)] reg166 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg164 = (1'h0);
  reg [(4'hc):(1'h0)] reg163 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
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
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 (1'h0)};
  assign wire146 = wire142[(1'h1):(1'h1)];
  assign wire147 = {((-$unsigned($unsigned(wire144))) + (~&wire144[(3'h5):(2'h3)]))};
  assign wire148 = $unsigned(wire145[(2'h3):(2'h3)]);
  assign wire149 = wire148;
  assign wire150 = (wire145 ?
                       $signed($unsigned(((^wire147) ?
                           (wire142 != wire147) : ((8'h9f) ?
                               wire145 : wire148)))) : (^($unsigned($signed(wire145)) ?
                           $unsigned((wire149 ?
                               wire147 : wire144)) : {(wire145 + (7'h40)),
                               {wire148, wire145}})));
  assign wire151 = wire150[(4'hc):(4'ha)];
  assign wire152 = ((-(({wire146, wire148} ? (7'h43) : (wire148 > wire147)) ?
                           ((wire148 ? wire148 : wire149) ?
                               {wire151} : wire150) : $unsigned($unsigned(wire148)))) ?
                       wire142 : {{wire144[(4'hb):(4'h8)]},
                           wire142[(1'h0):(1'h0)]});
  assign wire153 = wire143;
  assign wire154 = (+(~&({{wire150}} ?
                       {$signed((8'hbb)), {wire152, wire153}} : (~|wire150))));
  assign wire155 = wire149;
  assign wire156 = wire151[(3'h4):(3'h4)];
  assign wire157 = (wire156[(4'hf):(4'h8)] ?
                       (8'ha0) : (wire146 ?
                           (wire147[(4'h9):(3'h4)] || ((7'h42) ?
                               $signed(wire151) : $signed(wire146))) : (((8'ha5) & (wire144 || (8'ha5))) ?
                               (wire156[(2'h2):(2'h2)] ^~ $unsigned(wire146)) : $unsigned($unsigned((8'hb0))))));
  assign wire158 = $signed($signed($unsigned(((&wire155) ?
                       $unsigned((8'hb2)) : ((8'hb2) ? (7'h43) : wire148)))));
  assign wire159 = $unsigned((+$signed({wire145, $unsigned(wire157)})));
  assign wire160 = $unsigned(wire146[(4'ha):(3'h4)]);
  assign wire161 = $unsigned((wire157[(1'h0):(1'h0)] > wire155[(5'h12):(4'hd)]));
  assign wire162 = wire151[(4'hd):(3'h5)];
  always
    @(posedge clk) begin
      if (wire149)
        begin
          reg163 <= (wire148[(1'h0):(1'h0)] >>> $signed({wire144[(3'h4):(2'h2)]}));
        end
      else
        begin
          if ((+wire152))
            begin
              reg163 <= wire143;
              reg164 <= wire149;
              reg165 <= ($unsigned((!wire148)) == $unsigned($signed($signed((wire162 > wire150)))));
              reg166 <= ((~wire150[(1'h1):(1'h1)]) ?
                  $signed((-{wire151,
                      (wire154 << wire161)})) : {($unsigned(wire142) ?
                          wire151[(4'he):(3'h5)] : (~&(wire158 ^ wire159))),
                      $unsigned(wire157)});
            end
          else
            begin
              reg163 <= wire145[(3'h6):(2'h3)];
            end
          reg167 <= $unsigned(reg165);
          reg168 <= (^~((wire161[(4'hd):(4'hd)] ?
                  $unsigned($unsigned((8'hbd))) : wire150) ?
              (^~($signed(wire150) ?
                  $signed(wire150) : $unsigned(wire145))) : $signed((+(^~wire155)))));
        end
      reg169 <= ($unsigned($unsigned(wire158)) ?
          $unsigned($signed(reg164)) : wire154[(3'h6):(1'h1)]);
    end
endmodule

module module116  (y, clk, wire121, wire120, wire119, wire118, wire117);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire121;
  input wire signed [(4'hc):(1'h0)] wire120;
  input wire [(5'h13):(1'h0)] wire119;
  input wire signed [(3'h6):(1'h0)] wire118;
  input wire signed [(4'hd):(1'h0)] wire117;
  wire [(4'hc):(1'h0)] wire136;
  wire [(4'h9):(1'h0)] wire135;
  wire [(4'hd):(1'h0)] wire134;
  wire [(5'h13):(1'h0)] wire133;
  wire [(3'h7):(1'h0)] wire132;
  wire signed [(5'h15):(1'h0)] wire131;
  wire [(4'h9):(1'h0)] wire130;
  wire signed [(4'h8):(1'h0)] wire129;
  wire signed [(5'h15):(1'h0)] wire128;
  wire [(2'h3):(1'h0)] wire127;
  wire signed [(5'h15):(1'h0)] wire126;
  wire [(2'h2):(1'h0)] wire125;
  wire [(5'h15):(1'h0)] wire124;
  wire signed [(2'h2):(1'h0)] wire123;
  wire [(4'hc):(1'h0)] wire122;
  assign y = {wire136,
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
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 (1'h0)};
  assign wire122 = wire119[(1'h0):(1'h0)];
  assign wire123 = (((!$signed($signed(wire120))) != $signed(wire118)) ?
                       $signed((((wire117 + wire122) ?
                               $unsigned(wire118) : (wire120 ?
                                   wire120 : (7'h41))) ?
                           (^~$signed(wire122)) : wire118)) : ($signed($signed($signed(wire118))) - wire118[(1'h0):(1'h0)]));
  assign wire124 = ($unsigned($signed({wire118})) ?
                       $unsigned($signed((^(wire119 ?
                           wire119 : wire117)))) : wire118);
  assign wire125 = ((~^({(&wire122)} ? (~wire121) : wire124)) ?
                       wire120[(3'h6):(2'h3)] : (((wire124 ?
                           (wire123 ^ wire117) : (wire124 ?
                               wire119 : (8'ha9))) << ((wire119 ?
                           wire122 : wire118) < $unsigned(wire124))) >>> wire119[(3'h7):(3'h6)]));
  assign wire126 = (^~$signed($signed((!wire123))));
  assign wire127 = $unsigned({{((~(8'hb0)) + (-wire123))}});
  assign wire128 = ((~($signed($unsigned(wire125)) ? wire123 : wire126)) ?
                       ($signed((!$unsigned(wire122))) & (+$signed((wire117 | wire119)))) : ($unsigned(wire125[(1'h1):(1'h0)]) ?
                           $unsigned($signed((~&wire123))) : $unsigned($signed($signed(wire118)))));
  assign wire129 = $unsigned((~wire121));
  assign wire130 = (wire117 && {(&(wire123[(1'h0):(1'h0)] ^ wire122[(1'h0):(1'h0)])),
                       $signed($signed((wire128 || wire117)))});
  assign wire131 = wire125;
  assign wire132 = $unsigned((($unsigned($unsigned(wire117)) <<< {(wire128 ?
                           wire119 : wire118)}) == wire131[(4'hf):(4'he)]));
  assign wire133 = $unsigned(wire128);
  assign wire134 = wire126;
  assign wire135 = wire121[(1'h1):(1'h0)];
  assign wire136 = {(7'h44), wire129[(3'h7):(1'h0)]};
endmodule

module module74
#(parameter param96 = (|((|(-((8'hb2) == (8'hae)))) == {(((8'ha0) - (8'hae)) ? ((8'hab) & (8'hae)) : (8'hb9))})), 
parameter param97 = (param96 ? param96 : param96))
(y, clk, wire79, wire78, wire77, wire76, wire75);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire79;
  input wire [(5'h12):(1'h0)] wire78;
  input wire [(4'h8):(1'h0)] wire77;
  input wire signed [(5'h12):(1'h0)] wire76;
  input wire signed [(5'h12):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire95;
  wire [(4'he):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire87;
  wire signed [(4'he):(1'h0)] wire86;
  wire signed [(5'h12):(1'h0)] wire85;
  wire signed [(4'ha):(1'h0)] wire84;
  wire signed [(4'hd):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire81;
  wire signed [(4'hc):(1'h0)] wire80;
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg89 = (1'h0);
  assign y = {wire95,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 (1'h0)};
  assign wire80 = {$unsigned((($unsigned(wire76) - wire78[(3'h6):(3'h5)]) ?
                          ((&wire78) ?
                              wire76[(3'h5):(1'h1)] : (wire75 ?
                                  wire78 : wire76)) : $signed((wire76 * (8'h9d)))))};
  assign wire81 = $signed(((^~{(wire77 ^ wire76)}) <= ($signed((wire79 ?
                      (8'hbc) : wire76)) >> {$signed(wire79)})));
  assign wire82 = (^~(+($signed($signed(wire77)) > ($unsigned(wire79) ?
                      $unsigned(wire75) : (wire77 ? (8'ha3) : wire78)))));
  assign wire83 = wire76[(3'h7):(3'h4)];
  assign wire84 = ($signed((wire81[(1'h0):(1'h0)] <= (wire80[(2'h2):(2'h2)] >= (wire83 * wire75)))) ^ (+wire75));
  assign wire85 = ($signed($signed(wire82)) ^ (~wire83));
  assign wire86 = (~&$signed(wire78[(4'he):(3'h6)]));
  assign wire87 = (wire75 || wire84);
  assign wire88 = wire82[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg89 <= $unsigned(($unsigned($signed((wire88 > (8'hbf)))) == (wire79 ^~ ((~&wire82) ?
          wire77[(3'h4):(2'h3)] : (wire86 ? (8'ha6) : wire77)))));
      if ($unsigned(((~wire83) && $unsigned((^~wire78[(3'h4):(1'h0)])))))
        begin
          reg90 <= $unsigned(wire76);
          if (wire76[(1'h0):(1'h0)])
            begin
              reg91 <= wire87[(4'hc):(3'h7)];
            end
          else
            begin
              reg91 <= ((reg89 ?
                  wire81 : ($unsigned((wire82 - wire77)) < $unsigned((wire83 & wire82)))) - {$signed((~|(wire84 && wire86))),
                  (+(~$signed(wire84)))});
            end
          reg92 <= reg91[(1'h0):(1'h0)];
          if ($signed((^~reg92)))
            begin
              reg93 <= $unsigned(wire76);
              reg94 <= wire75[(4'h8):(1'h1)];
            end
          else
            begin
              reg93 <= ((~$signed(((wire86 & wire84) ?
                  $signed(wire85) : $unsigned(wire86)))) <<< (wire86[(3'h7):(1'h1)] ?
                  (8'h9d) : ((^~(~^(8'h9e))) != (~&{reg93, wire80}))));
            end
        end
      else
        begin
          reg90 <= (~|wire81);
          reg91 <= wire88;
          reg92 <= ($signed({((|wire87) ?
                  reg94 : (&(7'h44)))}) > $signed((8'hbe)));
          reg93 <= $unsigned(reg90[(2'h2):(1'h1)]);
        end
    end
  assign wire95 = (wire87[(5'h11):(4'hb)] >= wire79[(1'h1):(1'h1)]);
endmodule

module module45
#(parameter param71 = (({(~&((8'hbe) ? (8'hb9) : (7'h44))), (^~((7'h40) ? (8'hb5) : (8'hab)))} ? ((~^((8'ha1) << (8'hae))) ? (((8'hbb) ? (8'ha5) : (7'h40)) | {(8'h9c)}) : ((!(8'h9c)) ? ((8'ha8) ? (8'hb1) : (8'hab)) : {(8'hac)})) : ((((8'h9c) << (8'hb7)) ? ((8'ha3) || (8'h9d)) : (8'h9c)) ^~ ((^~(7'h42)) ? ((8'h9f) ? (8'hab) : (8'hab)) : (~(8'hb5))))) ^ (~^(!(&((8'hb6) ? (7'h43) : (8'hab)))))))
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire49;
  input wire signed [(4'hd):(1'h0)] wire48;
  input wire signed [(4'ha):(1'h0)] wire47;
  input wire signed [(4'hd):(1'h0)] wire46;
  wire signed [(4'hd):(1'h0)] wire70;
  wire signed [(5'h14):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire68;
  wire signed [(4'h8):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire57;
  wire [(4'hf):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire50;
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire50 = $signed({(($signed(wire48) >> wire49) ~^ (8'hb4))});
  assign wire51 = ($unsigned($unsigned((-(wire49 ?
                      (8'ha7) : wire47)))) - $signed(((wire48[(4'h8):(2'h3)] ?
                      (wire47 >> wire47) : wire49) ^ wire47)));
  assign wire52 = (((^(((8'ha6) >= wire47) + (wire46 >> wire51))) ?
                          ($unsigned($unsigned(wire50)) ?
                              $signed((wire47 ?
                                  wire47 : wire46)) : wire51[(4'ha):(3'h5)]) : {((wire50 ?
                                  wire51 : wire48) + (wire49 << wire49)),
                              ($unsigned(wire51) ?
                                  wire51[(5'h10):(3'h7)] : wire50[(2'h2):(1'h0)])}) ?
                      wire51 : $signed((((wire50 | wire48) ?
                          ((8'hbd) ? wire50 : wire47) : (wire50 ?
                              wire51 : wire47)) > (((8'hb7) ? wire48 : wire50) ?
                          (~wire51) : (^~wire51)))));
  assign wire53 = $unsigned(($signed(($signed((8'ha5)) ?
                      (wire49 ?
                          wire51 : wire52) : wire52[(1'h0):(1'h0)])) && (^~(^{wire52,
                      wire49}))));
  assign wire54 = ((wire48 ?
                          ($signed((wire49 ?
                              wire47 : wire53)) ^~ (~(wire50 ^ wire50))) : $unsigned($unsigned((wire49 ?
                              wire51 : wire50)))) ?
                      (((^((8'ha4) ?
                          wire46 : (8'ha4))) ~^ wire52) < wire50[(1'h0):(1'h0)]) : (!$unsigned($unsigned(wire49))));
  assign wire55 = ((($signed($signed(wire54)) ?
                              $signed(wire54[(4'hb):(4'h9)]) : {(8'haa),
                                  $unsigned(wire50)}) ?
                          wire53[(1'h0):(1'h0)] : (|$unsigned($signed(wire46)))) ?
                      ((((+wire53) || $signed((8'hb7))) ?
                              $unsigned((wire53 ?
                                  wire50 : (7'h44))) : (|$signed(wire46))) ?
                          wire46 : $unsigned(wire50)) : ($unsigned($signed((-wire51))) ?
                          (|wire54) : wire52));
  assign wire56 = ((wire54[(2'h2):(1'h0)] ?
                          ({wire47,
                              $signed(wire51)} || (~|wire47[(4'h8):(3'h4)])) : wire47) ?
                      ($signed({wire52}) >> (wire47[(3'h6):(2'h2)] <<< (((8'h9d) << wire46) ?
                          (wire54 ?
                              wire48 : wire46) : (!wire48)))) : wire46[(1'h1):(1'h0)]);
  assign wire57 = wire47;
  assign wire58 = ((({wire55, $signed(wire46)} || ((wire46 == (8'hb2)) ?
                          (~wire48) : wire51)) ?
                      ((^~$signed(wire55)) ?
                          (&{wire49,
                              wire56}) : wire54[(2'h3):(2'h2)]) : $signed($signed((wire57 ?
                          wire56 : wire52)))) ~^ (^({(wire53 ? wire57 : wire51),
                          (^(8'ha3))} ?
                      $signed(wire47[(2'h3):(1'h1)]) : (+wire50[(2'h3):(1'h1)]))));
  assign wire59 = (~$signed(wire53));
  assign wire60 = (8'h9d);
  always
    @(posedge clk) begin
      if ($signed((((&(wire52 >= wire54)) - wire51) ?
          (wire47[(3'h7):(3'h5)] ^~ wire60[(1'h1):(1'h1)]) : {(((8'ha6) ?
                  (7'h41) : wire52) == $unsigned((8'hb6))),
              wire58})))
        begin
          reg61 <= (8'hba);
          reg62 <= ($unsigned($signed({(wire58 ? wire52 : wire60)})) ?
              (~^$unsigned((~^(~wire57)))) : wire60);
        end
      else
        begin
          reg61 <= ($unsigned($unsigned((~|(wire56 ^ wire51)))) >= (~|wire51[(4'hf):(1'h1)]));
          reg62 <= $unsigned(wire55);
          reg63 <= (($signed({(reg61 ? wire58 : wire48),
                  {(8'had), (8'ha8)}}) || ($unsigned(((8'hab) - wire58)) ?
                  $signed((&reg61)) : ((reg61 ^~ wire56) ^ wire50[(3'h5):(2'h3)]))) ?
              (wire56[(4'hf):(4'h8)] ?
                  {(wire59[(3'h5):(1'h1)] ?
                          $signed(wire60) : wire46)} : (wire47[(4'h9):(2'h3)] ^ ($signed((8'ha2)) ?
                      {wire51, reg62} : (|(8'haf))))) : wire58);
        end
      reg64 <= {wire58[(5'h14):(3'h4)], $signed(reg63)};
    end
  assign wire65 = (~^(~&((8'ha0) < wire53)));
  assign wire66 = $signed(wire50[(3'h4):(3'h4)]);
  assign wire67 = wire59[(4'hc):(1'h1)];
  assign wire68 = (((8'hb9) ?
                          ((&$unsigned(reg64)) ?
                              wire51[(3'h4):(2'h3)] : $signed(wire52[(2'h2):(1'h1)])) : $unsigned($unsigned({wire56}))) ?
                      (+wire54[(4'hb):(3'h7)]) : wire58[(4'hf):(3'h5)]);
  assign wire69 = {reg62,
                      (((reg64 & $signed((8'hb0))) ?
                          reg61[(1'h1):(1'h1)] : wire65) | wire49[(2'h3):(2'h3)])};
  assign wire70 = wire66[(4'ha):(1'h1)];
endmodule
