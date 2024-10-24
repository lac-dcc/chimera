module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire110;
  wire [(5'h11):(1'h0)] wire106;
  wire [(5'h10):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  assign y = {wire110, wire106, wire17, wire5, wire4, reg109, reg108, (1'h0)};
  assign wire4 = $unsigned($unsigned((|$unsigned($unsigned(wire3)))));
  assign wire5 = wire4[(4'h8):(3'h7)];
  module6 #() modinst18 (.wire9(wire2), .clk(clk), .wire7(wire0), .y(wire17), .wire10(wire5), .wire8(wire4));
  module19 #() modinst107 (.wire20(wire1), .y(wire106), .wire23(wire4), .wire22(wire5), .wire21(wire17), .clk(clk));
  always
    @(posedge clk) begin
      reg108 <= wire0;
      reg109 <= ($unsigned(wire3[(1'h0):(1'h0)]) ?
          (($unsigned($unsigned(wire4)) ^~ (&$signed(wire106))) ?
              wire0[(4'h9):(1'h0)] : ($unsigned(wire17[(2'h2):(1'h1)]) ?
                  $signed((wire5 ?
                      wire17 : wire4)) : wire1[(2'h3):(1'h0)])) : (wire3 ?
              $signed(($signed(wire1) ?
                  (wire106 >>> wire106) : (!reg108))) : reg108[(2'h2):(1'h1)]));
    end
  assign wire110 = $signed($unsigned(($unsigned((wire5 >>> wire5)) ^~ (+$signed(wire1)))));
endmodule

module module19  (y, clk, wire20, wire21, wire22, wire23);
  output wire [(32'h1d1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire21;
  input wire [(4'hd):(1'h0)] wire22;
  input wire [(3'h7):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire92;
  wire signed [(4'hd):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire90;
  wire signed [(4'ha):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(4'h8):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire67;
  reg signed [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(2'h3):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(4'he):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg97 = (1'h0);
  reg [(5'h14):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg87 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg83 = (1'h0);
  reg [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  assign y = {wire105,
                 wire92,
                 wire91,
                 wire90,
                 wire69,
                 wire24,
                 wire25,
                 wire50,
                 wire67,
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
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire24 = (((({(8'hae), wire21} && (wire22 ? (7'h43) : wire23)) ?
                          $unsigned($signed(wire22)) : wire23[(3'h6):(3'h6)]) & {wire22,
                          (^$signed(wire20))}) ?
                      $unsigned(wire23) : (-$unsigned(wire20)));
  assign wire25 = ((&wire22[(1'h0):(1'h0)]) == $unsigned({$signed((wire22 ?
                          wire24 : (8'ha4))),
                      (wire20 ? wire24 : $signed(wire21))}));
  module26 #() modinst51 (wire50, clk, wire20, wire21, wire22, wire24);
  module52 #() modinst68 (wire67, clk, wire21, wire20, wire23, wire50, wire22);
  assign wire69 = $signed({($unsigned(wire20[(1'h0):(1'h0)]) ?
                          wire67 : (~|wire21)),
                      ({(~wire23)} ^~ wire22[(1'h1):(1'h1)])});
  always
    @(posedge clk) begin
      if (((({wire67[(1'h0):(1'h0)],
              (wire23 ?
                  (8'hac) : wire23)} - {wire25[(5'h10):(4'h8)]}) < ({(wire22 & wire67),
              wire23} <<< ((wire67 ? wire21 : wire69) || {wire50}))) ?
          (^wire24) : $unsigned({{((8'ha3) ? wire21 : (8'hb7))},
              wire21[(5'h10):(3'h5)]})))
        begin
          reg70 <= $signed(($unsigned(wire21) ~^ (^~((~wire22) ?
              $unsigned((8'ha4)) : $unsigned(wire21)))));
          reg71 <= $signed((~^$signed((~&wire50))));
        end
      else
        begin
          reg70 <= wire22;
          if (wire67)
            begin
              reg71 <= (&(((((7'h44) ? wire69 : wire22) ?
                  wire25[(5'h10):(3'h4)] : (wire50 ?
                      wire21 : (8'ha2))) + wire50[(1'h1):(1'h1)]) | wire23[(3'h6):(2'h3)]));
              reg72 <= wire67;
              reg73 <= $signed(reg72[(3'h4):(1'h0)]);
              reg74 <= (|wire23[(2'h3):(1'h0)]);
              reg75 <= (((&(&$signed(reg73))) >= $unsigned($signed($unsigned(wire25)))) ?
                  (~|wire21[(4'h9):(2'h3)]) : (wire50[(3'h4):(2'h2)] >> wire21[(4'h9):(2'h3)]));
            end
          else
            begin
              reg71 <= $unsigned(reg73);
              reg72 <= {(wire67[(2'h2):(1'h0)] & $signed(reg70[(3'h7):(2'h2)])),
                  $signed($signed(reg70[(5'h11):(1'h1)]))};
            end
          if (($signed(wire22[(3'h5):(2'h3)]) <<< (!wire69[(1'h1):(1'h0)])))
            begin
              reg76 <= (~(+reg71[(4'h8):(3'h5)]));
              reg77 <= $unsigned((+$unsigned(wire23[(2'h2):(1'h1)])));
            end
          else
            begin
              reg76 <= $signed($signed(reg72));
              reg77 <= $unsigned((+reg72[(4'hc):(3'h6)]));
              reg78 <= {(8'hab)};
            end
        end
      reg79 <= (7'h43);
      reg80 <= wire24[(3'h4):(2'h2)];
      reg81 <= ($unsigned(({$unsigned(wire69)} ?
          ((wire67 < wire21) ?
              wire23 : $unsigned((7'h42))) : {{(7'h44)}})) ^~ $unsigned((($signed(reg79) == $signed((8'hb2))) && {(reg72 ?
              wire25 : reg75),
          {wire50, reg73}})));
      if ($signed($signed((8'h9f))))
        begin
          reg82 <= $unsigned(wire24);
          if ($signed(($unsigned((~&$unsigned(reg74))) ^~ ({wire24[(4'hc):(4'hc)]} ?
              (wire21[(4'h9):(3'h7)] >> (wire23 + wire21)) : reg75))))
            begin
              reg83 <= ((reg70[(4'ha):(2'h3)] ?
                  ((8'ha7) >= reg81[(5'h14):(2'h3)]) : $unsigned($signed((!(8'h9e))))) >>> ($signed(reg74[(1'h1):(1'h0)]) <= wire67));
              reg84 <= (^~(reg78[(2'h3):(1'h0)] >= $signed(reg77)));
              reg85 <= $unsigned($signed((^(~&(wire69 ? wire25 : (8'ha8))))));
              reg86 <= $signed(wire24);
            end
          else
            begin
              reg83 <= {reg80};
              reg84 <= ((({(reg86 ?
                      wire24 : reg71)} & (reg74 ^~ (reg76 <= reg70))) >= ((-reg74) ~^ $signed({reg72,
                  wire23}))) <= ($signed($signed((reg73 << reg73))) > wire50));
              reg85 <= (8'hae);
            end
          reg87 <= ($unsigned((~^$signed(wire69))) ?
              ((~|reg82) >> $signed(($signed(wire22) ^ $unsigned(reg76)))) : wire21[(4'hc):(4'h8)]);
          reg88 <= wire23;
          reg89 <= (&reg88);
        end
      else
        begin
          reg82 <= $signed(wire22[(3'h6):(1'h1)]);
          reg83 <= (~^$signed($signed(((~|reg74) >>> wire67[(2'h2):(1'h1)]))));
          reg84 <= {({reg82, ($unsigned(reg79) - reg84[(3'h7):(1'h1)])} ?
                  (reg75[(4'h9):(1'h1)] ?
                      (((8'hab) >= reg70) ?
                          (|wire22) : (^reg86)) : $unsigned({reg77,
                          reg85})) : (^((reg81 ? reg80 : (8'h9d)) ?
                      (reg89 + reg71) : (~^reg88)))),
              reg79[(3'h4):(3'h4)]};
          reg85 <= reg75;
          if (reg81[(2'h2):(1'h0)])
            begin
              reg86 <= wire24;
              reg87 <= {reg76,
                  ($signed({(reg89 || reg71),
                      {wire21,
                          wire69}}) ^ $unsigned(($signed(wire67) & $signed(wire21))))};
            end
          else
            begin
              reg86 <= ($unsigned($unsigned(((+wire20) | $signed(reg84)))) ?
                  (wire67[(2'h3):(1'h0)] ?
                      $unsigned((^$unsigned(reg70))) : (~^(^$signed(reg80)))) : {reg83[(1'h0):(1'h0)],
                      $unsigned((^reg80[(1'h1):(1'h0)]))});
              reg87 <= {(((^~$signed(wire50)) ?
                      $unsigned(wire21[(2'h2):(1'h0)]) : $signed(reg87)) == (~^$unsigned({reg79})))};
              reg88 <= {({($unsigned((8'ha8)) ? wire25 : wire23[(2'h3):(2'h2)]),
                      (~wire23)} <= {($unsigned(wire21) ?
                          {reg71} : reg80[(2'h2):(2'h2)])})};
            end
        end
    end
  assign wire90 = ((~^reg88[(4'he):(4'hb)]) ? (^~wire25) : reg78);
  assign wire91 = $signed((!(reg82 + (-reg72[(5'h10):(2'h2)]))));
  assign wire92 = $unsigned((($signed($unsigned(reg77)) ?
                      {$signed(reg76),
                          reg81} : wire91[(4'hc):(3'h5)]) != reg77[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      reg93 <= ($signed($signed($unsigned($unsigned(reg85)))) ?
          ($signed(reg85[(3'h4):(1'h0)]) ?
              reg72[(3'h5):(3'h4)] : (7'h43)) : reg78[(3'h4):(1'h0)]);
      reg94 <= $signed(($unsigned({$signed((8'haa)),
          $unsigned((8'hb2))}) < reg77));
      reg95 <= $unsigned((($signed((8'hbc)) ?
          ((wire25 * reg72) ? $signed(reg77) : {wire21}) : ((reg70 ?
              reg70 : reg88) >= $signed(wire25))) != $unsigned(((reg73 < wire92) - wire90))));
    end
  always
    @(posedge clk) begin
      reg96 <= $unsigned((((|(reg87 < reg73)) < $unsigned(wire24[(2'h3):(1'h1)])) ?
          ($unsigned(reg73[(1'h1):(1'h1)]) ?
              reg73 : (reg74 ?
                  {reg87, reg84} : (~&wire91))) : (wire69[(2'h2):(1'h0)] ?
              $signed((wire20 * reg82)) : reg78[(1'h0):(1'h0)])));
      if ((reg95 < $signed($signed(reg72[(4'hb):(4'h8)]))))
        begin
          reg97 <= (reg71[(2'h3):(2'h3)] ?
              (((^~wire21[(4'hc):(3'h7)]) + (~&wire69)) ?
                  $signed(reg87) : $unsigned($signed($signed(reg94)))) : $unsigned($signed({{reg94,
                      wire25},
                  (reg88 * reg81)})));
          if (($unsigned(reg81[(3'h7):(1'h0)]) < wire91[(4'h8):(1'h0)]))
            begin
              reg98 <= $unsigned({reg86[(3'h6):(3'h5)], reg93[(3'h7):(1'h0)]});
              reg99 <= $signed($unsigned($unsigned({(^reg76),
                  $signed(reg97)})));
              reg100 <= wire24;
              reg101 <= ($signed((|reg85)) + $signed(wire90));
              reg102 <= $unsigned(($unsigned($unsigned(reg89[(1'h1):(1'h1)])) ^ ({reg98} <= ((^~reg88) ?
                  (reg93 * reg96) : $signed((8'ha8))))));
            end
          else
            begin
              reg98 <= $signed((^~reg94[(2'h2):(2'h2)]));
              reg99 <= (((wire23[(1'h0):(1'h0)] ?
                          reg89[(4'hc):(4'ha)] : $signed((wire91 ?
                              wire69 : reg79))) ?
                      (~&(reg94[(3'h6):(1'h1)] ?
                          (reg70 > reg83) : $signed((7'h40)))) : $unsigned((8'haf))) ?
                  $unsigned({(~&(~|reg75)), (8'h9d)}) : (8'hb5));
              reg100 <= $signed($unsigned(({$unsigned(reg98)} ?
                  $signed(wire67[(2'h2):(1'h1)]) : wire90)));
              reg101 <= reg77;
              reg102 <= reg83;
            end
          reg103 <= reg77;
          reg104 <= reg101;
        end
      else
        begin
          reg97 <= $signed($signed($signed(reg102)));
          reg98 <= $unsigned($signed($unsigned(reg75)));
          reg99 <= (reg80[(3'h4):(1'h0)] ?
              $unsigned((+(wire22[(4'ha):(4'h8)] & $unsigned(reg72)))) : $signed(reg87[(4'h9):(4'h9)]));
          if ((((((reg93 ? wire69 : reg97) ?
                      {(8'h9f)} : reg87[(1'h0):(1'h0)]) << (~|$unsigned(wire69))) ?
                  $unsigned((&$unsigned(reg95))) : reg93[(4'hd):(3'h5)]) ?
              {$signed($unsigned($signed((8'hb5)))),
                  $signed(((reg93 << reg102) ?
                      reg102[(1'h1):(1'h1)] : reg71))} : reg86[(4'h9):(3'h7)]))
            begin
              reg100 <= reg85;
              reg101 <= reg89[(1'h0):(1'h0)];
              reg102 <= $signed(reg72[(3'h7):(1'h1)]);
            end
          else
            begin
              reg100 <= $signed((!(reg98 ?
                  (8'hb1) : $signed(reg74[(3'h6):(2'h3)]))));
              reg101 <= wire67[(2'h2):(2'h2)];
              reg102 <= $signed((^~((reg98[(2'h2):(2'h2)] ?
                      (!reg93) : (reg76 ? reg81 : (8'ha3))) ?
                  $signed($signed(reg97)) : $unsigned((reg98 ?
                      reg97 : reg84)))));
              reg103 <= $signed((&({reg71, {reg102}} < (-$unsigned((7'h40))))));
            end
        end
    end
  assign wire105 = reg94[(1'h1):(1'h0)];
endmodule

module module6
#(parameter param15 = (~{({{(8'ha6), (8'ha7)}, ((8'hbb) | (8'ha5))} | {((8'hb2) && (8'ha9)), ((8'hb3) ? (8'ha7) : (8'hbd))}), (8'hb4)}), 
parameter param16 = (~((^~param15) * ((|(param15 ? param15 : param15)) ^ (~^(~|param15))))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire10;
  input wire signed [(3'h7):(1'h0)] wire9;
  input wire [(2'h3):(1'h0)] wire8;
  input wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  assign y = {wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = ($unsigned(wire9[(2'h3):(1'h0)]) ?
                      ((!{(wire8 << wire10), $signed(wire8)}) ?
                          wire7[(1'h0):(1'h0)] : (wire9[(1'h1):(1'h1)] ~^ {{(8'had),
                                  wire10}})) : wire9);
  assign wire12 = (($unsigned(($signed(wire8) ~^ $unsigned(wire11))) && ($unsigned((wire8 * wire10)) ?
                          (wire10[(4'hf):(4'ha)] ?
                              wire7 : (~^wire9)) : wire7)) ?
                      (^~wire10[(4'hb):(2'h2)]) : (+(wire10[(2'h2):(2'h2)] < {wire9[(1'h0):(1'h0)]})));
  assign wire13 = wire9;
  assign wire14 = wire13[(1'h1):(1'h0)];
endmodule

module module52
#(parameter param66 = ((~|(~^(|((8'ha5) < (8'hbf))))) * ({(((8'hb4) ? (8'hb9) : (8'hb7)) ? {(8'ha0)} : {(8'hb1)}), ((~&(8'hbe)) ? {(8'ha0), (7'h43)} : (&(8'ha3)))} | ((+((8'ha1) != (8'hb2))) <<< (8'hab)))))
(y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire57;
  input wire [(4'ha):(1'h0)] wire56;
  input wire signed [(3'h5):(1'h0)] wire55;
  input wire [(3'h7):(1'h0)] wire54;
  input wire [(3'h5):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire62;
  wire signed [(2'h2):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire59;
  wire signed [(4'hc):(1'h0)] wire58;
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire60,
                 wire59,
                 wire58,
                 reg61,
                 (1'h0)};
  assign wire58 = (((((7'h43) || (^wire57)) <<< ($signed(wire54) ?
                      $unsigned(wire56) : $unsigned((8'ha9)))) + ($unsigned((wire53 > (8'hbd))) ?
                      $unsigned($signed(wire55)) : wire53[(3'h5):(2'h3)])) < {$unsigned(((~wire57) ?
                          {wire55} : wire53))});
  assign wire59 = ({($unsigned((&wire53)) + ({wire57, wire55} ?
                          (wire55 >> wire57) : $signed((8'ha0))))} & ((~|wire57[(4'hc):(3'h6)]) ?
                      $unsigned(wire54) : (($unsigned((7'h44)) ?
                          (wire57 ?
                              wire55 : (8'ha2)) : (wire58 ^ wire54)) >= $signed((wire57 ?
                          wire53 : (8'hb2))))));
  assign wire60 = wire59[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg61 <= (|$unsigned(wire60));
    end
  assign wire62 = ((^((!wire57[(3'h4):(1'h0)]) ?
                          $signed(wire53) : wire59[(2'h2):(1'h0)])) ?
                      ((+$unsigned($signed(reg61))) ?
                          wire57[(4'he):(3'h6)] : (|(~(~^reg61)))) : $unsigned(wire54[(2'h2):(2'h2)]));
  assign wire63 = (wire59 == {($signed((8'ha2)) != wire59),
                      (($signed(wire55) >>> wire58[(4'h8):(3'h4)]) ?
                          $unsigned($unsigned(reg61)) : (~{wire62}))});
  assign wire64 = ((~^$unsigned(wire59)) ?
                      wire55 : (-$unsigned((!(~&wire56)))));
  assign wire65 = ($unsigned($unsigned(($unsigned(wire55) != (wire63 || wire64)))) ?
                      $unsigned((((wire56 << wire55) >>> {wire60}) && wire58[(3'h7):(3'h4)])) : wire53);
endmodule

module module26
#(parameter param49 = (((!(~{(8'haf)})) ? (((!(8'ha4)) || ((8'hb4) ? (8'hbf) : (8'ha5))) << ((^~(8'ha7)) << (~^(7'h44)))) : {(-{(8'ha6), (8'ha5)})}) ? (~|((((8'hb6) ? (8'hbe) : (8'haa)) ? ((8'hb9) ? (8'ha0) : (7'h40)) : {(8'hbe), (8'hb7)}) ? (8'ha6) : (((8'hb9) << (8'ha3)) ? ((8'h9d) ? (8'h9c) : (8'ha3)) : ((8'had) ? (8'hb2) : (8'ha3))))) : (~&((((8'hab) + (8'h9d)) && (~(7'h40))) >= (^~(~&(8'hbc)))))))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire30;
  input wire [(4'hf):(1'h0)] wire29;
  input wire signed [(4'hd):(1'h0)] wire28;
  input wire signed [(4'hd):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire45;
  wire signed [(4'hf):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire42;
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire28[(3'h5):(3'h4)])
        begin
          if ((wire29[(3'h7):(3'h6)] ?
              wire28 : $unsigned($unsigned(((wire29 ? wire28 : wire29) ?
                  wire30[(2'h3):(1'h0)] : $signed(wire27))))))
            begin
              reg31 <= $unsigned(wire30[(1'h1):(1'h0)]);
            end
          else
            begin
              reg31 <= wire27;
              reg32 <= reg31[(1'h0):(1'h0)];
              reg33 <= ($signed(({{wire28, (8'hb9)}, (+reg31)} ?
                  wire29 : $signed((~reg31)))) * $unsigned(reg32[(2'h3):(2'h2)]));
              reg34 <= $unsigned((+(&{{reg33}})));
              reg35 <= (&reg32);
            end
          if ((^~({$signed(reg34)} || (wire29 ?
              (8'ha5) : (wire30 ? $unsigned(wire30) : wire29)))))
            begin
              reg36 <= (((^~((+reg32) & $unsigned(wire27))) ?
                      (~|wire27[(3'h5):(2'h3)]) : wire27[(4'h8):(3'h7)]) ?
                  {{{(~^wire27)},
                          ((^wire29) == wire28[(3'h6):(3'h5)])}} : {$unsigned(((wire30 ?
                          reg33 : wire29) == $signed(reg32))),
                      ($signed((|wire27)) || wire28)});
              reg37 <= ((wire30[(1'h0):(1'h0)] <= wire29[(2'h2):(2'h2)]) && $signed({$unsigned((reg33 >> wire30)),
                  (reg35[(3'h6):(2'h3)] ? reg34[(2'h2):(1'h0)] : reg31)}));
              reg38 <= reg32[(1'h1):(1'h0)];
            end
          else
            begin
              reg36 <= reg35;
              reg37 <= {(reg34 ?
                      reg37 : (-((wire27 ? reg37 : reg38) || (~^reg35))))};
              reg38 <= $unsigned(((-$signed($unsigned(reg37))) == $unsigned(reg33)));
              reg39 <= $signed((~&reg32));
              reg40 <= wire28[(3'h7):(1'h1)];
            end
        end
      else
        begin
          reg31 <= ($unsigned(wire29) ^ $signed(($unsigned(reg34) && (&(reg38 ^ wire27)))));
          reg32 <= wire27[(4'hd):(4'hc)];
          reg33 <= ((reg34[(2'h2):(1'h1)] ?
              reg33 : ($signed(reg31[(4'hb):(1'h1)]) ?
                  (~&(wire27 ?
                      reg36 : reg33)) : reg35)) <<< $unsigned({reg33[(3'h5):(3'h4)],
              ((reg33 ? reg38 : reg35) + $unsigned((8'h9e)))}));
          reg34 <= (($signed({(wire30 ? reg40 : wire29),
                      (wire29 ? wire30 : reg36)}) ?
                  $unsigned($signed((reg38 + reg32))) : (reg36 || $unsigned((reg33 ?
                      wire29 : reg40)))) ?
              (^$signed((^$signed(reg35)))) : ((7'h44) ?
                  (($unsigned(reg32) ?
                      $signed(reg32) : (reg37 || reg40)) ^ ((reg38 & wire29) - $signed(wire28))) : $signed((reg40[(1'h1):(1'h1)] ?
                      reg38[(2'h2):(2'h2)] : reg38[(1'h0):(1'h0)]))));
          if (($signed(($signed({wire28, (8'hb4)}) <<< $unsigned((reg34 ?
                  reg31 : reg32)))) ?
              (&reg40) : (~|$unsigned((~&reg32)))))
            begin
              reg35 <= reg40;
              reg36 <= (7'h44);
            end
          else
            begin
              reg35 <= reg33;
              reg36 <= wire29[(4'h8):(1'h0)];
              reg37 <= (^~{(-(~reg37)), reg36[(3'h6):(1'h1)]});
            end
        end
      reg41 <= $unsigned(reg35);
    end
  assign wire42 = ((($unsigned((reg37 != reg31)) <= ((reg40 ?
                              wire27 : (8'h9e)) ?
                          (7'h43) : ((8'ha2) ?
                              reg38 : (8'hbe)))) ~^ $signed((reg33[(3'h6):(3'h5)] <<< (wire30 ?
                          reg33 : reg39)))) ?
                      $unsigned($signed(($signed(reg38) ?
                          reg39[(3'h5):(1'h1)] : (wire27 ?
                              wire27 : wire29)))) : $unsigned(reg32));
  assign wire43 = $signed($signed({($unsigned(reg34) != reg31)}));
  assign wire44 = (+wire43[(4'hd):(1'h0)]);
  assign wire45 = (8'hbb);
  assign wire46 = $unsigned($signed(((-wire45[(3'h5):(3'h5)]) + wire45[(4'hd):(4'hb)])));
  assign wire47 = {(wire43[(4'hc):(3'h5)] >>> $signed($unsigned(wire43[(3'h4):(1'h0)])))};
  assign wire48 = reg41[(4'he):(1'h0)];
endmodule
