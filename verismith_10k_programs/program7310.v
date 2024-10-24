module top
#(parameter param90 = ((((~((8'ha0) ? (8'hbe) : (8'ha6))) <= ((~^(8'ha0)) ~^ ((8'haa) ? (8'haa) : (8'haa)))) < (^(~&(~&(8'ha3))))) ? (({((8'ha2) ? (8'hb3) : (8'hb6))} ~^ (&((8'hb2) <<< (8'hb1)))) >> (8'ha2)) : {(8'ha6), (|{(|(8'hbd)), (^(8'hba))})}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h173):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire88;
  wire [(5'h15):(1'h0)] wire32;
  wire [(5'h14):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire27;
  reg [(2'h2):(1'h0)] reg4 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  assign y = {wire88,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
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
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (~^(-(((wire0 ? wire0 : wire1) ?
          wire2 : {(8'ha3), wire3}) && $unsigned($unsigned(wire0)))));
      if ({(((wire3 ? $unsigned(wire1) : wire1[(3'h4):(1'h0)]) ?
              wire0 : ($unsigned(wire1) ?
                  (^wire2) : wire0[(4'h8):(3'h7)])) ^ ($signed((wire0 ?
              (8'haa) : (8'hb4))) || $signed((wire3 ? (8'h9c) : wire0))))})
        begin
          reg5 <= ($unsigned($unsigned(wire1)) ?
              $unsigned($unsigned((wire3 - {(8'hb8)}))) : (($unsigned(wire1) ?
                      (-reg4) : $signed(wire2)) ?
                  reg4[(2'h2):(1'h1)] : ((^$signed(wire1)) | $signed($unsigned((8'hb9))))));
          reg6 <= $unsigned((-(($signed(wire1) ?
              wire0[(3'h5):(3'h4)] : ((8'hb6) >>> reg4)) * $signed((reg5 ?
              wire3 : reg4)))));
          reg7 <= $unsigned(((reg5[(4'hb):(3'h6)] >>> wire3) + {(~|(&reg6)),
              wire3[(1'h1):(1'h1)]}));
          reg8 <= wire1;
        end
      else
        begin
          reg5 <= {({((reg6 ? (8'hae) : (8'hbc)) != $unsigned(wire0)),
                      ((~|wire2) * (8'had))} ?
                  $unsigned(reg7[(4'h9):(2'h2)]) : ($signed((wire0 ?
                          (8'hbd) : wire2)) ?
                      reg6[(4'hd):(3'h6)] : {(reg5 >>> reg5), wire3})),
              ($signed((~$signed(wire2))) ^~ ({(wire3 ? reg4 : (8'hbe))} ?
                  $signed((8'hb3)) : wire2))};
        end
    end
  always
    @(posedge clk) begin
      reg9 <= $unsigned({((^~wire0) ?
              (((8'hb5) ? reg4 : reg5) ?
                  $signed(wire3) : (wire3 ?
                      reg5 : reg4)) : (+(wire0 << (8'hb3))))});
      reg10 <= $unsigned($signed((((~|(8'ha1)) ~^ {(8'h9d),
          (7'h43)}) ^~ $unsigned(wire0))));
      if ({(reg10[(3'h5):(2'h3)] || (wire0[(4'hc):(3'h5)] && reg9[(3'h5):(2'h2)]))})
        begin
          if (wire1)
            begin
              reg11 <= ($unsigned(wire1) | $signed({$unsigned($unsigned((8'hbe))),
                  ({reg8, reg6} | {reg7, (8'hbc)})}));
              reg12 <= (8'ha6);
              reg13 <= wire0;
              reg14 <= wire1;
              reg15 <= $signed(reg6[(3'h6):(3'h6)]);
            end
          else
            begin
              reg11 <= (&($signed((8'h9e)) ?
                  ((~|(^reg12)) ? (^reg5) : reg6) : reg6[(3'h5):(1'h1)]));
              reg12 <= (-wire2);
            end
          reg16 <= ((($unsigned($signed(reg6)) ?
                  reg7[(5'h13):(5'h13)] : (^~(reg4 >>> wire3))) ?
              (reg10[(4'h9):(4'h9)] ?
                  (reg13 && (~|reg10)) : $unsigned((reg11 >> reg8))) : $unsigned(reg5)) * (^(~|({reg4,
                  reg9} ?
              ((8'haf) ? reg7 : reg11) : reg6[(3'h4):(2'h2)]))));
          reg17 <= {$signed($unsigned((8'hb2)))};
          reg18 <= (((|reg16[(1'h0):(1'h0)]) <= reg14) - $signed({$unsigned((reg15 <<< reg14)),
              (^~(-wire1))}));
        end
      else
        begin
          if (reg4[(1'h0):(1'h0)])
            begin
              reg11 <= (reg4 == $signed($signed(((!reg15) ?
                  $unsigned(reg14) : $unsigned(reg12)))));
              reg12 <= reg4;
              reg13 <= reg14[(3'h5):(2'h2)];
              reg14 <= (-(!($unsigned((~^(8'hb7))) ^ reg16)));
            end
          else
            begin
              reg11 <= {(reg15[(5'h13):(3'h6)] ~^ (~&reg12[(1'h1):(1'h1)]))};
            end
          reg15 <= ((reg7 ? ({(8'ha9)} * reg11) : reg17) ? wire1 : reg14);
          reg16 <= reg6[(2'h2):(2'h2)];
          if (reg12[(3'h7):(3'h5)])
            begin
              reg17 <= $unsigned((($signed(reg6[(4'hc):(2'h2)]) < ({reg11} ?
                  reg18[(4'hb):(3'h5)] : {reg15,
                      reg4})) || $signed(($signed(reg11) && (!reg15)))));
              reg18 <= $unsigned((reg5 ?
                  $unsigned(($unsigned(reg14) ?
                      (|reg15) : $signed(reg11))) : $signed(((wire2 ?
                          reg4 : reg7) ?
                      $unsigned(reg17) : $unsigned(reg16)))));
              reg19 <= ((^reg15[(3'h5):(2'h2)]) ?
                  (+$unsigned({reg16[(1'h1):(1'h1)]})) : $unsigned(($signed((reg14 ?
                      reg15 : reg10)) == reg16[(1'h0):(1'h0)])));
              reg20 <= reg12;
              reg21 <= (reg17[(3'h4):(3'h4)] && (reg13 ?
                  wire0[(4'he):(3'h6)] : (!$signed((^wire3)))));
            end
          else
            begin
              reg17 <= {$signed($signed($unsigned((reg21 << reg10))))};
              reg18 <= $unsigned(((reg16[(3'h4):(2'h3)] ?
                      reg18[(3'h5):(3'h4)] : $unsigned((~reg21))) ?
                  (|(~&reg15[(1'h0):(1'h0)])) : ($signed((reg19 != (8'ha3))) | reg20[(3'h4):(1'h0)])));
              reg19 <= {(reg19 << {reg11[(2'h3):(2'h3)]}), reg16};
            end
          if (({((|(+reg7)) - (((8'hbe) <= reg17) ?
                      reg8[(2'h2):(1'h1)] : $signed(reg17)))} ?
              $unsigned($signed($unsigned($unsigned((8'h9e))))) : (reg20[(4'hf):(4'h8)] ?
                  ((8'h9c) ? reg16 : reg12) : ($signed(reg13) ?
                      $signed($unsigned(reg17)) : reg12[(2'h2):(1'h1)]))))
            begin
              reg22 <= reg12[(3'h7):(3'h5)];
              reg23 <= (|reg8);
              reg24 <= ($unsigned(reg15[(2'h3):(2'h2)]) ?
                  (|(~^reg19[(4'h9):(3'h5)])) : (wire1 ^ reg4));
              reg25 <= {(reg5 ?
                      ((^(^(8'haa))) ?
                          reg19[(3'h6):(3'h4)] : reg5) : ($signed(reg6) ?
                          ($unsigned(reg5) < reg16) : $unsigned($unsigned(reg15))))};
              reg26 <= (!({(reg19[(4'h8):(1'h0)] ? $signed(reg5) : (^reg15)),
                      reg23[(4'h9):(1'h0)]} ?
                  $unsigned((~$unsigned(reg22))) : {(reg9[(4'hd):(4'h9)] >= {reg16}),
                      (reg25 & reg11)}));
            end
          else
            begin
              reg22 <= reg24[(3'h5):(1'h0)];
              reg23 <= reg6[(3'h6):(1'h0)];
              reg24 <= $signed(((^(reg26 ? $signed((7'h42)) : {reg20, reg11})) ?
                  {((wire1 & reg25) >= (reg22 ? reg21 : reg20)),
                      (|reg6)} : reg8[(3'h7):(3'h4)]));
              reg25 <= reg18;
            end
        end
    end
  assign wire27 = reg15[(4'hf):(4'he)];
  assign wire28 = $unsigned(reg24);
  assign wire29 = (8'hbf);
  assign wire30 = reg5;
  assign wire31 = reg17[(1'h0):(1'h0)];
  assign wire32 = $signed((|($unsigned(reg12) ?
                      (wire28 >> $signed(reg11)) : ((wire3 ? wire1 : reg23) ?
                          (wire3 ? reg19 : reg6) : $signed(wire31)))));
  module33 #() modinst89 (wire88, clk, reg8, wire1, reg6, reg18, wire31);
endmodule

module module33
#(parameter param87 = ((&((((8'haa) || (8'h9e)) <<< ((8'hb6) ~^ (8'hb5))) | {{(8'h9c), (8'hb1)}})) ? (&((((8'ha5) ? (8'had) : (8'hac)) <<< ((8'h9e) ? (8'hb8) : (8'ha8))) ? ({(8'ha2)} || (+(8'hb6))) : (((8'ha4) ? (8'hac) : (8'h9e)) - {(8'hac)}))) : (((!(&(8'ha6))) >= ({(8'h9e)} ? {(8'hb2), (8'hbd)} : ((8'hb8) ? (7'h41) : (8'h9e)))) ^~ (8'ha7))))
(y, clk, wire38, wire37, wire36, wire35, wire34);
  output wire [(32'h24c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire38;
  input wire signed [(4'h9):(1'h0)] wire37;
  input wire [(5'h10):(1'h0)] wire36;
  input wire [(4'hf):(1'h0)] wire35;
  input wire signed [(5'h14):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire85;
  wire signed [(5'h14):(1'h0)] wire84;
  wire [(4'hb):(1'h0)] wire83;
  wire signed [(3'h4):(1'h0)] wire82;
  wire [(5'h14):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire72;
  wire [(4'h9):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire39;
  reg [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire74,
                 wire73,
                 wire72,
                 wire47,
                 wire46,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  assign wire39 = (wire34 >>> (!(&wire38)));
  assign wire40 = $unsigned($signed(wire35[(3'h6):(3'h6)]));
  assign wire41 = (8'hba);
  assign wire42 = (~$signed((~^({wire37} ?
                      $unsigned(wire38) : $signed(wire38)))));
  always
    @(posedge clk) begin
      reg43 <= $signed({wire41,
          $unsigned(((-wire39) ? (~^wire38) : wire34[(4'hb):(3'h6)]))});
      reg44 <= ($signed($signed((8'hb5))) > wire38[(3'h5):(3'h4)]);
      reg45 <= {($unsigned(wire35) + wire40[(1'h1):(1'h1)])};
    end
  assign wire46 = wire40;
  assign wire47 = (((^(wire35[(3'h4):(3'h4)] ?
                              (wire40 ? wire38 : wire34) : $signed(reg43))) ?
                          {reg44[(3'h6):(2'h3)],
                              ((wire40 * reg43) ^ {wire42,
                                  wire35})} : $unsigned($signed((wire42 > wire39)))) ?
                      $unsigned({$unsigned((wire40 ? wire36 : wire46)),
                          $signed({wire41,
                              wire42})}) : (~|(wire41[(5'h12):(5'h11)] ?
                          (!$signed(reg43)) : $unsigned($unsigned(reg44)))));
  always
    @(posedge clk) begin
      reg48 <= wire36;
      reg49 <= reg44;
      if (wire42)
        begin
          reg50 <= (|(~^wire39));
          if (wire34[(3'h6):(3'h6)])
            begin
              reg51 <= reg50;
              reg52 <= ($unsigned(($signed(wire39[(3'h7):(3'h5)]) ?
                  {(wire35 ? wire34 : wire34),
                      wire46[(3'h7):(3'h7)]} : $signed($unsigned(reg49)))) << (-(($signed(reg50) ?
                      (&wire39) : (reg44 >>> wire47)) ?
                  reg45[(4'hd):(4'hd)] : (((8'ha7) ^ wire39) * (reg43 == wire40)))));
            end
          else
            begin
              reg51 <= $unsigned(($unsigned((reg51 != {reg44,
                  wire37})) << reg45[(4'he):(4'h8)]));
              reg52 <= wire40[(3'h6):(3'h6)];
            end
          reg53 <= (^{(-$signed($signed(reg50)))});
          if ($unsigned($unsigned((~&{(8'hb2)}))))
            begin
              reg54 <= {(((wire41 ? (wire35 - wire37) : (&wire41)) ?
                      $unsigned((&wire47)) : wire34) <<< (!wire36[(1'h1):(1'h0)]))};
              reg55 <= $unsigned((!(~|(reg49 ~^ {wire39}))));
            end
          else
            begin
              reg54 <= wire35;
              reg55 <= reg54[(4'hb):(4'h9)];
            end
        end
      else
        begin
          if (wire41)
            begin
              reg50 <= (reg49 > $signed(reg43));
              reg51 <= (8'ha7);
              reg52 <= wire42;
              reg53 <= reg54[(5'h11):(3'h5)];
            end
          else
            begin
              reg50 <= $unsigned(reg51);
              reg51 <= $signed($unsigned(wire37[(4'h9):(4'h8)]));
              reg52 <= {$unsigned((!$signed({wire46})))};
              reg53 <= (({$unsigned({wire36, reg44}),
                      ((+wire37) >= reg53[(3'h6):(2'h3)])} ?
                  $signed((~wire46)) : ((~|reg49) ?
                      (&reg54[(4'hb):(2'h3)]) : ($signed(reg45) != ((8'ha1) ?
                          reg54 : reg43)))) ~^ $unsigned($signed(reg50)));
            end
          reg54 <= wire40;
          reg55 <= wire40[(4'hd):(4'h9)];
          reg56 <= $signed($unsigned(reg55[(1'h0):(1'h0)]));
          if (reg54)
            begin
              reg57 <= (^~{(^(8'haf)),
                  ((+$signed((8'hb5))) + ((+reg49) ?
                      (|wire41) : (reg45 >>> reg44)))});
              reg58 <= ($signed((|{(wire34 >= (8'hbd)),
                  $signed((8'ha6))})) ^~ ($signed(({reg49, (8'ha9)} ?
                      $unsigned(wire46) : $unsigned(reg51))) ?
                  ((8'haf) ?
                      (|reg43[(4'hc):(1'h0)]) : (&((7'h43) ?
                          reg54 : wire40))) : wire47));
              reg59 <= $signed((($signed((&wire38)) || ({reg58,
                      reg51} >>> reg44)) ?
                  (|((wire39 != wire47) && $signed(wire42))) : reg55[(2'h3):(2'h2)]));
              reg60 <= $signed(wire37[(3'h5):(1'h1)]);
              reg61 <= reg54[(1'h0):(1'h0)];
            end
          else
            begin
              reg57 <= (reg49[(5'h10):(4'hd)] ^~ wire38);
              reg58 <= reg49[(3'h7):(3'h6)];
              reg59 <= {$signed((reg44 ?
                      ({reg56} ?
                          (reg50 ? wire39 : (8'h9f)) : (reg49 ?
                              reg60 : wire38)) : wire42))};
            end
        end
      if (reg56)
        begin
          reg62 <= ((~$unsigned(((8'hb7) ?
                  reg59[(1'h1):(1'h0)] : {wire41, reg45}))) ?
              wire38[(2'h3):(1'h1)] : $signed((({reg59, reg53} >= (wire36 ?
                  reg59 : wire46)) & {$signed(reg43)})));
          reg63 <= $signed((^(^~$signed((reg50 ? (8'hb1) : wire39)))));
          if (reg45)
            begin
              reg64 <= $unsigned((~^{$signed(wire46), (8'hbc)}));
              reg65 <= $unsigned($signed((wire37 & ($signed(reg50) ?
                  reg63[(1'h0):(1'h0)] : {wire36}))));
              reg66 <= reg64;
              reg67 <= ($unsigned((($signed(reg60) == (wire47 && reg58)) == $signed(reg50[(1'h0):(1'h0)]))) ^ ((~wire36) ?
                  (({(7'h42)} ? (~&reg43) : reg59[(1'h1):(1'h1)]) ?
                      wire42[(3'h4):(1'h1)] : (-$unsigned(reg45))) : ((reg45 ?
                          reg61 : wire39[(4'hf):(3'h5)]) ?
                      reg43 : (8'ha4))));
              reg68 <= $unsigned({$signed((reg63[(3'h4):(1'h0)] ?
                      $unsigned(wire40) : $signed(reg58))),
                  reg52});
            end
          else
            begin
              reg64 <= ((((|{wire37, reg67}) == $unsigned(wire40)) ?
                      (&(((8'h9d) ? reg56 : wire34) ?
                          $unsigned(wire39) : reg67)) : (8'hab)) ?
                  reg52[(1'h0):(1'h0)] : (8'hb1));
              reg65 <= {$signed($unsigned(wire35[(4'hc):(3'h6)]))};
            end
          reg69 <= (~^{($unsigned((wire38 ? wire36 : reg58)) ?
                  $unsigned(wire35[(3'h6):(2'h2)]) : $unsigned($signed(wire41)))});
          reg70 <= (8'haa);
        end
      else
        begin
          if ({(8'hb6)})
            begin
              reg62 <= reg62[(5'h11):(4'h8)];
              reg63 <= $unsigned(((({reg49, reg67} ?
                          (^~wire42) : ((7'h40) ~^ (8'hb4))) ?
                      $signed({(8'ha0)}) : $signed((&(8'hb5)))) ?
                  {{(&wire47), reg67}} : reg55));
              reg64 <= (8'hab);
            end
          else
            begin
              reg62 <= $unsigned(reg69[(4'h8):(1'h0)]);
              reg63 <= reg54;
              reg64 <= (&(+$unsigned($signed(reg70[(3'h5):(1'h0)]))));
              reg65 <= wire46[(2'h3):(1'h0)];
            end
        end
      reg71 <= ($unsigned($signed(reg57[(2'h2):(1'h0)])) ? reg65 : (|reg63));
    end
  assign wire72 = reg61;
  assign wire73 = {reg62[(1'h1):(1'h1)]};
  assign wire74 = $signed((($signed($signed((8'h9d))) ?
                      $signed(((8'ha1) ?
                          reg64 : reg70)) : reg70) * (reg52[(1'h0):(1'h0)] + ((reg49 ?
                      reg51 : reg65) || reg55[(3'h4):(1'h0)]))));
  always
    @(posedge clk) begin
      if ($unsigned(reg59))
        begin
          reg75 <= $unsigned($unsigned(reg45));
          reg76 <= $signed(({($unsigned(wire72) ?
                      reg45[(1'h1):(1'h1)] : reg45[(3'h7):(2'h3)])} ?
              (&reg43) : (&(^reg75[(4'h9):(1'h1)]))));
        end
      else
        begin
          reg75 <= wire36;
          if (wire74)
            begin
              reg76 <= (wire46 && {$signed(((8'ha2) <= (reg48 ?
                      (8'had) : reg50))),
                  reg57[(1'h1):(1'h0)]});
              reg77 <= reg45;
            end
          else
            begin
              reg76 <= $unsigned($unsigned(reg43));
              reg77 <= $unsigned((^~(reg45 & $signed(reg50[(1'h0):(1'h0)]))));
            end
          reg78 <= reg59[(1'h1):(1'h1)];
        end
      reg79 <= $unsigned(reg68);
      reg80 <= (wire40 ? wire34[(4'hf):(1'h1)] : reg53[(1'h1):(1'h1)]);
    end
  assign wire81 = ((wire40 ? $signed(reg67) : $signed(wire47)) ?
                      $signed(reg62) : reg63);
  assign wire82 = wire41;
  assign wire83 = $unsigned($unsigned(reg59));
  assign wire84 = wire34;
  assign wire85 = (($signed((((8'hb9) ? wire40 : (8'h9e)) ~^ reg79)) ?
                          (|(&$signed(reg51))) : (~^($unsigned(reg54) > reg51[(1'h0):(1'h0)]))) ?
                      $signed((wire34[(3'h5):(3'h4)] ?
                          reg62[(4'hb):(3'h4)] : {wire46[(3'h6):(1'h0)],
                              (reg66 ?
                                  reg79 : wire83)})) : $unsigned($unsigned((wire39[(4'h8):(3'h4)] && reg64))));
  assign wire86 = $unsigned((~&reg68));
endmodule
