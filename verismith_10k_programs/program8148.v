module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire128;
  wire signed [(4'hc):(1'h0)] wire127;
  wire [(4'hb):(1'h0)] wire125;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  assign y = {wire128, wire127, wire125, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned($signed(wire2[(2'h2):(1'h0)]));
  assign wire5 = $signed((($signed(((7'h43) & wire2)) ?
                         (wire2 << wire2) : $unsigned($unsigned(wire3))) ?
                     ($unsigned({(8'h9c)}) < (^(wire3 ?
                         wire2 : wire3))) : ({$unsigned(wire2)} ?
                         wire3[(1'h1):(1'h1)] : wire4)));
  assign wire6 = {$unsigned(wire5), $signed((&(8'had)))};
  assign wire7 = (wire0 - $unsigned(wire5[(2'h3):(2'h2)]));
  module8 #() modinst126 (.wire9(wire1), .wire10(wire4), .wire12(wire2), .wire11(wire3), .clk(clk), .y(wire125));
  assign wire127 = $unsigned(($signed((~$signed((8'ha8)))) ?
                       ($unsigned({wire4, (8'h9d)}) ^ ((wire3 & wire7) ?
                           wire1 : (wire0 ?
                               (8'h9e) : (8'ha3)))) : $unsigned({$signed(wire2)})));
  assign wire128 = (~^wire125[(1'h1):(1'h1)]);
endmodule

module module8
#(parameter param124 = ((!(~&(~|((8'hbf) && (8'hb7))))) || (((&((8'hb4) >>> (8'h9d))) & {((8'h9e) <= (8'haa))}) <= ({(+(8'hbd))} ? ((7'h41) == ((8'h9c) << (8'ha6))) : {(&(8'hbf))}))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h111):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire signed [(5'h13):(1'h0)] wire11;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire56;
  wire signed [(5'h10):(1'h0)] wire122;
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  assign y = {wire51,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire19,
                 wire18,
                 wire15,
                 wire14,
                 wire13,
                 wire53,
                 wire54,
                 wire55,
                 wire56,
                 wire122,
                 reg21,
                 reg20,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire13 = (8'hac);
  assign wire14 = ($unsigned({($signed(wire12) ?
                          wire13[(3'h5):(1'h0)] : wire9)}) + (~wire13));
  assign wire15 = wire11[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg16 <= ((~|$signed((-{wire10}))) ?
          (&$signed($unsigned(wire15))) : wire11);
      reg17 <= reg16[(2'h3):(2'h3)];
    end
  assign wire18 = reg16;
  assign wire19 = $unsigned((reg17 ?
                      (wire12[(4'h8):(3'h5)] ?
                          (wire14[(3'h4):(2'h3)] > ((8'ha8) < wire11)) : wire11) : wire10));
  always
    @(posedge clk) begin
      reg20 <= ((wire11 <<< $unsigned(wire12[(1'h1):(1'h0)])) ?
          reg16[(2'h2):(1'h1)] : $signed(reg17));
      reg21 <= $signed($signed(wire14));
    end
  assign wire22 = wire19[(1'h1):(1'h1)];
  assign wire23 = ((wire19[(3'h5):(2'h3)] | wire9[(4'he):(3'h7)]) ?
                      reg17[(3'h6):(3'h4)] : (wire15 ?
                          ($signed($signed(wire14)) ?
                              ((reg17 < wire14) << reg21[(3'h6):(2'h3)]) : wire19) : $unsigned(wire18)));
  assign wire24 = $signed($unsigned((((wire19 + wire9) ?
                      $unsigned(wire9) : {reg16}) < ($unsigned(wire23) ?
                      (~^wire23) : ((8'hb5) ? wire18 : wire12)))));
  assign wire25 = {$signed(wire12[(1'h1):(1'h0)])};
  module26 #() modinst52 (.y(wire51), .clk(clk), .wire29(wire11), .wire30(wire12), .wire31(reg21), .wire28(reg20), .wire27(wire14));
  assign wire53 = $signed((!$unsigned($signed($unsigned(reg20)))));
  assign wire54 = $signed(((~|((-reg20) ?
                          ((8'ha4) ?
                              (8'hb1) : wire12) : reg20[(1'h0):(1'h0)])) ?
                      $unsigned(({wire24} == (^~reg20))) : {$signed(wire23[(2'h2):(2'h2)])}));
  assign wire55 = $signed($unsigned(wire53));
  assign wire56 = (8'hb1);
  module57 #() modinst123 (.wire61(wire22), .wire62(wire9), .wire60(wire14), .clk(clk), .wire58(wire54), .wire59(wire12), .y(wire122));
endmodule

module module57
#(parameter param120 = {((({(8'hba)} >> ((8'hb3) ? (8'hba) : (8'hb3))) ? (~^((8'h9d) + (8'had))) : ({(8'ha6), (8'haa)} || ((8'hb0) >= (8'hac)))) ? {{((8'hb7) <= (8'hbc)), (^~(8'ha7))}, (((8'hab) ^ (8'had)) >= {(8'ha5), (8'haa)})} : (((|(8'haf)) ^ ((8'hb6) ? (8'hac) : (8'hbd))) ? (((8'haf) ? (8'h9e) : (7'h43)) - ((7'h42) >>> (8'hae))) : {((8'had) ? (8'hbe) : (8'h9d))}))}, 
parameter param121 = param120)
(y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'h2c5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire62;
  input wire signed [(4'hb):(1'h0)] wire61;
  input wire [(2'h2):(1'h0)] wire60;
  input wire signed [(4'he):(1'h0)] wire59;
  input wire [(4'he):(1'h0)] wire58;
  wire [(3'h4):(1'h0)] wire119;
  wire [(5'h12):(1'h0)] wire118;
  wire [(3'h7):(1'h0)] wire114;
  wire [(4'ha):(1'h0)] wire110;
  wire [(5'h13):(1'h0)] wire109;
  wire [(4'hf):(1'h0)] wire108;
  wire signed [(5'h10):(1'h0)] wire107;
  wire signed [(5'h11):(1'h0)] wire89;
  wire signed [(5'h15):(1'h0)] wire72;
  wire signed [(4'ha):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire69;
  wire [(2'h3):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire63;
  reg signed [(4'h9):(1'h0)] reg117 = (1'h0);
  reg [(3'h5):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(5'h11):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(4'he):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg98 = (1'h0);
  reg [(4'he):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg signed [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg93 = (1'h0);
  reg [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg91 = (1'h0);
  reg [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg88 = (1'h0);
  reg [(4'h9):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(4'hd):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(4'h9):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg65 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire114,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire89,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire64,
                 wire63,
                 reg117,
                 reg116,
                 reg115,
                 reg113,
                 reg112,
                 reg111,
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
                 reg93,
                 reg92,
                 reg91,
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
                 reg74,
                 reg73,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire63 = {$unsigned(($unsigned((8'hbe)) <<< $signed(((8'hb3) - wire58)))),
                      (-wire60)};
  assign wire64 = wire58;
  always
    @(posedge clk) begin
      reg65 <= (|wire61);
      reg66 <= $unsigned($unsigned(wire61[(4'h9):(3'h6)]));
    end
  always
    @(posedge clk) begin
      reg67 <= ({((wire61[(4'h9):(4'h8)] >= (wire60 > wire64)) && $unsigned(wire60[(1'h1):(1'h1)]))} ?
          {reg65[(4'h8):(1'h1)]} : (wire63 ? wire63 : wire60));
      reg68 <= $unsigned(wire58[(4'h9):(3'h6)]);
    end
  assign wire69 = (|reg66);
  assign wire70 = {(~^wire60)};
  assign wire71 = wire60;
  assign wire72 = (~((wire69[(4'hc):(4'h9)] ~^ (wire61[(1'h1):(1'h0)] ?
                      wire61[(1'h1):(1'h0)] : (reg66 ?
                          reg68 : wire64))) != ((^(reg67 + reg67)) | ((reg67 ?
                      (8'haf) : wire62) || wire59[(4'hc):(4'hb)]))));
  always
    @(posedge clk) begin
      reg73 <= (wire59 ?
          (wire71 ?
              ({wire62, (wire71 != reg65)} ?
                  $unsigned($unsigned(wire62)) : ((wire61 && reg65) >= $signed(reg66))) : wire63) : {(reg65[(4'hc):(2'h3)] ?
                  $signed((8'hbe)) : $unsigned(wire61[(4'h9):(3'h6)]))});
      if (wire71)
        begin
          reg74 <= (($unsigned(($signed(wire60) ?
                  wire63 : $unsigned(wire59))) >> (wire63 ?
                  $unsigned(((8'haf) < wire70)) : ($signed(reg73) ^~ (-wire61)))) ?
              (($unsigned((!wire61)) ?
                      $unsigned($signed(reg65)) : $unsigned(wire70)) ?
                  wire70[(5'h12):(1'h0)] : (^$signed((wire63 ?
                      reg73 : reg65)))) : $unsigned(($signed((wire60 ?
                      (8'hb1) : reg67)) ?
                  ({wire72} ~^ $unsigned(wire58)) : wire72[(3'h5):(3'h5)])));
          reg75 <= wire70;
          if ((~(^~reg75)))
            begin
              reg76 <= (((~|$unsigned((~|(8'hb6)))) >> $signed((8'had))) <<< $unsigned((-(8'ha6))));
              reg77 <= wire59;
              reg78 <= (((wire59[(3'h5):(2'h3)] & {(reg73 != (8'hbd)),
                          {reg75, (8'hbf)}}) ?
                      $signed(wire72) : wire58) ?
                  ((wire63 ?
                      $unsigned((wire58 < wire58)) : (!$unsigned(reg65))) > reg74) : (+(({reg75,
                              (8'hb3)} ?
                          (|wire61) : wire69) ?
                      {wire61[(4'h8):(2'h2)],
                          $signed(reg68)} : $signed((+reg76)))));
              reg79 <= wire71[(2'h2):(2'h2)];
            end
          else
            begin
              reg76 <= $signed((wire69 ? reg65 : wire62));
            end
          reg80 <= (wire69[(1'h0):(1'h0)] <<< (^~($unsigned((reg77 ?
              reg74 : wire63)) || ((wire69 || wire72) * wire69))));
        end
      else
        begin
          reg74 <= $signed(reg78[(1'h1):(1'h1)]);
          reg75 <= ((($signed((|reg73)) & (8'hb4)) ?
                  $unsigned(wire58[(3'h7):(2'h2)]) : reg76) ?
              {$signed((wire70[(1'h0):(1'h0)] ?
                      (wire71 < wire62) : (~|wire58)))} : reg75);
          reg76 <= (reg65[(4'he):(3'h6)] != $unsigned((~&((reg75 ?
                  reg78 : wire61) ?
              (7'h42) : reg75))));
          reg77 <= {($unsigned($unsigned($unsigned(reg65))) || $unsigned(wire60[(2'h2):(2'h2)]))};
          reg78 <= $unsigned(wire71);
        end
      if (((^~wire70) ? wire59 : wire61))
        begin
          if ($signed(reg75[(4'he):(1'h0)]))
            begin
              reg81 <= (!wire59[(2'h3):(1'h1)]);
              reg82 <= reg76[(2'h2):(1'h0)];
              reg83 <= $signed(reg67);
              reg84 <= wire63[(1'h1):(1'h1)];
              reg85 <= $unsigned({($signed(reg83[(4'ha):(1'h1)]) | (!$unsigned((8'hb6))))});
            end
          else
            begin
              reg81 <= wire69;
              reg82 <= {{reg77}};
              reg83 <= (7'h41);
            end
          reg86 <= wire59;
        end
      else
        begin
          reg81 <= $unsigned(reg86);
          reg82 <= $signed(((~^wire69) < wire58[(4'ha):(3'h4)]));
        end
      reg87 <= $signed((-reg75));
      reg88 <= wire70[(5'h14):(5'h11)];
    end
  assign wire89 = ($signed((|(reg86[(3'h7):(3'h7)] ?
                          $signed(wire62) : $signed(reg68)))) ?
                      $unsigned(reg66[(1'h1):(1'h1)]) : $unsigned((~^(~&$unsigned(reg66)))));
  always
    @(posedge clk) begin
      if (({(wire59 >>> (wire60 * ((7'h42) ? reg84 : wire71))),
          $signed($signed(wire62))} & ((($signed(reg65) ?
                  $unsigned(wire70) : wire70[(4'h8):(3'h5)]) ?
              ($signed(reg65) ?
                  {wire61, reg81} : (reg83 ?
                      wire59 : wire71)) : $signed(((8'hbd) ?
                  wire59 : (8'hbe)))) ?
          wire62[(3'h5):(3'h4)] : wire60[(1'h0):(1'h0)])))
        begin
          reg90 <= wire60;
          reg91 <= $signed((~&((+{reg86}) != wire71)));
          reg92 <= (reg90 > ({reg66,
              (((8'ha7) ^ reg81) - (reg75 * reg77))} ~^ ((8'hb8) < $signed(wire64[(2'h2):(1'h1)]))));
        end
      else
        begin
          if ((^wire70))
            begin
              reg90 <= (+$unsigned(reg74[(3'h5):(1'h1)]));
              reg91 <= (wire89 ?
                  (reg85 ?
                      (8'hb1) : {$signed(((8'hb1) >> wire69)),
                          $unsigned(reg87[(3'h6):(1'h1)])}) : reg74[(5'h14):(1'h1)]);
              reg92 <= {$signed({$signed((wire69 ? reg82 : reg73)),
                      $signed(((8'hb1) + wire72))}),
                  reg91};
              reg93 <= {wire70[(1'h0):(1'h0)], wire70};
            end
          else
            begin
              reg90 <= ($signed(reg83) ?
                  (((((8'ha8) ? wire69 : reg77) ?
                          reg74 : (&(8'hb6))) >> $unsigned($signed((8'hbc)))) ?
                      ({(wire71 && reg65)} == ((8'hb4) < wire70)) : ((^~reg76) ~^ (reg73[(4'he):(3'h5)] ?
                          $signed(reg76) : $signed((8'hb0))))) : wire64);
              reg91 <= reg79[(3'h7):(1'h0)];
            end
          reg94 <= $unsigned($unsigned({{(reg80 ? wire61 : reg82)},
              {wire89[(4'h9):(1'h1)]}}));
          if ((!(-reg79[(3'h6):(3'h4)])))
            begin
              reg95 <= $signed(($signed(((reg79 ?
                  (7'h44) : (8'hb6)) < (reg66 & reg67))) ^~ reg78[(4'h8):(3'h5)]));
              reg96 <= $signed((~&$unsigned(reg88)));
            end
          else
            begin
              reg95 <= ($signed($signed($unsigned((reg76 ? reg66 : wire70)))) ?
                  reg84[(2'h3):(2'h3)] : (|(+{(^~reg78), (reg74 && wire62)})));
              reg96 <= reg85;
              reg97 <= $signed(reg86[(4'ha):(2'h3)]);
              reg98 <= $signed((reg81[(4'ha):(1'h1)] >>> reg86));
            end
          reg99 <= reg66;
          if ((($unsigned(((reg94 != reg84) ?
              reg84[(3'h5):(2'h3)] : $unsigned(reg79))) >= (&reg88[(2'h2):(1'h0)])) ^ {$unsigned(reg80[(1'h1):(1'h1)]),
              ((reg93[(3'h4):(2'h3)] << (~|reg81)) && reg81)}))
            begin
              reg100 <= (&$signed($signed((8'hb2))));
              reg101 <= $unsigned($signed($unsigned(wire58)));
              reg102 <= {(wire59 ~^ reg80[(4'hf):(4'he)])};
              reg103 <= {(-$signed(({reg80} && reg75))),
                  ({$unsigned(((8'ha0) >>> reg96))} ?
                      $signed((reg91 ?
                          $signed((7'h40)) : $unsigned(reg87))) : reg81)};
              reg104 <= ($signed($unsigned($unsigned((~|reg102)))) ?
                  wire72 : (&$signed(((reg101 ?
                      reg81 : reg77) > reg99[(3'h6):(2'h3)]))));
            end
          else
            begin
              reg100 <= ($unsigned(reg104) ?
                  reg73[(3'h5):(2'h3)] : {reg87, reg67[(5'h10):(1'h0)]});
              reg101 <= (^$signed(reg102[(4'h8):(2'h3)]));
              reg102 <= reg75[(4'h8):(4'h8)];
              reg103 <= $unsigned(($unsigned(((+(8'h9c)) ^~ reg102)) <<< {(8'h9d)}));
            end
        end
      reg105 <= $unsigned(wire62);
      reg106 <= {reg93[(1'h1):(1'h0)], $signed(reg90[(3'h7):(1'h0)])};
    end
  assign wire107 = ((|$signed($signed($signed(reg98)))) ?
                       (~^(+wire71[(4'ha):(2'h2)])) : (+(!(8'ha7))));
  assign wire108 = reg78[(3'h4):(2'h3)];
  assign wire109 = $unsigned(((reg79[(3'h6):(3'h6)] || (&$signed(reg82))) ~^ ((reg81[(1'h0):(1'h0)] ?
                       $unsigned(reg97) : {reg65}) >> {$unsigned(reg68),
                       $signed(reg77)})));
  assign wire110 = (reg96 == $unsigned($unsigned((reg82[(3'h5):(1'h1)] ?
                       $unsigned(reg84) : reg99))));
  always
    @(posedge clk) begin
      reg111 <= ($signed(wire89[(4'hb):(4'hb)]) & $unsigned((($unsigned(reg82) ^ (wire69 ~^ reg95)) - (+(reg75 ?
          (8'haa) : reg78)))));
      reg112 <= (~&($signed(($unsigned((8'ha6)) * ((8'hbf) ?
          wire64 : (8'ha3)))) != reg66[(3'h7):(2'h3)]));
      reg113 <= $signed((((8'h9c) ?
          wire61 : (((8'hbc) ? (8'hb7) : reg82) ?
              (reg78 != (8'hae)) : reg96)) ~^ ($unsigned((8'hbb)) && ($unsigned(reg78) - reg65))));
    end
  assign wire114 = {(reg78 >> ((~&$unsigned(reg111)) ?
                           (7'h40) : $signed(((8'ha3) && reg98))))};
  always
    @(posedge clk) begin
      reg115 <= (-(($signed((|reg98)) <<< ((reg106 | (8'h9f)) ?
          (reg100 ? reg83 : (8'ha8)) : wire63)) && ((~^$unsigned((8'hac))) ?
          $unsigned({reg78, reg88}) : (wire63 ?
              (reg102 ? reg98 : wire110) : ((8'h9f) ? reg100 : wire70)))));
      reg116 <= ((^~{$unsigned(reg112[(4'hf):(4'h9)])}) >> (((~|(~wire72)) ?
              $signed((reg78 ? reg96 : wire114)) : (-(reg74 ?
                  (8'hb4) : wire108))) ?
          (wire72[(5'h12):(4'h8)] > (~^(8'hbe))) : (!(wire59[(4'h8):(3'h6)] ?
              (^wire61) : (7'h44)))));
      reg117 <= $signed($unsigned(reg106));
    end
  assign wire118 = (&{(~$unsigned((wire109 + wire108)))});
  assign wire119 = (($signed(((reg78 <= reg98) >>> ((7'h40) ?
                           wire72 : (8'h9e)))) ?
                       $signed({(wire62 ?
                               reg116 : reg68)}) : reg80[(3'h7):(1'h1)]) ^~ $unsigned((|$unsigned($signed((8'hb0))))));
endmodule

module module26  (y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire31;
  input wire [(4'ha):(1'h0)] wire30;
  input wire signed [(5'h12):(1'h0)] wire29;
  input wire [(5'h11):(1'h0)] wire28;
  input wire [(5'h13):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire32;
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire32 = ($signed((wire29[(2'h2):(2'h2)] ?
                      wire30[(4'h9):(1'h1)] : wire29[(4'hb):(4'h8)])) != wire27);
  assign wire33 = wire28;
  assign wire34 = $signed(wire32);
  assign wire35 = (~|$signed($unsigned($unsigned((wire29 == (7'h41))))));
  always
    @(posedge clk) begin
      reg36 <= wire33[(1'h0):(1'h0)];
      if (((wire30[(1'h0):(1'h0)] ?
          $unsigned((~|$unsigned(wire30))) : $unsigned(($signed(wire32) ?
              $unsigned(wire35) : (+wire35)))) <<< (~^((wire30[(4'h9):(2'h3)] ?
          $unsigned(wire34) : (wire34 ? (8'h9f) : wire29)) && reg36))))
        begin
          reg37 <= wire30[(2'h2):(2'h2)];
        end
      else
        begin
          if ((reg37[(3'h4):(3'h4)] <<< (-{(reg37[(3'h4):(1'h0)] | (!wire33))})))
            begin
              reg37 <= wire35;
              reg38 <= (~reg36[(3'h5):(2'h2)]);
            end
          else
            begin
              reg37 <= ($unsigned(wire33[(2'h2):(1'h0)]) ^ (wire32[(4'h8):(1'h1)] ?
                  $signed((wire27 ?
                      $signed(wire31) : ((8'h9f) * wire30))) : wire30));
              reg38 <= {(8'hb3)};
            end
          reg39 <= reg37[(2'h2):(1'h1)];
          reg40 <= {{((8'hbc) & (wire27[(5'h13):(5'h10)] ?
                      {reg38} : (wire27 ? wire34 : wire28)))},
              reg37[(3'h5):(3'h5)]};
        end
    end
  always
    @(posedge clk) begin
      reg41 <= {wire33[(2'h2):(1'h1)],
          ($signed($unsigned((^~reg38))) >= (wire29[(3'h6):(3'h5)] ?
              {(wire29 * wire30)} : wire28[(5'h10):(3'h6)]))};
    end
  always
    @(posedge clk) begin
      reg42 <= (($unsigned(((wire30 == wire29) ?
              $signed(reg37) : reg38)) <= $signed(($unsigned(reg39) & {reg36}))) ?
          (($signed($unsigned(wire33)) | $signed($signed(wire33))) & wire27[(1'h1):(1'h1)]) : wire32[(4'ha):(3'h7)]);
      reg43 <= (($signed(wire32) ?
          $signed($unsigned($signed(reg36))) : $signed($unsigned((reg42 ?
              reg39 : reg37)))) || (wire33 ?
          (reg42 | ((+(8'hb6)) ? reg39 : wire32)) : {((reg37 ?
                  wire31 : reg36) <= $unsigned(reg39)),
              $unsigned((wire31 + reg42))}));
      if ({$signed({$unsigned((-reg38))})})
        begin
          reg44 <= $signed(((|(+(reg37 >= wire32))) >> (&$unsigned((wire29 ^ wire31)))));
          reg45 <= ((reg43 | $signed($signed((reg36 & wire27)))) ?
              {reg39, reg44} : $signed({(&$signed((8'hb2))),
                  (-(wire29 ^ reg40))}));
        end
      else
        begin
          reg44 <= (((reg39[(3'h4):(1'h0)] < $unsigned(reg36[(4'hd):(4'hd)])) ?
              wire29 : (wire27 ?
                  {reg43[(2'h3):(1'h1)], (-wire34)} : $unsigned({(8'h9d),
                      (8'h9f)}))) >> {$unsigned(reg39)});
          reg45 <= ((~|($unsigned(reg37) ?
                  $unsigned($unsigned(reg41)) : $unsigned((wire35 ?
                      wire28 : reg44)))) ?
              reg44[(1'h1):(1'h1)] : (|(~|(~^(~&reg39)))));
        end
    end
  assign wire46 = wire30[(3'h4):(2'h3)];
  assign wire47 = ($signed((~((wire30 ^~ (8'hb0)) ?
                          reg41[(1'h1):(1'h0)] : (wire33 >>> wire27)))) ?
                      $unsigned(reg44[(1'h0):(1'h0)]) : reg38[(3'h7):(3'h6)]);
  assign wire48 = reg36;
  assign wire49 = (~&(((wire34 ?
                      reg43[(3'h6):(1'h1)] : (-reg38)) * reg39) << $unsigned(reg40)));
  assign wire50 = $signed(wire30);
endmodule
