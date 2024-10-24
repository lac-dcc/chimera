module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire75;
  wire [(4'hd):(1'h0)] wire69;
  wire signed [(3'h4):(1'h0)] wire68;
  wire [(4'ha):(1'h0)] wire67;
  wire signed [(2'h3):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire64,
                 wire5,
                 wire4,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire4 = wire0[(1'h1):(1'h1)];
  assign wire5 = ((($unsigned((!wire1)) ?
                         $unsigned((~|wire1)) : ($signed(wire4) ^~ (|wire0))) ?
                     (8'ha3) : wire4[(1'h1):(1'h0)]) != {($unsigned($signed(wire1)) ?
                         $signed($signed(wire4)) : wire0)});
  module6 #() modinst65 (wire64, clk, wire3, wire2, wire4, wire1);
  assign wire66 = {(~$signed(wire2[(3'h7):(2'h2)])),
                      $signed((wire4 ?
                          ({wire4} ?
                              $unsigned((8'hb4)) : (wire0 != (8'hbe))) : ((wire2 & (8'hbb)) ?
                              {wire2, wire3} : (wire5 == (8'hb3)))))};
  assign wire67 = $unsigned($signed(($signed(wire5[(4'hd):(2'h2)]) ?
                      $unsigned($unsigned(wire2)) : ({wire5,
                          wire4} && wire66))));
  assign wire68 = wire4[(4'he):(3'h5)];
  assign wire69 = ($unsigned($unsigned($unsigned(wire66))) ?
                      (~$unsigned((~&(wire3 ^ wire0)))) : wire66[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg70 <= wire2;
      reg71 <= wire4;
      reg72 <= (-(~$unsigned((~&((8'hbe) >> reg70)))));
      reg73 <= wire3;
      reg74 <= reg71[(3'h6):(3'h6)];
    end
  assign wire75 = ($signed((((~|(7'h40)) ?
                          $signed(reg72) : wire5[(1'h0):(1'h0)]) <= $unsigned($signed(reg74)))) ?
                      wire5[(5'h10):(4'hd)] : $signed(wire69));
  assign wire76 = (reg72[(2'h2):(1'h1)] ?
                      $signed(({$signed(wire0), reg72[(1'h1):(1'h0)]} ?
                          wire66[(2'h2):(2'h2)] : $signed((reg74 ?
                              wire68 : (8'had))))) : {$signed($unsigned((-reg70))),
                          {$signed($unsigned(reg73)),
                              (wire4 || wire4[(3'h4):(3'h4)])}});
endmodule

module module6
#(parameter param62 = (8'ha8), 
parameter param63 = (8'hb2))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire61;
  wire [(4'he):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire [(4'h8):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire15;
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  assign y = {wire61,
                 wire59,
                 wire58,
                 wire52,
                 wire51,
                 wire50,
                 wire48,
                 wire15,
                 reg60,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= (&(8'ha4));
      reg12 <= wire8[(4'hf):(1'h0)];
      reg13 <= (((~&wire9[(4'hb):(4'hb)]) * (~^$signed($signed(wire9)))) && ($signed($signed(((8'hbe) & reg12))) ~^ $signed($unsigned(wire8[(3'h5):(2'h2)]))));
      reg14 <= wire7[(3'h5):(1'h0)];
    end
  assign wire15 = ((($unsigned((7'h40)) ?
                          ((&reg11) ?
                              $unsigned(wire10) : wire8[(4'hc):(4'hb)]) : $signed((|reg12))) <<< (8'hb5)) ?
                      $unsigned((8'hb0)) : $unsigned(reg12[(5'h14):(3'h6)]));
  module16 #() modinst49 (.wire17(wire10), .clk(clk), .wire21(wire15), .y(wire48), .wire20(reg13), .wire18(wire7), .wire19(wire9));
  assign wire50 = reg12[(4'hb):(1'h1)];
  assign wire51 = (wire9[(3'h4):(2'h3)] ?
                      wire8 : {reg14[(3'h6):(3'h4)], (!$signed(wire15))});
  assign wire52 = {wire7};
  always
    @(posedge clk) begin
      reg53 <= (^~$signed((((wire50 ?
          (8'hba) : wire51) <<< (reg13 <= reg11)) | $signed({wire52}))));
      reg54 <= ((wire15[(3'h7):(2'h3)] <<< $signed((-$unsigned(wire10)))) + reg11);
      reg55 <= wire7[(4'h8):(3'h7)];
      reg56 <= wire52[(2'h3):(2'h2)];
      reg57 <= (-$signed({{((8'hba) ? wire48 : reg56)}, wire52}));
    end
  assign wire58 = (8'hb1);
  assign wire59 = (((&$unsigned((wire52 * reg12))) << wire7) ?
                      ((|$unsigned($unsigned(wire52))) ?
                          ((wire7 * $signed(wire7)) ~^ reg55) : $unsigned({(wire15 ?
                                  reg55 : wire52)})) : wire15);
  always
    @(posedge clk) begin
      reg60 <= $unsigned(({reg53[(2'h2):(1'h1)], (~^wire7)} ?
          {(wire58[(4'hd):(4'h8)] - {wire15}),
              $signed((wire51 <= reg57))} : reg14[(2'h3):(2'h3)]));
    end
  assign wire61 = ($signed($signed($unsigned(reg14[(1'h1):(1'h0)]))) ?
                      $unsigned(reg13) : ((($unsigned(wire7) <<< reg14) ?
                          $signed($signed(wire7)) : wire7) || $signed({(reg56 >> wire59)})));
endmodule

module module16
#(parameter param47 = (-{((8'hbe) ? (8'h9c) : ({(8'hb0), (8'ha0)} ? ((8'ha8) ? (8'hb3) : (8'ha1)) : ((8'h9e) ? (8'hb0) : (8'haf))))}))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire21;
  input wire signed [(4'hd):(1'h0)] wire20;
  input wire [(4'h8):(1'h0)] wire19;
  input wire [(4'hf):(1'h0)] wire18;
  input wire signed [(4'hd):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire41;
  wire [(4'h8):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire22;
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
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
                 wire24,
                 wire23,
                 wire22,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire22 = (wire19 ?
                      $unsigned($signed(($unsigned(wire19) ^ {wire19,
                          wire20}))) : {((((8'hbf) * (8'hb3)) ?
                              (wire17 ?
                                  wire19 : wire21) : $unsigned((7'h41))) <= ($signed(wire20) ?
                              wire18 : $unsigned(wire21))),
                          wire21});
  assign wire23 = wire17[(4'h9):(4'h8)];
  assign wire24 = wire22;
  assign wire25 = (wire18[(2'h2):(1'h1)] == $signed($signed(wire19)));
  assign wire26 = $unsigned($unsigned($unsigned($unsigned(wire23[(4'h8):(2'h3)]))));
  assign wire27 = ($unsigned(((&((8'hbc) ? wire21 : wire23)) ?
                          wire25[(4'h9):(2'h3)] : $signed($unsigned(wire25)))) ?
                      wire22[(5'h11):(3'h7)] : $unsigned($unsigned(wire19)));
  assign wire28 = (~{$unsigned($signed((~wire24)))});
  assign wire29 = (({(wire24[(3'h4):(2'h2)] != $signed(wire23))} | (wire22 ?
                          $signed((-wire26)) : ($unsigned(wire28) < wire26))) ?
                      wire27 : (8'hbc));
  assign wire30 = wire26;
  assign wire31 = wire26;
  assign wire32 = (wire22[(4'hc):(2'h2)] ?
                      $unsigned($signed(({wire29} >>> ((8'ha6) >> wire22)))) : ((wire20[(1'h0):(1'h0)] - ({wire18} | wire29)) >>> wire19));
  assign wire33 = (~^wire18);
  assign wire34 = $signed((((~^$signed(wire31)) ?
                      wire30[(3'h5):(2'h3)] : wire26) != (((wire31 ?
                          wire32 : wire22) ?
                      (wire20 ?
                          (8'h9c) : wire20) : $unsigned(wire30)) <= wire21)));
  always
    @(posedge clk) begin
      reg35 <= ($signed($unsigned((wire34[(1'h1):(1'h0)] ?
          (&(8'hb4)) : wire32))) * wire20[(3'h7):(2'h2)]);
      reg36 <= wire21[(3'h6):(1'h0)];
      reg37 <= (~^wire20[(3'h6):(3'h5)]);
    end
  assign wire38 = wire32[(4'h9):(1'h0)];
  assign wire39 = ($unsigned($unsigned({wire22[(4'he):(4'h8)]})) >= $signed((!wire19)));
  assign wire40 = (~|(wire28 & {((-(8'haa)) > wire17[(4'hb):(1'h0)]),
                      $unsigned($signed(wire17))}));
  assign wire41 = reg36[(1'h1):(1'h1)];
  assign wire42 = {wire27};
  assign wire43 = ({((7'h42) >= $signed(wire25[(3'h7):(2'h3)]))} + wire26);
  assign wire44 = wire28[(5'h11):(4'hb)];
  assign wire45 = wire43[(4'h8):(4'h8)];
  assign wire46 = wire28;
endmodule
