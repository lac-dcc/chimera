module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire23;
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
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
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ({wire1, (-(~^(8'h9d)))})
        begin
          reg5 <= $unsigned(wire2[(4'hc):(3'h4)]);
          reg6 <= {{$signed($unsigned(wire4[(2'h2):(1'h1)]))},
              ((reg5[(2'h3):(2'h3)] > {$signed(wire1), wire1[(1'h1):(1'h0)]}) ?
                  (!(wire0 ?
                      (wire1 ?
                          wire4 : reg5) : (&(7'h43)))) : $unsigned($signed(wire3[(4'h9):(2'h2)])))};
          reg7 <= (wire2[(4'hd):(4'h9)] * (8'ha2));
        end
      else
        begin
          reg5 <= ($unsigned(wire0) ?
              (({reg7} <= reg5) ?
                  wire2[(2'h2):(1'h0)] : $signed($signed((&wire2)))) : $unsigned((8'hb2)));
          reg6 <= reg7[(2'h2):(1'h1)];
          if (wire1[(1'h1):(1'h1)])
            begin
              reg7 <= ($signed($signed(({wire2} <<< $signed(reg7)))) ?
                  wire3 : $signed($unsigned((((8'ha1) & reg7) - {reg6}))));
              reg8 <= $unsigned($signed($unsigned({$unsigned(wire2),
                  (reg5 & (8'ha3))})));
              reg9 <= ($unsigned({wire0[(3'h6):(2'h3)], reg5[(2'h3):(2'h2)]}) ?
                  (~&(reg5[(1'h0):(1'h0)] ?
                      wire0 : (reg6[(4'hc):(1'h0)] <<< (wire4 ?
                          wire1 : wire3)))) : ((($signed(wire0) ?
                          (^wire1) : reg7[(1'h0):(1'h0)]) ?
                      $signed($signed(reg7)) : wire3) + wire0));
            end
          else
            begin
              reg7 <= (&{reg7});
              reg8 <= ((^~wire2[(2'h3):(2'h3)]) >= wire1);
              reg9 <= {$signed(wire4)};
              reg10 <= (((($signed(wire4) ?
                      $signed((8'hbe)) : {(8'hbc), wire2}) & wire4) ?
                  reg8[(4'hf):(4'he)] : (!(|(reg8 ?
                      wire4 : (7'h42))))) ^ (|$unsigned((+(~wire2)))));
            end
          reg11 <= $unsigned(reg10[(3'h4):(1'h0)]);
        end
      reg12 <= ((~&$unsigned((+(wire2 + reg5)))) ?
          $signed(((wire3[(4'h8):(1'h1)] >> wire3[(4'hd):(1'h1)]) ^~ wire2[(3'h7):(3'h4)])) : $signed(($unsigned((reg7 <= reg11)) ?
              $unsigned($unsigned(wire4)) : $unsigned(reg7))));
      reg13 <= (+$unsigned((~(~|$unsigned(reg8)))));
      if ($signed($unsigned($signed($unsigned((~^wire2))))))
        begin
          if ({$unsigned($signed(reg12[(4'h9):(2'h2)])),
              ({({reg8} <<< $signed((7'h42)))} ?
                  $unsigned($signed((8'h9f))) : wire1[(3'h4):(1'h0)])})
            begin
              reg14 <= (+(&wire2[(5'h10):(4'hf)]));
              reg15 <= (reg9[(2'h2):(2'h2)] | (reg14 ?
                  (reg9 ?
                      $signed((|wire3)) : ($unsigned(reg7) ?
                          (reg13 & reg9) : (reg11 & (7'h42)))) : $unsigned(($unsigned(reg11) ?
                      ((8'h9f) ? reg6 : (8'ha3)) : ((8'hae) - reg13)))));
              reg16 <= $unsigned((!(|(8'hb8))));
              reg17 <= reg6;
              reg18 <= (((-(reg7[(2'h3):(1'h1)] ?
                      (reg5 <<< reg12) : $unsigned(reg6))) && reg17[(2'h2):(1'h1)]) ?
                  ((|(8'ha7)) != (8'hb5)) : {$signed(reg16[(3'h7):(3'h6)]),
                      (({(8'ha1), wire4} != (8'hbd)) ?
                          reg16[(1'h1):(1'h1)] : $unsigned(reg11))});
            end
          else
            begin
              reg14 <= reg16;
              reg15 <= $unsigned(wire3[(4'hd):(3'h5)]);
              reg16 <= reg6;
              reg17 <= $signed((|(8'ha0)));
              reg18 <= reg15[(2'h2):(2'h2)];
            end
          reg19 <= reg18[(3'h5):(3'h5)];
          reg20 <= {$signed($signed((reg18 ?
                  reg13[(5'h15):(4'hb)] : (reg7 >> reg18))))};
          reg21 <= reg10;
        end
      else
        begin
          reg14 <= {{reg21, (-$signed(reg21[(1'h1):(1'h1)]))}};
          if ((^~reg15[(3'h7):(3'h5)]))
            begin
              reg15 <= (|$signed(((-$unsigned(reg10)) > (reg10[(4'hd):(4'h9)] ?
                  ((8'ha9) ? reg17 : reg12) : (~|reg5)))));
              reg16 <= ((~|$unsigned($signed(reg9[(2'h3):(1'h1)]))) || $signed(($unsigned($signed(wire2)) || $unsigned(reg15[(2'h2):(2'h2)]))));
              reg17 <= reg11[(1'h1):(1'h0)];
              reg18 <= wire1;
            end
          else
            begin
              reg15 <= $signed($unsigned(($unsigned((reg18 ?
                  wire0 : reg16)) <= ($unsigned((8'ha2)) ?
                  $signed(reg16) : {reg20}))));
              reg16 <= reg8;
            end
          if (reg18[(3'h4):(2'h3)])
            begin
              reg19 <= (^~(-(reg6[(4'hb):(3'h6)] ?
                  (^$unsigned(reg8)) : (~&$unsigned(reg8)))));
            end
          else
            begin
              reg19 <= (^~$unsigned((wire3 ?
                  (!(wire3 < reg18)) : {(reg8 * reg11)})));
            end
        end
      reg22 <= (7'h44);
    end
  assign wire23 = ((^wire4[(3'h4):(2'h2)]) * ((({reg20} ?
                      reg9[(1'h0):(1'h0)] : (wire3 - reg19)) != reg7) >= wire1));
  assign wire24 = ($signed((((wire1 - wire2) < reg18[(1'h1):(1'h1)]) | ($unsigned(reg21) ?
                      $unsigned(reg9) : (+wire23)))) + ($signed(reg7) ~^ $unsigned(reg8)));
  assign wire25 = (8'ha1);
  assign wire26 = reg16[(3'h7):(1'h0)];
  always
    @(posedge clk) begin
      if ((($signed($signed(reg21[(2'h2):(2'h2)])) - {(((7'h40) ?
                  reg8 : reg22) ?
              reg13[(4'hc):(4'h8)] : (!reg10)),
          (reg20 < wire24[(2'h2):(2'h2)])}) <<< reg16))
        begin
          reg27 <= ((reg19[(3'h4):(3'h4)] ?
              $unsigned((reg6 ?
                  $signed(reg10) : reg9[(2'h3):(1'h0)])) : (~^($signed((8'h9d)) != $unsigned(reg10)))) <<< $unsigned(reg15));
          reg28 <= ($signed(reg20[(3'h4):(3'h4)]) ?
              $signed({((wire3 & reg20) ?
                      {reg6} : (reg6 << reg11))}) : (7'h44));
        end
      else
        begin
          reg27 <= (8'ha1);
          reg28 <= ({((&$signed(reg6)) ?
                  reg13[(3'h7):(2'h2)] : (~wire3[(4'he):(3'h4)]))} > $unsigned((wire25[(2'h3):(2'h3)] ?
              $signed(reg5[(2'h2):(2'h2)]) : reg16)));
          if ((~(reg19[(4'hd):(3'h4)] ?
              $signed(wire0[(2'h3):(2'h2)]) : reg19[(4'hf):(4'hc)])))
            begin
              reg29 <= reg13;
              reg30 <= (wire2 ?
                  $unsigned($unsigned((^$unsigned(reg14)))) : (reg19[(4'he):(3'h6)] ?
                      ($unsigned($signed(wire26)) | {(reg18 && reg8),
                          {reg17}}) : reg21[(3'h7):(1'h1)]));
            end
          else
            begin
              reg29 <= (wire24 << $unsigned((-{(+(8'ha9))})));
            end
          reg31 <= ({(|((reg6 ? (8'ha9) : (8'ha6)) ?
                  reg11 : reg13[(5'h11):(4'hf)])),
              (8'hbe)} <= reg11);
        end
      reg32 <= {reg19[(4'he):(2'h3)]};
      reg33 <= {$unsigned(wire1)};
    end
endmodule
