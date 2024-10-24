module top
#(parameter param183 = ((^~(|(((8'hb3) || (8'had)) ~^ (8'hba)))) ^~ (^~(&(~|{(8'hbe), (8'hab)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire182;
  wire [(4'hd):(1'h0)] wire181;
  wire signed [(4'h8):(1'h0)] wire180;
  wire [(4'h8):(1'h0)] wire179;
  wire signed [(4'h9):(1'h0)] wire178;
  wire [(5'h11):(1'h0)] wire177;
  wire signed [(3'h5):(1'h0)] wire175;
  wire [(2'h2):(1'h0)] wire51;
  assign y = {wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire175,
                 wire51,
                 (1'h0)};
  module5 #() modinst52 (.wire6(wire2), .wire7(wire1), .wire9(wire0), .wire8(wire4), .y(wire51), .clk(clk));
  module53 #() modinst176 (.y(wire175), .wire56(wire0), .wire57(wire1), .wire55(wire3), .clk(clk), .wire54(wire4));
  assign wire177 = wire175;
  assign wire178 = (&(7'h40));
  assign wire179 = (8'hac);
  assign wire180 = $unsigned(($signed((8'hbb)) >>> wire0[(3'h5):(2'h3)]));
  assign wire181 = (~&wire180);
  assign wire182 = wire177[(4'h8):(2'h3)];
endmodule

module module53
#(parameter param173 = ((&({(!(8'had)), ((8'ha7) || (8'ha5))} >= ((+(8'had)) + {(8'ha8), (8'hb7)}))) ? (!((&(+(8'ha6))) ? (((8'ha7) >= (8'ha8)) || ((8'haa) > (8'hae))) : (~^((8'had) ? (8'h9e) : (8'hb4))))) : (^~((((8'hbf) ? (8'ha9) : (8'hb2)) ? ((7'h40) - (8'hb1)) : (&(8'had))) ? (((8'hab) << (8'hb0)) & {(8'hab), (8'ha1)}) : ({(8'ha0), (8'h9c)} == (!(8'had)))))), 
parameter param174 = (~param173))
(y, clk, wire54, wire55, wire56, wire57);
  output wire [(32'h193):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire54;
  input wire [(2'h3):(1'h0)] wire55;
  input wire signed [(5'h11):(1'h0)] wire56;
  input wire [(4'hd):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire171;
  wire [(4'ha):(1'h0)] wire146;
  wire [(4'hc):(1'h0)] wire144;
  wire [(2'h2):(1'h0)] wire130;
  wire [(4'ha):(1'h0)] wire129;
  wire [(5'h10):(1'h0)] wire128;
  wire [(3'h4):(1'h0)] wire121;
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg126 = (1'h0);
  reg [(5'h12):(1'h0)] reg127 = (1'h0);
  assign y = {wire171,
                 wire146,
                 wire144,
                 wire130,
                 wire129,
                 wire128,
                 wire121,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire57[(3'h5):(1'h1)])
        begin
          if (((!$unsigned((wire54 ?
              wire57 : (wire54 | wire57)))) == $unsigned({((wire55 ?
                      wire57 : (8'ha9)) ?
                  (|wire56) : (wire54 ? wire54 : wire57))})))
            begin
              reg58 <= $signed(wire57);
              reg59 <= (~^$unsigned((+$signed((wire54 < wire54)))));
              reg60 <= wire55[(1'h0):(1'h0)];
              reg61 <= reg60;
              reg62 <= wire55[(1'h1):(1'h0)];
            end
          else
            begin
              reg58 <= $signed(({(7'h43)} ?
                  (8'hb0) : $signed(((wire57 ^ reg60) + (reg61 ?
                      reg59 : reg59)))));
            end
          if (((8'hbb) ? $unsigned(wire56) : (8'hac)))
            begin
              reg63 <= ((~|(^reg60)) && wire56[(1'h1):(1'h0)]);
              reg64 <= reg62;
              reg65 <= $unsigned($unsigned($unsigned(reg58)));
              reg66 <= reg61[(1'h0):(1'h0)];
            end
          else
            begin
              reg63 <= reg58;
              reg64 <= reg61[(1'h1):(1'h0)];
            end
          if (wire57[(4'hb):(2'h3)])
            begin
              reg67 <= $signed($unsigned((^~(((8'hbf) <= wire55) | reg63))));
              reg68 <= (&reg66[(3'h6):(1'h1)]);
              reg69 <= {(~|{(reg59[(4'he):(4'hb)] == reg65[(1'h1):(1'h0)])}),
                  {($unsigned($unsigned(wire57)) ? wire55 : reg58)}};
            end
          else
            begin
              reg67 <= reg59[(4'hc):(1'h1)];
              reg68 <= $unsigned(reg66[(3'h4):(3'h4)]);
              reg69 <= reg59;
            end
        end
      else
        begin
          reg58 <= (!wire55);
          reg59 <= $unsigned((reg66 ? $unsigned((~^reg69)) : reg62));
        end
      if (reg68)
        begin
          reg70 <= ($signed(reg64[(2'h2):(1'h1)]) ^ (&$signed({$signed(reg69),
              (~^reg61)})));
          reg71 <= (~|($unsigned($signed($signed((7'h41)))) <<< (|reg63[(4'h8):(1'h1)])));
          reg72 <= reg71;
        end
      else
        begin
          if ((wire54[(1'h1):(1'h0)] ? $signed(reg61) : reg69[(2'h3):(1'h1)]))
            begin
              reg70 <= wire57;
            end
          else
            begin
              reg70 <= ($signed(wire55[(1'h0):(1'h0)]) <<< reg67[(3'h5):(3'h4)]);
              reg71 <= reg64;
              reg72 <= wire56;
            end
          reg73 <= $signed((-{reg71[(4'hb):(1'h1)],
              ((reg72 ? reg69 : wire54) ? reg68 : $unsigned((8'h9f)))}));
          reg74 <= (($signed((~^reg58)) ? (8'h9d) : (|reg61)) ?
              wire56[(4'hf):(4'h9)] : $signed($unsigned(((~^(7'h42)) >= (reg63 ?
                  reg73 : reg67)))));
        end
      reg75 <= ((reg61 ~^ (!reg74)) ?
          (({(-(8'hb5)), wire55[(1'h0):(1'h0)]} ?
              ((wire57 && reg58) << $unsigned(wire56)) : (~(!reg64))) ~^ (^~{(reg71 - reg58)})) : {(reg58[(3'h6):(3'h4)] ?
                  ($signed(wire54) >>> wire57) : $unsigned((reg70 || (8'hb0))))});
      reg76 <= $signed($signed((|(+(wire57 * reg73)))));
    end
  module77 #() modinst122 (wire121, clk, reg70, reg62, reg69, reg59, wire54);
  always
    @(posedge clk) begin
      reg123 <= ($unsigned((~^$signed(reg58))) == wire56[(2'h2):(2'h2)]);
      reg124 <= reg63;
      if (reg58)
        begin
          reg125 <= $unsigned(reg60[(2'h2):(1'h1)]);
          reg126 <= ((~&($signed($unsigned(reg74)) >= ((reg71 ?
                  reg70 : reg73) < $signed(reg72)))) ?
              $signed((~&$signed(((8'hbd) * (8'h9e))))) : ((&reg69[(4'ha):(1'h0)]) ^ (^reg63)));
          reg127 <= (^(-(reg62 ? $unsigned($signed(wire57)) : reg65)));
        end
      else
        begin
          reg125 <= reg61;
        end
    end
  assign wire128 = reg68[(4'h8):(3'h4)];
  assign wire129 = $unsigned((reg124 | {((8'ha0) ?
                           (reg61 ? reg76 : reg70) : (reg66 ?
                               reg71 : reg69))}));
  assign wire130 = reg64[(2'h3):(2'h2)];
  module131 #() modinst145 (.y(wire144), .wire135(reg65), .clk(clk), .wire132(reg126), .wire134(reg69), .wire133(reg74));
  assign wire146 = reg127;
  module147 #() modinst172 (.wire151(reg125), .wire150(reg60), .wire152(reg74), .wire149(reg123), .wire148(reg68), .y(wire171), .clk(clk));
endmodule

module module5
#(parameter param50 = (({((!(8'hbf)) - ((8'ha7) ? (8'haf) : (8'hab)))} ? ((((8'hac) * (8'had)) ? {(8'hbe), (8'h9f)} : (-(8'hac))) ? {(&(8'haf)), ((8'had) ? (8'ha5) : (8'hb8))} : (|((8'ha1) ? (8'h9d) : (7'h42)))) : (((^~(8'hb9)) & {(8'had), (8'ha0)}) > (((7'h41) ? (8'h9d) : (8'h9e)) ^ ((8'hb5) ? (8'hbe) : (8'hb0))))) ? (!(((^~(8'haf)) ? (^~(8'hbd)) : (8'hbd)) > ({(8'hab), (8'hb0)} ? ((8'hb0) ? (8'ha3) : (8'hb2)) : (8'hb0)))) : (((((8'hba) ? (8'hae) : (8'hba)) ? ((8'ha7) - (8'ha5)) : ((8'hb6) ? (8'hb3) : (8'h9e))) ? {((8'hb9) * (8'hb4))} : (((8'hbe) > (8'hbc)) ? ((8'haf) ? (8'ha9) : (8'hba)) : (~(8'hb9)))) & ((((8'h9c) <<< (8'hb2)) == (8'hb8)) ? ({(8'hbb), (8'h9e)} ? (~&(8'ha8)) : ((8'ha2) ~^ (8'had))) : (&((8'hb2) ? (7'h44) : (8'hb7)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h1e1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire [(2'h3):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire10;
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire12,
                 wire11,
                 wire10,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire10 = (8'ha9);
  assign wire11 = wire8;
  assign wire12 = (~$unsigned((|wire10)));
  always
    @(posedge clk) begin
      reg13 <= (((^~wire10[(4'hf):(4'ha)]) && (^~$unsigned($unsigned(wire6)))) ?
          wire12[(2'h2):(1'h1)] : wire9);
      if ((((((|wire6) | (wire6 * wire9)) >= wire12[(1'h1):(1'h0)]) ?
          wire8[(1'h1):(1'h0)] : (^~((wire8 ? wire10 : reg13) ?
              (-wire10) : (^~wire12)))) >>> wire12[(4'hb):(4'h8)]))
        begin
          if (reg13[(3'h5):(1'h1)])
            begin
              reg14 <= wire12;
            end
          else
            begin
              reg14 <= {(((~|$unsigned(reg14)) && wire9) <<< (~|{{reg14,
                          reg14}})),
                  wire8};
              reg15 <= (^~(~^$unsigned((-(wire6 >= wire10)))));
              reg16 <= ((reg14 ?
                      ((&(reg13 ?
                          reg13 : wire12)) >>> wire11) : wire11[(3'h5):(1'h0)]) ?
                  wire12 : ((&$signed((^~reg14))) ?
                      $signed($unsigned($unsigned(wire9))) : (($unsigned((8'haf)) >= (~&(8'hba))) + ($signed(wire11) ?
                          wire7[(4'hb):(3'h7)] : (wire12 >= wire6)))));
            end
          reg17 <= $unsigned(wire12);
          reg18 <= (8'ha7);
          reg19 <= (($signed((8'ha5)) ? (~&$signed($signed(reg16))) : {wire6}) ?
              ((&wire6) ?
                  $unsigned((^$unsigned(wire12))) : $signed(wire7)) : ($unsigned($unsigned((reg17 ~^ (8'hbc)))) >= wire10));
        end
      else
        begin
          reg14 <= wire7[(5'h12):(4'h8)];
          reg15 <= $unsigned(wire7[(4'h9):(3'h7)]);
          reg16 <= (8'hb4);
          reg17 <= $signed($unsigned($unsigned($signed($unsigned(reg18)))));
          reg18 <= $signed((~^reg17[(1'h0):(1'h0)]));
        end
      reg20 <= wire10[(4'h8):(2'h3)];
    end
  assign wire21 = ((wire10 ?
                      ((~reg20) <<< (|reg20[(2'h2):(1'h0)])) : ((-$unsigned(reg19)) ?
                          ($signed(reg17) != (wire8 ?
                              (7'h41) : reg13)) : $signed((reg20 ?
                              wire8 : reg13)))) << (-$unsigned(reg18[(3'h5):(1'h0)])));
  assign wire22 = (((wire12 == ((-reg19) == {reg15})) - ((+(wire21 && wire12)) != $unsigned($signed(wire6)))) ?
                      (-$unsigned((~(reg16 ?
                          (8'ha2) : wire21)))) : $signed(reg14));
  assign wire23 = (reg14[(3'h6):(1'h1)] * $signed((({wire12, wire8} ?
                      $unsigned(wire6) : ((8'ha7) ?
                          wire21 : (8'hb6))) * (reg18 ?
                      $signed(wire21) : reg14[(2'h2):(2'h2)]))));
  assign wire24 = wire12;
  always
    @(posedge clk) begin
      reg25 <= $unsigned((8'hbe));
      reg26 <= (reg15 ? reg13[(4'h8):(2'h3)] : reg20);
      reg27 <= $signed($signed(reg14[(4'hc):(1'h1)]));
      if (wire10)
        begin
          reg28 <= $unsigned($unsigned((^(~^(reg16 ? (8'ha1) : wire10)))));
          if ({$unsigned(((&{(8'h9c)}) ?
                  $unsigned(((8'hba) ? reg16 : reg27)) : ((reg26 == (8'hae)) ?
                      $signed(wire24) : $signed(wire24)))),
              (wire24 ?
                  ((|$signed(reg20)) ?
                      $unsigned((reg18 ? wire12 : reg17)) : ({wire9} ?
                          {wire9,
                              reg19} : reg20[(1'h0):(1'h0)])) : ($signed((^~reg19)) ?
                      (reg13[(2'h3):(1'h1)] ?
                          reg14[(3'h6):(2'h3)] : (wire6 ?
                              reg13 : reg18)) : reg13))})
            begin
              reg29 <= $signed($signed(wire10));
              reg30 <= (8'hae);
              reg31 <= (-(~&{$unsigned(((7'h44) || wire6))}));
              reg32 <= reg25[(1'h0):(1'h0)];
            end
          else
            begin
              reg29 <= $signed((+$unsigned(reg13)));
            end
          reg33 <= (&reg25[(1'h0):(1'h0)]);
          reg34 <= $signed((8'hb3));
        end
      else
        begin
          reg28 <= (|((($unsigned(reg32) >= (reg34 ? wire6 : wire23)) ?
              wire10[(3'h4):(2'h2)] : ({wire6} ?
                  $unsigned((8'hbd)) : reg34)) * $unsigned((~|$unsigned(wire9)))));
          reg29 <= $signed((wire23 ? wire12 : reg15));
          if ($unsigned(reg27))
            begin
              reg30 <= wire11;
              reg31 <= $signed($unsigned(reg29));
              reg32 <= {((((reg34 ? wire8 : (7'h43)) != $unsigned((8'ha4))) ?
                      reg32[(1'h0):(1'h0)] : $unsigned((wire22 ?
                          reg28 : reg25))) - reg15[(4'hb):(4'h8)])};
            end
          else
            begin
              reg30 <= reg28[(4'he):(3'h5)];
              reg31 <= $signed($unsigned(wire23[(4'hc):(1'h0)]));
            end
          reg33 <= $unsigned(reg26);
          if ((8'h9f))
            begin
              reg34 <= {((8'h9d) > reg14)};
              reg35 <= $signed($signed((wire12 << (^~wire7[(2'h2):(2'h2)]))));
              reg36 <= $unsigned($unsigned($unsigned(wire11)));
            end
          else
            begin
              reg34 <= ($signed(reg17) != ((((reg30 | wire22) ?
                  (wire10 > wire10) : (reg17 & reg29)) <<< reg27[(5'h10):(2'h2)]) * reg29[(2'h2):(1'h1)]));
              reg35 <= wire6[(2'h2):(2'h2)];
              reg36 <= (~|($unsigned((8'hb7)) ?
                  $signed(((reg16 ? wire21 : (8'h9c)) ?
                      (wire10 || wire6) : (~&wire23))) : $unsigned({(wire21 >= reg36)})));
              reg37 <= $unsigned(reg20[(2'h2):(2'h2)]);
              reg38 <= wire24[(4'hc):(3'h7)];
            end
        end
      reg39 <= ($signed(((^reg15) <<< ((reg20 | wire23) ?
          (!reg15) : {reg19}))) | $signed(wire23[(2'h3):(1'h0)]));
    end
  assign wire40 = wire8[(3'h6):(2'h3)];
  assign wire41 = reg30[(1'h1):(1'h1)];
  assign wire42 = $unsigned(reg32);
  assign wire43 = (($signed({(~&(8'hba)), (reg13 ^ wire11)}) ?
                      (reg26[(2'h2):(2'h2)] ?
                          wire12 : (!{wire8})) : (^~$signed($signed(reg16)))) > (8'ha3));
  assign wire44 = (!(^~reg32[(2'h2):(2'h2)]));
  assign wire45 = $signed((~&($signed({reg30}) + $signed((wire42 + wire23)))));
  assign wire46 = $unsigned(reg29);
  assign wire47 = {(~&$signed($unsigned(wire40)))};
  assign wire48 = (+{wire46[(5'h10):(2'h3)], wire11[(1'h1):(1'h0)]});
  assign wire49 = $unsigned((~&(8'ha3)));
endmodule

module module147  (y, clk, wire152, wire151, wire150, wire149, wire148);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire152;
  input wire signed [(5'h10):(1'h0)] wire151;
  input wire signed [(5'h10):(1'h0)] wire150;
  input wire [(5'h11):(1'h0)] wire149;
  input wire [(5'h14):(1'h0)] wire148;
  wire [(4'h8):(1'h0)] wire166;
  wire signed [(5'h12):(1'h0)] wire165;
  wire [(5'h13):(1'h0)] wire164;
  wire [(3'h7):(1'h0)] wire162;
  wire [(3'h5):(1'h0)] wire161;
  wire [(4'ha):(1'h0)] wire160;
  wire signed [(5'h11):(1'h0)] wire159;
  wire signed [(4'hd):(1'h0)] wire158;
  wire [(5'h11):(1'h0)] wire156;
  wire [(4'hb):(1'h0)] wire155;
  wire signed [(2'h3):(1'h0)] wire154;
  wire [(4'h8):(1'h0)] wire153;
  reg signed [(5'h11):(1'h0)] reg170 = (1'h0);
  reg [(5'h15):(1'h0)] reg169 = (1'h0);
  reg [(3'h6):(1'h0)] reg168 = (1'h0);
  reg [(5'h13):(1'h0)] reg167 = (1'h0);
  reg [(3'h5):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg157 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg163,
                 reg157,
                 (1'h0)};
  assign wire153 = $signed($unsigned(wire151));
  assign wire154 = wire152[(4'he):(4'h8)];
  assign wire155 = ({wire148[(3'h4):(1'h0)]} >>> $unsigned(wire152));
  assign wire156 = ((|wire149) & (wire153[(2'h3):(2'h3)] ?
                       {(|wire153[(3'h4):(2'h3)]), (!(8'hb2))} : wire153));
  always
    @(posedge clk) begin
      reg157 <= wire150;
    end
  assign wire158 = (!wire151[(4'h9):(2'h3)]);
  assign wire159 = $unsigned($unsigned($unsigned((^$unsigned(wire154)))));
  assign wire160 = (-(wire158[(3'h5):(1'h1)] ?
                       $signed(wire150) : {{(wire149 < wire151),
                               $unsigned(reg157)},
                           $signed((&wire149))}));
  assign wire161 = (wire155[(3'h7):(3'h4)] < (8'hb5));
  assign wire162 = (|(-(^wire152[(3'h5):(2'h3)])));
  always
    @(posedge clk) begin
      reg163 <= ($signed($signed(wire153[(2'h2):(1'h0)])) > $signed((8'ha4)));
    end
  assign wire164 = $signed($signed((reg163[(3'h4):(2'h3)] ?
                       wire155 : $signed($unsigned(wire153)))));
  assign wire165 = (8'ha9);
  assign wire166 = $unsigned(reg157[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg167 <= {(wire154[(2'h2):(1'h0)] ~^ (|wire152[(1'h0):(1'h0)]))};
      reg168 <= wire155;
      reg169 <= wire152;
      reg170 <= (wire156[(3'h7):(3'h6)] ?
          ((^~wire164[(4'hd):(2'h2)]) ?
              (~&$unsigned(((8'h9f) << wire148))) : $unsigned(reg163[(1'h1):(1'h0)])) : (^~$signed((reg167 && (wire148 ?
              (8'ha8) : wire165)))));
    end
endmodule

module module131
#(parameter param143 = ((~|((((8'hab) >> (8'h9e)) ? (!(8'ha0)) : (8'ha3)) ? (((8'hbb) + (7'h41)) ^~ (^~(7'h44))) : (~(~(8'hb0))))) ? ((~|(^~(|(8'hbb)))) < (8'hb4)) : (8'hb1)))
(y, clk, wire135, wire134, wire133, wire132);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire135;
  input wire [(3'h6):(1'h0)] wire134;
  input wire [(2'h3):(1'h0)] wire133;
  input wire [(3'h5):(1'h0)] wire132;
  wire [(4'hc):(1'h0)] wire142;
  wire [(4'hd):(1'h0)] wire140;
  wire [(4'h9):(1'h0)] wire139;
  wire signed [(2'h3):(1'h0)] wire138;
  wire [(4'hc):(1'h0)] wire137;
  wire [(5'h11):(1'h0)] wire136;
  reg signed [(5'h10):(1'h0)] reg141 = (1'h0);
  assign y = {wire142,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 reg141,
                 (1'h0)};
  assign wire136 = wire134;
  assign wire137 = wire132;
  assign wire138 = wire134[(2'h3):(2'h2)];
  assign wire139 = wire137;
  assign wire140 = wire139;
  always
    @(posedge clk) begin
      reg141 <= ($unsigned($signed(wire134)) ?
          $unsigned(((~$unsigned(wire137)) != $signed((8'hb2)))) : wire139[(3'h7):(1'h0)]);
    end
  assign wire142 = ({(~&$signed($unsigned((7'h40)))),
                       (^~{wire139,
                           wire132[(1'h0):(1'h0)]})} * (~|wire134[(3'h4):(1'h0)]));
endmodule

module module77  (y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'h1c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire82;
  input wire [(2'h2):(1'h0)] wire81;
  input wire [(3'h7):(1'h0)] wire80;
  input wire [(4'hc):(1'h0)] wire79;
  input wire signed [(2'h2):(1'h0)] wire78;
  wire [(2'h2):(1'h0)] wire120;
  wire signed [(2'h2):(1'h0)] wire119;
  wire signed [(4'hc):(1'h0)] wire118;
  wire [(4'hb):(1'h0)] wire89;
  wire signed [(5'h10):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire87;
  wire [(4'hf):(1'h0)] wire86;
  wire signed [(4'hc):(1'h0)] wire85;
  wire [(3'h7):(1'h0)] wire84;
  wire signed [(4'h8):(1'h0)] wire83;
  reg [(4'ha):(1'h0)] reg117 = (1'h0);
  reg [(4'he):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg115 = (1'h0);
  reg [(4'h9):(1'h0)] reg114 = (1'h0);
  reg [(4'h9):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg112 = (1'h0);
  reg [(4'he):(1'h0)] reg111 = (1'h0);
  reg [(4'he):(1'h0)] reg110 = (1'h0);
  reg [(4'ha):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg105 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg104 = (1'h0);
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  reg [(5'h10):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg101 = (1'h0);
  reg signed [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg99 = (1'h0);
  reg [(5'h12):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  reg [(5'h15):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg92 = (1'h0);
  reg [(4'hf):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
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
                 reg103,
                 reg102,
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
  assign wire83 = $signed((((~wire79[(4'h9):(1'h1)]) ?
                      $signed(((8'hae) ? wire80 : wire81)) : ((wire78 ?
                              wire81 : wire78) ?
                          wire79 : (^(8'ha6)))) || wire78));
  assign wire84 = $unsigned({(+(wire80[(2'h2):(2'h2)] ?
                          $unsigned(wire79) : $signed(wire78))),
                      wire78});
  assign wire85 = wire83;
  assign wire86 = (~|((&$signed(wire78[(1'h1):(1'h0)])) - wire84));
  assign wire87 = wire80[(3'h4):(1'h1)];
  assign wire88 = $unsigned((7'h42));
  assign wire89 = wire86;
  always
    @(posedge clk) begin
      if ($unsigned((~^(wire85[(1'h0):(1'h0)] >> $signed((wire85 ^ wire78))))))
        begin
          reg90 <= (($unsigned($signed($signed(wire80))) <= ((8'hae) ?
                  (wire85[(4'h8):(1'h1)] ?
                      (wire87 || (8'ha4)) : (!wire89)) : $signed((&wire83)))) ?
              (wire82[(4'h9):(3'h4)] ?
                  ((wire78 ? $unsigned(wire85) : wire84[(2'h2):(2'h2)]) ?
                      (+$unsigned(wire80)) : wire89) : (wire83[(3'h6):(3'h4)] ^ (+{wire85,
                      wire87}))) : ((wire83 >>> (&(-wire80))) >= (-wire85[(2'h3):(1'h1)])));
          if ($unsigned($signed($signed($signed((wire89 ? wire84 : wire89))))))
            begin
              reg91 <= wire80;
              reg92 <= wire83[(3'h5):(3'h4)];
              reg93 <= (8'ha5);
              reg94 <= ($signed(($unsigned((8'ha9)) == wire81[(1'h0):(1'h0)])) ^ $unsigned(wire78[(2'h2):(1'h0)]));
            end
          else
            begin
              reg91 <= $unsigned(reg91);
            end
          reg95 <= $signed({$signed((~$signed((7'h42))))});
          reg96 <= {wire84[(3'h6):(3'h4)],
              ((((-reg90) == $unsigned(wire78)) < {(8'had)}) ?
                  {($unsigned(wire84) ? (8'hb5) : (-reg90)),
                      (~^$signed(reg94))} : reg91[(3'h6):(3'h4)])};
          reg97 <= (wire85 * (^wire81[(2'h2):(1'h1)]));
        end
      else
        begin
          reg90 <= (((-$unsigned($signed(reg93))) ?
              wire84[(1'h1):(1'h1)] : $unsigned(($unsigned(wire86) != wire80))) && (|$unsigned((8'ha0))));
          reg91 <= (wire88[(3'h7):(1'h1)] ?
              wire79 : $signed($unsigned(((~&wire84) < (8'hac)))));
        end
      reg98 <= (|$unsigned((7'h42)));
      if ($signed(wire83[(1'h0):(1'h0)]))
        begin
          if (($unsigned(((+$signed(reg93)) >>> $unsigned((wire79 ?
                  wire85 : wire80)))) ?
              wire86 : (8'hbe)))
            begin
              reg99 <= (+(wire86[(3'h4):(2'h3)] ?
                  reg98 : ((8'hb8) ? (~&$unsigned(wire78)) : (!(+reg90)))));
              reg100 <= (reg98[(4'hc):(4'h8)] ?
                  $unsigned($signed((8'hbb))) : $unsigned({((wire83 << reg92) && (reg99 ?
                          wire81 : reg98))}));
              reg101 <= ((^~(wire88[(3'h4):(2'h2)] <<< wire89[(3'h7):(1'h0)])) << $signed($unsigned(wire78[(1'h0):(1'h0)])));
              reg102 <= (reg96[(3'h6):(2'h3)] - {$unsigned(reg95)});
              reg103 <= ((^$unsigned((|wire78[(2'h2):(1'h0)]))) ^ ((($unsigned(wire89) >> ((8'ha9) ?
                      reg96 : reg95)) & $unsigned($signed(wire88))) ?
                  reg94[(1'h0):(1'h0)] : reg101[(5'h12):(3'h5)]));
            end
          else
            begin
              reg99 <= (^$signed((|reg97[(4'h8):(3'h6)])));
              reg100 <= (8'ha6);
              reg101 <= ($unsigned(wire86) ?
                  wire89[(4'hb):(4'ha)] : ((^{wire81}) && $signed((wire78 <= ((8'h9f) ?
                      wire89 : reg93)))));
              reg102 <= (reg99 ?
                  ($unsigned(wire84) && {reg95,
                      $unsigned($signed(reg100))}) : $unsigned(((reg95[(4'h8):(2'h2)] ?
                      reg97[(3'h4):(1'h1)] : (^(8'had))) + {reg97})));
              reg103 <= ($unsigned(wire79[(3'h6):(1'h1)]) ?
                  (((^$unsigned(reg90)) < ((wire85 - wire78) ?
                      ((8'hbe) - (8'hbb)) : (wire79 ?
                          wire85 : (8'hb5)))) + wire88) : (+(&{(wire84 ?
                          reg97 : (8'ha6))})));
            end
          reg104 <= {{(reg103[(1'h1):(1'h1)] & (wire85 ?
                      reg99[(1'h0):(1'h0)] : $signed(reg100))),
                  {(^~(wire80 * wire78)), $signed($unsigned(wire86))}},
              (~(~&reg95))};
        end
      else
        begin
          reg99 <= $unsigned(($signed(($signed(wire89) ?
              wire84 : wire85[(4'h9):(2'h2)])) && ($signed($signed(wire78)) ^ wire80)));
          reg100 <= (~^((($signed(reg103) < (~^wire81)) ^~ $unsigned($signed(reg98))) ?
              wire83 : ({$unsigned(reg92), (reg97 ? reg91 : reg94)} ?
                  reg92 : $signed($signed((8'hb4))))));
          if ({(({wire78[(2'h2):(1'h0)], (reg92 & wire80)} ?
                  (~^reg97[(3'h6):(1'h1)]) : $unsigned($signed(wire86))) ^~ ($unsigned((wire79 ?
                      wire87 : wire88)) ?
                  ((~(7'h44)) < (wire83 || reg95)) : (((7'h43) >>> wire87) >>> (wire86 ~^ reg92)))),
              $unsigned(({wire78[(2'h2):(1'h1)], reg98} ?
                  {$signed(wire85),
                      $unsigned(reg103)} : {wire80[(2'h2):(1'h0)]}))})
            begin
              reg101 <= $unsigned(reg100);
              reg102 <= $signed($unsigned(wire81[(1'h0):(1'h0)]));
              reg103 <= wire81[(1'h0):(1'h0)];
              reg104 <= wire79[(4'hb):(4'ha)];
              reg105 <= reg103;
            end
          else
            begin
              reg101 <= ((~^wire79[(4'hc):(4'ha)]) ?
                  (~^(((&(8'ha1)) << ((8'haf) ? wire78 : wire84)) < (((8'hac) ?
                      reg91 : (8'ha1)) & wire80))) : reg97);
              reg102 <= (-(reg104[(2'h3):(2'h3)] ?
                  $signed($unsigned((reg90 ^~ reg92))) : {($unsigned((8'ha7)) ?
                          (+wire78) : ((8'hb9) << wire87)),
                      $unsigned(wire84)}));
              reg103 <= $signed(reg94);
            end
          if ($signed($signed($unsigned($signed(reg98[(4'hc):(4'h8)])))))
            begin
              reg106 <= ((reg101[(4'h9):(3'h6)] ?
                  (&($signed((8'hb8)) ?
                      $signed(wire85) : $unsigned(reg99))) : wire81) >>> (reg103[(3'h5):(1'h0)] ?
                  (|wire79) : (($signed(reg96) ?
                      $signed(wire89) : $unsigned(reg99)) >>> (-((8'hba) ?
                      wire84 : reg104)))));
              reg107 <= (!({(!(~^wire88)), $unsigned(reg91[(3'h6):(3'h5)])} ?
                  reg95 : $signed(((reg98 ?
                      wire88 : (8'hb8)) || $signed(reg96)))));
              reg108 <= reg97[(1'h1):(1'h0)];
              reg109 <= $signed(((+$signed((reg100 ^~ wire89))) <<< $signed(reg98[(5'h10):(4'h8)])));
            end
          else
            begin
              reg106 <= (({$signed($signed(reg99))} ?
                  reg102 : reg96) >= {(~wire86)});
              reg107 <= reg103;
            end
        end
      if ($signed((~(((&wire89) > (reg99 || wire83)) ? (-reg103) : wire89))))
        begin
          reg110 <= (^$unsigned((reg91 ?
              reg92[(2'h2):(1'h1)] : (^~(reg108 ? reg97 : wire87)))));
          if (wire89[(4'h8):(3'h6)])
            begin
              reg111 <= (~|$signed((^~(8'h9d))));
              reg112 <= ($unsigned((((reg111 <<< wire79) ?
                  {wire82,
                      reg104} : (^~reg92)) | ($unsigned(reg110) ~^ reg98[(4'h9):(4'h9)]))) >>> $signed((reg93[(4'hc):(1'h1)] >>> (~$signed(reg104)))));
              reg113 <= (({{$unsigned(reg109)},
                  (~wire85)} > ({$unsigned(reg111),
                  reg108[(4'hc):(3'h5)]} ^ (!reg105))) || ($signed(reg103[(4'hf):(4'ha)]) ?
                  $unsigned((8'hb6)) : (8'hac)));
              reg114 <= {reg110};
              reg115 <= reg92;
            end
          else
            begin
              reg111 <= wire87[(3'h6):(3'h5)];
              reg112 <= {$unsigned({((wire84 | (8'hae)) != reg106)}), reg96};
              reg113 <= $signed({$unsigned((wire87[(3'h6):(3'h5)] ?
                      wire82[(2'h3):(1'h0)] : wire80[(2'h3):(1'h1)])),
                  (^~{(^~reg105)})});
              reg114 <= ($signed($unsigned(reg112)) ~^ ($unsigned(wire80[(3'h6):(3'h4)]) > $unsigned(reg99)));
            end
          reg116 <= {$unsigned(reg98),
              {(({wire81} & $unsigned(wire87)) ^ $signed($unsigned(wire89))),
                  $signed($signed($signed((8'hb6))))}};
          reg117 <= ((($signed(reg112[(3'h6):(1'h0)]) != {(reg102 ?
                          reg107 : reg96),
                      $signed(reg108)}) ?
                  ((8'hbb) ?
                      $unsigned((-reg97)) : $signed($signed(wire82))) : (~|{(reg95 >= reg96),
                      $unsigned(reg95)})) ?
              ($signed(reg109) ?
                  ($unsigned(((7'h44) && (8'hbf))) | reg98[(2'h2):(2'h2)]) : ($unsigned((reg101 ^ (8'had))) && ((wire82 | reg97) >= $signed(reg103)))) : $signed({$unsigned((&(8'haf)))}));
        end
      else
        begin
          reg110 <= (~&$unsigned(reg91));
        end
    end
  assign wire118 = reg97;
  assign wire119 = (8'h9c);
  assign wire120 = $signed({$unsigned(((reg116 ? reg105 : reg106) ?
                           wire84[(1'h0):(1'h0)] : reg101[(1'h1):(1'h0)]))});
endmodule
