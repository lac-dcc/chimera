module top
#(parameter param141 = {({({(8'hb3), (8'ha5)} < (&(8'ha2))), ({(8'ha5), (8'hb9)} ? {(8'hbf)} : (8'ha6))} == (~^(^~((8'ha2) && (8'hbf))))), (^(!({(8'hbf), (8'hb3)} ^~ (~^(8'ha8)))))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire signed [(5'h15):(1'h0)] wire140;
  wire signed [(4'hc):(1'h0)] wire136;
  wire [(4'hf):(1'h0)] wire135;
  wire signed [(3'h5):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire133;
  reg signed [(2'h2):(1'h0)] reg139 = (1'h0);
  reg [(5'h15):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg137 = (1'h0);
  assign y = {wire140,
                 wire136,
                 wire135,
                 wire4,
                 wire5,
                 wire31,
                 wire33,
                 wire133,
                 reg139,
                 reg138,
                 reg137,
                 (1'h0)};
  assign wire4 = ($signed($signed((-(wire3 ?
                     wire2 : wire0)))) >> $signed(wire2));
  assign wire5 = $signed((wire3[(2'h2):(1'h0)] ?
                     $unsigned(({wire0} < (wire1 ~^ wire3))) : $signed($signed((wire3 ?
                         wire1 : wire0)))));
  module6 #() modinst32 (.wire10(wire2), .wire9(wire1), .wire7(wire4), .y(wire31), .wire8(wire3), .clk(clk));
  assign wire33 = ({$signed(wire3[(3'h6):(2'h2)])} ?
                      wire1 : $signed((wire4[(3'h5):(1'h0)] ?
                          (&{(8'ha5), wire0}) : ((wire5 ?
                              (8'ha5) : wire1) ^ (wire3 ? wire0 : (8'h9f))))));
  module34 #() modinst134 (.wire38(wire5), .wire36(wire2), .wire35(wire0), .y(wire133), .wire39(wire3), .wire37(wire1), .clk(clk));
  assign wire135 = $signed($signed(($signed((&(8'hb6))) ?
                       $signed({wire5}) : ((wire133 ?
                           wire1 : wire4) + wire0[(4'hd):(1'h1)]))));
  assign wire136 = (-wire3[(5'h10):(4'hf)]);
  always
    @(posedge clk) begin
      reg137 <= wire136;
      reg138 <= $unsigned(wire135[(4'h8):(2'h3)]);
      reg139 <= {$signed((~^{$unsigned((7'h42))})), wire133[(5'h11):(1'h0)]};
    end
  assign wire140 = {$signed(((reg139 <<< reg137[(4'h9):(2'h3)]) + (&$unsigned(wire33)))),
                       wire136[(4'h9):(4'h9)]};
endmodule

module module34
#(parameter param131 = (~(~&((((8'ha6) < (8'hbf)) - ((8'hb1) ? (8'hb1) : (8'hba))) ? (((8'hb0) >> (8'ha3)) ? ((8'hb9) * (8'ha0)) : ((8'hb6) ? (8'hb0) : (8'ha3))) : ({(8'had)} ? {(7'h43)} : ((7'h41) <<< (7'h44)))))), 
parameter param132 = ((^(~|((param131 >= param131) >> (8'hae)))) ? (({(8'hb5)} ? ((param131 ? param131 : param131) ~^ (^param131)) : (param131 >= param131)) ? param131 : ({((7'h41) ? param131 : param131), (param131 ^ param131)} ? ((param131 * param131) > (^param131)) : (~(~param131)))) : (~^(-({param131, param131} && (~&(8'hb1)))))))
(y, clk, wire35, wire36, wire37, wire38, wire39);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire35;
  input wire signed [(5'h12):(1'h0)] wire36;
  input wire [(5'h15):(1'h0)] wire37;
  input wire [(5'h11):(1'h0)] wire38;
  input wire [(5'h14):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire129;
  wire [(5'h13):(1'h0)] wire94;
  wire signed [(4'hc):(1'h0)] wire93;
  wire signed [(5'h11):(1'h0)] wire92;
  wire signed [(5'h10):(1'h0)] wire91;
  wire signed [(5'h15):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire69;
  wire [(5'h12):(1'h0)] wire89;
  assign y = {wire129,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire40,
                 wire69,
                 wire89,
                 (1'h0)};
  assign wire40 = wire37;
  module41 #() modinst70 (wire69, clk, wire35, wire39, wire40, wire37);
  module71 #() modinst90 (.wire74(wire36), .clk(clk), .y(wire89), .wire73(wire37), .wire75(wire38), .wire76(wire35), .wire72(wire39));
  assign wire91 = ((~|wire69[(3'h6):(2'h3)]) << $signed(wire35[(4'h8):(1'h0)]));
  assign wire92 = (wire40[(5'h10):(4'hf)] + ($signed((+(8'ha5))) ?
                      $unsigned(((~|wire69) ?
                          (wire39 ? wire89 : wire40) : (wire39 ?
                              wire91 : (8'h9d)))) : wire91));
  assign wire93 = {$unsigned(wire35)};
  assign wire94 = (8'hb8);
  module95 #() modinst130 (.wire98(wire92), .wire99(wire37), .wire97(wire94), .clk(clk), .y(wire129), .wire96(wire38));
endmodule

module module6
#(parameter param29 = (~^(~^((8'h9c) - (((8'hb6) + (8'hbf)) | (&(8'haf)))))), 
parameter param30 = param29)
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire8;
  input wire [(3'h5):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire11 = {wire9[(3'h4):(1'h1)]};
  assign wire12 = (wire11 ^ ($unsigned({{(8'h9c), wire8}}) ?
                      $signed((7'h40)) : ($signed(wire11) ?
                          $signed(wire9[(4'h8):(3'h7)]) : $signed(wire8[(1'h0):(1'h0)]))));
  assign wire13 = $unsigned($signed($signed(((wire8 <= wire9) | (wire10 ?
                      wire10 : (8'hbb))))));
  assign wire14 = wire10;
  assign wire15 = $signed(wire13);
  assign wire16 = $signed($signed(wire10[(4'hb):(2'h3)]));
  assign wire17 = (wire10[(4'he):(3'h6)] ?
                      ((((^~wire8) ?
                          (wire16 ?
                              wire10 : wire9) : wire10[(4'he):(4'hd)]) < wire13) >> (wire11[(4'h9):(3'h4)] ?
                          ((-wire7) ?
                              $unsigned(wire8) : (&wire11)) : (~|(wire12 == wire14)))) : ((($signed(wire13) == {wire8,
                              wire9}) * wire10[(4'hb):(1'h0)]) ?
                          (~|$unsigned($unsigned(wire10))) : $signed(wire11[(4'hd):(3'h4)])));
  always
    @(posedge clk) begin
      if ({$signed(($unsigned(wire15) ? (+((8'hba) ^~ wire10)) : (-wire9)))})
        begin
          reg18 <= $unsigned($unsigned(wire8[(1'h0):(1'h0)]));
        end
      else
        begin
          reg18 <= reg18;
        end
      if ($unsigned((!((~&(|wire10)) >>> wire10))))
        begin
          reg19 <= wire10;
          reg20 <= (&wire17[(3'h6):(1'h0)]);
          reg21 <= $unsigned($unsigned(reg18));
        end
      else
        begin
          reg19 <= $signed({((~|(~&reg19)) << {((7'h41) ~^ wire8)}),
              $signed(($signed(wire14) ^ wire7))});
        end
    end
  assign wire22 = wire17;
  assign wire23 = $signed(wire8);
  assign wire24 = $unsigned(wire7);
  assign wire25 = (($signed(wire22[(3'h5):(2'h3)]) ~^ wire7[(2'h2):(1'h0)]) >> (wire14 || (^{(~|wire12),
                      (wire14 ? (8'h9e) : (8'hae))})));
  assign wire26 = wire16;
  assign wire27 = (~|(&wire26[(2'h2):(1'h1)]));
  assign wire28 = ((((~^wire11) + {wire17}) ?
                          $unsigned($unsigned(wire7)) : $unsigned($unsigned({wire26}))) ?
                      (($signed(reg18) ?
                          reg21[(4'h8):(3'h6)] : ((wire24 * (8'hb2)) ?
                              $signed(wire16) : $unsigned(wire25))) < (({wire9} == (wire17 ?
                          wire13 : wire9)) | ((wire13 || (8'ha8)) | (wire11 ?
                          (8'hab) : reg20)))) : (($unsigned($signed(wire12)) ?
                              ($signed(wire16) << wire23[(2'h2):(1'h1)]) : $signed((wire8 ?
                                  reg21 : reg19))) ?
                          (wire26[(3'h4):(1'h1)] ^~ ((reg21 ?
                                  wire22 : (8'hbf)) ?
                              (^~reg20) : wire12[(4'h9):(3'h5)])) : ((8'hbb) ?
                              ((wire15 ?
                                  wire7 : wire14) <= $signed(wire11)) : (wire25 << (reg19 + wire14)))));
endmodule

module module95
#(parameter param127 = {(((~^((8'ha9) * (8'h9f))) ? {(~|(8'h9c))} : (((8'ha4) ? (8'ha9) : (8'hb6)) <<< (~&(8'h9e)))) - {(!((8'ha7) >= (8'hbc))), (~^((8'ha5) ? (7'h42) : (8'ha6)))})}, 
parameter param128 = (+(&param127)))
(y, clk, wire99, wire98, wire97, wire96);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire99;
  input wire [(5'h11):(1'h0)] wire98;
  input wire [(5'h13):(1'h0)] wire97;
  input wire [(5'h11):(1'h0)] wire96;
  wire signed [(5'h12):(1'h0)] wire126;
  wire [(5'h15):(1'h0)] wire125;
  wire signed [(3'h4):(1'h0)] wire124;
  wire [(4'ha):(1'h0)] wire123;
  wire signed [(5'h14):(1'h0)] wire122;
  wire signed [(4'ha):(1'h0)] wire121;
  wire [(4'hb):(1'h0)] wire120;
  wire [(4'he):(1'h0)] wire119;
  wire signed [(4'he):(1'h0)] wire118;
  wire signed [(3'h5):(1'h0)] wire117;
  wire signed [(4'h8):(1'h0)] wire116;
  wire [(5'h10):(1'h0)] wire115;
  wire [(2'h2):(1'h0)] wire114;
  wire signed [(3'h5):(1'h0)] wire113;
  wire [(4'he):(1'h0)] wire104;
  wire [(5'h11):(1'h0)] wire103;
  wire [(3'h6):(1'h0)] wire102;
  wire [(5'h15):(1'h0)] wire101;
  wire signed [(4'h8):(1'h0)] wire100;
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg [(4'h8):(1'h0)] reg111 = (1'h0);
  reg [(4'h9):(1'h0)] reg110 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(4'hd):(1'h0)] reg108 = (1'h0);
  reg [(4'hb):(1'h0)] reg107 = (1'h0);
  reg [(5'h11):(1'h0)] reg106 = (1'h0);
  reg [(4'hc):(1'h0)] reg105 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 (1'h0)};
  assign wire100 = wire99;
  assign wire101 = (-wire99[(5'h15):(1'h0)]);
  assign wire102 = wire96;
  assign wire103 = $signed((wire96[(5'h10):(4'ha)] ?
                       $unsigned(wire100[(3'h4):(1'h0)]) : $signed(wire96)));
  assign wire104 = ((~^(~|(-(wire97 ?
                       (8'hb2) : (8'hb7))))) < wire102[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg105 <= (~wire102[(2'h2):(1'h0)]);
      reg106 <= $signed((+{wire98[(1'h1):(1'h0)],
          ((reg105 <<< reg105) ? wire98 : $signed(wire98))}));
      if ((8'h9e))
        begin
          reg107 <= $signed({$signed(wire96[(5'h11):(4'ha)]),
              wire97[(2'h2):(2'h2)]});
          if (((wire102[(2'h2):(2'h2)] * $unsigned(reg106[(1'h0):(1'h0)])) && $unsigned($unsigned(({wire102,
                  wire100} ?
              reg107[(3'h4):(2'h3)] : ((8'hbf) <<< wire98))))))
            begin
              reg108 <= ((wire102[(1'h0):(1'h0)] ?
                      (((wire100 ? wire103 : wire97) ?
                              (~reg105) : wire101[(4'hb):(4'h8)]) ?
                          (reg107[(4'h9):(2'h2)] >> $unsigned(wire104)) : ((~&reg105) <<< ((8'hb1) >> wire102))) : {($signed(wire101) | wire102[(3'h5):(1'h0)]),
                          ($signed(reg107) ? (+reg107) : (reg106 - reg106))}) ?
                  (^~$signed(reg107)) : wire101[(4'hf):(3'h4)]);
              reg109 <= $signed(($unsigned($unsigned($signed(wire96))) ?
                  (-reg107[(3'h7):(1'h0)]) : $signed((wire96 ?
                      (reg106 ? wire99 : reg108) : (reg108 ^~ (8'ha6))))));
              reg110 <= ((($unsigned((~(8'hbc))) ?
                          (+reg107) : (reg106[(5'h11):(3'h4)] << wire104[(1'h0):(1'h0)])) ?
                      wire96 : (((~^wire102) ?
                          ((8'hb3) ? reg106 : wire100) : reg107) >>> ((wire100 ?
                          wire104 : reg105) <= $unsigned(wire100)))) ?
                  ($unsigned(wire102) != reg105[(3'h5):(2'h2)]) : (|reg108));
            end
          else
            begin
              reg108 <= $signed((|(~&(|(&wire98)))));
              reg109 <= $signed($unsigned($signed(wire96)));
              reg110 <= (wire98[(5'h10):(5'h10)] ?
                  ((wire99[(5'h11):(1'h0)] | (reg107[(4'h8):(3'h7)] != $signed((8'hac)))) ?
                      ((^wire97) ^~ (((8'hbc) >> wire101) ?
                          (-reg109) : (wire97 ?
                              wire103 : wire99))) : ((|reg107) | $unsigned((reg106 ?
                          reg110 : wire97)))) : (~reg108[(3'h5):(1'h1)]));
            end
          reg111 <= (-$signed((+wire102)));
        end
      else
        begin
          reg107 <= (|(~wire99));
          reg108 <= ($signed({wire103[(2'h3):(2'h3)],
              (-$signed(wire100))}) > {{($signed(wire97) <= (reg105 ?
                      wire103 : wire97)),
                  (8'ha4)},
              $unsigned(($unsigned(wire96) ?
                  $signed(reg105) : $unsigned(wire101)))});
          reg109 <= (!reg109[(4'he):(4'hc)]);
          reg110 <= $unsigned((+((~(wire101 ? wire99 : (8'ha4))) ?
              (|(-reg106)) : ($signed(wire98) == $signed(reg106)))));
        end
      reg112 <= wire98[(5'h11):(4'hd)];
    end
  assign wire113 = ($unsigned($signed($signed(wire101))) ^~ {(!wire103[(4'hd):(4'h9)]),
                       $unsigned({reg111[(1'h1):(1'h1)],
                           (wire101 ? reg109 : reg106)})});
  assign wire114 = ($unsigned((reg108[(4'ha):(4'h8)] <= $signed((wire97 ?
                           wire113 : reg111)))) ?
                       $signed($unsigned((~(wire96 ?
                           reg110 : reg110)))) : (({$unsigned(reg112)} ?
                           (~|(+(8'hbb))) : (&$unsigned(reg109))) <= wire101));
  assign wire115 = $signed(($unsigned(wire103) - (8'hb4)));
  assign wire116 = (~|(wire100 << $unsigned(wire115[(4'hf):(4'hc)])));
  assign wire117 = $unsigned({$signed(((wire99 ? reg110 : reg108) ?
                           $signed(wire102) : (reg112 ^~ reg107))),
                       {$unsigned(wire97[(4'hd):(2'h2)]),
                           ((^~wire113) ?
                               $signed(wire97) : (wire115 >>> wire114))}});
  assign wire118 = (+(wire101[(3'h4):(2'h3)] ~^ (+$signed(wire114))));
  assign wire119 = ($signed($unsigned((reg112 <<< $signed(reg110)))) ^~ ((((-(8'hab)) ?
                           reg110 : wire98) + wire116) ?
                       {$signed((wire97 << (8'ha0))),
                           ((!(8'ha8)) ?
                               (-reg108) : $signed(reg111))} : (({reg111,
                           (7'h44)} * (-reg105)) - $signed(wire113[(3'h4):(3'h4)]))));
  assign wire120 = wire100;
  assign wire121 = (&($signed(reg112[(3'h7):(2'h3)]) & (~&{{wire98, reg108}})));
  assign wire122 = (^~(wire101 ?
                       (~&reg108[(3'h5):(3'h4)]) : ($signed(wire119[(4'hb):(3'h5)]) ?
                           (~wire96[(5'h11):(5'h10)]) : ($signed(wire97) == $signed((8'hbd))))));
  assign wire123 = ({($signed({reg108, wire114}) ?
                               (~&(wire121 & wire115)) : $unsigned($signed((8'h9f))))} ?
                       (~$unsigned(wire100[(4'h8):(1'h1)])) : {{(((7'h40) ?
                                       wire115 : reg112) ?
                                   $signed(wire122) : ((8'haa) ?
                                       reg107 : wire98)),
                               $signed((wire97 ? wire100 : wire119))},
                           $unsigned((reg107[(4'hb):(1'h1)] ?
                               (wire98 ? reg107 : reg107) : ((8'hac) ?
                                   (8'hae) : wire113)))});
  assign wire124 = ($signed((!$signed(wire98))) ?
                       reg108[(3'h4):(1'h1)] : $signed(wire123[(2'h2):(1'h0)]));
  assign wire125 = (^(reg106 < wire123));
  assign wire126 = ($signed($unsigned($signed($unsigned(wire104)))) ?
                       $signed((~|($unsigned(wire116) ?
                           {wire124,
                               wire125} : $signed(wire117)))) : (reg108[(4'hd):(3'h7)] ?
                           wire104[(2'h3):(2'h2)] : wire115));
endmodule

module module71
#(parameter param87 = {((~(((8'hbd) ? (7'h41) : (8'ha7)) <<< ((8'ha6) ? (8'hbc) : (8'hbf)))) ? (+((~(8'h9d)) ? ((8'had) <<< (8'hb5)) : (~|(8'ha8)))) : (((~&(8'hb5)) ? (-(8'ha6)) : {(8'hb4)}) ? (^((8'hb2) + (8'h9f))) : (((8'hb6) >>> (8'ha2)) <<< ((7'h43) ? (7'h41) : (8'h9c))))), {((~|((8'hb5) < (8'ha8))) << ((8'ha9) ? ((8'ha5) || (8'hb3)) : ((7'h40) <= (8'ha7)))), (8'hb5)}}, 
parameter param88 = (~(~|(&{(param87 ? param87 : param87)}))))
(y, clk, wire76, wire75, wire74, wire73, wire72);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire76;
  input wire [(4'h8):(1'h0)] wire75;
  input wire [(2'h2):(1'h0)] wire74;
  input wire signed [(3'h6):(1'h0)] wire73;
  input wire [(5'h14):(1'h0)] wire72;
  wire signed [(4'h9):(1'h0)] wire86;
  wire signed [(5'h12):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire83;
  wire signed [(4'hf):(1'h0)] wire82;
  wire [(3'h6):(1'h0)] wire81;
  wire [(4'ha):(1'h0)] wire80;
  wire signed [(4'hd):(1'h0)] wire79;
  wire signed [(3'h7):(1'h0)] wire78;
  wire [(3'h4):(1'h0)] wire77;
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 (1'h0)};
  assign wire77 = {wire75,
                      {wire76[(4'h8):(3'h7)],
                          (wire76[(1'h0):(1'h0)] << (8'hb1))}};
  assign wire78 = wire72;
  assign wire79 = (&wire78);
  assign wire80 = {{wire75, wire79[(1'h0):(1'h0)]},
                      (wire73[(2'h2):(1'h1)] + ({$unsigned(wire77)} >= $unsigned(wire76)))};
  assign wire81 = $signed({($unsigned((8'haa)) ?
                          wire76[(1'h0):(1'h0)] : $unsigned($signed(wire77)))});
  assign wire82 = (8'ha5);
  assign wire83 = wire79;
  assign wire84 = $unsigned(wire82[(3'h7):(3'h4)]);
  assign wire85 = wire81[(1'h1):(1'h1)];
  assign wire86 = $signed((((&wire72[(2'h3):(2'h3)]) ~^ (+wire74[(2'h2):(1'h0)])) + {(~&(~(8'hb8))),
                      wire72}));
endmodule

module module41
#(parameter param68 = ({(~&(~((8'hae) >= (8'hb3)))), (((~^(8'ha3)) ? (8'ha4) : (!(8'haa))) ? (((8'hb1) ? (8'hba) : (8'hb8)) ? ((8'ha5) - (8'ha6)) : ((8'ha8) ? (8'hb4) : (8'ha1))) : (((8'hb2) ? (7'h41) : (8'hbd)) - ((8'h9f) || (8'hb5))))} ? {((((8'h9f) ? (8'hac) : (7'h41)) ? ((8'ha1) ? (8'hbb) : (8'h9c)) : (~(8'hbd))) ? (((8'ha4) >>> (8'haa)) ? (~|(7'h40)) : {(8'hbe)}) : ((8'hbf) ? {(7'h42), (8'ha4)} : {(7'h40)}))} : (-(8'hb3))))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire45;
  input wire [(5'h11):(1'h0)] wire44;
  input wire [(5'h15):(1'h0)] wire43;
  input wire [(4'he):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire67;
  wire signed [(5'h11):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire46;
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(3'h7):(1'h0)] reg48 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire47,
                 wire46,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire46 = wire43[(5'h11):(3'h6)];
  assign wire47 = wire44[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg48 <= $signed({(wire46 ?
              wire44[(4'ha):(1'h0)] : wire47[(4'ha):(2'h2)]),
          $signed($signed((wire45 ? wire43 : wire43)))});
      reg49 <= (wire45 ?
          (wire44 < $signed((&$unsigned((8'ha3))))) : $unsigned($signed((-(wire44 >= wire47)))));
    end
  assign wire50 = (wire45 ? (8'ha2) : {(8'hac)});
  assign wire51 = $unsigned((+$unsigned($signed((wire45 ? wire50 : wire43)))));
  assign wire52 = $unsigned($signed(reg48[(3'h4):(1'h1)]));
  assign wire53 = $signed(wire45[(3'h7):(1'h0)]);
  assign wire54 = $signed((8'h9d));
  assign wire55 = (^(+$signed(wire42[(4'hb):(3'h5)])));
  assign wire56 = {{$signed((-wire50[(3'h5):(2'h2)]))}};
  assign wire57 = wire52[(4'hc):(4'h9)];
  always
    @(posedge clk) begin
      reg58 <= $unsigned($unsigned(wire47[(4'h8):(3'h7)]));
      if ((reg48[(1'h0):(1'h0)] > ({(wire54 ?
              (wire52 >> wire44) : wire53[(2'h3):(1'h0)]),
          $signed(wire43)} ^~ ($unsigned($signed(wire42)) <= {{wire45, wire44},
          $unsigned(wire53)}))))
        begin
          reg59 <= ((+(8'ha1)) ?
              $signed(wire45) : $signed(((~|(wire44 * wire54)) <<< (wire46[(4'hf):(3'h7)] ?
                  (~|(8'ha1)) : (!wire57)))));
          reg60 <= ((wire56 >>> (wire45 && wire43)) ?
              $signed($unsigned($unsigned(wire53[(4'hd):(2'h2)]))) : $unsigned($signed({{wire44,
                      wire54},
                  wire45[(4'h9):(3'h7)]})));
        end
      else
        begin
          reg59 <= (reg60[(4'h9):(4'h9)] ^ reg58);
          if ($unsigned(wire54))
            begin
              reg60 <= reg59;
              reg61 <= reg58[(2'h3):(2'h3)];
              reg62 <= wire47[(3'h4):(3'h4)];
              reg63 <= $signed(reg49);
            end
          else
            begin
              reg60 <= (!(!{(~(|(8'hb6)))}));
              reg61 <= (~^$unsigned((reg63[(1'h0):(1'h0)] | ({wire43, reg48} ?
                  (wire47 == wire54) : reg62))));
            end
        end
      reg64 <= (reg58[(3'h4):(1'h1)] ?
          (^(&(~&$unsigned((8'hba))))) : wire51[(3'h7):(3'h7)]);
      reg65 <= (8'hbe);
    end
  assign wire66 = ((reg65[(2'h3):(2'h3)] ?
                          $signed((wire45[(4'hc):(1'h0)] ?
                              $signed(wire56) : {wire45,
                                  reg58})) : $signed({(wire51 < wire44),
                              (~wire55)})) ?
                      reg48 : ($unsigned((8'ha7)) ?
                          reg61[(2'h2):(1'h1)] : (8'hb0)));
  assign wire67 = wire53;
endmodule
