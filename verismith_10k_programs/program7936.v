module top
#(parameter param163 = (^~{{((!(7'h40)) ~^ ((8'hb5) ? (8'hbf) : (8'hb9))), ((&(7'h43)) <= ((8'hb5) ? (8'hbd) : (8'hb1)))}}), 
parameter param164 = param163)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire160;
  wire signed [(5'h14):(1'h0)] wire159;
  wire [(3'h7):(1'h0)] wire157;
  wire [(5'h10):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg162 = (1'h0);
  reg [(5'h11):(1'h0)] reg161 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire157,
                 wire35,
                 wire33,
                 wire5,
                 wire4,
                 reg162,
                 reg161,
                 (1'h0)};
  assign wire4 = wire2[(2'h3):(1'h0)];
  assign wire5 = (~&((|(8'ha0)) > ({wire3} + {(wire0 < wire3),
                     wire3[(4'h9):(1'h0)]})));
  module6 #() modinst34 (.wire7(wire0), .y(wire33), .wire9(wire3), .wire10(wire5), .clk(clk), .wire8(wire1));
  assign wire35 = wire2;
  module36 #() modinst158 (wire157, clk, wire0, wire35, wire1, wire5);
  assign wire159 = ((+{$unsigned(wire4), wire33}) ?
                       (~&(~(((8'hbe) && wire4) ?
                           (|wire5) : $signed(wire1)))) : (-((wire33 ?
                           $unsigned(wire35) : wire2) == (wire4 ^~ $unsigned(wire35)))));
  assign wire160 = (wire3[(5'h14):(4'hf)] ? wire2 : wire157[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg161 <= wire157[(2'h3):(1'h1)];
      reg162 <= {(+$signed($signed((wire4 ? wire33 : wire160)))),
          (~^{((^~reg161) ? wire157 : $unsigned(wire4)),
              $signed($signed(reg161))})};
    end
endmodule

module module36
#(parameter param156 = ((((^~((8'h9c) ? (8'hb2) : (8'ha2))) | (((8'hb7) <<< (8'hbd)) ^~ ((8'ha8) ? (8'haa) : (8'h9c)))) <<< (&(&(8'hb5)))) - ((~|(((8'h9e) ? (8'hbe) : (8'ha8)) ? (^(8'ha9)) : ((8'hbd) ? (8'hae) : (8'hbd)))) + (&{((7'h44) == (8'hb2)), ((8'ha3) ? (8'hb7) : (8'hbd))}))))
(y, clk, wire37, wire38, wire39, wire40);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire37;
  input wire signed [(5'h10):(1'h0)] wire38;
  input wire signed [(4'ha):(1'h0)] wire39;
  input wire signed [(5'h13):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire91;
  wire [(4'he):(1'h0)] wire93;
  wire [(4'h9):(1'h0)] wire94;
  wire signed [(4'he):(1'h0)] wire95;
  wire [(5'h13):(1'h0)] wire124;
  wire signed [(3'h7):(1'h0)] wire126;
  wire signed [(4'hb):(1'h0)] wire129;
  wire [(5'h12):(1'h0)] wire130;
  wire [(4'h8):(1'h0)] wire131;
  wire signed [(5'h13):(1'h0)] wire132;
  wire signed [(5'h12):(1'h0)] wire133;
  wire signed [(5'h11):(1'h0)] wire134;
  wire [(4'h9):(1'h0)] wire135;
  wire signed [(3'h4):(1'h0)] wire136;
  wire [(4'he):(1'h0)] wire154;
  reg [(4'h8):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg127 = (1'h0);
  assign y = {wire91,
                 wire93,
                 wire94,
                 wire95,
                 wire124,
                 wire126,
                 wire129,
                 wire130,
                 wire131,
                 wire132,
                 wire133,
                 wire134,
                 wire135,
                 wire136,
                 wire154,
                 reg128,
                 reg127,
                 (1'h0)};
  module41 #() modinst92 (wire91, clk, wire40, wire38, wire37, wire39, (8'ha8));
  assign wire93 = $signed($unsigned((7'h42)));
  assign wire94 = $unsigned($signed((wire38 && {$unsigned(wire93)})));
  assign wire95 = $signed((wire93 >= (wire38[(2'h3):(1'h0)] >>> (wire37 ?
                      $signed((8'hb4)) : wire37[(4'hc):(4'hc)]))));
  module96 #() modinst125 (wire124, clk, wire93, wire38, wire95, wire91);
  assign wire126 = $unsigned((wire38[(3'h4):(2'h2)] ?
                       (-wire91[(5'h14):(4'hc)]) : wire95[(4'hc):(3'h5)]));
  always
    @(posedge clk) begin
      reg127 <= $signed((wire93[(1'h0):(1'h0)] + $unsigned($unsigned($signed((8'hac))))));
      reg128 <= (7'h40);
    end
  assign wire129 = $signed((($signed((~^(8'hb2))) << wire39) ?
                       (((!wire39) | (wire37 ?
                           wire124 : wire95)) <<< (-$signed(reg127))) : $signed({$unsigned(reg128)})));
  assign wire130 = ($unsigned((($unsigned(wire37) ?
                           $signed(reg127) : (~^wire124)) <= wire95)) ?
                       {((~(wire93 ? reg128 : wire38)) ?
                               ((^~wire39) == wire124) : $unsigned({wire40}))} : ((~^((~^wire37) ?
                               {wire40} : $unsigned(wire39))) ?
                           $unsigned({(-wire126),
                               (wire37 > (8'ha1))}) : $unsigned($unsigned(reg127))));
  assign wire131 = wire124[(5'h12):(4'ha)];
  assign wire132 = $signed($signed((^($unsigned(wire91) <= $unsigned(wire126)))));
  assign wire133 = (reg128[(3'h5):(1'h1)] ?
                       reg128[(2'h2):(1'h0)] : $signed(wire91[(3'h5):(3'h5)]));
  assign wire134 = {(8'hbf)};
  assign wire135 = (-(^(~^wire40)));
  assign wire136 = (8'hb4);
  module137 #() modinst155 (wire154, clk, wire134, wire94, wire95, wire38, wire132);
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire [(4'hf):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire11;
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  assign y = {wire32,
                 wire11,
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
                 reg12,
                 (1'h0)};
  assign wire11 = $signed(wire9);
  always
    @(posedge clk) begin
      reg12 <= {wire9, wire8[(3'h6):(3'h4)]};
    end
  always
    @(posedge clk) begin
      if ($unsigned(($signed(wire7) ? {$signed($unsigned(reg12))} : (8'hb5))))
        begin
          reg13 <= wire11;
          reg14 <= ($unsigned($signed(wire7)) ?
              $signed(wire7) : {(reg13 ?
                      (((8'hb5) == wire8) ?
                          reg12[(4'ha):(3'h6)] : $signed(reg13)) : wire10[(3'h6):(3'h6)])});
        end
      else
        begin
          reg13 <= $unsigned(($unsigned(wire7[(3'h4):(1'h0)]) ?
              $signed($unsigned((reg14 <<< wire8))) : $unsigned(({wire10,
                      reg14} ?
                  wire7[(4'hb):(4'ha)] : wire8))));
        end
      reg15 <= wire11[(5'h13):(4'h8)];
      reg16 <= (reg15 ?
          $signed((!(^$unsigned((8'hb1))))) : reg12[(3'h7):(2'h2)]);
      reg17 <= reg16;
    end
  always
    @(posedge clk) begin
      if ((reg14 >= $unsigned(wire9)))
        begin
          reg18 <= $unsigned((7'h40));
          if ($signed((^wire9[(4'h9):(1'h0)])))
            begin
              reg19 <= ((~^($unsigned({wire10, (8'ha6)}) ?
                  ($unsigned((8'ha2)) & $signed((8'hb0))) : reg12)) || $signed((8'ha0)));
              reg20 <= {({reg19[(1'h0):(1'h0)],
                      ((wire9 != (8'hb2)) <= (8'ha9))} <<< ((reg14[(4'he):(1'h0)] ?
                          $unsigned(wire11) : wire11[(5'h12):(4'h8)]) ?
                      (wire11 != (wire10 < reg12)) : reg14)),
                  (+((~|$signed(wire7)) * {$unsigned(reg13)}))};
              reg21 <= ((!$unsigned(wire11)) * (reg16 ~^ (~&(~|$unsigned(reg19)))));
              reg22 <= reg18;
            end
          else
            begin
              reg19 <= (^~(^~reg21));
              reg20 <= $unsigned(reg18[(3'h6):(3'h5)]);
              reg21 <= (reg16 ?
                  ($signed($signed((8'hba))) ?
                      (^~{(-reg15)}) : (^~{(wire8 ? (8'ha3) : reg18),
                          wire8})) : {reg19[(1'h0):(1'h0)],
                      reg18[(3'h4):(2'h3)]});
              reg22 <= $unsigned((8'hbe));
            end
        end
      else
        begin
          reg18 <= $unsigned($signed(reg19[(3'h4):(1'h0)]));
          reg19 <= (reg12[(4'ha):(4'h8)] ?
              (&$signed({((7'h41) ? reg21 : reg17),
                  (8'ha5)})) : ($signed($signed($signed((8'hb0)))) == ((8'ha5) < ($signed(reg18) | (~|(8'had))))));
          reg20 <= reg18[(2'h3):(2'h3)];
          reg21 <= wire10[(1'h1):(1'h1)];
          reg22 <= wire8[(2'h2):(1'h1)];
        end
      if ((($signed($unsigned({(8'hbc), (8'hb5)})) ?
              (($signed((8'haf)) & reg16) ?
                  ((reg20 ? reg20 : reg21) ?
                      {reg16,
                          (8'h9c)} : (~reg16)) : {(^~reg18)}) : wire8[(1'h0):(1'h0)]) ?
          (^~($signed(reg22[(4'h9):(3'h6)]) ?
              $signed($unsigned(reg17)) : (~^$unsigned(wire9)))) : {((8'hbe) < reg17)}))
        begin
          reg23 <= ({(^wire8)} - $signed({$signed($unsigned(reg16))}));
          reg24 <= $unsigned((~|{(|$signed((8'hbf))), reg15[(3'h7):(3'h6)]}));
          reg25 <= $unsigned({reg14[(4'h9):(3'h6)], (8'ha6)});
          reg26 <= {(^~wire8[(2'h2):(2'h2)])};
          reg27 <= reg26;
        end
      else
        begin
          reg23 <= (reg22 ?
              $signed($signed($unsigned((reg17 ?
                  wire10 : reg14)))) : ((|(|$signed(wire9))) != (!reg19[(2'h2):(1'h0)])));
          reg24 <= reg23[(4'hc):(4'hb)];
          reg25 <= reg16[(1'h0):(1'h0)];
          reg26 <= reg17[(4'h8):(4'h8)];
        end
      reg28 <= $unsigned($signed((($signed(reg12) ?
              (wire7 - reg23) : (reg26 <= reg14)) ?
          reg19[(3'h5):(1'h1)] : ((8'hb1) ^~ reg23))));
      reg29 <= $unsigned((wire11[(4'hd):(4'hb)] >> reg22[(4'h9):(1'h0)]));
      if (((^{({wire7, reg19} ? {reg16} : $unsigned(reg13)),
          reg20[(2'h2):(1'h1)]}) && $signed({reg28[(4'h9):(3'h5)], reg28})))
        begin
          reg30 <= (~^$signed(reg27));
          reg31 <= (+($signed(reg12[(1'h0):(1'h0)]) ?
              $signed($signed((reg18 <= reg30))) : $signed(wire9[(1'h1):(1'h1)])));
        end
      else
        begin
          reg30 <= {(^reg31)};
          reg31 <= reg27[(1'h0):(1'h0)];
        end
    end
  assign wire32 = {$signed((reg28[(1'h1):(1'h0)] + reg21[(5'h10):(3'h6)])),
                      ((-wire8[(4'h8):(1'h1)]) ? wire7 : reg16)};
endmodule

module module137  (y, clk, wire142, wire141, wire140, wire139, wire138);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire142;
  input wire [(4'h8):(1'h0)] wire141;
  input wire [(4'he):(1'h0)] wire140;
  input wire signed [(2'h2):(1'h0)] wire139;
  input wire signed [(5'h11):(1'h0)] wire138;
  wire signed [(4'h8):(1'h0)] wire153;
  wire signed [(3'h7):(1'h0)] wire152;
  wire [(5'h15):(1'h0)] wire151;
  wire signed [(2'h3):(1'h0)] wire150;
  wire signed [(4'ha):(1'h0)] wire149;
  wire [(4'h8):(1'h0)] wire148;
  wire signed [(4'hc):(1'h0)] wire147;
  wire signed [(3'h4):(1'h0)] wire146;
  wire [(5'h12):(1'h0)] wire145;
  wire signed [(4'hf):(1'h0)] wire144;
  wire signed [(5'h12):(1'h0)] wire143;
  assign y = {wire153,
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
                 (1'h0)};
  assign wire143 = {(wire139 & wire140)};
  assign wire144 = wire138[(4'hb):(1'h1)];
  assign wire145 = wire141[(3'h6):(2'h3)];
  assign wire146 = ((^{wire142}) >= $signed((|$signed($signed(wire140)))));
  assign wire147 = (~|(8'ha7));
  assign wire148 = wire147;
  assign wire149 = wire148;
  assign wire150 = $signed(({(((7'h44) ~^ wire147) ?
                           wire149 : (7'h41))} ^ (((wire149 ?
                       wire140 : wire143) & {wire149, wire148}) ~^ {(wire138 ?
                           wire141 : (8'ha1)),
                       wire142})));
  assign wire151 = (8'ha0);
  assign wire152 = $unsigned($signed({$signed({wire147}), wire145}));
  assign wire153 = ($unsigned((wire145[(4'hf):(4'hd)] >= ($signed(wire146) || (wire147 ?
                       (8'hae) : (8'hbe))))) <<< (wire142 << wire148[(2'h2):(2'h2)]));
endmodule

module module96
#(parameter param123 = (((^~(~^(~|(8'h9e)))) ? (-((+(7'h41)) ? (|(8'hb1)) : ((8'h9f) ? (8'hb5) : (8'hbd)))) : (+{(8'hba), ((8'hac) | (8'hbf))})) ? (((~|(8'hb6)) ~^ (((8'hbe) - (8'ha0)) ? (^(8'h9c)) : ((8'hbb) ? (7'h40) : (8'hb2)))) <<< (|(~|{(8'h9c)}))) : (~&((~&(+(8'hbd))) ? {(~^(8'hac)), ((8'hbc) || (8'hb0))} : ((~|(8'had)) * (^~(8'hb6)))))))
(y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire100;
  input wire signed [(4'ha):(1'h0)] wire99;
  input wire [(3'h6):(1'h0)] wire98;
  input wire [(3'h4):(1'h0)] wire97;
  wire [(2'h2):(1'h0)] wire122;
  wire [(3'h6):(1'h0)] wire121;
  wire signed [(4'hd):(1'h0)] wire120;
  wire [(5'h11):(1'h0)] wire119;
  wire signed [(4'hc):(1'h0)] wire118;
  wire signed [(4'hf):(1'h0)] wire114;
  wire [(5'h13):(1'h0)] wire113;
  wire signed [(4'ha):(1'h0)] wire112;
  wire [(4'hf):(1'h0)] wire111;
  wire signed [(5'h15):(1'h0)] wire105;
  wire signed [(2'h3):(1'h0)] wire104;
  wire signed [(4'h8):(1'h0)] wire103;
  wire [(4'hf):(1'h0)] wire102;
  wire [(4'hb):(1'h0)] wire101;
  reg signed [(5'h12):(1'h0)] reg117 = (1'h0);
  reg [(3'h4):(1'h0)] reg116 = (1'h0);
  reg [(4'ha):(1'h0)] reg115 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(4'ha):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg107 = (1'h0);
  reg [(3'h6):(1'h0)] reg106 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 reg117,
                 reg116,
                 reg115,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire101 = wire99[(2'h3):(1'h1)];
  assign wire102 = (-{wire98, ($signed((~^wire101)) && (!wire97))});
  assign wire103 = $unsigned((8'h9c));
  assign wire104 = wire102[(4'hc):(2'h2)];
  assign wire105 = $signed((($signed(wire97) ?
                           (wire102[(2'h3):(1'h1)] ?
                               (wire98 <<< wire102) : wire102[(2'h3):(1'h1)]) : $signed(wire100)) ?
                       $signed($signed(wire98)) : wire101));
  always
    @(posedge clk) begin
      reg106 <= wire98[(2'h2):(1'h1)];
      reg107 <= ($signed((wire98 ?
          (+$signed(wire101)) : (wire102[(1'h1):(1'h0)] == (&(8'hb1))))) != wire105);
      reg108 <= (8'hae);
      reg109 <= $signed(((~^(^reg106)) ? $unsigned(wire102) : wire99));
    end
  always
    @(posedge clk) begin
      reg110 <= (~|$signed(reg109));
    end
  assign wire111 = $signed(wire103[(3'h7):(2'h3)]);
  assign wire112 = wire104;
  assign wire113 = ({$unsigned($unsigned(wire102[(2'h2):(1'h1)]))} ?
                       reg110 : (reg108 >> {((reg108 ^ wire101) ?
                               (wire101 - wire111) : wire99),
                           (^(wire112 < wire103))}));
  assign wire114 = {wire113[(1'h0):(1'h0)], wire103[(3'h7):(3'h6)]};
  always
    @(posedge clk) begin
      reg115 <= (wire112 | wire111[(2'h2):(1'h0)]);
      reg116 <= (reg106 >>> $signed((wire111 ?
          $unsigned($unsigned((8'h9d))) : {{(8'hbb), wire100}})));
      reg117 <= wire99;
    end
  assign wire118 = $unsigned(reg117);
  assign wire119 = wire97;
  assign wire120 = (-wire100);
  assign wire121 = wire105;
  assign wire122 = (~|((^$unsigned(wire104)) ?
                       (^~$signed({wire97})) : (((7'h40) - (reg117 ?
                               wire102 : (8'hbb))) ?
                           {{reg116, wire102}} : ((wire111 > reg109) ?
                               $signed((8'h9d)) : $signed(wire119)))));
endmodule

module module41  (y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'h1df):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire46;
  input wire signed [(5'h10):(1'h0)] wire45;
  input wire [(4'h8):(1'h0)] wire44;
  input wire [(3'h4):(1'h0)] wire43;
  input wire signed [(5'h11):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire90;
  wire [(4'hd):(1'h0)] wire87;
  wire [(4'h9):(1'h0)] wire86;
  wire [(5'h15):(1'h0)] wire85;
  wire signed [(3'h6):(1'h0)] wire84;
  wire signed [(4'h8):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  wire signed [(2'h3):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire [(3'h6):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire47;
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg82 = (1'h0);
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg [(3'h6):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  assign y = {wire90,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire72,
                 wire71,
                 wire70,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 reg89,
                 reg88,
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
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire47 = wire44;
  assign wire48 = wire42;
  assign wire49 = wire45;
  assign wire50 = {wire46[(5'h11):(2'h2)]};
  assign wire51 = ((wire46 < wire48) != wire45);
  assign wire52 = wire42;
  assign wire53 = (wire42[(2'h2):(1'h1)] ?
                      ($signed(((8'hbf) + (wire46 ?
                          wire46 : wire47))) * (((8'hac) ~^ (8'hb3)) || wire51[(3'h5):(2'h3)])) : (~&((^wire50) << ($unsigned((8'hb7)) | (~(8'hbe))))));
  assign wire54 = wire52;
  assign wire55 = (~(8'h9c));
  assign wire56 = (((^~((&wire46) ?
                          $signed((8'hb9)) : $unsigned((8'hb5)))) | wire55[(4'ha):(4'h9)]) ?
                      wire51 : wire52[(4'h8):(3'h5)]);
  always
    @(posedge clk) begin
      if (wire42[(5'h10):(4'hd)])
        begin
          reg57 <= wire45;
        end
      else
        begin
          reg57 <= $unsigned(($signed($signed({(8'h9d)})) * (!(~&(wire48 ?
              wire47 : (8'hb0))))));
          if ((^(|wire49[(3'h4):(2'h3)])))
            begin
              reg58 <= (({wire48[(4'he):(3'h7)]} | wire43) > $unsigned(wire54));
              reg59 <= ({wire48[(4'hc):(4'hc)],
                  (~&(~((8'h9c) ? wire52 : wire44)))} <<< wire54);
            end
          else
            begin
              reg58 <= $unsigned(({(((8'hb1) ~^ wire42) ?
                      {wire55} : (wire49 ? wire50 : wire55)),
                  {{wire56},
                      {(8'h9f),
                          wire54}}} != ($signed(wire56[(2'h2):(1'h0)]) ^ (&wire46))));
              reg59 <= ($signed((8'hb1)) ?
                  wire49[(2'h3):(2'h3)] : ((+$unsigned((wire55 ?
                      wire47 : (8'ha1)))) - (^~$unsigned($unsigned(wire54)))));
              reg60 <= {wire55,
                  ($unsigned(((wire42 ?
                          wire47 : (8'hb8)) >= $unsigned(wire49))) ?
                      ((wire52[(4'hb):(1'h1)] ?
                          reg59 : ((8'h9e) ?
                              (8'haf) : wire52)) >> (^~(wire45 - reg58))) : (wire51[(4'ha):(3'h5)] ?
                          $unsigned(wire53) : $signed(reg57[(3'h7):(3'h5)])))};
              reg61 <= reg58[(3'h7):(3'h6)];
              reg62 <= ((reg57[(1'h0):(1'h0)] - $unsigned(((reg58 <<< wire44) ~^ (8'hbe)))) ?
                  (((!wire47) ? ((7'h43) || (7'h41)) : (8'hbf)) ?
                      $unsigned(wire43[(3'h4):(2'h2)]) : $unsigned($signed((7'h43)))) : wire53[(3'h4):(2'h2)]);
            end
          if ((8'hbb))
            begin
              reg63 <= wire47[(2'h2):(2'h2)];
              reg64 <= (($unsigned(wire50) ~^ {$signed(wire43),
                  reg63}) - $signed($signed(wire55)));
            end
          else
            begin
              reg63 <= wire48;
              reg64 <= $unsigned((+wire56[(3'h4):(2'h3)]));
              reg65 <= $unsigned(wire50);
              reg66 <= {reg63,
                  (|(wire50[(3'h6):(2'h2)] ?
                      (^$unsigned(wire49)) : ((8'hb1) ?
                          wire51[(2'h3):(2'h3)] : $signed((8'hb9)))))};
              reg67 <= ((((((8'hb9) >= reg60) ? (reg66 - reg61) : (+reg63)) ?
                      ((wire50 && wire56) ?
                          (reg57 ? wire51 : wire46) : (wire55 ?
                              wire55 : reg63)) : (8'hbd)) ?
                  $signed((^(wire44 ?
                      wire56 : reg65))) : reg64[(3'h5):(3'h4)]) * (~^$unsigned(((~^reg58) * $unsigned(reg59)))));
            end
          reg68 <= {{wire50[(3'h5):(1'h1)], (^(^$signed(reg61)))},
              ((wire44 || (((8'hb2) ? (8'hbb) : wire45) ?
                  {reg60,
                      reg67} : $unsigned(wire47))) >= ($signed({wire42}) & {wire47[(4'h9):(3'h4)]}))};
          if ($unsigned({wire42[(3'h6):(1'h0)],
              (-($unsigned(reg68) > $unsigned((8'hb7))))}))
            begin
              reg69 <= $unsigned($signed(((^$unsigned(reg64)) ?
                  wire46 : ($signed(reg59) ?
                      wire48[(3'h4):(1'h1)] : $unsigned(wire49)))));
            end
          else
            begin
              reg69 <= (wire49 - (~|(&$signed($unsigned(wire42)))));
            end
        end
    end
  assign wire70 = $unsigned(reg65);
  assign wire71 = $signed($unsigned((~^(^~{reg58, reg68}))));
  assign wire72 = $unsigned(reg68);
  always
    @(posedge clk) begin
      if ((~^(&$unsigned(((wire70 ^ wire45) ?
          $unsigned(reg69) : (reg60 != wire48))))))
        begin
          reg73 <= reg65[(3'h5):(3'h4)];
        end
      else
        begin
          reg73 <= $unsigned(($unsigned($signed((-wire70))) <= $signed(($signed(wire47) ?
              $unsigned(wire54) : (-(8'hab))))));
          reg74 <= reg57[(2'h3):(1'h0)];
          if (((~{(8'ha3)}) ^~ ({$signed($unsigned(reg64)),
                  $unsigned($unsigned(wire71))} ?
              $signed(wire45) : ($unsigned((|reg62)) ?
                  (+{wire45}) : ((reg60 + reg57) || (reg57 ?
                      wire72 : reg68))))))
            begin
              reg75 <= $unsigned(((&wire45[(4'h9):(2'h2)]) || ($unsigned((~^(8'h9e))) ?
                  wire70 : ({reg57, wire71} >= wire72))));
              reg76 <= ({(-reg65)} ?
                  $signed(({$signed(reg75),
                      wire71[(4'h8):(4'h8)]} << (~^reg68))) : {$signed((&$signed(reg68)))});
              reg77 <= $signed(wire71);
            end
          else
            begin
              reg75 <= (^wire53);
              reg76 <= $signed($unsigned((~&$signed(wire49))));
              reg77 <= (reg58 >= $signed($signed(reg75[(3'h5):(2'h3)])));
            end
          reg78 <= wire70[(2'h2):(1'h1)];
          if ((-((~wire70[(2'h2):(2'h2)]) ? (7'h44) : wire56)))
            begin
              reg79 <= wire55[(5'h13):(4'he)];
              reg80 <= $signed(($signed(((~|wire51) ?
                      (wire49 << wire54) : reg62[(2'h2):(2'h2)])) ?
                  $unsigned(reg57) : $unsigned((reg65 - $signed(reg60)))));
              reg81 <= ({{{(reg59 * wire49)},
                          {reg66[(2'h3):(2'h3)], {wire70}}}} ?
                  wire54[(3'h5):(2'h2)] : $signed(((8'hbb) ?
                      wire49[(1'h1):(1'h1)] : {(wire47 == wire48),
                          (~|(8'haf))})));
              reg82 <= (reg62[(2'h2):(2'h2)] <= (reg76[(4'h8):(2'h3)] ?
                  (^(&$unsigned(reg64))) : wire44[(2'h3):(2'h2)]));
              reg83 <= $signed($signed($unsigned($signed((wire44 <= reg61)))));
            end
          else
            begin
              reg79 <= reg65;
            end
        end
    end
  assign wire84 = $unsigned({(|$signed($signed(reg65))), reg66[(3'h4):(2'h2)]});
  assign wire85 = wire51;
  assign wire86 = wire43;
  assign wire87 = $unsigned((($unsigned((~^wire49)) + ($signed((8'h9d)) && (&wire86))) ?
                      wire56 : (wire43[(1'h0):(1'h0)] ?
                          reg63[(3'h6):(3'h4)] : wire43)));
  always
    @(posedge clk) begin
      reg88 <= $signed(wire46);
      reg89 <= wire53[(3'h4):(2'h3)];
    end
  assign wire90 = $signed((({(reg78 ?
                          (8'had) : reg75)} > $unsigned((wire52 >> reg73))) & {reg58}));
endmodule
