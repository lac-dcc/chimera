module top
#(parameter param43 = {({((8'ha4) ? ((8'ha1) == (8'haa)) : ((7'h42) ? (8'hb9) : (8'hb2))), (+(8'hb1))} ? (({(8'hab), (8'ha7)} | {(8'hb3), (8'hbc)}) >= {(^~(8'ha4))}) : (-(^~(~|(8'ha8)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1ec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = $signed(((8'haf) <= (((^wire1) | (wire1 ^~ wire1)) ?
                     $unsigned({wire0}) : ($signed(wire1) ?
                         {wire1, wire2} : wire2[(2'h3):(2'h3)]))));
  assign wire5 = $unsigned(wire0);
  assign wire6 = wire4[(4'ha):(2'h2)];
  assign wire7 = {(($unsigned($signed(wire0)) != (((8'h9e) ?
                         wire1 : wire4) != {wire2})) == {$signed((wire2 == wire2))}),
                     wire6[(4'he):(1'h0)]};
  assign wire8 = wire1[(2'h2):(2'h2)];
  assign wire9 = ($signed(wire1) ? $signed((~wire4[(4'h8):(4'h8)])) : wire0);
  assign wire10 = ({$signed($signed({wire3})),
                      (((^~wire4) ? wire3 : $signed(wire4)) ?
                          {(wire3 ~^ wire1), (-wire1)} : {(&(8'hba)),
                              (wire1 || wire5)})} * ($unsigned($unsigned((8'hae))) & $signed($unsigned((wire9 > wire0)))));
  always
    @(posedge clk) begin
      reg11 <= $unsigned($signed($unsigned($signed(wire6))));
      if ((!$signed($unsigned($signed((wire10 >= wire9))))))
        begin
          reg12 <= wire2;
          reg13 <= ((wire3 ? wire0 : $signed((~wire5[(2'h2):(1'h1)]))) ?
              $signed({{(wire6 > wire10), $signed(wire3)}}) : $signed(wire2));
        end
      else
        begin
          reg12 <= wire2;
          reg13 <= (reg11[(3'h6):(1'h0)] >= (wire5 < ($unsigned((-wire3)) ^~ wire1)));
          reg14 <= wire5;
          reg15 <= ((8'hae) ?
              (wire10 ^~ (~&$signed((8'ha0)))) : $unsigned((($signed(wire3) && $unsigned(wire8)) ?
                  ({wire4} & $unsigned(wire3)) : wire2)));
          reg16 <= (|(^($signed(wire8) == $signed(reg12))));
        end
      if (($unsigned($unsigned($unsigned(wire10[(4'h9):(3'h7)]))) > (reg11 - (&({wire10,
          (8'hbc)} == $signed(wire10))))))
        begin
          reg17 <= (+($unsigned(wire6[(1'h1):(1'h1)]) ?
              wire1 : $signed((+(reg12 ? wire3 : wire10)))));
          if ((((~^(^(8'hbb))) ?
              (((reg14 ? reg15 : (8'h9c)) ? {wire1} : $signed(reg12)) ?
                  $signed((&reg16)) : (+$signed(wire9))) : {(~|(reg11 ?
                      wire6 : wire5))}) & ((-(wire10[(1'h0):(1'h0)] ?
              reg17[(1'h1):(1'h1)] : $unsigned(reg11))) + (^({reg11, wire6} ?
              $unsigned(reg13) : $signed(wire5))))))
            begin
              reg18 <= reg13[(3'h4):(3'h4)];
            end
          else
            begin
              reg18 <= wire1[(1'h1):(1'h1)];
              reg19 <= wire2;
              reg20 <= (~(((~^{(8'ha4), reg17}) >= (reg15 ?
                  ((7'h43) >= wire8) : (reg18 ?
                      wire6 : wire4))) <= $unsigned((^~$unsigned(reg12)))));
              reg21 <= {{(|((~|reg13) | reg12[(3'h5):(3'h4)]))},
                  $signed($unsigned(wire3[(3'h4):(2'h3)]))};
            end
          reg22 <= wire4[(4'hd):(1'h1)];
          reg23 <= (|reg14[(3'h5):(1'h0)]);
          if (reg14[(2'h2):(1'h0)])
            begin
              reg24 <= $unsigned(((~|reg23) ^ wire6[(4'h9):(2'h2)]));
              reg25 <= $signed((8'hb2));
              reg26 <= {$signed((((~&reg12) ?
                          $unsigned(wire9) : (reg19 <= (8'ha1))) ?
                      reg15 : ((~|wire7) ~^ $unsigned(reg18))))};
              reg27 <= $unsigned($unsigned(reg12));
              reg28 <= $unsigned($unsigned((reg15 ?
                  $unsigned((wire7 <= reg15)) : (((8'hba) ?
                      (8'ha3) : wire8) <= (reg26 >= wire7)))));
            end
          else
            begin
              reg24 <= $unsigned(reg15[(3'h5):(2'h2)]);
            end
        end
      else
        begin
          reg17 <= $signed($unsigned(wire10));
          reg18 <= wire4[(4'ha):(3'h4)];
          reg19 <= (reg17[(3'h6):(2'h2)] ?
              ((reg14[(1'h1):(1'h1)] == ((wire10 ^~ wire10) + (+reg19))) <<< (reg25 != $unsigned((reg11 ?
                  (8'hbc) : reg23)))) : $unsigned((+reg22)));
          reg20 <= ($signed({wire6,
              ($signed(reg19) ?
                  $signed(wire2) : {reg25,
                      wire6})}) ^ ((~&$unsigned({reg28})) >>> (8'ha2)));
        end
      if ($signed((-(&({reg13, (8'hb3)} ~^ reg25)))))
        begin
          if ((|(~|$signed($signed((wire0 >> reg19))))))
            begin
              reg29 <= (+$signed((((^(8'hb2)) != (reg20 <= wire10)) ?
                  ((-wire8) == $signed((8'hae))) : (|wire9[(4'hb):(4'h9)]))));
              reg30 <= $unsigned(reg24[(1'h0):(1'h0)]);
            end
          else
            begin
              reg29 <= (8'hb2);
              reg30 <= (+(&$unsigned(($signed(wire0) ?
                  (reg18 >= wire9) : (wire0 ? reg30 : (8'ha3))))));
              reg31 <= {(~(+{(~&reg30), (reg15 && reg13)}))};
              reg32 <= ($unsigned($signed(reg20)) ?
                  wire0[(2'h2):(2'h2)] : ($unsigned((wire6[(3'h5):(1'h0)] ?
                      (^~reg27) : reg22[(1'h0):(1'h0)])) ^ reg17));
              reg33 <= $unsigned($unsigned(reg27[(4'hd):(4'ha)]));
            end
          reg34 <= $unsigned({{reg21}});
        end
      else
        begin
          if ((-wire0[(3'h5):(3'h5)]))
            begin
              reg29 <= ($unsigned($unsigned(($unsigned((8'hb2)) || ((8'hb0) ?
                  reg19 : reg14)))) >>> reg20[(3'h5):(2'h3)]);
              reg30 <= $unsigned((~($signed((!reg29)) ?
                  (wire8[(3'h4):(1'h0)] >>> $signed((8'ha5))) : reg18)));
              reg31 <= ($signed(((8'ha2) ?
                      (!(reg34 ? wire2 : wire2)) : (reg18 <= {reg33,
                          (8'hb4)}))) ?
                  $unsigned($signed(wire2[(3'h6):(2'h3)])) : {(8'haf),
                      {$signed({wire7, wire7})}});
            end
          else
            begin
              reg29 <= ((-reg34[(5'h10):(3'h5)]) ?
                  reg16 : $signed(wire5[(4'hb):(2'h2)]));
              reg30 <= ({$signed($signed($signed(reg17))),
                      ((~&reg11) - $unsigned((reg22 ? reg21 : wire7)))} ?
                  $unsigned(wire1) : (!wire2));
              reg31 <= (~^{$signed($unsigned($unsigned(reg24)))});
              reg32 <= {((($signed(reg24) ?
                      (~^reg17) : $unsigned(reg33)) || $unsigned((reg31 || wire2))) == reg21[(4'he):(3'h4)]),
                  $unsigned((reg33 - (~|$signed((8'had)))))};
              reg33 <= $signed($signed(($unsigned($unsigned(reg25)) ^~ (8'hb2))));
            end
          reg34 <= $signed((8'hb9));
          if ($unsigned(wire7[(5'h11):(4'hd)]))
            begin
              reg35 <= $signed($signed(wire8));
              reg36 <= $signed($signed((8'haa)));
            end
          else
            begin
              reg35 <= ($signed(reg18[(3'h5):(1'h0)]) ?
                  $signed(($unsigned({(8'haa), (8'had)}) ?
                      $unsigned(reg22[(4'hb):(1'h0)]) : ({reg35} ?
                          (reg14 - reg11) : (~wire4)))) : (~^reg21[(5'h10):(4'hf)]));
              reg36 <= $unsigned((((+$unsigned((8'ha1))) ?
                  $unsigned(wire4[(3'h5):(1'h1)]) : reg29[(3'h5):(1'h1)]) << ($signed(wire0[(2'h3):(1'h0)]) ?
                  reg19[(4'he):(4'h8)] : reg14)));
              reg37 <= reg19[(4'hf):(4'hb)];
              reg38 <= $signed($signed((~&$unsigned($unsigned(reg11)))));
              reg39 <= ((~&reg21[(4'hf):(3'h4)]) >= $signed({reg14[(2'h2):(2'h2)],
                  (+$signed(wire0))}));
            end
        end
    end
  assign wire40 = ({$unsigned(($signed(reg16) | wire6[(3'h4):(3'h4)])),
                      (-reg15[(5'h12):(2'h3)])} ^~ reg19[(1'h1):(1'h0)]);
  assign wire41 = (^(($unsigned(reg21) ?
                      $unsigned((reg29 < wire5)) : $signed($unsigned((8'hb5)))) >= wire3[(2'h2):(1'h0)]));
  assign wire42 = $signed((($signed(wire3) > reg37[(1'h1):(1'h1)]) ~^ (^~wire3)));
endmodule
