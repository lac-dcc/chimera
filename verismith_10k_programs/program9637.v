module top
#(parameter param89 = ((^((((8'haa) ~^ (8'hb8)) ? ((8'hba) ? (8'ha5) : (8'h9c)) : (-(8'hb0))) <= (!((7'h43) ~^ (8'hb1))))) - (7'h44)), 
parameter param90 = (~|param89))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire4;
  wire signed [(3'h6):(1'h0)] wire81;
  wire signed [(4'hb):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire79;
  wire [(4'hb):(1'h0)] wire73;
  wire signed [(4'he):(1'h0)] wire72;
  wire [(3'h6):(1'h0)] wire71;
  wire [(4'he):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire68;
  wire [(2'h2):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire65;
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  reg [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg70 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
                 wire68,
                 wire67,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire65,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg70,
                 (1'h0)};
  assign wire5 = (~|{wire3});
  assign wire6 = wire3[(1'h0):(1'h0)];
  assign wire7 = (wire6[(3'h6):(1'h0)] ?
                     ((~^$signed((wire0 + wire0))) ?
                         wire0 : {$unsigned($unsigned((8'hb1))),
                             wire3[(2'h2):(1'h1)]}) : wire0[(4'he):(4'h9)]);
  assign wire8 = wire3;
  assign wire9 = $signed(((~^(wire6[(3'h7):(2'h2)] ?
                     wire3 : (~^wire2))) + wire5));
  assign wire10 = $unsigned((wire6[(1'h0):(1'h0)] & wire9[(4'hd):(4'ha)]));
  module11 #() modinst66 (.y(wire65), .wire12(wire5), .clk(clk), .wire13(wire10), .wire15(wire6), .wire14(wire3), .wire16(wire2));
  assign wire67 = $signed($unsigned((~$signed($unsigned(wire0)))));
  assign wire68 = $signed((8'hb6));
  assign wire69 = $unsigned(wire9[(5'h13):(5'h12)]);
  always
    @(posedge clk) begin
      reg70 <= wire65;
    end
  assign wire71 = (-(($unsigned($unsigned(wire7)) ?
                      {wire0[(4'hf):(3'h7)],
                          (^~(8'hac))} : $signed({(8'h9d)})) <= wire65));
  assign wire72 = wire6;
  assign wire73 = ({(+($signed(wire6) ?
                              wire0[(3'h7):(3'h4)] : wire10[(1'h1):(1'h1)]))} ?
                      wire1[(4'h8):(1'h0)] : wire10);
  always
    @(posedge clk) begin
      reg74 <= wire10[(2'h2):(1'h1)];
      reg75 <= wire9;
      reg76 <= $unsigned(wire7);
      reg77 <= wire69[(4'he):(4'hd)];
      reg78 <= wire0;
    end
  assign wire79 = ((wire7[(4'hc):(3'h6)] ?
                      $signed((((8'hb5) ? reg76 : wire67) ?
                          wire73[(3'h6):(3'h6)] : wire68[(3'h4):(2'h3)])) : $unsigned((8'hb9))) <= wire5);
  assign wire80 = (($signed($signed({reg77})) ?
                      wire79 : ({(wire4 ? (7'h40) : wire3)} ?
                          $unsigned({(7'h43)}) : $unsigned((wire10 - wire65)))) && ($signed(wire1[(2'h3):(1'h0)]) - (~|wire71)));
  assign wire81 = ($unsigned(wire10[(2'h2):(2'h2)]) ?
                      (wire79 ?
                          (wire1[(1'h0):(1'h0)] ?
                              (wire72[(4'hb):(2'h2)] - $unsigned(wire1)) : $unsigned((&wire73))) : (8'ha9)) : $signed((((~|wire7) ?
                              {wire6} : (wire0 - wire71)) ?
                          $unsigned((+wire73)) : (reg75 == wire9[(4'h8):(2'h2)]))));
  always
    @(posedge clk) begin
      if ({((wire72 & wire81) != ((^~$signed(wire69)) ?
              (wire80 + {wire68, reg74}) : ((wire8 ? wire5 : reg74) != (wire2 ?
                  wire73 : reg70))))})
        begin
          reg82 <= {(~&reg70), wire81[(3'h4):(1'h0)]};
          reg83 <= $signed(((wire1 ?
                  wire10 : ($unsigned(wire8) ? wire5 : {wire73, wire68})) ?
              (((+reg77) ? (wire72 ~^ wire10) : reg74[(1'h0):(1'h0)]) ?
                  $unsigned(((8'hb6) ^~ reg74)) : $unsigned($signed(wire7))) : $unsigned(wire69[(4'h8):(3'h5)])));
          reg84 <= wire10[(3'h7):(1'h1)];
        end
      else
        begin
          if ($unsigned(wire10[(3'h7):(1'h0)]))
            begin
              reg82 <= $unsigned(($signed((^~(^wire80))) & reg83[(5'h11):(2'h2)]));
              reg83 <= (-({reg70,
                  $unsigned(wire10[(1'h1):(1'h0)])} << {wire10}));
            end
          else
            begin
              reg82 <= (~&wire1);
              reg83 <= $signed(($signed(wire73) << ((8'hb7) ~^ (-$signed(reg74)))));
            end
          if ((~|$unsigned(wire69[(3'h6):(2'h2)])))
            begin
              reg84 <= {((8'h9c) == $unsigned($signed({wire65}))),
                  (~^$unsigned((reg74 ?
                      $signed(reg70) : wire71[(2'h2):(2'h2)])))};
              reg85 <= (!($signed(((reg77 * wire69) != $signed(reg70))) == reg82[(2'h2):(2'h2)]));
            end
          else
            begin
              reg84 <= wire80[(4'h8):(3'h4)];
              reg85 <= wire68[(1'h1):(1'h1)];
              reg86 <= (wire4[(1'h1):(1'h0)] ? reg85[(4'hd):(4'hd)] : (8'hbc));
            end
          reg87 <= $unsigned(($signed($unsigned((!(8'hb0)))) <= (((wire6 ?
                      reg84 : reg83) ?
                  $signed(reg78) : ((8'haa) >> (7'h40))) ?
              {$unsigned((7'h40)),
                  (~&(8'h9e))} : ($signed(wire69) > (wire10 >> wire0)))));
        end
      reg88 <= reg70[(2'h2):(1'h1)];
    end
endmodule

module module11
#(parameter param63 = {(({{(8'ha9)}} && (~&((8'hbc) ? (8'ha0) : (8'ha4)))) - (({(7'h41), (7'h43)} - ((8'hbf) ? (8'h9f) : (7'h43))) <<< (-((8'hae) > (7'h41)))))}, 
parameter param64 = ((~|param63) ? ((((param63 ? (8'haa) : param63) & (8'ha1)) > param63) ~^ (((|param63) ? (param63 >> (8'haf)) : (param63 * param63)) ? (param63 >= ((8'ha7) ? (8'haa) : (8'ha0))) : ((~(8'hbb)) ^ (param63 ? (8'h9c) : (7'h41))))) : (param63 ? ((8'ha3) > (8'hb9)) : (~|param63))))
(y, clk, wire12, wire13, wire14, wire15, wire16);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire12;
  input wire signed [(3'h6):(1'h0)] wire13;
  input wire [(5'h12):(1'h0)] wire14;
  input wire signed [(4'hd):(1'h0)] wire15;
  input wire [(4'ha):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire61;
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  assign y = {wire17, wire19, wire20, wire21, wire22, wire61, reg18, (1'h0)};
  assign wire17 = (~|wire16[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg18 <= wire13[(3'h6):(2'h2)];
    end
  assign wire19 = wire15;
  assign wire20 = reg18;
  assign wire21 = (~^$unsigned((^wire16)));
  assign wire22 = (wire14 ?
                      wire12 : $signed(($signed($signed(wire21)) ?
                          reg18 : $unsigned((wire13 * reg18)))));
  module23 #() modinst62 (wire61, clk, wire21, reg18, wire12, wire19);
endmodule

module module23
#(parameter param59 = ((((~&((8'haf) ^~ (8'hbe))) ? ({(7'h41), (8'h9c)} ? ((8'h9f) ~^ (8'ha1)) : (~|(8'hac))) : (((7'h42) != (8'hb6)) | (~&(8'hba)))) == (~|{((8'hb9) ? (8'hb8) : (8'ha6)), {(8'h9c)}})) ^ (~|{(((8'ha9) ? (8'h9c) : (8'hac)) ? ((8'hbe) ? (8'ha4) : (8'hbc)) : ((7'h44) ? (8'h9c) : (8'ha3))), (((7'h40) ? (8'hb3) : (8'hb0)) ^ {(8'ha4)})})), 
parameter param60 = (8'h9e))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire27;
  input wire [(5'h13):(1'h0)] wire26;
  input wire signed [(5'h15):(1'h0)] wire25;
  input wire signed [(4'ha):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire42;
  wire [(3'h5):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire28;
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire44,
                 wire43,
                 wire42,
                 wire30,
                 wire29,
                 wire28,
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
                 reg45,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire28 = (~|{(&wire27[(3'h7):(1'h1)])});
  assign wire29 = $signed($unsigned((wire26 ?
                      (wire26 | $signed(wire27)) : (-$unsigned(wire25)))));
  assign wire30 = (wire24 ?
                      wire24 : {(wire24 ?
                              (~|wire24[(4'h8):(3'h6)]) : {(~wire26)}),
                          $unsigned($unsigned(wire29))});
  always
    @(posedge clk) begin
      if (($unsigned({($unsigned(wire24) ?
              (!wire28) : (wire25 >= wire26))}) || wire26))
        begin
          reg31 <= (($unsigned((wire26[(5'h12):(3'h7)] == {wire28})) << wire25[(2'h3):(1'h0)]) | wire28);
        end
      else
        begin
          reg31 <= ($unsigned((((8'hb6) ?
              $signed(wire24) : (wire27 | wire29)) - {$unsigned(wire29)})) ~^ ($signed((~|$signed(wire29))) ?
              wire30 : $signed(((wire30 ? reg31 : wire27) ?
                  (-wire27) : (8'ha7)))));
          if ({{((wire29[(4'he):(1'h1)] ^~ {wire30, wire27}) ?
                      {(wire25 ? (7'h41) : wire25),
                          wire25} : (wire27[(1'h1):(1'h0)] * (reg31 ~^ wire26))),
                  wire24},
              (~&$unsigned(wire30[(2'h2):(1'h1)]))})
            begin
              reg32 <= {$unsigned((wire27[(3'h5):(1'h1)] ?
                      $unsigned((~^wire26)) : (wire27[(4'ha):(4'h9)] ?
                          (wire29 ~^ wire29) : wire30[(1'h1):(1'h1)]))),
                  $unsigned($unsigned((wire29 ? wire25 : (8'ha8))))};
              reg33 <= $unsigned($unsigned((&(8'h9c))));
              reg34 <= reg32;
              reg35 <= (reg31[(1'h1):(1'h0)] ? wire25[(3'h4):(2'h2)] : wire29);
            end
          else
            begin
              reg32 <= (({{(~&reg34), reg34[(2'h3):(2'h3)]}} ?
                      wire30[(1'h1):(1'h0)] : $unsigned($unsigned((~|wire30)))) ?
                  (((~$unsigned(reg32)) - (-wire28)) ?
                      reg31 : $unsigned($signed((wire27 & wire28)))) : $unsigned((wire28 || ($unsigned(wire30) ?
                      {reg33, (7'h43)} : $unsigned((8'hae))))));
              reg33 <= ({(($signed(reg35) ? (~wire28) : (reg35 <= (8'ha1))) ?
                          $signed($signed(wire28)) : $signed(wire28[(4'hd):(4'hb)])),
                      ({{reg35, reg32}} >>> (reg33 ?
                          $signed(wire24) : $unsigned(wire28)))} ?
                  (|(^((reg32 ?
                      wire26 : (8'hb5)) * wire28[(4'hc):(2'h2)]))) : $signed((~|(-$unsigned(reg34)))));
            end
          reg36 <= {$unsigned((((wire29 <<< wire27) ?
                  (~|reg35) : reg34[(1'h1):(1'h1)]) <= wire30[(1'h0):(1'h0)])),
              wire24[(3'h4):(2'h2)]};
          reg37 <= reg36[(1'h1):(1'h1)];
        end
      reg38 <= $signed(wire26);
      reg39 <= ((8'hb8) != ((~^$unsigned($unsigned(wire27))) || ((~^$signed(wire27)) | {wire25[(5'h13):(3'h7)]})));
      reg40 <= reg38;
      reg41 <= (reg40[(4'h8):(2'h2)] <<< (wire29 <= (+(reg38 ?
          wire26 : wire26[(4'hd):(4'h9)]))));
    end
  assign wire42 = wire24[(2'h2):(1'h0)];
  assign wire43 = $signed(($unsigned($signed((wire24 ?
                      wire27 : wire42))) >>> (reg36 ~^ $unsigned(wire26))));
  assign wire44 = reg31;
  always
    @(posedge clk) begin
      reg45 <= {(($signed($signed(reg32)) ?
                  (!(reg34 && reg37)) : ($unsigned(reg34) < $signed((8'h9c)))) ?
              $signed(reg37) : reg33)};
      reg46 <= $unsigned((|(&$signed(reg31))));
    end
  always
    @(posedge clk) begin
      if (wire43)
        begin
          reg47 <= wire42[(5'h11):(2'h3)];
          if ((^(~&reg36[(2'h2):(2'h2)])))
            begin
              reg48 <= ($unsigned(wire27) ^~ $unsigned(reg35[(2'h3):(1'h0)]));
              reg49 <= {(((reg31 ?
                      ((8'h9d) ?
                          (8'ha3) : wire28) : wire26) | $unsigned($unsigned(wire27))) >>> $unsigned(($unsigned(reg34) ?
                      wire42 : (reg45 ~^ reg33))))};
              reg50 <= (^~wire30[(2'h2):(2'h2)]);
              reg51 <= $signed((~|$signed(($signed((8'ha7)) & (+reg50)))));
              reg52 <= reg39[(2'h2):(1'h1)];
            end
          else
            begin
              reg48 <= (+reg35);
            end
          reg53 <= reg35;
          reg54 <= wire44[(3'h5):(1'h0)];
        end
      else
        begin
          if ((wire43[(3'h4):(2'h3)] <= reg39))
            begin
              reg47 <= $signed(wire43);
              reg48 <= $signed((~&$unsigned(reg41[(4'hc):(2'h3)])));
              reg49 <= $unsigned(reg46[(4'ha):(4'h9)]);
              reg50 <= ((reg38[(1'h1):(1'h0)] >>> ({{reg49}} ?
                  (~&$unsigned(reg33)) : (|reg53))) == $signed($unsigned($signed((^~reg45)))));
            end
          else
            begin
              reg47 <= wire29[(4'hc):(3'h5)];
            end
          if (reg52[(1'h1):(1'h1)])
            begin
              reg51 <= {{(^~$unsigned(((8'ha8) == wire44))),
                      reg36[(3'h4):(3'h4)]},
                  $unsigned(((reg46[(3'h7):(3'h5)] ?
                      $signed(reg38) : $signed(reg37)) || ((~^reg48) + $unsigned(reg51))))};
              reg52 <= wire43;
            end
          else
            begin
              reg51 <= $signed(($signed({(reg46 - reg35)}) << ((|(reg41 >> (8'ha7))) ?
                  $unsigned({wire26}) : (wire43[(3'h4):(2'h2)] ?
                      (8'hb7) : wire27[(4'hb):(4'ha)]))));
            end
          reg53 <= ($unsigned((^~({reg40,
              wire28} || $signed((8'ha2))))) | $unsigned({(8'h9f)}));
        end
      reg55 <= reg46[(4'ha):(4'h8)];
      reg56 <= ((reg33[(2'h3):(1'h0)] ?
          $signed((reg50 ?
              {reg37,
                  reg55} : (reg52 ~^ reg34))) : (~$signed((reg33 - reg35)))) ^ reg36);
    end
  assign wire57 = (($signed($signed({reg40, reg46})) ?
                          reg37[(3'h7):(2'h3)] : (8'hae)) ?
                      reg52[(4'he):(1'h1)] : {wire44, reg46});
  assign wire58 = ({(|(wire43[(1'h0):(1'h0)] - wire42))} ?
                      reg41[(3'h5):(1'h1)] : $unsigned($unsigned(reg41[(4'h8):(3'h5)])));
endmodule
