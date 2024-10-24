module top
#(parameter param126 = (&(((7'h41) || ((~|(8'hbc)) ? ((7'h41) ? (8'h9d) : (8'hbf)) : ((8'h9d) ? (7'h43) : (8'hb9)))) < ((((8'hba) ? (8'ha4) : (8'h9f)) ? ((8'hb9) ^~ (8'hb0)) : ((8'h9e) >= (8'hba))) ? (((8'hb6) * (8'hb6)) | {(8'hb8)}) : (((8'hb6) ? (8'ha4) : (8'hb7)) ? (^(8'ha4)) : ((8'hb9) - (8'hac)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire125;
  wire signed [(5'h14):(1'h0)] wire124;
  wire signed [(5'h14):(1'h0)] wire123;
  wire signed [(2'h3):(1'h0)] wire121;
  assign y = {wire125, wire124, wire123, wire121, (1'h0)};
  module5 #() modinst122 (.wire10(wire3), .clk(clk), .y(wire121), .wire9(wire0), .wire6(wire4), .wire7(wire1), .wire8(wire2));
  assign wire123 = (8'haf);
  assign wire124 = ($signed(wire121) ?
                       ($unsigned((~wire2[(4'hf):(4'ha)])) - wire123[(3'h7):(3'h4)]) : $unsigned((^~(|$signed(wire2)))));
  assign wire125 = (wire1[(1'h0):(1'h0)] >= wire121[(2'h2):(2'h2)]);
endmodule

module module5
#(parameter param119 = (!(8'hbf)), 
parameter param120 = (-(param119 ? (((!param119) << {param119}) ? param119 : param119) : param119)))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire signed [(4'hc):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire117;
  wire [(4'h9):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire77;
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  assign y = {wire117,
                 wire47,
                 wire21,
                 wire20,
                 wire77,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire6[(2'h2):(1'h0)] << ((&{(!wire10)}) ?
          ($unsigned((wire7 ?
              (8'ha1) : (8'hb3))) + (8'hb1)) : $signed(({wire9} < wire7)))))
        begin
          reg11 <= (wire7[(2'h2):(1'h0)] <<< $unsigned($unsigned(({wire6} && wire9[(2'h2):(1'h0)]))));
          reg12 <= $signed($unsigned((|reg11[(3'h4):(2'h3)])));
          reg13 <= (|$unsigned(wire6[(3'h5):(2'h3)]));
          reg14 <= (reg13[(3'h4):(2'h3)] ?
              (!($unsigned($signed(reg11)) ^~ wire7[(4'h9):(2'h2)])) : wire6[(2'h2):(1'h1)]);
        end
      else
        begin
          reg11 <= wire8;
        end
      if (($unsigned((~|(reg12 ?
          {reg11} : ((8'hb7) <= reg13)))) >>> $signed($unsigned($unsigned({reg12,
          wire10})))))
        begin
          reg15 <= {wire10,
              (({(7'h40)} ^ (|((8'hae) ?
                  reg12 : (8'hb6)))) && reg13[(3'h5):(2'h3)])};
        end
      else
        begin
          reg15 <= $signed((~^$unsigned(wire9)));
          reg16 <= ($unsigned((wire6[(2'h3):(1'h0)] | (~^wire8[(3'h4):(2'h2)]))) ?
              (~((^(8'hb0)) + (&$unsigned(wire7)))) : $signed($unsigned(reg12[(2'h2):(2'h2)])));
          reg17 <= {reg14, reg14[(4'hc):(3'h5)]};
          reg18 <= wire8[(2'h2):(2'h2)];
          reg19 <= ((7'h41) ?
              $unsigned(reg12) : $signed({({wire8} <<< (-reg11)),
                  $unsigned($signed(reg18))}));
        end
    end
  assign wire20 = $signed(((~^$unsigned((reg12 * reg14))) ?
                      wire10[(5'h10):(4'hb)] : wire10[(4'hc):(4'hc)]));
  assign wire21 = $unsigned(wire7[(2'h2):(1'h1)]);
  module22 #() modinst48 (wire47, clk, reg17, reg11, reg12, wire6, reg18);
  module49 #() modinst78 (.wire54(reg13), .wire52(wire9), .clk(clk), .y(wire77), .wire51(wire8), .wire53(wire21), .wire50(reg11));
  module79 #() modinst118 (.y(wire117), .wire82(reg12), .wire84(wire6), .clk(clk), .wire81(wire20), .wire80(reg17), .wire83(reg15));
endmodule

module module79  (y, clk, wire84, wire83, wire82, wire81, wire80);
  output wire [(32'h194):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire84;
  input wire [(5'h10):(1'h0)] wire83;
  input wire [(4'ha):(1'h0)] wire82;
  input wire signed [(3'h7):(1'h0)] wire81;
  input wire signed [(3'h4):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire115;
  wire signed [(4'hc):(1'h0)] wire114;
  wire signed [(4'he):(1'h0)] wire113;
  wire signed [(5'h15):(1'h0)] wire112;
  wire [(5'h11):(1'h0)] wire111;
  wire signed [(3'h6):(1'h0)] wire110;
  wire signed [(5'h14):(1'h0)] wire104;
  wire [(4'h8):(1'h0)] wire90;
  wire [(4'hd):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire87;
  wire signed [(3'h5):(1'h0)] wire86;
  wire signed [(5'h10):(1'h0)] wire85;
  reg signed [(5'h11):(1'h0)] reg116 = (1'h0);
  reg [(4'he):(1'h0)] reg109 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg101 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  reg [(5'h14):(1'h0)] reg93 = (1'h0);
  reg [(2'h3):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg91 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire104,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 reg116,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
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
  assign wire85 = ((^((~(8'hb0)) || (~wire81[(2'h3):(2'h3)]))) ^~ (8'hb6));
  assign wire86 = $unsigned(($unsigned($signed($signed(wire85))) && (^~{(wire82 ?
                          wire83 : wire83),
                      $unsigned(wire80)})));
  assign wire87 = (8'ha1);
  assign wire88 = $unsigned(wire83);
  assign wire89 = ((wire86 > wire83) < wire83);
  assign wire90 = {$unsigned(wire80), {$signed($signed(wire88))}};
  always
    @(posedge clk) begin
      if ($unsigned((wire88 ?
          ((^~(wire90 ? (8'h9e) : wire85)) ?
              (~^$signed(wire87)) : (8'ha7)) : $unsigned($signed((wire80 >>> wire88))))))
        begin
          reg91 <= $unsigned(((-((wire90 ^ wire82) != (wire88 ?
                  wire83 : wire83))) ?
              $signed(({wire85} ?
                  $signed(wire88) : wire84)) : (wire84[(2'h3):(2'h3)] ?
                  $signed((wire89 && wire84)) : {(wire86 >= wire82),
                      wire89[(4'hb):(2'h2)]})));
          reg92 <= $signed(wire88);
          reg93 <= wire88;
        end
      else
        begin
          if (wire89[(4'h9):(1'h0)])
            begin
              reg91 <= ($unsigned({$signed($unsigned(wire85))}) ?
                  (reg93[(5'h12):(4'hf)] + ($signed((wire84 ?
                      (7'h42) : reg93)) ~^ ({wire89} && $unsigned(wire86)))) : (^$signed(wire82[(4'h8):(3'h6)])));
              reg92 <= $signed((wire88[(3'h7):(3'h5)] ?
                  ((((8'had) * reg91) ?
                      ((8'hb9) ?
                          wire86 : wire86) : wire86[(2'h2):(1'h1)]) << wire88) : $signed($unsigned((wire88 ?
                      (7'h42) : wire88)))));
            end
          else
            begin
              reg91 <= ((~((~^(wire83 << reg91)) ?
                      ((~(8'h9e)) > (wire84 - wire83)) : (-$signed(wire89)))) ?
                  wire87 : wire87[(2'h2):(1'h1)]);
            end
          reg93 <= wire88;
          reg94 <= ((&wire84) <= wire82);
          reg95 <= (!(8'h9c));
          if (wire80[(1'h0):(1'h0)])
            begin
              reg96 <= {$signed((8'hb1))};
              reg97 <= $signed((8'haa));
              reg98 <= (-(8'h9d));
              reg99 <= {reg96[(4'hc):(4'ha)]};
            end
          else
            begin
              reg96 <= ({{(reg91[(4'hd):(1'h1)] ? (8'hb9) : wire81)},
                      $signed(($unsigned(reg95) ?
                          $signed(reg99) : (wire86 >>> reg92)))} ?
                  ($signed(($signed(reg93) + wire82)) ?
                      (~^$signed((wire88 ?
                          reg92 : wire82))) : wire81[(2'h3):(2'h3)]) : $unsigned(wire89[(4'ha):(4'h8)]));
              reg97 <= wire81;
            end
        end
      reg100 <= $signed((&((wire80[(2'h2):(2'h2)] == (&reg91)) ?
          {(reg98 ? wire87 : reg98)} : (~&$signed(wire83)))));
      reg101 <= $signed((wire81 && $unsigned(reg94)));
      reg102 <= ({$unsigned($signed((wire83 ? wire86 : reg93))),
              {(7'h44), (~|reg91)}} ?
          ((wire90 ? $signed((reg91 || wire86)) : ((^~reg97) >= reg100)) ?
              $unsigned($signed(wire89[(4'hd):(4'hb)])) : reg98) : {wire88[(4'hb):(1'h0)]});
      reg103 <= (((((+reg96) ^~ (wire81 > (8'had))) ?
          (+$unsigned((8'hb9))) : reg101[(3'h7):(3'h6)]) || $unsigned(reg91)) & (+{$signed(reg95),
          {(!(8'ha6))}}));
    end
  assign wire104 = (8'hab);
  always
    @(posedge clk) begin
      reg105 <= $signed(reg101);
      reg106 <= {reg98[(2'h3):(2'h3)]};
      reg107 <= {(reg100[(4'h8):(3'h5)] * $unsigned(wire88[(3'h4):(1'h0)]))};
      reg108 <= ($unsigned(wire89[(2'h2):(2'h2)]) ?
          $unsigned($signed(wire86[(1'h0):(1'h0)])) : (wire80[(1'h0):(1'h0)] ^~ (wire89 << (~&(^reg107)))));
      reg109 <= {reg108};
    end
  assign wire110 = ({(~^{$signed(wire87), $unsigned(reg98)})} ?
                       ({reg94[(2'h3):(1'h1)],
                           ((-wire83) ?
                               wire83[(4'ha):(2'h2)] : $signed(wire80))} <<< ({$unsigned(reg94)} ?
                           $signed(((8'ha7) == (8'hb5))) : (((8'ha6) * reg95) || $unsigned(wire89)))) : ($signed($unsigned((-(8'had)))) ~^ {$unsigned(((8'hb3) >>> reg91))}));
  assign wire111 = $unsigned({$signed((|(wire88 ? wire82 : reg101))),
                       (+$signed((~|reg108)))});
  assign wire112 = $unsigned(($signed($unsigned($signed((8'hb2)))) || $unsigned(((wire88 ?
                       reg94 : reg100) - wire86))));
  assign wire113 = (~^(wire111[(1'h1):(1'h0)] ?
                       $unsigned($unsigned((reg97 >>> reg107))) : ($signed((|wire110)) == wire87)));
  assign wire114 = (&(8'hae));
  assign wire115 = reg107;
  always
    @(posedge clk) begin
      reg116 <= (~&$unsigned((((~|wire111) ?
              $unsigned(wire104) : reg106[(3'h5):(1'h1)]) ?
          reg106 : (^~((8'haf) ? wire86 : wire86)))));
    end
endmodule

module module49  (y, clk, wire54, wire53, wire52, wire51, wire50);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire54;
  input wire [(4'hb):(1'h0)] wire53;
  input wire [(4'h9):(1'h0)] wire52;
  input wire signed [(5'h13):(1'h0)] wire51;
  input wire [(4'hf):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire73;
  wire [(3'h4):(1'h0)] wire72;
  wire [(4'h9):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire55;
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire58,
                 wire57,
                 wire55,
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
                 reg56,
                 (1'h0)};
  assign wire55 = $signed($unsigned($unsigned($unsigned((wire53 ?
                      wire51 : wire53)))));
  always
    @(posedge clk) begin
      reg56 <= {$unsigned((8'hb2))};
    end
  assign wire57 = ((&{{(^wire53), (8'hac)},
                          ((wire55 ? wire52 : reg56) && {wire55, wire54})}) ?
                      ((~|(wire50 ^~ reg56[(3'h7):(1'h1)])) ?
                          reg56[(2'h3):(1'h1)] : ($signed(wire50[(4'ha):(2'h3)]) ?
                              ($unsigned(wire55) != (!wire50)) : ((reg56 & (7'h42)) ?
                                  (+wire51) : {wire50}))) : (^~wire54));
  assign wire58 = $signed($unsigned((wire51[(1'h0):(1'h0)] <<< ($signed(wire51) == $unsigned(wire50)))));
  always
    @(posedge clk) begin
      if ((wire50[(4'ha):(3'h6)] ?
          $unsigned((((reg56 ? wire50 : wire50) ?
              {wire50,
                  wire55} : $signed(wire51)) & {$unsigned(wire51)})) : wire58[(1'h1):(1'h1)]))
        begin
          reg59 <= (($signed($signed(((8'h9d) <= wire55))) + wire51[(4'hf):(3'h7)]) - wire58);
          if ((8'hbf))
            begin
              reg60 <= (((~|$signed((reg59 ? reg56 : wire57))) > {(wire58 ?
                      reg59 : (reg56 >>> wire54))}) >>> $signed(wire50[(4'h9):(1'h0)]));
            end
          else
            begin
              reg60 <= $unsigned(({wire53[(3'h5):(3'h5)]} ?
                  $unsigned($signed($signed(wire52))) : ({wire53[(2'h2):(1'h0)]} > (wire52[(1'h0):(1'h0)] ?
                      (wire52 ? wire50 : wire55) : (^~(8'hbc))))));
            end
          if ((^~{wire52[(2'h3):(1'h0)], $signed($unsigned($signed(wire51)))}))
            begin
              reg61 <= (!({(8'h9e)} | reg59));
              reg62 <= $unsigned(wire54[(1'h0):(1'h0)]);
              reg63 <= {(8'hba)};
            end
          else
            begin
              reg61 <= wire58;
              reg62 <= {({(wire54[(1'h1):(1'h0)] ?
                              $unsigned(reg60) : wire57[(4'hd):(2'h3)])} ?
                      wire50 : $signed((wire55[(4'h8):(2'h2)] < $unsigned(reg61))))};
              reg63 <= wire53;
              reg64 <= (!$unsigned((~^reg62[(2'h2):(2'h2)])));
            end
        end
      else
        begin
          reg59 <= wire53;
          reg60 <= wire54;
          reg61 <= {(^(reg61[(1'h0):(1'h0)] ?
                  $signed((+wire52)) : $signed((wire57 >>> reg61))))};
        end
      reg65 <= wire58;
      reg66 <= ((($signed($signed(reg64)) + $signed($signed(wire55))) ?
              (~|$signed((|reg63))) : (($signed(wire51) && (8'h9f)) ^~ wire51[(5'h10):(4'he)])) ?
          $signed((~^{$signed((7'h41))})) : (~&$signed((~&wire55))));
      reg67 <= ({((7'h42) + {$unsigned(reg56)}),
          (+(~^$unsigned(reg61)))} || $unsigned((($unsigned(wire55) > $signed((8'hbc))) ?
          (8'ha6) : $unsigned((reg66 <<< reg64)))));
    end
  always
    @(posedge clk) begin
      reg68 <= $unsigned(($unsigned($unsigned(wire53[(4'hb):(2'h3)])) >= $unsigned((~^(&reg64)))));
      reg69 <= ((~&reg56[(5'h12):(4'ha)]) ?
          {wire58[(3'h7):(3'h7)],
              ((|$signed(wire51)) != (reg60 <<< $unsigned(wire51)))} : $unsigned((wire50 & reg59[(2'h3):(2'h3)])));
    end
  assign wire70 = $unsigned(wire51);
  assign wire71 = ($unsigned(($signed($unsigned((8'ha6))) <= $signed((reg67 | (8'ha5))))) ?
                      (reg66[(2'h3):(2'h2)] ^ $unsigned((reg66[(3'h4):(2'h2)] < (wire57 ^ wire52)))) : $signed(($unsigned((~reg60)) >= ((~|wire52) >= reg63))));
  assign wire72 = $unsigned(((wire57[(1'h0):(1'h0)] && $unsigned(reg66)) + $signed(reg60)));
  assign wire73 = {$unsigned(($unsigned(reg62) ?
                          {$signed(reg63), $signed(reg67)} : ({(8'ha1)} ?
                              (wire58 ? reg65 : wire70) : $signed(wire54)))),
                      ($unsigned({(wire50 ? reg65 : reg65), (~reg66)}) ?
                          $signed($signed((wire51 ?
                              wire53 : reg60))) : $unsigned(((|reg67) >> (reg56 ?
                              reg67 : reg64))))};
  assign wire74 = (($signed(((&wire71) ?
                              (wire71 ? wire58 : reg62) : ((8'haa) ?
                                  wire73 : reg59))) ?
                          (^wire54[(2'h2):(1'h1)]) : {(&(wire57 ?
                                  (8'hb8) : wire54)),
                              (reg65 + (!(8'ha7)))}) ?
                      $signed((reg63 ?
                          $signed({reg65, reg67}) : wire50)) : reg59);
  assign wire75 = $signed($signed((+(8'ha3))));
  assign wire76 = wire72[(2'h2):(2'h2)];
endmodule

module module22  (y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire27;
  input wire signed [(2'h2):(1'h0)] wire26;
  input wire signed [(4'hc):(1'h0)] wire25;
  input wire signed [(4'hc):(1'h0)] wire24;
  input wire [(4'h8):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire45;
  wire [(4'ha):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(4'h9):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire30;
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire30,
                 reg38,
                 reg32,
                 reg31,
                 reg29,
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg28 <= ($unsigned(wire24[(3'h4):(2'h3)]) >>> $unsigned($signed(wire24)));
      reg29 <= (~&{wire24[(4'h9):(3'h4)]});
    end
  assign wire30 = $signed($signed($signed(reg28)));
  always
    @(posedge clk) begin
      reg31 <= {(((!(8'hac)) ^ ((!wire25) < $signed(reg28))) ?
              wire23[(3'h7):(2'h3)] : (+wire25[(4'h8):(3'h5)]))};
      reg32 <= $unsigned(wire26[(2'h2):(2'h2)]);
    end
  assign wire33 = reg31;
  assign wire34 = (^wire33);
  assign wire35 = $unsigned(wire34);
  assign wire36 = ($signed($signed(reg31)) ?
                      (wire30 ? $unsigned({(~(7'h42))}) : wire30) : (8'hac));
  assign wire37 = reg29;
  always
    @(posedge clk) begin
      reg38 <= $signed(wire30[(4'hb):(3'h5)]);
    end
  assign wire39 = $unsigned((^(wire34 == wire34[(4'h8):(3'h4)])));
  assign wire40 = {(reg31 + reg29)};
  assign wire41 = {wire34[(3'h6):(2'h3)], wire35[(2'h2):(1'h0)]};
  assign wire42 = {$unsigned((|(reg31 ?
                          (wire26 ^ wire26) : $unsigned(wire33))))};
  assign wire43 = $unsigned({(~&($signed(reg38) >= $unsigned(wire26))),
                      reg31[(4'hf):(3'h5)]});
  assign wire44 = wire25;
  assign wire45 = (^~{(($unsigned(reg32) >> (wire34 ?
                          (8'hbc) : wire40)) < wire25[(4'h8):(4'h8)])});
  assign wire46 = (wire37 ?
                      {(8'ha5),
                          $unsigned($unsigned((wire34 ?
                              wire30 : wire37)))} : wire39[(4'hc):(4'h9)]);
endmodule
