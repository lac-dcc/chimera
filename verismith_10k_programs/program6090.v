module top
#(parameter param125 = (!(^~(^((^~(8'hbe)) ? ((8'ha5) ? (8'ha4) : (8'ha4)) : ((8'h9c) >= (8'hae)))))), 
parameter param126 = (+param125))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire124;
  wire signed [(5'h15):(1'h0)] wire123;
  wire [(5'h10):(1'h0)] wire122;
  wire signed [(5'h11):(1'h0)] wire120;
  assign y = {wire124, wire123, wire122, wire120, (1'h0)};
  module5 #() modinst121 (wire120, clk, wire3, wire2, wire4, wire1, wire0);
  assign wire122 = {$unsigned(wire0)};
  assign wire123 = (&((wire3 > wire2[(4'hc):(4'hc)]) ?
                       wire2 : ($unsigned($unsigned(wire4)) ?
                           (~&$unsigned(wire120)) : wire2)));
  assign wire124 = (~wire0);
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire6;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire77;
  wire [(3'h4):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  wire signed [(4'hd):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire81;
  wire signed [(4'h8):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire118;
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  assign y = {wire77,
                 wire56,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire11,
                 wire46,
                 wire79,
                 wire80,
                 wire81,
                 wire82,
                 wire118,
                 reg58,
                 reg57,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire11 = $unsigned($signed({wire10, (8'hab)}));
  module12 #() modinst47 (wire46, clk, wire9, wire11, wire10, wire7, wire8);
  assign wire48 = $unsigned(wire11);
  assign wire49 = ($unsigned(((wire7[(3'h6):(3'h6)] ?
                      $unsigned(wire46) : wire10[(4'hc):(3'h6)]) <<< $signed((wire6 ~^ wire48)))) ^ $signed(wire48));
  assign wire50 = $signed((wire7[(2'h2):(1'h1)] ?
                      {(((8'had) ?
                              (8'hbe) : wire10) <<< $unsigned((8'hb1)))} : {wire10,
                          wire8}));
  assign wire51 = ({wire7} ~^ $signed(wire49));
  always
    @(posedge clk) begin
      reg52 <= (-wire7[(5'h10):(4'h8)]);
      reg53 <= ($unsigned((^(wire50 ?
          $unsigned(wire10) : wire11))) <<< $signed(wire49));
      reg54 <= {wire49[(3'h5):(2'h3)], wire49[(4'hc):(3'h6)]};
      reg55 <= ($unsigned((~wire49)) ?
          $signed(wire11) : {($unsigned((^wire50)) <= wire50[(3'h5):(3'h5)])});
    end
  assign wire56 = (((^~$signed((wire8 ?
                          reg52 : wire46))) <<< (wire46 <<< $unsigned({reg53}))) ?
                      ({(^((8'hbe) * wire9))} || (((wire8 ?
                          (8'hb0) : reg54) ^ $unsigned(wire8)) - $signed($unsigned(reg54)))) : ((wire7[(5'h10):(3'h6)] ^~ $unsigned($unsigned(wire7))) >> $signed($signed((wire9 >>> wire48)))));
  always
    @(posedge clk) begin
      reg57 <= wire7;
      reg58 <= ((wire51[(4'hd):(4'hd)] ? $signed(wire9) : wire48) ?
          $signed(reg54) : (-(&$unsigned($signed(wire46)))));
    end
  module59 #() modinst78 (.wire61(reg53), .wire62(wire50), .clk(clk), .y(wire77), .wire63(reg52), .wire60(reg54));
  assign wire79 = $signed((~&$signed(($signed(reg52) != $signed(reg55)))));
  assign wire80 = {wire50[(3'h4):(1'h1)],
                      (wire11 ? reg52 : $signed((~wire7[(4'hd):(3'h6)])))};
  assign wire81 = (~(~^($unsigned(wire11) ?
                      {(wire79 <<< wire7),
                          wire80[(4'ha):(3'h5)]} : (-$signed(wire11)))));
  assign wire82 = $signed(wire9);
  module83 #() modinst119 (.y(wire118), .wire86(wire7), .wire87(wire6), .wire84(wire48), .wire85(reg55), .clk(clk));
endmodule

module module83
#(parameter param117 = {(^~{(~((8'h9d) ? (8'ha8) : (8'hb0)))}), ({(((8'hb5) || (8'ha8)) ^~ ((8'haf) ? (8'ha2) : (8'ha1))), {(8'hba), ((8'hb3) ? (8'hb2) : (8'h9c))}} >>> {(((8'hbf) <= (8'ha6)) ? (^~(8'ha9)) : ((8'hb1) ? (7'h41) : (8'ha5)))})})
(y, clk, wire87, wire86, wire85, wire84);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire87;
  input wire [(4'h9):(1'h0)] wire86;
  input wire [(3'h6):(1'h0)] wire85;
  input wire [(5'h14):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire116;
  wire [(4'hf):(1'h0)] wire115;
  wire [(3'h4):(1'h0)] wire114;
  wire signed [(5'h11):(1'h0)] wire113;
  wire [(3'h4):(1'h0)] wire112;
  wire [(5'h13):(1'h0)] wire111;
  wire signed [(3'h7):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire109;
  wire [(4'h8):(1'h0)] wire103;
  wire [(4'hf):(1'h0)] wire102;
  wire [(3'h4):(1'h0)] wire88;
  reg [(4'h9):(1'h0)] reg108 = (1'h0);
  reg [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  reg [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg100 = (1'h0);
  reg [(4'hf):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg97 = (1'h0);
  reg [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire103,
                 wire102,
                 wire88,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
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
  assign wire88 = ((8'hbf) && ((~&wire84[(4'hd):(2'h2)]) ?
                      wire86 : (!((wire85 ? wire86 : wire85) ?
                          (wire87 ? (8'h9f) : wire86) : (wire84 <= wire85)))));
  always
    @(posedge clk) begin
      reg89 <= wire84[(5'h12):(1'h0)];
      if ({reg89[(5'h13):(2'h3)]})
        begin
          reg90 <= $unsigned($unsigned(((&$signed(reg89)) && $unsigned(wire87[(1'h0):(1'h0)]))));
          reg91 <= ($signed({$signed(wire86), (8'h9c)}) ?
              (~|$signed(($signed(wire88) & wire86[(3'h6):(1'h1)]))) : reg90[(1'h0):(1'h0)]);
        end
      else
        begin
          reg90 <= $unsigned(((wire84[(5'h12):(1'h0)] ?
              $unsigned($unsigned(wire86)) : wire87[(2'h2):(1'h1)]) <<< (wire88[(1'h1):(1'h1)] ?
              $signed($unsigned(wire85)) : wire84)));
        end
      if (((!(&((wire84 ~^ reg91) ?
              ((7'h42) ? wire87 : (8'h9c)) : (wire87 ? reg91 : (8'hb7))))) ?
          $signed({(|$signed((8'hba)))}) : ({wire85[(2'h3):(1'h1)],
              wire86} & (~&((&reg91) ^~ {wire86})))))
        begin
          if (wire85[(1'h0):(1'h0)])
            begin
              reg92 <= $signed(wire88);
              reg93 <= $unsigned(({(^(&(8'ha6))), (!reg89)} ?
                  (wire85 ?
                      (reg91 ?
                          ((7'h41) ?
                              wire87 : (8'hb0)) : $unsigned(wire87)) : wire85) : ((8'ha0) ~^ $unsigned($unsigned(wire88)))));
              reg94 <= (^$unsigned(wire86[(3'h5):(3'h4)]));
              reg95 <= $signed($signed($signed(($signed(reg91) ?
                  (reg93 ? wire87 : wire88) : reg89[(4'hb):(1'h1)]))));
            end
          else
            begin
              reg92 <= ($unsigned(wire88[(1'h0):(1'h0)]) && (~|reg93));
              reg93 <= reg90[(4'h9):(3'h7)];
              reg94 <= $unsigned((($signed(wire87[(2'h3):(1'h1)]) - reg89) <<< (7'h40)));
            end
        end
      else
        begin
          if ((!(($unsigned(reg89) == ($unsigned(wire88) <= (^reg95))) ?
              (wire87 ?
                  ((wire85 ?
                      wire88 : wire88) * (~^wire85)) : (wire86[(4'h9):(2'h3)] ?
                      $signed((8'hb4)) : $signed(reg90))) : {$signed($signed(wire85)),
                  (8'hb7)})))
            begin
              reg92 <= (((^($signed(wire87) & (reg93 ^ wire85))) ?
                  (-$signed(reg93)) : ($signed($unsigned(reg94)) | (~^reg90[(4'hb):(1'h1)]))) * (|reg91[(2'h3):(1'h0)]));
              reg93 <= $signed((((wire86[(3'h4):(2'h3)] ?
                  $unsigned(wire85) : $unsigned(wire88)) << (((8'hbe) ?
                      reg93 : reg92) ?
                  (&wire86) : $signed(reg92))) & ((reg91[(1'h1):(1'h1)] ?
                      reg89[(1'h0):(1'h0)] : (wire88 << wire85)) ?
                  reg91[(2'h3):(1'h0)] : (-(^reg95)))));
              reg94 <= $unsigned(reg92);
              reg95 <= (reg95[(4'h8):(3'h5)] ?
                  ($signed(({wire87, (7'h43)} - (^~wire88))) ?
                      (~^((~wire87) < reg93[(4'h8):(3'h5)])) : reg93[(4'h9):(1'h0)]) : (8'hb7));
              reg96 <= ($unsigned(reg94) && wire86[(2'h2):(1'h0)]);
            end
          else
            begin
              reg92 <= $unsigned(($signed({$signed(wire86), $signed(wire87)}) ?
                  wire85[(1'h0):(1'h0)] : reg96[(4'hb):(2'h3)]));
            end
          reg97 <= reg89[(1'h0):(1'h0)];
          if ($signed(((~|$unsigned((^wire88))) ?
              {(&$unsigned(reg93))} : {$signed($unsigned(reg97)),
                  (+(reg92 | reg90))})))
            begin
              reg98 <= $unsigned(({$signed($unsigned((8'hb8)))} - $signed(reg97)));
              reg99 <= (reg98 * reg92);
              reg100 <= {reg90};
            end
          else
            begin
              reg98 <= (&$signed((|$signed($unsigned(reg99)))));
              reg99 <= (reg92[(1'h0):(1'h0)] ?
                  $signed(((~&$unsigned(reg98)) + $signed((reg99 ?
                      wire86 : wire84)))) : ((~&($unsigned(reg92) ?
                      {wire85} : $signed(reg100))) << $signed(((|reg98) ?
                      reg91[(1'h0):(1'h0)] : $signed(wire84)))));
              reg100 <= ($unsigned($signed((~(|reg91)))) ?
                  reg96[(1'h0):(1'h0)] : $signed({({reg89} & {reg96}),
                      reg100}));
              reg101 <= {reg97};
            end
        end
    end
  assign wire102 = $signed((!$signed((wire86[(3'h6):(1'h1)] + (reg98 ~^ reg96)))));
  assign wire103 = reg89[(3'h6):(2'h3)];
  always
    @(posedge clk) begin
      reg104 <= ({$signed((reg96[(4'he):(3'h4)] ?
                  $signed(reg91) : (reg94 >= reg94)))} ?
          reg101[(3'h5):(2'h3)] : wire84);
      reg105 <= $unsigned(reg94);
      reg106 <= ((^~(((~reg99) - (~&wire84)) >> reg91)) ^ $signed(reg104));
      reg107 <= (|reg104);
      reg108 <= reg101;
    end
  assign wire109 = ($signed(reg95) ?
                       ($unsigned((reg93[(4'hf):(4'h8)] < $unsigned(wire103))) - $unsigned((8'hb3))) : $signed((~&(~$unsigned(reg99)))));
  assign wire110 = reg99;
  assign wire111 = $unsigned(((reg99[(4'hd):(2'h3)] ?
                       reg106 : reg104[(2'h3):(2'h3)]) >> wire109));
  assign wire112 = wire109;
  assign wire113 = ($signed(reg91[(3'h7):(1'h1)]) << wire85);
  assign wire114 = $unsigned({wire88[(1'h0):(1'h0)],
                       {$signed(wire110), reg91[(3'h6):(2'h2)]}});
  assign wire115 = reg106;
  assign wire116 = ((!$signed(wire109)) ? wire102 : reg104);
endmodule

module module59
#(parameter param76 = ((~{(((8'ha5) ? (8'hac) : (8'ha1)) ^ (+(8'hb3)))}) * (^(~&{(~&(8'hab)), ((8'ha3) ? (8'hb1) : (8'hae))}))))
(y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire63;
  input wire signed [(5'h10):(1'h0)] wire62;
  input wire [(3'h5):(1'h0)] wire61;
  input wire signed [(5'h11):(1'h0)] wire60;
  wire signed [(5'h15):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire74;
  wire signed [(3'h6):(1'h0)] wire73;
  wire [(4'ha):(1'h0)] wire72;
  wire [(5'h13):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire65;
  wire [(3'h4):(1'h0)] wire64;
  reg signed [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire65,
                 wire64,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire64 = wire62;
  assign wire65 = ((|wire61) ?
                      $unsigned((+$unsigned($unsigned(wire64)))) : (^$unsigned((wire62[(4'h9):(3'h4)] ?
                          (wire62 ? wire61 : (8'hbd)) : wire64))));
  always
    @(posedge clk) begin
      reg66 <= ((8'ha1) ?
          ($unsigned($unsigned($unsigned(wire65))) ?
              (((|wire63) ?
                  (!wire60) : wire65[(4'h9):(3'h6)]) * (wire62[(3'h6):(3'h5)] ?
                  (wire60 >>> wire61) : (wire61 ?
                      wire63 : (8'hba)))) : wire61[(1'h1):(1'h1)]) : {(~$unsigned(wire60[(3'h5):(2'h2)])),
              ((^$unsigned(wire64)) ?
                  $signed((wire63 ^~ wire60)) : $signed($unsigned((8'ha2))))});
      reg67 <= wire61[(1'h1):(1'h1)];
      reg68 <= wire60[(3'h7):(3'h7)];
      reg69 <= (((|$unsigned((|wire60))) ?
          $signed($signed($signed(wire63))) : $unsigned((wire60 == (&reg67)))) | wire61);
    end
  assign wire70 = (7'h42);
  assign wire71 = (~|$unsigned((($unsigned(reg69) ?
                      (~&wire70) : $signed(wire60)) ~^ ((~reg69) ?
                      ((8'h9e) ? wire61 : wire62) : {wire70, wire65}))));
  assign wire72 = $unsigned(($signed(((&wire65) >>> $unsigned((8'ha1)))) ?
                      reg68 : (((!wire62) | $unsigned(wire71)) ?
                          (^(wire71 ?
                              wire62 : wire65)) : wire70[(4'ha):(2'h3)])));
  assign wire73 = reg67;
  assign wire74 = ($unsigned(wire71[(3'h4):(1'h0)]) + reg68[(3'h7):(3'h5)]);
  assign wire75 = {reg66[(2'h3):(2'h2)], (^~wire72[(2'h3):(2'h2)])};
endmodule

module module12
#(parameter param45 = ((((((7'h42) ? (8'haa) : (8'hba)) ? ((8'ha0) && (8'hb7)) : ((7'h40) ? (8'ha4) : (8'ha4))) <= (&((8'ha4) ? (7'h44) : (8'haf)))) != (((8'hba) >>> ((8'hbc) ? (8'haa) : (8'ha8))) || (~&{(8'ha6), (8'hac)}))) ^ ((-(((7'h43) ? (8'hb4) : (7'h42)) ? ((8'ha2) ? (8'hb5) : (8'hb5)) : (-(7'h44)))) ^~ (8'h9d))))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire17;
  input wire [(4'hd):(1'h0)] wire16;
  input wire signed [(3'h7):(1'h0)] wire15;
  input wire signed [(5'h13):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(3'h4):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire23;
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg18 <= wire16;
      reg19 <= reg18[(2'h3):(1'h0)];
      reg20 <= $signed((!((-(&reg18)) & (^wire15[(2'h3):(1'h0)]))));
      reg21 <= wire15;
      reg22 <= ((~&$unsigned(wire16[(3'h7):(1'h1)])) >>> (^reg20));
    end
  assign wire23 = wire15;
  assign wire24 = $unsigned(reg22[(4'hc):(2'h3)]);
  assign wire25 = (8'hb0);
  assign wire26 = ($signed($unsigned(($signed(wire25) << wire14))) ?
                      (^~wire24) : (-$signed({$unsigned(wire14)})));
  always
    @(posedge clk) begin
      reg27 <= (reg22[(4'hd):(1'h1)] + $signed((((reg19 >> reg22) ?
              wire25 : $unsigned(wire15)) ?
          ((~^reg21) & (^reg18)) : wire17[(3'h4):(1'h1)])));
      reg28 <= reg22[(4'hd):(3'h5)];
      reg29 <= {$signed(($unsigned(wire26[(1'h0):(1'h0)]) ?
              ((reg28 <<< wire17) ~^ (-wire24)) : wire17[(1'h0):(1'h0)]))};
      reg30 <= reg29[(3'h6):(1'h1)];
      reg31 <= (((|(~|(reg20 > (8'hb2)))) ?
              (8'ha4) : (((wire24 ? wire23 : wire24) ?
                      $signed(wire14) : {(7'h41), reg28}) ?
                  ((8'hab) ? {reg21} : (^reg19)) : {reg18[(1'h0):(1'h0)],
                      $signed(reg22)})) ?
          $unsigned((reg29[(5'h10):(3'h5)] ^ $unsigned(wire17[(2'h2):(1'h1)]))) : (wire23 + (~&wire17[(1'h0):(1'h0)])));
    end
  assign wire32 = reg31;
  assign wire33 = reg30;
  assign wire34 = $signed(reg31[(1'h1):(1'h0)]);
  assign wire35 = (~$signed(reg27));
  assign wire36 = ($signed((~&$signed($unsigned(reg31)))) ?
                      {(~|$unsigned((^reg27)))} : reg18);
  assign wire37 = reg21;
  assign wire38 = wire25;
  always
    @(posedge clk) begin
      reg39 <= $unsigned((((|(wire16 & wire33)) ?
          (reg30 ? reg31[(1'h0):(1'h0)] : $unsigned(wire33)) : ((!wire36) ?
              reg20 : (reg30 ? reg18 : reg28))) + wire33));
      reg40 <= reg18[(3'h7):(3'h7)];
      reg41 <= ((7'h44) <<< $unsigned(($signed((reg19 ^~ wire25)) == reg19[(4'h8):(3'h5)])));
      reg42 <= ((!$signed(((wire32 ?
          reg30 : wire38) <<< (~reg20)))) && $signed(($unsigned(wire15[(3'h7):(3'h7)]) ?
          $unsigned((reg39 ? reg21 : reg28)) : wire26[(1'h1):(1'h0)])));
    end
  assign wire43 = $signed((wire38 ? $unsigned($signed(reg41)) : wire15));
  assign wire44 = (wire16 ?
                      $unsigned(wire24[(1'h1):(1'h0)]) : reg40[(4'h9):(2'h2)]);
endmodule
