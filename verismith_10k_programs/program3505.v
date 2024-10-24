module top
#(parameter param157 = (8'hb6))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire156;
  wire [(4'hf):(1'h0)] wire155;
  wire [(4'hd):(1'h0)] wire154;
  wire signed [(5'h12):(1'h0)] wire152;
  wire signed [(5'h12):(1'h0)] wire151;
  wire signed [(4'hb):(1'h0)] wire150;
  wire [(4'hb):(1'h0)] wire149;
  wire signed [(5'h15):(1'h0)] wire143;
  wire signed [(4'hb):(1'h0)] wire135;
  wire signed [(5'h15):(1'h0)] wire138;
  wire signed [(4'hc):(1'h0)] wire139;
  wire [(5'h12):(1'h0)] wire140;
  wire signed [(3'h6):(1'h0)] wire141;
  reg [(4'he):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg147 = (1'h0);
  reg [(4'hf):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg145 = (1'h0);
  reg [(3'h4):(1'h0)] reg144 = (1'h0);
  reg [(5'h13):(1'h0)] reg137 = (1'h0);
  assign y = {wire156,
                 wire155,
                 wire154,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire143,
                 wire135,
                 wire138,
                 wire139,
                 wire140,
                 wire141,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg137,
                 (1'h0)};
  module5 #() modinst136 (.wire6(wire1), .wire8(wire4), .wire9(wire0), .clk(clk), .wire7(wire2), .y(wire135));
  always
    @(posedge clk) begin
      reg137 <= {$unsigned($signed(wire3[(1'h1):(1'h0)])),
          wire0[(3'h5):(3'h5)]};
    end
  assign wire138 = (~^((($unsigned(wire4) ?
                           $unsigned(reg137) : $unsigned((8'h9e))) >>> (wire0 ?
                           {wire1, wire0} : {(8'hb5)})) ?
                       (~$signed(reg137)) : wire135));
  assign wire139 = wire3;
  assign wire140 = wire139[(3'h6):(3'h6)];
  module5 #() modinst142 (wire141, clk, reg137, wire1, wire0, wire140);
  assign wire143 = (|(8'haa));
  always
    @(posedge clk) begin
      reg144 <= wire141;
      reg145 <= $signed(wire4);
      reg146 <= wire143[(4'ha):(3'h5)];
      reg147 <= reg137;
      reg148 <= wire1[(5'h10):(4'he)];
    end
  assign wire149 = $unsigned(($unsigned(wire143[(4'ha):(4'h9)]) == ($unsigned((wire141 || (8'hbd))) == $signed({wire3,
                       wire140}))));
  assign wire150 = reg146[(3'h4):(2'h2)];
  assign wire151 = $signed(((-((wire139 ?
                       wire150 : reg146) >> (&wire150))) | (wire141 ?
                       wire4[(4'hd):(4'ha)] : (8'hbc))));
  module41 #() modinst153 (.clk(clk), .wire44(reg144), .wire43(wire138), .wire45(reg145), .y(wire152), .wire42(wire1));
  assign wire154 = wire135[(2'h2):(2'h2)];
  assign wire155 = (wire138 ?
                       wire152[(4'hf):(3'h6)] : $signed(wire143[(4'hb):(3'h7)]));
  assign wire156 = $signed($unsigned({($unsigned(wire143) ?
                           (&(8'h9e)) : $signed((8'hb6)))}));
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h21d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire6;
  input wire [(5'h15):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire113;
  wire signed [(5'h11):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire30;
  wire signed [(4'h9):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire37;
  wire signed [(5'h14):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire62;
  wire [(5'h15):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire81;
  wire signed [(4'hf):(1'h0)] wire82;
  wire [(4'ha):(1'h0)] wire111;
  reg [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(4'ha):(1'h0)] reg133 = (1'h0);
  reg [(4'hf):(1'h0)] reg132 = (1'h0);
  reg [(4'hf):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg130 = (1'h0);
  reg [(3'h5):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg123 = (1'h0);
  reg [(2'h3):(1'h0)] reg122 = (1'h0);
  reg signed [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg120 = (1'h0);
  reg signed [(4'he):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg116 = (1'h0);
  reg [(5'h12):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg114 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  assign y = {wire113,
                 wire27,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire57,
                 wire59,
                 wire60,
                 wire61,
                 wire62,
                 wire79,
                 wire81,
                 wire82,
                 wire111,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
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
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg33,
                 reg34,
                 (1'h0)};
  module10 #() modinst28 (wire27, clk, wire6, wire9, wire7, wire8);
  assign wire29 = ((($signed((wire9 + wire7)) ^ $unsigned(wire8)) ?
                      wire27 : $unsigned($signed({(8'hb0)}))) ^ {((~(~wire8)) * $unsigned($signed(wire27))),
                      $signed((|wire6))});
  assign wire30 = (^~wire29[(4'h9):(3'h7)]);
  assign wire31 = wire30;
  assign wire32 = wire8;
  always
    @(posedge clk) begin
      reg33 <= wire8[(3'h5):(2'h3)];
      reg34 <= $signed(((((!wire6) ?
              ((8'ha9) ? wire29 : wire7) : (~|wire29)) ^ $signed((wire8 ?
              wire32 : (8'ha5)))) ?
          (8'had) : $unsigned((~|wire30))));
    end
  assign wire35 = ((^~$signed((8'hb2))) ?
                      $unsigned($unsigned({wire7})) : $signed(($signed((wire27 < wire8)) ^~ ($unsigned((8'h9d)) << (wire27 <= wire9)))));
  assign wire36 = (+$unsigned({{(~&wire31), (wire35 - wire32)}}));
  assign wire37 = reg34;
  assign wire38 = wire32;
  assign wire39 = wire38[(4'h8):(1'h0)];
  assign wire40 = wire31;
  module41 #() modinst58 (wire57, clk, wire35, wire30, wire40, wire31);
  assign wire59 = $unsigned(wire57[(4'h8):(1'h0)]);
  assign wire60 = $unsigned($unsigned((((wire32 & wire40) ?
                          (8'hb9) : $unsigned(wire38)) ?
                      $unsigned(((8'hab) == wire57)) : wire57[(3'h5):(3'h4)])));
  assign wire61 = $unsigned(wire29[(4'hb):(4'h9)]);
  assign wire62 = wire60;
  module63 #() modinst80 (wire79, clk, wire59, wire38, wire30, wire9);
  assign wire81 = wire6;
  assign wire82 = (wire57 ?
                      (((wire7[(5'h10):(4'hb)] ?
                              {wire35} : $signed(wire31)) >>> wire27[(4'h9):(3'h6)]) ?
                          ({$signed(wire62), wire32} * ((wire59 * wire6) ?
                              $signed(wire31) : $unsigned(wire8))) : {$unsigned($unsigned(reg34))}) : ($unsigned(($unsigned(wire62) ?
                              wire36 : (|wire27))) ?
                          (((wire62 && wire79) ?
                                  (wire32 ? wire62 : (7'h41)) : (wire31 ?
                                      wire32 : wire62)) ?
                              ((wire79 ? wire38 : wire27) ?
                                  wire35 : wire40) : ((&wire62) ?
                                  $signed(wire36) : wire79[(1'h1):(1'h0)])) : (($signed(wire36) <= $signed(wire8)) ?
                              $signed($unsigned(wire60)) : wire61)));
  module83 #() modinst112 (.wire86(wire60), .wire87(wire36), .y(wire111), .clk(clk), .wire85(wire38), .wire84(reg34));
  assign wire113 = wire39[(4'hd):(4'hd)];
  always
    @(posedge clk) begin
      reg114 <= $signed(wire29);
      if ((~(reg33 >>> (~|(&$unsigned(wire40))))))
        begin
          reg115 <= (&wire30[(4'h8):(2'h3)]);
          if ($signed($unsigned($unsigned(wire38[(5'h11):(3'h7)]))))
            begin
              reg116 <= ((~&$signed(wire7[(2'h3):(1'h1)])) >> wire57[(3'h7):(1'h1)]);
            end
          else
            begin
              reg116 <= ({(^~$unsigned((wire60 && (8'hbb)))),
                      {wire7, (|wire9)}} ?
                  $signed(((8'hbc) >> wire29[(4'ha):(2'h3)])) : $unsigned(wire38));
            end
          reg117 <= $signed($signed((-{$unsigned((7'h41))})));
        end
      else
        begin
          if ((wire79 >= ((~$signed(reg115)) ?
              $unsigned((8'hbd)) : (!$signed(wire31[(3'h4):(1'h1)])))))
            begin
              reg115 <= (~wire7);
              reg116 <= ($signed(wire111[(1'h1):(1'h0)]) == wire35[(4'hf):(3'h4)]);
              reg117 <= wire30[(2'h2):(1'h0)];
              reg118 <= {$signed($signed(($signed(reg117) > wire60[(3'h6):(3'h4)]))),
                  reg117[(4'he):(4'ha)]};
              reg119 <= $unsigned(wire57[(3'h5):(1'h0)]);
            end
          else
            begin
              reg115 <= $unsigned(($signed($signed({wire35})) ?
                  wire81[(2'h3):(1'h0)] : {(!wire32)}));
              reg116 <= $unsigned((reg116[(4'h8):(2'h2)] ?
                  {$unsigned($unsigned(wire39)),
                      {$unsigned((8'h9d)),
                          $signed(reg118)}} : {wire113[(1'h0):(1'h0)]}));
            end
          if ($signed(wire79))
            begin
              reg120 <= (-$signed((((^wire27) ?
                  {wire40, reg118} : (wire57 > wire6)) << $unsigned(wire39))));
              reg121 <= (wire27[(2'h3):(2'h2)] <<< ($unsigned(reg34[(4'hf):(4'hd)]) ?
                  ((^~wire35[(4'hc):(2'h2)]) ?
                      ((wire30 ?
                          wire113 : (8'ha0)) << wire59) : (~^(wire9 + wire39))) : ((^~$unsigned(wire32)) ~^ $unsigned((|wire30)))));
            end
          else
            begin
              reg120 <= ($signed(((wire8[(3'h7):(1'h0)] ?
                          (wire81 ~^ (8'ha7)) : reg119) ?
                      {$unsigned(wire37)} : ((!wire36) ?
                          (^(8'hb3)) : (wire38 ? wire27 : wire32)))) ?
                  (wire60 ?
                      ((^wire31) << (^~$unsigned((8'hb5)))) : (~(wire6[(2'h2):(1'h0)] - wire61))) : $unsigned(($signed((~reg121)) | $unsigned(wire39[(1'h1):(1'h0)]))));
              reg121 <= reg117;
              reg122 <= wire29;
              reg123 <= ($signed(wire30) ?
                  {$signed(wire9),
                      {{reg119, (reg121 >> wire35)},
                          {$signed(reg118), reg118}}} : {(|$unsigned({wire113,
                          (8'hbf)}))});
              reg124 <= $unsigned((($signed((wire61 + wire113)) == ((wire38 > wire60) ?
                      (wire38 ? wire27 : wire35) : {wire62, (8'hb4)})) ?
                  ({(wire8 || wire59), {wire31, reg34}} == ($signed(wire8) ?
                      $unsigned(reg118) : $signed((8'hae)))) : reg120));
            end
          reg125 <= ((8'h9e) > ({((wire82 ?
                      reg119 : (8'ha9)) <<< $signed(wire38))} ?
              {$signed({reg118})} : (7'h44)));
          reg126 <= ((~&((reg122[(2'h3):(2'h2)] ?
              reg115[(3'h4):(2'h2)] : (+wire6)) ^~ ((wire29 ?
              wire81 : wire82) <<< (reg120 ?
              wire6 : wire9)))) != $signed(wire36));
        end
      reg127 <= wire40;
      reg128 <= ($unsigned(({$unsigned((8'h9c)),
              (-wire79)} * $signed((^~(8'haf))))) ?
          (|(((wire39 < reg126) <<< $signed((8'haf))) ?
              {{reg117, wire113}} : (~|wire6))) : ($unsigned($unsigned((wire82 ?
                  reg125 : (8'hb2)))) ?
              ({wire36[(1'h0):(1'h0)]} ?
                  wire59 : (+wire38)) : $unsigned(wire31[(4'h8):(3'h4)])));
      if ((-reg115[(4'ha):(4'h8)]))
        begin
          reg129 <= reg124;
          if ($unsigned(($unsigned($unsigned($signed(wire82))) * $signed($signed((^~wire82))))))
            begin
              reg130 <= $signed(wire113[(1'h0):(1'h0)]);
            end
          else
            begin
              reg130 <= (((reg124[(3'h5):(2'h3)] ?
                  $signed(reg116[(4'he):(2'h2)]) : $signed(reg34[(4'hf):(1'h0)])) | ($signed(((8'ha9) ?
                      wire82 : (7'h43))) ?
                  {reg33} : $unsigned((^~reg124)))) ^~ (((+(&reg121)) ?
                  $signed(reg121) : ($unsigned(reg124) ~^ (reg125 ?
                      (7'h42) : reg114))) & $unsigned($signed($signed(wire30)))));
              reg131 <= $unsigned($unsigned($unsigned(({wire36,
                  reg130} == $unsigned(reg122)))));
              reg132 <= (8'hb6);
              reg133 <= wire32[(5'h12):(4'hc)];
              reg134 <= wire39;
            end
        end
      else
        begin
          reg129 <= (wire9 <= reg117);
          reg130 <= ($unsigned($unsigned(wire8)) != {reg129[(3'h4):(3'h4)],
              reg132});
          reg131 <= $unsigned((wire79[(5'h13):(4'h9)] ?
              {(wire39[(3'h6):(3'h5)] >= (reg33 && reg131))} : ((reg130[(1'h1):(1'h1)] && reg120) || (-(wire60 + wire32)))));
          reg132 <= wire113[(2'h2):(1'h0)];
        end
    end
endmodule

module module83  (y, clk, wire87, wire86, wire85, wire84);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire87;
  input wire [(3'h4):(1'h0)] wire86;
  input wire signed [(3'h6):(1'h0)] wire85;
  input wire [(4'hf):(1'h0)] wire84;
  wire [(3'h7):(1'h0)] wire110;
  wire signed [(5'h10):(1'h0)] wire109;
  wire signed [(3'h7):(1'h0)] wire108;
  wire signed [(5'h10):(1'h0)] wire105;
  wire [(4'he):(1'h0)] wire97;
  wire signed [(3'h4):(1'h0)] wire96;
  wire [(3'h4):(1'h0)] wire95;
  wire [(4'hb):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire93;
  wire [(4'hf):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire91;
  wire [(2'h3):(1'h0)] wire90;
  wire signed [(4'h9):(1'h0)] wire89;
  wire signed [(5'h12):(1'h0)] wire88;
  reg [(4'hd):(1'h0)] reg107 = (1'h0);
  reg [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(3'h5):(1'h0)] reg99 = (1'h0);
  reg [(4'h8):(1'h0)] reg98 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire105,
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
                 reg107,
                 reg106,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 (1'h0)};
  assign wire88 = wire87;
  assign wire89 = wire88[(5'h11):(4'hd)];
  assign wire90 = (+(8'hb7));
  assign wire91 = (wire84[(4'h9):(4'h9)] | $unsigned(wire89));
  assign wire92 = wire86[(1'h0):(1'h0)];
  assign wire93 = (8'hb0);
  assign wire94 = wire88[(3'h4):(1'h0)];
  assign wire95 = $signed(wire94[(3'h7):(2'h3)]);
  assign wire96 = $unsigned(wire95[(2'h3):(2'h2)]);
  assign wire97 = $unsigned($unsigned(wire93[(3'h6):(1'h0)]));
  always
    @(posedge clk) begin
      reg98 <= (^{($unsigned({wire88}) && {wire92[(4'hf):(4'hd)]})});
      if ($signed((((wire92[(3'h5):(3'h5)] >> $unsigned(wire96)) ?
          wire86 : $signed((~wire86))) != reg98)))
        begin
          reg99 <= ((^~$unsigned(wire84)) ? {(|wire90), wire90} : wire89);
          if ((+{({(wire86 ^~ wire84), {(8'ha8), wire90}} ?
                  $signed((wire92 ? (8'had) : wire87)) : $signed((+wire84)))}))
            begin
              reg100 <= wire93;
            end
          else
            begin
              reg100 <= {(wire97[(4'hc):(2'h3)] ?
                      (~&$signed(wire84)) : wire96[(3'h4):(1'h1)])};
              reg101 <= $signed((wire97 ?
                  reg99 : {$unsigned($signed(wire94))}));
            end
        end
      else
        begin
          reg99 <= wire97[(3'h5):(3'h5)];
          reg100 <= ((^~($signed(wire96[(3'h4):(3'h4)]) ?
              $unsigned((+reg98)) : wire92)) <= (^reg99[(1'h0):(1'h0)]));
          reg101 <= ((($signed($signed(wire90)) > wire85) ?
              (wire87[(2'h3):(2'h3)] ?
                  ((wire91 | wire87) ?
                      {wire87, reg101} : (reg100 ?
                          reg100 : (8'hb3))) : $signed((reg100 >= reg98))) : wire96[(2'h2):(2'h2)]) >= (reg98 ?
              $unsigned($unsigned((&wire84))) : $signed(wire84[(4'h8):(1'h0)])));
          reg102 <= ($unsigned($signed(reg100)) || {wire85[(3'h4):(2'h2)]});
          if ($unsigned(wire85[(2'h3):(2'h3)]))
            begin
              reg103 <= ({wire93} ~^ $unsigned((&$signed(((8'hab) >> wire86)))));
              reg104 <= {($signed(reg98) ?
                      $signed($signed({wire93})) : {((8'hbc) ?
                              (wire92 ^ reg100) : $unsigned((8'h9d))),
                          ((wire97 ? reg99 : wire97) < wire89)}),
                  ($unsigned((reg98[(4'h8):(3'h5)] != wire97)) ?
                      (wire89[(3'h6):(2'h2)] && ({(7'h40)} ?
                          wire92 : wire92)) : (!wire94[(1'h0):(1'h0)]))};
            end
          else
            begin
              reg103 <= (|$signed($unsigned((wire96[(2'h2):(2'h2)] && $unsigned((8'hb4))))));
              reg104 <= {$signed(wire93)};
            end
        end
    end
  assign wire105 = reg100[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg106 <= {{$unsigned($unsigned(wire96))}};
      reg107 <= (+$unsigned($signed(wire91)));
    end
  assign wire108 = wire95;
  assign wire109 = reg101;
  assign wire110 = wire94[(4'h9):(3'h5)];
endmodule

module module63
#(parameter param77 = ({(~|(^((8'h9d) ? (7'h44) : (8'ha9))))} ? {(^~(!(+(7'h44))))} : {((((7'h43) ^~ (8'hae)) || (+(8'hab))) ? (((8'ha2) - (8'ha5)) ? (+(8'ha6)) : ((7'h40) <= (8'hb5))) : (^(!(8'hb7)))), {{((8'ha2) ^~ (8'hb7))}}}), 
parameter param78 = (~((~(param77 ? param77 : (param77 ? param77 : param77))) ? (^~((param77 && param77) ~^ (param77 ? param77 : (8'hae)))) : ({(param77 ? param77 : param77), (param77 && param77)} ? param77 : {param77, (param77 ? param77 : param77)}))))
(y, clk, wire67, wire66, wire65, wire64);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire67;
  input wire signed [(2'h3):(1'h0)] wire66;
  input wire signed [(2'h2):(1'h0)] wire65;
  input wire signed [(4'h9):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire76;
  wire signed [(2'h2):(1'h0)] wire75;
  wire signed [(5'h11):(1'h0)] wire74;
  wire [(5'h14):(1'h0)] wire73;
  wire signed [(2'h3):(1'h0)] wire72;
  wire [(3'h5):(1'h0)] wire71;
  wire [(4'he):(1'h0)] wire70;
  wire signed [(4'h9):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire68;
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 (1'h0)};
  assign wire68 = wire65[(2'h2):(2'h2)];
  assign wire69 = wire67[(3'h4):(1'h1)];
  assign wire70 = (^~(((!$signed(wire64)) | $signed(wire65)) ?
                      wire69 : (|$signed((-wire64)))));
  assign wire71 = wire67;
  assign wire72 = $signed(((^$signed($signed((8'haf)))) <= $signed(wire69[(4'h9):(1'h0)])));
  assign wire73 = wire65[(1'h1):(1'h0)];
  assign wire74 = wire66[(2'h2):(1'h1)];
  assign wire75 = $signed(((~^wire65) >>> wire72));
  assign wire76 = ((($unsigned($unsigned((8'hba))) ?
                          $signed($signed(wire68)) : ($signed(wire75) <= $unsigned(wire72))) ?
                      $unsigned({(wire67 && wire68),
                          {wire69,
                              wire74}}) : wire70) & {$unsigned($signed((8'hb8)))});
endmodule

module module41
#(parameter param55 = ((8'hab) ? (^((((8'ha1) ? (8'hab) : (7'h43)) ? ((7'h42) || (7'h43)) : {(8'ha5), (8'haf)}) ? ((&(8'hb2)) || ((8'hbd) ? (8'h9e) : (8'h9f))) : {((8'haa) | (8'hab)), ((8'ha3) >= (8'hbf))})) : ({(((8'hb5) > (8'ha8)) && {(8'hb2)}), (((8'hb8) < (8'hb0)) ? ((8'hb2) - (8'hb3)) : (|(8'ha8)))} ? {(((7'h40) << (8'h9c)) ? ((8'hae) ~^ (8'h9f)) : ((8'hab) > (8'ha5))), (((8'hbb) - (8'ha0)) & (8'ha6))} : ((+((8'hb1) ? (7'h42) : (8'hac))) ~^ {((8'hbd) ? (8'ha9) : (7'h44)), (~(7'h41))}))), 
parameter param56 = (^~(^param55)))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire45;
  input wire signed [(2'h2):(1'h0)] wire44;
  input wire [(5'h15):(1'h0)] wire43;
  input wire [(3'h4):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire52;
  wire [(4'hc):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire48;
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg46 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg47,
                 reg46,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg46 <= ($signed(wire43[(4'h8):(1'h0)]) ?
          (((-wire42) << $unsigned(wire44[(2'h2):(2'h2)])) << $unsigned($signed((wire45 * (8'ha4))))) : wire45[(1'h1):(1'h0)]);
      reg47 <= (&reg46);
    end
  assign wire48 = (~&(reg46 << (&$unsigned(((8'hab) <= wire44)))));
  assign wire49 = ($signed(wire42) < reg47);
  assign wire50 = (wire49[(3'h5):(3'h4)] ?
                      ((^wire44) ~^ wire44[(2'h2):(1'h0)]) : wire44);
  assign wire51 = $unsigned(wire48);
  assign wire52 = (wire49 - (!(|($unsigned((8'ha5)) ?
                      $signed((8'ha2)) : (wire42 ? (7'h41) : wire49)))));
  assign wire53 = $signed(wire49);
  assign wire54 = wire45;
endmodule

module module10  (y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire14;
  input wire signed [(3'h4):(1'h0)] wire13;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire signed [(5'h10):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(2'h2):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire15;
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire17,
                 wire16,
                 wire15,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire15 = (wire11[(4'hb):(4'ha)] - $signed((!({wire11} ?
                      wire12 : (wire14 | wire12)))));
  assign wire16 = (~|$signed({$signed((wire15 + wire12))}));
  assign wire17 = (((~^({wire12, wire14} ?
                              $unsigned(wire12) : $signed(wire14))) ?
                          $unsigned($signed($signed(wire13))) : (~^(&wire16))) ?
                      (^~(wire15[(4'ha):(1'h1)] || $unsigned(wire13))) : $signed(({(~|wire16)} ?
                          ($signed((7'h44)) ?
                              (|wire16) : $signed(wire13)) : {(8'hb8),
                              $unsigned(wire15)})));
  always
    @(posedge clk) begin
      reg18 <= wire12;
      reg19 <= $signed($signed((wire12[(3'h6):(3'h6)] < $signed(((7'h43) == (8'ha5))))));
      reg20 <= (wire16 ^~ (!($unsigned($unsigned(wire11)) ?
          reg18 : $signed((wire12 ? wire16 : wire17)))));
      reg21 <= $unsigned($unsigned((((^reg19) < (8'hbe)) ?
          $signed($unsigned(wire15)) : wire16)));
    end
  assign wire22 = (~&wire13);
  assign wire23 = ($signed($unsigned((~^$unsigned((8'h9c))))) ^ $unsigned(reg18));
  assign wire24 = (reg19[(2'h2):(1'h1)] | (wire11 ?
                      reg21[(3'h4):(3'h4)] : $unsigned(((wire22 ^~ wire12) >= $signed(wire16)))));
  assign wire25 = (reg20 ^~ {{((&wire14) << (7'h42)),
                          (wire15[(4'hd):(4'ha)] ?
                              reg18[(1'h1):(1'h0)] : (wire14 ?
                                  wire11 : reg20))}});
  assign wire26 = $signed((~(|(7'h42))));
endmodule
