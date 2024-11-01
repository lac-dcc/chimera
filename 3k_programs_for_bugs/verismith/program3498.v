module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire [(4'h9):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire86;
  wire [(3'h5):(1'h0)] wire85;
  wire signed [(4'ha):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire83;
  wire [(4'he):(1'h0)] wire82;
  wire signed [(4'hf):(1'h0)] wire81;
  wire signed [(4'ha):(1'h0)] wire80;
  wire [(2'h3):(1'h0)] wire79;
  wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire77;
  reg signed [(2'h2):(1'h0)] reg91 = (1'h0);
  reg [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg88 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire4,
                 wire77,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire4 = $signed(wire2);
  module5 #() modinst78 (wire77, clk, wire3, wire2, wire4, wire1, wire0);
  assign wire79 = (8'ha7);
  assign wire80 = ($signed($signed((~wire2[(2'h3):(2'h3)]))) ~^ $signed(wire2[(1'h1):(1'h1)]));
  assign wire81 = wire77[(1'h0):(1'h0)];
  assign wire82 = (($signed(({(8'hb0)} ? (wire80 * wire3) : $signed(wire2))) ?
                          {$signed({wire2, wire3}),
                              ($signed(wire80) >= {wire80,
                                  (8'h9c)})} : ($unsigned($unsigned(wire1)) ?
                              ((wire81 > wire81) >= wire0[(4'hb):(1'h0)]) : (~&(~&wire81)))) ?
                      wire81 : wire80[(3'h6):(3'h6)]);
  assign wire83 = (8'h9e);
  assign wire84 = (8'hb1);
  assign wire85 = ((8'hbc) ?
                      ({$signed((wire4 ? wire83 : wire84)),
                              $signed(((8'ha0) > (8'ha4)))} ?
                          wire2[(4'hd):(3'h4)] : (-$unsigned((wire84 << wire80)))) : $unsigned($unsigned($signed({wire80,
                          wire84}))));
  assign wire86 = {($signed((8'hbb)) ? wire2[(5'h12):(4'ha)] : (!wire80)),
                      wire83};
  assign wire87 = $unsigned($signed((-wire80[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg88 <= ((((!(wire83 > wire81)) << {(wire77 << wire79)}) ?
              wire87[(4'h8):(2'h3)] : (({wire77} < (!wire85)) <= wire81[(4'hd):(4'h9)])) ?
          wire84 : wire87);
      reg89 <= (^~({$unsigned(reg88), wire81} ?
          $signed(((~^wire87) >= wire4)) : {(~|(wire86 << wire87))}));
      reg90 <= (~$signed((wire79 ?
          $signed($signed(wire86)) : {wire84[(3'h4):(2'h2)]})));
      reg91 <= $unsigned(((8'haf) ?
          ({(wire86 ?
                  wire85 : wire83)} != $signed(wire80)) : $signed((~^$signed(wire87)))));
    end
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire9;
  input wire signed [(4'h9):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire17;
  wire [(3'h6):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  assign y = {wire75,
                 wire29,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
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
                 reg40,
                 (1'h0)};
  assign wire11 = $unsigned((8'hbe));
  assign wire12 = wire7[(5'h13):(4'hd)];
  assign wire13 = $signed((~^$signed(wire9)));
  assign wire14 = $signed({wire11[(3'h5):(2'h3)], $unsigned(wire8)});
  assign wire15 = (wire12[(3'h7):(3'h7)] && wire6);
  assign wire16 = (^~({((wire9 ? wire7 : (7'h44)) ?
                          wire13 : wire13[(4'h8):(2'h2)]),
                      wire13[(2'h2):(1'h0)]} && (wire12[(3'h5):(2'h2)] ^~ $unsigned((^wire9)))));
  assign wire17 = $signed($unsigned((8'hb2)));
  always
    @(posedge clk) begin
      reg18 <= ($signed((~^wire15[(3'h5):(2'h2)])) ^~ $signed(wire13));
      reg19 <= (&($unsigned((~^$unsigned(wire14))) - $unsigned((wire15[(1'h0):(1'h0)] >>> wire9[(2'h3):(1'h0)]))));
      reg20 <= $signed((~|((wire14 + $signed((8'hba))) < $unsigned(wire14[(3'h6):(3'h4)]))));
      if ({$unsigned($signed(wire11))})
        begin
          if (wire6[(4'hf):(3'h5)])
            begin
              reg21 <= (wire10 ?
                  (wire14[(1'h0):(1'h0)] ?
                      $signed(wire6[(4'he):(4'hd)]) : $unsigned(wire6[(3'h5):(2'h2)])) : $unsigned($signed(reg19)));
            end
          else
            begin
              reg21 <= (wire12 > wire15[(2'h3):(1'h0)]);
              reg22 <= wire16[(1'h0):(1'h0)];
              reg23 <= (reg19 ?
                  $signed(($unsigned(wire17[(1'h1):(1'h0)]) ?
                      $signed($signed(reg21)) : wire17[(1'h1):(1'h0)])) : (~((~^(wire7 ?
                      wire10 : (8'ha3))) | (wire9 ?
                      (wire6 > wire12) : (wire13 ? wire9 : wire16)))));
              reg24 <= (8'hb7);
              reg25 <= {reg23};
            end
          reg26 <= $signed(reg25);
          reg27 <= (((^~$unsigned((wire11 ~^ wire11))) > reg19) & {((~|reg22) ?
                  wire12 : (reg25[(3'h5):(3'h5)] ?
                      $signed(reg20) : (wire9 & wire17)))});
        end
      else
        begin
          reg21 <= ((^~wire16[(1'h1):(1'h0)]) + {$unsigned(wire8[(3'h6):(2'h2)])});
          reg22 <= (wire10 <= $unsigned((wire6[(5'h11):(4'h9)] ?
              reg23 : (8'hab))));
          reg23 <= ($unsigned(wire9[(1'h1):(1'h1)]) ? (~|wire15) : (8'hb2));
        end
      reg28 <= wire15[(3'h6):(2'h2)];
    end
  assign wire29 = ((!((~|$unsigned(wire17)) == {(reg25 ^~ wire6),
                      reg21})) < {reg26[(4'ha):(3'h4)],
                      ((~^(!(7'h41))) ?
                          wire11 : ($unsigned(reg22) ?
                              (^~wire12) : (wire11 ? wire9 : (8'hb2))))});
  always
    @(posedge clk) begin
      reg30 <= (7'h43);
      reg31 <= (8'ha2);
      reg32 <= {({{(-(8'hba)), (~&wire12)},
                  ($unsigned(wire11) ?
                      reg31[(2'h2):(1'h1)] : (wire6 ? reg19 : reg25))} ?
              wire12[(2'h2):(2'h2)] : (wire6[(4'hc):(4'h8)] * wire9)),
          reg25};
      if ((~&$unsigned(wire8)))
        begin
          reg33 <= (|$signed((((~(8'ha8)) ?
                  {reg21, reg24} : (wire29 ? reg32 : (8'hbb))) ?
              reg25 : reg23[(4'h8):(3'h6)])));
          reg34 <= wire29[(3'h7):(2'h2)];
          reg35 <= ($unsigned($signed({$unsigned(wire17)})) ?
              wire6 : reg19[(3'h7):(1'h1)]);
          if ($signed((8'ha6)))
            begin
              reg36 <= {reg26, (8'haf)};
              reg37 <= (7'h42);
              reg38 <= $unsigned($signed((~|((reg28 > wire29) << (8'hbb)))));
            end
          else
            begin
              reg36 <= (reg30[(3'h4):(1'h1)] ?
                  reg23[(4'h9):(4'h9)] : (((~&$unsigned(reg27)) + $unsigned($unsigned(wire13))) | $signed($signed(wire13))));
              reg37 <= $signed($signed(reg36));
              reg38 <= {$signed($signed(($unsigned(wire11) + {wire16}))),
                  ((+(reg22 ? reg31 : {reg34})) ?
                      $unsigned(($unsigned(reg20) + $unsigned(wire13))) : ({reg23,
                          $unsigned(reg31)} <= (~(+reg35))))};
              reg39 <= ($unsigned({(!$signed((8'hac))), (-$signed(reg21))}) ?
                  reg18 : ($signed({((8'hb8) > reg24)}) > $unsigned({(-(8'hbf)),
                      wire29[(4'hd):(3'h5)]})));
              reg40 <= (({reg35[(3'h5):(3'h5)],
                          $unsigned((reg26 ? reg32 : wire8))} ?
                      (&($unsigned(wire16) ?
                          $signed((8'h9f)) : $signed(reg33))) : {(^~$unsigned((7'h40)))}) ?
                  wire9[(2'h3):(1'h1)] : (~^reg21[(2'h2):(1'h1)]));
            end
        end
      else
        begin
          if ($signed(wire13[(2'h2):(1'h0)]))
            begin
              reg33 <= wire14;
              reg34 <= (^$unsigned((wire13 ?
                  (^~$unsigned(wire10)) : $unsigned($signed(wire9)))));
            end
          else
            begin
              reg33 <= {$unsigned((reg32[(4'ha):(4'ha)] ?
                      $signed((reg39 ?
                          wire12 : reg37)) : ((~|reg33) ^~ $unsigned(reg24))))};
              reg34 <= ((+(wire15 > reg18)) - (($signed((^~reg34)) >> (~{reg25,
                      wire10})) ?
                  ((~|(8'ha5)) ?
                      (reg33[(4'hf):(4'hc)] != reg19[(4'hc):(3'h7)]) : wire14) : $signed(($unsigned(wire9) ?
                      ((8'ha3) <<< reg19) : {reg32}))));
            end
          reg35 <= wire29;
        end
    end
  module41 #() modinst76 (wire75, clk, reg28, reg21, reg22, reg30, reg33);
endmodule

module module41
#(parameter param74 = {(~^((((8'ha2) ? (8'ha8) : (8'hb1)) ? (8'haa) : ((7'h43) ? (8'ha5) : (8'hb1))) ? ((~&(8'ha0)) ? ((8'hb2) ? (8'ha9) : (8'hb2)) : (^(8'haf))) : ((+(8'hb2)) ? ((8'hb3) ? (8'haa) : (8'ha6)) : (^(7'h42)))))})
(y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire46;
  input wire [(4'he):(1'h0)] wire45;
  input wire [(5'h13):(1'h0)] wire44;
  input wire signed [(3'h6):(1'h0)] wire43;
  input wire signed [(2'h3):(1'h0)] wire42;
  wire [(2'h3):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire72;
  wire [(2'h2):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire70;
  wire [(4'hc):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire51;
  wire signed [(3'h4):(1'h0)] wire50;
  wire signed [(4'h8):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
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
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire47 = ($unsigned($signed(wire43)) == wire45[(1'h1):(1'h0)]);
  assign wire48 = wire44;
  assign wire49 = $unsigned(($signed(({wire42, wire46} >= (wire48 ?
                          wire43 : wire44))) ?
                      $signed($unsigned($signed(wire44))) : (wire47 != (wire42 ?
                          (wire44 ? wire42 : wire44) : {(8'hb7)}))));
  assign wire50 = $signed(wire44);
  assign wire51 = ({(wire50[(3'h4):(1'h1)] < {wire43,
                          wire47[(3'h4):(2'h3)]})} && (&{$unsigned((wire43 ?
                          wire46 : wire50))}));
  assign wire52 = wire42[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg53 <= (~$signed((~$signed((-(8'hac))))));
      if (wire42)
        begin
          reg54 <= wire50;
          if (wire43[(3'h4):(2'h2)])
            begin
              reg55 <= $signed(((wire49[(2'h2):(1'h1)] ?
                  $signed((wire48 && reg54)) : {(~^wire45),
                      $unsigned(wire49)}) != $unsigned(wire45)));
              reg56 <= (-wire51[(2'h3):(1'h1)]);
              reg57 <= reg55;
            end
          else
            begin
              reg55 <= ($signed(($signed(reg56) ?
                  (wire52 >= $unsigned(reg56)) : $signed((|reg55)))) <= wire52[(3'h7):(2'h2)]);
              reg56 <= wire44[(2'h2):(1'h1)];
              reg57 <= $signed((8'ha0));
              reg58 <= (^~(+($signed((reg54 < wire44)) <= (wire51 ~^ (+wire42)))));
              reg59 <= wire44;
            end
          if (($unsigned(($unsigned($unsigned(wire46)) ?
              wire52[(4'h8):(3'h5)] : $signed((wire43 ?
                  reg58 : reg55)))) + wire49[(2'h3):(1'h1)]))
            begin
              reg60 <= (($signed($signed(reg59[(4'hc):(4'ha)])) ?
                  $signed(wire44[(4'ha):(3'h7)]) : (~&(((8'ha8) ^ (8'hb3)) > (wire51 ?
                      wire48 : wire46)))) > (wire45[(1'h1):(1'h0)] ?
                  $unsigned({$signed(reg53),
                      $unsigned(wire51)}) : (($signed(reg57) ?
                          $signed(wire48) : (reg55 & (8'haa))) ?
                      {(wire50 && wire45)} : $unsigned({(8'ha1)}))));
              reg61 <= wire50;
              reg62 <= $signed(wire44);
              reg63 <= ($unsigned($unsigned({$unsigned(wire44),
                      $signed(wire44)})) ?
                  (!$signed($signed(wire45[(3'h6):(3'h4)]))) : (^~(wire52[(3'h6):(1'h1)] ?
                      ($unsigned((7'h42)) ? wire44 : (8'hb5)) : $signed({reg60,
                          wire49}))));
            end
          else
            begin
              reg60 <= (|$unsigned(reg56[(1'h0):(1'h0)]));
              reg61 <= reg63;
              reg62 <= wire51;
              reg63 <= ((~^({wire48} ? wire50 : reg61)) ?
                  $unsigned((((wire43 ? wire51 : wire50) ?
                      (~|wire51) : wire52[(2'h2):(1'h1)]) & wire42)) : (&($signed((wire49 == (8'ha0))) <<< reg53[(1'h0):(1'h0)])));
            end
          reg64 <= ((reg62[(3'h4):(2'h3)] * wire42[(1'h1):(1'h0)]) && $signed($signed($unsigned({reg55,
              reg56}))));
          if ($unsigned($signed($unsigned(($signed((8'hbf)) ?
              $unsigned(wire47) : ((8'hbc) >= (8'hb7)))))))
            begin
              reg65 <= (($unsigned((~reg53[(1'h1):(1'h1)])) ^ reg57) ?
                  ((-((7'h43) > (!reg53))) | $unsigned((^~$signed(reg61)))) : $signed(($unsigned(reg61[(5'h11):(4'hd)]) <= $signed((wire42 && reg63)))));
              reg66 <= $signed($signed(((8'hbe) ?
                  {(!wire51), {reg61, (8'h9c)}} : $signed(reg59))));
            end
          else
            begin
              reg65 <= wire44[(3'h4):(1'h0)];
              reg66 <= $unsigned($signed($signed({wire43[(2'h3):(1'h0)],
                  $signed((8'ha2))})));
              reg67 <= ((!$signed(reg53)) != (((8'ha1) ~^ ($signed((8'ha7)) + {reg64,
                  reg54})) < (((reg53 < (8'ha8)) ?
                  $signed(reg59) : (wire45 ?
                      wire43 : wire43)) * wire47[(3'h7):(2'h3)])));
              reg68 <= ((wire49[(4'h8):(1'h1)] - (^~((~&wire45) ~^ $unsigned(wire52)))) ?
                  reg58 : (!((wire48 ?
                      $unsigned(wire52) : (wire49 ^ reg57)) << $unsigned((reg66 && reg65)))));
            end
        end
      else
        begin
          if ((8'haf))
            begin
              reg54 <= $signed(((^($signed((8'ha2)) ?
                  $signed(reg63) : (wire49 ?
                      wire42 : reg67))) && ({(reg53 <= reg59),
                  $signed(reg68)} * (reg57[(2'h3):(1'h0)] ?
                  $unsigned(reg56) : reg53))));
              reg55 <= reg62[(1'h0):(1'h0)];
              reg56 <= reg55;
              reg57 <= $unsigned(({{reg62}} >>> ($unsigned(reg60[(3'h7):(2'h3)]) && (wire45 ?
                  wire45[(4'ha):(2'h2)] : (~&wire44)))));
              reg58 <= {reg58[(3'h7):(3'h7)], $signed(reg57)};
            end
          else
            begin
              reg54 <= (reg65[(2'h2):(1'h1)] ^~ {$signed($unsigned((!(8'ha2)))),
                  (wire48 ?
                      reg66 : ((reg58 ? reg59 : wire42) ?
                          (reg65 ? wire50 : (8'hab)) : (wire47 * (8'hb3))))});
              reg55 <= ((wire47 & $unsigned(((reg62 ? (7'h44) : reg54) ?
                      $signed(reg53) : (reg64 ? reg67 : reg60)))) ?
                  wire43[(3'h5):(3'h5)] : $signed({($unsigned(reg65) && $unsigned(wire49)),
                      $signed($signed(reg55))}));
              reg56 <= {reg54[(2'h2):(1'h0)], reg64[(4'h9):(3'h6)]};
              reg57 <= $signed(reg68[(3'h6):(1'h0)]);
            end
          reg59 <= {reg68[(2'h2):(2'h2)]};
        end
    end
  assign wire69 = $unsigned($unsigned(((^~(~wire46)) || reg57[(2'h2):(2'h2)])));
  assign wire70 = {(reg62[(3'h5):(2'h2)] ?
                          $unsigned(({wire50} ^~ reg63)) : reg67),
                      wire49[(3'h4):(2'h2)]};
  assign wire71 = $unsigned((((|(wire47 <= reg67)) ?
                          (wire47 ?
                              $signed(reg54) : $signed(wire43)) : ((!wire47) ^ $signed(wire51))) ?
                      {(reg56[(3'h4):(1'h1)] || reg55),
                          (8'ha8)} : {(|(~(8'haa))),
                          (((8'hac) ? reg55 : wire70) >>> (reg61 && wire43))}));
  assign wire72 = wire52[(3'h7):(1'h0)];
  assign wire73 = ($signed($signed($signed((reg63 ? wire69 : wire72)))) ?
                      wire48[(4'hb):(3'h7)] : (((((8'hab) ? wire51 : reg58) ?
                              {reg61, reg54} : (reg67 > (8'hae))) ?
                          wire43[(1'h0):(1'h0)] : (^~reg67[(2'h3):(2'h3)])) == $unsigned(reg64[(3'h6):(2'h2)])));
endmodule
