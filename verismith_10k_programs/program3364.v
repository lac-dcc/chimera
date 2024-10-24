module top
#(parameter param109 = (((+(((8'hb6) ? (7'h42) : (8'hbf)) ? {(8'hb9)} : ((8'hb3) ? (8'hb6) : (8'hb7)))) ? (7'h41) : (!(~((8'hb4) ? (8'ha8) : (8'haf))))) ? (({((8'hbc) ? (7'h40) : (8'h9c)), ((8'hac) + (7'h43))} && ({(8'h9c)} ? ((8'h9c) - (8'haa)) : ((8'ha9) + (8'hbe)))) | ({((8'hbe) ? (8'hb2) : (8'hb6))} ? (((7'h42) <= (8'hb6)) != {(8'hbc), (8'hb8)}) : (|((8'hac) ? (8'ha3) : (8'hb3))))) : (((((8'hac) ^~ (8'ha0)) ^~ ((8'ha0) >>> (8'hac))) ? {(!(8'had)), ((8'hb2) ? (8'hb9) : (8'hb1))} : ((~(8'hba)) ? ((8'hae) < (8'hb5)) : {(8'ha2), (8'ha6)})) ? (&(+{(8'ha7), (8'had)})) : {(|(^(8'hb6))), (^~(8'hae))})), 
parameter param110 = param109)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire108;
  wire [(3'h5):(1'h0)] wire107;
  wire [(5'h13):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire105;
  wire [(4'hb):(1'h0)] wire104;
  wire [(4'he):(1'h0)] wire103;
  wire [(4'hf):(1'h0)] wire102;
  wire signed [(5'h12):(1'h0)] wire100;
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire100,
                 (1'h0)};
  module4 #() modinst101 (.y(wire100), .wire8(wire2), .wire5(wire1), .wire6(wire0), .clk(clk), .wire7(wire3));
  assign wire102 = (~&wire0[(4'hc):(1'h0)]);
  assign wire103 = $signed(((|wire1[(5'h13):(5'h13)]) ?
                       wire0 : $unsigned((8'hb5))));
  assign wire104 = wire0[(4'hb):(4'hb)];
  assign wire105 = ($signed(wire1[(5'h15):(4'h8)]) ?
                       $unsigned(((~&$unsigned((8'haf))) ^~ $unsigned((~wire1)))) : ($signed($signed((+wire3))) <<< (($unsigned((8'haa)) ?
                               (|wire100) : $signed((8'ha4))) ?
                           wire0 : {wire0, (8'haa)})));
  assign wire106 = wire0;
  assign wire107 = $signed((!$signed($signed({(8'hbc), wire2}))));
  assign wire108 = $signed((({wire102, wire102[(3'h5):(2'h3)]} ?
                       wire100[(4'hb):(3'h5)] : ($unsigned(wire105) ~^ (~|wire107))) && (~^($unsigned(wire2) ?
                       wire102 : wire0))));
endmodule

module module4
#(parameter param98 = (~^(((!(&(8'hb8))) ^~ (^~(|(8'hb3)))) ~^ ({(~^(8'hb9))} ? ((~&(8'ha1)) ? (^(8'hba)) : (~(8'hb5))) : ({(8'hb2), (7'h44)} << (~^(8'haa)))))), 
parameter param99 = (((^~({param98, param98} ? {param98, param98} : {param98, param98})) ? (~&param98) : (-(~|((7'h43) ? (8'h9e) : param98)))) < (((param98 ? (~&param98) : (param98 ? (8'h9f) : param98)) ? ((-param98) ? (8'hb4) : param98) : param98) & ((8'hb8) ? param98 : param98))))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire5;
  input wire [(4'hb):(1'h0)] wire6;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire97;
  wire signed [(5'h13):(1'h0)] wire96;
  wire [(4'hc):(1'h0)] wire95;
  wire signed [(2'h3):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire93;
  wire [(4'ha):(1'h0)] wire92;
  wire signed [(5'h12):(1'h0)] wire91;
  wire [(4'hf):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire89;
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire36,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire89,
                 (1'h0)};
  module9 #() modinst37 (wire36, clk, wire7, wire8, wire6, wire5, (8'ha8));
  assign wire38 = $unsigned($signed((((^~wire8) != (wire5 > wire36)) ?
                      (((8'hae) ^~ wire8) + (!(8'hbf))) : wire5)));
  assign wire39 = wire7[(3'h5):(3'h5)];
  assign wire40 = $unsigned(wire38);
  assign wire41 = (^~{$signed((wire5 ? wire38 : (^wire40)))});
  module42 #() modinst90 (.wire45(wire7), .clk(clk), .wire46(wire39), .y(wire89), .wire43(wire38), .wire47(wire8), .wire44(wire36));
  assign wire91 = wire7[(3'h4):(2'h3)];
  assign wire92 = $unsigned((^wire38[(2'h2):(1'h1)]));
  assign wire93 = (~|($signed(((wire5 ? wire38 : wire39) ^~ (^~wire5))) ?
                      (^wire7[(4'h9):(2'h3)]) : wire7[(4'hc):(1'h0)]));
  assign wire94 = (8'hb4);
  assign wire95 = (8'ha7);
  assign wire96 = $signed((~wire94[(2'h2):(2'h2)]));
  assign wire97 = wire39[(2'h3):(1'h0)];
endmodule

module module42
#(parameter param88 = (~^(~&((-((8'h9e) ? (8'ha1) : (8'ha9))) ? (((8'h9d) ? (7'h44) : (8'h9c)) ? (~^(8'ha5)) : ((8'h9e) ? (8'haa) : (8'haf))) : ((|(8'hac)) ? (~|(8'ha8)) : (~(8'had)))))))
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h1db):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire47;
  input wire [(4'hf):(1'h0)] wire46;
  input wire [(4'he):(1'h0)] wire45;
  input wire [(4'hb):(1'h0)] wire44;
  input wire [(2'h2):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire87;
  wire [(3'h7):(1'h0)] wire86;
  wire [(5'h11):(1'h0)] wire85;
  wire [(5'h14):(1'h0)] wire84;
  wire signed [(3'h6):(1'h0)] wire80;
  wire signed [(2'h3):(1'h0)] wire79;
  wire [(5'h11):(1'h0)] wire56;
  wire signed [(3'h6):(1'h0)] wire55;
  wire [(3'h4):(1'h0)] wire54;
  wire [(4'hd):(1'h0)] wire53;
  wire [(5'h14):(1'h0)] wire52;
  wire signed [(2'h2):(1'h0)] wire51;
  wire [(5'h11):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg [(5'h10):(1'h0)] reg73 = (1'h0);
  reg [(3'h4):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire80,
                 wire79,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg83,
                 reg82,
                 reg81,
                 reg78,
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
                 reg57,
                 (1'h0)};
  assign wire48 = {wire47[(3'h5):(1'h1)]};
  assign wire49 = (~|($signed($signed((wire47 ? wire45 : wire43))) ?
                      $signed(wire43[(2'h2):(2'h2)]) : (((^wire48) ^~ (-wire44)) - (^~wire47[(4'ha):(1'h0)]))));
  assign wire50 = ($unsigned((wire47[(4'h9):(4'h8)] - $signed($unsigned(wire45)))) & {($signed(((8'hb6) ?
                          (8'hb0) : wire49)) != {wire44, (wire47 << wire46)}),
                      $signed($signed((wire47 ? wire43 : wire45)))});
  assign wire51 = {wire43[(1'h0):(1'h0)]};
  assign wire52 = wire45[(4'hc):(1'h1)];
  assign wire53 = $unsigned((7'h44));
  assign wire54 = ($unsigned({wire46,
                          ($unsigned(wire50) ?
                              $unsigned(wire50) : (wire46 != wire47))}) ?
                      (+$signed($unsigned($unsigned(wire45)))) : $signed(((8'hb0) ^~ wire45)));
  assign wire55 = $unsigned($signed(wire53[(3'h5):(3'h4)]));
  assign wire56 = wire52;
  always
    @(posedge clk) begin
      if ({$unsigned(((((8'hb6) >> wire52) + (wire43 | (8'hbc))) < wire46[(3'h5):(1'h0)])),
          wire48[(4'ha):(1'h0)]})
        begin
          if (wire47[(4'hb):(3'h6)])
            begin
              reg57 <= $unsigned({((~&wire47[(1'h0):(1'h0)]) ?
                      $signed($unsigned(wire43)) : $signed(wire45))});
            end
          else
            begin
              reg57 <= $signed((+wire48[(5'h10):(5'h10)]));
            end
          if (($signed(((wire49 ? (wire53 ? wire43 : wire55) : (~&wire45)) ?
                  wire45[(4'h9):(3'h6)] : (wire53 < (wire49 ?
                      wire54 : wire51)))) ?
              wire52[(4'hb):(4'hb)] : $signed({$unsigned((!wire53)),
                  wire53[(3'h7):(2'h2)]})))
            begin
              reg58 <= (8'had);
              reg59 <= {(wire46 << (~&({(8'ha1), wire45} ?
                      $unsigned(wire45) : (8'ha1)))),
                  wire49};
              reg60 <= $unsigned((wire49[(3'h4):(2'h2)] - (+(wire50 ?
                  (wire56 * wire52) : ((7'h40) <= wire46)))));
              reg61 <= $signed((^(reg60 ?
                  wire51[(2'h2):(2'h2)] : ($signed(wire49) != $unsigned(reg59)))));
              reg62 <= {$signed($signed(($unsigned(wire45) ?
                      reg61 : (wire55 ? wire43 : wire48))))};
            end
          else
            begin
              reg58 <= (((($signed(wire55) >= wire55[(2'h2):(1'h1)]) & reg60) > (($unsigned(wire54) >>> {wire52}) < reg57[(2'h3):(1'h1)])) > {{$signed(wire47[(1'h0):(1'h0)]),
                      (8'ha4)}});
              reg59 <= {wire56[(3'h7):(2'h2)]};
              reg60 <= $unsigned($signed((wire53[(4'ha):(1'h1)] ?
                  wire49 : wire46[(4'h9):(1'h0)])));
              reg61 <= $unsigned(wire43[(1'h1):(1'h1)]);
              reg62 <= reg59;
            end
          if (($signed(wire54[(3'h4):(2'h3)]) <= (8'h9f)))
            begin
              reg63 <= $unsigned((^(~$signed((~&wire43)))));
              reg64 <= reg57[(4'he):(4'hb)];
              reg65 <= (&$signed(reg64));
            end
          else
            begin
              reg63 <= (reg63[(5'h11):(1'h0)] ?
                  (!((+$unsigned(wire47)) << $signed(reg62[(4'hd):(4'hb)]))) : $unsigned(reg65));
              reg64 <= $unsigned(wire45[(4'ha):(3'h4)]);
            end
        end
      else
        begin
          reg57 <= (wire53[(4'hb):(1'h0)] ?
              ($signed(wire55) ?
                  (reg63 ?
                      reg57 : ($unsigned(reg57) ?
                          $unsigned(reg65) : (+wire43))) : $signed($signed((wire44 ?
                      wire56 : reg59)))) : $unsigned({(!$unsigned(wire44))}));
          reg58 <= $signed(wire55[(3'h6):(3'h5)]);
          if (reg57[(4'h9):(2'h2)])
            begin
              reg59 <= {((~^reg64) - $unsigned(wire45[(4'h8):(4'h8)])), wire43};
              reg60 <= wire53[(2'h3):(1'h0)];
            end
          else
            begin
              reg59 <= {$unsigned($signed(wire55[(1'h0):(1'h0)])),
                  (((-(wire43 ?
                      wire45 : reg61)) >> wire43[(1'h0):(1'h0)]) >>> (-$signed((~(8'h9c)))))};
              reg60 <= (^$signed(({(wire46 ?
                      reg57 : wire51)} == wire44[(3'h7):(3'h7)])));
              reg61 <= {(-(($signed((8'hac)) ? {reg57} : (~^wire50)) ?
                      $signed({wire53}) : wire56[(4'hc):(1'h1)]))};
              reg62 <= ((+(~&{(~|reg59)})) || $signed($unsigned(wire47[(4'hb):(4'ha)])));
            end
        end
      reg66 <= $signed($unsigned((~^$signed({reg59}))));
      if (((wire53[(4'h8):(2'h2)] * (-$signed(reg65))) ?
          $signed($unsigned(((wire52 * reg58) >> (wire54 | wire49)))) : $unsigned((^~$signed($signed(reg62))))))
        begin
          reg67 <= $unsigned(reg58[(2'h3):(2'h3)]);
          if (reg63[(5'h11):(1'h1)])
            begin
              reg68 <= ($signed(wire48[(1'h0):(1'h0)]) ?
                  {(~(wire51[(1'h1):(1'h1)] ? $signed(reg64) : (~^wire56))),
                      wire54[(1'h1):(1'h0)]} : reg65[(4'he):(4'hd)]);
              reg69 <= wire43;
              reg70 <= ($signed((~((wire53 || wire48) ?
                  wire48[(4'he):(1'h0)] : (reg66 && (8'hbd))))) + {($unsigned($unsigned(reg66)) && wire51[(2'h2):(1'h0)]),
                  (-($unsigned((8'hb0)) << (wire47 ? (8'hb3) : (8'had))))});
            end
          else
            begin
              reg68 <= {((8'hbd) && $signed((7'h41)))};
              reg69 <= ($signed(wire52[(2'h2):(1'h0)]) - {$signed(($signed(reg65) && reg63)),
                  ({reg69[(1'h0):(1'h0)]} ? $signed(reg62) : (8'hb3))});
              reg70 <= {reg69[(1'h0):(1'h0)]};
              reg71 <= {$unsigned($unsigned(reg65[(5'h13):(4'hd)]))};
            end
          if (((8'h9c) || reg64))
            begin
              reg72 <= {$unsigned(reg61[(3'h4):(1'h0)]), wire49};
              reg73 <= reg59;
              reg74 <= $unsigned((&(((reg72 >>> (8'ha4)) ?
                  (reg66 ^~ reg72) : wire50) ^~ {$signed((7'h42)), reg66})));
              reg75 <= reg62[(3'h5):(3'h4)];
              reg76 <= wire56;
            end
          else
            begin
              reg72 <= ($unsigned($unsigned($signed((^reg71)))) ?
                  (~^reg72) : {wire45[(3'h6):(2'h2)]});
              reg73 <= reg75[(2'h2):(1'h0)];
            end
          reg77 <= $unsigned($unsigned($unsigned($signed(reg57[(3'h6):(2'h3)]))));
          reg78 <= (-(wire54[(1'h1):(1'h0)] > $signed((reg57 ^~ wire47[(2'h2):(2'h2)]))));
        end
      else
        begin
          reg67 <= $unsigned(($unsigned(wire56[(3'h6):(1'h1)]) < ({$unsigned(wire51)} ?
              $signed((wire51 >> (8'ha9))) : (reg69 ?
                  (reg76 > (8'hb9)) : $signed(reg59)))));
          reg68 <= $unsigned(reg58[(3'h4):(1'h0)]);
          reg69 <= (!$unsigned((~|((^~wire46) ?
              (8'ha8) : wire51[(1'h0):(1'h0)]))));
          reg70 <= $unsigned({(reg58 ? $signed($signed(reg57)) : reg76),
              ($unsigned((~^(8'ha9))) << $unsigned(reg63))});
        end
    end
  assign wire79 = wire50[(3'h6):(3'h5)];
  assign wire80 = wire47;
  always
    @(posedge clk) begin
      reg81 <= wire49[(4'h8):(1'h1)];
      reg82 <= (({(-$signed(reg69))} ? $unsigned(wire53) : wire46) ?
          {(^~reg81),
              (reg77 ?
                  reg78[(3'h5):(2'h2)] : {(wire80 ?
                          reg78 : wire49)})} : wire43);
      reg83 <= (8'hb0);
    end
  assign wire84 = $signed(((7'h42) | {reg71[(3'h6):(1'h1)]}));
  assign wire85 = (^~($unsigned((!wire53[(3'h5):(3'h5)])) + $signed($unsigned((-(8'hbc))))));
  assign wire86 = (($unsigned((8'hbc)) ?
                          {reg59,
                              $unsigned($unsigned(wire47))} : ($signed($signed((8'hb9))) ?
                              ((~&wire44) ?
                                  (wire49 << reg70) : (-(8'hb2))) : $unsigned(((8'hbf) ?
                                  reg61 : reg59)))) ?
                      $signed($unsigned(((~wire54) << (~wire46)))) : wire46);
  assign wire87 = $unsigned(((reg83[(2'h2):(1'h1)] ?
                          ((~wire44) >>> $signed((8'had))) : $signed({wire50})) ?
                      (^((wire44 <<< reg61) ?
                          (^reg60) : wire45)) : $signed(wire53)));
endmodule

module module9
#(parameter param35 = (~(((!((8'hb6) > (8'hab))) || (((8'haf) ? (8'ha3) : (8'ha6)) ? ((8'hb3) ? (8'hb5) : (7'h41)) : ((8'hb8) - (8'hbf)))) ? (^~(((8'ha1) ? (8'h9f) : (8'haa)) ? ((8'hb3) + (8'h9d)) : {(8'hbf), (8'hbf)})) : ((8'hbb) ? ((&(8'hbe)) ? ((8'hac) + (8'hb3)) : {(8'ha0), (8'hb4)}) : ((^~(8'ha4)) || ((8'hb8) ? (8'ha2) : (8'ha6)))))))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire14;
  input wire [(4'h8):(1'h0)] wire13;
  input wire signed [(4'hb):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire11;
  input wire signed [(3'h6):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire23;
  wire [(2'h3):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire15;
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire15 = $unsigned(wire14);
  assign wire16 = wire11;
  assign wire17 = (~^((wire12 != $unsigned((|wire14))) ?
                      $unsigned((-(wire10 ?
                          wire16 : wire11))) : $signed($unsigned((wire14 - (8'hbb))))));
  assign wire18 = wire12[(1'h1):(1'h1)];
  assign wire19 = wire16[(4'hf):(3'h5)];
  assign wire20 = $signed(((!(8'hb3)) <<< wire11));
  assign wire21 = (wire10 ? wire13 : ($unsigned((|{wire16, wire13})) & wire13));
  assign wire22 = wire16[(4'h8):(3'h5)];
  assign wire23 = ($unsigned($unsigned(wire20[(3'h7):(1'h1)])) != {(8'haa),
                      (wire19[(3'h6):(2'h2)] ?
                          $unsigned(wire11[(5'h11):(4'ha)]) : wire18)});
  assign wire24 = wire21[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg25 <= wire16[(4'h9):(3'h6)];
    end
  always
    @(posedge clk) begin
      if ({wire18[(3'h5):(1'h1)]})
        begin
          reg26 <= wire14[(4'he):(2'h3)];
          reg27 <= (^reg25[(3'h6):(2'h2)]);
          reg28 <= $unsigned((~|$unsigned($signed((wire20 >> wire12)))));
        end
      else
        begin
          reg26 <= (wire23[(2'h2):(1'h0)] > ((^$signed(wire21)) + wire20[(3'h4):(2'h2)]));
        end
      if (wire18[(3'h6):(3'h6)])
        begin
          reg29 <= (8'hbc);
          reg30 <= (&(~|wire20));
          reg31 <= reg28;
        end
      else
        begin
          reg29 <= wire21;
        end
      reg32 <= $signed((((+$unsigned(reg29)) ?
              $unsigned(wire16) : wire11[(3'h7):(3'h6)]) ?
          $signed(($unsigned(wire11) ?
              wire21[(2'h3):(1'h0)] : (-wire16))) : $signed(wire14[(3'h7):(1'h0)])));
    end
  assign wire33 = $signed(wire14);
  assign wire34 = {(wire21[(2'h3):(1'h0)] ?
                          (~^wire13) : ($unsigned((wire21 ^ wire19)) ?
                              ($signed(wire22) ?
                                  reg28[(4'ha):(4'h9)] : $signed(reg27)) : ((reg27 >= (8'hb4)) ?
                                  $unsigned(wire20) : $unsigned(wire24))))};
endmodule
