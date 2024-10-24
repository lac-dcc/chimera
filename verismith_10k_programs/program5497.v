module top
#(parameter param103 = (((((~(8'ha6)) ? ((8'hb6) ? (8'hb3) : (8'ha0)) : (+(8'had))) ? (((8'hbf) ? (7'h44) : (8'hb9)) | (~|(8'had))) : (-{(8'hb7)})) ? ((^~(^~(8'hb6))) ? ({(8'hb9)} != {(8'hb8)}) : ((|(8'ha5)) ? ((8'ha7) ? (8'had) : (8'hb3)) : {(8'hac)})) : (!{(|(8'had))})) ? (~|(~(~&(~(8'ha4))))) : ((({(8'hb5)} + ((8'hb7) ? (8'hba) : (8'hab))) + (+(!(8'hbe)))) ? (((8'hb5) && (+(8'hb8))) ^ (((7'h41) ? (8'hbe) : (8'hb6)) ? (-(8'hb8)) : (&(8'hbe)))) : ((~^(~(8'h9f))) ? (^(~^(8'hbb))) : ((8'hb0) < ((8'hb5) ^ (7'h40)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire [(2'h3):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire102;
  wire [(3'h7):(1'h0)] wire96;
  wire [(3'h5):(1'h0)] wire94;
  wire [(4'ha):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(4'h8):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  assign y = {wire102,
                 wire96,
                 wire94,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire5 = $signed(wire2[(5'h10):(3'h4)]);
  assign wire6 = wire1;
  assign wire7 = wire2[(3'h7):(2'h3)];
  assign wire8 = (((wire4 && ($unsigned((8'ha4)) ~^ $unsigned(wire3))) ?
                     ($unsigned(wire1) > $signed(wire7)) : wire1) <<< {wire6});
  assign wire9 = ((~|wire0[(1'h1):(1'h1)]) >= $signed($signed($signed(wire8))));
  assign wire10 = (8'ha9);
  assign wire11 = wire7;
  assign wire12 = {(|(wire6[(4'h9):(2'h2)] ?
                          ((|wire6) << (^~(8'hb0))) : $unsigned((wire11 > wire1))))};
  assign wire13 = {$unsigned(($unsigned({wire2, wire12}) != ((wire5 + wire1) ?
                          $unsigned((8'hbd)) : (!wire2)))),
                      wire1};
  module14 #() modinst95 (wire94, clk, wire12, wire9, wire2, wire6);
  assign wire96 = $signed((wire6 || (+$unsigned((wire13 ? wire4 : wire1)))));
  always
    @(posedge clk) begin
      reg97 <= wire5;
      reg98 <= $signed((8'hab));
      reg99 <= wire7[(2'h3):(2'h2)];
      reg100 <= (wire3 ?
          ($unsigned({$unsigned(wire0)}) == ($unsigned($unsigned(wire3)) ?
              ({wire96} >> wire1[(3'h7):(3'h6)]) : (wire6[(4'he):(4'ha)] ?
                  wire11[(4'ha):(4'h9)] : (wire3 ^ wire12)))) : wire10[(3'h4):(1'h1)]);
      reg101 <= wire96[(1'h0):(1'h0)];
    end
  assign wire102 = $signed($unsigned(($unsigned($unsigned((8'ha6))) ?
                       reg98 : reg99[(3'h7):(2'h3)])));
endmodule

module module14
#(parameter param92 = (+({((8'ha7) ^~ (-(8'hb9)))} << (8'hae))), 
parameter param93 = {(param92 ~^ (8'ha3)), ((^~param92) ? param92 : ((|{param92, param92}) != ((param92 ? param92 : (8'ha4)) >> param92)))})
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire18;
  input wire signed [(3'h6):(1'h0)] wire17;
  input wire signed [(5'h15):(1'h0)] wire16;
  input wire [(4'hb):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire90;
  wire [(5'h10):(1'h0)] wire40;
  wire signed [(3'h7):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire88;
  assign y = {wire91,
                 wire90,
                 wire40,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire42,
                 wire88,
                 (1'h0)};
  assign wire19 = $unsigned((wire18[(2'h2):(1'h1)] ?
                      ((^$signed(wire17)) >> $signed({(8'hbe),
                          wire18})) : $unsigned($unsigned($unsigned(wire17)))));
  assign wire20 = wire15;
  assign wire21 = (-{wire17});
  assign wire22 = $signed(($signed(wire17[(3'h6):(3'h5)]) ?
                      ({$unsigned((8'ha4))} >= (~&$signed(wire19))) : (&wire16)));
  assign wire23 = {$unsigned(wire20),
                      ($unsigned(($signed(wire15) + (8'hb3))) ?
                          ({{wire19},
                              (wire20 ?
                                  wire19 : wire22)} <<< (~{wire21})) : (8'h9d))};
  assign wire24 = wire18[(4'ha):(3'h7)];
  module25 #() modinst41 (.clk(clk), .wire27(wire22), .wire30(wire24), .wire26(wire19), .wire29(wire16), .wire28(wire20), .y(wire40));
  assign wire42 = wire18[(3'h6):(3'h4)];
  module43 #() modinst89 (.clk(clk), .wire48(wire40), .y(wire88), .wire46(wire23), .wire47(wire15), .wire45(wire18), .wire44(wire20));
  assign wire90 = $unsigned(((wire88[(4'ha):(2'h3)] ?
                      $signed((^~wire88)) : $unsigned($unsigned(wire21))) - wire20[(2'h2):(2'h2)]));
  assign wire91 = $unsigned((wire40 ?
                      (($signed(wire24) ?
                              wire24[(3'h6):(3'h6)] : $signed(wire22)) ?
                          wire42 : wire90[(4'hd):(3'h5)]) : $signed((8'hb1))));
endmodule

module module43
#(parameter param87 = ((~|((((8'ha7) & (8'ha2)) ? (^~(8'ha4)) : ((8'hac) ? (8'hb9) : (8'ha9))) ? ({(8'haf), (8'hb7)} ? ((8'h9c) * (8'hbb)) : ((8'ha6) ? (8'hb0) : (8'hba))) : (((8'hb5) & (8'haa)) ~^ (^(8'hbb))))) >>> ((((^(8'ha3)) ? ((7'h41) >>> (8'ha2)) : ((8'hbe) ? (8'ha6) : (8'hb4))) >> {(^~(8'hb5))}) ? (^~(((7'h43) ? (7'h43) : (8'haf)) <= (~&(8'had)))) : ((((8'hb6) <<< (7'h42)) < ((8'hb1) ? (8'hbe) : (8'hb7))) >= (+((7'h42) ? (8'hae) : (8'haa)))))))
(y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h1c7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire48;
  input wire [(4'hb):(1'h0)] wire47;
  input wire [(3'h4):(1'h0)] wire46;
  input wire signed [(4'he):(1'h0)] wire45;
  input wire signed [(4'hd):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire86;
  wire signed [(4'h9):(1'h0)] wire85;
  wire signed [(5'h11):(1'h0)] wire84;
  wire signed [(3'h6):(1'h0)] wire83;
  wire signed [(4'ha):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire80;
  wire [(4'h9):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire78;
  wire [(5'h15):(1'h0)] wire77;
  wire signed [(4'h8):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire62;
  wire signed [(3'h7):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire49;
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg [(4'h9):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
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
                 wire76,
                 wire62,
                 wire61,
                 wire50,
                 wire49,
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
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire49 = ((+($signed($unsigned(wire44)) > wire44[(3'h7):(3'h4)])) ?
                      ((~&($unsigned(wire46) ?
                              wire44[(1'h1):(1'h0)] : (wire46 >> wire48))) ?
                          (~|wire45) : (!$signed((7'h44)))) : wire47);
  assign wire50 = $unsigned(((8'h9c) ?
                      (wire48[(2'h3):(1'h0)] || wire47) : $signed(($signed(wire46) ^ wire45))));
  always
    @(posedge clk) begin
      reg51 <= $unsigned(($signed((|(wire49 >= (8'hae)))) ?
          ($unsigned(wire47[(3'h5):(3'h4)]) ?
              (~(&(8'haf))) : (-wire48)) : {(|wire47), wire48}));
      reg52 <= ((8'hb3) ? wire49[(1'h1):(1'h1)] : reg51);
      if (wire50)
        begin
          reg53 <= wire45;
        end
      else
        begin
          if ((~^$signed((-(^~(wire46 | wire50))))))
            begin
              reg53 <= (~&$unsigned((reg51[(4'hc):(3'h4)] << (((8'h9e) + reg51) & $signed(wire47)))));
              reg54 <= (+(wire50 <= ((^(reg53 ?
                  wire46 : (8'ha2))) << wire45[(4'h8):(3'h4)])));
              reg55 <= ($signed($unsigned($unsigned((wire50 >> wire50)))) ?
                  ({wire47[(1'h1):(1'h1)], $unsigned($signed(wire49))} ?
                      {{wire44[(3'h5):(2'h2)]},
                          wire49[(1'h0):(1'h0)]} : (~{$signed(wire46),
                          $unsigned(wire47)})) : wire44);
              reg56 <= $unsigned(wire49[(2'h3):(2'h2)]);
            end
          else
            begin
              reg53 <= (((^~(-$signed(wire46))) >>> (!reg53)) < reg55[(4'hf):(3'h7)]);
              reg54 <= $unsigned(reg56);
              reg55 <= (wire45 ? (wire46 >> $signed({reg54})) : (8'hb8));
            end
          reg57 <= $signed((reg54 ?
              (~$unsigned($unsigned(reg55))) : (~^(wire48 <= (reg56 ?
                  wire45 : wire47)))));
          reg58 <= (-$unsigned((~^((reg52 >= wire46) + $unsigned(reg52)))));
          reg59 <= $signed(reg57);
        end
      reg60 <= $unsigned({$unsigned(wire45[(3'h5):(2'h3)]),
          ({{(8'hb0)}} ?
              ($signed(reg52) & (reg52 ?
                  reg57 : wire49)) : $signed((~&reg57)))});
    end
  assign wire61 = wire48;
  assign wire62 = {reg57[(4'hf):(1'h1)]};
  always
    @(posedge clk) begin
      if ($signed(reg52[(1'h0):(1'h0)]))
        begin
          if (wire45)
            begin
              reg63 <= $unsigned(reg59);
              reg64 <= wire48;
            end
          else
            begin
              reg63 <= wire45[(4'he):(4'hb)];
            end
          reg65 <= ((8'hbb) <= reg56[(4'hc):(1'h0)]);
        end
      else
        begin
          if ($unsigned(wire47[(3'h6):(2'h2)]))
            begin
              reg63 <= $unsigned({(wire48 ?
                      (~|(|reg55)) : (~&$unsigned(reg56))),
                  (reg56[(5'h10):(4'hc)] ?
                      ($unsigned(reg60) > reg57) : $signed($signed(wire46)))});
              reg64 <= ((~($unsigned($signed(reg54)) << ($unsigned(wire61) <= $signed((8'hb6))))) ?
                  $unsigned((8'hb6)) : $signed($signed(($signed(wire47) ?
                      $signed((8'ha8)) : $unsigned((7'h40))))));
              reg65 <= {(~|wire61)};
            end
          else
            begin
              reg63 <= {$signed(wire61[(3'h7):(3'h5)])};
            end
          reg66 <= $unsigned((^((((8'ha9) + reg58) ?
              reg56[(4'h9):(2'h2)] : $unsigned((8'hbf))) + wire61[(1'h1):(1'h0)])));
        end
      reg67 <= $signed((~&(($signed(wire45) != (8'hab)) ~^ wire62)));
      reg68 <= wire46[(1'h1):(1'h1)];
      reg69 <= reg60;
      if ($unsigned($signed(reg64)))
        begin
          reg70 <= wire61[(3'h7):(2'h3)];
        end
      else
        begin
          if (wire50)
            begin
              reg70 <= {({$unsigned((wire47 >= wire46)),
                      ($signed(wire49) ?
                          (reg66 != reg53) : ((7'h43) != wire47))} ^~ (~|$unsigned((reg67 ?
                      reg59 : wire50)))),
                  (reg59[(3'h4):(1'h0)] ?
                      $signed((~$signed((7'h41)))) : $signed((((8'hb5) <<< reg56) & (|reg59))))};
            end
          else
            begin
              reg70 <= $unsigned($unsigned(reg55));
              reg71 <= reg65;
              reg72 <= $unsigned($signed((reg64 + (8'hb0))));
            end
          reg73 <= $unsigned($unsigned({(reg55 ?
                  (wire47 ? reg60 : (8'ha7)) : (&reg67))}));
          reg74 <= (|{$unsigned(wire50[(4'hb):(2'h2)]),
              (reg65 ?
                  {(8'hbc), (reg58 ? reg52 : reg59)} : $unsigned((reg71 ?
                      wire61 : reg63)))});
          reg75 <= ({reg53[(1'h0):(1'h0)]} ?
              $signed((|reg70[(5'h11):(1'h1)])) : reg60[(4'hf):(1'h0)]);
        end
    end
  assign wire76 = ((((~&(!reg74)) + reg66[(5'h14):(4'hb)]) ?
                          ((-$signed(reg64)) & ((reg56 < wire44) <<< $unsigned(reg65))) : ($unsigned((reg70 && (7'h40))) <<< ((|reg52) < wire49))) ?
                      $signed(wire49) : reg67[(3'h4):(3'h4)]);
  assign wire77 = {reg65};
  assign wire78 = (reg58 & $unsigned(reg70[(3'h4):(3'h4)]));
  assign wire79 = $signed({{wire77, (!(!reg69))}});
  assign wire80 = $signed({{($signed(reg60) << $unsigned((8'h9e)))}});
  assign wire81 = reg57;
  assign wire82 = reg67;
  assign wire83 = wire78[(1'h0):(1'h0)];
  assign wire84 = (+(~&reg54));
  assign wire85 = wire81[(3'h6):(3'h4)];
  assign wire86 = $signed(wire81);
endmodule

module module25
#(parameter param39 = ((-(((~&(7'h41)) ~^ (~^(8'ha2))) < (~^(^(8'hb3))))) ^~ ((!(^~((8'haa) ? (8'ha1) : (7'h41)))) < ((((8'ha3) ? (8'hb4) : (8'ha6)) <<< ((7'h43) ? (8'ha6) : (8'ha4))) ? {((8'ha6) ? (8'ha0) : (8'hab)), (~|(8'hbf))} : (8'ha9)))))
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire30;
  input wire [(5'h15):(1'h0)] wire29;
  input wire signed [(3'h7):(1'h0)] wire28;
  input wire signed [(5'h15):(1'h0)] wire27;
  input wire signed [(5'h15):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire31;
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 (1'h0)};
  assign wire31 = $unsigned((+$signed({wire30})));
  assign wire32 = wire30[(1'h0):(1'h0)];
  assign wire33 = wire29[(4'h8):(3'h5)];
  assign wire34 = (8'h9e);
  assign wire35 = (((~$unsigned((&wire30))) + (wire26 ?
                          $signed(wire26) : ($signed(wire26) ?
                              (~|wire32) : wire28))) ?
                      (~^{$unsigned((wire33 > wire28))}) : $unsigned((!$unsigned($unsigned(wire28)))));
  assign wire36 = $signed((~{$signed($signed(wire33))}));
  assign wire37 = $signed($unsigned($signed((~&(wire36 ? wire28 : wire36)))));
  assign wire38 = $signed($signed(((+wire37) << wire27)));
endmodule
