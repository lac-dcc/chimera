module top
#(parameter param97 = {((({(8'hbf)} > ((8'h9e) ? (8'hb9) : (8'h9c))) ? (^((8'hb7) ? (8'hab) : (8'haf))) : {{(8'hac)}}) ~^ (&((|(8'ha0)) && (8'hae))))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire signed [(2'h2):(1'h0)] wire96;
  wire signed [(5'h10):(1'h0)] wire95;
  wire signed [(4'hb):(1'h0)] wire94;
  wire [(4'he):(1'h0)] wire93;
  wire signed [(5'h13):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire91;
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire18,
                 wire20,
                 wire21,
                 wire22,
                 wire34,
                 wire35,
                 wire91,
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
                 (1'h0)};
  module4 #() modinst19 (wire18, clk, wire0, wire2, wire1, wire3, (8'hab));
  assign wire20 = $unsigned((~(((wire1 >= wire3) ^~ $signed(wire3)) ^ wire0[(1'h1):(1'h1)])));
  assign wire21 = $signed((((8'hab) >> ((^(8'hb6)) >= $unsigned(wire18))) ~^ (8'ha6)));
  assign wire22 = ($signed(wire21[(5'h11):(4'ha)]) >= {wire1});
  always
    @(posedge clk) begin
      reg23 <= $signed($unsigned(wire18[(4'h8):(3'h7)]));
      reg24 <= $unsigned($unsigned((~&$unsigned((wire20 <<< wire21)))));
      if (wire20[(2'h3):(2'h2)])
        begin
          reg25 <= wire2[(4'hb):(4'hb)];
          reg26 <= $signed(reg25);
          reg27 <= ((wire2[(4'h9):(2'h3)] & $signed($unsigned($unsigned((8'ha6))))) ?
              wire1 : reg23[(4'h9):(2'h2)]);
          reg28 <= $signed($unsigned((wire20[(3'h4):(1'h1)] == $unsigned((~|reg24)))));
          reg29 <= wire18[(5'h13):(3'h4)];
        end
      else
        begin
          if (wire0[(4'h9):(1'h1)])
            begin
              reg25 <= (wire3 ? wire0 : wire18);
              reg26 <= $signed((($unsigned($unsigned(reg26)) ?
                      (^~(reg24 ? wire2 : wire22)) : {$unsigned(reg25)}) ?
                  (wire2 || $unsigned(wire0)) : $unsigned((~{wire21}))));
              reg27 <= ((|reg23) >= $signed($signed($signed((~^reg23)))));
              reg28 <= ((^$unsigned((|{reg25}))) ^ (($signed((wire1 + reg27)) && $unsigned((^~(7'h42)))) ?
                  {wire20[(1'h0):(1'h0)]} : ($signed((~&wire18)) ?
                      (-$unsigned(wire3)) : ({reg24} ? reg28 : (7'h43)))));
              reg29 <= $unsigned(((($signed(reg23) ?
                  $unsigned(reg27) : {wire0, wire20}) || (reg28 ?
                  ((8'hbc) ?
                      reg23 : (7'h40)) : $signed(reg28))) + ($unsigned((wire0 ^ wire0)) ^ (&wire22))));
            end
          else
            begin
              reg25 <= reg28;
              reg26 <= (~^(~{wire0[(2'h3):(2'h3)],
                  (^~((8'hb9) ? wire0 : reg29))}));
              reg27 <= wire18;
              reg28 <= $unsigned((reg29 == ((^reg25) * $signed((reg23 && reg23)))));
              reg29 <= {(wire1 <= wire21)};
            end
          reg30 <= $unsigned(((8'ha6) ?
              wire1[(4'h9):(1'h1)] : (~|wire22[(4'ha):(1'h1)])));
          reg31 <= {(wire0[(3'h7):(1'h0)] < wire18)};
          reg32 <= reg31;
          reg33 <= $signed($signed($unsigned((|(reg26 ^ reg28)))));
        end
    end
  assign wire34 = (8'hb8);
  assign wire35 = reg26;
  module36 #() modinst92 (.wire41(wire34), .wire39(reg33), .clk(clk), .wire40(reg32), .wire37(wire2), .y(wire91), .wire38(wire3));
  assign wire93 = $unsigned((|(reg24[(3'h7):(2'h2)] <<< wire0)));
  assign wire94 = $signed((+{((^wire0) <<< wire0[(4'hd):(3'h5)])}));
  assign wire95 = (8'had);
  assign wire96 = ($signed(reg31[(4'h9):(1'h1)]) * $unsigned((~^(~|(wire3 != reg26)))));
endmodule

module module36
#(parameter param89 = (((^~(-((8'hb2) ? (8'ha1) : (7'h43)))) >> ((8'haf) ? (+((8'hbe) == (8'h9f))) : (~{(8'ha6), (8'hb5)}))) | ((8'had) ? ({((7'h42) ? (8'hb5) : (8'ha6)), ((8'hac) ~^ (8'hb2))} > {((8'haf) | (7'h43))}) : {{(~(8'had))}})), 
parameter param90 = {(param89 ? {param89} : (~&{(^~param89)}))})
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h20a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire41;
  input wire signed [(3'h6):(1'h0)] wire40;
  input wire [(3'h7):(1'h0)] wire39;
  input wire [(4'hf):(1'h0)] wire38;
  input wire [(4'hb):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire87;
  wire signed [(3'h7):(1'h0)] wire83;
  wire signed [(3'h5):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire80;
  wire [(4'he):(1'h0)] wire79;
  wire [(4'hb):(1'h0)] wire45;
  wire signed [(4'hd):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire43;
  wire signed [(3'h6):(1'h0)] wire42;
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(4'hd):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(3'h7):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 reg86,
                 reg85,
                 reg84,
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
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire42 = {wire39[(2'h3):(2'h2)], wire37};
  assign wire43 = wire37;
  assign wire44 = wire43;
  assign wire45 = {(((8'hb5) ?
                              wire44 : ((wire44 << wire39) ?
                                  wire42[(1'h1):(1'h1)] : {wire38, wire43})) ?
                          (8'hb0) : (wire39[(3'h5):(1'h1)] ?
                              {(wire41 ? wire43 : wire42),
                                  $unsigned(wire37)} : $signed((^~wire42)))),
                      (wire38 ?
                          (($unsigned(wire44) ?
                              wire43[(3'h6):(3'h4)] : (^~wire41)) * wire42[(1'h1):(1'h1)]) : $unsigned($signed((wire42 ?
                              wire39 : wire39))))};
  always
    @(posedge clk) begin
      reg46 <= {((~&((wire44 ? wire38 : wire37) ?
                  $unsigned((8'h9f)) : (wire43 ? wire44 : wire42))) ?
              (($signed(wire38) >= $unsigned(wire44)) ?
                  wire39 : wire44) : wire41[(3'h5):(2'h2)]),
          (^~(~&(-(wire43 != wire44))))};
      reg47 <= {wire37};
    end
  always
    @(posedge clk) begin
      if (($unsigned($unsigned((^~((7'h40) ?
          reg46 : (7'h40))))) != (~(+((wire41 ?
          reg47 : wire41) | $unsigned(wire37))))))
        begin
          reg48 <= wire42[(2'h2):(1'h1)];
          reg49 <= wire41[(1'h0):(1'h0)];
          reg50 <= ({$signed($signed((wire44 - reg46))),
                  (($unsigned(wire45) > (reg48 || wire40)) <= $unsigned(wire45[(4'h8):(3'h4)]))} ?
              {wire37} : ({$unsigned(wire45[(4'ha):(1'h1)]),
                  (8'ha7)} || (wire37[(1'h0):(1'h0)] ?
                  ((^~wire38) - wire44[(1'h0):(1'h0)]) : $unsigned($signed(wire40)))));
          if (($unsigned($unsigned(((wire44 ? (7'h40) : wire38) >= ((8'ha7) ?
                  wire44 : wire42)))) ?
              ((~(((8'hbc) ? reg46 : wire45) + $unsigned(reg47))) ?
                  reg50 : (8'hb5)) : ((($unsigned((8'ha8)) + wire38) ?
                  reg50[(3'h6):(3'h6)] : {((8'haa) != reg46)}) >> ($signed((^~wire45)) ?
                  ($signed(wire40) ?
                      (|(8'h9e)) : $signed((8'ha6))) : (^wire40[(3'h4):(2'h3)])))))
            begin
              reg51 <= ($unsigned($unsigned(wire45)) > wire43[(4'h8):(3'h6)]);
              reg52 <= ((^~wire44[(4'h9):(3'h5)]) ?
                  $unsigned(reg48) : reg47[(3'h4):(1'h0)]);
              reg53 <= ($signed($signed(reg48)) ? (8'ha9) : wire40);
            end
          else
            begin
              reg51 <= (^({wire42[(2'h2):(2'h2)]} | {((8'ha9) ?
                      wire43 : (reg49 >>> wire39))}));
              reg52 <= ($signed(($signed($signed(wire39)) ?
                  {$unsigned(wire37)} : $signed((~|reg46)))) < $signed(((wire40 | $unsigned(wire41)) ?
                  ((reg52 ?
                      wire42 : reg48) >> wire42[(3'h5):(2'h2)]) : $unsigned(wire38[(4'h8):(3'h5)]))));
            end
          if ((8'ha4))
            begin
              reg54 <= wire39;
              reg55 <= $signed({$signed(((^(8'h9c)) ^~ reg52[(4'hd):(2'h3)])),
                  reg54[(3'h7):(3'h5)]});
            end
          else
            begin
              reg54 <= ((wire42[(3'h6):(1'h1)] >= (wire38[(4'hd):(4'hc)] + $unsigned((wire40 >>> wire43)))) ?
                  $unsigned(wire43[(4'h9):(1'h0)]) : reg50);
              reg55 <= ($unsigned(($unsigned(((7'h42) ? reg49 : (8'haf))) ?
                      (&$unsigned(wire40)) : (~|((7'h42) ? wire43 : reg49)))) ?
                  (|$unsigned(($signed(reg46) ?
                      (~^reg50) : (wire38 != (8'hbe))))) : $unsigned({wire37[(3'h4):(1'h0)]}));
              reg56 <= (~&(-$signed(((wire41 || reg49) << (~&wire37)))));
              reg57 <= (wire42 && $signed((7'h41)));
            end
        end
      else
        begin
          reg48 <= (+(wire42[(1'h0):(1'h0)] || (~&reg50[(5'h10):(4'h9)])));
        end
      if (reg54[(3'h5):(1'h0)])
        begin
          if ((reg51[(1'h0):(1'h0)] ?
              ({wire38, (+{wire38})} >>> reg46[(4'hc):(4'h8)]) : (~wire43)))
            begin
              reg58 <= $unsigned((wire45[(3'h7):(3'h6)] + (~|(-$unsigned(wire41)))));
              reg59 <= (~&({({reg50, wire39} >> (reg48 && (8'hba))),
                      $signed((7'h41))} ?
                  (^~(!(|reg53))) : $signed($signed((reg51 <= reg50)))));
            end
          else
            begin
              reg58 <= (7'h44);
              reg59 <= ((&($unsigned(((8'h9c) ? wire41 : reg49)) & wire37)) ?
                  (~|(~wire38[(3'h5):(1'h0)])) : reg58[(3'h4):(2'h3)]);
              reg60 <= {(+{reg46[(3'h4):(1'h0)], $unsigned((&reg57))}),
                  reg57[(4'hc):(3'h6)]};
              reg61 <= $signed($unsigned($signed(reg55[(2'h2):(2'h2)])));
              reg62 <= (&(($unsigned($unsigned(reg60)) ?
                  $signed(wire43) : $signed(reg52)) & (^~wire42)));
            end
          reg63 <= $signed($unsigned((({reg60,
              (8'ha9)} ^ (reg54 < (8'hb0))) > reg46[(3'h5):(3'h5)])));
          reg64 <= ((wire44 <<< (-$signed(((8'hbc) ?
              wire45 : (8'hae))))) << ({$signed(((7'h44) > reg55))} ?
              $signed($unsigned((wire42 ~^ wire43))) : reg52));
        end
      else
        begin
          if ($unsigned(wire42[(1'h1):(1'h1)]))
            begin
              reg58 <= (!(&{(reg58 ? $unsigned(reg61) : (-wire37)), reg54}));
              reg59 <= $signed((($unsigned(wire42) - $unsigned({(8'hb0)})) ?
                  wire39[(2'h3):(1'h1)] : ((&{reg57}) >>> $unsigned($unsigned(wire38)))));
            end
          else
            begin
              reg58 <= (~(&$signed($unsigned($signed(wire45)))));
              reg59 <= (~$unsigned($unsigned(((reg63 ? (8'h9f) : reg58) ?
                  (reg51 ? reg48 : reg48) : $signed(wire40)))));
              reg60 <= reg57[(2'h2):(1'h0)];
              reg61 <= $signed($signed((8'hbe)));
              reg62 <= reg50;
            end
          reg63 <= $unsigned(($unsigned($signed(wire44)) ?
              $signed(wire37[(4'hb):(4'hb)]) : (($unsigned(reg57) ?
                      wire38 : reg62[(2'h2):(2'h2)]) ?
                  ((reg49 >= reg55) ?
                      {wire42, wire39} : (wire39 ?
                          reg49 : wire39)) : (reg53 > $unsigned((8'ha5))))));
          reg64 <= ({(~({wire43} | wire44))} != (8'hb8));
          reg65 <= ($signed((-$unsigned((^wire39)))) ?
              {(-{(wire42 ? wire37 : reg63), reg61})} : (~&reg62));
        end
      reg66 <= (-{$signed(reg58[(1'h1):(1'h1)]), (|(reg57 + {reg55}))});
      reg67 <= $signed(wire40);
      if (($unsigned(wire39[(2'h2):(1'h0)]) ?
          $signed((~&(|$unsigned((8'hbc))))) : (~|$unsigned({$signed(reg67)}))))
        begin
          reg68 <= (reg57 ?
              (reg60 ? {(-(&wire42))} : reg46[(4'h8):(3'h4)]) : reg51);
          if ({(^$unsigned((&$signed(reg64)))), $unsigned(wire37)})
            begin
              reg69 <= reg66[(1'h0):(1'h0)];
              reg70 <= $signed(reg49);
              reg71 <= wire44;
            end
          else
            begin
              reg69 <= ($signed({($unsigned((8'h9f)) ?
                          $signed(reg57) : reg48[(3'h4):(2'h3)])}) ?
                  $unsigned((|reg70[(3'h6):(1'h0)])) : $signed((8'hae)));
              reg70 <= $unsigned(((((~|reg58) < {reg65}) ?
                      (|(~^wire37)) : reg49[(4'ha):(4'ha)]) ?
                  {(((8'ha5) ? reg47 : wire42) ?
                          (reg55 ? wire42 : reg49) : (reg48 - reg55)),
                      ((reg47 || reg57) == reg50[(2'h2):(1'h1)])} : (8'hb6)));
              reg71 <= reg65;
              reg72 <= $signed((|reg52[(4'hd):(4'hd)]));
            end
          reg73 <= {reg60[(3'h6):(1'h1)]};
          if ((~&reg65))
            begin
              reg74 <= ($signed(wire40) | $signed(((8'hb7) ^ (wire41 << (^~wire44)))));
              reg75 <= reg65;
              reg76 <= $signed((&(($unsigned(reg71) <= $signed(wire41)) ?
                  reg55 : (((8'hbe) >= reg57) <<< ((8'ha8) ?
                      (8'hb8) : wire42)))));
              reg77 <= $signed(reg74[(2'h2):(1'h1)]);
            end
          else
            begin
              reg74 <= {(~^$unsigned($signed((reg56 <= reg64)))), reg66};
            end
          reg78 <= (!((!reg61[(1'h0):(1'h0)]) * reg46));
        end
      else
        begin
          if (($unsigned(reg54[(2'h2):(1'h0)]) + {wire40[(2'h3):(1'h1)]}))
            begin
              reg68 <= ($unsigned({wire37[(3'h7):(2'h3)]}) ?
                  (~|wire40[(3'h4):(2'h2)]) : reg54);
              reg69 <= $unsigned($unsigned(reg46));
            end
          else
            begin
              reg68 <= $unsigned(((|reg63[(5'h14):(5'h14)]) ?
                  {(+(wire44 >= (8'hb3)))} : (8'hbf)));
              reg69 <= reg75[(2'h2):(1'h1)];
              reg70 <= {(~(((wire38 < wire39) * reg64) ^~ $unsigned(((7'h42) ?
                      reg47 : reg66)))),
                  $unsigned($signed(reg73[(4'h9):(3'h6)]))};
              reg71 <= (|((reg62 ? reg62 : $signed($unsigned(reg54))) ?
                  wire37 : (+$signed((reg69 ? reg49 : reg52)))));
            end
        end
    end
  assign wire79 = reg70;
  assign wire80 = $signed((&reg46[(4'hb):(4'ha)]));
  assign wire81 = reg58;
  assign wire82 = reg59;
  assign wire83 = (~|((wire37 ?
                          (~|reg48[(1'h0):(1'h0)]) : $signed($unsigned(reg67))) ?
                      {wire37,
                          (((8'hbd) - reg78) >>> (|(8'hb7)))} : $signed(wire82[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg84 <= wire43[(4'ha):(4'h9)];
      reg85 <= (~|reg63);
      reg86 <= ({$signed(wire81[(3'h7):(2'h2)]),
              ({reg76[(3'h4):(1'h1)], $unsigned((8'hb4))} + wire39)} ?
          ({$signed((reg62 <= reg72)), reg58[(1'h0):(1'h0)]} ?
              ($signed((8'ha6)) > ((reg48 ? reg64 : reg59) ?
                  {reg75} : (reg55 ?
                      reg60 : (8'hb3)))) : reg85) : ((wire44[(3'h4):(2'h2)] ?
              reg73[(3'h7):(1'h0)] : reg53) >= reg52[(1'h0):(1'h0)]));
    end
  assign wire87 = $signed(reg60);
  assign wire88 = {(((wire45[(4'ha):(4'h9)] << $signed(reg73)) < (reg70[(3'h4):(3'h4)] ?
                          (reg86 >> (8'ha1)) : (reg65 ?
                              wire38 : reg60))) & $signed($unsigned(reg65))),
                      (reg61[(2'h2):(1'h1)] <<< (reg61 ?
                          (^~(-wire42)) : $signed($signed(wire87))))};
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire6;
  input wire [(4'he):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire11,
                 wire10,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire10 = (-wire5[(3'h5):(1'h0)]);
  assign wire11 = wire9;
  always
    @(posedge clk) begin
      reg12 <= wire10;
      reg13 <= wire7[(1'h1):(1'h0)];
    end
  assign wire14 = $signed(wire11[(4'ha):(2'h2)]);
  assign wire15 = (!wire11);
  assign wire16 = {($unsigned(wire10[(1'h0):(1'h0)]) ?
                          $unsigned({(wire15 ?
                                  reg12 : wire11)}) : $unsigned({$signed((8'ha2)),
                              (wire7 >= wire14)}))};
  assign wire17 = ($unsigned($unsigned({{wire8, wire6}})) ?
                      (wire15 ?
                          wire6[(4'h8):(4'h8)] : $signed($unsigned((-reg12)))) : $unsigned(($signed(wire6[(2'h2):(1'h0)]) ?
                          wire16 : ($signed(wire16) ?
                              (wire7 ? wire9 : wire16) : $signed(reg12)))));
endmodule
