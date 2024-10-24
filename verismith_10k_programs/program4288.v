module top
#(parameter param128 = (((((^~(7'h43)) ? {(8'hb1)} : (-(8'hb0))) << (+{(8'ha9), (8'hac)})) ? ((((8'hbb) ? (8'hb5) : (8'ha1)) ? ((8'hbd) ? (8'hac) : (8'ha7)) : ((8'hb3) != (8'hae))) != {((8'hba) ? (7'h42) : (8'haa)), ((8'h9e) ? (8'hbf) : (8'hbc))}) : ({((8'ha0) ? (8'hb9) : (8'hb4)), {(8'hac), (8'ha8)}} ? ({(8'hbb)} ? ((8'hba) << (8'h9e)) : ((8'hb4) ? (8'hb2) : (8'hba))) : (-(|(8'hb3))))) << (((((8'hb5) ? (8'ha3) : (8'h9d)) ? ((8'h9c) == (8'h9f)) : (+(8'ha7))) ? {(^(7'h42)), (7'h42)} : (((8'hb7) ? (8'ha2) : (8'hb1)) ^~ (!(8'ha7)))) & (8'ha9))), 
parameter param129 = (param128 ? (-((8'hb1) ? ((~&param128) ? param128 : (!(8'hb2))) : ((param128 == (8'hb7)) ? param128 : (param128 ? param128 : param128)))) : param128))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire [(4'hb):(1'h0)] wire127;
  wire [(4'hd):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire125;
  assign y = {wire127,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire125,
                 (1'h0)};
  assign wire4 = (^$signed($signed((~|(wire2 ? (8'hb8) : wire1)))));
  assign wire5 = (|wire4[(4'hc):(2'h3)]);
  assign wire6 = (wire2 ?
                     $unsigned(wire2[(1'h0):(1'h0)]) : (wire2[(1'h1):(1'h1)] ?
                         wire3[(3'h6):(2'h3)] : ((|(wire1 >>> wire1)) ^ wire2)));
  assign wire7 = (8'hb2);
  assign wire8 = (^wire1);
  assign wire9 = wire7;
  assign wire10 = wire3[(3'h6):(3'h4)];
  assign wire11 = {(8'hb5)};
  module12 #() modinst126 (wire125, clk, wire5, wire7, wire3, wire11, wire6);
  assign wire127 = ((~|$signed((^$unsigned(wire5)))) ?
                       wire5 : (wire7[(3'h4):(2'h2)] && ((~|wire9[(2'h2):(1'h1)]) ?
                           wire7[(4'hc):(1'h0)] : $unsigned($unsigned(wire8)))));
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire17;
  input wire signed [(3'h7):(1'h0)] wire16;
  input wire signed [(5'h11):(1'h0)] wire15;
  input wire signed [(4'h9):(1'h0)] wire14;
  input wire signed [(5'h12):(1'h0)] wire13;
  wire signed [(4'hc):(1'h0)] wire124;
  wire signed [(5'h13):(1'h0)] wire123;
  wire [(3'h5):(1'h0)] wire122;
  wire [(4'ha):(1'h0)] wire120;
  wire [(3'h6):(1'h0)] wire88;
  wire [(5'h15):(1'h0)] wire87;
  wire signed [(5'h14):(1'h0)] wire86;
  wire [(5'h12):(1'h0)] wire85;
  wire [(2'h2):(1'h0)] wire84;
  wire [(5'h12):(1'h0)] wire82;
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire120,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire82,
                 (1'h0)};
  module18 #() modinst83 (.clk(clk), .wire19(wire17), .y(wire82), .wire20(wire16), .wire21(wire15), .wire22(wire13));
  assign wire84 = (wire15[(1'h0):(1'h0)] ?
                      (!wire16) : ((((wire14 | wire13) ?
                              (wire82 ? wire82 : wire82) : (wire82 ?
                                  wire13 : wire13)) & $unsigned($signed(wire14))) ?
                          $unsigned($unsigned($unsigned(wire15))) : $unsigned($unsigned(wire82))));
  assign wire85 = wire17;
  assign wire86 = {(wire15 ?
                          $unsigned({(~^wire14),
                              ((8'hac) ?
                                  wire13 : wire82)}) : wire13[(3'h5):(1'h0)])};
  assign wire87 = $signed(wire84[(2'h2):(2'h2)]);
  assign wire88 = wire84[(1'h0):(1'h0)];
  module89 #() modinst121 (wire120, clk, wire86, wire82, wire85, wire13);
  assign wire122 = ($signed((wire86[(5'h11):(4'hf)] >> ({wire87,
                           wire16} > (&wire87)))) ?
                       wire82[(4'hf):(3'h7)] : $signed((8'haf)));
  assign wire123 = ($signed(wire122[(3'h4):(2'h2)]) ?
                       (wire87[(4'hd):(3'h5)] && {(~wire122[(2'h2):(2'h2)])}) : wire85);
  assign wire124 = ($unsigned($signed(($signed(wire14) ?
                           (~|wire82) : $unsigned(wire87)))) ?
                       {($unsigned($signed(wire82)) << wire85),
                           wire85} : ($signed(wire122[(1'h1):(1'h0)]) ?
                           $signed((8'h9f)) : (~^(^(wire122 ?
                               wire13 : wire120)))));
endmodule

module module89
#(parameter param118 = {((~^((8'ha8) + ((7'h40) == (8'ha4)))) ? (~((8'ha3) ? ((8'ha6) ? (7'h40) : (8'hb1)) : {(8'hb5), (8'hbe)})) : ((((8'hb6) ? (8'hbb) : (8'h9e)) ? ((8'hbe) ? (8'ha5) : (8'ha2)) : ((8'hbd) <<< (8'hb6))) >>> ({(8'ha2), (8'ha1)} ? ((8'hb3) >= (7'h41)) : ((8'hb4) ? (8'ha6) : (8'hbf)))))}, 
parameter param119 = (((-((8'ha9) ? (!param118) : param118)) ? param118 : param118) ? {{((~&param118) - (|param118))}, (~^(-(param118 <= param118)))} : ((8'hb8) * param118)))
(y, clk, wire93, wire92, wire91, wire90);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire93;
  input wire [(4'h8):(1'h0)] wire92;
  input wire signed [(5'h12):(1'h0)] wire91;
  input wire [(5'h12):(1'h0)] wire90;
  wire [(4'hb):(1'h0)] wire117;
  wire [(5'h11):(1'h0)] wire116;
  wire signed [(4'hc):(1'h0)] wire98;
  wire signed [(3'h5):(1'h0)] wire97;
  wire [(4'hf):(1'h0)] wire96;
  wire signed [(5'h11):(1'h0)] wire95;
  wire [(4'ha):(1'h0)] wire94;
  reg signed [(4'hc):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg113 = (1'h0);
  reg [(4'hc):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg110 = (1'h0);
  reg [(4'ha):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(3'h4):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg104 = (1'h0);
  reg [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
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
                 (1'h0)};
  assign wire94 = $unsigned($signed({$signed($unsigned((8'h9f)))}));
  assign wire95 = wire90;
  assign wire96 = (wire93[(3'h4):(1'h0)] ?
                      $signed((8'hb3)) : {(wire90 - $unsigned({(8'had)}))});
  assign wire97 = (((8'hbd) | wire91) >>> (!(($signed(wire96) ?
                          ((8'ha8) ? (7'h40) : wire90) : (wire95 == wire95)) ?
                      wire94 : wire92[(3'h6):(2'h2)])));
  assign wire98 = (wire91 && wire94);
  always
    @(posedge clk) begin
      reg99 <= ((($unsigned((^~wire92)) || ($signed(wire93) ?
              $unsigned(wire90) : (~|(7'h43)))) ?
          wire95 : (!(^wire97))) ^ wire91[(4'he):(3'h4)]);
      if (wire90[(4'ha):(1'h0)])
        begin
          if ((8'ha9))
            begin
              reg100 <= wire92;
              reg101 <= $unsigned((+(|$signed((reg99 >= wire98)))));
              reg102 <= (^~wire97);
            end
          else
            begin
              reg100 <= wire94[(4'h8):(3'h7)];
              reg101 <= wire94;
            end
        end
      else
        begin
          if ($signed(((!$signed((~&wire92))) ?
              $unsigned(wire97) : {(+(reg102 + wire90))})))
            begin
              reg100 <= (&{reg100[(1'h0):(1'h0)], wire96[(4'hf):(3'h6)]});
            end
          else
            begin
              reg100 <= $unsigned(wire94[(2'h2):(1'h0)]);
            end
          if ($signed($signed({$unsigned($signed(reg102)),
              (~&{reg100, wire93})})))
            begin
              reg101 <= (8'hab);
              reg102 <= (8'hbc);
            end
          else
            begin
              reg101 <= wire92;
              reg102 <= $unsigned($signed((~&wire92)));
            end
          reg103 <= $signed({$signed($signed($unsigned(wire91))), wire96});
          if ($unsigned(wire97[(2'h3):(1'h0)]))
            begin
              reg104 <= $unsigned($unsigned($signed(($unsigned((8'hb8)) ?
                  ((8'hb5) | wire95) : (+reg101)))));
              reg105 <= wire97[(3'h4):(1'h0)];
              reg106 <= (($unsigned(reg100[(1'h1):(1'h0)]) ?
                  $signed({reg101[(4'h9):(2'h2)]}) : (|wire96[(4'h9):(3'h7)])) == (-(wire90[(5'h10):(3'h4)] ?
                  (~&{(8'hac)}) : wire90)));
            end
          else
            begin
              reg104 <= $signed(reg99[(2'h2):(1'h1)]);
              reg105 <= $signed($unsigned(($unsigned($signed(reg100)) ?
                  $unsigned({(8'hb5), reg106}) : reg104)));
              reg106 <= wire94;
              reg107 <= $unsigned(reg100);
            end
        end
      reg108 <= ($signed((~&$unsigned($signed(reg101)))) ?
          wire96[(3'h4):(1'h0)] : $unsigned(({reg104[(1'h0):(1'h0)]} ?
              (wire91 | $signed(wire98)) : wire92[(3'h7):(3'h5)])));
      reg109 <= $unsigned((^$signed(reg106[(1'h1):(1'h1)])));
      if (wire91)
        begin
          reg110 <= $unsigned(($unsigned({wire96[(4'h8):(4'h8)],
              (reg106 ?
                  reg104 : reg99)}) <<< ((~&$signed(wire98)) >> ((reg108 + (8'hbb)) & $signed(reg102)))));
          if (reg103[(1'h0):(1'h0)])
            begin
              reg111 <= (~|$unsigned(({(+(8'hac)), (8'hb3)} ?
                  $unsigned((reg101 ?
                      reg110 : reg105)) : wire91[(4'hc):(3'h6)])));
              reg112 <= (7'h42);
              reg113 <= (!(reg103[(1'h1):(1'h1)] * wire94[(1'h1):(1'h0)]));
            end
          else
            begin
              reg111 <= reg109[(1'h1):(1'h0)];
              reg112 <= reg104;
            end
          reg114 <= $signed((7'h43));
          reg115 <= ($signed((reg107 >> reg102)) && reg106);
        end
      else
        begin
          if (reg112)
            begin
              reg110 <= $signed(($unsigned($signed((reg101 + reg115))) ?
                  (~&wire93[(3'h7):(3'h7)]) : (-reg111)));
              reg111 <= wire97[(2'h2):(2'h2)];
            end
          else
            begin
              reg110 <= $signed($unsigned(wire94));
            end
          reg112 <= (($unsigned(reg106[(2'h3):(1'h0)]) ?
              reg110[(4'hc):(4'hc)] : {{{(7'h41), (8'ha0)},
                      $signed(reg110)}}) & $signed(reg114));
          reg113 <= $signed($signed((~|{reg111, reg108[(4'hc):(3'h4)]})));
          reg114 <= ($unsigned(wire97) <<< $signed($signed($signed((reg111 ?
              (8'hb7) : reg106)))));
        end
    end
  assign wire116 = wire90;
  assign wire117 = $signed($signed((8'h9c)));
endmodule

module module18
#(parameter param81 = ({((((8'ha0) - (8'hb2)) ~^ (!(8'hac))) >>> (8'hb6)), ((!((8'hb6) ? (8'hae) : (8'hb8))) ? ((~(8'hba)) >>> (~&(8'ha1))) : (~|((8'hb2) ? (8'h9e) : (8'ha1))))} != (|({(~|(8'hbe))} ^ (((8'hac) ^ (8'hba)) + ((8'hbd) == (8'ha9)))))))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h297):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire22;
  input wire [(5'h11):(1'h0)] wire21;
  input wire signed [(3'h5):(1'h0)] wire20;
  input wire [(4'he):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire80;
  wire [(4'hf):(1'h0)] wire79;
  wire [(5'h15):(1'h0)] wire78;
  wire signed [(4'h8):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire33;
  wire signed [(4'hd):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire23;
  reg signed [(4'hb):(1'h0)] reg77 = (1'h0);
  reg [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire57,
                 wire47,
                 wire34,
                 wire33,
                 wire24,
                 wire23,
                 reg77,
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
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg46,
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
                 reg35,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire23 = wire19[(4'hc):(3'h5)];
  assign wire24 = $unsigned((~|({wire22[(1'h0):(1'h0)]} ?
                      $signed($unsigned(wire21)) : {$signed((7'h41)),
                          {wire21}})));
  always
    @(posedge clk) begin
      reg25 <= $signed($signed(wire19[(3'h4):(2'h3)]));
      reg26 <= wire20[(2'h3):(2'h3)];
      reg27 <= wire19[(4'hb):(4'h9)];
    end
  always
    @(posedge clk) begin
      reg28 <= (wire19 << {(~^$unsigned($unsigned((8'hbc)))),
          $unsigned((+(&wire22)))});
      reg29 <= ((~|wire19[(3'h7):(3'h4)]) ?
          $signed(($signed((|reg27)) ?
              {((8'hb0) - (8'hb5))} : ($signed(reg26) || ((8'hb5) + wire22)))) : (wire22 ?
              wire19 : (^~wire24)));
      reg30 <= ((wire21 ^ reg27) >>> (~|reg27));
      reg31 <= (~^wire21);
      reg32 <= reg30[(3'h4):(1'h1)];
    end
  assign wire33 = wire20;
  assign wire34 = (!(^{$unsigned((reg25 ? (8'hbf) : reg26))}));
  always
    @(posedge clk) begin
      if (wire34[(3'h4):(3'h4)])
        begin
          if ((reg30[(4'h8):(1'h1)] == wire21))
            begin
              reg35 <= (~^reg31);
            end
          else
            begin
              reg35 <= $signed((-(~&((~&reg31) ^ wire24[(4'ha):(1'h0)]))));
              reg36 <= $signed((($unsigned(wire20) ^ wire20) ?
                  (reg30[(2'h3):(1'h1)] ?
                      reg28[(4'hd):(3'h5)] : {(wire24 >> reg25)}) : $unsigned(((~^wire21) ?
                      (wire21 ? (8'ha1) : reg27) : $signed(reg31)))));
              reg37 <= {(($signed({reg27, reg27}) ?
                          (^$unsigned(wire19)) : ((-reg35) > $signed(reg29))) ?
                      $signed((~|$signed(reg36))) : ($signed($signed(reg28)) <= reg26[(2'h3):(1'h0)])),
                  (~&wire22[(1'h1):(1'h0)])};
              reg38 <= $unsigned((-$unsigned((wire19[(2'h3):(2'h3)] ?
                  $signed(reg35) : (!wire33)))));
            end
        end
      else
        begin
          reg35 <= $signed($signed(((~^$signed((8'ha0))) ^~ ((wire22 ?
                  wire33 : wire34) ?
              reg36[(4'h9):(3'h5)] : $unsigned(wire33)))));
          reg36 <= (-wire33);
          reg37 <= reg28;
        end
      if (reg38[(2'h3):(2'h2)])
        begin
          reg39 <= ((~|$signed((&(wire33 > reg29)))) ?
              wire19 : wire20[(2'h3):(2'h2)]);
          reg40 <= (reg28 ^ (!$unsigned(($signed(wire23) ^~ (reg31 >> reg26)))));
          reg41 <= $signed(reg25);
          if ((wire20[(1'h0):(1'h0)] ?
              (~^reg28) : (&$signed((~^(wire21 && reg40))))))
            begin
              reg42 <= reg37[(3'h6):(1'h1)];
              reg43 <= (^~$unsigned(reg25[(4'ha):(4'h8)]));
            end
          else
            begin
              reg42 <= (reg31 ?
                  reg27[(3'h4):(1'h1)] : $unsigned((~$unsigned($signed(wire23)))));
              reg43 <= $unsigned(reg41);
              reg44 <= reg32;
              reg45 <= wire20;
              reg46 <= (wire24[(4'h9):(2'h2)] | (+$unsigned(wire20[(1'h1):(1'h1)])));
            end
        end
      else
        begin
          if ({($signed((&(~|reg27))) - {($signed((8'hb6)) ?
                      $signed(wire23) : {(8'hbd), reg25}),
                  reg40[(2'h3):(1'h1)]})})
            begin
              reg39 <= $unsigned($signed((~(reg38[(2'h2):(1'h0)] ?
                  reg32[(2'h2):(1'h0)] : reg32))));
              reg40 <= (8'h9f);
              reg41 <= wire23;
              reg42 <= ($signed((((reg27 ?
                      reg43 : reg42) > ((8'hb9) >> reg36)) ?
                  reg41 : (wire33[(4'he):(3'h5)] != reg41[(4'ha):(2'h2)]))) >>> reg38[(3'h5):(3'h5)]);
            end
          else
            begin
              reg39 <= reg28;
              reg40 <= ((&((~|(~&wire34)) ?
                  ((reg46 ^~ wire21) <= (&reg37)) : $unsigned((reg39 >= wire20)))) ~^ ($unsigned((8'hb4)) ?
                  (~|(reg41[(2'h3):(1'h1)] ?
                      reg40[(3'h7):(3'h7)] : $unsigned(reg38))) : (~&(8'hb8))));
              reg41 <= $unsigned((|{$signed(reg31)}));
              reg42 <= wire34;
            end
          reg43 <= $unsigned(wire33[(1'h1):(1'h0)]);
          reg44 <= $unsigned((+reg25));
          reg45 <= $signed($signed((~$signed(reg27[(3'h7):(3'h6)]))));
          reg46 <= {{reg38[(2'h3):(2'h3)]}};
        end
    end
  assign wire47 = $signed($unsigned((wire20 ?
                      (reg46[(1'h1):(1'h1)] >> $unsigned(reg40)) : reg35[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      if (wire33)
        begin
          reg48 <= reg37;
          reg49 <= $unsigned(((wire20 <= (~&reg32)) ?
              (reg38[(3'h6):(1'h1)] || (reg31 ?
                  (reg36 ^~ reg31) : reg44[(4'h8):(2'h3)])) : $signed($signed(reg48[(3'h7):(3'h7)]))));
        end
      else
        begin
          if ({$unsigned((+$unsigned(((8'ha1) ? (7'h42) : (8'hbc)))))})
            begin
              reg48 <= (^~wire34);
              reg49 <= (!{reg38[(3'h6):(3'h6)]});
              reg50 <= reg37;
              reg51 <= {reg50, reg25};
            end
          else
            begin
              reg48 <= (!(~&((|reg31[(2'h2):(2'h2)]) >= reg25)));
            end
          reg52 <= $signed((((-wire33[(3'h7):(1'h0)]) ?
                  reg49[(1'h1):(1'h1)] : (|{reg42, reg30})) ?
              $unsigned((^wire33)) : {((8'hbc) ? {wire22} : (!reg36))}));
          reg53 <= $signed(wire19[(4'hc):(3'h7)]);
          if (($signed((|$unsigned((^~reg32)))) ?
              $unsigned($signed({reg42})) : wire47[(3'h4):(2'h2)]))
            begin
              reg54 <= reg50[(1'h1):(1'h1)];
              reg55 <= ($unsigned(((^~(reg31 ? wire33 : (8'hbb))) ?
                      ({reg45, reg41} ?
                          reg42[(4'hb):(1'h0)] : (8'hbf)) : (^(!reg36)))) ?
                  ($signed($signed((!reg28))) || (reg32 ?
                      {(wire23 << (8'hbf))} : ({reg31,
                          (8'hb4)} >>> $signed(reg54)))) : $unsigned((reg51[(3'h4):(1'h0)] >>> reg35)));
            end
          else
            begin
              reg54 <= (-({reg31, $signed((~|reg52))} ?
                  $unsigned($signed((reg52 ? wire20 : (8'haa)))) : {reg37,
                      $signed((wire20 ? reg49 : reg38))}));
              reg55 <= (!reg35[(1'h1):(1'h0)]);
              reg56 <= {reg29};
            end
        end
    end
  assign wire57 = (($signed(reg41[(2'h3):(1'h0)]) ?
                          $unsigned((~$unsigned(reg49))) : $unsigned(((wire34 * reg29) && $signed(reg36)))) ?
                      (~&$signed((reg42[(3'h6):(1'h1)] ?
                          (~^reg35) : $signed(reg43)))) : reg46[(3'h4):(1'h1)]);
  always
    @(posedge clk) begin
      reg58 <= (~^(reg26[(2'h3):(1'h0)] ?
          $unsigned($signed({reg49, reg31})) : $unsigned(($unsigned(reg53) ?
              (reg46 - reg26) : (wire57 << reg53)))));
      if ((((&$signed($signed(reg48))) >> {(~|(reg36 ? reg35 : wire19))}) ?
          {(+(~(reg45 + wire21))),
              (7'h44)} : $unsigned(($signed($unsigned(wire47)) - ((reg36 ?
              reg53 : wire21) <<< (~reg52))))))
        begin
          reg59 <= ((8'hb5) && $signed($signed($unsigned((reg37 || reg41)))));
          reg60 <= $signed(reg36[(2'h3):(2'h2)]);
          reg61 <= $unsigned((reg59[(1'h0):(1'h0)] ?
              reg43[(4'ha):(2'h3)] : (((reg48 ? (8'hb7) : reg41) ?
                  (reg58 ? reg30 : reg49) : reg35) >> $signed(wire20))));
        end
      else
        begin
          reg59 <= reg53;
          if ((reg42 << (8'hba)))
            begin
              reg60 <= $signed((-$signed(((+reg48) & {reg52, reg37}))));
            end
          else
            begin
              reg60 <= $unsigned($signed(reg38));
              reg61 <= $unsigned((^~$signed(((reg53 ?
                  reg51 : reg35) && (wire22 > reg41)))));
              reg62 <= $unsigned($unsigned($signed((~^{wire23, reg49}))));
              reg63 <= ((8'ha6) ?
                  $signed(reg31) : (~((reg46 ?
                      ((8'hb8) >>> reg56) : reg40[(4'h9):(2'h3)]) || (-$signed(reg35)))));
              reg64 <= $unsigned(wire33[(4'h8):(1'h1)]);
            end
          reg65 <= reg27[(3'h4):(3'h4)];
          if ((reg53[(4'ha):(2'h2)] & (-$unsigned((|(reg30 ?
              reg46 : wire57))))))
            begin
              reg66 <= ($signed((~&(~|(wire34 >>> reg54)))) ?
                  $unsigned(($signed((reg43 <= reg60)) <<< {reg46})) : (~(8'haf)));
              reg67 <= $signed((&$unsigned(reg53[(1'h0):(1'h0)])));
              reg68 <= $signed($unsigned(wire33));
            end
          else
            begin
              reg66 <= $unsigned(wire19);
              reg67 <= (((reg27[(3'h4):(1'h0)] ?
                          (+reg25[(4'hb):(1'h0)]) : (8'h9d)) ?
                      $signed((reg55 ?
                          reg36[(3'h6):(3'h5)] : $unsigned(reg63))) : (reg42 | (wire21 ?
                          reg54 : reg27))) ?
                  $signed($signed($signed((reg41 ^ reg40)))) : (~&{$signed((^~reg54)),
                      wire47[(4'he):(3'h7)]}));
              reg68 <= $unsigned(wire47[(4'hf):(4'h8)]);
            end
        end
      reg69 <= $unsigned(reg49);
      reg70 <= (!reg53);
      if (((~&((8'h9e) ? reg30 : (~^reg65))) ?
          ((8'hb3) ?
              {$unsigned((~|reg25)),
                  (reg54[(1'h0):(1'h0)] ?
                      $unsigned(reg53) : {(8'h9f)})} : $signed({(reg55 || reg25),
                  $unsigned(wire47)})) : reg31[(2'h2):(1'h1)]))
        begin
          reg71 <= (8'ha7);
          reg72 <= wire22[(1'h0):(1'h0)];
          if ((!$unsigned(reg36)))
            begin
              reg73 <= {reg48};
            end
          else
            begin
              reg73 <= {(8'ha9)};
            end
        end
      else
        begin
          reg71 <= reg42;
          if ({$signed(reg56)})
            begin
              reg72 <= $signed(reg39[(1'h0):(1'h0)]);
            end
          else
            begin
              reg72 <= reg63[(5'h10):(4'ha)];
              reg73 <= (&$signed((^$unsigned($signed(reg61)))));
              reg74 <= (~&((reg25 ?
                      ($unsigned(reg73) | reg60) : wire23[(3'h4):(1'h1)]) ?
                  $unsigned(reg59[(3'h5):(2'h2)]) : (wire22 >> ((reg72 ?
                          reg32 : reg68) ?
                      reg52[(3'h5):(2'h3)] : reg55))));
              reg75 <= (($signed({$signed(reg66)}) ^~ $signed(reg55)) > $unsigned(((reg28[(4'hf):(4'h8)] ?
                  {(8'hbe),
                      (8'hb1)} : (-reg25)) ^ ((^(8'hbb)) + $unsigned(reg67)))));
            end
          reg76 <= reg26[(2'h3):(2'h2)];
          reg77 <= (($unsigned(reg56) ? reg54[(1'h1):(1'h1)] : reg68) ?
              $unsigned(reg45) : (~$unsigned(wire34)));
        end
    end
  assign wire78 = (-$signed($unsigned($unsigned(((8'h9d) + reg74)))));
  assign wire79 = $signed({($unsigned(reg41[(3'h6):(3'h6)]) ~^ ((+reg54) == reg49[(4'ha):(1'h0)]))});
  assign wire80 = reg26;
endmodule
