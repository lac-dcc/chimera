module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  wire signed [(4'hf):(1'h0)] wire110;
  wire signed [(5'h14):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire108;
  assign y = {wire110, wire4, wire5, wire6, wire108, (1'h0)};
  assign wire4 = ({{(+(wire3 >= wire3))}} ?
                     wire1[(1'h0):(1'h0)] : (wire2[(5'h12):(4'h8)] << $unsigned(($unsigned(wire1) == (-wire0)))));
  assign wire5 = (-wire0[(1'h1):(1'h1)]);
  assign wire6 = $unsigned((~|(~^((wire0 ? wire0 : wire3) ?
                     wire4 : wire5[(3'h5):(1'h1)]))));
  module7 #() modinst109 (wire108, clk, wire3, wire0, wire1, wire2, wire6);
  assign wire110 = $signed({$signed($signed(wire2[(4'h9):(2'h3)])),
                       (~^wire0[(1'h0):(1'h0)])});
endmodule

module module7
#(parameter param106 = {{(({(8'h9e)} ? (-(8'ha9)) : (~^(8'hb0))) - ({(8'h9d), (8'h9d)} ? {(8'ha9), (8'ha6)} : (~(8'hbc)))), (-((^(8'hbb)) ? (!(8'h9e)) : {(8'hba), (8'haf)}))}, {(~^(((8'hac) ? (8'ha1) : (8'hb0)) ? (&(8'ha8)) : {(7'h42), (8'ha7)}))}}, 
parameter param107 = param106)
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire11;
  input wire [(4'ha):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire105;
  wire signed [(2'h2):(1'h0)] wire99;
  wire [(4'hb):(1'h0)] wire62;
  wire [(5'h13):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire59;
  wire signed [(4'ha):(1'h0)] wire58;
  wire signed [(3'h4):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire55;
  wire [(3'h5):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire53;
  wire signed [(2'h3):(1'h0)] wire52;
  wire [(5'h12):(1'h0)] wire50;
  reg [(4'hc):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  assign y = {wire105,
                 wire99,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire50,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 (1'h0)};
  module13 #() modinst51 (wire50, clk, wire8, wire10, wire12, wire11, wire9);
  assign wire52 = {$signed(wire10), $unsigned(((|$signed(wire12)) >>> wire8))};
  assign wire53 = {(wire10 ?
                          ($unsigned(wire50[(5'h10):(3'h4)]) ?
                              $unsigned(wire52[(1'h0):(1'h0)]) : (^~$unsigned((8'ha9)))) : (8'hbe))};
  assign wire54 = wire50;
  assign wire55 = {(|wire12[(2'h3):(1'h1)]), wire11};
  assign wire56 = wire54[(3'h5):(2'h3)];
  assign wire57 = $signed((~&wire9));
  assign wire58 = wire9;
  assign wire59 = wire54[(1'h1):(1'h1)];
  assign wire60 = {$unsigned(((|wire52[(1'h0):(1'h0)]) ?
                          ($signed(wire52) - (wire8 && (8'hbc))) : ((8'hba) << ((8'ha3) ?
                              wire59 : wire57))))};
  assign wire61 = (~^$signed(wire10));
  assign wire62 = {(+(((wire10 ^ wire57) ^ $unsigned(wire8)) ?
                          $signed($signed((8'had))) : $unsigned(wire8[(3'h4):(1'h0)])))};
  always
    @(posedge clk) begin
      if (((wire57 ?
          wire59[(3'h6):(3'h5)] : $unsigned(wire10)) != $unsigned($unsigned(((~|wire56) <= (wire12 ^ wire52))))))
        begin
          if (wire61)
            begin
              reg63 <= wire11;
              reg64 <= (8'hbb);
              reg65 <= wire9[(1'h1):(1'h1)];
            end
          else
            begin
              reg63 <= {wire11};
            end
          reg66 <= $unsigned($unsigned(wire60));
        end
      else
        begin
          reg63 <= (reg64 * {((wire59 || wire60) >= wire57[(2'h2):(2'h2)])});
          reg64 <= $signed({$signed({reg66, $unsigned(wire53)}),
              {(8'h9d), $unsigned({(8'ha3)})}});
          reg65 <= wire10;
        end
      reg67 <= (~|(($unsigned((wire62 <<< wire55)) ?
          (&wire59) : $signed((8'haf))) >> wire56[(3'h7):(2'h2)]));
      reg68 <= wire56;
    end
  module69 #() modinst100 (wire99, clk, wire55, wire56, reg65, reg68, reg64);
  always
    @(posedge clk) begin
      reg101 <= $unsigned(reg63[(4'h9):(1'h1)]);
      reg102 <= ({($signed((^~wire53)) ? $signed(reg66) : reg64),
          {$signed((reg65 ? wire57 : wire10))}} < (8'hb2));
      reg103 <= (wire99[(2'h2):(1'h0)] >= ((((wire53 == (7'h40)) ~^ (wire62 ?
          wire55 : reg64)) ~^ wire62) ~^ $unsigned(reg101)));
      reg104 <= (((((wire54 * wire12) - ((8'ha8) - wire53)) ?
              ((~&wire54) == (wire50 ?
                  reg64 : reg63)) : $signed($unsigned((7'h41)))) != ({reg65} ?
              ({reg102} ? wire55 : (reg64 ? wire61 : wire55)) : ((!wire10) ?
                  $unsigned(reg101) : wire12))) ?
          $unsigned($signed(((~&reg68) >>> ((8'hb2) && reg63)))) : ($signed($signed({wire50})) & ($signed((reg66 ?
                  (7'h44) : wire54)) ?
              ($signed(wire56) ?
                  (reg63 > wire9) : wire61[(2'h2):(1'h0)]) : (+$unsigned(reg66)))));
    end
  assign wire105 = $unsigned($signed(($unsigned($unsigned(wire62)) ?
                       (~wire53[(2'h2):(1'h1)]) : (^~$unsigned(wire59)))));
endmodule

module module69
#(parameter param97 = (((-(((8'hb5) ? (8'hb7) : (8'hb1)) ? ((8'hab) << (7'h41)) : (^(7'h40)))) ? ((((7'h40) && (8'hbe)) ? ((7'h42) ? (8'hbe) : (8'had)) : (~^(8'hb5))) || (+((8'ha8) ? (8'h9e) : (8'hb7)))) : ((^~{(8'hb9)}) | ({(8'had), (8'hbb)} + (~^(8'hab))))) <<< (|((!(8'had)) * ({(8'haf)} <<< (!(8'hbd)))))), 
parameter param98 = param97)
(y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'h111):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire74;
  input wire signed [(3'h4):(1'h0)] wire73;
  input wire signed [(3'h7):(1'h0)] wire72;
  input wire [(3'h7):(1'h0)] wire71;
  input wire [(4'h9):(1'h0)] wire70;
  wire [(4'h8):(1'h0)] wire96;
  wire [(2'h2):(1'h0)] wire95;
  wire signed [(3'h5):(1'h0)] wire94;
  wire signed [(5'h10):(1'h0)] wire93;
  wire signed [(3'h7):(1'h0)] wire92;
  wire signed [(4'he):(1'h0)] wire91;
  wire [(4'h8):(1'h0)] wire89;
  reg [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(5'h13):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg [(5'h14):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire89,
                 reg90,
                 reg88,
                 reg87,
                 reg86,
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
  always
    @(posedge clk) begin
      if ($unsigned(wire74))
        begin
          if ($signed(((8'hbb) ? wire73[(3'h4):(1'h0)] : wire73)))
            begin
              reg75 <= (8'ha6);
            end
          else
            begin
              reg75 <= (&wire73);
              reg76 <= (+(reg75[(2'h3):(2'h3)] <<< $signed((wire70[(2'h3):(1'h0)] || wire71))));
            end
          if ((wire72[(3'h7):(2'h2)] ? (8'ha6) : wire71))
            begin
              reg77 <= $signed((~&(-$unsigned((wire70 + wire72)))));
              reg78 <= wire71;
            end
          else
            begin
              reg77 <= ((wire71 >= $unsigned((8'hb4))) ?
                  (~^(7'h40)) : $unsigned($signed($signed($unsigned(reg75)))));
              reg78 <= reg75[(2'h2):(1'h1)];
            end
          if (wire73)
            begin
              reg79 <= (~^(!$unsigned((~|{reg76, wire74}))));
              reg80 <= $signed($unsigned($signed(reg77)));
            end
          else
            begin
              reg79 <= ($unsigned($unsigned((|$unsigned(wire71)))) < ((wire70 ?
                      {{reg78, wire74}, (8'hb0)} : reg78) ?
                  $signed((^(-wire70))) : $signed(({wire72,
                      reg75} + wire70[(4'h8):(3'h6)]))));
              reg80 <= ((~|($unsigned((wire72 >>> reg77)) | {(wire71 ?
                      reg79 : wire73)})) & $unsigned($unsigned((reg75 ?
                  $unsigned((7'h43)) : $signed(reg80)))));
              reg81 <= (8'hb3);
              reg82 <= (^{(&((wire73 || wire70) ?
                      (~&reg78) : $unsigned(reg75)))});
            end
          reg83 <= reg82;
        end
      else
        begin
          if ((~&(&$signed(reg77[(2'h2):(2'h2)]))))
            begin
              reg75 <= ((reg82 >>> (reg77[(1'h0):(1'h0)] ?
                      $signed((^reg79)) : ($signed(wire72) ?
                          wire72[(3'h6):(3'h5)] : $unsigned(wire72)))) ?
                  {wire71,
                      $unsigned($unsigned($unsigned(wire73)))} : reg75[(1'h1):(1'h1)]);
              reg76 <= reg83[(3'h6):(3'h4)];
            end
          else
            begin
              reg75 <= {((reg75[(2'h2):(2'h2)] ?
                      wire71 : $signed((reg80 >= reg80))) && (-(7'h41))),
                  reg82};
              reg76 <= {reg75[(1'h0):(1'h0)],
                  $unsigned($unsigned($signed($signed(reg79))))};
              reg77 <= (({($unsigned(reg76) ?
                      (~&reg81) : (!(8'had)))} >= (wire71[(2'h2):(2'h2)] <= $unsigned((reg80 >> reg75)))) + ($signed($signed($signed(reg80))) != ($signed(reg75) ?
                  $unsigned(wire73) : (^reg82[(5'h13):(5'h12)]))));
              reg78 <= (8'hb0);
              reg79 <= (~&((($unsigned(reg78) & $signed((8'hbd))) ?
                      wire74 : (^reg80[(1'h1):(1'h1)])) ?
                  $signed($signed(wire71[(1'h1):(1'h0)])) : wire74[(1'h0):(1'h0)]));
            end
          if (((({wire74[(2'h2):(2'h2)], ((7'h44) ? wire71 : (8'h9e))} ?
                      (!$unsigned((8'hb7))) : $signed((reg83 ?
                          wire73 : wire72))) ?
                  (wire70 < (+((8'ha3) ?
                      reg75 : (8'ha4)))) : (reg83[(4'h9):(3'h4)] >>> (wire74 ?
                      reg78[(2'h2):(1'h0)] : (|reg81)))) ?
              (reg82 >>> $signed(((reg81 ?
                  reg78 : wire70) | wire73[(1'h1):(1'h1)]))) : (reg81 ?
                  $signed(reg77[(2'h2):(1'h0)]) : {((+(8'haa)) ?
                          $unsigned(reg77) : (reg76 >>> reg80))})))
            begin
              reg80 <= (^~($unsigned(reg83[(4'h9):(4'h8)]) ?
                  reg75[(2'h3):(2'h3)] : wire72));
            end
          else
            begin
              reg80 <= {(!$signed(reg81)),
                  ({($unsigned(wire74) ? wire73 : $signed(reg75))} ?
                      $unsigned(((~&reg76) ?
                          wire72[(3'h7):(1'h0)] : $unsigned((8'hb4)))) : $signed(wire70))};
              reg81 <= $signed(($unsigned($unsigned((reg76 - wire72))) ?
                  reg79[(3'h7):(3'h7)] : (reg77 ?
                      reg83 : wire70[(2'h3):(1'h0)])));
              reg82 <= $unsigned((~|$unsigned((+$unsigned(reg77)))));
              reg83 <= ((^~(((wire74 >> reg82) ?
                      $unsigned(reg80) : reg80[(4'h9):(3'h6)]) >>> reg76)) ?
                  (-$signed(((~&(8'ha2)) ^~ (8'hbc)))) : {($signed((reg81 ?
                              (8'ha1) : reg79)) ?
                          $unsigned(((8'hbb) != reg83)) : reg76),
                      wire70});
              reg84 <= $signed(reg75);
            end
          reg85 <= (reg81 ? wire73[(1'h1):(1'h1)] : reg80);
        end
      reg86 <= (~^$signed(reg83[(3'h7):(3'h6)]));
      reg87 <= (~^$unsigned(($signed((reg79 ? (8'ha7) : reg86)) ?
          ($unsigned(reg77) ?
              reg85[(1'h1):(1'h1)] : (reg76 ?
                  reg76 : (8'hab))) : $signed($signed(wire71)))));
      reg88 <= (reg81 ?
          $unsigned($signed((~$signed((8'h9e))))) : (($unsigned($unsigned(reg77)) ?
              $signed(((8'hb9) ?
                  reg79 : wire72)) : $unsigned(wire70[(4'h8):(3'h4)])) ^~ reg75[(1'h0):(1'h0)]));
    end
  assign wire89 = reg83[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg90 <= $unsigned((reg79 ?
          wire70[(2'h3):(2'h3)] : (|$signed({(8'ha7)}))));
    end
  assign wire91 = $unsigned($signed(reg82[(4'hf):(4'hf)]));
  assign wire92 = ($unsigned(reg79[(3'h7):(3'h5)]) ?
                      reg84 : ($unsigned((8'hb4)) ?
                          $signed({reg78}) : wire72[(2'h2):(2'h2)]));
  assign wire93 = $signed($signed((+wire71)));
  assign wire94 = (-($unsigned((8'hb5)) * wire93[(2'h2):(2'h2)]));
  assign wire95 = $signed(reg79);
  assign wire96 = $unsigned(reg90[(1'h0):(1'h0)]);
endmodule

module module13
#(parameter param48 = {((((+(8'ha0)) ? (|(8'ha3)) : {(8'hbe), (8'hb5)}) <= ((~(8'ha3)) ? (|(8'hbd)) : ((8'ha3) <= (8'h9c)))) ? (8'ha8) : {{((7'h40) ? (7'h40) : (8'hbf)), ((8'hbb) ? (8'ha2) : (8'hae))}}), ((((^~(8'ha0)) ? ((7'h44) ? (8'hba) : (8'h9f)) : (~|(8'hb2))) ? (((8'hb2) ? (8'h9d) : (8'ha4)) & ((8'ha2) ? (8'hb0) : (8'hab))) : (((8'hbf) > (8'hae)) ? {(8'h9d), (8'hbd)} : ((8'haa) ? (8'ha2) : (7'h43)))) ^~ (~^(((8'hb9) ? (8'hba) : (8'haa)) & (~^(8'h9e)))))}, 
parameter param49 = param48)
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire18;
  input wire [(5'h14):(1'h0)] wire17;
  input wire [(2'h2):(1'h0)] wire16;
  input wire signed [(5'h13):(1'h0)] wire15;
  input wire [(2'h2):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire signed [(2'h3):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire21;
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
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
                 wire21,
                 reg44,
                 reg43,
                 reg42,
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
                 reg20,
                 reg19,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg19 <= (~^wire16[(1'h1):(1'h1)]);
      reg20 <= $signed({(((~&wire17) ? $signed(wire18) : (wire15 >= wire17)) ?
              wire18[(1'h0):(1'h0)] : ((-reg19) ?
                  $signed(wire17) : (wire15 ? wire14 : reg19)))});
    end
  assign wire21 = (^~(8'haf));
  assign wire22 = (|wire15[(3'h5):(1'h1)]);
  assign wire23 = $signed({wire16[(2'h2):(2'h2)]});
  assign wire24 = $unsigned($signed($unsigned(((wire17 >>> wire15) ?
                      $signed(wire22) : wire18))));
  assign wire25 = ({(reg19 ?
                          ((wire14 ?
                              wire24 : wire22) - (wire15 <<< (8'ha4))) : $unsigned($unsigned(wire22)))} * wire23);
  assign wire26 = (((wire16[(1'h1):(1'h1)] << (wire24[(4'hb):(4'h9)] >>> wire25[(4'h9):(4'h8)])) ?
                          $signed(wire23[(2'h3):(2'h3)]) : wire14[(2'h2):(2'h2)]) ?
                      $unsigned((((~reg19) ? $unsigned(wire22) : (8'h9d)) ?
                          (wire22 ?
                              $unsigned(wire14) : ((8'hb5) <<< wire17)) : ($signed(wire24) | (~wire18)))) : ((~({(7'h43)} ?
                              $signed(wire16) : (wire23 && wire21))) ?
                          ($signed((~&(7'h43))) ~^ {$signed(wire25)}) : (($signed(wire24) ?
                                  $signed(wire25) : (|wire21)) ?
                              $signed({(7'h43)}) : $unsigned($unsigned(wire14)))));
  assign wire27 = (|(~($signed($unsigned(wire16)) <= ((wire24 ?
                          (8'hb8) : wire25) ?
                      wire16[(2'h2):(1'h1)] : (wire16 ? wire16 : (8'ha7))))));
  assign wire28 = $unsigned($unsigned(wire17[(4'hf):(1'h1)]));
  assign wire29 = wire23;
  assign wire30 = (|(~|((!(wire16 <= wire21)) ?
                      {reg20[(1'h0):(1'h0)]} : wire26[(2'h2):(1'h1)])));
  assign wire31 = ({(wire26 < $signed(((8'ha6) ? (8'hbb) : wire18))),
                      (wire28[(1'h1):(1'h0)] ?
                          $signed(wire14) : (8'hb7))} <= $signed((8'hbc)));
  always
    @(posedge clk) begin
      if ($signed(wire31[(1'h1):(1'h1)]))
        begin
          if ((|$signed($unsigned(((reg20 >> wire31) >> (wire23 ?
              wire17 : wire21))))))
            begin
              reg32 <= ({$unsigned((^~(wire26 >= wire29))),
                      ($unsigned((wire15 ? wire25 : wire24)) << wire27)} ?
                  (wire26[(2'h2):(1'h0)] == $unsigned($signed((wire14 ?
                      wire14 : wire29)))) : $signed($signed($signed($unsigned(wire21)))));
              reg33 <= ($signed(wire24[(4'hc):(4'hb)]) && ((reg32[(2'h2):(1'h0)] >> (8'hb9)) <<< $signed({(wire22 ?
                      wire17 : wire29),
                  {wire21, wire30}})));
              reg34 <= $signed($signed((7'h40)));
              reg35 <= ($signed(reg20[(4'he):(4'hd)]) ?
                  wire17[(3'h4):(1'h1)] : $signed(({wire24[(4'hb):(4'h8)],
                          $unsigned(wire24)} ?
                      wire28 : $signed((^wire28)))));
              reg36 <= (8'haa);
            end
          else
            begin
              reg32 <= wire25;
              reg33 <= wire27[(2'h2):(1'h0)];
              reg34 <= ($unsigned($unsigned((~$signed(wire25)))) - ((!(-(wire28 | (8'ha4)))) - $unsigned(reg35)));
              reg35 <= wire18;
              reg36 <= $signed((reg33 ?
                  {wire21,
                      $signed((wire17 ?
                          wire14 : wire18))} : (wire17[(4'hf):(4'ha)] ?
                      (wire26 ?
                          {(8'ha1)} : $unsigned(wire17)) : (wire15[(2'h2):(1'h0)] <<< (wire26 ?
                          wire24 : wire24)))));
            end
          reg37 <= $unsigned($unsigned(reg32[(1'h1):(1'h0)]));
        end
      else
        begin
          reg32 <= (((reg20 ?
              $unsigned($unsigned(reg20)) : {((8'hb2) ?
                      wire17 : reg37)}) && wire24) != $signed({$unsigned(wire24[(3'h6):(2'h3)]),
              $signed($unsigned(wire28))}));
          reg33 <= wire23[(3'h5):(2'h3)];
        end
      if ((~$unsigned(($unsigned((~&(8'ha3))) ?
          reg20[(1'h0):(1'h0)] : {((8'hac) ? (8'hb2) : reg35)}))))
        begin
          reg38 <= wire29;
          reg39 <= reg38[(4'hd):(1'h0)];
          reg40 <= {wire23[(2'h2):(1'h1)]};
          reg41 <= {wire21};
          reg42 <= wire16;
        end
      else
        begin
          reg38 <= wire14;
        end
      reg43 <= $signed(wire18[(2'h2):(1'h0)]);
      reg44 <= (~^({$unsigned(((8'h9f) || wire14))} * reg32));
    end
  assign wire45 = (&(wire21 ?
                      ((reg39[(4'hd):(4'h8)] ^~ (8'hb3)) ?
                          (~reg36) : (&(wire22 >= reg36))) : $unsigned($unsigned($signed(wire24)))));
  assign wire46 = (|({({wire16, reg33} - reg32),
                          ((reg20 & wire18) >> {reg39, reg35})} ?
                      reg33 : ($unsigned(reg41[(4'h9):(1'h0)]) ?
                          {(reg19 ? wire15 : wire21), reg43} : reg42)));
  assign wire47 = (wire24 ?
                      ((7'h40) ?
                          ((((8'hbd) ?
                              (8'hb1) : (8'hb1)) ^ (wire26 <= wire18)) << reg37[(3'h4):(1'h1)]) : ($signed($unsigned(wire23)) ?
                              $signed((^wire21)) : (^~(reg19 ?
                                  reg20 : wire46)))) : (+$unsigned((!(reg37 ?
                          reg44 : reg38)))));
endmodule
