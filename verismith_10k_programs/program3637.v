module top
#(parameter param114 = {(-({((8'hae) - (8'hbe)), {(8'hb9)}} ? (|((7'h44) >= (8'ha6))) : (+((8'haf) ? (8'hbb) : (8'h9f))))), {((!{(8'ha5)}) > ((&(8'haf)) ? (!(8'h9c)) : ((8'hbf) >>> (8'hb0))))}}, 
parameter param115 = ((8'hbc) ? {(param114 ? (~|param114) : {(param114 ? param114 : param114), {param114, param114}})} : param114))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire108;
  wire [(4'h9):(1'h0)] wire106;
  wire signed [(4'hb):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire10;
  wire [(4'hf):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  reg signed [(5'h13):(1'h0)] reg113 = (1'h0);
  reg [(4'he):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg109 = (1'h0);
  assign y = {wire108,
                 wire106,
                 wire28,
                 wire27,
                 wire26,
                 wire24,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire5 = wire0[(2'h2):(1'h1)];
  assign wire6 = ($unsigned(($unsigned($signed(wire4)) ? wire1 : wire2)) ?
                     $unsigned(($unsigned(wire3[(4'hb):(3'h4)]) ?
                         wire1[(2'h3):(1'h1)] : wire0[(4'hd):(3'h5)])) : {$signed($signed($signed((8'hbc))))});
  assign wire7 = (($unsigned(((wire6 << wire4) ? wire2 : (wire3 * wire4))) ?
                     (((wire1 ? wire2 : wire6) ?
                         $unsigned(wire3) : (wire4 >>> wire5)) ^~ ($unsigned(wire0) ^ $signed(wire5))) : ({(wire6 ~^ wire0),
                         wire4[(4'hd):(1'h1)]} && ((|wire4) ?
                         $signed(wire1) : (-wire3)))) <= (!wire0[(1'h0):(1'h0)]));
  assign wire8 = ((^~wire6) ?
                     wire1 : {wire4[(4'hf):(1'h0)], wire5[(2'h2):(1'h1)]});
  assign wire9 = (&(($unsigned(wire8[(1'h0):(1'h0)]) ?
                     ($unsigned((8'hab)) * (wire5 <= wire5)) : wire3) >>> (((wire1 ?
                         wire7 : wire4) ?
                     $signed(wire4) : $unsigned((8'hb2))) >>> wire4)));
  assign wire10 = wire3[(4'hc):(4'h9)];
  module11 #() modinst25 (.y(wire24), .wire15(wire10), .wire12(wire3), .wire13(wire4), .clk(clk), .wire14(wire0));
  assign wire26 = $unsigned($signed($unsigned($signed(wire4))));
  assign wire27 = {(~|wire9[(4'hf):(4'hb)])};
  assign wire28 = (wire4 ?
                      wire6[(2'h3):(2'h3)] : ({wire0[(4'he):(4'h9)]} ?
                          (~$unsigned(wire24)) : wire7));
  module29 #() modinst107 (.wire30(wire8), .y(wire106), .clk(clk), .wire32(wire28), .wire31(wire1), .wire33(wire24));
  assign wire108 = ((wire10 ?
                       $unsigned((((8'ha7) >>> wire5) >> wire9)) : $unsigned(((wire1 ?
                           (8'h9d) : wire10) ^ (wire26 - wire6)))) << (^((~$signed(wire27)) ?
                       (8'ha6) : $signed((~&wire8)))));
  always
    @(posedge clk) begin
      if (($signed((8'ha3)) ?
          ((wire2[(2'h2):(2'h2)] ?
              (-$signed(wire24)) : wire9[(1'h1):(1'h0)]) >> $unsigned(wire4)) : (wire106[(1'h1):(1'h1)] ?
              wire26[(3'h7):(3'h7)] : {$unsigned((wire27 ^ wire24)),
                  $unsigned(wire106)})))
        begin
          reg109 <= (~$unsigned((+$signed(wire24))));
          reg110 <= wire0[(4'hf):(1'h1)];
          reg111 <= (reg109 * (~($unsigned((wire10 ? wire108 : wire10)) ?
              $signed({wire27}) : {((7'h43) ? wire6 : wire0),
                  (wire108 < wire1)})));
        end
      else
        begin
          reg109 <= (-$signed({$unsigned((wire4 ? wire27 : wire10))}));
          reg110 <= (({(wire7 ? (~|wire5) : $unsigned(wire4)),
                  {(wire2 ? wire2 : wire24), ((8'ha6) ^~ reg109)}} ?
              $unsigned(wire6[(2'h3):(1'h1)]) : wire3) + wire28);
          reg111 <= ($unsigned(((+(wire10 == wire106)) ?
              (wire0[(2'h3):(2'h3)] ?
                  wire1 : {wire28,
                      wire8}) : $signed($unsigned(wire6)))) * wire3[(3'h5):(3'h5)]);
          reg112 <= ((!(^~wire3)) ?
              (^~(wire9 | $unsigned((~wire106)))) : $unsigned($unsigned((|(wire3 ?
                  wire28 : reg110)))));
          reg113 <= wire106;
        end
    end
endmodule

module module29
#(parameter param104 = (^((^(((7'h40) ? (7'h40) : (8'hb3)) ? (~&(8'hab)) : ((8'ha8) <<< (8'hb1)))) ? ((~((8'hb1) + (8'h9c))) ? ((~|(8'hb5)) ? (8'h9e) : ((8'haa) ? (8'hb5) : (8'haf))) : (((8'ha6) * (8'hae)) ? ((8'hbb) ? (8'haf) : (8'hbe)) : {(7'h43), (7'h40)})) : ((((8'hbf) ^ (8'ha0)) | ((8'hab) ? (8'hbc) : (8'hbb))) ? (~&((8'hbf) <= (8'hb3))) : ({(8'ha6)} ? ((8'ha9) << (8'ha1)) : ((7'h43) != (7'h41)))))), 
parameter param105 = (param104 ^~ ({(^{param104, param104})} && (!({param104, param104} ? (param104 ? param104 : param104) : param104)))))
(y, clk, wire30, wire31, wire32, wire33);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire30;
  input wire [(5'h15):(1'h0)] wire31;
  input wire signed [(4'hb):(1'h0)] wire32;
  input wire signed [(5'h13):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire103;
  wire [(3'h7):(1'h0)] wire102;
  wire [(3'h4):(1'h0)] wire100;
  wire [(4'hf):(1'h0)] wire90;
  wire [(4'hb):(1'h0)] wire89;
  wire [(2'h3):(1'h0)] wire88;
  wire signed [(4'he):(1'h0)] wire87;
  wire signed [(2'h2):(1'h0)] wire86;
  wire [(2'h3):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire48;
  wire signed [(4'hd):(1'h0)] wire83;
  assign y = {wire103,
                 wire102,
                 wire100,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire48,
                 wire83,
                 (1'h0)};
  module34 #() modinst49 (wire48, clk, wire33, wire32, wire30, wire31);
  module50 #() modinst84 (.clk(clk), .wire55(wire30), .y(wire83), .wire53(wire31), .wire54(wire33), .wire52(wire48), .wire51(wire32));
  assign wire85 = {(($signed((~wire48)) ?
                          {{wire31, wire30},
                              wire30} : (|$unsigned(wire83))) > (8'hb6)),
                      ((((^~wire83) ?
                              wire83[(3'h6):(2'h2)] : wire83[(2'h2):(1'h1)]) ^~ wire48) ?
                          $signed(wire48) : $signed((8'hb9)))};
  assign wire86 = (^~wire83[(3'h4):(2'h2)]);
  assign wire87 = wire48;
  assign wire88 = wire86;
  assign wire89 = wire30[(1'h1):(1'h1)];
  assign wire90 = ((|(wire87[(1'h1):(1'h0)] ?
                      ($signed(wire83) ? (&wire31) : $signed(wire48)) : {wire48,
                          wire85[(2'h3):(2'h3)]})) + ($unsigned($signed($signed((8'hba)))) ?
                      (($signed((8'hb1)) ?
                              $unsigned(wire88) : $unsigned(wire31)) ?
                          $unsigned((&wire33)) : wire88) : (8'ha6)));
  module91 #() modinst101 (wire100, clk, wire48, wire83, wire90, wire89);
  assign wire102 = (-$unsigned(($unsigned((wire89 & wire85)) | ((8'hbb) ?
                       {wire30} : wire85[(2'h2):(1'h0)]))));
  assign wire103 = $signed((((-wire85) ?
                       wire90[(2'h2):(1'h1)] : wire88[(2'h2):(1'h0)]) << $unsigned(((8'haf) <<< (8'ha9)))));
endmodule

module module11
#(parameter param22 = ((~^(7'h44)) ? (~&(((!(8'ha2)) << (-(8'ha5))) - (((8'hb5) ? (8'had) : (8'hb0)) ? ((8'hae) >>> (8'hbb)) : ((7'h41) && (8'hbc))))) : {(-(((7'h40) ? (8'ha1) : (8'hbb)) ? ((8'hba) && (8'hba)) : ((7'h41) ? (8'hac) : (8'ha4))))}), 
parameter param23 = ((-param22) - {param22}))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire15;
  input wire [(4'hc):(1'h0)] wire14;
  input wire signed [(2'h3):(1'h0)] wire13;
  input wire [(3'h6):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire16;
  assign y = {wire21, wire20, wire19, wire18, wire17, wire16, (1'h0)};
  assign wire16 = $unsigned((~|(((~wire15) ?
                          $unsigned(wire13) : (wire14 - wire12)) ?
                      (8'h9c) : {wire15[(3'h7):(3'h4)],
                          (wire13 ? wire14 : wire14)})));
  assign wire17 = $unsigned($signed(wire14));
  assign wire18 = $signed($unsigned($unsigned(((^(8'had)) > $unsigned(wire16)))));
  assign wire19 = $signed($unsigned((($signed(wire16) ^~ $unsigned(wire13)) ?
                      ($unsigned(wire14) | wire14[(4'hb):(2'h2)]) : (wire17 && $signed(wire13)))));
  assign wire20 = $unsigned(wire12);
  assign wire21 = wire16[(3'h7):(1'h0)];
endmodule

module module91  (y, clk, wire95, wire94, wire93, wire92);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire95;
  input wire signed [(4'hd):(1'h0)] wire94;
  input wire signed [(4'hf):(1'h0)] wire93;
  input wire [(4'hb):(1'h0)] wire92;
  wire signed [(5'h13):(1'h0)] wire99;
  wire [(4'h9):(1'h0)] wire98;
  wire [(3'h5):(1'h0)] wire97;
  wire signed [(4'hf):(1'h0)] wire96;
  assign y = {wire99, wire98, wire97, wire96, (1'h0)};
  assign wire96 = (~wire93[(2'h3):(1'h0)]);
  assign wire97 = (+($signed(wire92) || (|$unsigned($signed(wire94)))));
  assign wire98 = $signed((~wire94));
  assign wire99 = (+(~{{wire93, wire95[(1'h1):(1'h1)]},
                      ($signed(wire98) ? $unsigned(wire95) : wire97)}));
endmodule

module module50  (y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire55;
  input wire [(4'he):(1'h0)] wire54;
  input wire [(5'h13):(1'h0)] wire53;
  input wire [(3'h6):(1'h0)] wire52;
  input wire [(3'h7):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire82;
  wire signed [(5'h15):(1'h0)] wire81;
  wire signed [(4'h8):(1'h0)] wire80;
  wire signed [(4'ha):(1'h0)] wire79;
  wire [(4'he):(1'h0)] wire78;
  wire signed [(3'h5):(1'h0)] wire77;
  wire signed [(3'h4):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(2'h3):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire68,
                 wire67,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg56 <= (^(^~wire52));
      reg57 <= (wire51[(3'h4):(1'h0)] ? reg56 : $unsigned((&wire52)));
      reg58 <= $unsigned(($signed(((^reg56) > reg56)) ?
          ((8'hb5) ?
              $unsigned((reg56 * wire52)) : wire54) : ($unsigned(wire51) ?
              ((!wire51) ? $unsigned((8'h9e)) : (8'ha9)) : wire53)));
    end
  always
    @(posedge clk) begin
      if (((^wire52[(2'h3):(1'h1)]) ? wire54[(3'h5):(1'h0)] : reg58))
        begin
          if (wire51[(3'h4):(1'h1)])
            begin
              reg59 <= reg57[(4'hc):(1'h1)];
              reg60 <= ((reg59 * wire52) ?
                  $signed(($unsigned($unsigned(reg56)) && (reg57 ?
                      {reg57} : ((8'hac) ?
                          wire52 : wire53)))) : $signed(wire52[(1'h1):(1'h0)]));
            end
          else
            begin
              reg59 <= ({$signed(((reg56 < reg58) ?
                          (wire52 + reg58) : $unsigned(wire52))),
                      (wire54 ?
                          reg60[(5'h10):(3'h7)] : wire54[(1'h0):(1'h0)])} ?
                  reg60 : (({(wire51 ? reg58 : wire53),
                          wire53[(1'h0):(1'h0)]} << $signed({reg57, wire51})) ?
                      $unsigned(reg56) : wire54[(3'h7):(2'h3)]));
              reg60 <= reg60[(4'hc):(4'hc)];
              reg61 <= wire53[(4'h9):(4'h9)];
              reg62 <= wire54[(3'h6):(3'h5)];
              reg63 <= (~^(8'ha8));
            end
          reg64 <= wire51[(3'h6):(1'h0)];
          reg65 <= (|$unsigned($signed($unsigned($unsigned(reg61)))));
          reg66 <= (|((((~reg61) ?
              reg59 : (wire51 ? wire54 : (8'hbf))) ^~ (reg59 ?
              reg65[(4'hb):(2'h3)] : $unsigned(wire55))) & reg58[(3'h5):(1'h1)]));
        end
      else
        begin
          reg59 <= $signed(wire55);
          reg60 <= {reg57};
          reg61 <= (~|(8'haa));
          reg62 <= ((((((8'ha2) & wire55) << ((8'hbe) ~^ wire51)) >> {$unsigned(wire52),
                  reg56}) + (-reg56)) ?
              $signed($signed(wire54[(1'h0):(1'h0)])) : (~^(|((reg62 & reg63) && (reg59 ?
                  reg56 : reg58)))));
        end
    end
  assign wire67 = reg56;
  assign wire68 = ($signed(($signed(reg59) ?
                      $unsigned($unsigned(reg59)) : (wire53[(3'h5):(1'h0)] ?
                          (wire67 + reg57) : (^~wire53)))) ^ (reg57[(5'h11):(1'h1)] > ($unsigned($unsigned(wire67)) ?
                      $signed((reg61 ? (8'hbf) : reg60)) : wire54)));
  always
    @(posedge clk) begin
      reg69 <= $signed(reg66);
      reg70 <= wire55[(3'h4):(3'h4)];
      reg71 <= (^~(-$unsigned(((reg56 ? wire54 : reg56) + wire52))));
      reg72 <= (8'h9e);
      reg73 <= ($signed((8'ha9)) ?
          (-$signed(wire68[(1'h0):(1'h0)])) : $unsigned($signed(reg69)));
    end
  assign wire74 = {(wire53[(2'h2):(1'h0)] >> reg62[(5'h13):(2'h2)])};
  assign wire75 = wire51;
  assign wire76 = (^~(reg73 ~^ (!($unsigned(reg62) != $signed(reg71)))));
  assign wire77 = wire52;
  assign wire78 = wire67[(5'h11):(4'hf)];
  assign wire79 = wire54[(1'h1):(1'h1)];
  assign wire80 = $signed(reg56[(1'h0):(1'h0)]);
  assign wire81 = $unsigned((&reg72[(2'h2):(1'h1)]));
  assign wire82 = reg66;
endmodule

module module34
#(parameter param46 = (8'hb1), 
parameter param47 = (({((param46 ? param46 : param46) ? (param46 ? param46 : param46) : (-param46)), {(^~param46)}} ~^ (&(param46 ? (^param46) : (param46 <<< param46)))) >= ((~^((param46 != (8'had)) <= (param46 < param46))) <<< param46)))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire38;
  input wire signed [(4'hb):(1'h0)] wire37;
  input wire signed [(5'h10):(1'h0)] wire36;
  input wire signed [(5'h15):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire43;
  wire [(5'h13):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire39;
  assign y = {wire45, wire44, wire43, wire42, wire41, wire40, wire39, (1'h0)};
  assign wire39 = {((8'haf) >= (~&wire36[(2'h3):(1'h0)])),
                      $signed({((wire35 ? wire38 : (8'ha6)) ?
                              $unsigned(wire37) : $signed(wire36)),
                          {$signed((8'hb6))}})};
  assign wire40 = $unsigned(wire38);
  assign wire41 = {$unsigned((wire40 ?
                          ((~wire38) ?
                              (&wire40) : $signed(wire37)) : ($signed(wire39) >= wire37)))};
  assign wire42 = $unsigned(wire36);
  assign wire43 = ((wire35 ?
                          (^~((wire42 ?
                              wire36 : wire36) + $signed(wire40))) : {wire41[(1'h0):(1'h0)],
                              $unsigned({wire39})}) ?
                      (+($unsigned($signed(wire36)) ?
                          ($unsigned(wire37) | $unsigned(wire36)) : $unsigned({(8'hae)}))) : $unsigned($unsigned($unsigned({wire38}))));
  assign wire44 = {wire41};
  assign wire45 = wire44;
endmodule
