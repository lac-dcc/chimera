module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h237):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire151;
  wire signed [(4'hb):(1'h0)] wire150;
  wire signed [(5'h14):(1'h0)] wire149;
  wire signed [(3'h7):(1'h0)] wire131;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire74;
  wire signed [(5'h12):(1'h0)] wire75;
  wire [(4'ha):(1'h0)] wire129;
  reg [(4'ha):(1'h0)] reg148 = (1'h0);
  reg [(2'h2):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg145 = (1'h0);
  reg [(4'hc):(1'h0)] reg144 = (1'h0);
  reg [(3'h5):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg142 = (1'h0);
  reg [(4'h8):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg139 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg136 = (1'h0);
  reg [(3'h7):(1'h0)] reg135 = (1'h0);
  reg [(3'h7):(1'h0)] reg134 = (1'h0);
  reg [(3'h5):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg132 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire149,
                 wire131,
                 wire5,
                 wire15,
                 wire16,
                 wire17,
                 wire29,
                 wire30,
                 wire72,
                 wire74,
                 wire75,
                 wire129,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (|{(((wire1 ? wire0 : wire0) ?
                         wire4[(3'h5):(2'h2)] : (~|wire1)) - $signed(wire4[(4'h8):(3'h7)]))});
  always
    @(posedge clk) begin
      if ((~&(~|{wire3})))
        begin
          if ($signed($signed((8'ha1))))
            begin
              reg6 <= (wire2 ?
                  wire2 : $signed((((+(7'h40)) ? (8'ha9) : (wire1 + (7'h42))) ?
                      $unsigned((!wire4)) : wire5)));
              reg7 <= $unsigned($unsigned({((^wire2) ?
                      (wire5 ? (7'h44) : wire0) : wire4)}));
              reg8 <= $signed(reg6);
              reg9 <= (((((~^wire1) ? (^wire5) : (wire4 >= wire0)) ?
                  wire3 : ($signed(wire5) >> wire5)) && reg7[(4'h9):(4'h9)]) << {reg8,
                  $unsigned((wire0 ^ (&wire4)))});
            end
          else
            begin
              reg6 <= (^~(-wire2[(3'h6):(3'h6)]));
              reg7 <= (wire3[(2'h2):(1'h0)] - ($unsigned($signed($unsigned(wire4))) != $signed((wire3 > (reg6 > reg9)))));
              reg8 <= (reg6[(1'h1):(1'h0)] ~^ $unsigned((($unsigned(wire4) < (reg9 >>> (8'ha7))) ?
                  (8'hbc) : (&reg8[(1'h0):(1'h0)]))));
              reg9 <= ($signed($signed($signed((~&wire2)))) ?
                  ((~^(wire3 ~^ wire1[(3'h4):(2'h3)])) ?
                      (wire4 - (((7'h41) && wire1) ~^ (wire3 ?
                          reg9 : wire3))) : $unsigned(wire4)) : wire2);
            end
          if ((~(~reg7[(3'h4):(2'h3)])))
            begin
              reg10 <= (wire1[(2'h3):(1'h1)] << reg9);
              reg11 <= wire1[(1'h0):(1'h0)];
              reg12 <= $signed(($unsigned(($unsigned(reg6) ?
                      reg8 : (wire4 ? wire4 : wire4))) ?
                  ((((7'h41) ? reg8 : reg6) ?
                      $unsigned(wire1) : (reg7 ?
                          reg7 : reg11)) && reg11) : (&reg11[(1'h1):(1'h1)])));
              reg13 <= reg12[(3'h4):(2'h2)];
            end
          else
            begin
              reg10 <= $signed(($signed($signed((!(8'hb1)))) >> ({wire0} << ((wire2 + wire4) ?
                  (reg7 ^ reg11) : reg13[(3'h5):(2'h3)]))));
              reg11 <= reg7[(2'h3):(1'h1)];
            end
        end
      else
        begin
          reg6 <= ((~(~^reg7[(4'h9):(3'h7)])) << (((reg8 ?
                      wire5[(1'h0):(1'h0)] : wire3[(1'h1):(1'h0)]) ?
                  (^(wire5 ? reg9 : wire2)) : wire2) ?
              ((8'hb3) <<< {(~&reg8)}) : ((+$unsigned(reg6)) ?
                  $unsigned($unsigned(reg11)) : $unsigned(((8'had) ?
                      wire5 : reg11)))));
          reg7 <= (reg11[(2'h3):(1'h1)] ?
              reg11[(3'h4):(2'h3)] : $unsigned($unsigned((~^(reg10 & wire2)))));
        end
      reg14 <= (wire0[(4'ha):(1'h1)] ?
          $signed(wire4) : $signed((reg12[(1'h1):(1'h1)] ^~ $unsigned($unsigned(reg8)))));
    end
  assign wire15 = ($signed(wire3) ?
                      {(wire2[(3'h4):(3'h4)] ^~ $unsigned(wire4[(2'h3):(2'h2)])),
                          $unsigned(($signed(reg11) << {wire5,
                              reg14}))} : wire3[(4'ha):(3'h7)]);
  assign wire16 = {{{wire0, {{wire2, reg7}}},
                          (wire15[(3'h4):(2'h3)] & (reg9[(3'h4):(1'h1)] || wire15[(2'h3):(1'h1)]))},
                      {wire0}};
  assign wire17 = (wire16[(2'h3):(2'h2)] ?
                      ($signed(wire0) != $signed(((~|reg11) >> ((8'h9d) ~^ wire2)))) : reg12);
  always
    @(posedge clk) begin
      reg18 <= $unsigned(($unsigned($signed((~&wire15))) ?
          reg6[(1'h0):(1'h0)] : ((~&$signed((8'h9c))) >>> $unsigned((8'h9e)))));
      reg19 <= $signed(reg6);
      reg20 <= (8'hb1);
      if (wire16)
        begin
          reg21 <= ($signed(wire17[(1'h1):(1'h1)]) << {(^(|(^~wire0))),
              ((reg11 ?
                  reg10 : (reg12 ?
                      wire16 : reg7)) >= $signed((wire3 ^~ (8'ha1))))});
          reg22 <= wire16;
          reg23 <= $signed((-((reg9 ?
              ((8'h9c) ?
                  wire3 : wire17) : (~^wire1)) > ((reg12 > reg14) * reg21[(3'h6):(3'h6)]))));
          reg24 <= $signed((8'hb3));
          reg25 <= $unsigned(($unsigned((~^$signed(wire4))) <= (reg19[(1'h1):(1'h0)] ?
              ($unsigned(reg13) << (wire15 ^ wire17)) : reg10[(2'h2):(2'h2)])));
        end
      else
        begin
          reg21 <= {(!reg11[(4'hc):(4'hc)]), reg11};
          if (reg7)
            begin
              reg22 <= $signed($signed($signed(wire0)));
              reg23 <= $signed((8'h9d));
              reg24 <= $signed((wire17 ^~ (reg19 ?
                  (reg11 ?
                      reg20[(1'h0):(1'h0)] : (reg18 ? wire2 : reg24)) : reg8)));
            end
          else
            begin
              reg22 <= reg9[(3'h5):(2'h2)];
              reg23 <= wire1;
            end
          reg25 <= {$signed(reg21)};
          reg26 <= (~|($signed((~reg11[(3'h5):(2'h2)])) + (wire3[(2'h3):(1'h0)] == (~|$signed((8'hb2))))));
          reg27 <= (+(~&$unsigned(((8'had) ?
              (reg26 ^ reg7) : (reg8 ? wire15 : reg9)))));
        end
      reg28 <= $signed({($signed($signed(reg23)) <= $signed((!wire15))),
          (wire15[(1'h1):(1'h1)] ?
              $signed(reg11[(4'hc):(3'h6)]) : ($unsigned(reg25) ?
                  (reg22 ? reg6 : reg25) : reg21[(4'he):(1'h1)]))});
    end
  assign wire29 = {$signed($unsigned($unsigned(wire5)))};
  assign wire30 = ($signed($signed(((~&(8'hb6)) ?
                      reg19 : $signed(wire2)))) >= (!$unsigned((&(&reg21)))));
  module31 #() modinst73 (.wire32(wire15), .wire35(reg27), .wire33(wire30), .clk(clk), .wire34(reg9), .y(wire72));
  assign wire74 = wire4[(1'h1):(1'h0)];
  assign wire75 = wire2;
  module76 #() modinst130 (.wire77(wire16), .wire79(reg20), .wire78(wire2), .wire81(wire17), .y(wire129), .wire80(reg11), .clk(clk));
  assign wire131 = $signed($unsigned(($signed((wire3 == wire1)) <= wire5[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      if (((~&wire72[(1'h1):(1'h0)]) ~^ $signed((~^wire30[(3'h5):(1'h0)]))))
        begin
          reg132 <= (reg20 ? reg23[(3'h5):(2'h2)] : (8'hbf));
          if ((~&$unsigned(($signed(wire129[(3'h7):(3'h5)]) - $signed($signed(wire4))))))
            begin
              reg133 <= (~&reg8);
              reg134 <= $signed(((($unsigned((8'hab)) ~^ ((8'hb0) >= wire4)) ?
                      {$signed(reg18)} : $unsigned((wire131 ?
                          reg22 : wire15))) ?
                  (reg132[(4'hf):(4'h8)] ?
                      $signed($signed(reg12)) : reg28[(2'h2):(1'h1)]) : $unsigned($unsigned((wire3 + reg22)))));
              reg135 <= wire29;
            end
          else
            begin
              reg133 <= $unsigned(reg134);
              reg134 <= ((-reg23) ^ (8'ha5));
              reg135 <= (^~reg133[(2'h2):(1'h0)]);
              reg136 <= $unsigned(($unsigned(($unsigned(wire3) ?
                  {reg19} : (-wire72))) ^ (wire5[(2'h3):(1'h0)] ?
                  $unsigned(reg26[(4'h9):(3'h4)]) : ($unsigned(reg26) ~^ (~&reg10)))));
            end
          if (reg136)
            begin
              reg137 <= wire0[(2'h3):(1'h1)];
              reg138 <= $unsigned(({{reg7, wire5[(1'h1):(1'h0)]}} ?
                  reg28 : wire15[(5'h14):(1'h1)]));
              reg139 <= (^wire3);
              reg140 <= (8'hb8);
            end
          else
            begin
              reg137 <= ((!(($signed(reg26) >>> (reg27 ?
                  reg133 : reg9)) - (-(reg6 ?
                  (8'hb1) : wire4)))) ^~ $signed(wire3));
              reg138 <= reg27[(4'hd):(2'h2)];
              reg139 <= ((7'h40) ?
                  reg6 : (~&(wire74 ?
                      ((reg26 ?
                          wire0 : wire131) || reg134[(2'h3):(1'h1)]) : $unsigned($unsigned((8'hba))))));
              reg140 <= (|(~(^~reg138[(3'h4):(1'h0)])));
              reg141 <= $signed((&(^~$signed({reg21}))));
            end
          if ($signed($signed((reg140 | ({reg25} ?
              reg133 : (reg137 <= wire16))))))
            begin
              reg142 <= (8'ha1);
              reg143 <= $unsigned($unsigned((!wire3)));
              reg144 <= $signed(($unsigned($unsigned(((8'hbf) & reg28))) == ({(wire72 * wire75)} ?
                  ($signed(reg10) ?
                      {(8'hbe), reg22} : $unsigned(wire0)) : reg27)));
              reg145 <= reg133;
            end
          else
            begin
              reg142 <= {$unsigned(($signed(reg136[(1'h0):(1'h0)]) ~^ (-reg11)))};
              reg143 <= reg26;
              reg144 <= $signed($unsigned(reg26[(1'h1):(1'h0)]));
              reg145 <= {{(^~reg12[(3'h4):(1'h0)])}};
            end
        end
      else
        begin
          if ((^$signed(reg144[(3'h5):(2'h2)])))
            begin
              reg132 <= (~$unsigned((^(reg142[(1'h1):(1'h1)] == $signed(wire29)))));
            end
          else
            begin
              reg132 <= reg10[(1'h1):(1'h1)];
            end
          reg133 <= ({$unsigned($unsigned((reg27 >>> reg10)))} ?
              (reg136[(1'h0):(1'h0)] ?
                  (reg140 ^ wire16) : reg133[(2'h3):(2'h2)]) : $unsigned(reg137[(1'h1):(1'h1)]));
          if ($unsigned(wire3[(4'ha):(1'h0)]))
            begin
              reg134 <= wire17;
            end
          else
            begin
              reg134 <= (reg10[(1'h1):(1'h0)] | {($unsigned(wire3[(4'h9):(3'h5)]) ?
                      reg132[(4'h9):(3'h6)] : ((^(8'ha6)) ?
                          (8'hb0) : (reg133 ^ reg23))),
                  (wire29 ? ((|reg28) ? wire3 : $signed(reg6)) : reg135)});
              reg135 <= (+(wire129[(1'h1):(1'h0)] >> (({(8'haa)} && $unsigned(wire15)) < reg12[(1'h1):(1'h0)])));
            end
          reg136 <= $unsigned(($unsigned($unsigned({wire17,
              (8'ha3)})) != reg11[(4'hd):(3'h5)]));
        end
      reg146 <= reg144[(4'hc):(1'h0)];
      reg147 <= reg133[(1'h0):(1'h0)];
      reg148 <= $unsigned({{$signed($signed(reg145)),
              (|((7'h41) ? reg26 : wire17))},
          ($unsigned($unsigned(reg20)) ?
              wire3 : {$unsigned(reg132), $signed((8'ha0))})});
    end
  assign wire149 = reg18[(2'h3):(1'h0)];
  assign wire150 = wire5;
  assign wire151 = {{(+{$unsigned(reg6), $unsigned(reg25)})}};
endmodule

module module76  (y, clk, wire81, wire80, wire79, wire78, wire77);
  output wire [(32'h223):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire81;
  input wire [(5'h13):(1'h0)] wire80;
  input wire signed [(4'h9):(1'h0)] wire79;
  input wire [(5'h11):(1'h0)] wire78;
  input wire signed [(4'h8):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire128;
  wire signed [(4'hc):(1'h0)] wire127;
  wire signed [(5'h14):(1'h0)] wire126;
  wire [(4'hc):(1'h0)] wire125;
  wire [(4'h8):(1'h0)] wire124;
  wire signed [(3'h7):(1'h0)] wire123;
  wire [(4'hf):(1'h0)] wire122;
  wire [(5'h15):(1'h0)] wire114;
  wire [(3'h7):(1'h0)] wire113;
  wire signed [(2'h3):(1'h0)] wire112;
  wire signed [(3'h7):(1'h0)] wire111;
  wire [(4'h9):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire105;
  wire signed [(3'h4):(1'h0)] wire83;
  wire [(3'h7):(1'h0)] wire82;
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg120 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg119 = (1'h0);
  reg [(4'ha):(1'h0)] reg118 = (1'h0);
  reg [(3'h5):(1'h0)] reg117 = (1'h0);
  reg [(4'ha):(1'h0)] reg116 = (1'h0);
  reg [(5'h15):(1'h0)] reg115 = (1'h0);
  reg signed [(4'he):(1'h0)] reg109 = (1'h0);
  reg [(4'h8):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg106 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg102 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg100 = (1'h0);
  reg [(3'h5):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg98 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg95 = (1'h0);
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(3'h6):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg92 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg89 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(3'h4):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire105,
                 wire83,
                 wire82,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
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
                 (1'h0)};
  assign wire82 = (((~|$signed($unsigned(wire78))) ?
                      $unsigned(((~|(8'hac)) * $signed(wire79))) : $signed(({wire78,
                              (7'h43)} ?
                          wire78[(3'h5):(1'h1)] : $unsigned(wire79)))) < $signed(($unsigned($signed(wire80)) >= ($signed(wire79) ?
                      ((8'h9c) & wire80) : wire77))));
  assign wire83 = wire82[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg84 <= wire77[(3'h6):(2'h2)];
      if (wire79)
        begin
          if (wire77)
            begin
              reg85 <= $signed($signed(wire77));
              reg86 <= ((+wire81[(1'h0):(1'h0)]) - wire81[(1'h1):(1'h0)]);
              reg87 <= (wire82 + ((((reg84 <<< reg85) << (&reg84)) ?
                  {reg85[(2'h2):(1'h1)]} : $signed(wire80[(3'h7):(3'h4)])) ~^ (8'hba)));
              reg88 <= (~|(8'hbb));
            end
          else
            begin
              reg85 <= ((wire78[(3'h7):(1'h1)] ?
                      (wire78 ~^ wire80[(4'hb):(4'ha)]) : ($unsigned((~&(8'h9e))) ?
                          $unsigned({reg87,
                              wire83}) : $unsigned($signed(reg86)))) ?
                  (($signed($unsigned(wire82)) | wire77[(1'h1):(1'h0)]) == wire78[(4'he):(4'ha)]) : wire81[(2'h2):(1'h0)]);
              reg86 <= (wire79[(2'h2):(2'h2)] > wire80);
              reg87 <= $signed((wire81 < ($signed(reg84[(3'h7):(3'h7)]) ?
                  ((reg88 >>> wire77) ?
                      (~|wire79) : wire80[(3'h5):(1'h1)]) : ((!wire78) ?
                      (~&reg88) : $unsigned((8'h9d))))));
            end
        end
      else
        begin
          if (((~&({wire79, (wire83 ? wire79 : reg84)} ?
                  $unsigned($unsigned(reg87)) : wire77[(1'h0):(1'h0)])) ?
              reg85[(3'h4):(1'h0)] : (|reg86)))
            begin
              reg85 <= {(~&$unsigned((((8'hb3) ^~ reg86) ?
                      {reg84} : $unsigned(wire78)))),
                  (~&{wire83[(2'h2):(1'h0)], (^~reg86)})};
              reg86 <= $unsigned($signed($unsigned(wire81)));
              reg87 <= (($unsigned(wire78[(4'hf):(4'hb)]) ?
                  $signed(((^~reg87) ?
                      reg87 : $signed(reg87))) : {((reg84 & (7'h42)) ?
                          $signed((8'ha1)) : $signed(wire83)),
                      reg86[(4'h9):(4'h9)]}) > {wire81[(1'h1):(1'h1)]});
            end
          else
            begin
              reg85 <= (((($signed(wire78) + ((8'ha5) ?
                      reg88 : wire78)) + $unsigned(wire78[(2'h2):(1'h1)])) ?
                  wire82 : $signed(reg84)) << (wire80 ^ ((~&(-wire79)) | (wire81[(2'h2):(2'h2)] ?
                  $signed(wire77) : {reg88, reg84}))));
              reg86 <= {({(~|$unsigned(wire83))} > {(((7'h42) != (8'ha9)) ?
                          $unsigned(reg86) : (wire82 ? reg86 : reg88)),
                      wire78[(2'h3):(1'h1)]}),
                  reg84};
            end
          reg88 <= (^~(~^$signed(wire80[(5'h11):(1'h1)])));
          reg89 <= $unsigned($signed($signed((8'hbc))));
          reg90 <= $unsigned(((-({wire78, (8'hb2)} ?
              wire77 : (wire78 ?
                  wire79 : wire82))) > $unsigned($unsigned((wire82 * wire79)))));
        end
      if ({(|(((wire78 ~^ wire78) < wire77) ?
              ($unsigned(wire80) <= (8'h9e)) : (~&(|wire81))))})
        begin
          if ($signed(wire83))
            begin
              reg91 <= reg87;
              reg92 <= (8'hb8);
              reg93 <= (!$signed(($unsigned(wire83) ?
                  reg89[(1'h1):(1'h1)] : ((7'h44) << reg90))));
              reg94 <= $signed($signed((reg84[(4'he):(4'h9)] ?
                  reg87[(3'h7):(2'h2)] : $signed((reg89 >= reg85)))));
            end
          else
            begin
              reg91 <= reg89;
              reg92 <= (~|$unsigned((^$unsigned(reg87))));
            end
          reg95 <= $unsigned($unsigned($signed($signed($unsigned(wire82)))));
          if ($unsigned(reg89[(4'hb):(2'h2)]))
            begin
              reg96 <= wire79;
              reg97 <= (^~reg85[(1'h0):(1'h0)]);
            end
          else
            begin
              reg96 <= $signed($unsigned(reg88));
            end
        end
      else
        begin
          reg91 <= reg91[(1'h1):(1'h0)];
        end
      if (reg95)
        begin
          if (reg87)
            begin
              reg98 <= (wire82[(3'h7):(3'h7)] ?
                  ((^(&(reg85 ?
                      reg95 : reg97))) && {{reg85[(1'h1):(1'h0)]}}) : $unsigned(($unsigned($signed(wire83)) >= $unsigned(reg89[(4'ha):(3'h5)]))));
              reg99 <= $unsigned(reg96);
              reg100 <= ($signed($signed($unsigned((wire82 * (8'hb5))))) ?
                  (8'hbe) : {{$unsigned($unsigned(reg88))}});
              reg101 <= {$unsigned(reg97)};
              reg102 <= $unsigned((&(reg91[(3'h7):(3'h4)] ^~ (|reg88[(3'h4):(1'h0)]))));
            end
          else
            begin
              reg98 <= {(reg91[(3'h4):(3'h4)] ?
                      reg99 : $signed((wire83 * reg97)))};
              reg99 <= $unsigned($unsigned((wire82[(1'h1):(1'h1)] ?
                  ($signed(wire80) ?
                      $unsigned(wire83) : (wire82 ?
                          reg97 : reg97)) : $unsigned($signed((8'hb7))))));
              reg100 <= ($unsigned((~&$signed(reg90[(1'h0):(1'h0)]))) ?
                  $signed((reg86 || ((|reg101) || wire83[(1'h0):(1'h0)]))) : (-$signed(wire80)));
              reg101 <= reg85[(1'h1):(1'h1)];
              reg102 <= (!$unsigned((-$unsigned((-reg84)))));
            end
          reg103 <= (~&{(8'h9e)});
        end
      else
        begin
          reg98 <= (-reg88[(1'h0):(1'h0)]);
          if (reg91)
            begin
              reg99 <= $unsigned((($signed(wire77) ~^ $unsigned((7'h40))) ?
                  reg88 : ((^(wire77 * (8'ha4))) || (-(^~reg100)))));
              reg100 <= (reg87 ?
                  ((^~(8'hbc)) ?
                      ((((8'hb2) ? wire81 : reg99) ?
                          reg92 : {reg89, wire83}) * {(-wire78),
                          wire79[(3'h6):(3'h6)]}) : (((reg86 & (8'hb8)) ?
                              $unsigned((8'hbc)) : (8'ha1)) ?
                          reg85 : (~^(8'had)))) : $signed((-wire81[(1'h1):(1'h0)])));
              reg101 <= $unsigned($unsigned(wire82[(2'h3):(2'h3)]));
              reg102 <= ($signed(wire77) <<< ($unsigned((wire83[(3'h4):(3'h4)] << $signed(reg89))) ?
                  reg89 : reg92[(3'h4):(3'h4)]));
              reg103 <= (reg91[(3'h5):(1'h1)] ?
                  reg97[(3'h6):(2'h3)] : (~|reg97[(2'h3):(1'h0)]));
            end
          else
            begin
              reg99 <= ($unsigned($signed(((|reg99) ^~ (wire82 ?
                      reg85 : (8'ha3))))) ?
                  reg102[(1'h0):(1'h0)] : reg85[(2'h3):(2'h3)]);
              reg100 <= $unsigned((&reg99));
              reg101 <= reg98[(2'h2):(1'h1)];
            end
        end
      reg104 <= (8'had);
    end
  assign wire105 = (^~($signed($unsigned(((8'hb1) ? wire77 : reg88))) ?
                       $signed(wire78[(1'h1):(1'h0)]) : ((8'had) - {((8'ha7) > reg103),
                           reg99})));
  always
    @(posedge clk) begin
      reg106 <= reg103[(4'ha):(3'h7)];
      reg107 <= reg103[(3'h6):(3'h6)];
      reg108 <= wire77;
      reg109 <= $unsigned({((~&(~reg104)) >>> (~&(reg89 ? (7'h42) : reg87))),
          $unsigned((8'ha3))});
    end
  assign wire110 = ($signed(reg97) || ((~^reg106) - $signed((reg106[(5'h10):(2'h3)] + reg101))));
  assign wire111 = (reg107 ? reg99 : wire78[(3'h4):(2'h2)]);
  assign wire112 = reg84;
  assign wire113 = (!$unsigned(((^(wire111 ?
                       (8'h9e) : reg100)) >= $unsigned({wire82}))));
  assign wire114 = ($unsigned((^~$signed(((8'ha8) + wire110)))) > $unsigned(($unsigned((reg92 > wire78)) < (+$unsigned(reg101)))));
  always
    @(posedge clk) begin
      if (($signed((($unsigned((8'ha7)) ^~ wire112[(2'h3):(1'h1)]) != $signed((reg87 ?
          reg103 : wire78)))) && reg89[(3'h7):(1'h0)]))
        begin
          reg115 <= $unsigned($signed(reg98));
          reg116 <= (((((reg84 < (8'ha4)) >>> $signed(reg87)) ?
                  $unsigned((wire77 ?
                      reg92 : (8'hba))) : reg104[(4'hd):(3'h6)]) == (+$signed($unsigned(reg100)))) ?
              ($unsigned(($unsigned(reg95) == $unsigned(reg84))) || $signed(({wire78,
                      reg84} ?
                  {wire113,
                      reg98} : $unsigned((8'hb6))))) : reg109[(2'h3):(1'h1)]);
        end
      else
        begin
          reg115 <= reg109;
          if ($signed((~|$signed((~|$unsigned(reg93))))))
            begin
              reg116 <= ((|reg85) ? reg100[(4'hc):(1'h1)] : reg91);
            end
          else
            begin
              reg116 <= reg97[(2'h2):(1'h1)];
            end
          reg117 <= (~|((($signed(reg98) ?
                  $unsigned(wire77) : $signed(reg101)) ?
              $signed(reg104) : (reg115[(5'h15):(4'hb)] <<< (reg86 ^ reg108))) ^ (~^($signed(reg89) ?
              $unsigned(reg93) : (reg90 ? wire105 : wire78)))));
          reg118 <= wire111[(1'h1):(1'h0)];
        end
      reg119 <= (^$unsigned(wire110));
      reg120 <= wire80;
      reg121 <= $signed(reg88[(1'h0):(1'h0)]);
    end
  assign wire122 = $unsigned(wire105[(1'h1):(1'h0)]);
  assign wire123 = ((^~(wire105 ?
                           ((7'h40) ?
                               (-wire82) : reg109[(2'h3):(2'h3)]) : $signed($signed(reg90)))) ?
                       ((reg84[(3'h5):(3'h5)] ?
                           reg102[(1'h0):(1'h0)] : reg103[(4'h9):(3'h4)]) > (-$unsigned(reg106[(3'h5):(3'h5)]))) : (&reg102[(3'h4):(2'h3)]));
  assign wire124 = wire78[(5'h11):(5'h10)];
  assign wire125 = $signed((^reg118[(4'h8):(1'h1)]));
  assign wire126 = $signed({$signed((~^{(8'hb9)}))});
  assign wire127 = (reg89 ?
                       ($unsigned($signed($unsigned((7'h41)))) ?
                           {({reg84} > {reg101, (8'hbe)}), reg98} : (&((wire79 ?
                                   reg101 : (8'h9c)) ?
                               (reg84 ?
                                   reg119 : wire79) : {reg106}))) : (8'hb8));
  assign wire128 = (8'haf);
endmodule

module module31  (y, clk, wire32, wire33, wire34, wire35);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire32;
  input wire signed [(4'hc):(1'h0)] wire33;
  input wire signed [(4'hf):(1'h0)] wire34;
  input wire signed [(4'hd):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire70;
  wire signed [(4'h9):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire66;
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire36,
                 wire37,
                 wire49,
                 wire66,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 (1'h0)};
  assign wire36 = (((($unsigned(wire35) ? $signed(wire33) : $signed((7'h41))) ?
                              wire32 : ((wire32 ? wire33 : wire35) ?
                                  wire34 : wire34[(4'hb):(3'h5)])) ?
                          ($signed($unsigned(wire35)) || $unsigned((wire34 ?
                              wire34 : (8'ha4)))) : $signed(wire35)) ?
                      $signed((wire32[(5'h14):(4'hd)] << (|wire33))) : wire35[(4'hd):(3'h6)]);
  assign wire37 = ((wire34[(2'h3):(2'h2)] <<< (wire33[(4'h8):(2'h2)] ?
                      $unsigned({(8'ha7),
                          wire36}) : $signed($unsigned(wire35)))) < ($unsigned(wire33[(2'h3):(2'h2)]) ?
                      $unsigned(((^(8'h9d)) ?
                          $unsigned(wire32) : (wire36 ?
                              (8'h9c) : wire34))) : (((wire32 ?
                                  (8'haf) : (8'ha7)) ?
                              $signed((8'hab)) : $unsigned(wire32)) ?
                          wire35 : wire35[(4'hd):(1'h1)])));
  always
    @(posedge clk) begin
      reg38 <= wire36;
      reg39 <= (~&$unsigned(wire37));
      reg40 <= wire34;
      reg41 <= (((wire37[(1'h0):(1'h0)] && (!$signed(reg39))) <<< $signed($signed((~^(8'hac))))) ?
          wire36 : (~&($unsigned($signed(reg40)) ?
              reg39[(2'h2):(2'h2)] : reg39[(1'h0):(1'h0)])));
      if (reg38[(2'h2):(1'h0)])
        begin
          reg42 <= (~($signed(wire34[(3'h6):(2'h2)]) ?
              wire37 : (~|wire36[(4'ha):(4'ha)])));
        end
      else
        begin
          reg42 <= (~|$unsigned($signed(((-wire33) ?
              {(8'hbe)} : (wire34 >> reg42)))));
          reg43 <= ($unsigned(((+wire33) ?
                  ((~&reg40) ?
                      (~^reg42) : {reg39}) : $signed($unsigned(wire37)))) ?
              reg38 : (&$unsigned((^~$signed(reg41)))));
          reg44 <= {(~^$signed(($signed(wire34) || (+reg40)))),
              wire37[(4'h8):(1'h1)]};
          reg45 <= wire33;
          if ({(~&$unsigned((((7'h41) + reg39) * $unsigned(wire34)))),
              (($signed(reg44[(1'h1):(1'h0)]) & $signed($signed(reg41))) ?
                  wire32 : $unsigned((wire37[(4'h8):(4'h8)] ?
                      ((8'ha2) ? reg43 : reg39) : $signed(reg39))))})
            begin
              reg46 <= (-$unsigned(((|(^wire36)) ?
                  ($unsigned(reg44) <= {wire35, wire34}) : (!(reg42 ?
                      wire32 : reg40)))));
              reg47 <= $unsigned(((reg40 <= reg40) ?
                  $unsigned({((8'hba) | (8'h9f)),
                      $unsigned(wire32)}) : $unsigned(wire37)));
            end
          else
            begin
              reg46 <= reg44[(2'h3):(2'h2)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg48 <= (($unsigned(reg44[(3'h5):(2'h2)]) ?
              ((!reg45) ? wire35[(1'h1):(1'h0)] : (|(^wire33))) : reg40) ?
          (reg46 ?
              reg42 : (({(8'h9e), reg38} ? wire36 : reg43[(3'h7):(1'h0)]) ?
                  $signed($unsigned(wire34)) : reg41[(4'ha):(4'h8)])) : wire37);
    end
  assign wire49 = {(8'ha2), reg48[(2'h2):(1'h1)]};
  module50 #() modinst67 (.clk(clk), .wire53(reg42), .wire52(reg41), .wire51(wire37), .wire54(reg40), .y(wire66));
  assign wire68 = wire66;
  assign wire69 = (~&$signed(reg42));
  assign wire70 = (8'hb4);
  assign wire71 = (((8'hb1) ?
                          ((8'h9e) ?
                              ({reg46} ?
                                  (8'hbd) : reg46[(3'h4):(3'h4)]) : {$unsigned(reg44),
                                  reg41[(4'he):(4'h8)]}) : (^~{$unsigned((8'ha7))})) ?
                      wire34[(1'h0):(1'h0)] : ((~|$unsigned($unsigned((8'ha7)))) < (wire37[(2'h3):(2'h2)] & $signed((~^(8'ha5))))));
endmodule

module module50
#(parameter param64 = (((({(8'hb6), (8'hba)} ? {(8'h9d), (8'hb7)} : (&(8'ha6))) ? ((~&(7'h42)) ? (8'hbc) : ((8'h9c) < (8'haa))) : ({(8'haa)} ? ((8'ha1) > (8'ha2)) : ((8'hbe) ? (8'ha4) : (8'hbc)))) == (({(7'h44), (8'hb2)} >> (~&(8'hb5))) ? (^(!(8'ha1))) : (+(-(8'ha5))))) < ((+(((8'h9f) - (8'ha3)) ~^ {(8'hb0), (8'had)})) ? ({{(8'hbc), (7'h43)}, ((8'ha7) ? (8'ha9) : (8'ha3))} | (|((8'hbb) ? (8'ha1) : (8'hb3)))) : {(+((7'h41) ? (8'hba) : (8'hab)))})), 
parameter param65 = ((-param64) != (~((8'hbf) ? ((param64 ? param64 : param64) ? (^~param64) : param64) : (~(param64 >= param64))))))
(y, clk, wire54, wire53, wire52, wire51);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire54;
  input wire signed [(5'h15):(1'h0)] wire53;
  input wire [(4'hb):(1'h0)] wire52;
  input wire signed [(5'h13):(1'h0)] wire51;
  wire signed [(5'h14):(1'h0)] wire63;
  wire signed [(3'h5):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire61;
  wire signed [(4'hf):(1'h0)] wire60;
  wire signed [(2'h2):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire55;
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire56,
                 wire55,
                 reg57,
                 (1'h0)};
  assign wire55 = ($unsigned(wire51[(4'ha):(4'h8)]) || (!wire53));
  assign wire56 = ((8'ha0) <<< $signed((|(|$signed(wire51)))));
  always
    @(posedge clk) begin
      reg57 <= (&$unsigned($signed(wire53)));
    end
  assign wire58 = $signed($unsigned($unsigned((8'hbb))));
  assign wire59 = $signed({(!(8'hb7)), ((^~(wire56 == wire58)) != wire52)});
  assign wire60 = wire55;
  assign wire61 = (8'ha9);
  assign wire62 = ($unsigned((8'ha6)) >>> wire58[(1'h1):(1'h1)]);
  assign wire63 = reg57;
endmodule
