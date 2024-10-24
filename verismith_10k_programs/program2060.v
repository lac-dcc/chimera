module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire120;
  wire [(2'h3):(1'h0)] wire119;
  wire signed [(5'h10):(1'h0)] wire118;
  wire [(5'h11):(1'h0)] wire117;
  wire signed [(4'h9):(1'h0)] wire116;
  wire [(3'h6):(1'h0)] wire115;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire111;
  reg [(4'hd):(1'h0)] reg130 = (1'h0);
  reg [(3'h5):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg123 = (1'h0);
  reg [(5'h15):(1'h0)] reg122 = (1'h0);
  reg [(2'h2):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg113 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire5,
                 wire6,
                 wire111,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg114,
                 reg113,
                 (1'h0)};
  assign wire5 = $unsigned((-wire4[(2'h2):(1'h1)]));
  assign wire6 = (~&$unsigned(((wire1 <= {wire3, wire2}) > wire5)));
  module7 #() modinst112 (wire111, clk, wire0, wire5, wire1, wire3, wire2);
  always
    @(posedge clk) begin
      reg113 <= (wire111 ?
          (+(((~^wire2) ~^ (~^wire6)) == (~|(^wire4)))) : ((wire111[(4'he):(4'h8)] | ({(8'ha3),
              (8'ha4)} != $unsigned(wire0))) < $unsigned(($unsigned(wire3) < (~&wire5)))));
      reg114 <= wire6;
    end
  assign wire115 = ((wire3 + $unsigned(((reg113 ?
                       wire1 : (8'hae)) && (wire5 <= (8'hbe))))) > $unsigned($unsigned($signed((wire4 || reg113)))));
  assign wire116 = wire111[(2'h2):(1'h1)];
  assign wire117 = $signed((($signed(wire116) << wire5[(1'h1):(1'h1)]) ?
                       (~^$signed(((8'haf) >> wire0))) : wire3));
  assign wire118 = $unsigned(($signed($signed(wire115)) + $unsigned((wire1 ?
                       reg114 : reg113[(3'h5):(1'h0)]))));
  assign wire119 = $signed(((-($signed(wire115) & $signed(reg113))) ?
                       ((wire4[(2'h2):(1'h1)] >= (!wire5)) ?
                           ($unsigned(reg113) ?
                               {wire115} : $signed(wire118)) : reg114[(3'h4):(1'h1)]) : $signed(wire111[(5'h11):(1'h1)])));
  assign wire120 = ((^~(8'hb0)) ?
                       (^~wire117[(3'h6):(2'h2)]) : (wire115[(1'h0):(1'h0)] || $unsigned(wire1)));
  always
    @(posedge clk) begin
      if ($unsigned((((~^$signed(wire111)) ?
              ((wire116 && reg113) ?
                  ((8'hb0) ? wire117 : wire116) : {wire2, wire4}) : wire5) ?
          $unsigned((~(wire115 ?
              wire0 : wire116))) : ((wire111[(4'hd):(2'h2)] > $signed(wire3)) > $unsigned((wire1 ^~ wire118))))))
        begin
          reg121 <= (+$unsigned(wire4));
          reg122 <= ($unsigned((wire6[(1'h0):(1'h0)] > wire5)) ?
              (($unsigned((wire117 ? wire4 : (8'hbe))) > $signed((wire115 ?
                      (8'hb6) : wire1))) ?
                  $unsigned(({wire120,
                      wire117} >>> wire5[(4'hc):(3'h5)])) : $unsigned(($signed(wire6) & (reg121 < wire5)))) : $signed(wire117[(3'h7):(2'h2)]));
          reg123 <= $signed(wire3[(4'hc):(4'h9)]);
          if (reg122)
            begin
              reg124 <= reg114[(1'h1):(1'h0)];
              reg125 <= wire118[(5'h10):(1'h0)];
              reg126 <= (((+reg114[(3'h7):(1'h0)]) ?
                  ((~^{(7'h43), reg123}) >> wire3) : (~^($signed(wire3) ?
                      (~&wire4) : $unsigned(wire3)))) > $signed($unsigned($unsigned(wire6))));
              reg127 <= reg122;
              reg128 <= {$signed($unsigned(($signed(wire5) & reg113))),
                  wire118};
            end
          else
            begin
              reg124 <= (wire119[(2'h2):(1'h0)] ?
                  $unsigned((|wire4[(2'h2):(1'h1)])) : reg125[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          if (reg121)
            begin
              reg121 <= (((wire4 ?
                      (+$unsigned(wire120)) : (reg125[(1'h1):(1'h0)] ^~ $signed(reg124))) - (($unsigned(wire118) ?
                          (reg114 ? wire0 : reg121) : $unsigned(reg122)) ?
                      wire1[(4'h8):(3'h5)] : ((~&wire118) ?
                          $signed((8'hb1)) : (wire117 ? wire4 : (8'hbf))))) ?
                  $signed($unsigned((wire3[(4'hd):(3'h7)] == $signed(wire119)))) : {{$signed({reg113})}});
              reg122 <= wire118[(2'h2):(1'h0)];
              reg123 <= ({(+$unsigned((8'h9f))),
                  {(~^$unsigned(wire0))}} >>> ((~&($unsigned(reg113) <= {wire4,
                  reg122})) | $signed(((wire118 || reg125) ^~ (wire6 ?
                  wire117 : wire4)))));
              reg124 <= (^~(reg125 ?
                  (&($unsigned((7'h40)) <<< {(8'hbc),
                      reg127})) : $signed(({wire111} ?
                      $signed(wire116) : (reg114 ? reg121 : wire1)))));
            end
          else
            begin
              reg121 <= $unsigned(reg128);
            end
          reg125 <= $unsigned((+wire118[(4'h8):(1'h1)]));
        end
      reg129 <= wire0;
      reg130 <= $signed($signed(($signed((!reg114)) ?
          wire5 : ({wire119} >= wire120))));
    end
endmodule

module module7
#(parameter param109 = (({(-(!(8'hb1)))} ? ((((8'hb8) ? (8'hb6) : (7'h41)) ? ((8'haa) & (7'h44)) : ((8'ha1) && (8'h9e))) > (8'ha6)) : (((|(8'hac)) << ((8'hb5) ? (8'ha3) : (8'hbd))) ^ {((8'hbd) <<< (8'ha3))})) ? (7'h44) : ((((^~(8'hb6)) ? {(8'ha9), (8'hb9)} : ((8'hbd) | (8'hb9))) ? {((8'hbc) >> (8'hb4))} : (((8'ha6) & (8'hba)) ? ((7'h42) ? (8'ha0) : (8'hb9)) : ((8'hbe) ? (8'hb4) : (7'h43)))) ? ((^~{(8'haf)}) | (!(!(8'hae)))) : (8'hb0))), 
parameter param110 = ((8'ha6) ? (((param109 ? param109 : (param109 >> param109)) ? (-param109) : ((param109 == param109) >>> (~param109))) & ((param109 * (param109 && (8'ha3))) || param109)) : (&(((param109 ? param109 : param109) - {param109, param109}) << (~&((7'h42) ? param109 : (8'hb0)))))))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h1da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire signed [(5'h10):(1'h0)] wire11;
  input wire [(4'h9):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire108;
  wire signed [(4'hf):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire106;
  wire [(2'h3):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire73;
  wire [(4'h8):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire104;
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire71,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire73,
                 wire74,
                 wire75,
                 wire76,
                 wire104,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 (1'h0)};
  assign wire13 = $signed((($signed($unsigned(wire10)) ?
                          wire8[(5'h10):(3'h6)] : wire11) ?
                      $unsigned(wire8[(4'hb):(4'h8)]) : (($signed(wire12) ?
                          ((8'ha5) || wire8) : $signed(wire9)) ^~ $unsigned((^~wire10)))));
  assign wire14 = (-$signed(($unsigned(wire13[(3'h6):(2'h2)]) ?
                      {(wire11 && wire8),
                          $unsigned(wire10)} : ($signed(wire9) || (wire12 ?
                          (8'haa) : wire11)))));
  assign wire15 = wire13;
  assign wire16 = (8'hab);
  always
    @(posedge clk) begin
      if (((-$unsigned((^~(wire10 ? wire11 : wire14)))) ?
          $unsigned((((wire11 ? wire8 : wire12) || $unsigned((8'hac))) ?
              (wire10[(1'h0):(1'h0)] ?
                  wire10[(3'h4):(1'h1)] : wire9[(5'h11):(4'hb)]) : $unsigned($signed((8'hac))))) : (8'hb5)))
        begin
          if (wire11)
            begin
              reg17 <= $signed(((~&$unsigned($signed(wire8))) + wire15));
              reg18 <= wire11[(4'hf):(2'h3)];
            end
          else
            begin
              reg17 <= reg18[(4'hd):(1'h1)];
              reg18 <= $signed({(wire15 ?
                      wire16 : $signed($unsigned(wire11)))});
            end
          if ($signed(wire11[(3'h6):(3'h5)]))
            begin
              reg19 <= (wire14[(1'h0):(1'h0)] ?
                  (wire9[(4'ha):(4'h9)] ?
                      wire8 : wire15) : $unsigned(wire9[(3'h4):(3'h4)]));
              reg20 <= $signed((|{wire16[(1'h0):(1'h0)],
                  (~^(wire14 ? wire16 : wire12))}));
            end
          else
            begin
              reg19 <= wire14[(1'h1):(1'h1)];
              reg20 <= $unsigned($signed((((!reg17) - (+reg19)) ^ (!$unsigned(wire14)))));
              reg21 <= wire12[(4'he):(4'hd)];
              reg22 <= $signed(wire9);
              reg23 <= (($unsigned(reg22[(1'h1):(1'h0)]) | wire10[(2'h2):(1'h1)]) ?
                  $signed((((&reg19) != (8'haf)) && $signed(wire9[(4'h9):(1'h1)]))) : ((($unsigned(wire15) > {reg22}) ?
                      (reg18[(4'h8):(4'h8)] ?
                          $signed((7'h43)) : $signed(reg19)) : wire14[(2'h2):(1'h1)]) ~^ $signed($unsigned({wire14,
                      reg17}))));
            end
          reg24 <= wire11;
          if ($unsigned((reg17 ? reg20 : (8'hb6))))
            begin
              reg25 <= $signed(wire9[(3'h6):(3'h5)]);
              reg26 <= $signed(wire13);
              reg27 <= ($signed(((reg26 ? (~&reg18) : wire11) ?
                      wire8[(3'h7):(2'h3)] : $unsigned(reg22))) ?
                  $unsigned((wire16 >= (((8'hbc) ?
                      reg25 : (8'hbe)) ^~ (~wire16)))) : (8'hbd));
              reg28 <= {wire10, reg25};
            end
          else
            begin
              reg25 <= $signed((($unsigned((reg22 ? reg27 : reg24)) ?
                  (~{reg21,
                      wire14}) : $signed(wire13[(4'h9):(3'h4)])) <= ($signed($unsigned(wire13)) < wire11)));
              reg26 <= {(wire13 + reg19), wire12};
              reg27 <= ((((~^{reg27, (8'hbc)}) ?
                      (8'hb0) : $signed(reg17[(2'h3):(1'h0)])) ?
                  $signed((~^$unsigned(wire11))) : $signed(wire10)) + ({$unsigned((reg23 >>> reg22)),
                  reg26} || (wire9 ?
                  $unsigned((reg25 * reg20)) : ((&wire13) || ((8'hac) ?
                      (8'hb6) : wire13)))));
              reg28 <= ($signed((!{(wire12 != reg28)})) ?
                  $signed((({wire10} ? $unsigned((7'h42)) : $unsigned(reg23)) ?
                      {reg22[(1'h0):(1'h0)]} : $signed($unsigned(wire9)))) : $signed($signed(((!wire8) >> (7'h40)))));
            end
          reg29 <= ($signed(({reg22, $signed(reg25)} ?
                  (reg28 ?
                      {wire15,
                          (8'ha6)} : $signed(wire16)) : ({wire11} != reg18[(4'hf):(4'hf)]))) ?
              (+$unsigned(($signed(reg26) ?
                  reg27[(1'h1):(1'h1)] : (reg25 >>> reg20)))) : ($unsigned(reg21[(4'ha):(1'h0)]) ^ (~$unsigned(((8'haf) ?
                  wire9 : reg22)))));
        end
      else
        begin
          if ({((|(&reg26)) ? $signed(reg27) : reg21), wire13})
            begin
              reg17 <= $unsigned((((~&(|(8'hbc))) && (~|(reg22 ?
                  (8'hac) : reg29))) & wire12[(3'h5):(1'h0)]));
              reg18 <= $signed(reg26[(3'h7):(3'h5)]);
              reg19 <= wire16;
            end
          else
            begin
              reg17 <= $unsigned(($signed(wire12) ?
                  reg22 : (({reg24} ?
                      (~reg24) : reg26[(3'h6):(3'h6)]) == $signed({wire11}))));
              reg18 <= $unsigned($unsigned((reg29[(3'h5):(2'h2)] ~^ ($unsigned(reg26) ?
                  {reg27, (8'h9e)} : {wire10}))));
              reg19 <= ((($unsigned(reg25[(3'h4):(1'h1)]) || reg22) >= $signed($signed((+reg25)))) ^ (+$unsigned((8'hb5))));
              reg20 <= reg21;
            end
        end
      reg30 <= $unsigned($unsigned(reg22[(2'h3):(1'h0)]));
      reg31 <= (~^($signed(wire11[(3'h4):(1'h1)]) && $signed(reg30[(4'h8):(1'h0)])));
    end
  assign wire32 = (+$signed(reg26[(4'hd):(1'h1)]));
  assign wire33 = {(8'had),
                      {(~|$unsigned($signed(wire8))),
                          (wire32 >> $unsigned(reg28[(3'h5):(1'h1)]))}};
  assign wire34 = (((wire33[(3'h4):(3'h4)] * $signed(reg17)) ?
                          (({wire14} && $unsigned(reg24)) ?
                              wire14[(1'h1):(1'h0)] : $unsigned(((8'hbf) ?
                                  wire9 : reg30))) : $unsigned((wire11[(3'h5):(3'h5)] & $signed(wire12)))) ?
                      {$signed(reg20)} : $unsigned({($unsigned((8'hb2)) ?
                              reg25[(1'h1):(1'h1)] : (reg21 ?
                                  wire11 : reg17))}));
  assign wire35 = (wire8[(2'h3):(1'h1)] - $unsigned($unsigned($unsigned($signed(reg31)))));
  always
    @(posedge clk) begin
      reg36 <= (reg30 ?
          ((~^(|reg23)) || ((((7'h42) ? reg19 : reg23) ?
              (wire15 ? wire15 : wire9) : wire32) != (wire13[(3'h5):(2'h2)] ?
              wire9 : (+reg25)))) : $unsigned(reg18));
      if ($unsigned((8'hac)))
        begin
          reg37 <= $signed((wire12[(4'hd):(4'h9)] ^ (-$unsigned((8'hbe)))));
          reg38 <= $unsigned(wire16[(1'h0):(1'h0)]);
          reg39 <= $unsigned({$signed((8'hb9)), $signed(reg24)});
          reg40 <= ($signed((~^$signed((~^(7'h43))))) < (^(reg29 == {(^reg26),
              $signed(reg23)})));
        end
      else
        begin
          reg37 <= $unsigned($unsigned(reg37[(4'h8):(4'h8)]));
          if ({($signed(($signed((8'hb4)) ? $signed(reg25) : (&reg38))) ?
                  reg24 : (wire9[(4'hd):(2'h2)] && reg17[(1'h1):(1'h0)]))})
            begin
              reg38 <= $unsigned(((($signed(wire16) ?
                          reg40 : $signed((8'hbc))) ?
                      reg17[(1'h0):(1'h0)] : {reg31[(2'h2):(1'h1)]}) ?
                  $unsigned($unsigned((~^wire34))) : (~^((reg24 - reg38) ?
                      (~&reg36) : (wire33 | reg31)))));
              reg39 <= reg27[(3'h6):(2'h3)];
            end
          else
            begin
              reg38 <= {$signed(($signed((wire9 ? reg18 : (8'ha4))) ?
                      (reg24 ?
                          wire34[(5'h12):(2'h3)] : $signed((8'had))) : ($unsigned((8'ha6)) ~^ (reg19 ?
                          reg25 : wire15)))),
                  reg31};
              reg39 <= (~&$unsigned((((reg18 & reg38) && ((8'hb3) ?
                  wire15 : reg26)) | (-(~reg17)))));
              reg40 <= {((reg36 ?
                      $signed((reg17 * reg19)) : reg38[(5'h12):(4'hf)]) <= ($signed($signed(reg19)) ?
                      (reg19[(3'h5):(1'h1)] * {reg37}) : wire11))};
              reg41 <= $signed($unsigned(wire35));
            end
        end
    end
  module42 #() modinst72 (wire71, clk, wire33, wire10, wire13, reg36);
  assign wire73 = (reg30[(3'h4):(1'h0)] > ($signed(reg38) ?
                      {wire15} : reg37[(3'h4):(1'h1)]));
  assign wire74 = wire9;
  assign wire75 = $signed(($unsigned(wire15[(4'hc):(4'h9)]) >>> (((wire73 ?
                              reg27 : wire14) ?
                          (wire34 >= wire71) : reg37) ?
                      $unsigned(reg38) : $unsigned(wire12))));
  assign wire76 = reg29[(4'hd):(4'hd)];
  module77 #() modinst105 (.wire80(wire15), .wire81(reg18), .y(wire104), .wire82(wire13), .wire79(wire75), .wire78(reg24), .clk(clk));
  assign wire106 = ({(reg36 ?
                               $unsigned($signed(wire73)) : (reg40[(4'hc):(4'ha)] ?
                                   {wire32, reg36} : {reg22})),
                           (((reg31 ? (8'hb4) : reg23) >>> (wire34 ?
                               wire34 : (8'hbd))) && (~|$unsigned(wire73)))} ?
                       (reg27[(3'h6):(3'h4)] * ($unsigned((wire8 ?
                               wire16 : reg29)) ?
                           reg21[(3'h6):(2'h3)] : ($signed(wire74) > $signed(reg26)))) : $unsigned((8'hac)));
  assign wire107 = $unsigned((~(&wire11)));
  assign wire108 = $signed(($signed(((wire8 != wire74) ?
                       $unsigned(wire14) : reg22)) < wire71[(1'h0):(1'h0)]));
endmodule

module module77
#(parameter param103 = ((8'hbd) ? (!(~^(8'hbf))) : (~&(((^~(8'hb5)) ? ((8'hba) << (8'hb5)) : ((8'h9c) ? (8'hbf) : (8'ha1))) ? (^{(8'had)}) : ((8'ha5) == (8'hb9))))))
(y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire82;
  input wire signed [(3'h7):(1'h0)] wire81;
  input wire signed [(3'h4):(1'h0)] wire80;
  input wire signed [(4'h9):(1'h0)] wire79;
  input wire signed [(4'hb):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire97;
  wire signed [(5'h15):(1'h0)] wire96;
  wire signed [(5'h12):(1'h0)] wire93;
  wire signed [(2'h2):(1'h0)] wire92;
  wire [(2'h3):(1'h0)] wire91;
  wire [(4'h8):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire89;
  wire signed [(3'h4):(1'h0)] wire88;
  wire [(5'h12):(1'h0)] wire87;
  wire signed [(3'h4):(1'h0)] wire86;
  wire [(4'hd):(1'h0)] wire85;
  wire [(3'h4):(1'h0)] wire84;
  wire signed [(4'h8):(1'h0)] wire83;
  reg signed [(4'hb):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg101 = (1'h0);
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire83 = wire79;
  assign wire84 = ($unsigned({$signed(wire82[(3'h4):(1'h0)]), wire81}) ?
                      $signed((~|$signed(wire78[(4'h8):(3'h6)]))) : {wire82});
  assign wire85 = (wire84 > $signed((8'hb8)));
  assign wire86 = $signed($unsigned(wire82));
  assign wire87 = ((wire80 ?
                          wire78[(4'hb):(4'h9)] : ((wire79 ?
                                  $unsigned((8'h9e)) : wire86) ?
                              $signed({wire81, wire81}) : wire82)) ?
                      ({$signed({wire83}),
                              ($unsigned((8'hb4)) ?
                                  $unsigned(wire80) : (+(8'hbb)))} ?
                          (($signed(wire82) ?
                              wire84[(1'h1):(1'h1)] : wire82[(3'h5):(3'h5)]) * ($unsigned(wire85) != $signed(wire84))) : $signed(wire82)) : wire84);
  assign wire88 = $signed((!($signed((wire85 ~^ (7'h44))) & wire84[(1'h1):(1'h0)])));
  assign wire89 = $unsigned($signed($signed($signed({(8'hb9)}))));
  assign wire90 = $unsigned((+wire88[(1'h0):(1'h0)]));
  assign wire91 = (wire86 ?
                      ((|{(8'hbd), (^wire89)}) ?
                          $signed((wire82[(4'hd):(1'h0)] ?
                              $signed(wire79) : $signed((8'hb3)))) : wire80[(2'h2):(2'h2)]) : $unsigned($unsigned((wire79 ?
                          (wire81 ? (8'ha1) : wire81) : (wire84 ~^ wire89)))));
  assign wire92 = $unsigned(wire85[(1'h0):(1'h0)]);
  assign wire93 = (($unsigned({wire82, $signed((8'hbd))}) <<< wire80) ?
                      wire87[(2'h3):(2'h3)] : wire81);
  always
    @(posedge clk) begin
      reg94 <= $unsigned(wire89[(3'h5):(1'h0)]);
      reg95 <= {wire86,
          $unsigned(((wire79 ? $unsigned(wire91) : wire80) > (8'ha8)))};
    end
  assign wire96 = $unsigned((&({$signed(wire90), (wire88 ^ wire78)} ?
                      (^~$signed(wire80)) : (wire91[(1'h0):(1'h0)] ?
                          $unsigned(wire86) : reg94))));
  assign wire97 = $unsigned(wire85);
  assign wire98 = $signed($signed($unsigned({(wire80 != wire97)})));
  always
    @(posedge clk) begin
      reg99 <= wire80;
      reg100 <= $signed((((8'hab) ?
              wire79[(3'h4):(2'h2)] : $unsigned((wire86 || wire96))) ?
          $unsigned(($signed(reg99) <= reg95)) : wire83[(2'h3):(1'h1)]));
      reg101 <= {(!reg100[(1'h1):(1'h1)]),
          (wire90[(3'h5):(3'h4)] ? wire82[(4'hf):(4'h9)] : wire82)};
      reg102 <= (({{wire97}, wire96[(4'ha):(4'h9)]} ?
          ({(wire84 ~^ (8'hb8))} >>> wire89[(1'h0):(1'h0)]) : $signed(reg100[(1'h0):(1'h0)])) >= (8'ha8));
    end
endmodule

module module42  (y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire46;
  input wire [(4'h9):(1'h0)] wire45;
  input wire signed [(2'h3):(1'h0)] wire44;
  input wire signed [(4'h8):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire70;
  wire [(4'h8):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire68;
  wire [(4'hd):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire65;
  wire [(3'h5):(1'h0)] wire64;
  wire signed [(2'h3):(1'h0)] wire63;
  wire [(3'h5):(1'h0)] wire62;
  wire signed [(4'he):(1'h0)] wire54;
  wire [(3'h7):(1'h0)] wire53;
  wire signed [(3'h6):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire47;
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire48,
                 wire47,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg49,
                 (1'h0)};
  assign wire47 = (^~(^(!$unsigned(wire45))));
  assign wire48 = ((wire45[(2'h3):(1'h0)] == (($unsigned(wire45) || wire43) + {{wire47}})) ?
                      wire45 : {wire44, (~&$signed((~wire45)))});
  always
    @(posedge clk) begin
      reg49 <= (^~$unsigned(wire45[(4'h8):(2'h2)]));
    end
  assign wire50 = (8'hbc);
  assign wire51 = wire48[(3'h5):(2'h2)];
  assign wire52 = wire45[(4'h9):(2'h2)];
  assign wire53 = wire52[(3'h4):(3'h4)];
  assign wire54 = ({$unsigned((~&((7'h43) ?
                          wire46 : wire48)))} * wire46[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      if ((~&$unsigned($signed(((wire46 ? wire54 : wire52) ?
          (wire48 ? wire53 : wire43) : $unsigned(wire45))))))
        begin
          reg55 <= $unsigned($signed(wire51[(2'h3):(1'h0)]));
          if ($signed((7'h43)))
            begin
              reg56 <= wire46;
              reg57 <= {wire54};
              reg58 <= {(^wire44), reg56};
              reg59 <= (wire52 > $unsigned((8'hbf)));
            end
          else
            begin
              reg56 <= $signed($unsigned($signed(wire43)));
              reg57 <= (&$unsigned($signed(wire52[(2'h3):(1'h0)])));
              reg58 <= $unsigned(reg49[(5'h13):(4'h8)]);
              reg59 <= wire44[(2'h2):(2'h2)];
              reg60 <= $signed($unsigned($signed((~&$signed(wire44)))));
            end
          reg61 <= $signed($unsigned($unsigned(($signed(reg58) ?
              (^wire52) : (wire53 >= wire44)))));
        end
      else
        begin
          reg55 <= (reg61 && wire48);
          reg56 <= wire47[(4'h9):(2'h3)];
          reg57 <= $signed((wire51[(3'h4):(1'h0)] ?
              $signed($unsigned($unsigned(wire46))) : (^$unsigned((~^wire53)))));
        end
    end
  assign wire62 = reg49;
  assign wire63 = (~^reg61);
  assign wire64 = ($signed(wire43[(1'h1):(1'h0)]) ?
                      (~^$unsigned($signed($signed(reg57)))) : $signed($unsigned({$unsigned((8'ha5)),
                          (wire62 ? (8'h9d) : (8'ha8))})));
  assign wire65 = $signed($unsigned(wire46[(2'h2):(1'h1)]));
  assign wire66 = (wire45[(2'h2):(1'h1)] ?
                      (~&$signed($unsigned(((8'hbf) ?
                          (8'ha4) : reg56)))) : wire62[(1'h1):(1'h1)]);
  assign wire67 = (wire54 ? $unsigned($unsigned($unsigned(reg49))) : wire54);
  assign wire68 = ((reg61 ?
                          ($unsigned({reg55,
                              (7'h42)}) != $signed((^wire52))) : $unsigned($unsigned((wire54 ?
                              wire53 : wire54)))) ?
                      $signed(wire52[(1'h1):(1'h1)]) : $signed((!reg59[(1'h1):(1'h0)])));
  assign wire69 = $unsigned($unsigned($signed(reg55)));
  assign wire70 = ((&{((~|wire67) ?
                          wire65 : wire47)}) - $signed($unsigned({wire66[(2'h2):(1'h0)],
                      (reg59 ? wire69 : wire66)})));
endmodule
