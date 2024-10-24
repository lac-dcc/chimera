module top #(parameter param113 = (7'h40)) (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire3;
  wire signed [(4'h8):(1'h0)] wire112;
  wire signed [(2'h2):(1'h0)] wire111;
  wire signed [(3'h7):(1'h0)] wire110;
  wire signed [(3'h4):(1'h0)] wire109;
  wire signed [(5'h11):(1'h0)] wire107;
  wire [(5'h13):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire35;
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire107,
                 wire38,
                 wire37,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire35,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = {wire4[(4'hd):(4'ha)],
                     ($signed(wire3[(3'h6):(3'h6)]) ^~ {$unsigned((wire3 * wire2))})};
  assign wire6 = (((~^wire5) ?
                     wire3[(3'h6):(2'h2)] : $signed(($unsigned(wire1) < $unsigned(wire4)))) ^~ wire5);
  assign wire7 = $signed({(~^wire0), wire1[(3'h4):(1'h0)]});
  assign wire8 = {wire1[(4'hb):(1'h0)]};
  assign wire9 = (wire1 >>> {(8'hb6)});
  assign wire10 = wire8;
  assign wire11 = $signed($signed((((wire9 ? wire3 : (8'haf)) ?
                          {wire8, wire9} : $signed(wire3)) ?
                      {wire5[(4'hc):(4'h9)]} : ($unsigned(wire2) ?
                          $signed(wire0) : wire9))));
  assign wire12 = (8'h9d);
  assign wire13 = $signed(wire6[(2'h3):(1'h0)]);
  assign wire14 = ($unsigned({wire3, {$signed(wire10)}}) ?
                      $unsigned(wire9) : wire11);
  module15 #() modinst36 (.y(wire35), .wire18(wire6), .wire16(wire2), .wire17(wire1), .clk(clk), .wire20(wire8), .wire19(wire5));
  assign wire37 = ($unsigned((|wire4[(4'h8):(1'h1)])) ?
                      $unsigned(wire14[(3'h4):(1'h1)]) : (^~$unsigned((8'ha1))));
  assign wire38 = $unsigned($signed({(~wire5[(1'h1):(1'h1)])}));
  module39 #() modinst108 (.wire43(wire4), .y(wire107), .wire42(wire38), .wire40(wire7), .clk(clk), .wire41(wire5));
  assign wire109 = (~^(~(^~(wire11[(3'h6):(2'h3)] ? (8'hbb) : wire13))));
  assign wire110 = wire35[(2'h2):(1'h1)];
  assign wire111 = wire7[(4'h8):(1'h1)];
  assign wire112 = $signed(wire107[(3'h4):(3'h4)]);
endmodule

module module39
#(parameter param106 = (8'ha3))
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire43;
  input wire [(5'h13):(1'h0)] wire42;
  input wire [(5'h11):(1'h0)] wire41;
  input wire [(4'hd):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire105;
  wire signed [(4'ha):(1'h0)] wire104;
  wire [(5'h15):(1'h0)] wire102;
  wire [(4'hf):(1'h0)] wire82;
  wire signed [(5'h11):(1'h0)] wire81;
  wire signed [(4'hc):(1'h0)] wire80;
  wire [(5'h10):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire65;
  wire [(5'h12):(1'h0)] wire63;
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire102,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire77,
                 wire76,
                 wire67,
                 wire66,
                 wire65,
                 wire63,
                 reg78,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  module44 #() modinst64 (.wire49(wire42), .wire47(wire43), .clk(clk), .y(wire63), .wire46(wire41), .wire48(wire40), .wire45((8'hb2)));
  assign wire65 = wire42;
  assign wire66 = ((wire40[(3'h5):(1'h1)] < (~|$unsigned({wire40,
                      (8'hac)}))) >> (wire65[(4'hd):(1'h0)] ?
                      (+((wire63 != wire65) ?
                          $unsigned((8'hbc)) : $signed((8'ha6)))) : (~|(wire40 ?
                          {wire40} : (wire42 >> wire65)))));
  assign wire67 = ({(~|(|$signed(wire63)))} ?
                      (((~|(~^wire40)) ?
                          ($signed(wire66) ?
                              (8'ha3) : ((8'hb7) ^ wire65)) : wire40[(4'hc):(3'h6)]) >>> {wire41[(4'he):(2'h3)]}) : (((~$signed(wire41)) ?
                              $signed(wire65[(3'h5):(1'h0)]) : wire65) ?
                          (($signed(wire40) < (~wire43)) ?
                              $signed((wire40 ?
                                  wire63 : wire42)) : (wire63[(4'hb):(4'hb)] ?
                                  {wire42,
                                      wire42} : (wire43 - wire41))) : $unsigned({$signed(wire40),
                              (wire40 ? wire65 : wire63)})));
  always
    @(posedge clk) begin
      if ($unsigned(($unsigned(wire41) ?
          (((!(8'hb0)) | wire67[(4'h9):(3'h6)]) ?
              $signed((wire65 ?
                  wire41 : (7'h42))) : wire42[(2'h2):(1'h1)]) : wire65[(5'h14):(4'ha)])))
        begin
          reg68 <= wire63;
          if (wire67)
            begin
              reg69 <= ({{(~(~&wire40))}} | wire43);
              reg70 <= $unsigned({((^~wire63) ?
                      (+wire42) : ((&(8'hb3)) - $unsigned(reg69))),
                  wire65});
            end
          else
            begin
              reg69 <= $unsigned(reg69);
              reg70 <= wire66[(1'h0):(1'h0)];
              reg71 <= wire67[(1'h0):(1'h0)];
              reg72 <= {reg70, wire66[(2'h2):(1'h1)]};
            end
          reg73 <= {(wire42 <= wire42[(3'h4):(2'h2)])};
          reg74 <= $unsigned((({(8'ha0),
              ((8'ha8) >> wire41)} >= ((8'ha4) <= (~&wire65))) == $unsigned($signed((~|reg70)))));
        end
      else
        begin
          reg68 <= $signed((((~|(wire43 + wire43)) == ((&wire42) ?
                  reg69[(4'ha):(2'h3)] : ((8'ha7) ? (8'hb8) : reg73))) ?
              $unsigned(((reg71 ? wire66 : reg73) << (wire43 ?
                  reg68 : reg74))) : {(+(|reg69))}));
        end
    end
  always
    @(posedge clk) begin
      reg75 <= reg74;
    end
  assign wire76 = $signed(wire43[(4'h9):(3'h4)]);
  assign wire77 = $unsigned($signed(reg73));
  always
    @(posedge clk) begin
      reg78 <= reg75[(3'h5):(1'h0)];
    end
  assign wire79 = ($signed(wire42[(5'h13):(4'hb)]) ^ (~(wire42 ?
                      reg70[(4'ha):(4'h8)] : $signed(wire42[(4'hb):(1'h1)]))));
  assign wire80 = {$unsigned((8'hb7)), (wire42 ^ (reg72 > {(&wire65)}))};
  assign wire81 = (($signed(($signed(reg75) ?
                      (wire80 ?
                          reg74 : reg69) : (&reg68))) == {((~wire67) ~^ reg75)}) * $unsigned(wire41));
  assign wire82 = $signed(reg78);
  module83 #() modinst103 (wire102, clk, reg73, reg72, wire40, wire81);
  assign wire104 = (8'hb6);
  assign wire105 = $unsigned(((((^(8'ha6)) ?
                               $signed(wire41) : $unsigned(reg70)) ?
                           wire41 : $unsigned(wire40)) ?
                       wire67[(3'h6):(2'h3)] : reg70));
endmodule

module module15
#(parameter param33 = (|((({(8'hb4)} ^~ ((8'haa) != (8'hb1))) <= ((^~(8'hb4)) ? ((8'haf) <<< (8'hb8)) : {(8'ha6)})) <<< (~|{((8'hbc) >> (8'hae))}))), 
parameter param34 = param33)
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire20;
  input wire [(2'h3):(1'h0)] wire19;
  input wire signed [(3'h5):(1'h0)] wire18;
  input wire signed [(3'h7):(1'h0)] wire17;
  input wire [(4'ha):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire30;
  wire signed [(4'he):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  wire signed [(4'h8):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(4'ha):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire21;
  assign y = {wire32,
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
                 (1'h0)};
  assign wire21 = $unsigned(($signed(wire18[(2'h2):(2'h2)]) && (+wire16)));
  assign wire22 = {(wire19[(2'h3):(1'h0)] ?
                          $unsigned($unsigned((wire21 ^~ wire16))) : (($signed(wire19) > {wire21,
                                  wire16}) ?
                              ((~wire18) != (wire20 ?
                                  wire18 : wire21)) : wire16[(1'h1):(1'h1)]))};
  assign wire23 = wire19;
  assign wire24 = {wire22[(3'h5):(2'h3)], (~(|(~((8'ha6) && (8'ha0)))))};
  assign wire25 = wire22[(4'h9):(3'h6)];
  assign wire26 = {$signed($signed(($unsigned(wire19) ?
                          (&wire18) : wire24[(1'h1):(1'h1)])))};
  assign wire27 = ((|($signed($unsigned(wire19)) ?
                      (~^wire17[(1'h1):(1'h1)]) : (!(wire26 ?
                          wire20 : wire23)))) > wire26);
  assign wire28 = ($unsigned($signed(wire19[(1'h0):(1'h0)])) <= ((wire19[(1'h1):(1'h0)] ?
                          (wire25[(2'h2):(1'h1)] ?
                              (wire27 ^~ wire19) : $unsigned(wire20)) : wire17) ?
                      $signed(wire19[(1'h0):(1'h0)]) : $signed(wire24)));
  assign wire29 = (wire24[(2'h3):(1'h1)] ?
                      $unsigned(wire22) : $signed($signed((~^((8'hbc) > wire21)))));
  assign wire30 = (-$signed({wire23[(5'h13):(5'h12)],
                      ((wire16 ? wire25 : wire18) ?
                          wire16[(4'h8):(3'h5)] : $unsigned(wire17))}));
  assign wire31 = wire18[(1'h1):(1'h1)];
  assign wire32 = wire27;
endmodule

module module83  (y, clk, wire87, wire86, wire85, wire84);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire87;
  input wire [(4'hd):(1'h0)] wire86;
  input wire [(4'ha):(1'h0)] wire85;
  input wire signed [(5'h11):(1'h0)] wire84;
  wire [(3'h7):(1'h0)] wire101;
  wire [(4'hd):(1'h0)] wire100;
  wire [(3'h7):(1'h0)] wire99;
  wire [(3'h5):(1'h0)] wire98;
  wire signed [(5'h10):(1'h0)] wire95;
  wire signed [(4'hc):(1'h0)] wire94;
  wire signed [(5'h12):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire92;
  wire signed [(4'hb):(1'h0)] wire91;
  wire [(4'hc):(1'h0)] wire90;
  wire signed [(3'h6):(1'h0)] wire89;
  wire [(4'hc):(1'h0)] wire88;
  reg signed [(4'hc):(1'h0)] reg97 = (1'h0);
  reg [(3'h7):(1'h0)] reg96 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire88 = wire87;
  assign wire89 = ($unsigned($signed($unsigned({wire88,
                      wire85}))) <= (wire86[(2'h3):(2'h2)] ?
                      wire87 : (^wire86)));
  assign wire90 = $unsigned({wire86[(3'h5):(1'h1)]});
  assign wire91 = (($signed((wire87[(4'hd):(3'h5)] <= $unsigned(wire86))) || ($signed($unsigned(wire84)) > wire84)) ?
                      wire88[(3'h5):(1'h1)] : $unsigned(wire84));
  assign wire92 = $unsigned(({$unsigned({wire90, wire88}),
                      $signed(((8'h9c) < wire89))} ^~ (~(~|wire88[(4'hc):(2'h3)]))));
  assign wire93 = wire85[(3'h7):(2'h2)];
  assign wire94 = wire84;
  assign wire95 = $unsigned($unsigned((-wire94[(3'h5):(2'h3)])));
  always
    @(posedge clk) begin
      reg96 <= (($signed($signed({(8'hbb), (8'ha0)})) ?
          {$signed($signed(wire91))} : (wire94[(1'h0):(1'h0)] * (8'h9d))) << (wire87[(1'h1):(1'h1)] ?
          wire86[(2'h2):(1'h0)] : $unsigned(wire94)));
    end
  always
    @(posedge clk) begin
      reg97 <= ({$signed(wire89[(3'h5):(2'h3)])} ^ ({wire84[(4'hb):(2'h2)]} ?
          wire94 : ((8'ha7) >>> ($signed((8'ha3)) ?
              (wire93 ? wire87 : wire85) : wire93))));
    end
  assign wire98 = wire84;
  assign wire99 = (wire84[(4'hf):(4'hb)] * ((wire93 == {(wire93 <<< (8'ha1))}) & wire91[(3'h5):(2'h3)]));
  assign wire100 = wire89;
  assign wire101 = $signed(($signed(((8'hb9) <<< (+wire95))) >> (((wire91 ?
                           (8'h9d) : wire84) ?
                       wire87 : wire92[(5'h12):(4'ha)]) ^~ ({wire98, wire90} ?
                       (wire99 <<< wire99) : (wire94 ? wire100 : wire93)))));
endmodule

module module44
#(parameter param62 = (({(+((8'hb9) ? (8'hb7) : (8'hb7))), (((7'h42) <= (8'hab)) ? ((8'had) != (8'hb0)) : ((8'hae) ? (8'hac) : (7'h41)))} <= {((^~(8'ha9)) ? ((8'hb0) ? (8'had) : (8'hb6)) : (8'hbb)), (-((8'h9d) ? (8'hb9) : (8'hae)))}) == (|({(~^(8'ha8))} > {((7'h42) * (7'h43)), {(8'haf), (8'ha1)}}))))
(y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire49;
  input wire signed [(4'ha):(1'h0)] wire48;
  input wire signed [(5'h13):(1'h0)] wire47;
  input wire signed [(5'h11):(1'h0)] wire46;
  input wire [(2'h2):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire59;
  wire [(2'h2):(1'h0)] wire58;
  wire signed [(5'h10):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire55;
  wire signed [(3'h6):(1'h0)] wire54;
  wire signed [(2'h2):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire signed [(4'hc):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire50;
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 reg61,
                 reg60,
                 (1'h0)};
  assign wire50 = $unsigned(wire45);
  assign wire51 = ((&wire49[(2'h3):(2'h2)]) ? wire46 : wire48[(4'h9):(1'h0)]);
  assign wire52 = (|wire50[(3'h6):(3'h5)]);
  assign wire53 = $unsigned(wire51[(2'h3):(1'h1)]);
  assign wire54 = $signed($signed((wire47 || (wire47 ?
                      (wire46 * (8'ha9)) : {wire45, wire52}))));
  assign wire55 = (+($signed(({wire52} ? $signed(wire45) : (~&wire46))) ?
                      (~^wire53) : wire52[(2'h2):(1'h1)]));
  assign wire56 = wire48[(3'h7):(3'h7)];
  assign wire57 = {(8'hab)};
  assign wire58 = $signed(wire50);
  assign wire59 = wire52;
  always
    @(posedge clk) begin
      reg60 <= (-wire50[(3'h6):(2'h2)]);
      reg61 <= wire57[(3'h5):(3'h5)];
    end
endmodule
