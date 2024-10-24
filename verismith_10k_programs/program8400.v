module top
#(parameter param114 = ((~|(!(((8'hb3) ? (8'ha8) : (8'hbd)) ? (^~(8'ha1)) : ((8'ha6) * (8'hb1))))) >> (((8'ha0) > (8'hbe)) ? ((^~{(8'hb4)}) > (((8'haa) - (8'ha8)) ? (~(8'hbd)) : {(8'hbf)})) : (((&(8'hb5)) == ((8'ha4) && (8'hbe))) ? (((7'h44) * (8'hbe)) ? (^(7'h42)) : {(8'haf)}) : (8'hbe)))), 
parameter param115 = ((~&(((param114 <<< param114) ? (param114 ? param114 : (8'hb2)) : (param114 ? (8'hb9) : param114)) ? (~|(param114 ? param114 : param114)) : (param114 >> (param114 ? param114 : param114)))) == {param114}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire112;
  wire signed [(4'h8):(1'h0)] wire73;
  wire signed [(3'h5):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire4;
  assign y = {wire112, wire73, wire71, wire5, wire4, (1'h0)};
  assign wire4 = (~|{wire1});
  assign wire5 = ($unsigned((((-wire1) ?
                         $unsigned(wire2) : {wire3, wire4}) + wire0)) ?
                     ($signed(({(8'hb3)} ? (|wire1) : $signed(wire4))) ?
                         ((8'h9d) ?
                             (8'h9e) : wire0[(1'h1):(1'h1)]) : (8'h9f)) : $signed($signed(($signed(wire3) || $unsigned(wire2)))));
  module6 #() modinst72 (.wire9(wire2), .wire8(wire5), .wire7(wire1), .y(wire71), .wire10(wire3), .clk(clk));
  assign wire73 = (~^(wire71 ?
                      (~|(~&$signed((8'hb7)))) : (~(wire5[(1'h0):(1'h0)] ?
                          (~&wire5) : $signed(wire5)))));
  module74 #() modinst113 (.wire76(wire2), .wire78(wire1), .wire75(wire73), .clk(clk), .y(wire112), .wire77(wire0));
endmodule

module module74
#(parameter param111 = ({{((~^(8'hb5)) ? {(8'ha9), (8'ha1)} : ((8'hb3) ? (8'ha2) : (8'ha1))), (-{(8'ha2), (8'haf)})}} ? (~((((8'hbb) ? (8'ha5) : (8'h9e)) + ((7'h43) & (8'hae))) ? {((8'had) >= (8'hae))} : (((8'ha0) ? (8'ha5) : (8'haa)) || ((8'hb4) <= (8'hb3))))) : (~|(8'hb5))))
(y, clk, wire75, wire76, wire77, wire78);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire75;
  input wire [(4'ha):(1'h0)] wire76;
  input wire signed [(5'h11):(1'h0)] wire77;
  input wire [(4'hf):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire80;
  wire signed [(4'h8):(1'h0)] wire81;
  wire signed [(3'h7):(1'h0)] wire109;
  assign y = {wire79, wire80, wire81, wire109, (1'h0)};
  assign wire79 = wire77;
  assign wire80 = wire79;
  assign wire81 = ({({$signed(wire79), (wire78 > wire76)} ?
                              wire76 : (wire79[(2'h2):(1'h1)] ?
                                  wire78[(4'h9):(4'h8)] : (~|(8'hac)))),
                          wire78[(4'hc):(3'h7)]} ?
                      wire75 : (^$unsigned($unsigned((wire75 * wire76)))));
  module82 #() modinst110 (.wire86(wire81), .wire84(wire79), .wire87(wire80), .y(wire109), .clk(clk), .wire83(wire77), .wire85(wire76));
endmodule

module module6
#(parameter param69 = (((+({(7'h42), (8'ha6)} & ((8'haa) ? (8'ha4) : (8'haa)))) ? {((~|(8'hb8)) ? ((8'h9d) <= (8'hb6)) : (|(8'hbd))), (~^((8'hb4) >= (7'h42)))} : (~&((~|(8'ha3)) >= ((8'ha2) * (8'hb2))))) < ((~|({(8'ha2)} ? {(8'hbc), (8'ha9)} : {(7'h41)})) ? ((((8'hac) != (8'hba)) & (7'h43)) ? (~&((8'ha0) ~^ (8'hba))) : (&{(8'hb1)})) : (((^~(8'hb8)) || (^(8'hbb))) ? {((8'hbf) ? (8'hb8) : (8'ha8)), ((8'haa) ? (7'h41) : (7'h44))} : (((8'hbd) ? (8'hb8) : (8'hbf)) && (~^(8'hb3)))))), 
parameter param70 = param69)
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h1b6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire68;
  wire [(3'h4):(1'h0)] wire67;
  wire [(2'h3):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire63;
  wire signed [(5'h11):(1'h0)] wire62;
  wire [(4'hb):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire11;
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire46,
                 wire30,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg60,
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
                 (1'h0)};
  assign wire11 = (wire9 > $signed(wire10));
  assign wire12 = wire11;
  assign wire13 = (({$signed((7'h41))} ^ ($signed($signed(wire10)) & $signed($signed(wire8)))) || (wire8[(2'h2):(2'h2)] >> ($unsigned(wire10[(4'hb):(3'h7)]) ?
                      ($unsigned(wire12) >= (wire10 ?
                          wire8 : wire9)) : $signed({wire8, wire12}))));
  assign wire14 = wire10[(4'ha):(4'ha)];
  assign wire15 = ((wire10 ?
                      $signed({(wire12 ?
                              (8'ha5) : wire9)}) : ($unsigned((~^wire9)) && wire10[(1'h1):(1'h1)])) || $signed(((8'h9c) >>> $unsigned({wire10}))));
  assign wire16 = $unsigned((~(|(~^wire9[(3'h5):(2'h3)]))));
  always
    @(posedge clk) begin
      reg17 <= ((~^$unsigned((~((8'ha1) ?
          wire12 : wire10)))) && (~$unsigned((+$unsigned((8'haf))))));
      if ((~((wire15 ?
          ($unsigned(wire8) ?
              $unsigned(wire7) : ((8'ha3) ?
                  wire16 : wire11)) : (~&$unsigned(wire11))) <<< (($signed(reg17) >= wire14) ?
          $unsigned((+wire9)) : $unsigned((wire16 || wire13))))))
        begin
          if ((~&wire12))
            begin
              reg18 <= (&($unsigned($unsigned($signed(wire9))) ~^ (((wire10 ?
                      wire15 : wire10) ?
                  (wire12 << wire8) : (8'ha4)) != $unsigned($signed(wire13)))));
            end
          else
            begin
              reg18 <= {$unsigned($unsigned((!{(8'haf)}))),
                  reg18[(2'h2):(1'h0)]};
              reg19 <= $unsigned((8'h9c));
            end
          if ({{(|$unsigned({wire11})), reg17[(3'h4):(3'h4)]}})
            begin
              reg20 <= wire14[(3'h4):(1'h1)];
              reg21 <= ((^$signed((wire14 & (wire15 ?
                  wire11 : reg19)))) ^~ ($unsigned($unsigned($unsigned(wire11))) << ((^(~&wire16)) ?
                  $signed($unsigned(wire14)) : $signed(reg18[(2'h3):(1'h0)]))));
              reg22 <= $signed((($signed(wire8[(4'h8):(3'h7)]) != {(~^wire11)}) <<< reg19));
              reg23 <= reg20[(4'hb):(4'h8)];
              reg24 <= wire16;
            end
          else
            begin
              reg20 <= reg20[(3'h5):(3'h4)];
              reg21 <= $signed(wire16[(3'h4):(2'h3)]);
              reg22 <= $unsigned({$signed(wire11[(3'h5):(2'h3)])});
            end
          reg25 <= ({$unsigned((wire8[(3'h5):(2'h3)] == (^wire11)))} * (wire13[(3'h5):(1'h0)] >>> (8'hb6)));
          reg26 <= wire8[(1'h0):(1'h0)];
          reg27 <= $signed(reg19[(1'h0):(1'h0)]);
        end
      else
        begin
          if (reg19[(3'h4):(2'h2)])
            begin
              reg18 <= reg19[(3'h4):(1'h0)];
            end
          else
            begin
              reg18 <= $unsigned(wire15[(2'h3):(1'h0)]);
              reg19 <= (^~($signed((~wire15[(2'h3):(1'h1)])) || ($unsigned({reg23}) >= $unsigned((8'hb6)))));
              reg20 <= wire7[(2'h3):(1'h0)];
              reg21 <= $signed($unsigned((8'hb8)));
            end
          reg22 <= $signed(((wire9[(4'hf):(4'h8)] ?
              (^~$signed(reg26)) : $unsigned((wire14 ?
                  wire13 : wire11))) <= (((8'hbb) ?
              $signed(reg19) : (reg19 ? wire13 : reg22)) < wire14)));
          reg23 <= (reg19[(3'h4):(2'h2)] & (-{$unsigned(wire13),
              ((~|wire11) ? (wire8 >= wire11) : reg22[(3'h5):(3'h5)])}));
          reg24 <= ($unsigned($signed((wire14 > wire14))) ~^ (wire9 - (-(reg27[(2'h2):(2'h2)] ?
              $unsigned(wire11) : $unsigned(reg25)))));
        end
      reg28 <= (!$unsigned($unsigned($unsigned($signed(wire8)))));
      reg29 <= (($unsigned((~&$signed(reg17))) ?
              ((wire7[(2'h3):(2'h2)] >= (wire12 && wire8)) * (wire16[(4'hf):(3'h7)] ?
                  $signed(wire9) : (reg18 - reg28))) : $unsigned($unsigned($unsigned(reg23)))) ?
          $unsigned(reg21[(2'h3):(2'h2)]) : $signed(reg23));
    end
  assign wire30 = $unsigned((^~((reg28[(2'h3):(1'h0)] && $unsigned(wire14)) - (reg20[(2'h3):(1'h1)] >= ((8'hae) == reg28)))));
  module31 #() modinst47 (.wire32(wire9), .y(wire46), .wire34(reg21), .wire36(wire8), .wire33(reg26), .wire35(reg18), .clk(clk));
  always
    @(posedge clk) begin
      reg48 <= $unsigned((((wire15 ? {wire7} : ((8'h9c) ? reg26 : reg19)) ?
              (8'hb9) : reg27) ?
          ($signed((wire11 >= wire9)) ?
              $signed($signed(wire14)) : wire9[(5'h12):(5'h12)]) : wire12));
      reg49 <= wire10[(4'he):(4'hc)];
      if ((-wire14[(3'h5):(1'h0)]))
        begin
          reg50 <= ((^($unsigned(reg49) & ((&reg17) ?
              (reg24 ?
                  reg49 : reg19) : $unsigned(wire8)))) << $signed(($signed((reg21 ?
              wire46 : reg27)) << (reg21 ?
              $signed(reg25) : $unsigned(reg19)))));
        end
      else
        begin
          reg50 <= $signed($signed((&reg49)));
          if ($unsigned(((reg48[(4'h8):(4'h8)] || reg28) ?
              reg21[(3'h7):(3'h6)] : (8'ha7))))
            begin
              reg51 <= (~((8'ha8) & reg21[(5'h10):(3'h4)]));
              reg52 <= $unsigned($unsigned(({wire7[(1'h1):(1'h1)],
                      ((7'h40) ? reg24 : wire14)} ?
                  $unsigned((wire9 ? reg17 : reg17)) : $unsigned(((8'hb1) ?
                      wire9 : reg24)))));
              reg53 <= ((^~wire15) ? (^reg23) : (~&wire11));
              reg54 <= $signed((wire12[(2'h3):(1'h1)] ?
                  ({(reg23 & reg48),
                      $unsigned(reg18)} < (~&(~^reg26))) : ($unsigned((reg53 ?
                      reg49 : reg21)) & ($signed(wire30) + ((8'hb0) ?
                      (8'hb5) : (8'ha6))))));
            end
          else
            begin
              reg51 <= (reg27 ?
                  {$signed(wire10)} : $unsigned(($signed((reg50 ?
                      wire8 : wire7)) + wire8)));
              reg52 <= ((8'h9e) || $unsigned(($signed($unsigned(reg20)) < reg27[(1'h0):(1'h0)])));
              reg53 <= (|wire12[(3'h6):(3'h5)]);
            end
          reg55 <= reg20[(3'h6):(3'h5)];
        end
      reg56 <= (~^(-$signed($unsigned((~^wire9)))));
      reg57 <= reg50[(3'h4):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg58 <= (~&(reg49 << reg20));
      reg59 <= $signed(wire30[(2'h2):(1'h1)]);
      reg60 <= $signed(((reg18 ^~ ($unsigned(reg56) ?
          {reg58} : (reg18 ?
              reg51 : reg59))) == $signed(((wire9 | wire10) || reg49))));
    end
  assign wire61 = reg25[(1'h0):(1'h0)];
  assign wire62 = reg20;
  assign wire63 = (!$unsigned((reg52[(2'h2):(1'h1)] ?
                      ((reg48 ?
                          wire62 : reg26) || {reg26}) : $unsigned((+reg57)))));
  assign wire64 = ({$signed($signed((!reg28)))} ~^ ({(!reg22)} ?
                      $unsigned((~{reg26, wire7})) : reg24[(4'h8):(1'h1)]));
  assign wire65 = wire8[(2'h3):(1'h0)];
  assign wire66 = wire16;
  assign wire67 = {(~|wire7[(3'h4):(1'h0)]),
                      $unsigned($unsigned(($unsigned((7'h40)) ?
                          $signed(wire16) : (wire16 ^~ (8'hbf)))))};
  assign wire68 = wire7;
endmodule

module module31
#(parameter param45 = (|(&({{(8'hb2), (8'ha2)}} + ((~^(8'hb1)) * (^~(8'h9e)))))))
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire36;
  input wire signed [(4'hc):(1'h0)] wire35;
  input wire signed [(5'h10):(1'h0)] wire34;
  input wire signed [(4'ha):(1'h0)] wire33;
  input wire [(4'h8):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire41;
  wire [(4'he):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire37;
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 (1'h0)};
  assign wire37 = $signed(wire35);
  assign wire38 = $signed(wire32[(3'h5):(1'h0)]);
  assign wire39 = (8'h9e);
  assign wire40 = $unsigned((wire34[(3'h6):(3'h4)] ?
                      {$unsigned($unsigned((7'h43)))} : ((!(+wire35)) << ((~wire33) ^~ wire39))));
  assign wire41 = $signed((wire40[(3'h4):(2'h3)] ?
                      (wire33[(2'h2):(1'h1)] != (wire32 ^~ (wire37 ?
                          (7'h42) : wire33))) : (&(8'ha4))));
  assign wire42 = wire37;
  assign wire43 = wire41[(1'h0):(1'h0)];
  assign wire44 = wire36[(3'h6):(3'h5)];
endmodule

module module82  (y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire87;
  input wire [(3'h4):(1'h0)] wire86;
  input wire [(4'ha):(1'h0)] wire85;
  input wire signed [(4'hf):(1'h0)] wire84;
  input wire [(4'hd):(1'h0)] wire83;
  wire [(5'h10):(1'h0)] wire108;
  wire signed [(5'h12):(1'h0)] wire107;
  wire signed [(4'h8):(1'h0)] wire102;
  wire [(3'h4):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire100;
  wire signed [(2'h2):(1'h0)] wire99;
  wire [(4'hb):(1'h0)] wire98;
  wire [(4'hb):(1'h0)] wire97;
  wire [(4'h8):(1'h0)] wire96;
  wire [(5'h13):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire94;
  wire [(3'h4):(1'h0)] wire93;
  wire signed [(4'h8):(1'h0)] wire92;
  wire signed [(5'h12):(1'h0)] wire91;
  wire [(4'ha):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire89;
  wire [(3'h4):(1'h0)] wire88;
  reg [(5'h13):(1'h0)] reg106 = (1'h0);
  reg [(4'ha):(1'h0)] reg105 = (1'h0);
  reg [(3'h4):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg103 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire88 = wire83[(3'h4):(2'h2)];
  assign wire89 = ((wire85[(3'h7):(2'h3)] ?
                          (wire88[(1'h0):(1'h0)] >= wire88) : ({wire87[(4'hd):(3'h6)],
                              ((8'hbf) >= wire88)} ^~ (^~wire84))) ?
                      (wire85[(4'ha):(4'ha)] ?
                          wire85[(3'h6):(3'h4)] : (~|$unsigned(wire86))) : ($signed($signed(wire83)) ^ ($signed((+wire84)) ?
                          (+wire86) : (8'ha4))));
  assign wire90 = ({$signed((~|$signed(wire85))),
                      ($signed((wire86 != wire83)) - {(wire84 ?
                              wire84 : wire86),
                          $signed(wire89)})} >= (($signed(wire86[(1'h0):(1'h0)]) ?
                          wire88 : $signed({wire87})) ?
                      ((~|$signed(wire86)) ?
                          wire87[(5'h12):(2'h3)] : $signed($signed(wire83))) : wire83[(4'h9):(1'h0)]));
  assign wire91 = $signed((((+(^~wire89)) ?
                      ($signed(wire84) ?
                          wire87[(4'ha):(4'h8)] : (wire85 ?
                              wire85 : wire83)) : $signed((!wire83))) << {(wire89 < wire89[(3'h5):(3'h4)]),
                      $signed({wire86, wire86})}));
  assign wire92 = {(!wire88[(2'h3):(2'h3)]), (~&(8'hae))};
  assign wire93 = (~((&wire85[(3'h7):(2'h2)]) != $signed($signed(wire87[(4'hf):(4'he)]))));
  assign wire94 = (~wire91[(2'h3):(2'h2)]);
  assign wire95 = $unsigned(wire85);
  assign wire96 = ($signed($signed(($unsigned(wire87) * (wire91 <<< wire85)))) + $unsigned((wire84 ?
                      ((8'hac) ^~ $unsigned(wire93)) : $signed($unsigned(wire84)))));
  assign wire97 = $unsigned(($unsigned((8'ha8)) ? wire96 : wire94));
  assign wire98 = (wire87[(4'hf):(1'h0)] ? wire92 : (~wire84));
  assign wire99 = $unsigned(wire98);
  assign wire100 = $unsigned((8'hab));
  assign wire101 = (wire94 ? wire94 : (+(~|(!(wire94 ? wire99 : (7'h41))))));
  assign wire102 = (!{(~|{$signed(wire98)}), wire101});
  always
    @(posedge clk) begin
      reg103 <= $unsigned((~&(+($unsigned(wire88) ?
          (wire88 ? wire84 : wire91) : $signed(wire91)))));
      reg104 <= wire98[(2'h2):(1'h1)];
      reg105 <= ($signed((($signed(wire94) >>> $unsigned(wire88)) - wire93[(2'h2):(1'h1)])) ?
          (((+(wire90 <<< wire84)) ?
                  (wire101 ?
                      (8'hab) : (8'ha8)) : ((wire93 * wire95) & wire98[(1'h1):(1'h1)])) ?
              (((wire101 ? wire91 : (8'hbf)) >> (!wire100)) + (&(wire87 ?
                  wire96 : wire85))) : ($unsigned((~|wire88)) ?
                  {(wire86 ?
                          wire87 : wire92)} : $unsigned($signed(wire95)))) : ((((wire94 ?
              wire101 : wire97) << $signed(wire101)) ^ wire83[(4'ha):(3'h7)]) <<< (~|(((8'ha6) != wire102) ?
              (^wire96) : wire83[(3'h5):(3'h4)]))));
      reg106 <= (8'hb4);
    end
  assign wire107 = wire92;
  assign wire108 = ((8'hb4) ?
                       (reg106[(3'h5):(2'h3)] < (8'ha1)) : (($unsigned(((8'ha0) <= wire97)) & $signed((-wire92))) < wire86));
endmodule
