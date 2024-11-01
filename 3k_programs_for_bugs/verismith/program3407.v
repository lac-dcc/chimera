module top
#(parameter param136 = (+({(((8'hac) ? (8'hb2) : (8'hb5)) ? {(7'h42), (8'hac)} : ((8'haa) ? (8'hbf) : (8'ha2))), (((7'h43) ? (8'ha2) : (8'haa)) ? ((8'ha4) >>> (8'ha8)) : ((8'haa) << (8'h9f)))} <= {({(8'had)} ? (~(8'ha8)) : ((8'ha6) * (8'hb9))), (!((8'ha2) ? (8'hb6) : (8'hb3)))})), 
parameter param137 = ((param136 ? param136 : (7'h40)) ? param136 : (^((~&(-(8'had))) >>> (-(param136 & param136))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  wire [(4'hc):(1'h0)] wire135;
  wire [(5'h15):(1'h0)] wire134;
  wire [(5'h12):(1'h0)] wire133;
  wire [(4'hf):(1'h0)] wire132;
  wire [(4'he):(1'h0)] wire131;
  wire [(3'h5):(1'h0)] wire130;
  wire signed [(2'h3):(1'h0)] wire129;
  wire signed [(5'h10):(1'h0)] wire127;
  wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire69;
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire127,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire69,
                 (1'h0)};
  assign wire4 = (wire0 ?
                     (~&$signed((wire0 | wire2[(3'h4):(2'h2)]))) : $unsigned({{(wire0 - wire1)},
                         wire0[(4'hb):(3'h5)]}));
  assign wire5 = $unsigned((|($signed((wire4 >>> (8'h9e))) * ((^wire2) ~^ wire3))));
  assign wire6 = ($signed(wire1) ?
                     ((($unsigned(wire3) ^~ {(8'hb4), wire0}) ?
                         (wire1[(3'h7):(3'h7)] >= (8'ha8)) : wire2[(3'h4):(3'h4)]) * {(((8'hae) ~^ wire2) <<< (&wire4)),
                         (|wire4)}) : (+$unsigned(($signed(wire1) ?
                         (wire5 ~^ wire5) : (+wire1)))));
  assign wire7 = {$signed($unsigned(($unsigned(wire2) ?
                         (wire4 ? wire5 : wire2) : $signed(wire5))))};
  module8 #() modinst70 (.wire11(wire4), .wire9(wire2), .wire10(wire0), .clk(clk), .wire13(wire6), .wire12(wire5), .y(wire69));
  module71 #() modinst128 (wire127, clk, wire7, wire5, wire4, wire1);
  assign wire129 = {{wire1, wire3[(1'h1):(1'h0)]},
                       $signed(wire4[(5'h10):(5'h10)])};
  assign wire130 = ($unsigned((wire3[(1'h0):(1'h0)] << $unsigned(wire6[(5'h10):(3'h5)]))) ?
                       wire127[(5'h10):(1'h0)] : (wire2 & wire1));
  assign wire131 = (|wire3);
  assign wire132 = (wire130[(1'h1):(1'h1)] ?
                       wire69 : ($signed((&(~&wire131))) ?
                           $unsigned($unsigned(wire130)) : (&$unsigned((wire7 ?
                               wire2 : wire130)))));
  assign wire133 = (wire131[(2'h2):(2'h2)] ?
                       $unsigned((wire127[(4'he):(4'he)] && $unsigned($unsigned((8'hb6))))) : ((((^wire6) ?
                                   (wire3 ^ wire1) : (wire2 << wire127)) ?
                               $signed($unsigned((8'hb0))) : {{wire1, (8'hb6)},
                                   (&(8'haf))}) ?
                           $signed($unsigned(wire127)) : wire0));
  assign wire134 = ((+(8'ha9)) ?
                       $unsigned(((+(wire0 ?
                           wire69 : wire1)) << wire3)) : $signed(wire129));
  assign wire135 = wire3;
endmodule

module module71
#(parameter param126 = (&((8'hae) ? ((7'h44) & (((8'ha8) ? (8'hb5) : (8'hb0)) == ((8'hab) <= (8'ha7)))) : ((&(-(8'hb3))) < ((~^(8'hb7)) * (8'ha1))))))
(y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire75;
  input wire [(5'h10):(1'h0)] wire74;
  input wire [(4'hd):(1'h0)] wire73;
  input wire signed [(4'h9):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire125;
  wire [(3'h5):(1'h0)] wire119;
  wire signed [(4'hf):(1'h0)] wire118;
  wire [(4'he):(1'h0)] wire117;
  wire [(4'hb):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire113;
  wire signed [(4'hc):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire76;
  reg [(5'h14):(1'h0)] reg124 = (1'h0);
  reg [(5'h14):(1'h0)] reg123 = (1'h0);
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg121 = (1'h0);
  reg [(4'hd):(1'h0)] reg120 = (1'h0);
  assign y = {wire125,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire113,
                 wire78,
                 wire77,
                 wire76,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 (1'h0)};
  assign wire76 = wire74[(4'h8):(3'h6)];
  assign wire77 = $signed($signed($unsigned({$signed(wire73),
                      (wire74 != wire75)})));
  assign wire78 = wire75[(4'h8):(1'h1)];
  module79 #() modinst114 (.wire81(wire76), .wire83(wire73), .clk(clk), .y(wire113), .wire80(wire74), .wire82(wire75));
  assign wire115 = (+($signed((wire76[(4'h8):(1'h1)] >> (+wire73))) >>> wire73));
  assign wire116 = (8'ha9);
  assign wire117 = (&(^~$signed($unsigned(wire113[(2'h3):(2'h2)]))));
  assign wire118 = (~^$unsigned($unsigned($signed($unsigned(wire73)))));
  assign wire119 = wire73[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg120 <= wire113;
      if ((^~($signed((8'hb2)) > (((wire116 ? wire117 : wire115) ?
              $signed(wire75) : $signed(wire113)) ?
          $unsigned(((8'hb6) ~^ wire116)) : $signed(wire77)))))
        begin
          if ((|((($unsigned((8'ha6)) ^ wire72[(3'h4):(1'h0)]) ?
                  $signed((wire75 ? (8'hab) : wire116)) : wire74) ?
              (~^wire118) : (&(+$unsigned(wire72))))))
            begin
              reg121 <= (!($signed(((~&wire73) ?
                  (8'hae) : wire117[(4'he):(3'h7)])) >= ((((7'h43) ^ wire72) ?
                      (wire113 ? wire113 : wire119) : (~&wire118)) ?
                  wire74[(4'hf):(1'h0)] : (reg120[(1'h0):(1'h0)] ?
                      (wire116 <= wire77) : (&wire118)))));
              reg122 <= wire76;
              reg123 <= {$unsigned(wire116)};
              reg124 <= wire119[(1'h0):(1'h0)];
            end
          else
            begin
              reg121 <= (!(~|$unsigned($unsigned($signed(reg121)))));
            end
        end
      else
        begin
          reg121 <= ((wire77 ^~ reg122[(4'h8):(1'h0)]) ?
              (8'hb8) : (~&(~^({reg122} ?
                  (wire113 ? wire116 : (7'h41)) : wire115[(2'h3):(1'h0)]))));
          reg122 <= wire76;
          reg123 <= $unsigned(wire119);
        end
    end
  assign wire125 = (!{(|reg121), wire72[(3'h6):(3'h4)]});
endmodule

module module8
#(parameter param68 = ({(^({(8'ha8), (7'h43)} ? ((8'ha3) ? (8'h9e) : (8'hb0)) : {(7'h40), (8'hbd)})), ((((8'hbd) <<< (8'ha4)) ? ((8'hbf) ? (8'h9e) : (8'hb2)) : ((8'ha7) ? (8'hb4) : (8'h9f))) != (((7'h42) >= (8'ha9)) ? (+(8'hb0)) : (|(8'ha2))))} <<< (((((8'ha1) ? (7'h40) : (8'haf)) ? ((8'hbb) * (8'hb8)) : ((8'hb1) * (8'haf))) ? (((7'h44) ? (8'hbf) : (8'hbd)) && {(8'h9f), (8'hbb)}) : (((8'ha0) ? (8'hbd) : (8'ha3)) ? (+(8'ha9)) : ((8'haa) ? (8'hbf) : (8'hbd)))) ? {{(~^(8'ha5))}, ({(8'hb0), (8'h9d)} - ((8'hb9) > (8'haf)))} : {(^((8'hac) - (8'ha5)))})))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'hf7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire11;
  input wire signed [(4'ha):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire60;
  wire signed [(5'h13):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire45;
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire47,
                 wire45,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  module14 #() modinst46 (.wire16(wire11), .wire19(wire12), .y(wire45), .wire15(wire13), .wire18(wire9), .clk(clk), .wire17(wire10));
  assign wire47 = ((8'hbb) > (!wire12));
  always
    @(posedge clk) begin
      reg48 <= ($unsigned(wire11[(4'he):(4'hd)]) ?
          ({$signed(wire11[(4'hc):(4'hc)])} ?
              wire13 : {wire47, $signed($signed(wire45))}) : {{(8'h9e),
                  wire13[(3'h4):(2'h3)]},
              (^(wire11[(4'h9):(3'h7)] >>> wire47))});
    end
  always
    @(posedge clk) begin
      if ($unsigned({wire10, reg48[(3'h7):(3'h7)]}))
        begin
          reg49 <= wire45;
          if (wire13[(2'h2):(1'h0)])
            begin
              reg50 <= ({wire11[(4'h9):(3'h7)]} ?
                  (((wire45 ? (wire47 ^~ wire12) : reg48[(2'h3):(1'h0)]) ?
                          $signed(wire47[(4'hd):(3'h4)]) : $signed({(8'ha1),
                              wire9})) ?
                      ((~wire12) ^ $signed((|reg48))) : {$signed(((8'hb8) ?
                              wire12 : reg48))}) : $unsigned($unsigned($signed(((8'hbf) ?
                      (8'hbc) : reg49)))));
              reg51 <= (+((|wire11) && (&(~^wire9))));
            end
          else
            begin
              reg50 <= reg51;
              reg51 <= (($signed($unsigned((|wire10))) ~^ wire13[(5'h13):(5'h13)]) ?
                  {(!$unsigned((8'hac)))} : {wire11});
              reg52 <= wire11[(5'h13):(4'hb)];
              reg53 <= (wire13[(4'hb):(4'hb)] | (8'hb6));
            end
          reg54 <= ({$unsigned(reg53)} ?
              ($signed(reg49) ?
                  (+wire45[(2'h3):(1'h1)]) : {{(!(8'ha9))}}) : reg49[(2'h2):(1'h1)]);
        end
      else
        begin
          reg49 <= $signed($signed((-(reg50 ?
              reg48[(3'h4):(1'h0)] : (!wire45)))));
          reg50 <= (~&$unsigned((($signed(wire47) ?
              $unsigned(wire45) : $signed(wire13)) * {(reg48 ?
                  wire12 : reg54)})));
          reg51 <= (^~(wire12 ? $signed((!$signed(reg48))) : wire12));
          reg52 <= $unsigned(wire47);
        end
      if ({(-(((8'hac) ? $unsigned((8'ha4)) : $signed(wire9)) <<< ((reg53 ?
                  (8'hbc) : reg51) ?
              (reg50 ? reg48 : wire47) : wire9))),
          (reg48[(4'ha):(4'h8)] ?
              $signed(reg48) : {(reg54 ?
                      wire9[(4'ha):(1'h1)] : $unsigned(reg51)),
                  $signed(reg49[(3'h5):(3'h4)])})})
        begin
          reg55 <= $signed((7'h40));
        end
      else
        begin
          reg55 <= $signed($unsigned((8'hbb)));
          reg56 <= reg55;
          reg57 <= $signed(($unsigned({$unsigned((8'hb6)),
              (~wire47)}) + (($signed(wire12) ?
                  ((8'hb9) ? reg55 : reg56) : reg54) ?
              (~|(&reg54)) : wire11[(1'h1):(1'h0)])));
        end
      reg58 <= {((((wire11 ? reg51 : reg57) ?
              ((8'had) & wire11) : (^~wire13)) << $unsigned((wire13 ?
              (8'hb8) : (8'hbe)))) >> ($unsigned($unsigned(reg49)) ?
              ((!reg50) ?
                  $unsigned(reg51) : {reg51, (8'hac)}) : ($unsigned((8'hba)) ?
                  $signed(reg57) : (reg56 == wire47)))),
          wire45};
      reg59 <= (&(8'had));
    end
  assign wire60 = (8'ha4);
  assign wire61 = reg48[(4'hb):(3'h7)];
  assign wire62 = $unsigned($unsigned(reg58));
  assign wire63 = wire45;
  assign wire64 = wire11;
  assign wire65 = ($signed((&wire62[(1'h1):(1'h1)])) ?
                      ((8'hb8) >> wire11) : $unsigned((+$signed(reg48[(1'h1):(1'h0)]))));
  assign wire66 = ((^~reg54[(4'h9):(3'h7)]) >>> ($unsigned(($signed((8'ha5)) ?
                      (reg52 - reg57) : $unsigned(wire9))) >>> wire63));
  assign wire67 = reg52[(1'h1):(1'h1)];
endmodule

module module14
#(parameter param43 = (^~((8'ha0) >> (({(8'ha3)} ? ((8'hb8) ? (8'ha2) : (8'hb1)) : ((7'h42) || (8'hab))) ? (((8'had) >>> (8'haa)) ? (-(7'h40)) : ((8'hae) != (8'ha4))) : (-((8'h9d) ? (8'hb4) : (8'ha9)))))), 
parameter param44 = (~(((!{param43, param43}) ^~ {(param43 ? (8'hb3) : param43), (param43 ? param43 : param43)}) ? (+param43) : (((param43 ? (8'ha7) : param43) ? param43 : (~^param43)) + (param43 ? (~(8'hb3)) : (param43 && param43))))))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire19;
  input wire signed [(4'hf):(1'h0)] wire18;
  input wire signed [(2'h3):(1'h0)] wire17;
  input wire [(5'h10):(1'h0)] wire16;
  input wire signed [(5'h14):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire40;
  wire signed [(5'h12):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire20;
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire20,
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
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire20 = {(wire17[(1'h1):(1'h0)] ?
                          wire17[(2'h3):(1'h1)] : (wire16[(3'h6):(3'h6)] << wire19))};
  always
    @(posedge clk) begin
      if ((^~(($unsigned(((8'h9c) ?
              wire17 : wire17)) <<< wire19[(4'h9):(2'h2)]) ?
          $unsigned((wire15 * wire20[(3'h4):(1'h1)])) : (((wire15 ?
                  (8'hba) : wire16) - wire15) ?
              wire16 : (+(wire18 << (8'ha8)))))))
        begin
          reg21 <= wire15;
          reg22 <= $signed((wire16 ?
              $unsigned((wire16[(1'h1):(1'h1)] ?
                  wire18[(1'h0):(1'h0)] : $unsigned(wire19))) : $unsigned($unsigned($signed(wire19)))));
          reg23 <= wire16;
          if ((wire18 ? $unsigned($signed(wire16[(4'h9):(1'h0)])) : reg21))
            begin
              reg24 <= $unsigned(wire15);
              reg25 <= $signed({{wire15[(4'he):(3'h5)]}});
              reg26 <= wire16;
              reg27 <= $unsigned(reg24[(3'h7):(2'h2)]);
            end
          else
            begin
              reg24 <= {(~^{{(-reg26)}}), wire19[(1'h0):(1'h0)]};
            end
        end
      else
        begin
          reg21 <= wire20[(3'h4):(2'h3)];
          reg22 <= $unsigned({(^reg24)});
          reg23 <= (reg27 ? reg27[(4'ha):(3'h6)] : (~^$signed(wire18)));
        end
      reg28 <= $unsigned((~$signed(((~^reg25) ? $unsigned(wire17) : (8'hb6)))));
      if ($signed(reg23[(4'h9):(3'h7)]))
        begin
          reg29 <= reg26;
        end
      else
        begin
          reg29 <= wire20[(2'h2):(2'h2)];
          if (({reg24[(4'h8):(1'h1)]} ?
              ($unsigned($signed($signed(wire16))) ?
                  (8'ha5) : wire18[(3'h5):(2'h3)]) : reg29[(4'h8):(2'h3)]))
            begin
              reg30 <= reg29;
              reg31 <= $signed(reg30[(2'h3):(1'h1)]);
              reg32 <= $signed((^~$unsigned($unsigned((~|wire18)))));
              reg33 <= $signed(reg28);
            end
          else
            begin
              reg30 <= $unsigned(reg31[(3'h7):(2'h2)]);
              reg31 <= (+(8'hbc));
              reg32 <= {($signed(reg29) ?
                      ($signed(wire19) ?
                          $unsigned((reg30 & reg25)) : (^~(~&wire17))) : (|{$unsigned(wire15)}))};
            end
          reg34 <= (|(reg24 ?
              $unsigned(reg25[(1'h1):(1'h0)]) : reg28[(3'h4):(1'h0)]));
          reg35 <= $unsigned({{$signed($signed((8'hb9)))}});
        end
      reg36 <= reg30[(2'h2):(1'h1)];
      reg37 <= {(~^reg31), reg33[(3'h5):(2'h3)]};
    end
  always
    @(posedge clk) begin
      reg38 <= ($signed($signed(reg31[(3'h6):(1'h1)])) ?
          $signed({wire18[(4'hb):(3'h5)],
              $signed($signed(reg31))}) : ($signed(($signed(wire20) ?
              $signed(wire19) : (reg30 ?
                  wire20 : reg30))) != (reg28[(3'h7):(3'h7)] | reg33[(3'h5):(1'h0)])));
    end
  assign wire39 = $signed(((reg23 ?
                      (~&wire20[(1'h1):(1'h1)]) : ($signed(wire18) & {reg38})) << wire16));
  assign wire40 = reg32[(4'hd):(3'h5)];
  assign wire41 = (wire16[(1'h1):(1'h0)] ? (8'hbf) : (~$signed(reg35)));
  assign wire42 = (~&$unsigned((({reg28,
                      reg23} & (reg32 >>> (8'hba))) + (8'hb7))));
endmodule

module module79
#(parameter param111 = (&{((^~((8'ha6) ? (7'h43) : (8'hab))) && {((8'ha5) ? (8'hb3) : (8'ha5)), ((8'had) ? (8'hbf) : (8'hbe))})}), 
parameter param112 = (param111 ? ({((param111 != param111) < ((8'h9d) * (8'hb4))), (~&(param111 == param111))} >>> param111) : (8'ha0)))
(y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire83;
  input wire signed [(4'he):(1'h0)] wire82;
  input wire signed [(5'h15):(1'h0)] wire81;
  input wire signed [(2'h3):(1'h0)] wire80;
  wire signed [(4'hb):(1'h0)] wire106;
  wire signed [(3'h5):(1'h0)] wire105;
  wire signed [(2'h2):(1'h0)] wire104;
  wire [(4'h9):(1'h0)] wire103;
  wire [(5'h11):(1'h0)] wire102;
  wire signed [(4'hc):(1'h0)] wire101;
  wire signed [(4'hb):(1'h0)] wire100;
  wire signed [(5'h13):(1'h0)] wire99;
  wire [(5'h11):(1'h0)] wire98;
  wire signed [(2'h2):(1'h0)] wire97;
  wire signed [(4'hf):(1'h0)] wire86;
  wire signed [(4'hb):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire84;
  reg [(3'h7):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg [(4'hf):(1'h0)] reg108 = (1'h0);
  reg [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(5'h14):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(4'h9):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(3'h7):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire86,
                 wire85,
                 wire84,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
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
                 (1'h0)};
  assign wire84 = wire82;
  assign wire85 = (&$signed($unsigned($unsigned(((8'hb4) ~^ (8'ha7))))));
  assign wire86 = (8'hb2);
  always
    @(posedge clk) begin
      reg87 <= wire85[(4'h9):(2'h3)];
      reg88 <= $signed(wire81);
      if ({$signed((reg87[(3'h4):(2'h3)] ?
              ($signed(wire86) ?
                  $signed(wire86) : $signed(wire82)) : $unsigned((wire83 >> (8'ha6))))),
          ($signed(((~|wire83) == wire85)) == wire81[(3'h4):(1'h0)])})
        begin
          reg89 <= wire85[(2'h2):(2'h2)];
          if ($signed(reg87[(1'h0):(1'h0)]))
            begin
              reg90 <= wire83;
              reg91 <= reg87;
              reg92 <= (^~reg87[(3'h5):(2'h3)]);
              reg93 <= ((reg88[(5'h12):(4'hb)] - $signed((+(wire86 ?
                  wire84 : reg92)))) || wire84);
            end
          else
            begin
              reg90 <= wire85[(3'h6):(3'h5)];
              reg91 <= (wire83[(1'h0):(1'h0)] ^ reg88[(1'h1):(1'h1)]);
              reg92 <= $signed(($signed(reg89) ^~ {(^~(reg93 ~^ wire81))}));
              reg93 <= (reg87 ?
                  (-($unsigned(((8'ha1) ^~ wire82)) && (^~((8'hb7) ?
                      wire84 : reg93)))) : ((8'hb3) & (|($unsigned(reg91) ?
                      (wire86 * (8'ha2)) : (wire86 && reg92)))));
              reg94 <= (+(&(((reg91 ^~ reg93) ?
                      wire82[(2'h2):(1'h0)] : (&wire83)) ?
                  $signed($signed(wire84)) : wire85)));
            end
        end
      else
        begin
          reg89 <= {wire85};
          reg90 <= wire86;
          reg91 <= $signed((reg87[(1'h0):(1'h0)] ?
              reg87 : reg87[(2'h3):(1'h1)]));
        end
      reg95 <= $signed($signed((($signed(reg91) ~^ (&wire84)) | ($unsigned(wire86) ?
          (reg93 ? wire86 : (8'ha5)) : (reg92 ? (8'had) : reg88)))));
      reg96 <= (^$signed(((!(wire85 ?
          reg91 : (8'haf))) >> (|$unsigned(reg89)))));
    end
  assign wire97 = reg93;
  assign wire98 = ($signed(wire81[(2'h3):(2'h3)]) ?
                      $unsigned({((wire83 ?
                              reg93 : wire80) - $unsigned(reg88))}) : reg92);
  assign wire99 = (wire83[(1'h0):(1'h0)] - ((~^(((8'ha3) != wire86) && (+wire80))) ^~ (wire82 ?
                      $unsigned(wire84[(3'h7):(3'h6)]) : $unsigned(wire80))));
  assign wire100 = {wire83, $signed($signed(wire97))};
  assign wire101 = wire81[(2'h2):(1'h1)];
  assign wire102 = reg91[(3'h4):(1'h0)];
  assign wire103 = wire82[(4'h8):(1'h1)];
  assign wire104 = $signed(((($unsigned(wire85) >> $unsigned(reg93)) ?
                       $signed({wire97}) : ({wire97,
                           wire83} ^~ (&reg95))) < ($unsigned(reg90[(3'h7):(1'h0)]) & (!(wire98 ?
                       wire99 : reg96)))));
  assign wire105 = $unsigned({reg94[(4'h9):(2'h2)]});
  assign wire106 = $unsigned(($signed($unsigned((reg93 ? wire86 : reg89))) ?
                       $unsigned(reg96) : (wire98 ?
                           (reg88[(4'ha):(1'h1)] | wire83) : $unsigned($unsigned(reg88)))));
  always
    @(posedge clk) begin
      reg107 <= (~(((^{reg89, wire82}) ?
              $unsigned($unsigned(reg87)) : {$signed(reg89),
                  $unsigned(reg92)}) ?
          ($unsigned((wire103 || (8'haa))) ?
              (!reg89[(3'h6):(3'h5)]) : reg95[(1'h0):(1'h0)]) : {reg95[(2'h3):(1'h0)],
              wire99}));
      reg108 <= $signed((|wire97[(1'h1):(1'h0)]));
      reg109 <= reg92;
      reg110 <= {$signed(($unsigned((wire85 ?
              reg91 : (8'ha3))) > ($unsigned(reg109) <<< (wire104 + wire83))))};
    end
endmodule
