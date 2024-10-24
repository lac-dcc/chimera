module top
#(parameter param359 = (((8'had) ? (((~|(8'hb8)) >> {(8'ha0)}) & (((8'hbb) ? (8'hbc) : (8'ha2)) - ((8'h9d) >= (8'ha0)))) : (~(((8'hb4) << (8'hb7)) ? (~|(8'hab)) : ((8'ha9) ? (8'h9d) : (8'hbc))))) ? ((|(((8'hbb) >>> (8'ha9)) != ((8'ha4) ? (8'hac) : (8'hae)))) ~^ ((^~(7'h40)) <<< (((8'ha0) + (8'hbb)) ? ((8'haa) > (8'hbd)) : ((8'haa) ? (8'hbe) : (8'hba))))) : (^~(8'ha6))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h292):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire0;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire signed [(4'h8):(1'h0)] wire357;
  wire signed [(4'h8):(1'h0)] wire356;
  wire signed [(4'h8):(1'h0)] wire355;
  wire signed [(5'h13):(1'h0)] wire343;
  wire signed [(4'he):(1'h0)] wire342;
  wire [(4'hf):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire340;
  reg [(4'hb):(1'h0)] reg358 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg354 = (1'h0);
  reg [(4'hc):(1'h0)] reg353 = (1'h0);
  reg [(5'h13):(1'h0)] reg352 = (1'h0);
  reg [(5'h12):(1'h0)] reg351 = (1'h0);
  reg [(3'h5):(1'h0)] reg350 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg349 = (1'h0);
  reg [(4'hd):(1'h0)] reg348 = (1'h0);
  reg [(4'hf):(1'h0)] reg347 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg346 = (1'h0);
  reg [(5'h12):(1'h0)] reg345 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  assign y = {wire357,
                 wire356,
                 wire355,
                 wire343,
                 wire342,
                 wire4,
                 wire5,
                 wire38,
                 wire340,
                 reg358,
                 reg354,
                 reg353,
                 reg352,
                 reg351,
                 reg350,
                 reg349,
                 reg348,
                 reg347,
                 reg346,
                 reg345,
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
                 (1'h0)};
  assign wire4 = (wire2[(5'h11):(4'h9)] <= wire1);
  assign wire5 = wire1;
  always
    @(posedge clk) begin
      if ({$unsigned((~$signed((&wire0))))})
        begin
          reg6 <= wire2;
          if (wire2[(3'h6):(3'h4)])
            begin
              reg7 <= wire0;
              reg8 <= (({$unsigned({wire4,
                          wire0})} >>> $signed(((~&wire0) <<< (~&wire2)))) ?
                  $unsigned((~|$unsigned({wire4}))) : reg6);
              reg9 <= {{(reg7[(4'h8):(2'h2)] ?
                          reg7[(1'h0):(1'h0)] : $unsigned((-reg7))),
                      $unsigned((!$unsigned(wire3)))}};
              reg10 <= (reg8[(1'h1):(1'h0)] ?
                  $unsigned($signed((^~wire1))) : reg7[(4'h8):(2'h2)]);
              reg11 <= wire5;
            end
          else
            begin
              reg7 <= (~(8'hbd));
              reg8 <= reg10;
            end
          reg12 <= $unsigned(reg11[(1'h1):(1'h1)]);
          reg13 <= $signed(reg10);
          reg14 <= $unsigned(((^{(reg10 & (8'ha6)),
              $unsigned(wire2)}) <<< ($unsigned(wire4[(3'h6):(3'h5)]) > wire3[(4'hb):(4'ha)])));
        end
      else
        begin
          reg6 <= reg7[(3'h5):(3'h4)];
        end
      if ($signed(($signed({(reg11 ? reg7 : (8'hae)),
          reg12}) >> $signed(reg11[(3'h4):(2'h2)]))))
        begin
          if ($signed($unsigned({wire5[(2'h3):(2'h2)], reg13[(4'hd):(3'h6)]})))
            begin
              reg15 <= (((^~wire2[(4'he):(4'hc)]) > reg6) ?
                  reg13[(4'h9):(4'h9)] : $unsigned(reg14));
            end
          else
            begin
              reg15 <= (^~(8'hac));
              reg16 <= $signed(reg14);
              reg17 <= reg13[(3'h6):(3'h5)];
              reg18 <= reg6[(3'h7):(3'h7)];
            end
          reg19 <= reg9[(4'hb):(3'h6)];
          reg20 <= (($signed(((wire4 ? reg16 : reg13) ?
              $signed(reg7) : {wire5})) <<< (~|((reg14 ? (8'hbb) : wire1) ?
              (wire5 != wire5) : reg17))) - {reg8});
        end
      else
        begin
          if ((reg17 ? wire3 : reg8[(3'h5):(2'h3)]))
            begin
              reg15 <= {(((8'hb0) ?
                      {reg12, (7'h40)} : ($unsigned(reg7) ?
                          $unsigned((8'hbc)) : $unsigned((8'h9d)))) <<< wire0)};
              reg16 <= reg18[(3'h4):(1'h0)];
              reg17 <= reg7;
              reg18 <= $unsigned(reg20[(3'h5):(1'h1)]);
            end
          else
            begin
              reg15 <= reg7;
            end
          reg19 <= (reg17[(5'h11):(4'he)] ?
              ($signed($unsigned($signed(reg19))) ?
                  $signed((~^$signed(reg9))) : $signed({((8'ha9) ?
                          reg16 : reg11)})) : $signed(reg19));
          reg20 <= {{(wire3 ? $signed((reg17 ? reg17 : wire2)) : reg10),
                  $signed(((reg16 ? wire0 : reg8) ?
                      (reg16 != reg7) : $signed(wire1)))},
              wire1};
          reg21 <= $unsigned($unsigned({reg7[(3'h6):(2'h3)]}));
        end
    end
  always
    @(posedge clk) begin
      reg22 <= (^~(^(reg17[(1'h1):(1'h1)] ?
          ((reg17 | reg16) ?
              reg17[(3'h7):(3'h4)] : reg6[(3'h5):(1'h1)]) : $signed((~|(8'haa))))));
      reg23 <= ($unsigned(($unsigned(reg16[(3'h6):(2'h3)]) * (!(&reg6)))) - $unsigned((!$signed((reg11 ?
          reg20 : reg19)))));
      reg24 <= (-$unsigned(reg23));
      if ((8'hb0))
        begin
          if (reg19[(3'h4):(2'h2)])
            begin
              reg25 <= ($unsigned($signed($unsigned($unsigned(wire4)))) ?
                  reg22 : reg8);
              reg26 <= $signed((wire2 ?
                  $unsigned($signed(wire2)) : (((wire0 ? reg10 : reg12) ?
                          $unsigned(reg7) : reg22[(2'h2):(2'h2)]) ?
                      reg15[(3'h4):(2'h2)] : ((-reg14) ?
                          $unsigned(reg7) : reg8[(1'h1):(1'h1)]))));
              reg27 <= (~$unsigned($signed(reg11[(4'h9):(2'h3)])));
              reg28 <= (reg16[(1'h1):(1'h1)] ?
                  (&({wire5,
                      (wire0 ?
                          wire0 : reg15)} >> (~|(~^reg18)))) : $signed($unsigned(wire0)));
              reg29 <= ({wire4[(1'h0):(1'h0)]} ~^ wire3);
            end
          else
            begin
              reg25 <= reg26[(3'h7):(3'h7)];
              reg26 <= reg22[(1'h1):(1'h0)];
              reg27 <= {$signed((^reg7[(3'h4):(1'h1)]))};
              reg28 <= wire2[(5'h12):(4'hf)];
            end
          reg30 <= $unsigned(reg6[(4'hb):(1'h1)]);
          reg31 <= $signed(($signed($unsigned(reg23)) || (wire0[(1'h1):(1'h0)] ^ reg23)));
          reg32 <= {(^(reg14 ~^ ($signed(reg16) ^~ {reg28, (8'h9d)}))),
              ($unsigned((~^{reg18, reg12})) ?
                  {($unsigned((7'h43)) <<< (8'hb8))} : {reg28[(1'h0):(1'h0)]})};
          if (reg25[(3'h4):(1'h1)])
            begin
              reg33 <= ($unsigned(($unsigned((~|(8'hb3))) ?
                      (|(reg19 + reg25)) : (8'ha6))) ?
                  (~|((~|$signed(wire1)) != ($signed((8'haa)) * (reg22 ^ (7'h43))))) : {(~($signed((8'hb4)) ~^ reg15[(3'h5):(1'h0)]))});
              reg34 <= (~reg26[(4'hb):(4'hb)]);
              reg35 <= (^~reg25);
            end
          else
            begin
              reg33 <= wire1;
              reg34 <= $signed((~^$signed(reg23[(1'h0):(1'h0)])));
              reg35 <= {reg34[(2'h3):(2'h2)]};
              reg36 <= {{(!(!{reg33}))}, (&reg12[(3'h4):(2'h2)])};
              reg37 <= ($signed((!(~&reg22[(2'h2):(1'h1)]))) ?
                  $signed((((~|(8'haf)) && (wire0 < reg13)) ?
                      (reg34 >> $signed(reg13)) : (reg21[(1'h0):(1'h0)] ?
                          {reg8} : wire2))) : (~{$signed((8'h9d))}));
            end
        end
      else
        begin
          reg25 <= reg33;
          reg26 <= (~&(^({reg33[(4'ha):(4'h9)]} ?
              (|(wire5 ? reg23 : (8'hb1))) : (reg12 <= reg31[(4'hd):(3'h7)]))));
        end
    end
  assign wire38 = {$unsigned(($signed(reg22) + $signed(reg36[(5'h12):(2'h3)]))),
                      $unsigned(reg30)};
  module39 #() modinst341 (wire340, clk, reg31, wire4, reg30, reg24);
  assign wire342 = ((^((~&$unsigned(reg33)) >>> $signed($unsigned(reg19)))) ^ reg21[(4'h8):(2'h3)]);
  module231 #() modinst344 (.wire232(wire1), .wire233(reg15), .y(wire343), .clk(clk), .wire235(wire3), .wire234(reg21));
  always
    @(posedge clk) begin
      if (reg34)
        begin
          if ((($signed((reg6[(3'h7):(1'h1)] ?
                      (reg6 ? wire343 : (8'hb2)) : (+reg15))) ?
                  ((reg21 ?
                      (^wire0) : $unsigned(reg28)) * $unsigned((reg19 <<< reg12))) : $signed((((8'hb7) ?
                          reg13 : (8'hbd)) ?
                      $signed(reg6) : $signed((8'hba))))) ?
              (+(^reg19[(1'h1):(1'h1)])) : (reg21[(1'h1):(1'h1)] ?
                  (reg26 <<< $signed((|wire342))) : ($unsigned($unsigned((8'ha0))) || $unsigned((reg27 ?
                      reg31 : (8'ha1)))))))
            begin
              reg345 <= ($unsigned((8'hbb)) ?
                  $unsigned(reg32[(4'he):(3'h6)]) : ($signed((wire5[(1'h0):(1'h0)] ?
                          $signed(reg10) : $signed(wire0))) ?
                      ($unsigned((|reg9)) ~^ wire0) : (8'hb6)));
              reg346 <= (&(+$signed((reg34[(3'h4):(3'h4)] + $unsigned(reg16)))));
              reg347 <= ((reg345 & $signed(($unsigned(wire0) < (reg13 ?
                  wire343 : reg25)))) ~^ reg36);
            end
          else
            begin
              reg345 <= (~&(((~&$unsigned(wire0)) ?
                      (~$signed(reg32)) : reg26[(3'h4):(2'h2)]) ?
                  (((reg14 ? reg35 : reg8) ?
                      {wire2,
                          reg16} : wire4[(3'h5):(1'h0)]) > ($signed(reg346) ?
                      (wire1 ^~ reg13) : reg35[(4'hd):(1'h1)])) : {$signed(reg345[(1'h0):(1'h0)])}));
              reg346 <= ({reg33[(1'h0):(1'h0)]} ?
                  (^(~|$signed((reg28 && (8'hac))))) : reg346[(1'h0):(1'h0)]);
              reg347 <= wire0;
              reg348 <= ((!$unsigned({$signed(reg26)})) ?
                  ((reg10[(2'h3):(1'h1)] + wire3[(4'hc):(4'ha)]) ?
                      (($unsigned(reg31) && (reg25 ? wire3 : wire3)) ?
                          $unsigned(reg25[(3'h6):(3'h5)]) : {reg23[(1'h0):(1'h0)]}) : (((reg27 ?
                          (8'ha1) : wire38) >> wire0[(2'h2):(1'h1)]) + ((reg346 <= reg27) ?
                          (~reg21) : reg6[(1'h0):(1'h0)]))) : reg9[(2'h3):(2'h3)]);
              reg349 <= {{reg20[(2'h2):(1'h1)]},
                  $unsigned($signed({wire3[(5'h12):(4'ha)]}))};
            end
          reg350 <= ((reg15[(3'h7):(1'h0)] >>> wire340) ?
              ($unsigned($unsigned($signed(wire0))) & {$unsigned(wire343[(1'h1):(1'h0)])}) : reg12[(3'h5):(2'h2)]);
        end
      else
        begin
          reg345 <= $signed(reg17);
          reg346 <= {$signed(reg24[(3'h7):(2'h2)]),
              $unsigned((reg17 ?
                  (|$signed((8'ha6))) : ((^~reg35) ?
                      reg348[(4'hb):(1'h0)] : (reg24 || reg9))))};
          if (($signed($signed($unsigned((reg10 || reg34)))) ?
              (reg347[(4'hc):(2'h3)] != (^~(~{reg13, reg11}))) : reg6))
            begin
              reg347 <= reg349;
              reg348 <= (~^$signed((~$signed($unsigned((8'haa))))));
              reg349 <= $unsigned(($signed(({reg32, wire2} ?
                  (reg32 && (8'ha9)) : (8'hb0))) * reg11));
            end
          else
            begin
              reg347 <= {(((reg7 ? (reg346 >> wire343) : reg35[(2'h3):(2'h3)]) ?
                          (~|(|reg10)) : $unsigned(reg14[(2'h3):(1'h0)])) ?
                      (((~reg21) << $signed((8'hae))) ?
                          reg31 : {$signed(reg350)}) : $unsigned($signed((reg20 >>> reg11))))};
              reg348 <= $unsigned(($unsigned(wire0[(3'h6):(3'h4)]) | wire38));
              reg349 <= $unsigned($signed((~$signed($signed(reg349)))));
              reg350 <= reg349[(2'h2):(1'h1)];
              reg351 <= $unsigned((8'ha0));
            end
          if ($signed({(-($signed(reg34) << reg26[(2'h2):(1'h1)])),
              {((^wire38) ? (reg19 || (8'hbe)) : $signed(reg34))}}))
            begin
              reg352 <= $unsigned({$unsigned($unsigned((|reg9))),
                  (({reg10, reg351} ? (reg351 ? (8'ha7) : reg27) : (~|reg32)) ?
                      $unsigned(reg351) : {(~|reg349), $signed(reg30)})});
            end
          else
            begin
              reg352 <= wire340;
              reg353 <= (+reg28);
            end
          reg354 <= $signed({($unsigned((~|wire3)) ?
                  wire1[(2'h2):(1'h1)] : reg30)});
        end
    end
  assign wire355 = reg346;
  assign wire356 = reg35[(3'h7):(2'h2)];
  assign wire357 = $unsigned((+reg32[(4'hc):(4'h9)]));
  always
    @(posedge clk) begin
      reg358 <= $unsigned(reg18[(3'h7):(3'h6)]);
    end
endmodule

module module39
#(parameter param339 = {((((|(8'hbf)) ? (~(8'hbf)) : (~&(8'hb6))) ? ((~|(8'hba)) | (!(8'ha8))) : (~|((7'h42) ? (8'hb6) : (8'ha2)))) ? (~(~((8'ha6) >>> (8'ha6)))) : ((((8'hbd) ? (8'h9f) : (8'haa)) ^~ ((8'hae) > (8'hac))) > {((8'hb4) ? (8'haa) : (8'hb3)), ((8'hb6) ? (7'h43) : (8'hbf))})), ({((~^(8'haa)) && ((8'h9c) ? (8'ha3) : (8'hb6))), {((7'h42) ? (8'ha5) : (8'hae)), ((8'hb3) && (8'hbb))}} != (^(^~((8'hb1) ? (8'hb5) : (8'hbf)))))})
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h258):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire43;
  input wire signed [(4'hf):(1'h0)] wire42;
  input wire signed [(4'h8):(1'h0)] wire41;
  input wire signed [(4'he):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire338;
  wire [(2'h3):(1'h0)] wire337;
  wire signed [(4'hb):(1'h0)] wire333;
  wire [(4'he):(1'h0)] wire261;
  wire signed [(3'h4):(1'h0)] wire259;
  wire [(2'h2):(1'h0)] wire230;
  wire [(4'h9):(1'h0)] wire211;
  wire [(5'h13):(1'h0)] wire210;
  wire [(3'h7):(1'h0)] wire208;
  wire signed [(4'hb):(1'h0)] wire81;
  wire signed [(5'h12):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire44;
  wire [(3'h5):(1'h0)] wire142;
  wire [(5'h14):(1'h0)] wire144;
  wire signed [(2'h3):(1'h0)] wire206;
  wire [(5'h11):(1'h0)] wire335;
  reg [(2'h2):(1'h0)] reg271 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg270 = (1'h0);
  reg [(4'hf):(1'h0)] reg269 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg268 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg267 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg266 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg265 = (1'h0);
  reg [(4'hc):(1'h0)] reg264 = (1'h0);
  reg [(5'h11):(1'h0)] reg263 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg262 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg229 = (1'h0);
  reg [(2'h2):(1'h0)] reg228 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg227 = (1'h0);
  reg [(3'h6):(1'h0)] reg226 = (1'h0);
  reg [(5'h12):(1'h0)] reg225 = (1'h0);
  reg [(4'he):(1'h0)] reg224 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg223 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg222 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg221 = (1'h0);
  reg [(2'h2):(1'h0)] reg220 = (1'h0);
  reg [(5'h15):(1'h0)] reg219 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg217 = (1'h0);
  reg [(3'h6):(1'h0)] reg216 = (1'h0);
  reg [(3'h6):(1'h0)] reg215 = (1'h0);
  reg [(5'h10):(1'h0)] reg214 = (1'h0);
  reg [(4'he):(1'h0)] reg213 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg212 = (1'h0);
  reg [(4'h9):(1'h0)] reg209 = (1'h0);
  reg [(4'he):(1'h0)] reg146 = (1'h0);
  reg [(3'h5):(1'h0)] reg145 = (1'h0);
  assign y = {wire338,
                 wire337,
                 wire333,
                 wire261,
                 wire259,
                 wire230,
                 wire211,
                 wire210,
                 wire208,
                 wire81,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire142,
                 wire144,
                 wire206,
                 wire335,
                 reg271,
                 reg270,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
                 reg264,
                 reg263,
                 reg262,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg209,
                 reg146,
                 reg145,
                 (1'h0)};
  assign wire44 = ($signed((($unsigned(wire40) >= {(8'hb4)}) ?
                          {{(8'hb8), wire43}} : (((8'ha7) ?
                              wire43 : wire40) - wire42[(4'hb):(3'h5)]))) ?
                      (wire41 ?
                          (~^($signed(wire42) ?
                              (wire41 ?
                                  wire41 : wire43) : wire42)) : $unsigned($signed($unsigned(wire42)))) : ($unsigned(({wire40} << (wire43 ?
                          wire43 : wire43))) ~^ wire40[(1'h1):(1'h1)]));
  assign wire45 = wire41;
  assign wire46 = $unsigned($signed(wire43));
  assign wire47 = $signed($signed(($unsigned((wire43 + wire44)) <<< $unsigned({wire41,
                      (8'hbf)}))));
  assign wire48 = ((8'hac) ?
                      wire42[(4'hd):(3'h7)] : (wire47 ?
                          ($signed(wire40[(4'h8):(2'h3)]) | (~(!wire41))) : $unsigned(wire47[(4'hc):(4'h8)])));
  module49 #() modinst82 (.y(wire81), .wire52(wire43), .clk(clk), .wire54(wire45), .wire53(wire46), .wire51(wire42), .wire50(wire44));
  module83 #() modinst143 (.y(wire142), .wire86(wire42), .wire85(wire44), .wire84(wire45), .wire87(wire40), .clk(clk));
  assign wire144 = (((~&$signed($unsigned(wire81))) && (~(wire42 && wire142[(1'h1):(1'h1)]))) ?
                       (~|((wire45[(4'he):(1'h0)] <= wire42) ?
                           wire48[(4'h9):(3'h7)] : (((8'ha3) ?
                                   wire40 : wire46) ?
                               (|wire47) : wire44[(5'h13):(5'h11)]))) : wire45);
  always
    @(posedge clk) begin
      reg145 <= wire81[(1'h1):(1'h0)];
      reg146 <= ((wire42[(4'hd):(4'h9)] <<< (((wire41 >> wire144) <<< (wire48 < wire45)) ?
          $unsigned((wire48 ?
              reg145 : wire40)) : wire44)) | ($unsigned((&(&wire81))) ?
          wire81 : (8'h9f)));
    end
  module147 #() modinst207 (wire206, clk, wire42, wire43, wire46, wire45, wire81);
  assign wire208 = wire142;
  always
    @(posedge clk) begin
      reg209 <= $unsigned((((wire43 ?
          (~^(8'hb5)) : (wire47 ^~ wire48)) << $unsigned($unsigned(reg146))) >= (wire46 != (~^(~|wire41)))));
    end
  assign wire210 = $unsigned((wire48[(1'h0):(1'h0)] ?
                       (^~$signed((wire43 ? wire48 : (8'h9e)))) : wire48));
  assign wire211 = $signed({((!(wire45 ? wire142 : (8'hae))) ?
                           reg145[(1'h0):(1'h0)] : wire44[(4'h9):(4'h8)])});
  always
    @(posedge clk) begin
      reg212 <= wire48[(4'hb):(4'hb)];
      if ($signed(wire142[(3'h4):(2'h3)]))
        begin
          reg213 <= {(|(~$signed($unsigned(wire41)))), reg146[(4'hc):(2'h3)]};
          reg214 <= ((~^$signed({$signed(wire43),
              $unsigned(reg146)})) >= wire206[(2'h2):(1'h0)]);
          if ($unsigned(($signed($signed((~(8'haa)))) ?
              ($unsigned($signed((8'hb5))) ?
                  $signed((reg214 ?
                      wire41 : (8'hb0))) : $signed($signed(wire46))) : $unsigned($unsigned((wire44 ?
                  reg209 : reg146))))))
            begin
              reg215 <= wire206[(1'h0):(1'h0)];
              reg216 <= ($unsigned({wire210[(4'he):(4'hd)],
                  ((+wire42) - $signed(reg213))}) >= (({wire47, wire210} ?
                  (((7'h43) | wire42) ?
                      $signed(wire48) : wire206[(2'h3):(1'h0)]) : wire206[(1'h0):(1'h0)]) - ({reg214[(4'hd):(3'h4)],
                      (wire44 < wire40)} ?
                  reg209[(3'h5):(2'h2)] : wire46[(4'hc):(3'h7)])));
              reg217 <= (~^{(!$signed($unsigned(reg215)))});
              reg218 <= wire206[(1'h1):(1'h1)];
              reg219 <= reg213[(1'h0):(1'h0)];
            end
          else
            begin
              reg215 <= reg213[(4'hb):(3'h4)];
            end
          if ((^wire46))
            begin
              reg220 <= (~|(8'hae));
              reg221 <= (reg216[(1'h1):(1'h1)] != $signed($signed(reg219[(5'h11):(4'hc)])));
              reg222 <= $signed($unsigned(((~(|wire211)) ?
                  $signed({reg218, reg218}) : ($signed((8'h9f)) != (wire206 ?
                      wire144 : (8'h9c))))));
              reg223 <= (($signed(((reg209 != wire43) ~^ (~|reg214))) ?
                      $unsigned(((reg209 - (8'hbf)) ^ (!reg216))) : (($unsigned(wire40) ^ $signed((8'ha1))) ?
                          $unsigned(reg209) : (8'ha7))) ?
                  wire45 : $signed(wire45[(5'h11):(3'h4)]));
            end
          else
            begin
              reg220 <= reg221;
              reg221 <= reg215[(3'h4):(2'h2)];
              reg222 <= reg221[(4'hf):(3'h6)];
              reg223 <= $signed((|(~^wire41[(1'h0):(1'h0)])));
              reg224 <= wire45;
            end
        end
      else
        begin
          reg213 <= (wire210[(3'h7):(3'h7)] ?
              wire44[(2'h2):(1'h0)] : reg220[(2'h2):(1'h0)]);
          reg214 <= $unsigned($signed($unsigned(wire42[(1'h1):(1'h0)])));
          reg215 <= {$signed($unsigned($unsigned((wire43 == (8'hae)))))};
          reg216 <= {((&reg214) || {(~^(!reg218)), (~|wire206)}),
              (reg221[(4'he):(4'hb)] ? wire42 : (+(!(wire48 >= wire43))))};
        end
      reg225 <= $unsigned(($signed($unsigned((wire47 ?
          (7'h44) : reg215))) >> $signed($signed($signed((8'h9c))))));
      if ($signed($signed(wire42[(4'h8):(3'h6)])))
        begin
          reg226 <= {$signed((wire211 ?
                  ($unsigned(reg222) ?
                      (-wire144) : (reg215 ?
                          wire206 : reg213)) : $signed(wire211)))};
          reg227 <= (+$signed($unsigned($unsigned($signed(wire41)))));
        end
      else
        begin
          reg226 <= wire142[(3'h5):(1'h1)];
          reg227 <= $signed($signed(reg216));
          reg228 <= $unsigned(((($signed(reg226) | (reg218 * wire45)) ?
              ((-reg223) ?
                  (wire144 & reg222) : wire43) : $unsigned((8'hb7))) <= {(~^((8'ha4) ?
                  reg218 : reg225)),
              wire40}));
        end
      reg229 <= reg227[(4'hc):(2'h2)];
    end
  assign wire230 = $signed((wire45[(5'h11):(4'h8)] + ((~|(reg225 | reg209)) + $unsigned(reg226))));
  module231 #() modinst260 (wire259, clk, wire47, reg145, reg227, wire211);
  assign wire261 = $unsigned({reg216[(2'h2):(1'h0)]});
  always
    @(posedge clk) begin
      reg262 <= {wire211};
      if ((+(~|(wire211 < (((8'ha5) ^ wire230) ^~ {wire210, wire42})))))
        begin
          reg263 <= reg209[(1'h0):(1'h0)];
          reg264 <= (reg262[(4'he):(4'hc)] ?
              wire261[(4'h9):(3'h4)] : (((-(~|reg146)) ?
                  ((+wire43) ^ reg223[(5'h12):(2'h2)]) : ($unsigned(wire40) & (8'h9e))) >>> {(reg212 ?
                      $signed(reg225) : (~reg215))}));
          reg265 <= $unsigned(($signed(((wire142 ~^ wire45) ?
                  $unsigned(reg214) : reg227)) ?
              (!{(reg215 && reg222)}) : wire43[(4'he):(3'h7)]));
          reg266 <= (~&(((-reg219[(1'h1):(1'h0)]) ?
                  (~(reg217 - reg215)) : (reg145 ?
                      {wire44} : $unsigned(reg265))) ?
              (!reg221) : (wire44[(4'h8):(2'h3)] ?
                  {(reg225 ? reg213 : (8'hb6))} : $signed(reg221))));
        end
      else
        begin
          reg263 <= reg217[(1'h1):(1'h1)];
          reg264 <= reg218[(4'he):(3'h6)];
        end
      reg267 <= $unsigned(wire48[(1'h1):(1'h1)]);
      if ((^~(8'ha6)))
        begin
          reg268 <= (8'hb9);
          reg269 <= (!wire144);
          reg270 <= reg269;
          reg271 <= wire210[(3'h4):(1'h0)];
        end
      else
        begin
          if (($signed((wire48[(2'h3):(2'h3)] <<< reg224)) && $unsigned({{wire208[(2'h3):(1'h1)]}})))
            begin
              reg268 <= reg215;
              reg269 <= wire261;
            end
          else
            begin
              reg268 <= $signed(wire211[(4'h9):(2'h3)]);
              reg269 <= ($signed(($signed((~^wire42)) < wire44[(5'h11):(5'h11)])) == $signed(wire259));
            end
        end
    end
  module272 #() modinst334 (.wire275(reg213), .y(wire333), .wire276(reg263), .wire274(reg217), .wire273(wire46), .clk(clk));
  module231 #() modinst336 (wire335, clk, wire48, reg263, reg219, reg227);
  assign wire337 = ((~$unsigned(wire81)) ? $unsigned(reg146) : reg220);
  assign wire338 = reg226;
endmodule

module module272  (y, clk, wire276, wire275, wire274, wire273);
  output wire [(32'h2b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire276;
  input wire signed [(4'hd):(1'h0)] wire275;
  input wire signed [(5'h11):(1'h0)] wire274;
  input wire signed [(3'h4):(1'h0)] wire273;
  wire [(5'h11):(1'h0)] wire332;
  wire [(2'h3):(1'h0)] wire326;
  wire signed [(2'h2):(1'h0)] wire325;
  wire [(4'hc):(1'h0)] wire324;
  wire [(4'he):(1'h0)] wire323;
  wire signed [(4'h8):(1'h0)] wire309;
  wire [(5'h12):(1'h0)] wire308;
  wire signed [(4'ha):(1'h0)] wire307;
  wire signed [(5'h11):(1'h0)] wire306;
  wire [(4'ha):(1'h0)] wire305;
  wire [(5'h13):(1'h0)] wire304;
  wire [(4'h8):(1'h0)] wire303;
  wire [(5'h14):(1'h0)] wire302;
  reg [(3'h5):(1'h0)] reg331 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg330 = (1'h0);
  reg [(5'h12):(1'h0)] reg329 = (1'h0);
  reg [(5'h15):(1'h0)] reg328 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg327 = (1'h0);
  reg [(3'h4):(1'h0)] reg322 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg321 = (1'h0);
  reg [(5'h15):(1'h0)] reg320 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg319 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg318 = (1'h0);
  reg [(5'h12):(1'h0)] reg317 = (1'h0);
  reg [(4'hf):(1'h0)] reg316 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg315 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg314 = (1'h0);
  reg [(3'h5):(1'h0)] reg313 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg312 = (1'h0);
  reg [(4'hd):(1'h0)] reg311 = (1'h0);
  reg [(5'h11):(1'h0)] reg310 = (1'h0);
  reg [(4'hd):(1'h0)] reg301 = (1'h0);
  reg [(3'h4):(1'h0)] reg300 = (1'h0);
  reg [(4'hc):(1'h0)] reg299 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg298 = (1'h0);
  reg [(4'hf):(1'h0)] reg297 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg296 = (1'h0);
  reg [(4'hd):(1'h0)] reg295 = (1'h0);
  reg [(4'hb):(1'h0)] reg294 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg293 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg292 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg291 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg290 = (1'h0);
  reg signed [(4'he):(1'h0)] reg289 = (1'h0);
  reg signed [(4'he):(1'h0)] reg288 = (1'h0);
  reg [(2'h2):(1'h0)] reg287 = (1'h0);
  reg [(5'h13):(1'h0)] reg286 = (1'h0);
  reg signed [(4'he):(1'h0)] reg285 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg284 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg283 = (1'h0);
  reg [(4'h9):(1'h0)] reg282 = (1'h0);
  reg [(4'hd):(1'h0)] reg281 = (1'h0);
  reg [(5'h13):(1'h0)] reg280 = (1'h0);
  reg signed [(4'he):(1'h0)] reg279 = (1'h0);
  reg [(5'h14):(1'h0)] reg278 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg277 = (1'h0);
  assign y = {wire332,
                 wire326,
                 wire325,
                 wire324,
                 wire323,
                 wire309,
                 wire308,
                 wire307,
                 wire306,
                 wire305,
                 wire304,
                 wire303,
                 wire302,
                 reg331,
                 reg330,
                 reg329,
                 reg328,
                 reg327,
                 reg322,
                 reg321,
                 reg320,
                 reg319,
                 reg318,
                 reg317,
                 reg316,
                 reg315,
                 reg314,
                 reg313,
                 reg312,
                 reg311,
                 reg310,
                 reg301,
                 reg300,
                 reg299,
                 reg298,
                 reg297,
                 reg296,
                 reg295,
                 reg294,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
                 reg283,
                 reg282,
                 reg281,
                 reg280,
                 reg279,
                 reg278,
                 reg277,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire273)
        begin
          reg277 <= (&$unsigned((((wire275 == wire273) >>> (wire276 > wire273)) << (wire274 == wire275))));
          if ((!wire274))
            begin
              reg278 <= reg277;
              reg279 <= {$unsigned((~&reg278))};
            end
          else
            begin
              reg278 <= (-($unsigned(((~wire273) - wire274)) != $unsigned((!(~^wire273)))));
            end
          if ($unsigned($unsigned($signed({reg277[(3'h6):(1'h0)]}))))
            begin
              reg280 <= ((~($signed($unsigned(reg278)) ^ reg277)) ?
                  reg277[(1'h1):(1'h0)] : (({(|wire276)} + (((8'hb0) ?
                          wire273 : wire273) ?
                      $signed((8'had)) : (reg279 ?
                          wire273 : wire274))) > (~|(reg278 ~^ (wire275 ^ wire276)))));
              reg281 <= $signed((^~wire274));
              reg282 <= $signed((~&(((reg279 ?
                      wire273 : (8'hb6)) > $signed(wire276)) ?
                  (+$signed(wire274)) : wire273)));
            end
          else
            begin
              reg280 <= $signed(reg280);
              reg281 <= (~^reg281[(3'h7):(3'h4)]);
            end
          if (((~(7'h42)) >> $unsigned((($unsigned(reg279) != wire273) < $unsigned(reg277)))))
            begin
              reg283 <= (({((~^reg279) ^ $signed(wire273))} ?
                  (~&reg282) : $signed($unsigned((reg278 <<< wire275)))) ^ (~|{wire274,
                  $unsigned(wire276)}));
              reg284 <= wire275[(4'h9):(3'h4)];
            end
          else
            begin
              reg283 <= ({($signed((wire273 ?
                      reg280 : reg283)) * reg284[(3'h6):(1'h0)]),
                  ((^reg282[(4'h9):(2'h2)]) + reg283[(3'h6):(2'h2)])} + wire273);
              reg284 <= reg277[(2'h2):(2'h2)];
            end
          reg285 <= reg281[(4'h9):(3'h5)];
        end
      else
        begin
          reg277 <= reg283[(3'h7):(2'h2)];
          reg278 <= ({reg283} == (~&reg277[(1'h0):(1'h0)]));
          reg279 <= (^~{(~&(reg278 - (^wire276)))});
        end
      if ((~|$signed((wire273[(1'h0):(1'h0)] ?
          (reg277 ?
              (wire275 ^ (8'hab)) : (reg278 ?
                  wire273 : wire276)) : ((wire276 == reg283) ?
              (+reg282) : (~&reg277))))))
        begin
          reg286 <= ({reg284} <= (($unsigned((reg277 ? reg279 : reg277)) ?
                  reg285 : $signed((^reg283))) ?
              (((~^wire274) == $signed(reg282)) * (wire273[(1'h1):(1'h1)] ?
                  $unsigned(reg282) : (wire274 ?
                      wire276 : wire275))) : ($unsigned((reg278 ?
                      wire274 : reg279)) ?
                  reg277 : (~^{wire273, wire275}))));
          reg287 <= wire275[(2'h2):(2'h2)];
        end
      else
        begin
          reg286 <= $unsigned($unsigned(((^~(!reg278)) ?
              $unsigned((wire275 >>> wire275)) : ((wire274 >>> reg280) ?
                  reg277[(1'h0):(1'h0)] : $signed(reg284)))));
          reg287 <= ($unsigned(reg281[(4'hd):(4'h9)]) + reg278[(3'h5):(3'h4)]);
          reg288 <= ({reg284[(2'h3):(1'h1)],
              wire273[(1'h1):(1'h1)]} << ($signed(reg283[(1'h0):(1'h0)]) ?
              (^(reg277[(4'ha):(1'h1)] ?
                  wire275[(4'h8):(3'h5)] : $signed(reg282))) : ({{wire276}} ?
                  reg286[(3'h4):(1'h1)] : (8'hb5))));
        end
      if (reg279)
        begin
          reg289 <= ((8'ha6) && {$signed($signed(reg285)), {reg280}});
        end
      else
        begin
          if ((8'haf))
            begin
              reg289 <= (((!reg287) << (+$signed((reg278 ? reg282 : reg284)))) ?
                  (-wire276[(5'h10):(3'h6)]) : wire273);
              reg290 <= $signed(($unsigned($signed($signed(wire273))) < $unsigned((&wire276[(3'h6):(2'h2)]))));
            end
          else
            begin
              reg289 <= (($unsigned(wire276[(4'h8):(3'h7)]) == reg281[(4'h8):(1'h0)]) == $signed((wire274 ?
                  ((^wire274) || $signed((8'ha7))) : ((8'hae) ?
                      reg279 : (^wire274)))));
              reg290 <= ($unsigned((({reg288, (8'hba)} ?
                      (wire274 <<< wire275) : wire273) < reg290[(2'h2):(2'h2)])) ?
                  ($signed(reg290) ~^ reg282[(4'h8):(2'h2)]) : (&reg281));
              reg291 <= $signed({wire275[(3'h5):(2'h2)],
                  reg290[(1'h0):(1'h0)]});
            end
        end
      reg292 <= (~&$unsigned(reg287[(2'h2):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg293 <= reg291;
    end
  always
    @(posedge clk) begin
      reg294 <= reg288;
      reg295 <= (&$signed((reg277 ? reg294 : (|(reg279 ? (8'ha8) : reg292)))));
      if ($signed(wire275))
        begin
          reg296 <= (-(&(reg285 << $signed(reg293))));
          if ($signed((8'h9d)))
            begin
              reg297 <= (+{$signed($signed($unsigned(wire275))), reg286});
              reg298 <= ($signed(reg292) ?
                  ($unsigned(reg291[(3'h4):(2'h3)]) || ((^reg295[(2'h3):(1'h0)]) > (~|$unsigned(reg282)))) : $unsigned((((~&(8'ha7)) ?
                          $signed(reg296) : $unsigned(wire276)) ?
                      reg287 : ((reg282 ?
                          wire276 : reg279) >>> ((8'hbb) - reg290)))));
              reg299 <= ($unsigned(({$signed(reg297)} ^ ((^~reg282) == {reg292,
                      reg296}))) ?
                  (~|(((reg294 + reg290) ^ reg293) ?
                      $unsigned($signed(reg288)) : ((reg293 < (8'ha2)) | {(7'h40),
                          reg295}))) : wire276[(5'h10):(4'he)]);
            end
          else
            begin
              reg297 <= ((^~(reg286 ?
                  (~(reg282 ?
                      reg280 : reg292)) : reg282)) <= $unsigned((+($unsigned(reg284) | reg281[(1'h1):(1'h0)]))));
            end
        end
      else
        begin
          reg296 <= reg294;
          reg297 <= ((($signed({(8'hb4), reg292}) ?
              $unsigned((|reg285)) : (8'hba)) <= {((wire273 ?
                  reg281 : wire273) == (~|reg298))}) ^ (!(~&((reg282 ?
              reg298 : reg282) != $signed(reg283)))));
          reg298 <= ($unsigned((^(reg281[(4'h9):(4'h8)] ?
              (reg287 <<< reg292) : (wire274 << reg295)))) ~^ ((($signed(reg285) | (^~wire275)) ?
              $signed({reg284}) : $unsigned(reg290)) ^~ $unsigned(reg287[(2'h2):(1'h1)])));
        end
      if ((wire273 ?
          $unsigned(reg277) : $signed($unsigned($signed($unsigned(reg283))))))
        begin
          reg300 <= reg298[(3'h4):(2'h3)];
          reg301 <= (!$signed($unsigned(reg291)));
        end
      else
        begin
          reg300 <= reg291[(4'ha):(3'h5)];
        end
    end
  assign wire302 = ({(^(+reg294)),
                       $unsigned($unsigned((wire275 ?
                           wire275 : reg300)))} ^ (+((reg277 ?
                           reg283 : ((8'hac) >> reg297)) ?
                       reg279 : ($signed(reg293) & $signed(reg301)))));
  assign wire303 = (reg286[(2'h3):(1'h1)] ^~ ($unsigned((!$unsigned(reg297))) ?
                       $signed(reg284[(2'h2):(1'h1)]) : reg301[(4'hc):(1'h0)]));
  assign wire304 = wire303[(4'h8):(2'h3)];
  assign wire305 = (($signed($unsigned($signed(reg280))) >= $signed((+wire275))) * ((((|(8'hba)) || (reg282 ?
                               reg301 : (8'h9c))) ?
                           $signed(((8'h9f) ?
                               reg294 : wire303)) : (+((8'ha4) && (8'hbe)))) ?
                       reg288[(4'ha):(4'h9)] : (8'ha5)));
  assign wire306 = reg279[(4'he):(1'h0)];
  assign wire307 = {(wire275[(2'h2):(1'h1)] ~^ $unsigned(((~(8'hba)) ?
                           $unsigned(wire304) : reg279[(1'h0):(1'h0)])))};
  assign wire308 = $unsigned(reg281);
  assign wire309 = $unsigned((wire302 * wire307[(4'h9):(3'h6)]));
  always
    @(posedge clk) begin
      reg310 <= reg284;
    end
  always
    @(posedge clk) begin
      if ({wire276[(1'h0):(1'h0)]})
        begin
          reg311 <= $unsigned(((+wire276) != $unsigned($signed(reg277[(4'h8):(1'h0)]))));
          reg312 <= reg300[(1'h0):(1'h0)];
        end
      else
        begin
          reg311 <= (reg300 ~^ reg294);
        end
      reg313 <= {$unsigned((reg288[(1'h1):(1'h1)] ?
              ($unsigned((8'hb2)) <= ((8'h9f) ?
                  wire274 : (8'hb4))) : (wire303 || $unsigned(wire304)))),
          $unsigned(wire304[(3'h5):(3'h5)])};
      reg314 <= $signed((reg297[(3'h7):(1'h1)] ?
          ($unsigned(wire305[(1'h0):(1'h0)]) <<< reg280) : $unsigned(((8'hab) ?
              $signed((8'hb5)) : wire276))));
      if ((^~(~{(|(reg300 >= reg283)), (&wire308[(4'hc):(4'ha)])})))
        begin
          if (wire276)
            begin
              reg315 <= {(~$unsigned({reg310, (~reg293)})),
                  (((8'ha0) ?
                      $signed($signed(reg291)) : $unsigned((reg314 ?
                          reg294 : reg280))) ^ {(&reg289[(1'h0):(1'h0)]),
                      {$signed(wire303)}})};
              reg316 <= reg284;
              reg317 <= (~|((^((!(8'ha4)) <<< (^reg313))) ?
                  (wire276 ?
                      $unsigned({reg297}) : ((8'hb0) ?
                          (wire274 ?
                              (8'ha2) : reg301) : (reg296 > reg293))) : wire305[(3'h7):(1'h0)]));
              reg318 <= (((!$signed(reg311[(4'hb):(1'h1)])) ?
                  $unsigned(wire304[(1'h1):(1'h1)]) : reg311[(3'h7):(2'h2)]) == ($signed((reg296[(4'ha):(3'h5)] + $unsigned((8'had)))) ?
                  (reg277 ?
                      (wire307 ?
                          $unsigned(reg313) : (~|(8'haf))) : (reg295 + reg310[(5'h10):(4'he)])) : (~^(^{reg294}))));
            end
          else
            begin
              reg315 <= (8'had);
            end
          reg319 <= reg279;
          reg320 <= $signed(({($signed((8'haf)) ^ reg291[(4'ha):(2'h3)])} ^~ $signed(((~|(8'hac)) || $unsigned(reg295)))));
          reg321 <= $unsigned((wire309 ~^ $signed(reg313[(2'h2):(1'h1)])));
          reg322 <= (!(|((|((8'h9d) ?
              reg299 : wire276)) & $signed($unsigned(wire306)))));
        end
      else
        begin
          reg315 <= $unsigned(reg313);
          reg316 <= (reg296[(4'h9):(2'h2)] ?
              {(((+reg278) ^ ((8'ha1) ^~ wire307)) ?
                      reg289 : (~|(wire307 ~^ reg312)))} : $signed(($unsigned((8'ha9)) ^ reg310[(2'h3):(1'h0)])));
          reg317 <= reg314[(4'hd):(3'h7)];
        end
    end
  assign wire323 = (+reg284[(2'h2):(1'h0)]);
  assign wire324 = $unsigned(($signed($signed((reg291 ? reg291 : reg313))) ?
                       $unsigned($unsigned(((7'h44) <= reg321))) : $signed((!reg314[(2'h3):(2'h2)]))));
  assign wire325 = ((reg292 <<< ($signed((wire276 < reg310)) ?
                       reg315 : $signed(reg320[(4'hd):(4'ha)]))) & (~|(((~&reg322) ?
                           $unsigned(wire305) : (reg280 | reg296)) ?
                       wire308 : (!$unsigned(reg281)))));
  assign wire326 = (8'h9d);
  always
    @(posedge clk) begin
      reg327 <= wire302;
      reg328 <= (-wire326[(2'h2):(1'h1)]);
      reg329 <= reg317;
      reg330 <= (~reg278);
      reg331 <= $unsigned(($unsigned($unsigned(reg293[(2'h3):(2'h3)])) + (($signed(reg316) ?
              $unsigned(reg297) : reg292[(3'h5):(2'h2)]) ?
          {(~^(8'ha3)), ((8'hab) ~^ (8'h9f))} : ($unsigned(reg286) <= (reg296 ?
              (8'had) : reg313)))));
    end
  assign wire332 = reg299;
endmodule

module module231
#(parameter param257 = (|({(((8'ha7) ? (8'hbb) : (8'hba)) ? ((7'h41) ? (8'h9d) : (8'hba)) : ((8'ha3) ? (8'ha7) : (8'hb3))), {{(8'hbf), (8'hbf)}, (-(8'hb3))}} != {(((8'ha8) + (8'hbb)) ? (~^(8'hb9)) : ((7'h42) == (8'ha9))), {((8'hb7) ? (8'hb8) : (8'ha7)), (~|(8'hb8))}})), 
parameter param258 = param257)
(y, clk, wire235, wire234, wire233, wire232);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire235;
  input wire signed [(3'h5):(1'h0)] wire234;
  input wire [(5'h15):(1'h0)] wire233;
  input wire signed [(3'h5):(1'h0)] wire232;
  wire [(4'hc):(1'h0)] wire256;
  wire signed [(4'hf):(1'h0)] wire255;
  wire signed [(5'h12):(1'h0)] wire254;
  wire [(5'h11):(1'h0)] wire253;
  wire signed [(4'h8):(1'h0)] wire252;
  wire [(3'h7):(1'h0)] wire251;
  wire signed [(3'h6):(1'h0)] wire250;
  wire signed [(4'hd):(1'h0)] wire249;
  wire [(5'h12):(1'h0)] wire248;
  wire signed [(5'h12):(1'h0)] wire247;
  wire [(5'h15):(1'h0)] wire236;
  reg signed [(3'h5):(1'h0)] reg246 = (1'h0);
  reg [(5'h11):(1'h0)] reg245 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg244 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg243 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg242 = (1'h0);
  reg [(2'h2):(1'h0)] reg241 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg240 = (1'h0);
  reg [(4'he):(1'h0)] reg239 = (1'h0);
  reg [(5'h13):(1'h0)] reg238 = (1'h0);
  reg [(5'h11):(1'h0)] reg237 = (1'h0);
  assign y = {wire256,
                 wire255,
                 wire254,
                 wire253,
                 wire252,
                 wire251,
                 wire250,
                 wire249,
                 wire248,
                 wire247,
                 wire236,
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 (1'h0)};
  assign wire236 = wire235;
  always
    @(posedge clk) begin
      if ($unsigned($signed($unsigned($signed($signed(wire235))))))
        begin
          reg237 <= wire236;
          reg238 <= reg237[(2'h2):(1'h1)];
          reg239 <= reg238[(4'hf):(3'h7)];
          reg240 <= (+wire234);
          if ({$signed({(reg240[(2'h3):(1'h1)] ?
                      $unsigned((8'hb9)) : (!reg237)),
                  ((^wire232) ? wire234[(2'h2):(2'h2)] : reg240)})})
            begin
              reg241 <= reg239[(4'hc):(2'h2)];
              reg242 <= (&(-(~^$unsigned($signed(wire233)))));
              reg243 <= reg239[(3'h5):(3'h5)];
              reg244 <= wire233[(5'h13):(4'h9)];
              reg245 <= {$unsigned($unsigned($signed(wire236)))};
            end
          else
            begin
              reg241 <= (($signed((8'ha0)) < $unsigned({wire233})) ?
                  $unsigned(reg245[(3'h4):(2'h2)]) : reg241[(2'h2):(1'h1)]);
              reg242 <= ($unsigned($signed((^$unsigned(reg245)))) ?
                  $signed(wire233[(4'h9):(2'h3)]) : ((!(reg239 * (~^reg245))) <<< wire236));
              reg243 <= $signed({$unsigned((7'h42)),
                  ($unsigned((^~reg239)) << (+(reg243 == reg237)))});
            end
        end
      else
        begin
          if (wire232[(3'h4):(1'h0)])
            begin
              reg237 <= $unsigned((($signed((~wire235)) || {$unsigned(reg242)}) == wire234[(3'h4):(1'h0)]));
              reg238 <= reg245;
              reg239 <= reg243[(4'h9):(3'h5)];
            end
          else
            begin
              reg237 <= {wire235};
              reg238 <= (!(^$unsigned(wire233[(3'h7):(3'h7)])));
            end
          reg240 <= (+$signed(wire233[(5'h10):(1'h0)]));
          reg241 <= (~&$signed(($unsigned((reg241 << reg243)) ?
              $unsigned((8'ha6)) : reg238[(2'h2):(1'h0)])));
        end
      reg246 <= ($signed((wire236 ?
          ((8'hac) ? reg243[(4'hb):(4'hb)] : (-reg240)) : $unsigned((wire234 ?
              wire236 : reg240)))) << reg241[(1'h1):(1'h1)]);
    end
  assign wire247 = (((reg237[(3'h6):(3'h6)] ^ reg240) ?
                       (($signed(reg237) || (8'hb0)) - (wire234[(2'h2):(2'h2)] ?
                           $unsigned(wire233) : (~(8'hb8)))) : (^$signed($signed(reg237)))) >= $signed($signed((wire235 ?
                       $unsigned(reg246) : wire234))));
  assign wire248 = reg244;
  assign wire249 = (reg242[(4'h9):(4'h8)] << (wire234 ?
                       $unsigned(reg244) : {(8'hb8),
                           $unsigned((wire247 ? reg242 : (8'hbf)))}));
  assign wire250 = (wire248[(5'h12):(4'ha)] && (^(~^(8'ha1))));
  assign wire251 = $signed({wire234[(1'h1):(1'h0)]});
  assign wire252 = reg239[(1'h1):(1'h0)];
  assign wire253 = (((|(((8'hbe) ? wire234 : reg239) ?
                       wire251 : $signed(wire251))) > $signed($signed((reg237 ?
                       reg246 : wire251)))) >> reg242[(3'h5):(1'h0)]);
  assign wire254 = {wire250};
  assign wire255 = wire233;
  assign wire256 = reg239;
endmodule

module module147
#(parameter param204 = (-(+(((-(8'hb6)) ~^ {(8'h9e), (8'h9d)}) ? ((!(8'hb2)) << ((8'hb5) + (8'hb0))) : (((8'hab) && (8'hbd)) ? ((8'haf) >>> (8'haa)) : ((8'hbf) ? (8'ha6) : (8'ha5)))))), 
parameter param205 = param204)
(y, clk, wire152, wire151, wire150, wire149, wire148);
  output wire [(32'h231):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire152;
  input wire [(5'h12):(1'h0)] wire151;
  input wire [(5'h14):(1'h0)] wire150;
  input wire [(3'h6):(1'h0)] wire149;
  input wire [(4'hb):(1'h0)] wire148;
  wire [(4'he):(1'h0)] wire203;
  wire [(4'hb):(1'h0)] wire202;
  wire signed [(3'h7):(1'h0)] wire201;
  wire [(5'h14):(1'h0)] wire200;
  wire [(4'ha):(1'h0)] wire199;
  wire [(5'h10):(1'h0)] wire198;
  wire [(4'hb):(1'h0)] wire187;
  wire signed [(3'h4):(1'h0)] wire186;
  wire [(5'h14):(1'h0)] wire178;
  wire signed [(2'h2):(1'h0)] wire174;
  wire [(5'h11):(1'h0)] wire173;
  wire signed [(4'hc):(1'h0)] wire172;
  wire signed [(5'h15):(1'h0)] wire157;
  wire signed [(5'h13):(1'h0)] wire156;
  wire [(2'h3):(1'h0)] wire155;
  wire signed [(4'h9):(1'h0)] wire154;
  wire signed [(3'h6):(1'h0)] wire153;
  reg signed [(4'ha):(1'h0)] reg197 = (1'h0);
  reg [(4'hf):(1'h0)] reg196 = (1'h0);
  reg [(5'h12):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg194 = (1'h0);
  reg [(4'hf):(1'h0)] reg193 = (1'h0);
  reg [(3'h5):(1'h0)] reg192 = (1'h0);
  reg [(3'h6):(1'h0)] reg191 = (1'h0);
  reg [(2'h3):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg189 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg188 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg185 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg184 = (1'h0);
  reg [(3'h5):(1'h0)] reg183 = (1'h0);
  reg [(3'h5):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg181 = (1'h0);
  reg [(5'h15):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg179 = (1'h0);
  reg [(2'h2):(1'h0)] reg177 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg175 = (1'h0);
  reg [(3'h7):(1'h0)] reg171 = (1'h0);
  reg signed [(4'he):(1'h0)] reg170 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg169 = (1'h0);
  reg [(2'h3):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg166 = (1'h0);
  reg [(3'h6):(1'h0)] reg165 = (1'h0);
  reg [(4'h8):(1'h0)] reg164 = (1'h0);
  reg [(3'h7):(1'h0)] reg163 = (1'h0);
  reg [(4'h9):(1'h0)] reg162 = (1'h0);
  reg [(4'h9):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg160 = (1'h0);
  reg [(5'h15):(1'h0)] reg159 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg158 = (1'h0);
  assign y = {wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire187,
                 wire186,
                 wire178,
                 wire174,
                 wire173,
                 wire172,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg177,
                 reg176,
                 reg175,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 (1'h0)};
  assign wire153 = $unsigned($unsigned($signed(wire148[(1'h1):(1'h1)])));
  assign wire154 = $unsigned($unsigned(wire152));
  assign wire155 = $unsigned(($signed($unsigned((8'hb8))) ?
                       $unsigned((((7'h44) ? wire154 : wire153) ?
                           $signed(wire151) : wire150)) : $unsigned(wire148)));
  assign wire156 = (~$signed($unsigned(({wire155} ?
                       $signed((8'h9f)) : wire150[(4'h8):(3'h5)]))));
  assign wire157 = (wire151[(5'h11):(4'h9)] ?
                       (wire152[(3'h4):(2'h2)] != wire151[(4'hd):(4'hb)]) : wire155[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg158 <= {wire155[(2'h2):(1'h1)],
          $signed($signed(($signed(wire157) ^~ wire150)))};
      reg159 <= ((wire151[(4'he):(4'h9)] ?
          ($unsigned(wire155) ?
              {$signed(wire156)} : ({wire148, wire157} ?
                  wire153[(1'h0):(1'h0)] : ((8'hb0) << wire153))) : (wire152 ?
              {$signed(wire155)} : $unsigned((wire149 ?
                  wire153 : wire154)))) >>> wire154[(1'h1):(1'h1)]);
      reg160 <= wire154;
      if ((^~wire154[(3'h6):(1'h1)]))
        begin
          if ($unsigned((-((8'hac) ?
              ((reg159 - wire156) - {wire153}) : {(reg158 ?
                      reg159 : (8'hab))}))))
            begin
              reg161 <= $unsigned($unsigned((wire148[(1'h1):(1'h1)] * $unsigned(((8'hbf) || (8'hbe))))));
              reg162 <= wire157;
              reg163 <= $signed(wire151);
              reg164 <= (&(8'hb7));
              reg165 <= reg161[(2'h2):(2'h2)];
            end
          else
            begin
              reg161 <= wire151;
              reg162 <= (^~({((~|reg162) <= (wire153 == wire154)),
                  {reg165,
                      reg160[(1'h0):(1'h0)]}} & (wire152[(1'h0):(1'h0)] > reg161)));
              reg163 <= {(wire156[(3'h6):(2'h3)] ~^ $signed(reg161)),
                  wire148[(3'h7):(3'h7)]};
            end
          reg166 <= ($signed((~&$unsigned((reg158 ?
              reg159 : reg158)))) >> (~^$signed((reg159[(5'h12):(5'h12)] ?
              (8'hb2) : reg165))));
          if (reg159)
            begin
              reg167 <= (wire155[(1'h1):(1'h1)] * reg163[(3'h5):(2'h2)]);
              reg168 <= (|reg164);
              reg169 <= ((wire153 - (~&wire149[(3'h4):(2'h3)])) ?
                  (reg160 ?
                      wire154 : ($signed((wire155 ?
                          (8'hb7) : reg168)) | {{reg158, reg159}})) : (8'hbd));
              reg170 <= reg166[(5'h11):(3'h7)];
            end
          else
            begin
              reg167 <= reg162;
            end
        end
      else
        begin
          reg161 <= $unsigned({(-$signed((reg161 ? (8'hbd) : (8'hb9)))),
              ((wire154 ^~ (wire150 ?
                  wire150 : reg170)) ^ ({wire151} & reg158))});
          reg162 <= $signed($signed(reg164));
          reg163 <= ((reg161 <<< reg170[(1'h1):(1'h1)]) ?
              ($signed((~((7'h43) >>> wire154))) >= reg170) : reg166);
          reg164 <= reg169;
          reg165 <= ($signed((~&{((8'hb1) > reg165)})) ^~ reg162[(3'h6):(1'h1)]);
        end
      reg171 <= $unsigned(wire153[(3'h4):(1'h1)]);
    end
  assign wire172 = $unsigned($signed(((reg167[(3'h5):(2'h3)] ?
                       $signed(reg160) : wire152) ~^ (wire148 != reg160[(1'h0):(1'h0)]))));
  assign wire173 = ({(!({reg158} ? (reg171 - reg166) : $unsigned(reg158))),
                       (~^(-((8'hb6) ?
                           reg163 : wire156)))} == reg167[(1'h1):(1'h0)]);
  assign wire174 = wire173;
  always
    @(posedge clk) begin
      reg175 <= ((~|($unsigned($unsigned(reg165)) << (-$unsigned(wire151)))) >= (+($signed($signed((8'ha2))) != (wire174[(2'h2):(2'h2)] && (reg162 ?
          reg171 : wire153)))));
      reg176 <= reg171;
      reg177 <= wire156;
    end
  assign wire178 = (|$signed({{(reg167 >> reg177)},
                       ((reg169 & (7'h42)) ?
                           reg160[(1'h0):(1'h0)] : (wire157 ?
                               wire149 : (8'hbd)))}));
  always
    @(posedge clk) begin
      if (((reg159 ? reg170 : (&$unsigned((!reg166)))) ?
          reg164 : (wire173[(2'h2):(2'h2)] ? wire149 : wire152)))
        begin
          reg179 <= ($unsigned($unsigned(reg165)) ?
              $signed(((+(|wire174)) ? reg163 : (~$signed(reg159)))) : wire148);
          reg180 <= $unsigned((^$signed(wire148)));
          reg181 <= $unsigned(wire157);
          reg182 <= reg165;
        end
      else
        begin
          reg179 <= (reg170 ?
              ((^~$signed((+(8'hbe)))) && reg167) : ({{$signed(reg165)},
                  $unsigned((wire157 >>> reg170))} == (8'ha8)));
        end
      reg183 <= $unsigned((wire156 ?
          $signed((wire149[(2'h2):(1'h1)] + $signed(wire156))) : reg162[(1'h0):(1'h0)]));
      reg184 <= $signed(wire151[(4'hf):(3'h4)]);
      reg185 <= $unsigned({reg176[(3'h5):(2'h3)]});
    end
  assign wire186 = reg184;
  assign wire187 = wire152[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg188 <= $unsigned((-((((8'hb4) ? reg184 : (7'h44)) ?
              reg169[(1'h1):(1'h1)] : (wire154 ? wire153 : reg175)) ?
          reg159[(5'h10):(2'h3)] : reg179[(5'h12):(2'h3)])));
      if ($unsigned({(reg164 + (reg159 ? reg160 : (~&wire172)))}))
        begin
          reg189 <= (|reg185);
          reg190 <= reg164;
          reg191 <= {(^~reg161)};
        end
      else
        begin
          if ($signed(((~wire148[(2'h2):(1'h1)]) >>> $signed((&{(8'hbc),
              reg185})))))
            begin
              reg189 <= wire153;
            end
          else
            begin
              reg189 <= reg182[(1'h1):(1'h0)];
              reg190 <= reg191;
            end
          reg191 <= (((reg189[(3'h7):(3'h7)] == {$unsigned(wire157),
                  reg190}) || (reg169[(4'h8):(3'h7)] ?
                  $unsigned((^wire178)) : ($unsigned(reg166) > ((8'ha0) ?
                      reg176 : (8'hac))))) ?
              ($signed((-reg180)) ?
                  $unsigned({(reg171 ~^ wire151)}) : reg183[(3'h4):(2'h2)]) : wire149);
          reg192 <= reg190;
          reg193 <= (|wire154);
          reg194 <= ($signed($signed(((8'hbb) <<< (wire151 ?
              reg167 : reg168)))) > reg175[(4'hf):(3'h5)]);
        end
      reg195 <= reg168;
      reg196 <= (reg169 ?
          (((wire154[(4'h8):(4'h8)] ?
              (wire172 ^~ reg190) : (~|reg169)) > wire157) + ($signed(reg166) ?
              $unsigned($unsigned(reg162)) : $signed($signed(reg162)))) : ((|(wire187 ?
              (wire153 ? (8'h9e) : wire150) : (+reg170))) | ($signed(((8'ha5) ?
              reg166 : (8'hba))) <= ($signed(reg175) >> reg161[(1'h1):(1'h0)]))));
      reg197 <= wire187[(1'h0):(1'h0)];
    end
  assign wire198 = $signed($unsigned(($signed($unsigned((8'h9f))) ?
                       reg169[(3'h5):(2'h2)] : ($signed(reg194) - {reg161,
                           reg158}))));
  assign wire199 = {reg189};
  assign wire200 = wire150;
  assign wire201 = $signed(wire152);
  assign wire202 = wire199;
  assign wire203 = {($signed(($signed((8'hac)) - $signed(wire174))) ?
                           (~$signed((reg183 ?
                               reg167 : (8'h9c)))) : (($signed(reg168) ?
                                   $signed((8'ha8)) : reg191[(3'h6):(3'h4)]) ?
                               reg192[(3'h4):(2'h2)] : ((reg158 == wire150) == (reg195 ?
                                   wire174 : reg165))))};
endmodule

module module83
#(parameter param140 = ((((((8'had) ? (8'hbb) : (8'hbe)) << ((8'ha6) ? (8'h9d) : (8'ha9))) ^~ {(~(8'hae)), ((7'h40) << (8'h9d))}) ? (((^(8'hb2)) ? ((8'hb0) ? (8'hb4) : (8'hbe)) : ((8'haa) ? (8'hb0) : (8'hae))) ? ((-(8'ha5)) >>> ((8'ha1) & (8'ha0))) : (-((7'h43) - (8'ha6)))) : ((((7'h40) ? (8'ha8) : (8'h9d)) ? {(7'h42)} : {(8'haf)}) ? ({(8'ha2), (8'ha9)} ? ((8'hbd) > (8'ha3)) : {(8'hac)}) : ({(8'ha6), (8'hbe)} >> ((8'h9e) ^ (8'hb8))))) ^~ {(({(8'hb7), (8'hbf)} ? ((7'h42) != (8'hb1)) : ((7'h44) ? (8'ha1) : (8'hba))) || (^~{(8'h9f), (8'hab)})), ((((7'h40) * (8'hab)) == (~|(8'haf))) > (~|(~|(8'had))))}), 
parameter param141 = ((({((8'hbf) ? param140 : param140), (param140 ? param140 : param140)} ^ (param140 < (param140 ? param140 : param140))) ? (^param140) : ((~&(8'hb5)) & {(param140 <= param140), (param140 & param140)})) ^ (param140 ? ({(param140 ? param140 : (8'ha0))} ? param140 : {(param140 ? param140 : param140)}) : {((param140 ~^ param140) ? param140 : (+param140))})))
(y, clk, wire87, wire86, wire85, wire84);
  output wire [(32'h228):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire87;
  input wire [(4'hc):(1'h0)] wire86;
  input wire signed [(4'hf):(1'h0)] wire85;
  input wire [(4'hd):(1'h0)] wire84;
  wire [(4'hb):(1'h0)] wire136;
  wire signed [(3'h5):(1'h0)] wire135;
  wire signed [(5'h14):(1'h0)] wire134;
  wire signed [(4'ha):(1'h0)] wire133;
  wire [(5'h14):(1'h0)] wire132;
  wire [(3'h6):(1'h0)] wire131;
  wire signed [(4'ha):(1'h0)] wire130;
  wire signed [(4'h8):(1'h0)] wire129;
  wire signed [(4'hc):(1'h0)] wire128;
  wire [(5'h15):(1'h0)] wire123;
  wire [(4'hd):(1'h0)] wire122;
  wire signed [(2'h2):(1'h0)] wire121;
  wire signed [(4'hd):(1'h0)] wire120;
  wire signed [(4'h9):(1'h0)] wire94;
  wire [(3'h5):(1'h0)] wire93;
  wire signed [(5'h11):(1'h0)] wire92;
  wire [(3'h6):(1'h0)] wire91;
  wire signed [(2'h2):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire89;
  wire signed [(4'he):(1'h0)] wire88;
  reg signed [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(3'h4):(1'h0)] reg138 = (1'h0);
  reg [(3'h6):(1'h0)] reg137 = (1'h0);
  reg [(3'h5):(1'h0)] reg127 = (1'h0);
  reg [(5'h10):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg119 = (1'h0);
  reg [(2'h3):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg116 = (1'h0);
  reg [(4'ha):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg114 = (1'h0);
  reg [(4'ha):(1'h0)] reg113 = (1'h0);
  reg [(3'h7):(1'h0)] reg112 = (1'h0);
  reg signed [(4'he):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg109 = (1'h0);
  reg [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  reg [(5'h15):(1'h0)] reg106 = (1'h0);
  reg [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(3'h4):(1'h0)] reg104 = (1'h0);
  reg [(5'h13):(1'h0)] reg103 = (1'h0);
  reg [(3'h7):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(5'h13):(1'h0)] reg97 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg95 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 reg139,
                 reg138,
                 reg137,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
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
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 (1'h0)};
  assign wire88 = (((8'hab) < (wire84[(4'hb):(4'hb)] ?
                          wire87[(3'h5):(3'h4)] : $unsigned(wire86[(2'h2):(2'h2)]))) ?
                      (!wire87[(3'h5):(2'h3)]) : $unsigned($signed(($signed(wire86) ?
                          $unsigned(wire87) : $unsigned(wire87)))));
  assign wire89 = {$unsigned({$unsigned(wire87[(3'h4):(1'h0)])})};
  assign wire90 = (+wire88[(3'h6):(3'h4)]);
  assign wire91 = (wire85[(2'h2):(1'h0)] ?
                      ({$unsigned((wire88 ~^ wire85))} ?
                          (wire88 <<< wire85[(4'ha):(3'h6)]) : (-(8'hb4))) : wire90);
  assign wire92 = ($signed($unsigned(wire91)) == (wire90 + wire86[(4'hc):(2'h2)]));
  assign wire93 = {{$unsigned(($signed(wire91) == $signed(wire90)))}};
  assign wire94 = ($unsigned(wire92) ?
                      $unsigned((8'hab)) : $signed($signed(($signed(wire90) ?
                          (wire91 ~^ wire89) : (^~(8'h9f))))));
  always
    @(posedge clk) begin
      if (($signed((8'ha4)) ?
          {(((wire89 + wire88) ? wire90[(1'h0):(1'h0)] : (7'h41)) - (wire85 ?
                  (wire87 <<< wire94) : wire87)),
              $signed(wire84[(4'hb):(4'h8)])} : {$signed(wire88[(4'h9):(1'h0)])}))
        begin
          reg95 <= $unsigned({$unsigned((8'hac)),
              $unsigned(((wire88 | wire89) && wire84))});
        end
      else
        begin
          reg95 <= $signed((~wire84));
          reg96 <= ((8'hbe) ?
              (^wire84[(3'h6):(3'h5)]) : ({(wire92 ?
                          wire91 : $unsigned(wire85)),
                      (wire94 > ((8'haf) & wire87))} ?
                  wire87 : {($signed(wire88) ?
                          {wire86, (8'hba)} : $signed(wire92)),
                      $signed(wire89)}));
          reg97 <= wire90;
          if (wire94)
            begin
              reg98 <= wire87;
              reg99 <= ($signed(($signed((wire91 > wire84)) ?
                  $unsigned($unsigned(wire94)) : reg98[(1'h1):(1'h0)])) - ($unsigned(wire93) || {$signed((wire91 < wire93)),
                  (reg96[(2'h3):(1'h0)] >= (~^reg96))}));
              reg100 <= $unsigned((|((wire92 ?
                      {(8'h9f), (8'ha0)} : {reg97, wire88}) ?
                  (~(wire86 ?
                      wire91 : reg97)) : $unsigned(reg98[(2'h2):(1'h0)]))));
            end
          else
            begin
              reg98 <= ($signed(wire86) ?
                  reg96[(2'h3):(2'h2)] : $unsigned((~|((wire88 ?
                          reg100 : (7'h44)) ?
                      {wire89, reg99} : (~&reg96)))));
              reg99 <= wire93;
              reg100 <= (8'ha3);
              reg101 <= $signed(wire86);
            end
          reg102 <= wire94;
        end
      if (wire84)
        begin
          reg103 <= ($signed(reg101[(3'h5):(1'h1)]) + $unsigned((~&((!reg97) > reg102))));
          reg104 <= reg98;
          reg105 <= reg99[(3'h4):(2'h2)];
        end
      else
        begin
          reg103 <= ($signed(((reg102 ? $unsigned(reg96) : (^~wire88)) ?
                  $signed({wire86, reg104}) : (!$unsigned(wire93)))) ?
              (({(reg96 ?
                          reg100 : reg103)} >= $unsigned(reg100[(1'h1):(1'h1)])) ?
                  reg96[(1'h0):(1'h0)] : (reg105[(2'h2):(1'h1)] ?
                      reg99 : $unsigned($signed(wire87)))) : wire84[(4'h8):(4'h8)]);
          if ((~|$signed((($unsigned(wire92) ? $signed(wire92) : (-wire87)) ?
              $unsigned({reg101, wire88}) : $signed((wire93 ?
                  wire84 : wire85))))))
            begin
              reg104 <= reg97;
              reg105 <= $unsigned((~^reg100[(2'h3):(2'h2)]));
              reg106 <= (^~wire89);
            end
          else
            begin
              reg104 <= (&{$signed(({reg95} ? wire89 : $unsigned((7'h42))))});
              reg105 <= $signed(wire92);
              reg106 <= (^~$unsigned(($signed((wire89 ?
                  reg102 : wire85)) << (reg102 ~^ reg96))));
              reg107 <= ((((~|(&reg96)) ^ wire88) ?
                      reg104[(1'h1):(1'h1)] : reg101[(4'hb):(4'h8)]) ?
                  (((!(wire88 + wire88)) << reg102) ^ wire86[(3'h6):(3'h4)]) : $unsigned($unsigned($signed({wire90}))));
            end
          reg108 <= $signed({(({reg98, reg96} & (wire92 >= (8'hb4))) ?
                  $unsigned($unsigned(reg95)) : (!(^~reg97))),
              ((wire86[(4'hb):(1'h1)] - wire89) | reg97)});
        end
      reg109 <= (|($unsigned($unsigned($signed(reg101))) ?
          (8'haf) : $unsigned($signed((reg101 ? wire93 : reg103)))));
      if (reg99[(2'h3):(1'h0)])
        begin
          reg110 <= ((((|(reg108 ? wire92 : (8'ha8))) ~^ (~|(8'hae))) ?
              reg108 : reg99) ^~ $signed($unsigned(reg99[(4'hc):(4'hb)])));
          reg111 <= reg110;
          if ((^~$unsigned($unsigned((^~{reg102})))))
            begin
              reg112 <= (8'hb0);
            end
          else
            begin
              reg112 <= {(+reg98), wire88[(1'h1):(1'h0)]};
              reg113 <= reg95[(1'h1):(1'h1)];
              reg114 <= reg109;
              reg115 <= $unsigned(wire86);
              reg116 <= reg102[(1'h1):(1'h0)];
            end
          reg117 <= (~$unsigned($unsigned($signed((reg104 * (8'hac))))));
          reg118 <= $unsigned((wire94 ?
              ($unsigned(reg107) ?
                  (((8'h9f) ? reg95 : reg116) ?
                      ((8'h9d) ?
                          (8'hb9) : reg108) : (-reg112)) : $unsigned($signed(reg110))) : $unsigned(({(8'ha4),
                  reg98} || $signed(reg107)))));
        end
      else
        begin
          reg110 <= reg105[(1'h1):(1'h1)];
          if ((!(($unsigned((wire89 ?
              wire87 : reg102)) << wire91[(3'h6):(2'h2)]) + ((8'hbd) ?
              $signed((reg95 <<< reg116)) : (&(wire92 ? reg101 : reg97))))))
            begin
              reg111 <= (-$unsigned($unsigned(reg113[(4'h8):(2'h3)])));
            end
          else
            begin
              reg111 <= reg107[(1'h1):(1'h0)];
            end
          reg112 <= (~^reg97);
        end
      reg119 <= ((|(!reg95)) << ($unsigned((~^(reg99 ? reg115 : reg100))) ?
          (~&$signed({(8'h9f)})) : reg116[(4'hb):(4'hb)]));
    end
  assign wire120 = $unsigned((wire92[(3'h6):(2'h2)] == (+(^(reg102 || (8'hbd))))));
  assign wire121 = reg119;
  assign wire122 = $unsigned($unsigned({reg110[(2'h3):(1'h0)],
                       (+(wire94 < reg103))}));
  assign wire123 = ((((8'hb4) ?
                           (reg117 ? {reg100, (8'ha1)} : wire122) : ({reg115,
                                   wire120} ?
                               $unsigned((8'hb4)) : reg109)) ?
                       $unsigned((&reg110)) : $signed(((reg110 ?
                               reg105 : reg100) ?
                           reg110[(1'h1):(1'h0)] : {reg116}))) * $signed((reg112 <<< {{reg117,
                           reg96}})));
  always
    @(posedge clk) begin
      reg124 <= reg101;
      reg125 <= (wire87[(4'h8):(1'h0)] >= ({$unsigned((8'ha9))} << $unsigned($signed(reg124[(1'h0):(1'h0)]))));
      reg126 <= reg101;
      reg127 <= $signed(((reg109[(2'h2):(2'h2)] ?
          wire89[(1'h0):(1'h0)] : {(wire91 ? reg114 : reg97),
              $signed((8'hbd))}) < ((wire88 ?
          $unsigned(reg114) : reg109) ~^ wire120)));
    end
  assign wire128 = (wire90[(1'h0):(1'h0)] ?
                       ($signed((~&(reg103 ?
                           (8'hb6) : reg119))) >> (8'hb2)) : reg108[(1'h1):(1'h1)]);
  assign wire129 = ((reg110[(1'h0):(1'h0)] != wire88) + reg106);
  assign wire130 = $unsigned(reg126[(4'h9):(3'h7)]);
  assign wire131 = (((~&reg113) ?
                           $unsigned(reg98[(2'h2):(1'h0)]) : $unsigned($unsigned($unsigned(reg108)))) ?
                       (~^(-$unsigned($unsigned((8'hbb))))) : $unsigned($signed($unsigned(reg106[(4'hf):(3'h7)]))));
  assign wire132 = (wire91[(1'h0):(1'h0)] <<< $unsigned($unsigned(($signed(reg118) < $signed(wire129)))));
  assign wire133 = (!$signed($signed(reg112)));
  assign wire134 = $unsigned($unsigned(($signed(reg97) && ((wire131 == reg126) ?
                       (^wire129) : $unsigned(reg97)))));
  assign wire135 = ({((~&{wire94}) <= $unsigned((8'ha1))),
                       wire130[(4'ha):(3'h7)]} << wire131[(1'h1):(1'h0)]);
  assign wire136 = (-((8'hb3) & $unsigned(reg113)));
  always
    @(posedge clk) begin
      reg137 <= $signed((($signed(wire88) ?
              (^~$unsigned(reg112)) : (~^(~(8'hbd)))) ?
          reg100[(2'h2):(1'h1)] : $unsigned(((^(8'ha3)) ?
              $unsigned(wire133) : (wire128 * wire93)))));
      reg138 <= reg111;
      if ($signed({$signed((reg95 ?
              (reg109 ? reg109 : wire84) : (~^wire136)))}))
        begin
          reg139 <= $unsigned(reg97);
        end
      else
        begin
          reg139 <= {$signed(($signed((&wire85)) >>> $unsigned((|reg100)))),
              (wire130 ? wire88 : reg124[(2'h2):(1'h1)])};
        end
    end
endmodule

module module49  (y, clk, wire54, wire53, wire52, wire51, wire50);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire54;
  input wire signed [(4'h8):(1'h0)] wire53;
  input wire [(5'h11):(1'h0)] wire52;
  input wire [(4'hf):(1'h0)] wire51;
  input wire [(3'h4):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire80;
  wire [(3'h7):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire62;
  wire [(5'h15):(1'h0)] wire61;
  wire [(5'h10):(1'h0)] wire60;
  wire [(5'h13):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire58;
  wire [(3'h5):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire55;
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  assign y = {wire80,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 reg79,
                 reg78,
                 reg77,
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
                 (1'h0)};
  assign wire55 = ((wire54[(1'h1):(1'h0)] ?
                      ((wire53 ?
                          wire54[(2'h2):(2'h2)] : wire51[(3'h7):(2'h2)]) + wire54[(2'h2):(1'h0)]) : {wire52}) && wire53);
  assign wire56 = ({($signed({wire55, wire55}) ?
                          ({wire52} ?
                              (|wire55) : wire51[(4'h9):(1'h1)]) : $unsigned((&wire51))),
                      ($signed(wire53) ?
                          (wire54[(2'h2):(1'h1)] >= $unsigned(wire50)) : {(~&wire52)})} && wire50);
  assign wire57 = $signed($unsigned($signed(wire55)));
  assign wire58 = $signed((({(~^wire51), {wire50}} ?
                      wire54[(1'h0):(1'h0)] : wire57) ^ {((8'hb8) + (wire50 - wire53)),
                      ((wire57 ? wire52 : (8'haf)) ~^ wire54[(2'h3):(1'h1)])}));
  assign wire59 = (($signed(($unsigned(wire55) ~^ wire53[(3'h5):(2'h2)])) <<< (-wire51[(3'h7):(1'h0)])) ?
                      wire57[(2'h3):(2'h2)] : $signed((wire56 <= $unsigned((!wire55)))));
  assign wire60 = (+(8'hbb));
  assign wire61 = $signed($unsigned($signed(($signed((8'haf)) ?
                      ((8'hbd) ? wire57 : (8'hb8)) : $signed(wire56)))));
  assign wire62 = $unsigned(wire60);
  assign wire63 = wire60[(4'hf):(4'hb)];
  always
    @(posedge clk) begin
      reg64 <= wire61[(4'hd):(1'h1)];
      if ($unsigned({(wire57[(2'h3):(1'h0)] <<< $unsigned(reg64[(5'h13):(4'h8)]))}))
        begin
          reg65 <= wire52;
          reg66 <= {$unsigned($signed($unsigned({wire51}))), $unsigned(wire58)};
        end
      else
        begin
          reg65 <= (wire53[(1'h0):(1'h0)] <<< $unsigned((!reg66[(5'h10):(5'h10)])));
        end
      if (wire50)
        begin
          if ($unsigned(($unsigned($unsigned(wire50)) ?
              (^~$signed((wire60 != reg66))) : ($unsigned((wire50 ?
                      wire59 : wire63)) ?
                  (-(~|(8'hbc))) : wire53[(3'h5):(1'h0)]))))
            begin
              reg67 <= {(-((!(8'ha3)) < ($signed(wire51) >= (wire55 >> (8'hbf))))),
                  reg65};
              reg68 <= $unsigned((7'h40));
              reg69 <= $signed(wire62);
              reg70 <= ($unsigned((^~reg66)) ?
                  {wire63, wire62[(4'hb):(3'h7)]} : ($unsigned(({reg64,
                          reg69} < $signed(wire58))) ?
                      {$unsigned((wire60 ? wire60 : wire63))} : wire51));
            end
          else
            begin
              reg67 <= $unsigned(reg67[(1'h0):(1'h0)]);
              reg68 <= (|$unsigned((|($unsigned(reg66) || $signed((8'hb2))))));
              reg69 <= ($signed({{$signed(wire59), wire50[(2'h3):(2'h2)]},
                      {$unsigned(reg68)}}) ?
                  ($signed((wire54 && {(7'h44), (8'hae)})) ?
                      reg68[(3'h4):(1'h1)] : (~($signed(wire55) ?
                          ((8'hb1) ?
                              wire57 : reg65) : wire63[(2'h3):(2'h2)]))) : wire60);
              reg70 <= wire62;
            end
          reg71 <= (($signed($signed(wire58[(4'hf):(1'h1)])) & wire57) ?
              (reg68[(4'he):(3'h4)] < (($signed((8'hae)) >> reg64[(3'h5):(2'h3)]) > wire51)) : ((~wire60[(4'he):(2'h2)]) ~^ reg65[(1'h1):(1'h0)]));
          if (((({(!wire54)} ?
                  (~|wire55) : (reg64[(4'hc):(4'hb)] < (|(8'hb8)))) << wire56[(3'h6):(1'h0)]) ?
              $signed({(((8'ha6) ? reg64 : wire60) ?
                      reg68 : $signed(wire53))}) : $unsigned($unsigned(wire51))))
            begin
              reg72 <= ($unsigned(reg65) ?
                  {wire50[(2'h3):(1'h1)]} : ($unsigned(wire55) > (^wire59[(4'h8):(1'h0)])));
              reg73 <= ($signed(reg70[(4'hb):(3'h5)]) ?
                  reg67 : $signed($signed(wire56[(4'hc):(4'hc)])));
            end
          else
            begin
              reg72 <= ((((|$signed(reg66)) - $signed((wire63 <<< wire62))) >= {$unsigned($signed(reg70))}) ?
                  {(reg72 - $unsigned($signed(reg70))),
                      $signed($signed((8'ha8)))} : $signed(reg65[(2'h2):(1'h0)]));
              reg73 <= ((((~&wire62[(4'hd):(3'h6)]) << (8'ha6)) ?
                  ((reg70[(1'h0):(1'h0)] ?
                      wire53 : $unsigned(wire62)) & ((reg70 - wire61) ?
                      (reg70 != wire60) : (8'hb1))) : wire50) | ($signed(reg64) ?
                  reg73 : ($unsigned($signed(wire61)) >= wire52)));
            end
          if ((!wire60[(3'h6):(2'h2)]))
            begin
              reg74 <= reg65;
              reg75 <= $unsigned(({wire63[(2'h3):(2'h3)]} >> (|$unsigned(reg65[(2'h2):(1'h1)]))));
            end
          else
            begin
              reg74 <= ((8'ha8) ? reg75[(4'hb):(4'ha)] : reg65[(1'h0):(1'h0)]);
              reg75 <= ($signed((~{(-wire61)})) ?
                  ($unsigned(reg65) << wire53[(3'h5):(1'h0)]) : {($unsigned({wire62}) ?
                          (~|wire56[(3'h5):(2'h2)]) : $signed((wire50 >= reg72)))});
              reg76 <= ($signed(wire52) + ((wire63 + ((wire50 - (7'h40)) ?
                  (+reg72) : (reg71 == reg71))) && ({(|(8'hb7))} ?
                  reg72[(4'h9):(2'h2)] : (~|reg67))));
              reg77 <= ($unsigned({((reg71 ?
                      reg72 : (7'h43)) == (reg72 <<< wire55)),
                  $signed((!wire63))}) == (wire63[(3'h5):(1'h1)] | reg65));
            end
          if ($signed(reg72[(3'h4):(3'h4)]))
            begin
              reg78 <= ({wire57,
                  $unsigned($unsigned($signed(reg66)))} & (^~$signed(reg70[(3'h6):(3'h5)])));
            end
          else
            begin
              reg78 <= ((~(-wire62[(2'h2):(1'h0)])) ?
                  (8'hb8) : ({(reg78[(3'h5):(2'h2)] ?
                          (reg65 - reg68) : {reg66}),
                      (8'haf)} > (reg76[(4'hf):(4'he)] ^~ reg67[(2'h2):(1'h1)])));
              reg79 <= reg75[(5'h10):(4'hf)];
            end
        end
      else
        begin
          reg67 <= {((reg66[(1'h0):(1'h0)] > wire60) ~^ reg73)};
          reg68 <= {((8'ha5) >> (+wire58[(4'ha):(4'h8)])), wire61};
        end
    end
  assign wire80 = (-$unsigned((((reg68 ? wire58 : reg71) ?
                          wire55[(1'h1):(1'h0)] : (!wire54)) ?
                      wire60 : $unsigned((reg74 ? wire55 : wire60)))));
endmodule
