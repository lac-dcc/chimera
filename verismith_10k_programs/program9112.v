module top
#(parameter param120 = (-(^(-{((8'hab) ? (8'ha4) : (8'hbb))}))), 
parameter param121 = (!(~|(((~param120) ? (|param120) : (&param120)) - ({(8'ha0)} ? (param120 ^ param120) : ((8'ha4) ? (8'hba) : param120))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h23d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire26;
  wire [(2'h2):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire81;
  wire [(4'ha):(1'h0)] wire82;
  wire [(5'h14):(1'h0)] wire83;
  wire signed [(5'h11):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire118;
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg5 = (1'h0);
  assign y = {wire78,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire9,
                 wire8,
                 wire80,
                 wire81,
                 wire82,
                 wire83,
                 wire84,
                 wire85,
                 wire118,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire0[(1'h1):(1'h1)];
      reg6 <= wire3;
      reg7 <= wire3;
    end
  assign wire8 = wire1[(4'hc):(4'hc)];
  assign wire9 = wire8[(4'hb):(3'h7)];
  always
    @(posedge clk) begin
      reg10 <= wire4;
      reg11 <= wire1[(4'h8):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg12 <= wire9;
      reg13 <= $signed($signed($unsigned(reg6[(5'h10):(4'hd)])));
    end
  assign wire14 = reg6[(4'h8):(1'h1)];
  assign wire15 = reg6;
  assign wire16 = (~|(!wire4[(2'h2):(2'h2)]));
  assign wire17 = (+(~$signed(reg7)));
  always
    @(posedge clk) begin
      reg18 <= ((7'h43) <= ({(-$signed(wire15))} ?
          (~&reg11[(1'h1):(1'h0)]) : (~($unsigned(reg7) ?
              wire9[(3'h5):(2'h3)] : $signed(reg6)))));
      reg19 <= (($unsigned((reg18 << (reg13 ? (8'ha0) : (8'hb3)))) ?
              wire17 : (~wire9[(1'h1):(1'h0)])) ?
          $signed((|$signed($signed(wire14)))) : wire9[(3'h5):(2'h2)]);
      reg20 <= {wire2};
      reg21 <= (reg20 ? reg20 : {$signed($unsigned(wire9)), wire0});
      if (reg10)
        begin
          reg22 <= wire15[(4'ha):(3'h5)];
          reg23 <= $unsigned(reg12[(3'h4):(2'h2)]);
          reg24 <= ((8'ha5) != (~$signed((8'ha3))));
        end
      else
        begin
          reg22 <= ((((((8'hb9) & reg13) >>> $unsigned(reg20)) ?
                      (!wire4[(4'hc):(3'h6)]) : reg6[(3'h5):(1'h0)]) ?
                  (~^(-(reg7 ?
                      reg11 : reg19))) : $unsigned($unsigned((|reg18)))) ?
              wire2 : {(((reg13 >> wire14) >= $unsigned(wire3)) ?
                      (reg6 != $signed(wire0)) : $unsigned($unsigned(reg11)))});
          reg23 <= ((-(!(~^(reg23 ? reg13 : reg18)))) ?
              $signed(reg18[(3'h4):(3'h4)]) : (8'ha5));
          reg24 <= (($signed({$unsigned(reg5)}) ?
              wire14 : reg22) - $signed(($signed($unsigned(wire9)) ?
              reg18 : ((reg12 ? wire14 : wire17) ?
                  ((8'ha9) >> wire17) : (7'h44)))));
        end
    end
  assign wire25 = (~|$unsigned((!(+reg20[(1'h0):(1'h0)]))));
  assign wire26 = (~^wire14);
  assign wire27 = (!wire25[(1'h1):(1'h1)]);
  assign wire28 = $signed(wire15);
  always
    @(posedge clk) begin
      reg29 <= (wire14 ? wire17 : wire0);
      reg30 <= (wire1[(1'h1):(1'h1)] + wire25[(2'h2):(1'h0)]);
      if ((-(({reg24[(2'h2):(2'h2)], $unsigned(reg6)} ?
              $unsigned($signed(reg7)) : ({wire1} ?
                  (wire28 << wire2) : (~|reg13))) ?
          (8'hb9) : $unsigned(($signed(wire8) ~^ wire9[(2'h2):(2'h2)])))))
        begin
          reg31 <= wire14;
          reg32 <= (wire14 ?
              ($unsigned(wire15[(1'h0):(1'h0)]) <= (8'haf)) : ($unsigned(($unsigned(wire27) & (reg5 ?
                      (8'hb1) : (8'ha5)))) ?
                  reg13[(2'h2):(2'h2)] : {(8'h9c), wire27}));
        end
      else
        begin
          reg31 <= (~&{(((-wire2) ? (8'hbe) : $signed(wire17)) ?
                  $signed(wire28) : (wire0[(5'h13):(4'hb)] >= (wire14 ?
                      wire1 : reg21))),
              {$unsigned((wire0 ? wire0 : wire4))}});
          if (wire8[(4'ha):(2'h3)])
            begin
              reg32 <= reg10;
            end
          else
            begin
              reg32 <= reg7;
              reg33 <= $unsigned(reg22);
              reg34 <= ((~^reg18) ?
                  reg33[(1'h0):(1'h0)] : {$signed(((wire27 ? reg10 : wire15) ?
                          (^reg5) : (~|wire4)))});
              reg35 <= ($signed(((^~(wire4 ~^ reg10)) ?
                      $unsigned(reg19) : $unsigned((!reg19)))) ?
                  (|$signed(reg7[(5'h15):(5'h15)])) : reg13[(5'h10):(4'ha)]);
              reg36 <= (~(8'ha9));
            end
          if (wire0)
            begin
              reg37 <= reg20;
              reg38 <= $unsigned({wire8[(3'h7):(3'h6)]});
            end
          else
            begin
              reg37 <= ($unsigned((wire15[(4'he):(4'hd)] ?
                      (-((8'ha4) ? wire15 : reg22)) : (8'hb4))) ?
                  {reg30, (!(^(reg33 << reg34)))} : reg31);
            end
        end
      reg39 <= wire4;
    end
  module40 #() modinst79 (.wire42(reg13), .wire44(wire0), .wire43(reg12), .y(wire78), .clk(clk), .wire41(reg32));
  assign wire80 = {(&$signed({(~^wire78)})), $unsigned(reg38)};
  assign wire81 = ($unsigned((!reg13)) >= reg23[(2'h2):(1'h0)]);
  assign wire82 = (~(reg10 ? (^reg33[(1'h1):(1'h1)]) : wire14));
  assign wire83 = wire26;
  assign wire84 = reg22;
  assign wire85 = $signed(wire28[(4'hb):(2'h3)]);
  module86 #() modinst119 (wire118, clk, reg30, reg21, reg24, wire16);
endmodule

module module86  (y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire90;
  input wire [(4'hd):(1'h0)] wire89;
  input wire signed [(5'h13):(1'h0)] wire88;
  input wire [(4'h8):(1'h0)] wire87;
  wire signed [(4'hc):(1'h0)] wire117;
  wire [(3'h4):(1'h0)] wire116;
  wire signed [(4'hb):(1'h0)] wire115;
  wire signed [(5'h14):(1'h0)] wire113;
  wire signed [(4'h9):(1'h0)] wire91;
  assign y = {wire117, wire116, wire115, wire113, wire91, (1'h0)};
  assign wire91 = (-(&($signed(wire90) || $signed(wire89[(1'h0):(1'h0)]))));
  module92 #() modinst114 (.y(wire113), .wire95(wire89), .wire93(wire87), .wire96(wire90), .wire94(wire88), .clk(clk));
  assign wire115 = {($unsigned((^~wire113)) >> wire88[(5'h12):(3'h6)]),
                       (~|(($signed(wire87) >> {wire88,
                           wire87}) >> wire87[(3'h4):(1'h0)]))};
  assign wire116 = $signed((($unsigned(wire115) != ({(8'ha6),
                       wire90} + $signed(wire113))) ^ ($unsigned(wire90) | (^(wire115 ?
                       wire87 : wire91)))));
  assign wire117 = wire90[(3'h7):(2'h2)];
endmodule

module module40  (y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire44;
  input wire [(4'hf):(1'h0)] wire43;
  input wire [(3'h4):(1'h0)] wire42;
  input wire signed [(4'hf):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire72;
  wire [(5'h13):(1'h0)] wire71;
  wire signed [(2'h3):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire69;
  wire signed [(3'h7):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire67;
  wire signed [(4'hf):(1'h0)] wire66;
  wire signed [(4'ha):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire49;
  wire signed [(2'h3):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  wire [(5'h10):(1'h0)] wire45;
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg73 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire64,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 (1'h0)};
  assign wire45 = (~$signed(wire43[(4'hb):(2'h2)]));
  assign wire46 = {wire41, (+$unsigned(($unsigned(wire41) | $signed(wire41))))};
  assign wire47 = wire42;
  assign wire48 = wire46;
  assign wire49 = ((|({(|wire45),
                      (wire45 || wire46)} < wire47)) <= $signed((~^$signed(wire42[(1'h0):(1'h0)]))));
  assign wire50 = wire49[(3'h4):(2'h2)];
  module51 #() modinst65 (.clk(clk), .wire54(wire45), .wire55(wire44), .wire53(wire47), .y(wire64), .wire52(wire46));
  assign wire66 = {(+(!(~|$unsigned(wire41))))};
  assign wire67 = (((-$unsigned(wire47)) ?
                          $unsigned(wire43[(3'h6):(2'h3)]) : wire41) ?
                      wire41[(4'hf):(4'hc)] : ($signed((~^(wire47 ?
                          wire41 : wire48))) == wire64));
  assign wire68 = wire46;
  assign wire69 = ($unsigned((((-(7'h43)) ^~ (wire46 ? wire47 : (8'hb0))) ?
                      $signed((|wire41)) : wire42)) & $unsigned($unsigned((~|(wire41 || wire50)))));
  assign wire70 = $signed($signed(wire48[(1'h0):(1'h0)]));
  assign wire71 = ($unsigned(wire45[(4'he):(3'h5)]) + (~|((|wire48[(1'h0):(1'h0)]) - ($signed((8'hb6)) ~^ $unsigned(wire43)))));
  assign wire72 = $signed(wire49[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      if ((wire50[(3'h6):(1'h0)] < $unsigned(({(wire43 ?
              wire70 : wire47)} < {wire71[(4'hd):(3'h6)]}))))
        begin
          reg73 <= ($unsigned({wire41,
              $unsigned({wire42})}) || (&$signed(($unsigned(wire70) && (~^wire41)))));
          reg74 <= wire67;
          reg75 <= reg74[(4'h9):(3'h6)];
        end
      else
        begin
          if (wire46[(4'hb):(4'ha)])
            begin
              reg73 <= $signed((8'ha8));
              reg74 <= wire72;
            end
          else
            begin
              reg73 <= (~|$unsigned($unsigned(($signed(reg75) & reg73))));
              reg74 <= wire66[(1'h0):(1'h0)];
            end
          reg75 <= $unsigned(wire49[(3'h5):(1'h1)]);
          reg76 <= wire43;
        end
      reg77 <= (-{wire43[(3'h5):(2'h2)], wire43[(1'h1):(1'h1)]});
    end
endmodule

module module51  (y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire55;
  input wire [(4'ha):(1'h0)] wire54;
  input wire [(4'h8):(1'h0)] wire53;
  input wire signed [(4'he):(1'h0)] wire52;
  wire [(5'h10):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire62;
  wire [(4'ha):(1'h0)] wire61;
  wire [(4'he):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire59;
  wire signed [(3'h4):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire56;
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 (1'h0)};
  assign wire56 = $unsigned((8'h9c));
  assign wire57 = wire54;
  assign wire58 = (($signed({$signed(wire56),
                      (wire52 ? wire56 : wire55)}) >>> (wire52 ?
                      $signed((wire56 ?
                          wire56 : wire53)) : (wire56 - wire54))) >> (&(wire54 ?
                      $signed(wire56[(1'h0):(1'h0)]) : wire57[(4'h9):(3'h4)])));
  assign wire59 = $unsigned((~^$unsigned((-(wire56 ? wire54 : wire57)))));
  assign wire60 = ($signed((~&wire58[(1'h1):(1'h1)])) <= wire58);
  assign wire61 = wire52[(3'h4):(2'h2)];
  assign wire62 = wire58[(2'h3):(1'h1)];
  assign wire63 = wire54[(3'h6):(2'h2)];
endmodule

module module92  (y, clk, wire96, wire95, wire94, wire93);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire96;
  input wire [(2'h2):(1'h0)] wire95;
  input wire signed [(5'h13):(1'h0)] wire94;
  input wire signed [(4'h8):(1'h0)] wire93;
  wire signed [(5'h12):(1'h0)] wire112;
  wire signed [(4'hb):(1'h0)] wire111;
  wire [(5'h15):(1'h0)] wire110;
  wire [(5'h13):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire108;
  wire signed [(5'h11):(1'h0)] wire98;
  wire signed [(5'h15):(1'h0)] wire97;
  reg signed [(5'h12):(1'h0)] reg107 = (1'h0);
  reg [(3'h7):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg [(3'h7):(1'h0)] reg104 = (1'h0);
  reg [(2'h2):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(4'hb):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire98,
                 wire97,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire97 = (~^(~&(&(^wire93[(3'h5):(1'h0)]))));
  assign wire98 = $signed((!wire96[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg99 <= (^~(8'ha2));
      reg100 <= ($unsigned((({wire98, wire93} > (reg99 ? wire95 : wire93)) ?
              ((reg99 ? wire94 : wire95) ?
                  reg99[(4'h8):(1'h0)] : (^~(8'hb2))) : $signed($signed(reg99)))) ?
          $signed($unsigned($unsigned(wire96))) : wire96[(2'h3):(1'h1)]);
      reg101 <= ({$unsigned(wire98[(4'hd):(3'h7)]),
          wire94} && wire93[(2'h2):(2'h2)]);
      reg102 <= $signed($unsigned((^$unsigned(reg101[(4'ha):(4'h9)]))));
      if (((-(+($unsigned(wire95) ? (wire94 ~^ reg100) : (wire96 && reg99)))) ?
          $signed(wire97) : $signed(wire93[(3'h4):(3'h4)])))
        begin
          if ((8'h9e))
            begin
              reg103 <= ($unsigned((((wire95 ^ reg102) == wire95[(1'h0):(1'h0)]) ?
                      (8'haf) : wire95)) ?
                  (((wire98 ? (reg102 > reg99) : wire95) ?
                      ((|reg101) >>> {wire95,
                          (8'hac)}) : wire95) == reg101) : (wire95[(1'h1):(1'h1)] ?
                      ((8'ha8) ? reg100 : wire93[(3'h5):(3'h5)]) : (^~reg99)));
            end
          else
            begin
              reg103 <= reg101[(1'h1):(1'h1)];
              reg104 <= $signed(($signed(((reg102 << wire93) ?
                  reg100[(4'h9):(4'h8)] : wire95[(1'h1):(1'h1)])) >>> wire97));
              reg105 <= ((~wire95[(2'h2):(2'h2)]) ?
                  ((^{(8'hb1)}) ^~ ((+((8'hba) ? reg103 : (8'ha9))) ?
                      $unsigned({reg102,
                          wire96}) : $unsigned($unsigned(reg101)))) : reg101[(2'h2):(1'h1)]);
              reg106 <= ({(wire97[(5'h11):(4'h9)] > (~&$unsigned((8'hba)))),
                  wire95} <<< (-((^~wire95) && (~|$signed(reg102)))));
            end
          reg107 <= (($unsigned((+(~^reg102))) ?
                  (^reg100) : reg99[(3'h5):(1'h0)]) ?
              $unsigned((((reg104 <<< (8'hb5)) ?
                      (reg104 ? reg100 : reg106) : $unsigned(reg104)) ?
                  (+(~|reg106)) : reg100)) : $signed((wire96 > reg102)));
        end
      else
        begin
          if ((!((~^(8'haf)) < {$unsigned({wire97, reg106}),
              (-(reg103 >= (8'hbf)))})))
            begin
              reg103 <= (8'ha5);
              reg104 <= {$unsigned((({wire94, reg105} ^~ (reg100 ?
                          reg102 : wire96)) ?
                      reg99[(1'h1):(1'h0)] : $signed(((8'hbc) ?
                          wire98 : reg100)))),
                  {(reg106 ?
                          (&wire98[(3'h4):(1'h0)]) : (^reg107[(4'ha):(4'h8)])),
                      $signed(reg101)}};
              reg105 <= wire98;
            end
          else
            begin
              reg103 <= (wire96[(1'h1):(1'h0)] ?
                  ((((wire95 + wire96) ?
                      {reg106} : reg100[(3'h4):(1'h1)]) >>> (8'hb2)) & $unsigned(reg106)) : $unsigned({($signed(reg104) ?
                          (reg107 ~^ reg105) : (~|wire94)),
                      reg102}));
              reg104 <= (($unsigned(wire96[(4'ha):(4'h8)]) ?
                  ({$signed((8'hb6)), (+wire97)} ?
                      $signed(wire95) : (wire93 ^~ wire94[(1'h1):(1'h1)])) : {reg99[(3'h6):(1'h0)]}) && (((^reg106) ?
                  (wire95 ?
                      (8'hb9) : reg107[(2'h2):(1'h1)]) : (~&reg100[(3'h6):(3'h5)])) >= $signed($unsigned(((7'h43) <<< reg101)))));
              reg105 <= (~|((($signed(wire96) + (reg102 | wire97)) ?
                      {reg103[(1'h0):(1'h0)], $signed(wire95)} : reg105) ?
                  reg104[(3'h4):(2'h3)] : ({reg104[(3'h6):(1'h1)]} ^~ (~^reg106[(3'h4):(3'h4)]))));
            end
        end
    end
  assign wire108 = ($signed((reg102[(4'h8):(3'h6)] < (!((8'hba) & wire96)))) ?
                       {$signed($unsigned($signed(reg101)))} : ($signed(reg107[(5'h11):(4'hf)]) >= $signed(reg106[(2'h3):(1'h0)])));
  assign wire109 = $unsigned($signed($unsigned(wire95[(1'h1):(1'h1)])));
  assign wire110 = $unsigned($unsigned(reg105[(1'h0):(1'h0)]));
  assign wire111 = (reg99[(4'h9):(2'h3)] < (((-{(8'haa)}) ?
                           (8'hac) : wire109[(3'h4):(2'h3)]) ?
                       $signed(({wire110} ~^ ((8'hb1) ?
                           (7'h43) : reg106))) : ((reg107 ?
                           reg105[(3'h4):(1'h1)] : wire109) >= ($signed(reg107) ?
                           {(8'hbf), wire94} : (reg103 ? (8'hba) : wire97)))));
  assign wire112 = ((8'hb0) ? reg105[(3'h6):(2'h2)] : $unsigned(reg103));
endmodule
