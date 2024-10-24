module top
#(parameter param46 = (8'hb6), 
parameter param47 = ((!(((param46 * (8'h9c)) + (param46 ? param46 : param46)) + {{param46}})) ? {(!((+param46) ~^ (param46 ? param46 : param46))), ((+((8'h9d) && param46)) * {(~param46), (param46 || param46)})} : ((|(!param46)) | ((8'had) && ((param46 ? (8'hac) : param46) ? param46 : param46)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1ed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire45;
  wire signed [(4'hf):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  assign y = {wire45,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = (~({wire4} >>> $signed(((wire0 == (8'haf)) ?
                     (+(8'hb2)) : (wire2 < wire0)))));
  assign wire6 = $signed(wire5);
  assign wire7 = wire6;
  assign wire8 = $signed($unsigned($unsigned($unsigned((|wire2)))));
  assign wire9 = wire2[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      if (wire7)
        begin
          if (((wire4[(2'h3):(1'h0)] <<< $unsigned(($unsigned(wire4) ~^ (wire5 ?
                  wire7 : wire7)))) ?
              $unsigned(((~(&wire6)) + (8'hbc))) : {(~$signed((^~wire1))),
                  wire4[(2'h2):(1'h0)]}))
            begin
              reg10 <= ($signed((wire3 + ({wire4, wire0} ?
                  $signed((8'h9c)) : $signed(wire0)))) < $unsigned(($signed($signed(wire3)) == ($signed(wire3) | wire7))));
              reg11 <= (wire3[(1'h0):(1'h0)] >> wire8[(1'h0):(1'h0)]);
              reg12 <= $unsigned((8'hb5));
              reg13 <= {{{((wire7 ? wire7 : wire1) ^~ wire5),
                          $unsigned(((8'hb3) >> wire2))},
                      ($unsigned(wire8[(2'h3):(2'h2)]) >>> ((wire2 ?
                          (8'hb7) : wire9) | (8'h9f)))}};
              reg14 <= $signed($unsigned((~|wire6[(1'h1):(1'h0)])));
            end
          else
            begin
              reg10 <= reg14[(3'h4):(2'h3)];
            end
          reg15 <= wire0;
          reg16 <= {((~&{wire6}) >>> {(!reg14)}),
              $unsigned(($unsigned((reg11 ? wire6 : wire9)) ?
                  ({wire2} ?
                      $unsigned(wire6) : $unsigned(wire9)) : (wire0[(3'h4):(2'h3)] ?
                      wire6[(4'h8):(2'h3)] : reg13[(3'h4):(1'h0)])))};
          if ($signed((&$unsigned((reg13 ?
              (8'hbd) : (wire2 ? (7'h43) : wire2))))))
            begin
              reg17 <= reg15[(3'h6):(3'h6)];
              reg18 <= wire6[(4'h9):(4'h8)];
              reg19 <= (~reg18[(3'h6):(3'h6)]);
              reg20 <= (wire0[(1'h0):(1'h0)] | (wire6 <= wire7));
              reg21 <= $unsigned({reg13[(2'h3):(2'h2)]});
            end
          else
            begin
              reg17 <= ((+$unsigned($signed((reg13 ^ (8'ha5))))) != (!((reg18 <= $signed(wire2)) ^ ((wire1 && wire6) ?
                  {reg12, wire3} : wire5[(5'h11):(3'h5)]))));
              reg18 <= reg11[(3'h4):(1'h1)];
              reg19 <= $unsigned(((((-(7'h41)) ? (&reg18) : (-wire6)) ?
                      (!reg21[(1'h1):(1'h0)]) : (((8'hb6) ?
                          reg13 : wire8) == (reg14 <= wire6))) ?
                  (^~$signed($unsigned((7'h40)))) : $signed({wire3,
                      (wire8 > reg13)})));
            end
        end
      else
        begin
          if ((~|{$signed(reg16[(3'h7):(3'h4)])}))
            begin
              reg10 <= $signed(wire5);
              reg11 <= {reg14[(3'h6):(3'h6)]};
              reg12 <= (^(&($unsigned((reg16 ? wire7 : reg15)) >>> {(~^reg15),
                  {(8'hb8), reg20}})));
              reg13 <= reg17;
              reg14 <= {(^({$unsigned(wire3), reg20[(1'h0):(1'h0)]} ?
                      reg14 : ($unsigned(wire4) != (wire9 ? (8'ha3) : wire2)))),
                  $unsigned(reg18)};
            end
          else
            begin
              reg10 <= (wire2 ?
                  ($signed($signed({wire6})) ?
                      reg17[(2'h3):(1'h1)] : reg21) : ((~^(-(~^wire8))) ?
                      {((reg21 ? wire7 : reg11) ?
                              reg12[(5'h11):(4'hf)] : $unsigned((8'hb4)))} : reg12));
              reg11 <= (~^{(!(wire7 < wire0[(4'h9):(3'h5)]))});
              reg12 <= {(~|reg18[(1'h1):(1'h1)])};
              reg13 <= {$signed(wire1)};
            end
          reg15 <= (|(reg21 ?
              {reg16} : (({wire8} ?
                  (wire9 ?
                      reg13 : wire8) : $unsigned((8'hbf))) <<< $unsigned(wire3[(1'h1):(1'h0)]))));
          reg16 <= (^~reg12[(3'h7):(1'h0)]);
        end
      if ($unsigned($unsigned((&reg20[(1'h1):(1'h1)]))))
        begin
          reg22 <= ((~(($unsigned((8'ha9)) ? {reg16} : wire3[(1'h1):(1'h0)]) ?
                  (reg18 ?
                      $signed(wire9) : {wire3, reg12}) : ($unsigned(reg14) ?
                      (-reg16) : (reg21 ? reg17 : reg12)))) ?
              $unsigned((wire3 <<< {$unsigned(wire1)})) : {$unsigned($signed((reg17 ?
                      (8'ha6) : reg13))),
                  reg18[(1'h0):(1'h0)]});
          reg23 <= wire9;
          reg24 <= ($signed(wire5) - wire6[(3'h6):(1'h0)]);
        end
      else
        begin
          reg22 <= (!({{wire9[(4'hd):(3'h6)]}, (&reg11[(4'h8):(1'h1)])} ?
              reg14[(3'h6):(1'h1)] : ($signed($unsigned(wire6)) ?
                  $unsigned((reg10 * (8'had))) : {reg17})));
          reg23 <= {((reg16 ? reg11 : $signed((~wire6))) ?
                  $signed((^(reg16 * wire5))) : wire2)};
        end
    end
  always
    @(posedge clk) begin
      if ({$signed((8'hb6)), reg16})
        begin
          reg25 <= reg15;
          reg26 <= reg19;
          if ({($unsigned(wire6) << {($unsigned(reg17) <= $unsigned((8'hac))),
                  $signed((reg19 != reg21))})})
            begin
              reg27 <= (8'hbe);
            end
          else
            begin
              reg27 <= (!$unsigned((((^~reg12) ^~ $signed((7'h42))) ?
                  reg23 : reg19)));
              reg28 <= ((((|(reg20 ? reg12 : (8'hbb))) ?
                      (reg27 ?
                          (reg17 ?
                              reg15 : wire0) : (|wire4)) : reg10[(2'h2):(1'h0)]) ?
                  reg22[(3'h5):(1'h1)] : wire8[(2'h2):(1'h0)]) >>> $unsigned((wire0 == reg21)));
            end
          reg29 <= (reg10[(2'h2):(1'h1)] ? (~reg11) : (~&reg26));
          if ((reg24 != $unsigned(reg12[(4'hc):(4'h8)])))
            begin
              reg30 <= ($signed($unsigned({$unsigned(reg28),
                  wire6})) && reg12[(3'h6):(3'h6)]);
              reg31 <= reg17;
            end
          else
            begin
              reg30 <= $unsigned($signed((~|$unsigned((reg30 ^ (8'hb9))))));
            end
        end
      else
        begin
          reg25 <= (wire2[(1'h1):(1'h0)] ?
              $signed($unsigned(reg21)) : $signed($signed($unsigned((~reg27)))));
        end
      reg32 <= $unsigned((^(reg25 ?
          (!(wire3 != (7'h41))) : $unsigned(reg24[(1'h0):(1'h0)]))));
      reg33 <= $unsigned($signed($unsigned(reg31)));
      if (reg18[(1'h1):(1'h0)])
        begin
          reg34 <= ({wire5[(4'hf):(3'h4)],
                  (((wire9 ?
                      wire6 : reg22) + (8'hbc)) ^~ (reg20[(2'h2):(1'h0)] != reg33[(4'hc):(4'h8)]))} ?
              reg17 : $unsigned($unsigned(wire6)));
        end
      else
        begin
          reg34 <= $signed((wire6 ?
              $unsigned((^((8'hac) ? (8'ha8) : (8'hbf)))) : reg23));
          if (($signed({$signed($unsigned(wire0)),
              (+wire8)}) && {({(reg14 | reg34)} ?
                  $signed((wire5 ? wire3 : wire1)) : $signed($signed(wire4))),
              $unsigned($signed($signed(wire2)))}))
            begin
              reg35 <= {(((~&(reg28 ?
                      (8'ha7) : reg19)) >>> $signed((|reg19))) ^~ $signed((|(reg32 ?
                      reg32 : (8'hbe)))))};
              reg36 <= reg33;
              reg37 <= reg34;
            end
          else
            begin
              reg35 <= wire2[(2'h2):(1'h1)];
              reg36 <= $unsigned(wire8[(2'h3):(1'h0)]);
              reg37 <= wire7;
            end
          if (wire7)
            begin
              reg38 <= ((^~$unsigned({(reg23 * reg30), reg29})) >> reg22);
              reg39 <= wire6[(1'h1):(1'h0)];
              reg40 <= (~(8'hbc));
            end
          else
            begin
              reg38 <= (reg13[(4'ha):(4'h8)] ?
                  ($unsigned((~^{reg29,
                      (8'hbf)})) - $unsigned(((reg35 | reg11) << (8'hb4)))) : ($signed(reg39) ?
                      $signed({(&reg27),
                          {reg30, reg16}}) : (^(reg32[(2'h2):(2'h2)] ?
                          $signed(reg30) : $signed(reg39)))));
              reg39 <= reg10;
              reg40 <= $signed($unsigned(($signed((wire1 & wire9)) == ($signed(reg21) ?
                  (reg26 * wire7) : wire3))));
              reg41 <= ($signed($signed($unsigned(reg17[(3'h5):(2'h2)]))) ?
                  ((reg17 ?
                          reg18 : ((wire1 ? reg39 : reg14) ?
                              reg25[(4'h8):(1'h0)] : reg32)) ?
                      $unsigned(reg19[(3'h7):(3'h4)]) : wire7) : $unsigned((^~reg13[(4'hd):(4'hd)])));
              reg42 <= $unsigned(((reg17[(3'h4):(1'h0)] ?
                      {reg14[(3'h5):(3'h4)]} : reg30[(4'h8):(1'h1)]) ?
                  ((^~$unsigned((8'ha5))) ?
                      ((7'h40) >= ((8'hac) ? reg34 : wire3)) : {$signed(reg12),
                          (+(7'h43))}) : (reg32 > $unsigned($signed(reg22)))));
            end
          reg43 <= (8'hb6);
        end
      reg44 <= $unsigned((8'hbe));
    end
  assign wire45 = (~|(~&{((reg32 < (8'hba)) * reg29),
                      (reg38[(2'h3):(2'h3)] >>> $unsigned((8'h9c)))}));
endmodule
