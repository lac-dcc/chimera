module top
#(parameter param95 = {(~((8'hae) ? (((8'ha5) ? (8'hb2) : (8'ha4)) == (7'h42)) : (((8'hb1) ^~ (8'hac)) - ((8'ha7) ~^ (8'hb3)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire77;
  wire signed [(3'h4):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire75;
  wire [(5'h13):(1'h0)] wire74;
  wire [(4'h8):(1'h0)] wire73;
  wire [(4'he):(1'h0)] wire72;
  wire signed [(3'h6):(1'h0)] wire71;
  wire signed [(3'h7):(1'h0)] wire69;
  reg signed [(4'ha):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(4'hd):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(4'he):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg88 = (1'h0);
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  reg signed [(4'he):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(4'hf):(1'h0)] reg78 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
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
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  module4 #() modinst70 (.wire5((8'had)), .clk(clk), .wire6(wire3), .wire7(wire2), .wire8(wire1), .y(wire69), .wire9(wire0));
  assign wire71 = (({(~$unsigned(wire0)), {$unsigned(wire1)}} ?
                          (&wire1[(4'hd):(3'h5)]) : wire0) ?
                      (wire2 * ($unsigned($unsigned(wire1)) & wire2)) : wire2[(1'h1):(1'h0)]);
  assign wire72 = (~|wire69);
  assign wire73 = {$signed((^~wire0[(4'h9):(1'h0)]))};
  assign wire74 = ($signed($signed((+(~&wire71)))) * {wire0[(5'h15):(4'hd)],
                      (^wire73)});
  assign wire75 = wire73;
  assign wire76 = $signed(({(^(!wire72)),
                      (wire1[(1'h1):(1'h1)] != (^~wire69))} != $unsigned(($unsigned(wire69) ?
                      wire75 : $signed(wire3)))));
  assign wire77 = wire69;
  always
    @(posedge clk) begin
      if (wire73[(3'h7):(2'h3)])
        begin
          reg78 <= {$signed((!((wire73 ?
                  (8'ha8) : (8'hb6)) * wire75[(4'h9):(1'h0)]))),
              {(&($signed(wire72) + wire72)),
                  ((wire72 - $unsigned(wire69)) ?
                      (wire1[(3'h6):(3'h5)] != wire71) : {(7'h43), wire71})}};
          reg79 <= wire72[(3'h6):(3'h4)];
          reg80 <= $signed(reg79[(2'h2):(1'h0)]);
          reg81 <= $signed((^~(wire76 ?
              reg80[(4'he):(4'h9)] : wire72[(4'hd):(4'h9)])));
        end
      else
        begin
          reg78 <= ((8'ha3) ?
              ((((wire74 - wire3) | ((8'hb0) >= wire71)) << (8'hb1)) ?
                  ($unsigned({wire2,
                      wire76}) - ({(8'hbb)} <<< $signed((7'h40)))) : wire76) : (reg79 >> wire75[(5'h13):(2'h2)]));
          if (($signed(wire0[(4'hc):(3'h6)]) >= (~^$signed(wire71))))
            begin
              reg79 <= ($unsigned($unsigned($unsigned(wire72))) ?
                  $signed((~&wire77)) : $unsigned(wire2));
            end
          else
            begin
              reg79 <= (($signed(((wire71 ? (8'ha3) : reg78) | (wire71 ?
                      wire76 : reg78))) <= $unsigned($signed((reg79 ?
                      wire2 : wire2)))) ?
                  wire74[(1'h1):(1'h0)] : (wire74 ^~ $unsigned((8'hb8))));
              reg80 <= reg81[(3'h5):(1'h1)];
              reg81 <= wire76[(2'h3):(1'h1)];
              reg82 <= (7'h41);
            end
          if (wire71)
            begin
              reg83 <= ((~|wire74[(4'ha):(4'h9)]) ?
                  $unsigned((~(+$unsigned(wire75)))) : (wire2 > $signed($signed($unsigned((8'hae))))));
              reg84 <= (+(~|($unsigned({reg83, reg81}) < ({wire74} ^ reg78))));
              reg85 <= {(8'haf)};
              reg86 <= (reg78 >>> ($unsigned((wire69[(2'h2):(1'h0)] ?
                      wire76 : wire0[(5'h15):(4'hf)])) ?
                  $signed($signed((-reg79))) : wire69));
            end
          else
            begin
              reg83 <= (((~{{reg82,
                      reg78}}) ^ {$unsigned(wire69[(3'h5):(2'h2)]),
                  $signed({wire76})}) != ((reg79[(1'h1):(1'h1)] ?
                  wire75[(4'h9):(1'h0)] : ((-reg84) ?
                      $signed(reg86) : $unsigned(reg81))) & ($unsigned($unsigned(wire69)) ?
                  wire74[(3'h7):(3'h7)] : (wire75 ?
                      $signed(wire1) : (wire75 ? (8'hb4) : wire1)))));
              reg84 <= (^(^~wire76[(2'h2):(1'h0)]));
            end
          if ($signed((8'h9c)))
            begin
              reg87 <= (8'h9f);
              reg88 <= (+$signed(({wire0} >= (^~wire71))));
              reg89 <= {($signed(({wire72} & reg88)) ^ ((!(wire73 ?
                      reg78 : wire3)) && reg80[(4'hc):(4'h8)])),
                  {(7'h42)}};
              reg90 <= ($unsigned(reg80) ?
                  $unsigned({reg81}) : (!reg78[(4'h8):(3'h4)]));
            end
          else
            begin
              reg87 <= (~(|wire3[(5'h15):(1'h0)]));
              reg88 <= {{$unsigned(reg82)}};
              reg89 <= (((!$signed(reg85[(3'h7):(1'h0)])) >= (((8'hb3) ?
                      ((8'hbc) < wire1) : $unsigned(wire76)) | $unsigned(reg80))) ?
                  ((-{$signed(wire2)}) ?
                      reg81 : $unsigned((~|reg84))) : (^$unsigned(reg82)));
              reg90 <= $signed(wire74[(5'h11):(4'h8)]);
            end
        end
      reg91 <= $signed((~^(({reg85} | reg89[(3'h4):(1'h1)]) >> (!((8'hb2) >>> wire76)))));
      reg92 <= (~$signed($unsigned(((wire1 ? wire77 : (7'h40)) ?
          (reg80 ? wire77 : reg85) : $signed(reg79)))));
      if ($signed({((8'hbf) ? ($unsigned(reg88) - $unsigned(wire75)) : wire2)}))
        begin
          reg93 <= reg90;
        end
      else
        begin
          reg93 <= reg93;
        end
      reg94 <= {(reg84 > (^~((8'hb0) >> (reg87 ? reg89 : reg90)))),
          wire2[(4'hc):(1'h0)]};
    end
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire6;
  input wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire67;
  wire signed [(3'h7):(1'h0)] wire66;
  wire [(3'h4):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire63;
  wire signed [(5'h12):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire10;
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire63,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire33,
                 wire10,
                 (1'h0)};
  assign wire10 = wire8[(4'hc):(4'hb)];
  module11 #() modinst34 (wire33, clk, wire7, wire8, wire5, wire9);
  assign wire35 = wire6[(4'h9):(1'h0)];
  assign wire36 = $signed($unsigned(wire5[(5'h11):(4'h8)]));
  assign wire37 = wire35;
  assign wire38 = wire7[(1'h0):(1'h0)];
  assign wire39 = (&{($unsigned(wire6) | wire6[(5'h13):(4'h9)]), wire33});
  module40 #() modinst64 (wire63, clk, wire33, wire9, wire38, wire7);
  assign wire65 = ((|$unsigned(wire63[(4'hd):(1'h0)])) ?
                      wire10[(2'h3):(1'h0)] : ($unsigned($unsigned((~^(7'h41)))) && (~^wire9)));
  assign wire66 = {$unsigned($unsigned($unsigned($unsigned(wire63)))), wire38};
  assign wire67 = $signed((8'ha6));
  assign wire68 = $unsigned((+((wire37[(4'he):(1'h1)] ?
                          ((8'h9d) ? wire63 : wire67) : (wire67 != wire39)) ?
                      (wire38[(1'h1):(1'h1)] ^ $signed(wire8)) : $signed((wire10 ?
                          (8'ha1) : (8'ha9))))));
endmodule

module module40  (y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire44;
  input wire [(5'h13):(1'h0)] wire43;
  input wire signed [(4'hd):(1'h0)] wire42;
  input wire signed [(5'h13):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire62;
  wire [(3'h6):(1'h0)] wire60;
  wire signed [(5'h12):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire57;
  wire [(4'h9):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire54;
  wire signed [(4'ha):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire49;
  wire [(4'h8):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire46;
  wire [(4'h8):(1'h0)] wire45;
  reg [(3'h7):(1'h0)] reg61 = (1'h0);
  assign y = {wire62,
                 wire60,
                 wire59,
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
                 reg61,
                 (1'h0)};
  assign wire45 = (7'h40);
  assign wire46 = $signed($unsigned($signed((wire41[(3'h7):(3'h6)] - $unsigned(wire43)))));
  assign wire47 = wire41[(3'h6):(2'h3)];
  assign wire48 = $unsigned((^~($unsigned(wire43[(3'h6):(2'h3)]) ?
                      wire41 : (~(wire41 ? wire41 : wire46)))));
  assign wire49 = ($signed((-{(&wire45)})) ?
                      ((wire41 - wire47) ?
                          $signed(wire43[(4'h8):(4'h8)]) : (wire48[(3'h7):(1'h0)] ?
                              ((~(8'ha4)) ?
                                  (+wire47) : wire45[(2'h2):(2'h2)]) : wire42)) : ($signed((+(wire47 ^ wire44))) & (wire44[(3'h5):(3'h4)] ?
                          ((wire43 < wire46) << wire43[(5'h11):(4'ha)]) : ((^~wire48) ?
                              (wire48 ^ wire47) : wire43))));
  assign wire50 = $signed($unsigned({($signed(wire47) ?
                          (~|wire41) : {wire41, wire43})}));
  assign wire51 = (8'hb3);
  assign wire52 = $unsigned(((($unsigned(wire42) ?
                      $unsigned(wire50) : (8'hb2)) == wire46[(2'h2):(2'h2)]) & wire45));
  assign wire53 = $signed((~&wire41[(5'h10):(2'h2)]));
  assign wire54 = $signed(($unsigned($unsigned($unsigned(wire46))) ?
                      (wire42[(2'h2):(1'h1)] ?
                          (^~$unsigned(wire46)) : ((wire42 ?
                              wire47 : wire53) != (8'h9e))) : wire46[(3'h7):(3'h6)]));
  assign wire55 = wire50[(3'h6):(2'h3)];
  assign wire56 = wire54[(5'h11):(3'h5)];
  assign wire57 = (!wire42[(4'hd):(4'ha)]);
  assign wire58 = ((wire52[(1'h0):(1'h0)] ?
                          (~&(~{wire51,
                              wire53})) : ($signed($unsigned((8'hab))) ?
                              wire57 : $unsigned(((8'h9e) + wire50)))) ?
                      wire43[(3'h6):(3'h6)] : wire51);
  assign wire59 = $signed((wire54[(2'h2):(1'h1)] ?
                      {$unsigned($unsigned(wire51))} : wire56[(3'h7):(3'h7)]));
  assign wire60 = (^~wire49[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg61 <= (wire55[(2'h2):(1'h1)] ^~ wire52[(4'h9):(3'h7)]);
    end
  assign wire62 = wire52;
endmodule

module module11
#(parameter param32 = (^~(+(^{(~^(8'hab))}))))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire15;
  input wire [(4'he):(1'h0)] wire14;
  input wire [(5'h14):(1'h0)] wire13;
  input wire [(4'he):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire [(3'h6):(1'h0)] wire25;
  wire [(3'h4):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  assign y = {wire31,
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
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 (1'h0)};
  assign wire16 = wire12[(3'h4):(1'h0)];
  assign wire17 = wire16[(4'h9):(2'h3)];
  assign wire18 = wire15;
  assign wire19 = wire16[(1'h1):(1'h0)];
  assign wire20 = wire12[(4'hb):(4'hb)];
  assign wire21 = ({(wire20 >> wire14[(2'h3):(1'h0)]),
                          (~^(wire19[(3'h5):(1'h0)] ?
                              $signed(wire12) : wire12))} ?
                      $signed((^(wire17 ?
                          wire18[(4'h9):(3'h6)] : (^~wire13)))) : wire15[(5'h12):(4'hb)]);
  assign wire22 = $signed(wire21);
  assign wire23 = (~^wire20);
  assign wire24 = (&$signed(wire14));
  assign wire25 = $signed((wire22 && $unsigned(((+wire16) ?
                      $signed((8'hb4)) : wire23[(4'hb):(1'h1)]))));
  assign wire26 = (~((8'ha2) ?
                      $signed((^$unsigned(wire19))) : (!$unsigned((wire18 >= wire14)))));
  assign wire27 = $signed((8'hae));
  assign wire28 = (($unsigned(wire22[(4'hc):(3'h5)]) >> (~&{{wire26}})) && wire17[(3'h5):(1'h0)]);
  assign wire29 = (!wire12[(3'h7):(1'h1)]);
  assign wire30 = wire27;
  assign wire31 = ((~&$signed(wire20[(4'hc):(2'h3)])) < $signed((~((&wire14) ?
                      wire18[(4'hc):(1'h1)] : wire23))));
endmodule
