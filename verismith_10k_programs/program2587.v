module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire160;
  wire signed [(4'hd):(1'h0)] wire159;
  wire signed [(5'h11):(1'h0)] wire158;
  wire [(5'h13):(1'h0)] wire156;
  wire [(3'h7):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire68;
  assign y = {wire160, wire159, wire158, wire156, wire70, wire68, (1'h0)};
  module4 #() modinst69 (.wire7(wire1), .wire5(wire2), .wire6(wire3), .wire8(wire0), .y(wire68), .clk(clk));
  assign wire70 = $unsigned(($unsigned(wire68[(4'hb):(3'h4)]) * $signed($signed($signed((8'h9d))))));
  module71 #() modinst157 (wire156, clk, wire2, wire1, wire3, wire70);
  assign wire158 = wire2;
  assign wire159 = {wire3[(5'h14):(1'h0)]};
  assign wire160 = {wire3};
endmodule

module module71  (y, clk, wire72, wire73, wire74, wire75);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire72;
  input wire signed [(5'h14):(1'h0)] wire73;
  input wire signed [(5'h15):(1'h0)] wire74;
  input wire [(3'h7):(1'h0)] wire75;
  wire [(4'hf):(1'h0)] wire155;
  wire [(5'h13):(1'h0)] wire154;
  wire [(2'h3):(1'h0)] wire153;
  wire [(4'h8):(1'h0)] wire76;
  wire [(4'h9):(1'h0)] wire77;
  wire signed [(4'hb):(1'h0)] wire96;
  wire signed [(5'h11):(1'h0)] wire103;
  wire signed [(4'h8):(1'h0)] wire104;
  wire signed [(2'h3):(1'h0)] wire105;
  wire signed [(3'h5):(1'h0)] wire106;
  wire [(4'h9):(1'h0)] wire107;
  wire [(4'hb):(1'h0)] wire151;
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  reg [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(4'h9):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg89 = (1'h0);
  reg [(3'h7):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(4'h8):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg78 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire76,
                 wire77,
                 wire96,
                 wire103,
                 wire104,
                 wire105,
                 wire106,
                 wire107,
                 wire151,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
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
                 (1'h0)};
  assign wire76 = (-(&$unsigned((^{(8'hb3)}))));
  assign wire77 = ((~^(!wire75[(1'h1):(1'h1)])) ?
                      $unsigned(wire73) : (^{$signed({(8'hbb), wire75})}));
  always
    @(posedge clk) begin
      reg78 <= $signed(wire72);
      if (wire76)
        begin
          if (wire75[(3'h5):(2'h3)])
            begin
              reg79 <= wire77[(1'h0):(1'h0)];
            end
          else
            begin
              reg79 <= (|(+$unsigned(wire72[(3'h7):(3'h5)])));
            end
          if ({(((wire76 << (reg79 ? wire75 : wire76)) > wire77) != {(8'hbb),
                  wire74}),
              (reg78[(1'h1):(1'h1)] >= ({(~&wire72), (-wire76)} ?
                  ($signed(reg78) ?
                      (-wire73) : (reg79 ?
                          wire73 : reg79)) : ($signed(reg78) >> reg79[(1'h1):(1'h1)])))})
            begin
              reg80 <= (wire72[(3'h7):(3'h7)] == wire73[(4'h9):(3'h6)]);
              reg81 <= $unsigned($signed(wire76));
              reg82 <= (~^reg80);
              reg83 <= $unsigned($signed((^($signed(wire73) ?
                  (~&reg80) : (~^wire74)))));
            end
          else
            begin
              reg80 <= $unsigned($signed(reg83));
              reg81 <= {{$signed(reg81[(1'h1):(1'h1)]),
                      {((!reg82) ? (~&wire77) : wire73[(4'h9):(2'h2)])}},
                  reg79};
            end
          if (reg82[(1'h0):(1'h0)])
            begin
              reg84 <= (^(reg81[(3'h6):(2'h3)] ?
                  (((wire74 ?
                      reg80 : wire73) - wire72) - (^~reg81[(2'h3):(1'h1)])) : (reg79[(4'h9):(3'h7)] && ((&reg83) ?
                      $unsigned(wire75) : reg81))));
            end
          else
            begin
              reg84 <= (&{(reg82[(2'h3):(2'h2)] ~^ reg84[(4'ha):(3'h6)])});
              reg85 <= {(reg80 <= $signed(reg82)), (|(7'h41))};
              reg86 <= $unsigned((~&reg84[(4'hf):(1'h1)]));
            end
        end
      else
        begin
          if (($signed((7'h42)) > $signed(reg84[(2'h2):(1'h0)])))
            begin
              reg79 <= ($signed($unsigned(($unsigned((8'h9f)) ?
                  wire77[(1'h0):(1'h0)] : (|wire76)))) - wire73[(2'h2):(1'h0)]);
              reg80 <= wire76;
              reg81 <= (((({(8'ha5), wire75} ?
                      (reg83 ? (8'ha0) : reg81) : reg86) << {{reg83, reg81},
                      reg83[(3'h4):(2'h3)]}) || $unsigned($unsigned($unsigned(reg86)))) ?
                  reg85 : $unsigned($unsigned($unsigned({reg78}))));
              reg82 <= $signed(($unsigned((wire76 ?
                  wire73 : $unsigned(reg84))) <<< ({wire75,
                  wire72} == (8'hb4))));
              reg83 <= wire77[(2'h2):(2'h2)];
            end
          else
            begin
              reg79 <= reg78;
              reg80 <= ((reg80[(1'h1):(1'h0)] != reg78[(3'h4):(2'h3)]) ?
                  $unsigned((8'hae)) : ($signed(reg83[(2'h3):(1'h1)]) ?
                      (reg85[(3'h7):(3'h6)] ?
                          $signed((wire77 ?
                              wire73 : reg81)) : $signed(reg78)) : wire74[(5'h10):(4'ha)]));
            end
        end
      reg87 <= $unsigned($unsigned($unsigned($signed($unsigned(reg86)))));
      if ((((&$unsigned((&reg85))) + wire74) >= $signed(($unsigned((reg84 | wire72)) ?
          (~&wire72[(4'h9):(1'h0)]) : wire76[(1'h0):(1'h0)]))))
        begin
          if ($signed((($unsigned(reg86[(3'h6):(3'h6)]) >= ((reg79 < wire74) != {reg78})) < $signed(($signed(wire72) | (reg79 << wire73))))))
            begin
              reg88 <= $unsigned($unsigned((8'hb0)));
              reg89 <= $signed({reg80,
                  (reg84[(1'h0):(1'h0)] ?
                      $signed((8'hbe)) : $unsigned($unsigned(reg83)))});
            end
          else
            begin
              reg88 <= $unsigned(({(|(|reg88))} ? reg86 : reg87));
              reg89 <= (~^reg81[(4'h8):(1'h1)]);
              reg90 <= reg83;
            end
          if (({($unsigned($signed(wire73)) ?
                  reg87[(1'h0):(1'h0)] : ((!reg81) >= $signed(reg83)))} ^~ $unsigned((-(~wire72[(3'h5):(3'h5)])))))
            begin
              reg91 <= wire77[(4'h8):(3'h5)];
              reg92 <= reg83;
              reg93 <= $signed((reg87[(2'h3):(1'h1)] < (-{reg83})));
              reg94 <= $signed($unsigned($signed(reg92)));
              reg95 <= wire72[(3'h6):(1'h1)];
            end
          else
            begin
              reg91 <= (~(^(reg92[(3'h6):(3'h6)] * (reg84[(5'h11):(3'h5)] ^~ (8'hba)))));
              reg92 <= $signed(reg78[(4'h8):(2'h2)]);
              reg93 <= $unsigned(reg81[(2'h2):(1'h0)]);
              reg94 <= reg89;
            end
        end
      else
        begin
          if ($unsigned((reg81 && (-((reg86 ?
              wire74 : wire72) + (reg92 <<< reg90))))))
            begin
              reg88 <= {(((reg94 ?
                      (reg87 ?
                          wire72 : wire76) : (~&reg89)) >> reg89) == reg92[(3'h5):(3'h5)])};
              reg89 <= $signed((+$unsigned($unsigned($unsigned(reg81)))));
              reg90 <= wire77;
            end
          else
            begin
              reg88 <= (^~{({(reg92 ? reg90 : reg95),
                      (~^wire75)} << ($signed(reg88) ?
                      $signed((8'ha9)) : reg89)),
                  ((8'ha5) ?
                      ((wire74 ? wire72 : reg92) ?
                          {(8'h9c), (8'ha1)} : $signed(reg78)) : (~^(wire72 ?
                          reg82 : (8'hbd))))});
            end
          if ({((reg86 << (^{reg94})) ? $signed((!(^~reg87))) : wire77), reg88})
            begin
              reg91 <= reg91[(3'h6):(2'h2)];
              reg92 <= (8'hbe);
              reg93 <= (~(^~wire73[(4'hf):(3'h6)]));
              reg94 <= $signed(((8'ha6) >>> reg94[(3'h4):(1'h0)]));
            end
          else
            begin
              reg91 <= (|(reg89 >= {(~$signed(reg85)), (8'ha1)}));
              reg92 <= (($unsigned((~&(!reg88))) ?
                  $signed((-$signed((7'h43)))) : $signed(reg87[(2'h3):(2'h3)])) == reg79[(3'h5):(2'h2)]);
              reg93 <= reg81[(3'h6):(2'h2)];
              reg94 <= ({$unsigned($unsigned($unsigned(reg91)))} & wire77[(3'h6):(2'h3)]);
            end
        end
    end
  assign wire96 = $unsigned($unsigned((~&reg87)));
  always
    @(posedge clk) begin
      reg97 <= ($signed({reg85[(4'h9):(1'h0)], (&$signed(reg91))}) ?
          (|{reg94}) : reg86);
      if (((~|reg88[(2'h3):(1'h1)]) & $unsigned(((-reg92) ?
          ((wire74 <<< (8'ha3)) ?
              reg79 : $signed(reg91)) : wire96[(2'h2):(1'h1)]))))
        begin
          reg98 <= $signed($unsigned($unsigned(reg82[(5'h12):(3'h4)])));
        end
      else
        begin
          reg98 <= $unsigned((~^$signed(reg85[(2'h2):(1'h0)])));
          reg99 <= $signed(reg95[(3'h5):(3'h5)]);
        end
      reg100 <= (($unsigned($signed($unsigned(wire75))) ?
          reg79 : $unsigned(reg86[(3'h5):(3'h5)])) >= ((((&reg89) ?
                  (reg90 ? reg90 : reg78) : (wire74 == reg88)) ?
              reg98 : {$unsigned(reg87), (~|wire75)}) ?
          $unsigned(wire76) : reg89[(1'h1):(1'h1)]));
    end
  always
    @(posedge clk) begin
      reg101 <= $signed((8'h9d));
      reg102 <= (reg79[(4'h8):(1'h0)] ?
          {wire75} : $signed({$unsigned($signed(wire96))}));
    end
  assign wire103 = (~^$unsigned((~$signed(wire72))));
  assign wire104 = {$signed(($signed((reg81 ?
                           reg101 : reg87)) ~^ $signed({reg83, reg87}))),
                       (+wire96[(3'h4):(1'h1)])};
  assign wire105 = ({(($signed(reg93) | (reg91 & (8'ha8))) && $signed(reg102[(1'h0):(1'h0)])),
                       wire75[(3'h4):(1'h1)]} || reg80[(3'h4):(2'h2)]);
  assign wire106 = reg90;
  assign wire107 = wire106;
  module108 #() modinst152 (.wire111(wire103), .clk(clk), .wire110(reg99), .wire109(reg78), .wire112(wire74), .y(wire151), .wire113(wire75));
  assign wire153 = $signed({reg79[(3'h6):(3'h4)]});
  assign wire154 = reg87[(3'h7):(2'h2)];
  assign wire155 = ((-({reg101, ((8'ha2) && (8'hb1))} * ((^~reg93) ?
                       $signed(wire154) : $unsigned((8'hb6))))) ^~ reg100);
endmodule

module module4
#(parameter param66 = ((((~^(!(8'hb1))) - (((8'haf) ^~ (8'hb9)) ? (~(8'hae)) : ((7'h42) || (8'ha0)))) ? ((((8'hb4) ? (8'hb2) : (8'h9f)) & (+(8'ha7))) ? (((7'h43) << (8'ha4)) ? ((8'hbf) >>> (7'h43)) : (-(8'ha0))) : (!((7'h43) <= (8'hb6)))) : (((+(8'hb4)) >> ((8'h9e) ? (8'ha7) : (8'ha6))) + ({(8'hb2)} ? ((7'h41) ? (8'hb4) : (8'ha4)) : ((8'hb4) <<< (8'hb4))))) ? {(~^(-{(8'ha8)})), (({(8'ha1), (7'h40)} < ((8'ha8) ? (8'hb9) : (8'hb0))) ? ((~&(8'had)) ? ((8'ha0) ? (7'h44) : (8'h9f)) : ((7'h42) * (8'hbe))) : ((-(7'h40)) ? ((8'hae) ? (8'ha0) : (8'ha8)) : (^~(8'ha2))))} : (~^(8'ha0))), 
parameter param67 = (((((param66 ~^ param66) || (!param66)) ? (^(param66 <= (8'hba))) : (!(-param66))) > (~((~|param66) && (8'hb0)))) || {((param66 ? param66 : (|param66)) ? param66 : {(param66 ? param66 : param66)})}))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire6;
  input wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire64;
  wire signed [(3'h7):(1'h0)] wire63;
  wire signed [(5'h13):(1'h0)] wire62;
  wire [(4'he):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire60;
  wire [(4'hc):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire58;
  wire [(4'he):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire45,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
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
  assign wire9 = wire6[(4'h8):(3'h6)];
  assign wire10 = $unsigned(((({wire5, (8'ha3)} ?
                              $signed((7'h40)) : (wire5 <<< wire7)) ?
                          ((+wire7) ?
                              (wire5 ?
                                  wire6 : (8'h9e)) : {wire6}) : wire9[(3'h4):(3'h4)]) ?
                      wire9[(1'h1):(1'h1)] : ($signed((wire9 > wire6)) ?
                          (8'h9d) : $signed(wire5))));
  assign wire11 = wire5;
  assign wire12 = {wire10[(3'h5):(2'h2)],
                      (!$signed((wire5 ? wire8 : $signed(wire7))))};
  module13 #() modinst46 (wire45, clk, wire9, wire8, wire5, wire7);
  always
    @(posedge clk) begin
      reg47 <= ($unsigned((8'h9d)) || (wire12[(1'h1):(1'h0)] ^ (+(wire6[(2'h3):(2'h2)] ?
          wire8[(3'h6):(2'h3)] : wire45))));
      if ($signed((8'hb2)))
        begin
          reg48 <= (wire12 - $unsigned(($signed(wire12[(2'h3):(1'h1)]) ?
              $signed((^~wire8)) : ((&wire9) ?
                  $signed(wire6) : $signed(wire6)))));
          reg49 <= $signed((-wire10[(1'h1):(1'h1)]));
          reg50 <= ((|{($unsigned((8'hb3)) ?
                  (^~wire6) : reg47)}) || (($unsigned($signed(wire12)) ?
                  ((wire45 ? wire45 : reg48) ?
                      (wire7 ? (8'hb4) : wire6) : (wire10 ?
                          wire12 : (8'ha8))) : $signed((wire11 ?
                      wire9 : wire45))) ?
              wire8[(1'h0):(1'h0)] : {((!(8'h9d)) ?
                      wire45 : (reg49 ? wire12 : wire8)),
                  $unsigned($signed(wire7))}));
          reg51 <= ((({((8'hac) ? (8'hab) : (8'hb9)), (wire5 ? wire8 : reg50)} ?
                  $signed({wire11}) : reg49[(3'h5):(2'h2)]) > wire45) ?
              reg50 : {($unsigned($signed((8'hb4))) >>> {reg47[(4'h9):(3'h7)],
                      (reg48 ? reg47 : (8'hbd))})});
        end
      else
        begin
          reg48 <= (reg48 != $signed(reg50));
          reg49 <= $signed(reg48);
          if (($signed(wire5) | ($signed(($signed(wire8) - $signed(reg47))) ^ $signed($signed($unsigned(wire6))))))
            begin
              reg50 <= (~wire12);
              reg51 <= (~(+wire9));
              reg52 <= $signed(reg51);
            end
          else
            begin
              reg50 <= $unsigned(wire11);
              reg51 <= (~&$signed($signed($unsigned(wire5[(4'hf):(3'h6)]))));
              reg52 <= $unsigned((({(reg49 << reg50), $unsigned((8'hab))} ?
                      reg50[(4'he):(3'h5)] : reg47) ?
                  ($signed($unsigned((8'ha7))) <= ($signed(wire12) ?
                      $signed(wire7) : wire9)) : reg51));
              reg53 <= {(~^$signed(wire9))};
            end
        end
      reg54 <= ($unsigned($unsigned($signed(((8'hb1) ? (8'had) : (8'hb9))))) ?
          (wire8[(4'h8):(2'h2)] == {$signed({wire11, wire45}),
              reg51[(4'h9):(1'h0)]}) : wire11[(4'ha):(1'h0)]);
      reg55 <= $unsigned($signed((~(+(&reg47)))));
    end
  assign wire56 = (8'haa);
  assign wire57 = $signed(reg51[(3'h6):(3'h4)]);
  assign wire58 = $unsigned(reg51[(3'h6):(1'h1)]);
  assign wire59 = wire58;
  assign wire60 = $signed((-(reg50 ?
                      reg50[(4'ha):(3'h7)] : $signed(reg49[(3'h5):(2'h2)]))));
  assign wire61 = $unsigned(wire56);
  assign wire62 = {(8'hb1), ((~&(~^(~|reg53))) ? reg48 : $unsigned((8'ha4)))};
  assign wire63 = (wire57 << wire5[(3'h6):(1'h1)]);
  assign wire64 = (wire9 ^ ((~&$unsigned((wire63 ? reg55 : wire56))) ?
                      (~&((wire10 + reg49) || reg49)) : wire8));
  assign wire65 = wire6;
endmodule

module module13
#(parameter param43 = (^~(({(+(8'hb0))} ? (~&((8'ha8) != (8'hb2))) : ((^(8'hbf)) >= ((8'hbc) ? (8'hbe) : (8'ha2)))) ? ({((8'hb1) ? (8'hb6) : (8'ha5))} && (((8'ha9) ? (8'ha9) : (8'ha6)) ? ((8'haa) >>> (8'h9d)) : (^~(8'hbf)))) : (((!(8'hb8)) ? ((8'hab) << (8'hb2)) : ((8'hae) ? (8'hb3) : (8'h9e))) ? (8'ha3) : ((~^(8'hb8)) ? ((8'hb6) != (8'hbb)) : {(8'ha2)})))), 
parameter param44 = (param43 ? {param43} : (~^param43)))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire17;
  input wire [(2'h2):(1'h0)] wire16;
  input wire [(5'h10):(1'h0)] wire15;
  input wire signed [(3'h4):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire18;
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire38,
                 wire37,
                 wire36,
                 wire31,
                 wire30,
                 wire29,
                 wire18,
                 reg40,
                 reg39,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
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
                 (1'h0)};
  assign wire18 = (8'ha5);
  always
    @(posedge clk) begin
      reg19 <= $signed(((&$signed((wire15 ? wire16 : wire16))) >= (((~|wire18) ?
          $signed((8'ha7)) : (wire15 ?
              wire16 : wire16)) <= wire18[(4'he):(3'h5)])));
      if ((7'h41))
        begin
          reg20 <= (^((~&((reg19 ?
              (8'hae) : wire16) > $unsigned(wire16))) == $unsigned({wire18})));
          reg21 <= wire14[(2'h2):(1'h1)];
          reg22 <= $signed($unsigned((7'h43)));
          if ((wire14 == {$unsigned((~&reg20[(3'h5):(3'h4)])),
              (wire17[(1'h1):(1'h0)] ?
                  ({wire18, reg21} + (wire15 || reg20)) : reg21)}))
            begin
              reg23 <= reg19;
              reg24 <= (!$signed((8'ha9)));
              reg25 <= $unsigned(reg24[(1'h1):(1'h0)]);
              reg26 <= (~(&$signed($unsigned(((8'ha8) & (8'ha8))))));
              reg27 <= $signed(reg19);
            end
          else
            begin
              reg23 <= reg22[(1'h0):(1'h0)];
              reg24 <= (wire14[(2'h3):(2'h2)] == $signed(($unsigned((8'hbe)) << (|reg27[(2'h3):(1'h1)]))));
              reg25 <= (reg22[(1'h0):(1'h0)] ?
                  $unsigned(($signed((wire17 ? wire16 : reg23)) ?
                      reg19 : $unsigned((reg21 ?
                          (8'ha1) : (8'ha3))))) : (&(reg23[(1'h0):(1'h0)] ?
                      (-reg23) : $signed($signed((8'hb7))))));
            end
        end
      else
        begin
          if (reg21[(2'h3):(1'h1)])
            begin
              reg20 <= (~|({reg27[(2'h2):(2'h2)], wire17} != $unsigned((reg22 ?
                  (|reg19) : wire18))));
              reg21 <= $unsigned(wire17);
              reg22 <= reg21[(2'h3):(2'h3)];
              reg23 <= (-(reg25 * {$signed((~^reg19)),
                  ((~&reg23) < (reg19 != wire14))}));
              reg24 <= (-($signed((&(reg21 & reg21))) ?
                  (+reg26[(2'h3):(1'h1)]) : reg26));
            end
          else
            begin
              reg20 <= ($unsigned((&$unsigned($signed(reg20)))) >>> {wire18});
            end
          if ($signed(({reg24[(1'h0):(1'h0)]} || reg21[(1'h1):(1'h0)])))
            begin
              reg25 <= {$unsigned(($signed(reg19) ?
                      ({reg25, (8'ha5)} ?
                          (~^(8'hb7)) : (wire17 ^~ reg27)) : ((wire17 ?
                          (8'hb8) : reg25) << (8'ha2)))),
                  ((((reg24 ~^ wire17) ?
                      (+reg26) : reg19) > {(wire14 != wire16),
                      $signed((8'hb8))}) >= $unsigned($signed((reg23 << reg21))))};
              reg26 <= (8'hb4);
            end
          else
            begin
              reg25 <= (((^~{$unsigned((8'hb1))}) ?
                  ((|wire18[(2'h2):(2'h2)]) && wire14) : $signed(reg25[(4'hf):(3'h6)])) && (8'hb3));
            end
          reg27 <= {(reg25[(1'h0):(1'h0)] ^~ $unsigned(($signed((8'h9f)) ?
                  ((7'h43) > (8'hb9)) : $unsigned(reg22))))};
          reg28 <= (reg20 + (reg23[(2'h2):(1'h0)] ?
              {wire17} : reg27[(4'h8):(1'h0)]));
        end
    end
  assign wire29 = {reg19[(1'h0):(1'h0)], reg24[(3'h4):(1'h1)]};
  assign wire30 = $unsigned((+(!reg25[(3'h4):(2'h2)])));
  assign wire31 = $unsigned($signed(($unsigned($signed(wire17)) < (&$unsigned(reg20)))));
  always
    @(posedge clk) begin
      reg32 <= $unsigned($signed(reg28[(4'he):(4'ha)]));
      reg33 <= reg23;
      reg34 <= $signed($unsigned(reg32));
      reg35 <= {((wire18[(4'hb):(3'h4)] - reg28[(3'h4):(3'h4)]) == $signed(wire29[(5'h11):(4'hd)]))};
    end
  assign wire36 = (~&reg32[(4'hd):(3'h5)]);
  assign wire37 = $unsigned({(|(8'ha0)),
                      $signed(((reg22 ? reg19 : reg35) ?
                          $signed(wire36) : (8'ha4)))});
  assign wire38 = ((wire29 <= reg25) ?
                      ((~reg23) - ($unsigned({wire30, reg26}) ?
                          ((!reg20) ?
                              $unsigned(wire37) : $unsigned(wire31)) : (~|(reg32 | reg26)))) : ((((~^wire31) ?
                          $unsigned((8'hba)) : {reg19,
                              reg19}) >>> $unsigned((wire36 ?
                          reg22 : wire31))) || $unsigned($signed((reg19 ?
                          (7'h41) : reg26)))));
  always
    @(posedge clk) begin
      reg39 <= (&(~|$unsigned(((reg26 + wire16) & (~&reg34)))));
      reg40 <= $unsigned(wire17[(2'h3):(1'h0)]);
    end
  assign wire41 = ($unsigned((reg21[(2'h2):(1'h1)] > {reg20})) | ($signed((|$unsigned(wire38))) ?
                      $signed((reg24 ?
                          wire15 : wire15[(4'h8):(3'h4)])) : $unsigned($signed(reg21[(1'h0):(1'h0)]))));
  assign wire42 = $unsigned($signed({$unsigned((reg20 == reg21)),
                      $signed(reg34)}));
endmodule

module module108
#(parameter param150 = ((^(~|(-(!(8'haa))))) ? ({{(~(8'haf))}} ? ((((8'hae) ? (8'had) : (8'hbd)) ? ((8'ha1) ~^ (8'ha9)) : ((8'hab) ? (8'ha1) : (8'ha9))) ? (((8'hbf) ? (8'ha0) : (8'hb9)) ? ((8'ha5) ? (8'ha6) : (8'hb4)) : ((8'hbe) ? (8'ha1) : (8'hb7))) : (((8'h9f) ? (7'h41) : (8'hbb)) >>> {(8'ha5), (7'h42)})) : {(((8'ha6) ~^ (8'hbc)) ^~ ((8'hbf) + (8'ha5))), (((8'hb9) > (8'hb4)) ? ((7'h44) ? (8'hb1) : (8'ha3)) : ((8'hab) | (8'hb1)))}) : {(^((|(7'h41)) <<< ((8'ha7) ? (8'h9d) : (8'ha4)))), (~|((7'h43) ? (^(8'hb6)) : ((8'hb6) ? (7'h43) : (8'hb5))))}))
(y, clk, wire113, wire112, wire111, wire110, wire109);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire113;
  input wire [(4'hf):(1'h0)] wire112;
  input wire [(5'h11):(1'h0)] wire111;
  input wire [(2'h2):(1'h0)] wire110;
  input wire [(2'h2):(1'h0)] wire109;
  wire [(4'h9):(1'h0)] wire149;
  wire [(4'h8):(1'h0)] wire136;
  wire [(3'h5):(1'h0)] wire135;
  wire signed [(3'h5):(1'h0)] wire134;
  wire signed [(5'h12):(1'h0)] wire133;
  wire [(4'hc):(1'h0)] wire132;
  wire signed [(3'h5):(1'h0)] wire130;
  wire [(4'h8):(1'h0)] wire129;
  wire signed [(3'h4):(1'h0)] wire128;
  wire signed [(5'h12):(1'h0)] wire127;
  wire [(3'h7):(1'h0)] wire126;
  wire [(4'hc):(1'h0)] wire125;
  wire [(2'h2):(1'h0)] wire124;
  reg [(4'h9):(1'h0)] reg148 = (1'h0);
  reg [(3'h7):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg146 = (1'h0);
  reg [(2'h3):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg144 = (1'h0);
  reg [(3'h5):(1'h0)] reg143 = (1'h0);
  reg signed [(4'he):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg141 = (1'h0);
  reg [(2'h3):(1'h0)] reg140 = (1'h0);
  reg [(4'ha):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg138 = (1'h0);
  reg [(2'h2):(1'h0)] reg137 = (1'h0);
  reg [(5'h12):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg121 = (1'h0);
  reg signed [(4'he):(1'h0)] reg120 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg119 = (1'h0);
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  reg [(2'h3):(1'h0)] reg117 = (1'h0);
  reg [(5'h10):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg115 = (1'h0);
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  assign y = {wire149,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
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
                 reg131,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire110[(1'h0):(1'h0)] ?
          $unsigned($unsigned(((wire109 ?
              wire113 : wire112) > $signed(wire111)))) : ($signed(($signed(wire110) - wire109)) <<< {wire113})))
        begin
          reg114 <= (8'h9f);
          if ($unsigned((~&(wire113[(3'h4):(1'h0)] && ($signed(wire110) - wire112)))))
            begin
              reg115 <= (!((&wire113) ~^ (8'hb4)));
              reg116 <= wire113[(1'h1):(1'h1)];
            end
          else
            begin
              reg115 <= (((wire113[(3'h5):(3'h5)] >= {wire110[(1'h1):(1'h0)],
                  wire110[(2'h2):(1'h0)]}) > reg114) <= $signed((^~$unsigned($unsigned(wire110)))));
              reg116 <= ((~((~wire112) ?
                      {(~(8'hbb)),
                          wire113[(3'h6):(1'h0)]} : $unsigned($signed(wire113)))) ?
                  (wire111 ?
                      (((wire111 << wire109) << $signed(wire111)) ?
                          $signed((-wire110)) : (~|$unsigned(wire112))) : wire110[(1'h1):(1'h0)]) : wire113[(3'h5):(3'h5)]);
              reg117 <= (wire113[(3'h7):(3'h6)] ?
                  (^wire109) : $signed((((wire111 ? wire112 : (8'hb5)) ?
                          (~^reg115) : (~&reg115)) ?
                      wire111[(5'h11):(4'he)] : (8'hbe))));
              reg118 <= (wire113[(1'h0):(1'h0)] ?
                  wire109[(1'h1):(1'h0)] : ((({reg114, (7'h44)} ?
                      wire112[(3'h6):(3'h5)] : reg115) >> (8'hba)) << (^$unsigned(reg115))));
              reg119 <= ((wire110[(1'h0):(1'h0)] ?
                  ($signed($unsigned(reg116)) ^ (reg115[(3'h4):(1'h1)] ?
                      (wire112 <= reg118) : $unsigned((8'h9e)))) : $signed({wire112,
                      wire111})) < ($signed(wire111[(3'h5):(3'h5)]) || $unsigned((^~{(8'ha3),
                  (7'h43)}))));
            end
          reg120 <= reg119;
          reg121 <= ($signed(reg115) ?
              ({($unsigned(reg115) ? (wire109 > (8'ha5)) : (reg118 < wire112)),
                      $unsigned(reg117[(2'h3):(2'h2)])} ?
                  (reg119[(3'h5):(3'h4)] ?
                      $signed(((8'haf) - reg120)) : ((reg117 - wire113) ?
                          reg119 : (-wire112))) : (+(+(|wire109)))) : {($signed((&(7'h43))) ?
                      ((&(8'hae)) != $signed(reg117)) : wire113[(3'h7):(2'h2)]),
                  wire112[(4'hf):(1'h1)]});
          reg122 <= $signed((^~reg116[(1'h0):(1'h0)]));
        end
      else
        begin
          reg114 <= $unsigned({{(7'h44),
                  (reg117[(2'h2):(1'h0)] >> (wire110 ? reg121 : (8'hb5)))},
              $unsigned($unsigned((-reg114)))});
          reg115 <= (&(|reg116[(3'h6):(1'h0)]));
          reg116 <= reg120;
          reg117 <= $signed((&reg121[(4'h8):(1'h0)]));
        end
      reg123 <= ($signed((wire109[(1'h0):(1'h0)] ?
              (wire112 * wire113) : ((|reg117) && (~^wire111)))) ?
          $unsigned((8'hb7)) : $unsigned((-({wire109, wire110} ?
              $signed(wire110) : (reg115 ? wire111 : reg120)))));
    end
  assign wire124 = reg119[(1'h1):(1'h0)];
  assign wire125 = (^~reg123[(1'h0):(1'h0)]);
  assign wire126 = wire109;
  assign wire127 = (reg115 ^ (^~$signed($unsigned($signed(wire111)))));
  assign wire128 = $unsigned($unsigned((~^(^~(-(8'hb5))))));
  assign wire129 = $unsigned((wire126[(2'h2):(2'h2)] ?
                       wire124 : $signed($unsigned($unsigned(wire125)))));
  assign wire130 = $signed(wire112);
  always
    @(posedge clk) begin
      reg131 <= ((-reg120[(1'h1):(1'h1)]) <<< $signed((~^reg121)));
    end
  assign wire132 = wire130;
  assign wire133 = {(~&(((reg116 ^ reg120) * (reg114 ?
                           reg115 : wire111)) <<< $unsigned((!wire109)))),
                       reg121[(3'h5):(2'h3)]};
  assign wire134 = ($signed((reg121[(1'h1):(1'h1)] != {$unsigned(reg119),
                       (^wire113)})) > wire130);
  assign wire135 = wire112[(4'ha):(2'h2)];
  assign wire136 = wire112[(4'hd):(3'h4)];
  always
    @(posedge clk) begin
      reg137 <= reg121;
      reg138 <= $unsigned(reg121);
      if ({((reg121 ?
              wire113[(3'h4):(2'h3)] : wire133) != $unsigned($signed(reg114)))})
        begin
          reg139 <= wire127[(3'h6):(2'h3)];
          reg140 <= (((-wire128) ?
                  $signed(((reg131 * wire127) * $unsigned(reg115))) : ((wire135[(1'h1):(1'h0)] ?
                          reg131[(3'h4):(1'h0)] : ((8'ha1) > wire130)) ?
                      $unsigned((8'ha2)) : (-reg119[(3'h5):(3'h4)]))) ?
              ($unsigned(((reg114 == wire124) <<< {wire110})) <= wire127[(2'h2):(1'h0)]) : reg121[(1'h0):(1'h0)]);
          reg141 <= (8'hbb);
        end
      else
        begin
          reg139 <= ($unsigned((-(^~$unsigned(reg114)))) ?
              {reg120[(4'hd):(3'h4)],
                  $unsigned({(reg137 ? reg117 : reg114),
                      $unsigned((8'hb6))})} : (+wire112));
        end
      reg142 <= reg117;
      if ({reg120, reg120[(4'hd):(3'h6)]})
        begin
          if ($unsigned((!(8'hb7))))
            begin
              reg143 <= $signed(((~^(reg118[(1'h1):(1'h0)] ?
                      (wire124 > reg116) : reg121)) ?
                  (reg116[(4'he):(3'h5)] << $signed({wire134,
                      reg118})) : $unsigned(reg139)));
              reg144 <= ((wire109[(1'h1):(1'h0)] <= (wire134 ^~ wire128)) + reg141[(3'h6):(1'h0)]);
              reg145 <= (7'h44);
              reg146 <= $signed($signed(((~&$unsigned(wire124)) - {(reg140 && reg144)})));
            end
          else
            begin
              reg143 <= ((|{($unsigned(reg119) - $signed(reg138))}) ?
                  $signed(reg139) : ((reg131[(3'h4):(2'h2)] * ($unsigned(wire124) < {wire109})) ?
                      (~|$unsigned($signed(wire128))) : $signed($unsigned((wire134 && (7'h41))))));
              reg144 <= {(^(+(~^(wire126 > reg144)))),
                  (wire111[(4'hf):(4'he)] + $unsigned((~^$signed((8'hbf)))))};
              reg145 <= $unsigned(reg144);
              reg146 <= $unsigned(($signed(wire130[(1'h0):(1'h0)]) <<< (~&((reg114 == wire129) ?
                  $unsigned(reg118) : reg140[(1'h1):(1'h0)]))));
              reg147 <= (+(reg114[(1'h0):(1'h0)] ?
                  (+$signed({wire110, reg140})) : wire124));
            end
          reg148 <= {(-reg137)};
        end
      else
        begin
          reg143 <= wire113;
          if ($unsigned(((+({wire111,
              reg138} ^~ (reg148 + reg138))) | reg143[(2'h3):(2'h2)])))
            begin
              reg144 <= ((7'h41) <= wire127);
              reg145 <= (8'hb7);
              reg146 <= reg119[(4'h9):(3'h7)];
              reg147 <= wire128[(3'h4):(3'h4)];
              reg148 <= {$signed((8'hbe))};
            end
          else
            begin
              reg144 <= (~&$unsigned((^~(|(reg138 ^~ wire124)))));
              reg145 <= $unsigned($signed((reg144 ?
                  (~|(reg115 != wire129)) : (8'hb7))));
              reg146 <= reg138;
              reg147 <= reg146[(1'h0):(1'h0)];
              reg148 <= reg140;
            end
        end
    end
  assign wire149 = (-(wire126[(3'h4):(3'h4)] | ((-(wire129 >= (7'h41))) | (+$signed(wire130)))));
endmodule
