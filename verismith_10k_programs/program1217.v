module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire125;
  wire signed [(4'hd):(1'h0)] wire117;
  wire signed [(4'hf):(1'h0)] wire116;
  wire [(5'h11):(1'h0)] wire115;
  wire signed [(4'hc):(1'h0)] wire114;
  wire [(4'hd):(1'h0)] wire113;
  wire signed [(4'hf):(1'h0)] wire112;
  wire [(3'h5):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire110;
  wire signed [(4'h8):(1'h0)] wire109;
  wire [(4'hb):(1'h0)] wire107;
  reg [(4'hd):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg123 = (1'h0);
  reg [(3'h4):(1'h0)] reg122 = (1'h0);
  reg [(2'h2):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg119 = (1'h0);
  reg signed [(4'he):(1'h0)] reg118 = (1'h0);
  assign y = {wire125,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire107,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  module5 #() modinst108 (.wire10(wire3), .wire6(wire1), .wire7(wire0), .wire9(wire2), .y(wire107), .wire8(wire4), .clk(clk));
  assign wire109 = wire2[(4'hc):(2'h2)];
  assign wire110 = (((8'haf) != $unsigned($signed({wire3,
                       wire4}))) * $signed((^$unsigned({wire109}))));
  assign wire111 = (wire2[(3'h4):(2'h2)] ?
                       $unsigned(($unsigned(wire3[(5'h14):(5'h11)]) << wire110)) : wire3[(1'h0):(1'h0)]);
  assign wire112 = wire1;
  assign wire113 = wire107[(3'h5):(1'h1)];
  assign wire114 = (-(~&(-$unsigned((~^wire4)))));
  assign wire115 = ($unsigned((-((wire107 ? wire109 : wire111) ?
                       wire109 : (wire107 + wire109)))) | wire113[(4'ha):(2'h3)]);
  assign wire116 = $unsigned((wire2[(4'hd):(4'h8)] >= (8'hb9)));
  assign wire117 = {wire112};
  always
    @(posedge clk) begin
      if ((~^wire116[(4'hd):(4'hb)]))
        begin
          reg118 <= $signed(wire109);
          reg119 <= (-($signed(((+wire114) <<< wire111[(1'h0):(1'h0)])) ?
              wire117 : $signed((8'ha7))));
          reg120 <= $signed($unsigned(wire109));
          reg121 <= (-(|wire1[(3'h4):(1'h0)]));
          if ((((+(+{(8'had)})) ?
              $signed((^$unsigned(wire116))) : reg118[(3'h4):(2'h3)]) > $signed($unsigned($unsigned($signed(wire1))))))
            begin
              reg122 <= (+$unsigned({($signed(wire114) ?
                      $signed(reg119) : reg120)}));
            end
          else
            begin
              reg122 <= {(|{{(reg118 ? wire0 : wire1)}})};
            end
        end
      else
        begin
          reg118 <= $signed((&wire117));
          reg119 <= reg119[(3'h6):(2'h2)];
        end
      reg123 <= (^~(wire4 ?
          {$signed((wire113 <<< wire115))} : (({(8'hb4), reg122} ?
                  (~&reg119) : wire115) ?
              wire111[(1'h0):(1'h0)] : reg119[(3'h5):(1'h0)])));
      reg124 <= ($unsigned($unsigned((wire4[(4'hb):(1'h0)] > wire2))) - $signed($unsigned((|wire114))));
    end
  assign wire125 = wire111[(2'h3):(1'h0)];
endmodule

module module5
#(parameter param105 = (^((((~&(8'haf)) > ((7'h43) >> (8'hb8))) * (((8'ha4) ? (8'ha1) : (7'h44)) <<< {(7'h40)})) ? (~&((^~(8'hbe)) > ((7'h40) ? (8'h9d) : (8'hb8)))) : ({(~(7'h42)), (~^(8'hbb))} >> (|{(7'h42), (8'hb1)})))), 
parameter param106 = param105)
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h234):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire6;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire104;
  wire [(3'h5):(1'h0)] wire103;
  wire [(2'h3):(1'h0)] wire102;
  wire [(2'h3):(1'h0)] wire101;
  wire signed [(4'hb):(1'h0)] wire100;
  wire signed [(4'hc):(1'h0)] wire96;
  wire signed [(5'h12):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire47;
  wire [(3'h4):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire94;
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire96,
                 wire17,
                 wire18,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire47,
                 wire48,
                 wire49,
                 wire50,
                 wire94,
                 reg99,
                 reg98,
                 reg97,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
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
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= wire10[(1'h0):(1'h0)];
      reg12 <= wire10;
      reg13 <= wire10;
      if ((wire6 ?
          {($unsigned(reg12[(3'h4):(1'h1)]) <<< {$signed(wire7)})} : $signed(wire10[(2'h3):(2'h3)])))
        begin
          reg14 <= {reg13[(1'h1):(1'h0)]};
          reg15 <= {$signed(((~|(8'hb5)) ?
                  (reg14[(1'h1):(1'h1)] <<< $unsigned(reg12)) : ({reg11} ?
                      (|reg12) : $signed(wire9))))};
          reg16 <= $signed(({reg14} ?
              (^wire10[(3'h7):(1'h1)]) : (reg15[(4'hf):(4'ha)] ^~ $unsigned({wire6,
                  (8'had)}))));
        end
      else
        begin
          reg14 <= wire9[(3'h5):(3'h4)];
        end
    end
  assign wire17 = wire9[(1'h0):(1'h0)];
  assign wire18 = (reg15 ? wire9 : $unsigned(wire9));
  always
    @(posedge clk) begin
      reg19 <= $unsigned(reg14[(3'h5):(1'h0)]);
      reg20 <= ({reg13[(1'h0):(1'h0)]} ?
          (^~reg14[(1'h0):(1'h0)]) : (^reg14[(2'h3):(1'h1)]));
      reg21 <= {$unsigned({((8'hb3) * $signed(reg14))})};
      if (({$unsigned($signed((reg13 <<< reg15))), {(~{wire18, wire10})}} ?
          (wire8[(5'h12):(5'h12)] ?
              $signed($unsigned($unsigned(wire10))) : ((-(8'hb5)) <= reg13)) : {{(8'hba)}}))
        begin
          if ((~&$signed(({((8'ha2) == wire17), wire8[(5'h11):(5'h10)]} ?
              (reg12[(1'h1):(1'h1)] >>> (~^wire10)) : ((^~wire10) ^ (~wire9))))))
            begin
              reg22 <= (!(8'ha5));
              reg23 <= ($signed($unsigned(wire8)) ?
                  ({reg21[(2'h3):(2'h2)], reg11} >> (^~((wire17 < (8'hba)) ?
                      $signed((8'ha0)) : reg19))) : {($signed(reg20[(2'h3):(1'h0)]) ^ reg16[(1'h0):(1'h0)]),
                      reg21[(2'h2):(1'h1)]});
              reg24 <= $unsigned((~^$unsigned(reg21)));
              reg25 <= reg20;
            end
          else
            begin
              reg22 <= (^reg22[(1'h0):(1'h0)]);
              reg23 <= wire10[(3'h4):(1'h0)];
              reg24 <= (~|reg19);
              reg25 <= $signed($unsigned($unsigned(reg14)));
              reg26 <= reg21;
            end
          if ((($signed(((wire17 ? reg23 : wire6) * reg13[(2'h2):(1'h0)])) ?
              reg14 : (-{(reg14 >>> reg24), {reg12, reg26}})) > (&reg26)))
            begin
              reg27 <= (reg20[(3'h7):(2'h3)] ?
                  wire7[(1'h0):(1'h0)] : {(($signed((8'h9d)) >= (~wire9)) ?
                          wire6[(4'he):(4'h8)] : (reg11[(4'h9):(3'h6)] ?
                              (reg20 ~^ reg13) : (reg26 ? wire9 : wire18))),
                      reg19});
              reg28 <= {((~|$signed((reg26 ^~ wire6))) ?
                      {reg15[(3'h6):(1'h0)]} : reg26[(1'h0):(1'h0)]),
                  $signed(($signed(reg14) && wire18[(2'h3):(2'h3)]))};
              reg29 <= $signed((($unsigned((reg15 * wire10)) | reg28[(2'h2):(2'h2)]) ?
                  $unsigned(($unsigned(reg13) && $signed(reg12))) : reg23));
            end
          else
            begin
              reg27 <= (!$unsigned(reg14[(2'h2):(1'h0)]));
            end
          reg30 <= (wire17[(5'h12):(4'hc)] >= (^$signed((~&$signed(reg22)))));
          reg31 <= (+($unsigned(({reg19, (8'ha8)} ?
                  $signed(reg29) : $signed(reg27))) ?
              wire6 : (((reg26 ? reg11 : reg25) ?
                  $signed(reg15) : (!reg11)) & reg16[(4'h9):(2'h3)])));
          if ({($unsigned($unsigned({reg14, reg19})) >= reg13[(2'h2):(1'h0)])})
            begin
              reg32 <= wire6[(4'h8):(3'h5)];
              reg33 <= $signed((wire8[(5'h11):(5'h10)] ?
                  wire9 : $unsigned({wire9, $unsigned(reg31)})));
              reg34 <= $unsigned((((reg22 ? $signed(wire17) : (~^wire18)) ?
                      $signed((^reg13)) : (reg13 * reg32[(1'h1):(1'h1)])) ?
                  wire8 : {$unsigned((wire9 ? (8'ha3) : (8'ha6)))}));
              reg35 <= reg28[(3'h6):(3'h5)];
              reg36 <= $signed(((!(8'hb1)) ?
                  wire6 : $unsigned($signed(wire9[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg32 <= $signed($unsigned({{reg16, (wire6 << reg19)},
                  (^~reg29)}));
              reg33 <= (~(-(((reg35 > reg28) < $signed(reg35)) >> ((~|reg29) != reg24[(1'h0):(1'h0)]))));
              reg34 <= (^~($unsigned(reg19) + (^{$signed(reg20)})));
              reg35 <= reg30;
              reg36 <= (reg21[(2'h2):(2'h2)] | ((~^$signed(reg24)) << {(reg20 * (reg11 ?
                      reg12 : reg15)),
                  $signed((~^reg24))}));
            end
        end
      else
        begin
          reg22 <= reg19[(3'h4):(2'h2)];
          if (((reg26[(3'h5):(2'h3)] ? reg36 : reg20) ?
              ($unsigned(((reg24 ?
                  reg30 : (8'ha1)) != (reg27 == (8'hb2)))) + (8'ha6)) : reg16))
            begin
              reg23 <= $signed(reg29);
              reg24 <= reg13[(1'h0):(1'h0)];
              reg25 <= (8'h9c);
              reg26 <= (^~($unsigned($signed((reg24 * (8'hb6)))) && $signed(reg33[(4'h8):(1'h1)])));
            end
          else
            begin
              reg23 <= (~|$signed(wire7[(3'h4):(3'h4)]));
            end
          reg27 <= (~^(^~$unsigned(($unsigned(wire9) ? {reg24} : reg29))));
        end
      reg37 <= $signed(wire6[(3'h4):(2'h3)]);
    end
  assign wire38 = (~|(wire18[(5'h10):(4'hb)] ?
                      (~($unsigned(reg11) ?
                          wire10 : {(8'hb2)})) : reg30[(1'h1):(1'h0)]));
  assign wire39 = {wire17[(4'hc):(4'h9)], reg31[(4'ha):(2'h2)]};
  assign wire40 = $unsigned(((~&((reg22 | reg11) ?
                          {wire10} : (reg28 ? (8'ha4) : (8'haf)))) ?
                      $unsigned(reg16[(4'ha):(2'h3)]) : $signed($unsigned((|reg19)))));
  assign wire41 = wire40[(4'h9):(3'h4)];
  always
    @(posedge clk) begin
      reg42 <= (reg20 != ($unsigned($signed($unsigned((8'ha7)))) && (&$unsigned((8'h9f)))));
      reg43 <= ((wire7[(2'h2):(1'h1)] ?
              (((reg30 ? reg30 : reg26) ? {wire17, reg27} : $unsigned(reg24)) ?
                  $signed({reg21, (8'ha6)}) : (8'ha3)) : wire40) ?
          $signed($unsigned($unsigned((reg32 ?
              wire6 : reg35)))) : $signed(reg27));
      reg44 <= $signed((((8'hb0) ? (8'hae) : reg33) ?
          {(8'haf)} : ($signed((reg28 <= wire39)) != ($unsigned(reg26) ?
              (reg19 ? reg34 : reg20) : reg23))));
      reg45 <= $unsigned($unsigned((reg24[(2'h3):(1'h1)] >>> reg13)));
      reg46 <= {(|reg44), wire41[(3'h5):(1'h1)]};
    end
  assign wire47 = wire8[(4'hc):(3'h7)];
  assign wire48 = {((($signed(reg27) ?
                          (^~wire9) : (reg16 ?
                              wire9 : reg30)) + reg33[(1'h0):(1'h0)]) << {(7'h43)})};
  assign wire49 = reg33[(3'h5):(2'h2)];
  assign wire50 = $unsigned($unsigned(((-(reg14 ? wire48 : reg16)) ?
                      (&$unsigned(reg25)) : ($unsigned((8'hae)) ~^ (reg24 >>> wire39)))));
  always
    @(posedge clk) begin
      reg51 <= reg14[(2'h2):(2'h2)];
      reg52 <= reg34;
      reg53 <= (reg35 ?
          (((^~$unsigned(reg23)) & $unsigned((wire48 > reg15))) ?
              {wire6[(1'h0):(1'h0)],
                  reg51[(2'h3):(2'h2)]} : wire18[(5'h11):(4'ha)]) : wire9);
      reg54 <= (($signed(reg28) ?
              ((reg21 ?
                  reg29[(2'h3):(2'h2)] : $unsigned(wire6)) | ((-reg53) | (&reg15))) : reg46) ?
          $unsigned(reg36[(1'h0):(1'h0)]) : $unsigned(wire9[(1'h1):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg55 <= reg51[(2'h3):(1'h1)];
      reg56 <= reg42;
    end
  module57 #() modinst95 (.clk(clk), .wire61(reg34), .wire60(wire9), .wire58(wire8), .y(wire94), .wire59(wire7));
  assign wire96 = reg31[(3'h6):(3'h4)];
  always
    @(posedge clk) begin
      reg97 <= {($unsigned($unsigned((|reg27))) || $unsigned($unsigned(wire41)))};
      reg98 <= (|$signed(({reg11[(2'h2):(2'h2)]} ?
          reg25 : reg12[(3'h7):(2'h3)])));
      reg99 <= reg55[(1'h0):(1'h0)];
    end
  assign wire100 = (+($unsigned(wire6[(3'h4):(3'h4)]) || {wire39[(3'h6):(1'h1)]}));
  assign wire101 = (reg32[(1'h0):(1'h0)] || {(&reg55),
                       (((reg20 < reg44) ? {reg26, reg24} : (reg55 + reg35)) ?
                           reg33[(5'h10):(2'h3)] : $signed((wire38 ?
                               wire41 : reg53)))});
  assign wire102 = wire41[(4'h8):(3'h4)];
  assign wire103 = $unsigned({((~reg35) ?
                           (~|(~^reg29)) : (^(reg26 ? reg46 : reg45)))});
  assign wire104 = $unsigned({(+wire101[(2'h2):(2'h2)])});
endmodule

module module57
#(parameter param93 = (+(((8'hb2) ? (~&((8'h9c) ^ (8'hb6))) : {((8'haf) ? (8'hb6) : (8'hb5)), ((7'h40) ? (7'h41) : (8'h9e))}) ? ({(^(8'hbc)), {(8'hb7), (8'hb2)}} && ((+(8'hb0)) ? ((8'hba) ? (8'hb9) : (8'hb4)) : (|(8'h9c)))) : ((((8'hb2) ? (8'ha3) : (8'ha6)) ? ((8'hb4) * (8'hae)) : ((8'hbc) <= (8'hbc))) ? ((8'h9f) <= (&(8'h9e))) : (((8'h9f) ? (8'h9f) : (8'hae)) ? ((8'ha7) <= (8'had)) : ((8'ha8) ^ (8'ha5)))))))
(y, clk, wire61, wire60, wire59, wire58);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire61;
  input wire signed [(4'hc):(1'h0)] wire60;
  input wire signed [(4'he):(1'h0)] wire59;
  input wire signed [(2'h2):(1'h0)] wire58;
  wire [(4'hc):(1'h0)] wire92;
  wire signed [(4'hb):(1'h0)] wire91;
  wire signed [(3'h6):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire89;
  wire [(2'h3):(1'h0)] wire88;
  wire [(3'h5):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire77;
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(4'hd):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(3'h5):(1'h0)] reg81 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg76,
                 reg75,
                 reg74,
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
                 reg62,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg62 <= (~$unsigned($signed($unsigned((wire60 <= wire60)))));
      reg63 <= {((^$signed({(8'hb0)})) ?
              (wire59 ?
                  $unsigned($signed(wire60)) : ((~^(7'h41)) * wire59)) : (-(reg62[(3'h5):(1'h0)] ?
                  {wire60, wire58} : {wire59}))),
          ($signed((wire58[(1'h0):(1'h0)] != $signed(wire61))) ?
              $unsigned(wire59) : {wire61, (~|wire61[(3'h4):(2'h3)])})};
      reg64 <= $signed($unsigned(($signed((!wire61)) * $unsigned(reg63))));
      if (reg64[(4'hd):(4'ha)])
        begin
          if ($signed(reg64[(5'h11):(1'h0)]))
            begin
              reg65 <= $unsigned(wire59[(2'h2):(1'h0)]);
              reg66 <= (wire61[(3'h6):(1'h0)] & (~|$unsigned(((reg63 ?
                  wire61 : reg62) && (reg63 >= wire58)))));
            end
          else
            begin
              reg65 <= {((reg62 >> ($signed(reg65) ?
                      $unsigned(wire58) : wire60[(1'h0):(1'h0)])) && (reg63 && {(~^wire58),
                      wire58[(2'h2):(1'h0)]})),
                  $signed($unsigned((wire61[(3'h5):(3'h4)] ?
                      (~wire61) : (wire61 ? (8'hbe) : (8'hb2)))))};
              reg66 <= $signed($signed($unsigned($unsigned(((8'ha7) ?
                  (8'ha3) : reg63)))));
              reg67 <= {wire61};
            end
          reg68 <= $signed(reg64[(2'h2):(2'h2)]);
          reg69 <= ((^(reg62[(4'h8):(3'h4)] ?
              {wire60[(4'h9):(1'h0)], $signed(wire61)} : $signed((reg67 ?
                  wire59 : reg66)))) + ((!$signed((~|wire60))) ?
              (|($unsigned(reg64) << (reg68 ~^ reg63))) : reg62));
          reg70 <= ($unsigned(((|(-wire59)) <= ($unsigned(reg69) ?
              (+reg64) : $unsigned(reg69)))) <= ((|wire61) ?
              $unsigned((|(reg67 ? reg62 : reg64))) : $signed((~|reg69))));
          reg71 <= ((+reg68[(3'h7):(1'h1)]) ?
              {(reg64 ?
                      (8'hbd) : $signed((wire61 ? wire59 : (8'h9c))))} : reg64);
        end
      else
        begin
          reg65 <= ((~$signed({reg69, {reg71, reg66}})) ?
              ((wire59 - $signed(wire60[(4'hc):(3'h6)])) != $unsigned($signed((wire60 >>> reg63)))) : ($unsigned((~^wire60[(4'ha):(3'h5)])) << $signed((~|(reg66 ?
                  (8'h9f) : (8'ha1))))));
          reg66 <= ($signed((reg63[(4'hc):(4'ha)] ~^ (8'hac))) ?
              reg69 : {((|(reg68 ?
                      wire58 : (8'ha9))) || $unsigned((wire59 * (8'hb2))))});
          if ((wire60[(4'hc):(4'h8)] << (~|$signed(({(8'ha6)} ^~ wire59)))))
            begin
              reg67 <= (~|(|$signed(reg68)));
              reg68 <= $unsigned((reg64[(4'hb):(3'h7)] || reg63));
              reg69 <= ($unsigned((&reg71)) ?
                  {((reg66[(3'h6):(1'h0)] ?
                              $unsigned(reg64) : $signed(wire61)) ?
                          wire59[(2'h2):(1'h0)] : $unsigned($signed(reg66)))} : $signed((wire58 ?
                      reg64[(4'hd):(4'ha)] : (8'hb8))));
              reg70 <= {wire61[(3'h6):(1'h1)],
                  (({{reg71},
                      reg64} ^ $signed(reg70[(4'h8):(3'h4)])) >= $unsigned(wire59[(3'h7):(3'h5)]))};
              reg71 <= reg68[(2'h3):(1'h0)];
            end
          else
            begin
              reg67 <= reg64;
              reg68 <= (!(~&(wire58 & $unsigned($unsigned((7'h43))))));
              reg69 <= {$unsigned($signed($signed($unsigned(reg62)))),
                  (!(reg63[(4'h9):(2'h3)] >> (|reg67[(4'hb):(4'h9)])))};
            end
          if ($signed($unsigned(wire61)))
            begin
              reg72 <= $signed(($unsigned($unsigned($unsigned(reg65))) << (|reg63[(4'he):(4'h9)])));
            end
          else
            begin
              reg72 <= reg62;
            end
        end
      if (($signed(reg69) ?
          ((wire61[(2'h3):(1'h1)] ?
                  (|(wire60 ? reg69 : (8'h9c))) : $signed((!wire60))) ?
              wire58 : (8'ha7)) : (reg67[(1'h1):(1'h1)] | reg71)))
        begin
          if ((reg69 ?
              $signed($signed(($unsigned((8'ha5)) * (reg66 ?
                  reg66 : reg65)))) : ($unsigned(reg64[(4'hd):(3'h5)]) * reg63)))
            begin
              reg73 <= reg72[(2'h2):(1'h0)];
              reg74 <= wire59[(4'hc):(4'ha)];
              reg75 <= (!wire58);
            end
          else
            begin
              reg73 <= (~^wire59[(3'h5):(2'h2)]);
              reg74 <= (8'h9e);
              reg75 <= $signed(reg67[(4'he):(4'hd)]);
            end
          reg76 <= reg74;
        end
      else
        begin
          reg73 <= ({(((~^reg70) && $signed(reg68)) ?
                  ($unsigned(reg72) <= $unsigned(reg71)) : (7'h41))} < (^reg70[(1'h0):(1'h0)]));
        end
    end
  assign wire77 = $unsigned((($unsigned($signed((8'had))) > (-{(8'hb8)})) & reg72));
  assign wire78 = reg62;
  assign wire79 = (reg66 ? $signed(wire78) : $signed(reg74[(4'hc):(4'ha)]));
  assign wire80 = (wire61 >> wire79);
  always
    @(posedge clk) begin
      reg81 <= (~$signed(($unsigned((~|wire58)) * ($unsigned(reg73) ?
          (reg73 + reg65) : wire78[(4'he):(4'he)]))));
      reg82 <= (((reg70[(3'h7):(2'h3)] <= ($unsigned(reg67) || {wire79})) >> $signed($signed((wire58 ?
          reg76 : reg68)))) | (reg71 ?
          $unsigned(wire79[(4'hb):(1'h0)]) : $unsigned((^(reg73 >= (8'hbb))))));
      if ((reg70[(1'h0):(1'h0)] ^ {(&$unsigned((reg64 ? (8'hb4) : (8'haf))))}))
        begin
          if (($signed($signed(reg76)) ^~ $signed($signed($signed($unsigned(reg69))))))
            begin
              reg83 <= $signed((reg64 ?
                  $unsigned(((wire78 + (8'had)) || (reg70 == reg63))) : {reg74[(4'ha):(1'h1)],
                      $unsigned(((8'ha0) ~^ (8'hb3)))}));
              reg84 <= $unsigned($signed((reg71 & reg65[(4'ha):(2'h2)])));
              reg85 <= reg76[(2'h3):(1'h1)];
            end
          else
            begin
              reg83 <= (8'ha4);
            end
          reg86 <= $signed($unsigned(reg81));
          reg87 <= $signed($signed((~|(7'h42))));
        end
      else
        begin
          reg83 <= $signed((reg62 ?
              $signed(((reg81 << (8'ha8)) <<< (wire80 ?
                  reg69 : reg74))) : (8'ha2)));
        end
    end
  assign wire88 = reg82;
  assign wire89 = reg81[(1'h0):(1'h0)];
  assign wire90 = $unsigned((-(reg82[(4'hf):(1'h0)] < (reg72 ?
                      reg66 : (reg85 >>> reg71)))));
  assign wire91 = reg62;
  assign wire92 = (wire89[(2'h3):(1'h1)] - (&$signed((~&$unsigned(reg81)))));
endmodule
