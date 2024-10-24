module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire137;
  wire [(5'h13):(1'h0)] wire136;
  wire [(3'h4):(1'h0)] wire134;
  wire [(5'h14):(1'h0)] wire111;
  wire signed [(3'h4):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire13;
  wire signed [(4'hc):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire4;
  assign y = {wire137,
                 wire136,
                 wire134,
                 wire111,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = (($unsigned(((^wire2) - $signed(wire3))) ?
                         $signed($unsigned((~&wire1))) : $unsigned(($signed(wire3) ?
                             $unsigned(wire2) : {wire2}))) ?
                     wire0[(5'h11):(4'hb)] : $signed((~|$unsigned((~wire2)))));
  assign wire5 = wire1;
  assign wire6 = ((+(-({(8'hbb), wire0} ?
                     $signed(wire2) : wire0[(4'he):(4'ha)]))) - {$signed(wire3[(2'h3):(1'h1)]),
                     wire5[(3'h6):(2'h2)]});
  assign wire7 = ($unsigned(($unsigned(wire1) ?
                     (!{wire5,
                         wire4}) : (wire2[(2'h3):(2'h2)] >> wire4))) < (8'ha6));
  assign wire8 = wire4;
  assign wire9 = wire7;
  assign wire10 = {((wire1[(3'h5):(3'h4)] & wire5) ?
                          (wire4[(1'h0):(1'h0)] ?
                              wire3 : (~|wire8)) : ($signed(wire6) && wire3[(2'h2):(1'h1)])),
                      (wire8[(3'h5):(2'h3)] ~^ (({(7'h44)} ?
                          (wire2 - wire3) : (|wire1)) <<< wire1[(2'h2):(1'h1)]))};
  assign wire11 = $signed(wire9[(3'h4):(1'h1)]);
  assign wire12 = $signed(wire5);
  assign wire13 = wire7[(4'hf):(1'h1)];
  assign wire14 = (wire2 && (((|(wire7 ^ wire12)) ?
                          (^~$signed(wire2)) : $signed((wire4 ?
                              wire3 : wire3))) ?
                      $signed($signed(wire9[(1'h0):(1'h0)])) : ({(wire2 <= (8'hbe))} ?
                          (^~(~|wire12)) : (^(-wire1)))));
  assign wire15 = wire2[(3'h5):(3'h4)];
  assign wire16 = $unsigned((wire3[(4'h8):(3'h6)] ?
                      (wire13[(3'h5):(3'h4)] ?
                          {(&wire2)} : $unsigned((~&wire12))) : {($signed(wire9) ?
                              (-wire6) : wire1)}));
  assign wire17 = ({(|(+{wire7, wire4})), $unsigned(wire16)} - $signed(wire12));
  assign wire18 = (((~wire13) ?
                          $unsigned(wire10[(5'h10):(1'h0)]) : (wire8[(3'h5):(3'h5)] ?
                              $signed(wire15) : (((8'h9c) == wire17) < (wire8 ?
                                  wire11 : wire4)))) ?
                      ($signed(wire6) <= wire9) : wire17);
  assign wire19 = $unsigned($unsigned({{{wire15}}}));
  assign wire20 = wire7[(4'hd):(1'h0)];
  assign wire21 = {(&wire18[(1'h1):(1'h1)])};
  assign wire22 = (7'h40);
  module23 #() modinst112 (.wire26(wire1), .wire25(wire2), .y(wire111), .wire24(wire8), .wire27(wire13), .clk(clk));
  module113 #() modinst135 (.wire117(wire0), .wire114(wire13), .wire116(wire5), .clk(clk), .wire115(wire11), .y(wire134));
  assign wire136 = {(wire7[(1'h0):(1'h0)] - {(~&(wire134 > wire10)),
                           wire8[(4'hd):(4'ha)]}),
                       (^~wire6[(2'h2):(1'h0)])};
  assign wire137 = $signed((+(~&((wire3 ? wire21 : wire0) ?
                       wire15 : (wire0 ? wire13 : wire111)))));
endmodule

module module113
#(parameter param133 = (((|((~&(8'ha7)) ? (^~(8'hbb)) : (|(8'ha8)))) ? ((((8'ha8) + (8'hb2)) ? (~^(8'ha3)) : (+(8'hb9))) ? (!(-(8'hb4))) : (((8'ha0) ? (7'h43) : (8'ha1)) > ((7'h40) - (8'ha2)))) : ((((8'ha5) || (7'h42)) << ((8'hbb) ? (8'hae) : (8'hb1))) ? (((8'hb4) ? (8'h9c) : (8'ha2)) + ((8'hab) - (8'hab))) : (((8'hbe) <<< (7'h40)) ? (^~(8'hb4)) : {(8'hb4), (8'h9c)}))) ? ((8'ha9) << (8'ha3)) : ((^((~&(8'hae)) >= (^~(8'hbd)))) ? ((^{(8'hba), (8'ha3)}) ^~ (^{(8'ha6), (8'h9d)})) : ((^~(&(8'ha6))) ? (8'ha9) : {((8'h9d) > (8'h9f)), ((8'hbc) ? (8'hba) : (8'h9e))}))))
(y, clk, wire117, wire116, wire115, wire114);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire117;
  input wire [(2'h3):(1'h0)] wire116;
  input wire [(5'h11):(1'h0)] wire115;
  input wire [(4'he):(1'h0)] wire114;
  wire signed [(4'he):(1'h0)] wire132;
  wire signed [(4'hb):(1'h0)] wire122;
  wire [(5'h10):(1'h0)] wire121;
  wire [(5'h15):(1'h0)] wire120;
  wire [(3'h4):(1'h0)] wire119;
  wire [(4'he):(1'h0)] wire118;
  reg [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg130 = (1'h0);
  reg [(5'h14):(1'h0)] reg129 = (1'h0);
  reg [(3'h5):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(4'he):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg124 = (1'h0);
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  assign y = {wire132,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 (1'h0)};
  assign wire118 = (((8'hbc) == wire114) ?
                       $unsigned((8'hb7)) : $signed($unsigned($signed((wire116 >= wire117)))));
  assign wire119 = (7'h43);
  assign wire120 = (($signed(($unsigned(wire114) << (wire115 ?
                       wire116 : wire116))) != wire116[(2'h2):(1'h0)]) >> {wire115,
                       $unsigned($unsigned(((8'ha7) ? wire116 : (8'hae))))});
  assign wire121 = $signed($unsigned(wire117));
  assign wire122 = ((|wire114[(2'h3):(2'h2)]) >> wire118);
  always
    @(posedge clk) begin
      reg123 <= wire121[(4'he):(4'hb)];
      reg124 <= wire122[(1'h0):(1'h0)];
      if ($unsigned((+$signed(reg123))))
        begin
          reg125 <= (&$unsigned($unsigned($signed($signed(wire121)))));
          reg126 <= wire117;
          if (reg126[(1'h0):(1'h0)])
            begin
              reg127 <= reg124[(4'h9):(2'h2)];
            end
          else
            begin
              reg127 <= reg125[(3'h5):(1'h0)];
              reg128 <= (~^(&wire114[(4'he):(1'h1)]));
            end
          reg129 <= {(((~^$signed(wire117)) - reg126[(2'h2):(1'h1)]) ?
                  reg123 : wire117[(4'ha):(1'h0)])};
        end
      else
        begin
          reg125 <= ((($signed(wire122[(4'ha):(3'h6)]) - {wire118,
              wire115}) - reg126[(2'h3):(2'h2)]) | {(^$signed((reg128 ?
                  (8'hb1) : wire115)))});
          reg126 <= (8'hbf);
          reg127 <= $signed(wire117);
        end
      reg130 <= {(8'ha1),
          $unsigned(($unsigned($signed(reg125)) || $unsigned(reg124[(2'h3):(1'h1)])))};
      reg131 <= $signed($signed((&reg126)));
    end
  assign wire132 = ($signed($unsigned((7'h40))) ?
                       ((-$signed((wire121 ? reg123 : (8'hb6)))) ?
                           ((wire116[(2'h3):(1'h0)] ?
                                   wire120[(4'hd):(2'h3)] : (8'ha1)) ?
                               wire114[(2'h3):(2'h3)] : $signed((|(8'h9d)))) : (({wire118} ?
                               (&reg130) : $signed(wire121)) < wire122)) : ($signed(reg129[(5'h14):(4'hd)]) * reg130[(5'h10):(3'h4)]));
endmodule

module module23
#(parameter param109 = ((~&(!(((8'ha5) & (8'hb9)) + ((7'h40) ? (8'hbe) : (8'ha3))))) == (((~^((8'hb9) ? (8'hbe) : (8'h9f))) ? (~&((8'hab) == (7'h42))) : ({(7'h44), (8'ha8)} ? (|(8'hb1)) : ((8'hb4) >>> (8'hac)))) & ((((7'h40) ? (8'hb7) : (8'h9e)) ? {(8'h9c), (8'hbb)} : ((8'hb2) ~^ (8'hbd))) ^ ((~^(7'h42)) ? (^(8'ha8)) : ((8'hb4) <<< (8'hb4)))))), 
parameter param110 = (((((~&param109) ? param109 : (param109 ? param109 : param109)) ? ((param109 ? param109 : param109) && (^~param109)) : param109) ? ((~&(param109 ? param109 : param109)) - (7'h43)) : param109) ? {((((8'h9f) ? param109 : param109) ? (~param109) : (param109 ? param109 : param109)) ? (^~(8'ha8)) : ((param109 ? param109 : (8'hae)) ~^ {param109, param109}))} : ((((param109 ? (8'hb7) : param109) ? {param109, param109} : (param109 ? param109 : param109)) ? param109 : param109) ? param109 : (~((param109 ? param109 : param109) ? param109 : (~^param109))))))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'hf7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire27;
  input wire signed [(5'h12):(1'h0)] wire26;
  input wire signed [(4'hb):(1'h0)] wire25;
  input wire signed [(4'hd):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire107;
  wire signed [(4'h8):(1'h0)] wire106;
  wire signed [(3'h5):(1'h0)] wire105;
  wire [(4'hf):(1'h0)] wire104;
  wire signed [(4'h9):(1'h0)] wire103;
  wire signed [(4'he):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire96;
  wire [(4'h9):(1'h0)] wire95;
  wire [(5'h12):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire63;
  wire [(3'h7):(1'h0)] wire64;
  wire [(4'hb):(1'h0)] wire65;
  wire [(3'h4):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire93;
  reg [(4'hb):(1'h0)] reg102 = (1'h0);
  reg [(2'h3):(1'h0)] reg101 = (1'h0);
  reg [(4'ha):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg97 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire98,
                 wire96,
                 wire95,
                 wire61,
                 wire29,
                 wire28,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire67,
                 wire93,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg97,
                 (1'h0)};
  assign wire28 = $unsigned(wire26);
  assign wire29 = {(wire26 ?
                          (!wire24) : ($unsigned(wire26[(3'h6):(3'h6)]) ~^ $unsigned($signed((8'hbf))))),
                      (wire26[(3'h6):(2'h3)] <= $signed(wire24[(2'h3):(2'h3)]))};
  module30 #() modinst62 (wire61, clk, wire28, wire29, wire24, wire25, wire26);
  assign wire63 = $signed($signed(wire25));
  assign wire64 = wire63[(4'he):(4'hb)];
  assign wire65 = ((wire27 ?
                          (~wire63) : ($unsigned({wire28}) != wire24[(1'h0):(1'h0)])) ?
                      {wire26[(3'h6):(1'h1)]} : wire61);
  assign wire66 = wire61[(4'ha):(2'h3)];
  assign wire67 = (wire27 >> wire65[(4'h8):(3'h5)]);
  module68 #() modinst94 (wire93, clk, wire28, wire61, wire64, wire27, wire29);
  assign wire95 = $signed(wire61[(4'hf):(1'h1)]);
  assign wire96 = ({$unsigned(wire25)} ? wire67 : (~^{{$signed(wire64)}}));
  always
    @(posedge clk) begin
      reg97 <= (($unsigned((~wire26[(3'h5):(1'h0)])) ^~ $signed($signed($unsigned(wire95)))) ?
          (^$signed((~|wire29[(2'h2):(1'h1)]))) : $signed($unsigned(($unsigned(wire67) ~^ (8'hb8)))));
    end
  assign wire98 = wire27[(3'h6):(2'h3)];
  always
    @(posedge clk) begin
      reg99 <= $unsigned(wire64[(3'h6):(1'h1)]);
      reg100 <= (((+(8'ha5)) ~^ $unsigned($unsigned(reg99))) ?
          ($signed((((7'h44) >= (8'hbb)) ?
                  $unsigned(wire61) : (wire24 << wire67))) ?
              (&$unsigned(wire61)) : {$signed(wire24)}) : $unsigned($unsigned((wire29 < (wire96 ~^ (8'hbd))))));
      reg101 <= (&wire26);
      reg102 <= (($signed({{reg97, (8'h9d)}, $unsigned(wire65)}) ?
          reg97[(3'h7):(3'h4)] : (8'hb2)) ~^ $signed(reg99[(1'h0):(1'h0)]));
    end
  assign wire103 = wire93;
  assign wire104 = $signed((wire25[(3'h6):(2'h2)] ?
                       {(^~(reg99 ? wire66 : wire96)),
                           $unsigned($signed((8'haa)))} : (~reg102)));
  assign wire105 = $unsigned($signed($signed((wire66 << {wire96, wire24}))));
  assign wire106 = {(~|(&$unsigned((wire61 & reg97)))),
                       (+(~&(|$signed(reg97))))};
  assign wire107 = wire63[(3'h5):(2'h3)];
  assign wire108 = wire27[(5'h13):(3'h6)];
endmodule

module module68  (y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire73;
  input wire [(4'hb):(1'h0)] wire72;
  input wire signed [(3'h6):(1'h0)] wire71;
  input wire [(4'h8):(1'h0)] wire70;
  input wire signed [(5'h13):(1'h0)] wire69;
  wire [(4'hf):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire90;
  wire [(5'h10):(1'h0)] wire89;
  wire [(3'h6):(1'h0)] wire88;
  wire signed [(4'hb):(1'h0)] wire87;
  wire signed [(5'h12):(1'h0)] wire86;
  wire [(3'h4):(1'h0)] wire85;
  reg [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg74 <= wire72[(1'h1):(1'h0)];
      reg75 <= $unsigned(((wire72 ?
              $unsigned({wire72, (8'ha3)}) : $signed(wire72)) ?
          wire72[(3'h7):(1'h0)] : (|$signed({wire72, reg74}))));
      reg76 <= $unsigned($unsigned((^{(wire72 ? wire69 : wire71),
          $unsigned(reg74)})));
      if ({((reg74[(1'h0):(1'h0)] || $unsigned($signed(reg74))) + ($signed($signed(wire73)) ?
              (wire73[(3'h6):(3'h5)] ?
                  (wire70 ?
                      (8'hbf) : reg76) : $signed(wire70)) : $signed((wire71 ?
                  wire72 : wire70))))})
        begin
          reg77 <= reg75[(2'h3):(1'h0)];
        end
      else
        begin
          if (((wire73 < (~(&(wire72 ? reg76 : reg74)))) && (wire71 ?
              $signed((^$signed(wire72))) : $unsigned({$unsigned(wire72)}))))
            begin
              reg77 <= $unsigned((~|$unsigned({reg76[(1'h0):(1'h0)]})));
              reg78 <= {((reg75[(1'h1):(1'h1)] >> $signed({wire70})) * (~($signed(wire69) ?
                      wire72[(2'h3):(2'h2)] : (&reg77))))};
              reg79 <= (((wire72[(3'h6):(3'h4)] > $signed($signed(reg75))) < $signed(wire73)) ?
                  ($unsigned((8'ha7)) ?
                      $unsigned($unsigned((reg76 ?
                          reg75 : reg76))) : (~^($signed(wire72) ?
                          reg76 : (wire69 ?
                              reg76 : reg77)))) : $signed(reg76[(1'h0):(1'h0)]));
            end
          else
            begin
              reg77 <= $signed((+$signed($unsigned((8'ha9)))));
              reg78 <= $signed($signed($unsigned(($unsigned((8'hbc)) | $signed(reg75)))));
              reg79 <= (wire71[(2'h2):(2'h2)] > (((8'ha5) >> {(reg75 + wire69)}) * $unsigned($signed((wire70 <= (7'h42))))));
              reg80 <= ((^~(^{(wire73 ? wire69 : reg77)})) ?
                  $signed(wire72[(4'ha):(2'h2)]) : wire73);
            end
          reg81 <= (~^(reg76[(2'h2):(2'h2)] ?
              $unsigned((8'ha2)) : (((reg77 ? reg80 : wire71) ?
                  {(8'ha3)} : (reg74 ?
                      reg75 : (8'hb6))) & $unsigned(wire72[(1'h1):(1'h1)]))));
          reg82 <= $signed({reg79, reg79});
          reg83 <= (reg81[(1'h0):(1'h0)] ^ reg80[(2'h2):(1'h1)]);
        end
      reg84 <= reg74;
    end
  assign wire85 = $unsigned($unsigned($unsigned(wire73[(1'h0):(1'h0)])));
  assign wire86 = (~&(~&({$signed(reg83)} ? reg76 : wire69[(2'h2):(1'h1)])));
  assign wire87 = $unsigned(wire71);
  assign wire88 = (~&wire85[(2'h2):(1'h0)]);
  assign wire89 = wire72[(4'ha):(3'h6)];
  assign wire90 = (((($unsigned((8'hab)) ? reg78[(3'h7):(1'h1)] : wire71) ?
                              (8'hbf) : wire88[(1'h1):(1'h1)]) ?
                          ((reg79 ? (~&reg79) : reg84[(4'h8):(1'h1)]) ?
                              $signed((~^wire86)) : (~|wire88[(2'h3):(2'h2)])) : $unsigned($signed({reg76}))) ?
                      $signed({$signed({(8'hb4)})}) : (wire73 ?
                          wire73[(2'h3):(1'h1)] : (^~$signed(((7'h40) <<< reg77)))));
  assign wire91 = $unsigned((~^$unsigned($unsigned({(8'hab)}))));
  assign wire92 = ((~^reg79) - (reg84 ?
                      ({(wire70 < (8'h9e)),
                          wire71[(3'h6):(3'h5)]} >> wire69[(1'h0):(1'h0)]) : wire86));
endmodule

module module30  (y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire35;
  input wire signed [(4'h8):(1'h0)] wire34;
  input wire signed [(4'hd):(1'h0)] wire33;
  input wire [(4'ha):(1'h0)] wire32;
  input wire signed [(4'hc):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire59;
  wire [(2'h3):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire57;
  wire signed [(5'h14):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire44;
  wire signed [(3'h4):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire42;
  wire [(3'h6):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire36;
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(4'hc):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire36,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire36 = (^((~($unsigned(wire34) | wire33[(4'hd):(4'h8)])) ?
                      wire31 : ((^~(wire33 ^ wire35)) ?
                          $unsigned(wire31[(3'h6):(3'h6)]) : {(wire31 > (8'hb0))})));
  always
    @(posedge clk) begin
      if ($unsigned(wire34[(3'h7):(1'h0)]))
        begin
          reg37 <= (wire33[(4'ha):(1'h1)] >> $signed({wire35[(1'h1):(1'h1)]}));
          reg38 <= (8'hbe);
        end
      else
        begin
          reg37 <= reg38;
          reg38 <= wire31;
          reg39 <= $unsigned(wire33[(2'h3):(1'h0)]);
          reg40 <= (wire33 <<< (reg37 ?
              $unsigned($signed((|reg38))) : $unsigned((-{reg38}))));
        end
    end
  assign wire41 = ($unsigned(wire34) < $signed($signed((wire36 ?
                      (wire35 ? wire31 : reg39) : $unsigned(wire31)))));
  assign wire42 = $unsigned((~&(($signed(wire31) ?
                      reg38[(4'ha):(3'h4)] : (|(8'hb0))) || ((wire33 ?
                      reg40 : wire41) ~^ $unsigned(wire36)))));
  assign wire43 = {(|$unsigned((^$signed(reg40)))), wire42};
  assign wire44 = ((-wire34) << reg38);
  assign wire45 = $signed((&({reg37, (wire43 ? (8'hbb) : wire35)} ?
                      wire35[(3'h4):(2'h3)] : ((wire31 >> (8'hbc)) ?
                          (reg37 != (8'hb2)) : (8'h9e)))));
  assign wire46 = ($unsigned($unsigned(($signed(reg39) == $signed(wire35)))) <= reg39);
  always
    @(posedge clk) begin
      reg47 <= $signed((wire45 ?
          reg40 : ($unsigned($signed(wire43)) ^~ $signed(((7'h41) ?
              reg37 : reg40)))));
    end
  always
    @(posedge clk) begin
      reg48 <= $signed($unsigned($signed($signed((wire45 & (8'ha0))))));
      if ($unsigned(reg47[(1'h1):(1'h0)]))
        begin
          if ((8'ha4))
            begin
              reg49 <= $signed({{(~&{(8'hb0), reg38})}});
              reg50 <= (~^wire32[(4'h8):(2'h3)]);
              reg51 <= wire46;
            end
          else
            begin
              reg49 <= wire33[(1'h1):(1'h0)];
              reg50 <= reg37[(3'h4):(2'h3)];
              reg51 <= (~&{wire32});
              reg52 <= {($signed((^$signed(wire33))) ^~ $unsigned($unsigned($unsigned(reg47)))),
                  $signed((reg50 ?
                      $unsigned((reg47 ?
                          wire34 : wire34)) : wire34[(4'h8):(1'h1)]))};
            end
          reg53 <= $unsigned((reg47 > $signed($unsigned($unsigned(wire36)))));
        end
      else
        begin
          if ($signed($unsigned($signed(reg40[(4'hc):(3'h6)]))))
            begin
              reg49 <= $signed(reg48[(4'ha):(4'h8)]);
              reg50 <= {($signed(reg50) ~^ (~|((wire44 ?
                      (8'hb3) : (8'hac)) != (8'ha3)))),
                  $unsigned((reg53[(1'h0):(1'h0)] ?
                      $unsigned($unsigned(wire32)) : $unsigned((8'hab))))};
            end
          else
            begin
              reg49 <= (+$signed((|{wire46[(2'h2):(1'h0)]})));
              reg50 <= ($unsigned((^~(~&(reg52 - wire35)))) ^~ (~^$unsigned((^~reg52[(3'h6):(2'h3)]))));
            end
          if ($signed($unsigned(wire34[(4'h8):(1'h1)])))
            begin
              reg51 <= {$signed(reg53)};
            end
          else
            begin
              reg51 <= {$unsigned((~|wire33))};
              reg52 <= ($unsigned($unsigned(wire44)) ?
                  (|(-$signed($signed(wire45)))) : (8'ha4));
              reg53 <= {{{(~&$signed(wire42)), reg40[(4'h9):(3'h7)]}},
                  $unsigned($unsigned((wire36[(4'h9):(4'h8)] | ((8'hb5) ?
                      reg51 : reg49))))};
            end
          reg54 <= ((+(reg40 > wire33)) && {$unsigned($unsigned(wire45[(2'h3):(2'h3)])),
              (({reg53} ? (-reg37) : wire32[(4'h9):(2'h3)]) ?
                  (^~reg51[(2'h3):(2'h3)]) : (((8'hb8) ?
                      reg38 : wire31) <<< (wire42 != wire36)))});
        end
      reg55 <= wire45[(1'h1):(1'h0)];
      reg56 <= reg50;
    end
  assign wire57 = (8'hbe);
  assign wire58 = reg54;
  assign wire59 = (~^reg39);
  assign wire60 = wire34[(2'h2):(1'h1)];
endmodule
