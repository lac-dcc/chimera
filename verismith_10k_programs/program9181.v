module top
#(parameter param111 = (!(8'hb8)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h221):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire110;
  wire signed [(4'h9):(1'h0)] wire109;
  wire [(4'h8):(1'h0)] wire108;
  wire [(4'hf):(1'h0)] wire107;
  wire signed [(4'hb):(1'h0)] wire106;
  wire [(3'h4):(1'h0)] wire105;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire103;
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire5,
                 wire6,
                 wire7,
                 wire27,
                 wire28,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire103,
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
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 (1'h0)};
  assign wire5 = wire0[(3'h6):(2'h3)];
  assign wire6 = wire0[(3'h7):(2'h2)];
  assign wire7 = (!$signed($signed($unsigned((wire3 ? wire4 : wire4)))));
  always
    @(posedge clk) begin
      if ((8'hb7))
        begin
          reg8 <= wire2;
          if (($unsigned(((|wire0[(4'h8):(3'h7)]) * (^~wire1))) ~^ (!wire2[(4'hd):(1'h1)])))
            begin
              reg9 <= {($unsigned($signed(wire4)) ?
                      (8'hb5) : $signed(wire2[(5'h10):(3'h4)]))};
              reg10 <= reg8;
              reg11 <= (~(((~&(reg8 && (8'h9f))) ^~ ((^wire7) * $unsigned(reg9))) ?
                  $unsigned($signed((wire5 >> (8'hac)))) : {((-wire2) ^ (wire7 || wire4)),
                      (~^(wire4 != (8'h9f)))}));
              reg12 <= (wire5 ? reg10 : $signed((&wire4[(1'h1):(1'h1)])));
              reg13 <= $unsigned(wire2);
            end
          else
            begin
              reg9 <= $signed($signed((|(+(~&wire5)))));
              reg10 <= $signed((^reg8[(4'hb):(4'hb)]));
            end
          if (wire4[(2'h3):(1'h0)])
            begin
              reg14 <= ($unsigned({($unsigned(reg12) ?
                      wire6[(1'h1):(1'h1)] : {wire3})}) * {$signed(($unsigned((7'h42)) << $signed(reg8))),
                  reg8[(4'hb):(4'ha)]});
              reg15 <= ({reg11,
                      {((reg10 < wire5) ? (7'h44) : (wire3 ? reg11 : wire1))}} ?
                  ((((reg12 ? reg11 : (8'ha5)) || $unsigned(reg14)) ?
                          reg10 : ($signed(wire6) ?
                              wire0[(4'h9):(3'h7)] : {wire7, wire7})) ?
                      (wire5[(2'h2):(1'h0)] ^ ($unsigned(wire3) ?
                          {wire0,
                              wire1} : $signed(reg12))) : (wire6 + $signed($signed(wire2)))) : $unsigned(($unsigned((wire7 >> wire1)) >>> {wire4})));
              reg16 <= {((($unsigned(wire7) ?
                          $signed(wire6) : wire6[(3'h6):(3'h4)]) ?
                      (-(wire7 >= reg11)) : {reg11[(2'h3):(1'h1)],
                          (!wire0)}) ^~ ($signed($unsigned((7'h42))) ?
                      (+(reg15 ? (8'h9d) : wire2)) : $unsigned((reg9 ?
                          (8'h9e) : wire6))))};
              reg17 <= (wire3 ?
                  (~^$signed(wire5)) : $signed({{(^wire4), (~&wire0)}}));
            end
          else
            begin
              reg14 <= ($unsigned(reg10[(2'h3):(1'h1)]) + wire6);
            end
          if ($signed($signed(($unsigned(wire3) ?
              $signed(wire2[(4'hc):(4'hc)]) : $signed(reg15[(4'h8):(3'h5)])))))
            begin
              reg18 <= wire7[(4'hc):(1'h0)];
              reg19 <= (~|(|$unsigned(($signed(reg15) ?
                  (&(8'hb4)) : (reg14 & (8'h9d))))));
            end
          else
            begin
              reg18 <= $unsigned($unsigned(wire1));
              reg19 <= $signed((reg14 > (~((wire4 < reg14) ^~ {reg18}))));
              reg20 <= ({$signed($unsigned(reg12)), $signed((&(^~reg16)))} ?
                  (reg19[(4'ha):(1'h0)] == (7'h43)) : (~|((~|(reg12 <= reg9)) - $signed($unsigned(reg13)))));
              reg21 <= (((reg16[(4'he):(3'h6)] ?
                          ($signed(reg12) ^~ $unsigned(wire0)) : ((wire7 ?
                                  wire2 : (8'hac)) ?
                              (reg17 ? reg18 : reg9) : {(8'h9e)})) ?
                      ((^~(reg14 ?
                          reg20 : (8'hb5))) | ((wire4 ^ wire7) <<< $signed(reg15))) : ($signed(wire1[(1'h0):(1'h0)]) >>> (|reg8[(4'hb):(3'h5)]))) ?
                  (~((wire0[(4'h9):(3'h7)] ?
                          ((8'ha7) | (8'hbe)) : $signed(wire2)) ?
                      reg17 : wire5[(1'h0):(1'h0)])) : ($unsigned(((reg12 | (8'h9c)) ?
                          $signed(wire0) : wire5[(1'h0):(1'h0)])) ?
                      wire3 : reg9));
            end
          reg22 <= $signed((($signed(reg20) | ($unsigned((8'h9c)) ~^ $unsigned((8'hb8)))) ?
              (!((~&wire0) ? $unsigned(reg19) : reg13)) : reg9));
        end
      else
        begin
          reg8 <= reg12;
          reg9 <= reg14;
          reg10 <= (|$signed(($unsigned((wire0 ~^ wire1)) ?
              $signed($signed(reg12)) : wire7)));
          if ((~|($signed($signed(wire7)) ?
              (^reg19) : $signed(($unsigned(reg11) ?
                  (wire7 ? reg15 : reg11) : $unsigned(wire6))))))
            begin
              reg11 <= (-((^~reg10[(1'h1):(1'h0)]) * ($unsigned((^~reg20)) ?
                  reg11 : reg10)));
              reg12 <= ((~($signed((|reg9)) > reg15)) ?
                  ($unsigned({(reg14 ^ wire1),
                      ((7'h43) ?
                          reg13 : wire2)}) && (~|$signed(wire7))) : $signed((-reg22[(4'hc):(1'h1)])));
            end
          else
            begin
              reg11 <= reg19[(2'h3):(2'h2)];
              reg12 <= $signed(((reg9 ? $signed(reg10) : (+(&reg20))) ?
                  (($signed(reg15) & $unsigned(reg10)) ?
                      ({wire6} ?
                          {reg11,
                              (8'hb3)} : (reg10 != reg18)) : (!$signed((7'h44)))) : (8'ha4)));
            end
        end
      reg23 <= {(8'hb6), (reg16[(3'h4):(2'h2)] ? reg13 : $unsigned(reg9))};
      if ((&$unsigned(reg9)))
        begin
          if (wire2)
            begin
              reg24 <= $signed((-(8'hb2)));
              reg25 <= {(reg12 ? reg23 : wire3[(2'h2):(2'h2)]),
                  ((^$signed({wire7})) & (~^(^$signed(reg11))))};
            end
          else
            begin
              reg24 <= $unsigned(($signed(reg25) || wire1[(2'h3):(1'h0)]));
              reg25 <= reg21[(1'h0):(1'h0)];
              reg26 <= $signed({{$unsigned(reg10), $signed((8'hb9))}});
            end
        end
      else
        begin
          reg24 <= (^wire0[(4'h8):(2'h3)]);
          reg25 <= (($signed((~^reg21)) ?
              (8'ha6) : {reg18}) != (~$signed((+(reg13 ? (8'h9d) : reg25)))));
          reg26 <= wire6;
        end
    end
  assign wire27 = reg18;
  assign wire28 = reg8[(4'hb):(4'h8)];
  always
    @(posedge clk) begin
      reg29 <= ((&$signed({$unsigned(reg25),
          (!reg17)})) * {((~|reg22[(2'h2):(2'h2)]) < $unsigned(reg11[(3'h4):(1'h0)]))});
      reg30 <= $signed($signed($signed($unsigned(((8'ha4) <<< reg22)))));
      reg31 <= $signed((reg12[(1'h0):(1'h0)] ?
          {reg29[(3'h4):(2'h3)]} : $signed(((reg19 && reg15) ?
              wire1[(4'he):(4'hc)] : (~|wire28)))));
      reg32 <= $unsigned($unsigned(($signed((wire28 > reg22)) == (!(8'ha1)))));
    end
  always
    @(posedge clk) begin
      reg33 <= $signed(((~&(8'hba)) ?
          reg25[(1'h0):(1'h0)] : ({$unsigned(reg14)} ?
              (reg22[(5'h12):(5'h11)] >= reg25[(3'h6):(2'h3)]) : wire3)));
      reg34 <= {reg21};
    end
  assign wire35 = $unsigned(reg13);
  assign wire36 = (~^($signed({((8'hb7) + wire35), (reg20 ~^ reg12)}) ?
                      (reg9[(4'ha):(2'h2)] >>> reg21) : reg20[(2'h3):(1'h1)]));
  assign wire37 = $signed((~&reg8));
  assign wire38 = $unsigned((reg11 ?
                      reg13[(3'h5):(1'h1)] : $unsigned(reg12[(1'h0):(1'h0)])));
  assign wire39 = ((&$signed((&$signed(reg25)))) & $signed((+((^wire38) & (8'hab)))));
  assign wire40 = ((($signed(reg31) ? (^~((8'ha4) * wire6)) : wire38) ?
                      ($signed(wire28[(5'h11):(4'ha)]) ?
                          ($unsigned(reg33) >>> {wire36}) : $unsigned($unsigned(reg32))) : {reg29[(3'h7):(1'h0)],
                          $signed(wire37)}) ^~ reg33[(2'h2):(1'h0)]);
  module41 #() modinst104 (.clk(clk), .wire44(reg17), .wire45(reg32), .wire42(reg19), .y(wire103), .wire43(wire27));
  assign wire105 = (reg8[(2'h3):(1'h1)] ?
                       (wire7[(1'h0):(1'h0)] ?
                           (reg18 == (((8'hbf) <= reg16) > (reg33 ?
                               reg23 : wire40))) : reg32[(3'h6):(3'h6)]) : reg31[(4'h8):(3'h7)]);
  assign wire106 = $unsigned(wire37);
  assign wire107 = (($signed((~&(reg29 != reg33))) ?
                           $signed(((wire27 ? reg10 : (8'ha5)) ?
                               $unsigned((8'h9c)) : reg8[(1'h0):(1'h0)])) : $unsigned(reg23[(2'h3):(1'h0)])) ?
                       wire27[(1'h0):(1'h0)] : (^(((reg8 >>> wire39) == reg24[(3'h7):(3'h6)]) ?
                           (|(reg23 >>> wire27)) : $unsigned((8'ha7)))));
  assign wire108 = reg32;
  assign wire109 = reg25;
  assign wire110 = $unsigned((+((wire6[(3'h7):(2'h2)] <= {wire109}) ?
                       $signed(wire7[(3'h6):(3'h4)]) : $signed((~&reg22)))));
endmodule

module module41
#(parameter param102 = (7'h40))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire45;
  input wire signed [(4'hb):(1'h0)] wire44;
  input wire [(5'h15):(1'h0)] wire43;
  input wire signed [(5'h11):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire89;
  wire [(4'hd):(1'h0)] wire88;
  wire signed [(4'hb):(1'h0)] wire87;
  wire [(5'h11):(1'h0)] wire86;
  wire signed [(4'hc):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire84;
  wire [(3'h7):(1'h0)] wire83;
  wire signed [(5'h12):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire78;
  wire signed [(5'h14):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire46;
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg97 = (1'h0);
  reg [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg95 = (1'h0);
  reg [(4'ha):(1'h0)] reg94 = (1'h0);
  reg [(3'h5):(1'h0)] reg93 = (1'h0);
  reg [(3'h6):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire78,
                 wire47,
                 wire46,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 (1'h0)};
  assign wire46 = wire43;
  assign wire47 = (&(+($unsigned($signed(wire42)) || {(~wire45),
                      $signed((8'hba))})));
  module48 #() modinst79 (wire78, clk, wire47, wire42, wire43, wire46);
  assign wire80 = (wire46 == $unsigned(((wire43[(5'h12):(1'h0)] & {wire43,
                          (8'hab)}) ?
                      ((wire47 + wire47) ?
                          $unsigned((8'hb5)) : $unsigned(wire45)) : (&((7'h40) ?
                          wire45 : wire44)))));
  assign wire81 = {(((8'ha3) <= wire43[(4'hb):(4'h8)]) ~^ ($unsigned($signed(wire45)) ?
                          ((~&wire47) ?
                              ((8'hb8) ?
                                  wire45 : (8'had)) : $signed((8'hb3))) : (|$signed(wire46)))),
                      (^(8'hba))};
  assign wire82 = $unsigned(wire46[(3'h4):(2'h2)]);
  assign wire83 = {($signed((^$unsigned((8'ha1)))) ?
                          wire78 : (((wire78 ? (7'h41) : wire78) ?
                                  (wire43 != wire47) : $signed((8'hbb))) ?
                              $signed({wire81}) : $signed(wire44[(4'h9):(2'h3)]))),
                      ($signed(((wire44 != wire44) | (!wire47))) ?
                          ($signed($signed(wire43)) + $signed($signed(wire45))) : wire47)};
  assign wire84 = $unsigned(wire43[(1'h0):(1'h0)]);
  assign wire85 = ($unsigned(wire47[(3'h7):(3'h4)]) >= {(^~wire44[(4'h8):(2'h3)])});
  assign wire86 = {{{$unsigned(wire82),
                              ((~&wire45) ?
                                  $unsigned(wire84) : $signed(wire83))}},
                      ((~|{$unsigned(wire80)}) ? (^~wire45) : (^~(8'hb0)))};
  assign wire87 = ($unsigned({wire47}) > $unsigned(({(wire84 << wire85)} >>> $signed((8'h9f)))));
  assign wire88 = wire46[(3'h6):(2'h2)];
  assign wire89 = $unsigned(($unsigned(($unsigned((8'hac)) & $unsigned(wire78))) ~^ wire78[(3'h4):(1'h1)]));
  always
    @(posedge clk) begin
      reg90 <= ($unsigned($signed(wire88)) * {(+((wire89 || wire82) < (+wire89))),
          {(^~wire43)}});
      reg91 <= (wire87 && wire88[(1'h0):(1'h0)]);
      if ($unsigned((reg91[(1'h0):(1'h0)] < wire88)))
        begin
          reg92 <= $unsigned((|(wire86[(5'h11):(4'hd)] <= $signed((wire44 ~^ wire85)))));
        end
      else
        begin
          reg92 <= {wire42,
              {reg91[(1'h1):(1'h0)], (^~{(wire87 ~^ wire82), (^~(8'hbe))})}};
          reg93 <= reg90;
          if ({wire87[(1'h0):(1'h0)]})
            begin
              reg94 <= $signed(((wire86 ?
                      wire43[(4'hf):(4'ha)] : {(wire42 ? reg92 : wire85)}) ?
                  $signed(wire45[(1'h1):(1'h0)]) : wire84[(1'h0):(1'h0)]));
              reg95 <= (($unsigned((8'hbf)) ?
                      (8'hac) : (-$signed($signed(wire82)))) ?
                  ($unsigned(reg90) ?
                      wire47 : ((~&$signed(wire85)) ?
                          ((reg94 && wire46) ^ $unsigned(wire78)) : $signed($signed(reg90)))) : $signed(wire80[(3'h6):(1'h1)]));
              reg96 <= (wire80[(3'h6):(1'h0)] ?
                  $signed(($unsigned($unsigned(reg93)) >= (8'haf))) : (($unsigned((wire81 != (8'hae))) * ($unsigned(reg91) ?
                          (~&reg91) : (wire47 ? wire46 : reg95))) ?
                      (((~|reg93) >= wire89[(1'h1):(1'h1)]) ?
                          $unsigned($unsigned(wire87)) : (wire85[(4'h8):(3'h6)] < $signed(wire89))) : ({(reg92 - wire47),
                              (wire87 <= reg92)} ?
                          (~|$unsigned((8'hae))) : wire88[(4'hc):(4'hb)])));
              reg97 <= (!(&wire45));
            end
          else
            begin
              reg94 <= (8'hac);
              reg95 <= (wire78[(2'h2):(1'h1)] ?
                  wire47 : ({(wire89 ? {wire83, (8'haf)} : (~wire44)),
                      ($unsigned(reg95) >>> (8'ha2))} >= wire84));
              reg96 <= $signed(wire44);
              reg97 <= $unsigned(wire85[(4'h8):(3'h5)]);
              reg98 <= (^(^((8'hac) ?
                  ({wire42} || wire86[(3'h4):(2'h3)]) : $signed(wire83[(2'h3):(2'h2)]))));
            end
          reg99 <= ((8'ha8) - ($signed(($unsigned(wire78) || reg96[(2'h2):(1'h1)])) ?
              wire87[(3'h6):(3'h4)] : $signed(reg90[(1'h0):(1'h0)])));
          reg100 <= ((|(wire87[(4'h9):(4'h8)] ?
                  reg99[(1'h0):(1'h0)] : (|(wire47 ? reg98 : reg99)))) ?
              $unsigned($signed(((wire47 + reg97) >= $signed(wire89)))) : ((reg99 ?
                      (&wire85[(3'h5):(2'h3)]) : ((wire47 ? (8'hb1) : reg92) ?
                          (wire78 ? reg93 : wire44) : $signed(wire89))) ?
                  $signed(wire81[(1'h0):(1'h0)]) : {wire89[(1'h1):(1'h0)],
                      ($unsigned(wire83) ?
                          (wire84 + wire88) : $unsigned((8'hb4)))}));
        end
      reg101 <= $unsigned(reg99);
    end
endmodule

module module48
#(parameter param77 = (((&{((8'hbc) ? (8'ha1) : (8'h9d))}) <<< (^(((7'h43) >= (8'hb2)) & {(7'h44), (7'h43)}))) <<< (((((8'hb6) * (8'hb5)) && (~&(8'hbe))) ? (((8'hae) >> (8'hb8)) ? (~&(8'ha1)) : ((8'ha2) == (8'ha7))) : (((7'h44) && (8'hb6)) ? ((7'h40) ? (8'hac) : (8'ha6)) : (~^(7'h42)))) ? (!(((8'hb0) + (8'hbb)) ? ((8'hb6) ? (7'h41) : (8'ha8)) : ((8'haa) * (8'hba)))) : (^({(8'hb3), (8'hb4)} ? ((8'ha4) <= (8'hab)) : ((8'haa) ? (8'hb7) : (8'hb0)))))))
(y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire52;
  input wire [(4'hd):(1'h0)] wire51;
  input wire signed [(3'h6):(1'h0)] wire50;
  input wire [(4'ha):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire76;
  wire signed [(3'h4):(1'h0)] wire75;
  wire signed [(4'h8):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire72;
  wire [(5'h10):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire69;
  wire signed [(3'h7):(1'h0)] wire68;
  wire [(2'h2):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire65;
  wire [(2'h3):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire53;
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire61,
                 wire60,
                 wire54,
                 wire53,
                 reg63,
                 reg62,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire53 = (+((wire50[(2'h3):(2'h2)] == ((wire52 | wire52) >= wire51)) & $signed(($signed((8'ha3)) - wire50))));
  assign wire54 = {($unsigned($unsigned(wire51[(3'h7):(1'h1)])) ?
                          (wire53[(2'h2):(1'h1)] - $signed((^wire51))) : (8'hac)),
                      $unsigned($signed($unsigned($unsigned(wire49))))};
  always
    @(posedge clk) begin
      reg55 <= (wire51 ?
          ($unsigned(wire54) ?
              (wire50[(3'h4):(2'h2)] ?
                  wire51 : $unsigned($unsigned((8'hbd)))) : {$signed((~^wire51)),
                  $signed($signed(wire54))}) : (wire52[(1'h1):(1'h0)] & wire52));
      reg56 <= reg55;
      reg57 <= $unsigned((wire54 ?
          wire52[(1'h0):(1'h0)] : {wire54[(1'h1):(1'h0)]}));
      reg58 <= ((((&(+wire54)) * reg55) ^ (^~$unsigned($unsigned(reg55)))) ?
          $unsigned((wire50[(2'h3):(1'h0)] ?
              (^wire51[(3'h4):(1'h1)]) : {{wire52, reg55}})) : ((8'hbb) ?
              wire50 : $signed(((!wire49) <= (wire50 ? reg55 : wire51)))));
      reg59 <= {$signed($signed(wire50[(1'h1):(1'h0)])), wire51[(4'h9):(1'h1)]};
    end
  assign wire60 = reg57[(2'h2):(2'h2)];
  assign wire61 = wire51[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg62 <= reg56;
      reg63 <= $signed(((wire60[(5'h11):(1'h0)] ?
              reg58 : {wire52[(2'h2):(1'h1)]}) ?
          $signed($unsigned({wire49, reg62})) : ((&(^reg56)) ?
              $signed($signed(wire51)) : wire50[(2'h2):(1'h0)])));
    end
  assign wire64 = reg58;
  assign wire65 = $unsigned($signed(((wire52[(1'h0):(1'h0)] ?
                      $signed(wire52) : reg59) >> $unsigned($unsigned(reg56)))));
  assign wire66 = (((-$signed((reg57 <<< wire49))) ?
                      (&$unsigned((wire64 ?
                          wire51 : (8'hab)))) : $unsigned((~wire65))) * wire50[(2'h2):(2'h2)]);
  assign wire67 = (^wire50);
  assign wire68 = $signed((($unsigned(reg55) || $unsigned($unsigned(wire49))) ?
                      ((7'h41) <= {(^~reg55),
                          $unsigned(wire65)}) : ((^~(!wire52)) ?
                          ((wire49 ?
                              wire51 : wire60) | reg55[(3'h7):(1'h1)]) : ($unsigned(wire61) ?
                              $signed((8'h9e)) : (8'hb8)))));
  assign wire69 = (~|{(((reg59 ? (8'hbb) : reg55) ? (8'hbd) : (!reg63)) ?
                          $signed($unsigned(wire66)) : ($signed(wire68) ?
                              ((8'haa) ^~ wire61) : $unsigned((8'hbc))))});
  assign wire70 = $unsigned($unsigned({$unsigned(wire50)}));
  assign wire71 = wire66[(2'h3):(1'h1)];
  assign wire72 = $signed($unsigned(((|$unsigned(wire54)) <= wire69[(3'h6):(3'h6)])));
  assign wire73 = wire72;
  assign wire74 = ((^wire61[(5'h11):(4'ha)]) ?
                      wire64[(2'h2):(2'h2)] : $signed($signed(wire69)));
  assign wire75 = (wire61 ?
                      reg57[(2'h3):(1'h1)] : (wire66 ?
                          (($signed((7'h42)) ?
                              (wire68 != wire61) : reg59[(5'h12):(1'h0)]) <= $unsigned(wire50)) : wire60));
  assign wire76 = wire68[(2'h2):(1'h0)];
endmodule
