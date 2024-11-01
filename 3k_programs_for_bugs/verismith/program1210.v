module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h224):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire3;
  wire signed [(4'hd):(1'h0)] wire88;
  wire [(5'h11):(1'h0)] wire87;
  wire signed [(5'h13):(1'h0)] wire86;
  wire signed [(3'h5):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire81;
  wire signed [(4'hb):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire79;
  wire signed [(4'hf):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire76;
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg78 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire76,
                 reg85,
                 reg78,
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
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 (1'h0)};
  assign wire4 = $signed($signed(($unsigned((wire3 || wire2)) ?
                     wire0 : $signed(wire3))));
  assign wire5 = $unsigned(wire1);
  assign wire6 = (^~((~|wire5) ?
                     $signed($unsigned(wire1)) : $unsigned(((wire2 ^ wire1) - wire2))));
  assign wire7 = (~&$unsigned(wire6[(4'h8):(3'h5)]));
  assign wire8 = $signed(($signed((wire2[(3'h4):(2'h2)] || (wire6 ?
                         wire6 : wire6))) ?
                     $unsigned(($signed(wire3) ~^ (&wire7))) : wire7));
  assign wire9 = wire7[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      if (wire8)
        begin
          reg10 <= {{$signed($signed(wire5[(2'h3):(1'h0)])),
                  $signed(((wire0 ? wire9 : wire4) || $unsigned(wire2)))},
              $signed((((+wire4) >= (-wire4)) ? wire2[(3'h7):(3'h5)] : wire4))};
        end
      else
        begin
          reg10 <= wire6;
          reg11 <= reg10[(2'h3):(2'h3)];
          reg12 <= (-(wire6[(1'h0):(1'h0)] || wire2[(3'h4):(1'h0)]));
          reg13 <= ($unsigned($unsigned((~|$unsigned(wire8)))) ?
              reg12[(3'h5):(2'h3)] : $signed(wire2));
          if (wire7[(3'h7):(2'h3)])
            begin
              reg14 <= (($unsigned((-{wire8})) && $signed((-{(8'had)}))) >>> (^$unsigned($signed($signed(wire1)))));
            end
          else
            begin
              reg14 <= reg14;
            end
        end
      if ($signed(wire6))
        begin
          reg15 <= $signed($unsigned($signed((wire7 >> $signed((8'h9f))))));
          reg16 <= $unsigned(((~^reg12) ?
              wire9[(1'h0):(1'h0)] : $signed($unsigned($signed(reg11)))));
          reg17 <= (wire2 ? $unsigned(wire6[(2'h2):(1'h0)]) : reg12);
          reg18 <= $unsigned(wire3);
          if ({$unsigned((8'hbc)), {$signed(wire9[(4'he):(4'he)])}})
            begin
              reg19 <= reg17[(5'h12):(5'h11)];
              reg20 <= (~|wire4);
              reg21 <= wire1[(4'hb):(4'ha)];
            end
          else
            begin
              reg19 <= ((|$unsigned(wire9)) >> wire0);
              reg20 <= reg21[(5'h11):(4'ha)];
              reg21 <= {wire3[(1'h0):(1'h0)],
                  ((+$signed((reg18 & reg19))) & reg15)};
              reg22 <= (8'ha2);
            end
        end
      else
        begin
          reg15 <= $unsigned(wire2[(3'h6):(2'h2)]);
          reg16 <= (&((8'hb4) ?
              wire6 : {((wire8 ? (8'hbf) : wire5) <= $unsigned(wire0)),
                  {$unsigned((8'ha7)), (wire3 != reg10)}}));
        end
      reg23 <= (&reg17);
      if ((({($signed(reg19) >>> {reg18}), $signed((~&(8'hb7)))} ?
          reg10 : (wire4 <= (^wire2[(3'h7):(2'h2)]))) + reg15))
        begin
          reg24 <= $signed(($unsigned((((8'h9d) ?
                  (8'haf) : reg16) > $signed(wire4))) ?
              (~&(8'hae)) : $signed(wire0)));
        end
      else
        begin
          if (($unsigned(($unsigned(wire4[(3'h7):(1'h1)]) ?
                  ($unsigned(reg16) ?
                      $unsigned(reg15) : (reg23 >= (8'hbd))) : {wire7[(5'h12):(4'h8)]})) ?
              wire0[(1'h0):(1'h0)] : $unsigned({(reg13 ?
                      {(8'hbe)} : (reg21 ? reg15 : reg10)),
                  (^~(wire5 ? (8'hbb) : (7'h43)))})))
            begin
              reg24 <= wire5[(2'h3):(1'h0)];
            end
          else
            begin
              reg24 <= ($signed(reg13[(4'he):(4'hb)]) ?
                  $signed($unsigned(((-reg19) != reg13))) : $signed((^~((~|wire5) ^~ (8'h9c)))));
              reg25 <= reg20[(4'ha):(3'h7)];
              reg26 <= ((~^$unsigned(wire8[(1'h1):(1'h0)])) && reg11[(2'h3):(2'h3)]);
            end
          reg27 <= ((reg23[(1'h1):(1'h0)] ?
                  wire0[(3'h4):(1'h1)] : wire3[(1'h1):(1'h1)]) ?
              (+(|wire8)) : $unsigned((~^(^~(~|reg11)))));
          if ((reg21[(5'h13):(3'h6)] ^~ reg22))
            begin
              reg28 <= (((reg23 ?
                      {((8'had) ? reg24 : reg21),
                          (reg19 ? reg14 : reg22)} : (!(reg17 != wire7))) ?
                  $unsigned((+$unsigned((8'h9d)))) : $signed($unsigned(wire2))) != $unsigned(((reg19[(1'h0):(1'h0)] ?
                  wire8 : (reg16 * (8'hb2))) <<< ($unsigned(reg24) ?
                  reg11 : {reg13}))));
              reg29 <= ((((^$signed(reg21)) ?
                      (((7'h42) <= reg15) ?
                          $signed(wire7) : (!reg24)) : ((reg20 && reg13) ?
                          (reg13 >>> wire9) : (reg24 ^~ wire3))) ?
                  reg21 : {reg13,
                      $unsigned((reg25 ?
                          reg24 : reg26))}) * $unsigned((8'hb8)));
              reg30 <= ((wire3[(3'h6):(1'h1)] ?
                  {reg22,
                      reg19} : reg17) << ($unsigned($signed($signed(wire1))) ?
                  wire3[(3'h4):(2'h2)] : $unsigned(((reg10 ?
                      wire9 : wire7) && ((8'ha6) == reg13)))));
              reg31 <= (($unsigned((~&(reg25 ~^ reg15))) < $signed((|reg20[(3'h6):(1'h1)]))) ?
                  ((+({reg22, reg27} >>> (reg17 > wire9))) ?
                      wire4[(4'hf):(4'hd)] : wire2[(1'h0):(1'h0)]) : (reg25 ?
                      reg13 : (reg16[(1'h1):(1'h0)] ?
                          (((8'hbd) ? reg10 : reg25) ?
                              (!reg22) : {(8'hb8), reg10}) : ((8'ha3) | (reg28 ?
                              wire2 : reg27)))));
              reg32 <= ($signed(wire6) >>> wire2);
            end
          else
            begin
              reg28 <= wire9[(4'hc):(2'h3)];
              reg29 <= wire2[(3'h7):(2'h2)];
            end
          reg33 <= (!$unsigned(reg18[(4'ha):(3'h5)]));
          reg34 <= (($unsigned(reg12[(2'h3):(1'h0)]) << $unsigned(wire1[(3'h7):(3'h5)])) > $signed($unsigned($signed($signed(reg33)))));
        end
      reg35 <= wire1;
    end
  module36 #() modinst77 (.wire37(wire4), .wire40(reg27), .y(wire76), .wire38(reg12), .clk(clk), .wire39(reg16));
  always
    @(posedge clk) begin
      reg78 <= ((+(((8'hbb) ? (reg21 && wire9) : ((7'h42) & reg21)) ?
              (wire2 && $unsigned((8'hb7))) : wire8[(2'h2):(2'h2)])) ?
          reg31[(2'h2):(2'h2)] : wire5);
    end
  assign wire79 = (^$unsigned(reg78[(2'h2):(1'h0)]));
  assign wire80 = $unsigned($unsigned($signed($unsigned((reg10 ~^ wire1)))));
  assign wire81 = (reg13[(4'ha):(3'h5)] ?
                      (~&({$unsigned(reg16)} ?
                          $signed({reg27,
                              (7'h40)}) : $unsigned((~|reg12)))) : (|$signed($signed(reg13[(1'h1):(1'h0)]))));
  assign wire82 = reg13;
  assign wire83 = $signed($signed(($signed($signed(reg21)) && wire3)));
  assign wire84 = $signed(reg11[(3'h6):(2'h3)]);
  always
    @(posedge clk) begin
      reg85 <= wire82[(2'h3):(2'h2)];
    end
  assign wire86 = $signed(($signed($unsigned({reg12,
                      reg32})) <= wire3[(1'h0):(1'h0)]));
  assign wire87 = wire5;
  assign wire88 = (~^($unsigned({(reg33 ? wire4 : reg23),
                      $unsigned(wire0)}) <<< {$unsigned((~&reg23)),
                      $unsigned($signed(reg22))}));
endmodule

module module36  (y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire40;
  input wire signed [(5'h14):(1'h0)] wire39;
  input wire signed [(4'hf):(1'h0)] wire38;
  input wire signed [(4'ha):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire75;
  wire signed [(5'h13):(1'h0)] wire74;
  wire signed [(5'h13):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire63;
  wire signed [(3'h5):(1'h0)] wire62;
  wire signed [(5'h13):(1'h0)] wire60;
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg67 = (1'h0);
  reg [(5'h12):(1'h0)] reg66 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire60,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  module41 #() modinst61 (.wire45(wire38), .wire43(wire37), .y(wire60), .clk(clk), .wire42(wire40), .wire44(wire39));
  assign wire62 = $signed(wire38[(4'h9):(1'h0)]);
  assign wire63 = wire39[(2'h2):(1'h1)];
  assign wire64 = ($signed({$signed((wire63 && wire60)), wire62}) ?
                      $signed(({(~|wire40), $unsigned(wire63)} ?
                          (~|wire38[(3'h5):(1'h1)]) : $signed($unsigned(wire60)))) : $signed((8'hb7)));
  assign wire65 = wire64;
  always
    @(posedge clk) begin
      reg66 <= $unsigned(({(8'hb6), ((wire60 ? wire60 : wire60) >= (&wire40))} ?
          wire63[(4'ha):(4'h8)] : (wire65[(3'h5):(2'h3)] ?
              {((8'hbc) <= wire38), (~|wire39)} : (~&(~wire65)))));
      if ((!(!wire38[(4'hf):(4'hf)])))
        begin
          reg67 <= (~^(-(8'hbd)));
          reg68 <= (^~{(($unsigned(wire40) ?
                  (!wire62) : $signed(wire40)) >> (wire38 ?
                  {wire39, reg66} : (+wire63))),
              (wire65 ?
                  (wire39 < (wire39 ? reg67 : wire63)) : $signed(wire60))});
        end
      else
        begin
          reg67 <= reg68[(4'he):(3'h4)];
        end
      reg69 <= $unsigned($unsigned(((8'hbc) ? (~^wire38) : wire63)));
      reg70 <= reg68[(4'hb):(3'h6)];
      reg71 <= wire39;
    end
  assign wire72 = ($signed($unsigned((wire39 ?
                      wire64[(4'hc):(4'hb)] : (&reg67)))) == $signed((~({reg67,
                          wire65} ?
                      $unsigned(wire37) : {(8'ha8), (8'hb5)}))));
  assign wire73 = ({(&(8'haa))} <= $signed(wire37));
  assign wire74 = $unsigned((({(wire73 ^ wire64), {(8'hb2), reg68}} ?
                      wire64 : wire39[(3'h7):(3'h6)]) || (!($unsigned(reg70) ?
                      $unsigned(wire73) : {reg68, wire62}))));
  assign wire75 = (~|$signed(wire63));
endmodule

module module41
#(parameter param59 = (((+{((8'hbc) >= (8'hbc))}) ? (-{((8'ha1) ~^ (8'hb1))}) : (({(8'hbf), (8'hb8)} ? (~&(8'hb4)) : ((8'haf) ? (8'haf) : (8'had))) ? (((8'h9e) <<< (7'h44)) ^ (^~(8'hb1))) : {(~&(8'hbd)), {(8'h9c), (8'h9f)}})) ? (8'hbb) : (((((8'hb9) >>> (8'ha7)) ? ((8'hb9) ? (8'hbd) : (7'h42)) : ((8'hac) ? (8'hba) : (8'hb8))) << (((8'hb1) ^ (8'hae)) && ((7'h41) >> (7'h43)))) >> ((^~(8'h9f)) || ((^(8'haa)) > ((8'hb5) ? (8'ha4) : (8'ha8)))))))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire45;
  input wire [(4'hd):(1'h0)] wire44;
  input wire signed [(4'ha):(1'h0)] wire43;
  input wire [(3'h7):(1'h0)] wire42;
  wire [(4'hd):(1'h0)] wire58;
  wire signed [(2'h3):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  wire signed [(3'h4):(1'h0)] wire55;
  wire signed [(2'h3):(1'h0)] wire54;
  wire signed [(4'hb):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire52;
  wire signed [(5'h10):(1'h0)] wire51;
  wire [(4'hd):(1'h0)] wire50;
  wire [(3'h7):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire48;
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
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
      reg46 <= $signed((^wire43[(4'h9):(1'h0)]));
      reg47 <= $signed($signed({(|wire44[(4'ha):(1'h1)]),
          $unsigned((wire44 ? wire45 : reg46))}));
    end
  assign wire48 = reg47;
  assign wire49 = (+($signed({(^wire43)}) ? {reg47} : reg47[(3'h4):(2'h3)]));
  assign wire50 = $signed(($unsigned(wire44) ?
                      wire43 : ((8'hb5) & $unsigned((-reg47)))));
  assign wire51 = (~&(-$unsigned($unsigned((reg46 ? wire48 : wire42)))));
  assign wire52 = ({wire42[(2'h3):(2'h3)],
                      wire49[(1'h1):(1'h1)]} & ((~^$unsigned(wire42[(1'h0):(1'h0)])) | (~|(wire49 ?
                      $signed(wire49) : wire50))));
  assign wire53 = $unsigned(wire44);
  assign wire54 = wire48;
  assign wire55 = wire52[(4'hb):(4'h9)];
  assign wire56 = ((|$unsigned(wire54[(2'h2):(1'h1)])) + {wire53[(4'h9):(4'h8)],
                      $signed($signed({wire51, wire44}))});
  assign wire57 = wire48[(1'h0):(1'h0)];
  assign wire58 = wire48;
endmodule
