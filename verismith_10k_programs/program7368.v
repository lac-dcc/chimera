module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire148;
  wire signed [(4'hd):(1'h0)] wire147;
  wire [(2'h3):(1'h0)] wire146;
  wire signed [(4'h9):(1'h0)] wire145;
  wire [(4'h8):(1'h0)] wire144;
  wire [(3'h5):(1'h0)] wire138;
  wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire81;
  wire signed [(5'h14):(1'h0)] wire140;
  wire signed [(5'h14):(1'h0)] wire141;
  wire signed [(2'h3):(1'h0)] wire142;
  assign y = {wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire138,
                 wire5,
                 wire81,
                 wire140,
                 wire141,
                 wire142,
                 (1'h0)};
  assign wire5 = (!($signed($unsigned(wire3)) ?
                     ((&wire0) ?
                         $signed((wire4 ? wire3 : (8'hbf))) : ((wire1 - wire3) ?
                             $signed(wire2) : wire4)) : (^(~|(+wire4)))));
  module6 #() modinst82 (wire81, clk, wire3, wire5, wire2, wire0, wire1);
  module83 #() modinst139 (wire138, clk, wire0, wire4, wire2, wire1, wire81);
  assign wire140 = $signed((8'hb1));
  assign wire141 = ({(&$signed($unsigned(wire3)))} || $unsigned((((~&wire5) ?
                       {wire1} : $signed(wire1)) >>> (&(wire0 >>> wire138)))));
  module83 #() modinst143 (wire142, clk, wire141, wire0, wire140, wire4, wire81);
  assign wire144 = $signed(({$signed((wire140 ? wire81 : wire142)),
                           (-$unsigned(wire142))} ?
                       (&$signed($unsigned(wire4))) : ((wire1 > (^~wire142)) ?
                           {wire3[(4'h9):(2'h3)]} : wire142[(1'h1):(1'h1)])));
  assign wire145 = $signed($unsigned(wire3));
  assign wire146 = $signed(($signed(wire2[(4'h8):(1'h0)]) ?
                       $unsigned($unsigned((wire141 <= wire0))) : $unsigned($signed((wire140 >= wire138)))));
  assign wire147 = (($unsigned(wire146[(1'h1):(1'h0)]) ?
                           (wire2 ~^ (^~$signed((8'hb6)))) : $signed(($unsigned(wire140) ?
                               (wire0 ? wire1 : wire140) : $signed(wire140)))) ?
                       $signed({{(wire140 << (8'had))},
                           ($signed(wire142) <= (wire4 ?
                               (8'hab) : wire146))}) : {(($unsigned(wire0) ?
                               wire142[(2'h3):(2'h3)] : (wire144 ^ wire5)) || (wire2[(4'h8):(1'h0)] ?
                               $signed(wire4) : $unsigned(wire140))),
                           wire3});
  assign wire148 = wire144[(2'h3):(2'h3)];
endmodule

module module83
#(parameter param136 = (({(((8'hbf) ? (8'haa) : (8'hae)) ? ((8'ha8) ? (8'hbf) : (8'ha3)) : ((8'hb8) ? (8'h9f) : (7'h43)))} != {{{(8'hac), (7'h44)}}, (~^((7'h41) ? (8'hab) : (8'h9c)))}) ? ((((+(8'hbe)) ? ((8'hbc) ? (8'hb7) : (8'had)) : ((8'hbb) ? (8'hbb) : (8'ha8))) ? (((8'hae) ^~ (8'hae)) ? ((7'h44) ? (8'ha2) : (8'h9f)) : ((8'ha9) ? (8'ha5) : (8'hb9))) : (-((8'ha8) ~^ (7'h43)))) <= {((^(8'ha9)) | (+(8'hae)))}) : (~(~|(((8'hac) ? (8'h9e) : (8'hbb)) + ((8'hab) ? (8'hbc) : (7'h44)))))), 
parameter param137 = (({param136} <= param136) ? param136 : (param136 >>> param136)))
(y, clk, wire84, wire85, wire86, wire87, wire88);
  output wire [(32'h18b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire84;
  input wire signed [(5'h10):(1'h0)] wire85;
  input wire [(5'h14):(1'h0)] wire86;
  input wire [(3'h5):(1'h0)] wire87;
  input wire signed [(5'h15):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire135;
  wire signed [(5'h15):(1'h0)] wire134;
  wire [(4'h8):(1'h0)] wire133;
  wire [(4'h8):(1'h0)] wire132;
  wire [(3'h5):(1'h0)] wire131;
  wire signed [(5'h11):(1'h0)] wire130;
  wire signed [(4'hf):(1'h0)] wire129;
  wire [(5'h10):(1'h0)] wire128;
  wire signed [(3'h7):(1'h0)] wire127;
  wire [(3'h4):(1'h0)] wire122;
  wire signed [(4'ha):(1'h0)] wire121;
  wire signed [(5'h11):(1'h0)] wire89;
  wire [(2'h2):(1'h0)] wire90;
  wire [(4'hd):(1'h0)] wire119;
  reg signed [(4'ha):(1'h0)] reg126 = (1'h0);
  reg [(4'h8):(1'h0)] reg125 = (1'h0);
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(4'hf):(1'h0)] reg102 = (1'h0);
  reg [(5'h15):(1'h0)] reg101 = (1'h0);
  reg signed [(4'he):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg97 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(4'hf):(1'h0)] reg91 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire122,
                 wire121,
                 wire89,
                 wire90,
                 wire119,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
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
                 (1'h0)};
  assign wire89 = wire85;
  assign wire90 = $signed((({wire86, (~wire89)} ?
                      $signed((wire84 ?
                          wire86 : wire86)) : $signed((wire87 <<< wire85))) != wire85[(5'h10):(3'h5)]));
  always
    @(posedge clk) begin
      reg91 <= $signed(((({(8'ha0), wire84} != wire89[(4'hf):(4'h9)]) ?
          wire88 : (^wire84)) + ($unsigned(((8'hb2) | (8'hb8))) ?
          wire85[(1'h1):(1'h1)] : (-wire89[(5'h10):(4'he)]))));
      reg92 <= ((~&(8'ha5)) << wire86);
      reg93 <= ((|((reg91[(4'hb):(3'h4)] > (^~reg92)) ?
          wire88 : $unsigned($unsigned(reg91)))) ^ $signed($signed(($signed(wire84) ?
          (8'hb3) : $unsigned(wire87)))));
      if ($signed((8'ha1)))
        begin
          reg94 <= $signed(reg91[(3'h5):(3'h5)]);
          reg95 <= reg93[(5'h10):(4'ha)];
          reg96 <= $unsigned(((~&$unsigned(wire89)) ?
              $unsigned(reg93[(3'h4):(2'h3)]) : reg91));
        end
      else
        begin
          reg94 <= ($unsigned($signed(wire87)) ?
              wire84[(4'hd):(3'h6)] : (+{(wire87[(3'h5):(3'h4)] >>> {reg95}),
                  $unsigned((~|wire88))}));
          if (wire87[(3'h4):(2'h2)])
            begin
              reg95 <= wire84[(4'he):(4'ha)];
              reg96 <= reg96[(4'ha):(4'ha)];
              reg97 <= ($unsigned(wire87[(2'h2):(1'h0)]) ?
                  reg95 : wire84[(4'hf):(3'h5)]);
              reg98 <= $signed((({{reg97, wire87},
                  $unsigned(wire85)} <= $unsigned((wire88 ?
                  (8'hb1) : wire88))) >> ($unsigned($unsigned(wire86)) >= $unsigned((reg97 ?
                  wire85 : (8'hba))))));
            end
          else
            begin
              reg95 <= (reg91[(4'hb):(2'h2)] != {wire85, reg92});
              reg96 <= (^{(((~^wire88) ?
                      $signed(wire88) : ((8'hab) ?
                          reg94 : wire90)) < (~|$signed(wire89))),
                  {(~^$signed(reg96)),
                      ((reg92 >>> wire84) ? wire90 : wire89)}});
              reg97 <= (+({reg98,
                      ((wire87 >= reg98) ? {reg92, wire84} : (reg98 - reg93))} ?
                  $unsigned(reg93[(4'h9):(1'h1)]) : (~^((~^wire88) ?
                      reg94[(3'h6):(3'h5)] : reg93[(3'h6):(1'h0)]))));
              reg98 <= {wire88, (8'haf)};
            end
        end
      if (reg92)
        begin
          reg99 <= (reg98 <<< (~|(~&$signed((^(8'hb7))))));
          if (((|$signed({(|(7'h40))})) >> reg95))
            begin
              reg100 <= reg94[(1'h0):(1'h0)];
              reg101 <= reg95[(2'h3):(1'h1)];
            end
          else
            begin
              reg100 <= (reg97[(4'h8):(2'h3)] >>> $signed($signed(((reg97 || reg100) * {reg96}))));
              reg101 <= wire88[(5'h13):(4'hf)];
            end
          if ({reg93,
              ($signed(wire88) == (wire90[(2'h2):(1'h1)] <<< ({reg94, (8'ha4)} ?
                  (+reg93) : (+reg93))))})
            begin
              reg102 <= $unsigned(wire89);
              reg103 <= (^$unsigned($unsigned(($signed(reg91) >>> $signed(wire86)))));
              reg104 <= ($signed(($unsigned((reg101 >> wire90)) <= reg101)) < reg95);
              reg105 <= $unsigned((+({reg91, wire87[(2'h3):(2'h2)]} ?
                  (+reg97) : $signed($signed((8'hae))))));
              reg106 <= (~^$unsigned((^reg96)));
            end
          else
            begin
              reg102 <= $signed($signed(reg106[(2'h3):(1'h1)]));
              reg103 <= {(&(-$unsigned($signed(wire87))))};
              reg104 <= $signed((!reg100));
              reg105 <= (reg91 ?
                  (reg98[(2'h2):(2'h2)] ?
                      $unsigned((^$unsigned(reg99))) : $unsigned($signed(reg102[(2'h3):(2'h2)]))) : reg98);
            end
        end
      else
        begin
          if ($unsigned((~^$unsigned(((wire90 ? (8'ha6) : wire88) ?
              (reg104 ? reg93 : reg98) : (|reg94))))))
            begin
              reg99 <= reg91;
            end
          else
            begin
              reg99 <= $signed(reg97);
              reg100 <= $unsigned((8'hb5));
              reg101 <= $unsigned($unsigned($signed((reg94[(4'hf):(3'h5)] == (reg95 ?
                  reg100 : reg92)))));
              reg102 <= (8'hb2);
            end
          reg103 <= $unsigned((((~^{reg105}) && $unsigned({reg106, reg98})) ?
              reg93 : (wire88 ? reg103 : wire86)));
          reg104 <= (~(~wire88[(4'ha):(1'h0)]));
          reg105 <= (&(reg100 ?
              $signed((wire90[(1'h1):(1'h0)] <<< {reg95,
                  (8'h9f)})) : (^~$signed($unsigned(wire84)))));
        end
    end
  module107 #() modinst120 (wire119, clk, reg99, reg101, wire86, reg102, reg100);
  assign wire121 = (&$unsigned(((!(reg106 <<< wire84)) <= reg93[(4'hf):(4'hf)])));
  assign wire122 = (($unsigned(wire121) <= ($unsigned((reg98 << (7'h41))) ?
                       (reg104[(1'h0):(1'h0)] <= (^~wire90)) : (reg91 ?
                           reg103 : reg93[(4'h8):(3'h7)]))) ^~ reg97[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      reg123 <= wire85[(4'hb):(2'h2)];
      reg124 <= reg101[(3'h4):(2'h3)];
      reg125 <= wire121;
      reg126 <= wire86[(1'h0):(1'h0)];
    end
  assign wire127 = $signed((~^($signed({wire86, reg125}) ^~ {(wire88 ?
                           reg123 : wire87)})));
  assign wire128 = reg92[(3'h4):(2'h2)];
  assign wire129 = ($signed($unsigned(wire89)) & $signed(reg98));
  assign wire130 = {(^~({$unsigned(reg96)} ?
                           (~$signed(reg106)) : reg102[(4'h8):(3'h6)])),
                       $unsigned(($signed($signed((8'h9e))) <= reg105))};
  assign wire131 = wire130;
  assign wire132 = (~^$unsigned((!$signed($unsigned((8'ha4))))));
  assign wire133 = $unsigned((^~$unsigned($unsigned(reg102[(3'h4):(1'h1)]))));
  assign wire134 = $unsigned((wire130 || wire85));
  assign wire135 = ((reg123[(3'h6):(1'h0)] ?
                           $unsigned({wire127[(1'h0):(1'h0)]}) : $unsigned((wire121 <<< (reg125 >= reg93)))) ?
                       (~wire87) : wire89);
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire11;
  input wire [(3'h6):(1'h0)] wire10;
  input wire [(2'h3):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire80;
  wire [(2'h3):(1'h0)] wire79;
  wire [(5'h15):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire77;
  assign y = {wire80,
                 wire79,
                 wire47,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire77,
                 (1'h0)};
  assign wire12 = $unsigned($signed(((^(wire8 ? wire11 : wire9)) ?
                      $unsigned(wire7) : {wire7, wire7[(3'h5):(1'h1)]})));
  assign wire13 = (|(^~(^wire8[(3'h6):(2'h3)])));
  assign wire14 = {wire9, $unsigned((|(+(wire8 < wire11))))};
  assign wire15 = $unsigned((^~(wire14[(4'h8):(4'h8)] ?
                      $signed(wire9[(1'h1):(1'h0)]) : (((8'hb8) << wire10) ?
                          (8'ha4) : $unsigned((8'ha7))))));
  assign wire16 = (-wire13);
  module17 #() modinst48 (.clk(clk), .y(wire47), .wire22(wire15), .wire19(wire12), .wire20(wire11), .wire21(wire7), .wire18(wire14));
  module49 #() modinst78 (wire77, clk, wire7, wire47, wire16, wire15, wire14);
  assign wire79 = (wire77 ?
                      (~^$unsigned(({(8'ha8)} ?
                          $unsigned(wire8) : wire8))) : wire14[(5'h10):(4'h9)]);
  assign wire80 = (wire12 != (8'ha5));
endmodule

module module49
#(parameter param76 = ((~{{(~^(7'h43))}}) * {{((|(8'haf)) ? {(8'ha9)} : ((8'hbb) * (8'had)))}, ({((8'hbf) ? (8'hab) : (7'h44)), ((8'hb6) ^ (8'ha0))} >> ({(8'hb4)} - ((8'hbf) ? (8'hb0) : (8'h9f))))}))
(y, clk, wire54, wire53, wire52, wire51, wire50);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire54;
  input wire signed [(5'h15):(1'h0)] wire53;
  input wire signed [(2'h2):(1'h0)] wire52;
  input wire [(4'ha):(1'h0)] wire51;
  input wire signed [(5'h14):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire74;
  wire [(4'ha):(1'h0)] wire73;
  wire [(3'h5):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire70;
  wire signed [(4'hb):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire68;
  wire [(3'h4):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire64;
  wire signed [(4'hc):(1'h0)] wire63;
  wire [(3'h4):(1'h0)] wire62;
  wire [(5'h13):(1'h0)] wire61;
  wire [(5'h10):(1'h0)] wire60;
  wire [(5'h10):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire55;
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg56 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire55,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire55 = ($signed({((wire51 << (8'had)) > $signed(wire54)),
                      wire51[(3'h7):(2'h2)]}) && $unsigned(wire53));
  always
    @(posedge clk) begin
      reg56 <= ((~^$signed(((wire54 ? wire55 : wire53) && (~^wire51)))) ?
          (&wire50) : $unsigned((^~wire51[(4'ha):(3'h4)])));
      reg57 <= $signed($signed(wire53));
    end
  assign wire58 = wire52[(1'h1):(1'h1)];
  assign wire59 = (wire55 & $signed($unsigned($unsigned((wire52 <= wire53)))));
  assign wire60 = (($signed({$signed(wire58), wire52}) ?
                          wire59[(5'h10):(5'h10)] : wire58[(2'h3):(2'h2)]) ?
                      $signed(wire59) : ((($signed(wire55) ?
                              $signed((8'hb0)) : (reg57 + (8'hba))) == (&$signed(wire59))) ?
                          $unsigned(((wire59 << wire54) ~^ (8'ha4))) : ($unsigned((!wire54)) ^ (8'hbb))));
  assign wire61 = wire50;
  assign wire62 = wire58[(3'h5):(2'h3)];
  assign wire63 = ($unsigned((((^~(8'hac)) ? $unsigned((7'h40)) : (-(8'hbf))) ?
                          $signed((8'hbb)) : (~&{wire54}))) ?
                      ($signed(wire51[(3'h5):(2'h3)]) ~^ (~&$unsigned(wire61))) : $signed(($signed((wire55 ^~ wire52)) & {wire58[(1'h0):(1'h0)],
                          (&wire61)})));
  assign wire64 = {wire51};
  assign wire65 = wire52;
  assign wire66 = (~|$unsigned(((wire61 ^~ wire58[(3'h6):(1'h0)]) ?
                      {wire55[(3'h7):(3'h7)]} : wire54[(4'hb):(2'h2)])));
  assign wire67 = wire61;
  assign wire68 = $unsigned(wire54[(4'h9):(3'h6)]);
  assign wire69 = (^(^(^wire63[(3'h4):(1'h0)])));
  assign wire70 = reg57;
  assign wire71 = $signed({wire53[(3'h4):(3'h4)]});
  assign wire72 = (8'hbe);
  assign wire73 = $signed($signed(wire62));
  assign wire74 = $unsigned($unsigned((~|$unsigned((wire73 && wire62)))));
  assign wire75 = wire66[(3'h5):(2'h2)];
endmodule

module module17  (y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire22;
  input wire [(5'h10):(1'h0)] wire21;
  input wire [(4'ha):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire [(3'h4):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire23;
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire34,
                 wire33,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg36,
                 reg35,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire23 = wire20[(4'ha):(2'h2)];
  assign wire24 = $signed({((8'hba) <= wire21[(3'h6):(3'h6)])});
  assign wire25 = wire23[(3'h4):(1'h0)];
  assign wire26 = (wire21[(4'h9):(3'h4)] > ($unsigned($unsigned($unsigned(wire24))) ?
                      {((~&wire21) ?
                              (wire18 < (8'hb7)) : wire18[(1'h0):(1'h0)]),
                          wire23} : $signed($unsigned((&wire19)))));
  assign wire27 = ($signed((wire20[(4'ha):(3'h7)] <= wire22[(1'h0):(1'h0)])) ?
                      (~|($signed($signed(wire21)) ?
                          (!(wire19 ? wire22 : wire25)) : {wire23,
                              (-wire23)})) : (&((~|wire26[(3'h7):(1'h0)]) ?
                          {(wire25 >= wire21),
                              (wire26 ?
                                  wire20 : (8'hb4))} : ($signed(wire22) - wire24))));
  assign wire28 = wire26[(3'h5):(3'h4)];
  assign wire29 = ((!(wire23 <= {wire27, (|wire21)})) || wire23);
  always
    @(posedge clk) begin
      reg30 <= ($signed($signed(((wire20 - wire27) && (wire27 >>> wire28)))) & $unsigned((8'ha3)));
      reg31 <= $signed(wire25[(2'h3):(2'h2)]);
      reg32 <= $unsigned({wire29[(3'h7):(3'h4)],
          (wire26[(4'hd):(3'h4)] >>> {(wire25 >> reg31)})});
    end
  assign wire33 = wire23;
  assign wire34 = {(&$unsigned($unsigned(wire33[(5'h10):(3'h5)])))};
  always
    @(posedge clk) begin
      reg35 <= (((^~$signed($signed(wire26))) ?
          (wire34[(3'h6):(3'h6)] ?
              reg32[(4'ha):(4'ha)] : ((8'ha2) > (^reg32))) : $unsigned((^wire18))) & ((~|$unsigned(wire23[(3'h4):(2'h2)])) ?
          ($unsigned((~|(8'hb3))) <<< wire20) : $unsigned((|(&reg32)))));
      reg36 <= wire24;
    end
  assign wire37 = (!reg31);
  assign wire38 = (8'hb0);
  assign wire39 = (&(~&(!({reg35} << (wire34 ? wire34 : wire23)))));
  assign wire40 = $signed(($unsigned(((~|wire23) >>> wire18[(1'h1):(1'h0)])) ?
                      $unsigned($signed(wire37)) : $signed(wire37[(3'h4):(2'h3)])));
  assign wire41 = ($signed($signed($signed(wire26))) >= $signed($unsigned((+$unsigned(wire39)))));
  always
    @(posedge clk) begin
      reg42 <= ((^~$signed({(wire23 ? wire29 : (8'hb5))})) ?
          ((!$unsigned($unsigned(wire18))) ?
              (wire33[(5'h10):(4'ha)] ?
                  $unsigned(reg36[(1'h0):(1'h0)]) : wire20) : $unsigned(((wire18 > wire29) ?
                  $unsigned(wire37) : (+wire38)))) : (wire20[(4'h8):(1'h1)] >= (8'hbc)));
      reg43 <= reg42[(1'h1):(1'h1)];
      reg44 <= ((8'hba) ?
          $unsigned(reg35) : ((reg42[(2'h2):(1'h1)] & (~|wire27)) * $signed((wire38[(2'h3):(1'h0)] ?
              $signed(wire28) : $signed(wire25)))));
      reg45 <= $signed($signed(wire25[(1'h0):(1'h0)]));
      reg46 <= wire20[(1'h1):(1'h0)];
    end
endmodule

module module107
#(parameter param118 = ((((^~(&(8'ha1))) >= {(!(8'had))}) ? ((((8'ha9) <= (8'haa)) ? (8'hbc) : (-(8'hbe))) ? (((8'ha4) * (7'h41)) > ((8'ha0) ? (8'had) : (8'hbb))) : ((~(7'h41)) ? (!(8'hb4)) : (^(8'hb8)))) : (^({(8'hae), (8'hb1)} >> {(8'hb2)}))) && ((^{(7'h40)}) <<< ((((8'haa) ? (8'ha3) : (8'ha8)) < ((8'ha3) != (8'ha9))) ^~ (((8'ha9) >>> (8'hbe)) > ((7'h42) ? (8'hb8) : (8'ha2)))))))
(y, clk, wire112, wire111, wire110, wire109, wire108);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire112;
  input wire signed [(5'h15):(1'h0)] wire111;
  input wire [(5'h14):(1'h0)] wire110;
  input wire signed [(4'hf):(1'h0)] wire109;
  input wire [(4'he):(1'h0)] wire108;
  wire [(3'h6):(1'h0)] wire117;
  wire signed [(4'he):(1'h0)] wire116;
  wire [(4'he):(1'h0)] wire115;
  wire signed [(4'hb):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire113;
  assign y = {wire117, wire116, wire115, wire114, wire113, (1'h0)};
  assign wire113 = (~&$unsigned(($signed($signed(wire111)) ?
                       ($signed(wire110) ?
                           wire111 : (wire110 ?
                               wire112 : wire109)) : (wire111[(4'hb):(4'h8)] ?
                           $signed(wire109) : $unsigned(wire110)))));
  assign wire114 = $signed((^~(~wire108[(2'h2):(1'h0)])));
  assign wire115 = wire111;
  assign wire116 = (~&$unsigned((+$unsigned((wire110 ? wire114 : wire112)))));
  assign wire117 = {$unsigned(wire116), $signed(wire115)};
endmodule
