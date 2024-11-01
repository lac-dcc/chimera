module top
#(parameter param48 = (~|(({(+(8'hb8)), (|(8'haa))} ? (((8'hb8) ? (7'h44) : (8'hac)) ? ((8'h9d) * (8'h9e)) : ((8'ha3) ? (8'hb9) : (8'hbf))) : ((~^(8'ha3)) ? (~&(8'had)) : (+(8'ha5)))) ? ((^~((8'hb9) ? (8'ha6) : (7'h42))) >> (((8'ha0) != (8'h9d)) << {(8'hb3)})) : (|((+(8'hbf)) ? {(8'ha6), (8'ha7)} : ((8'ha7) + (8'ha4)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1ef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire47;
  wire [(4'hc):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  wire signed [(3'h5):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire20,
                 wire19,
                 wire18,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = wire1[(3'h5):(3'h5)];
  assign wire5 = (((^~(wire3[(4'ha):(3'h7)] ? wire0 : wire2[(4'h9):(3'h5)])) ?
                         (7'h43) : wire4[(5'h12):(5'h11)]) ?
                     $signed(wire4) : ($signed($signed(wire0)) ?
                         wire2 : (^(~^wire4))));
  assign wire6 = {wire2[(4'hb):(3'h7)],
                     (wire4[(3'h5):(3'h5)] ?
                         wire4 : $signed(wire1[(4'h8):(3'h5)]))};
  assign wire7 = ((^($unsigned((wire1 ? wire0 : wire5)) ?
                     wire1[(2'h3):(2'h2)] : wire2[(4'hd):(4'h8)])) || wire4[(4'hd):(4'hc)]);
  assign wire8 = $unsigned(((!wire0) ?
                     wire1 : $signed({(wire3 <<< wire3), ((8'hb5) != wire0)})));
  assign wire9 = $signed((wire7 ^ ((8'hb4) >= wire0[(2'h2):(2'h2)])));
  always
    @(posedge clk) begin
      reg10 <= wire0[(2'h2):(1'h0)];
      reg11 <= (!$signed($unsigned($unsigned($unsigned(reg10)))));
      if (($unsigned(wire6) > (8'h9d)))
        begin
          reg12 <= wire5;
          reg13 <= ($unsigned(reg12) * wire3);
          reg14 <= (wire8 || $unsigned({{(!wire2)},
              ($unsigned(wire3) ? reg10 : wire6[(4'hf):(4'ha)])}));
          reg15 <= {(^~$unsigned(({wire2, wire6} | {reg10}))),
              wire6[(4'hd):(3'h7)]};
        end
      else
        begin
          reg12 <= $unsigned($unsigned(reg12[(4'hb):(3'h4)]));
          if ((!$signed(wire5)))
            begin
              reg13 <= $unsigned((({{reg12}} ?
                      $signed($unsigned((8'ha7))) : $signed((|(8'ha6)))) ?
                  {(~^(wire1 ? reg12 : (8'hb8)))} : $unsigned(($signed(reg11) ?
                      wire6[(3'h7):(1'h0)] : $signed(wire7)))));
            end
          else
            begin
              reg13 <= wire9;
            end
          reg14 <= $signed((reg14[(2'h3):(2'h3)] < $signed($signed((reg11 ?
              reg14 : (8'haa))))));
        end
    end
  always
    @(posedge clk) begin
      reg16 <= (($signed(($signed(wire4) ?
          (~^reg10) : (8'hb9))) + reg13[(3'h5):(2'h2)]) & (~&(wire4[(3'h5):(1'h0)] ?
          ($unsigned(wire7) == $unsigned(reg12)) : reg14)));
      reg17 <= (|{($signed((wire0 ? wire5 : (8'hba))) ^ $unsigned((8'ha5))),
          $signed((reg16 + {wire6, (8'ha5)}))});
    end
  assign wire18 = wire7[(3'h6):(2'h3)];
  assign wire19 = reg11[(5'h12):(4'ha)];
  assign wire20 = ((reg13[(4'hc):(2'h2)] ?
                          reg17[(4'h8):(2'h2)] : (~|$unsigned(wire3[(4'ha):(3'h5)]))) ?
                      $unsigned($signed($signed(((8'hb5) < (8'ha7))))) : wire18);
  always
    @(posedge clk) begin
      reg21 <= ($signed((+(+wire4[(4'h9):(2'h3)]))) ?
          wire6 : wire8[(5'h10):(3'h7)]);
      if ((~&$unsigned(reg15[(1'h0):(1'h0)])))
        begin
          if (wire9[(4'he):(4'hd)])
            begin
              reg22 <= ((reg17 <= ({wire7,
                      (wire0 && wire20)} && (&wire0[(1'h1):(1'h0)]))) ?
                  reg11 : wire20);
            end
          else
            begin
              reg22 <= wire4;
              reg23 <= (^(&(~|((|(7'h42)) ? wire6 : reg17[(4'he):(3'h6)]))));
            end
          reg24 <= ({$signed({(wire0 ? wire3 : reg13)}),
              (($unsigned(wire18) ^~ {reg15,
                  wire6}) - $unsigned(wire1))} <<< $unsigned((&reg11[(5'h11):(3'h6)])));
          reg25 <= $signed(wire9[(4'h9):(3'h6)]);
        end
      else
        begin
          reg22 <= $signed($unsigned(wire3[(2'h3):(1'h0)]));
          if (reg23)
            begin
              reg23 <= (~{(-((reg11 < (8'ha6)) ? (~|reg22) : wire0)),
                  $signed(((wire2 >>> reg14) ?
                      (wire7 >> wire3) : $unsigned(reg24)))});
              reg24 <= wire19[(4'ha):(3'h4)];
              reg25 <= wire8;
            end
          else
            begin
              reg23 <= {(~$unsigned($unsigned((wire8 ^ reg22)))),
                  ($unsigned(((~&reg10) ?
                          wire4[(1'h0):(1'h0)] : $unsigned(wire1))) ?
                      $signed($signed(wire7)) : ((((8'hab) != (8'hb1)) ?
                              $unsigned((8'h9d)) : ((7'h41) ?
                                  wire18 : wire20)) ?
                          reg12[(4'hc):(4'hc)] : (~&$signed(wire9))))};
              reg24 <= $unsigned({wire20[(2'h3):(1'h1)]});
            end
        end
      if ((wire6[(4'he):(4'he)] & $unsigned($unsigned((wire0 ?
          (+wire2) : $unsigned(reg12))))))
        begin
          if ((($unsigned(((^~reg16) ~^ reg24[(1'h0):(1'h0)])) != (|reg14[(2'h3):(1'h1)])) <= $signed(((reg16 ?
              (wire4 ? wire8 : wire9) : reg11) << {((7'h40) ? wire0 : reg12),
              $signed(wire2)}))))
            begin
              reg26 <= wire5[(1'h1):(1'h1)];
              reg27 <= reg17;
              reg28 <= ($signed(reg12) ?
                  (~|$signed((reg15 ~^ $unsigned(wire6)))) : (reg11[(3'h7):(3'h7)] ?
                      (-($unsigned(reg10) ?
                          wire1[(2'h3):(2'h3)] : (wire6 <<< reg15))) : (&reg22)));
              reg29 <= {$unsigned(reg21[(3'h6):(2'h2)])};
            end
          else
            begin
              reg26 <= $signed(((|($signed(wire7) ?
                  $signed(wire1) : reg21)) || ($signed(reg15[(4'h9):(3'h7)]) ?
                  reg12 : ((8'hb3) ? $unsigned(reg25) : {reg28, wire6}))));
              reg27 <= $unsigned(((wire5 ? reg27 : (-(~&wire4))) ?
                  wire1[(2'h2):(1'h1)] : (-(wire6 >= wire20))));
            end
          reg30 <= (((reg26 ?
              ($unsigned(reg11) ?
                  reg12[(2'h2):(1'h1)] : (wire18 <<< (8'hbc))) : wire18[(1'h0):(1'h0)]) ^~ (~|wire5)) ^~ $unsigned((^$unsigned(reg21[(2'h3):(2'h3)]))));
          reg31 <= {(~$signed(reg26)), $signed(wire0[(2'h2):(1'h1)])};
          reg32 <= ((~$unsigned(wire1[(1'h0):(1'h0)])) > $signed(wire7[(4'he):(4'hd)]));
        end
      else
        begin
          reg26 <= $unsigned((7'h40));
          reg27 <= (((&$signed(((8'hb6) - wire19))) ?
                  (8'hb8) : wire3[(4'h8):(4'h8)]) ?
              $signed({$unsigned((wire19 ? reg11 : reg17)),
                  {(|(8'hb1))}}) : $unsigned((((^wire5) <= (wire19 <= (7'h43))) ?
                  $unsigned((^~(8'h9c))) : $signed($signed(reg16)))));
          reg28 <= wire20[(1'h0):(1'h0)];
        end
      if (wire6)
        begin
          reg33 <= reg29;
        end
      else
        begin
          if ((|$unsigned((^reg26))))
            begin
              reg33 <= reg31[(2'h2):(2'h2)];
              reg34 <= (&((-(|wire20[(2'h3):(2'h3)])) >>> (&wire18)));
            end
          else
            begin
              reg33 <= wire3[(3'h4):(3'h4)];
              reg34 <= (!wire18);
              reg35 <= wire18[(1'h0):(1'h0)];
              reg36 <= {reg15};
              reg37 <= $unsigned(((&(8'hb8)) | wire4[(4'hc):(4'hc)]));
            end
          if (wire1[(1'h1):(1'h1)])
            begin
              reg38 <= ($signed($signed(wire0)) | (wire3 ?
                  ({$signed(reg33), ((7'h42) < (8'h9e))} ?
                      $signed((reg13 >> reg35)) : reg23[(1'h0):(1'h0)]) : (8'hae)));
              reg39 <= reg34[(2'h3):(2'h2)];
              reg40 <= {(8'had), (reg26 && reg21)};
              reg41 <= ((reg32 ?
                      ((^(wire19 ?
                          (8'hab) : (8'ha3))) | reg27) : ($signed($unsigned(reg21)) <<< (8'haf))) ?
                  (wire0 ?
                      (8'hb9) : $signed(((wire7 >>> reg13) ?
                          (reg21 - wire3) : (^~(8'hbc))))) : (((~&reg34[(1'h0):(1'h0)]) == (^(^wire6))) < (reg40 <= $unsigned((wire19 & wire9)))));
              reg42 <= ($unsigned({$signed(reg33[(2'h3):(2'h3)])}) < reg16);
            end
          else
            begin
              reg38 <= ($signed((-$signed($unsigned(wire2)))) ?
                  (reg38 ?
                      ($unsigned($unsigned(reg33)) | (reg16 ?
                          $signed((8'hb6)) : (~&(8'hb0)))) : reg33) : {(+$signed({reg22})),
                      (reg24[(2'h3):(1'h0)] ?
                          (~^wire7[(5'h10):(1'h0)]) : reg35)});
              reg39 <= reg36;
            end
        end
      reg43 <= reg16[(4'hb):(4'hb)];
    end
  assign wire44 = (reg32[(2'h2):(1'h1)] ? {{(~^(reg17 <= reg11))}} : wire7);
  assign wire45 = (!$signed((reg25[(1'h0):(1'h0)] && reg23[(2'h2):(1'h0)])));
  assign wire46 = $signed({reg26[(1'h0):(1'h0)],
                      (reg39 ? (+$signed(wire20)) : wire45[(3'h4):(2'h2)])});
  assign wire47 = {(+reg42),
                      ($signed(((reg37 || reg13) * (8'ha3))) + $signed($signed((wire46 ?
                          (8'hbd) : reg42))))};
endmodule
