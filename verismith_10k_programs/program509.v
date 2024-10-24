module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire45;
  reg [(3'h4):(1'h0)] reg69 = (1'h0);
  reg [(5'h12):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  assign y = {wire47,
                 wire4,
                 wire45,
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
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire4 = ((7'h40) ?
                     ((~^wire0) ?
                         (!$unsigned((~&wire0))) : $unsigned(((8'hb2) ^ wire0[(4'h9):(2'h2)]))) : {$signed((wire3[(1'h0):(1'h0)] ?
                             $unsigned(wire2) : (wire1 ? wire2 : wire0)))});
  module5 #() modinst46 (wire45, clk, wire1, wire0, wire2, wire4, wire3);
  assign wire47 = {(-(wire1[(3'h6):(2'h2)] && ((wire2 ?
                          wire2 : wire45) >>> (8'h9f))))};
  always
    @(posedge clk) begin
      if ((-(^(($unsigned(wire45) >>> wire0) ^ $unsigned($signed(wire0))))))
        begin
          if (wire2[(4'ha):(2'h3)])
            begin
              reg48 <= (wire0[(1'h1):(1'h1)] > (($unsigned(wire4) ?
                      $signed(wire1) : wire0[(1'h1):(1'h1)]) ?
                  wire47 : wire3));
              reg49 <= ((wire1 * {$unsigned(wire2)}) ?
                  $unsigned((+{(|wire0), wire3})) : (~&(8'hba)));
              reg50 <= wire0;
              reg51 <= (wire0 <<< ($signed($signed({(7'h41),
                  reg50})) ~^ $signed((wire3 - wire2))));
              reg52 <= {reg51,
                  {(~|($unsigned(reg50) ? {reg51, wire1} : $signed((8'hac))))}};
            end
          else
            begin
              reg48 <= $signed($signed((!((reg50 + wire47) ?
                  $unsigned(wire1) : $unsigned(reg52)))));
              reg49 <= wire0[(3'h6):(2'h3)];
            end
          reg53 <= $signed($unsigned(reg49[(2'h2):(1'h1)]));
          if ((reg51[(3'h5):(3'h4)] ?
              $signed(reg51) : $signed($signed((+(wire47 ? reg49 : wire4))))))
            begin
              reg54 <= {$unsigned(((~(wire0 ? reg49 : reg50)) ?
                      $signed(reg48[(4'hc):(1'h0)]) : reg53))};
              reg55 <= reg53[(4'hf):(4'h8)];
              reg56 <= (reg53[(5'h10):(1'h0)] ?
                  (~(^~$signed($unsigned(reg53)))) : $unsigned(reg48));
            end
          else
            begin
              reg54 <= $signed((8'ha7));
              reg55 <= reg49[(3'h6):(3'h5)];
            end
        end
      else
        begin
          if ((^reg49[(1'h0):(1'h0)]))
            begin
              reg48 <= reg56;
            end
          else
            begin
              reg48 <= (-($signed($signed(reg54)) >> $unsigned(reg54[(1'h0):(1'h0)])));
              reg49 <= reg52[(4'h8):(3'h7)];
            end
        end
      reg57 <= (~(^$unsigned(reg54)));
      if ((~|$signed((($unsigned(reg48) ? (~&reg53) : wire1[(5'h15):(5'h11)]) ?
          $unsigned((reg51 ? (8'hb9) : wire2)) : {$unsigned(reg55),
              $signed(wire4)}))))
        begin
          reg58 <= wire4;
          reg59 <= ((&(-(~&reg55))) != $signed((+{(!wire0),
              reg58[(1'h1):(1'h1)]})));
          reg60 <= $signed($signed($unsigned(reg56[(1'h0):(1'h0)])));
          reg61 <= $unsigned(wire45[(4'hc):(1'h0)]);
        end
      else
        begin
          if ($unsigned((wire1[(4'h9):(2'h2)] ^ ($signed({reg56, wire2}) ?
              (|reg52[(4'h8):(4'h8)]) : reg51[(4'h8):(4'h8)]))))
            begin
              reg58 <= $unsigned(((7'h41) != (8'hb9)));
            end
          else
            begin
              reg58 <= (~|{(($signed((8'had)) * $unsigned(wire3)) ?
                      ((reg59 & reg59) <<< (8'haf)) : reg54),
                  $signed({(~|reg55), reg48})});
              reg59 <= reg53;
              reg60 <= $signed(wire0);
            end
          reg61 <= (&$unsigned((+((wire47 || reg53) && $signed(reg49)))));
          if ($signed((wire47 ?
              $signed({$signed(wire1)}) : {(^~wire4[(2'h3):(2'h2)]),
                  $signed((wire1 ? (8'hb3) : wire4))})))
            begin
              reg62 <= ($signed((-wire47)) <<< $unsigned((($signed(reg49) | (reg55 ?
                  reg50 : reg55)) - wire45[(3'h7):(2'h3)])));
              reg63 <= reg54;
              reg64 <= (8'h9d);
              reg65 <= (-$unsigned(reg49[(2'h3):(2'h3)]));
              reg66 <= reg63[(3'h6):(2'h3)];
            end
          else
            begin
              reg62 <= ($unsigned({reg54, $unsigned(reg57)}) ?
                  reg56[(4'hc):(2'h2)] : $signed((^~(8'hb6))));
              reg63 <= reg63;
              reg64 <= $unsigned(((~&reg50) != ({(wire0 >= wire0)} + (^~$signed(reg60)))));
              reg65 <= ({reg49} ~^ reg61[(3'h4):(1'h0)]);
              reg66 <= reg52[(3'h5):(2'h3)];
            end
          reg67 <= reg59;
        end
      reg68 <= {wire2[(2'h2):(2'h2)],
          ({(wire47 ^~ $unsigned((8'hbb)))} ~^ reg51)};
      reg69 <= wire0;
    end
endmodule

module module5
#(parameter param43 = (~&(!{(8'haf), {(~|(8'hba))}})), 
parameter param44 = ((param43 ? (|(8'ha5)) : ((^~param43) * param43)) ? ((({(8'hb9), param43} ? (~|param43) : (param43 & (8'ha5))) >= param43) >= (~&((8'h9d) != (~|param43)))) : ((|((+param43) ? (~|param43) : (!param43))) ? (({param43, param43} >>> {param43}) >>> ((param43 + param43) ? (param43 ^~ param43) : param43)) : (|param43))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h14e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire7;
  input wire [(3'h4):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire40;
  wire signed [(3'h7):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg33,
                 reg32,
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
                 (1'h0)};
  assign wire11 = wire7;
  assign wire12 = ((~(|wire6[(2'h3):(2'h2)])) - $unsigned($unsigned($unsigned($signed(wire11)))));
  assign wire13 = $unsigned((~^$signed(({wire7} ?
                      $unsigned(wire9) : {wire11}))));
  assign wire14 = wire13[(4'ha):(3'h4)];
  assign wire15 = $signed($signed(wire11));
  assign wire16 = $signed($unsigned(wire6[(2'h2):(2'h2)]));
  assign wire17 = (^wire6[(1'h0):(1'h0)]);
  assign wire18 = wire14;
  always
    @(posedge clk) begin
      reg19 <= $unsigned($unsigned(wire13));
      if ($signed(($signed(wire13) ~^ $signed(($signed(wire13) ^ wire7[(4'h9):(3'h6)])))))
        begin
          if (($unsigned(((7'h43) ?
              $unsigned(wire14[(1'h0):(1'h0)]) : ((wire8 ?
                  wire15 : wire17) - $signed((8'haf))))) <= $signed($signed($signed($signed(wire6))))))
            begin
              reg20 <= $unsigned($unsigned((^~wire6[(2'h3):(2'h2)])));
              reg21 <= wire10;
            end
          else
            begin
              reg20 <= ((^~(wire7[(5'h13):(3'h6)] <= ((~^wire11) ?
                  (wire7 ? (8'hab) : wire17) : (wire9 ?
                      wire11 : wire9)))) || wire15);
              reg21 <= ($unsigned($unsigned(wire8[(3'h4):(3'h4)])) ?
                  (wire16[(2'h3):(1'h1)] ?
                      wire12[(1'h1):(1'h0)] : $signed($unsigned((~&wire14)))) : wire13[(2'h2):(1'h1)]);
              reg22 <= (~^(reg21 ?
                  ((wire6[(1'h1):(1'h1)] ?
                          (wire15 >= wire8) : reg20[(2'h2):(1'h0)]) ?
                      ($signed(reg19) | (~^reg21)) : $unsigned(((8'hba) ?
                          reg19 : wire12))) : ($signed(reg20[(3'h6):(2'h2)]) <<< wire13[(1'h1):(1'h0)])));
            end
          reg23 <= ((~^wire10[(3'h4):(2'h2)]) ?
              ($signed({reg22[(2'h2):(1'h1)]}) ?
                  wire18[(3'h7):(3'h7)] : ((((8'had) <= (8'ha2)) ~^ (wire6 && wire17)) ?
                      wire10 : wire17)) : $signed(reg20[(3'h5):(1'h1)]));
          reg24 <= (^wire11[(4'h9):(2'h3)]);
          if (wire11)
            begin
              reg25 <= reg20[(3'h4):(3'h4)];
              reg26 <= $unsigned(wire15[(3'h7):(3'h5)]);
              reg27 <= $signed(((((wire14 ^~ (8'hbd)) >= ((8'hb8) ?
                      reg21 : wire9)) != ((reg23 <<< reg19) == $signed(wire10))) ?
                  $unsigned(wire6) : ((~|$unsigned(wire17)) >>> {$unsigned((8'ha7))})));
            end
          else
            begin
              reg25 <= reg19;
              reg26 <= (wire15 ?
                  (reg27[(1'h0):(1'h0)] ?
                      $unsigned(reg21[(3'h5):(3'h4)]) : reg27[(3'h4):(1'h1)]) : wire16[(3'h4):(3'h4)]);
              reg27 <= $unsigned(wire6);
              reg28 <= $signed(((~&$unsigned($unsigned(reg21))) & $unsigned({(wire7 ?
                      reg27 : reg25),
                  $unsigned(wire15)})));
            end
          if ((wire18[(3'h4):(2'h2)] << $signed((~|wire8))))
            begin
              reg29 <= $signed({(-wire10),
                  {(&(^~(8'hb3))), $unsigned((reg24 <<< wire8))}});
              reg30 <= $signed($unsigned(({(8'hbd)} ?
                  ($unsigned(wire11) ? wire8[(3'h7):(3'h7)] : reg26) : wire9)));
              reg31 <= {reg30[(2'h2):(2'h2)],
                  $signed((+$signed((reg20 ? wire10 : wire10))))};
              reg32 <= {reg26[(1'h1):(1'h0)],
                  $unsigned($unsigned(((~wire12) ? (reg22 > reg27) : wire18)))};
              reg33 <= wire17;
            end
          else
            begin
              reg29 <= (|(wire12 & $unsigned($signed((reg24 ?
                  (7'h40) : wire8)))));
              reg30 <= ((reg26[(1'h0):(1'h0)] <<< (|$unsigned($unsigned((8'hac))))) ~^ ($signed($unsigned((wire9 >= wire14))) & (((8'hb4) ?
                  {wire16, reg19} : $signed(reg31)) + (&reg33))));
              reg31 <= (reg25[(2'h3):(2'h3)] ?
                  {((^reg24) ? {(^~reg26)} : (^wire7))} : (!((~^{reg21,
                      reg19}) > wire18[(3'h4):(2'h3)])));
              reg32 <= ($signed(reg29[(2'h2):(2'h2)]) ^~ (~reg24));
            end
        end
      else
        begin
          reg20 <= reg29[(4'he):(4'h8)];
          reg21 <= (^~$unsigned((^$signed(wire16[(2'h3):(2'h2)]))));
          if ((!(|{wire6[(2'h3):(1'h1)]})))
            begin
              reg22 <= reg30;
              reg23 <= ($signed(wire14) - $unsigned((((~wire14) ?
                  $signed((8'hbb)) : $unsigned(wire8)) >>> $signed((~&wire6)))));
              reg24 <= $signed(($signed($unsigned((reg23 * wire8))) ^~ $unsigned(((wire13 ?
                  reg22 : wire9) | wire9))));
              reg25 <= ($unsigned(($signed($signed(reg22)) <<< wire7[(4'hc):(3'h7)])) ?
                  (reg24[(4'hd):(3'h5)] == ($signed($unsigned(reg32)) << $signed((wire16 ?
                      reg30 : reg20)))) : (reg22 ?
                      (|$unsigned($unsigned((8'ha3)))) : $unsigned(((reg33 & wire9) && $unsigned(reg21)))));
            end
          else
            begin
              reg22 <= reg29;
              reg23 <= reg21[(2'h2):(2'h2)];
            end
          reg26 <= (reg19[(4'hb):(2'h2)] - (reg24 ?
              wire16 : ($unsigned($signed(reg20)) ~^ $signed((+(7'h41))))));
        end
    end
  assign wire34 = $signed($signed(((8'hb6) * (8'hb3))));
  assign wire35 = $signed(wire6[(3'h4):(2'h3)]);
  assign wire36 = ($unsigned($unsigned((wire9[(2'h3):(2'h2)] >>> (wire11 == reg19)))) ?
                      ((~&wire8[(2'h2):(2'h2)]) | $signed($unsigned(reg26[(2'h2):(1'h1)]))) : wire11);
  assign wire37 = (wire34[(5'h15):(5'h12)] & (!(reg22[(2'h2):(2'h2)] ?
                      reg31 : wire16[(3'h4):(2'h3)])));
  assign wire38 = ($unsigned($unsigned((8'hbb))) <= reg26[(1'h1):(1'h0)]);
  assign wire39 = (~&(~|reg20[(2'h2):(1'h1)]));
  assign wire40 = {reg23[(4'h8):(1'h1)],
                      (wire35[(5'h15):(3'h4)] <<< ($signed($signed((8'h9c))) ?
                          ($unsigned(reg22) ?
                              $unsigned((8'hb2)) : $unsigned((8'h9d))) : ($signed(wire18) ?
                              $unsigned(wire13) : wire38[(1'h1):(1'h1)])))};
  assign wire41 = $unsigned($unsigned((wire39 ?
                      ($unsigned(wire14) >= (8'h9c)) : $signed(wire7[(3'h5):(3'h4)]))));
  assign wire42 = {$unsigned((!wire40))};
endmodule
