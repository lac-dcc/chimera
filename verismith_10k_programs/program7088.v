module top
#(parameter param115 = (((^~(+{(8'ha7), (8'h9d)})) ? (({(8'ha4), (7'h43)} ? ((8'hbc) ? (8'haa) : (8'ha1)) : (|(8'had))) ? ({(8'ha3), (8'ha7)} >>> ((8'haf) ^ (8'hbe))) : ((-(8'h9c)) ? {(8'ha1), (8'hb6)} : ((8'ha3) >>> (8'hba)))) : (|{((7'h43) || (8'ha1))})) ? (({((8'hb2) + (8'ha7)), ((8'hb7) <= (7'h43))} ? (~^((8'ha4) == (8'ha1))) : (~&((8'haf) ? (8'hb2) : (8'ha3)))) ? ((~((8'hb2) ? (8'hba) : (8'hb7))) ? (((8'ha3) >> (8'hab)) != (!(8'h9e))) : {((8'hb2) >= (8'hb6)), (8'h9e)}) : ((((8'ha2) ? (8'h9c) : (8'ha7)) && (~&(8'ha5))) ? ((8'hbf) >= ((8'haa) ? (8'ha2) : (8'had))) : (((8'ha4) ? (8'hb2) : (8'haa)) ? ((7'h40) ? (8'ha0) : (8'ha0)) : ((8'hb5) ? (8'h9f) : (8'ha9))))) : (({{(8'hb5)}, ((7'h40) ? (8'hb0) : (8'had))} && (|((8'ha0) & (8'ha5)))) + ({((7'h41) ? (8'hb8) : (8'ha3)), ((8'hb8) ^~ (7'h41))} | (!((7'h40) >> (8'h9f)))))), 
parameter param116 = (((|(((7'h44) ? (8'haa) : param115) ? param115 : (&param115))) <= (-(~|(param115 ? param115 : param115)))) ? (param115 ? {(((8'hb2) ? (7'h42) : param115) ~^ (param115 ? param115 : (8'ha8)))} : {param115}) : (8'ha9)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire91;
  wire [(3'h4):(1'h0)] wire90;
  wire [(5'h15):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire88;
  assign y = {wire113, wire91, wire90, wire5, wire23, wire88, (1'h0)};
  assign wire5 = ((~$unsigned(((wire2 ? wire1 : wire3) && wire4))) ?
                     {$unsigned(wire3),
                         wire0[(3'h6):(3'h5)]} : $unsigned(((wire2 && (-(8'ha2))) ~^ wire0)));
  module6 #() modinst24 (wire23, clk, wire4, wire2, wire0, wire5);
  module25 #() modinst89 (wire88, clk, wire1, wire2, wire4, wire5, wire0);
  assign wire90 = {$signed((!((~^wire88) < wire88[(4'h9):(4'h9)])))};
  assign wire91 = $signed((((+(-wire2)) * wire88[(4'h9):(3'h6)]) ?
                      (~|$unsigned(wire3)) : (+$unsigned((wire1 > wire5)))));
  module92 #() modinst114 (.clk(clk), .wire96(wire88), .wire94(wire5), .wire93(wire23), .y(wire113), .wire95(wire0));
endmodule

module module92  (y, clk, wire96, wire95, wire94, wire93);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire96;
  input wire [(5'h13):(1'h0)] wire95;
  input wire [(5'h15):(1'h0)] wire94;
  input wire signed [(5'h14):(1'h0)] wire93;
  wire [(4'hb):(1'h0)] wire112;
  wire signed [(4'hf):(1'h0)] wire111;
  wire signed [(5'h14):(1'h0)] wire110;
  wire [(3'h4):(1'h0)] wire109;
  wire signed [(5'h13):(1'h0)] wire108;
  wire [(5'h11):(1'h0)] wire107;
  wire signed [(4'h8):(1'h0)] wire106;
  wire signed [(2'h2):(1'h0)] wire105;
  wire [(5'h14):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  wire signed [(3'h5):(1'h0)] wire102;
  wire [(2'h3):(1'h0)] wire101;
  wire [(5'h15):(1'h0)] wire98;
  wire signed [(5'h15):(1'h0)] wire97;
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire98,
                 wire97,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire97 = (-({(+(^wire96)), wire95} >>> ({{wire96}} ?
                      $signed(((8'hb4) ?
                          wire93 : wire95)) : ((wire95 != wire96) ?
                          $unsigned(wire96) : wire93))));
  assign wire98 = $unsigned($unsigned({$unsigned(wire97[(2'h2):(2'h2)])}));
  always
    @(posedge clk) begin
      reg99 <= ((wire95 != ((+(wire97 ? wire96 : wire95)) ?
          (|(wire93 >> (8'ha1))) : ((wire98 | wire95) >> wire93))) || wire98[(3'h4):(1'h1)]);
      reg100 <= wire93[(5'h12):(2'h3)];
    end
  assign wire101 = (|{reg100[(4'hc):(4'ha)],
                       ($unsigned((wire94 * wire98)) ?
                           ((wire96 << reg99) <= {wire97}) : (+(|wire96)))});
  assign wire102 = wire101;
  assign wire103 = (8'haa);
  assign wire104 = $unsigned($unsigned(reg99));
  assign wire105 = (+wire95);
  assign wire106 = $signed({wire104,
                       {wire93[(5'h10):(4'hc)], wire93[(4'ha):(3'h5)]}});
  assign wire107 = (($unsigned(($unsigned(reg99) == $signed(wire102))) << ({(wire104 ?
                           wire101 : reg99),
                       $unsigned(wire97)} ^~ $unsigned($signed(wire93)))) != wire98);
  assign wire108 = (!(|(wire105[(2'h2):(1'h0)] <<< $unsigned($signed((8'ha3))))));
  assign wire109 = reg100[(4'he):(4'h9)];
  assign wire110 = wire106[(3'h5):(2'h2)];
  assign wire111 = (((^($signed(wire98) ?
                           wire96[(4'h9):(3'h5)] : (!wire103))) * (reg100 ?
                           ((^wire110) ^~ (wire93 ?
                               wire94 : wire95)) : wire93)) ?
                       wire107[(4'h8):(3'h7)] : $unsigned(($signed((wire101 >> wire102)) > wire106)));
  assign wire112 = {(($signed({wire103}) ?
                           $signed((wire106 ?
                               (8'ha8) : wire106)) : (8'hba)) < wire104),
                       wire103};
endmodule

module module25  (y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire30;
  input wire [(4'hd):(1'h0)] wire29;
  input wire signed [(4'h8):(1'h0)] wire28;
  input wire signed [(3'h4):(1'h0)] wire27;
  input wire [(5'h10):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire84;
  wire signed [(3'h5):(1'h0)] wire83;
  wire signed [(4'h9):(1'h0)] wire81;
  wire signed [(2'h3):(1'h0)] wire46;
  wire [(4'h9):(1'h0)] wire45;
  wire signed [(5'h12):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire42;
  wire [(4'hc):(1'h0)] wire37;
  wire signed [(4'he):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  reg [(4'hd):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  assign y = {wire87,
                 wire85,
                 wire84,
                 wire83,
                 wire81,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg86,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg47,
                 reg48,
                 (1'h0)};
  assign wire31 = wire27;
  assign wire32 = (8'ha5);
  assign wire33 = ((~^$signed(wire29)) + $signed((((^wire26) >> {wire31}) >>> (8'hbb))));
  assign wire34 = $signed(wire29[(1'h0):(1'h0)]);
  assign wire35 = wire26;
  assign wire36 = {(wire27[(2'h2):(1'h0)] + $signed(wire28)),
                      (+$unsigned(wire33))};
  assign wire37 = {wire27[(3'h4):(2'h2)]};
  always
    @(posedge clk) begin
      reg38 <= (^~$signed($unsigned(((wire32 ? wire33 : wire31) ?
          (wire28 ? wire36 : wire36) : (&wire28)))));
      if ((wire28 << {$signed(((8'hbd) ?
              (wire35 ? (8'hb4) : wire29) : (^~wire31)))}))
        begin
          reg39 <= (($signed(($signed(wire36) ^~ $unsigned(wire32))) ?
              (+$signed(wire26[(3'h4):(2'h3)])) : $unsigned(($signed(wire26) ?
                  $unsigned(wire33) : ((8'hb1) == (8'hab))))) | $unsigned(($unsigned($unsigned(wire28)) - ($signed(wire26) && wire37[(3'h4):(1'h0)]))));
          reg40 <= $signed($signed($unsigned(wire35[(5'h12):(3'h7)])));
          reg41 <= ({reg39[(1'h0):(1'h0)]} | (~$signed(wire29)));
        end
      else
        begin
          reg39 <= {wire26};
        end
    end
  assign wire42 = wire36[(4'hb):(1'h1)];
  assign wire43 = $signed(wire28);
  assign wire44 = $signed((reg41[(4'ha):(3'h6)] ?
                      reg41 : (wire35 >= wire33[(1'h0):(1'h0)])));
  assign wire45 = ((wire31 >= wire29) ?
                      ($unsigned($unsigned((+wire26))) ?
                          {($unsigned((8'h9f)) ?
                                  $unsigned((8'hb7)) : reg38[(4'ha):(3'h6)])} : reg40[(4'h9):(4'h9)]) : $signed($signed((^$unsigned(wire37)))));
  assign wire46 = wire30[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg47 <= (^$signed(reg39[(2'h3):(1'h1)]));
      reg48 <= $signed((~((!(wire31 == reg40)) ?
          $signed((+wire37)) : {wire45[(3'h4):(3'h4)]})));
    end
  module49 #() modinst82 (wire81, clk, wire35, wire42, wire45, reg40, wire31);
  assign wire83 = wire34;
  assign wire84 = $signed((wire34[(3'h4):(3'h4)] * ({(wire34 - wire33),
                          wire81[(3'h4):(3'h4)]} ?
                      ((wire26 & reg40) ?
                          (^wire26) : reg41[(4'hd):(4'ha)]) : {$signed((8'ha5))})));
  assign wire85 = (reg38[(3'h6):(3'h6)] ?
                      $unsigned($signed($unsigned(reg41))) : $signed($unsigned(((wire27 ?
                              wire33 : wire29) ?
                          reg47[(3'h7):(1'h1)] : $signed(reg47)))));
  always
    @(posedge clk) begin
      reg86 <= $unsigned(wire28);
    end
  assign wire87 = ($unsigned(wire42[(2'h3):(2'h3)]) >>> (((~|wire31) ?
                          (^wire31[(4'hc):(3'h5)]) : ($unsigned(wire44) ?
                              wire28 : (wire35 ? wire31 : wire83))) ?
                      $signed($signed((wire42 ?
                          (8'hbc) : wire83))) : $unsigned({reg47})));
endmodule

module module6
#(parameter param22 = (((((+(8'hbc)) != ((8'ha2) ? (8'hb7) : (8'hba))) <<< (~((8'ha2) ^~ (8'ha1)))) < ((~&((8'hba) ? (8'h9e) : (7'h40))) && (~&((8'hbe) > (8'hbb))))) | (+(!{((8'hbf) || (8'haa)), ((8'h9c) << (8'hb7))}))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(3'h7):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire11;
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 (1'h0)};
  assign wire11 = ($signed($signed(wire9[(4'hc):(4'h9)])) ?
                      wire10[(4'hf):(3'h4)] : $signed(wire7[(3'h4):(3'h4)]));
  assign wire12 = wire10;
  assign wire13 = $unsigned(wire8);
  assign wire14 = {{wire7[(1'h0):(1'h0)],
                          (wire8 ?
                              ($signed(wire10) ?
                                  {wire7,
                                      wire7} : (8'hbd)) : wire9[(1'h0):(1'h0)])},
                      wire7[(3'h4):(1'h0)]};
  assign wire15 = ($unsigned(wire11) ? (~^wire9) : wire12);
  assign wire16 = {$signed(wire11[(3'h7):(3'h7)]), $signed(wire9)};
  assign wire17 = (wire13 || $unsigned((wire10[(2'h2):(1'h0)] ?
                      {(wire14 ? wire9 : (8'hb6))} : {(-wire10), wire13})));
  assign wire18 = wire10[(4'he):(4'h9)];
  assign wire19 = wire17;
  assign wire20 = wire19[(1'h0):(1'h0)];
  assign wire21 = $unsigned($unsigned((((wire18 ?
                      wire13 : wire9) & $signed(wire15)) <<< $signed(wire11[(3'h6):(3'h6)]))));
endmodule

module module49
#(parameter param80 = (((8'h9d) ^ ((((8'hb2) << (7'h40)) << ((8'hbd) ? (8'haf) : (8'hbf))) ? {((7'h44) <= (8'hb4))} : ({(8'hab), (8'hbd)} ? (~|(8'h9d)) : ((8'hab) ? (8'ha4) : (8'hbe))))) << (({(|(8'hb1))} >>> ((~^(8'haa)) ? ((8'ha6) >= (8'hb5)) : ((8'hb1) == (8'hb5)))) * ((-((8'hab) ? (8'hb9) : (8'ha3))) ? (8'hb8) : (((8'ha5) ? (8'hb7) : (8'hac)) ^ (~|(8'hb0)))))))
(y, clk, wire54, wire53, wire52, wire51, wire50);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire54;
  input wire [(2'h3):(1'h0)] wire53;
  input wire signed [(2'h3):(1'h0)] wire52;
  input wire signed [(5'h10):(1'h0)] wire51;
  input wire signed [(4'hf):(1'h0)] wire50;
  wire [(4'h9):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire77;
  wire signed [(4'h9):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire70;
  wire signed [(2'h3):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire67;
  wire signed [(5'h12):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire65;
  wire signed [(2'h3):(1'h0)] wire64;
  wire signed [(3'h7):(1'h0)] wire63;
  wire signed [(4'hd):(1'h0)] wire62;
  wire signed [(4'h8):(1'h0)] wire61;
  wire [(5'h11):(1'h0)] wire60;
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire75,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 reg79,
                 reg76,
                 reg74,
                 reg73,
                 reg72,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg55 <= wire54;
      reg56 <= ((8'hac) ^ (|$unsigned(reg55[(4'h8):(3'h6)])));
      reg57 <= $unsigned((^$signed($signed(wire52[(2'h3):(2'h3)]))));
      reg58 <= $unsigned(wire54);
      reg59 <= {((7'h40) ?
              ({{wire50}} | ($signed(reg57) == wire54)) : ((8'h9c) << ((wire52 ?
                  reg55 : wire54) ~^ $unsigned(wire53))))};
    end
  assign wire60 = wire51;
  assign wire61 = $signed(reg58[(2'h3):(1'h1)]);
  assign wire62 = (!$unsigned((&(~(reg59 ? (8'hbf) : reg55)))));
  assign wire63 = $unsigned((+($signed((+reg56)) ?
                      $unsigned($signed(wire51)) : (7'h41))));
  assign wire64 = $unsigned((((reg57[(4'hd):(3'h5)] <<< (8'hab)) - reg57) ?
                      $unsigned(wire62[(2'h3):(1'h1)]) : (8'hb4)));
  assign wire65 = (~wire52[(1'h0):(1'h0)]);
  assign wire66 = wire53[(2'h2):(1'h0)];
  assign wire67 = ((~^$unsigned($unsigned($signed(wire61)))) ~^ ($signed($signed($signed(wire65))) <<< (wire52[(1'h1):(1'h0)] ?
                      wire52 : wire54[(4'hb):(3'h4)])));
  assign wire68 = wire50;
  assign wire69 = $unsigned($unsigned($signed($signed((wire54 ?
                      (8'had) : (8'haa))))));
  assign wire70 = (8'ha2);
  assign wire71 = ((8'hb9) ~^ $signed((~(!(reg56 > wire50)))));
  always
    @(posedge clk) begin
      reg72 <= (^$unsigned($unsigned(reg57[(5'h12):(4'hd)])));
      reg73 <= $signed(($unsigned(((!wire61) | {reg72, wire60})) ?
          $signed($unsigned((-wire67))) : $signed((&$unsigned(wire51)))));
      reg74 <= wire66;
    end
  assign wire75 = reg73[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg76 <= reg58;
    end
  assign wire77 = (wire67 | ((+wire64[(1'h1):(1'h1)]) < ($signed((wire66 != wire66)) >>> ($unsigned(wire68) <= (wire71 ?
                      (8'hbd) : wire61)))));
  assign wire78 = wire52;
  always
    @(posedge clk) begin
      reg79 <= $signed((~(((8'ha4) | $unsigned(reg59)) ~^ reg73)));
    end
endmodule
