module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire97;
  wire signed [(5'h13):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire49;
  wire [(4'hc):(1'h0)] wire95;
  assign y = {wire98,
                 wire97,
                 wire44,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire95,
                 (1'h0)};
  assign wire4 = $signed((wire1 ?
                     $unsigned($unsigned({wire3,
                         wire0})) : ($signed($signed(wire0)) ?
                         $signed(wire2[(3'h6):(2'h2)]) : ($signed((8'ha4)) ?
                             (wire2 <= wire3) : $unsigned(wire2)))));
  assign wire5 = (wire4[(3'h7):(2'h2)] ?
                     (&$unsigned($signed((wire2 ?
                         wire2 : wire0)))) : ({$signed($unsigned(wire0))} >> (wire3[(4'hb):(4'hb)] ?
                         $signed((wire4 ? wire1 : wire2)) : wire1)));
  assign wire6 = $unsigned($signed((($signed((8'ha7)) ?
                         wire2[(3'h4):(1'h1)] : {wire3, wire0}) ?
                     (|(wire3 & wire4)) : {wire2[(3'h7):(2'h2)],
                         $unsigned(wire1)})));
  assign wire7 = ($signed((!(~^(wire6 ^~ wire0)))) ^~ (!(((wire4 << wire0) ?
                         $signed(wire4) : (~^wire5)) ?
                     wire6 : (wire5 ? wire1[(2'h3):(2'h2)] : (^wire4)))));
  assign wire8 = wire0[(4'hb):(3'h5)];
  assign wire9 = (8'ha3);
  module10 #() modinst45 (.wire13(wire2), .wire15(wire4), .clk(clk), .y(wire44), .wire12(wire6), .wire14(wire0), .wire11(wire3));
  assign wire46 = (wire7[(3'h5):(3'h5)] << ($unsigned((^(^~wire8))) ?
                      $unsigned($unsigned($signed(wire44))) : $signed($signed((wire7 ?
                          wire8 : wire5)))));
  assign wire47 = wire2;
  assign wire48 = wire4;
  assign wire49 = (^~wire3[(3'h7):(3'h5)]);
  module50 #() modinst96 (.y(wire95), .wire51(wire4), .wire55(wire6), .wire53(wire7), .wire52(wire49), .clk(clk), .wire54(wire48));
  assign wire97 = ((~|$signed(wire49[(4'hd):(3'h7)])) ~^ $unsigned({((wire46 + wire0) ?
                          (wire7 ^ wire3) : $signed(wire7))}));
  assign wire98 = (({$unsigned(wire4[(2'h3):(2'h2)])} ?
                          $unsigned({$unsigned(wire46),
                              wire9[(5'h13):(2'h3)]}) : (~|wire0)) ?
                      $unsigned(wire49) : {(|($signed(wire49) ?
                              $unsigned(wire8) : (wire49 & wire47)))});
endmodule

module module50
#(parameter param94 = {({((8'h9d) ? (!(8'hab)) : (~&(8'h9c)))} <<< (-(~^((8'h9e) ? (8'hb5) : (8'h9e)))))})
(y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire55;
  input wire [(4'h9):(1'h0)] wire54;
  input wire [(4'h9):(1'h0)] wire53;
  input wire [(5'h12):(1'h0)] wire52;
  input wire [(5'h11):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire93;
  wire [(5'h12):(1'h0)] wire91;
  wire [(5'h13):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire57;
  wire signed [(5'h10):(1'h0)] wire56;
  assign y = {wire93, wire91, wire58, wire57, wire56, (1'h0)};
  assign wire56 = {(~^$signed((!(wire51 >>> wire54)))),
                      $signed({((8'hac) ?
                              $unsigned(wire55) : $unsigned(wire53))})};
  assign wire57 = $signed((|wire52));
  assign wire58 = wire57;
  module59 #() modinst92 (wire91, clk, wire55, wire54, wire56, wire57);
  assign wire93 = wire91;
endmodule

module module10
#(parameter param42 = (~^((((^~(8'hac)) + ((8'ha1) != (8'hb7))) > {((8'hb6) ? (8'ha4) : (8'hbd))}) ? (~(((8'h9d) ? (7'h43) : (8'ha9)) <= {(8'hb5)})) : ((~(~&(8'ha6))) > (((8'hae) ? (8'ha1) : (8'hb6)) + ((8'h9f) ? (8'hb8) : (8'hb0)))))), 
parameter param43 = {param42})
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire15;
  input wire signed [(3'h5):(1'h0)] wire14;
  input wire signed [(4'hf):(1'h0)] wire13;
  input wire [(3'h4):(1'h0)] wire12;
  input wire signed [(4'ha):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire16;
  assign y = {wire41, wire39, wire17, wire16, (1'h0)};
  assign wire16 = $signed(((~|(~|$signed(wire15))) <<< wire12[(1'h1):(1'h0)]));
  assign wire17 = (~^(-{(wire12 ?
                          (wire16 ? wire12 : wire16) : wire15[(4'h9):(1'h1)]),
                      ($signed(wire14) ? $unsigned(wire16) : wire11)}));
  module18 #() modinst40 (wire39, clk, wire12, wire11, wire13, wire17);
  assign wire41 = $unsigned((wire14[(3'h4):(1'h0)] ?
                      wire11[(1'h1):(1'h1)] : (8'hbd)));
endmodule

module module18
#(parameter param38 = {(~^({{(8'hbf), (8'ha8)}, ((8'hbe) ? (8'hbd) : (8'hb6))} << (7'h43)))})
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire22;
  input wire [(4'ha):(1'h0)] wire21;
  input wire [(4'hf):(1'h0)] wire20;
  input wire signed [(5'h14):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire31;
  wire [(3'h4):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire23;
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 (1'h0)};
  assign wire23 = wire20[(4'h8):(3'h4)];
  assign wire24 = wire20;
  assign wire25 = $unsigned(({$unsigned((~^wire21))} ?
                      $signed($unsigned((wire21 ?
                          (8'h9c) : (8'hb0)))) : (8'haf)));
  assign wire26 = $unsigned((~$unsigned($unsigned((~(8'had))))));
  assign wire27 = ((wire23[(2'h2):(2'h2)] < $signed($unsigned({(7'h41)}))) >= wire21[(4'h8):(3'h7)]);
  assign wire28 = wire25;
  assign wire29 = {$unsigned(((wire26[(3'h4):(1'h1)] << (&wire25)) ?
                          wire26[(3'h4):(2'h2)] : wire22)),
                      ((~|(+$unsigned(wire24))) > $unsigned((7'h43)))};
  assign wire30 = wire27;
  assign wire31 = ($signed(((~&{wire23}) || $unsigned((8'h9c)))) ?
                      $signed(wire21) : (((+wire26) * (wire22[(1'h0):(1'h0)] + wire23)) == wire23[(4'h8):(2'h3)]));
  assign wire32 = $signed(wire19[(5'h14):(4'h9)]);
  assign wire33 = $signed(($unsigned((~&(~^wire20))) != (wire32[(2'h2):(1'h0)] ~^ ((wire24 - wire26) - $unsigned(wire27)))));
  assign wire34 = (&wire33[(5'h13):(5'h10)]);
  assign wire35 = $unsigned(((($signed(wire23) ?
                              (wire31 + wire22) : (wire24 ? wire32 : wire25)) ?
                          wire22 : (((8'hba) ? wire32 : wire28) ?
                              wire27[(4'hd):(2'h2)] : (wire31 ?
                                  wire22 : wire26))) ?
                      wire32 : (wire20[(4'he):(4'h9)] | wire25)));
  assign wire36 = $signed(($unsigned($unsigned((|wire33))) >= (~^{wire35})));
  assign wire37 = $signed($signed($unsigned($unsigned((|(8'ha4))))));
endmodule

module module59  (y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire63;
  input wire signed [(4'h9):(1'h0)] wire62;
  input wire [(2'h3):(1'h0)] wire61;
  input wire [(5'h14):(1'h0)] wire60;
  wire [(4'he):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire89;
  wire signed [(5'h12):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire84;
  wire [(4'hb):(1'h0)] wire83;
  wire [(4'ha):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire81;
  wire [(5'h10):(1'h0)] wire80;
  wire [(4'he):(1'h0)] wire79;
  wire signed [(5'h13):(1'h0)] wire68;
  wire [(5'h15):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire65;
  wire signed [(5'h10):(1'h0)] wire64;
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg [(4'ha):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 reg87,
                 reg86,
                 reg85,
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
                 (1'h0)};
  assign wire64 = ($signed((!{wire62[(1'h1):(1'h0)]})) ?
                      (^(8'hb2)) : wire63[(3'h5):(3'h4)]);
  assign wire65 = (wire60 ~^ ({(-(8'h9c))} ?
                      wire62 : ({wire61, (^(8'had))} ?
                          (7'h42) : wire62[(3'h5):(3'h5)])));
  assign wire66 = wire60;
  assign wire67 = $unsigned({({((8'hae) << wire63),
                              (wire66 ? wire65 : (8'ha6))} ?
                          $unsigned($signed(wire62)) : wire66)});
  assign wire68 = (wire65 || wire63);
  always
    @(posedge clk) begin
      if ((!($unsigned($signed((!(8'hbf)))) ? wire67[(2'h2):(1'h0)] : wire66)))
        begin
          reg69 <= wire62;
          reg70 <= wire62;
        end
      else
        begin
          reg69 <= reg69;
          if ((|((($unsigned((8'hbf)) ?
                  $signed((8'ha2)) : (wire64 >= (8'h9d))) ?
              {(reg69 == wire63)} : ({wire67, wire66} * (wire60 ?
                  wire62 : wire68))) < wire66)))
            begin
              reg70 <= $unsigned(wire66[(1'h0):(1'h0)]);
            end
          else
            begin
              reg70 <= wire61;
            end
          if ($unsigned(((~^wire63) - ((((8'ha9) - wire61) | (+wire68)) ?
              (|{wire60, wire61}) : wire62))))
            begin
              reg71 <= wire67;
              reg72 <= $signed({{$signed((8'hb6))},
                  $signed(wire66[(3'h4):(2'h2)])});
            end
          else
            begin
              reg71 <= ({wire67} + wire63);
              reg72 <= {(~{$signed({wire66})}), $signed($signed((8'hac)))};
              reg73 <= $signed($unsigned($signed(((+wire68) + (^wire68)))));
              reg74 <= $unsigned($unsigned((wire67[(4'hb):(3'h5)] ?
                  $unsigned(wire61[(2'h2):(1'h0)]) : reg71[(1'h1):(1'h1)])));
              reg75 <= $unsigned(reg71[(1'h0):(1'h0)]);
            end
        end
      reg76 <= $signed((reg70[(3'h6):(1'h1)] <= {$unsigned($unsigned(wire60)),
          (!$signed(reg70))}));
      reg77 <= (wire61 ? wire65[(1'h0):(1'h0)] : (~^wire62));
      reg78 <= $unsigned((|(((wire62 && wire64) > (|(8'ha4))) + (wire63 - (wire64 + reg72)))));
    end
  assign wire79 = wire60;
  assign wire80 = ($signed((wire65 >> ({wire61} ? {reg71, wire68} : reg69))) ?
                      $unsigned((reg78[(4'h9):(3'h4)] ?
                          $signed($signed((8'haf))) : reg71)) : ((+({wire79} ?
                              (reg76 << (8'hb2)) : (|wire63))) ?
                          $signed((~^$unsigned(reg76))) : $signed($unsigned((wire61 ?
                              wire66 : reg71)))));
  assign wire81 = wire68[(4'h8):(1'h0)];
  assign wire82 = {(($unsigned((reg77 ?
                          reg73 : wire61)) << reg71[(2'h2):(2'h2)]) >> (8'ha5))};
  assign wire83 = (((((!wire81) ? {reg74} : $unsigned(reg74)) ?
                              (reg70[(3'h4):(1'h0)] ?
                                  $signed(reg71) : (wire66 ?
                                      (8'ha9) : wire64)) : $signed((~&(8'had)))) ?
                          ((&$unsigned(wire66)) ^~ $unsigned((^reg71))) : (8'hbf)) ?
                      (((((8'ha2) == wire80) < (8'ha7)) ?
                              $signed(wire61[(2'h2):(2'h2)]) : reg73) ?
                          reg77 : ($signed($unsigned(reg76)) ~^ {(reg78 != reg72)})) : $signed($unsigned($signed(wire67[(3'h5):(3'h5)]))));
  assign wire84 = wire60;
  always
    @(posedge clk) begin
      reg85 <= ({$signed(wire68[(3'h4):(2'h2)])} == wire82);
      reg86 <= (~&$unsigned($signed((^~(reg85 <= reg74)))));
      reg87 <= (reg75[(3'h4):(1'h1)] ?
          $unsigned((|(wire62 ?
              $unsigned(reg85) : (reg70 == reg85)))) : wire81);
    end
  assign wire88 = ((wire67[(4'h8):(3'h7)] > (8'hba)) ?
                      (reg78 <<< ($unsigned(wire63[(3'h6):(2'h3)]) ?
                          ((|reg75) >= (reg86 ~^ wire79)) : (((8'ha3) ?
                              wire67 : reg69) > $unsigned(wire65)))) : $unsigned($unsigned($unsigned((~^wire84)))));
  assign wire89 = $signed({(~^(!(8'hb0)))});
  assign wire90 = {wire89[(4'hb):(4'h9)], reg77[(3'h7):(1'h1)]};
endmodule
