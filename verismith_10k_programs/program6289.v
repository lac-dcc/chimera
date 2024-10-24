module top
#(parameter param82 = (+((({(8'hbd), (8'hbf)} & ((8'ha8) ? (8'hb0) : (8'ha5))) ~^ (~^((8'ha6) ? (7'h40) : (8'hb6)))) * (({(8'ha0)} & ((8'hb9) ? (7'h41) : (8'ha6))) ? (((8'hac) ? (8'hac) : (8'ha7)) ? {(8'hb1)} : ((8'haa) == (8'had))) : ((-(8'ha3)) ~^ ((8'hb4) ? (8'hbc) : (8'ha3)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire81;
  wire signed [(4'h8):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire78;
  wire signed [(3'h5):(1'h0)] wire77;
  wire signed [(2'h3):(1'h0)] wire68;
  wire signed [(5'h14):(1'h0)] wire67;
  wire signed [(2'h3):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire64;
  wire [(4'hb):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(4'hd):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg69 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire68,
                 wire67,
                 wire66,
                 wire64,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 (1'h0)};
  assign wire5 = (!(({(wire2 ? wire1 : wire3),
                     (wire4 ?
                         wire4 : wire3)} <<< (8'hab)) < (wire0[(3'h6):(3'h6)] ?
                     $unsigned(wire1[(1'h0):(1'h0)]) : wire0)));
  assign wire6 = $signed((~^{$signed(((8'ha7) ? wire5 : wire4)),
                     (~|$signed(wire5))}));
  assign wire7 = ($unsigned((^~(7'h40))) < (((|$unsigned(wire5)) ?
                         $unsigned((wire1 ?
                             wire0 : wire5)) : wire6[(4'ha):(4'ha)]) ?
                     (wire6 ?
                         $signed((~&wire3)) : $unsigned((wire3 <<< wire5))) : wire4));
  assign wire8 = $unsigned((!$unsigned((^(&wire3)))));
  assign wire9 = $signed(((($signed(wire7) == (wire1 ?
                         wire6 : wire6)) + $unsigned(wire8[(4'hd):(4'h9)])) ?
                     $signed((~&$signed(wire5))) : wire5));
  assign wire10 = (+$signed((~|(&(wire4 < wire7)))));
  assign wire11 = {((wire3[(3'h5):(2'h3)] ? wire0 : (&wire5[(4'hc):(3'h7)])) ?
                          $signed($unsigned($signed(wire5))) : wire5[(1'h1):(1'h1)])};
  module12 #() modinst65 (.clk(clk), .wire16(wire7), .wire13(wire4), .wire14(wire6), .y(wire64), .wire15(wire1));
  assign wire66 = wire6;
  assign wire67 = $signed($unsigned({((wire2 > (8'hb1)) ? (7'h43) : wire2)}));
  assign wire68 = (^~$unsigned((8'hb6)));
  always
    @(posedge clk) begin
      reg69 <= wire64;
      if (($signed({$signed(wire7), ((~&wire2) ~^ reg69)}) ?
          (&(-((wire67 >> wire68) ?
              (wire9 ?
                  wire6 : wire67) : wire1))) : {(wire0 ^~ $signed($signed((8'hb4)))),
              wire4[(5'h10):(3'h6)]}))
        begin
          reg70 <= wire9;
        end
      else
        begin
          if ($unsigned($signed(({wire7[(4'h8):(3'h5)]} ?
              ($signed((8'ha6)) ?
                  (wire67 ? wire3 : wire67) : (wire66 >> wire10)) : ({reg69,
                      wire4} ?
                  (wire7 ? wire1 : wire7) : wire9[(1'h0):(1'h0)])))))
            begin
              reg70 <= $signed((~(((wire11 ? (8'hb4) : wire10) == (wire3 ?
                  wire6 : wire4)) >= $signed({wire9, wire8}))));
            end
          else
            begin
              reg70 <= (({{(8'hb4), wire67},
                      ((wire3 ? wire0 : wire8) ^~ $unsigned(reg69))} ?
                  (+(8'ha9)) : (wire8 - ((wire5 | wire66) ?
                      wire68[(1'h0):(1'h0)] : reg69))) != (&(~{((7'h44) || wire8)})));
            end
          reg71 <= (-(~|((^{wire7, wire7}) == wire68)));
          if (wire68)
            begin
              reg72 <= {(-(($unsigned(wire68) << (wire2 ?
                      wire68 : (8'hbb))) | $signed({wire64}))),
                  wire66};
              reg73 <= wire64[(3'h6):(1'h0)];
              reg74 <= (~(^reg70));
            end
          else
            begin
              reg72 <= wire66[(1'h0):(1'h0)];
              reg73 <= $unsigned(((wire7[(1'h1):(1'h0)] <= $unsigned($signed(wire7))) ?
                  (wire2 ?
                      ($unsigned(wire6) ? wire0 : wire0) : ($unsigned(wire3) ?
                          wire67 : {wire0, reg72})) : {reg69,
                      {wire66[(2'h3):(1'h0)]}}));
              reg74 <= $unsigned(($signed(reg73) ?
                  $signed((&(wire64 ? wire3 : wire7))) : (wire0 ?
                      (&(wire7 ? wire64 : wire1)) : ((wire11 ?
                              (8'hb6) : wire64) ?
                          (wire64 == wire64) : (~^wire2)))));
            end
        end
      reg75 <= $unsigned({((~{wire66, wire9}) ?
              wire64[(5'h11):(4'h9)] : (8'hb1)),
          (wire2[(2'h3):(1'h1)] ~^ (^~(wire11 ? (7'h40) : wire0)))});
      reg76 <= reg73[(2'h3):(1'h0)];
    end
  assign wire77 = (~($unsigned(wire11) == (^wire2)));
  assign wire78 = $unsigned((-(-$signed((wire64 & wire4)))));
  assign wire79 = (({($signed(wire6) ?
                          (reg76 ? reg76 : wire8) : (wire5 ?
                              reg70 : (8'hb6)))} && ($unsigned($unsigned(reg69)) < (~&$signed(wire9)))) >>> (wire8[(4'ha):(1'h0)] ?
                      wire6 : (~&($unsigned(reg75) << (reg71 ^~ wire64)))));
  assign wire80 = $unsigned({(~((wire11 ~^ wire8) ^ $signed((8'hbb))))});
  assign wire81 = ((|(~(+wire1))) + $unsigned($signed($signed(wire11))));
endmodule

module module12
#(parameter param62 = {(8'hb0), {((~(|(7'h44))) ? (~|{(8'hb5)}) : (((8'hb0) ? (8'ha9) : (8'ha8)) << ((8'h9e) ? (8'hb3) : (8'hb0)))), (~&({(8'ha3)} ? (&(8'had)) : (+(8'ha4))))}}, 
parameter param63 = (&param62))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire16;
  input wire [(3'h4):(1'h0)] wire15;
  input wire [(4'hb):(1'h0)] wire14;
  input wire [(5'h12):(1'h0)] wire13;
  wire signed [(4'h9):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire60;
  wire signed [(5'h10):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire29;
  wire signed [(3'h6):(1'h0)] wire28;
  wire signed [(3'h4):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire56,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire17 = ($signed({$signed(wire15[(1'h0):(1'h0)]),
                      (8'ha8)}) && wire15);
  assign wire18 = wire15[(1'h0):(1'h0)];
  assign wire19 = $unsigned(wire15[(1'h0):(1'h0)]);
  assign wire20 = wire14[(4'h9):(4'h8)];
  assign wire21 = $unsigned(((wire18 ?
                      (~^(wire13 | (7'h43))) : ($signed((7'h43)) <<< (wire20 & wire18))) || wire15[(1'h0):(1'h0)]));
  assign wire22 = wire19;
  assign wire23 = (wire15 & wire18);
  always
    @(posedge clk) begin
      reg24 <= wire14;
      reg25 <= (~&$unsigned((8'h9f)));
      reg26 <= (wire20[(2'h3):(1'h0)] ~^ wire16[(3'h5):(1'h1)]);
    end
  assign wire27 = {{$signed((wire20[(1'h0):(1'h0)] ?
                              wire14[(3'h4):(3'h4)] : {reg26, wire13})),
                          wire23}};
  assign wire28 = wire15[(1'h0):(1'h0)];
  assign wire29 = $unsigned((~|wire28));
  assign wire30 = $signed((!reg25[(2'h2):(2'h2)]));
  module31 #() modinst57 (wire56, clk, wire19, wire20, wire23, wire28);
  assign wire58 = (|(8'hab));
  assign wire59 = ($signed({(wire15 <= (wire14 + wire20)),
                      {(wire20 ? reg26 : wire20)}}) <= ((wire17 ?
                      ($unsigned(wire58) ?
                          {wire29} : $unsigned((8'h9e))) : ((wire56 > reg24) <= (wire13 ?
                          (7'h44) : wire15))) << (+($unsigned(reg25) ?
                      ((8'hbf) ? wire18 : wire15) : $signed(wire17)))));
  assign wire60 = ((wire59[(1'h0):(1'h0)] != ((~reg25) + wire15[(1'h1):(1'h1)])) ?
                      wire56[(3'h7):(3'h4)] : wire13);
  assign wire61 = (wire56 ?
                      ((wire17 * (-(-wire27))) ?
                          $unsigned((((8'hab) ? wire28 : wire30) - (wire15 ?
                              (7'h41) : (8'hac)))) : $unsigned(reg25)) : wire20);
endmodule

module module31  (y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire35;
  input wire [(3'h4):(1'h0)] wire34;
  input wire [(3'h6):(1'h0)] wire33;
  input wire [(2'h3):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire53;
  wire [(3'h5):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire41;
  wire [(4'ha):(1'h0)] wire40;
  wire signed [(4'he):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire37;
  wire signed [(4'he):(1'h0)] wire36;
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(4'he):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire45,
                 wire44,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg43,
                 (1'h0)};
  assign wire36 = (~$unsigned(((wire34 ?
                          (wire32 ? wire35 : (8'hb3)) : wire34[(1'h1):(1'h0)]) ?
                      ($signed(wire35) ?
                          $signed((8'ha0)) : (+wire32)) : $signed($signed(wire35)))));
  assign wire37 = ((|$unsigned(($unsigned(wire35) ?
                      (~^(8'hbf)) : $unsigned(wire32)))) >> ($unsigned(((wire35 >> wire33) ?
                      {wire35, wire33} : (wire32 ?
                          wire32 : wire33))) + wire34));
  assign wire38 = (~&wire35[(1'h0):(1'h0)]);
  assign wire39 = $signed({wire32[(1'h0):(1'h0)],
                      {(^~(wire35 >= wire37)), $signed({wire34, (8'hb1)})}});
  assign wire40 = $signed((wire37 >>> ({((8'hb9) ?
                          wire39 : wire34)} - $unsigned(((8'hb6) || wire35)))));
  assign wire41 = $signed($signed((8'hb7)));
  assign wire42 = $unsigned($unsigned(wire39[(3'h5):(1'h0)]));
  always
    @(posedge clk) begin
      reg43 <= $unsigned($unsigned(((((8'hb6) ? wire34 : wire36) ?
          ((8'haf) ? wire41 : wire42) : wire35) <= (8'ha8))));
    end
  assign wire44 = (wire39[(4'ha):(4'ha)] ?
                      ({$signed(wire35), wire37} ?
                          (~|{(wire41 ?
                                  wire41 : wire32)}) : (&$unsigned($unsigned(wire41)))) : $unsigned((8'ha0)));
  assign wire45 = ({reg43[(1'h1):(1'h0)], $signed(reg43[(4'h9):(3'h5)])} ?
                      wire40 : ({{(+wire34)},
                          (wire35[(1'h0):(1'h0)] ?
                              wire38[(3'h4):(2'h3)] : (+wire36))} != (wire38[(1'h1):(1'h0)] ?
                          $signed((^(8'hbd))) : reg43[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg46 <= ($unsigned((reg43 && $signed((wire45 ?
          wire33 : wire38)))) >= $signed(($unsigned({wire37, wire40}) ?
          wire32 : $signed($unsigned(wire39)))));
      if ($signed($unsigned(wire36[(2'h3):(1'h0)])))
        begin
          reg47 <= wire42[(3'h4):(3'h4)];
          reg48 <= wire40;
          reg49 <= (~^(~^(~reg47)));
          reg50 <= {$signed($signed((wire37[(3'h5):(1'h0)] ?
                  (8'hba) : (&wire36)))),
              {(((wire38 ? wire35 : reg46) ?
                          (wire39 ? (8'hb5) : wire37) : wire36) ?
                      reg48[(4'ha):(2'h3)] : (|(wire38 ? reg47 : wire38))),
                  ((+(wire42 != wire37)) < reg49[(1'h1):(1'h1)])}};
        end
      else
        begin
          if (wire40[(2'h3):(1'h0)])
            begin
              reg47 <= wire32[(1'h0):(1'h0)];
            end
          else
            begin
              reg47 <= (((-(((8'hab) <= wire39) ^ (wire45 && wire34))) <= {{$signed(wire33)}}) ?
                  (((+$unsigned((8'ha7))) + (+(wire45 ?
                      (8'hb5) : (8'hac)))) != ((reg47 ?
                      wire39 : reg47[(3'h6):(1'h1)]) ~^ reg48)) : $unsigned({(wire45 ?
                          $signed(wire41) : $unsigned(wire32))}));
            end
        end
      reg51 <= wire39[(4'hd):(3'h5)];
      reg52 <= (8'hb2);
    end
  assign wire53 = wire41;
  assign wire54 = wire36;
  assign wire55 = wire32[(2'h3):(1'h1)];
endmodule
