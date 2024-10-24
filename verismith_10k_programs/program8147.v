module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire94;
  wire signed [(4'h8):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire26;
  wire signed [(3'h4):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  assign y = {wire94,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire9,
                 wire8,
                 wire7,
                 wire5,
                 wire4,
                 reg96,
                 reg6,
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
                 reg31,
                 reg32,
                 (1'h0)};
  assign wire4 = wire3[(4'hc):(3'h4)];
  assign wire5 = (wire3[(3'h7):(1'h0)] < wire4);
  always
    @(posedge clk) begin
      reg6 <= wire1;
    end
  assign wire7 = $signed((~wire1));
  assign wire8 = $signed({wire2, {($signed(wire4) ~^ $unsigned(wire3))}});
  assign wire9 = (wire2 ?
                     (~wire7[(5'h12):(4'ha)]) : $unsigned({$unsigned(wire7[(2'h2):(1'h1)]),
                         wire5}));
  always
    @(posedge clk) begin
      reg10 <= (+$unsigned(((^~$unsigned(wire3)) >= wire3[(3'h5):(1'h1)])));
      reg11 <= wire5;
      reg12 <= {{wire7}, wire7};
      if ($unsigned(wire2))
        begin
          reg13 <= wire5;
          reg14 <= ($unsigned($signed((|(wire1 ?
              wire1 : wire1)))) << wire0[(3'h5):(1'h1)]);
          reg15 <= ($signed(wire3[(4'h8):(2'h3)]) ~^ wire1[(2'h2):(1'h1)]);
        end
      else
        begin
          if (reg14)
            begin
              reg13 <= (wire0[(1'h1):(1'h1)] && ((~$unsigned(wire0)) == ({wire5[(3'h5):(2'h2)],
                      (reg6 ? wire2 : (8'hbb))} ?
                  ((wire1 << reg13) < (~wire3)) : wire0)));
            end
          else
            begin
              reg13 <= wire3;
              reg14 <= $signed((wire5[(3'h6):(1'h0)] ?
                  $signed(($unsigned((8'ha3)) + $signed(wire7))) : $signed($unsigned((^~reg6)))));
              reg15 <= $unsigned((((~^(wire7 + wire0)) >> reg12) < wire3[(4'h8):(2'h3)]));
            end
          reg16 <= ((+(+wire9)) + {(($unsigned(reg12) ?
                  $signed(wire3) : $unsigned((7'h41))) * $signed((reg6 ?
                  (8'hb3) : wire9)))});
          if ((^wire0))
            begin
              reg17 <= reg14;
              reg18 <= (reg15[(1'h0):(1'h0)] || {{reg14[(3'h4):(2'h3)],
                      $unsigned(wire9)}});
              reg19 <= wire0[(1'h0):(1'h0)];
            end
          else
            begin
              reg17 <= ($unsigned((reg16[(4'hc):(3'h4)] >>> reg17[(4'ha):(1'h1)])) ?
                  wire0[(3'h6):(1'h0)] : reg11);
              reg18 <= (&(!$signed($unsigned((wire0 ? reg14 : wire2)))));
            end
          if ({((($unsigned(wire3) ? $unsigned(wire3) : $signed((8'hbf))) ?
                  reg6[(4'h8):(3'h4)] : $unsigned($signed(reg15))) >= reg11)})
            begin
              reg20 <= $unsigned(reg19[(2'h2):(2'h2)]);
              reg21 <= wire3;
              reg22 <= reg17;
              reg23 <= (wire1 ^~ $unsigned(((+(reg15 ?
                  (8'ha6) : wire1)) + (~&reg16))));
              reg24 <= {wire8,
                  $unsigned($signed(({wire2, (8'hac)} ?
                      $unsigned(wire0) : wire5)))};
            end
          else
            begin
              reg20 <= {{(+$signed(reg12)), {reg24, {{reg23}}}},
                  (wire9[(3'h4):(3'h4)] && ($unsigned($unsigned(reg11)) >= {wire4}))};
            end
          reg25 <= (^($signed(wire9[(2'h2):(1'h1)]) ?
              $signed({reg24[(4'h9):(1'h1)],
                  ((8'haf) ? (8'hbc) : reg22)}) : (wire7 >> (~|((8'ha9) ?
                  reg19 : reg22)))));
        end
    end
  assign wire26 = ({$unsigned(wire1)} >>> ((reg22 ?
                      {(reg22 >>> wire8)} : (wire2[(4'hf):(1'h0)] ?
                          (^~(8'hb7)) : (!wire1))) == {wire2[(1'h1):(1'h0)]}));
  assign wire27 = {(reg19[(1'h0):(1'h0)] ?
                          reg19 : (($unsigned(reg23) ?
                                  (reg12 * wire1) : reg21[(1'h1):(1'h0)]) ?
                              ($unsigned((8'hac)) ?
                                  (reg23 ?
                                      reg11 : reg15) : reg12) : (~|reg17))),
                      ($unsigned(wire0) ~^ $unsigned((7'h44)))};
  assign wire28 = ((&{$unsigned($unsigned(wire2))}) * (~^reg19[(1'h1):(1'h0)]));
  assign wire29 = ((8'hb1) || $signed(wire7));
  assign wire30 = {{($unsigned((reg6 ^~ wire8)) - $unsigned((^(8'hb4))))},
                      $unsigned($signed((^~wire9[(2'h3):(2'h3)])))};
  always
    @(posedge clk) begin
      reg31 <= wire3;
      reg32 <= $signed($signed(((reg15 ?
              reg13[(2'h2):(2'h2)] : $signed(wire5)) ?
          reg19[(1'h1):(1'h1)] : wire3[(3'h6):(1'h0)])));
    end
  assign wire33 = wire30[(3'h6):(3'h6)];
  assign wire34 = (^reg31[(2'h2):(2'h2)]);
  assign wire35 = (~&(reg15[(2'h2):(1'h1)] ?
                      ((|((8'ha4) > reg11)) || {$signed(wire29)}) : (^$signed((^~reg18)))));
  assign wire36 = wire4[(3'h5):(2'h3)];
  assign wire37 = wire27;
  module38 #() modinst95 (wire94, clk, reg22, wire35, reg20, wire3, reg32);
  always
    @(posedge clk) begin
      reg96 <= (wire9 ?
          (&(|$unsigned(reg10[(3'h5):(1'h1)]))) : ($unsigned(wire7[(5'h14):(3'h6)]) ?
              (wire0 < (wire36 < (^wire5))) : (({reg10, (8'h9c)} ?
                  wire36 : wire1[(3'h6):(3'h5)]) || $unsigned(wire27[(4'h8):(1'h1)]))));
    end
endmodule

module module38
#(parameter param92 = (((!{((7'h41) || (8'h9c)), ((8'hbb) ^ (8'h9c))}) ? (({(8'haf)} ? ((8'hbf) ? (8'hb9) : (8'hb5)) : ((8'h9d) >= (8'ha7))) != ((~^(8'hbb)) ^ (~(7'h41)))) : (~(|(~|(8'haf))))) ? ((((~|(8'haf)) <= ((8'ha8) ^~ (8'ha5))) >= (8'hb5)) ? (!(((7'h41) ? (8'hb0) : (8'hab)) ? ((8'ha2) * (7'h43)) : ((8'hab) * (8'hbc)))) : ((((7'h40) ^ (8'hb0)) < ((8'hac) ~^ (8'hb4))) ? ((~^(8'hbe)) <= ((8'hb4) ? (8'hb2) : (7'h44))) : ({(7'h43), (8'h9f)} | {(8'hb7)}))) : (7'h43)), 
parameter param93 = ({((param92 < (param92 ? (8'hbc) : param92)) ? {(param92 ? (8'ha4) : param92)} : param92)} ? param92 : ((param92 ? (~^param92) : param92) ? (((param92 ? param92 : param92) ? (param92 ? param92 : param92) : (param92 >> param92)) - ((param92 ? param92 : (8'h9c)) > {(8'ha8)})) : param92)))
(y, clk, wire39, wire40, wire41, wire42, wire43);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire39;
  input wire signed [(4'h9):(1'h0)] wire40;
  input wire [(4'hf):(1'h0)] wire41;
  input wire signed [(5'h14):(1'h0)] wire42;
  input wire [(5'h14):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire91;
  wire [(4'hf):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(3'h7):(1'h0)] wire89;
  assign y = {wire91,
                 wire44,
                 wire45,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire50,
                 wire89,
                 (1'h0)};
  assign wire44 = $unsigned(wire43);
  assign wire45 = (^~$unsigned((~(wire39[(2'h2):(1'h1)] <= wire42[(4'hc):(2'h3)]))));
  assign wire46 = ($signed(((|wire42) < $signed((+wire44)))) ?
                      $signed($signed(wire39[(1'h1):(1'h0)])) : $unsigned((|wire43)));
  assign wire47 = (&$unsigned(((wire43[(1'h0):(1'h0)] ? wire39 : {(8'hb3)}) ?
                      (~&$signed(wire39)) : $unsigned((&(8'hb5))))));
  assign wire48 = $unsigned(wire45[(2'h2):(1'h0)]);
  assign wire49 = wire46[(4'h9):(4'h9)];
  assign wire50 = $signed((+(wire45 ?
                      wire47[(2'h3):(1'h0)] : $signed($signed(wire43)))));
  module51 #() modinst90 (.clk(clk), .wire54(wire42), .y(wire89), .wire55(wire50), .wire53(wire44), .wire52(wire43), .wire56(wire39));
  assign wire91 = (wire49[(3'h6):(2'h3)] ?
                      $unsigned({wire43[(5'h12):(3'h4)],
                          (8'ha1)}) : wire89[(3'h5):(1'h0)]);
endmodule

module module51
#(parameter param88 = (+((((8'h9e) ? (8'h9d) : {(8'hbc), (8'had)}) || ({(8'ha5)} ? (7'h41) : ((8'hb2) ? (8'hbf) : (8'hbe)))) ^~ ((~&((8'hb6) ? (7'h43) : (8'hbd))) ? (+(+(8'ha6))) : {((7'h41) ~^ (8'ha3))}))))
(y, clk, wire56, wire55, wire54, wire53, wire52);
  output wire [(32'h166):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire56;
  input wire [(5'h15):(1'h0)] wire55;
  input wire signed [(3'h6):(1'h0)] wire54;
  input wire [(4'he):(1'h0)] wire53;
  input wire [(5'h14):(1'h0)] wire52;
  wire signed [(2'h2):(1'h0)] wire87;
  wire signed [(4'he):(1'h0)] wire86;
  wire [(5'h12):(1'h0)] wire85;
  wire [(2'h2):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire79;
  wire signed [(4'hf):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire76;
  wire signed [(4'hf):(1'h0)] wire73;
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire73,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg75,
                 reg74,
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
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire53[(3'h5):(3'h5)])
        begin
          reg57 <= wire55;
          if (wire52)
            begin
              reg58 <= ($signed($signed($unsigned((wire53 ?
                      wire52 : wire54)))) ?
                  wire56 : $unsigned(wire53));
            end
          else
            begin
              reg58 <= wire53;
              reg59 <= ($signed(reg58) ?
                  $signed(((8'h9d) - wire52[(5'h10):(1'h1)])) : (((wire52[(5'h13):(4'h9)] >>> (~&wire56)) ?
                          reg58[(3'h6):(2'h3)] : $unsigned(wire53[(3'h7):(3'h6)])) ?
                      (-(~&reg57)) : wire55));
              reg60 <= $unsigned(wire53);
              reg61 <= (+reg58);
            end
          if (($unsigned(wire53[(1'h1):(1'h0)]) ?
              $unsigned((((reg61 ^~ wire55) ?
                  $unsigned(reg59) : $signed((8'h9e))) * (~^(wire55 ?
                  (8'h9d) : (7'h43))))) : wire55[(5'h14):(1'h1)]))
            begin
              reg62 <= (~{{$unsigned({wire54}),
                      ((reg59 ? wire55 : (8'h9d)) <= $signed(reg61))}});
              reg63 <= $signed(reg57);
              reg64 <= reg59;
            end
          else
            begin
              reg62 <= reg58[(2'h2):(2'h2)];
              reg63 <= reg60[(2'h2):(1'h1)];
              reg64 <= $unsigned(reg57);
            end
        end
      else
        begin
          if ($unsigned((reg64[(1'h0):(1'h0)] ?
              reg64[(2'h3):(2'h2)] : {wire52[(5'h12):(4'h8)]})))
            begin
              reg57 <= $unsigned($signed(wire52[(5'h10):(2'h3)]));
              reg58 <= {$signed(wire56), $signed(reg59[(5'h14):(4'ha)])};
            end
          else
            begin
              reg57 <= {(&$unsigned((^~(reg57 <<< wire53))))};
              reg58 <= (($unsigned(((wire55 > reg63) == $signed(reg62))) ?
                  reg62 : ({$signed(wire54)} && {$signed(reg59),
                      (8'h9c)})) >= $unsigned($signed({{wire56}, reg57})));
              reg59 <= (^~$signed($unsigned(((!(8'h9e)) ^~ $signed(reg60)))));
            end
          reg60 <= $unsigned(((~|(reg62[(5'h14):(5'h13)] >= reg60)) < $unsigned($unsigned($signed(wire55)))));
          reg61 <= (($signed({reg62[(4'hf):(4'ha)], $signed(wire56)}) ?
                  reg60 : (wire54[(1'h0):(1'h0)] ?
                      $unsigned($unsigned((8'hbf))) : $signed((reg63 ?
                          (8'haf) : wire55)))) ?
              reg64 : reg61);
          reg62 <= $signed(wire53);
        end
      reg65 <= (~^reg59[(4'hd):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg66 <= wire55[(3'h6):(1'h0)];
      if (((reg62 ?
          $signed((^~reg62[(4'h8):(3'h6)])) : reg65) == $unsigned(reg60)))
        begin
          reg67 <= reg65[(4'h9):(4'h9)];
        end
      else
        begin
          reg67 <= (8'ha0);
          if ({$unsigned(wire52), reg60})
            begin
              reg68 <= $signed((^($unsigned($unsigned((8'hae))) ?
                  ((^~wire52) ? reg59 : (wire54 | reg57)) : (reg59 ?
                      $signed(reg58) : (wire53 ? (8'hbc) : reg60)))));
              reg69 <= wire52[(4'hc):(2'h3)];
              reg70 <= reg64[(2'h3):(2'h2)];
              reg71 <= $unsigned(($signed(($signed(reg63) ?
                      (reg69 == reg63) : reg65[(2'h2):(2'h2)])) ?
                  $unsigned(({(8'ha6), (8'hb5)} ?
                      $unsigned(wire54) : (^wire53))) : $signed($signed((wire53 == reg62)))));
              reg72 <= reg62;
            end
          else
            begin
              reg68 <= reg62[(2'h3):(1'h1)];
              reg69 <= (&((-(wire56[(2'h2):(2'h2)] ^~ $signed(reg62))) >>> reg58[(2'h2):(1'h1)]));
              reg70 <= ($signed(((reg63 ?
                      (reg64 | reg62) : (wire52 <<< reg68)) ?
                  (^reg65[(4'h9):(1'h0)]) : (|{reg69,
                      (8'h9f)}))) >> $unsigned(((reg62 ^~ ((8'h9e) ?
                      wire53 : wire52)) ?
                  (+reg72[(3'h6):(3'h6)]) : ((~wire54) ?
                      $unsigned(reg57) : $signed(reg69)))));
              reg71 <= reg65[(4'h8):(1'h0)];
            end
        end
    end
  assign wire73 = $unsigned(($signed(reg66) & ($unsigned((!reg71)) ?
                      (8'ha8) : (^(^reg71)))));
  always
    @(posedge clk) begin
      reg74 <= ($signed(reg62) >> {$signed(wire55)});
      reg75 <= ($signed({{(wire54 || reg69)},
          wire56}) <<< $unsigned($unsigned({(reg68 ? (8'h9f) : reg70),
          wire53[(3'h7):(1'h0)]})));
    end
  assign wire76 = $signed((8'ha8));
  assign wire77 = (wire73 >>> ({$signed((reg67 ? reg75 : reg71))} ?
                      (reg67 ?
                          reg65 : ($signed((8'ha7)) ~^ (reg62 ^~ wire73))) : {{(wire56 ?
                                  wire56 : reg57),
                              (^~(7'h44))},
                          $signed((wire55 ? wire52 : reg59))}));
  assign wire78 = (&wire76[(4'h9):(3'h6)]);
  assign wire79 = (~reg58[(3'h6):(3'h6)]);
  always
    @(posedge clk) begin
      reg80 <= ($unsigned(wire78[(2'h2):(1'h0)]) ?
          (~|((reg66 ?
              (wire56 ?
                  wire54 : wire76) : reg66[(1'h1):(1'h1)]) && $signed((wire52 ~^ reg70)))) : (&$unsigned((~$signed(reg58)))));
      reg81 <= (wire54[(2'h2):(2'h2)] & $signed(($signed(wire77) >>> ($signed(reg75) & (reg60 ?
          (8'hb8) : wire78)))));
      reg82 <= ($unsigned((((~|wire54) ? $signed(reg57) : $signed(reg65)) ?
              $signed((wire53 ^ reg59)) : $signed(((8'had) ?
                  wire76 : (8'hb7))))) ?
          $signed($unsigned(wire73[(4'he):(4'hb)])) : ({$signed((reg57 >= reg60))} ?
              ($signed((wire76 ?
                  wire54 : reg71)) << $signed((&reg75))) : {$unsigned($unsigned(reg80))}));
      reg83 <= reg69;
    end
  assign wire84 = ($signed(wire55) ^~ {wire73[(3'h6):(1'h1)],
                      $signed($signed((~reg82)))});
  assign wire85 = $unsigned((7'h41));
  assign wire86 = (-$signed({reg75[(1'h0):(1'h0)]}));
  assign wire87 = (wire76 ?
                      reg75 : {{{$unsigned(reg63)},
                              ((wire78 ^~ reg82) == {reg63, reg82})},
                          (((reg82 ? reg64 : wire78) ?
                              reg71[(4'hf):(4'hc)] : (reg65 <= (8'ha7))) < ((wire77 ?
                              (8'hbf) : reg63) >> reg62[(4'hb):(2'h3)]))});
endmodule
