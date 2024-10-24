module top
#(parameter param127 = ({(^(((8'ha8) ? (8'had) : (8'hb3)) != {(8'ha3), (8'ha7)}))} > ({(((8'hb0) ? (8'hbf) : (8'hae)) ~^ {(8'ha3)})} >= ((~&{(8'hb6)}) ? {(^(7'h40))} : {(^~(7'h40))}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  wire signed [(4'h8):(1'h0)] wire125;
  wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire123;
  reg [(4'he):(1'h0)] reg126 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  assign y = {wire125,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire13,
                 wire14,
                 wire15,
                 wire123,
                 reg126,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = (~wire0[(3'h5):(3'h4)]);
  assign wire5 = wire3;
  assign wire6 = $signed((^~{(((8'ha2) ^~ wire3) ? (wire3 <= wire3) : (8'hac)),
                     $signed((7'h42))}));
  assign wire7 = $unsigned(wire5[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg8 <= $signed({(&(!$signed(wire7)))});
      reg9 <= {{$signed((wire4 < $unsigned(wire3))),
              {wire1, {(wire6 >> wire1)}}}};
      reg10 <= reg9;
      if (((wire7 ? wire5[(3'h4):(1'h0)] : wire3[(3'h6):(3'h4)]) ?
          (7'h44) : ({$signed({(8'hac)})} ? wire2[(3'h4):(2'h2)] : wire6)))
        begin
          reg11 <= wire1;
        end
      else
        begin
          reg11 <= $signed(wire2[(2'h3):(1'h0)]);
          reg12 <= ((^((reg8[(1'h0):(1'h0)] ?
                      $signed(wire3) : (wire0 ? wire4 : wire3)) ?
                  wire4[(3'h4):(1'h0)] : (&(reg11 ? wire3 : wire2)))) ?
              $signed($unsigned(wire2[(1'h1):(1'h1)])) : $signed((~^(!(~(8'hba))))));
        end
    end
  assign wire13 = (wire3[(1'h0):(1'h0)] ?
                      {(((~|reg10) + ((8'hb2) ?
                              reg11 : (8'hb5))) ~^ reg11)} : ({(+wire5[(2'h3):(1'h1)]),
                          $unsigned(wire2)} >>> {(reg9 <= $signed((8'ha7)))}));
  assign wire14 = wire7;
  assign wire15 = (reg8[(3'h5):(1'h1)] << $unsigned((wire3 ^~ wire2[(3'h6):(2'h3)])));
  module16 #() modinst124 (.wire18(wire4), .wire17(reg11), .clk(clk), .wire21(wire7), .wire20(reg10), .y(wire123), .wire19(wire13));
  assign wire125 = (|{((&$signed(wire6)) & $unsigned($unsigned(wire2))),
                       ($unsigned({(7'h44)}) ?
                           wire1 : ((wire14 ? wire123 : wire5) & {wire1,
                               wire6}))});
  always
    @(posedge clk) begin
      reg126 <= (&($signed((~&$unsigned(wire14))) && reg12[(4'hc):(1'h1)]));
    end
endmodule

module module16
#(parameter param121 = (((^(-((8'ha9) ? (8'hb4) : (8'hb9)))) < (^(((8'ha0) ? (8'hab) : (8'ha0)) <= ((7'h40) ? (8'hbc) : (8'hbd))))) ? ({(((8'hb6) ? (8'hb5) : (8'hb4)) ? (+(7'h42)) : ((8'hba) ? (8'ha4) : (7'h43))), (+((8'ha4) && (8'hbf)))} ? ({(^(8'ha9))} ? ({(7'h40), (7'h42)} + ((8'hab) >= (8'ha6))) : (~^(~&(8'hac)))) : (~&(^((8'hb1) * (8'hb0))))) : (((|(|(8'hbe))) + {((8'ha9) * (8'ha1))}) ? (|((~^(8'hb2)) < {(8'ha2), (8'hb3)})) : ({((8'h9e) ? (8'ha3) : (8'ha5)), (&(8'hba))} == (((7'h44) ? (8'h9c) : (8'hb0)) ? ((8'hbf) ? (8'had) : (8'hbd)) : ((7'h44) ? (8'hb5) : (7'h44)))))), 
parameter param122 = param121)
(y, clk, wire17, wire18, wire19, wire20, wire21);
  output wire [(32'h199):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire17;
  input wire signed [(5'h12):(1'h0)] wire18;
  input wire [(5'h13):(1'h0)] wire19;
  input wire [(4'hc):(1'h0)] wire20;
  input wire [(4'ha):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire35;
  wire [(2'h2):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire37;
  wire signed [(4'he):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire70;
  wire signed [(5'h14):(1'h0)] wire72;
  wire signed [(4'hb):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire87;
  wire signed [(3'h6):(1'h0)] wire88;
  wire signed [(2'h2):(1'h0)] wire119;
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  assign y = {wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire39,
                 wire70,
                 wire72,
                 wire73,
                 wire74,
                 wire75,
                 wire87,
                 wire88,
                 wire119,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
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
                 reg32,
                 reg33,
                 reg38,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg22 <= wire21;
      reg23 <= (wire17 == wire18);
      if (reg22)
        begin
          if ({(~&wire18[(4'hd):(2'h3)])})
            begin
              reg24 <= wire17[(5'h10):(2'h2)];
              reg25 <= (wire19[(1'h1):(1'h0)] ?
                  ($unsigned((~^wire21)) >> wire19) : $signed((+$unsigned({(8'hbf)}))));
              reg26 <= reg23[(2'h2):(2'h2)];
              reg27 <= {$unsigned(wire17[(5'h11):(4'hd)]), reg23};
              reg28 <= {$unsigned(wire18), {(|wire18[(4'h8):(4'h8)])}};
            end
          else
            begin
              reg24 <= $unsigned((8'h9d));
              reg25 <= {reg23[(2'h2):(2'h2)]};
              reg26 <= wire21;
            end
          if ($unsigned($signed((-(wire18 ?
              reg25 : (wire19 ? wire20 : reg25))))))
            begin
              reg29 <= $signed($unsigned((&(8'hbb))));
              reg30 <= ($signed($unsigned($signed((reg22 <= wire20)))) * (-wire21));
            end
          else
            begin
              reg29 <= $unsigned((wire19 ?
                  $signed(((^~reg27) ?
                      reg26[(2'h2):(1'h1)] : reg23[(3'h4):(2'h2)])) : ((reg28 >> reg27[(4'h8):(3'h4)]) <<< wire21)));
            end
        end
      else
        begin
          if ($unsigned($unsigned((^~(~^(8'ha7))))))
            begin
              reg24 <= reg26;
              reg25 <= (~&($unsigned(((reg26 ~^ reg25) ?
                  $signed(reg30) : reg26[(1'h0):(1'h0)])) << (~&wire20[(2'h3):(2'h3)])));
              reg26 <= {($unsigned(((-reg30) ?
                          reg29 : (reg29 ? (7'h42) : reg23))) ?
                      ($unsigned({wire19,
                          wire21}) >> $unsigned((|wire20))) : ($signed($unsigned(wire21)) + ($signed(wire18) != $unsigned((8'hb5))))),
                  {(~$signed(wire20)), (+$signed(wire21[(3'h7):(1'h1)]))}};
              reg27 <= (^~reg23);
            end
          else
            begin
              reg24 <= ((~^$signed(wire20)) ? reg28 : reg29);
              reg25 <= ($signed((wire19[(3'h4):(1'h0)] ^~ (8'ha8))) ?
                  $signed(wire20[(4'h8):(3'h7)]) : {(~|$signed({wire17,
                          reg26})),
                      (($unsigned((8'haa)) << reg24) ?
                          (-(wire19 ? wire21 : reg23)) : ($unsigned((8'hab)) ?
                              (wire19 + wire19) : {reg23, wire19}))});
              reg26 <= ($signed($signed(((&reg25) | $signed(reg24)))) < $unsigned($unsigned(((reg27 + reg23) * reg24[(2'h2):(1'h0)]))));
            end
          reg28 <= ((reg26 ?
              reg29 : ($unsigned($signed(wire21)) - (^(~reg29)))) ^ reg29);
        end
    end
  always
    @(posedge clk) begin
      reg31 <= $signed({wire20});
      reg32 <= $unsigned(reg29);
      reg33 <= $signed((+reg22[(1'h0):(1'h0)]));
    end
  assign wire34 = (reg27 ^ $unsigned((((~&wire21) && (reg26 ? wire19 : reg23)) ?
                      {wire19[(4'he):(4'h9)]} : reg25[(1'h0):(1'h0)])));
  assign wire35 = reg31;
  assign wire36 = wire21;
  assign wire37 = reg30;
  always
    @(posedge clk) begin
      reg38 <= $signed((wire34[(2'h2):(1'h1)] ?
          (($unsigned(wire20) ?
              (~&(8'h9d)) : (reg27 ?
                  wire37 : wire37)) * wire20) : (~^((reg32 & reg22) ?
              (reg31 ? reg25 : reg23) : wire21[(2'h3):(1'h0)]))));
    end
  assign wire39 = reg22;
  module40 #() modinst71 (wire70, clk, reg28, reg31, reg24, wire39, wire19);
  assign wire72 = (8'hbb);
  assign wire73 = ($unsigned($unsigned(({reg28, wire35} ?
                      (8'h9f) : $unsigned((8'hba))))) <<< reg30);
  assign wire74 = ((+(({reg26} ~^ (^reg26)) && {wire34,
                      wire34})) <= (({(wire20 ? reg27 : reg26)} ?
                          (reg30 ?
                              (reg26 ^~ wire21) : {wire19,
                                  reg28}) : $signed(reg25)) ?
                      ($signed($signed(wire21)) ?
                          ((~reg25) ^ $signed(wire19)) : reg28[(4'h9):(1'h0)]) : ((~&reg27[(3'h5):(2'h2)]) ?
                          wire35[(3'h7):(2'h3)] : (8'hbc))));
  assign wire75 = (((~|reg25) == $unsigned({(reg31 ? wire39 : wire34),
                          (-wire35)})) ?
                      ((wire20 ?
                              $unsigned((~^wire20)) : ($signed((8'ha8)) + $signed((8'hba)))) ?
                          $unsigned(((reg29 ? reg33 : reg38) ?
                              (reg29 >>> (8'h9e)) : $signed(wire19))) : $signed(((8'had) ?
                              (wire17 | wire70) : {(8'ha3)}))) : $unsigned(((~^wire18) < $signed(((8'ha5) << wire21)))));
  always
    @(posedge clk) begin
      reg76 <= ((^(wire37[(4'ha):(1'h1)] != (&reg38[(2'h2):(2'h2)]))) ?
          (^{((~&(8'ha7)) ? reg29[(3'h5):(1'h1)] : $signed(wire75)),
              $unsigned(reg27)}) : (!reg28[(4'h9):(3'h4)]));
      if ((($unsigned(reg25) ?
              ((8'hb2) <<< ((8'hb9) ?
                  (!reg29) : wire36[(1'h1):(1'h1)])) : ((reg30[(3'h7):(2'h3)] ?
                      $signed(wire72) : $unsigned(wire72)) ?
                  reg32 : $unsigned(wire73))) ?
          wire74 : wire35))
        begin
          reg77 <= ({(($signed((8'hbe)) >= (~&wire75)) ^ {(reg30 | reg76),
                      (reg31 << wire70)})} ?
              wire39[(1'h0):(1'h0)] : $unsigned(($unsigned($unsigned(reg28)) && wire75)));
          reg78 <= (8'h9e);
          reg79 <= $signed(wire70);
          reg80 <= reg24;
          reg81 <= wire19[(4'hc):(3'h6)];
        end
      else
        begin
          if ($signed($unsigned(wire73[(3'h5):(3'h5)])))
            begin
              reg77 <= ({(~|(!(reg26 ?
                      reg23 : wire73)))} * (~((8'hbc) ~^ (8'hbd))));
              reg78 <= ((|$unsigned(reg24[(1'h0):(1'h0)])) & {(!{{wire39,
                          reg30}}),
                  {((reg76 ? reg23 : reg28) != {(8'ha9), reg38}), reg81}});
              reg79 <= {($signed(($signed(wire20) <= (wire21 ^ reg23))) ?
                      wire18 : (~^((reg31 ? reg28 : wire35) <<< (!wire17))))};
            end
          else
            begin
              reg77 <= $unsigned((8'h9f));
              reg78 <= (({$unsigned($unsigned(wire20)), (~reg22)} + wire72) ?
                  $unsigned(reg33[(3'h6):(2'h3)]) : (reg31[(3'h7):(3'h6)] && reg27[(1'h0):(1'h0)]));
              reg79 <= {reg28[(4'hd):(2'h2)]};
              reg80 <= $signed((8'ha3));
            end
          if ((((^$unsigned((reg79 ? reg33 : reg22))) ?
              reg32 : (~|($signed((8'hb2)) & {(7'h42),
                  (8'h9d)}))) << $signed($unsigned(reg30[(4'h8):(2'h2)]))))
            begin
              reg81 <= wire21[(4'ha):(3'h4)];
            end
          else
            begin
              reg81 <= (reg25 ?
                  $unsigned((^$signed(reg81))) : ($signed(reg81) ^ $unsigned(reg30[(1'h0):(1'h0)])));
              reg82 <= wire17[(1'h1):(1'h0)];
            end
          reg83 <= $signed(((reg80 ?
                  ((reg23 ? wire39 : reg77) ?
                      $unsigned(reg78) : $signed(wire74)) : (~&$unsigned(wire73))) ?
              $unsigned(reg38) : ($signed(reg27) ?
                  $unsigned((reg33 ? reg80 : reg81)) : reg27[(1'h1):(1'h1)])));
          reg84 <= (wire75 >>> $unsigned($signed($signed({reg32, wire19}))));
        end
      reg85 <= $signed(($signed((wire34[(2'h2):(1'h0)] ?
          reg81[(3'h4):(1'h0)] : ((8'ha7) ^ reg32))) && (8'hb4)));
      reg86 <= {(~&$unsigned($signed(wire73[(4'ha):(2'h3)]))),
          $unsigned((($unsigned(wire19) >> $unsigned(reg23)) ?
              $unsigned($unsigned(wire17)) : $signed(reg81)))};
    end
  assign wire87 = ($unsigned($unsigned((wire74 ?
                          reg85[(1'h0):(1'h0)] : $signed(reg81)))) ?
                      wire18[(3'h6):(1'h1)] : $signed(reg84));
  assign wire88 = ((($unsigned((~|wire35)) <= $unsigned(reg80[(4'ha):(3'h4)])) >>> $signed({reg76})) ?
                      reg32 : reg82);
  module89 #() modinst120 (wire119, clk, wire18, reg31, reg29, reg23, reg82);
endmodule

module module89  (y, clk, wire94, wire93, wire92, wire91, wire90);
  output wire [(32'h133):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire94;
  input wire [(4'he):(1'h0)] wire93;
  input wire signed [(5'h11):(1'h0)] wire92;
  input wire signed [(5'h12):(1'h0)] wire91;
  input wire signed [(2'h2):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire118;
  wire [(4'hb):(1'h0)] wire117;
  wire signed [(5'h14):(1'h0)] wire116;
  wire [(3'h5):(1'h0)] wire115;
  wire [(5'h15):(1'h0)] wire114;
  wire [(4'he):(1'h0)] wire113;
  wire [(3'h7):(1'h0)] wire112;
  wire [(4'h9):(1'h0)] wire111;
  wire [(4'h9):(1'h0)] wire110;
  wire [(2'h2):(1'h0)] wire109;
  wire [(3'h5):(1'h0)] wire108;
  wire signed [(3'h5):(1'h0)] wire107;
  wire signed [(5'h13):(1'h0)] wire106;
  wire signed [(4'hb):(1'h0)] wire105;
  wire signed [(5'h10):(1'h0)] wire104;
  wire signed [(4'hc):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire102;
  wire signed [(5'h14):(1'h0)] wire101;
  wire signed [(4'hd):(1'h0)] wire100;
  wire signed [(2'h2):(1'h0)] wire96;
  wire signed [(5'h14):(1'h0)] wire95;
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(5'h12):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire96,
                 wire95,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire95 = (wire94 ? wire90 : wire91[(4'he):(3'h4)]);
  assign wire96 = $signed(wire95[(5'h10):(2'h3)]);
  always
    @(posedge clk) begin
      reg97 <= (wire90[(2'h2):(1'h0)] <<< wire90);
      reg98 <= $unsigned(((~|wire91[(4'ha):(4'h8)]) || {$unsigned(wire96),
          (!(^wire93))}));
      reg99 <= {(!reg97[(5'h12):(4'h9)])};
    end
  assign wire100 = wire92[(4'h8):(4'h8)];
  assign wire101 = (-$unsigned($signed(reg97[(3'h6):(3'h4)])));
  assign wire102 = (!(($signed($unsigned(reg98)) >> (8'hbd)) - ((|(wire100 ?
                           wire96 : wire92)) ?
                       $signed($unsigned(wire93)) : $unsigned(reg98[(3'h6):(3'h4)]))));
  assign wire103 = {$unsigned((&(~&(+(8'had))))),
                       {wire95, $signed($signed({wire92, reg97}))}};
  assign wire104 = (wire96[(1'h1):(1'h0)] ?
                       {(wire103 ?
                               (~&((8'haf) < wire102)) : (reg97 ?
                                   (wire100 & wire93) : wire101))} : (wire103[(2'h3):(1'h0)] ?
                           wire103[(4'ha):(1'h0)] : (((wire95 >> wire103) ~^ (reg98 != wire90)) == $unsigned($signed(wire103)))));
  assign wire105 = $unsigned($signed(wire102));
  assign wire106 = (+wire100);
  assign wire107 = {(^~($signed(wire103[(2'h3):(1'h0)]) ?
                           {{(8'ha9),
                                   (8'hb7)}} : $signed(((8'hba) == wire104))))};
  assign wire108 = wire105[(3'h4):(1'h1)];
  assign wire109 = ($signed($unsigned((wire94[(3'h4):(2'h2)] ?
                           (^wire104) : wire103[(3'h4):(1'h0)]))) ?
                       wire90 : $unsigned($signed(wire94[(3'h5):(1'h0)])));
  assign wire110 = ($signed($unsigned(wire96[(1'h1):(1'h0)])) ?
                       wire105[(3'h4):(1'h1)] : {(!(~$unsigned((8'ha2))))});
  assign wire111 = (($unsigned((|$unsigned(wire104))) ?
                       wire108 : $unsigned({{wire90}})) - $signed((wire101[(5'h11):(2'h3)] + {$unsigned(wire92),
                       {wire90, (8'hab)}})));
  assign wire112 = ((|(|wire110)) ?
                       {(((wire101 ? wire107 : wire100) ?
                               (wire91 ?
                                   reg98 : reg99) : $signed((8'h9d))) == (^~(8'hb2)))} : wire91[(1'h0):(1'h0)]);
  assign wire113 = $signed((wire108 >> (($unsigned(wire106) ?
                           (~wire103) : (~|reg99)) ?
                       wire95[(5'h11):(1'h1)] : (!{wire112}))));
  assign wire114 = (wire107 ? (7'h41) : $signed(wire92[(4'h8):(1'h1)]));
  assign wire115 = wire103;
  assign wire116 = ((reg98[(2'h3):(2'h3)] ?
                           wire113[(1'h0):(1'h0)] : wire94[(4'hf):(4'hc)]) ?
                       wire94 : (8'ha8));
  assign wire117 = (wire114 ?
                       ((^~(^~$signed(wire104))) != reg97) : {$unsigned(reg97)});
  assign wire118 = wire105;
endmodule

module module40
#(parameter param69 = ((~^(((~|(8'ha1)) ? ((8'h9d) >> (8'hbd)) : ((8'hb5) << (8'h9d))) ? (((8'hb6) <<< (8'ha4)) >> (&(8'hb2))) : {((8'h9d) * (8'hbb))})) ? (+((!(^(8'hb5))) != ((+(8'h9e)) ? {(8'hb5), (8'hb9)} : ((8'hb3) >> (8'hab))))) : (8'ha9)))
(y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire45;
  input wire [(4'h8):(1'h0)] wire44;
  input wire signed [(4'hd):(1'h0)] wire43;
  input wire signed [(4'he):(1'h0)] wire42;
  input wire signed [(5'h13):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire67;
  wire signed [(2'h2):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire56;
  wire [(5'h11):(1'h0)] wire55;
  wire signed [(3'h6):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire47,
                 wire46,
                 reg68,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire46 = ((wire42[(4'hb):(4'h9)] | (8'hb1)) ?
                      (|($unsigned($signed(wire45)) ?
                          (|$unsigned(wire44)) : (((8'hb9) * (8'ha2)) ?
                              {wire41,
                                  wire43} : wire45))) : $unsigned((8'h9d)));
  assign wire47 = wire45;
  always
    @(posedge clk) begin
      reg48 <= {(|(^~$unsigned($signed(wire43))))};
      reg49 <= {wire43, {(&(^$unsigned(wire43))), $unsigned(wire45)}};
      reg50 <= (8'hb2);
      reg51 <= (8'hac);
    end
  assign wire52 = {wire47, reg51};
  assign wire53 = $unsigned((^(|($signed(reg49) ?
                      (~&wire47) : reg51[(3'h4):(2'h2)]))));
  assign wire54 = (~^$signed($unsigned(($signed(wire41) | (|wire41)))));
  assign wire55 = {$signed((($unsigned(wire46) >>> (8'h9d)) ?
                          (reg48 >> (~reg48)) : $unsigned($unsigned(wire45)))),
                      ((~|reg50) ?
                          reg50[(4'h9):(2'h2)] : (|(wire46 ?
                              wire54 : $signed(reg51))))};
  assign wire56 = wire41;
  assign wire57 = $unsigned((|wire45[(2'h2):(1'h1)]));
  assign wire58 = {($unsigned(wire42[(1'h1):(1'h0)]) + {wire41[(4'hf):(2'h3)]}),
                      (((~|(8'h9e)) ?
                          wire54 : $signed($signed(reg48))) + {(wire44 ?
                              {reg48} : (wire53 ? (8'hbc) : wire52))})};
  always
    @(posedge clk) begin
      if (wire46[(4'h9):(1'h1)])
        begin
          if (wire55)
            begin
              reg59 <= $signed($unsigned(wire57[(3'h6):(1'h1)]));
              reg60 <= (8'hb3);
              reg61 <= (~^($unsigned($signed(wire43)) < (wire47 ?
                  reg51 : wire53[(4'hf):(4'hd)])));
              reg62 <= wire56[(2'h3):(2'h2)];
              reg63 <= wire55[(3'h6):(1'h1)];
            end
          else
            begin
              reg59 <= $unsigned((|((|(&reg59)) ~^ $signed(((8'hab) != reg48)))));
              reg60 <= wire41;
            end
        end
      else
        begin
          if (reg60[(1'h1):(1'h1)])
            begin
              reg59 <= (|wire56);
              reg60 <= $unsigned($signed($unsigned($signed(wire55[(3'h6):(1'h0)]))));
              reg61 <= $signed(wire44[(3'h5):(3'h4)]);
            end
          else
            begin
              reg59 <= wire42;
            end
        end
      reg64 <= ({(^($signed(reg63) ? wire42 : (wire46 - wire46)))} + reg48);
      reg65 <= $unsigned(({$unsigned(wire44), {(wire43 ? (8'hab) : wire57)}} ?
          ($unsigned((reg63 ? (8'ha0) : reg64)) == wire52) : $signed((~(wire41 ?
              wire42 : (8'hb8))))));
    end
  assign wire66 = $unsigned((8'hbe));
  assign wire67 = (($signed((~&(reg50 == reg50))) & ((wire46[(3'h6):(1'h0)] ^~ wire52) + (wire46[(3'h7):(1'h0)] ?
                          $unsigned(wire47) : $unsigned(reg50)))) ?
                      (^wire54[(1'h0):(1'h0)]) : wire43);
  always
    @(posedge clk) begin
      reg68 <= wire52[(1'h0):(1'h0)];
    end
endmodule
