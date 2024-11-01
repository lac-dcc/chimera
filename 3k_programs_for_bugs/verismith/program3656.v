module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1bc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire123;
  wire [(5'h13):(1'h0)] wire122;
  wire [(5'h12):(1'h0)] wire121;
  wire [(2'h3):(1'h0)] wire109;
  wire [(3'h5):(1'h0)] wire108;
  wire [(5'h11):(1'h0)] wire107;
  wire signed [(5'h12):(1'h0)] wire105;
  wire signed [(4'hc):(1'h0)] wire44;
  wire [(3'h7):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire42;
  reg [(5'h12):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg118 = (1'h0);
  reg [(4'hc):(1'h0)] reg117 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg116 = (1'h0);
  reg [(5'h12):(1'h0)] reg115 = (1'h0);
  reg [(2'h3):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg [(5'h12):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg111 = (1'h0);
  reg [(5'h14):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire109,
                 wire108,
                 wire107,
                 wire105,
                 wire44,
                 wire5,
                 wire6,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire42,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg7,
                 reg8,
                 reg9,
                 (1'h0)};
  assign wire5 = $signed(wire1[(4'hd):(3'h7)]);
  assign wire6 = $unsigned($unsigned((wire4 ?
                     ($unsigned(wire3) * (8'had)) : ({wire1} ?
                         (-(8'hb7)) : wire2))));
  always
    @(posedge clk) begin
      reg7 <= wire2[(1'h1):(1'h1)];
      reg8 <= ((8'hb7) >>> $unsigned(($unsigned($signed(wire5)) && wire5[(1'h0):(1'h0)])));
      reg9 <= (({$unsigned(wire2), wire1[(4'h8):(4'h8)]} ?
          $unsigned((8'h9d)) : wire0) != (((((8'hb0) - (8'h9e)) <<< $signed(wire3)) ~^ (^~(&wire1))) ?
          reg7 : reg8));
    end
  assign wire10 = (wire5[(3'h7):(3'h6)] ?
                      (8'hbf) : (wire5[(1'h1):(1'h1)] ^ $unsigned($unsigned($signed(wire6)))));
  assign wire11 = reg8[(4'he):(2'h2)];
  assign wire12 = wire1;
  assign wire13 = wire2[(3'h7):(3'h6)];
  assign wire14 = $unsigned($signed(((^~reg9) ?
                      wire12[(2'h3):(1'h1)] : wire4)));
  assign wire15 = wire0;
  assign wire16 = ($signed(wire15[(4'hc):(4'hc)]) ?
                      (-$unsigned(wire4)) : wire1[(2'h3):(1'h0)]);
  assign wire17 = (((wire4[(1'h1):(1'h1)] ?
                              $signed($signed((8'hb9))) : $unsigned(wire6[(2'h2):(1'h0)])) ?
                          {((^wire0) + $unsigned(wire14)),
                              wire2} : (^~(~|{wire15, wire5}))) ?
                      (wire13[(3'h4):(2'h3)] ?
                          ((&(^~wire13)) * $unsigned((!wire2))) : (!wire10[(1'h1):(1'h1)])) : ((~$signed({wire0})) ?
                          wire4[(1'h1):(1'h0)] : (8'ha1)));
  module18 #() modinst43 (.wire22(wire1), .wire21(wire14), .clk(clk), .wire19(reg8), .y(wire42), .wire20(wire3));
  assign wire44 = (({(reg7 ^~ (|(8'hbe))), (~^wire15)} | $signed(({reg9,
                          (8'ha9)} ^ (wire16 ? (7'h42) : (8'hb3))))) ?
                      $signed(wire4) : ((7'h41) - wire0[(4'h9):(3'h5)]));
  module45 #() modinst106 (wire105, clk, wire14, wire17, wire2, wire0);
  assign wire107 = wire4;
  assign wire108 = $unsigned(wire107);
  assign wire109 = $signed((-$signed(((-(8'hac)) <= $unsigned(wire2)))));
  always
    @(posedge clk) begin
      if (wire107)
        begin
          reg110 <= ($signed({wire12[(1'h1):(1'h0)]}) ~^ wire1[(3'h6):(1'h0)]);
        end
      else
        begin
          reg110 <= $signed((wire109 || (8'ha5)));
          reg111 <= wire14;
          reg112 <= (~((+$signed({wire0, reg110})) ?
              wire13[(5'h11):(1'h0)] : {$unsigned($signed(wire6))}));
        end
      reg113 <= (~|$signed(wire5));
      if ((!$unsigned($signed(((wire108 < reg7) ?
          (wire107 ? wire105 : wire2) : $unsigned(reg9))))))
        begin
          if ((wire11[(2'h2):(1'h1)] ? wire105 : wire12[(4'h8):(1'h0)]))
            begin
              reg114 <= (^wire44);
              reg115 <= ((!reg7) < ((^~{{reg110}}) >>> $signed($signed($unsigned((8'ha8))))));
              reg116 <= $unsigned(wire108);
            end
          else
            begin
              reg114 <= (wire108[(3'h5):(1'h0)] - (&$unsigned(((8'hb2) ?
                  wire10 : wire42))));
              reg115 <= $unsigned(({reg9,
                  ((wire12 ?
                      wire1 : wire12) ^~ $unsigned(wire5))} << $unsigned(($unsigned(reg112) * (&wire11)))));
              reg116 <= $signed(wire42);
              reg117 <= ($unsigned(wire17[(4'h8):(3'h6)]) ?
                  (-(wire1[(1'h0):(1'h0)] ?
                      wire108 : (8'hb7))) : $unsigned({(^(|reg115)),
                      reg7[(3'h4):(1'h1)]}));
              reg118 <= {reg110};
            end
        end
      else
        begin
          reg114 <= (~|wire13);
          reg115 <= ((8'h9e) ?
              (|$unsigned(wire5[(2'h3):(2'h2)])) : (-$unsigned(((wire17 ?
                      wire5 : (8'h9f)) ?
                  (8'ha7) : wire5[(3'h6):(1'h0)]))));
          reg116 <= $unsigned($unsigned((~{(reg8 - wire17), (~&wire0)})));
          reg117 <= $unsigned(($signed({(wire42 ?
                  wire1 : wire107)}) & ((~|(wire14 + wire1)) ?
              {{reg117, wire107}, (reg117 ? wire1 : wire105)} : (wire17 ?
                  wire13[(1'h1):(1'h0)] : $unsigned(wire109)))));
        end
      reg119 <= (~&$unsigned(wire17[(2'h3):(1'h1)]));
      reg120 <= wire17;
    end
  assign wire121 = (wire14 >= $signed($signed($unsigned($signed(reg118)))));
  assign wire122 = ((!{((wire10 >= reg116) ^ $signed(reg120)),
                       ($signed(wire121) >= reg112[(1'h1):(1'h1)])}) <<< wire109[(2'h3):(1'h1)]);
  assign wire123 = (|$signed({($signed((8'ha8)) + (+wire6)),
                       (~&$signed(reg7))}));
endmodule

module module45
#(parameter param104 = (+((&(^~((8'h9d) ? (7'h44) : (8'ha8)))) ? (7'h43) : (((~(7'h44)) <<< {(8'ha1)}) & ((!(8'ha8)) ? ((8'hab) ? (8'hac) : (8'h9d)) : ((8'ha7) ? (8'hac) : (8'h9d)))))))
(y, clk, wire46, wire47, wire48, wire49);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire46;
  input wire [(4'h9):(1'h0)] wire47;
  input wire [(5'h14):(1'h0)] wire48;
  input wire signed [(5'h11):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire103;
  wire signed [(4'hf):(1'h0)] wire102;
  wire signed [(4'hb):(1'h0)] wire101;
  wire signed [(3'h5):(1'h0)] wire100;
  wire [(4'h8):(1'h0)] wire99;
  wire [(4'hd):(1'h0)] wire98;
  wire [(3'h6):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire58;
  wire [(3'h4):(1'h0)] wire59;
  wire signed [(3'h5):(1'h0)] wire96;
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire96,
                 (1'h0)};
  assign wire50 = wire49[(5'h10):(4'hc)];
  assign wire51 = ((wire50[(2'h3):(1'h0)] == (!$unsigned(wire49))) << (wire50 > ({wire47,
                      (wire50 + wire48)} ^ (8'h9c))));
  assign wire52 = {(((wire46 ?
                          $unsigned(wire50) : $signed(wire46)) ~^ (~|(wire51 | wire51))) & ((wire51 ?
                              (wire49 ^~ wire46) : (|wire46)) ?
                          $signed($unsigned(wire51)) : wire47)),
                      wire49[(3'h7):(2'h3)]};
  assign wire53 = $unsigned($signed((wire48 & ((!wire51) & (wire51 ?
                      wire52 : wire49)))));
  assign wire54 = $unsigned(({wire51[(4'hb):(4'ha)]} ?
                      ((wire50[(3'h4):(3'h4)] ?
                          ((8'ha7) ?
                              wire49 : wire46) : $signed(wire48)) < $unsigned(wire50)) : wire50));
  assign wire55 = wire49[(4'hf):(4'h9)];
  assign wire56 = wire55;
  assign wire57 = wire53[(3'h4):(2'h3)];
  assign wire58 = (wire54[(3'h6):(2'h2)] ?
                      {(!$unsigned((8'had)))} : wire50[(3'h5):(3'h5)]);
  assign wire59 = $unsigned($unsigned({(wire53 > $signed(wire53)),
                      $unsigned((wire57 <= wire48))}));
  module60 #() modinst97 (.clk(clk), .y(wire96), .wire64(wire51), .wire62(wire48), .wire65(wire55), .wire63(wire47), .wire61(wire58));
  assign wire98 = {($unsigned(wire47) ?
                          $unsigned((^~wire47)) : ((~&(wire53 ~^ wire96)) ?
                              (~&(wire47 * wire50)) : ({wire96} ?
                                  wire50 : (wire47 ~^ (8'hb3))))),
                      wire53[(3'h4):(2'h2)]};
  assign wire99 = (!(wire54 ?
                      (|(wire54[(4'hd):(3'h4)] ?
                          $signed(wire46) : (^~wire52))) : (wire96 ~^ wire52[(1'h1):(1'h1)])));
  assign wire100 = ((~|({(|wire98), wire47[(1'h1):(1'h0)]} ?
                           (&(wire50 >> wire55)) : {((7'h44) >> wire50)})) ?
                       {wire49} : (wire98[(3'h5):(2'h2)] ?
                           $signed((wire46 ?
                               (8'hb4) : ((8'hb4) || wire54))) : wire55));
  assign wire101 = (((^$unsigned({wire58, wire57})) ?
                       (|((8'hb0) ?
                           $unsigned(wire59) : (~^wire50))) : ($signed((wire52 <= wire52)) ?
                           $signed({wire54,
                               wire48}) : wire56[(1'h0):(1'h0)])) > $signed(((-$signed(wire100)) != ($signed(wire98) >> (-wire50)))));
  assign wire102 = wire58;
  assign wire103 = $signed(($unsigned(wire53) ?
                       wire52 : (-$signed(wire46[(3'h4):(2'h3)]))));
endmodule

module module18
#(parameter param41 = ((((+{(8'hb5), (8'ha7)}) <<< (&(+(8'hb1)))) >> (((!(8'hb6)) != (^~(8'hbe))) ? (((8'ha2) < (8'hae)) || (~&(8'hb8))) : (((8'h9e) >> (7'h43)) && (^(8'hb1))))) - (7'h42)))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire22;
  input wire [(5'h12):(1'h0)] wire21;
  input wire signed [(4'he):(1'h0)] wire20;
  input wire [(3'h6):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire23;
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  assign y = {wire40,
                 wire25,
                 wire24,
                 wire23,
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
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire23 = (wire20 + ($unsigned(((wire21 ?
                          wire22 : (8'hb3)) | $unsigned(wire22))) ?
                      wire20 : (!(wire21[(4'hd):(2'h2)] ~^ wire22[(4'hb):(3'h4)]))));
  assign wire24 = (!(wire23[(1'h1):(1'h0)] >>> wire19));
  assign wire25 = (|(wire23[(1'h0):(1'h0)] >= $signed(((wire20 ?
                          wire21 : (8'hba)) ?
                      $unsigned(wire22) : (wire19 || wire21)))));
  always
    @(posedge clk) begin
      if (((~$signed({wire20[(3'h6):(3'h5)]})) <= ((wire21[(4'hc):(3'h5)] != $unsigned(wire24[(3'h7):(2'h3)])) << wire25[(4'ha):(1'h1)])))
        begin
          reg26 <= $unsigned(wire21[(4'he):(4'hb)]);
          reg27 <= wire24;
          reg28 <= (($signed(reg27[(2'h3):(1'h0)]) ?
              $signed(wire20[(3'h6):(3'h6)]) : (wire20 >> (8'hb2))) ^ $unsigned({($unsigned(wire25) ?
                  wire25[(1'h1):(1'h0)] : wire25[(2'h2):(1'h0)])}));
          reg29 <= $unsigned(wire19);
          reg30 <= $signed(wire19);
        end
      else
        begin
          if ($signed((~&reg27)))
            begin
              reg26 <= wire24[(4'hb):(4'h9)];
              reg27 <= $unsigned($signed(({(wire23 >= (8'ha3)),
                  wire20} - ($unsigned(wire23) >= $signed(wire23)))));
              reg28 <= wire21;
              reg29 <= (~|$signed(((wire21[(1'h0):(1'h0)] ?
                      (reg26 ^ reg27) : {reg26, (7'h41)}) ?
                  wire22 : reg28)));
              reg30 <= ($unsigned($unsigned($unsigned((~|wire24)))) ?
                  (!wire25[(1'h0):(1'h0)]) : $unsigned(reg30[(3'h5):(3'h5)]));
            end
          else
            begin
              reg26 <= (~|$unsigned((reg28[(3'h4):(3'h4)] ?
                  (wire22 != {wire25, wire20}) : wire24)));
              reg27 <= $unsigned(((8'hb0) & (!wire25[(4'hb):(3'h5)])));
              reg28 <= {((^((wire19 ? (8'hb8) : wire22) ?
                          (wire20 ? wire21 : reg30) : (reg29 ?
                              reg27 : wire24))) ?
                      (~^(~&{wire21,
                          reg26})) : $unsigned((^~((8'hbf) | reg28))))};
            end
        end
      reg31 <= $signed((8'hbb));
      reg32 <= ($unsigned(wire25) ^ wire25);
      if ((wire20[(4'hb):(4'hb)] || wire19))
        begin
          reg33 <= $unsigned((((wire23 + reg28) ?
              reg31 : (reg27 ?
                  (wire25 ?
                      wire23 : (8'hb3)) : (reg26 && wire20))) <<< $unsigned($unsigned($signed(reg29)))));
          reg34 <= (reg29 > (reg27[(2'h2):(1'h1)] | wire24[(4'hb):(1'h1)]));
        end
      else
        begin
          reg33 <= ((&reg33) ?
              (($signed($signed(reg32)) ?
                      ((!wire23) >= $unsigned(wire21)) : {(reg29 && wire23)}) ?
                  reg30 : ($unsigned((reg29 > reg32)) ?
                      reg33[(3'h7):(2'h3)] : reg31)) : $unsigned(((reg34[(2'h2):(1'h0)] ?
                  reg33 : (reg31 && reg30)) < $unsigned({(8'hbb)}))));
        end
      reg35 <= wire19;
    end
  always
    @(posedge clk) begin
      reg36 <= $signed($unsigned($signed(((|reg34) ?
          (wire21 ? wire19 : wire23) : $unsigned(wire25)))));
      reg37 <= (((reg31 ?
          $signed($unsigned(wire25)) : {(!reg32)}) <<< $signed(reg26[(1'h0):(1'h0)])) ~^ ($signed($unsigned($signed(reg30))) != $signed(wire21[(3'h5):(2'h2)])));
      reg38 <= reg32[(1'h0):(1'h0)];
      reg39 <= reg35;
    end
  assign wire40 = ((({(reg32 <= wire25), reg39[(2'h2):(2'h2)]} ?
                              ((^(8'h9e)) ?
                                  (wire19 ?
                                      reg31 : wire20) : (~reg26)) : (wire21 << {wire20})) ?
                          reg35[(4'ha):(2'h2)] : $signed({(reg32 <= reg39)})) ?
                      $unsigned((wire23[(2'h3):(2'h2)] ^~ reg29)) : ($signed({$signed(reg36),
                          (reg34 ? (8'h9c) : reg34)}) & $unsigned(((reg37 ?
                              (8'had) : reg30) ?
                          reg33 : (~(8'hbf))))));
endmodule

module module60
#(parameter param95 = (8'hba))
(y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h151):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire65;
  input wire [(4'hc):(1'h0)] wire64;
  input wire signed [(4'h9):(1'h0)] wire63;
  input wire [(5'h11):(1'h0)] wire62;
  input wire [(3'h4):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire94;
  wire [(3'h6):(1'h0)] wire92;
  wire [(4'hc):(1'h0)] wire91;
  wire [(3'h4):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire87;
  wire [(4'h9):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire85;
  wire [(4'hb):(1'h0)] wire84;
  wire signed [(4'hf):(1'h0)] wire83;
  wire signed [(2'h3):(1'h0)] wire82;
  wire [(2'h3):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire80;
  wire signed [(5'h15):(1'h0)] wire79;
  wire [(3'h5):(1'h0)] wire69;
  wire signed [(3'h5):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire66;
  reg signed [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg77 = (1'h0);
  reg [(3'h6):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  assign y = {wire94,
                 wire92,
                 wire91,
                 wire90,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 reg93,
                 reg89,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire66 = wire63[(4'h9):(3'h6)];
  assign wire67 = wire62;
  assign wire68 = $signed($unsigned($unsigned((|(wire62 << wire61)))));
  assign wire69 = (8'hab);
  always
    @(posedge clk) begin
      reg70 <= (wire63 >>> $unsigned($signed(($signed(wire68) ?
          $unsigned(wire66) : (8'ha0)))));
      reg71 <= $signed($unsigned($signed(wire69[(3'h4):(3'h4)])));
      reg72 <= (^~$unsigned((^~(|(wire68 >>> (8'ha6))))));
      if (wire61)
        begin
          if ($unsigned(wire65))
            begin
              reg73 <= (reg71[(3'h5):(2'h2)] ? wire62 : reg70[(2'h3):(1'h1)]);
              reg74 <= reg71;
              reg75 <= (~^($signed($signed((reg73 == reg74))) ?
                  ($signed((+wire62)) ~^ $unsigned(reg72)) : (~|$unsigned((wire65 ?
                      wire62 : wire68)))));
              reg76 <= wire64[(2'h3):(1'h1)];
              reg77 <= (($unsigned((^{reg75,
                  (8'hbe)})) << {reg75[(5'h10):(3'h7)],
                  {(reg72 ? (7'h40) : (8'hbc)),
                      reg74[(3'h4):(2'h3)]}}) >>> wire66[(4'h9):(3'h4)]);
            end
          else
            begin
              reg73 <= reg70[(3'h5):(2'h3)];
              reg74 <= wire64[(1'h0):(1'h0)];
              reg75 <= $signed(((wire62[(5'h10):(4'he)] && (((8'hae) ?
                          wire63 : (8'ha4)) ?
                      (^~wire63) : {reg74, reg77})) ?
                  (($signed(wire62) >= ((8'hbd) && reg74)) != $unsigned($signed(wire63))) : ($unsigned((-reg74)) ?
                      $signed(wire65[(3'h5):(1'h1)]) : $signed(wire68[(1'h0):(1'h0)]))));
              reg76 <= {(reg71[(5'h11):(1'h1)] >>> $unsigned(reg71)),
                  ((~^{(^reg74)}) <<< wire63)};
            end
          reg78 <= (((wire61[(3'h4):(2'h2)] < wire62) ?
                  (({reg72} != (wire62 ? reg71 : reg71)) ?
                      $signed($signed(wire66)) : $signed({wire65,
                          reg70})) : (8'h9c)) ?
              $unsigned($unsigned({{reg70}})) : ((8'ha6) ?
                  reg73[(2'h2):(2'h2)] : reg77[(1'h1):(1'h0)]));
        end
      else
        begin
          reg73 <= $unsigned($unsigned(($unsigned((reg72 <<< wire66)) ?
              $signed($signed(reg74)) : ((~&(8'haf)) + $signed(wire65)))));
        end
    end
  assign wire79 = $signed(reg74[(4'h9):(2'h3)]);
  assign wire80 = (7'h40);
  assign wire81 = (+(~$signed(((wire67 ? (8'hb3) : wire62) ?
                      $unsigned(reg71) : (reg76 ? (8'hae) : reg70)))));
  assign wire82 = reg70;
  assign wire83 = ((reg75[(3'h4):(2'h3)] && (~($signed(wire81) == {wire79}))) ?
                      {(reg73 ?
                              ((reg77 ?
                                  reg74 : reg71) > reg74[(3'h6):(2'h2)]) : {(|reg75),
                                  $signed(wire61)})} : $unsigned($signed((^~(reg73 & reg77)))));
  assign wire84 = $unsigned({(8'ha9), $unsigned((~^wire63[(3'h4):(1'h0)]))});
  assign wire85 = (($signed($unsigned((-wire67))) ?
                      $signed((+(wire80 <= wire83))) : {(~|$signed(reg77))}) ~^ $signed($unsigned(($unsigned((7'h42)) ?
                      (^wire81) : (reg70 && wire67)))));
  assign wire86 = (($signed($signed(reg78)) ? wire62 : (7'h41)) ?
                      $unsigned(wire79[(3'h4):(2'h2)]) : $unsigned(reg75));
  assign wire87 = reg74[(5'h11):(4'hb)];
  assign wire88 = $unsigned((!(reg73[(1'h0):(1'h0)] > wire86)));
  always
    @(posedge clk) begin
      reg89 <= reg76[(1'h0):(1'h0)];
    end
  assign wire90 = $signed({(((~^wire67) == wire63[(3'h4):(2'h2)]) >= (|$unsigned(reg70)))});
  assign wire91 = (8'ha2);
  assign wire92 = (((~^(^~(reg77 ? wire83 : wire85))) ?
                      $unsigned($unsigned($unsigned(wire84))) : wire64[(3'h4):(2'h2)]) | ($unsigned((~{wire81})) ^ $unsigned(((wire81 ?
                          (8'hbb) : wire83) ?
                      wire65[(3'h6):(3'h5)] : $unsigned(wire86)))));
  always
    @(posedge clk) begin
      reg93 <= reg74[(5'h11):(1'h1)];
    end
  assign wire94 = wire92[(3'h4):(1'h1)];
endmodule
