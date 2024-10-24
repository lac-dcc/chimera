module top
#(parameter param323 = ((+((((7'h41) ? (8'hab) : (7'h40)) >>> (~(8'hbd))) ? ((~|(8'hab)) || (8'h9d)) : {(|(8'hb8))})) ? {(^(~|((8'hb0) ^~ (8'hb5)))), ((~^{(7'h42), (8'hb6)}) ? (((8'hb0) != (8'hb8)) ? (8'hb8) : ((8'h9f) <= (7'h43))) : (((8'haa) ? (8'hbd) : (7'h44)) ? (~&(8'ha8)) : (+(8'hb6))))} : ((-((^(8'ha7)) ? ((8'hb6) != (8'haf)) : (-(8'hba)))) ? (+{((8'hbb) ? (7'h40) : (7'h43))}) : (~^(((8'hab) ? (8'hb7) : (7'h42)) ? ((7'h43) ? (8'ha0) : (7'h42)) : (&(8'ha2)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h326):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire320;
  wire [(5'h11):(1'h0)] wire319;
  wire [(3'h6):(1'h0)] wire317;
  wire [(3'h5):(1'h0)] wire316;
  wire [(5'h10):(1'h0)] wire314;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire24;
  wire [(4'hb):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire30;
  wire signed [(4'hd):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire299;
  reg [(5'h11):(1'h0)] reg322 = (1'h0);
  reg [(4'ha):(1'h0)] reg321 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  assign y = {wire320,
                 wire319,
                 wire317,
                 wire316,
                 wire314,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire24,
                 wire25,
                 wire26,
                 wire30,
                 wire31,
                 wire299,
                 reg322,
                 reg321,
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
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg29,
                 reg28,
                 reg27,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire5 = $unsigned(((((wire0 ? (8'hb7) : wire4) ?
                     (wire0 ~^ (8'hac)) : wire4[(3'h5):(3'h4)]) > (~wire0)) >>> $unsigned(($unsigned((8'haa)) < (wire1 != wire3)))));
  assign wire6 = (^wire5[(2'h3):(2'h3)]);
  assign wire7 = (wire4 ?
                     (((+$signed(wire5)) > (~^$signed(wire3))) ?
                         ((8'hb4) ~^ ($signed(wire4) ?
                             $unsigned((8'hac)) : (wire0 ?
                                 wire6 : (7'h42)))) : wire0) : $unsigned(wire0[(3'h5):(3'h5)]));
  assign wire8 = {wire4[(3'h5):(1'h1)]};
  assign wire9 = (($unsigned((+wire6[(2'h3):(1'h1)])) ?
                     $unsigned((~$unsigned(wire6))) : $signed((8'ha3))) | wire1[(2'h2):(1'h0)]);
  assign wire10 = (-wire9[(3'h4):(2'h3)]);
  assign wire11 = {((+((wire4 ? wire7 : wire2) ?
                          (wire2 << wire7) : (wire1 ?
                              wire9 : (8'haa)))) & wire8)};
  assign wire12 = wire3;
  always
    @(posedge clk) begin
      reg13 <= (!($signed((+(wire9 ? wire12 : wire11))) ?
          (+(^(wire9 > wire0))) : $unsigned(wire5[(1'h1):(1'h0)])));
      reg14 <= ((+wire9[(1'h0):(1'h0)]) ?
          reg13[(4'hb):(4'h9)] : $unsigned($signed(wire7[(4'h8):(1'h0)])));
      reg15 <= (~{(wire6 <= wire8)});
      if (($unsigned($unsigned(wire12)) <<< (wire6 && $unsigned($unsigned($unsigned((8'hb7)))))))
        begin
          reg16 <= ($signed(wire10) != wire4);
          if (wire7)
            begin
              reg17 <= (((8'hbf) ?
                      $unsigned($signed((wire3 + wire11))) : $signed($unsigned(wire8[(3'h7):(3'h7)]))) ?
                  wire4 : {({wire12} | ({wire0} ^~ (~|wire1)))});
            end
          else
            begin
              reg17 <= (8'hbd);
              reg18 <= (wire11 || (|$unsigned((reg14 ?
                  $signed(wire8) : (~^wire0)))));
              reg19 <= (|$signed($signed($signed((|wire8)))));
            end
          reg20 <= {(wire10 ?
                  ((wire9 <= (^~reg13)) != (^~$unsigned((8'hb5)))) : {wire8})};
          reg21 <= {{$unsigned((reg20[(1'h1):(1'h1)] ?
                      (reg14 ? wire9 : reg14) : wire5[(2'h3):(2'h3)]))}};
        end
      else
        begin
          reg16 <= {$unsigned((~&(reg19 && $signed((8'ha9)))))};
          reg17 <= (+(~$unsigned(wire1)));
          if (reg19[(3'h6):(3'h5)])
            begin
              reg18 <= wire0[(3'h5):(1'h1)];
              reg19 <= (reg16 == reg15);
              reg20 <= $unsigned({$unsigned({(reg21 << wire12),
                      (wire8 ? wire8 : wire1)}),
                  ((|{reg20, wire7}) ?
                      ($unsigned(wire7) ? reg13 : $signed(wire8)) : reg18)});
              reg21 <= {reg16[(2'h2):(2'h2)]};
              reg22 <= ({(($unsigned(wire8) ?
                          $signed(wire12) : $signed((8'hbc))) ?
                      $signed((+wire6)) : ((!wire4) ?
                          (!wire7) : (-reg16)))} * (reg18 ?
                  reg21[(3'h5):(2'h3)] : ((~(reg14 ?
                      reg14 : reg15)) <<< $unsigned($unsigned(wire11)))));
            end
          else
            begin
              reg18 <= $unsigned(reg19);
              reg19 <= (8'ha1);
            end
          reg23 <= wire2;
        end
    end
  assign wire24 = {(((~(^~reg18)) ?
                          ((~(8'haf)) <<< wire3) : $signed(reg15[(2'h3):(2'h3)])) - ($unsigned(reg14) ?
                          (reg14 ?
                              (reg17 ?
                                  reg19 : wire2) : {reg22}) : (((8'ha4) != wire7) ?
                              (^~wire8) : (~|wire1))))};
  assign wire25 = (($unsigned((reg16 ?
                          $unsigned(reg22) : (reg18 + reg17))) != reg13[(1'h1):(1'h1)]) ?
                      ((($signed(wire24) < {reg21}) ?
                          wire4 : wire12) <<< {wire7[(3'h4):(1'h1)],
                          wire24[(1'h1):(1'h0)]}) : (wire7[(4'hb):(3'h5)] ?
                          reg16[(1'h1):(1'h1)] : $signed((+(wire2 ?
                              wire7 : wire24)))));
  assign wire26 = (reg23 ?
                      {wire10[(4'h8):(3'h6)],
                          wire9[(1'h1):(1'h1)]} : {$unsigned($signed((+wire25)))});
  always
    @(posedge clk) begin
      reg27 <= $signed((8'haf));
      reg28 <= $unsigned((+(~wire6[(2'h3):(2'h3)])));
      reg29 <= {reg15};
    end
  assign wire30 = $signed((8'h9c));
  assign wire31 = $signed(({(!(~&wire26))} || (((~|reg14) ?
                          (|reg18) : (reg29 ? reg16 : (8'ha4))) ?
                      {{wire5}} : reg14)));
  always
    @(posedge clk) begin
      if (({(reg21 ?
              wire0[(4'h9):(1'h0)] : ((wire12 && (7'h43)) ?
                  (reg14 ?
                      wire31 : wire11) : $signed(reg23)))} != wire24[(2'h2):(1'h0)]))
        begin
          reg32 <= wire2;
          reg33 <= (~&wire11);
          reg34 <= reg16;
          reg35 <= $unsigned((~&(~&$signed(((8'hb9) > reg27)))));
        end
      else
        begin
          if ($unsigned($unsigned((reg34[(3'h6):(3'h5)] ?
              reg28[(5'h13):(4'hb)] : $signed({reg16, (8'hb5)})))))
            begin
              reg32 <= $unsigned($unsigned(wire31[(2'h2):(1'h0)]));
              reg33 <= ($unsigned(wire8[(4'ha):(1'h0)]) == (7'h41));
              reg34 <= (wire6 ?
                  $unsigned((~^((reg35 ? reg16 : (8'ha4)) ?
                      $unsigned(wire1) : reg15))) : wire31[(1'h1):(1'h1)]);
              reg35 <= reg20;
            end
          else
            begin
              reg32 <= (8'ha1);
              reg33 <= $signed($unsigned($signed(($unsigned(wire12) ?
                  reg13 : (~|reg29)))));
              reg34 <= $unsigned(reg13[(4'ha):(1'h1)]);
              reg35 <= (~&reg29[(2'h3):(2'h2)]);
              reg36 <= ((8'haa) ?
                  $unsigned({($unsigned(wire25) << $unsigned(wire31)),
                      $signed($unsigned(wire26))}) : reg14);
            end
        end
      if (wire11[(4'he):(4'hd)])
        begin
          if (($unsigned((^~{$signed(wire30)})) + (7'h43)))
            begin
              reg37 <= $signed($unsigned(wire11[(4'hd):(3'h7)]));
              reg38 <= (reg19 ?
                  (-($unsigned(wire0[(2'h3):(1'h1)]) - wire31[(3'h4):(1'h1)])) : (|$signed((!reg21))));
            end
          else
            begin
              reg37 <= $signed(wire30[(3'h6):(3'h4)]);
              reg38 <= {$signed($signed(($unsigned(wire24) >> (+wire8)))),
                  reg23[(4'hc):(2'h2)]};
              reg39 <= wire0;
              reg40 <= $signed({((+{wire31}) ?
                      $signed((reg13 ?
                          wire1 : wire31)) : $signed((wire8 * wire6)))});
              reg41 <= $unsigned(reg15);
            end
          if ($unsigned(reg36[(3'h6):(1'h0)]))
            begin
              reg42 <= (8'ha1);
              reg43 <= (((reg37 ?
                      $unsigned($signed(reg17)) : {wire3[(4'hf):(3'h7)]}) ?
                  reg29 : (((!reg29) > (wire11 ? wire5 : wire24)) ?
                      wire0 : (^reg39))) ~^ $unsigned($unsigned(reg22[(2'h2):(2'h2)])));
              reg44 <= ((reg34 >> ($signed((reg28 < wire8)) & {{reg17,
                      reg36}})) > $signed(wire3[(2'h3):(2'h2)]));
              reg45 <= {wire8,
                  {((&reg37) == (reg13[(4'hc):(4'hb)] ^ $signed((8'hba)))),
                      (&$unsigned((reg15 >> reg28)))}};
              reg46 <= (|((reg27[(4'hf):(4'he)] ?
                      ((reg23 ? reg16 : (7'h40)) > wire31) : reg40) ?
                  (($unsigned(wire1) ?
                      (wire9 - (7'h43)) : wire1) ^ reg32[(3'h5):(2'h3)]) : wire31));
            end
          else
            begin
              reg42 <= (((reg28 ?
                  (~$signed(reg21)) : $signed(wire2[(4'ha):(1'h1)])) >= {{(^reg28)},
                  (^~reg21[(3'h5):(3'h5)])}) ~^ (~|reg34));
              reg43 <= {wire12[(1'h1):(1'h0)], wire7[(4'hb):(1'h0)]};
              reg44 <= $unsigned(wire8[(4'ha):(4'h8)]);
              reg45 <= {$signed($signed({(reg14 >>> reg43), {reg40}}))};
              reg46 <= $unsigned(wire11);
            end
          if (($signed($unsigned((reg37 + $unsigned(wire12)))) ?
              {($unsigned((reg39 | reg42)) & ((reg14 * reg18) << reg40))} : $signed(($signed(wire12[(3'h4):(2'h2)]) ?
                  $unsigned(wire25[(3'h5):(1'h1)]) : (8'ha4)))))
            begin
              reg47 <= reg28;
            end
          else
            begin
              reg47 <= ((({((8'hac) * reg21), $signed((8'had))} ?
                          (8'hbb) : $signed(wire7[(5'h12):(5'h11)])) ?
                      (({reg29} ? (^~(8'ha5)) : reg13[(4'h8):(1'h1)]) ?
                          reg18 : wire11[(1'h1):(1'h0)]) : $unsigned({$signed((8'haa))})) ?
                  (($unsigned((wire31 ? reg32 : reg45)) ?
                          (-$unsigned(reg44)) : (!$signed(reg36))) ?
                      (($unsigned(reg21) ? wire3 : ((8'had) ? reg23 : wire11)) ?
                          $signed({reg21}) : wire12[(2'h2):(1'h0)]) : $unsigned((reg23 - $signed((8'hb3))))) : reg43[(4'h8):(1'h1)]);
              reg48 <= ($unsigned($unsigned(((~reg32) ?
                      (wire5 >= wire24) : $signed(wire3)))) ?
                  reg15[(2'h2):(1'h1)] : reg23);
            end
        end
      else
        begin
          if ($signed($signed(wire8)))
            begin
              reg37 <= ((+(~^$signed(wire24[(2'h2):(2'h2)]))) ?
                  reg34 : ((8'hb3) ?
                      $signed($signed({reg29})) : wire26[(4'hf):(3'h7)]));
              reg38 <= $unsigned(wire4[(1'h0):(1'h0)]);
            end
          else
            begin
              reg37 <= (7'h40);
              reg38 <= $unsigned((reg23[(4'h9):(2'h3)] | {{(reg46 < wire31)},
                  $signed((8'hbe))}));
              reg39 <= reg34;
              reg40 <= ((^$unsigned($unsigned($unsigned(reg40)))) ?
                  {({(|reg22)} ? wire12 : $unsigned(wire25)),
                      $unsigned(reg44)} : reg23[(1'h0):(1'h0)]);
            end
        end
      reg49 <= (~^(~|($signed(wire6) ? $unsigned($signed(wire10)) : wire5)));
      reg50 <= $signed({reg37});
      if (reg46[(2'h3):(2'h3)])
        begin
          reg51 <= reg15[(1'h0):(1'h0)];
          if (reg33[(4'h8):(3'h4)])
            begin
              reg52 <= $signed(((($unsigned(reg21) ^~ {reg21}) ?
                  ((wire1 > wire25) ?
                      $signed((8'hb9)) : (reg36 * reg49)) : reg44) == $signed($unsigned((^wire24)))));
              reg53 <= (((^$unsigned((^wire2))) ?
                      $unsigned(($signed((8'hbc)) ?
                          (reg32 <<< (8'hb4)) : wire26[(1'h1):(1'h1)])) : ((reg45[(1'h1):(1'h1)] >>> reg39) << $unsigned(wire9[(3'h4):(1'h0)]))) ?
                  wire7[(2'h2):(2'h2)] : reg16);
              reg54 <= (~&$signed($signed((reg35 && $signed(wire1)))));
              reg55 <= {{((~^(reg34 - wire7)) ?
                          {reg47} : wire30[(3'h7):(1'h0)])}};
              reg56 <= ($signed((8'ha5)) ^~ (reg14 >= (~$signed($unsigned(reg39)))));
            end
          else
            begin
              reg52 <= reg56[(1'h0):(1'h0)];
              reg53 <= ($unsigned((&reg43)) ?
                  $signed(($signed(wire31[(2'h2):(2'h2)]) - $signed((reg41 ?
                      wire0 : (8'h9c))))) : $unsigned({$unsigned((~(8'hbc)))}));
              reg54 <= reg40[(1'h0):(1'h0)];
            end
          if ($signed(($unsigned(((~&wire1) > wire9)) ? (8'hb4) : reg38)))
            begin
              reg57 <= reg27;
              reg58 <= ((^($unsigned(((8'hae) >= (8'ha9))) >> ((wire25 ?
                      reg57 : reg27) + (8'hb1)))) ?
                  $unsigned((-$signed((~&reg41)))) : reg54[(2'h3):(1'h0)]);
              reg59 <= $signed($unsigned($unsigned($unsigned(wire4))));
              reg60 <= reg56[(2'h2):(1'h0)];
            end
          else
            begin
              reg57 <= $unsigned($signed($signed(reg36)));
              reg58 <= (-reg56[(2'h3):(1'h1)]);
              reg59 <= reg36[(2'h2):(2'h2)];
              reg60 <= reg59;
            end
          if ((^reg48[(3'h6):(3'h4)]))
            begin
              reg61 <= reg37[(3'h4):(1'h0)];
              reg62 <= $unsigned(reg61);
              reg63 <= reg56;
            end
          else
            begin
              reg61 <= {(reg48[(4'hb):(3'h6)] ? wire5 : reg18)};
              reg62 <= {(reg29 + (reg45[(4'hd):(4'hc)] ?
                      ((wire9 | reg36) ?
                          $signed(reg15) : (reg39 || reg28)) : ((wire26 ?
                              wire30 : wire26) ?
                          (~reg19) : (wire3 ? wire30 : reg46))))};
              reg63 <= ((reg17[(4'h9):(1'h0)] ?
                  reg40[(1'h1):(1'h0)] : ($unsigned(reg60[(3'h4):(2'h3)]) ?
                      {$unsigned(wire12),
                          reg15} : wire24[(1'h0):(1'h0)])) > $unsigned($signed((~&$unsigned((8'h9e))))));
              reg64 <= reg33;
            end
          if ($unsigned((~^$signed((reg51[(3'h5):(2'h2)] && (reg46 ?
              reg20 : wire6))))))
            begin
              reg65 <= (reg47[(2'h2):(2'h2)] >> (($unsigned((wire4 ?
                      wire9 : reg20)) ^ $unsigned((&reg14))) ?
                  $signed(reg44[(3'h5):(3'h5)]) : $signed((^~(reg55 ?
                      reg42 : reg47)))));
              reg66 <= reg60[(5'h10):(4'hf)];
              reg67 <= wire25;
            end
          else
            begin
              reg65 <= (~^(^$unsigned(($unsigned((8'hb6)) ?
                  reg43 : (~|reg16)))));
              reg66 <= ((8'ha9) ?
                  (~^(reg45[(5'h10):(3'h5)] - $unsigned((wire2 ?
                      (8'ha3) : reg42)))) : (~^(8'hb2)));
              reg67 <= ((reg20[(1'h1):(1'h1)] >= (($unsigned(wire11) ?
                          $unsigned(reg28) : $unsigned(wire2)) ?
                      ((reg45 ? reg55 : reg66) ?
                          (reg14 & reg53) : ((8'ha4) ?
                              wire7 : reg19)) : reg22[(3'h4):(3'h4)])) ?
                  {(((reg50 ? reg60 : reg44) >> (reg21 ? reg14 : reg43)) ?
                          (wire12 ?
                              (reg19 != (8'hb3)) : wire31[(4'h9):(3'h7)]) : (~&reg37[(1'h1):(1'h0)]))} : (&reg37[(2'h2):(2'h2)]));
            end
        end
      else
        begin
          if ({wire24[(1'h0):(1'h0)]})
            begin
              reg51 <= $signed($unsigned($unsigned(reg22[(3'h6):(2'h3)])));
              reg52 <= (~^$unsigned(reg27));
              reg53 <= {(~&((~^reg64) ?
                      wire2[(4'h9):(3'h7)] : ({reg44, reg37} ?
                          (reg43 ? wire2 : reg67) : wire1[(4'ha):(1'h0)])))};
            end
          else
            begin
              reg51 <= $unsigned((reg62 ?
                  $unsigned(($unsigned(reg38) <<< ((8'ha1) ~^ (8'ha4)))) : (&{(8'h9e)})));
              reg52 <= {reg28[(3'h5):(1'h1)]};
            end
          reg54 <= ($signed(reg45) - $unsigned(({$signed(reg41)} ?
              ({reg38} ? reg52[(2'h3):(2'h3)] : (reg45 << reg64)) : {(reg61 ?
                      (8'ha2) : reg37)})));
          reg55 <= wire30[(1'h1):(1'h0)];
          reg56 <= (7'h43);
        end
    end
  module68 #() modinst300 (wire299, clk, reg39, wire12, reg29, wire5, wire9);
  module301 #() modinst315 (.wire305(wire25), .y(wire314), .wire304(reg36), .wire303(reg43), .clk(clk), .wire306(wire6), .wire302(reg17));
  assign wire316 = $signed($signed({reg29[(2'h2):(1'h1)]}));
  module210 #() modinst318 (wire317, clk, wire5, reg32, reg41, reg20, wire31);
  assign wire319 = {{$unsigned($unsigned((8'hb6)))}};
  assign wire320 = ($signed($unsigned(reg45[(1'h1):(1'h1)])) > (reg37[(2'h2):(1'h1)] ?
                       (($unsigned(wire9) ^~ ((8'ha9) ? reg32 : wire317)) ?
                           reg18 : $unsigned((~reg60))) : (+$unsigned({reg13,
                           (8'had)}))));
  always
    @(posedge clk) begin
      reg321 <= reg53;
      reg322 <= {$unsigned(wire10[(4'h8):(3'h4)])};
    end
endmodule

module module301  (y, clk, wire306, wire305, wire304, wire303, wire302);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire306;
  input wire signed [(3'h7):(1'h0)] wire305;
  input wire [(2'h3):(1'h0)] wire304;
  input wire signed [(3'h7):(1'h0)] wire303;
  input wire signed [(5'h12):(1'h0)] wire302;
  wire [(4'hc):(1'h0)] wire313;
  wire [(3'h7):(1'h0)] wire312;
  wire signed [(4'hc):(1'h0)] wire311;
  wire [(5'h11):(1'h0)] wire310;
  wire [(5'h11):(1'h0)] wire309;
  wire signed [(4'h9):(1'h0)] wire308;
  wire [(5'h11):(1'h0)] wire307;
  assign y = {wire313,
                 wire312,
                 wire311,
                 wire310,
                 wire309,
                 wire308,
                 wire307,
                 (1'h0)};
  assign wire307 = $signed($unsigned((8'ha9)));
  assign wire308 = (-wire306[(4'h9):(2'h2)]);
  assign wire309 = (&{(-wire308)});
  assign wire310 = $signed($unsigned((({wire308, wire307} * wire302) ?
                       (wire309 ?
                           wire306 : (wire308 ?
                               wire306 : wire302)) : wire306[(4'h8):(3'h6)])));
  assign wire311 = wire303;
  assign wire312 = $signed((8'hb7));
  assign wire313 = $unsigned($signed(wire306));
endmodule

module module68  (y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h326):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire73;
  input wire signed [(2'h3):(1'h0)] wire72;
  input wire [(2'h3):(1'h0)] wire71;
  input wire [(5'h11):(1'h0)] wire70;
  input wire [(5'h15):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire282;
  wire signed [(5'h10):(1'h0)] wire208;
  wire [(4'hc):(1'h0)] wire157;
  wire signed [(4'hb):(1'h0)] wire156;
  wire [(4'h9):(1'h0)] wire138;
  wire [(4'h8):(1'h0)] wire137;
  wire [(5'h15):(1'h0)] wire136;
  wire [(2'h3):(1'h0)] wire135;
  wire signed [(3'h5):(1'h0)] wire134;
  wire [(5'h10):(1'h0)] wire133;
  wire [(4'ha):(1'h0)] wire131;
  wire signed [(4'h9):(1'h0)] wire76;
  wire [(4'h8):(1'h0)] wire75;
  wire signed [(2'h2):(1'h0)] wire74;
  reg [(3'h7):(1'h0)] reg298 = (1'h0);
  reg [(3'h5):(1'h0)] reg297 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg296 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg295 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg294 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg293 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg292 = (1'h0);
  reg [(3'h6):(1'h0)] reg291 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg290 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg289 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg288 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg287 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg286 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg285 = (1'h0);
  reg [(5'h10):(1'h0)] reg284 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg159 = (1'h0);
  reg [(5'h12):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg151 = (1'h0);
  reg [(2'h3):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg149 = (1'h0);
  reg [(4'h8):(1'h0)] reg148 = (1'h0);
  reg [(4'hd):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg146 = (1'h0);
  reg [(3'h4):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg144 = (1'h0);
  reg [(4'he):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg139 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(3'h6):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg92 = (1'h0);
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg96 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg104 = (1'h0);
  assign y = {wire282,
                 wire208,
                 wire157,
                 wire156,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire131,
                 wire76,
                 wire75,
                 wire74,
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
                 reg159,
                 reg158,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 (1'h0)};
  assign wire74 = (wire72[(1'h1):(1'h1)] ?
                      $unsigned({(wire69 < {wire69})}) : {wire71[(2'h2):(1'h0)],
                          (&($unsigned(wire72) < (^wire72)))});
  assign wire75 = {{wire71[(2'h2):(2'h2)],
                          ({$unsigned(wire72)} ?
                              $signed(wire74[(1'h1):(1'h1)]) : (wire71 * (wire73 ?
                                  wire69 : wire72)))},
                      ((&(8'ha2)) ~^ wire69)};
  assign wire76 = $unsigned($signed($signed((8'ha9))));
  always
    @(posedge clk) begin
      reg77 <= $unsigned(wire75[(3'h6):(3'h5)]);
      if (((8'hba) <<< $unsigned({(~|$signed(wire71)),
          $unsigned($signed(wire71))})))
        begin
          if (($signed((^~($signed(reg77) ?
              $unsigned(wire73) : wire70))) << (!wire75)))
            begin
              reg78 <= (|(wire70 ?
                  wire71[(1'h1):(1'h1)] : (wire75 ?
                      ({wire69} != (-wire76)) : $unsigned((wire73 && (8'hba))))));
              reg79 <= (($unsigned($unsigned((wire74 <= (8'h9c)))) ?
                  wire71[(1'h0):(1'h0)] : (^~(&reg77[(3'h6):(3'h4)]))) * (^{($unsigned(wire76) == $unsigned(reg78))}));
              reg80 <= $unsigned((~|wire75[(3'h6):(3'h5)]));
              reg81 <= wire73;
              reg82 <= $signed(wire71[(1'h0):(1'h0)]);
            end
          else
            begin
              reg78 <= ($signed(wire72[(2'h3):(1'h0)]) ?
                  ($signed($unsigned($unsigned((8'hbb)))) ?
                      reg78[(1'h1):(1'h1)] : {reg77[(2'h2):(1'h0)]}) : {$unsigned(((reg79 ?
                          wire71 : wire73) <= reg79[(3'h7):(3'h6)]))});
              reg79 <= {(+reg77[(1'h0):(1'h0)])};
            end
          if ($signed(($signed(((reg79 ^~ reg77) * reg80)) ?
              wire72 : $unsigned({(reg82 ^~ (8'hae))}))))
            begin
              reg83 <= {(8'ha6), $signed((!$unsigned((~^wire69))))};
              reg84 <= $signed(reg83);
              reg85 <= wire75;
            end
          else
            begin
              reg83 <= $unsigned((wire72 >= (+wire72[(2'h3):(2'h2)])));
              reg84 <= wire72[(1'h0):(1'h0)];
            end
          reg86 <= $unsigned((-wire74));
          if ({reg84[(3'h7):(1'h1)]})
            begin
              reg87 <= $unsigned($unsigned(({wire72,
                  (reg83 ? wire74 : wire74)} + $signed($signed(wire70)))));
              reg88 <= reg84;
              reg89 <= $signed({$signed(reg80), wire73[(3'h7):(3'h7)]});
            end
          else
            begin
              reg87 <= wire70;
              reg88 <= ((((^((8'hb6) ?
                  wire69 : (8'hb5))) - $unsigned((^reg82))) > (8'had)) - (~(({reg89,
                      reg79} ^~ (reg79 < reg77)) ?
                  reg86[(4'h9):(1'h1)] : (reg86[(2'h3):(2'h2)] >> $signed(wire72)))));
              reg89 <= $signed(reg77[(1'h1):(1'h0)]);
              reg90 <= (reg89[(2'h2):(2'h2)] && $signed((&{reg85})));
              reg91 <= (8'ha5);
            end
        end
      else
        begin
          reg78 <= $signed((8'hb0));
          reg79 <= reg78;
          reg80 <= $unsigned($unsigned(((reg89 ?
              $signed((8'ha7)) : reg80[(3'h5):(1'h1)]) ^~ wire69)));
        end
      reg92 <= ((~&((reg85[(1'h1):(1'h0)] >> $signed(wire70)) <= (~^(~(8'hba))))) || {$signed(wire69)});
      reg93 <= (~(reg89 ?
          (-((wire75 ? reg90 : wire73) > (wire73 ?
              wire73 : reg89))) : (~^reg81[(3'h4):(3'h4)])));
      if ($signed($signed((!{{(8'hae)}, $unsigned(reg92)}))))
        begin
          reg94 <= $unsigned((~&{(reg92[(2'h2):(1'h0)] + wire69[(5'h13):(5'h12)]),
              wire75}));
          if ($signed(wire69))
            begin
              reg95 <= $signed(reg78[(1'h0):(1'h0)]);
              reg96 <= reg77;
              reg97 <= (-($unsigned(((~(7'h42)) ?
                      (^~reg83) : wire75[(3'h6):(2'h2)])) ?
                  reg82[(4'hf):(1'h0)] : {(reg90 ^~ $unsigned(reg91))}));
              reg98 <= (({(8'hbe)} ?
                      ((reg84 ^ $signed(reg87)) >>> {wire70[(2'h2):(1'h0)]}) : (reg86 >>> (~&$unsigned((8'ha2))))) ?
                  $signed(((reg88[(2'h3):(1'h0)] ~^ wire76[(1'h0):(1'h0)]) ?
                      (+$signed((8'ha5))) : {(8'hab)})) : (((reg77 * (~^reg97)) >> wire73) ?
                      $unsigned(reg88[(3'h7):(3'h6)]) : $signed($unsigned((reg79 ?
                          wire73 : reg97)))));
              reg99 <= (8'hb1);
            end
          else
            begin
              reg95 <= $unsigned($unsigned($unsigned({(reg85 ?
                      reg83 : reg91)})));
              reg96 <= ((+(&{reg92})) - reg80);
            end
          if (({((&(~^reg95)) ? reg83 : $signed((+reg96)))} ?
              ($signed(wire70[(3'h5):(1'h0)]) ?
                  $signed(wire72) : $unsigned(wire73)) : $signed(($signed((7'h40)) ?
                  reg80[(1'h1):(1'h1)] : reg92[(3'h4):(2'h3)]))))
            begin
              reg100 <= $signed($unsigned((((wire69 ?
                      (8'hb2) : (8'hba)) >>> (reg85 ? reg89 : wire75)) ?
                  $unsigned((reg79 & wire73)) : ($signed(wire75) << reg80))));
              reg101 <= reg77[(1'h0):(1'h0)];
              reg102 <= ((-reg77[(4'h8):(3'h7)]) ^ reg100[(1'h0):(1'h0)]);
              reg103 <= (+reg78);
            end
          else
            begin
              reg100 <= ((!reg102[(1'h1):(1'h0)]) ?
                  ({wire72,
                      $unsigned((8'hab))} ^ reg80) : reg95[(1'h0):(1'h0)]);
              reg101 <= ((reg94 || (wire73 < $unsigned(reg84[(3'h4):(3'h4)]))) > wire69[(5'h13):(4'hf)]);
            end
          reg104 <= ({reg84} ^ wire72[(1'h1):(1'h1)]);
        end
      else
        begin
          reg94 <= (wire75[(2'h3):(1'h1)] >= ((~(wire74 ?
              $signed(reg97) : wire74)) > {$signed((reg88 <<< reg87))}));
          reg95 <= ($signed($signed({reg82})) | $signed($unsigned((&(~&reg101)))));
          reg96 <= $unsigned({reg88, (-reg85[(3'h6):(3'h4)])});
        end
    end
  module105 #() modinst132 (wire131, clk, reg85, wire76, reg87, wire70, reg102);
  assign wire133 = ($unsigned((reg88 ~^ {reg102})) ?
                       {(|$signed((reg97 ? wire74 : reg82))),
                           (^((reg96 ?
                               wire131 : wire76) ^ (|reg104)))} : ((($signed(reg103) && ((8'ha5) ~^ reg102)) | (reg86[(4'h9):(3'h6)] ?
                               reg82 : reg94[(4'ha):(3'h7)])) ?
                           reg94[(4'hc):(4'hc)] : wire71[(1'h1):(1'h1)]));
  assign wire134 = ($unsigned((^reg77[(4'h8):(3'h6)])) ~^ {((reg80[(4'h8):(4'h8)] <= ((8'ha2) ?
                           reg90 : reg89)) != (reg103 < (~^reg103))),
                       $signed(({reg97} ~^ (~^wire70)))});
  assign wire135 = $unsigned((|$signed((+(|wire133)))));
  assign wire136 = $signed($unsigned((($unsigned(reg93) * (wire133 ?
                       (8'ha0) : wire133)) <= wire135[(1'h1):(1'h1)])));
  assign wire137 = {wire135, $signed((~^{$unsigned(reg98)}))};
  assign wire138 = $signed($signed((8'hb3)));
  always
    @(posedge clk) begin
      if (reg84[(4'ha):(3'h7)])
        begin
          reg139 <= $unsigned((^reg90));
          if (($unsigned((8'hb9)) ?
              ((reg80[(3'h4):(1'h0)] ?
                  wire136 : {wire137,
                      $unsigned(wire69)}) > ((-wire137[(2'h3):(1'h0)]) <= (reg96[(3'h5):(3'h5)] ?
                  $signed((8'ha9)) : $signed(reg95)))) : (^~reg93)))
            begin
              reg140 <= reg81;
              reg141 <= ((wire136[(3'h6):(1'h1)] ?
                  $signed({reg84[(4'ha):(4'h9)]}) : $signed({(wire133 - wire134)})) ^~ {$unsigned(((-wire75) ?
                      $signed(reg80) : $unsigned(wire71))),
                  $signed(reg95)});
              reg142 <= reg77;
            end
          else
            begin
              reg140 <= $unsigned($signed(reg79[(3'h7):(3'h7)]));
              reg141 <= $signed(wire133[(4'h9):(3'h5)]);
              reg142 <= (((((~^reg101) ~^ $unsigned(reg93)) ?
                      (!(reg97 ? reg96 : wire69)) : $signed((reg102 ^ reg96))) ?
                  $signed((-reg93)) : (reg139[(1'h1):(1'h0)] * reg93[(4'h9):(3'h7)])) * (reg98 != $signed(((8'ha1) ?
                  reg83 : ((8'hab) - reg141)))));
            end
          reg143 <= $signed({(~$unsigned($unsigned((8'hbf))))});
          reg144 <= $unsigned(reg77[(3'h4):(1'h1)]);
          if ({((reg141 ? wire133[(4'hd):(1'h1)] : reg88) ?
                  ($unsigned($unsigned(reg99)) ?
                      $unsigned($unsigned(reg83)) : (^~reg77)) : reg101),
              wire69[(4'he):(4'hd)]})
            begin
              reg145 <= {wire137[(2'h2):(1'h0)], reg82[(4'h8):(2'h2)]};
              reg146 <= $signed(reg85);
            end
          else
            begin
              reg145 <= ((^~$unsigned($signed(((8'hb7) ?
                  wire133 : reg96)))) | $signed({$signed((reg95 ?
                      reg146 : reg94)),
                  (((8'ha1) ? reg99 : reg99) || reg101[(2'h3):(2'h3)])}));
              reg146 <= $unsigned(wire72[(1'h1):(1'h1)]);
              reg147 <= (&(~reg98));
              reg148 <= wire131[(2'h2):(2'h2)];
              reg149 <= $signed((($signed($signed(wire69)) ?
                  $unsigned((8'hbb)) : wire72[(1'h0):(1'h0)]) ~^ (&((reg102 ?
                  wire136 : reg95) >> (!reg147)))));
            end
        end
      else
        begin
          reg139 <= ($unsigned(wire131) && {reg101, (^~reg81[(3'h5):(2'h2)])});
          reg140 <= reg95[(3'h5):(3'h5)];
        end
      reg150 <= $unsigned((($signed((reg94 ? (8'hbb) : reg93)) ~^ {(reg87 ?
              reg103 : wire69),
          (reg145 >>> (7'h44))}) | ((+$unsigned(wire134)) ?
          wire137[(3'h4):(1'h0)] : $unsigned((wire75 ? wire76 : wire134)))));
      reg151 <= $unsigned((($signed((~reg143)) >= (~|(wire76 ?
              wire69 : (8'ha8)))) ?
          ($signed((reg103 >>> reg95)) ?
              (~&(reg93 != reg88)) : ({(8'hac), reg91} && (reg146 ?
                  reg102 : reg77))) : wire70[(4'hc):(4'h9)]));
    end
  always
    @(posedge clk) begin
      reg152 <= {wire131};
      reg153 <= ((-reg149) ^ reg145);
      if ({$unsigned(reg86[(3'h5):(3'h5)]), reg140[(3'h6):(3'h4)]})
        begin
          reg154 <= $unsigned(((8'hac) ?
              $signed((^~reg79[(4'hb):(1'h1)])) : (($unsigned(reg95) ?
                  (wire75 + reg83) : reg90[(1'h1):(1'h1)]) >= wire71[(1'h0):(1'h0)])));
          reg155 <= reg140;
        end
      else
        begin
          reg154 <= reg146;
          reg155 <= {$unsigned((wire70[(4'h9):(2'h3)] ?
                  reg140[(4'h8):(2'h3)] : (wire70[(2'h2):(1'h1)] && $signed(reg96)))),
              reg155[(3'h4):(2'h2)]};
        end
    end
  assign wire156 = reg90[(3'h5):(2'h3)];
  assign wire157 = (reg142 ?
                       (~|$signed(wire133)) : ($signed($signed((reg87 ?
                           wire136 : wire133))) || reg101[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg158 <= {(!reg98)};
      reg159 <= (~reg90);
    end
  module160 #() modinst209 (.y(wire208), .wire163(wire137), .wire164(reg100), .wire161(reg147), .wire162(wire70), .wire165(reg86), .clk(clk));
  module210 #() modinst283 (wire282, clk, reg102, reg142, wire133, reg90, wire75);
  always
    @(posedge clk) begin
      if (($unsigned(wire156[(4'hb):(2'h2)]) < (~$unsigned($signed($unsigned(reg77))))))
        begin
          reg284 <= reg99[(2'h2):(1'h1)];
          reg285 <= $unsigned(($signed(({reg92, reg102} || {reg86,
              reg77})) + ($unsigned($unsigned(reg90)) ~^ reg147[(3'h7):(3'h5)])));
          reg286 <= (!(wire73 * $unsigned(wire157[(3'h6):(3'h6)])));
          reg287 <= reg86;
        end
      else
        begin
          reg284 <= ((~^reg91) & reg139);
        end
      if ((8'had))
        begin
          reg288 <= (reg155 ? reg102[(1'h1):(1'h1)] : reg85);
          if ((wire282[(1'h0):(1'h0)] || (($signed($signed(wire76)) ?
                  ({wire208} && wire136[(5'h13):(4'h9)]) : reg152) ?
              reg142[(4'hb):(4'h9)] : (~|((reg152 ? wire137 : reg155) ?
                  $unsigned(reg103) : $unsigned((7'h41)))))))
            begin
              reg289 <= wire76;
              reg290 <= $unsigned((~(({reg102} ?
                  $unsigned(wire76) : $signed((8'hb3))) - (&(wire75 ?
                  wire75 : reg103)))));
              reg291 <= (|($unsigned(reg100) ?
                  reg79[(3'h6):(3'h6)] : $unsigned(reg97)));
            end
          else
            begin
              reg289 <= (~&$unsigned(((|{reg145, reg91}) ?
                  reg146[(1'h0):(1'h0)] : wire74[(2'h2):(1'h1)])));
            end
          reg292 <= {reg90[(4'hb):(2'h3)],
              $unsigned({$unsigned((wire137 ? reg284 : reg146)),
                  ($signed(wire157) + (wire75 ? wire136 : reg286))})};
          if (reg159)
            begin
              reg293 <= (+$signed(($unsigned(reg287) ?
                  reg290[(2'h2):(2'h2)] : reg91[(2'h2):(2'h2)])));
            end
          else
            begin
              reg293 <= (8'hb9);
            end
          reg294 <= wire157;
        end
      else
        begin
          reg288 <= reg99[(3'h6):(3'h5)];
          reg289 <= (((&(reg152 <= {(8'hbf)})) < {((~^reg84) && $unsigned(wire69)),
                  (+reg140[(4'ha):(3'h6)])}) ?
              ((~(8'h9d)) ?
                  (wire137 ?
                      reg77 : reg149[(2'h2):(1'h0)]) : (reg97[(3'h6):(3'h4)] == ((reg292 + (8'hb0)) ?
                      (~^reg93) : reg99[(2'h2):(2'h2)]))) : $unsigned(((~^$signed(reg98)) <= (reg290[(1'h0):(1'h0)] < (~^reg90)))));
          reg290 <= ((8'hb8) ?
              {$signed(wire76[(3'h6):(1'h0)])} : ($unsigned(({(8'hb1),
                  reg102} << (reg287 ?
                  (8'hac) : reg158))) == {$signed($unsigned(wire135)),
                  ((!reg77) >>> (reg77 ^ reg151))}));
        end
      reg295 <= reg87;
    end
  always
    @(posedge clk) begin
      reg296 <= reg288[(2'h2):(2'h2)];
      reg297 <= $signed(reg158);
      reg298 <= $signed((reg155 ? $unsigned(wire73) : (~reg84)));
    end
endmodule

module module210  (y, clk, wire215, wire214, wire213, wire212, wire211);
  output wire [(32'h327):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire215;
  input wire [(5'h10):(1'h0)] wire214;
  input wire signed [(4'h8):(1'h0)] wire213;
  input wire signed [(5'h11):(1'h0)] wire212;
  input wire signed [(4'h8):(1'h0)] wire211;
  wire [(4'h9):(1'h0)] wire281;
  wire signed [(4'hf):(1'h0)] wire280;
  wire [(2'h3):(1'h0)] wire279;
  wire [(4'hb):(1'h0)] wire260;
  wire [(4'hb):(1'h0)] wire259;
  wire [(5'h13):(1'h0)] wire258;
  wire [(4'ha):(1'h0)] wire250;
  wire signed [(2'h2):(1'h0)] wire249;
  wire [(4'hf):(1'h0)] wire248;
  wire signed [(4'ha):(1'h0)] wire247;
  wire signed [(5'h10):(1'h0)] wire233;
  wire [(4'ha):(1'h0)] wire232;
  wire signed [(5'h13):(1'h0)] wire217;
  wire signed [(3'h4):(1'h0)] wire216;
  reg signed [(3'h6):(1'h0)] reg278 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg277 = (1'h0);
  reg [(3'h7):(1'h0)] reg276 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg275 = (1'h0);
  reg [(5'h13):(1'h0)] reg274 = (1'h0);
  reg [(5'h15):(1'h0)] reg273 = (1'h0);
  reg [(5'h13):(1'h0)] reg272 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg271 = (1'h0);
  reg [(4'hf):(1'h0)] reg270 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg269 = (1'h0);
  reg [(5'h14):(1'h0)] reg268 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg267 = (1'h0);
  reg [(4'hc):(1'h0)] reg266 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg265 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg264 = (1'h0);
  reg [(4'h9):(1'h0)] reg263 = (1'h0);
  reg [(4'he):(1'h0)] reg262 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg261 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg257 = (1'h0);
  reg [(5'h13):(1'h0)] reg256 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg255 = (1'h0);
  reg [(4'hb):(1'h0)] reg254 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg253 = (1'h0);
  reg [(4'he):(1'h0)] reg252 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg251 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg246 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg245 = (1'h0);
  reg [(4'hb):(1'h0)] reg244 = (1'h0);
  reg [(4'hc):(1'h0)] reg243 = (1'h0);
  reg [(2'h3):(1'h0)] reg242 = (1'h0);
  reg [(3'h6):(1'h0)] reg241 = (1'h0);
  reg [(4'hb):(1'h0)] reg240 = (1'h0);
  reg [(4'he):(1'h0)] reg239 = (1'h0);
  reg [(5'h13):(1'h0)] reg238 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg237 = (1'h0);
  reg [(5'h10):(1'h0)] reg236 = (1'h0);
  reg [(3'h7):(1'h0)] reg235 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg234 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg231 = (1'h0);
  reg [(4'hc):(1'h0)] reg230 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg229 = (1'h0);
  reg [(3'h6):(1'h0)] reg228 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg227 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg226 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg225 = (1'h0);
  reg [(2'h3):(1'h0)] reg224 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg223 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg222 = (1'h0);
  reg [(5'h14):(1'h0)] reg221 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg220 = (1'h0);
  reg [(4'h9):(1'h0)] reg219 = (1'h0);
  reg [(5'h14):(1'h0)] reg218 = (1'h0);
  assign y = {wire281,
                 wire280,
                 wire279,
                 wire260,
                 wire259,
                 wire258,
                 wire250,
                 wire249,
                 wire248,
                 wire247,
                 wire233,
                 wire232,
                 wire217,
                 wire216,
                 reg278,
                 reg277,
                 reg276,
                 reg275,
                 reg274,
                 reg273,
                 reg272,
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
                 reg261,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
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
                 reg236,
                 reg235,
                 reg234,
                 reg231,
                 reg230,
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
                 (1'h0)};
  assign wire216 = {(wire215 ?
                           (+(~&$signed(wire213))) : (~^wire212[(1'h0):(1'h0)])),
                       wire211[(3'h6):(3'h6)]};
  assign wire217 = $signed($unsigned((wire212 > $unsigned(((8'ha4) >> wire211)))));
  always
    @(posedge clk) begin
      reg218 <= (((8'ha4) != $unsigned(((wire217 ? wire217 : (8'hac)) ?
          (^~(8'ha6)) : $unsigned(wire211)))) < ((^($unsigned(wire214) ?
              (~&wire217) : wire216[(3'h4):(1'h1)])) ?
          $unsigned((^(wire212 & wire214))) : ({wire216[(2'h3):(2'h2)]} ?
              $unsigned((wire214 ?
                  wire217 : wire215)) : $signed((wire211 ^~ wire211)))));
      reg219 <= ({(~&($unsigned(wire211) <<< (reg218 ? reg218 : wire217)))} ?
          wire217[(1'h1):(1'h0)] : $unsigned(wire217[(5'h13):(4'ha)]));
      reg220 <= $signed(((((7'h42) < reg218) >= (wire211 ^~ (reg219 - wire212))) ~^ wire211));
      if ($signed(wire213))
        begin
          reg221 <= wire212;
          reg222 <= $signed(reg219);
          reg223 <= (wire212 >= $signed(reg220));
          if (wire211)
            begin
              reg224 <= {$unsigned((^reg221))};
              reg225 <= {({wire213,
                      (|wire213[(3'h4):(2'h3)])} <<< reg222[(4'he):(3'h6)]),
                  (~^($unsigned((reg221 ? wire213 : (8'hbd))) ?
                      (((8'ha1) ?
                          reg220 : reg223) ^ (|reg219)) : $signed($unsigned(reg224))))};
              reg226 <= $signed({$unsigned($signed((^reg220)))});
              reg227 <= (((|$signed((reg225 ? reg222 : reg218))) ?
                  {$unsigned((wire215 & (8'had))),
                      wire211[(2'h3):(1'h0)]} : $signed(((wire216 ~^ reg220) ?
                      (^(8'hb3)) : $signed(reg220)))) || reg220);
            end
          else
            begin
              reg224 <= reg222;
            end
          if ({wire214[(3'h6):(3'h4)]})
            begin
              reg228 <= wire214;
              reg229 <= wire214[(3'h5):(1'h0)];
              reg230 <= ($signed(reg222[(1'h0):(1'h0)]) > $unsigned((($unsigned(reg224) - (-wire217)) ^ $unsigned((~&reg224)))));
            end
          else
            begin
              reg228 <= $signed(reg222);
              reg229 <= $signed(reg223[(1'h1):(1'h0)]);
              reg230 <= (~^$signed(({(8'hbe)} ?
                  $unsigned((reg219 + reg226)) : $unsigned(wire213[(3'h6):(3'h5)]))));
              reg231 <= {(+{reg219, $unsigned($signed(reg228))}),
                  $unsigned(wire215)};
            end
        end
      else
        begin
          reg221 <= $signed((~^$signed(({(8'hb5), (8'ha9)} ?
              (wire216 ? reg231 : reg225) : (reg227 ? wire217 : wire215)))));
          reg222 <= ($signed((!reg221[(3'h5):(3'h4)])) ?
              {$signed($unsigned(reg226))} : reg229);
          reg223 <= $unsigned(((~^$signed($unsigned(wire212))) ?
              wire212[(3'h5):(2'h2)] : $unsigned((reg230 ?
                  (8'haf) : $signed((8'hbc))))));
        end
    end
  assign wire232 = (8'hba);
  assign wire233 = {reg227[(4'hb):(4'h9)],
                       $signed($unsigned($signed({reg220, wire213})))};
  always
    @(posedge clk) begin
      if ($signed((-((~(reg221 ? (8'ha7) : (8'h9d))) ?
          (((8'h9e) >>> reg227) ?
              reg229[(4'h9):(2'h2)] : $unsigned((8'ha7))) : (wire217[(4'h8):(2'h2)] ?
              $signed(wire213) : (~|wire233))))))
        begin
          reg234 <= ($signed(($signed((wire232 ? reg218 : (8'hbf))) ?
              wire213[(3'h4):(1'h1)] : wire233[(4'h9):(2'h2)])) == {wire211});
          if (reg223[(1'h1):(1'h0)])
            begin
              reg235 <= (~reg230[(2'h3):(2'h2)]);
              reg236 <= {((+(|(-reg221))) ? reg225 : (8'hbf)),
                  (reg235 && (reg234[(2'h2):(1'h1)] > $unsigned((^~wire233))))};
              reg237 <= (~^$unsigned($signed($unsigned(wire211[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg235 <= $unsigned(wire213);
              reg236 <= (8'hbf);
              reg237 <= reg235[(3'h5):(2'h3)];
              reg238 <= ((wire217[(3'h5):(2'h2)] ?
                      wire233 : reg234[(1'h1):(1'h1)]) ?
                  $unsigned(wire213[(3'h4):(1'h1)]) : (8'hb4));
            end
          reg239 <= wire232[(4'h9):(2'h3)];
          if ({reg218[(3'h6):(3'h5)],
              $signed(($signed($signed(reg231)) ?
                  ((reg231 >> (8'hb2)) ?
                      $signed((8'hae)) : reg239[(3'h4):(2'h2)]) : $unsigned((~&reg229))))})
            begin
              reg240 <= $unsigned(reg230);
              reg241 <= (&$signed(reg234[(2'h2):(2'h2)]));
              reg242 <= {$unsigned((reg231 || $signed($unsigned(reg224))))};
              reg243 <= ((^({reg240} < (reg236[(4'h8):(2'h3)] ?
                  (8'hab) : wire214[(2'h3):(1'h0)]))) & $unsigned({$unsigned($signed(reg228)),
                  ((reg234 ? reg220 : wire212) ?
                      reg229 : reg228[(3'h6):(3'h4)])}));
              reg244 <= $signed(reg240);
            end
          else
            begin
              reg240 <= $unsigned(reg222[(4'hd):(4'hb)]);
              reg241 <= {wire213[(3'h7):(3'h5)],
                  {(($unsigned((7'h44)) ?
                          reg221[(4'hb):(4'h9)] : $signed(reg242)) <= reg240)}};
            end
          reg245 <= $signed({wire213[(3'h4):(1'h0)]});
        end
      else
        begin
          reg234 <= $unsigned((^(~^(!reg230[(4'ha):(3'h4)]))));
          reg235 <= $signed(($unsigned(wire217[(3'h5):(2'h2)]) && (~&(&(^~reg245)))));
          if ((((|($unsigned(reg229) & reg226)) == (reg220 <= $signed((wire232 && (7'h42))))) ?
              reg245[(2'h2):(1'h1)] : $signed(($unsigned($signed(reg227)) & (&(+wire212))))))
            begin
              reg236 <= {$signed(({(wire211 ? wire215 : (7'h41)),
                      {reg226}} < (~^(reg231 ? reg225 : reg231)))),
                  (($signed($signed((8'hbf))) ?
                      $unsigned((reg224 ?
                          reg224 : reg230)) : reg239) - ((-$unsigned((8'ha7))) >>> (~|(~^reg225))))};
            end
          else
            begin
              reg236 <= (~&$signed(reg226));
              reg237 <= (-reg243[(3'h5):(2'h2)]);
              reg238 <= ($unsigned(((8'hb1) <= reg226[(4'he):(4'ha)])) ?
                  reg244[(4'h9):(3'h4)] : {reg236[(4'hb):(4'ha)],
                      reg223[(1'h1):(1'h1)]});
            end
          if (($unsigned(reg242[(1'h1):(1'h1)]) > (reg245 ?
              {(reg243 == $unsigned(reg242))} : reg222)))
            begin
              reg239 <= $signed({(^$unsigned((wire217 ? (8'hb6) : reg239)))});
              reg240 <= reg236[(4'hb):(4'h9)];
            end
          else
            begin
              reg239 <= (~&$unsigned(wire215));
              reg240 <= (reg234 ?
                  (((8'hb7) >>> (reg231[(5'h11):(3'h5)] ?
                      reg227[(4'hb):(1'h0)] : (^~reg218))) >>> (|wire212)) : ((($signed(reg242) > wire216[(1'h1):(1'h1)]) - reg240[(4'h9):(4'h8)]) ?
                      {$signed((+(8'hb9))),
                          (&(reg231 ? reg239 : reg239))} : ({$signed(reg245),
                          $unsigned(reg229)} == reg229)));
            end
          reg241 <= $signed(reg245[(4'h9):(2'h3)]);
        end
      reg246 <= $unsigned($unsigned((~^reg229)));
    end
  assign wire247 = (reg226 ?
                       reg235 : ($signed(({(8'hb1), reg220} || reg238)) ?
                           $signed($signed($unsigned(reg238))) : (~^reg240)));
  assign wire248 = $unsigned((~&({(-wire212)} ?
                       (wire232 ?
                           (reg234 + (7'h42)) : (reg228 <<< reg226)) : {(!reg244),
                           reg229[(1'h0):(1'h0)]})));
  assign wire249 = {(^$signed((+wire233[(3'h7):(3'h7)]))),
                       $unsigned(reg219[(1'h0):(1'h0)])};
  assign wire250 = reg231[(4'hb):(4'ha)];
  always
    @(posedge clk) begin
      if (reg221[(4'hd):(4'hd)])
        begin
          if ($signed(reg234[(1'h1):(1'h1)]))
            begin
              reg251 <= {(8'h9f),
                  $signed((reg245[(4'ha):(4'ha)] ?
                      (&(8'hb9)) : (wire217[(4'h9):(4'h9)] ?
                          $signed((8'hac)) : reg218[(5'h13):(3'h5)])))};
              reg252 <= $signed((reg218 > {$unsigned($unsigned((8'ha7)))}));
              reg253 <= $signed(reg252[(4'hc):(2'h2)]);
              reg254 <= reg237[(4'he):(3'h6)];
            end
          else
            begin
              reg251 <= ($signed((reg224 ?
                  $signed((wire233 ?
                      reg226 : reg225)) : reg226[(4'hf):(4'ha)])) != (8'haa));
              reg252 <= (wire213[(2'h2):(1'h0)] ?
                  reg218[(4'he):(4'h8)] : $signed((({reg252} ^~ wire249[(1'h0):(1'h0)]) != {(reg228 ?
                          reg218 : reg225)})));
              reg253 <= reg228[(1'h1):(1'h0)];
              reg254 <= (-$signed((~&(8'hb7))));
            end
        end
      else
        begin
          reg251 <= $signed($signed(reg246[(3'h5):(1'h0)]));
          reg252 <= $unsigned(($signed((+(^~(8'h9e)))) == $unsigned($signed($signed(reg236)))));
        end
      reg255 <= ((-$unsigned(({reg220} ?
              $unsigned(reg239) : (wire248 + wire213)))) ?
          $signed(reg235[(3'h6):(1'h1)]) : reg242);
      reg256 <= $signed($unsigned(reg230));
      reg257 <= reg235[(2'h3):(1'h0)];
    end
  assign wire258 = (~^wire213);
  assign wire259 = $signed({reg231[(3'h7):(1'h1)], (8'h9c)});
  assign wire260 = (($signed(((reg228 << wire213) && $unsigned((7'h43)))) ^ ((reg244 || (&reg241)) >= ((wire249 ?
                           reg222 : reg251) >>> $unsigned(reg218)))) ?
                       (reg241 + (~|(reg256 ?
                           (reg238 <= wire232) : (^~(8'h9e))))) : (8'h9f));
  always
    @(posedge clk) begin
      reg261 <= (~^(((reg219 ? $unsigned(reg218) : (reg224 ? reg234 : reg220)) ?
              $unsigned(((8'hbb) ? reg222 : reg252)) : $signed((~|(8'ha0)))) ?
          (^~$signed(reg226[(5'h12):(5'h11)])) : ($signed((reg251 <= reg227)) ?
              ((reg226 ? reg252 : reg221) ?
                  reg219 : $signed(wire211)) : reg236[(3'h5):(3'h4)])));
      reg262 <= ((reg234[(2'h3):(1'h0)] <<< $unsigned({wire216,
              $unsigned(reg228)})) ?
          reg230[(2'h2):(1'h1)] : {({{reg229}} ?
                  {$signed(reg219), $signed((8'ha8))} : $unsigned({reg222})),
              (~|$unsigned(wire248[(4'hb):(4'h9)]))});
      reg263 <= ((^~$unsigned((!(+reg252)))) ^~ {(reg220 < (wire258 ?
              ((8'hb2) ? wire211 : (7'h42)) : (reg219 >= reg256)))});
      if ((~^((8'hba) ^~ wire217[(2'h3):(1'h0)])))
        begin
          reg264 <= $signed((reg263 > wire217[(4'hb):(3'h7)]));
          reg265 <= (wire212 >= $signed(wire233[(5'h10):(4'hd)]));
          if ({wire232[(2'h2):(2'h2)]})
            begin
              reg266 <= (reg256 || ({$unsigned(reg261)} ?
                  wire248[(1'h1):(1'h0)] : reg261));
            end
          else
            begin
              reg266 <= (|wire260[(3'h7):(2'h3)]);
              reg267 <= reg242;
              reg268 <= $unsigned(wire260[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg264 <= reg223;
          reg265 <= (wire250 ?
              (-$unsigned(wire215)) : $signed(($signed((+reg222)) || (~^reg235[(3'h6):(3'h5)]))));
          if (reg245)
            begin
              reg266 <= reg257;
              reg267 <= (-$unsigned($unsigned(((wire232 ?
                  wire215 : reg229) == (8'ha4)))));
              reg268 <= ((reg265[(4'hf):(3'h4)] ?
                  wire213[(3'h4):(3'h4)] : (|(~|(wire258 || reg267)))) - ((+$unsigned($unsigned((8'ha8)))) << (&reg220)));
              reg269 <= (~(wire260 ? wire213 : wire258));
            end
          else
            begin
              reg266 <= ((~($unsigned($unsigned(reg246)) << wire247[(4'h8):(3'h5)])) <= {reg269});
              reg267 <= $signed((+(wire247[(3'h7):(3'h5)] ?
                  {$signed((8'ha2)),
                      (reg222 >= reg239)} : ((wire211 ~^ (8'hab)) >>> (reg231 ?
                      wire232 : (8'hb4))))));
              reg268 <= ((^~$unsigned($unsigned(wire260[(2'h2):(2'h2)]))) >= (+{$unsigned($signed(wire233))}));
            end
          if ($signed((($signed(wire259) >>> {wire216}) ?
              ((~|reg251) | (wire211 ? (8'hb1) : reg228)) : reg222)))
            begin
              reg270 <= ($unsigned(reg254[(3'h7):(3'h4)]) ?
                  (($signed((wire248 ? (8'hae) : reg225)) ?
                      ($signed(reg234) ?
                          (reg254 + reg269) : (reg239 >> reg219)) : ($signed((8'ha6)) ?
                          (wire213 ? reg265 : reg240) : (~reg235))) ^ (wire214 ?
                      (~&(^~(8'ha8))) : ($signed(reg226) ?
                          $unsigned((8'ha6)) : wire211[(1'h0):(1'h0)]))) : $unsigned({(^~$signed(wire248))}));
              reg271 <= reg270;
              reg272 <= (8'hbb);
              reg273 <= (8'hba);
              reg274 <= $signed((!(((8'hb9) ? wire258 : $signed(reg253)) ?
                  $unsigned($signed(reg241)) : (^(^reg227)))));
            end
          else
            begin
              reg270 <= $unsigned($unsigned(($unsigned($signed(wire213)) >> $signed((!wire233)))));
              reg271 <= (((!((!reg244) ?
                  (reg226 ^~ reg234) : (reg224 - reg274))) >>> reg265) ^ {(reg221[(5'h13):(4'hc)] ?
                      (8'hbe) : ((reg240 ? wire248 : reg237) ?
                          reg267 : $unsigned(reg264)))});
              reg272 <= $unsigned((($unsigned(reg257[(2'h3):(1'h1)]) ?
                      (((8'hab) ? (8'hb0) : wire250) ?
                          wire217 : (^wire216)) : (-(reg228 ?
                          reg224 : reg221))) ?
                  $unsigned((wire213[(2'h2):(1'h1)] ?
                      $signed(reg267) : $unsigned(reg221))) : reg225[(5'h10):(1'h0)]));
              reg273 <= ($unsigned($signed(reg229)) <= (^~((&$signed(wire248)) ^~ reg273)));
              reg274 <= wire216;
            end
        end
      if (reg267)
        begin
          reg275 <= (8'hb8);
          reg276 <= reg275[(1'h1):(1'h0)];
        end
      else
        begin
          reg275 <= reg236;
          reg276 <= (reg251 ?
              {(~|$unsigned((-reg218)))} : wire212[(3'h5):(2'h3)]);
          reg277 <= ((&(({reg240} ?
              {reg222} : reg229) | (!(^~(8'hb4))))) != (~^$unsigned($signed(wire260[(4'h8):(3'h5)]))));
          reg278 <= ((^(^(reg277[(1'h1):(1'h0)] ?
              reg254 : $signed(wire211)))) <= {$unsigned((~$unsigned(reg264)))});
        end
    end
  assign wire279 = $unsigned((8'hb6));
  assign wire280 = $unsigned((reg266[(3'h7):(1'h1)] ?
                       reg228[(2'h2):(1'h1)] : (8'hab)));
  assign wire281 = wire250[(1'h1):(1'h1)];
endmodule

module module160  (y, clk, wire165, wire164, wire163, wire162, wire161);
  output wire [(32'h1e7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire165;
  input wire [(4'h8):(1'h0)] wire164;
  input wire signed [(4'h8):(1'h0)] wire163;
  input wire [(4'h8):(1'h0)] wire162;
  input wire signed [(4'h8):(1'h0)] wire161;
  wire signed [(3'h7):(1'h0)] wire207;
  wire [(4'h9):(1'h0)] wire206;
  wire signed [(4'h9):(1'h0)] wire205;
  wire signed [(3'h6):(1'h0)] wire204;
  wire [(4'hc):(1'h0)] wire203;
  wire signed [(4'h8):(1'h0)] wire202;
  wire [(5'h13):(1'h0)] wire201;
  wire signed [(3'h5):(1'h0)] wire197;
  wire signed [(5'h15):(1'h0)] wire196;
  wire signed [(5'h13):(1'h0)] wire195;
  wire [(5'h13):(1'h0)] wire194;
  wire [(5'h10):(1'h0)] wire193;
  wire [(4'hb):(1'h0)] wire192;
  wire [(5'h13):(1'h0)] wire181;
  wire signed [(3'h6):(1'h0)] wire180;
  wire [(4'h9):(1'h0)] wire179;
  reg signed [(3'h4):(1'h0)] reg200 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg198 = (1'h0);
  reg [(4'h9):(1'h0)] reg191 = (1'h0);
  reg signed [(4'he):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg189 = (1'h0);
  reg [(4'hf):(1'h0)] reg188 = (1'h0);
  reg [(3'h4):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg186 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg185 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg183 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg178 = (1'h0);
  reg [(4'hd):(1'h0)] reg177 = (1'h0);
  reg [(4'hb):(1'h0)] reg176 = (1'h0);
  reg [(5'h15):(1'h0)] reg175 = (1'h0);
  reg [(5'h10):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg172 = (1'h0);
  reg [(4'hc):(1'h0)] reg171 = (1'h0);
  reg [(3'h7):(1'h0)] reg170 = (1'h0);
  reg [(3'h7):(1'h0)] reg169 = (1'h0);
  reg [(4'hf):(1'h0)] reg168 = (1'h0);
  reg [(3'h7):(1'h0)] reg167 = (1'h0);
  reg [(3'h7):(1'h0)] reg166 = (1'h0);
  assign y = {wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire181,
                 wire180,
                 wire179,
                 reg200,
                 reg199,
                 reg198,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg166 <= {(wire165 != wire165[(3'h4):(3'h4)])};
      if ((|{reg166[(2'h2):(1'h1)]}))
        begin
          if ((((((reg166 - wire164) || (^wire165)) && ($signed(reg166) ?
              reg166[(3'h5):(2'h3)] : (^wire161))) >= $unsigned((&wire161))) ^ (&(wire165[(3'h4):(1'h1)] < $signed(((8'hb1) & wire161))))))
            begin
              reg167 <= ((~reg166) && ((|($signed(wire165) ~^ $signed(wire162))) ?
                  $signed(($signed(wire165) - (-(8'ha6)))) : (~wire164[(2'h2):(1'h0)])));
              reg168 <= (((wire164[(2'h3):(2'h3)] ?
                      $signed($signed(wire165)) : ({wire165} == wire161)) ?
                  ((^(reg167 * wire164)) || reg166[(3'h6):(3'h6)]) : ((~&reg167) ?
                      wire163[(2'h2):(2'h2)] : reg166[(1'h1):(1'h1)])) * $signed($unsigned(($signed(wire165) ?
                  {reg167, (8'hbf)} : (^(8'hac))))));
              reg169 <= {wire161[(4'h8):(3'h4)],
                  $unsigned($unsigned((wire165[(2'h2):(1'h0)] ?
                      wire163 : wire161[(1'h0):(1'h0)])))};
              reg170 <= ((&$signed(reg168)) == {reg166[(1'h1):(1'h1)],
                  (wire162 + ($signed(wire161) ?
                      $signed(wire164) : (~&reg169)))});
              reg171 <= ((&(wire162[(3'h4):(3'h4)] ?
                      wire165 : (~|(~|reg168)))) ?
                  wire164[(1'h0):(1'h0)] : ((~&reg167[(3'h5):(1'h1)]) >>> $signed(reg168[(1'h1):(1'h1)])));
            end
          else
            begin
              reg167 <= wire164;
              reg168 <= reg167;
            end
          if (reg166)
            begin
              reg172 <= $signed(((^reg170) | {$signed($signed(reg168)),
                  $unsigned(reg171)}));
              reg173 <= reg168;
              reg174 <= reg171;
              reg175 <= $unsigned(reg171[(4'hc):(4'h8)]);
              reg176 <= (8'hbb);
            end
          else
            begin
              reg172 <= $unsigned((((~&(~^reg175)) ?
                      $signed(wire165[(2'h2):(2'h2)]) : {$signed((7'h41))}) ?
                  $signed(reg173) : (((reg171 <<< reg175) ?
                      wire162 : (^reg173)) >>> (~|(reg169 < wire161)))));
              reg173 <= (~|reg173);
              reg174 <= (8'hba);
              reg175 <= {reg170[(3'h4):(1'h0)]};
            end
        end
      else
        begin
          reg167 <= wire163;
          reg168 <= (~|(8'h9c));
          if (({reg171[(4'ha):(3'h5)], reg176} - reg168[(4'hf):(3'h5)]))
            begin
              reg169 <= (($signed({$signed(reg173),
                      $unsigned(reg168)}) * {reg166}) ?
                  (+((&wire161[(2'h3):(1'h0)]) ?
                      $unsigned($unsigned(reg167)) : ($signed(reg170) ?
                          reg166[(3'h4):(2'h3)] : (reg171 == reg170)))) : $unsigned($unsigned(reg170[(2'h3):(2'h2)])));
              reg170 <= ($signed($unsigned($signed($signed(reg176)))) <= reg175[(4'h8):(4'h8)]);
              reg171 <= ((~&(wire163 ?
                      wire164[(3'h4):(3'h4)] : $unsigned($signed(reg172)))) ?
                  wire164[(2'h3):(1'h1)] : $signed((reg168 != (+(-reg175)))));
              reg172 <= reg170;
              reg173 <= $signed(($signed($signed($signed((8'haa)))) ?
                  reg171 : $signed((~((8'ha4) < reg167)))));
            end
          else
            begin
              reg169 <= $unsigned((!$unsigned($unsigned(wire163[(3'h7):(1'h0)]))));
              reg170 <= (((reg167[(3'h4):(3'h4)] >>> ($signed(reg168) ?
                      (reg170 | (8'h9d)) : (~&reg172))) < wire164[(1'h1):(1'h1)]) ?
                  reg172 : reg166);
            end
          if ($unsigned({(($signed(reg169) <<< (|wire162)) <= $unsigned((reg172 ?
                  reg169 : wire165))),
              ((~|(reg166 ? reg167 : wire164)) ?
                  $signed((reg173 ? reg173 : reg166)) : $unsigned((reg166 ?
                      reg167 : reg168)))}))
            begin
              reg174 <= ((&wire164) ?
                  wire162 : {$unsigned($unsigned((wire165 ? reg173 : wire162))),
                      (wire163[(3'h5):(3'h5)] ?
                          $unsigned((^~reg167)) : ($signed(reg172) | (reg174 ?
                              (8'haa) : wire162)))});
              reg175 <= wire163[(1'h1):(1'h1)];
              reg176 <= wire165;
            end
          else
            begin
              reg174 <= reg168;
              reg175 <= $unsigned({$signed(wire165[(2'h3):(2'h2)]),
                  reg176[(4'h8):(3'h4)]});
            end
        end
      reg177 <= reg169[(3'h5):(1'h0)];
      reg178 <= reg176[(1'h1):(1'h0)];
    end
  assign wire179 = reg177[(3'h7):(3'h4)];
  assign wire180 = ($unsigned($signed((&reg177))) ^~ reg174);
  assign wire181 = ($unsigned(($unsigned($unsigned(wire164)) < wire165)) ?
                       {reg167} : $unsigned($unsigned(($signed((8'hba)) <<< reg169))));
  always
    @(posedge clk) begin
      reg182 <= ($unsigned({reg178, reg177}) ?
          reg170 : ((7'h40) ?
              reg170 : (((reg172 || wire181) ?
                  $signed(reg172) : (reg173 ?
                      reg169 : wire181)) << $signed((&wire181)))));
      reg183 <= $signed((wire162[(4'h8):(2'h3)] ?
          (~|{reg174, (wire164 - wire161)}) : {(8'hb8)}));
      if ($signed((reg178[(5'h10):(3'h5)] ?
          reg168[(3'h6):(3'h5)] : ($signed((|reg168)) ?
              (wire181 ?
                  {(8'ha6)} : $unsigned(reg177)) : (^~(wire161 & wire180))))))
        begin
          reg184 <= reg171[(4'h9):(4'h8)];
        end
      else
        begin
          reg184 <= (&$unsigned((~&(~$unsigned(reg172)))));
          if ((~&(^$unsigned(reg174[(4'h9):(1'h0)]))))
            begin
              reg185 <= $unsigned($signed(wire162));
              reg186 <= (($unsigned({(-wire164)}) ?
                  $unsigned((reg175[(5'h10):(4'ha)] ?
                      (!wire161) : (reg178 ? reg171 : reg176))) : {(8'hb9),
                      $signed(reg176)}) * ((wire162 >>> $unsigned(reg182)) ?
                  ($signed($signed(reg168)) ?
                      (-{wire163, reg182}) : {$signed((8'hb5)),
                          {(8'hae), wire165}}) : $signed(((reg175 ?
                      wire181 : reg182) != ((8'hb3) ? (8'ha1) : reg172)))));
            end
          else
            begin
              reg185 <= (~&$unsigned((-($signed(reg177) - reg176[(4'h9):(3'h7)]))));
              reg186 <= wire162;
              reg187 <= $signed({wire179[(4'h8):(1'h0)]});
            end
          if ($signed($signed((!{reg184}))))
            begin
              reg188 <= reg177[(3'h6):(2'h3)];
              reg189 <= (($unsigned((|reg171[(1'h1):(1'h0)])) == $signed(reg185)) != $unsigned(((^(~&reg182)) ?
                  (reg184 && (~reg168)) : wire180)));
              reg190 <= $signed({$unsigned(reg172),
                  $unsigned(($signed(wire165) ?
                      (reg186 <= (8'haa)) : (~|wire162)))});
            end
          else
            begin
              reg188 <= reg187;
              reg189 <= (^~(|(8'ha9)));
              reg190 <= wire181;
            end
          reg191 <= (!reg171);
        end
    end
  assign wire192 = $signed(((^~(~|{reg187, reg174})) ?
                       (~|$signed($signed(reg173))) : wire162[(3'h5):(1'h1)]));
  assign wire193 = ($signed((^{$unsigned(reg168),
                       (|reg189)})) >> $unsigned((&$unsigned((+(8'hab))))));
  assign wire194 = (!wire165);
  assign wire195 = wire193[(1'h1):(1'h1)];
  assign wire196 = (-reg190);
  assign wire197 = reg177[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg198 <= wire180;
      reg199 <= reg173[(2'h2):(1'h1)];
      reg200 <= $unsigned((((~^$signed(reg190)) == (^~(reg178 ?
              (7'h40) : reg185))) ?
          ((reg175 ?
              {(8'hb4)} : (reg184 >= (8'hb2))) == (~(reg175 != reg174))) : (&(|(^~reg178)))));
    end
  assign wire201 = (!(wire164 ?
                       reg167 : (wire193[(4'hf):(1'h1)] < ((reg184 ?
                           reg171 : wire164) >= reg183))));
  assign wire202 = reg177[(1'h0):(1'h0)];
  assign wire203 = (~&$unsigned($signed(((reg200 ? reg178 : (8'hb7)) ?
                       wire162[(1'h1):(1'h0)] : $unsigned(wire201)))));
  assign wire204 = (wire181[(4'ha):(4'h8)] ?
                       (&(wire162 ?
                           (wire197[(2'h3):(2'h3)] ?
                               $unsigned((8'hbf)) : (wire201 >> reg185)) : {(reg189 ?
                                   reg172 : wire201)})) : (~|$unsigned(($signed(wire161) ?
                           (wire164 ? wire192 : (7'h41)) : reg183))));
  assign wire205 = wire193[(2'h3):(1'h0)];
  assign wire206 = $signed(reg174);
  assign wire207 = $unsigned(((8'h9f) ?
                       $signed(({wire179} ?
                           $signed(wire165) : {wire164})) : (({reg177,
                           (8'ha2)} << (reg167 <<< reg175)) <= ($unsigned(reg198) ?
                           (reg167 ? reg184 : (8'h9c)) : $signed(reg178)))));
endmodule

module module105  (y, clk, wire110, wire109, wire108, wire107, wire106);
  output wire [(32'hfb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire110;
  input wire [(3'h5):(1'h0)] wire109;
  input wire [(2'h3):(1'h0)] wire108;
  input wire [(5'h11):(1'h0)] wire107;
  input wire signed [(5'h12):(1'h0)] wire106;
  wire signed [(4'hc):(1'h0)] wire130;
  wire signed [(4'h8):(1'h0)] wire129;
  wire [(4'ha):(1'h0)] wire128;
  wire signed [(3'h7):(1'h0)] wire116;
  wire [(4'ha):(1'h0)] wire115;
  wire signed [(5'h11):(1'h0)] wire114;
  wire [(3'h4):(1'h0)] wire113;
  wire signed [(4'he):(1'h0)] wire112;
  wire signed [(5'h15):(1'h0)] wire111;
  reg [(5'h13):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg126 = (1'h0);
  reg [(2'h2):(1'h0)] reg125 = (1'h0);
  reg [(5'h10):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg122 = (1'h0);
  reg [(4'hf):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  reg [(5'h14):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg117 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 (1'h0)};
  assign wire111 = wire106[(3'h4):(2'h3)];
  assign wire112 = ((wire111[(4'he):(4'h9)] >> ($signed((wire106 ^~ (8'hba))) & $signed($signed(wire108)))) >> $signed((~&(wire111[(4'he):(4'h8)] ?
                       ((8'hb0) ? (8'hbb) : wire110) : $signed(wire107)))));
  assign wire113 = (!$signed((^~($unsigned(wire106) ~^ $signed(wire110)))));
  assign wire114 = wire106;
  assign wire115 = $unsigned(($signed((~^((8'hb8) * wire113))) && (&$signed($unsigned(wire113)))));
  assign wire116 = (~&$signed($unsigned(wire111[(3'h5):(1'h1)])));
  always
    @(posedge clk) begin
      if ((((wire107 || wire108[(1'h0):(1'h0)]) >> wire107[(3'h7):(1'h0)]) ?
          wire108[(1'h0):(1'h0)] : (~^wire112)))
        begin
          reg117 <= $signed($unsigned({$unsigned((8'hb8)),
              (wire108 ? $unsigned(wire112) : wire106[(1'h1):(1'h1)])}));
          reg118 <= wire113;
          reg119 <= $signed(reg118[(3'h4):(1'h0)]);
          if (wire109[(3'h5):(1'h0)])
            begin
              reg120 <= $unsigned((+(^(&$signed((8'ha7))))));
            end
          else
            begin
              reg120 <= wire114[(4'he):(1'h1)];
              reg121 <= ({$unsigned(((8'hb4) ? wire114 : (reg120 >>> wire110))),
                      wire106} ?
                  (8'hbe) : {($unsigned((^reg118)) < (wire106 ?
                          (-wire114) : $signed(wire109))),
                      {((^~wire107) && $unsigned(reg119)),
                          ($unsigned(reg118) ?
                              ((8'hb8) ~^ wire113) : reg120)}});
              reg122 <= $signed(wire111[(3'h4):(1'h0)]);
            end
        end
      else
        begin
          reg117 <= $unsigned($signed({$signed(reg119[(5'h11):(4'hb)])}));
          if (((8'hbd) >= $unsigned(wire107[(3'h4):(3'h4)])))
            begin
              reg118 <= (($unsigned(wire111[(2'h2):(1'h0)]) && wire110[(3'h5):(2'h3)]) >> ($unsigned({reg118[(3'h7):(3'h4)]}) ?
                  (~$signed((reg119 | reg119))) : wire112));
            end
          else
            begin
              reg118 <= {$unsigned(wire106[(2'h2):(2'h2)])};
              reg119 <= $unsigned(reg117);
              reg120 <= $signed((+reg118[(4'hb):(3'h6)]));
              reg121 <= (~wire111[(4'hf):(1'h0)]);
              reg122 <= ($signed({((reg119 && wire113) != (reg121 ~^ reg121))}) ?
                  $unsigned((reg118 - $signed({wire112}))) : ($unsigned(reg117) ?
                      reg118[(1'h0):(1'h0)] : wire115[(4'ha):(4'h9)]));
            end
          reg123 <= (~|(-{$unsigned($signed(wire116)), reg120}));
        end
      reg124 <= $unsigned(wire108);
      reg125 <= $unsigned(wire111);
      reg126 <= {(((^~(reg123 ? reg122 : reg124)) ?
              $unsigned((reg121 ?
                  (8'hbe) : (8'ha6))) : (-$unsigned(wire113))) > ((~&reg124[(4'hf):(4'hc)]) >= {((8'h9f) | reg125)})),
          (($unsigned((reg122 ? wire112 : (8'ha9))) ?
                  ({wire111,
                      (8'hb2)} <= $signed(wire109)) : ($unsigned(reg122) ?
                      (reg122 | wire109) : reg124[(3'h4):(2'h3)])) ?
              (wire108 <= wire111) : (({reg120, reg120} ?
                      ((8'hb6) >>> wire115) : reg121[(4'hd):(1'h1)]) ?
                  ((^wire113) ?
                      wire107[(2'h2):(1'h1)] : (reg123 ?
                          wire107 : reg117)) : wire109[(3'h4):(1'h0)]))};
      reg127 <= wire114[(3'h6):(3'h6)];
    end
  assign wire128 = wire113;
  assign wire129 = (wire114[(4'hd):(3'h6)] ?
                       wire116[(1'h1):(1'h0)] : $unsigned(reg117[(4'hf):(2'h2)]));
  assign wire130 = wire129[(3'h6):(1'h0)];
endmodule
