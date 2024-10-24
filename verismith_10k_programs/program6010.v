module top
#(parameter param33 = ({(+{(+(8'hb3))}), ((((8'hbf) ? (8'hb7) : (8'hbd)) < ((8'hb3) * (8'ha2))) ? {((8'hac) ? (8'h9e) : (8'hb6))} : (!{(7'h42), (8'hb1)}))} ^ (&(&({(8'ha5)} >>> {(8'hbb)})))), 
parameter param34 = param33)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(2'h2):(1'h0)] reg6 = (1'h0);
  assign y = {wire14,
                 wire5,
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
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire1;
  always
    @(posedge clk) begin
      reg6 <= $signed($unsigned((wire5 - (|(~wire1)))));
      reg7 <= $unsigned((wire4[(4'he):(4'ha)] ?
          (((reg6 ? wire5 : wire0) ?
              $unsigned(wire0) : $signed(wire0)) << ((!wire0) || (wire0 ?
              wire2 : wire5))) : ($signed($unsigned(wire3)) * $unsigned({(8'ha0)}))));
      if ($signed((($signed(reg6) ?
              (7'h44) : ($signed(wire3) << (wire0 ? reg7 : (8'hac)))) ?
          $signed($unsigned((^wire5))) : $signed({(|(8'hba)),
              (wire2 | reg6)}))))
        begin
          reg8 <= reg7[(2'h2):(2'h2)];
          reg9 <= (-$unsigned(wire3[(3'h6):(3'h5)]));
          reg10 <= wire2[(4'h9):(3'h7)];
          reg11 <= ($signed($unsigned($unsigned({(8'hba), reg8}))) ?
              reg10[(3'h5):(3'h5)] : wire2);
        end
      else
        begin
          reg8 <= (^(^~(({reg11, wire0} << wire5[(3'h6):(1'h0)]) ?
              $signed($unsigned(wire1)) : reg6)));
          reg9 <= (reg11[(3'h4):(2'h2)] & $signed((^~({reg6} >> (~|reg9)))));
        end
      reg12 <= (~|wire5[(4'he):(4'hc)]);
      reg13 <= $signed((reg12 ^~ reg8));
    end
  assign wire14 = $signed((!(^((reg9 ? wire5 : (8'ha9)) == reg12))));
  always
    @(posedge clk) begin
      if (reg7)
        begin
          reg15 <= (($unsigned((^~reg10[(4'ha):(1'h0)])) ?
              $unsigned($signed((wire5 < wire14))) : (8'had)) >> {(&$signed(reg6))});
          reg16 <= ($signed(((((7'h41) ~^ reg8) + (wire5 >> reg13)) ?
              reg9 : $signed({(8'ha4)}))) >> reg7[(4'hc):(2'h3)]);
          reg17 <= ($signed(wire3) != reg9);
          reg18 <= ({wire0, ({wire4} ? reg6 : wire4[(1'h1):(1'h0)])} < wire1);
          reg19 <= {$unsigned((wire5 > (reg10[(5'h12):(4'h8)] - (reg11 && reg16))))};
        end
      else
        begin
          reg15 <= (reg10[(4'h8):(4'h8)] ?
              reg19[(2'h3):(2'h3)] : (wire3 != (&reg9[(3'h6):(2'h3)])));
          reg16 <= reg18[(1'h0):(1'h0)];
          if ($signed(($unsigned((&(reg16 ? (8'hab) : reg18))) ?
              reg19[(2'h3):(2'h3)] : reg15[(1'h1):(1'h0)])))
            begin
              reg17 <= $signed(reg13);
            end
          else
            begin
              reg17 <= (reg15[(4'hc):(4'h8)] && reg19[(1'h1):(1'h0)]);
              reg18 <= (($unsigned(reg7) ?
                      reg10[(3'h4):(2'h3)] : (~^(reg17 ?
                          {wire2, reg19} : (!wire4)))) ?
                  $unsigned(($signed(reg7) >> $signed((8'hae)))) : ((((!wire4) ?
                          (reg6 ? reg16 : reg8) : $signed(wire4)) ?
                      reg17 : wire14[(2'h2):(1'h1)]) != {$signed((wire1 ^~ reg17)),
                      wire3}));
              reg19 <= (^(reg12[(4'hc):(3'h7)] ?
                  (({wire0, reg15} + (wire14 ? reg13 : (8'hac))) ?
                      ($signed(wire4) == $signed(wire2)) : ((|(7'h42)) ?
                          (reg11 | reg15) : (wire1 ?
                              reg17 : wire1))) : (8'ha4)));
            end
          if ((~^$signed((({reg13} ? (-reg11) : (reg17 ? reg15 : reg9)) ?
              ((wire4 << reg6) == (^wire5)) : (|{(8'hba), wire0})))))
            begin
              reg20 <= {($signed($signed({reg17, wire3})) >>> reg7)};
              reg21 <= reg8;
              reg22 <= ((reg16[(2'h3):(2'h3)] > (8'hbd)) ~^ $unsigned($unsigned(reg20)));
            end
          else
            begin
              reg20 <= (8'h9c);
              reg21 <= (~|(~((8'haf) >>> $signed((wire1 ? (7'h43) : reg11)))));
              reg22 <= (($unsigned(($signed(reg16) ?
                      {reg17, (8'hbf)} : {(8'hb8), reg16})) == (8'hb8)) ?
                  (~reg7[(2'h3):(1'h0)]) : ((^(wire4[(4'hb):(4'h8)] ^ reg12[(2'h3):(1'h0)])) ?
                      $unsigned(((wire1 ?
                          wire5 : (8'hac)) >> (|reg18))) : $unsigned(({reg22,
                              reg12} ?
                          {wire3} : (reg17 ? reg17 : reg10)))));
              reg23 <= reg12;
            end
          reg24 <= $signed(($unsigned($unsigned(reg20[(4'ha):(4'h9)])) ?
              (8'hba) : reg20));
        end
      if ({reg23[(3'h5):(2'h3)]})
        begin
          reg25 <= (7'h44);
          if ({(wire4[(2'h2):(1'h0)] ?
                  (^~reg24) : $unsigned($unsigned(reg11[(2'h3):(1'h1)]))),
              $signed((^~($signed(reg18) ~^ reg24[(3'h5):(1'h1)])))})
            begin
              reg26 <= wire2[(2'h3):(1'h1)];
            end
          else
            begin
              reg26 <= {(reg21[(4'hc):(4'ha)] ?
                      reg20[(4'h8):(3'h6)] : ((+(reg21 ?
                          (8'hb5) : (8'hae))) - reg6))};
              reg27 <= reg10[(3'h5):(1'h0)];
              reg28 <= {(reg24 - $unsigned($signed($signed(reg22))))};
              reg29 <= {reg17,
                  $signed((((reg6 ? wire5 : (8'hbb)) ?
                          (reg7 ? reg12 : (8'hab)) : (-reg7)) ?
                      {$unsigned(wire3),
                          $unsigned(reg10)} : reg27[(4'hb):(3'h5)]))};
            end
        end
      else
        begin
          reg25 <= ($signed($signed(({reg27, wire5} ?
              $unsigned(reg11) : (|reg23)))) && reg12[(4'h8):(2'h3)]);
          reg26 <= ((reg7 ^~ reg23) ?
              {(7'h40)} : $unsigned((reg8 ?
                  {(reg11 ? reg13 : reg24)} : (reg17[(1'h1):(1'h1)] ?
                      (&reg10) : (reg10 ? wire1 : wire2)))));
          reg27 <= $signed({reg28});
          reg28 <= (reg16 ?
              reg22[(4'h9):(4'h9)] : {($unsigned($signed(reg29)) >> wire4[(2'h3):(2'h2)]),
                  (((reg15 ? wire3 : (8'hbb)) ?
                      (reg20 <<< wire14) : reg29[(1'h1):(1'h0)]) || reg7)});
        end
      reg30 <= (($signed((|(wire5 != reg26))) ?
              (8'hb3) : ($unsigned(reg9) >>> ($signed((8'hbb)) >= reg29))) ?
          (reg19[(3'h4):(3'h4)] > (8'hb9)) : {(8'hbd)});
      reg31 <= ((reg13[(2'h2):(1'h0)] ?
              $signed(((reg23 >= wire3) <= wire3[(3'h7):(1'h0)])) : $signed({reg27[(1'h0):(1'h0)],
                  (reg15 - (8'ha4))})) ?
          $unsigned($unsigned({(~^reg8)})) : reg26);
      reg32 <= $unsigned((^reg31[(3'h5):(1'h0)]));
    end
endmodule
