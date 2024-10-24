module top
#(parameter param149 = (^~{(((!(8'hbb)) && (!(7'h40))) ? (~&((8'haf) != (8'hb6))) : (&(~|(8'haa))))}), 
parameter param150 = {(+param149), (param149 ? (&(^~{param149})) : param149)})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire148;
  wire [(4'hd):(1'h0)] wire137;
  wire [(4'h8):(1'h0)] wire136;
  wire [(2'h3):(1'h0)] wire135;
  wire signed [(2'h3):(1'h0)] wire134;
  wire signed [(2'h2):(1'h0)] wire132;
  wire [(4'he):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg147 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg146 = (1'h0);
  reg [(4'hb):(1'h0)] reg145 = (1'h0);
  reg [(2'h2):(1'h0)] reg144 = (1'h0);
  reg [(5'h11):(1'h0)] reg143 = (1'h0);
  reg [(5'h12):(1'h0)] reg142 = (1'h0);
  reg [(4'hd):(1'h0)] reg141 = (1'h0);
  reg [(2'h3):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg139 = (1'h0);
  reg [(3'h4):(1'h0)] reg138 = (1'h0);
  assign y = {wire148,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire132,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = {{((wire3 || wire2) ?
                             wire2[(4'hb):(4'h9)] : ({wire0} ?
                                 wire0 : $signed(wire1)))},
                     wire3};
  assign wire5 = (wire1[(2'h2):(2'h2)] < (wire4 - (wire4 && wire1[(3'h5):(2'h2)])));
  module6 #() modinst133 (.wire8(wire1), .y(wire132), .wire10(wire3), .wire7(wire5), .clk(clk), .wire9(wire0));
  assign wire134 = (wire132 ?
                       (-$signed((-wire4))) : (wire2 - (|$unsigned($unsigned(wire5)))));
  assign wire135 = wire2[(4'hb):(3'h5)];
  assign wire136 = $signed((wire134[(1'h1):(1'h0)] > $unsigned(wire0)));
  assign wire137 = {(wire2[(3'h6):(1'h0)] > wire2)};
  always
    @(posedge clk) begin
      reg138 <= $signed(wire5);
      reg139 <= wire135;
    end
  always
    @(posedge clk) begin
      if (reg139)
        begin
          reg140 <= wire3;
          reg141 <= (~|wire132);
        end
      else
        begin
          if (((wire137[(4'ha):(2'h2)] << (wire134[(1'h1):(1'h1)] & $signed((wire1 ?
                  wire2 : wire2)))) ?
              (reg140 << ($signed((~^reg141)) && (wire136 ?
                  reg139[(2'h2):(2'h2)] : $unsigned(reg139)))) : wire132[(2'h2):(1'h0)]))
            begin
              reg140 <= $unsigned((8'hb2));
              reg141 <= (-wire134[(2'h3):(2'h3)]);
              reg142 <= $unsigned({wire135, wire134});
              reg143 <= reg141[(3'h5):(3'h4)];
              reg144 <= $unsigned($unsigned({wire137,
                  $signed(wire132[(1'h0):(1'h0)])}));
            end
          else
            begin
              reg140 <= (~^reg143);
              reg141 <= (8'hb8);
              reg142 <= $unsigned((~^wire136));
            end
          reg145 <= $signed($unsigned(wire1));
          reg146 <= reg139;
        end
      reg147 <= ({(~($unsigned(reg143) >= (wire136 + wire4))),
          $unsigned((reg142[(3'h7):(1'h0)] && wire136))} || $unsigned($unsigned($signed(((8'hb8) ?
          reg144 : wire1)))));
    end
  assign wire148 = (^$unsigned(($signed($unsigned(wire137)) == $unsigned($unsigned(wire2)))));
endmodule

module module6
#(parameter param130 = (^~(({(8'hac), (|(8'hbb))} & (!{(8'ha6), (8'ha6)})) ? (^~(((8'ha7) ^ (8'ha1)) ? (!(7'h43)) : ((8'hb0) - (8'hb1)))) : {(&(&(8'hab)))})), 
parameter param131 = param130)
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire129;
  wire signed [(3'h4):(1'h0)] wire128;
  wire signed [(4'hd):(1'h0)] wire127;
  wire signed [(4'hc):(1'h0)] wire126;
  wire [(5'h10):(1'h0)] wire125;
  wire signed [(4'ha):(1'h0)] wire124;
  wire [(5'h10):(1'h0)] wire123;
  wire signed [(2'h3):(1'h0)] wire122;
  wire [(2'h3):(1'h0)] wire121;
  wire signed [(5'h14):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire47;
  wire signed [(3'h5):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire74;
  wire signed [(5'h15):(1'h0)] wire119;
  assign y = {wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire72,
                 wire47,
                 wire46,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire44,
                 wire74,
                 wire119,
                 (1'h0)};
  assign wire11 = (~^wire8[(4'he):(3'h4)]);
  assign wire12 = $unsigned((({wire10, {wire8, wire9}} ?
                          (&wire10) : (wire10[(2'h3):(2'h2)] >>> $unsigned(wire8))) ?
                      ((((8'hae) ^~ wire7) ?
                              (wire9 ? (8'ha4) : (8'haa)) : (~^wire7)) ?
                          $signed({wire7}) : $signed(((8'haa) ?
                              wire7 : (8'h9e)))) : (~$signed($unsigned(wire11)))));
  assign wire13 = {(-$unsigned(($unsigned(wire11) | $signed((8'hab)))))};
  assign wire14 = (&$signed(wire12[(2'h3):(1'h0)]));
  assign wire15 = (8'hae);
  assign wire16 = ($unsigned(($unsigned((wire10 && (8'ha5))) * $signed((~wire10)))) - (((^wire12) >> wire13[(4'h8):(3'h4)]) >>> $unsigned((-(wire14 <= wire7)))));
  module17 #() modinst45 (wire44, clk, wire16, wire15, wire11, wire13, wire14);
  assign wire46 = wire44;
  assign wire47 = wire15[(4'h9):(2'h3)];
  module48 #() modinst73 (wire72, clk, wire47, wire44, wire16, wire15, wire9);
  assign wire74 = (($unsigned(wire10[(2'h3):(1'h1)]) ?
                      wire9[(4'hf):(1'h1)] : ((~^{wire10}) ?
                          ($unsigned(wire9) ?
                              (!wire44) : (-wire11)) : wire14)) >>> {$signed(((wire10 && wire16) && (wire47 | wire12))),
                      (-$signed((wire10 ? (8'ha9) : wire15)))});
  module75 #() modinst120 (wire119, clk, wire12, wire14, wire44, wire7, wire72);
  assign wire121 = ((-(-(8'hb4))) ?
                       $signed((((wire15 ?
                               wire46 : wire119) && (wire11 * wire119)) ?
                           (8'ha1) : wire44[(5'h10):(2'h2)])) : (wire8 ?
                           $unsigned(({wire10,
                               wire11} == (&wire16))) : wire13));
  assign wire122 = ((^~wire44[(2'h3):(1'h1)]) ?
                       ($signed(((-wire7) ?
                           wire11[(1'h1):(1'h0)] : $unsigned(wire121))) | $signed({(wire8 ?
                               wire46 : wire7)})) : wire12);
  assign wire123 = $signed($signed(wire16));
  assign wire124 = $unsigned((&wire13));
  assign wire125 = (($unsigned($signed((wire13 <<< wire16))) << $unsigned(wire11)) ?
                       $signed((~wire122[(1'h0):(1'h0)])) : {wire122[(2'h2):(1'h1)],
                           (^~(^~wire46[(3'h4):(2'h2)]))});
  assign wire126 = {{wire46[(3'h5):(2'h2)],
                           $signed(((wire47 ?
                               wire123 : wire16) <= (wire74 | (8'h9d))))}};
  assign wire127 = (&(+{$unsigned((|wire124)), wire123[(5'h10):(4'hc)]}));
  assign wire128 = (wire126 - $unsigned($unsigned($unsigned((8'hbd)))));
  assign wire129 = $signed($unsigned((($unsigned(wire9) || (~|wire121)) ?
                       (wire128[(3'h4):(2'h3)] + wire119[(3'h6):(1'h1)]) : wire13)));
endmodule

module module75
#(parameter param117 = ((((((8'hbb) ? (8'hbe) : (8'ha6)) ? (~|(8'hb2)) : {(8'ha9), (7'h40)}) == (~^((8'hb2) ? (8'h9e) : (8'haf)))) ? ({((8'hba) ? (8'ha7) : (8'ha3)), (|(8'haf))} >= (^(^(8'hb5)))) : (8'hb7)) < (((((8'hbd) - (8'hb1)) | ((7'h43) ^~ (8'had))) ? (~^(+(8'ha5))) : ({(8'h9e), (8'h9e)} & ((8'hbe) ~^ (8'ha2)))) > ((~((8'ha9) >> (8'ha9))) ? (((7'h42) >= (8'hb7)) >>> (~^(8'ha2))) : ({(8'hb4), (8'hb5)} ? (+(8'haf)) : ((7'h40) - (8'hb2)))))), 
parameter param118 = ((!(~|({(8'ha0), param117} > ((8'ha9) << param117)))) ? ((((~&(8'hab)) || (|param117)) * param117) ? (|param117) : {(-param117), param117}) : ({(param117 >>> (8'hbf)), (^~(param117 ? param117 : param117))} ? (((param117 ? (8'h9f) : param117) ? (^param117) : (param117 ? param117 : (8'hb7))) ? {param117} : (~&{(8'hab)})) : {({(8'had), (8'ha8)} ? (&param117) : param117), (^~(7'h44))})))
(y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire80;
  input wire [(4'hf):(1'h0)] wire79;
  input wire [(5'h11):(1'h0)] wire78;
  input wire [(4'hc):(1'h0)] wire77;
  input wire signed [(3'h7):(1'h0)] wire76;
  wire signed [(3'h6):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire110;
  wire signed [(4'ha):(1'h0)] wire99;
  wire [(5'h12):(1'h0)] wire98;
  wire [(4'hd):(1'h0)] wire96;
  wire signed [(2'h2):(1'h0)] wire95;
  wire [(4'hb):(1'h0)] wire94;
  reg [(4'ha):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg115 = (1'h0);
  reg [(4'hf):(1'h0)] reg114 = (1'h0);
  reg [(4'h8):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg112 = (1'h0);
  reg signed [(4'he):(1'h0)] reg109 = (1'h0);
  reg [(4'h9):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(4'ha):(1'h0)] reg104 = (1'h0);
  reg [(2'h2):(1'h0)] reg103 = (1'h0);
  reg [(4'h9):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(4'ha):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(4'ha):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg82 = (1'h0);
  reg [(3'h6):(1'h0)] reg81 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire99,
                 wire98,
                 wire96,
                 wire95,
                 wire94,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
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
                 reg97,
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
  always
    @(posedge clk) begin
      reg81 <= ($unsigned(wire77[(3'h4):(2'h2)]) != $unsigned(wire80));
      if (wire76)
        begin
          reg82 <= $signed(({(~^reg81[(1'h0):(1'h0)])} != wire78));
          reg83 <= $signed((-reg81));
          reg84 <= $unsigned({((^~wire77[(3'h6):(2'h3)]) ?
                  (~|(~|wire80)) : $signed((8'hac))),
              (reg81[(3'h5):(3'h5)] < reg81[(3'h4):(3'h4)])});
          reg85 <= (8'hb3);
          reg86 <= (reg82[(1'h0):(1'h0)] >>> (reg83[(5'h10):(1'h1)] >>> reg84));
        end
      else
        begin
          if (({$signed((^~$unsigned(wire80))), wire80[(4'he):(4'h9)]} ?
              ((($unsigned(reg83) ^~ {wire80, reg81}) || ((reg85 ?
                          wire76 : (8'hbd)) ?
                      $unsigned(reg82) : {wire79, wire79})) ?
                  {reg83[(5'h12):(1'h1)]} : $unsigned(($signed(wire76) <<< (wire79 & reg84)))) : ({reg82,
                  $signed((wire77 - reg85))} >>> reg84[(2'h2):(1'h0)])))
            begin
              reg82 <= (($unsigned({$unsigned(reg81)}) >= {$unsigned(reg84[(3'h7):(1'h0)]),
                      $signed((reg81 ? (8'hb5) : wire79))}) ?
                  (8'h9e) : reg85[(2'h3):(2'h3)]);
              reg83 <= (^~reg82);
              reg84 <= $signed((~reg82));
              reg85 <= $unsigned(reg82[(1'h0):(1'h0)]);
            end
          else
            begin
              reg82 <= $unsigned({$signed((wire79[(3'h6):(2'h2)] && $unsigned(wire79))),
                  $signed((wire77[(3'h4):(2'h2)] ? (8'hb6) : reg81))});
              reg83 <= $signed(((($unsigned((8'hb8)) == $signed(reg83)) ?
                  $signed($unsigned(reg82)) : ($unsigned(reg82) * reg82)) << ($signed($unsigned(reg85)) ?
                  {(8'h9f)} : (&(wire77 ? wire77 : (8'hb8))))));
            end
          if ($unsigned({$unsigned(wire80[(4'hd):(4'ha)])}))
            begin
              reg86 <= (-$unsigned({reg81, $signed($unsigned((7'h40)))}));
              reg87 <= $signed((~&(($signed(wire78) ?
                      $unsigned(reg86) : reg81) ?
                  $signed($signed((8'hae))) : wire78[(2'h3):(1'h1)])));
              reg88 <= $signed($signed((({reg82} ?
                  $signed((8'hbd)) : {reg86}) != {(reg84 == reg85), reg82})));
              reg89 <= wire76;
            end
          else
            begin
              reg86 <= wire79[(4'h8):(4'h8)];
              reg87 <= wire76;
              reg88 <= (^((($unsigned(reg88) & $signed(reg84)) >> $signed(wire79)) >= wire80));
              reg89 <= $signed((~&(~&((~|wire79) && $signed(reg89)))));
              reg90 <= ({(reg81 == (((8'hb1) ?
                          wire78 : reg81) < ((8'hbf) * reg81))),
                      reg87[(3'h7):(3'h5)]} ?
                  reg89[(1'h1):(1'h1)] : {($unsigned(reg88[(4'h8):(3'h7)]) || ($signed(wire76) ?
                          $signed(wire80) : reg89[(2'h3):(2'h3)])),
                      (({reg84, reg86} && reg81[(3'h5):(1'h0)]) ?
                          (|{reg89}) : wire78[(5'h10):(1'h0)])});
            end
        end
      reg91 <= $unsigned((reg89 ?
          ((+(8'hbe)) ^~ reg82) : $signed(((reg87 > (8'hb5)) ?
              $signed(wire78) : reg82))));
      reg92 <= $signed(reg91);
      reg93 <= (reg91 == reg91);
    end
  assign wire94 = (|((reg90 ?
                          (reg85 ?
                              (8'ha8) : {reg85,
                                  reg81}) : (wire79[(1'h0):(1'h0)] ?
                              $unsigned(wire76) : (~wire78))) ?
                      (((~&reg92) ? reg83[(4'h9):(4'h8)] : $signed(reg89)) ?
                          $signed((reg85 ?
                              reg91 : reg81)) : $unsigned(reg82[(1'h0):(1'h0)])) : $signed((~wire80))));
  assign wire95 = reg86[(4'ha):(3'h7)];
  assign wire96 = {$unsigned($unsigned((+(wire94 && wire80)))),
                      ($unsigned({(8'hbf)}) <<< (-reg82[(1'h0):(1'h0)]))};
  always
    @(posedge clk) begin
      reg97 <= $signed($unsigned(wire94));
    end
  assign wire98 = $unsigned(($signed(wire78) ?
                      reg90 : (reg85 >> {(wire96 ? wire78 : reg93),
                          (&wire95)})));
  assign wire99 = (reg85[(4'h8):(1'h0)] ~^ (~{((reg91 < reg89) << (|wire80))}));
  always
    @(posedge clk) begin
      reg100 <= reg90;
      if ((reg97 | $signed($signed((~^(reg92 ? reg81 : (8'hb6)))))))
        begin
          reg101 <= (((8'h9c) ?
              reg82[(1'h0):(1'h0)] : wire99) & wire76[(3'h6):(3'h4)]);
        end
      else
        begin
          reg101 <= {(8'ha3)};
          reg102 <= wire95;
          if ((~^$unsigned(wire76)))
            begin
              reg103 <= $signed(reg88[(3'h6):(3'h6)]);
              reg104 <= $signed((reg88 + $unsigned((8'hb2))));
              reg105 <= wire78;
              reg106 <= (8'hbf);
              reg107 <= $signed($signed($signed(({(8'haa),
                  reg104} ^ reg81[(2'h3):(2'h3)]))));
            end
          else
            begin
              reg103 <= ($unsigned(({((8'h9e) >>> reg102), $unsigned(reg97)} ?
                  {{reg92, reg88}} : wire80)) ^ (((((7'h44) ? reg89 : reg100) ?
                  (wire95 - reg88) : $signed(reg89)) == ((-reg102) ?
                  $unsigned(reg85) : (8'hb1))) || $signed({(-wire77)})));
              reg104 <= $signed(((7'h40) ?
                  $signed($unsigned(reg92)) : ((-reg97[(1'h0):(1'h0)]) ~^ $signed($unsigned(reg84)))));
              reg105 <= reg86[(3'h7):(1'h1)];
            end
        end
      reg108 <= ((-(reg83 >= (reg86 ? (!(8'hbc)) : reg105))) ?
          {{(reg83[(4'hd):(4'ha)] ? (reg89 <<< reg88) : (~&reg91)),
                  $signed(reg101[(1'h0):(1'h0)])},
              reg92} : reg82);
      reg109 <= ($unsigned($signed(reg83)) ~^ reg91);
    end
  assign wire110 = $unsigned($signed($unsigned((+$unsigned((8'hb7))))));
  assign wire111 = ({wire110} >> wire96[(4'ha):(4'h8)]);
  always
    @(posedge clk) begin
      reg112 <= (wire98 <= $unsigned(wire95));
      reg113 <= wire98;
      reg114 <= wire94[(4'ha):(1'h0)];
      reg115 <= reg92;
      reg116 <= $unsigned($unsigned(($unsigned(wire95) + $signed((wire78 ?
          wire98 : wire94)))));
    end
endmodule

module module48  (y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h111):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire53;
  input wire signed [(5'h13):(1'h0)] wire52;
  input wire signed [(4'he):(1'h0)] wire51;
  input wire [(3'h4):(1'h0)] wire50;
  input wire signed [(3'h7):(1'h0)] wire49;
  wire [(4'h8):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire70;
  wire signed [(4'ha):(1'h0)] wire69;
  wire signed [(5'h10):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire67;
  wire [(4'h9):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire62;
  wire [(3'h5):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire60;
  wire signed [(5'h10):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire58;
  wire [(5'h11):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire55;
  wire signed [(4'he):(1'h0)] wire54;
  assign y = {wire71,
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
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 (1'h0)};
  assign wire54 = ($signed(wire52) ?
                      ((($signed(wire53) ?
                              {(8'ha1)} : wire51) < $unsigned((wire53 ?
                              wire50 : wire52))) ?
                          $unsigned(wire49) : wire52) : wire51[(3'h7):(3'h4)]);
  assign wire55 = (8'hb6);
  assign wire56 = (((((^~wire54) ?
                      $signed(wire53) : (wire53 <= wire54)) >> wire54[(4'hb):(3'h7)]) ^ (^wire54[(4'hc):(3'h6)])) >> wire51[(3'h4):(1'h1)]);
  assign wire57 = $unsigned((~$unsigned($unsigned(wire53))));
  assign wire58 = (8'hb5);
  assign wire59 = $signed({$signed($unsigned({wire56, wire58}))});
  assign wire60 = (((!$signed({wire59, wire57})) | wire49[(3'h7):(3'h6)]) ?
                      (^~(~$signed(wire57[(4'ha):(3'h4)]))) : ($unsigned((wire50 + $signed((8'hb3)))) ?
                          $signed((wire58[(4'hf):(3'h7)] ^ $signed(wire58))) : (~^$unsigned((^~wire56)))));
  assign wire61 = wire60;
  assign wire62 = wire58[(2'h2):(2'h2)];
  assign wire63 = wire55[(3'h6):(3'h5)];
  assign wire64 = ((wire60[(4'ha):(4'ha)] ^~ wire57[(4'hd):(2'h2)]) ?
                      ($unsigned((8'hae)) + {(((8'ha7) && wire53) ^~ $unsigned(wire62))}) : {wire54[(4'hd):(1'h0)]});
  assign wire65 = ({((+(wire58 ^ wire51)) ~^ $signed(wire60[(3'h4):(1'h1)])),
                      $unsigned($unsigned(wire59))} != ((((8'hbf) - $signed(wire52)) ?
                      $signed((8'hbf)) : $unsigned(((8'hb4) >>> wire58))) <<< ($unsigned(wire61) ?
                      ({wire51} << {wire49, wire60}) : ((~(8'hac)) ?
                          (~^wire51) : (wire62 ? wire52 : wire54)))));
  assign wire66 = $signed($signed((wire49 == (wire51 ?
                      (wire52 > wire56) : (wire50 < wire50)))));
  assign wire67 = $signed($signed(((wire51 ?
                      wire53 : $unsigned(wire66)) << $signed({wire53,
                      (8'haf)}))));
  assign wire68 = ((wire62[(3'h4):(3'h4)] ?
                      {(~^wire55[(5'h11):(4'hb)])} : $unsigned(wire62)) <= wire66);
  assign wire69 = ((7'h41) ?
                      (($unsigned(((8'had) ? wire54 : wire52)) ?
                              {wire63} : wire61) ?
                          $signed(((wire58 ?
                              wire54 : wire53) >= (wire61 ^ wire68))) : $unsigned(((~^wire66) ?
                              (!wire65) : (!wire64)))) : {$unsigned((~(wire62 ?
                              wire66 : wire62)))});
  assign wire70 = wire69;
  assign wire71 = wire56[(4'h9):(3'h7)];
endmodule

module module17  (y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire22;
  input wire [(4'hc):(1'h0)] wire21;
  input wire signed [(3'h5):(1'h0)] wire20;
  input wire signed [(2'h2):(1'h0)] wire19;
  input wire signed [(4'h8):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire30;
  wire signed [(4'he):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire28;
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire38,
                 wire37,
                 wire30,
                 wire29,
                 wire28,
                 reg41,
                 reg40,
                 reg39,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg23 <= wire19[(2'h2):(2'h2)];
      reg24 <= reg23;
      reg25 <= $signed((($unsigned({reg24, (8'hbf)}) && wire18[(3'h7):(1'h1)]) ?
          wire19 : $unsigned(wire18)));
      reg26 <= (((-(&{reg24, wire21})) + $signed(((wire20 - (8'ha1)) ?
              wire19[(1'h0):(1'h0)] : $unsigned(wire20)))) ?
          $signed((+$unsigned((|wire18)))) : {reg23,
              (((reg25 < (8'ha0)) ? reg25 : wire19[(1'h1):(1'h0)]) ?
                  reg23[(1'h1):(1'h0)] : reg25[(5'h11):(2'h3)])});
      reg27 <= reg24;
    end
  assign wire28 = (($unsigned((wire21[(3'h5):(3'h5)] ?
                      (wire21 <<< reg23) : (^reg25))) * (reg27[(2'h2):(1'h1)] != ({wire18,
                      (7'h42)} | wire20[(3'h4):(1'h0)]))) || $unsigned((-reg26)));
  assign wire29 = $unsigned(($unsigned({wire20, reg25[(3'h6):(3'h5)]}) ?
                      $unsigned($unsigned(wire28[(4'h8):(2'h2)])) : $unsigned(((wire22 ?
                          wire20 : wire19) || $unsigned(wire19)))));
  assign wire30 = (({reg27[(1'h0):(1'h0)]} ?
                      $unsigned($unsigned(reg27[(3'h4):(2'h2)])) : ((reg24[(4'hd):(4'hc)] ?
                              {wire19, reg24} : (-reg27)) ?
                          wire21 : (!((8'haa) && reg24)))) > (reg23[(3'h6):(2'h2)] != (^$signed(wire19[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      if ({wire28})
        begin
          reg31 <= {($signed(({reg26} ?
                  wire28[(4'h9):(2'h2)] : ((8'hbd) ?
                      wire22 : wire22))) ^ ({(8'ha8)} ?
                  {$signed(wire18)} : ((wire21 & wire18) ?
                      $unsigned(wire22) : $unsigned(wire30)))),
              ($signed(($unsigned(wire28) ?
                  ((8'hba) ?
                      wire22 : reg24) : (&reg25))) * (((wire18 <= reg26) | $unsigned((8'haa))) == (reg24[(3'h5):(2'h3)] ?
                  {wire21} : (7'h44))))};
          reg32 <= (reg24 ?
              (wire18 ?
                  $signed(wire19) : (~$signed((reg24 ?
                      wire30 : (8'haf))))) : ($signed($unsigned(((8'hbb) | (8'h9d)))) && $unsigned($unsigned((reg26 ?
                  (8'hbd) : reg24)))));
          reg33 <= {(|$signed(wire19)), $signed((reg27 == reg25))};
        end
      else
        begin
          reg31 <= ($unsigned($unsigned(((+reg25) <= (wire18 | (8'hb6))))) ?
              $signed(((8'hae) ?
                  $signed((reg33 ?
                      reg25 : wire30)) : reg26)) : ((reg26 <<< $unsigned($unsigned((8'ha2)))) > wire21[(2'h2):(1'h0)]));
        end
      reg34 <= {wire18[(2'h2):(2'h2)]};
      reg35 <= $unsigned(($unsigned(((wire22 + reg33) ?
          (wire29 || wire28) : wire22)) != {reg33[(3'h7):(2'h2)]}));
      reg36 <= $signed(reg24[(1'h1):(1'h0)]);
    end
  assign wire37 = wire22[(3'h7):(3'h6)];
  assign wire38 = wire29[(3'h5):(3'h4)];
  always
    @(posedge clk) begin
      reg39 <= reg32[(1'h0):(1'h0)];
      reg40 <= $signed(reg36[(3'h4):(1'h0)]);
      reg41 <= (^~{(+(~|(~&(8'ha3))))});
    end
  assign wire42 = ((reg31[(5'h10):(4'hb)] ?
                          ((+$unsigned((8'hbb))) ?
                              $unsigned(reg23) : wire28) : ($unsigned((reg34 ?
                                  (8'hba) : reg24)) ?
                              (~(reg24 ? wire28 : wire18)) : ({wire29, reg27} ?
                                  (reg24 ? wire30 : reg25) : (wire38 ?
                                      reg41 : (8'hb4))))) ?
                      ($signed(((reg41 > wire21) ?
                          (reg33 ?
                              wire28 : (8'hac)) : wire18)) != wire22) : $signed(($signed(wire22) > wire29[(4'hb):(2'h2)])));
  assign wire43 = ((~^reg36[(3'h5):(2'h3)]) == $signed($signed(wire37[(1'h0):(1'h0)])));
endmodule
