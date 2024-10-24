module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire102;
  wire signed [(5'h14):(1'h0)] wire101;
  wire signed [(3'h7):(1'h0)] wire100;
  wire [(4'hd):(1'h0)] wire99;
  wire [(4'h8):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(4'h8):(1'h0)] wire96;
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire23,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire96,
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
  module5 #() modinst24 (.wire9(wire3), .wire6(wire1), .y(wire23), .wire8(wire0), .clk(clk), .wire7(wire2));
  always
    @(posedge clk) begin
      reg25 <= $unsigned((+wire0));
      if ((|wire4[(3'h7):(3'h4)]))
        begin
          reg26 <= $signed(wire0[(4'h9):(3'h5)]);
          reg27 <= $unsigned(wire23);
        end
      else
        begin
          reg26 <= (8'hbb);
          reg27 <= {$unsigned(({(reg27 ? wire3 : reg26),
                  (wire2 ?
                      wire3 : wire0)} <<< ((|reg25) | (reg27 ^~ (8'hba))))),
              (wire0 ? $signed(wire2) : (-(&$signed(reg26))))};
          reg28 <= wire2[(2'h3):(2'h3)];
          if ($unsigned(reg28[(3'h6):(3'h4)]))
            begin
              reg29 <= (~|(~|$unsigned(($unsigned((8'h9f)) | (wire23 ?
                  (8'h9d) : (8'hb5))))));
              reg30 <= (((8'hb7) >> $unsigned($unsigned($unsigned(reg26)))) ?
                  (reg25 ~^ wire2) : $unsigned($unsigned((~&(wire4 ~^ (8'hb6))))));
              reg31 <= reg26[(4'h8):(2'h3)];
              reg32 <= reg31;
            end
          else
            begin
              reg29 <= (^~$signed(reg29));
            end
          reg33 <= wire0[(4'he):(4'h9)];
        end
      reg34 <= wire0;
      reg35 <= reg33[(2'h3):(1'h0)];
      reg36 <= (reg35 ?
          $signed((~|({reg29} | (wire23 ?
              (8'ha0) : wire3)))) : (($unsigned($signed((8'h9c))) ?
              $signed($unsigned(reg35)) : (~|$signed(reg26))) ~^ $unsigned($unsigned($signed(wire1)))));
    end
  assign wire37 = $unsigned(reg29);
  assign wire38 = wire0;
  assign wire39 = $unsigned(($unsigned(reg32) | $unsigned((+(reg28 < reg25)))));
  assign wire40 = wire4[(2'h3):(1'h1)];
  assign wire41 = $unsigned((reg32[(5'h10):(2'h3)] ?
                      {$signed((~&wire1)), (~&$signed(wire40))} : wire39));
  module42 #() modinst97 (.y(wire96), .wire43(wire37), .wire46(reg31), .wire45(reg34), .clk(clk), .wire47(wire41), .wire44(wire3));
  assign wire98 = $signed((|wire96[(2'h3):(1'h0)]));
  assign wire99 = $unsigned((-$unsigned((~|reg34))));
  assign wire100 = $signed((reg32 ?
                       wire99[(2'h3):(2'h3)] : wire3[(3'h4):(2'h2)]));
  assign wire101 = ($unsigned((({(8'hb2), (8'hb2)} ?
                               ((8'hb5) ? reg30 : reg35) : ((7'h43) <= reg30)) ?
                           $signed((|(8'hb4))) : wire99)) ?
                       (^($signed((reg26 ?
                           reg34 : reg32)) || ($unsigned(wire98) ?
                           (reg26 ?
                               wire99 : wire100) : wire4))) : ($signed({(~|wire4),
                               {reg26, reg29}}) ?
                           reg36[(3'h5):(2'h3)] : (~^$signed((wire2 ?
                               reg35 : wire41)))));
  assign wire102 = $signed((~|((reg32 ? (reg29 ? wire4 : wire41) : (|wire3)) ?
                       reg25[(1'h0):(1'h0)] : $signed((reg36 ?
                           wire4 : reg34)))));
endmodule

module module42
#(parameter param94 = (8'h9e), 
parameter param95 = param94)
(y, clk, wire43, wire44, wire45, wire46, wire47);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire43;
  input wire [(4'ha):(1'h0)] wire44;
  input wire signed [(4'hb):(1'h0)] wire45;
  input wire [(2'h3):(1'h0)] wire46;
  input wire [(5'h15):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire93;
  wire [(3'h7):(1'h0)] wire92;
  wire signed [(4'ha):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire90;
  wire [(3'h4):(1'h0)] wire89;
  wire signed [(3'h6):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire52;
  wire [(3'h4):(1'h0)] wire53;
  wire signed [(5'h10):(1'h0)] wire54;
  wire [(4'hd):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire58;
  wire [(5'h11):(1'h0)] wire59;
  wire signed [(2'h2):(1'h0)] wire60;
  wire signed [(3'h7):(1'h0)] wire87;
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire48,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire60,
                 wire87,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire48 = wire44;
  always
    @(posedge clk) begin
      reg49 <= $unsigned(wire44[(1'h0):(1'h0)]);
      reg50 <= ({$signed($unsigned((wire48 ? wire48 : wire43)))} ?
          $signed(wire45) : (~{$unsigned($signed((8'h9f))),
              ({wire45, wire43} >= $unsigned(reg49))}));
      reg51 <= wire46;
    end
  assign wire52 = wire45[(3'h7):(1'h1)];
  assign wire53 = wire46;
  assign wire54 = (wire47[(2'h3):(1'h1)] ? wire48 : {wire46});
  assign wire55 = {{({$signed(wire47), reg49} - wire52), reg50},
                      $unsigned(((~|{wire48,
                          wire53}) << $unsigned(wire47[(3'h4):(2'h3)])))};
  assign wire56 = {$unsigned(wire43[(2'h2):(1'h0)]),
                      $signed((^~wire53[(3'h4):(1'h1)]))};
  assign wire57 = (((~^wire56) ~^ wire44[(2'h3):(1'h0)]) == wire47[(4'h9):(3'h6)]);
  assign wire58 = wire57[(3'h5):(1'h1)];
  assign wire59 = ($unsigned(wire46[(2'h2):(1'h1)]) * {wire52});
  assign wire60 = wire54;
  module61 #() modinst88 (wire87, clk, reg49, wire59, wire44, reg51, wire52);
  assign wire89 = wire44;
  assign wire90 = wire87;
  assign wire91 = $signed(wire57[(1'h1):(1'h0)]);
  assign wire92 = $unsigned(wire87[(3'h7):(2'h2)]);
  assign wire93 = $signed($signed($signed(((wire53 * wire45) ?
                      wire59 : wire59))));
endmodule

module module5
#(parameter param21 = (8'hbe), 
parameter param22 = (^~(&param21)))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire9;
  input wire [(2'h2):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire7;
  input wire [(4'h8):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire18;
  wire signed [(2'h2):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire14,
                 wire13,
                 wire11,
                 wire10,
                 reg17,
                 reg16,
                 reg15,
                 reg12,
                 (1'h0)};
  assign wire10 = $signed((^~$signed(wire9[(1'h0):(1'h0)])));
  assign wire11 = ($signed((|$unsigned(((8'hb1) >>> wire10)))) | (~&($signed(wire7) && wire7)));
  always
    @(posedge clk) begin
      reg12 <= wire11[(4'h8):(2'h3)];
    end
  assign wire13 = wire10;
  assign wire14 = $signed($signed((8'hb2)));
  always
    @(posedge clk) begin
      reg15 <= (&wire13[(4'hb):(4'ha)]);
      reg16 <= {(wire13[(4'hd):(3'h4)] ?
              (wire13 ^ $signed($unsigned(wire7))) : $unsigned($unsigned(wire7))),
          (wire7 <= wire8)};
      reg17 <= (+(+wire7));
    end
  assign wire18 = ((wire13 ?
                          $unsigned((wire9[(1'h0):(1'h0)] <<< $unsigned(wire10))) : reg17[(1'h0):(1'h0)]) ?
                      wire6[(3'h6):(3'h5)] : $unsigned((~|(~&$signed(wire6)))));
  assign wire19 = {({wire7[(4'h8):(3'h5)], wire18[(4'hc):(4'h9)]} ?
                          ($signed($signed(wire9)) - ((wire9 > reg15) ^ wire11)) : $unsigned(((wire6 ?
                              (8'h9f) : (8'ha9)) && wire9[(3'h5):(3'h5)])))};
  assign wire20 = wire8[(1'h0):(1'h0)];
endmodule

module module61
#(parameter param85 = ((((|((8'hba) <<< (8'hab))) >>> ((!(7'h43)) ? (^~(8'hb3)) : ((8'hb4) != (8'ha7)))) + ((^~(8'hb8)) || {{(8'hae)}})) ? (+{(((8'hbf) ? (8'hac) : (8'ha4)) != {(7'h42), (8'hb4)}), ((^(8'ha1)) > ((7'h43) >> (8'ha3)))}) : (|({((8'ha4) ? (8'hbc) : (8'hb8)), (7'h43)} != (~(-(8'hbf)))))), 
parameter param86 = (!param85))
(y, clk, wire66, wire65, wire64, wire63, wire62);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire66;
  input wire signed [(5'h11):(1'h0)] wire65;
  input wire signed [(4'ha):(1'h0)] wire64;
  input wire signed [(2'h2):(1'h0)] wire63;
  input wire [(3'h6):(1'h0)] wire62;
  wire [(5'h13):(1'h0)] wire84;
  wire [(4'hc):(1'h0)] wire83;
  wire [(4'h8):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire81;
  wire signed [(5'h10):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire79;
  wire signed [(4'he):(1'h0)] wire78;
  wire [(5'h15):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire76;
  wire [(4'h8):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire74;
  wire [(4'ha):(1'h0)] wire73;
  wire signed [(4'ha):(1'h0)] wire72;
  wire [(5'h15):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire69;
  wire [(4'hf):(1'h0)] wire68;
  wire [(2'h2):(1'h0)] wire67;
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 (1'h0)};
  assign wire67 = wire66;
  assign wire68 = (($unsigned(wire64) ?
                          (|$signed((wire62 << wire63))) : ((^(wire67 ?
                              (8'hba) : wire62)) == wire67)) ?
                      wire66 : (wire64[(1'h1):(1'h1)] ?
                          (&(wire64[(1'h1):(1'h0)] ?
                              $signed(wire64) : {wire62,
                                  wire62})) : $signed(wire65[(1'h0):(1'h0)])));
  assign wire69 = $signed((($signed({wire68, wire64}) ?
                      (^~wire68[(3'h6):(2'h3)]) : {$unsigned(wire65)}) ^~ (^(~&(wire63 ?
                      wire68 : wire67)))));
  assign wire70 = {$signed((~|$signed({wire65, wire68}))),
                      (&(wire64[(3'h6):(1'h0)] ?
                          ((wire65 <= wire67) ?
                              (wire66 ?
                                  (8'hb2) : wire64) : $unsigned(wire69)) : (8'hba)))};
  assign wire71 = (-$unsigned((7'h43)));
  assign wire72 = (8'haa);
  assign wire73 = wire65;
  assign wire74 = wire62;
  assign wire75 = wire70[(4'hd):(4'h9)];
  assign wire76 = $signed((wire66[(1'h1):(1'h0)] ?
                      (~wire70[(4'hf):(2'h3)]) : $unsigned((~&{wire73}))));
  assign wire77 = $unsigned(wire68);
  assign wire78 = (wire76[(4'hc):(4'ha)] ?
                      {{(!(wire72 ?
                                  wire64 : wire66))}} : (~$signed($unsigned(wire69[(3'h5):(3'h5)]))));
  assign wire79 = (-$unsigned($signed((wire67[(1'h1):(1'h1)] ?
                      (wire63 >>> wire68) : (!wire69)))));
  assign wire80 = wire63[(1'h0):(1'h0)];
  assign wire81 = (($unsigned(((wire65 * wire77) < (wire68 ?
                      wire78 : wire70))) <<< (~^(~|$unsigned((8'hb0))))) | wire66[(5'h10):(3'h4)]);
  assign wire82 = {$signed($unsigned(({wire68, wire72} ?
                          wire70[(4'h9):(2'h2)] : ((8'h9d) ?
                              wire74 : wire72)))),
                      wire65[(3'h7):(3'h6)]};
  assign wire83 = (^(^~(((wire78 ? wire82 : wire76) <= (wire81 ?
                          wire62 : wire74)) ?
                      wire82 : $signed((wire75 >= wire73)))));
  assign wire84 = (wire79 <<< $signed({wire67, wire74}));
endmodule
