module top
#(parameter param35 = {({(((8'hb3) ^ (8'hb1)) ? ((8'hb2) == (8'hb5)) : {(8'hb3)}), (((8'hb0) ? (8'hac) : (8'hb0)) ? ((8'had) ? (8'hbb) : (8'hab)) : ((8'ha2) << (8'ha9)))} ? (8'hba) : ((((8'hbe) ? (8'hb4) : (8'hbc)) ^ (~|(8'ha2))) ~^ {((8'hb3) ? (8'had) : (8'hbc)), (~(7'h42))}))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h17c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg6 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire8,
                 wire7,
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
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg6,
                 (1'h0)};
  assign wire5 = ({wire0[(2'h3):(2'h2)]} ?
                     wire1[(2'h2):(2'h2)] : $unsigned((~^$unsigned(wire4))));
  always
    @(posedge clk) begin
      reg6 <= (($signed(wire3[(2'h2):(2'h2)]) ^ $unsigned($signed(wire0[(3'h4):(2'h3)]))) || (|(wire5 && wire2)));
    end
  assign wire7 = (|(~wire4));
  assign wire8 = (~&wire0);
  always
    @(posedge clk) begin
      reg9 <= wire3;
    end
  always
    @(posedge clk) begin
      reg10 <= wire1;
      if (($signed($signed($signed(wire4[(1'h1):(1'h1)]))) ?
          $signed($unsigned(((-wire4) | $signed(wire3)))) : $unsigned((reg10[(3'h7):(3'h6)] ?
              wire2[(4'ha):(4'h8)] : wire0))))
        begin
          reg11 <= $signed($signed(((8'hb4) ? wire1[(1'h1):(1'h1)] : wire3)));
          reg12 <= (7'h42);
          reg13 <= reg10;
          if ($unsigned($signed(({(reg11 ? reg13 : reg11),
              $unsigned(wire1)} > (!wire1[(3'h6):(2'h3)])))))
            begin
              reg14 <= (+$signed(wire5));
              reg15 <= $signed((8'hbd));
              reg16 <= $signed((~|{(~^reg10)}));
              reg17 <= $unsigned(($unsigned((!(8'hb1))) <= (!reg9[(3'h7):(2'h2)])));
            end
          else
            begin
              reg14 <= (wire1[(4'h8):(3'h6)] ?
                  (($unsigned(reg9[(1'h0):(1'h0)]) ?
                      ($signed(wire8) ?
                          (reg6 ^ wire7) : wire8[(1'h0):(1'h0)]) : {$signed(reg17),
                          wire3}) >= (~&$signed((wire8 ?
                      reg9 : reg14)))) : (8'ha4));
              reg15 <= (wire5 ?
                  (-wire8[(2'h2):(1'h0)]) : $signed((wire1[(1'h0):(1'h0)] ?
                      (!$unsigned(reg15)) : wire0)));
              reg16 <= $signed($signed($signed(((reg16 ^~ (7'h44)) | {(8'ha8),
                  wire5}))));
            end
          if (((reg10[(3'h6):(2'h3)] ?
              (!wire3) : (wire3[(2'h2):(1'h1)] & {(-reg11),
                  (wire1 ?
                      wire1 : wire7)})) ^ $signed((wire5 << (wire7 | (reg11 ?
              reg12 : reg10))))))
            begin
              reg18 <= (({$unsigned(wire8)} ?
                      (-reg12) : $unsigned($unsigned((reg10 ?
                          (8'haf) : reg9)))) ?
                  reg13 : (|reg12[(4'hf):(3'h5)]));
              reg19 <= $signed($unsigned(reg6[(1'h1):(1'h0)]));
            end
          else
            begin
              reg18 <= (reg15[(4'hb):(4'ha)] ?
                  $signed((~^($signed(wire0) < $unsigned(wire0)))) : ($unsigned((~&$unsigned(reg11))) || $signed($signed(reg13[(4'hf):(3'h7)]))));
              reg19 <= wire1[(3'h6):(3'h5)];
              reg20 <= {reg6};
              reg21 <= ($signed(($unsigned((wire1 ? reg18 : (8'hae))) ?
                  $signed((wire0 ? reg6 : wire0)) : (wire3 & ((8'hb7) ?
                      reg17 : wire0)))) == reg14);
              reg22 <= ($unsigned($signed($signed(reg14[(2'h2):(2'h2)]))) - $signed($unsigned(wire5[(2'h2):(2'h2)])));
            end
        end
      else
        begin
          reg11 <= {reg20,
              ((wire7[(1'h0):(1'h0)] ?
                  (wire0 ?
                      (reg13 ?
                          reg22 : (8'h9c)) : (!reg17)) : reg18[(3'h5):(2'h2)]) || wire2)};
          reg12 <= (($unsigned((&(wire4 ? wire5 : reg22))) ?
              reg17 : wire2[(1'h0):(1'h0)]) & (($signed((reg15 || wire7)) * (~|(wire8 ?
                  reg6 : wire0))) ?
              ((-(reg9 ? wire3 : reg12)) ?
                  $unsigned($unsigned(reg19)) : ({reg20} ?
                      ((8'had) ? wire3 : reg12) : $unsigned(reg16))) : {wire2,
                  (8'ha4)}));
          reg13 <= reg13[(4'hf):(2'h3)];
        end
      if ((reg20[(4'ha):(1'h0)] ?
          $unsigned((~^$signed($unsigned(reg15)))) : {(!$unsigned((reg13 != reg16)))}))
        begin
          if (reg9)
            begin
              reg23 <= (wire7[(2'h2):(1'h1)] >>> (!(wire3[(1'h1):(1'h1)] ?
                  {(reg16 ? wire4 : reg15), (!reg11)} : $signed((reg22 ?
                      reg12 : (7'h40))))));
              reg24 <= $unsigned((reg14 ?
                  ($unsigned($unsigned(reg19)) || reg19[(4'h9):(1'h0)]) : (~|($unsigned(reg23) ?
                      (~reg15) : wire1))));
              reg25 <= $unsigned(({($signed(reg14) - (|wire8))} <= (8'hb0)));
              reg26 <= $unsigned($signed(reg24));
              reg27 <= (~|(~|$unsigned(reg15)));
            end
          else
            begin
              reg23 <= ((-((reg18 ^ (wire8 ? wire7 : (8'ha6))) ?
                  reg21[(1'h1):(1'h1)] : (^~reg18))) - $signed(reg24[(4'h9):(1'h1)]));
            end
          if (reg25)
            begin
              reg28 <= $signed(wire0[(1'h1):(1'h0)]);
              reg29 <= $signed(($signed($signed({reg25,
                  reg6})) - (reg26[(3'h4):(2'h3)] >= reg26[(3'h6):(2'h2)])));
            end
          else
            begin
              reg28 <= (reg24[(3'h6):(1'h1)] - reg26[(2'h3):(2'h2)]);
              reg29 <= $signed((~&(reg23 & $signed((reg11 ^~ (8'hb0))))));
              reg30 <= $signed(({((reg24 ? reg26 : reg28) <<< reg10),
                  $unsigned($signed((8'hb6)))} - $signed($signed((wire8 ^~ (8'hb5))))));
            end
          reg31 <= wire2[(4'h9):(4'h8)];
        end
      else
        begin
          reg23 <= $unsigned(reg30);
          reg24 <= $signed((reg24 ?
              $signed(reg10[(2'h3):(1'h0)]) : $signed(((~&wire8) && (reg29 - wire4)))));
          reg25 <= ($signed($unsigned(((~|(8'had)) ?
                  (reg29 ? reg30 : wire0) : reg29[(4'h9):(4'h8)]))) ?
              $signed((((reg30 ?
                  wire5 : reg12) ^~ $unsigned(reg24)) == $unsigned((~&reg31)))) : reg24);
          if ({wire2[(4'hc):(2'h3)]})
            begin
              reg26 <= (({(!$signed(wire8))} == $unsigned($unsigned({reg26}))) && ((reg14[(4'h9):(1'h1)] << $signed((|wire5))) <<< $unsigned({$unsigned(reg18)})));
              reg27 <= (wire5 ?
                  $unsigned(reg29[(2'h2):(1'h0)]) : ((({wire3, reg11} ?
                              (reg13 ? reg29 : wire4) : (~^reg28)) ?
                          ((~&(8'hbf)) ?
                              reg28 : $unsigned(reg20)) : $unsigned({wire1})) ?
                      ((^$unsigned(reg29)) ?
                          ($signed(reg24) ^ $signed(reg13)) : reg18[(3'h6):(3'h5)]) : {$unsigned(wire4[(4'hb):(2'h2)]),
                          ($unsigned(wire4) ? $signed(reg25) : (+reg23))}));
              reg28 <= (reg27[(4'h8):(3'h7)] ?
                  (8'hae) : {$signed(($unsigned(wire3) * (reg6 > reg11)))});
            end
          else
            begin
              reg26 <= ($signed({{$unsigned(wire2)}, (~^$unsigned(wire3))}) ?
                  (8'had) : (reg26 * {{(wire7 << reg25), $signed(wire2)}}));
              reg27 <= $unsigned(reg11);
              reg28 <= (reg26 ?
                  $signed(wire4) : $signed(($signed(reg11) <= (~&reg22[(4'hf):(4'he)]))));
              reg29 <= reg6[(1'h1):(1'h1)];
              reg30 <= (~&(wire8[(3'h6):(1'h1)] ? reg25 : reg28));
            end
          reg31 <= $signed(wire5[(2'h3):(1'h1)]);
        end
    end
  always
    @(posedge clk) begin
      reg32 <= (8'hb1);
    end
  assign wire33 = $unsigned((+($unsigned((wire4 ? reg6 : wire8)) > ((reg18 ?
                      (8'had) : reg24) + $signed((7'h43))))));
  assign wire34 = ($unsigned(reg11[(1'h0):(1'h0)]) ?
                      ((($signed(wire5) - $unsigned((8'hb1))) && (((8'ha7) != wire3) ?
                              reg6 : $signed(reg9))) ?
                          $signed((!(reg20 < reg25))) : (reg26[(3'h4):(1'h0)] ?
                              $signed($signed(reg13)) : $unsigned($signed(reg20)))) : reg28[(4'h9):(1'h1)]);
endmodule
