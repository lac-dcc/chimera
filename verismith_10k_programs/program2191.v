module top
#(parameter param86 = (!(((&(~(8'hac))) - (((8'ha6) ? (8'hb0) : (8'hb3)) >>> (~(7'h41)))) << (8'ha4))), 
parameter param87 = (-(param86 << ((&(8'had)) ? param86 : param86))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire85;
  wire [(3'h6):(1'h0)] wire84;
  wire [(4'hb):(1'h0)] wire81;
  wire [(3'h4):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire79;
  wire signed [(4'hd):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(3'h5):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire73;
  wire [(4'hb):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire67;
  reg signed [(4'ha):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire5,
                 wire6,
                 wire7,
                 wire67,
                 reg83,
                 reg82,
                 (1'h0)};
  assign wire5 = (!{(~&$unsigned(wire0[(2'h2):(1'h0)])),
                     $unsigned(((&wire2) >> (wire0 ? wire4 : wire3)))});
  assign wire6 = ({$unsigned(wire2), $signed($unsigned((wire1 ^~ wire5)))} ?
                     (&$unsigned(wire4[(1'h1):(1'h1)])) : {($signed(((8'ha6) ?
                             wire0 : wire2)) || $signed(wire5)),
                         (wire1[(4'he):(2'h2)] ~^ wire1[(4'h8):(1'h1)])});
  assign wire7 = {(~(wire1 ? (8'haa) : (-$signed(wire5)))),
                     $unsigned(((~&(&wire1)) <= (wire0 ^~ (8'ha7))))};
  module8 #() modinst68 (.wire9(wire4), .clk(clk), .y(wire67), .wire10(wire6), .wire12(wire3), .wire11(wire5), .wire13(wire7));
  assign wire69 = wire0;
  assign wire70 = {$unsigned(($unsigned($signed((8'hb6))) ^ wire67)), (^wire4)};
  assign wire71 = wire70[(4'he):(4'h8)];
  assign wire72 = {(((^~wire7) >= wire70) ?
                          (wire4[(1'h1):(1'h0)] ?
                              $signed($signed(wire3)) : {{(8'h9f), wire71},
                                  (wire4 + wire2)}) : (~|(7'h43))),
                      $signed({({wire0} ? wire3[(2'h3):(1'h0)] : (&(8'hbb)))})};
  assign wire73 = $unsigned($signed(wire2));
  assign wire74 = ({(((wire7 ? (8'hb1) : (8'hb7)) ^ (~wire73)) || {(!wire0)})} ?
                      wire1[(2'h2):(2'h2)] : wire1[(2'h3):(1'h0)]);
  assign wire75 = (($unsigned((~^{wire3, wire67})) != ((&wire73) ?
                      (!(~wire1)) : (^wire73[(4'he):(3'h6)]))) | (8'hb2));
  assign wire76 = (|($signed($unsigned($unsigned(wire73))) != $unsigned(wire70[(3'h5):(2'h3)])));
  assign wire77 = $signed(wire69[(3'h7):(2'h2)]);
  assign wire78 = (wire0[(1'h1):(1'h1)] ?
                      ({wire69} > $signed($signed($signed(wire1)))) : (($signed(wire77) ?
                          $unsigned((wire3 ^~ wire1)) : $signed($signed(wire74))) || ((wire3 <= $unsigned((8'h9f))) ?
                          wire5 : (&$unsigned(wire1)))));
  assign wire79 = (wire77 ?
                      $signed($unsigned(wire2[(2'h2):(2'h2)])) : (~|(wire3[(4'hb):(1'h1)] ?
                          $signed((wire0 ?
                              wire0 : wire3)) : $unsigned(wire73[(3'h5):(3'h4)]))));
  assign wire80 = $unsigned({wire0[(1'h1):(1'h1)]});
  assign wire81 = $unsigned(wire77[(4'hf):(1'h1)]);
  always
    @(posedge clk) begin
      reg82 <= {($unsigned(((wire4 ? wire7 : (8'hae)) ?
                  wire0 : $signed((8'hae)))) ?
              (~(8'ha2)) : (|((wire3 ? wire80 : wire71) ?
                  {wire79} : (wire7 ~^ (8'hb2))))),
          wire4[(4'hc):(2'h3)]};
      reg83 <= $unsigned(wire79);
    end
  assign wire84 = $unsigned($unsigned($unsigned(wire7[(5'h12):(4'he)])));
  assign wire85 = (7'h40);
endmodule

module module8
#(parameter param66 = {((-(((8'hbe) << (8'hbd)) ? ((8'hbc) ? (8'hac) : (8'ha3)) : ((7'h40) ? (8'hb3) : (8'had)))) ? (8'hb8) : ((!((8'hae) & (8'ha8))) ? (((8'hb1) && (8'ha4)) ? ((7'h43) != (8'h9c)) : ((8'hae) ? (8'hbc) : (7'h40))) : (&((8'ha1) ? (8'ha4) : (8'hb4)))))})
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire13;
  input wire [(4'h8):(1'h0)] wire12;
  input wire signed [(4'hb):(1'h0)] wire11;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire [(4'hc):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire65;
  wire [(4'h8):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire14;
  assign y = {wire65,
                 wire63,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 (1'h0)};
  assign wire14 = (wire9 - wire12);
  assign wire15 = (~^$signed($unsigned($unsigned((wire12 ? wire10 : wire9)))));
  assign wire16 = wire13;
  assign wire17 = $signed((wire13 ?
                      ((~&$signed(wire11)) ^~ (~^(wire12 + wire11))) : ($unsigned(wire13[(1'h0):(1'h0)]) == ({wire13,
                              wire14} ?
                          (wire14 - wire11) : $unsigned(wire15)))));
  assign wire18 = ($signed(wire17) ?
                      ((^$unsigned($signed(wire9))) || (($signed(wire12) ?
                              (~(8'ha5)) : {wire9, wire11}) ?
                          $unsigned((wire11 >> wire12)) : $signed(wire13[(5'h12):(4'h8)]))) : wire17[(1'h0):(1'h0)]);
  assign wire19 = $signed(($signed($unsigned($signed(wire18))) & ($unsigned((wire15 ?
                      wire12 : (8'h9c))) < wire15)));
  module20 #() modinst64 (.wire21(wire10), .wire23(wire13), .clk(clk), .wire24(wire12), .y(wire63), .wire22(wire15));
  assign wire65 = ((wire12 & $signed($signed((8'hb3)))) ~^ $signed(((-((8'hb4) ?
                          wire63 : wire12)) ?
                      (~^(~&wire10)) : wire19)));
endmodule

module module20
#(parameter param62 = (+(((~^((8'haa) == (8'hbb))) < (|((8'haf) ^ (8'ha8)))) ~^ (|(((8'h9e) >> (7'h43)) <= {(8'ha0), (8'hbb)})))))
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h1d1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire24;
  input wire signed [(5'h14):(1'h0)] wire23;
  input wire [(5'h15):(1'h0)] wire22;
  input wire signed [(4'hf):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire48;
  wire signed [(4'he):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire30;
  wire signed [(4'h9):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire48,
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
                 wire25,
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
                 (1'h0)};
  assign wire25 = ({(~^(-$signed(wire21))),
                      ($unsigned((wire24 * wire23)) ?
                          $unsigned($signed(wire24)) : (~|(8'h9c)))} * $unsigned(wire21[(4'hd):(4'h9)]));
  assign wire26 = $signed($unsigned((wire23[(5'h13):(5'h10)] ?
                      wire25 : ($signed(wire21) ?
                          wire25[(3'h4):(3'h4)] : wire22))));
  assign wire27 = $signed((wire25[(3'h4):(1'h1)] ? (+{(!wire22)}) : wire25));
  assign wire28 = wire25[(2'h3):(2'h2)];
  assign wire29 = ((wire28[(4'h8):(3'h6)] ?
                      ((8'hae) ? wire26 : wire27) : ($unsigned((wire23 ?
                              wire28 : wire28)) ?
                          $unsigned($signed(wire23)) : wire22[(4'hd):(4'hb)])) * (($unsigned(wire28) || wire27) | ({(~^wire23)} ?
                      ((wire24 ? wire28 : wire24) ?
                          $unsigned((8'had)) : {wire23,
                              wire25}) : $unsigned((wire21 < wire22)))));
  assign wire30 = (|$signed({wire23, (+wire27[(4'h9):(2'h3)])}));
  assign wire31 = $signed((wire22[(5'h13):(1'h0)] ?
                      ((wire27 ?
                          wire23 : wire23[(5'h10):(2'h2)]) <<< wire27[(4'hb):(2'h3)]) : wire25[(1'h1):(1'h1)]));
  assign wire32 = {$unsigned((~&wire25))};
  assign wire33 = ((((8'hab) ^ ((wire22 ^ wire26) + wire32[(4'hc):(3'h7)])) <<< wire21[(2'h2):(1'h0)]) <= wire26[(4'hb):(3'h7)]);
  assign wire34 = ($signed((~|(^$signed(wire29)))) >= $unsigned(((~|wire29) == ($unsigned(wire23) == (wire21 && wire26)))));
  assign wire35 = ((^(|wire24[(3'h6):(2'h2)])) != (8'hba));
  assign wire36 = ($signed(wire35) + $signed((^~($unsigned(wire35) ^~ (wire21 ^~ (8'hab))))));
  always
    @(posedge clk) begin
      reg37 <= wire24;
      reg38 <= $signed(wire24);
      reg39 <= (!($unsigned(wire29[(3'h4):(1'h1)]) ?
          $signed((^$signed(wire26))) : reg37));
      if (($signed(wire22) ?
          ($unsigned($signed((~|wire34))) ?
              ($unsigned(reg37) ?
                  $unsigned({wire26, wire25}) : ((reg37 ? reg38 : wire25) ?
                      (wire30 || wire36) : $unsigned(wire26))) : (8'hab)) : (($unsigned($unsigned(wire21)) <<< wire36) * wire27[(3'h4):(2'h3)])))
        begin
          reg40 <= $signed((((((8'hbd) >= wire28) > $unsigned(wire32)) ~^ $signed(wire32[(1'h0):(1'h0)])) ?
              $signed(wire32) : ($unsigned(((7'h41) * wire23)) <<< $unsigned(wire21))));
          reg41 <= (^~{$signed(((8'hac) + wire36[(1'h1):(1'h0)])),
              (((reg38 >= wire23) || (wire33 ? (7'h44) : wire21)) ^~ (8'hbc))});
          if ($signed($unsigned(wire25[(4'h9):(1'h1)])))
            begin
              reg42 <= $signed({wire24[(3'h4):(2'h2)],
                  ((reg37[(4'hc):(2'h3)] ^ (8'hb9)) < ((wire24 ~^ wire36) == (wire34 - wire21)))});
              reg43 <= ((reg39 || ({reg40} >= reg39[(2'h2):(1'h0)])) ?
                  $signed(reg39) : $unsigned(reg38[(2'h3):(2'h2)]));
              reg44 <= wire27[(4'ha):(1'h1)];
              reg45 <= $unsigned($unsigned((reg44 ?
                  wire29 : (reg42 >> (wire34 ? reg37 : wire35)))));
            end
          else
            begin
              reg42 <= wire21[(3'h7):(3'h5)];
            end
        end
      else
        begin
          reg40 <= wire31[(2'h3):(2'h2)];
        end
      if ({{wire21,
              (wire36 ? $unsigned(wire34[(2'h3):(2'h3)]) : $unsigned((7'h44)))},
          $unsigned($unsigned(((+wire34) ?
              wire27[(1'h0):(1'h0)] : $signed(wire21))))})
        begin
          reg46 <= $unsigned((^$unsigned($unsigned($unsigned(reg40)))));
        end
      else
        begin
          reg46 <= $signed((($unsigned((wire29 < wire34)) ?
                  ((!wire32) || (8'ha6)) : (wire35 * {wire31})) ?
              {$unsigned({reg45, reg42}),
                  $unsigned((reg43 ?
                      wire34 : wire22))} : $signed($unsigned(wire25))));
          reg47 <= {$signed(reg39[(2'h2):(2'h2)]), reg44};
        end
    end
  assign wire48 = {(wire31 >>> (wire32 >>> ((wire33 != wire32) || $signed(wire32)))),
                      (wire32[(3'h4):(2'h2)] <= $unsigned(($signed(reg42) ?
                          $signed(reg39) : $signed(reg39))))};
  always
    @(posedge clk) begin
      reg49 <= $unsigned($unsigned(reg45));
      reg50 <= ($unsigned(((&(wire24 ?
              (8'hbf) : wire30)) < ((8'ha6) < reg39[(2'h3):(2'h3)]))) ?
          $signed(($unsigned(wire31) ?
              ((wire29 < reg40) ?
                  reg37[(2'h2):(1'h0)] : {wire26,
                      wire26}) : (reg49[(2'h2):(1'h0)] || (wire29 << wire21)))) : $unsigned((~|wire35[(4'hb):(4'ha)])));
      if ($signed($signed($signed(wire29[(3'h5):(2'h2)]))))
        begin
          reg51 <= wire32[(2'h2):(2'h2)];
          reg52 <= (!$unsigned((((reg44 >>> (8'hbc)) && $signed(reg42)) ?
              (~^(wire31 ~^ wire26)) : $unsigned($unsigned(reg50)))));
          reg53 <= (wire30 ?
              (~&(&$unsigned($unsigned(reg40)))) : $unsigned((wire29[(3'h4):(1'h0)] <= (wire25 ^~ (wire36 ?
                  wire28 : wire36)))));
          reg54 <= (^(({(reg49 << reg43), (reg38 ? reg39 : reg51)} ?
              (^(reg42 < reg50)) : {(reg44 || wire22)}) > $unsigned($unsigned((reg53 ?
              reg43 : reg46)))));
          if ({(8'ha6), ((~^reg49) >= (8'ha5))})
            begin
              reg55 <= wire25[(3'h5):(2'h3)];
              reg56 <= {$signed(wire48)};
              reg57 <= wire24;
            end
          else
            begin
              reg55 <= reg54;
              reg56 <= $unsigned((~(($unsigned(wire26) >> (~|reg57)) < ($unsigned(reg57) ?
                  $signed(wire24) : $signed(reg37)))));
              reg57 <= $unsigned(reg46[(1'h1):(1'h0)]);
              reg58 <= (-(($signed(reg42) <= wire23[(4'he):(4'ha)]) ~^ $signed(reg57)));
            end
        end
      else
        begin
          reg51 <= (wire22 * reg41);
          reg52 <= reg44[(3'h5):(1'h1)];
          reg53 <= {($signed(($unsigned(reg41) - (~^reg38))) ?
                  $unsigned(wire48) : ((^~wire21[(4'hc):(2'h2)]) >> $unsigned((wire21 || wire21))))};
          reg54 <= (({{reg52[(2'h3):(2'h3)], (reg37 == wire30)},
              (wire34[(5'h14):(4'hd)] - $unsigned(wire48))} + ($unsigned((!wire30)) ?
              wire23[(4'h9):(4'h8)] : (reg37 == (reg53 * wire27)))) >> $unsigned($signed(($signed(reg41) != (reg56 ?
              (8'hb6) : reg42)))));
          reg55 <= $unsigned(wire30);
        end
    end
  assign wire59 = (7'h40);
  assign wire60 = reg39;
  assign wire61 = (8'ha5);
endmodule
