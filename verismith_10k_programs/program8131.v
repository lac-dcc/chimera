module top
#(parameter param77 = ((({((8'ha7) << (7'h43)), ((8'hb5) == (8'ha5))} ? (~|((8'hbd) >= (8'h9f))) : {(~|(8'hbf))}) >= (~^(~((8'h9f) ? (7'h43) : (8'hb3))))) ? (({((8'hb3) ? (8'hb5) : (8'ha8)), (8'hba)} != ((~|(8'haa)) ? ((7'h43) ? (8'hba) : (8'hb1)) : ((8'h9c) < (8'ha8)))) ? ((((8'hbb) ? (8'hb4) : (8'ha8)) ? ((8'hbb) << (8'hb5)) : (|(8'hb5))) || (((8'h9c) ? (7'h41) : (7'h43)) ^~ ((8'h9d) == (8'h9c)))) : ((((8'h9d) ? (8'hae) : (8'hb8)) ? ((8'h9e) ? (8'hbd) : (8'ha9)) : ((8'hb5) ? (8'hb5) : (8'ha8))) ? (+(+(8'hbc))) : ((~&(8'h9e)) ? (^(8'hb0)) : (8'hbb)))) : (((^~((7'h41) != (8'ha8))) >>> ((8'hbe) - (8'ha0))) ? ((!((8'h9f) ? (8'hac) : (8'h9d))) ? (8'h9c) : (8'hac)) : ((!(&(8'ha0))) ? (+{(8'hb9), (8'ha4)}) : (&(7'h43))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire73;
  wire [(3'h7):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire71;
  wire signed [(4'he):(1'h0)] wire69;
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(4'hd):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg74 = (1'h0);
  assign y = {wire73, wire72, wire71, wire69, reg76, reg75, reg74, (1'h0)};
  module5 #() modinst70 (.wire10(wire3), .wire9(wire0), .wire8(wire4), .wire7(wire1), .wire6(wire2), .y(wire69), .clk(clk));
  assign wire71 = $unsigned((&(wire1 ?
                      $unsigned((^~wire3)) : $unsigned($unsigned(wire4)))));
  assign wire72 = wire0[(3'h6):(3'h6)];
  assign wire73 = {({$unsigned((wire0 ?
                              wire4 : wire69))} > wire3[(4'h9):(3'h4)]),
                      (((~(wire1 <= (8'hb3))) & (~&(wire4 != wire3))) & $unsigned(wire71[(1'h0):(1'h0)]))};
  always
    @(posedge clk) begin
      reg74 <= ((~($unsigned($unsigned((7'h40))) ?
          ((wire1 - wire69) != (wire3 ? (8'haf) : wire1)) : (wire2 || (wire72 ?
              wire71 : wire3)))) - ($unsigned(wire0[(1'h0):(1'h0)]) ?
          $signed(wire4[(2'h3):(2'h2)]) : (wire3 && $signed({wire0}))));
      reg75 <= wire4[(1'h0):(1'h0)];
      reg76 <= {($unsigned(wire3) ?
              wire3 : $unsigned((((8'hb7) <<< (8'ha9)) ?
                  $signed(wire73) : $unsigned(wire3)))),
          $signed(reg75[(4'h9):(4'h9)])};
    end
endmodule

module module5
#(parameter param68 = (~((((+(7'h42)) ? (~&(7'h40)) : ((8'hb8) ? (8'hac) : (8'hba))) & {((8'h9c) ? (8'hb9) : (8'hb6)), ((8'hba) | (8'haa))}) ? ((-{(8'hb3), (8'hbc)}) * {(|(8'ha4)), (^~(8'ha3))}) : ((&{(7'h44)}) ? (^~((8'hb2) - (8'ha5))) : (~|{(8'h9d)})))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire signed [(3'h5):(1'h0)] wire9;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire [(4'ha):(1'h0)] wire7;
  input wire [(4'hb):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire67;
  wire signed [(5'h14):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire11;
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire64,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire19,
                 wire18,
                 wire17,
                 wire11,
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
                 reg21,
                 reg20,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire11 = (!wire10[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg12 <= $signed($unsigned(wire10[(3'h6):(1'h0)]));
      if ((reg12 >>> (|reg12)))
        begin
          reg13 <= $unsigned(wire9[(3'h5):(3'h4)]);
          reg14 <= (+($signed((reg13[(4'hc):(3'h5)] ^ $unsigned(wire7))) ?
              wire10 : (reg13[(3'h7):(1'h1)] ? $unsigned(reg13) : wire6)));
          reg15 <= ($unsigned({(wire8 < (^~wire8)),
                  $unsigned((wire7 ? wire6 : reg12))}) ?
              $unsigned($unsigned($unsigned((wire8 ?
                  wire10 : wire11)))) : ((^~$signed(wire7)) ?
                  wire7[(3'h6):(2'h2)] : wire6));
          reg16 <= (&{wire9});
        end
      else
        begin
          reg13 <= wire11;
          reg14 <= ((8'ha3) & ((~^reg14[(1'h0):(1'h0)]) * wire6));
          reg15 <= ($unsigned({(reg12[(1'h0):(1'h0)] ^~ reg15),
                  ($signed(wire6) ? (8'ha0) : wire6)}) ?
              (reg16 ?
                  ((-(wire10 >>> wire7)) ?
                      ((reg16 ? reg14 : wire6) ?
                          wire6[(4'ha):(3'h5)] : wire7[(3'h7):(3'h4)]) : (8'ha9)) : wire6) : $signed((reg14 ?
                  (8'h9f) : ((wire9 ? reg14 : reg16) ?
                      {wire11} : (wire9 || wire6)))));
        end
    end
  assign wire17 = wire7[(2'h2):(2'h2)];
  assign wire18 = wire9;
  assign wire19 = (wire8 ?
                      (-(&((&reg16) | (wire8 ?
                          wire10 : (8'hb3))))) : $signed(((&$signed(wire18)) ?
                          (&{wire10, reg15}) : $unsigned($signed(wire10)))));
  always
    @(posedge clk) begin
      reg20 <= {reg15[(1'h1):(1'h1)],
          $unsigned(((wire10 >= $unsigned(wire18)) << $signed((wire9 <<< (8'hbe)))))};
      reg21 <= ($unsigned($signed(({wire18, (8'haa)} ?
              (~wire6) : wire9[(3'h5):(2'h2)]))) ?
          (^~$unsigned($unsigned(wire8[(4'h9):(4'h8)]))) : $unsigned(reg20));
      if (wire6[(2'h3):(1'h1)])
        begin
          reg22 <= ((8'hba) ?
              $unsigned({reg15}) : (({(!reg20),
                      $unsigned(reg21)} == $signed(wire9[(3'h4):(3'h4)])) ?
                  wire6 : (+((&reg20) | (~(8'haf))))));
          reg23 <= (reg16[(4'he):(1'h1)] == (wire9[(3'h5):(3'h4)] ?
              ({$signed(wire7)} & $unsigned(((7'h41) ?
                  wire11 : reg20))) : (8'h9c)));
        end
      else
        begin
          reg22 <= (~{((+{reg15}) ? $unsigned((wire8 ^ reg16)) : (7'h40))});
          if ((&(({(reg21 ? (7'h42) : wire9)} ?
              ($signed(reg16) ?
                  wire19[(3'h5):(1'h1)] : {wire9,
                      wire10}) : wire6) << $unsigned((&{reg23, reg23})))))
            begin
              reg23 <= (-$unsigned((|(-wire18[(4'h9):(3'h7)]))));
              reg24 <= $signed(wire8[(4'h9):(3'h5)]);
              reg25 <= (({reg14} ?
                      ($unsigned((wire7 != reg21)) != ({wire19} - wire18)) : (~|wire8[(1'h0):(1'h0)])) ?
                  $signed($unsigned($unsigned({reg21,
                      wire9}))) : {($unsigned(reg23) ? wire18 : reg20)});
              reg26 <= $signed($signed((~|$signed($signed(wire7)))));
            end
          else
            begin
              reg23 <= ((-$signed((reg15[(3'h5):(1'h0)] ?
                      (8'ha5) : $unsigned(wire9)))) ?
                  (+($signed((reg26 == wire9)) & (~|(reg24 >= reg25)))) : (^~$unsigned(reg13[(3'h6):(3'h4)])));
              reg24 <= $signed(reg20);
              reg25 <= ($signed((((wire10 ? wire9 : reg20) ?
                          $signed(wire6) : $signed(wire19)) ?
                      reg14 : (8'ha4))) ?
                  $unsigned({(reg26 ~^ ((8'ha7) ? wire17 : wire17)),
                      $signed(((8'hb7) ? wire8 : reg21))}) : reg21);
            end
          if ($unsigned($signed(((wire18[(4'hc):(3'h5)] ?
                  wire8 : reg16[(3'h6):(1'h0)]) ?
              ((wire11 < wire6) >= ((7'h42) & (7'h43))) : $signed($unsigned(reg12))))))
            begin
              reg27 <= $unsigned(wire17[(3'h4):(2'h3)]);
              reg28 <= reg26[(4'h9):(2'h3)];
              reg29 <= reg20;
            end
          else
            begin
              reg27 <= {(-({reg14,
                      $signed(reg29)} >= ($unsigned(reg25) + (wire6 ^ wire17))))};
              reg28 <= (reg14 + $signed(reg20));
              reg29 <= (~reg22);
            end
        end
    end
  always
    @(posedge clk) begin
      reg30 <= $unsigned(reg12);
      reg31 <= reg21[(3'h7):(2'h3)];
      reg32 <= ($signed((((wire6 >= wire8) - ((7'h44) ?
          wire7 : reg13)) <<< ((+reg12) ?
          $signed(reg13) : {reg14, reg14}))) >> reg14);
    end
  assign wire33 = reg26[(3'h6):(1'h1)];
  assign wire34 = $signed((8'haa));
  assign wire35 = $signed(($signed(wire6) + $signed(($signed(wire33) ^ (^reg31)))));
  assign wire36 = (reg20[(3'h5):(2'h2)] ?
                      ($signed(wire19) ?
                          {$unsigned((^~wire7)),
                              (|(8'hb7))} : wire9[(2'h3):(2'h3)]) : reg20[(4'hf):(4'hc)]);
  module37 #() modinst65 (wire64, clk, wire36, reg32, reg14, wire17);
  assign wire66 = $signed((+$signed(reg15[(1'h1):(1'h1)])));
  assign wire67 = ({$unsigned($unsigned({reg14}))} <= {$signed($signed((reg13 != wire66)))});
endmodule

module module37
#(parameter param63 = (((8'hb1) >>> {((!(8'h9c)) | ((8'h9c) ? (8'hba) : (8'hb6)))}) >> {((8'hb7) << (^((7'h42) ? (8'hb4) : (8'hb5))))}))
(y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire41;
  input wire signed [(4'h8):(1'h0)] wire40;
  input wire [(5'h15):(1'h0)] wire39;
  input wire signed [(4'hb):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire62;
  wire signed [(4'h9):(1'h0)] wire61;
  wire signed [(4'h8):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire57;
  wire [(3'h5):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire48;
  wire [(5'h15):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire44;
  wire [(2'h2):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire57,
                 wire56,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 reg59,
                 reg58,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire42 = ($signed($signed($signed({wire41, wire38}))) ?
                      wire41 : wire41);
  assign wire43 = (wire41[(3'h7):(1'h0)] > $signed(($unsigned({wire39,
                          wire40}) ?
                      (!wire42) : $unsigned((wire38 ? wire39 : wire38)))));
  assign wire44 = $signed(wire39[(1'h1):(1'h0)]);
  assign wire45 = ((-wire41) ?
                      (($unsigned((wire41 ?
                          (7'h44) : wire40)) == wire41) >= ((8'ha6) + (wire38[(1'h0):(1'h0)] ?
                          (wire40 + wire39) : (wire42 < (7'h43))))) : wire38);
  assign wire46 = {((~((8'ha3) ? wire38 : $unsigned(wire42))) ^~ (&wire38))};
  assign wire47 = $signed(wire45);
  assign wire48 = $signed((wire43 && $signed(wire41[(5'h13):(4'hd)])));
  always
    @(posedge clk) begin
      if ($unsigned(wire41))
        begin
          reg49 <= ({wire47[(4'h8):(2'h3)], $unsigned(wire38[(4'ha):(1'h1)])} ?
              $unsigned($unsigned(((wire42 ?
                  wire47 : wire48) != $unsigned(wire41)))) : wire48[(2'h2):(2'h2)]);
        end
      else
        begin
          if ((wire44[(3'h7):(2'h3)] << wire45[(2'h3):(1'h1)]))
            begin
              reg49 <= $unsigned(((&(+{wire38, reg49})) & $unsigned(wire42)));
              reg50 <= (wire43[(2'h2):(2'h2)] ?
                  $unsigned(wire39) : (~&(-$unsigned((~^(8'hb9))))));
            end
          else
            begin
              reg49 <= (+wire45);
              reg50 <= (^(-(~|$unsigned(wire48))));
            end
          reg51 <= (((~wire42[(2'h3):(2'h2)]) && $signed($signed($unsigned(wire48)))) <= ($unsigned(wire42[(3'h4):(1'h1)]) | $unsigned(($signed(wire38) ?
              (~^(8'had)) : $signed(wire46)))));
          reg52 <= (((^$unsigned((~|wire45))) ?
                  (({wire46} | {wire43, wire46}) ?
                      ((~wire46) ?
                          (wire45 ?
                              (8'ha9) : (8'hb9)) : (reg49 & (8'haa))) : (&wire38[(1'h1):(1'h0)])) : $signed(wire41[(5'h13):(4'hb)])) ?
              $unsigned((($signed(wire40) >= {wire47}) > (!$unsigned(wire38)))) : $signed($unsigned((wire46 ?
                  $unsigned(wire45) : wire38))));
          reg53 <= $unsigned($signed($unsigned($unsigned(wire39))));
          reg54 <= ($signed({wire43[(1'h0):(1'h0)]}) << (8'hb4));
        end
      reg55 <= (8'hbd);
    end
  assign wire56 = $signed($unsigned(wire44));
  assign wire57 = {(~^(((wire56 >> wire45) ?
                              (reg51 >> wire44) : (wire41 ? wire39 : (8'hb0))) ?
                          {wire46} : $signed($unsigned(reg55))))};
  always
    @(posedge clk) begin
      reg58 <= $signed(reg49);
      reg59 <= (((~^($signed(wire42) && {(8'hab), reg49})) ?
              reg54 : (^(wire38 ? (!reg55) : $unsigned(wire46)))) ?
          $unsigned(reg51) : reg53);
    end
  assign wire60 = reg49;
  assign wire61 = $unsigned(((&$signed($signed((8'haf)))) ?
                      $signed(($unsigned(wire47) ~^ (wire43 != (8'hae)))) : $signed($unsigned($signed(wire56)))));
  assign wire62 = reg55;
endmodule
