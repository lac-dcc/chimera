module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1fe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire146;
  wire [(3'h7):(1'h0)] wire145;
  wire signed [(4'hb):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire143;
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  assign y = {wire146,
                 wire145,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire40,
                 wire143,
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
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 (1'h0)};
  assign wire5 = wire3[(1'h1):(1'h0)];
  assign wire6 = (8'hb0);
  assign wire7 = (wire3[(2'h2):(1'h0)] && $unsigned((-(wire3[(2'h2):(2'h2)] ?
                     wire5[(3'h5):(2'h2)] : $unsigned(wire0)))));
  assign wire8 = (8'ha2);
  assign wire9 = wire5[(3'h4):(2'h2)];
  assign wire10 = wire3[(1'h1):(1'h0)];
  assign wire11 = (wire10 ?
                      wire1 : (({$unsigned((8'hbd)), $unsigned(wire7)} ?
                          wire6 : $signed((wire4 ?
                              wire5 : (8'hb2)))) && ($unsigned({wire10,
                          wire9}) + {wire2[(2'h3):(1'h1)],
                          ((8'h9d) && (7'h42))})));
  always
    @(posedge clk) begin
      if (wire9[(1'h1):(1'h1)])
        begin
          reg12 <= ($signed(wire2) == ((wire3[(2'h2):(1'h0)] << $signed(wire6[(3'h6):(3'h5)])) ?
              wire0[(4'h8):(2'h3)] : ($signed(((8'hb4) ?
                  wire8 : wire3)) <<< wire6)));
          if ($signed(wire1))
            begin
              reg13 <= ((&(8'ha2)) >= (((^~$signed(wire3)) ?
                      $unsigned((~wire10)) : $signed($signed(wire4))) ?
                  wire11[(2'h2):(1'h0)] : ((^~(~|(8'hb9))) ?
                      wire5[(4'ha):(3'h5)] : $unsigned(wire4[(4'hd):(1'h1)]))));
            end
          else
            begin
              reg13 <= (-$unsigned(((-((8'hbc) ? wire5 : wire10)) ?
                  $signed($signed(wire7)) : $unsigned((wire0 == wire4)))));
              reg14 <= ((|$signed($signed($unsigned(wire10)))) || $unsigned($unsigned((~^$signed(wire2)))));
              reg15 <= (&(((wire9 ? wire4[(1'h0):(1'h0)] : (wire5 ^~ wire0)) ?
                  ({wire8,
                      wire6} ~^ (~^reg13)) : (&wire5)) * wire5[(3'h6):(1'h0)]));
            end
          reg16 <= ($signed({(wire1 ? (8'hb7) : (reg12 ? wire7 : reg13))}) ?
              (8'hac) : $unsigned(({wire9} ?
                  wire11[(2'h3):(1'h0)] : $unsigned($unsigned(wire7)))));
        end
      else
        begin
          reg12 <= wire1;
          if ($unsigned((-($signed(reg13) >= reg16))))
            begin
              reg13 <= $unsigned((!$unsigned((&reg12))));
              reg14 <= $unsigned((~&wire6));
              reg15 <= wire0;
              reg16 <= {reg15[(2'h2):(1'h0)], reg13};
              reg17 <= ($unsigned((wire10[(4'he):(3'h4)] >>> $signed($signed((8'h9c))))) ?
                  wire1[(2'h3):(2'h2)] : reg12[(1'h0):(1'h0)]);
            end
          else
            begin
              reg13 <= (8'ha9);
              reg14 <= (reg17[(3'h5):(3'h5)] - $signed((|{{(8'hae)},
                  $signed(wire4)})));
              reg15 <= (~&($unsigned(wire11[(1'h0):(1'h0)]) ?
                  reg13[(3'h6):(2'h3)] : $unsigned($signed(wire11))));
              reg16 <= (($unsigned((8'ha2)) ?
                  $unsigned((wire1[(1'h0):(1'h0)] >>> (~wire6))) : $signed(({wire2} >= wire2[(3'h5):(3'h5)]))) << wire1);
            end
          reg18 <= $signed(($unsigned($signed(wire5)) <= {wire8,
              wire10[(2'h2):(2'h2)]}));
        end
      if (wire10)
        begin
          reg19 <= $unsigned((~&$signed(wire4[(4'hb):(3'h6)])));
          if (($signed((reg12 ?
                  $unsigned(reg13[(3'h5):(3'h5)]) : $signed((~|wire7)))) ?
              ($signed((((7'h44) ? reg18 : wire10) << reg19[(2'h2):(2'h2)])) ?
                  (~&(&(+(8'hac)))) : $unsigned(reg18)) : wire6))
            begin
              reg20 <= reg19[(3'h4):(2'h3)];
              reg21 <= wire4[(4'he):(4'h8)];
              reg22 <= $unsigned(wire6[(3'h7):(1'h1)]);
              reg23 <= (wire2 ^ $signed(wire4));
            end
          else
            begin
              reg20 <= (|((^(wire7 ~^ $unsigned((8'ha4)))) == $unsigned({wire1,
                  (wire6 ^ wire0)})));
              reg21 <= $signed((~(^({reg14, wire3} ?
                  {reg19, wire7} : wire10[(5'h11):(4'h9)]))));
              reg22 <= (!wire0);
              reg23 <= wire6[(1'h1):(1'h1)];
            end
          if ($signed($unsigned($signed(reg18[(1'h0):(1'h0)]))))
            begin
              reg24 <= $unsigned({(~^(^$signed(wire8)))});
              reg25 <= ($signed(wire1) <= $signed(wire3));
              reg26 <= {{wire2, (+reg21[(4'ha):(3'h7)])}};
              reg27 <= wire6;
            end
          else
            begin
              reg24 <= reg12[(2'h2):(1'h0)];
              reg25 <= $signed($unsigned((({reg16} ?
                  reg12[(1'h0):(1'h0)] : (^reg27)) + wire8[(1'h0):(1'h0)])));
              reg26 <= ($signed((($signed(wire11) | reg27) <<< ((reg16 ?
                  wire6 : reg14) || (~|wire9)))) == $signed(wire0[(3'h6):(3'h6)]));
              reg27 <= (^~reg13);
            end
          reg28 <= (~&((reg12[(2'h2):(1'h0)] | $signed(wire11[(2'h2):(2'h2)])) << $unsigned(reg18)));
          reg29 <= $unsigned((8'hb6));
        end
      else
        begin
          reg19 <= {$signed(((wire2[(2'h2):(1'h1)] ?
                      ((8'ha5) ? reg25 : wire0) : (reg25 ? (8'h9e) : reg29)) ?
                  wire1 : (|$signed(wire10))))};
          reg20 <= reg25[(4'h8):(3'h5)];
          if ((^(~^($unsigned(reg29) != wire9[(3'h5):(1'h1)]))))
            begin
              reg21 <= reg27[(3'h4):(2'h3)];
            end
          else
            begin
              reg21 <= wire1;
              reg22 <= $unsigned(wire9[(4'hd):(4'hb)]);
              reg23 <= {$signed((|$unsigned($signed((8'haa)))))};
              reg24 <= ((wire11 ?
                  reg18[(1'h1):(1'h0)] : (~^($unsigned((8'ha5)) ^ wire6))) ~^ {(+$signed((reg29 ?
                      reg22 : wire9)))});
              reg25 <= reg24[(2'h2):(1'h1)];
            end
        end
      reg30 <= (reg20 != ($unsigned(reg24) ?
          wire9 : ((^~$unsigned(reg17)) ?
              (((8'hb7) >>> reg29) ?
                  {wire9,
                      reg15} : $signed(reg14)) : $signed(reg25[(4'ha):(3'h6)]))));
      if (wire3[(1'h1):(1'h0)])
        begin
          reg31 <= $unsigned($unsigned((8'h9f)));
          if (((|{((reg22 << reg24) * (wire7 ? reg30 : reg12)),
                  ((reg21 | wire10) <<< (&wire6))}) ?
              {reg29[(4'ha):(2'h3)],
                  ($signed((~&reg23)) != $unsigned((^reg22)))} : ((~&reg14) ?
                  wire7 : {reg27[(1'h1):(1'h0)]})))
            begin
              reg32 <= $signed($unsigned($unsigned(($signed(reg17) ?
                  (^reg16) : $unsigned(reg13)))));
              reg33 <= $unsigned((~($unsigned(reg17) << $signed((wire9 || reg22)))));
              reg34 <= ((^$signed((reg32[(3'h6):(2'h3)] + $signed(reg16)))) <<< {(~&wire7)});
              reg35 <= reg12[(2'h2):(1'h1)];
            end
          else
            begin
              reg32 <= $signed(reg34);
            end
          reg36 <= reg19;
          reg37 <= $unsigned(wire2[(3'h6):(1'h0)]);
        end
      else
        begin
          reg31 <= $unsigned((~&$unsigned($unsigned($signed(reg14)))));
          reg32 <= (wire2[(1'h1):(1'h0)] <= ({reg32} ?
              wire0[(1'h0):(1'h0)] : (($unsigned(reg37) & {wire8,
                  reg18}) <= ({reg15} ~^ $unsigned(wire4)))));
          if (((reg31 >= $signed((~|$signed((8'hac))))) ?
              {$signed(reg37[(1'h0):(1'h0)]),
                  $signed($signed({reg23}))} : reg34[(3'h4):(1'h1)]))
            begin
              reg33 <= ($signed($unsigned(reg32[(3'h6):(3'h4)])) ^~ $unsigned(wire10[(1'h1):(1'h1)]));
              reg34 <= (^~(((|reg36) ?
                  (~|$signed(reg25)) : $signed((^~wire9))) * ((8'hb9) > wire10)));
              reg35 <= reg20[(3'h5):(2'h3)];
              reg36 <= (wire7 ?
                  $unsigned((wire2 | (reg32[(4'h8):(1'h1)] ?
                      $signed(wire6) : (+reg35)))) : $signed((reg28[(3'h5):(2'h2)] ?
                      (8'hb1) : ((reg22 ? reg31 : wire7) ?
                          $unsigned((8'had)) : (wire2 ~^ reg24)))));
            end
          else
            begin
              reg33 <= (8'hbb);
              reg34 <= (reg33[(1'h0):(1'h0)] ?
                  $unsigned((8'haf)) : (|reg34[(5'h14):(1'h1)]));
              reg35 <= $unsigned((^{({reg32, wire0} ?
                      (wire3 ^ (8'hb7)) : $unsigned(wire6)),
                  $unsigned((^(8'ha9)))}));
              reg36 <= (reg16[(4'hf):(4'h8)] ?
                  {reg13} : {reg30[(2'h3):(2'h3)], $unsigned(wire9)});
              reg37 <= (^~($unsigned((reg13 < (|reg29))) <<< $signed(((~reg18) != reg27))));
            end
          reg38 <= $unsigned(reg28[(3'h6):(1'h1)]);
        end
      reg39 <= $unsigned((((~^reg30[(1'h1):(1'h0)]) ?
              ((^~wire8) ?
                  (~^wire9) : ((8'h9d) ?
                      reg23 : reg30)) : reg16[(4'he):(2'h2)]) ?
          wire4 : (reg34[(3'h7):(3'h7)] ? (8'haa) : wire7[(3'h5):(3'h4)])));
    end
  assign wire40 = ($signed($signed(((~reg33) ?
                          reg27 : (reg36 ? (7'h42) : reg31)))) ?
                      {$unsigned($signed((reg23 ? (8'hbf) : reg16))),
                          (~|(reg26[(3'h7):(2'h3)] >= $unsigned(reg13)))} : $signed((((reg39 ?
                                  reg19 : reg31) ?
                              reg31 : (reg20 >> (8'ha6))) ?
                          $signed($unsigned(reg32)) : ((^~(8'h9d)) ?
                              $signed(wire5) : $signed((8'hb0))))));
  module41 #() modinst144 (wire143, clk, wire3, reg35, reg12, reg28);
  assign wire145 = $unsigned({$signed((~$unsigned(reg23))),
                       {$unsigned(((8'ha2) << (8'ha6))),
                           $signed(reg30[(2'h3):(2'h3)])}});
  assign wire146 = (!wire11[(1'h1):(1'h0)]);
endmodule

module module41
#(parameter param142 = ((~|(~&(8'had))) > (-{((^(8'hbc)) ? ((8'hae) ~^ (8'hbb)) : ((7'h44) ? (8'hb8) : (8'ha0))), ((8'ha9) == (8'ha2))})))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire45;
  input wire signed [(5'h10):(1'h0)] wire44;
  input wire [(5'h13):(1'h0)] wire43;
  input wire signed [(5'h11):(1'h0)] wire42;
  wire [(3'h6):(1'h0)] wire141;
  wire signed [(5'h13):(1'h0)] wire131;
  wire signed [(3'h6):(1'h0)] wire129;
  wire [(5'h15):(1'h0)] wire119;
  wire [(4'ha):(1'h0)] wire118;
  wire [(5'h13):(1'h0)] wire117;
  wire signed [(4'he):(1'h0)] wire96;
  wire signed [(5'h13):(1'h0)] wire65;
  wire [(5'h13):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire63;
  wire [(4'hc):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire60;
  wire signed [(4'hd):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire115;
  reg signed [(3'h4):(1'h0)] reg140 = (1'h0);
  reg [(5'h15):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg138 = (1'h0);
  reg [(5'h11):(1'h0)] reg137 = (1'h0);
  reg [(4'he):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg135 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg134 = (1'h0);
  reg signed [(4'he):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg132 = (1'h0);
  assign y = {wire141,
                 wire131,
                 wire129,
                 wire119,
                 wire118,
                 wire117,
                 wire96,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire57,
                 wire115,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 (1'h0)};
  module46 #() modinst58 (wire57, clk, wire44, wire45, wire42, wire43, (8'h9e));
  assign wire59 = (wire44[(2'h3):(1'h1)] ?
                      wire44[(4'ha):(3'h4)] : (!(($unsigned(wire43) ?
                          wire57 : wire42) <= wire57[(2'h2):(1'h1)])));
  assign wire60 = $unsigned(wire59[(4'hc):(2'h2)]);
  assign wire61 = (wire45[(4'hf):(1'h1)] ?
                      (~|{wire59, (!wire43)}) : $unsigned((((wire42 ?
                              wire59 : wire45) * (7'h43)) ?
                          $signed(wire60) : (~&{wire43, wire60}))));
  assign wire62 = wire42[(5'h10):(4'hc)];
  assign wire63 = $signed((((~^(~wire45)) - wire44[(1'h0):(1'h0)]) ?
                      ((~^wire62[(1'h0):(1'h0)]) ?
                          wire59[(3'h4):(2'h3)] : {(^~(8'ha7))}) : wire60[(1'h0):(1'h0)]));
  assign wire64 = (8'ha7);
  assign wire65 = ({(wire57[(3'h6):(3'h4)] ?
                          $unsigned(wire62) : $unsigned($unsigned(wire57)))} >> (&$unsigned((^wire44))));
  module66 #() modinst97 (.wire68(wire65), .wire69(wire63), .clk(clk), .wire67(wire45), .y(wire96), .wire70(wire43), .wire71(wire62));
  module98 #() modinst116 (.wire102(wire63), .wire103(wire43), .wire99(wire57), .clk(clk), .wire100(wire64), .y(wire115), .wire101(wire59));
  assign wire117 = ((($unsigned(wire64) ?
                           (|$unsigned(wire96)) : ((^wire61) && (^~(8'hb4)))) ?
                       wire42[(3'h7):(1'h1)] : {(wire44[(2'h2):(1'h0)] ?
                               wire43 : (^~wire42)),
                           wire60[(4'hb):(4'hb)]}) <<< $unsigned(wire57));
  assign wire118 = ((wire64 ?
                       wire59[(4'hd):(3'h5)] : ((((8'hb3) ?
                               wire62 : (7'h41)) ^~ $unsigned(wire59)) ?
                           ($unsigned(wire96) == $unsigned(wire115)) : wire63[(4'hf):(4'he)])) || {{(!$unsigned((8'hb3))),
                           (8'ha2)},
                       ((+(8'h9e)) ?
                           $signed((wire59 & wire45)) : {$signed(wire96),
                               wire96[(4'h8):(3'h7)]})});
  assign wire119 = ((wire42 ?
                           (-((|wire63) ?
                               $unsigned((8'ha8)) : (-(8'ha9)))) : $unsigned($signed((|wire45)))) ?
                       $signed($unsigned((~|(wire60 >= (8'ha6))))) : (-{wire63}));
  module120 #() modinst130 (.wire121(wire59), .clk(clk), .wire123(wire44), .wire124(wire118), .y(wire129), .wire122(wire119));
  assign wire131 = $unsigned(wire64[(3'h6):(1'h0)]);
  always
    @(posedge clk) begin
      reg132 <= wire44[(1'h0):(1'h0)];
      if (((wire59[(4'hb):(3'h4)] ? wire61[(3'h4):(3'h4)] : wire65) ?
          wire61[(5'h10):(4'h8)] : $unsigned((wire119[(5'h12):(4'hd)] == (~&wire42)))))
        begin
          reg133 <= wire44;
          reg134 <= ({$unsigned(wire129)} * (wire61 ?
              {(+(wire61 <<< wire119)),
                  ({wire59} + (wire96 ~^ wire96))} : $signed(wire129[(1'h0):(1'h0)])));
          reg135 <= $unsigned(wire115[(3'h7):(3'h5)]);
          reg136 <= $signed(($unsigned(wire117) ?
              reg134[(2'h2):(1'h1)] : wire118));
          if ($unsigned(wire59[(2'h3):(2'h3)]))
            begin
              reg137 <= wire61[(4'he):(4'hc)];
              reg138 <= $signed($unsigned($signed((|wire60))));
            end
          else
            begin
              reg137 <= (wire96 ?
                  ($unsigned(((reg138 == wire62) | $signed(wire45))) <<< (^reg133)) : (^(^wire117[(1'h1):(1'h1)])));
              reg138 <= reg137[(5'h11):(4'hd)];
              reg139 <= $unsigned((8'haa));
            end
        end
      else
        begin
          if ({$unsigned(($signed($signed(wire129)) ?
                  ((&wire118) ?
                      (~&wire131) : $unsigned(reg135)) : $signed((wire61 ?
                      wire115 : wire119))))})
            begin
              reg133 <= wire117;
              reg134 <= wire45[(5'h11):(4'he)];
            end
          else
            begin
              reg133 <= (wire118 * $signed($signed(wire42)));
              reg134 <= wire45;
              reg135 <= $signed(wire96);
              reg136 <= $signed($signed(($signed({reg136, (7'h43)}) ?
                  (^~(wire43 ?
                      reg135 : wire119)) : $unsigned($signed(wire43)))));
            end
          reg137 <= (|wire118);
          reg138 <= $signed(($unsigned($signed(reg134[(1'h1):(1'h0)])) ?
              $unsigned(reg135[(4'hc):(4'h9)]) : $signed(wire62)));
          reg139 <= (wire57[(3'h6):(1'h1)] >= ({wire115, (~wire62)} == reg134));
          reg140 <= $signed({(-(wire117 < wire65[(1'h1):(1'h0)])),
              $unsigned(wire44[(1'h1):(1'h0)])});
        end
    end
  assign wire141 = (+(wire43[(5'h13):(5'h10)] != wire59[(3'h4):(1'h0)]));
endmodule

module module120  (y, clk, wire124, wire123, wire122, wire121);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire124;
  input wire [(5'h10):(1'h0)] wire123;
  input wire [(2'h3):(1'h0)] wire122;
  input wire signed [(4'h9):(1'h0)] wire121;
  wire signed [(5'h10):(1'h0)] wire128;
  wire [(5'h11):(1'h0)] wire127;
  wire signed [(5'h11):(1'h0)] wire126;
  wire signed [(5'h11):(1'h0)] wire125;
  assign y = {wire128, wire127, wire126, wire125, (1'h0)};
  assign wire125 = $signed(({((wire124 >= wire121) ? wire121 : wire123),
                           wire124} ?
                       ($unsigned(wire124) < wire121[(3'h7):(3'h6)]) : wire123));
  assign wire126 = wire123[(4'h9):(3'h4)];
  assign wire127 = (+$unsigned(((wire122[(1'h0):(1'h0)] || (wire125 ?
                           wire123 : wire125)) ?
                       wire121 : wire125)));
  assign wire128 = $unsigned((^~wire124[(4'ha):(4'ha)]));
endmodule

module module98
#(parameter param114 = (+(((((8'hb7) ? (8'ha4) : (8'hb7)) ? ((7'h41) ? (8'hb9) : (8'hbc)) : (~^(8'hab))) == (!((8'haa) + (8'ha2)))) ^~ ((^((8'h9c) ? (8'ha3) : (8'ha6))) ? (~&((8'hb7) || (8'ha1))) : {(~(8'haf))}))))
(y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire103;
  input wire signed [(3'h5):(1'h0)] wire102;
  input wire signed [(4'hd):(1'h0)] wire101;
  input wire [(5'h13):(1'h0)] wire100;
  input wire signed [(4'h8):(1'h0)] wire99;
  wire [(5'h14):(1'h0)] wire113;
  wire [(5'h10):(1'h0)] wire112;
  wire [(5'h11):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire107;
  wire signed [(5'h14):(1'h0)] wire106;
  wire signed [(4'hd):(1'h0)] wire105;
  wire signed [(4'hf):(1'h0)] wire104;
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg110 = (1'h0);
  reg [(3'h4):(1'h0)] reg109 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire104 = (wire99[(4'h8):(3'h4)] == wire100[(4'hc):(1'h1)]);
  assign wire105 = (^({wire103[(2'h3):(1'h0)]} <<< $signed($unsigned(wire104[(4'hf):(3'h4)]))));
  assign wire106 = (&{wire103[(2'h2):(1'h1)],
                       ({(wire101 ? wire104 : wire105),
                               ((8'hb4) ? wire105 : wire103)} ?
                           wire99 : wire103[(4'hf):(4'he)])});
  assign wire107 = $signed(($signed((wire106[(1'h1):(1'h0)] ?
                       (wire102 ?
                           wire106 : wire105) : $signed(wire101))) != ($signed({wire105,
                       wire101}) <= $signed((wire104 - wire100)))));
  assign wire108 = {$signed((wire105 >> {wire105, $signed(wire104)}))};
  always
    @(posedge clk) begin
      reg109 <= (~&wire102);
      reg110 <= (wire108[(4'hf):(3'h7)] ~^ ({wire107[(4'h9):(3'h5)],
          wire100[(4'hd):(4'hc)]} - {(wire108[(4'hc):(1'h0)] && $unsigned(wire100))}));
      reg111 <= {(&(wire100[(3'h4):(2'h2)] ?
              ((wire100 ? (8'ha9) : wire108) ?
                  (8'hbe) : (wire103 <<< wire102)) : $unsigned((wire107 ?
                  wire107 : wire99)))),
          wire107};
    end
  assign wire112 = wire108;
  assign wire113 = wire99;
endmodule

module module66
#(parameter param95 = (((7'h40) + ((((7'h44) > (8'hbf)) ^ ((8'hb1) ? (8'h9d) : (8'ha6))) << ((+(8'hac)) > ((8'ha9) - (8'hb3))))) <= (!(((~&(8'hb2)) ? (!(7'h43)) : (!(8'ha3))) ? (((8'h9e) >> (8'h9c)) ? ((8'hbe) ? (8'ha8) : (8'hbc)) : ((8'hbf) ~^ (8'h9f))) : {((8'hb7) && (8'h9c)), {(8'hb9)}}))))
(y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire71;
  input wire [(4'ha):(1'h0)] wire70;
  input wire [(5'h10):(1'h0)] wire69;
  input wire [(5'h11):(1'h0)] wire68;
  input wire [(5'h12):(1'h0)] wire67;
  wire signed [(5'h15):(1'h0)] wire86;
  wire [(4'he):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire74;
  wire [(3'h5):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire72;
  reg signed [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(3'h4):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(2'h2):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire74,
                 wire73,
                 wire72,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire72 = wire71;
  assign wire73 = {(wire71[(2'h2):(2'h2)] + {wire69[(4'ha):(2'h3)]})};
  assign wire74 = wire68[(4'hb):(4'hb)];
  always
    @(posedge clk) begin
      if ({(!((|{wire70}) ?
              ({wire69, (8'ha3)} ?
                  $unsigned((8'h9f)) : $signed(wire72)) : wire70)),
          ((~^wire72) < $signed(wire68))})
        begin
          reg75 <= wire73[(3'h5):(2'h3)];
          if ($unsigned({(wire70 ?
                  ((~|wire69) ?
                      wire68[(1'h0):(1'h0)] : reg75) : $unsigned($unsigned(wire71)))}))
            begin
              reg76 <= {$signed(wire67[(4'hc):(2'h2)]),
                  $signed(wire67[(4'hb):(3'h5)])};
              reg77 <= {wire70};
              reg78 <= ((reg76[(4'hc):(3'h5)] ?
                  {$unsigned(reg76)} : (-($unsigned(reg76) << wire67[(5'h12):(3'h6)]))) == (-wire68[(4'hb):(1'h0)]));
              reg79 <= wire72;
              reg80 <= wire74;
            end
          else
            begin
              reg76 <= ((wire71 | ($unsigned(reg79[(4'h8):(3'h5)]) ?
                  ((~^wire71) ?
                      (reg78 ?
                          wire72 : reg79) : $signed(wire71)) : {reg80[(3'h6):(1'h1)]})) ^~ wire73[(2'h2):(1'h0)]);
              reg77 <= {{(!(((8'hb4) > (8'hb1)) ?
                          (-wire70) : (reg75 ~^ reg79))),
                      $unsigned(reg76[(4'hd):(4'hc)])},
                  reg80[(3'h7):(1'h1)]};
              reg78 <= wire72[(4'hb):(3'h4)];
              reg79 <= (^~$signed(reg79[(4'ha):(3'h7)]));
            end
          reg81 <= wire71;
        end
      else
        begin
          if (wire67)
            begin
              reg75 <= ((wire68[(5'h10):(4'ha)] ?
                      ($signed((~|(8'hbb))) < (~(wire71 <= reg76))) : $unsigned(wire73[(3'h5):(2'h2)])) ?
                  {(-(~^reg76))} : (((wire67 >>> wire68[(3'h7):(3'h6)]) + {(!wire71)}) <= wire71));
              reg76 <= reg78[(4'h9):(1'h1)];
              reg77 <= (($unsigned((&wire72[(4'hf):(4'he)])) ?
                  $signed((+$unsigned(wire70))) : wire67[(4'hf):(2'h2)]) && reg78);
            end
          else
            begin
              reg75 <= ((~|($unsigned((^(8'hb1))) ?
                  reg79 : reg76)) - (wire70[(4'h8):(3'h4)] ^~ (8'ha0)));
            end
        end
      reg82 <= $unsigned(wire70[(4'ha):(3'h5)]);
      reg83 <= reg76[(3'h4):(2'h3)];
      reg84 <= reg82;
    end
  assign wire85 = $unsigned((((wire71[(2'h3):(1'h1)] & wire69) ?
                          (&wire68) : reg77[(4'ha):(3'h6)]) ?
                      $signed($unsigned(reg84[(2'h2):(2'h2)])) : reg75[(3'h7):(1'h1)]));
  assign wire86 = ((!(reg80[(4'h9):(3'h7)] * wire74)) >>> wire68);
  always
    @(posedge clk) begin
      if (wire73[(3'h5):(3'h4)])
        begin
          reg87 <= ($unsigned(reg84[(1'h1):(1'h1)]) ?
              $signed({$unsigned(wire72[(5'h10):(4'ha)])}) : reg81[(3'h5):(3'h5)]);
        end
      else
        begin
          reg87 <= wire85[(1'h0):(1'h0)];
          reg88 <= wire71[(4'h8):(2'h3)];
          reg89 <= $signed($signed((~&$signed(((8'hb5) != wire86)))));
          reg90 <= $unsigned(($signed(reg89[(4'h8):(1'h0)]) << wire86));
        end
      reg91 <= ((8'h9c) ?
          {(((reg82 ? reg82 : (8'hab)) >> reg89[(3'h7):(3'h4)]) ?
                  ((reg90 * reg81) & (-reg82)) : (wire85[(4'ha):(4'ha)] <= $unsigned(reg75)))} : ($signed(reg89[(4'hf):(4'h8)]) ?
              {($unsigned(reg88) ?
                      (^wire86) : (wire74 ?
                          (8'ha5) : reg77))} : wire74[(4'hb):(4'h8)]));
    end
  always
    @(posedge clk) begin
      reg92 <= {((&$signed({(8'hab),
              wire74})) << $signed($unsigned(reg81[(3'h5):(3'h5)])))};
      reg93 <= reg91[(1'h1):(1'h0)];
      reg94 <= reg87[(4'h8):(1'h1)];
    end
endmodule

module module46  (y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire51;
  input wire signed [(4'hf):(1'h0)] wire50;
  input wire signed [(5'h10):(1'h0)] wire49;
  input wire [(5'h10):(1'h0)] wire48;
  input wire [(5'h14):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire53;
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  assign y = {wire56, wire55, wire54, wire53, reg52, (1'h0)};
  always
    @(posedge clk) begin
      reg52 <= $unsigned($unsigned(wire48[(3'h6):(3'h5)]));
    end
  assign wire53 = (wire50 ?
                      wire47[(4'hc):(2'h2)] : ($unsigned({(8'hbc),
                              (reg52 ? wire50 : wire49)}) ?
                          $signed($unsigned($signed(wire50))) : $signed(wire51[(1'h1):(1'h0)])));
  assign wire54 = {($signed(wire49[(3'h6):(1'h0)]) ?
                          (|{$signed(wire53)}) : (((+reg52) || wire48[(4'hd):(2'h3)]) ?
                              ($signed(wire53) * $signed(wire47)) : {$unsigned(wire53)}))};
  assign wire55 = $signed((^~{$signed(wire47[(4'hb):(1'h0)])}));
  assign wire56 = wire48;
endmodule
