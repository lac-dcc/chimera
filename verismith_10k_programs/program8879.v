module top
#(parameter param87 = ((~|(-(((7'h44) ? (8'h9d) : (8'ha4)) ? (-(8'h9f)) : ((8'hae) >= (8'hb3))))) >>> (~(((8'hb3) && (8'hba)) ? (((8'ha8) != (8'hae)) ? (&(7'h43)) : (8'hb7)) : ((~(8'hac)) ? (|(8'ha3)) : (^(8'h9e)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire0;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  wire [(2'h2):(1'h0)] wire86;
  wire signed [(5'h14):(1'h0)] wire85;
  wire [(3'h4):(1'h0)] wire84;
  wire signed [(3'h4):(1'h0)] wire83;
  wire [(4'he):(1'h0)] wire82;
  wire [(4'h9):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire16;
  wire signed [(4'hb):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire80;
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire24,
                 wire25,
                 wire80,
                 reg8,
                 reg9,
                 reg10,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 (1'h0)};
  assign wire4 = (&$signed(wire0));
  assign wire5 = wire0[(2'h3):(1'h0)];
  assign wire6 = (8'ha3);
  assign wire7 = wire4[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg8 <= (((~&wire4) & wire7[(3'h5):(3'h4)]) == ((&(wire1[(2'h2):(1'h0)] >= {wire6})) ?
          $signed($signed($signed(wire6))) : (~|(+wire7))));
      if ($signed($unsigned((8'haa))))
        begin
          reg9 <= (|wire6[(3'h6):(2'h2)]);
          reg10 <= {(8'hb4),
              $signed(({(&reg8), $unsigned(reg8)} >> $unsigned(wire5)))};
        end
      else
        begin
          reg9 <= (8'ha4);
        end
    end
  assign wire11 = $unsigned({$signed(wire3[(4'ha):(3'h5)])});
  assign wire12 = (+(reg9[(3'h4):(2'h3)] >>> (+$signed((8'ha7)))));
  assign wire13 = wire12[(3'h7):(3'h7)];
  assign wire14 = wire5[(3'h4):(2'h3)];
  assign wire15 = ((~&((~|wire12) ?
                      wire7 : (~^(wire7 | wire0)))) && (($unsigned($unsigned((8'hb9))) ?
                      wire7 : {(8'hb5)}) ^~ (^~wire4[(3'h5):(2'h2)])));
  assign wire16 = ((!$signed($unsigned(reg9[(1'h0):(1'h0)]))) * (~^({wire5,
                      (wire4 <<< (8'hb9))} & reg8[(2'h3):(1'h0)])));
  assign wire17 = ({wire15, $unsigned((&wire7[(4'h9):(3'h5)]))} * wire3);
  assign wire18 = ((((~^(wire4 ? wire16 : wire16)) ?
                              ((reg9 ?
                                  wire6 : wire7) ~^ (wire5 >= wire5)) : (~(wire3 ?
                                  reg10 : reg8))) ?
                          (|wire3) : $signed(reg9)) ?
                      reg10[(2'h2):(2'h2)] : ($signed((|((8'ha2) ?
                              wire15 : wire4))) ?
                          {((wire6 ? wire17 : reg9) ?
                                  {wire13} : (8'hb5))} : ($signed(((7'h43) ?
                              reg8 : wire15)) | (~^$signed(wire11)))));
  always
    @(posedge clk) begin
      reg19 <= ({{$signed((wire7 ? wire7 : wire18))}} ?
          ($signed({(wire6 ? wire1 : wire7), (wire16 >= (8'hbc))}) ?
              $signed(wire5) : {wire3}) : wire13[(2'h2):(1'h0)]);
      reg20 <= {(~^wire3), $signed($unsigned($unsigned($signed(wire3))))};
      if ((8'ha9))
        begin
          reg21 <= $unsigned(reg9[(4'h9):(1'h0)]);
        end
      else
        begin
          reg21 <= $unsigned(((8'hae) * {wire15[(1'h0):(1'h0)],
              reg21[(1'h0):(1'h0)]}));
          reg22 <= $signed((8'ha5));
        end
      reg23 <= $signed((wire12[(1'h1):(1'h1)] ?
          $unsigned(reg22) : (wire11 ?
              (~^(reg9 ? (8'ha9) : (7'h43))) : {$signed(reg22)})));
    end
  assign wire24 = ({{reg22[(1'h0):(1'h0)],
                              ((reg8 + (8'hb4)) ? (reg22 != wire7) : reg19)}} ?
                      ($signed((~(wire15 >>> (8'ha5)))) < wire1[(1'h0):(1'h0)]) : $unsigned((~&wire14)));
  assign wire25 = wire13[(4'he):(2'h3)];
  module26 #() modinst81 (wire80, clk, wire2, wire4, wire6, reg20);
  assign wire82 = ($unsigned((wire24[(4'h9):(2'h2)] ?
                      wire80[(4'hf):(4'ha)] : ((wire24 ? wire11 : (7'h41)) ?
                          (wire16 ?
                              reg9 : reg9) : $unsigned((8'ha1))))) >> wire7[(4'hb):(2'h2)]);
  assign wire83 = (wire80 >> $signed((^~($signed(wire25) == reg22))));
  assign wire84 = wire14;
  assign wire85 = $signed((^~$unsigned($signed((8'hae)))));
  assign wire86 = wire3[(4'h9):(2'h2)];
endmodule

module module26
#(parameter param78 = (|{(~&({(8'hb5)} | {(8'hb0), (8'h9d)}))}), 
parameter param79 = (8'hb2))
(y, clk, wire27, wire28, wire29, wire30);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire27;
  input wire signed [(2'h2):(1'h0)] wire28;
  input wire [(4'h8):(1'h0)] wire29;
  input wire [(5'h12):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire76;
  wire signed [(4'ha):(1'h0)] wire75;
  wire signed [(4'h8):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire73;
  wire [(5'h12):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire31;
  wire signed [(5'h12):(1'h0)] wire32;
  wire [(4'ha):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire70;
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire31,
                 wire32,
                 wire36,
                 wire37,
                 wire38,
                 wire70,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire31 = (wire29 * ((&(+(+wire27))) ^ $signed({wire29})));
  assign wire32 = ($unsigned($unsigned((!(~^wire28)))) ?
                      $unsigned(((7'h41) ?
                          $unsigned($signed(wire30)) : wire30)) : $signed({wire28,
                          {wire28}}));
  always
    @(posedge clk) begin
      reg33 <= wire32;
      reg34 <= (-wire28);
      reg35 <= ($unsigned($unsigned(wire31)) && (^reg34));
    end
  assign wire36 = wire28;
  assign wire37 = reg35;
  assign wire38 = (~&wire27[(2'h2):(2'h2)]);
  module39 #() modinst71 (.wire44(reg35), .wire42(wire37), .y(wire70), .wire40(wire38), .wire41(wire32), .wire43(reg33), .clk(clk));
  assign wire72 = ((&wire36) ? $unsigned(wire37) : (-wire38));
  assign wire73 = ((($unsigned((reg33 >>> (8'hbf))) ?
                              $signed(wire31) : ((wire70 ? (8'ha8) : (8'hb2)) ?
                                  (~wire30) : (wire30 >>> reg35))) ?
                          $signed($signed((reg33 ?
                              wire28 : reg33))) : ((wire32[(1'h1):(1'h0)] ?
                              wire30[(3'h7):(2'h2)] : (wire38 < wire36)) <= (-(reg34 ^ wire37)))) ?
                      (((~(-reg34)) < reg33) ?
                          ((wire37[(4'ha):(4'ha)] - $signed(wire31)) & {$unsigned(reg34),
                              $signed(wire30)}) : (~^reg35)) : {$unsigned(((!reg34) ?
                              $unsigned(wire36) : (wire27 ?
                                  wire70 : wire28)))});
  assign wire74 = {$signed(wire70[(5'h14):(3'h7)]), wire32[(3'h5):(3'h4)]};
  assign wire75 = wire28;
  assign wire76 = (^~{wire27});
  assign wire77 = wire29[(3'h4):(2'h2)];
endmodule

module module39
#(parameter param69 = (~^(~({((8'hb7) >= (8'ha3)), (~&(8'hb2))} ? (~&((8'ha4) ? (8'ha1) : (7'h42))) : ((+(8'hae)) ? (&(8'h9d)) : ((8'hb0) >= (8'hb8)))))))
(y, clk, wire44, wire43, wire42, wire41, wire40);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire44;
  input wire signed [(3'h5):(1'h0)] wire43;
  input wire [(5'h13):(1'h0)] wire42;
  input wire signed [(5'h10):(1'h0)] wire41;
  input wire [(3'h7):(1'h0)] wire40;
  wire signed [(5'h12):(1'h0)] wire68;
  wire [(3'h5):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(4'h8):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire45;
  reg signed [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(5'h10):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  assign y = {wire68,
                 wire57,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
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
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire45 = {(wire42 ? wire43 : (+wire42)),
                      (^$signed((wire43[(1'h1):(1'h1)] ?
                          ((8'hb1) ? wire40 : wire44) : (^wire43))))};
  assign wire46 = ($signed((^~(!wire42[(4'hf):(1'h1)]))) ?
                      (~($unsigned(wire42) ?
                          (~&$unsigned(wire44)) : ($unsigned(wire42) & (wire42 << wire42)))) : (wire45[(1'h1):(1'h0)] || ($signed((wire43 ?
                              wire43 : wire45)) ?
                          wire43[(2'h2):(1'h1)] : (8'hb0))));
  assign wire47 = {(wire41[(4'hc):(2'h2)] && $unsigned(wire46[(4'ha):(2'h2)]))};
  assign wire48 = $signed($unsigned((($unsigned(wire47) <= $signed(wire40)) ?
                      $unsigned((wire41 ? wire40 : wire43)) : wire45)));
  assign wire49 = $signed(wire43);
  assign wire50 = $unsigned($signed(wire45[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg51 <= {(($unsigned((wire47 + wire44)) ?
              wire50 : ($unsigned(wire40) & $unsigned(wire46))) >>> wire50[(5'h14):(5'h12)]),
          (~^$signed({(&wire44), wire43}))};
      if ({wire47,
          (wire45[(1'h1):(1'h0)] ?
              ($signed({wire49, wire50}) ? wire41 : (^wire46)) : reg51)})
        begin
          reg52 <= ($unsigned(wire41) ?
              $unsigned($signed(wire49)) : (wire44[(1'h0):(1'h0)] ?
                  $unsigned(((~&wire46) >= (~|wire48))) : (((wire43 != reg51) ?
                          {wire45, wire43} : (wire43 ? wire49 : wire46)) ?
                      ({wire42} ?
                          wire42 : $signed(wire45)) : wire48[(2'h3):(1'h1)])));
        end
      else
        begin
          reg52 <= wire48[(3'h4):(2'h3)];
          reg53 <= (~&(~|(wire49[(3'h5):(1'h0)] >>> (~(&wire50)))));
          if (wire49[(3'h6):(3'h6)])
            begin
              reg54 <= $unsigned(wire47[(4'ha):(2'h2)]);
              reg55 <= wire41[(4'hb):(4'ha)];
            end
          else
            begin
              reg54 <= {wire46[(2'h2):(1'h0)], $signed((8'haa))};
              reg55 <= wire44[(1'h1):(1'h1)];
              reg56 <= reg53;
            end
        end
    end
  assign wire57 = $signed((wire48 > (({wire43} >>> wire47[(5'h14):(4'hd)]) + wire43[(3'h5):(1'h0)])));
  always
    @(posedge clk) begin
      reg58 <= ($signed(wire46) < wire57);
    end
  always
    @(posedge clk) begin
      reg59 <= reg56[(2'h2):(2'h2)];
      reg60 <= (+{$signed((reg52 ?
              reg54[(4'h8):(3'h6)] : (reg51 ? (8'hb5) : reg54))),
          $unsigned({(!reg56), wire45})});
      reg61 <= {($signed($unsigned((&reg53))) << {wire40}),
          $unsigned({($unsigned(wire43) ? (reg54 | reg52) : {wire46, wire48}),
              ($signed((8'hb6)) ? reg59[(3'h7):(1'h0)] : {wire42})})};
      if (($unsigned(($unsigned($unsigned(wire47)) ?
              reg59[(3'h5):(1'h1)] : $unsigned((wire46 - reg58)))) ?
          reg58 : ($unsigned($signed((wire40 ?
              reg51 : wire57))) * $signed((8'ha6)))))
        begin
          reg62 <= {reg53[(1'h0):(1'h0)]};
          reg63 <= (|((&((reg54 ^~ wire42) ?
              (reg54 | reg58) : (reg53 > wire47))) <<< (~^reg53[(1'h0):(1'h0)])));
          if ((+(~^((~&{reg53, reg53}) ?
              $unsigned(reg51[(3'h4):(2'h3)]) : reg51))))
            begin
              reg64 <= ($signed(reg60[(4'h9):(2'h2)]) ? wire45 : wire45);
            end
          else
            begin
              reg64 <= $unsigned(((^wire50[(3'h5):(2'h2)]) ?
                  {reg62} : ($signed((-wire50)) ?
                      $unsigned((reg58 ? reg62 : wire41)) : wire47)));
              reg65 <= $unsigned($unsigned(wire49[(3'h4):(2'h3)]));
            end
          reg66 <= ($signed(($unsigned((reg65 >> (8'hbe))) + ($unsigned((8'hab)) < wire44))) ?
              wire50 : (($unsigned((~&reg61)) ?
                      ((wire41 < reg59) >> wire48) : {(!reg51)}) ?
                  (wire47[(3'h7):(3'h5)] ?
                      {{reg65, wire43}} : (7'h41)) : ({(wire46 == reg64),
                          ((8'hb8) ? wire42 : wire47)} ?
                      wire49[(4'h8):(1'h1)] : ($signed(wire45) >>> (-reg55)))));
          reg67 <= (((wire41[(4'hb):(4'h8)] ?
                  $signed(reg64) : (!(wire47 | wire50))) <= ((-$unsigned(reg55)) >>> {(^~wire41),
                  wire41})) ?
              $signed((((wire47 ? reg52 : (8'hbe)) ?
                      (reg64 ? (8'ha1) : (8'hb5)) : $unsigned(wire43)) ?
                  wire41 : {(reg63 ?
                          wire57 : reg62)})) : wire40[(1'h0):(1'h0)]);
        end
      else
        begin
          reg62 <= $signed($unsigned(reg61[(2'h3):(1'h1)]));
          reg63 <= reg66[(3'h7):(3'h5)];
        end
    end
  assign wire68 = $unsigned(reg52[(4'ha):(3'h7)]);
endmodule
