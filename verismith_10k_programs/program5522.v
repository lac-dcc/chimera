module top
#(parameter param60 = (((((&(8'ha6)) >> ((8'hb4) <= (8'ha8))) >>> (((8'ha3) >>> (8'h9e)) ? ((8'hb8) <= (8'ha2)) : (8'h9e))) & ((((8'hb7) ? (8'ha0) : (8'ha1)) ? {(8'hb3)} : {(8'ha9), (7'h43)}) ~^ {{(7'h40), (8'hbb)}, ((8'ha2) + (7'h44))})) ? (((((8'hb6) ? (8'h9d) : (7'h44)) ? (~&(8'hbc)) : {(8'ha7)}) || (((8'h9e) != (8'h9c)) ? {(8'ha7)} : ((8'ha7) ? (7'h41) : (8'haa)))) ? (7'h40) : (8'hb9)) : (8'ha2)), 
parameter param61 = param60)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire59;
  wire [(3'h5):(1'h0)] wire58;
  wire [(4'h9):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire50,
                 wire13,
                 wire12,
                 wire11,
                 wire6,
                 wire5,
                 wire4,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = ({wire0} ?
                     $signed(($signed((!wire1)) << (~$unsigned((8'hb7))))) : $signed(wire0[(4'hd):(1'h0)]));
  assign wire5 = {(~|{$signed(wire2[(2'h3):(2'h2)]), (~|{wire4, (8'h9f)})})};
  assign wire6 = $unsigned((~&{($unsigned((8'hb8)) < wire0[(4'h9):(1'h0)])}));
  always
    @(posedge clk) begin
      reg7 <= wire5;
      reg8 <= (&wire0[(4'hc):(1'h0)]);
      reg9 <= $unsigned(({(8'h9f), reg7[(3'h6):(3'h5)]} & $unsigned((+(reg8 ?
          wire5 : wire1)))));
      reg10 <= ((({$unsigned(wire5), (reg7 ? wire3 : (8'ha5))} ?
              (wire4 ?
                  wire6[(3'h5):(3'h5)] : (^wire1)) : ((&(8'hb2)) ^~ (^wire3))) ?
          (reg7 ?
              reg7[(5'h11):(4'h9)] : ((reg8 ? reg8 : wire1) - (wire1 ?
                  reg9 : wire3))) : reg8[(4'h9):(4'h9)]) * ($unsigned(((wire4 ?
          reg8 : reg7) & {wire5})) | (((~wire6) ?
          (reg8 ? wire6 : wire0) : (~^reg7)) | {(+wire3)})));
    end
  assign wire11 = ($unsigned((wire4 ?
                      reg7[(2'h2):(1'h1)] : $signed((reg8 ?
                          wire0 : (8'ha7))))) && (wire1 ?
                      (^~wire2[(3'h4):(1'h1)]) : (~|((wire3 + wire3) ?
                          $unsigned(wire5) : wire6))));
  assign wire12 = ({reg9[(3'h5):(1'h0)]} ?
                      (reg9 ?
                          $unsigned(((wire4 || wire0) >> $unsigned((8'h9d)))) : wire5) : wire3);
  assign wire13 = $unsigned((wire3 ?
                      reg9[(4'h8):(1'h0)] : $signed($unsigned((~reg10)))));
  module14 #() modinst51 (wire50, clk, wire6, wire1, wire12, wire4);
  assign wire52 = ($unsigned(wire4[(4'he):(3'h7)]) ?
                      (&wire1[(3'h4):(1'h0)]) : reg9[(5'h12):(3'h7)]);
  assign wire53 = $unsigned(wire13);
  assign wire54 = (7'h40);
  assign wire55 = (wire54 | (~&wire6));
  assign wire56 = $unsigned($unsigned($unsigned(($signed(wire12) ^~ (reg9 ?
                      wire52 : reg10)))));
  assign wire57 = wire3[(3'h4):(3'h4)];
  assign wire58 = {(((((7'h42) ? wire2 : wire5) ?
                                  ((8'hbd) >>> wire4) : {wire53, reg9}) ?
                              wire57 : ((wire50 <= (8'ha8)) == wire4[(4'hc):(2'h3)])) ?
                          wire11[(5'h13):(2'h2)] : wire52[(1'h0):(1'h0)])};
  assign wire59 = {(((^~(wire13 <= wire58)) ?
                          $signed((wire54 * wire13)) : ($signed(wire4) ?
                              (reg10 <<< wire55) : wire12[(4'ha):(4'ha)])) ~^ (-(wire11 ?
                          reg7[(4'h9):(1'h1)] : (wire58 ? wire11 : wire2))))};
endmodule

module module14
#(parameter param48 = (((-((^~(8'hac)) << (+(8'hb2)))) | {(((8'hb0) ^~ (8'hbe)) ? {(8'ha9), (8'ha3)} : (^(8'h9d))), (((8'hb5) ^ (8'hbc)) ? ((8'hb7) ? (8'hbd) : (8'ha6)) : (8'hb9))}) ? (7'h44) : (((((8'hb4) ? (8'hb0) : (8'haf)) ~^ ((8'h9c) || (8'ha7))) ? (~^(|(8'hbf))) : (|(^(8'hb7)))) == (~|(8'hb9)))), 
parameter param49 = {(!{param48, (+(param48 || param48))})})
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h158):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire18;
  input wire signed [(2'h3):(1'h0)] wire17;
  input wire signed [(4'h9):(1'h0)] wire16;
  input wire [(5'h12):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  wire [(5'h10):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire41;
  wire signed [(3'h5):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire38;
  wire signed [(3'h4):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire19;
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire21,
                 wire20,
                 wire19,
                 reg45,
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
                 (1'h0)};
  assign wire19 = wire18[(3'h6):(1'h1)];
  assign wire20 = ({wire18} ~^ wire18);
  assign wire21 = ($unsigned(wire20) * $unsigned((($unsigned(wire19) == $unsigned(wire19)) ?
                      (~^{wire19}) : (8'hb8))));
  always
    @(posedge clk) begin
      reg22 <= (+(^(wire20[(4'h8):(4'h8)] ?
          $signed((~^wire19)) : (~&(wire17 ? (8'ha4) : wire17)))));
      reg23 <= ({(~^{(wire20 == wire21), (wire15 ? wire21 : (8'ha2))}),
              ($unsigned(wire20) >>> ((wire17 ?
                  wire15 : wire20) >>> wire19[(3'h7):(1'h1)]))} ?
          {wire17,
              ($signed(((8'hab) ?
                  wire17 : wire19)) ~^ $unsigned($unsigned(reg22)))} : (+wire20));
      if (reg22[(4'h9):(1'h1)])
        begin
          if ($signed(($unsigned($signed($unsigned(wire17))) ?
              wire21[(3'h7):(1'h1)] : reg23)))
            begin
              reg24 <= (|(|($unsigned($unsigned(wire18)) < ($unsigned(wire15) >>> wire15))));
              reg25 <= (&((8'ha2) || ($signed($signed(reg24)) >= wire19)));
            end
          else
            begin
              reg24 <= $signed($unsigned($unsigned($signed($unsigned(wire18)))));
              reg25 <= wire16;
              reg26 <= ($unsigned(reg23) + $signed(((|(~^wire19)) ^~ reg24[(2'h2):(1'h0)])));
              reg27 <= wire17[(2'h3):(1'h1)];
              reg28 <= ((reg26 && {(^wire20[(4'hf):(4'hb)]),
                  (wire19[(4'hc):(4'h9)] ~^ (wire18 == wire21))}) <<< $signed(wire15[(4'h9):(3'h6)]));
            end
          reg29 <= {((({wire21, wire21} ?
                          (wire21 ? reg25 : wire19) : $signed(reg28)) ?
                      (8'hb4) : wire21) ?
                  wire21[(3'h4):(3'h4)] : ({(wire21 > wire16)} ?
                      $signed((reg24 ? wire20 : reg25)) : reg24)),
              (8'hbe)};
          reg30 <= reg29[(1'h1):(1'h1)];
          reg31 <= reg26;
          reg32 <= reg22;
        end
      else
        begin
          reg24 <= $signed({reg27});
          if (((($signed($signed(wire19)) << wire19[(4'h9):(3'h4)]) ?
                  {(~^reg27[(3'h6):(2'h2)]),
                      wire20} : ((8'hbf) > reg32[(3'h5):(3'h4)])) ?
              reg22 : $signed((|$unsigned((reg27 < reg29))))))
            begin
              reg25 <= (~$signed((-$signed((7'h40)))));
              reg26 <= reg23;
              reg27 <= $unsigned(wire18[(3'h4):(3'h4)]);
              reg28 <= (reg30[(4'he):(4'h8)] ?
                  wire21[(3'h4):(2'h2)] : $unsigned($signed(((reg32 ?
                          reg24 : wire17) ?
                      reg22 : (8'ha0)))));
              reg29 <= {$signed((!reg31[(1'h0):(1'h0)]))};
            end
          else
            begin
              reg25 <= $unsigned($unsigned($unsigned(((reg24 ?
                  wire18 : reg31) - $signed((8'hae))))));
              reg26 <= {(~reg26[(5'h10):(3'h5)]),
                  (wire21 ~^ (wire15[(3'h5):(1'h1)] ?
                      (!reg31[(3'h6):(1'h1)]) : ({wire19} ?
                          reg24[(1'h1):(1'h0)] : $unsigned(wire19))))};
              reg27 <= $signed(wire15);
              reg28 <= ((($unsigned($unsigned(wire15)) & $unsigned((^~(8'ha6)))) <= ((|reg24[(2'h2):(1'h0)]) ?
                      reg31[(4'hd):(3'h6)] : (8'h9f))) ?
                  $signed((reg24 >= (|(+wire17)))) : reg29);
            end
          reg30 <= {wire21};
          reg31 <= (~|wire16);
          reg32 <= ($signed((7'h43)) ?
              ($signed(($signed(reg26) ?
                  (reg22 ?
                      (8'h9e) : reg31) : $signed(wire21))) <<< (8'hb8)) : (reg24 ?
                  ($signed((wire16 >>> (8'hb1))) * reg27) : $unsigned(({reg29} - {wire17}))));
        end
      reg33 <= (reg28[(3'h4):(1'h0)] << $unsigned(reg23[(1'h1):(1'h1)]));
    end
  assign wire34 = (wire20 != $signed((^reg27)));
  assign wire35 = (reg30[(5'h14):(4'h9)] >> (wire17 ?
                      $unsigned($signed((reg33 * wire15))) : reg25[(3'h4):(3'h4)]));
  assign wire36 = (($signed(((wire35 >>> reg23) & (wire20 ?
                          reg28 : reg31))) > {wire35, (8'ha7)}) ?
                      wire16[(2'h3):(1'h0)] : $signed((({wire18,
                              reg26} >= wire15) ?
                          ((wire18 > reg29) ?
                              $unsigned(reg33) : $signed(wire19)) : (reg30[(4'ha):(3'h5)] < reg33))));
  assign wire37 = wire34;
  assign wire38 = ($signed({((&wire19) ?
                              $unsigned(reg32) : $unsigned(wire34))}) ?
                      wire19 : $unsigned(((((8'hbc) >>> reg29) ?
                          $signed(wire35) : wire35[(1'h0):(1'h0)]) < ($signed(wire19) ?
                          (~&reg33) : wire20))));
  assign wire39 = (wire35[(4'h8):(1'h0)] > {(((&reg32) ^~ {(8'h9e)}) ?
                          $unsigned((wire17 ?
                              reg31 : (8'ha8))) : $signed(reg25[(4'ha):(3'h4)])),
                      wire16});
  assign wire40 = ({(reg30 & wire18[(4'h8):(3'h4)])} >>> wire21);
  assign wire41 = ((~(((wire36 ^ wire39) >>> ((7'h42) >> wire34)) ?
                          $signed($signed(reg31)) : (+(reg29 ^~ (8'ha0))))) ?
                      reg29 : $unsigned(wire35[(4'h9):(2'h2)]));
  assign wire42 = {wire36};
  assign wire43 = (reg25[(4'he):(4'hc)] ?
                      {(8'ha1)} : (reg29[(2'h3):(1'h1)] ?
                          ((!(~^wire36)) & (+$unsigned(wire42))) : reg32[(2'h3):(2'h3)]));
  assign wire44 = $unsigned((^~(({reg32, wire16} << (~|(8'hbf))) ?
                      $unsigned((wire19 ? reg26 : wire18)) : reg33)));
  always
    @(posedge clk) begin
      reg45 <= (($unsigned({wire41}) || reg25) - reg31);
    end
  assign wire46 = $unsigned($signed((((|reg45) ?
                          wire34[(4'hc):(4'hc)] : (reg33 >> wire39)) ?
                      $unsigned((-(8'hb4))) : (reg25[(4'hd):(4'hd)] ^ wire20[(3'h5):(2'h2)]))));
  assign wire47 = (~$signed((($signed(reg30) ?
                      (wire21 & reg45) : (+(8'hae))) ~^ wire40)));
endmodule
