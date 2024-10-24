module top
#(parameter param162 = (!((~|{(8'haa)}) ? {(((8'hb6) << (8'hb1)) ? (-(8'hba)) : (~^(8'hb2)))} : ((((8'hb1) ? (8'hbf) : (7'h40)) ? ((7'h41) >> (8'hae)) : ((8'hb7) ? (8'hb0) : (8'hb7))) ? ((~|(8'hab)) ? ((8'haf) ^ (8'haf)) : (-(7'h44))) : {(^(8'ha3))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire161;
  wire [(5'h11):(1'h0)] wire160;
  wire signed [(4'hd):(1'h0)] wire159;
  wire signed [(4'he):(1'h0)] wire158;
  wire signed [(4'hd):(1'h0)] wire157;
  wire signed [(5'h15):(1'h0)] wire156;
  wire signed [(4'h9):(1'h0)] wire155;
  wire signed [(5'h12):(1'h0)] wire154;
  wire [(5'h10):(1'h0)] wire153;
  wire signed [(3'h6):(1'h0)] wire152;
  wire signed [(3'h6):(1'h0)] wire151;
  wire [(3'h4):(1'h0)] wire150;
  wire signed [(4'ha):(1'h0)] wire149;
  wire [(4'h9):(1'h0)] wire148;
  wire [(5'h14):(1'h0)] wire48;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire54;
  wire [(4'ha):(1'h0)] wire146;
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire48,
                 wire6,
                 wire5,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire146,
                 (1'h0)};
  assign wire5 = $unsigned((~&(+{wire0[(2'h2):(1'h1)]})));
  assign wire6 = (&$signed($signed((|(8'h9d)))));
  module7 #() modinst49 (.wire9(wire4), .wire8(wire0), .clk(clk), .wire11(wire6), .y(wire48), .wire12(wire5), .wire10(wire2));
  assign wire50 = {{($unsigned((~^(8'hb5))) ?
                              {$signed(wire6)} : wire5[(3'h6):(1'h0)]),
                          wire1[(3'h5):(3'h4)]}};
  assign wire51 = (wire1 ?
                      ((wire2 || $unsigned((wire5 ?
                          wire5 : wire4))) < $unsigned(((wire6 >> (8'hb9)) ?
                          (wire48 ?
                              wire3 : wire6) : wire2[(4'hc):(4'h8)]))) : $signed($unsigned(((~^wire2) ?
                          $unsigned(wire50) : (wire50 ? wire5 : wire3)))));
  assign wire52 = (~^(8'haa));
  assign wire53 = (8'ha8);
  assign wire54 = {$signed({(!$signed(wire2))})};
  module55 #() modinst147 (.clk(clk), .wire58(wire54), .wire56(wire1), .wire59(wire52), .wire60(wire48), .wire57(wire3), .y(wire146));
  assign wire148 = ((wire54[(4'hc):(1'h0)] ? (wire0 >>> (8'hb2)) : wire4) ?
                       ((wire6[(3'h7):(2'h2)] ?
                               (~&wire3[(1'h1):(1'h1)]) : wire1[(4'ha):(3'h4)]) ?
                           $signed({(wire51 ? wire2 : wire4),
                               wire0}) : wire51[(4'hb):(1'h1)]) : (^~wire52));
  assign wire149 = wire54[(5'h14):(2'h3)];
  assign wire150 = (~wire148);
  assign wire151 = (~|{(^~wire6)});
  assign wire152 = wire4;
  assign wire153 = wire1;
  assign wire154 = (^$unsigned($unsigned($signed(((8'ha7) ?
                       wire48 : (8'ha3))))));
  assign wire155 = wire2[(4'h9):(3'h7)];
  assign wire156 = (((+(|wire5[(3'h6):(2'h3)])) ?
                       wire48 : (|(wire53[(4'hf):(3'h7)] ~^ wire50))) || ($unsigned((wire150[(2'h3):(1'h1)] ?
                       (~|(8'hab)) : $signed(wire50))) >>> $signed($signed((wire48 ?
                       (8'h9e) : wire154)))));
  assign wire157 = $signed((8'ha2));
  assign wire158 = $unsigned(wire1[(3'h5):(2'h3)]);
  assign wire159 = wire53[(4'he):(4'hc)];
  assign wire160 = $unsigned($signed(wire54));
  assign wire161 = wire153[(3'h6):(2'h3)];
endmodule

module module55
#(parameter param144 = (~|(8'ha0)), 
parameter param145 = (^param144))
(y, clk, wire56, wire57, wire58, wire59, wire60);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire56;
  input wire signed [(3'h6):(1'h0)] wire57;
  input wire [(5'h14):(1'h0)] wire58;
  input wire signed [(4'hd):(1'h0)] wire59;
  input wire [(5'h14):(1'h0)] wire60;
  wire [(4'hc):(1'h0)] wire143;
  wire [(5'h11):(1'h0)] wire93;
  wire signed [(2'h2):(1'h0)] wire95;
  wire signed [(4'he):(1'h0)] wire96;
  wire [(5'h15):(1'h0)] wire141;
  assign y = {wire143, wire93, wire95, wire96, wire141, (1'h0)};
  module61 #() modinst94 (.wire62(wire58), .wire65(wire56), .y(wire93), .wire63(wire57), .clk(clk), .wire64(wire60));
  assign wire95 = {wire60};
  assign wire96 = (!$unsigned($signed({$signed(wire58),
                      wire56[(5'h15):(4'he)]})));
  module97 #() modinst142 (.wire98(wire96), .wire100(wire58), .wire99(wire57), .clk(clk), .wire101(wire93), .y(wire141), .wire102(wire59));
  assign wire143 = $unsigned(((|({wire60,
                       wire57} != wire60[(3'h7):(1'h0)])) & $unsigned((^(|wire96)))));
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire12;
  input wire signed [(3'h5):(1'h0)] wire11;
  input wire [(5'h13):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire35;
  wire signed [(4'hb):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire30;
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  assign y = {wire47,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire8)
        begin
          reg13 <= $unsigned(($signed((8'hb9)) & $signed($signed(((8'hba) + wire12)))));
          if (wire12)
            begin
              reg14 <= $unsigned((~(($unsigned(reg13) <<< wire8) ?
                  wire10 : ((wire11 ? reg13 : wire11) ?
                      wire10 : (wire11 * wire8)))));
            end
          else
            begin
              reg14 <= ((reg13[(1'h0):(1'h0)] == ((wire10[(4'ha):(2'h2)] ?
                      (wire10 ?
                          reg14 : wire12) : $unsigned((7'h44))) * $unsigned((reg14 != reg13)))) ?
                  reg14[(3'h5):(1'h0)] : $signed((8'ha6)));
              reg15 <= wire12[(1'h0):(1'h0)];
              reg16 <= wire12[(3'h4):(1'h1)];
              reg17 <= $unsigned(wire12);
              reg18 <= ((~|wire10[(3'h4):(3'h4)]) != wire12);
            end
        end
      else
        begin
          if ((^($signed(($signed(reg17) < (wire11 ? (8'hb0) : wire8))) ?
              wire8[(4'ha):(4'h9)] : wire8)))
            begin
              reg13 <= wire11[(3'h5):(1'h1)];
              reg14 <= (~wire9[(3'h6):(2'h3)]);
              reg15 <= $unsigned($signed(wire8));
            end
          else
            begin
              reg13 <= ($signed((8'hae)) ?
                  $unsigned($unsigned($signed((reg16 >>> reg18)))) : ($unsigned(($unsigned(wire10) << wire9)) ?
                      (((8'hb0) ?
                          $unsigned(wire8) : (wire9 ?
                              wire12 : reg16)) + {(~|reg14),
                          {wire12}}) : $unsigned((((8'ha8) - reg13) <= (wire10 ^ reg15)))));
              reg14 <= (^~wire9[(4'hf):(4'ha)]);
              reg15 <= (wire11 > wire11[(1'h1):(1'h0)]);
            end
          if (($signed($signed(reg15)) ?
              $unsigned((wire12[(1'h0):(1'h0)] | ((reg13 ?
                  reg14 : reg17) || (wire12 | (8'h9c))))) : ((wire12 ?
                  reg17[(4'ha):(1'h1)] : ($unsigned((8'hba)) > reg14)) < wire10)))
            begin
              reg16 <= $signed(reg15);
              reg17 <= (($unsigned($signed((8'hac))) || $unsigned(((|wire10) | (~^(8'hba))))) ?
                  reg15 : (|reg17));
              reg18 <= (($signed($unsigned(wire9[(2'h3):(1'h1)])) | (($unsigned(wire8) < wire8) ^ $unsigned((reg15 ?
                  reg16 : reg15)))) & wire12);
              reg19 <= $unsigned(($signed($unsigned($unsigned(reg16))) ?
                  (8'haa) : ($unsigned($signed(reg14)) <= reg18[(4'h9):(3'h4)])));
            end
          else
            begin
              reg16 <= $signed((~{(reg16 ?
                      reg17[(4'hd):(4'h8)] : ((8'hb1) ? reg14 : reg19)),
                  (reg16 ? wire10 : ((7'h40) ? wire10 : reg18))}));
            end
          if ((~&(wire12 != $signed((8'ha4)))))
            begin
              reg20 <= wire10;
              reg21 <= (((~&$signed({reg15})) >> $unsigned($unsigned((-reg14)))) ?
                  wire12[(4'hb):(2'h2)] : (reg17 ?
                      ((+$signed(reg15)) ?
                          reg16[(4'hf):(4'hc)] : (wire10[(3'h5):(2'h3)] ?
                              (^~(8'ha2)) : wire8)) : $unsigned((^(reg13 ?
                          (8'hb6) : wire11)))));
              reg22 <= ($unsigned((((reg15 >= (7'h41)) ?
                  (wire10 << wire8) : wire9[(4'hd):(3'h4)]) - ($signed(reg17) ~^ reg21))) && $signed(((&wire10[(2'h2):(1'h0)]) ^~ {$unsigned(reg15)})));
              reg23 <= $signed($signed(((|$unsigned(reg15)) == reg13[(1'h1):(1'h0)])));
            end
          else
            begin
              reg20 <= wire12[(3'h6):(3'h4)];
              reg21 <= (-reg19);
              reg22 <= reg16[(4'he):(4'hb)];
              reg23 <= reg18[(4'hb):(1'h1)];
              reg24 <= reg17;
            end
          reg25 <= (~|reg24[(3'h5):(3'h4)]);
          if ((((~wire9[(3'h4):(2'h3)]) * $unsigned($unsigned((wire8 ?
                  (8'hb5) : reg13)))) ?
              ((reg25[(4'hf):(4'h9)] ?
                  (-{reg15}) : reg25) + (((reg24 << reg22) ?
                      reg24 : $signed(reg17)) ?
                  (8'hb7) : $signed(reg13[(2'h2):(2'h2)]))) : (8'ha8)))
            begin
              reg26 <= $signed((^~($unsigned((^reg24)) ?
                  $unsigned((&reg19)) : (~^(~&reg23)))));
              reg27 <= {reg21};
            end
          else
            begin
              reg26 <= (((~&(((8'ha3) ? wire12 : reg13) >> ((8'hb1) ?
                          reg17 : reg21))) ?
                      $signed($signed($unsigned(reg17))) : (reg19 - reg23[(3'h4):(1'h1)])) ?
                  ((reg16 ?
                      $unsigned((~|(8'h9f))) : ((reg21 | wire9) ?
                          reg16 : reg21)) >> $unsigned({reg22[(5'h12):(4'hd)]})) : $unsigned((((reg15 ~^ reg17) ?
                      (~^reg17) : (reg17 >>> (8'hab))) > reg23[(3'h6):(2'h2)])));
              reg27 <= (($signed({reg15, (+reg26)}) ?
                      $signed(reg13) : $signed($unsigned((8'haf)))) ?
                  (^$unsigned({reg14,
                      $unsigned(wire12)})) : reg26[(1'h0):(1'h0)]);
              reg28 <= ($signed(reg26[(2'h3):(1'h0)]) ?
                  (|reg25) : ($unsigned(reg17) ?
                      reg16[(5'h12):(2'h2)] : (((reg20 + reg23) < (wire10 | wire9)) ?
                          {reg19[(3'h7):(1'h1)]} : ((reg17 ? reg16 : reg14) ?
                              (&(8'hbe)) : (^wire9)))));
            end
        end
      reg29 <= reg21[(4'hd):(4'h8)];
    end
  assign wire30 = (((-(reg19[(4'h9):(1'h1)] < (7'h40))) && $signed($signed($signed(reg21)))) ?
                      {$unsigned((~reg23[(2'h2):(1'h1)])),
                          reg15[(1'h0):(1'h0)]} : $signed(($unsigned($signed(reg20)) ?
                          (|(wire8 & reg29)) : (reg25[(1'h1):(1'h1)] ?
                              {reg21, reg27} : (reg27 ? (8'hb3) : reg29)))));
  assign wire31 = $signed(($signed(reg13[(1'h1):(1'h1)]) << (((reg27 ?
                          (8'hbe) : wire11) ?
                      {reg19, (8'hb2)} : ((8'hb3) ? reg24 : reg19)) << reg28)));
  assign wire32 = (~^wire8[(3'h4):(2'h3)]);
  assign wire33 = (^((((8'ha2) - reg28[(3'h7):(2'h3)]) <= $unsigned((reg28 == reg28))) >>> {$unsigned(((8'ha4) && reg20))}));
  assign wire34 = wire12;
  assign wire35 = (^~(8'ha4));
  always
    @(posedge clk) begin
      reg36 <= $unsigned(((((wire30 ? (8'ha2) : wire33) ?
              (reg24 <<< reg18) : (wire12 ?
                  reg16 : (8'hb6))) + ($signed(reg23) | reg14)) ?
          $signed(wire11) : $unsigned((!(8'hb1)))));
      if (reg20[(4'h8):(3'h6)])
        begin
          reg37 <= {{(&$unsigned((reg36 < wire31))), $signed((8'hbb))},
              ((reg22 ^ reg24) && wire33[(1'h1):(1'h1)])};
          reg38 <= $unsigned(reg15[(1'h0):(1'h0)]);
          reg39 <= wire31;
          if (wire8[(1'h0):(1'h0)])
            begin
              reg40 <= (~&$unsigned((reg23 < wire30[(4'h8):(3'h7)])));
            end
          else
            begin
              reg40 <= (((8'ha0) ?
                      ((^(8'hbf)) ?
                          reg29[(3'h6):(2'h2)] : ($signed(reg25) ?
                              reg18 : $signed(reg19))) : (+reg14)) ?
                  {(|$unsigned({reg23})), (+reg40)} : wire35);
              reg41 <= (reg18[(2'h3):(2'h3)] ?
                  ($unsigned(($signed(reg38) >> (^~wire33))) & $signed(($signed(reg36) ?
                      (8'hb9) : $unsigned(wire9)))) : (($unsigned(reg18) ?
                          (&(wire31 ? reg40 : wire31)) : $unsigned((8'hba))) ?
                      ($signed($unsigned(wire12)) ?
                          ((~|reg38) > {reg28}) : $signed((~(8'had)))) : ((!(reg27 ?
                          reg23 : wire11)) >= $unsigned((wire35 ?
                          reg21 : reg29)))));
              reg42 <= $signed($unsigned(reg36[(2'h3):(2'h3)]));
              reg43 <= $signed((&((^~(wire12 != reg36)) ?
                  (-wire33) : ($signed((8'ha5)) ? $unsigned(reg27) : wire9))));
            end
        end
      else
        begin
          reg37 <= $signed(((~&(-(reg19 ?
              reg29 : wire35))) * $unsigned(((wire10 & reg29) ^~ wire33[(3'h4):(2'h3)]))));
          if ($unsigned(reg28))
            begin
              reg38 <= {(~^{(|{reg39, wire10})}), reg38};
              reg39 <= (-reg38[(1'h0):(1'h0)]);
            end
          else
            begin
              reg38 <= (($signed(reg19) || {(reg38[(1'h1):(1'h1)] ?
                          reg26 : reg20)}) ?
                  reg21[(2'h2):(1'h0)] : (~$signed((reg15 <= reg24))));
              reg39 <= ($signed((wire33[(3'h4):(1'h0)] ?
                      $signed((^~wire34)) : ($signed(reg20) <= reg25[(3'h5):(1'h1)]))) ?
                  wire31 : reg13);
            end
        end
      reg44 <= ((^~({$unsigned(wire12)} ?
          (reg43[(4'h8):(4'h8)] ? wire12 : $signed(reg37)) : ((reg17 ?
              wire9 : (8'hb5)) ~^ ((8'hba) ? (7'h40) : reg19)))) != reg15);
      reg45 <= ($unsigned($unsigned($signed((wire30 ~^ reg41)))) ?
          {reg39} : (!$signed($signed(wire34[(4'ha):(4'h8)]))));
      reg46 <= (~&(~|((wire30 == (reg39 ? reg17 : reg36)) ?
          reg45[(3'h5):(3'h5)] : wire10[(1'h1):(1'h0)])));
    end
  assign wire47 = $unsigned((reg36[(2'h2):(2'h2)] >>> (((|reg37) - (-reg23)) ?
                      $unsigned({reg20}) : reg37)));
endmodule

module module97  (y, clk, wire102, wire101, wire100, wire99, wire98);
  output wire [(32'h1a4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire102;
  input wire signed [(5'h11):(1'h0)] wire101;
  input wire signed [(4'h9):(1'h0)] wire100;
  input wire [(3'h4):(1'h0)] wire99;
  input wire [(4'he):(1'h0)] wire98;
  wire [(4'hf):(1'h0)] wire137;
  wire signed [(3'h7):(1'h0)] wire136;
  wire signed [(4'hf):(1'h0)] wire135;
  wire [(5'h14):(1'h0)] wire132;
  wire signed [(5'h11):(1'h0)] wire115;
  wire signed [(4'hf):(1'h0)] wire114;
  wire signed [(4'hf):(1'h0)] wire113;
  wire signed [(4'h9):(1'h0)] wire112;
  wire [(4'hb):(1'h0)] wire108;
  wire [(4'h8):(1'h0)] wire104;
  wire signed [(5'h13):(1'h0)] wire103;
  reg signed [(4'hd):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg139 = (1'h0);
  reg [(3'h5):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg133 = (1'h0);
  reg [(3'h5):(1'h0)] reg131 = (1'h0);
  reg [(2'h2):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg129 = (1'h0);
  reg [(2'h3):(1'h0)] reg128 = (1'h0);
  reg [(5'h10):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg124 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg122 = (1'h0);
  reg [(5'h13):(1'h0)] reg121 = (1'h0);
  reg [(3'h6):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg119 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg116 = (1'h0);
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg109 = (1'h0);
  reg [(2'h3):(1'h0)] reg107 = (1'h0);
  reg [(3'h6):(1'h0)] reg106 = (1'h0);
  reg [(4'hb):(1'h0)] reg105 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire132,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire108,
                 wire104,
                 wire103,
                 reg140,
                 reg139,
                 reg138,
                 reg134,
                 reg133,
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
                 reg111,
                 reg110,
                 reg109,
                 reg107,
                 reg106,
                 reg105,
                 (1'h0)};
  assign wire103 = (($unsigned(({wire102} > $unsigned(wire98))) == ($unsigned($signed(wire102)) ?
                           (~|((8'ha5) ?
                               (8'ha7) : wire101)) : $signed(wire99))) ?
                       (~|wire101) : $signed($unsigned(wire98[(1'h1):(1'h0)])));
  assign wire104 = (((|((wire102 || (8'hae)) ? $unsigned((7'h44)) : wire98)) ?
                           $unsigned((wire101 ^~ (~(8'hb8)))) : ({$signed(wire98)} ?
                               $signed(wire100[(3'h7):(3'h4)]) : (wire103 ?
                                   (&wire103) : (!(8'hb7))))) ?
                       $unsigned((^$signed(wire103))) : wire99);
  always
    @(posedge clk) begin
      reg105 <= $signed($signed(wire98[(4'he):(3'h5)]));
      reg106 <= wire100;
      reg107 <= ((~^((!$unsigned(wire104)) ?
          $signed((~reg105)) : wire101)) >> wire100);
    end
  assign wire108 = {($signed((&$unsigned(reg106))) == wire99[(1'h1):(1'h1)]),
                       wire103};
  always
    @(posedge clk) begin
      reg109 <= (reg107[(2'h3):(2'h2)] >> (^~$signed($unsigned($signed(wire100)))));
    end
  always
    @(posedge clk) begin
      reg110 <= wire104;
      reg111 <= ((!$signed(((^~wire98) - wire100[(3'h7):(1'h1)]))) ?
          $unsigned((-({reg109, reg109} ?
              $unsigned(wire108) : reg110))) : ((((8'had) ?
              $signed(reg105) : (-wire103)) ^~ $signed(wire101)) + $signed($signed($unsigned(wire103)))));
    end
  assign wire112 = (~|(&wire104[(2'h3):(1'h1)]));
  assign wire113 = (~&(8'ha1));
  assign wire114 = $signed($unsigned(($unsigned($unsigned(reg111)) ?
                       $unsigned((wire100 ?
                           wire113 : reg105)) : $signed(((8'h9c) == reg107)))));
  assign wire115 = ((($signed((^reg107)) ?
                               (~&(reg111 ?
                                   wire112 : wire112)) : $unsigned((wire104 && (8'had)))) ?
                           reg106 : (8'had)) ?
                       (($signed((+wire113)) ?
                           $signed((8'hb3)) : ((~wire103) ?
                               {reg105,
                                   wire102} : $signed((8'hbf)))) << wire112) : reg109);
  always
    @(posedge clk) begin
      if ($signed((wire112 ?
          (wire100 ?
              reg106[(3'h5):(1'h1)] : ($unsigned((8'ha9)) > $signed(reg105))) : {($unsigned(reg106) + (~|(8'ha1)))})))
        begin
          if ((reg110[(4'h9):(3'h7)] ?
              {(reg105[(1'h0):(1'h0)] <= $unsigned(wire98[(1'h0):(1'h0)]))} : $signed((!wire115[(3'h4):(1'h0)]))))
            begin
              reg116 <= $unsigned((^$unsigned($signed({wire99}))));
              reg117 <= $signed(wire104[(3'h5):(2'h2)]);
            end
          else
            begin
              reg116 <= $signed(wire115[(4'hc):(3'h4)]);
              reg117 <= reg116[(2'h2):(1'h1)];
            end
          reg118 <= (reg116[(2'h2):(1'h1)] > (^$signed($signed((+(8'h9e))))));
        end
      else
        begin
          reg116 <= $unsigned((((~$signed(wire103)) > reg106) == reg106));
          reg117 <= wire104[(2'h3):(1'h0)];
          reg118 <= reg110;
          reg119 <= $signed(reg107);
          reg120 <= $signed((wire108 >> $signed((!wire98[(2'h3):(1'h1)]))));
        end
      reg121 <= {$signed((8'ha5)), wire104[(2'h3):(1'h0)]};
      reg122 <= (7'h42);
      if ($unsigned({$signed((~^$unsigned(wire98)))}))
        begin
          reg123 <= (!$signed((($signed(reg118) ?
                  (reg107 ? reg110 : reg120) : (reg106 ? (8'hbb) : reg120)) ?
              (~|$unsigned(wire99)) : $unsigned($signed((8'hb2))))));
          reg124 <= ($signed($signed(reg120)) ?
              $unsigned(reg110[(4'ha):(1'h1)]) : (8'hb0));
          reg125 <= $unsigned(wire100[(2'h2):(1'h1)]);
          reg126 <= $unsigned($unsigned(($signed(wire114[(4'ha):(4'h8)]) != ($unsigned((8'hbc)) ?
              wire114[(4'h9):(1'h0)] : {reg106, reg117}))));
          reg127 <= (wire101[(3'h5):(2'h2)] <<< $signed((7'h40)));
        end
      else
        begin
          if ($signed($unsigned(($signed((wire100 ?
              wire100 : wire104)) >= $signed(((8'hbd) || reg110))))))
            begin
              reg123 <= reg111;
              reg124 <= wire108;
              reg125 <= ($signed((($unsigned(wire99) - {(8'ha7), reg117}) ?
                  wire100[(3'h4):(2'h3)] : (~&wire100))) > (({{(8'hb5), reg111},
                      (wire100 ? wire114 : wire114)} ?
                  $unsigned((wire104 < reg106)) : reg106) & $unsigned(reg117[(1'h1):(1'h1)])));
              reg126 <= wire108;
              reg127 <= reg117;
            end
          else
            begin
              reg123 <= $unsigned(reg118[(2'h2):(1'h0)]);
            end
          reg128 <= reg116[(1'h0):(1'h0)];
          reg129 <= wire102[(2'h2):(1'h1)];
          reg130 <= $signed({(8'hab), wire112});
        end
      reg131 <= $signed(((($unsigned(wire98) ?
          (reg124 >> reg130) : reg121[(1'h1):(1'h1)]) >= ($signed(reg106) > {reg125,
          reg119})) + $signed({$unsigned(reg121)})));
    end
  assign wire132 = wire100[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg133 <= (reg111 >>> (8'ha4));
      reg134 <= (8'had);
    end
  assign wire135 = (^~(8'had));
  assign wire136 = $unsigned(((reg109[(2'h3):(2'h2)] ?
                       wire132 : $unsigned($unsigned(reg128))) || $unsigned({$unsigned(reg122),
                       (wire101 < reg116)})));
  assign wire137 = reg121;
  always
    @(posedge clk) begin
      reg138 <= {$signed($signed(reg106[(1'h1):(1'h1)])),
          reg122[(3'h6):(3'h4)]};
      reg139 <= wire104;
      reg140 <= reg133;
    end
endmodule

module module61  (y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire65;
  input wire signed [(4'hd):(1'h0)] wire64;
  input wire signed [(3'h4):(1'h0)] wire63;
  input wire [(4'hb):(1'h0)] wire62;
  wire signed [(5'h11):(1'h0)] wire92;
  wire [(3'h7):(1'h0)] wire91;
  wire signed [(4'h8):(1'h0)] wire90;
  wire [(4'h9):(1'h0)] wire87;
  wire signed [(4'h9):(1'h0)] wire86;
  wire [(4'h8):(1'h0)] wire85;
  wire signed [(5'h15):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire82;
  wire signed [(2'h3):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire80;
  wire signed [(4'ha):(1'h0)] wire79;
  wire signed [(4'h9):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire66;
  reg signed [(2'h2):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(5'h15):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire74,
                 wire66,
                 reg89,
                 reg88,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire66 = wire64;
  always
    @(posedge clk) begin
      reg67 <= ($signed($unsigned(wire65[(1'h1):(1'h0)])) >= (wire65 <<< $signed(wire62[(3'h4):(2'h3)])));
      reg68 <= $unsigned(((|$unsigned((~wire63))) ?
          (wire65 ? reg67[(1'h1):(1'h0)] : wire63) : wire62));
      if ($unsigned(wire62))
        begin
          reg69 <= $unsigned($signed($signed((~^(8'hb1)))));
          if (wire62[(1'h1):(1'h0)])
            begin
              reg70 <= (($unsigned($signed((~|reg69))) << ({(wire63 ?
                          reg67 : (8'h9f)),
                      $signed(reg69)} ?
                  $signed(wire62) : $signed({wire63,
                      wire62}))) <<< wire66[(5'h11):(4'hd)]);
              reg71 <= $signed(wire63[(2'h2):(1'h1)]);
              reg72 <= reg68;
            end
          else
            begin
              reg70 <= $signed({{wire63},
                  ($signed(((8'hb0) <= reg69)) ?
                      {((8'hb8) == reg71), reg68} : {reg67})});
              reg71 <= ($signed(reg68) <= wire63[(1'h0):(1'h0)]);
              reg72 <= $unsigned((reg69[(1'h1):(1'h1)] ?
                  ($unsigned((wire66 ?
                      wire64 : (8'h9e))) ^ (~|$unsigned(reg72))) : $unsigned(wire65)));
            end
        end
      else
        begin
          if (reg72[(4'h8):(1'h1)])
            begin
              reg69 <= (|wire64);
            end
          else
            begin
              reg69 <= (~&$unsigned((~|reg71)));
            end
          if ((reg67[(1'h1):(1'h1)] ?
              reg71 : (^~$signed($signed((reg67 ? wire63 : reg67))))))
            begin
              reg70 <= (reg69[(1'h0):(1'h0)] ? (8'hbc) : reg67);
              reg71 <= ($unsigned($unsigned(wire63[(3'h4):(1'h1)])) * reg69);
            end
          else
            begin
              reg70 <= $unsigned({(($signed(reg71) | wire65) >> wire62),
                  (!((-wire63) ? $unsigned(reg70) : $signed((7'h40))))});
              reg71 <= reg70[(3'h4):(1'h1)];
            end
          reg72 <= $unsigned((wire66 ?
              (({reg68} | $unsigned(reg67)) & $signed((|(8'ha9)))) : $unsigned({(~|reg70)})));
        end
      reg73 <= reg67[(2'h2):(1'h1)];
    end
  assign wire74 = wire65;
  always
    @(posedge clk) begin
      reg75 <= wire64;
      reg76 <= wire63[(3'h4):(1'h1)];
      reg77 <= $signed($unsigned(reg75));
      reg78 <= {reg67};
    end
  assign wire79 = $signed((~^reg77));
  assign wire80 = (|$signed($unsigned($signed(reg77[(2'h2):(2'h2)]))));
  assign wire81 = $signed($unsigned(reg69));
  assign wire82 = ($signed(reg70) ?
                      wire81 : ({($unsigned((8'haf)) ?
                                  $signed((8'ha4)) : ((8'h9e) ? reg73 : reg69)),
                              $signed(((8'hba) ? (8'hac) : (8'h9d)))} ?
                          reg73 : {reg68[(4'hd):(1'h0)]}));
  assign wire83 = $signed(wire82);
  assign wire84 = $signed($signed(reg72));
  assign wire85 = (~$unsigned((~|wire66)));
  assign wire86 = (wire82[(3'h5):(3'h5)] ?
                      $signed((^~$signed(wire84[(4'hd):(1'h0)]))) : $signed((~^((^reg68) ?
                          ((7'h40) + wire81) : (8'hae)))));
  assign wire87 = (wire66 ?
                      reg67 : ($signed(reg70[(3'h6):(2'h3)]) & (wire83 ^~ $signed((wire81 ?
                          wire64 : (8'ha9))))));
  always
    @(posedge clk) begin
      reg88 <= ((((~|$unsigned(reg71)) * $unsigned(wire64)) | (reg67 ?
              wire64 : wire66[(3'h4):(1'h1)])) ?
          (wire63[(1'h1):(1'h1)] ?
              wire83 : (wire62 & {(^~(8'ha0)), (~|wire87)})) : reg68);
      reg89 <= (|(($unsigned($unsigned(wire86)) ?
              $unsigned((~|reg70)) : ({(8'hbf)} ?
                  reg78[(4'hb):(2'h2)] : (wire64 ? reg72 : wire63))) ?
          $unsigned(wire84[(4'hc):(2'h3)]) : $signed($signed(wire62))));
    end
  assign wire90 = wire81[(1'h0):(1'h0)];
  assign wire91 = {{$unsigned($unsigned(((8'hb6) ? (8'haa) : reg67))),
                          $signed(wire84[(4'hc):(2'h3)])}};
  assign wire92 = (&$signed(wire65[(1'h0):(1'h0)]));
endmodule
