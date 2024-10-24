module top
#(parameter param138 = (({(((8'hb8) != (7'h44)) >= (8'h9f))} ~^ {((^~(8'had)) > ((8'ha8) ^~ (8'hba)))}) ^ (~|{(~((7'h43) ? (8'h9e) : (8'hb8)))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h17c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire137;
  wire signed [(4'hd):(1'h0)] wire136;
  wire [(3'h4):(1'h0)] wire135;
  wire signed [(2'h2):(1'h0)] wire134;
  wire [(4'h9):(1'h0)] wire132;
  wire [(5'h13):(1'h0)] wire76;
  wire [(4'hb):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire67;
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire132,
                 wire76,
                 wire75,
                 wire5,
                 wire6,
                 wire67,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = ((~&$unsigned(wire0)) <= (~^wire3[(4'h8):(4'h8)]));
  always
    @(posedge clk) begin
      reg7 <= $signed({({{wire0}, (-(8'h9f))} > wire1[(4'hd):(4'h8)]),
          $signed((~|$signed(wire4)))});
      if ((!((wire2[(3'h4):(2'h3)] ? reg7 : {$unsigned(wire0)}) ?
          reg7[(4'h9):(3'h4)] : (~&($unsigned(wire2) ?
              {wire3, reg7} : (~wire2))))))
        begin
          reg8 <= wire2[(2'h3):(2'h3)];
        end
      else
        begin
          reg8 <= (+(~((&(wire4 || wire1)) ? $unsigned(wire1) : wire2)));
        end
      if ((wire0 ^ (~|(wire6 || ({reg8} >= wire2[(3'h4):(2'h3)])))))
        begin
          reg9 <= reg7;
          if ({(8'hb1),
              (($unsigned(((8'h9e) >> wire4)) ?
                      (((8'hbe) ? wire2 : reg8) ?
                          wire6 : {(8'hb0), reg7}) : $unsigned($signed(reg9))) ?
                  $signed((^(~&wire6))) : wire2)})
            begin
              reg10 <= $unsigned((wire4[(1'h0):(1'h0)] == $unsigned((((8'haa) > wire6) ?
                  $signed(wire0) : (wire2 ? reg8 : wire3)))));
            end
          else
            begin
              reg10 <= ($unsigned(wire4[(3'h7):(3'h7)]) >> ({wire2,
                  {wire4}} - ({(reg10 >>> wire6)} ? reg7 : (8'hbe))));
            end
          reg11 <= {(reg7[(4'hd):(4'hb)] ? (^~(-wire0)) : $signed({{reg7}}))};
          reg12 <= wire2;
        end
      else
        begin
          reg9 <= ($unsigned(reg10[(2'h3):(2'h2)]) != reg7);
          reg10 <= (reg11[(4'h9):(3'h7)] ?
              ($signed((^~(reg7 ? reg7 : wire6))) <= reg8) : reg8);
          reg11 <= $unsigned((reg8 ? reg10 : $unsigned(reg8[(2'h2):(1'h0)])));
        end
      if ((($unsigned(wire0[(3'h5):(1'h0)]) ?
          $signed($unsigned(reg11)) : (7'h41)) <<< {(!$unsigned($signed(wire2)))}))
        begin
          reg13 <= (({$signed((reg9 ? wire4 : reg8)),
                  reg10[(4'h8):(3'h6)]} < (^~$signed((~^wire2)))) ?
              $unsigned((~^$signed(((8'hbf) ?
                  (8'ha3) : reg8)))) : {$unsigned(((reg12 ^~ wire5) ?
                      $unsigned((8'h9f)) : reg9[(4'h9):(3'h6)])),
                  $signed((~&(~&wire4)))});
          if ((~&$signed((!wire4[(2'h3):(2'h3)]))))
            begin
              reg14 <= $signed(($signed($unsigned($signed(reg10))) <= $signed((8'had))));
            end
          else
            begin
              reg14 <= $unsigned(reg11);
            end
        end
      else
        begin
          if ((8'hb4))
            begin
              reg13 <= (reg11[(3'h5):(1'h0)] ?
                  $signed((wire3[(3'h4):(3'h4)] * (wire1 <<< reg14[(2'h3):(2'h2)]))) : reg9);
              reg14 <= ((reg10 <<< wire2[(2'h3):(1'h0)]) ?
                  (!$signed(reg14[(3'h5):(2'h2)])) : {{$unsigned((reg7 ?
                              reg9 : reg9)),
                          wire5[(3'h4):(1'h0)]},
                      (8'ha6)});
              reg15 <= wire5;
              reg16 <= (~wire4);
              reg17 <= (reg8 + wire4);
            end
          else
            begin
              reg13 <= $signed(((~|(((8'hb9) ~^ wire1) != (reg16 ?
                  reg17 : wire5))) != $signed(reg11[(4'he):(2'h2)])));
              reg14 <= ($signed(($signed(wire0[(3'h6):(2'h3)]) | reg12)) ?
                  (~|{{{wire3}},
                      $signed($unsigned((8'ha9)))}) : $unsigned(((8'hb5) ?
                      $unsigned(((8'haa) ?
                          reg8 : reg9)) : (wire0 ^ (^~wire0)))));
              reg15 <= wire3;
              reg16 <= (reg12 ?
                  (+(^~(+((7'h40) ?
                      reg16 : reg10)))) : ((&$unsigned(reg15)) - {$unsigned(wire4),
                      wire3}));
            end
          if (($unsigned((((reg16 > reg15) ?
              $signed(reg8) : wire4[(3'h7):(1'h1)]) >> (reg10[(1'h0):(1'h0)] ?
              wire4[(3'h7):(2'h3)] : (reg8 ?
                  wire3 : reg8)))) < $unsigned(($unsigned($signed(wire3)) ?
              ((reg13 & reg12) ?
                  wire3[(3'h7):(2'h2)] : $unsigned(wire5)) : reg16[(4'h9):(3'h4)]))))
            begin
              reg18 <= {reg15[(1'h1):(1'h0)],
                  $unsigned($signed((wire1 ?
                      (wire5 ? wire5 : (8'hb4)) : (reg14 & reg13))))};
              reg19 <= (wire4[(3'h4):(3'h4)] ^~ reg10);
            end
          else
            begin
              reg18 <= reg19[(4'hc):(2'h2)];
              reg19 <= (+(~($unsigned(reg17[(2'h3):(1'h0)]) << {(^~reg19)})));
              reg20 <= (~&((^~reg17) >= $signed((8'hb8))));
            end
          if (wire5[(4'h8):(3'h7)])
            begin
              reg21 <= $unsigned(reg15[(4'hf):(4'ha)]);
              reg22 <= (($unsigned({(wire1 ? (8'hbb) : reg8)}) ?
                  reg17 : $unsigned($unsigned((wire6 ?
                      reg20 : wire2)))) >>> $unsigned(($unsigned($signed(reg16)) ?
                  $signed($signed((7'h40))) : (8'hbf))));
            end
          else
            begin
              reg21 <= {$unsigned($unsigned(((reg20 ? reg19 : wire6) ?
                      wire5 : $unsigned(reg14))))};
              reg22 <= (((($signed(reg12) ?
                          {reg11, wire6} : (reg20 ?
                              reg18 : reg15)) || wire4[(3'h4):(1'h0)]) ?
                      reg21[(4'hc):(4'ha)] : reg7[(4'h8):(2'h3)]) ?
                  reg7[(3'h7):(3'h7)] : wire0);
              reg23 <= (reg20[(3'h6):(1'h1)] ?
                  $unsigned((reg12 ?
                      $signed(reg7[(1'h0):(1'h0)]) : {$unsigned(wire3)})) : {(+reg11)});
            end
        end
    end
  module24 #() modinst68 (.wire28(wire5), .y(wire67), .clk(clk), .wire25(reg9), .wire27(reg18), .wire26(reg12));
  always
    @(posedge clk) begin
      reg69 <= wire0[(3'h5):(3'h5)];
      reg70 <= {$signed((({wire2, wire6} ?
              $signed(reg8) : $signed(reg20)) < (~^$signed((8'ha7))))),
          $signed($signed(((reg17 >>> reg7) * {wire0})))};
      reg71 <= reg7[(1'h0):(1'h0)];
      reg72 <= ((8'ha9) ?
          (($unsigned((reg10 ~^ wire2)) != (7'h43)) >>> (reg70[(4'hb):(4'h9)] >> reg9)) : reg23[(1'h1):(1'h1)]);
      if (reg9)
        begin
          if (reg13[(2'h3):(2'h3)])
            begin
              reg73 <= $signed((+$unsigned($signed({reg70}))));
            end
          else
            begin
              reg73 <= wire6[(4'h8):(1'h1)];
            end
          reg74 <= ((^$signed(((reg72 && reg14) ^ wire2[(3'h4):(2'h2)]))) <<< $signed({wire5}));
        end
      else
        begin
          reg73 <= (((~|reg10[(1'h1):(1'h1)]) ^ (reg15[(4'ha):(1'h1)] - {(|reg13),
              {reg9, reg17}})) + reg71[(4'hb):(3'h5)]);
          reg74 <= {($unsigned(reg20[(4'h8):(4'h8)]) ?
                  $unsigned($signed((wire67 ^~ reg11))) : reg20),
              (^{{{wire3, reg19}}})};
        end
    end
  assign wire75 = ({($signed((~reg9)) ?
                          ((wire1 <<< reg73) >> (reg21 <= reg71)) : ($unsigned((8'hba)) ^~ $signed(reg20))),
                      (reg69[(3'h6):(3'h4)] ~^ ((wire4 ? wire4 : (8'ha5)) ?
                          (7'h43) : {(8'ha0)}))} & wire67[(3'h4):(3'h4)]);
  assign wire76 = $signed(($signed($signed((reg17 | reg69))) ?
                      wire6 : (+(8'hba))));
  module77 #() modinst133 (.y(wire132), .wire79(reg19), .wire81(reg71), .wire78(reg18), .wire80(reg11), .clk(clk));
  assign wire134 = (^($unsigned($unsigned($signed((8'ha6)))) << reg74));
  assign wire135 = reg9[(4'ha):(3'h7)];
  assign wire136 = (~|reg13[(1'h1):(1'h0)]);
  assign wire137 = reg12[(2'h3):(2'h2)];
endmodule

module module77  (y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire81;
  input wire [(5'h12):(1'h0)] wire80;
  input wire [(3'h6):(1'h0)] wire79;
  input wire signed [(4'h9):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire129;
  wire [(2'h3):(1'h0)] wire128;
  wire [(5'h11):(1'h0)] wire126;
  wire [(4'hb):(1'h0)] wire91;
  wire [(3'h6):(1'h0)] wire90;
  wire [(3'h5):(1'h0)] wire89;
  wire signed [(5'h10):(1'h0)] wire88;
  wire signed [(4'h8):(1'h0)] wire87;
  wire [(4'ha):(1'h0)] wire86;
  wire signed [(5'h13):(1'h0)] wire83;
  wire [(4'he):(1'h0)] wire82;
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg130 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg85 = (1'h0);
  assign y = {wire129,
                 wire128,
                 wire126,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire83,
                 wire82,
                 reg131,
                 reg130,
                 reg84,
                 reg85,
                 (1'h0)};
  assign wire82 = (|wire81);
  assign wire83 = $signed($signed(wire80));
  always
    @(posedge clk) begin
      reg84 <= wire79[(1'h0):(1'h0)];
      reg85 <= (8'ha3);
    end
  assign wire86 = wire82;
  assign wire87 = ($unsigned(wire79[(2'h3):(1'h1)]) ?
                      $unsigned(reg84) : (reg84 <<< reg84));
  assign wire88 = $signed(reg85[(4'hd):(4'hb)]);
  assign wire89 = $unsigned(((^~(+$unsigned(wire88))) ?
                      $unsigned($unsigned({wire87})) : wire87));
  assign wire90 = wire82[(4'hd):(2'h3)];
  assign wire91 = (8'hbb);
  module92 #() modinst127 (wire126, clk, wire83, reg85, wire86, wire91, wire89);
  assign wire128 = (wire80[(2'h2):(1'h1)] ~^ (!wire80[(5'h12):(1'h0)]));
  assign wire129 = (wire83 ?
                       wire81[(2'h3):(1'h1)] : {(wire79 & wire126),
                           ($unsigned(wire128[(2'h3):(1'h1)]) & wire91[(4'ha):(3'h5)])});
  always
    @(posedge clk) begin
      reg130 <= $unsigned(wire88);
      reg131 <= ((wire126[(1'h1):(1'h0)] ?
              wire126[(2'h3):(1'h1)] : wire88[(4'h8):(3'h5)]) ?
          (reg130[(2'h3):(2'h2)] ?
              wire86 : $signed($unsigned($signed(wire90)))) : reg84[(3'h4):(1'h0)]);
    end
endmodule

module module24  (y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire28;
  input wire signed [(5'h14):(1'h0)] wire27;
  input wire signed [(5'h14):(1'h0)] wire26;
  input wire signed [(4'hf):(1'h0)] wire25;
  wire signed [(3'h4):(1'h0)] wire66;
  wire signed [(4'h9):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire62;
  wire [(4'hd):(1'h0)] wire61;
  wire [(4'h9):(1'h0)] wire60;
  wire [(5'h10):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire52;
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire54,
                 wire52,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 (1'h0)};
  module29 #() modinst53 (wire52, clk, wire27, wire25, wire28, wire26, (8'ha4));
  assign wire54 = ($signed($signed(wire27[(4'hf):(2'h3)])) ?
                      (8'ha9) : ($unsigned(wire25) ? (!wire27) : wire25));
  always
    @(posedge clk) begin
      reg55 <= {$unsigned($signed({(+(8'hae))})), wire52[(1'h0):(1'h0)]};
      reg56 <= (wire52[(2'h3):(2'h3)] ?
          (~(~((|(8'hb1)) ?
              $unsigned(wire28) : $unsigned((8'hb5))))) : $signed(((wire25[(4'he):(4'hd)] ?
              wire26[(5'h14):(5'h12)] : wire28) <= ((wire27 != wire27) ^~ reg55))));
      reg57 <= wire26;
      reg58 <= {$signed(wire27), reg55[(3'h5):(1'h1)]};
      reg59 <= wire28[(2'h3):(1'h0)];
    end
  assign wire60 = (~|(((~|wire28[(2'h3):(2'h3)]) ~^ ((-wire28) ?
                          (!wire54) : (reg58 | reg57))) ?
                      wire52 : $signed((~wire25[(4'hb):(4'ha)]))));
  assign wire61 = $unsigned(reg55);
  assign wire62 = $unsigned($unsigned({{$signed(wire27), reg58}}));
  assign wire63 = (7'h40);
  assign wire64 = (|(reg58[(4'h9):(4'h8)] ?
                      (reg57 ?
                          reg58[(4'hc):(1'h0)] : (8'hae)) : {(reg57[(1'h0):(1'h0)] << (reg56 ?
                              reg57 : wire27))}));
  assign wire65 = wire28;
  assign wire66 = wire64[(1'h1):(1'h0)];
endmodule

module module29
#(parameter param50 = {((&(((8'h9e) <= (8'h9f)) <<< (~(8'ha9)))) < (~^(((8'h9c) + (8'ha9)) ? (8'hb9) : {(8'h9f)}))), {(~|(((8'ha3) & (8'ha2)) != ((8'hb3) ? (8'hac) : (7'h42)))), (^((~|(8'h9c)) ? (+(8'hbd)) : (!(7'h41))))}}, 
parameter param51 = ((param50 ^ ((!(8'ha4)) != (+param50))) ~^ (~(+((param50 && param50) >>> param50)))))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire34;
  input wire signed [(4'hf):(1'h0)] wire33;
  input wire signed [(4'h8):(1'h0)] wire32;
  input wire [(5'h14):(1'h0)] wire31;
  input wire [(2'h2):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire46;
  wire [(3'h5):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  wire signed [(5'h11):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire35;
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 (1'h0)};
  assign wire35 = $unsigned({wire31,
                      ((|(wire33 >>> wire30)) ?
                          (~&$signed(wire33)) : (^$unsigned(wire33)))});
  assign wire36 = wire34[(4'hb):(4'h9)];
  assign wire37 = $unsigned(($unsigned($unsigned((+wire31))) ?
                      $unsigned(((~|(8'ha5)) ?
                          wire31 : $signed(wire33))) : (($signed(wire31) >>> wire36[(4'he):(4'h8)]) ?
                          {(~&wire31)} : $signed((~&wire30)))));
  assign wire38 = $signed(wire36[(5'h11):(5'h11)]);
  assign wire39 = wire35[(3'h7):(2'h3)];
  assign wire40 = wire31[(4'h8):(2'h2)];
  assign wire41 = (!($unsigned((~(wire35 ? wire30 : wire36))) || wire33));
  assign wire42 = wire41;
  assign wire43 = (+$signed(wire39[(2'h3):(2'h3)]));
  assign wire44 = (wire40[(4'hb):(4'h8)] ?
                      wire36 : (wire41 ?
                          ((-(^~wire32)) | {$unsigned(wire41),
                              wire35}) : wire30));
  assign wire45 = wire42;
  assign wire46 = ($unsigned(wire43) < ((+wire33[(4'hb):(3'h5)]) ?
                      {((8'ha7) || (wire34 ? (8'h9c) : wire36))} : wire38));
  assign wire47 = ({(-(wire38[(4'hc):(4'ha)] ^ (wire33 << wire45))),
                      $unsigned((~|(~^wire45)))} | (8'ha1));
  assign wire48 = $unsigned((^~wire44));
  assign wire49 = (~^(+{wire31[(2'h2):(1'h1)],
                      (wire45[(3'h5):(3'h4)] ?
                          $unsigned(wire45) : wire40[(2'h2):(1'h0)])}));
endmodule

module module92  (y, clk, wire97, wire96, wire95, wire94, wire93);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire97;
  input wire [(5'h15):(1'h0)] wire96;
  input wire [(3'h6):(1'h0)] wire95;
  input wire [(4'hb):(1'h0)] wire94;
  input wire signed [(3'h5):(1'h0)] wire93;
  wire [(5'h13):(1'h0)] wire125;
  wire signed [(4'h8):(1'h0)] wire124;
  wire [(5'h10):(1'h0)] wire123;
  wire [(4'h9):(1'h0)] wire122;
  wire signed [(5'h12):(1'h0)] wire121;
  wire [(5'h14):(1'h0)] wire119;
  wire [(4'h9):(1'h0)] wire118;
  wire [(4'hf):(1'h0)] wire117;
  wire signed [(3'h7):(1'h0)] wire104;
  wire signed [(5'h13):(1'h0)] wire103;
  wire signed [(4'h8):(1'h0)] wire102;
  wire signed [(4'hd):(1'h0)] wire101;
  wire signed [(3'h5):(1'h0)] wire100;
  wire [(5'h11):(1'h0)] wire99;
  reg signed [(4'hc):(1'h0)] reg120 = (1'h0);
  reg [(5'h11):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg115 = (1'h0);
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg113 = (1'h0);
  reg [(3'h4):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg109 = (1'h0);
  reg [(3'h4):(1'h0)] reg108 = (1'h0);
  reg [(5'h14):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(4'hf):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire119,
                 wire118,
                 wire117,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 reg120,
                 reg116,
                 reg115,
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
                 reg98,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg98 <= wire96[(2'h2):(1'h1)];
    end
  assign wire99 = wire94;
  assign wire100 = wire94[(2'h2):(1'h0)];
  assign wire101 = $unsigned({$unsigned(wire100[(1'h1):(1'h0)]),
                       ({wire95} ? $signed($signed(wire99)) : (^~(^(7'h42))))});
  assign wire102 = $signed((~|$unsigned(wire101)));
  assign wire103 = (&wire99[(4'ha):(2'h3)]);
  assign wire104 = ($signed(((+wire102) ?
                           $unsigned($unsigned(wire101)) : ({(8'ha2)} >>> $signed((8'ha5))))) ?
                       $unsigned($unsigned((^$signed(wire100)))) : wire102);
  always
    @(posedge clk) begin
      reg105 <= ({(({(8'ha2), wire93} ?
                  (&(8'hae)) : $unsigned(wire100)) >> (-(~&wire99))),
              (({wire95} > $unsigned(reg98)) != wire93[(2'h2):(1'h0)])} ?
          (-{wire100}) : (-$unsigned(($signed(wire94) >>> (wire101 ^ wire96)))));
      if (wire97)
        begin
          reg106 <= wire99;
          reg107 <= $signed(wire101);
        end
      else
        begin
          reg106 <= wire100;
        end
      if (wire104[(1'h1):(1'h1)])
        begin
          reg108 <= $unsigned(($signed({(^~wire103)}) ?
              (8'hb4) : wire104[(2'h2):(2'h2)]));
          if ((reg105[(4'h8):(1'h0)] ?
              wire96[(5'h10):(3'h4)] : ((((8'h9f) ^~ $unsigned(reg107)) ?
                  $unsigned({wire104,
                      wire101}) : $signed(wire101)) * ($signed((reg106 * wire101)) <<< wire101[(4'hd):(1'h1)]))))
            begin
              reg109 <= (reg105[(4'h8):(3'h4)] ?
                  (|({$unsigned((8'hbf)),
                      $signed(reg105)} > wire96[(4'ha):(4'h8)])) : wire100);
            end
          else
            begin
              reg109 <= $signed($unsigned((wire102 ~^ (8'had))));
              reg110 <= ($unsigned($signed($signed((reg105 > (8'hbb))))) ?
                  (8'hbd) : {(((7'h41) <= $signed((8'ha7))) ?
                          ({wire94} ?
                              wire102[(2'h2):(1'h1)] : (~^wire100)) : reg109)});
              reg111 <= ((!reg105[(2'h2):(2'h2)]) && $unsigned({((reg98 >> wire101) && $signed((8'hb7))),
                  reg107}));
              reg112 <= wire93;
              reg113 <= $unsigned((8'hb0));
            end
          reg114 <= ((|$signed((+(reg110 + reg108)))) ?
              reg107[(5'h11):(4'h8)] : $unsigned({{((8'hb0) & reg98),
                      $unsigned(reg108)}}));
          reg115 <= ((reg109 ? reg106[(2'h3):(1'h0)] : reg108[(2'h3):(2'h3)]) ?
              (~|$signed((-(~^(7'h44))))) : $unsigned($unsigned($signed($unsigned(wire96)))));
        end
      else
        begin
          reg108 <= {((~|reg114) && (!wire100[(1'h1):(1'h1)])),
              reg106[(4'h9):(3'h7)]};
          if (reg113[(3'h7):(3'h5)])
            begin
              reg109 <= ((~wire97[(1'h0):(1'h0)]) > $unsigned({$signed($signed(reg105)),
                  (|(wire101 ? (8'hba) : wire104))}));
            end
          else
            begin
              reg109 <= $unsigned((((7'h41) || reg106[(4'hb):(2'h3)]) ?
                  (!reg109[(1'h0):(1'h0)]) : ($signed($unsigned(reg109)) ?
                      wire93 : wire95)));
              reg110 <= wire94[(2'h3):(1'h0)];
            end
          reg111 <= reg109;
        end
    end
  always
    @(posedge clk) begin
      reg116 <= ($unsigned(reg112[(1'h0):(1'h0)]) ? (8'ha4) : (~&reg113));
    end
  assign wire117 = $unsigned(((-((!wire103) ? reg105 : $signed(wire97))) ?
                       $unsigned(wire99[(4'hf):(4'h8)]) : reg106));
  assign wire118 = $unsigned(wire93[(3'h5):(3'h4)]);
  assign wire119 = ($unsigned(reg107) ^~ $unsigned((wire102 ?
                       $signed($unsigned(reg116)) : (^(reg106 >> (8'ha8))))));
  always
    @(posedge clk) begin
      reg120 <= $unsigned(wire101);
    end
  assign wire121 = (^wire99);
  assign wire122 = reg111[(3'h6):(2'h3)];
  assign wire123 = (($unsigned($signed(reg110[(1'h0):(1'h0)])) <<< (((reg106 ?
                               reg110 : reg108) - reg106[(4'hf):(4'hb)]) ?
                           ({reg109} + (8'ha0)) : (&{wire101}))) ?
                       {wire103[(5'h13):(4'hf)],
                           (|(!((8'h9e) ? wire97 : reg120)))} : wire100);
  assign wire124 = $unsigned((reg105[(1'h1):(1'h0)] ?
                       wire123[(4'he):(3'h4)] : ($unsigned(wire93) ?
                           reg112 : (|((8'hbf) * reg105)))));
  assign wire125 = $signed(($signed((reg116 - $unsigned(reg108))) >> $unsigned(reg111)));
endmodule
