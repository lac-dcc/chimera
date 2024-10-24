module top
#(parameter param95 = ({((~((8'ha1) ~^ (8'hb1))) ? {((8'hbf) ? (8'hbe) : (8'hae))} : (-((8'hb3) - (7'h44)))), ((((8'ha9) * (8'ha0)) || {(7'h44)}) <= (~|(~|(8'ha8))))} ? {((&((8'ha2) ? (8'hb3) : (8'hbd))) ? ((~|(8'ha9)) ^ ((8'had) || (8'hab))) : (8'hb6))} : (+(~^(((8'hbe) ? (8'ha1) : (8'ha1)) ? {(8'ha0), (8'ha4)} : (8'haa))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire94;
  wire [(4'hb):(1'h0)] wire93;
  wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire91;
  assign y = {wire94,
                 wire93,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire67,
                 wire91,
                 (1'h0)};
  assign wire4 = wire0[(2'h3):(2'h3)];
  assign wire5 = (|(^~wire4));
  assign wire6 = $unsigned(((wire0[(3'h4):(1'h0)] ?
                         wire4 : ($signed((8'ha1)) ?
                             (8'hb3) : (wire5 ? wire0 : wire4))) ?
                     $unsigned(wire1) : ($unsigned((8'hb9)) ?
                         ($signed((8'ha8)) ?
                             $unsigned(wire1) : (wire4 * wire2)) : ((7'h40) ^ $signed(wire1)))));
  assign wire7 = $signed($signed({(|$unsigned(wire2))}));
  assign wire8 = $unsigned(($signed({wire1[(2'h2):(2'h2)]}) >= wire1[(1'h1):(1'h1)]));
  assign wire9 = (wire7[(1'h1):(1'h0)] ^~ (~|wire4[(4'hb):(3'h5)]));
  assign wire10 = (8'haa);
  module11 #() modinst68 (wire67, clk, wire6, wire8, wire5, wire7);
  module69 #() modinst92 (wire91, clk, wire2, wire6, wire8, wire5, wire7);
  assign wire93 = ($unsigned($signed($unsigned((wire3 ? wire10 : wire0)))) ?
                      (wire1[(4'h9):(4'h8)] >= (^~wire6[(4'h9):(3'h7)])) : ((($unsigned(wire7) ?
                          (wire67 ?
                              (8'h9e) : (8'h9f)) : wire8[(1'h0):(1'h0)]) != ((wire10 <= wire8) || wire5)) ~^ ((wire3 ?
                              wire67 : wire9) ?
                          (8'hb2) : wire8[(2'h3):(1'h1)])));
  assign wire94 = $unsigned(((8'ha5) ^~ {((~&wire1) <<< $signed(wire1))}));
endmodule

module module69
#(parameter param90 = ((~^(^(~|((8'hbd) ? (8'hb5) : (8'ha3))))) ? (~((~&(|(8'ha0))) ? (((8'ha5) ? (8'ha5) : (8'haa)) ^~ ((8'had) ? (8'h9f) : (8'hb2))) : ((^~(8'had)) ? (8'ha4) : (^~(8'hb6))))) : (((((8'ha3) ? (8'ha1) : (8'hac)) ? ((7'h44) ? (8'ha5) : (8'hae)) : (!(8'hb9))) > {((8'h9c) << (8'ha6))}) ? {{((8'hba) ^ (8'hb1)), {(8'hb6), (8'had)}}} : ((((8'h9c) < (8'hb7)) == ((8'ha2) < (7'h40))) ? ({(8'hba), (8'h9f)} ? ((8'ha0) ? (8'hb0) : (7'h41)) : ((8'hb7) ? (8'hb9) : (8'ha6))) : (^((8'ha7) ? (7'h42) : (8'haa)))))))
(y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire74;
  input wire [(5'h12):(1'h0)] wire73;
  input wire [(4'ha):(1'h0)] wire72;
  input wire signed [(5'h12):(1'h0)] wire71;
  input wire signed [(3'h5):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire89;
  wire signed [(5'h14):(1'h0)] wire87;
  wire signed [(4'hf):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire75;
  assign y = {wire89, wire87, wire76, wire75, (1'h0)};
  assign wire75 = (wire73[(4'h9):(3'h6)] == ($signed(wire70) >> ($unsigned(wire73[(4'he):(3'h4)]) + {$signed(wire73)})));
  assign wire76 = $signed(((8'hb9) ?
                      $signed($signed({wire75,
                          wire70})) : wire75[(3'h4):(2'h3)]));
  module77 #() modinst88 (wire87, clk, wire75, wire71, wire76, wire73);
  assign wire89 = wire70[(2'h3):(1'h0)];
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire15;
  input wire [(4'h8):(1'h0)] wire14;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire signed [(3'h7):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire65;
  wire [(5'h13):(1'h0)] wire64;
  wire [(3'h4):(1'h0)] wire63;
  wire signed [(2'h3):(1'h0)] wire62;
  wire [(4'he):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire60;
  wire [(4'h8):(1'h0)] wire58;
  wire [(4'he):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire16;
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire58,
                 wire17,
                 wire16,
                 (1'h0)};
  assign wire16 = $unsigned($unsigned((^{$signed(wire12), (wire13 & wire14)})));
  assign wire17 = wire15;
  module18 #() modinst59 (wire58, clk, wire14, wire17, wire16, wire12);
  assign wire60 = $unsigned(((({wire15} >= (~&wire14)) ?
                          $unsigned(wire14) : $signed(wire15)) ?
                      {wire17, wire12} : (|wire12[(2'h2):(1'h0)])));
  assign wire61 = (^~$signed(wire16));
  assign wire62 = {$signed(wire15[(3'h5):(1'h0)])};
  assign wire63 = wire14;
  assign wire64 = ($unsigned((~wire17[(4'hb):(4'hb)])) & (8'hb4));
  assign wire65 = ($unsigned((wire61[(4'hc):(4'hc)] ?
                          (~^wire12[(2'h3):(1'h0)]) : $signed((wire17 ?
                              wire62 : (8'hac))))) ?
                      $unsigned($signed((~wire58[(2'h2):(1'h0)]))) : (wire16 ?
                          $signed(((wire17 != wire61) == (wire17 - wire17))) : (wire62 && {wire63[(1'h0):(1'h0)]})));
  assign wire66 = (^~{wire63, wire62[(1'h1):(1'h0)]});
endmodule

module module18
#(parameter param56 = (+(((~^(~^(8'h9c))) - (^(8'ha4))) >> ((((8'haa) ? (8'hab) : (8'h9d)) ? ((8'hac) ? (8'h9f) : (8'hbf)) : (~|(8'ha0))) << (~^{(8'hb8), (7'h44)})))), 
parameter param57 = param56)
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire22;
  input wire signed [(4'hd):(1'h0)] wire21;
  input wire signed [(4'hc):(1'h0)] wire20;
  input wire signed [(3'h7):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire25;
  wire [(4'hd):(1'h0)] wire24;
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg40,
                 reg39,
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
                 reg23,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg23 <= wire22[(2'h3):(2'h3)];
    end
  assign wire24 = {((!(&{reg23, wire22})) ?
                          wire21[(2'h2):(2'h2)] : (!$signed($signed(wire20)))),
                      (wire21 ?
                          $signed(wire20) : ((wire22[(1'h1):(1'h0)] >> (^(8'ha9))) ^~ wire21[(2'h3):(1'h0)]))};
  assign wire25 = (wire24[(3'h5):(2'h3)] ?
                      (~^$unsigned($unsigned(wire22))) : wire22);
  assign wire26 = $unsigned($signed({wire24[(2'h3):(1'h0)]}));
  assign wire27 = {$signed($unsigned((~&(reg23 ^ wire25)))),
                      {wire25[(4'ha):(2'h3)]}};
  always
    @(posedge clk) begin
      if ($signed((wire24 < ((-$signed(wire19)) | ($signed(wire19) ?
          wire24 : (|wire21))))))
        begin
          reg28 <= wire19[(3'h5):(3'h5)];
          reg29 <= (wire27 ?
              ({((~&(8'hb2)) ? $unsigned(reg23) : {(8'hbc), wire25}),
                  wire22[(3'h5):(1'h0)]} ^ $signed($unsigned(wire22))) : $unsigned(wire26));
          reg30 <= $signed((wire19 ?
              $unsigned((~(wire22 ?
                  reg23 : (8'ha8)))) : wire27[(3'h5):(1'h1)]));
        end
      else
        begin
          reg28 <= (~|$unsigned((reg28 <<< ($unsigned(wire22) ?
              (~^reg29) : $unsigned((8'hb8))))));
          reg29 <= wire20;
          if (wire19[(2'h2):(2'h2)])
            begin
              reg30 <= $signed($unsigned((wire20[(1'h0):(1'h0)] <<< $signed($unsigned(wire20)))));
            end
          else
            begin
              reg30 <= $signed(($unsigned(wire27[(3'h5):(3'h4)]) >> reg29[(4'h8):(2'h2)]));
            end
          if ($signed((^~({wire22[(2'h3):(1'h0)]} ?
              (8'ha4) : (~|(wire20 ~^ wire26))))))
            begin
              reg31 <= (^~($unsigned($signed(wire27[(4'hc):(2'h2)])) >= $signed($unsigned((wire22 && reg30)))));
              reg32 <= $unsigned({wire26, (+(reg29 ? $signed(reg31) : reg30))});
              reg33 <= reg31;
              reg34 <= ((((^reg30[(3'h4):(1'h0)]) ?
                      $signed((wire21 ?
                          reg33 : wire25)) : wire24[(4'hb):(1'h1)]) ?
                  reg31[(1'h0):(1'h0)] : (~^{wire27[(4'hc):(4'hb)],
                      (~^reg32)})) + (-$unsigned($signed(((8'ha6) | wire25)))));
              reg35 <= $unsigned(reg32[(3'h7):(2'h2)]);
            end
          else
            begin
              reg31 <= reg28;
              reg32 <= $unsigned(wire20[(4'hb):(4'h8)]);
              reg33 <= reg34;
              reg34 <= ($unsigned(((reg32[(4'hd):(4'hc)] >>> (wire20 << wire20)) ~^ ((reg35 ?
                  wire20 : reg29) >= (~^reg23)))) >>> reg30[(3'h6):(3'h4)]);
            end
          if ((($signed((~^wire19[(3'h6):(2'h3)])) ?
                  $unsigned(wire25[(4'h8):(3'h6)]) : ((~|{wire24}) <= wire22[(4'h8):(2'h2)])) ?
              (($unsigned((wire21 ? wire20 : (8'hbf))) ?
                      ((~(8'ha7)) >>> (wire25 ?
                          reg23 : wire25)) : wire20[(3'h4):(1'h1)]) ?
                  $signed(($signed(reg23) | reg34[(2'h3):(2'h2)])) : $signed((wire25 ?
                      $unsigned(wire19) : $signed((8'ha1))))) : reg33))
            begin
              reg36 <= (({wire19} ?
                  $signed(wire27[(4'h9):(1'h0)]) : (wire27 ?
                      wire24 : reg35[(3'h4):(3'h4)])) <<< {((~|((8'ha6) == reg30)) ^ (~^$signed(wire27)))});
              reg37 <= (!reg34);
            end
          else
            begin
              reg36 <= (^~$signed(({(wire24 ?
                      reg30 : wire21)} - $signed($unsigned(wire22)))));
              reg37 <= ((7'h40) != $unsigned(reg32));
            end
        end
      reg38 <= $unsigned(reg28[(3'h4):(3'h4)]);
      reg39 <= reg32;
      reg40 <= ($unsigned((~&reg36)) ~^ $signed($signed(wire21)));
    end
  assign wire41 = reg31;
  assign wire42 = $unsigned($unsigned({((reg30 & wire41) << (reg34 == wire26)),
                      {{reg23}}}));
  assign wire43 = (8'ha2);
  assign wire44 = ((~^reg23[(3'h4):(1'h0)]) >> ((&(wire41[(1'h0):(1'h0)] ?
                          $signed(wire42) : {wire22})) ?
                      $signed(wire25[(4'hd):(1'h1)]) : (-(wire19[(2'h3):(2'h2)] ?
                          wire41[(3'h4):(1'h1)] : {wire21}))));
  assign wire45 = {((reg28[(3'h5):(1'h1)] + reg39) ?
                          $signed(($unsigned(reg23) < (+wire43))) : (wire41[(4'h9):(2'h2)] ?
                              wire43[(3'h4):(1'h1)] : $unsigned($signed(reg29)))),
                      reg37[(4'hb):(4'hb)]};
  always
    @(posedge clk) begin
      reg46 <= wire21;
      reg47 <= $unsigned({$unsigned(($signed((8'h9f)) ?
              wire24[(4'h8):(4'h8)] : $signed((8'ha5))))});
      if ((+$unsigned({(reg46 ? $unsigned(wire44) : (reg23 != wire19))})))
        begin
          reg48 <= (reg35 ?
              (|reg47[(4'h9):(3'h7)]) : ($unsigned(reg35) - (wire19 + (|((8'hb6) & wire27)))));
          reg49 <= (^wire24[(4'h9):(4'h9)]);
          reg50 <= $signed({{((reg30 ? wire19 : wire43) ?
                      (reg40 < reg29) : (reg48 > reg32)),
                  {reg34}}});
          if ($signed(($signed(((reg40 ?
              wire24 : (8'hb3)) * wire44)) <= $unsigned({reg48[(3'h4):(1'h0)]}))))
            begin
              reg51 <= $unsigned($signed((~&(reg34[(1'h0):(1'h0)] ?
                  $unsigned(reg37) : (wire22 ? reg32 : reg50)))));
              reg52 <= (^~(|reg49));
              reg53 <= (reg32[(4'ha):(3'h6)] ? {wire43} : reg31);
            end
          else
            begin
              reg51 <= $signed((~|$signed((8'hbd))));
              reg52 <= $unsigned((-reg40));
            end
        end
      else
        begin
          reg48 <= $signed($signed(((8'hb2) ^~ (reg34 | ((7'h43) != reg30)))));
        end
    end
  assign wire54 = wire26[(4'hb):(3'h7)];
  assign wire55 = reg39;
endmodule

module module77  (y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire81;
  input wire [(5'h12):(1'h0)] wire80;
  input wire signed [(4'hf):(1'h0)] wire79;
  input wire [(5'h12):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire86;
  wire signed [(3'h4):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire84;
  wire signed [(4'he):(1'h0)] wire83;
  wire signed [(3'h6):(1'h0)] wire82;
  assign y = {wire86, wire85, wire84, wire83, wire82, (1'h0)};
  assign wire82 = wire81[(4'hb):(1'h1)];
  assign wire83 = (((!({(8'hba), wire82} ?
                      wire82 : $signed(wire79))) || (wire82 ?
                      (~^$unsigned(wire78)) : $signed((&wire82)))) - wire78);
  assign wire84 = ((-((&$unsigned(wire81)) >>> $unsigned(wire81))) <= ($unsigned((~&(wire83 ?
                      wire80 : wire82))) ^ (!$unsigned((wire80 >= wire79)))));
  assign wire85 = ($signed((((|(8'h9e)) ?
                          (wire84 < wire78) : $unsigned(wire83)) ?
                      (|wire81) : (^wire84[(4'h8):(2'h2)]))) == (~|$unsigned(($unsigned(wire81) >>> ((8'ha0) < (8'hb7))))));
  assign wire86 = (8'hab);
endmodule
