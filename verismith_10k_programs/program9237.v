module top
#(parameter param110 = ((+((8'hbf) ? {((7'h41) ? (8'ha5) : (8'haa)), ((7'h40) ? (8'h9e) : (8'hbe))} : (8'hae))) == (8'hb0)), 
parameter param111 = ((((param110 * {param110, param110}) && ((~|param110) ? (param110 ? param110 : param110) : param110)) ? (|param110) : param110) == param110))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire109;
  wire signed [(3'h7):(1'h0)] wire108;
  wire signed [(4'hd):(1'h0)] wire107;
  wire [(4'he):(1'h0)] wire106;
  wire [(2'h3):(1'h0)] wire100;
  wire signed [(4'h9):(1'h0)] wire98;
  wire signed [(2'h2):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  reg [(5'h10):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg101 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire100,
                 wire98,
                 wire7,
                 wire6,
                 wire5,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 (1'h0)};
  assign wire5 = (~($signed((wire1[(4'h8):(1'h0)] ? {wire4} : wire2)) ?
                     wire1 : wire3[(4'ha):(3'h4)]));
  assign wire6 = $signed((wire0 ^ {$unsigned((wire3 == wire5)),
                     wire5[(3'h5):(3'h4)]}));
  assign wire7 = (wire0 < ((8'hb5) ?
                     (+((^wire0) >>> (^wire1))) : (|(~wire2[(2'h2):(2'h2)]))));
  module8 #() modinst99 (.wire12(wire0), .wire10(wire1), .y(wire98), .wire11(wire5), .wire9(wire3), .clk(clk));
  assign wire100 = $signed($signed({$unsigned((wire4 | wire0)), (8'hba)}));
  always
    @(posedge clk) begin
      reg101 <= wire6;
    end
  always
    @(posedge clk) begin
      if ($unsigned((wire7 > wire0)))
        begin
          reg102 <= $signed($unsigned((((wire0 ? wire100 : wire0) ^ wire7) ?
              wire5[(3'h7):(1'h1)] : wire2[(4'hc):(4'hc)])));
        end
      else
        begin
          reg102 <= ($signed(wire3[(4'h9):(3'h5)]) ?
              (($unsigned((~&wire7)) >>> reg102[(1'h1):(1'h0)]) ^ wire6[(2'h3):(2'h2)]) : (({wire3[(4'he):(3'h7)]} ?
                  $unsigned((wire100 < wire5)) : $unsigned(wire2)) || wire5[(4'hb):(3'h6)]));
          reg103 <= $signed((^~reg101));
          reg104 <= (wire2 ^ ((reg101[(2'h3):(2'h3)] << wire7[(2'h2):(1'h1)]) + (($unsigned(wire0) + (~&wire0)) ^ (wire5[(4'ha):(1'h0)] + $unsigned(wire6)))));
        end
      reg105 <= ((~wire0) ?
          (^~wire3[(1'h1):(1'h1)]) : (~|$signed({(wire98 ? wire0 : reg104),
              wire4})));
    end
  assign wire106 = (&(!$signed(reg105)));
  assign wire107 = wire2[(4'hc):(4'ha)];
  assign wire108 = reg102[(4'ha):(2'h2)];
  assign wire109 = wire98;
endmodule

module module8
#(parameter param97 = ({(8'ha7)} ? {((((8'hb1) ? (8'hab) : (8'haf)) ^~ {(8'haf), (8'hb1)}) ? (((8'hb3) <= (8'ha1)) > ((8'hb7) ^ (7'h42))) : (((8'hb4) ? (8'hb1) : (7'h43)) ^~ (~(8'hae)))), ((~(^~(8'hb1))) ? (((8'hab) ? (8'ha1) : (8'hbe)) >= ((8'hb8) <<< (8'ha6))) : ({(8'ha5)} ? ((8'hb6) ? (8'ha7) : (8'hb4)) : ((8'ha4) - (8'ha2))))} : (8'ha1)))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire12;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire96;
  wire signed [(2'h2):(1'h0)] wire83;
  wire signed [(4'hb):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire81;
  wire signed [(4'ha):(1'h0)] wire79;
  wire [(5'h12):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire63;
  wire [(4'hc):(1'h0)] wire62;
  wire signed [(4'he):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire60;
  reg signed [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg93 = (1'h0);
  reg [(5'h12):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg91 = (1'h0);
  reg [(4'h8):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg89 = (1'h0);
  reg [(4'hd):(1'h0)] reg88 = (1'h0);
  reg [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  assign y = {wire96,
                 wire83,
                 wire82,
                 wire81,
                 wire79,
                 wire66,
                 wire65,
                 wire63,
                 wire62,
                 wire33,
                 wire13,
                 wire35,
                 wire60,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg64,
                 (1'h0)};
  assign wire13 = wire10;
  module14 #() modinst34 (.wire18(wire9), .wire17(wire12), .wire16(wire13), .clk(clk), .y(wire33), .wire19(wire11), .wire15(wire10));
  assign wire35 = wire12;
  module36 #() modinst61 (.wire40(wire12), .wire41(wire13), .clk(clk), .wire39(wire35), .wire38(wire11), .wire37(wire10), .y(wire60));
  assign wire62 = (&{$unsigned(wire60[(3'h4):(1'h0)])});
  assign wire63 = (8'hb0);
  always
    @(posedge clk) begin
      reg64 <= ((wire60 ^ (!(!$unsigned(wire62)))) ~^ wire11);
    end
  assign wire65 = ($signed({(|(&wire12)), wire13}) ?
                      $unsigned($signed($unsigned((~^reg64)))) : (((^(^wire12)) ?
                              $unsigned($signed(wire60)) : (|wire12[(3'h6):(3'h5)])) ?
                          (-(~&{wire13, wire12})) : wire60[(1'h0):(1'h0)]));
  assign wire66 = wire60;
  module67 #() modinst80 (wire79, clk, reg64, wire12, wire9, wire11, wire60);
  assign wire81 = wire65[(1'h0):(1'h0)];
  assign wire82 = $signed((~wire79));
  assign wire83 = ({($signed((wire66 ? wire82 : wire60)) ?
                          (^$signed(reg64)) : $unsigned($unsigned(wire65)))} < $signed($signed((wire81[(4'hf):(4'hc)] < (~^wire79)))));
  always
    @(posedge clk) begin
      reg84 <= $unsigned(wire11);
      reg85 <= $signed($unsigned(wire13));
    end
  always
    @(posedge clk) begin
      reg86 <= wire12;
      reg87 <= (^(^~(^~($signed(wire9) ? (wire66 && wire12) : wire79))));
      if (((&(wire66[(5'h12):(3'h4)] ?
              ((wire12 ?
                  wire81 : reg85) || (wire63 - reg87)) : {$signed(wire13),
                  wire65})) ?
          ((($signed(reg64) ~^ (8'hae)) == (~|(wire79 ? (8'hac) : wire12))) ?
              (({wire82} ^~ wire63[(4'hf):(2'h2)]) ?
                  ($signed(wire79) ?
                      wire60[(3'h6):(3'h5)] : (reg64 ?
                          wire33 : wire9)) : wire79) : (^~wire62)) : $unsigned($signed(wire79[(2'h2):(2'h2)]))))
        begin
          reg88 <= ({wire63[(4'h8):(2'h3)]} * wire82[(4'h8):(3'h4)]);
        end
      else
        begin
          reg88 <= {(7'h43)};
          if ({reg64[(1'h0):(1'h0)]})
            begin
              reg89 <= $signed((reg88[(4'hc):(2'h2)] ?
                  wire60[(2'h3):(1'h1)] : reg85));
              reg90 <= $signed($unsigned(wire33));
              reg91 <= ($signed($unsigned($unsigned($signed(reg85)))) ?
                  (wire13[(4'hb):(4'h9)] | $unsigned(((&wire35) << wire12))) : (~$signed((7'h44))));
              reg92 <= {$unsigned($signed((|wire13[(4'hc):(1'h1)]))),
                  (-$unsigned(reg64[(2'h2):(1'h0)]))};
              reg93 <= ((~|$unsigned($unsigned((|wire79)))) * $signed({$unsigned((~&reg86)),
                  wire35}));
            end
          else
            begin
              reg89 <= (($signed($unsigned(wire33[(4'ha):(2'h2)])) ?
                      $signed($unsigned((wire65 ^~ reg64))) : $unsigned($unsigned($unsigned(reg86)))) ?
                  $unsigned($unsigned(reg91)) : ($signed((8'hbc)) ^~ (!reg87)));
              reg90 <= $unsigned(reg93[(2'h2):(2'h2)]);
              reg91 <= wire9;
            end
        end
      reg94 <= (~|($unsigned($unsigned(reg87[(1'h1):(1'h0)])) ?
          wire13[(4'h8):(3'h5)] : $signed($unsigned((^~reg91)))));
      reg95 <= $unsigned({$unsigned(((&wire9) ?
              (wire60 ? wire66 : (8'ha9)) : wire13[(4'hd):(2'h2)]))});
    end
  assign wire96 = $unsigned((reg92 ~^ ($unsigned(reg90[(2'h3):(2'h3)]) <= (-reg94[(2'h3):(2'h2)]))));
endmodule

module module67  (y, clk, wire72, wire71, wire70, wire69, wire68);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire72;
  input wire [(5'h11):(1'h0)] wire71;
  input wire signed [(4'hc):(1'h0)] wire70;
  input wire signed [(2'h3):(1'h0)] wire69;
  input wire [(4'h8):(1'h0)] wire68;
  wire signed [(3'h4):(1'h0)] wire78;
  wire signed [(4'he):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire76;
  wire [(4'h8):(1'h0)] wire75;
  wire signed [(2'h3):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire73;
  assign y = {wire78, wire77, wire76, wire75, wire74, wire73, (1'h0)};
  assign wire73 = $unsigned((&(8'h9f)));
  assign wire74 = wire72[(3'h4):(2'h2)];
  assign wire75 = (wire71[(1'h0):(1'h0)] >>> ($signed(($signed(wire71) ?
                      $signed(wire74) : wire73[(2'h2):(1'h1)])) >>> $unsigned({wire70,
                      (~|wire72)})));
  assign wire76 = wire73;
  assign wire77 = $signed(wire76);
  assign wire78 = {$unsigned(((wire75[(1'h1):(1'h1)] << {wire74,
                          (8'hbc)}) >= wire70[(2'h2):(2'h2)])),
                      ((wire69 ? wire68[(1'h1):(1'h1)] : $signed(wire68)) ?
                          wire75[(1'h1):(1'h0)] : wire74[(2'h2):(1'h0)])};
endmodule

module module36  (y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire41;
  input wire [(3'h4):(1'h0)] wire40;
  input wire signed [(4'ha):(1'h0)] wire39;
  input wire signed [(4'ha):(1'h0)] wire38;
  input wire signed [(5'h15):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire58;
  wire [(4'h9):(1'h0)] wire57;
  wire [(3'h6):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire53;
  wire [(4'hb):(1'h0)] wire52;
  wire signed [(4'he):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire49;
  wire [(4'hd):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire45;
  wire [(4'ha):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire42;
  assign y = {wire59,
                 wire58,
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
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 (1'h0)};
  assign wire42 = $signed({(|wire41)});
  assign wire43 = wire41[(3'h6):(3'h6)];
  assign wire44 = (wire37[(5'h11):(3'h4)] <<< (~&$signed(wire38[(3'h6):(1'h1)])));
  assign wire45 = (wire44[(3'h4):(2'h3)] > wire40);
  assign wire46 = $signed(((($unsigned(wire37) <<< (~&wire39)) || ((wire42 ?
                          wire42 : wire41) <= wire44)) ?
                      (wire43 < (7'h44)) : ($signed(wire39) << wire45)));
  assign wire47 = $signed((wire43 ?
                      $signed($unsigned(((8'ha1) - wire44))) : (8'hae)));
  assign wire48 = wire44;
  assign wire49 = wire39;
  assign wire50 = wire39;
  assign wire51 = wire44[(1'h1):(1'h0)];
  assign wire52 = $signed($signed((wire47[(5'h10):(4'he)] ?
                      $signed(wire38[(4'ha):(3'h5)]) : ((wire46 != wire37) ?
                          ((8'haa) ? wire37 : wire45) : wire46))));
  assign wire53 = {(~&$unsigned(wire45[(2'h3):(2'h3)]))};
  assign wire54 = $signed($unsigned($signed(wire53[(1'h1):(1'h1)])));
  assign wire55 = ((|$signed((wire54[(3'h6):(2'h3)] ?
                          (~|wire51) : (wire41 ? wire41 : wire47)))) ?
                      wire44 : (~&(^~$unsigned($signed(wire38)))));
  assign wire56 = ($unsigned($unsigned(($signed(wire52) ?
                          {(8'hb7), wire44} : wire48[(4'h9):(3'h7)]))) ?
                      wire51 : (wire44[(3'h4):(2'h2)] ?
                          (wire40[(1'h1):(1'h1)] == (-(wire37 ?
                              wire45 : wire49))) : $signed(wire44[(3'h6):(3'h5)])));
  assign wire57 = $unsigned(wire50);
  assign wire58 = wire38;
  assign wire59 = (wire41 ?
                      {(($signed(wire37) - $signed(wire46)) ?
                              wire58[(1'h0):(1'h0)] : ((wire40 || wire55) - (!wire39)))} : wire58[(2'h3):(1'h0)]);
endmodule

module module14  (y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire19;
  input wire signed [(4'he):(1'h0)] wire18;
  input wire signed [(4'h8):(1'h0)] wire17;
  input wire signed [(4'he):(1'h0)] wire16;
  input wire [(3'h7):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire25;
  wire signed [(3'h4):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire20;
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire21,
                 wire20,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire20 = $unsigned($signed($signed(wire18)));
  assign wire21 = wire15;
  always
    @(posedge clk) begin
      reg22 <= ((&wire16) == $unsigned((wire20 >>> $unsigned((~wire15)))));
      reg23 <= ((wire17[(1'h0):(1'h0)] ? wire19[(4'h9):(4'h9)] : wire21) ?
          wire15 : (-$signed(($unsigned(reg22) ~^ (wire17 - wire16)))));
    end
  assign wire24 = $unsigned($unsigned($unsigned(($signed((8'ha2)) ?
                      (reg23 ? wire20 : reg23) : (wire20 >= (8'hb6))))));
  assign wire25 = $signed(wire16[(3'h7):(3'h6)]);
  assign wire26 = reg23;
  assign wire27 = (~&$signed((~wire24)));
  always
    @(posedge clk) begin
      reg28 <= wire18;
      reg29 <= (reg23[(4'he):(1'h0)] * (!wire19[(4'h8):(4'h8)]));
      reg30 <= reg29[(4'ha):(1'h0)];
      reg31 <= (((($signed(wire26) ? wire24 : (^wire24)) ?
              $unsigned((wire21 ? reg28 : wire26)) : wire25[(3'h7):(2'h2)]) ?
          (&$signed({(8'ha3)})) : ($unsigned((wire27 ? wire20 : wire26)) ?
              $signed(wire15[(3'h4):(2'h3)]) : (((8'hb4) << reg23) | (wire17 ?
                  reg30 : (7'h44))))) && wire20[(4'ha):(4'h8)]);
    end
  always
    @(posedge clk) begin
      reg32 <= (^~$unsigned($signed((8'hba))));
    end
endmodule
