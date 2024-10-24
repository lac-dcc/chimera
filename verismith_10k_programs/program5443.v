module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  assign y = {wire92,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 (1'h0)};
  assign wire4 = wire3[(2'h3):(2'h2)];
  assign wire5 = (wire0 - ({wire4,
                     wire3} | $signed($unsigned($unsigned(wire2)))));
  assign wire6 = (((8'ha7) > ((^~wire0) ?
                     (|wire5[(3'h4):(2'h3)]) : ((wire1 ? wire4 : wire2) ?
                         $unsigned(wire1) : (wire2 ?
                             wire1 : wire3)))) != (wire3 ?
                     {($unsigned(wire0) ?
                             wire3[(3'h7):(1'h1)] : wire4[(4'he):(1'h1)]),
                         $unsigned(wire4)} : (wire1[(2'h3):(1'h0)] < $signed(wire4[(4'hb):(2'h2)]))));
  assign wire7 = (($unsigned({wire1[(1'h1):(1'h0)], $signed(wire6)}) ?
                         (((!wire1) >> $unsigned(wire2)) ?
                             $signed($unsigned(wire0)) : ({wire6, wire2} ?
                                 $unsigned(wire1) : $signed(wire2))) : $unsigned((8'hb7))) ?
                     $signed(((((7'h43) ? wire5 : wire4) > (~^(8'hb6))) ?
                         wire2[(2'h2):(1'h0)] : (!(wire2 ?
                             wire2 : (7'h44))))) : $signed(wire4));
  always
    @(posedge clk) begin
      reg8 <= wire2;
      reg9 <= $unsigned($unsigned((7'h43)));
      reg10 <= $signed((wire0[(4'ha):(4'ha)] ?
          {(+(reg8 << wire3)), $signed(wire1)} : $unsigned(((wire7 ?
                  reg9 : wire0) ?
              ((8'hb3) ? reg9 : wire6) : $unsigned((7'h42))))));
      reg11 <= ((-reg10[(1'h1):(1'h1)]) == {(((wire6 ? wire2 : (8'hb3)) ?
              $signed(wire0) : (wire3 ?
                  wire5 : wire3)) >>> wire0[(4'hb):(4'h8)])});
      reg12 <= $signed($signed(wire3[(4'h9):(3'h7)]));
    end
  module13 #() modinst93 (.y(wire92), .wire18(wire2), .wire14(wire0), .wire15(reg8), .wire17(wire7), .clk(clk), .wire16(wire3));
endmodule

module module13
#(parameter param90 = (({(!((8'hbc) ? (8'ha6) : (8'hba)))} ? ((((8'hb3) ? (8'hac) : (8'ha1)) - (~&(8'had))) ^~ (((8'h9d) || (7'h41)) + ((8'ha1) ? (8'ha2) : (8'hb3)))) : (((~(8'hb7)) ? ((8'ha6) - (8'ha2)) : ((8'hba) <= (8'h9e))) ~^ ((!(8'hbc)) ? ((8'hb7) ? (8'ha9) : (8'hb0)) : ((8'had) == (8'hb4))))) ? (!(8'hbc)) : (^{{{(8'haa), (8'hb7)}}, {(~&(8'h9d))}})), 
parameter param91 = (((param90 && (|(8'ha0))) - (((param90 > param90) ? (~param90) : (param90 <= (7'h43))) ? {param90, ((8'ha5) ? param90 : (8'haa))} : ({param90, param90} ? (param90 * param90) : (param90 ? param90 : param90)))) ? param90 : param90))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h15d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire18;
  input wire signed [(5'h15):(1'h0)] wire17;
  input wire [(2'h3):(1'h0)] wire16;
  input wire [(3'h7):(1'h0)] wire15;
  input wire [(4'he):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire84;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(4'hc):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire63;
  wire [(5'h14):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire66;
  wire signed [(4'he):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire82;
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(3'h6):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire61,
                 wire39,
                 wire24,
                 wire20,
                 wire19,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire67,
                 wire68,
                 wire82,
                 reg89,
                 reg88,
                 reg87,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire19 = wire17[(1'h0):(1'h0)];
  assign wire20 = {((+{(wire15 ? wire17 : wire17)}) ?
                          $signed($signed((~^wire14))) : wire19)};
  always
    @(posedge clk) begin
      reg21 <= wire16[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg22 <= (!(wire20[(3'h6):(3'h4)] * wire14));
      reg23 <= (($unsigned(wire19) ?
              $unsigned($unsigned((wire19 ^ wire14))) : wire18) ?
          (wire16[(1'h1):(1'h0)] ?
              (~{$signed(reg22)}) : wire18) : ({(reg21[(1'h1):(1'h1)] ?
                      wire16 : (wire15 ~^ reg21)),
                  {(|wire14)}} ?
              $signed($unsigned((wire16 == wire20))) : ($signed((^(8'hbe))) << wire15)));
    end
  assign wire24 = reg21;
  always
    @(posedge clk) begin
      if (reg23)
        begin
          if (wire19)
            begin
              reg25 <= $unsigned(((({(7'h43), (8'hb4)} ?
                      (!reg21) : $signed((8'hac))) ?
                  $unsigned($unsigned(wire20)) : (8'ha2)) & ((8'hb3) << {$unsigned(wire17),
                  (reg21 ~^ wire19)})));
            end
          else
            begin
              reg25 <= (~^(reg23 ?
                  ($unsigned(wire19[(3'h6):(3'h5)]) ^ (reg23[(4'h9):(2'h2)] ?
                      wire20 : (wire18 ?
                          wire16 : reg21))) : {((wire24 <<< reg25) ?
                          wire19 : (~reg22))}));
            end
          if ($signed($unsigned($unsigned(wire15[(1'h0):(1'h0)]))))
            begin
              reg26 <= $unsigned($unsigned($signed(({reg25} ?
                  $unsigned(reg23) : $signed(wire15)))));
              reg27 <= $signed($unsigned($unsigned({$unsigned(wire14),
                  wire15[(2'h2):(2'h2)]})));
              reg28 <= (reg26 ?
                  (wire15 ?
                      ({(wire15 ?
                              wire15 : wire20)} > reg27[(3'h4):(1'h0)]) : ($unsigned(reg23) ?
                          {(-reg22)} : ({reg22} ?
                              (wire24 | reg25) : $unsigned(wire15)))) : $unsigned((wire17 ?
                      $unsigned((8'ha4)) : (((8'hb2) < wire19) ?
                          $signed(wire17) : (wire16 * wire16)))));
            end
          else
            begin
              reg26 <= $unsigned(wire15[(3'h7):(2'h2)]);
            end
          if ({{(^($signed((8'hab)) ^ $signed(reg22))),
                  $unsigned(((7'h44) ~^ $unsigned(reg22)))},
              (~&$unsigned({wire14}))})
            begin
              reg29 <= (|((wire17 ?
                      (((8'ha6) ? wire16 : wire16) ?
                          reg22[(3'h4):(1'h1)] : wire24) : $unsigned($unsigned(wire15))) ?
                  $signed(reg23[(3'h7):(3'h7)]) : (!$signed($signed((8'ha6))))));
            end
          else
            begin
              reg29 <= (!(($unsigned($signed(wire16)) <<< (~^(reg26 || (8'ha0)))) ?
                  {(8'hb2),
                      reg21[(3'h4):(1'h0)]} : (($signed(wire24) >>> $unsigned(wire16)) > wire24[(3'h7):(3'h4)])));
              reg30 <= $unsigned($signed({((reg28 * (7'h41)) ~^ (reg29 ?
                      reg28 : reg29))}));
              reg31 <= (!$signed($signed((8'ha5))));
              reg32 <= (^~$unsigned(((~^$unsigned(wire19)) <= (((8'hb2) >= (8'h9d)) ?
                  (~^reg28) : (|reg27)))));
            end
          reg33 <= reg28[(2'h3):(1'h1)];
          reg34 <= $signed($unsigned($unsigned(reg27[(3'h7):(1'h1)])));
        end
      else
        begin
          reg25 <= ((wire16[(1'h1):(1'h0)] ?
              wire14[(1'h0):(1'h0)] : (!$unsigned((reg25 >= reg34)))) + ((wire17 != ($unsigned((7'h43)) != (8'hb7))) - (8'hb2)));
          reg26 <= ($signed($unsigned(reg32)) != (^{(reg28 >>> $unsigned(reg23))}));
          reg27 <= $unsigned({reg27[(4'h9):(3'h4)], $unsigned(reg29)});
        end
      if (((reg26 ?
              (reg22 ?
                  $signed($unsigned(wire16)) : ($unsigned(wire16) * $unsigned(reg22))) : $unsigned(reg32[(1'h1):(1'h0)])) ?
          wire19 : ($signed(reg28) ?
              (^~(((8'hbd) ^ reg29) ?
                  $signed(reg34) : $unsigned(reg22))) : ((-reg30[(3'h5):(3'h5)]) ?
                  wire15[(2'h3):(2'h3)] : $signed(reg32[(2'h2):(2'h2)])))))
        begin
          reg35 <= reg23;
          reg36 <= {(reg30[(1'h0):(1'h0)] ?
                  (wire24[(3'h7):(3'h5)] || $signed({(8'hab)})) : (^~reg34))};
          reg37 <= reg31;
        end
      else
        begin
          reg35 <= $signed((wire20[(5'h12):(1'h0)] ^ $signed(reg29)));
          reg36 <= reg25;
          reg37 <= wire16[(2'h3):(1'h0)];
          reg38 <= (reg32[(1'h0):(1'h0)] < {(((reg36 ? (8'haa) : reg28) ?
                  wire15[(3'h5):(2'h3)] : ((8'ha9) ?
                      reg37 : (8'ha6))) << reg32)});
        end
    end
  assign wire39 = (+reg28[(4'hb):(4'hb)]);
  module40 #() modinst62 (wire61, clk, wire17, wire39, wire18, reg22, reg26);
  assign wire63 = $signed((~|((8'h9e) >> wire39)));
  assign wire64 = $unsigned(reg36);
  assign wire65 = (^~(~^$unsigned((~reg38[(3'h4):(1'h0)]))));
  assign wire66 = $unsigned((((~|$signed(wire14)) == wire18[(3'h6):(2'h3)]) + $unsigned($unsigned($signed(reg27)))));
  assign wire67 = $unsigned((7'h40));
  assign wire68 = reg23[(4'hb):(1'h0)];
  module69 #() modinst83 (wire82, clk, wire17, reg27, reg38, wire63, wire18);
  assign wire84 = (($unsigned(wire39) ?
                      {(&(-(8'h9f)))} : $unsigned(wire15)) ^~ $signed($unsigned(reg27)));
  assign wire85 = ((wire82[(4'h9):(2'h2)] ?
                          $unsigned(reg26[(2'h2):(2'h2)]) : $unsigned(reg23)) ?
                      (&((!(~^wire68)) ?
                          reg31[(2'h3):(1'h0)] : wire63)) : (($signed((~|wire67)) ?
                          ($unsigned(reg22) ?
                              (^~reg36) : reg23[(4'h8):(1'h0)]) : ((^reg38) ?
                              (~^wire24) : wire66[(4'h8):(4'h8)])) == wire18[(4'hd):(4'ha)]));
  assign wire86 = (&$signed((($signed(wire67) ?
                      (wire15 ?
                          (7'h40) : reg34) : wire19[(3'h4):(2'h3)]) + wire82[(3'h4):(1'h1)])));
  always
    @(posedge clk) begin
      reg87 <= $signed({$signed($signed($signed(reg27))),
          $unsigned(({reg21, (8'h9d)} - wire14[(4'he):(4'ha)]))});
      reg88 <= $unsigned(wire24[(4'hd):(4'h8)]);
      reg89 <= {$unsigned(wire84[(1'h0):(1'h0)]),
          {($unsigned(wire86[(3'h4):(3'h4)]) ?
                  reg29[(1'h1):(1'h0)] : $unsigned($signed(reg22)))}};
    end
endmodule

module module69
#(parameter param80 = ((~(~(((8'ha4) && (8'haf)) ? ((8'h9f) > (8'hb7)) : (8'ha5)))) ? {(~|(|((7'h43) ? (7'h41) : (8'h9d))))} : (|((((8'hab) ? (8'ha0) : (8'hab)) ? ((8'hbb) != (8'ha9)) : ((8'hb7) <= (8'hb8))) ? {{(7'h41), (8'hba)}, (~&(8'hb6))} : (^~{(7'h42), (8'ha6)})))), 
parameter param81 = (!param80))
(y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire74;
  input wire [(5'h13):(1'h0)] wire73;
  input wire [(5'h12):(1'h0)] wire72;
  input wire signed [(4'hc):(1'h0)] wire71;
  input wire [(5'h13):(1'h0)] wire70;
  wire signed [(3'h4):(1'h0)] wire79;
  wire [(3'h5):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire77;
  wire [(5'h14):(1'h0)] wire76;
  wire signed [(5'h10):(1'h0)] wire75;
  assign y = {wire79, wire78, wire77, wire76, wire75, (1'h0)};
  assign wire75 = $signed(wire71);
  assign wire76 = (wire73 - wire74[(1'h1):(1'h0)]);
  assign wire77 = (~|(8'hb4));
  assign wire78 = wire74[(1'h0):(1'h0)];
  assign wire79 = (!($signed($unsigned(wire78[(2'h3):(1'h1)])) ?
                      (wire72[(1'h1):(1'h1)] + $unsigned((+wire75))) : $signed({$signed((8'ha6))})));
endmodule

module module40
#(parameter param59 = ((&(((|(8'haf)) >>> (~(8'hba))) ? {((7'h42) ? (8'hbf) : (8'hb6))} : (((8'hb4) << (8'hbf)) <<< ((8'ha7) ? (8'hb1) : (8'hbf))))) ? (~^(({(8'h9e), (8'haa)} ? ((8'hb3) && (8'ha6)) : ((8'ha0) ? (8'hbc) : (7'h42))) ? (^((8'ha9) >> (8'ha6))) : (((8'ha2) ? (8'ha5) : (8'hbc)) ? ((8'ha5) ? (7'h44) : (7'h43)) : ((8'hbd) ? (8'hb1) : (8'haf))))) : ((8'ha7) ? ((((7'h43) ? (8'h9e) : (8'ha0)) ? (~&(8'hbf)) : ((8'ha7) & (8'h9c))) ? (&(!(8'hb0))) : (~^((8'hb4) <= (7'h43)))) : (+(^((8'hb8) ? (8'hab) : (7'h40)))))), 
parameter param60 = (^~({(((8'haf) ? param59 : param59) ? ((8'hbb) <<< param59) : (param59 ? param59 : param59))} ? param59 : ((~(param59 | param59)) ? (~{param59}) : ((param59 ? (8'hba) : param59) ? (^~param59) : (|(8'hbf)))))))
(y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire45;
  input wire [(4'h9):(1'h0)] wire44;
  input wire signed [(5'h11):(1'h0)] wire43;
  input wire signed [(4'hc):(1'h0)] wire42;
  input wire [(2'h3):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire48;
  wire signed [(4'hd):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
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
                 (1'h0)};
  assign wire46 = ((~^$unsigned((~(wire41 ^~ wire45)))) ? wire45 : wire41);
  assign wire47 = (($signed((-$unsigned(wire46))) ?
                          wire41 : (~^(~$unsigned(wire41)))) ?
                      $signed(($unsigned($signed(wire43)) ?
                          {wire41[(2'h3):(2'h3)],
                              $signed(wire45)} : (wire44 >>> wire45))) : wire43[(4'he):(4'ha)]);
  assign wire48 = {wire45};
  always
    @(posedge clk) begin
      reg49 <= $unsigned($signed($unsigned((^~$signed(wire45)))));
      if (reg49[(2'h2):(2'h2)])
        begin
          reg50 <= wire47;
          if (wire44[(3'h5):(3'h4)])
            begin
              reg51 <= reg49[(2'h2):(1'h0)];
              reg52 <= ((wire48[(1'h0):(1'h0)] ?
                  $unsigned(wire42) : $unsigned(($signed(wire45) <= $unsigned(wire47)))) >> wire42[(3'h6):(3'h6)]);
              reg53 <= (wire47 ?
                  wire43[(2'h3):(1'h1)] : {((reg50[(3'h5):(3'h4)] ?
                          (+(8'hbe)) : reg49[(3'h5):(2'h3)]) < {((8'ha3) ?
                              wire42 : wire47),
                          (reg50 << wire47)}),
                      {wire46[(3'h7):(3'h6)]}});
              reg54 <= reg51;
              reg55 <= wire41[(1'h0):(1'h0)];
            end
          else
            begin
              reg51 <= $signed(((~$unsigned((reg49 != (8'hb9)))) + (~|(-$signed(reg52)))));
              reg52 <= $signed(reg49[(1'h1):(1'h0)]);
              reg53 <= (8'ha6);
            end
        end
      else
        begin
          if ((^~$unsigned((~|{{reg49}}))))
            begin
              reg50 <= $unsigned((&((^~$signed(wire41)) * wire45)));
            end
          else
            begin
              reg50 <= {(-$unsigned(((wire48 >>> wire46) ^~ (8'hac)))),
                  (((&(~&wire45)) || $signed(reg53)) || wire44)};
              reg51 <= wire48;
            end
          reg52 <= (~&reg53);
          reg53 <= (!wire46);
          reg54 <= (^reg50[(1'h1):(1'h0)]);
        end
      reg56 <= $unsigned(wire48[(5'h12):(5'h11)]);
      reg57 <= (~$unsigned($unsigned((~&(+reg49)))));
      reg58 <= wire46[(3'h5):(2'h3)];
    end
endmodule
