module top
#(parameter param48 = ({{((+(8'hbb)) ? (^(8'hb4)) : ((8'hbe) ? (7'h42) : (8'ha9)))}, {(~^(~&(7'h40))), ((&(8'hbb)) < ((8'hb6) ? (7'h41) : (8'hab)))}} > (&(!(((7'h42) >> (8'h9f)) - ((8'ha7) ? (7'h43) : (8'hb9)))))), 
parameter param49 = (((param48 ? (!((8'hba) || param48)) : (8'hb4)) != (~&(~(param48 ? param48 : param48)))) ~^ param48))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1ad):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire7,
                 wire6,
                 wire5,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
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
                 reg24,
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
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = (&(($signed(wire4) < ($signed(wire4) ?
                     $unsigned(wire4) : ((7'h42) ?
                         wire1 : wire2))) == $unsigned((~^$unsigned(wire4)))));
  assign wire6 = wire3[(4'hf):(3'h5)];
  assign wire7 = (~$signed($signed(((wire1 ? wire2 : (7'h42)) ?
                     {wire3} : wire4))));
  always
    @(posedge clk) begin
      if (((&wire3) ^ ($signed($signed($unsigned(wire5))) ?
          (($signed(wire7) >>> $signed(wire1)) < wire3) : wire6[(1'h1):(1'h0)])))
        begin
          if ((wire4[(1'h0):(1'h0)] ~^ (|wire4)))
            begin
              reg8 <= ($unsigned((8'hb2)) ?
                  (($unsigned(((7'h42) ?
                      wire6 : (8'hbf))) << wire1[(2'h2):(2'h2)]) <= (((~|wire3) ~^ (8'hac)) >= wire0)) : (wire2[(2'h3):(1'h1)] ?
                      wire1[(2'h2):(1'h1)] : (($unsigned(wire7) >>> {wire7}) ^ $signed($unsigned(wire2)))));
              reg9 <= (&$unsigned((wire3 == $unsigned($unsigned(wire3)))));
            end
          else
            begin
              reg8 <= (8'hbf);
            end
          if (wire7)
            begin
              reg10 <= ($unsigned((^(8'hae))) ?
                  $unsigned((reg9 ^~ (~|$signed(wire2)))) : wire4);
              reg11 <= {({wire0[(3'h4):(2'h2)]} ?
                      {reg10, (~|(wire5 - (8'hb2)))} : {((wire1 * reg9) ?
                              wire0[(3'h6):(2'h3)] : (reg8 - wire1)),
                          $unsigned(wire4)})};
              reg12 <= wire4[(3'h6):(3'h6)];
              reg13 <= $signed($unsigned($unsigned((wire5[(4'ha):(4'ha)] > (wire2 ?
                  wire4 : (8'h9d))))));
            end
          else
            begin
              reg10 <= (8'hb2);
              reg11 <= (reg12[(2'h2):(1'h0)] || {{$signed(wire6[(2'h2):(1'h0)]),
                      (reg11 & $unsigned(wire5))}});
              reg12 <= (~&$unsigned($signed(((reg8 * wire0) ^ (reg12 ?
                  reg8 : reg8)))));
              reg13 <= ($signed($unsigned((reg12[(3'h5):(1'h0)] ?
                      (wire3 ? wire2 : wire0) : (reg9 ? wire4 : reg9)))) ?
                  wire7 : (-wire0[(2'h3):(2'h3)]));
              reg14 <= {(|(|((~reg12) ? (wire3 ? wire1 : reg8) : (8'hb4)))),
                  reg13};
            end
          reg15 <= ((-wire4[(3'h5):(3'h5)]) >> (!$signed((reg10[(2'h2):(1'h1)] >= (8'hb8)))));
        end
      else
        begin
          if ($signed($unsigned((reg14[(3'h5):(1'h1)] ?
              (8'ha2) : $unsigned(reg13[(3'h4):(1'h0)])))))
            begin
              reg8 <= (wire6 ?
                  {{(~|$unsigned(wire7))},
                      ($signed((reg9 ? wire3 : reg15)) > {(^wire1),
                          (wire0 != wire7)})} : (wire3 ?
                      ({$signed(wire6), (reg13 > reg11)} >= ((~|reg12) ?
                          (reg15 >> reg10) : $unsigned(reg13))) : $unsigned($unsigned(((8'hb8) ?
                          reg14 : wire3)))));
              reg9 <= ((-wire1) >>> $signed((~&((wire1 << wire2) ?
                  ((8'ha5) << reg9) : wire4))));
              reg10 <= $unsigned($signed((~^((wire3 ? reg15 : wire6) ?
                  reg13[(4'h8):(2'h3)] : (~^wire3)))));
            end
          else
            begin
              reg8 <= $signed({$unsigned(wire2)});
            end
          reg11 <= wire1;
          reg12 <= (~&($unsigned($unsigned((wire3 ? reg13 : reg14))) >> wire6));
        end
      reg16 <= $unsigned((|(~^wire2[(3'h7):(3'h4)])));
      if ($unsigned(reg9[(4'hc):(3'h7)]))
        begin
          reg17 <= wire7[(3'h4):(2'h2)];
          if ($unsigned(reg11))
            begin
              reg18 <= (~((&(wire0 ?
                  (reg14 ?
                      wire6 : reg13) : reg9[(4'h8):(4'h8)])) != (reg9[(4'h9):(3'h5)] != (reg16[(2'h2):(1'h0)] ?
                  (wire5 & reg17) : $signed(reg10)))));
              reg19 <= wire7[(1'h1):(1'h1)];
              reg20 <= reg16;
            end
          else
            begin
              reg18 <= {$unsigned((($signed(wire0) >>> $signed((8'hbb))) ~^ wire1)),
                  ((($unsigned(reg15) ? ((8'hbd) <<< reg20) : $signed(reg17)) ?
                          $unsigned((reg13 || reg15)) : wire4[(3'h7):(3'h6)]) ?
                      ((8'ha6) && wire0[(2'h3):(1'h0)]) : (~^reg14))};
              reg19 <= wire4;
              reg20 <= reg12[(2'h3):(1'h0)];
            end
          if ((((reg20 ?
                  $unsigned((reg9 ?
                      wire2 : wire5)) : (wire0[(3'h7):(2'h3)] << (|reg19))) ?
              ({$unsigned(reg19)} ?
                  reg11[(3'h6):(1'h0)] : $unsigned(reg20)) : ((^~(reg11 - wire0)) << (((8'haa) ?
                  reg17 : reg9) > $signed((8'ha2))))) | wire4))
            begin
              reg21 <= ($unsigned((reg17 ?
                  wire7[(3'h4):(3'h4)] : ((~&reg14) > $unsigned(reg11)))) == $signed($unsigned({reg11[(4'hc):(3'h4)],
                  (8'hb9)})));
              reg22 <= reg17;
              reg23 <= (({{$signed((8'ha6)), (~reg15)}, {$unsigned((8'hac))}} ?
                  $unsigned(reg15[(2'h2):(1'h1)]) : (((^~(8'hb0)) ^ (reg15 ?
                          reg14 : reg12)) ?
                      reg21[(1'h0):(1'h0)] : wire5)) == $unsigned(reg11[(4'hc):(4'hc)]));
              reg24 <= $signed((($signed(wire1) > $unsigned($unsigned(wire3))) ?
                  reg13[(3'h7):(3'h4)] : reg10[(2'h2):(1'h0)]));
              reg25 <= wire1[(4'hd):(4'hb)];
            end
          else
            begin
              reg21 <= (reg25[(2'h3):(1'h1)] | (reg25 ^~ $unsigned(wire2[(4'hb):(3'h5)])));
              reg22 <= (reg19[(1'h0):(1'h0)] ?
                  (~^$unsigned({((7'h43) * wire3),
                      {wire3}})) : $unsigned((~{$unsigned(wire5)})));
              reg23 <= reg11[(5'h10):(3'h7)];
            end
          if ($signed($signed(((!$signed(wire7)) == reg15))))
            begin
              reg26 <= ($unsigned(reg12) >= reg25[(1'h0):(1'h0)]);
              reg27 <= (+wire5[(1'h0):(1'h0)]);
              reg28 <= reg16[(5'h10):(3'h7)];
            end
          else
            begin
              reg26 <= $unsigned((+wire2[(4'hb):(4'ha)]));
              reg27 <= ($signed($unsigned($unsigned((reg20 ?
                      (8'ha3) : reg17)))) ?
                  {reg27[(4'h8):(3'h5)],
                      $signed(reg10)} : wire3[(3'h5):(2'h2)]);
              reg28 <= $signed((~reg28[(3'h4):(2'h3)]));
            end
        end
      else
        begin
          if ($signed($signed(reg13)))
            begin
              reg17 <= ((+(~wire4[(2'h2):(1'h0)])) ?
                  $unsigned(wire5) : (((-reg27[(4'h9):(4'h8)]) ?
                      {$unsigned(reg11)} : ($signed(reg15) ?
                          (8'hab) : $unsigned(reg14))) ^ $signed(reg19[(2'h2):(2'h2)])));
              reg18 <= wire6;
              reg19 <= (+$signed($unsigned(((^wire7) ?
                  (reg13 ? (8'hb5) : reg17) : $signed(reg19)))));
              reg20 <= $signed({reg14, (~{(wire2 & wire1)})});
              reg21 <= {wire3, {$signed($unsigned(reg18[(1'h1):(1'h0)]))}};
            end
          else
            begin
              reg17 <= $unsigned(reg11);
            end
          reg22 <= ({reg13} ?
              $signed($unsigned($unsigned(((8'ha9) ?
                  reg10 : reg17)))) : (-$signed(($signed(reg22) ?
                  reg18[(1'h1):(1'h0)] : $unsigned(reg10)))));
          reg23 <= {((|$unsigned((-(8'hbc)))) ?
                  ($signed(wire3[(4'hc):(3'h4)]) && (~|(reg24 || reg17))) : reg14[(4'hb):(4'h8)])};
          reg24 <= $unsigned($unsigned($unsigned(($signed((8'hae)) ?
              ((8'ha4) ? reg10 : reg18) : (wire5 ? wire5 : wire6)))));
        end
      if ({$signed($signed($unsigned((reg24 ? (8'hac) : reg22)))),
          (reg12 ?
              ((!(reg21 | reg15)) ?
                  (8'hbe) : $unsigned((reg18 ?
                      reg20 : wire0))) : (~|$signed(reg21[(3'h4):(1'h1)])))})
        begin
          if (wire5)
            begin
              reg29 <= reg9[(3'h4):(2'h2)];
              reg30 <= $unsigned(reg18);
              reg31 <= reg12;
              reg32 <= {$unsigned($signed(($signed(wire4) | (wire1 || reg11))))};
              reg33 <= reg14[(4'h9):(3'h4)];
            end
          else
            begin
              reg29 <= $signed((($unsigned(reg17) + $unsigned((&reg8))) <<< (reg26 ^~ {(reg27 == wire2)})));
              reg30 <= $unsigned($unsigned($signed(reg30)));
              reg31 <= reg25;
              reg32 <= ((reg24 ?
                      reg18[(2'h3):(2'h2)] : ((wire5 ?
                          $unsigned(wire4) : reg30[(2'h3):(1'h1)]) == {(reg13 >> wire7),
                          $unsigned(reg24)})) ?
                  ((!reg27) - $signed(((&(8'ha1)) >= reg13[(2'h3):(2'h2)]))) : reg13[(4'h8):(3'h4)]);
            end
          reg34 <= (((({wire0, reg22} ?
                      ((8'h9d) <= (8'hbc)) : (!wire6)) <<< $signed(reg20[(4'ha):(2'h2)])) ?
                  (|$unsigned(wire2)) : wire6) ?
              $signed($signed($signed((reg25 - reg9)))) : {reg14});
          reg35 <= {$unsigned($unsigned(reg12))};
          reg36 <= wire3[(4'h8):(3'h5)];
        end
      else
        begin
          if ($signed({reg26, $unsigned(wire3)}))
            begin
              reg29 <= reg34;
              reg30 <= $signed($unsigned($signed(reg19)));
              reg31 <= (^~$signed((reg28 ?
                  ((^~reg10) << {wire1}) : $unsigned({reg33, reg11}))));
              reg32 <= reg28;
              reg33 <= {wire1[(4'h9):(2'h2)]};
            end
          else
            begin
              reg29 <= $signed(reg8);
            end
          reg34 <= (reg10 ^~ (reg24[(2'h2):(2'h2)] < (reg20 & $unsigned(reg33[(2'h2):(1'h1)]))));
          reg35 <= (reg36[(3'h4):(3'h4)] ~^ (^~$unsigned($signed(reg19))));
        end
      reg37 <= $unsigned(((((8'h9f) ?
              $unsigned(reg22) : $unsigned(reg25)) >>> $unsigned(reg23)) ?
          (!(((8'hb4) ? reg15 : (7'h44)) ?
              (!reg34) : {reg8, reg22})) : $signed((-(~&(8'haf))))));
    end
  assign wire38 = $signed((wire5 ?
                      reg10[(1'h1):(1'h1)] : ((wire5[(4'hc):(3'h6)] ?
                              (~^reg9) : (7'h42)) ?
                          (+$unsigned(reg29)) : reg8)));
  assign wire39 = ((($unsigned({reg29, wire2}) ?
                      {wire1,
                          ((8'hb2) ?
                              (8'hb6) : reg21)} : (8'hb1)) >>> $unsigned((~$signed(wire1)))) == (~|$signed($unsigned(reg14[(4'hc):(3'h5)]))));
  assign wire40 = ($unsigned(reg29) << reg31[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg41 <= ($unsigned((8'hae)) ?
          $unsigned($unsigned($signed(reg29[(1'h0):(1'h0)]))) : (reg22[(5'h12):(4'hf)] ?
              (($signed(reg13) ?
                  wire6 : (reg34 ?
                      reg25 : (7'h44))) < wire38) : reg13[(2'h3):(2'h2)]));
      if ($unsigned($signed(reg28)))
        begin
          reg42 <= $unsigned(($signed((!(wire0 & wire39))) ?
              (reg25[(2'h3):(2'h3)] ?
                  wire0 : (8'had)) : $unsigned($signed({reg37, reg30}))));
          reg43 <= $unsigned($unsigned(({(reg29 < reg27)} ?
              (+$signed(reg28)) : $unsigned($unsigned((8'hbf))))));
          if ($signed(wire40))
            begin
              reg44 <= (|(($unsigned($signed(wire3)) ?
                      $unsigned(reg27) : ((wire39 ? (8'haf) : wire1) ?
                          $signed(reg35) : $signed(reg28))) ?
                  $unsigned($signed((reg33 + reg35))) : (!((7'h40) ?
                      (reg32 ? reg25 : reg26) : {reg33}))));
              reg45 <= $unsigned($signed(((~^$unsigned(reg22)) <<< ($unsigned(reg27) ~^ reg29[(3'h6):(1'h0)]))));
              reg46 <= reg18[(1'h1):(1'h0)];
            end
          else
            begin
              reg44 <= reg20;
            end
          reg47 <= reg26[(1'h0):(1'h0)];
        end
      else
        begin
          reg42 <= reg27[(1'h0):(1'h0)];
          if ($signed((~&$signed($signed((^~(7'h43)))))))
            begin
              reg43 <= reg31;
              reg44 <= $unsigned(reg8);
            end
          else
            begin
              reg43 <= {$signed(wire2), wire38[(1'h0):(1'h0)]};
              reg44 <= $signed((|wire2[(2'h3):(2'h2)]));
            end
        end
    end
endmodule
