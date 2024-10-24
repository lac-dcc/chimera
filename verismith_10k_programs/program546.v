module top
#(parameter param121 = {{{(((8'hb2) ? (7'h41) : (8'hb0)) ? ((8'hbd) ? (8'ha2) : (8'ha6)) : ((8'hbb) << (8'ha4)))}}, (~((((8'hbf) ? (8'hb0) : (8'ha4)) << (~^(8'ha2))) <<< ((~(8'hb3)) << ((8'hb7) ? (8'hb7) : (8'h9c)))))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  wire signed [(4'hf):(1'h0)] wire120;
  wire [(3'h4):(1'h0)] wire119;
  wire signed [(4'he):(1'h0)] wire97;
  wire [(3'h5):(1'h0)] wire95;
  wire [(5'h15):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire93;
  reg [(3'h6):(1'h0)] reg118 = (1'h0);
  reg signed [(4'he):(1'h0)] reg117 = (1'h0);
  reg signed [(4'he):(1'h0)] reg116 = (1'h0);
  reg [(5'h15):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(3'h7):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(5'h10):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg106 = (1'h0);
  reg [(4'hb):(1'h0)] reg105 = (1'h0);
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg [(2'h2):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(4'hf):(1'h0)] reg98 = (1'h0);
  reg [(3'h6):(1'h0)] reg96 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire97,
                 wire95,
                 wire4,
                 wire93,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
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
                 reg96,
                 (1'h0)};
  assign wire4 = wire3[(4'ha):(3'h5)];
  module5 #() modinst94 (.wire10(wire0), .wire9(wire3), .wire6(wire2), .clk(clk), .wire7(wire4), .wire8(wire1), .y(wire93));
  assign wire95 = $unsigned((-{(+$unsigned((8'h9e)))}));
  always
    @(posedge clk) begin
      reg96 <= wire3;
    end
  assign wire97 = $signed((reg96 || {$unsigned(wire93), wire2}));
  always
    @(posedge clk) begin
      if ((|({wire2[(1'h0):(1'h0)]} ^ (wire93 <= wire4[(5'h13):(5'h13)]))))
        begin
          if ($unsigned(wire93[(4'hd):(3'h4)]))
            begin
              reg98 <= (~|($signed(wire1) | (^~wire0[(1'h1):(1'h0)])));
              reg99 <= wire2[(4'hc):(4'h8)];
              reg100 <= $unsigned({(^~{(wire93 >= wire1), $signed(wire3)}),
                  wire2});
              reg101 <= $signed(($unsigned(reg98[(1'h0):(1'h0)]) ?
                  wire3[(1'h1):(1'h1)] : (7'h43)));
              reg102 <= $signed((~reg99));
            end
          else
            begin
              reg98 <= reg101[(1'h1):(1'h1)];
              reg99 <= (~^reg100[(4'hb):(4'hb)]);
              reg100 <= wire4;
              reg101 <= ($signed((~^$unsigned(wire95))) & wire97[(2'h2):(1'h0)]);
              reg102 <= $signed($signed($signed((reg99[(4'ha):(3'h6)] ?
                  wire0 : $signed(reg96)))));
            end
          reg103 <= {({$unsigned($signed(wire3))} ?
                  {$signed(wire4),
                      $signed(((8'hb9) ?
                          wire1 : (8'had)))} : $unsigned(((~^wire95) ?
                      ((8'hae) ? wire2 : wire93) : $signed(wire3)))),
              $signed($signed((-(^(8'had)))))};
          if (($signed(reg101[(2'h2):(2'h2)]) ?
              ($unsigned(reg102[(4'h9):(3'h6)]) | {wire2,
                  $unsigned($signed(wire97))}) : $unsigned($unsigned($signed(reg102[(4'hb):(3'h4)])))))
            begin
              reg104 <= $signed(($unsigned($signed((8'had))) && {(wire0 ?
                      $signed(wire3) : (wire93 ? wire0 : wire97))}));
              reg105 <= $signed(wire93[(3'h5):(3'h4)]);
              reg106 <= ((|$signed($signed($unsigned((8'ha5))))) == $unsigned((-$signed($signed(wire97)))));
              reg107 <= wire93;
              reg108 <= reg104;
            end
          else
            begin
              reg104 <= $signed({($signed((~^wire95)) ?
                      $signed($signed(wire95)) : ((wire4 || wire1) ^ $signed(wire1)))});
            end
          reg109 <= wire0[(4'h8):(1'h1)];
          reg110 <= (8'hbb);
        end
      else
        begin
          if (((8'ha6) ?
              wire2[(4'hc):(2'h3)] : $signed(((^~wire93[(3'h5):(1'h1)]) ?
                  (8'hbf) : (+$unsigned(reg110))))))
            begin
              reg98 <= reg109[(3'h7):(1'h1)];
              reg99 <= ((~$signed(reg102[(2'h2):(1'h0)])) || $signed(wire97));
              reg100 <= (reg106[(4'hb):(3'h5)] * $signed($signed(reg99)));
              reg101 <= (((8'ha9) ~^ $unsigned(((-reg107) ?
                  (wire93 ?
                      reg105 : wire0) : reg108))) <= (wire4[(4'ha):(2'h3)] ?
                  $unsigned(($signed((8'haa)) ?
                      (reg101 ~^ reg102) : $unsigned(reg108))) : (|(~^$signed(reg103)))));
            end
          else
            begin
              reg98 <= $signed(($unsigned($signed($unsigned((8'hbb)))) ?
                  (({reg102,
                      reg110} >> (reg107 <<< wire97)) >> reg110[(4'ha):(3'h5)]) : (|(!((8'hae) >= (8'hb2))))));
              reg99 <= (|wire3);
              reg100 <= $signed(($unsigned(wire1) ~^ {$signed(reg105)}));
            end
          if (($unsigned($unsigned(($signed((8'hb0)) ?
              $unsigned(wire93) : (wire1 ? reg100 : (8'h9d))))) >= wire2))
            begin
              reg102 <= reg100;
              reg103 <= (reg104 ?
                  (8'hac) : $unsigned({($unsigned(reg96) == (^~wire0)),
                      ((^~reg105) >> (^reg100))}));
              reg104 <= wire0;
              reg105 <= (~^(!(($unsigned(wire95) || (~wire2)) ~^ ((wire4 ?
                  reg102 : reg103) + $signed(reg104)))));
              reg106 <= ((reg100[(4'h8):(3'h6)] ?
                  ((wire95 ? (~wire93) : ((8'ha1) >> reg106)) ?
                      $unsigned($signed((8'ha0))) : reg110) : reg100) <= ($signed(reg105[(2'h2):(1'h1)]) >> $signed($signed($unsigned(wire2)))));
            end
          else
            begin
              reg102 <= ((($signed({reg96, reg98}) >> reg100) != (~(wire3 ?
                  reg99[(1'h1):(1'h0)] : (-reg96)))) ^ (wire3 & (($unsigned(reg109) ?
                      reg106 : $unsigned(reg104)) ?
                  (^~reg102[(3'h4):(1'h1)]) : ((8'h9e) == (reg98 ?
                      wire97 : reg107)))));
              reg103 <= $signed((~&wire93));
            end
        end
      if (reg103)
        begin
          reg111 <= (reg99[(5'h12):(3'h4)] ?
              ((wire3[(1'h0):(1'h0)] + reg98) <<< $signed((|(reg98 == wire97)))) : reg99[(5'h10):(4'h9)]);
          reg112 <= $unsigned((8'hb5));
          reg113 <= wire4;
          if (reg105[(4'hb):(2'h2)])
            begin
              reg114 <= $unsigned($unsigned((-{{reg102}})));
              reg115 <= reg106[(1'h1):(1'h1)];
              reg116 <= reg109[(1'h1):(1'h1)];
              reg117 <= (reg106[(2'h3):(1'h0)] ?
                  ({(8'haf), wire95[(2'h3):(2'h3)]} ?
                      $signed($unsigned((reg100 | reg113))) : $unsigned(reg111)) : {(~&(reg103[(3'h4):(1'h1)] && (reg104 - wire95))),
                      (reg106 ? reg105 : $signed((wire95 <= wire2)))});
            end
          else
            begin
              reg114 <= reg112[(2'h2):(1'h1)];
              reg115 <= (reg102 ?
                  reg116[(3'h6):(2'h3)] : ((~$signed($unsigned(wire2))) == ($signed((~wire93)) ?
                      reg101 : (!{reg109, reg103}))));
            end
          reg118 <= $signed(($signed(($unsigned(reg100) >= {reg109})) ?
              ($unsigned((wire2 ? wire0 : reg109)) ?
                  reg106[(2'h2):(2'h2)] : $unsigned($signed(reg96))) : (~^reg108[(4'ha):(4'h9)])));
        end
      else
        begin
          reg111 <= ($unsigned(wire95) ~^ ($signed(({reg110} ^~ (+(8'ha0)))) >> $signed({reg112,
              $unsigned(reg114)})));
          reg112 <= (~|reg107);
          reg113 <= (({$signed({reg106, reg101}),
                  reg101[(1'h1):(1'h1)]} > reg107[(3'h4):(1'h1)]) ?
              reg107[(1'h1):(1'h1)] : (+((~wire4) <= wire93)));
          if ({(8'hb2)})
            begin
              reg114 <= wire97;
              reg115 <= $signed(wire2);
              reg116 <= (reg104 ?
                  ($unsigned(((~^reg117) ?
                      {(8'ha8), reg103} : (reg101 ?
                          wire95 : reg109))) != {(+$unsigned(reg96))}) : (+(-reg107)));
              reg117 <= (&(($signed($signed(reg115)) ?
                  $unsigned(reg105) : reg101) ^ $signed($signed((^reg109)))));
            end
          else
            begin
              reg114 <= (~&$signed(((~&(reg98 ^ wire3)) | $signed(reg100))));
              reg115 <= (({wire4[(3'h7):(3'h7)]} ?
                  reg116[(3'h7):(3'h4)] : ($signed((8'h9d)) <= (8'hb0))) >= reg111);
            end
          reg118 <= $unsigned(({{$signed(reg115), $signed((8'hab))}} ?
              $signed((~|$unsigned(reg99))) : reg110));
        end
    end
  assign wire119 = reg117;
  assign wire120 = reg113[(2'h2):(2'h2)];
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h1c5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire signed [(3'h5):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire92;
  wire [(4'h8):(1'h0)] wire87;
  wire signed [(4'hc):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire85;
  wire signed [(3'h6):(1'h0)] wire84;
  wire signed [(4'hd):(1'h0)] wire83;
  wire signed [(2'h2):(1'h0)] wire82;
  wire [(5'h10):(1'h0)] wire81;
  wire [(5'h10):(1'h0)] wire80;
  wire [(4'ha):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire77;
  wire signed [(4'h8):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire11;
  reg [(4'h9):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(5'h13):(1'h0)] reg89 = (1'h0);
  reg [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  reg [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  assign y = {wire92,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire60,
                 wire16,
                 wire15,
                 wire14,
                 wire11,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire11 = ($unsigned($signed((wire9 <= (wire8 ? (8'hac) : wire9)))) ?
                      {$unsigned((wire6[(4'h9):(4'h8)] ?
                              (-wire7) : (^wire7)))} : wire8);
  always
    @(posedge clk) begin
      reg12 <= ($signed($signed({(wire10 ?
              wire11 : wire11)})) && {((wire9 >= $unsigned(wire9)) ?
              wire9[(2'h2):(1'h1)] : (wire7 > wire6[(4'hb):(3'h7)]))});
      reg13 <= wire9;
    end
  assign wire14 = (((wire8[(1'h0):(1'h0)] ?
                          (8'hb7) : ((~|(7'h43)) ?
                              $signed(reg12) : wire6[(4'h8):(2'h2)])) ?
                      $signed($signed((wire7 ?
                          wire10 : reg12))) : wire11[(1'h1):(1'h0)]) != ((|$unsigned((|wire10))) || (($signed((8'hbe)) ?
                      (wire11 ?
                          wire9 : wire8) : $unsigned((8'ha2))) << $signed($unsigned((8'hb4))))));
  assign wire15 = $signed((^((wire10[(3'h6):(3'h5)] != (8'h9f)) == (8'hb8))));
  assign wire16 = ((8'haa) ?
                      ($unsigned(((wire6 <= wire7) & (wire8 || wire10))) < ((&$signed(wire6)) ?
                          wire15 : $signed((wire14 >= wire10)))) : $unsigned({(wire7 ^~ $signed(wire6)),
                          wire10[(4'ha):(4'ha)]}));
  module17 #() modinst61 (.clk(clk), .y(wire60), .wire18(wire15), .wire21(reg13), .wire19(wire7), .wire22(wire11), .wire20(wire6));
  always
    @(posedge clk) begin
      reg62 <= $signed(((((wire6 < wire10) ? (~&wire8) : wire6[(3'h6):(3'h6)]) ?
          (wire60[(4'h8):(2'h2)] != $unsigned((8'hb3))) : (~|wire8[(4'h8):(3'h7)])) <<< (reg13 ?
          reg13[(5'h10):(4'hd)] : (((8'ha4) * wire60) < $signed(reg12)))));
      if ((|reg13[(4'hb):(2'h2)]))
        begin
          if ((-$signed((~^reg12[(4'h8):(3'h4)]))))
            begin
              reg63 <= (8'haf);
              reg64 <= $signed(wire9);
            end
          else
            begin
              reg63 <= wire14[(1'h1):(1'h1)];
            end
          if (wire7)
            begin
              reg65 <= (reg12 >>> (~|(~$unsigned(reg63[(3'h4):(1'h0)]))));
              reg66 <= reg13[(3'h7):(2'h2)];
              reg67 <= ($unsigned($signed((wire14 < (reg65 ^~ wire15)))) ?
                  $unsigned(wire11[(1'h0):(1'h0)]) : (|wire9));
              reg68 <= $signed({$signed(reg62[(3'h7):(2'h3)]),
                  $signed($signed($unsigned(wire8)))});
              reg69 <= wire15;
            end
          else
            begin
              reg65 <= reg66;
              reg66 <= reg13[(1'h1):(1'h1)];
              reg67 <= $unsigned(wire7[(5'h14):(4'hf)]);
            end
          reg70 <= reg62;
          if (wire14[(4'ha):(4'h9)])
            begin
              reg71 <= $signed((|$signed(((~^reg66) ?
                  ((8'hb3) <<< wire60) : (~reg67)))));
              reg72 <= wire11[(3'h4):(2'h3)];
              reg73 <= reg69[(2'h3):(1'h1)];
              reg74 <= reg71[(2'h2):(2'h2)];
              reg75 <= {(~&(+(^(|reg70)))),
                  (reg62[(2'h3):(1'h1)] ? (+wire6) : (7'h43))};
            end
          else
            begin
              reg71 <= (^~(!$signed(wire14)));
              reg72 <= (~^$signed($unsigned($signed($signed(reg72)))));
              reg73 <= wire15[(1'h1):(1'h1)];
              reg74 <= reg62;
              reg75 <= wire6;
            end
        end
      else
        begin
          if ((reg65 >> (wire60 ?
              ((-((8'hbc) * wire60)) ?
                  (!$unsigned(wire16)) : (~&(&wire16))) : $unsigned(reg66[(1'h0):(1'h0)]))))
            begin
              reg63 <= (wire10 ? reg62 : reg71[(1'h0):(1'h0)]);
              reg64 <= reg12;
              reg65 <= (wire7[(3'h5):(2'h2)] << {(~^($signed(reg70) ?
                      $unsigned(wire16) : (~|wire14))),
                  $unsigned(($unsigned(reg74) || $signed(reg72)))});
              reg66 <= (reg70[(3'h6):(3'h5)] ? wire11 : reg12[(3'h4):(1'h0)]);
              reg67 <= (&$unsigned((($signed(wire14) ?
                      (wire16 + reg67) : (reg62 << reg12)) ?
                  ($unsigned((8'hbd)) && ((8'hbe) || reg74)) : $signed($signed(reg74)))));
            end
          else
            begin
              reg63 <= reg63[(3'h5):(2'h2)];
              reg64 <= $unsigned($signed((reg74[(4'h9):(2'h3)] ?
                  {$signed(wire6)} : (~^$signed((8'ha9))))));
              reg65 <= $signed(wire6);
            end
          if (((wire6 >> wire11[(4'h8):(3'h7)]) ? reg63 : reg13[(4'hf):(4'hd)]))
            begin
              reg68 <= $unsigned($signed($unsigned({$unsigned(reg71),
                  (!(8'h9d))})));
              reg69 <= $unsigned($unsigned(reg66));
              reg70 <= {((reg63[(3'h5):(2'h3)] ?
                      ((reg68 ?
                          reg73 : wire15) << wire15) : ($unsigned(reg75) <= reg67)) > ({$signed(wire60),
                      wire60} - reg12[(4'h9):(2'h3)])),
                  reg12[(3'h7):(1'h1)]};
              reg71 <= ((~&wire6) ? reg67 : reg68[(2'h3):(1'h1)]);
            end
          else
            begin
              reg68 <= ($unsigned((reg62 ?
                      $signed((~(8'ha0))) : ((~&reg72) >> (reg73 >>> reg75)))) ?
                  reg71[(2'h3):(2'h3)] : (reg12[(3'h6):(1'h0)] ?
                      reg75 : reg12[(3'h5):(1'h0)]));
              reg69 <= (reg12 >>> (+(|((reg70 ? wire60 : wire15) >= reg72))));
              reg70 <= ($signed(reg63) - reg70[(3'h7):(3'h4)]);
              reg71 <= wire14[(4'hc):(3'h6)];
              reg72 <= $signed($unsigned((((8'h9d) - $signed(reg64)) * $signed($signed(reg70)))));
            end
        end
      reg76 <= (reg68[(3'h4):(3'h4)] ?
          reg73 : ($signed($signed(wire15)) ? reg62 : $signed(wire9)));
    end
  assign wire77 = $unsigned($unsigned(($unsigned((|(7'h43))) >>> reg13)));
  assign wire78 = (~|{$signed(reg71)});
  assign wire79 = ({$unsigned((8'hab)), (^~wire14)} ?
                      {(((reg71 - reg12) ?
                                  reg69[(2'h2):(2'h2)] : $unsigned(reg66)) ?
                              $unsigned((reg73 ?
                                  wire6 : reg64)) : reg69)} : (8'hab));
  assign wire80 = ((!wire11[(2'h2):(1'h1)]) ?
                      $unsigned($signed(wire14[(3'h5):(3'h4)])) : wire77);
  assign wire81 = (reg13[(2'h2):(1'h1)] << (wire7 ?
                      $signed((!(8'hb5))) : ($unsigned((^(8'ha3))) & (-wire16))));
  assign wire82 = ({({((8'hb3) ^~ wire7)} != wire10)} >> reg68);
  assign wire83 = reg13;
  assign wire84 = ($unsigned((((~wire80) - $signed(reg70)) < (wire83[(1'h1):(1'h0)] ?
                      (wire10 ? reg70 : wire10) : (reg68 ?
                          (8'ha0) : wire81)))) ^~ ($unsigned({(~|reg75),
                      wire78[(5'h14):(3'h5)]}) <= (~&$unsigned(wire83))));
  assign wire85 = wire80;
  assign wire86 = (!$unsigned({$unsigned(wire83),
                      ((wire16 ? (8'hbd) : reg75) <= (wire82 ?
                          (8'hbe) : reg64))}));
  assign wire87 = (reg63 ?
                      wire7 : ($unsigned(reg65) ?
                          $signed(($unsigned(wire10) != (wire9 & reg71))) : $unsigned(($signed(wire10) ?
                              (wire82 ? wire9 : reg12) : $unsigned(reg76)))));
  always
    @(posedge clk) begin
      reg88 <= (^~(wire86 + {$unsigned($unsigned((8'hae))),
          reg13[(5'h12):(2'h2)]}));
      reg89 <= $signed(((reg74 ?
          ((reg63 << reg68) == (wire81 ? wire8 : wire80)) : ((wire82 ?
                  reg70 : (8'haf)) ?
              (wire8 || wire79) : (8'haf))) ~^ $unsigned(((~|wire6) ?
          ((8'ha5) ? (8'hbd) : wire78) : $signed(reg65)))));
      reg90 <= ($unsigned((8'h9c)) ?
          $unsigned((|reg88[(3'h6):(2'h3)])) : ($unsigned(wire11[(4'h8):(2'h3)]) >>> {{$unsigned((8'hb3)),
                  wire11[(2'h2):(1'h1)]}}));
      reg91 <= (^$unsigned($unsigned((~&$signed(reg68)))));
    end
  assign wire92 = wire6;
endmodule

module module17
#(parameter param58 = ((&(&(~&(8'hb2)))) ? ((({(8'ha7), (8'ha3)} ? (8'ha1) : {(8'ha4)}) - ({(8'hb3)} ? ((8'ha2) ? (8'h9d) : (8'h9c)) : (8'h9f))) > ((((8'ha1) && (8'hb8)) ? (~|(8'hb5)) : (+(8'hbf))) ? {(^(7'h40)), ((7'h41) < (8'hbe))} : {((8'had) <= (7'h44))})) : (^~(7'h41))), 
parameter param59 = (+(+param58)))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h1d3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire22;
  input wire [(4'hd):(1'h0)] wire21;
  input wire [(4'ha):(1'h0)] wire20;
  input wire signed [(5'h15):(1'h0)] wire19;
  input wire [(2'h3):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire53;
  wire signed [(5'h15):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  wire signed [(3'h5):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire29;
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire42,
                 wire36,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg57,
                 reg56,
                 reg55,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg35,
                 reg34,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire18[(2'h2):(1'h1)])
        begin
          reg23 <= $signed($unsigned($unsigned(wire22)));
          if (($unsigned(wire20[(1'h0):(1'h0)]) + $signed((~(^~$signed(wire19))))))
            begin
              reg24 <= reg23[(3'h4):(3'h4)];
              reg25 <= {$unsigned($signed((8'hac)))};
              reg26 <= $unsigned(reg23);
            end
          else
            begin
              reg24 <= $unsigned((reg25[(4'hb):(4'ha)] ?
                  $signed({{wire21}, (|reg25)}) : ($unsigned((reg25 ?
                          reg23 : wire22)) ?
                      (8'hbf) : reg26)));
              reg25 <= {((((8'haf) | $unsigned(wire21)) << $unsigned(reg26[(4'hd):(1'h1)])) & ($signed({wire22,
                      reg24}) && ((reg24 ? wire22 : wire19) >>> reg25))),
                  reg24[(2'h3):(2'h3)]};
              reg26 <= wire19;
              reg27 <= ($signed($unsigned((-wire18[(1'h1):(1'h1)]))) ?
                  $signed($signed((!(wire18 & reg23)))) : $unsigned(reg25));
            end
          reg28 <= {$unsigned(wire22[(2'h3):(1'h0)]),
              ((((wire22 >>> wire19) ?
                      (wire20 ?
                          wire18 : wire20) : (-reg26)) == wire19[(3'h5):(2'h3)]) ?
                  $unsigned((8'ha9)) : $unsigned(($unsigned(reg26) | (~&wire20))))};
        end
      else
        begin
          reg23 <= $signed(((~reg25) ?
              (^($unsigned(wire20) ?
                  {reg26} : wire19[(4'hd):(1'h1)])) : $unsigned(((wire22 > (8'hba)) ?
                  $signed(reg26) : $unsigned(reg25)))));
          reg24 <= reg27[(2'h3):(2'h3)];
          reg25 <= $signed(((((^~wire21) << (|reg27)) || wire18[(2'h3):(1'h1)]) != ((((8'hae) ?
              reg24 : reg23) || (reg27 ?
              wire22 : reg24)) ^~ ($unsigned((8'hb5)) >> (reg28 >> reg27)))));
        end
    end
  assign wire29 = (8'haf);
  assign wire30 = ($signed(reg27[(2'h2):(1'h1)]) + (($signed((^wire22)) ?
                      (reg27 != (+reg26)) : wire20[(1'h1):(1'h0)]) && wire21[(4'hc):(4'h9)]));
  assign wire31 = ((reg25[(4'he):(3'h4)] ?
                          $unsigned(($unsigned(wire18) ?
                              reg24[(3'h5):(1'h0)] : (wire22 - reg24))) : {wire22}) ?
                      ($signed((+$unsigned(reg26))) ?
                          (reg24[(2'h3):(2'h2)] ?
                              wire20 : $unsigned(reg28)) : $unsigned($unsigned(reg28))) : ({$unsigned($signed(reg27))} ?
                          reg27[(3'h4):(1'h0)] : ((((7'h41) << wire21) >= (~^wire20)) ?
                              ((wire29 ?
                                  reg27 : reg24) || $signed((8'hb6))) : (|$signed(reg28)))));
  assign wire32 = $signed((((reg26 ?
                      reg27 : $unsigned(reg23)) == ((wire20 ^~ reg25) ^~ {reg24})) || wire29));
  assign wire33 = $signed($unsigned($signed(wire18)));
  always
    @(posedge clk) begin
      reg34 <= ($signed((~^(~&reg25[(4'hd):(4'h8)]))) ?
          $unsigned((+$signed($unsigned(wire29)))) : reg24[(1'h0):(1'h0)]);
      reg35 <= (($signed(($signed(reg25) >>> (reg34 ? wire29 : reg25))) ?
          wire20[(1'h0):(1'h0)] : $unsigned(((wire30 ?
              (8'hb9) : wire22) == (reg26 ^ (8'ha4))))) || {reg26[(4'hc):(4'hc)],
          (-(wire29 ^~ (&wire32)))});
    end
  assign wire36 = $unsigned(($signed(reg24) ~^ (($unsigned(wire21) == ((8'hab) ?
                      reg25 : reg28)) == $unsigned((|reg28)))));
  always
    @(posedge clk) begin
      if ($signed(wire21))
        begin
          reg37 <= ($unsigned((|(|$unsigned(wire22)))) >>> (&reg28[(3'h5):(3'h5)]));
          if (((|$signed($signed($signed(wire32)))) ?
              reg37[(4'hc):(2'h2)] : ((!($unsigned((8'ha7)) != (wire32 ?
                  wire36 : wire22))) * (reg24[(3'h4):(3'h4)] > ((~|(8'hb7)) == $signed(reg25))))))
            begin
              reg38 <= wire30;
              reg39 <= $unsigned(reg27);
            end
          else
            begin
              reg38 <= $signed(((8'h9f) ?
                  $signed($signed($signed(reg28))) : wire18));
              reg39 <= (~|$signed(wire31));
              reg40 <= {(($signed((wire32 ? reg26 : wire33)) * {$signed(wire19),
                          $signed(wire33)}) ?
                      $unsigned(((wire21 ? wire22 : reg34) ?
                          {reg39} : reg26[(5'h15):(4'hc)])) : wire32[(2'h3):(2'h3)]),
                  ((({wire18} ?
                          (reg38 ?
                              (8'hbb) : reg35) : $signed(wire18)) * $unsigned($unsigned(wire30))) ?
                      (~^$signed((~(7'h40)))) : (8'ha8))};
            end
          reg41 <= ({(~&(^~wire19))} >> wire19[(5'h14):(2'h3)]);
        end
      else
        begin
          reg37 <= reg23[(2'h3):(2'h2)];
        end
    end
  assign wire42 = (^reg39[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg43 <= (~&$signed(((^~reg39[(2'h3):(1'h1)]) ?
          $signed((reg24 ^~ reg38)) : wire20[(4'h9):(3'h7)])));
      reg44 <= (-$unsigned($signed(((reg24 ? reg23 : wire21) & reg25))));
      reg45 <= $signed(((({reg26} ^~ reg37[(4'hc):(3'h6)]) * (^((8'h9e) ?
          (8'haa) : reg25))) < $unsigned(reg44[(1'h0):(1'h0)])));
      if (reg25[(5'h12):(3'h4)])
        begin
          reg46 <= reg45;
        end
      else
        begin
          reg46 <= (8'hbb);
          reg47 <= reg37[(1'h1):(1'h0)];
        end
    end
  assign wire48 = $signed(($signed(reg25[(5'h11):(2'h3)]) > (wire33[(2'h2):(2'h2)] ?
                      wire36[(3'h7):(3'h5)] : wire42[(2'h3):(2'h2)])));
  assign wire49 = $signed(($unsigned($signed($signed(wire31))) ?
                      reg43[(3'h4):(3'h4)] : {(+$signed((8'haa))),
                          {reg34[(2'h2):(1'h1)]}}));
  assign wire50 = $unsigned({$signed((~$signed((8'ha0))))});
  assign wire51 = reg25[(4'h9):(3'h6)];
  assign wire52 = $unsigned(reg28);
  assign wire53 = wire22[(2'h2):(1'h0)];
  assign wire54 = {($unsigned(wire18[(2'h3):(2'h2)]) ?
                          {$unsigned((reg45 ? reg26 : wire33)),
                              ((~|(8'hb4)) <= wire20[(2'h2):(2'h2)])} : (((reg39 ?
                                  reg24 : (8'hb5)) ?
                              $unsigned(wire53) : (8'hba)) | (reg39 ?
                              $unsigned(reg39) : (wire53 - (8'h9e))))),
                      reg45[(3'h7):(3'h5)]};
  always
    @(posedge clk) begin
      reg55 <= {(reg25[(4'hb):(3'h7)] ?
              $signed(($signed(reg23) + (reg45 >>> reg45))) : (+$unsigned({(8'hb2),
                  wire18})))};
      reg56 <= {($unsigned({(~&wire36)}) ?
              reg55 : $unsigned((wire52[(3'h7):(3'h4)] <= reg45[(4'ha):(1'h0)])))};
      reg57 <= $unsigned(reg47);
    end
endmodule
