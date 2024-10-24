module top
#(parameter param173 = (7'h40), 
parameter param174 = ((!(^(!(param173 >>> param173)))) == param173))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire172;
  wire [(3'h5):(1'h0)] wire171;
  wire [(3'h5):(1'h0)] wire170;
  wire [(5'h13):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire155;
  wire [(5'h10):(1'h0)] wire157;
  wire signed [(4'hb):(1'h0)] wire158;
  wire [(2'h2):(1'h0)] wire159;
  wire signed [(5'h10):(1'h0)] wire160;
  wire [(4'he):(1'h0)] wire166;
  wire signed [(4'hd):(1'h0)] wire167;
  wire [(3'h6):(1'h0)] wire168;
  reg signed [(4'h8):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg164 = (1'h0);
  reg [(3'h6):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg162 = (1'h0);
  reg [(5'h13):(1'h0)] reg161 = (1'h0);
  assign y = {wire172,
                 wire171,
                 wire170,
                 wire74,
                 wire5,
                 wire4,
                 wire155,
                 wire157,
                 wire158,
                 wire159,
                 wire160,
                 wire166,
                 wire167,
                 wire168,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 (1'h0)};
  assign wire4 = (~|$unsigned(((-wire0) ? {(wire1 ? wire1 : wire2)} : wire1)));
  assign wire5 = ((~wire1[(4'h8):(2'h2)]) ?
                     ($unsigned(wire0[(1'h0):(1'h0)]) ?
                         $unsigned(((wire3 > wire2) == $signed(wire2))) : $signed(($unsigned(wire0) ?
                             (~wire4) : $unsigned(wire2)))) : (8'hbc));
  module6 #() modinst75 (.wire7(wire1), .clk(clk), .wire8(wire2), .wire9(wire0), .wire11(wire5), .wire10(wire4), .y(wire74));
  module76 #() modinst156 (wire155, clk, wire1, wire0, wire4, wire3);
  assign wire157 = $unsigned({((8'hbd) & wire0)});
  assign wire158 = (~|wire4);
  assign wire159 = $signed(($signed(((~|wire158) >> (wire3 && wire74))) >= $signed((~&(wire74 <= (8'hac))))));
  assign wire160 = (wire5[(4'hd):(4'ha)] ?
                       wire3[(5'h11):(4'hb)] : wire155[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg161 <= ((wire74[(1'h1):(1'h1)] ?
              $unsigned(((wire5 ?
                  wire158 : wire3) < $signed(wire3))) : wire158) ?
          wire159[(1'h1):(1'h0)] : wire4[(2'h2):(1'h0)]);
      reg162 <= {(|wire157[(4'hc):(1'h0)])};
      reg163 <= ((wire160 ?
          $unsigned(($signed((7'h40)) < ((8'h9d) ~^ wire1))) : $signed(($unsigned((8'ha0)) ?
              wire2 : wire3))) ^ wire74);
      reg164 <= wire5[(4'hd):(4'ha)];
      reg165 <= ($signed($signed((reg164 | $unsigned(wire155)))) * (($signed(wire2[(5'h11):(3'h6)]) ?
          $unsigned($unsigned(wire2)) : $signed((&wire155))) <<< ($unsigned($unsigned((7'h44))) ?
          {$unsigned(reg161),
              (wire155 ? wire4 : wire1)} : wire157[(4'hc):(1'h0)])));
    end
  assign wire166 = wire4;
  assign wire167 = ($signed(wire1) < (&{(-(reg161 ? wire157 : wire2))}));
  module38 #() modinst169 (wire168, clk, wire160, wire2, wire167, wire74, wire0);
  assign wire170 = $unsigned(wire160[(3'h4):(1'h0)]);
  assign wire171 = ($unsigned($signed((8'hb1))) | (~(~|$signed(wire2[(2'h2):(1'h0)]))));
  assign wire172 = (8'hb8);
endmodule

module module76
#(parameter param154 = (((({(7'h40), (8'ha8)} ^~ ((8'hb3) + (8'h9c))) ~^ (!((8'hb9) ^~ (8'hb3)))) ? (8'hb2) : (&{((8'h9d) << (8'hac)), (-(8'hbc))})) >> (~|({((8'hb0) ? (8'hb9) : (8'hb8)), (+(8'h9c))} | ({(8'ha3)} ? ((8'ha1) ? (7'h41) : (7'h40)) : ((8'hbe) ? (8'hb8) : (8'hb2)))))))
(y, clk, wire77, wire78, wire79, wire80);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire77;
  input wire [(5'h15):(1'h0)] wire78;
  input wire [(5'h14):(1'h0)] wire79;
  input wire [(4'hd):(1'h0)] wire80;
  wire [(4'h9):(1'h0)] wire153;
  wire [(4'he):(1'h0)] wire148;
  wire signed [(3'h6):(1'h0)] wire147;
  wire [(5'h15):(1'h0)] wire138;
  wire [(4'hf):(1'h0)] wire120;
  wire signed [(5'h11):(1'h0)] wire119;
  wire [(5'h13):(1'h0)] wire118;
  wire [(2'h2):(1'h0)] wire117;
  wire [(4'hc):(1'h0)] wire81;
  wire signed [(5'h14):(1'h0)] wire82;
  wire signed [(5'h14):(1'h0)] wire83;
  wire signed [(4'hb):(1'h0)] wire85;
  wire [(3'h7):(1'h0)] wire86;
  wire [(5'h15):(1'h0)] wire87;
  wire [(4'hf):(1'h0)] wire88;
  wire [(3'h5):(1'h0)] wire115;
  reg [(5'h11):(1'h0)] reg152 = (1'h0);
  reg [(3'h6):(1'h0)] reg151 = (1'h0);
  reg [(3'h5):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg149 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg146 = (1'h0);
  reg [(2'h2):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg142 = (1'h0);
  reg [(4'hf):(1'h0)] reg141 = (1'h0);
  reg [(3'h7):(1'h0)] reg140 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  assign y = {wire153,
                 wire148,
                 wire147,
                 wire138,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire81,
                 wire82,
                 wire83,
                 wire85,
                 wire86,
                 wire87,
                 wire88,
                 wire115,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg84,
                 (1'h0)};
  assign wire81 = $unsigned(((wire79[(4'hb):(2'h2)] ?
                          ($signed(wire77) ?
                              ((8'haf) < wire80) : ((7'h42) != wire80)) : (wire80[(1'h0):(1'h0)] ?
                              (wire80 == wire78) : (~^(8'hb4)))) ?
                      $signed(wire77[(4'h8):(3'h6)]) : wire79[(5'h14):(1'h0)]));
  assign wire82 = $unsigned((~({(wire81 && wire80), $signed(wire77)} ?
                      {(~^wire80)} : wire77)));
  assign wire83 = {$unsigned((wire77[(4'hd):(1'h1)] ?
                          (wire82[(1'h0):(1'h0)] ?
                              $signed(wire81) : $signed(wire77)) : $unsigned(wire79[(4'he):(4'hd)])))};
  always
    @(posedge clk) begin
      reg84 <= wire82;
    end
  assign wire85 = $unsigned((wire78[(3'h5):(3'h5)] ?
                      ({wire80[(4'hb):(2'h2)], (!reg84)} ?
                          $unsigned((reg84 ?
                              (8'ha7) : wire83)) : (8'ha3)) : wire78));
  assign wire86 = (wire78[(1'h0):(1'h0)] ?
                      ($signed($signed((reg84 - wire78))) ?
                          {(((8'hac) ?
                                  (7'h41) : reg84) && reg84[(3'h5):(2'h2)])} : wire81[(3'h6):(2'h2)]) : wire82);
  assign wire87 = $signed((~&wire77));
  assign wire88 = (~&(((wire80 << wire85[(4'h8):(3'h5)]) ?
                          (^$signed(reg84)) : $signed($unsigned(wire79))) ?
                      ({{wire81}} ?
                          ((&wire80) != reg84[(3'h4):(3'h4)]) : $signed(wire86)) : $signed($signed((wire79 ~^ (8'ha3))))));
  module89 #() modinst116 (wire115, clk, reg84, wire81, wire79, wire82);
  assign wire117 = {(^($signed(((8'hba) + wire80)) ?
                           wire78[(4'he):(1'h0)] : ((wire83 ?
                               wire83 : wire81) ^~ wire82[(3'h7):(3'h7)])))};
  assign wire118 = $signed(((((wire85 ^~ wire80) ?
                               wire88[(2'h2):(1'h1)] : $signed(wire79)) ?
                           ((~|wire79) || reg84[(3'h7):(1'h0)]) : wire79[(5'h10):(2'h3)]) ?
                       (wire86 << wire86[(3'h5):(1'h0)]) : ($signed((!wire86)) ^ $unsigned(wire78[(4'h8):(3'h4)]))));
  assign wire119 = (+wire77);
  assign wire120 = wire115;
  module121 #() modinst139 (wire138, clk, wire118, wire81, wire120, wire82);
  always
    @(posedge clk) begin
      reg140 <= (wire77 ?
          ({(((8'hba) - wire81) ? wire77 : {wire120, wire119}),
              $unsigned(wire83[(5'h14):(2'h3)])} ^~ $signed(wire88)) : wire80);
      reg141 <= wire88;
      reg142 <= wire88;
      if (wire119[(2'h2):(2'h2)])
        begin
          if ($signed((|(&wire118[(2'h3):(1'h1)]))))
            begin
              reg143 <= $signed({$unsigned((^~$signed(wire120)))});
              reg144 <= wire80;
              reg145 <= $unsigned((|{(wire82 ? (+wire85) : (&wire119)),
                  (~reg143[(4'h8):(3'h7)])}));
            end
          else
            begin
              reg143 <= (wire115 || (+reg140[(3'h6):(2'h2)]));
            end
        end
      else
        begin
          reg143 <= {(&{wire87[(4'he):(4'h8)], reg141})};
          reg144 <= $signed((8'ha0));
          reg145 <= (~|($signed(wire80) && wire120));
          reg146 <= reg145;
        end
    end
  assign wire147 = {wire85[(3'h6):(3'h4)], wire118[(4'hd):(4'hc)]};
  assign wire148 = (((~&$unsigned(reg140)) <= wire115[(3'h5):(3'h4)]) ?
                       (^~$signed($signed(wire87))) : (((wire120 ?
                           $unsigned(wire82) : wire85) == {(reg144 ^~ reg141),
                           $unsigned(reg142)}) ~^ (wire147 ?
                           $unsigned($unsigned(reg141)) : (8'hb8))));
  always
    @(posedge clk) begin
      reg149 <= $unsigned((!({(|wire86)} * (|{(8'haa)}))));
      reg150 <= $signed(wire87);
      reg151 <= ($unsigned((reg141 ?
          ($unsigned(wire80) ?
              (wire83 ?
                  (8'hb1) : (8'haa)) : $unsigned(wire86)) : reg144)) + $unsigned((|(~|(wire87 ?
          reg144 : reg146)))));
      reg152 <= $signed(wire148);
    end
  assign wire153 = wire119[(1'h0):(1'h0)];
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire73;
  wire signed [(4'he):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire71;
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  assign y = {wire73,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire27,
                 wire28,
                 wire36,
                 wire37,
                 wire71,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire12 = $unsigned($unsigned(((wire9 ?
                          (wire7 ? wire9 : wire8) : wire10[(4'hb):(3'h4)]) ?
                      $signed($unsigned(wire9)) : ((+wire7) ?
                          (8'ha3) : (-wire7)))));
  assign wire13 = wire10;
  assign wire14 = $unsigned(wire8);
  assign wire15 = wire8[(3'h6):(1'h1)];
  assign wire16 = $unsigned(wire15);
  assign wire17 = ($signed(wire14[(2'h3):(1'h0)]) ?
                      (-(wire12[(2'h3):(1'h0)] ?
                          $signed($unsigned(wire7)) : ((~^wire7) - $unsigned(wire15)))) : wire9);
  assign wire18 = wire13[(4'h8):(2'h3)];
  assign wire19 = ({wire18} ?
                      (($signed({wire10}) >= ($signed(wire13) ?
                              ((8'hb1) == wire14) : wire9[(2'h2):(1'h0)])) ?
                          (wire14[(4'ha):(2'h2)] >>> (wire12 ?
                              $unsigned(wire16) : (wire8 ?
                                  wire15 : wire17))) : wire18) : ({(wire15[(2'h3):(2'h3)] ?
                                  $signed(wire13) : (|wire9))} ?
                          (^wire7[(2'h2):(1'h1)]) : wire8[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg20 <= $signed($unsigned(((~^wire15[(5'h11):(4'h9)]) ?
          $signed($signed(wire10)) : $signed($unsigned(wire11)))));
      reg21 <= ($signed($signed((-(!wire19)))) || $unsigned($unsigned(wire18)));
      reg22 <= $signed(wire10);
      reg23 <= (+(wire15[(4'ha):(4'ha)] >> (reg21[(3'h6):(2'h3)] ?
          $unsigned($signed(wire12)) : $signed(((8'hae) ? wire8 : wire17)))));
      if (($unsigned(wire18) ?
          (+$unsigned((~&(wire8 ?
              (8'haa) : (8'ha7))))) : $signed(wire12[(2'h2):(1'h1)])))
        begin
          reg24 <= $signed($signed((wire18[(4'hd):(3'h4)] && $unsigned((!reg21)))));
        end
      else
        begin
          if ({(({(reg22 ? (8'ha6) : wire8),
                      (reg24 ^ (7'h44))} < $signed(((8'hae) ?
                      reg23 : wire17))) ?
                  ((!{wire17, wire7}) ?
                      ({wire11} <= (wire16 ?
                          (8'ha9) : reg24)) : ((wire15 > (8'haf)) || ((8'hbc) ?
                          wire18 : wire11))) : (!$unsigned(wire9[(3'h4):(2'h2)])))})
            begin
              reg24 <= $signed(((+$signed((reg23 ?
                  (8'hb8) : wire15))) - (reg22 >> ((reg24 ~^ wire9) || (wire18 ?
                  wire8 : reg24)))));
              reg25 <= $unsigned(wire14);
              reg26 <= {($unsigned(wire10) >= wire15), wire14};
            end
          else
            begin
              reg24 <= (~^wire15[(3'h7):(3'h6)]);
              reg25 <= ((wire8 ?
                  (wire13[(3'h5):(3'h4)] || {$unsigned(wire12),
                      (~|reg21)}) : $unsigned(((wire8 >> reg25) ?
                      (reg23 + wire13) : wire14[(3'h5):(3'h5)]))) && {wire19,
                  {reg21[(2'h2):(2'h2)], $unsigned((wire7 ^ (8'ha4)))}});
            end
        end
    end
  assign wire27 = (^wire7);
  assign wire28 = $signed($unsigned(($signed((+wire19)) ?
                      ({wire9, wire27} & (wire12 ?
                          wire13 : wire27)) : ((^~reg20) ?
                          (~&reg24) : $signed(reg21)))));
  always
    @(posedge clk) begin
      if (reg25[(2'h3):(2'h3)])
        begin
          if ($signed((wire17 + $unsigned({$signed((8'hac)),
              ((8'hb0) == wire8)}))))
            begin
              reg29 <= $signed($signed((({wire8} ?
                      (!wire16) : (wire15 + wire13)) ?
                  $signed((wire8 ^~ reg20)) : $unsigned((wire9 | wire10)))));
              reg30 <= (~&$signed(($unsigned((wire13 >> wire10)) != (!$signed(wire12)))));
            end
          else
            begin
              reg29 <= ($unsigned($signed(wire10)) != reg25);
              reg30 <= wire28[(3'h4):(1'h1)];
              reg31 <= ((((^$unsigned(reg25)) ?
                      wire10[(4'ha):(3'h7)] : reg23[(2'h2):(1'h1)]) ?
                  reg22[(3'h5):(3'h5)] : reg23[(2'h2):(2'h2)]) < (^(wire19[(1'h1):(1'h0)] || wire15[(3'h4):(3'h4)])));
              reg32 <= $signed((((~|wire11[(1'h0):(1'h0)]) ?
                  (reg21[(4'hb):(3'h6)] != (~&wire18)) : ((reg30 ?
                          reg22 : reg25) ?
                      (7'h42) : reg20[(4'he):(3'h5)])) << reg25[(3'h7):(1'h0)]));
              reg33 <= wire11[(1'h0):(1'h0)];
            end
          reg34 <= $unsigned((|$unsigned($unsigned((+wire28)))));
        end
      else
        begin
          if ({$unsigned((wire12 + wire11))})
            begin
              reg29 <= reg25[(3'h4):(3'h4)];
              reg30 <= (&($signed(wire8) ?
                  wire17 : (reg34[(1'h1):(1'h1)] & $signed($signed(wire9)))));
              reg31 <= $unsigned($signed($signed($signed(reg21))));
              reg32 <= reg33;
            end
          else
            begin
              reg29 <= reg24[(3'h7):(2'h2)];
              reg30 <= $signed(($unsigned($unsigned({(8'h9c)})) + $signed((-(wire12 ?
                  wire9 : wire9)))));
              reg31 <= $signed(wire27[(3'h4):(1'h0)]);
              reg32 <= $unsigned(reg32);
              reg33 <= $signed($signed(reg33));
            end
          reg34 <= $signed(wire13);
        end
      reg35 <= $unsigned(((&$signed($signed(wire8))) | ({wire8,
          wire18} ^~ (wire28[(3'h5):(3'h5)] && (reg23 >= (8'hbf))))));
    end
  assign wire36 = (($unsigned((wire17[(3'h4):(2'h2)] ?
                      $unsigned(reg32) : wire7)) <<< (!((reg33 && wire28) >> $unsigned(reg22)))) < $signed(($unsigned((reg32 ?
                      wire28 : reg25)) && $unsigned((wire11 ?
                      reg21 : reg33)))));
  assign wire37 = $signed((!$unsigned($signed($signed(reg23)))));
  module38 #() modinst72 (.wire42(wire14), .wire41(reg21), .wire39(wire15), .wire43(wire11), .wire40(reg35), .y(wire71), .clk(clk));
  assign wire73 = $signed(((8'hbf) <<< $unsigned({(wire10 ? reg20 : wire12),
                      $unsigned(wire11)})));
endmodule

module module38  (y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire43;
  input wire [(5'h12):(1'h0)] wire42;
  input wire [(4'hd):(1'h0)] wire41;
  input wire [(5'h13):(1'h0)] wire40;
  input wire signed [(5'h12):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire70;
  wire [(4'hc):(1'h0)] wire62;
  wire [(2'h2):(1'h0)] wire61;
  wire [(3'h6):(1'h0)] wire60;
  wire [(5'h12):(1'h0)] wire59;
  wire [(3'h7):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire57;
  wire [(4'hf):(1'h0)] wire56;
  wire [(4'h8):(1'h0)] wire55;
  wire signed [(4'he):(1'h0)] wire44;
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  assign y = {wire70,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire44,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire44 = wire40[(4'he):(3'h6)];
  always
    @(posedge clk) begin
      if ($signed(wire44))
        begin
          if ($signed($signed($signed(wire40[(4'he):(2'h2)]))))
            begin
              reg45 <= ($signed((8'h9f)) >>> ($unsigned(wire40[(4'h9):(3'h4)]) < wire40));
              reg46 <= (~&$signed({((wire44 ? wire39 : (8'h9d)) ?
                      $unsigned(wire41) : (wire41 | (8'h9e))),
                  wire44}));
            end
          else
            begin
              reg45 <= {wire41,
                  ((wire41[(1'h0):(1'h0)] && ((~(8'hb3)) ? wire43 : wire40)) ?
                      (~$unsigned($signed((8'hbf)))) : $signed((~|{wire42,
                          wire43})))};
              reg46 <= ((^wire40) * reg46[(3'h4):(2'h3)]);
              reg47 <= reg45;
              reg48 <= (reg45 + ({wire42[(2'h3):(2'h2)],
                      (((8'hbf) != wire42) & wire42[(5'h11):(1'h0)])} ?
                  $unsigned($unsigned((wire42 | wire39))) : ($unsigned($unsigned(reg45)) ?
                      $unsigned((+wire43)) : {$signed(wire43),
                          $signed(reg46)})));
            end
          reg49 <= ((&((~^wire39[(3'h6):(2'h3)]) ?
              (~&(-reg47)) : $unsigned(reg46))) & (+{(reg48 ?
                  reg47[(4'h8):(1'h0)] : reg46)}));
          if ({{$unsigned(reg46[(1'h0):(1'h0)]), reg49},
              (~&(({reg45, reg45} ^ ((8'hb7) ? reg47 : wire44)) ?
                  (wire42[(2'h2):(1'h0)] ?
                      wire43[(4'h9):(3'h7)] : reg47) : ((reg46 ?
                          wire39 : wire42) ?
                      $unsigned(reg45) : (-wire40))))})
            begin
              reg50 <= $signed((&reg47[(4'hf):(4'h9)]));
              reg51 <= {($unsigned(($unsigned(reg45) > (|reg49))) ?
                      $signed(reg46) : {$signed($signed(wire40)),
                          wire40[(3'h4):(1'h0)]}),
                  $unsigned((~((wire43 ?
                      wire40 : reg50) - $unsigned(wire42))))};
            end
          else
            begin
              reg50 <= wire42[(3'h7):(3'h4)];
              reg51 <= $signed((~({(reg47 ?
                      wire40 : wire44)} | $signed(wire44[(4'he):(1'h1)]))));
              reg52 <= (reg48 ?
                  $unsigned(((8'hb7) ^ $unsigned($unsigned(wire40)))) : wire39);
              reg53 <= {$signed((($unsigned(wire43) ?
                          (reg47 ? wire44 : reg52) : (&wire42)) ?
                      $signed((reg52 ? reg45 : reg50)) : $unsigned(reg49)))};
            end
        end
      else
        begin
          reg45 <= {reg53[(4'h8):(2'h2)],
              $unsigned((+{$unsigned((8'ha1)), (reg45 ? reg51 : reg49)}))};
          reg46 <= reg48[(1'h1):(1'h0)];
          reg47 <= ($unsigned($signed((~^wire39))) >> (&((8'hb2) >> ((-wire41) ?
              reg51 : $signed(wire43)))));
        end
      reg54 <= $unsigned(((($signed((7'h43)) | (^reg52)) ?
              (8'ha7) : reg47[(4'h8):(3'h4)]) ?
          (reg52 <<< reg52) : {(+(reg49 | reg46)),
              ((reg50 > reg45) << reg47[(3'h6):(1'h0)])}));
    end
  assign wire55 = {((reg53[(2'h3):(1'h1)] ?
                          wire40 : (~&(reg53 ^ reg54))) - $unsigned(wire43))};
  assign wire56 = (!$unsigned(($unsigned(((8'hb4) < wire42)) ?
                      reg54[(3'h6):(3'h6)] : $signed((reg46 ?
                          reg45 : reg47)))));
  assign wire57 = $signed($unsigned($signed({$unsigned(wire39)})));
  assign wire58 = $signed($signed($unsigned(({wire56, (8'hb7)} ?
                      {reg49, wire39} : wire40))));
  assign wire59 = {$unsigned($unsigned($signed((reg47 ^~ wire55))))};
  assign wire60 = (&$unsigned(((-(wire55 <= (8'hb2))) >= {reg49, wire56})));
  assign wire61 = $unsigned($unsigned($unsigned(($signed(wire41) ?
                      reg46[(4'ha):(3'h7)] : wire58))));
  assign wire62 = (^{wire61[(1'h1):(1'h0)],
                      (((wire60 >= wire60) >= $signed(reg45)) + (^~wire58[(1'h0):(1'h0)]))});
  always
    @(posedge clk) begin
      reg63 <= $unsigned(reg50[(2'h2):(1'h1)]);
      reg64 <= wire58[(3'h6):(2'h2)];
      if ($unsigned(({(~^(reg50 ? (8'ha2) : wire43))} << wire58)))
        begin
          reg65 <= wire60;
          reg66 <= (~^$unsigned(($unsigned($unsigned(wire56)) < (^~(wire42 ?
              wire42 : reg65)))));
          reg67 <= reg63;
          reg68 <= ($unsigned(({reg49[(2'h3):(1'h1)]} ?
                  wire39[(4'hd):(1'h1)] : {wire61[(2'h2):(1'h0)],
                      (reg45 < wire61)})) ?
              (reg51 ? wire57 : reg67) : reg46[(4'ha):(2'h2)]);
        end
      else
        begin
          reg65 <= wire42;
          reg66 <= ((reg52[(1'h0):(1'h0)] ?
              (($unsigned(reg49) ? (|reg54) : $unsigned(reg51)) ?
                  ((reg67 || reg48) ?
                      $signed(wire59) : $signed(reg53)) : (~$signed(wire55))) : reg53) < $unsigned((wire62[(4'hb):(3'h5)] ?
              $signed(wire61[(2'h2):(2'h2)]) : ($signed(wire57) <= reg54))));
          reg67 <= {(^($unsigned(wire55[(4'h8):(3'h5)]) > (~^$signed(reg68)))),
              $signed($signed(reg49))};
          reg68 <= {reg54};
          reg69 <= (+(+$signed($unsigned($signed(wire62)))));
        end
    end
  assign wire70 = {reg68[(4'hd):(1'h0)],
                      ((((~&wire44) ?
                              reg52[(1'h0):(1'h0)] : $unsigned(reg49)) <= ((~|reg69) ?
                              (wire60 ? reg67 : wire59) : reg68)) ?
                          (!$unsigned(((8'hb3) ?
                              wire57 : reg46))) : $signed(($unsigned(reg63) ?
                              reg68 : (reg64 ? (8'hb5) : reg53))))};
endmodule

module module121  (y, clk, wire125, wire124, wire123, wire122);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire125;
  input wire [(4'hc):(1'h0)] wire124;
  input wire [(3'h7):(1'h0)] wire123;
  input wire signed [(5'h14):(1'h0)] wire122;
  wire [(4'hb):(1'h0)] wire128;
  wire [(4'he):(1'h0)] wire127;
  wire [(4'h9):(1'h0)] wire126;
  reg signed [(4'hf):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg135 = (1'h0);
  reg [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(2'h3):(1'h0)] reg133 = (1'h0);
  reg [(4'hc):(1'h0)] reg132 = (1'h0);
  reg [(5'h10):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg130 = (1'h0);
  reg [(4'hf):(1'h0)] reg129 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 (1'h0)};
  assign wire126 = $signed($signed(((wire124 ? (~|wire122) : (~wire124)) ?
                       $unsigned(wire124) : $signed((wire124 ?
                           wire125 : wire125)))));
  assign wire127 = (wire124[(1'h0):(1'h0)] >> ($unsigned(wire126[(2'h2):(2'h2)]) != (|$unsigned(wire124))));
  assign wire128 = wire124;
  always
    @(posedge clk) begin
      reg129 <= (|(~|wire127));
      reg130 <= $unsigned((wire125 >>> $signed((wire126[(1'h0):(1'h0)] ?
          $unsigned((8'hbe)) : (wire123 ^~ wire122)))));
      reg131 <= wire127[(3'h5):(3'h4)];
      if (wire128)
        begin
          if ($unsigned($unsigned(((wire126 ^~ (~^wire128)) >= ((~wire123) ?
              wire128 : ((8'h9d) ? wire127 : wire124))))))
            begin
              reg132 <= wire124;
              reg133 <= (reg132 ^~ wire127[(4'h9):(3'h5)]);
              reg134 <= (~((+reg131[(3'h7):(3'h5)]) || (wire126[(1'h0):(1'h0)] || (&reg130))));
            end
          else
            begin
              reg132 <= (($unsigned((8'hbb)) ?
                      ((reg131 ? reg131 : (+reg131)) * {(~^reg131),
                          (reg130 - wire128)}) : reg131[(4'h9):(3'h5)]) ?
                  reg132 : $unsigned($signed((^reg130[(3'h7):(3'h5)]))));
              reg133 <= (8'ha4);
              reg134 <= $unsigned(wire123[(3'h4):(3'h4)]);
              reg135 <= reg129;
              reg136 <= {(|wire125[(1'h0):(1'h0)])};
            end
          reg137 <= (wire128 ?
              (-$signed(((wire123 != reg132) ?
                  $signed(wire126) : $signed(wire124)))) : {reg135[(2'h3):(1'h0)]});
        end
      else
        begin
          reg132 <= $unsigned(reg136);
        end
    end
endmodule

module module89  (y, clk, wire93, wire92, wire91, wire90);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire93;
  input wire [(4'h9):(1'h0)] wire92;
  input wire [(4'hf):(1'h0)] wire91;
  input wire [(4'h9):(1'h0)] wire90;
  wire [(4'hc):(1'h0)] wire114;
  wire [(5'h10):(1'h0)] wire113;
  wire [(2'h3):(1'h0)] wire112;
  wire [(4'hc):(1'h0)] wire111;
  wire [(4'ha):(1'h0)] wire110;
  wire [(5'h13):(1'h0)] wire109;
  wire [(3'h5):(1'h0)] wire97;
  wire [(3'h5):(1'h0)] wire96;
  wire [(5'h14):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire94;
  reg [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  reg [(4'h9):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg100 = (1'h0);
  reg [(2'h2):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 (1'h0)};
  assign wire94 = wire93[(4'hd):(4'hc)];
  assign wire95 = (($signed((~^wire94[(1'h0):(1'h0)])) ?
                      wire91 : wire92) <= {wire93, $signed(wire94)});
  assign wire96 = (^~(!wire93[(2'h3):(2'h3)]));
  assign wire97 = {(((&(wire90 ? wire94 : wire90)) ?
                          {wire91} : wire90) >>> (8'ha5)),
                      wire90};
  always
    @(posedge clk) begin
      reg98 <= $unsigned($signed(((^(wire97 ? wire94 : wire94)) ?
          $unsigned((wire95 ? wire91 : (8'hbb))) : wire91)));
      reg99 <= reg98;
      if (((~$unsigned($unsigned((wire96 ?
          (7'h43) : wire93)))) << wire90[(2'h3):(2'h3)]))
        begin
          reg100 <= (8'h9c);
          reg101 <= $signed({{(&(wire95 > wire94))},
              (wire94[(1'h0):(1'h0)] ^~ wire94)});
          reg102 <= wire97;
        end
      else
        begin
          reg100 <= $signed(wire94[(1'h1):(1'h1)]);
          reg101 <= $signed($signed((wire90 ?
              {(^~wire90)} : (-$signed(wire94)))));
          reg102 <= (8'ha7);
          reg103 <= reg98;
        end
    end
  always
    @(posedge clk) begin
      if ($signed(wire93))
        begin
          reg104 <= (8'hab);
          reg105 <= (^reg98[(3'h5):(3'h5)]);
          reg106 <= (reg99 ^ (~&wire95));
          reg107 <= (^($signed($unsigned(wire92[(2'h3):(2'h3)])) && (-{wire94,
              {wire90, (8'hb7)}})));
          reg108 <= wire91;
        end
      else
        begin
          reg104 <= wire96;
          reg105 <= {((!$unsigned($signed(reg98))) ?
                  {$signed(((8'hbf) - wire90)),
                      (~|$signed((8'hae)))} : wire93[(2'h2):(2'h2)]),
              $unsigned($signed({$unsigned(wire97), $signed(wire90)}))};
          reg106 <= (reg98[(1'h1):(1'h0)] ?
              ((^$signed(reg102)) <= reg107) : (+$unsigned($unsigned(reg107))));
          reg107 <= $signed(wire94[(1'h1):(1'h0)]);
        end
    end
  assign wire109 = reg107[(1'h0):(1'h0)];
  assign wire110 = $signed(reg108);
  assign wire111 = reg103[(1'h0):(1'h0)];
  assign wire112 = (8'hb1);
  assign wire113 = $signed((~((~&{(8'ha1), reg105}) << reg108)));
  assign wire114 = $unsigned(wire93);
endmodule
