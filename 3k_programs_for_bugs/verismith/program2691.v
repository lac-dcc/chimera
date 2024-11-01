module top
#(parameter param141 = ({(~&{(!(8'h9f)), {(7'h42), (8'hb8)}})} ? {(|(((8'hb0) ~^ (8'hb7)) >>> ((8'ha8) ^ (8'hb6)))), (~|{(~(8'hbb)), {(8'haa)}})} : {((^~(+(7'h44))) ? {((8'h9c) <<< (8'hb2)), ((8'ha7) * (8'hae))} : ({(8'hb3)} ? ((8'ha9) | (8'ha5)) : ((8'h9d) > (8'ha8))))}), 
parameter param142 = ((|(+((param141 ? param141 : param141) < (8'haa)))) & param141))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire65;
  wire [(4'hf):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire117;
  wire signed [(5'h12):(1'h0)] wire119;
  wire [(5'h13):(1'h0)] wire120;
  wire [(3'h7):(1'h0)] wire121;
  wire [(3'h5):(1'h0)] wire138;
  reg signed [(2'h3):(1'h0)] reg140 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  assign y = {wire5,
                 wire65,
                 wire67,
                 wire117,
                 wire119,
                 wire120,
                 wire121,
                 wire138,
                 reg140,
                 reg69,
                 reg68,
                 (1'h0)};
  assign wire5 = wire4[(2'h2):(1'h1)];
  module6 #() modinst66 (.wire8(wire3), .clk(clk), .wire7(wire1), .wire9(wire5), .y(wire65), .wire10(wire2));
  assign wire67 = $signed($signed((({wire0} ? (wire5 >= wire2) : wire3) ?
                      (&$signed(wire3)) : wire2)));
  always
    @(posedge clk) begin
      reg68 <= wire5[(4'h8):(1'h0)];
      reg69 <= $signed(wire2);
    end
  module70 #() modinst118 (.wire73(wire0), .wire71(wire2), .wire74(wire4), .clk(clk), .wire72(reg68), .y(wire117), .wire75(wire3));
  assign wire119 = (-($signed(reg69[(4'ha):(3'h6)]) ?
                       $unsigned($unsigned((wire5 > wire5))) : (~^$unsigned(reg68))));
  assign wire120 = ($unsigned(wire3) ?
                       {$unsigned(wire65[(4'h8):(3'h6)]),
                           $unsigned((((8'ha4) ? wire3 : wire5) ?
                               (reg69 == wire4) : (~reg69)))} : ((7'h44) ?
                           (wire5[(4'hc):(3'h6)] ?
                               ({wire0} ?
                                   {wire117} : $signed(reg69)) : wire5[(3'h5):(1'h0)]) : ((~&$unsigned(wire0)) && wire117)));
  assign wire121 = {((-wire4[(3'h4):(1'h0)]) ^~ (($unsigned(wire119) != $unsigned(wire2)) ~^ {reg68}))};
  module122 #() modinst139 (wire138, clk, wire1, reg69, wire0, wire65);
  always
    @(posedge clk) begin
      reg140 <= (wire2[(5'h11):(1'h1)] ?
          $signed($unsigned((~&wire121))) : {$signed($signed((8'hb7)))});
    end
endmodule

module module122  (y, clk, wire126, wire125, wire124, wire123);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire126;
  input wire [(2'h2):(1'h0)] wire125;
  input wire signed [(3'h6):(1'h0)] wire124;
  input wire [(2'h2):(1'h0)] wire123;
  wire signed [(5'h11):(1'h0)] wire137;
  wire signed [(5'h13):(1'h0)] wire136;
  wire [(4'hb):(1'h0)] wire135;
  wire signed [(2'h2):(1'h0)] wire132;
  wire [(4'hc):(1'h0)] wire131;
  wire [(4'h8):(1'h0)] wire130;
  wire [(5'h11):(1'h0)] wire129;
  wire signed [(4'hc):(1'h0)] wire128;
  wire signed [(4'ha):(1'h0)] wire127;
  reg [(4'hb):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg133 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 reg134,
                 reg133,
                 (1'h0)};
  assign wire127 = $unsigned((~^wire125));
  assign wire128 = $signed($signed($unsigned($signed(wire125[(2'h2):(2'h2)]))));
  assign wire129 = ((wire127 & (8'h9c)) * $signed($unsigned($signed((wire123 ?
                       (8'ha9) : wire126)))));
  assign wire130 = $unsigned(wire125);
  assign wire131 = (wire124 >> (-(~^{(~(8'hb8)), {wire124}})));
  assign wire132 = wire131[(4'ha):(4'h9)];
  always
    @(posedge clk) begin
      reg133 <= {wire129};
      reg134 <= (wire124[(1'h1):(1'h1)] > $unsigned(($unsigned($unsigned(reg133)) | ((wire132 >> (8'ha8)) || (&wire132)))));
    end
  assign wire135 = $unsigned(wire127[(4'h8):(4'h8)]);
  assign wire136 = wire124[(3'h5):(2'h2)];
  assign wire137 = {$unsigned($signed($signed($unsigned(wire136)))), (8'ha1)};
endmodule

module module70
#(parameter param115 = ((~|(((8'hb6) ? {(8'hb2), (8'hab)} : ((8'hb6) ? (8'hbb) : (7'h42))) ? (^(~^(8'ha9))) : (-(-(8'hab))))) ? (((((8'h9e) ? (8'h9f) : (8'ha5)) ? (+(8'ha9)) : ((8'hbb) || (8'hb8))) ? ((~(8'h9e)) ? ((8'ha5) ? (8'hb1) : (8'hbb)) : (+(7'h43))) : (8'h9d)) << ((((8'hb1) ? (7'h42) : (7'h41)) >= ((8'hba) || (8'ha2))) >= (~((8'hbd) < (8'hb6))))) : (~(^(~|((7'h44) && (8'ha9)))))), 
parameter param116 = ((~^(+(~^(~^param115)))) ? param115 : (param115 ~^ {(|param115)})))
(y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'h1af):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire75;
  input wire [(4'h8):(1'h0)] wire74;
  input wire [(3'h5):(1'h0)] wire73;
  input wire signed [(5'h14):(1'h0)] wire72;
  input wire [(4'hd):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire79;
  wire [(3'h6):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire77;
  wire [(3'h4):(1'h0)] wire76;
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg [(3'h4):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg110 = (1'h0);
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  reg [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  reg [(4'hc):(1'h0)] reg105 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg104 = (1'h0);
  reg [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg99 = (1'h0);
  reg [(4'h8):(1'h0)] reg98 = (1'h0);
  reg [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(5'h15):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
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
                 reg81,
                 (1'h0)};
  assign wire76 = (((wire75[(1'h1):(1'h0)] && ((wire71 ? wire71 : wire74) ?
                              (wire73 ? (8'hab) : wire72) : $signed(wire74))) ?
                          (wire74 >>> (((8'ha3) ?
                              (7'h41) : (8'hac)) + (~^wire72))) : $unsigned($unsigned($unsigned(wire74)))) ?
                      (!(($unsigned(wire74) || (wire71 ?
                          (8'hb8) : wire72)) > {wire73[(1'h1):(1'h1)],
                          (&wire72)})) : {(($unsigned(wire71) >>> $unsigned(wire73)) ?
                              wire75 : (((8'ha8) < (8'ha1)) ?
                                  $signed(wire75) : wire72))});
  assign wire77 = wire75[(2'h3):(1'h0)];
  assign wire78 = wire77[(1'h1):(1'h0)];
  assign wire79 = wire74[(1'h1):(1'h0)];
  assign wire80 = (($unsigned($signed({wire71})) ?
                          (($signed((7'h44)) ?
                              (wire77 ?
                                  wire72 : wire76) : (wire73 > wire75)) ^ (+(wire71 ?
                              wire72 : (8'haf)))) : wire73) ?
                      $unsigned(($unsigned({wire78}) ?
                          wire79[(4'hd):(4'h8)] : ({wire78, (8'ha7)} ?
                              $unsigned(wire75) : (wire76 >= wire72)))) : wire77[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg81 <= ($signed(wire72) ? (|$unsigned((&$signed(wire79)))) : wire79);
      reg82 <= (reg81[(3'h5):(2'h3)] >>> wire74);
      if ($signed($signed(($unsigned($signed(wire74)) || ((^~wire78) != wire79[(2'h3):(2'h2)])))))
        begin
          reg83 <= ((|wire76) ?
              ((+{{wire72}, {(8'h9c)}}) | wire71) : $signed(wire78));
        end
      else
        begin
          reg83 <= $unsigned($unsigned(($signed((~|wire79)) != $signed(wire76))));
          reg84 <= (&wire74[(1'h1):(1'h0)]);
        end
    end
  always
    @(posedge clk) begin
      if (({wire73,
              (($signed(wire72) >= $unsigned(wire74)) ?
                  {wire74, wire75[(1'h0):(1'h0)]} : (reg83 ?
                      (wire80 - reg81) : (wire71 ? reg84 : wire78)))} ?
          $unsigned(wire74) : reg84))
        begin
          reg85 <= reg84[(4'hd):(3'h5)];
          reg86 <= (((7'h40) ?
                  $signed(((reg85 ^~ wire73) <<< $unsigned(wire75))) : (reg82 | wire75)) ?
              ($unsigned(wire74[(1'h1):(1'h1)]) ?
                  (8'ha2) : $signed(reg85)) : ((~|wire71[(1'h0):(1'h0)]) ?
                  wire80 : {$unsigned($signed(reg82))}));
        end
      else
        begin
          reg85 <= (reg83 >> wire80);
          if ((($unsigned(reg84) ?
              reg85 : reg81[(3'h5):(1'h0)]) - $signed(((8'hb9) ?
              ((-(8'ha9)) * $unsigned(reg86)) : {$unsigned(reg83),
                  (reg86 ? wire80 : wire75)}))))
            begin
              reg86 <= $signed((-reg81));
              reg87 <= (~&{$signed(reg82)});
              reg88 <= $unsigned(((wire71[(4'h8):(3'h4)] || (((8'haa) ?
                      reg86 : wire75) >> (reg83 ? reg86 : (8'hb8)))) ?
                  (wire74 ?
                      wire75 : (~&$signed(wire80))) : reg87[(3'h4):(1'h0)]));
              reg89 <= (($signed($unsigned(reg81)) ?
                  {reg83} : $signed((~^(wire80 ?
                      reg85 : wire77)))) | $signed(wire73));
            end
          else
            begin
              reg86 <= wire80[(4'ha):(3'h4)];
              reg87 <= (wire76 ?
                  (reg88[(1'h0):(1'h0)] << ($signed($signed(wire77)) ?
                      {(~wire79)} : $unsigned($unsigned(reg87)))) : (reg87 | $unsigned(((wire76 && wire76) ?
                      (wire78 | reg87) : wire78[(3'h4):(1'h1)]))));
            end
          reg90 <= $signed($signed($signed((^~$unsigned((8'ha6))))));
          if ($unsigned(reg81[(2'h3):(2'h2)]))
            begin
              reg91 <= ({{wire80, reg85}} ^~ (wire75 <<< reg87[(4'h8):(3'h6)]));
              reg92 <= wire79[(3'h5):(2'h2)];
              reg93 <= wire79;
              reg94 <= (^~$signed({$unsigned(reg81),
                  $signed({reg89, wire80})}));
            end
          else
            begin
              reg91 <= reg90[(3'h5):(3'h4)];
              reg92 <= (-({(reg88[(4'hf):(4'hc)] <<< reg83[(4'hd):(4'hb)]),
                      wire73} ?
                  ((wire72 ? $unsigned(reg89) : $signed(reg84)) ?
                      ((+wire71) ?
                          $unsigned(wire77) : reg91[(2'h2):(1'h1)]) : ((reg82 ?
                          wire73 : reg91) - reg88)) : (|($signed(reg94) ~^ reg94[(2'h2):(1'h0)]))));
              reg93 <= ({$signed(((|reg83) ?
                      $signed((8'ha7)) : $unsigned(reg87)))} == wire73[(2'h2):(2'h2)]);
            end
          reg95 <= wire73[(2'h3):(2'h2)];
        end
      reg96 <= ({reg93, wire76} ?
          {wire72, $unsigned(wire72[(2'h3):(1'h1)])} : wire78[(3'h4):(1'h0)]);
      reg97 <= reg89[(3'h5):(3'h5)];
    end
  always
    @(posedge clk) begin
      reg98 <= reg90;
      reg99 <= wire78;
      reg100 <= wire73;
      if ((~(((-$unsigned(wire74)) ?
              $signed($signed(wire78)) : ((~(8'hae)) && $signed(wire74))) ?
          wire80 : $unsigned((wire78 >>> (reg94 * (7'h43)))))))
        begin
          if ((reg89[(4'h9):(1'h1)] | reg99[(2'h2):(1'h0)]))
            begin
              reg101 <= ($signed(((reg90[(4'hb):(4'ha)] ?
                  (^wire80) : $unsigned(reg100)) | (~|$signed(wire79)))) > wire73[(1'h1):(1'h1)]);
              reg102 <= wire75[(1'h1):(1'h0)];
              reg103 <= $unsigned($unsigned($signed($signed(reg90[(3'h5):(3'h4)]))));
              reg104 <= $unsigned((-($unsigned(((8'ha6) ^ wire78)) ^~ reg101)));
            end
          else
            begin
              reg101 <= ((&{reg92}) ?
                  $signed($unsigned((~(~&reg87)))) : wire73[(2'h3):(1'h1)]);
              reg102 <= reg90;
              reg103 <= $signed(reg101[(4'h9):(3'h5)]);
              reg104 <= $signed((^~($signed((reg92 && wire76)) >> wire78[(1'h1):(1'h1)])));
            end
          if (wire77[(1'h1):(1'h0)])
            begin
              reg105 <= (reg99 ?
                  wire74[(1'h0):(1'h0)] : ($unsigned(((8'hbd) ?
                          $unsigned((8'hbf)) : $unsigned(reg91))) ?
                      ((8'hac) ?
                          $signed(((8'ha0) ?
                              reg88 : reg97)) : {$signed(reg104)}) : (($unsigned(reg92) >= reg84[(4'hc):(2'h3)]) << (&reg99))));
              reg106 <= (((+$unsigned((reg89 > wire77))) - (|(!(reg89 ^ reg85)))) >= wire75[(1'h1):(1'h1)]);
              reg107 <= (wire78[(3'h4):(3'h4)] ?
                  {reg106,
                      ((~|(reg91 ?
                          reg101 : reg82)) >= reg105[(3'h4):(2'h2)])} : {$signed($unsigned(wire71[(1'h0):(1'h0)])),
                      ($unsigned(reg84) ?
                          wire78[(2'h2):(1'h0)] : $unsigned((wire76 >>> wire79)))});
            end
          else
            begin
              reg105 <= reg102[(1'h1):(1'h0)];
              reg106 <= wire80[(2'h2):(1'h0)];
              reg107 <= wire77;
              reg108 <= $unsigned((($signed(((8'ha0) ?
                      reg104 : reg101)) * (wire79 ~^ $signed(reg89))) ?
                  $unsigned($signed($signed(reg98))) : {$signed((reg100 * reg86))}));
              reg109 <= ({reg96[(4'hd):(1'h0)],
                  $unsigned(wire76[(2'h3):(1'h0)])} != $signed(reg86));
            end
          if ((~&reg105[(3'h6):(3'h6)]))
            begin
              reg110 <= $signed(reg91);
            end
          else
            begin
              reg110 <= ({{{reg99[(1'h0):(1'h0)], $unsigned(reg98)}},
                  $unsigned({(+reg86), $unsigned(reg98)})} ^ ((((reg108 ?
                      reg95 : (8'h9c)) ?
                  (reg101 ~^ wire80) : reg96[(4'he):(4'hb)]) == reg90) > wire73));
              reg111 <= reg90[(4'he):(4'h8)];
            end
          reg112 <= $signed($signed(wire74[(2'h2):(1'h0)]));
          reg113 <= wire77;
        end
      else
        begin
          if (({(wire77[(1'h1):(1'h1)] ?
                  ($unsigned(wire76) >> (reg112 ?
                      reg105 : reg113)) : wire75[(1'h0):(1'h0)])} ^~ ((reg104[(3'h6):(3'h4)] || reg96) > (&wire79[(5'h11):(1'h0)]))))
            begin
              reg101 <= (&$signed($unsigned(reg82[(4'h8):(1'h0)])));
              reg102 <= $signed($signed(reg103));
            end
          else
            begin
              reg101 <= (~^({(~reg95),
                  (!(reg82 >= reg90))} > (wire79[(3'h6):(3'h6)] ?
                  (&((7'h43) ? (7'h44) : reg95)) : (8'hb7))));
              reg102 <= reg83;
              reg103 <= reg108;
              reg104 <= reg99;
            end
          reg105 <= ((~|wire71[(4'hd):(3'h5)]) - (($signed($signed(wire72)) ^~ reg104) ?
              (reg106[(3'h4):(2'h2)] ? reg111 : reg90[(1'h1):(1'h1)]) : {reg101,
                  $signed($unsigned(reg87))}));
          reg106 <= $signed($unsigned(reg97[(5'h11):(4'hc)]));
          if ((^(8'ha1)))
            begin
              reg107 <= reg113;
              reg108 <= reg86;
              reg109 <= ($unsigned((^~reg107)) ?
                  ((~|$unsigned({wire76, reg99})) ?
                      $signed(($signed(reg94) ?
                          (~^wire78) : $unsigned(reg105))) : (^~reg104[(3'h6):(1'h1)])) : $unsigned({$signed((~|reg103))}));
              reg110 <= $signed({$signed(reg85),
                  ($unsigned(reg104[(2'h2):(1'h0)]) & reg100[(1'h0):(1'h0)])});
              reg111 <= ((~^(reg113 >> (-{reg103, reg88}))) ?
                  (~(reg103[(3'h6):(3'h4)] ?
                      reg96[(4'ha):(4'h8)] : $unsigned((reg105 > (8'hbb))))) : (reg90[(4'hf):(4'h9)] ?
                      reg97[(4'he):(4'he)] : (^~$unsigned(reg105))));
            end
          else
            begin
              reg107 <= ($signed($unsigned($unsigned($unsigned(reg104)))) ?
                  {{$signed((~&reg102))}} : (reg100 ?
                      ((((8'hbb) != (8'h9e)) == (^reg108)) & ((reg89 ?
                          reg83 : reg111) - wire77[(1'h1):(1'h0)])) : $unsigned($unsigned($unsigned(reg112)))));
              reg108 <= reg113;
              reg109 <= reg94[(3'h7):(2'h3)];
            end
        end
      reg114 <= (-(8'hb5));
    end
endmodule

module module6
#(parameter param64 = (-(((((7'h44) == (7'h43)) ? ((8'ha0) != (8'hb1)) : (8'hac)) && (8'hbd)) ? (!(^((8'ha6) ^~ (8'hbf)))) : ({(&(7'h40)), {(8'hbe)}} * ({(8'hb8), (8'h9c)} ^~ ((8'haf) ? (8'hb6) : (8'hb9)))))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire signed [(3'h7):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire62;
  wire signed [(5'h14):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire11;
  assign y = {wire62, wire47, wire45, wire11, (1'h0)};
  assign wire11 = (~|wire7[(1'h0):(1'h0)]);
  module12 #() modinst46 (wire45, clk, wire10, wire11, wire9, wire7);
  assign wire47 = wire8[(1'h1):(1'h1)];
  module48 #() modinst63 (.clk(clk), .y(wire62), .wire50(wire8), .wire51(wire7), .wire49(wire47), .wire52(wire9));
endmodule

module module48  (y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire52;
  input wire signed [(5'h14):(1'h0)] wire51;
  input wire signed [(3'h4):(1'h0)] wire50;
  input wire [(4'hd):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire58;
  wire [(4'hc):(1'h0)] wire57;
  wire [(3'h5):(1'h0)] wire56;
  wire signed [(4'he):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire54;
  wire [(5'h10):(1'h0)] wire53;
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  assign wire53 = wire49[(3'h6):(2'h3)];
  assign wire54 = wire53[(4'ha):(2'h2)];
  assign wire55 = (~|$unsigned((((wire50 ? wire49 : wire50) ?
                      wire53[(4'ha):(4'ha)] : ((8'hb7) ?
                          wire53 : (8'ha2))) ~^ $signed(wire52))));
  assign wire56 = $unsigned((wire55[(4'hb):(4'hb)] ^ $signed(wire49[(4'h8):(1'h0)])));
  assign wire57 = (^~wire53[(3'h4):(3'h4)]);
  assign wire58 = wire51[(5'h14):(2'h3)];
  always
    @(posedge clk) begin
      reg59 <= $unsigned((wire50[(1'h1):(1'h0)] || $unsigned($signed((wire57 ?
          (8'hbe) : wire53)))));
      reg60 <= wire50;
      reg61 <= ($unsigned(wire51[(4'he):(4'h8)]) ?
          (^(8'ha7)) : ((!{(reg60 ? wire52 : reg59), $signed(reg59)}) ?
              (~|wire56[(2'h2):(1'h0)]) : (wire50[(2'h3):(2'h3)] - {((8'hab) * reg60),
                  reg60})));
    end
endmodule

module module12
#(parameter param43 = (~|((^~(|((8'ha9) >= (8'hb3)))) & {{((8'h9c) ? (8'haa) : (7'h44)), {(8'hac)}}})), 
parameter param44 = (({param43} || (~|(^(param43 ^ param43)))) ? param43 : param43))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire16;
  input wire signed [(5'h13):(1'h0)] wire15;
  input wire signed [(3'h5):(1'h0)] wire14;
  input wire [(5'h10):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire42;
  wire signed [(4'hc):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire38;
  wire signed [(5'h14):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire17;
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire28,
                 wire27,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire17 = $signed(((($signed(wire14) ?
                              (~(8'hb7)) : $unsigned((8'ha1))) ?
                          $unsigned(((8'hb4) + wire13)) : wire16) ?
                      {((+wire16) ? $unsigned(wire16) : wire16),
                          (~$unsigned((8'hb3)))} : (~|wire13)));
  assign wire18 = $unsigned(wire13[(3'h6):(1'h0)]);
  assign wire19 = $unsigned(wire15[(1'h1):(1'h1)]);
  assign wire20 = (wire14 ?
                      $signed((8'hb2)) : {$unsigned((wire19 - (wire14 << wire19))),
                          $unsigned(((wire18 ? wire16 : wire16) ?
                              ((8'ha0) >>> wire17) : (wire15 & wire18)))});
  always
    @(posedge clk) begin
      reg21 <= (&(wire15[(3'h4):(3'h4)] ?
          $signed({(-wire18)}) : wire19[(1'h0):(1'h0)]));
      if (wire18[(1'h1):(1'h0)])
        begin
          reg22 <= (wire15[(4'he):(1'h1)] || wire13[(2'h2):(2'h2)]);
          reg23 <= {((8'hab) ?
                  (~|wire16) : {$unsigned($unsigned(reg21)),
                      $signed(wire19[(1'h1):(1'h0)])})};
        end
      else
        begin
          reg22 <= (+((8'hb3) == (($unsigned(wire17) ?
                  (wire15 && wire17) : wire20[(4'he):(4'h9)]) ?
              wire20 : {(8'ha0)})));
        end
      reg24 <= wire16[(1'h0):(1'h0)];
      reg25 <= $signed(reg23);
      reg26 <= wire20[(4'he):(3'h7)];
    end
  assign wire27 = (wire14[(1'h0):(1'h0)] - (reg24[(5'h15):(4'hc)] ?
                      (~reg24) : reg21[(5'h10):(5'h10)]));
  assign wire28 = $signed((8'had));
  always
    @(posedge clk) begin
      reg29 <= {$signed($unsigned($unsigned($unsigned(reg21)))), (8'hb4)};
      if (((^$signed($signed(wire14[(1'h1):(1'h0)]))) >= wire15))
        begin
          reg30 <= (reg26[(5'h12):(5'h12)] && reg29);
          reg31 <= $signed((+(~|reg29)));
        end
      else
        begin
          reg30 <= $unsigned((^((^~wire27[(4'ha):(3'h6)]) || ({wire16,
              (8'hbd)} ^ (wire14 ? reg21 : reg21)))));
        end
      if ($unsigned(((~|$signed(wire27)) <= wire13[(4'h8):(3'h6)])))
        begin
          reg32 <= (^(!$signed(($signed(wire18) ?
              $signed((8'hbc)) : (~&wire19)))));
          reg33 <= ($unsigned((~&wire19)) ?
              $signed($unsigned($unsigned($unsigned((8'haf))))) : (reg26[(4'hf):(2'h3)] ?
                  (wire20 ?
                      wire14[(1'h0):(1'h0)] : $signed((reg29 ?
                          wire17 : reg23))) : reg24));
          reg34 <= $unsigned($unsigned(wire19));
        end
      else
        begin
          reg32 <= $unsigned($signed($signed(reg25)));
        end
    end
  assign wire35 = wire20[(2'h2):(2'h2)];
  assign wire36 = {$unsigned($unsigned(wire19)),
                      $unsigned($unsigned($unsigned({wire19})))};
  assign wire37 = (~$unsigned($unsigned($signed($signed(reg21)))));
  assign wire38 = (+wire20[(2'h3):(2'h3)]);
  assign wire39 = wire17[(4'hf):(4'hf)];
  assign wire40 = ((7'h40) + $signed((((^~(8'hb8)) != (reg32 | wire19)) ?
                      ((~|(8'had)) << (reg24 ? wire28 : reg25)) : (~&{reg33,
                          wire37}))));
  assign wire41 = $signed(($signed($unsigned($signed(reg33))) >= ($unsigned((reg26 ?
                          reg22 : wire28)) ?
                      wire20 : (((8'ha0) ? wire19 : (8'haf)) + (~&reg21)))));
  assign wire42 = (+wire20[(4'hd):(3'h7)]);
endmodule
