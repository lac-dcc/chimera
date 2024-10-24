module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire115;
  wire signed [(2'h2):(1'h0)] wire114;
  wire signed [(4'hc):(1'h0)] wire113;
  wire [(2'h2):(1'h0)] wire112;
  wire [(3'h7):(1'h0)] wire110;
  assign y = {wire115, wire114, wire113, wire112, wire110, (1'h0)};
  module4 #() modinst111 (wire110, clk, wire0, wire1, wire2, wire3);
  assign wire112 = ($unsigned(wire3) ?
                       wire110 : {(~&($signed(wire3) > $unsigned(wire0)))});
  assign wire113 = $unsigned((~&wire2[(5'h10):(2'h3)]));
  assign wire114 = $signed((wire2[(5'h12):(2'h3)] ?
                       wire112[(2'h2):(2'h2)] : $signed(wire113[(4'h8):(1'h0)])));
  assign wire115 = wire112;
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h1a0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire signed [(4'hc):(1'h0)] wire6;
  input wire [(4'h9):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire97;
  wire signed [(3'h6):(1'h0)] wire96;
  wire [(4'h9):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire50;
  wire [(4'ha):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire55;
  wire signed [(3'h4):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire62;
  wire signed [(5'h13):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire67;
  wire signed [(3'h4):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire94;
  reg [(2'h2):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg107 = (1'h0);
  reg [(2'h3):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg105 = (1'h0);
  reg [(3'h4):(1'h0)] reg104 = (1'h0);
  reg [(2'h2):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(3'h6):(1'h0)] reg101 = (1'h0);
  reg [(5'h14):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg99 = (1'h0);
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire47,
                 wire9,
                 wire49,
                 wire50,
                 wire51,
                 wire55,
                 wire60,
                 wire61,
                 wire62,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire67,
                 wire68,
                 wire94,
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
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire9 = (8'hab);
  module10 #() modinst48 (wire47, clk, wire5, wire6, wire8, wire7, wire9);
  assign wire49 = $unsigned({$signed(({wire8} ? $signed(wire6) : (^~wire6)))});
  assign wire50 = $signed((^~((wire8[(2'h3):(2'h3)] ?
                          {wire47, wire7} : $unsigned(wire6)) ?
                      wire9 : wire9[(4'hc):(3'h5)])));
  assign wire51 = (wire6 ?
                      $signed($unsigned(wire6[(3'h7):(2'h3)])) : $signed(wire49[(3'h5):(3'h5)]));
  always
    @(posedge clk) begin
      reg52 <= $unsigned({((wire7 | wire8[(3'h6):(1'h1)]) ?
              {(wire47 && wire51),
                  wire49[(2'h3):(2'h2)]} : wire5[(3'h4):(3'h4)])});
      reg53 <= (^($unsigned($signed((wire6 ? wire7 : reg52))) ?
          ({(^~wire6)} <<< $signed(wire8)) : wire7));
      reg54 <= $unsigned(wire50);
    end
  assign wire55 = {(!(-wire9[(4'ha):(3'h4)])),
                      $unsigned(((~wire7[(3'h6):(1'h0)]) & reg54[(3'h4):(1'h0)]))};
  always
    @(posedge clk) begin
      reg56 <= ({($unsigned((~|wire9)) ?
              wire9 : $unsigned({(8'ha3)}))} ^ (wire51 >> ((-wire55) ?
          (wire49[(3'h4):(3'h4)] ^ (wire7 >>> wire7)) : $signed($signed(wire49)))));
      reg57 <= $signed(reg52);
      reg58 <= (($unsigned(wire6) ?
          (~|($unsigned(wire49) ?
              $unsigned(reg54) : (~&reg52))) : ($signed(((8'hb6) ?
                  (8'ha2) : wire50)) ?
              {$unsigned(wire47)} : $unsigned($unsigned((8'ha4))))) >= $signed($signed(($unsigned(wire50) ?
          $unsigned(wire50) : (reg57 * (8'hb8))))));
      reg59 <= (~&(|($unsigned(wire6) <<< ((~^wire47) ? reg53 : (|wire50)))));
    end
  assign wire60 = reg54;
  assign wire61 = {$unsigned((~|$unsigned($unsigned(wire9))))};
  assign wire62 = wire51[(4'h8):(3'h6)];
  assign wire63 = $signed(($signed(((!wire61) < (8'had))) ?
                      (!((reg58 ? wire47 : (8'hb9)) ?
                          (wire5 ? wire5 : wire61) : (wire50 ?
                              wire6 : reg52))) : {$signed($unsigned(reg53)),
                          {$signed(reg59)}}));
  assign wire64 = (reg57 ?
                      ((!({wire47} << wire8)) ?
                          $unsigned(($unsigned(reg57) == $unsigned(wire51))) : (&$unsigned({reg56,
                              wire8}))) : $signed((({(8'ha5),
                          wire47} ^ (~^wire7)) >= wire60[(3'h4):(2'h2)])));
  assign wire65 = (reg54[(3'h4):(1'h1)] * ($signed((^~wire55)) ?
                      {$unsigned((reg54 << reg53)),
                          wire7} : {$unsigned((+wire47)),
                          wire63[(1'h1):(1'h1)]}));
  assign wire66 = wire49[(2'h3):(1'h0)];
  assign wire67 = (reg59 ?
                      $signed($unsigned(((|(8'hba)) ?
                          (~&wire7) : $unsigned(wire47)))) : wire63[(4'h8):(2'h2)]);
  assign wire68 = ((!$unsigned($signed(wire64[(4'hd):(2'h3)]))) ^~ $unsigned($signed(((8'hb5) ^~ (~^wire55)))));
  module69 #() modinst95 (.wire71(wire67), .clk(clk), .wire70(wire7), .wire72(wire9), .wire73(wire47), .y(wire94), .wire74(wire66));
  assign wire96 = {wire61};
  assign wire97 = $unsigned({{($signed((8'h9f)) ?
                              wire62[(2'h2):(2'h2)] : $unsigned(wire60))}});
  always
    @(posedge clk) begin
      if ({reg53, (^wire97[(3'h5):(1'h0)])})
        begin
          reg98 <= (wire68 ?
              $signed(({$signed(wire47)} | wire67[(4'hd):(4'h8)])) : (((!wire8[(3'h5):(2'h2)]) >= wire6) ^ wire67[(3'h5):(2'h2)]));
        end
      else
        begin
          reg98 <= $unsigned(wire49[(3'h5):(2'h2)]);
          if ($signed(reg58))
            begin
              reg99 <= wire64[(4'hc):(4'h8)];
            end
          else
            begin
              reg99 <= (wire50 * ($unsigned(wire68) ?
                  (|((wire61 ?
                      wire94 : reg98) >>> $unsigned((8'h9f)))) : (((^~wire55) << {wire63}) ?
                      ((wire96 ?
                          wire51 : wire96) >= reg57[(4'hd):(2'h2)]) : (wire65[(4'h9):(2'h2)] ^~ wire96))));
              reg100 <= ($signed(wire65[(3'h5):(3'h5)]) & $signed((&$unsigned(wire55))));
              reg101 <= (~$unsigned((($unsigned((8'hb0)) ?
                      (wire7 >>> wire94) : (7'h43)) ?
                  ($signed(wire63) != reg57) : (wire63[(1'h0):(1'h0)] <<< $unsigned(wire60)))));
            end
        end
      if ({(($signed(reg58[(4'h9):(2'h2)]) ?
                  {(wire66 ^ reg56)} : $unsigned(wire66)) ?
              (reg59 ? wire6 : reg98[(1'h1):(1'h0)]) : wire65[(1'h0):(1'h0)])})
        begin
          reg102 <= (^~$unsigned($signed($unsigned($unsigned(wire6)))));
          if (wire94)
            begin
              reg103 <= $unsigned(((&$signed($signed(reg52))) == $signed((wire94[(4'h8):(2'h3)] != $signed(wire67)))));
              reg104 <= reg58[(3'h5):(3'h5)];
              reg105 <= $signed((reg100 ^ (+(-$unsigned((8'hba))))));
              reg106 <= {((wire66[(3'h5):(1'h1)] ?
                          wire94[(1'h0):(1'h0)] : $signed((~|(8'haa)))) ?
                      ((~$signed(wire62)) >>> ((reg99 != wire55) << (~(8'hbf)))) : (+(!$signed(wire6)))),
                  (~{((!reg54) ? (~|reg99) : wire94[(4'h8):(3'h4)]),
                      (reg100 ? reg99[(3'h5):(3'h4)] : (wire9 * (8'ha6)))})};
            end
          else
            begin
              reg103 <= $signed((8'hac));
            end
        end
      else
        begin
          reg102 <= $unsigned($signed($unsigned((8'hb7))));
          reg103 <= wire97[(4'hb):(4'h9)];
          reg104 <= $signed($unsigned((-reg106)));
          reg105 <= wire6[(3'h5):(3'h4)];
          reg106 <= reg53;
        end
      reg107 <= $signed(($signed((~(-(8'hbb)))) >> (~|($signed(wire62) || (&(8'hab))))));
      reg108 <= {(reg53 - $signed((+(+wire63)))),
          ($signed($signed($unsigned(wire94))) & ($signed(wire94[(3'h5):(1'h0)]) ~^ {((8'hac) << reg56)}))};
      reg109 <= reg101;
    end
endmodule

module module69
#(parameter param93 = (8'haf))
(y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire74;
  input wire [(4'h9):(1'h0)] wire73;
  input wire [(4'hb):(1'h0)] wire72;
  input wire [(5'h11):(1'h0)] wire71;
  input wire [(4'ha):(1'h0)] wire70;
  wire signed [(4'h9):(1'h0)] wire92;
  wire [(5'h14):(1'h0)] wire91;
  wire signed [(4'hc):(1'h0)] wire90;
  wire [(3'h6):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire75;
  reg [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg81 = (1'h0);
  reg [(4'hd):(1'h0)] reg80 = (1'h0);
  reg [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire77,
                 wire76,
                 wire75,
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
  assign wire75 = $unsigned($signed(wire72[(2'h2):(2'h2)]));
  assign wire76 = $signed($unsigned(wire71[(3'h7):(3'h5)]));
  assign wire77 = $unsigned((((wire74 ^ wire74) ?
                      (7'h42) : ($signed(wire73) || wire70[(1'h0):(1'h0)])) >> wire70[(3'h4):(2'h2)]));
  always
    @(posedge clk) begin
      if ($signed(($signed(wire76[(4'ha):(3'h4)]) != wire76)))
        begin
          reg78 <= $signed(($unsigned({wire70[(3'h6):(1'h1)], wire71}) ?
              $unsigned($signed((wire70 ? (8'hbe) : wire73))) : wire74));
          reg79 <= wire73[(2'h2):(2'h2)];
          reg80 <= $unsigned(reg79);
          reg81 <= wire70;
        end
      else
        begin
          if ((8'h9c))
            begin
              reg78 <= reg79[(3'h4):(1'h0)];
              reg79 <= ((^~($unsigned((wire74 ? wire77 : wire76)) ?
                  {$signed((8'ha8))} : ((8'haa) ?
                      $signed(wire72) : (8'hac)))) + (|{$signed($unsigned(wire77))}));
              reg80 <= $unsigned((((-wire70) + (^(wire73 ^ (8'hb6)))) ^ (wire73[(3'h6):(1'h0)] ?
                  $unsigned(reg80) : $signed(wire71[(3'h7):(3'h4)]))));
              reg81 <= {wire73[(2'h2):(1'h0)]};
            end
          else
            begin
              reg78 <= (8'haa);
              reg79 <= ((reg80 ?
                  (~$unsigned($unsigned(wire72))) : (wire74[(4'hd):(1'h1)] ?
                      (&$unsigned(wire71)) : reg80[(4'h8):(4'h8)])) <<< ($signed(wire73) & $signed((|$signed(wire72)))));
              reg80 <= $signed((wire76 ~^ $unsigned(($signed(wire76) == (reg79 ~^ (8'hba))))));
            end
          if ((8'hae))
            begin
              reg82 <= $signed(reg79);
              reg83 <= reg79[(5'h12):(3'h5)];
              reg84 <= reg81;
              reg85 <= (reg80 + (8'h9d));
              reg86 <= reg83[(4'h9):(4'h9)];
            end
          else
            begin
              reg82 <= reg78[(5'h12):(1'h0)];
            end
          reg87 <= wire73[(1'h1):(1'h0)];
        end
      reg88 <= ({reg81[(2'h2):(2'h2)]} ? wire77 : {reg78[(4'hc):(1'h0)]});
      reg89 <= $unsigned($unsigned(reg84));
    end
  assign wire90 = $signed((^~$unsigned(($unsigned((8'hba)) == wire77[(1'h0):(1'h0)]))));
  assign wire91 = {{$signed($signed($signed(reg89))),
                          $unsigned($signed((reg87 && reg79)))},
                      $unsigned($signed($unsigned((&reg81))))};
  assign wire92 = (7'h44);
endmodule

module module10
#(parameter param45 = (((((~|(8'ha0)) ? ((8'haf) * (8'hba)) : ((8'ha2) ? (8'hac) : (8'hbd))) | (|((8'hbc) ? (8'h9e) : (8'ha4)))) ? ((~|{(8'hb7), (8'ha1)}) >= (((8'hb6) ? (8'had) : (8'hbd)) ^~ ((8'ha4) >>> (8'hac)))) : (|(((8'h9c) ? (8'had) : (8'hbe)) ? ((8'ha6) ? (8'hbb) : (8'h9c)) : ((8'hb3) << (8'ha3))))) ? ((((-(8'h9f)) ? ((8'ha9) ? (8'ha3) : (8'hab)) : (+(8'had))) ? ({(8'hb6), (7'h44)} ? ((8'ha3) ? (8'h9f) : (8'hb1)) : ((8'ha8) ? (8'haa) : (8'ha0))) : (((8'hac) <<< (8'ha3)) < {(8'ha3)})) >> ((((7'h42) >= (8'h9d)) <<< (^~(8'ha6))) ? {(~&(8'haa)), (|(8'hb5))} : (((8'hb5) >>> (8'hb7)) & {(8'ha3)}))) : {{(~|((8'hb8) ? (8'haa) : (8'hb9)))}}), 
parameter param46 = ((~^(((param45 ? param45 : param45) >> ((8'hb1) ? param45 : param45)) ? param45 : (^~param45))) ? (8'hb9) : (param45 ? (param45 <= (param45 && (param45 & param45))) : (param45 ? param45 : (param45 ? (param45 ^~ param45) : (param45 ^ param45))))))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire15;
  input wire signed [(3'h7):(1'h0)] wire14;
  input wire [(5'h14):(1'h0)] wire13;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire [(4'hd):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire44;
  wire [(3'h7):(1'h0)] wire43;
  wire [(4'ha):(1'h0)] wire42;
  wire [(4'hd):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire16;
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire33,
                 wire32,
                 wire27,
                 wire26,
                 wire25,
                 wire23,
                 wire22,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg36,
                 reg35,
                 reg34,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg24,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire16 = $signed($signed(wire14[(3'h4):(3'h4)]));
  assign wire17 = (((-wire13[(1'h0):(1'h0)]) ?
                      (wire16 >> (wire13 ?
                          $unsigned(wire15) : (wire16 ^ (8'hbd)))) : $unsigned(wire15)) >> $unsigned(($unsigned(wire11[(3'h6):(1'h0)]) ^~ wire15)));
  assign wire18 = $unsigned({{$signed((^wire17))},
                      (($unsigned(wire14) ?
                              $signed(wire14) : wire14[(2'h3):(1'h1)]) ?
                          $unsigned((wire11 != wire17)) : $signed($unsigned(wire12)))});
  assign wire19 = wire12;
  always
    @(posedge clk) begin
      reg20 <= wire14[(2'h3):(2'h3)];
      reg21 <= (+$signed((-($unsigned(wire12) ?
          wire14[(3'h4):(3'h4)] : (+(7'h42))))));
    end
  assign wire22 = $unsigned(($unsigned((8'hb3)) ?
                      $unsigned(wire17) : ((wire11[(4'h9):(3'h6)] ~^ (~|wire16)) * {(reg21 ?
                              wire19 : wire15),
                          (~|wire15)})));
  assign wire23 = wire19[(4'h8):(3'h4)];
  always
    @(posedge clk) begin
      reg24 <= {$signed(wire13), {$signed($signed(wire13)), (~&wire22)}};
    end
  assign wire25 = wire17;
  assign wire26 = ($unsigned($signed({wire13})) == $signed({$signed({wire25,
                          (8'hac)}),
                      wire15}));
  assign wire27 = $unsigned(((8'ha9) ?
                      wire23[(2'h2):(2'h2)] : $unsigned($signed(reg24))));
  always
    @(posedge clk) begin
      reg28 <= (($signed(((wire15 ?
              wire16 : wire22) <<< $signed(wire15))) + $unsigned((wire12[(3'h5):(2'h2)] == wire22[(2'h3):(2'h3)]))) ?
          $signed(($unsigned((wire11 || wire26)) * ((reg20 ? (8'h9e) : wire26) ?
              ((8'hb4) ? wire27 : wire27) : {reg21, reg20}))) : wire14);
      if ($unsigned(({wire18} ~^ (|(|(^reg28))))))
        begin
          if ((wire19[(4'h8):(3'h6)] ?
              ($unsigned((wire22[(1'h1):(1'h0)] <<< (wire25 ?
                  wire14 : wire23))) * {$signed($unsigned(wire16))}) : wire12))
            begin
              reg29 <= ($signed((|$signed((wire18 ? (8'hab) : wire27)))) ?
                  (reg28[(4'ha):(3'h5)] ?
                      wire26[(1'h1):(1'h0)] : {($unsigned(wire26) > (wire19 ?
                              (8'hab) : (8'hab)))}) : wire13[(5'h11):(4'hd)]);
              reg30 <= ($signed((reg29[(4'ha):(2'h3)] ~^ $signed($signed((7'h41))))) | (reg28[(4'he):(1'h0)] <= (~^$unsigned((~^(8'hb7))))));
            end
          else
            begin
              reg29 <= (reg20 ?
                  reg24 : (wire16 ?
                      (reg30[(3'h5):(3'h5)] <= $signed(wire14)) : (~^wire14)));
              reg30 <= $unsigned((8'h9f));
            end
        end
      else
        begin
          reg29 <= {wire25[(4'hb):(4'hb)]};
          reg30 <= ({($signed(wire15[(3'h7):(1'h1)]) ?
                      (~&$signed(wire16)) : $signed((wire22 >>> reg21)))} ?
              ((wire15[(3'h4):(2'h2)] | {$signed(wire13)}) ?
                  {$unsigned(wire17)} : (((wire15 ?
                          wire11 : wire23) * (wire17 || reg28)) ?
                      (-$unsigned(wire25)) : {(!wire25)})) : $signed((&(^(wire14 * wire13)))));
          reg31 <= $unsigned((wire18[(2'h3):(2'h2)] != (~&$signed({wire19}))));
        end
    end
  assign wire32 = $signed((8'hbd));
  assign wire33 = ((wire16[(4'he):(4'hc)] ?
                      (({wire11, reg24} ?
                              reg20[(4'h9):(4'h9)] : (reg29 ^~ (8'hbb))) ?
                          wire11 : ((wire23 <= wire26) & $signed(reg30))) : (^wire22[(3'h5):(3'h5)])) != reg28[(4'ha):(4'h9)]);
  always
    @(posedge clk) begin
      reg34 <= (~&wire13[(2'h2):(1'h0)]);
      reg35 <= ((wire17[(1'h0):(1'h0)] | $unsigned(wire18[(1'h0):(1'h0)])) ?
          $signed(wire27[(4'h9):(3'h5)]) : {$signed(((reg31 << (8'hb9)) || (wire25 <= wire25))),
              $unsigned(($signed(wire23) ?
                  (reg29 >>> (8'haa)) : ((8'hb2) != wire27)))});
      reg36 <= $unsigned(reg34[(2'h2):(1'h1)]);
    end
  assign wire37 = wire11[(3'h5):(3'h4)];
  assign wire38 = $signed((&$signed(wire16[(4'hb):(2'h2)])));
  assign wire39 = wire16;
  assign wire40 = wire39[(1'h1):(1'h1)];
  assign wire41 = (~&(reg28 ^~ ($unsigned(((8'ha9) ~^ wire16)) - reg34)));
  assign wire42 = {({$signed((wire23 ? wire33 : wire27))} ?
                          reg35 : (wire40 - $unsigned((wire13 * wire13)))),
                      ({(wire19 ? $signed((7'h44)) : (wire33 ^~ (8'hb4))),
                          $unsigned($signed(wire32))} || $unsigned(((wire19 * reg28) | (~wire23))))};
  assign wire43 = ($signed((wire22[(2'h2):(1'h0)] >> (^~(wire18 ?
                      reg20 : wire14)))) || {reg30[(1'h1):(1'h1)]});
  assign wire44 = reg35;
endmodule
