module top
#(parameter param172 = ((((~(~&(8'ha5))) ~^ (((8'hb5) ? (8'hae) : (8'hb5)) + ((8'ha3) ? (8'hbe) : (8'hb2)))) != ({((7'h40) ~^ (8'hb1)), ((8'hb8) >= (8'hb3))} >= ((|(8'ha9)) ? ((8'ha1) ? (8'haf) : (8'h9c)) : ((8'h9f) * (8'ha5))))) >>> (((((8'ha3) == (8'hb5)) ~^ (^~(7'h41))) << {((8'ha4) ? (8'hbc) : (8'h9e))}) ? ((+(8'hbf)) == (7'h42)) : (({(7'h42), (8'h9c)} ^ ((8'hbc) ? (8'hb3) : (8'ha3))) ? (((8'hb0) ^ (7'h41)) ? ((8'ha3) < (8'hb1)) : ((7'h42) ? (8'hbc) : (8'h9e))) : (~|(-(8'hab)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire170;
  wire signed [(4'hf):(1'h0)] wire96;
  wire signed [(4'ha):(1'h0)] wire91;
  wire [(5'h13):(1'h0)] wire90;
  wire [(3'h6):(1'h0)] wire89;
  wire signed [(4'hb):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire81;
  wire signed [(4'hb):(1'h0)] wire80;
  wire signed [(5'h15):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire77;
  wire signed [(4'hc):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg83 = (1'h0);
  reg [(2'h2):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg95 = (1'h0);
  assign y = {wire170,
                 wire96,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire77,
                 wire22,
                 wire21,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 (1'h0)};
  assign wire5 = (wire2 <= $unsigned($signed(($signed(wire1) ^ (wire1 - wire0)))));
  assign wire6 = wire1[(3'h4):(1'h0)];
  assign wire7 = $unsigned((wire3 ^ ((wire4 | (wire0 ? wire5 : wire6)) ?
                     ((-wire5) * wire3[(4'ha):(2'h3)]) : wire2[(2'h2):(1'h0)])));
  assign wire8 = (8'hb7);
  always
    @(posedge clk) begin
      if ((~&$unsigned($unsigned(wire2[(1'h1):(1'h1)]))))
        begin
          reg9 <= {wire1};
          reg10 <= ((~^(^~wire5)) && wire0[(4'ha):(4'h8)]);
        end
      else
        begin
          reg9 <= wire4[(3'h4):(3'h4)];
          reg10 <= reg9;
          reg11 <= $signed(wire0);
          if (wire6[(2'h3):(2'h3)])
            begin
              reg12 <= wire1[(4'h9):(3'h7)];
              reg13 <= (^~reg11[(3'h4):(1'h1)]);
            end
          else
            begin
              reg12 <= reg9;
            end
        end
      reg14 <= wire4[(1'h1):(1'h0)];
      if (reg13)
        begin
          if ($signed($unsigned(reg12)))
            begin
              reg15 <= wire8[(1'h0):(1'h0)];
              reg16 <= ((8'ha2) <= ((-$unsigned($signed(wire8))) < reg14));
              reg17 <= (!{(($unsigned(wire8) <<< (wire3 ? reg12 : (8'hab))) ?
                      ((wire2 ?
                          wire8 : (8'hbb)) ^ reg12) : (~^(wire7 && (8'hbf))))});
              reg18 <= ((reg13[(3'h7):(1'h0)] ~^ (+(~&(!wire2)))) ?
                  ((wire6[(2'h3):(1'h0)] ?
                          wire2[(2'h2):(2'h2)] : (~^$signed(reg16))) ?
                      $signed((-(!(7'h40)))) : $unsigned($unsigned((wire0 ?
                          reg9 : (8'hb6))))) : reg16);
            end
          else
            begin
              reg15 <= $signed({{$unsigned((wire3 <<< wire3)),
                      (~wire2[(1'h0):(1'h0)])},
                  reg18[(3'h6):(1'h1)]});
            end
        end
      else
        begin
          reg15 <= $unsigned({(reg11[(3'h5):(2'h3)] ?
                  (+$signed(reg9)) : reg17[(3'h5):(2'h3)])});
          reg16 <= reg17;
        end
    end
  always
    @(posedge clk) begin
      reg19 <= (|$signed(((8'ha0) > ((reg12 ? reg12 : reg10) == reg12))));
      reg20 <= $signed((reg19[(4'ha):(2'h2)] * ($signed((reg10 ?
              reg11 : reg13)) ?
          {reg19, $unsigned(wire1)} : wire0[(3'h5):(1'h1)])));
    end
  assign wire21 = (($unsigned((reg19 >> (wire2 ?
                      wire2 : reg14))) ^ reg16[(3'h4):(2'h3)]) < ((reg12[(4'h9):(2'h3)] ?
                      reg15 : (wire0[(4'h9):(4'h8)] ?
                          {wire1, wire6} : reg19[(3'h6):(1'h0)])) - reg20));
  assign wire22 = $signed(wire5);
  module23 #() modinst78 (.wire24(reg11), .wire25(reg16), .wire27(reg19), .wire26(reg20), .clk(clk), .y(wire77));
  assign wire79 = (({wire0[(3'h6):(2'h2)],
                          $unsigned((reg19 | (8'ha7)))} >> (~&(!$signed(wire2)))) ?
                      $unsigned(reg13[(4'h8):(1'h1)]) : $signed($signed({(7'h42),
                          $unsigned(reg12)})));
  assign wire80 = $unsigned($unsigned({wire8}));
  assign wire81 = ((wire79[(4'he):(4'h8)] << wire1[(4'hc):(2'h2)]) ?
                      $signed((reg13 > $unsigned(((8'hba) ?
                          reg20 : reg10)))) : ({$unsigned((wire7 ?
                              wire4 : reg11))} ^~ $signed((8'ha5))));
  assign wire82 = wire79[(4'ha):(2'h3)];
  always
    @(posedge clk) begin
      if (((reg17[(1'h0):(1'h0)] >> $signed(($signed(wire3) ?
              wire79 : (~reg19)))) ?
          $signed((reg16[(4'h8):(3'h5)] < $unsigned($signed(wire22)))) : (^~$signed(reg18))))
        begin
          reg83 <= $unsigned((!($signed(wire1) ?
              wire5 : (wire2 < $signed(wire4)))));
          reg84 <= {$unsigned((+$unsigned((!wire7))))};
          reg85 <= ((reg18[(4'h8):(3'h7)] ?
              $unsigned(wire3[(3'h5):(1'h0)]) : reg13) * (7'h42));
          reg86 <= {wire81};
          reg87 <= reg84[(2'h2):(2'h2)];
        end
      else
        begin
          reg83 <= $unsigned({$unsigned($unsigned((reg17 & (8'hbf))))});
        end
    end
  assign wire88 = wire7[(4'hf):(2'h3)];
  assign wire89 = (&((8'ha2) + (^($unsigned(wire5) <= {wire6, wire80}))));
  assign wire90 = $signed(($unsigned($unsigned((reg12 <<< wire6))) <<< reg86));
  assign wire91 = (!wire21[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg92 <= $signed($signed(wire21[(1'h0):(1'h0)]));
      reg93 <= (({wire80[(4'ha):(4'h8)]} ?
          ((wire81 ? (reg18 << wire3) : $unsigned(wire88)) ?
              (~^((8'hb9) > wire5)) : (!(reg12 ?
                  wire90 : reg17))) : {$signed(wire8),
              ({(7'h40), wire88} ? $unsigned(reg9) : wire80)}) << reg86);
      reg94 <= wire91;
      reg95 <= ($unsigned((-{wire4[(1'h1):(1'h1)]})) || $signed(reg19));
    end
  assign wire96 = (((-$signed($signed(wire22))) ?
                      (+wire5) : wire22) * (!reg95));
  module97 #() modinst171 (wire170, clk, wire5, wire0, wire79, wire6, reg86);
endmodule

module module97  (y, clk, wire102, wire101, wire100, wire99, wire98);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire102;
  input wire signed [(3'h7):(1'h0)] wire101;
  input wire [(5'h15):(1'h0)] wire100;
  input wire signed [(4'hf):(1'h0)] wire99;
  input wire [(2'h3):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire169;
  wire signed [(4'hd):(1'h0)] wire168;
  wire [(4'hf):(1'h0)] wire139;
  wire signed [(5'h10):(1'h0)] wire105;
  wire [(4'hb):(1'h0)] wire104;
  wire [(5'h12):(1'h0)] wire103;
  wire [(4'h8):(1'h0)] wire141;
  wire signed [(4'hf):(1'h0)] wire142;
  wire signed [(5'h13):(1'h0)] wire143;
  wire [(3'h4):(1'h0)] wire148;
  wire signed [(3'h6):(1'h0)] wire149;
  wire signed [(4'he):(1'h0)] wire166;
  reg signed [(4'hf):(1'h0)] reg147 = (1'h0);
  reg [(3'h7):(1'h0)] reg146 = (1'h0);
  reg [(5'h14):(1'h0)] reg145 = (1'h0);
  reg [(3'h4):(1'h0)] reg144 = (1'h0);
  assign y = {wire169,
                 wire168,
                 wire139,
                 wire105,
                 wire104,
                 wire103,
                 wire141,
                 wire142,
                 wire143,
                 wire148,
                 wire149,
                 wire166,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 (1'h0)};
  assign wire103 = wire101;
  assign wire104 = ($signed({wire99}) ~^ (wire98 ?
                       ((|(7'h43)) - wire99) : (&((wire101 ?
                           wire98 : wire103) * (!wire101)))));
  assign wire105 = (-({$unsigned(wire102),
                       wire100} != ((wire99 | $signed(wire101)) ?
                       (((8'ha9) == wire102) ?
                           (8'hb5) : (wire100 ?
                               wire103 : wire104)) : ($unsigned((8'hb7)) ?
                           wire102[(2'h2):(1'h0)] : (wire100 < wire102)))));
  module106 #() modinst140 (wire139, clk, wire103, wire100, wire105, wire102, wire101);
  assign wire141 = (&wire102);
  assign wire142 = wire104[(3'h4):(3'h4)];
  assign wire143 = $unsigned((^~(wire104 - ($signed((8'hbe)) ?
                       wire101[(3'h5):(3'h5)] : wire142[(3'h7):(2'h3)]))));
  always
    @(posedge clk) begin
      reg144 <= wire99[(2'h3):(2'h2)];
      reg145 <= wire100;
      reg146 <= $unsigned(($unsigned((!(-wire102))) <<< (~^((!wire104) ?
          (|wire104) : (reg145 << (8'ha5))))));
      reg147 <= wire104[(1'h0):(1'h0)];
    end
  assign wire148 = $unsigned((8'hbf));
  assign wire149 = (!(+((8'hbe) ^~ ((|wire105) & $unsigned(wire98)))));
  module150 #() modinst167 (wire166, clk, reg147, wire139, wire143, reg145, wire99);
  assign wire168 = $signed((^~reg145[(3'h6):(1'h0)]));
  assign wire169 = $signed(wire168);
endmodule

module module23  (y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire27;
  input wire signed [(5'h10):(1'h0)] wire26;
  input wire signed [(5'h12):(1'h0)] wire25;
  input wire [(4'hf):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire76;
  wire signed [(4'hc):(1'h0)] wire75;
  wire [(3'h4):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire42;
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire73,
                 wire57,
                 wire56,
                 wire55,
                 wire44,
                 wire42,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  module28 #() modinst43 (.wire32(wire27), .wire33(wire24), .y(wire42), .wire29((8'hbe)), .clk(clk), .wire30(wire25), .wire31(wire26));
  assign wire44 = wire24;
  always
    @(posedge clk) begin
      reg45 <= $signed((($signed($signed(wire42)) ?
          {(^wire42)} : (~|$unsigned(wire26))) && ($signed((wire42 || wire27)) * $unsigned(wire26))));
      reg46 <= ($signed((8'hb0)) ?
          $unsigned($signed(wire25[(4'hb):(3'h5)])) : $unsigned($signed(wire25)));
      reg47 <= ($signed(wire44[(4'hc):(1'h1)]) ^~ (|(^($unsigned(wire24) >> (8'hbd)))));
      if ((+(|(wire42[(2'h2):(1'h1)] > wire26))))
        begin
          reg48 <= wire25[(4'hc):(3'h6)];
          reg49 <= $signed((($signed($unsigned(wire24)) ?
                  {wire24} : ($unsigned((8'hbc)) != reg48)) ?
              (8'h9e) : wire42[(4'hd):(1'h0)]));
          reg50 <= reg49;
          reg51 <= $unsigned($unsigned(reg48[(1'h0):(1'h0)]));
          reg52 <= (^$unsigned((^$signed($unsigned((8'hb8))))));
        end
      else
        begin
          if ($signed($signed(({(8'ha3)} >>> $unsigned(reg47)))))
            begin
              reg48 <= {(8'hb8)};
              reg49 <= reg45[(2'h2):(1'h1)];
              reg50 <= (reg46[(4'hd):(4'h8)] > wire27[(2'h3):(2'h3)]);
            end
          else
            begin
              reg48 <= {($signed($unsigned(reg51)) ~^ wire44),
                  $unsigned(reg47)};
              reg49 <= $signed(((({reg50} || $unsigned(reg46)) ?
                  ($signed(wire42) ?
                      reg50 : $unsigned(wire24)) : wire26[(3'h6):(3'h4)]) * $unsigned(reg50[(3'h5):(1'h1)])));
              reg50 <= (8'h9f);
              reg51 <= wire26[(4'hc):(3'h7)];
              reg52 <= $unsigned($unsigned($unsigned({(wire44 ?
                      (8'hbd) : wire42),
                  wire42[(1'h0):(1'h0)]})));
            end
          reg53 <= $unsigned($signed($signed((wire27[(4'h9):(2'h3)] ~^ $signed((8'h9f))))));
        end
      reg54 <= wire26;
    end
  assign wire55 = wire25[(3'h5):(2'h3)];
  assign wire56 = wire42;
  assign wire57 = (^(wire55 || {({wire26, reg53} ~^ reg48),
                      {((8'hb7) ? reg48 : (8'hb9))}}));
  module58 #() modinst74 (wire73, clk, wire44, wire57, wire55, wire25);
  assign wire75 = {((!$signed({wire44, (8'hb9)})) ?
                          $signed((^~$signed(wire57))) : $signed($signed((-wire57)))),
                      (~^(((wire44 ? reg45 : reg50) ?
                          $signed((8'hb7)) : (reg54 ?
                              reg47 : wire26)) >>> (!$unsigned((8'ha4)))))};
  assign wire76 = $signed(wire73);
endmodule

module module58
#(parameter param72 = ({(~^(+((8'hb5) ? (8'hb8) : (8'haf)))), (&({(8'hb6), (8'hab)} < (|(8'hb3))))} ? {((((8'ha6) ? (7'h40) : (8'ha8)) ? (~|(8'ha0)) : (8'hb5)) ~^ (^~((8'hbb) ? (8'had) : (8'hb6))))} : ((8'ha4) <= (~^(((7'h42) ^~ (7'h42)) ? ((8'h9f) ? (8'hb0) : (8'hb3)) : (^~(8'ha9)))))))
(y, clk, wire62, wire61, wire60, wire59);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire62;
  input wire [(3'h5):(1'h0)] wire61;
  input wire signed [(4'hc):(1'h0)] wire60;
  input wire signed [(4'ha):(1'h0)] wire59;
  wire signed [(3'h6):(1'h0)] wire71;
  wire signed [(4'h9):(1'h0)] wire70;
  wire [(4'hb):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire68;
  wire [(2'h3):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire66;
  wire [(3'h6):(1'h0)] wire65;
  wire [(4'ha):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire63;
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 (1'h0)};
  assign wire63 = wire62;
  assign wire64 = $signed(($signed((!wire60[(2'h2):(1'h0)])) ?
                      wire62 : $signed(($unsigned(wire62) && $signed(wire60)))));
  assign wire65 = ((-$unsigned(wire63)) ^~ $unsigned(({(|(8'hbe)),
                      (~&wire64)} <<< (^~$unsigned(wire64)))));
  assign wire66 = wire65;
  assign wire67 = (wire62[(1'h1):(1'h0)] >>> wire63[(1'h0):(1'h0)]);
  assign wire68 = wire64[(1'h0):(1'h0)];
  assign wire69 = (~(wire62 ? (~^{(8'ha2)}) : wire59[(2'h3):(2'h3)]));
  assign wire70 = (($signed(wire69) ?
                      $unsigned((^(wire69 ^~ wire63))) : (wire60 <= ($unsigned(wire64) ?
                          (wire63 ?
                              (7'h42) : wire66) : (wire67 ^ wire65)))) < (!wire66));
  assign wire71 = $unsigned($unsigned($unsigned(wire66)));
endmodule

module module28
#(parameter param40 = ((((^~((8'h9f) ? (8'ha5) : (8'ha4))) ? {{(8'hbd), (8'hb1)}, ((8'hbe) ? (7'h42) : (7'h41))} : {((8'hbd) ? (8'ha3) : (8'hb4))}) | (-{((8'ha7) ? (8'hbf) : (8'hbc))})) == (((-((8'hb5) ~^ (8'haf))) <= (8'hbd)) ? {(~((8'haa) * (8'hb4)))} : (~|(-((8'ha7) == (8'hb0)))))), 
parameter param41 = ((param40 ? param40 : param40) >> (7'h41)))
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire33;
  input wire signed [(4'h9):(1'h0)] wire32;
  input wire signed [(3'h6):(1'h0)] wire31;
  input wire [(5'h11):(1'h0)] wire30;
  input wire [(4'ha):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire34;
  assign y = {wire39, wire38, wire37, wire36, wire35, wire34, (1'h0)};
  assign wire34 = $unsigned((wire29[(4'ha):(3'h7)] + $signed($unsigned($signed(wire32)))));
  assign wire35 = wire31[(2'h3):(1'h1)];
  assign wire36 = wire31[(2'h3):(1'h0)];
  assign wire37 = $unsigned({((8'ha1) ?
                          ((wire30 - (8'h9f)) & (wire30 ?
                              wire31 : wire33)) : (wire31[(3'h6):(1'h1)] ?
                              {wire30, wire32} : $signed(wire36)))});
  assign wire38 = wire31;
  assign wire39 = {$signed((!$unsigned((!(8'h9f))))), wire35};
endmodule

module module150
#(parameter param164 = ((^~((+((8'hb6) > (8'hb0))) > (~&{(8'ha5), (8'haa)}))) + {(({(8'haf)} >> ((8'hb9) - (8'haf))) + (((8'hb6) ? (8'hb7) : (7'h43)) ? {(8'hb7), (7'h43)} : (!(8'hab))))}), 
parameter param165 = (param164 + ({param164, param164} ^ param164)))
(y, clk, wire155, wire154, wire153, wire152, wire151);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire155;
  input wire signed [(4'hf):(1'h0)] wire154;
  input wire signed [(4'ha):(1'h0)] wire153;
  input wire [(4'h9):(1'h0)] wire152;
  input wire [(3'h5):(1'h0)] wire151;
  wire signed [(4'hc):(1'h0)] wire163;
  wire [(4'he):(1'h0)] wire162;
  wire signed [(2'h2):(1'h0)] wire161;
  wire [(3'h4):(1'h0)] wire160;
  wire [(5'h12):(1'h0)] wire156;
  reg [(4'hf):(1'h0)] reg159 = (1'h0);
  reg [(3'h6):(1'h0)] reg158 = (1'h0);
  reg [(4'hc):(1'h0)] reg157 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire156,
                 reg159,
                 reg158,
                 reg157,
                 (1'h0)};
  assign wire156 = $unsigned((+$signed(wire152)));
  always
    @(posedge clk) begin
      reg157 <= wire152;
      reg158 <= $signed(wire154[(1'h1):(1'h0)]);
      reg159 <= $unsigned(((({wire153} && $signed((7'h41))) * (~$signed((8'haf)))) ?
          wire154 : wire155));
    end
  assign wire160 = wire156;
  assign wire161 = wire154;
  assign wire162 = $signed((-($signed(wire161[(2'h2):(1'h0)]) ?
                       $signed(reg157) : ((wire155 < wire152) >= $signed((8'ha9))))));
  assign wire163 = (($unsigned(wire162) ?
                           (^~reg157[(4'hb):(1'h0)]) : $unsigned((wire162[(3'h5):(1'h1)] ?
                               $unsigned(wire162) : {wire154}))) ?
                       reg157[(1'h1):(1'h0)] : wire154);
endmodule

module module106  (y, clk, wire111, wire110, wire109, wire108, wire107);
  output wire [(32'h12c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire111;
  input wire [(4'hf):(1'h0)] wire110;
  input wire [(5'h10):(1'h0)] wire109;
  input wire signed [(5'h13):(1'h0)] wire108;
  input wire signed [(3'h7):(1'h0)] wire107;
  wire [(4'he):(1'h0)] wire138;
  wire signed [(4'he):(1'h0)] wire137;
  wire signed [(3'h4):(1'h0)] wire132;
  wire signed [(2'h2):(1'h0)] wire131;
  wire [(4'he):(1'h0)] wire130;
  wire [(2'h3):(1'h0)] wire129;
  wire [(4'hc):(1'h0)] wire128;
  wire signed [(3'h7):(1'h0)] wire127;
  wire signed [(4'hc):(1'h0)] wire126;
  wire [(5'h15):(1'h0)] wire125;
  wire [(4'h9):(1'h0)] wire124;
  wire signed [(5'h11):(1'h0)] wire123;
  wire signed [(5'h14):(1'h0)] wire121;
  wire [(5'h11):(1'h0)] wire120;
  wire signed [(3'h7):(1'h0)] wire119;
  wire [(3'h4):(1'h0)] wire118;
  wire [(2'h2):(1'h0)] wire112;
  reg signed [(5'h12):(1'h0)] reg136 = (1'h0);
  reg [(2'h2):(1'h0)] reg135 = (1'h0);
  reg [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(3'h4):(1'h0)] reg133 = (1'h0);
  reg [(4'hd):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg117 = (1'h0);
  reg [(4'he):(1'h0)] reg116 = (1'h0);
  reg [(5'h14):(1'h0)] reg115 = (1'h0);
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg113 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire112,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg122,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 (1'h0)};
  assign wire112 = $signed(wire111);
  always
    @(posedge clk) begin
      reg113 <= wire112;
      reg114 <= $signed(((wire107 | wire107[(3'h5):(1'h0)]) ?
          ((|wire110) | $unsigned((wire111 && wire112))) : (~^$signed(((8'ha4) ?
              wire112 : wire112)))));
      reg115 <= (({wire110} + wire111) ?
          ($unsigned(($signed((8'ha1)) ?
              (8'ha6) : {wire107})) >>> $signed(reg113)) : {$unsigned((8'hbc)),
              {wire109, {(reg114 ? wire112 : wire112)}}});
      reg116 <= $unsigned(wire107);
      reg117 <= wire111[(1'h1):(1'h0)];
    end
  assign wire118 = $unsigned({$signed(((wire110 ? reg117 : reg115) ?
                           (reg116 & wire108) : (-reg116)))});
  assign wire119 = (($unsigned(($unsigned(wire110) == (^wire111))) ?
                           wire109 : $unsigned($signed(wire107[(1'h1):(1'h1)]))) ?
                       (($unsigned($unsigned((8'hb9))) <<< ($signed(wire109) - $unsigned((8'hb7)))) - $unsigned(wire112[(1'h1):(1'h1)])) : $unsigned($signed(($unsigned(wire112) || (wire111 ?
                           (8'hb7) : wire108)))));
  assign wire120 = $unsigned(($unsigned($unsigned($signed(wire119))) ?
                       (wire118 ?
                           $unsigned(wire109[(4'hb):(4'hb)]) : ($signed(reg113) ?
                               (wire118 + wire119) : ((8'ha6) ~^ wire109))) : (+((reg115 ?
                               wire111 : wire111) ?
                           (8'hb1) : reg116))));
  assign wire121 = (({{wire118, $signed((8'hb9))}} ~^ (reg115 ?
                           $unsigned($unsigned(wire119)) : ({wire119} << (reg114 ?
                               reg117 : wire108)))) ?
                       reg115[(5'h10):(3'h7)] : wire111);
  always
    @(posedge clk) begin
      reg122 <= (~|(wire118 ?
          (-(~(wire120 ? wire120 : (8'hae)))) : wire118[(1'h1):(1'h0)]));
    end
  assign wire123 = (~&wire119[(3'h6):(3'h5)]);
  assign wire124 = wire120;
  assign wire125 = reg113;
  assign wire126 = wire107;
  assign wire127 = (^~(reg115[(4'he):(3'h5)] ?
                       $signed(wire119[(1'h1):(1'h1)]) : wire125[(3'h7):(2'h2)]));
  assign wire128 = ($unsigned(wire110) & wire111);
  assign wire129 = $unsigned((wire107 ?
                       wire124[(3'h5):(3'h5)] : $signed(({reg117, wire109} ?
                           wire125[(3'h5):(3'h5)] : $unsigned(wire109)))));
  assign wire130 = reg116;
  assign wire131 = (-$unsigned((wire120 ?
                       {((8'hbc) + wire109)} : (-(reg113 + reg117)))));
  assign wire132 = $unsigned($unsigned(((8'hb8) <<< (reg114 << (~&wire120)))));
  always
    @(posedge clk) begin
      if ((~^$signed($signed(reg113[(4'hb):(3'h5)]))))
        begin
          reg133 <= $unsigned((~&({{wire127}} ?
              $signed((^wire118)) : ($signed(wire119) != reg116[(2'h2):(1'h0)]))));
        end
      else
        begin
          reg133 <= wire118;
          reg134 <= ($unsigned($signed((~|reg117))) ?
              ((($unsigned(wire123) ?
                          wire131[(1'h0):(1'h0)] : reg116[(4'hd):(1'h0)]) ?
                      reg115 : wire111) ?
                  ((8'h9f) != (8'h9f)) : wire129[(2'h3):(1'h0)]) : ($unsigned({((8'hb5) && wire119),
                      wire110[(2'h2):(1'h0)]}) ?
                  wire111 : wire125));
        end
      reg135 <= wire119[(2'h2):(1'h1)];
      reg136 <= $unsigned($signed(($signed(wire118) >> wire118)));
    end
  assign wire137 = wire121;
  assign wire138 = wire126[(2'h3):(1'h1)];
endmodule
