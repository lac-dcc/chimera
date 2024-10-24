module top
#(parameter param112 = (^~((((&(8'hb3)) ? ((8'h9f) < (7'h40)) : (^(8'hae))) & (!((8'hbb) ? (8'ha5) : (8'hb2)))) && {((8'hb7) ? (!(8'ha3)) : ((8'ha9) <= (8'hbf)))})), 
parameter param113 = (({((^~param112) ~^ (+param112))} ? ({param112, (param112 ? param112 : param112)} ? param112 : (!param112)) : (((&param112) || (^~param112)) ^~ {(param112 ? param112 : param112)})) <<< (8'hbd)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h20f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire108;
  wire [(5'h10):(1'h0)] wire107;
  wire [(3'h6):(1'h0)] wire106;
  wire [(4'h9):(1'h0)] wire94;
  wire signed [(3'h5):(1'h0)] wire93;
  wire signed [(4'hd):(1'h0)] wire92;
  wire [(5'h13):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire68;
  wire [(5'h11):(1'h0)] wire66;
  reg [(4'h9):(1'h0)] reg111 = (1'h0);
  reg signed [(4'he):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg103 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(4'hf):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(4'he):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(4'h9):(1'h0)] reg90 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg75 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire94,
                 wire93,
                 wire92,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire66,
                 reg111,
                 reg110,
                 reg109,
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
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  module5 #() modinst67 (wire66, clk, wire0, wire3, wire4, wire2, wire1);
  assign wire68 = ((($unsigned((wire66 >> (8'hba))) | wire2) ?
                          $unsigned(wire1) : wire4[(5'h11):(1'h1)]) ?
                      (!wire4) : wire2[(3'h7):(1'h0)]);
  assign wire69 = $unsigned(($signed(wire66) * (8'hbd)));
  assign wire70 = $unsigned({((wire69[(3'h7):(3'h6)] - $unsigned(wire68)) ?
                          wire0 : wire66)});
  assign wire71 = (wire0 ?
                      ((^~$signed($unsigned(wire1))) >= $signed({{wire0}})) : ($signed($unsigned($signed(wire3))) ?
                          (~((wire66 ? wire4 : wire1) && (wire0 ?
                              wire68 : (8'ha3)))) : (((wire2 ?
                                      (8'hbe) : wire66) ?
                                  ((8'hbf) - wire70) : wire68) ?
                              wire1[(5'h14):(1'h1)] : $unsigned((~^wire1)))));
  assign wire72 = ((({$signed(wire1), (wire0 < wire71)} ?
                          $unsigned(wire4[(5'h11):(4'hf)]) : $signed(wire69)) ?
                      (!(wire66[(1'h0):(1'h0)] <= (&(7'h40)))) : $unsigned(wire70[(4'hc):(4'h8)])) & {$unsigned((^wire70[(4'hc):(3'h4)])),
                      $signed($signed((wire0 + wire68)))});
  assign wire73 = $unsigned((((~&wire69[(4'he):(2'h2)]) ?
                      (wire66[(4'ha):(1'h0)] ?
                          wire1[(4'he):(3'h4)] : wire69) : $unsigned((~^wire71))) != wire2[(3'h5):(3'h4)]));
  assign wire74 = wire0;
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($unsigned($signed($unsigned((7'h43)))))))
        begin
          reg75 <= wire72[(1'h0):(1'h0)];
        end
      else
        begin
          reg75 <= wire2;
          reg76 <= (~$signed({wire74[(4'he):(1'h1)]}));
          reg77 <= (~^$signed(wire71[(3'h5):(3'h4)]));
          if ((wire4[(3'h7):(1'h1)] ?
              (wire0[(4'hc):(4'h9)] ?
                  $signed(wire72[(2'h2):(2'h2)]) : $signed((wire69 == wire1))) : wire0))
            begin
              reg78 <= wire1[(3'h6):(2'h3)];
              reg79 <= ((~|reg76) ?
                  wire66 : ((reg76[(3'h6):(1'h0)] || $unsigned($unsigned(wire72))) - ($signed($signed(reg77)) ^~ ((wire72 & wire3) >> wire70[(4'h9):(4'h8)]))));
            end
          else
            begin
              reg78 <= (&($unsigned(wire70) ?
                  $signed((-$signed(wire68))) : $signed((wire69[(4'h9):(4'h8)] ?
                      {wire73, wire73} : {wire0, reg77}))));
              reg79 <= wire1;
              reg80 <= $unsigned((&reg78));
              reg81 <= reg77;
            end
        end
      reg82 <= {{(($unsigned(wire74) ~^ (wire1 || wire4)) ?
                  (reg78[(3'h4):(1'h1)] >> $signed((8'hac))) : (((8'hb6) ?
                      (7'h41) : reg78) < $unsigned(wire73)))},
          $unsigned((8'hbc))};
      if (wire70)
        begin
          reg83 <= $unsigned((((|wire0[(1'h1):(1'h0)]) ?
              ({(8'hb6),
                  wire72} ^ reg80[(1'h0):(1'h0)]) : (((8'hb0) > wire0) && reg81)) + $signed((8'ha8))));
          reg84 <= ((&$unsigned(wire66)) || $unsigned(({(wire74 ?
                      wire68 : (8'hb5)),
                  (&reg75)} ?
              reg75[(2'h2):(2'h2)] : {((8'hb8) <= (8'hba))})));
        end
      else
        begin
          reg83 <= (({wire2[(4'ha):(3'h4)],
              wire73} && reg83[(3'h4):(2'h2)]) && ((^$signed((!reg80))) ?
              ($unsigned($signed(reg78)) != (~&(-wire1))) : $unsigned($unsigned(wire73[(3'h7):(2'h2)]))));
          reg84 <= (reg80 ? (7'h40) : {$unsigned(wire69)});
          reg85 <= $signed($signed($unsigned((!reg81))));
          reg86 <= ((|(^~((+reg84) - (~(8'ha5))))) + $unsigned(wire74));
          if ((~^($unsigned(($signed(reg82) ? ((8'had) > wire71) : (~&wire1))) ?
              $unsigned($signed($signed((7'h40)))) : {reg79[(1'h0):(1'h0)],
                  $unsigned($unsigned(reg80))})))
            begin
              reg87 <= {{(+reg83)}};
            end
          else
            begin
              reg87 <= ((~^reg78) ?
                  (wire1 ?
                      (!(-$unsigned(wire0))) : (((7'h40) ?
                              (reg75 ? reg78 : reg83) : $unsigned(reg77)) ?
                          (wire69[(4'he):(4'hc)] ?
                              (reg86 - (8'h9d)) : $signed(reg75)) : ((^~wire0) ^ (reg86 + wire72)))) : reg77[(3'h5):(3'h5)]);
              reg88 <= {reg76};
              reg89 <= $unsigned($signed(wire3));
            end
        end
      reg90 <= (wire66 - (~|($signed(wire68[(2'h3):(2'h3)]) & ($unsigned(wire73) ^~ (wire72 >> wire69)))));
      if ($unsigned($unsigned($unsigned(({reg78, reg86} - $signed(wire71))))))
        begin
          reg91 <= $signed((~&reg77));
        end
      else
        begin
          reg91 <= $signed($unsigned(wire68));
        end
    end
  assign wire92 = $unsigned(((reg81 >= (+wire69[(4'hc):(2'h3)])) ^~ ((~&$unsigned(wire74)) ?
                      $signed((wire0 ? reg82 : reg75)) : ($signed(wire66) ?
                          reg79 : $signed(wire68)))));
  assign wire93 = $unsigned($unsigned($unsigned($signed($unsigned(wire0)))));
  assign wire94 = wire3[(4'ha):(3'h7)];
  always
    @(posedge clk) begin
      reg95 <= ($unsigned($unsigned(({wire93, reg88} ?
              $unsigned(wire69) : $signed(reg85)))) ?
          reg80[(2'h2):(2'h2)] : reg85);
      if ((($unsigned($unsigned((reg76 ^ (8'haa)))) << ({reg76} - $signed($unsigned(reg90)))) ^~ ($signed($unsigned((wire0 && reg84))) + $signed({reg88[(1'h0):(1'h0)]}))))
        begin
          reg96 <= ($unsigned(($unsigned((!reg76)) || reg86[(4'ha):(3'h7)])) - ($signed({((8'hae) >> wire94),
              $unsigned(wire0)}) >>> ((~^reg88) ?
              {(reg88 == (8'h9d))} : (reg89 ? {reg87} : (+reg89)))));
          reg97 <= (-(((|(wire93 != reg85)) << wire2[(4'ha):(2'h3)]) >> (8'hb8)));
          reg98 <= (~&($signed({(|reg90), reg86}) ?
              $unsigned($signed($unsigned(reg83))) : reg76[(3'h5):(2'h3)]));
          if (($signed((^~(reg81[(4'hc):(4'ha)] >>> (8'hb9)))) * $signed((wire73[(5'h13):(4'ha)] ?
              reg95[(1'h1):(1'h1)] : reg95[(4'h8):(1'h0)]))))
            begin
              reg99 <= (((wire66 ?
                      reg77[(4'h9):(2'h2)] : wire66[(4'h9):(1'h0)]) ?
                  ($signed($unsigned(reg91)) ?
                      $signed($signed(reg95)) : wire94[(1'h0):(1'h0)]) : {(^~((8'hb2) ?
                          reg89 : reg96))}) <<< $signed($unsigned(reg79[(2'h2):(1'h1)])));
              reg100 <= ($signed((~{{wire0, wire1}, (~|reg87)})) ?
                  $signed($signed(((reg86 << wire66) ?
                      (reg81 == reg85) : reg83[(1'h0):(1'h0)]))) : ($signed((reg87[(5'h14):(5'h13)] ?
                      reg77[(4'hf):(4'ha)] : reg77)) <= $unsigned({reg99,
                      (~|wire2)})));
              reg101 <= (wire94 ?
                  (^~{{wire94[(3'h4):(3'h4)],
                          (reg96 ?
                              reg76 : reg95)}}) : $unsigned({wire3[(4'h9):(3'h5)],
                      wire1[(4'ha):(3'h4)]}));
              reg102 <= reg79;
            end
          else
            begin
              reg99 <= (&((8'h9f) ? $signed(reg83) : reg88));
            end
        end
      else
        begin
          reg96 <= wire3;
          reg97 <= {((~$signed($signed(reg82))) > (reg81[(2'h3):(2'h2)] - (~|(reg75 << wire66))))};
          reg98 <= reg75[(1'h1):(1'h0)];
          reg99 <= (((($signed(wire71) ?
                  $signed(reg101) : $unsigned(reg88)) * wire72[(4'hc):(2'h2)]) ?
              $unsigned(reg84[(5'h11):(5'h10)]) : $unsigned({$signed(reg82)})) - $signed(($signed((wire74 * wire0)) >= {{(8'hb9)},
              $signed(reg85)})));
        end
      reg103 <= (8'hbf);
      reg104 <= {$signed((((^~(8'ha8)) != (reg103 ?
              wire68 : wire92)) << (|(~reg102)))),
          $signed($unsigned({(reg80 || reg82), (wire73 ? reg102 : reg84)}))};
      reg105 <= wire74[(4'hc):(4'hc)];
    end
  assign wire106 = (reg105 - (~|$signed(reg86)));
  assign wire107 = {((~|reg88) ?
                           (~|reg96) : ({(~&wire106), wire71} ?
                               (!(8'h9d)) : (reg102 ? (&reg78) : wire73)))};
  assign wire108 = reg104;
  always
    @(posedge clk) begin
      reg109 <= $unsigned(($unsigned(reg76[(2'h3):(1'h1)]) ?
          {(((8'ha2) && wire0) * (~^(8'hb1))),
              (wire106 & {wire106})} : (wire70[(4'h8):(2'h2)] ?
              reg89[(4'h9):(2'h2)] : ((wire68 ?
                  reg89 : reg103) & wire94[(3'h4):(3'h4)]))));
      reg110 <= (8'hbc);
      reg111 <= $unsigned(($unsigned($unsigned((wire3 ?
          reg79 : (7'h40)))) + {{(|reg102)}}));
    end
endmodule

module module5
#(parameter param64 = {(^~{(((8'ha8) ? (8'haf) : (8'ha4)) ? {(8'ha3), (8'hab)} : {(8'hbc)})}), (&(8'ha6))}, 
parameter param65 = (param64 < {(~|param64), ((-param64) && ({param64} ? (8'hae) : (param64 >= param64)))}))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire6;
  input wire [(4'hd):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  wire [(3'h4):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire27;
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire53,
                 wire52,
                 wire51,
                 wire49,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire11,
                 wire12,
                 wire27,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg54,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire11 = (^$unsigned(wire7));
  assign wire12 = ((~^({wire7, {wire9}} ?
                      (wire9 ?
                          (wire6 >= wire6) : wire7[(4'hc):(4'h9)]) : (|(wire11 ?
                          wire9 : wire10)))) ~^ {wire10[(1'h0):(1'h0)]});
  module13 #() modinst28 (wire27, clk, wire11, wire8, wire12, wire9, wire6);
  always
    @(posedge clk) begin
      reg29 <= $unsigned($signed(wire12));
      reg30 <= $unsigned(wire9);
      reg31 <= (~^$unsigned(((~^$unsigned(wire7)) == (+(reg29 >= wire27)))));
    end
  assign wire32 = $signed($signed((-($signed(reg30) ?
                      wire27[(3'h6):(3'h5)] : (reg31 ? (8'had) : wire8)))));
  assign wire33 = {wire8[(4'ha):(2'h3)],
                      ((^~{(~|reg29), reg31[(2'h3):(2'h2)]}) ?
                          (wire6 ?
                              ($signed(reg29) ?
                                  reg30 : $signed(wire6)) : ($unsigned(reg29) ?
                                  wire27 : $signed(wire11))) : ((wire12[(4'h8):(3'h4)] ?
                              $signed(wire9) : wire32[(3'h5):(3'h4)]) ~^ wire27[(1'h1):(1'h1)]))};
  assign wire34 = $unsigned($unsigned(reg30));
  assign wire35 = (~|wire27[(4'ha):(2'h3)]);
  module36 #() modinst50 (.wire37(wire35), .wire40(wire32), .y(wire49), .wire38(wire27), .wire39(wire7), .clk(clk));
  assign wire51 = {(((wire7 >> $unsigned(wire8)) ?
                          $signed({wire6}) : (wire34 ?
                              wire27 : $signed((8'hb7)))) ~^ $signed(wire6)),
                      ((wire9[(4'hb):(3'h4)] >= ($unsigned(wire32) != wire10)) ?
                          (wire11[(1'h1):(1'h0)] ?
                              ((reg31 > reg31) >>> wire49) : $unsigned((wire34 | wire32))) : (~^{wire11[(3'h6):(1'h0)]}))};
  assign wire52 = wire33;
  assign wire53 = $unsigned(reg29[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg54 <= $unsigned($signed(wire12[(4'hb):(4'ha)]));
    end
  assign wire55 = $signed($signed(reg29[(1'h1):(1'h0)]));
  assign wire56 = $unsigned(((reg31[(1'h1):(1'h0)] ?
                      $signed($signed(wire32)) : $signed((-wire51))) <<< {$signed(reg29[(1'h1):(1'h0)]),
                      $unsigned(wire10)}));
  assign wire57 = wire33[(2'h2):(1'h0)];
  assign wire58 = $signed($signed(reg29[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg59 <= wire12;
      reg60 <= wire6[(4'ha):(4'h8)];
      if ((~^$unsigned($signed(((wire33 ? wire35 : reg60) ?
          $signed(wire10) : (^~(8'ha6)))))))
        begin
          reg61 <= $unsigned(($signed(((wire57 ?
              reg60 : wire55) ~^ $signed(wire51))) != $signed((~(wire56 ?
              reg60 : wire6)))));
        end
      else
        begin
          reg61 <= $unsigned(wire11);
          reg62 <= ((!wire27) ^~ wire32[(1'h0):(1'h0)]);
          reg63 <= $unsigned($unsigned((wire27 ?
              $signed((wire11 ? wire7 : reg29)) : wire33)));
        end
    end
endmodule

module module36
#(parameter param47 = ((8'hb3) <= ((~({(8'hb5)} && (~(8'hab)))) ? ((-((8'ha7) ? (8'ha3) : (8'ha4))) ? ((~^(8'ha9)) || (~(8'haa))) : {(!(8'hac)), ((8'h9d) ? (8'haf) : (8'ha7))}) : {(((8'ha8) ? (8'hbe) : (8'hb0)) | ((8'hb1) ^ (8'hb7)))})), 
parameter param48 = (~&(|param47)))
(y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire40;
  input wire signed [(4'ha):(1'h0)] wire39;
  input wire signed [(3'h7):(1'h0)] wire38;
  input wire signed [(4'he):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire41;
  assign y = {wire46, wire45, wire44, wire43, wire42, wire41, (1'h0)};
  assign wire41 = wire37;
  assign wire42 = (($unsigned((&wire37[(3'h6):(2'h3)])) ~^ $signed((^wire37))) << (^wire38[(1'h1):(1'h0)]));
  assign wire43 = (!(8'h9e));
  assign wire44 = (-($signed({(wire38 ? wire38 : wire38),
                      $signed(wire43)}) << $unsigned($signed(wire41))));
  assign wire45 = wire41[(1'h1):(1'h0)];
  assign wire46 = ($unsigned(wire39) < (8'had));
endmodule

module module13  (y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire18;
  input wire [(3'h4):(1'h0)] wire17;
  input wire signed [(4'h8):(1'h0)] wire16;
  input wire [(4'hc):(1'h0)] wire15;
  input wire signed [(4'hc):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire19;
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 (1'h0)};
  assign wire19 = wire15;
  assign wire20 = (!{wire19, wire14});
  assign wire21 = $signed(wire18);
  assign wire22 = ($signed((wire15[(4'h8):(1'h1)] | $signed(wire19))) ?
                      ($signed($signed(wire14[(4'h9):(2'h3)])) != ($unsigned($signed((8'hab))) || ((+wire20) || $signed(wire17)))) : wire15[(4'hc):(4'hc)]);
  assign wire23 = $unsigned((($unsigned(wire17) > $signed(wire22)) > wire16[(3'h6):(2'h2)]));
  assign wire24 = ($signed($signed((!(wire19 ?
                      wire18 : wire18)))) ^ $unsigned(($unsigned((wire16 ?
                          wire22 : wire16)) ?
                      (!(^wire15)) : wire18[(4'h8):(1'h1)])));
  assign wire25 = ($signed(($signed(wire15[(2'h3):(2'h2)]) >> ($signed(wire14) >>> ((8'ha2) ~^ wire16)))) <<< (wire17[(1'h1):(1'h0)] ?
                      {(8'ha3)} : wire18));
  assign wire26 = (^~(~|wire21[(2'h2):(1'h1)]));
endmodule
