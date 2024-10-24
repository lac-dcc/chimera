module top
#(parameter param68 = ((|{((8'haf) ? ((7'h42) ? (8'ha3) : (8'had)) : (~(8'hb5)))}) == ((-((~(8'had)) ? ((8'hae) ^~ (8'hb5)) : {(7'h42), (8'ha1)})) ? (-(~|(~^(8'haa)))) : ((8'haf) + ((~(8'hac)) >>> ((8'ha7) + (8'hb0)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire65;
  wire [(3'h7):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire59;
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire5,
                 wire6,
                 wire59,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg7,
                 (1'h0)};
  assign wire5 = wire1[(1'h1):(1'h1)];
  assign wire6 = wire4[(5'h12):(4'hc)];
  always
    @(posedge clk) begin
      reg7 <= $unsigned((~&wire4));
    end
  module8 #() modinst60 (wire59, clk, reg7, wire3, wire2, wire1);
  always
    @(posedge clk) begin
      reg61 <= $signed($unsigned((($unsigned(wire59) ?
              $unsigned((7'h42)) : (^wire4)) ?
          $signed(wire4) : (&$unsigned(wire4)))));
      reg62 <= (^~$unsigned((wire2 <= {((8'hb2) * wire6), (~^reg61)})));
      reg63 <= {reg62};
      reg64 <= $signed($signed($unsigned((~|((8'hbd) <<< reg61)))));
    end
  assign wire65 = reg63;
  assign wire66 = $unsigned((~^$signed({$signed(wire1), $unsigned(reg63)})));
  assign wire67 = ((~|{((~reg7) * wire5[(3'h6):(3'h5)])}) ?
                      reg61 : $signed(wire0[(5'h10):(4'hc)]));
endmodule

module module8
#(parameter param58 = {{((((8'ha1) ? (8'hb5) : (8'hba)) && ((7'h44) * (8'hb2))) ? ((~^(8'hb8)) | ((8'h9f) >>> (7'h42))) : (-(~&(8'hb4))))}})
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire [(5'h14):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire37;
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg54 = (1'h0);
  assign y = {wire53, wire51, wire37, reg57, reg56, reg55, reg54, (1'h0)};
  module13 #() modinst38 (.wire15(wire12), .wire17(wire10), .clk(clk), .wire16(wire11), .wire14(wire9), .y(wire37));
  module39 #() modinst52 (.wire40(wire9), .y(wire51), .clk(clk), .wire41(wire12), .wire43(wire10), .wire42(wire11));
  assign wire53 = $unsigned(($unsigned(($unsigned((7'h44)) ?
                          (wire11 ? wire51 : wire9) : (8'ha9))) ?
                      (8'hab) : $signed(($unsigned(wire9) ?
                          wire37 : (~|wire11)))));
  always
    @(posedge clk) begin
      reg54 <= $unsigned(wire37[(4'hc):(4'ha)]);
      reg55 <= wire51[(1'h0):(1'h0)];
      reg56 <= $unsigned(wire12[(4'he):(4'hd)]);
      reg57 <= wire10[(3'h7):(1'h1)];
    end
endmodule

module module39
#(parameter param50 = (~^{(((~|(8'ha9)) <= ((8'ha4) >>> (8'hbd))) <= (((8'hb2) * (8'ha3)) + ((8'had) ~^ (8'ha9)))), (~&(((8'hbb) > (8'hb0)) ? ((8'hb2) ~^ (8'ha1)) : {(8'haf), (8'hb9)}))}))
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire43;
  input wire [(5'h14):(1'h0)] wire42;
  input wire [(5'h11):(1'h0)] wire41;
  input wire signed [(4'hc):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  wire signed [(4'hd):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  wire signed [(2'h2):(1'h0)] wire45;
  wire signed [(2'h2):(1'h0)] wire44;
  assign y = {wire49, wire48, wire47, wire46, wire45, wire44, (1'h0)};
  assign wire44 = $unsigned(wire42[(4'hf):(4'hf)]);
  assign wire45 = {({wire42[(5'h14):(4'hf)], wire42[(3'h4):(2'h3)]} ?
                          wire40[(3'h7):(1'h1)] : $signed(wire40)),
                      $signed($signed((~&(8'hbe))))};
  assign wire46 = wire43[(3'h6):(3'h6)];
  assign wire47 = $unsigned(wire42[(4'hf):(4'h8)]);
  assign wire48 = (+$unsigned(wire40));
  assign wire49 = wire48[(4'h8):(1'h0)];
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire17;
  input wire [(3'h4):(1'h0)] wire16;
  input wire [(4'h9):(1'h0)] wire15;
  input wire signed [(5'h10):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire18;
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire18 = (~|wire15[(1'h1):(1'h0)]);
  assign wire19 = wire14;
  assign wire20 = (+$unsigned(($unsigned(wire17[(3'h5):(1'h1)]) * (^wire16[(2'h3):(1'h0)]))));
  assign wire21 = (~^wire19);
  assign wire22 = $signed(wire14[(4'hb):(3'h6)]);
  assign wire23 = wire20;
  assign wire24 = $signed({(~|$signed(wire19))});
  assign wire25 = ($signed(({$signed(wire18), (wire19 ? wire18 : wire16)} ?
                          $unsigned($signed(wire15)) : wire16)) ?
                      $signed($signed($signed(wire16))) : (((~&$signed(wire19)) ?
                          wire15 : ((^(8'hac)) < $signed(wire22))) ^ wire22[(1'h0):(1'h0)]));
  assign wire26 = (8'hb0);
  assign wire27 = {((^$signed(((8'haa) >= (8'hb0)))) ?
                          {$signed(wire14[(4'ha):(3'h7)]),
                              $unsigned((wire25 - wire16))} : (7'h42)),
                      $signed((($unsigned(wire15) ?
                              $signed(wire15) : (~|(8'hbb))) ?
                          $signed(wire20[(4'hb):(1'h0)]) : ((|wire20) <= $signed(wire19))))};
  assign wire28 = wire27[(4'h9):(1'h1)];
  assign wire29 = wire19;
  assign wire30 = wire26;
  always
    @(posedge clk) begin
      if (wire23)
        begin
          reg31 <= (wire14 >>> $unsigned($signed(wire27)));
        end
      else
        begin
          reg31 <= (-wire17);
          reg32 <= $signed($signed(({$signed(wire16), $unsigned(wire20)} ?
              (((8'hae) ^ wire15) ?
                  (wire15 ? wire17 : wire18) : (wire29 ?
                      wire21 : wire20)) : wire14)));
          reg33 <= $unsigned($signed(wire14));
          reg34 <= $signed(wire27[(3'h5):(3'h5)]);
          reg35 <= ($unsigned(reg33[(2'h3):(1'h1)]) ?
              $signed({wire16[(1'h0):(1'h0)],
                  wire19[(1'h1):(1'h0)]}) : (($signed({reg32}) ?
                      ({wire26} ~^ wire18[(4'h9):(3'h4)]) : ($unsigned(reg32) ?
                          (~|wire17) : (wire22 ~^ (8'haf)))) ?
                  {reg32[(1'h1):(1'h1)],
                      (~&wire14)} : $signed(((wire15 < (7'h41)) ?
                      wire29[(1'h1):(1'h0)] : (&(8'had))))));
        end
      reg36 <= (~((~|$unsigned(wire28[(3'h4):(3'h4)])) ?
          ($unsigned($signed(reg35)) ?
              ($unsigned((7'h42)) & $unsigned(wire15)) : {wire19[(2'h2):(2'h2)]}) : ({$unsigned(wire14),
              $signed(wire30)} ^~ ((reg32 | wire22) ?
              wire29 : ((8'h9c) ? reg31 : wire14)))));
    end
endmodule
