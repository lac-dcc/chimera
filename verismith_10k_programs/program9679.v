module top
#(parameter param46 = {(-{(((8'hac) ? (8'h9f) : (8'ha4)) <<< ((8'ha1) ? (8'hb0) : (7'h43)))})})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h16b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire44;
  wire [(2'h3):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire33,
                 wire16,
                 wire15,
                 wire14,
                 wire11,
                 wire10,
                 wire7,
                 wire6,
                 wire5,
                 reg8,
                 reg9,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire5 = (-(wire4[(4'h9):(3'h7)] > (wire0[(5'h10):(4'h8)] <<< {$unsigned(wire3),
                     $unsigned(wire2)})));
  assign wire6 = wire5[(3'h4):(1'h0)];
  assign wire7 = wire0;
  always
    @(posedge clk) begin
      reg8 <= wire1[(3'h6):(3'h6)];
      reg9 <= (wire5 ?
          wire1 : (~&({$signed(wire7), $unsigned(wire5)} ?
              wire1[(2'h2):(1'h1)] : (8'hb0))));
    end
  assign wire10 = (~wire2);
  assign wire11 = {((8'hb8) ?
                          $signed(reg9[(4'he):(3'h4)]) : {(8'hb3),
                              ($signed(wire2) ~^ reg8[(2'h2):(2'h2)])}),
                      wire0[(4'h8):(3'h4)]};
  always
    @(posedge clk) begin
      reg12 <= (~|wire3);
      reg13 <= ($signed(wire3) & wire10);
    end
  assign wire14 = (($signed((&wire2)) | (!wire6[(5'h10):(4'h8)])) ?
                      reg9[(4'h9):(4'h8)] : $signed($unsigned((wire5 ?
                          reg13 : $signed(wire10)))));
  assign wire15 = (wire3[(1'h1):(1'h1)] << $signed(wire3));
  assign wire16 = (reg8 ~^ (~&($unsigned($unsigned((8'ha2))) ?
                      (wire10[(2'h3):(2'h2)] ?
                          reg8[(2'h3):(2'h2)] : (wire6 && reg13)) : ($signed(wire10) ?
                          $signed(reg8) : wire14))));
  module17 #() modinst34 (wire33, clk, wire14, wire7, wire0, wire5, reg8);
  assign wire35 = wire1;
  assign wire36 = ($unsigned((-reg13[(4'ha):(3'h6)])) ?
                      $unsigned(reg13[(4'h9):(3'h4)]) : (~|(wire1 ?
                          ($unsigned(wire11) <= ((8'hae) ^~ wire6)) : ((wire1 ?
                                  (8'hba) : wire6) ?
                              $unsigned(wire3) : wire11))));
  assign wire37 = ((reg13[(4'ha):(4'ha)] - (reg13 ?
                          wire15[(3'h6):(3'h6)] : wire0)) ?
                      ($unsigned(reg12[(1'h1):(1'h0)]) ?
                          ($signed($unsigned(wire10)) < {$unsigned((8'hbf)),
                              {reg13, (8'hb0)}}) : (reg8[(4'h8):(2'h3)] ?
                              ($unsigned(wire33) ?
                                  (reg8 || (8'ha7)) : (wire0 >>> wire36)) : wire6[(3'h6):(1'h0)])) : reg13);
  assign wire38 = {wire7[(2'h2):(1'h1)],
                      (~&$unsigned((wire7[(1'h0):(1'h0)] ?
                          reg12 : $signed(wire36))))};
  assign wire39 = $signed((!(wire11 - wire10)));
  assign wire40 = {($unsigned(reg12) << wire39[(3'h7):(2'h3)]),
                      (reg9[(3'h6):(2'h3)] ?
                          $unsigned(($signed(wire2) << (wire3 >= reg12))) : $unsigned($unsigned($signed((8'ha3)))))};
  assign wire41 = ($unsigned(((!$signed(wire16)) - $signed((wire2 ?
                      wire11 : wire0)))) <= $unsigned((reg9[(2'h2):(1'h0)] && reg8)));
  assign wire42 = (wire3[(1'h1):(1'h0)] >= wire2);
  assign wire43 = (~&{(+$unsigned(((8'hbc) ? wire1 : (8'hb7)))),
                      $unsigned($unsigned((wire0 ? wire36 : wire6)))});
  assign wire44 = wire35;
  assign wire45 = $unsigned(($unsigned((8'hac)) != {{wire41[(5'h14):(5'h10)]},
                      wire6[(1'h1):(1'h0)]}));
endmodule

module module17
#(parameter param32 = (-((~|{((8'hab) ? (7'h44) : (8'ha4))}) ? (&(+((8'hab) ? (8'hb2) : (8'h9e)))) : (8'had))))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire22;
  input wire signed [(4'hf):(1'h0)] wire21;
  input wire [(3'h5):(1'h0)] wire20;
  input wire [(5'h12):(1'h0)] wire19;
  input wire signed [(4'h8):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire23;
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 (1'h0)};
  assign wire23 = wire21[(4'h9):(4'h8)];
  assign wire24 = wire19[(3'h7):(3'h6)];
  assign wire25 = {(wire20 ?
                          $signed(wire23[(3'h5):(3'h5)]) : $signed($unsigned((|wire20)))),
                      (((wire18 ?
                          wire22 : $signed(wire19)) <<< $signed(wire22)) ~^ wire18[(4'h8):(1'h1)])};
  assign wire26 = {$unsigned((|($signed(wire21) - {(8'hbd), wire21}))),
                      ((~(|{wire19})) ?
                          wire18[(3'h4):(3'h4)] : {(wire23[(2'h3):(1'h1)] ?
                                  (wire19 << wire19) : {wire24})})};
  assign wire27 = wire26;
  assign wire28 = (~&(wire21 ?
                      (wire26 ?
                          (-(wire18 <= wire21)) : wire19[(1'h0):(1'h0)]) : {($unsigned(wire19) <= (~wire21))}));
  assign wire29 = wire21;
  assign wire30 = {{$unsigned($unsigned(wire22)), wire20[(3'h5):(3'h4)]},
                      $signed($unsigned($signed((~^wire29))))};
  assign wire31 = wire27[(3'h5):(2'h2)];
endmodule
