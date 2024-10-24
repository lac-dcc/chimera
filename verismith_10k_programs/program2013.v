module top
#(parameter param115 = ({(|(((7'h43) ? (8'ha2) : (8'had)) ? (-(8'ha9)) : (8'haf))), (8'ha2)} ~^ (((&((8'hb0) & (8'hab))) ? ((~^(8'ha1)) ? (~^(8'hb2)) : ((8'hb1) + (8'hbd))) : (+(|(8'hbd)))) == {(((8'hb5) || (8'hb8)) ? {(8'ha6)} : ((8'hb2) <<< (8'hbd))), (((8'hb2) ? (8'had) : (8'ha8)) ? (8'ha0) : ((8'hbd) != (8'hb8)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire114;
  wire [(4'hc):(1'h0)] wire111;
  wire signed [(5'h12):(1'h0)] wire110;
  wire [(5'h10):(1'h0)] wire109;
  wire [(5'h11):(1'h0)] wire68;
  wire [(5'h11):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire70;
  wire signed [(5'h11):(1'h0)] wire71;
  wire [(4'he):(1'h0)] wire72;
  wire signed [(4'he):(1'h0)] wire77;
  wire [(5'h14):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire79;
  wire [(4'hf):(1'h0)] wire107;
  reg signed [(4'he):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg112 = (1'h0);
  reg [(3'h7):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  assign y = {wire114,
                 wire111,
                 wire110,
                 wire109,
                 wire68,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire70,
                 wire71,
                 wire72,
                 wire77,
                 wire78,
                 wire79,
                 wire107,
                 reg113,
                 reg112,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 (1'h0)};
  assign wire5 = (^wire2);
  assign wire6 = (~$unsigned((wire5 ? (~^$unsigned(wire3)) : wire5)));
  assign wire7 = (!wire1[(3'h5):(1'h1)]);
  assign wire8 = $unsigned((!{$signed($signed(wire3))}));
  assign wire9 = {$signed((wire5 ?
                         $unsigned($signed(wire0)) : $unsigned($signed(wire0))))};
  assign wire10 = ($signed({{$signed(wire6),
                          $unsigned(wire6)}}) ~^ $signed(((|$unsigned((8'ha8))) ^~ $unsigned((wire6 ?
                      wire9 : (8'ha0))))));
  module11 #() modinst69 (wire68, clk, wire4, wire8, wire10, wire1, wire6);
  assign wire70 = (wire2 ?
                      (-(~^(wire10[(2'h2):(1'h1)] ?
                          $unsigned(wire10) : ((7'h40) ?
                              wire1 : wire10)))) : ($unsigned($unsigned((&wire5))) ?
                          wire3 : ((wire0[(5'h11):(4'ha)] ?
                                  $signed(wire4) : wire0[(3'h6):(2'h3)]) ?
                              (wire9[(4'ha):(2'h2)] ?
                                  ((8'hab) < (8'hb0)) : (wire1 ?
                                      wire7 : wire2)) : (&$signed(wire2)))));
  assign wire71 = $signed(wire6[(3'h4):(2'h2)]);
  assign wire72 = ($signed($unsigned(wire4)) >>> (~^wire7[(3'h6):(1'h0)]));
  always
    @(posedge clk) begin
      if ($signed(wire71[(5'h10):(5'h10)]))
        begin
          reg73 <= wire71;
          reg74 <= $signed(wire68);
          reg75 <= {wire71, $signed($signed(reg74[(2'h2):(1'h0)]))};
          reg76 <= wire72;
        end
      else
        begin
          if ($signed({(~&wire5[(4'ha):(4'h9)])}))
            begin
              reg73 <= ({$signed({$unsigned(wire4)})} ?
                  ((wire10 << $signed($unsigned(wire2))) >> ((wire9[(3'h6):(3'h4)] ?
                      reg75[(4'hd):(4'ha)] : (wire8 * wire8)) ~^ $unsigned($signed(wire5)))) : $unsigned($unsigned(wire5)));
              reg74 <= {(|wire72[(1'h0):(1'h0)]),
                  {reg73[(4'ha):(3'h6)],
                      $signed((wire72 ?
                          wire3[(5'h14):(5'h12)] : $signed(wire0)))}};
              reg75 <= wire2;
              reg76 <= wire6;
            end
          else
            begin
              reg73 <= ($signed((wire1 ? reg76 : $unsigned($unsigned(reg76)))) ?
                  (^~(wire8[(4'hb):(1'h1)] ^~ $unsigned($signed(wire68)))) : (~$signed(wire5)));
              reg74 <= {(((~|(reg75 <<< reg74)) & wire72) | {$signed($unsigned((8'hb5)))}),
                  wire1};
              reg75 <= $signed(($unsigned($signed((8'h9d))) && $unsigned((+wire10))));
            end
        end
    end
  assign wire77 = (^~wire10[(4'hd):(4'ha)]);
  assign wire78 = $signed(wire1[(4'hf):(4'hd)]);
  assign wire79 = $signed(wire72);
  module80 #() modinst108 (.wire84(wire9), .wire82(wire10), .wire85(wire78), .y(wire107), .wire81(wire1), .wire83(wire3), .clk(clk));
  assign wire109 = reg74[(3'h7):(1'h0)];
  assign wire110 = $signed($unsigned($signed(reg73)));
  assign wire111 = ($signed((|wire6)) ^~ (wire68 & wire70[(3'h4):(3'h4)]));
  always
    @(posedge clk) begin
      reg112 <= $signed((($unsigned((wire8 ?
              wire111 : wire70)) + $unsigned({reg73, reg74})) ?
          (-wire109) : {{$unsigned((8'hbd))}}));
      reg113 <= (+($signed((wire78 ^~ (reg112 ?
          wire71 : (8'hba)))) >>> (^~{reg76, (+(8'haf))})));
    end
  assign wire114 = wire72;
endmodule

module module80
#(parameter param106 = ((8'hbe) ? ({(((8'ha6) ^~ (8'hb0)) >= ((8'ha8) ? (8'ha7) : (7'h40)))} ? ((~&(~|(8'had))) ? ({(8'hba), (8'ha9)} + (8'h9e)) : {((8'hab) ? (8'hbd) : (8'hae)), (+(8'hb6))}) : ((8'h9f) < (((8'haf) ? (8'hbb) : (8'hb8)) ? (!(8'hac)) : ((8'ha3) >= (8'h9d))))) : ((((~^(8'hbb)) <= ((7'h43) ? (8'hb8) : (8'ha0))) < ((-(7'h43)) >= (~|(8'ha6)))) * ((((8'haf) ? (8'h9d) : (7'h41)) ? {(8'h9c), (8'h9d)} : (&(8'hb2))) ? ((^~(8'hbe)) ? ((8'hbb) > (8'hb6)) : (-(8'haf))) : (((8'ha3) ? (8'hb7) : (7'h40)) ? {(8'ha2), (8'haa)} : (8'ha2))))))
(y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire85;
  input wire signed [(5'h14):(1'h0)] wire84;
  input wire signed [(5'h11):(1'h0)] wire83;
  input wire signed [(4'hd):(1'h0)] wire82;
  input wire signed [(3'h4):(1'h0)] wire81;
  wire [(4'h9):(1'h0)] wire105;
  wire signed [(4'h9):(1'h0)] wire102;
  wire [(4'hd):(1'h0)] wire88;
  wire signed [(5'h13):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire86;
  reg [(3'h6):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(4'ha):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg89 = (1'h0);
  assign y = {wire105,
                 wire102,
                 wire88,
                 wire87,
                 wire86,
                 reg104,
                 reg103,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 (1'h0)};
  assign wire86 = (-(&(^((^wire81) & $signed(wire85)))));
  assign wire87 = wire83[(2'h3):(2'h3)];
  assign wire88 = {({wire82[(3'h4):(3'h4)],
                          {(wire87 ? wire85 : wire82),
                              (wire81 ^~ wire87)}} ^~ wire83[(4'h9):(3'h6)])};
  always
    @(posedge clk) begin
      reg89 <= {wire87,
          (|($unsigned($unsigned(wire88)) | {$unsigned(wire86),
              {wire85, wire85}}))};
    end
  always
    @(posedge clk) begin
      reg90 <= (wire86 >>> ({wire81} + {$signed($unsigned(wire85))}));
      if (wire87)
        begin
          reg91 <= wire81;
          reg92 <= ($unsigned($unsigned($unsigned((^~wire88)))) <<< $signed((8'hb2)));
          reg93 <= (-(^~$signed((~$signed(wire84)))));
        end
      else
        begin
          reg91 <= ((wire87[(3'h6):(2'h2)] ?
                  ($signed(wire83[(1'h0):(1'h0)]) ?
                      {wire86[(3'h5):(3'h4)],
                          (wire87 ?
                              reg89 : wire82)} : ($unsigned((8'ha5)) >> reg89[(1'h0):(1'h0)])) : reg89) ?
              (^~(+$unsigned((~reg91)))) : wire87);
          reg92 <= (~|wire87);
          reg93 <= (wire81 ?
              $unsigned({$unsigned((~^wire84)),
                  reg89}) : $signed((~^{(-wire81)})));
        end
      if ((((wire88 ? $signed({reg90}) : wire81) ?
          (^~wire86) : wire83[(4'ha):(4'h9)]) > (((~&{(8'ha3), (8'ha1)}) ?
              wire82 : (wire84 ? wire87 : $unsigned(reg90))) ?
          $unsigned(($signed(wire88) <<< wire88)) : (wire85 ^~ (8'h9f)))))
        begin
          reg94 <= $signed($unsigned(reg90[(5'h10):(4'hd)]));
          if (wire87[(2'h2):(2'h2)])
            begin
              reg95 <= reg91[(2'h3):(1'h0)];
              reg96 <= (wire85[(2'h3):(2'h3)] ?
                  {(|($unsigned(wire82) ?
                          reg91 : {wire86,
                              reg93}))} : $unsigned($unsigned($unsigned(((8'h9f) <= wire84)))));
            end
          else
            begin
              reg95 <= $signed($signed({(wire86[(2'h2):(1'h0)] ?
                      $unsigned((8'ha6)) : $unsigned(reg93)),
                  {(reg89 ? reg93 : reg92), (reg95 ? wire87 : wire82)}}));
              reg96 <= (((~^{{reg92, wire85}}) ? (7'h40) : wire87) ?
                  $unsigned($unsigned(((reg91 - wire84) == (reg92 ?
                      reg96 : reg95)))) : (($signed(reg92) ^ $signed((wire85 * wire84))) & ((reg94 != reg89) >= ({reg93} ?
                      {wire87, wire85} : ((8'ha5) ? (8'hba) : reg90)))));
              reg97 <= {(8'h9e),
                  (+((+((8'hb8) ~^ (8'ha7))) ?
                      $signed((reg91 & reg93)) : {$unsigned((8'haa))}))};
              reg98 <= (reg93[(3'h6):(3'h5)] ?
                  ((((reg90 ? wire88 : wire83) <= $unsigned(wire83)) ?
                      (~$signed(wire82)) : reg96) ^ wire86[(2'h2):(1'h1)]) : (&wire84[(3'h6):(3'h5)]));
              reg99 <= (^~wire82);
            end
        end
      else
        begin
          reg94 <= $signed((!(($unsigned(reg97) ?
              ((8'hbd) ?
                  wire85 : reg95) : (~^wire82)) != reg92[(4'hb):(1'h0)])));
          reg95 <= reg93[(2'h3):(1'h0)];
        end
      reg100 <= $signed((((((8'hb7) ?
                  reg90 : wire83) || wire83[(4'hc):(4'h8)]) ?
              ($unsigned(reg96) ?
                  (reg93 ?
                      reg95 : reg91) : wire85[(1'h1):(1'h1)]) : (wire84[(4'hd):(3'h6)] != (wire86 ?
                  reg89 : wire81))) ?
          $signed(wire88) : $signed({wire84, (^reg89)})));
      reg101 <= (+reg100);
    end
  assign wire102 = (((((wire87 ? reg94 : (8'ha4)) - reg95[(3'h6):(3'h6)]) ?
                           (reg100[(2'h3):(2'h3)] ~^ (-reg90)) : (!{reg99})) ?
                       wire88[(2'h2):(1'h1)] : $signed({wire88})) ~^ reg100);
  always
    @(posedge clk) begin
      reg103 <= reg92;
      reg104 <= $signed(reg92[(3'h5):(1'h0)]);
    end
  assign wire105 = (&$signed(($unsigned(wire87) ?
                       ({wire81, reg98} == (reg99 < (8'hb1))) : {(~^reg95)})));
endmodule

module module11  (y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire16;
  input wire [(3'h6):(1'h0)] wire15;
  input wire signed [(5'h11):(1'h0)] wire14;
  input wire signed [(5'h13):(1'h0)] wire13;
  input wire signed [(5'h14):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire37;
  wire signed [(4'h9):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire66;
  assign y = {wire37, wire17, wire39, wire40, wire66, (1'h0)};
  assign wire17 = (^~wire15[(3'h5):(1'h0)]);
  module18 #() modinst38 (.wire21(wire14), .y(wire37), .wire23(wire13), .wire19(wire12), .wire22(wire17), .clk(clk), .wire20(wire16));
  assign wire39 = ($signed(((wire16 >>> wire17[(4'h8):(2'h3)]) <<< ((wire13 >> wire12) ?
                      (!wire16) : ((8'hac) ?
                          wire17 : (8'ha0))))) <<< $signed(({(~|(8'haa)),
                          $unsigned(wire17)} ?
                      (~(wire37 ^ wire37)) : (((8'hba) >>> wire13) ?
                          (~&wire12) : (8'ha8)))));
  assign wire40 = wire15;
  module41 #() modinst67 (.wire44(wire13), .clk(clk), .wire43(wire16), .wire42(wire15), .wire45(wire14), .y(wire66), .wire46(wire39));
endmodule

module module41
#(parameter param64 = ((((|((8'ha2) & (8'hb0))) ? (((8'hb4) ? (8'hae) : (8'h9f)) == ((8'hba) ? (8'hb1) : (8'hb0))) : ({(8'hb7)} != (~|(8'ha1)))) ^~ ((&((8'hbf) ? (8'hab) : (8'ha0))) + {((8'hb4) > (8'ha4)), (^(8'ha7))})) ? (({((8'ha3) == (8'hb9))} != (~((7'h42) ? (8'ha1) : (8'hac)))) > {(~&((8'hac) ? (8'hb3) : (8'h9e)))}) : ((-(~(~&(8'ha5)))) ? {(7'h43), ((+(8'hb5)) <= (^(8'hb0)))} : ((((8'hab) ? (8'hb2) : (8'hb8)) ? ((8'ha0) ? (8'hac) : (8'hbe)) : (7'h44)) ? (&{(8'h9f)}) : ((^(8'hae)) >= ((7'h43) ? (8'hb2) : (7'h40)))))), 
parameter param65 = (((param64 >= (&(~(7'h41)))) < {param64, param64}) ? {({(+param64)} < (&param64))} : (param64 >>> param64)))
(y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire46;
  input wire [(5'h11):(1'h0)] wire45;
  input wire signed [(4'hb):(1'h0)] wire44;
  input wire [(4'h8):(1'h0)] wire43;
  input wire signed [(2'h2):(1'h0)] wire42;
  wire [(4'ha):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire61;
  wire signed [(5'h11):(1'h0)] wire51;
  wire [(4'h9):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  reg signed [(2'h3):(1'h0)] reg60 = (1'h0);
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire47 = {{wire43[(2'h3):(2'h2)], $unsigned((8'hbf))},
                      wire45[(3'h6):(3'h6)]};
  assign wire48 = (((!$unsigned(wire45)) >> (wire42[(2'h2):(1'h0)] ?
                          ((wire42 & wire45) ?
                              (wire46 || wire42) : {wire45,
                                  (8'ha0)}) : $unsigned($unsigned(wire43)))) ?
                      ({({wire44, (8'hb7)} ? wire43 : ((8'ha2) << wire43))} ?
                          (({wire42, (8'hbc)} ? (!wire43) : {wire46}) ?
                              wire42 : {wire45,
                                  {wire45}}) : $signed($signed({wire43,
                              wire45}))) : wire43[(2'h3):(2'h3)]);
  assign wire49 = wire42;
  assign wire50 = wire44[(4'ha):(3'h7)];
  assign wire51 = (~&$signed((wire49[(1'h1):(1'h1)] >>> ((~|wire48) ?
                      ((8'hb2) | wire43) : wire43[(3'h5):(3'h5)]))));
  always
    @(posedge clk) begin
      if (((wire47 ?
          (($unsigned((8'hb8)) ?
              wire42[(1'h1):(1'h0)] : $unsigned(wire47)) || ((^wire46) & (^~wire43))) : (^$unsigned(wire49))) | ($unsigned(wire47) ?
          $signed($unsigned(wire45[(3'h5):(1'h0)])) : wire46)))
        begin
          reg52 <= $signed(wire43[(3'h6):(3'h4)]);
          reg53 <= ((~^($signed(wire49[(4'ha):(3'h5)]) >= wire43)) <= (wire46 && (^~((wire46 ?
                  (8'haa) : wire51) ?
              wire45[(3'h4):(1'h1)] : wire47[(5'h13):(4'hb)]))));
          if (wire42)
            begin
              reg54 <= wire49[(4'hb):(3'h4)];
            end
          else
            begin
              reg54 <= wire43[(3'h4):(1'h0)];
              reg55 <= $unsigned(wire42);
              reg56 <= (^~(wire45[(3'h5):(1'h1)] <<< reg52));
              reg57 <= (wire48[(5'h13):(5'h13)] ?
                  wire50 : ({(~reg53[(2'h3):(2'h2)])} & $unsigned($signed(wire45))));
            end
        end
      else
        begin
          reg52 <= {$signed(reg54[(4'ha):(4'h8)])};
          reg53 <= ({(((wire45 ? (8'hbf) : reg57) ?
                          $signed(wire48) : $unsigned(wire47)) ?
                      wire51[(3'h7):(1'h1)] : (~&(~&reg52))),
                  (wire50[(3'h6):(1'h1)] >= ($unsigned(wire43) <<< (~&wire43)))} ?
              $unsigned((((reg57 ? reg56 : wire46) * (reg55 ? reg54 : reg54)) ?
                  ($unsigned(wire45) < ((8'ha3) ?
                      (8'h9c) : wire47)) : (8'ha5))) : reg53[(2'h2):(2'h2)]);
          reg54 <= (~$unsigned({(~^(wire51 ? wire42 : reg54))}));
        end
      reg58 <= ((wire45 ^ $signed((reg54 ?
          (reg53 ? (8'had) : wire51) : wire50))) >>> (~&{((wire45 >> (8'h9f)) ?
              $signed(reg53) : reg52)}));
      reg59 <= ($signed(reg55) ?
          $signed($unsigned($signed($unsigned(wire50)))) : ($unsigned(wire51) ^~ (!wire45[(4'h9):(2'h2)])));
      reg60 <= $unsigned((+(reg58 & $signed(reg57[(4'ha):(4'h9)]))));
    end
  assign wire61 = {reg56[(4'hf):(1'h0)]};
  assign wire62 = wire46[(2'h2):(2'h2)];
  assign wire63 = reg52[(3'h7):(1'h0)];
endmodule

module module18  (y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire23;
  input wire [(4'h9):(1'h0)] wire22;
  input wire signed [(2'h2):(1'h0)] wire21;
  input wire [(2'h2):(1'h0)] wire20;
  input wire [(3'h5):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(3'h7):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire25;
  wire [(3'h7):(1'h0)] wire24;
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire25,
                 wire24,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire24 = $signed({(~&({wire20} ?
                          wire21[(1'h1):(1'h0)] : $unsigned(wire21)))});
  assign wire25 = (~wire20[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg26 <= ({{$signed((8'h9f)), (!wire25)}} ?
          (~|$unsigned(wire21[(1'h1):(1'h1)])) : $signed((wire25 ?
              (7'h41) : {$signed(wire21)})));
      reg27 <= wire20[(2'h2):(2'h2)];
    end
  assign wire28 = reg26;
  assign wire29 = reg26;
  assign wire30 = $signed({{$signed(reg26), $unsigned($unsigned((8'h9e)))},
                      (^~wire19)});
  assign wire31 = (|wire21[(1'h0):(1'h0)]);
  assign wire32 = wire29;
  assign wire33 = (~&reg26);
  assign wire34 = wire31[(2'h3):(1'h0)];
  assign wire35 = (8'hba);
  assign wire36 = (({$signed({wire29,
                          wire33})} > wire19[(1'h0):(1'h0)]) & $unsigned((^~$signed({(8'hbf),
                      wire31}))));
endmodule
