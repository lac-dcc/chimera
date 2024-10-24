module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire90;
  wire [(5'h11):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire4;
  reg signed [(2'h2):(1'h0)] reg5 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  assign y = {wire90,
                 wire12,
                 wire10,
                 wire9,
                 wire4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg11,
                 (1'h0)};
  assign wire4 = {$unsigned((~|(~(wire1 + wire1))))};
  always
    @(posedge clk) begin
      reg5 <= (&wire4);
      reg6 <= wire3;
      reg7 <= wire3[(1'h1):(1'h0)];
      reg8 <= wire4;
    end
  assign wire9 = {({reg7[(4'h8):(4'h8)]} ?
                         (|{(wire3 - wire1),
                             {reg6, wire3}}) : wire2[(4'hb):(4'ha)])};
  assign wire10 = wire1;
  always
    @(posedge clk) begin
      reg11 <= $unsigned($signed($unsigned($unsigned($signed((8'ha5))))));
    end
  assign wire12 = $signed($unsigned($signed({wire10[(4'hf):(3'h6)]})));
  module13 #() modinst91 (.wire14(wire12), .y(wire90), .wire15(wire4), .wire18(wire9), .wire16(wire0), .clk(clk), .wire17(reg11));
endmodule

module module13
#(parameter param89 = (~(((((8'hb1) == (8'hb8)) & (^(8'hb6))) + ((-(7'h40)) * (|(8'hb0)))) - (~&(-(-(8'hbb)))))))
(y, clk, wire14, wire15, wire16, wire17, wire18);
  output wire [(32'h1ff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire14;
  input wire [(4'hd):(1'h0)] wire15;
  input wire signed [(4'h9):(1'h0)] wire16;
  input wire signed [(5'h10):(1'h0)] wire17;
  input wire signed [(5'h12):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire87;
  wire [(2'h3):(1'h0)] wire86;
  wire [(3'h4):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire84;
  wire signed [(5'h10):(1'h0)] wire70;
  wire signed [(4'hb):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire68;
  wire [(2'h3):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire62;
  wire [(4'ha):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire60;
  wire signed [(5'h13):(1'h0)] wire59;
  wire [(5'h14):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire46;
  reg signed [(4'ha):(1'h0)] reg83 = (1'h0);
  reg [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire19,
                 wire46,
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
  assign wire19 = (($signed(wire17) ?
                      $signed(($unsigned(wire17) << (wire17 ?
                          wire16 : wire16))) : (((wire16 ? wire15 : wire18) ?
                              wire16[(3'h6):(3'h4)] : $unsigned((8'hbf))) ?
                          (!(wire14 ? (8'hbb) : (7'h40))) : $signed((wire18 ?
                              wire18 : wire15)))) & wire18[(1'h1):(1'h1)]);
  module20 #() modinst47 (wire46, clk, wire19, wire18, wire17, wire15, wire14);
  always
    @(posedge clk) begin
      reg48 <= wire19;
      if ((($signed($signed(wire46)) == $signed(wire18[(5'h11):(3'h7)])) == ($unsigned({(wire18 ?
                  wire15 : wire14)}) ?
          wire19[(4'he):(4'hb)] : (!((wire19 ? wire46 : wire19) ?
              (wire16 ? wire19 : wire17) : {wire16})))))
        begin
          reg49 <= (($signed(((^wire16) ?
              (8'ha8) : (wire18 ? wire18 : wire18))) * ((wire17[(4'ha):(1'h1)] ?
              wire16 : (wire46 ?
                  wire17 : (7'h41))) >= wire19[(4'ha):(3'h5)])) ^~ {(((-(8'h9c)) >> wire16) <<< wire17[(4'hd):(4'hd)]),
              $unsigned(($unsigned(wire18) ?
                  $unsigned(wire46) : (wire19 ? wire17 : (8'hb1))))});
        end
      else
        begin
          reg49 <= ($signed($unsigned($signed(wire18))) ?
              {reg49[(2'h2):(1'h1)]} : wire18);
          reg50 <= ({wire16} ?
              reg49[(1'h0):(1'h0)] : (((reg48[(3'h4):(1'h1)] ?
                  wire19[(2'h3):(1'h1)] : (wire16 || wire46)) << $signed($unsigned(wire14))) & wire18[(5'h11):(2'h2)]));
          reg51 <= ({($unsigned((~|wire14)) ?
                      ((wire17 ? wire15 : wire14) ?
                          wire18 : {wire17}) : {((8'hb3) - reg50)})} ?
              (+$signed((wire16[(3'h5):(3'h4)] ?
                  (wire17 < reg48) : $signed(wire16)))) : wire15);
          reg52 <= ((wire16[(4'h9):(3'h6)] & wire18[(2'h2):(1'h0)]) ?
              $signed(wire46) : $unsigned((+(wire16 >> (-(8'hbf))))));
          if ({(^reg50[(1'h1):(1'h0)]), $signed(wire19)})
            begin
              reg53 <= $unsigned(((~|(-$unsigned(reg51))) ?
                  reg52 : {(((8'hb2) > reg51) || $unsigned(wire15)),
                      ((|wire15) <= (wire46 && reg50))}));
              reg54 <= $unsigned($unsigned($signed(wire18[(3'h4):(2'h2)])));
              reg55 <= $unsigned({(8'ha4), wire16});
              reg56 <= (^~{$unsigned($signed((reg51 ? wire16 : (8'had))))});
              reg57 <= (&reg53);
            end
          else
            begin
              reg53 <= {$signed(wire17[(4'hb):(3'h6)]), reg57[(1'h1):(1'h1)]};
              reg54 <= wire19;
            end
        end
      reg58 <= $unsigned(reg51);
    end
  assign wire59 = {wire17[(3'h4):(1'h1)]};
  assign wire60 = ((!{(reg51[(3'h4):(2'h2)] ?
                              (reg53 || wire59) : (reg49 || (8'haf))),
                          (((8'ha2) >> wire18) + (^reg52))}) ?
                      wire16[(3'h5):(1'h1)] : ((wire19[(5'h10):(5'h10)] << ($signed(reg49) && (^(7'h42)))) ?
                          ((~$signed((7'h43))) < $unsigned($unsigned(wire19))) : reg53[(1'h0):(1'h0)]));
  assign wire61 = reg54[(5'h11):(3'h6)];
  assign wire62 = {$unsigned(($signed($unsigned(reg57)) ?
                          $signed($unsigned(reg48)) : $signed((wire61 ?
                              wire15 : (8'ha5)))))};
  assign wire63 = (wire16[(4'h8):(4'h8)] | $signed($unsigned((~$unsigned(reg49)))));
  assign wire64 = ($unsigned($signed(wire14[(1'h1):(1'h0)])) && $signed(reg56[(4'hb):(3'h5)]));
  assign wire65 = $signed((8'had));
  assign wire66 = ($signed(({$signed(reg58)} + {(8'haa),
                          reg53[(3'h5):(2'h3)]})) ?
                      ((-wire46) ^ $unsigned($signed(wire46[(1'h0):(1'h0)]))) : reg53[(2'h3):(2'h3)]);
  assign wire67 = wire14;
  assign wire68 = wire61[(1'h0):(1'h0)];
  assign wire69 = (8'hbb);
  assign wire70 = $unsigned($signed(((reg53[(3'h5):(1'h1)] + reg50[(1'h0):(1'h0)]) ?
                      ($unsigned(reg48) | ((8'hab) ?
                          reg57 : wire46)) : reg53[(3'h4):(1'h0)])));
  always
    @(posedge clk) begin
      if ((((^((reg49 ^ wire63) ?
              $signed(reg55) : {wire63, reg58})) || (~|(reg56 ?
              wire65[(2'h3):(2'h3)] : reg55))) ?
          (({reg57, (wire16 ? (8'ha2) : (8'ha1))} ?
              wire61 : (^(~reg54))) + $unsigned(wire59)) : $signed($signed(((+reg50) ?
              reg51 : {wire15})))))
        begin
          reg71 <= $signed(((&wire67[(1'h1):(1'h1)]) & wire68[(3'h4):(1'h0)]));
          if (($signed(({$signed(wire18)} <= (wire64[(4'hf):(4'h9)] << $unsigned(reg49)))) <= $unsigned((~$signed($signed(reg50))))))
            begin
              reg72 <= $unsigned(wire19[(4'ha):(3'h6)]);
              reg73 <= reg55;
            end
          else
            begin
              reg72 <= $unsigned(($unsigned(($unsigned((8'ha1)) ?
                  (reg71 ?
                      wire68 : (8'hab)) : (reg73 <= (8'h9c)))) & $signed({(wire64 ?
                      wire68 : reg50),
                  (wire18 ? wire65 : reg48)})));
              reg73 <= ((!wire15[(1'h0):(1'h0)]) ?
                  reg58[(5'h14):(5'h14)] : (($signed($signed(wire17)) ?
                      $unsigned(reg48[(2'h3):(2'h3)]) : $unsigned((wire15 * wire63))) && {(reg56 | (&wire63))}));
              reg74 <= ($signed($signed($unsigned($signed(wire64)))) - {$unsigned({$signed(reg49),
                      {(8'ha4), reg71}})});
              reg75 <= $signed({$signed(wire67)});
            end
          reg76 <= $unsigned((wire19 ?
              ((&reg48) ?
                  ($unsigned(reg51) ?
                      wire62[(1'h1):(1'h0)] : wire69[(3'h4):(1'h1)]) : ((~reg72) ~^ $signed((8'hab)))) : $unsigned(wire14[(5'h10):(1'h0)])));
          reg77 <= (~^(-((|{wire18}) >> (+$unsigned((7'h40))))));
          reg78 <= $unsigned(($unsigned((~&$unsigned(wire65))) ?
              wire64[(3'h7):(3'h6)] : (8'hb9)));
        end
      else
        begin
          if ($unsigned($unsigned($unsigned(($signed(wire66) ?
              (wire70 ? wire46 : (8'hab)) : $unsigned(wire19))))))
            begin
              reg71 <= $signed(wire67);
              reg72 <= {(reg55[(3'h6):(1'h1)] | reg77)};
              reg73 <= $unsigned(reg55);
              reg74 <= $signed(((^(~&(wire18 ?
                  wire18 : wire14))) - (reg78[(2'h3):(2'h2)] || {(~wire66)})));
              reg75 <= $signed((~&($signed(wire68[(3'h5):(1'h1)]) * ((^wire67) ?
                  wire65[(1'h0):(1'h0)] : $unsigned(reg58)))));
            end
          else
            begin
              reg71 <= (|((^$signed($unsigned(wire66))) ?
                  (~(wire63 < $signed(reg77))) : ((^~$signed((7'h43))) != $signed($unsigned(wire17)))));
              reg72 <= $unsigned($unsigned(wire15));
              reg73 <= reg49;
              reg74 <= $unsigned((8'h9c));
              reg75 <= wire17;
            end
          if ($unsigned($signed($signed(((~^wire65) <= ((8'hb4) ?
              wire61 : reg55))))))
            begin
              reg76 <= $signed(reg55[(3'h4):(1'h1)]);
              reg77 <= (~$signed(reg72[(2'h2):(1'h0)]));
              reg78 <= $signed($signed((~|$unsigned($unsigned(wire69)))));
              reg79 <= $unsigned($unsigned($signed({$signed(wire14),
                  $unsigned(reg74)})));
            end
          else
            begin
              reg76 <= (~((7'h41) ?
                  ({(reg77 <= wire66)} < (wire59[(3'h7):(1'h1)] == reg72[(4'h8):(2'h3)])) : (&(8'hbc))));
              reg77 <= (^reg48[(4'h8):(3'h5)]);
              reg78 <= (reg52[(3'h6):(3'h5)] >= (-(wire60[(5'h12):(5'h12)] >= ($signed(reg51) ?
                  $signed(wire15) : (8'hab)))));
            end
          reg80 <= wire17;
          if ($signed((((reg71 ?
                  {reg49, reg75} : $unsigned((8'hb6))) >> $unsigned(wire64)) ?
              $unsigned(($unsigned(wire66) == wire59)) : (-$unsigned($unsigned(reg76))))))
            begin
              reg81 <= wire62[(3'h4):(2'h2)];
            end
          else
            begin
              reg81 <= ($unsigned({(wire65 >>> (wire68 ? reg77 : wire17)),
                      (reg77 && ((8'ha0) ? wire16 : wire14))}) ?
                  (~({(wire70 ? (8'hb0) : reg71)} ?
                      $unsigned((wire64 ?
                          wire19 : reg71)) : (8'hae))) : (~|((+$signed(reg48)) ?
                      (-reg57) : $unsigned(reg50[(2'h3):(2'h2)]))));
              reg82 <= $unsigned($signed($unsigned((^~$signed(wire14)))));
              reg83 <= wire68[(1'h1):(1'h0)];
            end
        end
    end
  assign wire84 = reg79;
  assign wire85 = $signed((($unsigned(reg79[(3'h5):(3'h4)]) ?
                          (~^wire59) : (~&reg57)) ?
                      (+reg81) : {(&{wire62}), reg72[(2'h2):(1'h0)]}));
  assign wire86 = (reg53[(2'h2):(1'h0)] && wire18);
  assign wire87 = reg72;
  assign wire88 = (~(reg80 < {$signed((+reg81)), reg53}));
endmodule

module module20
#(parameter param44 = (({((8'hb5) ? ((8'hbf) * (8'hbe)) : (^(8'ha9))), (8'had)} ? ((((7'h44) ? (8'hae) : (8'hb1)) << (8'haa)) ? {{(8'had), (7'h41)}} : {((8'hae) ? (8'hbb) : (8'hb0))}) : ((^~((8'ha3) ? (8'ha0) : (8'ha8))) >> (((8'hba) != (8'hb3)) ? ((8'ha2) ^~ (8'hbf)) : ((8'hac) ? (8'hbe) : (8'haf))))) ? (((8'hb2) ? ((^(8'hb9)) > ((8'ha8) * (8'hb0))) : {((8'hab) ? (8'hab) : (8'hb4)), ((8'ha4) == (7'h40))}) - {(((8'hb4) ? (8'hb2) : (7'h40)) >= ((8'hb3) ^~ (8'hbf)))}) : ({((7'h42) ^~ {(8'hbb)})} >>> (((!(8'hb6)) ? {(8'ha7)} : {(8'hb9), (8'h9d)}) ? (((8'h9f) ? (8'ha1) : (8'hb9)) ? (8'hab) : ((8'had) << (8'had))) : (((7'h43) | (8'ha1)) ? (~|(8'had)) : (8'hb6))))), 
parameter param45 = ((^~(8'hba)) ? (((param44 == ((8'ha2) ? param44 : param44)) && {(param44 ? param44 : param44)}) >= (-(param44 ? (param44 << param44) : param44))) : (param44 <<< (param44 ? param44 : {(~|param44), (param44 ? param44 : param44)}))))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire25;
  input wire signed [(5'h12):(1'h0)] wire24;
  input wire signed [(4'hc):(1'h0)] wire23;
  input wire [(4'h9):(1'h0)] wire22;
  input wire [(4'h8):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire43;
  wire signed [(5'h14):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire41;
  wire [(4'h9):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire30;
  wire signed [(2'h3):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire26;
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 (1'h0)};
  assign wire26 = wire24;
  assign wire27 = ({(~|($unsigned(wire26) * (wire21 <<< (8'hb5)))),
                      (!($signed(wire26) + (wire22 ?
                          wire21 : wire26)))} < (wire23[(4'h9):(3'h4)] >= wire25[(1'h0):(1'h0)]));
  assign wire28 = (~$unsigned($unsigned({(wire22 ? wire23 : (7'h44)),
                      wire23})));
  assign wire29 = (~|($unsigned(wire28) <= $unsigned(wire22[(4'h8):(3'h7)])));
  assign wire30 = ((~&wire21[(3'h7):(3'h4)]) ?
                      (^~(&((wire25 ?
                          (7'h42) : wire25) && wire29))) : wire26[(3'h5):(2'h2)]);
  assign wire31 = wire30[(3'h7):(1'h1)];
  assign wire32 = (wire31[(1'h1):(1'h0)] ?
                      $unsigned(wire26) : $unsigned($unsigned((~^(wire24 ?
                          wire26 : wire24)))));
  assign wire33 = (wire24 - $signed((^($signed(wire30) ?
                      (|wire31) : (wire30 | wire25)))));
  assign wire34 = ($signed(({(wire26 ? wire30 : wire23)} ?
                      {wire30} : $unsigned((wire29 ?
                          wire22 : wire31)))) == (8'hb6));
  assign wire35 = wire22;
  assign wire36 = $signed($signed(((|wire21) ?
                      wire21[(2'h3):(2'h3)] : ({wire22,
                          wire31} && (wire25 > (8'hab))))));
  assign wire37 = (&wire21[(1'h1):(1'h1)]);
  assign wire38 = (((7'h44) <= $signed({(wire35 ^ wire27),
                      wire33[(2'h2):(1'h0)]})) != $unsigned(($unsigned($signed((8'h9e))) <= wire24[(2'h3):(1'h0)])));
  assign wire39 = $signed($unsigned(((&(wire26 ?
                      wire36 : (8'hbf))) | wire35[(1'h0):(1'h0)])));
  assign wire40 = $signed($unsigned(wire39[(2'h3):(1'h1)]));
  assign wire41 = {$unsigned($unsigned($unsigned(wire21))),
                      (($signed(wire34) > $signed($unsigned(wire39))) ?
                          (|(~|(wire39 * wire34))) : ({(|wire27),
                              $unsigned(wire21)} >>> wire39))};
  assign wire42 = wire28[(1'h0):(1'h0)];
  assign wire43 = $unsigned((((8'ha5) ~^ wire27) ?
                      (((8'had) | wire36) ?
                          (!{wire34}) : wire35) : {$signed(wire24), wire21}));
endmodule
