module top
#(parameter param155 = ({(^((^~(8'ha8)) | ((8'ha7) ? (8'ha8) : (8'ha5)))), ((~(~^(8'hae))) ? (((8'had) ? (7'h42) : (8'had)) ? ((8'ha5) ? (8'ha5) : (8'ha9)) : (8'ha6)) : (^~((8'hbe) ? (8'hab) : (8'hb1))))} ? (8'hae) : ({{{(8'haa), (8'hab)}}, (((8'ha4) >= (8'had)) || {(8'hb0), (8'hbe)})} ? ((^~(8'ha9)) > ({(8'ha4)} ? (&(8'ha5)) : ((8'hb3) ? (8'hb0) : (7'h42)))) : (8'h9e))), 
parameter param156 = param155)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1ff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire154;
  wire signed [(4'h9):(1'h0)] wire153;
  wire [(3'h6):(1'h0)] wire152;
  wire signed [(4'he):(1'h0)] wire151;
  wire signed [(4'hc):(1'h0)] wire150;
  wire signed [(5'h13):(1'h0)] wire149;
  wire signed [(3'h5):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire16;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire27;
  wire signed [(2'h3):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire147;
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire15,
                 wire16,
                 wire26,
                 wire27,
                 wire28,
                 wire85,
                 wire147,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 (1'h0)};
  assign wire5 = ((8'ha3) || $unsigned((+(~^(wire2 ? wire0 : (8'hab))))));
  assign wire6 = wire5;
  assign wire7 = (~|(~wire2));
  assign wire8 = (!$signed($unsigned(((|wire7) ?
                     (&wire6) : ((8'h9f) >= wire6)))));
  assign wire9 = wire4[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      reg10 <= $unsigned($signed((^~((wire3 ? wire6 : wire2) ?
          wire8[(4'h8):(2'h2)] : (wire2 ? wire7 : wire8)))));
      reg11 <= (((($signed((8'h9f)) > (wire1 << wire7)) != ((+wire7) || (wire5 ?
          wire9 : wire1))) & (&(8'ha0))) <= $signed(wire0[(3'h6):(2'h2)]));
      reg12 <= $unsigned(($unsigned(reg10) ?
          $unsigned((!wire8)) : $signed($signed((reg10 & wire5)))));
      reg13 <= $signed((+$signed((8'hbd))));
      reg14 <= $unsigned({reg13});
    end
  assign wire15 = reg12;
  assign wire16 = {$signed(({$unsigned(wire9)} ^ (8'hac))), (8'ha4)};
  always
    @(posedge clk) begin
      if ((($unsigned((+(8'hbb))) == (wire4[(1'h1):(1'h1)] ?
              $unsigned((!wire0)) : wire3)) ?
          (~|($unsigned({(7'h44), wire0}) ?
              ((8'hba) ?
                  $signed(wire9) : (wire6 ?
                      wire5 : (8'hb6))) : $unsigned((~|wire7)))) : $signed($unsigned(($unsigned(reg14) ^ $unsigned((8'h9f)))))))
        begin
          reg17 <= wire9[(1'h0):(1'h0)];
          reg18 <= (wire8[(4'hb):(1'h0)] ?
              ((reg11 ?
                  (^~(8'hbf)) : wire0[(3'h7):(3'h5)]) && $unsigned(((&(8'ha2)) >>> wire1[(5'h10):(4'hd)]))) : $signed($unsigned(($signed((8'ha5)) ?
                  (wire7 <= (8'hb7)) : wire7[(1'h1):(1'h1)]))));
          if ($signed({$unsigned((reg10 ^ {wire8, wire0})), wire9}))
            begin
              reg19 <= $unsigned((-reg17[(3'h5):(1'h0)]));
              reg20 <= (($signed((reg12 ? (~|(8'hb1)) : reg19)) ?
                      {(7'h41)} : wire7[(3'h7):(2'h3)]) ?
                  wire3[(1'h1):(1'h1)] : (wire2[(4'hf):(3'h4)] ?
                      wire8[(1'h0):(1'h0)] : ((&(8'hb6)) << ($unsigned(wire8) & reg10[(1'h1):(1'h1)]))));
              reg21 <= reg14[(4'h9):(4'h8)];
            end
          else
            begin
              reg19 <= wire1;
              reg20 <= wire7[(2'h2):(1'h0)];
              reg21 <= reg14;
              reg22 <= ({wire2[(4'ha):(1'h0)],
                  ((reg19[(4'h9):(2'h2)] ?
                          wire4[(1'h1):(1'h0)] : (wire0 <<< wire15)) ?
                      ($unsigned(wire6) ^~ reg18) : (-{wire15}))} ^ wire9);
            end
          if (reg14[(4'h8):(3'h7)])
            begin
              reg23 <= $signed((8'h9d));
              reg24 <= $signed((({$signed(wire7), (wire8 ? reg12 : (8'had))} ?
                      (!(8'hb1)) : reg22) ?
                  $signed(($signed(reg12) * wire5)) : (reg22[(3'h5):(1'h1)] ?
                      $signed({wire4}) : ($unsigned(wire15) || (wire1 ?
                          (8'hb3) : wire2)))));
              reg25 <= (-(~|(8'hb1)));
            end
          else
            begin
              reg23 <= wire16;
              reg24 <= (((((reg23 >= (8'hb8)) ?
                          (wire7 ^~ reg18) : (wire4 ?
                              reg17 : reg22)) > ((7'h42) ?
                          reg22 : (reg23 >> reg18))) ?
                      wire15 : ($signed($unsigned(reg23)) ?
                          ((~wire5) ?
                              (|wire9) : wire8[(2'h2):(2'h2)]) : $signed(wire2[(2'h3):(1'h0)]))) ?
                  $signed(($unsigned((reg23 ?
                      (8'h9f) : wire6)) <= ((^wire7) | $signed(reg21)))) : (^$unsigned((reg21 ?
                      ((7'h40) ? wire9 : reg11) : (reg10 ? wire8 : wire5)))));
              reg25 <= (!{(+{(reg23 ? reg25 : (8'ha2)), $unsigned(wire2)}),
                  $unsigned($unsigned($unsigned(wire0)))});
            end
        end
      else
        begin
          reg17 <= $signed($unsigned((8'hb1)));
          reg18 <= $unsigned($unsigned($unsigned($signed((wire16 <<< wire6)))));
          reg19 <= ($unsigned((8'hb9)) ?
              (((wire2[(3'h4):(1'h0)] > $signed(wire9)) ^~ reg12) ?
                  $signed(((reg22 ~^ wire5) ?
                      (wire3 ?
                          reg11 : reg25) : (reg11 >>> wire4))) : $unsigned($unsigned(wire7))) : (&$signed(reg14[(1'h0):(1'h0)])));
          reg20 <= (!wire8);
        end
    end
  assign wire26 = wire8[(5'h13):(3'h4)];
  assign wire27 = ((((reg12[(3'h6):(2'h3)] <<< wire7[(3'h6):(3'h6)]) <= $signed(wire26[(1'h0):(1'h0)])) ?
                      wire9[(2'h3):(2'h2)] : ($signed((&wire4)) ?
                          $unsigned(wire1) : ((reg20 && reg25) ~^ $signed(reg19)))) ^ (8'ha6));
  assign wire28 = wire3;
  always
    @(posedge clk) begin
      reg29 <= ($unsigned((&reg10[(2'h2):(1'h0)])) ? reg25 : wire2);
      if ({($unsigned((!$unsigned(wire1))) < reg19[(3'h4):(3'h4)]),
          $unsigned(wire0)})
        begin
          if ($signed({$signed($signed((reg14 ? wire7 : wire16)))}))
            begin
              reg30 <= wire16;
              reg31 <= (reg11 & wire4);
              reg32 <= reg11[(4'h8):(1'h1)];
              reg33 <= $unsigned(((({wire6} >= $unsigned(reg12)) ?
                      {(wire28 << reg14), (+wire8)} : ((reg21 ?
                          (8'haf) : reg24) && $unsigned(reg31))) ?
                  $signed(wire28[(1'h1):(1'h0)]) : wire16[(2'h3):(1'h0)]));
              reg34 <= (+reg12);
            end
          else
            begin
              reg30 <= ((~^reg20[(2'h3):(2'h3)]) || wire6);
              reg31 <= $unsigned((8'hb9));
            end
          reg35 <= ($signed((($unsigned(wire2) | reg23[(1'h1):(1'h0)]) ?
              reg32 : (wire9 ? (+(8'ha8)) : {wire26}))) - {((wire3 ?
                      (wire9 ? reg29 : (8'hb0)) : $signed(reg20)) ?
                  reg13[(2'h2):(2'h2)] : ({(8'hb5)} ? (~^reg24) : (^wire6))),
              $signed($signed((reg30 <<< (8'haf))))});
          reg36 <= $unsigned($unsigned(reg35));
          if ((($unsigned((^~$unsigned((8'hab)))) ?
                  reg32[(3'h4):(3'h4)] : wire27) ?
              $signed(({wire15[(2'h2):(1'h0)]} ?
                  {$signed(reg18)} : ((&wire7) < wire8))) : ($signed(({reg33} >= reg24)) ?
                  (^~reg19) : $unsigned($unsigned(reg13[(3'h6):(3'h4)])))))
            begin
              reg37 <= reg31;
              reg38 <= $signed($unsigned((7'h44)));
              reg39 <= ($signed(wire0[(4'h8):(1'h0)]) - $signed((((8'ha9) >>> (~wire8)) + $unsigned($signed(reg21)))));
              reg40 <= wire1[(2'h3):(1'h0)];
              reg41 <= reg14[(2'h2):(2'h2)];
            end
          else
            begin
              reg37 <= reg25;
              reg38 <= ((reg18[(1'h1):(1'h1)] > (({wire0} != $signed((8'hb0))) << (reg24 > (~&reg11)))) <= $unsigned(wire0[(1'h1):(1'h0)]));
            end
        end
      else
        begin
          reg30 <= $signed((({$unsigned((7'h43)), (wire0 ~^ reg34)} ?
              ((~|wire8) ~^ wire6) : ({reg31,
                  reg24} * (-wire2))) <<< reg39[(3'h7):(2'h3)]));
          reg31 <= $unsigned(reg13[(2'h2):(2'h2)]);
          reg32 <= (reg30 ?
              ((~&(+(|wire27))) ?
                  reg10[(2'h2):(2'h2)] : (reg18[(1'h0):(1'h0)] ^~ reg10[(1'h1):(1'h0)])) : (+(+((reg21 ?
                  wire16 : (8'hba)) != {reg21, wire0}))));
          reg33 <= $signed(wire9[(1'h0):(1'h0)]);
        end
      reg42 <= wire28[(2'h2):(2'h2)];
    end
  module43 #() modinst86 (wire85, clk, wire3, wire0, reg41, reg36, reg37);
  module87 #() modinst148 (wire147, clk, reg30, reg35, reg10, wire0, reg38);
  assign wire149 = (|(((-(~^wire26)) ? wire85 : reg30[(4'h8):(2'h2)]) ?
                       reg33 : wire15[(3'h6):(2'h3)]));
  assign wire150 = $signed({$unsigned($unsigned(reg36[(5'h11):(3'h5)])),
                       ($signed($unsigned(wire16)) >> (~|((8'hbd) ?
                           reg34 : wire2)))});
  assign wire151 = wire28;
  assign wire152 = reg30;
  assign wire153 = ((&$unsigned(reg18)) * ((^(wire8[(5'h10):(2'h2)] ?
                           (wire0 ? reg31 : wire3) : $unsigned(wire4))) ?
                       ((~|(wire26 ?
                           reg41 : (8'ha7))) * reg18[(1'h1):(1'h1)]) : reg14));
  assign wire154 = {(reg23[(2'h2):(1'h0)] <<< $signed(reg41[(4'hc):(4'hc)])),
                       wire150};
endmodule

module module87  (y, clk, wire88, wire89, wire90, wire91, wire92);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire88;
  input wire signed [(5'h10):(1'h0)] wire89;
  input wire [(3'h6):(1'h0)] wire90;
  input wire signed [(4'hb):(1'h0)] wire91;
  input wire signed [(5'h14):(1'h0)] wire92;
  wire [(4'h8):(1'h0)] wire142;
  wire [(5'h12):(1'h0)] wire93;
  wire [(2'h3):(1'h0)] wire94;
  wire signed [(5'h13):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire135;
  reg signed [(4'hf):(1'h0)] reg146 = (1'h0);
  reg [(2'h2):(1'h0)] reg145 = (1'h0);
  reg [(3'h5):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg143 = (1'h0);
  reg [(4'hb):(1'h0)] reg141 = (1'h0);
  reg [(3'h5):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg139 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg96 = (1'h0);
  assign y = {wire142,
                 wire93,
                 wire94,
                 wire97,
                 wire98,
                 wire135,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg95,
                 reg96,
                 (1'h0)};
  assign wire93 = $signed(((wire92 == ($signed(wire88) ?
                          (wire91 ? wire89 : wire88) : (wire92 ?
                              wire88 : wire91))) ?
                      $unsigned(wire92[(4'hf):(4'hf)]) : wire90[(3'h4):(1'h1)]));
  assign wire94 = ({(^~(wire89 && wire91[(1'h1):(1'h1)]))} ?
                      wire93[(3'h5):(3'h5)] : ((8'ha1) ^~ (wire91[(4'h8):(3'h5)] ?
                          wire91 : ($signed(wire88) ?
                              wire91[(3'h5):(1'h0)] : {wire89}))));
  always
    @(posedge clk) begin
      reg95 <= ($signed($signed((|wire94))) & ({$signed($unsigned(wire88)),
              (^wire88)} ?
          $unsigned($unsigned(wire91[(3'h5):(3'h4)])) : (~|((wire89 != wire88) == (~|wire88)))));
      reg96 <= ($unsigned(wire92) >>> reg95[(1'h1):(1'h1)]);
    end
  assign wire97 = $signed(((((^wire93) > $signed(wire94)) ?
                      $signed((wire88 ~^ wire91)) : wire92[(3'h6):(3'h4)]) << $signed(wire94)));
  assign wire98 = wire92[(3'h7):(3'h5)];
  module99 #() modinst136 (.wire103(wire89), .wire100(reg96), .y(wire135), .wire101(wire94), .clk(clk), .wire102(wire91));
  always
    @(posedge clk) begin
      reg137 <= $signed(wire93[(3'h5):(3'h4)]);
      reg138 <= (-($signed(wire97) ?
          (wire88[(4'h9):(3'h4)] ^~ wire90) : ((wire90 ?
                  ((8'ha8) >= (8'ha5)) : $unsigned(wire135)) ?
              {$signed(wire98)} : wire88[(4'h8):(3'h4)])));
      reg139 <= ((($unsigned((-reg137)) ?
              (^~(^wire90)) : $signed(wire88[(3'h4):(1'h0)])) > ((reg137[(2'h2):(1'h0)] ?
              $signed((8'ha4)) : {(8'ha1), wire94}) > ((reg138 ?
              wire93 : reg137) ^ (wire135 & wire93)))) ?
          $signed($signed(((wire93 ? wire90 : wire91) ?
              $signed(wire90) : (~wire89)))) : reg96);
      reg140 <= {reg95[(2'h3):(1'h0)]};
      reg141 <= {(~^(|($signed(reg96) || {reg95}))),
          ((~|(^$signed(wire91))) ?
              wire89[(4'hb):(3'h4)] : ($signed(wire135[(3'h5):(3'h5)]) ?
                  ((wire135 && wire135) & {reg137}) : reg139[(1'h1):(1'h0)]))};
    end
  assign wire142 = $unsigned((wire90 + $unsigned($signed($signed(reg140)))));
  always
    @(posedge clk) begin
      reg143 <= wire88;
      if ({((8'h9f) ? (reg140 | (~$unsigned(reg137))) : wire97[(5'h10):(4'hf)]),
          (-$unsigned((&reg141)))})
        begin
          if ({$unsigned($unsigned($unsigned((wire97 ^~ reg138)))),
              $signed($signed({wire92[(1'h1):(1'h1)], {reg95, reg139}}))})
            begin
              reg144 <= $unsigned(({((reg95 <= reg96) & $signed(wire94))} || $signed($unsigned($unsigned(wire91)))));
            end
          else
            begin
              reg144 <= (~&reg141);
              reg145 <= $signed((+wire90));
              reg146 <= wire97[(4'h8):(3'h5)];
            end
        end
      else
        begin
          reg144 <= (wire92 <= $signed(((!reg144) - $signed(wire98))));
        end
    end
endmodule

module module43
#(parameter param83 = (^(8'hb6)), 
parameter param84 = param83)
(y, clk, wire44, wire45, wire46, wire47, wire48);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire44;
  input wire [(5'h12):(1'h0)] wire45;
  input wire [(4'h9):(1'h0)] wire46;
  input wire signed [(4'hf):(1'h0)] wire47;
  input wire signed [(3'h5):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire79;
  assign y = {wire82, wire81, wire49, wire79, (1'h0)};
  assign wire49 = wire45;
  module50 #() modinst80 (.clk(clk), .y(wire79), .wire52(wire46), .wire54(wire45), .wire55(wire44), .wire51(wire47), .wire53(wire49));
  assign wire81 = (wire47 > $signed($signed($unsigned(wire45[(4'hf):(4'h8)]))));
  assign wire82 = $signed($unsigned($unsigned({$signed(wire81),
                      wire79[(3'h5):(2'h3)]})));
endmodule

module module50
#(parameter param77 = ((((8'hb0) | (((8'hb5) ? (8'hbf) : (7'h44)) << ((8'ha7) >>> (8'ha8)))) <= (~|((-(8'hba)) && ((8'hbd) > (8'ha7))))) ? (!(~(((8'ha8) - (8'hbd)) > ((8'hba) ? (7'h43) : (8'hbb))))) : {{{(^(8'hb0))}}, (((|(8'ha3)) ? (!(8'hb9)) : ((7'h42) ? (8'haf) : (8'hab))) ? {((8'hbb) >> (7'h44))} : (((8'hbf) & (8'h9c)) != (~&(8'ha0))))}), 
parameter param78 = param77)
(y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire55;
  input wire signed [(5'h12):(1'h0)] wire54;
  input wire [(5'h12):(1'h0)] wire53;
  input wire [(4'h9):(1'h0)] wire52;
  input wire [(4'hf):(1'h0)] wire51;
  wire [(5'h11):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire75;
  wire [(5'h14):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire56;
  reg signed [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire56 = (-$signed(((-wire55) > (wire55[(3'h4):(3'h4)] <= wire51))));
  assign wire57 = wire55;
  assign wire58 = wire56;
  assign wire59 = wire52[(1'h1):(1'h1)];
  assign wire60 = wire53[(4'h8):(1'h0)];
  assign wire61 = (($unsigned(wire60) ?
                          $signed(wire58[(4'h8):(3'h4)]) : (($unsigned(wire58) ^~ wire53) ^ {{(8'haf),
                                  wire52}})) ?
                      ({$signed((wire56 ? (8'hac) : (8'h9e)))} ?
                          {wire59[(1'h0):(1'h0)],
                              wire58} : {$unsigned(wire51[(4'ha):(3'h4)]),
                              wire54[(4'hd):(1'h1)]}) : wire55);
  assign wire62 = wire57[(4'h9):(2'h2)];
  always
    @(posedge clk) begin
      reg63 <= wire56;
      if (({wire58[(1'h1):(1'h1)]} ?
          wire62[(5'h11):(4'hd)] : $signed(wire58[(2'h3):(2'h3)])))
        begin
          reg64 <= $unsigned(wire59[(1'h0):(1'h0)]);
        end
      else
        begin
          reg64 <= $signed((wire54 << wire55[(3'h4):(1'h0)]));
          reg65 <= wire62[(3'h5):(2'h3)];
          reg66 <= ((($signed((8'h9e)) ?
                  wire62[(2'h3):(1'h0)] : {(&wire61),
                      $signed(reg63)}) != reg65) ?
              wire61 : $signed(((8'ha1) ? $unsigned((8'hba)) : wire57)));
          if (((-wire52[(2'h2):(2'h2)]) >= {reg65,
              (wire62[(5'h11):(3'h6)] <<< (reg65[(1'h0):(1'h0)] ?
                  (~^wire51) : (~wire54)))}))
            begin
              reg67 <= $unsigned($signed(reg64));
              reg68 <= reg67;
            end
          else
            begin
              reg67 <= $unsigned(wire61);
              reg68 <= $unsigned(wire60[(1'h1):(1'h1)]);
              reg69 <= $signed(((((^~wire58) ?
                      $unsigned(wire53) : (-wire56)) <<< wire61) ?
                  (($signed(wire55) ? wire59[(2'h2):(1'h0)] : reg65) ?
                      wire56[(4'h8):(1'h0)] : reg67[(2'h2):(2'h2)]) : wire58));
              reg70 <= (+wire52);
            end
          reg71 <= (($unsigned(wire60) ?
                  (($signed(wire57) ?
                      (wire58 | reg66) : wire55) >> (|wire61[(2'h2):(2'h2)])) : reg63[(3'h5):(1'h1)]) ?
              $signed((({reg67} ?
                  (wire51 ?
                      wire57 : reg64) : (^~reg68)) ~^ ($signed(reg63) << $signed(wire53)))) : ((-{{(8'ha4)},
                  (!wire61)}) <= {(reg65 == (wire51 & wire52))}));
        end
      reg72 <= $unsigned((&(reg69[(4'h8):(1'h0)] ?
          $unsigned($unsigned(wire56)) : wire55)));
      reg73 <= (8'hae);
    end
  assign wire74 = wire62;
  assign wire75 = reg64[(2'h3):(1'h1)];
  assign wire76 = reg63;
endmodule

module module99
#(parameter param134 = (|((~|(((8'hb5) ? (8'hbf) : (7'h41)) >>> ((7'h43) >= (8'hb6)))) ^ (~(~(8'hbc))))))
(y, clk, wire103, wire102, wire101, wire100);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire103;
  input wire [(4'hb):(1'h0)] wire102;
  input wire signed [(2'h2):(1'h0)] wire101;
  input wire [(4'hd):(1'h0)] wire100;
  wire [(4'h9):(1'h0)] wire133;
  wire [(2'h3):(1'h0)] wire132;
  wire [(5'h10):(1'h0)] wire131;
  wire signed [(5'h12):(1'h0)] wire130;
  wire [(4'h8):(1'h0)] wire129;
  wire [(4'h8):(1'h0)] wire128;
  wire [(3'h4):(1'h0)] wire127;
  wire signed [(5'h13):(1'h0)] wire126;
  wire signed [(3'h5):(1'h0)] wire125;
  wire signed [(4'h8):(1'h0)] wire124;
  wire [(4'hd):(1'h0)] wire123;
  wire [(4'hf):(1'h0)] wire122;
  reg [(5'h13):(1'h0)] reg121 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg120 = (1'h0);
  reg [(2'h3):(1'h0)] reg119 = (1'h0);
  reg [(3'h7):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg111 = (1'h0);
  reg [(3'h6):(1'h0)] reg110 = (1'h0);
  reg [(4'hc):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  assign y = {wire133,
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
                 wire122,
                 reg121,
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
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire100)
        begin
          reg104 <= wire100[(1'h0):(1'h0)];
          reg105 <= (wire102 ? reg104 : wire102[(4'h8):(2'h2)]);
          reg106 <= $unsigned((+wire102));
          reg107 <= $unsigned($unsigned(($signed((reg104 || reg106)) << $signed((wire100 * wire101)))));
          if (wire100)
            begin
              reg108 <= ($unsigned(($unsigned(((8'had) * wire103)) - (!wire103[(4'ha):(2'h2)]))) >> {reg106[(1'h0):(1'h0)],
                  wire100[(2'h2):(2'h2)]});
              reg109 <= wire100[(2'h3):(1'h0)];
              reg110 <= (((wire101 != (-$unsigned(wire102))) != ((|(reg108 * (8'ha3))) ?
                      (wire102[(2'h3):(2'h2)] ^~ (^(8'ha7))) : reg106[(3'h6):(2'h2)])) ?
                  reg107[(2'h2):(2'h2)] : $unsigned(wire101));
              reg111 <= ($signed(reg109[(3'h6):(2'h3)]) ?
                  $unsigned(((!reg104) << wire102[(3'h6):(2'h2)])) : wire103);
              reg112 <= wire103;
            end
          else
            begin
              reg108 <= ($signed((wire102 >= $signed($unsigned(wire103)))) ?
                  (|(+$unsigned((reg109 ?
                      wire100 : wire103)))) : ($unsigned((reg108[(1'h1):(1'h1)] ?
                      (~|reg104) : {wire100, wire103})) - $signed(((wire103 ?
                      reg108 : reg108) << {(8'hbf), reg104}))));
              reg109 <= $signed($unsigned($unsigned({wire102,
                  $signed(reg106)})));
            end
        end
      else
        begin
          reg104 <= $signed({(!(((8'ha6) ? reg105 : reg104) ?
                  (8'hb4) : (~&reg108)))});
          reg105 <= reg110[(1'h0):(1'h0)];
        end
      if (reg108)
        begin
          reg113 <= ($unsigned((8'hbd)) ?
              reg105[(1'h1):(1'h0)] : $unsigned(reg111));
          reg114 <= reg107[(3'h5):(1'h0)];
        end
      else
        begin
          reg113 <= {reg112};
          reg114 <= ({reg110[(1'h1):(1'h1)],
              (&reg104)} < $signed((~|(((8'h9e) <= wire102) ^~ (reg107 ?
              wire102 : reg110)))));
        end
      if ({$unsigned(((reg112 ? reg112 : reg114) ?
              ($signed((8'ha9)) >> reg106) : $unsigned((reg106 ?
                  reg106 : reg111))))})
        begin
          reg115 <= $unsigned({(({reg104} ^~ (reg104 ?
                  (8'h9f) : reg106)) ^~ reg113)});
          reg116 <= $unsigned((reg109 ?
              (^~reg113[(5'h10):(1'h0)]) : ($unsigned($unsigned(wire100)) ?
                  reg108 : (wire101[(2'h2):(1'h1)] < (reg113 <<< reg108)))));
          reg117 <= $unsigned(reg108[(3'h6):(3'h6)]);
        end
      else
        begin
          reg115 <= {reg106[(3'h7):(1'h0)]};
          if ($signed(reg115))
            begin
              reg116 <= reg113[(2'h3):(1'h1)];
              reg117 <= ($signed({(reg104[(1'h1):(1'h1)] < (reg116 ?
                          reg114 : reg111))}) ?
                  $signed($signed((8'had))) : ((&reg111[(2'h2):(1'h0)]) ?
                      ((~|reg115[(2'h3):(1'h0)]) ?
                          (!$signed((8'h9d))) : (-$signed(reg113))) : (&{(reg114 ?
                              (8'ha2) : reg108)})));
              reg118 <= (|$unsigned(reg108[(3'h7):(2'h3)]));
            end
          else
            begin
              reg116 <= reg108[(4'h8):(2'h2)];
              reg117 <= $signed((8'hba));
            end
          reg119 <= reg104;
          reg120 <= $unsigned($unsigned((reg108 ?
              reg113[(4'he):(2'h2)] : (!$unsigned(reg105)))));
        end
      reg121 <= ((^~{((~wire101) ?
              reg108[(1'h1):(1'h0)] : (reg107 ?
                  (7'h42) : reg111))}) != $signed({$signed(reg112[(3'h4):(3'h4)])}));
    end
  assign wire122 = reg111;
  assign wire123 = ({wire101} <<< $signed({(+(reg104 & reg111))}));
  assign wire124 = ($signed((|(8'hb5))) & (wire100 & reg114[(3'h4):(3'h4)]));
  assign wire125 = {(reg116[(1'h1):(1'h1)] ?
                           $signed($signed(wire124[(1'h1):(1'h0)])) : ($unsigned({wire103,
                                   reg110}) ?
                               ((^~reg121) * {wire124}) : $signed((&(8'hac))))),
                       $unsigned(($unsigned(reg117[(4'ha):(1'h1)]) >= ({reg105,
                               wire101} ?
                           $signed(reg110) : $unsigned((8'ha2)))))};
  assign wire126 = {((reg109[(3'h7):(2'h2)] ~^ (7'h42)) ?
                           {($unsigned(wire122) ?
                                   (wire101 >> (8'ha0)) : $signed(reg117)),
                               $signed(reg116[(4'ha):(2'h3)])} : (($unsigned((8'hb5)) ?
                               reg106 : $signed(reg118)) ~^ wire101[(2'h2):(2'h2)]))};
  assign wire127 = wire123[(3'h7):(2'h2)];
  assign wire128 = ($signed($unsigned((-((7'h41) & reg118)))) <= (reg109[(3'h7):(1'h1)] == $signed(wire103)));
  assign wire129 = ($unsigned(({$unsigned((8'had)),
                           $signed((8'ha3))} > (^$unsigned(wire102)))) ?
                       (reg118 ?
                           reg104 : $unsigned(((reg106 ? reg119 : reg121) ?
                               (reg116 < (8'hb1)) : reg116))) : wire122[(4'hf):(3'h4)]);
  assign wire130 = ({reg110[(3'h5):(2'h3)],
                       $unsigned($signed($signed(wire101)))} << {($signed($signed(reg106)) != {(wire128 >>> (8'haf))})});
  assign wire131 = (wire101[(2'h2):(2'h2)] >= reg118[(3'h5):(2'h3)]);
  assign wire132 = reg118[(2'h3):(1'h0)];
  assign wire133 = (^($unsigned({(wire101 & wire132), {(8'haa), wire101}}) ?
                       $unsigned($unsigned((|reg109))) : {(reg116 >>> (wire132 ?
                               wire130 : wire127))}));
endmodule
