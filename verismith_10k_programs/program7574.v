module top #(parameter param214 = (8'hb7)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire208;
  wire [(2'h2):(1'h0)] wire207;
  wire [(5'h12):(1'h0)] wire75;
  wire signed [(4'hd):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire77;
  wire [(3'h4):(1'h0)] wire202;
  wire [(3'h5):(1'h0)] wire204;
  reg signed [(3'h4):(1'h0)] reg213 = (1'h0);
  reg [(5'h13):(1'h0)] reg212 = (1'h0);
  reg [(4'hb):(1'h0)] reg211 = (1'h0);
  reg [(5'h13):(1'h0)] reg210 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg206 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  assign y = {wire208,
                 wire207,
                 wire75,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire4,
                 wire77,
                 wire202,
                 wire204,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg206,
                 reg5,
                 reg6,
                 reg78,
                 reg79,
                 (1'h0)};
  assign wire4 = (wire3[(2'h2):(1'h0)] ?
                     {($signed((wire0 > wire0)) < (^(wire2 + wire2)))} : (wire2[(3'h7):(1'h0)] ?
                         {($signed((8'ha6)) ?
                                 (wire2 * wire0) : (wire2 ?
                                     wire1 : wire0))} : wire1));
  always
    @(posedge clk) begin
      reg5 <= wire3[(4'hd):(4'ha)];
      reg6 <= (~($signed(({(8'hac), (8'hb9)} ?
          (wire3 ?
              wire3 : (8'ha7)) : (~|(8'ha2)))) == ($signed($unsigned(wire2)) < $signed({wire2,
          reg5}))));
    end
  assign wire7 = (8'h9c);
  assign wire8 = ({reg6, $unsigned($unsigned({wire0, wire2}))} ?
                     reg6 : ($unsigned(wire1[(1'h1):(1'h0)]) ?
                         (($signed(wire2) ?
                             $unsigned((8'h9f)) : (wire0 ?
                                 wire4 : wire0)) ~^ reg5) : (wire1 >> (reg5[(1'h0):(1'h0)] >= (wire7 ?
                             wire2 : wire7)))));
  assign wire9 = (~^{wire1, wire3});
  assign wire10 = $signed($unsigned((|(wire1[(3'h4):(3'h4)] ?
                      wire0[(4'hc):(2'h3)] : $unsigned(wire0)))));
  assign wire11 = $unsigned((wire3[(4'hc):(4'h8)] ?
                      (+$unsigned($unsigned((8'ha5)))) : ((wire3[(4'hc):(4'hb)] ?
                              reg6 : (reg5 ? reg5 : wire7)) ?
                          wire9 : reg5[(1'h1):(1'h0)])));
  assign wire12 = (~^($signed((~&reg5)) ^ wire11));
  assign wire13 = ($signed({$unsigned($unsigned(reg6))}) ?
                      $signed($signed($signed(wire7))) : wire7[(3'h5):(1'h1)]);
  assign wire14 = (($signed((wire2 ? $unsigned(reg5) : (^reg6))) ?
                          ($signed(wire13[(1'h0):(1'h0)]) ?
                              ((&wire8) + (wire1 <<< wire7)) : ($signed(wire0) ?
                                  (^~wire3) : ((8'h9f) ?
                                      wire11 : wire9))) : reg5[(1'h1):(1'h1)]) ?
                      ((wire12[(4'he):(1'h1)] ?
                          $unsigned((wire11 & wire9)) : {wire13,
                              (^~wire10)}) || (&wire2)) : ((8'hb7) ?
                          {$unsigned($signed((8'hbb)))} : wire3[(3'h7):(3'h7)]));
  module15 #() modinst76 (wire75, clk, wire0, wire12, wire10, wire13, wire8);
  assign wire77 = $signed(wire9);
  always
    @(posedge clk) begin
      reg78 <= ((^((8'hab) ?
          {$signed(reg5),
              $unsigned(wire11)} : $signed((wire11 && wire14)))) >= wire2[(2'h2):(2'h2)]);
      reg79 <= $unsigned((((wire9 && (^wire75)) ?
          ((reg5 << (8'hb9)) ~^ $unsigned(wire7)) : ($signed((8'hb5)) <<< $signed(wire4))) ^~ {((^wire11) ?
              $signed(reg5) : $unsigned(wire10))}));
    end
  module80 #() modinst203 (wire202, clk, reg78, wire13, wire75, wire11, wire7);
  module164 #() modinst205 (wire204, clk, wire75, wire11, reg78, wire8, reg6);
  always
    @(posedge clk) begin
      reg206 <= wire2[(4'hb):(4'hb)];
    end
  assign wire207 = (($signed($unsigned({wire8, wire9})) ?
                       wire1 : {(+(8'hb9)),
                           ((wire0 >> wire11) && (wire75 ?
                               reg79 : wire0))}) > (wire202[(1'h1):(1'h0)] || ($signed($unsigned(wire14)) * ($unsigned(wire12) ?
                       wire202 : $unsigned(wire3)))));
  assign wire208 = ((8'ha1) ?
                       ((8'haa) || $signed($signed(wire12[(3'h6):(3'h4)]))) : wire7);
  always
    @(posedge clk) begin
      reg209 <= reg79[(4'hc):(1'h0)];
      reg210 <= reg78;
      reg211 <= (8'hbf);
      reg212 <= (+reg5);
      reg213 <= $unsigned(wire10);
    end
endmodule

module module80
#(parameter param201 = ((((!((7'h44) ? (8'ha4) : (8'hb2))) ? (8'hac) : ((|(8'hba)) ? (|(8'ha0)) : (&(8'hb0)))) ^ (~&{((8'ha0) << (8'hb9)), ((8'ha6) ? (8'hb8) : (7'h41))})) ? (^(~|(((8'hae) ? (8'ha7) : (8'ha4)) ? {(8'haa), (8'hb5)} : ((8'ha5) || (8'ha3))))) : ({{((8'ha5) ? (8'hb7) : (8'hbe))}, {((8'hbd) ? (7'h42) : (8'hb7)), ((8'hbf) & (8'ha5))}} <<< (8'ha8))))
(y, clk, wire81, wire82, wire83, wire84, wire85);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire81;
  input wire [(5'h13):(1'h0)] wire82;
  input wire signed [(3'h5):(1'h0)] wire83;
  input wire [(5'h11):(1'h0)] wire84;
  input wire [(4'hb):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire197;
  wire signed [(4'hc):(1'h0)] wire196;
  wire [(3'h5):(1'h0)] wire195;
  wire signed [(5'h12):(1'h0)] wire86;
  wire [(3'h5):(1'h0)] wire87;
  wire [(5'h15):(1'h0)] wire88;
  wire signed [(5'h12):(1'h0)] wire116;
  wire signed [(4'he):(1'h0)] wire159;
  wire signed [(5'h15):(1'h0)] wire161;
  wire [(5'h12):(1'h0)] wire162;
  wire signed [(4'h8):(1'h0)] wire163;
  wire signed [(4'hb):(1'h0)] wire193;
  reg [(2'h3):(1'h0)] reg200 = (1'h0);
  reg signed [(4'he):(1'h0)] reg199 = (1'h0);
  reg [(4'h9):(1'h0)] reg198 = (1'h0);
  assign y = {wire197,
                 wire196,
                 wire195,
                 wire86,
                 wire87,
                 wire88,
                 wire116,
                 wire159,
                 wire161,
                 wire162,
                 wire163,
                 wire193,
                 reg200,
                 reg199,
                 reg198,
                 (1'h0)};
  assign wire86 = {($unsigned((wire82 < wire81[(1'h0):(1'h0)])) ?
                          $unsigned(((^~wire82) <= {wire85,
                              wire81})) : $unsigned($unsigned($signed(wire83)))),
                      wire85};
  assign wire87 = wire83[(1'h1):(1'h0)];
  assign wire88 = {wire82, wire83[(1'h1):(1'h0)]};
  module89 #() modinst117 (.y(wire116), .wire92(wire86), .wire93(wire88), .clk(clk), .wire90(wire84), .wire91(wire81));
  module118 #() modinst160 (wire159, clk, wire86, wire82, wire83, wire85);
  assign wire161 = wire159;
  assign wire162 = ((^$signed({$signed(wire87)})) == {(((+wire83) ?
                               wire82[(1'h1):(1'h0)] : $unsigned(wire84)) ?
                           $signed((wire161 ?
                               wire161 : (8'hba))) : $signed($signed(wire85))),
                       wire87});
  assign wire163 = wire161[(5'h14):(4'h8)];
  module164 #() modinst194 (.wire168(wire84), .clk(clk), .wire166(wire159), .wire165(wire116), .wire169(wire86), .wire167(wire81), .y(wire193));
  assign wire195 = (~|(($signed((wire193 >>> wire162)) + (~|wire81[(1'h0):(1'h0)])) ?
                       (((~^wire88) ~^ (~^wire163)) ?
                           ($signed(wire81) ?
                               (-wire86) : $signed(wire84)) : (+$signed(wire81))) : (wire84 ?
                           $signed((~&wire84)) : (((8'hb6) << wire161) ?
                               {wire86} : $unsigned(wire84)))));
  assign wire196 = (|wire116);
  assign wire197 = $signed(((&wire82) == wire159[(3'h4):(1'h0)]));
  always
    @(posedge clk) begin
      reg198 <= (~|$unsigned((((|wire159) ?
          (wire81 ?
              wire159 : wire88) : wire161[(4'h9):(2'h2)]) >> {(wire162 ^ wire162)})));
      reg199 <= (((wire87[(1'h0):(1'h0)] > ($signed(wire81) * (wire83 ~^ wire195))) ?
          $signed(($unsigned(wire196) != (reg198 || (8'hae)))) : (~&(8'hb5))) << $unsigned(((!((8'h9d) <= wire197)) ?
          wire195[(1'h0):(1'h0)] : ((wire116 ^~ wire88) ?
              $unsigned(wire197) : $signed(wire162)))));
      reg200 <= $signed({wire86[(1'h1):(1'h1)]});
    end
endmodule

module module15
#(parameter param74 = ((((7'h41) != ((!(8'ha8)) | ((8'ha8) ? (8'ha7) : (8'ha1)))) >= (^({(8'hbf), (8'ha4)} ? (~|(7'h41)) : ((8'ha8) * (8'haa))))) ? ((8'ha3) && (-(((8'hb6) << (8'ha5)) < (^(8'ha1))))) : ((((~|(8'hab)) >>> ((7'h43) ? (8'ha9) : (8'haf))) ? (8'hbf) : (((8'hab) | (8'h9c)) + (~(8'haf)))) != (~^{((8'hac) == (8'h9c))}))))
(y, clk, wire16, wire17, wire18, wire19, wire20);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire16;
  input wire [(5'h12):(1'h0)] wire17;
  input wire signed [(2'h3):(1'h0)] wire18;
  input wire [(5'h13):(1'h0)] wire19;
  input wire signed [(5'h12):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire73;
  wire [(5'h11):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire30;
  wire signed [(5'h14):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire71;
  assign y = {wire73,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire71,
                 (1'h0)};
  assign wire21 = {(wire17[(3'h6):(3'h4)] ?
                          $signed(($unsigned(wire19) <= wire16[(5'h13):(2'h2)])) : $signed(((wire19 * (8'hb0)) != $signed(wire20)))),
                      ((wire20 ? $signed({wire20}) : wire19) ?
                          wire16 : $signed(wire18[(1'h1):(1'h0)]))};
  assign wire22 = $unsigned(((wire21 ?
                      (^(8'ha8)) : (~&wire21[(4'ha):(1'h1)])) ^~ $unsigned($signed({wire18,
                      wire18}))));
  assign wire23 = (~&($unsigned((-$unsigned(wire22))) ?
                      ((~$signed(wire19)) ?
                          wire18 : $unsigned((&(8'ha8)))) : ($signed({wire17,
                              wire16}) ?
                          $signed($signed(wire22)) : wire19)));
  assign wire24 = wire17[(4'hd):(4'hc)];
  assign wire25 = (~wire20[(4'h8):(3'h5)]);
  assign wire26 = $unsigned(($signed($unsigned((~^(8'ha5)))) ?
                      (($signed(wire18) ? (~^wire18) : (+wire22)) ?
                          $signed($unsigned(wire22)) : (~^$signed(wire21))) : ((~^((8'hbd) ?
                          wire19 : wire23)) <= wire25[(1'h0):(1'h0)])));
  assign wire27 = ($unsigned(wire21[(1'h0):(1'h0)]) > wire26);
  assign wire28 = (7'h40);
  assign wire29 = (wire21[(4'h9):(3'h6)] <= $unsigned((wire28 >>> wire19)));
  assign wire30 = $unsigned(wire16);
  assign wire31 = $signed((wire25[(3'h4):(3'h4)] >> wire20));
  assign wire32 = (!(!{wire18[(2'h3):(2'h2)]}));
  assign wire33 = (({wire20[(3'h5):(2'h3)], {(!wire20), (wire21 << (8'hb2))}} ?
                      $unsigned((wire19 >>> (wire18 ?
                          wire20 : wire26))) : $signed({wire16})) + (wire18 && (((wire31 ?
                      (8'ha8) : wire25) < (wire31 ?
                      wire30 : wire30)) != $signed(wire25))));
  assign wire34 = (wire25 ?
                      {(((wire24 || (8'hb0)) ? wire28 : wire28[(2'h3):(1'h1)]) ?
                              wire17[(1'h0):(1'h0)] : wire27[(2'h3):(2'h3)]),
                          ({wire31, (wire22 ~^ wire31)} > {wire33,
                              (wire18 ?
                                  wire33 : (8'hb4))})} : (($signed((-wire20)) ?
                          wire16[(2'h3):(1'h1)] : ($unsigned(wire24) == wire20)) << wire23));
  assign wire35 = $signed(($unsigned((~^(^~wire26))) == ($signed((wire31 ?
                      wire27 : (8'hb3))) ^ wire30)));
  module36 #() modinst72 (wire71, clk, wire26, wire23, wire24, wire28, wire32);
  assign wire73 = wire16;
endmodule

module module36  (y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire41;
  input wire [(5'h10):(1'h0)] wire40;
  input wire signed [(3'h6):(1'h0)] wire39;
  input wire signed [(2'h2):(1'h0)] wire38;
  input wire signed [(4'hf):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire70;
  wire [(5'h11):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire65;
  wire signed [(3'h7):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire58;
  wire [(3'h4):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire55;
  wire [(3'h7):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire46;
  wire signed [(3'h6):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire44;
  wire [(4'hc):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire42;
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire59,
                 wire58,
                 wire56,
                 wire55,
                 wire54,
                 wire50,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg57,
                 reg53,
                 reg52,
                 reg51,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire42 = wire37;
  assign wire43 = (~|wire39[(3'h6):(3'h6)]);
  assign wire44 = wire39;
  assign wire45 = wire39[(2'h2):(2'h2)];
  assign wire46 = $unsigned($unsigned({({(7'h42), wire42} ?
                          $unsigned(wire42) : wire38),
                      (wire42 ? $unsigned((8'hbf)) : (~(8'h9e)))}));
  assign wire47 = ((8'had) ?
                      $unsigned(wire39) : $signed(wire45[(2'h3):(2'h2)]));
  always
    @(posedge clk) begin
      reg48 <= wire42[(4'h8):(1'h0)];
      reg49 <= (^(((wire38[(1'h1):(1'h0)] ?
          $signed((7'h42)) : ((8'hbf) ?
              wire40 : wire38)) ~^ wire40[(1'h0):(1'h0)]) + $signed(($signed(wire45) ?
          (wire46 || wire39) : ((8'hbf) ? wire45 : wire44)))));
    end
  assign wire50 = ((wire42[(2'h2):(1'h1)] ?
                      wire43[(3'h5):(1'h1)] : (wire38[(2'h2):(1'h1)] ?
                          {wire47,
                              (wire46 ?
                                  wire40 : (8'hb8))} : $unsigned(wire37))) >> (-wire46[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg51 <= $unsigned((8'ha4));
      reg52 <= $signed((-wire42[(5'h15):(4'ha)]));
      reg53 <= wire40[(4'hf):(2'h3)];
    end
  assign wire54 = (($unsigned(wire40) ?
                          (~|((wire47 + wire37) >> $unsigned((8'ha4)))) : wire50) ?
                      $unsigned(wire47) : $signed((|((wire38 && wire39) ?
                          (reg49 ? wire39 : wire41) : $signed(wire41)))));
  assign wire55 = $signed(wire42[(4'h9):(2'h2)]);
  assign wire56 = $signed(reg52[(4'ha):(3'h6)]);
  always
    @(posedge clk) begin
      reg57 <= wire41[(4'hf):(4'h9)];
    end
  assign wire58 = {$signed($signed(reg51)), $signed($signed((-(+wire43))))};
  assign wire59 = (~(($signed(((8'hb4) == wire46)) << (+(reg48 ?
                      reg53 : wire45))) + wire50));
  always
    @(posedge clk) begin
      reg60 <= $unsigned(($signed($unsigned($signed(reg57))) >>> $signed(({wire58} ?
          wire45 : wire37[(4'h9):(2'h3)]))));
      reg61 <= (($unsigned(reg48[(5'h12):(2'h3)]) >>> wire40[(4'ha):(2'h3)]) >> {(reg49 ?
              (wire55[(3'h6):(3'h6)] ~^ (wire44 ?
                  (8'hbc) : wire39)) : $signed($signed(wire59))),
          reg53[(3'h4):(1'h0)]});
      reg62 <= ($signed(((8'hae) ?
          (|$signed(wire56)) : ((8'hbb) ?
              {wire37} : (^~wire43)))) < {$unsigned(((wire42 > wire47) >> (&wire38))),
          wire39});
      reg63 <= ($unsigned((~(wire38[(1'h0):(1'h0)] ?
              $unsigned(wire43) : reg53))) ?
          $signed(($unsigned((~wire39)) ?
              ($signed(reg53) && (reg48 ?
                  reg62 : wire55)) : $signed($unsigned(wire55)))) : ($unsigned({((8'ha4) ?
                  reg48 : wire40),
              wire45}) | ((7'h44) ? $unsigned($signed(wire56)) : (7'h40))));
    end
  assign wire64 = reg53[(4'h9):(2'h2)];
  assign wire65 = $unsigned(wire55);
  assign wire66 = (^$unsigned({{{wire46}}}));
  assign wire67 = wire55;
  assign wire68 = $signed((!(~wire58)));
  assign wire69 = (wire42 >= reg52);
  assign wire70 = ($signed(wire43[(3'h5):(1'h1)]) ^ (~|wire69[(4'hd):(4'hb)]));
endmodule

module module164
#(parameter param192 = ((((&((8'h9e) ? (8'hbb) : (8'hba))) ? (&((8'h9d) <<< (8'hb5))) : (+((8'hbc) < (8'hac)))) >= (((|(8'hbc)) || {(8'hb6)}) == (|(|(8'hbf))))) >> (!((+((8'hab) ? (8'hac) : (7'h40))) ? (((7'h44) ? (8'hbb) : (8'ha0)) ? ((8'hbe) >= (8'hae)) : ((8'h9d) ? (8'hbd) : (8'hab))) : ((8'hb1) != ((8'ha4) || (7'h40)))))))
(y, clk, wire169, wire168, wire167, wire166, wire165);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire169;
  input wire [(3'h7):(1'h0)] wire168;
  input wire [(3'h7):(1'h0)] wire167;
  input wire signed [(4'he):(1'h0)] wire166;
  input wire signed [(5'h12):(1'h0)] wire165;
  wire signed [(3'h5):(1'h0)] wire191;
  wire [(5'h13):(1'h0)] wire190;
  wire [(4'hc):(1'h0)] wire189;
  wire [(3'h7):(1'h0)] wire188;
  wire [(5'h15):(1'h0)] wire175;
  wire signed [(4'ha):(1'h0)] wire174;
  wire [(4'h8):(1'h0)] wire173;
  wire [(3'h4):(1'h0)] wire171;
  wire signed [(5'h15):(1'h0)] wire170;
  reg signed [(4'hf):(1'h0)] reg187 = (1'h0);
  reg [(4'hd):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg181 = (1'h0);
  reg [(5'h12):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg179 = (1'h0);
  reg [(4'he):(1'h0)] reg178 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg176 = (1'h0);
  reg signed [(4'he):(1'h0)] reg172 = (1'h0);
  assign y = {wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire175,
                 wire174,
                 wire173,
                 wire171,
                 wire170,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg172,
                 (1'h0)};
  assign wire170 = (~^$unsigned($unsigned(wire169)));
  assign wire171 = (~|(^(wire167 == wire167)));
  always
    @(posedge clk) begin
      reg172 <= wire168[(3'h4):(2'h2)];
    end
  assign wire173 = {wire169[(4'h9):(2'h2)]};
  assign wire174 = $signed($signed((wire165 ?
                       ((^~wire167) > {wire167,
                           (8'ha5)}) : $unsigned((wire166 + (8'ha3))))));
  assign wire175 = wire169[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg176 <= wire169;
      reg177 <= wire165;
      reg178 <= $unsigned({$signed(wire171), (^~wire168)});
      reg179 <= (wire175[(4'he):(4'ha)] ^ ({(^reg177),
              $unsigned((wire167 ? reg178 : (8'hab)))} ?
          (reg176 ? $unsigned((8'had)) : wire175) : $unsigned(wire171)));
      if ((!$unsigned(({$signed(wire175)} ?
          wire168 : {(reg172 ? wire170 : (8'ha7))}))))
        begin
          reg180 <= ((reg172 ?
                  ((&wire173[(3'h4):(3'h4)]) >> (&(~wire175))) : {($signed(wire165) ?
                          (^~reg177) : wire166),
                      $signed(wire167[(3'h7):(2'h3)])}) ?
              (-(((wire168 >>> wire170) & $signed(reg178)) ?
                  wire173 : wire175[(2'h2):(2'h2)])) : (($unsigned(wire167[(1'h1):(1'h1)]) << (8'haa)) & $unsigned(wire167)));
          reg181 <= $signed(($signed((~^$unsigned(wire171))) | wire169));
          if ((wire167 | ((wire170[(4'ha):(3'h4)] <= ((|reg181) * reg179[(3'h5):(1'h0)])) + wire168[(1'h0):(1'h0)])))
            begin
              reg182 <= wire174;
              reg183 <= {wire170[(5'h13):(3'h7)],
                  $unsigned(((~reg172) ?
                      wire167[(3'h6):(2'h2)] : $signed((reg180 ?
                          wire169 : wire173))))};
              reg184 <= {$signed(reg177[(3'h5):(3'h4)])};
              reg185 <= ((-(reg172 + $signed((reg178 ? wire166 : wire170)))) ?
                  reg178 : wire170);
            end
          else
            begin
              reg182 <= reg172[(3'h7):(3'h6)];
              reg183 <= (reg185[(3'h6):(3'h4)] ?
                  ($unsigned(wire166) ^ $unsigned($unsigned(wire167[(1'h0):(1'h0)]))) : reg184[(3'h7):(3'h4)]);
              reg184 <= (~|$unsigned((~&wire173[(3'h5):(1'h1)])));
              reg185 <= wire169[(4'hc):(1'h0)];
            end
          reg186 <= reg182[(4'he):(3'h5)];
          reg187 <= (($unsigned((^(^~wire165))) >= (({reg177} ?
                      wire175 : (~reg179)) ?
                  $unsigned(reg186) : ($signed(reg181) ?
                      (~&wire171) : (-wire165)))) ?
              reg180 : reg186);
        end
      else
        begin
          reg180 <= $unsigned(reg179);
          reg181 <= wire165[(5'h11):(5'h10)];
          reg182 <= (~&(reg178[(4'h9):(2'h2)] ?
              {$unsigned($unsigned(wire169))} : wire166[(3'h4):(1'h1)]));
          reg183 <= (wire170 ?
              $unsigned({(+reg181[(1'h0):(1'h0)])}) : $unsigned(reg181[(2'h2):(1'h0)]));
        end
    end
  assign wire188 = wire165;
  assign wire189 = ($unsigned($unsigned($unsigned(((8'haf) ?
                       (7'h44) : wire169)))) == ((((!reg185) ?
                           (~^reg182) : (^~reg181)) ?
                       ($signed(reg177) >= (wire171 <= wire167)) : (&(wire171 ?
                           reg177 : reg187))) >>> $signed({reg183[(4'hd):(4'h8)],
                       $unsigned((8'hac))})));
  assign wire190 = $signed(({wire175[(1'h1):(1'h1)],
                       reg177[(2'h2):(2'h2)]} ~^ reg185[(4'h8):(2'h3)]));
  assign wire191 = $unsigned(reg176);
endmodule

module module118
#(parameter param158 = (((({(7'h41), (8'h9e)} == ((8'hb0) <<< (7'h43))) == (((8'hac) ? (7'h40) : (8'hb7)) ? (|(8'ha2)) : ((8'ha8) ? (8'hbf) : (8'hb3)))) < (^(((8'h9f) ? (8'hbf) : (8'ha9)) ? (|(7'h40)) : ((7'h40) >>> (8'hb1))))) - (((~&(&(8'hbf))) ? (((8'hb8) + (8'hb6)) > (^~(8'ha2))) : {((8'ha5) << (8'h9f))}) ? ((((7'h40) <= (8'h9d)) ? ((8'hbe) ? (8'hb2) : (8'hb1)) : ((8'hb2) ? (8'hb9) : (8'hb0))) << ((!(8'hb1)) ? ((8'ha2) ? (8'ha0) : (8'hb6)) : ((8'hbe) ? (8'ha7) : (8'hab)))) : ({((8'hb9) >= (8'hba)), ((7'h42) > (7'h41))} ? (~|((7'h44) ? (8'ha6) : (8'hb8))) : (~&((8'hb5) ^~ (8'h9e)))))))
(y, clk, wire122, wire121, wire120, wire119);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire122;
  input wire signed [(5'h13):(1'h0)] wire121;
  input wire signed [(3'h5):(1'h0)] wire120;
  input wire [(3'h7):(1'h0)] wire119;
  wire signed [(4'h9):(1'h0)] wire151;
  wire [(3'h4):(1'h0)] wire150;
  wire [(3'h5):(1'h0)] wire149;
  wire signed [(3'h5):(1'h0)] wire148;
  wire [(4'hf):(1'h0)] wire147;
  wire signed [(4'ha):(1'h0)] wire146;
  wire signed [(4'hc):(1'h0)] wire145;
  wire [(2'h3):(1'h0)] wire144;
  wire signed [(5'h13):(1'h0)] wire143;
  wire [(5'h11):(1'h0)] wire142;
  wire [(5'h11):(1'h0)] wire137;
  wire [(4'h9):(1'h0)] wire136;
  wire [(2'h2):(1'h0)] wire135;
  wire signed [(3'h6):(1'h0)] wire134;
  wire [(3'h4):(1'h0)] wire125;
  wire signed [(4'ha):(1'h0)] wire124;
  wire [(4'hf):(1'h0)] wire123;
  reg signed [(4'h8):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg155 = (1'h0);
  reg [(4'hf):(1'h0)] reg154 = (1'h0);
  reg [(3'h4):(1'h0)] reg153 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg131 = (1'h0);
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg128 = (1'h0);
  reg [(4'ha):(1'h0)] reg127 = (1'h0);
  reg [(4'h8):(1'h0)] reg126 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire125,
                 wire124,
                 wire123,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 (1'h0)};
  assign wire123 = {{wire119, $signed((8'ha6))},
                       $signed(((+wire119[(3'h4):(2'h2)]) >> $signed($unsigned(wire121))))};
  assign wire124 = wire120;
  assign wire125 = (^~wire124);
  always
    @(posedge clk) begin
      reg126 <= $signed($unsigned((!((!wire121) ?
          $unsigned(wire124) : $unsigned(wire125)))));
      if ({(8'hb8)})
        begin
          reg127 <= wire124[(3'h5):(3'h5)];
        end
      else
        begin
          reg127 <= wire121;
          reg128 <= ((8'hb8) > {(~&$signed(wire122[(4'h8):(1'h0)])),
              $unsigned($unsigned({wire124}))});
          reg129 <= (~^$unsigned((^$signed((wire124 ? wire125 : reg127)))));
          if (wire121)
            begin
              reg130 <= {reg129, reg126[(3'h7):(3'h6)]};
              reg131 <= (wire123 - $signed((wire124[(1'h1):(1'h0)] < wire119)));
            end
          else
            begin
              reg130 <= $unsigned(((^~wire120) ?
                  (~^($signed((8'hb5)) ?
                      {wire120} : reg128[(1'h1):(1'h0)])) : (~&((~^reg129) == wire122))));
            end
        end
      reg132 <= (~|((&((wire124 ? (8'hb2) : reg131) << {(7'h44), reg126})) ?
          (~|($unsigned(wire123) + (~^wire125))) : ((!(!reg131)) ^ ($unsigned(wire124) <<< wire121))));
      reg133 <= (+(reg131[(2'h2):(1'h0)] >> $signed($unsigned($unsigned((8'hb7))))));
    end
  assign wire134 = wire120[(2'h2):(1'h1)];
  assign wire135 = {wire119[(2'h2):(1'h0)],
                       (($unsigned(((8'haa) ?
                           wire125 : wire121)) - ((wire125 || wire124) ?
                           wire120 : $signed(wire124))) | wire121[(2'h3):(1'h0)])};
  assign wire136 = ((($unsigned((wire120 ?
                           wire134 : wire122)) <= $signed(reg127)) ^~ $signed((^~(8'had)))) ?
                       reg132[(1'h1):(1'h0)] : (^~$signed($signed((!reg131)))));
  assign wire137 = reg132[(3'h6):(3'h4)];
  always
    @(posedge clk) begin
      reg138 <= {wire120[(2'h3):(1'h0)],
          $unsigned($signed((wire119 ?
              (reg133 ? wire123 : (8'hab)) : (+wire137))))};
      reg139 <= $unsigned(reg126);
      reg140 <= (&reg138);
      reg141 <= ((((~$unsigned(reg129)) >> (wire121[(4'hc):(3'h5)] ?
          reg139[(4'h9):(1'h1)] : reg131)) >> (8'hb6)) >>> {(^~((~|(8'hb1)) ?
              (+wire135) : (wire122 && (8'h9d))))});
    end
  assign wire142 = $signed((((|$signed((7'h40))) ~^ (~&$unsigned((8'ha9)))) > wire120[(1'h0):(1'h0)]));
  assign wire143 = $signed(wire120[(1'h1):(1'h0)]);
  assign wire144 = reg128[(1'h0):(1'h0)];
  assign wire145 = {wire137[(4'hd):(4'h8)]};
  assign wire146 = wire136[(3'h6):(1'h1)];
  assign wire147 = ($signed(reg129) ?
                       ($signed(wire124[(3'h6):(1'h0)]) ?
                           (reg132 ?
                               (((8'hb5) < (8'haa)) ^ {wire123}) : wire134) : $signed((|(wire125 >> wire137)))) : (wire135 ?
                           wire143 : {reg138}));
  assign wire148 = (($signed((wire136 ?
                       (^~wire146) : (~wire135))) | wire136) >> {(wire124 ?
                           $unsigned({reg138, wire124}) : (wire142 ?
                               wire146 : reg132[(3'h7):(1'h1)]))});
  assign wire149 = $unsigned((8'ha4));
  assign wire150 = wire134[(1'h0):(1'h0)];
  assign wire151 = $signed(wire123);
  always
    @(posedge clk) begin
      reg152 <= (reg141[(4'h8):(3'h6)] * wire144);
      if ($unsigned(wire121))
        begin
          reg153 <= (wire146 | $unsigned((($unsigned(wire146) + ((8'h9e) > wire143)) ?
              ((wire123 | (8'haa)) - reg129) : $unsigned((reg131 ~^ wire135)))));
          reg154 <= reg127[(1'h0):(1'h0)];
          reg155 <= $unsigned($signed({reg130, {(8'h9d), $signed(wire134)}}));
          reg156 <= (+(-(~|(^((7'h43) && wire119)))));
        end
      else
        begin
          if ($unsigned($unsigned((wire151[(2'h2):(1'h0)] - wire136[(4'h8):(4'h8)]))))
            begin
              reg153 <= ($signed((({reg155, wire125} ?
                      $signed(wire121) : ((8'hb7) > wire144)) ?
                  ($unsigned(reg131) ?
                      (wire142 ? wire135 : reg132) : (wire121 ?
                          wire125 : reg155)) : $unsigned(reg128))) >> wire144[(1'h1):(1'h1)]);
              reg154 <= $unsigned({(($signed(wire123) ~^ (reg139 ?
                          reg156 : reg126)) ?
                      reg138[(3'h7):(1'h0)] : reg153[(1'h0):(1'h0)])});
              reg155 <= (wire150[(1'h0):(1'h0)] >>> $signed(wire123));
              reg156 <= $unsigned({{wire120}});
            end
          else
            begin
              reg153 <= (((8'ha0) > $signed(reg133[(4'he):(4'he)])) ?
                  $signed((~(8'hbf))) : $signed(({reg138} == ($signed(reg126) * $signed(wire124)))));
              reg154 <= (((wire136 ?
                  (~^(wire148 ?
                      wire151 : reg128)) : $signed(wire122[(3'h7):(1'h0)])) | wire149[(3'h5):(3'h4)]) >= (~(^wire121[(2'h3):(1'h0)])));
              reg155 <= (wire124 ?
                  wire145[(2'h3):(1'h1)] : $signed((-{(wire142 ?
                          reg133 : reg132),
                      (wire120 ? wire120 : reg132)})));
              reg156 <= ($signed(({wire134} ^ reg128[(1'h0):(1'h0)])) ?
                  (8'ha7) : (|$unsigned((reg133 ?
                      {reg130, wire146} : $signed(reg152)))));
            end
          reg157 <= ({wire121[(1'h0):(1'h0)]} <= reg154);
        end
    end
endmodule

module module89  (y, clk, wire93, wire92, wire91, wire90);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire93;
  input wire [(2'h3):(1'h0)] wire92;
  input wire [(2'h2):(1'h0)] wire91;
  input wire signed [(3'h5):(1'h0)] wire90;
  wire signed [(5'h13):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire114;
  wire signed [(5'h15):(1'h0)] wire113;
  wire signed [(4'hf):(1'h0)] wire112;
  reg signed [(4'h8):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(4'he):(1'h0)] reg109 = (1'h0);
  reg [(4'h9):(1'h0)] reg108 = (1'h0);
  reg [(4'hb):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg104 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(2'h2):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg98 = (1'h0);
  reg [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (({($unsigned((wire90 >>> wire92)) > ({wire93, wire93} ?
                  (7'h44) : (wire92 ? wire93 : wire93)))} ?
          {wire92,
              ((~(wire93 <= wire92)) && ((wire91 ?
                  wire92 : (8'hb2)) ^~ wire90))} : ($unsigned(wire92[(2'h3):(1'h0)]) >>> ($unsigned({(8'h9f)}) ?
              wire92 : $signed($unsigned(wire93))))))
        begin
          reg94 <= $signed((^~$signed(((^~wire90) | wire91))));
          reg95 <= wire92;
          reg96 <= $signed(($unsigned((wire93[(5'h12):(4'h8)] | $signed(wire93))) ?
              $signed({$signed(wire90),
                  {reg94}}) : $signed($signed($unsigned(wire93)))));
          reg97 <= $unsigned(((-$signed($signed(wire92))) ?
              reg95 : {$unsigned((^~reg96))}));
          reg98 <= reg94[(3'h6):(3'h6)];
        end
      else
        begin
          if (($signed({wire92[(2'h3):(1'h1)]}) - (wire91 | reg98)))
            begin
              reg94 <= ({$signed(reg96[(3'h6):(3'h4)]),
                      (((reg98 & reg95) == wire91[(2'h2):(1'h0)]) ?
                          $unsigned({reg94, reg94}) : $unsigned({reg94,
                              reg98}))} ?
                  ($unsigned(reg96[(2'h3):(1'h1)]) | {reg96,
                      (((8'hb0) ? reg95 : wire92) ?
                          $unsigned(reg98) : {wire91})}) : ((^~((wire90 && reg97) ^ (-wire92))) ?
                      wire91 : $unsigned((((8'hb0) ?
                          reg97 : wire93) + $unsigned(wire92)))));
              reg95 <= reg94[(3'h7):(2'h3)];
              reg96 <= (-(^($signed((reg98 ~^ wire92)) ?
                  (wire90 ? reg96[(3'h6):(3'h6)] : (8'ha0)) : wire91)));
              reg97 <= (8'hae);
              reg98 <= $signed((reg96 ?
                  reg96[(3'h4):(3'h4)] : reg94[(1'h0):(1'h0)]));
            end
          else
            begin
              reg94 <= $signed($signed((8'hb0)));
              reg95 <= (($signed((reg95[(4'hd):(4'h8)] ~^ {reg95})) ~^ (reg94 ?
                      {reg94[(2'h3):(1'h1)]} : ($signed(wire93) >>> {(8'had)}))) ?
                  ($signed($signed(wire93[(4'hb):(3'h4)])) << {(-$signed(reg94)),
                      $unsigned((&wire91))}) : reg97);
              reg96 <= ($signed((&($unsigned((8'hb1)) ?
                  (wire93 == wire93) : (wire93 ?
                      (8'ha0) : wire90)))) <= ((|(^wire92)) ?
                  wire92[(2'h3):(2'h3)] : $signed($unsigned((wire91 ?
                      wire93 : wire90)))));
              reg97 <= ((reg96 >> {$unsigned((reg96 + wire92)),
                  (~^(&reg94))}) > $signed($signed({((8'hbd) ? reg96 : reg94),
                  $unsigned(wire93)})));
              reg98 <= (&(($unsigned(wire90[(2'h2):(1'h1)]) && (!wire92[(1'h1):(1'h1)])) <<< wire92));
            end
          reg99 <= $unsigned(reg95);
          reg100 <= (reg94[(3'h5):(1'h1)] <<< ({$signed((wire91 >> wire92)),
                  {reg94, $signed(reg96)}} ?
              ($signed((8'ha4)) ^ reg99) : $unsigned($unsigned($unsigned((8'h9c))))));
          if ($unsigned({$unsigned(reg100)}))
            begin
              reg101 <= (reg97[(3'h5):(1'h0)] * reg94[(4'h8):(3'h7)]);
              reg102 <= $unsigned($unsigned((-{(|(7'h42))})));
            end
          else
            begin
              reg101 <= ($unsigned((-{(^~(8'ha3)), wire93})) ?
                  (!({(^~wire90)} ?
                      $unsigned((~|reg99)) : {wire90,
                          (wire91 != reg102)})) : ($signed(reg98) < (~|reg98[(3'h4):(1'h0)])));
              reg102 <= ((((reg101[(5'h10):(2'h2)] + reg95) >>> ((+wire92) ?
                  $unsigned(reg100) : (wire93 >> reg94))) > reg102) && ($signed(({(8'ha3),
                      reg102} & {reg102, wire93})) ?
                  {reg99[(1'h1):(1'h1)],
                      $unsigned(reg99[(2'h2):(1'h1)])} : $unsigned((~|reg98[(3'h6):(1'h1)]))));
              reg103 <= $signed(((($signed(wire92) >> {reg94}) >>> (^$signed(reg100))) ?
                  $signed(wire90) : $unsigned((7'h42))));
              reg104 <= $unsigned({{{reg100, (8'hb8)}},
                  $signed(((wire91 * reg101) ? reg94 : (|(8'ha4))))});
            end
        end
      reg105 <= reg97;
      reg106 <= ((((wire93[(2'h2):(1'h1)] ^~ (~reg95)) ?
              (~^$unsigned(reg100)) : {(reg99 ^ reg101),
                  $signed(reg102)}) > (~&(~|reg103[(1'h1):(1'h0)]))) ?
          reg105[(3'h5):(1'h0)] : $signed(reg95[(3'h6):(3'h4)]));
    end
  always
    @(posedge clk) begin
      reg107 <= reg98;
      reg108 <= reg104[(5'h12):(4'hf)];
      reg109 <= (((wire91[(2'h2):(2'h2)] ?
              $signed((wire90 >= reg97)) : (~^(8'haa))) && reg97) ?
          $unsigned((+(!(reg101 < reg103)))) : (({(~wire92),
                      reg108[(1'h1):(1'h0)]} ?
                  (-(-reg102)) : reg95) ?
              $signed((8'hb4)) : reg96));
      reg110 <= reg94;
      reg111 <= (reg105 ? reg105 : reg101);
    end
  assign wire112 = ((((8'hb5) ?
                           wire90[(1'h0):(1'h0)] : (^~{(8'ha9),
                               reg109})) <<< wire92) ?
                       (8'hb6) : $signed(reg95));
  assign wire113 = $unsigned(reg97[(4'hf):(1'h1)]);
  assign wire114 = (wire113 ?
                       ($unsigned((reg104[(5'h10):(3'h5)] & reg94[(3'h4):(2'h3)])) ^~ $unsigned({reg103[(3'h4):(1'h0)],
                           $signed(reg111)})) : reg100[(1'h1):(1'h1)]);
  assign wire115 = wire112[(4'hc):(4'hc)];
endmodule
