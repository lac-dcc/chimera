module top
#(parameter param117 = ((8'hb1) ? ((((~^(8'ha4)) ? ((8'had) ? (8'ha8) : (8'ha1)) : (~|(8'hb8))) ? ((8'hab) <= {(8'ha4)}) : (~|((8'hbe) ? (7'h41) : (8'hb5)))) + {{(~|(8'ha6))}, ((|(8'ha4)) * ((8'ha9) & (8'h9e)))}) : ((-({(8'hab)} >= ((8'hb1) ? (8'h9f) : (8'ha5)))) ^~ (~(8'hae)))), 
parameter param118 = {({(param117 ? {param117} : {param117, (8'h9d)}), (param117 ~^ (param117 & (8'ha2)))} || {{(param117 ? param117 : (7'h43)), (param117 ? param117 : param117)}, ((param117 ~^ param117) ~^ (param117 ^~ param117))}), {param117, (-({param117, param117} ? param117 : (param117 ^~ param117)))}})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire4;
  wire [(3'h4):(1'h0)] wire116;
  wire signed [(5'h14):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire114;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire112;
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire114,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire112,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  assign wire5 = {$signed((~&wire2[(4'hb):(1'h0)]))};
  assign wire6 = (|($signed((~$unsigned(wire4))) ?
                     (wire5[(1'h1):(1'h1)] | $unsigned(wire0)) : $signed(wire1[(1'h0):(1'h0)])));
  assign wire7 = wire3;
  assign wire8 = (|$signed($signed($signed(((8'hb3) & wire5)))));
  always
    @(posedge clk) begin
      reg9 <= $unsigned($signed((wire4 + ((wire6 >= (8'ha3)) ?
          (!wire1) : $signed((8'hbb))))));
      reg10 <= ((wire7 << wire7[(3'h4):(1'h1)]) ?
          $unsigned((|$signed(wire3))) : wire7[(3'h7):(3'h5)]);
      reg11 <= ($signed((!$signed((&wire1)))) ?
          wire7[(5'h13):(4'h9)] : {wire4,
              (wire6[(4'hc):(2'h3)] & {$unsigned(wire2)})});
    end
  module12 #() modinst113 (.wire16(wire2), .wire13(reg10), .y(wire112), .clk(clk), .wire15(wire5), .wire14(wire8));
  assign wire114 = $unsigned((~|wire4[(1'h0):(1'h0)]));
  assign wire115 = wire6;
  assign wire116 = $unsigned(($signed(({wire1, wire1} ?
                       $signed((8'hb4)) : wire2[(3'h7):(1'h1)])) ~^ $signed($unsigned($signed(wire8)))));
endmodule

module module12  (y, clk, wire13, wire14, wire15, wire16);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire [(3'h6):(1'h0)] wire14;
  input wire signed [(4'hb):(1'h0)] wire15;
  input wire [(3'h7):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire86;
  wire signed [(3'h6):(1'h0)] wire85;
  wire [(3'h6):(1'h0)] wire84;
  wire [(5'h10):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire81;
  wire signed [(4'hd):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire42;
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  assign y = {wire110,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire81,
                 wire44,
                 wire17,
                 wire19,
                 wire20,
                 wire21,
                 wire27,
                 wire42,
                 reg45,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg18,
                 (1'h0)};
  assign wire17 = $signed(($unsigned(((wire13 && wire14) | wire15[(3'h5):(2'h3)])) ^ $unsigned(((wire15 ?
                      (8'hbc) : wire15) >= (^wire16)))));
  always
    @(posedge clk) begin
      reg18 <= (!wire14[(1'h1):(1'h1)]);
    end
  assign wire19 = $signed(((!(wire17 <= (|(8'hbe)))) << (~&wire16)));
  assign wire20 = wire14[(3'h4):(1'h1)];
  assign wire21 = wire17[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      reg22 <= $signed(wire13[(4'hb):(3'h7)]);
      reg23 <= wire20[(3'h7):(3'h7)];
      reg24 <= reg18;
      reg25 <= (~&(!reg18));
      reg26 <= reg23[(1'h1):(1'h0)];
    end
  assign wire27 = (reg25[(4'hb):(2'h2)] + $unsigned((reg22[(1'h1):(1'h1)] ?
                      (reg26[(1'h1):(1'h1)] ?
                          wire16 : wire15) : $unsigned({reg26}))));
  module28 #() modinst43 (wire42, clk, wire17, reg26, wire16, reg23, wire27);
  assign wire44 = $unsigned(wire16[(3'h4):(3'h4)]);
  always
    @(posedge clk) begin
      reg45 <= $unsigned((|((8'hb2) ? wire13[(4'ha):(3'h6)] : reg25)));
    end
  module46 #() modinst82 (.wire50(wire14), .wire47(wire44), .y(wire81), .wire51(wire15), .wire49(wire42), .wire48(reg26), .clk(clk));
  assign wire83 = (($signed(($signed(wire15) ^~ {wire20})) >= {$signed((wire27 >>> wire17)),
                          (~$signed(wire17))}) ?
                      reg23[(3'h7):(2'h3)] : (+$unsigned($unsigned((wire27 ~^ wire42)))));
  assign wire84 = $signed(wire44[(3'h7):(1'h0)]);
  assign wire85 = wire84[(3'h4):(2'h3)];
  assign wire86 = wire14;
  assign wire87 = (wire86 ?
                      wire20 : ((wire44 >>> ($unsigned(reg23) > (wire44 != reg22))) ?
                          wire83 : ($unsigned($signed(wire21)) ?
                              $signed((~reg24)) : reg26[(4'ha):(1'h0)])));
  module88 #() modinst111 (.clk(clk), .wire91(reg26), .wire93(wire44), .y(wire110), .wire92(reg25), .wire90(reg22), .wire89(wire17));
endmodule

module module88  (y, clk, wire93, wire92, wire91, wire90, wire89);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire93;
  input wire [(5'h13):(1'h0)] wire92;
  input wire signed [(5'h11):(1'h0)] wire91;
  input wire signed [(2'h3):(1'h0)] wire90;
  input wire [(5'h13):(1'h0)] wire89;
  wire signed [(3'h5):(1'h0)] wire109;
  wire [(3'h4):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire105;
  wire signed [(3'h4):(1'h0)] wire104;
  wire signed [(5'h13):(1'h0)] wire102;
  wire [(4'hd):(1'h0)] wire101;
  wire signed [(3'h6):(1'h0)] wire100;
  wire signed [(2'h3):(1'h0)] wire99;
  wire [(2'h3):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire97;
  wire signed [(3'h7):(1'h0)] wire96;
  wire [(4'hb):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire94;
  reg signed [(5'h11):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  assign y = {wire109,
                 wire106,
                 wire105,
                 wire104,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 reg108,
                 reg107,
                 reg103,
                 (1'h0)};
  assign wire94 = wire90[(2'h2):(1'h0)];
  assign wire95 = wire92;
  assign wire96 = wire95;
  assign wire97 = (($signed($unsigned(wire96)) < ({$signed(wire89),
                          {wire89}} ^~ wire91)) ?
                      (wire89 + ($signed($signed(wire94)) - wire90[(1'h1):(1'h0)])) : $signed(((-wire92) ?
                          $unsigned((wire89 ?
                              (8'ha4) : wire94)) : $unsigned((wire90 ?
                              wire95 : wire93)))));
  assign wire98 = wire97[(3'h7):(2'h3)];
  assign wire99 = ($signed($unsigned(wire96)) * $signed(wire97));
  assign wire100 = {wire92};
  assign wire101 = $signed((($signed((wire93 ? wire96 : wire92)) != wire94) ?
                       wire89[(1'h1):(1'h0)] : wire98));
  assign wire102 = $unsigned(wire97[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg103 <= ($signed($unsigned(wire91[(3'h5):(3'h5)])) ?
          (wire100 <<< wire95[(4'h9):(3'h5)]) : (+$signed((8'hbb))));
    end
  assign wire104 = (+$unsigned(wire98[(1'h0):(1'h0)]));
  assign wire105 = wire91[(2'h3):(1'h1)];
  assign wire106 = wire92[(4'he):(2'h3)];
  always
    @(posedge clk) begin
      reg107 <= ($unsigned((wire99[(1'h0):(1'h0)] ?
              ({wire105} == {wire91, (7'h44)}) : wire91)) ?
          (wire90 >> wire102[(5'h12):(5'h11)]) : ({wire104[(2'h3):(2'h3)],
              wire97[(4'h9):(3'h5)]} * wire104[(1'h1):(1'h1)]));
      reg108 <= (~|wire100);
    end
  assign wire109 = ((((wire101 ?
                       (wire90 ? reg107 : reg107) : (wire99 ?
                           wire106 : wire91)) >> ($signed(wire99) && reg107[(2'h3):(1'h0)])) * wire104) - $unsigned(reg103[(3'h6):(2'h2)]));
endmodule

module module46  (y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire51;
  input wire [(2'h2):(1'h0)] wire50;
  input wire signed [(5'h10):(1'h0)] wire49;
  input wire signed [(4'ha):(1'h0)] wire48;
  input wire signed [(4'hd):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire79;
  wire [(3'h6):(1'h0)] wire78;
  wire [(3'h7):(1'h0)] wire77;
  wire [(2'h2):(1'h0)] wire76;
  wire signed [(5'h10):(1'h0)] wire75;
  wire signed [(4'he):(1'h0)] wire74;
  wire signed [(3'h4):(1'h0)] wire71;
  wire [(3'h4):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire63;
  wire signed [(3'h7):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire54;
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire71,
                 wire66,
                 wire63,
                 wire55,
                 wire54,
                 reg73,
                 reg72,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg65,
                 reg64,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg53,
                 reg52,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg52 <= (~((&wire49[(1'h0):(1'h0)]) ?
          wire48 : (wire49 ? $signed(((8'hbc) ? wire49 : wire49)) : (8'h9f))));
      reg53 <= (8'ha5);
    end
  assign wire54 = (($unsigned(((wire49 ? wire47 : wire48) ?
                      $signed(wire50) : (8'ha2))) ^~ ($unsigned($signed(wire49)) ?
                      $signed((wire51 ?
                          (8'h9d) : wire47)) : (reg52 & reg53))) == (reg53[(4'h9):(3'h5)] ?
                      $unsigned(wire51[(4'h9):(4'h8)]) : reg53[(3'h5):(2'h3)]));
  assign wire55 = reg53;
  always
    @(posedge clk) begin
      reg56 <= wire54;
      reg57 <= ($signed($unsigned((&(reg52 * wire49)))) ?
          $signed($unsigned({(wire54 * wire47)})) : ($signed(reg56) << (^~reg56[(4'ha):(3'h6)])));
      reg58 <= reg57;
      reg59 <= (wire49[(2'h2):(2'h2)] + $unsigned((!(wire55 ?
          $unsigned(wire49) : wire50))));
    end
  always
    @(posedge clk) begin
      reg60 <= $signed($signed(($unsigned(reg59) > $signed($unsigned(wire48)))));
      reg61 <= (7'h43);
      reg62 <= $signed((($signed(reg52[(3'h4):(2'h2)]) ~^ wire51) ?
          $signed($unsigned((wire54 || wire55))) : (reg52 ?
              $signed(wire49) : ((wire49 <<< reg53) ?
                  $signed(wire47) : (~&wire55)))));
    end
  assign wire63 = ((~^reg58[(1'h1):(1'h1)]) >= wire54);
  always
    @(posedge clk) begin
      reg64 <= reg57[(3'h4):(2'h3)];
      reg65 <= $signed($unsigned(wire55[(2'h3):(1'h0)]));
    end
  assign wire66 = {$signed(({(reg59 ^~ wire48)} <= $signed(wire50[(1'h0):(1'h0)])))};
  always
    @(posedge clk) begin
      reg67 <= $signed(reg53);
      reg68 <= ((($unsigned(((8'hb8) ? reg58 : reg57)) ^~ ((reg57 ?
                  reg61 : reg60) ?
              $unsigned((8'h9c)) : $unsigned(reg67))) <<< ($signed($unsigned(reg53)) ?
              (7'h40) : {$unsigned(wire66)})) ?
          $unsigned(((^~$unsigned(reg65)) + $unsigned((wire63 ?
              reg60 : reg56)))) : ($signed($signed((wire55 > reg61))) ?
              wire49[(1'h0):(1'h0)] : ($unsigned({reg59}) ?
                  $unsigned(reg62[(3'h5):(3'h5)]) : (8'ha5))));
      reg69 <= wire51;
      reg70 <= (reg56[(1'h1):(1'h0)] ?
          reg53 : (-$unsigned((~^$unsigned(reg52)))));
    end
  assign wire71 = (!reg60[(4'ha):(4'h8)]);
  always
    @(posedge clk) begin
      reg72 <= $signed(((wire55[(3'h4):(1'h0)] ?
              (8'ha2) : (reg58[(2'h3):(1'h1)] == reg58)) ?
          reg62[(1'h0):(1'h0)] : reg68[(1'h1):(1'h0)]));
      reg73 <= reg52[(1'h0):(1'h0)];
    end
  assign wire74 = (reg68[(4'hb):(1'h0)] < ($signed($unsigned($signed((8'ha7)))) < ((wire63[(1'h0):(1'h0)] + $unsigned(wire55)) - {(wire49 <= reg72)})));
  assign wire75 = ({$unsigned((~^{reg73, wire74}))} ?
                      (wire63 & $unsigned($signed({reg65,
                          reg67}))) : (((reg70 <= $signed(reg62)) != (reg52 ?
                          {wire48, (8'haa)} : (&reg62))) > (+wire50)));
  assign wire76 = $signed((~^$signed((|wire51[(3'h6):(3'h5)]))));
  assign wire77 = ((~$signed(wire63[(1'h0):(1'h0)])) ?
                      (({$signed(reg53),
                          reg60} * (wire55 >= (reg56 > reg61))) << (~^reg67[(3'h4):(2'h2)])) : reg58[(2'h3):(1'h0)]);
  assign wire78 = wire76;
  assign wire79 = (reg52 ?
                      (^~$unsigned((~wire78[(2'h3):(2'h3)]))) : ((wire47[(3'h6):(1'h0)] ?
                              $unsigned((reg57 ?
                                  wire55 : (8'h9f))) : {((8'had) ?
                                      reg72 : reg58)}) ?
                          wire76 : wire76[(2'h2):(1'h0)]));
  assign wire80 = wire49[(4'h8):(3'h5)];
endmodule

module module28  (y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire33;
  input wire [(5'h11):(1'h0)] wire32;
  input wire signed [(3'h6):(1'h0)] wire31;
  input wire [(3'h5):(1'h0)] wire30;
  input wire signed [(4'h8):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire34;
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire34,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire34 = wire33;
  always
    @(posedge clk) begin
      reg35 <= (~wire33);
      reg36 <= (wire30 ?
          (+(7'h40)) : (~|({{wire33, wire30}, wire31[(1'h1):(1'h0)]} ?
              wire30[(2'h2):(1'h0)] : $unsigned(reg35[(3'h4):(1'h0)]))));
      reg37 <= ((&reg35) + (reg36 ?
          wire32 : ((!$unsigned(wire32)) ?
              wire31 : ($signed(reg35) && $signed(reg35)))));
      reg38 <= reg36[(2'h2):(1'h1)];
      reg39 <= reg35;
    end
  assign wire40 = reg38;
  assign wire41 = $unsigned((8'haa));
endmodule
