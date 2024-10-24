module top
#(parameter param92 = ((((&(8'ha7)) ? {((8'haa) ? (8'h9f) : (8'hb9)), (|(8'hb9))} : ((~|(8'hac)) ? ((8'hb1) ? (8'hb0) : (8'hae)) : ((7'h44) ? (8'ha3) : (8'h9c)))) >>> (~&{((8'ha2) * (8'hb0))})) ? ((({(8'hbe)} ? (!(8'hb3)) : (+(8'hbd))) ? (((8'hb0) ? (8'hac) : (8'hba)) ? {(7'h44)} : (~&(8'hbb))) : {{(8'hb6), (8'hb0)}}) != (~&(^~{(8'ha1), (8'ha5)}))) : ((({(8'had), (8'hbd)} ? (~|(8'hbb)) : (!(7'h40))) != (8'hb3)) ? (^~(((7'h42) ? (8'ha8) : (8'hac)) ? (-(8'hb2)) : ((8'ha8) ? (8'ha6) : (8'ha4)))) : (~(((8'hb8) ? (8'ha7) : (8'hbf)) ? ((8'haa) * (8'hb3)) : ((8'hbc) ? (8'hb1) : (8'ha7)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire87;
  wire [(5'h15):(1'h0)] wire86;
  wire signed [(4'h9):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire83;
  wire signed [(5'h13):(1'h0)] wire75;
  wire [(5'h10):(1'h0)] wire74;
  wire [(4'h9):(1'h0)] wire72;
  reg [(5'h10):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(4'h9):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire75,
                 wire74,
                 wire72,
                 reg91,
                 reg90,
                 reg89,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  module5 #() modinst73 (wire72, clk, wire2, wire3, wire1, wire4);
  assign wire74 = $unsigned(((wire2 ?
                      wire0 : $unsigned(wire2[(1'h1):(1'h1)])) <= (wire1 <<< $unsigned((wire4 ?
                      wire3 : wire72)))));
  assign wire75 = {(~(wire2 & ((|wire72) * $unsigned(wire1))))};
  always
    @(posedge clk) begin
      reg76 <= wire2;
      if ((((+$unsigned(((8'hb1) && wire74))) + (|wire75)) + wire74))
        begin
          if ({($signed(($unsigned(wire75) ^ wire72[(3'h4):(1'h1)])) ?
                  reg76[(4'h9):(1'h1)] : $signed((!$signed(wire1)))),
              (reg76[(1'h1):(1'h0)] ?
                  ((~wire75) ?
                      (!(-wire0)) : ((wire0 & (8'h9f)) & wire3)) : (wire0[(4'hc):(4'ha)] <<< $signed((wire1 ~^ wire75))))})
            begin
              reg77 <= (wire3 ?
                  ($signed($signed((wire74 ? (8'h9c) : reg76))) ?
                      wire3 : $unsigned((~^(^~wire74)))) : (-wire1[(4'h8):(1'h1)]));
            end
          else
            begin
              reg77 <= $signed((-wire1[(3'h5):(2'h3)]));
            end
          if (wire72[(3'h5):(1'h1)])
            begin
              reg78 <= wire3;
              reg79 <= {({wire0} ? wire1 : (!{(-wire74)}))};
              reg80 <= wire74[(4'h9):(4'h8)];
              reg81 <= (8'hae);
            end
          else
            begin
              reg78 <= wire4;
            end
        end
      else
        begin
          reg77 <= ({reg80} ?
              ($unsigned(wire1) ?
                  $unsigned(wire2) : (({reg77} ?
                      reg77 : (~|(8'ha2))) <<< $unsigned($unsigned((8'hb5))))) : (|$unsigned({$signed(wire3)})));
        end
      reg82 <= $unsigned($signed((((~&reg78) ?
          $signed(wire2) : (&reg78)) < $unsigned((~&reg76)))));
    end
  assign wire83 = reg82;
  assign wire84 = $unsigned($unsigned(($unsigned($unsigned(reg78)) - ((reg78 | wire83) ?
                      wire2[(4'hc):(4'hb)] : reg77))));
  assign wire85 = ($unsigned({wire83[(2'h2):(1'h1)]}) ?
                      (wire72[(3'h5):(1'h0)] ?
                          ((+(wire72 ? (8'hb5) : reg79)) ?
                              ((~&(7'h44)) ?
                                  $signed(reg80) : (wire2 ?
                                      wire84 : wire84)) : $signed((reg80 ?
                                  wire4 : reg80))) : reg78) : reg80);
  assign wire86 = $signed((($unsigned(reg77) ?
                      reg78[(2'h3):(1'h0)] : (~|{wire72,
                          (8'h9f)})) >= $unsigned((~&(reg78 + wire1)))));
  assign wire87 = $unsigned(((~|({wire72} ?
                          (wire83 ? reg76 : wire72) : wire2)) ?
                      $signed(((wire86 * wire72) ?
                          $unsigned(wire0) : (reg81 ?
                              reg76 : reg76))) : (~^{{wire3, (8'h9d)},
                          {(7'h42), wire75}})));
  assign wire88 = $unsigned(reg79);
  always
    @(posedge clk) begin
      reg89 <= {{(&$unsigned(wire3)), reg81}, wire74};
      reg90 <= wire84;
      reg91 <= (reg77[(4'h8):(1'h0)] != wire0);
    end
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire6;
  input wire [(4'h9):(1'h0)] wire7;
  input wire signed [(3'h5):(1'h0)] wire8;
  input wire signed [(3'h7):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire71;
  wire signed [(4'he):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire69;
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  assign y = {wire71,
                 wire10,
                 wire14,
                 wire15,
                 wire69,
                 reg11,
                 reg12,
                 reg13,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire10 = {$signed(({(wire8 ? wire8 : wire6)} ?
                          wire6 : (-$unsigned(wire8)))),
                      wire6};
  always
    @(posedge clk) begin
      reg11 <= {wire10, wire6[(2'h2):(1'h1)]};
      reg12 <= $signed((~|{reg11, $signed(wire8[(2'h3):(1'h1)])}));
      reg13 <= (^reg12);
    end
  assign wire14 = {{$signed($signed($signed(reg11))),
                          (reg12[(4'hb):(2'h2)] ? (~&{wire6, wire7}) : reg13)}};
  assign wire15 = reg13;
  always
    @(posedge clk) begin
      reg16 <= (wire6 ?
          wire8 : (({((8'hb2) ? reg12 : wire6),
              wire9[(1'h0):(1'h0)]} ^~ ({wire6,
              (8'ha7)} ~^ {reg13})) ^ (((^(8'hb1)) ^~ $signed(wire8)) < $signed({wire10,
              (7'h44)}))));
      reg17 <= wire8;
    end
  module18 #() modinst70 (.wire22(wire9), .clk(clk), .wire21(reg17), .wire19(reg16), .y(wire69), .wire20(reg12));
  assign wire71 = wire69[(1'h1):(1'h0)];
endmodule

module module18
#(parameter param68 = (7'h40))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h200):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire22;
  input wire [(4'he):(1'h0)] wire21;
  input wire [(5'h15):(1'h0)] wire20;
  input wire signed [(4'hb):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire67;
  wire signed [(5'h12):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire63;
  wire signed [(3'h7):(1'h0)] wire62;
  wire signed [(4'hc):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire25;
  wire signed [(4'h8):(1'h0)] wire24;
  wire [(4'hb):(1'h0)] wire23;
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire63,
                 wire62,
                 wire35,
                 wire34,
                 wire33,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg64,
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
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire23 = wire20;
  assign wire24 = ({((|$signed(wire19)) ?
                              ((wire19 ? (8'ha6) : wire21) & ((8'ha8) ?
                                  wire19 : wire23)) : ((wire19 ?
                                      wire22 : wire23) ?
                                  $unsigned(wire23) : $unsigned(wire22)))} ?
                      (^~(($unsigned(wire23) ? (~(8'hae)) : $signed(wire21)) ?
                          $signed((wire23 ?
                              wire22 : wire22)) : $unsigned($unsigned((8'hb6))))) : (!(wire23[(4'h9):(1'h0)] <= (^~(wire23 ?
                          wire19 : wire23)))));
  assign wire25 = ((^~({wire24[(1'h1):(1'h1)]} ?
                      wire19 : ($unsigned((8'haa)) - $unsigned(wire21)))) >>> (~^$signed(((wire24 ^ wire19) ?
                      (wire22 <= wire20) : wire24))));
  assign wire26 = $signed(wire24);
  always
    @(posedge clk) begin
      reg27 <= {({wire19} ? wire23 : $unsigned((^~wire25)))};
      if (((~wire24[(3'h6):(2'h2)]) ?
          {$unsigned((wire25 ?
                  $signed(wire25) : (wire25 ?
                      wire20 : wire20)))} : (|wire26[(4'hc):(2'h3)])))
        begin
          reg28 <= ((wire24[(4'h8):(3'h4)] ^ wire25[(2'h3):(2'h2)]) >> ($signed($signed($signed(wire21))) ?
              $unsigned($signed((wire25 <<< (8'hb6)))) : ((~wire21) || reg27[(1'h0):(1'h0)])));
          reg29 <= ((8'h9c) ^~ $signed({wire22, $unsigned(wire19)}));
        end
      else
        begin
          reg28 <= wire25;
          reg29 <= reg29[(3'h6):(2'h3)];
          reg30 <= $unsigned($unsigned(wire20));
          reg31 <= wire22[(3'h5):(2'h3)];
        end
      reg32 <= (wire26[(4'hf):(4'hf)] ? (8'haf) : reg28);
    end
  assign wire33 = reg27;
  assign wire34 = ($unsigned(({wire19, $signed(reg32)} ?
                      $unsigned({wire22,
                          reg31}) : reg30)) & $signed({(~|(wire24 + wire21)),
                      wire25[(4'h9):(3'h5)]}));
  assign wire35 = reg27[(4'he):(4'hb)];
  always
    @(posedge clk) begin
      if (((~|(((~^reg27) ?
              (reg29 ? (8'hbf) : reg29) : (wire25 ?
                  wire22 : reg27)) - wire35)) ?
          $unsigned(wire35[(3'h6):(2'h2)]) : (~^{reg29[(3'h5):(1'h1)]})))
        begin
          if ($signed($signed(reg30[(1'h1):(1'h0)])))
            begin
              reg36 <= $unsigned(wire23[(1'h0):(1'h0)]);
            end
          else
            begin
              reg36 <= wire26[(4'hd):(3'h4)];
              reg37 <= (wire35 + (~&$signed($signed({reg28, wire33}))));
              reg38 <= $signed((~^((^~(!wire19)) ?
                  (wire25[(1'h0):(1'h0)] + (reg37 ~^ wire25)) : ($unsigned(reg28) <<< wire24))));
              reg39 <= $signed((^~((&$signed(reg32)) & (^~(|(7'h41))))));
            end
          if ({{wire21}})
            begin
              reg40 <= (~|($signed(((wire19 ? wire34 : (8'ha1)) ?
                  $signed(wire34) : (wire22 >= wire35))) >= (^reg28)));
              reg41 <= (wire24 ?
                  (wire23 ^~ (reg27[(5'h12):(4'hf)] ?
                      {{(8'ha5), reg29},
                          (~&wire19)} : wire21[(3'h7):(3'h7)])) : ((((reg31 ?
                          wire34 : (8'hb0)) >= (wire25 > wire35)) == (!(wire25 ?
                          wire25 : reg30))) ?
                      {{(wire19 ^ wire24),
                              $signed(wire34)}} : $unsigned(reg27[(3'h4):(1'h1)])));
              reg42 <= $signed(($unsigned($unsigned((wire20 ?
                  reg30 : wire26))) == (reg29[(1'h0):(1'h0)] ?
                  $unsigned((wire25 ? wire21 : reg38)) : (reg41[(3'h4):(2'h3)] ?
                      $signed(reg39) : $unsigned(wire34)))));
              reg43 <= $unsigned((wire23[(3'h6):(2'h2)] << $signed($unsigned(wire24))));
            end
          else
            begin
              reg40 <= (~(~^$unsigned((+(~|reg43)))));
              reg41 <= $unsigned((~^reg38[(1'h0):(1'h0)]));
            end
        end
      else
        begin
          if ($signed((((~|{reg27,
              wire35}) ^ $signed(wire34[(2'h3):(1'h0)])) < (((~&wire25) ?
                  (reg37 ? reg41 : (8'h9f)) : wire35[(2'h3):(1'h1)]) ?
              $unsigned((wire34 ? (8'ha7) : (8'hbb))) : ($signed(reg30) ?
                  (wire34 ? (8'hbd) : reg38) : $unsigned(wire20))))))
            begin
              reg36 <= (((^~wire19) < wire34[(2'h3):(1'h0)]) ?
                  ((+$signed((~^reg38))) == (^$signed((reg40 * reg38)))) : $unsigned((!reg29)));
              reg37 <= reg30;
              reg38 <= (reg32[(5'h11):(2'h3)] + (wire23 ^~ {$signed($unsigned(wire21))}));
              reg39 <= $signed(((((8'hb3) || reg29) & ((reg32 ?
                      reg38 : wire25) ?
                  (reg36 ?
                      reg29 : reg41) : $signed(wire20))) + {reg27[(4'h9):(2'h3)],
                  (~^(&reg31))}));
            end
          else
            begin
              reg36 <= reg39[(4'hc):(4'hc)];
              reg37 <= reg31[(2'h2):(2'h2)];
              reg38 <= $unsigned(wire20[(3'h7):(3'h5)]);
              reg39 <= (&wire19[(4'h8):(1'h0)]);
              reg40 <= (^~$unsigned(({$unsigned(wire25),
                  $signed(reg38)} ^~ wire34[(1'h1):(1'h1)])));
            end
          reg41 <= reg29;
          reg42 <= $signed((8'hb7));
          reg43 <= (+reg30);
          reg44 <= (&$signed(reg43));
        end
      reg45 <= $signed($unsigned($signed(reg42)));
      reg46 <= (reg44[(1'h1):(1'h1)] ^~ (+wire26));
      reg47 <= ((^({((8'hbf) >> reg46)} ?
              reg38[(4'hd):(2'h3)] : reg39[(3'h5):(1'h0)])) ?
          wire34[(1'h0):(1'h0)] : (^~reg40));
      reg48 <= ($unsigned(({wire21[(4'hd):(1'h1)],
              wire20[(5'h13):(2'h3)]} >>> {(reg38 - reg32),
              $signed((8'hb3))})) ?
          $unsigned(reg47) : reg43[(3'h6):(3'h4)]);
    end
  always
    @(posedge clk) begin
      if ((reg42 ?
          (((~|$signed(reg41)) <<< ((wire22 ? reg27 : (8'hb3)) ?
                  (reg43 ? reg27 : reg30) : (wire20 >= wire33))) ?
              $signed(reg28[(1'h1):(1'h0)]) : wire35[(1'h1):(1'h1)]) : $unsigned(((reg27 ?
                  wire22[(2'h3):(1'h0)] : (~|reg42)) ?
              $signed($unsigned(reg44)) : {$signed((8'hb5)),
                  (reg31 ? reg40 : wire23)}))))
        begin
          reg49 <= ((~^wire25) ?
              ((~(~reg38[(2'h2):(1'h1)])) && (8'hae)) : (8'ha3));
          if ((!(-($signed(((8'h9f) ? wire35 : reg49)) ?
              reg47[(4'h8):(4'h8)] : ({(8'h9f)} <<< {reg37})))))
            begin
              reg50 <= (&(8'hae));
            end
          else
            begin
              reg50 <= ($unsigned((({reg46} ?
                      (reg30 >> reg42) : $signed((8'hba))) - $unsigned(reg47[(3'h5):(3'h5)]))) ?
                  $signed(reg46) : reg30[(2'h3):(2'h2)]);
              reg51 <= reg32;
              reg52 <= $unsigned(((~&reg50[(4'ha):(4'h9)]) - (8'hb5)));
              reg53 <= ((^~(reg39[(2'h3):(2'h3)] ?
                  reg36[(2'h2):(1'h1)] : ((reg36 ?
                      (8'ha0) : reg37) >= (reg39 >>> reg29)))) == $unsigned((~^$signed(wire34))));
            end
          if ($unsigned($signed(($unsigned((^~reg36)) ?
              wire35 : $unsigned($signed(reg48))))))
            begin
              reg54 <= reg51;
              reg55 <= reg27;
              reg56 <= (wire22 != (8'hae));
              reg57 <= {((+$unsigned((reg32 | wire35))) - (8'ha8)),
                  (wire21 ? (|reg37) : (8'h9c))};
              reg58 <= reg39;
            end
          else
            begin
              reg54 <= wire33;
              reg55 <= reg54[(4'h8):(3'h6)];
              reg56 <= reg31[(4'hb):(1'h0)];
              reg57 <= (!reg27[(4'ha):(3'h4)]);
              reg58 <= (~|reg50[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          if (({reg45} ?
              ((!wire34) ?
                  reg36 : $signed($unsigned(reg51[(2'h3):(2'h3)]))) : $unsigned(reg41)))
            begin
              reg49 <= reg50[(3'h4):(1'h1)];
            end
          else
            begin
              reg49 <= wire23[(1'h1):(1'h1)];
              reg50 <= ((wire22 ?
                  ($unsigned((!reg28)) + ($signed(reg47) >>> $unsigned(wire24))) : $unsigned(((~wire21) > {(8'hb6)}))) ~^ ((wire24 != (^(~reg40))) << reg56));
            end
        end
      reg59 <= ((wire35 ?
          (reg43 ?
              ((reg36 ^~ reg32) ^~ $unsigned((8'hb3))) : $unsigned((^reg39))) : (^~(reg28[(2'h3):(1'h1)] ?
              reg38[(2'h2):(2'h2)] : reg49))) >= (&(~|(^~(wire20 ?
          reg57 : wire24)))));
      reg60 <= ($unsigned(wire21[(4'ha):(2'h2)]) <<< $unsigned((+($signed(reg54) ?
          $unsigned(wire19) : reg54))));
      reg61 <= (&wire33[(4'hc):(1'h1)]);
    end
  assign wire62 = $unsigned((|(~&(^reg56[(2'h3):(2'h3)]))));
  assign wire63 = (-(reg51[(1'h1):(1'h1)] * $unsigned($unsigned($signed(reg45)))));
  always
    @(posedge clk) begin
      reg64 <= reg55;
    end
  assign wire65 = $signed(wire35[(1'h0):(1'h0)]);
  assign wire66 = ((-($unsigned((~&reg37)) ? reg51 : (|$signed(reg43)))) ?
                      {(reg41 ?
                              ($unsigned(reg37) <= ((8'ha7) <= reg31)) : reg42[(2'h3):(2'h3)]),
                          $unsigned(wire22[(3'h5):(1'h0)])} : $unsigned((+$signed((|(8'h9f))))));
  assign wire67 = wire25;
endmodule
