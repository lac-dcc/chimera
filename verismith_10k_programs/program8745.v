module top
#(parameter param109 = (~|(((((8'hb6) && (8'hbd)) && (~|(8'ha1))) <<< (~^(-(8'hbe)))) ? ({((8'hb1) ? (8'ha3) : (7'h42)), (|(8'ha6))} + (((8'hba) && (7'h43)) ? {(8'ha1)} : ((7'h40) ? (7'h42) : (7'h44)))) : {((+(8'ha4)) ? (8'hb7) : (^~(8'hb4))), (((8'ha0) ? (8'hbf) : (8'hac)) ? ((8'hab) ? (8'hbe) : (8'hbe)) : ((8'hbf) ? (8'ha4) : (8'hab)))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire108;
  wire signed [(4'hc):(1'h0)] wire107;
  wire signed [(2'h2):(1'h0)] wire106;
  wire signed [(2'h2):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire104;
  wire [(5'h14):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire102;
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire5,
                 wire102,
                 (1'h0)};
  assign wire5 = wire0;
  module6 #() modinst103 (wire102, clk, wire2, wire4, wire0, wire5, wire3);
  assign wire104 = {({(wire0 ? (wire4 ? wire102 : wire0) : $signed(wire0))} ?
                           wire1 : $signed($unsigned($unsigned((8'ha8))))),
                       wire5[(3'h5):(1'h1)]};
  assign wire105 = $unsigned(wire0[(5'h10):(3'h4)]);
  assign wire106 = ($signed((~|wire104[(4'h8):(3'h5)])) <<< $signed(($signed($signed(wire1)) ?
                       {$signed(wire102),
                           {(7'h44), (7'h40)}} : $signed((wire104 ?
                           (7'h41) : wire2)))));
  assign wire107 = ((wire104[(3'h6):(2'h3)] ^~ wire0) >> {wire1});
  assign wire108 = (({$unsigned($unsigned(wire2))} && ($signed(wire4) >>> $unsigned(wire104[(5'h13):(4'he)]))) != $unsigned(((~$unsigned(wire106)) ?
                       {$signed(wire1)} : $signed(((8'ha7) ?
                           (8'hbf) : (7'h41))))));
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h29f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire [(2'h3):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire100;
  wire [(5'h15):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire60;
  wire [(3'h7):(1'h0)] wire59;
  wire signed [(4'ha):(1'h0)] wire49;
  wire signed [(2'h3):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire46;
  wire signed [(4'h9):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire23;
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  reg [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(4'ha):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg80 = (1'h0);
  assign y = {wire100,
                 wire81,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire25,
                 wire23,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg45,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 (1'h0)};
  module12 #() modinst24 (wire23, clk, wire9, wire7, wire11, wire8, wire10);
  assign wire25 = $unsigned((~(($signed(wire9) ?
                          (wire10 > wire11) : $unsigned(wire10)) ?
                      wire11 : ((8'hb6) <= (wire7 ? wire7 : wire8)))));
  always
    @(posedge clk) begin
      reg26 <= wire25;
      reg27 <= wire7[(2'h3):(2'h3)];
      reg28 <= $signed((wire9 ^~ (~reg26[(3'h4):(2'h2)])));
      reg29 <= {$unsigned(wire7[(4'ha):(3'h4)])};
      if (wire7[(1'h1):(1'h0)])
        begin
          reg30 <= (^$unsigned($signed($signed($unsigned(wire8)))));
          if ($unsigned(wire11[(3'h5):(2'h3)]))
            begin
              reg31 <= (~|$signed((-$signed(wire8))));
              reg32 <= reg29[(3'h5):(3'h5)];
              reg33 <= $signed(($signed((reg30 ?
                  (reg26 ~^ reg32) : reg31[(4'h9):(3'h4)])) >>> wire25[(4'h8):(3'h4)]));
              reg34 <= {$signed($signed((reg31 ?
                      $signed(wire9) : (wire23 <<< reg26)))),
                  (~(((~&reg26) ? $unsigned(reg30) : (^reg28)) > reg32))};
              reg35 <= (8'hac);
            end
          else
            begin
              reg31 <= reg35;
              reg32 <= (&$unsigned((reg30 && (~^$signed(reg32)))));
              reg33 <= ({(((wire9 ? reg29 : reg31) - {wire23, wire25}) ?
                      wire11[(4'hc):(4'h8)] : $signed($signed((8'hb8)))),
                  $unsigned(wire9[(3'h6):(3'h6)])} || {(((!wire25) ?
                          (wire25 ? wire8 : reg31) : (wire11 ?
                              reg32 : wire10)) ?
                      reg33 : (reg30 ? $signed(reg30) : $unsigned((8'hab)))),
                  {$unsigned((reg35 >> reg31)), $signed((wire9 >>> wire25))}});
            end
          reg36 <= (~^wire23[(3'h5):(3'h4)]);
        end
      else
        begin
          if ((($unsigned((-reg34[(4'hc):(4'h9)])) ? $unsigned(reg33) : reg29) ?
              (((reg28 >>> (-wire11)) >= ({reg32} & (reg31 <<< wire23))) ?
                  ($signed($signed((8'ha4))) ?
                      (reg33 ?
                          reg34[(4'hc):(4'h8)] : (+wire10)) : reg32) : reg33[(4'hf):(4'ha)]) : reg31))
            begin
              reg30 <= reg27[(4'ha):(1'h0)];
              reg31 <= $unsigned(wire8[(2'h3):(2'h2)]);
              reg32 <= {reg29[(1'h0):(1'h0)],
                  (wire7[(4'h8):(3'h7)] ?
                      (&$signed($unsigned(reg36))) : {$signed($signed((8'ha6))),
                          (&(wire11 < reg34))})};
              reg33 <= $signed($unsigned(($unsigned((reg36 * wire10)) > wire11)));
            end
          else
            begin
              reg30 <= {wire7[(3'h7):(3'h7)]};
              reg31 <= (wire8 & (((8'hba) < (-reg32[(2'h3):(2'h3)])) <= reg32[(4'h8):(3'h5)]));
              reg32 <= {{reg32, reg29[(1'h0):(1'h0)]}};
              reg33 <= wire8;
              reg34 <= {wire11[(1'h1):(1'h1)]};
            end
          if (($signed(($unsigned($signed(reg36)) ?
              reg36[(4'h9):(1'h1)] : $unsigned($signed(wire11)))) & wire7))
            begin
              reg35 <= (^$signed($signed(wire7[(1'h1):(1'h1)])));
              reg36 <= $signed((^~$unsigned((~^reg32[(1'h1):(1'h1)]))));
              reg37 <= reg27[(4'he):(3'h7)];
              reg38 <= $unsigned((wire7 ?
                  $signed(reg33[(3'h7):(2'h2)]) : (((~&wire10) ~^ $unsigned(reg31)) ?
                      {wire11} : $signed(((8'hac) << reg32)))));
              reg39 <= (($unsigned(reg35[(5'h11):(4'ha)]) ?
                      {(reg37[(3'h4):(2'h3)] ?
                              reg32 : (7'h40))} : (|reg37[(1'h0):(1'h0)])) ?
                  $unsigned((7'h41)) : wire25);
            end
          else
            begin
              reg35 <= $signed((($unsigned(reg35[(2'h3):(2'h3)]) <= reg29) ?
                  ($unsigned((~^(8'hb0))) ^~ {reg32[(3'h5):(3'h5)]}) : $signed(((reg31 || (8'ha6)) ^~ {reg36}))));
              reg36 <= ($unsigned(reg34[(2'h3):(2'h3)]) ?
                  wire9[(4'hb):(3'h5)] : ({(~$signed(reg31))} ?
                      (wire10 && ($signed(reg26) ?
                          ((8'ha3) != (8'hac)) : {(8'ha1)})) : reg36[(1'h1):(1'h0)]));
              reg37 <= ($signed(((^~$signed(wire11)) ?
                  $signed($signed(wire25)) : reg34[(4'ha):(4'h8)])) <= (!$signed((-(wire7 ?
                  reg30 : wire23)))));
              reg38 <= (wire10[(4'ha):(4'h9)] ?
                  ($unsigned(($signed(reg27) + wire23)) ?
                      reg39[(1'h1):(1'h0)] : reg32[(4'h9):(3'h4)]) : reg30[(1'h1):(1'h1)]);
              reg39 <= $unsigned({$unsigned((wire11 ? reg27 : (-reg35)))});
            end
        end
    end
  assign wire40 = ((&(&($signed(reg38) - $unsigned(reg37)))) ?
                      reg26[(4'ha):(3'h4)] : $unsigned((|reg29)));
  assign wire41 = ((+((wire25 <<< ((7'h43) ?
                      wire11 : reg27)) == {reg30[(1'h1):(1'h0)]})) < (~&((reg39 ^ $unsigned(reg35)) ?
                      reg31[(3'h7):(3'h6)] : $unsigned(reg37))));
  assign wire42 = ($unsigned($signed($signed($signed(reg30)))) >> $unsigned($signed($signed($unsigned(wire7)))));
  assign wire43 = $signed($signed((^~$signed($unsigned(wire11)))));
  assign wire44 = ($unsigned((^~$unsigned($unsigned(reg26)))) >= $signed(reg39));
  always
    @(posedge clk) begin
      reg45 <= $unsigned($unsigned((-wire44)));
    end
  assign wire46 = reg29;
  assign wire47 = (|{wire44[(3'h7):(3'h6)],
                      ($signed($unsigned((8'hb0))) ?
                          ($signed(reg35) ?
                              $signed(reg37) : $unsigned(reg28)) : $signed($unsigned(reg37)))});
  assign wire48 = $unsigned((8'h9e));
  assign wire49 = ($signed($unsigned($unsigned($signed(wire9)))) ?
                      $unsigned(reg36[(4'h8):(2'h3)]) : ($unsigned((~|reg36)) ?
                          wire11[(1'h0):(1'h0)] : wire46));
  always
    @(posedge clk) begin
      reg50 <= $unsigned($unsigned({$unsigned($unsigned((8'hb7)))}));
      reg51 <= {$signed(((^reg31[(4'hb):(4'hb)]) ?
              (~(wire7 ^ wire46)) : (wire23[(2'h2):(1'h1)] * $signed(wire9)))),
          (+$unsigned((reg35[(3'h7):(3'h6)] >= {wire47})))};
      if (((wire47 ?
              (wire7 ?
                  ($unsigned(reg35) != $unsigned((8'hb2))) : $signed((~wire47))) : (~&wire9[(5'h13):(5'h11)])) ?
          (($signed(reg27) >= reg38[(1'h0):(1'h0)]) | $signed((~|$unsigned(wire40)))) : wire9))
        begin
          reg52 <= ((+((^$signed(reg29)) ?
              ($unsigned(reg36) ~^ $unsigned(wire46)) : (^reg50))) & (reg27[(4'hc):(4'h9)] ?
              ((!$signed(wire43)) == ((wire9 ? reg51 : reg36) >> (wire44 ?
                  reg30 : reg35))) : (reg27[(4'h9):(3'h6)] + $unsigned((~reg35)))));
        end
      else
        begin
          if (wire11)
            begin
              reg52 <= $unsigned(((^~((reg26 ? (7'h41) : reg34) < wire8)) ?
                  (!reg38[(2'h2):(1'h0)]) : reg31));
            end
          else
            begin
              reg52 <= $unsigned((-(~|(~$signed(wire44)))));
              reg53 <= reg30;
            end
          reg54 <= $signed(reg36);
          reg55 <= (8'hae);
        end
    end
  always
    @(posedge clk) begin
      reg56 <= wire10[(3'h4):(1'h1)];
      if ((^wire9[(2'h2):(1'h1)]))
        begin
          reg57 <= (reg35 ? wire43 : ((~wire47) != wire43[(5'h10):(4'he)]));
          reg58 <= (~|reg32);
        end
      else
        begin
          reg57 <= (((8'ha3) >>> (~^reg29[(3'h4):(2'h2)])) != $unsigned($signed(((wire47 ?
              reg36 : wire25) != (+(8'ha8))))));
          reg58 <= $unsigned({$unsigned((~^$signed((8'hb4))))});
        end
    end
  assign wire59 = wire49;
  assign wire60 = reg58;
  assign wire61 = $signed($unsigned($signed((~^(&reg55)))));
  assign wire62 = $unsigned(reg55[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if ({{($unsigned({(8'hb7)}) >= (^~$unsigned(wire43))), reg36},
          ((~reg58[(3'h5):(1'h0)]) <= reg54[(5'h14):(3'h7)])})
        begin
          if ($unsigned(((~^$unsigned($unsigned(wire8))) >>> reg57)))
            begin
              reg63 <= (8'h9d);
              reg64 <= ($unsigned($signed($unsigned((reg33 && (8'ha2))))) ?
                  ($unsigned($unsigned((8'ha3))) == $unsigned((8'hbe))) : ($unsigned(((reg39 >>> reg32) ?
                      wire47[(3'h4):(2'h3)] : $unsigned(reg58))) >>> ({reg38[(2'h2):(1'h1)]} ?
                      (!wire47) : $signed((-reg56)))));
              reg65 <= $signed(($signed(((reg58 > reg50) || $signed(reg33))) * reg52[(5'h15):(4'h8)]));
            end
          else
            begin
              reg63 <= (reg50 ?
                  ((|(~|(reg28 ?
                      wire61 : reg54))) == (&(wire43 >> wire60))) : {reg56[(2'h2):(2'h2)],
                      ((^~(8'hb0)) & (wire9 <= (wire49 && reg26)))});
            end
          reg66 <= ((reg32 ?
                  (wire47[(4'h9):(2'h2)] <<< $unsigned(reg32[(3'h4):(2'h3)])) : $signed({$signed(reg32),
                      reg39})) ?
              $signed($signed(reg26)) : reg29[(1'h1):(1'h0)]);
          reg67 <= (^$unsigned($signed($unsigned(wire46[(3'h4):(2'h3)]))));
          if ((+(~&{{reg67, reg55[(4'ha):(3'h7)]}})))
            begin
              reg68 <= (reg36 || wire59);
              reg69 <= {($signed($signed({wire8,
                      reg30})) | ((reg52 * $unsigned(wire41)) ?
                      ({reg68} <= reg57[(4'ha):(4'ha)]) : $signed($unsigned(reg34))))};
              reg70 <= $signed(reg54);
              reg71 <= $unsigned((8'hbe));
            end
          else
            begin
              reg68 <= (reg70 ?
                  wire43[(5'h13):(1'h1)] : $unsigned({reg58[(1'h0):(1'h0)],
                      $signed((wire11 ? wire23 : reg39))}));
              reg69 <= reg51[(1'h0):(1'h0)];
              reg70 <= {wire47,
                  {($unsigned((wire59 | (8'ha4))) ?
                          $unsigned(wire42[(1'h0):(1'h0)]) : $unsigned(((8'hb0) ?
                              reg68 : wire49))),
                      {(~^(wire49 || reg54)),
                          (((8'ha8) <<< reg66) ? (8'hb8) : $unsigned(reg66))}}};
            end
        end
      else
        begin
          reg63 <= $unsigned(((wire23 ? $unsigned($unsigned(reg57)) : reg52) ?
              wire47[(3'h7):(3'h6)] : ($unsigned((reg69 >= reg33)) ?
                  $unsigned({reg36, reg35}) : reg66)));
        end
      reg72 <= reg52;
      if ($signed((reg68 ? (|(reg55[(4'hf):(4'h8)] << {reg63})) : wire10)))
        begin
          reg73 <= ((($signed($unsigned(reg64)) > $unsigned(reg63)) ?
              $signed(({wire23, wire9} ?
                  $unsigned(wire40) : reg56)) : $unsigned((reg71 ?
                  (reg55 || reg70) : $signed((8'hb8))))) || wire61[(2'h3):(2'h3)]);
          reg74 <= ($signed((((!wire25) == wire42[(2'h3):(1'h0)]) ?
                  reg53 : wire59)) ?
              ((-$unsigned($unsigned(wire8))) ^ ({$unsigned(reg52)} ?
                  ($unsigned(reg71) ?
                      (&(7'h44)) : wire41[(1'h1):(1'h0)]) : {reg54})) : $unsigned(wire62[(3'h6):(1'h0)]));
        end
      else
        begin
          if ({reg69, (^reg38[(1'h1):(1'h0)])})
            begin
              reg73 <= ((($unsigned((reg38 ? reg38 : (8'haf))) > $signed({reg52,
                      wire7})) ?
                  wire11[(3'h5):(1'h1)] : $unsigned(wire49)) != $unsigned((~$unsigned($signed(reg36)))));
            end
          else
            begin
              reg73 <= {(reg37 ?
                      ($signed((~&reg65)) ?
                          reg29 : $signed($unsigned((8'hba)))) : ($unsigned($unsigned((8'ha3))) ^~ (&(reg58 - wire48))))};
              reg74 <= ((8'ha1) <<< reg73);
              reg75 <= (((~(!reg71[(2'h3):(1'h0)])) ?
                  wire60 : (^~{$unsigned(reg34),
                      ((8'ha1) ? wire60 : reg34)})) < reg66);
              reg76 <= (reg32 && wire46);
            end
          reg77 <= wire49;
          reg78 <= wire43;
          reg79 <= wire60[(4'ha):(3'h5)];
          reg80 <= (reg68[(1'h0):(1'h0)] ?
              (reg26[(3'h7):(3'h4)] ? wire25 : reg52) : ((^((-(7'h43)) ?
                  $unsigned(reg79) : $signed(wire44))) << wire46));
        end
    end
  assign wire81 = wire61;
  module82 #() modinst101 (wire100, clk, reg45, reg51, reg26, wire62, wire81);
endmodule

module module82
#(parameter param98 = (({(((8'hae) ? (8'haf) : (8'hab)) == ((8'h9e) ? (8'hbd) : (8'ha4)))} || (((~&(8'ha1)) + (|(7'h40))) ? (~^((8'hb2) ? (8'hb7) : (8'h9c))) : (~|(+(8'haa))))) ~^ {({{(7'h43)}, (~^(8'ha1))} ? (((8'hba) ? (8'hb8) : (7'h44)) + (&(8'haa))) : {((8'haf) ? (8'ha5) : (8'hae)), ((8'ha0) ? (8'hae) : (8'hbd))}), ((-{(8'hb1)}) ? {((8'hbf) - (8'ha9))} : (~|((8'hbd) ? (8'haa) : (8'hbf))))}), 
parameter param99 = param98)
(y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire87;
  input wire [(4'h8):(1'h0)] wire86;
  input wire [(3'h4):(1'h0)] wire85;
  input wire signed [(3'h5):(1'h0)] wire84;
  input wire signed [(5'h15):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire97;
  wire signed [(4'h8):(1'h0)] wire96;
  wire signed [(5'h15):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire90;
  wire signed [(2'h2):(1'h0)] wire89;
  wire [(4'h9):(1'h0)] wire88;
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire90,
                 wire89,
                 wire88,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire88 = wire87;
  assign wire89 = $signed({wire84, {(7'h41)}});
  assign wire90 = ($unsigned((((wire87 - wire89) ?
                      (-wire89) : wire85[(1'h1):(1'h0)]) ^ wire89)) ^ $unsigned(($signed($signed(wire84)) <= $unsigned({wire83}))));
  always
    @(posedge clk) begin
      reg91 <= (wire89[(2'h2):(2'h2)] ?
          ((+{(wire89 ^ wire89)}) ?
              $unsigned(wire89[(2'h2):(2'h2)]) : $unsigned($signed(((8'ha8) ?
                  wire89 : wire87)))) : $signed((~$unsigned((wire85 * wire85)))));
    end
  always
    @(posedge clk) begin
      reg92 <= {reg91[(3'h5):(3'h5)]};
      reg93 <= (wire89 & (wire89 ?
          $signed({(reg92 ? (8'hbc) : wire89),
              (^~wire89)}) : ((wire89[(1'h1):(1'h0)] ?
                  $signed(wire86) : $signed(reg92)) ?
              ((wire88 ? wire84 : wire88) < {wire85,
                  wire89}) : {wire89[(2'h2):(1'h0)], (-wire84)})));
      reg94 <= reg92[(4'hc):(4'hb)];
    end
  assign wire95 = wire86;
  assign wire96 = wire95[(4'hc):(1'h1)];
  assign wire97 = ((^~wire85[(3'h4):(2'h2)]) && (~^(^wire85)));
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h26):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire17;
  input wire [(4'hf):(1'h0)] wire16;
  input wire signed [(5'h10):(1'h0)] wire15;
  input wire signed [(2'h3):(1'h0)] wire14;
  input wire [(4'ha):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire18;
  assign y = {wire22, wire21, wire20, wire19, wire18, (1'h0)};
  assign wire18 = (((!$unsigned($unsigned(wire13))) == (~$signed(wire15))) ?
                      wire17[(4'hc):(2'h2)] : wire17[(5'h13):(1'h1)]);
  assign wire19 = (&(!wire13[(3'h4):(1'h0)]));
  assign wire20 = (|(8'hbd));
  assign wire21 = ($signed(wire13[(1'h0):(1'h0)]) ?
                      wire18[(3'h4):(1'h0)] : $unsigned({((wire15 == wire18) ?
                              (8'hb1) : ((8'hba) <<< (8'ha2))),
                          ($unsigned(wire17) ?
                              $signed(wire15) : wire15[(4'he):(3'h7)])}));
  assign wire22 = wire13;
endmodule
