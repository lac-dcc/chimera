module top
#(parameter param325 = ((~|(((~(8'h9c)) ? ((8'h9d) ^~ (8'hbe)) : (~(8'ha4))) ? {((8'hb3) ? (8'ha2) : (8'hb4)), ((8'h9c) ? (7'h42) : (8'ha0))} : (((8'ha6) & (8'haa)) ? ((8'hb9) != (8'haa)) : (+(7'h43))))) == ((^~((&(8'hb0)) * (~(8'hb8)))) ? ((^~{(8'ha9), (8'ha8)}) ? (((8'hb4) >>> (8'hb5)) ? ((8'ha3) ~^ (8'had)) : {(8'ha2), (8'hbf)}) : (((8'ha6) ? (8'ha7) : (8'hb8)) >>> (+(8'ha9)))) : (~|{((7'h40) ? (8'hb2) : (7'h40)), (|(8'ha9))}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h19c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire324;
  wire signed [(4'hb):(1'h0)] wire315;
  wire signed [(4'h9):(1'h0)] wire166;
  wire [(4'hd):(1'h0)] wire165;
  wire [(4'hf):(1'h0)] wire164;
  wire signed [(4'h9):(1'h0)] wire163;
  wire [(4'hb):(1'h0)] wire162;
  wire signed [(4'ha):(1'h0)] wire161;
  wire signed [(4'hc):(1'h0)] wire160;
  wire [(4'ha):(1'h0)] wire159;
  wire signed [(5'h12):(1'h0)] wire158;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire156;
  wire [(3'h5):(1'h0)] wire317;
  wire signed [(2'h2):(1'h0)] wire318;
  wire signed [(3'h7):(1'h0)] wire319;
  wire signed [(5'h11):(1'h0)] wire320;
  wire [(5'h14):(1'h0)] wire321;
  wire signed [(5'h14):(1'h0)] wire322;
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  assign y = {wire324,
                 wire315,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire5,
                 wire6,
                 wire18,
                 wire19,
                 wire156,
                 wire317,
                 wire318,
                 wire319,
                 wire320,
                 wire321,
                 wire322,
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
                 (1'h0)};
  assign wire5 = wire0[(2'h2):(1'h1)];
  assign wire6 = (~|$unsigned(wire1[(3'h5):(2'h3)]));
  always
    @(posedge clk) begin
      reg7 <= wire1;
      reg8 <= wire6;
      reg9 <= ((wire4[(4'h8):(3'h6)] ?
              ({$signed(wire1)} ?
                  (~^$unsigned(wire1)) : ($unsigned(wire0) < $signed(wire2))) : $signed(wire1)) ?
          $unsigned(($unsigned({wire1, wire3}) | ($unsigned(wire6) ?
              $unsigned(wire1) : (8'hb5)))) : (($signed($signed(wire1)) ?
                  reg8 : ((wire2 ? wire2 : wire0) != $signed(wire6))) ?
              reg8[(1'h1):(1'h1)] : (~(((8'h9e) ?
                  wire2 : (8'ha4)) == (^~(8'hb9))))));
      if (wire2[(2'h2):(2'h2)])
        begin
          reg10 <= (|wire4[(4'h8):(1'h0)]);
          if ($signed(wire6))
            begin
              reg11 <= (8'had);
              reg12 <= (~&$signed($unsigned(reg11[(3'h4):(2'h2)])));
            end
          else
            begin
              reg11 <= $signed($signed((reg8 ?
                  wire6 : (reg8[(3'h4):(1'h1)] ?
                      wire4[(4'h9):(3'h5)] : reg11[(2'h2):(1'h0)]))));
              reg12 <= reg11[(2'h2):(1'h0)];
            end
          reg13 <= (~&$unsigned(wire2[(2'h2):(1'h0)]));
          if (((^$unsigned(((8'ha2) ?
              $unsigned(wire3) : (wire4 ?
                  reg12 : wire4)))) <<< $signed((~(reg12[(2'h3):(2'h3)] >> {reg8,
              reg7})))))
            begin
              reg14 <= (((^~wire3[(1'h0):(1'h0)]) ?
                  (7'h43) : (&(8'hbf))) && (~^wire2[(3'h6):(1'h1)]));
              reg15 <= $unsigned((~&reg11[(1'h1):(1'h0)]));
              reg16 <= (8'ha8);
              reg17 <= {$unsigned(({$signed(reg12)} ?
                      $unsigned({wire5,
                          wire4}) : $signed(reg13[(1'h0):(1'h0)]))),
                  ((wire5 ~^ (+reg8[(1'h1):(1'h1)])) <<< ($unsigned(reg7) && (reg16[(1'h0):(1'h0)] ^ (reg11 >>> wire0))))};
            end
          else
            begin
              reg14 <= (7'h43);
              reg15 <= reg11;
            end
        end
      else
        begin
          if ($unsigned($unsigned((wire5 ?
              (&reg8[(1'h1):(1'h1)]) : (~wire1[(3'h5):(2'h2)])))))
            begin
              reg10 <= (~^reg10[(2'h3):(1'h0)]);
              reg11 <= wire0[(3'h5):(1'h1)];
            end
          else
            begin
              reg10 <= wire4[(4'ha):(2'h2)];
            end
          if ((-{($signed($signed((8'ha2))) ?
                  reg8[(3'h5):(2'h2)] : wire0[(2'h2):(1'h1)])}))
            begin
              reg12 <= wire1[(4'he):(4'he)];
            end
          else
            begin
              reg12 <= (reg15[(2'h2):(1'h0)] >> ((8'hba) ?
                  (~($signed(reg16) ?
                      $signed(reg13) : reg14[(3'h4):(1'h0)])) : {(~^(reg12 >= reg16))}));
              reg13 <= (reg10[(4'hc):(3'h4)] << wire1);
            end
        end
    end
  assign wire18 = (~($unsigned($signed({reg9})) ?
                      wire4[(2'h3):(1'h1)] : $signed(wire2)));
  assign wire19 = (^~wire4);
  module20 #() modinst157 (.wire21(reg15), .y(wire156), .wire23(wire6), .clk(clk), .wire24(reg17), .wire22(reg8));
  assign wire158 = $unsigned(reg14[(4'hc):(1'h1)]);
  assign wire159 = (&(wire1 ?
                       ({(+reg10), wire3[(1'h1):(1'h1)]} ?
                           ($unsigned(reg7) ?
                               (~|reg15) : $signed((7'h43))) : wire3) : (^wire156[(1'h0):(1'h0)])));
  assign wire160 = (reg12 ?
                       ((~^(+{reg9})) >> reg16) : $unsigned($signed((+$signed(wire5)))));
  assign wire161 = $unsigned((reg12[(2'h2):(1'h0)] > wire19));
  assign wire162 = (~|reg12[(2'h3):(2'h3)]);
  assign wire163 = $unsigned((~(((&(8'h9e)) == $unsigned(reg14)) ?
                       wire6[(3'h7):(1'h0)] : ((^wire161) || (reg17 >= reg13)))));
  assign wire164 = wire159;
  assign wire165 = (reg13 && reg9[(2'h2):(2'h2)]);
  assign wire166 = wire2[(3'h4):(1'h1)];
  module167 #() modinst316 (.wire172(wire159), .wire168(reg12), .clk(clk), .y(wire315), .wire171(wire3), .wire170(reg13), .wire169(wire158));
  assign wire317 = ((wire19 ?
                       (&(~|reg9[(1'h1):(1'h1)])) : $signed(((reg10 && wire18) ?
                           {wire165} : wire315[(3'h4):(1'h1)]))) < wire19);
  assign wire318 = (8'hb8);
  assign wire319 = (($unsigned(wire165) ^ {((~^wire163) ?
                           wire158[(5'h11):(4'he)] : wire165),
                       ((wire18 >>> wire164) + $signed(wire158))}) >> reg13);
  assign wire320 = reg13;
  assign wire321 = $unsigned($signed(wire163));
  module93 #() modinst323 (wire322, clk, reg16, wire320, reg8, reg12);
  assign wire324 = ($signed(reg17[(4'he):(2'h3)]) ?
                       wire3 : $unsigned(((~{wire158}) ?
                           wire322[(4'h8):(1'h0)] : wire158)));
endmodule

module module167  (y, clk, wire172, wire171, wire170, wire169, wire168);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire172;
  input wire signed [(4'hc):(1'h0)] wire171;
  input wire [(5'h10):(1'h0)] wire170;
  input wire [(5'h12):(1'h0)] wire169;
  input wire signed [(5'h11):(1'h0)] wire168;
  wire [(4'hc):(1'h0)] wire314;
  wire signed [(4'h9):(1'h0)] wire313;
  wire [(4'hf):(1'h0)] wire312;
  wire [(4'hc):(1'h0)] wire310;
  wire signed [(4'ha):(1'h0)] wire270;
  wire signed [(5'h15):(1'h0)] wire236;
  wire [(4'hb):(1'h0)] wire208;
  wire signed [(2'h3):(1'h0)] wire207;
  wire signed [(5'h14):(1'h0)] wire205;
  wire [(4'h9):(1'h0)] wire176;
  wire signed [(4'hb):(1'h0)] wire175;
  wire signed [(4'hb):(1'h0)] wire174;
  wire signed [(4'he):(1'h0)] wire173;
  wire [(5'h10):(1'h0)] wire241;
  wire signed [(5'h15):(1'h0)] wire242;
  wire [(3'h7):(1'h0)] wire268;
  reg [(2'h3):(1'h0)] reg271 = (1'h0);
  reg [(3'h6):(1'h0)] reg238 = (1'h0);
  reg [(3'h4):(1'h0)] reg239 = (1'h0);
  reg [(5'h15):(1'h0)] reg240 = (1'h0);
  assign y = {wire314,
                 wire313,
                 wire312,
                 wire310,
                 wire270,
                 wire236,
                 wire208,
                 wire207,
                 wire205,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire241,
                 wire242,
                 wire268,
                 reg271,
                 reg238,
                 reg239,
                 reg240,
                 (1'h0)};
  assign wire173 = $unsigned((wire172[(3'h7):(2'h3)] ?
                       (^wire172[(2'h2):(1'h1)]) : wire170[(1'h1):(1'h1)]));
  assign wire174 = $signed((8'hb9));
  assign wire175 = $signed(((8'ha9) < (^$signed((^~(7'h42))))));
  assign wire176 = ($unsigned({(^~(wire169 && wire174)),
                           (~^$signed(wire170))}) ?
                       ($unsigned(({wire175} ^ wire174[(4'ha):(3'h5)])) * wire168[(3'h5):(2'h2)]) : $signed((wire169 == $signed($signed(wire172)))));
  module177 #() modinst206 (wire205, clk, wire168, wire175, wire170, wire169);
  assign wire207 = wire174[(4'h9):(1'h0)];
  assign wire208 = $signed(($unsigned((~&wire171)) - (8'haa)));
  module209 #() modinst237 (wire236, clk, wire208, wire176, wire171, wire168, wire205);
  always
    @(posedge clk) begin
      reg238 <= ((8'hae) ?
          ($signed($signed($unsigned(wire207))) >= $signed($signed((wire205 ?
              wire169 : wire174)))) : $signed(($signed((~|(8'hbf))) << wire169)));
      reg239 <= (wire207 << wire236[(2'h3):(1'h0)]);
      reg240 <= wire171;
    end
  assign wire241 = (wire174[(4'ha):(1'h0)] && (~$signed($unsigned(wire173))));
  assign wire242 = $signed($unsigned((-$unsigned((!wire170)))));
  module243 #() modinst269 (.wire246(wire169), .wire244(reg240), .clk(clk), .wire245(wire241), .y(wire268), .wire247(wire242));
  assign wire270 = {$unsigned(($unsigned(reg239[(1'h1):(1'h1)]) + ($signed(wire241) ?
                           $unsigned(wire169) : wire169[(2'h3):(2'h3)]))),
                       $unsigned(wire175)};
  always
    @(posedge clk) begin
      reg271 <= wire270;
    end
  module272 #() modinst311 (.wire275(wire173), .clk(clk), .y(wire310), .wire274(wire208), .wire276(wire168), .wire273(wire236));
  assign wire312 = (+(wire236[(5'h10):(1'h0)] ?
                       reg271[(2'h3):(1'h1)] : wire208));
  assign wire313 = (((^(wire169[(2'h3):(1'h1)] ^~ $unsigned((8'hb2)))) | ((wire241 <<< $unsigned(reg271)) ?
                       (+(~wire268)) : ((wire205 >= wire241) >> reg238))) ~^ wire173[(4'h8):(1'h1)]);
  assign wire314 = $unsigned((~$signed($unsigned($signed(wire176)))));
endmodule

module module20
#(parameter param154 = (&{(^(((7'h43) <= (7'h43)) ? (-(8'hbb)) : ((7'h41) < (8'hb9)))), (~&({(8'hbc), (7'h44)} + {(7'h40)}))}), 
parameter param155 = ((param154 | param154) >> {{param154}, ((8'hb2) ^~ (param154 * (|param154)))}))
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire24;
  input wire [(5'h10):(1'h0)] wire23;
  input wire [(5'h13):(1'h0)] wire22;
  input wire signed [(4'h9):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire153;
  wire [(3'h6):(1'h0)] wire152;
  wire [(4'hb):(1'h0)] wire149;
  wire [(4'h9):(1'h0)] wire137;
  wire signed [(4'ha):(1'h0)] wire92;
  wire signed [(4'hd):(1'h0)] wire90;
  wire [(3'h6):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire25;
  reg [(5'h12):(1'h0)] reg151 = (1'h0);
  reg [(5'h10):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg145 = (1'h0);
  reg [(4'ha):(1'h0)] reg144 = (1'h0);
  reg signed [(4'he):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg140 = (1'h0);
  reg signed [(4'he):(1'h0)] reg139 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire149,
                 wire137,
                 wire92,
                 wire90,
                 wire26,
                 wire25,
                 reg151,
                 reg150,
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
                 (1'h0)};
  assign wire25 = (!{((wire24[(1'h1):(1'h0)] == {wire21,
                          wire22}) ^ $unsigned((^~wire22)))});
  assign wire26 = (wire25 ?
                      $signed({(wire24[(2'h2):(2'h2)] ?
                              wire23[(1'h0):(1'h0)] : wire22[(3'h4):(2'h2)])}) : wire23);
  module27 #() modinst91 (.wire29(wire21), .wire30(wire24), .y(wire90), .wire31(wire22), .wire28(wire23), .clk(clk));
  assign wire92 = wire26[(2'h2):(2'h2)];
  module93 #() modinst138 (wire137, clk, wire90, wire21, wire25, wire24);
  always
    @(posedge clk) begin
      if ((($unsigned($signed((wire21 <<< (7'h43)))) ?
              (((!wire92) ^ (wire21 >= wire22)) * ((~|(8'ha0)) == (wire21 ?
                  (8'hac) : wire137))) : wire24[(4'hb):(2'h2)]) ?
          (wire137[(1'h0):(1'h0)] >>> ((^wire90) & wire92[(1'h1):(1'h0)])) : ((&wire25[(1'h0):(1'h0)]) ?
              $signed(({wire24, wire90} ?
                  $signed(wire24) : wire92[(2'h3):(2'h2)])) : $signed(wire24[(5'h10):(5'h10)]))))
        begin
          reg139 <= $unsigned(((~|($signed(wire23) ?
                  ((8'hbf) ? wire137 : wire92) : (wire22 <= wire25))) ?
              $signed($signed((wire25 ? wire137 : wire26))) : {$signed((wire90 ?
                      (8'ha4) : wire137))}));
          if ($signed(wire137))
            begin
              reg140 <= (($unsigned(((wire137 ? wire21 : wire24) ?
                      $unsigned(wire92) : $signed((8'hbd)))) <<< ((wire24 ^ $unsigned(wire137)) < ($signed(wire21) >= (wire23 ?
                      wire26 : wire23)))) ?
                  ({($signed(wire24) > $signed(wire21))} - wire23) : (((+(wire25 <<< wire90)) ?
                          ({(8'ha4),
                              wire21} <<< ((8'hb5) ^ wire137)) : ((wire137 ?
                                  wire25 : wire25) ?
                              $signed(wire92) : $signed(wire22))) ?
                      wire90 : (wire90[(3'h6):(2'h3)] ?
                          (^~(wire22 ?
                              wire92 : wire92)) : $unsigned(wire26[(3'h5):(1'h0)]))));
              reg141 <= ($unsigned($signed($signed($unsigned(wire90)))) >> wire90);
              reg142 <= wire26[(1'h0):(1'h0)];
              reg143 <= (~wire25);
            end
          else
            begin
              reg140 <= wire137;
            end
        end
      else
        begin
          reg139 <= (({$unsigned((wire23 ?
                  reg143 : wire90))} == {{((8'ha3) >>> wire92)},
              ((8'ha2) ? (!wire90) : (reg139 && wire92))}) > (^reg141));
        end
      if ((reg140[(4'hb):(2'h3)] <= $signed($signed(wire90[(4'hb):(4'h9)]))))
        begin
          reg144 <= ((~|($signed($unsigned(reg140)) & (reg140[(4'h8):(4'h8)] >> wire137))) ?
              $unsigned(wire22) : (+(^~$unsigned((wire137 ?
                  reg140 : reg140)))));
          reg145 <= (+((-reg139[(4'hb):(4'hb)]) ?
              $signed($signed((8'hb8))) : ((&wire26[(3'h6):(1'h1)]) ?
                  $signed(reg139[(2'h2):(1'h0)]) : reg139)));
          reg146 <= ((!(~(reg139[(3'h4):(3'h4)] ?
              ((8'h9d) ? reg139 : reg145) : (wire22 ?
                  wire90 : reg140)))) >= ($signed((~&(reg144 ?
              reg140 : (8'h9c)))) < (~|$signed(reg141))));
        end
      else
        begin
          reg144 <= $unsigned(($signed($unsigned($signed(wire137))) ?
              wire26 : reg146));
          reg145 <= ($unsigned((|($unsigned(wire26) >> $unsigned(wire22)))) - $signed((&((!(8'hac)) ?
              (-reg145) : reg139))));
          reg146 <= (~({((reg144 ? wire90 : wire23) ?
                      (reg141 ? wire23 : (7'h40)) : (|reg140)),
                  ($signed((8'hae)) && {wire137})} ?
              $unsigned((wire21[(4'h8):(3'h5)] ? reg140 : reg144)) : (reg145 ?
                  $signed($signed(reg140)) : wire25[(3'h4):(2'h2)])));
          reg147 <= wire24[(5'h10):(3'h7)];
        end
      reg148 <= $signed(($signed(reg144) ?
          $signed((!$signed(reg141))) : reg143[(4'h8):(1'h1)]));
    end
  assign wire149 = {wire90[(2'h2):(2'h2)]};
  always
    @(posedge clk) begin
      reg150 <= wire21;
      reg151 <= ($signed(({{wire21}} ?
              (wire137[(1'h1):(1'h0)] ~^ reg142) : ($unsigned(wire92) & $unsigned((8'ha0))))) ?
          (($unsigned($unsigned(reg144)) || wire92) != $unsigned(($unsigned(reg140) ?
              {reg148} : reg145[(4'hb):(4'hb)]))) : (|(reg140 ~^ $unsigned($signed(reg146)))));
    end
  assign wire152 = (~($signed(($signed(reg151) ?
                       reg147[(3'h4):(2'h2)] : reg139)) ~^ $unsigned($signed($unsigned(wire26)))));
  assign wire153 = wire90[(4'h9):(4'h9)];
endmodule

module module93
#(parameter param136 = {(!((((8'h9f) >= (8'hb7)) ? ((8'h9d) <<< (8'hab)) : ((8'ha2) ? (8'ha5) : (8'ha4))) && {((8'ha6) ? (7'h40) : (8'hb2)), ((8'ha1) ? (8'ha3) : (8'ha8))})), (&(~|{(~(8'hbc)), ((8'had) && (8'hbe))}))})
(y, clk, wire97, wire96, wire95, wire94);
  output wire [(32'h1c8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire97;
  input wire signed [(3'h7):(1'h0)] wire96;
  input wire [(4'h8):(1'h0)] wire95;
  input wire [(3'h7):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire135;
  wire [(4'ha):(1'h0)] wire134;
  wire [(5'h10):(1'h0)] wire132;
  wire [(4'hc):(1'h0)] wire124;
  wire [(4'hc):(1'h0)] wire123;
  wire signed [(5'h12):(1'h0)] wire122;
  wire signed [(2'h3):(1'h0)] wire121;
  wire signed [(4'h8):(1'h0)] wire120;
  wire [(2'h3):(1'h0)] wire99;
  reg signed [(5'h13):(1'h0)] reg133 = (1'h0);
  reg [(4'hf):(1'h0)] reg131 = (1'h0);
  reg [(5'h15):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg119 = (1'h0);
  reg [(3'h5):(1'h0)] reg118 = (1'h0);
  reg [(5'h15):(1'h0)] reg117 = (1'h0);
  reg signed [(4'he):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg115 = (1'h0);
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  reg [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg110 = (1'h0);
  reg [(3'h7):(1'h0)] reg109 = (1'h0);
  reg [(5'h14):(1'h0)] reg108 = (1'h0);
  reg [(5'h11):(1'h0)] reg107 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(3'h7):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg103 = (1'h0);
  reg [(5'h10):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg100 = (1'h0);
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire132,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire99,
                 reg133,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg119,
                 reg118,
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
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg98,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg98 <= ($signed($unsigned($unsigned((wire97 ? wire96 : wire97)))) ?
          {(7'h42)} : wire97);
    end
  assign wire99 = (((8'hab) ^~ wire95) ?
                      (($unsigned((^(8'hbe))) ?
                              $signed(wire95[(1'h1):(1'h1)]) : (^~(~&wire96))) ?
                          ((~$signed(wire95)) - $unsigned({wire95})) : wire95[(2'h3):(2'h3)]) : ($signed((~$unsigned(reg98))) * {($unsigned(wire97) ?
                              (reg98 ? wire96 : wire96) : $signed(reg98)),
                          $signed((~|wire94))}));
  always
    @(posedge clk) begin
      reg100 <= reg98;
      if ({$unsigned(reg100), $signed(wire96[(2'h3):(1'h1)])})
        begin
          reg101 <= {($signed(wire99[(2'h2):(1'h1)]) >>> $signed((&$signed(wire97))))};
          reg102 <= wire99[(2'h2):(2'h2)];
          reg103 <= $unsigned(wire95);
        end
      else
        begin
          reg101 <= (^~$unsigned(reg100));
          reg102 <= wire95[(3'h7):(2'h3)];
          if (({reg101[(2'h3):(1'h0)]} >> reg103[(4'hc):(2'h2)]))
            begin
              reg103 <= (wire99 ^ reg101[(3'h5):(1'h0)]);
              reg104 <= $unsigned(wire95);
            end
          else
            begin
              reg103 <= $unsigned(($signed(({reg100, wire94} ?
                  wire97[(1'h0):(1'h0)] : (wire99 ~^ reg104))) | {$signed($unsigned(reg101))}));
              reg104 <= wire94[(3'h4):(2'h3)];
              reg105 <= $signed((7'h41));
              reg106 <= ((~|(^reg105)) >> $signed($unsigned($unsigned(reg98[(3'h5):(1'h1)]))));
              reg107 <= (|$signed({reg100, (reg105 - (reg100 >> reg104))}));
            end
          if (((|$unsigned(reg101[(1'h0):(1'h0)])) ?
              ((reg107 ?
                      ((reg103 ? wire97 : wire95) ?
                          (reg100 ? reg101 : reg103) : {reg106,
                              reg105}) : reg106[(4'h9):(4'h9)]) ?
                  (wire96[(2'h3):(2'h3)] - {((8'hbf) < reg102)}) : $signed(((&wire97) ?
                      reg107[(3'h7):(3'h7)] : ((8'haf) ?
                          wire96 : reg102)))) : reg105))
            begin
              reg108 <= reg103[(4'h9):(3'h4)];
              reg109 <= $signed((|($unsigned(reg108[(5'h11):(4'h8)]) ?
                  reg103[(4'hc):(3'h6)] : ($signed(reg104) ^~ reg107))));
              reg110 <= {(8'ha8)};
            end
          else
            begin
              reg108 <= ((~reg106) - wire99[(2'h2):(1'h0)]);
              reg109 <= $signed(wire99[(1'h0):(1'h0)]);
              reg110 <= (~^$unsigned((|reg105[(5'h11):(5'h10)])));
              reg111 <= ($signed((&reg103[(5'h10):(1'h1)])) ?
                  (8'ha5) : (^~wire94));
              reg112 <= (~reg104);
            end
          reg113 <= (-wire94[(3'h7):(3'h5)]);
        end
      reg114 <= reg105[(5'h11):(3'h6)];
      if ($unsigned({$signed((~(wire96 ? reg100 : (8'hab)))),
          (reg113 == reg100[(1'h1):(1'h1)])}))
        begin
          reg115 <= $signed($signed(reg109[(1'h0):(1'h0)]));
          reg116 <= (8'hb6);
          reg117 <= reg98[(4'h9):(3'h4)];
          reg118 <= $unsigned($unsigned({(^(~^reg107)),
              ($unsigned(reg114) ^~ (~^reg107))}));
          reg119 <= reg114[(3'h5):(2'h3)];
        end
      else
        begin
          reg115 <= $signed(reg116[(4'hc):(1'h1)]);
        end
    end
  assign wire120 = $unsigned($unsigned((^(^~((8'h9e) <= reg101)))));
  assign wire121 = ({$unsigned(((wire94 && reg104) + $signed(reg104))),
                       (wire97 ?
                           (^~wire94) : (-wire97[(2'h3):(2'h3)]))} & wire97);
  assign wire122 = $unsigned({(reg114[(1'h1):(1'h1)] ?
                           {$signed(reg100),
                               (reg113 | (8'haa))} : reg117[(5'h12):(3'h4)])});
  assign wire123 = (((~(7'h43)) ?
                       $unsigned(reg98[(4'h9):(4'h9)]) : $unsigned(reg104[(1'h1):(1'h1)])) >> reg119[(3'h5):(2'h2)]);
  assign wire124 = $signed((~|((~reg102[(3'h7):(3'h7)]) >> $signed((reg110 >= reg116)))));
  always
    @(posedge clk) begin
      if (($unsigned(((~$signed(reg103)) >= reg106[(2'h3):(2'h2)])) ?
          reg110 : reg110[(3'h5):(1'h0)]))
        begin
          reg125 <= $unsigned((reg106 + reg103));
        end
      else
        begin
          if (({reg112} ?
              ((&reg117) <= {reg104}) : ({$unsigned((reg106 ?
                          (8'h9e) : wire96))} ?
                  (reg105[(5'h12):(2'h3)] | $unsigned({(8'hb7)})) : $signed(((&reg107) ^ $signed(reg109))))))
            begin
              reg125 <= $signed((&(reg105 < ((&reg113) ?
                  $signed(wire121) : {wire122, reg102}))));
            end
          else
            begin
              reg125 <= ((7'h42) ~^ ($signed(reg119[(3'h7):(1'h0)]) ?
                  reg114 : {(8'ha9),
                      (wire94[(2'h3):(2'h3)] + $unsigned(wire96))}));
              reg126 <= $unsigned((~$signed($unsigned((reg104 ?
                  reg113 : (8'h9d))))));
            end
          reg127 <= (-wire97[(4'h9):(3'h6)]);
          reg128 <= ($unsigned(wire123) ?
              $unsigned(($signed((reg100 >= reg106)) ^ $unsigned($unsigned(reg100)))) : $unsigned(reg108[(5'h10):(2'h3)]));
          reg129 <= {$unsigned($unsigned(((reg98 ? reg113 : reg116) ?
                  ((8'haa) ? wire94 : (8'hbf)) : (7'h44)))),
              $signed((~|wire95))};
          reg130 <= (~(reg128 ?
              ({$signed(reg118),
                  reg98} <= {(^~reg100)}) : (^$signed($unsigned(reg109)))));
        end
      reg131 <= $unsigned((reg111[(3'h5):(1'h1)] ?
          $signed({reg126[(5'h10):(4'h9)]}) : $signed((|reg117[(4'h8):(2'h2)]))));
    end
  assign wire132 = $signed((!reg102[(2'h3):(2'h2)]));
  always
    @(posedge clk) begin
      reg133 <= reg119[(5'h11):(3'h7)];
    end
  assign wire134 = $unsigned($signed($unsigned($unsigned((wire132 - wire94)))));
  assign wire135 = $signed((reg114 ?
                       (~|$signed($unsigned(reg116))) : reg114[(2'h3):(2'h3)]));
endmodule

module module27
#(parameter param89 = ((&(~&((~|(8'ha6)) ? {(8'ha9)} : ((8'hae) & (8'h9c))))) == ((~|(^((8'h9d) == (7'h44)))) ~^ ((((8'hb7) || (8'hbe)) ? (^~(8'h9d)) : (-(8'hb6))) ? (((8'had) ^~ (8'hac)) ^ {(8'hb9), (8'hac)}) : (7'h41)))))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h287):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire31;
  input wire signed [(4'hf):(1'h0)] wire30;
  input wire [(4'h9):(1'h0)] wire29;
  input wire [(5'h10):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire58;
  wire [(3'h7):(1'h0)] wire57;
  wire [(3'h7):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire34;
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg [(3'h6):(1'h0)] reg86 = (1'h0);
  reg [(3'h4):(1'h0)] reg85 = (1'h0);
  reg [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(5'h10):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg78 = (1'h0);
  reg [(4'ha):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  assign y = {wire88,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire46,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
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
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg33,
                 reg32,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg32 <= wire29[(4'h8):(1'h1)];
      reg33 <= (!({(reg32 < $signed(wire30))} ?
          ((~$signed(wire28)) ?
              wire28 : (reg32 | (reg32 ? wire30 : wire29))) : ((-wire28) ?
              wire31[(4'he):(4'h8)] : $signed($unsigned((8'ha9))))));
    end
  assign wire34 = wire30[(2'h2):(2'h2)];
  assign wire35 = wire34[(1'h1):(1'h0)];
  assign wire36 = wire34;
  assign wire37 = $signed((wire28[(2'h2):(1'h0)] ?
                      ((8'ha6) >= wire30) : ((|reg33) ?
                          (^~(wire36 - wire28)) : wire31)));
  assign wire38 = ({(((reg33 ? wire30 : wire28) ?
                              wire34 : {wire31}) & ($unsigned(reg32) ?
                              $signed(wire34) : wire29)),
                          (-wire37[(2'h3):(1'h1)])} ?
                      ($unsigned(wire29[(2'h2):(2'h2)]) ?
                          {wire36[(1'h0):(1'h0)],
                              $unsigned(((8'hb8) <= wire36))} : (~(wire34[(2'h2):(2'h2)] * (wire30 > wire28)))) : (($unsigned((wire28 ?
                          (8'hbe) : wire28)) & ($signed(reg33) ?
                          (8'hb1) : wire30)) ~^ wire36[(2'h2):(2'h2)]));
  assign wire39 = {((wire31 ?
                          wire38[(3'h4):(3'h4)] : ({(8'hbe), wire34} ?
                              (wire29 ?
                                  reg33 : (8'hbc)) : (wire29 >= wire28))) | $signed(wire36)),
                      (~wire34[(2'h3):(1'h0)])};
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(wire36[(2'h3):(1'h1)])))
        begin
          reg40 <= ((($unsigned($signed(wire37)) ?
                      $unsigned(((8'hb7) ?
                          wire38 : wire30)) : $signed(reg33[(3'h6):(3'h6)])) ?
                  wire28 : ($unsigned($signed(wire35)) ?
                      (wire37[(2'h2):(1'h0)] == (^~(8'h9f))) : (wire30 > ((8'hab) - wire36)))) ?
              wire37 : $unsigned((wire34[(2'h2):(1'h1)] ~^ ((wire28 || wire35) ?
                  wire37 : (!wire39)))));
          reg41 <= wire37[(2'h2):(2'h2)];
          reg42 <= wire28[(5'h10):(3'h5)];
          reg43 <= (((^~$signed($unsigned((8'hb7)))) ?
              (wire39[(1'h0):(1'h0)] || $unsigned(wire39[(4'hf):(1'h1)])) : (reg42[(5'h10):(1'h1)] ?
                  ((wire39 >> wire34) ?
                      $signed(wire34) : (wire35 >>> wire34)) : ((8'hb4) ?
                      wire31[(3'h6):(3'h5)] : (8'hbc)))) & ((!wire29[(1'h1):(1'h0)]) >>> $unsigned($signed(reg32[(4'h8):(3'h5)]))));
        end
      else
        begin
          reg40 <= wire28;
        end
      reg44 <= reg42[(2'h3):(2'h2)];
      reg45 <= (wire34[(2'h2):(2'h2)] ?
          (~|(($unsigned(wire38) ? (|wire39) : wire38[(5'h14):(5'h14)]) ?
              (8'hb0) : wire36[(3'h4):(2'h3)])) : $signed(wire35[(3'h5):(3'h5)]));
    end
  assign wire46 = $unsigned(reg41[(4'h9):(4'h8)]);
  always
    @(posedge clk) begin
      reg47 <= wire37[(1'h0):(1'h0)];
      reg48 <= reg40;
      reg49 <= wire37[(2'h2):(2'h2)];
      reg50 <= (wire28 ? $unsigned(reg42) : $signed(wire38));
    end
  always
    @(posedge clk) begin
      reg51 <= (reg40[(1'h0):(1'h0)] | $unsigned(reg42[(2'h2):(2'h2)]));
      reg52 <= $unsigned(wire30[(4'ha):(3'h4)]);
      reg53 <= (wire30[(4'hc):(1'h0)] >>> $unsigned((((wire46 <= reg45) ?
          (reg43 ?
              wire35 : wire46) : (wire35 + reg52)) ^ $unsigned($signed(wire39)))));
    end
  assign wire54 = (8'hbe);
  assign wire55 = (reg48[(2'h3):(1'h0)] ?
                      (+wire46[(1'h0):(1'h0)]) : reg52[(4'hc):(4'hb)]);
  assign wire56 = wire29[(4'h9):(2'h3)];
  assign wire57 = $signed((-($signed((!wire37)) ?
                      $signed(reg41) : reg51[(3'h5):(1'h0)])));
  assign wire58 = ((-$signed((+$signed((7'h41))))) ?
                      $unsigned(((8'ha3) > ((wire28 * reg44) ?
                          reg40[(1'h1):(1'h1)] : {reg45}))) : (8'ha8));
  always
    @(posedge clk) begin
      reg59 <= {(-$unsigned(wire34))};
      reg60 <= (^~{(~&((-(8'ha1)) << (wire28 + reg50))),
          (~|$unsigned(wire35))});
      reg61 <= ((8'ha5) ?
          $signed($unsigned($signed((reg48 > (8'hb5))))) : (reg42[(2'h3):(1'h0)] && reg60[(1'h1):(1'h1)]));
      reg62 <= ($signed((((wire37 & reg40) ? (~&reg60) : reg45) ?
          $unsigned((wire34 ^~ reg32)) : (8'ha3))) ^ ((!wire30[(4'ha):(3'h5)]) ?
          $unsigned((|wire55[(3'h5):(1'h1)])) : ((8'hb7) ?
              wire55[(3'h5):(1'h0)] : ($signed(wire36) <= $unsigned(wire56)))));
    end
  always
    @(posedge clk) begin
      if (((8'hac) ? wire35[(1'h1):(1'h0)] : wire30))
        begin
          reg63 <= {(+reg62),
              {(~reg42[(4'h8):(4'h8)]),
                  $signed(($signed(reg45) ?
                      (wire30 ? reg48 : wire58) : reg50))}};
          if (wire39)
            begin
              reg64 <= ($unsigned({$unsigned((reg62 ? (8'hb0) : reg33))}) ?
                  wire57[(1'h1):(1'h1)] : (8'hb4));
              reg65 <= $unsigned($unsigned($unsigned({{reg44}})));
              reg66 <= reg43;
            end
          else
            begin
              reg64 <= $signed(({(reg62 ?
                      (reg66 ? reg48 : (8'hba)) : $unsigned(reg40)),
                  $signed($unsigned((8'ha9)))} - (!{(~&reg61)})));
            end
          reg67 <= ({$signed(reg33[(1'h0):(1'h0)])} || wire54[(2'h2):(2'h2)]);
          reg68 <= reg52[(2'h2):(1'h1)];
          reg69 <= {{$unsigned(wire46),
                  ((^~(reg43 ? reg52 : wire34)) <<< (reg44 - (reg47 ?
                      reg33 : reg53)))}};
        end
      else
        begin
          if ((~|($unsigned(((wire34 ? wire54 : reg66) && wire39)) ?
              ((reg49[(3'h6):(1'h0)] ?
                      ((8'ha4) ? reg69 : reg43) : (reg40 >> reg66)) ?
                  ((wire46 ^~ reg52) ?
                      (reg45 ? wire58 : reg41) : wire36) : (reg32 > (wire54 ?
                      reg61 : reg59))) : reg65[(2'h3):(2'h3)])))
            begin
              reg63 <= reg68;
              reg64 <= $unsigned($unsigned(reg61));
              reg65 <= (wire46[(3'h5):(3'h4)] | $signed((8'ha0)));
              reg66 <= (+($signed($unsigned((8'ha5))) ?
                  {{wire37, wire31[(1'h1):(1'h1)]}, reg68} : $signed((8'ha7))));
            end
          else
            begin
              reg63 <= reg67;
              reg64 <= $signed({$signed($unsigned(wire29))});
              reg65 <= reg43;
              reg66 <= reg32[(4'hb):(3'h7)];
            end
          if ((|$unsigned(($unsigned($signed(reg62)) ?
              wire56 : $signed((^(7'h41)))))))
            begin
              reg67 <= $signed(reg48);
              reg68 <= (|$signed({$unsigned(reg33[(3'h4):(1'h1)])}));
              reg69 <= $signed($signed({reg59[(2'h2):(2'h2)],
                  $signed({(8'ha7), wire57})}));
              reg70 <= ($signed(wire36) << (7'h43));
            end
          else
            begin
              reg67 <= reg69;
              reg68 <= $signed(reg47);
              reg69 <= {(8'hbd), (!{(-(!reg59))})};
              reg70 <= (~^(reg68 <= ($signed(wire56) ^ $unsigned($signed(wire34)))));
              reg71 <= $unsigned($signed(((((7'h40) ? reg40 : reg62) ?
                  ((8'ha3) ? reg59 : reg59) : reg52) != (((8'haa) ?
                  reg65 : reg50) > ((8'hbc) ? reg60 : reg66)))));
            end
          reg72 <= reg43;
        end
      reg73 <= $signed((8'ha5));
      reg74 <= $unsigned(reg71[(3'h7):(2'h2)]);
      if ($unsigned((wire39 && reg43)))
        begin
          if (({(!reg62[(1'h1):(1'h1)])} || (~($signed((|wire29)) ?
              $unsigned($unsigned((7'h42))) : ((8'haf) ?
                  $signed(wire36) : {reg73, wire36})))))
            begin
              reg75 <= ((~&$signed(($unsigned((7'h43)) ?
                  $signed(reg62) : {reg61}))) >> $unsigned(wire28));
              reg76 <= ($unsigned((~|reg53[(1'h0):(1'h0)])) ?
                  reg74 : $signed(reg72));
            end
          else
            begin
              reg75 <= ($signed(reg47) ^ {{wire34[(1'h0):(1'h0)], reg64},
                  ($signed($unsigned(wire55)) ^ {(wire37 - reg43)})});
              reg76 <= reg61[(2'h3):(2'h2)];
              reg77 <= $unsigned(($signed(($signed(wire55) >>> (reg47 ?
                      wire37 : reg65))) ?
                  (~^reg45) : reg68));
            end
          if ($signed(reg53))
            begin
              reg78 <= {reg76,
                  ((wire36 ?
                      reg75 : {(reg63 << reg50),
                          {wire31}}) + (!(^reg74[(1'h0):(1'h0)])))};
              reg79 <= ($signed(reg60) ?
                  wire34[(2'h3):(2'h2)] : {reg78[(1'h1):(1'h1)]});
              reg80 <= (8'haa);
            end
          else
            begin
              reg78 <= (|($signed((~^(reg75 >> reg71))) && wire46[(1'h0):(1'h0)]));
              reg79 <= ((reg69[(3'h4):(1'h1)] ?
                  ($unsigned({reg42, reg70}) ?
                      (reg48[(2'h3):(2'h3)] ?
                          (reg76 ?
                              reg43 : reg80) : (^~reg71)) : ((wire31 > wire29) ?
                          (wire39 * reg59) : ((8'hb8) ?
                              reg52 : (8'hb3)))) : reg51) >= {(~|$signed((reg67 ?
                      wire34 : wire39))),
                  ($unsigned({wire36, reg60}) ?
                      ((8'h9c) ? (reg41 <= wire57) : $signed(reg64)) : reg77)});
              reg80 <= {$signed({((+wire56) ?
                          (reg61 | reg47) : (reg32 > reg45)),
                      ($signed((8'had)) ? (-wire54) : (reg51 ~^ reg69))})};
              reg81 <= (~|(~|$signed(reg63[(4'h9):(2'h3)])));
              reg82 <= {(reg65[(1'h0):(1'h0)] && ($unsigned($signed(wire54)) ?
                      reg41[(4'ha):(4'h9)] : (~(8'ha7))))};
            end
        end
      else
        begin
          reg75 <= $signed(reg41[(1'h0):(1'h0)]);
          reg76 <= wire37;
          reg77 <= reg75[(2'h2):(1'h1)];
          if ($unsigned($unsigned(({$unsigned(wire37),
              (wire29 < wire56)} << reg64[(5'h12):(3'h4)]))))
            begin
              reg78 <= $signed({(&reg74[(2'h2):(2'h2)])});
            end
          else
            begin
              reg78 <= (^$unsigned(($signed((8'hb0)) ?
                  (reg70 ? (reg79 ^ wire55) : reg41) : (+(reg78 ?
                      wire28 : reg77)))));
              reg79 <= ({reg53} ?
                  ((((wire28 << reg69) ?
                      reg64 : (~&reg59)) && (8'haa)) >= reg51) : reg44);
            end
          reg80 <= reg53[(4'hc):(3'h6)];
        end
    end
  always
    @(posedge clk) begin
      reg83 <= wire36;
      reg84 <= ($signed((!reg73[(4'he):(1'h1)])) || $unsigned($unsigned(reg73[(3'h4):(1'h0)])));
      reg85 <= $unsigned(((((wire31 >= wire35) ?
                  reg52[(4'he):(4'he)] : (reg72 | wire39)) ?
              (~reg67[(4'h9):(3'h6)]) : $unsigned((reg76 >> (8'hb2)))) ?
          (reg84[(2'h2):(1'h0)] ?
              (reg65 <<< reg32[(3'h4):(2'h3)]) : {$unsigned((8'hae)),
                  (!reg75)}) : (wire55 ?
              (wire46[(3'h5):(2'h2)] ?
                  reg67[(5'h12):(4'h8)] : $unsigned((7'h43))) : $signed((|wire28)))));
      reg86 <= (8'ha7);
      reg87 <= {((reg50 != ((~^reg41) ?
              (reg82 || reg52) : (reg80 ? wire39 : reg64))) >> reg80),
          {($unsigned({reg49}) <<< ((~&reg73) ?
                  (wire55 ? reg32 : wire55) : $unsigned(reg85)))}};
    end
  assign wire88 = (+reg61);
endmodule

module module272
#(parameter param308 = ((!(~|({(7'h44)} ? ((8'hb2) ? (8'hb4) : (8'h9c)) : ((8'hb8) | (8'hb7))))) >> (((((8'h9c) ? (8'hb4) : (8'hae)) <= (-(8'ha4))) || {(~^(8'ha4))}) <= ((((8'ha8) - (8'haf)) > (^~(8'had))) ? (^((8'h9e) ? (8'hab) : (8'ha4))) : {(~(8'hbb)), (~|(8'hab))}))), 
parameter param309 = (^~(param308 ? (param308 ? ((^~param308) ? (param308 ? param308 : param308) : param308) : param308) : {(~|(param308 ? param308 : param308))})))
(y, clk, wire276, wire275, wire274, wire273);
  output wire [(32'h18a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire276;
  input wire [(2'h3):(1'h0)] wire275;
  input wire signed [(4'hb):(1'h0)] wire274;
  input wire [(5'h15):(1'h0)] wire273;
  wire signed [(4'hf):(1'h0)] wire307;
  wire [(2'h2):(1'h0)] wire306;
  wire signed [(4'h9):(1'h0)] wire305;
  wire signed [(4'hf):(1'h0)] wire304;
  wire signed [(5'h12):(1'h0)] wire303;
  wire signed [(2'h2):(1'h0)] wire302;
  wire signed [(3'h6):(1'h0)] wire300;
  wire signed [(4'h8):(1'h0)] wire299;
  wire [(4'hf):(1'h0)] wire298;
  wire [(4'hf):(1'h0)] wire297;
  wire signed [(5'h15):(1'h0)] wire296;
  wire [(4'hc):(1'h0)] wire284;
  wire signed [(5'h15):(1'h0)] wire283;
  wire [(3'h4):(1'h0)] wire277;
  reg signed [(3'h6):(1'h0)] reg301 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg295 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg294 = (1'h0);
  reg [(5'h13):(1'h0)] reg293 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg292 = (1'h0);
  reg [(5'h12):(1'h0)] reg291 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg290 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg289 = (1'h0);
  reg [(5'h14):(1'h0)] reg288 = (1'h0);
  reg [(4'hf):(1'h0)] reg287 = (1'h0);
  reg [(4'h8):(1'h0)] reg286 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg285 = (1'h0);
  reg [(4'he):(1'h0)] reg282 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg281 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg280 = (1'h0);
  reg [(5'h11):(1'h0)] reg279 = (1'h0);
  reg [(4'hd):(1'h0)] reg278 = (1'h0);
  assign y = {wire307,
                 wire306,
                 wire305,
                 wire304,
                 wire303,
                 wire302,
                 wire300,
                 wire299,
                 wire298,
                 wire297,
                 wire296,
                 wire284,
                 wire283,
                 wire277,
                 reg301,
                 reg295,
                 reg294,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg282,
                 reg281,
                 reg280,
                 reg279,
                 reg278,
                 (1'h0)};
  assign wire277 = wire274[(3'h7):(3'h5)];
  always
    @(posedge clk) begin
      reg278 <= wire273[(4'h9):(3'h4)];
      if ($signed((7'h41)))
        begin
          if ($signed(wire277[(1'h1):(1'h1)]))
            begin
              reg279 <= (^~$signed(wire275[(2'h2):(2'h2)]));
              reg280 <= {(~|$signed((((8'hb4) >= reg279) ~^ wire275)))};
              reg281 <= (reg278[(4'h8):(2'h2)] ?
                  $unsigned($signed(wire274)) : (8'hb5));
            end
          else
            begin
              reg279 <= $signed(reg279[(2'h2):(1'h1)]);
              reg280 <= (8'hb5);
              reg281 <= (8'haf);
              reg282 <= (~(8'h9e));
            end
        end
      else
        begin
          if ($signed((~|($signed((-wire275)) & (^~(&wire276))))))
            begin
              reg279 <= (reg282[(4'he):(3'h5)] >= ($signed(reg281[(4'hb):(2'h3)]) != wire274[(3'h5):(2'h2)]));
            end
          else
            begin
              reg279 <= wire275;
              reg280 <= reg278[(4'hc):(4'h8)];
            end
        end
    end
  assign wire283 = (+(8'h9c));
  assign wire284 = (reg279[(4'h8):(3'h6)] <<< reg278[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg285 <= $unsigned($signed({reg278,
          ((wire274 <= reg281) ? (-reg278) : reg279[(3'h4):(1'h0)])}));
      reg286 <= (|(~^$unsigned(((wire276 - reg279) * $signed(reg278)))));
      reg287 <= ({$unsigned((!{wire283, wire284}))} ?
          (~&{({wire283} < $unsigned(reg285)),
              ((~reg281) ?
                  (wire275 ?
                      wire276 : (8'ha4)) : (!(8'hbb)))}) : $unsigned($signed(reg286[(1'h1):(1'h1)])));
      if ((({wire283, reg285} && $signed($signed((reg285 > (7'h43))))) ?
          (~&reg285[(3'h5):(3'h5)]) : $unsigned($signed($signed((8'hbf))))))
        begin
          reg288 <= reg278;
          reg289 <= reg279;
          reg290 <= reg281[(3'h5):(3'h4)];
          reg291 <= $signed({{reg280},
              $signed(($signed(reg279) ~^ $unsigned(reg290)))});
          reg292 <= $unsigned(((+$signed({reg291})) ?
              $unsigned($signed(reg285[(4'h8):(3'h4)])) : ($signed(wire283) ?
                  (8'ha6) : ($unsigned(reg289) ?
                      {reg285, (8'hab)} : reg282[(4'h8):(3'h6)]))));
        end
      else
        begin
          if (reg292[(3'h4):(2'h3)])
            begin
              reg288 <= (wire276 ?
                  ((^~{wire277[(3'h4):(1'h0)]}) ?
                      $unsigned($unsigned(wire277[(1'h1):(1'h0)])) : (8'hb4)) : ($unsigned($signed((reg286 > reg279))) ?
                      reg288 : (8'hae)));
              reg289 <= wire276;
              reg290 <= $signed(reg288);
            end
          else
            begin
              reg288 <= (-(8'hbe));
              reg289 <= (reg290[(1'h1):(1'h1)] ? (8'ha1) : $signed(reg280));
              reg290 <= ($unsigned((~&$unsigned((reg282 ? reg288 : wire275)))) ?
                  wire277[(3'h4):(2'h2)] : wire274);
              reg291 <= (|$signed($unsigned(((wire276 ? wire275 : wire275) ?
                  {wire284, reg282} : reg286))));
              reg292 <= (wire274 >> wire276);
            end
          reg293 <= ((~&$signed($unsigned((reg281 * reg286)))) & wire284);
        end
      if ($unsigned(((+reg290[(1'h0):(1'h0)]) - (wire283[(3'h7):(1'h0)] ?
          (reg293[(3'h6):(3'h5)] ?
              {wire275} : reg293[(1'h1):(1'h0)]) : $unsigned($signed(reg287))))))
        begin
          reg294 <= (+(|$signed(((wire284 ? (8'ha1) : reg293) | (^~reg291)))));
          reg295 <= $unsigned($unsigned(($signed($unsigned((8'hb6))) - reg286[(1'h0):(1'h0)])));
        end
      else
        begin
          reg294 <= (wire275 ?
              ($unsigned({reg278}) ?
                  $signed(($unsigned((8'h9f)) ?
                      reg285[(3'h4):(3'h4)] : $signed(wire273))) : (8'hac)) : (wire275[(2'h2):(2'h2)] | $signed(($unsigned(wire275) ?
                  reg295[(3'h5):(3'h5)] : (reg290 ? reg293 : (8'hb8))))));
          reg295 <= (reg288[(4'h8):(3'h7)] ?
              reg281[(4'he):(4'h9)] : $unsigned(reg280));
        end
    end
  assign wire296 = (&$unsigned(reg289[(4'hc):(3'h6)]));
  assign wire297 = $signed(reg279[(2'h3):(2'h2)]);
  assign wire298 = (~(~&wire276));
  assign wire299 = {($signed(reg292) ?
                           $signed((&(^reg280))) : (((reg287 || reg289) ?
                                   (~|reg295) : reg280[(1'h1):(1'h0)]) ?
                               $unsigned((wire276 >>> (7'h42))) : wire297[(3'h6):(3'h4)])),
                       (reg290 ?
                           (({reg294, wire276} ?
                               (wire296 ?
                                   reg280 : reg287) : $unsigned(reg278)) == ($unsigned(wire273) ?
                               $signed(reg286) : reg281[(4'hf):(4'h9)])) : (^((^~(8'ha8)) - $signed(reg282))))};
  assign wire300 = (($unsigned((^wire277[(3'h4):(1'h0)])) >> (+((|(8'hac)) ?
                           wire275 : (reg289 ? (8'hb7) : reg281)))) ?
                       reg287 : reg286);
  always
    @(posedge clk) begin
      reg301 <= reg281[(5'h13):(2'h2)];
    end
  assign wire302 = $signed((^~$signed(reg292)));
  assign wire303 = ((~^(^(wire276[(1'h1):(1'h0)] < {(8'hb9),
                       reg292}))) >> reg282);
  assign wire304 = $unsigned(((&((reg285 ?
                       (8'haf) : (8'hb2)) == $unsigned((8'haf)))) != $unsigned((-wire300))));
  assign wire305 = ($unsigned($signed((~&(~|(8'hbe))))) ?
                       (8'ha9) : $signed(($unsigned(reg282) ^ wire300[(3'h6):(2'h3)])));
  assign wire306 = $signed((8'ha4));
  assign wire307 = (^~(~^{$unsigned((|wire303))}));
endmodule

module module243
#(parameter param267 = {(((~^((8'hb6) ? (8'ha3) : (8'hab))) ? (+((8'ha7) ? (8'ha5) : (8'hbf))) : (~&(8'ha5))) && {(((8'ha4) ? (8'hb5) : (7'h41)) ^ ((8'hb1) ? (8'ha2) : (8'hab)))})})
(y, clk, wire247, wire246, wire245, wire244);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire247;
  input wire [(4'h8):(1'h0)] wire246;
  input wire [(5'h10):(1'h0)] wire245;
  input wire [(5'h15):(1'h0)] wire244;
  wire signed [(4'h9):(1'h0)] wire266;
  wire [(4'hf):(1'h0)] wire265;
  wire signed [(3'h6):(1'h0)] wire264;
  wire [(4'hd):(1'h0)] wire263;
  wire signed [(4'hb):(1'h0)] wire262;
  wire signed [(4'hc):(1'h0)] wire261;
  wire signed [(3'h4):(1'h0)] wire260;
  wire [(2'h2):(1'h0)] wire249;
  wire signed [(2'h3):(1'h0)] wire248;
  reg [(5'h12):(1'h0)] reg259 = (1'h0);
  reg [(5'h11):(1'h0)] reg258 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg257 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg256 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg255 = (1'h0);
  reg [(4'hf):(1'h0)] reg254 = (1'h0);
  reg [(5'h14):(1'h0)] reg253 = (1'h0);
  reg [(5'h11):(1'h0)] reg252 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg251 = (1'h0);
  reg [(5'h13):(1'h0)] reg250 = (1'h0);
  assign y = {wire266,
                 wire265,
                 wire264,
                 wire263,
                 wire262,
                 wire261,
                 wire260,
                 wire249,
                 wire248,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 (1'h0)};
  assign wire248 = (~($unsigned((^~((8'hbc) < wire244))) != (wire247[(4'h9):(4'h9)] ?
                       (~&(8'hbb)) : $unsigned($signed(wire246)))));
  assign wire249 = (wire244 ? $unsigned(wire244[(4'hd):(4'h8)]) : wire248);
  always
    @(posedge clk) begin
      reg250 <= ((-(wire244[(5'h13):(5'h11)] | {(wire247 >> wire245),
          $signed(wire249)})) <= $unsigned($signed(wire249)));
      if (wire244[(3'h5):(1'h0)])
        begin
          if ($signed({$unsigned($signed((wire247 ? wire244 : (8'had))))}))
            begin
              reg251 <= wire249[(1'h0):(1'h0)];
              reg252 <= {$unsigned((7'h42)),
                  (wire247[(4'hd):(4'hc)] ?
                      $signed((-{reg250, wire249})) : reg251[(3'h4):(2'h3)])};
            end
          else
            begin
              reg251 <= $signed((^$unsigned((((8'hb5) ? reg251 : wire248) ?
                  wire244 : ((8'ha2) ? wire245 : reg251)))));
              reg252 <= wire246[(3'h6):(3'h6)];
              reg253 <= $unsigned((^({(wire249 <<< wire247),
                  (+wire248)} << $unsigned({wire249, wire248}))));
            end
          reg254 <= $unsigned($signed($unsigned({$signed(wire245)})));
        end
      else
        begin
          reg251 <= $unsigned(reg253);
        end
      if (((8'hbb) ~^ ((reg252 ?
          wire248 : $unsigned((&wire248))) > $unsigned(reg253))))
        begin
          reg255 <= wire246;
          reg256 <= $signed($unsigned(wire245[(1'h0):(1'h0)]));
          reg257 <= $signed({$signed(reg255), reg250[(4'h8):(2'h3)]});
          reg258 <= (~|(^(wire247[(5'h12):(4'hd)] == ((!(8'hb9)) ?
              ((8'hbe) < (8'hb0)) : wire248))));
        end
      else
        begin
          reg255 <= wire249;
          reg256 <= $signed(wire249);
        end
      reg259 <= ($unsigned(reg255[(4'he):(4'hc)]) ?
          {reg251} : (~(($signed((8'hb1)) ^ reg251) >> reg254)));
    end
  assign wire260 = {{wire248,
                           ($signed(wire247) ?
                               {$signed(reg257)} : (^(reg256 * reg254)))},
                       $signed((~|{reg250, (reg255 > reg254)}))};
  assign wire261 = ((&$unsigned($signed((~&reg251)))) != wire246[(4'h8):(3'h4)]);
  assign wire262 = $unsigned(($signed(wire249) ?
                       (($signed((8'had)) ?
                           $unsigned(reg258) : (^wire260)) - reg258[(4'hd):(2'h3)]) : reg257[(1'h1):(1'h1)]));
  assign wire263 = $signed((^~reg252[(1'h0):(1'h0)]));
  assign wire264 = wire260;
  assign wire265 = (((-((wire245 ?
                       reg257 : wire263) <= (reg259 ^ wire246))) + $signed($unsigned($unsigned(wire261)))) ^ ((8'hac) ?
                       $signed(($signed(reg252) > reg258)) : ((reg256[(3'h5):(3'h5)] >>> $signed(reg252)) >>> ((reg256 ?
                           reg255 : (8'hbe)) <<< (~reg252)))));
  assign wire266 = reg254;
endmodule

module module209
#(parameter param235 = ({((~^(8'haa)) ^ (~(~&(8'hb1)))), ((~|((8'haa) ? (8'h9e) : (8'ha4))) ? (((8'hbf) ? (8'hab) : (8'hb6)) ? (~|(7'h40)) : ((8'ha5) <<< (8'ha2))) : (((8'h9c) | (8'hbb)) <= ((7'h42) || (8'h9d))))} ? {{(+((8'hbd) ? (8'hac) : (8'h9c)))}} : (((8'hba) || (~^((8'ha8) ? (8'ha7) : (7'h41)))) ? ((^~((8'ha1) + (8'h9e))) >> (((8'ha7) ? (8'ha8) : (8'ha6)) ? (-(8'hba)) : ((8'hb6) ? (8'ha6) : (8'hb8)))) : {(^(-(8'had))), (((7'h41) - (8'ha6)) ? (~^(8'ha8)) : ((8'had) <<< (8'hbf)))})))
(y, clk, wire214, wire213, wire212, wire211, wire210);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire214;
  input wire [(4'h9):(1'h0)] wire213;
  input wire [(4'h9):(1'h0)] wire212;
  input wire [(5'h11):(1'h0)] wire211;
  input wire signed [(5'h11):(1'h0)] wire210;
  wire signed [(5'h14):(1'h0)] wire234;
  wire [(4'hc):(1'h0)] wire216;
  wire [(4'h8):(1'h0)] wire215;
  reg signed [(5'h14):(1'h0)] reg233 = (1'h0);
  reg [(3'h5):(1'h0)] reg232 = (1'h0);
  reg [(3'h5):(1'h0)] reg231 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg230 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg229 = (1'h0);
  reg [(5'h11):(1'h0)] reg228 = (1'h0);
  reg [(2'h3):(1'h0)] reg227 = (1'h0);
  reg [(4'h8):(1'h0)] reg226 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg225 = (1'h0);
  reg [(3'h5):(1'h0)] reg224 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg223 = (1'h0);
  reg [(2'h2):(1'h0)] reg222 = (1'h0);
  reg [(4'ha):(1'h0)] reg221 = (1'h0);
  reg [(4'h8):(1'h0)] reg220 = (1'h0);
  reg [(4'hf):(1'h0)] reg219 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg218 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg217 = (1'h0);
  assign y = {wire234,
                 wire216,
                 wire215,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 (1'h0)};
  assign wire215 = $unsigned(wire213[(3'h4):(2'h3)]);
  assign wire216 = ({{($signed(wire212) ?
                                   $signed(wire215) : (wire211 << wire211)),
                               $signed(((8'hbb) ? wire215 : (8'hb0)))},
                           (wire215[(3'h5):(2'h2)] < ((wire213 <= (8'hb6)) <= (wire214 ?
                               wire215 : wire213)))} ?
                       $signed(wire213) : ($signed($signed($signed(wire211))) == $signed($signed(wire213[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      reg217 <= $unsigned($signed($signed((8'ha5))));
      reg218 <= {$signed(wire213[(2'h3):(2'h3)]),
          $signed($signed($unsigned(wire215[(1'h1):(1'h0)])))};
      reg219 <= wire215;
      if (wire215[(3'h6):(3'h6)])
        begin
          reg220 <= (^~$unsigned(wire211));
          reg221 <= (~&reg220);
          reg222 <= wire210;
          reg223 <= {reg218};
          if (((wire211 == (&(wire210 ?
                  wire211[(4'hf):(4'hf)] : (reg217 ? reg220 : wire213)))) ?
              ((((reg217 >= reg223) && wire216) >> (~&(7'h41))) >> $signed((wire214 ?
                  (wire212 || reg222) : (&reg223)))) : {($unsigned({(8'hab),
                      (7'h42)}) == reg221)}))
            begin
              reg224 <= ((~|($unsigned($unsigned(reg220)) ?
                  (~^(wire214 ?
                      reg218 : wire213)) : $signed(reg218[(4'h9):(2'h3)]))) >= (^~(8'hac)));
              reg225 <= $unsigned($signed($unsigned(wire214[(2'h3):(1'h0)])));
            end
          else
            begin
              reg224 <= (reg223 ?
                  {reg218[(5'h11):(4'hf)]} : (((~|$signed(wire216)) >> (-$unsigned((8'hbc)))) <<< $signed({wire212[(1'h0):(1'h0)],
                      (wire211 ? reg225 : (8'hbf))})));
              reg225 <= reg220;
            end
        end
      else
        begin
          if ($unsigned(wire213[(4'h8):(1'h0)]))
            begin
              reg220 <= $unsigned(reg220[(1'h1):(1'h1)]);
              reg221 <= $signed(wire211[(4'hc):(1'h1)]);
              reg222 <= {reg221};
            end
          else
            begin
              reg220 <= wire212;
              reg221 <= {reg225[(1'h0):(1'h0)]};
            end
          if ($signed(wire215[(2'h3):(1'h1)]))
            begin
              reg223 <= (wire215[(3'h6):(3'h4)] == ((reg224 == reg225) ?
                  (($unsigned(reg217) || $unsigned(wire216)) <<< reg220[(3'h7):(3'h7)]) : reg223[(3'h6):(3'h6)]));
              reg224 <= {$signed(((~|$unsigned(reg222)) ?
                      ($unsigned(wire212) ?
                          (~|reg219) : (~^wire215)) : (reg222 ?
                          (wire210 ? wire211 : reg224) : (reg217 ?
                              reg224 : wire214))))};
              reg225 <= reg219[(1'h0):(1'h0)];
              reg226 <= (~&{wire214[(3'h5):(1'h0)],
                  (~|$signed(reg218[(5'h12):(4'h9)]))});
              reg227 <= (reg225 ?
                  reg218[(4'he):(2'h3)] : (reg220 * $signed(reg217)));
            end
          else
            begin
              reg223 <= (!(^{((wire216 == reg223) ?
                      reg224[(3'h5):(3'h4)] : $signed(wire210))}));
              reg224 <= (~(~wire214));
              reg225 <= reg217[(3'h7):(3'h5)];
              reg226 <= (&(~^$signed((reg221 || (reg226 ? (7'h44) : reg219)))));
            end
          if (((($signed($signed(wire215)) || reg224[(3'h5):(2'h3)]) ?
              $unsigned((wire213[(3'h4):(1'h1)] != $unsigned((8'ha9)))) : (+reg221)) || reg224))
            begin
              reg228 <= ($unsigned((($unsigned(wire214) ?
                      (wire213 ? (8'hbd) : reg218) : reg220) ?
                  $unsigned((&reg220)) : $signed(wire214))) < (reg225[(1'h0):(1'h0)] ?
                  $signed(wire210[(4'h8):(3'h4)]) : ($signed((~^reg225)) ^~ $signed((~|reg221)))));
              reg229 <= (^~$unsigned($signed($unsigned({reg224}))));
              reg230 <= ({(reg219[(3'h7):(2'h3)] ?
                      ($unsigned(reg218) ?
                          wire211[(4'hb):(3'h7)] : (reg229 ?
                              reg224 : reg223)) : reg220[(3'h6):(1'h0)])} == (((~&(|reg217)) ?
                      reg220 : $unsigned(wire216[(4'ha):(2'h2)])) ?
                  (&{(8'ha6)}) : ($signed(reg222) ?
                      ($unsigned(reg226) <<< (wire210 == reg219)) : reg219[(4'hb):(4'ha)])));
            end
          else
            begin
              reg228 <= reg220;
              reg229 <= $unsigned(reg222);
              reg230 <= ({{(8'ha2), ({wire214, wire211} ~^ (|wire211))},
                  (~$signed((&reg222)))} | $signed(reg225[(2'h2):(2'h2)]));
            end
          reg231 <= ((8'hb9) ?
              (wire213[(3'h5):(1'h0)] ?
                  reg230[(2'h2):(1'h0)] : wire214[(3'h5):(3'h4)]) : wire215);
          reg232 <= ((({{wire215, reg223}} ^ reg225) ?
              ((wire216[(4'hc):(3'h4)] >= $unsigned(reg229)) << {reg225,
                  (reg228 ? reg219 : reg225)}) : $unsigned(({(8'h9e),
                  wire210} ^~ reg230[(1'h0):(1'h0)]))) >>> (-reg221[(2'h2):(1'h0)]));
        end
      reg233 <= wire210[(5'h10):(3'h7)];
    end
  assign wire234 = {wire215[(2'h3):(2'h3)],
                       (reg220[(2'h3):(1'h1)] ^~ {reg220})};
endmodule

module module177
#(parameter param203 = ((!{(~(~(8'hb1)))}) << {((((8'hbf) + (8'ha6)) ? ((8'hbc) & (8'ha7)) : {(7'h43)}) >> (((7'h43) > (8'hb1)) - ((8'hac) ? (7'h41) : (8'hb7))))}), 
parameter param204 = {(^(8'haf))})
(y, clk, wire181, wire180, wire179, wire178);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire181;
  input wire signed [(4'hb):(1'h0)] wire180;
  input wire [(2'h3):(1'h0)] wire179;
  input wire signed [(5'h12):(1'h0)] wire178;
  wire [(5'h13):(1'h0)] wire202;
  wire [(4'hb):(1'h0)] wire201;
  wire signed [(5'h10):(1'h0)] wire200;
  wire [(4'ha):(1'h0)] wire199;
  wire signed [(4'hf):(1'h0)] wire198;
  wire [(3'h6):(1'h0)] wire185;
  wire [(2'h2):(1'h0)] wire184;
  wire signed [(5'h11):(1'h0)] wire183;
  wire [(4'hb):(1'h0)] wire182;
  reg [(5'h12):(1'h0)] reg197 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg196 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg194 = (1'h0);
  reg [(3'h6):(1'h0)] reg193 = (1'h0);
  reg [(3'h5):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg191 = (1'h0);
  reg [(4'ha):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg189 = (1'h0);
  reg [(3'h7):(1'h0)] reg188 = (1'h0);
  reg [(4'ha):(1'h0)] reg187 = (1'h0);
  reg [(5'h13):(1'h0)] reg186 = (1'h0);
  assign y = {wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 (1'h0)};
  assign wire182 = $unsigned(wire178);
  assign wire183 = $unsigned($unsigned($unsigned($unsigned((wire180 ?
                       wire178 : wire180)))));
  assign wire184 = (|wire183);
  assign wire185 = {(!$signed((wire180[(3'h4):(3'h4)] ?
                           ((8'hb7) ? wire179 : wire184) : wire183)))};
  always
    @(posedge clk) begin
      reg186 <= wire180;
    end
  always
    @(posedge clk) begin
      if ((wire178 || $unsigned(wire181)))
        begin
          reg187 <= ((8'ha7) ?
              $signed(wire183) : $signed((((~|wire181) <<< wire183) < wire178[(1'h0):(1'h0)])));
          if ({(wire184[(1'h1):(1'h0)] ?
                  (~|wire185[(3'h5):(1'h0)]) : {wire184}),
              {$unsigned((((8'h9f) ? wire185 : (8'haf)) ?
                      (~|wire181) : $unsigned(wire179))),
                  $unsigned((!(wire181 <= wire184)))}})
            begin
              reg188 <= ({(8'ha1),
                  ($signed($unsigned(wire180)) * (&$unsigned(wire183)))} - $signed(($unsigned((wire181 <= wire183)) ?
                  ((|wire184) ?
                      $signed(wire182) : $signed(wire180)) : $unsigned(wire184))));
              reg189 <= ((|(8'h9e)) ?
                  $signed($unsigned((wire178[(4'ha):(3'h7)] ?
                      wire185[(3'h5):(2'h3)] : $signed(wire182)))) : $signed((wire184[(1'h1):(1'h1)] & wire179[(1'h1):(1'h0)])));
            end
          else
            begin
              reg188 <= (8'haf);
              reg189 <= {$signed((reg187 != ((+wire182) == (^~(8'hb4)))))};
              reg190 <= wire180;
              reg191 <= ($unsigned({($signed((8'ha3)) ?
                          wire178[(3'h7):(3'h4)] : (reg186 ?
                              wire184 : reg189))}) ?
                  (wire183 ?
                      {(8'hb0)} : $signed({{wire185},
                          $signed(reg190)})) : $unsigned((|$signed($unsigned(wire179)))));
              reg192 <= $unsigned((~|$signed(($unsigned(wire183) << reg187[(2'h3):(1'h0)]))));
            end
          reg193 <= reg187;
        end
      else
        begin
          reg187 <= wire178[(2'h2):(2'h2)];
          if ($signed($unsigned(((+reg186) ? (7'h41) : (-{wire181})))))
            begin
              reg188 <= wire182;
            end
          else
            begin
              reg188 <= (-($unsigned(wire179) ?
                  $signed((&(+wire178))) : ({(wire181 != reg193)} != (((8'hb4) ?
                          (8'h9d) : reg186) ?
                      (wire182 ^~ (8'ha1)) : $unsigned(reg191)))));
              reg189 <= (wire184[(1'h1):(1'h0)] ?
                  {($signed((reg189 ? reg189 : (8'hb4))) ?
                          ((reg191 <<< wire180) ?
                              $signed(wire181) : (&reg189)) : wire181)} : wire184);
            end
          reg190 <= reg192[(3'h5):(3'h5)];
        end
      reg194 <= (reg192[(3'h4):(3'h4)] ^ $signed((7'h44)));
      reg195 <= (+($unsigned(reg186) ?
          $signed($unsigned(wire179[(1'h0):(1'h0)])) : ({$unsigned((8'hb7))} ?
              (reg190 >>> (reg193 ? reg193 : wire184)) : (~(|wire184)))));
      reg196 <= $signed({{wire180[(4'h9):(1'h1)]}});
      reg197 <= (8'ha9);
    end
  assign wire198 = $signed({$unsigned(((reg190 >>> wire184) ?
                           ((8'ha7) >> (7'h41)) : $unsigned(reg197)))});
  assign wire199 = $unsigned($signed(reg196));
  assign wire200 = {reg194[(4'hd):(1'h1)], reg194[(4'ha):(1'h0)]};
  assign wire201 = $signed(wire199[(4'h8):(3'h4)]);
  assign wire202 = (((reg196 < ($signed(wire184) ?
                       $unsigned(reg192) : (reg189 | reg191))) | $signed(wire184[(1'h1):(1'h0)])) <<< (~$unsigned($unsigned(reg187))));
endmodule
