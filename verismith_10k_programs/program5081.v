module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire133;
  wire signed [(3'h7):(1'h0)] wire132;
  wire signed [(4'hf):(1'h0)] wire131;
  wire signed [(5'h10):(1'h0)] wire128;
  wire signed [(5'h14):(1'h0)] wire127;
  wire [(4'hb):(1'h0)] wire125;
  wire [(4'hf):(1'h0)] wire5;
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  reg [(3'h7):(1'h0)] reg129 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire128,
                 wire127,
                 wire125,
                 wire5,
                 reg130,
                 reg129,
                 (1'h0)};
  assign wire5 = (((!{wire0, (wire4 ? wire3 : wire2)}) >= wire3) & ({((!wire0) ?
                             (wire3 ? (8'hbd) : (8'ha9)) : (wire4 ?
                                 wire3 : (8'ha3)))} ?
                     ((-$unsigned(wire0)) + $signed(wire4)) : $signed({wire4})));
  module6 #() modinst126 (wire125, clk, wire4, wire2, wire1, wire3);
  assign wire127 = wire1[(4'hd):(4'h9)];
  assign wire128 = (^~{wire4[(4'hd):(2'h2)], wire1});
  always
    @(posedge clk) begin
      reg129 <= {$signed((wire4[(1'h0):(1'h0)] ?
              $signed($unsigned(wire1)) : (wire1[(1'h0):(1'h0)] ?
                  $unsigned(wire1) : ((7'h42) | wire128))))};
      reg130 <= (wire125[(1'h1):(1'h0)] >= wire5[(4'h8):(1'h1)]);
    end
  assign wire131 = ($signed(reg130[(2'h2):(2'h2)]) >= $unsigned((&$signed($signed(wire1)))));
  assign wire132 = wire2[(3'h7):(3'h6)];
  assign wire133 = wire3;
endmodule

module module6
#(parameter param124 = (((((&(8'ha9)) || (!(8'h9d))) ? (8'h9e) : (((8'hbc) ? (7'h43) : (8'hb8)) ? {(7'h41), (8'hb9)} : (^(8'hb4)))) + (|{(8'ha1), ((8'hbf) ? (8'hba) : (8'hbf))})) ? ((((|(8'hb4)) <= ((8'h9c) < (8'hbd))) ? {((8'h9f) > (8'h9d))} : (!(!(7'h42)))) ? ((^~((8'h9c) ? (8'hb2) : (8'hba))) ? (~{(8'hb8)}) : ({(7'h44), (8'hbc)} ? ((8'had) | (8'h9e)) : {(8'ha5)})) : ((((8'ha3) >>> (8'hba)) ? ((8'hb3) ? (8'hb7) : (8'hb1)) : ((8'ha8) ? (8'hb6) : (8'hac))) ? ((~|(8'ha0)) ? ((8'hb2) ? (8'ha6) : (7'h40)) : ((8'hb5) | (8'ha4))) : (8'hbd))) : ({(!(+(8'had)))} ^ ((|(-(8'ha3))) ? (((8'ha3) ? (8'h9d) : (8'haa)) ? (~&(8'hac)) : ((8'hbb) ? (8'hbe) : (8'ha1))) : ({(8'ha8), (8'hbd)} ? (^~(8'ha4)) : (~&(8'hb5)))))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire122;
  wire [(5'h11):(1'h0)] wire110;
  wire [(3'h7):(1'h0)] wire109;
  wire [(3'h7):(1'h0)] wire108;
  wire [(5'h11):(1'h0)] wire107;
  wire signed [(2'h3):(1'h0)] wire106;
  wire [(5'h15):(1'h0)] wire104;
  wire signed [(5'h12):(1'h0)] wire75;
  wire signed [(4'ha):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire42;
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  assign y = {wire122,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire104,
                 wire75,
                 wire73,
                 wire49,
                 wire48,
                 wire47,
                 wire45,
                 wire44,
                 wire42,
                 reg46,
                 (1'h0)};
  module11 #() modinst43 (wire42, clk, wire9, wire8, wire10, wire7);
  assign wire44 = $unsigned(wire42[(3'h4):(1'h1)]);
  assign wire45 = (8'h9f);
  always
    @(posedge clk) begin
      reg46 <= (wire42[(3'h5):(2'h2)] ? wire7 : wire10[(5'h10):(4'h9)]);
    end
  assign wire47 = ((((!wire10[(3'h6):(1'h1)]) | $unsigned((&wire8))) >= (8'h9d)) << $signed(($unsigned({(8'haf)}) ^~ (-(wire44 | wire42)))));
  assign wire48 = wire44;
  assign wire49 = ({wire45} < (8'hb1));
  module50 #() modinst74 (.wire51(wire8), .wire55(wire42), .wire53(reg46), .wire52(wire9), .wire54(wire45), .y(wire73), .clk(clk));
  assign wire75 = (~wire48);
  module76 #() modinst105 (wire104, clk, wire45, wire75, wire48, wire47);
  assign wire106 = (wire42 <<< {((wire45 || (+(7'h42))) ?
                           $unsigned(wire42) : (~(8'ha5)))});
  assign wire107 = {(7'h40), {wire106[(2'h2):(1'h0)], $unsigned(wire104)}};
  assign wire108 = (({((&(8'ha0)) ? wire47[(4'hd):(3'h5)] : (^wire75)),
                           ($unsigned(wire44) == $signed(wire104))} ?
                       $unsigned((^$signed(wire73))) : (^$unsigned($unsigned(wire42)))) >= wire73[(4'ha):(1'h0)]);
  assign wire109 = ($signed((|wire42)) <<< $unsigned((wire49[(1'h1):(1'h0)] ?
                       wire7[(4'hd):(1'h0)] : ((~wire73) ?
                           {reg46, (8'hb2)} : wire108))));
  assign wire110 = wire104;
  module111 #() modinst123 (wire122, clk, wire8, wire108, wire7, wire75);
endmodule

module module111
#(parameter param120 = ((({((8'hae) ? (8'hae) : (8'ha9))} ? (|((8'hb1) ? (8'hbf) : (8'ha2))) : (((8'h9d) <= (7'h43)) ? (~^(8'ha1)) : ((8'hae) + (8'hac)))) >> ({(^~(8'ha9)), ((8'hac) ? (8'ha0) : (8'hbd))} | {((8'hb4) << (8'haf))})) << (8'hbe)), 
parameter param121 = {(&{(!(param120 ? param120 : param120))}), param120})
(y, clk, wire115, wire114, wire113, wire112);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire115;
  input wire signed [(3'h5):(1'h0)] wire114;
  input wire [(4'h9):(1'h0)] wire113;
  input wire signed [(5'h12):(1'h0)] wire112;
  wire signed [(4'hf):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire118;
  wire [(4'ha):(1'h0)] wire116;
  reg signed [(4'hf):(1'h0)] reg117 = (1'h0);
  assign y = {wire119, wire118, wire116, reg117, (1'h0)};
  assign wire116 = ($unsigned((|wire115[(3'h5):(2'h3)])) ?
                       (~^(~^$unsigned(wire115))) : $unsigned((&(8'ha2))));
  always
    @(posedge clk) begin
      reg117 <= wire113[(4'h8):(3'h5)];
    end
  assign wire118 = $unsigned(reg117);
  assign wire119 = $signed({$unsigned((wire114 ?
                           $signed(wire113) : (wire112 <= reg117)))});
endmodule

module module76  (y, clk, wire80, wire79, wire78, wire77);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire80;
  input wire signed [(3'h5):(1'h0)] wire79;
  input wire [(3'h4):(1'h0)] wire78;
  input wire [(5'h11):(1'h0)] wire77;
  wire signed [(4'ha):(1'h0)] wire103;
  wire [(4'hf):(1'h0)] wire102;
  wire signed [(3'h5):(1'h0)] wire101;
  wire signed [(3'h5):(1'h0)] wire100;
  wire [(4'ha):(1'h0)] wire99;
  wire [(3'h6):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire95;
  wire [(5'h14):(1'h0)] wire81;
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg87 = (1'h0);
  reg [(4'hf):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire81,
                 reg94,
                 reg93,
                 reg92,
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
                 (1'h0)};
  assign wire81 = ((|(|$unsigned((wire79 ?
                      wire77 : wire77)))) >>> (|(((+wire77) && $signed(wire77)) ^ ($signed(wire78) ~^ $signed(wire77)))));
  always
    @(posedge clk) begin
      if ((~$unsigned((8'ha5))))
        begin
          reg82 <= ((~&(8'hbe)) | wire79);
          if (wire80[(4'he):(1'h0)])
            begin
              reg83 <= wire77;
              reg84 <= wire78;
              reg85 <= {$unsigned(reg83)};
            end
          else
            begin
              reg83 <= (|(^~$signed(reg83)));
              reg84 <= ((wire81 - (^{{reg83}})) ?
                  ($signed(((reg84 ? wire79 : wire78) >>> (reg84 && reg82))) ?
                      (((~(8'hae)) || (~|wire77)) >> (^~(|wire81))) : (~^wire78)) : wire77);
              reg85 <= $signed((~^(8'hb6)));
              reg86 <= (8'ha6);
              reg87 <= $signed((!wire79[(1'h1):(1'h0)]));
            end
          reg88 <= $unsigned(reg83[(3'h7):(3'h7)]);
          reg89 <= $signed(reg86);
          if ((wire79 ? (-reg84) : {(&wire80[(3'h5):(1'h1)])}))
            begin
              reg90 <= (~reg85[(2'h3):(2'h3)]);
              reg91 <= {(wire77[(5'h10):(3'h6)] ?
                      $unsigned($signed((^reg84))) : (!(^~(|wire77)))),
                  reg84};
              reg92 <= ((8'ha1) ?
                  $unsigned((reg90 >= ($signed(reg84) >= ((8'hb9) ?
                      reg82 : wire77)))) : {{(|wire81[(3'h5):(2'h3)])}});
              reg93 <= wire80;
            end
          else
            begin
              reg90 <= reg92;
              reg91 <= ((-$signed(reg84[(3'h4):(1'h1)])) == $unsigned(reg88));
              reg92 <= (&reg85[(1'h1):(1'h0)]);
            end
        end
      else
        begin
          reg82 <= (($unsigned(($signed(wire80) - $signed(wire81))) ^~ (^wire78)) ?
              {$signed(((reg88 * reg90) ? wire79 : $unsigned(reg91)))} : {reg89,
                  (^~reg83)});
          reg83 <= wire79[(1'h0):(1'h0)];
        end
      reg94 <= (8'hbb);
    end
  assign wire95 = reg91[(4'hf):(4'hc)];
  assign wire96 = ((($signed(reg93) ?
                      $signed(((8'hb1) - reg91)) : $unsigned(wire80[(3'h4):(1'h1)])) || reg90[(2'h2):(2'h2)]) && (~|reg83));
  assign wire97 = $unsigned(reg90);
  assign wire98 = (reg92[(3'h6):(2'h3)] ?
                      $signed($unsigned((~^(!wire77)))) : reg88);
  assign wire99 = {$unsigned((^reg84[(2'h2):(1'h0)])), reg93[(3'h4):(1'h1)]};
  assign wire100 = (({$unsigned(reg86[(3'h4):(3'h4)])} ?
                       {reg88,
                           (!(wire95 ?
                               reg85 : wire99))} : $signed({(wire78 ^ wire77),
                           (+reg84)})) && $signed($signed((|wire81[(4'h8):(2'h2)]))));
  assign wire101 = reg88;
  assign wire102 = ({wire80[(5'h10):(2'h2)], reg94} >> ((($signed((8'ha2)) ?
                           $signed(reg86) : reg83[(3'h7):(3'h5)]) ~^ wire98[(2'h2):(1'h0)]) ?
                       reg89[(1'h1):(1'h0)] : (wire96[(4'h9):(3'h5)] | ((!reg87) && reg83[(2'h3):(2'h3)]))));
  assign wire103 = $unsigned(({{$unsigned(reg88), (wire102 || reg89)}} ?
                       ((((7'h42) ? wire81 : wire96) >>> $signed(reg82)) ?
                           $signed(wire100) : (~$unsigned((8'hb6)))) : (|wire97[(4'h8):(4'h8)])));
endmodule

module module50
#(parameter param71 = (~|(((&((7'h43) ? (8'hb2) : (8'hbc))) <<< ((&(8'hac)) ? (8'ha4) : {(7'h44), (8'ha1)})) <<< ((7'h42) ? {((8'hbf) >= (8'h9c))} : {((8'h9e) ? (8'hb3) : (8'hb3)), {(8'haf)}}))), 
parameter param72 = (^(~((-(param71 ^ param71)) ? {param71} : ((^param71) ^ (param71 ? (8'ha1) : param71))))))
(y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire55;
  input wire signed [(3'h5):(1'h0)] wire54;
  input wire [(5'h10):(1'h0)] wire53;
  input wire signed [(4'h8):(1'h0)] wire52;
  input wire signed [(2'h3):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire68;
  wire [(2'h3):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire64;
  wire signed [(4'h8):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire61;
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg56 <= {$unsigned((((wire54 - wire51) || (-wire51)) == wire53)),
          (wire53 > wire51[(1'h0):(1'h0)])};
      if (((|wire55) && $unsigned((!wire55[(1'h0):(1'h0)]))))
        begin
          reg57 <= $unsigned($unsigned(reg56[(2'h2):(2'h2)]));
        end
      else
        begin
          reg57 <= $unsigned($signed(wire54));
        end
      reg58 <= ((wire52[(3'h5):(3'h4)] ?
          wire52 : $unsigned((((8'hb1) ? reg56 : wire51) ?
              wire53 : wire53))) <= $unsigned($unsigned($signed($signed(wire51)))));
      reg59 <= wire52;
      reg60 <= wire55;
    end
  assign wire61 = (((&reg57) != (reg59 ?
                          (~|(reg58 ? wire55 : reg56)) : reg58)) ?
                      $signed((($signed(reg57) - (wire52 ? reg56 : (8'ha8))) ?
                          reg57[(2'h3):(2'h3)] : $unsigned({reg57}))) : $signed($unsigned((8'hb6))));
  assign wire62 = reg58[(1'h1):(1'h1)];
  assign wire63 = $unsigned({(^wire52[(3'h4):(2'h2)]), (^(+(~^wire61)))});
  assign wire64 = $unsigned((8'hab));
  assign wire65 = $signed($unsigned((8'h9c)));
  assign wire66 = $signed($unsigned($unsigned(reg56[(1'h0):(1'h0)])));
  assign wire67 = reg57[(3'h7):(3'h5)];
  assign wire68 = wire54[(2'h2):(1'h1)];
  assign wire69 = ($unsigned((((-reg57) < (~(8'hb9))) ?
                      {$signed(wire65),
                          (^~reg56)} : wire61)) << ((-$signed((~&reg56))) && wire68[(3'h5):(3'h5)]));
  assign wire70 = (~&($signed(($signed(wire69) ?
                      $signed(wire61) : (~|wire61))) || (((wire66 != wire62) ?
                          wire52[(1'h1):(1'h1)] : (wire69 ~^ wire55)) ?
                      (reg59 == {wire67}) : ((wire51 ?
                          wire55 : wire54) <= $unsigned(wire69)))));
endmodule

module module11
#(parameter param41 = (&(|((((8'hbb) > (7'h44)) ? (~^(7'h41)) : (~(8'h9d))) <= ((8'hb1) + ((8'ha5) ^~ (7'h43)))))))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h133):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire15;
  input wire signed [(2'h2):(1'h0)] wire14;
  input wire [(5'h14):(1'h0)] wire13;
  input wire [(3'h6):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire17;
  wire [(3'h6):(1'h0)] wire16;
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire18,
                 wire17,
                 wire16,
                 reg30,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire16 = wire14[(1'h1):(1'h0)];
  assign wire17 = ((~|$unsigned($unsigned(wire15))) ?
                      wire15 : ((+((wire12 ? wire12 : wire16) ?
                              wire12[(2'h2):(1'h1)] : $signed(wire15))) ?
                          wire16 : $signed(($unsigned(wire16) ?
                              wire15 : (!wire16)))));
  assign wire18 = wire16[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg19 <= wire13[(3'h7):(2'h3)];
      reg20 <= ($unsigned(($signed((~&wire13)) ?
          (reg19[(2'h2):(1'h1)] ?
              (wire18 <<< wire13) : wire18[(3'h5):(1'h0)]) : (wire14 >= $unsigned(wire17)))) && wire18[(2'h3):(2'h3)]);
      reg21 <= {{wire18}};
      reg22 <= (!(wire18[(2'h3):(1'h0)] ?
          $signed(($unsigned(wire15) < wire17)) : wire15[(1'h1):(1'h1)]));
      reg23 <= reg21;
    end
  assign wire24 = $unsigned((~&(((wire14 ? wire14 : reg20) == reg21) ?
                      $signed({reg21}) : ({reg23} ?
                          ((8'hbc) >>> reg23) : ((8'hb3) ? wire16 : wire12)))));
  assign wire25 = (reg20 ?
                      reg20 : ($unsigned(($unsigned(wire16) ?
                          $unsigned(wire18) : (~|reg22))) == reg19));
  assign wire26 = $signed($signed({reg20[(1'h0):(1'h0)]}));
  assign wire27 = (&reg23);
  assign wire28 = $unsigned(((~reg21[(1'h1):(1'h1)]) << reg19));
  assign wire29 = (&{$unsigned(wire26),
                      $signed((~|(wire15 ? reg20 : (8'hb3))))});
  always
    @(posedge clk) begin
      reg30 <= {(reg23 <<< ($unsigned($signed(wire26)) <<< $signed((~wire15)))),
          wire17};
    end
  assign wire31 = $unsigned(wire16);
  assign wire32 = $signed($signed({(((8'hb6) != reg20) ?
                          (wire29 >= wire31) : {wire27, reg19})}));
  assign wire33 = $unsigned(((!(wire14 ?
                      $signed(wire31) : $signed(reg19))) == wire17));
  assign wire34 = $unsigned((~&$signed(reg30)));
  assign wire35 = $unsigned($signed((wire13[(5'h12):(3'h6)] ?
                      ((reg30 ? reg21 : reg19) ?
                          (wire14 | wire15) : wire16[(1'h1):(1'h1)]) : wire34[(4'ha):(2'h3)])));
  assign wire36 = (($signed($signed({wire29})) ?
                      $signed(reg23[(4'hd):(1'h0)]) : (8'hbb)) <= wire35[(2'h3):(1'h0)]);
  assign wire37 = reg30[(4'h8):(4'h8)];
  assign wire38 = (~^(~&(wire24 ?
                      $signed(wire16) : ($signed(reg20) & {(8'hb1), wire12}))));
  assign wire39 = (!$unsigned((($signed(wire29) && (wire14 < wire14)) == (^(&(8'had))))));
  assign wire40 = wire25[(5'h11):(4'hc)];
endmodule
