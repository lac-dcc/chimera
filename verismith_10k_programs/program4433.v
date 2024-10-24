module top
#(parameter param51 = ((((((8'hbd) ? (8'hbf) : (8'ha9)) ? (8'ha0) : {(8'h9d)}) ? (~(~&(8'hbe))) : (~&((8'hab) <<< (8'hbe)))) == (|(((8'hb6) >>> (8'haf)) ? ((8'h9f) ? (8'h9d) : (7'h42)) : (~|(8'hbd))))) == {{(+((8'hb8) ? (8'hbc) : (8'hb2))), {((8'ha9) >>> (8'ha5)), ((8'hb6) ? (8'hb8) : (8'hb1))}}, {(((8'hb2) ? (8'hb5) : (8'h9f)) ? {(8'hba)} : (~&(8'hb8))), (^(+(8'h9c)))}}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire50;
  wire [(4'he):(1'h0)] wire49;
  wire [(2'h3):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire28;
  wire signed [(3'h4):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire22;
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire22,
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
                 (1'h0)};
  module4 #() modinst23 (wire22, clk, wire0, wire3, wire2, wire1);
  assign wire24 = $unsigned($signed((wire1[(2'h3):(1'h0)] <<< wire3[(1'h1):(1'h0)])));
  assign wire25 = (~^wire3);
  assign wire26 = (((~|wire24[(3'h7):(3'h6)]) >>> (~&{$signed(wire0)})) ?
                      $unsigned(((-{wire3, wire25}) ?
                          (~&(^wire3)) : ({wire22} ?
                              wire0[(4'hc):(2'h2)] : $unsigned((8'ha5))))) : ($unsigned(($signed(wire0) && (wire0 == wire3))) << wire1[(1'h0):(1'h0)]));
  assign wire27 = (-$unsigned($signed((8'ha7))));
  assign wire28 = (|(^($signed({wire26, wire0}) && $signed(wire24))));
  assign wire29 = wire0[(4'hb):(2'h3)];
  assign wire30 = $unsigned((&(~|wire29)));
  assign wire31 = (~wire28[(4'hc):(3'h7)]);
  always
    @(posedge clk) begin
      reg32 <= ($signed((wire29 ?
              (((8'h9f) ? wire29 : wire2) ?
                  $signed(wire22) : (wire22 ?
                      wire3 : wire24)) : $signed({wire2}))) ?
          wire3 : wire25[(2'h3):(2'h3)]);
      reg33 <= (((^$signed((wire30 | (7'h41)))) ?
          wire22 : reg32[(1'h1):(1'h0)]) << wire29);
      reg34 <= (^wire24[(3'h4):(1'h1)]);
      if (($unsigned($unsigned(reg32[(2'h2):(1'h0)])) ~^ $signed(wire3)))
        begin
          if ($signed(wire0))
            begin
              reg35 <= wire30[(3'h6):(3'h5)];
              reg36 <= (|$unsigned((reg32[(1'h0):(1'h0)] ?
                  (reg32[(1'h0):(1'h0)] == {reg32}) : wire25[(4'h8):(3'h6)])));
              reg37 <= ($unsigned($unsigned((&$unsigned(wire27)))) ?
                  (~^($signed(reg34) - reg32)) : (~^($signed((reg36 ?
                      reg36 : wire3)) * (|wire28[(3'h4):(1'h1)]))));
            end
          else
            begin
              reg35 <= wire30;
              reg36 <= $unsigned($signed((!((-reg35) ~^ $unsigned(wire24)))));
              reg37 <= reg33[(1'h0):(1'h0)];
              reg38 <= ((+wire24[(1'h1):(1'h0)]) ?
                  (($signed((7'h42)) <= (&(wire24 == reg34))) ?
                      $signed(wire22[(4'ha):(3'h7)]) : $signed((8'ha7))) : (-(reg36[(3'h5):(1'h1)] ^ ($unsigned((8'ha0)) && (7'h41)))));
              reg39 <= $signed((reg34[(2'h2):(2'h2)] || $unsigned({wire1})));
            end
          reg40 <= wire26;
          if ((({reg39[(2'h3):(2'h2)], wire3[(4'h9):(3'h4)]} ?
              (8'ha6) : $signed({$signed((8'ha7))})) == $unsigned({$unsigned($unsigned(reg33)),
              $signed($unsigned(reg34))})))
            begin
              reg41 <= $unsigned(reg39);
              reg42 <= (~|wire0[(4'ha):(1'h0)]);
              reg43 <= $unsigned({(~|(~^reg41[(5'h10):(4'hd)]))});
              reg44 <= wire1[(2'h2):(2'h2)];
            end
          else
            begin
              reg41 <= $signed($signed((((~|wire30) < reg43) * (^(wire29 ?
                  (7'h40) : (8'h9d))))));
              reg42 <= (((~&(!$signed(reg37))) < wire29[(3'h6):(1'h1)]) & wire27[(3'h4):(2'h3)]);
              reg43 <= {(&($unsigned(reg33) ?
                      (!$signed(wire25)) : $unsigned($signed(wire1)))),
                  (8'hbe)};
            end
        end
      else
        begin
          if (((($unsigned($unsigned(wire2)) >>> reg44[(3'h4):(1'h0)]) ?
                  reg33[(4'hb):(1'h0)] : $signed(({reg42, wire28} ?
                      wire26[(3'h5):(2'h3)] : (reg32 ? wire3 : (8'ha0))))) ?
              $unsigned((-(reg36 ?
                  $unsigned(wire24) : (wire25 >= wire30)))) : ($unsigned($unsigned($unsigned(reg36))) ?
                  wire29[(3'h7):(1'h0)] : $signed({$unsigned(reg38)}))))
            begin
              reg35 <= wire30;
              reg36 <= $signed(((((wire31 >>> reg40) ?
                      (reg36 ?
                          wire25 : wire27) : (~^wire27)) ^ $unsigned((|wire0))) ?
                  $signed(reg36[(4'ha):(2'h2)]) : ((+$unsigned(wire24)) ?
                      (wire24 ? (^(8'ha7)) : $unsigned(wire1)) : (|(wire3 ?
                          wire2 : (8'hbe))))));
            end
          else
            begin
              reg35 <= (reg35 == reg34[(2'h3):(2'h3)]);
            end
          reg37 <= ($signed($signed((+(wire22 >> reg44)))) << ((~$unsigned($signed(wire3))) ?
              (|$unsigned((~^wire24))) : $signed(wire30)));
        end
      if (((~&(^~reg43)) ? (8'hb0) : wire30[(4'he):(4'hd)]))
        begin
          reg45 <= (reg33[(3'h6):(3'h4)] + $unsigned($unsigned(((wire3 <= reg39) >>> $unsigned(wire24)))));
          reg46 <= (^~$signed(({(wire30 <= reg42), (reg37 ~^ reg45)} ?
              ((~&(7'h43)) ? (reg39 >> reg38) : {reg45}) : $signed((8'hb5)))));
        end
      else
        begin
          reg45 <= (((reg41[(2'h3):(1'h1)] <= (8'ha8)) > (^reg36)) ?
              {(!(^$unsigned(wire24))),
                  reg43[(1'h0):(1'h0)]} : $signed((^wire28)));
        end
    end
  assign wire47 = $signed($signed(wire22));
  assign wire48 = $signed($unsigned(($signed((+reg44)) < ($unsigned(reg35) >>> wire22))));
  assign wire49 = ($unsigned((($unsigned(reg37) ^~ $unsigned(wire31)) ?
                      ((8'ha2) * ((8'hb1) > reg42)) : $unsigned($signed(wire29)))) > wire27[(1'h1):(1'h0)]);
  assign wire50 = (~|$unsigned(((wire0 != (wire1 ^~ reg41)) ^ $signed($signed((7'h41))))));
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire [(4'h9):(1'h0)] wire7;
  input wire [(2'h2):(1'h0)] wire6;
  input wire signed [(4'hb):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire9;
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire10,
                 wire9,
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
  assign wire9 = ($unsigned($signed((~^(+wire6)))) >>> ($unsigned((wire7 != $signed(wire8))) || wire8));
  assign wire10 = (($signed(wire6[(2'h2):(2'h2)]) ?
                          {(wire7 <= $signed(wire9))} : ((+wire9) << (+(^~wire6)))) ?
                      wire8 : wire5);
  always
    @(posedge clk) begin
      reg11 <= (wire9[(4'h8):(3'h7)] == $unsigned(({$signed(wire8),
          (wire7 != wire6)} <<< ({(8'hb5)} - {(8'h9f)}))));
      if ((&(~^$signed((8'had)))))
        begin
          reg12 <= wire10;
          reg13 <= {(~^wire8[(3'h5):(2'h2)])};
          if ((({($unsigned(reg13) ? (|reg11) : wire8[(3'h6):(2'h3)]),
                      $signed({wire5, wire8})} ?
                  ($unsigned((~^reg12)) + $unsigned((reg11 ?
                      wire8 : wire8))) : $unsigned(reg13[(4'hc):(3'h5)])) ?
              $unsigned((wire5[(4'h8):(1'h1)] ?
                  ($unsigned(wire6) ? (reg12 <= wire5) : (8'ha0)) : ({(8'hb7)} ?
                      reg12[(1'h0):(1'h0)] : (wire10 ?
                          (8'hb7) : reg11)))) : wire9[(4'h9):(3'h4)]))
            begin
              reg14 <= $unsigned(reg13[(3'h6):(3'h6)]);
              reg15 <= $unsigned(reg12[(1'h1):(1'h1)]);
              reg16 <= (8'ha3);
              reg17 <= $signed((wire8 >>> reg15));
              reg18 <= (^$signed((((reg15 ? wire6 : reg16) ?
                  (~^wire7) : (wire10 <= (8'had))) << {reg17})));
            end
          else
            begin
              reg14 <= $signed((^~{$signed(reg11)}));
              reg15 <= ((reg14 ?
                  $signed((wire7 ?
                      wire5[(3'h6):(3'h4)] : (~|wire7))) : (~(wire6 ?
                      (wire5 | reg18) : $signed(reg14)))) <= reg11);
              reg16 <= wire5;
              reg17 <= (8'hbe);
              reg18 <= reg15;
            end
        end
      else
        begin
          reg12 <= wire10;
          reg13 <= (!(((~|(wire6 != wire7)) >= $signed((8'hb1))) << $unsigned({$unsigned(wire7),
              $unsigned(reg12)})));
          reg14 <= (8'hb3);
          reg15 <= (((^~(^~$unsigned(reg14))) ?
                  ((((8'hb7) << wire5) >> (reg15 <<< reg16)) & (~&(wire6 ?
                      reg18 : reg17))) : ((((8'hb9) <= reg11) >> (reg17 <= reg17)) ~^ $unsigned((|wire7)))) ?
              (~|$signed(((~|wire5) < (^~reg17)))) : (!reg16));
        end
      reg19 <= ($signed($unsigned((reg16 <= $unsigned(reg11)))) << ($unsigned(reg15) > wire5));
    end
  assign wire20 = ((~|$unsigned(wire9)) ?
                      ({$unsigned((~&wire7))} ?
                          ($signed({reg13}) ?
                              {(wire5 > reg14),
                                  (reg19 != reg12)} : ($signed(wire9) != $signed((8'hb5)))) : (wire5 != wire10[(3'h7):(3'h6)])) : $unsigned(reg14[(3'h7):(1'h0)]));
  assign wire21 = (|({$signed((reg14 ? reg12 : reg11)), reg12} ?
                      $unsigned(((8'hb5) ~^ {wire20})) : ((8'hb1) ?
                          (~&{wire7}) : (reg12[(2'h3):(1'h1)] != {wire9,
                              (8'h9e)}))));
endmodule
