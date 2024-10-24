module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire82;
  wire signed [(4'he):(1'h0)] wire81;
  wire signed [(4'hc):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire77;
  wire signed [(4'hb):(1'h0)] wire5;
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire77,
                 wire5,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = {wire0[(4'h8):(3'h5)], wire1};
  always
    @(posedge clk) begin
      reg6 <= $unsigned($unsigned(wire3[(2'h3):(1'h0)]));
      reg7 <= (($unsigned($unsigned(wire2[(4'h9):(3'h5)])) ?
              (~|$signed(wire5)) : $unsigned((!(wire2 ? wire3 : (7'h43))))) ?
          (~&(($signed(wire1) << ((7'h43) ? (8'hb8) : wire4)) ?
              (wire4[(2'h3):(1'h0)] >> $signed(wire2)) : ((wire1 ?
                      (8'ha3) : wire2) ?
                  $unsigned(wire1) : (^~wire4)))) : (+reg6));
      reg8 <= {((+$signed(reg7[(4'h9):(1'h1)])) ?
              ((wire4[(2'h2):(2'h2)] ?
                  (8'ha7) : $signed((8'hab))) < wire5) : $signed(wire0[(2'h3):(2'h3)])),
          wire4};
      reg9 <= $unsigned((reg6[(5'h15):(4'hd)] + wire0[(3'h5):(2'h2)]));
      reg10 <= (($unsigned($unsigned(((8'ha1) ?
              reg8 : reg6))) == $signed($unsigned((~|reg6)))) ?
          {reg8[(1'h0):(1'h0)]} : (wire2[(4'hd):(4'h8)] ?
              reg9[(1'h0):(1'h0)] : ((-$unsigned(wire5)) ?
                  $signed((wire4 <<< wire1)) : ($unsigned(wire1) >> (8'ha3)))));
    end
  module11 #() modinst78 (wire77, clk, reg6, reg8, wire5, wire1);
  assign wire79 = (((($signed(reg7) <= ((8'hb6) ? wire5 : reg8)) ?
                          (^wire3) : ((wire77 >= wire3) ~^ (wire77 >> reg10))) <= $unsigned(($unsigned(wire3) - $unsigned(wire3)))) ?
                      ((wire1 ?
                          $unsigned(reg6[(4'h9):(3'h6)]) : $unsigned({reg6,
                              wire1})) != {$unsigned((8'ha5)),
                          (!$signed(wire5))}) : wire4);
  assign wire80 = (8'had);
  assign wire81 = $signed($unsigned($signed(((^(8'hb3)) ?
                      {reg6, wire80} : wire79[(3'h4):(1'h1)]))));
  assign wire82 = (((+(wire81[(3'h4):(3'h4)] ?
                      $unsigned(wire77) : wire77)) == reg8) * wire4[(1'h0):(1'h0)]);
  assign wire83 = ($unsigned((~&$signed(((8'ha3) || reg8)))) & (({$unsigned(wire82)} + ((wire1 ~^ reg10) << $unsigned(reg10))) ?
                      {wire80[(1'h0):(1'h0)],
                          ((reg8 ? reg10 : (8'ha4)) ?
                              wire82[(4'ha):(4'ha)] : wire77)} : $signed({(wire0 > reg9),
                          reg8[(1'h0):(1'h0)]})));
endmodule

module module11
#(parameter param75 = ((-(8'hab)) == ((((|(8'hba)) <<< ((8'hb2) ? (8'haa) : (8'ha9))) >>> ((^(8'hab)) >> {(8'haf), (8'ha7)})) < {((8'hb3) > ((7'h44) ? (8'hb2) : (8'hb7))), (+((8'hbd) ? (8'ha4) : (8'ha9)))})), 
parameter param76 = param75)
(y, clk, wire12, wire13, wire14, wire15);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire12;
  input wire [(3'h4):(1'h0)] wire13;
  input wire signed [(3'h4):(1'h0)] wire14;
  input wire [(4'h8):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire17;
  wire signed [(2'h3):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire72;
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  assign y = {wire74,
                 wire16,
                 wire17,
                 wire21,
                 wire72,
                 reg18,
                 reg19,
                 reg20,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
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
  assign wire16 = ($signed(wire12) ?
                      ($unsigned(wire13) | wire12[(2'h2):(1'h1)]) : $unsigned(wire14));
  assign wire17 = (|(&$unsigned(wire16)));
  always
    @(posedge clk) begin
      reg18 <= wire15;
      reg19 <= $signed(wire16);
      reg20 <= (+{$unsigned(wire14),
          ({reg19, $unsigned((7'h43))} ?
              {$signed(reg18)} : (|$signed(wire17)))});
    end
  assign wire21 = reg19[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg22 <= (((wire17 ? $signed($signed(reg18)) : reg18) ?
              wire17 : wire12[(3'h5):(1'h1)]) ?
          (~^({(reg18 >= wire17), (wire21 <= reg20)} ?
              (~^{(8'hbb)}) : $unsigned($unsigned((8'ha0))))) : wire13);
      reg23 <= reg20;
      if (($signed((+$signed((wire12 ? reg23 : wire21)))) != {{$signed(reg22),
              (+(8'hbb))},
          $signed(((wire13 ? reg20 : reg20) ?
              $signed(reg22) : (wire14 ? wire17 : reg18)))}))
        begin
          reg24 <= (-(!((8'ha4) > $unsigned((|reg19)))));
        end
      else
        begin
          if (($signed((($unsigned(wire15) ?
                  (wire17 ? reg23 : (8'had)) : $signed(wire13)) ?
              $unsigned((wire14 ?
                  reg24 : wire17)) : wire15[(2'h3):(1'h0)])) || (^(^reg19[(2'h2):(1'h1)]))))
            begin
              reg24 <= reg24;
              reg25 <= (&wire15[(3'h4):(2'h3)]);
            end
          else
            begin
              reg24 <= $signed((8'ha5));
              reg25 <= $signed($unsigned(({$signed(reg25),
                  {wire13, wire17}} - wire14[(2'h2):(2'h2)])));
              reg26 <= (wire15[(3'h4):(2'h2)] != (~|(|(|reg18[(3'h7):(2'h3)]))));
            end
          reg27 <= wire17[(3'h6):(3'h6)];
          if ({$unsigned((($signed(reg23) ?
                      {wire16, (8'hb3)} : ((8'ha4) < reg24)) ?
                  $signed($unsigned(reg26)) : {wire17}))})
            begin
              reg28 <= reg26;
              reg29 <= (8'hb7);
              reg30 <= (wire16 || $signed(($signed(reg22[(4'hc):(1'h1)]) ?
                  $unsigned($unsigned(reg20)) : reg25)));
              reg31 <= (reg28 ^ ($unsigned($unsigned($unsigned(wire17))) ?
                  reg24 : $unsigned($signed(reg24))));
            end
          else
            begin
              reg28 <= reg19;
              reg29 <= ((reg30[(2'h3):(1'h1)] ?
                  reg24[(4'h9):(1'h0)] : reg30[(3'h6):(3'h4)]) ^~ (8'hb8));
              reg30 <= (7'h41);
            end
        end
      reg32 <= (8'haa);
      if (reg31[(4'ha):(2'h3)])
        begin
          reg33 <= $unsigned($unsigned((-{(~^reg27),
              (reg32 ? reg29 : reg25)})));
          reg34 <= reg29[(3'h6):(1'h0)];
          reg35 <= {$signed(((wire13 || $unsigned(wire21)) ?
                  $unsigned($unsigned(wire12)) : wire21)),
              wire15};
          reg36 <= ($unsigned($signed((|(reg35 << reg25)))) < wire12);
          reg37 <= reg34;
        end
      else
        begin
          if ($signed($signed(((reg30 - reg18) > reg32[(2'h2):(1'h0)]))))
            begin
              reg33 <= (((7'h40) ?
                      reg35 : (((wire12 ? reg30 : wire17) ?
                          $signed(reg27) : reg31) <<< ($signed(wire12) ?
                          (-(8'h9d)) : reg36[(3'h6):(3'h4)]))) ?
                  reg24 : $unsigned((~$signed((reg36 ? reg34 : reg26)))));
              reg34 <= $unsigned($signed(($unsigned((8'hbb)) == $unsigned((~^reg27)))));
              reg35 <= reg26[(4'h9):(2'h3)];
              reg36 <= $signed((reg30 && (!reg30[(4'h8):(2'h2)])));
              reg37 <= (~^$signed(reg34));
            end
          else
            begin
              reg33 <= (^(!$unsigned(wire12[(1'h0):(1'h0)])));
              reg34 <= $signed(($signed(((wire17 || wire12) ?
                      (wire15 ? reg25 : reg33) : (~reg23))) ?
                  reg23[(2'h2):(2'h2)] : ((reg22 ?
                      reg18 : $unsigned(reg37)) + $signed(reg19))));
              reg35 <= (8'ha9);
              reg36 <= $unsigned(reg19);
              reg37 <= $signed(reg20[(2'h3):(1'h1)]);
            end
          reg38 <= ({$unsigned(reg34[(2'h3):(1'h1)]),
              $unsigned(reg19[(1'h1):(1'h1)])} << reg25[(3'h6):(3'h4)]);
          reg39 <= wire17[(2'h2):(1'h1)];
          reg40 <= (reg32 ?
              {$unsigned({(reg26 > reg29), ((8'ha6) * reg35)}),
                  reg33} : $signed(wire14));
        end
    end
  module41 #() modinst73 (.clk(clk), .wire45(reg36), .wire44(reg26), .wire42(reg40), .y(wire72), .wire43(wire16));
  assign wire74 = reg34[(2'h3):(2'h3)];
endmodule

module module41
#(parameter param70 = ((8'ha8) ? ({(((8'hb8) ? (8'hb7) : (8'ha4)) ? ((8'hb1) ? (8'hba) : (8'had)) : ((8'hab) ? (8'h9f) : (8'hbc)))} ? (~|(((8'hb6) ? (8'hb8) : (8'h9d)) ? ((8'hbd) == (8'haf)) : ((8'hb6) ? (8'hb2) : (8'haf)))) : (({(7'h41), (8'hb4)} >> ((8'hae) ? (8'ha7) : (8'hbb))) | (&{(7'h40)}))) : (((((8'ha8) ? (8'hb8) : (8'hbb)) > (|(8'hb2))) ? (~|((8'ha3) ? (8'ha3) : (8'ha0))) : {(~(8'h9f))}) ? {(8'hac)} : (8'ha4))), 
parameter param71 = ((((param70 ? param70 : (param70 ? param70 : param70)) ? param70 : {{param70}}) ? {((param70 >>> param70) ? ((8'hbe) && param70) : {param70, param70}), (!(+(8'hb7)))} : ((~^(param70 ? param70 : param70)) ? (~param70) : (param70 >> param70))) & (((param70 ? param70 : (param70 + param70)) ? (param70 ? param70 : (param70 ? param70 : param70)) : ((param70 ? param70 : param70) ^~ param70)) - (-((!param70) ? param70 : param70)))))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire45;
  input wire signed [(4'hf):(1'h0)] wire44;
  input wire [(4'hf):(1'h0)] wire43;
  input wire signed [(4'hb):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire69;
  wire [(5'h15):(1'h0)] wire68;
  wire [(4'h8):(1'h0)] wire67;
  wire signed [(3'h4):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire62;
  wire signed [(4'h9):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire50;
  wire [(4'he):(1'h0)] wire49;
  wire [(4'hd):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 reg66,
                 reg65,
                 reg64,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg46,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg46 <= ((8'hb2) >= wire43);
    end
  assign wire47 = (8'hbe);
  assign wire48 = $unsigned((8'ha4));
  assign wire49 = wire48[(4'h9):(4'h9)];
  assign wire50 = (wire44 * (((~$unsigned(wire48)) * wire42) ?
                      $unsigned(reg46[(2'h2):(2'h2)]) : wire43));
  assign wire51 = (~(~^(($signed(wire45) ?
                          $unsigned((8'h9e)) : $signed(wire44)) ?
                      (~&wire49) : ((wire44 ? wire42 : reg46) > (wire50 ?
                          wire50 : (8'hb1))))));
  always
    @(posedge clk) begin
      reg52 <= $unsigned($unsigned(wire43));
      if (reg52)
        begin
          reg53 <= $unsigned(wire51[(4'hf):(4'ha)]);
          reg54 <= wire49[(4'ha):(1'h0)];
        end
      else
        begin
          reg53 <= wire47[(4'hc):(3'h6)];
          reg54 <= ((^$signed(wire43[(4'ha):(2'h2)])) ?
              {wire45} : ($unsigned(((~&reg52) ^~ (^~wire47))) >>> $unsigned(reg54[(5'h12):(4'h8)])));
        end
      if ($signed(($signed($unsigned((wire44 >= reg46))) ? wire42 : reg54)))
        begin
          reg55 <= {$signed(reg54[(3'h5):(1'h0)]),
              {(~|reg52), $signed(wire48[(4'ha):(2'h3)])}};
        end
      else
        begin
          if ($unsigned((8'hb7)))
            begin
              reg55 <= wire43;
              reg56 <= $signed(wire47);
              reg57 <= $signed((($unsigned({wire49}) || (^~reg46[(2'h3):(2'h2)])) ?
                  wire47[(5'h11):(5'h11)] : (8'ha6)));
              reg58 <= wire48;
            end
          else
            begin
              reg55 <= reg58[(1'h1):(1'h1)];
              reg56 <= wire43[(1'h1):(1'h0)];
              reg57 <= (reg56 ^~ $signed($unsigned(wire47)));
              reg58 <= (!($unsigned(wire43) ?
                  reg54[(5'h12):(3'h4)] : ((wire51 ^~ (reg52 && reg54)) ?
                      $signed($signed(wire50)) : (~&$unsigned((7'h40))))));
            end
          reg59 <= ($signed(reg57[(4'hb):(4'h8)]) && ($signed((~|$unsigned(wire49))) ?
              ($unsigned({reg46}) ?
                  $signed(wire44) : (~^(|wire49))) : $unsigned(({wire42,
                      reg57} ?
                  wire50[(4'ha):(4'ha)] : (wire44 ? reg58 : reg53)))));
        end
    end
  assign wire60 = $unsigned(((((~&wire47) ^~ reg58[(1'h0):(1'h0)]) <<< $signed($signed(reg54))) ?
                      $unsigned(((reg52 - wire48) ?
                          reg46 : {reg57})) : wire48[(1'h0):(1'h0)]));
  assign wire61 = $unsigned(reg58);
  assign wire62 = (reg53 ?
                      reg56[(4'h8):(2'h2)] : ($signed(((wire61 >> wire43) <<< (&wire48))) ~^ (((~wire49) ?
                          (wire48 || wire43) : reg55) * reg56[(5'h11):(5'h10)])));
  assign wire63 = wire49;
  always
    @(posedge clk) begin
      if ({wire51[(4'hc):(3'h7)]})
        begin
          if ($unsigned($signed(((7'h42) + (-reg53)))))
            begin
              reg64 <= (&{(8'hb5), wire60});
            end
          else
            begin
              reg64 <= wire47[(5'h10):(3'h5)];
            end
          reg65 <= $signed((($unsigned(reg58[(1'h1):(1'h0)]) ~^ $signed($unsigned(wire48))) ?
              reg46[(1'h1):(1'h0)] : (8'hbe)));
          reg66 <= wire50;
        end
      else
        begin
          reg64 <= ((wire60[(2'h3):(2'h2)] <<< (^~$signed((~|reg46)))) ^~ ($unsigned(((wire45 ?
                  reg56 : reg66) ?
              (-reg64) : $unsigned(wire61))) < ((wire48 ?
              (reg64 ? reg46 : wire51) : wire62[(4'h8):(2'h2)]) && reg66)));
        end
    end
  assign wire67 = (|(wire44 ~^ (~((reg46 ? wire63 : wire45) ?
                      reg56[(4'hd):(1'h0)] : (|reg53)))));
  assign wire68 = wire47;
  assign wire69 = reg46[(1'h0):(1'h0)];
endmodule
