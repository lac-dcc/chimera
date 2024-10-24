module top
#(parameter param105 = (~&(((((8'ha1) * (8'hb1)) ? (8'ha9) : ((8'hb2) ? (8'hb6) : (8'hbb))) ? {(|(7'h44)), ((8'ha3) | (8'ha5))} : (&(~|(8'hb6)))) << ({{(8'hb5)}, {(8'hbe), (8'ha7)}} * (((8'hbf) ? (8'haf) : (7'h43)) * ((8'ha4) == (8'ha7)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire104;
  wire [(5'h15):(1'h0)] wire103;
  wire [(5'h14):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire23;
  wire signed [(4'hf):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire25;
  wire [(3'h4):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire100;
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire100,
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
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire2[(4'hd):(3'h6)];
      if ((wire2[(4'hd):(4'hb)] <= $signed(({wire0[(3'h6):(3'h6)]} ?
          (-wire0[(4'ha):(3'h7)]) : $signed((~wire3))))))
        begin
          reg6 <= (wire2 ?
              $unsigned(($unsigned(wire2) ?
                  ((-(8'had)) ? wire2 : (wire4 < wire3)) : (^~wire0))) : wire4);
          reg7 <= ($signed(($unsigned((~&wire3)) ?
              wire2 : {wire2, wire1})) < (wire3 < (((!wire3) ?
              $signed(wire4) : (reg6 - wire0)) >= {{wire1}})));
          reg8 <= wire0;
          if ({wire4[(1'h0):(1'h0)],
              (reg5 ?
                  reg8[(2'h3):(2'h3)] : $unsigned(($unsigned(reg8) == (-reg5))))})
            begin
              reg9 <= ($unsigned($unsigned($unsigned((~|(8'hb3))))) * $signed((^~$signed((~^wire4)))));
            end
          else
            begin
              reg9 <= reg5[(4'hf):(4'ha)];
              reg10 <= {$signed($signed($signed((wire2 ? reg8 : reg7))))};
              reg11 <= $unsigned($unsigned(($signed((wire0 & wire2)) ?
                  $unsigned((~&reg10)) : (reg6[(1'h0):(1'h0)] ?
                      $signed(wire2) : reg8))));
            end
          reg12 <= $signed((^wire3[(2'h2):(1'h0)]));
        end
      else
        begin
          reg6 <= wire3;
          reg7 <= $unsigned((wire0[(3'h7):(3'h7)] ?
              $signed($signed($unsigned(reg8))) : reg6[(4'h9):(1'h1)]));
        end
      reg13 <= (&(($signed((reg10 || wire1)) ?
          wire3[(1'h0):(1'h0)] : $signed({wire3})) <= ((+$unsigned(reg9)) ?
          ((&(8'hb0)) ?
              (~^reg8) : (reg10 ^~ reg12)) : $signed($unsigned(reg12)))));
      if ({(~$unsigned($signed({(8'hb3), reg6})))})
        begin
          reg14 <= (8'hbd);
          if (((($unsigned((wire2 ? (8'hb5) : (8'ha6))) || ((reg11 ?
                  (8'had) : reg12) == $unsigned(wire1))) ?
              $unsigned(((reg5 ?
                  reg10 : reg13) | (&reg14))) : $signed(reg11)) <= reg12))
            begin
              reg15 <= wire4[(3'h5):(2'h3)];
              reg16 <= (reg12 ? reg11[(4'h9):(3'h7)] : reg13[(1'h0):(1'h0)]);
              reg17 <= ((&wire4[(3'h4):(3'h4)]) ?
                  reg15[(2'h2):(1'h0)] : (8'hbb));
              reg18 <= (-(((+(~|reg17)) < ($signed(reg9) ?
                      {wire3} : (reg6 - reg14))) ?
                  wire4 : (((reg10 ^~ wire3) ?
                          $unsigned(reg16) : (reg8 ? reg14 : reg5)) ?
                      $unsigned($unsigned(wire4)) : (reg6[(2'h2):(2'h2)] ^ reg13[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg15 <= (({((wire2 ? wire0 : reg11) ?
                              reg16[(3'h5):(2'h2)] : (+reg14)),
                          {(wire3 <= reg15), $signed((8'ha4))}} ?
                      (reg13 ?
                          $signed(reg11) : {(reg17 == reg12)}) : (reg15[(3'h7):(1'h1)] <= ((!reg14) ?
                          (reg7 ? (7'h44) : reg17) : (reg18 ?
                              wire3 : reg12)))) ?
                  (~^{($signed(wire2) << $signed(reg15)),
                      (((8'h9e) ? wire1 : wire2) < (&(8'hbd)))}) : (8'ha8));
              reg16 <= (7'h40);
            end
          reg19 <= $signed((|$signed(($signed(wire3) == (reg13 > wire3)))));
          reg20 <= (reg17[(4'hc):(3'h4)] > wire1);
        end
      else
        begin
          reg14 <= wire1;
          if ((8'ha4))
            begin
              reg15 <= {wire3[(1'h1):(1'h0)], (-$signed(wire0[(4'h8):(3'h7)]))};
            end
          else
            begin
              reg15 <= (($unsigned((-{reg15})) || (~{(~reg12)})) ?
                  reg11[(2'h2):(1'h1)] : reg5[(4'hf):(3'h5)]);
              reg16 <= ($signed(((reg18[(2'h3):(2'h2)] != reg10) >= (reg10 + reg19[(2'h2):(1'h1)]))) ?
                  reg13 : wire2);
              reg17 <= $unsigned({(reg17[(3'h4):(3'h4)] <= reg16)});
            end
          if ($unsigned($unsigned((8'hb6))))
            begin
              reg18 <= (reg19[(1'h1):(1'h0)] ?
                  (+({((8'hb7) ? reg7 : reg17)} ?
                      wire2 : ((8'hb4) ? reg13 : (reg19 * wire4)))) : reg9);
              reg19 <= $unsigned((reg18[(2'h2):(2'h2)] & (reg19 ?
                  {reg15} : ($signed(reg5) ?
                      reg15[(3'h5):(1'h1)] : (-wire4)))));
              reg20 <= (((~|reg17[(4'hb):(4'h8)]) ?
                  $unsigned($signed($signed(wire1))) : {$signed((~reg13))}) && $signed($unsigned((^~(^~reg15)))));
              reg21 <= ((~&{(-wire3), {{wire2}}}) == reg5);
            end
          else
            begin
              reg18 <= {reg7[(3'h6):(1'h1)]};
              reg19 <= (~reg8);
              reg20 <= {$signed(((!{(8'ha8), reg21}) ?
                      ($unsigned(reg17) != $signed(reg7)) : $signed((8'hb4)))),
                  reg6[(4'ha):(1'h0)]};
            end
          reg22 <= $signed(reg18);
        end
    end
  assign wire23 = (^~reg16);
  assign wire24 = {{reg13}, (8'hbf)};
  assign wire25 = $signed(((((reg21 | reg12) ?
                      $signed(reg16) : wire24[(4'hc):(4'h9)]) | {wire2,
                      $unsigned(wire1)}) ~^ wire3));
  assign wire26 = $unsigned((reg12[(3'h6):(3'h6)] >> $unsigned($signed((~&wire25)))));
  assign wire27 = (((~&reg15) == reg12[(3'h6):(1'h0)]) >> ((-(^reg22[(3'h7):(1'h1)])) - (~^(&$signed(reg16)))));
  assign wire28 = wire24[(4'h9):(2'h3)];
  assign wire29 = (reg20 >>> $unsigned(reg11[(4'h8):(3'h7)]));
  module30 #() modinst101 (.wire34(reg15), .wire33(reg10), .wire31(wire28), .wire35(reg9), .y(wire100), .wire32(reg7), .clk(clk));
  assign wire102 = $signed($signed(({(-reg7), (^reg21)} ?
                       $unsigned(wire23[(4'he):(3'h4)]) : (-$signed(reg9)))));
  assign wire103 = wire26;
  assign wire104 = wire100;
endmodule

module module30
#(parameter param99 = ({((^(~&(8'hb6))) > {((8'hbd) ? (8'h9c) : (8'ha3)), (&(8'hb9))})} >= ((8'hb9) <<< {(((8'ha3) ? (8'ha7) : (8'hbc)) >>> ((8'h9e) ? (8'hba) : (8'hbc)))})))
(y, clk, wire31, wire32, wire33, wire34, wire35);
  output wire [(32'h1f5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire31;
  input wire signed [(3'h7):(1'h0)] wire32;
  input wire signed [(4'hb):(1'h0)] wire33;
  input wire signed [(2'h3):(1'h0)] wire34;
  input wire signed [(3'h4):(1'h0)] wire35;
  wire signed [(3'h7):(1'h0)] wire87;
  wire signed [(4'hd):(1'h0)] wire86;
  wire [(3'h5):(1'h0)] wire85;
  wire [(4'h8):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire73;
  wire [(3'h7):(1'h0)] wire72;
  wire signed [(4'hd):(1'h0)] wire67;
  wire signed [(5'h12):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire61;
  reg [(4'ha):(1'h0)] reg98 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  reg [(4'hd):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(4'hf):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire73,
                 wire72,
                 wire67,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire61,
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
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire36 = wire33;
  assign wire37 = (wire36 <<< $signed($signed((-(wire32 ? wire33 : wire31)))));
  assign wire38 = ((^~($unsigned((wire33 >> wire36)) ?
                          wire36[(3'h7):(1'h0)] : wire37)) ?
                      {wire37} : $signed(wire33));
  assign wire39 = (wire34[(1'h1):(1'h1)] >= $signed((($unsigned(wire35) | (~|wire34)) ^~ wire34)));
  module40 #() modinst62 (.wire45(wire37), .clk(clk), .wire41(wire33), .y(wire61), .wire43(wire31), .wire44(wire32), .wire42(wire38));
  always
    @(posedge clk) begin
      reg63 <= wire34[(1'h0):(1'h0)];
      reg64 <= wire31[(5'h12):(4'hc)];
      reg65 <= $unsigned(wire34);
      reg66 <= wire61[(2'h3):(2'h3)];
    end
  assign wire67 = (-(|{$signed(wire33)}));
  always
    @(posedge clk) begin
      reg68 <= (reg66[(4'hb):(4'ha)] - $unsigned($signed($unsigned($unsigned(wire38)))));
      reg69 <= $unsigned(((((!wire67) ? wire33 : (~|wire36)) ?
              {(|wire32)} : (reg64 ^ ((8'ha1) ? reg63 : (8'h9d)))) ?
          $unsigned(wire38[(2'h2):(1'h0)]) : (~$signed($unsigned(wire36)))));
      reg70 <= $unsigned(wire31[(3'h7):(3'h5)]);
      reg71 <= {($unsigned({(wire31 ? wire31 : wire38)}) ?
              wire67[(3'h7):(3'h7)] : wire35),
          (+(wire35 ? wire32 : $unsigned($unsigned(reg66))))};
    end
  assign wire72 = reg70;
  assign wire73 = {{$signed(wire31[(5'h13):(4'hf)]),
                          ((reg66 == $signed(wire33)) ?
                              ((+wire32) ?
                                  (^~(8'ha0)) : (8'ha8)) : $signed($signed(reg69)))}};
  always
    @(posedge clk) begin
      if (((|{$unsigned(wire36[(3'h7):(2'h2)])}) >> reg69))
        begin
          if (wire34)
            begin
              reg74 <= $unsigned((&(~^(((7'h44) ~^ wire39) >> wire34[(1'h0):(1'h0)]))));
              reg75 <= wire67[(4'ha):(4'ha)];
              reg76 <= $unsigned($unsigned(($unsigned((-reg65)) ?
                  wire32 : (~|wire61))));
              reg77 <= $unsigned($unsigned(wire61));
            end
          else
            begin
              reg74 <= (wire31 ?
                  $unsigned($unsigned($signed((~&reg68)))) : reg66[(5'h10):(3'h7)]);
              reg75 <= $unsigned(($signed({$signed(reg76)}) ?
                  ($signed((^wire35)) >= reg68[(2'h3):(2'h2)]) : (reg75 * wire35)));
            end
          reg78 <= wire33;
          reg79 <= $signed(wire72);
          reg80 <= (+($unsigned(wire39[(1'h0):(1'h0)]) <= (~&{(wire73 > reg65),
              {reg65}})));
        end
      else
        begin
          reg74 <= wire33[(2'h2):(1'h1)];
          reg75 <= reg79[(3'h6):(2'h3)];
          reg76 <= $signed($signed({wire39[(2'h2):(2'h2)], (8'hb4)}));
          reg77 <= $signed(($signed(($unsigned((7'h43)) ^ wire35[(1'h0):(1'h0)])) ^~ ($unsigned(reg76[(3'h6):(2'h2)]) ?
              $unsigned(wire73[(4'ha):(3'h5)]) : wire61[(1'h1):(1'h0)])));
          reg78 <= wire31[(3'h5):(1'h0)];
        end
      reg81 <= reg65[(4'hc):(3'h4)];
      reg82 <= (((!(reg78[(3'h6):(1'h0)] ^ wire67[(4'hb):(4'h9)])) < ($unsigned($signed((8'hb6))) ?
              (+((8'hab) ? (8'hac) : wire39)) : ({wire39,
                  reg70} >>> (reg64 - reg65)))) ?
          reg75[(2'h3):(2'h3)] : reg79);
      reg83 <= ({$unsigned((^wire34[(2'h2):(1'h1)]))} ?
          (+(7'h42)) : $signed({reg66[(5'h11):(3'h5)]}));
    end
  assign wire84 = wire37[(4'he):(2'h3)];
  assign wire85 = reg69[(4'h9):(4'h8)];
  assign wire86 = reg69[(4'hb):(2'h3)];
  assign wire87 = (((~|(wire73[(5'h13):(5'h11)] && (-reg69))) ?
                      (~reg70) : ((^wire36[(3'h6):(3'h4)]) < $signed((wire35 ?
                          reg63 : (8'hbe))))) + $signed(($unsigned((reg76 >> reg76)) != $signed((reg71 ?
                      reg77 : wire84)))));
  always
    @(posedge clk) begin
      reg88 <= (^~$signed(reg81[(3'h5):(2'h3)]));
      if (($unsigned(({$signed(wire31)} ~^ $signed($unsigned((8'hac))))) ~^ $unsigned((!wire39))))
        begin
          reg89 <= $signed((~^((~|$unsigned(reg76)) ?
              wire67 : ($signed(wire72) > ((7'h42) ? wire33 : (8'ha5))))));
        end
      else
        begin
          if (((~^(&$signed((reg88 + wire72)))) && ($unsigned($unsigned($unsigned(reg69))) ^~ (~^(wire85 ^~ wire73[(5'h15):(1'h1)])))))
            begin
              reg89 <= (^~{((wire33[(2'h3):(1'h0)] ?
                      (-wire84) : reg65) != (wire37[(2'h2):(1'h1)] ?
                      $signed(reg81) : (wire84 > reg83))),
                  (-$signed((~|reg74)))});
              reg90 <= (^$signed((($signed((8'hb6)) >> wire36) ^ $unsigned((wire38 ?
                  (8'hbe) : wire31)))));
            end
          else
            begin
              reg89 <= (wire72[(2'h2):(1'h0)] | $unsigned(reg89[(2'h3):(2'h3)]));
              reg90 <= {((wire87 ?
                      (reg81[(2'h3):(2'h2)] != (!wire38)) : $signed($unsigned(wire32))) > $unsigned((reg80[(2'h2):(1'h0)] ?
                      $unsigned(reg89) : {(8'ha8), wire67}))),
                  ({{(reg89 << reg88)}} ~^ ($unsigned({wire87}) ?
                      ((wire67 ? (8'haf) : reg69) && (wire31 ?
                          reg65 : wire32)) : (8'hbf)))};
            end
          reg91 <= {wire34[(2'h3):(2'h3)]};
          if ({wire84[(1'h1):(1'h0)]})
            begin
              reg92 <= $signed((wire84[(2'h2):(1'h0)] >> $signed(wire61[(2'h3):(2'h3)])));
              reg93 <= ($unsigned($signed(wire37)) ?
                  reg76 : $unsigned(((wire67 ?
                          (wire35 ? wire37 : reg92) : wire33[(2'h3):(1'h0)]) ?
                      ($signed(reg65) ? reg70 : wire37) : (8'ha3))));
              reg94 <= reg64;
              reg95 <= (wire72 ?
                  ({reg89[(4'h9):(4'h8)],
                          (reg83[(2'h2):(1'h0)] ?
                              $unsigned((8'ha4)) : reg77[(1'h0):(1'h0)])} ?
                      (wire85[(3'h5):(3'h4)] ?
                          reg65[(1'h1):(1'h1)] : wire33[(3'h7):(3'h7)]) : (reg94 > $signed($signed(reg71)))) : wire38[(3'h4):(2'h2)]);
            end
          else
            begin
              reg92 <= (8'hbe);
              reg93 <= $signed(wire61[(1'h1):(1'h0)]);
              reg94 <= ($signed($unsigned(reg91[(2'h2):(1'h1)])) ?
                  ((~&{(reg89 ? reg88 : reg75), (7'h44)}) ?
                      $unsigned({$unsigned(wire87),
                          $signed(reg68)}) : $signed(($signed(reg63) || $signed((8'haa))))) : $unsigned((^((~&(8'h9d)) >> $unsigned(wire72)))));
            end
          reg96 <= $unsigned($unsigned($signed(reg76[(5'h14):(3'h6)])));
          reg97 <= {(&{$signed((|reg83)), ((8'ha7) && (^~wire87))}),
              (+$signed((~|reg76)))};
        end
      reg98 <= wire32;
    end
endmodule

module module40  (y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire45;
  input wire signed [(3'h4):(1'h0)] wire44;
  input wire [(4'hb):(1'h0)] wire43;
  input wire signed [(4'h8):(1'h0)] wire42;
  input wire signed [(3'h5):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire58;
  wire signed [(3'h4):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire56;
  wire signed [(3'h4):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire54;
  wire signed [(4'ha):(1'h0)] wire53;
  wire [(4'h8):(1'h0)] wire52;
  wire signed [(4'h9):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire50;
  wire [(3'h6):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire48;
  wire signed [(5'h15):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire46;
  assign y = {wire60,
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
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 (1'h0)};
  assign wire46 = wire42;
  assign wire47 = $signed($unsigned(($unsigned((8'hbf)) ?
                      wire42[(2'h2):(1'h1)] : $unsigned({wire44, wire46}))));
  assign wire48 = $signed((!(8'had)));
  assign wire49 = (~wire48);
  assign wire50 = {$signed((wire41 ? wire49 : $signed((wire48 << wire43))))};
  assign wire51 = {wire45[(4'h9):(2'h3)], wire48};
  assign wire52 = wire51;
  assign wire53 = wire52[(4'h8):(3'h5)];
  assign wire54 = $signed(wire46);
  assign wire55 = $signed(wire48);
  assign wire56 = ($signed(((~^$unsigned(wire42)) ?
                      $signed(wire53) : wire53[(3'h7):(3'h5)])) - $signed(wire52[(3'h5):(2'h2)]));
  assign wire57 = (((8'hb9) <<< {(wire42 ^~ wire52[(2'h3):(1'h0)])}) ?
                      wire46 : ($unsigned($unsigned(wire53)) * $signed((8'ha4))));
  assign wire58 = (($unsigned($unsigned($unsigned(wire52))) ?
                          $unsigned(($signed(wire48) >= wire54)) : wire56[(3'h5):(3'h5)]) ?
                      wire51 : wire43);
  assign wire59 = wire58[(2'h3):(1'h0)];
  assign wire60 = (-wire46);
endmodule
