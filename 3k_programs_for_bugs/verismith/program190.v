module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1bd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire0;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire signed [(3'h7):(1'h0)] wire185;
  wire [(4'hf):(1'h0)] wire184;
  wire [(5'h15):(1'h0)] wire183;
  wire [(5'h13):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire165;
  reg signed [(3'h5):(1'h0)] reg182 = (1'h0);
  reg [(4'hd):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg180 = (1'h0);
  reg [(2'h2):(1'h0)] reg179 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg176 = (1'h0);
  reg [(5'h12):(1'h0)] reg175 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg174 = (1'h0);
  reg [(4'hd):(1'h0)] reg173 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg172 = (1'h0);
  reg [(4'h9):(1'h0)] reg171 = (1'h0);
  reg [(2'h2):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg169 = (1'h0);
  reg [(5'h10):(1'h0)] reg168 = (1'h0);
  reg [(5'h12):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire185,
                 wire184,
                 wire183,
                 wire4,
                 wire165,
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
                 reg167,
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
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = ($unsigned((+$unsigned(wire1[(1'h0):(1'h0)]))) - (((8'ha4) << ({wire0} & wire3[(3'h5):(3'h4)])) ~^ (((wire1 >> (8'hb1)) * $unsigned(wire2)) ?
                     wire2[(3'h4):(1'h0)] : wire3)));
  always
    @(posedge clk) begin
      if ({wire1[(1'h0):(1'h0)]})
        begin
          reg5 <= $unsigned($signed($signed((^wire1))));
          reg6 <= (((~$unsigned($signed(wire3))) ?
              {$unsigned(reg5),
                  $unsigned((wire2 <= wire0))} : $unsigned($signed((8'ha9)))) <<< $signed(wire2[(2'h2):(2'h2)]));
        end
      else
        begin
          if (((^wire4) && (^~($signed($unsigned(wire4)) + $unsigned(wire2[(3'h4):(2'h3)])))))
            begin
              reg5 <= $signed(wire1);
              reg6 <= $signed({((wire4 ? (~&reg6) : (reg6 != wire4)) ?
                      $signed((~&wire2)) : $unsigned((reg6 - (8'haf)))),
                  wire0[(1'h1):(1'h0)]});
              reg7 <= (~|(+$unsigned((wire2 ?
                  $unsigned(wire4) : (wire3 ? reg6 : wire4)))));
              reg8 <= wire3[(3'h7):(2'h2)];
              reg9 <= reg8[(5'h10):(2'h3)];
            end
          else
            begin
              reg5 <= wire3[(5'h11):(4'h9)];
            end
          if (wire2[(3'h4):(1'h0)])
            begin
              reg10 <= (|$unsigned(((&(|(8'ha5))) ?
                  (8'ha8) : (|{wire3, (8'hbd)}))));
              reg11 <= reg7;
              reg12 <= reg6[(2'h3):(1'h0)];
              reg13 <= ((&($signed(wire1[(1'h0):(1'h0)]) ^ {reg12,
                  (reg12 & wire4)})) && reg11);
              reg14 <= reg13[(4'h9):(3'h4)];
            end
          else
            begin
              reg10 <= reg10;
              reg11 <= wire3[(3'h5):(1'h0)];
            end
          reg15 <= $signed(reg11[(4'h8):(2'h3)]);
          reg16 <= {{$signed($signed({reg13, wire4}))}};
          reg17 <= ((reg7[(2'h3):(2'h3)] ?
              wire0[(3'h4):(2'h3)] : $unsigned(reg13)) && reg5[(2'h2):(1'h0)]);
        end
      reg18 <= wire2[(2'h2):(2'h2)];
      reg19 <= (&$signed({$unsigned($unsigned(reg9))}));
    end
  module20 #() modinst166 (.wire22(reg7), .wire24(reg10), .wire23(reg12), .clk(clk), .wire25(reg15), .wire21(wire1), .y(wire165));
  always
    @(posedge clk) begin
      reg167 <= reg19;
      reg168 <= (~|reg9[(3'h4):(2'h2)]);
      reg169 <= ((($unsigned($unsigned(reg18)) ?
              $signed((reg7 && (8'ha2))) : (~^$unsigned(reg167))) ?
          reg167 : $unsigned($unsigned((+reg19)))) & reg17[(3'h6):(1'h1)]);
      if ($unsigned(wire1))
        begin
          reg170 <= (-(reg11[(3'h4):(1'h1)] * $signed((|reg5))));
          reg171 <= $unsigned(({reg168, reg6[(1'h1):(1'h0)]} ?
              $unsigned((~^$unsigned(reg5))) : $signed({reg5[(3'h5):(1'h1)]})));
          if ((reg12[(3'h5):(3'h4)] <<< {$unsigned(wire0)}))
            begin
              reg172 <= (~^{$unsigned(reg14[(3'h7):(3'h7)]),
                  ((8'ha0) ?
                      (~&$signed(reg5)) : (reg168[(3'h5):(1'h0)] > wire3))});
              reg173 <= ((reg6[(1'h0):(1'h0)] & reg172) ?
                  $signed(((|reg170[(2'h2):(2'h2)]) ?
                      $signed($unsigned(reg12)) : ((wire165 | reg18) ?
                          (|reg15) : (!wire3)))) : (!reg18[(5'h12):(4'he)]));
              reg174 <= {(+((reg7 << (reg7 <<< reg170)) <<< (reg10[(3'h5):(3'h4)] ?
                      {(8'ha7)} : reg167[(1'h1):(1'h1)]))),
                  reg167};
            end
          else
            begin
              reg172 <= reg167[(2'h2):(2'h2)];
              reg173 <= wire3;
              reg174 <= (~|$unsigned((8'hb2)));
            end
          if ($signed($unsigned($signed(wire1))))
            begin
              reg175 <= (($unsigned(wire1) ^~ $unsigned(((reg10 << wire165) | (reg10 ?
                  reg168 : reg6)))) << (reg10 ?
                  reg12 : ((~^$signed(reg12)) ? reg15 : wire4)));
              reg176 <= ($unsigned(reg167[(4'he):(2'h2)]) >> wire0[(1'h0):(1'h0)]);
            end
          else
            begin
              reg175 <= (reg17 ? $signed({(8'hb1)}) : $signed(wire165));
              reg176 <= ($signed((~|($signed(reg174) ?
                  (&reg13) : (reg8 ? reg19 : reg15)))) >= (8'haf));
              reg177 <= ((^(($unsigned((8'h9d)) ? $unsigned(reg10) : (!reg5)) ?
                  $signed($unsigned(reg17)) : reg169[(3'h7):(3'h7)])) <= (-reg9[(3'h6):(3'h4)]));
              reg178 <= (^~$signed($unsigned($signed((-reg10)))));
              reg179 <= (|{wire2, $unsigned($signed((-reg172)))});
            end
          reg180 <= wire4;
        end
      else
        begin
          reg170 <= $signed({$signed((8'haf)),
              (($unsigned(reg172) ? (reg15 - wire2) : $unsigned(reg180)) ?
                  ((reg180 ? reg5 : reg177) ?
                      $unsigned(reg12) : (8'hbc)) : (^$signed((8'h9d))))});
          reg171 <= (((&((+reg9) - reg13[(4'he):(4'he)])) ?
              (8'hac) : (({reg171, reg12} ?
                  $unsigned(reg167) : (|reg9)) == $signed((reg16 >> (8'hb7))))) <= wire1);
          reg172 <= wire1[(2'h2):(1'h0)];
          reg173 <= reg13;
          if (({(reg13[(3'h6):(1'h1)] < $unsigned($signed((8'ha1)))),
                  reg175[(3'h7):(3'h6)]} ?
              (^$unsigned({$signed(reg173),
                  $unsigned(reg16)})) : $unsigned(reg180[(3'h5):(1'h1)])))
            begin
              reg174 <= reg19;
              reg175 <= {{reg176},
                  $unsigned(({(reg15 ^~ reg179)} + ($unsigned(wire1) ?
                      $unsigned(reg5) : reg7[(3'h5):(3'h5)])))};
              reg176 <= reg9;
              reg177 <= (wire4[(4'ha):(4'h9)] ?
                  (reg9[(4'h8):(2'h2)] & wire165[(2'h3):(1'h1)]) : (~|({reg8[(1'h0):(1'h0)],
                      $signed(reg177)} ~^ $unsigned($unsigned(reg19)))));
            end
          else
            begin
              reg174 <= {(((&(reg172 ? reg15 : reg174)) <= (reg167 ?
                      reg14 : ((7'h41) << wire165))) < $unsigned($signed($unsigned(reg179)))),
                  $signed(({(reg176 || reg171), (~|reg175)} ?
                      $unsigned($unsigned((8'ha6))) : ($unsigned(reg173) ?
                          (+reg6) : $unsigned(reg9))))};
            end
        end
      if (reg174)
        begin
          reg181 <= {reg14, {$unsigned($unsigned($unsigned(reg13)))}};
          reg182 <= reg172;
        end
      else
        begin
          reg181 <= (($unsigned($signed(reg15[(4'ha):(3'h7)])) ?
                  (!reg169[(3'h4):(3'h4)]) : $signed((reg10[(4'hd):(3'h7)] ?
                      {(8'hb8), reg12} : $signed(reg19)))) ?
              ((&$signed(reg7[(4'he):(3'h5)])) ?
                  {$signed($signed(reg169))} : $unsigned(reg11)) : $signed((~^(8'haa))));
        end
    end
  assign wire183 = reg170[(1'h0):(1'h0)];
  assign wire184 = (reg13 >>> $unsigned(reg9));
  assign wire185 = reg172[(2'h2):(1'h0)];
endmodule

module module20
#(parameter param163 = ((~((+((8'h9d) >= (8'ha4))) ^~ ((&(8'ha9)) ? {(8'h9f), (8'hb2)} : (!(8'ha6))))) >= ((-(8'ha5)) - ((((8'hb8) ? (8'ha7) : (8'ha9)) ? (^~(8'hb4)) : ((8'hac) - (7'h41))) ? (8'ha7) : ((~^(8'hb6)) | ((8'haa) ? (8'hbb) : (8'hae)))))), 
parameter param164 = {(-((8'h9d) * {(^~param163), param163}))})
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire25;
  input wire signed [(4'hb):(1'h0)] wire24;
  input wire signed [(5'h14):(1'h0)] wire23;
  input wire signed [(5'h13):(1'h0)] wire22;
  input wire [(2'h2):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire160;
  wire [(2'h3):(1'h0)] wire159;
  wire [(4'hc):(1'h0)] wire158;
  wire signed [(5'h12):(1'h0)] wire157;
  wire [(5'h15):(1'h0)] wire145;
  wire [(5'h10):(1'h0)] wire52;
  wire [(4'hb):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire96;
  wire [(4'hb):(1'h0)] wire143;
  reg [(4'hb):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg161 = (1'h0);
  reg [(4'h8):(1'h0)] reg156 = (1'h0);
  reg [(4'h9):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg154 = (1'h0);
  reg [(4'hc):(1'h0)] reg153 = (1'h0);
  reg [(5'h10):(1'h0)] reg152 = (1'h0);
  reg [(3'h5):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg148 = (1'h0);
  reg [(5'h11):(1'h0)] reg147 = (1'h0);
  reg [(3'h7):(1'h0)] reg146 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire145,
                 wire52,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire54,
                 wire96,
                 wire143,
                 reg162,
                 reg161,
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
                 (1'h0)};
  assign wire26 = (8'ha5);
  assign wire27 = $signed((((8'had) ?
                          ($unsigned((8'hbe)) - $signed((8'ha3))) : (wire25 ?
                              wire22[(4'ha):(4'h8)] : wire22[(3'h5):(2'h2)])) ?
                      $unsigned({$unsigned(wire25)}) : {((wire24 ?
                              wire24 : (8'hac)) ^~ (&(8'hb7))),
                          $signed($signed((7'h41)))}));
  assign wire28 = $signed(((wire27 >= $signed($signed(wire24))) >>> $unsigned(wire25[(3'h5):(2'h3)])));
  assign wire29 = ($signed((~&((|wire22) ? (wire25 ~^ wire28) : (~&wire21)))) ?
                      $signed({((wire26 ?
                              (8'h9f) : wire21) <<< (wire28 != wire23))}) : ($signed(((8'hac) ?
                          $signed(wire25) : (~|wire21))) || wire21[(1'h0):(1'h0)]));
  assign wire30 = wire23;
  module31 #() modinst53 (.y(wire52), .wire36(wire23), .wire32(wire28), .wire33(wire30), .wire35(wire26), .wire34(wire29), .clk(clk));
  assign wire54 = $unsigned(wire29);
  module55 #() modinst97 (wire96, clk, wire30, wire22, wire28, wire23);
  module98 #() modinst144 (wire143, clk, wire28, wire25, wire26, wire52, wire23);
  assign wire145 = (8'h9f);
  always
    @(posedge clk) begin
      reg146 <= wire28;
      reg147 <= (wire24[(4'h9):(1'h1)] ?
          (((wire52 ? (8'ha4) : $unsigned((8'hb3))) < wire28) ?
              wire143[(4'h8):(3'h5)] : ((~wire26) & wire26[(1'h0):(1'h0)])) : wire28[(3'h5):(3'h4)]);
      if (wire52)
        begin
          reg148 <= (wire28[(5'h12):(2'h3)] ?
              $signed($signed((7'h40))) : (wire24[(3'h4):(1'h0)] ?
                  $unsigned((+(reg147 ?
                      (8'ha0) : wire52))) : wire21[(1'h0):(1'h0)]));
        end
      else
        begin
          reg148 <= {($unsigned((^~$unsigned(reg148))) ?
                  {((wire25 >> wire26) & reg148[(1'h1):(1'h1)])} : (~&$unsigned($signed(reg148))))};
          reg149 <= $signed(wire24[(2'h3):(2'h2)]);
          reg150 <= (wire145 ^ (wire28[(4'hc):(4'hb)] ?
              (wire29[(2'h2):(1'h0)] ?
                  wire30[(3'h4):(1'h1)] : wire23) : ($unsigned((reg148 >> wire143)) ^~ wire23)));
          if ($signed((wire143[(2'h3):(1'h1)] > $unsigned((wire52 <<< {reg149})))))
            begin
              reg151 <= (((+{$signed(wire24),
                      (wire28 >> wire23)}) != $signed(reg148)) ?
                  $unsigned(wire25) : $unsigned(({(reg147 ? reg147 : reg150),
                      (wire29 >> wire52)} + wire54[(4'hb):(1'h0)])));
              reg152 <= ($unsigned((&((reg146 ?
                      wire27 : wire28) > $unsigned(wire54)))) ?
                  (~&wire143) : $unsigned(wire54));
              reg153 <= $unsigned((wire143[(3'h6):(2'h2)] ?
                  {reg146} : $unsigned($signed(wire29))));
              reg154 <= (!(^{$unsigned(wire96),
                  $signed((wire143 ? reg146 : wire26))}));
              reg155 <= $signed($signed((^((wire30 ?
                  reg147 : wire23) <<< (~&wire96)))));
            end
          else
            begin
              reg151 <= (8'hbd);
              reg152 <= wire28[(4'hf):(1'h0)];
              reg153 <= (7'h42);
              reg154 <= ($signed($unsigned(wire27)) ?
                  ({wire24} > {wire54,
                      $unsigned(((8'h9f) ? (8'ha1) : wire21))}) : ({reg147,
                          $unsigned((8'ha6))} ?
                      $unsigned((~|wire29)) : {($unsigned(wire25) == (+wire27))}));
              reg155 <= (8'hb5);
            end
        end
      reg156 <= (reg149[(4'hf):(1'h1)] ?
          $signed($unsigned((wire54 <<< (wire30 * reg152)))) : wire22[(4'he):(2'h3)]);
    end
  assign wire157 = (($signed(((+reg149) <<< wire22)) * (reg151[(1'h0):(1'h0)] ^~ $unsigned((~reg156)))) ?
                       (^wire25[(4'hb):(4'h8)]) : reg150[(1'h1):(1'h0)]);
  assign wire158 = wire26;
  assign wire159 = $signed((~&$signed(wire27)));
  assign wire160 = wire143;
  always
    @(posedge clk) begin
      reg161 <= ($unsigned((wire30[(1'h0):(1'h0)] ?
          (-$signed(wire21)) : wire21)) <= wire25[(2'h3):(2'h2)]);
      reg162 <= (7'h41);
    end
endmodule

module module98
#(parameter param141 = ((({((8'ha2) | (8'ha4))} ? (((7'h44) ? (8'hb4) : (8'hac)) ? (~&(8'hb6)) : (~^(7'h43))) : (^~{(8'ha9), (8'hb6)})) ? {(((7'h40) ? (8'hb0) : (8'hb2)) * (8'hb4)), ({(8'h9e), (8'h9d)} ~^ (~(7'h42)))} : {(&((7'h42) < (8'hb6))), (((8'hbb) ? (8'ha1) : (8'ha5)) ? (~^(8'ha1)) : ((8'hba) ? (8'ha5) : (8'hb4)))}) ? (~(^(((8'ha3) ? (8'hb2) : (8'had)) != {(8'ha9), (8'hbb)}))) : ((~^(^(~^(7'h41)))) ? (~(+(+(8'hb1)))) : ({((8'h9d) ? (8'hb4) : (8'ha9)), {(8'hac)}} ? (((8'hb1) ? (8'hbf) : (8'hab)) > (-(8'ha7))) : ((&(7'h43)) || ((8'hb6) ^~ (8'ha4)))))), 
parameter param142 = param141)
(y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'h1d8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire103;
  input wire [(4'hc):(1'h0)] wire102;
  input wire [(5'h10):(1'h0)] wire101;
  input wire signed [(3'h4):(1'h0)] wire100;
  input wire signed [(3'h5):(1'h0)] wire99;
  wire signed [(2'h3):(1'h0)] wire140;
  wire [(5'h12):(1'h0)] wire139;
  wire [(5'h14):(1'h0)] wire138;
  wire [(5'h14):(1'h0)] wire124;
  wire [(2'h3):(1'h0)] wire123;
  wire [(4'hf):(1'h0)] wire122;
  wire signed [(3'h7):(1'h0)] wire121;
  wire [(3'h5):(1'h0)] wire120;
  wire signed [(4'hb):(1'h0)] wire119;
  wire [(3'h6):(1'h0)] wire118;
  wire [(5'h13):(1'h0)] wire117;
  wire [(2'h3):(1'h0)] wire116;
  wire signed [(5'h13):(1'h0)] wire115;
  wire signed [(3'h5):(1'h0)] wire114;
  wire [(2'h3):(1'h0)] wire113;
  wire [(5'h15):(1'h0)] wire112;
  wire signed [(4'he):(1'h0)] wire110;
  wire signed [(3'h7):(1'h0)] wire105;
  wire signed [(5'h10):(1'h0)] wire104;
  reg signed [(5'h13):(1'h0)] reg137 = (1'h0);
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(5'h15):(1'h0)] reg135 = (1'h0);
  reg [(4'h9):(1'h0)] reg134 = (1'h0);
  reg [(4'hd):(1'h0)] reg133 = (1'h0);
  reg [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg129 = (1'h0);
  reg signed [(4'he):(1'h0)] reg128 = (1'h0);
  reg [(5'h10):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg125 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg106 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire138,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire110,
                 wire105,
                 wire104,
                 reg137,
                 reg136,
                 reg135,
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
                 reg111,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire104 = wire103[(4'ha):(4'h8)];
  assign wire105 = $signed(((wire104[(4'hc):(2'h3)] ?
                       (wire100 ?
                           (wire102 ? wire101 : wire101) : {(7'h43),
                               wire102}) : $unsigned((wire104 ?
                           wire104 : wire102))) <= ({(wire104 ?
                           wire104 : wire101),
                       (~^wire100)} < $signed(wire100))));
  always
    @(posedge clk) begin
      reg106 <= {wire99, wire99[(1'h0):(1'h0)]};
      reg107 <= (|$signed({$unsigned((reg106 ? reg106 : wire103)), reg106}));
      reg108 <= $signed((~|reg106));
      reg109 <= (&{$signed(($signed((8'hb6)) ? (&wire105) : wire103)),
          $signed((~^(~^reg107)))});
    end
  assign wire110 = $unsigned((((~|(reg108 >> (8'had))) ?
                           ($unsigned(wire101) ?
                               reg106 : reg108[(3'h4):(2'h2)]) : ($signed(wire101) ?
                               (&reg108) : $unsigned(wire100))) ?
                       {(wire104[(2'h2):(2'h2)] ?
                               (reg106 ?
                                   wire105 : wire104) : wire102[(3'h5):(2'h2)])} : (^((^wire104) - (^~(7'h42))))));
  always
    @(posedge clk) begin
      reg111 <= $signed(($unsigned(reg108[(4'hd):(3'h6)]) ~^ (~^wire110[(1'h1):(1'h0)])));
    end
  assign wire112 = $signed(reg111[(4'he):(4'h8)]);
  assign wire113 = wire100[(1'h0):(1'h0)];
  assign wire114 = $unsigned(($unsigned(($unsigned((8'hbb)) ?
                           reg109 : (~(8'hb2)))) ?
                       (|$unsigned({wire112,
                           wire104})) : (reg106[(4'hb):(4'h8)] == (reg107 ?
                           reg109[(4'ha):(1'h0)] : $signed(wire105)))));
  assign wire115 = $unsigned(((wire105[(1'h0):(1'h0)] != (~|(wire103 ?
                       wire112 : wire113))) >= ({((8'hb1) ?
                           reg109 : (8'ha6))} ^ ($signed((8'ha5)) | (^~(7'h43))))));
  assign wire116 = $signed(({$unsigned((reg106 ?
                           wire103 : wire112))} + $signed(reg107)));
  assign wire117 = $unsigned(reg106);
  assign wire118 = wire101;
  assign wire119 = {wire101[(2'h3):(2'h3)]};
  assign wire120 = wire105;
  assign wire121 = $signed(((((~|reg111) ?
                           $signed(reg108) : {(8'ha3)}) ~^ wire116[(1'h1):(1'h1)]) ?
                       $signed($unsigned(wire112[(3'h7):(3'h4)])) : ($unsigned($signed(reg109)) >= wire100)));
  assign wire122 = reg107;
  assign wire123 = $unsigned(wire105[(1'h1):(1'h1)]);
  assign wire124 = ($signed($signed((8'h9f))) ^~ wire119[(4'ha):(2'h2)]);
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((wire119[(1'h0):(1'h0)] ?
          $signed(((8'hba) != wire99)) : wire118[(1'h1):(1'h0)]))))
        begin
          reg125 <= reg106[(4'h9):(1'h0)];
          reg126 <= ($signed((^~$signed({wire121}))) ?
              ($signed((wire115[(3'h5):(1'h0)] & (reg108 ?
                      wire112 : wire116))) ?
                  (((~^(8'hb9)) << $signed(wire110)) ?
                      $signed((wire115 < reg108)) : {$signed(wire115)}) : (!$unsigned({wire103,
                      wire105}))) : wire102[(3'h4):(2'h2)]);
          if ((wire113[(2'h3):(1'h1)] ?
              $unsigned((|wire102)) : (-(+$signed((reg106 ?
                  wire113 : (7'h42)))))))
            begin
              reg127 <= $unsigned(wire113);
              reg128 <= (wire119 ?
                  (wire115[(4'hf):(4'hb)] >= (({wire99,
                      reg108} <= reg127) < (~|((8'hb2) ?
                      wire118 : wire124)))) : (wire110 ?
                      (~^$signed({reg111})) : (|(|{(8'ha5), wire124}))));
            end
          else
            begin
              reg127 <= $signed($unsigned((~&reg128)));
              reg128 <= wire102[(3'h7):(2'h3)];
              reg129 <= (~^($unsigned(wire114) ?
                  wire112 : ({$unsigned(wire115),
                      $unsigned(wire116)} ^~ (reg108[(3'h6):(3'h6)] >= {wire110,
                      reg106}))));
            end
        end
      else
        begin
          if ($signed($unsigned(((reg111[(4'he):(1'h0)] < wire116[(1'h1):(1'h0)]) ?
              (~{wire118}) : (~^reg128)))))
            begin
              reg125 <= (wire116 ~^ (wire101[(4'hf):(4'hb)] ^~ $signed($unsigned((~^reg129)))));
              reg126 <= reg108[(4'ha):(1'h0)];
              reg127 <= $signed($unsigned(wire104[(4'hf):(3'h6)]));
            end
          else
            begin
              reg125 <= (($signed(wire123) ?
                  wire99[(2'h2):(1'h1)] : ($unsigned($unsigned(wire112)) ?
                      wire100 : $unsigned((wire105 ?
                          wire99 : reg109)))) >>> (~&reg126));
              reg126 <= {$signed(wire101)};
              reg127 <= (^$unsigned((~|wire116)));
            end
        end
      reg130 <= reg126[(2'h2):(2'h2)];
      if ($signed((|($signed({reg127,
          (8'hb7)}) >>> (~&wire105[(2'h3):(1'h1)])))))
        begin
          reg131 <= wire112;
          if ((wire120 << $unsigned(($unsigned((~(8'hb2))) | (((8'ha2) ~^ wire117) ?
              reg129[(2'h3):(2'h3)] : wire100[(1'h0):(1'h0)])))))
            begin
              reg132 <= $signed($unsigned(reg106[(3'h4):(2'h2)]));
              reg133 <= $unsigned($signed(wire101));
              reg134 <= ($unsigned(wire118[(1'h0):(1'h0)]) | wire103[(3'h7):(3'h6)]);
              reg135 <= {(wire124[(3'h5):(3'h4)] * (-$unsigned((reg130 ?
                      (8'hb1) : wire99))))};
              reg136 <= (($unsigned(wire121) - $unsigned($unsigned($unsigned(wire118)))) ?
                  $unsigned((wire112[(5'h14):(5'h14)] ?
                      $unsigned((-reg106)) : $unsigned((reg111 & (8'hac))))) : {$signed(reg111),
                      (!$unsigned($unsigned(reg107)))});
            end
          else
            begin
              reg132 <= {({$signed($signed(wire99))} ?
                      $unsigned(reg131[(2'h2):(2'h2)]) : (reg129[(1'h1):(1'h1)] ?
                          (reg125[(2'h3):(2'h2)] ?
                              (wire118 >>> reg133) : (+reg136)) : reg106)),
                  reg132};
            end
          reg137 <= ((!reg109[(3'h7):(3'h6)]) ?
              reg109 : (($unsigned((~^reg126)) >> (-(reg107 ?
                  reg130 : (8'ha0)))) & $signed({$unsigned(reg131)})));
        end
      else
        begin
          reg131 <= ((~$signed((~(~wire104)))) ?
              (reg108[(4'hd):(4'hc)] ?
                  wire117 : $signed({(8'hb0),
                      reg125[(1'h1):(1'h0)]})) : wire103);
          if (({(~|reg135[(1'h1):(1'h0)])} && {reg136}))
            begin
              reg132 <= (reg130 ?
                  wire121[(1'h0):(1'h0)] : ({(reg107[(1'h0):(1'h0)] ?
                          (8'hb1) : $signed(wire99))} == $unsigned(((reg109 ?
                          wire105 : reg133) ?
                      (^reg134) : (|reg135)))));
              reg133 <= reg134;
              reg134 <= $signed((~|reg127));
              reg135 <= reg135[(3'h4):(2'h3)];
              reg136 <= ($signed((~$unsigned($unsigned(wire119)))) ?
                  {{$unsigned(reg135)},
                      $signed(((reg125 ^ wire124) ^ (+(7'h40))))} : $unsigned(($signed(wire104[(4'he):(4'h9)]) ?
                      ((reg136 ? wire114 : wire119) ?
                          (reg135 ~^ wire120) : (wire119 ?
                              (8'hb3) : wire122)) : ((reg126 < wire104) ?
                          $signed(reg137) : {wire121, wire103}))));
            end
          else
            begin
              reg132 <= wire122;
              reg133 <= $signed($unsigned(wire100[(3'h4):(2'h2)]));
              reg134 <= {$signed($signed(($signed(reg108) > (-reg126))))};
            end
        end
    end
  assign wire138 = $signed((!(~&wire118)));
  assign wire139 = (wire113[(1'h0):(1'h0)] < (~&(((wire114 | reg108) ?
                       $signed(wire124) : (reg132 ?
                           wire121 : wire115)) && wire117[(4'hf):(4'he)])));
  assign wire140 = ((~&($unsigned((|wire119)) ?
                       reg128[(1'h0):(1'h0)] : wire115[(5'h10):(3'h6)])) ^~ reg130[(4'hb):(2'h3)]);
endmodule

module module55
#(parameter param94 = ((&((((8'haf) ? (7'h40) : (8'ha2)) + ((8'h9d) ~^ (8'ha2))) >= (~(^(8'ha8))))) ^ {((((8'hb8) ? (8'ha9) : (8'ha6)) & ((8'hb2) ? (8'ha3) : (8'h9c))) >> ((~&(8'hbd)) ? (+(8'ha4)) : (~^(8'hb6))))}), 
parameter param95 = param94)
(y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'h184):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire59;
  input wire signed [(5'h13):(1'h0)] wire58;
  input wire signed [(5'h12):(1'h0)] wire57;
  input wire signed [(4'ha):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire92;
  wire signed [(5'h14):(1'h0)] wire91;
  wire signed [(3'h6):(1'h0)] wire90;
  wire [(4'ha):(1'h0)] wire89;
  wire signed [(3'h5):(1'h0)] wire88;
  wire [(3'h6):(1'h0)] wire87;
  wire [(3'h5):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire73;
  wire [(5'h14):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire69;
  wire signed [(3'h5):(1'h0)] wire68;
  wire signed [(4'hc):(1'h0)] wire67;
  wire [(5'h13):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire64;
  wire [(4'hc):(1'h0)] wire63;
  wire signed [(5'h14):(1'h0)] wire62;
  wire signed [(4'hc):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire60;
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(5'h13):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire73,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
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
                 reg72,
                 reg65,
                 (1'h0)};
  assign wire60 = wire56[(3'h5):(2'h2)];
  assign wire61 = wire56[(3'h7):(1'h1)];
  assign wire62 = $signed((~&wire56[(4'h9):(2'h2)]));
  assign wire63 = (!(~({(~wire59),
                      wire56[(3'h5):(1'h0)]} * ((wire58 >= wire61) ?
                      wire60 : (wire61 >> wire61)))));
  assign wire64 = (&((~|{$signed(wire57), $signed((8'hb6))}) ?
                      (~&({wire59} ?
                          (&wire60) : $signed((8'ha2)))) : $signed(wire59)));
  always
    @(posedge clk) begin
      reg65 <= {$unsigned({((wire57 ? wire57 : (7'h42)) << $unsigned(wire64)),
              $signed($signed(wire64))})};
    end
  assign wire66 = ((-$signed(wire56)) ?
                      $unsigned($signed({$unsigned(wire58), wire64})) : wire61);
  assign wire67 = reg65[(4'hc):(3'h5)];
  assign wire68 = (wire61[(1'h0):(1'h0)] ?
                      (($unsigned($signed(reg65)) >> wire59) ?
                          wire58 : $unsigned({wire64})) : wire59);
  assign wire69 = wire56;
  assign wire70 = ({(-{(+wire56)}),
                      ({$signed(wire68)} || (!(|wire68)))} * ($signed(($unsigned((8'hb4)) ?
                      wire60 : $signed((7'h42)))) ^~ $signed((~&$signed(wire57)))));
  assign wire71 = (8'had);
  always
    @(posedge clk) begin
      reg72 <= ((wire70[(4'hf):(2'h2)] ? (8'hb1) : wire58[(4'hd):(4'hb)]) ?
          $unsigned($signed($signed($unsigned(reg65)))) : wire69[(4'h9):(1'h1)]);
    end
  assign wire73 = $unsigned({$unsigned((-{wire68}))});
  always
    @(posedge clk) begin
      reg74 <= $signed($signed((~&(!$unsigned(reg72)))));
      reg75 <= wire61;
      reg76 <= ($signed(wire70[(1'h1):(1'h0)]) <= ($signed((~&((8'ha5) ?
          wire57 : wire71))) || wire68[(3'h5):(1'h0)]));
      reg77 <= $signed(((!(((8'hb1) ? wire66 : reg65) <<< (+wire62))) ?
          (($signed((8'h9f)) ?
              $unsigned((8'hb0)) : $signed(wire69)) <= wire68) : (reg72[(2'h2):(1'h0)] != $unsigned($unsigned(wire73)))));
      if ($signed(wire63[(3'h5):(3'h5)]))
        begin
          if ($unsigned($unsigned(($unsigned($unsigned(reg76)) * (wire70[(3'h5):(2'h2)] >= {reg77,
              reg65})))))
            begin
              reg78 <= ((wire73 ^ {wire61[(1'h1):(1'h1)],
                  (+wire64)}) >>> reg65[(3'h6):(2'h2)]);
              reg79 <= wire73;
              reg80 <= (wire68[(2'h3):(2'h2)] ? wire63 : wire59[(3'h7):(3'h7)]);
            end
          else
            begin
              reg78 <= $unsigned((wire56 ?
                  (wire68 ?
                      (8'ha7) : $signed(((8'hbc) ?
                          wire68 : reg80))) : (^{$unsigned(reg72)})));
              reg79 <= $signed(reg65);
              reg80 <= $unsigned(wire63[(1'h1):(1'h1)]);
              reg81 <= $signed($unsigned(reg74[(2'h2):(1'h0)]));
            end
          reg82 <= reg72[(1'h0):(1'h0)];
          if ($signed(reg75[(4'h8):(2'h2)]))
            begin
              reg83 <= ((^($signed(wire68) ~^ ((wire71 ? reg72 : wire69) ?
                      (reg74 ? reg74 : reg78) : (reg80 ? reg76 : wire59)))) ?
                  wire64[(2'h2):(2'h2)] : reg74[(3'h6):(3'h4)]);
              reg84 <= $signed(wire59[(3'h5):(1'h1)]);
              reg85 <= $signed($signed((^$unsigned($unsigned(reg83)))));
            end
          else
            begin
              reg83 <= reg82;
            end
        end
      else
        begin
          reg78 <= reg82[(5'h13):(5'h10)];
          reg79 <= $signed(reg79[(1'h1):(1'h0)]);
          reg80 <= (&(reg85 ?
              $signed($signed((reg84 ?
                  reg82 : (8'hb4)))) : $signed(wire71[(4'h8):(2'h2)])));
        end
    end
  assign wire86 = (-(8'had));
  assign wire87 = wire67[(2'h2):(1'h0)];
  assign wire88 = reg79;
  assign wire89 = (((8'hbc) >= $unsigned((&$signed(wire71)))) < {reg81,
                      $unsigned({(wire86 ? wire67 : (8'hb4))})});
  assign wire90 = $signed($unsigned({(reg72[(2'h3):(2'h2)] ?
                          $signed(reg84) : (reg84 || reg85)),
                      $signed($signed((8'hbc)))}));
  assign wire91 = $unsigned(reg83);
  assign wire92 = {($unsigned($signed(wire88)) | ($unsigned(wire63) >>> ($signed(reg77) <<< (wire64 ?
                          (8'h9d) : reg76))))};
  assign wire93 = (reg79 | $unsigned($unsigned(reg84)));
endmodule

module module31
#(parameter param50 = (+(8'ha6)), 
parameter param51 = param50)
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire36;
  input wire [(5'h14):(1'h0)] wire35;
  input wire signed [(4'hc):(1'h0)] wire34;
  input wire [(3'h5):(1'h0)] wire33;
  input wire signed [(4'hb):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire48;
  wire [(5'h15):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire42;
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire44,
                 wire43,
                 wire42,
                 reg46,
                 reg45,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg37 <= $signed((wire36 ?
          $signed(($unsigned(wire36) ^~ $unsigned((8'hb1)))) : $signed((~|(wire32 ?
              wire35 : (8'hb7))))));
      reg38 <= (^(8'h9c));
      reg39 <= wire36[(3'h6):(3'h6)];
      reg40 <= ($unsigned(wire36[(5'h11):(4'h8)]) || (reg39[(4'he):(3'h7)] ?
          (reg37[(3'h4):(3'h4)] >> {$signed(reg37)}) : (((reg37 <<< (8'ha1)) * {(8'hbd),
              wire34}) ~^ wire33[(2'h3):(1'h0)])));
      reg41 <= wire35[(5'h11):(5'h11)];
    end
  assign wire42 = wire33[(2'h2):(2'h2)];
  assign wire43 = wire34[(4'h9):(2'h3)];
  assign wire44 = (~^{wire43[(3'h4):(3'h4)]});
  always
    @(posedge clk) begin
      reg45 <= (reg37[(3'h5):(2'h2)] << $unsigned(wire44[(2'h2):(1'h0)]));
      reg46 <= (((wire44 ? {(reg40 >> wire35)} : {(wire35 & wire34)}) ?
          wire44 : (reg38[(4'h8):(2'h3)] ?
              $signed((^wire43)) : $signed(wire32))) ^~ {$signed(reg41)});
    end
  assign wire47 = (~(&$signed(reg39)));
  assign wire48 = $unsigned(($unsigned(wire32) == wire43));
  assign wire49 = wire35[(5'h11):(4'h8)];
endmodule
