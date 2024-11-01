module top
#(parameter param79 = (7'h44))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire77;
  wire [(4'hd):(1'h0)] wire76;
  wire signed [(4'hf):(1'h0)] wire75;
  wire signed [(4'h8):(1'h0)] wire74;
  wire signed [(4'h9):(1'h0)] wire72;
  wire [(5'h15):(1'h0)] wire5;
  assign y = {wire78, wire77, wire76, wire75, wire74, wire72, wire5, (1'h0)};
  assign wire5 = (^(($unsigned((-wire4)) ?
                         wire3[(2'h2):(1'h0)] : ((wire3 && wire4) + (wire2 ?
                             wire0 : wire1))) ?
                     (((wire0 >= wire4) ^ (wire2 ? (7'h41) : wire3)) ?
                         $unsigned((wire1 < wire0)) : $unsigned({wire2})) : wire4[(3'h4):(2'h3)]));
  module6 #() modinst73 (wire72, clk, wire0, wire5, wire1, wire2);
  assign wire74 = $unsigned(wire72[(3'h7):(3'h6)]);
  assign wire75 = (~$unsigned(($signed({wire3,
                      wire72}) && {((8'h9f) ~^ (8'hac)),
                      wire5[(4'h9):(1'h1)]})));
  assign wire76 = {wire4[(4'h8):(3'h4)]};
  assign wire77 = (wire1[(2'h3):(1'h0)] | $unsigned(wire5[(5'h12):(2'h2)]));
  assign wire78 = (($signed($unsigned(wire0[(3'h5):(1'h0)])) ^~ $unsigned(($signed(wire75) ?
                          wire74 : (+(8'hbf))))) ?
                      wire3 : wire4);
endmodule

module module6
#(parameter param71 = (~(((7'h40) ? (8'ha6) : (((8'hb8) ^~ (8'hbf)) ? {(8'ha0)} : (+(8'ha1)))) ? (+(+((8'ha3) <<< (8'hb3)))) : ((&(~|(8'h9d))) ? {((8'hab) ? (8'ha8) : (8'ha3))} : (~((8'hae) & (8'h9e)))))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(3'h6):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire69;
  wire [(4'hc):(1'h0)] wire47;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire50;
  wire [(3'h7):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire67;
  assign y = {wire70,
                 wire69,
                 wire47,
                 wire11,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire67,
                 (1'h0)};
  assign wire11 = (((($unsigned(wire9) - (wire7 ?
                          (7'h40) : wire8)) * wire9[(4'h8):(1'h0)]) ?
                      (((wire10 ?
                          wire7 : wire9) <= wire7[(1'h1):(1'h1)]) + (&wire7[(3'h5):(1'h0)])) : $signed(($unsigned(wire7) ?
                          (wire10 >> wire10) : $unsigned(wire7)))) + {{{wire7},
                          ($signed(wire8) ?
                              (wire9 ? wire8 : wire8) : {wire8})}});
  module12 #() modinst48 (.wire13(wire10), .clk(clk), .wire15(wire8), .wire14(wire11), .wire16(wire7), .y(wire47), .wire17(wire9));
  assign wire49 = (+$signed(($unsigned($signed(wire7)) ?
                      wire47 : ({wire10, wire7} ?
                          $signed(wire8) : $signed((8'hbe))))));
  assign wire50 = ((!$signed((8'hac))) ?
                      $unsigned(wire9[(4'hb):(1'h1)]) : (wire11 ?
                          wire11 : (~$signed((!wire8)))));
  assign wire51 = ((^{$signed((8'hb3)), $unsigned((8'hb1))}) ?
                      ((($signed(wire9) ?
                          $signed(wire49) : wire11) | ($unsigned(wire47) & $unsigned((8'hb2)))) >> (~{wire9[(5'h13):(4'ha)],
                          (+wire49)})) : wire50);
  assign wire52 = {($unsigned(((&wire47) ?
                              $signed(wire49) : (wire51 & wire10))) ?
                          $signed((wire11 ?
                              $signed(wire47) : (^wire47))) : (($signed(wire7) ?
                                  $unsigned(wire49) : (wire51 ?
                                      wire7 : wire51)) ?
                              (^~$signed(wire49)) : $signed(wire11)))};
  module53 #() modinst68 (wire67, clk, wire49, wire52, wire11, wire50, wire10);
  assign wire69 = wire7[(2'h2):(2'h2)];
  assign wire70 = {$unsigned(wire51)};
endmodule

module module53
#(parameter param66 = (+((-(((8'h9d) ? (8'hb5) : (8'h9d)) ? {(8'hb1), (8'ha8)} : ((8'h9e) & (7'h42)))) ^~ (+{{(8'hbe), (8'hae)}, (~^(8'hb6))}))))
(y, clk, wire58, wire57, wire56, wire55, wire54);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire58;
  input wire [(2'h2):(1'h0)] wire57;
  input wire [(5'h15):(1'h0)] wire56;
  input wire [(2'h2):(1'h0)] wire55;
  input wire [(5'h14):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire65;
  wire [(3'h5):(1'h0)] wire64;
  wire [(4'hf):(1'h0)] wire63;
  wire [(5'h14):(1'h0)] wire62;
  wire [(2'h3):(1'h0)] wire61;
  wire [(4'he):(1'h0)] wire60;
  wire signed [(3'h5):(1'h0)] wire59;
  assign y = {wire65, wire64, wire63, wire62, wire61, wire60, wire59, (1'h0)};
  assign wire59 = {(-$signed({(wire55 >>> (8'hb8))})), wire57};
  assign wire60 = (~(&wire57[(1'h1):(1'h1)]));
  assign wire61 = wire54[(4'hd):(3'h6)];
  assign wire62 = $signed({$signed((8'ha1)),
                      ($signed(wire59[(1'h0):(1'h0)]) ?
                          wire54[(5'h12):(4'hc)] : ($signed((8'hbf)) ?
                              $signed((8'hb7)) : $unsigned(wire58)))});
  assign wire63 = (($unsigned((|{wire62})) * ($unsigned((~&wire54)) ?
                      wire56[(5'h11):(3'h4)] : ((wire57 ?
                          wire56 : wire57) == wire62))) >>> (8'h9d));
  assign wire64 = wire61[(1'h0):(1'h0)];
  assign wire65 = (((+((^(8'h9d)) & wire61)) ?
                          {$signed(wire56[(4'hf):(4'h8)]),
                              $signed(wire56[(3'h7):(3'h4)])} : $unsigned(wire63)) ?
                      (wire55 <<< {((&wire60) < (~&wire61)),
                          wire55[(1'h0):(1'h0)]}) : ($unsigned($signed((^~wire63))) <= $signed(((&wire62) ?
                          (wire54 ? wire64 : wire56) : (wire54 ?
                              wire55 : wire64)))));
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire17;
  input wire [(4'h9):(1'h0)] wire16;
  input wire [(3'h6):(1'h0)] wire15;
  input wire [(4'hb):(1'h0)] wire14;
  input wire [(3'h5):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire45;
  wire signed [(5'h12):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire43;
  wire signed [(4'h9):(1'h0)] wire42;
  wire [(4'hc):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire19;
  wire [(4'h9):(1'h0)] wire18;
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
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
                 (1'h0)};
  assign wire18 = (~&$signed(((&(wire13 - wire15)) ?
                      wire14[(3'h4):(2'h3)] : wire16[(3'h7):(3'h7)])));
  assign wire19 = ((+($unsigned((wire15 ?
                      wire18 : wire17)) - (-{wire13}))) < wire13[(1'h1):(1'h1)]);
  assign wire20 = wire17[(2'h2):(1'h1)];
  assign wire21 = {$unsigned(wire17[(1'h0):(1'h0)]),
                      (~$unsigned($signed(wire17[(2'h2):(1'h0)])))};
  assign wire22 = (wire17[(1'h1):(1'h1)] <= (+(wire14[(4'hb):(3'h6)] ?
                      ($unsigned(wire15) ?
                          wire16 : wire15[(3'h4):(2'h2)]) : wire16[(1'h1):(1'h0)])));
  assign wire23 = {(wire13[(1'h0):(1'h0)] ?
                          ((wire17 == (+(8'ha4))) && wire14[(4'h8):(3'h4)]) : ((wire21 ?
                                  (~&wire17) : $unsigned(wire17)) ?
                              (!wire17[(2'h2):(1'h1)]) : (~&wire15))),
                      wire14[(3'h6):(2'h3)]};
  assign wire24 = $unsigned((8'hb9));
  always
    @(posedge clk) begin
      if (wire13)
        begin
          reg25 <= (wire21[(5'h11):(2'h3)] ?
              wire17 : $signed(((~|$signed(wire20)) ?
                  (8'hb3) : (-wire13[(3'h5):(1'h1)]))));
          reg26 <= (({$unsigned((wire19 < wire16)),
                  (wire19[(2'h2):(2'h2)] ?
                      wire15[(3'h5):(2'h2)] : $unsigned((7'h43)))} ~^ $unsigned($signed(wire21[(4'h9):(1'h0)]))) ?
              (wire17[(1'h1):(1'h0)] ?
                  (+wire14[(4'h9):(3'h6)]) : ({wire24[(4'hd):(2'h2)],
                      (wire17 << wire17)} ^ {(!wire19),
                      (&wire20)})) : (~|(^(&(|wire18)))));
          reg27 <= wire22;
          if (((^(^~$signed(wire20[(3'h6):(1'h0)]))) ^~ reg25))
            begin
              reg28 <= (8'hbe);
              reg29 <= $signed(({$signed((~|reg26))} ?
                  ({(8'ha6)} * {{wire20,
                          wire17}}) : (wire21[(3'h7):(2'h3)] == {(reg25 ?
                          wire14 : (8'hbb)),
                      wire23[(2'h3):(1'h0)]})));
              reg30 <= reg29[(1'h0):(1'h0)];
              reg31 <= $signed((($signed($signed(reg28)) ?
                      (!(!wire15)) : (wire18 != $signed(wire17))) ?
                  wire23[(4'hf):(4'h8)] : wire18));
            end
          else
            begin
              reg28 <= wire21[(4'hb):(4'ha)];
              reg29 <= {wire17[(1'h1):(1'h0)]};
            end
          if (wire23)
            begin
              reg32 <= ((-{(wire14 ? reg30[(1'h1):(1'h1)] : $unsigned(wire20)),
                      $unsigned((^~wire16))}) ?
                  wire14[(4'ha):(3'h7)] : $unsigned(reg27));
              reg33 <= ($signed((~(((8'ha7) ? reg27 : reg27) | (^wire24)))) ?
                  $unsigned({(8'hb1),
                      $signed($signed((8'haa)))}) : (|$unsigned((8'hbd))));
              reg34 <= ($unsigned((wire18[(4'h9):(2'h3)] ?
                  (-wire14) : wire18[(1'h1):(1'h1)])) << wire20[(1'h1):(1'h1)]);
              reg35 <= (~|(reg30 ?
                  (wire15 ?
                      {reg27[(3'h7):(3'h5)]} : ((reg33 ^ reg31) ?
                          $unsigned(reg33) : $signed(reg27))) : wire15[(2'h2):(1'h1)]));
            end
          else
            begin
              reg32 <= reg32[(4'he):(2'h2)];
              reg33 <= (~&$unsigned(((~$signed(wire19)) ^~ (!$signed(wire13)))));
              reg34 <= $unsigned((~^$unsigned((wire16[(3'h6):(2'h3)] >= $signed((8'ha1))))));
              reg35 <= {({reg35,
                          ((reg28 ~^ wire14) * ((8'hb3) ? reg25 : reg35))} ?
                      ((wire20 >= wire13) ?
                          reg26 : (reg27[(4'hb):(3'h4)] ?
                              $unsigned(reg27) : $signed(wire15))) : (^~$unsigned((reg35 ?
                          wire18 : wire19)))),
                  ($unsigned(($unsigned(wire17) << ((8'hac) ?
                          (7'h43) : wire19))) ?
                      wire13 : wire13[(2'h2):(1'h1)])};
            end
        end
      else
        begin
          reg25 <= (~^reg32[(4'hc):(3'h5)]);
        end
      reg36 <= reg34[(5'h10):(1'h0)];
      reg37 <= {wire15[(3'h6):(3'h4)]};
    end
  assign wire38 = $signed(wire13);
  assign wire39 = ($unsigned((~^$unsigned((reg35 & reg37)))) ?
                      $unsigned((-$unsigned($signed((8'hb6))))) : {{((reg32 ?
                                  reg30 : wire16) ^~ (reg29 >>> (8'hae)))},
                          $signed($unsigned($unsigned(wire18)))});
  assign wire40 = (8'h9f);
  assign wire41 = (reg26[(4'h9):(4'h8)] - reg31);
  assign wire42 = $signed({reg32, $signed(reg30[(3'h4):(2'h2)])});
  assign wire43 = (&wire24);
  assign wire44 = reg30[(3'h4):(2'h3)];
  assign wire45 = wire18;
  assign wire46 = $signed((!($signed((wire23 - wire23)) ?
                      ({(8'hb8), wire42} ?
                          $unsigned(reg33) : reg33) : ($signed((8'hae)) ?
                          (^wire44) : $unsigned(reg32)))));
endmodule
