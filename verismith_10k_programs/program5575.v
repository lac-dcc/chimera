module top
#(parameter param156 = {{((8'had) * (~&(^(8'hbb))))}}, 
parameter param157 = (^~(^~((((8'hbd) <<< param156) != param156) ? (param156 ? (param156 ? param156 : (8'ha7)) : (param156 ? param156 : param156)) : param156))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire154;
  wire signed [(4'hb):(1'h0)] wire153;
  wire signed [(4'he):(1'h0)] wire152;
  wire signed [(4'h8):(1'h0)] wire151;
  wire signed [(5'h11):(1'h0)] wire142;
  wire signed [(2'h3):(1'h0)] wire129;
  wire [(4'hd):(1'h0)] wire128;
  wire signed [(4'hd):(1'h0)] wire127;
  wire [(5'h15):(1'h0)] wire125;
  wire [(5'h12):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire131;
  wire signed [(2'h3):(1'h0)] wire132;
  wire [(5'h15):(1'h0)] wire133;
  wire [(4'h8):(1'h0)] wire134;
  wire signed [(4'h8):(1'h0)] wire135;
  wire [(5'h14):(1'h0)] wire136;
  wire [(4'h9):(1'h0)] wire137;
  wire [(4'h9):(1'h0)] wire138;
  wire [(4'hc):(1'h0)] wire139;
  wire [(4'h9):(1'h0)] wire140;
  reg [(3'h6):(1'h0)] reg143 = (1'h0);
  reg [(4'hb):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg148 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg149 = (1'h0);
  reg [(3'h7):(1'h0)] reg150 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire142,
                 wire129,
                 wire128,
                 wire127,
                 wire125,
                 wire83,
                 wire81,
                 wire131,
                 wire132,
                 wire133,
                 wire134,
                 wire135,
                 wire136,
                 wire137,
                 wire138,
                 wire139,
                 wire140,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 (1'h0)};
  module5 #() modinst82 (wire81, clk, wire1, wire3, wire0, wire4, wire2);
  assign wire83 = {wire4[(4'hc):(4'ha)]};
  module84 #() modinst126 (wire125, clk, wire0, wire3, wire2, wire1);
  assign wire127 = $unsigned($signed($unsigned((&(wire3 ? wire1 : wire2)))));
  assign wire128 = wire0[(5'h10):(4'hc)];
  module5 #() modinst130 (.wire9(wire1), .wire7(wire83), .clk(clk), .wire10(wire2), .y(wire129), .wire8(wire125), .wire6(wire0));
  assign wire131 = ($unsigned(((~(wire1 ?
                       wire81 : (8'ha1))) == wire81)) | $signed((((wire1 ?
                           (8'hb5) : wire2) & ((8'hba) ? wire127 : wire0)) ?
                       (wire128 > (wire125 != (8'ha1))) : $unsigned(wire127))));
  assign wire132 = $unsigned((($signed(wire0) | ($signed(wire2) && (wire129 ?
                       wire3 : wire0))) <<< wire83[(5'h11):(5'h11)]));
  assign wire133 = $signed($signed((wire132[(1'h1):(1'h1)] << {(^wire125),
                       $signed(wire128)})));
  assign wire134 = wire125;
  assign wire135 = (((wire83 ~^ wire81) + {wire4[(4'h9):(1'h1)],
                       $unsigned(wire128[(4'h9):(3'h4)])}) > (&wire3));
  assign wire136 = {$unsigned(wire1)};
  assign wire137 = $signed(((wire135[(3'h4):(1'h0)] ^~ $signed((wire83 ?
                           wire0 : wire131))) ?
                       (~wire135) : $signed((8'hb7))));
  assign wire138 = (^wire129[(2'h3):(1'h0)]);
  assign wire139 = $unsigned((((wire128[(2'h2):(1'h1)] | {wire2, wire129}) ?
                       wire3 : ((&wire0) ?
                           (wire129 | wire132) : (^~wire127))) - $unsigned(($unsigned(wire136) >= wire135[(3'h6):(1'h0)]))));
  module5 #() modinst141 (wire140, clk, wire125, wire128, wire135, wire83, wire139);
  assign wire142 = $signed(wire0[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg143 <= (wire128 ? wire127 : $unsigned((8'hb5)));
      reg144 <= wire134[(1'h0):(1'h0)];
      if ((~|wire3))
        begin
          reg145 <= (&(wire81 ?
              wire140[(4'h8):(2'h2)] : $unsigned((wire125 ?
                  reg144[(3'h5):(3'h4)] : $signed(wire3)))));
          reg146 <= wire2;
          reg147 <= (wire136[(5'h13):(4'h8)] ?
              ({(wire127 ? {(8'hb3)} : $signed(wire4)),
                      wire138[(3'h4):(3'h4)]} ?
                  ($unsigned($unsigned(wire125)) ?
                      (wire129[(2'h2):(1'h1)] == wire132) : ((reg146 ^ wire133) < (wire81 >> wire142))) : ($signed((wire127 <= wire1)) == wire3)) : ({(wire127 ?
                      ((8'ha9) ?
                          wire140 : wire125) : wire129)} * wire134[(4'h8):(2'h3)]));
          reg148 <= $signed(wire81);
        end
      else
        begin
          reg145 <= $signed((($signed(((8'hab) << wire127)) >> ({wire0,
                  (8'hbd)} ?
              (~&wire4) : $unsigned(wire3))) <= $signed((~|wire125))));
          if (($signed({wire132}) ?
              $signed(reg145[(2'h3):(2'h2)]) : wire139[(2'h2):(2'h2)]))
            begin
              reg146 <= $signed($unsigned({(7'h43), reg145[(2'h2):(1'h1)]}));
              reg147 <= $unsigned((~^wire140));
              reg148 <= reg148;
            end
          else
            begin
              reg146 <= $signed({reg148});
              reg147 <= {$signed((wire127 || wire131[(3'h5):(2'h2)]))};
              reg148 <= {$unsigned((-$signed($signed(wire81))))};
            end
        end
      reg149 <= ($unsigned((($unsigned(wire132) ?
              {(8'hb5)} : (wire129 ^~ wire131)) ?
          $unsigned((wire132 ?
              wire140 : reg144)) : ($signed(wire138) * (&wire2)))) && ({((wire128 ?
              reg146 : wire125) <<< $signed(wire127))} * (8'hbb)));
      reg150 <= $unsigned(wire127[(1'h1):(1'h0)]);
    end
  assign wire151 = $signed(wire81);
  assign wire152 = ($signed(wire134[(2'h2):(1'h1)]) >>> wire81);
  assign wire153 = wire4;
  module64 #() modinst155 (wire154, clk, wire153, wire142, wire138, reg145, wire151);
endmodule

module module84  (y, clk, wire88, wire87, wire86, wire85);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire88;
  input wire [(5'h14):(1'h0)] wire87;
  input wire signed [(2'h3):(1'h0)] wire86;
  input wire signed [(5'h14):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire124;
  wire signed [(4'he):(1'h0)] wire123;
  wire signed [(5'h14):(1'h0)] wire122;
  wire signed [(3'h4):(1'h0)] wire121;
  wire [(4'h9):(1'h0)] wire120;
  wire signed [(4'he):(1'h0)] wire116;
  wire [(5'h12):(1'h0)] wire94;
  wire [(4'he):(1'h0)] wire93;
  wire [(4'he):(1'h0)] wire92;
  reg signed [(3'h7):(1'h0)] reg119 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg118 = (1'h0);
  reg [(4'hd):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire116,
                 wire94,
                 wire93,
                 wire92,
                 reg119,
                 reg118,
                 reg91,
                 reg90,
                 reg89,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg89 <= (!$signed(wire87[(4'h8):(4'h8)]));
      reg90 <= ((^reg89) ?
          ($signed($signed((-wire87))) ?
              ($unsigned($signed(wire85)) >= {{wire85,
                      wire87}}) : ($unsigned((wire88 + (8'hb0))) < (wire86[(2'h3):(1'h0)] ~^ wire87[(5'h10):(4'h9)]))) : ({(&reg89),
                  wire88} ?
              ((((8'hbc) ? wire86 : wire86) ?
                  $signed(wire87) : (8'hb1)) & (wire86[(2'h2):(1'h0)] ?
                  $unsigned(wire86) : $unsigned(wire85))) : {((8'hb7) ^ $unsigned(wire86))}));
      reg91 <= wire86;
    end
  assign wire92 = reg89[(2'h3):(1'h1)];
  assign wire93 = (reg89[(3'h4):(2'h3)] ?
                      ($signed(($signed(reg89) >>> (wire85 + wire92))) * reg89) : wire88[(4'ha):(3'h5)]);
  assign wire94 = $signed(wire87);
  module95 #() modinst117 (wire116, clk, wire85, wire92, wire94, wire87);
  always
    @(posedge clk) begin
      reg118 <= (8'hb9);
      reg119 <= ({$unsigned((wire93[(4'he):(2'h2)] ?
              (~&reg118) : wire86[(1'h0):(1'h0)]))} >= ((|$signed(((8'h9c) ?
          wire87 : wire94))) ^~ (~&wire92[(2'h3):(1'h1)])));
    end
  assign wire120 = $signed(reg91);
  assign wire121 = ($signed(reg89[(2'h3):(1'h0)]) ^~ (8'hbd));
  assign wire122 = $unsigned(({$signed($signed(wire94))} - (~|reg118[(4'ha):(3'h4)])));
  assign wire123 = (|($signed($unsigned((8'haf))) & $signed(((reg91 - (7'h43)) ~^ wire120))));
  assign wire124 = $unsigned($unsigned(((wire123 && $unsigned(wire123)) ?
                       (|$unsigned(wire93)) : ($unsigned(wire88) & wire120))));
endmodule

module module5
#(parameter param79 = {((!(((8'hac) >= (8'ha6)) & {(8'ha6), (8'hb5)})) ? ((((8'hb9) ? (8'haf) : (8'hbd)) >> ((8'ha7) ? (8'ha6) : (8'hbf))) || (8'hb9)) : (-{{(8'hba)}, ((8'hb1) << (8'hb6))}))}, 
parameter param80 = (8'hb0))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire [(3'h4):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire78;
  wire [(3'h6):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire62;
  wire [(2'h2):(1'h0)] wire61;
  wire signed [(4'he):(1'h0)] wire60;
  wire [(3'h7):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire57;
  wire [(2'h3):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire15;
  wire signed [(5'h11):(1'h0)] wire12;
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  assign y = {wire78,
                 wire76,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire57,
                 wire33,
                 wire32,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire12,
                 reg11,
                 reg13,
                 reg14,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= (wire8 ?
          {(~$unsigned((wire6 != wire10)))} : ((8'hb7) ^ {wire8[(1'h0):(1'h0)],
              {$signed(wire10), (&wire6)}}));
    end
  assign wire12 = $signed($unsigned(($signed(wire7[(4'hb):(3'h7)]) >>> $signed($unsigned(wire7)))));
  always
    @(posedge clk) begin
      reg13 <= $signed(($unsigned($unsigned($signed(reg11))) ~^ ((wire10 ?
              wire9 : (&reg11)) ?
          wire10[(5'h10):(3'h5)] : $signed(wire9))));
      reg14 <= (~&wire9[(1'h0):(1'h0)]);
    end
  assign wire15 = (-wire6[(1'h1):(1'h1)]);
  assign wire16 = wire10;
  assign wire17 = (($signed($signed((~^wire7))) < (!reg14)) && reg14);
  assign wire18 = $signed($unsigned((+{(!wire12), (8'hb8)})));
  assign wire19 = {{wire7}};
  assign wire20 = {reg14[(1'h0):(1'h0)]};
  assign wire21 = $signed(($unsigned((-(|wire17))) && $signed(((|(8'hba)) ?
                      (~reg11) : (reg11 ? wire9 : wire12)))));
  always
    @(posedge clk) begin
      if (($signed((wire7 ? (~^(~^wire7)) : wire6[(2'h3):(1'h1)])) ?
          ({$signed($unsigned(wire10))} ?
              (8'hab) : $unsigned(($unsigned((8'h9e)) > ((7'h44) ?
                  (7'h41) : wire18)))) : $signed($unsigned(wire20[(4'hc):(1'h0)]))))
        begin
          reg22 <= (wire21[(3'h6):(2'h3)] ~^ $unsigned($signed($signed(wire10[(5'h13):(5'h11)]))));
          reg23 <= wire17[(4'he):(4'h9)];
          if ((~&$signed((~((&wire18) && (-wire6))))))
            begin
              reg24 <= $signed(wire10);
              reg25 <= wire19;
            end
          else
            begin
              reg24 <= (^($unsigned((~^$unsigned(reg11))) << wire18));
              reg25 <= (($signed({((8'hbd) + reg23),
                      $signed((8'ha3))}) && ((+$unsigned(wire6)) ?
                      reg14 : $signed(reg24))) ?
                  wire15 : $unsigned((+wire7)));
              reg26 <= {(8'haf), {(|(|(~&wire7)))}};
              reg27 <= $unsigned($signed($signed({(wire12 ?
                      (8'ha0) : wire7)})));
              reg28 <= (wire21 ?
                  $unsigned(($unsigned(reg23[(5'h12):(3'h6)]) * $signed((&reg14)))) : (^reg13[(3'h5):(3'h4)]));
            end
          reg29 <= $signed((({(reg22 ? wire12 : (7'h40)),
                  reg24[(1'h0):(1'h0)]} ?
              reg22 : (-(~|wire20))) * ($signed((+reg26)) > (!wire10))));
          reg30 <= (wire12[(4'hc):(1'h0)] <= $signed((~&{reg11[(4'hb):(4'hb)],
              (wire8 || wire21)})));
        end
      else
        begin
          reg22 <= {reg27, (8'hbd)};
          reg23 <= (~|((&wire9[(4'h9):(3'h4)]) << wire7[(1'h1):(1'h1)]));
        end
      reg31 <= wire21;
    end
  assign wire32 = (|$unsigned($unsigned((~|$signed(reg31)))));
  assign wire33 = $signed(reg24);
  module34 #() modinst58 (.wire38(wire32), .wire37(reg22), .clk(clk), .wire35(wire15), .wire36(reg23), .y(wire57));
  assign wire59 = wire7[(2'h2):(1'h1)];
  assign wire60 = $unsigned({$unsigned($signed((+wire21)))});
  assign wire61 = reg31;
  assign wire62 = ({(reg23 ? reg26 : $signed($unsigned((8'had)))),
                      {wire8}} <= reg25);
  assign wire63 = (reg11 << $unsigned((wire12[(4'h9):(2'h3)] * $unsigned(wire21))));
  module64 #() modinst77 (wire76, clk, wire19, wire12, reg24, wire18, wire17);
  assign wire78 = $unsigned($signed((^~(wire60[(1'h0):(1'h0)] ^ (reg28 ?
                      wire61 : wire62)))));
endmodule

module module64
#(parameter param75 = {(^({((8'hb7) || (7'h41))} > ({(8'ha1)} && (^(8'hb4))))), {((&((8'hba) ? (8'had) : (8'had))) ? (((8'ha2) ? (8'h9e) : (8'ha6)) ? ((8'ha6) == (8'h9f)) : {(8'ha5), (8'hb4)}) : (((8'hb9) ? (8'hae) : (7'h44)) * ((8'ha5) ? (8'hac) : (8'hbd)))), (~(|{(8'hb5), (8'hac)}))}})
(y, clk, wire69, wire68, wire67, wire66, wire65);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire69;
  input wire signed [(5'h11):(1'h0)] wire68;
  input wire [(4'h9):(1'h0)] wire67;
  input wire signed [(4'hb):(1'h0)] wire66;
  input wire [(3'h5):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire74;
  wire signed [(4'hd):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire72;
  wire [(4'ha):(1'h0)] wire71;
  wire [(5'h13):(1'h0)] wire70;
  assign y = {wire74, wire73, wire72, wire71, wire70, (1'h0)};
  assign wire70 = $signed(wire67);
  assign wire71 = wire66;
  assign wire72 = (wire68[(5'h11):(2'h2)] << ($signed((~|(wire69 - wire67))) >> {((~&wire66) >> (8'ha0))}));
  assign wire73 = {((8'hb5) ~^ ({$unsigned(wire65)} ?
                          $unsigned((wire67 ?
                              wire66 : (7'h41))) : wire70[(4'h8):(3'h6)])),
                      ({$signed((~wire66))} ^ (~$unsigned($signed(wire71))))};
  assign wire74 = (wire71 ?
                      $unsigned(((8'hb6) >> (|(wire68 == wire73)))) : $signed(wire66));
endmodule

module module34  (y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire38;
  input wire [(4'hf):(1'h0)] wire37;
  input wire signed [(5'h15):(1'h0)] wire36;
  input wire signed [(4'he):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire53;
  wire signed [(5'h10):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire41,
                 wire40,
                 reg56,
                 reg55,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg39,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg39 <= ((|wire37) ?
          $unsigned(wire36) : $signed((wire36[(5'h15):(4'h9)] ?
              wire35[(1'h0):(1'h0)] : {(wire37 || wire38), wire37})));
    end
  assign wire40 = $unsigned({$signed((~|(8'haa)))});
  assign wire41 = wire37;
  always
    @(posedge clk) begin
      if ((-$signed(wire37)))
        begin
          reg42 <= (+wire41);
          reg43 <= (($signed((+(wire40 >>> wire38))) * ((+(-reg39)) ?
                  (~|$unsigned(wire41)) : (|(wire41 ? wire40 : (8'hb9))))) ?
              reg42[(4'h9):(4'h8)] : wire40[(1'h1):(1'h0)]);
          if ($signed((~|(wire37 - wire36))))
            begin
              reg44 <= $signed((8'had));
              reg45 <= reg43;
            end
          else
            begin
              reg44 <= (reg44[(4'ha):(4'ha)] ?
                  $unsigned($unsigned(((wire40 ? wire40 : reg44) ?
                      (wire36 < reg42) : (wire36 ?
                          (8'h9c) : reg43)))) : wire37[(4'hc):(1'h0)]);
              reg45 <= reg45;
              reg46 <= $signed($signed((~|$unsigned(reg42[(1'h1):(1'h0)]))));
            end
          reg47 <= (&wire36[(2'h2):(1'h1)]);
        end
      else
        begin
          reg42 <= $unsigned($unsigned((~|$signed({reg42, reg42}))));
        end
      reg48 <= {reg44};
      reg49 <= $signed((^$signed($unsigned((wire40 ? reg45 : wire37)))));
      reg50 <= $unsigned(wire40);
    end
  always
    @(posedge clk) begin
      reg51 <= wire35;
    end
  assign wire52 = (($signed(((reg49 ? reg50 : wire40) ?
                              (reg46 < reg45) : wire37[(3'h6):(3'h5)])) ?
                          (8'ha6) : wire40[(2'h2):(1'h0)]) ?
                      $unsigned(wire37) : (($signed(wire38) ?
                              ((wire40 ?
                                  reg43 : wire36) >= wire38) : ($unsigned(reg44) <<< {wire41,
                                  (8'ha4)})) ?
                          (($unsigned((7'h41)) < wire35) == (!$unsigned(reg46))) : wire40[(3'h5):(2'h2)]));
  assign wire53 = {reg45[(2'h3):(1'h1)]};
  assign wire54 = $signed(reg50);
  always
    @(posedge clk) begin
      reg55 <= reg39;
      reg56 <= (~|((((~^reg47) || (wire53 ? reg50 : wire53)) >= ((reg42 ?
          wire52 : (7'h40)) >>> $unsigned((8'ha1)))) ~^ $unsigned((~^((8'hbf) ?
          reg55 : reg42)))));
    end
endmodule

module module95
#(parameter param114 = (~|((8'hba) ? (~{((8'hae) ? (8'hb0) : (8'ha8))}) : (7'h42))), 
parameter param115 = ((((param114 ? (param114 >>> param114) : (8'hbc)) || ((param114 ? param114 : param114) ~^ {param114})) ? (((param114 ? param114 : param114) * (+param114)) ? (^~param114) : {(param114 ? param114 : param114)}) : ((|param114) ^ ((param114 | param114) ^ param114))) ? param114 : (-((^~(-(8'ha5))) >>> ((param114 && (7'h43)) ? param114 : {(8'ha0), param114})))))
(y, clk, wire99, wire98, wire97, wire96);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire99;
  input wire signed [(4'he):(1'h0)] wire98;
  input wire signed [(5'h12):(1'h0)] wire97;
  input wire signed [(3'h6):(1'h0)] wire96;
  wire [(5'h15):(1'h0)] wire113;
  wire signed [(3'h6):(1'h0)] wire112;
  wire signed [(3'h7):(1'h0)] wire111;
  wire [(4'h8):(1'h0)] wire110;
  wire [(5'h10):(1'h0)] wire109;
  wire signed [(3'h7):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire106;
  wire signed [(3'h5):(1'h0)] wire105;
  wire [(4'hc):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  wire signed [(5'h15):(1'h0)] wire102;
  wire signed [(5'h15):(1'h0)] wire101;
  wire [(3'h6):(1'h0)] wire100;
  reg signed [(3'h5):(1'h0)] reg108 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 reg108,
                 (1'h0)};
  assign wire100 = $signed(wire99);
  assign wire101 = (($signed(({wire96, wire98} ?
                       (8'hbf) : $signed(wire98))) << $unsigned((~&(wire99 ?
                       wire99 : wire99)))) >= $unsigned((wire99 ~^ {wire99[(3'h6):(2'h3)]})));
  assign wire102 = ({($unsigned({wire98, (8'haa)}) ?
                               wire99 : ((8'hbe) ^ (&wire96)))} ?
                       ($signed($signed({wire97})) ?
                           $unsigned($signed(wire96[(1'h1):(1'h0)])) : {{wire101[(4'h9):(1'h1)],
                                   (wire96 >> wire100)}}) : (({$signed((8'ha8)),
                                   $unsigned(wire96)} ?
                               (wire97 != $signed((8'hb6))) : (~&(wire100 ?
                                   wire98 : wire97))) ?
                           $signed(wire100[(3'h4):(2'h2)]) : wire99[(3'h5):(2'h3)]));
  assign wire103 = wire101;
  assign wire104 = ($unsigned(((-(^~(8'hbf))) ?
                           wire101 : (wire100 >= (wire98 >>> (8'hbf))))) ?
                       (&(&$signed({wire101}))) : (~^wire103[(3'h7):(2'h2)]));
  assign wire105 = (~|($unsigned(wire103) ?
                       wire104[(2'h2):(2'h2)] : ({{wire102, wire102}} ?
                           wire103[(3'h4):(1'h0)] : {wire103[(3'h4):(3'h4)]})));
  assign wire106 = wire104;
  assign wire107 = wire97;
  always
    @(posedge clk) begin
      reg108 <= ($unsigned(wire104) ?
          ({((~&(8'hab)) - $unsigned(wire101))} ?
              (wire96 ?
                  ($signed(wire104) >= $unsigned(wire99)) : {wire98[(4'ha):(4'ha)]}) : $signed({wire107,
                  $signed(wire103)})) : $signed($signed($signed($unsigned(wire106)))));
    end
  assign wire109 = wire100[(1'h1):(1'h0)];
  assign wire110 = reg108[(2'h2):(1'h1)];
  assign wire111 = (8'hbf);
  assign wire112 = (-wire99[(4'h8):(1'h1)]);
  assign wire113 = ($unsigned((((wire107 >= (8'hb3)) ?
                               $signed(wire99) : (wire96 ? reg108 : wire104)) ?
                           $signed($unsigned(wire103)) : $unsigned(wire98))) ?
                       wire102 : wire111[(3'h5):(1'h1)]);
endmodule
