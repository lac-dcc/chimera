module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire99;
  wire signed [(5'h10):(1'h0)] wire98;
  wire signed [(3'h5):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire96;
  wire [(4'hb):(1'h0)] wire95;
  wire [(4'h8):(1'h0)] wire94;
  wire [(2'h3):(1'h0)] wire93;
  wire signed [(5'h11):(1'h0)] wire91;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire19;
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire91,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire19,
                 (1'h0)};
  module5 #() modinst20 (wire19, clk, wire2, wire0, wire4, wire3, wire1);
  assign wire21 = wire3;
  assign wire22 = $unsigned((wire4 ?
                      wire3[(1'h0):(1'h0)] : $signed($signed($signed(wire3)))));
  assign wire23 = $unsigned($signed(($unsigned($signed(wire2)) >>> ((8'hbd) < wire4[(3'h6):(3'h5)]))));
  assign wire24 = (($unsigned({(~&wire2), (wire4 ? wire2 : (8'h9d))}) ?
                          ($signed(wire0[(3'h6):(3'h6)]) << $unsigned((wire0 ?
                              wire21 : wire3))) : wire21[(4'hc):(3'h4)]) ?
                      $signed((|wire4[(4'hf):(4'h8)])) : wire3);
  module25 #() modinst92 (.wire26(wire21), .wire28(wire4), .wire27(wire1), .y(wire91), .clk(clk), .wire29(wire3));
  assign wire93 = (wire22[(2'h3):(2'h2)] <<< (wire4[(4'hb):(4'hb)] ?
                      wire19 : (wire2[(4'he):(3'h4)] - (wire23 ?
                          $unsigned(wire3) : $unsigned(wire24)))));
  assign wire94 = $unsigned((wire3 ^ ($signed((wire91 < wire22)) ^~ {(wire93 >= (8'haf))})));
  assign wire95 = $signed($signed((8'ha9)));
  assign wire96 = ((-{$unsigned({wire24}),
                      $signed(wire22[(5'h10):(5'h10)])}) ^ $signed(wire1));
  assign wire97 = $signed(wire23);
  assign wire98 = $signed((~^wire3[(4'hf):(3'h5)]));
  assign wire99 = $unsigned($signed($signed((~^wire21))));
endmodule

module module25
#(parameter param90 = (-(+(-(-((8'hb2) - (8'h9c)))))))
(y, clk, wire26, wire27, wire28, wire29);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire26;
  input wire signed [(2'h2):(1'h0)] wire27;
  input wire [(4'h8):(1'h0)] wire28;
  input wire [(5'h15):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire89;
  wire signed [(5'h14):(1'h0)] wire88;
  wire [(4'h8):(1'h0)] wire87;
  wire signed [(3'h7):(1'h0)] wire86;
  wire signed [(5'h15):(1'h0)] wire74;
  wire signed [(3'h7):(1'h0)] wire73;
  wire [(5'h13):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire32;
  wire [(4'ha):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire71;
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(3'h4):(1'h0)] reg78 = (1'h0);
  reg [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire74,
                 wire73,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire71,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire30 = (8'hb8);
  assign wire31 = $unsigned((^({(wire28 && wire29)} != ((wire27 ?
                          wire28 : wire30) ?
                      (~wire28) : (~wire28)))));
  assign wire32 = (-wire31);
  assign wire33 = {wire27[(1'h0):(1'h0)]};
  assign wire34 = (~&((8'hbb) ? wire32[(1'h1):(1'h1)] : wire26));
  assign wire35 = (((((^~(8'hab)) && (|wire32)) >= ({(8'ha1)} ?
                              (8'hb0) : ((7'h42) == wire32))) ?
                          wire32 : $signed((~(8'ha9)))) ?
                      $unsigned(wire26) : wire33[(4'ha):(3'h7)]);
  module36 #() modinst72 (wire71, clk, wire26, wire35, wire28, wire30, wire34);
  assign wire73 = ((wire71[(2'h2):(2'h2)] ? wire32 : (^wire29)) ?
                      ((8'hb7) > (~&(~(wire32 < wire35)))) : wire31[(4'ha):(1'h0)]);
  assign wire74 = (($unsigned({(wire26 & (8'hb3)),
                      (^~wire28)}) | $unsigned(($unsigned(wire73) > $signed(wire34)))) || $signed(wire28[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      if ((&$signed($signed(wire73[(1'h1):(1'h1)]))))
        begin
          if (wire31[(3'h5):(2'h2)])
            begin
              reg75 <= wire31[(4'hb):(3'h4)];
              reg76 <= (8'hb7);
            end
          else
            begin
              reg75 <= wire32[(2'h3):(2'h2)];
              reg76 <= wire73[(3'h7):(3'h4)];
              reg77 <= (wire32 ?
                  wire73[(1'h1):(1'h0)] : $unsigned($signed(((!wire73) ?
                      $unsigned(wire32) : (~|reg75)))));
              reg78 <= (((($signed(wire73) >= reg75) ?
                      (reg76 ?
                          (~|wire32) : $unsigned(wire31)) : $signed(wire31)) ?
                  wire28[(2'h3):(1'h1)] : wire71[(1'h0):(1'h0)]) != $unsigned($signed((((8'hab) ?
                  wire33 : wire31) >= (wire27 ? wire32 : reg76)))));
              reg79 <= wire73[(1'h1):(1'h0)];
            end
          reg80 <= ($unsigned($unsigned({(&wire28),
              (~|wire71)})) < wire35[(3'h5):(2'h3)]);
          reg81 <= {wire34[(3'h5):(3'h4)], $signed($signed(reg80))};
        end
      else
        begin
          reg75 <= (reg75 + (wire34[(4'h9):(3'h6)] ?
              ($signed($signed((8'hbe))) ?
                  ((~^wire28) ?
                      $signed(reg80) : (wire71 ?
                          wire29 : reg78)) : ($unsigned(reg78) <= (|wire26))) : wire71));
          reg76 <= ($unsigned($unsigned(wire29)) < wire30);
          if ($signed({(((8'ha0) ?
                  $unsigned(reg75) : (wire73 ? reg78 : wire73)) >= (~&(wire74 ?
                  reg78 : wire30)))}))
            begin
              reg77 <= {$unsigned($signed({(~&reg78), reg77})), wire74};
              reg78 <= {$signed($signed($unsigned($signed(wire73)))), wire30};
              reg79 <= $unsigned(wire29[(3'h5):(1'h0)]);
              reg80 <= ((8'haa) ?
                  $signed((((wire32 < (8'hac)) || (reg78 ?
                      reg81 : (7'h43))) == {(reg76 >>> reg77)})) : (((|$unsigned(wire35)) ?
                      (^~(wire33 + wire73)) : $signed(reg80)) ~^ (~|(~^(wire26 ~^ wire33)))));
            end
          else
            begin
              reg77 <= (^~($signed(($signed(reg76) * {wire27,
                  wire35})) > {((reg78 ? (8'h9f) : wire28) ?
                      $signed(reg81) : reg80[(2'h2):(2'h2)]),
                  $signed((wire73 ? reg79 : (8'h9d)))}));
              reg78 <= (({(^reg81[(4'h9):(3'h4)])} >= ((~^$signed(wire71)) - {wire73[(2'h3):(2'h3)]})) ?
                  (wire33[(1'h1):(1'h1)] ?
                      wire32[(1'h0):(1'h0)] : $signed((~^$unsigned((8'h9e))))) : $unsigned(reg78[(1'h0):(1'h0)]));
            end
          if ((^~(8'hb5)))
            begin
              reg81 <= (~^{$unsigned({$signed(wire71), $unsigned(wire27)})});
              reg82 <= (&wire32);
              reg83 <= $signed(wire29[(2'h2):(1'h0)]);
              reg84 <= $signed((reg75 ?
                  $unsigned(wire31[(5'h14):(5'h10)]) : reg80[(1'h1):(1'h0)]));
              reg85 <= (reg83 ? wire35 : wire34[(1'h0):(1'h0)]);
            end
          else
            begin
              reg81 <= $unsigned((((+(+wire74)) <<< $signed((wire29 != wire30))) ?
                  ((wire34 ? {reg83, reg76} : $unsigned(wire26)) ?
                      reg76 : ($unsigned((7'h42)) << reg81[(4'h9):(1'h0)])) : wire26));
              reg82 <= $unsigned($signed($signed(wire34[(2'h3):(2'h2)])));
            end
        end
    end
  assign wire86 = (^~($unsigned((wire27 || ((8'ha5) ? wire26 : wire71))) ?
                      $unsigned((reg76[(4'hb):(3'h4)] ?
                          wire33 : reg80[(2'h2):(1'h0)])) : (~|(^~$signed(wire34)))));
  assign wire87 = ({(wire73 ?
                          (|reg75[(2'h2):(1'h1)]) : ((wire29 + reg82) ?
                              wire29[(4'hc):(1'h1)] : wire28))} <= wire32);
  assign wire88 = ($unsigned(($signed((&(8'h9d))) == ((+(8'hb2)) ?
                      {wire34} : wire27))) || $signed((reg85[(1'h1):(1'h0)] >>> (((8'hbe) ?
                          reg80 : (8'hab)) ?
                      (reg85 || wire26) : (wire29 ? reg79 : wire28)))));
  assign wire89 = $signed(((~(reg80 ?
                      reg84[(1'h0):(1'h0)] : $unsigned((8'hbf)))) != (~|{(wire74 ?
                          reg83 : reg75)})));
endmodule

module module5
#(parameter param17 = ((+((((8'h9f) ^~ (8'ha9)) + ((8'hbb) ~^ (8'hba))) ? ({(8'h9c), (8'hb4)} ? (7'h41) : (&(8'hb7))) : (+((8'ha0) * (8'hb4))))) ? {(^(((8'ha7) == (8'had)) ? {(8'h9d)} : (~&(8'hb1))))} : {({((8'h9f) << (7'h44)), (^(8'h9d))} ? (+(+(8'hbe))) : (^(8'hb8))), (^((|(8'ha3)) ? (+(8'hbd)) : ((8'hb9) > (8'hb3))))}), 
parameter param18 = (|(param17 ? (8'h9d) : {((param17 ? (8'hae) : param17) < (~param17))})))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(4'h8):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire signed [(3'h4):(1'h0)] wire7;
  input wire [(2'h3):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire11;
  assign y = {wire16, wire15, wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = wire9;
  assign wire12 = (($signed(wire8[(4'hf):(3'h5)]) + (~{wire8[(3'h4):(3'h4)],
                          (wire11 ? wire11 : wire11)})) ?
                      $signed($signed(wire11[(4'h8):(3'h7)])) : (~|wire9[(3'h6):(3'h5)]));
  assign wire13 = ($unsigned($unsigned(wire9[(3'h4):(1'h1)])) > wire11);
  assign wire14 = $unsigned($unsigned((wire13[(2'h3):(1'h0)] | (+{wire13}))));
  assign wire15 = $unsigned((!(((~&(8'hab)) >> wire9[(2'h3):(1'h0)]) ?
                      $unsigned((7'h43)) : ((wire8 ?
                          wire9 : wire14) >> wire13))));
  assign wire16 = $unsigned(wire12[(2'h3):(1'h0)]);
endmodule

module module36
#(parameter param69 = (&(((!{(8'h9d), (8'hbf)}) ? {(-(8'hb0))} : (7'h40)) ? ((8'hb6) ~^ {((8'haf) >= (8'hb0))}) : ({((8'hbc) <= (8'h9c))} ? ((&(8'ha8)) >> (-(8'hb4))) : (((8'hae) != (8'hb4)) ? ((8'ha7) ? (8'ha5) : (8'ha7)) : (|(8'hb3)))))), 
parameter param70 = (|(^{(param69 ? ((8'ha6) != param69) : (|param69)), ((~^param69) ? (param69 ? param69 : param69) : {(8'ha7)})})))
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire41;
  input wire [(4'h8):(1'h0)] wire40;
  input wire signed [(2'h2):(1'h0)] wire39;
  input wire signed [(5'h13):(1'h0)] wire38;
  input wire [(4'hb):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  wire signed [(3'h5):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire65;
  wire [(4'he):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire45;
  wire signed [(4'hd):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire42;
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire58,
                 wire45,
                 wire44,
                 wire42,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg43,
                 (1'h0)};
  assign wire42 = $unsigned(((+($signed(wire37) ?
                          $signed(wire41) : (wire39 > wire40))) ?
                      wire40 : $signed({$unsigned((8'ha2))})));
  always
    @(posedge clk) begin
      reg43 <= (wire40[(3'h4):(1'h0)] ?
          {$unsigned(((8'hb5) ?
                  (&wire41) : wire42[(4'hc):(2'h3)]))} : (|(((wire42 <= wire40) << (wire39 & wire40)) < (((8'hb5) ^ (8'ha1)) ?
              wire40 : (^~wire38)))));
    end
  assign wire44 = (8'hb3);
  assign wire45 = (({wire41[(4'hb):(3'h7)]} ~^ $signed((&{reg43,
                      wire38}))) <<< $signed(({(wire38 ?
                          wire40 : reg43)} - $signed((+wire40)))));
  always
    @(posedge clk) begin
      reg46 <= {(({wire41[(3'h6):(1'h1)], (wire39 ^~ (8'hb6))} ?
                  wire42[(4'ha):(4'h9)] : reg43) ?
              (8'h9f) : wire41)};
      reg47 <= (-wire41);
      reg48 <= reg47;
      reg49 <= (^{$unsigned($signed($unsigned(wire41))),
          $unsigned($unsigned({reg47, (7'h41)}))});
      if ((((7'h42) ? reg48[(4'h8):(3'h5)] : (^~$signed({wire40, (8'h9e)}))) ?
          wire39 : (+(|$unsigned((~wire45))))))
        begin
          reg50 <= reg47[(1'h0):(1'h0)];
          reg51 <= $signed(($signed($unsigned($signed(wire39))) <= (8'ha6)));
          if (reg47)
            begin
              reg52 <= (~|(&((8'ha6) ?
                  {{reg43},
                      (wire45 ?
                          wire38 : reg50)} : $unsigned($signed(wire41)))));
            end
          else
            begin
              reg52 <= ($signed((7'h44)) ?
                  ((wire37[(4'h9):(1'h0)] <= ($signed(reg46) ?
                      $signed((8'hb2)) : $unsigned((8'hbc)))) > reg50) : $signed($signed(((reg49 ?
                      wire38 : wire39) ^ wire42))));
              reg53 <= (+({$signed(((7'h40) ?
                      (7'h40) : reg49))} == ($unsigned((reg47 <= wire37)) <<< ($unsigned((8'hb7)) < (&wire44)))));
              reg54 <= (reg51 ?
                  (reg49 ~^ {wire40,
                      $signed({reg53})}) : wire40[(2'h2):(2'h2)]);
              reg55 <= (^~$unsigned((^($unsigned((8'hb1)) >>> reg46[(2'h2):(1'h0)]))));
              reg56 <= $signed($signed($signed(reg50)));
            end
          reg57 <= ($unsigned((wire41 <= (!(reg48 ?
              reg48 : reg43)))) & $signed(wire41));
        end
      else
        begin
          reg50 <= (^($unsigned($signed((reg52 << reg49))) ?
              (($unsigned(reg54) && reg55[(1'h0):(1'h0)]) | ((reg51 ?
                  wire39 : wire38) <<< (~&reg54))) : ($unsigned(wire39) <= ((wire40 ?
                  wire41 : (8'ha2)) >= (~reg56)))));
          reg51 <= ($signed((($unsigned(reg53) ?
              $signed(reg51) : $unsigned((8'hb9))) ^~ reg53[(2'h3):(2'h2)])) & $signed((wire39 & (~^(reg57 + reg55)))));
          reg52 <= (reg53[(3'h5):(3'h5)] ?
              (!{($signed(wire44) ? reg43[(3'h4):(3'h4)] : (wire42 & (8'hb4))),
                  $signed(reg52)}) : wire45);
          if (reg49[(3'h7):(3'h4)])
            begin
              reg53 <= (wire39[(1'h1):(1'h0)] >= (({$unsigned(reg56)} ?
                  (reg52 << (~^wire42)) : ((reg54 * reg53) >> ((8'hb8) ?
                      wire41 : reg52))) - {wire39[(1'h1):(1'h1)],
                  $unsigned((reg51 - reg46))}));
              reg54 <= wire38;
            end
          else
            begin
              reg53 <= $unsigned(reg46);
              reg54 <= $unsigned(((&reg50) == $signed(reg50)));
            end
        end
    end
  assign wire58 = (+((8'hb9) ^ (((^~reg52) > $signed((8'hb7))) ?
                      (reg51 != reg53[(3'h7):(2'h3)]) : ((&wire37) ?
                          {reg57} : $signed(reg56)))));
  always
    @(posedge clk) begin
      reg59 <= (($unsigned((^~$signed(reg53))) ?
              (~&wire42) : wire39[(1'h0):(1'h0)]) ?
          $signed(((reg56 <= ((8'haf) * reg49)) ?
              (|reg57) : (((8'hba) ~^ wire45) ?
                  (wire37 ~^ reg54) : $signed(reg48)))) : wire39[(1'h1):(1'h0)]);
      if (reg43[(2'h3):(1'h0)])
        begin
          reg60 <= {$signed((+$signed((8'hbb)))),
              (wire58[(4'h8):(3'h7)] * ($signed(wire37) >= wire38))};
        end
      else
        begin
          if ($signed(wire40[(2'h2):(1'h0)]))
            begin
              reg60 <= reg43;
            end
          else
            begin
              reg60 <= reg48[(1'h0):(1'h0)];
              reg61 <= $signed(reg53[(1'h1):(1'h0)]);
              reg62 <= wire40;
            end
          if ($signed({($unsigned((!reg57)) >>> (((8'ha6) < reg47) ?
                  (8'hb8) : $unsigned(reg61)))}))
            begin
              reg63 <= wire58;
              reg64 <= ($unsigned((reg57[(3'h7):(3'h4)] ?
                  reg56[(4'hd):(1'h0)] : (~reg51[(2'h3):(2'h2)]))) << wire42[(4'h9):(2'h2)]);
            end
          else
            begin
              reg63 <= (8'ha1);
              reg64 <= ($unsigned($signed(reg61)) ?
                  (^({wire41[(4'h8):(3'h6)],
                      wire58[(3'h5):(2'h3)]} & reg53[(4'hb):(1'h0)])) : {{$signed((reg55 * (8'hb9))),
                          $signed($signed(reg52))},
                      $signed($unsigned(reg53))});
            end
        end
    end
  assign wire65 = (({({reg62} ?
                          $unsigned(reg55) : $signed(wire42))} ~^ wire40[(3'h7):(3'h6)]) <<< $signed(((|((8'hbf) * wire42)) ?
                      (((8'ha1) ? reg55 : wire42) ?
                          {reg51, wire41} : $signed(reg64)) : wire44)));
  assign wire66 = (((reg47[(2'h2):(2'h2)] * reg48[(2'h2):(1'h1)]) ?
                      (8'hb2) : (($signed(reg55) > (~&wire39)) >>> (reg55[(1'h0):(1'h0)] ?
                          reg54 : wire37[(3'h6):(2'h3)]))) - reg56);
  assign wire67 = reg59;
  assign wire68 = (~^$unsigned((|reg46)));
endmodule
