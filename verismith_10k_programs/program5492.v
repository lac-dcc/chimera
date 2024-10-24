module top
#(parameter param122 = {(&{((-(8'hba)) >>> ((8'hac) ? (8'haa) : (8'h9c))), (((8'hab) ? (8'hba) : (8'hb1)) != (8'haa))})})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h270):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire121;
  wire [(4'ha):(1'h0)] wire120;
  wire [(5'h14):(1'h0)] wire119;
  wire signed [(5'h12):(1'h0)] wire118;
  wire signed [(5'h12):(1'h0)] wire117;
  wire [(2'h3):(1'h0)] wire116;
  wire signed [(4'h8):(1'h0)] wire115;
  wire signed [(5'h10):(1'h0)] wire114;
  wire signed [(4'he):(1'h0)] wire105;
  wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire28;
  wire signed [(4'hf):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire103;
  reg signed [(4'hc):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(4'hb):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(5'h10):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire105,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire28,
                 wire29,
                 wire103,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
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
                 (1'h0)};
  assign wire4 = ($signed($unsigned(wire0[(1'h1):(1'h1)])) ?
                     ((~((^wire3) - (wire3 ?
                         wire1 : (8'h9e)))) ^~ (($signed(wire0) || $signed(wire3)) <= wire1[(1'h1):(1'h0)])) : (~^($unsigned((wire1 ?
                             wire1 : (8'hb7))) ?
                         ((^wire0) != $unsigned(wire3)) : $signed((wire3 ?
                             (8'hab) : wire3)))));
  assign wire5 = (((wire3[(2'h2):(2'h2)] & wire4[(4'ha):(3'h6)]) ?
                         $unsigned(wire2[(4'he):(4'hd)]) : ((wire2 ?
                             (wire0 <= wire3) : $signed(wire1)) << ((8'hac) & $unsigned(wire2)))) ?
                     ((|$signed($signed(wire2))) || (~^wire1[(1'h1):(1'h0)])) : wire4);
  assign wire6 = ((8'had) <= {$signed(($signed(wire4) ?
                         $signed(wire1) : wire5))});
  assign wire7 = wire3;
  assign wire8 = $signed((!((((8'hb4) >> wire7) > (wire3 - wire4)) ?
                     {$unsigned(wire5)} : wire3[(2'h3):(2'h3)])));
  assign wire9 = $signed($unsigned($signed($signed((wire8 ?
                     wire7 : (8'hbc))))));
  always
    @(posedge clk) begin
      if (wire9[(3'h7):(1'h0)])
        begin
          reg10 <= $signed(wire0[(3'h5):(2'h2)]);
          reg11 <= $unsigned(wire0);
          reg12 <= $unsigned((($signed($signed(wire2)) & (|(wire7 ?
              wire0 : wire0))) >>> $signed(wire3)));
          reg13 <= ((8'ha4) ^ ((^~$signed(wire6)) ?
              $unsigned(({reg10, wire3} ?
                  {wire1, (8'h9c)} : wire2)) : $unsigned($unsigned((wire6 ?
                  wire1 : wire5)))));
        end
      else
        begin
          if (wire6)
            begin
              reg10 <= ($signed((($signed(wire3) ?
                  wire7[(2'h3):(2'h3)] : reg10[(3'h6):(2'h2)]) && wire4[(4'hd):(1'h1)])) == $signed((8'h9f)));
              reg11 <= wire8[(4'ha):(4'ha)];
              reg12 <= ($unsigned((|$signed($signed(wire7)))) ?
                  $unsigned($signed((wire4 ?
                      (reg12 ?
                          reg13 : (7'h43)) : $signed(wire3)))) : $signed((^$signed({reg11}))));
            end
          else
            begin
              reg10 <= wire3;
              reg11 <= (|(wire0[(3'h7):(2'h2)] ?
                  $signed((7'h40)) : ($unsigned($unsigned(wire6)) && {wire9})));
              reg12 <= wire1;
              reg13 <= (reg10[(2'h2):(1'h0)] <<< wire7);
            end
          if ($unsigned({($signed(wire6[(3'h5):(3'h4)]) != (^(wire5 ^ wire5)))}))
            begin
              reg14 <= (((reg12 ?
                      ($signed(wire5) ?
                          (wire5 || (8'ha7)) : $unsigned(wire3)) : wire8) && reg13) ?
                  $signed($unsigned((reg10[(3'h4):(2'h3)] | reg10[(1'h1):(1'h1)]))) : ($signed({wire8[(3'h4):(2'h3)]}) ?
                      ((~^wire9) | (^~(reg12 ? reg11 : wire9))) : {(!wire3)}));
              reg15 <= (({((wire8 ? wire1 : reg13) ~^ (+wire0))} ?
                      (wire8 >> reg14) : $unsigned({wire8})) ?
                  {{(~^(reg12 ? wire7 : wire0))}} : (8'ha3));
              reg16 <= $unsigned($unsigned($signed($signed({reg12}))));
              reg17 <= $signed($unsigned($signed(wire4[(3'h7):(2'h3)])));
            end
          else
            begin
              reg14 <= ($signed($signed(wire6)) == {wire9, wire7});
              reg15 <= reg14;
              reg16 <= $unsigned((&wire9[(2'h2):(1'h1)]));
              reg17 <= wire2;
            end
          reg18 <= {$signed($signed((~|$signed(reg12))))};
        end
      reg19 <= {$unsigned((8'hbd)),
          $signed((($unsigned(wire7) & $signed(wire2)) && wire8))};
      if ($signed(((^~(~wire3[(2'h3):(2'h2)])) + wire1[(2'h3):(1'h1)])))
        begin
          reg20 <= ({$signed(wire1[(3'h4):(1'h0)])} << wire4);
          reg21 <= (+reg17[(4'h8):(4'h8)]);
          reg22 <= $signed((~^(&{$signed(reg16)})));
          if (($signed($signed(((reg18 < wire2) ?
              (reg12 > reg17) : (|reg15)))) != reg10))
            begin
              reg23 <= $signed({(((~&reg22) * wire1) ?
                      ($unsigned(wire6) ?
                          {reg19} : wire4[(3'h7):(3'h6)]) : wire9),
                  $unsigned($unsigned($unsigned(reg20)))});
            end
          else
            begin
              reg23 <= wire9;
            end
          reg24 <= $unsigned((~($signed(reg12[(4'he):(4'he)]) ?
              wire9[(4'h9):(3'h6)] : (|$signed(reg14)))));
        end
      else
        begin
          if ($signed(wire3))
            begin
              reg20 <= (reg15[(1'h1):(1'h1)] ?
                  (wire5[(4'hd):(1'h0)] ?
                      ((reg23 ^ $signed(reg23)) ?
                          ({reg16} ^~ ((8'hb6) ?
                              reg10 : reg13)) : reg20[(5'h14):(1'h1)]) : $unsigned($unsigned({wire9,
                          reg17}))) : (reg23 | ($unsigned(reg24[(2'h3):(2'h3)]) ?
                      reg15 : wire3[(1'h1):(1'h0)])));
              reg21 <= ((~reg10) ?
                  $unsigned((($unsigned(wire0) - (~^reg11)) ?
                      ($signed(reg15) ?
                          $signed(reg13) : reg13[(3'h6):(3'h5)]) : $signed(((8'ha0) > reg15)))) : $unsigned(reg17[(4'ha):(4'h8)]));
              reg22 <= ($unsigned((8'hb1)) ?
                  (~wire4) : {$signed(wire3[(3'h4):(2'h3)]), {(8'hb5)}});
              reg23 <= reg19;
              reg24 <= $signed(wire0);
            end
          else
            begin
              reg20 <= $unsigned($signed((&(8'hbf))));
              reg21 <= ($unsigned(reg22) <<< $unsigned($unsigned(reg18)));
              reg22 <= (!$unsigned($signed(((&wire7) << ((8'hbf) > wire1)))));
              reg23 <= $signed(wire5[(5'h12):(2'h3)]);
            end
        end
      if ((reg19[(3'h7):(1'h1)] ?
          $signed(reg16[(3'h6):(3'h5)]) : $unsigned((wire6 ?
              wire2[(3'h7):(2'h3)] : ({wire4, (8'hbd)} != reg11)))))
        begin
          reg25 <= {$signed($signed($signed($signed(wire8))))};
        end
      else
        begin
          reg25 <= $unsigned((((|(^~reg22)) ?
              reg20[(5'h11):(5'h10)] : wire3[(1'h1):(1'h1)]) == (&(&(wire0 ?
              wire7 : reg22)))));
          reg26 <= (^({$signed(wire0)} ?
              (~{(-reg19), $signed(reg14)}) : {$signed((reg14 - reg15)),
                  (~|reg25)}));
          reg27 <= {$signed(reg19[(4'ha):(3'h7)]), $signed(reg14)};
        end
    end
  assign wire28 = (reg10 ^~ ({reg12} ?
                      (reg22[(5'h10):(4'he)] ?
                          reg17 : {$signed(wire9),
                              $signed(reg13)}) : (~&$signed(reg19))));
  assign wire29 = $signed(((~^wire5[(1'h0):(1'h0)]) ?
                      $unsigned((8'hb3)) : $unsigned(reg14)));
  module30 #() modinst104 (wire103, clk, wire9, reg16, reg19, reg23);
  assign wire105 = (-wire1[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg106 <= reg12;
    end
  always
    @(posedge clk) begin
      reg107 <= $unsigned((|(^wire0)));
      reg108 <= reg26[(2'h3):(2'h2)];
      if (((!$signed(reg106[(4'he):(4'hd)])) ?
          $unsigned(($unsigned($unsigned(wire8)) ?
              {wire2} : (~&$signed(wire1)))) : $unsigned({(reg21[(2'h3):(1'h0)] == ((8'hb8) <= reg11)),
              $unsigned($signed(reg13))})))
        begin
          reg109 <= $signed($signed(wire6));
          reg110 <= wire105;
          reg111 <= wire5[(4'h9):(3'h4)];
          reg112 <= reg16;
        end
      else
        begin
          reg109 <= reg25[(4'h8):(4'h8)];
          reg110 <= ($unsigned(reg109) <= (&wire3[(2'h3):(1'h0)]));
        end
    end
  always
    @(posedge clk) begin
      reg113 <= {wire28[(4'ha):(4'h9)]};
    end
  assign wire114 = (~$unsigned(($signed({reg26, reg112}) ?
                       (~{(8'ha5)}) : {$unsigned((8'h9e))})));
  assign wire115 = (wire28 ? wire8 : (~$unsigned((&(reg12 ^~ wire6)))));
  assign wire116 = ((8'hae) * (reg21 >= (wire3[(1'h1):(1'h1)] ?
                       {$signed(reg109),
                           reg22[(4'hd):(3'h7)]} : $unsigned($signed(reg13)))));
  assign wire117 = (reg18 ?
                       (wire2 | wire114[(4'hc):(4'h8)]) : (($unsigned($unsigned(wire114)) >> $unsigned($unsigned((8'h9f)))) || (($signed((8'hb8)) < (reg18 - (7'h43))) >>> $unsigned(reg20[(2'h3):(2'h2)]))));
  assign wire118 = $signed($signed((+(wire7 ~^ wire117))));
  assign wire119 = (((wire114 ? wire114 : $signed((reg108 != wire4))) ?
                       $unsigned(((reg109 ? wire115 : reg23) ?
                           $unsigned(wire117) : reg23)) : (|{(reg15 ?
                               reg111 : reg23),
                           (reg108 ?
                               wire9 : reg17)})) | ((((reg18 ~^ (8'hb8)) == $signed(reg21)) ?
                           reg13[(2'h2):(1'h0)] : reg110[(4'ha):(1'h1)]) ?
                       $signed($unsigned((reg12 + reg16))) : (($unsigned(wire5) && (reg109 <= (7'h42))) ?
                           wire8 : $signed((reg25 ? wire28 : reg24)))));
  assign wire120 = (8'ha3);
  assign wire121 = ({((wire8 ? wire118 : reg22[(4'hf):(3'h6)]) <= wire117),
                       (-($unsigned((8'hae)) <= (&reg14)))} > reg106[(4'he):(4'ha)]);
endmodule

module module30
#(parameter param101 = (-(((~((8'ha1) ? (8'ha2) : (8'haf))) ? {(8'hba), ((8'hb6) << (8'ha0))} : (((8'hb9) ? (8'ha7) : (8'hbd)) << {(8'ha3), (8'hb2)})) <= ((~&((8'hbd) ? (8'ha5) : (8'hb6))) ? (~|(~(8'haf))) : (((8'hbd) || (7'h43)) ~^ ((8'ha4) ^~ (8'ha5)))))), 
parameter param102 = param101)
(y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'h1a0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire34;
  input wire [(4'hd):(1'h0)] wire33;
  input wire [(4'he):(1'h0)] wire32;
  input wire signed [(4'ha):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire100;
  wire [(4'hd):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire78;
  wire signed [(4'hc):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire74;
  wire signed [(3'h7):(1'h0)] wire72;
  wire signed [(4'hf):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire51;
  wire signed [(4'h9):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire signed [(3'h5):(1'h0)] wire35;
  reg signed [(5'h11):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  assign y = {wire100,
                 wire98,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire72,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 (1'h0)};
  assign wire35 = wire34;
  assign wire36 = wire33;
  assign wire37 = ((^~wire32[(4'h9):(3'h6)]) == (wire31 < (~^wire34[(2'h3):(2'h2)])));
  assign wire38 = $signed($unsigned((-$unsigned((wire35 ? wire31 : wire34)))));
  assign wire39 = wire38[(4'h9):(4'h8)];
  always
    @(posedge clk) begin
      if (wire36[(3'h6):(1'h0)])
        begin
          reg40 <= $signed(wire31[(2'h3):(1'h1)]);
          if (wire39[(3'h4):(1'h0)])
            begin
              reg41 <= (~^((($signed(wire32) != $unsigned(wire35)) << {(8'hbe)}) ?
                  ($unsigned($signed(wire32)) ?
                      (~|wire37[(3'h7):(3'h4)]) : $signed((wire37 >>> wire33))) : wire39[(1'h1):(1'h1)]));
              reg42 <= {($signed(wire38[(2'h2):(2'h2)]) ?
                      ($unsigned(wire32[(4'h9):(4'h9)]) ?
                          ((wire31 ?
                              (8'hae) : (8'ha3)) << wire35[(3'h4):(1'h1)]) : {$unsigned((8'hb2)),
                              ((7'h42) - wire37)}) : {($unsigned((8'h9f)) ?
                              wire39[(1'h0):(1'h0)] : {wire39})}),
                  (($unsigned((&(8'ha5))) ?
                          (-reg40) : (reg41[(1'h0):(1'h0)] <<< (~wire36))) ?
                      (($signed((8'had)) ?
                              $signed(wire37) : (wire39 < wire36)) ?
                          wire36[(1'h0):(1'h0)] : $unsigned(wire37[(4'h9):(3'h4)])) : wire39)};
              reg43 <= wire32[(3'h7):(3'h5)];
            end
          else
            begin
              reg41 <= (~wire38);
              reg42 <= (((reg43[(1'h0):(1'h0)] == ((reg40 ? wire37 : wire32) ?
                  $unsigned(wire32) : reg42[(1'h1):(1'h0)])) >>> (~^(wire38[(1'h0):(1'h0)] ?
                  $unsigned(wire34) : reg41[(2'h2):(2'h2)]))) << wire37);
              reg43 <= reg42[(3'h6):(3'h4)];
              reg44 <= reg43[(3'h4):(1'h0)];
            end
        end
      else
        begin
          reg40 <= ($unsigned((wire31[(3'h5):(1'h1)] ^~ {(8'ha0), wire34})) ?
              ((~|((reg41 + (8'h9d)) == wire38)) >>> ($unsigned((reg43 ?
                  wire39 : (8'haf))) * reg41[(3'h6):(2'h2)])) : (^reg42[(4'he):(3'h4)]));
        end
      reg45 <= $unsigned(((+(-wire39[(1'h0):(1'h0)])) ?
          $signed($signed((+wire39))) : (~&$unsigned((wire37 ?
              reg43 : wire37)))));
      reg46 <= $unsigned({(~&reg42)});
      reg47 <= reg41[(3'h4):(2'h2)];
    end
  assign wire48 = wire32;
  assign wire49 = $signed(($signed($unsigned({reg43})) + reg40));
  assign wire50 = (({wire34,
                          (((8'h9d) ? wire32 : wire37) ?
                              (wire32 || wire48) : reg47[(4'h8):(3'h7)])} ^ ({{(8'h9e),
                                  wire49},
                              $unsigned(reg40)} ?
                          $unsigned((|wire31)) : reg47[(1'h0):(1'h0)])) ?
                      ($unsigned({(wire35 ? (8'h9c) : wire32),
                          {reg41}}) == wire31[(3'h4):(2'h3)]) : $signed($signed(reg46)));
  assign wire51 = wire49[(1'h1):(1'h0)];
  assign wire52 = reg41[(1'h0):(1'h0)];
  assign wire53 = {((^(reg43[(3'h6):(2'h3)] ?
                          (~wire52) : {reg47, (7'h40)})) <<< ({reg41,
                              (~|wire32)} ?
                          $signed($unsigned(wire52)) : (wire36 ?
                              wire37[(3'h4):(2'h2)] : (8'hb3)))),
                      $unsigned(reg40)};
  assign wire54 = (&(^~{($signed(wire53) >= wire52),
                      (reg43[(2'h3):(2'h3)] ?
                          $unsigned(wire31) : {wire33, wire48})}));
  module55 #() modinst73 (wire72, clk, wire38, reg43, wire51, wire36, wire49);
  assign wire74 = ((+{$unsigned({wire36,
                          wire33})}) <<< ($signed((+(~^wire53))) >= ((8'ha7) ?
                      wire49 : {$signed((8'h9c))})));
  assign wire75 = wire34;
  assign wire76 = $unsigned((($signed($unsigned(reg40)) >>> wire50[(2'h2):(1'h0)]) & (($unsigned(reg41) ?
                      (wire48 ?
                          wire39 : wire32) : $signed((8'hbb))) > wire74[(3'h6):(1'h1)])));
  assign wire77 = ({wire38[(4'h9):(2'h2)]} ?
                      (|{$unsigned({wire37}),
                          ($unsigned(reg47) << $signed(wire50))}) : wire51);
  assign wire78 = $unsigned(($signed($signed($unsigned(wire72))) ?
                      (((reg42 << wire39) ?
                          reg43[(2'h3):(1'h1)] : $signed(wire38)) >= (!$signed(wire38))) : $unsigned($unsigned($unsigned(wire53)))));
  always
    @(posedge clk) begin
      reg79 <= wire32;
      if ($signed((&(8'haa))))
        begin
          if ($unsigned(($unsigned(($unsigned(wire72) ?
                  (wire76 > wire74) : $unsigned(wire52))) ?
              $signed(($unsigned(wire49) ?
                  reg47[(3'h7):(3'h7)] : wire38[(4'ha):(1'h1)])) : reg43[(1'h1):(1'h0)])))
            begin
              reg80 <= $signed(({$unsigned((~&wire36)), wire39} ?
                  wire54[(4'ha):(3'h6)] : wire75));
              reg81 <= {(wire52 ? (+wire53) : (-wire74))};
              reg82 <= $unsigned($unsigned((8'h9c)));
            end
          else
            begin
              reg80 <= ((!wire72) ? $signed(reg47[(4'h9):(3'h7)]) : wire35);
              reg81 <= $unsigned(((reg45 ^~ $signed((~reg81))) ~^ (($signed(wire48) ?
                      wire39 : (-(8'ha7))) ?
                  {wire53, wire48} : $signed((^~(8'ha7))))));
            end
        end
      else
        begin
          if ($signed(wire77[(4'ha):(4'h9)]))
            begin
              reg80 <= (wire53[(5'h10):(3'h6)] > reg42);
              reg81 <= $unsigned(reg40);
              reg82 <= ((~($signed((wire36 ? wire33 : reg42)) ?
                      wire75[(4'hb):(3'h7)] : $unsigned((reg40 ?
                          wire51 : (8'hb9))))) ?
                  $unsigned($signed((&wire72))) : wire74[(3'h6):(3'h4)]);
            end
          else
            begin
              reg80 <= ({$signed($unsigned((^reg80))),
                  $unsigned($unsigned((&wire31)))} > $unsigned(wire37));
              reg81 <= (~|(reg79[(3'h5):(2'h2)] ?
                  (wire34[(4'hf):(4'hd)] >= $signed($signed(wire52))) : $unsigned(wire37[(3'h4):(2'h2)])));
              reg82 <= $signed((+(8'hac)));
            end
          reg83 <= ((~$signed($signed((reg42 ? reg46 : reg41)))) ?
              $signed($signed($signed((wire33 < wire32)))) : (wire32[(2'h2):(1'h0)] | reg82[(4'h9):(3'h4)]));
          reg84 <= $unsigned(wire36);
          reg85 <= wire32[(3'h6):(1'h1)];
        end
    end
  module86 #() modinst99 (.clk(clk), .wire88(wire34), .wire87(wire37), .y(wire98), .wire90(reg85), .wire89(reg41));
  assign wire100 = $unsigned((((~(reg83 & reg47)) ?
                       $unsigned(wire31[(3'h7):(1'h1)]) : $signed((wire52 << wire53))) ^~ {((~&reg44) ?
                           ((8'ha0) ? reg43 : wire36) : (!wire33))}));
endmodule

module module86
#(parameter param97 = (&(((^~{(8'ha5), (8'h9d)}) ? (((8'hb4) ? (8'hb9) : (8'hbe)) ? ((8'hb0) + (8'had)) : (+(8'ha9))) : (!((8'ha2) <<< (8'h9e)))) ? {{((8'hbd) ? (8'hba) : (8'hb4))}, (~&((8'ha5) ~^ (8'hbc)))} : {((-(7'h41)) ? ((8'ha2) > (8'hbe)) : {(8'hb9), (8'h9c)})})))
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire90;
  input wire [(3'h4):(1'h0)] wire89;
  input wire [(5'h15):(1'h0)] wire88;
  input wire signed [(3'h6):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire96;
  wire [(4'he):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire94;
  wire [(5'h12):(1'h0)] wire93;
  wire signed [(4'hc):(1'h0)] wire92;
  wire signed [(4'hc):(1'h0)] wire91;
  assign y = {wire96, wire95, wire94, wire93, wire92, wire91, (1'h0)};
  assign wire91 = (8'ha4);
  assign wire92 = wire88[(5'h11):(5'h11)];
  assign wire93 = wire91[(4'h8):(1'h1)];
  assign wire94 = wire91;
  assign wire95 = (8'hb9);
  assign wire96 = (&$unsigned(($signed({wire91}) ?
                      wire91[(4'ha):(3'h7)] : wire91[(3'h7):(1'h1)])));
endmodule

module module55
#(parameter param70 = ((((-((8'hbe) ^ (8'hbf))) ? (((8'ha9) + (8'had)) ? ((8'hb3) ? (7'h40) : (8'hbc)) : ((8'hb6) && (8'hac))) : {{(8'hb7)}}) ? ((+((8'hb9) ? (8'hb2) : (8'ha7))) <<< (^((8'hb4) * (8'ha1)))) : (~{((8'hac) ? (7'h43) : (7'h41)), ((8'hb5) ? (8'ha7) : (8'haa))})) ? (8'h9f) : {(^(((8'hb4) < (8'hbf)) >= (-(8'hb9))))}), 
parameter param71 = (param70 > param70))
(y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire60;
  input wire [(3'h5):(1'h0)] wire59;
  input wire [(2'h2):(1'h0)] wire58;
  input wire signed [(4'h9):(1'h0)] wire57;
  input wire signed [(4'he):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire67;
  wire signed [(3'h5):(1'h0)] wire66;
  wire signed [(5'h11):(1'h0)] wire65;
  wire signed [(4'he):(1'h0)] wire64;
  wire [(5'h14):(1'h0)] wire63;
  wire signed [(4'ha):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire61;
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 (1'h0)};
  assign wire61 = ({$signed($unsigned((~|wire56)))} | (wire60[(4'hb):(4'h8)] >>> wire58[(2'h2):(1'h1)]));
  assign wire62 = ($signed((&(~^$signed(wire60)))) && (~wire60[(3'h7):(3'h4)]));
  assign wire63 = (&(+$signed($signed($signed(wire57)))));
  assign wire64 = $signed(({wire60, wire58[(1'h0):(1'h0)]} ?
                      wire63[(3'h6):(2'h2)] : $signed({(wire56 || wire63),
                          (-wire62)})));
  assign wire65 = {({$signed((wire57 ? wire64 : wire63)),
                              $signed((wire62 ? wire61 : wire61))} ?
                          ((^(wire61 && (8'h9e))) ?
                              $signed((~&wire56)) : ((~&wire63) ?
                                  (wire57 || wire63) : $signed(wire61))) : $signed($unsigned((wire63 < wire61))))};
  assign wire66 = {(wire65 ?
                          wire62[(3'h6):(3'h6)] : {wire57[(1'h1):(1'h1)],
                              $signed($unsigned(wire60))}),
                      $unsigned((wire65[(2'h2):(2'h2)] ^~ wire56))};
  assign wire67 = $unsigned($unsigned(($signed((-(8'hb8))) < $signed({wire58}))));
  assign wire68 = wire62[(4'h8):(3'h6)];
  assign wire69 = {wire57, (~&$signed(wire65))};
endmodule
