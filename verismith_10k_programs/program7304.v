module top
#(parameter param119 = (((~|(((8'ha3) ? (8'ha4) : (8'ha8)) ? ((8'ha6) ? (8'ha1) : (8'ha5)) : {(8'ha3), (8'hab)})) != (8'hac)) ? ((8'ha4) >> (({(8'hbd), (8'hae)} ? {(7'h41), (8'hbb)} : ((8'hb4) >= (7'h42))) & ({(8'ha3)} ? ((8'haf) <= (8'hb7)) : ((8'hb9) ? (8'ha3) : (8'hb2))))) : (^(((|(8'hb5)) ? (~^(8'hb9)) : ((8'hae) ? (8'ha2) : (8'haf))) > (((8'hb4) >> (8'ha4)) ^~ ((7'h40) < (8'ha4)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire118;
  wire signed [(4'hc):(1'h0)] wire117;
  wire signed [(4'h9):(1'h0)] wire116;
  wire [(3'h7):(1'h0)] wire113;
  wire [(5'h13):(1'h0)] wire111;
  reg signed [(4'h8):(1'h0)] reg115 = (1'h0);
  reg [(4'hc):(1'h0)] reg114 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire113,
                 wire111,
                 reg115,
                 reg114,
                 (1'h0)};
  module4 #() modinst112 (.wire9((8'ha1)), .y(wire111), .wire5(wire2), .wire8(wire3), .clk(clk), .wire7(wire1), .wire6(wire0));
  assign wire113 = $signed(((wire3 ?
                       $signed((wire0 >>> wire1)) : wire0[(4'he):(4'h8)]) & wire3[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg114 <= wire1[(3'h6):(1'h0)];
      reg115 <= $signed((^~wire2[(3'h6):(3'h5)]));
    end
  assign wire116 = $unsigned(wire113[(1'h0):(1'h0)]);
  assign wire117 = (!(^~reg115[(1'h0):(1'h0)]));
  assign wire118 = {(wire3 ? wire0[(4'he):(4'hb)] : wire111[(3'h5):(2'h3)]),
                       (^wire113[(2'h3):(1'h1)])};
endmodule

module module4
#(parameter param109 = ((((^((8'ha9) ? (8'hab) : (7'h44))) >> (((8'hbf) >>> (8'ha4)) ? ((8'hb0) ? (8'hb5) : (8'ha9)) : (~^(8'hb7)))) ? (~|(((8'hb4) << (8'hb7)) || ((8'hb8) << (8'hbd)))) : {({(8'hbb)} ? {(8'hbf), (8'hb7)} : ((8'hb9) - (8'ha2))), (((8'ha1) & (8'hbd)) > {(8'ha8)})}) - (((((8'hb0) ? (7'h42) : (8'h9e)) <= (~&(8'h9f))) ? (((7'h44) ? (8'hac) : (8'hb3)) ? (!(8'hb6)) : (8'ha9)) : ((^(8'hbc)) == (+(8'hb9)))) ? {({(8'had)} | {(8'hac), (8'hbe)}), (~&(~|(8'h9d)))} : (~&(((8'hbf) << (7'h44)) ? ((8'ha3) ? (8'hb4) : (8'h9f)) : {(8'haa), (7'h43)})))), 
parameter param110 = (~^(((^{param109}) == param109) ? ((param109 ? (|param109) : (&param109)) ? param109 : ((~^param109) * (param109 ? param109 : param109))) : param109)))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire5;
  input wire [(5'h11):(1'h0)] wire6;
  input wire [(5'h11):(1'h0)] wire7;
  input wire signed [(3'h4):(1'h0)] wire8;
  input wire [(4'ha):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire108;
  wire [(5'h10):(1'h0)] wire106;
  wire signed [(4'ha):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire51;
  assign y = {wire108,
                 wire106,
                 wire53,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire51,
                 (1'h0)};
  assign wire10 = ($unsigned((wire6 ? wire6 : wire9)) & $signed((8'haa)));
  assign wire11 = wire8[(1'h1):(1'h1)];
  assign wire12 = ((~|$unsigned($unsigned($unsigned(wire6)))) ?
                      (wire10[(1'h1):(1'h0)] <= $signed(((^~wire6) ^ (~^wire5)))) : (~^($unsigned(wire10) ?
                          ($unsigned(wire6) ?
                              $signed((8'had)) : (~wire10)) : wire6)));
  assign wire13 = wire5[(3'h7):(1'h1)];
  assign wire14 = (~(~(~&wire10)));
  assign wire15 = {(|wire9)};
  assign wire16 = wire7[(2'h2):(2'h2)];
  assign wire17 = ((~|wire9) ?
                      ($signed((^(wire8 != (7'h41)))) ?
                          ($unsigned((wire11 ?
                              (8'ha4) : wire11)) <= $signed((+wire9))) : $signed(wire8[(2'h3):(2'h3)])) : wire6[(1'h1):(1'h0)]);
  assign wire18 = ({(({wire15, (8'hae)} ?
                              (8'ha3) : wire14) << {$unsigned(wire16),
                              {wire11}}),
                          wire14} ?
                      (wire12 ?
                          ($signed((-wire10)) || (&wire6)) : $signed(wire11[(1'h0):(1'h0)])) : (~|(!($signed((8'ha1)) & wire10[(3'h6):(2'h3)]))));
  assign wire19 = (~^$signed($unsigned($unsigned((wire5 ? wire18 : wire5)))));
  assign wire20 = $signed(($signed(wire10[(1'h1):(1'h0)]) && wire10[(3'h6):(3'h5)]));
  assign wire21 = ($signed((-(((8'ha4) && wire11) ?
                      (wire12 * wire5) : $unsigned(wire20)))) > (wire5[(3'h4):(2'h3)] ^ (^$unsigned(wire15))));
  module22 #() modinst52 (wire51, clk, wire10, wire19, wire9, wire13, wire12);
  assign wire53 = ($signed(wire10) | {wire16});
  module54 #() modinst107 (wire106, clk, wire14, wire17, wire6, wire16);
  assign wire108 = $signed((~&$signed($signed($unsigned(wire19)))));
endmodule

module module54  (y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h210):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire58;
  input wire signed [(3'h6):(1'h0)] wire57;
  input wire signed [(5'h11):(1'h0)] wire56;
  input wire [(5'h14):(1'h0)] wire55;
  wire [(3'h4):(1'h0)] wire105;
  wire signed [(4'ha):(1'h0)] wire104;
  wire signed [(2'h2):(1'h0)] wire103;
  wire [(3'h7):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire101;
  wire [(4'hb):(1'h0)] wire96;
  wire signed [(4'h8):(1'h0)] wire84;
  wire signed [(4'hf):(1'h0)] wire83;
  wire signed [(4'hb):(1'h0)] wire78;
  wire signed [(5'h14):(1'h0)] wire77;
  wire [(4'hc):(1'h0)] wire76;
  wire [(5'h11):(1'h0)] wire75;
  wire [(4'h8):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire67;
  wire signed [(3'h5):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire59;
  reg signed [(5'h10):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg98 = (1'h0);
  reg signed [(4'he):(1'h0)] reg97 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg91 = (1'h0);
  reg [(3'h4):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire96,
                 wire84,
                 wire83,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire69,
                 wire68,
                 wire67,
                 wire61,
                 wire60,
                 wire59,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
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
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire59 = wire58;
  assign wire60 = wire59;
  assign wire61 = (^((~|wire58[(4'h9):(4'h8)]) ?
                      (wire57[(1'h0):(1'h0)] ^ $unsigned($signed(wire56))) : wire60[(3'h5):(3'h4)]));
  always
    @(posedge clk) begin
      reg62 <= wire61[(2'h2):(1'h0)];
      reg63 <= $signed((8'h9d));
      reg64 <= $signed(wire58);
      reg65 <= $signed(({($signed(wire56) ~^ ((8'hb4) ? wire59 : reg62))} ?
          $unsigned(reg63) : $signed(reg62[(1'h0):(1'h0)])));
      reg66 <= (+wire58);
    end
  assign wire67 = (((wire60 ? wire55 : (!(reg64 ? (8'ha7) : wire55))) ?
                      $signed(($unsigned((8'hb8)) ?
                          (!wire58) : wire59)) : {reg65[(1'h1):(1'h0)]}) ~^ $unsigned(wire61));
  assign wire68 = (~($unsigned(wire56) | ((reg64 ^~ (reg63 >= reg63)) ?
                      (-((8'ha7) ^~ reg63)) : (wire55[(4'hb):(4'h9)] ?
                          (wire67 * wire55) : (wire56 <<< (8'h9e))))));
  assign wire69 = $signed(wire56);
  always
    @(posedge clk) begin
      reg70 <= $signed($signed(({$signed(wire56)} > {$unsigned((8'ha3)),
          (reg66 < wire59)})));
      if ((((wire57[(2'h2):(1'h0)] >> ($unsigned(reg63) ?
              (reg70 ?
                  (8'ha4) : reg70) : $unsigned(reg62))) <= ($signed((wire60 << (8'hb5))) ?
              reg62 : wire58[(4'h9):(1'h0)])) ?
          wire59 : $unsigned({{reg63}, reg64[(4'hf):(2'h3)]})))
        begin
          reg71 <= reg70[(2'h2):(1'h0)];
          reg72 <= ($signed(((wire55[(2'h2):(1'h0)] ?
                  $unsigned(wire67) : $signed(reg64)) ?
              (reg66[(3'h7):(2'h3)] ?
                  $signed(wire55) : $unsigned(wire59)) : $signed(reg66[(4'hb):(2'h3)]))) ~^ $unsigned((~wire60)));
        end
      else
        begin
          reg71 <= reg63;
          reg72 <= wire68;
        end
      reg73 <= {$unsigned((|$signed((reg63 - reg62)))), wire59[(4'h9):(1'h1)]};
      reg74 <= $signed((~|wire68[(1'h0):(1'h0)]));
    end
  assign wire75 = {$unsigned({(~&wire67), (&(!wire56))})};
  assign wire76 = wire68[(2'h2):(2'h2)];
  assign wire77 = (~&((+(8'ha1)) ?
                      ($unsigned((wire76 > (8'hbf))) ?
                          (((8'hb8) * reg62) ?
                              wire69 : {(8'hbe),
                                  reg65}) : wire67) : (wire67[(3'h7):(2'h3)] ?
                          ((~&reg65) <= wire76) : (((7'h41) ? wire75 : reg71) ?
                              $signed(reg71) : $unsigned(reg65)))));
  assign wire78 = reg65[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      reg79 <= (^~$unsigned(({(wire56 ? wire56 : wire59),
          reg63[(2'h3):(2'h2)]} < $signed((wire68 << wire61)))));
      if ($signed($signed(wire75[(3'h6):(3'h6)])))
        begin
          reg80 <= $signed($unsigned($unsigned(((reg73 != reg71) ?
              reg65[(4'h8):(3'h7)] : wire58))));
        end
      else
        begin
          reg80 <= ({{($unsigned(wire67) ? {reg74} : $signed(wire77))}} ?
              $signed(reg79[(4'h9):(4'h9)]) : $signed(wire68));
          reg81 <= $unsigned(reg74[(5'h13):(5'h13)]);
        end
      reg82 <= (^~($signed((wire75 ? reg62 : reg79)) << wire67));
    end
  assign wire83 = (({reg72,
                          $unsigned((|wire67))} * ($unsigned((reg72 < (8'hba))) ~^ (|{(8'hb6)}))) ?
                      {wire69[(3'h4):(2'h3)],
                          $unsigned((+$signed(wire67)))} : ((reg64[(4'ha):(4'ha)] ?
                          (&(wire60 * reg72)) : wire59) >>> wire59[(3'h4):(1'h0)]));
  assign wire84 = {((~&($unsigned(wire77) <= (^reg80))) <<< reg63[(1'h0):(1'h0)]),
                      wire60[(3'h5):(1'h0)]};
  always
    @(posedge clk) begin
      reg85 <= wire55[(5'h13):(1'h1)];
      if (wire59[(5'h10):(4'h8)])
        begin
          reg86 <= (($unsigned(($unsigned(wire68) != reg64)) >>> (reg85[(4'hb):(3'h4)] | wire61[(2'h2):(2'h2)])) | $signed((((wire69 >> reg70) ?
                  (reg85 * reg73) : (~^reg85)) ?
              (wire84 ?
                  $unsigned(wire59) : (^~(8'ha8))) : ((8'hb4) & (wire69 ^ reg82)))));
          reg87 <= (wire69 ?
              reg71[(3'h7):(3'h4)] : (reg81[(5'h10):(5'h10)] ?
                  {wire75[(4'hd):(1'h1)],
                      ((wire75 ?
                          reg72 : wire57) + (wire57 == wire75))} : ((~&$signed(wire67)) ?
                      $unsigned(((8'hb0) ?
                          reg81 : wire56)) : reg70[(2'h2):(1'h0)])));
          if (reg87[(1'h1):(1'h0)])
            begin
              reg88 <= ((|(+$signed($unsigned(reg70)))) * $unsigned($signed($unsigned(((8'h9f) ?
                  (7'h40) : reg73)))));
              reg89 <= (8'ha7);
              reg90 <= reg79[(4'ha):(3'h5)];
            end
          else
            begin
              reg88 <= (!$unsigned($unsigned($unsigned($unsigned((8'hbc))))));
              reg89 <= (-wire84);
              reg90 <= (7'h43);
              reg91 <= (reg89 ?
                  $unsigned((&((&wire83) < (reg87 ?
                      wire55 : (8'ha7))))) : $signed(wire58[(5'h10):(4'h8)]));
              reg92 <= reg66[(4'h8):(3'h4)];
            end
          reg93 <= $signed(reg63);
          reg94 <= (&$unsigned($signed($unsigned((reg72 <<< reg89)))));
        end
      else
        begin
          reg86 <= $signed(wire58[(2'h3):(1'h0)]);
          if ((wire78[(1'h1):(1'h0)] == (wire78[(4'hb):(3'h6)] ?
              $unsigned(({reg85, (8'hac)} ?
                  (wire67 < wire55) : $unsigned(reg66))) : $unsigned(reg85))))
            begin
              reg87 <= (^$signed($unsigned(wire61[(3'h5):(3'h5)])));
              reg88 <= reg73;
              reg89 <= (|$unsigned(reg93[(3'h5):(3'h4)]));
              reg90 <= (+({reg82} ? wire56[(1'h0):(1'h0)] : (~&reg89)));
              reg91 <= $signed(((reg85[(4'hc):(2'h3)] & ((wire55 ?
                      wire58 : wire78) ?
                  wire56[(4'h9):(2'h3)] : ((8'ha9) >>> (8'hb0)))) <= ($unsigned(reg79[(4'hc):(1'h1)]) != reg92)));
            end
          else
            begin
              reg87 <= (~^($unsigned({(reg70 << wire57)}) < $unsigned(reg93)));
              reg88 <= $unsigned($unsigned($signed(wire78[(2'h2):(2'h2)])));
            end
          reg92 <= (^~reg70[(2'h2):(1'h1)]);
        end
      reg95 <= $signed((|$unsigned(reg90)));
    end
  assign wire96 = ($signed($signed(((wire56 ? wire76 : (8'haf)) ?
                      $unsigned(reg62) : $signed(wire58)))) == (reg66[(2'h3):(1'h0)] ?
                      (+(^~(^(8'h9e)))) : $signed(($unsigned(reg94) ?
                          $unsigned(reg74) : (wire84 >= wire68)))));
  always
    @(posedge clk) begin
      reg97 <= (reg87 ?
          (((wire83[(4'h8):(3'h7)] ? (wire57 && reg63) : reg80[(2'h2):(1'h1)]) ?
                  wire57[(1'h0):(1'h0)] : reg63) ?
              ((7'h42) ?
                  {(^reg90),
                      wire55} : wire55) : $signed((wire84 < wire83[(3'h4):(2'h3)]))) : wire96);
      reg98 <= $unsigned(reg74[(1'h0):(1'h0)]);
      if ($signed((wire56 <<< (reg97 - $unsigned({reg97})))))
        begin
          reg99 <= wire75;
          reg100 <= ({(~reg64[(1'h0):(1'h0)])} << {$signed((~^{reg71,
                  wire57}))});
        end
      else
        begin
          reg99 <= wire58;
        end
    end
  assign wire101 = $unsigned(({((~|reg82) <<< (reg92 & wire55)),
                           ($signed(wire77) | (8'hb1))} ?
                       $unsigned((|wire69)) : reg98[(1'h1):(1'h0)]));
  assign wire102 = {$signed((8'hb3))};
  assign wire103 = (~|(8'hac));
  assign wire104 = (reg97[(4'he):(3'h7)] ?
                       $unsigned((-((reg72 | reg99) ?
                           $unsigned(reg70) : (reg66 > wire75)))) : $signed(($unsigned((wire59 ?
                               wire96 : reg74)) ?
                           $signed($signed((8'hb4))) : wire67[(2'h2):(2'h2)])));
  assign wire105 = wire57;
endmodule

module module22
#(parameter param49 = ({((~&((8'ha1) ? (8'h9e) : (8'hb4))) <<< (^~((8'ha8) ? (8'hb6) : (8'h9c)))), {((~^(7'h44)) ? (~&(8'hac)) : ((8'hac) | (8'ha9))), (^~{(7'h44), (8'ha7)})}} > ((^({(8'hbc), (8'hba)} ? ((8'hb3) <= (7'h43)) : ((8'hac) ^~ (8'hbc)))) ? ((((8'h9d) != (8'ha7)) >= ((8'hab) ? (8'ha2) : (8'hbe))) ? (~|{(7'h44)}) : {(!(8'hbb)), (~^(8'ha4))}) : (8'hb1))), 
parameter param50 = (((param49 ? (8'had) : ({param49} - param49)) < (^~param49)) ? (!(^~(~(&param49)))) : (~|((+(~param49)) ~^ param49))))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire27;
  input wire [(2'h2):(1'h0)] wire26;
  input wire [(4'ha):(1'h0)] wire25;
  input wire signed [(3'h7):(1'h0)] wire24;
  input wire signed [(5'h14):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire47;
  wire [(3'h4):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire43;
  wire [(5'h13):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire35;
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg40,
                 reg39,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg28 <= (wire27[(4'ha):(1'h1)] ?
          ((^((+(8'hb7)) >= wire26[(1'h1):(1'h1)])) ?
              ((^(wire26 <<< wire26)) << ((|wire26) ?
                  {wire26} : $signed(wire23))) : wire26[(1'h1):(1'h1)]) : (~|$signed(wire23)));
      reg29 <= ({(+(^~$unsigned((8'had)))),
              (wire25[(1'h1):(1'h0)] < (wire25 << (~|wire27)))} ?
          (~&$unsigned({(!wire26)})) : ($signed((wire24 ?
                  wire25[(3'h5):(2'h3)] : (^~reg28))) ?
              wire27[(1'h1):(1'h1)] : wire25));
      reg30 <= wire26[(1'h0):(1'h0)];
      if ($unsigned(wire26))
        begin
          reg31 <= $signed(wire27);
        end
      else
        begin
          reg31 <= reg28[(4'hb):(4'h9)];
          reg32 <= $unsigned(({(reg29[(3'h7):(1'h0)] <= wire23[(3'h7):(3'h6)]),
              wire24[(3'h4):(2'h3)]} & $unsigned(wire24[(3'h4):(1'h1)])));
          reg33 <= wire26[(1'h1):(1'h1)];
          reg34 <= ($unsigned(reg29[(4'h8):(3'h4)]) != ($unsigned((&reg33[(4'hd):(3'h5)])) <= {($unsigned(wire23) ?
                  $unsigned((8'ha5)) : wire25[(3'h5):(1'h1)]),
              reg30}));
        end
    end
  assign wire35 = wire24[(1'h1):(1'h1)];
  assign wire36 = $unsigned(wire27);
  assign wire37 = (wire35[(3'h4):(3'h4)] ?
                      ($signed(((wire27 == wire24) && (reg29 == wire35))) ?
                          (reg30 ?
                              $unsigned({(8'h9e),
                                  (8'h9d)}) : reg28[(2'h3):(2'h2)]) : wire23) : $signed((8'haf)));
  assign wire38 = wire27[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg39 <= wire25;
      reg40 <= ($unsigned((((reg31 ? wire26 : reg30) <= {reg33}) ?
          reg30[(4'h9):(3'h7)] : wire38)) || wire37[(4'hf):(4'hb)]);
    end
  assign wire41 = wire38[(4'ha):(3'h7)];
  assign wire42 = wire38;
  assign wire43 = ($unsigned(wire36) ?
                      ((|$unsigned((-reg40))) ?
                          (^$signed($unsigned((8'hb0)))) : (((-(8'ha7)) ~^ wire41[(4'ha):(3'h6)]) ?
                              $unsigned(reg40) : ($signed(wire35) & wire38[(4'h9):(3'h5)]))) : (-wire42[(4'h9):(1'h1)]));
  assign wire44 = ((({$signed(wire27)} & $signed(((8'hba) - wire24))) ?
                          {wire42} : (-((reg31 ^~ wire27) ?
                              $signed(reg31) : ((8'hb7) ? (8'h9f) : wire35)))) ?
                      $unsigned((((wire38 ?
                          reg29 : reg31) <= wire41[(4'hd):(4'h8)]) >= $unsigned($signed(reg33)))) : wire23);
  assign wire45 = ((&reg33) ?
                      $unsigned(wire26[(1'h0):(1'h0)]) : (reg40[(4'ha):(3'h7)] ?
                          ($signed(reg28) ?
                              ({reg31, wire26} ?
                                  $unsigned(wire26) : reg33) : (~|((8'hbf) ?
                                  (8'hb9) : reg39))) : (|$signed(wire25[(3'h4):(2'h2)]))));
  assign wire46 = $unsigned(((~|$unsigned((reg33 >= wire41))) != $signed($unsigned($unsigned(wire45)))));
  assign wire47 = $signed(wire38);
  assign wire48 = (|{(^~(^wire47[(3'h4):(1'h0)])), wire26});
endmodule
