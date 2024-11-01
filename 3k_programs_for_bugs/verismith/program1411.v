module top
#(parameter param59 = ((~|((((8'ha7) ? (8'hab) : (8'hbd)) < (!(7'h42))) && ({(8'hbf), (8'hb5)} ? (^~(8'hbd)) : (-(8'ha3))))) | (-((((8'hac) - (8'ha4)) ? ((8'hb9) ? (8'had) : (8'h9e)) : ((8'hb0) ? (8'h9f) : (8'hb1))) & {(&(8'ha5))}))), 
parameter param60 = (~&(({(param59 || param59), (8'hb0)} ? param59 : (|{param59})) ? (({param59} ? (^param59) : param59) ? (&(param59 ? param59 : param59)) : ((|param59) != {param59, param59})) : (((param59 >= param59) ? (!param59) : {param59}) & {{param59, (8'hb0)}}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1c7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire56;
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire56,
                 reg58,
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
                 (1'h0)};
  assign wire5 = $unsigned(((({wire4} ?
                     (~^wire2) : (8'hb5)) || (&$signed(wire3))) >>> ((wire1[(3'h6):(3'h6)] ?
                         wire3 : (&wire2)) ?
                     wire3[(2'h3):(1'h0)] : wire0)));
  assign wire6 = $signed((wire0 >> wire4[(4'h9):(1'h0)]));
  assign wire7 = wire6;
  always
    @(posedge clk) begin
      reg8 <= ((($unsigned($unsigned(wire0)) ?
          (~((7'h40) ? wire6 : wire6)) : $unsigned((wire0 || wire4))) & (wire5 ?
          (!(wire4 ? wire7 : (8'hbc))) : $signed((wire7 ?
              wire1 : (8'h9e))))) < (|(!((&wire5) ?
          {wire2, wire1} : $unsigned(wire2)))));
      if ((($unsigned(($signed(wire6) && $unsigned(wire3))) >>> (wire3[(1'h0):(1'h0)] ?
          ((wire6 << wire7) ?
              wire5 : (wire3 ? wire7 : wire0)) : ($unsigned(wire7) ?
              wire5[(1'h0):(1'h0)] : wire1[(4'h9):(3'h7)]))) * $signed($signed($unsigned((~wire6))))))
        begin
          reg9 <= wire7;
          reg10 <= $unsigned($unsigned(($signed((wire2 ~^ wire3)) ~^ wire1)));
          reg11 <= {({($signed(wire7) ?
                      reg10[(3'h7):(1'h0)] : wire3)} & ((~|wire4[(4'hb):(3'h5)]) ?
                  reg8[(4'h8):(3'h4)] : (8'haf)))};
        end
      else
        begin
          reg9 <= ($unsigned(wire4) ?
              reg8[(3'h7):(3'h7)] : (^$signed($unsigned((&wire3)))));
          reg10 <= $unsigned($signed(({(~^(8'ha4)), (-reg11)} ?
              (^~$signed((7'h41))) : wire6[(3'h6):(1'h1)])));
          if (($signed(((wire0 ? reg8[(4'ha):(3'h4)] : (reg9 * wire1)) ?
                  $signed((wire1 << wire5)) : (~&$unsigned(reg10)))) ?
              (^$unsigned(({wire3} ?
                  (wire3 ?
                      wire0 : wire1) : ((8'ha9) == wire7)))) : $signed((((-wire7) ?
                      (~wire3) : $signed((8'ha6))) ?
                  (+(wire7 - wire1)) : {{wire2}, (reg11 ? reg9 : wire6)}))))
            begin
              reg11 <= ((wire4 ?
                  ((&wire3) ~^ {(wire7 && wire4)}) : reg11) ^ ({(wire6 <= (~^wire4)),
                      ((wire0 <= reg10) == $signed(wire7))} ?
                  wire6 : ((wire6 ?
                      reg8 : $unsigned(reg11)) & ($unsigned(wire1) | wire2))));
              reg12 <= wire5;
            end
          else
            begin
              reg11 <= $unsigned(wire0);
              reg12 <= (reg9 | wire6);
              reg13 <= {$unsigned(wire6),
                  $signed((reg10[(2'h2):(2'h2)] ?
                      reg8 : ((wire0 != wire6) ~^ $unsigned(wire6))))};
            end
        end
      if ($signed(reg10[(3'h6):(3'h4)]))
        begin
          reg14 <= ((((8'hb6) ~^ wire1[(4'h8):(3'h7)]) ?
              (wire3 > $unsigned(((8'ha5) ?
                  wire7 : reg13))) : wire6[(3'h4):(3'h4)]) * wire1);
          if ((-wire2[(4'hb):(4'h8)]))
            begin
              reg15 <= $signed((^wire3[(1'h0):(1'h0)]));
              reg16 <= reg14[(2'h3):(2'h3)];
              reg17 <= (($unsigned((8'hbd)) ?
                  wire5[(1'h0):(1'h0)] : {wire7}) <<< reg15[(2'h3):(2'h3)]);
            end
          else
            begin
              reg15 <= (^~(((!wire4) ?
                  reg12[(1'h1):(1'h1)] : ({(7'h44)} ^ $signed(reg13))) >= reg15));
              reg16 <= $unsigned($signed(reg17));
              reg17 <= (reg10 >> (reg12[(2'h2):(2'h2)] ?
                  wire1 : $signed(wire7[(3'h5):(3'h5)])));
              reg18 <= ((~&(reg15[(3'h6):(3'h5)] << wire0)) ?
                  (wire6 ?
                      (((wire7 > (8'hb0)) ^~ $signed(reg10)) ?
                          ((wire5 ? reg10 : (8'hb3)) ?
                              (reg12 ?
                                  wire5 : wire4) : reg8[(4'hc):(4'ha)]) : $signed((wire7 && reg14))) : wire3[(1'h1):(1'h1)]) : {(reg10[(4'hc):(3'h4)] ?
                          ((reg9 >>> reg14) | (reg10 ~^ wire3)) : $signed(wire4)),
                      wire2[(5'h10):(4'ha)]});
              reg19 <= reg15;
            end
          reg20 <= wire2;
          reg21 <= ({reg8} ?
              (reg8[(2'h3):(2'h2)] ?
                  reg11[(2'h2):(1'h1)] : reg15[(3'h4):(2'h2)]) : $unsigned($signed($signed($signed(reg20)))));
        end
      else
        begin
          reg14 <= (reg12[(1'h1):(1'h1)] >>> reg21[(2'h2):(1'h1)]);
        end
      if (reg18)
        begin
          if ((&(&{reg18[(5'h13):(5'h12)]})))
            begin
              reg22 <= $signed((~reg8[(4'hc):(4'hc)]));
              reg23 <= (&reg14[(4'hd):(1'h0)]);
            end
          else
            begin
              reg22 <= $signed(((8'hb9) ?
                  ($signed($unsigned(reg9)) ?
                      (&$signed((8'ha8))) : reg18) : ((&wire3[(3'h5):(1'h0)]) ?
                      $signed(reg16[(3'h4):(3'h4)]) : ((reg21 ?
                              (8'ha1) : reg8) ?
                          reg23[(1'h0):(1'h0)] : ((8'hbb) ? wire2 : wire6)))));
              reg23 <= $signed((reg12 | {(~$signed(reg13)),
                  $unsigned((wire4 ? wire3 : (8'h9d)))}));
              reg24 <= (!reg17[(4'hd):(4'h8)]);
            end
          reg25 <= (($unsigned($signed((^~reg22))) ?
                  wire7[(3'h4):(1'h0)] : $unsigned(wire6[(3'h4):(2'h3)])) ?
              wire5 : $unsigned(($unsigned((~reg10)) ?
                  (!reg8) : (-(wire5 ? wire6 : reg12)))));
        end
      else
        begin
          reg22 <= reg21[(4'hd):(2'h2)];
          reg23 <= (-(~&({$signed(wire6), (~|reg10)} ?
              (wire5[(2'h2):(2'h2)] ?
                  ((8'hb7) ? wire5 : wire7) : (reg13 ?
                      (8'hb5) : wire6)) : $signed((|(8'hb8))))));
          if (((^~(~|(reg16 ? (reg9 ? reg13 : reg25) : $unsigned(reg12)))) ?
              wire4[(4'hb):(3'h4)] : reg20[(4'he):(3'h6)]))
            begin
              reg24 <= wire2;
              reg25 <= (8'hb6);
              reg26 <= $signed(((8'hb5) ?
                  reg9[(2'h2):(2'h2)] : {reg18, wire6}));
              reg27 <= ((wire7[(5'h14):(4'he)] <<< $unsigned({(reg8 ?
                      wire6 : reg22),
                  $signed(reg20)})) ^~ (~^{{$unsigned(reg10)},
                  (~|reg13[(3'h7):(3'h7)])}));
            end
          else
            begin
              reg24 <= $signed($unsigned(reg25));
              reg25 <= {(reg14[(2'h3):(1'h1)] ?
                      (-(-{reg18,
                          wire4})) : $unsigned($unsigned($signed(reg26)))),
                  (8'ha6)};
            end
          reg28 <= reg19[(1'h0):(1'h0)];
          reg29 <= reg10;
        end
      reg30 <= ({wire4} ?
          (((~&(reg12 ?
              reg14 : reg13)) | wire3[(3'h4):(3'h4)]) >> (($signed(reg14) <<< ((8'hae) ?
                  reg19 : reg17)) ?
              (wire3 ?
                  (reg25 ?
                      reg13 : reg27) : reg16) : reg21[(1'h0):(1'h0)])) : $unsigned(reg24[(2'h3):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg31 <= (&{(+($signed(wire6) << (8'ha3)))});
    end
  always
    @(posedge clk) begin
      reg32 <= (-reg29);
      reg33 <= (reg32 ?
          (~|(({(8'hb8)} * {reg11}) >> {$signed(reg28),
              $signed(reg20)})) : (reg14[(4'hd):(4'h9)] <= $signed((~^reg13[(2'h2):(1'h1)]))));
      reg34 <= ((((wire1 ? (reg32 <<< reg21) : $signed(reg11)) ?
              reg19 : reg25) ?
          ($unsigned((reg20 ?
              wire7 : (8'hb6))) < ((reg20 <= reg27) ^ reg16)) : (~&wire0[(3'h5):(3'h5)])) ^~ (((~^(+reg10)) ?
          reg10[(4'h9):(4'h8)] : wire0[(3'h4):(3'h4)]) ^~ $signed({reg32[(3'h6):(3'h6)]})));
    end
  assign wire35 = wire7;
  assign wire36 = (&reg30[(4'hd):(3'h5)]);
  assign wire37 = wire35[(1'h1):(1'h0)];
  assign wire38 = $signed((wire37 ?
                      (reg13[(4'h8):(2'h3)] ?
                          $signed((reg14 ?
                              wire35 : reg20)) : (reg30[(1'h0):(1'h0)] ?
                              reg24 : $unsigned(reg24))) : (~^(8'hb1))));
  assign wire39 = $unsigned(({reg18,
                          (wire5[(1'h1):(1'h1)] ~^ $signed((8'h9f)))} ?
                      (wire3[(2'h3):(1'h1)] ?
                          reg28[(3'h5):(3'h4)] : (-$unsigned(reg31))) : ((reg9 << (reg10 >> reg26)) | ({wire36,
                          reg27} & $unsigned(reg31)))));
  assign wire40 = ((~|$unsigned({(wire0 ? reg24 : reg19),
                      $unsigned(wire35)})) + (+$signed(reg15[(3'h5):(2'h2)])));
  assign wire41 = (($signed((((8'had) >>> wire37) ?
                          reg26 : (wire36 ? wire38 : reg11))) ?
                      $unsigned(reg20[(3'h6):(3'h6)]) : ($signed($unsigned((8'hb5))) ?
                          (~&{wire37,
                              reg10}) : reg17[(1'h1):(1'h0)])) == (!$signed(reg27)));
  module42 #() modinst57 (wire56, clk, reg34, wire36, reg20, reg29);
  always
    @(posedge clk) begin
      reg58 <= $signed(reg16);
    end
endmodule

module module42
#(parameter param54 = ((!((((8'ha2) != (8'ha2)) ? (&(8'ha0)) : (~^(8'ha4))) < (((8'ha6) ? (8'hbe) : (8'hb5)) ? ((8'hb7) << (8'ha6)) : (8'hbc)))) >>> ((^(~((8'ha6) == (8'ha7)))) ? (({(7'h42), (8'ha8)} ? ((8'h9d) ? (8'hbb) : (8'hb8)) : ((8'hb0) ? (8'ha7) : (8'hb1))) ? (((8'hbf) ? (8'hbc) : (8'had)) >>> {(8'hbc), (8'ha7)}) : ({(8'hbd), (8'hba)} ? (+(8'ha6)) : {(8'haa)})) : ((8'ha4) ? {(~&(8'h9d))} : (((8'hb5) ? (8'ha4) : (8'ha9)) ? {(7'h44)} : ((8'ha6) ? (7'h43) : (8'haf)))))), 
parameter param55 = (^(-(8'hb9))))
(y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire46;
  input wire [(5'h11):(1'h0)] wire45;
  input wire [(4'ha):(1'h0)] wire44;
  input wire [(4'ha):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire53;
  wire [(3'h4):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire51;
  wire signed [(3'h4):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire47;
  assign y = {wire53, wire52, wire51, wire50, wire49, wire48, wire47, (1'h0)};
  assign wire47 = $signed((wire45 ?
                      (wire45 || $signed((~&wire45))) : wire46[(2'h2):(1'h0)]));
  assign wire48 = (($signed((-$unsigned(wire43))) - wire43) && wire46);
  assign wire49 = $unsigned(wire43);
  assign wire50 = (~((8'ha6) ?
                      (!wire45[(5'h10):(3'h7)]) : wire47[(2'h3):(2'h3)]));
  assign wire51 = (!{(($unsigned(wire49) - (wire44 <= wire50)) ?
                          ((7'h43) < (wire43 ^~ wire45)) : $signed((^~wire45)))});
  assign wire52 = ($signed(($signed((wire50 * wire50)) ?
                      (~^$unsigned(wire49)) : ((|wire51) != $unsigned(wire48)))) ^~ ({((~&wire47) ?
                              $signed(wire43) : wire50)} ?
                      (wire49[(3'h5):(1'h1)] <= (-(wire46 ~^ wire44))) : wire49));
  assign wire53 = ((wire45[(4'hb):(4'h9)] ?
                          wire52 : (~^(wire47[(1'h0):(1'h0)] ?
                              $unsigned(wire47) : (wire46 >>> wire50)))) ?
                      ((8'hb8) << $signed($signed((~^wire43)))) : {((!(8'ha5)) < wire52),
                          $unsigned((8'ha1))});
endmodule
