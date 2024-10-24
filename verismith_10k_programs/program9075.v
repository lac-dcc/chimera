module top
#(parameter param120 = {(~&(-(((7'h43) ? (8'hb1) : (8'h9c)) ^~ (^(7'h41)))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire119;
  wire signed [(4'h9):(1'h0)] wire118;
  wire [(4'hc):(1'h0)] wire117;
  wire signed [(4'h9):(1'h0)] wire116;
  wire signed [(4'hc):(1'h0)] wire115;
  wire signed [(5'h13):(1'h0)] wire114;
  wire signed [(5'h15):(1'h0)] wire113;
  wire signed [(4'hf):(1'h0)] wire112;
  wire [(5'h10):(1'h0)] wire111;
  wire signed [(4'hb):(1'h0)] wire107;
  wire [(3'h4):(1'h0)] wire86;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire84;
  reg [(3'h6):(1'h0)] reg110 = (1'h0);
  reg [(4'he):(1'h0)] reg109 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire107,
                 wire86,
                 wire5,
                 wire84,
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire5 = wire2;
  module6 #() modinst85 (.wire7(wire5), .wire11(wire1), .clk(clk), .y(wire84), .wire9(wire2), .wire8(wire3), .wire10(wire4));
  assign wire86 = ($signed(wire84) || $unsigned($signed(($unsigned(wire3) ?
                      (!wire5) : wire3))));
  module87 #() modinst108 (wire107, clk, wire5, wire3, wire2, wire0);
  always
    @(posedge clk) begin
      reg109 <= $unsigned($signed(wire84));
      reg110 <= $unsigned($signed(((wire0[(4'hf):(4'h8)] ^~ $signed((8'ha4))) ?
          $unsigned((|wire4)) : ($unsigned(wire0) ? (7'h42) : (~|wire4)))));
    end
  assign wire111 = $signed(((({wire107, (7'h41)} ?
                       (wire3 ?
                           wire3 : wire4) : (reg110 == wire86)) << (&(wire3 ?
                       wire3 : wire0))) ^ $unsigned({(wire84 | wire2)})));
  assign wire112 = wire3[(1'h1):(1'h1)];
  assign wire113 = (^~({(~&$unsigned(wire1)),
                       $unsigned($unsigned(wire84))} <<< wire3));
  assign wire114 = $signed(((((wire107 <= wire112) >> $signed(reg110)) ?
                           {(reg110 | wire107),
                               wire84[(3'h4):(2'h3)]} : (^(wire86 ?
                               wire4 : (8'hb8)))) ?
                       $unsigned(({(8'hbb)} ?
                           (+wire107) : reg109[(4'he):(2'h3)])) : wire1));
  assign wire115 = (wire1[(4'hb):(2'h3)] * (^reg109[(4'hb):(4'ha)]));
  assign wire116 = $signed($unsigned(wire86[(2'h2):(1'h0)]));
  assign wire117 = (~^(($signed($unsigned(wire3)) ^ wire116) ?
                       wire115[(3'h5):(1'h0)] : ((wire86 ^ {wire4, wire84}) ?
                           wire86[(1'h1):(1'h1)] : ((reg110 >>> (8'ha3)) < (wire115 ?
                               (8'hb3) : (8'h9d))))));
  assign wire118 = $unsigned((wire107[(3'h5):(3'h4)] ?
                       $unsigned(wire111[(4'hd):(2'h2)]) : reg110[(3'h6):(1'h1)]));
  assign wire119 = wire116[(3'h6):(1'h1)];
endmodule

module module87
#(parameter param105 = {((~(((8'hb1) ? (8'h9d) : (8'hb1)) >= ((8'haf) ^~ (8'hbf)))) & (~&(((7'h44) ? (8'hab) : (8'h9c)) >= {(8'hba)})))}, 
parameter param106 = ((param105 - ((8'hb2) ? ((param105 ? param105 : param105) ? (^(8'hb9)) : param105) : (+(param105 >> param105)))) <= (+((param105 ? (8'hb1) : param105) == ((8'hb0) | ((8'hba) ? (8'h9f) : param105))))))
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire91;
  input wire signed [(5'h10):(1'h0)] wire90;
  input wire signed [(3'h7):(1'h0)] wire89;
  input wire [(4'hc):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire104;
  wire [(4'hd):(1'h0)] wire103;
  wire [(3'h4):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire101;
  wire [(4'h9):(1'h0)] wire100;
  wire signed [(5'h15):(1'h0)] wire97;
  wire signed [(4'hd):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire94;
  wire signed [(4'he):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire92;
  reg signed [(3'h5):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg96 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire97,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 reg99,
                 reg98,
                 reg96,
                 (1'h0)};
  assign wire92 = wire88;
  assign wire93 = $unsigned(((((8'hb8) ?
                          (8'hb9) : (wire90 ^~ wire90)) | ($unsigned(wire90) ?
                          wire88 : (wire90 ? wire89 : wire92))) ?
                      (^~((^wire91) ?
                          (wire89 ?
                              wire89 : wire91) : wire90[(3'h7):(2'h2)])) : (+$signed((wire92 ?
                          wire90 : wire88)))));
  assign wire94 = wire89[(3'h6):(3'h5)];
  assign wire95 = wire88;
  always
    @(posedge clk) begin
      reg96 <= wire91[(4'h8):(3'h6)];
    end
  assign wire97 = (($signed((wire93[(3'h4):(2'h2)] ?
                      (wire92 - wire92) : $unsigned(wire89))) != {reg96[(1'h0):(1'h0)]}) < $unsigned(wire90[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg98 <= $signed($signed(((~|(wire93 >= wire91)) ?
          $unsigned($signed(wire89)) : $signed(wire90))));
      reg99 <= wire93[(4'hd):(4'hb)];
    end
  assign wire100 = (+wire95);
  assign wire101 = ((&((&(|(8'hb3))) > (|reg98[(3'h6):(2'h2)]))) ?
                       ((-wire92[(1'h1):(1'h1)]) ^ wire93[(4'hd):(4'hc)]) : wire92);
  assign wire102 = ($unsigned((~wire90[(1'h1):(1'h1)])) && wire89);
  assign wire103 = ({wire88} ?
                       $signed((+wire92)) : (-({$unsigned(reg99)} <<< ($signed(wire102) * {wire101,
                           wire90}))));
  assign wire104 = wire89;
endmodule

module module6
#(parameter param83 = (({(((8'ha9) ? (8'hbc) : (8'hb9)) ? (+(8'hb5)) : ((8'hbd) ? (8'ha5) : (8'hbf))), (((8'hb7) | (7'h41)) ? (~|(8'hb2)) : ((8'hbe) >> (8'h9c)))} || (|(((8'ha2) ? (8'had) : (8'hb9)) ? ((7'h44) ? (8'hb5) : (8'ha4)) : ((8'hac) != (8'h9f))))) * ((-(^~((8'hbe) ? (8'ha2) : (8'hb6)))) || (((^~(8'h9d)) | (+(8'haf))) >= ((!(8'ha6)) ? (^~(8'haa)) : ((8'hb3) ? (8'hbc) : (8'hb9)))))))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire82;
  wire signed [(3'h7):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire80;
  wire [(5'h11):(1'h0)] wire79;
  wire [(4'hf):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire37;
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire77,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire55,
                 wire12,
                 wire37,
                 (1'h0)};
  assign wire12 = wire9;
  module13 #() modinst38 (wire37, clk, wire8, wire9, wire12, wire10, wire11);
  module39 #() modinst56 (.wire40(wire12), .wire41(wire8), .wire42(wire11), .wire43(wire7), .clk(clk), .y(wire55));
  assign wire57 = ((((|$signed(wire12)) ^ {{wire8}, (8'hb1)}) ?
                          (wire10 ^ $signed($signed(wire11))) : {((|wire8) ?
                                  (^wire12) : $unsigned(wire9)),
                              wire9[(3'h7):(3'h7)]}) ?
                      (wire9 ?
                          $unsigned($unsigned(wire11[(3'h5):(3'h5)])) : {wire7[(3'h7):(3'h5)],
                              (+(wire7 ?
                                  wire11 : wire8))}) : wire8[(4'he):(1'h0)]);
  assign wire58 = (8'hb7);
  assign wire59 = wire9;
  assign wire60 = (^~wire37);
  module61 #() modinst78 (wire77, clk, wire57, wire9, wire58, wire11);
  assign wire79 = $unsigned($unsigned({(!$unsigned(wire60)),
                      wire55[(4'hc):(2'h2)]}));
  assign wire80 = wire55;
  assign wire81 = wire8;
  assign wire82 = ($unsigned({$signed($signed(wire77))}) - ($signed($signed($signed((8'hb4)))) <<< wire55[(1'h0):(1'h0)]));
endmodule

module module61
#(parameter param75 = ({{((^(8'hab)) ? ((7'h40) ? (8'hb9) : (8'h9e)) : {(8'hbb)}), (((8'hb2) ? (8'hb6) : (8'hbf)) ? (~|(7'h43)) : ((8'hb1) ? (8'hbc) : (8'hac)))}, (~&{((8'ha8) << (8'ha3))})} ^~ ((({(8'hb0), (8'hb7)} >> {(8'hbc)}) ? (8'hab) : {((8'haa) > (7'h40)), ((8'hb3) ? (8'hbb) : (8'ha8))}) ? ((|((7'h41) ? (8'hb7) : (8'haf))) | (-((8'hb4) ? (7'h41) : (8'ha3)))) : (&{((8'ha9) < (8'ha9))}))), 
parameter param76 = {(|((~|(-param75)) == (param75 ? {param75} : (param75 << param75)))), (~|(param75 ? param75 : ({param75, param75} ? (param75 ? param75 : (8'ha4)) : {param75})))})
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire65;
  input wire signed [(3'h4):(1'h0)] wire64;
  input wire [(4'h9):(1'h0)] wire63;
  input wire [(4'h9):(1'h0)] wire62;
  wire signed [(2'h2):(1'h0)] wire74;
  wire [(4'h8):(1'h0)] wire73;
  wire [(3'h4):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire66;
  reg signed [(5'h15):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire67,
                 wire66,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  assign wire66 = {$signed((^~wire64))};
  assign wire67 = $signed((~^wire64[(2'h3):(2'h2)]));
  always
    @(posedge clk) begin
      reg68 <= (((wire66[(2'h2):(1'h1)] ?
              ($unsigned(wire64) ?
                  (wire62 < wire65) : $unsigned(wire66)) : ((-wire63) + (8'ha3))) || wire67) ?
          (8'hb6) : {wire63, wire63});
      reg69 <= (wire67[(3'h4):(2'h2)] >= {(!((8'hb4) + $signed(wire66)))});
      reg70 <= (!wire62);
      reg71 <= $signed(wire65);
      reg72 <= $signed($signed((wire62[(3'h7):(1'h1)] && (wire62[(3'h7):(3'h6)] ?
          (reg68 ? reg71 : reg70) : ((8'hb3) & reg71)))));
    end
  assign wire73 = (^~($signed($unsigned(reg72)) | (({wire63} || reg68) ?
                      (8'haf) : $unsigned((wire63 ? wire67 : wire66)))));
  assign wire74 = ($signed(reg70[(3'h7):(2'h2)]) ^ reg70);
endmodule

module module39
#(parameter param54 = ({((((8'hb8) ? (7'h42) : (8'ha0)) ? ((8'hb6) + (8'hb8)) : ((8'had) >> (8'hb9))) < (~((8'ha1) ? (7'h42) : (8'hab)))), {((|(8'hb6)) == ((8'hbb) == (8'ha7))), (~((8'hba) ? (7'h44) : (8'haf)))}} ? ((-{((8'had) * (8'hbb))}) + {(-(~|(8'hb9)))}) : (((+(8'hbd)) ? (+{(7'h41)}) : (((8'h9c) >>> (8'ha1)) ? {(8'haa)} : {(8'ha8), (8'ha5)})) ? ((~((8'hba) == (8'ha4))) | (~|(&(8'h9e)))) : (~|(~^((8'hac) ? (8'hb8) : (8'ha8)))))))
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire43;
  input wire [(2'h3):(1'h0)] wire42;
  input wire signed [(4'h9):(1'h0)] wire41;
  input wire [(4'hc):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire44;
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire44 = (-wire40);
  assign wire45 = (~$unsigned(($unsigned(wire40) ?
                      (~&(wire42 - wire41)) : wire40[(3'h5):(3'h4)])));
  assign wire46 = (wire41 ?
                      (~((-wire43[(2'h3):(2'h3)]) ^~ $signed(((8'hb2) ?
                          wire42 : (8'hb1))))) : wire42);
  assign wire47 = (7'h44);
  always
    @(posedge clk) begin
      reg48 <= (~|wire46[(1'h1):(1'h0)]);
      reg49 <= (($signed((wire46 ? (~|wire42) : (~|reg48))) ?
          wire47 : (+wire41[(2'h2):(2'h2)])) < (((!{wire45}) ^~ (&$signed((8'hae)))) >>> (((~&wire44) ?
          wire42[(2'h3):(1'h0)] : {wire42, wire44}) || wire47)));
      reg50 <= wire40;
    end
  assign wire51 = $unsigned($signed(wire42));
  assign wire52 = (+wire43);
  assign wire53 = $unsigned({((&(8'hac)) ?
                          (-wire41[(2'h3):(1'h0)]) : {(wire41 - wire51),
                              {reg50}}),
                      $unsigned(wire52[(1'h1):(1'h1)])});
endmodule

module module13  (y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire18;
  input wire signed [(5'h15):(1'h0)] wire17;
  input wire [(4'hc):(1'h0)] wire16;
  input wire signed [(4'h8):(1'h0)] wire15;
  input wire [(5'h12):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire signed [(2'h2):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire27;
  wire signed [(5'h10):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
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
                 wire20,
                 wire19,
                 reg32,
                 (1'h0)};
  assign wire19 = (|$signed({({wire14, wire18} || wire16)}));
  assign wire20 = (wire15[(3'h5):(2'h3)] ?
                      $unsigned({$signed((+wire18))}) : $signed(wire17[(4'hb):(4'hb)]));
  assign wire21 = ((~^wire14) ?
                      (+((~&{wire20,
                          wire14}) == (~&wire18))) : (wire20[(1'h0):(1'h0)] ?
                          (({wire18} ? (|(8'haf)) : (~^wire19)) ?
                              $signed((&wire19)) : wire15) : wire20));
  assign wire22 = (!wire14);
  assign wire23 = (~|wire20);
  assign wire24 = ((wire23[(1'h0):(1'h0)] ^~ $signed($unsigned($signed(wire19)))) ?
                      ((8'h9c) ?
                          $unsigned(wire15) : $unsigned(wire15[(2'h3):(2'h3)])) : ($signed(wire14[(2'h2):(1'h0)]) ?
                          wire19[(4'h8):(2'h2)] : {(^~(~wire16))}));
  assign wire25 = $unsigned(wire16[(3'h7):(2'h3)]);
  assign wire26 = (wire19 ?
                      (~$signed($signed((wire25 ^~ wire25)))) : $unsigned((wire18[(1'h0):(1'h0)] ?
                          {wire16[(3'h5):(2'h3)],
                              (wire15 != wire24)} : $signed((~|wire22)))));
  assign wire27 = (wire24 & (((~wire26[(4'hb):(4'h9)]) + {(wire20 ?
                              wire17 : wire14)}) ?
                      (wire23[(2'h3):(1'h1)] - ((wire23 ? wire15 : wire15) ?
                          $unsigned(wire25) : (!wire25))) : {(wire26 & wire20)}));
  assign wire28 = ({$signed($unsigned((wire22 ? wire26 : wire15))),
                      {((^~(8'ha1)) ^~ wire19[(3'h5):(2'h3)]),
                          $signed(wire18)}} || wire14[(1'h0):(1'h0)]);
  assign wire29 = $unsigned($signed(((~^$unsigned(wire25)) >>> (^~wire22[(2'h2):(1'h0)]))));
  assign wire30 = (8'ha6);
  assign wire31 = wire17;
  always
    @(posedge clk) begin
      reg32 <= wire24;
    end
  assign wire33 = wire19;
  assign wire34 = wire23[(3'h4):(1'h0)];
  assign wire35 = wire19;
  assign wire36 = (($unsigned((~&(+wire18))) != $signed($unsigned(wire30[(3'h7):(3'h6)]))) ?
                      $unsigned($unsigned({(-reg32)})) : $unsigned($signed(((wire23 ?
                              wire19 : (8'hb9)) ?
                          wire15 : (~wire20)))));
endmodule
