module top
#(parameter param81 = (8'had), 
parameter param82 = ((param81 && (((param81 < param81) ? (~|param81) : (~^param81)) ^ (!(param81 ? param81 : param81)))) ? ({(~(8'hb0)), ((|(8'hbd)) ~^ (~&param81))} ? ((+{param81, param81}) <<< param81) : (-param81)) : {((param81 + (param81 >= param81)) ? param81 : param81)}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire79;
  wire signed [(4'hd):(1'h0)] wire78;
  wire signed [(4'h8):(1'h0)] wire77;
  wire signed [(2'h3):(1'h0)] wire4;
  wire signed [(4'hb):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire75;
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire75,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = (+(wire3[(4'ha):(1'h1)] * $signed((wire4 <<< wire4[(2'h2):(2'h2)]))));
  assign wire6 = (~^$signed((($signed(wire3) ?
                     wire2 : $unsigned(wire5)) == ($signed((8'ha5)) >>> (wire0 & wire3)))));
  assign wire7 = $unsigned(($unsigned((wire5[(3'h5):(2'h2)] != (wire5 < wire2))) + $unsigned($unsigned(wire2))));
  module8 #() modinst76 (wire75, clk, wire6, wire1, wire5, wire0, wire3);
  assign wire77 = wire1;
  assign wire78 = wire4[(1'h0):(1'h0)];
  assign wire79 = ((~|{wire1}) >= (wire78 ?
                      {({wire5} ? wire6[(1'h1):(1'h1)] : (wire1 & wire78)),
                          ((^~wire0) ?
                              (wire78 ?
                                  wire4 : wire1) : (wire78 <<< wire3))} : $unsigned({(|wire2)})));
  assign wire80 = ((($unsigned(wire2[(2'h2):(1'h1)]) ?
                          wire5[(3'h6):(3'h5)] : (wire78[(4'ha):(4'h9)] ?
                              (wire79 * wire1) : {wire0})) ?
                      wire7[(4'h8):(2'h3)] : $unsigned((~|(wire78 ?
                          wire1 : wire7)))) ^ {{{wire75}, {wire6}}});
endmodule

module module8  (y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire13;
  input wire signed [(3'h5):(1'h0)] wire12;
  input wire [(4'h9):(1'h0)] wire11;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire [(4'hc):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire74;
  wire signed [(4'h8):(1'h0)] wire73;
  wire signed [(3'h4):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire71;
  wire [(3'h6):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire65;
  wire [(4'h8):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire68,
                 wire67,
                 wire65,
                 wire26,
                 wire15,
                 wire14,
                 reg69,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire14 = $unsigned((wire9 ?
                      $signed(($unsigned(wire13) || (wire12 != wire11))) : $unsigned((~^((8'haf) ?
                          wire13 : wire9)))));
  assign wire15 = ((~$signed(wire13[(1'h1):(1'h0)])) > $unsigned(wire14));
  always
    @(posedge clk) begin
      reg16 <= $unsigned(((wire10[(4'he):(3'h6)] <<< $unsigned(wire11[(2'h2):(2'h2)])) == $unsigned(((wire9 >= wire9) ?
          wire15 : (wire13 ? (8'haa) : wire9)))));
      if (((~|{$signed(((8'ha9) <<< wire12)),
          wire9[(4'hb):(1'h1)]}) >= (~wire10)))
        begin
          reg17 <= $unsigned((wire12 == wire9[(1'h1):(1'h1)]));
          if ($signed((~^(|$signed(reg16)))))
            begin
              reg18 <= (($unsigned(((~^(7'h41)) >>> {reg17})) || wire9[(4'hc):(3'h7)]) << reg16[(2'h2):(1'h1)]);
              reg19 <= $unsigned(((wire9[(3'h5):(1'h1)] != ($unsigned((8'hac)) ?
                  (reg17 + wire11) : $signed(wire14))) < wire9));
              reg20 <= $signed($unsigned({(8'hb9)}));
              reg21 <= ($signed({($unsigned(wire15) ?
                          (~|(8'hac)) : $signed(reg19)),
                      (&wire14)}) ?
                  reg20[(1'h0):(1'h0)] : $signed(reg17));
            end
          else
            begin
              reg18 <= {($unsigned((^{wire13})) ?
                      $unsigned(wire10[(4'he):(4'hb)]) : reg18[(1'h0):(1'h0)]),
                  $unsigned(wire14)};
            end
          reg22 <= wire11[(2'h2):(1'h0)];
          reg23 <= $unsigned((&{$signed($unsigned(reg21))}));
        end
      else
        begin
          reg17 <= $signed(($signed($unsigned(reg18)) ?
              (((wire10 ? wire15 : reg18) ?
                  wire12[(1'h0):(1'h0)] : (8'hab)) == wire14[(3'h6):(2'h3)]) : $signed({(wire12 ^ reg16),
                  (wire14 ? wire13 : (7'h41))})));
          reg18 <= $signed(reg22[(3'h4):(1'h1)]);
          reg19 <= $unsigned(((reg22 ?
                  wire10 : (reg16 ? (-wire13) : $signed(reg20))) ?
              wire14 : reg22));
          if (wire15[(4'he):(2'h3)])
            begin
              reg20 <= wire11;
              reg21 <= wire11;
              reg22 <= ((!wire13[(4'ha):(1'h1)]) <= (|wire10));
              reg23 <= $unsigned(reg17[(1'h1):(1'h0)]);
              reg24 <= ($signed($unsigned(wire10)) ?
                  $signed({(8'hab)}) : $unsigned({($unsigned(reg16) ?
                          (reg17 ? wire10 : reg22) : reg23[(3'h4):(2'h3)]),
                      $unsigned(reg20)}));
            end
          else
            begin
              reg20 <= $unsigned({(wire10[(4'ha):(3'h7)] < {$signed((8'hb9)),
                      ((8'hac) ? reg20 : reg22)}),
                  reg23});
              reg21 <= {reg23[(1'h0):(1'h0)],
                  ($signed(wire13[(4'h8):(3'h4)]) ?
                      (^$unsigned((~^wire11))) : $signed(reg17))};
              reg22 <= wire13[(3'h5):(1'h1)];
            end
        end
      reg25 <= {((~&wire15[(4'hb):(4'hb)]) != (&reg22[(3'h4):(2'h3)]))};
    end
  assign wire26 = (reg24[(4'hc):(4'hb)] ?
                      ((reg23 * $unsigned($unsigned((8'hb3)))) ~^ ((~&{wire14,
                              wire11}) ?
                          ((wire13 ? reg21 : wire15) < {wire13,
                              reg19}) : (wire15[(3'h7):(3'h7)] ?
                              wire13 : (wire15 ?
                                  reg22 : reg23)))) : $unsigned(reg16[(2'h3):(2'h3)]));
  module27 #() modinst66 (wire65, clk, reg18, reg25, wire10, wire13);
  assign wire67 = reg22;
  assign wire68 = reg17;
  always
    @(posedge clk) begin
      reg69 <= (^{wire10[(1'h0):(1'h0)], reg24[(4'h8):(2'h3)]});
    end
  assign wire70 = (8'hb5);
  assign wire71 = reg23;
  assign wire72 = {((wire12[(2'h3):(2'h3)] ?
                          wire71[(2'h2):(1'h0)] : $unsigned(wire70[(1'h1):(1'h1)])) || (({(8'hbc)} ?
                          (wire14 ?
                              reg18 : reg20) : (~&reg19)) ^ reg19[(3'h7):(2'h3)])),
                      ($signed(reg20[(3'h4):(1'h0)]) < (((wire9 ?
                              reg25 : wire13) ?
                          (reg23 ? (8'hbb) : reg17) : (reg16 ?
                              (8'hae) : reg17)) ^~ wire10))};
  assign wire73 = {(($signed($signed((8'h9d))) ~^ $signed(reg21[(3'h7):(1'h0)])) ?
                          $unsigned((((8'hb9) ? wire15 : (8'hb5)) ?
                              (reg22 | wire12) : $signed(reg16))) : $unsigned($signed((wire68 ?
                              reg18 : reg69))))};
  assign wire74 = wire71[(1'h1):(1'h0)];
endmodule

module module27  (y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h16c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire31;
  input wire [(4'h9):(1'h0)] wire30;
  input wire signed [(3'h6):(1'h0)] wire29;
  input wire signed [(4'he):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire63;
  wire signed [(4'hb):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire45;
  wire signed [(4'hd):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire32;
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire32,
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
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire32 = (-(~|(7'h44)));
  always
    @(posedge clk) begin
      reg33 <= (wire31[(3'h6):(3'h6)] && (|wire32[(1'h1):(1'h1)]));
      if (wire30)
        begin
          reg34 <= $signed({$signed(((reg33 ? wire28 : wire30) >>> ((8'ha1) ?
                  wire29 : wire32)))});
          reg35 <= wire28;
          reg36 <= wire32[(4'h8):(2'h2)];
        end
      else
        begin
          if ((&wire32[(4'he):(3'h4)]))
            begin
              reg34 <= (~{$signed(wire28[(4'hd):(1'h0)]),
                  ($signed(reg33) ^ (|$signed((8'had))))});
              reg35 <= $signed($unsigned(((~(reg36 + wire28)) ^~ wire31)));
              reg36 <= ({$signed(wire31[(4'he):(4'hd)]),
                      $unsigned($unsigned(wire30))} ?
                  {(((reg34 || wire29) & $unsigned(reg34)) <= wire31[(4'hb):(2'h2)]),
                      reg34[(1'h1):(1'h1)]} : ($signed(reg36) ?
                      ((~|((8'h9c) < wire30)) > reg35) : ($unsigned(wire28) ^ wire31)));
            end
          else
            begin
              reg34 <= ({$unsigned(reg34[(3'h5):(1'h1)]),
                  $signed((~^((8'haa) >= reg36)))} * $signed($unsigned(((wire29 & wire31) ?
                  $unsigned(wire32) : $signed((8'hba))))));
              reg35 <= $signed(wire30[(2'h3):(2'h3)]);
            end
          reg37 <= ($signed(wire31) ?
              ($signed($unsigned($unsigned((8'hb4)))) ?
                  (({wire29, reg36} ^~ wire32) ?
                      (~^wire28) : wire32) : (!((wire29 ? wire29 : reg33) ?
                      $signed(reg36) : (~^wire31)))) : (wire32 ?
                  $signed($signed(reg35[(3'h6):(2'h3)])) : wire30[(4'h9):(3'h7)]));
          reg38 <= $unsigned((reg33[(4'ha):(4'ha)] + $signed($unsigned((+wire32)))));
          if ($signed((~&(^reg34))))
            begin
              reg39 <= reg36[(4'ha):(4'ha)];
              reg40 <= $signed($signed(wire30[(3'h6):(1'h0)]));
              reg41 <= {$unsigned($signed(reg40[(4'he):(3'h4)]))};
              reg42 <= ((~^$signed({$unsigned(wire32),
                      ((8'ha8) ? reg38 : wire30)})) ?
                  (reg35[(2'h2):(1'h1)] ?
                      wire28 : reg36[(4'he):(2'h3)]) : (~&(($signed(wire31) ?
                      reg41[(2'h2):(2'h2)] : (wire31 >> reg36)) || {$unsigned(reg33),
                      {wire28}})));
              reg43 <= reg33;
            end
          else
            begin
              reg39 <= {(wire32[(5'h11):(5'h10)] ?
                      (($signed(reg36) << (~reg39)) ?
                          reg36[(1'h0):(1'h0)] : (reg33 ^ (8'hb4))) : (^~({reg39} ?
                          $signed(reg38) : (reg42 >= wire31)))),
                  reg40};
            end
        end
    end
  assign wire44 = reg42;
  assign wire45 = $signed(({{(reg33 ^~ wire30)}} ~^ $signed($unsigned(reg33))));
  assign wire46 = $signed(({reg43, {$unsigned(wire28), {reg38}}} ?
                      wire44 : ((wire29[(3'h5):(3'h5)] ?
                              wire32[(4'hc):(3'h6)] : reg37[(1'h1):(1'h1)]) ?
                          wire44[(3'h5):(2'h2)] : $unsigned(reg38[(2'h2):(2'h2)]))));
  assign wire47 = ({(wire32[(3'h6):(3'h5)] ?
                          ({(8'hae)} + (reg34 ?
                              reg33 : wire29)) : (~$unsigned(reg37))),
                      $unsigned(($signed(wire29) ?
                          wire30[(3'h5):(2'h2)] : $unsigned(reg36)))} == ({reg40[(4'hd):(3'h5)]} ?
                      reg33[(3'h4):(3'h4)] : reg33[(3'h6):(2'h3)]));
  always
    @(posedge clk) begin
      if ((|(wire28 <= ({(reg42 ? (8'ha4) : (8'hbd)),
          wire31} != $unsigned(reg40)))))
        begin
          reg48 <= ((-$unsigned($signed($unsigned(wire47)))) ?
              reg33[(2'h2):(2'h2)] : $signed(((~|(reg43 + wire46)) | ((reg33 ?
                      (8'hb5) : reg38) ?
                  $unsigned(reg34) : ((8'ha8) ? wire30 : (8'ha0))))));
          reg49 <= $signed({(^~$signed(((8'hbd) ? reg34 : (8'had))))});
          if (({($unsigned((wire47 ? reg42 : reg37)) * (|{reg43}))} ?
              $signed(reg36[(1'h0):(1'h0)]) : ($unsigned({(&(8'haf))}) ?
                  $signed($unsigned({(8'had)})) : $signed((wire29 ?
                      (-(8'ha4)) : reg34[(1'h0):(1'h0)])))))
            begin
              reg50 <= $unsigned((~|wire46));
              reg51 <= ($signed($signed(reg37[(1'h1):(1'h1)])) >= reg50[(4'hb):(3'h5)]);
              reg52 <= ((~|reg38) ?
                  $unsigned(wire28[(3'h4):(3'h4)]) : reg41[(2'h2):(2'h2)]);
            end
          else
            begin
              reg50 <= reg33;
              reg51 <= (&(8'ha5));
              reg52 <= {reg49[(3'h5):(2'h2)], $unsigned({(8'hb0), (!reg41)})};
            end
          if ((((reg48[(3'h7):(1'h1)] > $signed(wire44)) && (~$unsigned((reg37 != reg51)))) ?
              reg38[(1'h1):(1'h1)] : reg38[(2'h2):(1'h1)]))
            begin
              reg53 <= ($signed(reg36) ?
                  $signed(({(^reg38), reg36} ?
                      $unsigned(wire47[(4'h9):(3'h6)]) : wire28)) : $unsigned(wire44[(4'hc):(3'h5)]));
              reg54 <= {reg38[(2'h2):(1'h0)], {reg40[(5'h12):(4'h8)]}};
            end
          else
            begin
              reg53 <= $unsigned($unsigned(reg48));
              reg54 <= reg40;
              reg55 <= (-reg39[(5'h10):(4'he)]);
            end
          if (({($signed({wire45, reg38}) == reg41[(1'h1):(1'h1)]),
                  $signed(wire44)} ?
              $signed(($unsigned(reg41[(2'h2):(1'h1)]) | $unsigned($signed(wire30)))) : (8'hba)))
            begin
              reg56 <= reg55[(3'h4):(2'h2)];
              reg57 <= $signed(($signed($unsigned((^~reg56))) - $unsigned($signed(reg54))));
              reg58 <= (reg51[(3'h6):(1'h1)] >> (^(|reg48)));
            end
          else
            begin
              reg56 <= (reg49[(4'ha):(1'h0)] ? wire28 : reg51);
              reg57 <= reg51;
              reg58 <= ((!({(wire29 <= reg50)} ?
                      reg40[(2'h3):(1'h1)] : (~&(8'hab)))) ?
                  (reg36 ?
                      $unsigned(reg50[(5'h14):(3'h7)]) : ($signed((reg48 ?
                          (8'ha2) : wire29)) * $unsigned($unsigned((8'hb8))))) : $signed($unsigned(reg57)));
              reg59 <= (~reg38);
            end
        end
      else
        begin
          reg48 <= reg38;
          if ((&$signed((+(8'hbe)))))
            begin
              reg49 <= $signed((((~(!wire32)) <<< $signed(((8'ha3) ?
                  reg39 : reg49))) | $signed((reg49[(4'h8):(2'h2)] + reg51))));
              reg50 <= $signed(wire28);
            end
          else
            begin
              reg49 <= (wire29[(3'h4):(1'h1)] ?
                  (+$unsigned((reg35 ?
                      $signed(reg33) : (~reg43)))) : (|(!(((8'hbe) ^ reg59) <= $signed(reg58)))));
              reg50 <= reg35[(1'h0):(1'h0)];
            end
          if ((reg41 ?
              ($signed($signed((wire28 << reg57))) ~^ (~^($unsigned(reg56) ^~ $signed(reg41)))) : reg54[(2'h2):(1'h1)]))
            begin
              reg51 <= ((reg33[(3'h7):(1'h0)] <<< (($signed(reg36) ?
                  $unsigned(wire31) : (wire32 <= wire29)) ~^ $signed(wire32))) ~^ (&reg51));
              reg52 <= reg43;
              reg53 <= ((~&(~|reg35)) ?
                  $signed(((^reg59[(1'h0):(1'h0)]) << reg37[(1'h1):(1'h0)])) : $unsigned((~wire44[(2'h2):(2'h2)])));
              reg54 <= $signed($signed(reg49[(4'he):(4'h8)]));
              reg55 <= (7'h42);
            end
          else
            begin
              reg51 <= $unsigned((!({(7'h44),
                  wire45[(2'h2):(2'h2)]} <<< (8'ha7))));
              reg52 <= (((~&reg51[(3'h7):(1'h0)]) ?
                  $signed(((reg41 ?
                      (8'hbb) : (8'h9f)) << reg43)) : $unsigned({(~&(8'h9f)),
                      reg54})) * ((8'h9c) ^~ $unsigned((-reg53[(4'h8):(2'h3)]))));
            end
          reg56 <= reg58[(1'h0):(1'h0)];
        end
      if (reg54[(1'h1):(1'h0)])
        begin
          reg60 <= wire29;
        end
      else
        begin
          reg60 <= reg35[(1'h1):(1'h0)];
        end
      reg61 <= reg51[(1'h0):(1'h0)];
    end
  assign wire62 = (8'hbf);
  assign wire63 = reg34;
  assign wire64 = $unsigned({(($unsigned(reg56) ?
                              (wire30 ^ reg36) : (|wire46)) ?
                          reg35[(1'h1):(1'h0)] : reg42)});
endmodule
