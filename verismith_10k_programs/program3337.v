module top
#(parameter param228 = (((((8'hab) ^~ ((8'hab) >= (8'hae))) + (~{(8'ha3)})) ? ((~^{(8'hb6), (8'h9e)}) - (((8'hbf) ? (8'haa) : (8'hba)) ? {(8'hbc), (8'hbe)} : (8'haf))) : {(((8'ha3) >> (8'ha8)) ~^ ((8'ha4) ? (8'hb3) : (7'h42))), (^(^~(8'hac)))}) ? ((~&{((8'hb8) ? (8'hb2) : (8'hb2))}) ? {(((8'ha7) ? (8'hb6) : (8'had)) ? (8'ha0) : ((8'hae) ? (8'hb3) : (8'ha8))), (~((8'h9e) ? (7'h43) : (8'hb5)))} : {{((8'ha2) | (8'hbd))}, ((|(8'h9c)) ? ((8'hbe) ? (8'hbd) : (8'h9f)) : ((8'hb0) << (8'hb2)))}) : (~|{(&((8'hb9) ? (8'hb0) : (8'hb2))), {{(8'h9f)}, ((8'h9f) ? (8'hbc) : (8'haf))}})), 
parameter param229 = ((!(!((param228 ? param228 : param228) || (param228 - param228)))) ? (^~{(~&{param228, param228}), param228}) : param228))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire [(3'h7):(1'h0)] wire224;
  wire signed [(3'h4):(1'h0)] wire223;
  wire signed [(5'h10):(1'h0)] wire222;
  wire signed [(3'h7):(1'h0)] wire221;
  wire signed [(2'h2):(1'h0)] wire220;
  wire signed [(3'h4):(1'h0)] wire219;
  wire [(3'h5):(1'h0)] wire216;
  wire [(4'he):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire71;
  wire [(4'he):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire73;
  wire [(5'h11):(1'h0)] wire214;
  reg signed [(3'h4):(1'h0)] reg227 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg226 = (1'h0);
  reg [(3'h7):(1'h0)] reg225 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg218 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg217 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  assign y = {wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire219,
                 wire216,
                 wire4,
                 wire68,
                 wire71,
                 wire72,
                 wire73,
                 wire214,
                 reg227,
                 reg226,
                 reg225,
                 reg218,
                 reg217,
                 reg70,
                 (1'h0)};
  assign wire4 = (({{(&wire1)}} ? wire3[(3'h4):(1'h0)] : (!{wire0})) < (wire3 ?
                     $unsigned((~|$signed(wire2))) : {(!(wire0 ?
                             wire0 : wire0))}));
  module5 #() modinst69 (wire68, clk, wire0, wire3, wire4, wire1);
  always
    @(posedge clk) begin
      reg70 <= (({(((8'hb7) ? wire0 : wire68) ?
                      wire4[(3'h6):(1'h0)] : {wire3, wire0}),
                  $signed($unsigned(wire68))} ?
              $signed(($signed(wire2) ?
                  wire0[(3'h4):(2'h3)] : (^~wire1))) : wire0) ?
          ((($signed(wire68) ? wire1[(2'h2):(1'h1)] : wire1) ?
                  (-(~^(8'hae))) : wire68[(2'h2):(1'h1)]) ?
              wire1 : ($signed((wire0 == wire68)) ?
                  (wire1[(3'h7):(1'h1)] ?
                      (^~(8'ha7)) : $signed(wire2)) : wire3)) : wire2[(2'h2):(1'h1)]);
    end
  assign wire71 = ((-$signed($signed($unsigned(wire0)))) >= reg70);
  assign wire72 = (&wire3);
  assign wire73 = $signed((|wire0[(3'h6):(1'h0)]));
  module74 #() modinst215 (.wire76(wire71), .y(wire214), .clk(clk), .wire78(wire1), .wire79(wire72), .wire75(wire73), .wire77(wire3));
  assign wire216 = $unsigned($signed({((wire214 ?
                           wire3 : wire68) < $signed(wire4)),
                       reg70}));
  always
    @(posedge clk) begin
      reg217 <= wire72;
      reg218 <= (($unsigned({$unsigned(wire4),
          (reg70 ? wire216 : reg70)}) <= wire4) && ((8'h9f) ?
          (&wire0[(3'h5):(2'h3)]) : wire214));
    end
  assign wire219 = ({wire1[(1'h0):(1'h0)],
                           (~^($unsigned((8'ha3)) ^~ (reg218 ?
                               reg217 : wire3)))} ?
                       wire214[(2'h2):(1'h1)] : wire73[(4'h8):(3'h7)]);
  assign wire220 = $unsigned(((&wire219[(3'h4):(3'h4)]) + (-$signed($signed(wire68)))));
  assign wire221 = (8'h9d);
  assign wire222 = {$signed(wire68[(4'hb):(4'ha)]), {wire71[(1'h1):(1'h1)]}};
  assign wire223 = ((wire72 ?
                           {(8'hbf)} : {(wire1 * (reg70 ? reg70 : wire71))}) ?
                       wire214[(3'h4):(2'h2)] : wire214);
  assign wire224 = $unsigned(((wire73[(2'h2):(1'h1)] ?
                       (7'h42) : (reg70[(2'h3):(2'h3)] - (|wire71))) <= ($signed((wire222 ~^ wire72)) & wire220)));
  always
    @(posedge clk) begin
      reg225 <= wire3[(3'h4):(2'h3)];
      reg226 <= {(8'ha5)};
      reg227 <= $signed($unsigned(wire216));
    end
endmodule

module module74  (y, clk, wire75, wire76, wire77, wire78, wire79);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire75;
  input wire [(4'h9):(1'h0)] wire76;
  input wire [(5'h13):(1'h0)] wire77;
  input wire [(5'h13):(1'h0)] wire78;
  input wire [(4'he):(1'h0)] wire79;
  wire signed [(5'h11):(1'h0)] wire213;
  wire [(4'hf):(1'h0)] wire212;
  wire signed [(4'h8):(1'h0)] wire211;
  wire [(3'h7):(1'h0)] wire210;
  wire [(4'hf):(1'h0)] wire208;
  wire [(4'hd):(1'h0)] wire207;
  wire signed [(4'hd):(1'h0)] wire206;
  wire [(4'hd):(1'h0)] wire205;
  wire signed [(5'h10):(1'h0)] wire204;
  wire [(4'h9):(1'h0)] wire203;
  wire signed [(4'hb):(1'h0)] wire202;
  wire signed [(5'h10):(1'h0)] wire201;
  wire signed [(4'hc):(1'h0)] wire80;
  wire [(5'h10):(1'h0)] wire98;
  wire signed [(5'h14):(1'h0)] wire100;
  wire signed [(4'hc):(1'h0)] wire101;
  wire [(4'he):(1'h0)] wire151;
  wire signed [(5'h15):(1'h0)] wire153;
  wire signed [(4'he):(1'h0)] wire199;
  reg signed [(3'h5):(1'h0)] reg209 = (1'h0);
  assign y = {wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire80,
                 wire98,
                 wire100,
                 wire101,
                 wire151,
                 wire153,
                 wire199,
                 reg209,
                 (1'h0)};
  assign wire80 = {(~&((~|wire78[(1'h1):(1'h1)]) && ((wire78 || wire78) || (wire78 ?
                          wire77 : wire79)))),
                      ($signed(((wire79 ? wire75 : (8'ha1)) ?
                          wire77[(4'h9):(1'h1)] : (wire77 && wire78))) > (($signed(wire77) ^~ $unsigned((7'h41))) ?
                          wire75 : $signed($signed(wire78))))};
  module81 #() modinst99 (wire98, clk, wire80, wire78, wire76, wire75);
  assign wire100 = $signed(wire75);
  assign wire101 = $signed(((((8'ha1) ?
                       wire75 : (wire79 ?
                           wire75 : wire78)) | $signed((8'hbb))) + (wire75[(3'h7):(3'h7)] < $unsigned(wire80))));
  module102 #() modinst152 (wire151, clk, wire80, wire100, wire98, wire77);
  assign wire153 = wire79;
  module154 #() modinst200 (.wire156(wire79), .wire157(wire153), .y(wire199), .wire155(wire100), .clk(clk), .wire159(wire78), .wire158(wire101));
  assign wire201 = {$signed(($signed(wire77[(3'h7):(3'h7)]) ?
                           (~|$signed(wire75)) : {{wire153, wire199}}))};
  assign wire202 = wire199[(3'h7):(2'h2)];
  assign wire203 = wire151;
  assign wire204 = ((^$unsigned(wire78[(1'h1):(1'h1)])) ?
                       (~&(wire77[(4'hb):(4'h9)] ?
                           {(wire100 ? (8'hac) : (8'haf)),
                               wire151[(3'h4):(3'h4)]} : ($signed(wire98) ?
                               $unsigned(wire153) : wire79))) : {wire153});
  assign wire205 = (wire80 ?
                       (wire101[(3'h4):(2'h2)] ?
                           wire98[(3'h7):(1'h1)] : wire98[(4'hb):(2'h2)]) : wire78[(2'h3):(2'h3)]);
  assign wire206 = (((^((wire79 ?
                           wire75 : wire75) << wire101[(4'hb):(3'h4)])) >= ((^(^wire78)) ?
                           wire77 : {(wire75 ? wire205 : wire75),
                               $signed(wire98)})) ?
                       wire80[(4'h9):(3'h4)] : $unsigned(({{wire79},
                           (7'h44)} <= $signed((~&wire79)))));
  assign wire207 = (($unsigned(({wire77, wire79} ?
                           (^wire78) : (wire100 ^ wire206))) & wire204) ?
                       (+$unsigned({$signed(wire101)})) : ($unsigned($signed(wire206)) ?
                           $unsigned(((8'ha3) ^ ((8'ha2) - wire201))) : (wire101[(2'h3):(1'h1)] ?
                               $unsigned(wire76) : (|wire78))));
  assign wire208 = ((wire77 ?
                       $signed($signed($unsigned(wire77))) : $signed($signed(wire80))) - (+({wire75} <= wire199)));
  always
    @(posedge clk) begin
      reg209 <= wire76[(3'h7):(3'h5)];
    end
  assign wire210 = ((wire77 ?
                           ($unsigned($unsigned((8'haa))) || $signed(wire101)) : $signed((8'hb6))) ?
                       wire100[(1'h1):(1'h0)] : wire98);
  assign wire211 = ((~(~|$unsigned(wire76[(3'h7):(1'h0)]))) ?
                       wire199[(2'h2):(1'h1)] : (reg209[(3'h5):(3'h5)] ?
                           ($signed(reg209) < $signed($signed(wire151))) : (^($unsigned((8'hbd)) ?
                               wire210[(1'h0):(1'h0)] : wire153))));
  assign wire212 = {(wire153[(4'hd):(4'hd)] ? (^~wire203) : $unsigned(wire207)),
                       ($unsigned((~|$signed(wire76))) ?
                           {$unsigned($unsigned(wire210))} : $unsigned(wire206))};
  assign wire213 = wire100[(2'h2):(2'h2)];
endmodule

module module5
#(parameter param66 = (-{((((8'haf) ^ (8'h9d)) ? {(7'h41), (7'h44)} : {(8'hb8)}) - (((8'hb6) & (8'h9f)) <= ((8'hb1) ^~ (8'hb0))))}), 
parameter param67 = ((^{((~^param66) ? (param66 ~^ (8'h9f)) : (param66 ? param66 : param66)), (!(param66 ? param66 : param66))}) ? ((param66 < param66) <= {param66}) : (param66 ? (((param66 ? param66 : param66) ? (param66 ? param66 : param66) : (param66 ? param66 : param66)) <= ((param66 + (7'h44)) + param66)) : ((~&(param66 ? param66 : (8'hac))) != (~&(~&param66))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire64;
  wire signed [(4'h8):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire60;
  wire signed [(3'h7):(1'h0)] wire59;
  wire [(2'h3):(1'h0)] wire58;
  wire signed [(4'h8):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire56;
  wire [(2'h3):(1'h0)] wire54;
  wire [(4'hd):(1'h0)] wire25;
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
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
                 wire54,
                 wire25,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 (1'h0)};
  module10 #() modinst26 (wire25, clk, wire8, wire7, wire9, wire6);
  always
    @(posedge clk) begin
      reg27 <= {(~|$signed({wire6[(1'h0):(1'h0)]})),
          $unsigned($signed({(wire9 * (8'ha2))}))};
      reg28 <= (reg27[(4'ha):(3'h6)] ?
          (wire9[(1'h1):(1'h0)] ~^ (wire8[(4'he):(1'h0)] && ((~&wire25) ?
              wire25[(1'h0):(1'h0)] : $unsigned(wire9)))) : (($signed($signed(wire7)) * wire6[(4'h8):(1'h0)]) <= (+(-$unsigned(wire7)))));
      if (wire6)
        begin
          reg29 <= (($unsigned({(-wire6),
              {wire7}}) != $unsigned((8'ha8))) <= ($unsigned(wire6[(4'hc):(4'h8)]) && wire8));
          reg30 <= (~^wire8[(4'ha):(3'h6)]);
          reg31 <= reg28;
          reg32 <= (wire8 ?
              {{$unsigned((wire25 ? (7'h43) : wire9))},
                  ($unsigned((reg27 ?
                      wire25 : wire25)) ^ ((+reg27) >> wire9[(4'h8):(3'h6)]))} : (wire7 ?
                  reg28[(2'h2):(1'h0)] : wire7));
          reg33 <= wire9[(4'h9):(1'h0)];
        end
      else
        begin
          reg29 <= $signed((wire25[(4'h9):(2'h3)] ?
              wire25[(4'hc):(3'h5)] : reg29[(1'h0):(1'h0)]));
          reg30 <= {(^~reg31), wire25[(2'h3):(1'h0)]};
          reg31 <= (!$signed($unsigned((&(+wire9)))));
          if ($unsigned($unsigned(((~reg31[(1'h1):(1'h1)]) ?
              ((8'hbf) ? {wire25, wire25} : $signed(reg27)) : (7'h40)))))
            begin
              reg32 <= ($unsigned(($signed((reg30 ? reg29 : reg28)) ?
                      wire6[(2'h3):(2'h3)] : $unsigned((~&reg30)))) ?
                  $unsigned((~^wire6[(1'h0):(1'h0)])) : wire8[(4'he):(3'h6)]);
              reg33 <= (~&{wire8[(2'h3):(2'h3)], (8'hb8)});
              reg34 <= $signed((reg28 || $unsigned({wire25, $signed(reg30)})));
              reg35 <= $signed({reg32[(1'h1):(1'h0)]});
            end
          else
            begin
              reg32 <= {$unsigned($signed(((wire7 ~^ (8'h9f)) ~^ (wire7 ^ wire25))))};
              reg33 <= (|($unsigned((~^(wire9 == reg29))) - {$signed(reg32[(4'he):(2'h2)])}));
              reg34 <= (reg32[(4'hf):(3'h5)] ?
                  $signed(((((8'h9f) * wire6) ?
                      wire6 : reg27) >= $unsigned((^~reg33)))) : (7'h40));
              reg35 <= $signed((($signed((~&wire9)) ~^ (~|(reg31 >= wire9))) ?
                  ((~|$signed(reg28)) & (^(wire25 ?
                      (8'hb2) : reg34))) : $unsigned((wire25[(1'h1):(1'h1)] ?
                      (~^reg32) : reg29[(1'h1):(1'h0)]))));
            end
        end
    end
  module36 #() modinst55 (wire54, clk, wire25, wire9, reg29, reg35, reg27);
  assign wire56 = {((($signed(reg34) ?
                              $unsigned(wire25) : reg35) * $signed((+wire54))) ?
                          reg31 : ($signed((8'hbd)) + $unsigned(reg29))),
                      (~^reg29[(5'h13):(1'h0)])};
  assign wire57 = reg27;
  assign wire58 = (((($signed(wire57) == reg32[(5'h10):(1'h1)]) <= wire8) >>> reg35[(3'h7):(3'h5)]) ?
                      $unsigned({$signed($signed(reg28)),
                          $unsigned((&reg29))}) : wire7[(1'h1):(1'h0)]);
  assign wire59 = $signed(($unsigned(($signed(reg33) ?
                      $unsigned(wire56) : wire6)) <<< (reg32 ?
                      $unsigned((~|reg27)) : (&$unsigned((7'h44))))));
  assign wire60 = (reg35 ?
                      $signed((((reg27 ? wire7 : wire54) ?
                          wire58 : {(8'hbb),
                              wire9}) >= ((!wire6) | (-(7'h41))))) : $unsigned(({reg31[(2'h2):(1'h1)],
                              wire54[(2'h2):(1'h1)]} ?
                          reg35 : (!{wire57}))));
  assign wire61 = $signed(wire56);
  assign wire62 = $unsigned($signed(wire59));
  assign wire63 = $signed(wire9[(1'h0):(1'h0)]);
  assign wire64 = wire54[(1'h1):(1'h0)];
  assign wire65 = {wire59,
                      (wire8[(5'h13):(1'h1)] > (wire63 ?
                          (wire61 <= wire57[(1'h0):(1'h0)]) : (~^$unsigned(wire58))))};
endmodule

module module36
#(parameter param52 = (({(((8'ha1) ? (8'hb1) : (8'ha3)) ^ {(7'h43), (8'ha1)}), {((8'ha5) ? (8'hb6) : (8'hb5)), ((8'hb2) ? (8'hba) : (8'hbb))}} > (8'hbb)) ? {(+((~&(8'ha1)) ? (8'h9c) : ((8'had) ? (8'hbc) : (8'hb7)))), (8'hb4)} : (^((+((8'hb4) ? (7'h41) : (8'hb5))) ? (8'ha8) : (^~((8'hba) ? (8'hbc) : (8'hbb)))))), 
parameter param53 = (+(param52 && param52)))
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire41;
  input wire [(3'h6):(1'h0)] wire40;
  input wire [(5'h15):(1'h0)] wire39;
  input wire signed [(5'h14):(1'h0)] wire38;
  input wire signed [(3'h5):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire49;
  wire [(4'hd):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire44;
  wire signed [(3'h4):(1'h0)] wire43;
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 reg42,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg42 <= wire37[(2'h2):(1'h1)];
    end
  assign wire43 = reg42[(3'h7):(3'h5)];
  assign wire44 = $signed((wire37 ?
                      $signed($unsigned((~^reg42))) : $signed($unsigned({wire40}))));
  assign wire45 = (($unsigned($unsigned(wire40[(3'h5):(1'h1)])) ?
                          ((~|wire40[(1'h1):(1'h1)]) ^ (wire41 ?
                              reg42[(3'h4):(3'h4)] : ((8'hbb) | wire44))) : $unsigned({wire44[(4'h9):(3'h7)]})) ?
                      $signed((|(((8'haf) ?
                          wire44 : wire44) - (^~(8'ha9))))) : $unsigned(wire39[(4'hf):(1'h1)]));
  assign wire46 = wire45;
  assign wire47 = wire41;
  assign wire48 = $signed(((((^~wire37) >>> wire38) >> wire40[(1'h1):(1'h0)]) ?
                      (wire38 <= (&((7'h41) - wire41))) : $signed(((wire47 ?
                          wire46 : reg42) == (wire47 != (8'h9c))))));
  assign wire49 = (wire45[(4'h9):(1'h0)] ?
                      (!(+$unsigned($signed(wire39)))) : wire48[(2'h2):(1'h0)]);
  assign wire50 = wire43[(2'h2):(1'h0)];
  assign wire51 = reg42[(4'h9):(4'h8)];
endmodule

module module10
#(parameter param23 = ((((8'ha7) ? (~|((8'hb0) && (8'hab))) : (-((8'hbc) >> (8'hb8)))) ? {(8'hb2), (~(~&(8'h9e)))} : (~|(&((8'hb8) ? (8'hb8) : (8'ha9))))) ? {((~|{(8'hac), (8'hb5)}) != ((|(8'ha2)) >> ((7'h41) ? (8'hbe) : (8'h9d))))} : (({(~^(8'ha2)), ((8'hb6) >= (8'hae))} || (|((8'ha0) ^~ (8'hb3)))) & {(~|((8'hb0) ~^ (8'hb0)))})), 
parameter param24 = (-((((param23 ^ param23) - (^param23)) ? {param23} : ((param23 ? param23 : param23) ? param23 : (param23 ? param23 : param23))) && {((param23 ? param23 : (8'hb9)) ? (^param23) : (-param23)), param23})))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire14;
  input wire [(4'he):(1'h0)] wire13;
  input wire [(4'hd):(1'h0)] wire12;
  input wire signed [(5'h10):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 (1'h0)};
  assign wire15 = $unsigned($unsigned({(wire11[(4'hf):(3'h7)] & (8'haf))}));
  assign wire16 = ($signed({(|wire11[(4'hb):(4'ha)])}) ?
                      (~^(wire11 && (~|wire14))) : wire13);
  assign wire17 = (|(+$signed((wire16 - (wire12 ~^ (8'hbd))))));
  assign wire18 = (~&wire16);
  assign wire19 = wire18;
  assign wire20 = $signed(wire14);
  assign wire21 = (8'ha4);
  assign wire22 = wire15[(5'h13):(2'h3)];
endmodule

module module154  (y, clk, wire159, wire158, wire157, wire156, wire155);
  output wire [(32'h1ff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire159;
  input wire [(3'h5):(1'h0)] wire158;
  input wire [(5'h15):(1'h0)] wire157;
  input wire signed [(4'he):(1'h0)] wire156;
  input wire signed [(5'h14):(1'h0)] wire155;
  wire signed [(5'h15):(1'h0)] wire198;
  wire signed [(3'h6):(1'h0)] wire197;
  wire [(3'h6):(1'h0)] wire196;
  wire signed [(5'h12):(1'h0)] wire195;
  wire signed [(5'h13):(1'h0)] wire194;
  wire signed [(5'h13):(1'h0)] wire193;
  wire signed [(2'h2):(1'h0)] wire192;
  wire [(4'h9):(1'h0)] wire191;
  wire [(2'h3):(1'h0)] wire190;
  wire [(5'h15):(1'h0)] wire189;
  wire [(5'h13):(1'h0)] wire188;
  wire [(4'he):(1'h0)] wire187;
  wire [(3'h4):(1'h0)] wire186;
  wire [(4'hb):(1'h0)] wire164;
  wire signed [(5'h13):(1'h0)] wire163;
  wire [(4'h8):(1'h0)] wire162;
  wire signed [(5'h15):(1'h0)] wire161;
  wire signed [(2'h3):(1'h0)] wire160;
  reg [(5'h11):(1'h0)] reg185 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg183 = (1'h0);
  reg [(5'h13):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg179 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg178 = (1'h0);
  reg [(3'h6):(1'h0)] reg177 = (1'h0);
  reg signed [(4'he):(1'h0)] reg176 = (1'h0);
  reg [(5'h12):(1'h0)] reg175 = (1'h0);
  reg [(3'h6):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg172 = (1'h0);
  reg [(5'h13):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg170 = (1'h0);
  reg [(5'h15):(1'h0)] reg169 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg168 = (1'h0);
  reg [(5'h14):(1'h0)] reg167 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg166 = (1'h0);
  reg [(4'hf):(1'h0)] reg165 = (1'h0);
  assign y = {wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 reg185,
                 reg184,
                 reg183,
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
                 reg166,
                 reg165,
                 (1'h0)};
  assign wire160 = (wire158 != wire159);
  assign wire161 = ((wire155 ?
                       (~|(7'h42)) : $signed($signed({wire155}))) ~^ ($unsigned(wire157) << wire160));
  assign wire162 = {$signed($signed($signed($unsigned(wire160))))};
  assign wire163 = $unsigned({wire162[(2'h3):(1'h0)],
                       $unsigned(($unsigned(wire161) >>> (wire159 < wire162)))});
  assign wire164 = (^wire162[(4'h8):(3'h6)]);
  always
    @(posedge clk) begin
      reg165 <= $signed(($signed($signed({wire162, wire159})) ?
          $unsigned(((wire163 ? (8'ha5) : wire162) ?
              wire160[(1'h0):(1'h0)] : $unsigned(wire155))) : (&$unsigned((|wire155)))));
      reg166 <= wire156[(3'h7):(2'h3)];
    end
  always
    @(posedge clk) begin
      if ({wire160, $signed(wire158)})
        begin
          if ({wire163[(5'h12):(3'h6)]})
            begin
              reg167 <= $signed($signed(($signed(wire157[(5'h10):(1'h0)]) ?
                  wire155[(4'h9):(2'h3)] : $unsigned((wire156 ?
                      reg165 : reg166)))));
              reg168 <= reg165[(1'h0):(1'h0)];
              reg169 <= (8'hbb);
              reg170 <= (($unsigned(reg167) ?
                  (~|$signed($signed(wire157))) : $signed($signed($signed((8'hb3))))) <= wire164);
              reg171 <= $signed(((wire158 ?
                  ($signed(wire159) - (reg167 + reg168)) : $unsigned($unsigned(wire163))) < (({wire161,
                  reg168} ~^ (reg168 + (8'hb9))) * ((~|wire159) ?
                  {wire156} : (reg167 ? wire163 : (7'h43))))));
            end
          else
            begin
              reg167 <= $unsigned((^~(wire162[(3'h4):(1'h0)] || ((-wire160) ?
                  (reg165 + (8'hb0)) : $signed(wire155)))));
              reg168 <= wire158;
            end
          if ((8'ha0))
            begin
              reg172 <= wire158;
              reg173 <= $unsigned(($signed((reg172[(5'h10):(2'h2)] >> {reg166})) < (((reg166 ?
                  wire162 : wire157) ~^ reg172[(3'h4):(1'h1)]) << $signed($signed(reg167)))));
              reg174 <= {wire157[(2'h3):(2'h3)],
                  $signed($unsigned($unsigned((wire163 <<< wire161))))};
              reg175 <= $signed((!reg169));
            end
          else
            begin
              reg172 <= (~(((8'hb1) + ({wire155} ^~ wire158)) >>> ($signed($signed(wire157)) ?
                  (~wire162) : ($unsigned(wire156) > ((8'hbb) ^ reg169)))));
              reg173 <= reg168;
              reg174 <= $unsigned(reg172);
              reg175 <= (($unsigned((^~(^reg171))) & ($signed((reg171 ?
                          reg172 : reg170)) ?
                      wire159[(4'ha):(3'h4)] : (^~(wire164 ^~ wire161)))) ?
                  $signed($unsigned(((!wire162) == (reg168 ?
                      wire155 : wire159)))) : ({(8'hba)} & {$unsigned(((8'hb8) > wire158)),
                      reg168}));
            end
          reg176 <= $signed((7'h43));
          reg177 <= reg174;
          if ({wire159[(4'he):(3'h4)]})
            begin
              reg178 <= $unsigned(((+$signed((+(8'hbe)))) ?
                  (8'haf) : ($unsigned({reg166}) + $unsigned(wire157[(4'hd):(1'h1)]))));
            end
          else
            begin
              reg178 <= reg170;
              reg179 <= ($signed(wire163[(4'h8):(1'h1)]) <= wire164[(3'h7):(1'h1)]);
              reg180 <= (~&wire161);
            end
        end
      else
        begin
          reg167 <= {wire162[(1'h0):(1'h0)]};
          reg168 <= {$signed({reg165, $signed((reg176 >= reg179))}),
              (reg177 ~^ reg175[(3'h7):(2'h3)])};
          reg169 <= ($signed($unsigned((((8'ha6) ? (8'ha9) : wire158) ?
                  $unsigned(reg167) : $unsigned(reg167)))) ?
              wire160[(2'h2):(1'h1)] : (((8'h9d) ?
                  reg179 : wire160) > $signed(reg165[(4'hb):(4'hb)])));
        end
      if ((+$unsigned({(&(!reg179)), reg178})))
        begin
          reg181 <= ($signed(($unsigned((~&wire163)) ~^ reg173[(4'hb):(4'hb)])) > reg167[(4'hd):(3'h7)]);
          reg182 <= $signed(((!$unsigned((reg166 != (7'h41)))) < $signed({$signed(wire161)})));
          reg183 <= wire162;
          reg184 <= reg179[(2'h2):(1'h1)];
        end
      else
        begin
          reg181 <= $signed(((~&($unsigned((8'hab)) - (-wire156))) ?
              reg183 : (reg172[(1'h1):(1'h0)] ?
                  (~&(~&reg182)) : reg180[(2'h2):(2'h2)])));
          reg182 <= reg170[(2'h3):(2'h2)];
          reg183 <= reg173[(5'h12):(5'h10)];
          reg184 <= (&wire163);
        end
      reg185 <= $signed(($signed((|{reg180})) && reg173[(5'h10):(1'h1)]));
    end
  assign wire186 = $unsigned(reg177);
  assign wire187 = $signed($unsigned(((reg180 ?
                           $signed(wire156) : reg166[(2'h2):(2'h2)]) ?
                       ({reg168, wire156} == wire160) : ((wire164 ?
                               reg183 : reg170) ?
                           $signed(wire164) : (reg184 >> wire163)))));
  assign wire188 = (((wire155 ~^ $unsigned((reg168 ? reg166 : wire155))) ?
                       wire164[(3'h7):(3'h4)] : $signed(($signed(wire158) ?
                           (-wire162) : ((8'hb5) ?
                               (8'hb7) : wire162)))) || $unsigned(((+(reg183 << wire161)) ^ $unsigned($signed((7'h43))))));
  assign wire189 = ($signed(reg181) ?
                       (($signed((wire188 ?
                           reg166 : wire162)) + reg175[(2'h3):(2'h3)]) ^ {$signed(wire158[(1'h1):(1'h0)]),
                           (~&wire163)}) : $unsigned((((reg172 ?
                                   reg181 : (8'hbd)) ?
                               wire186 : (reg165 <= wire164)) ?
                           $unsigned((8'hb4)) : $signed($unsigned(reg180)))));
  assign wire190 = (reg183 | wire156);
  assign wire191 = $unsigned(({reg166, (8'ha4)} ?
                       {{$signed(reg170)}, wire156[(4'hb):(2'h3)]} : (^{reg180,
                           $unsigned(wire163)})));
  assign wire192 = (wire157[(2'h2):(1'h0)] ?
                       reg166[(3'h5):(2'h3)] : ($unsigned(((-(8'hb2)) > reg165[(4'h8):(3'h6)])) + (|$signed((wire162 > (8'haa))))));
  assign wire193 = (~($unsigned($signed($signed(wire188))) >> ({{(8'haa),
                           reg182}} < ((wire189 ?
                       wire192 : (8'ha6)) >>> wire189[(4'ha):(3'h6)]))));
  assign wire194 = $signed((~(~|((~^reg179) ?
                       (reg170 ? wire162 : (8'haf)) : $unsigned(reg170)))));
  assign wire195 = wire188[(4'ha):(1'h1)];
  assign wire196 = ((8'hbe) ^~ (~^$signed((8'hb1))));
  assign wire197 = wire164[(4'hb):(1'h0)];
  assign wire198 = (~^($unsigned(((|wire162) != (~^reg171))) <= ({(~reg182),
                       wire186[(1'h1):(1'h0)]} >= (((8'hab) && reg168) >= reg175[(2'h3):(2'h3)]))));
endmodule

module module102
#(parameter param150 = ({(~((+(8'haf)) ? (8'hbe) : {(8'ha3)}))} <= ((-(^(^~(8'haa)))) && {({(8'hb7), (7'h40)} | ((8'hba) ? (8'haf) : (8'hb1))), ((-(8'h9f)) * (~(8'hbb)))})))
(y, clk, wire106, wire105, wire104, wire103);
  output wire [(32'h1e4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire106;
  input wire signed [(5'h13):(1'h0)] wire105;
  input wire [(4'h9):(1'h0)] wire104;
  input wire signed [(5'h13):(1'h0)] wire103;
  wire signed [(2'h3):(1'h0)] wire149;
  wire [(4'h9):(1'h0)] wire146;
  wire [(5'h11):(1'h0)] wire145;
  wire [(3'h6):(1'h0)] wire131;
  wire signed [(5'h14):(1'h0)] wire130;
  wire [(4'hf):(1'h0)] wire129;
  wire [(3'h6):(1'h0)] wire128;
  wire [(4'ha):(1'h0)] wire127;
  wire signed [(4'hc):(1'h0)] wire126;
  wire signed [(3'h5):(1'h0)] wire113;
  wire [(3'h5):(1'h0)] wire112;
  wire signed [(4'he):(1'h0)] wire111;
  wire [(3'h4):(1'h0)] wire110;
  wire [(3'h5):(1'h0)] wire109;
  wire [(5'h14):(1'h0)] wire108;
  wire [(4'h8):(1'h0)] wire107;
  reg signed [(4'hd):(1'h0)] reg148 = (1'h0);
  reg [(4'hd):(1'h0)] reg147 = (1'h0);
  reg [(2'h3):(1'h0)] reg144 = (1'h0);
  reg [(5'h12):(1'h0)] reg143 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg142 = (1'h0);
  reg [(3'h6):(1'h0)] reg141 = (1'h0);
  reg [(5'h12):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg139 = (1'h0);
  reg [(4'ha):(1'h0)] reg138 = (1'h0);
  reg [(4'hf):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg134 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg132 = (1'h0);
  reg [(2'h2):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg123 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg121 = (1'h0);
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  reg [(4'h9):(1'h0)] reg116 = (1'h0);
  reg [(4'h9):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg114 = (1'h0);
  assign y = {wire149,
                 wire146,
                 wire145,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 reg148,
                 reg147,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg125,
                 reg124,
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
  assign wire107 = ($unsigned($signed(wire105)) ?
                       $signed((&(7'h43))) : (($unsigned($unsigned(wire105)) >>> $unsigned((&wire106))) < $unsigned((8'ha5))));
  assign wire108 = wire104[(4'h8):(2'h3)];
  assign wire109 = {$unsigned(wire108), $signed($signed(wire104))};
  assign wire110 = wire105;
  assign wire111 = ($signed($signed((-(wire108 ? wire106 : wire108)))) ?
                       $unsigned((wire110 ^ {((8'h9d) + wire107),
                           (wire104 - wire110)})) : $unsigned(wire108[(5'h10):(4'hd)]));
  assign wire112 = ($unsigned(wire106[(2'h3):(2'h3)]) ~^ (|({(wire108 ?
                               wire107 : wire111)} ?
                       $signed($unsigned(wire106)) : $unsigned((wire106 ?
                           wire111 : (8'hbb))))));
  assign wire113 = $unsigned(wire110);
  always
    @(posedge clk) begin
      reg114 <= wire104;
      if (((&(-(wire107[(1'h0):(1'h0)] ? wire105 : (^wire104)))) >> {wire109}))
        begin
          reg115 <= (($unsigned(((wire109 || wire103) >> (wire106 - wire104))) ?
              wire110[(2'h2):(1'h0)] : wire110[(3'h4):(2'h3)]) | (reg114 != $unsigned((8'hb9))));
          if ((((reg115[(1'h1):(1'h0)] - $signed({wire110})) ^ wire107[(2'h2):(1'h1)]) >>> wire110))
            begin
              reg116 <= $signed(wire109[(2'h3):(1'h0)]);
            end
          else
            begin
              reg116 <= (((|wire104) * wire110) ?
                  (+$unsigned(($unsigned((7'h44)) ?
                      (~(8'hb1)) : $unsigned((8'ha6))))) : (((reg115 ?
                      (+wire104) : $signed(reg115)) < {(wire109 && wire110),
                      ((8'h9e) ?
                          reg114 : wire105)}) ^ (|$unsigned((^~reg116)))));
              reg117 <= {($unsigned((~&$unsigned(reg115))) ?
                      ($unsigned(wire105[(4'hf):(3'h6)]) ?
                          reg116[(3'h7):(1'h0)] : (~|wire105)) : $unsigned((8'ha3)))};
              reg118 <= {((8'ha6) < $signed($signed((wire105 * wire108)))),
                  ((~wire113) >> $signed(($signed(wire109) ?
                      wire103[(2'h3):(2'h2)] : wire111[(1'h0):(1'h0)])))};
            end
          if ({$signed($signed((-(8'hb3))))})
            begin
              reg119 <= (~&(reg116[(3'h6):(2'h3)] ?
                  (wire109[(1'h1):(1'h1)] ?
                      $unsigned((~wire107)) : $unsigned($unsigned(wire104))) : (($unsigned(reg118) >>> (wire109 + wire104)) ?
                      $signed($signed(wire104)) : {$unsigned(wire103)})));
              reg120 <= (wire112[(2'h2):(1'h1)] || $unsigned(((8'hb3) ?
                  (~^reg119[(2'h2):(1'h1)]) : wire109[(3'h4):(1'h0)])));
              reg121 <= (8'hb8);
            end
          else
            begin
              reg119 <= ((|$unsigned((~^$signed(reg116)))) ?
                  (^~reg117) : $unsigned(wire106[(2'h2):(1'h0)]));
              reg120 <= wire106;
              reg121 <= wire109[(2'h3):(1'h0)];
              reg122 <= (+($signed($unsigned($signed(wire103))) ?
                  (&(^~wire106[(3'h6):(3'h6)])) : wire113));
              reg123 <= reg119[(2'h2):(2'h2)];
            end
          reg124 <= $unsigned(wire105);
          reg125 <= $signed(reg116[(3'h6):(1'h1)]);
        end
      else
        begin
          if ((reg122 ? wire108 : wire107))
            begin
              reg115 <= $unsigned($signed(((reg124[(5'h10):(4'h8)] | reg119[(4'h9):(3'h7)]) ?
                  {{(8'hb4), wire107}} : ((wire108 ?
                      (8'had) : wire106) ^~ (wire104 ? (8'hba) : reg125)))));
              reg116 <= ({($signed(wire104[(1'h1):(1'h0)]) & reg118),
                      (~^(^(wire107 | reg117)))} ?
                  (8'ha1) : wire113[(2'h3):(1'h1)]);
            end
          else
            begin
              reg115 <= (~$unsigned(reg125[(1'h0):(1'h0)]));
              reg116 <= $signed($signed((8'ha7)));
              reg117 <= (((^~wire107) ?
                  (((wire106 ? reg125 : reg124) ?
                      (reg121 ? (8'hba) : wire110) : (wire104 ?
                          reg121 : (8'hbc))) >>> wire106) : ({{reg115, (8'h9d)},
                      {(8'haa)}} <<< $unsigned((reg117 >= reg119)))) <= {wire107[(2'h2):(1'h0)],
                  (((reg123 || wire108) ? reg124 : (reg119 ^~ wire106)) ?
                      (~|wire108[(4'hd):(2'h3)]) : ({(8'hb1), wire111} ?
                          $unsigned(wire108) : (reg114 ? reg124 : (8'ha2))))});
            end
          reg118 <= $signed((!{(~^(^wire107)),
              (!(reg123 ? reg114 : (8'hb1)))}));
          reg119 <= $unsigned(($signed(((reg125 ?
              reg120 : wire109) <= (^reg117))) || ($unsigned((wire108 ?
                  reg114 : reg118)) ?
              $signed((8'hba)) : $unsigned(reg119[(2'h3):(2'h3)]))));
          reg120 <= reg118[(5'h10):(2'h2)];
        end
    end
  assign wire126 = $unsigned(reg121);
  assign wire127 = (((((~&(8'ha9)) - (-wire109)) >>> ($unsigned(reg118) ?
                           $unsigned(reg124) : (8'hbe))) ^~ $unsigned((|(&wire110)))) ?
                       wire109[(3'h4):(3'h4)] : (^($unsigned($unsigned(reg119)) ?
                           wire109[(1'h1):(1'h0)] : wire112[(1'h0):(1'h0)])));
  assign wire128 = ((|wire105) ?
                       wire113 : (&(((~|(8'h9d)) < {reg121, (8'ha7)}) ?
                           $signed(((8'hb3) == reg125)) : $unsigned((&reg121)))));
  assign wire129 = {($unsigned($signed({wire109,
                           wire107})) || (($unsigned(reg121) ?
                           $signed((8'hb4)) : (wire104 + reg118)) >> ($signed((8'hb8)) ^ (|wire103))))};
  assign wire130 = $unsigned(reg123);
  assign wire131 = ($unsigned($unsigned(wire129)) ?
                       ((reg121 == $unsigned((wire127 ?
                           wire106 : reg115))) < (($unsigned(reg125) & ((8'haf) ?
                           (8'h9e) : reg114)) > reg125[(1'h1):(1'h0)])) : $unsigned(wire129));
  always
    @(posedge clk) begin
      reg132 <= reg122[(3'h5):(2'h3)];
      reg133 <= (!wire112);
      reg134 <= (~&$unsigned($signed((((8'ha7) ?
          reg115 : wire112) != {wire130}))));
      reg135 <= (reg114 ~^ ($signed((~(~^wire130))) ?
          {$signed(reg122[(1'h1):(1'h0)])} : wire107[(2'h3):(1'h1)]));
      if (wire109[(1'h1):(1'h0)])
        begin
          reg136 <= $signed({((|$unsigned(wire109)) != $signed(wire128))});
          if (wire107[(4'h8):(3'h5)])
            begin
              reg137 <= $signed(wire130);
            end
          else
            begin
              reg137 <= reg132[(5'h10):(5'h10)];
              reg138 <= ($signed($signed((reg116[(2'h3):(2'h3)] ?
                  $signed((8'hb1)) : $signed(wire106)))) << {reg135[(3'h4):(2'h3)]});
              reg139 <= $unsigned(((wire129[(3'h6):(1'h0)] ?
                  $unsigned((wire127 || wire129)) : $unsigned(reg115[(1'h0):(1'h0)])) ^~ $signed((^~$unsigned((8'hb1))))));
            end
          reg140 <= $unsigned(wire110);
          reg141 <= reg118[(3'h4):(2'h3)];
          if ((({$signed(((8'hba) >> (7'h43))),
              {{wire128,
                      wire126}}} > (~(~^(-reg123)))) ~^ ((($unsigned(wire105) << $unsigned(reg137)) ?
              (|wire113) : (~$unsigned(wire127))) ^ wire129)))
            begin
              reg142 <= reg125[(2'h2):(2'h2)];
              reg143 <= ($unsigned({$signed(wire109[(2'h2):(2'h2)]),
                      reg117[(4'hc):(4'ha)]}) ?
                  reg121 : reg135[(4'h8):(3'h7)]);
              reg144 <= {(((&$signed(wire104)) < (reg139[(1'h1):(1'h1)] ?
                          (^wire112) : $unsigned(reg120))) ?
                      ((-$signed(reg143)) ?
                          {$signed(reg136),
                              (wire107 ?
                                  reg119 : wire110)} : reg132[(5'h10):(4'he)]) : reg138),
                  ({((8'h9c) && $signed((8'had)))} > (&($unsigned((8'hba)) ?
                      {(8'hb3), reg115} : $signed(wire127))))};
            end
          else
            begin
              reg142 <= reg122;
              reg143 <= (^~$signed(wire109));
            end
        end
      else
        begin
          reg136 <= (((-reg122[(4'ha):(3'h5)]) ?
              $unsigned((&(reg119 ?
                  reg124 : (7'h41)))) : reg137) < $signed($signed($signed($signed((8'hbb))))));
          reg137 <= (^~$signed(reg125[(1'h1):(1'h0)]));
          if (($signed({(~$unsigned(reg118)), $unsigned($signed(reg140))}) ?
              (wire129 + $signed((^(8'hbd)))) : wire111[(1'h0):(1'h0)]))
            begin
              reg138 <= (wire113 ? wire113 : wire113);
              reg139 <= reg122[(3'h6):(1'h1)];
              reg140 <= ($signed(wire110[(1'h1):(1'h1)]) ?
                  ((~|(-(+reg139))) == reg118) : (~&((((8'hb9) ?
                          (8'hbb) : (8'hb7)) ^ (!wire109)) ?
                      wire108 : (&reg117))));
            end
          else
            begin
              reg138 <= wire104[(3'h4):(1'h0)];
              reg139 <= reg143[(4'hd):(4'h8)];
              reg140 <= {{(reg141[(3'h6):(1'h0)] - (8'hbb))}};
              reg141 <= reg138[(1'h1):(1'h1)];
            end
          reg142 <= ((wire110 & reg138[(4'h9):(1'h1)]) + (8'ha1));
        end
    end
  assign wire145 = ((reg142[(2'h2):(1'h0)] < {$signed((^(8'hb6)))}) ?
                       $signed((($signed(wire107) * (reg115 >> reg121)) ?
                           {(wire128 ?
                                   reg140 : (7'h44))} : $unsigned($unsigned(wire110)))) : $signed({(reg135 ?
                               $signed((8'ha1)) : reg118),
                           (^(+reg136))}));
  assign wire146 = ((~&$unsigned((wire106[(2'h2):(1'h0)] ?
                       (reg134 ?
                           reg123 : wire103) : (|(8'hae))))) >= (^($signed(((8'hac) ?
                       (8'ha9) : reg132)) - reg143)));
  always
    @(posedge clk) begin
      reg147 <= wire107;
      reg148 <= ($unsigned((|{$signed(reg123),
          ((7'h42) ^~ (8'hbd))})) != reg122);
    end
  assign wire149 = (~^(&wire105[(4'h8):(3'h6)]));
endmodule

module module81
#(parameter param96 = (-(-(|(((8'ha5) > (8'hb3)) ? ((8'h9f) ^ (8'hb6)) : ((8'hb3) != (8'ha0)))))), 
parameter param97 = param96)
(y, clk, wire85, wire84, wire83, wire82);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire85;
  input wire signed [(5'h13):(1'h0)] wire84;
  input wire [(2'h3):(1'h0)] wire83;
  input wire signed [(4'hd):(1'h0)] wire82;
  wire signed [(5'h12):(1'h0)] wire95;
  wire [(5'h11):(1'h0)] wire94;
  wire [(4'hf):(1'h0)] wire93;
  wire [(2'h2):(1'h0)] wire92;
  wire [(2'h3):(1'h0)] wire91;
  wire [(4'hd):(1'h0)] wire90;
  wire signed [(3'h4):(1'h0)] wire89;
  wire signed [(5'h15):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire87;
  wire [(4'ha):(1'h0)] wire86;
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 (1'h0)};
  assign wire86 = (~(wire85 ^~ $unsigned(({wire82} && wire85[(4'h8):(3'h6)]))));
  assign wire87 = ($unsigned((((wire83 != wire84) ?
                      {wire84,
                          wire85} : wire85[(4'ha):(4'h8)]) <<< $unsigned((~wire84)))) >>> $unsigned(wire82[(3'h7):(3'h6)]));
  assign wire88 = (^~(($unsigned((8'h9e)) << $unsigned(((8'hab) ^~ wire82))) || (wire83[(2'h3):(2'h3)] ?
                      $signed((wire82 ? wire84 : wire83)) : (~|wire86))));
  assign wire89 = $unsigned(($unsigned((!wire88[(5'h10):(4'hc)])) ?
                      ($unsigned(((8'ha2) <= wire85)) + wire84[(2'h2):(2'h2)]) : (wire87 ?
                          wire87 : ($signed(wire84) < $signed(wire85)))));
  assign wire90 = $unsigned($unsigned((~&$unsigned((wire84 ?
                      wire86 : wire85)))));
  assign wire91 = wire86;
  assign wire92 = wire84[(5'h11):(4'h9)];
  assign wire93 = wire85;
  assign wire94 = $unsigned({$signed(({wire90} >= wire87[(1'h0):(1'h0)]))});
  assign wire95 = ({{$signed($unsigned(wire84))},
                      (+wire83)} >>> $signed((8'h9e)));
endmodule
