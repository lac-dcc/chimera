module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire86;
  wire [(2'h3):(1'h0)] wire85;
  wire signed [(5'h14):(1'h0)] wire84;
  wire signed [(3'h4):(1'h0)] wire83;
  wire signed [(4'he):(1'h0)] wire81;
  wire signed [(5'h12):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire81,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire5,
                 wire4,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (~^$unsigned((~^(+$signed(wire3)))));
  assign wire5 = {wire0[(4'he):(4'hc)]};
  always
    @(posedge clk) begin
      if (((-$signed($unsigned(wire1))) ?
          $unsigned((-(-wire3[(4'h8):(3'h5)]))) : (wire2[(3'h6):(1'h1)] ?
              wire4[(4'ha):(4'h9)] : ((~&wire2) ?
                  $unsigned((wire5 ? wire5 : wire3)) : wire1))))
        begin
          reg6 <= ({($signed($unsigned(wire1)) ? wire3 : (^{(7'h40), wire5})),
              wire1} ~^ (wire2[(2'h3):(2'h3)] > $signed($signed((wire2 ?
              wire0 : wire2)))));
          reg7 <= {($unsigned({{(8'hb0), wire5}, wire1[(4'ha):(4'ha)]}) ?
                  (8'hbb) : (($unsigned(reg6) == wire5[(1'h1):(1'h1)]) >= $signed($signed(wire2)))),
              (((wire5 ? wire3 : (reg6 ? wire4 : wire5)) && ((~|wire1) ?
                  wire1[(5'h13):(4'ha)] : (wire4 >> wire5))) * (-reg6[(4'h8):(1'h1)]))};
          reg8 <= $unsigned(wire3);
          reg9 <= reg8[(2'h2):(2'h2)];
        end
      else
        begin
          reg6 <= (~($unsigned(wire5) << $signed((wire4 ?
              (reg9 <= wire0) : wire5[(1'h0):(1'h0)]))));
          reg7 <= (wire5[(2'h2):(1'h0)] < (^~wire1[(2'h3):(1'h1)]));
          if ({((($unsigned(wire0) ^ reg7) > $unsigned((wire3 ?
                      (8'ha3) : reg8))) ?
                  reg8[(4'hb):(2'h3)] : (+{((8'hb5) ? wire2 : reg8),
                      $signed(wire2)}))})
            begin
              reg8 <= {(reg6[(4'ha):(3'h7)] + {reg7,
                      (wire5[(2'h2):(1'h1)] ?
                          ((8'ha5) && reg6) : (reg8 ? reg8 : reg9))}),
                  (!{wire4, (~wire0)})};
              reg9 <= reg7[(2'h3):(2'h2)];
            end
          else
            begin
              reg8 <= $signed((((~^(wire0 ?
                  wire4 : wire5)) ^ ((wire0 >>> wire5) && $unsigned(reg7))) >>> ({(wire5 >>> reg9),
                      $signed(reg8)} ?
                  ((reg8 >> (8'ha5)) - ((7'h44) ?
                      wire1 : wire4)) : {$signed(wire3)})));
              reg9 <= (wire0[(1'h0):(1'h0)] ? wire3 : reg6[(4'h8):(1'h1)]);
              reg10 <= $unsigned((-$unsigned($unsigned((wire3 ?
                  wire2 : wire4)))));
              reg11 <= wire3[(4'he):(4'he)];
            end
          reg12 <= wire2;
        end
    end
  assign wire13 = ($signed(reg9) ?
                      wire5 : ($unsigned(reg10[(3'h7):(3'h6)]) ^ (wire2 - (&wire5[(1'h0):(1'h0)]))));
  assign wire14 = {reg12[(3'h4):(1'h1)]};
  assign wire15 = ($signed((wire13 ?
                      ((+reg6) ?
                          (wire13 ^ reg7) : ((8'ha4) - reg6)) : (|wire14))) ~^ {$signed(((8'h9c) ?
                          (wire13 || wire13) : $unsigned(wire2))),
                      reg8[(3'h4):(1'h0)]});
  assign wire16 = $signed((~&wire0));
  assign wire17 = ($signed($unsigned(({(8'hba), reg8} ?
                      wire1 : (8'hb1)))) == {$signed(wire15)});
  module18 #() modinst82 (wire81, clk, wire5, wire16, wire17, wire13);
  assign wire83 = ((wire17[(5'h10):(3'h6)] <= (~(!(reg11 ?
                      wire2 : reg8)))) + {$unsigned({((8'hbb) ?
                              wire3 : wire4)})});
  assign wire84 = $unsigned($signed(wire14));
  assign wire85 = reg6;
  assign wire86 = ($unsigned(($signed((+(8'ha1))) <= ((~reg12) ?
                      (+wire0) : (-wire83)))) <<< wire17[(2'h3):(2'h2)]);
endmodule

module module18  (y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire22;
  input wire signed [(3'h5):(1'h0)] wire21;
  input wire [(5'h11):(1'h0)] wire20;
  input wire [(5'h10):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire80;
  wire [(4'hf):(1'h0)] wire79;
  wire [(5'h14):(1'h0)] wire78;
  wire [(4'hc):(1'h0)] wire77;
  wire [(2'h3):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire75,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
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
                 (1'h0)};
  assign wire23 = $unsigned($signed((wire22 ?
                      $unsigned($signed((8'h9e))) : (&(!wire22)))));
  assign wire24 = {$unsigned(wire19)};
  assign wire25 = $signed(({($signed(wire20) == $signed(wire21))} ?
                      {$unsigned({wire19, (8'hb7)})} : (|wire23)));
  assign wire26 = wire20;
  always
    @(posedge clk) begin
      if ({{wire19[(5'h10):(5'h10)]}, wire19[(4'hf):(4'hf)]})
        begin
          reg27 <= $signed((wire19[(4'h9):(3'h7)] > wire26[(1'h1):(1'h0)]));
          reg28 <= ((|((^~$signed((8'hb8))) ?
              (wire23[(3'h5):(3'h4)] >>> wire26) : reg27)) >= $signed(wire20));
        end
      else
        begin
          if (wire22)
            begin
              reg27 <= ((wire23 ?
                  wire24[(1'h1):(1'h1)] : ($unsigned({reg28,
                      wire24}) | $unsigned(wire26[(3'h4):(2'h2)]))) <<< $signed(($unsigned(wire22[(4'ha):(4'ha)]) ?
                  $signed((wire20 ? reg28 : wire25)) : (&(+reg28)))));
            end
          else
            begin
              reg27 <= $signed(wire19[(4'hd):(1'h0)]);
              reg28 <= $unsigned($unsigned(reg28));
            end
          reg29 <= (^$unsigned($signed((wire20 && (wire22 == reg27)))));
        end
      reg30 <= reg29[(3'h4):(1'h0)];
    end
  always
    @(posedge clk) begin
      if (($signed(wire19) || $unsigned((^{(wire22 ? reg29 : (8'hb0))}))))
        begin
          if (wire25[(4'hb):(4'h8)])
            begin
              reg31 <= reg29;
              reg32 <= wire25;
              reg33 <= wire19[(4'h9):(3'h5)];
              reg34 <= wire19[(3'h6):(1'h1)];
            end
          else
            begin
              reg31 <= (({({reg29, wire26} && ((7'h44) ?
                          reg27 : (8'hb3)))} + $signed({(8'h9d),
                      reg28[(1'h1):(1'h1)]})) ?
                  wire24 : wire25);
              reg32 <= reg29[(4'hd):(3'h7)];
              reg33 <= ((reg28[(2'h3):(1'h0)] && (wire26 ?
                  ((reg34 > wire26) & (~wire25)) : {(wire19 ? wire20 : (8'ha9)),
                      (wire21 ?
                          reg32 : (8'ha9))})) == $signed((~((reg34 ^~ wire22) ?
                  reg28[(3'h4):(3'h4)] : (~^reg29)))));
              reg34 <= reg29[(4'h8):(3'h5)];
            end
        end
      else
        begin
          reg31 <= (8'hb6);
          reg32 <= ((^~$signed($unsigned(reg29))) ?
              reg33 : (reg28 ?
                  (~|$unsigned(wire22[(4'ha):(2'h3)])) : {wire26,
                      (reg28 ? (8'haa) : $unsigned(reg33))}));
          if ({wire24[(4'h8):(3'h7)]})
            begin
              reg33 <= (wire25[(4'h8):(1'h1)] ?
                  wire24 : ($signed($unsigned((reg27 ? wire24 : (8'hbf)))) ?
                      (^$unsigned($unsigned(wire19))) : reg28));
              reg34 <= ($unsigned(reg27[(1'h0):(1'h0)]) | ($signed({((8'h9f) ?
                      reg28 : wire19),
                  wire24[(1'h0):(1'h0)]}) & (wire21[(1'h1):(1'h0)] - ($unsigned(wire22) <<< {wire25,
                  (8'hb0)}))));
              reg35 <= $signed($signed((((-wire23) & ((8'hbd) ?
                  reg29 : reg28)) * $signed($signed(wire19)))));
              reg36 <= ($signed((~(reg32[(2'h2):(1'h0)] > (wire25 ?
                  (8'haa) : wire21)))) <= ($unsigned((~^(wire26 ~^ reg28))) ?
                  reg33 : $signed((!$unsigned(wire20)))));
              reg37 <= ((8'haf) ^~ ($signed(reg35) >>> (reg34[(2'h3):(2'h2)] && (wire25[(4'hb):(4'h8)] ?
                  (reg31 ? reg36 : reg30) : (~^wire19)))));
            end
          else
            begin
              reg33 <= $signed(reg35);
            end
          reg38 <= $unsigned(wire24[(5'h11):(4'hf)]);
        end
      reg39 <= $signed(wire23[(4'h8):(3'h4)]);
    end
  module40 #() modinst76 (wire75, clk, wire23, reg27, wire22, reg28, reg34);
  assign wire77 = $unsigned((|(wire26[(1'h1):(1'h1)] | reg37[(1'h1):(1'h1)])));
  assign wire78 = (~^(reg35 ?
                      (~wire24) : $signed((wire77[(3'h7):(1'h1)] ~^ (wire20 < wire21)))));
  assign wire79 = wire22;
  assign wire80 = $unsigned({$unsigned(reg29),
                      {($unsigned(wire19) ^~ reg30[(4'hb):(1'h0)]),
                          (reg39 ? (&wire24) : {reg32, (8'hb7)})}});
endmodule

module module40
#(parameter param74 = ((((((7'h41) ~^ (8'ha1)) == ((8'hab) ? (8'h9d) : (8'hac))) ? {((7'h41) >> (8'hb2)), ((8'haf) ? (8'ha9) : (8'hb0))} : ({(8'hb8)} ~^ ((8'h9c) ? (7'h40) : (8'hb0)))) * {(((8'ha4) ? (8'ha1) : (8'hb1)) < ((8'hbf) ? (8'hb6) : (8'haf)))}) ? {(^~(~|(^(7'h40))))} : (!((^(^(8'hb9))) ? (((8'h9c) ~^ (8'ha6)) ^ (!(8'hb4))) : (|(!(8'h9d)))))))
(y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire45;
  input wire [(5'h13):(1'h0)] wire44;
  input wire signed [(4'he):(1'h0)] wire43;
  input wire [(4'hc):(1'h0)] wire42;
  input wire signed [(3'h5):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire73;
  wire [(5'h12):(1'h0)] wire72;
  wire [(5'h13):(1'h0)] wire71;
  wire signed [(5'h11):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire56;
  wire [(3'h4):(1'h0)] wire55;
  wire signed [(4'he):(1'h0)] wire54;
  wire [(3'h7):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire52;
  wire signed [(4'hc):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire49;
  wire [(4'h8):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire46;
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
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
                 (1'h0)};
  assign wire46 = ({$unsigned((^~(~^(8'hb1)))),
                          ((wire43[(4'h8):(2'h2)] >= {wire45, wire43}) ?
                              (!$unsigned(wire41)) : wire43[(4'hd):(3'h4)])} ?
                      wire42[(1'h0):(1'h0)] : $unsigned((!wire41)));
  assign wire47 = wire43[(3'h5):(2'h3)];
  assign wire48 = wire46;
  assign wire49 = (-$signed(wire41[(1'h1):(1'h0)]));
  assign wire50 = ($unsigned({wire48}) >> ((((^wire41) - $unsigned(wire45)) <= (8'ha4)) ?
                      $unsigned((^(wire41 != wire44))) : $unsigned($signed((wire45 ?
                          wire44 : wire48)))));
  assign wire51 = $signed(wire43[(4'hb):(3'h5)]);
  assign wire52 = wire51[(4'h9):(4'h9)];
  assign wire53 = $signed((!$unsigned(wire44[(4'he):(1'h1)])));
  assign wire54 = wire50[(2'h3):(2'h3)];
  assign wire55 = $unsigned(wire49);
  assign wire56 = (wire54 ?
                      wire48[(1'h0):(1'h0)] : $signed(($signed($unsigned(wire52)) ?
                          wire41[(3'h5):(2'h3)] : $signed((^~wire52)))));
  assign wire57 = (!{wire45});
  always
    @(posedge clk) begin
      reg58 <= wire44;
      if (wire42)
        begin
          reg59 <= ($signed(wire42) ?
              wire51[(2'h3):(1'h1)] : (($unsigned(reg58) ?
                  $unsigned((^wire57)) : wire54) * (&wire51)));
          reg60 <= {$signed((|wire41[(3'h5):(2'h3)])),
              (~&($unsigned({reg59}) ?
                  (wire44[(4'h9):(3'h5)] ?
                      wire46[(3'h5):(2'h2)] : reg59) : $signed(wire41)))};
          reg61 <= wire43[(4'hb):(3'h7)];
          reg62 <= $unsigned((wire42 ?
              $unsigned((wire43 & $unsigned(wire54))) : $signed((~^wire50))));
          reg63 <= (^~{$signed(({wire51} ?
                  wire52[(3'h7):(3'h6)] : {wire56, (8'h9d)}))});
        end
      else
        begin
          reg59 <= ((($unsigned(reg60) ?
                  {wire53[(1'h1):(1'h0)],
                      wire52[(2'h2):(1'h0)]} : ($unsigned((8'haf)) ?
                      reg59 : (wire52 <<< wire47))) | wire55) ?
              (wire47[(2'h3):(2'h3)] >>> $signed(({reg59} || (-wire57)))) : wire47);
          reg60 <= $signed($unsigned(wire47[(3'h5):(1'h1)]));
          reg61 <= {$signed($signed(($unsigned(wire44) && reg60[(2'h2):(1'h1)])))};
          reg62 <= ((|($unsigned(reg61) <= ($unsigned(wire41) > reg58[(4'hb):(1'h0)]))) >= ((~&(^wire42[(4'hb):(1'h1)])) ?
              {reg59[(2'h2):(1'h0)], (+(~|wire50))} : reg60));
        end
      if ($signed((~^$signed(reg61[(3'h6):(1'h1)]))))
        begin
          reg64 <= ((^wire55[(2'h2):(1'h0)]) >= (^~(8'had)));
          reg65 <= wire50;
        end
      else
        begin
          reg64 <= {(~|reg64[(1'h0):(1'h0)]),
              (wire57 >>> wire51[(4'hb):(3'h7)])};
          reg65 <= (({((wire52 ?
                      wire55 : wire47) + $signed(wire47))} & $unsigned(((wire57 != wire44) ?
                  wire48 : (reg59 ? wire46 : (8'hbb))))) ?
              wire41[(2'h3):(1'h1)] : $unsigned(($signed(reg58[(1'h0):(1'h0)]) || wire42)));
          reg66 <= (~|(reg65[(4'hb):(1'h1)] < (reg59 ?
              wire43 : $unsigned($signed(reg63)))));
          reg67 <= $unsigned(wire44[(4'ha):(2'h2)]);
        end
      reg68 <= wire46[(2'h3):(1'h0)];
      reg69 <= $signed(reg59);
    end
  assign wire70 = (reg69 != {reg68, {reg67[(1'h0):(1'h0)]}});
  assign wire71 = $signed($unsigned(((wire49[(1'h1):(1'h0)] ?
                      (reg59 ^ wire45) : wire57[(3'h7):(2'h3)]) >> reg63)));
  assign wire72 = (wire42 ?
                      ($unsigned($signed((+(8'hb8)))) ?
                          $unsigned((((8'ha0) >>> reg61) ?
                              $signed(wire42) : wire43[(3'h7):(3'h7)])) : ($signed((-wire49)) ?
                              ($signed(reg58) ?
                                  {wire45,
                                      reg59} : wire49) : ((wire47 << wire56) * (!wire45)))) : wire52);
  assign wire73 = reg60;
endmodule
